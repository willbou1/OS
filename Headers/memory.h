#ifndef MEMORY_H
#define MEMORY_H

#include "Headers/types.h"
#include "Headers/debug.h"
#include "Headers/interrupts.h"
#include "Headers/multiboot.h"

#define VIRTUAL_KERNEL_OFFSET 0xC0000000

#define PAGE_SIZE (uint32_t)(4 * 1024) //4KB

#define USABLE_MEMORY 1
#define IO_MEMORY 15

extern void pKernelStartSymbol;
extern void pRodataStartSymbol;
extern void pDataStartSymbol;
extern void pBssStartSymbol;
extern void pKernelEndSymbol;
extern void boot_page_directory;

uint32_t pKernelStart;
uint32_t pRodataStart;
uint32_t pDataStart;
uint32_t pBssStart;
uint32_t pKernelEnd;

typedef struct pMMapEntry {
	pAddr_t baseAddr;
	uint32_t length;
	uint8_t type;
	struct pMMapEntry *next;
} __attribute__ ((packed)) pMMapEntry_t;

struct {
	uint32_t size;
	pMMapEntry_t *entries;
} __attribute__ ((packed)) pMemoryMap;

uint8_t *pageFrameBitset;
uint8_t *pageFrameBitsetLast;

vAddr_t kHeapTop;

typedef struct {
	uint32_t entries[1024];
} __attribute__ ((packed)) pageTable_t;

typedef struct {
	uint32_t entries[1024];
	pAddr_t pPageTables;
	pAddr_t pAddr;
} __attribute__ ((packed)) pageDirectory_t;

pageDirectory_t *kernelPageDirectory;

void initMemoryManager(MBStructure_t *vMBStruct);
void parseMemoryMap(MBStructure_t *vMBStruct);

vAddr_t kMalloc(uint32_t size);

void initPageFrameAllocator();
void reservePageFrames(pAddr_t pBaseAddr, uint32_t length);
void allocPageFrame();
void freePageFrame(pAddr_t pBaseAddr);

void changePageDirectory(pageDirectory_t *directory);
void handlePageFault();

#endif //MEMORY_H
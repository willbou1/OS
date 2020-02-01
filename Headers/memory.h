#ifndef MEMORY_H
#define MEMORY_H

#include "Headers/types.h"
#include "Headers/debug.h"
#include "Headers/interrupts.h"

#define  PAGE_SIZE (1024 * 1024 * 4) //PSE is enabled
#define PAGE_DIRECTORY_ACCESS_KERNEL 0b01001011

extern void *endKernelSymbol;
extern uint32_t endKernel;

uint32_t endAllocationZone;

uint32_t frames;
uint8_t *frameBitset;
uint8_t *freeFrameBitsetByte;

typedef struct {
	uint8_t access;
	uint8_t physical_address_low_avail;
	uint16_t physical_address_high;
} __attribute__ ((packed)) pageDirectoryEntry_t;

typedef struct {
	pageDirectoryEntry_t entries[1024];
} __attribute__ ((packed)) pageDirectory_t;

pageDirectory_t kernelPageDirectory;

const uint32_t alignedKmalloc(const uint32_t size);
const uint32_t kmalloc(const uint32_t size);

void initFrameAllocator(const uint16_t bitsetSize);
const uint32_t allocateFrame();
void deallocateFrame(const uint32_t physicalAddress);

void enablePaging();
void loadPageDirectory(pageDirectory_t pageDirectory);
void encodePageDirectoryEntry(pageDirectoryEntry_t *const pageDirectoryEntry, const uint32_t physicalAddress, const uint8_t access);
void initPaging();
void pageFaultHandler();

#endif //MEMORY_H
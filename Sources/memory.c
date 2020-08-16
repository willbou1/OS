#include "Headers/memory.h"

uint32_t pKernelStart = (uint32_t)(&pKernelStartSymbol);
uint32_t pRodataStart = (uint32_t)(&pRodataStartSymbol);
uint32_t pDataStart = (uint32_t)(&pDataStartSymbol);
uint32_t pBssStart = (uint32_t)(&pBssStartSymbol);
uint32_t pKernelEnd = (uint32_t)(&pKernelEndSymbol);

pageDirectory_t *kernelPageDirectory = (pageDirectory_t*)(&boot_page_directory);

void initMemoryManager(MBStructure_t *vMBStruct) {
	exceptionHandlers[0x0E] = &handlePageFault;

	kHeapTop = pKernelEnd + VIRTUAL_KERNEL_OFFSET;

	parseMemoryMap(vMBStruct);

	initPageFrameAllocator();
}

//Physical memory map
void parseMemoryMap(MBStructure_t *vMBStruct) {
	if (vMBStruct->flags & 1)
		pMemoryMap.size = (vMBStruct->mem_upper + 640) * 1024;
	else
		printf("TThe multiboot structure doesnt provide mem");
	//Reconstructing memory map
	if (vMBStruct->flags & (1 <<6)) {
		vAddr_t memoryMap = vMBStruct->mmap_addr + VIRTUAL_KERNEL_OFFSET;
		for (vAddr_t curr = memoryMap; curr < memoryMap + vMBStruct->mmap_length; curr += (*(uint32_t*)curr + 4)) {
			MBMMapEntry_t *entry = (MBMMapEntry_t*)curr;
			if (!entry->base_addr_high) {
				addMemoryMapEntry(entry->base_addr_low, entry->length_low, entry->type);
			}
		}
	} else
		printf("TThe multiboot structure doesnt provide mmap");
}

void addMemoryMapEntry(pAddr_t pBaseAddr, uint32_t length, uint8_t type) {
	pMMapEntry_t **pMemoryMapNext = &pMemoryMap.entries;
	while (*pMemoryMapNext)
		pMemoryMapNext = &((*pMemoryMapNext)->next);
	*pMemoryMapNext = (pMMapEntry_t*)kMalloc(sizeof(pMMapEntry_t));
	(*pMemoryMapNext)->baseAddr = pBaseAddr;
	(*pMemoryMapNext)->length = length;
	(*pMemoryMapNext)->type = type;
	(*pMemoryMapNext)->next = 0;
}

//Kernel heap
vAddr_t kMalloc(uint32_t size) {
	vAddr_t temp = kHeapTop;
	kHeapTop += size;
	return temp;
}

//Page frame allocator
void initPageFrameAllocator() {
	pageFrameBitset = kMalloc(pMemoryMap.size / PAGE_SIZE / 8 + 1);
	pageFrameBitsetLast = pageFrameBitset;
	for (pMMapEntry_t *entry = pMemoryMap.entries; entry; entry = entry->next) {
		if (entry->type != 1)
			reservePageFrames(entry->baseAddr, entry->length);
	}
	reservePageFrames(pKernelStart, pKernelEnd - pKernelStart);
}

void reservePageFrames(pAddr_t pBaseAddr, uint32_t length) {
	uint32_t endAddr = (pBaseAddr + length & 0xFFF) ? 
		((pBaseAddr + length) & 0xFFFFF000) + PAGE_SIZE : pBaseAddr + length;
	for (uint32_t i = pBaseAddr & 0xFFFFF000; i < endAddr; i += PAGE_SIZE)
		pageFrameBitset[i / PAGE_SIZE / 8] |= ( 1 << (i % (PAGE_SIZE * 8) / PAGE_SIZE));
}

void allocPageFrame() {
	uint8_t freeBit = 0;
	while (*pageFrameBitsetLast & (1 << freeBit))
		freeBit++;
	*pageFrameBitsetLast &= (1 << freeBit);
	pAddr_t freePageFrame = (((pageFrameBitsetLast - pageFrameBitset) * 8) + freeBit) * PAGE_SIZE;
	if (*pageFrameBitsetLast == 0xFF) {
		while (*(uint32_t*)pageFrameBitsetLast == 0xFFFFFFFF)
			pageFrameBitsetLast += 4;
		while (*pageFrameBitsetLast == 0xFF)
			pageFrameBitsetLast++;
	}
	return freePageFrame;
}

void freePageFrame(pAddr_t baseAddr) {
	uint32_t bitsetIndex = baseAddr / PAGE_SIZE / 8;
	pageFrameBitset[baseAddr / PAGE_SIZE / 8] ^= (1 << (baseAddr % (PAGE_SIZE * 8) / PAGE_SIZE));
	pageFrameBitsetLast = pageFrameBitset + bitsetIndex;
}


//Paging system
void changePageDirectory(pageDirectory_t *directory) {
	asm volatile ("movl %[gdt], %%ecx \n\t"
				  "movl %%ecx, %%cr3"
				  : : [gdt] "m" (directory->pAddr) :
				  "ecx");
}

void handlePageFault(uint32_t errorCode) {
	clearScreen();
	printf("PAGE FAULT !!!");
	printRegisters();
	printf("     Code: ");
	hexDump((char*)&errorCode, 4);
}
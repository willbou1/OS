#include "Headers/memory.h"

uint32_t endKernel = (uint32_t)&endKernelSymbol;

const uint32_t alignedKmalloc(const uint32_t size) {
	if (!endAllocationZone)
		endAllocationZone = endKernel;
	if (!(endAllocationZone & 0xFFFFF000)) {
		endAllocationZone &= 0xFFFFF000;
		endAllocationZone += 0x1000;
	}
	uint32_t ret = endAllocationZone;
	endAllocationZone += size;
	return ret;
}

const uint32_t kmalloc(const uint32_t size) {
	if (!endAllocationZone)
		endAllocationZone = endKernel;
	uint32_t ret = endAllocationZone;
	endAllocationZone += size;
	return ret;
}

void initFrameAllocator(const uint16_t bitsetSize) {
	frameBitset = (uint8_t*)kmalloc(bitsetSize);
	for (uint16_t i = 0; i < bitsetSize; i++)
		frameBitset[i] = 0;
	frames = endAllocationZone & 0xFFFFF000 + 0x1000;
	freeFrameBitsetByte = frameBitset;
}

const uint32_t allocateFrame() {
	//Finding first free byte in biset
	while (*freeFrameBitsetByte == 0xFF)
		freeFrameBitsetByte++;
	//Finding first free bit in bitset byte
	uint16_t i = 0;
	uint8_t bitsetMask = 1;
	while (*freeFrameBitsetByte & bitsetMask) {
		bitsetMask <<= 1;
		i++;
	}
	//Setting bit
	*freeFrameBitsetByte |= bitsetMask;
	//Checking if bitset byte is still free
	if (*freeFrameBitsetByte == 0xFF)
		freeFrameBitsetByte++;
	//Returning first free frame
	return frames + (((((uint32_t)freeFrameBitsetByte - (uint32_t)frameBitset) * 8) + i) * PAGE_SIZE);
}

void deallocateFrame(const uint32_t physicalAddress) {
	uint16_t frameIndex = (physicalAddress - frames) / PAGE_SIZE;
	//Setting free bitset byte to the one of frame
	freeFrameBitsetByte = frameBitset + (frameIndex / 8);
	//Clearing bit of frame
	*freeFrameBitsetByte ^= 1 << (frameIndex % 8);
}

void enablePaging() {
	//Enabling PSE
	asm volatile ("movl %%cr4, %%eax\n\
		orl $00010000, %%eax\n\
		movl %%eax, %%cr4"
		: : : "eax");
	//Enabling paging
		asm volatile ("movl %%cr0, %%eax\n\
		orl $0x80000000, %%eax\n\
		movl %%eax, %%cr0"
		: : : "eax");
}

void loadPageDirectory(pageDirectory_t pageDirectory) {
	asm volatile ("movl %0, %%cr3"
		: : "r" (&pageDirectory));
}

void encodePageDirectoryEntry(pageDirectoryEntry_t *const pageDirectoryEntry, const uint32_t physicalAddress, const uint8_t access) {
	pageDirectoryEntry->access = access;
	pageDirectoryEntry->physical_address_low_avail = (uint8_t)(physicalAddress >> 8) & 0b11111000;
	pageDirectoryEntry->physical_address_high = (uint8_t)(physicalAddress >> 16);
}

void initPaging() {
	//Filling kernel page directory
	uint16_t i = 0;
	for (; i * PAGE_SIZE < endKernel; i++)
		encodePageDirectoryEntry(kernelPageDirectory.entries + i, i * PAGE_SIZE, PAGE_DIRECTORY_ACCESS_KERNEL);
	initFrameAllocator(1024 / 8);

	exceptionHandlers[14] = &pageFaultHandler;
	hexDump((uint8_t*)&kernelPageDirectory, 200);
	loadPageDirectory(kernelPageDirectory);
	//enablePaging();
}

void pageFaultHandler() {
	printf(" PAGE FAULT ");
}
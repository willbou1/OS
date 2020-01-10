#include "Headers/GDT.h"

void setSegmentDescriptor(const uint16_t index, const uint32_t base, const uint32_t limit, const uint8_t access, const uint8_t flags) {
	GDT[index].limit_low = (uint16_t)(limit & 0x0000FFFF);
	GDT[index].base_low = (uint16_t)(base & 0x0000FFFF);
	GDT[index].base_mid = (uint8_t)(base >> 16 & 0x000000FF);
	GDT[index].access = (uint8_t)access;
	GDT[index].limit_high_flags = (uint8_t)(limit >> 16 & 0x0000000F);
	GDT[index].limit_high_flags = GDT[index].limit_high_flags | (flags << 4);
	GDT[index].base_high = (uint8_t)(base >> 24);
}

uint32_t getSegmentBase(const uint16_t index) {
	return (uint32_t)GDT[index].base_low | 
		(uint32_t)(GDT[index].base_mid << 16) | 
		(uint32_t)(GDT[index].base_high << 24);
}

uint32_t getSegmentLimit(const uint16_t index) {
	return (uint32_t)GDT[index].limit_low | 
		(uint32_t)(GDT[index].limit_high_flags & 0x0F << 16);
}

uint8_t getSegmentFlags(const uint16_t index) {
	return GDT[index].limit_high_flags >> 4;
}

void setSegmentBase(const uint16_t index, const uint32_t base) {
	GDT[index].base_low = (uint16_t)(base & 0x0000FFFF);
	GDT[index].base_mid = (uint8_t)(base >> 16 & 0x000000FF);
	GDT[index].base_high = (uint8_t)(base >> 24);
}

void setSegmentLimit(const uint16_t index, const uint32_t limit) {
	GDT[index].limit_low = (uint16_t)(limit & 0x0000FFFF);
	GDT[index].limit_high_flags = GDT[index].limit_high_flags |
		(uint8_t)(limit >> 16 & 0x0000000F);
}

void setSegmentFlags(const uint16_t index, const uint8_t flags) {
	GDT[index].limit_high_flags = GDT[index].limit_high_flags |
		(flags << 4);
}

void flushGDT() {
	for (uint32_t i = 0; i < GDT_MAX_NB_ENTRY * 2; i++)
		*((uint32_t*)GDT + i) = 0;
}

void loadGDT(const uint16_t nbEntry) {
	GDTDescriptor.size = nbEntry * 8 - 1;
	GDTDescriptor.offset = (uint32_t)GDT;
	asm volatile ("LGDT %[gdt]" : : [gdt] "m" (GDTDescriptor));
}

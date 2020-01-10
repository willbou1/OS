#include "Headers/IDT.h"

void setGateDescriptor(const uint8_t index, const uint32_t offset, const uint16_t selector, const uint8_t typeAttr) {
	IDT[index].offset_low = (uint16_t)(offset & 0x0000FFFF);
	IDT[index].selector = selector;
	IDT[index].zero = 0;
	IDT[index].type_attr = typeAttr;
	IDT[index].offset_high = (uint16_t)(offset >> 16);
}

uint32_t getGateOffset(const uint8_t index) {
	return (uint32_t)IDT[index].offset_low |
		(uint32_t)(IDT[index].offset_high << 16);
}

void setGateOffset(const uint8_t index, const uint32_t offset) {
	IDT[index].offset_low = (uint16_t)(offset & 0x0000FFFF);
	IDT[index].offset_high = (uint16_t)(offset >> 16);
}

void flushIDT() {
	for (uint16_t i = 0; i < 256 * 2; i++)
		*((uint32_t*)IDT + i) = 0;
}

void loadIDT() {
	IDTDescriptor.size = (256 * 8) - 1;
	IDTDescriptor.offset = (uint32_t)IDT;
	asm volatile ("LIDT %[idt]" : : [idt] "m" (IDTDescriptor));
}

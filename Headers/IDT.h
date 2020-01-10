#ifndef IDT_H
#define IDT_H

#include "Headers/types.h"
#include "Headers/debug.h"

//Options
//0101: 32-bit Task gate 0110: 16-bit Interrupt gate 0111: 16-bit Trap gate
//1110: 32-bit Interrupt gate 1111: 32-bit trap gate
#define IDT_TYPE_ATTR_GATE_TYPE         0b00001111
//0: For interrupt or  trap gates
#define IDT_TYPE_ATTR_STORAGE_SEGMENT   0b00010000
//>= privilage level can call
#define IDT_TYPE_ATTR_PRIVILEGE_LEVEL   0b01100000
//1: For valid descriptor
#define IDT_TYPE_ATTR_PRESENT           0b10000000

//Common types
#define IDT_TYPE_ATTR_INT_GATE          0b10001110
#define IDT_TYPE_ATTR_TRAP_GATE         0b10001111


struct {
	uint16_t size;
	uint32_t offset;
} __attribute__((packed))
IDTDescriptor;

struct {
	uint16_t offset_low;
	uint16_t selector;
	uint8_t zero;
	uint8_t type_attr;
	uint16_t offset_high;
} __attribute__((packed))
IDT[256];

void setGateDescriptor(const uint8_t index, const uint32_t offset, const uint16_t selector, const uint8_t typeAttr);
uint32_t getGateOffset(const uint8_t index);
void setGateOffset(const uint8_t index, const uint32_t offset);

void flushIDT();
void loadIDT();

#endif //IDT_H
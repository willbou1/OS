#ifndef GDT_H
#define GDT_H

#include "Headers/types.h"

#define GDT_MAX_NB_ENTRY 65536

//Options
#define GDT_ACCESS_ACCESSED             0b00000001
//Code selectors: 1 for readable Data selectors: 1 for writable
#define GDT_ACCESS_READ_WRITE           0b00000010
//Data selectors: 0: Grows up 1: Grows down
//Code selectors: 0: Only executable from ACCESS_PRIVILEGE 1: Executable from <= ACCESS_PRIVILEGE
#define GDT_ACCESS_DIRECTION_CONFORMING = 0b00000100
//0: Not executable 1: Executable
#define GDT_ACCESS_EXECUTABLE           0b00001000
//1: Code or data segment 0: Task state segment
#define GDT_ACCESS_DESCRIPTOR_TYPE      0b00010000
//0: Highest priv level 3: Lowest priv levelACCESS_PRIVILEGE =            0b01100000;
#define GDT_ACCESS_PRESENT              0b10000000

//0: 16 bit protected mode 1: 32 bit protected mode
#define GDT_FLAG_SIZE                   0b00000100
//0: 1B blocks 1: 4KB blocks
#define GDT_FLAG_GRANULARITY            0b00001000

//Common types
//GDT::ACCESS_READ_WRITE | GDT::ACCESS_EXECUTABLE | GDT::ACCESS_DESCRIPTOR_TYPE | ACCESS_PRESENT
#define GDT_ACCESS_CODE_SEGMENT         0x9A
//GDT::ACCESS_READ_WRITE | GDT::ACCESS_DESCRIPTOR_TYPE | ACCESS_PRESENT
#define GDT_ACCESS_DATA_SEGMENT         0x92

struct {
	uint16_t size;
	uint32_t offset;
} __attribute__((packed))
GDTDescriptor;

struct {
	uint16_t limit_low;
	uint16_t base_low;
	uint8_t base_mid;
	uint8_t access;
	uint8_t limit_high_flags;
	uint8_t base_high;
} __attribute__((packed))
GDT[GDT_MAX_NB_ENTRY];

void setSegmentDescriptor(const uint16_t index, const uint32_t base, const uint32_t limit, const uint8_t access, const uint8_t flags);
uint32_t getSegmentBase(const uint16_t index);
uint32_t getSegmentLimit(const uint16_t index);
uint8_t getSegmentFlags(const uint16_t index);
void setSegmentBase(const uint16_t index, const uint32_t base);
void setSegmentLimit(const uint16_t index, const uint32_t limit);
void setSegmentFlags(const uint16_t index, const uint8_t flags);

void flushGDT();
void loadGDT(const uint16_t nbEntry);

#endif //GDT_H
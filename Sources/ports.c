#include "Headers/ports.h"

const uint32_t ind(const uint16_t portNumber) {
	uint32_t buffer = 0;
	asm volatile ("movw %1, %%dx\n\
		inl %%dx, %%eax\n\
		movl %%eax, %0"
		: "=r" (buffer)
		: "r" (portNumber)
		: "dx", "al");
	return buffer;
}

void outd(const uint16_t portNumber, const uint32_t value) {
	asm volatile ("mov %0, %%dx\n\
		movl %1, %%eax\n\
		outl %%eax, %%dx"
		: : "r" (portNumber), "r" (value)
		: "dx", "al");
}

const uint16_t inw(const uint16_t portNumber) {
	uint16_t buffer = 0;
	asm volatile ("movw %1, %%dx\n\
		inw %%dx, %%ax\n\
		movw %%ax, %0"
		: "=r" (buffer)
		: "r" (portNumber)
		: "dx", "al");
	return buffer;
}

void outw(const uint16_t portNumber, const uint16_t value) {
	asm volatile ("mov %0, %%dx\n\
		movw %1, %%ax\n\
		outw %%ax, %%dx"
		: : "r" (portNumber), "r" (value)
		: "dx", "al");
}

const uint8_t inb(const uint16_t portNumber) {
	uint8_t buffer = 0;
	asm volatile ("movw %1, %%dx\n\
		inb %%dx, %%al\n\
		movb %%al, %0"
		: "=r" (buffer)
		: "r" (portNumber)
		: "dx", "al");
	return buffer;
}

void outb(const uint16_t portNumber, const uint8_t value) {
	asm volatile ("mov %0, %%dx\n\
		movb %1, %%al\n\
		outb %%al, %%dx"
		: : "r" (portNumber), "r" (value)
		: "dx", "al");
}

#include "Headers/debug.h"

uint32_t position = 0;

void clearScreen() {
	position = 0;
	for (uint16_t i = 0; i < 80; i++)
		printf("                         ");
	position = 0;
}

void backUp() {
	position = 0;
}

void printf(char *str) {
	uint16_t *videoMemory = (uint16_t*)VGA_MODE_TEXT_BUFFER;
	for (uint32_t i = 0; str[i] != '\0'; i++) {
		videoMemory[position] = (videoMemory[position] & 0xFF00) | str[i];
		position++;
	}
}

void hexDump(const uint8_t *const base, const uint32_t length) {
	uint8_t digits[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
	uint8_t curr[3];
	curr[2] = 0;
	for (uint32_t i = 0; i < length; i++) {
		curr[0] = digits[(*(base + i)) >> 4];
		curr[1] = digits[(*(base + i)) & 0x0F];
		printf(curr);
		printf(" ");
	}
}

void printRegisters() {
	//Getting registers
	uint32_t eax, ebx, ecx, edx, esi, edi, ebp, esp,
		cs, ds, ss, es, cr2, cr3;
	asm volatile ("movl %%eax, %0\n\
		movl %%ebx, %1\n\
		movl %%ecx, %2\n\
		movl %%edx, %3"
		: "=r" (eax), "=r" (ebx), "=r" (ecx), "=r" (edx));
	asm volatile ("movl %%esi, %0\n\
		movl %%edi, %1\n\
		movl %%ecx, %2\n\
		movl %%edx, %3"
		: "=r" (esi), "=r" (edi), "=r" (ebp), "=r" (esp));
	asm volatile ("movl %%cs, %0\n\
		movl %%ds, %1\n\
		movl %%ss, %2\n\
		movl %%es, %3"
		: "=r" (cs), "=r" (ds), "=r" (ss), "=r" (es));
	asm volatile ("movl %%cr2, %0\n\
		movl %%cr3, %1"
		: "=r" (cr2), "=r" (cr3));
	//Printing registers
	printf("   EAX:");
	hexDump((uint8_t*)&eax, 4);
	printf("   EBX:");
	hexDump((uint8_t*)&ebx, 4);
	printf("   ECX:");
	hexDump((uint8_t*)&ecx, 4);
	printf("   EDX:");
	hexDump((uint8_t*)&edx, 4);
	printf("   ESI:");
	hexDump((uint8_t*)&esi, 4);
	printf("   EDI:");
	hexDump((uint8_t*)&edi, 4);
	printf("   EBP:");
	hexDump((uint8_t*)&ebp, 4);
	printf("   ESP:");
	hexDump((uint8_t*)&esp, 4);
	printf("   CS:");
	hexDump((uint8_t*)&cs, 4);
	printf("   DS:");
	hexDump((uint8_t*)&ds, 4);
	printf("   SS:");
	hexDump((uint8_t*)&ss, 4);
	printf("   ES:");
	hexDump((uint8_t*)&es, 4);
	printf("   CR2:");
	hexDump((uint8_t*)&cr2, 4);
	printf("   CR3:");
	hexDump((uint8_t*)&cr3, 4);
}
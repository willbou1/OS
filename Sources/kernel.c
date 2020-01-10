#include "Headers/types.h"
#include "Headers/debug.h"
#include "Headers/CPU.h"
#include "Headers/GDT.h"
#include "Headers/IDT.h"
#include "Headers/interrupts.h"
#include "Headers/keyboardDriver.h"

void setUpGDT() {
	setSegmentDescriptor(0, 0, 0, 0, 0);
	setSegmentDescriptor(1, 0, 0xFFFFFFFF, GDT_ACCESS_CODE_SEGMENT, 0b1100);
	setSegmentDescriptor(2, 0, 0xFFFFFFFF, GDT_ACCESS_DATA_SEGMENT, 0b1100);
	loadGDT(3);
	//setCSRegister(0x08);
	asm( "ljmp $0x08, $.Lnext%=\n.Lnext%=:\t" : );
}

void setUpInterrupts() {
	setPICMask(0x01);
	resetPIC(0x20);
	initializeIDT(1 * 8, IDT_TYPE_ATTR_TRAP_GATE, IDT_TYPE_ATTR_INT_GATE);
	
	enableInterrupts();
}

extern void kernelMain(void *multiboot_structure, uint32_t magic) {

	clearScreen();
	
	setUpGDT();

	setUpInterrupts();

	initializeKeyboardDriver();

	while (1) {
	}
}
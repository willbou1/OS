#include "Headers/types.h"
#include "Headers/debug.h"
#include "Headers/CPU.h"
#include "Headers/GDT.h"
#include "Headers/interrupts.h"
#include "Headers/keyboardDriver.h"
#include "Headers/memory.h"
#include "Headers/VGA3Driver.h"
#include "Headers/PCI.h"
#include "Headers/multiboot.h"

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

extern void kernelMain(MBStructure_t *vMBStruct, uint32_t magic) {

	clearScreen();
	
	setUpGDT();

	setUpInterrupts();

	initMemoryManager(vMBStruct);

	initKeyboardDriver();

	/*for (uint16_t i = 0; i < 256; i++) {
		for (uint16_t j = 0; j < 32; j++) {
			for (uint16_t k = 0; k < 8; k++) {
				PCIConfigAddress_t addr = {
					k, j, i
				};
				PCIConfigHeader_t curr = readPCIConfigCommonHeader(addr);
				if (curr.vendorID != 0xFFFF)
					hexDump((uint8_t*)&curr.deviceID, 2);
			}
		}
	}*/

	while (1) {
	}
}
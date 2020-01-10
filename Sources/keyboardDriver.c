#include "Headers/keyboardDriver.h"

void initializeKeyboardDriver() {
	IRQHandlers[1] = &keyboardInterruptHandler;
}

void keyboardInterruptHandler() {
	uint8_t scanCode = inb(PORT_NB_PS2_DATA);
	hexDump(&scanCode, 1);
}
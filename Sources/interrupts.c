#include "Headers/interrupts.h"

void clearInterruptHandlers() {
	for (uint16_t i = 0; i < 32; i++)
		exceptionHandlers[i] = 0;
	for (uint16_t i = 0; i < 16; i++)
		IRQHandlers[i] = 0;
}

void initializeIDT(const uint16_t selector, const uint8_t exceptionTypeAttr, const uint8_t IRQTypeAttr) {
	for (uint16_t i = 0; i < 256; i++)
		setGateDescriptor(i, (uint32_t*)&_unused, selector, IRQTypeAttr);
	
	setGateDescriptor(0, (uint32_t*)&_exception0, selector, exceptionTypeAttr);
	setGateDescriptor(1, (uint32_t*)&_exception1, selector, exceptionTypeAttr);
	setGateDescriptor(2, (uint32_t*)&_exception2, selector, exceptionTypeAttr);
	setGateDescriptor(3, (uint32_t*)&_exception3, selector, exceptionTypeAttr);
	setGateDescriptor(4, (uint32_t*)&_exception4, selector, exceptionTypeAttr);
	setGateDescriptor(5, (uint32_t*)&_exception5, selector, exceptionTypeAttr);
	setGateDescriptor(6, (uint32_t*)&_exception6, selector, exceptionTypeAttr);
	setGateDescriptor(7, (uint32_t*)&_exception7, selector, exceptionTypeAttr);
	setGateDescriptor(8, (uint32_t*)&_exception8, selector, exceptionTypeAttr);
	setGateDescriptor(9, (uint32_t*)&_exception9, selector, exceptionTypeAttr);
	setGateDescriptor(10, (uint32_t*)&_exception10, selector, exceptionTypeAttr);
	setGateDescriptor(11, (uint32_t*)&_exception11, selector, exceptionTypeAttr);
	setGateDescriptor(12, (uint32_t*)&_exception12, selector, exceptionTypeAttr);
	setGateDescriptor(13, (uint32_t*)&_exception13, selector, exceptionTypeAttr);
	setGateDescriptor(14, (uint32_t*)&_exception14, selector, exceptionTypeAttr);
	setGateDescriptor(15, (uint32_t*)&_exception15, selector, exceptionTypeAttr);
	setGateDescriptor(16, (uint32_t*)&_exception16, selector, exceptionTypeAttr);
	setGateDescriptor(17, (uint32_t*)&_exception17, selector, exceptionTypeAttr);
	setGateDescriptor(18, (uint32_t*)&_exception18, selector, exceptionTypeAttr);
	setGateDescriptor(19, (uint32_t*)&_exception19, selector, exceptionTypeAttr);
	setGateDescriptor(20, (uint32_t*)&_exception20, selector, exceptionTypeAttr);
	setGateDescriptor(21, (uint32_t*)&_exception21, selector, exceptionTypeAttr);
	setGateDescriptor(22, (uint32_t*)&_exception22, selector, exceptionTypeAttr);
	setGateDescriptor(23, (uint32_t*)&_exception23, selector, exceptionTypeAttr);
	setGateDescriptor(24, (uint32_t*)&_exception24, selector, exceptionTypeAttr);
	setGateDescriptor(25, (uint32_t*)&_exception25, selector, exceptionTypeAttr);
	setGateDescriptor(26, (uint32_t*)&_exception26, selector, exceptionTypeAttr);
	setGateDescriptor(27, (uint32_t*)&_exception27, selector, exceptionTypeAttr);
	setGateDescriptor(28, (uint32_t*)&_exception28, selector, exceptionTypeAttr);
	setGateDescriptor(29, (uint32_t*)&_exception29, selector, exceptionTypeAttr);
	setGateDescriptor(30, (uint32_t*)&_exception30, selector, exceptionTypeAttr);
	setGateDescriptor(31, (uint32_t*)&_exception31, selector, exceptionTypeAttr);
	

	setGateDescriptor(32, (uint32_t*)&_irq32, selector, IRQTypeAttr);
	setGateDescriptor(33, (uint32_t*)&_irq33, selector, IRQTypeAttr);
	setGateDescriptor(34, (uint32_t*)&_irq34, selector, IRQTypeAttr);
	setGateDescriptor(35, (uint32_t*)&_irq35, selector, IRQTypeAttr);
	setGateDescriptor(36, (uint32_t*)&_irq36, selector, IRQTypeAttr);
	setGateDescriptor(37, (uint32_t*)&_irq37, selector, IRQTypeAttr);
	setGateDescriptor(38, (uint32_t*)&_irq38, selector, IRQTypeAttr);
	setGateDescriptor(39, (uint32_t*)&_irq39, selector, IRQTypeAttr);
	setGateDescriptor(40, (uint32_t*)&_irq40, selector, IRQTypeAttr);
	setGateDescriptor(41, (uint32_t*)&_irq41, selector, IRQTypeAttr);
	setGateDescriptor(42, (uint32_t*)&_irq42, selector, IRQTypeAttr);
	setGateDescriptor(43, (uint32_t*)&_irq43, selector, IRQTypeAttr);
	setGateDescriptor(44, (uint32_t*)&_irq44, selector, IRQTypeAttr);
	setGateDescriptor(45, (uint32_t*)&_irq45, selector, IRQTypeAttr);
	setGateDescriptor(46, (uint32_t*)&_irq46, selector, IRQTypeAttr);
	setGateDescriptor(47, (uint32_t*)&_irq47, selector, IRQTypeAttr);
	loadIDT();
}

void enableInterrupts() {
	asm volatile ("sti");
}

void disableInterrupts() {
	asm volatile ("cli");
}

void resetPIC(const uint8_t offsetVector) {
	uint8_t PIC1Mask = inb(PORT_NB_PIC_MASTER_DATA);
	uint8_t PIC2Mask = inb(PORT_NB_PIC_SLAVE_DATA);
	//Restart PICs (CW4 needed | cascade mode | edge triggered mode)
	outb(PORT_NB_PIC_MASTER_CMD, 0b00010001);
	outb(PORT_NB_PIC_SLAVE_CMD, 0b00010001);
	//Set vector offset to 32
	outb(PORT_NB_PIC_MASTER_DATA, offsetVector);
	outb(PORT_NB_PIC_SLAVE_DATA, offsetVector + 8);
	//Set up cascade mode
	outb(PORT_NB_PIC_MASTER_DATA, 0x04);
	outb(PORT_NB_PIC_SLAVE_DATA, 0x02);
	//ICW4 (8086 mode)
	outb(PORT_NB_PIC_MASTER_DATA, 0x1);
	outb(PORT_NB_PIC_SLAVE_DATA, 0x1);
	//Setting masks
	outb(PORT_NB_PIC_MASTER_DATA, PIC1Mask);
	outb(PORT_NB_PIC_SLAVE_DATA, PIC2Mask);
}

void setPICMask(const uint16_t mask) {
	outb(PORT_NB_PIC_MASTER_DATA, (uint8_t)(mask & 0x00FF));
	outb(PORT_NB_PIC_SLAVE_DATA, (uint8_t)(mask >> 8));
}

void resetPICMask() {
	outb(PORT_NB_PIC_MASTER_DATA, 0x0);
	outb(PORT_NB_PIC_SLAVE_DATA, 0x0);
}

uint16_t getPICMask() {
	return ((uint16_t)(inb(PORT_NB_PIC_MASTER_DATA)) |
		((uint16_t)(inb(PORT_NB_PIC_SLAVE_DATA))) << 8);
}

uint16_t getPICIRR() {
	//Requet PIC's IRR
	outb(PORT_NB_PIC_MASTER_CMD, PIC_REQUEST_IRR);
	return ((uint16_t)inb(PORT_NB_PIC_MASTER_CMD) << 8) |
		(uint16_t)inb(PORT_NB_PIC_SLAVE_CMD);
}

uint16_t getPICISR() {
	//Requet PIC's ISR
	outb(PORT_NB_PIC_MASTER_CMD, PIC_REQUEST_ISR);
	return ((uint16_t)inb(PORT_NB_PIC_MASTER_CMD) << 8) |
		(uint16_t)inb(PORT_NB_PIC_SLAVE_CMD);
}

void sendPICEOI(const uint8_t toSlave) {
	outb(PORT_NB_PIC_MASTER_CMD, 0x20);
	if (toSlave)
		outb(PORT_NB_PIC_SLAVE_CMD, 0x20);
}

void handleIRQ(uint8_t nb) {
	printf(" INTERRUPT:");
	hexDump(&nb, 1);
	if (nb >= 32 && nb <48) {
		//From PICS
		//Check if IRQ is spurious
		if (nb == 39 && !(getPICISR() & 0xFF >> 7))
			return;
		if (nb == 47 && !(getPICISR() >> 15)) {
			sendPICEOI(false);
			return;
		}
		if (IRQHandlers[nb - 32])
			(*(IRQHandlers[nb - 32]))();
		//Send EOI to PICS
		if (nb < 40)
			sendPICEOI(false);
		else
			sendPICEOI(true);
	}
}

void handleException(uint8_t nb) {
	printf("EXCEPTION ");
	hexDump(&nb, 1);
	printRegisters();
	printf("          STACK: ");
	hexDump(&nb - 16, 24);
	while (1) {}
}
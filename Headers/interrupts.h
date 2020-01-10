#ifndef INTERRUPT_MANAGER_H
#define INTERRUPT_MANAGER_H

#include "Headers/types.h"
#include "Headers/debug.h"
#include "Headers/ports.h"
#include "Headers/IDT.h"

#define PIC_REQUEST_IRR 0x0A
#define PIC_REQUEST_ISR 0x0B

extern void _exception0();
extern void _exception1();
extern void _exception2();
extern void _exception3();
extern void _exception4();
extern void _exception5();
extern void _exception6();
extern void _exception7();
extern void _exception8();
extern void _exception9();
extern void _exception10();
extern void _exception11();
extern void _exception12();
extern void _exception13();
extern void _exception14();
extern void _exception15();
extern void _exception16();
extern void _exception17();
extern void _exception18();
extern void _exception19();
extern void _exception20();
extern void _exception21();
extern void _exception22();
extern void _exception23();
extern void _exception24();
extern void _exception25();
extern void _exception26();
extern void _exception27();
extern void _exception28();
extern void _exception29();
extern void _exception30();
extern void _exception31();


extern void _unused();
extern void _irq32();
extern void _irq33();
extern void _irq34();
extern void _irq35();
extern void _irq36();
extern void _irq37();
extern void _irq38();
extern void _irq39();
extern void _irq40();
extern void _irq41();
extern void _irq42();
extern void _irq43();
extern void _irq44();
extern void _irq45();
extern void _irq46();
extern void _irq47();

void (*exceptionHandlers[32])();
void (*IRQHandlers[16])();

void clearInterruptHandlers();
void initializeIDT(const uint16_t selector, const uint8_t exceptionTypeAttr, const uint8_t IRQTypeAttr);
void enableInterrupts();
void disableInterrupts();

void resetPIC(const uint8_t offsetVector);
void setPICMask(const uint16_t mask);
void resetPICMask();
uint16_t getPICMask();
uint16_t getPICIRR();
uint16_t getPICISR();
void sendPICEOI(const uint8_t toSlave);

void handleIRQ(uint8_t nb);
void handleException(uint8_t nb);

#endif //INTERRUPT_MANAGER_H
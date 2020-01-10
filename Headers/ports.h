#ifndef PORT_H
#define PORT_H

#include "Headers/types.h"

#define PORT_NB_PIC_MASTER_CMD 0x20
#define PORT_NB_PIC_MASTER_DATA 0x21
#define PORT_NB_PIC_SLAVE_CMD 0xA0
#define PORT_NB_PIC_SLAVE_DATA 0xA1

#define PORT_NB_PS2_DATA 0x60

uint32_t ind(const uint16_t portNumber);
void outd(const uint16_t portNumber, uint32_t value);

uint16_t inw(const uint16_t portNumber);
void outw(const uint16_t portNumber, uint16_t value);

uint8_t inb(const uint16_t portNumber);
void outb(const uint16_t portNumber, uint8_t value);

#endif //PORT_H
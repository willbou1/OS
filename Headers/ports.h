#ifndef PORT_H
#define PORT_H

#include "Headers/types.h"

#define PORT_NB_PIC_MASTER_CMD 0x20
#define PORT_NB_PIC_MASTER_DATA 0x21
#define PORT_NB_PIC_SLAVE_CMD 0xA0
#define PORT_NB_PIC_SLAVE_DATA 0xA1

#define PORT_NB_PS2_DATA 0x60
#define PORT_NB_PS2_STATUS_REG 0x64
#define PORT_NB_PS2_CMD_REG 0x64

#define PORT_NB_PIT_DATA_CH_0 0x40
#define PORT_NB_PIT_DATA_CH_1 0x41
#define PORT_NB_PIT_DATA_CH_2 0x42
#define PORT_NB_PIT_MODE_COMMAND 0x43

#define PORT_NB_VGA_INDEX_DATA 0x3C0
#define PORT_NB_VGA_MISC_OUT 0x3C2
#define PORT_NB_VGA_INDEX_0 0x3C4
#define PORT_NB_VGA_DATA_0 0x3C5
#define PORT_NB_VGA_INDEX_1 0x3CE
#define PORT_NB_VGA_DATA_1 0x3DF
#define PORT_NB_VGA_INDEX_2 0x3D4
#define PORT_NB_VGA_DATA_2 0x3D5
#define PORT_NB_VGA_DAC_MASK_REG 0x3C6

#define PORT_NB_PCI_CONFIG_ADDRESS 0xCF8
#define PORT_NB_PCI_CONFIG_DATA 0xCFC

uint32_t ind(const uint16_t portNumber);
void outd(const uint16_t portNumber, uint32_t value);

uint16_t inw(const uint16_t portNumber);
void outw(const uint16_t portNumber, uint16_t value);

uint8_t inb(const uint16_t portNumber);
void outb(const uint16_t portNumber, uint8_t value);

#endif //PORT_H
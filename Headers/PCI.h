#ifndef PCI_H
#define PCI_H

#include "Headers/debug.h"
#include "Headers/ports.h"

typedef struct {
	uint8_t function;
	uint8_t device;
	uint8_t bus;
} __attribute__((packed)) pciConfigAddress_t;

uint32_t readPCIConfigD(const pciConfigAddress_t pciAddress, const uint8_t offset);
void writePCIConfigD(const pciConfigAddress_t pciAddress, const uint8_t offset, const uint32_t value);

uint16_t readPCIConfigW(const pciConfigAddress_t pciAddress, const uint8_t offset);
void writePCIConfigW(const pciConfigAddress_t pciAddress, const uint8_t offset, const uint16_t value);

#endif //PCI_H
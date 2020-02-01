#include "Headers/PCI.h"

uint32_t readPCIConfigD(const pciConfigAddress_t pciConfigAddress, const uint8_t offset) {
	uint32_t address = (offset & 0xFC) |
		((pciConfigAddress.function & 0b111) << 8) |
		((pciConfigAddress.device & 0b1111) << 11) |
		(pciConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	return ind(PORT_NB_PCI_CONFIG_DATA);
}

void writePCIConfigD(const pciConfigAddress_t pciConfigAddress, const uint8_t offset, const uint32_t value) {
	uint32_t address = (offset & 0xFC) |
		((pciConfigAddress.function & 0b111) << 8) |
		((pciConfigAddress.device & 0b1111) << 11) |
		(pciConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	outd(PORT_NB_PCI_CONFIG_DATA, value);
}

uint16_t readPCIConfigW(const pciConfigAddress_t pciConfigAddress, const uint8_t offset) {
	uint32_t address = (offset & 0xFC) |
		((pciConfigAddress.function & 0b111) << 8) |
		((pciConfigAddress.device & 0b1111) << 11) |
		(pciConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	return (uint16_t)(ind(PORT_NB_PCI_CONFIG_DATA) << ((offset & 2) * 8));
}

void writePCIConfigW(const pciConfigAddress_t pciConfigAddress, const uint8_t offset, const uint16_t value) {
	uint32_t address = (offset & 0xFC) |
		((pciConfigAddress.function & 0b111) << 8) |
		((pciConfigAddress.device & 0b1111) << 11) |
		(pciConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	if (offset & 2) {
		const uint32_t tmp = readPCIConfigD(pciConfigAddress, offset);
		outd(PORT_NB_PCI_CONFIG_DATA, (tmp & 0xFFFF) | (value << 16));
	} else
		outd(PORT_NB_PCI_CONFIG_DATA, value);
}

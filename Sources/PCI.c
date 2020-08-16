#include "Headers/PCI.h"

uint32_t readPCIConfigD(const PCIConfigAddress_t PCIConfigAddress, const uint8_t offset) {
	uint32_t address = (offset & 0xFC) |
		((PCIConfigAddress.function & 0b111) << 8) |
		((PCIConfigAddress.device & 0b1111) << 11) |
		(PCIConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	return ind(PORT_NB_PCI_CONFIG_DATA);
}

void writePCIConfigD(const PCIConfigAddress_t PCIConfigAddress, const uint8_t offset, const uint32_t value) {
	uint32_t address = (offset & 0xFC) |
		((PCIConfigAddress.function & 0b111) << 8) |
		((PCIConfigAddress.device & 0b1111) << 11) |
		(PCIConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	outd(PORT_NB_PCI_CONFIG_DATA, value);
}

uint16_t readPCIConfigW(const PCIConfigAddress_t PCIConfigAddress, const uint8_t offset) {
	uint32_t address = (offset & 0xFC) |
		((PCIConfigAddress.function & 0b111) << 8) |
		((PCIConfigAddress.device & 0b1111) << 11) |
		(PCIConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	return (uint16_t)(ind(PORT_NB_PCI_CONFIG_DATA) << ((offset & 2) * 8));
}

void writePCIConfigW(const PCIConfigAddress_t PCIConfigAddress, const uint8_t offset, const uint16_t value) {
	uint32_t address = (offset & 0xFC) |
		((PCIConfigAddress.function & 0b111) << 8) |
		((PCIConfigAddress.device & 0b1111) << 11) |
		(PCIConfigAddress.bus << 16) | 0x80000000;
	outd(PORT_NB_PCI_CONFIG_ADDRESS, address);
	if (offset & 2) {
		const uint32_t tmp = readPCIConfigD(PCIConfigAddress, offset);
		outd(PORT_NB_PCI_CONFIG_DATA, (tmp & 0xFFFF) | (value << 16));
	} else
		outd(PORT_NB_PCI_CONFIG_DATA, value);
}

PCIDescriptor_t readPCIConfigCommonHeader(const PCIConfigAddress_t PCIAddress) {
	PCIDescriptor_t ret;
	uint32_t tmp = readPCIConfigD(PCIAddress, 0);
	ret.vendorID = (uint16_t)(tmp & 0xFFFF);
	ret.deviceID = (uint16_t)(tmp >> 16);
	tmp = readPCIConfigD(PCIAddress, 8);
	ret.revisionID = (uint8_t)(tmp & 0xFF);
	ret.progIF = (uint8_t)((tmp >> 8) & 0xFF);
	ret.subclass = (uint8_t)((tmp >> 16) & 0xFF);
	ret.classCode = (uint8_t)((tmp >> 24) & 0xFF);
	tmp = readPCIConfigD(PCIAddress, 12);
	ret.cacheLineSize = (uint8_t)(tmp & 0xFF);
	ret.headerType = (uint8_t)((tmp >> 16) & 0xFF);
	return ret;
}

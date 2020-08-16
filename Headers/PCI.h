#ifndef PCI_H
#define PCI_H

#include "Headers/debug.h"
#include "Headers/ports.h"

#define PCI_CLASS_CODE_UNCLASSIFIED 0x00
#define PCI_CLASS_CODE_MASS_STORAGE_CTRL 0x01
#define PCI_CLASS_CODE_NET_CTRL 0x02
#define PCI_CLASS_CODE_DISPLAY_CTRL 0x03
#define PCI_CLASS_CODE_MULTIMEDIA_CTRL 0x04
#define PCI_CLASS_CODE_MEMORY_CTRL 0x05
#define PCI_CLASS_CODE_BRIDGE_DEV 0x06
#define PCI_CLASS_CODE_SIMPLE_COM_CTRL 0x07
#define PCI_CLASS_CODE_BASE_SYSTEM_PERIPH 0x08
#define PCI_CLASS_CODE_INPUT_DEVICE_CTRL 0x09
#define PCI_CLASS_CODE_DOCKING_STATION 0x0A
#define PCI_CLASS_CODE_PROCESSOR 0x0B
#define PCI_CLASS_CODE_SERIAL_BUS_CTRL 0x0C
#define PCI_CLASS_CODE_WIRELESS_CTRL 0x0D
#define PCI_CLASS_CODE_INTELLIGENT_CTRL 0x0E
#define PCI_CLASS_CODE_SATELLITE_COM_CTRL 0x0F
#define PCI_CLASS_CODE_ENCRYPTION_CTRL 0x010
#define PCI_CLASS_CODE_SIGNAL_PROCESSING_CTRL 0x011
#define PCI_CLASS_CODE_PROC_ACCELERATOR 0x012
#define PCI_CLASS_CODE_NON_ESSENTIAL_INSTRU 0x013

#define PCI_STATUS_REGISTER_DETECTED_PARITY_ERROR 0b1000000000000000
#define PCI_STATUS_REGISTER_SIGNALED_SYSTEM_ERROR 0b0100000000000000
#define PCI_STATUS_REGISTER_RECEIVED_MASTER_ABORT 0b0010000000000000
#define PCI_STATUS_REGISTER_RECEIVED_TARGET_ABORT 0b0001000000000000
#define PCI_STATUS_REGISTER_SIGNALED_TARGET_ABORT 0b0000100000000000
#define PCI_STATUS_REGISTER_DEVSEL_TIMING 0b0000011000000000
#define PCI_STATUS_REGISTER_MASTER_DATA_PARITY_ERROR 0b0000000100000000
#define PCI_STATUS_REGISTER_FAST_BACK_TO_BACK_CAPABLE 0b0000000010000000
#define PCI_STATUS_REGISTER_66_MHZ_CAPABLE 0b0000000000100000
#define PCI_STATUS_REGISTER_CAPABILITIES_LIST 0b0000000000010000
#define PCI_STATUS_REGISTER_INTERRUPT_STATUS 0b0000000000001000

typedef struct {
	uint8_t function;
	uint8_t device;
	uint8_t bus;
} __attribute__((packed)) PCIConfigAddress_t;

typedef struct {
	uint16_t vendorID;
	uint16_t deviceID;
	uint8_t revisionID;
	uint8_t progIF;
	uint8_t subclass;
	uint8_t classCode;
	uint8_t cacheLineSize;
	uint8_t headerType;
} __attribute__((packed)) PCIDescriptor_t;

typedef struct {
	uint32_t BAR0;
	uint32_t BAR1;
	uint8_t primariBusNumber;
	uint8_t secondaryBusNumber;
	uint8_t subordinateBusNumber;
	uint8_t secondaryLatencyTimer;
	uint8_t IOBase;
	uint8_t IOLimit;
	uint16_t secondaryStatus;
	uint16_t memoryBase;
	uint16_t memoryLimit;
	uint16_t prefetchableMemoryBase;
	uint16_t prefetchableMemoryLimit;
	uint32_t prefetchableBaseUpper;
	uint32_t prefetchableLimitUpper;
	uint16_t IOBaseUpper;
	uint16_t IOLimitUpper;
	uint8_t capabilityPointer;
	uint32_t expansionROMBaseAddress;
	uint8_t interruptLine;
	uint8_t interruptPIN;
	uint16_t bridgeControl;
} __attribute__((packed)) PCIToPCIConfigHeader_t;

typedef struct {
	uint32_t CardbusSocketExCaBaseAddress;
	uint8_t offsetOfCapabilitiesList;
	uint16_t secondaryStatus;
	uint8_t PCIBusNumber;
	uint8_t cardbusBusNumber;
	uint8_t subordinateBusNumber;
	uint8_t CardbusLatencyTimer;
	uint32_t memoryBaseAddress0;
	uint32_t memoryLimit0;
	uint32_t memoryBaseAddress1;
	uint32_t memoryLimit1;
	uint32_t IOBaseAddress0;
	uint32_t IOLimit0;
	uint32_t IOBaseAddress;
	uint32_t IOLimit1;
	uint8_t interruptLine;
	uint8_t interruptPIN;
	uint16_t bridgeControl;
	uint16_t subsystemDeviceID;
	uint16_t subsystemVendorID;
	uint32_t PCCardLegacyModeBaseAddress;
} __attribute__((packed)) PCIToCardbusConfigHeader_t;

typedef struct {
	uint32_t BAR0;
	uint32_t BAR1;
	uint32_t BAR2;
	uint32_t BAR3;
	uint32_t BAR4;
	uint32_t BAR5;
	uint32_t cardbusCSPointer;
	uint16_t subsystemVendorID;
	uint16_t subsystemID;
	uint32_t expansionROMBaseAddress;
	uint8_t capabilitiesPointer;
	uint8_t interruptLine;
	uint8_t interruptPIN;
	uint8_t minGrant;
	uint8_t maxLatency;
} __attribute__((packed)) PCICardConfigHeader_t;

uint32_t readPCIConfigD(const PCIConfigAddress_t PCIAddress, const uint8_t offset);
void writePCIConfigD(const PCIConfigAddress_t PCIAddress, const uint8_t offset, const uint32_t value);

uint16_t readPCIConfigW(const PCIConfigAddress_t PCIAddress, const uint8_t offset);
void writePCIConfigW(const PCIConfigAddress_t PCIAddress, const uint8_t offset, const uint16_t value);

PCIDescriptor_t readPCIConfigCommonHeader(const PCIConfigAddress_t PCIAddress);

#endif //PCI_H
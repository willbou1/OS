#ifndef MULTIBOOT_H
#define MULTIBOOT_H

#include "Headers/types.h"

typedef struct {
	uint32_t size;
	uint32_t base_addr_low;
	uint32_t base_addr_high;
	uint32_t length_low;
	uint32_t length_high;
	uint32_t type;
} __attribute__ ((packed)) MBMMapEntry_t;

typedef struct {
	uint32_t flags;
	uint32_t mem_lower;
	uint32_t mem_upper;
	uint32_t boot_device;
	uint32_t cmdline;
	uint32_t mods_count;
	uint32_t mods_addr;
	union {
		struct {
			uint32_t tabsize;
			uint32_t strsize;
			uint32_t addr;
			uint32_t reserved;
		} __attribute__ ((packed)) syms;
		struct {
			uint32_t num;
			uint32_t size;
			uint32_t addr;
			uint32_t shndx;
		} __attribute__ ((packed)) secs;
	} syms_secs;
	uint32_t mmap_length;
	pAddr_t mmap_addr;
	uint32_t drives_length;
	pAddr_t drives_addr;
	uint32_t config_table;
	uint32_t boot_loader_name;
	uint32_t apm_table;
	uint32_t vbe_control_info;
	uint16_t vbe_mode_info;
	uint16_t vbe_mode;
	uint16_t vbe_interface_seg;
	uint16_t vbe_interface_off;
	uint16_t vbe_interface_len;
	uint32_t framebuffer_addr_low;
	uint32_t framebuffer_addr_high;
	uint32_t framebuffer_pitch;
	uint32_t framebuffer_width;
	uint32_t framebuffer_height;
	uint8_t framebuffer_bpp;
	uint8_t framebuffer_type;
	uint32_t color_info_low;
	uint8_t color_info_high;
} __attribute__ ((packed)) MBStructure_t;

#endif //MULTIBOOT_H
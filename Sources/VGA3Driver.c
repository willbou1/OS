#include "Headers/VGA3Driver.h"

uint8_t VGAXPos = 0, VGAYPos = 0;

void setVGATextPos(const uint8_t x, const uint8_t y) {
	VGAXPos = (x < 80) ? x : 0;
	VGAYPos = (y < 80) ? y : 0;
}

void incVGATextPosition() {
	VGAXPos++;
	if (VGAXPos == VGA_MODE_TEXT_WIDTH) {
		VGAYPos++;
		VGAXPos = 0;
	}
}

const uint16_t getVGATextBufferIndex() {
	return VGAYPos * VGA_MODE_TEXT_WIDTH + VGAXPos;
}

void writeVGAText(const char *const text, const uint8_t BGColor, const uint8_t FGColor, const uint8_t blink) {
	uint16_t *textBuffer = (uint16_t*)VGA_MODE_TEXT_BUFFER;
	for (uint16_t i = 0; *(text + i); i++) {
		textBuffer[getVGATextBufferIndex()] =
			((blink >= 1) << 15) | 
			((BGColor & 0b01111111) << 12) |
			(FGColor << 8) | text[i];
		incVGATextPosition();
	}
}

void setVGATextColor(const uint8_t BGColor, const uint8_t FGColor) {
	uint16_t *textBuffer = (uint16_t*)VGA_MODE_TEXT_BUFFER;
	for (uint16_t i = 0; i < VGA_MODE_TEXT_WIDTH * VGA_MODE_TEXT_HEIGHT; i++) {
		textBuffer[i] =
			(textBuffer[i] & 0x80FF) | 
			((BGColor & 0b01111111) << 12) |
			(FGColor << 8);
	}
}

void newLineGAText() {
	VGAYPos++;
	VGAXPos = 0;
}

void clearVGAText() {
	uint16_t *textBuffer = (uint16_t*)VGA_MODE_TEXT_BUFFER;
	for (uint16_t i = 0; i < VGA_MODE_TEXT_WIDTH * VGA_MODE_TEXT_HEIGHT; i++)
		*textBuffer = 0;
	VGAXPos = VGAYPos = 0;
}

void enableVGATextCursor(const uint8_t start, const uint8_t end) {
	outb(PORT_NB_VGA_INDEX_2, 0x0A);
	outb(PORT_NB_VGA_DATA_2,
		(inb(PORT_NB_VGA_DATA_2) & 0xC0) | start);
	outb(PORT_NB_VGA_INDEX_2, 0x0B);
	outb(PORT_NB_VGA_DATA_2,
		(inb(PORT_NB_VGA_DATA_2) & 0xE0) | end);
}

void disableVGATextCursor() {
	outb(PORT_NB_VGA_INDEX_2, 0x0A);
	outb(PORT_NB_VGA_DATA_2, 0x20);
}
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
	uint16_t *textBuffer = (uint16_t*)0xB8000;
	for (uint16_t i = 0; *(text + i); i++) {
		textBuffer[getVGATextBufferIndex()] =
			((blink >= 1) << 15) | 
			((BGColor & 0b01111111) << 12) |
			(FGColor << 8) | text[i];
		incVGATextPosition();
	}
}

void newLineGAText() {
	VGAYPos++;
	VGAXPos = 0;
}

void clearVGAText() {
	uint16_t *textBuffer = (uint16_t*)0xB8000;
	for (uint16_t i = 0; i < VGA_MODE_TEXT_WIDTH * VGA_MODE_TEXT_HEIGHT; i++)
		*textBuffer = 0;
	VGAXPos = VGAYPos = 0;
}

void enableVGATextCursor() {

}

void disableVGATextCursor() {

}
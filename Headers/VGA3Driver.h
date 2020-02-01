#ifndef VGA3_DRIVER_H
#define VGA3_DRIVER_H

#include "Headers/types.h"
#include "Headers/ports.h"

#define VGA_MODE_TEXT_WIDTH 80
#define VGA_MODE_TEXT_HEIGHT 25

#define VGA_MODE_TEXT_COLOR_BLACK 0
#define VGA_MODE_TEXT_COLOR_BLUE 1
#define VGA_MODE_TEXT_COLOR_GREEN 2
#define VGA_MODE_TEXT_COLOR_CYAN 3
#define VGA_MODE_TEXT_COLOR_RED 4
#define VGA_MODE_TEXT_COLOR_MAGENTA 5
#define VGA_MODE_TEXT_COLOR_BROWN 6
#define VGA_MODE_TEXT_COLOR_LIGHT_GRAY 7
#define VGA_MODE_TEXT_COLOR_DARK_GRAY 8
#define VGA_MODE_TEXT_COLOR_LIGHT_BLUE 9
#define VGA_MODE_TEXT_COLOR_LIGHT_GREEN 10
#define VGA_MODE_TEXT_COLOR_LIGHT_CYAN 11
#define VGA_MODE_TEXT_COLOR_LIGHT_RED 12
#define VGA_MODE_TEXT_COLOR_PINK 13
#define VGA_MODE_TEXT_COLOR_YELLOW 14
#define VGA_MODE_TEXT_COLOR_WHITE 15

extern uint8_t VGAXPos, VGAYPos;

void setVGATextPos(const uint8_t x, const uint8_t y);
void incVGATextPosition();
const uint16_t getVGATextBufferIndex();

void writeVGAText(const char *const text, const uint8_t BGColor, const uint8_t FGColor, const uint8_t blink);
void newLineGAText();
void clearVGAText();

void enableVGATextCursor();
void disableVGATextCursor();

#endif /VGA3_DRIVER_H
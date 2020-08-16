#ifndef DEBUG_H
#define DEBUG_H

#include "Headers/types.h"

#define VGA_MODE_TEXT_BUFFER 0xC03FF000;

uint32_t position;

void clearScreen();

void backUp();

void printf(char *str);

void hexDump(const uint8_t *const base, const uint32_t length);

void printRegisters();

#endif //DEBUG_H
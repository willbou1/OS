#ifndef DEBUG_H
#define DEBUG_H

#include "Headers/types.h"

uint32_t position;

void clearScreen();

void backUp();

void printf(char *str);

void hexDump(const uint8_t *const base, const uint32_t length);

void printRegisters();

#endif //DEBUG_H
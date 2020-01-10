#ifndef KEYBOARD_DRIVER_H
#define KEYBOARD_DRIVER_H

#include "Headers/types.h"
#include "Headers/interrupts.h"
#include "Headers/debug.h"
#include "Headers/ports.h"

void initializeKeyboardDriver();

void keyboardInterruptHandler();

#endif //KEYBOARD_DRIVER_H
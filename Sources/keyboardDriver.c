#include "Headers/keyboardDriver.h"

const uint8_t SCANCODE_SET_3[256] = {
	0, 0, 0, 0, 0, 0, 0, KEYBOARD_F1, 0, 0,
	0, KEYBOARD_ESC, 0, KEYBOARD_TAB, 0, KEYBOARD_F2, 0, KEYBOARD_L_CTRL, KEYBOARD_L_SHIFT, 0,
	KEYBOARD_CAPS, 'q', '1', KEYBOARD_F3, KEYBOARD_L_ALT, 0, 'z', 's', 'a', 'w',
	'2', KEYBOARD_F4, 0, 'c', 'x', 'd', 'e', '4', '3', KEYBOARD_F5,
	0, ' ', 'v', 'f', 't', 'r', '5', KEYBOARD_F6, 0, 'n',
	'b', 'h', 'g', 'y', '6', KEYBOARD_F7, 0, KEYBOARD_R_ALT, 'm', 'j',
	'u', '7', '8', KEYBOARD_F8, 0, ',', 'k', 'i', 'o', '0',
	'9', KEYBOARD_F9, 0, '.', KEYBOARD_NP_SLASH, 'l', ';', 'p', '-', KEYBOARD_F10,
	0, 0, '\'', 0, '^', '=', KEYBOARD_F11, KEYBOARD_PRNT_SCRN, KEYBOARD_R_CTRL, KEYBOARD_R_SHIFT,
	KEYBOARD_ENTER, 0, '/', 0, KEYBOARD_F12, KEYBOARD_SCROLL, KEYBOARD_DOWN_ARROW, KEYBOARD_LEFT_ARROW, KEYBOARD_PAUSE, KEYBOARD_UP_ARROW,
	KEYBOARD_DELETE, KEYBOARD_END, KEYBOARD_BKSP, KEYBOARD_INSERT, KEYBOARD_NP_4, KEYBOARD_NP_1, KEYBOARD_RIGHT_ARROW, 0, KEYBOARD_NP_7, KEYBOARD_PG_DN,
	KEYBOARD_HOME, KEYBOARD_PG_UP, KEYBOARD_NP_0, KEYBOARD_NP_DOT, KEYBOARD_NP_2, KEYBOARD_NP_5, KEYBOARD_NP_6, KEYBOARD_NP_8, KEYBOARD_NUM, 0,
	0, KEYBOARD_NP_EN, KEYBOARD_NP_3, 0, KEYBOARD_NP_PLUS, KEYBOARD_NP_7, KEYBOARD_NP_STAR, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_L_WIN,
	KEYBOARD_R_WIN, KEYBOARD_APPS, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_BREAK, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	KEYBOARD_ACK, 0, 0, 0, KEYBOARD_RESEND, 0
};

const uint8_t SCANCODE_SET_3_CAPS[256] = {
	0, 0, 0, 0, 0, 0, 0, KEYBOARD_F1, 0, 0,
	0, KEYBOARD_ESC, 0, KEYBOARD_TAB, 0, KEYBOARD_F2, 0, KEYBOARD_L_CTRL, KEYBOARD_L_SHIFT, 0,
	KEYBOARD_CAPS, 'Q', '!', KEYBOARD_F3, KEYBOARD_L_ALT, 0, 'Z', 'S', 'A', 'W',
	'@', KEYBOARD_F4, 0, 'C', 'X', 'D', 'E', '$', '#', KEYBOARD_F5,
	0, ' ', 'V', 'F', 'T', 'R', '%', KEYBOARD_F6, 0, 'N',
	'B', 'H', 'G', 'Y', '?', KEYBOARD_F7, 0, KEYBOARD_R_ALT, 'M', 'J',
	'U', '&', '*', KEYBOARD_F8, 0, '\'', 'K', 'I', 'O', ')',
	'(', KEYBOARD_F9, 0, '"', KEYBOARD_NP_SLASH, 'L', ':', 'P', '_', KEYBOARD_F10,
	0, 0, '\'', 0, 0, '+', KEYBOARD_F11, KEYBOARD_PRNT_SCRN, KEYBOARD_R_CTRL, KEYBOARD_R_SHIFT,
	KEYBOARD_ENTER, 0, '\\', 0, KEYBOARD_F12, KEYBOARD_SCROLL, KEYBOARD_DOWN_ARROW, KEYBOARD_LEFT_ARROW, KEYBOARD_PAUSE, KEYBOARD_UP_ARROW,
	KEYBOARD_DELETE, KEYBOARD_END, KEYBOARD_BKSP, KEYBOARD_INSERT, KEYBOARD_NP_4, KEYBOARD_NP_1, KEYBOARD_RIGHT_ARROW, 0, KEYBOARD_NP_7, KEYBOARD_PG_DN,
	KEYBOARD_HOME, KEYBOARD_PG_UP, KEYBOARD_NP_0, KEYBOARD_NP_DOT, KEYBOARD_NP_2, KEYBOARD_NP_5, KEYBOARD_NP_6, KEYBOARD_NP_8, KEYBOARD_NUM, 0,
	0, KEYBOARD_NP_EN, KEYBOARD_NP_3, 0, KEYBOARD_NP_PLUS, KEYBOARD_NP_7, KEYBOARD_NP_STAR, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_L_WIN,
	KEYBOARD_R_WIN, KEYBOARD_APPS, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_BREAK, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	KEYBOARD_ACK, 0, 0, 0, KEYBOARD_RESEND, 0
};

const uint8_t SCANCODE_SET_3_ALT[256] = {
	0, 0, 0, 0, 0, 0, 0, KEYBOARD_F1, 0, 0,
	0, KEYBOARD_ESC, 0, KEYBOARD_TAB, 0, KEYBOARD_F2, 0, KEYBOARD_L_CTRL, KEYBOARD_L_SHIFT, 0,
	KEYBOARD_CAPS, 'q', '1', KEYBOARD_F3, KEYBOARD_L_ALT, 0, 'z', 's', 'a', 'w',
	'2', KEYBOARD_F4, 0, 'c', 'x', 'd', 'e', 0, '3', KEYBOARD_F5,
	0, ' ', 'v', 'f', 't', 'r', '5', KEYBOARD_F6, 0, 'n',
	'b', 'h', 'g', 'y', '6', KEYBOARD_F7, 0, KEYBOARD_R_ALT, 'm', 'j',
	'u', '{', '}', KEYBOARD_F8, 0, '<', 'k', 'i', 'o', ']',
	'[', KEYBOARD_F9, 0, '>', KEYBOARD_NP_SLASH, 'l', ';', 'p', '-', KEYBOARD_F10,
	0, 0, '\'', 0, '^', '=', KEYBOARD_F11, KEYBOARD_PRNT_SCRN, KEYBOARD_R_CTRL, KEYBOARD_R_SHIFT,
	KEYBOARD_ENTER, 0, '/', 0, KEYBOARD_F12, KEYBOARD_SCROLL, KEYBOARD_DOWN_ARROW, KEYBOARD_LEFT_ARROW, KEYBOARD_PAUSE, KEYBOARD_UP_ARROW,
	KEYBOARD_DELETE, KEYBOARD_END, KEYBOARD_BKSP, KEYBOARD_INSERT, KEYBOARD_NP_4, KEYBOARD_NP_1, KEYBOARD_RIGHT_ARROW, 0, KEYBOARD_NP_7, KEYBOARD_PG_DN,
	KEYBOARD_HOME, KEYBOARD_PG_UP, KEYBOARD_NP_0, KEYBOARD_NP_DOT, KEYBOARD_NP_2, KEYBOARD_NP_5, KEYBOARD_NP_6, KEYBOARD_NP_8, KEYBOARD_NUM, 0,
	0, KEYBOARD_NP_EN, KEYBOARD_NP_3, 0, KEYBOARD_NP_PLUS, KEYBOARD_NP_7, KEYBOARD_NP_STAR, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_L_WIN,
	KEYBOARD_R_WIN, KEYBOARD_APPS, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, KEYBOARD_BREAK, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	KEYBOARD_ACK, 0, 0, 0, KEYBOARD_RESEND, 0
};

keyboardFlags_t keyboardFlags = {
	false, false, false, false, false
};

void initKeyboardDriver() {
	//Hooking IRQ 1
	IRQHandlers[1] = &keyboardInterruptHandler;
	//Deactivating PS2 controller scancode set translation
	outb(PORT_NB_PS2_CMD_REG, 0x20);
	while (inb(PORT_NB_PS2_STATUS_REG) & 1 == 0) {}
	uint8_t config = inb(PORT_NB_PS2_DATA) & 0b10111111;
	outb(PORT_NB_PS2_CMD_REG, 0x60);
	while (inb(PORT_NB_PS2_STATUS_REG) & 2 == 0) {}
	outb(PORT_NB_PS2_DATA, config);
	//Setting KB's scancoode to 3
	sendCMDKeyboard(0xF0);
	sendCMDKeyboard(3);
	//Setting CAPS to make brake only
	/*sendCMDKeyboard(0xFC);
	sendCMDKeyboard(0x14);
	sendCMDKeyboard(0xFC);
	printf("hello");*/
}

void sendCMDKeyboard(const uint8_t cmd) {
	do {
		outb(PORT_NB_PS2_DATA, cmd);
	} while (keyboardFlags.RESEND);
}

void keyboardInterruptHandler() {
	uint8_t scancode = inb(PORT_NB_PS2_DATA);
	switch (SCANCODE_SET_3[scancode]) {
	case KEYBOARD_ACK:
		keyboardFlags.RESEND = false;
		break;
	case KEYBOARD_RESEND:
		keyboardFlags.RESEND = true;
		break;
	case KEYBOARD_BREAK:
		keyboardFlags.BREAK = true;
		break;
	case KEYBOARD_CAPS:
		if (!keyboardFlags.BREAK)
			keyboardFlags.capsLockEnabled = !keyboardFlags.capsLockEnabled;
		else
			keyboardFlags.BREAK = false;
		break;
	case KEYBOARD_L_SHIFT:
	case KEYBOARD_R_SHIFT:
		if (!keyboardFlags.BREAK)
			keyboardFlags.shiftEnabled = true;
		else {
			keyboardFlags.shiftEnabled = false;
			keyboardFlags.BREAK = false;
		}
		break;
	case KEYBOARD_R_ALT:
		if (!keyboardFlags.BREAK)
			keyboardFlags.altEnabled = true;
		else {
			keyboardFlags.altEnabled = false;
			keyboardFlags.BREAK = false;
		}
		break;
	default:
		if (!keyboardFlags.BREAK) {
			uint8_t test[2];
			if (keyboardFlags.capsLockEnabled | keyboardFlags.shiftEnabled)
				test[0] = SCANCODE_SET_3_CAPS[scancode];
			else if (keyboardFlags.altEnabled)
				test[0] = SCANCODE_SET_3_ALT[scancode];
			else
				test[0] = SCANCODE_SET_3[scancode];
			test[1] = 0;
			printf(test);
		} else {
			keyboardFlags.BREAK = false;
		}
	}
}

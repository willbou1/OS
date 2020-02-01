#ifndef KEYBOARD_DRIVER_H
#define KEYBOARD_DRIVER_H

#include "Headers/types.h"
#include "Headers/interrupts.h"
#include "Headers/debug.h"
#include "Headers/ports.h"

#define KEYBOARD_BKSP 130
#define KEYBOARD_TAB 131
#define KEYBOARD_CAPS 132
#define KEYBOARD_L_SHIFT 133
#define KEYBOARD_L_CTRL 134
#define KEYBOARD_L_WIN 135
#define KEYBOARD_L_ALT 136
#define KEYBOARD_R_SHIFT 137
#define KEYBOARD_R_CTRL 138
#define KEYBOARD_R_WIN 139
#define KEYBOARD_R_ALT 140
#define KEYBOARD_APPS 141
#define KEYBOARD_ENTER 142
#define KEYBOARD_ESC 143
#define KEYBOARD_F1 144
#define KEYBOARD_F2 145
#define KEYBOARD_F3 146
#define KEYBOARD_F4 147
#define KEYBOARD_F5 148
#define KEYBOARD_F6 149
#define KEYBOARD_F7 150
#define KEYBOARD_F8 151
#define KEYBOARD_F9 152
#define KEYBOARD_F10 153
#define KEYBOARD_F11 154
#define KEYBOARD_F12 155
#define KEYBOARD_PRNT_SCRN 156
#define KEYBOARD_SCROLL 157
#define KEYBOARD_PAUSE 158
#define KEYBOARD_INSERT 159
#define KEYBOARD_HOME 160
#define KEYBOARD_PG_UP 161
#define KEYBOARD_DELETE 162
#define KEYBOARD_PG_DN 163
#define KEYBOARD_UP_ARROW 164
#define KEYBOARD_DOWN_ARROW 165
#define KEYBOARD_LEFT_ARROW 166
#define KEYBOARD_RIGHT_ARROW 167
#define KEYBOARD_NP_SLASH 168
#define KEYBOARD_NP_STAR 169
#define KEYBOARD_NP_MINUS 170
#define KEYBOARD_NP_PLUS 171
#define KEYBOARD_NP_EN 172
#define KEYBOARD_NP_0 173
#define KEYBOARD_NP_1 174
#define KEYBOARD_NP_2 175
#define KEYBOARD_NP_3 176
#define KEYBOARD_NP_4 177
#define KEYBOARD_NP_5 178
#define KEYBOARD_NP_6 179
#define KEYBOARD_NP_7 180
#define KEYBOARD_NP_8 181
#define KEYBOARD_NP_9 182
#define KEYBOARD_END 183
#define KEYBOARD_NUM 184
#define KEYBOARD_NP_DOT 185

#define KEYBOARD_ACK 186
#define KEYBOARD_RESEND 187
#define KEYBOARD_BREAK 188

extern const uint8_t SCANCODE_SET_3[256];
extern const uint8_t SCANCODE_SET_3_CAPS[256];
extern const uint8_t SCANCODE_SET_3_ALT[256];

typedef struct {
	uint8_t RESEND;
	uint8_t BREAK;
	uint8_t capsLockEnabled;
	uint8_t shiftEnabled;
	uint8_t altEnabled;
} keyboardFlags_t;

extern keyboardFlags_t keyboardFlags;

void initKeyboardDriver();
void sendCMDKeyboard(const uint8_t cmd);

void keyboardInterruptHandler();

#endif //KEYBOARD_DRIVER_H
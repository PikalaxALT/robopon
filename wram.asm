INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $1fa ; c006
wLCD:: ds $13 ; c200
wc213:: ds $e8 ; c213
wSystemTypeTemp:: ; c2fb

SECTION "OAM Buffer", WRAM0 [$c300]
wOAMBuffer:: ds 4 * 40 ; c300

SECTION "Stack", WRAM0 [$df00]
wStackBottom:: ds $100 ; df00
wStackTop:: ; e000

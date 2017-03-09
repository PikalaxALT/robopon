INCLUDE "includes.asm"

SECTION "WRAM0", WRAM0
wTimer:: ds $3 ; c000
wSerial:: ds $3 ; c003
wVBlank:: ds $1fa ; c006
wLCD:: ds $100 ; c200
wOAMBuffer:: ds 4 * 40 ; c300

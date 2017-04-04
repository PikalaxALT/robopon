Func_022c: ; 22c (0:022c)
	ld l, Func_70000_1c % $100
	jr asm_0253

UpdateSoundPredef: ; 230 (0:0230)
	ld l, UpdateSound_1c % $100
	jr asm_0253

StartSongPredef: ; 234 (0:0234)
	ld l, StartSong_1c % $100
	jr asm_0253

Func_0238: ; 238 (0:0238)
	cp 60
	ret c
	sub 20
	ld l, Func_70009_1c % $100
	jr asm_0253

Func_0241: ; 241 (0:0241)
	ld l, Func_7000c_1c % $100
	jr asm_0253

Func_0245: ; 245 (0:0245)
	ld l, CheckSongFinished_1c % $100
	jr asm_0253

Func_0249: ; 249 (0:0249)
	ld l, CheckSFXFinished_1c % $100
	jr asm_0253

Func_024d: ; 24d (0:024d)
	ld l, ToggleMusic_1c % $100
	jr asm_0253

Func_0251: ; 251 (0:0251)
	ld l, SetVolume_1c % $100
asm_0253
	ld h, Func_70000_1c / $100
	push af
	call .Bank1CCall
	pop hl
	push af
	ld a, h
	jr .BankSwitchBack

.Bank1CCall: ; 25e (0:025e)
	push hl
	push af
	ld a, [hROMBank]
	ld hl, sp+$7
	ld [hl], a
	ld a, BANK(Func_70000_1c)
.BankSwitchBack
	call BankSwitch_0020
	pop af
	ret

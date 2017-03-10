INCLUDE "includes.asm"

SECTION "rst $00", HOME [$00]
	jp Func_0388

SECTION "rst $08", HOME [$08]
	jp Func_0068
Bank_000b:
	db BANK(Func_78100)
Bank_000c:
	db $1e
Byte_000d:
	db $4a
Banks_000e:
	db BANK(Pointers_78000), BANK(Pointers_7c000)

SECTION "rst $10", HOME [$10]
	jp Func_00c9
	db $01, $08, $01, $f0, $a1

SECTION "rst $20", HOME [$20]
BankSwitch_0020:
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret


SECTION "VBlankInt", HOME [$40]
	jp wVBlank

SECTION "HBlankInt", HOME [$48]
	jp wLCD

SECTION "TimerInt", HOME [$50]
	jp wTimer
	jp Func_021c

SECTION "SerialInt", HOME [$58]
	jp wSerial


SECTION "High Home", HOME [$68]
Func_0068: ; 68 (0:0068)
	add sp, -$5
	push af
	push de
	push hl
	ld hl, sp+$b
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ld e, a
	ld a, [Byte_000d] ; 4a
	cp e
	jr c, .asm_0093
	ld d, $0
	ld hl, Pointers_01e0
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$9
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	pop de
	pop af
	add sp, $3
	ret

.asm_0093
	ld d, e
	dec hl
	ld a, [hROMBank]
	ld [hld], a
	ld [hl], .Return / $100
	dec hl
	ld [hl], .Return % $100
	sla e
	ld a, d
	rlca
	and $1
	add Banks_000e
	ld l, a
	ld h, $0
	ld a, [hl]
	call BankSwitch_00f7
	ld hl, Pointers_78000
	ld d, l
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$6
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	pop de
	pop af
	ret

.Return
	push af
	push hl
	ld hl, sp+$4
	ld a, [hl]
	call BankSwitch_00f7
	pop hl
	pop af
	inc sp
	ret

Func_00c9: ; c9 (0:00c9)
	push af
	push af
	push de
	push hl
	ld hl, sp+$8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	push hl
	dec hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, sp+$b
	ld [hl], d
	dec hl
	ld [hl], e
	pop de
	inc de
	dec hl
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	pop de
	pop af
	ret

Func_00e9:
	xor a
	ld [hSRAMBank], a
	inc a
	ld [HuC3LatchClock], a
	xor a
	ld [HuC3SRamEnable], a
	ld a, [Bank_000c]
BankSwitch_00f7: ; f7 (0:00f7)
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

SECTION "Init", HOME [$100]
Init:
	nop
	jp Start

SECTION "Header", HOME [$104]
	ds $150 - $104

SECTION "Home", HOME [$150]
Func_0150:
	ld a, [Bank_000b]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	jp Func_78100

Func_015b:
	ld a, b
	or c
	ret z
	ld a, [$ff86]
	or a
	jr z, .asm_0174
	ld a, h
	and $e0
	cp $80
	jr z, .asm_017d
	ld a, d
	and $e0
	cp $80
	jr nz, .asm_0174
	rst $08
	db $fe
	ret

.asm_0174
	ld a, [de]
	inc de
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0174
	ret

.asm_017d
	ld a, b
	or a
.asm_017f
	push af
	rst $08
	db $fd
	pop af
	push af
	jr nz, .asm_018a
	ld a, b
	cp c
	jr nc, .asm_01a5
.asm_018a
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call Func_01a6
	pop bc
	pop hl
	add hl, bc
	pop bc
	pop af
	push hl
	ld l, b
	ld b, a
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	pop hl
	jr .asm_017f

.asm_01a5
	pop af
Func_01a6: ; 1a6 (0:01a6)
	rst $08
	db $ff
.asm_01a8
	ld a, [de]
	inc de
	ld [hl], a
	inc l
	dec c
	jr nz, .asm_01a8
	di
	ld a, l
	ld [$ff87], a
	ld a, [$ff89]
	add b
	ld [$ff89], a
	ei
Func_01b9:
	ret

SECTION "01e0", HOME [$1e0]
Pointers_01e0:
	dw Func_00e9
	dw Func_0150
	dw Func_015b
	dw $6f00
	dw $6f30
	dw $6f39
	dw $76d3
	dw $76ec
	dw $770d
	dw Func_02fd
	dw Func_01b9
	dw Func_01b9
	dw Func_01b9
	dw Func_01b9
	dw Func_01b9
	dw Func_01b9
	dw Func_0296
	dw Func_022c
	dw Func_0230
	dw Func_0234
	dw Func_0238
	dw Func_0241
	dw Func_0245
	dw Func_0249
	dw Func_024d
	dw Func_0251
	dw Func_0218
	dw Func_026c

Func_0218:
	ld de, $1c7d
	ret

Func_021c: ; 21c (0:021c)
	push af
	push bc
	push de
	push hl
	ld a, [$ff99]
	bit 2, a
	call nz, Func_0230
	pop hl
	pop de
	pop bc
	pop af
	reti

Func_022c: ; 22c (0:022c)
	ld l, Func_70000 % $100
	jr asm_0253

Func_0230: ; 230 (0:0230)
	ld l, Func_70003 % $100
	jr asm_0253

Func_0234: ; 234 (0:0234)
	ld l, Func_70006 % $100
	jr asm_0253

Func_0238: ; 238 (0:0238)
	cp 60
	ret c
	sub 20
	ld l, Func_70009 % $100
	jr asm_0253

Func_0241: ; 241 (0:0241)
	ld l, Func_7000c % $100
	jr asm_0253

Func_0245: ; 245 (0:0245)
	ld l, Func_7000f % $100
	jr asm_0253

Func_0249: ; 249 (0:0249)
	ld l, Func_70012 % $100
	jr asm_0253

Func_024d: ; 24d (0:024d)
	ld l, Func_70015 % $100
	jr asm_0253

Func_0251: ; 251 (0:0251)
	ld l, Func_70018 % $100
asm_0253
	ld h, Func_70000 / $100
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
	ld a, BANK(Func_70000)
.BankSwitchBack
	call BankSwitch_0020
	pop af
	ret

Func_026c: ; 26c (0:026c)
	ld a, d
	cp $80
	ret c
	cp $a0
	jp c, Func_03d3
	cp $c0
	jr c, .asm_0286
	cp $e0
	jp nc, Func_03d3
	sub $c0
	rst $08
	db $50
	jp c, Func_03d3
	ret

.asm_0286
	sub $a0
	rst $08
	db $bc
	jp c, Func_03d3
	ret

Func_028e:
	di
	ld sp, wStackTop
	rst $08
	db $00
	rst $08
	db $6e
Func_0296: ; 296 (0:0296)
	ld hl, Func_0296
	rst $08
	db $6f
	jp Func_0300

SECTION "02fd", HOME [$2fd]
Func_02fd: ; 2fd (0:02fd)
	jp Func_0309

Func_0300: ; 300 (0:0300)
	jp Func_030a

Func_0303:
	jp Func_03a4

Func_0306:
	jp Func_03d1

Func_0309: ; 309 (0:0309)
	ret

Func_030a: ; 30a (0:030a)
	ld bc, $a0000 / $10000
.asm_030d
	ld hl, $10000 % $10000
.asm_0310
	dec hl
	ld a, l
	or h
	jr nz, .asm_0310
	dec bc
	ld a, c
	or b
	jr nz, .asm_030d
	di
	ld sp, wStackTop
	rst $08
	db $00
	call Func_1a90
Start: ; 323 (0:0323)
	di
	ld sp, wStackTop
	ld [hSystemType], a
	push af
Func_032a: ; 32a (0:032a)
	ld a, [rLY]
	cp $91
	jp nc, Func_032a
Func_0331: ; 331 (0:0331)
	ld a, [rLY]
	cp $91
	jp c, Func_0331
	ld a, [rLCDC]
	and $7f
	ld [rLCDC], a
	hlbgcoord 0, 0
	ld bc, $400
.asm_0344
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0344
	ld a, [rLCDC]
	or $80
	ld [rLCDC], a
	pop af
	di
	ld sp, wStackTop
	push af
	rst $08
	db $00
	rst $08
	db $11
	ld a, BANK(Func_63141)
	call BankSwitch_03f2
	pop af
	push af
	call Func_63141
	di
	pop af
	ld [wSystemTypeTemp], a
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch_03f2
	ld a, $3
	call Func_03d5
	call Func_4064
	ld a, BANK(Func_fe102)
	call BankSwitch_03f2
	call Func_fe102
	ld a, [wSystemTypeTemp]
	ld [hSystemType], a
Func_0388: ; 388 (0:0388)
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch_03f2
	ld a, $3
	call Func_03d5
	call Func_4064
	call Func_1a90
	ld a, BANK(Func_4000)
	call BankSwitch_03f2
	jp Func_4000

Func_03a4: ; 3a4 (0:03a4)
	ld a, [hSystemType]
	ld [wSystemTypeTemp], a
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch_03f2
	ld a, $3
	call Func_03d5
	call Func_4064
	call Func_1a90
	ld a, $ff
	ld [wc213], a
	ld a, BANK(Func_4000)
	call BankSwitch_03f2
	call Func_4000
	xor a
	ld [wc213], a
	jp Func_1e4d

Func_03d1: ; 3d1 (0:03d1)
	scf
	ret

Func_03d3: ; 3d3 (0:03d3)
	scf
	ret

Func_03d5: ; 3d5 (0:03d5)
	bit 7, a
	jr nz, .asm_03e4
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	ld a, SRAM_ENABLE
	ld [HuC3SRamEnable], a
	ret

.asm_03e4
	set 7, a
	ld [hSRAMBank], a
	res 7, a
	ld [HuC3SRamBank], a
	xor a
	ld [HuC3SRamEnable], a
	ret

BankSwitch_03f2:
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

Func_03f8:
	push hl
	push bc
	ld hl, sp+$0
	ld bc, $27f0
	add hl, bc
	bit 7, h
	jr z, .asm_0417
	di
	ld hl, sp+$4
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [hROMBank]
	ld c, a
	ld b, $ff
	ld hl, sp+$0
	ld sp, wStackTop
	jp Func_1d00

.asm_0417
	pop bc
	pop hl
	ld [$c212], a
	ld a, [hROMBank]
	push af
	ld a, [$c21a]
	call BankSwitch_03f2
	ld a, l
	ld [$c218], a
	ld a, h
	ld [$c219], a
	ld hl, .Return
	push hl
	ld a, [$c21b]
	ld l, a
	ld a, [$c21c]
	ld h, a
	push hl
	ld a, [$c219]
	ld h, a
	ld a, [$c218]
	ld l, a
	ld a, [$c212]
	ret

.Return:
	ld [$c212], a
	pop af
	call BankSwitch_03f2
	ld a, [$c212]
	ret

Func_0451:
	push bc
	ld a, [$c39e]
	push af
	xor a
	ld [$c39e], a
	call Func_0465
	ld c, a
	pop af
	ld [$c39e], a
	ld a, c
	pop bc
	ret

Func_0465: ; 465 (0:0465)
	push bc
	ld a, [$c209]
	ld c, a
.asm_046a
	halt
	ld a, [$c207]
	ld b, a
	ld a, [$c209]
	cp c
	jr z, .asm_046a
	ld a, b
	push af
	call Func_1b28
	pop af
	pop bc
	ret

.asm_047e
	ld a, [de]
	inc de
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_047e
	ret

.asm_0487
	ld a, e
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0487
	ret

SECTION "0500", HOME [$500]
Func_0500:
	ld sp, wStackTop
	di
	rst $08
	db $00
	ld a, $7
	ld [$c654], a
	ld a, $ff
	ld [$c655], a
	ld a, $20
	rst $08
	db $b3
	ld hl, $400
	rst $08
	db $ca
Func_0519: ; 519 (0:0519)
	call Func_07a2
	ld de, $204
	rst $08
	db $57
	ld c, $80
	ld de, $59c
	ld a, [$c654]
	ld b, a
	ld a, [$c655]
.asm_052d
	push bc
	push hl
	push af
	ld a, c
	ld c, l
	ld b, h
	ld l, e
	ld h, d
	ld d, a
	ld e, $7
	pop af
	rrca
	push af
	call Func_058a
	pop af
	ld e, l
	ld d, h
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	inc c
	dec b
	jr nz, .asm_052d
	ld hl, Data_065e
	call Func_083b
	ld a, $1
	rst $08
	db $b4
	ld c, $0
.asm_0557
	ld a, [$c654]
	ld b, a
	ld hl, $104
	ld d, $20
	ld e, $3e
	rst $08
	db $5e
	jr c, .asm_0588
	ld c, a
	inc a
	call Func_0739
	ld h, a
	ld a, [$c655]
	and h
	jr z, .asm_0557
	ld l, c
	ld h, $0
	rst $08
	db $06
	ld [$117], sp
	push af
	ld bc, $1fb
	ld bc, $702
	ld [bc], a
	dec c
	ld [bc], a
	inc de
	ld [bc], a
	ld [bc], a
	nop
.asm_0588
	rst $08
	db $01
Func_058a: ; 58a (0:058a)
	jr nc, .asm_058f
	rst $08
	db $5b
	ret

.asm_058f
	ld a, [hli]
	or a
	jr nz, .asm_058f
	ld a, $d
	rst $08
	db $b9
	ld a, $1
	rst $08
	db $b9
	ret

Data_059c:
	dr $59c, $65e

Data_065e:
	dr $65e, $739

Func_0739: ; 739 (0:0739)
	push bc
	ld c, a
	ld a, $80
.asm_073d
	rlca
	dec c
	jr nz, .asm_073d
	pop bc
	ret

Data_0743:
	dr $743, $76f

Func_076f:
	ld de, $4000
	ld a, $7
	call Func_0856
	ld de, $4000
	ld a, $9
	call Func_0856
	ld de, $4000
	ld a, $b
	call Func_0856
	ld de, $4000
	ld a, $d
.asm_078c
	call Func_0856
	ld de, $4000
	ld a, $e
	call Func_0856
	ld de, $4000
	ld a, $f
	call Func_0856
	jp Func_0519

Func_07a2: ; 7a2 (0:07a2)
	rst $08
	db $b5
	ld a, $c
	rst $08
	db $b9
	ld hl, $8800
	ld e, $0
	ld bc, $a00
	rst $08
	db $a6
	ld de, $3
	ld bc, $1409
	rst $08
	db $58
	ld a, $80
	ld de, $204
	ld bc, $1007
	ld hl, $701
	rst $08
	db $59
	ld de, $d
	ld bc, $1405
	rst $08
	db $58
	ld a, $f0
	ld de, $20e
	ld bc, $1003
	ld hl, $301
	rst $08
	db $59
	ld hl, $101
	rst $08
	db $b8
	ld hl, Data_07e7
	rst $08
	db $69
	ret

Data_07e7:
	dr $7e7, $7fa

Data_07fa:
	dr $7fa, $83b

Func_083b: ; 83b (0:083b)
	bcbgcoord 2, 14
Func_083e: ; 83e (0:083e)
	ld d, $f0
	ld e, $3
.asm_0842
	ld a, [hl]
	or a
	ret z
	push de
	push bc
	rst $08
	db $5b
	pop bc
	ld a, $20
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	pop de
	inc d
	jr .asm_0842

Func_0856: ; 856 (0:0856)
	ld hl, $c600
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
Func_085d: ; 85d (0:085d)
	call Func_07a2
	ld hl, Data_07fa
	call Func_083b
	ld a, [hROMBank]
	push af
	ld hl, $c600
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld hl, $c604
	ld bc, $28
	rst $08
	db $02
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld de, $304
	rst $08
	db $57
	ld b, $7
	ld c, $87
	ld de, $c604
Func_088f: ; 88f (0:088f)
	push bc
	push hl
	ld l, e
	ld h, d
	ld a, [hli]
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	or a
	jr z, .asm_08da
	ld a, [hROMBank]
	push af
	ld a, b
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, d
	cp $80
	jr c, .asm_08af
	sub $40
	ld d, a
.asm_08af
	push bc
	ld hl, $c634
	ld bc, $20
	rst $08
	db $02
	pop bc
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld d, c
	ld e, $7
	pop hl
	pop bc
	push bc
	push hl
	ld hl, $c638
	rst $08
	db $5b
	pop de
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	inc c
	dec b
	jp nz, Func_088f
	push bc
	push hl
	push de
.asm_08da
	ld a, $1
	rst $08
	db $b4
	pop de
	pop hl
	pop bc
	ld a, $7
	sub b
	ld b, a
	ld c, $0
.asm_08e7
	ld hl, $104
	ld d, $20
	ld e, $3e
	push bc
	rst $08
	db $5e
	pop bc
	jr c, .asm_08ff
	ld c, a
	push bc
	call Func_0906
	pop bc
	jr nc, .asm_08e7
	jp Func_085d

.asm_08ff
	ld a, [$ff8a]
	and $4
	ret z
	rst $08
	db $01
Func_0906: ; 906 (0:0906)
	ld hl, $c604
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	or a
	scf
	ret z
	ld a, [$ff8a]
	ld [$c660], a
	ld a, [hROMBank]
	ld [$c65f], a
	push af
	ld a, [hli]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $80
	jr c, .asm_092f
	sub $40
	ld h, a
.asm_092f
	ld a, [hli]
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	cp $44
	jr z, .asm_09a2
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	push bc
	push de
	ld a, $4
	add c
	ld l, a
	ld h, $1
	rst $08
	db $b8
	ld a, $2a
	rst $08
	db $bb
	ld a, [$c660]
	and $1
	call nz, Func_0c51
	pop de
	pop bc
	ret c
	ld a, [hROMBank]
	push af
	ld a, b
	ld [$c65e], a
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld l, e
	ld h, d
	push bc
	call Func_09c2
	pop bc
	jr c, .asm_0972
	ld de, $cfc
	jr .asm_097e

.asm_0972
	ld de, $d0f
	ld a, [$c664]
	or a
	jr z, .asm_097e
	ld de, $d24
.asm_097e
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, $4
	add c
	push de
	push bc
	ld e, a
	ld d, $2
	rst $08
	db $57
	ld c, l
	ld b, h
	pop de
	ld a, $80
	add e
	ld d, a
	ld e, $7
	pop hl
	rst $08
	db $5b
	ld hl, Data_07fa
	call Func_083b
	xor a
	ret

.asm_09a2
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld c, b
	ld hl, $c600
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	push hl
	ld a, c
	call Func_0856
	pop de
	pop af
	ld hl, $c600
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

Func_09c2: ; 9c2 (0:09c2)
	xor a
	ld [$c664], a
	ld a, [$c660]
	bit 0, a
	jp nz, Func_0a91
	bit 7, h
	jr nz, .asm_0a07
	push hl
	call Func_0a18
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
.asm_09dd
	push bc
	ld a, b
	cp $8
	jr c, .asm_09e6
	ld bc, $800
.asm_09e6
	ld e, l
	ld d, h
	push de
	push bc
	ld hl, $c900
	rst $08
	db $02
	pop bc
	push bc
	ld de, $c900
	ld hl, $c500
	rst $08
	db $ec
	pop de
	pop hl
	add hl, de
	pop bc
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	or c
	jr nz, .asm_09dd
	ret

.asm_0a07
	ld de, $c000
	add hl, de
	push hl
	call Func_0a18
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
	jr .asm_09dd

Func_0a18: ; a18 (0:0a18)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld c, [hl]
	inc hl
	push bc
	push af
	ld e, l
	ld d, h
	push bc
	ld hl, $c400
	ld b, $0
	push hl
	rst $08
	db $02
	pop de
	pop bc
	ld hl, $c500
	push bc
	push de
	rst $08
	db $6b
	pop de
	pop bc
	jr nc, .asm_0a85
	pop hl
	pop bc
	pop de
	ld a, $2e
	bit 0, b
	jr nz, .asm_0a46
	xor a
.asm_0a46
	add $5
	add c
	ld c, a
	push bc
	push bc
	ld a, $0
	adc a
	ld b, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop bc
	ld c, $0
	ld a, h
	ld hl, $c50a
	ld [hl], a
	ld hl, $c500
	push de
	rst $08
	db $e9
	pop de
	pop bc
	jr c, .asm_0a8d
	bit 0, b
	ret z
	push bc
	push de
	ld b, $0
	ld de, $ffd2
	ld hl, $c500
	rst $08
	db $ea
	pop de
	ld hl, $2e
	add hl, de
	ld e, l
	ld d, h
	pop bc
	ld a, c
	sub $2e
	ld c, a
	xor a
	ret

.asm_0a85
	ld a, $1
	ld [$c664], a
	pop hl
	pop bc
	pop de
.asm_0a8d
	or $1
	scf
	ret

Func_0a91: ; a91 (0:0a91)
	bit 7, h
	jr nz, .asm_0add
	push hl
	call Func_0aee
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
.asm_0aa0
	push bc
	ld a, b
	or a
	jr z, .asm_0aa8
	ld bc, $100
.asm_0aa8
	ld e, l
	ld d, h
	push de
	push bc
	ld hl, $c900
	rst $08
	db $02
	pop bc
	push bc
	ld de, $c900
	call Func_0ce1
	pop de
	pop hl
	push af
	add hl, de
	pop af
	pop bc
	jr c, .asm_0adb
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	or c
	jr nz, .asm_0aa0
	call Func_0bae
	jr c, .asm_0adb
	ld a, $2
	call Func_0cc1
	jr c, .asm_0adb
	call Func_0cd2
	xor a
	ret

.asm_0adb
	scf
	ret

.asm_0add
	ld de, $c000
	add hl, de
	push hl
	call Func_0aee
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
	jr .asm_0aa0

Func_0aee: ; aee (0:0aee)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld c, [hl]
	inc hl
	push bc
	ld [$c661], a
	ld e, l
	ld d, h
	push bc
	ld hl, $c400
	ld b, $0
	push hl
	rst $08
	db $02
	pop de
	pop bc
	ld hl, $c700
	push bc
	push de
	call Func_0cf3
	pop de
	pop bc
	jp nc, Func_0b97
	pop bc
	pop de
	cp $ff
	jp z, Func_0baa
	ld a, $2e
	bit 0, b
	jr nz, .asm_0b24
	xor a
.asm_0b24
	add $5
	add c
	ld c, a
	push bc
	push bc
	ld a, $0
	adc a
	ld b, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop bc
	ld a, [$c662]
	ld c, a
	ld a, $ff
	ld hl, $c70a
	ld [hl], a
	push de
	push bc
	ld a, $5
	call Func_0cc1
	pop bc
	pop de
	push de
	ld hl, $c700
	call Func_0ced
	pop de
	pop bc
	jr nc, .asm_0b5b
	cp $ff
	jr z, Func_0baa
	ld a, $4
	jr asm_0ba4

.asm_0b5b
	push bc
	push de
	push hl
	ld hl, sp+$0
	ld d, h
	ld e, l
	ld hl, $ce00
	ld c, $2
	call Func_0cbb
	pop hl
	pop de
	pop bc
	ld a, [$c663]
	cp h
	jr nz, asm_0ba2
	ld a, $5
	cp l
	jr nz, asm_0ba2
	xor a
	bit 0, b
	ret z
	push bc
	push de
	ld b, $0
	ld de, $ffd2
	ld hl, $c700
	call Func_0ce7
	pop de
	ld hl, $2e
	add hl, de
	ld e, l
	ld d, h
	pop bc
	ld a, c
	sub $2e
	ld c, a
	xor a
	ret

Func_0b97: ; b97 (0:0b97)
	ld a, $1
	ld [$c664], a
	pop bc
	pop de
	ld a, $7
	jr asm_0ba4

asm_0ba2
	ld a, $5
asm_0ba4
	call Func_0cc1
	call Func_0cd2
Func_0baa: ; baa (0:0baa)
	or $1
	scf
	ret

Func_0bae: ; bae (0:0bae)
	ld hl, $c709
	ld a, [hli]
	push hl
	inc hl
	ld b, $0
	bit 0, a
	ld a, $fe
	jr z, .asm_0bbe
	sub $2e
.asm_0bbe
	sub [hl]
	ld e, a
	ld a, $ff
	sbc b
	ld d, a
	call Func_0ce7
	pop de
	ret c
	ld a, [$c661]
	ld [de], a
	ld bc, $1
	jp Func_0ce1

Data_0bd3:
	dr $bd3, $c15

Data_0c15:
	dr $c15, $c51

Func_0c51: ; c51 (0:0c51)
	ld hl, Data_0bd3
	call Func_083b
.asm_0c57
	rst $08
	db $d8
	bit 1, a
	jr nz, .asm_0ca4
	and $1
	jr z, .asm_0c57
	ld hl, Data_0c15
	call Func_083b
	ld hl, $ce00
	ld de, $c800
	ld c, $10
	call Func_0cbb
	jr c, .asm_0ca4
	rst $10
	add hl, sp
	nop
	pop hl
	ld de, $c802
	ld bc, $d
	rst $08
	db $67
	ld a, h
	or l
	ld a, $6
	jr nz, .asm_0ca6
	ld a, [$c800]
	or a
	jr nz, .asm_0ca6
.asm_0c8b
	ld a, [$c801]
	ld [$c663], a
	ld a, [$c80f]
	ld [$c662], a
	ld a, $1
	call Func_0cc1
	jr c, .asm_0ca4
	call Func_0cd2
	xor a
	ret

.asm_0ca4
	scf
	ret

.asm_0ca6
	call Func_0cc1
	call Func_0cd2
	scf
	ret

Data_0cae:
	dr $cae, $cbb

Func_0cbb: ; cbb (0:0cbb)
	rst $08
	db $c3
	rst $08
	db $7c
	jr asm_0cf7

Func_0cc1: ; cc1 (0:0cc1)
	ld [$c800], a
	ld de, $ce00
	ld hl, $c800
	ld c, $1
	rst $08
	db $c3
	rst $08
	db $7f
	jr asm_0cf7

Func_0cd2: ; cd2 (0:0cd2)
	rst $08
	db $c3
	rst $08
	db $73
	jr asm_0cf7

Func_0cd8:
	ld hl, $c700
	rst $08
	db $c3
	rst $08
	db $79
	jr asm_0cf7

Func_0ce1: ; ce1 (0:0ce1)
	rst $08
	db $c3
	rst $08
	db $7d
	jr asm_0cf7

Func_0ce7: ; ce7 (0:0ce7)
	rst $08
	db $c3
	rst $08
	db $77
	jr asm_0cf7

Func_0ced: ; ced (0:0ced)
	rst $08
	db $c3
	rst $08
	db $76
	jr asm_0cf7

Func_0cf3: ; cf3 (0:0cf3)
	rst $08
	db $c3
	rst $08
	db $75
asm_0cf7
	push af
	rst $08
	db $db
	pop af
	ret

Data_0cfc:
	dr $cfc, $d3a

SECTION "0e00", HOME [$e00]
Func_e00:
	dr $e00, $1a90

Func_1a90:
	dr $1a90, $1b28

Func_1b28:
	dr $1b28, $1d00

Func_1d00:
	dr $1d00, $1e4d

Func_1e4d:
	dr $1e4d, $3fee

SECTION "Bank 01", ROMX, BANK [$01]
Func_4000:
	dr $4000, $4064

Func_4064:
	dr $4064, $8000

SECTION "Bank 02", ROMX, BANK [$02]
	dr $8000, $c000

SECTION "Bank 03", ROMX, BANK [$03]
	dr $c000, $10000

SECTION "Bank 04", ROMX, BANK [$04]
	dr $10000, $14000

SECTION "Bank 05", ROMX, BANK [$05]
	dr $14000, $18000

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1c000

SECTION "Bank 07", ROMX, BANK [$07]
	dr $1c000, $20000

SECTION "Bank 08", ROMX, BANK [$08]
	dr $20000, $24000

SECTION "Bank 09", ROMX, BANK [$09]
	dr $24000, $28000

SECTION "Bank 0a", ROMX, BANK [$0a]
	dr $28000, $2c000

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $30000

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $34000

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $38000

SECTION "Bank 0e", ROMX, BANK [$0e]
	dr $38000, $3c000

SECTION "Bank 0f", ROMX, BANK [$0f]
	dr $3c000, $40000

SECTION "Bank 10", ROMX, BANK [$10]
	dr $40000, $44000

SECTION "Bank 11", ROMX, BANK [$11]
	dr $44000, $48000

SECTION "Bank 12", ROMX, BANK [$12]
	dr $48000, $4c000

SECTION "Bank 13", ROMX, BANK [$13]
	dr $4c000, $50000

SECTION "Bank 14", ROMX, BANK [$14]
	dr $50000, $54000

SECTION "Bank 15", ROMX, BANK [$15]
	dr $54000, $58000

SECTION "Bank 16", ROMX, BANK [$16]
	dr $58000, $5c000

SECTION "Bank 17", ROMX, BANK [$17]
	dr $5c000, $60000

SECTION "Bank 18", ROMX, BANK [$18]
	dr $60000, $63141

Func_63141:
	dr $63141, $64000

SECTION "Bank 19", ROMX, BANK [$19]
	dr $64000, $68000

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $6c000

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $70000

SECTION "Bank 1c", ROMX, BANK [$1c]
Func_70000:
	dr $70000, $70003

Func_70003:
	dr $70003, $70006

Func_70006:
	dr $70006, $70009

Func_70009:
	dr $70009, $7000c

Func_7000c:
	dr $7000c, $7000f

Func_7000f:
	dr $7000f, $70012

Func_70012:
	dr $70012, $70015

Func_70015:
	dr $70015, $70018

Func_70018:
	dr $70018, $74000

SECTION "Bank 1d", ROMX, BANK [$1d]
	dr $74000, $78000

SECTION "Bank 1e", ROMX, BANK [$1e]
Pointers_78000:
	dr $78000, $78100

Func_78100:
	dr $78100, $7c000

SECTION "Bank 1f", ROMX, BANK [$1f]
Pointers_7c000:
	dr $7c000, $80000

SECTION "Bank 20", ROMX, BANK [$20]
	dr $80000, $84000

SECTION "Bank 21", ROMX, BANK [$21]
	dr $84000, $88000

SECTION "Bank 22", ROMX, BANK [$22]
	dr $88000, $8c000

SECTION "Bank 23", ROMX, BANK [$23]
	dr $8c000, $90000

SECTION "Bank 24", ROMX, BANK [$24]
	dr $90000, $94000

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $98000

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $9c000

SECTION "Bank 27", ROMX, BANK [$27]
	dr $9c000, $a0000

SECTION "Bank 28", ROMX, BANK [$28]
	dr $a0000, $a4000

SECTION "Bank 29", ROMX, BANK [$29]
	dr $a4000, $a8000

SECTION "Bank 2a", ROMX, BANK [$2a]
	dr $a8000, $ac000

SECTION "Bank 2b", ROMX, BANK [$2b]
	dr $ac000, $b0000

SECTION "Bank 2c", ROMX, BANK [$2c]
	dr $b0000, $b4000

SECTION "Bank 2d", ROMX, BANK [$2d]
	dr $b4000, $b8000

SECTION "Bank 2e", ROMX, BANK [$2e]
	dr $b8000, $bc000

SECTION "Bank 2f", ROMX, BANK [$2f]
	dr $bc000, $c0000

SECTION "Bank 30", ROMX, BANK [$30]
	dr $c0000, $c4000

SECTION "Bank 31", ROMX, BANK [$31]
	dr $c4000, $c8000

SECTION "Bank 32", ROMX, BANK [$32]
	dr $c8000, $cc000

SECTION "Bank 33", ROMX, BANK [$33]
	dr $cc000, $d0000

SECTION "Bank 34", ROMX, BANK [$34]
	dr $d0000, $d4000

SECTION "Bank 35", ROMX, BANK [$35]
	dr $d4000, $d8000

SECTION "Bank 36", ROMX, BANK [$36]
	dr $d8000, $dc000

SECTION "Bank 37", ROMX, BANK [$37]
	dr $dc000, $e0000

SECTION "Bank 38", ROMX, BANK [$38]
	dr $e0000, $e4000

SECTION "Bank 39", ROMX, BANK [$39]
	dr $e4000, $e8000

SECTION "Bank 3a", ROMX, BANK [$3a]
	dr $e8000, $ec000

SECTION "Bank 3b", ROMX, BANK [$3b]
	dr $ec000, $f0000

SECTION "Bank 3c", ROMX, BANK [$3c]
	dr $f0000, $f4000

SECTION "Bank 3d", ROMX, BANK [$3d]
	dr $f4000, $f8000

SECTION "Bank 3e", ROMX, BANK [$3e]
	dr $f8000, $fc000

SECTION "Bank 3f", ROMX, BANK [$3f]
IF DEF(SUN)
	dr $fc000, $fe102

Func_fe102:
	dr $fe102, $100000
ENDC
IF DEF(STAR)
	dr $fc000, $fe100

Func_fe102:
	dr $fe100, $100000
ENDC

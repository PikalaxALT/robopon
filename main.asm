INCLUDE "includes.asm"

SECTION "rst $00", HOME [$00]
	jp Func_0388

SECTION "rst $08", HOME [$08]
Predef_::
	jp Predef

Bank_000b:
	db BANK(Func_78100)
Bank_000c:
	db $1e
Byte_000d:
	db $4a
Banks_000e:
	db BANK(Pointers_78096), BANK(Pointers_7c000)

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
Predef: ; 68 (0:0068)
	add sp, -$5
	push af
	push de
	push hl
	; 1-byte argument off the stack
	ld hl, sp+$b ; 5 + 6
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	; If >= $4a, it's a far call
	ld e, a
	ld a, [Byte_000d] ; 4a
	cp e
	jr c, .asm_0093
	; Jump to a function from the table.
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
	; store the return bank and address on the stack
	dec hl
	ld a, [hROMBank]
	ld [hld], a
	ld [hl], .Return / $100
	dec hl
	ld [hl], .Return % $100
	; get the far pointer
	sla e
	ld a, d
	rlca
	and $1
	add Banks_000e
	ld l, a
	ld h, $0
	ld a, [hl]
	call BankSwitch_00f7
	ld hl, Pointers_78096 - 2 * $4b
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
	ld a, [hFF86]
	or a
	jr z, .copy
	ld a, h
	and $e0
	cp $80
	jr z, .asm_017d
	ld a, d
	and $e0
	cp $80
	jr nz, .copy
	predef Func_7ce7d
	ret

.copy
	ld a, [de]
	inc de
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .copy
	ret

.asm_017d
	ld a, b
	or a
.asm_017f
	push af
	predef Func_7cdf6
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
	predef Func_7ce36
.asm_01a8
	ld a, [de]
	inc de
	ld [hl], a
	inc l
	dec c
	jr nz, .asm_01a8
	di
	ld a, l
	ld [hFF87], a
	ld a, [hFF89]
	add b
	ld [hFF89], a
	ei
Func_01b9:
	ret

SECTION "01e0", HOME [$1e0]
Pointers_01e0:
	dw Func_00e9
	dw Func_0150
	dw Func_015b
	dw Func_7af00
	dw Func_7af30
	dw Func_7af39
	dw Func_7b6d3
	dw Func_7b6ec
	dw Func_7b70d
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
	ld a, [hFF99]
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
	predef Func_7b25b
	jp c, Func_03d3
	ret

.asm_0286
	sub $a0
	predef Func_7c100
	jp c, Func_03d3
	ret

Func_028e:
	di
	ld sp, wStackTop
	predef Func_00e9
	predef Func_7b1e1
Func_0296: ; 296 (0:0296)
	ld hl, Func_0296
	predef Func_7b133
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
	predef Func_00e9
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
	predef Func_00e9
	predef Func_022c
	ld a, BANK(Func_63141)
	call BankSwitch_03f2
	pop af
	push af
	call Func_63141
	di
	pop af
	ld [wSystemType], a
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
	ld a, [wSystemType]
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
	ld [wSystemType], a
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
	ld [wc212], a
	ld a, [hROMBank]
	push af
	ld a, [wc21a]
	call BankSwitch_03f2
	ld a, l
	ld [wc218], a
	ld a, h
	ld [wc218 + 1], a
	ld hl, .Return
	push hl
	ld a, [wc21b]
	ld l, a
	ld a, [wc21b + 1]
	ld h, a
	push hl
	ld a, [wc218 + 1]
	ld h, a
	ld a, [wc218]
	ld l, a
	ld a, [wc212]
	ret

.Return:
	ld [wc212], a
	pop af
	call BankSwitch_03f2
	ld a, [wc212]
	ret

Func_0451:
	push bc
	ld a, [wOAM27VTile]
	push af
	xor a
	ld [wOAM27VTile], a
	call Func_0465
	ld c, a
	pop af
	ld [wOAM27VTile], a
	ld a, c
	pop bc
	ret

Func_0465: ; 465 (0:0465)
	push bc
	ld a, [wc209]
	ld c, a
.asm_046a
	halt
	ld a, [wc207]
	ld b, a
	ld a, [wc209]
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
	predef Func_00e9
	ld a, $7
	ld [$c654], a
	ld a, $ff
	ld [$c655], a
	ld a, $20
	predef Func_7d753
	ld hl, $400
	predef Func_7d85d
Func_0519: ; 519 (0:0519)
	call Func_07a2
	ld de, $204
	predef Func_7bdec
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
	predef Func_7d78e
	ld c, $0
.loop
	ld a, [$c654]
	ld b, a
	ld hl, $104
	ld d, $20
	ld e, $3e
	predef Func_7b7a9
	jr c, asm_0588
	ld c, a
	inc a
	call BitIndexToMask
	ld h, a
	ld a, [$c655]
	and h
	jr z, .loop
	ld l, c
	ld h, $0
	predef Func_7b6d3

Data_0577:
	dr $577, $588

asm_0588
	predef Func_0150
Func_058a:
	jr nc, .wait
	predef Func_7bd5b
	ret

.wait
	ld a, [hli]
	or a
	jr nz, .wait
	ld a, $d
	predef Func_7d9f9
	ld a, $1
	predef Func_7d9f9
	ret

Data_059c:
	db " PASSWORD INPUT", $0e, $0d, $01, $00
	dr $5af, $65e

Data_065e:
	dr $65e, $739

BitIndexToMask: ; 739 (0:0739)
	push bc
	ld c, a
	ld a, $80
.loop
	rlca
	dec c
	jr nz, .loop
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
	call Func_0856
	ld de, $4000
	ld a, $e
	call Func_0856
	ld de, $4000
	ld a, $f
	call Func_0856
	jp Func_0519

Func_07a2: ; 7a2 (0:07a2)
	predef Func_7d8d7
	ld a, $c
	predef Func_7d9f9
	ld hl, $8800
	ld e, $0
	ld bc, $a00
	predef Func_7d5e7
	ld de, $3
	ld bc, $1409
	predef Func_7bdfe
	ld a, $80
	ld de, $204
	ld bc, $1007
	ld hl, $701
	predef Func_7be3e
	ld de, $d
	ld bc, $1405
	predef Func_7bdfe
	ld a, $f0
	ld de, $20e
	ld bc, $1003
	ld hl, $301
	predef Func_7be3e
	ld hl, $101
	predef Func_7d905
	ld hl, Data_07e7
	predef Func_7af96
	ret

Data_07e7:
	db "GB KISS  MINI GAME", $00

Data_07fa:
	dr $7fa, $83b

Func_083b: ; 83b (0:083b)
	bcbgcoord 2, 14
	ld d, $f0
	ld e, $3
.loop
	ld a, [hl]
	or a
	ret z
	push de
	push bc
	predef Func_7bd5b
	pop bc
	ld a, BG_MAP_WIDTH
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	pop de
	inc d
	jr .loop

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
	predef Func_015b
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld de, $304
	predef Func_7bdec
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
	predef Func_015b
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
	predef Func_7bd5b
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
	predef Func_7d78e
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
	predef Func_7b7a9
	pop bc
	jr c, .asm_08ff
	ld c, a
	push bc
	call Func_0906
	pop bc
	jr nc, .asm_08e7
	jp Func_085d

.asm_08ff
	ld a, [hFF8A]
	and $4
	ret z
	predef Func_0150
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
	ld a, [hFF8A]
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
	predef Func_7d905
	ld a, $2a
	predef Func_7d93e
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
	predef Func_7bdec
	ld c, l
	ld b, h
	pop de
	ld a, $80
	add e
	ld d, a
	ld e, $7
	pop hl
	predef Func_7bd5b
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
	predef Func_015b
	pop bc
	push bc
	ld de, $c900
	ld hl, $c500
	predef Func_7cca9
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
	predef Func_015b
	pop de
	pop bc
	ld hl, $c500
	push bc
	push de
	predef Func_7afe6
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
	predef Func_7caa0
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
	predef Func_7cb98
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
	predef Func_015b
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
	predef Func_015b
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
	predef Func_7e17c
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
	predef Func_7af75
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
	predef Func_7ceaf
	predef Func_7ac8d
	jr asm_0cf7

Func_0cc1: ; cc1 (0:0cc1)
	ld [$c800], a
	ld de, $ce00
	ld hl, $c800
	ld c, $1
	predef Func_7ceaf
	predef Func_7aca4
	jr asm_0cf7

Func_0cd2: ; cd2 (0:0cd2)
	predef Func_7ceaf
	predef Func_7ac16
	jr asm_0cf7

Func_0cd8:
	ld hl, $c700
	predef Func_7ceaf
	predef Func_7ac62
	jr asm_0cf7

Func_0ce1: ; ce1 (0:0ce1)
	predef Func_7ceaf
	predef Func_7acd3
	jr asm_0cf7

Func_0ce7: ; ce7 (0:0ce7)
	predef Func_7ceaf
	predef Func_7ac56
	jr asm_0cf7

Func_0ced: ; ced (0:0ced)
	predef Func_7ceaf
	predef Func_7ac37
	jr asm_0cf7

Func_0cf3: ; cf3 (0:0cf3)
	predef Func_7ceaf
	predef Func_7ac2a
asm_0cf7
	push af
	predef Func_7e0d2
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
	dr $78000, $78096

Pointers_78096:
	dw Func_7bdc7
	dw Func_7bf2a
	dw Func_7be72
	dw Func_7beff
	dw Func_7be8b
	dw Func_7b25b
	dw Func_7a65c
	dw Func_7b72b
	dw Func_7b848
	dw Func_7b85e
	dw Func_7b93a
	dw Func_7b8eb
	dw Func_7bdec
	dw Func_7bdfe
	dw Func_7be3e
	dw Func_7bd42
	dw Func_7bd5b
	dw Func_7b767
	dw Func_7bdaa
	dw Func_7b7a9
	dw Func_7b776
	dw Func_7ad2a
	dw Func_7b21d
	dw Func_7ad4e
	dw Func_7ad6d
	dw Func_7addf
	dw Func_7ae29
	dw Func_7af61
	dw Func_7af75
	dw Func_7af8a
	dw Func_7af96
	dw Func_7afd5
	dw Func_7afe6
	dw Func_7b148
	dw Func_7b0b5
	dw Func_7b1e1
	dw Func_7b133
	dw Func_7ae86
	dw Func_7ae5e
	dw Func_7aa8e
	dw Func_7ac16
	dw Func_7ac23
	dw Func_7ac2a
	dw Func_7ac37
	dw Func_7ac56
	dw Func_7ac33
	dw Func_7ac62
	dw Func_7acbe
	dw Func_7ac89
	dw Func_7ac8d
	dw Func_7acd3
	dw Func_7aca0
	dw Func_7aca4

Func_78100:
	dr $78100, $7a65c

Func_7a65c: ; 7a65c
	dr $7a65c, $7aa8e

Func_7aa8e: ; 7aa8e
	dr $7aa8e, $7ac16

Func_7ac16: ; 7ac16
	dr $7ac16, $7ac23

Func_7ac23: ; 7ac23
	dr $7ac23, $7ac2a

Func_7ac2a: ; 7ac2a
	dr $7ac2a, $7ac33

Func_7ac33: ; 7ac33
	dr $7ac33, $7ac37

Func_7ac37: ; 7ac37
	dr $7ac37, $7ac56

Func_7ac56: ; 7ac56
	dr $7ac56, $7ac62

Func_7ac62: ; 7ac62
	dr $7ac62, $7ac89

Func_7ac89: ; 7ac89
	dr $7ac89, $7ac8d

Func_7ac8d: ; 7ac8d
	dr $7ac8d, $7aca0

Func_7aca0: ; 7aca0
	dr $7aca0, $7aca4

Func_7aca4: ; 7aca4
	dr $7aca4, $7acbe

Func_7acbe: ; 7acbe
	dr $7acbe, $7acd3

Func_7acd3: ; 7acd3
	dr $7acd3, $7ad2a

Func_7ad2a: ; 7ad2a
	dr $7ad2a, $7ad4e

Func_7ad4e: ; 7ad4e
	dr $7ad4e, $7ad6d

Func_7ad6d: ; 7ad6d
	dr $7ad6d, $7addf

Func_7addf: ; 7addf
	dr $7addf, $7ae29

Func_7ae29: ; 7ae29
	dr $7ae29, $7ae5e

Func_7ae5e: ; 7ae5e
	dr $7ae5e, $7ae86

Func_7ae86: ; 7ae86
	dr $7ae86, $7af00

Func_7af00: ; 7af00
	dr $7af00, $7af30

Func_7af30: ; 7af30
	dr $7af30, $7af39

Func_7af39: ; 7af39
	dr $7af39, $7af61

Func_7af61: ; 7af61
	dr $7af61, $7af75

Func_7af75: ; 7af75
	dr $7af75, $7af8a

Func_7af8a: ; 7af8a
	dr $7af8a, $7af96

Func_7af96: ; 7af96
	dr $7af96, $7afd5

Func_7afd5: ; 7afd5
	dr $7afd5, $7afe6

Func_7afe6: ; 7afe6
	dr $7afe6, $7b0b5

Func_7b0b5: ; 7b0b5
	dr $7b0b5, $7b133

Func_7b133: ; 7b133
	dr $7b133, $7b148

Func_7b148: ; 7b148
	dr $7b148, $7b1e1

Func_7b1e1: ; 7b1e1
	dr $7b1e1, $7b21d

Func_7b21d: ; 7b21d
	dr $7b21d, $7b25b

Func_7b25b: ; 7b25b
	dr $7b25b, $7b6d3

Func_7b6d3: ; 7b6d3
	dr $7b6d3, $7b6ec

Func_7b6ec: ; 7b6ec
	dr $7b6ec, $7b70d

Func_7b70d: ; 7b70d
	dr $7b70d, $7b72b

Func_7b72b: ; 7b72b
	dr $7b72b, $7b767

Func_7b767: ; 7b767
	dr $7b767, $7b776

Func_7b776: ; 7b776
	dr $7b776, $7b7a9

Func_7b7a9: ; 7b7a9
	dr $7b7a9, $7b848

Func_7b848: ; 7b848
	dr $7b848, $7b85e

Func_7b85e: ; 7b85e
	dr $7b85e, $7b8eb

Func_7b8eb: ; 7b8eb
	dr $7b8eb, $7b93a

Func_7b93a: ; 7b93a
	dr $7b93a, $7bd42

Func_7bd42: ; 7bd42
	dr $7bd42, $7bd5b

Func_7bd5b: ; 7bd5b
	dr $7bd5b, $7bdaa

Func_7bdaa: ; 7bdaa
	dr $7bdaa, $7bdc7

Func_7bdc7: ; 7bdc7
	dr $7bdc7, $7bdec

Func_7bdec: ; 7bdec
	dr $7bdec, $7bdfe

Func_7bdfe: ; 7bdfe
	dr $7bdfe, $7be3e

Func_7be3e: ; 7be3e
	dr $7be3e, $7be72

Func_7be72: ; 7be72
	dr $7be72, $7be8b

Func_7be8b: ; 7be8b
	dr $7be8b, $7beff

Func_7beff: ; 7beff
	dr $7beff, $7bf2a

Func_7bf2a: ; 7bf2a
	dr $7bf2a, $7c000

SECTION "Bank 1f", ROMX, BANK [$1f]
Pointers_7c000:
	dw Func_7d267
	dw Func_7d26e
	dw Func_7d275
	dw Func_7d27c
	dw Func_7d283
	dw Func_7d2b3
	dw Func_7d2c8
	dw Func_7d2de
	dw Func_7d2e0
	dw Func_7d2e7
	dw Func_7d322
	dw Func_7d382
	dw Func_7d38c
	dw Func_7d3bc
	dw Func_7d391
	dw Func_7c96e
	dw Func_7e1e8
	dw Func_7e1c0
	dw Func_7e2d8
	dw Func_7e320
	dw Func_7e486
	dw Func_7e497
	dw Func_7e373
	dw Func_7e44d
	dw Func_7e4aa
	dw Func_7e4d2
	dw Func_7e2fd
	dw Func_7e32f
	dw Func_7e4f4
	dw Func_7e523
	dw Func_7e225
	dw Func_7c17e
	dw Func_7d4e0
	dw Func_7d3c9
	dw Func_7d3f9
	dw Func_7d486
	dw Func_7d5a6
	dw Func_7d5da
	dw Func_7d5e7
	dw Func_7db91
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7e610
	dw Func_7e6bd
	dw Func_7e75b
	dw Func_7e556
	dw Func_7e640
	dw Func_7dff6
	dw Func_7e0b5
	dw Func_7c17e
	dw Func_7d753
	dw Func_7d78e
	dw Func_7d8d7
	dw Func_7e064
	dw Func_7d8fc
	dw Func_7d905
	dw Func_7d9f9
	dw Func_7d689
	dw Func_7d93e
	dw Func_7c100
	dw Func_7d918
	dw Func_7d98c
	dw Func_7de32
	dw Func_7dde6
	dw Func_7de0c
	dw Func_7ea15
	dw Func_7ceaf
	dw Func_7d8c8
	dw Func_7d6cc
	dw Func_7d738
	dw Func_7d724
	dw Func_7d91f
	dw Func_7dc58
	dw Func_7d85d
	dw Func_7c17f
	dw Func_7c19f
	dw Func_7d9c5
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7e17c
	dw Func_0150
	dw Func_7e168
	dw Func_7e0d2
	dw Func_7e0c2
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c437
	dw Func_7c456
	dw Func_7c54a
	dw Func_7c566
	dw Func_7c577
	dw Func_7c5ca
	dw Func_7c5da
	dw Func_7c7b7
	dw Func_7c9de
	dw Func_7caa0
	dw Func_7cb98
	dw Func_7cc9a
	dw Func_7cca9
	dw Func_7ccf1
	dw Func_7c17e
	dw Func_7c8ec
	dw Func_7cbed
	dw Func_7c926
	dw Func_7c881
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c1b0
	dw Func_7c259
	dw Func_7c17e
	dw Func_7c586
	dw Func_7ca3c
	dw Func_7cdf6
	dw Func_7ce7d
	dw Func_7ce36

Func_7c100: ; 7c100
	dr $7c100, $7c17e

Func_7c17e: ; 7c17e
	dr $7c17e, $7c17f

Func_7c17f: ; 7c17f
	dr $7c17f, $7c19f

Func_7c19f: ; 7c19f
	dr $7c19f, $7c1b0

Func_7c1b0: ; 7c1b0
	dr $7c1b0, $7c259

Func_7c259: ; 7c259
	dr $7c259, $7c437

Func_7c437: ; 7c437
	dr $7c437, $7c456

Func_7c456: ; 7c456
	dr $7c456, $7c54a

Func_7c54a: ; 7c54a
	dr $7c54a, $7c566

Func_7c566: ; 7c566
	dr $7c566, $7c577

Func_7c577: ; 7c577
	dr $7c577, $7c586

Func_7c586: ; 7c586
	dr $7c586, $7c5ca

Func_7c5ca: ; 7c5ca
	dr $7c5ca, $7c5da

Func_7c5da: ; 7c5da
	dr $7c5da, $7c7b7

Func_7c7b7: ; 7c7b7
	dr $7c7b7, $7c881

Func_7c881: ; 7c881
	dr $7c881, $7c8ec

Func_7c8ec: ; 7c8ec
	dr $7c8ec, $7c926

Func_7c926: ; 7c926
	dr $7c926, $7c96e

Func_7c96e: ; 7c96e
	dr $7c96e, $7c9de

Func_7c9de: ; 7c9de
	dr $7c9de, $7ca3c

Func_7ca3c: ; 7ca3c
	dr $7ca3c, $7caa0

Func_7caa0: ; 7caa0
	dr $7caa0, $7cb98

Func_7cb98: ; 7cb98
	dr $7cb98, $7cbed

Func_7cbed: ; 7cbed
	dr $7cbed, $7cc9a

Func_7cc9a: ; 7cc9a
	dr $7cc9a, $7cca9

Func_7cca9: ; 7cca9
	dr $7cca9, $7ccf1

Func_7ccf1: ; 7ccf1
	dr $7ccf1, $7cdf6

Func_7cdf6: ; 7cdf6
	dr $7cdf6, $7ce36

Func_7ce36: ; 7ce36
	dr $7ce36, $7ce7d

Func_7ce7d: ; 7ce7d
	dr $7ce7d, $7ceaf

Func_7ceaf: ; 7ceaf
	dr $7ceaf, $7d267

Func_7d267: ; 7d267
	dr $7d267, $7d26e

Func_7d26e: ; 7d26e
	dr $7d26e, $7d275

Func_7d275: ; 7d275
	dr $7d275, $7d27c

Func_7d27c: ; 7d27c
	dr $7d27c, $7d283

Func_7d283: ; 7d283
	dr $7d283, $7d2b3

Func_7d2b3: ; 7d2b3
	dr $7d2b3, $7d2c8

Func_7d2c8: ; 7d2c8
	dr $7d2c8, $7d2de

Func_7d2de: ; 7d2de
	dr $7d2de, $7d2e0

Func_7d2e0: ; 7d2e0
	dr $7d2e0, $7d2e7

Func_7d2e7: ; 7d2e7
	dr $7d2e7, $7d322

Func_7d322: ; 7d322
	dr $7d322, $7d382

Func_7d382: ; 7d382
	dr $7d382, $7d38c

Func_7d38c: ; 7d38c
	dr $7d38c, $7d391

Func_7d391: ; 7d391
	dr $7d391, $7d3bc

Func_7d3bc: ; 7d3bc
	dr $7d3bc, $7d3c9

Func_7d3c9: ; 7d3c9
	dr $7d3c9, $7d3f9

Func_7d3f9: ; 7d3f9
	dr $7d3f9, $7d486

Func_7d486: ; 7d486
	dr $7d486, $7d4e0

Func_7d4e0: ; 7d4e0
	dr $7d4e0, $7d5a6

Func_7d5a6: ; 7d5a6
	dr $7d5a6, $7d5da

Func_7d5da: ; 7d5da
	dr $7d5da, $7d5e7

Func_7d5e7: ; 7d5e7
	dr $7d5e7, $7d689

Func_7d689: ; 7d689
	dr $7d689, $7d6cc

Func_7d6cc: ; 7d6cc
	dr $7d6cc, $7d724

Func_7d724: ; 7d724
	dr $7d724, $7d738

Func_7d738: ; 7d738
	dr $7d738, $7d753

Func_7d753: ; 7d753
	dr $7d753, $7d78e

Func_7d78e: ; 7d78e
	dr $7d78e, $7d85d

Func_7d85d: ; 7d85d
	dr $7d85d, $7d8c8

Func_7d8c8: ; 7d8c8
	dr $7d8c8, $7d8d7

Func_7d8d7: ; 7d8d7
	dr $7d8d7, $7d8fc

Func_7d8fc: ; 7d8fc
	dr $7d8fc, $7d905

Func_7d905: ; 7d905
	dr $7d905, $7d918

Func_7d918: ; 7d918
	dr $7d918, $7d91f

Func_7d91f: ; 7d91f
	dr $7d91f, $7d93e

Func_7d93e: ; 7d93e
	dr $7d93e, $7d98c

Func_7d98c: ; 7d98c
	dr $7d98c, $7d9c5

Func_7d9c5: ; 7d9c5
	dr $7d9c5, $7d9f9

Func_7d9f9: ; 7d9f9
	dr $7d9f9, $7db91

Func_7db91: ; 7db91
	dr $7db91, $7dc58

Func_7dc58: ; 7dc58
	dr $7dc58, $7dde6

Func_7dde6: ; 7dde6
	dr $7dde6, $7de0c

Func_7de0c: ; 7de0c
	dr $7de0c, $7de32

Func_7de32: ; 7de32
	dr $7de32, $7dff6

Func_7dff6: ; 7dff6
	dr $7dff6, $7e064

Func_7e064: ; 7e064
	dr $7e064, $7e0b5

Func_7e0b5: ; 7e0b5
	dr $7e0b5, $7e0c2

Func_7e0c2: ; 7e0c2
	dr $7e0c2, $7e0d2

Func_7e0d2: ; 7e0d2
	dr $7e0d2, $7e168

Func_7e168: ; 7e168
	dr $7e168, $7e17c

Func_7e17c: ; 7e17c
	dr $7e17c, $7e1c0

Func_7e1c0: ; 7e1c0
	dr $7e1c0, $7e1e8

Func_7e1e8: ; 7e1e8
	dr $7e1e8, $7e225

Func_7e225: ; 7e225
	dr $7e225, $7e2d8

Func_7e2d8: ; 7e2d8
	dr $7e2d8, $7e2fd

Func_7e2fd: ; 7e2fd
	dr $7e2fd, $7e320

Func_7e320: ; 7e320
	dr $7e320, $7e32f

Func_7e32f: ; 7e32f
	dr $7e32f, $7e373

Func_7e373: ; 7e373
	dr $7e373, $7e44d

Func_7e44d: ; 7e44d
	dr $7e44d, $7e486

Func_7e486: ; 7e486
	dr $7e486, $7e497

Func_7e497: ; 7e497
	dr $7e497, $7e4aa

Func_7e4aa: ; 7e4aa
	dr $7e4aa, $7e4d2

Func_7e4d2: ; 7e4d2
	dr $7e4d2, $7e4f4

Func_7e4f4: ; 7e4f4
	dr $7e4f4, $7e523

Func_7e523: ; 7e523
	dr $7e523, $7e556

Func_7e556: ; 7e556
	dr $7e556, $7e610

Func_7e610: ; 7e610
	dr $7e610, $7e640

Func_7e640: ; 7e640
	dr $7e640, $7e6bd

Func_7e6bd: ; 7e6bd
	dr $7e6bd, $7e75b

Func_7e75b: ; 7e75b
	dr $7e75b, $7ea15

Func_7ea15: ; 7ea15
	dr $7ea15, $80000

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

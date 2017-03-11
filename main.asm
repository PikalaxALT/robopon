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
	jr c, .default
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
	db 8
	; 578
	dw Func_068f - @
	dw Func_076f - @
	dw Func_0777 - @
	dw Func_077f - @
	dw Func_0787 - @
	dw Func_078f - @
	dw Func_0797 - @
	dw .default - @

.default
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
	dr $5af, $607

Data_0607:
	dr $607, $65e

Data_065e:
	dr $65e, $686

Data_0686:
	dr $686, $68f

Func_068f: ; 68f (0:068f)
	call Func_07a2
	ld a, $20
	ld de, $204
	ld bc, $1004
	ld hl, $0
	predef Func_7be3e
	ld a, $f0
	ld de, $208
	ld bc, $1003
	ld hl, $301
	predef Func_7be3e
	ld hl, $204
	predef Func_7d905
	ld hl, Data_059c
	predef Func_7af96
	ld hl, Data_0607
	predef Func_7d905
	ld hl, Data_0686
	predef Func_7af96
	ld hl, Data_0743
	bcbgcoord 2, 8
	call Func_083e
	ld a, $3
	ld [hFFAE], a
	ld de, $900d
	ld hl, $0
	predef Func_7b85e
	ld a, $80
	ld de, $606
	ld bc, $801
	ld hl, $100
	predef Func_7be3e
	ld a, $3
	predef Func_7d78e
	ld hl, $c656
	ld e, $20
	ld bc, $8
	predef Func_7d5e7
	ld de, $8001
	ld b, $8
	ld hl, $c656
	ld c, $0
	predef Func_7b93a
	jp c, Func_0519
	ld hl, $636
	ld bc, $502
.asm_0705
	push bc
	push hl
	ld de, $c656
	ld bc, $8
	push bc
	predef Func_7af75
	pop bc
	ld a, h
	or l
	pop hl
	add hl, bc
	pop bc
	inc c
	or a
	jr z, .asm_0720
	dec b
	jr nz, .asm_0705
	jp Func_0519

.asm_0720
	ld a, [$c654]
	cp c
	ld a, c
	jp nc, Func_072b
	ld [$c654], a
Func_072b: ; 72b (0:072b)
	call BitIndexToMask
	ld d, a
	ld a, [$c655]
	or d
	ld [$c655], a
	jp Func_0519

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
Func_0777:
	ld de, $4000
	ld a, $9
	call Func_0856
Func_077f:
	ld de, $4000
	ld a, $b
	call Func_0856
Func_0787:
	ld de, $4000
	ld a, $d
	call Func_0856
Func_078f:
	ld de, $4000
	ld a, $e
	call Func_0856
Func_0797:
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
Func_083e: ; 083e
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
	ld de, hFFD2
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
	ld de, hFFD2
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
	dr $78000, $78018

Data_78018: ; 78018
	dr $78018, $7801a

Data_7801a: ; 7801a
	dr $7801a, $78028

Data_78028: ; 78028
	dr $78028, $78038

Data_78038: ; 78038
	dr $78038, $78048

Data_78048: ; 78048
	dr $78048, $78058

Data_78058: ; 78058
	dr $78058, $78068

Data_78068: ; 78068
	dr $78068, $78078

Data_78078: ; 78078
	dr $78078, $78088

SECTION "Predef 1e", ROMX [$4096], BANK [$1e]
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

Func_78100: ; 78100 (1e:4100)
	ld sp, wStackTop
	ld hl, Func_78100
	predef Func_7b133
	xor a
	ld [$ffb7], a
	call Func_7898a
Func_7810e: ; 7810e (1e:410e)
	call Func_78b33
	ld hl, $ffc0
	ld de, rLY
	ld bc, $1
	predef Func_7c577
	ld a, $ff
	ld [$ffc2], a
	xor a
	ld [$ffc3], a
	ld [$ffc1], a
asm_78125
	call Func_787eb
	jp c, Func_0303
	and $1
	jp z, Func_782a6
	call Func_7890e
	ld a, [hFF8A]
	bit 2, a
	jp nz, Func_78290
Func_7813a: ; 7813a (1e:413a)
	call Func_78acb
	and $2
	jr nz, .asm_78154
	ld h, a
	ld l, c
	predef Func_7b6d3
	db 6
	; 4146
	dw Func_78159 - @
	dw Func_7841d - @
	dw Func_78164 - @
	dw Func_78290 - @
	dw Func_782b6 - @
	dw Func_783be - @
	dw .asm_78154 - @

.asm_78154
	call Func_78b36
	jr asm_78125

Func_78159:
	ld hl, $c500
	predef Func_7b0b5
	ld hl, Data_78fb1
	jp Func_783b4

Func_78164:
	ld a, [$ffc0]
	ld [$ffc2], a
	ld a, [$ffc1]
	ld [$ffc3], a
	call Func_78990
	push af
.asm_78170
	call Func_787eb
	jr c, .asm_7819b
	bit 0, a
	jr z, .asm_78170
	call Func_78990
	pop de
	ld e, a
	call Func_78235
	push de
	jr nz, .asm_7819b
	ld a, d
	cp e
	jr nz, .asm_7819b
	ld hl, Data_78fc1
	call Func_78bd2
	ld de, $b10
	call Func_783e2
	jr nz, .asm_7819b
	pop de
	call Func_781a9
	push af
.asm_7819b
	pop af
	ld a, $ff
	ld [$ffc2], a
	jp Func_7810e

Func_781a3: ; 781a3 (1e:41a3)
	ld hl, $c500
	predef Func_7c8ec
	ret

Func_781a9: ; 781a9 (1e:41a9)
	ld e, $0
Func_781ab: ; 781ab (1e:41ab)
	ld a, e
	cp d
	jp z, Func_7822d
	push de
	ld hl, $c500
	predef Func_7ae5e
	pop de
	ld hl, $c500
	ld a, [hli]
	or [hl]
	jr z, Func_7822d
	inc hl
	ld a, [hl]
	cp $ff
	jr z, Func_7822d
	push de
	call Func_7826d
	predef Func_7afe6
	pop de
	jr c, Func_7822d
	push de
	call Func_7878a
	pop hl
	push hl
	ld c, h
	ld a, [$c50a]
	ld [$c70a], a
	ld hl, $c700
	predef Func_7caa0
	jr c, .asm_7822c
	ld a, [$c509]
	bit 0, a
	jr z, .asm_781f1
	call Func_78929
	ld hl, $c700
	call Func_7892c
.asm_781f1
	ld hl, $c500
	ld de, $c400
	ld bc, $100
	predef Func_7cc9a
	ld a, b
	or c
	jr z, .asm_7820a
	ld hl, $c700
	ld de, $c400
	predef Func_7cca9
	jr .asm_781f1

.asm_7820a
	ld de, $c702
	ld hl, $c502
	ld b, $3
.asm_78212
	ld a, [de]
	cp [hl]
	jr c, .asm_7821d
	jr nz, .asm_78224
	dec de
	dec hl
	dec b
	jr nz, .asm_78212
.asm_7821d
	ld hl, $c700
	predef Func_7c8ec
	jr .asm_7822c

.asm_78224
	pop de
	push de
	call Func_78235
	call Func_781a3
.asm_7822c
	pop de
Func_7822d: ; 7822d (1e:422d)
	inc e
	ld a, e
	cp $78
	jp c, Func_781ab
	ret

Func_78235: ; 78235 (1e:4235)
	add sp, -$8
	ld hl, sp+$0
	push de
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop de
	ld hl, sp+$4
	push de
	ld e, d
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop de
	ld hl, sp+$4
	push de
	ld d, $fe
	ld bc, $4
	predef Func_7c5ca
	pop de
	ld hl, sp+$0
	push de
	ld e, d
	ld d, $fe
	ld bc, $4
	predef Func_7c5ca
	pop de
	ld hl, sp+$0
	ld a, [hli]
	or [hl]
	add sp, $8
	or a
	ret

Func_7826d: ; 7826d (1e:426d)
	ld hl, $c700
	ld de, $c50c
	ld a, [$c50b]
	ld c, a
	ret

Func_78278: ; 78278 (1e:4278)
	ld hl, $c500
	ld a, [hli]
	or [hl]
	ret z
	inc hl
	ld a, [hl]
	cp $ff
	ret

Func_78283: ; 78283 (1e:4283)
	ld hl, Data_78f76
	call Func_78bd2
	ld a, $b4
	predef Func_7e0c2
	jp Func_7813a

Func_78290: ; 78290 (1e:4290)
	call Func_78278
	jp z, Func_78283
	call Func_78632
	jp c, Func_7810e
	ld hl, $c500
	ld c, $1
	predef Func_7c96e
	jp Func_7810e

Func_782a6: ; 782a6 (1e:42a6)
	ld hl, Data_78ca0
	call Func_79033
	call Func_78b5e
	xor a
	call Func_782f5
	jp Func_7810e

Func_782b6:
	ld hl, $c500
	ld a, [hli]
	or [hl]
	jr z, .asm_782d7
	ld hl, Data_78f85
	call Func_78bd2
	ld de, $710
	call Func_783e2
	jp nz, Func_783d4
	ld a, [$c502]
	cp $ff
	jp z, Func_783b1
	call Func_781a3
.asm_782d7
	ld hl, Data_78cbe
	call Func_79033
	call Func_78b5e
	call Func_7901f
	jp nz, Func_78491
	call Func_78b5e
	call Func_78990
	call Func_782f5
	jp nz, Func_78491
	jp Func_7810e

Func_782f5: ; 782f5 (1e:42f5)
	ld [$ce0f], a
	ld hl, $ce00
	ld de, Data_78018
	ld bc, $f
	predef Func_015b
	predef Func_7d391
	ld [$ce01], a
	xor a
	ld [$c500], a
	ld [$c501], a
	call Func_78764
	call Func_7835f
	jr c, .asm_7833d
	cp $1
	jr nz, .asm_7833d
	ld de, Data_79a8f
	ld hl, Data_78d06
	call Func_7908f
	call Func_7835f
	jr c, .asm_7833d
	cp $2
	jr nz, .asm_7833d
	ld hl, $c500
	ld c, $ff
	predef Func_7c96e
	ld de, Data_79b4f
	ld hl, Data_78d1e
	xor a
	jr .asm_7834f

.asm_7833d
	ld de, Data_79c0f
	ld hl, Data_78d5f
	ld a, [$ce00]
	cp $4
	jr nz, .asm_7834f
	ld hl, Data_78dfe
	or $1
.asm_7834f
	push af
	call Func_7908f
	call Func_7875c
	pop af
	ret

Func_78358:
.asm_78358
	predef Func_7e168
	and $2
	jr nz, .asm_78358
	ret

Func_7835f: ; 7835f (1e:435f)
	predef Func_7ceaf
	predef Func_7aa8e
	ld a, [$ce00]
	push af
	cp $5
	call z, Func_781a3
	predef Func_7e0d2
	pop af
	ret

Func_78370: ; 78370 (1e:4370)
	predef Func_7ceaf
	predef Func_7ac8d
	jr asm_783ac

Func_78376: ; 78376 (1e:4376)
	ld hl, $ce00
	ld [hl], a
	ld d, h
	ld e, l
	ld c, $1
	predef Func_7ceaf
	predef Func_7aca4
	jr asm_783ac

Func_78384: ; 78384 (1e:4384)
	predef Func_7ceaf
	predef Func_7ac16
	jr asm_783ac

Func_7838a: ; 7838a (1e:438a)
	ld hl, $c700
	predef Func_7ceaf
	predef Func_7ac62
	jr asm_783ac

Func_78393: ; 78393 (1e:4393)
	ld de, $c600
Func_78396: ; 78396 (1e:4396)
	predef Func_7ceaf
	predef Func_7acd3
	jr asm_783ac

Func_7839c: ; 7839c (1e:439c)
	predef Func_7ceaf
	predef Func_7ac56
	jr asm_783ac

Func_783a2: ; 783a2 (1e:43a2)
	predef Func_7ceaf
	predef Func_7ac37
	jr asm_783ac

Func_783a8: ; 783a8 (1e:43a8)
	predef Func_7ceaf
	predef Func_7ac2a
asm_783ac
	push af
	predef Func_7e0d2
	pop af
	ret

Func_783b1: ; 783b1 (1e:43b1)
	ld hl, Data_78f66
Func_783b4: ; 783b4 (1e:43b4)
	call Func_78bd2
	ld a, $b4
	predef Func_7e0c2
	jp Func_7813a

Func_783be:
	call Func_78278
	jr z, Func_783b1
	call Func_783f1
	ld hl, Data_78f0f
	call Func_783dc
	jr nz, Func_783d4
	call Func_781a3
	jp Func_7810e

Func_783d4: ; 783d4 (1e:43d4)
	ld a, [$ffc1]
	call Func_78a36
	jp Func_7813a

Func_783dc: ; 783dc (1e:43dc)
	call Func_78bd2
	ld de, $710
Func_783e2: ; 783e2 (1e:43e2)
	ld a, $1
	ld bc, $2308
	ld hl, $302
	predef Func_7de32
	or a
	ret nz
	bit 1, h
	ret

Func_783f1: ; 783f1 (1e:43f1)
	call Func_78b52
	ret c
	push af
	ld hl, $68
	predef Func_7d918
	ld hl, $c500
	predef Func_7c881
	ld e, d
	pop af
	cp e
	ret nc
	call Func_78b45
	ld hl, Data_7840d
	predef Func_7af96
	ret

Data_7840d:
	dr $7840d, $7841d

Func_7841d:
	ld a, $c4
	ld h, $4
	ld bc, $301
	ld de, $d12
	predef Func_7d753
	ld de, $0
	ld hl, Data_784a6
	predef Func_7afd5
	call Func_78526
	ld bc, $a
	ld hl, $c500
	call Func_78965
	ld hl, $753
Func_78440: ; 78440 (1e:4440)
	ld de, $8865
	ld bc, $791
	predef Func_7ea15
	ld hl, $153
	predef Func_7d918
	ld hl, Data_78510
	predef Func_7af96
	ld hl, $c400
	ld de, rDMA
	ld bc, $a
	predef Func_7c577
	xor a
	ld [wOAM2_02VTile], a
	ld hl, $c400
	call Func_785dd
	ld hl, $15c
	predef Func_7d918
	ld hl, Data_78518
	predef Func_7af96
	add sp, -$4
	ld hl, sp+$0
	ld de, rLCDC
	ld bc, $4
	predef Func_7c577
	pop de
	pop bc
	ld hl, $c400
	predef Func_7d4e0
	ld hl, $c404
	predef Func_7af96
.asm_78489
	predef Func_7e0b5
	predef Func_7e17c
	and $3
	jr z, .asm_78489
Func_78491: ; 78491 (1e:4491)
	call Func_78997
	call Func_7879d
	ld a, h
	call Func_78a36
	call Func_7890e
	jp Func_7813a

Func_784a1: ; 784a1 (1e:44a1)
	ld a, $32
	predef Func_7e0c2
	ret

Data_784a6:
	dr $784a6, $78510

Data_78510: ; 78510
	dr $78510, $78518

Data_78518: ; 78518
	dr $78518, $78526

Func_78526: ; 78526 (1e:4526)
	ld hl, $c500
	ld a, [hli]
	or [hl]
	ret z
	ld hl, $c507
	ld a, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push hl
	ld d, $0
	or a
	jr z, .asm_7853a
	inc de
.asm_7853a
	ld hl, $c400
	predef Func_7d486
	ld hl, $d01
	predef Func_7d905
	ld hl, $c401
	predef Func_7af96
	pop hl
	ld a, [$c502]
	ld bc, $111b
	call Func_785ec
.asm_78551
	push de
	ld a, [hli]
	dec a
	inc hl
	bit 4, d
	jr z, .asm_78563
	bit 3, d
	jr z, .asm_78561
	sub $60
.asm_78561
	sub $60
.asm_78563
	ld c, a
	ld b, $0
	ld e, l
	ld d, h
	ld hl, $c400
	push hl
	push bc
	predef Func_015b
	pop bc
	pop hl
	add hl, bc
	ld [hl], $0
	ld hl, $400
	predef Func_7d905
	ld hl, $c400
	predef Func_7af96
	pop de
	bit 0, d
	ret z
	call Func_78934
	ld hl, $d02
	predef Func_7d905
	ld hl, $c400
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	ld hl, $c42e
	ld bc, $0
	predef Func_7d4e0
	ld hl, $c434
	predef Func_7af96
	pop de
	ld hl, $505
.asm_785a3
	push hl
	push de
	predef Func_7d905
	ld hl, $c42e
	ld bc, $a
	predef Func_015b
	xor a
	ld [wOAM2_0eYCoord], a
	ld hl, $c42e
	call Func_785dd
	pop hl
	ld bc, $a
	add hl, bc
	ld a, [hli]
	pop de
	push de
	push hl
	ld l, e
	ld h, $f
	ld e, a
	ld d, $0
	predef Func_7d905
	ld hl, $c42e
	predef Func_7d486
	ld hl, $c431
	predef Func_7af96
	pop de
	pop hl
	inc l
	ld a, l
	cp $9
	jr c, .asm_785a3
	ret

Func_785dd: ; 785dd (1e:45dd)
	ld a, [$ff92]
	push af
	or $40
	ld [$ff92], a
	predef Func_7af96
	pop af
	and $fb
	ld [$ff92], a
	ret

Func_785ec: ; 785ec (1e:45ec)
	cp $ff
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	push hl
	push de
	push bc
	jr z, .asm_78617
	or a
	jr z, .asm_78605
	ld hl, $14
	cp [hl]
	jr z, .asm_78605
	ld de, Data_78028
	jr .asm_7861f

.asm_78605
	bit 2, d
	jr z, .asm_7861c
	bit 1, d
	jr z, .asm_78612
	ld de, Data_78058
	jr .asm_7861f

.asm_78612
	ld de, Data_78048
	jr .asm_7861f

.asm_78617
	ld de, Data_78068
	jr .asm_7861f

.asm_7861c
	ld de, Data_78038
.asm_7861f
	ld hl, $c400
	ld bc, $10
	push hl
	predef Func_015b
	pop hl
	ld bc, $108
	pop de
	predef Func_7dde6
	pop de
	pop hl
	ret

Func_78632: ; 78632 (1e:4632)
	call Func_79019
	scf
	ret nz
	call Func_78764
	ld hl, $ce00
	ld de, $ce00
	ld c, $10
	call Func_78370
	ld a, $3
	jp c, Func_7871b
	ld hl, Data_7801a
	ld de, $ce02
	ld bc, $d
	predef Func_7af75
	ld a, h
	or l
	ld hl, Data_78d8d
	ld a, $6
	jp nz, Func_78741
	ld a, [$ce00]
	or a
	jp nz, Func_78741
	ld a, [$ce0f]
	push af
	ld a, $1
	call Func_78376
	call Func_78384
.asm_78672
	ld hl, Data_78cd8
	ld de, Data_79a8f
	call Func_7908f
	call Func_7826d
	call Func_783a8
	pop bc
	jp c, Func_7869a
	push bc
	ld hl, Data_78dc6
	call Func_78bd2
	ld de, $c10
	call Func_783e2
	jp nz, Func_78737
	call Func_7838a
	jr .asm_78672

Func_7869a: ; 7869a (1e:469a)
	cp $ff
	jp z, Func_7871b
	push bc
	ld a, $5
	call Func_78376
	call Func_7878a
	pop af
	ld c, a
	ld a, $ff
	ld [$c70a], a
	ld hl, $c700
	call Func_783a2
	jr nc, .asm_786c2
	cp $ff
	jr z, asm_78719
	ld hl, Data_78d36
	ld a, $4
	jr asm_78740

.asm_786c2
	push hl
	ld hl, sp+$0
	ld d, h
	ld e, l
	ld hl, $ce00
	ld c, $2
	push hl
	call Func_78370
	pop hl
	pop bc
	ld a, [hli]
	cp c
	jr nz, asm_78719
	ld a, [hl]
	cp b
	jr nz, asm_78719
	ld a, [$c509]
	bit 0, a
	jr z, asm_78700
	ld hl, $c500
	ld de, $c600
	predef Func_7cbed
	jr c, asm_78721
	ld a, b
	or c
	jr z, asm_78721
	push bc
	ld de, $ffd2
	ld b, $0
	call Func_7839c
	pop bc
	jr c, asm_78719
	call Func_78393
	jr c, asm_78719
asm_78700
	ld hl, $c500
	ld de, $c600
	ld bc, $100
	predef Func_7cc9a
	jr c, asm_78721
Func_7870d: ; 7870d (1e:470d)
	ld a, b
	or c
	jr z, asm_78721
	call Func_78393
	jr nc, asm_78700
	call Func_7838a
asm_78719
	ld a, $5
Func_7871b: ; 7871b (1e:471b)
	ld hl, Data_78d5f
	scf
	jr Func_78741

asm_78721
	call Func_78769
	jr c, asm_78719
	ld a, $2
	call Func_78376
	ld hl, Data_78cef
	ld de, Data_79b4f
	xor a
	call Func_78752
	xor a
	ret

Func_78737: ; 78737 (1e:4737)
	call Func_78358
	ld hl, Data_78dfa
	ld a, $7
	pop bc
asm_78740
	or a
Func_78741: ; 78741 (1e:4741)
	push af
	jr c, .asm_78749
	push hl
	call Func_78376
	pop hl
.asm_78749
	ld de, Data_79c0f
	pop af
	call Func_78752
	scf
	ret

Func_78752: ; 78752 (1e:4752)
	push af
	call Func_7908f
	pop af
	jr c, Func_7875c
	call Func_78384
Func_7875c: ; 7875c (1e:475c)
	xor a
	predef Func_7c19f
	ld a, $b4
	predef Func_7e0c2
	ret

Func_78764: ; 78764 (1e:4764)
	ld a, $1
	predef Func_7c19f
	ret

Func_78769: ; 78769 (1e:4769)
	ld hl, $c509
	ld a, [hli]
	push hl
	inc hl
	ld b, $0
	bit 0, a
	ld a, $fe
	jr z, .asm_78779
	sub $2e
.asm_78779
	sub [hl]
	ld e, a
	ld a, $ff
	sbc b
	ld d, a
	call Func_7839c
	pop de
	ret c
	ld bc, $1
	jp Func_78396

Func_7878a: ; 7878a (1e:478a)
	ld hl, $c505
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	inc hl
	ld b, [hl]
	ret

Func_7879d: ; 7879d (1e:479d)
	ld hl, $c800
	ld bc, $20
	ld a, [$ffc0]
	ld e, a
.asm_787a6
	push bc
	push de
	push hl
	predef Func_7ae5e
	pop hl
	pop de
	pop bc
	call Func_78965
	jr nc, .asm_787b7
	inc e
	inc h
	jr .asm_787a6

.asm_787b7
	ld a, [$ffc1]
Func_787b9: ; 787b9 (1e:47b9)
	ld de, $c3c
	ld h, a
	ld bc, $0
	cp $3
	jr c, .asm_787ca
	ld c, $1
	ld e, $5c
	sub $3
.asm_787ca
	or a
Func_787cb: ; 787cb (1e:47cb)
	ret z
	dec a
	jr z, .asm_787d4
	inc b
	ld a, d
	add $28
	ld d, a
.asm_787d4
	inc b
	ld a, d
	add $28
	ld d, a
	ret

Data_787da:
	dr $787da, $787eb

Func_787eb: ; 787eb (1e:47eb)
	ld hl, $ffc0
	ld de, rLY
	ld bc, $1
	predef Func_7c5ca
.asm_787f6
	ld a, [$ffc2]
	ld c, a
	ld a, [$ffc0]
	cp c
.asm_787fc
	jr nz, .asm_7880c
	ld a, [$ffc3]
	call Func_787b9
	ld hl, Data_787da
	ld a, $1c
	predef Func_7ad2a
	jr .asm_78811

.asm_7880c
	ld bc, $41c
	predef Func_7d8c8
.asm_78811
	call Func_7879d
Func_78814:
.asm_78814
	call Func_78fec
	push af
	ld a, h
	ld [$ffc1], a
	pop af
	or a
	bit 0, a
	ret nz
	bit 3, a
	ret nz
	bit 1, a
	scf
	ret nz
	ld l, a
	ld a, [hFF8A]
	bit 4, l
	jr nz, asm_78877
	bit 6, l
	jp nz, Func_788d7
	bit 7, l
	jp nz, Func_788f2
	bit 5, l
	jr z, .asm_78814
	ld l, $e2
	bit 2, a
	jr nz, asm_788af
	ld a, b
	or a
	jr z, .asm_7884f
	dec b
	dec h
	ld a, d
	sub $28
	ld d, a
	jp Func_78814

.asm_7884f
	ld a, c
	or a
	jr z, .asm_7885e
	ld b, $2
	ld c, $0
	dec h
	ld de, Data_79c3c
	jp Func_78814

.asm_7885e
	ld l, $5
Func_78860: ; 78860 (1e:4860)
	ld a, [$ffc0]
	or a
	jp z, Func_78814
	ld a, [$ffc1]
	add l
	ld [$ffc1], a
	ld a, [$ffc0]
	sub $6
	jr nc, .asm_78872
	xor a
.asm_78872
	ld [$ffc0], a
	jp Func_787eb

asm_78877
	ld l, $1e
	bit 2, a
	jr nz, asm_788af
	ld a, b
	cp $2
	jr z, .asm_7888b
	inc h
	inc b
	ld a, d
	add $28
	ld d, a
	jp Func_78814

.asm_7888b
	ld a, c
	or a
	jr nz, .asm_7889a
	ld b, $0
	ld c, $1
	inc h
	ld de, $c5c
	jp Func_78814

.asm_7889a
	ld l, $5
Func_7889c: ; 7889c (1e:489c)
	ld a, [$ffc0]
	add $6
	cp $78
	jp nc, Func_787eb
	ld [$ffc0], a
	ld a, [$ffc1]
	sub l
	ld [$ffc1], a
	jp Func_787eb

asm_788af
	push hl
	ld a, [$ffc0]
	ld e, a
	ld d, $0
	ld hl, $1e
	push hl
	predef Func_7d322
	pop de
	predef Func_7d2e7
	ld a, l
	pop hl
	jr asm_788c4

asm_788c2
	ld a, [$ffc0]
asm_788c4
	add l
	cp $c4
	jr nc, .asm_788d0
	cp $78
	jr c, .asm_788d2
	xor a
	jr .asm_788d2

.asm_788d0
	sub $88
.asm_788d2
	ld [$ffc0], a
	jp Func_787eb

Func_788d7: ; 788d7 (1e:48d7)
	ld l, $fa
	bit 2, a
	jr nz, asm_788c2
	ld a, c
	or a
	jr nz, .asm_788e6
	ld l, $3
	jp Func_78860

.asm_788e6
	dec c
	ld a, h
	sub $3
	ld h, a
	ld a, e
	sub $20
	ld e, a
	jp Func_78814

Func_788f2: ; 788f2 (1e:48f2)
	ld l, $6
	bit 2, a
	jr nz, asm_788c2
	ld a, c
	cp $1
	jr nz, .asm_78902
	ld l, $3
	jp Func_7889c

.asm_78902
	ld a, h
	add $3
	ld h, a
	inc c
	ld a, e
	add $20
	ld e, a
	jp Func_78814

Func_7890e: ; 7890e (1e:490e)
	push de
	ld a, h
	ld de, $c800
	add d
	ld d, a
	ld hl, $c500
	ld bc, $100
	predef Func_015b
	pop de
	ld a, $0
	ld hl, $0
	ld bc, $502
	predef Func_7d6cc
	ret

Func_78929: ; 78929 (1e:4929)
	ld hl, $c500
Func_7892c: ; 7892c (1e:492c)
	ld de, $ffd2
	ld b, $0
	predef Func_7cb98
	ret

Func_78934: ; 78934 (1e:4934)
	ld a, [$c502]
	cp $ff
	jr z, .asm_7894a
	call Func_78929
	ld hl, $c500
	ld de, $c400
	ld bc, $2e
	predef Func_7cc9a
	ret

.asm_7894a
	ld hl, $c500
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld de, $ffd2
	add hl, de
	ld d, h
	ld e, l
	ld hl, $c400
	ld bc, $2e
	predef Func_015b
	ret

Func_78965: ; 78965 (1e:4965)
	push hl
	push de
	push bc
	ld de, $c600
	predef Func_7addf
	ld hl, $c600
	pop de
	push de
	ld bc, $418
	predef Func_7dde6
	pop bc
	pop de
	pop hl
	ld a, b
	add $5
	ld b, a
	cp $f
	ret c
	ld b, $0
	ld a, c
	add $20
	ld c, a
	cp $60
	ret

Func_7898a: ; 7898a (1e:498a)
	predef Func_7c456
	ret nc
	jp Func_7a6ee

Func_78990: ; 78990 (1e:4990)
	ld a, [$ffc0]
	ld c, a
	ld a, [$ffc1]
	add c
	ret

Func_78997: ; 78997 (1e:4997)
	ld a, $a4
	ld h, $4
	ld bc, $101
	ld de, $e0e
	predef Func_7d753
	ld hl, $1200
	predef Func_7e064
	ld a, $e4
	ld [$ff9d], a
	ld a, $1b
	ld [$ff9e], a
	ld de, $0
	ld bc, $1005
	predef Func_7bdfe
	ld a, $80
	ld hl, $e01
	ld de, $101
	ld bc, $e03
	predef Func_7be3e
	ld a, $83
	ld hl, $e01
	ld de, $105
	ld bc, $e09
	predef Func_7be3e
	ld de, $e
	ld bc, $1004
	predef Func_7bdfe
	ld a, $8c
	ld hl, $e01
	ld de, $10f
	ld bc, $e02
	predef Func_7be3e
	ld de, Data_79d33
	ld bc, $c400
	predef Func_7ad4e
	ld de, $8000
	ld bc, $380
	predef Func_7ad6d
	ld a, $7
	predef Func_7d78e
	ld h, $a
	ld d, $8c
Func_789ff: ; 789ff (1e:49ff)
	ld e, $14
	ld l, $14
	call Func_78a28
	ld e, $2c
	ld l, $1a
	call Func_78a26
	ld e, $44
	ld l, $20
	call Func_78a26
	ld e, $5c
	ld l, $26
	call Func_78a26
	ld e, $74
	ld l, $2c
	call Func_78a26
	ld e, $8c
	ld l, $32
Func_78a26: ; 78a26 (1e:4a26)
	ld h, $ff
Func_78a28: ; 78a28 (1e:4a28)
	ld b, $0
Func_78a2a: ; 78a2a (1e:4a2a)
	push de
	push hl
	ld a, h
	ld h, b
	ld bc, $301
	predef Func_7d6cc
	pop hl
	pop de
	ret

Func_78a36: ; 78a36 (1e:4a36)
	push bc
	push de
	push hl
	push af
	push af
	ld hl, $c400
	ld e, $0
	ld bc, $11
	predef Func_7d5e7
	ld hl, $60
	predef Func_7d918
	pop af
	ld hl, $c800
	add h
	ld h, a
	push hl
	ld a, [hli]
	or [hl]
	jr z, .asm_78a7c
	ld de, $8
	add hl, de
	ld b, [hl]
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	inc hl
	bit 4, b
	jr z, .asm_78a6b
	sub $60
	bit 3, b
	jr z, .asm_78a6b
	sub $60
.asm_78a6b
	dec a
	cp $10
	jr c, .asm_78a72
	ld a, $10
.asm_78a72
	ld c, a
	ld b, $0
	ld e, l
	ld d, h
	ld hl, $c400
	predef Func_015b
.asm_78a7c
	ld hl, $c400
	predef Func_7af96
	ld a, $e
	predef Func_7d9f9
	ld a, $e
	predef Func_7d91f
	ld hl, $68
	predef Func_7d918
	pop hl
	ld a, [hli]
	or [hl]
	jr z, .asm_78aa3
	push af
	push hl
	inc hl
	ld a, [hl]
	ld de, $7
	add hl, de
	ld bc, $d60
	call Func_785ec
	pop hl
	pop af
.asm_78aa3
	ld bc, $7
	add hl, bc
	ld e, [hl]
	inc e
	or a
	jr nz, .asm_78aad
	ld e, a
.asm_78aad
	call Func_78b45
	ld hl, Data_78ac2
	predef Func_7af96
	ld a, [$ffc0]
	pop de
	add d
	ld e, a
	inc e
	call Func_78b45
	pop hl
	pop de
	pop bc
	ret

Data_78ac2:
	dr $78ac2, $78acb

Func_78acb: ; 78acb (1e:4acb)
	ld de, $8c14
	ld hl, $a14
	ld c, $0
Func_78ad3: ; 78ad3 (1e:4ad3)
	ld a, c
	call Func_78b88
.asm_78ad7
	push bc
	ld b, $11
	call Func_78a2a
	call Func_784a1
	jr nz, .asm_78aec
	call Func_78a28
	call Func_784a1
.asm_78ae7
	pop bc
	jr z, .asm_78ad7
	push bc
.asm_78aec
	push af
	call Func_78a28
	pop af
	pop bc
	ld b, a
	and $3
	ret nz
	bit 6, b
	jr nz, .asm_78b1f
	bit 7, b
	jr z, .asm_78ad7
	ld a, c
	cp $5
	jp z, Func_78acb
	inc c
	ld a, e
	add $18
	ld e, a
	ld a, h
	add $3
	ld h, a
	ld a, l
	add $6
	ld l, a
	jp Func_78ad3

.asm_78b14
	ld c, $5
	ld de, $8c8c
	ld hl, $1932
	jp Func_78ad3

.asm_78b1f
	ld a, c
	or a
	jr z, .asm_78b14
	dec c
	ld a, e
	sub $18
	ld e, a
	ld a, h
	sub $3
	ld h, a
	ld a, l
	sub $6
	ld l, a
	jp Func_78ad3

Func_78b33: ; 78b33 (1e:4b33)
	call Func_78997
Func_78b36: ; 78b36 (1e:4b36)
	ld hl, Data_78f3b
	call Func_78bd2
	ld hl, $90e
	predef Func_7d918
	xor a
	predef Func_7c926
	ld e, c
Func_78b45: ; 78b45 (1e:4b45)
	ld d, $0
	ld hl, $c400
	predef Func_7d486
	ld hl, $c403
	predef Func_7af96
	ret

Func_78b52: ; 78b52 (1e:4b52)
	ld a, $1
	predef Func_7c926
	ld a, b
	or a
	ret z
	ld a, e
	cp $20
	ccf
	ret

Func_78b5e: ; 78b5e (1e:4b5e)
	ld hl, $0
	predef Func_7d918
	call Func_78b52
	jr nc, .asm_78b6d
	ld a, $10
	predef Func_7d91f
	ret

.asm_78b6d
	ld e, a
	ld d, $0
	push af
	ld hl, $c400
	predef Func_7d486
	pop af
	ld hl, Data_78c8a
	or a
	jr z, .asm_78b85
	ld hl, $c404
	predef Func_7af96
	ld hl, Data_78c77
.asm_78b85
	predef Func_7af96
	ret

Func_78b88: ; 78b88 (1e:4b88)
	push bc
	push de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_78bf6
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_78bd2
	pop hl
	pop de
	pop bc
	ret

Func_78b9d: ; 78b9d (1e:4b9d)
	push hl
	ld h, $0
	ld l, a
	predef Func_7d918
	pop hl
	ret

asm_78ba5
	push hl
	ld hl, Data_78c15
	call Func_78bd2
	ld a, $10
	call Func_78b9d
	ld a, $20
	predef Func_7d93e
	predef Func_7af96
	pop hl
	jr asm_78be1

asm_78bba
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	predef Func_7af96
	pop hl
	inc hl
	jr asm_78be1

asm_78bc4
	push hl
	ld hl, Data_78c02
	call Func_78bd2
	pop hl
	jr Func_78bd2

asm_78bce
	ld a, $e
	predef Func_7d9f9
Func_78bd2: ; 78bd2 (1e:4bd2)
	ld a, [hli]
	cp $ff
	ret z
	cp $fe
	jr z, asm_78bc4
	cp $fd
	jr z, asm_78ba5
	call Func_78b9d
asm_78be1
	ld a, [hli]
	or a
	jr z, asm_78bce
	cp $fc
	jr z, asm_78bba
	sub $e0
	jr c, .asm_78bf1
	predef Func_7d91f
	jr asm_78be1

.asm_78bf1
	dec hl
	predef Func_7af96
	jr asm_78be1

Data_78bf6:
	dr $78bf6, $78c02

Data_78c02: ; 78c02
	dr $78c02, $78c15

Data_78c15: ; 78c15
	dr $78c15, $78c77

Data_78c77: ; 78c77
	dr $78c77, $78c8a

Data_78c8a: ; 78c8a
	dr $78c8a, $78ca0

Data_78ca0: ; 78ca0
	dr $78ca0, $78cbe

Data_78cbe: ; 78cbe
	dr $78cbe, $78cd8

Data_78cd8: ; 78cd8
	dr $78cd8, $78cef

Data_78cef: ; 78cef
	dr $78cef, $78d06

Data_78d06: ; 78d06
	dr $78d06, $78d1e

Data_78d1e: ; 78d1e
	dr $78d1e, $78d36

Data_78d36: ; 78d36
	dr $78d36, $78d5f

Data_78d5f: ; 78d5f
	dr $78d5f, $78d8d

Data_78d8d: ; 78d8d
	dr $78d8d, $78dc6

Data_78dc6: ; 78dc6
	dr $78dc6, $78dfa

Data_78dfa: ; 78dfa
	dr $78dfa, $78dfe

Data_78dfe: ; 78dfe
	dr $78dfe, $78f0f

Data_78f0f: ; 78f0f
	dr $78f0f, $78f3b

Data_78f3b: ; 78f3b
	dr $78f3b, $78f66

Data_78f66: ; 78f66
	dr $78f66, $78f76

Data_78f76: ; 78f76
	dr $78f76, $78f85

Data_78f85: ; 78f85
	dr $78f85, $78fb1

Data_78fb1: ; 78fb1
	dr $78fb1, $78fc1

Data_78fc1: ; 78fc1
	dr $78fc1, $78fec

Func_78fec: ; 78fec (1e:4fec)
	push bc
	push de
	push hl
	ld a, h
	call Func_78a36
.asm_78ff3
	ld h, $0
	push de
	push hl
	ld a, $0
	ld l, $0
	ld bc, $502
	predef Func_7d6cc
	call Func_784a1
	jr nz, .asm_79013
	ld bc, $a00
	predef Func_7d8c8
	call Func_784a1
	jr nz, .asm_79013
	pop hl
	pop de
	jr .asm_78ff3

.asm_79013
	pop hl
	pop de
	pop hl
	pop de
	pop bc
	ret

Func_79019: ; 79019 (1e:5019)
	ld hl, Data_78cbe
	call Func_79033
Func_7901f: ; 7901f (1e:501f)
	predef Func_7e0b5
	predef Func_7e17c
	and $3
	jr z, Func_7901f
	and $2
	ret nz
	push af
	ld hl, Data_78ca0
	call Func_78bd2
	pop af
	ret

Func_79033: ; 79033 (1e:5033)
	push hl
	ld a, $a4
.asm_79036
	ld h, $0
	ld bc, $e02
	ld de, $310
	predef Func_7d753
	hlbgcoord 0, 0
	ld bc, $240
	ld e, $4
	predef Func_7d5e7
	ld a, $ca
	ld bc, $e02
	ld de, $310
	predef Func_7dc58
	ld de, Data_790b2
	ld bc, $c400
	predef Func_7ad4e
	ld de, $9000
	ld bc, $800
	predef Func_7ad6d
	ld de, $8800
	ld bc, $470
	predef Func_7ad6d
	ld hl, $8c70
	ld bc, $390
	ld e, $0
	predef Func_7d5e7
	hlbgcoord 0, 13
	ld de, Data_79ccf
	ld b, $5
	ld c, $14
	call Func_7909b
	pop hl
	ld de, Data_799cf
	call Func_7908f
	ld a, $1
	predef Func_7d78e
	ret

Func_7908f: ; 7908f (1e:508f)
	push de
	call Func_78bd2
	pop de
	hlbgcoord 2, 0
	ld b, $c
	ld c, $10
Func_7909b: ; 7909b (1e:509b)
	push bc
	push hl
	push de
	ld b, $0
	push bc
	predef Func_015b
	pop bc
	pop hl
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, Func_7909b
	ret

Data_790b2:
	dr $790b2, $799cf

Data_799cf: ; 799cf
	dr $799cf, $79a8f

Data_79a8f: ; 79a8f
	dr $79a8f, $79b4f

Data_79b4f: ; 79b4f
	dr $79b4f, $79c0f

Data_79c0f: ; 79c0f
	dr $79c0f, $79c3c

Data_79c3c: ; 79c3c
	dr $79c3c, $79ccf

Data_79ccf: ; 79ccf
	dr $79ccf, $79d33

Data_79d33: ; 79d33
	dr $79d33, $79ea7

Func_79ea7:
	call Func_7a57f
	ld a, $1
	call Func_7a6c2
	ld de, $470d
	ld hl, $c699
	predef Func_7b85e
	ld a, $3
	predef Func_7d78e
asm_79ebb
	predef Func_7e0b5
	predef Func_7e17c
	ld c, a
	and $6
	jp nz, Func_79f61
	ld a, c
	and $9
	jr nz, Func_79ef2
	bit 6, c
	jr nz, .asm_79ed7
	bit 7, c
	jr nz, .asm_79edf
	call Func_79f2d
	jr asm_79ebb

.asm_79ed7
	call Func_79ee7
	call Func_79f21
	jr asm_79ebb

.asm_79edf
	call Func_79ee7
	call Func_79f15
	jr asm_79ebb

Func_79ee7: ; 79ee7 (1e:5ee7)
	xor a
	ld [$ffc1], a
	call Func_7a181
	ld c, $11
	predef Func_7bdaa
	ret

Func_79ef2:
	xor a
	call Func_7a6c2
	call Func_7a181
	predef Func_7b93a
	jr c, .asm_79f0e
	ld a, $1
	ld [$ffc2], a
	ld a, [hFF8A]
	bit 2, a
	jp nz, Func_79f61
	call Func_79f15
	xor a
	ld [$ffc1], a
.asm_79f0e
	ld a, $1
	call Func_7a6c2
	jr asm_79ebb

Func_79f15: ; 79f15 (1e:5f15)
	ld a, [$ffc0]
	inc a
	cp $9
	jr c, .asm_79f1e
	ld a, $1
.asm_79f1e
	ld [$ffc0], a
	ret

Func_79f21: ; 79f21 (1e:5f21)
	ld a, [$ffc0]
	dec a
	bit 7, a
	jr z, .asm_79f2a
	ld a, $8
.asm_79f2a
	ld [$ffc0], a
	ret

Func_79f2d: ; 79f2d (1e:5f2d)
	ld hl, $ffc1
	ld a, [hl]
	inc [hl]
	and $f
	ret z
	bit 4, [hl]
	push af
	call Func_7a181
	ld c, $11
	pop af
	jr z, .asm_79f44
	predef Func_7bdaa
	jr .asm_79f60

.asm_79f44
	ld b, e
.asm_79f45
	push hl
	push de
	push bc
	ld e, [hl]
	predef Func_7bdc7
	push hl
	ld hl, $c3ee
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop hl
	predef Func_015b
	pop bc
	pop de
	pop hl
	inc hl
	ld a, b
	add d
	ld d, a
	dec c
	jr nz, .asm_79f45
.asm_79f60
	ret

Func_79f61: ; 79f61 (1e:5f61)
	call Func_79ee7
	call Func_7a501
Func_79f67:
	xor a
	ld de, Data_79f82
	predef Func_7b776
	jp c, Func_79ea7
	ld l, a
	ld h, $0
	predef Func_7b6d3
	db 6
	; 5f76
	dw Func_79ea7 - @
	dw Func_7a01f - @
	dw Func_7a071 - @
	dw Func_7a0ba - @
	dw Func_79fb7 - @
	dw Func_79fa4 - @

Data_79f82:
	dr $79f82, $79f89

Func_79f89: ; 79f89 (1e:5f89)
	push af
	call Func_7a52c
	pop af
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_7a1a1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, $30
	ld e, $1
	predef Func_7bd42
	ld a, d
	ld [$ffc4], a
	or a
	ret

Func_79fa4:
	ld a, [$ffc2]
	or a
	jr z, Func_79fb5
	ld a, $8
	call Func_79f89
	call Func_7a169
	jr nc, Func_79fb5
	jr Func_79f67

Func_79fb5:
	predef Func_0150

Func_79fb7:
	call Func_7a57f
	ld a, [$ffc0]
	push af
	ld a, $1
	ld [$ffc0], a
	ld a, $7
	call Func_79f89
	ld a, $3
	predef Func_7d78e
.asm_79fca
	predef Func_7e0b5
	predef Func_7e17c
	bit 6, a
	jr nz, .asm_79fed
	bit 7, a
	jr nz, .asm_79ffa
	bit 0, a
	jr nz, .asm_7a002
	bit 4, a
	jr nz, .asm_7a002
	and $6
	jr nz, .asm_79fe7
.asm_79fe2
	call Func_79f2d
	jr .asm_79fca

.asm_79fe7
	pop af
	ld [$ffc0], a
	jp Func_79f61

.asm_79fed
	call Func_79ee7
.asm_79ff0
	call Func_79f21
	ld a, [$ffc0]
	or a
	jr z, .asm_79ff0
	jr .asm_79fe2

.asm_79ffa
	call Func_79ee7
	call Func_79f15
	jr .asm_79fe2

.asm_7a002
	call Func_79ee7
	predef Func_022c
	ld hl, $400
	predef Func_7e064
	call Func_7a14f
	predef Func_7ae86
	call Func_79f15
	ld hl, $404
	predef Func_7e064
	predef Func_022c
	predef Func_7e0d2
	jr .asm_79fca

Func_7a01f:
	ld a, [$ffc0]
	push af
	xor a
	ld [$ffc0], a
.asm_7a025
	call Func_7a14f
	or a
	jr nz, .asm_7a037
	ld a, $9
	call Func_79f89
	call Func_7a173
	pop af
	jp Func_79ea7

.asm_7a037
	inc a
	ld c, a
	ld de, $c6df
	ld a, $81
	ld [de], a
	ld hl, $c500
	ld c, $0
	predef Func_7afe6
	jr c, .asm_7a059
	ld a, $a
	call Func_79f89
	call Func_7a169
	jr c, .asm_7a06b
	ld hl, $c500
	predef Func_7c8ec
	jr .asm_7a025

.asm_7a059
	call Func_7a6ab
	ld a, $6
	jr c, .asm_7a065
	xor a
	ld [$ffc2], a
	ld a, $b
.asm_7a065
	call Func_79f89
	call Func_7a173
.asm_7a06b
	pop af
	ld [$ffc0], a
	jp Func_79f67

Func_7a071:
	call Func_7a57f
	ld a, $c
	call Func_79f89
	ld a, $3
	predef Func_7d78e
	call Func_7a169
	jp c, Func_79f61
	ld a, $d
	call Func_79f89
	ld a, $1
	predef Func_7c19f
	predef Func_7ceaf
	call Func_7a11d
	jr c, .asm_7a0b0
	ld hl, $c600
	ld e, l
	ld d, h
	ld c, $99
	predef Func_7aca4
	jr c, .asm_7a0b5
	predef Func_7ac16
	jr c, .asm_7a0b5
	ld a, $e
	call Func_79f89
.asm_7a0a7
	xor a
	predef Func_7c19f
	call Func_7a173
	jp Func_79f61

.asm_7a0b0
	call Func_7a114
	jr .asm_7a0a7

.asm_7a0b5
	call Func_7a112
	jr .asm_7a0a7

Func_7a0ba:
	ld a, [$ffc2]
	or a
	jr z, .asm_7a0c9
	ld a, $12
	call Func_79f89
	call Func_7a169
	jr c, .asm_7a103
.asm_7a0c9
	ld a, $11
	call Func_79f89
	predef Func_7ceaf
	ld de, Data_7a61d
	ld hl, $c6d5
	ld bc, $a
	predef Func_015b
	ld a, $1
	predef Func_7c19f
	predef Func_7aa8e
	push af
	xor a
	predef Func_7c19f
	pop af
	jr c, .asm_7a10d
	ld a, [$c6d5]
	or a
	jr z, .asm_7a106
	xor a
	ld [$ffc0], a
	call Func_79ee7
	call Func_79f15
	ld a, $e
	call Func_79f89
	ld a, $1
	ld [$ffc2], a
.asm_7a100
	call Func_7a173
.asm_7a103
	jp Func_79f67

.asm_7a106
	ld a, $f
	call Func_79f89
	jr .asm_7a100

.asm_7a10d
	call Func_7a112
	jr .asm_7a100

Func_7a112: ; 7a112 (1e:6112)
	ld a, $10
Func_7a114: ; 7a114 (1e:6114)
	call Func_79f89
.asm_7a117
	predef Func_7e17c
	or a
	jr nz, .asm_7a117
	ret

Func_7a11d: ; 7a11d (1e:611d)
	ld hl, $c6d5
	ld de, $c400
	ld bc, $a
	predef Func_7ac8d
	jr c, .asm_7a146
	ld hl, $c400
	ld de, Data_7a61d
	ld bc, $a
	predef Func_7af75
	or a
	jr nz, .asm_7a149
	inc a
	ld hl, $c400
	ld [hl], a
	ld de, $c6d5
	ld bc, $a
	predef Func_7aca4
	ret nc
.asm_7a146
	ld a, $10
	ret

.asm_7a149
	predef Func_7ac16
	ld a, $f
	scf
	ret

Func_7a14f: ; 7a14f (1e:614f)
	call Func_7a181
	ld de, $c708
	push de
	inc c
	dec c
	jr z, .asm_7a160
.asm_7a15a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7a15a
.asm_7a160
	xor a
	ld [de], a
	pop de
	ld hl, $c6e0
	predef Func_7be8b
	ret

Func_7a169: ; 7a169 (1e:6169)
	ld a, [$ffc4]
	ld d, a
	ld e, $1
	ld hl, Data_7a4c5
	predef Func_7bd42
Func_7a173: ; 7a173 (1e:6173)
	predef Func_7e0b5
	predef Func_7e17c
	and $3
	jr z, Func_7a173
	or a
	bit 1, a
	ret z
	scf
	ret

Func_7a181: ; 7a181 (1e:6181)
	ld b, $11
	ld a, [$ffc0]
	or a
	jr nz, .asm_7a18a
	ld b, $c
.asm_7a18a
	ld e, a
	add a
	add a
	add a
	add a
	add e
	ld e, a
	ld d, $0
	ld hl, $c600
	add hl, de
	add $80
	ld d, a
	ld e, $1
	ld a, b
	predef Func_7be72
	ld c, a
	ret

Pointers_7a1a1:
	dr $7a1a1, $7a4c5

Data_7a4c5: ; 7a4c5
	dr $7a4c5, $7a4d3

Func_7a4d3:
	ld hl, $c500
	ld a, [hli]
	or [hl]
	jp nz, Func_7a678
	ld hl, $d2
	predef Func_7c5da
	bit 7, h
	jr nz, .asm_7a4ec
	predef Func_7c7b7
	xor a
	predef Func_7c926
	inc b
	dec b
	ret nz
.asm_7a4ec
	call Func_7a6dc
	ld a, $3
	predef Func_7d78e
	ld a, $13
	call Func_79f89
	call Func_7a169
	jp c, Func_79fb5
	predef Func_7d8d7
	ret

Func_7a501:
	predef Func_7d8d7
	call Func_7a6dc
	ld de, Data_78078
	ld hl, $9700
	ld bc, $10
	predef Func_015b
	call Func_7a5db
	ld de, $204
	ld bc, $1109
	predef Func_7bdfe
	ld hl, Data_7a535
	ld de, $9101
	predef Func_7bd42
	call Func_7a52c
	ld a, $3
	predef Func_7d78e
	ret

Func_7a52c: ; 7a52c (1e:652c)
	ld de, $d
	ld bc, $1405
	predef Func_7bdfe
	ret

Data_7a535:
	dr $7a535, $7a57f

Func_7a57f: ; 7a57f (1e:657f)
	predef Func_7d8d7
	call Func_7a6dc
	ld a, $e4
	ld [$ff9d], a
	call Func_7a5c6
	call Func_7a5db
	ld de, $103
	ld bc, $130a
	predef Func_7bdfe
	ld a, $73
	ld de, $103
	predef Func_7d9c5
	inc a
	ld d, $13
	predef Func_7d9c5
	ld a, $91
	ld hl, $111
	ld de, $204
	ld bc, $1108
	predef Func_7be3e
	ld a, [$ffc0]
	push af
	xor a
	ld [$ffc0], a
	ld c, $9
.asm_7a5b7
	push bc
	call Func_79ee7
	call Func_79f15
	pop bc
	dec c
	jr nz, .asm_7a5b7
	pop af
	ld [$ffc0], a
	ret

Func_7a5c6: ; 7a5c6 (1e:65c6)
	ld hl, $8800
	ld bc, $f30
	ld e, $0
	predef Func_7d5e7
	hlbgcoord 0, 0
	ld bc, $400
	ld e, $7f
	predef Func_7d5e7
	ret

Func_7a5db: ; 7a5db (1e:65db)
	hlbgcoord 0, 0
	ld bc, $400
.asm_7a5e1
	ld a, $7f
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_7a5e1
	ld de, $101
	ld bc, $1303
	predef Func_7bdfe
	ld a, $80
	ld hl, $111
	ld de, $702
	ld bc, $c01
	predef Func_7be3e
	ld hl, Data_7a607
	ld de, $2001
	predef Func_7bd42
	ret

Data_7a607:
	dr $7a607, $7a61d

Data_7a61d: ; 7a61d
	dr $7a61d, $7a627

Func_7a627: ; 7a627 (1e:6627)
	call Func_7a651
Func_7a62a: ; 7a62a (1e:662a)
	ld de, $c500
	ld hl, $c400
	ld bc, $100
	predef Func_015b
	ld de, $c699
	call Func_7a65c
	call Func_7a651
	ld de, $c400
	ld hl, $c500
	ld bc, $100
	predef Func_015b
	xor a
	ld [$ffc0], a
	ld [$ffc1], a
	ld [$ffc2], a
	ret

Func_7a651: ; 7a651 (1e:6651)
	ld hl, $c600
	ld bc, $99
	ld e, $20
	predef Func_7d5e7
	ret

Func_7a65c: ; 7a65c
	dr $7a65c, $7a678

Func_7a678:
	dr $7a678, $7a6ab

Func_7a6ab: ; 7a6ab
	dr $7a6ab, $7a6c2

Func_7a6c2: ; 7a6c2
	dr $7a6c2, $7a6dc

Func_7a6dc: ; 7a6dc
	dr $7a6dc, $7a6ee

Func_7a6ee: ; 7a6ee
	dr $7a6ee, $7aa8e

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

Func_7b6d3: ; 7b6d3 (1e:76d3)
	pop de
	ld a, [de]
	inc de
	inc h
	dec h
	jr nz, .default
	cp l
	jr nc, .go
.default
	ld l, a
.go
	ld a, l
	add a
	add e
	ld l, a
	ld a, $0
	adc d
	ld h, a
relAnonJumpTable:
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	add hl, de
	jp [hl]

Func_7b6ec: ; 7b6ec (1e:76ec)
	ld e, l
	ld d, h
	pop hl
	inc d
	dec d
	jr nz, .find_first_null
.indexed_array_in_table
	ld a, [hli]
	cp e
	jr z, relAnonJumpTable_find_first_non_null
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .indexed_array_in_table
	jr relAnonJumpTable

.find_first_null
	inc hl
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .find_first_null
relAnonJumpTable_find_first_non_null
	ld a, [hli]
	or [hl]
	inc hl
	jr z, relAnonJumpTable_find_first_non_null
	dec hl
	dec hl
	jr relAnonJumpTable

Func_7b70d: ; 7b70d (1e:770d)
	ld e, l
	ld d, h
	pop hl
.find_in_table
	ld a, [hli]
	cp e
	jr nz, .not_found
	ld a, [hli]
	cp d
	jr z, relAnonJumpTable_find_first_non_null
	dec hl
.not_found
	inc hl
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .find_in_table
	jr relAnonJumpTable

asm_7b721
	ld b, $a0
	bit 7, d
	jr z, asm_7b74e
	ld b, $41
	jr asm_7b74e

Func_7b72b: ; 7b72b (1e:772b)
	ld a, d
	xor h
	rla
	jr c, asm_7b721
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	rra
	and $c0
	ld b, a
	ld a, l
	or h
	jr nz, .asm_7b742
	set 4, b
	jr asm_7b74e

.asm_7b742
	bit 7, h
	jr nz, .asm_7b748
	set 5, b
.asm_7b748
	bit 7, b
	jr nz, asm_7b74e
	set 0, b
asm_7b74e
	ld a, b
	ld b, $0
	ld hl, Data_7b75d
	add hl, bc
	and [hl]
	ld hl, $0
	ret z
	inc hl
	scf
	ret

Data_7b75d:
	dr $7b75d, $7b767

Func_7b767: ; 7b767 (1e:7767)
	ld a, [hli]
	bit 7, a
	ret nz
	push hl
	ld l, [hl]
	ld h, a
	predef Func_7d905
	pop hl
	inc hl
	predef Func_7af96
	jr Func_7b767

Func_7b776: ; 7b776 (1e:7776)
	add sp, -$a
	ld hl, sp+$0
	ld [hli], a
	ld [hl], $0
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld [hl], $0
	ld hl, sp+$5
	ld a, [de]
	inc de
	ld [hld], a
	ld a, [de]
	inc de
	ld [hl], a
	ld hl, sp+$6
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
asm_7b797
	dec de
	ld h, a
	or l
	jr z, .asm_7b79d
	add hl, de
.asm_7b79d
	ld e, l
	ld d, h
	ld hl, sp+$8
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$0
	ld e, [hl]
	jr asm_7b7f4

Func_7b7a9: ; 7b7a9 (1e:77a9)
	push hl
	push de
	push hl
	add sp, -$4
	ld hl, sp+$0
	ld [hl], c
	inc hl
	ld [hl], $0
	inc hl
	ld [hl], b
	ld hl, sp+$8
	xor a
	ld [hli], a
	ld [hl], a
asm_7b7bb
	predef Func_7e0b5
	predef Func_7e17c
	ld hl, sp+$3
	ld [hl], a
	ld c, a
	and $9
	jr nz, asm_7b813
	ld a, c
	and $6
	jr nz, asm_7b81d
	ld hl, sp+$2
	ld b, [hl]
	ld hl, sp+$0
	ld a, [hl]
	bit 6, c
	jr nz, .asm_7b7df
	bit 7, c
	jr nz, .asm_7b7e8
	call Func_7b827
	jr asm_7b7bb

.asm_7b7df
	dec a
	bit 7, a
	jr z, .asm_7b7ed
	ld a, b
	dec a
	jr .asm_7b7ed

.asm_7b7e8
	inc a
	cp b
	jr c, .asm_7b7ed
	xor a
.asm_7b7ed
	ld e, a
	call Func_7b832
	ld hl, sp+$0
	ld [hl], e
asm_7b7f4
	inc hl
	ld [hl], $0
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld hl, sp+$8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_7b80e
	ld a, e
	ld de, .Return
	push de
	jp [hl]

.Return: ; 7b809 (1e:7809)
	jr nc, .asm_7b80e
	ld hl, sp+$0
	ld [hl], a
.asm_7b80e
	call Func_7b827
	jr asm_7b7bb

asm_7b813
	call Func_7b832
	ld hl, sp+$0
	ld a, [hl]
	add sp, $a
	or a
	ret

asm_7b81d
	call Func_7b832
	ld hl, sp+$0
	ld a, [hl]
	add sp, $a
	scf
	ret

Func_7b827: ; 7b827 (1e:7827)
	ld hl, sp+$3
	ld a, [hl]
	inc [hl]
	and $f
	ret nz
	bit 4, [hl]
	jr z, asm_7b836
Func_7b832: ; 7b832 (1e:7832)
	ld hl, sp+$9
	jr asm_7b838

asm_7b836
	ld hl, sp+$8
asm_7b838
	ld c, [hl]
	ld hl, sp+$2
	ld b, [hl]
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	add b
	ld l, a
	predef Func_7d905
	ld a, c
	predef Func_7d93e
	ret

Func_7b848: ; 7b848 (1e:7848)
	ld hl, hFFAB
	xor a
	ld [hli], a
	ld [hl], a
	ld [hFFAE], a
	ld c, $5
	ld hl, hFFAF
.asm_7b855
	ld [hli], a
	dec c
	jr nz, .asm_7b855
	ld a, $3
	ld [hFFB4], a
	ret

Func_7b85e: ; 7b85e (1e:785e)
	ld a, d
	ld [hFFAA], a
	push de
	ld e, l
	ld d, h
	ld hl, hFFA8
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, e
	or d
	jr nz, .asm_7b878
	ld de, hFFAE
	ld a, [de]
	cp $4
	jr nz, .asm_7b878
	xor a
	ld [de], a
.asm_7b878
	pop de
	push de
	ld d, $1
	ld bc, $1305
	predef Func_7bdfe
	pop de
	push de
	ld a, d
	inc e
	ld d, $2
	ld hl, $10c
	ld bc, $c03
	predef Func_7be3e
	pop de
	push de
	inc e
	inc e
	ld bc, $1
	ld d, $0
	ld a, $7f
	predef Func_7d9c5
	predef Func_7d9c5
	predef Func_7d9c5
	pop de
	push de
	ld bc, $1
	ld d, $e
	ld a, $7e
	predef Func_7d9c5
	ld a, $75
	predef Func_7d9c5
	predef Func_7d9c5
	predef Func_7d9c5
	ld a, $7d
	predef Func_7d9c5
	pop de
	push de
	inc e
	inc e
	ld a, d
	add $24
	ld d, $f
	ld hl, $104
	ld bc, $401
	predef Func_7be3e
	pop de
	push de
	ld a, d
	add $28
	ld d, $0
	ld hl, $102
	ld bc, $202
	predef Func_7be3e
	xor a
	call Func_7bf1f
	pop de
	call Func_7bb09
	ld de, Data_7bfeb
	ld hl, $87f0
	ld bc, $10
	predef Func_015b
	ret

Func_7b8eb: ; 7b8eb (1e:78eb)
	push hl
	push de
	push bc
	add sp, -$3c
	ld hl, sp+$0
	ld e, l
	ld d, h
	ld hl, sp+$40
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7beff
	push af
	ld c, a
	jr .asm_7b905

.asm_7b900
	ld a, $20
	ld [de], a
	inc de
	inc c
.asm_7b905
	ld a, b
	cp c
	jr nz, .asm_7b900
	pop af
	ld c, a
	cp b
	jr nz, .asm_7b90f
	dec c
.asm_7b90f
	ld hl, sp+$3d
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	predef Func_7b93a
	ld hl, sp+$3d
	ld a, [hl]
	ld hl, sp+$0
	call Func_7be72
	ld c, a
	ld b, $0
	add hl, bc
	ld [hl], $0
	ld hl, sp+$0
	ld e, l
	ld d, h
	ld hl, sp+$40
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7be8b
	add sp, $3c
	pop bc
	pop de
	pop hl
	ret

Func_7b93a: ; 7b93a (1e:793a)
	push hl
	ld hl, hFFA2
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], b
	inc hl
	ld [hl], c
	inc hl
	pop bc
	push bc
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	ld a, [hFFA4]
	ld c, a
	call Func_7bdaa
	ld a, [hFFA5]
	ld c, a
	or a
	ld a, d
	jr z, .asm_7b959
.asm_7b959
	add e
	dec c
	jr nz, .asm_7b959
	ld [hFFA2], a
	ld a, $1
	call Func_7bf1f
asm_7b964
	predef Func_7e0b5
	predef Func_7e17c
	ld b, a
	and $c
	jr nz, asm_7b983
	ld a, [hFFAB]
	cp $c
	jr z, Func_7b97b
	bit 0, b
	jr nz, asm_7b98e
	bit 1, b
	jr nz, asm_7b9c0
Func_7b97b:
	call Func_7b9f9
	call Func_7ba84
	jr asm_7b964

asm_7b983
	call Func_7ba80
	xor a
	call Func_7bf1f
	ld a, [hFFA5]
	or a
	ret

asm_7b98e
	ld a, [hFFAB]
	cp $c
	jr z, Func_7b97b
	ld hl, hFFA5
	ld a, [hld]
	cp [hl]
	jr nc, .asm_7b9be
	ld a, [hFFAE]
	call Func_7bba4
	ld e, a
	ld a, [hFFA2]
	ld d, a
	call Func_7bdbb
	call Func_7bb02
	ld a, [hFFA5]
	ld c, a
	ld b, $0
	add hl, bc
	ld [hl], e
	ld hl, hFFA4
	cp [hl]
	jr nc, .asm_7b9be
	inc hl
	inc [hl]
	ld a, [hFFA3]
	add d
	ld [hFFA2], a
.asm_7b9be
	jr Func_7b97b

asm_7b9c0
	ld a, [hFFA2]
	ld d, a
	ld hl, hFFA5
	ld a, [hld]
	ld c, a
	or a
	jr z, Func_7b97b
	cp [hl]
	jr nc, .asm_7b9d3
	ld e, $20
	call Func_7bdbb
.asm_7b9d3
	dec hl
	ld a, d
	sub [hl]
	ld [hFFA2], a
	ld d, a
	ld e, $20
	call Func_7bdbb
	ld hl, hFFA5
	ld a, [hl]
	dec [hl]
	dec hl
	cp [hl]
	jr c, .asm_7b9e8
	dec a
.asm_7b9e8
	push af
	ld c, a
	ld b, $0
	call Func_7bb02
	add hl, bc
	ld [hl], e
	pop af
	jr nc, .asm_7b9f6
	dec hl
	ld [hl], e
.asm_7b9f6
	jp Func_7b97b

Func_7b9f9: ; 7b9f9 (1e:79f9)
	ld a, [hFFB6]
	ld b, a
	ld hl, hFFAB
	ld a, [hli]
	cp $c
	jr z, .asm_7ba1a
	ld a, [hl]
	bit 6, b
	jr nz, .asm_7ba60
	bit 7, b
	jr nz, .asm_7ba6e
.asm_7ba0d
	ld hl, hFFAB
	ld a, [hl]
	bit 5, b
	jr nz, .asm_7ba4e
	bit 4, b
	jr nz, .asm_7ba57
	ret

.asm_7ba1a
	ld c, $5
	ld hl, hFFA8
	ld a, [hli]
	or [hl]
	jr nz, .asm_7ba25
	ld c, $4
.asm_7ba25
	ld hl, hFFAE
	ld a, [hl]
	bit 6, b
	jr nz, .asm_7ba3c
	bit 7, b
	jr nz, .asm_7ba45
	ld a, b
	and $30
	ret z
	push bc
	call Func_7ba80
	pop bc
	jr .asm_7ba0d

.asm_7ba3c
	dec a
	bit 7, a
	jr z, .asm_7ba4a
	ld a, c
	dec a
	jr .asm_7ba4a

.asm_7ba45
	inc a
	cp c
	jr c, .asm_7ba4a
	xor a
.asm_7ba4a
	ld [hl], a
	jp Func_7bb09

.asm_7ba4e
	dec a
	bit 7, a
	jr z, .asm_7ba5d
	ld a, $c
	jr .asm_7ba5d

.asm_7ba57
	inc a
	cp $d
	jr c, .asm_7ba5d
	xor a
.asm_7ba5d
	ld [hl], a
	jr asm_7ba7c

.asm_7ba60
	or a
	jr nz, .asm_7ba6b
	call Func_7bb56
	call Func_7bb09
	jr asm_7ba7c

.asm_7ba6b
	dec a
	jr asm_7ba7b

.asm_7ba6e
	cp $2
	jr c, .asm_7ba7a
	call Func_7bb66
	call Func_7bb09
	jr asm_7ba7c

.asm_7ba7a
	inc a
asm_7ba7b
	ld [hl], a
asm_7ba7c
	xor a
	ld [hFFAD], a
	ret

Func_7ba80: ; 7ba80 (1e:7a80)
	ld a, $10
	ld [hFFAD], a
Func_7ba84: ; 7ba84 (1e:7a84)
	ld a, [hFFAD]
	and $f
	jr nz, .asm_7babc
	ld a, [hFFA2]
	ld d, a
	ld hl, hFFA5
	ld a, [hld]
	ld c, a
	cp [hl]
	jr c, .asm_7ba9a
	dec hl
	ld a, d
	sub [hl]
	ld d, a
	dec c
.asm_7ba9a
	ld a, [hFFAD]
	bit 4, a
	jr z, .asm_7baac
	ld b, $0
	call Func_7bb02
	add hl, bc
	ld e, [hl]
	call Func_7bdc7
	jr .asm_7baba

.asm_7baac
	ld e, $20
	call Func_7bdc7
	push hl
	ld hl, $c3ee
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop hl
.asm_7baba
	predef Func_015b
.asm_7babc
	ld hl, $c39c
	push hl
	xor a
	ld [hli], a
	ld [hld], a
	pop de
	ld hl, hFFAD
	ld a, [hFFAB]
	cp $c
	jr z, .asm_7baed
	ld a, [hl]
	inc [hl]
	and $10
	ret nz
	ld hl, hFFAC
	ld a, [hld]
	add a
	add a
	add a
	add $80
	ld [de], a
	inc de
	ld a, [hl]
	add a
	add a
	add a
	add $18
	ld [de], a
	inc de
	ld a, $7f
	ld [de], a
	inc de
	ld a, $0
	ld [de], a
	ret

.asm_7baed
	ld a, [hl]
	inc [hl]
	and $f
	ret nz
	bit 4, [hl]
	jr nz, .asm_7bafa
	ld a, $30
	ld [hFFB4], a
.asm_7bafa
	call Func_7bb2a
	ld a, $3
	ld [hFFB4], a
	ret

Func_7bb02: ; 7bb02 (1e:7b02)
	ld hl, hFFA6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_7bb09: ; 7bb09 (1e:7b09)
	ld c, $3
	call Func_7bb72
	push af
	ld a, [hFFAA]
	ld d, a
.asm_7bb12
	ld b, $c
.asm_7bb14
	ld a, [hli]
	ld e, a
	call Func_7bdbb
	inc d
	dec b
	jr nz, .asm_7bb14
	push de
	call Func_7bb66
	pop de
	dec c
	jr nz, .asm_7bb12
	call Func_7bb72
	pop af
	ld [de], a
Func_7bb2a: ; 7bb2a (1e:7b2a)
	ld a, [hFFAA]
.asm_7bb2c
	add $24
	ld d, a
	ld a, [hFFAE]
	add a
	add a
	ld c, a
	ld b, $0
	ld hl, Data_7bb42
	add hl, bc
	ld c, $4
	ld e, $1
	call Func_7bdaa
	ret

Data_7bb42:
	dr $7bb42, $7bb56

Func_7bb56: ; 7bb56 (1e:7b56)
	push de
	call Func_7bb8b
	ld a, [de]
	dec a
	bit 7, a
	jr z, .asm_7bb62
	ld a, [hl]
	dec a
.asm_7bb62
	ld [de], a
	pop de
	jr Func_7bb72

Func_7bb66: ; 7bb66 (1e:7b66)
	push de
	call Func_7bb8b
	ld a, [de]
	inc a
	cp [hl]
	jr c, .asm_7bb70
	xor a
.asm_7bb70
	ld [de], a
	pop de
Func_7bb72: ; 7bb72 (1e:7b72)
	push bc
	call Func_7bb8b
	inc hl
	ld a, [de]
	call Func_7bbcd
	ld a, [hFFAE]
	cp $4
	jr nz, .asm_7bb87
	ld hl, hFFA8
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_7bb87
	add hl, bc
	ld a, [de]
	pop bc
	ret

Func_7bb8b: ; 7bb8b (1e:7b8b)
	push bc
	ld a, [hFFAE]
	ld c, a
	ld b, $0
	ld hl, hFFAF
	add hl, bc
	push hl
	add a
	ld e, a
	ld d, $0
	ld hl, Data_7bbd7
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	pop bc
	ret

Func_7bba4: ; 7bba4 (1e:7ba4)
	push hl
	push de
	push bc
	call Func_7bbc0
	ld a, [hFFAE]
	cp $4
	jr nz, .asm_7bbb6
	ld hl, hFFA8
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_7bbb6
	add hl, bc
	ld a, [hFFAB]
	ld c, a
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_7bbc0: ; 7bbc0 (1e:7bc0)
	call Func_7bb8b
	ld a, [hFFAC]
	ld c, a
	ld a, [de]
	add c
	cp [hl]
	jr c, .asm_7bbcc
	sub [hl]
.asm_7bbcc
	inc hl
Func_7bbcd: ; 7bbcd (1e:7bcd)
	ld c, a
	add a
	add a
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ret

Data_7bbd7:
	dr $7bbd7, $7bd42

Func_7bd42: ; 7bd42 (1e:7d42)
	push bc
.asm_7bd43
	ld a, [hli]
	bit 7, a
	jr nz, .asm_7bd59
	push de
	ld d, a
	ld e, [hl]
	inc hl
	push hl
	call Func_7bdec
	ld c, l
	ld b, h
	pop hl
	pop de
	call Func_7bd5b
	jr .asm_7bd43

.asm_7bd59
	pop bc
	ret

Func_7bd5b: ; 7bd5b (1e:7d5b)
	push hl
	push bc
	add sp, -$20
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$22
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_7bd68
	ld a, [hli]
	or a
	jr z, .asm_7bd8b
	cp $20
	jr nc, .asm_7bd74
	predef Func_7d9f9
	jr .asm_7bd68

.asm_7bd74
	push de
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .asm_7bd7c
	inc hl
.asm_7bd7c
	pop de
	push de
	ld e, a
	call Func_7bdbb
	pop de
	ld a, d
	ld [bc], a
	inc bc
	ld a, d
	add e
	ld d, a
	jr .asm_7bd68

.asm_7bd8b
	push de
	ld e, l
	ld d, h
	ld hl, sp+$24
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$2
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	ld e, l
	ld d, h
	ld hl, sp+$22
	ld a, [hli]
	ld h, [hl]
	ld l, a
	predef Func_015b
	pop de
	add sp, $20
	pop bc
	pop hl
	ret

Func_7bdaa: ; 7bdaa (1e:7daa)
	push de
	push bc
	ld b, e
.asm_7bdad
	ld e, [hl]
	inc hl
	call Func_7bdbb
	ld a, b
	add d
	ld d, a
	dec c
	jr nz, .asm_7bdad
	pop bc
	pop de
	ret

Func_7bdbb: ; 7bdbb (1e:7dbb)
	push hl
	push de
	push bc
	call Func_7bdc7
	predef Func_015b
	pop bc
	pop de
	pop hl
	ret

Func_7bdc7: ; 7bdc7 (1e:7dc7)
	ld b, d
	ld hl, $c3e0
	push hl
	ld a, [hFFB4]
	ld c, a
	predef Func_7d689
	ld a, b
	xor $80
	ld h, $0
	add a
	rl h
	add a
	rl h
	add a
	rl h
	add a
	rl h
	ld l, a
	ld bc, $8800
	add hl, bc
	pop de
	ld bc, $10
	ret

Func_7bdec: ; 7bdec (1e:7dec)
	ld h, e
	xor a
	srl h
	rra
	srl h
	rra
	srl h
	rra
	add d
	ld l, a
	ld a, h
	adc $98
	ld h, a
	ret

Func_7bdfe: ; 7bdfe (1e:7dfe)
	call Func_7bdec
	ld a, $79
	lb de, $77, $78
	call Func_7be1b
	dec c
	dec c
.asm_7be0b
	ld a, $7f
	lb de, $75, $76
	call Func_7be1b
	dec c
	jr nz, .asm_7be0b
	ld a, $7c
	lb de, $7a, $7b
Func_7be1b: ; 7be1b (1e:7e1b)
	add sp, -$20
	push hl
	push bc
	ld hl, sp+$4
	dec b
	dec b
	push hl
	ld [hl], d
	inc hl
.asm_7be26
	ld [hli], a
	dec b
	jr nz, .asm_7be26
	ld [hl], e
	pop de
	pop bc
	pop hl
	push hl
	push bc
	ld c, b
	ld b, $0
	predef Func_015b
	pop bc
	pop de
	ld hl, $20
	add hl, de
	add sp, $20
	ret

Func_7be3e: ; 7be3e (1e:7e3e)
	push af
	push hl
	add sp, -$20
	call Func_7bdec
.asm_7be45
	push hl
	push bc
	ld hl, sp+$25
	ld d, [hl]
	ld hl, sp+$27
	ld a, [hl]
	ld hl, sp+$4
	push hl
.asm_7be50
	ld [hli], a
	add d
	dec b
	jr nz, .asm_7be50
	pop de
	pop bc
	pop hl
	push hl
	push bc
	ld c, b
	ld b, $0
	predef Func_015b
	ld hl, sp+$24
	ld a, [hl]
	ld hl, sp+$27
	add [hl]
	ld [hl], a
	pop bc
	pop de
	ld hl, $20
	add hl, de
	dec c
	jr nz, .asm_7be45
	add sp, $24
	ret

Func_7be72: ; 7be72 (1e:7e72)
	push hl
	push de
	push bc
	ld b, a
	ld c, b
	ld e, b
	ld d, $0
	add hl, de
	dec hl
	inc c
.asm_7be7d
	scf
	dec c
	jr z, .asm_7be86
	ld a, [hld]
	cp $20
	jr z, .asm_7be7d
.asm_7be86
	ld a, c
	pop bc
	pop de
	pop hl
	ret

Func_7be8b: ; 7be8b (1e:7e8b)
	push hl
	push bc
	ld c, $0
	ld b, $80
.asm_7be91
	ld a, [de]
	inc de
	cp $20
	jr c, .asm_7bea3
	cp $b0
	jr nc, .asm_7bec1
	cp $60
	jr nc, .asm_7beaf
.asm_7be9f
	ld [hli], a
	inc c
	jr .asm_7be91

.asm_7bea3
	add $60
	cp $60
	jr nz, .asm_7be9f
	ld [hl], $0
	ld a, c
	pop bc
	pop hl
	ret

.asm_7beaf
	bit 7, b
	jr z, .asm_7beb9
.asm_7beb3
	ld b, $1
	ld [hl], $f
	inc hl
	inc c
.asm_7beb9
	bit 0, b
	jr z, .asm_7beb3
	add $50
	jr .asm_7becf

.asm_7bec1
	bit 7, b
	jr z, .asm_7becb
.asm_7bec5
	ld b, $0
	ld [hl], $e
	inc hl
	inc c
.asm_7becb
	bit 0, b
	jr nz, .asm_7bec5
.asm_7becf
	cp $f7
	jr nc, .asm_7bedf
	cp $de
	jr nc, .asm_7bee3
	cp $b0
	jr nz, .asm_7be9f
	ld a, $a6
	jr .asm_7be9f

.asm_7bedf
	add $b0
	jr .asm_7be9f

.asm_7bee3
	cp $ed
	jr nc, .asm_7beef
	add $d8
.asm_7bee9
	ld [hli], a
	inc c
	ld a, $de
	jr .asm_7be9f

.asm_7beef
	cp $f2
	jr nc, .asm_7bef7
	add $dd
	jr .asm_7bee9

.asm_7bef7
	add $d8
	ld [hli], a
	inc c
	ld a, $df
	jr .asm_7be9f

Func_7beff: ; 7beff (1e:7eff)
	push bc
	ld c, $0
.asm_7bf02
	ld a, [hli]
	or a
	jr z, .asm_7bf1c
	cp $20
	jr nc, .asm_7bf0e
	predef Func_7d9f9
	jr .asm_7bf02

.asm_7bf0e
	push de
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .asm_7bf16
	inc hl
.asm_7bf16
	pop de
	ld [de], a
	inc de
	inc c
	jr .asm_7bf02

.asm_7bf1c
	ld a, c
	pop bc
	ret

Func_7bf1f: ; 7bf1f (1e:7f1f)
	ld e, a
	ld a, [hFFAA]
	add $28
	ld d, a
	ld c, $4
	ld hl, Data_7bfab
Func_7bf2a: ; 7bf2a (1e:7f2a)
	ld a, e
	push af
	push hl
	push bc
	ld e, d
	call Func_7bdc7
	pop bc
	pop de
	pop af
	or a
	jr nz, .asm_7bf46
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	predef Func_015b
	ret

.asm_7bf46
	push bc
	push hl
	ld hl, $c3e0
	ld b, $10
.asm_7bf4d
	ld a, [de]
	inc de
	xor $ff
	ld [hli], a
	dec b
	jr nz, .asm_7bf4d
	pop hl
	push de
	push hl
	ld de, $c3e0
	ld bc, $10
	predef Func_015b
	pop hl
	ld de, $10
	add hl, de
	pop de
	pop bc
	dec c
	jr nz, .asm_7bf46
	ret

Data_7bf6b:
	dr $7bf6b, $7bfab

Data_7bfab:
	dr $7bfab, $7bfeb

Data_7bfeb:
	dr $7bfeb, $7bffc

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

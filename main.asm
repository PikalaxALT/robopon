INCLUDE "includes.asm"

SECTION "rst $00", HOME [$00]
Serial_:
	jp Func_0388

SECTION "rst $08", HOME [$08]
Predef_:
	jp Predef

Bank_000b:
	db BANK(Func_78100)
Bank_000c:
	db $1e
Byte_000d:
	db $4a
Bank_000e:
	db BANK(Pointers_78096)
Bank_000f:
	db BANK(Pointers_7c000)

SECTION "rst $10", HOME [$10]
	jp Func_00c9
Byte_0013:
	db $01, $08
Pointer_0015:
	dbw $01, $a1f0

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
Timer_:
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
	add Bank_000e
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
	call GetSRAMBank
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
	call GetSRAMBank
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
	call GetSRAMBank
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

GetSRAMBank: ; 3d5 (0:03d5)
; a = SRAM bank
; bit 7: read-only if set, read/write else
	bit 7, a
	jr nz, GetSRAMBank_ReadOnly
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	ld a, SRAM_READWRITE
	ld [HuC3SRamEnable], a
	ret

GetSRAMBank_ReadOnly:
	set 7, a
	ld [hSRAMBank], a
	res 7, a
	ld [HuC3SRamBank], a
	xor a ; SRAM_READONLY
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
	nop
	ld a, [wJoyHeld]
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

MemCopy:
; copy bc bytes from de to hl
.asm_047e
	ld a, [de]
	inc de
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_047e
	ret

FillMemory:
; fill bc bytes at hl with e
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
VBlank:
	push af
	push hl
	ld l, $ff
	ld a, [wc203]
	ld h, a
	bit 0, h
	jr z, .asm_0e2b
	push hl
	ld a, [$c2ea]
	bit 1, a
	jr z, .asm_0e27
	ld a, [hROMBank]
	push af
	ld a, [$c2ed]
	call BankSwitch_03f2
	call Func_11ce
	pop af
	call BankSwitch_03f2
	pop hl
	jr .asm_0e2b

.asm_0e27
	call Func_11ce
	pop hl
.asm_0e2b
	bit 6, h
	jp z, Func_0f2d
	res 6, l
	push hl
	ld a, [$c91c]
	or a
	jp z, Func_0ef1
	push bc
	push de
	ld a, [$c91c]
	and $1
	jp z, Func_0e92
	ld a, [$c923]
	ld l, a
	ld a, [$c924]
	ld h, a
	push hl
	ld a, [$c91f]
	ld e, a
	ld a, [$c920]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, $1e
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop hl
	ld a, [wSystemType]
	cp $11
	jp nz, Func_0e92
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld a, [$c921]
	ld e, a
	ld a, [$c922]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, $1e
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_0e92: ; e92 (0:0e92)
	ld a, [$c91c]
	and $2
	jp z, Func_0ee8
	ld a, [$c929]
	ld l, a
	ld a, [$c92a]
	ld h, a
	push hl
	ld a, [$c925]
	ld e, a
	ld a, [$c926]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, $1e
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop hl
	ld a, [wSystemType]
	cp $11
	jp nz, Func_0ee8
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld a, [$c927]
	ld e, a
	ld a, [$c928]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, $1e
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_0ee8: ; ee8 (0:0ee8)
	xor a
	ld [$c91c], a
	pop de
	pop bc
	jp Func_0f2c

Func_0ef1: ; ef1 (0:0ef1)
	push bc
	ld hl, $c89c
	ld a, $80
	ld c, $68
	ld [$ff00+c], a
	ld c, $6a
	ld [$ff00+c], a
	ld b, $8
	ld c, $69
.asm_0f01
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_0f01
	ld b, $8
	ld c, $6b
.asm_0f18
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .asm_0f18
	pop bc
Func_0f2c: ; f2c (0:0f2c)
	pop hl
Func_0f2d: ; f2d (0:0f2d)
	bit 1, h
	jr z, .asm_0f36
	res 1, l
	call hPushOAM
.asm_0f36
	bit 2, h
	jr z, .asm_0f47
	res 2, l
.asm_0f3c
	ld a, [rLY]
	cp $90
	jr z, .asm_0f3c
	ld a, [wLCDC]
	ld [rLCDC], a
.asm_0f47
	bit 3, h
	jr z, .asm_0f4e
	call Func_120e
.asm_0f4e
	bit 4, h
	jr z, .asm_0f71
	res 4, l
	ld a, [wLCDC]
	bit 3, a
	jr nz, .asm_0f67
	ld a, [wSCX]
	ld [rSCX], a
	ld a, [wSCY]
	ld [rSCY], a
	jr .asm_0f71

.asm_0f67
	ld a, [wSCX2]
	ld [rSCX], a
	ld a, [wSCY2]
	ld [rSCY], a
.asm_0f71
	bit 5, h
	jr z, .asm_0f86
	res 5, l
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP0]
	ld [rOBP0], a
	ld a, [wOBP1]
	ld [rOBP1], a
.asm_0f86
	bit 7, h
	jr z, .asm_0fca
	push hl
	push bc
	push de
	ld hl, $c21a
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [hSRAMBank]
	push af
	ld a, [hROMBank]
	push af
	ld a, [$c225]
	call GetSRAMBank
	ld a, [$c224]
	call BankSwitch_03f2
	ld hl, .Return
	push hl
	ld a, [$c226]
	ld l, a
	ld a, [$c227]
	ld h, a
	push hl
	ret

.Return
	pop af
	call BankSwitch_03f2
	pop af
	call GetSRAMBank
	pop de
	pop af
	ld hl, $c21a
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	pop bc
	pop hl
.asm_0fca
	ld a, [wc203]
	and l
	ld [wc203], a
	ld [$c204], a
	ld a, [wc209]
	inc a
	ld [wc209], a
	pop hl
	pop af
	reti

Func_0fde:
	push af
	push hl
	ld a, $0
	ld [rTAC], a
	ld a, $bc
	ld [rTMA], a
	ld a, $4
	ld [rTAC], a
	ld hl, rIE
	res 2, [hl]
	ei
	push bc
	push de
	ld a, [$c20a]
	inc a
	ld [$c20a], a
	jr nz, .asm_1004
	ld a, [$c20b]
	inc a
	ld [$c20b], a
.asm_1004
	call Func_1a94
	call Func_2a49
	ld a, [$c208]
	or a
	jr z, .asm_101a
	inc a
	and $1f
	jr nz, .asm_101a
	ld [wJoyLast], a
	ld a, $18
.asm_101a
	ld [$c208], a
	ld a, [$c2e8]
	or a
	jr z, .asm_103e
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank
	ld a, [hROMBank]
	push af
	ld a, BANK(Func_62ce4)
	call BankSwitch_03f2
	call Func_62ce4
	pop af
	call BankSwitch_03f2
	pop af
	call GetSRAMBank
.asm_103e
	ld hl, sp+$0
	ld bc, $27f0
	add hl, bc
	bit 7, h
	jr z, .asm_105f
	ld hl, sp+$0
	ld a, [wc21b]
	ld e, a
	ld a, [$c21c]
	ld d, a
	ld a, [wc21a]
	ld c, a
	ld b, $0
	di
	ld sp, wStackTop
	jp Func_1d00

.asm_105f
	pop de
	pop bc
	ld hl, rIE
	set 2, [hl]
	pop hl
	pop af
	reti

Func_1069:
	push af
	push hl
	ld a, [rSB]
	ld [wOAM07YCoord], a
	ld a, $1
	ld [wOAM06VTile], a
	ld a, [wOAM06Attrs]
	ld [rSB], a
	ld a, [wOAM07XCoord]
	ld [rSC], a
	ld hl, Pointers_1090
	ld a, [wOAM07VTile]
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_1090:
	dw Func_10a6
	dw Func_10b9
	dw Func_10cc
	dw Func_10fc
	dw Func_110a
	dw Func_111d
	dw Func_1130
	dw Func_115f
	dw Func_116c
	dw Func_10a9
	dw Func_10b1

Func_10a6:
	pop hl
	pop af
	reti

Func_10a9:
	ld a, $2
	ld [wOAM07VTile], a
	pop hl
.asm_10af
	pop af
	reti

Func_10b1:
	ld a, $6
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_10b9:
	ld a, [wOAM07YCoord]
	cp $a0
	jr nz, .asm_10c9
	ld a, $b0
	ld [rSB], a
	ld a, $9
	ld [wOAM07VTile], a
.asm_10c9
	pop hl
	pop af
	reti

Func_10cc:
	ld a, [wOAM08VTile]
	ld l, a
	ld a, [wOAM08Attrs]
	ld h, a
	ld a, [wOAM07YCoord]
	ld [hli], a
	ld a, l
	ld [wOAM08VTile], a
	ld a, h
	ld [wOAM08Attrs], a
	ld a, [wOAM08YCoord]
	ld l, a
	ld a, [wOAM08XCoord]
	ld h, a
	dec hl
	ld a, l
	ld [wOAM08YCoord], a
	ld a, h
	ld [wOAM08XCoord], a
	or l
	jr nz, .asm_10f9
	ld a, $3
	ld [wOAM07VTile], a
.asm_10f9
	pop hl
	pop af
	reti

Func_10fc:
	ld a, [wOAM07YCoord]
	ld [wOAM09YCoord], a
	ld a, $4
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_110a:
	ld a, $1
	ld [wOAM07Attrs], a
	ld a, [wOAM07YCoord]
	ld [wOAM09XCoord], a
	ld a, $0
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_111d:
	ld a, [wOAM07YCoord]
	cp $a2
	jr nz, .asm_112d
	ld a, $b2
	ld [rSB], a
	ld a, $6
	ld [wOAM07VTile], a
.asm_112d
	pop hl
	pop af
	reti

Func_1130:
	ld a, [wOAM08VTile]
	ld l, a
	ld a, [wOAM08Attrs]
	ld h, a
	ld a, [hli]
	ld [rSB], a
	ld a, l
	ld [wOAM08VTile], a
	ld a, h
	ld [wOAM08Attrs], a
	ld a, [wOAM08YCoord]
	ld l, a
	ld a, [wOAM08XCoord]
	ld h, a
	dec hl
	ld a, l
	ld [wOAM08YCoord], a
	ld a, h
	ld [wOAM08XCoord], a
	or l
	jr nz, .asm_115c
	ld a, $7
	ld [wOAM07VTile], a
.asm_115c
	pop hl
	pop af
	reti

Func_115f:
	ld a, [wOAM09YCoord]
	ld [rSB], a
	ld a, $8
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_116c:
	ld a, $1
	ld [wOAM07Attrs], a
	ld a, [wOAM09XCoord]
	ld [rSB], a
	ld a, $0
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_117e:
	push af
	push bc
	ld a, [$c2e1]
	or a
	jr nz, .asm_11ab
	ld a, [rLYC]
	ld c, a
	ld a, [$c2e2]
	cp c
	jr nz, .asm_119d
	ld a, [rLCDC]
	set 1, a
	ld [rLCDC], a
	ld a, [$c2e3]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_119d
	ld a, [rLCDC]
	res 1, a
	ld [rLCDC], a
	ld a, [$c2e2]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_11ab
	ld a, [rLYC]
	ld c, a
	ld a, [$c2e2]
	cp c
	jr nz, .asm_11c1
	ld a, [$c2e4]
	ld [rSCX], a
	ld a, [$c2e3]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_11c1
	ld a, [$c2e5]
	ld [rSCX], a
	ld a, [$c2e2]
	ld [rLYC], a
	pop bc
	pop af
	reti

Func_11ce: ; 11ce (0:11ce)
	push bc
	push de
	xor a
	ld [$c236], a
	ld c, $4
	ld hl, $c239
.asm_11d9
	ld a, [hl]
	ld b, a
	or a
	jr z, .asm_1200
	ld a, [$c236]
	add b
	cp $41
	jr nc, .asm_120b
	ld [$c236], a
	push bc
	xor a
	ld [hli], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, [hl]
	ld l, c
.asm_11f5
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_11f5
	pop hl
	pop bc
	inc hl
	jr .asm_1208

.asm_1200
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
.asm_1208
	dec c
	jr nz, .asm_11d9
.asm_120b
	pop de
	pop bc
	ret

Func_120e: ; 120e (0:120e)
	push bc
	call ReadJoypad
	ld a, [wJoyLast]
	xor c
	jr z, .asm_121c
	and c
	ld [wJoyHeld], a
.asm_121c
	ld a, c
	ld [wJoyLast], a
	pop bc
	ret

ReadJoypad: ; 1222 (0:1222)
	ld c, $0
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	and $f
	ld c, a
	ld a, $10
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	and $f
	swap a
	or c
	cpl
	ld [wJoyPressed], a
	ld c, a
	ld a, $30
	ld [rJOYP], a
	ret

Func_124e: ; 124e (0:124e)
	push de
	ld e, $0
.asm_1251
	ld a, [hl]
	and b
	jr z, .asm_1256
	scf
.asm_1256
	rl e
	rrc b
	jr nc, .asm_125d
	inc hl
.asm_125d
	dec c
	jr nz, .asm_1251
	ld a, e
	pop de
	ret

Func_1263: ; 1263 (0:1263)
	ld a, c
	add e
	ld [$c229], a
	ld a, b
	adc d
	ld [$c228], a
	ld b, $80
Func_126f:
	ld c, $1
	call Func_124e
	or a
	jr z, .asm_128d
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld a, [$c228]
	cp d
	jr nz, Func_126f
	ld a, [$c229]
	cp e
	jr nz, Func_126f
	jp Func_138c

.asm_128d
	ld c, $1
	call Func_124e
	or a
	jr nz, .asm_12b7
	ld c, $5
	call Func_124e
	push hl
	inc a
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc $0
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ld a, [$c228]
	cp d
	jr nz, Func_126f
	ld a, [$c229]
	cp e
	jr nz, Func_126f
	jp Func_138c

.asm_12b7
	ld a, $0
	ld [$c22a], a
	ld [$c22b], a
	ld c, $2
	call Func_124e
	cp $3
	jr z, .asm_12de
	add $2
	ld [$c22b], a
	ld c, $8
	call Func_124e
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc $0
	ld h, a
	jp Func_136a

.asm_12de
	ld c, $4
	call Func_124e
	cp $f
	jr z, .asm_1308
	add $5
	ld [$c22b], a
	ld c, $1
	call Func_124e
	ld [$c22c], a
	ld c, $8
	call Func_124e
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [$c22c]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp Func_136a

.asm_1308
	ld c, $8
	call Func_124e
	cp $ff
	jr z, .asm_1339
	add $14
	ld [$c22b], a
	ld a, $0
	adc $0
	ld [$c22a], a
	ld c, $2
	call Func_124e
	ld [$c22c], a
	ld c, $8
	call Func_124e
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [$c22c]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp Func_136a

.asm_1339
	ld c, $4
	call Func_124e
	ld c, a
	push bc
	ld c, $8
	call Func_124e
	add $13
	ld [$c22b], a
	pop bc
	ld a, c
	adc $1
	ld [$c22a], a
	ld c, $3
	call Func_124e
	ld [$c22c], a
	ld c, $8
	call Func_124e
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [$c22c]
	ld c, a
	ld a, d
	sbc c
	ld h, a
Func_136a: ; 136a (0:136a)
	push bc
	ld a, [$c22b]
	ld c, a
	ld a, [$c22a]
	ld b, a
	dec hl
.asm_1374
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_1374
	pop bc
	pop hl
	ld a, [$c228]
	cp d
	jp nz, Func_126f
	ld a, [$c229]
	cp e
	jp nz, Func_126f
Func_138c: ; 138c (0:138c)
	ret

Func_138d:
	push hl
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_e8000)
	call BankSwitch_03f2
	push bc
	push de
	ld h, $0
	sla l
	rl h
	sla l
	rl h
	ld bc, Data_e8000
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call BankSwitch_03f2
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, $40
	add hl, bc
	ld c, l
	ld b, h
	ld l, e
	ld h, d
	pop de
	push bc
	push de
	call Func_1263
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, $ffc0
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	ld a, BANK(Func_65db)
	call BankSwitch_03f2
	call Func_65db
	pop af
	call BankSwitch_03f2
	pop hl
	ret

Func_13ed: ; 13ed (0:13ed)
	ld a, [$c24d]
	ld c, a
	ld hl, $c239
.asm_13f4
	ld a, [hl]
	or a
	jr z, .asm_1404
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec c
	jr nz, .asm_13f4
	scf
.asm_1404
	ret

Func_1405: ; 1405 (0:1405)
	ld a, [wLCDC]
	bit 7, a
	jr nz, .asm_1412
	ld c, b
	ld b, $0
	jp MemCopy

.asm_1412
	push hl
	push bc
.asm_1414
	call Func_13ed
	jr c, .asm_1414
	pop bc
	di
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop bc
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ei
	ret

Func_1428: ; 1428 (0:1428)
	ld a, [wLCDC]
	bit 7, a
	jp z, MemCopy
.asm_1430
	ld a, c
	sub $40
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	jr nc, .asm_1444
	ld a, c
	add $40
	jr z, .asm_1443
	ld b, a
	call Func_1405
.asm_1443
	ret

.asm_1444
	push bc
	push hl
	push de
	ld b, $40
	call Func_1405
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	pop bc
	jr .asm_1430

Func_1458:
	ld a, [hROMBank]
	push af
	ld a, [wc21a]
	call BankSwitch_03f2
	call MemCopy
	call Func_14d4
	pop af
	call BankSwitch_03f2
	ret

Func_146c:
	ld a, [hROMBank]
	push af
	ld a, [wc21a]
	call BankSwitch_03f2
	call Func_1428
	call Func_14d4
	pop af
	call BankSwitch_03f2
	ret

Func_1480:
	ld a, [hROMBank]
	push af
	ld a, [wc21a]
	call BankSwitch_03f2
	call Func_1263
	call Func_14d4
	pop af
	call BankSwitch_03f2
	ret

Func_1494: ; 1494 (0:1494)
	ld a, [hROMBank]
	push af
	ld b, $0
.asm_1499
	ld a, [wc21a]
	call BankSwitch_03f2
	ld a, [de]
	inc de
	or a
	jr z, .asm_14b1
	dec a
	push af
	ld a, BANK(Func_68b6)
	call BankSwitch_03f2
	pop af
	call Func_68b6
	jr .asm_1499

.asm_14b1
	bit 0, b
	jr z, .asm_14b9
	ld a, $29
	ld [hli], a
	xor a
.asm_14b9
	ld [hli], a
	pop af
	call BankSwitch_03f2
	ret

Func_14bf: ; 14bf (0:14bf)
	ld c, $4
	ld hl, $c239
.asm_14c4
	ld a, [hl]
	or a
	jr nz, .asm_14d3
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec c
	jr nz, .asm_14c4
.asm_14d3
	ret

Func_14d4: ; 14d4 (0:14d4)
	call Func_14bf
	jr nz, Func_14d4
	ret

Func_14da: ; 14da (0:14da)
	ld a, l
	inc a
	ld c, h
	ld b, $0
	ld hl, $c48c
	add hl, bc
	ld bc, $14
.asm_14e6
	add hl, bc
	dec a
	jr nz, .asm_14e6
	ret

Func_14eb:
	ld a, l
	inc a
	ld c, h
	ld b, $0
	ld hl, $c5f4
	add hl, bc
	ld bc, $14
.asm_14f7
	add hl, bc
	dec a
	jr nz, .asm_14f7
	ret

.asm_14fc
	ld [$c2eb], a
	jp Func_1aaf

.asm_1502
	ld [$c2ec], a
	jp Func_1ab4

.asm_1508
	xor a
	jr .asm_14fc

.asm_150b
	xor a
	jr .asm_1502

Func_150e: ; 150e (0:150e)
	ld a, [$c252]
	ld h, a
	ld a, [$c253]
	ld l, a
	call Func_14da
	push hl
	ld hl, sp+$4
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, l
	ld b, h
	pop hl
Func_1523:
	ld a, [de]
	inc de
	or a
	jr nz, Func_1529
	ret

Func_1529:
	cp $25
	jp z, Func_15db
	cp $28
	jr z, .asm_153c
	cp $29
	jr nz, .asm_1543
	xor a
	ld [$c255], a
	jr Func_1523

.asm_153c
	xor a
	dec a
	ld [$c255], a
	jr Func_1523

.asm_1543
	push bc
	ld bc, Data_3892
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [bc]
	cp $42
	jr z, .asm_15ae
	cp $43
	jr z, .asm_15ae
	ld c, a
	ld a, [$c255]
	or a
	jr z, .asm_1576
	ld a, c
	cp $44
	jr c, .asm_156b
	cp $4e
	jr nc, .asm_156b
	sub $3a
	ld c, a
	jr .asm_1576

.asm_156b
	cp $4e
	jr c, .asm_1576
	cp $7b
	jr nc, .asm_1576
	sub $39
	ld c, a
.asm_1576
	ld a, c
	ld [hli], a
	ld a, [$c252]
	inc a
	ld [$c252], a
	pop bc
	ld a, [$c253]
	or a
	jr z, Func_1523
	push bc
	ld bc, $ffeb
	add hl, bc
	ld a, [hl]
	cp $88
	jr z, .asm_15aa
	cp $89
	jr z, .asm_15aa
	cp $81
	jr z, .asm_15a2
	cp $42
	jr z, .asm_15a0
	cp $43
	jr nz, .asm_15a2
.asm_15a0
	ld [hl], $8f
.asm_15a2
	ld bc, $15
	add hl, bc
	pop bc
	jp Func_1523

.asm_15aa
	ld [hl], $81
	jr .asm_15a2

.asm_15ae
	push af
	ld a, [$c253]
	or a
	jr nz, .asm_15ba
	pop af
	pop bc
	jp Func_1523

.asm_15ba
	ld bc, $ffeb
	add hl, bc
	ld a, [hl]
	cp $81
	jr z, .asm_15d5
	cp $88
	jr z, .asm_15d5
	cp $89
	jr z, .asm_15d5
	pop af
	ld [hl], a
.asm_15cd
	ld bc, $15
	add hl, bc
	pop bc
	jp Func_1523

.asm_15d5
	pop af
	add $46
	ld [hl], a
	jr .asm_15cd

Func_15db: ; 15db (0:15db)
	ld a, [de]
	inc de
	cp $64
	jr z, .asm_15f1
	cp $63
	jr z, .asm_1614
	cp $73
	jr z, .asm_161a
	cp $6c
	jr z, .asm_1634
	ld [hli], a
	jp Func_1523

.asm_15f1
	push de
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	ld e, l
	ld d, h
	ld hl, sp-$c
	add sp, -$c
	push hl
	push de
	push hl
	pop de
	pop hl
	ld bc, $a
	call Func_3a20
	call Func_150e
	add sp, $e
	pop bc
	pop de
	jp Func_1523

.asm_1614
	ld a, [bc]
	inc bc
	inc bc
	jp Func_1529

.asm_161a
	ld a, [$c255]
	push af
	push de
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push bc
	push hl
	call Func_150e
	pop bc
	pop bc
	pop de
	pop af
	ld [$c255], a
	jp Func_1523

.asm_1634
	ld a, [de]
	inc de
	cp $64
	jr z, .asm_163e
	ld [hli], a
	jp Func_1523

.asm_163e
	push de
	ld a, [bc]
	inc bc
	ld e, a
	ld a, [bc]
	inc bc
	ld d, a
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	push hl
	pop bc
	ld hl, sp-$c
	add sp, -$c
	push hl
	push bc
	push de
	call Func_3992
	pop bc
	pop bc
	call Func_150e
	add sp, $e
	pop bc
	pop de
	jp Func_1523

Func_1664:
	ld a, [hROMBank]
	push af
	ld a, BANK(Pointers_38000)
	call BankSwitch_03f2
	push hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc a
	jr nz, .asm_1698
	xor h
	inc a
	jr nz, .asm_1698
	ld l, c
	ld h, b
	add hl, hl
	ld bc, Pointers_38000
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld b, h
	sla b
	rla
	sla b
	rla
	add $e
	ld b, a
	call BankSwitch_03f2
	res 7, h
	set 6, h
	ld c, [hl]
.asm_1698
	ld a, b
	and $1f
	call BankSwitch_03f2
	ld a, b
	srl a
	srl a
	srl a
	srl a
	srl a
	ld b, $8
	jr z, Func_16ae
	ld b, a
Func_16ae:
	call Func_19fd
	jp c, Func_1845
	call Func_19fd
	jp c, Func_1775
	call Func_19fd
	jp c, Func_1701
	call Func_19fd
	jr c, .asm_16e8
	call Func_19fd
	jr c, .asm_16e3
	call Func_19fd
	jr c, .asm_16de
	call Func_19fd
	jr c, .asm_16d9
	ld a, $cc
	jp Func_19b8

.asm_16d9
	ld a, $cb
	jp Func_19b8

.asm_16de
	ld a, $bd
	jp Func_19b8

.asm_16e3
	ld a, $c5
	jp Func_19b8

.asm_16e8
	call Func_19fd
	jr c, .asm_16fc
	call Func_19fd
	jr c, .asm_16f7
	ld a, $cf
	jp Func_19b8

.asm_16f7
	ld a, $b1
	jp Func_19b8

.asm_16fc
	ld a, $b3
	jp Func_19b8

Func_1701: ; 1701 (0:1701)
	call Func_19fd
	jp c, Func_1752
	call Func_19fd
	jr c, .asm_1725
	call Func_19fd
	jr c, .asm_1720
	call Func_19fd
	jr c, .asm_171b
	ld a, $ac
	jp Func_19b8

.asm_171b
	ld a, $d0
	jp Func_19b8

.asm_1720
	ld a, $d3
	jp Func_19b8

.asm_1725
	call Func_19fd
	jr c, .asm_174d
	call Func_19fd
	jr c, .asm_1748
	call Func_19fd
	jr c, .asm_1743
	call Func_19fd
	jr c, .asm_173e
	ld a, $d5
	jp Func_19b8

.asm_173e
	ld a, $a7
	jp Func_19b8

.asm_1743
	ld a, $cd
	jp Func_19b8

.asm_1748
	ld a, $b4
	jp Func_19b8

.asm_174d
	ld a, $b5
	jp Func_19b8

Func_1752: ; 1752 (0:1752)
	call Func_19fd
	jr c, .asm_1770
	call Func_19fd
	jr c, .asm_1761
	ld a, $b7
	jp Func_19b8

.asm_1761
	call Func_19fd
	jr c, .asm_176b
	ld a, $d4
	jp Func_19b8

.asm_176b
	ld a, $a6
	jp Func_19b8

.asm_1770
	ld a, $c4
	jp Func_19b8

Func_1775: ; 1775 (0:1775)
	call Func_19fd
	jp c, Func_17b2
	call Func_19fd
	jr c, .asm_1785
	ld a, $a
	jp Func_19b8

.asm_1785
	call Func_19fd
	jr c, .asm_17a3
	call Func_19fd
	jr c, .asm_179e
	call Func_19fd
	jr c, .asm_1799
	ld a, $ae
	jp Func_19b8

.asm_1799
	ld a, $df
	jp Func_19b8

.asm_179e
	ld a, $c6
	jp Func_19b8

.asm_17a3
	call Func_19fd
	jr c, .asm_17ad
	ld a, $0
	jp Func_19b8

.asm_17ad
	ld a, $b0
	jp Func_19b8

Func_17b2: ; 17b2 (0:17b2)
	call Func_19fd
	jr c, .asm_17c6
	call Func_19fd
	jr c, .asm_17c1
	ld a, $c3
	jp Func_19b8

.asm_17c1
	ld a, $bc
	jp Func_19b8

.asm_17c6
	call Func_19fd
	jp c, Func_182c
	call Func_19fd
	jr c, .asm_17d6
	ld a, $23
	jp Func_19b8

.asm_17d6
	call Func_19fd
	jr c, .asm_17e0
	ld a, $d8
	jp Func_19b8

.asm_17e0
	call Func_19fd
	jr c, .asm_17ea
	ld a, $d2
	jp Func_19b8

.asm_17ea
	call Func_19fd
	jp c, Func_1827
	call Func_19fd
	jr c, .asm_1818
	call Func_19fd
	jr c, .asm_1813
	call Func_19fd
	jr c, .asm_180e
	call Func_19fd
	jr c, .asm_1809
	ld a, $39
	jp Func_19b8

.asm_1809
	ld a, $a9
	jp Func_19b8

.asm_180e
	ld a, $c7
	jp Func_19b8

.asm_1813
	ld a, $38
	jp Func_19b8

.asm_1818
	call Func_19fd
	jr c, .asm_1822
	ld a, $34
	jp Func_19b8

.asm_1822
	ld a, $33
	jp Func_19b8

Func_1827: ; 1827 (0:1827)
	ld a, $1
	jp Func_19b8

Func_182c: ; 182c (0:182c)
	call Func_19fd
	jr c, .asm_1836
	ld a, $b8
	jp Func_19b8

.asm_1836
	call Func_19fd
	jr c, .asm_1840
	ld a, $dc
	jp Func_19b8

.asm_1840
	ld a, $be
	jp Func_19b8

Func_1845: ; 1845 (0:1845)
	call Func_19fd
	jp c, Func_191b
	call Func_19fd
	jp c, Func_189c
	call Func_19fd
	jr c, .asm_186f
	call Func_19fd
	jr c, .asm_1860
	ld a, $dd
	jp Func_19b8

.asm_1860
	call Func_19fd
	jr c, .asm_186a
	ld a, $d9
	jp Func_19b8

.asm_186a
	ld a, $ba
	jp Func_19b8

.asm_186f
	call Func_19fd
	jr c, .asm_1897
	call Func_19fd
	jr c, .asm_1888
	call Func_19fd
	jr c, .asm_1883
	ld a, $bf
	jp Func_19b8

.asm_1883
	ld a, $db
	jp Func_19b8

.asm_1888
	call Func_19fd
	jr c, .asm_1892
	ld a, $c2
	jp Func_19b8

.asm_1892
	ld a, $bb
	jp Func_19b8

.asm_1897
	ld a, $c0
	jp Func_19b8

Func_189c: ; 189c (0:189c)
	call Func_19fd
	jr c, .asm_18b0
	call Func_19fd
	jr c, .asm_18ab
	ld a, $b6
	jp Func_19b8

.asm_18ab
	ld a, $28
	jp Func_19b8

.asm_18b0
	call Func_19fd
	jr c, .asm_18ba
	ld a, $29
	jp Func_19b8

.asm_18ba
	call Func_19fd
	jr c, .asm_18ce
	call Func_19fd
	jr c, .asm_18c9
	ld a, $b9
	jp Func_19b8

.asm_18c9
	ld a, $c1
	jp Func_19b8

.asm_18ce
	call Func_19fd
	jp c, Func_1916
	call Func_19fd
	jp c, Func_1911
	call Func_19fd
	jr c, .asm_190c
	call Func_19fd
	jr c, .asm_18e9
	ld a, $aa
	jp Func_19b8

.asm_18e9
	call Func_19fd
	jr c, .asm_18fd
	call Func_19fd
	jr c, .asm_18f8
	ld a, $36
	jp Func_19b8

.asm_18f8
	ld a, $ab
	jp Func_19b8

.asm_18fd
	call Func_19fd
	jr c, .asm_1907
	ld a, $30
	jp Func_19b8

.asm_1907
	ld a, $35
	jp Func_19b8

.asm_190c
	ld a, $d1
	jp Func_19b8

Func_1911: ; 1911 (0:1911)
	ld a, $3f
	jp Func_19b8

Func_1916: ; 1916 (0:1916)
	ld a, $d6
	jp Func_19b8

Func_191b: ; 191b (0:191b)
	call Func_19fd
	jp c, Func_198b
	call Func_19fd
	jr c, .asm_192b
	ld a, $de
	jp Func_19b8

.asm_192b
	call Func_19fd
	jr c, .asm_193f
	call Func_19fd
	jr c, .asm_193a
	ld a, $21
	jp Func_19b8

.asm_193a
	ld a, $c9
	jp Func_19b8

.asm_193f
	call Func_19fd
	jp c, Func_1986
	call Func_19fd
	jr c, .asm_194f
	ld a, $da
	jp Func_19b8

.asm_194f
	call Func_19fd
	jr c, .asm_1981
	call Func_19fd
	jr c, .asm_195e
	ld a, $ad
	jp Func_19b8

.asm_195e
	call Func_19fd
	jr c, .asm_1968
	ld a, $31
	jp Func_19b8

.asm_1968
	call Func_19fd
	jr c, .asm_1972
	ld a, $32
	jp Func_19b8

.asm_1972
	call Func_19fd
	jr c, .asm_197c
	ld a, $37
	jp Func_19b8

.asm_197c
	ld a, $a8
	jp Func_19b8

.asm_1981
	ld a, $c8
	jp Func_19b8

Func_1986: ; 1986 (0:1986)
	ld a, $af
	jp Func_19b8

Func_198b: ; 198b (0:198b)
	call Func_19fd
	jr c, .asm_19b3
	call Func_19fd
	jr c, .asm_19ae
	call Func_19fd
	jr c, .asm_199f
	ld a, $ca
	jp Func_19b8

.asm_199f
	call Func_19fd
	jr c, .asm_19a9
	ld a, $ce
	jp Func_19b8

.asm_19a9
	ld a, $d7
	jp Func_19b8

.asm_19ae
	ld a, $b2
	jp Func_19b8

.asm_19b3
	ld a, $20
	jp Func_19b8

Func_19b8: ; 19b8 (0:19b8)
	ld [de], a
	inc de
	or a
	jr z, asm_19df
	cp $a
	jp z, Func_19da
	cp $1
	jp nz, Func_16ae
	dec de
	push hl
	push bc
	ld l, e
	ld h, d
	ld de, $c309
	call Func_1494
	pop bc
	dec hl
	ld e, l
	ld d, h
	pop hl
	jp Func_16ae

Func_19da: ; 19da (0:19da)
	xor a
	dec de
	ld [de], a
	ld a, $a
asm_19df
	ld e, l
	ld d, h
	pop hl
	push af
	ld [hl], c
	inc hl
	sla b
	sla b
	sla b
	sla b
	sla b
	ld a, [hROMBank]
	or b
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	pop af
	call BankSwitch_03f2
	ld a, b
	ret

Func_19fd: ; 19fd (0:19fd)
	sla c
	dec b
	ret nz
	inc hl
	ld c, [hl]
	ld b, $8
	ret

Func_1a06:
	inc e
	ld b, h
	ld c, l
	jr .asm_1a19

.asm_1a0b
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rr a
	ld [hli], a
	ld a, [hl]
	rr a
	ld [hli], a
	rr [hl]
.asm_1a19
	ld l, c
	ld h, b
	dec e
	jr nz, .asm_1a0b
	ret

Func_1a1f:
	push bc
	ld c, l
	ld b, h
	add sp, -$4
	ld hl, sp+$0
	ld a, $4
.asm_1a28
	push af
	ld a, [bc]
	ld [hli], a
	inc bc
	pop af
	dec a
	jr nz, .asm_1a28
	dec hl
	ld c, l
	ld b, h
	push de
	call Func_3848
	db $8
	pop de
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, l
	ld l, c
	ld c, a
	ld a, h
	ld h, b
	ld b, a
.asm_1a44
	ld a, e
	or d
	jr z, .asm_1a6d
	srl d
	rr e
	push de
	jr nc, .asm_1a5e
	ccf
	push bc
	push hl
	ld e, $4
.asm_1a54
	ld a, [bc]
	adc [hl]
	ld [bc], a
	dec bc
	dec hl
	dec e
	jr nz, .asm_1a54
	pop hl
	pop bc
.asm_1a5e
	push hl
	ld e, $4
	scf
	ccf
.asm_1a63
	ld a, [hl]
	rla
	ld [hld], a
	dec e
	jr nz, .asm_1a63
	pop hl
	pop de
	jr .asm_1a44

.asm_1a6d
	add sp, $6
	ret

Func_1a70:
	ld h, a
	ld a, [$c2ea]
	bit 0, a
	jr z, .asm_1a7a
	xor a
	ret

.asm_1a7a
	ld a, [hROMBank]
	push af
	ld a, BANK(Func_70000)
	call BankSwitch_03f2
	ld a, h
	ld de, .Return
	push de
	ld h, Func_70000 / $100
	push hl
	ret

.Return
	ld h, a
	pop af
	jp BankSwitch_03f2

Func_1a90: ; 1a90 (0:1a90)
	ld l, Func_70000 % $100
	jr Func_1a70

Func_1a94: ; 1a94 (0:1a94)
	ld a, [hROMBank]
	ld [$c2ed], a
	ld a, [$c2ea]
	set 1, a
	ld [$c2ea], a
	ld l, Func_70003 % $100
	call Func_1a70
	ld a, [$c2ea]
	res 1, a
	ld [$c2ea], a
	ret

Func_1aaf: ; 1aaf (0:1aaf)
	ld l, Func_70006 % $100
	ld h, a
	jr Func_1a70

Func_1ab4: ; 1ab4 (0:1ab4)
	ld l, Func_70009 % $100
	ld h, a
	jr Func_1a70

Func_1ab9:
	ld l, Func_7000c % $100
	ld h, a
	jr Func_1a70

Func_1abe:
	ld l, Func_7000f % $100
	call Func_1a70
	ld a, h
	ret

Func_1ac5:
	ld l, Func_70012 % $100
	call Func_1a70
	ld a, h
	ret

Func_1acc:
	ld l, Func_70015 % $100
	jr Func_1a70

Func_1ad0:
	ld l, Func_70018 % $100
	ld h, a
	jr Func_1a70

Func_1ad5:
	ld l, Func_7001b % $100
	jr Func_1a70

Func_1ad9:
	ld l, Func_7001e % $100
	jr Func_1a70

Func_1add:
	di
	xor a
	ld [rIF], a
	ld [rIE], a
	ld a, $0
	call GetSRAMBank
	ld a, BANK(Func_1add)
	call BankSwitch_03f2
	ld sp, wStackTop
	ld a, $e4
	ld [rBGP], a
	ld [rOBP0], a
	ld a, $1b
	ld [rOBP1], a
	predef Func_00e9
	predef Func_7b21d
	jp @ - 1 ; better luck next time

Func_1b01:
	ld sp, wStackTop
	ld a, $3
	call GetSRAMBank
	ld a, $3f
	ld [wc21a], a
IF DEF(SUN)
	ld a, $13
ENDC
IF DEF(STAR)
	ld a, $11
ENDC
	ld [wc21b], a
	ld a, $52
	ld [$c21c], a
	call Func_03f8
	ld a, $3
	call GetSRAMBank
	ld a, BANK(Func_4060)
	call BankSwitch_03f2
	jp Func_4060

Func_1b28: ; 1b28 (0:1b28)
	ld a, [wOAM27VTile]
	or a
	ret z
	push bc
	push de
	push hl
	call Func_1beb
	push bc
	ld a, [hSRAMBank]
	push af
	ld a, [$c01c]
	cp $11
	jr z, .asm_1b52
	di
	predef Func_7e225
	ei
	ld a, [$c01c]
	cp $10
	jp nz, Func_1bdf
	ld a, $11
	ld [$c01c], a
	jp Func_1bdf

.asm_1b52
	di
	predef Func_7e225
	ei
	ld a, $1
	ld [$c01c], a
	ld a, e
	ld [$c930], a
	ld a, d
	ld [$c931], a
	ld a, [$c92e]
	ld e, a
	ld a, c
	ld [$c92c], a
	ld a, b
	ld [$c92d], a
	ld a, l
	ld [$c92e], a
	ld a, h
	ld [$c92f], a
	ld a, e
	cp l
	jr z, Func_1bdf
	ld a, [$c933]
	cp b
	jr c, .asm_1b9b
	jr nz, Func_1bdf
	ld a, [$c932]
	cp c
	jr c, .asm_1b9b
	jr nz, Func_1bdf
	ld a, [$c935]
	cp h
	jr c, .asm_1b9b
	jr nz, Func_1bdf
	ld a, [$c934]
	cp l
	jr c, .asm_1b9b
	jr nz, Func_1bdf
.asm_1b9b
	di
	ld a, [rIE]
	push af
	and $fe
	ld [rIE], a
	ei
	ld hl, $c936
	ld c, $26
	ld b, $2
	predef Func_7e497
	ld a, $6e
	predef Func_7e1c0
	ld a, $6e
	predef Func_7e1c0
	di
	pop af
	and $1
	ld c, a
	ld a, [rIE]
	or c
	ld [rIE], a
	ld hl, rIF
	res 0, [hl]
	ei
	ld a, [wc21a]
	push af
	ld a, $24
	ld [wc21a], a
	ld a, $c
	ld [wc21b], a
	ld a, $7c
	ld [$c21c], a
	call Func_03f8
	pop af
	ld [wc21a], a
Func_1bdf: ; 1bdf (0:1bdf)
	pop af
	call GetSRAMBank
	pop bc
	call Func_1bff
	pop hl
	pop de
	pop bc
	ret

Func_1beb: ; 1beb (0:1beb)
	di
	ld a, [wc203]
	ld c, a
	res 7, a
	ld [wc203], a
	ld a, [$c2e8]
	ld b, a
	xor a
	ld [$c2e8], a
	ei
	ret

Func_1bff: ; 1bff (0:1bff)
	ld a, c
	and $80
	ld c, a
	di
	ld a, [wc203]
	or c
	ld [wc203], a
	ld a, b
	ld [$c2e8], a
	ei
	ret

Func_1c11:
	ld a, [hSRAMBank]
	push af
	call Func_1beb
	push bc
	ld c, l
	ld b, h
	predef Func_7e640
	pop bc
	ld l, a
	call Func_1bff
	pop af
	call GetSRAMBank
	ld a, l
	ret

Func_1c27:
	ld a, [hSRAMBank]
	push af
	call Func_1beb
	push bc
	predef Func_7e556
	ld l, a
	ld h, b
	pop bc
	call Func_1bff
	pop af
	call GetSRAMBank
	ret

Func_1c3b:
	ld a, [hSRAMBank]
	push af
	call Func_1beb
	push bc
	predef Func_7aa8e
	jr c, .asm_1c53
	xor a
	ld [wOAM09VTile], a
.asm_1c4a
	pop bc
	call Func_1bff
	pop af
	call GetSRAMBank
	ret

.asm_1c53
	ld a, $80
	ld [wOAM09VTile], a
	jr .asm_1c4a

Func_1c5a:
	ld a, [hSRAMBank]
	push af
	ld b, c
	push bc
	call Func_1beb
	pop af
	push bc
	ld c, a
	predef Func_7ac8d
	jr asm_1c8c

Func_1c69:
	ld a, [hSRAMBank]
	push af
	ld b, c
	push bc
	call Func_1beb
	pop af
	push bc
	ld c, a
	predef Func_7aca4
	jr asm_1c8c

Func_1c78:
	ld a, [hSRAMBank]
	push af
	call Func_1beb
	push bc
	predef Func_7aa8e
	jr asm_1c8c

Func_1c83:
	ld a, [hSRAMBank]
	push af
	call Func_1beb
	push bc
	predef Func_7ac16
asm_1c8c
	jr nc, .asm_1c99
	pop bc
	call Func_1bff
	pop af
	call GetSRAMBank
	ld a, $ff
	ret

.asm_1c99
	pop bc
	call Func_1bff
	pop af
	call GetSRAMBank
	xor a
	ret

Func_1ca3:
	ld hl, rIE
	set 0, [hl]
	ret

Func_1ca9:
	ld hl, rIE
	res 0, [hl]
	ret

Func_1caf:
	ld hl, rIE
	set 1, [hl]
	ret

Func_1cb5:
	ld hl, rIE
	res 1, [hl]
	ret

Func_1cbb:
	ld hl, rIE
	set 2, [hl]
	ret

Func_1cc0:
	ld hl, rIE
	res 2, [hl]
	ret

Func_1cc5:
	ld hl, rIE
	set 3, [hl]
	ret

Func_1cca:
	ld hl, rIE
	res 3, [hl]
	ret

SECTION "1d00", HOME [$1d00]
Func_1d00: ; 1d00 (0:1d00)
	push de
	push bc
	push hl
	ld hl, $c21a
	ld [hl], $1
	inc hl
	ld [hl], $64
	inc hl
	ld [hl], $40
	call Func_03f8
	ld a, $ff
	ld [wc213], a
	ld hl, $c21a
	ld [hl], $1
	inc hl
	ld [hl], $0
	inc hl
	ld [hl], $40
	call Func_03f8
	ld a, [wc203]
	or $11
	ld [wc203], a
Func_1d2c: ; 1d2c (0:1d2c)
	ld a, [wc203]
	ld hl, $c204
	cp [hl]
	jp nz, Func_1d2c
	call Func_3aa8
	ld de, Data_1d8d
	ld hl, $1
	call Func_230e
.asm_1d40
	ld de, Data_1d94
	ld hl, $3
	call Func_230e
	ld e, $5
	xor a
	call Func_3a83
	pop hl
	push hl
	ld hl, Data_1da2
	push hl
	call Func_150e
.asm_1d59
	pop bc
	pop bc
	ld e, $7
	xor a
	call Func_3a83
	pop bc
	push bc
	ld hl, Data_1daa
	push hl
	call Func_150e
	pop bc
	pop bc
	ld e, $9
	xor a
	call Func_3a83
	pop de
	push de
	ld hl, Data_1db0
	push hl
	call Func_150e
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp @ - 1 ; better luck next time

Data_1d8d: ; 1d8d
	dr $1d8d, $1d94

Data_1d94: ; 1d94
	dr $1d94, $1da2

Data_1da2: ; 1da2
	dr $1da2, $1daa

Data_1daa: ; 1daa
	dr $1daa, $1db0

Data_1db0: ; 1db0
	dr $1db0, $1db9

Func_1db9:
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank
	ld bc, $214
	ld e, $0
	ld hl, $c980
	call FillMemory
	ld a, $2
	call GetSRAMBank
	ld bc, $1298
	ld e, $0
	ld hl, $a007
	call FillMemory
	ld a, $3
	call GetSRAMBank
	ld bc, $a0
	ld e, $0
	ld hl, $cb94
	call FillMemory
	ld a, $3
	call GetSRAMBank
	ld bc, $dc
	ld e, $0
	ld hl, $cc34
	call FillMemory
	ld a, $3
	call GetSRAMBank
	ld bc, $fa
	ld e, $0
	ld hl, $cd10
	call FillMemory
	pop af
	call GetSRAMBank
	ld bc, $32
	ld e, $0
	ld hl, $c7ed
	call FillMemory
	ld bc, $64
	ld e, $0
	ld hl, $c789
	call FillMemory
	ld bc, $3c
	ld e, $0
	ld hl, $c347
	call FillMemory
	ld hl, $0
	call Func_3855
	dw $c391
	ld hl, $0
	call Func_3855
	dw $c393
	ld bc, $5
	ld e, $0
	ld hl, $c309
	call FillMemory
	ret

Func_1e4d: ; 1e4d (0:1e4d)
	call Func_3aa8
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $67
	inc hl
	ld [hl], $7a
	ld de, $900
	ld hl, $ce10
	call Func_03f8
	call Func_1db9
	xor a
	ld [wOAM26VTile], a
	xor a
	ld [$c91c], a
	xor a
	ld [$c92b], a
	ld hl, wc21a
	ld [hl], $18
	inc hl
	ld [hl], $fc
	inc hl
	ld [hl], $53
	ld e, $0
	xor a
	call Func_03f8
	ld hl, wc21a
	ld [hl], $18
	inc hl
	ld [hl], $24
	inc hl
	ld [hl], $54
	ld c, $1
	ld e, $1
	ld a, $1
	call Func_03f8
	ld bc, $48
	ld e, $0
	ld hl, $c938
	call FillMemory
	ld a, $1
	ld [wOAM27VTile], a
Func_1ea8: ; 1ea8 (0:1ea8)
	ld a, [$c01c]
	cp $11
	jp z, Func_1ec2
	ld a, [$c01c]
	or a
	jp nz, Func_1ebc
	ld a, $1
	ld [$c01c], a
Func_1ebc: ; 1ebc (0:1ebc)
	call Func_0465
	jp Func_1ea8

Func_1ec2: ; 1ec2 (0:1ec2)
	call Func_0465
	xor a
Func_1ec6: ; 1ec6 (0:1ec6)
	cp $6
	jp nc, Func_1ed8
	ld e, a
	ld d, $0
	ld hl, $c932
	add hl, de
	ld [hl], $ff
	inc a
	jp Func_1ec6

Func_1ed8: ; 1ed8 (0:1ed8)
	ld a, $5
	call BankSwitch_03f2
	ld e, $0
	xor a
	call Func_3a83
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $b3
	inc hl
	ld [hl], $79
	ld a, $1
	call Func_03f8
	push hl
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $e4
	inc hl
	ld [hl], $7a
	ld a, $1
	call Func_03f8
	push de
	push hl
	pop de
	pop hl
	push de
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $2b
	inc hl
	ld [hl], $7a
	xor a
	pop de
	pop hl
	call Func_3608
	jp nz, Func_1f25
	call Func_03f8
	cp $ff
	jp nz, Func_1f27
Func_1f25: ; 1f25 (0:1f25)
	ld a, $1
Func_1f27: ; 1f27 (0:1f27)
	ld a, $ff
	ld [wOAM26Attrs], a
	call Func_144fd
	ret

Func_1f30:
	call Func_3875
	dw $c30e
	ld a, l
	or h
	jp nz, Func_1f7a
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $ba
	inc hl
	ld [hl], $7a
	ld hl, Init
	call Func_03f8
	call Func_3855
	ld c, $c3
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $f0
	ld de, $88f0
	call Func_3875
	dw $c30e
	call Func_146c
	ld a, $1
	ld [wc21a], a
	ld bc, $f0
	ld de, $4a12
	ld hl, $88f0
	call Func_146c
	call Func_14d4
Func_1f7a: ; 1f7a (0:1f7a)
	ret

Func_1f7b:
	call Func_3875
	dw $c30e
	ld a, l
	or h
	jp z, Func_1fbd
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $f0
	call Func_3875
	dw $c30e
	push de
	push hl
	pop de
	pop hl
	ld hl, $88f0
	call Func_146c
	call Func_14d4
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $57
	inc hl
	ld [hl], $7c
	call Func_3875
	dw $c30e
	call Func_03f8
	ld hl, $0
	call Func_3855
	dw $c30e
Func_1fbd: ; 1fbd (0:1fbd)
	ret

Func_1fbe:
	call Func_3875
	dw $c2f2
	ld a, l
	or h
	jp nz, Func_2008
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $ba
	inc hl
	ld [hl], $7a
	ld hl, $1ba
	call Func_03f8
	call Func_3855
	dw $c2f2
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $1ba
	ld de, $8cc0
	call Func_3875
	dw $c2f2
	call Func_146c
	ld a, $1
	ld [wc21a], a
	ld bc, $1ba
	ld de, $4b22
	ld hl, $8cc0
	call Func_146c
	call Func_14d4
Func_2008: ; 2008 (0:2008)
	ret

Func_2009:
	call Func_3875
	dw $c2f2
	ld a, l
	or h
	jp z, Func_204b
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $1ba
	call Func_3875
	dw $c2f2
	push de
	push hl
	pop de
	pop hl
	ld hl, $8cc0
	call Func_146c
	call Func_14d4
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $57
	inc hl
	ld [hl], $7c
	call Func_3875
	dw $c2f2
	call Func_03f8
	ld hl, HuC3SRamEnable
	call Func_3855
	dw $c2f2
Func_204b:
	ret

Func_204c:
	call Func_3875
	dw $c2f2
	ld a, l
	or h
	jp nz, Func_2096
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $ba
	inc hl
	ld [hl], $7a
	ld hl, $50
	call Func_03f8
	call Func_3855
	dw $c2f2
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $50
	ld de, $8fa0
	call Func_3875
	dw $c2f2
	call Func_146c
	ld a, $1
	ld [wc21a], a
	ld bc, $50
	ld de, $4e02
	ld hl, $8fa0
	call Func_146c
	call Func_14d4
Func_2096: ; 2096 (0:2096)
	ret

Func_2097:
	call Func_3875
	dw $c2f2
	ld a, l
	or h
	jp z, Func_20d9
	call Func_14d4
	ld a, $1
	ld [wc21a], a
	ld bc, $50
	call Func_3875
	dw $c2f2
	push de
	push hl
	pop de
	pop hl
	ld hl, $8fa0
	call Func_146c
	call Func_14d4
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $57
	inc hl
	ld [hl], $7c
	call Func_3875
	dw $c2f2
	call Func_03f8
	ld hl, $0
	call Func_3855
	dw $c2f2
Func_20d9: ; 20d9 (0:20d9)
	ret

Func_20da: ; 20da (0:20da)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
Func_20e2: ; 20e2 (0:20e2)
	cp l
	jp nc, Func_2122
	push hl
	push af
	xor a
Func_20e9: ; 20e9 (0:20e9)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_2101
	push af
	call Func_3848
	db $c
	ld a, [hl]
	inc hl
	call Func_37d4
	db $c
	ld [bc], a
	inc bc
	pop af
	inc a
	jp Func_20e9

Func_2101: ; 2101 (0:2101)
	pop af
	push bc
	push af
	ld hl, sp+$6
	ld c, [hl]
	ld b, $0
	ld hl, $14
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call Func_3848
	db $c
	add hl, bc
	call Func_37d4
	db $c
	pop af
	inc a
	pop bc
	pop hl
	jp Func_20e2

Func_2122: ; 2122 (0:2122)
	pop bc
	ret

Func_2124:
	push hl
	push de
	push bc
	call Func_381d
	ld c, h
	call Func_381d
	ld a, l
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $c4a0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call Func_3829
	push hl
	call Func_3811
	pop de
	call Func_20da
	pop bc
	pop bc
	pop bc
	ret

Func_2152:
	push hl
	push de
	push bc
	call Func_381d
	ld c, h
	call Func_381d
	ld a, l
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $c608
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call Func_3829
	push hl
	call Func_3811
	pop de
	call Func_20da
	pop bc
	pop bc
	pop bc
	ret

Func_2180: ; 2180 (0:2180)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
Func_2188: ; 2188 (0:2188)
	cp l
	jp nc, Func_21c8
	push hl
	push af
	xor a
Func_218f: ; 218f (0:218f)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_21a7
	push af
	ld a, [bc]
	inc bc
	call Func_3848
	db $c
	ld [hl], a
	inc hl
	call Func_37d4
	db $c
	pop af
	inc a
	jp Func_218f

Func_21a7: ; 21a7 (0:21a7)
	pop af
	push bc
	push af
	ld hl, sp+$6
	ld c, [hl]
	ld b, $0
	ld hl, $14
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call Func_3848
	db $c
	add hl, bc
	call Func_37d4
	db $c
	pop af
	inc a
	pop bc
	pop hl
	jp Func_2188

Func_21c8: ; 21c8 (0:21c8)
	pop bc
	ret

Func_21ca:
	push hl
	push de
	push bc
	call Func_381d
	ld c, h
	call Func_381d
	ld a, l
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $c4a0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call Func_3829
	push hl
	call Func_3811
	pop de
	call Func_2180
	pop bc
	pop bc
	pop bc
	ret

Func_21f8:
	push hl
	push de
	push bc
	call Func_381d
	ld c, h
	call Func_381d
	ld a, l
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $c608
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call Func_3829
	push hl
	call Func_3811
	pop de
	call Func_2180
	pop bc
	pop bc
	pop bc
	ret

Data_2226:
	dr $2226, $2231

Func_2231:
	push bc
	push bc
	push bc
	push bc
	push de
	call Func_3848
	db $c
	ld a, l
	and h
	inc a
	jp nz, Func_224f
	ld hl, sp+$4
	ld a, [$c252]
	ld [hl], a
	ld hl, sp+$3
	ld a, [$c253]
	ld [hl], a
	jp Func_225f

Func_224f: ; 224f (0:224f)
	call Func_3848
	db $c
	ld e, h
	ld hl, sp+$4
	ld [hl], e
	call Func_3848
	db $c
	ld e, l
	ld hl, sp+$3
	ld [hl], e
Func_225f: ; 225f (0:225f)
	pop de
	ld c, e
	ld hl, sp+$0
	ld [hl], d
	ld hl, sp+$0
	ld a, [hl]
	and $1
	jp z, Func_2285
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call Func_3a83
	call Func_3811
	push hl
	ld hl, Data_2304
	push hl
	call Func_150e
	pop bc
	pop bc
	jp Func_22fe

Func_2285: ; 2285 (0:2285)
	ld e, c
	ld d, $0
	ld hl, $5
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	ld de, Data_2226
	add hl, de
	call Func_3791
Func_2299: ; 2299 (0:2299)
	call Func_3823
	ld a, [hl]
	dec a
	inc hl
	or [hl]
	jp z, Func_22e8
	call Func_3823
	ld c, [hl]
	inc hl
	ld b, [hl]
	call Func_3811
	call Func_35f8
	jp nc, Func_22e8
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call Func_3a83
	ld hl, sp+$0
	ld a, [hl]
	and $2
	jp z, Func_22ce
	ld hl, $2307
	push hl
	call Func_150e
	pop bc
	jp Func_22d6

Func_22ce: ; 22ce (0:22ce)
	ld hl, Data_2309
	push hl
	call Func_150e
	pop bc
Func_22d6: ; 22d6 (0:22d6)
	call Func_3823
	inc hl
	inc hl
	call Func_3791
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_2299

Func_22e8: ; 22e8 (0:22e8)
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call Func_3a83
	call Func_3811
	push hl
	ld hl, Data_230b
	push hl
	call Func_150e
	pop bc
	pop bc
Func_22fe: ; 22fe (0:22fe)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_2304:
	dr $2304, $2309

Data_2309:
	dr $2309, $230b

Data_230b:
	dr $230b, $230e

Func_230e: ; 230e (0:230e)
	push de
	ld a, l
	and h
	inc a
	jp z, Func_231c
	ld c, h
	ld a, l
	ld e, a
	ld a, c
	call Func_3a83
Func_231c: ; 231c (0:231c)
	pop de
	push de
	call Func_150e
	pop bc
	ret

Func_2323:
	push hl
	push bc
	push bc
	push bc
	push de
	call Func_3805
	ld e, h
	ld hl, sp+$6
	ld [hl], e
	call Func_3805
	ld e, l
	ld hl, sp+$5
	ld [hl], e
	pop de
	ld hl, sp+$2
	ld [hl], d
	push de
	ld l, e
	push hl
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$8
	ld a, [hl]
	call Func_3afc
	pop bc
	pop de
	pop bc
	push de
	ld hl, sp+$2
	ld a, [hl]
	ld d, a
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$3
	ld l, [hl]
	ld h, a
	call Func_21ca
	pop de
	ld l, e
	push hl
	ld hl, sp+$2
	ld c, [hl]
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_236f:
	push hl
	ld hl, -$ee
	add hl, sp
	ld sp, hl
	ld a, e
	cp $aa
	jp c, Func_23bb
	ld a, e
	cp $ae
	jp nc, Func_23bb
	push de
	ld a, [hSRAMBank]
	push af
	ld a, $1
	call GetSRAMBank_ReadOnly
	pop af
	pop de
	push af
	ld l, e
	ld h, $0
	ld de, $2f
	call Func_3759
	debgcoord 14, 23
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld bc, $2f
	call MemCopy
	pop af
	call GetSRAMBank
	ld bc, $2f
	ld hl, sp+$0
	push hl
	call Func_3848
	db $f2
	pop de
	call MemCopy
	jp Func_2419

Func_23bb: ; 23bb (0:23bb)
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_65bc8)
	call BankSwitch_03f2
	ld hl, Data_65bc8
	call Func_37d4
	db $f1
	pop af
	pop de
	push af
	push de
	ld hl, sp+$4
	push hl
	ld l, e
	ld h, $0
	ld de, $5
	call Func_36c6
	add hl, hl
	ld c, l
	ld b, h
	call Func_3848
	db $f3
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	call Func_3848
	db $f3
	add hl, bc
	pop de
	ld bc, $eb
	call Func_1263
	pop de
	ld l, e
	ld h, $0
	ld de, $5
	call Func_36c6
	ld hl, $2f
	call Func_3759
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	push hl
	call Func_3848
	db $f4
	pop de
	ld bc, $2f
	call MemCopy
	pop af
	call BankSwitch_03f2
Func_2419: ; 2419 (0:2419)
	ld hl, $f0
	add hl, sp
	ld sp, hl
	ret

Func_241f:
	push hl
	ld hl, -$c2
	add hl, sp
	ld sp, hl
	dec e
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_64390)
	call BankSwitch_03f2
	ld hl, Data_64390
	call Func_37d4
	db $c6
	pop af
	pop de
	push af
	push de
	ld hl, sp+$4
	push hl
	ld l, e
	ld h, $0
	ld de, $8
	call Func_36c6
	add hl, hl
	ld c, l
	ld b, h
	call Func_3848
	db $c8
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	call Func_3848
	db $c8
	add hl, bc
	pop de
	ld bc, $c0
	call Func_1263
	pop de
	ld l, e
	ld h, $0
	ld de, $8
	call Func_36c6
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	push hl
	call Func_3848
	db $c8
	pop de
	ld bc, $18
	call MemCopy
	pop af
	call BankSwitch_03f2
	ld hl, $c4
	add hl, sp
	ld sp, hl
	ret

Func_248f:
	push hl
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_64093)
	call BankSwitch_03f2
	pop af
	pop de
	push af
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_64093
	add hl, de
	push hl
	call Func_381d
	pop de
	ld bc, $11
	call MemCopy
	pop af
	call BankSwitch_03f2
	pop bc
	ret

Func_24bb
	push hl
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_657c5)
	call BankSwitch_03f2
	pop af
	pop de
	push af
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_657c5
	add hl, de
	push hl
	call Func_381d
	pop de
	ld bc, $d
	call MemCopy
	pop af
	call BankSwitch_03f2
	pop bc
	ret

Func_24e9: ; 24e9 (0:24e9)
	call Func_0465
	ld l, a
	inc l
	dec l
	jp z, Func_2504
	ld a, l
	and $f0
	jp nz, Func_2504
	ld a, [$c208]
	or a
	jp nz, Func_2504
	ld a, $1
	ld [$c208], a
Func_2504: ; 2504 (0:2504)
	ld a, [wJoyPressed]
	or a
	jp nz, Func_250f
	xor a
	ld [$c208], a
Func_250f: ; 250f (0:250f)
	xor a
	ld [wJoyHeld], a
	ld a, l
	ret

Func_2515:
	push de
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push bc
	push hl
	ld de, $100
	call Func_36c6
	ld a, l
	pop hl
	push hl
	ld de, $100
	call Func_36c6
	ld a, e
	pop hl
	pop bc
	push hl
	push bc
	ld l, c
	ld h, b
	ld de, $100
	call Func_36c6
	ld a, l
	ld hl, sp+$e
	ld [hl], a
	pop hl
	ld de, $100
	call Func_36c6
	ld a, e
	ld hl, sp+$2
	ld [hl], $96
	ld hl, sp+$3
	ld [hl], $90
	ld hl, sp+$a
	ld [hl], $91
	ld hl, sp+$4
	call Func_37d4
	db $f
	ld c, $0
	ld a, [$c2cd]
	or a
	jp nz, Func_256d
	ld e, $0
	jp Func_256f

Func_256d: ; 256d (0:256d)
	ld e, $69
Func_256f: ; 256f (0:256f)
	ld hl, sp+$c
	ld a, [hl]
	add $94
	add e
	ld hl, sp+$b
	ld [hl], a
Func_2578: ; 2578 (0:2578)
	call Func_3848
	db $12
	ld de, $fff8
	add hl, de
	inc h
	dec h
	bit 7, h
	jr nz, .asm_25a1
	call Func_3848
	db $f
	ld [hl], $92
	inc hl
	call Func_37d4
	db $f
	call Func_3848
	db $12
	ld de, $fff8
	add hl, de
	call Func_37d4
	db $12
	inc c
	jp Func_25a4

.asm_25a1
	jp Func_25a7

Func_25a4: ; 25a4 (0:25a4)
	jp Func_2578

Func_25a7: ; 25a7 (0:25a7)
	call Func_3848
	db $12
	ld a, l
	or h
	jp z, Func_25eb
	inc c
	push bc
	ld hl, sp+$d
	ld a, [hl]
	call Func_3848
	db $11
	ld [hl], a
	inc hl
	call Func_37d4
	db $11
	ld a, $1
	ld [wc21a], a
	ld bc, $10
	call Func_3848
	db $14
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $4c32
	add hl, de
	push hl
	ld hl, sp+$f
	ld a, [hl]
	and $7f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8800
	add hl, de
	pop de
	call Func_146c
	pop bc
Func_25eb: ; 25eb (0:25eb)
	ld a, c
	cp $6
	jp nc, Func_2600
	call Func_3848
	db $f
	ld [hl], $93
	inc hl
	call Func_37d4
	db $f
	inc c
	jp Func_25eb

Func_2600: ; 2600 (0:2600)
	pop hl
	call Func_14da
	ld c, l
	ld b, h
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld bc, $9
	call MemCopy
	add sp, $10
	ret

Func_2617:
	push bc
	push bc
	push bc
	ld a, l
	or h
	jp nz, Func_2642
	call Func_381d
	ld [hl], $0
	inc hl
	call Func_378b
	call Func_381d
	ld [hl], $0
	inc hl
	call Func_378b
	call Func_381d
	ld [hl], $0
	inc hl
	call Func_378b
	call Func_381d
	ld [hl], $0
	jp Func_26d3

Func_2642: ; 2642 (0:2642)
	push de
	ld c, $0
Func_2645: ; 2645 (0:2645)
	ld a, h
	and $40
	jp z, Func_264e
	jp Func_2653

Func_264e: ; 264e (0:264e)
	inc c
	add hl, hl
	jp Func_2645

Func_2653: ; 2653 (0:2653)
	push bc
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_265e
	dec bc
.asm_265e
	push bc
	push hl
	ld hl, $1
	push hl
	ld hl, $0
	push hl
	call Func_34c7
	ld hl, sp+$8
	call Func_32d1
	pop bc
	pop de
	push bc
	ld l, e
	ld h, d
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_267f
	dec bc
.asm_267f
	push bc
	push hl
	ld hl, sp+$6
	call Func_3428
	call Func_3811
	inc hl
	inc hl
	inc hl
	call Func_377f
	pop bc
Func_2690: ; 2690 (0:2690)
	ld a, c
	cp $1
	jp c, Func_26a3
	push bc
	ld hl, sp+$2
	ld b, $1
	call Func_33bd
	pop bc
	dec c
	jp Func_2690

Func_26a3: ; 26a3 (0:26a3)
	xor a
Func_26a4: ; 26a4 (0:26a4)
	cp $4
	jp nc, Func_26d3
	push af
	ld hl, sp+$2
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $ff
	push hl
	call Func_3343
	pop bc
	pop af
	call Func_3811
	ld [hl], c
	ld hl, sp+$2
	ld b, $8
	call Func_33bd
	call Func_3811
	dec hl
	call Func_377f
	pop af
	inc a
	jp Func_26a4

Func_26d3: ; 26d3 (0:26d3)
	pop bc
	pop bc
	pop bc
	ret

Func_26d7: ; 26d7 (0:26d7)
	ld a, [de]
	or a
	jp z, Func_26e3
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	jp Func_26d7

Func_26e3: ; 26e3 (0:26e3)
	xor a
	ld [hl], a
	ret

Func_26e6:
	push de
	push hl
	ld a, [hROMBank]
	push af
	ld a, c
	call BankSwitch_03f2
	pop af
	pop hl
	pop de
	push af
Func_26f3: ; 26f3 (0:26f3)
	ld a, [de]
	or a
	jp z, Func_26ff
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	jp Func_26f3

Func_26ff: ; 26ff (0:26ff)
	pop af
	push hl
	push af
	xor a
	ld [hl], a
	pop af
	call BankSwitch_03f2
	pop hl
	ret

Func_270a:
	push bc
	push bc
	push bc
	push de
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$a
	call Func_32d1
	ld hl, $0
	call Func_378b
	pop hl
	ld e, l
	ld a, h
	cp $8
	jp nc, Func_2730
	ld bc, $9
	jp Func_273e

Func_2730: ; 2730 (0:2730)
	cp $b
	jp nc, Func_273b
	ld bc, $8
	jp Func_273e

Func_273b: ; 273b (0:273b)
	ld bc, $7
Func_273e: ; 273e (0:273e)
	ld a, c
Func_273f: ; 273f (0:273f)
	dec e
	jp nz, Func_2746
	jp Func_2761

Func_2746: ; 2746 (0:2746)
	push bc
	push de
	call Func_3811
	add hl, bc
	call Func_377f
	call Func_3811
	ld bc, $0
	push bc
	push hl
	ld hl, sp+$c
	call Func_3553
	pop de
	pop bc
	jp Func_273f

Func_2761: ; 2761 (0:2761)
	pop de
	push bc
	ld a, e
	or d
	jp z, Func_2770
	ld hl, sp+$4
	ld bc, $4
	call Func_35e8
Func_2770: ; 2770 (0:2770)
	pop bc
	pop hl
	push hl
	add hl, bc
	pop de
	push hl
	pop hl
	push hl
	pop bc
	pop bc
	pop bc
	ret

Func_277c:
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, sp+$8
	push de
	push hl
	pop de
	pop hl
	ld hl, $c989
	ld bc, $4
	call Func_35e8
	ld hl, sp+$4
	call Func_32e0
	ld hl, sp+$c
	call Func_3553
	ld hl, Bank_000f
	push hl
	ld hl, $423b
	push hl
	ld hl, sp+$c
	call Func_32e0
	call Func_3579
	jp nc, Func_27c0
	ld hl, Bank_000f
	push hl
	ld hl, $423b
	push hl
	ld hl, sp+$c
	call Func_32d1
	jp Func_27e0

Func_27c0: ; 27c0 (0:27c0)
	ld hl, sp+$8
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call Func_3579
	jp nc, Func_27e0
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$c
	call Func_32d1
Func_27e0: ; 27e0 (0:27e0)
	ld a, $3
	call GetSRAMBank
	ld de, $c989
	ld hl, sp+$8
	ld bc, $4
	call Func_35e8
	pop af
	call GetSRAMBank
	ret

Func_27f5:
	ld bc, $a0
	ld e, $0
	ld hl, wOAMBuffer2
	call FillMemory
	ret

Func_2801: ; 2801 (0:2801)
	push hl
	push de
	ld a, [hSRAMBank]
	push af
	call Func_3829
	ld h, $0
	push hl
	call Func_381d
	ld l, h
	ld h, $0
	pop de
	call Func_3759
	push de
	push hl
	pop de
	pop hl
	push de
	ld a, $3
	call GetSRAMBank
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $ba
	inc hl
	ld [hl], $7a
	pop de
	push de
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	call Func_03f8
	ld c, l
	ld b, h
	push bc
	inc bc
	inc bc
	inc bc
	inc bc
	call Func_3811
	push hl
	call Func_3848
	db $c
	pop de
	call Func_2124
	pop bc
	pop de
	push bc
	ld l, c
	ld h, b
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, l
	ld b, h
	call Func_381d
	push hl
	call Func_3805
	pop de
	call Func_2152
	pop bc
	pop af
	push bc
	call Func_381d
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_3829
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	call GetSRAMBank
	pop hl
	pop bc
	pop bc
	ret

Func_2887: ; 2887 (0:2887)
	push hl
	push bc
	push bc
	call Func_381d
	ld a, [hSRAMBank]
	push af
	push hl
	ld a, $3
	call GetSRAMBank
	call Func_3805
	ld a, [hl]
	inc hl
	call Func_3773
	ld hl, sp+$6
	ld [hl], a
	call Func_3805
	ld a, [hl]
	inc hl
	call Func_3773
	ld hl, sp+$7
	ld [hl], a
	call Func_3805
	ld a, [hl]
	inc hl
	call Func_3773
	ld hl, sp+$4
	ld [hl], a
	call Func_3805
	ld a, [hl]
	inc hl
	call Func_3773
	ld hl, sp+$5
	ld [hl], a
	call Func_3805
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call Func_21ca
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	call Func_3759
	ld c, l
	ld b, h
	call Func_3805
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	call Func_21f8
	ld a, $2
	ld [wOAM26VTile], a
	ld hl, sp+$4
	ld l, [hl]
	push hl
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_3ca1
	pop bc
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $57
	inc hl
	ld [hl], $7c
	pop hl
	call Func_03f8
	pop af
	call GetSRAMBank
	pop bc
	pop bc
	pop bc
	ret

Func_292b: ; 292b (0:292b)
	ld e, $0
Func_292d: ; 292d (0:292d)
	ld a, [hl]
	or a
	jp z, Func_294f
	ld a, [hl]
	inc hl
	cp $28
	jp z, Func_2948
	cp $29
	jp z, Func_2948
	cp $de
	jp z, Func_2948
	cp $df
	jp nz, Func_294b
Func_2948: ; 2948 (0:2948)
	jp Func_292d

Func_294b: ; 294b (0:294b)
	inc e
	jp Func_292d

Func_294f: ; 294f (0:294f)
	ld a, e
	ret

Func_2951: ; 2951 (0:2951)
	push de
	push bc
	push hl
	push bc
	push hl
	call Func_3805
	call Func_292b
	add $2
	ld e, a
	pop hl
	push de
	push hl
	ld a, h
	ld hl, sp+$9
	ld [hl], a
	cp $ff
	jp nz, Func_2976
	ld a, $14
	sub e
	ld b, $2
	call Func_36af
	ld hl, sp+$9
	ld [hl], a
Func_2976: ; 2976 (0:2976)
	pop hl
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	cp $ff
	jp nz, Func_2984
	ld hl, sp+$6
	ld [hl], $7
Func_2984: ; 2984 (0:2984)
	pop de
	pop bc
	pop hl
	push de
	push bc
	ld a, c
	and $2
	jp nz, Func_29a6
	ld l, e
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$4
	ld l, [hl]
	ld h, a
	call Func_2801
Func_29a6: ; 29a6 (0:29a6)
	pop bc
	pop de
	push hl
	push bc
	ld a, c
	and $8
	jp nz, Func_29cb
	push de
	ld hl, wc21a
	ld [hl], $5
	inc hl
	ld [hl], $95
	inc hl
	ld [hl], $7e
	pop de
	push de
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	ld c, $3
	call Func_03f8
	pop de
Func_29cb: ; 29cb (0:29cb)
	push de
	ld a, $2
	ld [wOAM26VTile], a
	ld hl, wc21a
	ld [hl], $31
	inc hl
	ld [hl], $9
	inc hl
	ld [hl], $71
	pop de
	push de
	ld l, e
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	ld c, $0
	call Func_03f8
	call Func_3805
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	inc hl
	pop de
	call Func_230e
	pop de
	ld l, $3
	push hl
	ld c, e
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$7
	ld a, [hl]
	call Func_3ca1
	pop bc
	pop bc
	push bc
	ld a, c
	and $1
	jp nz, Func_2a2e
Func_2a26: ; 2a26 (0:2a26)
	call Func_24e9
	and $30
	jp z, Func_2a26
Func_2a2e: ; 2a2e (0:2a2e)
	pop bc
	pop hl
	push hl
	ld a, c
	and $4
	jp nz, Func_2a3a
	call Func_2887
Func_2a3a: ; 2a3a (0:2a3a)
	pop hl
	pop bc
	pop bc
	ret

Func_2a3e:
	ld c, e
	push de
	push hl
	pop de
	pop hl
	ld hl, $ffff
	jp Func_2951

Func_2a49: ; 2a49 (0:2a49)
	ld hl, $676
	push hl
	ld hl, $5ba0
	push hl
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	ld hl, wOAM24XCoord
	call Func_3553
	call Func_32e0
	call Func_3579
	jp nc, Func_2a78
	ld hl, $5ba0
	call Func_3855
	dw $c391
	ld hl, $676
	call Func_3855
	dw $c393
Func_2a78: ; 2a78 (0:2a78)
	ret

Func_2a79: ; 2a79 (0:2a79)
	push hl
	push de
	add sp, -$12
	push bc
	ld hl, sp+$13
	ld a, [hROMBank]
	ld [hl], a
	ld a, [wc203]
	push af
	ld a, [rLCDC]
	and $80
	jp z, Func_2aab
	call Func_14d4
	ld a, [wc203]
	and $8
	jp z, Func_2aab
	ld a, [wc203]
	and $f7
	ld [wc203], a
Func_2aa1: ; 2aa1 (0:2aa1)
	ld a, [wc203]
	ld hl, $c204
	cp [hl]
	jp nz, Func_2aa1
Func_2aab: ; 2aab (0:2aab)
	ld a, BANK(Func_6b22)
	call BankSwitch_03f2
	pop af
	pop bc
	push af
Func_2ab3: ; 2ab3 (0:2ab3)
	call Func_3848
	db $16
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call Func_3608
	jp nc, Func_2b70
	push bc
	xor a
	call Func_6b22
	call Func_3848
	db $18
	ld de, $10
	call Func_3608
	jp c, Func_2add
	ld hl, sp+$14
	ld [hl], $10
	jp Func_2ae5

Func_2add: ; 2add (0:2add)
	call Func_3848
	db $18
	ld e, l
	ld hl, sp+$14
	ld [hl], e
Func_2ae5: ; 2ae5 (0:2ae5)
	ld hl, sp+$15
	ld a, [hl]
	call BankSwitch_03f2
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	call Func_3848
	db $1a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call MemCopy
	ld hl, sp+$14
	ld a, [hl]
	cp $10
	jp nc, Func_2b20
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	ld hl, $10
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	ld hl, sp+$14
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld e, $0
	call FillMemory
Func_2b20: ; 2b20 (0:2b20)
	ld a, BANK(Func_6b37)
	call BankSwitch_03f2
	ld a, $10
	ld hl, sp+$4
Func_2b29: ; 2b29 (0:2b29)
	cp $1
	jp c, Func_2b3b
.asm_2b2e
	push hl
	push af
	ld a, [hl]
	call Func_6b37
	pop af
	dec a
	pop hl
	inc hl
	jp Func_2b29

Func_2b3b: ; 2b3b (0:2b3b)
	ld a, $20
	call Func_6b22
asm_2b3f
	pop bc
	inc c
	dec c
	jp z, Func_2b49
	jp Func_2b70

Func_2b49: ; 2b49 (0:2b49)
	push bc
	call Func_6b4b
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	call Func_3848
	db $18
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call Func_37d4
	db $18
	call Func_3848
	db $1a
	ld de, $10
	add hl, de
	call Func_37d4
	db $1a
	pop bc
	jp Func_2ab3

Func_2b70: ; 2b70 (0:2b70)
	pop af
	ld [wc203], a
	ld hl, sp+$11
	ld a, [hl]
	call BankSwitch_03f2
	add sp, $16
	ret

Func_2b7d: ; 2b7d (0:2b7d)
	ld c, $0
.asm_2b7e
	call Func_2a79
	ret

Func_2b82:
	ld a, [wSystemType]
	cp $1
	jp z, Func_2b93
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_2b96
Func_2b93: ; 2b93 (0:2b93)
	call Func_2b7d
Func_2b96: ; 2b96 (0:2b96)
	ret

Func_2b97:
	push hl
	ld hl, $d
	add hl, sp
	ld a, [hl]
	and $7f
	ld b, a
	dec hl
	ld c, [hl]
	ld a, $0
	sub [hl]
	ld e, a
	ld a, $3c
	sbc b
	jp c, Func_2bd7
	jp nz, Func_2bb5
	ld a, e
	cp $35
	jp c, Func_2bc6
Func_2bb5: ; 2bb5 (0:2bb5)
	inc hl
	ld a, [hl]
	and $80
	ld [hl], a
	ld b, $7
	xor a
Func_2bbd: ; 2bbd (0:2bbd)
	dec hl
	ld [hl], a
	dec b
	jp nz, Func_2bbd
	jp Func_2c0b

Func_2bc6: ; 2bc6 (0:2bc6)
	inc e
	ld hl, $4
	add hl, sp
	ld c, $8
	ld b, e
	call Func_31ea
	ld de, $0
.asm_2bd4
	jp Func_2bea

Func_2bd7: ; 2bd7 (0:2bd7)
	ld hl, wOAMBuffer2
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	inc de
	ld a, d
	dec de
	cp $8
	jp c, Func_2bea
	ld de, $7ff
Func_2bea: ; 2bea (0:2bea)
	ld hl, $4
	add hl, sp
	ld bc, $509
	call Func_31b4
	ld hl, Bank_000c
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [de]
	and $f
	or l
	ld [de], a
	inc de
	ld a, [de]
	and $80
	or h
	ld [de], a
Func_2c0b: ; 2c0b (0:2c0b)
	pop hl
	pop bc
	pop af
	push bc
	ret

Func_2c10:
	pop bc
	ld de, $0
	push de
	push bc
	push hl
	ld hl, $d
	add hl, sp
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	push hl
	pop de
	pop hl
	ld c, l
	xor a
	add hl, hl
	rra
	push af
	add hl, hl
	rla
	add hl, hl
	rla
	add hl, hl
	rla
	ld l, h
	ld h, a
	and $7f
	or l
	ld a, c
	jp z, Func_2c46
	or $10
	ld b, a
	ld a, h
	or $f8
	and l
	inc a
	dec hl
	jp nz, Func_2c45
	ld hl, $43fe
Func_2c45: ; 2c45 (0:2c45)
	ld a, b
Func_2c46: ; 2c46 (0:2c46)
	ld bc, $3c01
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	push de
	ld b, $7
Func_2c51: ; 2c51 (0:2c51)
	dec hl
	ld d, a
	ld e, [hl]
	ld a, e
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld [hl], d
	dec b
	jp nz, Func_2c51
	pop de
	pop af
	ld hl, $4
	add hl, sp
	ld c, $8
	call Func_3106
	pop hl
	ret

Func_2c72:
	push hl
	ld hl, $d
	add hl, sp
	ld a, [hl]
	and $7f
	ld b, a
	dec hl
	ld c, [hl]
	ld a, $80
	sub [hl]
	ld e, a
	ld a, $3f
	sbc b
	jp c, Func_2cb1
	jp nz, Func_2c90
	ld a, e
	cp $18
	jp c, Func_2c9f
Func_2c90: ; 2c90 (0:2c90)
	inc hl
	ld a, [hl]
	and $80
	ld [hl], a
	xor a
	dec hl
	ld [hl], a
	dec hl
	ld [hl], a
	dec hl
	ld [hl], a
	jp Func_2ce0

Func_2c9f: ; 2c9f (0:2c9f)
	inc e
	dec hl
	dec hl
	dec hl
	ld c, $3
	ld b, e
	call Func_31ea
	inc hl
	inc hl
	inc hl
	ld e, $0
	jp Func_2cc4

Func_2cb1: ; 2cb1 (0:2cb1)
	push de
	push hl
	pop de
	pop hl
	ld hl, $c080
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld a, d
	or a
	jp z, Func_2cc4
	ld e, $ff
Func_2cc4: ; 2cc4 (0:2cc4)
	ld b, h
	ld c, l
	ld d, $3
Func_2cc8: ; 2cc8 (0:2cc8)
	dec hl
	ld a, [hl]
	ld [bc], a
	dec bc
	dec d
	jp nz, Func_2cc8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	rla
	ld b, a
	inc hl
	ld a, [hl]
	rla
	ld a, e
	rra
	ld [hl], a
	ld a, b
	rra
	dec hl
	ld [hl], a
Func_2ce0: ; 2ce0 (0:2ce0)
	pop hl
	pop bc
	pop af
	pop af
	pop af
	push bc
	ret

Func_2ce7:
	pop bc
	ld de, $0
	push de
	push de
	push de
	push bc
	push hl
	ld hl, $d
	add hl, sp
	ld b, [hl]
	dec hl
	ld a, [hl]
	add a
	ld a, b
	adc a
	ld c, a
	ld a, $0
	ld b, a
	rra
	push af
	jp z, Func_2d10
	ld a, [hl]
	or $80
	ld [hl], a
	ld a, c
	dec c
	inc a
	jp nz, Func_2d10
	ld bc, $407e
Func_2d10: ; 2d10 (0:2d10)
	push de
	push hl
	pop de
	pop hl
	ld hl, $3f81
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	dec hl
	ld b, [hl]
	ld [hl], a
	dec hl
	ld a, [hl]
	ld [hl], b
	dec hl
	ld [hl], a
	pop af
	ld hl, $4
	add hl, sp
	ld c, $8
	call Func_3106
	pop hl
	ret

Func_2d31:
	pop bc
	ld a, h
	push hl
	push hl
	ld hl, $0
	ld de, $400e
	jp Func_2d47

Func_2d3d:
	pop bc
	pop hl
	pop de
	ld a, d
	push de
	push de
	ld de, $401e
Func_2d47: ; 2d47 (0:2d47)
	push hl
	ld hl, $0
	add hl, sp
	and $80
	push af
	call Func_35c1
	pop af
	ld hl, $0
	push hl
	push hl
	add hl, sp
	push bc
	ld c, $8
	jp Func_3106

Func_2d60:
	pop bc
	ld de, $0
	jp Func_2d69

Func_2d66:
	pop bc
	pop hl
	pop de
Func_2d69: ; 2d69 (0:2d69)
	push de
	push de
	push hl
	ld hl, $0
	push hl
	push hl
	add hl, sp
	push bc
	xor a
	ld de, $401e
	ld c, $8
	jp Func_3106

Func_2d7c:
	ld bc, $10
	call Func_2dc3
	pop bc
	pop de
	pop de
	pop de
	pop hl
	pop de
	push bc
	jp nc, Func_2d90
	ld hl, $0
	ret

Func_2d90: ; 2d90 (0:2d90)
	and $80
	ret z
	jp Func_36fe

Func_2d96:
	ld bc, $20
	call Func_2dc3
	pop bc
	pop de
	pop de
	pop de
	pop hl
	jp nc, Func_2dab
	ld de, $0
	ld hl, $0
	xor a
Func_2dab: ; 2dab (0:2dab)
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	push de
	push bc
	and $80
	ret z
	jp Func_35ce

Func_2dc3: ; 2dc3 (0:2dc3)
	ld hl, $4
	add hl, sp
	call Func_31a4
	push af
	push hl
	ld hl, $c001
	add hl, de
	pop de
	bit 7, h
	jp nz, Func_2dec
	call Func_35f8
	jp nc, Func_2dec
	ld a, c
	sub l
	ld b, a
	dec b
	ld c, $8
	push de
	push hl
	pop de
	pop hl
	call Func_31ea
	pop af
	and a
	ret

Func_2dec: ; 2dec (0:2dec)
	pop af
	scf
	ret

Func_2def:
	ld hl, $b
	add hl, sp
	ld a, [hl]
	xor $80
	jp nz, Func_2e09
	push hl
	ld c, $9
Func_2dfc: ; 2dfc (0:2dfc)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2dfc
	pop hl
	or a
	jp nz, Func_2e09
	ld [hl], $0
Func_2e09: ; 2e09 (0:2e09)
	push de
	push hl
	pop de
	pop hl
	ld hl, $16
	add hl, sp
	push hl
	dec hl
	ld a, [hl]
	xor $80
	jp nz, Func_2e29
	push hl
	ld c, $9
Func_2e1c: ; 2e1c (0:2e1c)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2e1c
	pop hl
	or a
	jp nz, Func_2e29
	ld [hl], $0
Func_2e29: ; 2e29 (0:2e29)
	ld a, [de]
	or [hl]
	bit 7, a
	jp nz, Func_2e34
	push de
	push hl
	pop de
	pop hl
Func_2e34: ; 2e34 (0:2e34)
	ld c, $a
Func_2e36: ; 2e36 (0:2e36)
	ld a, [de]
	cp [hl]
	jp nz, Func_2e41
	dec hl
	dec de
	dec c
	jp nz, Func_2e36
Func_2e41: ; 2e41 (0:2e41)
	pop hl
	pop bc
	ld sp, hl
	push bc
	ret

Func_2e46:
	ld hl, $b
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_2e5c
	push hl
	ld c, $9
Func_2e52: ; 2e52 (0:2e52)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2e52
	pop hl
	or a
	ret z
	ld a, [hl]
Func_2e5c: ; 2e5c (0:2e5c)
	xor $80
	ld [hl], a
	ret

Func_2e60:
	pop bc
	ld de, $0
	ld a, $c
Func_2e66: ; 2e66 (0:2e66)
	push de
	dec a
	jp nz, Func_2e66
	push bc
	push hl
	ld hl, $26
	add hl, sp
	push hl
	push de
	push hl
	pop de
	pop hl
	ld hl, Bank_000e
	add hl, sp
	ld c, $8
Func_2e7c: ; 2e7c (0:2e7c)
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_2e7c
	pop hl
	push hl
	call Func_31a4
	push de
	ld c, a
	ld hl, $20
	add hl, sp
	call Func_31a4
	pop hl
	xor c
	push af
	push de
	push hl
	ld c, $ff
	ld hl, Bank_000c
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $1c
	add hl, sp
	ld a, $48
Func_2ea7: ; 2ea7 (0:2ea7)
	push af
	push bc
	push hl
	ld hl, $33
	add hl, sp
	ld bc, $109
	call Func_31b4
	pop hl
	pop bc
	ld a, c
	ld c, $10
	or a
	jp z, Func_2ec4
	call Func_3230
	ccf
	jp Func_2ec7

Func_2ec4: ; 2ec4 (0:2ec4)
	call Func_3245
Func_2ec7: ; 2ec7 (0:2ec7)
	sbc a
	ld c, a
	jp z, Func_2ed6
	push hl
	ld hl, $31
	add hl, sp
	ld a, [hl]
	or $1
	ld [hl], a
	pop hl
Func_2ed6: ; 2ed6 (0:2ed6)
	push bc
	push de
	push hl
	pop de
	pop hl
	ld bc, $110
	call Func_31ea
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	dec a
	jp nz, Func_2ea7
	pop hl
	pop de
	ld a, h
	or l
	jp z, Func_2f01
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld de, $4001
	call Func_3608
	jp c, Func_2f07
Func_2f01: ; 2f01 (0:2f01)
	ld hl, $4000
	jp Func_2f14

Func_2f07: ; 2f07 (0:2f07)
	ld de, $c001
	call Func_3608
	jp nc, Func_2f14
	push de
	push hl
	pop de
	pop hl
Func_2f14: ; 2f14 (0:2f14)
	ld de, $3fff
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	pop hl
	push hl
	dec hl
	ld c, $9
	call Func_3106
	pop hl
	pop de
	pop bc
	ld sp, hl
	push de
	push hl
	pop de
	pop hl
	push bc
	ret

Func_2f2f:
	pop bc
	ld de, $0
	ld a, $9
Func_2f35: ; 2f35 (0:2f35)
	push de
	dec a
	jp nz, Func_2f35
	push bc
	push hl
	ld hl, $27
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $4
	add hl, sp
	ld b, $80
	ld a, $40
Func_2f4c: ; 2f4c (0:2f4c)
	push af
	push bc
	ld bc, $110
	call Func_31b4
	pop bc
	ld a, [de]
	and b
	jp z, Func_2f79
	push bc
	push de
	push de
	push hl
	pop de
	pop hl
	ld hl, $1c
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld bc, $8
	call Func_3245
	pop de
	jp nc, Func_2f78
	push hl
	add hl, bc
	call Func_321e
	pop hl
Func_2f78: ; 2f78 (0:2f78)
	pop bc
Func_2f79: ; 2f79 (0:2f79)
	ld a, b
	rrca
	ld b, a
	jp nc, Func_2f80
	dec de
Func_2f80: ; 2f80 (0:2f80)
	pop af
	dec a
	jp nz, Func_2f4c
	push de
	push hl
	pop de
	pop hl
	inc hl
	push hl
	ld bc, $9
	add hl, bc
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	push de
	call Func_31a4
	ld c, a
	push de
	ld hl, $1c
	add hl, sp
	call Func_31a4
	pop hl
	add hl, de
	inc hl
	xor c
	push af
	ld a, l
	sub $ff
	ld a, h
	sbc $bf
	jp c, Func_2fc0
	ld hl, $bffe
	jp Func_2fcc

Func_2fc0: ; 2fc0 (0:2fc0)
	ld a, l
	sub $fe
	ld a, h
	sbc $bf
	jp nc, Func_2fcc
	ld hl, $3fff
Func_2fcc: ; 2fcc (0:2fcc)
	ld de, $c001
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	pop hl
	ld c, $10
	call Func_3106
	pop de
	ld c, $a
Func_2fde: ; 2fde (0:2fde)
	ld a, [hl]
	dec hl
	ld [de], a
	dec de
	dec c
	jp nz, Func_2fde
	inc de
	push de
	push hl
	pop de
	pop hl
	pop de
	pop bc
	ld sp, hl
	push de
	push hl
	pop de
	pop hl
	push bc
	ret

Func_2ff4:
	ld hl, $2
	add hl, sp
	push hl
	ld bc, $8
	add hl, bc
	ld c, [hl]
	inc hl
	ld a, [hl]
	and $7f
	ld b, a
	or c
	jp z, Func_302d
	ld a, b
	or $80
	and c
	inc a
	jp z, Func_302d
	push de
	push hl
	pop de
	pop hl
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	bit 7, d
	jp z, Func_3026
	ld de, $0
	jp c, Func_3026
	ld de, $7fff
Func_3026: ; 3026 (0:3026)
	ld a, [hl]
	and $80
	or d
	ld [hl], a
	dec hl
	ld [hl], e
Func_302d: ; 302d (0:302d)
	pop hl
	ret

Func_302f:
	push de
	push hl
	pop de
	pop hl
	ld hl, Pointer_0015
	add hl, sp
	ld a, [hl]
	xor $80
	ld [hl], a
	push de
	push hl
	pop de
	pop hl
	pop bc
	ld de, $0
	push de
	push bc
	push hl
	ld hl, $6
	add hl, sp
	call Func_31a4
	ld c, a
	push de
	ld hl, $12
	add hl, sp
	call Func_31a4
	dec hl
	ld [hl], $0
	push de
	push hl
	pop de
	pop hl
	pop de
	push af
	xor c
	push af
	call Func_3608
	jp z, Func_30a1
	jp c, Func_3076
	ld b, d
	ld c, e
	push de
	push hl
	pop de
	pop hl
	ld hl, $9
	jp Func_307b

Func_3076: ; 3076 (0:3076)
	ld b, h
	ld c, l
	ld hl, Byte_0013
Func_307b: ; 307b (0:307b)
	add hl, sp
	push de
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	push hl
	ld hl, $48
	call Func_3608
	pop hl
	ld c, $9
	jp c, Func_3097
	ld b, e
	call Func_31ea
	jp Func_30a2

Func_3097: ; 3097 (0:3097)
	xor a
Func_3098: ; 3098 (0:3098)
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_3098
	jp Func_30a2

Func_30a1: ; 30a1 (0:30a1)
	push hl
Func_30a2: ; 30a2 (0:30a2)
	ld hl, $b
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, Pointer_0015
	add hl, sp
	pop bc
	pop af
	push bc
	ld c, $9
	bit 7, h
	jp nz, Func_30c2
	call Func_3245
	pop de
	call c, Func_30ec
	jp Func_30db

Func_30c2: ; 30c2 (0:30c2)
	call Func_3230
	pop de
	jp nc, Func_30db
	push hl
	ld b, c
	and a
Func_30cc: ; 30cc (0:30cc)
	ld a, $0
	sbc [hl]
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_30cc
	ld c, b
	pop hl
	pop af
	xor $80
	push af
Func_30db: ; 30db (0:30db)
	pop af
	call Func_3106
	pop de
	pop bc
	ld hl, Bank_000c
	add hl, sp
	ld sp, hl
	push de
	push hl
	pop de
	pop hl
	push bc
	ret

Func_30ec: ; 30ec (0:30ec)
	push hl
	push de
	ld b, $1
	call Func_31ea
	ld b, $0
	add hl, bc
	dec hl
	ld a, [hl]
	or $80
	ld [hl], a
	pop de
	pop hl
	inc de
	ld a, d
	and $80
	ret z
	ld de, $7fff
	ret

Func_3106: ; 3106 (0:3106)
	push af
	ld a, d
	xor $80
	and e
	inc a
	jp z, Func_318d
	ld a, d
	or e
	jp z, Func_3198
	push de
	push hl
	ld b, $0
	add hl, bc
	ld d, c
Func_311a: ; 311a (0:311a)
	dec hl
	ld a, [hl]
	or a
	jp nz, Func_312b
	ld a, b
	add $8
	ld b, a
	dec d
	jp nz, Func_311a
	jp Func_3196

Func_312b: ; 312b (0:312b)
	dec b
Func_312c: ; 312c (0:312c)
	inc b
	add a
	jp nc, Func_312c
	pop hl
	call Func_31b4
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	ld a, l
	sub b
	ld e, a
	ld a, h
	sbc $0
	ld d, a
	pop hl
	bit 7, a
	jp nz, Func_3198
	ld a, c
	sub $9
	jp c, Func_318d
	ld b, a
	inc b
	xor a
	jp Func_3160

Func_315e: ; 315e (0:315e)
	or [hl]
	inc hl
Func_3160: ; 3160 (0:3160)
	dec b
	jp nz, Func_315e
	or a
	jp z, Func_316a
	ld a, $1
Func_316a: ; 316a (0:316a)
	or [hl]
	inc hl
	ld bc, $8
	cp $81
	jp nc, Func_317e
	cp $80
	jp nz, Func_318d
	ld a, [hl]
	rra
	jp nc, Func_318d
Func_317e: ; 317e (0:317e)
	call Func_321e
	jp nz, Func_318d
	add hl, bc
	dec hl
	ld [hl], $80
	inc de
	inc hl
	jp Func_3190

Func_318d: ; 318d (0:318d)
	ld b, $0
	add hl, bc
Func_3190: ; 3190 (0:3190)
	ld [hl], e
	inc hl
	pop af
	or d
	ld [hl], a
	ret

Func_3196: ; 3196 (0:3196)
	pop hl
	pop de
Func_3198: ; 3198 (0:3198)
	pop af
	xor a
Func_319a: ; 319a (0:319a)
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_319a
	ld [hl], a
	inc hl
	ld [hl], a
	ret

Func_31a4: ; 31a4 (0:31a4)
	push hl
	ld de, $8
	add hl, de
	ld e, [hl]
	inc hl
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [hl]
	and $80
	pop hl
	ret

Func_31b4: ; 31b4 (0:31b4)
	push hl
	push de
	push bc
	ld e, b
	ld b, $0
Func_31ba: ; 31ba (0:31ba)
	ld a, e
	sub $8
	jp c, Func_31d2
	ld e, a
	ld d, c
	dec d
	add hl, bc
	dec hl
Func_31c5: ; 31c5 (0:31c5)
	dec hl
	ld a, [hl]
	inc hl
	ld [hl], a
	dec hl
	dec d
	jp nz, Func_31c5
	ld [hl], b
	jp Func_31ba

Func_31d2: ; 31d2 (0:31d2)
	inc e
	jp Func_31e2

Func_31d6: ; 31d6 (0:31d6)
	push hl
	ld d, c
	and a
Func_31d9: ; 31d9 (0:31d9)
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	dec d
	jp nz, Func_31d9
	pop hl
Func_31e2: ; 31e2 (0:31e2)
	dec e
	jp nz, Func_31d6
	pop bc
	pop de
	pop hl
	ret

Func_31ea: ; 31ea (0:31ea)
	push hl
	push de
	push bc
	ld e, b
	ld b, $0
Func_31f0: ; 31f0 (0:31f0)
	ld a, e
	sub $8
	jp c, Func_3208
	ld e, a
	push hl
	ld d, c
	dec d
Func_31fa: ; 31fa (0:31fa)
	inc hl
	ld a, [hl]
	dec hl
	ld [hl], a
	inc hl
	dec d
	jp nz, Func_31fa
	ld [hl], b
	pop hl
	jp Func_31f0

Func_3208: ; 3208 (0:3208)
	inc e
	jp Func_3216

Func_320c: ; 320c (0:320c)
	ld d, c
	add hl, bc
Func_320e: ; 320e (0:320e)
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec d
	jp nz, Func_320e
Func_3216: ; 3216 (0:3216)
	dec e
	jp nz, Func_320c
	pop bc
	pop de
	pop hl
	ret

Func_321e: ; 321e (0:321e)
	push hl
	push bc
	inc c
	jp Func_3229

Func_3224: ; 3224 (0:3224)
	inc [hl]
	jp nz, Func_322d
	inc hl
Func_3229: ; 3229 (0:3229)
	dec c
	jp nz, Func_3224
Func_322d: ; 322d (0:322d)
	pop bc
	pop hl
	ret

Func_3230: ; 3230 (0:3230)
	push hl
	push de
	push bc
	push de
	push hl
	pop de
	pop hl
	and a
Func_3238: ; 3238 (0:3238)
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	dec c
	jp nz, Func_3238
	pop bc
	pop de
	pop hl
	ret

Func_3245: ; 3245 (0:3245)
	push hl
	push de
	push bc
	push de
	push hl
	pop de
	pop hl
	and a
Func_324d: ; 324d (0:324d)
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	dec c
	jp nz, Func_324d
	pop bc
	pop de
	pop hl
	ret

Func_325a:
	pop hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fff6
	add hl, sp
	ld sp, hl
	ld c, $a
Func_3266: ; 3266 (0:3266)
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_3266
	push de
	push hl
	pop de
	pop hl
	jp [hl]

Func_3273:
	pop bc
	ld a, $5
Func_3276: ; 3276 (0:3276)
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jp nz, Func_3276
	push bc
	ld bc, $fff6
	add hl, bc
	ret

Func_3285:
	pop bc
	ld a, $4
Func_3288: ; 3288 (0:3288)
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jp nz, Func_3288
	push bc
	ld bc, $fff8
	add hl, bc
	ret

Func_3297:
	ld bc, $8
	ld a, $4
	jp Func_32a4

Func_329f:
	ld bc, $a
	ld a, $5
Func_32a4: ; 32a4 (0:32a4)
	add hl, bc
	pop bc
Func_32a6: ; 32a6 (0:32a6)
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	dec a
	jp nz, Func_32a6
	push bc
	ret

Data_32b1:
	dr $32b1, $32d1

Func_32d1: ; 32d1 (0:32d1)
	pop bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	dec hl
	dec hl
	dec hl
	push bc
	ret

Func_32e0: ; 32e0 (0:32e0)
	pop bc
	inc hl
	inc hl
	inc hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	push bc
	ret

Func_32ef:
	ld hl, $6
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3319:
	ld hl, $6
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3343: ; 3343 (0:3343)
	ld hl, $6
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_336d:
	ld hl, $2
	add hl, sp
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	ret

Func_3381:
	ld hl, $2
	add hl, sp
	ld a, b
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push hl
	jp Func_3396

Func_3391: ; 3391 (0:3391)
	ld d, e
	ld e, b
	ld b, c
	ld c, $0
Func_3396: ; 3396 (0:3396)
	ld l, a
	sub $8
	jp nc, Func_3391
	inc l
	jp Func_33ac

Func_33a0: ; 33a0 (0:33a0)
	ld a, c
	add a
	ld c, a
	ld a, b
	rla
	ld b, a
	ld a, e
	rla
	ld e, a
	ld a, d
	rla
	ld d, a
Func_33ac: ; 33ac (0:33ac)
	dec l
	jp nz, Func_33a0
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	dec hl
	ld [hl], b
	dec hl
	ld [hl], c
	ret

Func_33b9:
	ld hl, $2
	add hl, sp
Func_33bd: ; 33bd (0:33bd)
	ld a, b
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push hl
	jp Func_33ce

Func_33c9: ; 33c9 (0:33c9)
	ld c, b
	ld b, e
	ld e, d
	ld d, $0
Func_33ce: ; 33ce (0:33ce)
	ld l, a
	sub $8
	jp nc, Func_33c9
	inc l
	jp Func_33e5

Func_33d8: ; 33d8 (0:33d8)
	and a
	ld a, d
	rra
	ld d, a
	ld a, e
	rra
	ld e, a
	ld a, b
	rra
	ld b, a
	ld a, c
	rra
	ld c, a
Func_33e5: ; 33e5 (0:33e5)
	dec l
	jp nz, Func_33d8
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	dec hl
	ld [hl], b
	dec hl
	ld [hl], c
	ret

Func_33f2: ; 33f2 (0:33f2)
	ld hl, $6
	add hl, sp
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	or a
	push af
	push hl
	call Func_35c1
	ld hl, $9
	add hl, sp
	ld a, [hl]
	dec hl
	dec hl
	dec hl
	or a
	call Func_35c1
	pop hl
	call Func_346d
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop af
	call Func_35c1
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3424: ; 3424 (0:3424)
	ld hl, $6
	add hl, sp
Func_3428: ; 3428 (0:3428)
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	or a
	push af
	call Func_35c1
	pop af
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
	xor [hl]
	push af
	ld a, [hl]
	dec hl
	dec hl
	dec hl
	or a
	call Func_35c1
	push de
	push hl
	pop de
	pop hl
	call Func_346d
	pop af
	call Func_35c1
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3456:
	ld hl, $6
	add hl, sp
	push af
	call Func_346d
	pop af
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_346d: ; 346d (0:346d)
	ld bc, $0
	ld d, b
	ld e, b
	ld a, $20
Func_3474: ; 3474 (0:3474)
	push af
	push hl
	ld a, [hl]
	add a
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	ld a, e
	rla
	ld e, a
	ld a, d
	rla
	ld d, a
	ld a, c
	rla
	ld c, a
	ld a, b
	rla
	ld b, a
	push de
	push bc
	ld hl, $e
	add hl, sp
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	inc hl
	ld a, c
	sbc [hl]
	ld c, a
	inc hl
	ld a, b
	sbc [hl]
	ld b, a
	jp nc, Func_34af
	pop bc
	pop de
	pop hl
	jp Func_34b3

Func_34af: ; 34af (0:34af)
	pop af
	pop af
	pop hl
	inc [hl]
Func_34b3: ; 34b3 (0:34b3)
	pop af
	dec a
	jp nz, Func_3474
	ret

Func_34b9:
	ld hl, $6
	add hl, sp
	push af
	call Func_346d
	pop af
	pop bc
	pop af
	pop af
	push bc
	ret

Func_34c7: ; 34c7 (0:34c7)
	ld hl, $6
	add hl, sp
	ld bc, $0
	ld d, b
	ld e, b
	push hl
	jp Func_3508

Func_34d4: ; 34d4 (0:34d4)
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	jp nc, Func_34f7
	pop hl
	push hl
	ld a, e
	add [hl]
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld d, a
	inc hl
	ld a, c
	adc [hl]
	ld c, a
	inc hl
	ld a, b
	adc [hl]
	ld b, a
Func_34f7: ; 34f7 (0:34f7)
	pop hl
	push hl
	ld a, [hl]
	add a
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
Func_3508: ; 3508 (0:3508)
	ld hl, $4
	add hl, sp
	ld a, [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jp nz, Func_34d4
	pop hl
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3525:
	ld hl, $6
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	sub [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_354f:
	ld hl, $6
	add hl, sp
Func_3553: ; 3553 (0:3553)
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	add [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

Func_3579: ; 3579 (0:3579)
	ld hl, $9
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
	ld a, [de]
	xor [hl]
	bit 7, a
	jp z, Func_359f
	push de
	push hl
	pop de
	pop hl
	jp Func_359f

Func_3593: ; 3593 (0:3593)
	ld hl, $9
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
Func_359f: ; 359f (0:359f)
	call Func_35af
	pop de
	push af
	ld hl, $a
	add hl, sp
	pop af
	ld sp, hl
	push de
	push hl
	pop de
	pop hl
	jp [hl]

Func_35af: ; 35af (0:35af)
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret

Func_35c1: ; 35c1 (0:35c1)
	push af
	and $80
	jp nz, Func_35c9
	pop af
	ret

Func_35c9: ; 35c9 (0:35c9)
	pop af
	call Func_35d2
	ret

Func_35ce: ; 35ce (0:35ce)
	ld hl, $2
	add hl, sp
Func_35d2: ; 35d2 (0:35d2)
	xor a
	sub [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	dec hl
	dec hl
	dec hl
	ret

Func_35e8: ; 35e8 (0:35e8)
	push hl
	jp Func_35f1

Func_35ec: ; 35ec (0:35ec)
	ld a, [hl]
	inc hl
	ld [de], a
	inc de
	dec bc
Func_35f1: ; 35f1 (0:35f1)
	ld a, b
	or c
	jp nz, Func_35ec
	pop hl
	ret

Func_35f8: ; 35f8 (0:35f8)
	ld a, h
	xor b
	bit 7, a
	jp z, Func_3602
	ld a, b
	cp h
	ret

Func_3602: ; 3602 (0:3602)
	ld a, h
	cp b
	ret nz
	ld a, l
	cp c
	ret

Func_3608: ; 3608 (0:3608)
	ld a, h
	xor d
	bit 7, a
	jp z, Func_3612
	ld a, d
	cp h
	ret

Func_3612: ; 3612 (0:3612)
	ld a, h
	cp d
	ret nz
	ld a, l
	cp e
	ret

Func_3618:
	inc b
Func_3619: ; 3619 (0:3619)
	dec b
	ret z
	and a
	rra
	jp Func_3619

Func_3620:
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_3638
	push de
	push hl
	pop de
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	push de
	push hl
	pop de
	pop hl
	pop de
	ret

Func_3638: ; 3638 (0:3638)
	inc b
Func_3639: ; 3639 (0:3639)
	dec b
	ret z
	and a
	ld a, h
	rra
	ld h, a
	ld a, l
	rra
	ld l, a
	jp Func_3639

Func_3645:
	inc b
Func_3646: ; 3646 (0:3646)
	dec b
	ret z
	add a
	jp Func_3646

Func_364c:
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_3664
	push de
	push hl
	pop de
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	push de
	push hl
	pop de
	pop hl
	pop de
	ret

Func_3664: ; 3664 (0:3664)
	inc b
Func_3665: ; 3665 (0:3665)
	dec b
	ret z
	add hl, hl
	jp Func_3665

Func_366b:
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_36c6
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_3678:
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_3706
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_3685:
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_36c6
	push de
	push hl
	pop de
	pop hl
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

Func_369a:
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_3706
	push de
	push hl
	pop de
	pop hl
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

Func_36af: ; 36af (0:36af)
	push hl
	ld l, a
	ld h, $0
	ld c, $8
Func_36b5: ; 36b5 (0:36b5)
	add hl, hl
	ld a, h
	cp b
	jp c, Func_36be
	sub b
	inc l
	ld h, a
Func_36be: ; 36be (0:36be)
	dec c
	jp nz, Func_36b5
	ld a, l
	ld b, h
	pop hl
	ret

Func_36c6: ; 36c6 (0:36c6)
	ld a, h
	or a
	push af
	xor d
	push af
	call Func_36fa
	push de
	push hl
	pop de
	pop hl
	call Func_36fa
	push de
	push hl
	pop de
	pop hl
	call Func_3706
	pop af
	call Func_36ed
	pop af
	push de
	push hl
	pop de
	pop hl
	call Func_36ed
	push de
	push hl
	pop de
	pop hl
	ret

Func_36ed: ; 36ed (0:36ed)
	push af
	and $80
	jp nz, Func_36f5
	pop af
	ret

Func_36f5: ; 36f5 (0:36f5)
	pop af
	call Func_36fe
	ret

Func_36fa: ; 36fa (0:36fa)
	ld a, h
	and $80
	ret z
Func_36fe: ; 36fe (0:36fe)
	dec hl
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	ret

Func_3706: ; 3706 (0:3706)
	ld b, d
	ld c, e
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	ld a, $10
Func_3711: ; 3711 (0:3711)
	push af
	add hl, hl
	xor a
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	adc l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	inc e
	jp nc, Func_3729
	add hl, bc
	dec e
Func_3729: ; 3729 (0:3729)
	pop af
	dec a
	jp nz, Func_3711
	push de
	push hl
	pop de
	pop hl
	ret

Func_3733:
	push hl
	ld h, a
	xor a
	ld c, $8
Func_3738: ; 3738 (0:3738)
	add a
	add hl, hl
	jp nc, Func_373e
	add b
Func_373e: ; 373e (0:373e)
	dec c
	jp nz, Func_3738
	pop hl
	ret

Func_3744:
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_3759
	pop de
	push de
	push hl
	pop de
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

Func_3759: ; 3759 (0:3759)
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
Func_3760: ; 3760 (0:3760)
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	jp nc, Func_376e
	add hl, bc
Func_376e: ; 376e (0:376e)
	dec a
	jp nz, Func_3760
	ret

Func_3773: ; 3773 (0:3773)
	ld de, $a
	jp Func_37c7

Func_3779:
	ld de, $9
	jp Func_37c7

Func_377f: ; 377f (0:377f)
	ld de, $8
	jp Func_37c7

Func_3785:
	ld de, $7
	jp Func_37c7

Func_378b: ; 378b (0:378b)
	ld de, $6
	jp Func_37c7

Func_3791: ; 3791 (0:3791)
	ld de, $5
	jp Func_37c7

Func_3797: ; 3797 (0:3797)
	ld de, $4
	jp Func_37c7

Func_379d:
	ld de, $3
	jp Func_37c7

Func_37a3:
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
Func_37c7: ; 37c7 (0:37c7)
	push de
	push hl
	pop de
	pop hl
	add hl, sp
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

Func_37d4: ; 37d4 (0:37d4)
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	ld e, [hl]
	inc hl
	ld d, $0
	push af
	push de
	push hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	push de
	push hl
	pop de
	pop hl
	add hl, sp
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

Func_3805: ; 3805 (0:3805)
	ld hl, $a
	jp Func_383f

Func_380b:
	ld hl, $9
	jp Func_383f

Func_3811: ; 3811 (0:3811)
	ld hl, $8
	jp Func_383f

Func_3817:
	ld hl, $7
	jp Func_383f

Func_381d: ; 381d (0:381d)
	ld hl, $6
	jp Func_383f

Func_3823: ; 3823 (0:3823)
	ld hl, $5
	jp Func_383f

Func_3829: ; 3829 (0:3829)
	ld hl, $4
	jp Func_383f

Func_382f:
	ld hl, $3
	jp Func_383f

Func_3835:
	pop hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	push de
	push hl
	pop de
	pop hl
Func_383f: ; 383f (0:383f)
	add hl, sp
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ret

Func_3848: ; 3848 (0:3848)
	pop hl
	ld e, [hl]
	inc hl
	push hl
	ld l, e
	ld h, $0
	add hl, sp
	ld e, [hl]
	inc hl
	ld h, [hl]
	ld l, e
	ret

Func_3855: ; 3855 (0:3855)
	push af
	push bc
	push de
	push hl
	ld hl, sp+$8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, e
	ld h, d
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, e
	ld h, d
	pop de
	pop bc
	pop af
	ret

Func_3875: ; 3875 (0:3875)
	push af
	push bc
	push de
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, e
	ld h, d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	pop bc
	pop af
	ret

Func_3891:
	ret

Data_3892: ; 3892 (0:3892)
	dr $3892, $3992

Func_3992: ; 3992 (0:3992)
	push hl
	pop hl
	push hl
	push hl
	ld hl, sp+$6
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call Func_3579
	jp nc, Func_39bd
	ld a, $1
	push af
	ld hl, sp+$8
	call Func_32e0
	call Func_35ce
	ld hl, sp+$c
	call Func_32d1
	pop af
	jp Func_39be

Func_39bd: ; 39bd (0:39bd)
	xor a
Func_39be: ; 39be (0:39be)
	push af
	xor a
Func_39c0: ; 39c0 (0:39c0)
	ld hl, sp+$8
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call Func_33f2
	pop hl
	pop af
	ld a, l
	add $30
	call Func_381d
	ld [hl], a
	inc hl
	call Func_378b
	ld hl, sp+$8
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call Func_3424
	ld hl, sp+$c
	call Func_32d1
	ld hl, sp+$8
	call Func_32e0
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call Func_3593
	jp nz, Func_39c0
	pop af
	or a
	jp z, Func_3a13
	call Func_3829
	ld [hl], $2d
	inc hl
	call Func_3797
Func_3a13: ; 3a13 (0:3a13)
	call Func_3829
	ld [hl], $0
	pop hl
	push hl
	call Func_3a36
	pop hl
	pop bc
	ret

Func_3a20: ; 3a20 (0:3a20)
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_3a2a
	dec bc
.asm_3a2a
	push bc
	push hl
	push de
	push hl
	pop de
	pop hl
	call Func_3992
	pop bc
	pop bc
	ret

Func_3a36: ; 3a36 (0:3a36)
	push hl
	push bc
	push bc
	ld hl, $0
	pop de
	push hl
	call Func_381d
	call Func_3cf2
	dec hl
	ld c, l
	ld b, h
Func_3a47: ; 3a47 (0:3a47)
	pop hl
	push hl
	ld e, c
	ld d, b
	call Func_3608
	jp nc, Func_3a7f
	pop hl
	push hl
	push hl
	call Func_3811
	pop de
	add hl, de
	ld l, [hl]
	ld h, $0
	call Func_3797
	call Func_381d
	add hl, bc
	ld a, [hl]
	pop hl
	push hl
	push hl
	call Func_3811
	pop de
	add hl, de
	ld [hl], a
	call Func_3829
	ld a, l
	call Func_381d
	add hl, bc
	ld [hl], a
	pop hl
	push hl
	inc hl
	pop de
	push hl
	dec bc
	jp Func_3a47

Func_3a7f: ; 3a7f (0:3a7f)
	pop bc
	pop bc
	pop bc
	ret

Func_3a83: ; 3a83 (0:3a83)
	ld [$c252], a
	ld a, e
	ld [$c253], a
	ld hl, $c253
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $c4a0
	add hl, de
	ld a, [$c252]
	ld e, a
	ld d, $0
	add hl, de
	call Func_3855
	dw $c261
	ret

Func_3aa8: ; 3aa8 (0:3aa8)
	ld a, $8f
	call Func_3aae
	ret

Func_3aae: ; 3aae (0:3aae)
	push af
	call Func_27f5
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop af
	ld e, a
	ld hl, $c4a0
	ld bc, $168
	call FillMemory
	ld a, [wSystemType]
	cp $11
	jp nz, Func_3ae1
	ld bc, $168
	ld e, $0
	ld hl, $c608
	call FillMemory
	ld a, $2
	ld [wOAM26VTile], a
Func_3ae1: ; 3ae1 (0:3ae1)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	xor a
	ld [$c252], a
	xor a
	ld [$c253], a
	ret

Func_3af6:
	ld a, $8e
	call Func_3aae
	ret

Func_3afc: ; 3afc (0:3afc)
	push af
	push de
	push bc
	push bc
	ld hl, sp+$1
	ld a, [$c2cd]
	or a
	jp nz, Func_3b0d
	xor a
	jp Func_3b0f

Func_3b0d: ; 3b0d (0:3b0d)
	ld a, $1
Func_3b0f: ; 3b0f (0:3b0f)
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $2
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $a3
	inc hl
	ld [hl], $62
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld b, h
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	dec de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call Func_03f8
	call Func_14d4
	ld a, [wSystemType]
	cp $11
	jp nz, Func_3bc0
	ld a, [wOAM26VTile]
	or a
	jp z, Func_3bc0
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld hl, sp+$4
	ld a, [hl]
	add $12
	ld hl, sp+$4
	ld [hl], a
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $a3
	inc hl
	ld [hl], $62
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld b, h
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	dec de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call Func_03f8
	call Func_14d4
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
	ld a, [wOAM26VTile]
	dec a
	ld [wOAM26VTile], a
Func_3bc0: ; 3bc0 (0:3bc0)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_3bc5: ; 3bc5 (0:3bc5)
	push af
	push de
	push bc
	push bc
	ld hl, sp+$1
	ld [hl], $2
	ld hl, sp+$0
	ld a, [$c2cd]
	or a
	jp nz, Func_3bdb
	ld a, $1
	jp Func_3bdc

Func_3bdb: ; 3bdb (0:3bdb)
	xor a
Func_3bdc: ; 3bdc (0:3bdc)
	ld [hl], a
	call Func_14d4
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $a3
	inc hl
	ld [hl], $62
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld b, h
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	dec de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call Func_03f8
	call Func_14d4
	ld a, [wSystemType]
	cp $11
	jp nz, Func_3c8c
	ld a, [wOAM26VTile]
	or a
	jp z, Func_3c8c
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld hl, sp+$4
	ld a, [hl]
	add $12
	ld hl, sp+$4
	ld [hl], a
	ld hl, wc21a
	ld [hl], $1
	inc hl
	ld [hl], $a3
	inc hl
	ld [hl], $62
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld b, h
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	dec de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call Func_03f8
	call Func_14d4
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
	ld a, [wOAM26VTile]
	dec a
	ld [wOAM26VTile], a
Func_3c8c: ; 3c8c (0:3c8c)
	ld a, [$c2cd]
	or a
	jp nz, Func_3c98
	ld a, $1
	jp Func_3c99

Func_3c98: ; 3c98 (0:3c98)
	xor a
Func_3c99: ; 3c99 (0:3c99)
	call Func_3cb8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_3ca1: ; 3ca1 (0:3ca1)
	push bc
	push de
	push af
	ld hl, sp+$8
	ld l, [hl]
	push hl
	call Func_3bc5
	pop bc
	pop af
	pop de
	pop bc
	ld hl, sp+$2
	ld l, [hl]
	push hl
	call Func_3bc5
	pop bc
	ret

Func_3cb8: ; 3cb8 (0:3cb8)
	push af
	or a
	jp nz, Func_3cc8
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_3cd0

Func_3cc8: ; 3cc8 (0:3cc8)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_3cd0: ; 3cd0 (0:3cd0)
	ld a, [wc203]
	or $6
	ld [wc203], a
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
Func_3ce0: ; 3ce0 (0:3ce0)
	ld a, [wc203]
	ld hl, $c204
	cp [hl]
	jp z, Func_3ced
	jp Func_3ce0

Func_3ced: ; 3ced (0:3ced)
	pop af
	ld [$c2cd], a
	ret

Func_3cf2: ; 3cf2 (0:3cf2)
	push hl
	ld bc, $0
Func_3cf6: ; 3cf6 (0:3cf6)
	pop hl
	push hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_3d02
	inc bc
	jp Func_3cf6

Func_3d02: ; 3d02 (0:3d02)
	ld l, c
	ld h, b
	pop bc
	ret

Func_3d06:
	cp $30
	jp c, Func_3d13
	cp $3a
	jp nc, Func_3d13
	ld a, $1
	ret

Func_3d13: ; 3d13 (0:3d13)
	xor a
	ret

Func_3d15:
	ld a, [wJoyPressed]
	ret

Func_3d19:
	ld a, [wJoyHeld]
	ld l, a
	xor a
	ld [wJoyHeld], a
	ld a, l
	ret

SECTION "3f80", HOME [$3f80]
Func_3f80:
	push af
	ld a, $1d
	ld [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	ld bc, .Return
	push bc
	jp [hl]

.Return
	ld a, $1c
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

SECTION "3fe0", HOME [$3fe0]
Func_3fe0:
	push af
	ld a, $14
	rst $20
	pop af
	ld bc, .Return
	push bc
	jp [hl]

.Return
	ld a, $1c
	rst $20
	ret

SECTION "Bank 01", ROMX, BANK [$01]
Func_4000:
	ld a, $0
	call Func_6169
	ld a, $e4
	ld [rBGP], a
	ld [wBGP], a
	ld [rOBP0], a
	ld [wOBP0], a
	ld a, $e0
	ld [rOBP1], a
	ld [wOBP1], a
	call Func_410c
	hlbgcoord 0, 0
	call Func_6149
	hlbgcoord 0, 0, vWindowMap
	call Func_6149
	ld a, $81
	call Func_617d
	call Func_0fde
	ld a, [wc203]
	or $9
	ld [wc203], a
	ld a, [wc213]
	or a
	ret nz
	ld a, $24
	ld [wc21a], a
	ld a, $87
	ld [wc21b], a
	ld a, $7b
	ld [$c21c], a
	call Func_03f8
	ld a, $3f
	ld [wc21a], a
IF DEF(SUN)
	ld a, $14
ENDC
IF DEF(STAR)
	ld a, $12
ENDC
	ld [wc21b], a
	ld a, $53
	ld [$c21c], a
	call Func_03f8
Func_4060: ; 4060 (1:4060)
	jp Func_1e4d

Func_4063:
	ret

Func_4064: ; 4064 (1:4064)
	di
	ld a, [wSystemType]
	push af
	ld hl, wLCD
	ld bc, $200
.asm_406f
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_406f
	pop af
	ld [wSystemType], a
	ld hl, Func_40bf
	ld de, wTimer
	ld b, $9
.asm_4082
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_4082
	ld de, wLCD
	ld b, $3
.asm_408d
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_408d
	call Func_40cb
	ld a, $98
	ld [$c210], a
	call Func_40f4
	ld a, $1
	ld [rIE], a
	ld a, [rSTAT]
	set 6, a
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ei
	ld a, $d
	ld [$c237], a
	ld a, $4
	ld [$c24d], a
	xor a
	ld [$c01c], a
	ld a, $80
	ld [rSC], a
	ret

Func_40bf:
	jp Func_0fde

Func_40c2:
	jp Serial_

Func_40c5:
	jp VBlank

Func_40c8:
	jp Func_117e

Func_40cb: ; 40cb (1:40cb)
	ld hl, sp+$0
	ld de, wOAM2_0aYCoord
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld hl, Data_40ea
.asm_40d9
	ld a, [hli]
	or a
	jr nz, .asm_40e2
	ld hl, Data_40ea
	jr .asm_40d9

.asm_40e2
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_40d9
	ret

Data_40ea:
	db "WILL TEST", $00

Func_40f4: ; 40f4 (1:40f4)
	ld c, hPushOAM % $100
	ld b, $a
	ld hl, Func_4102
.asm_40fb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_40fb
	ret

Func_4102:
	ld a, $c4
	ld [rDMA], a
	ld a, $28
.asm_4108
	dec a
	jr nz, .asm_4108
	ret

Func_410c: ; 410c (1:410c)
	ld hl, $9000
	ld de, GFX_4122
	ld bc, $800
	call MemCopy
	ld hl, $8800
	ld bc, $1b0
	call MemCopy
	ret

GFX_4122:
	dr $4122, $6122

Func_6122: ; 6122 (1:6122)
	or a
	jr nz, .asm_6137
	ld a, $98
	ld [$c231], a
	ld a, [wSCX]
	ld [$c232], a
	ld a, [wSCY]
	ld [$c233], a
	ret

.asm_6137
	ld a, $9c
	ld [$c231], a
	ld a, [wSCX2]
	ld [$c232], a
	ld a, [wSCY2]
	ld [$c233], a
	ret

Func_6149: ; 6149 (1:6149)
	ld bc, $400
.asm_614c
	ld a, $8f
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_614c
	ret

Func_6155:
	hlbgcoord 0, 0
	debgcoord 0, 0, vWindowMap
	ld a, [wLCDC]
	bit 3, a
	jr z, .asm_6168
	hlbgcoord 0, 0, vWindowMap
	debgcoord 0, 0
.asm_6168
	ret

Func_6169: ; 6169 (1:6169)
	push af
	call Func_6294
	ld [wLCDC], a
	ld a, [wc203]
	or $4
	ld [wc203], a
	call Func_6294
	pop af
	ret

Func_617d: ; 617d (1:617d)
	ld [wLCDC], a
	ld [rLCDC], a
	ret

Func_6183:
	push af
	ld a, [wLCDC]
	bit 7, a
	jr nz, .asm_618f
	pop af
	jp Func_617d

.asm_618f
	pop af
	jp Func_6169

Func_6193:
	ld a, [$c210]
	ld [$c231], a
	sub $98
	jr nz, .asm_61a3
	xor a
	call Func_6122
	jr Func_61a8

.asm_61a3
	ld a, $1
	call Func_6122
Func_61a8:
	ld a, c
	or a
	jp z, Func_1405
	cp $1
	jp z, Func_6226
	cp $2
	jp z, Func_61b8
	ret

Func_61b8: ; 61b8 (1:61b8)
	ld a, [$c233]
	srl a
	srl a
	srl a
	add e
	and $1f
	ld c, $0
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	ld [$c22e], a
	ld a, [$c231]
	add c
	ld [$c22f], a
	ld a, [$c232]
	srl a
	srl a
	srl a
	add d
	and $1f
	ld [$c230], a
	add b
	cp $21
	jr nc, asm_620a
Func_61f8: ; 61f8 (1:61f8)
	ld a, [$c22e]
	ld e, a
	ld a, [$c230]
	add e
	ld e, a
	ld a, [$c22f]
	adc $0
	ld d, a
	jp Func_1405

asm_620a
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push hl
	call Func_61f8
	xor a
	ld [$c230], a
	pop hl
	pop bc
	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld b, c
	jp Func_61f8

Func_6226: ; 6226 (1:6226)
	ld a, [$c233]
	srl a
	srl a
	srl a
	add l
	and $1f
	ld c, $0
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	sla a
	rl c
	ld [$c22e], a
	ld a, [$c231]
	add c
	ld [$c22f], a
	ld a, [$c232]
	srl a
	srl a
	srl a
	add h
	and $1f
	ld [$c230], a
	add b
	cp $21
	jr nc, asm_6278
Func_6266: ; 6266 (1:6266)
	ld a, [$c22e]
	ld l, a
	ld a, [$c230]
	add l
	ld l, a
	ld a, [$c22f]
	adc $0
	ld h, a
	jp Func_1405

asm_6278
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push de
	call Func_6266
	xor a
	ld [$c230], a
	pop de
	pop bc
	ld a, e
	add b
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld b, c
	jp Func_6266

Func_6294: ; 6294 (1:6294)
	push af
	push bc
.asm_6296
	ld a, [wc203]
	ld c, a
	ld a, [$c204]
	cp c
	jr nz, .asm_6296
	pop bc
	pop af
	ret

Func_62a3:
	push bc
	ld b, $0
	ld a, h
	or a
	jr z, .asm_62b2
	ld b, $1
	cp $1
	jr z, .asm_62b2
	ld b, $ff
.asm_62b2
	ld c, $0
	ld a, l
	or a
	jr z, .asm_62c0
	ld c, $1
	cp $1
	jr z, .asm_62c0
	ld c, $ff
.asm_62c0
	ld a, b
	cp $ff
	jr z, asm_62fb
	call Func_6122
	pop bc
	ld a, d
	sub b
	inc a
	ld d, b
	ld b, a
	ld a, e
	sub c
	inc a
	ld e, c
	ld c, a
	push bc
	ld l, e
	ld h, d
	call Func_14da
	pop bc
	ld a, e
	cp $12
	jp c, Func_62e3
	sub $12
	ld e, a
Func_62e3: ; 62e3 (1:62e3)
	push bc
	push hl
	push de
	ld c, $2
	call Func_61a8
	pop de
	inc e
	pop hl
	ld a, l
	add $14
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop bc
	dec c
	jr nz, Func_62e3
	ret

asm_62fb
	ld a, c
	call Func_6122
	pop bc
	ld a, d
	sub b
	inc a
	ld d, b
	ld b, a
	ld a, e
	sub c
	inc a
	ld e, c
	ld c, a
	push bc
	ld l, e
	ld h, d
	call Func_14da
	pop bc
	push de
	push hl
	pop de
	pop hl
	ld a, l
	cp $12
	jp c, Func_631e
	sub $12
	ld l, a
Func_631e: ; 631e (1:631e)
	push bc
	push de
	push hl
	ld c, $1
	call Func_61a8
	pop hl
	inc l
	pop de
	ld a, e
	add $14
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop bc
	dec c
	jr nz, Func_631e
	ret

Func_6336:
	ld a, c
	or a
	jr z, .asm_6368
	cp $1
	jr z, .asm_6355
	call Func_14da
	ld b, $8
.asm_6343
	ld c, $8
.asm_6345
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_6345
	push bc
	ld bc, $c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_6343
	ret

.asm_6355
	ld a, $9c
	ld [$c231], a
	ld a, [wSCX2]
	ld [$c232], a
	ld a, [wSCY2]
	ld [$c233], a
	jr .asm_6379

.asm_6368
	ld a, $98
	ld [$c231], a
	ld a, [wSCX]
	ld [$c232], a
	ld a, [wSCY]
	ld [$c233], a
.asm_6379
	ld c, $8
.asm_637b
	push bc
	push hl
	push de
	ld bc, $801
	call Func_61a8
	pop hl
	ld bc, $8
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	inc l
	pop bc
	dec c
	jr nz, .asm_637b
	ret

Func_6392:
	ld b, $80
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $7
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $2
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	inc de
	ld c, $8
	call Func_124e
	ld [de], a
	ret

Func_6483:
	rr l
	jr nc, .asm_648a
	ld a, [de]
	or b
	ld [de], a
.asm_648a
	rlc b
	jr nc, .asm_648f
	dec de
.asm_648f
	dec c
	jr nz, Func_6483
	ret

Func_6493:
	push hl
	push de
	ld l, e
	ld h, d
	ld de, $ffe5
	add hl, de
	ld e, $0
	ld bc, $1c
	call FillMemory
	pop de
	pop hl
	ld b, $2
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $7
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call Func_6483
	pop hl
	dec hl
	ret

Func_65db: ; 65db
	dr $65db, $68b6

Func_68b6: ; 68b6
	dr $68b6, $6b22

Func_6b22: ; 6b22
	dr $6b22, $6b37

Func_6b37: ; 6b37
	dr $6b37, $6b4b

Func_6b4b: ; 6b4b
	dr $6b4b, $8000

SECTION "Bank 02", ROMX, BANK [$02]
	dr $8000, $c000

SECTION "Bank 03", ROMX, BANK [$03]
	dr $c000, $e070

VBlank2::
	dr $e070, $10000

SECTION "Bank 04", ROMX, BANK [$04]
	dr $10000, $14000

SECTION "Bank 05", ROMX, BANK [$05]
	dr $14000, $144fd

Func_144fd:
	dr $144fd, $18000

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
Pointers_38000:
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
	dr $60000, $62ce4

Func_62ce4:
	dr $62ce4, $63141

Func_63141:
	dr $63141, $64000

SECTION "Bank 19", ROMX, BANK [$19]
	dr $64000, $64093

Data_64093:
	dr $64093, $64390

Data_64390:
	dr $64390, $657c5

Data_657c5:
	dr $657c5, $65bc8

Data_65bc8:
	dr $65bc8, $68000

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
	dr $70018, $7001b

Func_7001b:
	dr $7001b, $7001e

Func_7001e:
	dr $7001e, $74000

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
	ld [hOBP0], a
	ld a, $1b
	ld [hOBP1], a
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
	ld [hOBP0], a
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

Func_7c100: ; 7c100 (1f:4100)
	ld d, a
	push hl
	ld hl, Data_7c171
.asm_7c105
	ld a, [hl]
	cp $ff
	jr z, .asm_7c115
	ld a, d
	or a
	jr z, .asm_7c118
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jr .asm_7c105

.asm_7c115
	pop hl
	scf
	ret

.asm_7c118
	ld d, [hl]
	inc hl
	ld a, [hli]
	dec a
	cp e
	jr c, .asm_7c115
	sub e
	dec b
	cp b
	jr nc, .asm_7c125
	ld b, a
.asm_7c125
	inc b
	ld c, b
	ld b, $0
	jr nz, .asm_7c12c
	inc b
.asm_7c12c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, d
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	cp $8
	jr z, .asm_7c156
	sla e
	rl d
	sla c
	rl b
.asm_7c156
	add hl, de
	ld e, l
	ld d, h
	pop hl
	cp $8
	jr z, Func_7c167
	push bc
	push hl
	predef Func_015b
	pop hl
	pop bc
	add hl, bc
	or a
	ret

Func_7c167
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, Func_7c167
	ret

Data_7c171:
	dr $7c171, $7c17e

Func_7c17e: ; 7c17e (1f:417e)
	ret

Func_7c17f: ; 7c17f (1f:417f)
	ld a, [rLCDC]
	bit 7, a
	ret z
.asm_7c184
	ld a, [rLY]
	cp $48
	jr nc, .asm_7c184
	ld a, $0
	ld [rTAC], a
	ld a, l
	ld [rTMA], a
	ld a, h
	ld [rTAC], a
	and $4
	ld h, a
	ld a, [rIE]
	and $fb
	or h
	ld [rIE], a
	ret

Func_7c19f: ; 7c19f (1f:419f)
	push bc
	push de
	push hl
	ld c, a
	predef Func_024d
	cp c
	jr z, .asm_7c1aa
	predef Func_024d
.asm_7c1aa
	predef Func_0230
	pop hl
	pop de
	pop bc
	ret

Func_7c1b0: ; 7c1b0 (1f:41b0)
	cp $2d
	scf
	ret z
	cp $2a
	jr nz, .asm_7c1bc
	ld a, $a
	jr .asm_7c1cd

.asm_7c1bc
	cp $23
	jr nz, .asm_7c1c4
	ld a, $b
	jr .asm_7c1cd

.asm_7c1c4
	cp $30
	ret c
	cp $3a
	ccf
	ret c
	sub $30
.asm_7c1cd
	push bc
	push hl
	push af
	push de
	ld a, $80
	ld [rNR52], a
	ld a, $66
	ld [rNR51], a
	ld a, $77
	ld [rNR50], a
	ld a, $80
	ld [rNR21], a
	ld a, $f0
	ld [rNR22], a
	ld a, $80
	ld [rNR30], a
	ld a, $20
	ld [rNR32], a
	ld hl, $ff30
	ld de, Data_7c231
	ld b, $10
.asm_7c1f5
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_7c1f5
	pop de
	pop af
	ld hl, Data_7c241
	add a
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld [rNR33], a
	ld a, [hl]
	ld [rNR23], a
	ld a, $87
	ld [rNR24], a
	ld [rNR34], a
	ld b, $6
.asm_7c213
	call Func_7e0b5
	dec b
	jr nz, .asm_7c213
	ld a, [rNR30]
	and $7f
	ld [rNR30], a
	ld a, [rNR52]
	and $7f
	ld [rNR52], a
	ld b, $6
.asm_7c227
	call Func_7e0b5
	dec b
	jr nz, .asm_7c227
	pop hl
	pop bc
	xor a
	ret

Data_7c231:
	dr $7c231, $7c241

Data_7c241:
	dr $7c241, $7c259

Func_7c259: ; 7c259 (1f:4259)
	push bc
	push hl
	call Func_7c26e
	or a
	jr z, .asm_7c26a
	ld a, [hli]
	call Func_7c1b0
	ld a, [hl]
	call Func_7c1b0
	scf
.asm_7c26a
	ccf
	pop hl
	pop bc
	ret

Func_7c26e: ; 7c26e (1f:426e)
	ld b, a
	ld hl, Data_7c30a
	ld a, c
	cp $27
	jr nz, .asm_7c27a
	ld hl, Data_7c283
.asm_7c27a
	ld a, [hli]
	or a
	ret z
	cp b
	ret z
	inc hl
	inc hl
	jr .asm_7c27a

Data_7c283:
	dr $7c283, $7c30a

Data_7c30a:
	dr $7c30a, $7c437

Func_7c437: ; 7c437 (1f:4437)
	ld a, [hSRAMBank]
	push af
	call Func_7c4e9
Func_7c43d: ; 7c43d (1f:443d)
	pop af
	or a
	call Bank1F_GetSRAMBank
Bank1F_SetSRAMReadOnly:
	xor a
	ld [HuC3SRamEnable], a
	ret

Func_7c447: ; 7c447 (1f:4447)
	pop af
	call Bank1F_GetSRAMBank
	call Bank1F_SetSRAMReadOnly
	scf
	ret

Bank1F_SetSRAMReadWrite: ; 7c450 (1f:4450)
	ld a, SRAM_READWRITE
	ld [HuC3SRamEnable], a
	ret

Func_7c456: ; 7c456 (1f:4456)
	ld a, [hSRAMBank]
	push af
	call Func_7c47b
	jr c, Func_7c466
Func_7c45e:
	pop af
	call Bank1F_GetSRAMBank
	xor a
	ret

Func_7c464:
	add sp, $2
Func_7c466:
	pop af
	call Bank1F_GetSRAMBank
	scf
	ret

Func_7c46c:
	ld hl, Pointer_0015 + 1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Pointer_0015]
Bank1F_GetSRAMBank: ; 7c475 (1f:4475)
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	ret

Func_7c47b
	call Func_7c46c
	lb de, $53, $ac
	ld a, [hli]
	cp d
	jr nz, .asm_7c4e5
	ld a, [hli]
	cp e
	jr nz, .asm_7c4e5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [bc]
	cp d
	jr nz, .asm_7c4e5
	inc bc
	ld a, [bc]
	cp e
	jr nz, .asm_7c4e5
	ld de, $c000
	dec bc
	jr .asm_7c4a4

.asm_7c49b
	inc hl
	cpl
	cp [hl]
	jr nz, .asm_7c4e5
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_7c4a4
	inc hl
	ld a, [hli]
	cp e
	jr nz, .asm_7c4e5
	ld a, [hl]
	cp d
	jr nz, .asm_7c4e5
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld a, h
	cp $a0
	jr c, .asm_7c4e7
	cp d
	jr c, .asm_7c4d0
	jr nz, .asm_7c4c4
	ld a, l
	cp e
	jr c, .asm_7c4d0
.asm_7c4c4
	ld a, [hSRAMBank]
	or a
	jr z, .asm_7c4e5
	dec a
	call Bank1F_GetSRAMBank
	ld de, $c000
.asm_7c4d0
	ld a, [hl]
	cp $46
	jr z, .asm_7c49b
	cp $5a
	jr z, .asm_7c49b
	cp $52
	jr z, .asm_7c49b
	cp $44
	jr z, .asm_7c49b
	cp $53
	jr z, .asm_7c49b
.asm_7c4e5
	scf
	ret

.asm_7c4e7
	xor a
	ret

Func_7c4e9: ; 7c4e9 (1f:44e9)
	call Func_7c46c
	call Bank1F_SetSRAMReadWrite
	push hl
	ld bc, -$1e6
	add hl, bc
	push hl
	xor a
	ld b, $f6
	call Func_7c545
	ld b, $f0
	call Func_7c545
	ld b, $46
	call Func_7c545
	ld a, $20
	ld b, $3a
	call Func_7c545
	pop bc
	pop hl
	ld de, $c000
	call Func_7c534
	ld bc, $a002
	call Func_7c534
.asm_7c51a
	ld a, [hSRAMBank]
	or a
	jr nz, .asm_7c522
	ld bc, $4000
.asm_7c522
	ld a, $46
	call Func_7c536
	ld de, $c000
	ld a, [hSRAMBank]
	or a
	ret z
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c51a

Func_7c534: ; 7c534 (1f:4534)
	ld a, $53
Func_7c536: ; 7c536 (1f:4536)
	push hl
	ld [hli], a
	cpl
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop de
	ld l, c
	ld h, b
	ret

Func_7c545: ; 7c545 (1f:4545)
	ld [hli], a
	dec b
	jr nz, Func_7c545
	ret

Func_7c54a: ; 7c54a (1f:454a)
	ld a, [hSRAMBank]
	push af
	call Func_7c556
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_7c45e

Func_7c556: ; 7c556 (1f:4556)
	call Func_7c46c
	ld a, e
	and $1f
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld de, $6
	add hl, de
	ret

Func_7c566: ; 7c566 (1f:4566)
	ld a, [hSRAMBank]
	push af
	push hl
	call Func_7c556
	call Bank1F_SetSRAMReadWrite
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_7c43d

Func_7c577: ; 7c577 (1f:4577)
	ld a, [hSRAMBank]
	push af
	push hl
	call Func_7c586
	ld e, l
	ld d, h
	pop hl
	predef Func_015b
	jp Func_7c45e

Func_7c586: ; 7c586 (1f:4586)
	ld a, d
	cp $ff
	jr z, Func_7c5a8
	cp $fe
	jr z, asm_7c5af
	ld h, d
	ld l, e
Func_7c591: ; 7c591 (1f:4591)
	ld a, h
	and $60
	rlca
	rlca
	rlca
	push af
	ld a, h
	and $1f
	or $a0
	ld h, a
	pop af
	push hl
	ld hl, $ff97
	or [hl]
	pop hl
	jp Bank1F_GetSRAMBank

Func_7c5a8:
	call Func_7c46c
	ld d, $0
	add hl, de
	ret

asm_7c5af
	call Func_7c46c
	ld a, $77
	sub e
	jr nc, .asm_7c5b9
	ld a, $77
.asm_7c5b9
	inc a
	push af
	ld e, l
	ld d, h
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop af
	ret

Func_7c5ca: ; 7c5ca (1f:45ca)
	ld a, [hSRAMBank]
	push af
	push hl
	call Func_7c586
	call Bank1F_SetSRAMReadWrite
	pop de
	predef Func_015b
	jp Func_7c43d

Func_7c5da: ; 7c5da (1f:45da)
	ld a, h
	or l
	jr nz, .asm_7c5e1
	ld hl, $1fff
.asm_7c5e1
	ld a, [hSRAMBank]
	push af
	push hl
	call Func_7c46c
	pop bc
	ld de, $0
	push de
	ld a, b
	ld e, a
	and $1f
	ld b, a
	ld a, e
	and $e0
	ld e, $44
	jr z, .asm_7c606
	ld e, $52
	cp $20
	jr z, .asm_7c606
	ld e, $5a
	cp $40
	jp nz, Func_7c464
.asm_7c606
	push bc
	ld d, $46
	call Func_7c71e
	pop bc
	jp c, Func_7c6ee
	ld a, e
	cp $5a
	jr nz, .asm_7c61f
	ld a, h
	cp $a0
	jr nz, .asm_7c606
	ld a, l
	cp $2
	jr nz, .asm_7c606
.asm_7c61f
	push hl
	push de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld a, e
	sub c
	ld a, d
	sbc b
	jr nc, .asm_7c649
	push bc
	ld hl, sp+$6
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld a, b
	sbc d
	jr nc, .asm_7c644
	ld [hl], d
	dec hl
	ld [hl], e
.asm_7c644
	pop bc
	pop de
	pop hl
	jr .asm_7c606

.asm_7c649
	pop de
	pop hl
	push hl
	call Bank1F_SetSRAMReadWrite
	ld a, e
	cp $5a
	jr z, .asm_7c67f
	push de
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld a, l
	sub c
	ld e, a
	ld a, h
	sbc b
	ld d, a
	ld a, e
	sub $6
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_7c67d
	ld c, e
	ld b, d
	pop hl
	pop de
	ld a, e
	ld e, $46
	jr .asm_7c681

.asm_7c67d
	pop hl
	pop de
.asm_7c67f
	ld a, $46
.asm_7c681
	push af
	ld a, e
	ld [hli], a
	cpl
	ld [hli], a
	inc hl
	inc hl
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, c
	add l
	ld c, a
	ld a, b
	adc h
	ld b, a
	push bc
	ld a, e
	sub c
	ld c, a
	ld a, d
	sbc b
	ld b, a
	jr nz, .asm_7c6a7
	ld a, c
	cp $7
	jr nc, .asm_7c6a7
	pop bc
	pop hl
	pop af
	pop hl
	jr .asm_7c6e2

.asm_7c6a7
	pop bc
	pop hl
	pop af
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, c
	ld h, b
	pop bc
	push hl
	ld [hli], a
	cpl
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	pop bc
	cpl
	cp $46
	jr z, .asm_7c6c5
	ld l, c
	ld h, b
.asm_7c6c5
	ld a, d
	sub $c0
	or e
	jr nz, .asm_7c6df
	ld de, $a002
	ld a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	call Func_7c877
	ld a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c6e2

.asm_7c6df
	call Func_7c877
.asm_7c6e2
	ld de, $6
	add hl, de
	call Func_7c70a
	add sp, $2
	jp Func_7c43d

Func_7c6ee: ; 7c6ee (1f:46ee)
	pop hl
	set 7, h
	jp Func_7c45e

Func_7c6f4: ; 7c6f4 (1f:46f4)
	ld a, [hSRAMBank]
	push af
.asm_7c6f7
	call Func_7c46c
	ld d, $44
	call Func_7c71e
	jp c, Func_7c466
	call Func_7c70a
	call Func_7c7c5
	jr .asm_7c6f7

Func_7c70a: ; 7c70a (1f:470a)
	ld a, h
	and $1f
	ld h, a
	ld a, [hSRAMBank]
	and $fc
	ld [$ff97], a
	ld a, [hSRAMBank]
	and $3
	rrca
	rrca
	rrca
	or h
	ld h, a
	ret

Func_7c71e: ; 7c71e (1f:471e)
	ld a, [hl]
	inc hl
	cpl
	cp [hl]
	jr nz, .asm_7c75b
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	dec hl
	dec hl
	dec hl
	ld a, b
	cp $a0
	jr c, .asm_7c75b
	cp h
	jr c, .asm_7c742
	jr nz, .asm_7c739
	ld a, c
	cp l
	jr c, .asm_7c742
.asm_7c739
	ld a, [hSRAMBank]
	or a
	jr z, .asm_7c75b
	dec a
	call Bank1F_GetSRAMBank
.asm_7c742
	ld l, c
	ld h, b
	ld a, [hl]
	cp d
	ret z
	cp $46
	jr z, Func_7c71e
	cp $5a
	jr z, Func_7c71e
	cp $52
	jr z, Func_7c71e
	cp $44
	jr z, Func_7c71e
	cp $53
	jr z, Func_7c71e
.asm_7c75b
	scf
	ret

Func_7c75d: ; 7c75d (1f:475d)
	ld a, b
	cp $a0
	jr c, .asm_7c76d
	cp h
	jr c, .asm_7c76b
	jr nz, .asm_7c770
	ld a, c
	cp l
	jr nc, .asm_7c770
.asm_7c76b
	xor a
	ret

.asm_7c76d
	xor a
	scf
	ret

.asm_7c770
	xor a
	inc a
	ret

Func_7c773: ; 7c773 (1f:4773)
	call Func_7c75d
	ret c
	jp z, Func_7c83d
	ld a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	push hl
	ld hl, $c000
	call Func_7c83d
	pop hl
	push af
	ld a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	pop af
	ret

Func_7c791: ; 7c791 (1f:4791)
	ld a, d
	sub $c0
	or e
	jp nz, Func_7c856
	ld a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	push de
	ld de, $a002
	call Func_7c856
	pop de
	push af
	ld a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	pop af
	ret

Func_7c7af: ; 7c7af (1f:47af)
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

Func_7c7b7: ; 7c7b7 (1f:47b7)
	ld a, h
	or l
	jp z, Func_7c6f4
	ld de, $fffa
	add hl, de
	ccf
	ret c
	ld a, h
	rlca
	ret c
Func_7c7c5: ; 7c7c5 (1f:47c5)
	ld e, l
	ld d, h
	ld a, [hSRAMBank]
	push af
	call Func_7c586
	push hl
	ld a, [hli]
	cp $53
	jp z, Func_7c838
	cpl
	cp [hl]
	jp nz, Func_7c838
	inc hl
	call Func_7c7af
	pop hl
	call Func_7c773
	jp nz, Func_7c466
	call Func_7c791
	jp nz, Func_7c466
	call Bank1F_SetSRAMReadWrite
	ld a, $46
	ld [hli], a
	cpl
	ld [hld], a
	call Func_7c75d
	jr c, Func_7c808
	jp nz, Func_7c808
	ld a, [bc]
	cp $46
	jr nz, Func_7c808
asm_7c7ff
	ld hl, $4
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
Func_7c808:
	ld b, h
	ld c, l
	ld a, d
	sub $c0
	or e
	jr nz, .asm_7c824
	ld a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	ld de, $a002
	call Func_7c877
	ld a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c835

.asm_7c824
	ld a, [de]
	cp $46
	jr nz, .asm_7c832
	ld hl, $4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jr asm_7c7ff

.asm_7c832
	call Func_7c877
.asm_7c835
	jp Func_7c43d

Func_7c838: ; 7c838 (1f:4838)
	add sp, $2
	jp Func_7c466

Func_7c83d: ; 7c83d (1f:483d)
	push bc
	push de
	push hl
	ld a, [bc]
	ld d, a
	inc bc
	ld a, [bc]
	cpl
	cp d
	jr nz, asm_7c852
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp l
	jr nz, asm_7c852
	inc bc
	ld a, [bc]
	cp h
asm_7c852
	pop hl
	pop de
	pop bc
	ret

Func_7c856: ; 7c856 (1f:4856)
	push bc
	push de
	push hl
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	cpl
	cp b
	jr nz, asm_7c852
	inc de
	ld a, [de]
	cp l
	jr nz, asm_7c852
	inc de
	ld a, [de]
	cp h
	jr asm_7c852

Func_7c86b:
	push bc
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, e
	ld [bc], a
	inc bc
	ld a, d
	ld [bc], a
	pop bc
	ret

Func_7c877: ; 7c877 (1f:4877)
	push de
	inc de
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	pop de
	ret

Func_7c881: ; 7c881 (1f:4881)
	push hl
	call Func_7c889
	ld e, l
	ld d, h
	pop hl
	ret

Func_7c889: ; 7c889 (1f:4889)
	call Func_7c8dc
	ret c
	ld e, l
	ld d, h
	ld a, [hSRAMBank]
	push af
	call Func_7c586
	push hl
	ld a, [hli]
	cpl
	cp [hl]
	jp nz, Func_7c838
	inc hl
	call Func_7c7af
	pop hl
	call Func_7c773
	jp nz, Func_7c466
	call Func_7c791
	jp nz, Func_7c466
	call Func_7c75d
	jr c, Func_7c8ba
	jp nz, Func_7c8ba
	ld a, [bc]
	cp $46
	jr z, asm_7c8bc
Func_7c8ba:
	ld c, l
	ld b, h
asm_7c8bc
	ld a, d
	sub $c0
	or e
	jr z, .asm_7c8ce
	ld a, [de]
	cp $46
	jr nz, .asm_7c8ce
	ld hl, $4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
.asm_7c8ce
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc b
	ld h, a
	ld de, -6
	add hl, de
	xor a
	jp Func_7c45e

Func_7c8dc: ; 7c8dc (1f:48dc)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [$ff97], a
	ld hl, -6
	add hl, de
	ccf
	ret c
	ld a, h
	rlca
	ret

Func_7c8ec: ; 7c8ec (1f:48ec)
	call Func_7c8dc
	ret c
	push de
	call Func_7c7c5
	pop de
	ld a, [hSRAMBank]
	push af
	push de
	ld de, $fe00
	call Bank1F_SetSRAMReadWrite
	call Func_7c586
	ld b, a
	pop de
.asm_7c904
	ld a, [hli]
	cp e
	jr nz, .asm_7c91d
	ld a, [hli]
	cp d
	jr nz, .asm_7c91e
	ld a, [$ff97]
	cp [hl]
	jr nz, .asm_7c91e
	xor a
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ld a, $78
	sub b
	ld [$ffb7], a
	jp Func_7c43d

.asm_7c91d
	inc hl
.asm_7c91e
	inc hl
	inc hl
	dec b
	jr nz, .asm_7c904
	jp Func_7c43d

Func_7c926: ; 7c926 (1f:4926)
	or a
	ld a, [hSRAMBank]
	push af
	push af
	ld de, $fe00
	call Func_7c586
	ld b, a
	ld c, $0
.asm_7c934
	ld a, [hli]
	or [hl]
	jr z, .asm_7c939
	inc c
.asm_7c939
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_7c934
	ld a, $78
	sub c
	ld b, a
	pop af
	jp z, Func_7c45e
	push bc
	ld hl, $0
.asm_7c94b
	push hl
	ld hl, $1ff8
	call Func_7c5da
	bit 7, h
	jr nz, .asm_7c95d
	pop hl
	ld de, $1f
	add hl, de
	jr .asm_7c94b

.asm_7c95d
	ld a, h
	and $1f
	ld e, a
	ld d, $0
	pop hl
	add hl, de
	push hl
	call Func_7c6f4
	pop de
	pop bc
	jp Func_7c45e

Func_7c96e: ; 7c96e (1f:496e)
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	cp $ff
	jp z, Func_7c9dc
	ld [$ff97], a
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	bit 0, a
	jr z, Func_7c9dc
	ld hl, $fffa
	add hl, de
	jr nc, Func_7c9dc
	ld a, h
	rlca
	jr c, Func_7c9dc
	push bc
	ld a, [hSRAMBank]
	push af
	call Func_7c591
	ld bc, $a
	add hl, bc
	ld c, [hl]
	inc hl
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop af
	call Bank1F_GetSRAMBank
	pop bc
	ld a, c
	ld bc, $0
	dec a
	jr z, .asm_7c9ba
	ld a, e
	or d
	jr z, .asm_7c9ba
	dec b
	dec c
	ld a, e
	cpl
	ld e, a
	ld a, d
	cpl
	ld d, a
	inc de
.asm_7c9ba
	ld a, [hSRAMBank]
	push af
	push de
	push bc
	ld e, $40
	call Func_7c5a8
	call Bank1F_SetSRAMReadWrite
	pop bc
	pop de
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	pop af
	call Bank1F_GetSRAMBank
	call Bank1F_SetSRAMReadOnly
Func_7c9dc: ; 7c9dc (1f:49dc)
	pop hl
	ret

Func_7c9de: ; 7c9de (1f:49de)
	ld c, l
	ld b, h
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	or e
	jr z, .asm_7ca05
	ld a, [hl]
	ld [$ff97], a
	ld hl, -6
	add hl, de
	jr nc, .asm_7c9fc
	ld a, h
	rlca
	jr c, .asm_7c9fc
	ld a, [hSRAMBank]
	push af
	call Func_7c591
	jr .asm_7ca0b

.asm_7c9fc
	ld l, c
	ld h, b
	scf
	ret

.asm_7ca00
	ld l, c
	ld h, b
	jp Func_7c466

.asm_7ca05
	ld a, [hSRAMBank]
	push af
	call Func_7c46c
.asm_7ca0b
	ld e, l
	ld d, h
	ld a, [hli]
	cpl
	cp [hl]
	jr nz, .asm_7ca00
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $a0
	jr c, .asm_7ca00
	cp d
	jr c, .asm_7ca2d
	jr nz, .asm_7ca24
	ld a, l
	cp e
	jr c, .asm_7ca2d
.asm_7ca24
	ld a, [hSRAMBank]
	or a
	jr z, .asm_7ca00
	dec a
	call Bank1F_GetSRAMBank
.asm_7ca2d
	ld a, [hl]
	cp $52
	jr z, .asm_7ca36
	cp $5a
	jr nz, .asm_7ca0b
.asm_7ca36
	call Func_7ca4b
	jp Func_7c45e

Func_7ca3c: ; 7ca3c (1f:4a3c)
	ld a, e
	ld [$ff97], a
	ld a, [hSRAMBank]
	push af
	call Func_7c591
	call Func_7ca4f
	jp Func_7c45e

Func_7ca4b: ; 7ca4b (1f:4a4b)
	ld de, $6
	add hl, de
Func_7ca4f: ; 7ca4f (1f:4a4f)
	ld e, l
	ld d, h
	call Func_7c70a
	push bc
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	inc bc
	ld a, [$ff97]
	ld [bc], a
	inc bc
	ld l, c
	ld h, b
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld b, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld c, a
	or a
	jr z, .asm_7ca82
	push bc
.asm_7ca7b
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7ca7b
	pop bc
.asm_7ca82
	pop hl
	call Func_7ca88
	pop hl
	ret

Func_7ca88: ; 7ca88 (1f:4a88)
	ld de, $2e
	bit 0, b
	jr nz, .asm_7ca90
	ld e, d
.asm_7ca90
	ld a, $5
	add c
	ld c, a
	add e
	ld e, a
	ld a, d
	adc a
	ld [hl], e
	inc hl
	ld [hl], a
	inc hl
	ld [hl], e
	inc hl
	ld [hl], a
	ret

Func_7caa0: ; 7caa0 (1f:4aa0)
	ld a, c
	cp $ff
	jr nz, .asm_7caa8
	ld a, [$ffb7]
	ld c, a
.asm_7caa8
	push bc
	push hl
	ld a, $b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld hl, $2e
	bit 0, b
	jr nz, .asm_7cabb
	ld l, h
.asm_7cabb
	ld a, $5
	add c
	add l
	ld l, a
	ld a, h
	adc a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	pop bc
	push bc
	push hl
	ld a, $7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], b
	ld a, $20
	bit 1, b
	jr z, .asm_7cadf
	ld a, $40
.asm_7cadf
	or d
	ld h, a
	ld l, e
	call Func_7c5da
	ld d, h
	ld e, l
	pop hl
	pop bc
	ld a, d
	rlca
	ret c
	push bc
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld a, [$ff97]
	ld [hl], a
	inc hl
	push hl
	ld bc, $6
	add hl, bc
	ld b, [hl]
	inc hl
	inc hl
	ld c, [hl]
	pop hl
	push de
	call Func_7ca88
	pop de
	pop hl
	push hl
	push de
	push bc
	ld b, $0
	ld a, $7
	add l
	ld l, a
	ld a, b
	adc h
	ld h, a
	call Func_7c5ca
	pop bc
	pop hl
	pop de
	push de
	bit 0, b
	jr z, .asm_7cb5c
	ld b, $0
	add hl, bc
	add sp, -$2e
	push hl
	ld hl, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	predef Func_7d322
	ld de, $a
	predef Func_7d2e7
	ld e, l
	ld d, h
	ld hl, sp+$2
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	push hl
	ld de, rDMA
	ld bc, $a
	push bc
	call Func_7c577
	pop bc
	pop hl
	add hl, bc
	xor a
	ld b, $22
.asm_7cb4d
	ld [hli], a
	dec b
	jr nz, .asm_7cb4d
	ld hl, sp+$2
	pop de
	ld bc, $2e
	call Func_7c5ca
	add sp, $2e
.asm_7cb5c
	pop hl
	pop de
	ld a, [hSRAMBank]
	push af
	push hl
	push hl
	ld d, $fe
	call Bank1F_SetSRAMReadWrite
	call Func_7c586
	ld b, a
.asm_7cb6c
	ld a, [hli]
	or [hl]
	jr z, .asm_7cb7e
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_7cb6c
	pop hl
	call Func_7c8ec
	pop hl
	jp Func_7c447

.asm_7cb7e
	dec hl
	pop de
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	ld a, [de]
	ld [hl], a
	pop hl
	jp Func_7c43d

Func_7cb98: ; 7cb98 (1f:4b98)
	push hl
	inc hl
	inc hl
	inc hl
	push hl
	ld a, b
	call Func_7cbb9
	pop hl
	push af
	jr c, .asm_7cba9
	ld [hl], e
	inc hl
	ld [hl], d
	dec hl
.asm_7cba9
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop af
	pop hl
	ret

Func_7cbb9: ; 7cbb9 (1f:4bb9)
	or a
	jr z, .asm_7cbc4
	dec a
	jr z, .asm_7cbdc
	dec a
	jr z, .asm_7cbe3
	scf
	ret

.asm_7cbc4
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_7cbc9
	inc hl
.asm_7cbca
	ld a, e
	add c
	ld e, a
	ld a, d
	adc b
	ld d, a
	cp $20
	ccf
	ret c
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld a, b
	sbc d
	ret

.asm_7cbdc
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	inc hl
	jr .asm_7cbc9

.asm_7cbe3
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	dec hl
	jr .asm_7cbca

Func_7cbed: ; 7cbed (1f:4bed)
	add sp, -$a
	push hl
	push de
	ld de, -$2e
	ld b, $0
	call Func_7cb98
	pop de
	push de
	ld bc, $2e
	call Func_7cc9a
	pop de
	push bc
	push de
	jr c, .asm_7cc7e
	ld a, c
	cp $2e
	jr c, .asm_7cc7e
	ld hl, sp+$6
	ld de, rDMA
	ld bc, $a
	call Func_7c577
	pop hl
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .asm_7cc29
	srl d
	rr e
	jr nc, .asm_7cc25
	inc de
.asm_7cc25
	ld [hl], d
	dec hl
	ld [hl], e
	inc hl
.asm_7cc29
	inc hl
	ld b, $4
.asm_7cc2c
	ld e, l
	ld d, h
	ld a, [de]
	or a
	jr z, .asm_7cc5c
	ld hl, sp+$6
	push bc
	push de
	ld bc, $a
	predef Func_7af75
	ld a, h
	or l
	pop de
	pop bc
	jr z, .asm_7cc6a
	ld hl, $b
	add hl, de
	dec b
	jr nz, .asm_7cc2c
	pop de
	push de
	ld hl, $d
	add hl, de
	ld e, l
	ld d, h
	ld hl, $b
	add hl, de
	ld b, $16
.asm_7cc56
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7cc56
.asm_7cc5c
	ld hl, sp+$6
	push de
	ld b, $a
.asm_7cc61
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7cc61
	xor a
	ld [de], a
	pop de
.asm_7cc6a
	ld hl, $a
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_7cc74
	inc [hl]
.asm_7cc74
	pop de
	pop bc
	pop hl
	push hl
	push bc
	push de
	call Func_7cc8b
	xor a
.asm_7cc7e
	pop de
	pop bc
	pop hl
	jr c, .asm_7cc87
	add sp, $a
	xor a
	ret

.asm_7cc87
	add sp, $a
	scf
	ret

Func_7cc8b: ; 7cc8b (1f:4c8b)
	push de
	push bc
	ld de, -$2e
	ld b, $0
	call Func_7cb98
	pop bc
	pop de
	jp Func_7cca9

Func_7cc9a: ; 7cc9a (1f:4c9a)
	push hl
	push de
	call Func_7ccb8
	pop hl
	push bc
	ld [$ff97], a
	call Func_7c577
	pop bc
	pop hl
	ret

Func_7cca9: ; 7cca9 (1f:4ca9)
	push hl
	push de
	call Func_7ccb8
	pop hl
	push bc
	ld [$ff97], a
	call Func_7c5ca
	pop bc
	pop hl
	ret

Func_7ccb8: ; 7ccb8 (1f:4cb8)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	push af
	ld a, [hli]
	add e
	ld e, a
	ld a, [hl]
	adc d
	ld d, a
	push de
	push hl
	push bc
	ld d, [hl]
	dec hl
	ld e, [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld e, a
	ld a, b
	sbc d
	ld d, a
	pop bc
	pop hl
	ld a, e
	sub c
	ld a, d
	sbc b
	jr nc, .asm_7cce2
	ld c, e
	ld b, d
.asm_7cce2
	ld d, [hl]
	dec hl
	ld e, [hl]
	ld a, e
	add c
	ld e, a
	ld a, d
	adc b
	ld d, a
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	pop af
	ret

Func_7ccf1: ; 7ccf1 (1f:4cf1)
	push de
	push hl
	ld a, [hli]
	or [hl]
	ld a, $ff
	jr z, asm_7cd4c
	ld bc, $8
	add hl, bc
	ld c, [hl]
	inc hl
	inc hl
	ld b, [hl]
	inc hl
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
	ld a, b
	bit 4, c
	jp z, Func_7cd44
	or a
	push af
	bit 3, c
	jp nz, Func_7cd26
	sub $61
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	inc de
	ld bc, $60
	call Func_7c167
	jr Func_7cd37

Func_7cd26: ; 7cd26 (1f:4d26)
	sub $c1
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	inc de
	ld b, $4
.asm_7cd31
	call Func_7cd3b
	dec b
	jr nz, .asm_7cd31
Func_7cd37:
	pop af
	pop hl
	pop de
	ret

Func_7cd3b: ; 7cd3b (1f:4d3b)
	ld c, $30
.asm_7cd3d
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7cd3d
	ret

Func_7cd44: ; 7cd44 (1f:4d44)
	ld c, a
	ld a, [de]
	inc de
	or a
	jr z, asm_7cd6f
	ld d, h
	ld e, l
asm_7cd4c
	ld b, a
	ld c, $0
	ld hl, Data_7f875
.asm_7cd52
	ld a, [hli]
	cp b
	jr z, .asm_7cd5c
	inc c
	or a
	jr nz, .asm_7cd52
	dec c
	scf
.asm_7cd5c
	push af
	ld l, e
	ld h, d
	ld a, c
	add a
	add a
	ld e, a
	add a
	add e
	ld e, a
	ld d, $a2
	ld b, $c
	predef Func_026c
	jp Func_7cd37

asm_7cd6f
	ld a, c
	dec a
	ld bc, $2020
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push hl
	ld c, e
	ld b, d
	ld d, a
	ld e, $0
	ld h, $0
.asm_7cd82
	ld a, [bc]
	inc bc
	cp $e
	jr z, .asm_7cda7
	cp $f
	jr z, .asm_7cda7
	push de
	ld e, a
	ld a, [bc]
	ld d, a
	call Func_7db91
	pop de
	jr nc, .asm_7cd9a
	inc bc
	dec d
	jr z, .asm_7cdc6
.asm_7cd9a
	cp $60
	jr c, .asm_7cdb3
	cp $b0
	jr nc, .asm_7cda4
	add $50
.asm_7cda4
	sub h
	jr .asm_7cdb3

.asm_7cda7
	sub $e
	jr z, .asm_7cdad
	ld a, $50
.asm_7cdad
	ld h, a
	dec d
	jr z, .asm_7cdc6
	jr .asm_7cd82

.asm_7cdb3
	push de
	push hl
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	pop hl
	pop de
	dec d
	jr z, .asm_7cdc6
	inc e
	ld a, e
	cp $c
	jr nz, .asm_7cd82
.asm_7cdc6
	ld hl, sp+$2
	ld e, l
	ld d, h
	pop hl
	ld b, $4
.asm_7cdcd
	push bc
	push de
	call Func_7cde4
	call Func_7cde4
	call Func_7cdee
	pop de
	pop bc
	inc de
	dec b
	jr nz, .asm_7cdcd
	add sp, $c
	pop hl
	pop de
	xor a
	ret

Func_7cde4: ; 7cde4 (1f:4de4)
	push de
	call Func_7cdee
	pop de
	inc de
	inc de
	inc de
	inc de
	ret

Func_7cdee: ; 7cdee (1f:4dee)
	ld a, [de]
	ld e, a
	ld c, $3
	jp Func_7d689

asm_7cdf5
	halt
Func_7cdf6: ; 7cdf6 (1f:4df6)
	ld a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $12
	jr c, asm_7cdf5
	push hl
	push bc
	add $4
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $5
	call Func_7d25a
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

asm_7ce15
	halt
Func_7ce16: ; 7ce16 (1f:4e16)
	ld a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $15
	jr c, asm_7ce15
	push hl
	push bc
	add $5
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $6
	call Func_7d25a
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

asm_7ce35
	halt
Func_7ce36: ; 7ce36 (1f:4e36)
	ld a, [hFF88]
	ld b, a
	ld a, [hFF87]
	sub b
	add c
	jr c, asm_7ce35
	cp $f0
	jr nc, asm_7ce35
	ld a, c
	srl a
	srl a
	inc a
	add c
	add $12
	ld b, a
	jr .asm_7ce50

.asm_7ce4f
	halt
.asm_7ce50
	ld a, [hFF89]
	add b
	jr c, .asm_7ce4f
	cp $c8
	jr nc, .asm_7ce4f
	push bc
	push hl
	ld a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $2
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld b, a
	add a
	add b
	ld bc, Func_7d11d
	add c
	ld [hl], a
	ld a, $0
	adc b
	inc l
	ld [hl], a
	inc l
	pop bc
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	pop bc
	ret

Func_7ce7d: ; 7ce7d (1f:4e7d)
	ld a, b
	or a
.asm_7ce7f
	push af
	call Func_7ce16
	pop af
	push af
	jr nz, .asm_7ce8b
	ld a, b
	cp c
	jr nc, .asm_7ceab
.asm_7ce8b
	push bc
	push hl
	push de
	ld c, b
	ld b, $0
	push bc
	call Func_7ceb8
	pop bc
	pop hl
	add hl, bc
	ld e, l
	ld d, h
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
	jr .asm_7ce7f

.asm_7ceab
	pop af
	call Func_7ceb8
Func_7ceaf: ; 7ceaf (1f:4eaf)
	ei
	halt
	ld a, [hFF89]
	or a
	jr nz, Func_7ceaf
	ret

asm_7ceb7
	halt
Func_7ceb8: ; 7ceb8 (1f:4eb8)
	ld a, [hFF88]
	ld b, a
	ld a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7ceb7
	ld a, c
	srl a
	inc a
	add c
	add $15
	ld b, a
	jr .asm_7cecd

.asm_7cecc
	halt
.asm_7cecd
	ld a, [hFF89]
	add b
	jr c, .asm_7cecc
	cp $c8
	jr nc, .asm_7cecc
	push hl
	push de
	ld a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $3
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld e, a
	add a
	add e
	ld de, Func_7cfcf
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	di
	ld a, l
	ld [hFF87], a
	ld a, [hFF89]
	add b
	ld [hFF89], a
	ei
	ret

Func_7cf08:
	REPT 64
	ld a, [hl]
	cpl
	ld [hli], a
	ENDR
	ld a, b
	ld [hFF89], a
	ld a, c
	ld [hFF88], a
	ret

Func_7cfcf:
	REPT 64
	ld a, [hli]
	ld [de], a
	inc de
	ENDR
	ld a, b
	ld [hFF89], a
	ld a, c
	ld [hFF88], a
	ret

Func_7d096:
	REPT 128
	ld [hli], a
	ENDR
	ld a, b
	ld [hFF89], a
	ld a, c
	ld [hFF88], a
	ret

Func_7d11d:
	REPT 64
	ld a, [de]
	inc e
	ld [hli], a
	ENDR
	ld a, e
	ld [hFF88], a
	ld a, b
	ld [hFF89], a
	ret

Func_7d1e4: ; 7d1e4 (1f:51e4)
	ld a, [hFF88]
	ld l, a
	ld a, [hFF87]
	sub l
	ret z
	ld a, [rLY]
	cp $90
	ret c
	ld e, a
	ld h, $c2
	ld c, [hl]
	inc l
	ld b, [hl]
	inc l
	ld a, $99
	sub e
	ret z
	ld e, a
	add a
	ld d, a
	add a
	add a
	ld h, a
	add a
	add h
	add d
	add e
	sub $7
	cp b
	ret c
	ld h, $c2
	ld de, Func_7d1e4
	push de
	ld a, [hFF89]
	sub b
	ld b, a
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	push de
	ld a, c
	cp $2
	jr z, .asm_7d23a
	cp $1
	jr z, .asm_7d243
	cp $3
	jr z, .asm_7d24d
	cp $4
	jr z, .asm_7d233
	pop af
	pop af
	xor a
	ld [hFF87], a
	ld [hFF88], a
	ld [hFF89], a
	ret

.asm_7d233
	ld a, [hl]
	inc l
	ld h, [hl]
	inc l
	ld c, l
	ld l, a
	ret

.asm_7d23a
	ld c, [hl]
	inc l
	ld a, [hl]
	inc l
	ld e, l
	ld d, h
	ld l, c
	ld h, a
	ret

.asm_7d243
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	ld a, [hl]
	inc l
	ld c, l
	ld l, e
	ld h, d
	ret

.asm_7d24d
	ld c, [hl]
	inc l
	ld a, [hl]
	inc l
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	ld h, a
	ld a, l
	ld l, c
	ld c, a
	ret

Func_7d25a: ; 7d25a (1f:525a)
	ld b, $8
.asm_7d25c
	add hl, hl
	ld a, h
	sub c
	jr c, .asm_7d263
	ld h, a
	inc l
.asm_7d263
	dec b
	jr nz, .asm_7d25c
	ret

Func_7d267: ; 7d267 (1f:5267)
	ld a, h
	xor d
	ld h, a
	ld a, l
	xor e
	ld l, a
	ret

Func_7d26e: ; 7d26e (1f:526e)
	ld a, h
	or d
	ld h, a
	ld a, l
	or e
	ld l, a
	ret

Func_7d275: ; 7d275 (1f:5275)
	ld a, h
	and d
	ld h, a
	ld a, l
	and e
	ld l, a
	ret

Func_7d27c: ; 7d27c (1f:527c)
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	ret

Func_7d283: ; 7d283 (1f:5283)
	ld a, d
	xor h
	rlca
	ld a, d
	jr c, .asm_7d295
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld b, $1
	or l
	jr z, .asm_7d29c
	ld a, h
.asm_7d295
	ld b, $2
	rlca
	jr c, .asm_7d29c
	ld b, $4
.asm_7d29c
	ld a, b
	ld b, $0
	ld hl, Data_7d2aa
	add hl, bc
	and [hl]
	jr z, asm_7d2da
	ld hl, $ffff
	ret

Data_7d2aa:
	dr $7d2aa, $7d2b3

Func_7d2b3: ; 7d2b3 (1f:52b3)
	ld a, h
	or a
	jr nz, asm_7d2da
	ld a, l
	cp $10
	jr nc, asm_7d2da
	ld l, e
	ld h, d
	or a
	ret z
.asm_7d2c0
	srl h
	rr l
	dec a
	jr nz, .asm_7d2c0
	ret

Func_7d2c8: ; 7d2c8 (1f:52c8)
	ld a, h
	or a
	jr nz, asm_7d2da
	ld a, l
	cp $10
	jr nc, asm_7d2da
	ld l, e
	ld h, d
	or a
	ret z
.asm_7d2d5
	add hl, hl
	dec a
	jr nz, .asm_7d2d5
	ret

asm_7d2da
	ld hl, $0
	ret

Func_7d2de: ; 7d2de (1f:52de)
	add hl, de
	ret

Func_7d2e0: ; 7d2e0 (1f:52e0)
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ret

Func_7d2e7: ; 7d2e7 (1f:52e7)
	ld a, h
	or l
	ret z
	ld a, d
	or e
	jr z, asm_7d2da
	ld a, h
	xor d
	rlca
	push af
	ld a, d
	rlca
	jr nc, .asm_7d2fd
	ld a, d
	cpl
	ld d, a
	ld a, e
	cpl
	ld e, a
	inc de
.asm_7d2fd
	ld a, h
	rlca
	jr nc, .asm_7d308
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
.asm_7d308
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
.asm_7d30f
	add hl, hl
	rl c
	rl b
	jr nc, .asm_7d31d
	add hl, de
	jr nc, .asm_7d31d
	inc c
	jr nz, .asm_7d31d
	inc b
.asm_7d31d
	dec a
	jr nz, .asm_7d30f
	jr asm_7d380

Func_7d322: ; 7d322 (1f:5322)
	call Func_7d34e
	ld a, e
	ld [$c3b0], a
	ld a, d
	ld [$c3b1], a
	ret

Func_7d32e: ; 7d32e (1f:532e)
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
.asm_7d335
	push af
	sla e
	rl d
	rl l
	rl h
	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .asm_7d349
	ld h, a
	ld a, l
	sub c
	ld l, a
	inc e
.asm_7d349
	pop af
	dec a
	jr nz, .asm_7d335
	ret

Func_7d34e: ; 7d34e (1f:534e)
	ld a, h
	or l
	jr nz, .asm_7d356
	xor a
	ld e, a
	ld d, a
	ret

.asm_7d356
	ld a, d
	xor h
	rlca
	push af
	ld a, d
	rlca
	push af
	jr nc, .asm_7d366
	ld a, d
	cpl
	ld d, a
	ld a, e
	cpl
	ld e, a
	inc de
.asm_7d366
	ld a, h
	rlca
	jr nc, .asm_7d371
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
.asm_7d371
	call Func_7d32e
	pop af
	jr nc, .asm_7d37a
	call Func_7d382
.asm_7d37a
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
asm_7d380
	pop af
	ret nc
Func_7d382: ; 7d382 (1f:5382)
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc l
	ret nz
	inc h
	ret

Func_7d38c: ; 7d38c (1f:538c)
	bit 7, h
	ret z
	jr Func_7d382

Func_7d391: ; 7d391 (1f:5391)
	ld hl, $c3b2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	rlca
	rlca
	rlca
	xor l
	rrca
	push af
	ld a, h
	xor l
	ld h, a
	ld a, [$c3b4]
	inc a
	ld [$c3b4], a
	xor l
	ld l, a
	pop af
	rl l
	rl h
	ld a, l
	ld [$c3b2], a
	ld a, h
	ld [$c3b3], a
	xor l
	ld l, a
	ld h, $0
	ret

Func_7d3bc: ; 7d3bc (1f:53bc)
	ld a, l
	ld [$c3b2], a
	ld a, h
	ld [$c3b3], a
	xor a
	ld [$c3b4], a
	ret

Func_7d3c9: ; 7d3c9 (1f:53c9)
	call Func_7d3d0
	ret c
	ld [hli], a
	jr Func_7d3c9

Func_7d3d0: ; 7d3d0 (1f:53d0)
	ld c, $0
	ld a, [de]
	call Func_7d3e7
	ret c
	ld c, a
	inc de
	ld a, [de]
	call Func_7d3e7
	ret c
	inc de
	ld b, a
	ld a, c
	rlca
	rlca
	rlca
	rlca
	or b
	ret

Func_7d3e7: ; 7d3e7 (1f:53e7)
	or $20
	sub $30
	ret c
	cp $a
	ccf
	ret nc
	sub $27
	cp $a
	ret c
	cp $10
	ccf
	ret

Func_7d3f9: ; 7d3f9 (1f:53f9)
	ld e, l
	ld d, h
.asm_7d3fb
	ld a, [de]
	inc de
	cp $20
	jr z, .asm_7d3fb
	cp $27
	jr z, asm_7d42d
	cp $24
	jr z, asm_7d425
	cp $2b
	jr z, Func_7d412
	cp $2d
	jr z, asm_7d41a
	dec de
Func_7d412:
	call Func_7d43b
	ret nc
	ld hl, $0
	ret

asm_7d41a
	call Func_7d412
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
	ret

asm_7d425
	call Func_7d45e
	ret nc
	ld hl, $0
	ret

asm_7d42d
	ld hl, $0
.asm_7d430
	ld a, [de]
	or a
	ret z
	cp $27
	ret z
	ld h, l
	ld l, a
	inc de
	jr .asm_7d430

Func_7d43b: ; 7d43b (1f:543b)
	ld hl, $0
.asm_7d43e
	ld a, [de]
	or a
	ret z
	cp $30
	ccf
	ret nc
	cp $3a
	ret nc
	inc de
	sub $30
	ld c, l
	ld b, h
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, bc
	ret c
	add hl, hl
	ret c
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	jr nc, .asm_7d43e
	ret

Func_7d45e: ; 7d45e (1f:545e)
	ld hl, $0
.asm_7d461
	ld a, [de]
	or a
	ret z
	sub $30
	ccf
	ret nc
	cp $a
	jr c, .asm_7d479
	add $30
	and $df
	sub $37
	cp $a
	ccf
	ret nc
	cp $10
	ret nc
.asm_7d479
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, hl
	ret c
	add l
	ld l, a
	inc de
	jr .asm_7d461

Func_7d486: ; 7d486 (1f:5486)
	ld [hl], $20
	inc hl
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
	ld a, $20
	bit 7, h
	jr z, asm_7d49e
Func_7d494: ; 7d494 (1f:5494)
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
	ld a, $2d
asm_7d49e
	push af
	push de
	ld bc, $d8f0
	call Func_7d4d1
	ld bc, $fc18
	call Func_7d4d1
	ld bc, hBGP
	call Func_7d4d1
	ld bc, $fff6
	call Func_7d4d1
	ld a, l
	add $30
	ld [de], a
	inc de
	xor a
	ld [de], a
	pop hl
	ld b, $4
.asm_7d4c2
	ld a, [hl]
	cp $30
	jr nz, .asm_7d4cd
	ld [hl], $20
	inc hl
	dec b
	jr nz, .asm_7d4c2
.asm_7d4cd
	dec hl
	pop af
	ld [hl], a
	ret

Func_7d4d1: ; 7d4d1 (1f:54d1)
	ld a, $2f
.asm_7d4d3
	inc a
	add hl, bc
	jr c, .asm_7d4d3
	ld [de], a
	inc de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ret

Func_7d4e0: ; 7d4e0 (1f:54e0)
	ld [hl], $20
	inc hl
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
	ld a, $20
	bit 7, b
	jr z, .asm_7d50b
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	add $1
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, $0
	adc c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, $2d
.asm_7d50b
	push af
	push de
	push bc
	push hl
	push de
	ld de, $c465
	ld bc, $3600
	call Func_7d574
	ld de, $fa0a
	ld bc, $1f00
	call Func_7d574
	ld de, $ff67
	ld bc, $6980
	call Func_7d574
	ld de, $fff0
	ld bc, $bdc0
	call Func_7d574
	ld de, $fffe
	ld bc, $7960
	call Func_7d574
	ld de, $ffff
	ld bc, $d8f0
	call Func_7d574
	pop de
	pop hl
	pop bc
	ld bc, $fc18
	call Func_7d4d1
	ld bc, hBGP
	call Func_7d4d1
	ld bc, $fff6
	call Func_7d4d1
	ld a, l
	add $30
	ld [de], a
	inc de
	xor a
	ld [de], a
	pop hl
	ld b, $9
.asm_7d565
	ld a, [hl]
	cp $30
	jr nz, .asm_7d570
	ld [hl], $20
	inc hl
	dec b
	jr nz, .asm_7d565
.asm_7d570
	dec hl
	pop af
	ld [hl], a
	ret

Func_7d574: ; 7d574 (1f:5574)
	ld a, $2f
	push af
.asm_7d577
	ld hl, sp+$1
	inc [hl]
	ld hl, sp+$6
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hli], a
	ld a, [hl]
	adc e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .asm_7d577
	pop af
	ld hl, sp+$2
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	pop de
	ld hl, sp+$4
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hli], a
	ld a, [hl]
	sbc e
	ld [hli], a
	ld a, [hl]
	sbc d
	ld [hl], a
	ret

Func_7d5a6: ; 7d5a6 (1f:55a6)
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
	push de
	ld a, h
	call Func_7d5bb
	ld a, l
	call Func_7d5bb
	xor a
	ld [de], a
	pop hl
	inc hl
	inc hl
	ret

Func_7d5bb: ; 7d5bb (1f:55bb)
	push af
	and $f0
	rrca
	rrca
	rrca
	rrca
	call Func_7d5d0
	ld [de], a
	inc de
	pop af
	and $f
	call Func_7d5d0
	ld [de], a
	inc de
	ret

Func_7d5d0: ; 7d5d0 (1f:55d0)
	cp $a
	jr nc, .asm_7d5d7
	add $30
	ret

.asm_7d5d7
	add $37
	ret

Func_7d5da: ; 7d5da (1f:55da)
	push hl
	ld a, d
	or a
	jr z, .asm_7d5e1
	ld [hl], d
	inc hl
.asm_7d5e1
	ld [hl], e
	inc hl
	ld [hl], $0
	pop hl
	ret

Func_7d5e7: ; 7d5e7 (1f:55e7)
	ld a, b
	or c
	ret z
	ld a, [hFF86]
	or a
	jr z, .asm_7d5f6
	ld a, h
	and $e0
	cp $80
	jr z, .asm_7d5fe
.asm_7d5f6
	ld [hl], e
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_7d5f6
	ret

.asm_7d5fe
	ld a, b
	or a
.asm_7d600
	push af
	call Func_7d676
	pop af
	push af
	jr nz, .asm_7d60f
	ld a, b
	cp c
	jr c, .asm_7d60f
	pop af
	jr Func_7d62b

.asm_7d60f
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call Func_7d62b
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
	jr .asm_7d600

asm_7d62a
	halt
Func_7d62b:
	ld a, [hFF88]
	ld b, a
	ld a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7d62a
	ld a, c
	srl a
	inc a
	add $13
	ld b, a
	jr .asm_7d63f

.asm_7d63e
	halt
.asm_7d63f
	ld a, [hFF89]
	add b
	jr c, .asm_7d63e
	cp $c8
	jr nc, .asm_7d63e
	push de
	push hl
	ld a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $1
	inc l
	ld [hl], b
	inc l
	ld a, $80
	sub c
	ld de, Func_7d096
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	di
	ld a, l
	ld [hFF87], a
	ld a, [hFF89]
	add b
	ld [hFF89], a
	ei
	ret

asm_7d675
	halt
Func_7d676: ; 7d676 (1f:5676)
	ld a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $13
	jr c, asm_7d675
	ld b, $80
	inc a
	add a
	ret c
	cp b
	ret nc
	ld b, a
	ret

Func_7d689: ; 7d689 (1f:5689)
	push bc
	push de
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_7efb5
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld b, $8
.asm_7d69b
	ld a, $ff
	bit 4, c
	jr nz, .asm_7d6a9
	inc a
	bit 0, c
	jr z, .asm_7d6af
	ld a, [de]
	jr .asm_7d6af

.asm_7d6a9
	bit 0, c
	jr nz, .asm_7d6af
	ld a, [de]
	cpl
.asm_7d6af
	ld [hli], a
	ld a, $ff
	bit 5, c
	jr nz, .asm_7d6be
	inc a
	bit 1, c
	jr z, .asm_7d6c4
	ld a, [de]
	jr .asm_7d6c4

.asm_7d6be
	bit 0, c
	jr nz, .asm_7d6c4
	ld a, [de]
	cpl
.asm_7d6c4
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_7d69b
	pop de
	pop bc
	ret

Func_7d6cc: ; 7d6cc (1f:56cc)
	push bc
	push hl
	push de
	ld d, c
	push de
	push af
	ld l, b
	ld h, $0
	ld d, h
	ld e, c
	predef Func_7d2e7
	ld b, l
	pop af
	call Func_7d738
	jp c, Func_7d71d
	ld [$ffa1], a
	ld e, l
	ld d, h
	ld a, [rLCDC]
	and $4
	rrca
	rrca
	inc a
	ld c, a
.asm_7d6ed
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
	ld a, c
	add a
	add a
	add a
	add [hl]
	ld [hli], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	add c
	ld [hli], a
	ld a, [hli]
	ld [de], a
	inc de
	dec [hl]
	ld a, [hl]
	or a
	jr nz, .asm_7d6ed
	push hl
	ld hl, sp+$2
	ld a, [hli]
	ld b, [hl]
	ld hl, sp+$4
	ld [hl], a
	inc hl
	ld a, [hl]
	add $8
	ld [hl], a
	pop hl
	ld a, b
	ld [hli], a
	dec [hl]
	ld a, [hl]
	or a
	jr nz, .asm_7d6ed
Func_7d71d: ; 7d71d (1f:571d)
	pop de
	pop de
	pop hl
	pop bc
	ld a, [$ffa1]
	ret

Func_7d724: ; 7d724 (1f:5724)
	call Func_7d738
	jr c, .asm_7d735
.asm_7d729
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	dec b
	jr nz, .asm_7d729
	or a
.asm_7d735
	ld a, [$ffa1]
	ret

Func_7d738: ; 7d738 (1f:5738)
	cp $ff
	jr nz, .asm_7d73e
	ld a, [$ffa1]
.asm_7d73e
	ld l, a
	add b
	cp $41
	ccf
	ret c
	push af
	ld a, l
	add a
	add a
	ld hl, $c300
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	ret

Func_7d753: ; 7d753 (1f:5753)
	push af
	push bc
	push de
	push hl
	di
	call Func_7dff6
	hlbgcoord 0, 0
	call Func_7d8fc
	xor a
	ld [$ff8e], a
	ld [$ff8f], a
	call Func_7d8e5
	call Func_7d835
	call Func_7d847
	call Func_7d8c5
	call Func_7e0d2
	ld a, [rIE]
	or $1
	ld [rIE], a
	ei
	pop hl
	pop de
	pop bc
	pop af
	push af
	and $cc
	or $3
	call Func_7d79c
	pop af
	and $20
	ret nz
	ld a, $7
Func_7d78e: ; 7d78e (1f:578e)
	or $80
	ld [hFF86], a
	ld [rLCDC], a
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

Func_7d79c: ; 7d79c (1f:579c)
	bit 7, a
	jr nz, .asm_7d7cf
	ld a, $3
	ld [$ff92], a
	ld e, $20
	call Func_7d854
	ld hl, $8800
	ld e, $80
	ld bc, $3
.asm_7d7b1
	push bc
	push de
	push hl
	ld hl, $c3e0
	push hl
	call Func_7d689
	pop de
	pop hl
	push hl
	ld bc, $10
	predef Func_015b
	pop hl
	ld bc, $10
	add hl, bc
	pop de
	pop bc
	inc e
	dec b
	jr nz, .asm_7d7b1
	ret

.asm_7d7cf
	bit 2, a
	jr nz, .asm_7d7d5
	ld h, $4
.asm_7d7d5
	push af
	push bc
	push de
	push hl
	push bc
	push de
	and $83
	or $8
	ld [$ff92], a
	ld e, $7f
	call Func_7d854
	pop de
	pop bc
	ld a, $80
	call Func_7dc58
	pop bc
	push bc
	call Func_7dd7f
	pop hl
	pop de
	pop bc
	pop af
	bit 6, a
	jr z, .asm_7d805
	push hl
	dec b
	dec c
	inc d
	inc d
	inc e
	inc e
	call Func_7dcba
	pop hl
.asm_7d805
	call Func_7d85d
	ld a, [$c3bb]
	add $80
	cp $b5
	ret nc
	ld hl, $9340
	ld e, $21
	ld bc, $3f03
.asm_7d818
	push bc
	push de
	push hl
	ld hl, $c3e0
	push hl
	call Func_7d689
	pop de
	pop hl
	push hl
	ld bc, $10
	push bc
	predef Func_015b
	pop bc
	pop hl
	add hl, bc
	pop de
	pop bc
	inc e
	dec b
	jr nz, .asm_7d818
	ret

Func_7d835: ; 7d835 (1f:5835)
	xor a
	ld [rSCY], a
	ld [rSCX], a
	ld [rWY], a
	ld [rWX], a
	ld [hSCY], a
	ld [hSCX], a
	ld [hWY], a
	ld [hWX], a
	ret

Func_7d847: ; 7d847 (1f:5847)
	ld a, $e4
	ld [hBGP], a
	ld a, $d8
	ld [hOBP0], a
	ld a, $9c
	ld [hOBP1], a
	ret

Func_7d854: ; 7d854 (1f:5854)
	hlbgcoord 0, 0
	ld bc, $800
	jp Func_7d5e7

Func_7d85d: ; 7d85d (1f:585d)
	ld a, h
	or a
	jr z, .asm_7d8a0
	cp $2
	jr z, .asm_7d8ac
	cp $4
	jr z, .asm_7d895
	ld b, h
	ld c, l
	ld hl, $9730
	call Func_7e7d1
	call Func_7e81f
	call Func_7e86d
	call Func_7e87e
	call Func_7e88f
	call Func_7e8b7
	call Func_7e8df
	call Func_7e902
	call Func_7e92a
	call Func_7e952
	call Func_7e975
	call Func_7e9a1
	jp Func_7e9cd

.asm_7d895
	ld hl, $9730
	ld de, Data_7f7b5
	ld bc, $c0
	predef Func_015b
.asm_7d8a0
	ld hl, $97f0
	ld e, $0
	ld bc, $10
	call Func_7d5e7
	ret

.asm_7d8ac
	ld hl, $97c0
	ld de, Data_7f845
	ld bc, $10
	predef Func_015b
	ld hl, $97d0
	ld bc, $0
	call Func_7e975
	call Func_7e9a1
	jr .asm_7d8a0

Func_7d8c5: ; 7d8c5 (1f:58c5)
	ld bc, $2800
Func_7d8c8: ; 7d8c8 (1f:58c8)
	ld a, c
	ld [$ffa1], a
	call Func_7d738
	xor a
.asm_7d8cf
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .asm_7d8cf
	ret

Func_7d8d7: ; 7d8d7 (1f:58d7)
	ld a, [rLCDC]
	and $80
	ret z
	ei
	call Func_7ceaf
	call Func_7d8e5
	ei
	ret

Func_7d8e5: ; 7d8e5 (1f:58e5)
	di
	ld a, [rLCDC]
	and $80
	jr z, .asm_7d8f8
.asm_7d8ec
	ld a, [rLY]
	cp $91
	jr nz, .asm_7d8ec
	ld a, [rLCDC]
	and $7f
	ld [rLCDC], a
.asm_7d8f8
	xor a
	ld [hFF86], a
	ret

Func_7d8fc: ; 7d8fc (1f:58fc)
	ld a, l
	ld [$c3c8], a
	ld a, h
	ld [$c3c9], a
	ret

Func_7d905: ; 7d905 (1f:5905)
	ld a, [$ff92]
	bit 3, a
	jr nz, .asm_7d912
	ld a, h
	ld [$ff8e], a
	ld a, l
	ld [$ff8f], a
	ret

.asm_7d912
	ld a, l
	add a
	add a
	add a
	add l
	ld l, a
Func_7d918: ; 7d918 (1f:5918)
	ld a, h
	ld [$ff90], a
	ld a, l
	ld [$ff91], a
	ret

Func_7d91f: ; 7d91f (1f:591f)
	push bc
	ld c, a
	ld a, [$ff92]
	bit 3, a
	ld a, [$ff90]
	jr nz, .asm_7d92b
	ld a, [$ff8e]
.asm_7d92b
	ld b, a
	ld a, c
	sub b
	jr c, .asm_7d93b
	jr z, .asm_7d93b
	ld b, a
.asm_7d933
	ld a, $20
	call Func_7d93e
	dec b
	jr nz, .asm_7d933
.asm_7d93b
	xor a
	pop bc
	ret

Func_7d93e: ; 7d93e (1f:593e)
	push bc
	push de
	push hl
	ld e, a
	ld a, [$ff92]
	bit 3, a
	jr nz, .asm_7d952
	call Func_7d974
	call Func_7db3d
	pop hl
	pop de
	pop bc
	ret

.asm_7d952
	call Func_7d983
	call Func_7db6f
	pop hl
	pop de
	pop bc
	ret

Func_7d95c: ; 7d95c (1f:595c)
	push bc
	push de
	push hl
	ld e, a
	ld a, [$ff92]
	bit 3, a
	jr nz, .asm_7d96d
	call Func_7d974
	pop hl
	pop de
	pop bc
	ret

.asm_7d96d
	call Func_7d983
	pop hl
	pop de
	pop bc
	ret

Func_7d974: ; 7d974 (1f:5974)
	ld a, [$ff8e]
	ld h, a
	ld a, [$ff8f]
	ld l, a
	call Func_7d9e0
	ld bc, $1
	jp Func_7d5e7

Func_7d983: ; 7d983 (1f:5983)
	ld c, a
	ld hl, $c3e0
	push hl
	call Func_7d689
	pop hl
Func_7d98c: ; 7d98c (1f:598c)
	push hl
	ld a, [$ff90]
	ld h, a
	ld a, [$ff91]
	ld l, a
	call Func_7d99d
	pop de
	ld bc, $10
	predef Func_015b
	ret

Func_7d99d: ; 7d99d (1f:599d)
	push de
	push bc
	ld a, l
	ld c, h
	push af
	ld b, $5
	ld hl, $c3bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
.asm_7d9ab
	rr c
	jr nc, .asm_7d9b7
	ld a, e
	add [hl]
	inc hl
	ld e, a
	ld a, d
	adc [hl]
	ld d, a
	dec hl
.asm_7d9b7
	inc hl
	inc hl
	dec b
	jr nz, .asm_7d9ab
	pop af
	pop bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	pop de
	ret

Func_7d9c5: ; 7d9c5 (1f:59c5)
	push af
	push bc
	push de
	push hl
	ld h, d
	ld l, e
	ld e, a
	call Func_7d9e0
	ld bc, $1
	call Func_7d5e7
	pop hl
	pop de
	pop bc
	ld a, d
	add b
	ld d, a
	ld a, e
	add c
	ld e, a
	pop af
	ret

Func_7d9e0: ; 7d9e0 (1f:59e0)
	ld a, h
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [$c3c8]
	add l
	ld l, a
	ld a, [$c3c9]
	adc h
	ld h, a
	ret

Func_7d9f9: ; 7d9f9 (1f:59f9)
	push bc
	push de
	push hl
	call Func_7da03
	pop hl
	pop de
	pop bc
	ret

Func_7da03: ; 7da03 (1f:5a03)
	ld hl, $ff92
	bit 7, [hl]
	jr z, .asm_7da19
	bit 3, [hl]
	jr z, .asm_7da1d
	ld de, Data_7da60
	ld bc, $ff90
	cp $18
	jr c, .asm_7da27
	ret

.asm_7da19
	cp $7
	jr z, Func_7da41
.asm_7da1d
	ld de, Data_7da42
	ld bc, $ff8e
	cp $10
	jr nc, Func_7da41
.asm_7da27
	sub $1
	jr c, Func_7da41
	cp $d
	push af
	add a
	add e
	ld l, a
	ld a, $0
	adc d
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	push de
	ld l, c
	ld h, b
	jr c, Func_7da41
	ld hl, $ff92
Func_7da41:
	ret

Data_7da42:
	dw Func_7db40
	dw Func_7db50
	dw Func_7db47
	dw Func_7db61
	dw Func_7dad4
	dw Func_7da8e
	dw Func_7da94
	dw Func_7db0d
	dw Func_7daea
	dw Func_7da41
	dw Func_7db39
	dw Func_7db15
	dw Func_7db45
	dw Func_7da9a
	dw Func_7da9d

Data_7da60:
	dw Func_7db72
	dw Func_7db81
	dw Func_7db7b
	dw Func_7db8a
	dw Func_7da41
	dw Func_7da8e
	dw Func_7da94
	dw Func_7db67
	dw Func_7da41
	dw Func_7da41
	dw Func_7db39
	dw Func_7dd7c
	dw Func_7db79
	dw Func_7da9a
	dw Func_7da9d
	dw Func_7daa0
	dw Func_7daa5
	dw Func_7daac
	dw Func_7dab3
	dw Func_7daba
	dw Func_7dabf
	dw Func_7dac6
	dw Func_7dacd

Func_7da8e:
	ld hl, $ff92
	res 3, [hl]
	ret

Func_7da94:
	ld hl, $ff92
	set 3, [hl]
	ret

Func_7da9a:
	res 2, [hl]
	ret

Func_7da9d:
	set 2, [hl]
	ret

Func_7daa0:
	ld a, [hl]
	and $fc
	ld [hl], a
	ret

Func_7daa5:
	ld a, [hl]
	and $fc
	or $1
	ld [hl], a
	ret

Func_7daac:
	ld a, [hl]
	and $fc
	or $2
	ld [hl], a
	ret

Func_7dab3:
	ld a, [hl]
	and $fc
	or $3
	ld [hl], a
	ret

Func_7daba:
	ld a, [hl]
	and $cf
	ld [hl], a
	ret

Func_7dabf:
	ld a, [hl]
	and $cf
	or $10
	ld [hl], a
	ret

Func_7dac6:
	ld a, [hl]
	and $cf
	or $20
	ld [hl], a
	ret

Func_7dacd:
	ld a, [hl]
	and $cf
	or $30
	ld [hl], a
	ret

Func_7dad4:
	push bc
	push de
	ld e, $20
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, $14
	sub h
	ld c, a
	ld b, $0
	call Func_7d9e0
	call Func_7d5e7
	pop de
	pop bc
	ret

Func_7daea:
	push bc
	push de
	ld e, $20
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and $3
	ld d, a
	ld a, $4
	sub d
	ld c, a
	ld b, $0
	push af
	call Func_7d9e0
	call Func_7d5e7
	pop af
	ld hl, $ff8e
	add [hl]
	ld [hl], a
	call Func_7db42
	pop de
	pop bc
	ret

Func_7db0d:
	call Func_7db50
	ld a, $20
	jp Func_7d95c

Func_7db15:
	push bc
	push de
	ld a, [$c3c8]
	ld l, a
	ld a, [$c3c9]
	ld h, a
	ld e, $20
	ld d, $12
.asm_7db23
	push de
	push hl
	ld bc, $14
	call Func_7d5e7
	pop hl
	pop de
	ld bc, $20
	add hl, bc
	dec d
	jr nz, .asm_7db23
	pop de
	pop bc
	ld hl, $ff8e
Func_7db39:
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_7db3d: ; 7db3d (1f:5b3d)
	ld hl, $ff8e
Func_7db40:
	inc [hl]
	ld a, [hl]
Func_7db42: ; 7db42 (1f:5b42)
	cp $14
	ret c
Func_7db45:
	ld [hl], $0
Func_7db47:
	inc hl
	inc [hl]
	ld a, [hl]
	cp $12
	ret c
	ld [hl], $0
	ret

Func_7db50: ; 7db50 (1f:5b50)
	ld a, [hl]
	dec [hl]
	or a
	jr nz, .asm_7db60
	ld [hl], $13
	inc hl
	ld a, [hl]
	dec [hl]
	or a
	jr nz, .asm_7db5f
	ld [hl], $11
.asm_7db5f
	dec hl
.asm_7db60
	ret

Func_7db61:
	inc hl
	ld a, [hl]
	or a
	ret z
	dec [hl]
	ret

Func_7db67:
	call Func_7db81
	ld a, $20
	jp Func_7d95c

Func_7db6f: ; 7db6f (1f:5b6f)
	ld hl, $ff90
Func_7db72:
	inc [hl]
	ld a, [$c3b9]
	dec a
	cp [hl]
	ret nc
Func_7db79:
	ld [hl], $0
Func_7db7b:
	inc hl
	ld a, [hl]
	add $9
	ld [hl], a
	ret

Func_7db81: ; 7db81 (1f:5b81)
	ld a, [hl]
	dec [hl]
	or a
	ret nz
	ld a, [$c3b9]
	dec a
	ld [hl], a
Func_7db8a:
	inc hl
	ld a, [hl]
	sub $9
	ret c
	ld [hl], a
	ret

Func_7db91: ; 7db91 (1f:5b91)
	ld a, [$ff92]
	bit 6, a
	jr nz, .asm_7dbb8
	bit 7, a
	jr z, .asm_7dbce
	bit 3, a
	jr nz, .asm_7dbbb
	ld a, e
	cp $21
	jr c, .asm_7dbb4
	cp $7b
	jr nc, .asm_7dbb4
	cp $60
	jr z, .asm_7dbb4
	jr c, .asm_7dbb0
	sub $20
.asm_7dbb0
	add $13
	or a
	ret

.asm_7dbb4
	ld a, $7f
	or a
	ret

.asm_7dbb8
	ld a, e
	or a
	ret

.asm_7dbbb
	ld a, e
	cp $80
	jr c, .asm_7dbce
	cp $a0
	jr c, .asm_7dbc8
	cp $e0
	jr c, .asm_7dbce
.asm_7dbc8
	ld a, d
	or a
	ret z
	xor a
	scf
	ret

.asm_7dbce
	ld a, e
	cp $20
	jr c, asm_7dc41
	cp $60
	jr c, asm_7dc53
	cp $80
	jr c, asm_7dc55
	cp $a1
	jr z, asm_7dc45
	cp $a2
	jr z, asm_7dc4e
	cp $a3
	jr z, asm_7dc4b
	cp $a4
	jr z, asm_7dc48
	cp $a5
	jr z, asm_7dc45
	cp $a6
	jr z, .asm_7dc2f
	cp $b0
	jr z, asm_7dc51
	jr c, .asm_7dc33
	cp $b6
	jr c, Func_7dc35
	cp $c5
	jr c, .asm_7dc27
	cp $ca
	jr c, Func_7dc35
	cp $de
	jr z, asm_7dc41
	cp $df
	jr z, asm_7dc41
	cp $cf
	jr nc, Func_7dc35
	ld a, d
	cp $de
	jr z, .asm_7dc1f
	cp $df
	jr nz, .asm_7dc2c
.asm_7dc1a
	ld a, e
	add $28
	jr .asm_7dc22

.asm_7dc1f
	ld a, e
	add $23
.asm_7dc22
	call Func_7dc35
	scf
	ret

.asm_7dc27
	ld a, d
	cp $de
	jr z, .asm_7dc1a
.asm_7dc2c
	ld a, e
	jr Func_7dc35

.asm_7dc2f
	ld a, $b0
	jr Func_7dc35

.asm_7dc33
	add $50
Func_7dc35:
	push hl
	ld hl, $ff92
	or a
	bit 2, [hl]
	pop hl
	ret z
	sub $50
	ret

asm_7dc41
	ld a, $20
	or a
	ret

asm_7dc45
	ld a, $2e
	ret

asm_7dc48
	ld a, $2c
	ret

asm_7dc4b
	ld a, $1d
	ret

asm_7dc4e
	ld a, $1b
	ret

asm_7dc51
	ld a, $2d
asm_7dc53
	or a
	ret

asm_7dc55
	and $1f
	ret

Func_7dc58: ; 7dc58 (1f:5c58)
	ld hl, $c3b5
	ld [hli], a
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld h, c
	ld l, b
	call Func_7d9e0
	ld a, [$c3b5]
	ld c, a
.asm_7dc6e
	push hl
	ld b, d
.asm_7dc70
	ld [hl], c
	inc c
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_7dc70
	pop hl
	inc hl
	dec e
	jr nz, .asm_7dc6e
	ld a, c
	ld [$c3bb], a
	ld a, [$c3b5]
	call Func_7dcad
	ld [$c3bd], a
	ld a, l
	ld [$c3bc], a
	ld a, [$c3b6]
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld b, $5
	ld hl, $c3be
.asm_7dca1
	sla e
	rl d
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .asm_7dca1
	ret

Func_7dcad: ; 7dcad (1f:5cad)
	sub $80
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, $88
	add h
	ret

Func_7dcba: ; 7dcba (1f:5cba)
	ld a, e
	cp $3
	ret c
	ld a, d
	cp $3
	ret c
	push hl
	ld h, c
	ld l, b
	call Func_7d9e0
	pop bc
	push bc
	push de
	push hl
	ld hl, $c3e0
	ld d, b
	ld c, e
	ld b, e
	ld a, $77
	call Func_7dd59
	ld [hli], a
	dec b
	dec b
	ld a, $79
	call Func_7dd59
.asm_7dcdf
	ld [hli], a
	dec b
	jr nz, .asm_7dcdf
	ld a, $78
	call Func_7dd59
	ld [hli], a
	pop hl
	push hl
	ld de, $c3e0
	predef Func_015b
	pop hl
	pop de
	pop bc
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	push bc
	ld a, $75
	call Func_7dd59
	ld b, a
	ld a, $76
	call Func_7dd59
	ld c, a
	dec d
	dec d
.asm_7dd0a
	push bc
	push hl
	push de
	push hl
	ld e, b
	push bc
	ld bc, $1
	call Func_7d5e7
	pop bc
	pop hl
	pop de
	push de
	dec e
	ld d, $0
	add hl, de
	ld e, c
	ld bc, $1
	call Func_7d5e7
	pop de
	pop hl
	pop bc
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec d
	jr nz, .asm_7dd0a
	pop bc
	push hl
	ld d, b
	ld hl, $c3e0
	ld c, e
	ld b, e
	ld a, $7a
	call Func_7dd59
	ld [hli], a
	dec b
	dec b
	ld a, $7c
	call Func_7dd59
.asm_7dd48
	ld [hli], a
	dec b
	jr nz, .asm_7dd48
	ld a, $7b
	call Func_7dd59
	ld [hli], a
	pop hl
	ld de, $c3e0
	predef Func_015b
	ret

Func_7dd59: ; 7dd59 (1f:5d59)
	push hl
	ld l, a
	ld a, [$c3bb]
	cp $7c
	jr z, .asm_7dd6b
	cp $7f
	jr nz, .asm_7dd68
.asm_7dd66
	ld l, $7f
.asm_7dd68
	ld a, l
	pop hl
	ret

.asm_7dd6b
	ld a, l
	cp $75
	jr c, .asm_7dd78
	cp $77
	jr c, .asm_7dd66
	cp $7c
	jr nc, .asm_7dd68
.asm_7dd78
	ld l, $7c
	jr .asm_7dd68

Func_7dd7c:
	ld a, [$ff92]
	ld b, a
Func_7dd7f: ; 7dd7f (1f:5d7f)
	ld a, b
	and $30
	ld e, a
	jr z, .asm_7ddc5
	dec e
	cp $30
	jr z, .asm_7ddc5
	add sp, -$10
	ld hl, sp+$0
	call Func_7ea06
	ld e, l
	ld d, h
	ld hl, sp+$0
	ld b, $e
	call Func_7e9f0
	xor a
	ld [$ff90], a
	ld [$ff91], a
	ld a, [$c3bc]
	ld l, a
	ld a, [$c3bd]
	ld h, a
	ld a, [$c3bb]
	add $80
	ld b, a
.asm_7ddad
	push bc
	push hl
	push hl
	ld hl, sp+$6
	ld e, l
	ld d, h
	pop hl
	ld bc, $10
	push bc
	predef Func_015b
	pop bc
	pop hl
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_7ddad
	add sp, $10
	ret

.asm_7ddc5
	push de
	xor a
	ld [$ff90], a
	ld [$ff91], a
	ld a, [$c3bc]
	ld e, a
	ld a, [$c3bd]
	ld d, a
	ld a, [$c3bb]
	call Func_7dcad
	ld h, a
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld l, e
	ld h, d
	pop de
	jp Func_7d5e7

Func_7dde6: ; 7dde6 (1f:5de6)
	push hl
	ld l, e
	ld h, d
	call Func_7d99d
	pop de
	sla c
.asm_7ddef
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
	ld a, [$c3be]
	add l
	ld l, a
	ld a, [$c3bf]
	adc h
	ld h, a
	pop bc
	dec b
	jr nz, .asm_7ddef
	ret

Func_7de0c: ; 7de0c (1f:5e0c)
	push hl
	ld l, e
	ld h, d
	call Func_7d99d
	ld e, l
	ld d, h
	pop hl
	sla c
.asm_7de17
	push bc
	push de
	push hl
	ld b, $0
	push bc
	predef Func_015b
	pop bc
	pop hl
	add hl, bc
	pop de
	ld a, [$c3be]
	add e
	ld e, a
	ld a, [$c3bf]
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .asm_7de17
	ret

Func_7de32: ; 7de32 (1f:5e32)
	push hl
	push af
	push bc
	push de
	ld hl, sp+$0
	call Func_7df32
.asm_7de3b
	call Func_7e0b5
	call Func_7e17c
	or a
	jr z, .asm_7de3b
	ld c, a
	and $f
	jr nz, .asm_7de84
	ld a, c
	bit 4, a
	jr nz, .asm_7de75
	bit 5, a
	jr nz, .asm_7de6c
	bit 6, a
	jr nz, .asm_7de63
	bit 7, a
	jr z, .asm_7de3b
	push bc
	call Func_7df32
	call Func_7df0f
	jr .asm_7de7c

.asm_7de63
	push bc
	call Func_7df32
	call Func_7deee
	jr .asm_7de7c

.asm_7de6c
	push bc
	call Func_7df32
	call Func_7dec7
	jr .asm_7de7c

.asm_7de75
	push bc
	call Func_7df32
	call Func_7de9a
.asm_7de7c
	push af
	call Func_7df32
	pop af
	pop bc
	jr nc, .asm_7de3b
.asm_7de84
	ld hl, sp+$7
	ld b, [hl]
	ld a, b
	and c
	jr nz, .asm_7de8f
	ld hl, sp+$0
	jr .asm_7de3b

.asm_7de8f
	ld [hl], c
	ld hl, sp+$0
	call Func_7df32
	pop de
	pop bc
	pop af
	pop hl
	ret

Func_7de9a: ; 7de9a (1f:5e9a)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	inc hl
	ld a, [hli]
	inc a
	cp [hl]
	jr nc, asm_7dec4
.asm_7deb3
	sub b
	jr z, asm_7dec4
	jr nc, .asm_7deb3
	dec hl
	inc [hl]
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, d
	add c
	ld [hl], a
asm_7dec1
	pop hl
Func_7dec2: ; 7dec2 (1f:5ec2)
	or a
	ret

asm_7dec4
	pop hl
	scf
	ret

Func_7dec7: ; 7dec7 (1f:5ec7)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	inc hl
	ld a, [hl]
	or a
	jr z, asm_7dec4
.asm_7dedf
	sub b
	jr z, asm_7dec4
	jr nc, .asm_7dedf
	dec [hl]
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, d
	sub c
	ld [hl], a
	jr asm_7dec1

Func_7deee: ; 7deee (1f:5eee)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	srl b
	srl b
	srl b
	srl b
	inc hl
	inc hl
	ld a, [hl]
	sub b
	jr c, asm_7dec4
	ld [hl], a
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, e
	sub c
	ld [hl], a
	jr asm_7dec1

Func_7df0f: ; 7df0f (1f:5f0f)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	srl b
	srl b
	srl b
	srl b
	inc hl
	inc hl
	ld a, [hli]
	add b
	cp [hl]
	jr nc, asm_7dec4
	dec hl
	ld [hl], a
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, e
	add c
	ld [hl], a
	jr asm_7dec1

Func_7df32: ; 7df32 (1f:5f32)
	push hl
	ld a, [hli]
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, d
	ld a, b
	and $f
	ld b, a
	call Func_7d99d
	sla c
	ld a, [$c3be]
	ld e, a
	ld a, [$c3bf]
	ld d, a
.asm_7df4c
	push bc
	push de
	push hl
	ld b, $0
	call Func_7df7d
	pop hl
	pop de
	pop bc
	add hl, de
	dec b
	jr nz, .asm_7df4c
	pop hl
	ret

asm_7df5d
	halt
Func_7df5e: ; 7df5e (1f:5f5e)
	ld a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $14
	jr c, asm_7df5d
	push hl
	push bc
	add $4
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $5
	call Func_7d25a
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

Func_7df7d: ; 7df7d (1f:5f7d)
	ld a, b
	or a
.asm_7df7f
	push af
	call Func_7df5e
	pop af
	push af
	jr nz, .asm_7df8e
	ld a, b
	cp c
	jr c, .asm_7df8e
	pop af
	jr Func_7dfaa

.asm_7df8e
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call Func_7dfaa
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
	jr .asm_7df7f

asm_7dfa9
	halt
Func_7dfaa:
	ld a, [hFF88]
	ld b, a
	ld a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7dfa9
	ld a, c
	srl a
	srl a
	inc a
	add c
	add $14
	ld b, a
	jr .asm_7dfc1

.asm_7dfc0
	halt
.asm_7dfc1
	ld a, [hFF89]
	add b
	jr c, .asm_7dfc0
	cp $c8
	jr nc, .asm_7dfc0
	push hl
	ld a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $4
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld d, a
	add a
	add d
	ld de, Func_7cf08
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	di
	ld a, l
	ld [hFF87], a
	ld a, [hFF89]
	add b
	ld [hFF89], a
	ei
	ret

Func_7dff6: ; 7dff6 (1f:5ff6)
	di
	ld de, Func_7e03a
	ld hl, wTimer
	ld bc, $20
	predef Func_015b
	ld a, [Bank_000f]
	ld [$c00b], a
	ld de, Func_7e05a
	ld hl, hPushOAM
	ld bc, $a
	predef Func_015b
	xor a
	ld [$ff82], a
	ld [$ff83], a
	ld [$ff84], a
	ld [$ff85], a
	ld [hFF86], a
	ld [hFF87], a
	ld [hFF88], a
	ld [hFF89], a
	ld [$ff8b], a
	ld [$ff8c], a
	ld [$ff8d], a
	ld [$ff93], a
	ld [$ff94], a
	ld [$ff95], a
	ld [$ff96], a
	cpl
	ld [hFF8A], a
	ld [$ff98], a
	ld [hFF99], a
	ret

Func_7e03a: ; Timer
	jp Timer_

Func_7e03d: ; Serial
	reti

	ds 2
Func_7e040: ; VBlank
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(VBlank2)
	ld [hROMBank], a
	ld [HuC3RomBank], a
	call VBlank2
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	reti

	ds 4

Func_7e05a: ; PushOAM
	ld a, $c3
	ld [rDMA], a
	ld a, $28
.asm_7e060
	dec a
	jr nz, .asm_7e060
	ret

Func_7e064: ; 7e064 (1f:6064)
	ld a, l
	and h
	ld l, a
	ld a, [hFF99]
	cpl
	or h
	cpl
	or l
	ld [hFF99], a
	ret

Func_7e070: ; 7e070 (1f:6070)
	push bc
	push de
	push hl
	ld a, [rLY]
	cp $90
	jr c, .asm_7e097
	ld hl, hSCY
	ld a, [hli]
	ld [rSCY], a
	ld a, [hli]
	ld [rSCX], a
	ld de, rBGP
	ld b, $5
.asm_7e087
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7e087
	ld a, [hFF99]
	bit 0, a
	call nz, hPushOAM
	call Func_7d1e4
.asm_7e097
	ld a, [hFF99]
	bit 1, a
	call nz, Func_7e0ea
	ld a, [rIE]
	bit 2, a
	call z, Timer_
	ld hl, $ff83
	inc [hl]
	ld hl, $ff84
	inc [hl]
	ld a, $1
	ld [$ff82], a
	pop hl
	pop de
	pop bc
	ret

Func_7e0b5: ; 7e0b5 (1f:60b5)
	xor a
	ld [$ff82], a
	ei
.asm_7e0b9
	halt
	ld a, [$ff82]
	dec a
	jr nz, .asm_7e0b9
	ld [$ff82], a
	ret

Func_7e0c2: ; 7e0c2 (1f:60c2)
	push bc
	ld b, a
.asm_7e0c4
	call Func_7e0b5
	call Func_7e17c
	or a
	jr nz, .asm_7e0d0
	dec b
	jr nz, .asm_7e0c4
.asm_7e0d0
	pop bc
	ret

Func_7e0d2: ; 7e0d2 (1f:60d2)
	push bc
	push de
	push hl
	xor a
	ld [$ff8c], a
	ld [$ff8d], a
	ld [$ff8b], a
	ld [hFFB6], a
	cpl
	ld [hFF8A], a
	ld [$ffb5], a
	call Func_7e0ea
	pop hl
	pop de
	pop bc
	ret

Func_7e0ea: ; 7e0ea (1f:60ea)
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a
	ld a, $10
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	or b
	ld b, a
	ld [hFF8A], a
	ld a, $30
	ld [rJOYP], a
	ld a, [$ffb5]
	xor b
	and b
	ld c, a
	ld [$ff8b], a
	ld [hFFB6], a
	ld a, b
	ld [$ffb5], a
	jr nz, .asm_7e13b
	and $f0
	ret z
	ld a, [$ff98]
	ld b, a
	ld a, [$ff84]
	cp b
	jr c, .asm_7e137
	ld a, [hFF8A]
	and $f0
	ld c, a
	ld [hFFB6], a
	ld a, $6
	jr .asm_7e142

.asm_7e137
	xor a
	ld [hFFB6], a
	ret

.asm_7e13b
	ld a, c
	and $f0
	jr z, .asm_7e147
	ld a, $18
.asm_7e142
	ld [$ff98], a
	xor a
	ld [$ff84], a
.asm_7e147
	ld [$ff85], a
	ld a, [hFF99]
	and $10
	ret z
	ld a, [$ff8d]
	ld l, a
	ld a, [$ff8c]
	ld e, a
	ld h, $f
	sub l
	and h
	cp h
	ret z
	ld d, $0
	ld hl, $c3a0
	add hl, de
	ld [hl], c
	ld a, e
	inc a
	and $f
	ld [$ff8c], a
	ret

Func_7e168: ; 7e168 (1f:6168)
	push bc
	push de
	ld a, [hFF99]
	bit 1, a
	call z, Func_7e0ea
	ld a, [hFFB6]
	ld h, a
	ld a, [$ff8b]
	ld l, a
	ld a, [hFF8A]
	pop de
	pop bc
	ret

Func_7e17c: ; 7e17c (1f:617c)
	push hl
	call Func_7e168
	bit 3, a
	jr z, .asm_7e18c
	bit 2, l
	jr z, .asm_7e18c
	di
	jp Init

.asm_7e18c
	pop hl
	ld a, [hFF99]
	and $10
	ld a, [hFFB6]
	ret z
	push de
	push hl
	ld a, [$ff8d]
	ld e, a
	ld a, [$ff8c]
	sub e
	jr z, .asm_7e1ac
	ld a, e
	inc a
	and $f
	ld [$ff8d], a
	ld d, $0
	ld hl, $c3a0
	add hl, de
	ld a, [hl]
	or a
.asm_7e1ac
	pop hl
	pop de
	ret

Func_7e1af: ; 7e1af (1f:61af)
	push af
	and $f0
	swap a
	or $50
	call Func_7e1c3
	pop af
	and $f
	or $40
	jr Func_7e1c3

Func_7e1c0: ; 7e1c0 (1f:61c0)
	call Func_7e205
Func_7e1c3: ; 7e1c3 (1f:61c3)
	push de
	push hl
	push af
	ld hl, HuC3SRamEnable
	ld [hl], $d
	ld de, HuC3RTC
.wait1
	ld a, [de]
	bit 0, a
	jr z, .wait1
	ld a, $c
.wait2
	dec a
	jr nz, .wait2
	ld [hl], $b
	pop af
	ld [de], a
	nop
	ld [hl], $d
	ld a, $fe
	ld [de], a
	nop
asm_7e1e3
	ld [hl], $0
	pop hl
	pop de
	ret

Func_7e1e8: ; 7e1e8 (1f:61e8)
	call Func_7e205
Func_7e1eb: ; 7e1eb (1f:61eb)
	call Func_7e1c3
	push de
	push hl
	ld hl, HuC3SRamEnable
	ld [hl], $d
	ld de, HuC3RTC
.wait1
	ld a, [de]
	bit 0, a
	jr z, .wait1
	ld [hl], $c
	nop
	ld a, [de]
	and $f
	jr asm_7e1e3

Func_7e205: ; 7e205 (1f:6205)
	push af
	push bc
	push hl
	ld a, [$c01c]
	or $80
	ld [$c01c], a
.asm_7e210
	call Func_7e22a
	ld a, [$c01c]
	and $7f
	jr z, .asm_7e21e
	cp $10
	jr c, .asm_7e210
.asm_7e21e
	ld [$c01c], a
	pop hl
	pop bc
	pop af
	ret

Func_7e225: ; 7e225 (1f:6225)
	ld a, [$c01c]
	rlca
	ret c
Func_7e22a: ; 7e22a (1f:622a)
	ld hl, $c01c
	ld a, [hl]
	and $7f
	ret z
	cp $10
	ret z
	cp $11
	jr z, .asm_7e282
	ret nc
	inc [hl]
	dec a
	jr z, .asm_7e28d
	dec a
	jr z, .asm_7e291
	dec a
	jr z, .asm_7e295
	dec a
	srl a
	jr nc, .asm_7e27e
	srl a
	push af
	inc a
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	ld hl, $0
	ld [hl], $d
	nop
	ld a, [HuC3RTC]
	bit 0, a
	jr z, .asm_7e284
	ld [hl], $c
	nop
	ld a, [HuC3RTC]
	and $f
	ld [hl], $0
	pop hl
	ld c, a
	pop af
	jr c, .asm_7e270
	ld [hl], c
	jr .asm_7e27a

.asm_7e270
	cp $2
	push af
	ld a, c
	swap a
	or [hl]
	ld [hl], a
	pop af
	ret z
.asm_7e27a
	ld hl, $c01c
	inc [hl]
.asm_7e27e
	ld a, $10
	jr .asm_7e299

.asm_7e282
	jr .asm_7e2ba

.asm_7e284
	pop bc
.asm_7e285
	pop af
	ld [hl], $0
	ld hl, $c01c
	dec [hl]
	ret

.asm_7e28d
	ld a, $60
	jr .asm_7e299

.asm_7e291
	ld a, $50
	jr .asm_7e299

.asm_7e295
	ld a, $40
	jr .asm_7e299

.asm_7e299
	push af
	ld hl, HuC3SRamEnable
	ld [hl], $d
	ld bc, HuC3RTC
	ld a, [bc]
	bit 0, a
	jr z, .asm_7e285
	ld a, $c
.asm_7e2a9
	dec a
	jr nz, .asm_7e2a9
	ld [hl], $b
	pop af
	ld [bc], a
	nop
	ld [hl], $d
	ld a, $fe
	ld [bc], a
	nop
	ld [hl], $0
	ret

.asm_7e2ba
	xor a
	ld [hli], a
asm_7e2bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and $f
	ld b, a
	push bc
	ld a, [hli]
	swap a
	and $f
	ld c, a
	ld a, [hl]
	swap a
	ld b, a
	and $f0
	or c
	ld c, a
	ld a, b
	and $f
	ld b, a
	push bc
	jr asm_7e2f4

Func_7e2d8: ; 7e2d8 (1f:62d8)
	call Func_7e205
	ld hl, $c01c
	ld a, [hli]
	cp $10
	jr z, asm_7e2bc
	ld a, $60
	call Func_7e1c3
	xor a
	call Func_7e1af
	call Func_7e30a
	push hl
	call Func_7e30a
	push hl
asm_7e2f4
	call Func_7e4f8
	pop bc
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ret

Func_7e2fd: ; 7e2fd (1f:62fd)
	call Func_7e205
	ld a, $60
	call Func_7e1c3
	ld a, $3
	call Func_7e1af
Func_7e30a: ; 7e30a (1f:630a)
	ld a, $10
	call Func_7e1eb
	ld l, a
	ld a, $10
	call Func_7e1eb
	swap a
	or l
	ld l, a
	ld a, $10
	call Func_7e1eb
	ld h, a
	ret

Func_7e320: ; 7e320 (1f:6320)
	push hl
	call Func_7e2fd
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld c, l
	ld b, h
	pop hl
	jr asm_7e332

Func_7e32f: ; 7e32f (1f:632f)
	call Func_7e205
asm_7e332
	push hl
	push bc
	call Func_7e50d
	xor a
	call Func_7e1af
	ld hl, sp+$2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7e358
	ld hl, sp+$0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7e358
	ld a, $31
	call Func_7e1c3
	ld a, $61
	call Func_7e1c3
	pop bc
	pop hl
	ret

Func_7e358: ; 7e358 (1f:6358)
	ld a, l
	and $f
	or $30
	call Func_7e1c3
	ld a, l
	swap a
	and $f
	or $30
	call Func_7e1c3
	ld a, h
	and $f
	or $30
	call Func_7e1c3
	ret

Func_7e373: ; 7e373 (1f:6373)
	push hl
	push de
	push bc
	or a
	jr z, .asm_7e381
	call Func_7e4f8
	pop bc
	pop de
	add hl, de
	push hl
	push bc
.asm_7e381
	ld hl, sp+$2
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de
	ld hl, $5b5
	call Func_7d32e
	ld l, e
	ld h, d
	pop de
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld hl, $16d
	call Func_7d32e
	ld a, l
	ld l, e
	ld e, a
	ld a, h
	ld h, d
	ld d, a
	ld bc, $784
	add hl, bc
	push hl
	ld hl, Data_7e401 + -1
	ld c, $2
.asm_7e3ac
	inc c
	inc hl
	ld b, e
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr nc, .asm_7e3ac
	inc b
	pop de
	ld a, c
	cp $d
	jr c, .asm_7e3c3
	sub $c
	ld c, a
	inc de
.asm_7e3c3
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	push hl
	ld hl, sp+$2
	ld a, [hli]
	ld d, [hl]
	add $6
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld hl, $7
	call Func_7d32e
	ld a, l
	pop hl
	ld [hli], a
	push hl
	ld hl, sp+$4
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $2d0
	call Func_7d32e
	ld a, e
	ld e, l
	ld d, h
	pop hl
	ld [hli], a
	push hl
	ld hl, $3c
	call Func_7d32e
	ld a, l
	pop hl
	ld [hl], e
	inc hl
	ld [hl], a
	pop de
	pop hl
	ret

Data_7e401:
	dr $7e401, $7e40d

Func_7e40d: ; 7e40d (1f:640d)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld hl, -$784
	add hl, de
	cp $3
	jr nc, .asm_7e41c
	dec hl
.asm_7e41c
	push af
	push hl
	ld de, $16d
	call Func_7d2e7
	pop de
	push hl
	ld hl, $4
	call Func_7d32e
	pop hl
	add hl, de
	ld e, l
	ld d, h
	pop af
	cp $3
	jr nc, .asm_7e437
	add $c
.asm_7e437
	rst $10
	dw Data_7e401 - @
	pop hl
	sub $3
	jr z, .asm_7e44a
	ld b, a
.asm_7e440
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_7e440
.asm_7e44a
	ld a, [hl]
	pop hl
	ret

Func_7e44d: ; 7e44d (1f:644d)
	call Func_7e40d
	ld a, [hli]
	dec a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	push de
	push hl
	push de
	call Func_7e4f8
	pop de
	ld a, e
	sub l
	ld c, a
	ld a, d
	sbc h
	ld b, a
	pop hl
	push bc
	inc hl
	ld a, [hli]
	push af
	ld a, [hli]
	push hl
	ld l, a
	ld h, $0
	ld de, $3c
	call Func_7d2e7
	pop de
	ld a, [de]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	or a
	jr z, .asm_7e483
	ld de, $2d0
	add hl, de
.asm_7e483
	pop bc
	pop de
	ret

Func_7e486: ; 7e486 (1f:6486)
	call Func_7e205
	ld a, c
	call Func_7e1af
.asm_7e48d
	ld a, $10
	call Func_7e1eb
	ld [hli], a
	dec b
	jr nz, .asm_7e48d
	ret

Func_7e497: ; 7e497 (1f:6497)
	call Func_7e205
	ld a, c
	call Func_7e1af
.asm_7e49e
	ld a, [hli]
	and $f
	or $30
	call Func_7e1c3
	dec b
	jr nz, .asm_7e49e
	ret

Func_7e4aa: ; 7e4aa (1f:64aa)
	push bc
	push de
	call Func_7e40d
	ld b, a
	dec hl
	ld a, [hl]
	cp $2
	jr nz, .asm_7e4be
	dec hl
	dec hl
	ld a, [hl]
	and $3
	jr nz, .asm_7e4be
	inc b
.asm_7e4be
	push bc
	ld a, e
	add $6
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld hl, $7
	call Func_7d34e
	pop hl
	ld l, e
	pop de
	pop bc
	ret

Func_7e4d2: ; 7e4d2 (1f:64d2)
	call Func_7e205
.asm_7e4d5
	ld a, $62
	call Func_7e1eb
	cp $1
	jr nz, .asm_7e4d5
	xor a
	call Func_7e1af
	ld b, $7
	ld c, $f
.asm_7e4e6
	ld a, $10
	call Func_7e1eb
	and c
	ld c, a
	dec b
	jr nz, .asm_7e4e6
	ld a, c
	cp $f
	ret

Func_7e4f4: ; 7e4f4 (1f:64f4)
	ld a, [Byte_0013]
	ret

Func_7e4f8: ; 7e4f8 (1f:64f8)
	ld a, [hSRAMBank]
	push af
	ld a, $0
	call Bank1F_GetSRAMBank
	xor a ; SRAM_READONLY
	ld [HuC3SRamEnable], a
	ld hl, $a000
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_7c43d

Func_7e50d: ; 7e50d (1f:650d)
	ld a, [hSRAMBank]
	push af
	ld a, $0
	call Bank1F_GetSRAMBank
	ld a, SRAM_READWRITE
	ld [HuC3SRamEnable], a
	ld hl, $a000
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_7c43d

Func_7e523: ; 7e523 (1f:6523)
	push af
	push bc
	push hl
	ld l, e
	ld h, d
	pop de
	ld a, e
	and $f
	ld [hli], a
	ld a, e
	swap a
	and $f
	ld [hli], a
	ld a, d
	and $7
	ld [hli], a
	pop de
	ld a, e
	and $f
	ld [hli], a
	ld a, e
	swap a
	and $f
	ld [hli], a
	ld a, d
	and $7
	ld [hli], a
	pop de
	ld a, d
	and $f
	ld [hli], a
	ld a, d
	swap a
	and $f
	ld [hl], a
	ld de, -$5
	add hl, de
	ret

Func_7e556: ; 7e556 (1f:6556)
	ld bc, $0
	ld a, [de]
	or a
	ret z
	inc de
	ld a, [de]
	dec de
	inc a
	ret z
	push hl
	push hl
	push de
	ld hl, $2
	add hl, de
	lb de, $ff, $00
	lb bc, $ff, $00
.asm_7e56e
	ld a, [hli]
	or a
	jr z, .asm_7e5b3
	cp $78
	jr nc, .asm_7e5b3
	cp d
	jr nc, .asm_7e57a
	ld d, a
.asm_7e57a
	cp e
	jr c, .asm_7e58f
	push hl
	ld l, a
	ld a, e
	or a
	jr z, .asm_7e58d
	ld a, d
	add a
	jr c, .asm_7e58d
	add a
	jr c, .asm_7e58d
	cp l
	jr c, .asm_7e5b2
.asm_7e58d
	ld e, l
	pop hl
.asm_7e58f
	ld a, [hli]
	or a
	jr z, .asm_7e5b3
	cp $78
	jr nc, .asm_7e5b3
	cp b
	jr nc, .asm_7e59b
	ld b, a
.asm_7e59b
	cp c
	jr c, .asm_7e5b0
	push hl
	ld l, a
	ld a, c
	or a
	jr z, .asm_7e5ae
	ld a, b
	add a
	jr c, .asm_7e5ae
	add a
	jr c, .asm_7e5ae
	cp l
	jr c, .asm_7e5b2
.asm_7e5ae
	ld c, l
	pop hl
.asm_7e5b0
	jr .asm_7e56e

.asm_7e5b2
	pop hl
.asm_7e5b3
	ld a, e
	add d
	inc a
	srl a
	ld h, a
	ld a, c
	add b
	inc a
	srl a
	ld l, a
	ld c, l
	ld b, h
	ld a, e
	srl a
	srl a
	add e
	pop hl
	cp [hl]
	ld a, $1
	jr nc, .asm_7e5dd
	ld a, d
	srl a
	srl a
	add d
	cp e
	ld a, $2
	jr nc, .asm_7e5db
	inc a
	ld c, b
	dec hl
.asm_7e5db
	inc hl
	inc hl
.asm_7e5dd
	inc hl
	pop de
	push af
.asm_7e5e0
	push de
	ld de, $800
.asm_7e5e4
	ld a, [hli]
	or a
	jr z, .asm_7e5fa
	ld b, a
	inc a
	jr z, .asm_7e5fa
	ld a, [hli]
	ld a, c
	cp b
	rr e
	dec d
	jr nz, .asm_7e5e4
	ld a, e
	pop de
	ld [de], a
	inc de
	jr .asm_7e5e0

.asm_7e5fa
	pop hl
	ld a, d
	cp $8
	jr z, .asm_7e609
.asm_7e600
	xor a
	rr e
	dec d
	jr nz, .asm_7e600
	ld a, e
	ld [hl], a
	inc hl
.asm_7e609
	pop bc
	pop de
	ld a, l
	sub e
	ld c, a
	or a
	ret

Func_7e610: ; 7e610 (1f:6610)
	di
	ld a, $10
	ld [rJOYP], a
	ld a, $e
	ld [HuC3SRamEnable], a
	xor a
	ld [HuC3RTC], a
.asm_7e61e
	ld a, [rJOYP]
	bit 1, a
	ret z
	ld a, [HuC3RTC]
	rra
	jr c, .asm_7e61e
	ld hl, $100
.asm_7e62c
	ld a, [rJOYP]
	bit 1, a
	ret z
	inc l
	jr nz, .asm_7e636
	ld h, $0
.asm_7e636
	ld a, [HuC3RTC]
	rra
	jr nc, .asm_7e62c
	dec h
	jr z, .asm_7e61e
	ret

Func_7e640: ; 7e640 (1f:6640)
	call Func_7e610
	jr z, .asm_7e6a6
	ld hl, $a000
	push bc
.asm_7e649
	xor a
	ld b, a
.asm_7e64b
	add b
	jr nc, .asm_7e64f
	sbc a
.asm_7e64f
	ld b, a
	ld c, $0
.asm_7e652
	push bc
	rl b
	pop bc
	inc b
	jr nz, .asm_7e65a
	dec b
.asm_7e65a
	ld a, [rJOYP]
	rra
	rra
	jr nc, .asm_7e6a5
	bit 0, [hl]
	jr nz, .asm_7e652
.asm_7e664
	inc c
	jr z, .asm_7e695
	bit 0, [hl]
	jr nz, .asm_7e679
	ld a, [rJOYP]
	rra
	bit 0, [hl]
	jr nz, .asm_7e679
	rra
	jr nc, .asm_7e6a5
	bit 0, [hl]
	jr z, .asm_7e664
.asm_7e679
	ld a, c
	cp $b
	jr c, .asm_7e64b
	ld a, b
	cp $7
	jr c, .asm_7e649
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	dec bc
	ld a, b
	or c
	jr z, .asm_7e6aa
	push bc
	ld bc, $200
	jr .asm_7e652

.asm_7e695
	ld a, b
	cp $7
	jr c, .asm_7e649
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc de
	pop bc
	ld l, $1
	jr .asm_7e6ac

.asm_7e6a5
	pop bc
.asm_7e6a6
	ld l, $ff
	jr .asm_7e6ac

.asm_7e6aa
	ld l, $2
.asm_7e6ac
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [HuC3RTC], a
	ld [HuC3SRamEnable], a
	ld a, $30
	ld [rJOYP], a
	ld a, l
	ei
	ret

Func_7e6bd: ; 7e6bd (1f:66bd)
	push de
	ld d, $80
	ld e, a
	push de
	ld de, $1
	push de
	push hl
	push bc
	ld bc, $0
	ld de, $100
	call Func_7e75b
	pop bc
	or a
	jr nz, .asm_7e717
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	res 0, b
	ld a, b
	cp $12
	jr nc, .asm_7e6e4
	or a
	jr nz, .asm_7e6e6
.asm_7e6e4
	ld b, $12
.asm_7e6e6
	pop de
	push de
	push bc
	push de
	call Func_7e71c
	call Func_7e71c
	ld d, h
	ld e, l
	pop hl
	push de
	ld bc, $280
	ld de, $400
	call Func_7e75b
	pop hl
	pop bc
	dec b
	dec b
	jr nz, .asm_7e6e6
	ld bc, $0
	ld de, $400
	call Func_7e75b
	ld hl, sp+$2
	ld bc, $4
	ld de, $200
	call Func_7e75b
.asm_7e717
	pop hl
	pop de
	pop de
	pop de
	ret

Func_7e71c: ; 7e71c (1f:671c)
	push bc
	push hl
	ld b, $14
.asm_7e720
	call Func_7e74b
	call Func_7e72f
	dec b
	jr nz, .asm_7e720
	pop hl
	pop bc
	ld b, $0
	add hl, bc
	ret

Func_7e72f: ; 7e72f (1f:672f)
	push hl
	push bc
	xor $80
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $8800
	add hl, bc
	ld b, $10
.asm_7e740
	call Func_7e74b
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7e740
	pop bc
	pop hl
	ret

Func_7e74b: ; 7e74b (1f:674b)
	ld a, [rSTAT]
	bit 1, a
	jr nz, Func_7e74b
	ld c, [hl]
	ld a, [rSTAT]
	bit 1, a
	jr nz, Func_7e74b
	inc hl
	ld a, c
	ret

Func_7e75b: ; 7e75b (1f:675b)
	ld a, $88
	call Func_7e7a9
	ld a, $33
	call Func_7e7a9
	ld a, e
	push af
	ld a, d
	ld de, $0
	call Func_7e7a1
	pop af
	call Func_7e7a1
	ld a, c
	call Func_7e7a1
	ld a, b
	call Func_7e7a1
.asm_7e77a
	ld a, b
	or c
	jr z, .asm_7e785
	ld a, [hli]
	call Func_7e7a1
	dec bc
	jr .asm_7e77a

.asm_7e785
	ld a, e
	call Func_7e7a9
	ld a, d
	call Func_7e7a9
	xor a
	call Func_7e7a9
	ld h, a
	xor a
	call Func_7e7a9
	ld l, a
	ld bc, $5dc
.asm_7e79a
	dec bc
	ld a, b
	or c
	jr nz, .asm_7e79a
	ld a, l
	ret

Func_7e7a1: ; 7e7a1 (1f:67a1)
	push af
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	pop af
Func_7e7a9: ; 7e7a9 (1f:67a9)
	push bc
	push hl
	ld hl, rSC
	ld [rSB], a
	ld [hl], $1
	ld [hl], $81
	ld bc, $53
.asm_7e7b7
	dec bc
	ld a, b
	and c
	cp $ff
	jr z, .asm_7e7ce
	bit 7, [hl]
	jr nz, .asm_7e7b7
	ld a, [rSB]
	ld l, a
	ld bc, $1e
.asm_7e7c8
	dec bc
	ld a, b
	or c
	jr nz, .asm_7e7c8
	ld a, l
.asm_7e7ce
	pop hl
	pop bc
	ret

Func_7e7d1: ; 7e7d1 (1f:67d1)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, $c3ea
	call Func_7ebb4
	ld hl, $c3ee
	call Func_7e9f7
	ld hl, $c3e0
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $e
	ld [hli], a
	ld a, [hl]
	or $e
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	jp Func_7e9d8

Func_7e81f: ; 7e81f (1f:681f)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, $c3ea
	call Func_7ebb4
	ld hl, $c3ee
	call Func_7e9f7
	ld hl, $c3e0
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	jp Func_7e9d8

Func_7e86d: ; 7e86d (1f:686d)
	push bc
	push hl
	ld hl, $c3e0
	ld de, $f010
	call Func_7ec88
	call Func_7e9e8
	jp Func_7e9d8

Func_7e87e: ; 7e87e (1f:687e)
	push bc
	push hl
	ld hl, $c3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	jp Func_7e9d8

Func_7e88f: ; 7e88f (1f:688f)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7e9f7
	ld hl, $c3e2
	ld de, $f010
	call Func_7ebe9
	ld hl, $c3e6
	ld de, $f010
	call Func_7ec88
	ld hl, $c3e6
	ld de, $c3e8
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e8b7: ; 7e8b7 (1f:68b7)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7e9f7
	ld hl, $c3e2
	ld de, $f808
	call Func_7edc6
	ld hl, $c3e6
	ld de, $f808
	call Func_7eea3
	ld hl, $c3e6
	ld de, $c3e8
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e8df: ; 7e8df (1f:68df)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7e9f7
	ld hl, $c3e2
	call Func_7eb61
	ld hl, $c3e6
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	jp Func_7e9d8

Func_7e902: ; 7e902 (1f:6902)
	push bc
	push hl
	ld hl, $c3ee
	call Func_7e9f7
	ld de, $f010
	ld hl, $c3ea
	call Func_7ed05
	ld hl, $c3e0
	ld de, $f010
	call Func_7ec88
	ld hl, $c3e0
	ld de, $c3e2
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e92a: ; 7e92a (1f:692a)
	push bc
	push hl
	ld hl, $c3ee
	call Func_7e9f7
	ld hl, $c3ea
	ld de, $f808
	call Func_7ef16
	ld hl, $c3e0
	ld de, $f808
	call Func_7eea3
	ld hl, $c3e0
	ld de, $c3e2
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e952: ; 7e952 (1f:6952)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, $c3ea
	call Func_7ebb4
	ld hl, $c3ee
	call Func_7e9f7
	jp Func_7e9d8

Func_7e975: ; 7e975 (1f:6975)
	push bc
	push hl
	ld hl, $c3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	ld hl, $c3e4
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	jp Func_7e9d8

Func_7e9a1: ; 7e9a1 (1f:69a1)
	push bc
	push hl
	ld hl, $c3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	ld hl, $c3e6
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	jp Func_7e9d8

Func_7e9cd: ; 7e9cd (1f:69cd)
	push bc
	push hl
	ld hl, $c3e0
	call Func_7e9f7
	call Func_7e9e8
Func_7e9d8: ; 7e9d8 (1f:69d8)
	pop hl
	ld de, $c3e0
	ld bc, $10
	push bc
	push hl
	predef Func_015b
	pop hl
	pop bc
	add hl, bc
	pop bc
	ret

Func_7e9e8: ; 7e9e8 (1f:69e8)
	ld hl, $c3e0
	ld de, $c3e2
	ld b, $e
Func_7e9f0: ; 7e9f0 (1f:69f0)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, Func_7e9f0
	ret

Func_7e9f7: ; 7e9f7 (1f:69f7)
	xor a
	bit 6, b
	jr z, .asm_7e9fd
	dec a
.asm_7e9fd
	ld [hli], a
	xor a
	bit 7, b
	jr z, .asm_7ea04
	dec a
.asm_7ea04
	ld [hli], a
	ret

Func_7ea06: ; 7ea06 (1f:6a06)
	xor a
	bit 4, b
	jr z, .asm_7ea0c
	dec a
.asm_7ea0c
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7ea13
	dec a
.asm_7ea13
	ld [hli], a
	ret

Func_7ea15: ; 7ea15 (1f:6a15)
	ld a, h
	cp d
	jr c, .asm_7ea1b
	ld h, d
	ld d, a
.asm_7ea1b
	ld a, l
	cp e
	jr c, .asm_7ea21
	ld l, e
	ld e, a
.asm_7ea21
	push bc
	ld c, $2
	bit 2, b
	jr nz, .asm_7ea2e
	dec c
	bit 1, b
	jr nz, .asm_7ea2e
	dec c
.asm_7ea2e
	ld a, d
	sub h
	cp $8
	jr c, .asm_7ea6a
	ld a, h
	and $7
	cp c
	jr c, .asm_7ea6a
	ld a, l
	cp c
	jr c, .asm_7ea6a
	ld a, [$c3b9]
	add a
	add a
	add a
	dec a
	ld c, a
	ld a, [$c3ba]
	add a
	add a
	add a
	dec a
	bit 1, b
	jr z, .asm_7ea59
	dec c
	dec a
	bit 2, b
	jr z, .asm_7ea59
	dec c
	dec a
.asm_7ea59
	cp e
	jr c, .asm_7ea6a
	ld a, c
	cp d
	jr c, .asm_7ea6a
	and $7
	inc a
	ld c, a
	ld a, d
	and $7
	cp c
	jr c, .asm_7ea6c
.asm_7ea6a
	pop bc
	ret

.asm_7ea6c
	pop bc
	push de
	push hl
	ld a, e
	inc a
	sub l
	ld e, a
	srl d
	srl d
	srl d
	srl h
	srl h
	srl h
	ld a, d
	inc a
	sub h
	bit 1, b
	jr z, .asm_7ea88
	sub $2
.asm_7ea88
	ld d, a
	call Func_7d99d
	push hl
	push de
	push bc
	bit 1, b
	call nz, Func_7eaca
	pop bc
	pop de
	push de
	push bc
	ld a, d
	or a
	jr z, .asm_7eabd
	call Func_7eb86
	push bc
	ld de, $c400
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld hl, sp+$5
	ld h, [hl]
	pop af
	ld l, a
.asm_7eaae
	push hl
	push bc
	push de
	ld a, l
	ld hl, sp+$a
	call Func_7eb09
	pop de
	pop bc
	pop hl
	dec h
	jr nz, .asm_7eaae
.asm_7eabd
	pop bc
	push bc
	bit 1, b
	call nz, Func_7eb44
	pop bc
	pop de
	pop hl
	pop hl
	pop de
	ret

Func_7eaca: ; 7eaca (1f:6aca)
	ld hl, sp+$9
	call Func_7ebd9
	ld hl, $c400
	call Func_7ebe9
	push hl
	ld hl, sp+$6
	ld a, [hl]
	pop hl
.asm_7eada
	push af
	call Func_7ec88
	pop af
	dec a
	jr nz, .asm_7eada
	call Func_7ed05
asm_7eae5
	push bc
	ld de, $c400
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	pop af
	ld hl, sp+$6
asm_7eaf2
	push hl
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	call Func_7eb37
asm_7eafb
	predef Func_015b
	pop hl
	ld a, [$c3be]
	add [hl]
	ld [hli], a
	ld a, [$c3bf]
	adc [hl]
	ld [hl], a
	ret

Func_7eb09: ; 7eb09 (1f:6b09)
	bit 0, a
	jr nz, asm_7eaf2
	push hl
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push hl
	call Func_7eb37
	pop bc
	push bc
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	push bc
	push de
	predef Func_015b
	pop hl
	pop bc
	add hl, bc
	pop de
	ld a, e
	add [hl]
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld d, a
	inc hl
	ld a, d
	ld d, h
	ld h, a
	ld a, e
	ld e, l
	ld l, a
	jr asm_7eafb

Func_7eb37: ; 7eb37 (1f:6b37)
	bit 1, a
	jr z, .asm_7eb3d
	dec hl
	dec hl
.asm_7eb3d
	bit 2, a
	jr z, .asm_7eb43
	dec hl
	dec hl
.asm_7eb43
	ret

Func_7eb44: ; 7eb44 (1f:6b44)
	ld hl, sp+$b
	call Func_7ebd9
	ld hl, $c400
	call Func_7edc6
	push hl
	ld hl, sp+$6
	ld a, [hl]
	pop hl
.asm_7eb54
	push af
	call Func_7eea3
	pop af
	dec a
	jr nz, .asm_7eb54
	call Func_7ef16
	jr asm_7eae5

Func_7eb61: ; 7eb61 (1f:6b61)
	bit 2, b
	jr z, .asm_7eb73
	xor a
	bit 2, c
	jr z, .asm_7eb6b
	dec a
.asm_7eb6b
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7eb72
	dec a
.asm_7eb72
	ld [hli], a
.asm_7eb73
	bit 1, b
	jr z, .asm_7eb85
	xor a
	bit 0, c
	jr z, .asm_7eb7d
	dec a
.asm_7eb7d
	ld [hli], a
	xor a
	bit 1, c
	jr z, .asm_7eb84
	dec a
.asm_7eb84
	ld [hli], a
.asm_7eb85
	ret

Func_7eb86: ; 7eb86 (1f:6b86)
	ld hl, $c400
	call Func_7eb61
	bit 0, b
	jr z, .asm_7ebaa
	ld d, b
	push bc
	ld c, $0
	bit 4, d
	jr z, .asm_7eb99
	dec c
.asm_7eb99
	ld b, $0
	bit 5, d
	jr z, .asm_7eba0
	dec b
.asm_7eba0
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	dec e
	jr nz, .asm_7eba0
	pop bc
	jr Func_7ebb4

.asm_7ebaa
	ld d, $0
	sla e
	rl d
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
Func_7ebb4: ; 7ebb4 (1f:6bb4)
	bit 1, b
	jr z, .asm_7ebc6
	xor a
	bit 4, c
	jr z, .asm_7ebbe
	dec a
.asm_7ebbe
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ebc5
	dec a
.asm_7ebc5
	ld [hli], a
.asm_7ebc6
	bit 2, b
	jr z, .asm_7ebd8
	xor a
	bit 6, c
	jr z, .asm_7ebd0
	dec a
.asm_7ebd0
	ld [hli], a
	xor a
	bit 7, c
	jr z, .asm_7ebd7
	dec a
.asm_7ebd7
	ld [hli], a
.asm_7ebd8
	ret

Func_7ebd9: ; 7ebd9 (1f:6bd9)
	ld a, [hl]
	ld de, $8080
	and $7
	ret z
.asm_7ebe0
	scf
	rr d
	srl e
	dec a
	jr nz, .asm_7ebe0
	ret

Func_7ebe9: ; 7ebe9 (1f:6be9)
	bit 2, b
	jr z, .asm_7ec25
	xor a
	bit 2, c
	jr z, .asm_7ebfa
	ld a, d
	sla a
	sla a
	sla a
	cpl
.asm_7ebfa
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ec07
	ld a, d
	sla a
	sla a
	sla a
.asm_7ec07
	or [hl]
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7ec16
	ld a, d
	sla a
	sla a
	sla a
	cpl
.asm_7ec16
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ec23
	ld a, d
	sla a
	sla a
	sla a
.asm_7ec23
	or [hl]
	ld [hli], a
.asm_7ec25
	bit 1, b
	jr z, .asm_7ec87
	ld a, $ff
	bit 0, c
	jr z, .asm_7ec34
	ld a, d
	sla a
	sla a
.asm_7ec34
	cpl
	ld [hl], a
	bit 2, b
	jr z, .asm_7ec44
	xor a
	bit 2, c
	jr z, .asm_7ec44
	ld a, e
	sla a
	sla a
.asm_7ec44
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ec56
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ec56
	sla a
.asm_7ec56
	or [hl]
	ld [hli], a
	ld a, $ff
	bit 1, c
	jr z, .asm_7ec63
	ld a, d
	sla a
	sla a
.asm_7ec63
	cpl
	ld [hl], a
	bit 2, b
	jr z, .asm_7ec73
	xor a
	bit 3, c
	jr z, .asm_7ec73
	ld a, e
	sla a
	sla a
.asm_7ec73
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ec85
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ec85
	sla a
.asm_7ec85
	or [hl]
	ld [hli], a
.asm_7ec87
	ret

Func_7ec88: ; 7ec88 (1f:6c88)
	xor a
	bit 4, b
	jr z, .asm_7ec91
	ld a, d
	sla a
	cpl
.asm_7ec91
	ld [hl], a
	ld a, d
	sla a
	bit 1, b
	jr z, .asm_7ecbf
	xor a
	bit 0, c
	jr z, .asm_7eca1
	ld a, e
	sla a
.asm_7eca1
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ecbf
	xor a
	bit 2, c
	jr z, .asm_7ecb6
	ld a, e
	sla a
	sla a
.asm_7ecb6
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	sla a
.asm_7ecbf
	bit 6, b
	jr nz, .asm_7ecc4
	xor a
.asm_7ecc4
	or [hl]
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7eccf
	ld a, d
	sla a
	cpl
.asm_7eccf
	ld [hl], a
	ld a, d
	srl a
	bit 1, b
	jr z, .asm_7ecfd
	xor a
	bit 1, c
	jr z, .asm_7ecdf
	ld a, e
	sla a
.asm_7ecdf
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ecfd
	xor a
	bit 3, c
	jr z, .asm_7ecf4
	ld a, e
	sla a
	sla a
.asm_7ecf4
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	sla a
.asm_7ecfd
	bit 7, b
	jr nz, .asm_7ed02
	xor a
.asm_7ed02
	or [hl]
	ld [hli], a
	ret

Func_7ed05: ; 7ed05 (1f:6d05)
	bit 1, b
	jr z, .asm_7ed65
	xor a
	bit 4, c
	jr z, .asm_7ed14
	ld a, d
	sla a
	sla a
	cpl
.asm_7ed14
	ld [hl], a
	bit 2, b
	jr z, .asm_7ed25
	xor a
	bit 2, c
	jr z, .asm_7ed23
	ld a, e
	sla a
	sla a
.asm_7ed23
	or [hl]
	ld [hl], a
.asm_7ed25
	xor a
	bit 6, b
	jr z, .asm_7ed35
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ed35
	sla a
.asm_7ed35
	or [hl]
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ed42
	ld a, d
	sla a
	sla a
	cpl
.asm_7ed42
	ld [hl], a
	bit 2, b
	jr z, .asm_7ed53
	xor a
	bit 3, c
	jr z, .asm_7ed51
	ld a, e
	sla a
	sla a
.asm_7ed51
	or [hl]
	ld [hl], a
.asm_7ed53
	xor a
	bit 7, b
	jr z, .asm_7ed63
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ed63
	sla a
.asm_7ed63
	or [hl]
	ld [hli], a
.asm_7ed65
	bit 2, b
	jr z, .asm_7edc5
	ld a, $ff
	bit 6, c
	jr z, .asm_7ed72
	ld a, d
	sla a
.asm_7ed72
	cpl
	ld [hl], a
	xor a
	bit 3, b
	jr z, .asm_7ed7d
	bit 6, c
	jr .asm_7ed7f

.asm_7ed7d
	bit 6, b
.asm_7ed7f
	jr z, .asm_7ed87
	ld a, e
	sla a
	or e
	sla a
.asm_7ed87
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ed95
	ld a, d
	sla a
	sla a
	sla a
.asm_7ed95
	or [hl]
	ld [hli], a
	ld a, $ff
	bit 7, c
	jr z, .asm_7eda0
	ld a, d
	sla a
.asm_7eda0
	cpl
	ld [hl], a
	xor a
	bit 3, b
	jr z, .asm_7edab
	bit 7, c
	jr .asm_7edad

.asm_7edab
	bit 7, b
.asm_7edad
	jr z, .asm_7edb5
	ld a, e
	sla a
	or e
	sla a
.asm_7edb5
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7edc3
	ld a, d
	sla a
	sla a
	sla a
.asm_7edc3
	or [hl]
	ld [hli], a
.asm_7edc5
	ret

Func_7edc6: ; 7edc6 (1f:6dc6)
	bit 2, b
	jr z, .asm_7ee24
	xor a
	bit 2, c
	jr z, .asm_7edd3
	ld a, d
	scf
	rr a
.asm_7edd3
	ld [hl], a
	xor a
	bit 3, b
	jr nz, .asm_7eddd
	bit 6, b
	jr .asm_7eddf

.asm_7eddd
	bit 6, c
.asm_7eddf
	jr z, .asm_7ede6
	ld a, e
	srl a
	srl a
.asm_7ede6
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7edf5
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7edf5
	or [hl]
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7ee00
	ld a, d
	scf
	rr a
.asm_7ee00
	ld [hl], a
	xor a
	bit 3, b
	jr nz, .asm_7ee0a
	bit 7, b
	jr .asm_7ee0c

.asm_7ee0a
	bit 7, c
.asm_7ee0c
	jr z, .asm_7ee13
	ld a, e
	srl a
	srl a
.asm_7ee13
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ee22
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7ee22
	or [hl]
	ld [hli], a
.asm_7ee24
	bit 1, b
	jr z, .asm_7eea2
	xor a
	bit 0, c
	jr z, .asm_7ee2e
	ld a, d
.asm_7ee2e
	ld [hl], a
	xor a
	bit 4, c
	jr z, .asm_7ee37
	ld a, e
	srl a
.asm_7ee37
	or [hl]
	ld [hl], a
	bit 2, b
	jr z, .asm_7ee4f
	xor a
	bit 3, b
	jr nz, .asm_7ee46
	bit 6, b
	jr .asm_7ee48

.asm_7ee46
	bit 6, c
.asm_7ee48
	jr z, .asm_7ee4f
	ld a, e
	srl a
	srl a
.asm_7ee4f
	or [hl]
	ld [hl], a
	ld a, $ff
	bit 6, b
	jr z, .asm_7ee62
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ee62
	scf
	rr a
.asm_7ee62
	cpl
	or [hl]
	ld [hli], a
	xor a
	bit 1, c
	jr z, .asm_7ee6b
	ld a, d
.asm_7ee6b
	ld [hl], a
	xor a
	bit 5, c
	jr z, .asm_7ee74
	ld a, e
	srl a
.asm_7ee74
	or [hl]
	ld [hl], a
	bit 2, b
	jr z, .asm_7ee8c
	xor a
	bit 3, b
	jr nz, .asm_7ee83
	bit 7, b
	jr .asm_7ee85

.asm_7ee83
	bit 7, c
.asm_7ee85
	jr z, .asm_7ee8c
	ld a, e
	srl a
	srl a
.asm_7ee8c
	or [hl]
	ld [hl], a
	ld a, $ff
	bit 7, b
	jr z, .asm_7ee9f
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ee9f
	scf
	rr a
.asm_7ee9f
	cpl
	or [hl]
	ld [hli], a
.asm_7eea2
	ret

Func_7eea3: ; 7eea3 (1f:6ea3)
	xor a
	bit 4, b
	jr z, .asm_7eea9
	ld a, d
.asm_7eea9
	ld [hl], a
	ld a, d
	bit 1, b
	jr z, .asm_7eed4
	xor a
	bit 4, c
	jr z, .asm_7eeb7
	ld a, e
	srl a
.asm_7eeb7
	or [hl]
	ld [hl], a
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7eed4
	xor a
	bit 6, c
	jr z, .asm_7eecb
	ld a, e
	srl a
	srl a
.asm_7eecb
	or [hl]
	ld [hl], a
	ld a, d
	srl a
	srl a
	or $c0
.asm_7eed4
	cpl
	bit 6, b
	jr nz, .asm_7eeda
	xor a
.asm_7eeda
	or [hl]
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7eee2
	ld a, d
.asm_7eee2
	ld [hl], a
	ld a, d
	bit 1, b
	jr z, .asm_7ef0d
	xor a
	bit 5, c
	jr z, .asm_7eef0
	ld a, e
	srl a
.asm_7eef0
	or [hl]
	ld [hl], a
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef0d
	xor a
	bit 7, c
	jr z, .asm_7ef04
	ld a, e
	srl a
	srl a
.asm_7ef04
	or [hl]
	ld [hl], a
	ld a, d
	srl a
	srl a
	or $c0
.asm_7ef0d
	cpl
	bit 7, b
	jr nz, .asm_7ef13
	xor a
.asm_7ef13
	or [hl]
	ld [hli], a
	ret

Func_7ef16: ; 7ef16 (1f:6f16)
	bit 1, b
	jr z, .asm_7ef78
	xor a
	bit 4, c
	jr z, .asm_7ef23
	ld a, d
	scf
	rr a
.asm_7ef23
	ld [hl], a
	xor a
	bit 2, b
	jr z, .asm_7ef35
	xor a
	bit 6, c
	jr z, .asm_7ef33
	ld a, e
	srl a
	srl a
.asm_7ef33
	or [hl]
	ld [hl], a
.asm_7ef35
	ld a, $ff
	bit 6, b
	jr z, .asm_7ef46
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef46
	scf
	rr a
.asm_7ef46
	cpl
	or [hl]
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ef52
	ld a, d
	scf
	rr a
.asm_7ef52
	ld [hl], a
	xor a
	bit 2, b
	jr z, .asm_7ef64
	xor a
	bit 7, c
	jr z, .asm_7ef62
	ld a, e
	srl a
	srl a
.asm_7ef62
	or [hl]
	ld [hl], a
.asm_7ef64
	ld a, $ff
	bit 7, b
	jr z, .asm_7ef75
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef75
	scf
	rr a
.asm_7ef75
	cpl
	or [hl]
	ld [hli], a
.asm_7ef78
	bit 2, b
	jr z, .asm_7efb4
	xor a
	bit 6, c
	jr z, .asm_7ef88
	ld a, d
	srl a
	srl a
	or $c0
.asm_7ef88
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ef96
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7ef96
	or [hl]
	ld [hli], a
	xor a
	bit 7, c
	jr z, .asm_7efa4
	ld a, d
	srl a
	srl a
	or $c0
.asm_7efa4
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7efb2
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7efb2
	or [hl]
	ld [hli], a
.asm_7efb4
	ret

Data_7efb5:
	dr $7efb5, $7f7b5

Data_7f7b5: ; 7f7b5
	dr $7f7b5, $7f845

Data_7f845: ; 7f845
	dr $7f845, $7f875

Data_7f875: ; 7f875
	dr $7f875, $80000

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
Data_e8000:
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

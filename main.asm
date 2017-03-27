INCLUDE "includes.asm"
INCLUDE "charmap.asm"

SECTION "rst $00", HOME [$00]
Serial_:
	jp Func_0388

SECTION "rst $08", HOME [$08]
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
	db $01
Byte_0014:
	db $08
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
	ld [HuC3SRamMode], a
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

CopyPredef:
	ld a, b
	or c
	ret z
	ld a, [hFF86]
	or a
	jr z, .copy
	ld a, h
	and $e0
	cp $80
	jr z, .to_vram
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

.to_vram
	ld a, b
	or a
.loop1
	push af
	predef Func_7cdf6
	pop af
	push af
	jr nz, .okay
	ld a, b
	cp c
	jr nc, .next
.okay
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call .HBlankCopy
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
	jr .loop1

.next
	pop af
.HBlankCopy: ; 1a6 (0:01a6)
	predef Func_7ce36
.hblank_copy_loop
	ld a, [de]
	inc de
	ld [hl], a
	inc l
	dec c
	jr nz, .hblank_copy_loop
	di
	ld a, l
	ld [hFF87], a
	ld a, [hFF89]
	add b
	ld [hFF89], a
	ei
NullPredef:
	ret

SECTION "01e0", HOME [$1e0]
Pointers_01e0:
	dw Func_00e9
	dw Func_0150
	dw CopyPredef
	dw Func_7af00
	dw Func_7af30
	dw Func_7af39
	dw AnonJumpRelativeTable
	dw AnonJumpRelativeTableLookup
	dw AnonJumpRelativeTableLookup2
	dw Func_02fd
	dw NullPredef
	dw NullPredef
	dw NullPredef
	dw NullPredef
	dw NullPredef
	dw NullPredef
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
	call BankSwitch
	pop af
	push af
	call Func_63141
	di
	pop af
	ld [wSystemType], a
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch
	ld a, $3
	call GetSRAMBank
	call Func_4064
	ld a, BANK(Func_fe102)
	call BankSwitch
	call Func_fe102
	ld a, [wSystemType]
	ld [hSystemType], a
Func_0388: ; 388 (0:0388)
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch
	ld a, $3
	call GetSRAMBank
	call Func_4064
	call Func_1a90
	ld a, BANK(Func_4000)
	call BankSwitch
	jp Func_4000

Func_03a4: ; 3a4 (0:03a4)
	ld a, [hSystemType]
	ld [wSystemType], a
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch
	ld a, $3
	call GetSRAMBank
	call Func_4064
	call Func_1a90
	ld a, $ff
	ld [wc213], a
	ld a, BANK(Func_4000)
	call BankSwitch
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
	ld [HuC3SRamMode], a
	ret

GetSRAMBank_ReadOnly:
	set 7, a
	ld [hSRAMBank], a
	res 7, a
	ld [HuC3SRamBank], a
	xor a ; SRAM_READONLY
	ld [HuC3SRamMode], a
	ret

BankSwitch:
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

FarCall:
; call [c212]:[c21b]
; preserves registers
; does not preserve flags
; stack overflow check
	push hl
	push bc
	ld hl, sp+$0
	ld bc, $10000 - wStackBottom
	add hl, bc
	bit 7, h
	jr z, .stack_okay
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
	jp Crash

.stack_okay
	pop bc
	pop hl
	ld [wFarCallSavedA], a
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	ld a, l
	ld [wFarCallSavedHL], a
	ld a, h
	ld [wFarCallSavedHL + 1], a
	ld hl, .Return
	push hl
	ld a, [wFarCallDestAddr]
	ld l, a
	ld a, [wFarCallDestAddr + 1]
	ld h, a
	push hl
	ld a, [wFarCallSavedHL + 1]
	ld h, a
	ld a, [wFarCallSavedHL]
	ld l, a
	ld a, [wFarCallSavedA]
	ret

.Return:
	ld [wFarCallSavedA], a
	pop af
	call BankSwitch
	ld a, [wFarCallSavedA]
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
	ld a, [wTextBlinkerFrameCounter]
	ld c, a
.loop
	halt
	nop
	ld a, [wJoyHeld]
	ld b, a
	ld a, [wTextBlinkerFrameCounter]
	cp c
	jr z, .loop
	ld a, b
	push af
	call Func_1b28
	pop af
	pop bc
	ret

CopyFromDEtoHL:
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
	Coorda 16, 3, wAttrMap
	ld a, $ff
	Coorda 17, 3, wAttrMap
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
	aCoord 16, 3, wAttrMap
	ld b, a
	aCoord 17, 3, wAttrMap
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
	aCoord 16, 3, wAttrMap
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
	aCoord 17, 3, wAttrMap
	and h
	jr z, .loop
	ld l, c
	ld h, $0
	predef AnonJumpRelativeTable
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
	db " きゃらはﾞんはﾞーしﾞょん 5けﾞーむ", $0d, $01, $00
	db " きすもん&はﾞけ", $0f, "ちゅ", $0e, "りれー", $0f, "ほか4", $0e, $0d, $01, $00
	db " 15はﾟすﾞる&きゃのん", $0f, " ほか4こ", $0e, $0d, $01, $00
	db " はﾞいなりーらんとﾞ", $0f, "&BJほか2こ", $0e, $0d, $01, $00
	db " みにけﾞーむ", $0f, "かﾞそﾞういれかえ", $0e, "てﾞーた", $0d, $01, $00
	db " GB KISS TOOLS", $0d, $01, $00
	db "KISSMON "
	db "CANNON  "
	db "BINARY  "
	db "GAMEDATA"
	db "KISSTOOL"

Data_065e:
	db "  めにゅー", $0f, "を せんたくして", $0e, $00
	db " ", $00
	db $0f, "START/Aを おしてくたﾞさい", $0e, $00
	db $00

Data_0686:
	db "--------", $00

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
	ld hl, $607
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
	hlcoord 18, 3, wAttrMap
	ld e, $20
	ld bc, $8
	predef Func_7d5e7
	ld de, $8001
	ld b, $8
	hlcoord 18, 3, wAttrMap
	ld c, $0
	predef Func_7b93a
	jp c, Func_0519
	ld hl, $636
	ld bc, $502
.asm_0705
	push bc
	push hl
	decoord 18, 3, wAttrMap
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
	aCoord 16, 3, wAttrMap
	cp c
	ld a, c
	jp nc, Func_072b
	Coorda 16, 3, wAttrMap
Func_072b: ; 72b (0:072b)
	call BitIndexToMask
	ld d, a
	aCoord 17, 3, wAttrMap
	or d
	Coorda 17, 3, wAttrMap
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
	db " ", $00
	db "はﾟすわーとﾞ", $0f, "を にゅうりょくして ", $0e, $00
	db $0f, "STARTを おしてくたﾞさい  ", $0e, $00
	db $00

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
	hlcoord 12, 17
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
	hlcoord 12, 17
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	hlcoord 16, 17
	ld bc, $28
	predef CopyPredef
	pop af
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld de, $304
	predef Func_7bdec
	ld b, $7
	ld c, $87
	decoord 16, 17
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
	hlcoord 4, 2, wAttrMap
	ld bc, $20
	predef CopyPredef
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
	hlcoord 8, 2, wAttrMap
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
	hlcoord 16, 17
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
	Coorda 8, 4, wAttrMap
	ld a, [hROMBank]
	Coorda 7, 4, wAttrMap
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
	aCoord 8, 4, wAttrMap
	and $1
	call nz, Func_0c51
	pop de
	pop bc
	ret c
	ld a, [hROMBank]
	push af
	ld a, b
	Coorda 6, 4, wAttrMap
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
	aCoord 12, 4, wAttrMap
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
	hlcoord 12, 17
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
	hlcoord 12, 17
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

Func_09c2: ; 9c2 (0:09c2)
	xor a
	Coorda 12, 4, wAttrMap
	aCoord 8, 4, wAttrMap
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
	predef CopyPredef
	pop bc
	push bc
	ld de, $c900
	hlcoord 16, 4
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
	predef CopyPredef
	pop de
	pop bc
	hlcoord 16, 4
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
	hlcoord 6, 5
	ld [hl], a
	hlcoord 16, 4
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
	hlcoord 16, 4
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
	Coorda 12, 4, wAttrMap
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
	predef CopyPredef
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
	Coorda 9, 4, wAttrMap
	ld e, l
	ld d, h
	push bc
	ld hl, $c400
	ld b, $0
	push hl
	predef CopyPredef
	pop de
	pop bc
	hlcoord 8, 12, wAttrMap
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
	aCoord 10, 4, wAttrMap
	ld c, a
	ld a, $ff
	hlcoord 18, 12, wAttrMap
	ld [hl], a
	push de
	push bc
	ld a, $5
	call Func_0cc1
	pop bc
	pop de
	push de
	hlcoord 8, 12, wAttrMap
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
	aCoord 11, 4, wAttrMap
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
	hlcoord 8, 12, wAttrMap
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
	Coorda 12, 4, wAttrMap
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
	hlcoord 17, 12, wAttrMap
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
	aCoord 9, 4, wAttrMap
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
	Coorda 11, 4, wAttrMap
	ld a, [$c80f]
	Coorda 10, 4, wAttrMap
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
	hlcoord 8, 12, wAttrMap
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
INCLUDE "home/vblank.asm"

TimerInterrupt:
	push af
	push hl
	ld a, $0
	ld [rTAC], a
	ld a, -68
	ld [rTMA], a
	ld a, $4
	ld [rTAC], a
	ld hl, rIE
	res 2, [hl]
	ei
	push bc
	push de
	ld a, [wTimerCounter]
	inc a
	ld [wTimerCounter], a
	jr nz, .increment_frame_counter
	ld a, [wTimerCounter + 1]
	inc a
	ld [wTimerCounter + 1], a
.increment_frame_counter
	call Func_1a94
	call Func_2a49
	ld a, [wc208]
	or a
	jr z, .set_wc208
	inc a
	and $1f
	jr nz, .set_wc208
	ld [wJoyLast], a
	ld a, $18
.set_wc208
	ld [wc208], a
	ld a, [wc2e8]
	or a
	jr z, .check_stack_overflow
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank
	ld a, [hROMBank]
	push af
	ld a, BANK(Func_62ce4)
	call BankSwitch
	call Func_62ce4
	pop af
	call BankSwitch
	pop af
	call GetSRAMBank
.check_stack_overflow
	ld hl, sp+$0
	ld bc, $10000 - wStackBottom
	add hl, bc
	bit 7, h
	jr z, .no_stack_overflow
	ld hl, sp+$0
	ld a, [wFarCallDestAddr]
	ld e, a
	ld a, [wFarCallDestAddr + 1]
	ld d, a
	ld a, [wFarCallDestBank]
	ld c, a
	ld b, $0
	di
	ld sp, wStackTop
	jp Crash

.no_stack_overflow
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

LCDInterrupt:
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

HandleVideoTransferRequest: ; 11ce (0:11ce)
	push bc
	push de
	xor a
	ld [$c236], a
	ld c, $4
	ld hl, wVideoTransferQueue
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

VBlankReadJoypad: ; 120e (0:120e)
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

Decompress_ReadCBits: ; 124e (0:124e)
	push de
	ld e, $0
.loop
	ld a, [hl]
	and b
	jr z, .no_carry
	scf
.no_carry
	rl e
	rrc b
	jr nc, .no_carry2
	inc hl
.no_carry2
	dec c
	jr nz, .loop
	ld a, e
	pop de
	ret

Decompress: ; 1263 (0:1263)
	; source hl
	; dest de
	; size bc
	ld a, c
	add e
	ld [wDecompressEndAddress + 1], a
	ld a, b
	adc d
	ld [wDecompressEndAddress], a
	ld b, $80
.loop
	ld c, $1
	call Decompress_ReadCBits
	or a
	jr z, .not_literal
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld a, [wDecompressEndAddress]
	cp d
	jr nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jr nz, .loop
	jp .done

.not_literal
	ld c, $1
	call Decompress_ReadCBits
	or a
	jr nz, .not_one_byte
	; copy one byte literal from C bytes back in the destination
	; 5-bit param
	ld c, $5
	call Decompress_ReadCBits
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
	ld a, [wDecompressEndAddress]
	cp d
	jr nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jr nz, .loop
	jp .done

.not_one_byte
; dest pointer de
; copy (u3)(c + $2) bytes from de - (u8)
; for copies $5 bytes and larger, use .asm_12de
	ld a, $0
	ld [wDecompressLiteralCopySize], a
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $2
	call Decompress_ReadCBits
	cp $3
	jr z, .asm_12de
	add $2
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc $0
	ld h, a
	jp .copy_block

.asm_12de
; dest pointer de
; copy (u5)(c + $5) bytes from de - (u9)
; for copies $14 bytes and larger, use .asm_1308
	ld c, $4
	call Decompress_ReadCBits
	cp $f
	jr z, .asm_1308
	add $5
	ld [wDecompressLiteralCopySize + 1], a
	ld c, $1
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp .copy_block

.asm_1308
; dest pointer de
; copy (u8)(c + $20) bytes from de - (u10)
; for copies $275 bytes and larger, use .asm_1339
	ld c, $8
	call Decompress_ReadCBits
	cp $ff
	jr z, .asm_1339
	add $14
	ld [wDecompressLiteralCopySize + 1], a
	ld a, $0
	adc $0
	ld [wDecompressLiteralCopySize], a
	ld c, $2
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
	jp .copy_block

.asm_1339
; dest pointer de
; copy (u12)(c + $113) bytes from de - (u11)
	ld c, $4
	call Decompress_ReadCBits
	ld c, a
	push bc
	ld c, $8
	call Decompress_ReadCBits
	add $13
	ld [wDecompressLiteralCopySize + 1], a
	pop bc
	ld a, c
	adc $1
	ld [wDecompressLiteralCopySize], a
	ld c, $3
	call Decompress_ReadCBits
	ld [wDecompresLiteralCopyOffsetHi], a
	ld c, $8
	call Decompress_ReadCBits
	push hl
	ld c, a
	ld a, e
	sub c
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi]
	ld c, a
	ld a, d
	sbc c
	ld h, a
.copy_block
	push bc
	ld a, [wDecompressLiteralCopySize + 1]
	ld c, a
	ld a, [wDecompressLiteralCopySize]
	ld b, a
	dec hl
.copy_block_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy_block_loop
	pop bc
	pop hl
	ld a, [wDecompressEndAddress]
	cp d
	jp nz, .loop
	ld a, [wDecompressEndAddress + 1]
	cp e
	jp nz, .loop
.done
	ret

DecompressRequestRoboponPic:
	; index a
	; destination de
	push hl
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, BANK(PoncotPicHeaders)
	call BankSwitch
	push bc
	push de
	ld h, $0
	sla l
	rl h
	sla l
	rl h
	ld bc, PoncotPicHeaders
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call BankSwitch
	; size = $40 + (c << 4)
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
	call Decompress
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, -$40
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	ld a, BANK(FixAndLoadPoncotPicWithTilemap)
	call BankSwitch
	call FixAndLoadPoncotPicWithTilemap
	pop af
	call BankSwitch
	pop hl
	ret

RequestVideoTransferQueue: ; 13ed (0:13ed)
	ld a, [wc24d]
	ld c, a
	ld hl, wVideoTransferQueue
.loop
	ld a, [hl]
	or a
	jr z, .done
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec c
	jr nz, .loop
	scf
.done
	ret

PutOnVideoTransferQueue: ; 1405 (0:1405)
	ld a, [wLCDC]
	bit 7, a
	jr nz, .lcd_enabled
	ld c, b
	ld b, $0
	jp CopyFromDEtoHL

.lcd_enabled
	push hl
	push bc
.wait
	call RequestVideoTransferQueue
	jr c, .wait
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

RequestVideoData: ; 1428 (0:1428)
; request bc bytes from de to hl
; requests are handled during vblank
	ld a, [wLCDC]
	bit 7, a
	jp z, CopyFromDEtoHL
.loop
	ld a, c
	sub $40
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	jr nc, .not_final_tile
	ld a, c
	add $40
	jr z, .done
	ld b, a
	call PutOnVideoTransferQueue
.done
	ret

.not_final_tile
	push bc
	push hl
	push de
	ld b, $40
	call PutOnVideoTransferQueue
	pop hl
	ld bc, $40
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	pop bc
	jr .loop

FarCopyVideoData:
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call CopyFromDEtoHL
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarRequestVideoData:
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call RequestVideoData
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarDecompressVideoData:
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call Decompress
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

INCLUDE "home/text.asm"

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
	call GetHLAtSPPlusParam8
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
	ld a, [wVideoTransferRequestFlags]
	bit 0, a
	jr z, .asm_1a7a
	xor a
	ret

.asm_1a7a
	ld a, [hROMBank]
	push af
	ld a, BANK(Func_70000)
	call BankSwitch
	ld a, h
	ld de, .Return
	push de
	ld h, Func_70000 / $100
	push hl
	ret

.Return
	ld h, a
	pop af
	jp BankSwitch

Func_1a90: ; 1a90 (0:1a90)
	ld l, Func_70000 % $100
	jr Func_1a70

Func_1a94: ; 1a94 (0:1a94)
	ld a, [hROMBank]
	ld [wVideoTransferRequestBank], a
	ld a, [wVideoTransferRequestFlags]
	set 1, a
	ld [wVideoTransferRequestFlags], a
	ld l, Func_70003 % $100
	call Func_1a70
	ld a, [wVideoTransferRequestFlags]
	res 1, a
	ld [wVideoTransferRequestFlags], a
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
	call BankSwitch
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
	callba Func_fd213
	ld a, $3
	call GetSRAMBank
	ld a, BANK(Func_4060)
	call BankSwitch
	jp Func_4060

Func_1b28: ; 1b28 (0:1b28)
	ld a, [wOAM27VTile]
	or a
	ret z
	push bc
	push de
	push hl
	call SuppressVBlankCallback
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
	jp nz, .done
	ld a, $11
	ld [$c01c], a
	jp .done

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
	jr z, .done
	ld a, [$c933]
	cp b
	jr c, .disable_vblank
	jr nz, .done
	ld a, [$c932]
	cp c
	jr c, .disable_vblank
	jr nz, .done
	ld a, [$c935]
	cp h
	jr c, .disable_vblank
	jr nz, .done
	ld a, [$c934]
	cp l
	jr c, .disable_vblank
	jr nz, .done
.disable_vblank
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
	ld a, [wFarCallDestBank]
	push af
	callba Func_93c0c
	pop af
	ld [wFarCallDestBank], a
.done
	pop af
	call GetSRAMBank
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop hl
	pop de
	pop bc
	ret

SuppressVBlankCallback: ; 1beb (0:1beb)
	di
	ld a, [wNextVBlankFlags]
	ld c, a
	res 7, a
	ld [wNextVBlankFlags], a
	ld a, [wc2e8]
	ld b, a
	xor a
	ld [wc2e8], a
	ei
	ret

ApplyVBlankCallbackEnableFlag: ; 1bff (0:1bff)
	ld a, c
	and $80
	ld c, a
	di
	ld a, [wNextVBlankFlags]
	or c
	ld [wNextVBlankFlags], a
	ld a, b
	ld [wc2e8], a
	ei
	ret

Func_1c11:
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	ld c, l
	ld b, h
	predef Func_7e640
	pop bc
	ld l, a
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	ld a, l
	ret

Func_1c27:
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	predef Func_7e556
	ld l, a
	ld h, b
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	ret

Func_1c3b:
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	predef Func_7aa8e
	jr c, .asm_1c53
	xor a
	ld [wOAM09VTile], a
.asm_1c4a
	pop bc
	call ApplyVBlankCallbackEnableFlag
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
	call SuppressVBlankCallback
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
	call SuppressVBlankCallback
	pop af
	push bc
	ld c, a
	predef Func_7aca4
	jr asm_1c8c

Func_1c78:
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	predef Func_7aa8e
	jr asm_1c8c

Func_1c83:
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	predef Func_7ac16
asm_1c8c
	jr nc, .asm_1c99
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	ld a, $ff
	ret

.asm_1c99
	pop bc
	call ApplyVBlankCallbackEnableFlag
	pop af
	call GetSRAMBank
	xor a
	ret

EnableVBlank:
	ld hl, rIE
	set 0, [hl]
	ret

DisableVBlank:
	ld hl, rIE
	res 0, [hl]
	ret

EnableHBlank:
	ld hl, rIE
	set 1, [hl]
	ret

DisableHBlank:
	ld hl, rIE
	res 1, [hl]
	ret

EnableTimerInt:
	ld hl, rIE
	set 2, [hl]
	ret

DisableTimerInt:
	ld hl, rIE
	res 2, [hl]
	ret

EnableJoypadInt:
	ld hl, rIE
	set 3, [hl]
	ret

DisableJoypadInt:
	ld hl, rIE
	res 3, [hl]
	ret

SECTION "1d00", HOME [$1d00]
INCLUDE "home/crash.asm"

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
	call WriteHalfWordTo
	dw $c391
	ld hl, $0
	call WriteHalfWordTo
	dw $c393
	ld bc, $5
	ld e, $0
	ld hl, wOAM02XCoord
	call FillMemory
	ret

Func_1e4d: ; 1e4d (0:1e4d)
	call Func_3aa8
	set_farcall_addrs_hli Func_17a67
	ld de, $900
	ld hl, $ce10
	call FarCall
	call Func_1db9
	xor a
	ld [wOAM26VTile], a
	xor a
	ld [wVBlankTransferFlags], a
	xor a
	ld [$c92b], a
	set_farcall_addrs_hli Func_613fc
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
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
.loop
	cp $6
	jp nc, .next
	ld e, a
	ld d, $0
	ld hl, $c932
	add hl, de
	ld [hl], $ff
	inc a
	jp .loop

.next
	ld a, BANK(Func_144fd)
	call BankSwitch
	ld e, $0
	xor a
	call SetStringStartState
	set_farcall_addrs_hli Func_79b3
	ld a, $1
	call FarCall
	push hl
	set_farcall_addrs_hli Func_7ae4
	ld a, $1
	call FarCall
	push de
	push hl
	pop de
	pop hl
	push de
	set_farcall_addrs_hli Func_7a2b
	xor a
	pop de
	pop hl
	call CompareHLtoDE
	jp nz, Func_1f25
	call FarCall
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
	call ReadHalfWordAt
	dw $c30e
	ld a, l
	or h
	jp nz, Func_1f7a
	set_farcall_addrs_hli Func_17aba
	ld hl, $100
	call FarCall
	call WriteHalfWordTo
	dw $c30e
	call WaitVideoTransfer
	ld a, BANK(GFX_4a12)
	ld [wFarCallDestBank], a
	ld bc, $f0
	ld de, $88f0
	call ReadHalfWordAt
	dw $c30e
	call FarRequestVideoData
	ld a, BANK(GFX_4a12)
	ld [wFarCallDestBank], a
	ld bc, $f0
	ld de, GFX_4a12
	ld hl, $88f0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_1f7a: ; 1f7a (0:1f7a)
	ret

Func_1f7b:
	call ReadHalfWordAt
	dw $c30e
	ld a, l
	or h
	jp z, Func_1fbd
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $f0
	call ReadHalfWordAt
	dw $c30e
	push de
	push hl
	pop de
	pop hl
	ld hl, $88f0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw $c30e
	call FarCall
	ld hl, $0
	call WriteHalfWordTo
	dw $c30e
Func_1fbd: ; 1fbd (0:1fbd)
	ret

Func_1fbe:
	call ReadHalfWordAt
	dw $c2f2
	ld a, l
	or h
	jp nz, Func_2008
	set_farcall_addrs_hli Func_17aba
	ld hl, $1ba
	call FarCall
	call WriteHalfWordTo
	dw $c2f2
	call WaitVideoTransfer
	ld a, BANK(GFX_4b22)
	ld [wFarCallDestBank], a
	ld bc, $1ba
	ld de, $8cc0
	call ReadHalfWordAt
	dw $c2f2
	call FarRequestVideoData
	ld a, BANK(GFX_4b22)
	ld [wFarCallDestBank], a
	ld bc, $1ba
	ld de, GFX_4b22
	ld hl, $8cc0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_2008: ; 2008 (0:2008)
	ret

Func_2009:
	call ReadHalfWordAt
	dw $c2f2
	ld a, l
	or h
	jp z, Func_204b
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $1ba
	call ReadHalfWordAt
	dw $c2f2
	push de
	push hl
	pop de
	pop hl
	ld hl, $8cc0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw $c2f2
	call FarCall
	ld hl, HuC3SRamMode
	call WriteHalfWordTo
	dw $c2f2
Func_204b:
	ret

Func_204c:
	call ReadHalfWordAt
	dw $c2f2
	ld a, l
	or h
	jp nz, Func_2096
	set_farcall_addrs_hli Func_17aba
	ld hl, $50
	call FarCall
	call WriteHalfWordTo
	dw $c2f2
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $50
	ld de, $8fa0
	call ReadHalfWordAt
	dw $c2f2
	call FarRequestVideoData
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $50
	ld de, $4e02
	ld hl, $8fa0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_2096: ; 2096 (0:2096)
	ret

Func_2097:
	call ReadHalfWordAt
	dw $c2f2
	ld a, l
	or h
	jp z, Func_20d9
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $50
	call ReadHalfWordAt
	dw $c2f2
	push de
	push hl
	pop de
	pop hl
	ld hl, $8fa0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw $c2f2
	call FarCall
	ld hl, $0
	call WriteHalfWordTo
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
	call GetHLAtSPPlusParam8
	db $c
	ld a, [hl]
	inc hl
	call WriteHLToSPPlusParam8
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
	call GetHLAtSPPlusParam8
	db $c
	add hl, bc
	call WriteHLToSPPlusParam8
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
	call GetHLAtSPPlus6
	ld c, h
	call GetHLAtSPPlus6
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
	decoord 0, 0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
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
	call GetHLAtSPPlus6
	ld c, h
	call GetHLAtSPPlus6
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
	decoord 0, 0, wAttrMap
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
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
	call GetHLAtSPPlusParam8
	db $c
	ld [hl], a
	inc hl
	call WriteHLToSPPlusParam8
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
	call GetHLAtSPPlusParam8
	db $c
	add hl, bc
	call WriteHLToSPPlusParam8
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
	call GetHLAtSPPlus6
	ld c, h
	call GetHLAtSPPlus6
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
	decoord 0, 0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
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
	call GetHLAtSPPlus6
	ld c, h
	call GetHLAtSPPlus6
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
	decoord 0, 0, wAttrMap
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	pop bc
	push hl
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_2180
	pop bc
	pop bc
	pop bc
	ret

Data_2226:
	dr $2226, $2230

Func_2230:
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	call GetHLAtSPPlusParam8
	db $c
	ld a, l
	and h
	inc a
	jp nz, Func_224f
	ld hl, sp+$4
	ld a, [wStringDestX]
	ld [hl], a
	ld hl, sp+$3
	ld a, [wStringDestY]
	ld [hl], a
	jp Func_225f

Func_224f: ; 224f (0:224f)
	call GetHLAtSPPlusParam8
	db $c
	ld e, h
	ld hl, sp+$4
	ld [hl], e
	call GetHLAtSPPlusParam8
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
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	ld hl, Data_2304
	push hl
	call PlaceString
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
	call WriteHLToSPPlus5
Func_2299: ; 2299 (0:2299)
	call GetHLAtSPPlus5
	ld a, [hl]
	dec a
	inc hl
	or [hl]
	jp z, Func_22e8
	call GetHLAtSPPlus5
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	call CompareHLtoBC
	jp nc, Func_22e8
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call SetStringStartState
	ld hl, sp+$0
	ld a, [hl]
	and $2
	jp z, Func_22ce
	ld hl, Data_2307
	push hl
	call PlaceString
	pop bc
	jp Func_22d6

Func_22ce: ; 22ce (0:22ce)
	ld hl, Data_2309
	push hl
	call PlaceString
	pop bc
Func_22d6: ; 22d6 (0:22d6)
	call GetHLAtSPPlus5
	inc hl
	inc hl
	call WriteHLToSPPlus5
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
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	ld hl, Data_230b
	push hl
	call PlaceString
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
	TX_SNUM
	db $00

Data_2307:
	db "0", $00

Data_2309:
	db " ", $00

Data_230b:
	TX_SNUM
	db $00

PlaceStringDEatCoordHL: ; 230e (0:230e)
	push de
	ld a, l
	and h
	inc a
	jp z, .okay
	; ld e, l
	; ld a, h
	ld c, h
	ld a, l
	ld e, a
	ld a, c
	call SetStringStartState
.okay
	pop de
	push de
	call PlaceString
	pop bc
	ret

Func_2323:
	push hl
	push bc
	push bc
	push bc
	push de
	call GetHLAtSPPlus10
	ld e, h
	ld hl, sp+$6
	ld [hl], e
	call GetHLAtSPPlus10
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
	; e: Poncots index
	push hl
	ld hl, -$ee
	add hl, sp
	ld sp, hl
	ld a, e
	cp $aa
	jp c, .PoncotsOrTrainer
	ld a, e
	cp $ae
	jp nc, .PoncotsOrTrainer
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
	ld de, 47
	call MultiplyHLbyDE
	ld de, $ba24 - 47 * $aa
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld bc, 47
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ld bc, 47
	ld hl, sp+$0
	push hl
	call GetHLAtSPPlusParam8
	db $f2
	pop de
	call CopyFromDEtoHL
	jp .Done

.PoncotsOrTrainer
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(PoncotsBaseStats)
	call BankSwitch
	ld hl, PoncotsBaseStats
	call WriteHLToSPPlusParam8
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
	call DivideHLByDESigned
	add hl, hl
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $f3
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $f3
	add hl, bc
	pop de
	ld bc, 5 * 47
	call Decompress
	pop de
	ld l, e
	ld h, $0
	ld de, $5
	call DivideHLByDESigned
	ld hl, 47
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $f4
	pop de
	ld bc, 47
	call CopyFromDEtoHL
	pop af
	call BankSwitch
.Done
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
	call BankSwitch
	ld hl, Data_64390
	call WriteHLToSPPlusParam8
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
	call DivideHLByDESigned
	add hl, hl
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $c8
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $c8
	add hl, bc
	pop de
	ld bc, $c0
	call Decompress
	pop de
	ld l, e
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
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
	call GetHLAtSPPlusParam8
	db $c8
	pop de
	ld bc, $18
	call CopyFromDEtoHL
	pop af
	call BankSwitch
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
	call BankSwitch
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
	call GetHLAtSPPlus6
	pop de
	ld bc, $11
	call CopyFromDEtoHL
	pop af
	call BankSwitch
	pop bc
	ret

Func_24bb
	push hl
	push de
	ld a, [hROMBank]
	push af
	ld a, BANK(Data_657c5)
	call BankSwitch
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
	call GetHLAtSPPlus6
	pop de
	ld bc, $d
	call CopyFromDEtoHL
	pop af
	call BankSwitch
	pop bc
	ret

Func_24e9: ; 24e9 (0:24e9)
	call Func_0465
	ld l, a
	inc l
	dec l
	jp z, .check_joy_pressed
	ld a, l
	and $f0
	jp nz, .check_joy_pressed
	ld a, [wc208]
	or a
	jp nz, .check_joy_pressed
	ld a, $1
	ld [wc208], a
.check_joy_pressed
	ld a, [wJoyPressed]
	or a
	jp nz, .set_joy_held
	xor a
	ld [wc208], a
.set_joy_held
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
	call DivideHLByDESigned
	ld a, l
	pop hl
	push hl
	ld de, $100
	call DivideHLByDESigned
	ld a, e
	pop hl
	pop bc
	push hl
	push bc
	ld l, c
	ld h, b
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$e
	ld [hl], a
	pop hl
	ld de, $100
	call DivideHLByDESigned
	ld a, e
	ld hl, sp+$2
	ld [hl], $96
	ld hl, sp+$3
	ld [hl], $90
	ld hl, sp+$a
	ld [hl], $91
	ld hl, sp+$4
	call WriteHLToSPPlusParam8
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
	call GetHLAtSPPlusParam8
	db $12
	ld de, $fff8
	add hl, de
	inc h
	dec h
	bit 7, h
	jr nz, .asm_25a1
	call GetHLAtSPPlusParam8
	db $f
	ld [hl], $92
	inc hl
	call WriteHLToSPPlusParam8
	db $f
	call GetHLAtSPPlusParam8
	db $12
	ld de, $fff8
	add hl, de
	call WriteHLToSPPlusParam8
	db $12
	inc c
	jp Func_25a4

.asm_25a1
	jp Func_25a7

Func_25a4: ; 25a4 (0:25a4)
	jp Func_2578

Func_25a7: ; 25a7 (0:25a7)
	call GetHLAtSPPlusParam8
	db $12
	ld a, l
	or h
	jp z, Func_25eb
	inc c
	push bc
	ld hl, sp+$d
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $11
	ld [hl], a
	inc hl
	call WriteHLToSPPlusParam8
	db $11
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $10
	call GetHLAtSPPlusParam8
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
	call FarRequestVideoData
	pop bc
Func_25eb: ; 25eb (0:25eb)
	ld a, c
	cp $6
	jp nc, Func_2600
	call GetHLAtSPPlusParam8
	db $f
	ld [hl], $93
	inc hl
	call WriteHLToSPPlusParam8
	db $f
	inc c
	jp Func_25eb

Func_2600: ; 2600 (0:2600)
	pop hl
	call Coord2TileMap
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
	call CopyFromDEtoHL
	add sp, $10
	ret

Func_2617:
	push bc
	push bc
	push bc
	ld a, l
	or h
	jp nz, Func_2642
	call GetHLAtSPPlus6
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
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
	call MultiplyLongsFromStack
	ld hl, sp+$8
	call PutLongFromStackToHL
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
	call DivideLongSigned
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus8
	pop bc
Func_2690: ; 2690 (0:2690)
	ld a, c
	cp $1
	jp c, Func_26a3
	push bc
	ld hl, sp+$2
	ld b, $1
	call RightShiftLong
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
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $ff
	push hl
	call BitwiseAndLongsFromStack
	pop bc
	pop af
	call GetHLAtSPPlus8
	ld [hl], c
	ld hl, sp+$2
	ld b, $8
	call RightShiftLong
	call GetHLAtSPPlus8
	dec hl
	call WriteHLToSPPlus8
	pop af
	inc a
	jp Func_26a4

Func_26d3: ; 26d3 (0:26d3)
	pop bc
	pop bc
	pop bc
	ret

CopyUntilNull: ; 26d7 (0:26d7)
.loop
	ld a, [de]
	or a
	jp z, .done
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	jp .loop

.done
	xor a
	ld [hl], a
	ret

FarCopyUntilNull:
	push de
	push hl
	ld a, [hROMBank]
	push af
	ld a, c
	call BankSwitch
	pop af
	pop hl
	pop de
	push af
.loop
	ld a, [de]
	or a
	jp z, .done
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	jp .loop

.done
	pop af
	push hl
	push af
	xor a
	ld [hl], a
	pop af
	call BankSwitch
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
	call PutLongFromStackToHL
	ld hl, $0
	call WriteHLToSPPlus6
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
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld bc, $0
	push bc
	push hl
	ld hl, sp+$c
	call AddLongs
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
	call MemCopy
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
	call MemCopy
	ld hl, sp+$4
	call PutLongFromHLOnStack
	ld hl, sp+$c
	call AddLongs
	ld hl, 999995 >> 16
	push hl
	ld hl, 999995 & $ffff
	push hl
	ld hl, sp+$c
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_27c0
	ld hl, 999995 >> 16
	push hl
	ld hl, 999995 & $ffff
	push hl
	ld hl, sp+$c
	call PutLongFromStackToHL
	jp Func_27e0

Func_27c0: ; 27c0 (0:27c0)
	ld hl, sp+$8
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_27e0
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$c
	call PutLongFromStackToHL
Func_27e0: ; 27e0 (0:27e0)
	ld a, $3
	call GetSRAMBank
	ld de, $c989
	ld hl, sp+$8
	ld bc, $4
	call MemCopy
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
	call GetHLAtSPPlus4
	ld h, $0
	push hl
	call GetHLAtSPPlus6
	ld l, h
	ld h, $0
	pop de
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	push de
	ld a, $3
	call GetSRAMBank
	set_farcall_addrs_hli Func_17aba
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
	call FarCall
	ld c, l
	ld b, h
	push bc
	inc bc
	inc bc
	inc bc
	inc bc
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlusParam8
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
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	pop de
	call Func_2152
	pop bc
	pop af
	push bc
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
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
	call GetHLAtSPPlus6
	ld a, [hSRAMBank]
	push af
	push hl
	ld a, $3
	call GetSRAMBank
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$4
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$5
	ld [hl], a
	call GetHLAtSPPlus10
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
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
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
	set_farcall_addrs_hli Func_17c57
	pop hl
	call FarCall
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
	call GetHLAtSPPlus10
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
	call DivideAbyB
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
	set_farcall_addrs_hli Func_17e95
	pop de
	push de
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$6
	ld l, [hl]
	ld h, a
	ld c, $3
	call FarCall
	pop de
Func_29cb: ; 29cb (0:29cb)
	push de
	ld a, $2
	ld [wOAM26VTile], a
	set_farcall_addrs_hli Func_c7109
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
	call FarCall
	call GetHLAtSPPlus10
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
	call PlaceStringDEatCoordHL
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
	call AddLongs
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_2a78
	ld hl, $5ba0
	call WriteHalfWordTo
	dw $c391
	ld hl, $676
	call WriteHalfWordTo
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
	ld a, [wNextVBlankFlags]
	push af
	ld a, [rLCDC]
	and $80
	jp z, Func_2aab
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	and $8
	jp z, Func_2aab
	ld a, [wNextVBlankFlags]
	and $f7
	ld [wNextVBlankFlags], a
Func_2aa1: ; 2aa1 (0:2aa1)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_2aa1
Func_2aab: ; 2aab (0:2aab)
	ld a, BANK(Func_6b22)
	call BankSwitch
	pop af
	pop bc
	push af
Func_2ab3: ; 2ab3 (0:2ab3)
	call GetHLAtSPPlusParam8
	db $16
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_2b70
	push bc
	xor a
	call Func_6b22
	call GetHLAtSPPlusParam8
	db $18
	ld de, $10
	call CompareHLtoDE
	jp c, Func_2add
	ld hl, sp+$14
	ld [hl], $10
	jp Func_2ae5

Func_2add: ; 2add (0:2add)
	call GetHLAtSPPlusParam8
	db $18
	ld e, l
	ld hl, sp+$14
	ld [hl], e
Func_2ae5: ; 2ae5 (0:2ae5)
	ld hl, sp+$15
	ld a, [hl]
	call BankSwitch
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $1a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call CopyFromDEtoHL
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
	call BankSwitch
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
	call GetHLAtSPPlusParam8
	db $18
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlusParam8
	db $18
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $10
	add hl, de
	call WriteHLToSPPlusParam8
	db $1a
	pop bc
	jp Func_2ab3

Func_2b70: ; 2b70 (0:2b70)
	pop af
	ld [wNextVBlankFlags], a
	ld hl, sp+$11
	ld a, [hl]
	call BankSwitch
	add sp, $16
	ret

Func_2b7d: ; 2b7d (0:2b7d)
	ld c, $0
.asm_2b7e
	call Func_2a79
	ret

Func_2b83:
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
	call RightShiftArbitrarySize
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
	call LeftShiftArbitrarySize
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
	call RightShiftArbitrarySize
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
	call AbsoluteValueLong
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
	jp NegativeHL

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
	jp NegateLongOnStack

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
	call CompareHLtoBC
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
	call RightShiftArbitrarySize
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
	call LeftShiftArbitrarySize
	pop hl
	pop bc
	ld a, c
	ld c, $10
	or a
	jp z, Func_2ec4
	call SubtractArbitrarySize
	ccf
	jp Func_2ec7

Func_2ec4: ; 2ec4 (0:2ec4)
	call AddArbitrarySize
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
	call RightShiftArbitrarySize
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
	call CompareHLtoDE
	jp c, Func_2f07
Func_2f01: ; 2f01 (0:2f01)
	ld hl, $4000
	jp Func_2f14

Func_2f07: ; 2f07 (0:2f07)
	ld de, $c001
	call CompareHLtoDE
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
	call LeftShiftArbitrarySize
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
	call AddArbitrarySize
	pop de
	jp nc, Func_2f78
	push hl
	add hl, bc
	call IncrementArbitrarySize
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
	call CompareHLtoDE
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
	call CompareHLtoDE
	pop hl
	ld c, $9
	jp c, Func_3097
	ld b, e
	call RightShiftArbitrarySize
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
	call AddArbitrarySize
	pop de
	call c, Func_30ec
	jp Func_30db

Func_30c2: ; 30c2 (0:30c2)
	call SubtractArbitrarySize
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
	call RightShiftArbitrarySize
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
	call LeftShiftArbitrarySize
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
	call IncrementArbitrarySize
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

INCLUDE "home/math/longlong.asm"

Data_32b1:
	dr $32b1, $32d1

INCLUDE "home/math/long.asm"

MemCopy: ; 35e8 (0:35e8)
; retains the start pointer
; kills the copy size
; destination pointer is at the end of the copied block
	push hl
	jp .handleLoop

.loop
	ld a, [hl]
	inc hl
	ld [de], a
	inc de
	dec bc
.handleLoop
	ld a, b
	or c
	jp nz, .loop
	pop hl
	ret

INCLUDE "home/math/char_short.asm"
INCLUDE "home/stack_rw.asm"

Func_3891:
	ret

CharacterMapping: ; 3892 (0:3892)
INCLUDE "data/charmap.asm"

PrintNum: ; 3992 (0:3992)
	push hl
	pop hl
	push hl
	push hl
	ld hl, sp+$6
	call PutLongFromHLOnStack
	ld hl, 0 >> 16
	push hl
	ld hl, 0 & $ffff
	push hl
	call CompareStackLongs_Signed
	jp nc, .nonnegative
	ld a, $1
	push af
	ld hl, sp+$8
	call PutLongFromHLOnStack
	call NegateLongOnStack
	ld hl, sp+$c
	call PutLongFromStackToHL
	pop af
	jp .continue

.nonnegative
	xor a
.continue
	push af
	xor a
.loop
	ld hl, sp+$8
	call PutLongFromHLOnStack
	ld hl, 10 >> 16
	push hl
	ld hl, 10 & $ffff
	push hl
	call StackDivideLongSigned_KeepRemainder
	pop hl
	pop af
	ld a, l
	add $30
	call GetHLAtSPPlus6
	ld [hl], a
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$8
	call PutLongFromHLOnStack
	ld hl, 10 >> 16
	push hl
	ld hl, 10 & $ffff
	push hl
	call StackDivideLongSigned
	ld hl, sp+$c
	call PutLongFromStackToHL
	ld hl, sp+$8
	call PutLongFromHLOnStack
	ld hl, 0 >> 16
	push hl
	ld hl, 0 & $ffff
	push hl
	call CompareStackLongs
	jp nz, .loop
	pop af
	or a
	jp z, .done
	call GetHLAtSPPlus4
	ld [hl], "-"
	inc hl
	call WriteHLToSPPlus4
.done
	call GetHLAtSPPlus4
	ld [hl], $0
	pop hl
	push hl
	call Func_3a36
	pop hl
	pop bc
	ret

PrintNumSigned: ; 3a20 (0:3a20)
; this is an atrocity
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .positive
	dec bc
.positive
	push bc
	push hl
	push de
	push hl
	pop de
	pop hl
	call PrintNum
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
	call GetHLAtSPPlus6
	call Func_3cf2
	dec hl
	ld c, l
	ld b, h
.loop
	pop hl
	push hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, .done
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus4
	ld a, l
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	pop hl
	push hl
	inc hl
	pop de
	push hl
	dec bc
	jp .loop

.done
	pop bc
	pop bc
	pop bc
	ret

SetStringStartState: ; 3a83 (0:3a83)
	ld [wStringDestX], a
	ld a, e
	ld [wStringDestY], a
	ld hl, wStringDestY
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	ld a, [wStringDestX]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHalfWordTo
	dw $c261
	ret

Func_3aa8: ; 3aa8 (0:3aa8)
	ld a, $8f ; blank tile
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
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call FillMemory
	ld a, [wSystemType]
	cp $11
	jp nz, .not_cgb
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld e, $0
	hlcoord 0, 0, wAttrMap
	call FillMemory
	ld a, $2
	ld [wOAM26VTile], a
.not_cgb
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	xor a
	ld [wStringDestX], a
	xor a
	ld [wStringDestY], a
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
	set_farcall_addrs_hli Func_62a3
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
	call FarCall
	call WaitVideoTransfer
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
	set_farcall_addrs_hli Func_62a3
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
	call FarCall
	call WaitVideoTransfer
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
	jp nz, .zero
	ld a, $1
	jp .wait_transfer

.zero
	xor a
.wait_transfer
	ld [hl], a
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_62a3
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
	call FarCall
	call WaitVideoTransfer
	ld a, [wSystemType]
	cp $11
	jp nz, .skip_vbank1
	ld a, [wOAM26VTile]
	or a
	jp z, .skip_vbank1
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld hl, sp+$4
	ld a, [hl]
	add $12
	ld hl, sp+$4
	ld [hl], a
	set_farcall_addrs_hli Func_62a3
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
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
	ld a, [wOAM26VTile]
	dec a
	ld [wOAM26VTile], a
.skip_vbank1
	ld a, [$c2cd]
	or a
	jp nz, .zero_2
	ld a, $1
	jp .done

.zero_2
	xor a
.done
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
	and $ff ^ $8
	ld [wLCDC], a
	jp Func_3cd0

Func_3cc8: ; 3cc8 (0:3cc8)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_3cd0: ; 3cd0 (0:3cd0)
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
Func_3ce0: ; 3ce0 (0:3ce0)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
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
AudioEngineFarCall::
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
	call LoadFontGFX
	hlbgcoord 0, 0
	call Func_6149
	hlbgcoord 0, 0, vWindowMap
	call Func_6149
	ld a, $81
	call Func_617d
	call TimerInterrupt
	ld a, [wNextVBlankFlags]
	or $9
	ld [wNextVBlankFlags], a
	ld a, [wc213]
	or a
	ret nz
	callba Func_93b87
	callba Func_fd314
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
.clear_c200
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_c200
	pop af
	ld [wSystemType], a
	ld hl, Func_40bf
	ld de, wTimer
	ld b, $9
.load_interrupts
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .load_interrupts
	ld de, wLCD
	ld b, $3
.load_lcd_interrupt
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .load_lcd_interrupt
	call FillToStackBottomWithWillTestString
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
	jp TimerInterrupt

Func_40c2:
	jp Serial_

Func_40c5:
	jp VBlank

Func_40c8:
	jp LCDInterrupt

FillToStackBottomWithWillTestString: ; 40cb (1:40cb)
	ld hl, sp+$0
	ld de, wOAM2_0aYCoord
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld hl, .WillTestString
.loop
	ld a, [hli]
	or a
	jr nz, .place_string
	ld hl, .WillTestString
	jr .loop

.place_string
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

.WillTestString:
	db "WILL TEST", $00

Func_40f4: ; 40f4 (1:40f4)
	ld c, hPushOAM % $100
	ld b, $a
	ld hl, .PushOAM
.asm_40fb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_40fb
	ret

.PushOAM:
	ld a, $c4
	ld [rDMA], a
	ld a, $28
.asm_4108
	dec a
	jr nz, .asm_4108
	ret

LoadFontGFX: ; 410c (1:410c)
	ld hl, $9000
	ld de, GFX_4122
	ld bc, $800
	call CopyFromDEtoHL
	ld hl, $8800
	ld bc, $1b0
	call CopyFromDEtoHL
	ret

GFX_4122: INCBIN "gfx/misc/font.w128.t5.2bpp", $0, $8e0
GFX_4a02: INCBIN "gfx/misc/font.w128.t5.2bpp", $8e0, $10
GFX_4a12: INCBIN "gfx/misc/font.w128.t5.2bpp", $8f0, $c0
GFX_4ad2: dr $4ad2, $4b22
IF DEF(SUN)
GFX_4b22: dr $4b22, $4dd2
GFX_4dd2: dr $4dd2, $6122
ENDC
IF DEF(STAR)
GFX_4b22: dr $4b22, $4de2
GFX_4dd2: dr $4de2, $6122
ENDC

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
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
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
	jp z, PutOnVideoTransferQueue
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
	jp PutOnVideoTransferQueue

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
	jp PutOnVideoTransferQueue

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
	ld a, [wNextVBlankFlags]
	ld c, a
	ld a, [wLastVBlankFlags]
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
	call Coord2TileMap
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
	call Coord2TileMap
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
	call Coord2TileMap
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
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $7
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $2
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	inc de
	ld c, $8
	call Decompress_ReadCBits
	ld [de], a
	ret

ApplyBitMaskToDE:
.loop
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
	jr nz, .loop
	ret

Func_6493:
	push hl
	push de
	ld l, e
	ld h, d
	ld de, -$1b
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
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $2
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $7
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	push hl
	ld l, [hl]
	ld c, $8
	call ApplyBitMaskToDE
	pop hl
	dec hl
	ret

FixAndLoadPoncotPicWithTilemap: ; 65db (1:65db)
; hl - VTile coordinate for Poncot pic loading
; de - Address where the decompressed Poncot pic lives
; bc - Size of pic (only used if fixing alignment, see below)
; [wPoncotPicAlignment] - If nonzero, don't fix alignment.
;                         Otherwise, if loading the enemy
;                         pic into $8cc0, reverse its
;                         facing.
	ld a, [wPoncotPicAlignment]
	or a
	jr nz, .next
	ld a, h
	cp $89 ; monster gfx are loaded into VRAM at either $89b0 or $8cc0.
	jr z, .next
	push de
	push hl
	push bc
	ld l, e
	ld h, d
.loop
	ld a, [hl]
REPT 8
	rrca
	rl e
ENDR
	ld [hl], e
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop bc
	pop hl
	pop de
.next
	push de
	push hl
	call RequestVideoData
	pop hl
	pop de
	push hl
	ld a, h
	ld c, $9b
	cp $89
	jr z, .got_tile_start
	ld c, $cc
.got_tile_start
	ld hl, -$40
	add hl, de
	push hl
	ld b, $40
.copy_tilemap
	ld a, [hl]
	or a
	jr z, .next_tile
	ld a, $8f
	jr .load

.next_tile
	ld a, c
	inc c
.load
	ld [hli], a
	dec b
	jr nz, .copy_tilemap
	pop hl
	pop af
	cp $89
	jr z, .quit
	ld a, [wPoncotPicAlignment]
	or a
	jr nz, .quit
	ld e, l
	ld d, h
	ld bc, $7
	add hl, bc
	ld c, l
	ld l, e
	ld e, c
	ld c, h
	ld h, d
	ld d, c
	ld c, $8
.loop2
	push hl
	push de
	ld b, [hl]
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [de], a
	dec de
	ld b, [hl]
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [de], a
	dec de
	ld b, [hl]
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [de], a
	dec de
	ld b, [hl]
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	pop de
	pop hl
	ld a, l
	add $8
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, e
	add $8
	ld e, a
	ld a, d
	adc $0
	ld d, a
	dec c
	jr nz, .loop2
.quit
	ret

Func_667d:
	ld a, c
	cp $2
	jr z, .asm_66bc
	cp $3
	jr z, .asm_66d9
	call Func_6122
	ld c, b
	ld a, $10
.asm_668c
	push bc
	dec a
	jr nz, .asm_668c
	ld [wFarCallSavedHL], sp
	ld a, d
	sub h
	ld b, a
	inc b
	ld a, e
	sub l
	ld c, a
	inc c
	ld a, [wFarCallSavedHL]
	ld e, a
	ld a, [wFarCallSavedHL + 1]
	ld d, a
.asm_66a3
	push bc
	push hl
	push de
	ld c, $1
	call Func_61a8
	pop de
	pop hl
	inc l
	pop bc
	dec c
	jr nz, .asm_66a3
	call WaitVideoTransfer
	ld a, $10
.asm_66b7
	pop bc
	dec a
	jr nz, .asm_66b7
	ret

.asm_66bc
	ld a, d
	sub h
	ld d, a
	inc d
	ld a, e
	sub l
	ld e, a
	inc e
	push bc
	call Coord2TileMap
	pop bc
	ld a, b
.asm_66ca
	push hl
	ld b, d
.asm_66cc
	ld [hli], a
	dec b
	jr nz, .asm_66cc
	pop hl
	ld bc, $14
	add hl, bc
	dec e
	jr nz, .asm_66ca
	ret

.asm_66d9
	ld a, d
	sub h
	ld d, a
	inc d
	ld a, e
	sub l
	ld e, a
	inc e
	push bc
	call Coord2AttrMap
	pop bc
	ld a, b
.asm_66e7
	push hl
	ld b, d
.asm_66e9
	ld [hli], a
	dec b
	jr nz, .asm_66e9
	pop hl
	ld bc, $14
	add hl, bc
	dec e
	jr nz, .asm_66e7
	ret

PoncotNameCharacters:
	db "0123456789をぁぃぅぇぉ" ; 00-0f
	db "ゃゅょっーあいうえおかきくけこさ" ; 10-1f
	db "しすせそたちつてとなにぬねのはひ" ; 20-2f
	db "ふへほまみむめもやゆよらりるれろ" ; 30-3f
	db "わん@@をぁぃぅぇぉゃゅょっあい" ; 40-4f
	db "うえおかきくけこさしすせそたちつ" ; 50-5f
	db "てとなにぬねのはひふへほまみむめ" ; 60-6f
	db "もやゆよらりるれろわん!?/:×" ; 70-7f
	db "Lp@@@@@@@@@@@G@ " ; 80-8f
	db "R@@@@@HPVE@@@@@@" ; 90-9f
	db "かきくけこさしすせそたちつてとは" ; a0-af
	db "ひふへほはひふへほ@@@@@@@" ; b0-bf
	db "かきくけこさしすせそたちつてとは" ; c0-cf
	db "ひふへほはひふへほうcABM…a" ; d0-df

PoncotNameAttributes:
; bit 0: hiragana if set else katakana
; bit 1: dakuten
; bit 2: handakuten
; all three bits set: no special attributes
	db %111, %111, %111, %111, %111, %111, %111, %111 ; 00-07
	db %111, %111, %001, %001, %001, %001, %001, %001 ; 08-0f
	db %001, %001, %001, %001, %111, %001, %001, %001 ; 10-17
	db %001, %001, %001, %001, %001, %001, %001, %001 ; 18-1f
	db %001, %001, %001, %001, %001, %001, %001, %001 ; 20-27
	db %001, %001, %001, %001, %001, %001, %001, %001 ; 28-2f
	db %001, %001, %001, %001, %001, %001, %001, %001 ; 30-37
	db %001, %001, %001, %001, %001, %001, %001, %001 ; 38-3f
	db %001, %001, %000, %000, %000, %000, %000, %000 ; 40-47
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 48-4f
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 50-57
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 58-5f
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 60-67
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 68-6f
	db %000, %000, %000, %000, %000, %000, %000, %000 ; 70-77
	db %000, %000, %000, %111, %111, %111, %111, %111 ; 78-7f
	db %111, %111, %000, %000, %000, %000, %000, %000 ; 80-87
	db %000, %000, %000, %000, %000, %111, %000, %111 ; 88-8f
	db %111, %000, %000, %000, %000, %000, %111, %111 ; 90-97
	db %111, %111, %000, %000, %000, %000, %000, %000 ; 98-9f
	db %011, %011, %011, %011, %011, %011, %011, %011 ; a0-a7
	db %011, %011, %011, %011, %011, %011, %011, %011 ; a8-af
	db %011, %011, %011, %011, %101, %101, %101, %101 ; b0-b7
	db %101, %000, %000, %000, %000, %000, %000, %000 ; b8-bf
	db %010, %010, %010, %010, %010, %010, %010, %010 ; c0-c7
	db %010, %010, %010, %010, %010, %010, %010, %010 ; c8-cf
	db %010, %010, %010, %010, %100, %100, %100, %100 ; d0-d7
	db %100, %010, %111, %111, %111, %111, %111, %111 ; d8-df

ApplyPoncotNameCharmap: ; 68b6 (1:68b6)
	push de
	push hl
	ld e, a
	ld d, $0
	ld hl, PoncotNameAttributes
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, PoncotNameCharacters
	add hl, de
	cp $7
	jr nz, .apply_flags
	ld a, [hl]
	pop hl
	pop de
	ld [hli], a
	ret

.apply_flags
	ld a, [hl]
	pop hl
	pop de
	bit 0, b
	jr nz, .no_hira
	bit 0, c
	jr z, .no_hira
	ld [hl], "<HIRA>"
	inc hl
.no_hira
	bit 0, b
	jr z, .no_kata
	bit 0, c
	jr nz, .no_kata
	ld [hl], "<KATA>"
	inc hl
.no_kata
	ld [hli], a
	bit 2, c
	jr z, .test_dakuten
	ld a, "ﾟ"
	ld [hli], a
	jr .done_dakuten

.test_dakuten
	bit 1, c
	jr z, .done_dakuten
	ld a, "ﾞ"
	ld [hli], a
.done_dakuten
	ld a, c
	and $1
	ld b, a
	ret

Func_68fd:
	ld d, c
	ld b, $1
	xor a
	ld [wFarCallSavedA], a
	ld [rSCX], a
	ld a, [rLY]
	ld c, a
.wait_next_line
	ld a, [rLY]
	cp c
	jr z, .wait_next_line
	ld c, a
	cp e
	jr c, .asm_691a
	cp d
	jr nc, .asm_691a
	ld a, [wFarCallSavedA]
	jr .asm_691b

.asm_691a
	xor a
.asm_691b
	ld [rSCX], a
	ld a, [wFarCallSavedA]
	add b
	ld [wFarCallSavedA], a
	cp $4
	jr c, .asm_692f
	xor a
	jr nz, .asm_692f
	ld a, b
	xor $fe
	ld b, a
.asm_692f
	dec hl
	ld a, h
	or l
	jr nz, .wait_next_line
	xor a
	ld [rSCX], a
	ret

Func_6938:
	ld d, c
	ld b, $5
.asm_693b
	ld c, $0
.asm_693d
	ld a, [rLY]
	cp e
	jr c, .asm_693b
	bit 0, c
	jr nz, .asm_6957
	ld c, $1
	ld a, b
	ld [rSCX], a
	xor $fe
	ld b, a
	dec hl
	ld a, l
	or h
	jr nz, .asm_693d
	xor a
	ld [rSCX], a
	ret

.asm_6957
	cp d
	jr c, .asm_693d
	xor a
	ld [rSCX], a
	jr .asm_693d

BlinkTextCursor:
	ld a, [wTextBlinkerFrameCounter]
	and $7f
	cp $1e
	jp nc, .toggle
	ret

.toggle
	ld a, [rSCX]
	srl a
	srl a
	srl a
	ld e, a
	ld a, [wBlinkerX]
	add e
	and $1f
	ld e, a
	ld a, [rSCY]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wBlinkerY]
	add l
	and $1f
	ld l, a
	xor a
	ld h, a
	ld d, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld d, $98
	ld a, [$c2cd]
	or a
	jr z, .asm_699d
	ld d, $9c
.asm_699d
	ld e, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [wTextBlinkerFrameCounter]
	bit 7, a
	jr nz, .asm_69ad
	ld a, $8f
	jr .asm_69b0

.asm_69ad
	ld a, [wBlinkerOffTile]
.asm_69b0
	push af
	ld hl, wVideoTransferQueueEntry4
	ld a, $1
	ld [hli], a
	ld a, wBlinkerTile % $100
	ld [hli], a
	ld a, wBlinkerTile / $100
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop af
	ld [wBlinkerTile], a
	ld a, [wTextBlinkerFrameCounter]
	xor $80
	and $80
	ld [wTextBlinkerFrameCounter], a
	ret

DoShakeProgram:
	ld a, [wc2e6]
	ld l, a
	ld a, [wc2e6 + 1]
	ld h, a
	ld de, $7
	add hl, de
	ld a, [hl]
	inc a
	ld [hli], a
	cp [hl]
	jr c, .done
	inc hl
	ld a, [hl]
	cpl
	inc a
	ld [rSCX], a
	ld [hli], a
	ld a, [hl]
	cpl
	inc a
	ld [rSCY], a
	ld [hl], a
	dec hl
	dec hl
	dec hl
	ld [hl], $0
.done
	ret

DoFlashProgram:
	ld a, [wc2e6]
	ld l, a
	ld a, [wc2e6 + 1]
	ld h, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp c
	jr c, .done
	xor a
	ld [hli], a
	ld a, [hl]
	ld c, a
	xor $2
	ld [hli], a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [rBGP], a
	ld a, [hl]
	ld [rOBP0], a
.done
	ret

DoFadeProgram:
	ld a, [wc2e6]
	ld l, a
	ld a, [wc2e6 + 1]
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp b
	jr c, .done
	xor a
	ld [hli], a
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add c
	pop hl
	cp $ff
	jr z, .done
	cp $11
	jr z, .done
	ld [hli], a
	ld c, a
	inc hl
	ld a, [hli]
	ld b, a
	ld e, [hl]
	ld hl, Data_6a55
	bit 0, e
	jr nz, .got_direction
	ld hl, Data_6a66
.got_direction
	add hl, bc
	ld a, [hl]
	bit 1, e
	jr z, .no_bgp
	ld [rBGP], a
.no_bgp
	bit 2, e
	jr z, .done
	ld [rOBP0], a
.done
	ret

Data_6a55:
	db %11100100
	db %11100100
	db %11100100
	db %11100101
	db %11101001
	db %11101001
	db %11101001
	db %11101001
	db %11101010
	db %11111010
	db %11111010
	db %11111110
	db %11111110
	db %11111110
	db %11111111
	db %11111111
	db %11111111

Data_6a66:
	db %11100100
	db %11100100
	db %11100100
	db %10100100
	db %10100100
	db %10010100
	db %10010100
	db %10010100
	db %10010100
	db %01010000
	db %01010000
	db %01010000
	db %01010000
	db %01000000
	db %00000000
	db %00000000
	db %00000000

Func_6a77:
	push hl
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, GFX_4122
	add hl, de
	push hl
	ld hl, $8000
	pop de
	ld bc, $10
	call RequestVideoData
	xor a
	ld [$c2e2], a
	ld a, [wLCDC]
	res 2, a
	call Func_6183
	ld hl, wOAMBuffer2
	ld b, $8
	ld d, $0
.asm_6aa0
	ld c, $5
	ld e, $10
	bit 0, b
	jr nz, .asm_6aaa
	ld e, $20
.asm_6aaa
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	xor a
	ld [hli], a
	ld [hli], a
	ld a, e
	add $20
	ld e, a
	dec c
	jr nz, .asm_6aaa
	ld a, d
	add $10
	ld d, a
	dec b
	jr nz, .asm_6aa0
	call WaitVideoTransfer
	pop hl
	ld b, h
.asm_6ac4
	ld a, [wNextVBlankFlags]
	set 1, a
	ld [wNextVBlankFlags], a
	call Func_6294
	ld hl, wOAM2_00YCoord
	ld c, $28
.asm_6ad4
	ld a, [hl]
	add $9
	cp $80
	jr c, .asm_6add
	sub $80
.asm_6add
	ld [hli], a
	ld a, [hl]
	sub $3
	jr nc, .asm_6ae5
	add $a0
.asm_6ae5
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .asm_6ad4
	dec b
	jr nz, .asm_6ac4
	ld hl, wOAMBuffer2
	ld e, $0
	ld bc, $a0
	call FillMemory
	ld a, [wNextVBlankFlags]
	set 1, a
	ld [wNextVBlankFlags], a
	call Func_6294
	ld a, $28
	ld [$c2e2], a
	ld a, [wLCDC]
	set 2, a
	jp Func_6183

Func_6b11:
	xor a
	ld c, a
	ld b, a
.asm_6b14
	ld a, [hl]
	add c
	ld c, a
	ld a, [hli]
	xor b
	ld b, a
	dec de
	ld a, e
	or d
	jr nz, .asm_6b14
	ld l, c
	ld h, b
	ret

Func_6b22: ; 6b22 (1:6b22)
	ld [rJOYP], a
	push af
	pop af
	ld a, $30
	ld [rJOYP], a
	push af
	pop af
	push af
	pop af
	ret

Func_6b2f:
	ld a, $20
	jr Func_6b22

Func_6b33:
	ld a, $10
	jr Func_6b22

Func_6b37: ; 6b37 (1:6b37)
	push bc
	ld b, a
	ld c, $8
.asm_6b3b
	ld a, $10
	rr b
	jr c, .asm_6b43
	ld a, $20
.asm_6b43
	call Func_6b22
	dec c
	jr nz, .asm_6b3b
	pop bc
	ret

Func_6b4b: ; 6b4b (1:6b4b)
	ld bc, $2904
.asm_6b4e
	dec bc
	ld a, c
	or b
	jr nz, .asm_6b4e
	ret

Func_6b54:
	ret

Func_6b55: ; 6b55 (1:6b55)
	push de
	pop hl
	push hl
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	ret

Func_6b74: ; 6b74 (1:6b74)
	push de
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	push hl
	call GetHLAtSPPlus4
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	ret

Func_6b94:
	push hl
	add sp, -$24
	ld l, e
	push hl
	ld a, d
	push af
	ld a, l
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	call Func_6b55
	pop af
	cp $9
	jp z, Func_6dd2
	cp $8
	jp z, Func_6d94
	cp $7
	jp z, Func_6d56
	cp $6
	jp z, Func_6d18
	cp $5
	jp z, Func_6cda
	cp $4
	jp z, Func_6c9c
	cp $3
	jp z, Func_6c91
	cp $2
	jp z, Func_6c53
	cp $1
	jp z, Func_6c15
	or a
	jp nz, Func_6e0d

macro_6b94: MACRO
	call GetHLAtSPPlusParam8
	db $28
	push hl
	call GetHLAtSPPlusParam8
	db \1 + 2
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db \1
	call GetHLAtSPPlusParam8
	db \1
	push de
	push hl
	pop de
	pop hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .check_negative
	ld hl, 999
	call WriteHLToSPPlusParam8
	db \1
	jp .done

.check_negative
	call GetHLAtSPPlusParam8
	db \1
	inc h
	dec h
	bit 7, h
	jr z, .done
	ld hl, $0
	call WriteHLToSPPlusParam8
	db \1
.done
ENDM

	macro_6b94 $10
	jp Func_6e0d

Func_6c15: ; 6c15 (1:6c15)
	macro_6b94 $14
	jp Func_6e0d

Func_6c53: ; 6c53 (1:6c53)
	macro_6b94 $18
	jp Func_6e0d

Func_6c91: ; 6c91 (1:6c91)
	call GetHLAtSPPlusParam8
	db $28
	ld e, l
	ld hl, [sp+$18]
	ld [hl], e
	jp Func_6e0d

Func_6c9c: ; 6c9c (1:6c9c)
	macro_6b94 $12
	jp Func_6e0d

Func_6cda: ; 6cda (1:6cda)
	macro_6b94 $16
	jp Func_6e0d

Func_6d18: ; 6d18 (1:6d18)
	macro_6b94 $1b
	jp Func_6e0d

Func_6d56: ; 6d56 (1:6d56)
	macro_6b94 $1d
	jp Func_6e0d

Func_6d94: ; 6d94 (1:6d94)
	macro_6b94 $1f
	jp Func_6e0d

Func_6dd2: ; 6dd2 (1:6dd2)
	macro_6b94 $21
Func_6e0d: ; 6e0d (1:6e0d)
	pop hl
	ld a, l
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	call Func_6b74
	add sp, $26
	ret

Func_6e1b:
	push hl
	add sp, -$22
	ld hl, sp+$22
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld a, h
	push af
	ld a, e
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	call Func_6b55
	pop af
	cp $b
	jp z, Func_6eaf
	cp $9
	jp z, Func_6ea8
	cp $8
	jp z, Func_6ea1
	cp $7
	jp z, Func_6e9a
	cp $6
	jp z, Func_6e93
	cp $5
	jp z, Func_6e8c
	cp $4
	jp z, Func_6e85
	cp $3
	jp z, Func_6e7d
	cp $2
	jp z, Func_6e76
	cp $1
	jp z, Func_6e6f
	or a
	jp nz, Func_6eb4
	call GetHLAtSPPlusParam8
	db $e
	jp Func_6eb4

Func_6e6f: ; 6e6f (1:6e6f)
	call GetHLAtSPPlusParam8
	db $12
	jp Func_6eb4

Func_6e76: ; 6e76 (1:6e76)
	call GetHLAtSPPlusParam8
	db $16
	jp Func_6eb4

Func_6e7d: ; 6e7d (1:6e7d)
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	jp Func_6eb4

Func_6e85: ; 6e85 (1:6e85)
	call GetHLAtSPPlusParam8
	db $10
	jp Func_6eb4

Func_6e8c: ; 6e8c (1:6e8c)
	call GetHLAtSPPlusParam8
	db $14
	jp Func_6eb4

Func_6e93: ; 6e93 (1:6e93)
	call GetHLAtSPPlusParam8
	db $19
	jp Func_6eb4

Func_6e9a: ; 6e9a (1:6e9a)
	call GetHLAtSPPlusParam8
	db $1b
	jp Func_6eb4

Func_6ea1: ; 6ea1 (1:6ea1)
	call GetHLAtSPPlusParam8
	db $1d
	jp Func_6eb4

Func_6ea8: ; 6ea8 (1:6ea8)
	call GetHLAtSPPlusParam8
	db $1f
	jp Func_6eb4

Func_6eaf: ; 6eaf (1:6eaf)
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
Func_6eb4: ; 6eb4 (1:6eb4)
	push de
	push hl
	pop de
	pop hl
	add sp, $24
	push de
	push hl
	pop de
	pop hl
	ret

Func_6ebf:
	push hl
	add sp, -$24
	ld l, e
	push hl
	ld a, d
	push af
	ld a, l
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	call Func_6b55
	pop af
	cp $9
	jp z, Func_6f65
	cp $8
	jp z, Func_6f5a
	cp $7
	jp z, Func_6f4f
	cp $6
	jp z, Func_6f44
	cp $5
	jp z, Func_6f39
	cp $4
	jp z, Func_6f2e
	cp $3
	jp z, Func_6f23
	cp $2
	jp z, Func_6f18
	cp $1
	jp z, Func_6f0d
	or a
	jp nz, Func_6f6d
.asm_6f00
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $10
	jp Func_6f6d

Func_6f0d: ; 6f0d (1:6f0d)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $14
	jp Func_6f6d

Func_6f18: ; 6f18 (1:6f18)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $18
	jp Func_6f6d

Func_6f23: ; 6f23 (1:6f23)
	call GetHLAtSPPlusParam8
	db $28
	ld e, l
	ld hl, sp+$18
	ld [hl], e
	jp Func_6f6d

Func_6f2e: ; 6f2e (1:6f2e)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $12
	jp Func_6f6d

Func_6f39: ; 6f39 (1:6f39)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $16
	jp Func_6f6d

Func_6f44: ; 6f44 (1:6f44)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $1b
	jp Func_6f6d

Func_6f4f: ; 6f4f (1:6f4f)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $1d
	jp Func_6f6d

Func_6f5a: ; 6f5a (1:6f5a)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $1f
	jp Func_6f6d

Func_6f65: ; 6f65 (1:6f65)
	call GetHLAtSPPlusParam8
	db $28
	call WriteHLToSPPlusParam8
	db $21
Func_6f6d: ; 6f6d (1:6f6d)
	pop hl
	ld a, l
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	call Func_6b74
	add sp, $26
	ret

Func_6f7b: ; 6f7b (1:6f7b)
	push hl
	push de
	ld a, [rIE]
	push af
	call EnableVBlank
	call EnableTimerInt
	pop af
	pop de
	push af
	ld a, e
	or d
	jp z, Func_6f95
	push de
	push hl
	pop de
	pop hl
	call Func_2887
Func_6f95: ; 6f95 (1:6f95)
	pop af
	pop hl
	push af
	ld e, $5
	call Func_2a3e
	push de
	push hl
	pop de
	pop hl
	pop af
	push de
	push af
	and $1
	jp nz, Func_6fac
	call DisableVBlank
Func_6fac: ; 6fac (1:6fac)
	pop af
	and $4
	jp nz, Func_6fb5
	call DisableTimerInt
Func_6fb5: ; 6fb5 (1:6fb5)
	pop hl
	ret

Func_6fb7: ; 6fb7 (1:6fb7)
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_6fc1
	jp Func_6f7b

Data_6fc1:
	db "<HIRA>つうしん まち<KATA>", $00

Func_6fcb: ; 6fcb (1:6fcb)
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_6fd5
	jp Func_6f7b

Data_6fd5:
	db "<HIRA>つうしん <KATA>エラー", $00

Func_6fe0:
	push bc
	ld e, $0
	push de
	ld hl, sp+$2
	ld [hl], $0
	ld a, [hSRAMBank]
	ld l, a
	push hl
	xor a
	ld [wOAM27VTile], a
	ld a, $3
	call GetSRAMBank
	call DisableJoypadInt
	ld hl, Func_1069
	call WriteHalfWordTo
	dw wSerial + 1
	xor a
	ld [wOAM07VTile], a
	xor a
.asm_7005
	ld [wOAM06Attrs], a
	ld [wOAM07XCoord], a
	ld [rSC], a
	xor a
	ld [wOAM06XCoord], a
	ld e, $5
	ld hl, Data_71f0
	call Func_2a3e
	ld c, l
	ld b, h
	pop hl
	pop de
Func_701d: ; 701d (1:701d)
	push hl
	push bc
	push de
	call EnableJoypadInt
	xor a
	ld [wTimerCounter + 1], a
	pop de
Func_7028: ; 7028 (1:7028)
	inc e
	dec e
	jp nz, Func_711e
	ld a, [wTimerCounter + 1]
	cp $2
	jp c, Func_7038
	jp Func_711e

Func_7038: ; 7038 (1:7038)
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_70bc
	xor a
	ld [wOAM06VTile], a
	ld a, $dd
	ld [wOAM06Attrs], a
	ld a, $80
	ld [wOAM07XCoord], a
	ld a, [wTextBlinkerFrameCounter]
	ld l, a
Func_7051: ; 7051 (1:7051)
	ld a, [wTextBlinkerFrameCounter]
	xor l
	and $2
	jp nz, Func_7061
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7051
Func_7061: ; 7061 (1:7061)
	ld a, [wOAM06VTile]
	or a
	jp nz, Func_7090
	push de
	set_farcall_addrs_hli Func_dd67
	ld a, $64
	call FarCall
	cp $46
	jp nc, Func_708c
	ld a, $fe
	ld [wOAM06Attrs], a
	ld a, $1
	ld [wOAM07XCoord], a
	ld hl, sp+$6
	ld [hl], $1
Func_708c: ; 708c (1:708c)
	pop de
	jp Func_70b9

Func_7090: ; 7090 (1:7090)
	xor a
	ld [wOAM06VTile], a
	ld a, [wTextBlinkerFrameCounter]
	ld l, a
Func_7098: ; 7098 (1:7098)
	ld a, [wTextBlinkerFrameCounter]
	xor l
	and $2
	jp nz, Func_70a8
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7098
Func_70a8: ; 70a8 (1:70a8)
	ld a, [wOAM07YCoord]
	cp $fe
	jp nz, Func_70b9
	ld a, [wOAM06VTile]
	or a
	jp z, Func_70b9
	ld e, $80
Func_70b9: ; 70b9 (1:70b9)
	jp Func_711b

Func_70bc: ; 70bc (1:70bc)
	push de
	xor a
	ld [wOAM06VTile], a
	ld a, $fe
	ld [wOAM06Attrs], a
	ld a, $1
	ld [wOAM07XCoord], a
	ld a, $81
	ld [rSC], a
	ld l, $0
Func_70d1: ; 70d1 (1:70d1)
	ld a, l
	cp $3
	jp nc, Func_70fa
Func_70d7: ; 70d7 (1:70d7)
	ld a, [wOAM06VTile]
	or a
	jp z, Func_70d7
	push hl
	xor a
	ld [wOAM06VTile], a
	call Func_0465
	ld a, $81
	ld [rSC], a
	pop hl
	ld a, [wOAM07YCoord]
	cp $dd
	jp z, Func_70f6
	jp Func_70fa

Func_70f6: ; 70f6 (1:70f6)
	inc l
	jp Func_70d1

Func_70fa: ; 70fa (1:70fa)
	pop de
	ld a, l
	cp $3
	jp c, Func_710e
	ld a, [wOAM07YCoord]
	cp $dd
	jp nz, Func_710e
	ld e, $81
	jp Func_711b

Func_710e: ; 710e (1:710e)
	ld a, $dd
	ld [wOAM06Attrs], a
	xor a
	ld [wOAM07XCoord], a
	ld hl, sp+$4
	ld [hl], $0
Func_711b: ; 711b (1:711b)
	jp Func_7028

Func_711e: ; 711e (1:711e)
	pop bc
	pop hl
	inc e
	dec e
	jp nz, Func_7161
	push hl
	xor a
	ld [wOAM06VTile], a
	xor a
	ld [wOAM06Attrs], a
	ld a, $1
	ld [wOAM07XCoord], a
	ld a, $81
	ld [rSC], a
Func_7137: ; 7137 (1:7137)
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7137
	ld a, $81
	ld [rSC], a
	xor a
	ld [wOAM06VTile], a
Func_7146: ; 7146 (1:7146)
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7146
	ld a, $1
	ld [wOAM27VTile], a
	ld l, c
	ld h, b
	call Func_2887
	pop hl
	ld a, l
	call GetSRAMBank
	ld a, $ff
	jp Func_71ee

Func_7161: ; 7161 (1:7161)
	ld a, e
	cp $81
	jp nz, Func_71a7
	push hl
	push de
	push bc
	ld l, $0
Func_716c: ; 716c (1:716c)
	ld a, l
	cp $f
	jp nc, Func_718a
Func_7172: ; 7172 (1:7172)
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7172
	push hl
	xor a
	ld [wOAM06VTile], a
	call Func_0465
	ld a, $81
	ld [rSC], a
	pop hl
	inc l
	jp Func_716c

Func_718a: ; 718a (1:718a)
	pop bc
	pop de
	pop hl
	ld a, [wOAM07YCoord]
	cp $dd
	jp z, Func_7198
	jp Func_701d

Func_7198: ; 7198 (1:7198)
	push hl
	ld a, $81
	ld [wOAM06XCoord], a
	ld l, c
	ld h, b
	call Func_2887
	pop hl
	jp Func_71e4

Func_71a7: ; 71a7 (1:71a7)
	push hl
	push de
	xor a
	ld [wOAM06VTile], a
	ld e, $0
Func_71af: ; 71af (1:71af)
	ld a, e
.asm_71b0
	cp $f
	jp nc, Func_71c4
	ld a, [wTextBlinkerFrameCounter]
	ld l, a
Func_71b9: ; 71b9 (1:71b9)
	ld a, [wTextBlinkerFrameCounter]
	cp l
	jp z, Func_71b9
	inc e
	jp Func_71af

Func_71c4: ; 71c4 (1:71c4)
	pop de
	pop hl
	ld a, [wOAM07YCoord]
	cp $fe
	jp nz, Func_71d5
	ld a, [wOAM06VTile]
	or a
	jp nz, Func_71d8
Func_71d5: ; 71d5 (1:71d5)
	jp Func_701d

Func_71d8: ; 71d8 (1:71d8)
	push hl
	ld a, $80
	ld [wOAM06XCoord], a
	ld l, c
	ld h, b
	call Func_2887
	pop hl
Func_71e4: ; 71e4 (1:71e4)
	ld a, l
	call GetSRAMBank
	ld a, $1
	ld [wOAM27VTile], a
	xor a
Func_71ee: ; 71ee (1:71ee)
	pop bc
	ret

Data_71f0:
	db "<HIRA>せつそﾞくちゅう<KATA>", $00

Func_71fb: ; 71fb (1:71fb)
	push af
	xor a
	ld [wTimerCounter], a
	ld e, a
Func_7201: ; 7201 (1:7201)
	ld a, e
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_7218
	ld a, [wTimerCounter]
	cp $3c
	jp c, Func_7215
	xor a
	ld [wTimerCounter], a
	inc e
Func_7215: ; 7215 (1:7215)
	jp Func_7201

Func_7218: ; 7218 (1:7218)
	pop bc
	ret

Func_721a: ; 721a (1:721a)
	xor a
	ld [wTimerCounter], a
	ld [wOAM06VTile], a
Func_7221: ; 7221 (1:7221)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_7230
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7221
Func_7230: ; 7230 (1:7230)
	ld a, [wOAM06VTile]
	ret

Func_7234: ; 7234 (1:7234)
	call Func_6fcb
	push hl
	call DisableJoypadInt
	xor a
	ld [wOAM07VTile], a
	ld a, $81
	ld [rSC], a
Func_7243: ; 7243 (1:7243)
	ld a, [rSC]
	and $80
	jp nz, Func_7243
	ld a, $81
	ld [rSC], a
Func_724e: ; 724e (1:724e)
	ld a, [rSC]
	and $80
	jp nz, Func_724e
	ld a, $14
	call Func_71fb
	call EnableJoypadInt
	pop hl
	ret

Func_725f: ; 725f (1:725f)
	call Func_6fcb
	push hl
	call DisableJoypadInt
	ld a, $81
	ld [rSC], a
Func_726a: ; 726a (1:726a)
	ld a, [rSC]
	and $80
	jp nz, Func_726a
	ld a, $81
	ld [rSC], a
Func_7275: ; 7275 (1:7275)
	ld a, [rSC]
	and $80
	jp nz, Func_7275
	ld a, $28
	call Func_71fb
	call EnableJoypadInt
	pop hl
	ret

Func_7286: ; 7286 (1:7286)
	push hl
	push de
	push bc
	push bc
	push bc
	ld hl, $0
	call WriteHLToSPPlus4
	ld hl, sp+$1
	ld [hl], $0
	ld hl, sp+$0
	ld [hl], $0
	di
	ld a, [rIE]
	push af
	ld hl, sp+$6
	ld a, [hl]
	and $1
	jp z, Func_72ab
	ld a, [rIE]
	and $c
	ld [rIE], a
Func_72ab: ; 72ab (1:72ab)
	ei
Func_72ac: ; 72ac (1:72ac)
	ld de, $0
	push de
	xor a
	ld [wOAM07VTile], a
	xor a
	ld [wOAM07Attrs], a
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp z, Func_72d0
	ld hl, sp+$8
	ld a, [hl]
	and $2
	jp nz, Func_72d0
	call GetHLAtSPPlus8
	call Func_6fb7
	call WriteHLToSPPlus8
Func_72d0: ; 72d0 (1:72d0)
	call GetHLAtSPPlusParam8
	db $0e
	call WriteHalfWordTo
	dw $c320
	call GetHLAtSPPlusParam8
	db $0c
	call WriteHalfWordTo
	dw $c322
	xor a
	ld [wOAM07Attrs], a
	xor a
	ld [wOAM06VTile], a
	ld a, $1
	ld [wOAM07VTile], a
	xor a
	ld [wTimerCounter], a
	pop de
Func_72f4: ; 72f4 (1:72f4)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_731e
	ld a, [wOAM07Attrs]
	or a
	jp nz, Func_731e
	ld a, [wOAM06VTile]
	or a
	jp z, Func_731b
	xor a
	ld [wOAM06VTile], a
	ld a, [wOAM07VTile]
	cp $2
	jp c, Func_731b
	inc de
	xor a
	ld [wTimerCounter], a
Func_731b: ; 731b (1:731b)
	jp Func_72f4

Func_731e: ; 731e (1:731e)
	ld a, [wOAM07Attrs]
	or a
	jp nz, Func_733d
	ld hl, sp+$3
	ld [hl], $1
	ld a, e
	or d
	jp nz, Func_7331
	jp Func_72ac

Func_7331: ; 7331 (1:7331)
	call GetHLAtSPPlus6
	call Func_7234
	call WriteHLToSPPlus6
	jp Func_72ac

Func_733d: ; 733d (1:733d)
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	call Func_6b11
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c324
	call CompareHLtoDE
	jp z, Func_7376
	ld a, $d0
	ld [wOAM06Attrs], a
	call Func_721a
	ld a, $dd
	ld [wOAM06Attrs], a
	call GetHLAtSPPlus6
	call Func_7234
	call WriteHLToSPPlus6
	ld hl, sp+$3
	ld [hl], $1
	jp Func_72ac

Func_7376:
	ld a, $c0
	ld [wOAM06Attrs], a
	call Func_721a
	or a
	jp z, Func_7386
	ld hl, sp+$2
	ld [hl], $1
Func_7386: ; 7386 (1:7386)
	ld a, $dd
	ld [wOAM06Attrs], a
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_7395
	jp Func_72ac

Func_7395: ; 7395 (1:7395)
	di
	pop af
	ld [rIE], a
	ei
	call GetHLAtSPPlus4
	ld a, l
	or h
	jp z, Func_73a8
	call GetHLAtSPPlus4
	call Func_2887
Func_73a8: ; 73a8 (1:73a8)
	xor a
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_73af: ; 73af (1:73af)
	push hl
	push de
	push bc
	push bc
	push bc
	ld hl, $0
	call WriteHLToSPPlus5
	ld l, $0
	push hl
	ld hl, sp+$4
	ld [hl], $0
	di
	ld a, [rIE]
	pop hl
	pop bc
	push af
	push hl
	push bc
	ld a, c
	and $1
	jp z, Func_73d5
	ld a, [rIE]
	and $c
	ld [rIE], a
Func_73d5: ; 73d5 (1:73d5)
	ei
	pop bc
.asm_73d7
	pop hl
Func_73d8: ; 73d8 (1:73d8)
	push bc
	ld de, $0
	push de
	xor a
	ld [wOAM07VTile], a
	xor a
	ld [wOAM07Attrs], a
	inc l
	dec l
	jp z, Func_73f9
	ld a, c
	and $2
	jp nz, Func_73f9
	call GetHLAtSPPlus9
	call Func_6fb7
	call WriteHLToSPPlus9
Func_73f9: ; 73f9 (1:73f9)
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	pop de
	call Func_6b11
	call WriteHalfWordTo
	dw $c324
	call GetHLAtSPPlusParam8
	db $0e
	call WriteHalfWordTo
	dw $c320
	call GetHLAtSPPlusParam8
	db $0c
	call WriteHalfWordTo
	dw $c322
	xor a
	ld [wOAM07Attrs], a
	ld a, $5
	ld [wOAM07VTile], a
	xor a
	ld [wOAM06VTile], a
	xor a
	ld [wTimerCounter], a
	pop de
Func_742f: ; 742f (1:742f)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_7459
	ld a, [wOAM07Attrs]
	or a
	jp nz, Func_7459
	ld a, [wOAM06VTile]
	or a
	jp z, Func_7456
	xor a
	ld [wOAM06VTile], a
	ld a, [wOAM07VTile]
	cp $6
	jp c, Func_7456
	inc de
	xor a
	ld [wTimerCounter], a
Func_7456: ; 7456 (1:7456)
	jp Func_742f

Func_7459: ; 7459 (1:7459)
	pop bc
	ld a, [wOAM07Attrs]
	or a
	jp nz, Func_747b
	ld l, $1
	ld a, e
	or d
	jp nz, Func_746b
	jp Func_73d8

Func_746b: ; 746b (1:746b)
	push hl
	push bc
	call GetHLAtSPPlus9
	call Func_7234
	call WriteHLToSPPlus9
	pop bc
	pop hl
	jp Func_73d8

Func_747b: ; 747b (1:747b)
	push bc
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	call Func_6b11
	xor a
	ld [wTimerCounter], a
Func_748d: ; 748d (1:748d)
	ld a, [wTimerCounter]
	cp $5
	jp nc, Func_74a7
	ld a, [wOAM07YCoord]
	cp $c0
	jp nz, Func_74a4
	ld hl, sp+$4
	ld [hl], $1
	jp Func_74a7

Func_74a4: ; 74a4 (1:74a4)
	jp Func_748d

Func_74a7: ; 74a7 (1:74a7)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_74c1
	push bc
	ld l, $1
	push hl
	call GetHLAtSPPlus9
	call Func_7234
	call WriteHLToSPPlus9
	pop hl
	pop bc
	jp Func_73d8

Func_74c1: ; 74c1 (1:74c1)
	di
	pop af
	ld [rIE], a
	ei
	call GetHLAtSPPlus3
	ld a, l
	or h
	jp z, Func_74d4
	call GetHLAtSPPlus3
	call Func_2887
Func_74d4: ; 74d4 (1:74d4)
	xor a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_74da: ; 74da (1:74da)
	push af
	ld a, e
	ld [rSB], a
	xor a
	ld [wOAM06VTile], a
	ld a, $81
	ld [rSC], a
Func_74e6: ; 74e6 (1:74e6)
	ld a, [wOAM06VTile]
	or a
	jp z, Func_74e6
	pop af
	and $1
	jp nz, Func_74fc
	call Func_0465
	call Func_0465
	jp Func_7506

Func_74fc: ; 74fc (1:74fc)
	xor a
Func_74fd: ; 74fd (1:74fd)
	cp $28
	jp nc, Func_7506
	inc a
	jp Func_74fd

Func_7506: ; 7506 (1:7506)
	ret

Func_7507: ; 7507 (1:7507)
	push hl
	push de
	push bc
	push bc
	ld hl, $0
	pop de
	push hl
	xor a
	push af
	xor a
	di
	ld a, [rIE]
	ld l, a
	push hl
	ld hl, sp+$6
	ld a, [hl]
	and $1
	jp z, Func_7526
	ld a, [rIE]
	and $c
	ld [rIE], a
Func_7526: ; 7526 (1:7526)
	ei
	pop hl
	pop af
	push hl
Func_752a: ; 752a (1:752a)
	or a
	jp z, Func_753f
	ld hl, sp+$4
	ld a, [hl]
	and $2
	jp nz, Func_753f
	call GetHLAtSPPlus4
	call Func_6fb7
	call WriteHLToSPPlus4
Func_753f: ; 753f (1:753f)
	ld l, $64
Func_7541: ; 7541 (1:7541)
	inc l
	dec l
	jp z, Func_755f
	push hl
	ld e, $a2
	ld hl, sp+$6
	ld a, [hl]
	call Func_74da
	pop hl
	ld a, [wOAM07YCoord]
	cp $b2
	jp nz, Func_755b
	jp Func_755f

Func_755b: ; 755b (1:755b)
	dec l
	jp Func_7541

Func_755f: ; 755f (1:755f)
	ld a, [wOAM07YCoord]
	cp $b2
	jp z, Func_756c
	ld a, $1
	jp Func_752a

Func_756c: ; 756c (1:756c)
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	ld c, l
	ld b, h
	pop de
Func_7576: ; 7576 (1:7576)
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_7594
	push de
	push bc
	ld e, $0
	ld hl, sp+$8
	ld a, [hl]
	call Func_74da
	pop bc
	ld a, [wOAM07YCoord]
	ld [bc], a
	pop de
	dec de
	inc bc
	jp Func_7576

Func_7594: ; 7594 (1:7594)
	ld e, $0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld a, [wOAM07YCoord]
	ld [wOAM09YCoord], a
	ld e, $0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld a, [wOAM07YCoord]
	ld [wOAM09XCoord], a
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	pop de
	call Func_6b11
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c324
	call CompareHLtoDE
	jp z, Func_75e8
	ld e, $d0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld e, $d0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	call GetHLAtSPPlus4
	call Func_725f
	call WriteHLToSPPlus4
	ld a, $1
	jp Func_752a

Func_75e8:
	ld e, $c0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld e, $c0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld a, $1
	di
	pop hl
	ld a, l
	ld [rIE], a
	ei
	pop hl
	push hl
	ld a, l
	or h
	jp z, Func_760c
	pop hl
	push hl
	call Func_2887
Func_760c: ; 760c (1:760c)
	call Func_0465
	call Func_0465
	xor a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_7618: ; 7618 (1:7618)
	push hl
	push de
	push bc
	push bc
	push bc
	ld de, $0
	push de
	xor a
	push af
	ld hl, sp+$8
	ld [hl], $0
	di
	ld a, [rIE]
	ld l, a
	pop af
	pop de
	pop bc
	push hl
	push de
	push af
	push bc
	ld a, c
	and $1
	jp z, Func_763e
	ld a, [rIE]
	and $c
	ld [rIE], a
Func_763e: ; 763e (1:763e)
	ei
	pop bc
	pop af
	pop de
Func_7642: ; 7642 (1:7642)
	push bc
	or a
	jp z, Func_7658
	ld a, c
	and $2
	jp nz, Func_7658
	push de
	push hl
	pop de
	pop hl
	call Func_6fb7
	push de
	push hl
	pop de
	pop hl
Func_7658: ; 7658 (1:7658)
	push de
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	pop de
	call Func_6b11
	call WriteHalfWordTo
	dw $c324
	ld l, $64
	pop de
	pop bc
	push de
Func_7670: ; 7670 (1:7670)
	inc l
	dec l
	jp z, Func_768e
	push hl
	push bc
	ld a, c
	ld e, $a0
	call Func_74da
	pop bc
	pop hl
	ld a, [wOAM07YCoord]
	cp $b0
	jp nz, Func_768a
	jp Func_768e

Func_768a: ; 768a (1:768a)
	dec l
	jp Func_7670

Func_768e: ; 768e (1:768e)
	pop de
	ld a, [wOAM07YCoord]
	cp $b0
	jp z, Func_769c
	ld a, $1
	jp Func_7642

Func_769c: ; 769c (1:769c)
	push de
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	call WriteHLToSPPlus8
	pop hl
Func_76aa: ; 76aa (1:76aa)
	dec hl
	inc h
	dec h
	bit 7, h
	jr nz, .asm_76c5
	push hl
	push bc
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld e, a
	ld a, c
	call Func_74da
	pop bc
	pop hl
	jp Func_76aa

.asm_76c5
	push bc
	ld a, [wOAM09YCoord]
	ld e, a
	ld a, c
	call Func_74da
	pop bc
	push bc
	ld a, [wOAM09XCoord]
	ld e, a
	ld a, c
	call Func_74da
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	pop de
	call Func_6b11
	ld l, $3c
	pop bc
Func_76e8: ; 76e8 (1:76e8)
	inc l
	dec l
	jp z, Func_770a
	push hl
	push bc
	ld a, c
	ld e, $0
	call Func_74da
	pop bc
	pop hl
	ld a, [wOAM07YCoord]
	cp $c0
	jp nz, Func_7706
	ld hl, sp+$6
	ld [hl], $1
	jp Func_770a

Func_7706: ; 7706 (1:7706)
	dec l
	jp Func_76e8

Func_770a: ; 770a (1:770a)
	pop de
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_7726
	push bc
	ld a, $1
	push af
	push de
	push hl
	pop de
	pop hl
	call Func_725f
	push de
	push hl
	pop de
	pop hl
	pop af
	pop bc
	jp Func_7642

Func_7726: ; 7726 (1:7726)
	pop hl
	push de
	push hl
	di
	pop hl
	ld a, l
	ld [rIE], a
	ei
	pop de
	ld a, e
	or d
	jp z, Func_773c
	push de
	push hl
	pop de
	pop hl
	call Func_2887
Func_773c: ; 773c (1:773c)
	call Func_0465
	call Func_0465
	xor a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_7748:
	xor a
	ld [wOAM27VTile], a
	ld a, [wOAM06XCoord]
	cp $81
	jp nz, Func_775b
	call Func_7507
	ld l, a
	jp Func_775f

Func_775b: ; 775b (1:775b)
	call Func_7286
	ld l, a
Func_775f: ; 775f (1:775f)
	ld a, $1
	ld [wOAM27VTile], a
	ld a, l
	ret

Func_7766:
	xor a
	ld [wOAM27VTile], a
	ld a, [wOAM06XCoord]
	cp $81
	jp nz, Func_7779
	call Func_7618
	ld l, a
	jp Func_777d

Func_7779: ; 7779 (1:7779)
	call Func_73af
	ld l, a
Func_777d: ; 777d (1:777d)
	ld a, $1
	ld [wOAM27VTile], a
	ld a, l
	ret

Data_7784:
	db "ROBOPON IR TAKANORI", $00

Func_7798: ; 7798 (1:7798)
	push hl
	push de
Func_779a: ; 779a (1:779a)
	call GetHLAtSPPlus4
	ld a, [hl]
	pop hl
	push hl
	cp [hl]
	jp z, Func_77a9
	ld a, $1
	jp Func_77c4

Func_77a9: ; 77a9 (1:77a9)
	call GetHLAtSPPlus4
	ld a, [hl]
	or a
	jp nz, Func_77b4
	jp Func_77c3

Func_77b4: ; 77b4 (1:77b4)
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	pop hl
	push hl
	inc hl
	pop de
	push hl
	jp Func_779a

Func_77c3: ; 77c3 (1:77c3)
	xor a
Func_77c4: ; 77c4 (1:77c4)
	pop bc
	pop bc
	ret

Func_77c7: ; 77c7 (1:77c7)
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, [wOAM09VTile]
	cp $80
	jp nz, Func_782a
	ld de, Data_7784
.asm_77d6
	ld hl, wOAM09Attrs
	call CopyUntilNull
	call Func_1c78
	or a
	jp z, Func_77ec
.asm_77e4
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_77ec: ; 77ec (1:77ec)
	ld c, $15
	ld de, wOAM09Attrs
	ld hl, wOAM09Attrs
	call Func_1c5a
	or a
	jp z, Func_7803
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7803: ; 7803 (1:7803)
	ld de, wOAM09Attrs
	ld hl, Data_7784
	call Func_7798
	or a
	jp z, Func_7818
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7818: ; 7818 (1:7818)
	call Func_1c83
	or a
	jp z, Func_7827
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7827: ; 7827 (1:7827)
	jp Func_787d

Func_782a: ; 782a (1:782a)
	ld c, $15
	ld de, wOAM09Attrs
	ld hl, wOAM09Attrs
	call Func_1c5a
	or a
	jp z, Func_7841
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7841: ; 7841 (1:7841)
	call Func_1c83
	or a
	jp z, Func_7850
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7850: ; 7850 (1:7850)
	ld de, wOAM09Attrs
	ld hl, Data_7784
	call Func_7798
	or a
	jp z, Func_7865
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7865: ; 7865 (1:7865)
	ld de, Data_7784
	ld hl, wOAM09Attrs
	call CopyUntilNull
	call Func_1c78
	or a
	jp z, Func_787d
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_787d: ; 787d (1:787d)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_7882:
	push hl
	push de
	push bc
	call Func_77c7
	or a
	jp z, Func_7891
	ld a, $1
	jp Func_790b

Func_7891: ; 7891 (1:7891)
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_790a
	call GetHLAtSPPlus6
	ld de, $20
	call CompareHLtoDE
	jp c, Func_78b4
	ld hl, sp+$0
	ld [hl], $20
	jp Func_78bb

Func_78b4: ; 78b4 (1:78b4)
	call GetHLAtSPPlus6
	ld e, l
	ld hl, sp+$0
	ld [hl], e
Func_78bb: ; 78bb (1:78bb)
	ld hl, sp+$0
	ld c, [hl]
	ld de, wOAM09Attrs
	ld hl, wOAM09Attrs
	call Func_1c5a
	or a
	jp z, Func_78d0
	ld a, $1
	jp Func_790b

Func_78d0: ; 78d0 (1:78d0)
	call Func_1c83
	or a
	jp z, Func_78dc
	ld a, $1
	jp Func_790b

Func_78dc: ; 78dc (1:78dc)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	ld de, wOAM09Attrs
	call CopyFromDEtoHL
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus6
	jp Func_7891

Func_790a: ; 790a (1:790a)
	xor a
Func_790b: ; 790b (1:790b)
	pop bc
	pop bc
	pop bc
	ret

Func_790f:
	push hl
	push de
	push bc
	call Func_77c7
	or a
	jp z, Func_791e
	ld a, $1
	jp Func_7987

Func_791e: ; 791e (1:791e)
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_7986
	call GetHLAtSPPlus6
	ld de, $20
	call CompareHLtoDE
	jp c, Func_7941
	ld hl, sp+$0
	ld [hl], $20
	jp Func_7948

Func_7941: ; 7941 (1:7941)
	call GetHLAtSPPlus6
	ld e, l
	ld hl, sp+$0
	ld [hl], e
Func_7948: ; 7948 (1:7948)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, wOAM09Attrs
	call CopyFromDEtoHL
	call Func_1c78
	or a
	jp z, Func_7966
	ld a, $1
.asm_7962
	jp Func_7987

Func_7966: ; 7966 (1:7966)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus6
	jp Func_791e

Func_7986: ; 7986 (1:7986)
	xor a
Func_7987: ; 7987 (1:7987)
	pop bc
	pop bc
	pop bc
	ret

Data_798b:
	dr $798b, $7995

Data_7995:
	dr $7995, $79a9

Data_79a9:
	dr $79a9, $79b3

Func_79b3: ; 79b3 (1:79b3)
	push af
	push bc
	ld a, [hSRAMBank]
	push af
	ld hl, $0
	call WriteHLToSPPlus4
	xor a
Func_79bf: ; 79bf (1:79bf)
	cp $5
	jp nc, Func_7a1a
	push af
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_798b
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetSRAMBank_ReadOnly
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_79a9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_7995
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_6b11
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop af
	inc a
	jp Func_79bf

Func_7a1a: ; 7a1a (1:7a1a)
	pop af
	call GetSRAMBank
	pop hl
	push hl
	pop bc
	pop bc
	ret

Data_7a23:
	db "Robopon", $00

Func_7a2b: ; 7a2b (1:7a2b)
	push bc
	ld a, [hSRAMBank]
	push af
	ld hl, sp+$2
	ld [hl], $0
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld c, $0
Func_7a3a: ; 7a3a (1:7a3a)
	ld a, c
	cp $7
	jp nc, Func_7a5e
	ld e, c
	ld d, $0
	ld hl, Data_7a23
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $a000
	add hl, de
	cp [hl]
	jp z, Func_7a5a
	ld hl, sp+$2
	ld [hl], $ff
	jp Func_7a5e

Func_7a5a: ; 7a5a (1:7a5a)
	inc c
	jp Func_7a3a

Func_7a5e: ; 7a5e (1:7a5e)
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld c, $0
Func_7a65: ; 7a65 (1:7a65)
	ld a, c
	cp $7
	jp nc, Func_7a89
	ld e, c
	ld d, $0
	ld hl, Data_7a23
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $bae0
	add hl, de
	cp [hl]
	jp z, Func_7a85
	ld hl, sp+$2
	ld [hl], $ff
	jp Func_7a89

Func_7a85: ; 7a85 (1:7a85)
	inc c
	jp Func_7a65

Func_7a89: ; 7a89 (1:7a89)
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_7a92:
	ld a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank
	ld bc, $7
	ld de, Data_7a23
	ld hl, $a000
	call CopyFromDEtoHL
	ld a, $1
	call GetSRAMBank
	ld bc, $7
	ld de, Data_7a23
	ld hl, $bae0
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ret

Func_7abc:
	ld a, [hSRAMBank]
	push af
	inc e
	dec e
	jp nz, Func_7ad3
	push hl
	ld a, $3
	call GetSRAMBank
	pop hl
	call WriteHalfWordTo
	dw $ce0a
	jp Func_7adf

Func_7ad3: ; 7ad3 (1:7ad3)
	push hl
	ld a, $1
	call GetSRAMBank
	pop hl
	call WriteHalfWordTo
	dw $ba22
Func_7adf:
	pop af
	call GetSRAMBank
	ret

Func_7ae4: ; 7ae4 (1:7ae4)
	push af
	ld a, [hSRAMBank]
	ld e, a
	pop af
	push de
	or a
	jp nz, Func_7afb
	ld a, $3
	call GetSRAMBank_ReadOnly
	call ReadHalfWordAt
	ld a, [bc]
	adc $c3
	dec b
	ld a, e
Func_7afb: ; 7afb (1:7afb)
	ld a, $1
	call GetSRAMBank_ReadOnly
	call ReadHalfWordAt
	ld [hli], a
	cp d
	pop de
	push hl
	ld a, e
	call GetSRAMBank
	pop hl
	ret

Func_7b0d:
	push hl
	push bc
	ld hl, sp+$1
	ld [hl], $0
Func_7b13: ; 7b13 (1:7b13)
	ld a, [de]
	or a
	jp z, Func_7bc4
	ld a, [de]
	inc de
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $28
	jp z, Func_7b2d
	ld hl, sp+$0
	ld a, [hl]
	cp $29
	jp nz, Func_7b38
Func_7b2d: ; 7b2d (1:7b2d)
	ld hl, sp+$1
	ld a, [hl]
	xor $1
	ld hl, sp+$1
	ld [hl], a
	jp Func_7bc1

Func_7b38: ; 7b38 (1:7b38)
	ld hl, sp+$0
	ld a, [hl]
	cp $30
	jp c, Func_7b4d
	ld hl, sp+$0
	ld a, [hl]
	cp $3a
	jp nc, Func_7b4d
	ld c, $0
	jp Func_7b98

Func_7b4d: ; 7b4d (1:7b4d)
	ld hl, sp+$0
	ld a, [hl]
	cp $b0
	jp nz, Func_7b5a
	ld c, $0
	jp Func_7b98

Func_7b5a: ; 7b5a (1:7b5a)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_7b7e
	ld a, [de]
	cp $de
	jp nz, Func_7b6d
	ld c, $c0
	inc de
	jp Func_7b7b

Func_7b6d: ; 7b6d (1:7b6d)
	ld a, [de]
	cp $df
	jp nz, Func_7b79
	inc de
	ld c, $d4
	jp Func_7b7b

Func_7b79: ; 7b79 (1:7b79)
	ld c, $44
Func_7b7b: ; 7b7b (1:7b7b)
	jp Func_7b98

Func_7b7e: ; 7b7e (1:7b7e)
	ld a, [de]
	cp $de
	jp nz, Func_7b8a
	ld c, $a0
	inc de
	jp Func_7b98

Func_7b8a: ; 7b8a (1:7b8a)
	ld a, [de]
	cp $df
	jp nz, Func_7b96
	inc de
	ld c, $b4
	jp Func_7b98

Func_7b96: ; 7b96 (1:7b96)
	ld c, $a
Func_7b98: ; 7b98 (1:7b98)
	push de
	ld e, c
	ld d, $0
	ld hl, PoncotNameCharacters
	add hl, de
	push de
	push hl
	pop de
	pop hl
Func_7ba4: ; 7ba4 (1:7ba4)
	ld a, [de]
	ld hl, sp+$2
	cp [hl]
	jp z, Func_7bb0
	inc de
	inc c
	jp Func_7ba4

Func_7bb0: ; 7bb0 (1:7bb0)
	ld a, c
	inc a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus6
	ld [hl], a
	inc hl
	call WriteHLToSPPlus6
	pop de
Func_7bc1: ; 7bc1 (1:7bc1)
	jp Func_7b13

Func_7bc4: ; 7bc4 (1:7bc4)
	call GetHLAtSPPlus4
	ld [hl], $0
	pop bc
	pop bc
	ret

Func_7bcc: ; 7bcc (1:7bcc)
	push hl
	push de
	push bc
	push bc
	push bc
	call GetHLAtSPPlus10
	ld e, h
	ld hl, sp+$3
	ld [hl], e
	call GetHLAtSPPlus10
	ld e, l
	ld hl, sp+$2
	ld [hl], e
	ld l, c
	ld h, b
	ld de, $100
	call DivideHLByDESigned
	ld e, l
	ld d, $0
	inc de
	inc de
	ld hl, sp+$5
	ld [hl], e
	pop bc
	ld hl, sp+$2
	ld [hl], c
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp nz, Func_7c3d
	ld hl, sp+$2
	ld c, [hl]
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	pop de
	call Func_6336
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	add hl, bc
	ld de, $7
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	pop bc
	call Func_667d
	ld a, $2
	ld [wOAM26VTile], a
	jp Func_7c85

Func_7c3d: ; 7c3d (1:7c3d)
	ld hl, sp+$2
	ld c, [hl]
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	pop de
	call Func_6336
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld hl, sp+$2
	ld c, [hl]
	ld hl, sp+$3
	ld h, [hl]
	ld b, h
	push bc
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	add hl, bc
	ld de, $7
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	pop bc
	call Func_667d
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_7c85: ; 7c85 (1:7c85)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_7c8a:
	push hl
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nz, Func_7cac
	ld l, $1
	jp Func_7cae

Func_7cac: ; 7cac (1:7cac)
	ld l, $0
Func_7cae: ; 7cae (1:7cae)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_7cc4
	ld b, l
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call Func_7bcc
	jp Func_7cce

Func_7cc4: ; 7cc4 (1:7cc4)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call Func_6336
Func_7cce: ; 7cce (1:7cce)
	pop bc
	pop bc
	ret

Func_7cd1:
	ld a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld de, $a007
	ld c, $0
	ld l, c
Func_7cdf: ; 7cdf (1:7cdf)
	ld a, c
	cp $aa
	jp nc, Func_7cf9
	ld a, [de]
	or a
	jp z, Func_7ceb
	inc l
Func_7ceb: ; 7ceb (1:7ceb)
	push hl
	inc c
	ld hl, $1c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop hl
	jp Func_7cdf

Func_7cf9: ; 7cf9 (1:7cf9)
	pop af
	push hl
	call GetSRAMBank
	pop hl
	ld a, l
	ret

Func_7d01:
	ld a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld de, $a007
	ld c, $0
Func_7d0e: ; 7d0e (1:7d0e)
	ld a, c
	cp $aa
	jp nc, Func_7d28
	ld a, [de]
	or a
	jp nz, Func_7d1c
	jp Func_7d28

Func_7d1c: ; 7d1c (1:7d1c)
	inc c
	ld hl, $1c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_7d0e

Func_7d28: ; 7d28 (1:7d28)
	pop af
	push bc
	call GetSRAMBank
	pop bc
	ld a, c
	cp $aa
	jp c, Func_7d37
	ld a, $ff
	ret

Func_7d37: ; 7d37 (1:7d37)
	ld a, c
	ret

Func_7d39:
	push af
	ld a, [hSRAMBank]
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $a007
	add hl, de
	ld a, $2
	call GetSRAMBank
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld l, a
	ld a, $aa
	sub l
	jp z, Func_7da6
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, $aa
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $a023
	add hl, de
	push hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $a007
	add hl, de
	pop de
	pop bc
	call CopyFromDEtoHL
Func_7da6: ; 7da6 (1:7da6)
	xor a
	ld [$b283], a
	pop af
	call GetSRAMBank
	pop bc
	ret

Func_7db0: ; 7db0 (1:7db0)
	push de
	add sp, -$40
	push af
	ld a, [hSRAMBank]
	ld l, a
	push hl
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlusParam8
	db $48
	pop de
	ld bc, $23
	call MemCopy
	pop hl
	pop af
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $a007
	add hl, de
	push hl
	ld hl, sp+$42
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$26
	call Func_6493
	ld a, $2
	call GetSRAMBank
	pop de
	ld hl, sp+$25
	ld bc, $1c
	call MemCopy
	pop hl
	ld a, l
	call GetSRAMBank
	add sp, $42
	ret

Func_7dfc: ; 7dfc (1:7dfc)
	add sp, -$24
	push de
	push af
	ld a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $a007
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call Func_6392
	pop hl
	ld a, l
	call GetSRAMBank
	pop de
	push de
	ld hl, sp+$2
	ld bc, $23
	call MemCopy
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_7e4d
	ld hl, $16
	add hl, de
	ld [hl], $e
	jp Func_7e53

Func_7e4d: ; 7e4d (1:7e4d)
	ld hl, $16
	add hl, de
	ld [hl], $0
Func_7e53: ; 7e53 (1:7e53)
	add sp, $24
	ret

Func_7e56:
	add sp, -$24
	push af
	ld a, e
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	call Func_6b55
	pop af
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	call Func_7db0
	add sp, $24
	ret

Func_7e70:
	add sp, -$24
	push de
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	call Func_7dfc
	pop de
	ld a, e
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	call Func_6b74
	add sp, $24
	ret

Func_7e8a:
	push de
	add sp, -$40
	push af
	ld a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	ld de, 849
	call MultiplyHLbyDE
	ld de, $b29f
	add hl, de
	ld c, l
	ld b, h
	xor a
	pop hl
Func_7ea4: ; 7ea4 (1:7ea4)
	cp $d
	jp nc, Func_7eee
	push af
	push hl
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	pop hl
	push bc
	push hl
	ld e, c
	ld d, b
	ld hl, sp+$6
	ld bc, $40
	call CopyFromDEtoHL
	pop hl
	push hl
	ld a, l
	call GetSRAMBank
	ld bc, $40
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlusParam8
	db $4a
	pop de
	call CopyFromDEtoHL
	pop hl
	pop bc
	push hl
	ld hl, $40
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $46
	ld de, $40
	add hl, de
	call WriteHLToSPPlusParam8
	db $46
	pop hl
	pop af
	inc a
	jp Func_7ea4

Func_7eee: ; 7eee (1:7eee)
	push hl
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop de
	ld hl, sp+$2
	ld bc, $11
	call CopyFromDEtoHL
	pop hl
	ld a, l
	call GetSRAMBank
	ld bc, $11
	ld hl, sp+$0
	push hl
	call GetHLAtSPPlusParam8
	db $44
	pop de
	call CopyFromDEtoHL
	add sp, $42
	ret

Func_7f14:
	add sp, -$40
	push de
	push af
	ld a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	ld de, 849
	call MultiplyHLbyDE
	ld de, $b29f
	add hl, de
	ld c, l
	ld b, h
	xor a
	pop hl
	pop de
Func_7f2f: ; 7f2f (1:7f2f)
	cp $d
	jp nc, Func_7f73
	push hl
	push af
	push bc
	push de
	ld a, l
	call GetSRAMBank
	pop de
	pop bc
	push de
	push bc
	ld hl, sp+$8
	ld bc, $40
	call CopyFromDEtoHL
	ld a, $2
	call GetSRAMBank
	pop bc
	push bc
	ld hl, sp+$8
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld bc, $40
	call CopyFromDEtoHL
	pop bc
	ld hl, $40
	add hl, bc
	ld c, l
	ld b, h
	pop de
	ld hl, $40
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	pop hl
	jp Func_7f2f

Func_7f73: ; 7f73 (1:7f73)
	push hl
	push bc
	push de
	ld a, l
	call GetSRAMBank
	pop de
	ld hl, sp+$4
	ld bc, $11
	call CopyFromDEtoHL
	ld a, $2
	call GetSRAMBank
	pop bc
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld bc, $11
	call CopyFromDEtoHL
	pop hl
	ld a, l
	call GetSRAMBank
	add sp, $40
	ret

SECTION "Bank 02", ROMX, BANK [$02]
Func_8000:
	ret

Data_8001: ; $8001
	dr $8001, $8020

Data_8020: ; $8020
	dr $8020, $802a

Data_802a: ; $802a
	dr $802a, $8034

Data_8034: ; $8034
	dr $8034, $8041

Data_8041: ; $8041
	dr $8041, $804c

Func_804c: ; 804c (2:404c)
	add sp, -$64
	ld hl, sp+$52
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_8020
	ld bc, $a
	call MemCopy
	ld hl, sp+$48
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_802a
	ld bc, $a
	call MemCopy
	ld hl, sp+$3b
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_8034
	ld bc, $d
	call MemCopy
	ld hl, sp+$30
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_8041
	ld bc, $b
	call MemCopy
	ld hl, sp+$52
	call WriteHLToSPPlusParam8
	db $5e
	ld hl, sp+$48
	call WriteHLToSPPlusParam8
	db $60
	ld hl, sp+$3b
	call WriteHLToSPPlusParam8
	db $62
	ld hl, sp+$30
	call WriteHLToSPPlusParam8
	db $64
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_8001
	ld bc, $1f
	call MemCopy
	ld hl, sp+$11
	call WriteHLToSPPlus3
	ld hl, $0
	call WriteHLToSPPlus7
	ld hl, $0
	call WriteHLToSPPlus5
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $0d
	ld hl, $4
	call WriteHLToSPPlusParam8
	db $0b
	ld hl, $4
	call WriteHLToSPPlus9
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $11
	ld hl, sp+$5c
	call WriteHLToSPPlusParam8
	db $0f
	set_farcall_addrs_hli Func_174ab
	ld hl, sp+$0
	call FarCall
	add sp, $64
	ret

Func_80f6:
	push de
	push hl
	pop de
	pop hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $5
	add hl, de
	ld l, [hl]
	add l
	cp $3
	jp z, Func_8146
	cp $2
	jp z, Func_8135
	cp $1
	jp z, Func_8124
	or a
	jp nz, Func_814e
	ld c, $0
	ld e, $0
	xor a
	call Func_81cf
	jp Func_814e

Func_8124: ; 8124 (2:4124)
	callba_hli Func_d9f38
	jp Func_814e

Func_8135: ; 8135 (2:4135)
	callba_hli Func_e220d
	jp Func_814e

Func_8146: ; 8146 (2:4146)
	ld c, $1
	ld e, $0
	xor a
	call Func_81cf
Func_814e: ; 814e (2:414e)
	ret

Func_814f:
	ret

Func_8150:
	ret

Data_8151:
	dr $8151, $81c3

Data_81c3
	dr $81c3, $81c9

Data_81c9:
	dr $81c9, $81cf

Func_81cf: ; 81cf (2:41cf)
	push bc
	push bc
	ld a, [wSystemType]
	cp $11
	jp nz, Func_81ea
	set_farcall_addrs_hli Func_c7759
	ld e, $0
	xor a
	call FarCall
Func_81ea: ; 81ea (2:41ea)
	pop bc
	inc c
	dec c
	jp nz, Func_8264
	call Func_1db9
	ld bc, $28
Func_81f6: ; 81f6 (2:41f6)
	ld l, c
	ld h, b
	ld de, $34
	call CompareHLtoDE
	jp nc, Func_820b
	ld hl, $c789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp Func_81f6

Func_820b: ; 820b (2:420b)
	xor a
	ld [wOAM06YCoord], a
	ld a, $1
	ld [$c7e2], a
	set_farcall_addrs_hli Func_e2780
	ld a, $1
	call FarCall
	ld a, $ff
	ld [$c7e0], a
	ld [$c7df], a
	ld a, $3
	ld [$c7e9], a
	ld [$c7e7], a
	ld a, $5
	ld [$c7ea], a
	ld [$c7e8], a
	xor a
	ld [$c7eb], a
	ld a, $2
	ld [$c7ec], a
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	jp Func_831f

Func_8264: ; 8264 (2:4264)
	ld a, c
	cp $1
	jp nz, Func_82a9
	callba_hli Func_56fc2
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	callba_hli Func_9a8c3
	xor a
	ld [$c7be], a
	jp Func_831f

Func_82a9: ; 82a9 (2:42a9)
	push bc
	callba_hli Func_238c8
	ld de, Data_840f
	ld hl, $507
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli Func_51bf3
	pop bc
	ld a, c
	call FarCall
	ld a, $1
	ld [$c7e2], a
	ld bc, $28
Func_82e5: ; 82e5 (2:42e5)
	ld l, c
	ld h, b
	ld de, $34
	call CompareHLtoDE
	jp nc, Func_82fa
	ld hl, $c789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp Func_82e5

Func_82fa: ; 82fa (2:42fa)
	xor a
	ld [wOAM06YCoord], a
	ld a, $ff
	ld [$c7e0], a
	ld [$c7df], a
	ld a, $3
	ld [$c7e9], a
	ld [$c7e7], a
	ld a, $5
	ld [$c7ea], a
	ld [$c7e8], a
	xor a
	ld [$c7eb], a
	ld a, $2
	ld [$c7ec], a
Func_831f: ; 831f (2:431f)
	ld a, $ff
	ld [$c838], a
Func_8324: ; 8324 (2:4324)
	ld a, [$c7eb]
	cp $ff
	jp nz, Func_83d1
	call Func_b6f2
	call Func_3aa8
	callba_hli Func_d9f68
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, $1
	call Func_bbc8
	call Func_b65f
	ld a, $14
	ld [$c7be], a
	callba_hli Func_e220d
	ld hl, sp+$0
	ld [hl], a
	ld a, $ff
	ld [$c7df], a
	ld a, $ff
	ld [$c7e0], a
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp nz, Func_8391
	ld hl, $44
	call Func_aa36
	cp $1
	jp nz, Func_8391
	ld bc, Data_81c3
	jp Func_83ba

Func_8391: ; 8391 (2:4391)
	ld hl, sp+$0
	ld a, [hl]
	cp $e
	jp nz, Func_83aa
	ld hl, $1c
	call Func_aa36
	cp $1
	jp nz, Func_83aa
	ld bc, Data_81c9
	jp Func_83ba

Func_83aa: ; 83aa (2:43aa)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_8151
	add hl, de
	ld c, l
	ld b, h
Func_83ba: ; 83ba (2:43ba)
	ld de, $5e
Func_83bd: ; 83bd (2:43bd)
	ld hl, $63
	call CompareHLtoDE
	jp c, Func_83d1
	ld hl, $c789
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	inc de
	jp Func_83bd

Func_83d1: ; 83d1 (2:43d1)
	xor a
	ld [wVBlankTransferFlags], a
	ld c, $0
.asm_83d6
	ld a, [$c7ec]
	ld e, a
	ld a, [$c7eb]
	call Func_854b
	xor a
	ld [$c7da], a
	set_farcall_addrs_hli Func_daa72
.asm_83ef
	ld a, [$c7ec]
	ld e, a
	ld a, [$c7eb]
	call FarCall
	xor a
	ld [$c798], a
	ld a, [$c84a]
	cp $1
	jp nz, Func_8409
	call Func_90e9
Func_8409: ; 8409 (2:4409)
	call Func_8df1
	jp Func_8324

Data_840f:
	db "<HIRA>なう ろーてﾞぃんくﾞ<KATA>", $00

Data_841d:
	dr $841d, $84f1

Data_84f1:
	dr $84f1, $84f9

Data_84f9:
	dr $84f9, $854b

Func_854b: ; 854b (2:454b)
	push af
	push de
	add sp, -$62
	push bc
	ld hl, sp+$55
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_84f1
	ld bc, $8
	call MemCopy
	ld hl, sp+$3
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_84f9
	ld bc, $52
	call MemCopy
	xor a
	ld [$c7a5], a
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_85e1
	ld hl, $0
	call WriteHalfWordTo
	dw $c85d
	ld hl, $0
	call WriteHalfWordTo
	dw $c830
	call WriteHalfWordTo
	dw $c82e
	call WriteHalfWordTo
	dw $c82c
	call WriteHalfWordTo
	dw $c828
	call WriteHalfWordTo
	dw $c826
	call WriteHalfWordTo
	dw $c822
	call WriteHalfWordTo
	dw $c824
	ld hl, $0
	call WriteHalfWordTo
	dw $c77a
	ld hl, $0
	call WriteHalfWordTo
	dw $c778
	ld hl, $0
	call WriteHalfWordTo
	dw $c774
	ld hl, $0
	call WriteHalfWordTo
	dw $c776
	ld hl, $0
	call WriteHalfWordTo
	dw $c82a
	xor a
	ld [$c84d], a
	ld [$c84c], a
	ld [$c84b], a
	ld a, $1
	ld [$c84a], a
	jp Func_8661

Func_85e1: ; 85e1 (2:45e1)
	call ReadHalfWordAt
	dw $c824
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c824
	call ReadHalfWordAt
	dw $c822
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c822
	call ReadHalfWordAt
	dw $c826
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c826
	call ReadHalfWordAt
	dw $c828
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c828
	call ReadHalfWordAt
	dw $c82c
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82c
	call ReadHalfWordAt
	dw $c82e
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82e
	call ReadHalfWordAt
	dw $c82a
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82a
	call ReadHalfWordAt
	dw $c85d
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c85d
Func_8661: ; 8661 (2:4661)
	set_farcall_addrs_hli Func_c7ae6
	ld hl, sp+$64
	ld e, [hl]
	ld hl, sp+$67
	ld a, [hl]
	call FarCall
	ld a, l
	ld hl, sp+$5d
	ld [hl], a
	ld hl, $200
	call Func_be4d
	call WriteHalfWordTo
	dw $c824
	ld hl, $200
	call Func_be4d
	call WriteHalfWordTo
	dw $c822
	ld hl, $80
	call Func_be4d
	call WriteHalfWordTo
	dw $c826
	ld hl, $80
	call Func_be4d
	call WriteHalfWordTo
	dw $c844
	ld hl, $e0
	call Func_be4d
	call WriteHalfWordTo
	dw $c85d
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	and $7
	ld e, a
	ld d, $0
	ld hl, sp+$55
	add hl, de
	ld a, [hl]
	ld [$c859], a
	ld hl, sp+$5d
	ld a, [hl]
	call Func_8d2a
	ld a, $7
	ld [wFarCallDestBank], a
	ld bc, $3
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	and $7
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5e
	call FarCopyVideoData
	ld hl, $728
	push hl
	call Func_be4d
	call WriteHalfWordTo
	dw $c85b
	ld hl, sp+$60
	ld a, [hl]
	add $7
	ld [wFarCallDestBank], a
	pop bc
	call ReadHalfWordAt
	dw $c85b
	push hl
	call GetHLAtSPPlusParam8
	db $63
	pop de
	call FarDecompressVideoData
	call ReadHalfWordAt
	dw $c85b
	ld de, $2a8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $400
	add hl, de
	push hl
	ld hl, $154
	call Func_be4d
	call WriteHalfWordTo
	dw $c842
	ld bc, $154
	ld e, $ff
	call ReadHalfWordAt
	dw $c842
	call FillMemory
	ld a, [$c7da]
	or a
	jp nz, Func_8752
	call Func_b6f2
	xor a
	call Func_bbc8
	jp Func_875d

Func_8752: ; 8752 (2:4752)
	ld e, $ff
	ld a, $ff
	call Func_b60d
	xor a
	call Func_bbc8
Func_875d: ; 875d (2:475d)
	ld a, $ff
	ld [$c81f], a
	ld hl, sp+$4
	ld [hl], $ff
	ld bc, $0
Func_8769: ; 8769 (2:4769)
	ld l, c
	ld h, b
	ld de, $52
	call CompareHLtoDE
	jp nc, Func_87b9
	ld hl, sp+$69
	ld a, [hl]
	ld hl, sp+$5
	add hl, bc
	cp [hl]
	jp nz, Func_87b4
	ld hl, sp+$66
	ld a, [hl]
	ld hl, sp+$6
	add hl, bc
	cp [hl]
	jp nz, Func_87b4
	ld hl, sp+$5f
	ld e, [hl]
	ld d, $0
	ld hl, $441d
	add hl, de
	ld a, [hl]
	and $7
	cp $4
	jp z, Func_87a0
	ld hl, sp+$4
	ld [hl], $7
	jp Func_87a4

Func_87a0: ; 87a0 (2:47a0)
	ld hl, sp+$4
	ld [hl], $27
Func_87a4: ; 87a4 (2:47a4)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	call ReadHalfWordAt
	dw $c844
	add hl, de
	ld [hl], $1
	jp Func_87b9

Func_87b4: ; 87b4 (2:47b4)
	inc bc
	inc bc
	jp Func_8769

Func_87b9: ; 87b9 (2:47b9)
	call Func_898a
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp z, Func_87ca
	ld hl, sp+$4
	ld a, [hl]
	call Func_a184
Func_87ca: ; 87ca (2:47ca)
	pop de
	call ReadHalfWordAt
	dw $c826
	ld bc, $80
	call CopyFromDEtoHL
	call ReadHalfWordAt
	dw $c842
	call Func_be5d
	call ReadHalfWordAt
	dw $c844
	call Func_be5d
	call ReadHalfWordAt
	dw $c85b
	call Func_be5d
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_8827
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c2d7]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	call Func_be4d
	call WriteHalfWordTo
	dw $c830
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c2d7]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld e, $0
	call ReadHalfWordAt
	dw $c830
	call FillMemory
Func_8827: ; 8827 (2:4827)
	ld a, [$c7e8]
	ld e, a
	ld a, [$c7e7]
	call Func_b530
	xor a
	call Func_be77
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	ld b, $8
	call DivideAbyB
	ld [$c867], a
	xor a
	ld [$c837], a
	ld [$c836], a
	ld [$c835], a
	ld [$c834], a
	ld [$c833], a
	ld [$c832], a
	ld [$c821], a
	xor a
	ld [$c83a], a
	xor a
	ld [$c858], a
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_8894
	call Func_a24c
	call Func_aff1
	call Func_aca6
	call Func_b773
	call Func_b407
	call Func_9d31
	call Func_bf2c
	ld a, $ff
	call Func_bf46
	callba_hli Func_9b251
Func_8894: ; 8894 (2:4894)
	ld a, $1
	call Func_b52c
	callba_hli Func_da07a
	ld hl, sp+$5e
	ld [hl], $40
	ld hl, sp+$5f
	ld [hl], $0
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$5e
	call FarCall
	callba_hli Func_da4fc
	call ReadHalfWordAt
	dw $c82e
	ld a, l
	or h
	jp z, Func_88df
	call ReadHalfWordAt
	dw $c82e
	call Func_be5d
Func_88df: ; 88df (2:48df)
	pop bc
	ld a, c
	cp $1
	jp nz, Func_88f8
	ld a, $ff
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_0465
Func_88f8: ; 88f8 (2:48f8)
	ld a, [$c7ea]
	ld l, a
	push hl
	ld a, [$c7e9]
	ld c, a
	ld a, [$c7e8]
	ld e, a
	ld a, [$c7e7]
	call Func_b377
	pop bc
	ld [$c838], a
	ld a, [$c838]
	cp $ff
	jp nz, Func_891c
	ld a, $2
	ld [$c838], a
Func_891c: ; 891c (2:491c)
	call Func_8ccf
	call Func_bfaf
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, hPushOAM + 5
	add hl, de
	call WriteHalfWordTo
	dw $c868
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, hPushOAM + 5
	add hl, de
	call WriteHalfWordTo
	dw $c86e
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, hPushOAM + 4
	add hl, de
	call WriteHalfWordTo
	dw $c86c
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, $6
	add hl, de
	call WriteHalfWordTo
	dw $c86a
	add sp, $66
	ret

Func_898a: ; 898a (2:498a)
	push bc
	push de
	push hl
	ld a, [$c85b]
	ld l, a
	ld a, [$c85c]
	ld h, a
	ld bc, $2a8
	add hl, bc
	ld a, l
	ld [$c88c], a
	ld a, h
	ld [$c88d], a
	xor a
	ld [$c889], a
	ld [$c890], a
	ld [$c891], a
Func_89ab: ; 89ab (2:49ab)
	ld a, [$c890]
	ld l, a
	ld a, [$c891]
	ld h, a
	ld bc, $200
	ld a, h
	cp b
	jr c, .asm_89bf
	ld a, l
	cp c
	jp nc, Func_8b2c
.asm_89bf
	push hl
	srl h
	rr l
	srl h
	rr l
	ld a, [$c844]
	ld c, a
	ld a, [$c845]
	ld b, a
	add hl, bc
	ld a, [hl]
	cp $1
	pop hl
	jp nz, Func_8aa2
	ld a, [$c88c]
	ld c, a
	ld a, [$c88d]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [$c88e], a
	ld a, [hli]
	ld b, a
	ld [$c88f], a
	ld a, [$c842]
	ld l, a
	ld a, [$c843]
	ld h, a
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_8a65
	ld a, [$c889]
	cp $70
	jp nc, Func_8b2c
	ld [hl], a
	ld h, b
	ld l, c
	ld a, [$c85b]
	ld c, a
	ld a, [$c85c]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [$c88e], a
	ld a, [hli]
	ld b, a
	ld [$c88f], a
	ld a, [$c889]
	ld l, a
	ld h, $0
	add hl, hl
	ld a, [$c85d]
	ld e, a
	ld a, [$c85e]
	ld d, a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, [wSystemType]
	cp $11
	jr nz, .asm_8a37
	ld a, $39
	jr .asm_8a39

.asm_8a37
	ld a, $6
.asm_8a39
	ld [wFarCallDestBank], a
	ld h, b
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $4000
	add hl, de
	ld d, h
	ld e, l
	ld a, [$c889]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $8900
	add hl, bc
	ld bc, $10
	call FarCopyVideoData
	ld a, [$c889]
	inc a
	ld [$c889], a
	jr .asm_8a7b

.asm_8a65
	ld h, b
	ld l, c
	add hl, hl
	ld a, [$c85b]
	ld e, a
	ld a, [$c85c]
	ld d, a
	add hl, de
	ld a, [hli]
	ld c, a
	ld [$c88e], a
	ld a, [hli]
	ld b, a
	ld [$c88f], a
.asm_8a7b
	ld a, [$c890]
	ld l, a
	ld a, [$c891]
	ld h, a
	add hl, hl
	ld a, [$c88c]
	ld e, a
	ld a, [$c88d]
	ld d, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [$c842]
	ld l, a
	ld a, [$c843]
	ld h, a
	add hl, de
	ld a, [hl]
	add $90
	ld [$c88b], a
	jr asm_8ad9

Func_8aa2: ; 8aa2 (2:4aa2)
	ld a, [$c890]
	ld l, a
	ld a, [$c891]
	ld h, a
	ld a, [$c88c]
	ld c, a
	ld a, [$c88d]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [$c88e], a
	ld a, [hli]
	ld b, a
	ld [$c88f], a
	ld h, b
	ld l, c
	ld a, [$c85b]
	ld c, a
	ld a, [$c85c]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [$c88e], a
	ld a, [hli]
	ld b, a
	ld [$c88f], a
	ld a, $fe
	ld a, [$c88b]
asm_8ad9
	ld a, [$c890]
	ld c, a
	ld a, [$c891]
	ld b, a
	ld a, [$c822]
	ld l, a
	ld a, [$c823]
	ld h, a
	add hl, bc
	ld a, [$c88b]
	ld [hl], a
	ld a, $36
	ld [wFarCallDestBank], a
	ld a, [$c88e]
	ld l, a
	ld a, [$c88f]
	ld h, a
	ld bc, $53e8
	add hl, bc
	ld d, h
	ld e, l
	ld a, [$c890]
	ld c, a
	ld a, [$c891]
	ld b, a
	ld a, [$c824]
	ld l, a
	ld a, [$c825]
	ld h, a
	add hl, bc
	ld bc, $1
	call FarCopyVideoData
	ld a, [$c890]
	ld c, a
	ld a, [$c891]
	ld b, a
	inc bc
	ld a, c
	ld [$c890], a
	ld a, b
	ld [$c891], a
	jp Func_89ab

Func_8b2c: ; 8b2c (2:4b2c)
	pop hl
	pop de
	pop bc
	ret

Func_8b30: ; 8b30 (2:4b30)
	ld bc, $0
Func_8b33: ; 8b33 (2:4b33)
	ld l, c
	ld h, b
	ld de, $70
	call CompareHLtoDE
	jp nc, Func_8ba7
	ld l, c
	ld h, b
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c85d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [wSystemType]
	cp $11
	jp nz, Func_8b7e
	push bc
	ld a, $39
	ld [wFarCallDestBank], a
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $4000
	add hl, de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
	jp Func_8ba3

Func_8b7e: ; 8b7e (2:4b7e)
	push bc
	ld a, $6
	ld [wFarCallDestBank], a
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $4000
	add hl, de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
Func_8ba3: ; 8ba3 (2:4ba3)
	inc bc
	jp Func_8b33

Func_8ba7: ; 8ba7 (2:4ba7)
	ret

Func_8ba8:
	push af
	push bc
	call Func_b6f2
	ld a, [$c2d8]
	add a
	add a
	add a
	add a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [$c2d9]
	add a
	add a
	add a
	add a
	ld [wSCY2], a
	ld [wSCY], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	xor a
	call Func_bbc8
	call Func_8b30
	ld hl, sp+$0
	ld [hl], $0
Func_8bdc: ; 8bdc (2:4bdc)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, $c772
	cp [hl]
	jp nc, Func_8c16
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	or $80
	ld e, a
	ld hl, sp+$0
	ld a, [hl]
	call Func_a6d8
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_8bdc

Func_8c16: ; 8c16 (2:4c16)
	call Func_8ccf
	ld a, [wVideoTransferRequestFlags + 1]
	ld hl, $c7be
	cp [hl]
	jp z, Func_8c29
	ld a, [$c7be]
	call Func_14fc
Func_8c29: ; 8c29 (2:4c29)
	ld a, [$c7da]
	or a
	jp nz, Func_8c65
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_8c57
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	jp Func_8c5f

Func_8c57: ; 8c57 (2:4c57)
	ld e, $0
	ld a, [$c838]
	call Func_9d80
Func_8c5f: ; 8c5f (2:4c5f)
	call Func_b65f
	jp Func_8cc8

Func_8c65: ; 8c65 (2:4c65)
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_8c8c
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	jp Func_8c94

Func_8c8c: ; 8c8c (2:4c8c)
	ld e, $0
	ld a, [$c838]
	call Func_9d80
Func_8c94: ; 8c94 (2:4c94)
	ld a, [wSystemType]
	cp $11
	jp z, Func_8cc1
	set_farcall_addrs_hli Func_c7bd0
	ld a, [$c867]
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_8cc1: ; 8cc1 (2:4cc1)
	ld e, $fe
	ld a, $fe
	call Func_b60d
Func_8cc8: ; 8cc8 (2:4cc8)
	pop bc
	pop bc
	ret

Data_8ccb:
	dr $8ccb, $8ccf

Func_8ccf: ; 8ccf (2:4ccf)
	call Func_bfaf
	ld hl, Data_8ccb
	ld a, [$c838]
	cp $ff
	jp nz, Func_8ce3
	ld de, $2
	jp Func_8ce9

Func_8ce3: ; 8ce3 (2:4ce3)
	ld a, [$c838]
	ld e, a
	ld d, $0
Func_8ce9: ; 8ce9 (2:4ce9)
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82a
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	call Func_bfaf
	ret

Func_8d0c: ; 8d0c (2:4d0c)
	push bc
	push de
	push hl
	ld b, $0
.asm_8d11
	ld a, [hli]
	ld c, a
	push hl
	ld a, [$c844]
	ld l, a
	ld a, [$c845]
	ld h, a
	add hl, bc
	ld a, $1
	ld [hl], a
	pop hl
	dec de
	ld a, e
	or d
	jr nz, .asm_8d11
	pop hl
	pop de
	pop bc
	ret

Func_8d2a: ; 8d2a (2:4d2a)
	push bc
	push bc
	push bc
	push af
	ld a, $a
	ld [wFarCallDestBank], a
	pop af
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$6
	ld a, [hl]
	ld [$c2d6], a
	ld hl, sp+$5
	ld a, [hl]
	ld [$c2d7], a
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push hl
	call Func_be4d
	call WriteHalfWordTo
	dw $c828
	ld hl, sp+$4
	ld a, [hl]
	add $a
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw $c828
	push hl
	call GetHLAtSPPlus9
	pop de
	call FarDecompressVideoData
	ld bc, $80
	ld e, $0
	call ReadHalfWordAt
	dw $c844
	call FillMemory
	call ReadHalfWordAt
	dw $c828
	ld c, l
	ld b, h
	pop hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call Func_8d0c
	pop af
	cp $24
	jp z, Func_8dbd
	cp $8f
	jp z, Func_8dbd
	call ReadHalfWordAt
	dw $c844
	ld a, [$c859]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $1
Func_8dbd: ; 8dbd (2:4dbd)
	call ReadHalfWordAt
	dw $c844
	ld [hl], $1
	pop bc
	pop bc
	pop bc
	ret

Func_8dc8:
	ld a, $50
	ld hl, wSCX
	sub [hl]
	ld l, a
	ld a, [$c832]
	add a
	add a
	add a
	add a
	add l
	add $10
	ld [$c2cb], a
	ld a, $50
	ld hl, wSCY
	sub [hl]
	ld l, a
	ld a, [$c833]
	add a
	add a
	add a
	add a
	add l
	add $8
	ld [$c2cc], a
	ret

Func_8df1: ; 8df1 (2:4df1)
	call ReadHalfWordAt
	dw $c85d
	ld a, l
	or h
	jp z, Func_8e0b
	call ReadHalfWordAt
	dw $c85d
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c85d
Func_8e0b: ; 8e0b (2:4e0b)
	call ReadHalfWordAt
	dw $c824
	ld a, l
	or h
	jp z, Func_8e25
	call ReadHalfWordAt
	dw $c824
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c824
Func_8e25: ; 8e25 (2:4e25)
	call ReadHalfWordAt
	dw $c822
	ld a, l
	or h
	jp z, Func_8e3f
	call ReadHalfWordAt
	dw $c822
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c822
Func_8e3f: ; 8e3f (2:4e3f)
	call ReadHalfWordAt
	dw $c826
	ld a, l
	or h
	jp z, Func_8e59
	call ReadHalfWordAt
	dw $c826
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c826
Func_8e59: ; 8e59 (2:4e59)
	call ReadHalfWordAt
	dw $c828
	ld a, l
	or h
	jp z, Func_8e73
	call ReadHalfWordAt
	dw $c828
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c828
Func_8e73: ; 8e73 (2:4e73)
	call ReadHalfWordAt
	dw $c830
	ld a, l
	or h
	jp z, Func_8e8d
	call ReadHalfWordAt
	dw $c830
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c830
Func_8e8d: ; 8e8d (2:4e8d)
	call ReadHalfWordAt
	dw $c82a
	ld a, l
	or h
	jp z, Func_8ea7
	call ReadHalfWordAt
	dw $c82a
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82a
Func_8ea7: ; 8ea7 (2:4ea7)
	call ReadHalfWordAt
	dw $c82c
	ld a, l
	or h
	jp z, Func_8ec1
	call ReadHalfWordAt
	dw $c82c
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82c
Func_8ec1: ; 8ec1 (2:4ec1)
	call ReadHalfWordAt
	dw $c82e
	ld a, l
	or h
	jp z, Func_8edb
	call ReadHalfWordAt
	dw $c82e
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c82e
Func_8edb: ; 8edb (2:4edb)
	call ReadHalfWordAt
	dw $c77a
	ld a, l
	or h
	jp z, Func_8ef5
	call ReadHalfWordAt
	dw $c77a
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c77a
Func_8ef5: ; 8ef5 (2:4ef5)
	call ReadHalfWordAt
	dw $c778
	ld a, l
	or h
	jp z, Func_8f0f
	call ReadHalfWordAt
	dw $c778
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c778
Func_8f0f: ; 8f0f (2:4f0f)
	call ReadHalfWordAt
	dw $c774
	ld a, l
	or h
	jp z, Func_8f29
	call ReadHalfWordAt
	dw $c774
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c774
Func_8f29: ; 8f29 (2:4f29)
	call ReadHalfWordAt
	dw $c776
	ld a, l
	or h
	jp z, Func_8f43
	call ReadHalfWordAt
	dw $c776
	call Func_be5d
	ld hl, $0
	call WriteHalfWordTo
	dw $c776
Func_8f43: ; 8f43 (2:4f43)
	ret

Func_8f44: ; 8f44 (2:4f44)
	add sp, -$30
	ld a, [rLCDC]
	and $80
	jp nz, Func_8f50
	jp Func_90e6

Func_8f50: ; 8f50 (2:4f50)
	ld a, [$c2cd]
	or a
	jp z, Func_8f5c
	ld a, $98
	jp Func_8f5e

Func_8f5c: ; 8f5c (2:4f5c)
	ld a, $9c
Func_8f5e: ; 8f5e (2:4f5e)
	ld [wSCY2 + 1], a
	ld a, $1
	call Func_bbc8
	ld e, $0
Func_8f68: ; 8f68 (2:4f68)
	ld a, e
	cp $b
	jp nc, Func_9014
	ld l, $0
Func_8f70: ; 8f70 (2:4f70)
	ld a, l
	cp $c
	jp nc, Func_8fca
	push de
	push hl
	ld a, [$c2d9]
	add e
	dec a
	ld e, a
	ld a, [$c2d8]
	add l
	dec a
	call Func_9eb4
	ld c, l
	ld b, h
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1c
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1d
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	inc l
	pop de
	jp Func_8f70

Func_8fca: ; 8fca (2:4fca)
	push de
	call Func_bfaf
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$2
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1e
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$1a
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1f
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	call Func_bfaf
	pop de
	inc e
	jp Func_8f68

Func_9014: ; 9014 (2:5014)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_90d6
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld e, $0
Func_9024: ; 9024 (2:5024)
	ld a, e
	cp $b
	jp nc, Func_90d0
	ld l, $0
Func_902c: ; 902c (2:502c)
	ld a, l
	cp $c
	jp nc, Func_9086
	push de
	push hl
	ld a, [$c2d9]
	add e
	dec a
	ld e, a
	ld a, [$c2d8]
	add l
	dec a
	call Func_9f1e
	ld c, l
	ld b, h
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1c
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1d
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	inc l
	pop de
	jp Func_902c

Func_9086: ; 9086 (2:5086)
	push de
	call Func_bfaf
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$2
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1e
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$1a
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1f
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	call Func_bfaf
	pop de
	inc e
	jp Func_9024

Func_90d0: ; 90d0 (2:50d0)
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_90d6: ; 90d6 (2:50d6)
	ld a, [$c2cd]
	or a
	jp nz, Func_90e2
	ld a, $1
	jp Func_90e3

Func_90e2: ; 90e2 (2:50e2)
	xor a
Func_90e3: ; 90e3 (2:50e3)
	call Func_3cb8
Func_90e6: ; 90e6 (2:50e6)
	add sp, $30
	ret

Func_90e9: ; 90e9 (2:50e9)
	add sp, -$10
	ld a, $ff
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	ld hl, sp+$e
	ld [hl], $ff
Func_90fe: ; 90fe (2:50fe)
	ld a, [$c84a]
	cp $1
	jp nz, Func_9413
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, Func_9111
	call Func_0465
Func_9111: ; 9111 (2:5111)
	call Func_b44d
	ld hl, sp+$e
	ld [hl], a
	call ReadHalfWordAt
	dw $c83c
	ld a, l
	or h
	jp z, Func_9134
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, Func_9134
	ld hl, $0
	call WriteHalfWordTo
	dw $c83c
	jp Func_9413

Func_9134: ; 9134 (2:5134)
	ld e, $ff
	ld hl, sp+$e
	ld a, [hl]
	and $4
	jp z, Func_9146
	xor a
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9146: ; 9146 (2:5146)
	ld hl, sp+$e
	ld a, [hl]
	and $8
	jp z, Func_9157
	ld a, $2
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9157: ; 9157 (2:5157)
	ld hl, sp+$e
	ld a, [hl]
	and $2
	jp z, Func_9168
	ld a, $3
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9168: ; 9168 (2:5168)
	ld hl, sp+$e
	ld a, [hl]
	and $1
	jp z, Func_9179
	ld a, $1
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9179: ; 9179 (2:5179)
	push de
	ld a, [$c838]
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_b150
	pop de
Func_918e: ; 918e (2:518e)
	push de
	ld a, [$c839]
	ld hl, $c838
	cp [hl]
	jp z, Func_91ba
	ld e, $0
	ld a, [$c838]
	call Func_9d80
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_8ccf
	ld a, [$c838]
	ld [$c839], a
Func_91ba: ; 91ba (2:51ba)
	call Func_8dc8
	pop de
	ld hl, sp+$e
	ld a, [hl]
	and $10
	jp z, Func_91f0
	ld e, $4
	ld a, [$c838]
	ld e, a
	ld a, $2
	call Func_a783
	ld a, [$c84a]
	or a
	jp nz, Func_91db
	jp Func_9413

Func_91db: ; 91db (2:51db)
	callba_hli Func_9b326
	ld hl, sp+$e
	ld [hl], $ff
	jp Func_90fe

Func_91f0: ; 91f0 (2:51f0)
	ld hl, sp+$e
	ld a, [hl]
	and $40
	jp z, Func_930d
	push de
	ld hl, $0
	push hl
	ld a, $3
	ld [wOAM26VTile], a
	call Func_bf05
	call Func_bf12
	pop hl
	ld a, l
	or h
	jp nz, Func_9222
	set_farcall_addrs_hli Func_da901
	ld de, $1403
	ld hl, $0
	call FarCall
Func_9222: ; 9222 (2:5222)
	push hl
	ld hl, sp+$4
	ld [hl], $ff
Func_9227: ; 9227 (2:5227)
	call Func_3d15
	and $40
	jp z, Func_92f7
	call Func_0465
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$5
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$9
	cp [hl]
	jp nz, Func_924e
	jp Func_9227

Func_924e: ; 924e (2:524e)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld e, $1
	ld a, $2
	call SetStringStartState
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $14
	ld hl, $0
	call FarCall
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld de, $784
	add hl, de
	push hl
	ld hl, Data_9416
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$8
	ld a, [hl]
	cp $a
	jp nc, Func_92ab
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9420
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_92ba

Func_92ab: ; 92ab (2:52ab)
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9425
	push hl
	call PlaceString
	pop bc
	pop bc
Func_92ba: ; 92ba (2:52ba)
	ld hl, sp+$9
	ld a, [hl]
	cp $a
	jp nc, Func_92d4
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9429
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_92e3

Func_92d4: ; 92d4 (2:52d4)
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_942d
	push hl
	call PlaceString
	pop bc
	pop bc
Func_92e3: ; 92e3 (2:52e3)
	ld a, $1
	ld [wOAM26VTile], a
	ld l, $3
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp Func_9227

Func_92f7: ; 92f7 (2:52f7)
	call Func_8f44
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	pop de
	jp Func_93c0

Func_930d: ; 930d (2:530d)
	ld hl, sp+$e
	ld a, [hl]
	and $80
	jp z, Func_93c0
	push de
	callba_hli Func_da4dc
	ld a, [$c7da]
	or a
	jp z, Func_9371
	xor a
	ld [wOBP0], a
	ld [wBGP], a
	xor a
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Func_bfaf
	call Func_3aa8
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, $e0
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Func_bfaf
	set_farcall_addrs_hli Func_c7bd0
	ld a, [$c867]
	call FarCall
Func_9371: ; 9371 (2:5371)
	ld hl, sp+$c
	ld a, [$c7e7]
	ld [hl], a
	ld hl, sp+$d
	ld a, [$c7e8]
	ld [hl], a
	ld hl, sp+$e
	ld a, [$c7e9]
	ld [hl], a
	ld hl, sp+$f
	ld a, [$c7ea]
	ld [hl], a
	ld a, [$c85f]
	ld [$c7e7], a
	ld a, [$c860]
	ld [$c7e8], a
	ld a, [$c85f]
	ld [$c7e9], a
	ld a, [$c860]
	ld [$c7ea], a
	callba_hli Func_14675
	pop de
	ld a, [$c84a]
	or a
	jp nz, Func_93ba
	jp Func_9413

Func_93ba: ; 93ba (2:53ba)
	push de
	xor a
	call Func_8ba8
	pop de
Func_93c0: ; 93c0 (2:53c0)
	ld a, e
	cp $ff
	jp nz, Func_93cd
	ld hl, sp+$e
	ld [hl], $ff
	jp Func_90fe

Func_93cd: ; 93cd (2:53cd)
	ld e, $0
	ld a, [$c838]
	call Func_943f
	ld a, [$c838]
	ld e, a
	xor a
	call Func_a783
	ld a, [$c84a]
	or a
	jp nz, Func_93e7
	jp Func_9413

Func_93e7: ; 93e7 (2:53e7)
	call Func_ad56
	cp $1
	jp nz, Func_93f2
	jp Func_9413

Func_93f2: ; 93f2 (2:53f2)
	call Func_b821
	cp $1
	jp z, Func_9409
	cp $ff
	jp z, Func_9406
	or a
	jp nz, Func_940c
	jp Func_9413

Func_9406: ; 9406 (2:5406)
	jp Func_940c

Func_9409: ; 9409 (2:5409)
	jp Func_90fe

Func_940c: ; 940c (2:540c)
	ld hl, sp+$e
	ld [hl], $0
	jp Func_90fe

Func_9413: ; 9413 (2:5413)
	add sp, $10
	ret

Data_9416:
	TX_SNUM
	db "/"
	TX_SNUM
	db "/"
	TX_SNUM
	db " ", $00

Data_9420:
	db "0"
	TX_SNUM
	db ":", $00

Data_9425:
	TX_SNUM
	db ":", $00

Data_9429:
	db "0"
	TX_SNUM
	db $00

Data_942d:
	TX_SNUM
	db $00

Func_9430:
	callba_hli Func_17e91
	ret

Func_943f: ; 943f (2:543f)
	push bc
	push de
	push hl
	ld b, a
	ld c, e
	push af
	ld a, [$c86c]
.asm_9447
	ld [$c872], a
	ld a, [$c86d]
	ld [$c873], a
.asm_9450
	ld a, [$c86a]
	ld [$c870], a
	ld a, [$c86b]
	ld [$c871], a
	ld a, $1
	ld [$c87d], a
	pop af
	push bc
	call Func_99e3
	pop bc
	cp $ff
	jr nz, .asm_9470
	xor a
	ld [$c87d], a
.asm_9470
	push bc
	push de
	push hl
	ld a, [$c838]
	ld e, a
	ld a, $1
	call Func_a783
	pop hl
	pop de
	pop bc
	cp $0
	jr nz, .asm_9487
	xor a
	ld [$c87d], a
.asm_9487
	ld a, [$c84a]
	or a
	jr nz, .asm_94ae
	push bc
	push de
	ld a, [$c838]
	ld e, $0
	call Func_9d80
	pop de
	pop bc
	di
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ei
	jp Func_99de

.asm_94ae
	ld a, [$c85f]
	ld d, a
	ld a, [$c860]
	ld e, a
	ld a, b
	cp $0
	jr z, .asm_94c7
	cp $1
	jr z, .asm_94d2
	cp $2
	jr z, .asm_94d8
	cp $3
	jr z, .asm_94e1
.asm_94c7
	dec e
	ld a, [$c2d6]
	cpl
	ld l, a
	ld h, $ff
	inc hl
	jr .asm_94e5

.asm_94d2
	inc d
	ld hl, $1
	jr .asm_94e5

.asm_94d8
	inc e
	ld a, [$c2d6]
	ld l, a
	ld h, $0
	jr .asm_94e5

.asm_94e1
	dec d
	ld hl, -1
.asm_94e5
	push bc
	push de
	push hl
	ld a, d
	ld c, $0
	call Func_9f87
	pop hl
	pop de
	pop bc
	cp $ff
	jr nz, .asm_94f9
	xor a
	ld [$c87d], a
.asm_94f9
	ld a, [$c7e1]
	cp $2
	jr z, .asm_9508
	cp $3
	jr z, .asm_9508
	ld a, $1
	jr .asm_950a

.asm_9508
	ld a, $2
.asm_950a
	ld [$c87c], a
	ld a, [$c858]
	cp $0
	jr nz, .asm_952e
	ld a, [$c857]
	cp $ff
	jr z, .asm_952e
	push bc
	push de
	call Func_9f4c
	pop de
	pop bc
	ld h, a
	ld a, [$c857]
	cp h
	jr nz, .asm_952e
	ld a, $1
	ld [$c858], a
.asm_952e
	ld a, c
	cp $1
	jr z, .asm_9536
	xor a
	jr .asm_9538

.asm_9536
	ld a, $1
.asm_9538
	ld [$c84b], a
	ld a, [wSCX]
	srl a
	srl a
	srl a
	ld h, a
	ld a, [wSCY]
	srl a
	srl a
	srl a
	ld l, a
	ld a, b
	or a
	jr z, .asm_955c
	dec a
	jr z, .asm_9566
	dec a
	jr z, .asm_9570
	dec a
	jr z, .asm_957a
.asm_955c
	ld a, h
	sub $2
	ld h, a
	ld a, l
	sub $4
	ld l, a
	jr .asm_9584

.asm_9566
	ld a, h
	add $16
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .asm_9584

.asm_9570
	ld a, h
	sub $2
	ld h, a
	ld a, l
	add $14
	ld l, a
	jr .asm_9584

.asm_957a
	ld a, h
	sub $4
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .asm_9584

.asm_9584
	ld a, c
	cp $1
	jr z, .asm_95a3
	push hl
	ld a, [$c83c]
	ld l, a
	ld a, [$c83d]
	or l
	pop hl
	jr nz, .asm_95a3
	ld a, [$c87d]
	cp $1
	jr z, .asm_95a8
	ld a, $33
	call Func_1502
	jr .asm_95a8

.asm_95a3
	ld a, $1
	ld [$c87d], a
.asm_95a8
	ld c, $0
Func_95aa: ; 95aa (2:55aa)
	ld a, [$c87d]
	cp $0
	jp z, Func_9844
	push hl
	push bc
	ld a, h
	and $1f
	ld b, $0
	ld c, a
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [$c2cd]
	cp $0
	jr z, .asm_95d2
	bcbgcoord 0, 0, vWindowMap
	jr .asm_95d5

.asm_95d2
	bcbgcoord 0, 0
.asm_95d5
	add hl, bc
	pop bc
	ld a, b
	or a
	jr z, .asm_95e7
	dec a
	jp z, Func_9678
	dec a
	jp z, Func_9716
	dec a
	jp z, Func_97a7
.asm_95e7
	ld a, c
	cp $c
	jp nc, Func_9670
	push bc
	push hl
	ld a, [$c868]
	add c
	ld l, a
	ld a, [$c869]
	adc $0
	ld h, a
	ld a, [$c2d9]
	sub $2
	ld e, a
	ld a, [$c2d8]
	add c
	dec a
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_961b
	and $2
	jr z, .asm_9641
.asm_961b
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9665

.asm_9641
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9665
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
Func_9670: ; 9670 (2:5670)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp Func_9844

Func_9678: ; 9678 (2:5678)
	push bc
	push hl
	ld a, [$c870]
	ld l, a
	ld a, [$c871]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [$c2d6]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [$c870], a
	ld a, h
	ld [$c871], a
	pop de
	pop hl
	ld a, [$c2d9]
	sub $1
	add c
	ld e, a
	ld a, [$c2d8]
	add $b
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_96b9
	and $2
	jr z, .asm_96df
.asm_96b9
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9703

.asm_96df
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9703
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
	pop hl
	ld a, l
	add $2
	ld l, a
	jp Func_9844

Func_9716: ; 9716 (2:5716)
	ld a, c
	cp $c
	jp nc, Func_979f
	push bc
	push hl
	ld a, [$c86e]
	add c
	ld l, a
	ld a, [$c86f]
	adc $0
	ld h, a
	ld a, [$c2d9]
	add $a
	ld e, a
	ld a, [$c2d8]
	add c
	dec a
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_974a
	and $2
	jr z, .asm_9770
.asm_974a
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9794

.asm_9770
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9794
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
Func_979f: ; 979f (2:579f)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp Func_9844

Func_97a7: ; 97a7 (2:57a7)
	push bc
	push hl
	ld a, [$c872]
	ld l, a
	ld a, [$c873]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [$c2d6]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [$c872], a
	ld a, h
	ld [$c873], a
	pop de
	pop hl
	ld a, [$c2d9]
	sub $1
	add c
	ld e, a
	ld a, [$c2d8]
	sub $2
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_97e8
	and $2
	jr z, .asm_980e
.asm_97e8
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9832

.asm_980e
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wVBlankTransferFlags + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wVBlankTransferFlags + 2]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9832
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
	pop hl
	ld a, l
	add $2
	ld l, a
	jr Func_9844

Func_9844: ; 9844 (2:5844)
	ld a, [$c87c]
	cp $1
	jr z, .asm_9853
	ld a, c
	and $1
	jr z, .asm_9853
	jp Func_9900

.asm_9853
	push bc
	push hl
	call Func_0465
	call Func_8dc8
	pop hl
	pop bc
	ld a, [$c87d]
	cp $0
	jp z, Func_98f3
	ld a, b
	cp $0
	jr z, .asm_9876
	cp $1
	jr z, .asm_9894
	cp $2
	jr z, .asm_98b2
	cp $3
	jr z, .asm_98d0
.asm_9876
	ld a, [$c87c]
	ld e, a
	ld a, [wSCY]
	sub e
	ld [wSCY], a
	ld [wSCY2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84d]
	inc a
	ld [$c84d], a
	jr .asm_98ee

.asm_9894
	ld a, [$c87c]
	ld e, a
	ld a, [wSCX]
	add e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84c]
	dec a
	ld [$c84c], a
	jr .asm_98ee

.asm_98b2
	ld a, [$c87c]
	ld e, a
	ld a, [wSCY]
	add e
	ld [wSCY], a
	ld [wSCY2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84d]
	dec a
	ld [$c84d], a
	jr .asm_98ee

.asm_98d0
	ld a, [$c87c]
	ld e, a
	ld a, [wSCX]
	sub e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84c]
	inc a
	ld [$c84c], a
	jr .asm_98ee

.asm_98ee
	ld a, c
	inc a
	ld [$c83a], a
Func_98f3: ; 98f3 (2:58f3)
	push bc
	push de
	push hl
	ld c, a
	ld e, $1
	ld a, b
	call Func_9a49
	pop hl
	pop de
	pop bc
Func_9900: ; 9900 (2:5900)
	ld a, [$c87d]
	cp $0
	jp z, Func_99bb
	ld a, c
	cp $f
	jp nz, Func_99bb
	ld a, b
	or a
	jr z, .asm_991b
	dec a
	jr z, .asm_9948
	dec a
	jr z, .asm_996b
	dec a
	jr z, .asm_9996
.asm_991b
	push de
	push hl
	ld a, [$c865]
	ld l, a
	ld a, [$c866]
	ld h, a
	ld a, [$c2d6]
	cpl
	ld e, a
	ld d, $ff
	inc de
	add hl, de
	ld a, l
	ld [$c865], a
	ld a, h
	ld [$c866], a
	pop hl
	pop de
	ld a, [$c2d9]
	dec a
	ld [$c2d9], a
	ld a, [$c860]
	dec a
	ld [$c860], a
	jr .asm_99b7

.asm_9948
	push hl
	ld a, [$c865]
	ld l, a
	ld a, [$c866]
	ld h, a
	inc hl
	ld a, l
	ld [$c865], a
	ld a, h
	ld [$c866], a
	pop hl
	ld a, [$c2d8]
	inc a
	ld [$c2d8], a
	ld a, [$c85f]
	inc a
	ld [$c85f], a
	jr .asm_99b7

.asm_996b
	push de
	push hl
	ld a, [$c865]
	ld l, a
	ld a, [$c866]
	ld h, a
	ld a, [$c2d6]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [$c865], a
	ld a, h
	ld [$c866], a
	pop hl
	pop de
	ld a, [$c2d9]
	inc a
	ld [$c2d9], a
	ld a, [$c860]
	inc a
	ld [$c860], a
	jr .asm_99b7

.asm_9996
	push hl
	ld a, [$c865]
	ld l, a
	ld a, [$c866]
	ld h, a
	dec hl
	ld a, l
	ld [$c865], a
	ld a, h
	ld [$c866], a
	pop hl
	ld a, [$c2d8]
	dec a
	ld [$c2d8], a
	ld a, [$c85f]
	dec a
	ld [$c85f], a
.asm_99b7
	xor a
	ld [$c83a], a
Func_99bb: ; 99bb (2:59bb)
	push bc
	push hl
	call Func_b150
	pop hl
	pop bc
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	inc c
	ld a, c
	cp $10
	jp nz, Func_95aa
	ld a, [$c87d]
	cp $0
	jr nz, Func_99de
	xor a
	ld [$c858], a
Func_99de: ; 99de (2:59de)
	pop hl
	pop de
	pop bc
	ret

Func_99e2:
	ret

Func_99e3: ; 99e3 (2:59e3)
	cp $3
	jp z, Func_9a32
	cp $2
	jp z, Func_9a20
	cp $1
	jp z, Func_9a0e
	or a
	jp nz, Func_9a47
	ld a, [$c2d9]
	and $80
	jp z, Func_9a0b
	ld a, [$c2d9]
	cpl
	inc a
	cp $4
	jp c, Func_9a0b
	ld a, $ff
	ret

Func_9a0b: ; 9a0b (2:5a0b)
	jp Func_9a47

Func_9a0e: ; 9a0e (2:5a0e)
	ld a, [$c2d8]
	add $6
	ld hl, $c2d6
	cp [hl]
	jp c, Func_9a1d
	ld a, $ff
	ret

Func_9a1d: ; 9a1d (2:5a1d)
	jp Func_9a47

Func_9a20: ; 9a20 (2:5a20)
	ld a, [$c2d9]
	add $5
	ld hl, $c2d7
	cp [hl]
	jp c, Func_9a2f
	ld a, $ff
	ret

Func_9a2f: ; 9a2f (2:5a2f)
	jp Func_9a47

Func_9a32: ; 9a32 (2:5a32)
	ld a, [$c2d8]
	and $80
	jp z, Func_9a47
	ld a, [$c2d8]
	cpl
	inc a
	cp $5
	jp c, Func_9a47
	ld a, $ff
	ret

Func_9a47: ; 9a47 (2:5a47)
	xor a
	ret

Func_9a49: ; 9a49 (2:5a49)
	push bc
	push af
	push de
	ld [$c891], a
	set_farcall_addrs_hli Func_da835
	ld a, $4
	call FarCall
	ld a, $4
	ld [$c888], a
	xor a
	ld [$c889], a
	ld hl, $c774
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [$c88a], a
	ld a, d
	ld [$c88b], a
	ld hl, $c776
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [$c88c], a
	ld a, d
	ld [$c88d], a
Func_9a86: ; 9a86 (2:5a86)
	ld a, [$c772]
	ld b, a
	ld a, [$c889]
	cp b
	jp nc, Func_9c36
	ld a, [$c88a]
	ld l, a
	ld a, [$c88b]
	ld h, a
	ld a, [hl]
	cp $ff
	jp z, Func_9c04
	ld a, [$c88c]
	ld l, a
	ld a, [$c88d]
	ld h, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_9c04
	ld a, [$c88a]
	ld l, a
	ld a, [$c88b]
	ld h, a
	inc hl
	inc hl
	ld a, [hl]
	add $7
	ld b, a
	ld a, [$c85f]
	cp b
	jp nc, Func_9c04
	ld a, [hl]
	add $5
	ld b, a
	ld a, [$c85f]
	add $a
	cp b
	jp c, Func_9c04
	inc hl
	ld a, [hl]
	add $6
	ld b, a
	ld a, [$c860]
	cp b
	jp nc, Func_9c04
	ld a, [hl]
	add $4
	ld b, a
	ld a, [$c860]
	add $a
	cp b
	jp c, Func_9c04
	dec hl
	dec hl
	ld a, [hl]
	cp $4
	jr z, .asm_9b1d
	push hl
	ld a, [$c88c]
	ld l, a
	ld a, [$c88d]
	ld h, a
	inc hl
	ld a, [hl]
	srl a
	srl a
	srl a
	ld [$c88e], a
	pop hl
	cp $1
	jr nz, .asm_9b21
	inc hl
	ld a, [hl]
	ld b, a
	inc hl
	ld a, [hl]
	dec hl
	dec hl
	add b
	and $1
	jr nz, .asm_9b21
	ld a, $2
	ld [$c88e], a
	jr .asm_9b21

.asm_9b1d
	xor a
	ld [$c88e], a
.asm_9b21
	inc hl
	ld a, [hl]
	ld b, a
	ld a, [$c2d8]
	sub b
	add a
	add a
	add a
	add a
	ld b, a
	ld a, $8
	sub b
	ld [$c88f], a
	inc hl
	ld a, [hl]
	ld b, a
	ld a, [$c2d9]
	sub b
	add a
	add a
	add a
	add a
	ld b, a
	ld a, $10
	sub b
	ld b, a
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	cp $1d
	jr z, .asm_9b4f
	dec b
	dec b
	dec b
	dec b
.asm_9b4f
	ld a, b
	ld [$c890], a
	push hl
	ld a, [$c88c]
	ld l, a
	ld a, [$c88d]
	ld h, a
	inc hl
	ld a, [hl]
	ld b, a
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jr z, .asm_9b75
	dec a
	jr z, .asm_9b7e
	dec a
	jr z, .asm_9b87
	dec a
	jr z, .asm_9b90
	jr .asm_9b99

.asm_9b75
	ld a, [$c890]
	sub b
	ld [$c890], a
	jr .asm_9b99

.asm_9b7e
	ld a, [$c88f]
	add b
	ld [$c88f], a
	jr .asm_9b99

.asm_9b87
	ld a, [$c890]
	add b
	ld [$c890], a
	jr .asm_9b99

.asm_9b90
	ld a, [$c88f]
	sub b
	ld [$c88f], a
	jr .asm_9b99

.asm_9b99
	ld a, [$c83a]
	ld b, a
	ld a, [$c891]
	or a
	jr z, .asm_9bae
	dec a
	jr z, .asm_9bb7
	dec a
	jr z, .asm_9bc0
	dec a
	jr z, .asm_9bc9
	jr .asm_9bd2

.asm_9bae
	ld a, [$c890]
	add b
	ld [$c890], a
	jr .asm_9bd2

.asm_9bb7
	ld a, [$c88f]
	sub b
	ld [$c88f], a
	jr .asm_9bd2

.asm_9bc0
	ld a, [$c890]
	sub b
	ld [$c890], a
	jr .asm_9bd2

.asm_9bc9
	ld a, [$c88f]
	add b
	ld [$c88f], a
	jr .asm_9bd2

.asm_9bd2
	push hl
	set_farcall_addrs_hli Func_da839
	pop hl
	ld a, [hl]
	ld b, a
	ld a, [$c88e]
	ld c, a
	ld a, [$c88f]
	ld d, a
	ld a, [$c890]
	ld e, a
	push hl
	ld a, [$c88c]
	ld l, a
	ld a, [$c88d]
	ld h, a
	ld a, [hl]
	pop hl
	call FarCall
	ld a, [$c888]
	ld b, $4
	add b
	ld [$c888], a
Func_9c04: ; 9c04 (2:5c04)
	ld a, [$c889]
	inc a
	ld [$c889], a
	ld a, [$c88a]
	ld l, a
	ld a, [$c88b]
	ld h, a
	ld bc, $e
	add hl, bc
	ld a, l
	ld [$c88a], a
	ld a, h
	ld [$c88b], a
	ld a, [$c88c]
	ld l, a
	ld a, [$c88d]
	ld h, a
	ld bc, $4
	add hl, bc
	ld a, l
	ld [$c88c], a
	ld a, h
	ld [$c88d], a
	jp Func_9a86

Func_9c36: ; 9c36 (2:5c36)
	ld a, [$c84e]
	cp $1
	jp nz, Func_9c78
	ld a, [$c850]
	inc a
	ld [$c850], a
	dec a
	cp $5
	jp c, Func_9c78
	ld a, [wSCY]
	ld hl, $c84f
	add [hl]
	ld [wSCY], a
	ld a, [wSCY2]
	ld hl, $c84f
	add [hl]
	ld [wSCY2], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	ld a, [$c84f]
	ld b, $ff
	call MultiplyAbyB
	ld [$c84f], a
	xor a
	ld [$c850], a
Func_9c78: ; 9c78 (2:5c78)
	call Func_a1fa
	pop de
	pop af
	call Func_9d80
	ld hl, sp+$0
	ld [hl], $40
	call ReadHalfWordAt
	dw $c888
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$0
	call FarCall
	ld e, $0
	call ReadHalfWordAt
	dw $c82e
	ld a, l
	or h
	jp nz, Func_9cbc
	push de
	callba_hli Func_da4fc
	pop de
	jp Func_9d1e

Func_9cbc: ; 9cbc (2:5cbc)
	ld a, [$c834]
	ld hl, $c836
	add [hl]
	add $7
	ld hl, $c85f
	cp [hl]
	jp c, Func_9d0e
	ld a, [$c834]
	add $6
	ld l, a
	ld a, [$c85f]
	add $a
	cp l
	jp c, Func_9d0e
	ld a, [$c835]
	ld hl, $c837
	add [hl]
	add $6
	ld hl, $c860
	cp [hl]
	jp c, Func_9d0e
	ld a, [$c835]
	add $5
	ld l, a
	ld a, [$c860]
	add $9
	cp l
	jp c, Func_9d0e
	set_farcall_addrs_hli Func_da093
	ld a, $1
	call FarCall
	ld e, a
	jp Func_9d1e

Func_9d0e: ; 9d0e (2:5d0e)
	push de
	callba_hli Func_da4fc
	pop de
Func_9d1e: ; 9d1e (2:5d1e)
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, e
	pop bc
	ret

Func_9d31: ; 9d31 (2:5d31)
	xor a
	ld [$c84e], a
	xor a
	ld [$c84f], a
	xor a
	ld [$c850], a
	ret

Func_9d3e:
	ld a, $1
	ld [$c84e], a
	ld a, $2
	ld [$c84f], a
	xor a
	ld [$c850], a
	ret

Func_9d4d:
	ld a, [$c84f]
	cp $2
	jp z, Func_9d73
	ld a, [wSCY]
	ld hl, $c84f
	add [hl]
	ld [wSCY], a
	ld a, [wSCY2]
	ld hl, $c84f
	add [hl]
	ld [wSCY2], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
Func_9d73: ; 9d73 (2:5d73)
	xor a
	ld [$c84f], a
	xor a
	ld [$c84e], a
	xor a
	ld [$c850], a
	ret

Func_9d80: ; 9d80 (2:5d80)
	push hl
	ld h, a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_9d8f
	ld a, [$c838]
	pop hl
	jr .asm_9d91

.asm_9d8f
	ld a, h
	pop hl
.asm_9d91
	push af
	ld a, [$c841]
	ld a, [$c841]
	or a
	jp z, Func_9ea0
	ld a, e
	or a
	jr nz, .asm_9da4
	xor a
	ld [$c821], a
.asm_9da4
	ld a, [$c858]
	cp $1
	jr nz, .asm_9db0
	xor a
	ld [$c821], a
	ld e, a
.asm_9db0
	ld a, [$c821]
	srl a
	srl a
	srl a
	and $3
	ld hl, Data_9ead
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld b, a
	ld hl, wOAM2_00YCoord
	lb de, $58, $4c
	ld a, [$c84b]
	cp $1
	jr nz, .asm_9de1
	ld d, $58
	ld a, [$c84c]
	add d
	ld d, a
	ld e, $4c
	ld a, [$c84d]
	add e
	ld e, a
	ld b, $0
.asm_9de1
	pop af
	cp $1
	jr z, .asm_9e41
	ld c, $10
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	push de
	push hl
	ld hl, $0
	push bc
	call Func_9f4c
	pop bc
	push af
	ld hl, $c826
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld h, $0
	ld l, a
	add hl, de
	ld a, [hl]
	and $4
	jr z, .asm_9e23
	ld a, c
	or $80
	ld c, a
.asm_9e23
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [$c821]
	inc a
	ld [$c821], a
	ret

.asm_9e41
	ld c, $30
	ld a, d
	add $8
	ld d, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	push de
	push hl
	ld hl, $0
	push bc
	call Func_9f4c
	pop bc
	push af
	ld hl, $c826
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld h, $0
	ld l, a
	add hl, de
	ld a, [hl]
	and $4
	jr z, .asm_9e82
	ld a, c
	or $80
	ld c, a
.asm_9e82
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [$c821]
	inc a
	ld [$c821], a
	ret

Func_9ea0: ; 9ea0 (2:5ea0)
	pop af
	ld hl, wOAM2_00YCoord
	ld b, $10
	ld a, $ff
.asm_9ea8
	ld [hli], a
	dec b
	jr nz, .asm_9ea8
	ret

Data_9ead:
	dr $9ead, $9eb4

Func_9eb4: ; 9eb4 (2:5eb4)
	push af
	ld hl, sp+$1
	ld a, [hl]
	ld hl, $c2d6
	cp [hl]
	jp nc, Func_9ec7
	ld a, e
	ld hl, $c2d7
	cp [hl]
	jp c, Func_9ecb
Func_9ec7: ; 9ec7 (2:5ec7)
	xor a
	jp Func_9ed1

Func_9ecb: ; 9ecb (2:5ecb)
	ld hl, sp+$1
	ld a, [hl]
	call Func_9f64
Func_9ed1: ; 9ed1 (2:5ed1)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c822
	add hl, de
	pop bc
	ret

Func_9ee2: ; 9ee2 (2:5ee2)
	ld hl, $c2d6
	cp [hl]
	jp nc, Func_9ef1
	ld a, e
	ld hl, $c2d7
	cp [hl]
	jp c, Func_9ef5
Func_9ef1: ; 9ef1 (2:5ef1)
	xor a
	jp Func_9efa

Func_9ef5: ; 9ef5 (2:5ef5)
	ld l, c
	ld h, b
	call Func_9f4c
Func_9efa: ; 9efa (2:5efa)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c824
	add hl, de
	call WriteHalfWordTo
	dw $c91d
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c822
	add hl, de
	ret

Func_9f1e: ; 9f1e (2:5f1e)
	push af
	ld hl, sp+$1
	ld a, [hl]
	ld hl, $c2d6
	cp [hl]
	jp nc, Func_9f31
	ld a, e
	ld hl, $c2d7
	cp [hl]
	jp c, Func_9f35
Func_9f31: ; 9f31 (2:5f31)
	xor a
	jp Func_9f3b

Func_9f35: ; 9f35 (2:5f35)
	ld hl, sp+$1
	ld a, [hl]
	call Func_9f64
Func_9f3b: ; 9f3b (2:5f3b)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c824
	add hl, de
	pop bc
	ret

Func_9f4c: ; 9f4c (2:5f4c)
	push hl
	pop hl
	push hl
	push hl
	call ReadHalfWordAt
	dw $c865
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c828
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	pop bc
	ret

Func_9f64: ; 9f64 (2:5f64)
	push af
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c828
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	pop bc
	ret

Func_9f87: ; 9f87 (2:5f87)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	ld [hl], c
	ld a, c
	and $3f
	ld c, a
	ld a, c
	cp $1
	jp nz, Func_9fe7
	ld hl, sp+$b
	ld a, [hl]
	ld hl, $c2d6
	cp [hl]
	jp nc, Func_9fae
	ld hl, sp+$8
	ld a, [hl]
	ld hl, $c2d7
	cp [hl]
	jp c, Func_9fb3
Func_9fae: ; 9fae (2:5fae)
	ld a, $ff
	jp Func_a181

Func_9fb3: ; 9fb3 (2:5fb3)
	push bc
	ld hl, sp+$a
	ld e, [hl]
	ld hl, sp+$d
	ld a, [hl]
	call Func_9f64
	ld hl, sp+$3
	ld [hl], a
	pop bc
	push bc
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c860]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	ld a, [$c85f]
	ld e, a
	ld d, $0
	add hl, de
	ld e, [hl]
	pop bc
	jp Func_a055

Func_9fe7: ; 9fe7 (2:5fe7)
	push bc
	ld a, [$c85f]
	dec a
	ld hl, sp+$d
	cp [hl]
	jp nz, Func_9ff8
	ld de, -1
	jp Func_a03a

Func_9ff8: ; 9ff8 (2:5ff8)
	ld a, [$c85f]
	inc a
	ld hl, sp+$d
	cp [hl]
	jp nz, Func_a008
	ld de, $1
	jp Func_a03a

Func_a008: ; a008 (2:6008)
	ld a, [$c860]
	dec a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_a026
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	push de
	push hl
	pop de
	pop hl
	jp Func_a03a

Func_a026: ; a026 (2:6026)
	ld a, [$c860]
	inc a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_a03a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	push de
	push hl
	pop de
	pop hl
Func_a03a: ; a03a (2:603a)
	push de
	push hl
	pop de
	pop hl
	call Func_9f4c
	ld hl, sp+$3
	ld [hl], a
	call ReadHalfWordAt
	dw $c865
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	ld e, [hl]
	pop bc
Func_a055: ; a055 (2:6055)
	ld hl, sp+$0
	ld a, [hl]
	and $80
	jp nz, Func_a09f
	ld a, [$c838]
	cp $3
	jp z, Func_a094
	cp $2
	jp z, Func_a089
	cp $1
	jp z, Func_a07e
	or a
	jp nz, Func_a09f
	ld a, e
	and $40
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a07e: ; a07e (2:607e)
	ld a, e
	and $20
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a089: ; a089 (2:6089)
	ld a, e
	and $10
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a094: ; a094 (2:6094)
	ld a, e
	and $8
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a09f: ; a09f (2:609f)
	ld a, c
	cp $1
	jp nz, Func_a15e
	ld hl, sp+$6
	ld [hl], $0
Func_a0a9: ; a0a9 (2:60a9)
	ld hl, sp+$6
	ld a, [hl]
	ld hl, $c772
	cp [hl]
	jp nc, Func_a15e
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld a, [hl]
	and $80
	jp z, Func_a0de
	ld a, [bc]
	cp $ff
	jp nz, Func_a0de
	jp Func_a154

Func_a0de: ; a0de (2:60de)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	or a
	jp nz, Func_a154
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_a154
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$8
	ld c, [hl]
	ld a, e
	ld hl, sp+$5
	cp [hl]
	jp c, Func_a154
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$3
	add [hl]
	ld l, a
	ld a, e
	cp l
	jp nc, Func_a154
	ld a, c
	ld hl, sp+$4
	cp [hl]
	jp c, Func_a154
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_a154
	ld a, $ff
	jp Func_a181

Func_a154: ; a154 (2:6154)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_a0a9

Func_a15e: ; a15e (2:615e)
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp nz, Func_a180
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	call ReadHalfWordAt
	dw $c826
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_a17c
	ld a, $ff
	jp Func_a181

Func_a17c: ; a17c (2:617c)
	xor a
	jp Func_a181

Func_a180: ; a180 (2:6180)
	xor a
Func_a181: ; a181 (2:6181)
	add sp, $c
	ret

Func_a184: ; a184 (2:6184)
	push af
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c822
	add hl, de
	ld a, [hl]
	add $70
	ld [$c81f], a
	xor a
	ld [$c820], a
	ld hl, $30
	call Func_be4d
	call WriteHalfWordTo
	dw $c82c
	ld c, $0
Func_a1ad: ; a1ad (2:61ad)
	ld a, c
	cp $3
	jp nc, Func_a1f8
	push bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c822
	add hl, de
	ld e, c
	ld d, $0
	inc de
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, $6
	ld [wFarCallDestBank], a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82c
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
	inc c
	jp Func_a1ad

Func_a1f8: ; a1f8 (2:61f8)
	pop bc
	ret

Func_a1fa: ; a1fa (2:61fa)
	ld a, [$c81f]
	cp $ff
	jp nz, Func_a203
	ret

Func_a203: ; a203 (2:6203)
	ld a, [$c820]
	inc a
	ld [$c820], a
	cp $18
	jp nz, Func_a213
	xor a
	ld [$c820], a
Func_a213: ; a213 (2:6213)
	ld a, [$c820]
	and $7
	jp z, Func_a21c
	ret

Func_a21c: ; a21c (2:621c)
	ld a, [$c820]
	rrca
	rrca
	rrca
	and $1f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82c
	add hl, de
	push hl
	ld hl, $c81f
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call RequestVideoData
	ret

Func_a24c: ; a24c (2:624c)
	xor a
	ld [$c772], a
	ld a, $10
	ld [$c773], a
	ld hl, $118
	call Func_be4d
	call WriteHalfWordTo
	dw $c774
	ld hl, $50
	call Func_be4d
	call WriteHalfWordTo
	dw $c776
	ret

Func_a26c: ; a26c (2:626c)
	push hl
	push de
	push bc
	push bc
	call GetHLAtSPPlus8
	ld a, l
	cp $1a
	jp nc, Func_a296
	ld a, $35
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	call WriteHLToSPPlus4
	jp Func_a2b0

Func_a296: ; a296 (2:6296)
	ld a, $30
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $580
	add hl, de
	call WriteHLToSPPlus4
Func_a2b0: ; a2b0 (2:62b0)
	call Func_bfaf
	pop bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	push hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	ld l, h
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	pop de
	call FarRequestVideoData
	call Func_bfaf
	pop bc
	pop bc
	pop bc
	ret

Data_a2e7:
	dr $a2e7, $a2eb

Func_a2eb:
	push hl
	push bc
	push bc
	push bc
	ld a, [$c772]
	cp $14
	jp c, Func_a2fd
	ld hl, -1
	jp Func_a43f

Func_a2fd: ; a2fd (2:62fd)
	call GetHLAtSPPlus8
	push hl
	ld hl, $c772
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	pop de
	ld bc, $e
	call CopyFromDEtoHL
	ld hl, $c772
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $c772
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	call WriteHLToSPPlus6
	pop bc
	ld a, $ff
	ld [bc], a
	ld l, c
	ld h, b
	inc hl
	ld [hl], $0
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld [hl], $0
	call GetHLAtSPPlus4
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	cp $ff
	jp z, Func_a39c
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_a2e7
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus4
	inc hl
	ld l, [hl]
	push hl
	push bc
	ld c, l
	ld e, a
	ld a, [$c773]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call Func_a26c
	pop bc
	ld a, [$c773]
	ld [bc], a
	pop hl
	ld a, [$c773]
	add l
	ld [$c773], a
Func_a39c: ; a39c (2:639c)
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	call GetHLAtSPPlus4
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$2
	ld a, [hl]
	cp $64
	jp nz, Func_a3d5
	ld hl, sp+$2
	ld a, [$c2d6]
	ld [hl], a
Func_a3d5: ; a3d5 (2:63d5)
	pop hl
	ld a, l
	cp $64
	jp nz, Func_a3e0
	ld a, [$c2d7]
	ld l, a
Func_a3e0: ; a3e0 (2:63e0)
	push hl
	ld e, c
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	xor a
	pop hl
Func_a407: ; a407 (2:6407)
	cp l
	jp nc, Func_a438
	push hl
	push af
	push de
	ld c, $0
Func_a410: ; a410 (2:6410)
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, Func_a426
	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	inc de
	inc c
	jp Func_a410

Func_a426: ; a426 (2:6426)
	pop de
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	pop hl
	jp Func_a407

Func_a438: ; a438 (2:6438)
	ld a, [$c772]
	inc a
	ld [$c772], a
Func_a43f: ; a43f (2:643f)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_a444:
	push af
	push de
	push bc
	push bc
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$4
	ld a, [hl]
	and $7f
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	ld hl, $c772
	cp [hl]
	jp c, Func_a460
	jp Func_a57b

Func_a460: ; a460 (2:6460)
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld a, c
	and $80
	jp nz, Func_a4a0
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
Func_a4a0: ; a4a0 (2:64a0)
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
	ld e, c
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_a543
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_a540
	xor a
Func_a510: ; a510 (2:6510)
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_a540
	push af
	push de
	ld c, $0
Func_a51a: ; a51a (2:651a)
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, Func_a52f
	ld a, [de]
	dec a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	inc c
	jp Func_a51a

Func_a52f: ; a52f (2:652f)
	pop de
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	jp Func_a510

Func_a540: ; a540 (2:6540)
	jp Func_a57b

Func_a543: ; a543 (2:6543)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_a57b
	xor a
Func_a54b: ; a54b (2:654b)
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_a57b
	push af
	push de
	ld c, $0
Func_a555: ; a555 (2:6555)
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, Func_a56a
	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	inc c
	jp Func_a555

Func_a56a: ; a56a (2:656a)
	pop de
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	jp Func_a54b

Func_a57b: ; a57b (2:657b)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_a580:
	push de
	pop hl
	push hl
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ret

Func_a5a3:
	push hl
	push de
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_a5ab: ; a5ab (2:65ab)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, $c772
	cp [hl]
	jp nc, Func_a60b
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld de, $c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	call CompareHLtoBC
	jp nz, Func_a601
	call GetHLAtSPPlus4
	push hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
Func_a601: ; a601 (2:6601)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_a5ab

Func_a60b: ; a60b (2:660b)
	pop bc
	pop bc
	pop bc
	ret

Func_a60f:
	push de
	push bc
	ld hl, $c772
	cp [hl]
	jp c, Func_a61b
	jp Func_a6d1

Func_a61b: ; a61b (2:661b)
	push af
	push bc
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$6
	ld a, [hl]
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld [hl], a
	pop bc
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	inc hl
	ld [hl], c
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_a6d1
	push bc
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [de]
	dec a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	pop bc
	ld e, c
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
Func_a6d1: ; a6d1 (2:66d1)
	pop bc
	pop bc
	ret

Data_a6d4:
	dr $a6d4, $a6d8

Func_a6d8: ; a6d8 (2:66d8)
	push af
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_a6d4
	ld bc, $4
	call MemCopy
	pop de
	ld a, e
	and $80
	jp z, Func_a6f8
	ld a, $1
	jp Func_a6f9

Func_a6f8: ; a6f8 (2:66f8)
	xor a
Func_a6f9: ; a6f9 (2:66f9)
	push af
	ld a, e
	and $7f
	ld e, a
	push de
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	ld c, l
	ld b, h
	pop de
	pop af
	push bc
	push de
	ld hl, $6
	add hl, bc
	ld [hl], e
	or a
	jp nz, Func_a730
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
Func_a730: ; a730 (2:6730)
	pop de
	pop bc
	ld a, [bc]
	ld hl, sp+$5
	ld [hl], a
	cp $ff
	jp z, Func_a77e
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	ld hl, sp+$5
	ld a, [hl]
	cp $1b
	jp z, Func_a758
	ld hl, sp+$5
	ld a, [hl]
	cp $1d
	jp nz, Func_a75c
Func_a758: ; a758 (2:6758)
	ld hl, sp+$4
	ld [hl], $0
Func_a75c: ; a75c (2:675c)
	ld c, e
	ld hl, sp+$4
	ld l, [hl]
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	ld d, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, d
	pop de
	call Func_a26c
	call Func_bfaf
Func_a77e: ; a77e (2:677e)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_a783: ; a783 (2:6783)
	ld [$c88b], a
	ld a, e
	ld [$c88c], a
	ld a, [$c83c]
	ld b, a
	ld a, [$c83d]
	or b
	jr z, .asm_a797
	ld a, $1
	ret

.asm_a797
	ld a, $1
	ld [$c888], a
	ld a, [$c85f]
	ld [$c889], a
	ld a, [$c860]
	ld [$c88a], a
	ld a, [$c865]
	ld l, a
	ld a, [$c866]
	ld h, a
	ld c, l
	ld b, h
	ld a, [$c830]
	ld l, a
	ld a, [$c831]
	ld h, a
	add hl, bc
	ld a, [$c2d6]
	ld c, a
	ld b, $0
	ld a, [$c88b]
	cp $1
	jr z, .asm_a7ce
	cp $2
	jr z, .asm_a7ce
	jr .asm_a80c

.asm_a7ce
	ld a, [$c88c]
	or a
	jr z, .asm_a7df
	dec a
	jr z, .asm_a7ee
	dec a
	jr z, .asm_a7f8
	dec a
	jr z, .asm_a802
	jr .asm_a80c

.asm_a7df
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ld a, [$c88a]
	dec a
	ld [$c88a], a
	jr .asm_a80c

.asm_a7ee
	inc hl
	ld a, [$c889]
	inc a
	ld [$c889], a
	jr .asm_a80c

.asm_a7f8
	add hl, bc
	ld a, [$c88a]
	inc a
	ld [$c88a], a
	jr .asm_a80c

.asm_a802
	dec hl
	ld a, [$c889]
	dec a
	ld [$c889], a
	jr .asm_a80c

.asm_a80c
	ld a, [hl]
	and $7
	jr nz, .asm_a814
	ld a, $1
	ret

.asm_a814
	ld hl, $c774
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [$c88e], a
	ld a, d
	ld [$c88f], a
	ld hl, $c776
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [$c890], a
	ld a, d
	ld [$c891], a
	xor a
	ld [$c88d], a
Func_a836: ; a836 (2:6836)
	ld a, [$c772]
	ld b, a
	ld a, [$c88d]
	cp b
	jp nc, Func_a97f
	ld a, [$c84a]
	or a
	jp z, Func_a97f
	ld a, [$c890]
	ld l, a
	ld a, [$c891]
	ld h, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_a94d
	ld a, [$c88e]
	ld l, a
	ld a, [$c88f]
	ld h, a
	ld bc, $a
	add hl, bc
	ld a, [$c88b]
	or a
	jr z, .asm_a870
	cp $2
	jr z, .asm_a870
	jr .asm_a879

.asm_a870
	ld a, [hli]
	ld b, a
	ld a, [hli]
	dec hl
	dec hl
	or b
	jp z, Func_a94d
.asm_a879
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, [$c889]
	bit 7, a
	jp nz, Func_a94d
	cp [hl]
	jp c, Func_a94d
	ld c, a
	ld a, [hl]
	ld b, a
	inc hl
	inc hl
	ld a, [hl]
	add b
	inc c
	cp c
	jp c, Func_a94d
	dec hl
	ld a, [$c88a]
	bit 7, a
	jp nz, Func_a94d
	cp [hl]
	jp c, Func_a94d
	ld c, a
	ld a, [hl]
	ld b, a
	inc hl
	inc hl
	ld a, [hl]
	add b
	inc c
	cp c
	jp c, Func_a94d
	ld a, [$c88b]
	or a
	jr z, .asm_a8c3
	cp $1
	jr z, .asm_a8de
	cp $2
	jr z, .asm_a928
	jp Func_a94d

.asm_a8c3
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld e, $2
	ld a, [$c88d]
	call FarCall
	jp Func_a94d

.asm_a8de
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	cp $0
	jr nz, .asm_a8f5
	ld a, [$c83c]
	ld b, a
	ld a, [$c83d]
	or b
	jr nz, .asm_a8f5
	ld a, $0
	ld [$c888], a
.asm_a8f5
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	or b
	jr z, .asm_a925
	ld a, $0
	ld [$c7c4], a
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld a, $1
	ld e, a
	ld a, [$c88d]
	call FarCall
	ld a, [$c7c4]
	cp $1
	jr nz, .asm_a925
	ld a, $1
	ld [$c888], a
.asm_a925
	jp Func_a94d

.asm_a928
	ld a, $0
	ld [$c7c4], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld e, $0
	ld a, [$c88d]
	call FarCall
	ld a, [$c7c4]
	cp $1
	jp z, Func_a97f
Func_a94d: ; a94d (2:694d)
	ld a, [$c88e]
	ld l, a
	ld a, [$c88f]
	ld h, a
	ld bc, $e
	add hl, bc
	ld a, l
	ld [$c88e], a
	ld a, h
	ld [$c88f], a
	ld a, [$c890]
	ld l, a
	ld a, [$c891]
	ld h, a
	ld bc, $4
	add hl, bc
	ld a, l
	ld [$c890], a
	ld a, h
	ld [$c891], a
	ld a, [$c88d]
	inc a
	ld [$c88d], a
	jp nz, Func_a836
Func_a97f: ; a97f (2:697f)
	ld a, [$c888]
	ret

Data_a983:
	db $01
	db $02
	db $04
	db $08
	db $10
	db $20
	db $40
	db $80

Func_a98b:
	push hl
	push de
	call GetHLAtSPPlus4
	ld a, l
	sub $7
	or h
	jp nz, Func_a9b9
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_a9b9
	call GetHLAtSPPlus4
	call Func_aa36
	or a
	jp nz, Func_a9b9
	set_farcall_addrs_hli Func_93941
	ld a, $2
	call FarCall
Func_a9b9: ; a9b9 (2:69b9)
	call GetHLAtSPPlus4
	ld a, l
	sub $b9
	or h
	jp nz, Func_a9e5
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_a9e5
	call GetHLAtSPPlus4
	call Func_aa36
	or a
	jp nz, Func_a9e5
	set_farcall_addrs_hli Func_93941
	ld a, $3
	call FarCall
Func_a9e5: ; a9e5 (2:69e5)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, Func_aa13
	cp $1
	jp nz, Func_aa33
	call GetHLAtSPPlus4
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	push af
	call GetHLAtSPPlus6
	ld de, $8
	call DivideHLByDESigned
	ld de, $c7ed
	add hl, de
	pop af
	or [hl]
	ld [hl], a
	jp Func_aa33

Func_aa13: ; aa13 (2:6a13)
	call GetHLAtSPPlus4
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	cpl
	push af
	call GetHLAtSPPlus6
	ld de, $8
	call DivideHLByDESigned
	ld de, $c7ed
	add hl, de
	pop af
	and [hl]
	ld [hl], a
Func_aa33: ; aa33 (2:6a33)
	pop bc
	pop bc
	ret

Func_aa36: ; aa36 (2:6a36)
	push hl
	pop hl
	push hl
	ld de, $8
	call DivideHLByDESigned
	ld de, $c7ed
	add hl, de
	ld c, [hl]
	pop hl
	push hl
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_aa5a
	ld a, $1
	jp Func_aa5b

Func_aa5a: ; aa5a (2:6a5a)
	xor a
Func_aa5b: ; aa5b (2:6a5b)
	pop bc
	ret

Func_aa5d: ; aa5d (2:6a5d)
	push hl
	push de
	add sp, -$44
	push bc
	ld a, $3
	ld [wOAM26VTile], a
	ld l, $d
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld hl, $0
	call WriteHLToSPPlus4
	ld hl, sp+$46
	ld a, [hl]
	cp $c
	jp nz, Func_ab15
	call GetHLAtSPPlusParam8
	db $4a
	call WriteHLToSPPlusParam8
	db $43
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $45
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$41
	call PrintCharacterFromTree
	ld hl, sp+$4
	ld [hl], $0
	ld c, $0
Func_aaa1: ; aaa1 (2:6aa1)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_aaaf
	jp Func_aad8

Func_aaaf: ; aaaf (2:6aaf)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	cp $df
	jp z, Func_aaca
	cp $de
	jp z, Func_aaca
	cp $29
	jp z, Func_aaca
	cp $28
	jp nz, Func_aacd
Func_aaca: ; aaca (2:6aca)
	jp Func_aad4

Func_aacd: ; aacd (2:6acd)
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_aad4: ; aad4 (2:6ad4)
	inc c
	jp Func_aaa1

Func_aad8: ; aad8 (2:6ad8)
	set_farcall_addrs_hli Func_da901
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $203
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $b
	call FarCall
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld hl, sp+$4
	ld a, [hl]
	add $2
	ld e, a
	ld hl, $b
	call FarCall
Func_ab15: ; ab15 (2:6b15)
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push de
	push hl
	pop de
	pop hl
	push de
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	call GetHLAtSPPlusParam8
	db $4c
	call WriteHLToSPPlusParam8
	db $45
	ld l, $0
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop hl
	pop de
	pop bc
	push de
	push hl
	push bc
	ld a, c
	and $1
	jp z, Func_ab86
	set_farcall_addrs_hli Func_60621
	ld bc, $1603
	ld hl, sp+$45
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	inc h
	call FarCall
	jp Func_aba2

Func_ab86: ; ab86 (2:6b86)
	set_farcall_addrs_hli Func_c868
	ld c, $c3
	ld hl, sp+$45
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	inc h
	call FarCall
Func_aba2: ; aba2 (2:6ba2)
	pop bc
	pop hl
	push bc
	ld a, c
	and $1
	jp z, Func_abd0
	xor a
Func_abac: ; abac (2:6bac)
	cp $a
	jp nc, Func_abba
	push af
	call Func_0465
	pop af
	inc a
	jp Func_abac

Func_abba: ; abba (2:6bba)
	callba_hli Func_1482e
	ld a, l
	cp $ff
	jp nz, Func_abd0
	ld l, $1
Func_abd0: ; abd0 (2:6bd0)
	pop bc
	pop de
	push hl
	push de
	ld a, c
	and $2
	jp nz, Func_abdd
	call Func_8f44
Func_abdd: ; abdd (2:6bdd)
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, Func_abf6
	set_farcall_addrs_hli Func_daa40
	call GetHLAtSPPlus6
	call FarCall
Func_abf6: ; abf6 (2:6bf6)
	pop de
	ld a, e
	or d
	jp z, Func_ac0c
	push de
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
Func_ac0c: ; ac0c (2:6c0c)
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_0465
	pop hl
	ld a, l
	add sp, $48
	ret

Func_ac24:
	ld e, $e
	ld c, $0
	call Func_aa5d
	ret

Func_ac2b:
	ld e, $c
	ld c, $0
	call Func_aa5d
	ret

Func_ac34:
	ret

Func_ac35:
	ret

Func_ac36:
	ret

Func_ac37:
	ld a, $8a
	ld [wBlinkerOffTile], a
	set_farcall_addrs_hli Func_60001
	ld c, $0
	ld e, $10
	ld a, $12
	call FarCall
Func_ac50: ; ac50 (2:6c50)
	call Func_3d15
	ld l, a
	ld a, l
	and $10
	jp z, Func_ac5d
	jp Func_ac69

Func_ac5d: ; ac5d (2:6c5d)
	ld a, l
	and $20
	jp z, Func_ac66
	jp Func_ac69

Func_ac66: ; ac66 (2:6c66)
	jp Func_ac50

Func_ac69: ; ac69 (2:6c69)
	call Func_3d15
	ld l, a
	ld a, l
	and $10
	jp z, Func_ac76
	jp Func_ac69

Func_ac76: ; ac76 (2:6c76)
	ld a, l
	and $20
	jp z, Func_ac7f
	jp Func_ac69

Func_ac7f: ; ac7f (2:6c7f)
	set_farcall_addrs_hli Func_60001
	ld c, $1
	ld e, $10
	ld a, $12
	call FarCall
	ret

Func_ac94:
	ld e, $e
	ld c, $1
	jp Func_aa5d

Func_ac9b:
	xor a
	ret

Func_ac9d:
	ld e, $c
	ld c, $1
	jp Func_aa5d

Func_aca4:
	xor a
	ret

Func_aca6: ; aca6 (2:6ca6)
	xor a
	ld [$c77c], a
	call ReadHalfWordAt
	dw $c77a
	ld a, l
	or h
	jp z, Func_acbc
	call ReadHalfWordAt
	dw $c77a
	call Func_be5d
Func_acbc: ; acbc (2:6cbc)
	ld hl, $dc
	call Func_be4d
	call WriteHalfWordTo
	dw $c77a
	ret

Func_acc8:
	push hl
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	ld d, $0
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld l, [hl]
	ld h, $0
	add hl, bc
	pop de
	push hl
	xor a
Func_acf0: ; acf0 (2:6cf0)
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nc, Func_ad28
	push af
	ld c, $0
Func_acfd: ; acfd (2:6cfd)
	ld a, c
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nc, Func_ad16
	call GetHLAtSPPlus4
	ld e, c
	ld d, $0
	add hl, de
	ld a, $80
	or [hl]
	ld [hl], a
	inc c
	jp Func_acfd

Func_ad16: ; ad16 (2:6d16)
	call GetHLAtSPPlus4
	ld a, [$c2d6]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus4
	pop af
	inc a
	jp Func_acf0

Func_ad28: ; ad28 (2:6d28)
	call GetHLAtSPPlus4
	push hl
	ld hl, $c77c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c77a
	add hl, de
	pop de
	ld bc, $b
	call CopyFromDEtoHL
	ld a, [$c77c]
	inc a
	ld [$c77c], a
	pop bc
	pop bc
	ret

Func_ad56: ; ad56 (2:6d56)
	call ReadHalfWordAt
	dw $c865
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	ld a, [hl]
	and $80
	jp nz, Func_ad6d
	xor a
	ret

Func_ad6d: ; ad6d (2:6d6d)
	ld c, $0
Func_ad6f: ; ad6f (2:6d6f)
	ld a, c
	ld hl, $c77c
	cp [hl]
	jp nc, Func_ae3b
	push bc
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c77a
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [de]
	ld [$c861], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld [$c862], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld [$c863], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [$c864], a
	pop bc
	ld a, [$c85f]
	ld hl, $c861
	cp [hl]
	jp c, Func_ae37
	ld a, [$c861]
	ld hl, $c863
	add [hl]
	ld l, a
	ld a, [$c85f]
	cp l
	jp nc, Func_ae37
	ld a, [$c860]
	ld hl, $c862
	cp [hl]
	jp c, Func_ae37
	ld a, [$c862]
	ld hl, $c864
	add [hl]
	ld l, a
	ld a, [$c860]
	cp l
	jp nc, Func_ae37
	ld a, [$c7eb]
	ld [$c7df], a
	ld a, [$c7ec]
	ld [$c7e0], a
	ld a, [$c85f]
	ld [$c7db], a
	ld a, [$c860]
	ld [$c7dc], a
	ld hl, $6
	add hl, de
	ld a, [hl]
	ld [$c7e7], a
	ld hl, $7
	add hl, de
	ld a, [hl]
	ld [$c7e8], a
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld [$c7e9], a
	ld hl, $9
	add hl, de
	ld a, [hl]
	ld [$c7ea], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [$c7eb], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld [$c7ec], a
	ld a, $2e
	call Func_1502
	xor a
	ld [$c84a], a
	ld a, $1
	ret

Func_ae37: ; ae37 (2:6e37)
	inc c
	jp Func_ad6f

Func_ae3b: ; ae3b (2:6e3b)
	xor a
	ret

Data_ae3d:
	dr $ae3d, $ae45

Data_ae45:
	dr $ae45, $ae4d

Func_ae4d:
	push bc
	push bc
	push bc
	push bc
	ld c, $c1
	ld a, [$c860]
	ld e, a
	ld a, [$c85f]
	call Func_9f87
	cp $ff
	jp nz, Func_aef5
	ld hl, sp+$2
	ld [hl], $0
Func_ae66: ; ae66 (2:6e66)
	ld hl, sp+$2
	ld a, [hl]
	cp $9
	jp nc, Func_aeaa
	ld a, [$c85f]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, Data_ae3d
	add hl, de
	add [hl]
	ld hl, sp+$1
	ld [hl], a
	ld a, [$c860]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, Data_ae45
	add hl, de
	add [hl]
	ld hl, sp+$0
	ld [hl], a
	ld c, $81
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	call Func_9f87
	or a
	jp nz, Func_aea0
	jp Func_aeaa

Func_aea0: ; aea0 (2:6ea0)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_ae66

Func_aeaa: ; aeaa (2:6eaa)
	ld hl, sp+$2
	ld a, [hl]
	cp $9
	jp z, Func_aef5
	ld hl, sp+$1
	ld a, [hl]
	add $fb
	ld [$c2d8], a
	ld hl, sp+$0
	ld a, [hl]
	add $fc
	ld [$c2d9], a
	ld hl, sp+$1
	ld a, [hl]
	ld [$c85f], a
	ld hl, sp+$0
	ld a, [hl]
	ld [$c860], a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c860]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [$c85f]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHalfWordTo
	dw $c865
	ld hl, sp+$1
	ld a, [hl]
	ld [$c7e9], a
	ld hl, sp+$0
	ld a, [hl]
	ld [$c7ea], a
Func_aef5: ; aef5 (2:6ef5)
	ld hl, sp+$3
	ld a, [$c7e9]
	ld [hl], a
	ld hl, sp+$4
	ld a, [$c7ea]
	ld [hl], a
	ld hl, sp+$6
	ld a, $ff
	ld [hl], a
	ld hl, sp+$5
	ld [hl], a
	ld a, [$c7da]
	or a
	jp nz, Func_af33
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_b65f
	jp Func_af68

Func_af33: ; af33 (2:6f33)
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	set_farcall_addrs_hli Func_c7bd0
	ld a, [$c867]
	call FarCall
	ld e, $fe
	ld a, $fe
	call Func_b60d
Func_af68: ; af68 (2:6f68)
	ld c, $1
	ld hl, sp+$3
	push de
	push hl
	pop de
	pop hl
	ld a, $2
	call Func_b400
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_af7a:
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	ld e, h
	ld hl, sp+$2
	ld [hl], e
	call GetHLAtSPPlus6
	ld a, l
	pop de
	push af
	ld c, d
	ld a, [$c7eb]
	ld [$c7df], a
	ld a, [$c7ec]
	ld [$c7e0], a
	ld a, [$c85f]
	ld [$c7db], a
	ld a, [$c860]
	ld [$c7dc], a
	ld a, c
	ld [$c7e9], a
	ld [$c7e7], a
	ld a, e
	ld [$c7ea], a
	ld [$c7e8], a
	ld hl, sp+$2
	ld a, [hl]
	ld [$c7eb], a
	pop af
	ld [$c7ec], a
	ld a, c
	add $fb
	ld [$c2d8], a
	ld a, e
	add $fc
	ld [$c2d9], a
	ld a, c
	ld [$c85f], a
	ld a, e
	ld [$c860], a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c860]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [$c85f]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHalfWordTo
	dw $c865
	xor a
	ld [$c84a], a
	pop bc
	pop bc
	ret

Func_aff1: ; aff1 (2:6ff1)
	ld hl, $c
	call Func_be4d
	call WriteHalfWordTo
	dw $c778
	xor a
Func_affd: ; affd (2:6ffd)
	cp $2
	jp nc, Func_b01a
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c778
	add hl, de
	ld [hl], $ff
	inc a
	jp Func_affd

Func_b01a: ; b01a (2:701a)
	ret

Func_b01b:
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$7
	ld [hl], $0
Func_b025: ; b025 (2:7025)
	ld hl, sp+$7
	ld a, [hl]
	cp $2
	jp nc, Func_b05a
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c778
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld a, [hl]
	cp $ff
	jp nz, Func_b050
	jp Func_b05a

Func_b050: ; b050 (2:7050)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_b025

Func_b05a: ; b05a (2:705a)
	ld hl, sp+$7
	ld a, [hl]
	cp $2
	jp nz, Func_b065
	jp Func_b14d

Func_b065: ; b065 (2:7065)
	push bc
	ld hl, sp+$d
	ld a, [hl]
	call GetHLAtSPPlus6
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	ld [hl], a
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld [hl], $0
	ld hl, sp+$d
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	ld hl, sp+$d
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	inc hl
	ld [hl], $0
	ld hl, sp+$9
	ld [hl], $0
	pop bc
Func_b0c5: ; b0c5 (2:70c5)
	push bc
	ld hl, sp+$a
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	ld bc, $2
	call FarCopyVideoData
	pop bc
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp nz, Func_b0eb
	jp Func_b109

Func_b0eb: ; b0eb (2:70eb)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_b109
	ld hl, sp+$5
	ld a, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp z, Func_b0c5
Func_b109: ; b109 (2:7109)
	ld hl, sp+$5
	ld l, [hl]
	push hl
	ld hl, sp+$6
	ld c, [hl]
	call GetHLAtSPPlus4
	inc hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	call Func_b377
	pop bc
	ld e, a
	cp $ff
	jp nz, Func_b140
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c778
	add hl, de
	ld [hl], $ff
	jp Func_b14d

Func_b140: ; b140 (2:7140)
	ld hl, sp+$6
	ld a, [hl]
	cp e
	jp z, Func_b14d
	ld hl, sp+$b
	ld a, [hl]
	call Func_a6d8
Func_b14d: ; b14d (2:714d)
	add sp, $c
	ret

Func_b150: ; b150 (2:7150)
	add sp, -$e
	xor a
Func_b153: ; b153 (2:7153)
	cp $2
	jp nc, Func_b374
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c778
	add hl, de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld a, [hl]
	ld hl, sp+$e
	ld [hl], a
	cp $ff
	jp nz, Func_b17d
	jp Func_b36f

Func_b17d: ; b17d (2:717d)
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c774
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c776
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	ld hl, sp+$b
	ld [hl], e
	call GetHLAtSPPlus4
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$d
	ld [hl], e
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$c
	ld [hl], e
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	ld hl, sp+$9
	ld [hl], e
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	pop de
	ld l, c
	ld h, b
	inc hl
	ld a, $1
	add [hl]
	ld [hl], a
	cp $10
	jp c, Func_b36f
	push de
	ld l, c
	ld h, b
	inc hl
	ld [hl], $0
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	ld a, [$c2d6]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c830
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [de]
	dec a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	ld hl, sp+$d
	ld a, [hl]
	cp $3
	jp z, Func_b27b
	cp $2
	jp z, Func_b266
	cp $1
	jp z, Func_b25b
	or a
	jp nz, Func_b283
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld hl, sp+$e
	ld [hl], a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	push de
	push hl
	pop de
	pop hl
	jp Func_b283

Func_b25b: ; b25b (2:725b)
	ld hl, sp+$f
	ld a, [hl]
	inc a
	ld hl, sp+$f
	ld [hl], a
	inc de
	jp Func_b283

Func_b266: ; b266 (2:7266)
	ld hl, sp+$e
	ld a, [hl]
	inc a
	ld hl, sp+$e
	ld [hl], a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_b283

Func_b27b: ; b27b (2:727b)
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$f
	ld [hl], a
	dec de
Func_b283: ; b283 (2:7283)
	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	ld hl, sp+$f
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$e
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop de
Func_b2a1: ; b2a1 (2:72a1)
	push de
	ld hl, sp+$b
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$8
	ld bc, $2
	call FarCopyVideoData
	pop de
	ld hl, sp+$6
	ld a, [hl]
	cp $ff
	jp nz, Func_b30e
	ld hl, sp+$7
	ld a, [hl]
	cp $ff
	jp nz, Func_b304
	call GetHLAtSPPlus6
	ld [hl], $ff
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_b301
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw $c21b
	ld e, $3
	ld hl, sp+$e
	ld a, [hl]
	call FarCall
Func_b301: ; b301 (2:7301)
	jp Func_b32a

Func_b304: ; b304 (2:7304)
	ld hl, sp+$7
	ld a, [hl]
	add a
	ld hl, sp+$8
	ld [hl], a
	jp Func_b2a1

Func_b30e: ; b30e (2:730e)
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$6
	cp [hl]
	jp nz, Func_b32a
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$7
	cp [hl]
	jp nz, Func_b32a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_b2a1

Func_b32a: ; b32a (2:732a)
	call GetHLAtSPPlus6
	ld a, [hl]
	cp $ff
	jp z, Func_b359
	ld hl, sp+$7
	ld l, [hl]
	push hl
	ld hl, sp+$8
	ld c, [hl]
	ld hl, sp+$e
	ld e, [hl]
	ld hl, sp+$f
	ld a, [hl]
	call Func_b377
	pop bc
	ld hl, sp+$b
	ld [hl], a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$a
	cp [hl]
	jp z, Func_b359
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$e
	ld a, [hl]
	call Func_a6d8
Func_b359: ; b359 (2:7359)
	ld hl, sp+$b
	ld a, [hl]
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld [hl], a
Func_b36f: ; b36f (2:736f)
	pop af
	inc a
	jp Func_b153

Func_b374: ; b374 (2:7374)
	add sp, $e
	ret

Func_b377: ; b377 (2:7377)
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp c
	jp nc, Func_b384
	ld a, $1
	jp Func_b3a9

Func_b384: ; b384 (2:7384)
	ld a, c
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_b390
	ld a, $3
	jp Func_b3a9

Func_b390: ; b390 (2:7390)
	ld hl, sp+$4
	ld a, [hl]
	cp e
	jp nc, Func_b39b
	xor a
	jp Func_b3a9

Func_b39b: ; b39b (2:739b)
	ld a, e
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_b3a7
	ld a, $2
	jp Func_b3a9

Func_b3a7: ; b3a7 (2:73a7)
	ld a, $ff
Func_b3a9: ; b3a9 (2:73a9)
	pop bc
	ret

Func_b3ab: ; b3ab (2:73ab)
	call Func_0465
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_b150
	ld c, $0
Func_b3bd: ; b3bd (2:73bd)
	ld a, c
	cp $2
	jp nc, Func_b3e2
	ld l, c
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c778
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_b3de
	jp Func_b3e2

Func_b3de: ; b3de (2:73de)
	inc c
	jp Func_b3bd

Func_b3e2: ; b3e2 (2:73e2)
	ld a, c
	cp $2
	jp nz, Func_b3eb
	jp Func_b3ee

Func_b3eb: ; b3eb (2:73eb)
	jp Func_b3ab

Func_b3ee: ; b3ee (2:73ee)
	ret

Func_b3ef:
	push af
	ld a, [$c838]
	add $2
	and $3
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	call Func_a6d8
	pop bc
	ret

Func_b400: ; b400 (2:7400)
	call Func_b41d
	call Func_90e9
	ret

Func_b407: ; b407 (2:7407)
	ld hl, $0
	call WriteHalfWordTo
	dw $c83c
	xor a
	ld [$c840], a
	ld [$c83f], a
	ld [$c83e], a
	ld [$c83b], a
	ret

Func_b41d: ; b41d (2:741d)
	push bc
	push bc
	push de
	push af
	ld [wFarCallDestBank], a
	ld hl, sp+$6
	ld bc, $2
	call FarCopyVideoData
	pop af
	ld [$c83b], a
	pop hl
	call WriteHalfWordTo
	dw $c83c
	pop bc
	ld a, c
	ld [$c83e], a
	ld hl, sp+$0
	ld a, [hl]
	ld [$c83f], a
	ld hl, sp+$1
	ld a, [hl]
	ld [$c840], a
	pop bc
	ret

Data_b449:
	dr $b449, $b44d

Func_b44d: ; b44d (2:744d)
	push bc
	push bc
	push bc
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_b449
	ld bc, $4
	call MemCopy
	call ReadHalfWordAt
	dw $c83c
	ld a, l
	or h
	jp nz, Func_b4bd
	call Func_3d15
	ld hl, sp+$4
	ld [hl], a
	ld hl, $0
	call Func_9f4c
	ld hl, $c857
	cp [hl]
	jp nz, Func_b4b6
	ld a, [$c858]
	cp $1
	jp nz, Func_b4b3
	ld a, [$c838]
	cp $3
	jp z, Func_b4af
	cp $2
	jp z, Func_b4a8
	cp $1
	jp z, Func_b4a1
	or a
	jp nz, Func_b4b3
	ld hl, sp+$4
	ld [hl], $4
	jp Func_b4b3

Func_b4a1: ; b4a1 (2:74a1)
	ld hl, sp+$4
	ld [hl], $1
	jp Func_b4b3

Func_b4a8: ; b4a8 (2:74a8)
	ld hl, sp+$4
	ld [hl], $8
	jp Func_b4b3

Func_b4af: ; b4af (2:74af)
	ld hl, sp+$4
	ld [hl], $2
Func_b4b3: ; b4b3 (2:74b3)
	jp Func_b4ba

Func_b4b6: ; b4b6 (2:74b6)
	xor a
	ld [$c858], a
Func_b4ba: ; b4ba (2:74ba)
	jp Func_b525

Func_b4bd: ; b4bd (2:74bd)
	ld a, [$c840]
	ld l, a
	push hl
	ld a, [$c83f]
	ld c, a
	ld a, [$c860]
	ld e, a
	ld a, [$c85f]
	call Func_b377
	pop bc
	ld hl, sp+$4
	ld [hl], a
	cp $ff
	jp nz, Func_b519
	call ReadHalfWordAt
	dw $c83c
	inc hl
	inc hl
	call WriteHalfWordTo
	dw $c83c
	ld a, [$c83b]
	ld [wFarCallDestBank], a
	ld bc, $2
	call ReadHalfWordAt
	dw $c83c
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call FarCopyVideoData
	ld hl, sp+$4
	ld a, [hl]
	ld [$c83f], a
	ld hl, sp+$5
	ld a, [hl]
	ld [$c840], a
	ld a, [$c83f]
	cp $ff
	jp nz, Func_b515
	ld a, $ff
	jp Func_b528

Func_b515: ; b515 (2:7515)
	xor a
	jp Func_b528

Func_b519: ; b519 (2:7519)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	jp Func_b528

Func_b525: ; b525 (2:7525)
	ld hl, sp+$4
	ld a, [hl]
Func_b528: ; b528 (2:7528)
	pop bc
	pop bc
	pop bc
	ret

Func_b52c: ; b52c (2:752c)
	ld [$c841], a
	ret

Func_b530: ; b530 (2:7530)
	push af
	add $fb
	ld [$c2d8], a
	ld a, e
	add $fc
	ld [$c2d9], a
	pop af
	ld [$c85f], a
	ld a, e
	ld [$c860], a
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c860]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [$c85f]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHalfWordTo
	dw $c865
	ld a, [$c2d8]
	add a
	add a
	add a
	add a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [$c2d9]
	add a
	add a
	add a
	add a
	ld [wSCY2], a
	ld [wSCY], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	call Func_8dc8
	call Func_8f44
	ret

Data_b58a:
	dr $b58a, $b58e

Func_b58e:
	push bc
	push bc
	push af
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_b58a
	ld bc, $4
	call MemCopy
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82a
	add hl, de
	push hl
	ld e, $0
	ld c, $0
	call Func_9a49
	call Func_bfaf
	pop de
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	pop af
	ld [$c838], a
	ld [$c839], a
	call Func_bfaf
	pop bc
	pop bc
	ret

Func_b5db:
	push hl
	ld bc, $0
Func_b5df: ; b5df (2:75df)
	pop hl
	push hl
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_b603
	push bc
	call Func_0465
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_b150
	pop bc
	inc bc
	jp Func_b5df

Func_b603: ; b603 (2:7603)
	pop bc
	ret

Data_b605:
	dr $b605, $b609

Data_b609:
	dr $b609, $b60d

Func_b60d: ; b60d (2:760d)
	push af
	ld a, [wSystemType]
	cp $11
	jp nz, Func_b646
	ld hl, sp+$1
	ld a, [hl]
	cp $fe
	jp nz, Func_b632
	set_farcall_addrs_hli Func_c7759
	ld e, $1
	xor a
	call FarCall
	jp Func_b643

Func_b632: ; b632 (2:7632)
	set_farcall_addrs_hli Func_c7551
	ld e, $0
	xor a
	call FarCall
Func_b643: ; b643 (2:7643)
	jp Func_b65d

Func_b646: ; b646 (2:7646)
	ld hl, sp+$1
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, e
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
Func_b65d: ; b65d (2:765d)
	pop bc
	ret

Func_b65f: ; b65f (2:765f)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_b67c
	set_farcall_addrs_hli Func_c7759
	ld e, $0
	ld a, $1
	call FarCall
	jp Func_b6f1

Func_b67c: ; b67c (2:767c)
	set_farcall_addrs_hli Func_c7bd0
	ld a, [$c867]
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	ld c, $0
Func_b6a2: ; b6a2 (2:76a2)
	ld a, c
	cp $4
	jp nc, Func_b6e2
	push bc
	xor a
Func_b6aa: ; b6aa (2:76aa)
	cp $4
	jp nc, Func_b6b8
	push af
	call Func_0465
	pop af
	inc a
	jp Func_b6aa

Func_b6b8: ; b6b8 (2:76b8)
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, Data_b605
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld e, c
	ld d, $0
	ld hl, Data_b609
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	pop bc
	inc c
	jp Func_b6a2

Func_b6e2: ; b6e2 (2:76e2)
	xor a
Func_b6e3: ; b6e3 (2:76e3)
	cp $4
	jp nc, Func_b6f1
	push af
	call Func_0465
	pop af
	inc a
	jp Func_b6e3

Func_b6f1: ; b6f1 (2:76f1)
	ret

Func_b6f2: ; b6f2 (2:76f2)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_b70f
	set_farcall_addrs_hli Func_c7551
	ld e, $0
	ld a, $1
	call FarCall
	jp Func_b772

Func_b70f: ; b70f (2:770f)
	ld c, $0
Func_b711: ; b711 (2:7711)
	ld a, c
	cp $4
	jp nc, Func_b763
	push bc
	xor a
Func_b719: ; b719 (2:7719)
	cp $4
	jp nc, Func_b727
	push af
	call Func_0465
	pop af
	inc a
	jp Func_b719

Func_b727: ; b727 (2:7727)
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, $3
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, Data_b605
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld e, c
	ld d, $0
	ld hl, $3
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, Data_b609
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	pop bc
	inc c
	jp Func_b711

Func_b763: ; b763 (2:7763)
	xor a
Func_b764: ; b764 (2:7764)
	cp $4
	jp nc, Func_b772
	push af
	call Func_0465
	pop af
	inc a
	jp Func_b764

Func_b772: ; b772 (2:7772)
	ret

Func_b773: ; b773 (2:7773)
	xor a
	ld [$c780], a
	xor a
	ld [$c781], a
	ld a, $3
	ld [$c783], a
	xor a
	ld [$c784], a
	ret

Func_b785:
	push af
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$0
	call FarCall
	ld hl, sp+$3
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld [$c7bd], a
	ld a, [$c7bd]
	cp $c
	jp nc, Func_b7f2
	ld e, a
	ld d, $0
	ld hl, $c7b1
	add hl, de
	ld a, [hl]
	cp $14
	jp z, Func_b7e5
	cp $13
	jp z, Func_b7d4
	cp $12
	jp nz, Func_b7ec
	ld hl, sp+$7
	ld a, [hl]
	ld b, $5
	call DivideAbyB
	ld hl, sp+$7
	add [hl]
	ld [$c781], a
	jp Func_b7f2

Func_b7d4: ; b7d4 (2:77d4)
	ld hl, sp+$7
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld hl, sp+$7
	add [hl]
	ld [$c781], a
	jp Func_b7f2

Func_b7e5: ; b7e5 (2:77e5)
	xor a
	ld [$c781], a
	jp Func_b7f2

Func_b7ec: ; b7ec (2:77ec)
	ld hl, sp+$7
	ld a, [hl]
	ld [$c781], a
Func_b7f2: ; b7f2 (2:77f2)
	ld hl, sp+$7
	ld a, [hl]
	ld [$c782], a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_b7fd:
	ld [$c77d], a
	push de
	push hl
	pop de
	pop hl
	call WriteHalfWordTo
	dw $c77e
	ld a, c
	ld [$c780], a
	set_farcall_addrs_hli Func_e1f2d
	ld a, $11
	call FarCall
	ld [$c784], a
	ret

Func_b821: ; b821 (2:7821)
	add sp, -$3c
	call ReadHalfWordAt
	dw $c83c
	ld a, l
	or h
	jp z, Func_b832
	ld a, $ff
	jp Func_ba44

Func_b832: ; b832 (2:7832)
	ld a, [$c783]
	or a
	jp z, Func_b845
	ld a, [$c783]
	dec a
	ld [$c783], a
	ld a, $ff
	jp Func_ba44

Func_b845: ; b845 (2:7845)
	push bc
	set_farcall_addrs_hli Func_dd67
	ld a, $ff
	call FarCall
	ld hl, sp+$2c
	ld [hl], a
	pop bc
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, $c781
	cp [hl]
	jp nc, Func_ba42
	ld hl, sp+$2a
	xor a
	ld [hl], a
	ld hl, sp+$2b
	ld [hl], a
	ld l, a
	ld h, $0
	call WriteHLToSPPlusParam8
	db $2e
	ld hl, sp+$29
	ld [hl], $0
Func_b876: ; b876 (2:7876)
	ld hl, sp+$29
	ld a, [hl]
	cp $2
	jp nc, Func_b996
	ld c, $0
Func_b880: ; b880 (2:7880)
	ld a, c
	ld hl, $c780
	cp [hl]
	jp nc, Func_b96d
	push bc
	ld a, [$c77d]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c77e
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$30
	ld bc, $e
	call FarCopyVideoData
	pop bc
	ld a, [$c85f]
	ld hl, sp+$2e
	cp [hl]
	jp c, Func_b969
	ld hl, sp+$2e
	ld a, [hl]
	ld hl, sp+$30
	add [hl]
	ld l, a
	ld a, [$c85f]
	cp l
	jp nc, Func_b969
	ld a, [$c860]
	ld hl, sp+$2f
	cp [hl]
	jp c, Func_b969
	ld hl, sp+$2f
	ld a, [hl]
	ld hl, sp+$31
	add [hl]
	ld l, a
	ld a, [$c860]
	cp l
	jp nc, Func_b969
	ld hl, sp+$29
	ld a, [hl]
	or a
	jp nz, Func_b919
	push bc
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $30
	add hl, bc
	call WriteHLToSPPlusParam8
	db $30
	pop bc
	push bc
	ld a, [$c784]
	or a
	jp z, Func_b915
	ld a, [$c780]
	dec a
	cp c
	jp nz, Func_b915
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $30
	add hl, bc
	call WriteHLToSPPlusParam8
	db $30
Func_b915: ; b915 (2:7915)
	pop bc
	jp Func_b969

Func_b919: ; b919 (2:7919)
	ld a, [$c784]
	or a
	jp z, Func_b946
	ld a, [$c780]
	dec a
	cp c
	jp nz, Func_b946
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, Func_b943
	ld hl, sp+$3a
	ld a, [hl]
	add a
	ld hl, sp+$2b
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, Func_b943
	jp Func_b96d

Func_b943: ; b943 (2:7943)
	jp Func_b960

Func_b946: ; b946 (2:7946)
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, Func_b960
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, Func_b960
	jp Func_b96d

Func_b960: ; b960 (2:7960)
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld hl, sp+$2b
	ld [hl], a
Func_b969: ; b969 (2:7969)
	inc c
	jp Func_b880

Func_b96d: ; b96d (2:796d)
	push bc
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_b98b
	set_farcall_addrs_hli Func_dd67
	call GetHLAtSPPlusParam8
	db $30
	ld a, l
	call FarCall
	ld hl, sp+$2c
	ld [hl], a
Func_b98b: ; b98b (2:798b)
	ld hl, sp+$2b
	ld a, [hl]
	inc a
	ld hl, sp+$2b
	ld [hl], a
	pop bc
	jp Func_b876

Func_b996: ; b996 (2:7996)
	ld a, [$c780]
	cp c
	jp z, Func_ba42
	ld a, $3
	ld [$c783], a
	ld hl, sp+$0
	ld [hl], $0
	ld hl, $0
	call WriteHLToSPPlus3
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$4
	ld [hl], $0
	ld hl, sp+$5
	ld [hl], $c5
	ld hl, sp+$6
	ld [hl], $0
	ld hl, sp+$28
	ld [hl], $0
	ld hl, sp+$7
	ld [hl], $0
	ld hl, sp+$8
	ld [hl], $0
	ld hl, sp+$32
	ld a, [hl]
	dec a
	ld hl, sp+$9
	ld [hl], a
	ld hl, sp+$a
	ld [hl], $1
	ld hl, sp+$32
	ld a, [hl]
	cp $1
	jp nz, Func_b9e2
	ld hl, sp+$b
	ld [hl], $1
	jp Func_b9e9

Func_b9e2: ; b9e2 (2:79e2)
	ld hl, sp+$32
	ld a, [hl]
	dec a
	ld hl, sp+$b
	ld [hl], a
Func_b9e9: ; b9e9 (2:79e9)
	ld hl, sp+$39
	ld a, [hl]
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$33
	ld a, [hl]
	ld hl, sp+$34
	cp [hl]
	jp nc, Func_ba11
	set_farcall_addrs_hli Func_dd67
	ld hl, sp+$34
	ld a, [hl]
	ld hl, sp+$33
	sub [hl]
	inc a
	call FarCall
	ld e, a
	jp Func_ba13

Func_ba11: ; ba11 (2:7a11)
	ld e, $1
Func_ba13: ; ba13 (2:7a13)
	ld hl, sp+$33
	ld a, [hl]
	add e
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$36
	ld a, [hl]
	ld hl, sp+$e
	ld [hl], a
	ld hl, sp+$37
	ld a, [hl]
	ld hl, sp+$f
	ld [hl], a
	ld hl, sp+$38
	ld a, [hl]
	ld hl, sp+$10
	ld [hl], a
	ld hl, sp+$35
	ld a, [hl]
	ld hl, sp+$11
	ld [hl], a
	ld bc, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	xor a
	call Func_bbee
	jp Func_ba44

Func_ba42: ; ba42 (2:7a42)
	ld a, $ff
Func_ba44: ; ba44 (2:7a44)
	add sp, $3c
	ret

Func_ba47:
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	push af
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$7
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld [$c7bd], a
	ld a, $1
	ld [$c2fa], a
	callba_hli Func_cb4a
	pop af
	ld [wFarCallDestBank], a
	ld bc, $29
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Predef
	add hl, de
	pop de
	call FarCopyVideoData
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Predef
	add hl, de
	call WriteHLToSPPlus9
	pop bc
	call GetHLAtSPPlus7
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld [hl], $c5
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus7
	ld de, $8
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus7
	ld de, $b
	add hl, de
	ld a, [hl]
	dec a
	call GetHLAtSPPlus7
	ld de, $9
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus7
	ld de, $a
	add hl, de
	ld [hl], $1
	xor a
Func_baed: ; baed (2:7aed)
	cp $4
	jp nc, Func_bb31
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld de, $b
	add hl, de
	add hl, bc
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	pop af
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld de, $b
	add hl, de
	add hl, bc
	ld de, $6
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
	pop af
	inc a
	jp Func_baed

Func_bb31: ; bb31 (2:7b31)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_bb37:
	inc e
	dec e
	jp nz, Func_bba9
	push af
	ld a, $1c
	ld [$c7be], a
	ld a, [$c7be]
	call Func_14fc
	ld c, $2
	ld e, $e
	ld hl, $3e7
	call Func_aa5d
	ld a, $2
	ld [$c838], a
	ld a, $1
	ld [$c7e2], a
	ld de, $100d
	ld hl, $0
	call Func_af7a
	pop af
	cp $1
	jp nz, Func_bba6
	xor a
Func_bb6c: ; bb6c (2:7b6c)
	cp $4
	jp nc, Func_bba6
	push af
	set_farcall_addrs_hli Func_6b94
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_6b94
	pop af
	push af
	ld e, a
	ld d, $0
	inc d
	inc d
	inc d
	ld hl, $0
	call FarCall
	pop af
	inc a
	jp Func_bb6c

Func_bba6: ; bba6 (2:7ba6)
	jp Func_bbc7

Func_bba9: ; bba9 (2:7ba9)
	ld a, $1c
	ld [$c7be], a
	ld a, [$c7be]
	call Func_14fc
	ld a, $2
	ld [$c838], a
	ld a, $1
	ld [$c7e2], a
	ld de, $100d
	ld hl, $0
	call Func_af7a
Func_bbc7: ; bbc7 (2:7bc7)
	ret

Func_bbc8: ; bbc8 (2:7bc8)
	push af
	ld a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, Func_bbe7
	ld a, l
	and $7f
	call FarCall
	jp Func_bbed

Func_bbe7: ; bbe7 (2:7be7)
	ld a, l
	or $80
	call FarCall
Func_bbed: ; bbed (2:7bed)
	ret

Func_bbee: ; bbee (2:7bee)
	push bc
	add sp, -$1e
	push de
	push af
	ld c, a
	call GetHLAtSPPlusParam8
	db $24
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call FarCopyUntilNull
	pop af
	pop de
	ld hl, sp+$0
	ld c, l
	ld b, h
	call Func_ba47
	callba_hli Func_fa81
	callba_hli Func_62865
	callba_hli Func_2328f
	callba_hli Func_cced
	xor a
	ld [$c2fa], a
	ld a, $1
	call Func_bf4a
	push af
	or a
	jp z, Func_bc5a
	ld e, $0
	ld a, $1
	call Func_bb37
	jp Func_bc5e

Func_bc5a: ; bc5a (2:7c5a)
	xor a
	call Func_8ba8
Func_bc5e: ; bc5e (2:7c5e)
	pop af
	cp $1
	jp nz, Func_bc68
	xor a
	jp Func_bc6a

Func_bc68: ; bc68 (2:7c68)
	ld a, $1
Func_bc6a: ; bc6a (2:7c6a)
	add sp, $20
	ret

Func_bc6d:
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	call GetHLAtSPPlusParam8
	db $26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli Func_cb4a
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call Func_ba47
	xor a
	ld [$c2fa], a
	xor a
	ld [$c7c4], a
	set_farcall_addrs_hli Func_10abf
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bcd1
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call Func_aa5d
	cp $1
	jp nz, Func_bcd1
	ld e, $1
	xor a
	call Func_bb37
	ld a, $1
	ld [$c7c4], a
Func_bcd1: ; bcd1 (2:7cd1)
	callba_hli Func_cced
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bce5:
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	call GetHLAtSPPlusParam8
	db $26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli Func_cb4a
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call Func_ba47
	xor a
	ld [$c2fa], a
	xor a
	ld [$c7c4], a
	set_farcall_addrs_hli Func_6c5bb
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bd49
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call Func_aa5d
	cp $1
	jp nz, Func_bd49
	ld e, $2
	xor a
	call Func_bb37
	ld a, $1
	ld [$c7c4], a
Func_bd49: ; bd49 (2:7d49)
	callba_hli Func_cced
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bd5d:
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	call GetHLAtSPPlusParam8
	db $26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli Func_cb4a
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call Func_ba47
	xor a
	ld [$c2fa], a
	xor a
	ld [$c7c4], a
	set_farcall_addrs_hli Func_1228e
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bdc1
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call Func_aa5d
	cp $1
	jp nz, Func_bdc1
	ld e, $3
	xor a
	call Func_bb37
	ld a, $1
	ld [$c7c4], a
Func_bdc1: ; bdc1 (2:7dc1)
	callba_hli Func_cced
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bdd5:
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	call GetHLAtSPPlusParam8
	db $26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli Func_cb4a
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call Func_ba47
	xor a
	ld [$c2fa], a
	xor a
	ld [$c7c4], a
	set_farcall_addrs_hli Func_6d395
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_be39
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call Func_aa5d
	cp $1
	jp nz, Func_be39
	ld e, $4
	xor a
	call Func_bb37
	ld a, $1
	ld [$c7c4], a
Func_be39: ; be39 (2:7e39)
	callba_hli Func_cced
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_be4d: ; be4d (2:7e4d)
	push hl
	set_farcall_addrs_hli Func_17aba
	pop hl
	jp FarCall

Func_be5d: ; be5d (2:7e5d)
	push hl
	set_farcall_addrs_hli Func_17c57
	pop hl
	call FarCall
	ret

Data_be6e:
	dr $be6e, $be73

Data_be73:
	dr $be73, $be77

Func_be77: ; be77 (2:7e77)
	push af
	ld de, $240
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_be95
	push de
	push hl
	pop de
	pop hl
	call Func_be4d
	call WriteHalfWordTo
	dw $c82a
	ld hl, sp+$1
	ld [hl], $1
	jp Func_bea1

Func_be95: ; be95 (2:7e95)
	ld a, [$c7e1]
	ld hl, sp+$1
	cp [hl]
	jp nz, Func_bea1
	jp Func_bf03

Func_bea1: ; bea1 (2:7ea1)
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_be6e
	add hl, de
	ld l, [hl]
	ld a, $35
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82a
	ld bc, $240
	call FarCopyVideoData
	ld hl, $c838
	ld l, [hl]
	ld h, $0
	ld de, Data_be73
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	call ReadHalfWordAt
	dw $c82a
	add hl, de
	push hl
	call Func_bfaf
	pop de
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	call Func_bfaf
	ld hl, sp+$1
	ld a, [hl]
	ld [$c7e1], a
Func_bf03: ; bf03 (2:7f03)
	pop bc
	ret

Func_bf05: ; bf05 (2:7f05)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ret

Func_bf12: ; bf12 (2:7f12)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Func_bf1f:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Func_bf2c: ; bf2c (2:7f2c)
	xor a
	ld [$c851], a
	ld hl, $0
	call WriteHalfWordTo
	dw $c852
	ret

Func_bf39:
	ld [$c851], a
	push de
	push hl
	pop de
	pop hl
	call WriteHalfWordTo
	dw $c852
	ret

Func_bf46: ; bf46 (2:7f46)
	ld [$c857], a
	ret

Func_bf4a: ; bf4a (2:7f4a)
	add sp, -$24
	ld c, $0
	ld e, $0
Func_bf50: ; bf50 (2:7f50)
	ld a, e
	cp $4
	jp nc, Func_bf9c
	push bc
	push de
	set_farcall_addrs_hli Func_6b55
	pop de
	push de
	ld a, e
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop de
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_bf7b
	jp Func_bf98

Func_bf7b: ; bf7b (2:7f7b)
	push bc
	push de
	set_farcall_addrs_hli Func_6e1b
	pop de
	push de
	ld l, e
	ld h, $0
	call FarCall
	pop de
	pop bc
	ld a, l
	or h
	jp z, Func_bf98
	inc c
Func_bf98: ; bf98 (2:7f98)
	inc e
	jp Func_bf50

Func_bf9c: ; bf9c (2:7f9c)
	inc c
	dec c
	jp nz, Func_bfab
	ld a, $ff
	ld [$c838], a
	ld a, $1
	jp Func_bfac

Func_bfab: ; bfab (2:7fab)
	xor a
Func_bfac: ; bfac (2:7fac)
	add sp, $24
	ret

Func_bfaf: ; bfaf (2:7faf)
	ld a, [rLCDC]
	and $80
	jp z, Func_bfb9
	call WaitVideoTransfer
Func_bfb9: ; bfb9 (2:7fb9)
	ret

SECTION "Bank 03", ROMX, BANK [$03]
Func_c000:
	ret

Data_c001:
	dr $c001, $c009

Data_c009:
	dr $c009, $c016

Data_c016:
	dr $c016, $c5dd

Data_c5dd:
	dr $c5dd, $c6e1

Data_c6e1:
	dr $c6e1, $c6eb

Data_c6eb:
	dr $c6eb, $c6ed

Data_c6ed:
	dr $c6ed, $c6fd

Data_c6fd:
	dr $c6fd, $c6ff

Func_c6ff: ; c6ff (3:46ff)
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	ret

Func_c72e: ; c72e (3:472e)
	ld a, [$c2cd]
	or a
	jp nz, Func_c740
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_c748

Func_c740: ; c740 (3:4740)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_c748: ; c748 (3:4748)
	ret

	call Func_c72e
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ret

Func_c758: ; c758 (3:4758)
	push af
	push de
	set_farcall_addrs_hli Func_5c328
	pop de
	pop af
	call FarCall
	ret

Data_c76b:
	dr $c76b, $c779

Func_c779: ; c779 (3:4779)
	ld a, [$c2cd]
	ld e, a
	ld a, $2
	call Func_c758
	ld a, [wSystemType]
	cp $1
	jp z, Func_c792
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_c79d
Func_c792: ; c792 (3:4792)
	ld c, $1
	ld de, $e
	ld hl, Data_c76b
	call Func_2a79
Func_c79d: ; c79d (3:479d)
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, $1
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Func_c7ba:
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call Func_c72e
	call Func_c6ff
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $b05
	call FarCall
	call Func_c779
	ret

Func_c812:
	push hl
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop af
	pop hl
	push af
	ld de, $c980
	call CopyUntilNull
	pop af
	push hl
	call GetSRAMBank
	pop hl
	ret

Func_c82b:
	push hl
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, $c98d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	inc hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call CopyUntilNull
	call WriteHLToSPPlus4
	pop af
	call GetSRAMBank
	pop hl
	push hl
	pop bc
	ret

DelayFrames_NoHalt: ; c85d (3:485d)
.loop
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .loop
	ret

Func_c868: ; c868 (3:4868)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_60621
	pop bc
	ld a, c
	and $e0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, c
	and $1f
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	pop bc
	ret

Func_c896: ; c896 (3:4896)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_c8ab: ; c8ab (3:48ab)
	add $2
	ld e, a
	ld hl, $b
	ld c, $3
	call Func_c896
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	ret

Pointers_c8c1:
	dw Data_c8cb
	dw Data_c8d5
	dw Data_c8de
	dw Data_c8e6
	dw Data_c8ed

Data_c8cb:
	db "<HIRA>たのんたﾞそﾞ<KATA>", $00

Data_c8d5:
	db "<HIRA>かﾞんはﾞれ<KATA>", $00

Data_c8de:
	db "<HIRA>いっけぇー<KATA>", $00

Data_c8e6:
	db "<HIRA>よしっ<KATA> ", $00

Data_c8ed
	db " <HIRA>ゆけっ!!<KATA>", $00

Data_c8f6:
	dr $c8f6, $c8fe

Func_c8fe:
	add sp, -$68
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_c8f6
	ld bc, $8
	call MemCopy
	ld hl, sp+$29
	call WriteHLToSPPlusParam8
	db $25
	ld hl, sp+$48
.asm_c917
	call WriteHLToSPPlusParam8
	db $27
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $29
	ld hl, sp+$f
	call Func_c812
	ld hl, sp+$f
	push hl
	call GetHLAtSPPlusParam8
	db $27
	pop de
	call LiteralStringInTree
	call GetHLAtSPPlusParam8
	db $25
	call Func_292b
	ld e, a
	push de
	ld hl, sp+$11
	call Func_c82b
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c9b8
	ld hl, sp+$12
	ld [hl], $0
Func_c94f: ; c94f (3:494f)
	ld hl, sp+$12
	ld a, [hl]
	cp $4
	jp nc, Func_c976
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_c964
	jp Func_c976

Func_c964: ; c964 (3:4964)
	ld hl, sp+$12
	ld a, [hl]
	inc a
	ld hl, sp+$12
	ld [hl], a
	ld hl, $23
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_c94f

Func_c976: ; c976 (3:4976)
	ld hl, sp+$12
	ld a, [hl]
	cp $4
	jp nc, Func_c985
	ld hl, sp+$12
	ld [hl], $0
	jp Func_c9e8

Func_c985: ; c985 (3:4985)
	ld hl, $c98d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	call WriteHLToSPPlusParam8
	db $12
	ld hl, sp+$c
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $12
	ld de, $e
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $14
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_2617
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_c9de
	ld hl, sp+$d
	ld a, [hl]
	or a
	jp nz, Func_c9de
	ld hl, sp+$e
	ld a, [hl]
	cp $80
	jp nc, Func_c9de
	ld hl, sp+$12
	ld [hl], $1
	jp Func_c9e8

Func_c9de: ; c9de (3:49de)
	ld a, $2
	call Func_dd67
	add $2
	ld hl, sp+$12
	ld [hl], a
Func_c9e8: ; c9e8 (3:49e8)
	pop af
	call GetSRAMBank
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_c8c1
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $2b
	pop de
	call CopyUntilNull
	ld c, l
	ld b, h
	ld hl, sp+$10
	ld a, [hl]
	cp $3
	jp nc, Func_ca22
	ld a, $21
	ld [bc], a
	inc bc
	ld a, $20
	ld [bc], a
	inc bc
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call LiteralStringInTree
	jp Func_ca3e

Func_ca22: ; ca22 (3:4a22)
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call LiteralStringInTree
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw $48c9
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	dec hl
	call CopyUntilNull
Func_ca3e: ; ca3e (3:4a3e)
	pop de
	push de
	ld a, e
	call Func_c8ab
	ld c, $0
Func_ca46: ; ca46 (3:4a46)
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$25
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_ca78
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $10c
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
	inc c
	jp Func_ca46

Func_ca78: ; ca78 (3:4a78)
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call Func_c72e
	set_farcall_addrs_hli Func_62a3
	ld bc, $b
	ld de, $1311
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	pop de
	ld a, e
	add $2
	ld e, a
	ld a, [wSystemType]
	cp $11
	jp nz, Func_cb00
	push de
	set_farcall_addrs_hli Func_667d
	pop de
	push de
	ld l, e
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $11
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $b
	ld bc, $3
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	set_farcall_addrs_hli Func_62a3
	ld bc, $1d
	ld de, $1323
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
	pop de
Func_cb00: ; cb00 (3:4b00)
	push de
	call WaitVideoTransfer
	pop de
	ld a, [wSystemType]
	cp $1
	jp z, Func_cb15
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_cb22
Func_cb15: ; cb15 (3:4b15)
	ld hl, sp+$6
	ld [hl], e
	ld c, $1
	ld de, $8
	ld hl, sp+$0
	call Func_2a79
Func_cb22: ; cb22 (3:4b22)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_cb2e: ; cb2e (3:4b2e)
	cp $3c
	jp nc, Func_cb3c
	push af
	call Func_0451
	pop af
	inc a
	jp Func_cb2e

Func_cb3c: ; cb3c (3:4b3c)
	ld a, [$c2cd]
	xor $1
	ld e, a
	ld a, $2
	call Func_c758
	add sp, $68
	ret

Func_cb4a: ; cb4a (3:4b4a)
	call ReadHalfWordAt
	dw wc2e6
	ld a, l
	or h
	jp nz, Func_cc0b
	set_farcall_addrs_hli Func_17ab6
	ld a, $2
	call FarCall
	set_farcall_addrs_hli Func_17aba
	ld hl, $34a
	call FarCall
	call WriteHalfWordTo
	dw wc2e6
	ld bc, $34a
	ld e, $0
	call ReadHalfWordAt
	dw wc2e6
	call FillMemory
	set_farcall_addrs_hli Func_17aba
	ld hl, $80
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17aba
	ld hl, $91
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld bc, $91
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld e, $0
	call FillMemory
	set_farcall_addrs_hli Func_17aba
	ld hl, $df
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17ab6
	xor a
	call FarCall
Func_cc0b: ; cc0b (3:4c0b)
	ret

Func_cc0c:
	call ReadHalfWordAt
	dw wc2e6
	ld a, l
	or h
	jp nz, Func_ccec
	set_farcall_addrs_hli Func_17ab6
	ld a, $2
	call FarCall
	set_farcall_addrs_hli Func_17aba
	ld hl, $34a
	call FarCall
	call WriteHalfWordTo
	dw wc2e6
	ld bc, $34a
	ld e, $0
	call ReadHalfWordAt
	dw wc2e6
	call FillMemory
	set_farcall_addrs_hli Func_17aba
	ld hl, $80
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17aba
	ld hl, $91
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld bc, $91
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld e, $0
	call FillMemory
	set_farcall_addrs_hli Func_17aba
	ld hl, $df
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17aba
	ld hl, $351
	call FarCall
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17ab6
	xor a
	call FarCall
Func_ccec: ; ccec (3:4cec)
	ret

Func_cced: ; cced (3:4ced)
	call ReadHalfWordAt
	dw wc2e6
	ld a, l
	or h
	jp z, Func_cd99
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call FarCall
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_cd7e
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call FarCall
Func_cd7e: ; cd7e (3:4d7e)
	set_farcall_addrs_hli Func_17c57
	call ReadHalfWordAt
	dw wc2e6
	call FarCall
	ld hl, $0
	call WriteHalfWordTo
	dw wc2e6
Func_cd99: ; cd99 (3:4d99)
	ret

Func_cd9a: ; cd9a (3:4d9a)
	callba_hli Func_bf214
	ret

Func_cda9:
	call DisableHBlank
	xor a
	ld [rSCX], a
	ld [wc2e0 + 4], a
	ld a, [wLCDC]
	ld [rLCDC], a
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ret

Func_cdc0: ; cdc0 (3:4dc0)
	push af
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f0c
	ld hl, $5
	call FarCall
	ld a, [wSystemType]
	cp $11
	jp nz, Func_ce13
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	ld de, $1f0c
	ld hl, $5
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_ce13: ; ce13 (3:4e13)
	call WaitVideoTransfer
	pop bc
	ret

Func_ce18: ; ce18 (3:4e18)
	push af
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	pop af
	or a
	jp nz, Func_ce73
	set_farcall_addrs_hli Func_7c8a
	ld a, [$c2cd]
	ld c, a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld a, [$c2cd]
	ld c, a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $b05
	call FarCall
	jp Func_ce79

Func_ce73: ; ce73 (3:4e73)
	ld a, [$c2cd]
	call Func_cdc0
Func_ce79: ; ce79 (3:4e79)
	call WaitVideoTransfer
	call Func_c72e
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $4da9
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_cea1: ; cea1 (3:4ea1)
	ld a, [wNextVBlankFlags]
	and $80
	jp nz, Func_cea1
	ld e, $2
	ld a, [$c2cd]
	call Func_c758
	ld a, [$c2cd]
	xor $1
	call Func_cdc0
	call Func_27f5
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, $1
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Func_ced9:
	ld a, [wBlinkerOffTile]
	ld [wc2e0 + 4], a
	ret

Data_cee0:
	db  2, -2,  2, -2
	db  8,  8,  8,  8
	db  2,  2,  2,  2

Func_ceec: ; ceec (3:4eec)
	push af
	push bc
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_cf49
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_cf49: ; cf49 (3:4f49)
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, Func_ced9
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wc2e0 + 4]
	ld [wBlinkerOffTile], a
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	ld hl, sp+$7
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	pop de
Func_cf71: ; cf71 (3:4f71)
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$9
	cp [hl]
	jp nc, Func_cfde
	ld hl, sp+$5
	ld a, [hl]
	cp e
	jp nc, Func_cfde
	push bc
	push de
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $28
	call Func_de2c
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$d
	cp [hl]
	jp nc, Func_cfaa
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	add [hl]
	ld hl, sp+$a
	ld [hl], a
	ld a, [wBlinkerOffTile]
	ld hl, sp+$7
	add [hl]
	ld [wBlinkerOffTile], a
Func_cfaa: ; cfaa (3:4faa)
	pop de
	pop bc
	push bc
	push de
	ld hl, sp+$9
	ld a, [hl]
	cp e
	jp nc, Func_cfce
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$6
	add [hl]
	ld hl, sp+$9
	ld [hl], a
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_cfce: ; cfce (3:4fce)
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	jp Func_cf71

Func_cfde: ; cfde (3:4fde)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_cfef:
	dr $cfef, $cff2

Data_cff2:
	dr $cff2, $cffa

Data_cffa:
	dr $cffa, $d005

Data_d005:
	dr $d005, $d015

Data_d015:
	dr $d015, $d020

Data_d020:
	dr $d020, $d030

Func_d030:
	push bc
	push af
	ld hl, $a0
	call WriteHLToSPPlus4
	ld a, $1
	ld [wc2e0 + 1], a
	ld a, $27
	ld [wc2e0 + 2], a
	ld a, $67
	ld [wc2e0 + 3], a
	xor a
	ld [wc2e0 + 4], a
	xor a
	ld [wc2e0 + 5], a
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $0
	set_farcall_addrs_hli Func_7c8a
	pop af
	cp $6
	jp z, Func_d156
	cp $5
	jp z, Func_d14d
	cp $4
	jp z, Func_d144
	cp $3
	jp z, Func_d13b
	cp $2
	jp z, Func_d111
	cp $1
	jp z, Func_d0d5
	or a
	jp nz, Func_d15c
	ld hl, $a0
	pop de
	push hl
	ld a, [$c2cd]
	ld c, a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1805
	call FarCall
	ld hl, Data_cfef
	call Func_e4d1
	call EnableHBlank
	ld l, $0
	push hl
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld e, $48
	ld a, $48
	call Func_ceec
	pop bc
	xor a
	call Func_ce18
	jp Func_d15c

Func_d0d5: ; d0d5 (3:50d5)
	ld hl, $a0
	pop de
	push hl
	ld a, [$c2cd]
	ld c, a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1805
	call FarCall
	ld a, $48
	ld hl, Data_cfef
	call Func_e4d1
	call EnableHBlank
	ld l, $0
	push hl
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld e, $48
	ld a, $48
	call Func_ceec
	pop bc
	xor a
	call Func_ce18
	jp Func_d18c

Func_d111: ; d111 (3:5111)
	ld hl, $58
	pop de
	push hl
	ld a, $48
	ld c, a
	push bc
	push af
	ld hl, Data_cff2
	call Func_f723
	call EnableHBlank
	pop af
	pop bc
	ld l, $2
	push hl
	ld e, a
	ld a, c
	ld hl, sp+$2
	ld c, l
	ld b, h
	call Func_ceec
	pop bc
	ld a, $1
	call Func_ce18
	jp Func_d15c

Func_d13b: ; d13b (3:513b)
	ld hl, Data_cffa
	call Func_f723
	jp Func_d15c

Func_d144: ; d144 (3:5144)
	ld hl, Data_d005
	call Func_f723
	jp Func_d15c

Func_d14d: ; d14d (3:514d)
	ld hl, Data_d015
	call Func_f723
	jp Func_d15c

Func_d156: ; d156 (3:5156)
	ld hl, Data_d020
	call Func_f723
Func_d15c: ; d15c (3:515c)
	ld a, [$c2cd]
	or a
	jp nz, Func_d16e
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_d176

Func_d16e: ; d16e (3:516e)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_d176: ; d176 (3:5176)
	call DisableHBlank
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
Func_d18c: ; d18c (3:518c)
	pop bc
	ret

Func_d18e: ; d18e (3:518e)
	push de
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_2515
	pop bc
	pop bc
	ret

	push af
	add sp, -$18
	push de
	ld hl, sp+$18
	ld [hl], $2
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d1c1
	ld hl, sp+$19
	ld [hl], $0
	jp Func_d1c5

Func_d1c1: ; d1c1 (3:51c1)
	ld hl, sp+$19
	ld [hl], $b
Func_d1c5: ; d1c5 (3:51c5)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d1de
	ld hl, $0
	jp Func_d1e1

Func_d1de: ; d1de (3:51de)
	ld hl, $2f
Func_d1e1: ; d1e1 (3:51e1)
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $12
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, c
	sub e
	ld l, a
	ld a, b
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $12
	call GetHLAtSPPlusParam8
	db $12
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_d221
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $12
Func_d221: ; d221 (3:5221)
	call GetHLAtSPPlusParam8
	db $12
	ld e, h
	ld hl, sp+$a
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $12
	ld e, l
	ld hl, sp+$b
	ld [hl], e
	ld hl, sp+$6
	ld [hl], b
	ld hl, sp+$7
	ld [hl], c
	ld hl, sp+$9
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$2
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	ld de, $30
	call Func_2617
Func_d252: ; d252 (3:5252)
	ld hl, sp+$12
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call Func_1a1f
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d280
	inc e
Func_d280: ; d280 (3:5280)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d2ac
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d2c9
Func_d2ac: ; d2ac (3:52ac)
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$6
	ld h, [hl]
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d2c9: ; d2c9 (3:52c9)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_3bc5
	pop bc
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	call Func_fdb7
	or a
	jp z, Func_d2ea
	jp Func_d300

Func_d2ea: ; d2ea (3:52ea)
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	call Func_fddb
	cp $1
	jp z, Func_d2fd
	jp Func_d300

Func_d2fd: ; d2fd (3:52fd)
	jp Func_d252

Func_d300: ; d300 (3:5300)
	ld hl, sp+$12
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	push hl
	call GetHLAtSPPlusParam8
	db $14
	pop de
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call Func_1a1f
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d329
	inc e
Func_d329: ; d329 (3:5329)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	call GetHLAtSPPlusParam8
	db $12
	push hl
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d365
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d384
Func_d365: ; d365 (3:5365)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d384: ; d384 (3:5384)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_3ca1
	pop bc
	call GetHLAtSPPlusParam8
	db $12
	push de
	push hl
	pop de
	pop hl
	add sp, $1a
	push de
	push hl
	pop de
	pop hl
	ret

Func_d3a2:
	push af
	add sp, -$18
	push de
	ld hl, sp+$18
	ld [hl], $2
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d3b8
	ld hl, sp+$19
	ld [hl], $0
	jp Func_d3bc

Func_d3b8: ; d3b8 (3:53b8)
	ld hl, sp+$19
	ld [hl], $b
Func_d3bc: ; d3bc (3:53bc)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d3d5
	ld hl, $0
	jp Func_d3d8

Func_d3d5: ; d3d5 (3:53d5)
	ld hl, $2f
Func_d3d8: ; d3d8 (3:53d8)
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $12
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld l, c
	ld h, b
	add hl, de
	call WriteHLToSPPlusParam8
	db $12
	call GetHLAtSPPlusParam8
	db $12
	push hl
	call GetHLAtSPPlusParam8
	db $12
	pop de
	call CompareHLtoDE
	jp nc, Func_d415
	call GetHLAtSPPlusParam8
	db $10
	call WriteHLToSPPlusParam8
	db $12
Func_d415: ; d415 (3:5415)
	call GetHLAtSPPlusParam8
	db $12
	ld e, h
	ld hl, sp+$a
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $12
	ld e, l
	ld hl, sp+$b
	ld [hl], e
	ld hl, sp+$6
	ld [hl], b
	ld hl, sp+$7
	ld [hl], c
	ld hl, sp+$9
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$2
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	ld de, $30
	call Func_2617
Func_d446: ; d446 (3:5446)
	ld hl, sp+$12
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call Func_1a1f
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d474
	inc e
Func_d474: ; d474 (3:5474)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d4a0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d4bd
Func_d4a0: ; d4a0 (3:54a0)
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$6
	ld h, [hl]
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d4bd: ; d4bd (3:54bd)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_3bc5
	pop bc
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	call Func_fdc9
	or a
	jp z, Func_d4de
	jp Func_d4f4

Func_d4de: ; d4de (3:54de)
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	call Func_fddb
	cp $ff
	jp z, Func_d4f1
	jp Func_d4f4

Func_d4f1: ; d4f1 (3:54f1)
	jp Func_d446

Func_d4f4: ; d4f4 (3:54f4)
	ld hl, sp+$12
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	push hl
	call GetHLAtSPPlusParam8
	db $14
	pop de
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call Func_1a1f
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d51d
	inc e
Func_d51d: ; d51d (3:551d)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	call GetHLAtSPPlusParam8
	db $12
	push hl
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d559
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d578
Func_d559: ; d559 (3:5559)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d578: ; d578 (3:5578)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_3ca1
	pop bc
	call GetHLAtSPPlusParam8
	db $12
	push de
	push hl
	pop de
	pop hl
	add sp, $1a
	push de
	push hl
	pop de
	pop hl
	ret

Func_d596: ; d596 (3:5596)
	add sp, -$1a
	ld hl, sp+$6
	ld [hl], $1
	or a
	jp nz, Func_d5a7
	ld hl, sp+$7
	ld [hl], $0
	jp Func_d5ab

Func_d5a7: ; d5a7 (3:55a7)
	ld hl, sp+$7
	ld [hl], $b
Func_d5ab: ; d5ab (3:55ab)
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	or a
	jp nz, Func_d5c2
	ld hl, $0
	jp Func_d5c5

Func_d5c2: ; d5c2 (3:55c2)
	ld hl, $2f
Func_d5c5: ; d5c5 (3:55c5)
	add hl, de
	call WriteHLToSPPlus8
	ld de, Data_d747
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld de, Data_d751
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	inc hl
	inc hl
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$a
	call LiteralStringInTree
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	add $5
	call SetStringStartState
	call GetHLAtSPPlus8
	ld de, $22
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_d621
	cp $a
	jp nz, Func_d63d
Func_d621: ; d621 (3:5621)
	call GetHLAtSPPlus8
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, $9a
	push hl
	ld hl, Data_d75a
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_d665

Func_d63d: ; d63d (3:563d)
	push af
	ld hl, Data_d760
	push hl
	call PlaceString
	pop bc
	ld a, $19
	ld [wFarCallDestBank], a
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, $6f37
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$a
	call LiteralStringInTree
	ld hl, sp+$a
	push hl
	call PlaceString
	pop bc
Func_d665: ; d665 (3:5665)
	pop af
	push af
	or a
	jp z, Func_d681
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d6e2
Func_d681: ; d681 (3:5681)
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $400
	add hl, de
	add hl, bc
	ld de, Data_d762
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlus8
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $500
	add hl, de
	add hl, bc
	ld de, $100
	pop bc
	call Func_2230
Func_d6e2: ; d6e2 (3:56e2)
	ld hl, sp+$2
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus10
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_2617
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$2
	call Func_1a1f
	ld hl, sp+$3
	ld c, [hl]
	ld hl, sp+$4
	ld a, [hl]
	and $80
	jp z, Func_d71b
	inc c
Func_d71b: ; d71b (3:571b)
	inc c
	dec c
	jp nz, Func_d735
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_d735
	ld c, $1
Func_d735: ; d735 (3:5735)
	pop af
	ld l, a
	push hl
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	call Func_d18e
	pop bc
	add sp, $1a
	ret

Data_d747:
	db "         ", $00

Data_d751:
	db "        ", $00

Data_d75a:
	TX_STACK
	db "V"
	TX_SNUM
	db $00

Data_d760:
	db " ", $00

Data_d762:
	db "/   ", $00

Func_d767:
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	set_farcall_addrs_hli Func_667d
	ld bc, $8702
	ld de, $903
	ld hl, $900
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8602
	ld de, $a03
	ld hl, $a00
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8402
	ld de, $804
	ld hl, $4
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8402
	ld de, $1304
	ld hl, $b04
	call FarCall
	ld hl, $904
	call Coord2TileMap
	ld [hl], $85
	ld hl, $a04
	call Coord2TileMap
	ld [hl], $83
	xor a
	call Func_d596
	ld a, $1
	call Func_d596
	ret

Data_d7e7:
	dr $d7e7, $d7f5

Func_d7f5: ; d7f5 (3:57f5)
	push bc
	push bc
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	pop de
	push bc
	cp $7
	jp z, Func_da26
	cp $6
	jp z, Func_da0c
	cp $5
	jp z, Func_d9f5
	cp $4
	jp z, Func_d99a
	cp $3
	jp z, Func_d96d
	cp $2
	jp z, Func_d945
	cp $1
	jp z, Func_d833
	or a
	jp nz, Func_dacf
Func_d833: ; d833 (3:5833)
	push af
	push de
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	ld e, [hl]
	xor a
	call Func_dbf5
	pop de
	push de
	ld hl, $5
	add hl, de
	ld c, [hl]
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, $1
	call Func_dbf5
	pop de
	push de
	ld a, [de]
	ld l, a
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
	pop de
	push hl
	ld l, e
	ld h, d
	inc hl
	ld c, [hl]
	ld a, c
	cp $ff
	jp nz, Func_d8a2
	ld hl, sp+$8
	ld [hl], $1
	call GetHLAtSPPlus8
	ld de, $2f
	add hl, de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	call GetHLAtSPPlus8
	ld de, hFFC9 + 8
	add hl, de
	call WriteHLToSPPlus8
	jp Func_d8a6

Func_d8a2: ; d8a2 (3:58a2)
	ld hl, sp+$8
	ld [hl], $0
Func_d8a6: ; d8a6 (3:58a6)
	pop hl
	pop af
	or a
	jp nz, Func_d8cd
	ld e, c
	ld a, l
	call Func_e015
	ld a, [wSystemType]
	cp $1
	jp z, Func_d8c1
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_d8ca
Func_d8c1: ; d8c1 (3:58c1)
	ld de, $e
	ld hl, Data_d7e7
	call Func_2b7d
Func_d8ca: ; d8ca (3:58ca)
	jp Func_d938

Func_d8cd: ; d8cd (3:58cd)
	call Func_27f5
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call Func_c72e
	call Func_c6ff
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1311
	ld hl, $0
	call FarCall
	ld a, [wSystemType]
	cp $11
	jp nz, Func_d932
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld a, [$c2cd]
	ld c, a
	ld b, $0
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_d932: ; d932 (3:5932)
	call WaitVideoTransfer
	call Func_c779
Func_d938: ; d938 (3:5938)
	xor a
	call Func_d030
	call Func_c8fe
	call Func_c7ba
	jp Func_dacf

Func_d945: ; d945 (3:5945)
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	ld e, [hl]
	xor a
	call Func_dbf5
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
	jp Func_dacf

Func_d96d: ; d96d (3:596d)
	ld hl, $5
	add hl, de
	ld c, [hl]
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, $1
	call Func_dbf5
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $2
	jp Func_dacf

Func_d99a: ; d99a (3:599a)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_d9c5
	ld c, $7
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	jp Func_d9de

Func_d9c5: ; d9c5 (3:59c5)
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	ld c, $7
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
Func_d9de: ; d9de (3:59de)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $0
	jp Func_d8cd

Func_d9f5: ; d9f5 (3:59f5)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
	jp Func_dacf

Func_da0c: ; da0c (3:5a0c)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $2
	jp Func_dacf

Func_da26: ; da26 (3:5a26)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_da51
	ld c, $7
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	jp Func_da6a

Func_da51: ; da51 (3:5a51)
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	ld c, $7
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
Func_da6a: ; da6a (3:5a6a)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld l, a
	call GetHLAtSPPlus4
	ld de, $2f
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	ld e, c
	ld a, $c5
	call Func_e015
	ld a, [wSystemType]
	cp $1
	jp z, Func_daae
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_dab7
Func_daae: ; daae (3:5aae)
	ld de, $e
	ld hl, Data_d7e7
	call Func_2b7d
Func_dab7: ; dab7 (3:5ab7)
	xor a
	call Func_d030
	call Func_c8fe
	call Func_c7ba
	call GetHLAtSPPlus4
	ld de, hFFC9 + 8
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
Func_dacf: ; dacf (3:5acf)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp z, Func_db78
	cp $1
	jp z, Func_db2f
	or a
	jp nz, Func_dbd3
	ld a, $2
	call Func_d030
	call Func_c6ff
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call Func_dc0a
	pop hl
	push hl
	ld de, $2f
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call Func_dc0a
	ld a, $1
	call Func_d030
	jp Func_dbd3

Func_db2f: ; db2f (3:5b2f)
	push bc
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $4
	jp nz, Func_db5a
	ld a, $3
	call Func_d030
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_db5a: ; db5a (3:5b5a)
	pop bc
	ld hl, $8
	add hl, bc
	ld a, $fb
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call Func_dc0a
	ld a, $4
	call Func_d030
	jp Func_dbd3

Func_db78: ; db78 (3:5b78)
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, $fe
	and [hl]
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and $4
	jp nz, Func_dbb7
	ld a, $5
	call Func_d030
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_dbb7: ; dbb7 (3:5bb7)
	pop bc
	ld hl, $9
	add hl, bc
	ld a, $fb
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call Func_dc0a
	ld a, $6
	call Func_d030
Func_dbd3: ; dbd3 (3:5bd3)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	ret

Func_dbe2:
	push hl
	push de
	set_farcall_addrs_hli Func_6086c
	pop de
	pop hl
	call FarCall
	ret

Func_dbf5: ; dbf5 (3:5bf5)
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_609d3
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_dc0a: ; dc0a (3:5c0a)
	push af
	push de
	set_farcall_addrs_hli Func_5c0b2
	pop de
	pop af
	call FarCall
	ret

Func_dc1d:
	push de
	ld e, a
	xor a
	call Func_dc0a
	pop de
	ld a, $1
	call Func_dc0a
	ret

Data_dc2a:
	db $1, $0

Func_dc2c: ; dc2c (3:5c2c)
	push hl
	call Func_27f5
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	ld a, $28
	ld [rLYC], a
	xor a
	ld [wc2e0 + 1], a
	ld a, $28
	ld [wc2e0 + 2], a
	ld a, $69
	ld [wc2e0 + 3], a
	call EnableHBlank
	call DelayFrames_NoHalt
	call WaitVideoTransfer
	callba_hli Func_5d113
	ld hl, Data_dc2a
	call Func_f723
	pop hl
	call Func_f723
	call Func_27f5
	callba_hli Func_5d113
	ld hl, Data_dc2a
	call Func_f723
	call DisableHBlank
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call WaitVideoTransfer
	ret

Func_dcaf:
	push af
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld a, [hl]
	cp $ff
	jp z, Func_dcd3
	ld a, [de]
	and $4
	jp z, Func_dcd6
Func_dcd3: ; dcd3 (3:5cd3)
	jp Func_dd07

Func_dcd6: ; dcd6 (3:5cd6)
	ld hl, sp+$3
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $46
	jp nc, Func_dcf3
	ld hl, sp+$0
	call Func_f0cf
	jp Func_dd07

Func_dcf3: ; dcf3 (3:5cf3)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_c5dd
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_dc2c
Func_dd07: ; dd07 (3:5d07)
	pop bc
	pop bc
	ret

Func_dd0a:
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], a
	pop de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_c6eb
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_dc2c
	ret

Func_dd29:
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $0
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_c6ed
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_dc2c
	ret

Func_dd47:
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], a
	call ReadHalfWordAt
	dw Data_c6fd
	call Func_dc2c
	ret

Func_dd5a:
	ld a, $64
	call Func_dd67
	ld hl, $4000
	ret

Data_dd63:
	ds $4

Func_dd67: ; dd67 (3:5d67)
	push bc
	push bc
	push af
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_dd63
	ld bc, $4
	call MemCopy
	call ReadHalfWordAt
	dw $c237
	ld de, $6d
	call MultiplyHLbyDE
	ld de, $3fd
	add hl, de
	ld a, h
	and $7f
	ld h, a
	call WriteHalfWordTo
	dw $c237
	call ReadHalfWordAt
	dw $c237
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	call ReadHalfWordAt
	dw $c237
	ld de, $100
	call DivideHLByDESigned
	ld hl, sp+$5
	ld [hl], e
	pop af
	ld hl, sp+$0
	ld c, l
	ld b, h
	add a
	ld e, a
	ld d, $0
	ld hl, sp+$0
	call Func_1a1f
	ld hl, sp+$1
	ld a, [hl]
	pop bc
	pop bc
	ret

Func_ddc2:
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $fe
	ld c, $1
	ld hl, sp+$1
	ld a, [rLY]
	ld [hl], a
Func_ddcf: ; ddcf (3:5dcf)
	ld a, [rLY]
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	cp e
	jp z, Func_de1b
	ld hl, sp+$0
	ld a, [hl]
	ld [rSCX], a
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$0
	ld a, [hl]
	add c
	ld hl, sp+$0
	ld [hl], a
	ld a, c
	cp $1
	jp nz, Func_ddfb
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nz, Func_ddfb
	ld c, $ff
	jp Func_de0b

Func_ddfb: ; ddfb (3:5dfb)
	ld a, c
	cp $ff
	jp nz, Func_de0b
	ld hl, sp+$0
	ld a, [hl]
	cp $fe
	jp nz, Func_de0b
	ld c, $1
Func_de0b: ; de0b (3:5e0b)
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, Func_de1b
	jp Func_de1e

Func_de1b: ; de1b (3:5e1b)
	jp Func_ddcf

Func_de1e: ; de1e (3:5e1e)
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop bc
	pop bc
	ret

Func_de2c: ; de2c (3:5e2c)
	push hl
	push bc
	push bc
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wOAMBuffer2
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	call WriteHLToSPPlus8
	pop de
	ld hl, $10
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp z, Func_de6c
	ld hl, $30
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld bc, $fff0
	jp Func_de6f

Func_de6c: ; de6c (3:5e6c)
	ld bc, $10
Func_de6f: ; de6f (3:5e6f)
	xor a
Func_de70: ; de70 (3:5e70)
	cp $4
	jp nc, Func_df20
	push af
	push bc
	push de
	ld c, e
	ld b, d
	inc b
	dec b
	bit 7, b
	jr nz, .asm_de8b
	ld e, c
	ld d, b
	ld hl, $98
	call CompareHLtoDE
	jp nc, Func_de8e
.asm_de8b
	ld bc, $0
Func_de8e: ; de8e (3:5e8e)
	ld hl, sp+$7
	ld [hl], $0
Func_de92: ; de92 (3:5e92)
	ld hl, sp+$7
	ld a, [hl]
	cp $8
	jp nc, Func_df10
	push bc
	ld hl, sp+$8
	ld a, [hl]
	and $20
	jp z, Func_dec0
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, $7
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	ld c, l
	ld b, h
	jp Func_ded3

Func_dec0: ; dec0 (3:5ec0)
	call GetHLAtSPPlusParam8
	db $0e
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
Func_ded3: ; ded3 (3:5ed3)
	inc b
	dec b
	bit 7, b
	jr nz, .asm_dee4
	ld e, c
	ld d, b
	ld hl, $a8
	call CompareHLtoDE
	jp nc, Func_dee7
.asm_dee4
	ld bc, $0
Func_dee7: ; dee7 (3:5ee7)
	call GetHLAtSPPlusParam8
	db $0c
	inc hl
	ld [hl], c
	pop bc
	call GetHLAtSPPlus10
	ld [hl], c
	ld hl, sp+$6
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus10
	jp Func_de92

Func_df10: ; df10 (3:5f10)
	pop de
	pop bc
	push de
	push hl
	pop de
	pop hl
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	jp Func_de70

Func_df20: ; df20 (3:5f20)
	pop bc
	pop bc
	pop bc
	ret

Data_df24:
	dr $df24, $df28

Func_df28:
	push af
	ld c, $0
	ld a, [wSystemType]
	cp $11
	jp z, Func_df8b
	xor a
Func_df34: ; df34 (3:5f34)
	cp $6
	jp nc, Func_df74
	push af
	push bc
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_df24
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_df5c: ; df5c (3:5f5c)
	cp $a
	jp nc, Func_df6a
	push af
	call Func_0451
	pop af
	inc a
	jp Func_df5c

Func_df6a: ; df6a (3:5f6a)
	pop bc
	ld a, c
	xor $1
	ld c, a
	pop af
	inc a
	jp Func_df34

Func_df74: ; df74 (3:5f74)
	ld a, [$5f24]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	jp Func_e013

Func_df8b: ; df8b (3:5f8b)
	push bc
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld l, $0
	pop bc
Func_dfa1: ; dfa1 (3:5fa1)
	ld a, l
	cp $6
	jp nc, Func_e013
	push bc
	push hl
	inc c
	dec c
	jp nz, Func_dfd1
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp nz, Func_dfc3
	ld bc, $80
	ld e, $0
	ld hl, wCGB_BGPalsBuffer
	call FillMemory
	jp Func_dfce

Func_dfc3: ; dfc3 (3:5fc3)
	ld bc, $80
	ld e, $ff
	ld hl, wCGB_BGPalsBuffer
	call FillMemory
Func_dfce: ; dfce (3:5fce)
	jp Func_dfe7

Func_dfd1: ; dfd1 (3:5fd1)
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
Func_dfe7: ; dfe7 (3:5fe7)
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_dff2: ; dff2 (3:5ff2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_dff2
	xor a
Func_dffb: ; dffb (3:5ffb)
	cp $a
	jp nc, Func_e009
	push af
	call Func_0451
	pop af
	inc a
	jp Func_dffb

Func_e009: ; e009 (3:6009)
	pop hl
	inc l
	pop bc
	ld a, c
	xor $1
	ld c, a
	jp Func_dfa1

Func_e013: ; e013 (3:6013)
	pop bc
	ret

Func_e015: ; e015 (3:6015)
	add sp, -$14
	push de
	push af
	ld hl, sp+$17
	ld [hl], $0
	ld hl, sp+$16
	ld [hl], $0
	ld hl, sp+$15
	ld [hl], $13
	ld hl, sp+$14
	ld [hl], $11
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld l, $0
Func_e031: ; e031 (3:6031)
	ld a, l
	cp $10
	jp nc, Func_e03f
	ld a, $ff
	ld [de], a
	inc de
	inc l
	jp Func_e031

Func_e03f: ; e03f (3:603f)
	ld bc, $10
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_e051:
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld hl, sp+$15
	ld h, [hl]
	ld d, h
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$16
	ld l, [hl]
	ld h, a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$14
	ld e, [hl]
	ld hl, sp+$15
	ld h, [hl]
	ld d, h
	ld hl, sp+$15
	ld a, [hl]
	ld hl, sp+$16
	ld l, [hl]
	ld h, a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$14
	ld e, [hl]
	ld hl, sp+$15
	ld h, [hl]
	ld d, h
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$14
	ld l, [hl]
	ld h, a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$14
	ld e, [hl]
	ld hl, sp+$17
	ld h, [hl]
	ld d, h
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$16
	ld l, [hl]
	ld h, a
	call FarCall
	call WaitVideoTransfer
	ld hl, sp+$17
	ld a, [hl]
	inc a
	ld hl, sp+$17
	ld [hl], a
	ld hl, sp+$15
	ld a, [hl]
	dec a
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$15
	ld a, [hl]
	ld hl, sp+$17
	cp [hl]
	jp nc, Func_e121
	ld hl, sp+$17
	ld a, [hl]
	dec a
	ld hl, sp+$17
	ld [hl], a
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$15
	ld [hl], a
Func_e121: ; e121 (3:6121)
	ld hl, sp+$16
	ld a, [hl]
	inc a
	ld hl, sp+$16
	ld [hl], a
	ld hl, sp+$14
	ld a, [hl]
	dec a
	ld hl, sp+$14
	ld [hl], a
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$16
	cp [hl]
	jp nc, Func_e145
	ld hl, sp+$16
	ld a, [hl]
	dec a
	ld hl, sp+$16
	ld [hl], a
	ld hl, sp+$16
	ld a, [hl]
	ld hl, sp+$14
	ld [hl], a
Func_e145: ; e145 (3:6145)
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$15
	cp [hl]
	jp nz, Func_e15a
	ld hl, sp+$16
	ld a, [hl]
	ld hl, sp+$14
	cp [hl]
	jp nz, Func_e15a
	jp Func_e15d

Func_e15a: ; e15a (3:615a)
	jp Func_e051

Func_e15d: ; e15d (3:615d)
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8e00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call Func_27f5
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	ld e, a
	xor a
	call Func_dc0a
	pop de
	ld a, $1
	call Func_dc0a
	call Func_3aa8
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, $e0
	ld [wOBP1], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, [rLCDC]
	push af
	set_farcall_addrs_hli Func_6183
	pop af
	push af
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	ld a, [wSystemType]
	cp $11
	jp nz, Func_e20d
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld bc, $800
	ld e, $0
	hlbgcoord 0, 0
	call FillMemory
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_e20d: ; e20d (3:620d)
	set_farcall_addrs_hli Func_6183
	pop af
	call FarCall
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $d0
	ld de, GFX_4a02
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	add sp, $14
	ret

Data_e233:
	db $22, $22, $22, $21, $13, $22
	db $24, $31, $22, $02, $22, $22
	db $21, $42, $04, $22, $22, $22
	db $23, $24, $42, $22, $12, $21
	db $21, $21, $44, $22, $22, $44
	db $22, $12, $44, $22, $23, $10
	db $22, $22, $22, $42, $21, $11
	db $22, $22, $22, $23, $02, $22
	db $22, $22, $22, $20, $32, $22
	db $12, $22, $22, $22, $22, $04
	db $12, $22, $22, $22, $24, $20
	db $12, $22, $12, $22, $20, $22

Data_e27b:
	db $00, $02, $00, $00
	db $00, $01, $80, $00
	db $00, $01, $00, $00
	db $00, $00, $80, $00
	db $00, $00, $40, $00

Func_e28f:
	push hl
	push de
	push bc
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
Func_e298: ; e298 (3:6298)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_e339
	ld hl, sp+$2
	ld a, [hl]
	add a
	add a
	ld b, a
	call GetHLAtSPPlus10
	call RightShiftHL
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld a, l
	or a
	jp z, Func_e32f
	dec a
	push af
	ld l, a
	ld h, $0
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_e233
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	pop af
	and $1
	jp z, Func_e2e8
	ld hl, sp+$1
	ld a, [hl]
	and $f
	ld hl, sp+$1
	ld [hl], a
	jp Func_e2f4

Func_e2e8: ; e2e8 (3:62e8)
	ld hl, sp+$1
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$1
	ld [hl], a
Func_e2f4: ; e2f4 (3:62f4)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_e313
	call GetHLAtSPPlus6
	push hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e27b
	add hl, de
	pop de
	call Func_fddb
	cp $ff
	jp nz, Func_e32f
Func_e313: ; e313 (3:6313)
	ld bc, $4
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e27b
	add hl, de
	push hl
	call GetHLAtSPPlus8
	pop de
	call CopyFromDEtoHL
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
Func_e32f: ; e32f (3:632f)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_e298

Func_e339: ; e339 (3:6339)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_e342:
	db $00, $00, $00, $00
	db $00, $00, $99, $99
	db $00, $00, $c0, $00
	db $00, $00, $e6, $66
	db $00, $01, $01, $0c
	db $00, $01, $33, $33
	db $00, $01, $01, $59
	db $00, $01, $80, $00
	db $00, $00, $80, $00
	db $00, $00, $99, $99
	db $00, $00, $b3, $33
	db $00, $00, $cc, $cc
	db $00, $00, $e6, $66
	db $00, $01, $00, $00
	db $00, $01, $19, $99
	db $00, $01, $33, $33
	db $00, $01, $4c, $cc
	db $00, $01, $66, $66
	db $00, $01, $80, $00
	db $00, $01, $99, $99
	db $00, $01, $b3, $33
	db $00, $01, $cc, $cc

Func_e39a:
	push de
	push bc
	push bc
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e342
	add hl, de
	pop de
	call Func_1a1f
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	pop bc
	pop bc
	pop bc
	ret

Func_e3bd:
	push hl
	ld a, $2
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop hl
	ret

Func_e3d1:
	push hl
	push bc
	call GetHLAtSPPlus4
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus4
	push af
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$2
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e408
	ld a, $c
	ld hl, sp+$3
	sub [hl]
	ld hl, sp+$3
	ld [hl], a
Func_e408: ; e408 (3:6408)
	set_farcall_addrs_hli Func_7c8a
	pop af
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	ld c, $2
	call FarCall
	pop af
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	pop bc
	pop bc
	ret

Func_e4b4:
	push af
	ld a, [wSystemType]
	cp $11
	jp nz, Func_e4ce
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_e4c9
	ld a, $2
	jp Func_e4cf

Func_e4c9: ; e4c9 (3:64c9)
	ld a, $3
	jp Func_e4cf

Func_e4ce: ; e4ce (3:64ce)
	xor a
Func_e4cf: ; e4cf (3:64cf)
	pop bc
	ret

Func_e4d1: ; e4d1 (3:64d1)
	push hl
	push bc
	push bc
	push bc
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld hl, sp+$5
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld [hl], a
	ld hl, sp+$5
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	xor [hl]
	call Func_e4b4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld [hl], a
	ld hl, $8000
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	ld l, $0
Func_e538: ; e538 (3:6538)
	ld a, l
	cp $8
	jp nc, Func_e5b7
	xor a
Func_e53f: ; e53f (3:653f)
	cp $8
	jp nc, Func_e5b0
	push hl
	push af
	push bc
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	ld bc, $10
	call RequestVideoData
	call GetHLAtSPPlus10
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	pop bc
	pop af
	pop hl
	push hl
	push bc
	push af
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8
	add hl, de
	add hl, bc
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	ld bc, $10
	call RequestVideoData
	call GetHLAtSPPlus10
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	pop af
	inc a
	pop bc
	pop hl
	jp Func_e53f

Func_e5b0: ; e5b0 (3:65b0)
	ld a, l
	add $2
	ld l, a
	jp Func_e538

Func_e5b7: ; e5b7 (3:65b7)
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	pop de
	push hl
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	ld c, l
	ld b, h
	pop hl
	push hl
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e5e1
	pop hl
	push hl
	dec h
	pop de
	push hl
Func_e5e1: ; e5e1 (3:65e1)
	ld l, c
	ld h, b
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e5ed
	dec b
Func_e5ed: ; e5ed (3:65ed)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e608
	pop hl
	push hl
	ld de, $c
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	push hl
Func_e608: ; e608 (3:6608)
	pop hl
	push hl
	add hl, hl
	add hl, hl
	add hl, hl
	pop de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlus4
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld a, e
	xor l
	ld l, a
	ld a, d
	xor h
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld a, e
	xor l
	ld l, a
	ld a, d
	xor h
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	pop de
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, wOAMBuffer2
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	ld [hl], $0
Func_e675: ; e675 (3:6675)
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_e6a4
	ld c, $0
Func_e67f: ; e67f (3:667f)
	ld a, c
	cp $8
	jp nc, Func_e69a
	ld hl, sp+$6
	ld a, [hl]
	add a
	add a
	add a
	add c
	add a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld [hl], a
	inc c
	inc de
	inc de
	inc de
	inc de
	jp Func_e67f

Func_e69a: ; e69a (3:669a)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_e675

Func_e6a4: ; e6a4 (3:66a4)
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, b
	call Func_de2c
	call WaitVideoTransfer
	call GetHLAtSPPlus8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e6b7:
	push bc
	ld a, [hl]
	inc hl
	push hl
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $8
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	pop af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $8
	call DivideHLByDESigned
	ld c, l
	push bc
	set_farcall_addrs_hli Func_667d
	pop bc
	push bc
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld de, $7
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld a, [hl]
	ld l, c
	ld h, a
	ld bc, $8f02
	call FarCall
	pop bc
	ld a, [wSystemType]
	cp $11
	jp nz, Func_e784
	push bc
	set_farcall_addrs_hli Func_667d
	pop bc
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld de, $7
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld a, [hl]
	ld l, c
	ld h, a
	ld bc, $3
	call FarCall
Func_e784: ; e784 (3:6784)
	pop hl
	pop bc
	ret

Func_e787:
	push hl
	call Func_27f5
	pop hl
	ret

Func_e78d:
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e7b1
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_e7b1: ; e7b1 (3:67b1)
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e7d5
	call GetHLAtSPPlus6
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus6
Func_e7d5: ; e7d5 (3:67d5)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop af
Func_e836: ; e836 (3:6836)
	cp $1
	jp c, Func_e862
	push bc
	push af
	call GetHLAtSPPlus6
	ld e, c
	ld d, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	jp Func_e836

Func_e862: ; e862 (3:6862)
	pop hl
	push hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_e89b:
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e8bf
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_e8bf: ; e8bf (3:68bf)
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop bc
	pop af
Func_e92b: ; e92b (3:692b)
	cp $1
	jp c, Func_e95b
	push bc
	push af
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	jp Func_e92b

Func_e95b: ; e95b (3:695b)
	pop hl
	push hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_e994:
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld a, $20
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_e9a4:
	push hl
	set_farcall_addrs_hli Func_6938
	ld c, $67
	ld e, $28
	ld hl, $14
	call FarCall
	pop hl
	ret

Func_e9bc:
	push hl
	set_farcall_addrs_hli Func_68fd
	ld c, $68
	ld e, $28
	ld hl, $2710
	call FarCall
	pop hl
	ret

Func_e9d4:
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	pop de
	push hl
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_ea05
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_ea05: ; ea05 (3:6a05)
	pop hl
	push hl
	ld de, $80
	call CompareHLtoDE
	jp c, Func_ea15
	pop hl
	push hl
	dec h
	pop de
	push hl
Func_ea15: ; ea15 (3:6a15)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_ea32
	call GetHLAtSPPlus4
	ld de, $c
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	call WriteHLToSPPlus4
Func_ea32: ; ea32 (3:6a32)
	call GetHLAtSPPlus4
	add hl, hl
	add hl, hl
	add hl, hl
	call WriteHLToSPPlus4
	pop hl
	push hl
	add hl, hl
	add hl, hl
	add hl, hl
	pop de
	push hl
	call GetHLAtSPPlus4
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call Func_de2c
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_eab8:
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld a, $40
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_eac8:
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld a, $80
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_ead8:
	push hl
	xor a
	call Func_df28
	pop hl
	ret

Func_eadf:
	push hl
	ld a, $1
	call Func_df28
	pop hl
	ret

Func_eae7: ; eae7 (3:6ae7)
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld c, $0
Func_eaf5: ; eaf5 (3:6af5)
	ld a, c
	cp $4
	jp nc, Func_eb15
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_eaf5

Func_eb15: ; eb15 (3:6b15)
	inc hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	push de
	push hl
	pop de
	pop hl
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $24a
	add hl, de
	call WriteHLToSPPlus7
	xor a
	pop de
Func_eb33: ; eb33 (3:6b33)
	cp $8
	jp nc, Func_ec10
	push af
	ld c, $0
Func_eb3b: ; eb3b (3:6b3b)
	ld a, c
	cp $4
	jp nc, Func_ec0b
	push bc
	push de
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0d
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $0d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	inc hl
	inc hl
	call WriteHLToSPPlusParam8
	db $0b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_eb3b

Func_ec0b: ; ec0b (3:6c0b)
	pop af
	inc a
	jp Func_eb33

Func_ec10: ; ec10 (3:6c10)
	pop hl
	push de
	ld c, $0
Func_ec14: ; ec14 (3:6c14)
	ld a, c
	cp $4
	jp nc, Func_ec34
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ec14

Func_ec34: ; ec34 (3:6c34)
	inc hl
	xor a
	pop de
	push hl
Func_ec38: ; ec38 (3:6c38)
	cp $8
	jp nc, Func_ed15
	push af
	ld c, $0
Func_ec40: ; ec40 (3:6c40)
	ld a, c
	cp $4
	jp nc, Func_ed10
	push bc
	push de
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0d
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $0d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	inc hl
	inc hl
	call WriteHLToSPPlusParam8
	db $0b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ec40

Func_ed10: ; ed10 (3:6d10)
	pop af
	inc a
	jp Func_ec38

Func_ed15: ; ed15 (3:6d15)
	ld c, $0
	pop hl
Func_ed18: ; ed18 (3:6d18)
	ld a, c
	cp $4
	jp nc, Func_ed38
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ed18

Func_ed38: ; ed38 (3:6d38)
	inc hl
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	push de
	push hl
	pop de
	pop hl
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $2ca
	add hl, de
	call WriteHLToSPPlus7
	xor a
	pop de
Func_ed56: ; ed56 (3:6d56)
	cp $8
	jp nc, Func_ee33
	push af
	ld c, $0
Func_ed5e: ; ed5e (3:6d5e)
	ld a, c
	cp $4
	jp nc, Func_ee2e
	push bc
	push de
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0d
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $0d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0b
	inc hl
	inc hl
	call WriteHLToSPPlusParam8
	db $0b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ed5e

Func_ee2e: ; ee2e (3:6e2e)
	pop af
	inc a
	jp Func_ed56

Func_ee33: ; ee33 (3:6e33)
	pop hl
	push de
	ld c, $0
Func_ee37: ; ee37 (3:6e37)
	ld a, c
	cp $4
	jp nc, Func_ee57
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ee37

Func_ee57: ; ee57 (3:6e57)
	xor a
	pop de
Func_ee59: ; ee59 (3:6e59)
	cp $8
	jp nc, Func_ef31
	push af
	ld c, $0
Func_ee61: ; ee61 (3:6e61)
	ld a, c
	cp $4
	jp nc, Func_ef2c
	push bc
	push de
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	push de
	push hl
	pop de
	pop hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0b
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $0b
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlus9
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlus9
	inc hl
	inc hl
	call WriteHLToSPPlus9
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ee61

Func_ef2c: ; ef2c (3:6f2c)
	pop af
	inc a
	jp Func_ee59

Func_ef31: ; ef31 (3:6f31)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_ef36:
	ld a, [wNextVBlankFlags]
	and $40
	jp z, Func_ef3f
	ret

Func_ef3f: ; ef3f (3:6f3f)
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	ld a, $1
	add [hl]
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	cp [hl]
	jp nc, Func_ef53
	ret

Func_ef53: ; ef53 (3:6f53)
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_ef80
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $24a
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	jp Func_ef96

Func_ef80: ; ef80 (3:6f80)
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $2ca
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
Func_ef96: ; ef96 (3:6f96)
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld a, $1
	xor [hl]
	ld [hl], a
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ret

Func_efaa:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $6
	add hl, de
	ld [hl], a
	ld a, [wSystemType]
	cp $11
	jp nz, Func_f049
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	call Func_eae7
	call WaitVideoTransfer
	ld a, $2
	ld [wc24d], a
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $6f36
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	jp Func_f063

Func_f049: ; f049 (3:7049)
	ld a, BANK(DoFlashProgram)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, DoFlashProgram
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f063: ; f063 (3:7063)
	pop hl
	push hl
	pop bc
	ret

Func_f067:
	push hl
	ld a, [wSystemType]
	cp $11
	jp nz, Func_f0b2
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wc2e8], a
Func_f07c: ; f07c (3:707c)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_f07c
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_f0a2: ; f0a2 (3:70a2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_f0a2
	ld a, $4
	ld [wc24d], a
	jp Func_f0cd

Func_f0b2: ; f0b2 (3:70b2)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
Func_f0cd: ; f0cd (3:70cd)
	pop hl
	ret

Func_f0cf: ; f0cf (3:70cf)
	ld a, [hl]
	inc hl
	push hl
	push af
	ld a, [wLCDC]
	ld e, a
	push de
	ld a, [rIE]
	ld l, a
	push hl
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call DisableHBlank
	set_farcall_addrs_hli Func_da729
	pop hl
	pop de
	pop af
	push hl
	push de
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld e, [hl]
	call FarCall
	pop af
	push hl
	push af
	set_farcall_addrs_hli Func_e2bf8
	pop af
	call FarCall
Func_f122: ; f122 (3:7122)
	call Func_0451
	callba_hli Func_e2c29
	set_farcall_addrs_hli Func_da093
	xor a
	call FarCall
	or a
	jp nz, Func_f149
	jp Func_f15a

Func_f149: ; f149 (3:7149)
	callba_hli Func_d9f55
	jp Func_f122

Func_f15a: ; f15a (3:715a)
	set_farcall_addrs_hli Func_17c57
	pop hl
	call FarCall
	call Func_27f5
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	ld a, e
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop hl
	ld a, l
	and $2
	jp z, Func_f191
	call EnableHBlank
Func_f191: ; f191 (3:7191)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop hl
	ret

Func_f19f:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
	ld h, $0
	ld de, $9c
	call MultiplyHLbyDE
	call Func_ddc2
	pop hl
	push hl
	pop bc
	ret

Func_f1b6:
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $7
	add hl, de
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $9
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $a
	add hl, de
	ld [hl], a
	ld a, BANK(DoShakeProgram)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, DoShakeProgram
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	pop hl
	push hl
	pop bc
	ret

Func_f210:
	push hl
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop hl
	ret

Func_f233: ; f233 (3:7233)
	push bc
	ld bc, wCGB_BGPalsBuffer
	call ReadHalfWordAt
	dw wc2e6
	ld de, $24a
	add hl, de
	pop de
	push hl
	xor a
Func_f243: ; f243 (3:7243)
	cp $40
	jp nc, Func_f29b
	push af
	push bc
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld c, a
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop bc
	push bc
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld c, a
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop bc
	pop af
	push bc
	push af
	ld l, c
	ld h, b
	ld a, [hl]
	and $1f
	ld c, a
	inc hl
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop af
	inc a
	pop bc
	inc bc
	inc bc
	jp Func_f243

Func_f29b: ; f29b (3:729b)
	pop bc
	ret

Func_f29d:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $5
	add hl, de
	ld [hl], a
	ld a, [wSystemType]
	or a
	jp z, Func_f31b
	cp $ff
	jp z, Func_f31b
	cp $1
	jp z, Func_f31b
	cp $11
	jp nz, Func_f335
	ld bc, $80
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	call Func_f233
	call WaitVideoTransfer
	ld a, $2
	ld [wc24d], a
	ld a, $1
	ld [wc2e8], a
	jp Func_f335

Func_f31b: ; f31b (3:731b)
	ld a, $1
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $6a16
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f335: ; f335 (3:7335)
	pop hl
	push hl
	pop bc
	ret

Func_f339:
	push hl
	ld a, [wSystemType]
	cp $11
	jp nz, Func_f358
	xor a
	ld [wc2e8], a
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld [hl], $ff
	ld a, $1
	ld [wc2e8], a
	jp Func_f375

Func_f358: ; f358 (3:7358)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld [hl], $ff
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f375: ; f375 (3:7375)
	pop hl
	ret

Func_f377:
	push hl
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $ff
	jp nz, Func_f395
Func_f386: ; f386 (3:7386)
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_f3a2
	jp Func_f386

Func_f395: ; f395 (3:7395)
	call ReadHalfWordAt
	dw wc2e6
	inc hl
	inc hl
	ld a, [hl]
	cp $10
	jp nz, Func_f395
Func_f3a2: ; f3a2 (3:73a2)
	pop hl
	ret

Func_f3a4:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
	xor a
Func_f3ad: ; f3ad (3:73ad)
	cp l
	jp nc, Func_f3bc
	push hl
	push af
	call Func_0451
	pop af
	inc a
	pop hl
	jp Func_f3ad

Func_f3bc: ; f3bc (3:73bc)
	pop hl
	push hl
	pop bc
	ret

Func_f3c0:
	push hl
	ld hl, Data_c009
	call Func_f723
	pop hl
	ret

Func_f3c9:
	push hl
	ld hl, Data_c016
	call Func_f723
	pop hl
	ret

Func_f3d2:
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $80
	call CompareHLtoDE
	jp c, Func_f40c
	call GetHLAtSPPlus6
	dec h
	call WriteHLToSPPlus6
Func_f40c: ; f40c (3:740c)
	ld l, c
	ld h, b
	ld de, $80
	call CompareHLtoDE
	jp c, Func_f418
	dec b
Func_f418: ; f418 (3:7418)
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_f434
	call GetHLAtSPPlus8
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus8
Func_f434: ; f434 (3:7434)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop af
Func_f496: ; f496 (3:7496)
	cp $1
	jp c, Func_f4ea
	push de
	push af
	push bc
	push de
	push hl
	pop de
	pop hl
	add hl, bc
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	add hl, de
	pop de
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_f4bf: ; f4bf (3:74bf)
	cp $2
	jp nc, Func_f4cd
	push af
	call Func_0451
	pop af
	inc a
	jp Func_f4bf

Func_f4cd: ; f4cd (3:74cd)
	call GetHLAtSPPlus10
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus10
	pop bc
	ld a, c
	cpl
	ld l, a
	ld a, b
	cpl
	ld h, a
	inc hl
	ld c, l
	ld b, h
	pop af
	dec a
	pop de
	jp Func_f496

Func_f4ea: ; f4ea (3:74ea)
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_f4f1:
	ld a, [hl]
	inc hl
	push hl
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $d
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $11
	add hl, de
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop af
Func_f554: ; f554 (3:7554)
	cp $1
	jp c, Func_f5c5
	push af
	push bc
	push de
	ld hl, $8
	add hl, bc
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	push bc
	push de
	ld hl, hPushOAM + 3
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $8
	add hl, bc
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	push bc
	push de
	ld hl, hPushOAM + 3
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	pop af
	push bc
	push de
	push af
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	pop de
	pop bc
	jp Func_f554

Func_f5c5: ; f5c5 (3:75c5)
	pop hl
	ret

Func_f5c7:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld c, a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
Func_f5d6: ; f5d6 (3:75d6)
	ld a, c
	cp $1
	jp c, Func_f5f5
	push hl
	push bc
	ld h, $0
	add hl, hl
	ld de, Data_c6e1
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_f723
	pop bc
	dec c
	pop hl
	jp Func_f5d6

Func_f5f5: ; f5f5 (3:75f5)
	pop hl
	push hl
	pop bc
	ret

Func_f5f9:
	push hl
	set_farcall_addrs_hli Func_6a77
	pop hl
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call FarCall
	pop hl
	inc hl
	inc hl
	ret

Func_f612:
	push hl
Func_f613: ; f613 (3:7613)
	call Func_1ac5
	or a
	jp nz, Func_f613
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call Func_1502
	pop hl
	push hl
	pop bc
	ret

Func_f627:
	ld a, [hl]
	inc hl
	ld [wOAM06YCoord], a
	ret

Func_f62d:
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call Func_14fc
	pop hl
	push hl
	pop bc
	ret

Func_f63b:
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_f64c
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_f660
Func_f64c: ; f64c (3:764c)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_f660: ; f660 (3:7660)
	pop hl
	ret

Func_f662:
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_f673
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_f687
Func_f673: ; f673 (3:7673)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
Func_f687: ; f687 (3:7687)
	pop hl
	ret

Func_f689:
	push hl
	ld e, $0
	xor a
	call SetStringStartState
	ld hl, Data_f6cb
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
.asm_f69e
	xor a
	call Func_3bc5
	pop bc
	xor a
	ld [wJoyHeld], a
Func_f6a8: ; f6a8 (3:76a8)
	call Func_0465
	or a
	jp z, Func_f6a8
	ld e, $0
	xor a
	call SetStringStartState
	ld hl, Data_f6d1
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop hl
	ret

Data_f6cb:
	db "キー マチ", $00

Data_f6d1:
	db "     ", $00

Pointers_f6d7:
	dw $0000
	dw Func_e3bd
	dw Func_e3d1
	dw Func_e4d1
	dw Func_e6b7
	dw Func_e787
	dw Func_e78d
	dw Func_e89b
	dw Func_e994
	dw Func_e9a4
	dw Func_e9bc
	dw Func_e9d4
	dw Func_eab8
	dw Func_eac8
	dw Func_ead8
	dw Func_eadf
	dw Func_efaa
	dw Func_f067
	dw Func_f0cf
	dw Func_f19f
	dw Func_f1b6
	dw Func_f210
	dw Func_f29d
	dw Func_f339
	dw Func_f377
	dw Func_f3a4
	dw Func_f3c0
	dw Func_f3c9
	dw Func_f3d2
	dw Func_f4f1
	dw Func_f5c7
	dw Func_f5f9
	dw Func_f612
	dw Func_f627
	dw Func_f62d
	dw Func_f63b
	dw Func_f662
	dw Func_f689

Func_f723: ; f723 (3:7723)
	push hl
Func_f724: ; f724 (3:7724)
	pop hl
	push hl
	ld a, [hl]
	or a
	jp z, Func_f748
	ld hl, .Return
	push hl
	call GetHLAtSPPlus4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_f6d7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	inc hl
	ret

.Return
	pop de
	push hl
	jp Func_f724

Func_f748: ; f748 (3:7748)
	pop bc
	ret

Data_f74a:
	dr $f74a, $f752

Data_f752:
	dr $f752, $f758

Data_f758:
	dr $f758, $f771

Func_f771:
	ld hl, -$ee
	add hl, sp
	ld sp, hl
	ld hl, $e5
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_f74a
	ld bc, $8
	call MemCopy
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlusParam8
	db $e4
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_f752
	ld bc, $6
	call MemCopy
	ld hl, sp+$6
	pop de
	push hl
	ld hl, Data_f758
	call WriteHLToSPPlus4
	ld hl, $0
	call WriteHLToSPPlus6
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	xor a
Func_f7c3: ; f7c3 (3:77c3)
	cp $4
	jp nc, Func_f7fd
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$57
	add hl, de
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	pop de
	ld bc, $23
	call MemCopy
	pop af
	inc a
	jp Func_f7c3

Func_f7fd: ; f7fd (3:77fd)
	pop af
	call GetSRAMBank
	call GetHLAtSPPlusParam8
	db $e4
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlusParam8
	db $e6
	ld de, $5
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $e6
	ld de, $6
	add hl, de
	ld e, [hl]
	call Func_e015
	call GetHLAtSPPlusParam8
	db $e6
	ld de, $27
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_f83b
Func_f82f: ; f82f (3:782f)
	call Func_1abe
	or a
	jp nz, Func_f82f
	ld a, $6
	call Func_14fc
Func_f83b: ; f83b (3:783b)
	call Func_3aa8
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	ld hl, $e7
	add hl, sp
	call WriteHLToSPPlusParam8
	db $e3
	ld hl, $e3
	add hl, sp
	ld [hl], $0
Func_f86a: ; f86a (3:786a)
	ld hl, $e3
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_f91d
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$55
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_f906
	ld e, a
	dec e
	ld hl, sp+$26
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$55
	add hl, de
	ld de, $1f
	add hl, de
	ld e, [hl]
	ld hl, sp+$2b
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	db $e3
	ld [hl], a
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$55
	add hl, de
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$8
	call LiteralStringInTree
	ld hl, sp+$8
	push hl
	ld hl, $e5
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
Func_f906: ; f906 (3:7906)
	ld hl, $e3
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e3
	add hl, sp
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $e3
	inc hl
	call WriteHLToSPPlusParam8
	db $e3
	jp Func_f86a

Func_f91d: ; f91d (3:791d)
	xor a
	pop bc
Func_f91f: ; f91f (3:791f)
	call GetHLAtSPPlusParam8
	db $e4
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nc, Func_f980
	push bc
	push af
	ld a, [bc]
	ld e, a
	ld hl, sp+$28
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, sp+$53
	ld e, [hl]
	ld hl, sp+$2d
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	db $e5
	ld [hl], a
	ld hl, sp+$35
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$a
	call LiteralStringInTree
	pop af
	push af
	ld hl, sp+$a
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop af
	inc a
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $e1
	inc hl
	call WriteHLToSPPlusParam8
	db $e1
	jp Func_f91f

Func_f980: ; f980 (3:7980)
	call Func_27f5
	ld hl, $e5
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	xor a
	ld hl, $e4
	add hl, sp
	ld [hl], a
Func_f991: ; f991 (3:7991)
	cp $8
	jp nc, Func_f9d2
	push af
	ld a, [de]
	cp $ff
	jp z, Func_f9cc
	push de
	set_farcall_addrs_hli Func_a26c
	pop de
	push de
	ld a, [de]
	ld e, a
	ld d, $0
	ld hl, $e8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e8
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld e, $0
	ld c, $4
	call FarCall
	pop de
Func_f9cc: ; f9cc (3:79cc)
	pop af
	inc a
	inc de
	jp Func_f991

Func_f9d2: ; f9d2 (3:79d2)
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	ld hl, $e5
	add hl, sp
	ld c, l
	ld b, h
	ld e, $0
	ld hl, $e4
	add hl, sp
	ld [hl], e
Func_f9ee: ; f9ee (3:79ee)
	ld a, e
	cp $8
	jp nc, Func_fa45
	push bc
	ld a, [bc]
	cp $ff
	jp z, Func_fa3f
	push de
	ld a, e
	ld b, $4
	call DivideAbyB
	add a
	add a
	add a
	add a
	add a
	add a
	add a
	add $10
	ld l, a
	pop de
	push de
	push hl
	ld a, e
	and $3
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	push af
	set_farcall_addrs_hli Func_da839
	pop af
	pop hl
	ld d, l
	ld e, a
	ld hl, $e8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e8
	add hl, sp
	ld [hl], a
	dec a
	add a
	add a
	ld bc, $200
	call FarCall
	pop de
Func_fa3f: ; fa3f (3:7a3f)
	inc e
	pop bc
	inc bc
	jp Func_f9ee

Func_fa45: ; fa45 (3:7a45)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call GetHLAtSPPlusParam8
	db $e4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	pop de
	call CopyUntilNull
	ld de, String_fa7b
	call CopyUntilNull
	ld c, $83
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call Func_c868
	ld hl, $ee
	add hl, sp
	ld sp, hl
	ret

String_fa7b:
	db " <HIRA>かﾞ<KATA>", $00

Func_fa81: ; fa81 (3:7a81)
	add sp, -$32
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Predef
	add hl, de
	call WriteHLToSPPlusParam8
	db $32
	call GetHLAtSPPlusParam8
	db $32
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	call WriteHLToSPPlusParam8
	db $32
	call GetHLAtSPPlusParam8
	db $34
	ld [hl], $10
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1aa
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $34
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld a, l
	cp $1
	jp c, Func_fb2d
	push hl
	call GetHLAtSPPlusParam8
	db $36
	ld de, $27
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_faeb
	ld a, $6
	call Func_14fc
	jp Func_faf0

Func_faeb: ; faeb (3:7aeb)
	ld a, $15
	call Func_14fc
Func_faf0: ; faf0 (3:7af0)
	call Func_f771
	call GetHLAtSPPlusParam8
	db $34
	ld de, $9
	add hl, de
	ld [hl], $3
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $34
	ld de, $8
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $36
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$27
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $36
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$28
	ld [hl], e
	ld hl, sp+$2f
	ld [hl], $1
	call GetHLAtSPPlusParam8
	db $34
	ld [hl], $2
	pop hl
	jp Func_fb64

Func_fb2d: ; fb2d (3:7b2d)
	ld a, $4
	call Func_14fc
	ld hl, sp+$2d
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $32
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $32
	ld de, $8
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $34
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$25
	ld [hl], e
	ld hl, sp+$26
	ld [hl], $ff
	ld l, $1
	push hl
	call GetHLAtSPPlusParam8
	db $34
	ld [hl], $0
	pop hl
Func_fb64: ; fb64 (3:7b64)
	push hl
	call GetHLAtSPPlusParam8
	db $34
	ld de, $7
	add hl, de
	ld [hl], $0
	ld a, [hSRAMBank]
	ld e, a
	push de
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [$ca9c]
	pop de
	push de
	push af
	ld a, e
	call GetSRAMBank
	pop af
	and $1
	jp z, Func_fb90
	call GetHLAtSPPlusParam8
	db $36
	ld a, $4
	or [hl]
	ld [hl], a
Func_fb90: ; fb90 (3:7b90)
	xor a
	pop de
	pop hl
	pop bc
	push de
Func_fb95: ; fb95 (3:7b95)
	cp l
	jp nc, Func_fc20
	push hl
	push af
	push bc
	call GetHLAtSPPlusParam8
	db $38
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop bc
	pop af
	push bc
	push af
	ld a, [bc]
	ld e, a
	ld hl, sp+$31
	ld [hl], e
	ld a, $1
	ld c, $1
	call Func_dbf5
	pop af
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $166
	add hl, de
	pop de
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $155
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop af
	push af
	ld e, a
	ld a, $1
	ld c, $6
	call Func_dbf5
	ld hl, sp+$31
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, $ca70
	add hl, de
	push hl
	ld a, [hl]
	ld e, a
	ld hl, sp+$33
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	or e
	ld e, a
	pop hl
	ld a, e
	ld [hl], a
	pop af
	inc a
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	jp Func_fb95

Func_fc20: ; fc20 (3:7c20)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $30
	ld hl, sp+$2c
	ld [hl], $0
Func_fc31: ; fc31 (3:7c31)
	ld hl, sp+$2c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_fccb
	ld hl, sp+$2c
	ld a, [hl]
	cp $4
	jp nc, Func_fccb
	ld c, $0
	ld hl, sp+$2c
	ld e, [hl]
	xor a
	call Func_dbf5
	ld hl, sp+$2c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $32
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $32
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	call GetHLAtSPPlusParam8
	db $30
	ld de, $75
	add hl, de
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_6b74
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2c
	ld a, [hl]
	call FarCall
	ld hl, sp+$2c
	ld a, [hl]
	inc a
	ld hl, sp+$2c
	ld [hl], a
	jp Func_fc31

Func_fccb: ; fccb (3:7ccb)
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, $c7bd
	ld l, [hl]
	ld h, $0
	ld de, $c7b1
	add hl, de
	ld a, [hl]
	pop de
	push de
	push af
	ld a, e
	call GetSRAMBank
	pop af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c5
	add hl, de
	ld [hl], a
	ld c, $0
Func_fcef: ; fcef (3:7cef)
	ld a, c
	cp $4
	jp nc, Func_fd26
	push bc
	set_farcall_addrs_hli Func_6b55
	pop bc
	push bc
	ld a, c
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop bc
	call GetHLAtSPPlusParam8
	db $10
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_fd22
	jp Func_fd26

Func_fd22: ; fd22 (3:7d22)
	inc c
	jp Func_fcef

Func_fd26: ; fd26 (3:7d26)
	push bc
	call GetHLAtSPPlusParam8
	db $36
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $34
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop bc
	push bc
	ld b, c
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlusParam8
	db $36
	or [hl]
	ld [hl], a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld [hl], c
	call GetHLAtSPPlusParam8
	db $36
	ld de, $7
	add hl, de
	ld [hl], c
	ld a, $3
	call GetSRAMBank
	pop bc
	ld a, c
	ld [$c98d], a
	pop de
	ld a, e
	call GetSRAMBank
	call GetHLAtSPPlusParam8
	db $32
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $27
	call GetHLAtSPPlusParam8
	db $32
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $29
	call GetHLAtSPPlusParam8
	db $32
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_fda8
	ld hl, sp+$27
	ld [hl], $0
	ld hl, sp+$28
	ld [hl], $5
Func_fda8: ; fda8 (3:7da8)
	ld hl, sp+$23
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_d7f5
	add sp, $32
	ret

Func_fdb7: ; fdb7 (3:7db7)
	ld c, $4
	scf
	ccf
.asm_fdbb
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_fdbb
	ld a, c
	jr nc, .asm_fdc8
	inc a
.asm_fdc8
	ret

Func_fdc9: ; fdc9 (3:7dc9)
	ld c, $4
	scf
	ccf
.asm_fdcd
	ld a, [de]
	ld b, a
	ld a, [hl]
	adc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_fdcd
	ld a, c
	jr nc, .asm_fdda
	inc a
.asm_fdda
	ret

Func_fddb: ; fddb (3:7ddb)
	ld c, $4
.asm_fddd
	ld a, [de]
	inc de
	ld b, a
	ld a, [hli]
	sub b
	jr c, .asm_fdeb
	jr nz, .asm_fdee
	dec c
	jr nz, .asm_fddd
	xor a
	ret

.asm_fdeb
	ld a, $ff
	ret

.asm_fdee
	ld a, $1
	ret

Func_fdf1:
	ret

Func_fdf2:
	ret

SECTION "Bank 04", ROMX, BANK [$04]
Func_10000:
	ret

Func_10001:
	push af
	set_farcall_addrs_hli Func_dd67
	pop af
	jp FarCall

Func_10011: ; 10011 (4:4011)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_3aa8
	set_farcall_addrs_hli Func_17e95
	ld c, $a
	ld e, $a
	ld hl, $0
	call FarCall
	ld e, $2
	ld a, $1
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_1019d
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $2
	ld a, $2
	call SetStringStartState
	ld hl, Data_101a0
	push hl
	call PlaceString
	pop bc
	ld e, $4
	ld a, $2
	call SetStringStartState
	ld hl, Data_101a8
	push hl
	call PlaceString
	pop bc
	ld e, $6
	ld a, $2
	call SetStringStartState
	ld hl, Data_101af
	push hl
	call PlaceString
	pop bc
	ld e, $8
	ld a, $2
	call SetStringStartState
	ld hl, Data_101b6
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld e, $0
	ld c, e
	push bc
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop de
	pop bc
Func_100a4: ; 100a4 (4:40a4)
	push bc
	push de
	call Func_0465
	call Func_3d15
	ld l, a
	ld h, $0
	pop de
	pop bc
	ld a, l
	and $10
	jp z, Func_10102
	ld a, c
	cp $3
	jp z, Func_100ef
	cp $2
	jp z, Func_100e6
	cp $1
	jp z, Func_100d3
	or a
	jp nz, Func_100ff
	ld a, $2
	call Func_10abf
	jp Func_100ff

Func_100d3: ; 100d3 (4:40d3)
	set_farcall_addrs_hli Func_6c5bb
	ld a, $2
	call FarCall
	jp Func_100ff

Func_100e6: ; 100e6 (4:40e6)
	ld a, $2
	call Func_1228e
	ld a, l
	jp Func_100ff

Func_100ef: ; 100ef (4:40ef)
	set_farcall_addrs_hli Func_6d395
	ld a, $2
	call FarCall
Func_100ff: ; 100ff (4:40ff)
	jp Func_10190

Func_10102: ; 10102 (4:4102)
	ld a, l
	and $4
	jp z, Func_1013b
	ld a, c
	cp $1
	jp c, Func_1010f
	dec c
Func_1010f: ; 1010f (4:410f)
	push bc
	ld a, e
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8f
	ld [hl], a
	pop bc
	push bc
	ld a, c
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	jp Func_1017d

Func_1013b: ; 1013b (4:413b)
	ld a, l
	and $8
	jp z, Func_10174
	ld a, c
	cp $3
	jp nc, Func_10148
	inc c
Func_10148: ; 10148 (4:4148)
	push bc
	ld a, e
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8f
	ld [hl], a
	pop bc
	push bc
	ld a, c
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	jp Func_1017d

Func_10174: ; 10174 (4:4174)
	ld a, l
	and $20
	jp z, Func_1017d
	jp Func_10190

Func_1017d: ; 1017d (4:417d)
	push bc
	push de
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop de
	pop bc
	jp Func_100a4

Func_10190: ; 10190 (4:4190)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Data_1019d:
	TX_STACK
	db $00

Data_101a0:
	db "スヒﾟータﾞー", $00 ; speeder

Data_101a8:
	db "ハﾟンチャー", $00 ; puncher

Data_101af:
	db "シールタﾞー", $00 ; shielder

Data_101b6:
	db "シﾞャンハﾟー", $00 ; jumper

Func_101be:
	push bc
	push bc
	push de
	push hl
	ld de, $100
	call DivideHLByDESigned
	ld c, l
	pop hl
	ld a, l
	pop de
	push bc
	push af
	push de
	push de
	push hl
	pop de
	pop hl
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	pop de
	ld l, e
	pop af
	pop bc
	push hl
	ld e, a
	ld a, c
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld c, l
	ld b, h
	xor a
	pop hl
Func_101f0: ; 101f0 (4:41f0)
	cp l
	jp nc, Func_10212
	push hl
	push af
	call GetHLAtSPPlus8
	ld a, l
	ld [bc], a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_10206
	inc bc
	jp Func_1020c

Func_10206: ; 10206 (4:4206)
	ld hl, $14
	add hl, bc
	ld c, l
	ld b, h
Func_1020c: ; 1020c (4:420c)
	pop af
	inc a
	pop hl
	jp Func_101f0

Func_10212: ; 10212 (4:4212)
	pop bc
	pop bc
	ret

Func_10215:
	push bc
	push bc
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	call WriteHLToSPPlus4
	xor a
	pop bc
Func_10224: ; 10224 (4:4224)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_1025b
	push af
	xor a
Func_1022c: ; 1022c (4:422c)
	cp c
	jp nc, Func_10240
	call GetHLAtSPPlus4
	ld [hl], $8f
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	inc a
	jp Func_1022c

Func_10240: ; 10240 (4:4240)
	pop af
	push bc
	push af
	ld b, $0
	ld hl, $14
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop af
	inc a
	pop bc
	jp Func_10224

Func_1025b: ; 1025b (4:425b)
	pop bc
	ret

Func_1025d: ; 1025d (4:425d)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_1025d
	ret

Data_10268:
	dr $10268, $1027d

Data_1027d:
	dr $1027d, $1028b

Func_1028b:
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_10268
	ld bc, $4
	call MemCopy
	ld a, $2
	ld [$c2fa], a
	ld a, $4
	call Func_14fc
	pop de
	pop bc
	push de
	ld a, $11
	ld [bc], a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1aa
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld [hl], a
	pop de
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_10327
	push bc
	push de
	callba_hli Func_f771
	pop de
	ld hl, $9
	add hl, de
	ld [hl], $3
	ld a, [hl]
	ld hl, $8
	add hl, de
	ld [hl], a
	pop bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, $6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
	ld a, $1
	jp Func_10342

Func_10327: ; 10327 (4:4327)
	xor a
	ld hl, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld hl, $8
	add hl, de
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $ff
	ld a, $1
Func_10342: ; 10342 (4:4342)
	push de
	push bc
	ld a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, $c7bd
	ld l, [hl]
	ld h, $0
	ld de, $c7b1
	add hl, de
	ld a, [hl]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c5
	add hl, de
	ld [hl], a
	pop bc
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	ld hl, $9
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
Func_10381: ; 10381 (4:4381)
	set_farcall_addrs_hli Func_14771
	ld a, $3
	call FarCall
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	call FarCall
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_103b5
	jp Func_103fe

Func_103b5: ; 103b5 (4:43b5)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli Func_c868
	ld c, $4
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call FarCall
	jp Func_10381

Func_103fe: ; 103fe (4:43fe)
	pop bc
	pop de
	inc de
	ld hl, $c
	add hl, bc
	ld bc, $6
	call MemCopy
	ld hl, sp+$a
	ld [hl], $0
Func_1040f: ; 1040f (4:440f)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nc, Func_10472
	set_farcall_addrs_hli Func_dbf5
	ld hl, sp+$a
	ld a, [hl]
	or a
	jp nz, Func_10445
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld c, [hl]
	ld a, [wc2e8 + 1]
	ld e, a
	ld hl, sp+$a
	ld a, [hl]
	call FarCall
	jp Func_10468

Func_10445: ; 10445 (4:4445)
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld c, [hl]
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld a, [hl]
	call FarCall
Func_10468: ; 10468 (4:4468)
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	jp Func_1040f

Func_10472: ; 10472 (4:4472)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld c, $0
Func_10480: ; 10480 (4:4480)
	ld a, c
	cp $2
	jp nc, Func_104b0
	push de
	push bc
	set_farcall_addrs_hli Func_dc0a
	pop bc
	pop de
	push de
	push bc
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, c
	call FarCall
	pop bc
	inc c
	pop de
	ld hl, $2f
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_10480

Func_104b0: ; 104b0 (4:44b0)
	ld a, [wSystemType]
	cp $1
	jp z, Func_104c0
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_104c9
Func_104c0: ; 104c0 (4:44c0)
	ld de, $e
	ld hl, Data_1027d
	call Func_2b7d
Func_104c9: ; 104c9 (4:44c9)
	set_farcall_addrs_hli Func_d030
	xor a
	call FarCall
	xor a
	ld [$c2fa], a
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_104ef
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_10503
Func_104ef: ; 104ef (4:44ef)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_10503: ; 10503 (4:4503)
	add sp, $c
	ret

Func_10506: ; 10506 (4:4506)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_1051a: ; 1051a (4:451a)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_1052e: ; 1052e (4:452e)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, [wOAM06XCoord]
	cp $81
	jp nz, Func_1054c
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	jp Func_1055a

Func_1054c: ; 1054c (4:454c)
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
Func_1055a: ; 1055a (4:455a)
	pop bc
	ret

Func_1055c: ; 1055c (4:455c)
	push af
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	ld a, [wSystemType]
	cp $11
	jp nz, Func_105af
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_105af: ; 105af (4:45af)
	call WaitVideoTransfer
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_105c4
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_105cc

Func_105c4: ; 105c4 (4:45c4)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_105cc: ; 105cc (4:45cc)
	pop bc
	ret

Func_105ce:
	push af
	call Func_1052e
	ld a, [wOAM06XCoord]
	cp $81
	jp nz, Func_105e8
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld [hl], $3
	jp Func_105f3

Func_105e8: ; 105e8 (4:45e8)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld [hl], $1
Func_105f3: ; 105f3 (4:45f3)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_1063b
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOAM01Attrs]
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOAM02YCoord]
	ld e, a
	ld a, $1
	call FarCall
	ld c, $0
	ld de, wPoncotPicAlignment + 2
	ld hl, $2
	call Func_1051a
	jp Func_106b1

Func_1063b: ; 1063b (4:463b)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_1067b
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOAM01Attrs]
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOAM02YCoord]
	ld e, a
	ld a, $1
	call FarCall
	ld c, $0
	ld de, wPoncotPicAlignment + 2
	ld hl, $2
	call Func_10506
	jp Func_106b1

Func_1067b: ; 1067b (4:467b)
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOAM01Attrs]
	ld e, a
	ld a, $1
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOAM02YCoord]
	ld e, a
	xor a
	call FarCall
	ld c, $0
	ld de, wPoncotPicAlignment + 2
	ld hl, $2
	call Func_10506
Func_106b1: ; 106b1 (4:46b1)
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	ld a, [$c2cd]
	call Func_1055c
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
.asm_106f9
	ld a, [wNextVBlankFlags]
	or $14
	ld [wNextVBlankFlags], a
	call Func_1025d
	ld a, [$c2cd]
	xor $1
	call Func_1055c
	ld a, [wSystemType]
	cp $1
	jp z, Func_1071e
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_10732
Func_1071e: ; 1071e (4:471e)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_10732: ; 10732 (4:4732)
	pop bc
	ret

Data_10734:
	db "<HIRA>てﾞはﾞっく<KATA>", $00

Data_1073d:
	dr $1073d, $10766

Func_10766:
	add sp, -$32
	ld hl, sp+$29
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_10734
	ld bc, $9
	call MemCopy
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_1073d
	ld bc, $29
	call MemCopy
	callba_hli Func_cb4a
	ld hl, sp+$29
	call WriteHLToSPPlus3
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld bc, $29
	call MemCopy
	add sp, $32
	ret

Func_107b8:
	callba_hli Func_cced
	ret

Data_107c7:
	db $21, $01, $03, $1a, $04, $01, $0b, $08

Data_107cf:
	db $21, $01, $03, $1f, $04, $01, $0b, $08

Func_107d7:
	push af
	push de
	ld a, b
	push af
	push bc
	ld hl, sp+$7
	ld a, [hl]
	ld [wOAM05VTile], a
	ld a, [wSystemType]
	cp $1
	jp z, Func_107f2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_1082a
Func_107f2: ; 107f2 (4:47f2)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_10819
	ld de, $8
	ld hl, Data_107c7
	call Func_2b7d
	jp Func_1082a

Func_10819: ; 10819 (4:4819)
	ld hl, sp+$7
	ld a, [hl]
	cp $1
	jp nz, Func_1082a
	ld de, $8
	ld hl, Data_107cf
	call Func_2b7d
Func_1082a: ; 1082a (4:482a)
	call WaitVideoTransfer
	ld a, $3
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld e, $a
	ld a, $8
	call SetStringStartState
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_10876
	ld hl, Data_1095c
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $401
	call FarCall
	jp Func_108b8

Func_10876: ; 10876 (4:4876)
	ld hl, sp+$7
	ld a, [hl]
	cp $1
	jp nz, Func_108b0
	ld hl, Data_10964
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $401
	call FarCall
	jp Func_108b8

Func_108b0: ; 108b0 (4:48b0)
	ld hl, Data_1096c
	push hl
	call PlaceString
	pop bc
Func_108b8: ; 108b8 (4:48b8)
	call WaitVideoTransfer
	pop bc
	pop af
	push bc
	push af
	cp $2
	jp z, Func_108d3
	ld e, $2
	ld a, $d
	call SetStringStartState
	ld hl, Data_10973
	push hl
	call PlaceString
	pop bc
Func_108d3: ; 108d3 (4:48d3)
	pop af
	pop bc
	pop de
	push bc
	cp $1
	jp nz, Func_108fb
	push de
	ld e, $3
	ld a, $e
	call SetStringStartState
	pop de
	push de
	ld hl, Data_10979
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_1097e
	ld hl, $f04
	call PlaceStringDEatCoordHL
	jp Func_10912

Func_108fb: ; 108fb (4:48fb)
	or a
	jp nz, Func_10912
	push de
	ld e, $3
	ld a, $e
	call SetStringStartState
	pop de
	push de
	ld hl, Data_10983
	push hl
	call PlaceString
	pop bc
	pop bc
Func_10912: ; 10912 (4:4912)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	push bc
	ld a, c
	cp $1
	jp nz, Func_10935
	xor a
Func_10927: ; 10927 (4:4927)
	cp $1e
	jp nc, Func_10935
.asm_1092c
	push af
	call Func_0465
.asm_1092f
	pop af
	inc a
	jp Func_10927

Func_10935: ; 10935 (4:4935)
	pop bc
	ld hl, sp+$1
	ld a, [hl]
.asm_10939
	or a
	jp nz, Func_1095a
	ld a, c
	cp $1
	jp z, Func_1095a
	ld a, $2
	ld [$c2fa], a
	callba_hli Func_222b7
.asm_1094b
	xor a
	ld [$c2fa], a
Func_1095a: ; 1095a (4:495a)
	pop bc
	ret

Data_1095c:
	db "<HIRA>のしょうり<KATA>", $00

Data_10964:
	db "<HIRA>のしょうり<KATA>", $00

Data_1096c:
	db "<HIRA>ひきわけ<KATA>", $00

Data_10973:
	db "<HIRA>きろく<KATA>", $00

Data_10979:
	TX_SNUM
	db "キロ", $00

Data_1097e:
	db "メートル", $00

Data_10983:
	TX_SNUM
	db "<HIRA>とん<KATA>", $00

Data_1098a:
	dr $1098a, $10992

Data_10992:
	dr $10992, $1099a

Func_1099a:
	add sp, -$2a
	push af
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_1098a
	ld bc, $8
	call MemCopy
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_10992
	ld bc, $8
	call MemCopy
	pop af
	or a
	jp nz, Func_109cf
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jp Func_109e3

Func_109cf: ; 109cf (4:49cf)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	push de
	push hl
	pop de
	pop hl
Func_109e3: ; 109e3 (4:49e3)
	ld hl, $27
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	push af
	ld hl, $b
	add hl, de
	ld a, [hl]
	and $f
	push af
	push bc
	ld hl, $17
	add hl, de
	ld l, [hl]
	push hl
	ld hl, $2e
	add hl, de
	ld a, [hl]
	ld hl, sp+$18
	ld [hl], a
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	pop hl
	push af
	ld e, l
	ld hl, sp+$19
	call Func_241f
	pop af
	call GetSRAMBank
	pop bc
	ld hl, sp+$27
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_e39a
	pop de
	ld hl, sp+$14
	ld a, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_10a58
	ld bc, $1
Func_10a58: ; 10a58 (4:4a58)
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	push de
	push hl
	pop de
	pop hl
	add sp, $2a
	push de
	push hl
	pop de
	pop hl
	ret

Func_10a8b:
	call Func_1099a
	push de
	push hl
	pop de
	pop hl
	ld hl, 220
	call CompareHLtoDE
	jp c, Func_10aa0
	ld a, $1
	jp Func_10abe

Func_10aa0: ; 10aa0 (4:4aa0)
	ld hl, 338
	call CompareHLtoDE
	jp c, Func_10aae
	ld a, $2
	jp Func_10abe

Func_10aae: ; 10aae (4:4aae)
	ld hl, 580
	call CompareHLtoDE
	jp c, Func_10abc
	ld a, $4
	jp Func_10abe

Func_10abc: ; 10abc (4:4abc)
	ld a, $8
Func_10abe: ; 10abe (4:4abe)
	ret

Func_10abf: ; 10abf (4:4abf)
	push af
	ld c, $0
	ld e, c
	push bc
	push de
	ld hl, sp+$5
	ld a, [hl]
	cp $2
	jp nz, Func_10ad0
	call Func_10766
Func_10ad0: ; 10ad0 (4:4ad0)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_10ae1
	xor a
	call Func_105ce
	ld l, $1
	jp Func_10ae6

Func_10ae1: ; 10ae1 (4:4ae1)
	call Func_1028b
	ld l, $0
Func_10ae6: ; 10ae6 (4:4ae6)
	push hl
	ld a, $d
	call Func_14fc
	pop hl
	pop de
	pop bc
Func_10aef: ; 10aef (4:4aef)
	push hl
	push bc
	push de
	ld a, l
	call Func_10b8a
	pop de
	pop bc
	or a
	jp nz, Func_10b00
	inc e
	jp Func_10b06

Func_10b00: ; 10b00 (4:4b00)
	cp $1
	jp nz, Func_10b06
	inc c
Func_10b06: ; 10b06 (4:4b06)
	push bc
	push de
	callba_hli Func_17a44
	pop de
	pop bc
	pop hl
	ld a, e
	cp $1
	jp nz, Func_10b24
	ld c, $0
	jp Func_10b32

Func_10b24: ; 10b24 (4:4b24)
	ld a, c
	cp $1
	jp nz, Func_10b2f
	ld c, $1
	jp Func_10b32

Func_10b2f: ; 10b2f (4:4b2f)
	jp Func_10aef

Func_10b32: ; 10b32 (4:4b32)
	push bc
	ld e, l
	ld a, c
	call Func_11fda
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, Func_10b43
	call Func_107b8
Func_10b43: ; 10b43 (4:4b43)
	pop bc
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_10b57
	ld a, c
	cp $1
	jp nz, Func_10b57
	ld hl, $1
	jp Func_10b88

Func_10b57: ; 10b57 (4:4b57)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_10b85
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_10b74
	ld l, c
	ld h, $0
	jp Func_10b88

Func_10b74: ; 10b74 (4:4b74)
	inc c
	dec c
	jp nz, Func_10b7f
	ld hl, $1
	jp Func_10b88

Func_10b7f: ; 10b7f (4:4b7f)
	ld hl, $0
	jp Func_10b88

Func_10b85: ; 10b85 (4:4b85)
	ld hl, $0
Func_10b88: ; 10b88 (4:4b88)
	pop bc
	ret

Func_10b8a: ; 10b8a (4:4b8a)
	push af
	add sp, -$1a
	ld hl, sp+$1b
	ld c, [hl]
	ld hl, sp+$b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	call Func_11cfb
	set_farcall_addrs_hli Func_17aba
	ld hl, $1e
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $605
	ld hl, $705
	call Func_2124
	ld hl, sp+$1d
	ld a, [hl]
	or a
	jp nz, Func_10bed
	ld hl, sp+$d
	push de
	push hl
	pop de
	pop hl
	xor a
	call Func_115af
	ld hl, sp+$13
	ld a, [hl]
	cp $1
	jp nz, Func_10be3
	ld hl, sp+$12
	ld a, [hl]
	or a
	jp nz, Func_10be3
	ld hl, sp+$d
	push de
	push hl
	pop de
	pop hl
	ld a, $4
	call Func_115af
Func_10be3: ; 10be3 (4:4be3)
	ld de, $0
	ld hl, sp+$2
	ld [hl], $0
	jp Func_10c0a

Func_10bed: ; 10bed (4:4bed)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_10c03
	ld hl, sp+$2
	ld [hl], $0
	jp Func_10c07

Func_10c03: ; 10c03 (4:4c03)
	ld hl, sp+$2
	ld [hl], $ff
Func_10c07: ; 10c07 (4:4c07)
	ld de, $0
Func_10c0a: ; 10c0a (4:4c0a)
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	add hl, de
	call Func_10ff0
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $605
	ld hl, $705
	call Func_2323
	set_farcall_addrs_hli Func_17c57
	pop hl
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10c8f
	ld hl, sp+$1b
	ld a, [hl]
	cp $1
	jp nz, Func_10c8f
	ld c, $1
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$7
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$10
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $0
	ld de, wPoncotPicAlignment + 2
	ld hl, $2
	call Func_1051a
	jp Func_10cda

Func_10c8f: ; 10c8f (4:4c8f)
	ld hl, sp+$1b
	ld a, [hl]
	cp $1
	jp nz, Func_10cda
	ld c, $1
	ld hl, sp+$7
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$10
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $0
	ld de, wPoncotPicAlignment + 2
	ld hl, $2
	call Func_10506
Func_10cda: ; 10cda (4:4cda)
	ld bc, $0
Func_10cdd: ; 10cdd (4:4cdd)
	ld l, c
	ld h, b
	ld de, $2
	call CompareHLtoDE
	jp nc, Func_10d19
	ld l, c
	ld h, b
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10d15
	ld l, c
	ld h, b
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	add hl, de
	ld de, $6
	add hl, de
	ld [hl], $15
Func_10d15: ; 10d15 (4:4d15)
	inc bc
	jp Func_10cdd

Func_10d19: ; 10d19 (4:4d19)
	ld hl, $2
	call WriteHLToSPPlusParam8
	db $18
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $1a
	ld hl, $0
Func_10d2a: ; 10d2a (4:4d2a)
	ld hl, $0
Func_10d2d: ; 10d2d (4:4d2d)
	ld de, $5
	call CompareHLtoDE
	jp nc, Func_10d3f
	push hl
	call Func_0465
	pop hl
	inc hl
	jp Func_10d2d

Func_10d3f: ; 10d3f (4:4d3f)
	call GetHLAtSPPlusParam8
	db $18
	inc hl
	call WriteHLToSPPlusParam8
	db $18
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10d57
	ld hl, sp+$1
	call Func_10e03
	jp Func_10d5c

Func_10d57: ; 10d57 (4:4d57)
	ld hl, sp+$1
	call Func_10efa
Func_10d5c: ; 10d5c (4:4d5c)
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	call WriteHLToSPPlusParam8
	db $1a
	call GetHLAtSPPlusParam8
	db $1a
	ld a, l
	sub $4
	or h
	jp nz, Func_10d77
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $1a
Func_10d77: ; 10d77 (4:4d77)
	call GetHLAtSPPlusParam8
	db $1a
	push hl
	ld hl, sp+$11
	ld l, [hl]
	push hl
	ld hl, sp+$9
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $15
	push hl
	call GetHLAtSPPlusParam8
	db $15
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0d
	push hl
	call GetHLAtSPPlusParam8
	db $0d
	pop de
	call Func_12029
	pop bc
	pop bc
	pop bc
	pop bc
	call GetHLAtSPPlusParam8
	db $0f
	push hl
	call GetHLAtSPPlusParam8
	db $0f
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	call Func_11176
	pop bc
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$15
	ld a, [hl]
	cp $ff
	jp z, Func_10dd3
	call GetHLAtSPPlusParam8
	db $18
	ld c, l
	ld b, h
	ld e, $4
	ld hl, sp+$15
	ld a, [hl]
	call Func_11b60
	jp Func_10dfd

Func_10dd3: ; 10dd3 (4:4dd3)
	call GetHLAtSPPlusParam8
	db $18
	ld de, $a
	call DivideHLByDESigned
	push de
	push hl
	pop de
	pop hl
	ld hl, $63
	call CompareHLtoDE
	jp nc, Func_10dfa
	call GetHLAtSPPlusParam8
	db $18
	ld c, l
	ld b, h
	ld e, $4
	ld a, $2
	call Func_11b60
	jp Func_10dfd

Func_10dfa: ; 10dfa (4:4dfa)
	jp Func_10d2a

Func_10dfd: ; 10dfd (4:4dfd)
	ld hl, sp+$15
	ld a, [hl]
	add sp, $1c
	ret

Func_10e03: ; 10e03 (4:4e03)
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_10e09: ; 10e09 (4:4e09)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call Func_1108a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_114ea
	cp $1e
	jp z, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call Func_115af
Func_10ee2: ; 10ee2 (4:4ee2)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_10eed
	jp Func_10ef7

Func_10eed: ; 10eed (4:4eed)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_10e09

Func_10ef7: ; 10ef7 (4:4ef7)
	pop bc
	pop bc
	ret

Func_10efa: ; 10efa (4:4efa)
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $1
Func_10f00: ; 10f00 (4:4f00)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call Func_1108a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_114ea
	cp $1e
	jp z, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call Func_11872
Func_10fd9: ; 10fd9 (4:4fd9)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10fe3
	jp Func_10fed

Func_10fe3: ; 10fe3 (4:4fe3)
	ld hl, sp+$0
	ld a, [hl]
	dec a
	ld hl, sp+$0
	ld [hl], a
	jp Func_10f00

Func_10fed: ; 10fed (4:4fed)
	pop bc
	pop bc
	ret

Func_10ff0: ; 10ff0 (4:4ff0)
	push hl
	push bc
	xor a
	ld hl, $3
	pop de
	push hl
Func_10ff8: ; 10ff8 (4:4ff8)
	pop hl
	push hl
	inc h
	dec h
	bit 7, h
	jr nz, asm_1105a
	ld c, $0
Func_11002: ; 11002 (4:5002)
	ld a, c
	cp $3c
	jp nc, Func_11048
	push bc
	call Func_24e9
	ld l, a
	ld h, $0
	pop bc
	ld a, l
	and $10
	jp z, Func_11044
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_11044
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld a, l
	or h
	jp nz, Func_1103b
	ld a, c
	cp $3a
	jp c, Func_1103b
	jp Func_11044

Func_1103b: ; 1103b (4:503b)
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld [hl], $4
Func_11044: ; 11044 (4:5044)
	inc c
	jp Func_11002

Func_11048: ; 11048 (4:5048)
	ld bc, $0
	pop hl
	push hl
	ld e, l
	xor a
	call Func_11b60
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp Func_10ff8

asm_1105a
	xor a
Func_1105b: ; 1105b (4:505b)
	cp $a
	jp nc, Func_11087
	push af
	call Func_24e9
	ld l, a
	ld h, $0
	ld a, l
	and $10
	jp z, Func_11082
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_11082
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld [hl], $1
Func_11082: ; 11082 (4:5082)
	pop af
	inc a
	jp Func_1105b

Func_11087: ; 11087 (4:5087)
	pop bc
	pop bc
	ret

Func_1108a: ; 1108a (4:508a)
	push hl
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_110c3
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, $1
	add [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $4
	jp nz, Func_110c0
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
Func_110c0: ; 110c0 (4:50c0)
	jp Func_11174

Func_110c3: ; 110c3 (4:50c3)
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_110df
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	add $10
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
	jp Func_11174

Func_110df: ; 110df (4:50df)
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_1115d
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp z, Func_11148
	cp $2
	jp z, Func_11131
	cp $1
	jp z, Func_1111c
	or a
	jp nz, Func_1115a
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_1115a

Func_1111c: ; 1111c (4:511c)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
	jp Func_1115a

Func_11131: ; 11131 (4:5131)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
	jp Func_1115a

Func_11148: ; 11148 (4:5148)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_1115a: ; 1115a (4:515a)
	jp Func_11174

Func_1115d: ; 1115d (4:515d)
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $2
	jp c, Func_11174
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_11174: ; 11174 (4:5174)
	pop bc
	ret

Func_11176: ; 11176 (4:5176)
	push hl
	push de
	call GetHLAtSPPlus4
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nz, Func_111ac
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nz, Func_111ac
	call GetHLAtSPPlus4
	ld a, l
	sub $48
	or h
	jp nz, Func_111a9
	pop hl
	push hl
	ld a, l
	sub $78
	or h
	jp nz, Func_111a9
	ld a, $2
	jp Func_111db

Func_111a9: ; 111a9 (4:51a9)
	jp Func_111d9

Func_111ac: ; 111ac (4:51ac)
	call GetHLAtSPPlus4
	ld a, l
	sub $48
	or h
	jp nz, Func_111c3
	pop hl
	push hl
	ld a, l
	sub $78
	or h
	jp nz, Func_111c3
	xor a
	jp Func_111db

Func_111c3: ; 111c3 (4:51c3)
	ld a, c
	sub $48
	or b
	jp nz, Func_111d9
	call GetHLAtSPPlus8
	ld a, l
	sub $78
	or h
	jp nz, Func_111d9
	ld a, $1
	jp Func_111db

Func_111d9: ; 111d9 (4:51d9)
	ld a, $ff
Func_111db: ; 111db (4:51db)
	pop bc
	pop bc
	ret

Data_111de:
	dr $111de, $114e0

Data_114e0:
	dr $114e0, $114e5

Data_114e5:
	dr $114e5, $114ea

Func_114ea: ; 114ea (4:54ea)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_114e0
	ld bc, $5
	call MemCopy
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_114e5
	ld bc, $5
	call MemCopy
	ld c, $0
Func_11511: ; 11511 (4:5511)
	ld a, c
	cp $5
	jp nc, Func_1156f
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	add a
	add a
	add a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_1156b
	ld hl, sp+$d
	ld a, [hl]
	cp $88
	jp z, Func_1155f
	cp $58
	jp z, Func_11553
	cp $38
	jp z, Func_11548
	cp $8
	jp nz, Func_1156b
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	jp Func_11590

Func_11548: ; 11548 (4:5548)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	inc a
	jp Func_11590

Func_11553: ; 11553 (4:5553)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	add $2
	jp Func_11590

Func_1155f: ; 1155f (4:555f)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	add $3
	jp Func_11590

Func_1156b: ; 1156b (4:556b)
	inc c
	jp Func_11511

Func_1156f: ; 1156f (4:556f)
	ld hl, sp+$a
	ld a, [hl]
	cp $30
	jp nz, Func_1158e
	ld hl, sp+$d
	ld a, [hl]
	cp $58
	jp z, Func_11589
	cp $38
	jp nz, Func_1158e
	ld a, $9
	jp Func_11590

Func_11589: ; 11589 (4:5589)
	ld a, $a
	jp Func_11590

Func_1158e: ; 1158e (4:558e)
	ld a, $1e
Func_11590: ; 11590 (4:5590)
	add sp, $e
	ret

Data_11593:
	dr $11593, $115a8

Data_115a8:
	dr $115a8, $115af

Func_115af: ; 115af (4:55af)
	push af
	push de
	add sp, -$20
	ld hl, sp+$7
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_11593
	ld bc, $15
	call MemCopy
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_115a8
	ld bc, $7
	call MemCopy
	ld hl, sp+$23
	ld a, [hl]
	or a
	jp nz, Func_11658
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	cp $23
	jp nc, Func_11609
	call GetHLAtSPPlusParam8
	db $22
	ld de, $5
	add hl, de
	ld [hl], $4
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $22
	ld de, $6
	add hl, de
	ld [hl], $1
	jp Func_1185a

Func_11609: ; 11609 (4:5609)
	ld hl, sp+$1e
	ld a, [hl]
	cp $41
	jp nc, Func_11628
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $22
	ld de, $6
	add hl, de
	ld [hl], $1
	jp Func_11658

Func_11628: ; 11628 (4:5628)
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	ld c, $0
Func_11632: ; 11632 (4:5632)
	ld a, c
	cp $7
	jp nc, Func_11658
	ld hl, sp+$1e
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	cp [hl]
	jp nc, Func_11654
	ld a, c
	add $32
	call GetHLAtSPPlusParam8
	db $22
	ld de, $6
	add hl, de
	ld [hl], a
	jp Func_1185a

Func_11654: ; 11654 (4:5654)
	inc c
	jp Func_11632

Func_11658: ; 11658 (4:5658)
	call GetHLAtSPPlusParam8
	db $22
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_1168e
	ld hl, sp+$23
	ld a, [hl]
	cp $10
	jp z, Func_11676
	ld hl, sp+$23
	ld a, [hl]
	cp $11
	jp nz, Func_1168b
Func_11676: ; 11676 (4:5676)
	call GetHLAtSPPlusParam8
	db $22
	ld de, $9
	add hl, de
	ld [hl], $0
	ld e, $1
	ld hl, sp+$23
	ld a, [hl]
	call Func_11a81
	jp Func_1168e

Func_1168b: ; 1168b (4:568b)
	jp Func_1185a

Func_1168e: ; 1168e (4:568e)
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $22
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld e, [hl]
	ld hl, sp+$1d
	ld [hl], e
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$1c
	ld [hl], e
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_116e3
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $2
	jp Func_1185a

Func_116e3: ; 116e3 (4:56e3)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_11722
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	jp Func_1185a

Func_11722: ; 11722 (4:5722)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_11762
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	jp Func_1185a

Func_11762: ; 11762 (4:5762)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_117a3
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $3
	jp Func_1185a

Func_117a3: ; 117a3 (4:57a3)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nz, Func_117db
	call GetHLAtSPPlusParam8
	db $22
	ld de, $5
	add hl, de
	ld [hl], $4
	jp Func_1185a

Func_117db: ; 117db (4:57db)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $2
	jp nz, Func_11813
	call GetHLAtSPPlusParam8
	db $22
	ld de, $5
	add hl, de
	ld [hl], $8
	jp Func_1185a

Func_11813: ; 11813 (4:5813)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp nz, Func_1185a
	call GetHLAtSPPlusParam8
	db $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $22
	ld de, $9
	add hl, de
	ld [hl], $1
	ld e, $0
	ld hl, sp+$23
	ld a, [hl]
	call Func_11a81
Func_1185a: ; 1185a (4:585a)
	add sp, $24
	ret

Data_1185d:
	dr $1185d, $11872

Func_11872: ; 11872 (4:5872)
	push af
	push de
	add sp, -$18
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_1185d
	ld bc, $15
	call MemCopy
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_118bb
	ld hl, sp+$1b
	ld a, [hl]
	cp $10
	jp z, Func_118a3
	ld hl, sp+$1b
	ld a, [hl]
	cp $11
	jp nz, Func_118b8
Func_118a3: ; 118a3 (4:58a3)
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $9
	add hl, de
	ld [hl], $0
	ld e, $1
	ld hl, sp+$1b
	ld a, [hl]
	call Func_11a81
	jp Func_118bb

Func_118b8: ; 118b8 (4:58b8)
	jp Func_11a7e

Func_118bb: ; 118bb (4:58bb)
	ld a, $64
	call Func_10001
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	ld hl, sp+$16
	ld [hl], e
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$15
	ld [hl], e
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_1190a
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $2
	jp Func_11a7e

Func_1190a: ; 1190a (4:590a)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_11948
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	jp Func_11a7e

Func_11948: ; 11948 (4:5948)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_11988
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $3
	jp Func_11a7e

Func_11988: ; 11988 (4:5988)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_119c7
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	jp Func_11a7e

Func_119c7: ; 119c7 (4:59c7)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nz, Func_119ff
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $5
	add hl, de
	ld [hl], $4
	jp Func_11a7e

Func_119ff: ; 119ff (4:59ff)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $2
	jp nz, Func_11a37
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $5
	add hl, de
	ld [hl], $8
	jp Func_11a7e

Func_11a37: ; 11a37 (4:5a37)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp nz, Func_11a7e
	call GetHLAtSPPlusParam8
	db $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $9
	add hl, de
	ld [hl], $1
	ld e, $0
	ld hl, sp+$1b
	ld a, [hl]
	call Func_11a81
Func_11a7e: ; 11a7e (4:5a7e)
	add sp, $1c
	ret

Func_11a81: ; 11a81 (4:5a81)
	cp $6
	jp z, Func_11a8b
	cp $10
	jp nz, Func_11a90
Func_11a8b: ; 11a8b (4:5a8b)
	ld l, $0
	jp Func_11a92

Func_11a90: ; 11a90 (4:5a90)
	ld l, $4
Func_11a92: ; 11a92 (4:5a92)
	inc e
	dec e
	jp nz, Func_11a9c
	ld a, $8a
	jp Func_11a9e

Func_11a9c: ; 11a9c (4:5a9c)
	ld a, $8f
Func_11a9e: ; 11a9e (4:5a9e)
	push hl
	push af
	ld a, l
	add $7
	ld e, $4
	call SetStringStartState
	pop af
	pop hl
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b47
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $6
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b4c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $8
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b51
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $a
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b56
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	ld a, l
	add $7
	ld e, $c
	call SetStringStartState
	pop af
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b5b
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Data_11b47:
	TX_STACK
	TX_STACK
	db $00

Data_11b4c:
	TX_STACK
	TX_STACK
	db $00

Data_11b51:
	TX_STACK
	TX_STACK
	db $00

Data_11b56:
	TX_STACK
	TX_STACK
	db $00

Data_11b5b:
	TX_STACK
	TX_STACK
	db $00

Func_11b60: ; 11b60 (4:5b60)
	push af
	push bc
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	set_farcall_addrs_hli Func_17e95
	pop de
	push de
	ld a, e
	cp $3
	jp z, Func_11b9b
	cp $4
	jp nz, Func_11baf
	ld c, $6
	ld e, $a
	ld hl, $505
	call FarCall
	ld e, $6
	ld a, $6
	call SetStringStartState
	jp Func_11bb6

Func_11b9b: ; 11b9b (4:5b9b)
	ld c, $5
	ld e, $6
	ld hl, $705
	call FarCall
	ld e, $7
	ld a, $8
	call SetStringStartState
	jp Func_11bb6

Func_11baf: ; 11baf (4:5baf)
	ld e, $7
	ld a, $8
	call SetStringStartState
Func_11bb6: ; 11bb6 (4:5bb6)
	pop de
	ld a, e
	cp $4
	jp z, Func_11beb
	cp $3
	jp z, Func_11bdb
	cp $2
	jp z, Func_11bdb
	cp $1
	jp z, Func_11bdb
	or a
	jp nz, Func_11cb2
	ld hl, Data_11cc1
	push hl
	call PlaceString
	pop bc
	jp Func_11cb2

Func_11bdb: ; 11bdb (4:5bdb)
	ld l, e
	ld h, $0
	push hl
	ld hl, Data_11cc6
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_11cb2

Func_11beb: ; 11beb (4:5beb)
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp z, Func_11c12
	cp $1
	jp z, Func_11c07
	or a
	jp nz, Func_11c1a
	ld hl, Data_11cca
	push hl
	call PlaceString
	pop bc
	jp Func_11c1a

Func_11c07: ; 11c07 (4:5c07)
	ld hl, Data_11cd3
	push hl
	call PlaceString
	pop bc
	jp Func_11c1a

Func_11c12: ; 11c12 (4:5c12)
	ld hl, Data_11cdc
	push hl
	call PlaceString
	pop bc
Func_11c1a: ; 11c1a (4:5c1a)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push de
	push hl
	pop de
	pop hl
	ld hl, $63
	call CompareHLtoDE
	jp nc, Func_11c41
	ld e, $8
	ld a, $6
	call SetStringStartState
	ld hl, Data_11ce3
	push hl
	call PlaceString
	pop bc
	jp Func_11c9e

Func_11c41: ; 11c41 (4:5c41)
	ld e, $8
	ld a, $6
	call SetStringStartState
	ld hl, Data_11cec
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push de
	push hl
	pop de
	pop hl
	ld hl, $64
	call CompareHLtoDE
	jp nc, Func_11c7a
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, Data_11cf0
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_11c8c

Func_11c7a: ; 11c7a (4:5c7a)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, Data_11cf3
	push hl
	call PlaceString
	pop bc
	pop bc
Func_11c8c: ; 11c8c (4:5c8c)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push de
	ld hl, Data_11cf7
	push hl
	call PlaceString
	pop bc
	pop bc
Func_11c9e: ; 11c9e (4:5c9e)
	set_farcall_addrs_hli Func_da901
	ld de, $a06
	ld hl, $505
	call FarCall
Func_11cb2: ; 11cb2 (4:5cb2)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	ret

Data_11cc1:
	db "スタート", $00

Data_11cc6:
	db " "
	TX_SNUM
	db $00

Data_11cca:
	db "<HIRA>あなたのかち<KATA>", $00

Data_11cd3:
	db "<HIRA>あなたのまけ<KATA>", $00

Data_11cdc:
	db "<HIRA>ひきわけ<KATA>", $00

Data_11ce3:
	db "タイムオーハﾞー", $00

Data_11cec:
	db "タイム", $00

Data_11cf0:
	TX_SNUM
	db $00

Data_11cf3:
	db " "
	TX_SNUM
	db $00

Data_11cf7:
	db ":"
	TX_SNUM
	db $00

Func_11cfb: ; 11cfb (4:5cfb)
	push hl
	push de
	push bc
	push bc
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_3aa8
	set_farcall_addrs_hli Func_17e95
	ld c, $12
	ld e, $14
	ld hl, $0
	call FarCall
	ld c, $2
	ld e, $4
	ld hl, $306
	call FarCall
	ld c, $2
	ld e, $4
	ld hl, $d06
	call FarCall
	ld c, $4
	ld e, $2
	ld hl, $908
	call FarCall
	ld c, $2
	ld e, $6
	ld hl, $10a
	call FarCall
	ld c, $2
	ld e, $6
	ld hl, $d0a
	call FarCall
	ld c, $2
	ld e, $2
	ld hl, $90f
	call FarCall
	ld bc, $84
	ld de, $4
	ld hl, Func_0303
	call Func_101be
	ld bc, $84
	ld de, $4
	ld hl, $d03
	call Func_101be
	ld bc, $84
	ld de, $e
	ld hl, $30e
	call Func_101be
	ld bc, $87
	ld de, $105
	ld hl, $901
	call Func_101be
	ld bc, $86
	ld de, $105
	ld hl, $a01
	call Func_101be
	pop bc
	push bc
	inc c
	dec c
	jp z, Func_11db8
	ld a, c
	cp $1
	jp nz, Func_11ddb
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_11ddb
Func_11db8: ; 11db8 (4:5db8)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_11dfb

Func_11ddb: ; 11ddb (4:5ddb)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	pop de
Func_11dfb: ; 11dfb (4:5dfb)
	push de
	push bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, $2b
	add hl, bc
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	ld hl, $2b
	add hl, de
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld c, $0
Func_11e1f: ; 11e1f (4:5e1f)
	ld a, c
	cp $2
	jp nc, Func_11e6b
	push bc
	set_farcall_addrs_hli Func_6adb3
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld e, [hl]
	call FarCall
	ld l, a
	pop bc
	push bc
	push hl
	ld a, c
	add a
	add a
	ld d, a
	add a
	add a
	add a
	add d
	push af
	set_farcall_addrs_hli Func_a26c
	pop af
	pop hl
	ld h, a
	ld e, $0
	ld c, $24
	call FarCall
	pop bc
	inc c
	jp Func_11e1f

Func_11e6b: ; 11e6b (4:5e6b)
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlusParam8
	db $0e
	inc hl
	inc hl
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $6
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $5
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $0e
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ld hl, $2e
	add hl, bc
	ld a, [hl]
	dec a
	call GetHLAtSPPlusParam8
	db $0c
	ld de, $8
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $88
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	inc hl
	inc hl
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call GetHLAtSPPlus10
	ld de, $6
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop de
	ld hl, $2e
	add hl, de
	ld a, [hl]
	dec a
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	ld [hl], a
	pop bc
	inc c
	dec c
	jp z, Func_11f26
	ld a, c
	cp $1
	jp nz, Func_11f42
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_11f42
Func_11f26: ; 11f26 (4:5f26)
	xor a
	call Func_10a8b
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	ld a, $1
	call Func_10a8b
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld [hl], a
	jp Func_11f5b

Func_11f42: ; 11f42 (4:5f42)
	ld a, $1
	call Func_10a8b
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	xor a
	call Func_10a8b
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld [hl], a
Func_11f5b: ; 11f5b (4:5f5b)
	ld l, $0
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $0e
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $10
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $12
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_12029
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wSystemType]
	cp $11
	jp nz, Func_11fc9
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wOAM26VTile], a
Func_11fc9: ; 11fc9 (4:5fc9)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_11fda: ; 11fda (4:5fda)
	push de
	push af
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, $3
	ld [wOAM05VTile], a
	pop af
	pop de
	or a
	jp nz, Func_12021
	inc e
	dec e
	jp nz, Func_12021
	ld a, $2
	ld [$c2fa], a
	callba_hli Func_222b7
	xor a
	ld [$c2fa], a
Func_12021: ; 12021 (4:6021)
	call Func_3aa8
	ret

Data_12025:
	db $00, $0c, $18, $0c

Func_12029: ; 12029 (4:6029)
	push hl
	add sp, -$12
	push de
	push bc
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_12025
	ld bc, $4
	call MemCopy
	call GetHLAtSPPlusParam8
	db $18
	ld de, $8
	add hl, de
	call WriteHLToSPPlusParam8
	db $10
	pop bc
	ld hl, $8
	add hl, bc
	call WriteHLToSPPlusParam8
	db $10
	pop de
	ld hl, $10
	add hl, de
	call WriteHLToSPPlus8
	call GetHLAtSPPlusParam8
	db $18
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	ld hl, sp+$5
	xor a
	ld [hl], a
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$18
	ld a, [hl]
	cp $3
	jp nz, Func_12078
	ld hl, sp+$4
	ld [hl], $1
Func_12078: ; 12078 (4:6078)
	ld hl, sp+$1a
	ld a, [hl]
	cp $3
	jp nz, Func_12084
	ld hl, sp+$5
	ld [hl], $1
Func_12084: ; 12084 (4:6084)
	ld hl, sp+$1c
	ld a, [hl]
	cp $2
	jp nz, Func_12093
	ld hl, sp+$1c
	ld [hl], $0
	jp Func_1209f

Func_12093: ; 12093 (4:6093)
	ld hl, sp+$1c
	ld a, [hl]
	cp $3
	jp nz, Func_1209f
	ld hl, sp+$1c
	ld [hl], $2
Func_1209f: ; 1209f (4:609f)
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	ld hl, sp+$18
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $10
	set_farcall_addrs_hli Func_da839
	ld hl, sp+$1c
	ld l, [hl]
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $10
	ld a, l
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call FarCall
	ld hl, sp+$1a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $24
	add hl, de
	call WriteHLToSPPlusParam8
	db $12
	set_farcall_addrs_hli Func_da839
	ld hl, sp+$1c
	ld l, [hl]
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $12
	ld a, l
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call FarCall
	callba_hli Func_d9f55
	add sp, $14
	ret

Data_12155:
	dr $12155, $1228e

Func_1228e: ; 1228e (4:628e)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	xor a
	ld hl, sp+$b
	ld a, [hl]
	cp $2
	jp nz, Func_122a1
	call Func_10766
	xor a
Func_122a1: ; 122a1 (4:62a1)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_122b3
	ld a, $1
	call Func_105ce
	ld l, $1
	jp Func_122b8

Func_122b3: ; 122b3 (4:62b3)
	call Func_1028b
	ld l, $0
Func_122b8: ; 122b8 (4:62b8)
	push hl
	callba_hli Func_62865
	ld a, $f
	call Func_14fc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
Func_1230c: ; 1230c (4:630c)
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_12b93
	ld l, $0
	push hl
	ld c, $0
	ld e, $0
	xor a
	call Func_12acb
	pop bc
	ld a, [wSystemType]
	cp $11
	jp nz, Func_12352
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wOAM26VTile], a
Func_12352: ; 12352 (4:6352)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, sp+$b
	xor a
	ld [hl], a
	ld hl, sp+$a
	ld [hl], a
	pop hl
	push hl
	ld a, l
	call Func_12448
	ld c, a
	pop hl
	ld a, c
	cp $2
	jp nz, Func_123d2
	push hl
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_3aa8
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_12436
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	xor a
Func_123c0: ; 123c0 (4:63c0)
	cp $3c
	jp nc, Func_123ce
	push af
	call Func_0465
	pop af
	inc a
	jp Func_123c0

Func_123ce: ; 123ce (4:63ce)
	pop hl
	jp Func_123d5

Func_123d2: ; 123d2 (4:63d2)
	jp Func_123d8

Func_123d5: ; 123d5 (4:63d5)
	jp Func_1230c

Func_123d8: ; 123d8 (4:63d8)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_123fe
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_123f2
	jp Func_123fe

Func_123f2: ; 123f2 (4:63f2)
	inc c
	dec c
	jp nz, Func_123fc
	ld c, $1
	jp Func_123fe

Func_123fc: ; 123fc (4:63fc)
	ld c, $0
Func_123fe: ; 123fe (4:63fe)
	push bc
	ld hl, sp+$d
	ld a, [hl]
	cp $2
.asm_12403
	jp nz, Func_1240a
	call Func_107b8
Func_1240a: ; 1240a (4:640a)
	pop bc
	ld hl, sp+$b
	ld a, [hl]
	or a
	jp nz, Func_1241e
	ld a, c
	cp $1
	jp nz, Func_1241e
	ld hl, $1
	jp Func_1242f

Func_1241e: ; 1241e (4:641e)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_1242c
	ld l, c
	ld h, $0
	jp Func_1242f

Func_1242c: ; 1242c (4:642c)
	ld hl, $0
Func_1242f: ; 1242f (4:642f)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_12436:
	db "<HIRA>ひきわけなのてﾞ もういちとﾞ<KATA>", $00

Func_12448: ; 12448 (4:6448)
	push af
	add sp, -$4e
	xor a
Func_1244c: ; 1244c (4:644c)
	cp $3c
	jp nc, Func_1245d
	ld e, a
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld [hl], $0
	inc a
	jp Func_1244c

Func_1245d: ; 1245d (4:645d)
	ld de, $0
	ld hl, sp+$a
	call Func_12892
	ld c, $0
Func_12467: ; 12467 (4:6467)
	ld a, c
	cp $6
	jp nc, Func_1247f
	ld e, c
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$46
	add hl, de
	ld [hl], a
	inc c
	jp Func_12467

Func_1247f: ; 1247f (4:647f)
	xor a
	ld hl, sp+$9
	ld [hl], $6
	ld hl, sp+$8
	xor a
	ld [hl], a
	ld hl, sp+$7
	ld [hl], a
	ld c, $0
	ld hl, sp+$4c
	ld [hl], c
	ld hl, sp+$6
	ld [hl], c
	ld hl, sp+$5
	ld [hl], c
	xor a
	ld hl, sp+$4d
	ld [hl], a
	ld hl, sp+$4f
	ld a, [hl]
	or a
	jp nz, Func_124a8
	ld hl, sp+$4
	ld [hl], $0
	jp Func_124c2

Func_124a8: ; 124a8 (4:64a8)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_124be
	ld hl, sp+$4
	ld [hl], $0
	jp Func_124c2

Func_124be: ; 124be (4:64be)
	ld hl, sp+$4
	ld [hl], $1
Func_124c2: ; 124c2 (4:64c2)
	ld hl, sp+$3
	xor a
	ld [hl], a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$1
	xor a
	ld [hl], a
	ld hl, sp+$0
	ld [hl], a
Func_124d0: ; 124d0 (4:64d0)
	push bc
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_12573
	call Func_24e9
	ld l, a
	ld h, $0
	ld a, l
	and $1
	jp z, Func_124f6
	ld hl, sp+$9
	ld a, [hl]
	cp $5
	jp nc, Func_124f3
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
Func_124f3: ; 124f3 (4:64f3)
	jp Func_12570

Func_124f6: ; 124f6 (4:64f6)
	ld a, l
	and $2
	jp z, Func_1250e
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp c, Func_1250b
	ld hl, sp+$9
	ld a, [hl]
	dec a
	ld hl, sp+$9
	ld [hl], a
Func_1250b: ; 1250b (4:650b)
	jp Func_12570

Func_1250e: ; 1250e (4:650e)
	ld a, l
	and $4
	jp z, Func_12527
	ld hl, sp+$9
	ld a, [hl]
	cp $3
	jp c, Func_12524
	ld hl, sp+$9
	ld a, [hl]
	add $fd
	ld hl, sp+$9
	ld [hl], a
Func_12524: ; 12524 (4:6524)
	jp Func_12570

Func_12527: ; 12527 (4:6527)
	ld a, l
	and $8
	jp z, Func_12540
	ld hl, sp+$9
	ld a, [hl]
	cp $3
	jp nc, Func_1253d
	ld hl, sp+$9
	ld a, [hl]
	add $3
	ld hl, sp+$9
	ld [hl], a
Func_1253d: ; 1253d (4:653d)
	jp Func_12570

Func_12540: ; 12540 (4:6540)
	ld a, l
	and $10
	jp z, Func_12570
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp nz, Func_12554
	ld hl, sp+$4
	ld [hl], $1
	jp Func_12570

Func_12554: ; 12554 (4:6554)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_1256c
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$a
	cp [hl]
	jp z, Func_1256c
	ld hl, sp+$4
	ld [hl], $1
	jp Func_12570

Func_1256c: ; 1256c (4:656c)
	ld hl, sp+$4
	ld [hl], $0
Func_12570: ; 12570 (4:6570)
	jp Func_12576

Func_12573: ; 12573 (4:6573)
	call Func_0465
Func_12576: ; 12576 (4:6576)
	pop bc
	ld hl, sp+$4f
	ld a, [hl]
	or a
	jp nz, Func_125d4
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_125d4
	ld hl, sp+$4c
	ld a, [hl]
	cp $f
	jp nz, Func_125ca
	push bc
	call Func_1288c
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$4e
	ld [hl], $0
	pop bc
	inc c
	ld a, c
	cp $6
	jp nz, Func_125c7
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_125b8
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp z, Func_125b8
	ld hl, sp+$3
	ld [hl], $1
	jp Func_125c7

Func_125b8: ; 125b8 (4:65b8)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_125c6
	ld hl, sp+$3
	ld [hl], $1
	jp Func_125c7

Func_125c6: ; 125c6 (4:65c6)
	dec c
Func_125c7: ; 125c7 (4:65c7)
	jp Func_125d1

Func_125ca: ; 125ca (4:65ca)
	ld hl, sp+$4c
	ld a, [hl]
	inc a
	ld hl, sp+$4c
	ld [hl], a
Func_125d1: ; 125d1 (4:65d1)
	jp Func_1265a

Func_125d4: ; 125d4 (4:65d4)
	ld hl, sp+$4f
	ld a, [hl]
	cp $1
	jp nz, Func_1265a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_12620
	push bc
	ld c, $1
	ld hl, sp+$9
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	pop bc
	jp Func_1265a

Func_12620: ; 12620 (4:6620)
	push bc
	ld c, $1
	ld hl, sp+$a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$9
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	pop bc
Func_1265a: ; 1265a (4:665a)
	push bc
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$7
	cp [hl]
	jp nz, Func_1266d
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp z, Func_1268a
Func_1266d: ; 1266d (4:666d)
	ld hl, sp+$8
	ld l, [hl]
	push hl
	ld hl, sp+$c
	ld c, [hl]
	ld hl, sp+$9
	ld e, [hl]
	ld hl, sp+$b
	ld a, [hl]
	call Func_12acb
	pop bc
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
Func_1268a: ; 1268a (4:668a)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_126b9
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp z, Func_126b9
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_126b9
	ld e, $0
	ld hl, sp+$9
	ld a, [hl]
	call Func_128fd
	ld hl, sp+$2
	ld [hl], $1
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
Func_126b9: ; 126b9 (4:66b9)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_126e8
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp z, Func_126e8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_126e8
	ld e, $1
	ld hl, sp+$a
	ld a, [hl]
	call Func_128fd
	ld hl, sp+$3
	ld [hl], $1
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
Func_126e8: ; 126e8 (4:66e8)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_12815
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp nz, Func_12815
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_12743
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_12743
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp nz, Func_12743
	push bc
	ld hl, sp+$6
	ld a, [hl]
	or a
	jp nz, Func_1272d
	ld hl, sp+$5
	ld [hl], $0
	ld c, $1
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_1051a
	jp Func_1273f

Func_1272d: ; 1272d (4:672d)
	ld hl, sp+$4
	ld [hl], $0
	ld c, $1
	ld hl, sp+$5
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_10506
Func_1273f: ; 1273f (4:673f)
	pop bc
	jp Func_12815

Func_12743: ; 12743 (4:6743)
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld d, h
	push de
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld l, [hl]
	ld h, a
	pop de
	call Func_12982
	xor a
Func_12763: ; 12763 (4:6763)
	cp $3c
	jp nc, Func_12771
	push af
	call Func_0465
	pop af
	inc a
	jp Func_12763

Func_12771: ; 12771 (4:6771)
	ld hl, sp+$1
	xor a
	ld [hl], a
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$4c
	ld [hl], $0
	ld c, [hl]
	push bc
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld e, [hl]
	call Func_12db3
	ld e, a
	pop bc
	ld a, e
	cp $ff
	jp nz, Func_127de
	push bc
	callba_hli Func_17a44
	ld hl, sp+$51
	ld a, [hl]
	cp $1
	jp nz, Func_127be
	call Func_1052e
Func_127be: ; 127be (4:67be)
	ld hl, sp+$4f
	ld l, [hl]
	push hl
	ld hl, sp+$d
	ld l, [hl]
	push hl
	ld hl, sp+$10
	ld c, l
	ld b, h
	ld hl, sp+$4c
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	call Func_12ca4
	pop bc
	pop bc
	ld hl, sp+$b
	ld [hl], a
	pop bc
	jp Func_12815

Func_127de: ; 127de (4:67de)
	ld hl, sp+$4f
	ld a, [hl]
	cp $1
	jp z, Func_127fe
	push de
	inc e
	dec e
	jp nz, Func_127fa
	callba_hli Func_222b7
Func_127fa: ; 127fa (4:67fa)
	pop de
	jp Func_12812

Func_127fe: ; 127fe (4:67fe)
	push de
	call Func_3aa8
	pop de
	push de
	ld a, e
	ld de, $0
	ld bc, $201
	call Func_107d7
	call Func_1052e
	pop de
Func_12812: ; 12812 (4:6812)
	jp Func_12818

Func_12815: ; 12815 (4:6815)
	jp Func_124d0

Func_12818: ; 12818 (4:6818)
	push de
	call Func_3aa8
	pop de
	ld a, e
	add sp, $50
	ret

Func_12821:
	push hl
	push de
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $f
	jp nz, Func_12881
	call Func_1288c
	pop hl
	push hl
	inc hl
	ld [hl], a
	call GetHLAtSPPlus8
	ld [hl], $0
	call GetHLAtSPPlus10
	ld a, $1
	add [hl]
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	cp $a
	jp nz, Func_12855
	call GetHLAtSPPlus4
	ld a, [hl]
	or a
	jp nz, Func_12855
	ld a, $1
	jp Func_12889

Func_12855: ; 12855 (4:6855)
	call GetHLAtSPPlus10
	ld a, [hl]
	cp $a
	jp nz, Func_1287e
	call GetHLAtSPPlus4
	ld a, [hl]
	cp $1
	jp nz, Func_1287e
	pop hl
	push hl
	ld a, [hl]
	pop hl
	push hl
	inc hl
	cp [hl]
	jp nz, Func_12879
	call GetHLAtSPPlus10
	ld [hl], $9
	jp Func_1287e

Func_12879: ; 12879 (4:6879)
	ld a, $2
	jp Func_12889

Func_1287e: ; 1287e (4:687e)
	jp Func_12888

Func_12881: ; 12881 (4:6881)
	call GetHLAtSPPlus8
	ld a, $1
	add [hl]
	ld [hl], a
Func_12888: ; 12888 (4:6888)
	xor a
Func_12889: ; 12889 (4:6889)
	pop bc
	pop bc
	ret

Func_1288c: ; 1288c (4:688c)
	ld a, $6
	call Func_10001
	ret

Func_12892: ; 12892 (4:6892)
	push hl
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
Func_12899: ; 12899 (4:6899)
	ld hl, sp+$2
	ld a, [hl]
	cp $3c
	jp nc, Func_128f9
	ld a, $3c
	call Func_10001
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$1
	ld [hl], $0
Func_128b1: ; 128b1 (4:68b1)
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_128db
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_128d1
	ld hl, sp+$3
	ld [hl], $ff
	jp Func_128db

Func_128d1: ; 128d1 (4:68d1)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_128b1

Func_128db: ; 128db (4:68db)
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_128f6
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_128f6: ; 128f6 (4:68f6)
	jp Func_12899

Func_128f9: ; 128f9 (4:68f9)
	pop bc
	pop bc
	pop bc
	ret

Func_128fd: ; 128fd (4:68fd)
	push bc
	push de
	push bc
	push af
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	ld hl, sp+$6
	ld [hl], a
	pop af
	pop bc
	cp $5
	jp z, Func_12938
	cp $2
	jp z, Func_12938
	cp $4
	jp z, Func_12933
	cp $1
	jp z, Func_12933
	cp $3
	jp z, Func_1292e
	or a
	jp nz, Func_1293a
Func_1292e: ; 1292e (4:692e)
	ld c, $1
	jp Func_1293a

Func_12933: ; 12933 (4:6933)
	ld c, $8
	jp Func_1293a

Func_12938: ; 12938 (4:6938)
	ld c, $f
Func_1293a: ; 1293a (4:693a)
	push bc
	ld l, $6
	push hl
	ld a, c
	ld hl, sp+$6
	ld e, [hl]
	ld c, $5
	call Func_10215
	pop bc
	pop bc
	pop de
	inc e
	dec e
	jp nz, Func_1295f
	ld hl, sp+$0
	ld l, [hl]
	ld h, c
	inc hl
	inc hl
	inc hl
	ld de, Data_12974
	call PlaceStringDEatCoordHL
	jp Func_12972

Func_1295f: ; 1295f (4:695f)
	ld a, e
	cp $1
	jp nz, Func_12972
	ld hl, sp+$0
	ld l, [hl]
	ld h, c
	inc hl
	inc hl
	inc hl
	ld de, Data_1297c
	call PlaceStringDEatCoordHL
Func_12972: ; 12972 (4:6972)
	pop bc
	ret

Data_12974:
	db "<HIRA>しﾞふﾞん<KATA>", $00

Data_1297c:
	db "<HIRA>あいて<KATA>", $00

Func_12982: ; 12982 (4:6982)
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	call GetHLAtSPPlusParam8
	db $0c
	ld e, h
	ld hl, sp+$7
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $0c
	ld e, l
	ld hl, sp+$8
	ld [hl], e
	pop de
	ld hl, sp+$0
	ld [hl], d
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$7
	ld [hl], $0
Func_129a3: ; 129a3 (4:69a3)
	ld hl, sp+$7
	ld a, [hl]
	cp $2
	jp nc, Func_129f7
	ld hl, sp+$2
	ld [hl], $0
	ld c, $0
Func_129b1: ; 129b1 (4:69b1)
	ld a, c
	cp $1b
	jp nc, Func_129ed
	ld hl, sp+$2
	ld a, [hl]
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	add hl, de
	cp [hl]
	jp c, Func_129e9
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], c
	jp Func_129ed

Func_129e9: ; 129e9 (4:69e9)
	inc c
	jp Func_129b1

Func_129ed: ; 129ed (4:69ed)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_129a3

Func_129f7: ; 129f7 (4:69f7)
	ld c, $0
Func_129f9: ; 129f9 (4:69f9)
	ld a, c
	cp $2
	jp nc, Func_12ab0
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld e, $2
	call Func_128fd
	pop bc
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	cp $5
	jp z, Func_12a6f
	cp $2
	jp z, Func_12a6f
	cp $4
	jp z, Func_12a50
	cp $1
	jp z, Func_12a50
	cp $3
	jp z, Func_12a31
	or a
	jp nz, Func_12a8b
Func_12a31: ; 12a31 (4:6a31)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	pop bc
	jp Func_12a8b

Func_12a50: ; 12a50 (4:6a50)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $8
	call SetStringStartState
	pop bc
	jp Func_12a8b

Func_12a6f: ; 12a6f (4:6a6f)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $f
	call SetStringStartState
	pop bc
Func_12a8b: ; 12a8b (4:6a8b)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_12ac2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	inc c
	jp Func_129f9

Func_12ab0: ; 12ab0 (4:6ab0)
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_12ac2:
	TX_CALL
	db $00

Data_12ac5:
	dr $12ac5, $12acb

Func_12acb: ; 12acb (4:6acb)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_12ac5
	ld bc, $6
	call MemCopy
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	ld l, a
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8f
	ld [hl], a
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	add $2
	ld l, a
	push hl
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8f
	ld [hl], a
	ld hl, sp+$b
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	ld l, a
	push hl
	ld hl, sp+$d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	and $f
	add $2
	ld l, a
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	call ReadHalfWordAt
	dw $c261
	ld a, $8c
	ld [hl], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_12b93: ; 12b93 (4:6b93)
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_12ba6
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12bba
Func_12ba6: ; 12ba6 (4:6ba6)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_12bba: ; 12bba (4:6bba)
	call Func_1fbe
	ld e, $5
	xor a
	call SetStringStartState
	ld a, BANK(Func_17e95)
	ld [wFarCallDestBank], a
	ld hl, Func_17e95
	call WriteHalfWordTo
	dw wFarCallDestAddr
	ld c, $6
	ld e, $5
	ld hl, $100
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $800
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $f00
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $107
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $807
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $f07
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $e602
	ld de, $404
	ld hl, $201
	call FarCall
	ld bc, $e602
	ld de, $b04
	ld hl, $901
	call FarCall
	ld bc, $e602
	ld de, $1204
	ld hl, $1001
	call FarCall
	ld bc, $e602
	ld de, $40b
	ld hl, $208
	call FarCall
	ld bc, $e602
	ld de, $b0b
	ld hl, $908
	call FarCall
	ld bc, $e602
	ld de, $120b
	ld hl, $1008
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, Data_12c88
	push hl
	call PlaceString
	pop bc
	ld e, $10
	ld a, $1
	call SetStringStartState
	ld hl, Data_12c96
	push hl
	call PlaceString
	pop bc
	ret

Data_12c88:
	db "カートﾞ<HIRA>を えらんてﾞ<KATA>", $00

Data_12c96:
	db "Aホﾞタン<HIRA>を おしてね<KATA>", $00

Func_12ca4: ; 12ca4 (4:6ca4)
	push hl
	push de
	push bc
	push bc
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_12cbb
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12ccf
Func_12cbb: ; 12cbb (4:6cbb)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_12ccf: ; 12ccf (4:6ccf)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_12b93
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_12cff
	call GetHLAtSPPlus8
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus10
	ld a, [hl]
	call GetHLAtSPPlus10
	ld e, [hl]
	call Func_12acb
	pop bc
	jp Func_12d16

Func_12cff: ; 12cff (4:6cff)
	call GetHLAtSPPlus8
	ld l, [hl]
	push hl
	call GetHLAtSPPlus10
	ld c, [hl]
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	ld e, [hl]
	call Func_12acb
	pop bc
Func_12d16: ; 12d16 (4:6d16)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_12d40
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wOAM26VTile], a
Func_12d40: ; 12d40 (4:6d40)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, sp+$2
	ld [hl], $0
	pop bc
Func_12d51: ; 12d51 (4:6d51)
	ld hl, sp+$0
	ld a, [hl]
	cp $6
	jp nc, Func_12d9e
	push bc
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	cp [hl]
	jp z, Func_12d6f
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	inc hl
	cp [hl]
	jp nz, Func_12d93
Func_12d6f: ; 12d6f (4:6d6f)
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	cp $3c
	jp nz, Func_12d93
	ld hl, sp+$a
	ld [hl], $0
Func_12d93: ; 12d93 (4:6d93)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
	jp Func_12d51

Func_12d9e: ; 12d9e (4:6d9e)
	ld hl, sp+$8
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	ret

Data_12da5:
	dr $12da5, $12db3

Func_12db3: ; 12db3 (4:6db3)
	add sp, -$e
	push bc
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$d
	ld [hl], e
	ld hl, sp+$a
	ld [hl], $0
Func_12dc0: ; 12dc0 (4:6dc0)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nc, Func_12e14
	ld hl, sp+$b
	ld [hl], $0
	ld c, $0
Func_12dce: ; 12dce (4:6dce)
	ld a, c
	cp $1b
	jp nc, Func_12e0a
	ld hl, sp+$b
	ld a, [hl]
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$b
	ld [hl], a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	add hl, de
	cp [hl]
	jp c, Func_12e06
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$e
	add hl, de
	ld [hl], c
	jp Func_12e0a

Func_12e06: ; 12e06 (4:6e06)
	inc c
	jp Func_12dce

Func_12e0a: ; 12e0a (4:6e0a)
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	jp Func_12dc0

Func_12e14: ; 12e14 (4:6e14)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_3aa8
	call Func_2009
	ld a, [wSystemType]
	cp $11
	jp nz, Func_12e48
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
Func_12e48: ; 12e48 (4:6e48)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	callba_hli Func_d767
	ld a, [wSystemType]
	cp $1
	jp z, Func_12ebc
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12ec5
Func_12ebc: ; 12ebc (4:6ebc)
	ld de, $e
	ld hl, Data_12da5
	call Func_2b7d
Func_12ec5: ; 12ec5 (4:6ec5)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	call ReadHalfWordAt
	dw wc2e6
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $b05
	call FarCall
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $a
	ld hl, $d
	call FarCall
	ld c, $5
	ld e, $a
	ld hl, $a0d
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_13074
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $e
	ld a, $b
	call SetStringStartState
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_13077
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	push bc
	ld l, c
	push hl
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld hl, sp+$11
	ld e, [hl]
	ld hl, sp+$10
	ld a, [hl]
	call Func_1307a
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	ld hl, sp+$d
	ld e, [hl]
	ld hl, sp+$c
	ld a, [hl]
	call Func_13668
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld c, $0
Func_12fb0: ; 12fb0 (4:6fb0)
	ld a, c
	cp $2
	jp nc, Func_1302f
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_12ff1
	push bc
	set_farcall_addrs_hli Func_616dd
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, c
	call FarCall
	pop bc
	jp Func_1302b

Func_12ff1: ; 12ff1 (4:6ff1)
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, Func_1302b
	push bc
	set_farcall_addrs_hli Func_61a3e
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	add hl, de
	ld a, [hl]
	cpl
	ld e, a
	inc hl
	ld a, [hl]
	cpl
	ld d, a
	inc de
	ld a, c
	call FarCall
	pop bc
Func_1302b: ; 1302b (4:702b)
	inc c
	jp Func_12fb0

Func_1302f: ; 1302f (4:702f)
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1304d
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1304d
	ld a, $2
	jp Func_13071

Func_1304d: ; 1304d (4:704d)
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1305f
	ld a, $1
	jp Func_13071

Func_1305f: ; 1305f (4:705f)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1306f
	xor a
	jp Func_13071

Func_1306f: ; 1306f (4:706f)
	ld a, $ff
Func_13071: ; 13071 (4:7071)
	add sp, $e
	ret

Data_13074:
	TX_CALL
	db $00

Data_13077:
	TX_CALL
	db $00

Func_1307a: ; 1307a (4:707a)
	push af
	push de
	push bc
	add sp, -$4c
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $42
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlusParam8
	db $40
	call GetHLAtSPPlusParam8
	db $42
	ld de, $13
	add hl, de
	ld e, [hl]
	ld hl, sp+$49
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $40
	ld de, $13
	add hl, de
	ld e, [hl]
	ld hl, sp+$4a
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $42
	ld de, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $3c
	call GetHLAtSPPlusParam8
	db $40
	ld de, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $3e
	call GetHLAtSPPlusParam8
	db $42
	ld de, $25
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $38
	call GetHLAtSPPlusParam8
	db $40
	ld de, $25
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $3a
	call GetHLAtSPPlusParam8
	db $42
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$34
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $40
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$35
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $42
	ld de, $2e
	add hl, de
	ld e, [hl]
	ld hl, sp+$47
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $40
	ld de, $2e
	add hl, de
	ld e, [hl]
	ld hl, sp+$48
	ld [hl], e
	ld hl, sp+$46
	ld [hl], $0
Func_13130: ; 13130 (4:7130)
	ld hl, sp+$46
	ld a, [hl]
	cp $2
	jp nc, Func_131cd
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_131c3
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$48
	ld l, [hl]
	ld h, $0
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
	ld hl, sp+$6
	add hl, de
	pop de
	call Func_241f
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
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
	ld hl, sp+$4
	add hl, de
	ld de, $10
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3a
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
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
	ld hl, sp+$4
	add hl, de
	ld de, $11
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$36
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_131c3: ; 131c3 (4:71c3)
	ld hl, sp+$46
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	jp Func_13130

Func_131cd: ; 131cd (4:71cd)
	ld hl, sp+$46
	ld [hl], $0
Func_131d1: ; 131d1 (4:71d1)
	ld hl, sp+$46
	ld a, [hl]
	cp $2
	jp nc, Func_13282
	set_farcall_addrs_hli Func_e39a
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$47
	add hl, de
	ld a, [hl]
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$36
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$36
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_1322e
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$36
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_1322e: ; 1322e (4:722e)
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$47
	add hl, de
	ld a, [hl]
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_13278
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3a
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_13278: ; 13278 (4:7278)
	ld hl, sp+$46
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	jp Func_131d1

Func_13282: ; 13282 (4:7282)
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$42
	ld [hl], a
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$43
	ld [hl], a
	ld hl, sp+$42
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $3e
	add hl, bc
	call WriteHLToSPPlusParam8
	db $3e
	ld hl, sp+$43
	ld e, [hl]
	ld d, $0
	ld hl, sp+$49
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $3c
	add hl, bc
	call WriteHLToSPPlusParam8
	db $3c
	call GetHLAtSPPlusParam8
	db $38
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $3e
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call GetHLAtSPPlusParam8
	db $4e
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $3a
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $3c
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	xor a
Func_13319: ; 13319 (4:7319)
	cp $2
	jp nc, Func_1334b
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_13347
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
.asm_13347
	inc a
	jp Func_13319

Func_1334b: ; 1334b (4:734b)
	set_farcall_addrs_hli Func_e28f
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $44
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call FarCall
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	call Func_1a1f
	ld hl, sp+$1
	ld c, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld b, h
	call GetHLAtSPPlusParam8
	db $4e
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_133b0
	call GetHLAtSPPlusParam8
	db $4e
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_133b0: ; 133b0 (4:73b0)
	call GetHLAtSPPlusParam8
	db $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_133ee
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $50
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_133ee: ; 133ee (4:73ee)
	set_farcall_addrs_hli Func_e28f
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $42
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call FarCall
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	call Func_1a1f
	ld hl, sp+$1
	ld c, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld b, h
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_13459
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_13459: ; 13459 (4:7459)
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_1349b
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $50
	inc hl
	inc hl
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_1349b: ; 1349b (4:749b)
	ld c, $0
Func_1349d: ; 1349d (4:749d)
	ld a, c
	cp $2
	jp nc, Func_134d3
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_134cf
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $3e7
	ld [hl], e
	inc hl
	ld [hl], d
Func_134cf: ; 134cf (4:74cf)
	inc c
	jp Func_1349d

Func_134d3: ; 134d3 (4:74d3)
	ld hl, sp+$51
	ld a, [hl]
	ld hl, sp+$44
	ld [hl], a
	ld hl, sp+$4e
	ld a, [hl]
	ld hl, sp+$45
	ld [hl], a
	ld c, $0
Func_134e1: ; 134e1 (4:74e1)
	ld a, c
	cp $2
	jp nc, Func_13576
	ld e, c
	ld d, $0
	ld hl, sp+$44
	add hl, de
	ld a, [hl]
	cp $17
	jp z, Func_1355f
	cp $1a
	jp z, Func_13549
	cp $19
	jp z, Func_13533
	cp $18
	jp z, Func_1351d
	cp $16
	jp nz, Func_13572
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_1351d: ; 1351d (4:751d)
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $64
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_13533: ; 13533 (4:7533)
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $c8
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_13549: ; 13549 (4:7549)
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, hFFC9 + 5
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_1355f: ; 1355f (4:755f)
	call GetHLAtSPPlusParam8
	db $4e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_13572: ; 13572 (4:7572)
	inc c
	jp Func_134e1

Func_13576: ; 13576 (4:7576)
	ld c, $0
Func_13578: ; 13578 (4:7578)
	ld a, c
	cp $2
	jp nc, Func_135ce
	ld e, c
	ld d, $0
	ld hl, sp+$44
	add hl, de
	ld a, [hl]
	cp $17
	jp nz, Func_135ca
	push bc
	inc c
	dec c
	jp nz, Func_135af
	call GetHLAtSPPlusParam8
	db $50
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $50
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $50
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_135c9

Func_135af: ; 135af (4:75af)
	call GetHLAtSPPlusParam8
	db $50
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $50
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $50
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_135c9: ; 135c9 (4:75c9)
	pop bc
Func_135ca: ; 135ca (4:75ca)
	inc c
	jp Func_13578

Func_135ce: ; 135ce (4:75ce)
	ld e, $10
	ld a, $1
	call SetStringStartState
	call GetHLAtSPPlusParam8
	db $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_135ed
	ld hl, Data_13640
	push hl
	call PlaceString
	pop bc
	jp Func_135fe

.asm_135ed
	call GetHLAtSPPlusParam8
	db $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_1364a
.asm_135f8
	push hl
	call PlaceString
	pop bc
	pop bc
Func_135fe: ; 135fe (4:75fe)
	ld e, $10
	ld a, $b
	call SetStringStartState
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld e, [hl]
.asm_1360c
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_1361f
	ld hl, Data_13654
	push hl
	call PlaceString
	pop bc
	jp Func_13632

.asm_1361f
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_1365e
	push hl
	call PlaceString
	pop bc
	pop bc
Func_13632: ; 13632 (4:7632)
	ld hl, $0
	push de
	push hl
	pop de
	pop hl
	add sp, $52
	push de
	push hl
	pop de
	pop hl
	ret

Data_13640:
	db "<HIRA>かいふく<KATA> 50", $00

Data_1364a:
	db "タﾞメーシﾞ "
	TX_SNUM
	db $00

Data_13654:
	db "<HIRA>かいふく<KATA> 50", $00

Data_1365e:
	db "タﾞメーシﾞ "
	TX_SNUM
	db $00

Func_13668: ; 13668 (4:7668)
	inc c
	dec c
	jp nz, .asm_13691
	push af
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $0
	pop de
	ld a, e
	call Func_136cc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $1
	pop af
	call Func_136cc
	jp Func_136b0

.asm_13691
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $1
	call Func_136cc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], $0
	pop de
	ld a, e
	call Func_136cc
Func_136b0: ; 136b0 (4:76b0)
	ret

Data_136b1:
	dr $136b1, $136cc

Func_136cc: ; 136cc (4:76cc)
	push af
	add sp, -$1c
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_136b1
	ld bc, $1b
	call MemCopy
	ld hl, sp+$1d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_13726
	set_farcall_addrs_hli Func_dcaf
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	ld hl, sp+$1d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	call FarCall
	set_farcall_addrs_hli Func_dd0a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld a, [hl]
	ld e, $0
	call FarCall
Func_13726: ; 13726 (4:7726)
	add sp, $1e
	ret

SECTION "Bank 05", ROMX, BANK [$05]
Func_14000:
	ret

Func_14001:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ret

Func_1400e:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ret

Func_1401b:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ret

Func_14028: ; 14028 (5:4028)
	push hl
	add sp, -$32
	ld hl, sp+$32
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	push de
	ld hl, sp+$19
	call WriteHLToSPPlusParam8
	db $0b
	call GetHLAtSPPlusParam8
	db $3c
	ld l, h
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
	call GetHLAtSPPlusParam8
	db $3c
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0d
	call GetHLAtSPPlusParam8
	db $3e
	ld l, h
	ld h, $0
	call WriteHLToSPPlusParam8
	db $15
	call GetHLAtSPPlusParam8
	db $3e
	ld h, $0
	call WriteHLToSPPlusParam8
	db $13
	call GetHLAtSPPlusParam8
	db $40
	ld l, h
	ld h, $0
	call WriteHLToSPPlusParam8
	db $11
	pop hl
	call WriteHLToSPPlusParam8
	db $17
	ld l, c
	ld h, b
	call WriteHLToSPPlusParam8
	db $15
	call GetHLAtSPPlusParam8
	db $3e
	ld c, l
	call GetHLAtSPPlusParam8
	db $13
	ld a, l
	inc a
	or h
	jp nz, Func_1408f
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $13
Func_1408f: ; 1408f (5:408f)
	call GetHLAtSPPlusParam8
	db $0b
	ld a, l
	inc a
	or h
	jp nz, Func_140a0
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $0b
Func_140a0: ; 140a0 (5:40a0)
	call GetHLAtSPPlusParam8
	db $0d
	ld a, l
	inc a
	or h
	jp nz, Func_140b1
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $0d
Func_140b1: ; 140b1 (5:40b1)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$3e
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld hl, sp+$6
	ld [hl], a
	pop hl
	push bc
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$17
	ld bc, $1f
	call FarCopyVideoData
	pop bc
	ld a, c
	cp $3
	jp c, Func_1436d
	push bc
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$3e
	ld [hl], a
	pop bc
	push bc
	ld a, c
	cp $1f
	jp z, Func_1435c
	cp $18
	jp z, Func_1433d
	cp $25
	jp z, Func_142f2
	cp $d
	jp z, Func_142f2
	cp $c
	jp z, Func_142be
	cp $b
	jp z, Func_1428a
	cp $8
	jp z, Func_14237
	cp $21
	jp z, Func_1422a
	cp $16
	jp z, Func_1422a
	cp $a
	jp z, Func_1422a
	cp $24
	jp z, Func_1422a
	cp $7
	jp z, Func_1422a
	cp $6
	jp z, Func_1422a
	cp $15
	jp z, Func_1421d
	cp $9
	jp z, Func_1421d
	cp $5
	jp z, Func_1421d
	cp $4
	jp z, Func_1421d
	cp $11
	jp z, Func_141e6
	cp $12
	jp z, Func_141d9
	cp $10
	jp z, Func_141d9
	cp $3
	jp z, Func_141d9
	cp $26
	jp z, Func_141b9
	cp $20
	jp z, Func_141b9
	cp $1d
	jp z, Func_141b9
	cp $17
	jp z, Func_141b9
	cp $23
	jp z, Func_14180
	cp $22
	jp z, Func_14180
	cp $1c
	jp z, Func_14180
	cp $14
	jp z, Func_14180
	cp $13
	jp nz, Func_14366
Func_14180: ; 14180 (5:4180)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0f
	ld hl, $0
Func_1418a: ; 1418a (5:418a)
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_141b6
	push hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_141b1
	call GetHLAtSPPlusParam8
	db $11
	inc hl
	call WriteHLToSPPlusParam8
	db $11
Func_141b1: ; 141b1 (5:41b1)
	pop hl
	inc hl
	jp Func_1418a

Func_141b6: ; 141b6 (5:41b6)
	jp Func_14366

Func_141b9: ; 141b9 (5:41b9)
	ld de, $19
	ld a, $2
	call Func_16007
	callba_hli Func_7cd1
	ld l, a
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14366

Func_141d9: ; 141d9 (5:41d9)
	ld hl, $ca6c
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14366

Func_141e6: ; 141e6 (5:41e6)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0f
	ld bc, $0
Func_141f0: ; 141f0 (5:41f0)
	ld l, c
	ld h, b
	ld de, $50
	call CompareHLtoDE
	jp nc, Func_1421a
	ld l, c
	ld h, b
	add hl, hl
	ld de, $cb94
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_14213
	call GetHLAtSPPlusParam8
	db $0f
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14216

Func_14213: ; 14213 (5:4213)
	jp Func_1421a

Func_14216: ; 14216 (5:4216)
	inc bc
	jp Func_141f0

Func_1421a: ; 1421a (5:421a)
	jp Func_14366

Func_1421d: ; 1421d (5:421d)
	ld hl, $c9a2
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14366

Func_1422a: ; 1422a (5:422a)
	ld hl, $c9b7
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14366

Func_14237: ; 14237 (5:4237)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0f
	ld hl, $0
	call WriteHLToSPPlus6
Func_14244: ; 14244 (5:4244)
	call GetHLAtSPPlus6
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_14287
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_1427d
	call GetHLAtSPPlusParam8
	db $0f
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
Func_1427d: ; 1427d (5:427d)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_14244

Func_14287: ; 14287 (5:4287)
	jp Func_14366

Func_1428a: ; 1428a (5:428a)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0f
	ld bc, $0
Func_14294: ; 14294 (5:4294)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_142bb
	ld hl, $cd10
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142b4
	call GetHLAtSPPlusParam8
	db $0f
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_142b7

Func_142b4: ; 142b4 (5:42b4)
	jp Func_142bb

Func_142b7: ; 142b7 (5:42b7)
	inc bc
	jp Func_14294

Func_142bb: ; 142bb (5:42bb)
	jp Func_14366

Func_142be: ; 142be (5:42be)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0f
	ld bc, $0
Func_142c8: ; 142c8 (5:42c8)
	ld l, c
	ld h, b
	ld de, $dc
	call CompareHLtoDE
	jp nc, Func_142ef
	ld hl, $cc34
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142e8
	call GetHLAtSPPlusParam8
	db $0f
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_142eb

Func_142e8: ; 142e8 (5:42e8)
	jp Func_142ef

Func_142eb: ; 142eb (5:42eb)
	inc bc
	jp Func_142c8

Func_142ef: ; 142ef (5:42ef)
	jp Func_14366

Func_142f2: ; 142f2 (5:42f2)
	ld hl, sp+$3e
	ld a, [hl]
	call GetSRAMBank
	ld hl, $1
	call WriteHLToSPPlusParam8
	db $0f
	ld bc, $0
Func_14302: ; 14302 (5:4302)
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_1433a
	ld l, c
	ld h, b
	ld de, $7
	call CompareHLtoDE
	jp nc, Func_14336
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_14336
	call GetHLAtSPPlusParam8
	db $0f
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
Func_14336: ; 14336 (5:4336)
	inc bc
	jp Func_14302

Func_1433a: ; 1433a (5:433a)
	jp Func_14366

Func_1433d: ; 1433d (5:433d)
	ld a, [$c7df]
	or a
	jp nz, Func_14352
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	inc hl
	call WriteHLToSPPlusParam8
	db $0f
	jp Func_14359

Func_14352: ; 14352 (5:4352)
	ld hl, $7
	call WriteHLToSPPlusParam8
	db $0f
Func_14359: ; 14359 (5:4359)
	jp Func_14366

Func_1435c: ; 1435c (5:435c)
	ld hl, $c78c
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $0f
Func_14366: ; 14366 (5:4366)
	ld hl, sp+$3e
	ld a, [hl]
	call GetSRAMBank
	pop bc
Func_1436d: ; 1436d (5:436d)
	push bc
	ld a, c
	cp $24
	jp z, Func_143e3
	cp $22
	jp z, Func_143e3
	cp $21
	jp z, Func_143e3
	cp $1e
	jp z, Func_143e3
	cp $1b
	jp z, Func_143e3
	cp $14
	jp z, Func_143e3
	cp $13
	jp z, Func_143e3
	cp $d
	jp z, Func_143e3
	cp $5
	jp z, Func_143e3
	cp $26
	jp z, Func_143dd
	cp $20
	jp z, Func_143dd
	cp $1f
	jp z, Func_143dd
	cp $1d
	jp z, Func_143dd
	cp $11
	jp z, Func_143dd
	cp $10
	jp z, Func_143dd
	cp $e
	jp z, Func_143dd
	cp $8
	jp z, Func_143dd
	cp $7
	jp z, Func_143dd
	cp $6
	jp z, Func_143dd
	cp $4
	jp z, Func_143dd
	cp $3
	jp z, Func_143dd
	cp $2
	jp nz, Func_143e6
Func_143dd: ; 143dd (5:43dd)
	call Func_3af6
	jp Func_143e6

Func_143e3: ; 143e3 (5:43e3)
	call Func_3aa8
Func_143e6: ; 143e6 (5:43e6)
	pop bc
	push bc
	ld a, c
	cp $1
	jp nz, Func_143f6
Func_143ee: ; 143ee (5:43ee)
	ld hl, sp+$6
	call Func_174ab
	jp Func_143ee

Func_143f6: ; 143f6 (5:43f6)
	ld hl, sp+$6
	call Func_174ab
	pop bc
	push hl
	ld a, c
	cp $1a
	jp z, Func_1444f
	cp $1b
	jp z, Func_1444f
	cp $d
	jp z, Func_1444f
	cp $22
	jp z, Func_1444f
	cp $13
	jp z, Func_1444f
	cp $24
	jp z, Func_14449
	cp $1f
	jp z, Func_14449
	cp $14
	jp z, Func_14449
	cp $11
	jp z, Func_14449
	cp $10
	jp z, Func_14449
	cp $e
	jp z, Func_14449
	cp $8
	jp z, Func_14449
	cp $7
	jp z, Func_14449
	cp $5
	jp z, Func_14449
	cp $4
	jp nz, Func_14452
Func_14449: ; 14449 (5:4449)
	call Func_3af6
	jp Func_14452

Func_1444f: ; 1444f (5:444f)
	call Func_3aa8
Func_14452: ; 14452 (5:4452)
	pop hl
	push de
	push hl
	pop de
	pop hl
	add sp, $34
	push de
	push hl
	pop de
	pop hl
	ret

Func_1445e:
	push hl
	add sp, -$10
	push bc
	ld a, c
	ld [wFarCallDestBank], a
	ld hl, sp+$2
	ld bc, $f
	call FarCopyVideoData
	pop bc
	ld l, c
	push hl
	ld hl, sp+$10
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $0c
	ld h, l
	ld l, $0
	add hl, bc
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $16
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $14
	push hl
	call GetHLAtSPPlusParam8
	db $1c
	pop de
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	push de
	push hl
	pop de
	pop hl
	add sp, $12
	push de
	push hl
	pop de
	pop hl
	ret

Func_144bd:
	ld l, $15
	push hl
	ld hl, $600
	push hl
	ld hl, $ff06
	push hl
	ld hl, $0
	push hl
	ld bc, $44f7
	ld de, $0
	ld hl, $4001
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_144dd: ; 144dd (5:44dd)
	ld l, $15
	push hl
	ld hl, $81e
	push hl
	ld hl, $ff08
	push hl
	ld hl, $0
	push hl
	ld bc, $4548
	ld de, $0
	ld hl, $4020
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_144fd: ; 144fd (5:44fd)
	push bc
	ld c, $1
	push bc
	ld hl, sp+$2
	ld [hl], $1
	call Func_17470
	call Func_204c
	pop bc
	ld a, [wc213]
	cp $ff
	jp nz, Func_1451a
	ld c, $0
	xor a
	ld [wc213], a
Func_1451a: ; 1451a (5:451a)
	push bc
	set_farcall_addrs_hli Func_79b3
	ld a, $1
	call FarCall
	push hl
	set_farcall_addrs_hli Func_7ae4
	ld a, $1
	call FarCall
	push de
	push hl
	pop de
	pop hl
	push de
	set_farcall_addrs_hli Func_7a2b
	pop de
	pop hl
	call CompareHLtoDE
	jp nz, Func_1455c
	call FarCall
	cp $ff
	jp nz, Func_14560
Func_1455c: ; 1455c (5:455c)
	ld hl, sp+$2
	ld [hl], $ff
Func_14560: ; 14560 (5:4560)
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_145ef
	ld a, [wSystemType]
	cp $1
	jp z, Func_14579
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_1458e
Func_14579: ; 14579 (5:4579)
	push bc
	set_farcall_addrs_hli Func_fbd5e
	pop bc
	ld e, c
	xor a
	call FarCall
	jp Func_145ec

Func_1458e: ; 1458e (5:458e)
	inc c
	dec c
	jp nz, Func_145b5
	ld l, $15
	push hl
	ld hl, $502
	push hl
	ld hl, $ff05
	push hl
	ld hl, $0
	push hl
	ld bc, $45a5
	ld de, $0
	ld hl, $403f
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_145ec

Func_145b5: ; 145b5 (5:45b5)
	ld l, $15
	push hl
	ld e, c
	ld d, $0
	ld hl, $5
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld h, l
	ld l, $0
	inc hl
	inc hl
	push hl
	ld e, c
	ld d, $0
	ld hl, $5
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec h
	push hl
	ld hl, $0
	push hl
	ld bc, $45a5
	ld de, $0
	ld hl, $405e
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
Func_145ec: ; 145ec (5:45ec)
	jp Func_14673

Func_145ef: ; 145ef (5:45ef)
	ld a, [wSystemType]
	cp $1
	jp z, Func_145ff
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_14615
Func_145ff: ; 145ff (5:45ff)
	push bc
	set_farcall_addrs_hli Func_fbd5e
	pop bc
	ld e, c
	ld a, $1
	call FarCall
	jp Func_14673

Func_14615: ; 14615 (5:4615)
	inc c
	dec c
	jp nz, Func_1463c
	ld l, $15
	push hl
	ld hl, $402
	push hl
	ld hl, $ff04
	push hl
	ld hl, $0
	push hl
	ld bc, $45e4
	ld de, $0
	ld hl, $407d
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14673

Func_1463c: ; 1463c (5:463c)
	ld l, $15
	push hl
	ld e, c
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld h, l
	ld l, $0
	inc hl
	inc hl
	push hl
	ld e, c
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec h
	push hl
	ld hl, $0
	push hl
	ld bc, $45e4
	ld de, $0
	ld hl, $409c
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
Func_14673: ; 14673 (5:4673)
	pop bc
	ret

Func_14675: ; 14675 (5:4675)
	call Func_3aa8
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	ld a, [wSystemType]
	cp $11
	jp nz, Func_146b5
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld bc, $800
	ld e, $0
	hlbgcoord 0, 0
	call FillMemory
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_146b5: ; 146b5 (5:46b5)
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	or $80
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld a, [wSystemType]
	cp $11
	jp nz, Func_14703
	set_farcall_addrs_hli Func_613fc
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_14717

Func_14703: ; 14703 (5:4703)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_14717: ; 14717 (5:4717)
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
Func_1472c: ; 1472c (5:472c)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_1472c
	call Func_17470
	ld l, $15
	push hl
	ld hl, $702
	push hl
	ld hl, rTAC
	push hl
	ld hl, $0
	push hl
	ld bc, $4614
	ld de, -1
	ld hl, $40da
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wOAM05Attrs]
	or a
	jp z, Func_14763
	xor a
	ld [wOAM05Attrs], a
Func_14763: ; 14763 (5:4763)
	call Func_17488
	ret

Data_14767:
	db  0
	db -1
	db  1
	db  2
	db  3
	db  4
	db  5
	db  6
	db  7
	db  8

Func_14771: ; 14771 (5:4771)
	push af
	xor a
	ld [wOAM26XCoord], a
	ld [wOAM26YCoord], a
	ld [wOAM25Attrs], a
	ld [wOAM25VTile], a
	pop af
	cp $1
	jp z, Func_147d4
	cp $9
	jp z, Func_147b1
	cp $8
	jp z, Func_147b1
	cp $7
	jp z, Func_147b1
	cp $6
	jp z, Func_147b1
	cp $5
	jp z, Func_147b1
	cp $4
	jp z, Func_147b1
	cp $3
	jp z, Func_147b1
	cp $2
	jp z, Func_147b1
	or a
	jp nz, Func_147e7
Func_147b1: ; 147b1 (5:47b1)
	push af
	set_farcall_addrs_hli Func_5e504
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_14767
	add hl, de
	ld e, [hl]
	ld d, $0
	ld a, $6
	call FarCall
	ld a, l
	ld [wOAM04YCoord], a
	jp Func_147e7

Func_147d4: ; 147d4 (5:47d4)
	set_farcall_addrs_hli Func_5e504
	ld de, $0
	ld a, $7
	call FarCall
Func_147e7: ; 147e7 (5:47e7)
	ret

Func_147e8:
	call Func_1fbe
	ld l, $15
	push hl
	ld hl, $17
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $11
	ld de, $0
	ld hl, $40f9
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_1480e:
	ld l, $15
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, $46af
	ld de, $0
	ld hl, $41b3
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1482e: ; 1482e (5:482e)
	ld l, $15
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, $46c1
	ld de, $0
	ld hl, $41d2
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1484e:
	ld l, $15
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, $46d0
	ld de, $0
	ld hl, $41f1
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1486e:
	ld l, $15
	push hl
	ld hl, $300
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $464c
	ld de, $0
	ld hl, $4118
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1488e:
	ld l, $15
	push hl
	ld hl, $3
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, $40bb
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_148ae:
	ld l, $15
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $4686
	ld de, $0
	ld hl, $4137
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_148ce:
	call Func_1fbe
	ld l, $15
	push hl
	ld hl, $6
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $2
	ld de, -1
	ld hl, $4156
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_148f4:
	call Func_1fbe
	ld l, $15
	push hl
	ld hl, $24
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $5
	ld de, -1
	ld hl, $4175
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_1491a:
	call Func_1fbe
	ld l, $15
	push hl
	ld hl, $7
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $2
	ld de, -1
	ld hl, $4194
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_14940:
	ld l, $15
	push hl
	ld hl, $402
	push hl
	ld hl, $ff04
	push hl
	ld hl, $0
	push hl
	ld bc, $46e0
	ld de, $0
	ld hl, $428c
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14960:
	ld l, $15
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $66c8
	ld de, $0
	ld hl, $66a9
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14980:
	ld l, $15
	push hl
	ld hl, $21
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, $43a2
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_149b2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_149c6
Func_149b2: ; 149b2 (5:49b2)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_149c6: ; 149c6 (5:49c6)
	callba_hli Func_e1e83
	ret

Func_149d5:
	push bc
	ld hl, sp+$0
	xor a
	ld [hl], a
	ld hl, sp+$1
	ld [hl], a
	xor a
Func_149de: ; 149de (5:49de)
	cp $a8
	jp nc, Func_14a07
	push af
	set_farcall_addrs_hli Func_53b1e
	pop af
	push af
	ld e, $0
	call FarCall
	cp $1
	jp nz, Func_14a02
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
Func_14a02: ; 14a02 (5:4a02)
	pop af
	inc a
	jp Func_149de

Func_14a07: ; 14a07 (5:4a07)
	xor a
Func_14a08: ; 14a08 (5:4a08)
	cp $a8
	jp nc, Func_14a31
	push af
	set_farcall_addrs_hli Func_53b1e
	pop af
	push af
	ld e, $1
	call FarCall
	cp $1
	jp nz, Func_14a2c
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_14a2c: ; 14a2c (5:4a2c)
	pop af
	inc a
	jp Func_14a08

Func_14a31: ; 14a31 (5:4a31)
	ld hl, sp+$1
	ld a, [hl]
	ld [wOAM27YCoord], a
	ld hl, sp+$0
	ld a, [hl]
	ld [wOAM27XCoord], a
	call Func_1fbe
	ld l, $15
	push hl
	ld hl, $961e
	push hl
	ld hl, $ff0b
	push hl
	ld hl, $0
	push hl
	ld bc, $6
	ld de, -1
	ld hl, $43c1
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	pop bc
	ret

Func_14a64:
	ld l, $15
	push hl
	ld hl, $1e
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, $43e0
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14a84:
	ld l, $15
	push hl
	ld hl, $9
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $7
	ld de, $0
	ld hl, $42ca
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14aa4:
	ld l, $15
	push hl
	ld hl, $10
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $d
	ld de, $0
	ld hl, $42ab
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14ac4:
	ld l, $15
	push hl
	ld hl, $a
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $9
	ld de, $0
	ld hl, $42e9
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14ae4:
	ld l, $15
	push hl
	ld hl, $11
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $e
	ld de, $0
	ld hl, $4308
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14b04:
	ld l, $15
	push hl
	ld hl, $b
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $a
	ld de, $0
	ld hl, $4327
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14b24:
	ld l, $15
	push hl
	ld hl, $c
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $b
	ld de, $0
	ld hl, $4346
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14b44:
	ld a, $3
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, $c8
	call Func_17aba
	push de
	push hl
	pop de
	pop hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2124
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2152
	set_farcall_addrs_hli Func_da901
	ld de, $b05
	ld hl, $900
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_14bc4
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_14be6
Func_14bc4: ; 14bc4 (5:4bc4)
	ld l, $15
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, $46fd
	ld de, $0
	ld hl, $441e
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14c05

Func_14be6: ; 14be6 (5:4be6)
	ld l, $15
	push hl
	ld hl, Func_0300
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $46fd
	ld de, $0
	ld hl, $43ff
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
Func_14c05: ; 14c05 (5:4c05)
	call Func_14001
	pop hl
	pop bc
	pop de
	push hl
	push bc
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21ca
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21f8
	ld a, $2
	ld [wOAM26VTile], a
	call Func_1400e
	pop hl
	call Func_17c57
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	ret

Func_14c55:
	call Func_17470
	ld l, $15
	push hl
	ld hl, $151f
	push hl
	ld hl, $ff15
	push hl
	ld hl, $0
	push hl
	ld bc, $c
	ld de, -1
	ld hl, $443d
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_17488
	callba_hli Func_69436
	ret

Func_14c89:
	ld l, $15
	push hl
	ld hl, $61e
	push hl
	ld hl, $ff06
	push hl
	ld hl, $0
	push hl
	ld bc, $4727
	ld de, $0
	ld hl, $445c
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14ca9:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, $c8
	call Func_17aba
	push de
	push hl
	pop de
	pop hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2124
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2152
	ld l, $15
	push hl
	ld hl, $18
	push hl
	ld hl, $ff05
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, $0
	ld hl, $447b
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, $2
	ld [wOAM26VTile], a
	pop de
	push hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21ca
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21f8
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3ca1
	pop bc
	pop hl
	call Func_17c57
	pop hl
	ld a, l
	and h
	inc a
	jp nz, Func_14d48
	ld hl, $c7de
	ld l, [hl]
	ld h, $0
Func_14d48: ; 14d48 (5:4d48)
	ld a, l
	ret

Func_14d4a: ; 14d4a (5:4d4a)
	or a
	jp nz, Func_14d70
	ld l, $15
	push hl
	ld hl, $381b
	push hl
	ld hl, $ff38
	push hl
	ld hl, $0
	push hl
	ld bc, $13
	ld de, -1
	ld hl, $449a
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14d8f

Func_14d70: ; 14d70 (5:4d70)
	ld l, $15
	push hl
	ld hl, $381b
	push hl
	ld hl, $ff38
	push hl
	ld hl, $0
	push hl
	ld bc, $19
	ld de, -1
	ld hl, $449a
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
Func_14d8f: ; 14d8f (5:4d8f)
	call Func_2009
	ret

Func_14d93: ; 14d93 (5:4d93)
	ld l, $15
	push hl
	ld hl, $1b
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $14
	ld de, -1
	ld hl, $44b9
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	push hl
	call Func_2009
	pop hl
	ret

Func_14d98:
	push bc
	ld c, l
	ld b, h
	xor a
	ld [$c2f7], a
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld e, [hl]
	push de
	ld de, $19
	ld a, $3
	call Func_16007
	pop de
	push de
	push af
	ld a, e
	cp $33
	jp z, Func_14ecb
	or a
	jp z, Func_14ecb
	cp $d
	jp z, Func_14e68
	cp $e
	jp z, Func_14e0b
	cp $32
	jp nz, Func_14edb
	ld hl, sp+$4
	ld a, [wVideoTransferRequestBank + 9]
	ld [hl], a
	xor a
	ld [wVideoTransferRequestBank + 9], a
	jp Func_14edb

Func_14e0b: ; 14e0b (5:4e0b)
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $cb94
	add hl, de
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wVideoTransferRequestBank + 9], a
	ld bc, $0
Func_14e20: ; 14e20 (5:4e20)
	ld l, c
	ld h, b
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_14e65
	ld hl, $ca44
	add hl, bc
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $cb94
	add hl, de
	cp [hl]
	jp nz, Func_14e61
	ld hl, $ca58
	add hl, bc
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $cb94
	add hl, de
	inc hl
	add [hl]
	cp $64
	jp c, Func_14e61
	ld hl, $ca58
	add hl, bc
	ld a, $63
	sub [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wVideoTransferRequestBank + 9], a
Func_14e61: ; 14e61 (5:4e61)
	inc bc
	jp Func_14e20

Func_14e65: ; 14e65 (5:4e65)
	jp Func_14edb

Func_14e68: ; 14e68 (5:4e68)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $ca58
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wVideoTransferRequestBank + 9], a
	ld bc, $0
Func_14e7b: ; 14e7b (5:4e7b)
	ld l, c
	ld h, b
	ld de, $50
	call CompareHLtoDE
	jp nc, Func_14ec8
	ld l, c
	ld h, b
	add hl, hl
	ld de, $cb94
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $ca44
	add hl, de
	cp [hl]
	jp nz, Func_14ec4
	ld l, c
	ld h, b
	add hl, hl
	ld de, $cb94
	add hl, de
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $ca58
	add hl, de
	add [hl]
	cp $64
	jp c, Func_14ec4
	ld l, c
	ld h, b
	add hl, hl
	ld de, $cb94
	add hl, de
	inc hl
	ld a, $63
	sub [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wVideoTransferRequestBank + 9], a
Func_14ec4: ; 14ec4 (5:4ec4)
	inc bc
	jp Func_14e7b

Func_14ec8: ; 14ec8 (5:4ec8)
	jp Func_14edb

Func_14ecb: ; 14ecb (5:4ecb)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $ca58
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wVideoTransferRequestBank + 9], a
Func_14edb: ; 14edb (5:4edb)
	pop af
	call GetSRAMBank
	call Func_1fbe
	pop de
	ld l, $15
	push hl
	ld hl, $0
	push hl
	ld hl, $ff00
	push hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	push hl
	ld c, e
	ld b, $0
	ld de, $0
	ld hl, $44d8
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ld hl, $0
	pop bc
	ret

Func_14f0e:
	push bc
	push hl
	ld bc, $8000
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld hl, $64
	call Func_17aba
	push de
	push hl
	pop de
	pop hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2124
	pop de
	pop bc
	pop hl
	push de
	push bc
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld e, l
	push de
	call Func_1484e
	pop de
	pop bc
	ld a, l
	dec a
	or h
	jp z, Func_14fcb
	ld a, l
	or h
	jp nz, Func_14fde
	push de
	set_farcall_addrs_hli Func_4f800
	pop de
	ld a, e
	call FarCall
	ld a, $ff
	ld [wOAM26Attrs], a
	ld a, [$c2fa]
	or a
	jp nz, Func_14fc5
	ld a, [wOAM05Attrs]
	or a
	jp nz, Func_14fc5
	ld de, $19
	ld a, $3
	call Func_16007
	ld c, a
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld a, [$ca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	call GetSRAMBank
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld bc, $8000
	jp Func_14fc8

Func_14fc5: ; 14fc5 (5:4fc5)
	ld bc, -1
Func_14fc8: ; 14fc8 (5:4fc8)
	jp Func_14fde

Func_14fcb: ; 14fcb (5:4fcb)
	push bc
	set_farcall_addrs_hli Func_33db7
	call GetHLAtSPPlus6
	call FarCall
	pop bc
Func_14fde: ; 14fde (5:4fde)
	pop de
	push bc
	push de
	ld a, [$c2fa]
	or a
	jp nz, Func_14ffa
	ld a, [wOAM05Attrs]
	or a
	jp nz, Func_14ffa
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2323
Func_14ffa: ; 14ffa (5:4ffa)
	pop hl
	call Func_17c57
	pop hl
	pop bc
	ret

Func_15001: ; 15001 (5:5001)
	push bc
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld c, [hl]
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	push bc
	push af
	call Func_1503d
	ld a, $1
	ld [wOAM26VTile], a
	pop af
	pop bc
	ld l, a
	push hl
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call Func_3bc5
	pop bc
	ld hl, $4000
	pop bc
	ret

Func_1503d: ; 1503d (5:503d)
	push hl
	add sp, -$4a
	ld hl, sp+$4a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $4c
	call GetHLAtSPPlusParam8
	db $4c
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$49
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$48
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	push af
	push de
	push hl
	pop de
	pop hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlusParam8
	db $4e
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$47
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $4e
	ld de, $b
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $4e
	ld de, $9
	add hl, de
	ld e, [hl]
	ld hl, sp+$46
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $4e
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$45
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $4e
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $45
	pop af
	ld e, a
	ld hl, sp+$49
	ld a, [hl]
	ld hl, sp+$48
	ld l, [hl]
	ld h, a
	call Func_17e95
	call GetHLAtSPPlusParam8
	db $4c
	call Func_17863
	ld hl, sp+$45
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $4c
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$49
	ld a, [hl]
	add $2
	ld hl, sp+$47
	ld [hl], a
	ld hl, sp+$48
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $4c
	ld e, [hl]
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$43
	add [hl]
	ld hl, sp+$44
	cp [hl]
	jp nc, Func_1514f
	xor a
Func_150eb: ; 150eb (5:50eb)
	ld hl, sp+$44
	cp [hl]
	jp nc, Func_1514c
	push af
	push de
	ld hl, sp+$4a
	ld e, [hl]
	ld hl, sp+$4b
	ld a, [hl]
	call SetStringStartState
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	pop af
	push af
	push de
	call GetHLAtSPPlusParam8
	db $47
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld bc, $2
	call FarCopyVideoData
	pop de
	push de
	ld a, e
	ld [wFarCallDestBank], a
	ld bc, $3f
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	call FarCopyVideoData
	ld hl, sp+$6
	push hl
	ld hl, Data_151bc
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$4a
	ld a, [hl]
	add $2
	ld hl, sp+$4a
	ld [hl], a
	pop de
	pop af
	inc a
	jp Func_150eb

Func_1514c: ; 1514c (5:514c)
	jp Func_151b9

Func_1514f: ; 1514f (5:514f)
	ld hl, sp+$43
	ld c, [hl]
Func_15152: ; 15152 (5:5152)
	ld hl, sp+$43
	ld a, [hl]
	ld hl, sp+$44
	add [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_151b9
	push bc
	push de
	ld hl, sp+$4a
	ld e, [hl]
	ld hl, sp+$4b
	ld a, [hl]
	call SetStringStartState
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	pop bc
	push bc
	push de
	call GetHLAtSPPlusParam8
	db $47
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld bc, $2
	call FarCopyVideoData
	pop de
	push de
	ld a, e
	ld [wFarCallDestBank], a
	ld bc, $3f
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	call FarCopyVideoData
	ld hl, sp+$6
	push hl
	ld hl, Data_151bf
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$4a
	ld a, [hl]
	add $2
	ld hl, sp+$4a
	ld [hl], a
	pop de
	pop bc
	inc c
	jp Func_15152

Func_151b9: ; 151b9 (5:51b9)
	add sp, $4c
	ret

Data_151bc:
	TX_CALL
	db $00

Data_151bf:
	TX_CALL
	db $00

Func_151c2:
	push bc
	push bc
	push bc
	push de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_15220
	ld a, e
	or d
	jp nz, Func_15258
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_1521d
	ld hl, $0
	call WriteHLToSPPlus4
	pop hl
	push hl
	dec hl
	pop de
	push hl
	inc h
	dec h
	bit 7, h
	jr z, .asm_1521d
	ld hl, $0
	pop de
	push hl
.asm_1521d
	jp Func_15258

Func_15220: ; 15220 (5:5220)
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_15258
	ld l, c
	ld h, b
	dec hl
	call WriteHLToSPPlus4
	pop hl
	push hl
	inc hl
	pop de
	push hl
	pop hl
	push hl
	add hl, bc
	push hl
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp nc, Func_15258
	pop hl
	push hl
	dec hl
	pop de
	push hl
Func_15258: ; 15258 (5:5258)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	call Func_15001
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Func_15281:
	push hl
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	pop bc
	ret

Func_15297:
	push hl
	ld a, $3
	ld [wOAM26VTile], a
	call Func_14001
	call Func_1400e
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	ret

Func_152bd:
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_3aa8
	ld hl, -1
	ret

Func_152db:
	ld a, $ff
	ld [wVideoTransferRequestBank + 9], a
	ld hl, -1
	ret

Func_152e4:
	ld l, $15
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $4660
	ld de, $0
	ld hl, $4210
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_15304:
	call Func_1fbe
	call Func_1f30
	ld l, $15
	push hl
	ld hl, $4
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $1
	ld de, -1
	ld hl, $422f
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_15330:
	call Func_1fbe
	call Func_1f30
	ld l, $15
	push hl
	ld hl, $5
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $3
	ld de, -1
	ld hl, $424e
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_1535c:
	call Func_1fbe
	call Func_1f30
	ld l, $15
	push hl
	ld hl, $4
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $1
	ld de, -1
	ld hl, $426d
	call Func_14028
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_15388:
	push hl
	set_farcall_addrs_hli Func_61fb8
	pop hl
	call FarCall
	ret

Data_15399:
	dr $15399, $153c6

Data_153c6:
	dr $153c6, $1551f

	push bc
	push bc
	push hl
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	pop de
	push hl
	ld hl, $64
	call Func_17aba
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2124
	xor a
	ld de, $19
	ld a, $3
	call Func_16007
	ld c, a
	pop hl
	push hl
	ld de, $c98e
	add hl, de
	ld l, [hl]
	ld h, $0
	push de
	push hl
	pop de
	pop hl
	ld a, e
	and $3f
	ld l, a
	ld h, $0
	push de
	push hl
	pop de
	pop hl
	push de
	ld a, c
	call GetSRAMBank
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	call GetHLAtSPPlus4
	ld de, -1
	call Func_1564a
	ld c, a
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	xor a
	pop bc
	pop de
Func_155bb: ; 155bb (5:55bb)
	push de
	push bc
	call Func_17a44
	pop bc
	pop de
	cp $10
	jp nz, Func_15619
	ld a, c
	ld hl, Data_15399 - 1
	add hl, de
	cp [hl]
	jp nc, Func_155f9
	push de
	push bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	pop bc
	call GetHLAtSPPlus4
	ld e, c
	ld d, $0
	call Func_1564a
	ld c, a
	push bc
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3bc5
	pop bc
	pop bc
	pop de
	jp Func_15616

Func_155f9: ; 155f9 (5:55f9)
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21ca
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3bc5
	pop bc
	jp Func_1563e

Func_15616: ; 15616 (5:5616)
	jp Func_1563b

Func_15619: ; 15619 (5:5619)
	cp $20
	jp nz, Func_1563b
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21ca
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3bc5
	pop bc
	jp Func_1563e

Func_1563b: ; 1563b (5:563b)
	jp Func_155bb

Func_1563e: ; 1563e (5:563e)
	call GetHLAtSPPlus4
	call Func_17c57
	ld hl, $8000
	pop bc
	pop bc
	ret

Func_1564a: ; 1564a (5:564a)
	push hl
	push de
	add sp, -$16
	ld de, $19
	ld a, $3
	call Func_16007
	ld c, a
	call GetHLAtSPPlusParam8
	db $1a
	ld de, $c98e
	add hl, de
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlusParam8
	db $1a
	call GetHLAtSPPlusParam8
	db $1a
	ld a, l
	and $3f
	ld l, a
	ld h, $0
	call WriteHLToSPPlusParam8
	db $1a
	ld a, c
	call GetSRAMBank
	ld hl, sp+$15
	ld [hl], $1
	call GetHLAtSPPlusParam8
	db $18
	ld c, l
	ld b, h
	ld a, c
	and b
	inc a
	jp nz, Func_15703
	ld bc, -1
	call GetHLAtSPPlusParam8
	db $1a
	ld e, l
	ld hl, sp+$0
	call Func_157c5
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call Func_16019
	ld de, Data_157b6
	lb hl, -1, -1
	call PlaceStringDEatCoordHL
	ld bc, $0
	xor a
Func_156af: ; 156af (5:56af)
	cp $3
	jp nc, Func_156f9
	push af
	push bc
	call GetHLAtSPPlusParam8
	db $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call Func_3cf2
	push de
	push hl
	pop de
	pop hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, Func_156ec
	inc bc
	push bc
	ld hl, sp+$6
	ld c, l
	ld b, h
	ld de, $10
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	call Func_16019
	pop bc
Func_156ec: ; 156ec (5:56ec)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp Func_156af

Func_156f9: ; 156f9 (5:56f9)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $18
	jp Func_15780

Func_15703: ; 15703 (5:5703)
	ld hl, sp+$14
	ld [hl], $0
Func_15707: ; 15707 (5:5707)
	ld hl, sp+$14
	ld a, [hl]
	cp $2
	jp nc, Func_15780
	ld hl, sp+$15
	ld [hl], $1
	xor a
Func_15714: ; 15714 (5:5714)
	cp $3
	jp nc, Func_15769
	push af
	push bc
	call GetHLAtSPPlusParam8
	db $1e
	ld e, l
	ld hl, sp+$4
	call Func_157c5
	ld hl, sp+$4
	call Func_3cf2
	push de
	push hl
	pop de
	pop hl
	pop bc
	push de
	ld hl, sp+$19
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, $12
	call CompareHLtoDE
	jp nc, Func_1575c
	push bc
	ld hl, sp+$6
	ld c, l
	ld b, h
	ld hl, sp+$1a
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $e
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	call Func_16019
	pop bc
	inc bc
Func_1575c: ; 1575c (5:575c)
	pop de
	ld hl, sp+$17
	ld a, [hl]
	add e
	ld hl, sp+$17
	ld [hl], a
	pop af
	inc a
	jp Func_15714

Func_15769: ; 15769 (5:5769)
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp nz, Func_15776
	ld l, c
	ld h, b
	call WriteHLToSPPlusParam8
	db $18
Func_15776: ; 15776 (5:5776)
	ld hl, sp+$14
	ld a, [hl]
	inc a
	ld hl, sp+$14
.asm_1577b
	ld [hl], a
	jp Func_15707

Func_15780: ; 15780 (5:5780)
	call GetHLAtSPPlusParam8
	db $1a
	ld de, Data_15399 - 1
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_157aa
	ld e, $10
	ld a, $12
	call SetStringStartState
	ld hl, Data_157c3
	push hl
	call PlaceString
	pop bc
	call GetHLAtSPPlusParam8
	db $18
	ld a, l
	jp Func_157b3

Func_157aa: ; 157aa (5:57aa)
	call GetHLAtSPPlusParam8
	db $1a
	ld de, Data_15399 - 1
	add hl, de
	ld a, [hl]
Func_157b3: ; 157b3 (5:57b3)
	add sp, $1a
	ret

Data_157b6:
	db "<HIRA>てﾞ つかえるわさﾞ<KATA>", $00

Data_157c3:
	db "^", $00

Func_157c5: ; 157c5 (5:57c5)
	push hl
	push de
	push bc
	push bc
	ld hl, $0
	call WriteHLToSPPlus4
	ld a, c
	and b
	inc a
	jp nz, Func_157ea
	ld c, $5
	call GetHLAtSPPlus8
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	dec hl
	call Func_15ad6
	jp Func_15887

Func_157ea: ; 157ea (5:57ea)
	push bc
	ld e, $0
Func_157ed: ; 157ed (5:57ed)
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld l, a
	ld a, e
	cp l
	jp nc, Func_1580d
	push de
	ld d, $0
	ld hl, Data_15399
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	pop de
	inc e
	jp Func_157ed

Func_1580d: ; 1580d (5:580d)
	pop bc
	call GetHLAtSPPlus4
	add hl, bc
	ld de, Data_153c6
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, Data_15399 - 1
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_1587e
	pop hl
	push hl
	ld a, l
	or h
	jp nz, Func_1584b
	ld c, $5
	call GetHLAtSPPlus8
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	dec hl
	call Func_15ad6
	jp Func_1585a

Func_1584b: ; 1584b (5:584b)
	ld c, $9
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus4
	inc h
	dec hl
	pop de
	call Func_15ad6
Func_1585a: ; 1585a (5:585a)
	call GetHLAtSPPlus8
	call Func_3cf2
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld [hl], $7f
	inc hl
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
	jp Func_15887

Func_1587e: ; 1587e (5:587e)
	call GetHLAtSPPlus8
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus8
Func_15887: ; 15887 (5:5887)
	call GetHLAtSPPlus8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_1588f:
	sub l
	ld e, b
	xor [hl]
	ld e, b
	nop
	nop

Data_15895:
	db "フﾞート<HIRA>そﾞくは<KATA> ソフト<HIRA>の つけかえかﾞ<KATA>", $00

Data_158ae:
	db "<HIRA>てﾞきないよ<KATA>", $00

Func_158b7:
	add sp, -$76
	push af
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_1588f
	ld bc, $6
	call MemCopy
	ld de, $19
	ld a, $3
	call Func_16007
	ld l, a
	pop af
	push hl
	ld e, a
	ld d, $0
	ld hl, $c98e
	add hl, de
	ld a, [hl]
	and $3f
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, sp+$75
	ld [hl], e
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $9
	add hl, de
	ld e, [hl]
	ld hl, sp+$76
	ld [hl], e
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $a
	add hl, de
	ld e, [hl]
	ld hl, sp+$77
	ld [hl], e
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	pop hl
	push af
	push hl
	ld bc, $0
Func_15951: ; 15951 (5:5951)
	ld l, c
	ld h, b
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_1598d
	ld hl, sp+$77
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_15989
	push bc
	set_farcall_addrs_hli Func_5601b
	pop bc
	push bc
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3d
	add hl, de
	ld e, c
	ld c, $1
	call FarCall
	pop bc
Func_15989: ; 15989 (5:5989)
	inc bc
	jp Func_15951

Func_1598d: ; 1598d (5:598d)
	pop hl
	ld a, l
	call GetSRAMBank
	pop af
	ld e, a
	dec e
	ld hl, sp+$6
	call Func_236f
	ld hl, sp+$b
	ld a, [hl]
	push af
	call Func_15ff9
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $10d
	call Func_2230
	ld hl, Data_15aa2
	push hl
	call PlaceString
	pop bc
	ld de, Data_15aa4
	ld hl, $a01
	call PlaceStringDEatCoordHL
	ld de, Data_15aae
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld c, $7
	ld e, $a
	ld hl, $a02
	call Func_17e95
	ld c, $5
	ld e, $a
	ld hl, $a09
	call Func_17e95
	ld de, Data_15ab8
	ld hl, $c0a
	call PlaceStringDEatCoordHL
	ld de, Data_15ac3
	ld hl, $c0c
	call PlaceStringDEatCoordHL
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld hl, sp+$75
	ld a, [hl]
	or a
	jp nz, Func_15a0e
	ld de, Data_15ace
	ld hl, $c03
	call PlaceStringDEatCoordHL
	jp Func_15a64

Func_15a0e: ; 15a0e (5:5a0e)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $39
Func_15a15: ; 15a15 (5:5a15)
	call GetHLAtSPPlusParam8
	db $39
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_15a64
	call GetHLAtSPPlusParam8
	db $39
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$75
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_15a58
	call GetHLAtSPPlusParam8
	db $39
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$39
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $39
	add hl, hl
	inc hl
	inc hl
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $c
	call Func_16019
Func_15a58: ; 15a58 (5:5a58)
	call GetHLAtSPPlusParam8
	db $39
	inc hl
	call WriteHLToSPPlusParam8
	db $39
	jp Func_15a15

Func_15a64: ; 15a64 (5:5a64)
	pop af
	cp $b
	jp nz, Func_15a9e
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli Func_c868
	ld c, $5
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call FarCall
	ld a, $ff
	jp Func_15a9f

Func_15a9e: ; 15a9e (5:5a9e)
	xor a
Func_15a9f: ; 15a9f (5:5a9f)
	add sp, $76
	ret

Data_15aa2:
	db "M", $00

Data_15aa4:
	db "<HIRA>そうひﾞ<KATA>ソフト", $00

Data_15aae:
	db "<HIRA>もちもの<KATA>ソフト", $00

Data_15ab8:
	db "<HIRA>すへﾞてはすﾞす<KATA>", $00

Data_15ac3:
	db "<HIRA>つかえる わさﾞ<KATA>", $00

Data_15ace:
	db "ソフト<HIRA>なし<KATA>", $00

Func_15ad6: ; 15ad6 (5:5ad6)
	push hl
	push de
	add sp, -$6c
	push bc
	call GetHLAtSPPlusParam8
	db $72
	ld de, Init
	call DivideHLByDESigned
	ld c, l
	call GetHLAtSPPlusParam8
	db $72
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld a, BANK(Data_64093)
	ld [wFarCallDestBank], a
	ld a, c
	cp $7
	jp z, Func_15bae
	cp $6
	jp z, Func_15b9f
	cp $3
	jp z, Func_15b86
	cp $4
	jp z, Func_15b70
	cp $2
	jp z, Func_15b61
	cp $5
	jp z, Func_15b52
	cp $1
	jp z, Func_15b3b
	or a
	jp nz, Func_15bcb
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
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b3b: ; 15b3b (5:5b3b)
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_64c90
	add hl, de
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b52: ; 15b52 (5:5b52)
	ld e, l
	ld hl, sp+$54
	call Func_241f
	ld hl, sp+$5d
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b61: ; 15b61 (5:5b61)
	ld e, l
	ld hl, sp+$54
	call Func_241f
	ld hl, sp+$54
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b70: ; 15b70 (5:5b70)
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
	ld de, Func_157c5
	add hl, de
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b86: ; 15b86 (5:5b86)
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	inc hl
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15b9f: ; 15b9f (5:5b9f)
	ld e, l
	ld hl, sp+$25
	call Func_236f
	ld hl, sp+$32
	call WriteHLToSPPlusParam8
	db $6e
	jp Func_15bcb

Func_15bae: ; 15bae (5:5bae)
	push hl
	set_farcall_addrs_hli Func_7dfc
	pop hl
	ld a, l
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	call FarCall
	ld hl, sp+$3
	call WriteHLToSPPlusParam8
	db $6e
Func_15bcb: ; 15bcb (5:5bcb)
	pop bc
	ld b, $0
	call GetHLAtSPPlusParam8
	db $6c
	push hl
	call GetHLAtSPPlusParam8
	db $70
	pop de
	call FarCopyVideoData
	add sp, $70
	ret

Func_15bde:
	push bc
	push bc
	push bc
	push bc
	push hl
	ld l, $f
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop hl
	call WriteHLToSPPlus7
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_15c59
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld [wOAM04XCoord], a
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus7
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	call Func_16128
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld hl, $4000
	jp Func_15fe4

Func_15c59: ; 15c59 (5:5c59)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $14
	call CompareHLtoDE
	jp c, Func_15e9c
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_15e9c
	ld a, [wOAM04XCoord]
	cp $ff
	jp z, Func_15df5
	call Func_15ff9
	ld hl, sp+$2
	ld [hl], a
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$4
	ld [hl], a
	ld hl, wOAM04XCoord
	ld l, [hl]
	ld h, $0
	ld de, $c98e
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$1
	ld [hl], $0
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ffec
	add hl, de
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_15d0b
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ffec
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
Func_15d0b: ; 15d0b (5:5d0b)
	ld hl, sp+$3
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_15d27
	ld hl, sp+$1
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld c, a
	jp Func_15d29

Func_15d27: ; 15d27 (5:5d27)
	ld c, $0
Func_15d29: ; 15d29 (5:5d29)
	ld a, e
	add a
	ld d, a
	add a
	add a
	add d
	ld e, a
	ld a, c
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, sp+$2
	add [hl]
	cp e
	jp c, Func_15de5
	ld hl, sp+$3
	ld a, [hl]
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ffec
	add hl, de
	add hl, bc
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ec2b
	ld e, $1
	ld a, [wOAM04XCoord]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_15da0
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	jp Func_15db0

Func_15da0: ; 15da0 (5:5da0)
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_15db0: ; 15db0 (5:5db0)
	set_farcall_addrs_hli Func_fb2ed
	ld a, [wc2e8 + 1]
	call FarCall
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $ff
	ld [wOAM04XCoord], a
	ld hl, $8000
	jp Func_15fe4

Func_15de5: ; 15de5 (5:5de5)
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	xor a
	call Func_15fe9
	ld hl, $4000
	jp Func_15fe4

Func_15df5: ; 15df5 (5:5df5)
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$4
	ld [hl], a
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ffec
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_15e96
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ffec
	add hl, de
	ld a, l
	ld [wOAM04XCoord], a
	ld a, $2
	call Func_15fe9
	or a
	jp z, Func_15e59
	cp $2
	jp nz, Func_15e91
Func_15e59: ; 15e59 (5:5e59)
	or a
	jp nz, Func_15e6d
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_15e6d: ; 15e6d (5:5e6d)
	ld a, $ff
	ld [wOAM04XCoord], a
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $8000
	jp Func_15fe4

Func_15e91: ; 15e91 (5:5e91)
	ld a, $ff
	ld [wOAM04XCoord], a
Func_15e96: ; 15e96 (5:5e96)
	ld hl, $4000
	jp Func_15fe4

Func_15e9c: ; 15e9c (5:5e9c)
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $17
	inc hl
	or [hl]
	jp nz, Func_15fcb
	ld a, $1
	call Func_15fe9
	or a
	jp nz, Func_15fc5
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
Func_15ec2: ; 15ec2 (5:5ec2)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_15f9b
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, Func_15f91
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_15f5c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_15f34
	ld a, $3
	call Func_15fe9
	ld hl, sp+$0
	ld [hl], $3
	jp Func_15f59

Func_15f34: ; 15f34 (5:5f34)
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], $0
Func_15f59: ; 15f59 (5:5f59)
	jp Func_15f91

Func_15f5c: ; 15f5c (5:5f5c)
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_15f91: ; 15f91 (5:5f91)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_15ec2

Func_15f9b: ; 15f9b (5:5f9b)
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus7
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $ff
	ld [wOAM04XCoord], a
	ld hl, $8000
	jp Func_15fe4

Func_15fc5: ; 15fc5 (5:5fc5)
	ld hl, $4000
	jp Func_15fe4

Func_15fcb: ; 15fcb (5:5fcb)
	ld a, [wc2e8 + 1]
	ld [wOAM04YCoord], a
	set_farcall_addrs_hli Func_56b35
	ld a, $1
	call FarCall
	ld hl, $4000
Func_15fe4: ; 15fe4 (5:5fe4)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_15fe9: ; 15fe9 (5:5fe9)
	push af
	set_farcall_addrs_hli Func_624af
	pop af
	jp FarCall

Func_15ff9: ; 15ff9 (5:5ff9)
	set_farcall_addrs_hli Func_623d0
	jp FarCall

Func_16007: ; 16007 (5:6007)
	push de
	push af
	ld a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	call GetSRAMBank
	pop hl
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	ld a, l
	ret

Func_16019: ; 16019 (5:6019)
	push hl
	push de
	add sp, -$1e
	ld e, c
	ld d, b
	ld hl, sp+$0
	call LiteralStringInTree
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $20
	push hl
	call GetHLAtSPPlusParam8
	db $24
	pop de
	call Func_173a1
	add sp, $22
	ret

Func_16038:
	push bc
	push bc
	push bc
	push hl
	ld c, l
	ld b, h
	ld hl, $d
	add hl, bc
	ld a, [hl]
	pop hl
	cp $3
	jp nz, Func_16052
	ld de, $2
	call Func_16377
	jp Func_160be

Func_16052: ; 16052 (5:6052)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, $7
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus6
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_160a8
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus4
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlus4
Func_160a8: ; 160a8 (5:60a8)
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	call Func_16777
	ld hl, $4000
Func_160be: ; 160be (5:60be)
	pop bc
	pop bc
	pop bc
	ret

Func_160c2:
	push hl
	ld c, l
	ld b, h
	ld hl, $d
	add hl, bc
	ld a, [hl]
	pop hl
	cp $3
	jp nz, Func_160d9
	ld de, $3
	call Func_16377
	jp Func_16103

Func_160d9: ; 160d9 (5:60d9)
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $9
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	inc d
	dec d
	bit 7, d
	jr z, .asm_160f4
	ld de, $0
.asm_160f4
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	call Func_16777
	ld hl, $4000
Func_16103: ; 16103 (5:6103)
	ret

Func_16104: ; 16104 (5:6104)
	push de
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	pop bc
	ret

Func_16128: ; 16128 (5:6128)
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0c
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus10
	ld a, l
	and h
	inc a
	jp z, Func_1620c
	call GetHLAtSPPlus10
	ld de, $14
	call CompareHLtoDE
	jp c, Func_161c9
	call GetHLAtSPPlus10
	push de
	push hl
	pop de
	pop hl
	ld hl, $16
	call CompareHLtoDE
	jp c, Func_161c9
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	ld de, hFFD2 + 6
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_16204

Func_161c9: ; 161c9 (5:61c9)
	call GetHLAtSPPlus10
	ld de, $17
	call CompareHLtoDE
	jp c, Func_161f1
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	ld de, hFFD2 + 6
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_16204

Func_161f1: ; 161f1 (5:61f1)
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus10
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call SetStringStartState
Func_16204: ; 16204 (5:6204)
	ld hl, Data_16367
	push hl
	call PlaceString
	pop bc
Func_1620c: ; 1620c (5:620c)
	ld c, $0
Func_1620e: ; 1620e (5:620e)
	call GetHLAtSPPlusParam8
	db $0e
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_16281
	push bc
	call GetHLAtSPPlusParam8
	db $0e
	ld e, c
	ld d, $0
	call CompareHLtoDE
	jp z, Func_1624a
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, $8f
	push hl
	ld hl, Data_16369
	push hl
	call PlaceString
	pop bc
	pop bc
Func_1624a: ; 1624a (5:624a)
	pop bc
	push bc
	call GetHLAtSPPlus10
	ld e, c
	ld d, $0
	add hl, de
	ld a, [wOAM04XCoord]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp nz, Func_1627c
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_1636c
	push hl
	call PlaceString
	pop bc
	pop bc
Func_1627c: ; 1627c (5:627c)
	pop bc
	inc c
	jp Func_1620e

Func_16281: ; 16281 (5:6281)
	call GetHLAtSPPlusParam8
	db $0c
	ld de, $14
	call CompareHLtoDE
	jp c, Func_162bb
	call GetHLAtSPPlusParam8
	db $0c
	push de
	push hl
	pop de
	pop hl
	ld hl, $16
	call CompareHLtoDE
	jp c, Func_162bb
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlusParam8
	db $0c
	add hl, hl
	ld de, -$28
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_162f9

Func_162bb: ; 162bb (5:62bb)
	call GetHLAtSPPlusParam8
	db $0c
	ld de, $17
	call CompareHLtoDE
	jp c, Func_162e5
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	call GetHLAtSPPlusParam8
	db $0c
	add hl, hl
	ld de, -$28
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_162f9

Func_162e5: ; 162e5 (5:62e5)
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlusParam8
	db $0c
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call SetStringStartState
Func_162f9: ; 162f9 (5:62f9)
	ld hl, $8b
	push hl
	ld hl, Data_1636f
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	call GetHLAtSPPlusParam8
	db $0c
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp z, Func_16364
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	add [hl]
	add $fe
	ld l, a
	push hl
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$7
	add [hl]
	add $fe
	pop de
	call SetStringStartState
	pop bc
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_1635c
	ld hl, $8a
	push hl
	ld hl, Data_16372
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_16364

Func_1635c: ; 1635c (5:635c)
	ld hl, Data_16375
	push hl
	call PlaceString
	pop bc
Func_16364: ; 16364 (5:6364)
	add sp, $c
	ret

Data_16367:
	db " ", $00

Data_16369:
	TX_STACK
	db $00

Data_1636c:
	TX_STACK
	db $00

Data_1636f:
	TX_STACK
	db $00

Data_16372:
	TX_STACK
	db $00

Data_16375:
	db " ", $00

Func_16377: ; 16377 (5:6377)
	push hl
	add sp, -$12
	ld hl, sp+$12
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	pop hl
	call WriteHLToSPPlusParam8
	db $15
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $13
	call GetHLAtSPPlusParam8
	db $15
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $11
	call GetHLAtSPPlusParam8
	db $15
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0f
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$c
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$a
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$9
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $11
	push hl
	call GetHLAtSPPlusParam8
	db $17
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16427
	call GetHLAtSPPlusParam8
	db $15
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $11
Func_16427: ; 16427 (5:6427)
	call GetHLAtSPPlusParam8
	db $13
	push hl
	call GetHLAtSPPlusParam8
	db $17
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$6
	ld [hl], $0
	ld a, [$c9a2]
	ld c, a
	push bc
	ld hl, sp+$7
	ld [hl], $0
Func_16450: ; 16450 (5:6450)
	ld hl, sp+$7
	ld a, [hl]
	cp $3
	jp nc, Func_16497
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_1648a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_1648d

Func_1648a: ; 1648a (5:648a)
	jp Func_16497

Func_1648d: ; 1648d (5:648d)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_16450

Func_16497: ; 16497 (5:6497)
	ld hl, sp+$8
	ld a, [hl]
	cp $3
	jp nz, Func_164a3
	ld hl, sp+$8
	ld [hl], $2
Func_164a3: ; 164a3 (5:64a3)
	ld hl, sp+$a
	ld a, [hl]
	call GetSRAMBank
	pop bc
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_16627
	ld a, e
	sub $2
	or d
	jp z, Func_16610
	ld a, e
	dec a
	or d
	jp z, Func_16558
	ld a, e
	or d
	jp nz, Func_16645
	call GetHLAtSPPlusParam8
	db $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_16507
	call GetHLAtSPPlusParam8
	db $11
	dec hl
	call WriteHLToSPPlusParam8
	db $11
	inc h
	dec h
	bit 7, h
	jr z, .asm_16504
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $11
	call GetHLAtSPPlusParam8
	db $0d
	dec hl
	call WriteHLToSPPlusParam8
	db $0d
	inc h
	dec h
	bit 7, h
	jr z, .asm_16500
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0d
	jp .asm_16504

.asm_16500
	ld hl, sp+$2
	ld [hl], $1
.asm_16504
	jp Func_16555

Func_16507: ; 16507 (5:6507)
	call GetHLAtSPPlusParam8
	db $11
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_16531
	call GetHLAtSPPlusParam8
	db $11
	push de
	push hl
	pop de
	pop hl
	ld hl, $14
	call CompareHLtoDE
	jp nc, Func_1652e
	call GetHLAtSPPlusParam8
	db $11
	dec hl
	call WriteHLToSPPlusParam8
	db $11
Func_1652e: ; 1652e (5:652e)
	jp Func_16555

Func_16531: ; 16531 (5:6531)
	call GetHLAtSPPlusParam8
	db $11
	ld a, l
	sub $17
	or h
	jp nz, Func_1654c
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	call WriteHLToSPPlusParam8
	db $11
	jp Func_16555

Func_1654c: ; 1654c (5:654c)
	call GetHLAtSPPlusParam8
	db $11
	dec hl
	call WriteHLToSPPlusParam8
	db $11
Func_16555: ; 16555 (5:6555)
	jp Func_16645

Func_16558: ; 16558 (5:6558)
	call GetHLAtSPPlusParam8
	db $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_165c1
	call GetHLAtSPPlusParam8
	db $0f
	push hl
	call GetHLAtSPPlusParam8
	db $13
	inc hl
	call WriteHLToSPPlusParam8
	db $13
	pop de
	call CompareHLtoDE
	jp c, Func_165be
	call GetHLAtSPPlusParam8
	db $0f
	dec hl
	call WriteHLToSPPlusParam8
	db $11
	call GetHLAtSPPlusParam8
	db $0d
	inc hl
	call WriteHLToSPPlusParam8
	db $0d
	call GetHLAtSPPlusParam8
	db $0f
	push hl
	call GetHLAtSPPlusParam8
	db $0f
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $15
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp nc, Func_165ba
	call GetHLAtSPPlusParam8
	db $0d
	dec hl
	call WriteHLToSPPlusParam8
	db $0d
	jp Func_165be

Func_165ba: ; 165ba (5:65ba)
	ld hl, sp+$2
	ld [hl], $2
Func_165be: ; 165be (5:65be)
	jp Func_1660d

Func_165c1: ; 165c1 (5:65c1)
	call GetHLAtSPPlusParam8
	db $11
	ld de, $17
	call CompareHLtoDE
	jp nc, Func_165f9
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld de, $14
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $13
	pop de
	call CompareHLtoDE
	jp nc, Func_165ef
	call GetHLAtSPPlusParam8
	db $11
	inc hl
	call WriteHLToSPPlusParam8
	db $11
	jp Func_165f6

Func_165ef: ; 165ef (5:65ef)
	ld hl, $17
	call WriteHLToSPPlusParam8
	db $11
Func_165f6: ; 165f6 (5:65f6)
	jp Func_1660d

Func_165f9: ; 165f9 (5:65f9)
	call GetHLAtSPPlusParam8
	db $11
	ld a, l
	sub $17
	or h
	jp nz, Func_1660d
	call GetHLAtSPPlusParam8
	db $11
	inc hl
	call WriteHLToSPPlusParam8
	db $11
Func_1660d: ; 1660d (5:660d)
	jp Func_16645

Func_16610: ; 16610 (5:6610)
	call GetHLAtSPPlusParam8
	db $11
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_16624
	ld hl, $14
	call WriteHLToSPPlusParam8
	db $11
Func_16624: ; 16624 (5:6624)
	jp Func_16645

Func_16627: ; 16627 (5:6627)
	call GetHLAtSPPlusParam8
	db $11
	ld de, $14
	call CompareHLtoDE
	jp c, Func_16645
	ld a, c
	cp $1
	jp c, Func_16645
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $11
	ld hl, sp+$2
	ld [hl], $4
Func_16645: ; 16645 (5:6645)
	call GetHLAtSPPlusParam8
	db $11
	push hl
	call GetHLAtSPPlusParam8
	db $15
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlusParam8
	db $0d
	push hl
	call GetHLAtSPPlusParam8
	db $15
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_16748
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp nc, Func_16748
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	call Coord2TileMap
	pop de
	push hl
	ld hl, sp+$2
	ld a, [hl]
	dec a
	ld c, a
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	dec de
	dec de
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	dec h
	dec h
	dec h
	add hl, de
	push hl
	ld hl, sp+$b
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	pop de
	call Func_17ef7
	ld a, $3
	call GetSRAMBank
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_166f2
	ld hl, sp+$5
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $0f
	ld c, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add $2
	call Func_171ab
	pop bc
	pop hl
	push hl
	ld [hl], $8a
	jp Func_16742

Func_166f2: ; 166f2 (5:66f2)
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp nz, Func_16742
	ld hl, sp+$5
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $11
	push hl
	call GetHLAtSPPlusParam8
	db $11
	pop de
	add hl, de
	dec hl
	push hl
	ld hl, sp+$d
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $13
	add hl, hl
	add hl, bc
	dec hl
	ld e, l
	ld hl, sp+$e
	ld a, [hl]
	add $2
	pop bc
	call Func_171ab
	pop bc
	call GetHLAtSPPlusParam8
	db $13
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $0f
	push hl
	call GetHLAtSPPlusParam8
	db $0f
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, Func_16742
	pop hl
	push hl
	ld [hl], $8f
Func_16742: ; 16742 (5:6742)
	ld hl, sp+$6
	ld a, [hl]
	call GetSRAMBank
Func_16748: ; 16748 (5:6748)
	call GetHLAtSPPlusParam8
	db $13
	call Func_16128
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp c, Func_16769
	ld hl, $8000
	jp Func_1676c

Func_16769: ; 16769 (5:6769)
	ld hl, $4000
Func_1676c: ; 1676c (5:676c)
	push de
	push hl
	pop de
	pop hl
	add sp, $14
	push de
	push hl
	pop de
	pop hl
	ret

Func_16777: ; 16777 (5:6777)
	push hl
	add sp, -$e
	ld hl, sp+$e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	pop hl
	call WriteHLToSPPlusParam8
	db $0e
	call GetHLAtSPPlusParam8
	db $0e
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $10
	call GetHLAtSPPlusParam8
	db $10
	ld e, [hl]
	ld hl, sp+$9
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $10
	inc hl
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $10
	inc hl
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlusParam8
	db $12
	ld de, $b
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	call GetHLAtSPPlusParam8
	db $12
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlusParam8
	db $12
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop af
	push af
	push bc
	call GetHLAtSPPlusParam8
	db $14
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	add $fe
	ld b, $2
	call DivideAbyB
	ld hl, sp+$10
	ld [hl], a
	pop bc
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_1681b
	ld hl, sp+$e
	ld [hl], c
Func_1681b: ; 1681b (5:681b)
	ld hl, sp+$e
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $12
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$8
	ld a, [hl]
	cp $8
	jp nz, Func_16841
	callba_hli Func_566fe
Func_16841: ; 16841 (5:6841)
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call Func_17e95
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp nz, Func_16866
	ld a, $ff
	ld [wOAM04XCoord], a
	call GetHLAtSPPlusParam8
	db $0e
	call Func_16128
	jp Func_1686d

Func_16866: ; 16866 (5:6866)
	call GetHLAtSPPlusParam8
	db $0e
	call Func_17863
Func_1686d: ; 1686d (5:686d)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlusParam8
	db $10
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$b
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	cp $1b
	jp z, Func_16ae2
	cp $1a
	jp z, Func_16ae2
	cp $21
	jp z, Func_16ae2
	cp $15
	jp z, Func_16ae2
	cp $11
	jp z, Func_16ae2
	cp $6
	jp z, Func_16a92
	cp $1f
	jp z, Func_16a5c
	cp $8
	jp z, Func_16a5c
	cp $a
	jp z, Func_16a31
	cp $7
	jp z, Func_169e0
	cp $3
	jp z, Func_169e0
	cp $1
	jp z, Func_169e0
	cp $b
	jp z, Func_169b5
	cp $5
	jp z, Func_16966
	cp $9
	jp z, Func_16926
	cp $2
	jp z, Func_16926
	cp $e
	jp z, Func_16910
	cp $d
	jp z, Func_168e9
	or a
	jp nz, Func_16b21
Func_168e9: ; 168e9 (5:68e9)
	ld a, [$ca6c]
	or a
	jp nz, Func_168fc
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp Func_16ce3

Func_168fc: ; 168fc (5:68fc)
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $7
	add hl, de
	ld a, [$ca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_16b21

Func_16910: ; 16910 (5:6910)
	ld a, [$cb94]
	or a
	jp nz, Func_16923
	ld hl, sp+$b
	ld a, [hl]
	call Func_16d2d
	ld hl, -1
	jp Func_16ce3

Func_16923: ; 16923 (5:6923)
	jp Func_16b21

Func_16926: ; 16926 (5:6926)
	ld a, [$c9b7]
	or a
	jp nz, Func_16963
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	ld hl, sp+$4
	ld a, [hl]
	cp $9
	jp z, Func_1694e
	call GetHLAtSPPlusParam8
	db $0e
	call Func_15388
	call Func_16d1a
	jp Func_1695d

Func_1694e: ; 1694e (5:694e)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
Func_1695d: ; 1695d (5:695d)
	ld hl, -1
	jp Func_16ce3

Func_16963: ; 16963 (5:6963)
	jp Func_16b21

Func_16966: ; 16966 (5:6966)
	ld a, [$c9b7]
	or a
	jp nz, Func_169b2
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	callba_hli Func_33bd0
	set_farcall_addrs_hli Func_569d9
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
	ld hl, -1
	jp Func_16ce3

Func_169b2: ; 169b2 (5:69b2)
	jp Func_16b21

Func_169b5: ; 169b5 (5:69b5)
	ld a, [$cc34]
	or a
	jp nz, Func_169dd
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d47
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
	ld hl, -1
	jp Func_16ce3

Func_169dd: ; 169dd (5:69dd)
	jp Func_16b21

Func_169e0: ; 169e0 (5:69e0)
	ld a, [$c9a2]
	or a
	jp nz, Func_16a2e
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d6b
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_16a02
	call GetHLAtSPPlusParam8
	db $0e
	call Func_15388
Func_16a02: ; 16a02 (5:6a02)
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, Func_16a13
	call Func_16d1a
	ld hl, -1
	jp Func_16ce3

Func_16a13: ; 16a13 (5:6a13)
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $b
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlusParam8
	db $0e
	inc hl
	inc hl
	inc hl
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
Func_16a2e: ; 16a2e (5:6a2e)
	jp Func_16b21

Func_16a31: ; 16a31 (5:6a31)
	ld a, [$cd10]
	or a
	jp nz, Func_16a59
	ld hl, sp+$b
	ld c, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_16d6b
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
	ld hl, -1
	jp Func_16ce3

Func_16a59: ; 16a59 (5:6a59)
	jp Func_16b21

Func_16a5c: ; 16a5c (5:6a5c)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_16a8f
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $6cee
	call PlaceStringDEatCoordHL
	call Func_16d1a
	ld hl, -1
	jp Func_16ce3

Func_16a8f: ; 16a8f (5:6a8f)
	jp Func_16b21

Func_16a92: ; 16a92 (5:6a92)
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $7
	add hl, de
	ld de, $96
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$7
	ld [hl], $96
Func_16aa4: ; 16aa4 (5:6aa4)
	ld hl, sp+$7
	ld a, [hl]
	cp $a8
	jp nc, Func_16adf
	set_farcall_addrs_hli Func_53b1e
	ld e, $0
	ld hl, sp+$7
	ld a, [hl]
	call FarCall
	cp $1
	jp nz, Func_16ad5
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $7
	add hl, de
	ld de, $a8
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_16adf

Func_16ad5: ; 16ad5 (5:6ad5)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_16aa4

Func_16adf: ; 16adf (5:6adf)
	jp Func_16b21

Func_16ae2: ; 16ae2 (5:6ae2)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_16b21
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $6cf7
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
	ld hl, -1
	jp Func_16ce3

Func_16b21: ; 16b21 (5:6b21)
	ld hl, sp+$9
	ld a, [hl]
	add $2
	ld hl, sp+$6
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	xor a
Func_16b31: ; 16b31 (5:6b31)
	ld hl, sp+$a
	cp [hl]
	jp nc, Func_16b5b
	push af
	ld hl, sp+$6
	ld l, [hl]
	push hl
	call GetHLAtSPPlus6
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld hl, sp+$9
	ld e, [hl]
	ld hl, sp+$a
	ld a, [hl]
	call Func_171ab
	pop bc
	ld hl, sp+$7
	ld a, [hl]
	add $2
	ld hl, sp+$7
	ld [hl], a
	pop af
	inc a
	jp Func_16b31

Func_16b5b: ; 16b5b (5:6b5b)
	ld hl, sp+$b
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_16c8e
	cp $21
	jp z, Func_16c78
	cp $1a
	jp z, Func_16c4f
	cp $6
	jp z, Func_16c3e
	cp $5
	jp z, Func_16c17
	cp $2
	jp z, Func_16bf7
	cp $3
	jp z, Func_16bab
	cp $1
	jp nz, Func_16cd4
	call GetHLAtSPPlusParam8
	db $0e
	call Func_15388
	set_farcall_addrs_hli Func_5712f
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp Func_16cd4

Func_16bab: ; 16bab (5:6bab)
	callba_hli Func_5615c
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, l
	call Func_158b7
	cp $ff
	jp nz, Func_16bd0
	ld hl, -1
	jp Func_16ce3

Func_16bd0: ; 16bd0 (5:6bd0)
	call GetHLAtSPPlusParam8
	db $0e
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	sub $14
	inc hl
	or [hl]
	jp nz, Func_16bf4
	call GetHLAtSPPlusParam8
	db $0e
	call Func_16128
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $b
	add hl, de
	ld de, $14
	ld [hl], e
	inc hl
	ld [hl], d
Func_16bf4: ; 16bf4 (5:6bf4)
	jp Func_16cd4

Func_16bf7: ; 16bf7 (5:6bf7)
	call GetHLAtSPPlusParam8
	db $0e
	call Func_15388
	set_farcall_addrs_hli Func_56abf
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp Func_16cd4

Func_16c17: ; 16c17 (5:6c17)
	callba_hli Func_33bd0
	set_farcall_addrs_hli Func_569d9
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call FarCall
	jp Func_16cd4

Func_16c3e: ; 16c3e (5:6c3e)
	callba_hli Func_57840
	jp Func_16cd4

Func_16c4f: ; 16c4f (5:6c4f)
	callba_hli Func_681a6
	set_farcall_addrs_hli Func_681bd
	ld hl, sp+$a
	ld c, [hl]
	pop hl
	push hl
	ld a, l
	call GetHLAtSPPlus4
	ld e, l
	call FarCall
	jp Func_16cd4

Func_16c78: ; 16c78 (5:6c78)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_17e95
	ld de, Data_16d03
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_16cd4

Func_16c8e: ; 16c8e (5:6c8e)
	ld de, $19
	ld a, $3
	call Func_16007
	ld hl, sp+$b
	ld [hl], a
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $ca44
	add hl, de
	ld a, [hl]
	push af
	ld hl, sp+$d
	ld a, [hl]
	call GetSRAMBank
	ld c, $3
	ld e, $14
	ld hl, $0
	call Func_17e95
	set_farcall_addrs_hli Func_61133
	pop af
	ld l, a
	ld h, $0
	ld de, $a8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $101
	call FarCall
Func_16cd4: ; 16cd4 (5:6cd4)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld hl, $4000
Func_16ce3: ; 16ce3 (5:6ce3)
	push de
	push hl
	pop de
	pop hl
	add sp, $10
	push de
	push hl
	pop de
	pop hl
	ret

Data_16cee:
	db "<HIRA>わさﾞ なし<KATA>", $00

Data_16cf7:
	db "ロホﾞホﾟン <HIRA>なし<KATA>", $00

Data_16d03:
	db "<HIRA>とﾞの<KATA>ロホﾞホﾟン<HIRA>をさくしﾞょする<KATA>?", $00

Func_16d1a: ; 16d1a (5:6d1a)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	call Func_17a44
.asm_16d27
	call Func_3af6
	ret

Func_16d2d: ; 16d2d (5:6d2d)
	call GetSRAMBank
	ld de, Data_16d3d
	ld hl, $104
	call PlaceStringDEatCoordHL
	call Func_16d1a
	ret

Data_16d3d:
	db "アイテム <HIRA>なし<KATA>", $00

Func_16d47: ; 16d47 (5:6d47)
	push de
	push af
	ld a, c
	call GetSRAMBank
	pop af
	pop de
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	ld d, $0
	inc de
	add hl, de
	ld de, Data_16d61
	call PlaceStringDEatCoordHL
	ret

Data_16d61:
	db "ハﾟーツ <HIRA>なし<KATA>", $00

Func_16d6b: ; 16d6b (5:6d6b)
	push de
	push af
	ld a, c
	call GetSRAMBank
	pop af
	pop de
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	ld d, $0
	inc de
	add hl, de
	ld de, Data_16d85
	call PlaceStringDEatCoordHL
	ret

Data_16d85:
	db "ソフト <HIRA>なし<KATA>", $00

Func_16d8e:
	push hl
	add sp, -$e
	ld hl, sp+$e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	pop hl
	call WriteHLToSPPlusParam8
	db $12
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $10
	call GetHLAtSPPlusParam8
	db $12
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0e
	call GetHLAtSPPlusParam8
	db $12
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0c
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$9
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$8
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $12
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16e3e
	call GetHLAtSPPlusParam8
	db $12
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0e
Func_16e3e: ; 16e3e (5:6e3e)
	ld a, [hSRAMBank]
	ld c, a
	call GetHLAtSPPlusParam8
	db $10
	push hl
	call GetHLAtSPPlusParam8
	db $14
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	push bc
	ld a, e
	dec a
	or d
	jp z, Func_16e95
	ld a, e
	or d
	jp nz, Func_16eee
	call GetHLAtSPPlusParam8
	db $10
	dec hl
	call WriteHLToSPPlusParam8
	db $10
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e92
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $10
	call GetHLAtSPPlusParam8
	db $0c
	dec hl
	call WriteHLToSPPlusParam8
	db $0c
	inc h
	dec h
	bit 7, h
	jr z, .asm_16e8e
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0c
	jp .asm_16e92

.asm_16e8e
	ld hl, sp+$4
	ld [hl], $1
.asm_16e92
	jp Func_16eee

Func_16e95: ; 16e95 (5:6e95)
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	call WriteHLToSPPlusParam8
	db $12
	pop de
	call CompareHLtoDE
	jp c, Func_16eee
	call GetHLAtSPPlusParam8
	db $0e
	dec hl
	call WriteHLToSPPlusParam8
	db $10
	call GetHLAtSPPlusParam8
	db $0c
	inc hl
	call WriteHLToSPPlusParam8
	db $0c
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $14
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp nc, Func_16eea
	call GetHLAtSPPlusParam8
	db $0c
	dec hl
	call WriteHLToSPPlusParam8
	db $0c
	jp Func_16eee

Func_16eea: ; 16eea (5:6eea)
	ld hl, sp+$4
	ld [hl], $2
Func_16eee: ; 16eee (5:6eee)
	call GetHLAtSPPlusParam8
	db $10
	push hl
	call GetHLAtSPPlusParam8
	db $14
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlusParam8
	db $14
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_16fee
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	call Coord2TileMap
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld c, a
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	dec de
	dec de
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	dec h
	dec h
	dec h
	add hl, de
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	pop de
	call Func_17ef7
	ld hl, sp+$5
	ld a, [hl]
	cp $8
	jp z, Func_16f7e
	ld hl, sp+$5
	ld a, [hl]
	cp $1f
	jp z, Func_16f7e
	ld a, $3
	call GetSRAMBank
Func_16f7e: ; 16f7e (5:6f7e)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_16fa5
	ld hl, sp+$5
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	ld c, l
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add $2
	call Func_171ab
	pop bc
	call GetHLAtSPPlus4
	ld [hl], $8a
	jp Func_16fee

Func_16fa5: ; 16fa5 (5:6fa5)
	ld hl, sp+$5
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam8
	db $10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	dec hl
	push hl
	ld hl, sp+$c
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $12
	add hl, hl
	add hl, bc
	dec hl
	ld e, l
	ld hl, sp+$d
	ld a, [hl]
	add $2
	pop bc
	call Func_171ab
	pop bc
	call GetHLAtSPPlusParam8
	db $12
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $0e
	push hl
	call GetHLAtSPPlusParam8
	db $0e
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, Func_16fee
	call GetHLAtSPPlus4
	ld [hl], $8f
Func_16fee: ; 16fee (5:6fee)
	pop bc
	ld hl, sp+$3
	ld a, [hl]
	cp $8
	jp z, Func_17003
	ld hl, sp+$3
	ld a, [hl]
	cp $1f
	jp z, Func_17003
	ld a, c
	call GetSRAMBank
Func_17003: ; 17003 (5:7003)
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, Func_17080
	cp $5
	jp z, Func_17065
	cp $3
	jp z, Func_17054
	cp $2
	jp z, Func_17039
	cp $1
	jp nz, Func_170c4
	set_farcall_addrs_hli Func_5712f
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17039: ; 17039 (5:7039)
	set_farcall_addrs_hli Func_56abf
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17054: ; 17054 (5:7054)
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	ld a, l
	call Func_158b7
	jp Func_170c4

Func_17065: ; 17065 (5:7065)
	set_farcall_addrs_hli Func_569d9
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	call FarCall
	jp Func_170c4

Func_17080: ; 17080 (5:7080)
	ld de, $19
	ld a, $3
	call Func_16007
	ld c, a
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	ld de, $ca44
	add hl, de
	ld a, [hl]
	push af
	ld a, c
	call GetSRAMBank
	ld c, $3
	ld e, $14
	ld hl, $0
	call Func_17e95
	set_farcall_addrs_hli Func_61133
	pop af
	ld l, a
	ld h, $0
	ld de, $a8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $101
	call FarCall
Func_170c4: ; 170c4 (5:70c4)
	call GetHLAtSPPlusParam8
	db $10
	call Func_17863
	ld hl, sp+$3
	ld a, [hl]
	cp $1a
	jp nz, Func_170ef
	set_farcall_addrs_hli Func_681bd
	call GetHLAtSPPlusParam8
	db $0c
	ld c, l
	call GetHLAtSPPlus10
	ld a, l
	call GetHLAtSPPlusParam8
	db $0e
	ld e, l
	call FarCall
Func_170ef: ; 170ef (5:70ef)
	ld a, [wOAM26Attrs]
	cp $ff
	jp z, Func_17195
	ld c, $0
Func_170f9: ; 170f9 (5:70f9)
	call GetHLAtSPPlusParam8
	db $10
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_17195
	call GetHLAtSPPlusParam8
	db $10
	ld de, $5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, de
	ld a, [wOAM26Attrs]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp nz, Func_1715d
	push bc
	call GetHLAtSPPlusParam8
	db $12
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, Func_17159
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_171a6
	push hl
	call PlaceString
	pop bc
	pop bc
Func_17159: ; 17159 (5:7159)
	pop bc
	jp Func_17191

Func_1715d: ; 1715d (5:715d)
	call GetHLAtSPPlusParam8
	db $10
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, Func_17191
	push bc
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_171a9
	call PlaceStringDEatCoordHL
	pop bc
Func_17191: ; 17191 (5:7191)
	inc c
	jp Func_170f9

Func_17195: ; 17195 (5:7195)
	call Func_1401b
	ld hl, $4000
	push de
	push hl
	pop de
	pop hl
	add sp, $10
	push de
	push hl
	pop de
	pop hl
	ret

Data_171a6:
	TX_STACK
	db $00

Data_171a9:
	db " ", $00

Func_171ab: ; 171ab (5:71ab)
	push af
	push bc
	add sp, -$20
	push de
	ld hl, sp+$28
	ld a, [hl]
	cp $1b
	jp z, Func_172cd
	cp $1a
	jp z, Func_172cd
	cp $21
	jp z, Func_172cd
	cp $15
	jp z, Func_172cd
	cp $11
	jp z, Func_172cd
	cp $1f
	jp z, Func_172b7
	cp $8
	jp z, Func_172b7
	cp $6
	jp z, Func_172a1
	cp $b
	jp z, Func_17289
	cp $9
	jp z, Func_17271
	cp $5
	jp z, Func_17271
	cp $2
	jp z, Func_17271
	cp $a
	jp z, Func_17259
	cp $7
	jp z, Func_17241
	cp $3
	jp z, Func_17241
	cp $1
	jp z, Func_17241
	cp $e
	jp z, Func_17229
	cp $d
	jp z, Func_17211
	or a
	jp nz, Func_17352
Func_17211: ; 17211 (5:7211)
	set_farcall_addrs_hli Func_55ed2
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17229: ; 17229 (5:7229)
	set_farcall_addrs_hli Func_55ed2
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17241: ; 17241 (5:7241)
	set_farcall_addrs_hli Func_5601b
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17259: ; 17259 (5:7259)
	set_farcall_addrs_hli Func_5601b
	ld c, $2
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17271: ; 17271 (5:7271)
	set_farcall_addrs_hli Func_55f95
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_17289: ; 17289 (5:7289)
	set_farcall_addrs_hli Func_55f95
	ld c, $1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172a1: ; 172a1 (5:72a1)
	set_farcall_addrs_hli Func_576c1
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172b7: ; 172b7 (5:72b7)
	set_farcall_addrs_hli Func_56d87
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_17352

Func_172cd: ; 172cd (5:72cd)
	set_farcall_addrs_hli Func_55dd6
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$28
	ld a, [hl]
	cp $1a
	jp nz, Func_17352
	ld hl, sp+$3
	ld [hl], $0
Func_172ec: ; 172ec (5:72ec)
	ld hl, sp+$3
	ld a, [hl]
	cp $3
	jp nc, Func_17352
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wOAM11Attrs
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_17348
	ld hl, sp+$2
	ld [hl], $0
Func_17312: ; 17312 (5:7312)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_17348
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wOAM11Attrs
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$22
	cp [hl]
	jp nz, Func_1733e
	ld hl, sp+$d
	ld [hl], $80
	jp Func_17348

Func_1733e: ; 1733e (5:733e)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_17312

Func_17348: ; 17348 (5:7348)
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_172ec

Func_17352: ; 17352 (5:7352)
	pop de
	push de
	ld a, [wOAM26Attrs]
	ld hl, sp+$22
	cp [hl]
	jp nz, Func_17371
	ld hl, sp+$25
	ld a, [hl]
	dec a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_1739e
	push hl
	call PlaceString
	pop bc
	pop bc
Func_17371: ; 17371 (5:7371)
	pop de
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld d, $0
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	call Func_16019
	ld hl, sp+$26
	ld a, [hl]
	cp $5
	jp nz, Func_1739b
	set_farcall_addrs_hli Func_6810b
	ld e, $0
	ld hl, sp+$20
	ld a, [hl]
	call FarCall
Func_1739b: ; 1739b (5:739b)
	add sp, $24
	ret

Data_1739e:
	TX_STACK
	db $00

Func_173a1: ; 173a1 (5:73a1)
	push bc
	ld a, l
	and h
	inc a
	jp z, Func_173b2
	ld a, e
	and d
	inc a
	jp z, Func_173b2
	ld a, l
	call SetStringStartState
Func_173b2: ; 173b2 (5:73b2)
	pop bc
	push bc
	ld hl, Data_173c1
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, $4000
	ret

Data_173c1:
	TX_CALL
	db $00

Func_173c4: ; 173c4 (5:73c4)
	push bc
	push bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$1
	ld [hl], a
	push de
	push hl
	pop de
	pop hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
Func_173df: ; 173df (5:73df)
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_17429
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp z, Func_17424
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_1743d
	call PlaceStringDEatCoordHL
Func_17424: ; 17424 (5:7424)
	pop bc
	inc c
	jp Func_173df

Func_17429: ; 17429 (5:7429)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld a, $ff
	ld [wOAM26Attrs], a
	pop bc
	pop bc
	ret

Data_1743d:
	db " ", $00

Func_1743f:
	ld a, [wOAM26Attrs]
	cp $ff
	jp z, Func_17450
	call Func_173c4
	ld hl, $8000
	jp Func_17453

Func_17450: ; 17450 (5:7450)
	ld hl, -1
Func_17453: ; 17453 (5:7453)
	ret

Func_17454:
	ld a, [wOAM26Attrs]
	cp $ff
	jp z, Func_17465
	call Func_173c4
	ld hl, $8000
	jp Func_1746b

Func_17465: ; 17465 (5:7465)
	call Func_3af6
	ld hl, -1
Func_1746b: ; 1746b (5:746b)
	ret

Func_1746c:
	ld hl, $4000
	ret

Func_17470: ; 17470 (5:7470)
	call WaitVideoTransfer
	ld a, BANK(GFX_4dd2)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4dd2
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	ret

Func_17488: ; 17488 (5:7488)
	call Func_3aa8
	call WaitVideoTransfer
	ld a, BANK(GFX_4a02)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4a02
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	ret

Data_174a3:
	dr $174a3, $174ab

Func_174ab: ; 174ab (5:74ab)
	push hl
	push bc
	push bc
	push bc
	ld hl, -1
	ld bc, $4000
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	pop hl
	push hl
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	pop hl
	push hl
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop hl
	push hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	call GetHLAtSPPlus8
	ld de, $f
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_17551
	push bc
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	add hl, hl
	call Func_17aba
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
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
	call Func_2124
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
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
	call Func_2152
	pop bc
Func_17551: ; 17551 (5:7551)
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_1757e
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
Func_1757e: ; 1757e (5:757e)
	push bc
	ld hl, sp+$4
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld hl, $0
	pop bc
Func_1758b: ; 1758b (5:758b)
	ld a, c
	and b
	inc a
	jp nz, Func_17597
	ld hl, -1
	jp Func_1779a

Func_17597: ; 17597 (5:7597)
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	pop hl
	push hl
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_175e1
	pop hl
	push hl
	ld de, $19
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
Func_175e1: ; 175e1 (5:75e1)
	push bc
	call Func_24e9
	ld l, a
	pop bc
	ld a, l
	and $4
	jp z, Func_17625
	push bc
	ld bc, $0
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_17621
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	call FarCall
Func_17621: ; 17621 (5:7621)
	pop bc
	jp Func_17780

Func_17625: ; 17625 (5:7625)
	ld a, l
	and $8
	jp z, Func_17663
	push bc
	ld bc, $1
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_1765f
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	call FarCall
Func_1765f: ; 1765f (5:765f)
	pop bc
	jp Func_17780

Func_17663: ; 17663 (5:7663)
	ld a, l
	and $1
	jp z, Func_1769f
	push bc
	ld hl, $2
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_1769b
	call GetHLAtSPPlus4
	ld de, $13
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus10
	call FarCall
Func_1769b: ; 1769b (5:769b)
	pop bc
	jp Func_17780

Func_1769f: ; 1769f (5:769f)
	ld a, l
	and $2
	jp z, Func_176db
	push bc
	ld hl, $3
	call GetHLAtSPPlus4
	ld de, $17
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_176d7
	call GetHLAtSPPlus4
	ld de, $16
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus4
	ld de, $17
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus10
	call FarCall
Func_176d7: ; 176d7 (5:76d7)
	pop bc
	jp Func_17780

Func_176db: ; 176db (5:76db)
	ld a, l
	and $10
	jp z, Func_17711
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_1770e
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
Func_1770e: ; 1770e (5:770e)
	jp Func_17780

Func_17711: ; 17711 (5:7711)
	ld a, l
	and $40
	jp z, Func_17747
	pop hl
	push hl
	ld de, $1d
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_17744
	pop hl
	push hl
	ld de, $1c
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $1d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
Func_17744: ; 17744 (5:7744)
	jp Func_17780

Func_17747: ; 17747 (5:7747)
	ld a, l
	and $20
	jp z, Func_17780
	pop hl
	push hl
	ld de, $11
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_1777d
	pop hl
	push hl
	ld de, $10
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $11
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
	jp Func_17780

Func_1777d: ; 1777d (5:777d)
	jp Func_1779a

Func_17780: ; 17780 (5:7780)
	ld hl, -1
	ld a, b
	sub $80
	or c
	jp nz, Func_1778d
	jp Func_17551

Func_1778d: ; 1778d (5:778d)
	ld a, b
	sub $40
	or c
	jp z, Func_17797
	jp Func_1779a

Func_17797: ; 17797 (5:7797)
	jp Func_1758b

Func_1779a: ; 1779a (5:779a)
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_177c7
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHalfWordTo
	dw wFarCallDestAddr
	call GetHLAtSPPlus8
	call FarCall
	ld c, l
	ld b, h
Func_177c7: ; 177c7 (5:77c7)
	push bc
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp z, Func_1785d
	ld a, [wOAM05Attrs]
	or a
	jp nz, Func_1784c
	ld a, $3
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
	call Func_3afc
	pop bc
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
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
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
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
Func_1784c: ; 1784c (5:784c)
	call GetHLAtSPPlus10
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call Func_17c57
Func_1785d: ; 1785d (5:785d)
	pop hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_17863: ; 17863 (5:7863)
	push bc
	push bc
	push bc
	push bc
	push bc
	pop de
	push hl
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlus4
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $0c
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	call GetHLAtSPPlus4
	ld de, $d
	add hl, de
	ld a, [hl]
	ld a, c
	and b
	inc a
	jp z, Func_178e5
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, b
	add hl, hl
	add hl, de
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, Data_1796b
	push hl
	call PlaceString
	pop bc
Func_178e5: ; 178e5 (5:78e5)
	pop bc
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, b
	add hl, hl
	add hl, de
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_1796d
	push hl
	call PlaceString
	pop bc
	pop bc
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	pop de
	call CompareHLtoDE
	jp z, Func_17965
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$2
	add [hl]
	add $fe
	ld l, a
	push hl
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$5
	add [hl]
	add $fe
	pop de
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlusParam8
	db $0c
	push hl
	call GetHLAtSPPlus10
	pop de
	add hl, de
	pop de
	call CompareHLtoDE
	jp nc, Func_1795d
	ld hl, $8a
	push hl
	ld hl, Data_17970
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_17965

Func_1795d: ; 1795d (5:795d)
	ld hl, Data_17973
	push hl
	call PlaceString
	pop bc
Func_17965: ; 17965 (5:7965)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_1796b:
	db " ", $00

Data_1796d:
	TX_STACK
	db $00

Data_17970:
	TX_STACK
	db $00

Data_17973:
	db " ", $00

Func_17975:
	push hl
	push bc
	push bc
	push bc
	xor a
	ld a, c
	and $80
	ld hl, sp+$2
	ld [hl], a
	ld a, c
	and $7f
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_1799c
	push de
	ld hl, Data_174a3
	call WriteHLToSPPlus4
	ld hl, sp+$6
	ld [hl], $4
	pop de
	jp Func_179ba

Func_1799c: ; 1799c (5:799c)
	push de
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	ld de, Data_174a3
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	pop de
Func_179ba: ; 179ba (5:79ba)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp c, Func_17a39
	push de
	ld c, $0
Func_179c5: ; 179c5 (5:79c5)
	call GetHLAtSPPlus10
	inc h
	dec h
	bit 7, h
	jr nz, .asm_179e8
	push bc
	call GetHLAtSPPlus6
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $0c
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlusParam8
	db $0c
	pop bc
	inc c
	jp Func_179c5

.asm_179e8
	push bc
	call GetHLAtSPPlus6
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $0c
	add hl, bc
	call WriteHLToSPPlusParam8
	db $0c
	pop bc
	pop de
	ld a, c
	cp $2
	jp nc, Func_17a0f
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_17a0f
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_17a19
Func_17a0f: ; 17a0f (5:7a0f)
	ld hl, sp+$2
	ld [hl], $0
	ld a, c
	ld [de], a
	inc de
	jp Func_17a25

Func_17a19: ; 17a19 (5:7a19)
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp c, Func_17a25
	ld a, $90
	ld [de], a
	inc de
Func_17a25: ; 17a25 (5:7a25)
	push de
	ld hl, sp+$6
	ld a, [hl]
	dec a
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlus4
	inc hl
	inc hl
	call WriteHLToSPPlus4
	pop de
	jp Func_179ba

Func_17a39: ; 17a39 (5:7a39)
	xor a
	ld [de], a
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_17a44: ; 17a44 (5:7a44)
	call Func_0465
	call Func_24e9
	ld l, a
	ld h, $0
	ld a, l
	and $10
	jp z, Func_17a58
	ld a, $10
	jp Func_17a66

Func_17a58: ; 17a58 (5:7a58)
	ld a, l
	and $20
	jp z, Func_17a63
	ld a, $20
	jp Func_17a66

Func_17a63: ; 17a63 (5:7a63)
	jp Func_17a44

Func_17a66: ; 17a66 (5:7a66)
	ret

Func_17a67: ; 17a67 (5:7a67)
	call WriteHalfWordTo
	dw $c2de
	call ReadHalfWordAt
	dw $c2de
	ld c, l
	ld b, h
	ld a, $55
	ld [bc], a
	ld hl, -5
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, $a002
	ld [hl], e
	inc hl
	ld [hl], d
	ld bc, $a002
	ld a, $55
	ld [bc], a
	ld l, c
	ld h, b
	inc hl
	ld de, $1ffd
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wc2e0], a
	ld hl, $0
	call WriteHalfWordTo
	dw $c2dc
	ret

Func_17ab6: ; 17ab6 (5:7ab6)
	ld [wc2e0], a
	ret

Func_17aba: ; 17aba (5:7aba)
	push hl
	push bc
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp c, .okay
	ld hl, $0
	jp .done

.okay
	call GetHLAtSPPlus4
	ld de, $f
	add hl, de
	ld de, $10
	call DivideHLByDESigned
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw $c2de
	pop de
	push hl
.loop
	pop hl
	push hl
	ld a, l
	or h
	jp z, .crash
	ld a, [wc2e0]
	cp $1
	jp nz, .okay2
	pop hl
	push hl
	ld a, l
	sub $c000 % $100
	ld a, h
	sbc $c000 / $100
	jp nc, .okay2
	jp .next

.okay2
	ld a, [wc2e0]
	cp $2
	jp nz, .okay_3
	pop hl
	push hl
	ld a, l
	sub $c000 % $100
	ld a, h
	sbc $c000 / $100
	jp c, .okay_3
	jp .next

.okay_3
	pop hl
	push hl
	ld a, [hl]
	cp $55
	jp nz, .next
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp c, .next
	pop hl
	push hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	call CompareHLtoBC
	jp nc, .set_aa
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc h
	ld h, a
	ld de, hPushOAM + 6
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld [hl], $aa
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld [hl], $55
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	jp .finish

.set_aa
	pop hl
	push hl
	ld [hl], $aa
.finish
	call ReadHalfWordAt
	dw $c2dc
	inc hl
	call WriteHalfWordTo
	dw $c2dc
	pop hl
	push hl
	ld de, $5
	add hl, de
	jp .done

.next
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	jp .loop

.crash
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call Func_3aa8
	ld e, $1
	xor a
	call SetStringStartState
	ld hl, Data_17c44
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
.crash_wait
	call Func_24e9
	or a
	jp z, .crash_wait
	set_farcall_addrs_hli Func_bf431
	ld hl, -1
	call FarCall
	set_farcall_addrs_hli Func_bf431
	call GetHLAtSPPlus4
	call FarCall
	jp @ - 1 ; better luck next time

.done
	pop bc
	pop bc
	ret

Data_17c44:
	db "ケﾞットハﾞッファー ヌル エラー", $00 ; GET BUFFER FULL ERROR

Func_17c56:
	ret

Func_17c57: ; 17c57 (5:7c57)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, Func_17d77
	call ReadHalfWordAt
	dw $c2dc
	dec hl
	call WriteHalfWordTo
	dw $c2dc
	call GetHLAtSPPlus6
	ld de, hPushOAM + 6
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld a, [hl]
	cp $aa
	jp nz, Func_17d77
	call GetHLAtSPPlus4
	ld [hl], $55
	call ReadHalfWordAt
	dw $c2de
	ld c, l
	ld b, h
Func_17c8c: ; 17c8c (5:7c8c)
	ld a, c
	or b
	jp z, Func_17cc9
	push bc
	call GetHLAtSPPlus6
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nz, Func_17cbe
	jp Func_17cc9

Func_17cbe: ; 17cbe (5:7cbe)
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp Func_17c8c

Func_17cc9: ; 17cc9 (5:7cc9)
	ld a, c
	or b
	jp z, Func_17cfc
	ld a, [bc]
	cp $55
	jp nz, Func_17cfc
	push bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5
	add hl, de
	push hl
	call GetHLAtSPPlus6
	inc hl
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_17cfc: ; 17cfc (5:7cfc)
	call ReadHalfWordAt
	dw $c2de
	ld c, l
	ld b, h
Func_17d03: ; 17d03 (5:7d03)
	ld a, c
	or b
	jp z, Func_17d42
	push bc
	ld l, c
	ld h, b
	call WriteHLToSPPlus4
	ld l, c
	ld h, b
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nz, Func_17d37
	jp Func_17d42

Func_17d37: ; 17d37 (5:7d37)
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp Func_17d03

Func_17d42: ; 17d42 (5:7d42)
	ld a, c
	or b
	jp z, Func_17d77
	ld a, [bc]
	cp $55
	jp nz, Func_17d77
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_17d77: ; 17d77 (5:7d77)
	pop bc
	pop bc
	pop bc
	ret

Func_17d7b:
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw $c2de
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus6
	ld bc, $0
	ld l, c
	ld h, b
	call WriteHLToSPPlus4
	ld hl, $0
	pop de
	push hl
Func_17d9a: ; 17d9a (5:7d9a)
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, Func_17e0c
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $55
	jp nz, Func_17df5
	call GetHLAtSPPlus8
	ld a, l
	sub $0
	ld a, h
	sbc $c0
	jp c, Func_17dca
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop bc
	jp Func_17dd5

Func_17dca: ; 17dca (5:7dca)
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
Func_17dd5: ; 17dd5 (5:7dd5)
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, Func_17df1
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
Func_17df1: ; 17df1 (5:7df1)
	pop bc
	jp Func_17dfc

Func_17df5: ; 17df5 (5:7df5)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
Func_17dfc: ; 17dfc (5:7dfc)
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	jp Func_17d9a

Func_17e0c: ; 17e0c (5:7e0c)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld e, $0
	xor a
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	call ReadHalfWordAt
	dw $c2dc
	push hl
	ld hl, Data_17e6c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $2
	xor a
.asm_17e36
	call SetStringStartState
	pop bc
	push bc
	call GetHLAtSPPlus6
	push hl
	ld hl, Data_17e77
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $4
	xor a
	call SetStringStartState
	pop hl
	push hl
	push hl
	ld hl, Data_17e88
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_17e6c:
	db "カウント "
	TX_SNUM
	db " "
	TX_SNUM
	db $00

Data_17e77:
	db "ナイフﾞ "
	TX_SNUM
	db " カﾞイフﾞ "
	TX_SNUM
	db $00

Data_17e88:
	db "サイタﾞイ "
	TX_SNUM
	db $00

Func_17e91: ; 17e91 (5:7e91)
	call Func_17d7b
	ret

Func_17e95: ; 17e95 (5:7e95)
	push bc
	push de
	push hl
	ld b, e
	push bc
	call Coord2TileMap
	pop bc
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
	add hl, de
.asm_17ea2
	push hl
	ld d, b
	xor a
.asm_17ea5
	ld [hli], a
	dec b
	jr nz, .asm_17ea5
	ld b, d
	pop hl
	ld de, $14
	add hl, de
	dec c
	jr nz, .asm_17ea2
	pop hl
	pop de
	pop bc
	ld d, c
	call Coord2TileMap
	ld a, $14
	sub e
	ld c, a
	ld b, $0
	dec e
	dec d
	push de
	ld a, $80
	ld [hli], a
	ld a, $81
	jr .asm_17eca

.asm_17ec9
	ld [hli], a
.asm_17eca
	dec e
	jr nz, .asm_17ec9
	ld a, $82
	ld [hli], a
	add hl, bc
	pop de
	jr .asm_17ee5

.asm_17ed4
	push de
	ld a, $86
	ld [hli], a
	ld a, $8f
	jr .asm_17edd

.asm_17edc
	ld [hli], a
.asm_17edd
	dec e
	jr nz, .asm_17edc
	ld a, $87
	ld [hli], a
	add hl, bc
	pop de
.asm_17ee5
	dec d
	jr nz, .asm_17ed4
	ld a, $83
	ld [hli], a
	ld a, $84
	jr .asm_17ef0

.asm_17eef
	ld [hli], a
.asm_17ef0
	dec e
	jr nz, .asm_17eef
	ld a, $85
	ld [hli], a
	ret

Func_17ef7: ; 17ef7 (5:7ef7)
	bit 0, c
	jr nz, .asm_17f48
	ld a, h
	add d
	ld h, a
	dec h
	ld a, l
	add e
	ld l, a
	dec l
	call Coord2TileMap
	ld a, e
	push af
	ld a, $14
	sub d
	ld e, a
	ld a, l
	sub $28
	ld c, a
	ld a, h
	sbc $0
	ld b, a
	pop af
	sub $3
.asm_17f17
	push af
	push de
.asm_17f19
	ld a, [bc]
	dec bc
	ld [hld], a
	dec d
	jr nz, .asm_17f19
	pop de
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	pop af
	dec a
	jr nz, .asm_17f17
.asm_17f32
	ld a, [bc]
	dec bc
	ld e, $42
	cp $88
	jr z, .asm_17f42
	ld e, $43
	cp $89
	jr z, .asm_17f42
	ld e, $8f
.asm_17f42
	ld a, e
	ld [hld], a
	dec d
	jr nz, .asm_17f32
	ret

.asm_17f48
	call Coord2TileMap
	ld a, e
	push af
	ld a, $14
	sub d
	ld e, a
	ld a, l
	add $28
	ld c, a
	ld a, h
	adc $0
	ld b, a
	pop af
	sub $3
	push af
	push de
.asm_17f5e
	ld a, [bc]
	inc bc
	ld e, $88
	cp $42
	jr z, .asm_17f6e
	ld e, $89
	cp $43
	jr z, .asm_17f6e
	ld e, $81
.asm_17f6e
	ld a, e
	ld [hli], a
	dec d
	jr nz, .asm_17f5e
	pop de
	ld a, c
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, l
	add e
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af
.asm_17f83
	push af
	push de
.asm_17f85
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, .asm_17f85
	pop de
	ld a, c
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, l
	add e
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af
	dec a
	jr nz, .asm_17f83
	ret

SECTION "Bank 06", ROMX, BANK [$06]
	dr $18000, $1bfcf

SECTION "Bank 07", ROMX, BANK [$07]
	dr $1c000, $1e7ec

SECTION "Bank 08", ROMX [$4000], BANK [$08]
INCLUDE "charmap2.asm"
Func_20000:
	ret

Data_20001:
	dr $20001, $200fd

Text_200fd:
	db "エネだま", $00

Text_20102:
	db "は", $00

Text_20104:
	db "G", $00

Text_20106:
	db "レベル", $00

Text_2010a:
	db "の", $00

Pointers_2010c:
	dw Text_200fd
	dw Text_20102
	dw Text_20104
	dw Text_20106
	dw Text_2010a

Text_20116:
	db "を ひろった", $00

Text_2011d:
	db "ひかっている", $00

Text_20124:
	db "しかし いっぱいなので すてた", $00

Text_20134:
	db "けいけんちが ふえた", $00

Text_2013f:
	db "に なった", $00

Text_20145:
	db "ほかくに せいこうした", $00

Text_20151:
	db "ほかくに しっぱいした", $00

Text_2015d:
	db "しかし だれもたべられない", $00

Text_2016b:
	db "そのコマンドは つかえません", $00

Pointers_2017a:
	dw Text_20116
	dw Text_2011d
	dw Text_20124
	dw Text_20134
	dw Text_2013f
	dw Text_20145
	dw Text_20151
	dw Text_2015d
	dw Text_2016b

Text_2018c:
	db "ここでは", $00

Text_20191:
	db "しようできない", $00

Pointers_20199:
	dw Text_2018c
	dw Text_20191
	dw $0000

Text_2019f:
	db "ひとのものを", $00

Text_201a6:
	db "とっちゃいけないよ!", $00

Pointers_201b1:
	dw Text_2019f
	dw Text_201a6
	dw $0000

Text_201b7:
	db "は まだ がまんしている!", $00

Pointers_201c5:
	dw Text_201b7

INCLUDE "text/attack_categories.asm"
Text_202d7:
	db "エネルギー ポイントが", $00

Text_202e3:
	db "たりません!", $00

Pointers_202ea:
	dw Text_202d7
	dw Text_202e3
	dw $0000

SECTION "Bank 8 part 2", ROMX [$42f0], BANK [$08]
INCLUDE "charmap.asm"

Func_202f0: ; 202f0 (8:42f0)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20304: ; 20304 (8:4304)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20318:
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_2033d
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_20304
	jp Func_2034b

Func_2033d: ; 2033d (8:433d)
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_202f0
Func_2034b: ; 2034b (8:434b)
	pop bc
	ret

Func_2034d: ; 2034d (8:434d)
	push af
	set_farcall_addrs_hli Func_dd67
	pop af
	call FarCall
	ret

Func_2035e:
	callba_hli Func_5ec5e
	ret

Func_2036d: ; 2036d (8:436d)
	push hl
	push de
	set_farcall_addrs_hli Func_667d
	pop de
	pop hl
	ld bc, $8f02
	call FarCall
	ret

Func_20383: ; 20383 (8:4383)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_20398: ; 20398 (8:4398)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_20383
	ret

Func_203a3: ; 203a3 (8:43a3)
	push hl
	push de
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_c868
	ld c, $a8
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call FarCall
	pop bc
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop bc
	ret

Func_203fa: ; 203fa (8:43fa)
	push hl
	push de
	call Func_20398
	pop de
	pop hl
	call Func_203a3
	ret

Func_20405:
	push af
	push de
	set_farcall_addrs_hli Func_d3a2
	pop de
	pop af
	jp FarCall

Func_20417:
	ld hl, $4000
	ret

Func_2041b: ; 2041b (8:441b)
	ld a, [$c2cd]
	or a
	jp nz, Func_2042d
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_20435

Func_2042d: ; 2042d (8:442d)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_20435: ; 20435 (8:4435)
	ret

Func_20436: ; 20436 (8:4436)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_20436
	ret

Pointers_20441:
	dw Data_2044d
	dw Data_20454
	dw Data_2045b
	dw Data_20460
	dw Data_20467
	dw Data_20470

Data_2044d:
	db "<HIRA>たたかう<KATA>", $00

Data_20454:
	db "ロホﾞホﾟン", $00

Data_2045b:
	db "アイテム", $00

Data_20460:
	db "<HIRA>にけﾞる<KATA>", $00

Data_20467:
	db "<HIRA>ほﾞうきﾞょ<KATA>", $00

Data_20470:
	db "<HIRA>かいひ<KATA>", $00

DrawBattleSelectionMenu: ; 20476 (8:4476)
	push hl
	push bc
	ld c, $5
	ld e, $d
	ld hl, $70d
	call Func_20383
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jp nz, .second_row
	ld e, $0
	jp .got_starting_string

.second_row
	ld e, $2
.got_starting_string
	ld l, $0
.loop
	ld a, l
	cp $4
	jp nc, .done
	push hl
	push de
	ld a, l
	and $1
	jp nz, .column_2
	ld a, $9
	jp .got_x_coord

.column_2
	ld a, $e
.got_x_coord
	ld c, a
	push bc
	ld a, l
	ld b, $2
	call DivideAbyB
	add a
	add $e
	pop bc
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Pointers_20441
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, c
	ld l, a
	call PlaceStringDEatCoordHL
	pop de
	pop hl
	inc l
	inc e
	jp .loop

.done
	pop bc
	push de
	push bc
	call GetHLAtSPPlus6
	ld a, l
	and h
	inc a
	jp z, .skip_blank_tile
	call GetHLAtSPPlus6
	ld a, l
	and $1
	jp nz, .blank_tile_column_2
	ld a, $8
	jp .got_blank_tile_x

.blank_tile_column_2
	ld a, $d
.got_blank_tile_x
	ld e, a
	push de
	ld a, l
	ld b, $2
	call DivideAbyB
	add a
	add $e
	pop de
	ld h, e
	ld l, a
	ld de, Data_2058f
	call PlaceStringDEatCoordHL
.skip_blank_tile
	pop bc
	push bc
	ld l, c
	ld a, l
	and $1
	jp nz, .cursor_column_2
	ld a, $8
	jp .got_cursor_x

.cursor_column_2
	ld a, $d
.got_cursor_x
	ld c, a
	push bc
	ld a, l
	ld b, $2
	call DivideAbyB
	add a
	add $e
	pop bc
	ld e, a
	ld a, c
	call SetStringStartState
	ld hl, $8b ; selection cursor
	push hl
	ld hl, Data_20591
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $10
	ld a, $12
	call SetStringStartState
	pop bc
	pop de
	push bc
	ld a, e
	cp $5
	jp nc, .clear_down_arrow
	ld hl, $8a ; down arrow
	push hl
	ld hl, Data_20594
	push hl
	call PlaceString
	pop bc
	pop bc
	jp .finish

.clear_down_arrow
	ld hl, Data_20597
	push hl
	call PlaceString
	pop bc
.finish
	ld l, $5
	push hl
	ld c, $d
	ld e, $d
	ld a, $7
	call Func_3ca1
	pop bc
	pop bc
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $4000
	pop bc
	pop bc
	ret

Data_2058f:
	db " ", $00

Data_20591:
	TX_STACK
	db $00

Data_20594:
	TX_STACK
	db $00

Data_20597:
	db " ", $00

Func_20599:
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_20616
	ld a, e
	sub $2
	or d
	jp z, Func_2060c
	ld a, e
	dec a
	or d
	jp z, Func_205ee
	ld a, e
	or d
	jp nz, Func_2061d
	dec bc
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_205eb
	inc bc
	inc bc
	pop hl
	push hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, .asm_205eb
	ld hl, $0
	pop de
	push hl
.asm_205eb
	jp Func_2061d

Func_205ee: ; 205ee (8:45ee)
	inc bc
	inc bc
	ld l, c
	ld h, b
	ld de, $4
	call CompareHLtoDE
	jp c, Func_20609
	dec bc
	dec bc
	pop hl
	push hl
	ld a, l
	or h
	jp nz, Func_20609
	ld hl, $2
	pop de
	push hl
Func_20609: ; 20609 (8:4609)
	jp Func_2061d

Func_2060c: ; 2060c (8:460c)
	ld a, c
	and $1
	jp z, Func_20613
	dec bc
Func_20613: ; 20613 (8:4613)
	jp Func_2061d

Func_20616: ; 20616 (8:4616)
	ld a, c
	and $1
	jp nz, Func_2061d
	inc bc
Func_2061d: ; 2061d (8:461d)
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	call DrawBattleSelectionMenu
	pop hl
	pop bc
	pop bc
	ret

Func_20640:
	ld de, $2
	jp Func_20599

Func_20646:
	ld de, $3
	jp Func_20599

Func_2064c: ; 2064c (8:464c)
	add sp, -$3e
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $40
	ld hl, $17
	add hl, bc
	ld e, [hl]
	ld hl, sp+$26
	call Func_241f
	pop af
	call GetHLAtSPPlusParam8
	db $3e
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $fe
	jp z, Func_20692
	or a
	jp nz, Func_206ae
	call GetHLAtSPPlusParam8
	db $39
	jp Func_206d5

Func_20692: ; 20692 (8:4692)
	inc hl
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $3e
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$13
	call Func_248f
	call GetHLAtSPPlusParam8
	db $21
	jp Func_206d5

Func_206ae: ; 206ae (8:46ae)
	ld a, BANK(GFX_64c7d)
	ld [wFarCallDestBank], a
	ld a, [hl]
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, GFX_64c7d
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld bc, $13
	call FarCopyVideoData
	call GetHLAtSPPlusParam8
	db $0e
Func_206d5: ; 206d5 (8:46d5)
	ld a, l
	and $80
	jp z, Func_206e1
	ld a, l
	and $7f
	jp Func_206e4

Func_206e1: ; 206e1 (8:46e1)
	ld a, l
	and $f
Func_206e4: ; 206e4 (8:46e4)
	add sp, $3e
	ret

Data_206e7:
	dr $206e7, $206f5

Func_206f5:
	push af
	add sp, -$e
	push de
	push bc
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_206e7
	ld bc, $e
	call MemCopy
	pop bc
	pop de
	ld a, [wSystemType]
	cp $1
	jp z, Func_2071b
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_20743
Func_2071b: ; 2071b (8:471b)
	ld hl, sp+$f
	ld a, [hl]
	add a
	add a
	ld hl, sp+$f
	add [hl]
	ld l, a
	ld a, c
	add a
	add a
	add a
	add a
	add l
	ld hl, sp+$3
	ld [hl], a
	ld a, c
	add a
	add a
	add a
	add a
	ld l, a
	ld a, e
	add a
	add a
	add e
	add l
	ld hl, sp+$9
	ld [hl], a
	ld de, $e
	ld hl, sp+$0
	call Func_2b83
Func_20743: ; 20743 (8:4743)
	add sp, $10
	ret

Data_20746:
	dr $20746, $20754

PrintMoveInfoInBattle: ; 20754 (8:4754)
	push hl
	add sp, -$34
	xor a
	call GetHLAtSPPlusParam8
	db $36
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $34
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld c, $7
	ld e, $a
	ld hl, $a0b
	call Func_20383
	ld c, $4
	ld e, $b
	ld hl, $e
	call Func_20383
	ld c, $3
	ld e, $6
	ld hl, $b
	call Func_20383
	pop bc
	pop de
	push bc
	push de
	ld hl, $1c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $c0c
	call Func_2230
	ld de, Data_2094f
	ld hl, $f0c
	call PlaceStringDEatCoordHL
	pop de
	ld hl, $1e
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $100
	ld hl, $100c
	call Func_2230
	ld a, BANK(Data_66efb)
	ld [wFarCallDestBank], a
	pop bc
	push bc
	call GetHLAtSPPlusParam8
	db $36
	push de
	push hl
	pop de
	pop hl
	ld hl, $36
	add hl, bc
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_66efb
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$16
	call LiteralStringInTree
	ld e, $e
	ld a, $b
	call SetStringStartState
	ld hl, sp+$16
	push hl
	ld hl, Data_20951
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	push bc
	call GetHLAtSPPlusParam8
	db $36
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $26
	add hl, bc
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $10c
	call Func_2230
	ld de, Data_20959
	ld hl, $40c
	call PlaceStringDEatCoordHL
	ld de, Data_2095b
	ld hl, $b10
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlusParam8
	db $36
	ld a, l
	call Func_2064c
	ld l, a
	ld a, BANK(Pointers_2027f)
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	ld de, Pointers_2027f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$16
	call LiteralStringInTree
	ld hl, sp+$16
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_56d87
	call GetHLAtSPPlusParam8
	db $36
	ld e, l
	ld hl, sp+$2
	call FarCall
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$16
	call LiteralStringInTree
	ld hl, sp+$16
	push de
	push hl
	pop de
	pop hl
	ld hl, $10f
	call PlaceStringDEatCoordHL
	pop bc
	call GetHLAtSPPlusParam8
	db $34
	ld de, $7
	call CompareHLtoDE
	jp nc, .no_more_moves
	call GetHLAtSPPlusParam8
	db $34
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, .no_more_moves
	ld e, $10
	ld a, $9
	call SetStringStartState
	ld hl, $8a ; down arrow
	push hl
	ld hl, Data_20962
	push hl
	call PlaceString
	pop bc
	pop bc
.no_more_moves
	ld a, [wSystemType]
	cp $1
	jp z, .sgb
	ld a, [wSystemType]
	cp $ff
	jp nz, .check_cgb
.sgb
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call Func_2041b
	set_farcall_addrs_hli Func_62a3
	ld bc, $b
	ld de, $1311
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ld c, $1
	ld de, $e
	ld hl, Data_20746
	call Func_2a79
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_20436
	ld l, $7
	push hl
	ld c, $14
	ld e, $b
	xor a
	call Func_3bc5
	pop bc
	jp .finish

.check_cgb
	ld a, [wSystemType]
	cp $11
	jp nz, .not_cgb
	ld a, $2
	ld [wOAM26VTile], a
.not_cgb
	ld l, $7
	push hl
	ld c, $14
	ld e, $b
	xor a
	call Func_3ca1
	pop bc
.finish
	call GetHLAtSPPlusParam8
	db $34
	push hl
	call GetHLAtSPPlusParam8
	db $38
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	push de
	push hl
	pop de
	pop hl
	add sp, $36
	push de
	push hl
	pop de
	pop hl
	ret

Data_2094f:
	db "/", $00

Data_20951:
	db "タイフﾟ:"
	TX_CALL
	db $00

Data_20959:
	db "P", $00

Data_2095b:
	db "<HIRA>こうか:<KATA>", $00

Data_20962:
	TX_STACK
	db $00

Func_20965:
	push bc
	push bc
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $26
	add hl, bc
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus5
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CompareHLtoDE
	jp c, Func_209bb
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	jp Func_209e5

Func_209bb: ; 209bb (8:49bb)
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2801
	push hl
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $a8
	ld de, $42ea
	ld hl, $10e
	call FarCall
	pop hl
	call Func_2887
	ld hl, $8000
Func_209e5: ; 209e5 (8:49e5)
	pop bc
	pop bc
	ret

Func_209e8:
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_20a1e
	ld a, e
	or d
	jp nz, Func_20a3c
	pop hl
	push hl
	ld a, l
	or h
	jp z, Func_20a1b
	pop hl
	push hl
	dec hl
	pop de
	push hl
Func_20a1b: ; 20a1b (8:4a1b)
	jp Func_20a3c

Func_20a1e: ; 20a1e (8:4a1e)
	pop hl
	push hl
	ld de, $7
	call CompareHLtoDE
	jp nc, Func_20a3c
	pop hl
	push hl
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_20a3c
	pop hl
	push hl
	inc hl
	pop de
	push hl
Func_20a3c: ; 20a3c (8:4a3c)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	call PrintMoveInfoInBattle
	pop hl
	push hl
	pop bc
	pop bc
	ret

Data_20a54:
	dr $20a54, $20ab0

Func_20ab0:
	push hl
	add sp, -$2e
	ld hl, sp+$2e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $32
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	push de
	push hl
	pop de
	pop hl
	push de
	set_farcall_addrs_hli Func_15281
	pop de
	pop hl
	push de
	call FarCall
	call WriteHLToSPPlusParam8
	db $30
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	call GetHLAtSPPlusParam8
	db $32
	ld de, $ca44
	add hl, de
	ld e, [hl]
	ld hl, sp+$2f
	ld [hl], e
	pop af
	call GetSRAMBank
	ld hl, sp+$2d
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$20
	call Func_24bb
	pop de
	ld hl, sp+$28
	ld a, [hl]
	and $2
	jp nz, Func_20b38
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $a8
	ld de, $4199
	ld hl, $10e
	call FarCall
	jp Func_20c68

Func_20b38: ; 20b38 (8:4b38)
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_20ba3
	ld hl, sp+$2b
	ld a, [hl]
	cp $48
	jp nz, Func_20b67
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $a8
	ld de, $4199
	ld hl, $10e
	call FarCall
	jp Func_20c68

Func_20b67: ; 20b67 (8:4b67)
	ld hl, sp+$2b
	ld a, [hl]
	cp $4c
	jp z, Func_20b87
	ld hl, sp+$2b
	ld a, [hl]
	cp $4d
	jp z, Func_20b87
	ld hl, sp+$2b
	ld a, [hl]
	cp $4e
	jp z, Func_20b87
	ld hl, sp+$2b
	ld a, [hl]
	cp $4f
	jp nz, Func_20ba3
Func_20b87: ; 20b87 (8:4b87)
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $a8
	ld de, $41b1
	ld hl, $10e
	call FarCall
	jp Func_20c68

Func_20ba3: ; 20ba3 (8:4ba3)
	call Func_20398
	ld hl, sp+$1e
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	call LiteralStringInTree
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_20c99
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp z, Func_20be8
	jp Func_20c68

Func_20be8: ; 20be8 (8:4be8)
	ld hl, sp+$2b
	ld a, [hl]
	dec a
	ld [wOAM04XCoord], a
	ld hl, sp+$28
	ld a, [hl]
	and $4
	jp z, Func_20c61
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	call GetHLAtSPPlusParam8
	db $30
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	call Func_3aa8
	set_farcall_addrs_hli Func_14771
	ld a, $8
	call FarCall
	ld a, l
	and h
	inc a
	jp nz, Func_20c33
	call Func_3af6
	ld hl, $8000
	jp Func_20c8e

Func_20c33: ; 20c33 (8:4c33)
	set_farcall_addrs_hli Func_fb42d
	ld a, [wOAM04XCoord]
.asm_20c41
	inc a
	call FarCall
	callba_hli Func_54af8
	cp $ff
	jp nz, Func_20c61
	call Func_3af6
	ld hl, $8000
	jp Func_20c8e

.asm_20c5f
Func_20c61: ; 20c61 (8:4c61)
	call GetHLAtSPPlusParam8
	db $2e
	jp Func_20c8e

Func_20c68: ; 20c68 (8:4c68)
	set_farcall_addrs_hli Func_667d
	ld bc, $8e02
	ld de, $1311
	ld hl, $d
	call FarCall
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3ca1
	pop bc
	ld hl, $4000
Func_20c8e: ; 20c8e (8:4c8e)
	push de
	push hl
	pop de
	pop hl
	add sp, $30
.asm_20c93
	push de
	push hl
	pop de
	pop hl
	ret

Data_20c99:
	db "<HIRA>を つかいますか?<KATA>", $00

Data_20ca5:
	dr $20ca5, $20d21

Func_20d21: ; 20d21 (8:4d21)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17975
	pop bc
	pop de
	pop hl
	jp FarCall

Func_20d35: ; 20d35 (8:4d35)
	ld c, $80
	jp Func_20d21

Func_20d3a: ; 20d3a (8:4d3a)
	push bc
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus10
	ld hl, $0
	call WriteHLToSPPlus6
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, e
	cp $1
	jp nc, Func_20d74
	ld a, $ff
	jp Func_20e6f

Func_20d74: ; 20d74 (8:4d74)
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$6
	ld [hl], $0
Func_20d7b: ; 20d7b (8:4d7b)
	ld hl, sp+$6
	ld a, [hl]
	cp e
	jp nc, Func_20e52
	push de
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_20da8
	jp Func_20e47

Func_20da8: ; 20da8 (8:4da8)
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_2617
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $64
	ld hl, sp+$2
	call Func_1a1f
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$3
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_20e0c
	jp Func_20e47

Func_20e0c: ; 20e0c (8:4e0c)
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_20e47
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld l, c
	ld h, b
	call WriteHLToSPPlus8
Func_20e47: ; 20e47 (8:4e47)
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	pop de
	jp Func_20d7b

Func_20e52: ; 20e52 (8:4e52)
	ld hl, sp+$7
	ld a, [hl]
	cp e
	jp nc, Func_20e67
	ld hl, sp+$7
	ld a, [hl]
	call GetHLAtSPPlus10
	ld de, $c6
	add hl, de
	cp [hl]
	jp nz, Func_20e6c
Func_20e67: ; 20e67 (8:4e67)
	ld a, $ff
	jp Func_20e6f

Func_20e6c: ; 20e6c (8:4e6c)
	ld hl, sp+$7
	ld a, [hl]
Func_20e6f: ; 20e6f (8:4e6f)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_20e75: ; 20e75 (8:4e75)
	push bc
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlus10
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus8
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $c6
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_2617
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $64
	ld hl, sp+$0
	call Func_1a1f
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nc, Func_20f12
	xor a
	jp Func_20f9b

Func_20f12: ; 20f12 (8:4f12)
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_20f22
	xor a
	jp Func_20f9b

Func_20f22: ; 20f22 (8:4f22)
	ld a, $64
	call Func_2034d
	ld e, a
	ld d, $0
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	call CompareHLtoDE
	jp nc, Func_20f5e
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $2
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $5f
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	ld a, $1
	jp Func_20f9b

Func_20f5e: ; 20f5e (8:4f5e)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	ld de, $32
	call CompareHLtoDE
	jp c, Func_20f7c
	ld a, $64
	call Func_2034d
	cp $46
	jp nc, Func_20f7c
	xor a
	jp Func_20f9b

Func_20f7c: ; 20f7c (8:4f7c)
	call Func_20d3a
	cp $ff
	jp nz, Func_20f88
	xor a
	jp Func_20f9b

Func_20f88: ; 20f88 (8:4f88)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus8
	ld de, $5f
	add hl, de
	ld [hl], a
	ld a, $1
Func_20f9b: ; 20f9b (8:4f9b)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_20fa1: ; 20fa1
	dr $20fa1, $20fa2

Data_20fa2: ; 20fa2
	dr $20fa2, $20fa4

Data_20fa4: ; 20fa4
	dr $20fa4, $20fa7

Data_20fa7: ; 20fa7
	dr $20fa7, $20fab

Data_20fab: ; 20fab
	dr $20fab, $20fb0

Data_20fb0: ; 20fb0
	dr $20fb0, $20fb6

Data_20fb6: ; 20fb6
	dr $20fb6, $20fbd

Data_20fbd: ; 20fbd
	dr $20fbd, $20fc5

Pointers_20fc5:
	dw Data_20fa1
	dw Data_20fa2
	dw Data_20fa4
	dw Data_20fa7
	dw Data_20fab
	dw Data_20fb0
	dw Data_20fb6
	dw Data_20fbd

Func_20fd5:
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlus7
	call ReadHalfWordAt
	dw wc2e6
.asm_20ff0
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus5
	call GetHLAtSPPlus5
	ld de, $75
	add hl, de
.asm_20fff
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	call GetHLAtSPPlus5
	ld de, $6f
.asm_21008
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	jp z, Func_21020
	ld hl, sp+$0
	ld [hl], $18
Func_21020: ; 21020 (8:5020)
	ld hl, sp+$0
	ld a, [hl]
	cp $a
	jp z, Func_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, Func_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, Func_2104a
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, Func_21056
	ld a, $64
	call Func_2034d
	cp $3c
	jp nc, Func_21056
Func_2104a: ; 2104a (8:504a)
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $ff
	jp Func_2114d

Func_21056: ; 21056 (8:5056)
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp nz, Func_21073
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus5
	ld de, $5f
	add hl, de
	ld [hl], $0
	jp Func_2114d

Func_21073: ; 21073 (8:5073)
	call Func_20e75
	or a
	jp z, Func_2107d
	jp Func_2114d

Func_2107d: ; 2107d (8:507d)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $13
	add hl, bc
	ld a, [hl]
	ld hl, $13
	add hl, de
	cp [hl]
	jp c, Func_210af
	ld hl, sp+$2
	ld [hl], $1
	jp Func_210bc

Func_210af: ; 210af (8:50af)
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld hl, $13
	add hl, bc
	sub [hl]
	ld hl, sp+$2
	ld [hl], a
Func_210bc: ; 210bc (8:50bc)
	ld a, $64
	call Func_2034d
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_210de
	call GetHLAtSPPlus7
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_210de
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $3
	jp Func_2114d

Func_210de: ; 210de (8:50de)
	call GetHLAtSPPlus5
	inc hl
	inc hl
	inc hl
	inc hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld [hl], $1
Func_210ed: ; 210ed (8:50ed)
	ld hl, sp+$2
	ld a, [hl]
	cp $8
	jp nc, Func_2110b
	ld a, [de]
	or a
	jp nz, Func_210fd
	jp Func_2110b

Func_210fd: ; 210fd (8:50fd)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	inc de
	inc de
	inc de
	inc de
	jp Func_210ed

Func_2110b: ; 2110b (8:510b)
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_20fc5 - 2
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	ld a, $64
	call Func_2034d
	ld e, a
	ld hl, sp+$3
	ld [hl], $0
	pop bc
Func_21124: ; 21124 (8:5124)
	ld a, [bc]
	ld l, a
	ld a, e
	cp l
	jp nc, Func_2112e
	jp Func_21139

Func_2112e: ; 2112e (8:512e)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	inc bc
	jp Func_21124

Func_21139: ; 21139 (8:5139)
	call GetHLAtSPPlus5
	ld de, $5e
	add hl, de
	ld [hl], $0
	ld hl, sp+$1
	ld a, [hl]
	call GetHLAtSPPlus5
	ld de, $5f
	add hl, de
	ld [hl], a
Func_2114d: ; 2114d (8:514d)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_21152:
	dr $21152, $21160

Func_21160: ; 21160 (8:5160)
	callba_hli Func_d767
	ld de, $130d
	ld hl, $5
	call Func_2036d
	callba_hli Func_5d113
	call Func_20398
	ld a, [wSystemType]
	cp $1
	jp z, Func_21198
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_211e1
Func_21198: ; 21198 (8:5198)
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call Func_2041b
	set_farcall_addrs_hli Func_62a3
	ld bc, $0
	ld de, $1311
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ld c, $1
	ld de, $e
	ld hl, Data_21152
	call Func_2a79
	ld a, [wLCDC]
	ld [rLCDC], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp Func_211fa

Func_211e1: ; 211e1 (8:51e1)
	ld a, [wSystemType]
	cp $11
	jp nz, Func_211ee
	ld a, $2
	ld [wOAM26VTile], a
Func_211ee: ; 211ee (8:51ee)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_211fa: ; 211fa (8:51fa)
	ret

Func_211fb: ; 211fb (8:51fb)
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus8
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$1
	ld a, [hSRAMBank]
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_2133c
	push bc
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_2126c
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, Func_212cb
Func_2126c: ; 2126c (8:526c)
	ld c, $1
	call GetHLAtSPPlus8
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_20304
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	ld c, [hl]
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_212c2
	ld a, c
	cp $ab
	jp c, Func_212c2
	ld a, c
	cp $af
	jp nc, Func_212c2
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld l, c
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, ($b29f - $351 * $ab) & $ffff
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $351
	ld c, $1
	call Func_20304
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
Func_212c2: ; 212c2 (8:52c2)
	call GetHLAtSPPlus10
	ld de, $5e
	add hl, de
	ld [hl], $ff
Func_212cb: ; 212cb (8:52cb)
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, Func_212e0
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $2
	jp nz, Func_21339
Func_212e0: ; 212e0 (8:52e0)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_202f0
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_212ff
	ld hl, sp+$0
	ld [hl], $1
Func_212ff: ; 212ff (8:52ff)
	push bc
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld e, [hl]
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_21332
	ld a, e
	cp $ab
	jp c, Func_21332
	ld a, e
	cp $af
	jp nc, Func_21332
	ld c, $1
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $351
	call Func_202f0
Func_21332: ; 21332 (8:5332)
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
Func_21339: ; 21339 (8:5339)
	jp Func_21422

Func_2133c: ; 2133c (8:533c)
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, Func_21350
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $2
	jp nz, Func_213a9
Func_21350: ; 21350 (8:5350)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_202f0
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_2136f
	ld hl, sp+$0
	ld [hl], $1
Func_2136f: ; 2136f (8:536f)
	push bc
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld e, [hl]
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_213a2
	ld a, e
	cp $ab
	jp c, Func_213a2
	ld a, e
	cp $af
	jp nc, Func_213a2
	ld c, $1
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $351
	call Func_202f0
Func_213a2: ; 213a2 (8:53a2)
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
Func_213a9: ; 213a9 (8:53a9)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_213c3
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, Func_21422
Func_213c3: ; 213c3 (8:53c3)
	ld c, $1
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_20304
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld c, [hl]
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_21419
	ld a, c
	cp $ab
	jp c, Func_21419
	ld a, c
	cp $af
	jp nc, Func_21419
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld l, c
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, ($b29f - $351 * $ab) & $ffff
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $351
	ld c, $1
	call Func_20304
	ld hl, sp+$1
	ld a, [hl]
	call GetSRAMBank
Func_21419: ; 21419 (8:5419)
	call GetHLAtSPPlus8
	ld de, $5e
	add hl, de
	ld [hl], $ff
Func_21422: ; 21422 (8:5422)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, Func_2143c
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $6
	call FarCall
Func_2143c: ; 2143c (8:543c)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_21441: ; 21441 (8:5441)
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_2152f
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	xor a
	ld c, $3
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	push bc
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld hl, $c6
	add hl, bc
	ld [hl], a
	push af
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	set_farcall_addrs_hli Func_dbf5
	pop af
	push af
	ld e, a
	xor a
	ld c, $0
	call FarCall
	pop af
	pop bc
	push bc
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $75
	add hl, bc
	ld [hl], a
	call GetHLAtSPPlus4
	ld de, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $5
	call FarCall
	pop bc
Func_2152f: ; 2152f (8:552f)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_2155a
	ld e, c
	ld d, b
	ld hl, $c8
	ld c, $1
	call Func_20304
	ld c, $1
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, $c8
	call Func_202f0
	jp Func_21573

Func_2155a: ; 2155a (8:555a)
	push bc
	ld c, $1
	call GetHLAtSPPlus6
	push de
	push hl
	pop de
	pop hl
	ld hl, $c8
	call Func_202f0
	pop de
	ld hl, $c8
	ld c, $1
	call Func_20304
Func_21573: ; 21573 (8:5573)
	call Func_211fb
	pop hl
	push hl
	ld de, $2f
	add hl, de
	pop de
	push hl
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	pop hl
	push hl
	ld de, $22
	add hl, de
	ld [hl], a
	call Func_21160
	pop bc
	pop bc
	ret

Func_21593:
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	ld [hl], $0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_215b1
	ld hl, sp+$1
	ld [hl], $1
	jp Func_215b5

Func_215b1: ; 215b1 (8:55b1)
	ld hl, sp+$1
	ld [hl], $0
Func_215b5: ; 215b5 (8:55b5)
	ld e, $0
Func_215b7: ; 215b7 (8:55b7)
	ld a, e
	cp $2
	jp nc, Func_216cd
	push de
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus9
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_215f8
	ld hl, $0
	jp Func_215fb

Func_215f8: ; 215f8 (8:55f8)
	ld hl, $2f
Func_215fb: ; 215fb (8:55fb)
	add hl, de
	call WriteHLToSPPlus7
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $6
	jp z, Func_21634
	cp $4
	jp nz, Func_216b5
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_21631
	ld a, $64
	call Func_2034d
	cp $32
	jp nc, Func_21631
	ld hl, sp+$4
	ld [hl], $fe
Func_21631: ; 21631 (8:5631)
	jp Func_216b5

Func_21634: ; 21634 (8:5634)
	ld a, $64
	call Func_2034d
	ld c, a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_2169e
	ld a, c
	cp $14
	jp nc, Func_21654
	ld hl, sp+$4
	ld [hl], $0
	call GetHLAtSPPlus9
	ld de, $5f
	add hl, de
	ld [hl], $0
Func_21654: ; 21654 (8:5654)
	ld a, c
	cp $28
	jp nc, Func_21661
	ld hl, sp+$4
	ld [hl], $ff
	jp Func_2169e

Func_21661: ; 21661 (8:5661)
	ld a, c
	cp $46
	jp nc, Func_2166e
	ld hl, sp+$4
	ld [hl], $fe
	jp Func_2169e

Func_2166e: ; 2166e (8:566e)
	ld a, c
	cp $50
	jp nc, Func_2168d
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld [hl], $9
	ld a, [hl]
	call GetHLAtSPPlus7
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $1
	jp Func_2169e

Func_2168d: ; 2168d (8:568d)
	ld a, c
	cp $55
	jp nc, Func_2169a
	ld hl, sp+$4
	ld [hl], $3
	jp Func_2169e

Func_2169a: ; 2169a (8:569a)
	ld hl, sp+$4
	ld [hl], $fd
Func_2169e: ; 2169e (8:569e)
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp z, Func_216b5
	call GetHLAtSPPlus9
	ld de, $5f
	add hl, de
	ld [hl], $0
Func_216b5: ; 216b5 (8:56b5)
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$1
	ld a, [hl]
	xor $1
	ld hl, sp+$1
	ld [hl], a
	jp Func_215b7

Func_216cd: ; 216cd (8:56cd)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, Func_216d7
	call Func_21160
Func_216d7: ; 216d7 (8:56d7)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_216dc:
	ds 6

Func_216e2: ; 216e2 (8:56e2)
	push bc
	push bc
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlusParam8
	db $0e
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_216dc
	ld bc, $6
	call MemCopy
	pop de
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, Func_21744
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $fc
	jp nz, Func_21820
Func_21744: ; 21744 (8:5744)
	push de
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	ld a, $1
	ld c, $6
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	pop de
	push bc
	push de
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $0e
	ld de, $b
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$b
	ld [hl], $5
	pop de
	push af
	ld l, e
	ld h, d
	ld a, $fe
	and [hl]
	ld [hl], a
	inc de
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop af
	pop bc
	push af
	push bc
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop bc
	pop af
	push af
	ld hl, $c6
	add hl, bc
	ld [hl], a
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	add $4
	ld b, a
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlus10
	or [hl]
	ld [hl], a
	set_farcall_addrs_hli Func_d7f5
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld a, $3
	call FarCall
Func_21820: ; 21820 (8:5820)
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_218dd
	push bc
	set_farcall_addrs_hli Func_dbf5
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld e, [hl]
	xor a
	ld c, $3
	call FarCall
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $71
	add hl, bc
	ld bc, $11
	call MemCopy
	pop bc
	push bc
	ld hl, $5f
	add hl, bc
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	push af
	ld hl, sp+$7
	ld [hl], $2
	ld hl, $71
	add hl, bc
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $82
	add hl, bc
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop af
	push af
	ld b, a
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlusParam8
	db $0c
	or [hl]
	ld [hl], a
	pop af
	pop bc
	push bc
	ld hl, $c6
	add hl, bc
	ld [hl], a
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_d7f5
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld a, $2
	call FarCall
	pop bc
	ld hl, $5e
	add hl, bc
	ld [hl], $ff
Func_218dd: ; 218dd (8:58dd)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_218e2:
	add sp, -$46
	xor a
	ld hl, sp+$44
	ld [hl], a
Func_218e8: ; 218e8 (8:58e8)
	cp $4
	jp nc, Func_21912
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3e
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_218e8

Func_21912: ; 21912 (8:5912)
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2016b
	call CopyUntilNull
	ld hl, sp+$44
	ld e, [hl]
	ld hl, sp+$3c
	call Func_203fa
	add sp, $46
	ret

Func_2193a:
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $1
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	pop de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_21a35
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, Func_219b7
	ld hl, sp+$4
	ld [hl], $1
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c9b8
	ld c, $0
Func_21988: ; 21988 (8:5988)
	ld a, c
	cp $4
	jp nc, Func_219b0
	ld a, [de]
	or a
	jp z, Func_219a4
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_219a4
	ld hl, sp+$6
	ld [hl], $0
	jp Func_219b0

Func_219a4: ; 219a4 (8:59a4)
	inc c
	ld hl, $23
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_21988

Func_219b0: ; 219b0 (8:59b0)
	pop af
	call GetSRAMBank
	jp Func_219bb

Func_219b7: ; 219b7 (8:59b7)
	ld hl, sp+$4
	ld [hl], $0
Func_219bb: ; 219bb (8:59bb)
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_20304
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_219d6
	ld a, $2
	jp Func_21b0a

Func_219d6: ; 219d6 (8:59d6)
	push bc
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_202f0
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_219f2
	ld a, $1
	jp Func_21b0a

Func_219f2: ; 219f2 (8:59f2)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, Func_21a32
	ld hl, sp+$2
	ld [hl], $1
Func_21a08: ; 21a08 (8:5a08)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, Func_21a2f
	call Func_21160
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld de, $5f
	add hl, de
	ld a, [wc2e8 + 1]
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $0
	jp Func_21a32

Func_21a2f: ; 21a2f (8:5a2f)
	jp Func_21a08

Func_21a32: ; 21a32 (8:5a32)
	jp Func_21afb

Func_21a35: ; 21a35 (8:5a35)
	push bc
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_202f0
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_21a51
	ld a, $1
	jp Func_21b0a

Func_21a51: ; 21a51 (8:5a51)
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, Func_21a9c
	ld hl, sp+$4
	ld [hl], $1
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c9b8
	ld c, $0
Func_21a6d: ; 21a6d (8:5a6d)
	ld a, c
	cp $4
	jp nc, Func_21a95
	ld a, [de]
	or a
	jp z, Func_21a89
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_21a89
	ld hl, sp+$6
	ld [hl], $0
	jp Func_21a95

Func_21a89: ; 21a89 (8:5a89)
	inc c
	ld hl, $23
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_21a6d

Func_21a95: ; 21a95 (8:5a95)
	pop af
	call GetSRAMBank
	jp Func_21aa0

Func_21a9c: ; 21a9c (8:5a9c)
	ld hl, sp+$4
	ld [hl], $0
Func_21aa0: ; 21aa0 (8:5aa0)
	ld c, $1
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_20304
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_21abb
	ld a, $2
	jp Func_21b0a

Func_21abb: ; 21abb (8:5abb)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, Func_21afb
	ld hl, sp+$2
	ld [hl], $1
Func_21ad1: ; 21ad1 (8:5ad1)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, Func_21af8
	call Func_21160
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld de, $5f
	add hl, de
	ld a, [wc2e8 + 1]
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $0
	jp Func_21afb

Func_21af8: ; 21af8 (8:5af8)
	jp Func_21ad1

Func_21afb: ; 21afb (8:5afb)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $142
	add hl, de
	ld [hl], $ff
	call Func_21441
	xor a
Func_21b0a: ; 21b0a (8:5b0a)
	pop bc
	pop bc
	ret

Func_21b0d:
	push bc
	push bc
	push bc
	ld hl, sp+$4
	ld [hl], $1
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	pop de
	push hl
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	jp z, Func_21bc0
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c9b8
	ld c, $0
Func_21b54: ; 21b54 (8:5b54)
	ld a, c
	cp $4
	jp nc, Func_21b7c
	ld a, [de]
	or a
	jp z, Func_21b70
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_21b70
	ld hl, sp+$6
	ld [hl], $0
	jp Func_21b7c

Func_21b70: ; 21b70 (8:5b70)
	inc c
	ld hl, $23
	add hl, de
	push de
	push hl
	pop de
	pop hl
	jp Func_21b54

Func_21b7c: ; 21b7c (8:5b7c)
	pop af
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_21b8d
	ld hl, sp+$4
	ld a, [hl]
	jp Func_21bc1

Func_21b8d: ; 21b8d (8:5b8d)
	ld hl, $0
	call Func_21bc5
	ld a, l
	or h
	jp nz, Func_21bb2
	call Func_21160
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld a, [wc2e8 + 1]
	ld [hl], a
	jp Func_21bb5

Func_21bb2: ; 21bb2 (8:5bb2)
	jp Func_21b8d

Func_21bb5: ; 21bb5 (8:5bb5)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld [hl], $ff
	call Func_216e2
Func_21bc0: ; 21bc0 (8:5bc0)
	xor a
Func_21bc1: ; 21bc1 (8:5bc1)
	pop bc
	pop bc
	pop bc
	ret

Func_21bc5: ; 21bc5 (8:5bc5)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_5e504
	ld de, $0
	ld a, $1
	call FarCall
	ret

Func_21bf5:
	push af
	ld hl, -$114
	add hl, sp
	ld sp, hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam16
	dw $0113
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam16
	dw $0111
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c5
	add hl, de
	ld a, [hl]
	cp $b
	jp z, Func_21c4b
	cp $a
	jp z, Func_21c3d
	cp $9
	jp nz, Func_21c51
	ld hl, $115
	add hl, sp
	ld [hl], $5
	jp Func_21c51

Func_21c3d: ; 21c3d (8:5c3d)
	ld hl, $115
	add hl, sp
	ld a, [hl]
	add a
	ld hl, $115
	add hl, sp
	ld [hl], a
	jp Func_21c51

Func_21c4b: ; 21c4b (8:5c4b)
	ld hl, $115
	add hl, sp
	ld [hl], $1
Func_21c51: ; 21c51 (8:5c51)
	xor a
Func_21c52: ; 21c52 (8:5c52)
	cp $a
	jp nc, Func_21c7e
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$31
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fc
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_21c52

Func_21c7e: ; 21c7e (8:5c7e)
	ld hl, $f9
	add hl, sp
	ld [hl], $0
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_200fd
	call CopyUntilNull
	push de
	push hl
	pop de
	pop hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call Func_20d35
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call CopyUntilNull
	ld hl, $10e
	add hl, sp
	ld [hl], $0
Func_21cde: ; 21cde (8:5cde)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_21d47
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$c
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	db $2b
	ld c, l
	ld b, h
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_21d11
	jp Func_21d39

Func_21d11: ; 21d11 (8:5d11)
	push bc
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call Func_236f
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_21d33
	call GetHLAtSPPlus5
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp c, Func_21d36
Func_21d33: ; 21d33 (8:5d33)
	jp Func_21d39

Func_21d36: ; 21d36 (8:5d36)
	jp Func_21d47

Func_21d39: ; 21d39 (8:5d39)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $10e
	add hl, sp
	ld [hl], a
	jp Func_21cde

Func_21d47: ; 21d47 (8:5d47)
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, Func_21d74
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2015d
	call CopyUntilNull
Func_21d74: ; 21d74 (8:5d74)
	ld hl, $f9
	add hl, sp
	ld e, [hl]
	ld hl, $fa
	add hl, sp
	call Func_203fa
	call Func_20398
	ld hl, $10e
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, Func_21d90
	jp Func_21f1c

Func_21d90: ; 21d90 (8:5d90)
	ld de, Data_21f22
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp z, Func_21dbb
	jp Func_21f1c

Func_21dbb: ; 21dbb (8:5dbb)
	set_farcall_addrs_hli Func_5e504
	ld hl, $115
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld a, $3
	call FarCall
	push hl
	call Func_21160
	pop hl
	ld a, l
	and h
	inc a
	jp nz, Func_21de0
	jp Func_21d90

Func_21de0: ; 21de0 (8:5de0)
	set_farcall_addrs_hli Func_6b94
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call FarCall
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$e
	push de
	push hl
	pop de
	pop hl
	ld a, [wc2e8 + 1]
	call FarCall
	ld hl, sp+$e
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call Func_236f
	call GetHLAtSPPlus7
	call WriteHLToSPPlusParam8
	db $33
	pop bc
	ld a, [wc2e8 + 1]
	call GetHLAtSPPlusParam16
	dw $0111
	ld de, $c6
	add hl, de
	cp [hl]
	jp nz, Func_21e63
	call GetHLAtSPPlusParam16
	dw $0113
	ld de, $29
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_21e63: ; 21e63 (8:5e63)
	call GetHLAtSPPlusParam8
	db $31
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_21e76
	jp Func_21f1c

Func_21e76: ; 21e76 (8:5e76)
	call GetHLAtSPPlusParam8
	db $31
	push hl
	call GetHLAtSPPlusParam16
	dw $0115
	ld de, $29
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_6ebf
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $33
	pop de
	call FarCall
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$c
	push de
	push hl
	pop de
	pop hl
	ld a, [wc2e8 + 1]
	call FarCall
	ld hl, $f9
	add hl, sp
	ld [hl], $0
	ld hl, sp+$d
	push hl
	ld hl, $fb
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fb
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fc
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_20102
	call CopyUntilNull
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $fa
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2011d
	call CopyUntilNull
	ld hl, $f9
	add hl, sp
	ld e, [hl]
	ld hl, $fa
	add hl, sp
	call Func_203fa
Func_21f1c: ; 21f1c (8:5f1c)
	ld hl, $116
	add hl, sp
	ld sp, hl
	ret

Data_21f22:
	db "<HIRA>たへﾞさせますか?<KATA>", $00

Func_21f2e:
	push af
	ld hl, rNR21
	add hl, sp
	ld sp, hl
	xor a
Func_21f35: ; 21f35 (8:5f35)
	cp $a
	jp nc, Func_21f61
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d8
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_21f35

Func_21f61: ; 21f61 (8:5f61)
	ld hl, $d5
	add hl, sp
	ld [hl], $0
	ld hl, $eb
	add hl, sp
	ld e, [hl]
	ld hl, sp+$0
	call Func_24bb
	ld hl, sp+$0
	push hl
	ld hl, $d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call CopyUntilNull
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $eb
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli Func_5a149
	ld c, $0
	ld e, $1
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_21ff6
	set_farcall_addrs_hli Func_5a149
	ld c, $2
	ld e, $1
	ld hl, $eb
	add hl, sp
	ld a, [hl]
	call FarCall
Func_21ff6: ; 21ff6 (8:5ff6)
	cp $ff
	jp nz, Func_2201e
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20124
	call CopyUntilNull
Func_2201e: ; 2201e (8:601e)
	ld hl, $d5
	add hl, sp
	ld e, [hl]
	ld hl, $d6
	add hl, sp
	call Func_203fa
	ld hl, $ec
	add hl, sp
	ld sp, hl
	ret

Func_22030:
	push af
	ld hl, -$f6
	add hl, sp
	ld sp, hl
	xor a
Func_22037: ; 22037 (8:6037)
	cp $a
	jp nc, Func_22063
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$18
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $e3
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_22037

Func_22063: ; 22063 (8:6063)
	ld hl, $e0
	add hl, sp
	ld [hl], $0
	ld hl, $f7
	add hl, sp
	ld e, [hl]
	ld hl, sp+$0
	call Func_241f
	ld hl, sp+$0
	push hl
	ld hl, $e2
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e2
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $e3
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld hl, $e0
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e0
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $e1
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call CopyUntilNull
	ld hl, BankSwitch_00f7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, BankSwitch_00f7
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli Func_4ed70
	ld e, $0
	ld hl, BankSwitch_00f7
	add hl, sp
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_220f4
	set_farcall_addrs_hli Func_4ed70
	ld e, $2
	ld hl, BankSwitch_00f7
	add hl, sp
	ld a, [hl]
	call FarCall
Func_220f4: ; 220f4 (8:60f4)
	cp $ff
	jp nz, Func_2211c
	ld hl, $e0
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e0
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $e1
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20124
	call CopyUntilNull
Func_2211c: ; 2211c (8:611c)
	ld hl, $e0
	add hl, sp
	ld e, [hl]
	ld hl, $e1
	add hl, sp
	call Func_203fa
	ld hl, $f8
	add hl, sp
	ld sp, hl
	ret

Func_2212e:
	push hl
	ld hl, -$e4
	add hl, sp
	ld sp, hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	ld hl, $b
	add hl, bc
	call WriteHLToSPPlusParam8
	db $e3
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c5
	add hl, de
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc c
	dec c
	jp nz, Func_22166
	ld c, $1
Func_22166: ; 22166 (8:6166)
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $e1
	xor a
Func_2216e: ; 2216e (8:616e)
	cp c
	jp nc, Func_22196
	push bc
	call GetHLAtSPPlusParam8
	db $e7
	inc hl
	inc hl
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $e3
	add hl, bc
	call WriteHLToSPPlusParam8
	db $e3
	inc a
	call GetHLAtSPPlusParam8
	db $e7
	ld de, $7
	add hl, de
	call WriteHLToSPPlusParam8
	db $e7
	pop bc
	jp Func_2216e

Func_22196: ; 22196 (8:6196)
	call GetHLAtSPPlusParam8
	db $e1
	push hl
	call GetHLAtSPPlusParam8
	db $ea
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	call WriteHLToSPPlusParam8
	db $e3
	pop af
	cp $e
	jp z, Func_221e2
	cp $d
	jp z, Func_221d6
	cp $c
	jp nz, Func_221f0
	call GetHLAtSPPlusParam8
	db $e1
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $e1
	add hl, bc
	call WriteHLToSPPlusParam8
	db $e1
	jp Func_221f0

Func_221d6: ; 221d6 (8:61d6)
	call GetHLAtSPPlusParam8
	db $e1
	add hl, hl
	call WriteHLToSPPlusParam8
	db $e1
	jp Func_221f0

Func_221e2: ; 221e2 (8:61e2)
	call GetHLAtSPPlusParam8
	db $e1
	ld de, $2
	call DivideHLByDESigned
	call WriteHLToSPPlusParam8
	db $e1
Func_221f0: ; 221f0 (8:61f0)
	call GetHLAtSPPlusParam8
	db $e1
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_2220b
	ld hl, $1
	call WriteHLToSPPlusParam8
	db $e1
	jp Func_22223

Func_2220b: ; 2220b (8:620b)
	call GetHLAtSPPlusParam8
	db $e1
	push de
	push hl
	pop de
	pop hl
	ld hl, 9990
	call CompareHLtoDE
	jp nc, Func_22223
	ld hl, 9990
	call WriteHLToSPPlusParam8
	db $e1
Func_22223: ; 22223 (8:6223)
	xor a
Func_22224: ; 22224 (8:6224)
	cp $a
	jp nc, Func_22250
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $cb
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_22224

Func_22250: ; 22250 (8:6250)
	ld hl, $c8
	add hl, sp
	ld [hl], $0
	ld hl, $c8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $c8
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, Func_00c9
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $e3
	pop de
	call Func_20d35
	ld de, Text_20104
	call CopyUntilNull
	ld de, Text_20116
	call CopyUntilNull
	ld hl, $c8
	add hl, sp
	ld e, [hl]
	ld hl, Func_00c9
	add hl, sp
	call Func_203fa
	push hl
	push hl
	call GetHLAtSPPlusParam8
	db $e5
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_222a3
	dec bc
.asm_222a3
	push bc
	push hl
	call Func_277c
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $e6
	add hl, sp
	ld sp, hl
	ret

Data_222b2:
	dr $222b2, $222b7

Func_222b7: ; 222b7 (8:62b7)
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $28
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4001
	add hl, de
	call WriteHLToSPPlus5
	ld hl, $28
	add hl, bc
	ld a, [hl]
	cp $15
	jp c, Func_22304
	ld hl, $28
	add hl, bc
	ld [hl], $0
	ld hl, $28
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4001
	add hl, de
	call WriteHLToSPPlus5
Func_22304: ; 22304 (8:6304)
	ld a, $64
	call Func_2034d
	ld hl, sp+$2
	ld [hl], a
	ld c, $0
Func_2230e: ; 2230e (8:630e)
	ld a, c
	cp $5
	jp nc, Func_22329
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus5
	ld e, c
	ld d, $0
	add hl, de
	cp [hl]
	jp nc, Func_22325
	jp Func_22329

Func_22325: ; 22325 (8:6325)
	inc c
	jp Func_2230e

Func_22329: ; 22329 (8:6329)
	ld e, c
	ld d, $0
	ld hl, Data_222b2
	add hl, de
	ld c, [hl]
	ld a, [$c2fa]
	cp $2
	jp nz, Func_2234d
	push bc
	set_farcall_addrs_hli Func_6c11d
	pop bc
	ld a, c
	call FarCall
	jp Func_22351

Func_2234d: ; 2234d (8:634d)
	ld a, c
	call Func_21bf5
Func_22351: ; 22351 (8:6351)
	ld a, $64
	call Func_2034d
	cp $28
	jp nc, Func_223a3
	ld a, $64
	call Func_2034d
	ld hl, sp+$2
	ld [hl], a
	ld c, $0
Func_22365: ; 22365 (8:6365)
	ld a, c
	cp $2
	jp nc, Func_22384
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus5
	ld de, $8
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	cp [hl]
	jp nc, Func_22380
	jp Func_22384

Func_22380: ; 22380 (8:6380)
	inc c
	jp Func_22365

Func_22384: ; 22384 (8:6384)
	call GetHLAtSPPlus5
	ld de, $5
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld c, [hl]
	ld a, c
	and $80
	jp nz, Func_2239d
	ld a, c
	call Func_21f2e
	jp Func_223a3

Func_2239d: ; 2239d (8:639d)
	ld a, c
	and $7f
	call Func_22030
Func_223a3: ; 223a3 (8:63a3)
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_223b5
	call GetHLAtSPPlus3
	call Func_2212e
Func_223b5: ; 223b5 (8:63b5)
	pop bc
	pop bc
	ret

Func_223b8: ; 223b8 (8:63b8)
	ld hl, -$13a
	add hl, sp
	ld sp, hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlusParam16
	dw $011f
	call GetHLAtSPPlusParam16
	dw $011f
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c5
	add hl, de
	ld a, [hl]
	push af
	ld hl, $0
	call WriteHLToSPPlusParam16
	dw $011e
	xor a
Func_223f1: ; 223f1 (8:63f1)
	cp $a
	jp nc, Func_2241d
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $124
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_223f1

Func_2241d: ; 2241d (8:641d)
	xor a
	call GetHLAtSPPlusParam16
	dw $0121
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	inc l
	dec l
	jp nz, Func_2242e
	ld l, $1
Func_2242e: ; 2242e (8:642e)
	ld e, $0
Func_22430: ; 22430 (8:6430)
	ld a, e
	cp l
	jp nc, Func_2248c
	push hl
	push de
	push bc
	ld a, [bc]
	ld e, a
	ld hl, $f3
	add hl, sp
	call Func_236f
	ld hl, $f8
	add hl, sp
	ld a, [hl]
	cp $8
	jp nc, Func_22450
	ld a, $4
	jp Func_22461

Func_22450: ; 22450 (8:6450)
	ld hl, $f8
	add hl, sp
	ld a, [hl]
	cp $b
	jp nc, Func_2245f
	ld a, $3
	jp Func_22461

Func_2245f: ; 2245f (8:645f)
	ld a, $2
Func_22461: ; 22461 (8:6461)
	pop bc
	pop de
	push bc
	push de
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam16
	dw $0124
	add hl, bc
	call WriteHLToSPPlusParam16
	dw $0124
	pop de
	inc e
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	jp Func_22430

Func_2248c: ; 2248c (8:648c)
	pop af
	cp $11
	jp z, Func_224c5
	cp $10
	jp z, Func_224b7
	cp $f
	jp nz, Func_224d5
	call GetHLAtSPPlusParam16
	dw $011c
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam16
	dw $011c
	add hl, bc
	call WriteHLToSPPlusParam16
	dw $011c
	jp Func_224d5

Func_224b7: ; 224b7 (8:64b7)
	call GetHLAtSPPlusParam16
	dw $011c
	add hl, hl
	call WriteHLToSPPlusParam16
	dw $011c
	jp Func_224d5

Func_224c5: ; 224c5 (8:64c5)
	call GetHLAtSPPlusParam16
	dw $011c
	ld de, $2
	call DivideHLByDESigned
	call WriteHLToSPPlusParam16
	dw $011c
Func_224d5: ; 224d5 (8:64d5)
	ld c, $0
	ld hl, $138
	add hl, sp
	ld [hl], c
Func_224dc: ; 224dc (8:64dc)
	ld a, c
	cp $4
	jp nc, Func_2253a
	push bc
	set_farcall_addrs_hli Func_6b55
	pop bc
	push bc
	ld a, c
	ld hl, $ca
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop bc
	call GetHLAtSPPlusParam8
	db $d6
	ld a, l
	or h
	jp z, Func_2250f
	ld hl, $c8
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_22512
Func_2250f: ; 2250f (8:650f)
	jp Func_22536

Func_22512: ; 22512 (8:6512)
	ld b, c
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlusParam16
	dw $011f
	and [hl]
	jp z, Func_22536
	ld hl, $138
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $138
	add hl, sp
	ld [hl], a
	dec a
	ld e, a
	ld d, $0
	ld hl, $134
	add hl, sp
	add hl, de
	ld [hl], c
Func_22536: ; 22536 (8:6536)
	inc c
	jp Func_224dc

Func_2253a: ; 2253a (8:653a)
	ld hl, $138
	add hl, sp
	ld l, [hl]
	ld h, $0
	push hl
	call GetHLAtSPPlusParam16
	dw $011e
	pop de
	call DivideHLByDESigned
	call WriteHLToSPPlusParam16
	dw $011c
	ld a, l
	or h
	jp nz, Func_2255d
	ld hl, $1
	call WriteHLToSPPlusParam16
	dw $011c
Func_2255d: ; 2255d (8:655d)
	ld e, $0
Func_2255f: ; 2255f (8:655f)
	ld a, e
	ld hl, $138
	add hl, sp
	cp [hl]
	jp nc, Func_228c5
	push de
	ld hl, $11e
	add hl, sp
	ld [hl], $0
	call GetHLAtSPPlusParam16
	dw $011e
	ld c, l
	ld b, h
	pop de
	push bc
	push de
	set_farcall_addrs_hli Func_6b55
	pop de
	push de
	ld d, $0
	ld hl, $138
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $cc
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop de
	pop bc
	ld hl, $cf
	add hl, sp
	ld a, [hl]
	cp $63
	jp c, Func_225a8
	jp Func_228c1

Func_225a8: ; 225a8 (8:65a8)
	push de
	push bc
	ld hl, $123
	add hl, sp
	ld [hl], $0
	ld hl, $cd
	add hl, sp
	push hl
	ld hl, $125
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $125
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $126
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_20102
	call CopyUntilNull
	pop bc
	push bc
	ld hl, $123
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $123
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $124
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	call Func_20d35
	ld de, Text_20134
	call CopyUntilNull
	ld hl, $123
	add hl, sp
	ld e, [hl]
	ld hl, $124
	add hl, sp
	call Func_203fa
	pop bc
	call GetHLAtSPPlusParam8
	db $e0
	add hl, bc
	call WriteHLToSPPlusParam8
	db $e0
	ld hl, $ca
	add hl, sp
	ld a, [hl]
	dec a
	ld e, a
	ld hl, $ed
	add hl, sp
	call Func_236f
	set_farcall_addrs_hli Func_dbe2
	ld hl, $d1
	add hl, sp
	ld e, [hl]
	ld hl, $ed
	add hl, sp
	call FarCall
	call GetHLAtSPPlusParam16
	dw $0109
	push hl
	call GetHLAtSPPlusParam8
	db $dc
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $da
	call GetHLAtSPPlusParam16
	dw $010d
	push hl
	call GetHLAtSPPlusParam8
	db $e0
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $de
	call GetHLAtSPPlusParam16
	dw $0112
	push hl
	call GetHLAtSPPlusParam8
	db $e5
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $e3
	call GetHLAtSPPlusParam16
	dw $0116
	push hl
	call GetHLAtSPPlusParam8
	db $e9
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $e7
	call GetHLAtSPPlusParam16
	dw $0114
	push hl
	call GetHLAtSPPlusParam8
	db $e7
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $e5
	ld de, $0
	ld hl, $f2
	add hl, sp
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $e0
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, Func_227d3
	push bc
	ld hl, $120
	add hl, sp
	ld [hl], $1
	ld hl, $123
	add hl, sp
	ld [hl], $0
	ld hl, $cd
	add hl, sp
	push hl
	ld hl, $125
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $125
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $126
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_20102
	call CopyUntilNull
	pop bc
Func_22701: ; 22701 (8:6701)
	call GetHLAtSPPlusParam8
	db $e0
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, Func_2279c
	ld hl, $d1
	add hl, sp
	ld a, [hl]
	cp $63
	jp nc, Func_2279c
	push bc
	ld hl, $123
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $123
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $124
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20106
	call CopyUntilNull
	push de
	push hl
	pop de
	pop hl
	ld hl, $d3
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d3
	add hl, sp
	ld [hl], a
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	call Func_20d35
	push de
	push hl
	pop de
	pop hl
	push de
	push hl
	pop de
	pop hl
	ld de, Text_2013f
	call CopyUntilNull
	push de
	push hl
	pop de
	pop hl
	ld hl, $123
	add hl, sp
	ld e, [hl]
	ld hl, $124
	add hl, sp
	call Func_203fa
	ld hl, $123
	add hl, sp
	ld [hl], $0
	pop bc
	call GetHLAtSPPlusParam8
	db $e0
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlusParam8
	db $e0
	ld de, $0
	ld hl, $f2
	add hl, sp
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	jp Func_227ab

Func_2279c: ; 2279c (8:679c)
	ld a, $17
	call Func_14fc
Func_227a1: ; 227a1 (8:67a1)
	call Func_1abe
	or a
	jp nz, Func_227a1
	jp Func_227ae

Func_227ab: ; 227ab (8:67ab)
	jp Func_22701

Func_227ae: ; 227ae (8:67ae)
	ld hl, $ca
	add hl, sp
	ld a, [hl]
	dec a
	ld e, a
	ld hl, $ed
	add hl, sp
	call Func_236f
	set_farcall_addrs_hli Func_dbe2
	ld hl, $d1
	add hl, sp
	ld e, [hl]
	ld hl, $ed
	add hl, sp
	call FarCall
Func_227d3: ; 227d3 (8:67d3)
	call GetHLAtSPPlusParam16
	dw $0109
	push hl
	call GetHLAtSPPlusParam8
	db $dc
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $da
	push de
	push hl
	pop de
	pop hl
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_227f7
	ld hl, $3e7
	call WriteHLToSPPlusParam8
	db $da
Func_227f7: ; 227f7 (8:67f7)
	call GetHLAtSPPlusParam16
	dw $010d
	push hl
	call GetHLAtSPPlusParam8
	db $e0
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $de
	push de
	push hl
	pop de
	pop hl
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_2281b
	ld hl, $3e7
	call WriteHLToSPPlusParam8
	db $de
Func_2281b: ; 2281b (8:681b)
	call GetHLAtSPPlusParam16
	dw $0112
	push hl
	call GetHLAtSPPlusParam8
	db $e5
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $e3
	push de
	push hl
	pop de
	pop hl
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_2283f
	ld hl, $3e7
	call WriteHLToSPPlusParam8
	db $e3
Func_2283f: ; 2283f (8:683f)
	call GetHLAtSPPlusParam16
	dw $0116
	push hl
	call GetHLAtSPPlusParam8
	db $e9
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $e7
	push de
	push hl
	pop de
	pop hl
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_22863
	ld hl, $3e7
	call WriteHLToSPPlusParam8
	db $e7
Func_22863: ; 22863 (8:6863)
	call GetHLAtSPPlusParam16
	dw $0114
	push hl
	call GetHLAtSPPlusParam8
	db $e7
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $e5
	push de
	push hl
	pop de
	pop hl
	ld hl, $3e7
	call CompareHLtoDE
	jp nc, Func_22887
	ld hl, $3e7
	call WriteHLToSPPlusParam8
	db $e5
Func_22887: ; 22887 (8:6887)
	ld hl, $11e
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_228a0
	call GetHLAtSPPlusParam8
	db $da
	call WriteHLToSPPlusParam8
	db $d8
	call GetHLAtSPPlusParam8
	db $de
	call WriteHLToSPPlusParam8
	db $dc
Func_228a0: ; 228a0 (8:68a0)
	set_farcall_addrs_hli Func_6b74
	pop de
	push de
	ld d, $0
	ld hl, $136
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $ca
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop de
Func_228c1: ; 228c1 (8:68c1)
	inc e
	jp Func_2255f

Func_228c5: ; 228c5 (8:68c5)
	ld hl, $13a
	add hl, sp
	ld sp, hl
	ret

Data_228cb:
	dw 10, 20, 30

Func_228d1:
	add sp, $3
	ld hl, rNR10
	add hl, sp
	ld sp, hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlusParam8
	db $f0
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	call WriteHLToSPPlusParam8
	db $f0
	call GetHLAtSPPlusParam8
	db $f2
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $f0
	ld de, $b
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	call WriteHLToSPPlusParam8
	db $ee
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlusParam8
	db $ec
	ld hl, $d2
	add hl, sp
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $ec
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $cc
	xor a
Func_22962: ; 22962 (8:6962)
	cp $a
	jp nc, Func_2298e
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d8
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_22962

Func_2298e: ; 2298e (8:698e)
	ld hl, $d5
	add hl, sp
	ld [hl], $0
	pop de
	push bc
	ld hl, $5f
	add hl, de
	ld a, [hl]
	add $b4
	ld hl, $d4
	add hl, sp
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $ee
	ld de, $9
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_229b9
	ld hl, $d2
	add hl, sp
	ld [hl], $2
	jp Func_22ae7

Func_229b9: ; 229b9 (8:69b9)
	ld hl, $ce
	add hl, sp
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $ec
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlusParam8
	db $ee
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call Func_2617
	ld hl, $ce
	add hl, sp
	ld c, l
	ld b, h
	ld de, $64
	ld hl, $ce
	add hl, sp
	call Func_1a1f
	ld hl, $ce
	add hl, sp
	ld a, [hl]
	ld hl, $cf
	add hl, sp
	ld l, [hl]
	ld h, a
	call WriteHLToSPPlusParam8
	db $ce
	call GetHLAtSPPlusParam8
	db $ce
	ld de, $64
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	call WriteHLToSPPlusParam8
	db $ce
	call GetHLAtSPPlusParam8
	db $ec
	ld de, $13
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlusParam8
	db $ce
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlusParam8
	db $ce
	ld hl, $d4
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_228cb
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam8
	db $ce
	add hl, bc
	call WriteHLToSPPlusParam8
	db $ce
	call GetHLAtSPPlusParam8
	db $ce
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_22a57
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $ce
Func_22a57: ; 22a57 (8:6a57)
	call GetHLAtSPPlusParam8
	db $f2
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	push de
	push hl
	pop de
	pop hl
	ld b, $4
	call RightShiftHL
	ld a, l
	or h
	jp z, Func_22a83
	call GetHLAtSPPlusParam8
	db $ce
	ld de, $32
	add hl, de
	call WriteHLToSPPlusParam8
	db $ce
	jp Func_22acd

Func_22a83: ; 22a83 (8:6a83)
	call GetHLAtSPPlusParam8
	db $f2
	ld de, $75
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_22acd
	call GetHLAtSPPlusParam8
	db $f2
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $4
	jp z, Func_22ab2
	cp $7
	jp nz, Func_22ac1
	call GetHLAtSPPlusParam8
	db $ce
	ld de, $1e
	add hl, de
	call WriteHLToSPPlusParam8
	db $ce
	jp Func_22acd

Func_22ab2: ; 22ab2 (8:6ab2)
	call GetHLAtSPPlusParam8
	db $ce
	ld de, $14
	add hl, de
	call WriteHLToSPPlusParam8
	db $ce
	jp Func_22acd

Func_22ac1: ; 22ac1 (8:6ac1)
	call GetHLAtSPPlusParam8
	db $ce
	ld de, $a
	add hl, de
	call WriteHLToSPPlusParam8
	db $ce
Func_22acd: ; 22acd (8:6acd)
	call GetHLAtSPPlusParam8
	db $ce
	push hl
	ld a, $64
	call Func_2034d
	ld l, a
	ld h, $0
	pop de
	call CompareHLtoDE
	jp c, Func_22ae7
	ld hl, $d2
	add hl, sp
	ld [hl], $1
Func_22ae7: ; 22ae7 (8:6ae7)
	call GetHLAtSPPlusParam8
	db $ec
	ld de, $d
	add hl, de
	push hl
	ld hl, $d7
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d7
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d8
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_2010a
	call CopyUntilNull
	ld hl, $d2
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, Func_22baa
	cp $1
	jp z, Func_22b6f
	or a
	jp nz, Func_22baa
	call GetHLAtSPPlusParam8
	db $ee
	ld de, $9
	add hl, de
	ld a, $4
	or [hl]
	ld [hl], a
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20145
	call CopyUntilNull
	set_farcall_addrs_hli Func_dd29
	ld hl, $d4
	add hl, sp
	ld a, [hl]
	call FarCall
	jp Func_22baa

Func_22b6f: ; 22b6f (8:6b6f)
	ld hl, $d5
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $d5
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, $d6
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20151
	call CopyUntilNull
	set_farcall_addrs_hli Func_dd29
	ld hl, $d4
	add hl, sp
	ld a, [hl]
	add $4
	call FarCall
	jp Func_22baa

Func_22baa: ; 22baa (8:6baa)
	ld hl, $d5
	add hl, sp
	ld e, [hl]
	ld hl, $d6
	add hl, sp
	call Func_203fa
	pop bc
	ld hl, $d0
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_22bc3
	jp Func_22cca

Func_22bc3: ; 22bc3 (8:6bc3)
	ld a, [bc]
	inc a
	ld hl, $d2
	add hl, sp
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $d1
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	call GetHLAtSPPlusParam8
	db $ca
	push de
	push hl
	pop de
	pop hl
	ld hl, $d1
	add hl, sp
	ld l, [hl]
	ld h, $0
	call FarCall
	cp $ff
	jp z, Func_22bfe
	jp Func_22cb6

Func_22bfe: ; 22bfe (8:6bfe)
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	call GetHLAtSPPlusParam8
	db $ca
	push hl
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $500
	add hl, de
	pop de
	call FarCall
	cp $ff
	jp z, Func_22c2a
	jp Func_22cb6

Func_22c2a: ; 22c2a (8:6c2a)
	call Func_3aa8
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c8
	add hl, de
	ld a, [hl]
	ld [wOAM01Attrs], a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c9
	add hl, de
	ld a, [hl]
	ld [wOAM02YCoord], a
	callba_hli Func_52d1f
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
	set_farcall_addrs_hli Func_613fc
	ld a, [wOAM02YCoord]
	ld e, a
	ld a, [wOAM01Attrs]
	call FarCall
	set_farcall_addrs_hli Func_620d5
	ld hl, $d2
	add hl, sp
	ld c, [hl]
	call GetHLAtSPPlusParam8
	db $ca
	push hl
	ld hl, $d3
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $500
	add hl, de
	pop de
	call FarCall
Func_22cb6: ; 22cb6 (8:6cb6)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $65
	add hl, de
	ld a, $10
	or [hl]
	ld [hl], a
Func_22cca: ; 22cca (8:6cca)
	ld hl, $f0
	add hl, sp
	ld sp, hl
	ret

Func_22cd0:
	push bc
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	pop de
	push hl
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $2
	jp z, Func_22d50
	call Func_20d3a
	cp $ff
	jp nz, Func_22d2b
	ld a, $5
	call Func_14fc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_22d26
	call Func_222b7
	call Func_223b8
Func_22d26: ; 22d26 (8:6d26)
	ld a, $1
	jp Func_22d60

Func_22d2b: ; 22d2b (8:6d2b)
	push af
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld [hl], $ff
	call Func_21160
	call GetHLAtSPPlus6
	ld de, $5e
	add hl, de
	ld [hl], $fc
	pop af
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld [hl], a
	call Func_216e2
	jp Func_22d5f

Func_22d50: ; 22d50 (8:6d50)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $10
	jp z, Func_22d5f
	ld a, $1
	jp Func_22d60

Func_22d5f: ; 22d5f (8:6d5f)
	xor a
Func_22d60: ; 22d60 (8:6d60)
	pop bc
	pop bc
	ret

Func_22d63: ; 22d63 (8:6d63)
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $f
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld [hl], $0
	ld a, [hl]
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $f
	add hl, de
	ld bc, $0
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

Func_22db3: ; 22db3 (8:6db3)
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	ld a, $f
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld [hl], $0
	ld a, [hl]
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $f
	add hl, de
	ld bc, $0
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

Func_22e03:
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, $5f
	add hl, de
	ld a, [hl]
	cp $32
	jp z, Func_22e3b
	cp $31
	jp z, Func_22e35
	cp $30
	jp z, Func_22e2f
	cp $2f
	jp nz, Func_22e3e
	ld bc, $14
	jp Func_22e3e

Func_22e2f: ; 22e2f (8:6e2f)
	ld bc, $32
	jp Func_22e3e

Func_22e35: ; 22e35 (8:6e35)
	ld bc, $c8
	jp Func_22e3e

Func_22e3b: ; 22e3b (8:6e3b)
	ld bc, $3e8
Func_22e3e: ; 22e3e (8:6e3e)
	ld e, c
	ld d, b
	ld a, $1
	call Func_20405
	ld c, l
	ld b, h
	ret

Func_22e48: ; 22e48 (8:6e48)
	add sp, -$16
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $16
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $12
	ld hl, sp+$f
	ld a, [wOAM04XCoord]
	inc a
	ld [hl], a
	ld hl, sp+$e
	ld [hl], $0
	ld a, [wOAM04XCoord]
	ld e, a
	ld hl, sp+$0
	call Func_24bb
	ld hl, sp+$a
	ld a, [hl]
	and $4
	jp z, Func_23137
	call GetHLAtSPPlusParam8
	db $16
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $16
	ld de, $71
	add hl, de
	ld e, c
	ld d, b
	ld bc, $11
	call MemCopy
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $14
	call GetHLAtSPPlusParam8
	db $14
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$d
	ld [hl], e
	set_farcall_addrs_hli Func_6b55
	call GetHLAtSPPlusParam8
	db $12
	ld de, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [wc2e8 + 1]
	call FarCall
	set_farcall_addrs_hli Func_5c6e3
	call GetHLAtSPPlusParam8
	db $12
	call FarCall
	ld c, a
	ld hl, sp+$f
	ld a, [hl]
	cp $42
	jp z, Func_23061
	cp $41
	jp z, Func_2305b
	cp $40
	jp z, Func_23049
	cp $3f
	jp z, Func_23036
	cp $3e
	jp z, Func_23021
	cp $3d
	jp z, Func_2300b
	cp $3c
	jp z, Func_22ffc
	cp $3b
	jp z, Func_22fe5
	cp $3a
	jp z, Func_22fce
	cp $29
	jp z, Func_22fc0
	cp $28
	jp z, Func_22fa4
	cp $27
	jp z, Func_22f8d
	cp $26
	jp z, Func_22f7e
	cp $25
	jp z, Func_22f68
	cp $24
	jp nz, Func_23064
	ld hl, sp+$d
	ld a, [hl]
	cp $3
	jp nz, Func_22f65
	ld hl, sp+$d
	ld [hl], $0
Func_22f65: ; 22f65 (8:6f65)
	jp Func_23064

Func_22f68: ; 22f68 (8:6f68)
	ld hl, sp+$d
	ld a, [hl]
	cp $2
	jp nz, Func_22f7b
	ld hl, sp+$d
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $14
	call Func_22d63
Func_22f7b: ; 22f7b (8:6f7b)
	jp Func_23064

Func_22f7e: ; 22f7e (8:6f7e)
	ld hl, sp+$d
	ld a, [hl]
	cp $4
	jp nz, Func_22f8a
	ld hl, sp+$d
	ld [hl], $0
Func_22f8a: ; 22f8a (8:6f8a)
	jp Func_23064

Func_22f8d: ; 22f8d (8:6f8d)
	ld hl, sp+$d
	ld a, [hl]
	cp $7
	jp z, Func_22f9d
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp nz, Func_22fa1
Func_22f9d: ; 22f9d (8:6f9d)
	ld hl, sp+$d
	ld [hl], $0
Func_22fa1: ; 22fa1 (8:6fa1)
	jp Func_23064

Func_22fa4: ; 22fa4 (8:6fa4)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp nz, Func_22fb0
	ld hl, sp+$d
	ld [hl], $0
Func_22fb0: ; 22fb0 (8:6fb0)
	call GetHLAtSPPlusParam8
	db $14
	ld a, [hl]
	and $f7
	ld [hl], a
	inc hl
	ld hl, sp+$e
	ld [hl], $1
	jp Func_23064

Func_22fc0: ; 22fc0 (8:6fc0)
	ld hl, sp+$d
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $14
	call Func_22d63
	jp Func_23064

Func_22fce: ; 22fce (8:6fce)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp z, Func_22fde
	ld hl, sp+$d
	ld a, [hl]
	cp $7
	jp nz, Func_22fe2
Func_22fde: ; 22fde (8:6fde)
	ld hl, sp+$d
	ld [hl], $0
Func_22fe2: ; 22fe2 (8:6fe2)
	jp Func_23064

Func_22fe5: ; 22fe5 (8:6fe5)
	ld hl, sp+$d
	ld a, [hl]
	cp $8
	jp z, Func_22ff5
	ld hl, sp+$d
	ld a, [hl]
	cp $3
	jp nz, Func_22ff9
Func_22ff5: ; 22ff5 (8:6ff5)
	ld hl, sp+$d
	ld [hl], $0
Func_22ff9: ; 22ff9 (8:6ff9)
	jp Func_23064

Func_22ffc: ; 22ffc (8:6ffc)
	ld hl, sp+$d
	ld a, [hl]
	cp $4
	jp nz, Func_23008
	ld hl, sp+$d
	ld [hl], $0
Func_23008: ; 23008 (8:7008)
	jp Func_23064

Func_2300b: ; 2300b (8:700b)
	ld hl, sp+$d
	ld a, [hl]
	cp $2
	jp nz, Func_2301e
	ld hl, sp+$d
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $14
	call Func_22d63
Func_2301e: ; 2301e (8:701e)
	jp Func_23064

Func_23021: ; 23021 (8:7021)
	ld hl, sp+$d
	ld a, [hl]
	cp $1
	jp nz, Func_23036
	push bc
	ld hl, sp+$f
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $16
	call Func_22db3
	pop bc
Func_23036: ; 23036 (8:7036)
	call GetHLAtSPPlusParam8
	db $14
	ld a, [hl]
	and $f7
	ld [hl], a
	inc hl
	ld hl, sp+$e
	ld [hl], $1
	ld hl, sp+$d
	ld [hl], c
	jp Func_23064

Func_23049: ; 23049 (8:7049)
	ld hl, sp+$d
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $14
	call Func_22d63
	ld hl, sp+$e
	ld [hl], $1
	jp Func_23064

Func_2305b: ; 2305b (8:705b)
	ld hl, sp+$d
	ld [hl], c
	jp Func_23064

Func_23061: ; 23061 (8:7061)
	ld hl, sp+$d
	ld [hl], c
Func_23064: ; 23064 (8:7064)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp z, Func_230ad
	call GetHLAtSPPlusParam8
	db $16
	ld de, $71
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $16
	pop de
	ld bc, $11
	call MemCopy
	call GetHLAtSPPlusParam8
	db $16
	ld de, $71
	add hl, de
	ld [hl], $0
	inc hl
	set_farcall_addrs_hli Func_673ff
	xor a
	call FarCall
	call GetHLAtSPPlusParam8
	db $14
	push hl
	call GetHLAtSPPlusParam8
	db $18
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
Func_230ad: ; 230ad (8:70ad)
	ld hl, sp+$d
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $14
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $16
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $18
	ld de, $82
	add hl, de
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $16
	ld de, $71
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	ld bc, $11
	call MemCopy
	set_farcall_addrs_hli Func_6b55
	call GetHLAtSPPlusParam8
	db $16
	ld de, $c6
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $12
.asm_23104
	ld de, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call FarCall
.asm_2310f
	call GetHLAtSPPlusParam8
	db $16
	ld de, $75
.asm_23114
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $12
	ld de, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_5a149
	ld c, $1
	ld e, $1
	ld a, [wOAM04XCoord]
	inc a
	call FarCall
Func_23137: ; 23137 (8:7137)
	add sp, $16
	ret

Data_2313a:
	dw Data_23140
	dw Data_23150
	dw $0000

Data_23140:
	db "<HIRA>つうしん<KATA>ハﾞトル<HIRA>てﾞは<KATA>", $00

Data_23150:
	db "<HIRA>つかえない<KATA>!", $00

Func_23159:
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_23184
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $8
	ld de, Data_2313a
	ld hl, $10e
	call FarCall
	ld hl, -1
	ret

Func_23184: ; 23184 (8:7184)
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_23197
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_231ab
Func_23197: ; 23197 (8:7197)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_231ab: ; 231ab (8:71ab)
	call Func_1fbe
	ld a, BANK(GFX_4dd2)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4dd2
	ld hl, $88e0
	call FarRequestVideoData
	set_farcall_addrs_hli Func_1445e
	ld c, $8
	ld de, $4ca5
	ld hl, $4cb4
	call FarCall
	ld a, l
	and h
	inc a
	jp z, Func_231e5
	call Func_22e48
	ld hl, wOAM04XCoord
	ld l, [hl]
	ld h, $0
	inc hl
Func_231e5: ; 231e5 (8:71e5)
	push hl
	call Func_3aa8
	ld a, [wSystemType]
	cp $1
	jp z, Func_231f9
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_2320d
Func_231f9: ; 231f9 (8:71f9)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
Func_2320d: ; 2320d (8:720d)
	call Func_2009
	ld a, BANK(GFX_4a02)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4a02
	ld hl, $88e0
	call FarRequestVideoData
	set_farcall_addrs_hli Func_dc0a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_dc0a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $3b
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	call WaitVideoTransfer
	pop hl
	ret

Pointers_2326e:
	dw Data_23274
	dw Data_23284
	dw $0000

Data_23274:
	db "<HIRA>つうしん<KATA>ハﾞトル<HIRA>てﾞは<KATA>", $00

Data_23284:
	db "<HIRA>にけﾞられない<KATA>!", $00

Func_2328f: ; 2328f (8:728f)
	add sp, -$52
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	call WriteHLToSPPlusParam8
	db $51
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $4f
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e4
	add hl, de
	call WriteHLToSPPlusParam8
	db $4d
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $4b
	set_farcall_addrs_hli Func_613fc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c8
	add hl, de
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c9
	add hl, de
	ld e, [hl]
	call FarCall
Func_232f2: ; 232f2 (8:72f2)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_23303
	call Func_20318
Func_23303: ; 23303 (8:7303)
	ld a, $64
	call Func_2034d
	ld hl, sp+$48
	ld [hl], a
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $51
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $51
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
Func_23352: ; 23352 (8:7352)
	call Func_21160
	ld c, $0
Func_23357: ; 23357 (8:7357)
	ld a, c
	cp $2
	jp nc, Func_2339b
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $4
	jp z, Func_2337e
	push bc
	set_farcall_addrs_hli Func_673ff
	pop bc
	push bc
	ld a, c
	call FarCall
	pop bc
Func_2337e: ; 2337e (8:737e)
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $f3
	ld [hl], a
	inc hl
	inc c
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $c8
	add hl, de
	call WriteHLToSPPlusParam8
	db $4f
	jp Func_23357

Func_2339b: ; 2339b (8:739b)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	db $4f
	call Func_20398
	xor a
Func_233ac: ; 233ac (8:73ac)
	cp $4
	jp nc, Func_233d6
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3f
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_233ac

Func_233d6: ; 233d6 (8:73d6)
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $75
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $6f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	jp z, Func_23400
	ld hl, sp+$0
	ld [hl], $18
Func_23400: ; 23400 (8:7400)
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, Func_23489
	cp $9
	jp z, Func_23412
	cp $a
	jp nz, Func_234c2
Func_23412: ; 23412 (8:7412)
	ld hl, sp+$45
	ld [hl], $0
	ld c, $9
	ld hl, sp+$45
	ld a, [hl]
	inc a
	ld hl, sp+$45
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2414b
	call FarCopyUntilNull
	ld de, Text_24069
	ld c, $9
	call FarCopyUntilNull
	ld de, Text_24150
	ld c, $9
	call FarCopyUntilNull
	ld de, Text_2416e
	ld c, $9
	call FarCopyUntilNull
	ld hl, sp+$45
	ld e, [hl]
	ld hl, sp+$3d
	call Func_203a3
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp z, Func_23472
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, Func_2346f
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5e
	add hl, de
	ld [hl], $ff
Func_2346f: ; 2346f (8:746f)
	jp Func_23486

Func_23472: ; 23472 (8:7472)
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5f
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5e
	add hl, de
	ld [hl], a
Func_23486: ; 23486 (8:7486)
	jp Func_23654

Func_23489: ; 23489 (8:7489)
	ld hl, sp+$45
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $4b
	ld de, $d
	add hl, de
	push hl
	ld hl, sp+$47
	ld a, [hl]
	inc a
	ld hl, sp+$47
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3f
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_201b7
	call CopyUntilNull
	ld hl, sp+$45
	ld e, [hl]
	ld hl, sp+$3d
	call Func_203a3
	jp Func_23654

Func_234c2: ; 234c2 (8:74c2)
	ld de, Data_237b5
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli Func_1445e
	ld c, $8
	ld de, $4a54
	ld hl, $4a63
	call FarCall
	call WriteHLToSPPlusParam8
	db $48
	call GetHLAtSPPlusParam8
	db $48
	ld a, l
	and h
	inc a
	jp nz, Func_23508
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5e
	add hl, de
	ld [hl], $ff
	jp Func_23654

Func_23508: ; 23508 (8:7508)
	ld de, $1311
	ld hl, $d
	call Func_2036d
	ld bc, -1
	call GetHLAtSPPlusParam8
	db $48
	ld a, l
	cp $5
	jp z, Func_235eb
	cp $4
	jp z, Func_235e5
	cp $3
	jp z, Func_235b3
	cp $1
	jp z, Func_2357a
	cp $2
	jp z, Func_23572
	or a
	jp nz, Func_235ee
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, Func_2354e
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, Func_23557
	ld hl, sp+$48
	ld a, [hl]
	cp $3c
	jp nc, Func_23557
Func_2354e: ; 2354e (8:754e)
	push bc
	xor a
	call Func_218e2
	pop bc
	jp Func_2356f

Func_23557: ; 23557 (8:7557)
	set_farcall_addrs_hli Func_1445e
	ld c, $8
	ld de, $4a82
	ld hl, $4a91
	call FarCall
	ld c, l
	ld b, h
Func_2356f: ; 2356f (8:756f)
	jp Func_235ee

Func_23572: ; 23572 (8:7572)
	call Func_23159
	ld c, l
	ld b, h
	jp Func_235ee

Func_2357a: ; 2357a (8:757a)
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, Func_23592
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, Func_2359c
	ld hl, sp+$48
	ld a, [hl]
	cp $3c
	jp nc, Func_2359c
Func_23592: ; 23592 (8:7592)
	push bc
	ld a, $2
	call Func_218e2
	pop bc
	jp Func_235b0

Func_2359c: ; 2359c (8:759c)
	set_farcall_addrs_hli Func_5e504
	ld de, $0
	xor a
	call FarCall
	ld c, l
	ld b, h
Func_235b0: ; 235b0 (8:75b0)
	jp Func_235ee

Func_235b3: ; 235b3 (8:75b3)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_235df
	push bc
	call Func_20398
	set_farcall_addrs_hli Func_c868
	ld c, $8
	ld de, $726e
	ld hl, $10e
	call FarCall
	pop bc
	jp Func_235e2

Func_235df: ; 235df (8:75df)
	ld bc, $0
Func_235e2: ; 235e2 (8:75e2)
	jp Func_235ee

Func_235e5: ; 235e5 (8:75e5)
	ld bc, $0
	jp Func_235ee

Func_235eb: ; 235eb (8:75eb)
	ld bc, $0
Func_235ee: ; 235ee (8:75ee)
	push bc
	call Func_21160
	pop bc
	ld a, c
	and b
	inc a
	jp nz, Func_235fc
	jp Func_23352

Func_235fc: ; 235fc (8:75fc)
	call GetHLAtSPPlusParam8
	db $48
	ld a, l
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5e
	add hl, de
	ld [hl], a
	cp $5
	jp z, Func_23654
	cp $4
	jp z, Func_23651
	cp $3
	jp z, Func_2364e
	cp $1
	jp z, Func_2363f
	cp $2
	jp z, Func_23633
	or a
	jp nz, Func_23654
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5f
	add hl, de
	ld [hl], c
	jp Func_23654

Func_23633: ; 23633 (8:7633)
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5f
	add hl, de
	ld [hl], c
	jp Func_23654

Func_2363f: ; 2363f (8:763f)
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $5f
	add hl, de
	ld a, [wc2e8 + 1]
	ld [hl], a
	jp Func_23654

Func_2364e: ; 2364e (8:764e)
	jp Func_23654

Func_23651: ; 23651 (8:7651)
	jp Func_23654

Func_23654: ; 23654 (8:7654)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2366e
	call Func_20fd5
	call Func_216e2
	call Func_21593
	jp Func_23677

Func_2366e: ; 2366e (8:766e)
	call Func_21593
	call Func_2035e
	call Func_21441
Func_23677: ; 23677 (8:7677)
	call GetHLAtSPPlusParam8
	db $51
	ld de, $7
	add hl, de
	ld [hl], $0
	callba_hli Func_27750
	or a
	jp nz, Func_23696
	jp Func_232f2

Func_23696: ; 23696 (8:7696)
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	call GetHLAtSPPlusParam8
	db $4f
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_236d9
	set_farcall_addrs_hli Func_dbf5
	ld c, $6
	call GetHLAtSPPlusParam8
	db $4d
	ld de, $c6
	add hl, de
	ld e, [hl]
	ld a, $1
	call FarCall
Func_236d9: ; 236d9 (8:76d9)
	ld hl, sp+$0
	ld [hl], $0
	call GetHLAtSPPlusParam8
	db $51
	ld de, $7
	add hl, de
	ld a, [hl]
	and $c
	jp z, Func_236ee
	jp Func_23746

Func_236ee: ; 236ee (8:76ee)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_23717
	call Func_21b0d
	or a
	jp z, Func_2370a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_23746

Func_2370a: ; 2370a (8:770a)
	call Func_22cd0
	or a
	jp nz, Func_23714
	jp Func_232f2

Func_23714: ; 23714 (8:7714)
	jp Func_23746

Func_23717: ; 23717 (8:7717)
	call Func_2193a
	cp $2
	jp z, Func_23742
	cp $1
	jp z, Func_2372b
	or a
	jp nz, Func_23746
	jp Func_232f2

Func_2372b: ; 2372b (8:772b)
	ld a, $5
	call Func_14fc
Func_23730: ; 23730 (8:7730)
	call Func_1abe
	or a
	jp z, Func_2373f
	call Func_24e9
	and $30
	jp z, Func_23730
Func_2373f: ; 2373f (8:773f)
	jp Func_23746

Func_23742: ; 23742 (8:7742)
	ld hl, sp+$0
	ld [hl], $1
Func_23746: ; 23746 (8:7746)
	xor a
Func_23747: ; 23747 (8:7747)
	cp $4
	jp nc, Func_237af
	push af
	set_farcall_addrs_hli Func_6b55
	pop af
	push af
	call GetHLAtSPPlusParam8
	db $4d
	ld de, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call FarCall
	call GetHLAtSPPlusParam8
	db $4d
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_23784
	call GetHLAtSPPlusParam8
	db $4d
.asm_2377b
	ld de, $22
	add hl, de
	ld [hl], $e
	jp Func_2378e

Func_23784: ; 23784 (8:7784)
	call GetHLAtSPPlusParam8
	db $4d
	ld de, $22
	add hl, de
	ld [hl], $0
Func_2378e: ; 2378e (8:778e)
	set_farcall_addrs_hli Func_6b74
	pop af
	push af
	call GetHLAtSPPlusParam8
	db $4d
	ld de, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop af
	inc a
	jp Func_23747

Func_237af: ; 237af (8:77af)
	ld hl, sp+$0
	ld a, [hl]
	add sp, $52
	ret

Data_237b5:
	db "<HIRA>とﾞうする?<KATA>", $00

Func_237be:
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	ld a, [wSystemType]
	cp $11
	jp nz, Func_237fb
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld bc, $800
	ld e, $0
	hlbgcoord 0, 0
	call FillMemory
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_237fb: ; 237fb (8:77fb)
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	or $80
	call FarCall
	ret

Func_2380f:
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
Func_23824: ; 23824 (8:7824)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_23824
	ld a, [wSystemType]
	cp $11
	jp nz, Func_238c7
	call WaitVideoTransfer
Func_23839: ; 23839 (8:7839)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_23839
	ld c, $0
Func_23843: ; 23843 (8:7843)
	ld a, c
	cp $8
	jp nc, Func_23896
	ld a, c
	and $1
	jp nz, Func_23872
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	ld de, $f7f
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 4
	add hl, de
	deRGB 04, 07, 22
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_23892

Func_23872: ; 23872 (8:7872)
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	deRGB 04, 07, 22
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 4
	add hl, de
	deRGB 31, 27, 03
	ld [hl], e
	inc hl
	ld [hl], d
Func_23892: ; 23892 (8:7892)
	inc c
	jp Func_23843

Func_23896: ; 23896 (8:7896)
	ld bc, $40
	ld de, wCGB_BGPalsBuffer
	ld hl, wCGB_OBPalsBuffer
	call CopyFromDEtoHL
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_238ad: ; 238ad (8:78ad)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_238ad
Func_238b5: ; 238b5 (8:78b5)
	ld a, [$c01c]
	cp $11
	jp nc, Func_238c3
	call Func_0465
	jp Func_238b5

Func_238c3: ; 238c3 (8:78c3)
	xor a
	ld [$c01c], a
Func_238c7: ; 238c7 (8:78c7)
	ret

Func_238c8: ; 238c8 (8:78c8)
	ld a, $19
	ld [wFarCallDestBank], a
	ld bc, $214
	ld de, GFX_66f73
	ld hl, $c980
	call FarCopyVideoData
	ld bc, $32
	ld de, $ca9d
	ld hl, $c7ed
	call CopyFromDEtoHL
	ld bc, $64
	ld de, $cacf
	ld hl, $c789
	call CopyFromDEtoHL
	ld bc, $3c
	ld de, $cb58
	ld hl, wOAM11Attrs
	call CopyFromDEtoHL
	call ReadHalfWordAt
	dw $cb3b
	call WriteHalfWordTo
	dw wOAM24XCoord
	call ReadHalfWordAt
	dw $cb3d
	call WriteHalfWordTo
	dw wOAM24Attrs
	ld bc, $5
	ld de, $c980
	ld hl, wOAM02XCoord
	call CopyFromDEtoHL
	ret

Func_2391e:
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	push af
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call Func_3bc5
	pop bc
	pop af
	cp $4
	jp z, Func_23a31
	cp $3
	jp z, Func_23a05
	cp $2
	jp z, Func_239cf
	cp $1
	jp z, Func_239a5
	or a
	jp nz, Func_23a64
	callba_hli Func_56fc2
	cp $ff
	jp z, Func_239a2
	callba_hli Func_58df9
	or a
	jp nz, Func_239a2
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli Func_81cf
	ld c, $1
	ld e, $0
	xor a
	call FarCall
Func_239a2: ; 239a2 (8:79a2)
	jp Func_23a64

Func_239a5: ; 239a5 (8:79a5)
	call Func_1db9
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli Func_81cf
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_23a64

Func_239cf: ; 239cf (8:79cf)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp Func_23a64

Func_23a05: ; 23a05 (8:7a05)
	call Func_3aa8
	call Func_237be
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	callba_hli Func_17488
	call Func_2097
	call Func_2380f
	call Func_1add
	jp Func_23a64

Func_23a31: ; 23a31 (8:7a31)
	call Func_238c8
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
Func_23a64: ; 23a64 (8:7a64)
	ld hl, $8000
	ret

Func_23a68:
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	push af
	ld l, $b
	push hl
	ld c, $b
	ld e, $3
	ld a, $4
	call Func_3bc5
	pop bc
	pop af
	cp $3
	jp z, Func_23b2a
	cp $2
	jp z, Func_23afe
	cp $1
	jp z, Func_23ac8
	or a
	jp nz, Func_23b5d
	call Func_1db9
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli Func_81cf
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_23b5d

Func_23ac8: ; 23ac8 (8:7ac8)
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_52df8
	callba_hli Func_17470
	call Func_204c
	call Func_3af6
	jp Func_23b5d

Func_23afe: ; 23afe (8:7afe)
	call Func_3aa8
	call Func_237be
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	callba_hli Func_17488
	call Func_2097
	call Func_2380f
	call Func_1add
	jp Func_23b5d

Func_23b2a: ; 23b2a (8:7b2a)
	call Func_238c8
	callba_hli Func_17488
	call Func_2097
	callba_hli Func_144bd
	callba_hli Func_17470
	call Func_204c
Func_23b5d: ; 23b5d (8:7b5d)
	ld hl, $8000
	ret

SECTION "Bank 09", ROMX, BANK [$09]
INCLUDE "charmap2.asm"
Func_24000:
	ret

Func_24001:
	callba_hli Func_5cf1d
	ret

Func_24010:
	push hl
	set_farcall_addrs_hli Func_5cf85
	pop hl
	ld e, $9
	call FarCall
	ret

Func_24012:
	push hl
	set_farcall_addrs_hli Func_5d02d
	pop hl
	ld e, $9
	call FarCall
	ret

Func_24036:
	callba_hli Func_5d107
	ret

Func_24045:
	callba_hli Func_5d10d
	ret

Func_24054:
	push af
	set_farcall_addrs_hli Func_5d096
	pop af
	call FarCall
	ret

Text_24065:
	db " ", $00

Text_24067:
	db "!", $00

Text_24069:
	db "は", $00

Text_2406b:
	db "に", $00

Text_2406d:
	db "が", $00

Text_2406f:
	db "の", $00

Text_24071:
	db "を", $00

Text_24073:
	db "で", $00

Text_24075:
	db "/", $00

Text_24077:
	db "G", $00

Pointers_24079:
	dw Text_24065
	dw Text_24067
	dw Text_24069
	dw Text_2406b
	dw Text_2406d
	dw Text_2406f
	dw Text_24071
	dw Text_24073
	dw Text_24075
	dw Text_24077

Text_2408d:
	db " ", $00

Text_2408f:
	db "いのり", $00

Text_24093:
	db "のろい", $00

Text_24097:
	db "ねつ", $00

Text_2409a:
	db "バグ", $00

Text_2409d:
	db "のうむ", $00

Text_240a1:
	db "めいれいむし", $00

Text_240a8:
	db "ていし", $00

Text_240ac:
	db "サビ", $00

Text_240af:
	db "ぼうそう", $00

Text_240b4:
	db "はんどう", $00

Text_240b9:
	db "みずびたし", $00

Text_240bf:
	db "あぶらまみれ", $00

Text_240c6:
	db "バリヤ", $00

Text_240ca:
	db "ふのう", $00

Pointers_240ce:
	dw Text_2408d
	dw Text_2408f
	dw Text_24093
	dw Text_24097
	dw Text_2409a
	dw Text_2409d
	dw Text_240a1
	dw Text_240a8
	dw Text_240ac
	dw Text_240af
	dw Text_240b4
	dw Text_240b9
	dw Text_240bf
	dw Text_240c6
	dw Text_240ca

Text_240ec:
	db "ぼうぎょ", $00

Text_240f1:
	db "こうげき", $00

Text_240f6:
	db "すばやさ", $00

Text_240fb:
	db "めいちゅう", $00

Text_24101:
	db "ポイント", $00

Text_24106:
	db "エネルギー", $00

Text_2410c:
	db "ヒット", $00

Text_24110:
	db "こうげき", $00

Text_24115:
	db "わざ", $00

Text_24118:
	db "はんどう", $00

Text_2411d:
	db "ばくはつ", $00

Pointers_24122:
	dw Text_240ec
	dw Text_240f1
	dw Text_240f6
	dw Text_240fb
	dw Text_24101
	dw Text_24106
	dw Text_2410c
	dw Text_24110
	dw Text_24115
	dw Text_24118
	dw Text_2411d

Text_24138:
	db "たたかう", $00

Text_2413d:
	db "アイテム", $00

Text_24142:
	db "ロボポン", $00

Text_24147:
	db "にげる", $00

Text_2414b:
	db "コマンド", $00

Text_24150:
	db "すべて", $00

Pointers_24154:
	dw Text_24138
	dw Text_2413d
	dw Text_24142
	dw Text_24147
	dw Text_2414b
	dw Text_24150

Text_24160:
	db "あがった", $00

Text_24165:
	db "さがった", $00

Text_2416a:
	db "うけた", $00

Text_2416e:
	db "つかえません", $00

Text_24175:
	db "はずれた", $00

Text_2417a:
	db "なっている", $00

Text_24180:
	db "なおった", $00

Text_24185:
	db "ふせいだ", $00

Text_2418a:
	db "すいとった", $00

Text_24190:
	db "あたえた", $00

Text_24195:
	db "ダメージ", $00

Text_2419a:
	db "はんげきした", $00

Text_241a1:
	db "ひろった", $00

Text_241a6:
	db "かけてきた", $00

Text_241ac:
	db "かけている", $00

Text_241b2:
	db "しっぱいした", $00

Text_241b9:
	db "になった", $00

Text_241be:
	db "ダメージをうけとめた", $00

Text_241c9:
	db "にへった", $00

Text_241ce:
	db "しようできなくなった", $00

Text_241d9:
	db "の ばくははしっぱいした", $00

Text_241e6:
	db "つかった", $00

Text_241eb:
	db "スクラップ", $00

Text_241f1:
	db "にした", $00

Pointers_241f5:
	dw Text_24160
	dw Text_24165
	dw Text_2416a
	dw Text_2416e
	dw Text_24175
	dw Text_2417a
	dw Text_24180
	dw Text_24185
	dw Text_2418a
	dw Text_24190
	dw Text_24195
	dw Text_2419a
	dw Text_241a1
	dw Text_241a6
	dw Text_241ac
	dw Text_241b2
	dw Text_241b9
	dw Text_241be
	dw Text_241c9
	dw Text_241ce
	dw Text_241d9
	dw Text_241e6
	dw Text_241eb
	dw Text_241f1

Data_24225:
	dr $24225, $27750

Func_27750:
	dr $27750, $27782

SECTION "Bank 0a", ROMX, BANK [$0a]
	dr $28000, $2bfe4

SECTION "Bank 0b", ROMX, BANK [$0b]
	dr $2c000, $2eeb2

SECTION "Bank 0c", ROMX, BANK [$0c]
	dr $30000, $31bbe

Func_31bbe: ; $31bbe
IF DEF(SUN)
	dr $31bbe, $33bd0

Func_33bd0:
	dr $33bd0, $33db7

Func_33db7:
	dr $33db7, $33fe3
ENDC
IF DEF(STAR)
	dr $31bbe, $33bd9

Func_33bd0:
	dr $33bd9, $33dc0

Func_33db7:
	dr $33dc0, $33fec
ENDC

SECTION "Bank 0d", ROMX, BANK [$0d]
	dr $34000, $37ec0

SECTION "Bank 12", ROMX, BANK [$12]
	dr $48000, $4b8ac

Func_4b8ac: ; $4b8ac
	dr $4b8ac, $4c000

SECTION "Bank 13", ROMX, BANK [$13]
	dr $4c000, $4ec2b

Func_4ec2b: ; $4ec2b
	dr $4ec2b, $4ed70

Func_4ed70:
	dr $4ed70, $4f800

Func_4f800:
	dr $4f800, $4fef1

Func_4fef1: ; $4fef1
	dr $4fef1, $50000

SECTION "Bank 14", ROMX, BANK [$14]
	dr $50000, $5190c

Func_5190c: ; $5190c
	dr $5190c, $51bf3

Func_51bf3: ; $51bf3
	dr $51bf3, $524b6

Func_524b6: ; $524b6
	dr $524b6, $52d1f

Func_52d1f:
	dr $52d1f, $52df8

Func_52df8:
	dr $52df8, $53a0d

Func_53a0d: ; $53a0d
	dr $53a0d, $53b1e

Func_53b1e:
	dr $53b1e, $54000

SECTION "Bank 15", ROMX, BANK [$15]
	dr $54000, $54af8

Func_54af8:
	dr $54af8, $55dd6

Func_55dd6: ; $55dd6
	dr $55dd6, $55ed2

Func_55ed2: ; $55ed2
	dr $55ed2, $55f95

Func_55f95: ; $55f95
	dr $55f95, $5601b

Func_5601b: ; $5601b
	dr $5601b, $5615c

Func_5615c: ; $5615c
	dr $5615c, $566fe

Func_566fe: ; $566fe
	dr $566fe, $569d9

Func_569d9: ; $569d9
	dr $569d9, $56abf

Func_56abf: ; $56abf
	dr $56abf, $56b35

Func_56b35:
	dr $56b35, $56d87

Func_56d87: ; $56d87
	dr $56d87, $56fc2

Func_56fc2: ; $56fc2
	dr $56fc2, $5712f

Func_5712f: ; $5712f
	dr $5712f, $576c1

Func_576c1: ; $576c1
	dr $576c1, $57840

Func_57840: ; $57840
	dr $57840, $58000

SECTION "Bank 16", ROMX, BANK [$16]
	dr $58000, $58df9

Func_58df9:
	dr $58df9, $5a149

Func_5a149:
	dr $5a149, $5c000

SECTION "Bank 17", ROMX, BANK [$17]
	dr $5c000, $5c0b2

Func_5c0b2:
	dr $5c0b2, $5c328

Func_5c328:
	dr $5c328, $5c6e3

Func_5c6e3: ; $5c6e3
	dr $5c6e3, $5cf1d

Func_5cf1d: ; 5cf1d
	dr $5cf1d, $5cf85

Func_5cf85: ; 5cf85
	dr $5cf85, $5d02d

Func_5d02d: ; 5d02d
	dr $5d02d, $5d096

Func_5d096: ; 5d096
	dr $5d096, $5d107

Func_5d107: ; 5d107
	dr $5d107, $5d10d

Func_5d10d: ; 5d10d
	dr $5d10d, $5d113

Func_5d113:
	dr $5d113, $5e504

Func_5e504:
	dr $5e504, $5ec5e

Func_5ec5e:
	dr $5ec5e, $60000

SECTION "Bank 18", ROMX, BANK [$18]
Func_60000: ; 60000 (18:4000)
	ret

Func_60001: ; 60001 (18:4001)
	; c = 0: start cursor at (a, e)
	inc c
	dec c
	jp nz, .dont_do_callback
	ld [wBlinkerX], a
	ld a, e
	ld [wBlinkerY], a
	ld a, BANK(BlinkTextCursor)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, BlinkTextCursor
	call WriteHalfWordTo
	dw wVBlankCallbackAddress
	call WaitVideoTransfer
	ld a, $3
	ld [wc24d], a
	ld a, $bc
	ld [wTextBlinkerFrameCounter], a
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	jp .done

.dont_do_callback
	; clobber a
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	ld de, $8f00 ; clobbers e
	add hl, de
	ld c, l
	ld b, h
	ld a, [wBlinkerY]
	ld e, a
	ld a, [wBlinkerX]
	ld d, a
	ld a, [wBlinkerY]
	ld l, a
	ld a, [wBlinkerX]
	ld h, a
	call FarCall
	ld a, $4
	ld [wc24d], a
	call WaitVideoTransfer
.done
	ret

StartCursorBlinking: ; 60075 (18:4075)
	push af
	ld a, $8a
	ld [wBlinkerOffTile], a
	ld hl, sp+$1 ; get previous value of a without popping flags (clobbers hl)
	ld a, [hl]
	and $80
	jp nz, .bit_7
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	jp .okay

.bit_7
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3ca1
	pop bc
.okay
	ld hl, sp+$1
	ld a, [hl]
	and $1
	jp nz, .okay2
	ld c, $0
	ld e, $10
	ld a, $12
	call Func_60001
.okay2
	xor a
	ld [wTimerCounter], a
.loop
	call Func_24e9
	ld e, a
	inc e
	dec e
	jp nz, .check_bits_4_5
	ld hl, sp+$1
	ld a, [hl]
	and $1
	jp z, .next
	ld a, [wTimerCounter]
	cp $1e
	jp c, .next
	jp .done

.next
	jp .loop

.check_bits_4_5
	ld a, e
	and $30
	jp z, .next2
	jp .done

.next2
	jp .loop

.done
	push de
	ld hl, sp+$3
	ld a, [hl]
	and $1
	jp nz, .skip
	ld c, $1
	ld e, $10
	ld a, $12
	call Func_60001
.skip
	pop de
	ld a, e
	pop bc
	ret

Func_600f4: ; 600f4 (18:40f4)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_60109: ; 60109 (18:4109)
	push af
	push de
	set_farcall_addrs_hli Func_e015
	pop de
	pop af
	call FarCall
	ret

Func_6011c: ; 6011c (18:411c)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_60621 ; same bank
	pop bc
	ld a, c
	and $e0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, c
	and $1f
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	pop bc
	ret

Func_6014a: ; 6014a (18:414a)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_6015e: ; 6015e (18:415e)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_60172:
	callba_hli Func_6fe0
	ret

Func_60181: ; 60181 (18:4181)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_601a6
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6015e
	jp Func_601b4

Func_601a6: ; 601a6 (18:41a6)
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6014a
Func_601b4: ; 601b4 (18:41b4)
	pop bc
	ret

Func_601b6:
	callba_hli Func_cb4a
	ret

Func_601c5:
	callba_hli Func_cced
	ret

Func_601d4: ; 601d4 (18:41d4)
	callba_hli Func_2328f
	ret

Data_601e3:
	dr $601e3, $601eb

Data_601eb:
	dr $601eb, $601f1

Data_601f1:
	dr $601f1, $6020a

Func_6020a: ; 6020a (18:420a)
	ld hl, -$86
	add hl, sp
	ld sp, hl
	ld hl, sp+$7e
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_601e3
	ld bc, $8
	call MemCopy
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_601eb
	ld bc, $6
	call MemCopy
	ld hl, sp+$b
	pop de
	push hl
	ld hl, Data_601f1
	call WriteHLToSPPlus4
	ld hl, $0
	call WriteHLToSPPlus6
	ld e, $c5
	ld a, $c5
	call Func_60109
	call Func_3aa8
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6037e
	ld hl, sp+$7e
	call WriteHLToSPPlusParam8
	db $7d
	ld c, $0
Func_60268: ; 60268 (18:4268)
	ld a, c
	cp $4
	jp nc, Func_6037b
	ld a, [hSRAMBank]
	push af
	push bc
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	ld hl, sp+$5c
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	pop af
	push bc
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$5a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6015e
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_60302
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	push de
	push hl
	pop de
	pop hl
	ld hl, $23
	call Func_6015e
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	ld a, a
	ld [hl], a
	ld hl, sp+$5b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_60302: ; 60302 (18:4302)
	push bc
	ld c, $1
	ld hl, sp+$5a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6014a
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_6036e
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	push de
	push hl
	pop de
	pop hl
	ld hl, $23
	call Func_6014a
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	ld a, a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$5b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_6036e: ; 6036e (18:436e)
	inc c
	call GetHLAtSPPlusParam8
	db $7d
	inc hl
	call WriteHLToSPPlusParam8
	db $7d
	jp Func_60268

Func_6037b: ; 6037b (18:437b)
	jp Func_60499

Func_6037e: ; 6037e (18:437e)
	ld hl, sp+$7e
	call WriteHLToSPPlusParam8
	db $7d
	ld c, $0
Func_60386: ; 60386 (18:4386)
	ld a, c
	cp $4
	jp nc, Func_60499
	push bc
	ld c, $1
	ld hl, sp+$5a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6014a
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_603f8
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	push de
	push hl
	pop de
	pop hl
	ld hl, $23
	call Func_6014a
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	ld a, a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$5b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_603f8: ; 603f8 (18:43f8)
	ld a, [hSRAMBank]
	push af
	push bc
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop bc
	push bc
	ld hl, sp+$5c
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	pop af
	push bc
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$5a
	push de
	push hl
	pop de
	pop hl
	ld hl, $1
	call Func_6015e
	pop bc
	ld hl, sp+$58
	ld a, [hl]
	or a
	jp z, Func_6048c
	push bc
	push af
	ld c, $1
	ld hl, sp+$5c
	push de
	push hl
	pop de
	pop hl
	ld hl, $23
	call Func_6015e
	pop af
	ld e, a
	dec e
	ld hl, sp+$2b
	call Func_236f
	set_farcall_addrs_hli Func_6adb3
	ld hl, sp+$79
	ld e, [hl]
	ld hl, sp+$30
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam8
	ld a, a
	ld [hl], a
	ld hl, sp+$5b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$d
	call LiteralStringInTree
	pop bc
	push bc
	ld hl, sp+$d
	push hl
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
Func_6048c: ; 6048c (18:448c)
	inc c
	call GetHLAtSPPlusParam8
	db $7d
	inc hl
	call WriteHLToSPPlusParam8
	db $7d
	jp Func_60386

Func_60499: ; 60499 (18:4499)
	call Func_27f5
	ld hl, sp+$7e
	push de
	push hl
	pop de
	pop hl
	xor a
	ld hl, sp+$7d
	ld [hl], a
Func_604a6: ; 604a6 (18:44a6)
	cp $8
	jp nc, Func_604e7
	push af
	ld a, [de]
	cp $ff
	jp z, Func_604e1
	push de
	set_farcall_addrs_hli Func_a26c
	pop de
	push de
	ld a, [de]
	ld e, a
	ld d, $0
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld e, $0
	ld c, $4
	call FarCall
	pop de
Func_604e1: ; 604e1 (18:44e1)
	pop af
	inc a
	inc de
	jp Func_604a6

Func_604e7: ; 604e7 (18:44e7)
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	ld hl, sp+$7e
	ld c, l
	ld b, h
	ld e, $0
	ld hl, sp+$7d
	ld [hl], e
Func_604ff: ; 604ff (18:44ff)
	ld a, e
	cp $8
	jp nc, Func_60556
	push bc
	ld a, [bc]
	cp $ff
	jp z, Func_60550
	push de
	ld a, e
	ld b, $4
	call DivideAbyB
	add a
	add a
	add a
	add a
	add a
	add a
	add a
	add $10
	ld l, a
	pop de
	push de
	push hl
	ld a, e
	and $3
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	push af
	set_farcall_addrs_hli Func_da839
	pop af
	pop hl
	ld d, l
	ld e, a
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
	dec a
	add a
	add a
	ld bc, $200
	call FarCall
	pop de
Func_60550: ; 60550 (18:4550)
	inc e
	pop bc
	inc bc
	jp Func_604ff

Func_60556: ; 60556 (18:4556)
	callba_hli Func_d9f55
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_605be
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c980
	ld hl, sp+$8
	call CopyUntilNull
	pop af
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	call Func_6015e
	ld c, $1
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	call Func_6014a
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$b
	call LiteralStringInTree
	dec hl
	jp Func_605fc

Func_605be: ; 605be (18:45be)
	ld c, $1
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	call Func_6014a
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$b
	call LiteralStringInTree
	dec hl
	push hl
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, $c980
	ld hl, sp+$a
	call CopyUntilNull
	pop af
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$8
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	call Func_6015e
	pop hl
Func_605fc: ; 605fc (18:45fc)
	ld de, Data_60619
	call CopyUntilNull
	ld c, $98
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call Func_6011c
	call Func_60181
	ld hl, $86
	add hl, sp
	ld sp, hl
	ret

Data_60619:
	db " <HIRA>かﾞ<KATA>", $00

Data_6061f:
	dw $0000

Func_60621:
	push hl
	push de
	add sp, -$4c
	push bc
	ld hl, sp+$4c
	ld [hl], $0
	ld hl, sp+$4b
	ld [hl], $1
	ld hl, sp+$4a
	ld [hl], $0
	ld hl, sp+$49
	ld [hl], $0
	ld hl, sp+$48
	ld [hl], $0
	call ReadHalfWordAt
	dw Data_6061f
	call WriteHLToSPPlusParam8
	db $46
	call GetHLAtSPPlusParam8
	db $52
	ld e, h
	ld hl, sp+$47
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $52
	ld e, l
	ld hl, sp+$46
	ld [hl], e
	ld hl, sp+$43
	ld [hl], c
	ld l, b
	ld h, $0
	ld a, l
	and $3
	ld l, a
	ld h, $0
	ld e, l
	push de
	ld a, b
	and $4
	jp nz, Func_6066b
	ld hl, sp+$4c
	ld [hl], $1
Func_6066b: ; 6066b (18:466b)
	ld a, b
	and $8
	jp z, Func_60679
	ld hl, sp+$4b
	ld a, $1
	ld [hl], a
	ld hl, sp+$4a
	ld [hl], a
Func_60679: ; 60679 (18:4679)
	ld a, b
	and $10
	jp z, Func_60683
	ld hl, sp+$4a
	ld [hl], $1
Func_60683: ; 60683 (18:4683)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop de
	pop bc
	ld a, e
	cp $2
	jp nz, Func_606ae
	push de
	call GetHLAtSPPlusParam8
	db $50
	ld c, l
	ld b, h
	ld hl, sp+$41
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
Func_606ae: ; 606ae (18:46ae)
	push bc
	push de
	ld hl, sp+$48
	ld e, [hl]
	ld hl, sp+$49
	ld a, [hl]
	call SetStringStartState
	pop de
	push de
	ld a, e
	cp $1
	jp z, Func_606c5
	or a
	jp nz, Func_606e3
Func_606c5: ; 606c5 (18:46c5)
	ld hl, sp+$45
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $2
	call GetHLAtSPPlusParam8
	db $52
	inc hl
	inc hl
	call WriteHLToSPPlusParam8
	db $52
	dec hl
	dec hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$43
	call FarCopyVideoData
Func_606e3: ; 606e3 (18:46e3)
	pop de
	pop bc
	push de
	ld a, e
	cp $2
	jp z, Func_6071c
	cp $1
	jp z, Func_6070a
	or a
	jp nz, Func_6072c
	push bc
	ld hl, sp+$45
	ld c, [hl]
	call GetHLAtSPPlusParam8
	db $45
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call FarCopyUntilNull
	pop bc
	jp Func_6072c

Func_6070a: ; 6070a (18:470a)
	push bc
	call GetHLAtSPPlusParam8
	db $45
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call LiteralStringInTree
	pop bc
	jp Func_6072c

Func_6071c: ; 6071c (18:471c)
	push bc
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld l, c
	ld h, b
	call PrintCharacterFromTree
	ld hl, sp+$4d
	ld [hl], a
	pop bc
Func_6072c: ; 6072c (18:472c)
	push bc
	ld hl, sp+$4
	call WriteHLToSPPlusParam8
	db $45
	ld hl, sp+$4c
	ld a, [hl]
	or a
	jp z, Func_60744
	ld hl, sp+$4
	push hl
	call PlaceString
	pop bc
	jp Func_607dc

Func_60744: ; 60744 (18:4744)
	call GetHLAtSPPlusParam8
	db $45
	ld a, [hl]
	inc hl
	call WriteHLToSPPlusParam8
	db $45
	ld hl, sp+$46
	ld [hl], a
	ld hl, sp+$46
	ld a, [hl]
	or a
	jp nz, Func_6075b
	jp Func_607dc

Func_6075b: ; 6075b (18:475b)
	ld hl, sp+$46
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$46
	ld a, [hl]
	cp $28
	jp z, Func_60772
	ld hl, sp+$46
	ld a, [hl]
	cp $29
	jp nz, Func_60775
Func_60772: ; 60772 (18:4772)
	jp Func_607d9

Func_60775: ; 60775 (18:4775)
	call GetHLAtSPPlusParam8
	db $45
	ld e, [hl]
	ld hl, sp+$46
	ld [hl], e
	ld hl, sp+$46
	ld a, [hl]
	cp $de
	jp z, Func_6078d
	ld hl, sp+$46
	ld a, [hl]
	cp $df
	jp nz, Func_6079d
Func_6078d: ; 6078d (18:478d)
	ld hl, sp+$46
	push hl
	call PlaceString
	pop bc
	call GetHLAtSPPlusParam8
	db $45
	inc hl
	call WriteHLToSPPlusParam8
	db $45
Func_6079d: ; 6079d (18:479d)
	ld l, $2
	push hl
	ld c, $2
	ld hl, sp+$4a
	ld a, [hl]
	dec a
	ld e, a
	ld a, [wStringDestX]
	dec a
	call Func_3bc5
	pop bc
	ld l, $2
	push hl
	ld c, $2
	ld hl, sp+$4a
	ld a, [hl]
	dec a
	ld e, a
	ld a, [wStringDestX]
	dec a
	call Func_3bc5
	pop bc
	call Func_24e9
	and $30
	jp z, Func_607d9
	ld hl, sp+$4c
	ld [hl], $1
	call GetHLAtSPPlusParam8
	db $45
	push hl
	call PlaceString
	pop bc
	jp Func_607dc

Func_607d9: ; 607d9 (18:47d9)
	jp Func_60744

Func_607dc: ; 607dc (18:47dc)
	pop bc
	pop de
	push bc
	push de
	ld a, e
	cp $1
	jp z, Func_607ea
	or a
	jp nz, Func_6080d
Func_607ea: ; 607ea (18:47ea)
	ld hl, sp+$45
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $2
	call GetHLAtSPPlusParam8
	db $52
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$43
	call FarCopyVideoData
	call GetHLAtSPPlusParam8
	db $45
	ld a, l
	or h
	jp nz, Func_6080d
	ld hl, sp+$4d
	ld [hl], $0
Func_6080d: ; 6080d (18:480d)
	pop de
	pop bc
	ld hl, sp+$49
	ld a, [hl]
	or a
	jp nz, Func_60819
	jp Func_60857

Func_60819: ; 60819 (18:4819)
	push bc
	push de
	ld hl, sp+$48
	ld a, [hl]
	cp $10
	jp nz, Func_6084a
	ld hl, sp+$4e
	ld a, [hl]
	ld hl, sp+$4b
	add [hl]
	call StartCursorBlinking
	ld hl, sp+$4e
	ld [hl], $80
	ld hl, sp+$48
	ld [hl], $c
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_6084a: ; 6084a (18:484a)
	ld hl, sp+$48
	ld a, [hl]
	add $2
	ld hl, sp+$48
	ld [hl], a
	pop de
	pop bc
	jp Func_606ae

Func_60857: ; 60857 (18:4857)
	ld hl, sp+$4a
	ld a, [hl]
	ld hl, sp+$46
	add [hl]
	call StartCursorBlinking
	push af
Func_60861: ; 60861 (18:4861)
	call Func_24e9
	or a
	jp nz, Func_60861
	pop af
	add sp, $50
	ret

Func_6086c: ; 6086c (18:486c)
	push hl
	push de
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $1e
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $1c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $23
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $23
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $a
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $27
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	ld de, $9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $25
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop bc
	ret

Func_6095c: ; 6095c (18:495c)
	push hl
	push de
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	pop de
	push hl
	ld hl, sp+$2
	ld l, [hl]
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_236f
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus8
	ld e, a
	call Func_6086c
	pop af
	call GetHLAtSPPlus6
	ld de, $13
	add hl, de
	ld [hl], a
	ld c, $0
Func_60994: ; 60994 (18:4994)
	ld a, c
	cp $3
	jp nc, Func_609b4
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $14
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	jp Func_60994

Func_609b4: ; 609b4 (18:49b4)
	pop hl
	push hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $2e
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld de, $17
	add hl, de
	ld [hl], a
	pop bc
	pop bc
	pop bc
	ret

Func_609d3: ; 609d3 (18:49d3)
	push af
	push de
	ld hl, -$356
	add hl, sp
	ld sp, hl
	push bc
	ld hl, $357
	add hl, sp
	ld a, [hSRAMBank]
	ld [hl], a
	ld hl, $35b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus4
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $35b
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_60a20
	ld hl, $0
	jp Func_60a23

Func_60a20: ; 60a20 (18:4a20)
	ld hl, $2f
Func_60a23: ; 60a23 (18:4a23)
	add hl, de
	call WriteHLToSPPlusParam16
	dw $357
	pop bc
	push bc
	ld a, c
	cp $8
	jp z, Func_60d7b
	cp $7
	jp z, Func_60d07
	cp $6
	jp z, Func_60c66
	cp $5
	jp z, Func_60b8a
	cp $4
	jp z, Func_60b73
	cp $3
	jp z, Func_60b42
	cp $2
	jp z, Func_60af2
	cp $1
	jp z, Func_60abb
	or a
	jp nz, Func_60d8c
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	pop de
	call Func_236f
	ld bc, $23
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_5c6e3
	call GetHLAtSPPlusParam16
	dw $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60abb: ; 60abb (18:4abb)
	ld hl, $358
	add hl, sp
	ld l, [hl]
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	pop de
	call Func_6095c
	set_farcall_addrs_hli Func_5c6e3
	call GetHLAtSPPlusParam16
	dw $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60af2: ; 60af2 (18:4af2)
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	pop de
	call Func_236f
	ld bc, $23
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $22
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60b42: ; 60b42 (18:4b42)
	ld bc, $23
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_6b74
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	jp Func_60d8c

Func_60b73: ; 60b73 (18:4b73)
	set_farcall_addrs_hli Func_bd6fa
	ld de, $0
	ld hl, Data_60e6f
	call FarCall
	jp @ - 1 ; better luck next time

Func_60b8a: ; 60b8a (18:4b8a)
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	pop de
	call Func_6095c
	call GetHLAtSPPlus4
	ld de, $71
	add hl, de
	push hl
	ld hl, $35a
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	ld de, $82
	add hl, de
	pop de
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $13
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60c66: ; 60c66 (18:4c66)
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $1a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $13
	add hl, de
	ld a, [hl]
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $c
	add hl, de
	ld a, [hl]
	ld hl, $358
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1ac
	add hl, de
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld [hl], a
	jp Func_60d8c

Func_60d07: ; 60d07 (18:4d07)
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $358
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	pop de
	call Func_236f
	ld bc, $23
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlusParam16
	dw $359
	ld de, $c
	add hl, de
	pop de
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_5c6e3
	call GetHLAtSPPlusParam16
	dw $357
	call FarCall
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld [hl], a
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $22
	add hl, de
	ld [hl], a
	ld c, $1
	call GetHLAtSPPlusParam16
	dw $357
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_6015e
	jp Func_60d8c

Func_60d7b: ; 60d7b (18:4d7b)
	ld c, $1
	call GetHLAtSPPlusParam16
	dw $357
	push de
	push hl
	pop de
	pop hl
	ld hl, $2f
	call Func_6014a
Func_60d8c: ; 60d8c (18:4d8c)
	pop bc
	ld a, c
	cp $3
	jp c, Func_60da5
	ld a, c
	cp $5
	jp z, Func_60da5
	ld a, c
	cp $7
	jp z, Func_60da5
	ld a, c
	cp $8
	jp nz, Func_60e69
Func_60da5: ; 60da5 (18:4da5)
	push bc
	set_farcall_addrs_hli Func_673ff
	ld hl, $35b
	add hl, sp
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlusParam16
	dw $357
	ld de, $c
	add hl, de
	ld l, [hl]
	pop bc
	ld a, c
	cp $8
	jp z, Func_60e24
	cp $7
	jp nz, Func_60e69
	push hl
	ld c, $1
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, $c8
	call Func_6015e
	pop hl
	ld a, l
	cp $ab
	jp c, Func_60e21
	ld a, l
	cp $af
	jp nc, Func_60e21
	push hl
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop hl
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, ($b29f - $351 * $ab) & $ffff
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2
	ld bc, $351
	call CopyFromDEtoHL
	ld hl, $355
	add hl, sp
	ld a, [hl]
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, $351
	call Func_6015e
Func_60e21: ; 60e21 (18:4e21)
	jp Func_60e69

Func_60e24: ; 60e24 (18:4e24)
	push hl
	ld c, $1
	call GetHLAtSPPlus4
	push de
	push hl
	pop de
	pop hl
	ld hl, $c8
	call Func_6014a
	pop hl
	ld a, l
	cp $ab
	jp c, Func_60e69
	ld a, l
	cp $af
	jp nc, Func_60e69
	ld c, $1
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, $351
	call Func_6014a
	ld bc, $351
	ld hl, sp+$2
	push hl
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	pop de
	call CopyFromDEtoHL
Func_60e69: ; 60e69 (18:4e69)
	ld hl, $35a
	add hl, sp
	ld sp, hl
	ret

Data_60e6f:
	dr $60e6f, $60e77

Data_60e77:
	dr $60e77, $60e81

Func_60e81:
	add sp, -$2e
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	ld a, [wVideoTransferRequestFlags + 1]
	ld e, a
	push de
	ld hl, sp+$6
	ld [hl], $0
Func_60e9e: ; 60e9e (18:4e9e)
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_60ef4
	set_farcall_addrs_hli Func_17aba
	ld hl, $23
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_6b55
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_60e9e

Func_60ef4: ; 60ef4 (18:4ef4)
	pop de
	pop hl
	pop af
	push de
	push hl
	cp $ff
	jp z, Func_60f5a
	push af
	set_farcall_addrs_hli Func_6b55
	pop af
	push af
	ld hl, sp+$7
	push de
	push hl
	pop de
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_6b74
	ld hl, sp+$7
	push de
	push hl
	pop de
	pop hl
	xor a
	call FarCall
	ld hl, sp+$7
	ld [hl], $0
	ld a, $1
Func_60f30: ; 60f30 (18:4f30)
	cp $4
	jp nc, Func_60f51
	push af
	set_farcall_addrs_hli Func_6b74
	pop af
	push af
	ld hl, sp+$9
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop af
	inc a
	jp Func_60f30

Func_60f51: ; 60f51 (18:4f51)
	ld a, $4
	call Func_14fc
	pop af
	jp Func_60f61

Func_60f5a: ; 60f5a (18:4f5a)
	push af
	ld a, $6
	call Func_14fc
	pop af
Func_60f61: ; 60f61 (18:4f61)
	push af
	ld a, $1
	ld [$c2fa], a
	ld a, [wOAM06XCoord]
	cp $81
	jp nz, Func_60f7d
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld [hl], $3
	jp Func_60f88

Func_60f7d: ; 60f7d (18:4f7d)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c4
	add hl, de
	ld [hl], $1
Func_60f88: ; 60f88 (18:4f88)
	pop af
	push af
	cp $ff
	jp nz, Func_60f92
	call Func_6020a
Func_60f92: ; 60f92 (18:4f92)
	call ReadHalfWordAt
	dw wc2e6
	ld de, $1c
	add hl, de
	call WriteHLToSPPlusParam8
	inc [hl]
	ld hl, sp+$6
	ld [hl], $0
Func_60fa3: ; 60fa3 (18:4fa3)
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_6103d
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_6103d
	ld c, $0
	ld hl, sp+$6
	ld e, [hl]
	xor a
	call Func_609d3
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $36
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlusParam8
	db $36
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	call GetHLAtSPPlusParam8
	db $34
	ld de, $75
	add hl, de
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_6b74
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_60fa3

Func_6103d: ; 6103d (18:503d)
	ld c, $0
Func_6103f: ; 6103f (18:503f)
	ld a, c
	cp $4
	jp nc, Func_61076
	push bc
	set_farcall_addrs_hli Func_6b55
	pop bc
	push bc
	ld a, c
	ld hl, sp+$9
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop bc
	call GetHLAtSPPlusParam8
	dec d
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_61072
	jp Func_61076

Func_61072: ; 61072 (18:5072)
	inc c
	jp Func_6103f

Func_61076: ; 61076 (18:5076)
	push bc
	call ReadHalfWordAt
	dw wc2e6
	ld de, $e2
	add hl, de
	ld [hl], c
	ld a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank
	pop hl
	pop bc
	ld a, c
	ld [$c98d], a
	ld a, l
	call GetSRAMBank
	pop af
	pop hl
	cp $ff
	jp z, Func_610b1
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $7
	call FarCall
	jp Func_610d1

Func_610b1: ; 610b1 (18:50b1)
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_60e77
	ld bc, $a
	call MemCopy
	set_farcall_addrs_hli Func_d7f5
	ld de, $0
	ld a, $4
	call FarCall
Func_610d1: ; 610d1 (18:50d1)
	call Func_62865
	call Func_601d4
	pop de
	push af
	push de
	xor a
	ld [$c2fa], a
	xor a
Func_610df: ; 610df (18:50df)
	cp $4
	jp nc, Func_6112a
	push af
	set_farcall_addrs_hli Func_6b74
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	set_farcall_addrs_hli Func_17c57
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$2a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call FarCall
	pop af
	inc a
	jp Func_610df

Func_6112a: ; 6112a (18:512a)
	pop de
	ld a, e
	call Func_14fc
	pop af
	add sp, $2e
	ret

Func_61133:
	push hl
	add sp, -$44
	push de
	ld a, $1
	ld hl, -1
	call WriteHLToSPPlusParam8
	db $45
	pop hl
	call WriteHLToSPPlusParam8
	db $41
Func_61145: ; 61145 (18:5145)
	or a
	jp z, Func_61179
	set_farcall_addrs_hli Func_4b8ac
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3f
	call FarCall
	push af
	ld hl, sp+$2
	push hl
	call GetHLAtSPPlusParam8
	db $4a
	pop de
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlusParam8
	db $48
	inc hl
	inc hl
	call WriteHLToSPPlusParam8
	db $48
	pop af
	jp Func_61145

Func_61179: ; 61179 (18:5179)
	add sp, $46
	ret

Data_6117c:
	dr $6117c, $6118b

Data_6118b:
	dr $6118b, $611f7

Func_611f7:
	push af
	add sp, -$10
	push de
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_6117c
	ld bc, $f
	call MemCopy
	ld hl, $7fff
	call WriteHLToSPPlus5
	xor a
Func_61211: ; 61211 (18:5211)
	cp $2
	jp nc, Func_6123f
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_6118b
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$5
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp Func_61211

Func_6123f: ; 6123f (18:523f)
	ld hl, $0
	call WriteHLToSPPlusParam8
	dec bc
	xor a
	pop de
Func_61248: ; 61248 (18:5248)
	cp $2
	jp nc, Func_61276
	push de
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_6118b
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	pop de
	jp Func_61248

Func_61276: ; 61276 (18:5276)
	ld hl, $0
	call WriteHLToSPPlusParam8
	rrca
	ld de, $f
	ld hl, sp+$0
	call Func_2b83
	add sp, $12
	ret

Data_61288:
	dr $61288, $612f4

Func_612f4:
	push af
	push de
Func_612f6: ; 612f6 (18:52f6)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_612f6
	ld hl, $7fff
	call WriteHalfWordTo
	dw $c8b4
	call WriteHalfWordTo
	dw $c8ac
	call WriteHalfWordTo
	dw $c89c
	ld hl, $0
	call WriteHalfWordTo
	dw $c8ba
	call WriteHalfWordTo
	dw $c8b2
	call WriteHalfWordTo
	dw $c8a2
	ld a, [$c2fa]
	cp $3
	jp z, Func_6135a
	ld hl, $7fff
	call WriteHalfWordTo
	dw $c8a4
	ld hl, $0
	call WriteHalfWordTo
	dw $c8aa
	xor a
Func_6133b: ; 6133b (18:533b)
	cp $2
	jp nc, Func_6135a
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_61288
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $c8a6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp Func_6133b

Func_6135a: ; 6135a (18:535a)
	xor a
Func_6135b: ; 6135b (18:535b)
	cp $2
	jp nc, Func_6137a
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_61288
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wCGB_BGPalsBuffer + 2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp Func_6135b

Func_6137a: ; 6137a (18:537a)
	xor a
Func_6137b: ; 6137b (18:537b)
	cp $2
	jp nc, Func_613a6
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_61288
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $c8ae
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	jp Func_6137b

Func_613a6: ; 613a6 (18:53a6)
	xor a
	pop de
Func_613a8: ; 613a8 (18:53a8)
	cp $2
	jp nc, Func_613d3
	push de
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_61288
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $c8b6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	inc a
	pop de
	jp Func_613a8

Func_613d3: ; 613d3 (18:53d3)
	ld bc, $40
	ld de, wCGB_BGPalsBuffer
	ld hl, wCGB_OBPalsBuffer
	call CopyFromDEtoHL
	ld a, [$c2fa]
	cp $4
	jp z, Func_613fa
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_613f2: ; 613f2 (18:53f2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_613f2
Func_613fa: ; 613fa (18:53fa)
	pop bc
	ret

Func_613fc: ; 613fc (18:53fc)
	push af
	ld a, [wSystemType]
	cp $11
	jp nz, Func_6140e
	ld hl, sp+$1
	ld a, [hl]
	call Func_612f4
	jp Func_61414

Func_6140e: ; 6140e (18:540e)
	ld hl, sp+$1
	ld a, [hl]
	call Func_611f7
Func_61414: ; 61414 (18:5414)
	pop bc
	ret

Data_61416:
	dr $61416, $61424

Func_61424: ; 61424 (18:5424)
	push af
	add sp, -$e
	push de
	push bc
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $5416
	ld bc, $e
	call MemCopy
	pop bc
	pop de
	ld a, [wSystemType]
	cp $ff
	jp z, Func_614c8
	cp $1
	jp z, Func_614c8
	cp $11
	jp nz, Func_614f0
	push de
	push bc
	set_farcall_addrs_hli Func_c7109
	pop bc
	pop de
	push bc
	push de
	ld de, PutOnVideoTransferQueue
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_c7109
	ld hl, sp+$13
	ld c, [hl]
	ld de, $908
	ld hl, $5
	call FarCall
	set_farcall_addrs_hli Func_c7109
	pop de
	ld c, e
	ld de, $908
	ld hl, $a05
	call FarCall
	set_farcall_addrs_hli Func_c7109
	pop bc
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	ld a, $2
	ld [wOAM26VTile], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp Func_614f0

Func_614c8: ; 614c8 (18:54c8)
	ld hl, sp+$f
	ld a, [hl]
	add a
	add a
	ld hl, sp+$f
	add [hl]
	ld l, a
	ld a, c
	add a
	add a
	add a
	add a
	add l
	ld hl, sp+$3
	ld [hl], a
	ld a, c
	add a
	add a
	add a
	add a
	ld l, a
	ld a, e
	add a
	add a
	add e
	add l
	ld hl, sp+$9
	ld [hl], a
	ld de, $e
	ld hl, sp+$0
	call Func_2b83
Func_614f0: ; 614f0 (18:54f0)
	add sp, $10
	ret

Data_614f3:
	dr $614f3, $615c3

Func_615c3:
	ld e, a
	ld d, $0
	ld hl, Data_614f3
	add hl, de
	ld a, [hl]
	ret

Func_615cc: ; 615cc (18:55cc)
	xor a
	ret

Func_615ce: ; 615ce (18:55ce)
	push hl
	push bc
	push bc
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $15
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wOAMBuffer2
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	call WriteHLToSPPlus8
	pop de
	ld hl, $10
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp z, Func_6160e
	ld hl, $30
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld bc, $fff0
	jp Func_61611

Func_6160e: ; 6160e (18:560e)
	ld bc, $10
Func_61611: ; 61611 (18:5611)
	xor a
Func_61612: ; 61612 (18:5612)
	cp $4
	jp nc, Func_616c2
	push af
	push bc
	push de
	ld c, e
	ld b, d
	inc b
	dec b
	bit 7, b
	jr nz, .asm_6162d
	ld e, c
	ld d, b
	ld hl, $98
	call CompareHLtoDE
	jp nc, Func_61630
.asm_6162d
	ld bc, $0
Func_61630: ; 61630 (18:5630)
	ld hl, sp+$7
	ld [hl], $0
Func_61634: ; 61634 (18:5634)
	ld hl, sp+$7
	ld a, [hl]
	cp $8
	jp nc, Func_616b2
	push bc
	ld hl, sp+$8
	ld a, [hl]
	and $20
	jp z, Func_61662
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, $7
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call GetHLAtSPPlusParam8
	db $10
	pop de
	add hl, de
	ld c, l
	ld b, h
	jp Func_61675

Func_61662: ; 61662 (18:5662)
	call GetHLAtSPPlusParam8
	db $0e
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
Func_61675: ; 61675 (18:5675)
	inc b
	dec b
	bit 7, b
	jr nz, .asm_61686
	ld e, c
	ld d, b
	ld hl, $a8
	call CompareHLtoDE
	jp nc, Func_61689
.asm_61686
	ld bc, $0
Func_61689: ; 61689 (18:5689)
	call GetHLAtSPPlusParam8
	db $0c
	inc hl
	ld [hl], c
	pop bc
	call GetHLAtSPPlus10
	ld [hl], c
	ld hl, sp+$6
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus10
	jp Func_61634

Func_616b2: ; 616b2 (18:56b2)
	pop de
	pop bc
	push de
	push hl
	pop de
	pop hl
	add hl, bc
	push de
	push hl
	pop de
	pop hl
	pop af
	inc a
	jp Func_61612

Func_616c2: ; 616c2 (18:56c2)
	pop bc
	pop bc
	pop bc
	ret

Data_616c6:
	dr $616c6, $616ce

Data_616ce:
	dr $616ce, $616d5

Data_616d5:
	dr $616d5, $616db

Data_616db:
	dr $616db, $616dd

Func_616dd:
	push af
	push de
	add sp, -$26
	ld e, $2
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	ld hl, sp+$27
	ld [hl], a
	ld hl, sp+$26
	ld [hl], $0
	ld hl, sp+$9
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_616c6
	ld bc, $8
	call MemCopy
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_616ce
	ld bc, $7
	call MemCopy
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
Func_6172c: ; 6172c (18:572c)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_6172c
	ld hl, sp+$2b
	ld a, [hl]
	call ReadHalfWordAt
	dw wc2e6
	ld de, $b
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_f723
	ld hl, sp+$9
	call FarCall
	ld hl, sp+$2b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_616d5
	add hl, de
	ld e, [hl]
	ld hl, sp+$19
	ld [hl], e
	ld hl, sp+$2b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_616d5
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$1a
	ld [hl], e
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_6178d
	ld hl, $2
	call WriteHLToSPPlusParam8
	db $26
	ld hl, $703
	call WriteHLToSPPlusParam8
	db $24
	ld hl, sp+$27
	ld [hl], $1
	xor a
	jp Func_6179d

Func_6178d: ; 6178d (18:578d)
	ld hl, $b02
	call WriteHLToSPPlusParam8
	db $26
	ld hl, $1203
	call WriteHLToSPPlusParam8
	db $24
	ld a, $b
Func_6179d: ; 6179d (18:579d)
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2d
	ld a, [hl]
	or a
	jp nz, Func_617b7
	ld hl, $0
	jp Func_617ba

Func_617b7: ; 617b7 (18:57b7)
	ld hl, $2f
Func_617ba: ; 617ba (18:57ba)
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $26
	ld hl, $18
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $24
	call GetHLAtSPPlusParam8
	db $2e
	push hl
	call GetHLAtSPPlusParam8
	db $26
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlusParam8
	db $22
	call GetHLAtSPPlusParam8
	db $22
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_61802
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $22
Func_61802: ; 61802 (18:5802)
	ld hl, sp+$19
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $26
	push hl
	call GetHLAtSPPlusParam8
	db $26
	pop de
	call Func_2617
	ld hl, sp+$19
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$19
	call Func_1a1f
	ld hl, sp+$1b
	ld a, [hl]
	and $80
	jp z, Func_6182e
	ld hl, sp+$1a
	ld a, [hl]
	inc a
	ld hl, sp+$1a
	ld [hl], a
Func_6182e: ; 6182e (18:582e)
	ld hl, sp+$1a
	ld a, [hl]
	push af
	ld hl, sp+$17
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $28
	push hl
	call GetHLAtSPPlusParam8
	db $26
	pop de
	call Func_2617
	ld hl, sp+$17
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$17
	call Func_1a1f
	ld hl, sp+$19
	ld a, [hl]
	and $80
	jp z, Func_6185e
	ld hl, sp+$18
	ld a, [hl]
	inc a
	ld hl, sp+$18
	ld [hl], a
Func_6185e: ; 6185e (18:585e)
	ld hl, sp+$18
	ld a, [hl]
	ld hl, sp+$21
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $26
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$1b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $26
	ld e, l
	ld hl, sp+$1c
	ld [hl], e
	ld hl, sp+$1e
	xor a
	ld [hl], a
	ld hl, sp+$1d
	ld [hl], a
	pop af
	push af
	ld hl, sp+$17
	ld c, l
	ld b, h
	ld hl, sp+$21
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	call GetHLAtSPPlusParam8
	db $26
	push hl
	call GetHLAtSPPlusParam8
	db $2a
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call Func_2617
	ld a, $5d
	call Func_1502
	pop af
	ld e, a
Func_618b1: ; 618b1 (18:58b1)
	ld hl, sp+$1f
	ld a, [hl]
	cp e
	jp nc, Func_6197c
	push de
	ld hl, sp+$31
	ld a, [hl]
	ld l, e
	ld h, a
	push hl
	call GetHLAtSPPlusParam8
	db $2e
	pop de
	call Func_63c5f
	ld hl, sp+$1a
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$1e
	call Func_63ce1
	ld hl, sp+$2d
	ld a, [hl]
	or a
	jp z, Func_618eb
	ld hl, sp+$1c
	ld e, [hl]
	ld hl, sp+$1b
	ld h, [hl]
	ld d, h
	push de
	call GetHLAtSPPlusParam8
	db $2e
	inc h
	inc hl
	pop de
	call Func_63d05
Func_618eb: ; 618eb (18:58eb)
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call GetHLAtSPPlusParam8
	db $2c
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $2a
	push de
	push hl
	pop de
	pop hl
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call Func_63e6f
	pop de
	ld hl, sp+$2a
	ld a, [hl]
	cp $7
	jp c, Func_6192c
	push de
	ld hl, sp+$31
	ld e, [hl]
	ld d, $0
	ld hl, Data_616db
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	pop de
	jp Func_61940

Func_6192c: ; 6192c (18:592c)
	push de
	ld a, e
	and $1
	ld e, a
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	pop de
Func_61940: ; 61940 (18:5940)
	push de
	call WaitVideoTransfer
	ld a, [$c2cd]
	or a
	jp nz, Func_61956
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_6195e

Func_61956: ; 61956 (18:5956)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_6195e: ; 6195e (18:595e)
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
Func_61966: ; 61966 (18:5966)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_61966
	pop de
	dec e
	ld hl, sp+$2a
	ld a, [hl]
	inc a
	ld hl, sp+$2a
	ld [hl], a
	jp Func_618b1

Func_6197c: ; 6197c (18:597c)
	ld hl, sp+$2a
	ld a, [hl]
	cp $7
	jp nc, Func_619a5
	ld hl, sp+$2a
	ld a, [hl]
	and $1
	ld e, a
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	call Func_0451
	ld hl, sp+$2a
	ld a, [hl]
	inc a
	ld hl, sp+$2a
	ld [hl], a
	jp Func_6197c

Func_619a5: ; 619a5 (18:59a5)
	ld hl, sp+$1f
	ld a, [hl]
	or a
	jp nz, Func_619c1
	call GetHLAtSPPlusParam8
	db $22
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_619c1
	ld hl, sp+$1f
	ld [hl], $1
Func_619c1: ; 619c1 (18:59c1)
	ld hl, sp+$1f
	ld e, [hl]
	ld hl, sp+$2f
	ld h, [hl]
	ld d, h
	push de
	call GetHLAtSPPlusParam8
	db $2c
	pop de
	call Func_63c5f
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp z, Func_619e7
	call GetHLAtSPPlusParam8
	db $22
	push hl
	call GetHLAtSPPlusParam8
	db $2c
	inc h
	inc hl
	pop de
	call Func_63d05
Func_619e7: ; 619e7 (18:59e7)
	call WaitVideoTransfer
	pop bc
	call GetHLAtSPPlusParam8
	db $20
	push de
	push hl
	pop de
	pop hl
	ld hl, $18
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	pop de
	ld l, $2
	push hl
	ld c, $8
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli Func_f723
	ld hl, sp+$0
	call FarCall
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
Func_61a25: ; 61a25 (18:5a25)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_61a25
	call GetHLAtSPPlusParam8
	db $1c
	push de
	push hl
	pop de
	pop hl
	add sp, $2a
	push de
	push hl
	pop de
	pop hl
	ret

Func_61a3e:
	push af
	push de
	add sp, -$14
	ld e, $2
	push de
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp nz, Func_61a78
	ld hl, $2
	call WriteHLToSPPlusParam8
	db $15
	ld hl, $703
	call WriteHLToSPPlusParam8
	db $13
	ld hl, sp+$15
	ld [hl], $1
	xor a
	jp Func_61a88

Func_61a78: ; 61a78 (18:5a78)
	ld hl, $b02
	call WriteHLToSPPlusParam8
	db $15
	ld hl, $1203
	call WriteHLToSPPlusParam8
	db $13
	ld a, $b
Func_61a88: ; 61a88 (18:5a88)
	push af
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_61aa2
	ld hl, $0
	jp Func_61aa5

Func_61aa2: ; 61aa2 (18:5aa2)
	ld hl, $2f
Func_61aa5: ; 61aa5 (18:5aa5)
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $15
	ld hl, $18
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlusParam8
	db $13
	call GetHLAtSPPlusParam8
	db $1c
	push hl
	call GetHLAtSPPlusParam8
	db $15
	pop de
	add hl, de
	call WriteHLToSPPlusParam8
	db $11
	call GetHLAtSPPlusParam8
	db $15
	push hl
	call GetHLAtSPPlusParam8
	db $13
	pop de
	call CompareHLtoDE
	jp c, Func_61ae8
	call GetHLAtSPPlusParam8
	db $15
	call WriteHLToSPPlusParam8
	db $11
Func_61ae8: ; 61ae8 (18:5ae8)
	ld hl, sp+$a
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $15
	push hl
	call GetHLAtSPPlusParam8
	db $15
	pop de
	call Func_2617
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$a
	call Func_1a1f
	ld hl, sp+$c
	ld a, [hl]
	and $80
	jp z, Func_61b14
	ld hl, sp+$b
	ld a, [hl]
	inc a
	ld hl, sp+$b
	ld [hl], a
Func_61b14: ; 61b14 (18:5b14)
	ld hl, sp+$b
	ld a, [hl]
	push af
	ld hl, sp+$8
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $17
	push hl
	call GetHLAtSPPlusParam8
	db $15
	pop de
	call Func_2617
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$8
	call Func_1a1f
	ld hl, sp+$a
	ld a, [hl]
	and $80
	jp z, Func_61b44
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
Func_61b44: ; 61b44 (18:5b44)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$10
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$c
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $15
	ld e, l
	ld hl, sp+$d
	ld [hl], e
	ld hl, sp+$f
	xor a
	ld [hl], a
	ld hl, sp+$e
	ld [hl], a
	pop af
	push af
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld e, a
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	call GetHLAtSPPlusParam8
	db $17
	push hl
	call GetHLAtSPPlusParam8
	db $17
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call Func_2617
	pop af
	ld e, a
Func_61b92: ; 61b92 (18:5b92)
	ld a, e
	ld hl, sp+$e
	cp [hl]
	jp nc, Func_61c21
	push de
	ld hl, sp+$1f
	ld a, [hl]
	ld l, e
	ld h, a
	push hl
	call GetHLAtSPPlusParam8
	db $1d
	pop de
	call Func_63c5f
	ld hl, sp+$b
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$f
	call Func_63cf3
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp z, Func_61bcc
	ld hl, sp+$d
	ld e, [hl]
	ld hl, sp+$c
	ld h, [hl]
	ld d, h
	push de
	call GetHLAtSPPlusParam8
	db $1d
	inc h
	inc hl
	pop de
	call Func_63d05
Func_61bcc: ; 61bcc (18:5bcc)
	ld a, [$c2cd]
	xor $1
	ld [$c2cd], a
	call GetHLAtSPPlusParam8
	db $1b
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $19
	push de
	push hl
	pop de
	pop hl
	ld hl, $c2cd
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call Func_63e6f
	call WaitVideoTransfer
	ld a, [$c2cd]
	or a
	jp nz, Func_61c02
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_61c0a

Func_61c02: ; 61c02 (18:5c02)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_61c0a: ; 61c0a (18:5c0a)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
Func_61c12: ; 61c12 (18:5c12)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_61c12
	pop de
	inc e
	jp Func_61b92

Func_61c21: ; 61c21 (18:5c21)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp nz, Func_61c3d
	call GetHLAtSPPlusParam8
	db $11
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_61c3d
	ld hl, sp+$e
	ld [hl], $1
Func_61c3d: ; 61c3d (18:5c3d)
	ld hl, sp+$e
	ld e, [hl]
	ld hl, sp+$1d
	ld h, [hl]
	ld d, h
	push de
	call GetHLAtSPPlusParam8
	db $1b
	pop de
	call Func_63c5f
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_61c63
	call GetHLAtSPPlusParam8
	db $11
	push hl
	call GetHLAtSPPlusParam8
	db $1b
	inc h
	inc hl
	pop de
	call Func_63d05
Func_61c63: ; 61c63 (18:5c63)
	call WaitVideoTransfer
	pop bc
	call GetHLAtSPPlusParam8
	db $0f
	push de
	push hl
	pop de
	pop hl
	ld hl, $18
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	pop de
	ld l, $2
	push hl
	ld c, $8
	call Func_3ca1
	pop bc
	call GetHLAtSPPlusParam8
	db $0b
	push de
	push hl
	pop de
	pop hl
	add sp, $18
	push de
	push hl
	pop de
	pop hl
	ret

Func_61c90:
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus4
	ld de, $d
	add hl, de
	ld c, [hl]
	push bc
	cp $ff
	jp z, Func_61cc6
	push af
	ld d, a
	add a
	add d
	inc a
	ld l, a
	ld h, $0
	ld de, Data_61d32
	call PlaceStringDEatCoordHL
	pop af
	ld e, a
	ld d, $0
	ld hl, wOAM25VTile
	add hl, de
	ld [hl], $0
Func_61cc6: ; 61cc6 (18:5cc6)
	pop bc
	pop af
	push bc
	push af
	ld d, a
	add a
	add d
	inc a
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_61d34
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	pop bc
	push af
	ld e, a
	ld d, $0
	ld hl, wOAM25VTile
	add hl, de
	ld [hl], $1
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp z, Func_61d23
	ld a, c
	cp $10
	jp nz, Func_61d23
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	inc hl
	ld a, l
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_61d37
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61d23: ; 61d23 (18:5d23)
	pop af
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ret

Data_61d32:
	db " ", $00

Data_61d34:
	TX_STACK
	db $00

Data_61d37:
	TX_STACK
	db $00

Data_61d3a:
	dr $61d3a, $61d3e

Func_61d3e:
	push hl
	push de
	push bc
	push bc
	callba_hli Func_da4dc
	set_farcall_addrs_hli Func_da835
	xor a
	call FarCall
	ld c, $0
Func_61d61: ; 61d61 (18:5d61)
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_61dd8
	push bc
	ld a, c
	add a
	add a
	ld d, a
	add a
	add d
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$4
	ld [hl], $10
	ld a, c
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $1
	jp c, Func_61da6
	inc a
	cp $5
	jp nz, Func_61d9f
	ld a, $1
Func_61d9f: ; 61d9f (18:5d9f)
	call GetHLAtSPPlus8
	ld [hl], a
	jp Func_61da8

Func_61da6: ; 61da6 (18:5da6)
	ld a, $1
Func_61da8: ; 61da8 (18:5da8)
	push af
	set_farcall_addrs_hli Func_da839
	pop af
	ld e, a
	ld d, $0
	ld hl, $5d39
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld h, [hl]
	ld d, h
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	pop bc
	inc c
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_61d61

Func_61dd8: ; 61dd8 (18:5dd8)
	callba_hli Func_d9f55
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_61deb:
	push af
Func_61dec: ; 61dec (18:5dec)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_61e1c
	call Func_3aa8
	set_farcall_addrs_hli Func_14771
	xor a
	call FarCall
	push de
	push hl
	pop de
	pop hl
	ld hl, $3
	call CompareHLtoDE
	jp c, Func_61e19
	ld a, e
	and d
	inc a
	jp nz, Func_61e1c
Func_61e19: ; 61e19 (18:5e19)
	jp Func_61e59

Func_61e1c: ; 61e1c (18:5e1c)
	set_farcall_addrs_hli Func_14d4a
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_61e38
	jp Func_61e59

Func_61e38: ; 61e38 (18:5e38)
	set_farcall_addrs_hli Func_14d93
	ld hl, $0
	call FarCall
	push de
	push hl
	pop de
	pop hl
	ld a, e
	dec a
	or d
	jp z, Func_61e56
	jp Func_61e59

Func_61e56: ; 61e56 (18:5e56)
	jp Func_61dec

Func_61e59: ; 61e59 (18:5e59)
	pop bc
	ret

Func_61e5b:
	push de
	push hl
	pop de
	pop hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $5
	add hl, de
	ld l, [hl]
	add l
	push af
	ld l, $d
	push hl
	ld c, $b
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop af
	cp $5
	jp z, Func_61eeb
	cp $4
	jp z, Func_61eda
	cp $3
	jp z, Func_61ec9
	cp $2
	jp z, Func_61eb8
	cp $1
	jp z, Func_61ea7
	or a
	jp nz, Func_61ef0
	callba_hli Func_804c
	jp Func_61ef0

Func_61ea7: ; 61ea7 (18:5ea7)
	callba_hli Func_cd9a
	jp Func_61ef0

Func_61eb8: ; 61eb8 (18:5eb8)
	callba_hli Func_10011
	jp Func_61ef0

Func_61ec9: ; 61ec9 (18:5ec9)
	callba_hli Func_144dd
	jp Func_61ef0

Func_61eda: ; 61eda (18:5eda)
	callba_hli Func_5190c
	jp Func_61ef0

Func_61eeb: ; 61eeb (18:5eeb)
	ld a, $3
	call Func_14fc
Func_61ef0: ; 61ef0 (18:5ef0)
	ld hl, $8000
	ret

Func_61ef3:
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	ld de, Data_61f11
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_61f23
	ld hl, $110
	call PlaceStringDEatCoordHL
	ret

Data_61f11:
	db "<HIRA>はけんする<KATA> ロホﾞホﾟン<HIRA>を<KATA>", $00

Data_61f23:
	db "4<HIRA>たい えらんてﾞくたﾞさい<KATA>", $00

Func_61f34:
	push af
	push de
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_61f3b: ; 61f3b (18:5f3b)
	ld hl, sp+$0
	ld a, [hl]
	cp c
	jp nc, Func_61fae
	push bc
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp z, Func_61f64
	ld hl, sp+$2
	ld a, [hl]
	add a
	inc a
	ld e, a
	ld a, $8
	call SetStringStartState
	ld hl, $8f
	push hl
	ld hl, Data_61fb2
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61f64: ; 61f64 (18:5f64)
	ld e, $0
Func_61f66: ; 61f66 (18:5f66)
	ld a, e
	cp $4
	jp nc, Func_61fa3
	push de
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$4
	add [hl]
	ld d, $0
	ld hl, wOAM20Attrs
	add hl, de
	cp [hl]
	jp nz, Func_61f9e
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$6
	cp [hl]
	jp z, Func_61f9e
	ld hl, sp+$4
	ld a, [hl]
	add a
	inc a
	ld e, a
	ld a, $8
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, $5fb5
	push hl
	call PlaceString
	pop bc
	pop bc
Func_61f9e: ; 61f9e (18:5f9e)
	pop de
	inc e
	jp Func_61f66

Func_61fa3: ; 61fa3 (18:5fa3)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
	jp Func_61f3b

Func_61fae: ; 61fae (18:5fae)
	pop bc
	pop bc
	pop bc
	ret

Data_61fb2:
	TX_STACK
	db $00

Data_61fb5:
	TX_STACK
	db $00

Func_61fb8:
	push hl
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld a, [hl]
	push af
	cp $2
	jp z, Func_61fd8
	cp $5
	jp nz, Func_61fe5
	ld c, $3
	ld e, $d
	ld hl, $0
	call Func_600f4
	jp Func_61fef

Func_61fd8: ; 61fd8 (18:5fd8)
	ld c, $9
	ld e, $a
	ld hl, $6
	call Func_600f4
	jp Func_61fef

Func_61fe5: ; 61fe5 (18:5fe5)
	ld c, $7
	ld e, $a
	ld hl, $6
	call Func_600f4
Func_61fef: ; 61fef (18:5fef)
	pop af
	cp $5
	jp z, Func_62044
	cp $2
	jp z, Func_6201d
	cp $1
	jp nz, Func_62068
	ld de, Data_6206a
	ld hl, $107
	call PlaceStringDEatCoordHL
	ld de, Data_6206f
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_62076
	ld hl, $10b
	call PlaceStringDEatCoordHL
	jp Func_62068

Func_6201d: ; 6201d (18:601d)
	ld de, Data_62079
	ld hl, $107
	call PlaceStringDEatCoordHL
	ld de, Data_62085
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_62092
	ld hl, $10b
	call PlaceStringDEatCoordHL
	ld de, Data_6209e
	ld hl, $10d
	call PlaceStringDEatCoordHL
	jp Func_62068

Func_62044: ; 62044 (18:6044)
	ld de, Data_620a7
	ld hl, $c05
	call PlaceStringDEatCoordHL
	ld de, Data_620b3
	ld hl, $c07
	call PlaceStringDEatCoordHL
	ld de, Data_620c0
	ld hl, $c09
	call PlaceStringDEatCoordHL
	ld de, Data_620cc
	ld hl, $c0b
	call PlaceStringDEatCoordHL
Func_62068: ; 62068 (18:6068)
	pop bc
	ret

Data_6206a:
	db "RAM:", $00

Data_6206f:
	db "<HIRA>いりょく<KATA>", $00

Data_62076:
	db "EP", $00

Data_62079:
	db "<HIRA>こうけﾞき<KATA>   0", $00

Data_62085:
	db "<HIRA>ほﾞうきﾞょ<KATA>   0", $00

Data_62092:
	db "<HIRA>すはﾞやさ<KATA>   0", $00

Data_6209e:
	db "RAM:  0M", $00

Data_620a7:
	db "<HIRA>こうけﾞき<KATA>   0", $00

Data_620b3:
	db "<HIRA>ほﾞうきﾞょ<KATA>   0", $00

Data_620c0:
	db "<HIRA>すはﾞやさ<KATA>   0", $00

Data_620cc:
	db "RAM:  0M", $00

Func_620d5:
	push hl
	push de
	push bc
	add sp, -$3a
	call ReadHalfWordAt
	dw wc2e6
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $40
	ld e, h
	ld hl, sp+$36
	ld [hl], e
	call GetHLAtSPPlusParam8
	db $40
	ld h, $0
	call WriteHLToSPPlusParam8
	db $40
	ld a, l
	ld hl, sp+$35
	ld [hl], a
	ld hl, $17
	add hl, bc
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld hl, $14
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, $15
	add hl, bc
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
	ld hl, $16
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld hl, sp+$37
	ld [hl], $ff
	ld hl, sp+$36
	ld a, [hl]
	cp $5
	jp z, Func_622e9
	or a
	jp nz, Func_62389
	push de
	ld hl, sp+$3a
	ld [hl], $0
Func_6214b: ; 6214b (18:614b)
	ld hl, sp+$3a
	ld a, [hl]
	cp $4
	jp nc, Func_6217d
	ld hl, sp+$3a
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_62173
	ld hl, sp+$39
	ld [hl], $1
	jp Func_6217d

Func_62173: ; 62173 (18:6173)
	ld hl, sp+$3a
	ld a, [hl]
	inc a
	ld hl, sp+$3a
	ld [hl], a
	jp Func_6214b

Func_6217d: ; 6217d (18:617d)
	pop de
	ld hl, sp+$37
	ld a, [hl]
	cp $ff
	jp nz, Func_6218f
	ld a, e
	call GetSRAMBank
	ld a, $ff
	jp Func_623cd

Func_6218f: ; 6218f (18:618f)
	push de
	ld hl, sp+$3c
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$8
	call Func_236f
	ld hl, sp+$3c
	ld a, [hl]
	ld hl, sp+$3a
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld [hl], a
	ld hl, sp+$14
	push hl
	ld hl, sp+$3c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	pop de
	ld bc, $23
	call CopyFromDEtoHL
	ld hl, sp+$3a
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	call WriteHLToSPPlus8
	ld hl, sp+$37
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $22
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $e
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlusParam8
	db $40
	push hl
	call GetHLAtSPPlus10
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $26
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $12
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus8
	ld de, $10
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $2d
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $17
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $31
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $1b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$37
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlusParam8
	db $2f
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus8
	ld de, $1d
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$5
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $b
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus8
	ld de, $a
	add hl, de
	ld [hl], a
	pop de
	jp Func_62389

Func_622e9: ; 622e9 (18:62e9)
	push de
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $2
	call FarCall
	callba_hli Func_7d01
	ld hl, sp+$3a
	ld [hl], a
	pop de
	ld hl, sp+$38
	ld a, [hl]
	cp $ff
	jp z, Func_62389
	push de
	ld hl, sp+$38
	ld a, [hl]
	cp $5
	jp nz, Func_62381
	ld hl, sp+$3c
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$8
	call Func_236f
	set_farcall_addrs_hli Func_6086c
	ld hl, sp+$37
	ld e, [hl]
	ld hl, sp+$8
	call FarCall
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$1f
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$1d
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$1e
	ld [hl], a
	ld hl, sp+$37
	ld a, [hl]
	ld hl, sp+$1b
	ld [hl], a
	call GetHLAtSPPlusParam8
	db $40
	call WriteHLToSPPlusParam8
	db $22
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $33
	set_farcall_addrs_hli Func_7db0
	ld hl, sp+$14
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
Func_62381: ; 62381 (18:6381)
	ld hl, sp+$39
	ld [hl], $1
	pop de
	jp Func_62389

Func_62389: ; 62389 (18:6389)
	ld a, e
	call GetSRAMBank
	ld hl, sp+$37
	ld a, [hl]
	cp $1
	jp nz, Func_623ca
	ld hl, sp+$36
	ld a, [hl]
	or a
	jp z, Func_623a4
	ld hl, sp+$36
	ld a, [hl]
	cp $5
	jp nz, Func_623ca
Func_623a4: ; 623a4 (18:63a4)
	set_farcall_addrs_hli Func_53a0d
	ld e, $0
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $1
	ld hl, sp+$3a
	ld a, [hl]
	call FarCall
Func_623ca: ; 623ca (18:63ca)
	ld hl, sp+$37
	ld a, [hl]
Func_623cd: ; 623cd (18:63cd)
	add sp, $40
	ret

Func_623d0:
	add sp, -$1c
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$1d
	xor a
	ld [hl], a
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1b
	ld [hl], a
	set_farcall_addrs_hli Func_16104
	ld e, $0
	ld a, [wc2e8 + 1]
	call FarCall
	ld hl, sp+$1b
	ld [hl], a
	ld e, $1
	ld a, [wc2e8 + 1]
	call FarCall
	ld hl, sp+$1c
	ld [hl], a
	ld e, $2
	ld a, [wc2e8 + 1]
	call FarCall
	ld hl, sp+$1d
	ld [hl], a
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $b
	add hl, de
	ld a, [hl]
	ld e, a
	ld hl, sp+$2
	call Func_241f
	ld hl, sp+$11
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, sp+$1a
	ld [hl], a
	ld c, $0
Func_62449: ; 62449 (18:6449)
	ld a, c
	cp $3
	jp nc, Func_62478
	ld e, c
	ld d, $0
	ld hl, sp+$1b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_62474
	ld e, c
	ld d, $0
	ld hl, sp+$1b
	add hl, de
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	add a
	ld d, a
	add a
	add a
	add d
	ld e, a
	ld hl, sp+$1a
	ld a, [hl]
	sub e
	ld hl, sp+$1a
	ld [hl], a
Func_62474: ; 62474 (18:6474)
	inc c
	jp Func_62449

Func_62478: ; 62478 (18:6478)
	pop af
	call GetSRAMBank
	ld hl, sp+$18
	ld a, [hl]
	add sp, $1c
	ret

Data_62482:
	dw Data_62486, $0000

Data_62486:
	db "<HIRA>RAMかﾞたりないよ<KATA>", $00

Data_62493:
	dw Data_62497, $0000

Data_62497:
	db "ソフト<HIRA>かﾞ いっはﾟいてﾞ はすﾞせません<KATA>", $00

Func_624af:
	push af
	add sp, -$2c
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_62482
	ld bc, $4
	call MemCopy
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	ld hl, Data_62493
	ld bc, $4
	call MemCopy
	set_farcall_addrs_hli Func_17aba
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_2124
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_600f4
	ld hl, sp+$2f
	ld a, [hl]
	cp $2
	jp z, Func_6251c
	cp $1
	jp nz, Func_6256a
	ld de, Data_6273a
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_6256a

Func_6251c: ; 6251c (18:651c)
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	push af
	set_farcall_addrs_hli Func_5601b
	ld c, $1
	ld a, [wOAM04XCoord]
	ld e, a
	ld hl, sp+$11
	call FarCall
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$f
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld hl, Data_6274e
	push hl
	call PlaceString
	pop bc
Func_6256a: ; 6256a (18:656a)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, sp+$2f
	ld a, [hl]
	cp $3
	jp z, Func_6259a
	or a
	jp nz, Func_625ab
	ld c, $18
	ld hl, sp+$6
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call Func_6011c
	ld hl, $0
	call WriteHLToSPPlusParam8
	db $0c
	jp Func_625bd

Func_6259a: ; 6259a (18:659a)
	ld c, $18
	ld hl, sp+$2
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call Func_6011c
	jp Func_625bd

Func_625ab: ; 625ab (18:65ab)
	callba_hli Func_1482e
	call WriteHLToSPPlusParam8
	db $0c
Func_625bd: ; 625bd (18:65bd)
	call GetHLAtSPPlusParam8
	db $0c
	ld a, l
	or h
	jp nz, Func_626ff
	ld hl, sp+$2f
	ld a, [hl]
	cp $2
	jp nz, Func_626ff
	ld hl, sp+$c
	ld [hl], $0
	set_farcall_addrs_hli Func_16007
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld a, [wOAM04XCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$f
	ld [hl], a
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$f
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_62656
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$f
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6264f
	ld c, $18
	ld hl, sp+$4
	push de
	push hl
	pop de
	pop hl
	ld hl, $10e
	call Func_6011c
	ld hl, sp+$e
	ld [hl], $1
	jp Func_62656

Func_6264f: ; 6264f (18:664f)
	ld hl, $2
	call WriteHLToSPPlusParam8
	db $0e
Func_62656: ; 62656 (18:6656)
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp nz, Func_626fb
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	ld a, [wOAM04XCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	ld hl, sp+$10
	ld a, [wOAM04XCoord]
	ld [hl], a
Func_62685: ; 62685 (18:6685)
	ld hl, sp+$10
	ld a, [hl]
	cp $2
	jp nc, Func_626e0
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, [hl]
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $8
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], a
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld hl, sp+$10
	ld [hl], a
	jp Func_62685

Func_626e0: ; 626e0 (18:66e0)
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld de, $a
.asm_626f6
	add hl, de
.asm_626f9
	ld [hl], $0
Func_626fb: ; 626fb (18:66fb)
	pop af
	call GetSRAMBank
Func_626ff: ; 626ff (18:66ff)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call Func_21ca
	ld l, $12
	push hl
	ld c, $14
.asm_6271c
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli Func_17c57
	pop hl
	call FarCall
	call GetHLAtSPPlus10
	ld a, l
	add sp, $2e
	ret

Data_6273a:
	db "<HIRA>すへﾞてはすﾞして いいてﾞすか?<KATA>", $00

Data_6274e:
	db "<HIRA>を はすﾞしますか?<KATA>", $00

Func_6275b:
	push bc
	push bc
	push hl
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	set_farcall_addrs_hli Func_524b6
	pop hl
	call FarCall
	cp $ff
	jp nz, Func_6278f
	ld hl, $4000
	jp Func_62822

Func_6278f: ; 6278f (18:678f)
	ld hl, sp+$1
	ld [hl], $0
Func_62793: ; 62793 (18:6793)
	ld hl, sp+$1
	ld a, [hl]
	cp $3
	jp nc, Func_6280a
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wOAM11Attrs
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_62800
	ld hl, sp+$0
	ld [hl], $0
Func_627b9: ; 627b9 (18:67b9)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_62800
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wOAM11Attrs
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nz, Func_627f6
	set_farcall_addrs_hli Func_6bbf3
	ld e, $0
	ld a, $8
	call FarCall
	ld hl, $8000
	jp Func_62822

Func_627f6: ; 627f6 (18:67f6)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_627b9

Func_62800: ; 62800 (18:6800)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_62793

Func_6280a: ; 6280a (18:680a)
	set_farcall_addrs_hli Func_31bbe
	ld c, $0
	ld e, $4
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld hl, -1
Func_62822: ; 62822 (18:6822)
	pop bc
	pop bc
	ret

Data_62825:
	dr $62825, $62845

Data_62845:
	dr $62845, $62865

Func_62865: ; 62865 (18:6865)
	ld a, [wSystemType]
	cp $11
	jp z, Func_62870
	jp Func_628a3

Func_62870: ; 62870 (18:6870)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_62870
	ld bc, $20
	ld de, Data_62825
	ld hl, $c8bc
	call CopyFromDEtoHL
	ld bc, $20
	ld de, Data_62845
	ld hl, $c8fc
	call CopyFromDEtoHL
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_6289b: ; 6289b (18:689b)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_6289b
Func_628a3: ; 628a3 (18:68a3)
	ret

Data_628a4:
	dr $628a4, $62ac4

Data_62ac4:
	dr $62ac4, $62ce4

Func_62ce4: ; 62ce4 (18:6ce4)
	ld a, [wNextVBlankFlags]
	bit 6, a
	ret nz
	ld a, [wc2e6]
	ld l, a
	ld a, [wc2e6 + 1]
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp b
	ret c
	xor a
	ld [hli], a
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add c
	pop hl
	cp $ff
	ret z
	cp $11
	ret z
	ld [hli], a
	ld c, a
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	cp $3
	jp z, Func_62d2c
	cp $5
	jp z, Func_62d37
	cp $7
	jp z, Func_62d42
	cp $2
	jp z, Func_62de6
	cp $4
	jp z, Func_62df1
	cp $6
	jp z, Func_62dfc
	ret

Func_62d2c: ; 62d2c (18:6d2c)
	ld de, Func_0245
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $20
	jr asm_62d4b

Func_62d37: ; 62d37 (18:6d37)
	ld de, $2a5
	add hl, de
	ld de, wCGB_OBPalsBuffer
	ld a, $20
	jr asm_62d4b

Func_62d42: ; 62d42 (18:6d42)
	ld de, Func_0245
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $40
asm_62d4b
	push af
	push de
	ld de, $0
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld e, [hl]
	sla e
	sla e
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_62ac4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	ld a, c
	ld c, e
	ld b, d
	pop de
	pop hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	push hl
	ld l, e
	ld h, d
	pop de
	ld c, a
	ld b, $0
	pop af
	dec a
	jp nz, asm_62d4b
	ld a, [wNextVBlankFlags]
	set 6, a
	ld [wNextVBlankFlags], a
	ret

Func_62de6: ; 62de6 (18:6de6)
	ld de, Func_0245
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $20
	jr asm_62e05

Func_62df1: ; 62df1 (18:6df1)
	ld de, $2a5
	add hl, de
	ld de, wCGB_OBPalsBuffer
	ld a, $20
	jr asm_62e05

Func_62dfc: ; 62dfc (18:6dfc)
	ld de, Func_0245
	add hl, de
	ld de, wCGB_BGPalsBuffer
	ld a, $40
asm_62e05
	push af
	push de
	ld de, $0
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld e, [hl]
	sla e
	sla e
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	ld a, [hli]
	push hl
	push bc
	push af
	swap a
	ld c, a
	res 0, c
	and $1
	rra
	rl b
	ld hl, Data_628a4
	add hl, bc
	pop af
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	add hl, bc
	ld a, [hl]
	or e
	ld e, a
	ld a, c
	ld c, e
	ld b, d
	pop de
	pop hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	push hl
	ld l, e
	ld h, d
	pop de
	ld c, a
	ld b, $0
	pop af
	dec a
	jp nz, asm_62e05
	ld a, [wNextVBlankFlags]
	set 6, a
	ld [wNextVBlankFlags], a
	ret

Func_62ea0:
	ld de, 1750
.delay
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .delay
	dec bc
	ld a, b
	or c
	jr nz, Func_62ea0
	ret

Func_62eb1: ; 62eb1 (18:6eb1)
	ld a, [hl]
	and $7
	ret z
	ld b, a
	ld c, $0
.asm_62eb8
	push bc
	ld a, $0
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	ld b, $10
.asm_62ec1
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_62ec5
	bit 0, d
	ld a, $10
	jr nz, .asm_62ecd
	ld a, $20
.asm_62ecd
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	rr d
	dec e
	jr nz, .asm_62ec5
	dec b
	jr nz, .asm_62ec1
	ld a, $20
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	pop bc
	dec b
	ret z
	jr .asm_62eb8

Func_62ee4:
	ld hl, Data_62f52
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_62f34
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, $10
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_62f34
	ld hl, Data_62f42
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	sub a
	ret

.asm_62f34
	ld hl, Data_62f42
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	scf
	ret

Data_62f42:
	dr $62f42, $62f52

Data_62f52:
	dr $62f52, $62f62

Func_62f62:
	ld a, [rLCDC]
	push af
	push de
	rlca
	jr nc, .asm_62f73
.asm_62f69
	ld a, [rLY]
	cp $94
	jr nz, .asm_62f69
	ld a, $41
	ld [rLCDC], a
.asm_62f73
	ld a, $e4
	ld [rBGP], a
	ld de, $8800
.asm_62f7a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_62f7a
	hlbgcoord 0, 0
	ld de, $c
	ld a, $80
	ld c, $d
.asm_62f8c
	ld b, $14
.asm_62f8e
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_62f8e
	add hl, de
	dec c
	jr nz, .asm_62f8c
	ld a, $c1
	ld [rLCDC], a
	pop hl
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld bc, $1
	call Func_62ea0
	pop af
	bit 7, a
	jr nz, .asm_62fb8
	push af
.asm_62fb1
	ld a, [rLY]
	cp $94
	jr nz, .asm_62fb1
	pop af
.asm_62fb8
	ld [rLCDC], a
	ret

Func_62fbb:
	ld hl, Data_630f2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ret

Func_62fc8:
	ld hl, Data_63102
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ret

Func_62fd5:
	ld hl, Data_63072
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_63082
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_63092
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_630a2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_630b2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_630c2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_630d2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_630e2
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ld hl, Data_63042
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ret

Data_63042:
	dr $63042, $63072

Data_63072: ; $63072
	dr $63072, $63082

Data_63082: ; $63082
	dr $63082, $63092

Data_63092: ; $63092
	dr $63092, $630a2

Data_630a2: ; $630a2
	dr $630a2, $630b2

Data_630b2: ; $630b2
	dr $630b2, $630c2

Data_630c2: ; $630c2
	dr $630c2, $630d2

Data_630d2: ; $630d2
	dr $630d2, $630e2

Data_630e2: ; $630e2
	dr $630e2, $630f2

Data_630f2: ; $630f2
	dr $630f2, $63102

Data_63102: ; $63102
	dr $63102, $63112

Func_63112:
	ld a, $80
	ld [rBGPI], a
	ld hl, rBGPD
	call Func_63123
	ld a, $80
	ld [rOBPI], a
	ld hl, rOBPD
Func_63123: ; 63123 (18:7123)
	ld a, $4
.asm_63125
	ld [hl], $ff
	ld [hl], $7f
	ld [hl], c
	ld [hl], b
	ld [hl], e
	ld [hl], d
	ld [hl], $0
	ld [hl], $0
	ld [hl], $ff
	ld [hl], $7f
	ld [hl], e
	ld [hl], d
	ld [hl], c
	ld [hl], b
	ld [hl], $0
	ld [hl], $0
	dec a
	jr nz, .asm_63125
	ret

Func_63141: ; 63141 (18:7141)
	cp $11
	jr z, asm_6316f
	push af
	di
	ld bc, $3c
	call Func_62ea0
	call Func_62ee4
	jr c, asm_63182
	pop af
	ld a, $20
	predef Func_7d753
	call Func_631f7
	ld a, $f0
	ld [hBGP], a
	ld a, $1
	predef Func_7d78e
	call Func_63167
	xor a
	ret

Func_63167: ; 63167 (18:7167)
	ld b, $78
.asm_63169
	predef DelayFrame
	dec b
	jr nz, .asm_63169
	ret

asm_6316f
	ld a, $20
	predef Func_7d753
	call Func_631d0
	call Func_631f7
	ld a, $1
	predef Func_7d78e
	call Func_63167
	xor a
	ret

asm_63182
	pop af
	ld a, $0
	predef Func_7d753
	ld bc, $2
	call Func_62ea0
	ld a, $20
	predef Func_7d753
	di
	call Func_62fd5
	call Func_631f7
	ld a, $1
	predef Func_7d78e
	ld bc, $2
	call Func_62ea0
	call Func_63167
	ld a, $0
	predef Func_7d753
	di
	ld bc, $2
	call Func_62ea0
	ld hl, Data_631c0
	call Func_62eb1
	ld bc, $4
	call Func_62ea0
	ei
	ld a, $1
	ret

Data_631c0:
	dr $631c0, $631d0

Func_631d0: ; 631d0 (18:71d0)
	ld a, $1
	ld [rVBK], a
	hlbgcoord 0, 0
	xor a
	ld bc, $800
.asm_631db
	ld [hli], a
	dec c
	jr nz, .asm_631db
	dec b
	jr nz, .asm_631db
	xor a
	ld [rVBK], a
	bcRGB 31, 27, 03
	deRGB 04, 07, 22
	jp Func_63112

Func_631ee:
	bcRGB 23, 23, 23
	deRGB 15, 15, 15
	jp Func_63112

Func_631f7: ; 631f7 (18:71f7)
	ei
	ld de, Data_6320f
	ld hl, $9000
	ld bc, $800
	predef CopyPredef
	ld de, Data_639af
	hlbgcoord 0, 0
	ld bc, $400
	predef CopyPredef
	ret

Data_6320f:
	dr $6320f, $639af

Data_639af:
	dr $639af, $63bef

GFX_63bef:
	dr $63bef, $63c5f

Func_63c5f: ; 63c5f (18:7c5f)
	call Coord2TileMap
	ld [hl], $96
	inc hl
	ld [hl], $90
	inc hl
	ld a, e
	ld c, $0
.asm_63c6b
	sub $8
	jr c, .asm_63c75
	inc c
	ld [hl], $92
	inc hl
	jr .asm_63c6b

.asm_63c75
	add $8
	jr z, .asm_63ccb
	ld b, a
	ld a, $94
	add d
	ld e, a
	ld a, [$c2cd]
	or a
	jr z, .asm_63c88
	ld a, $69
	add e
	ld e, a
.asm_63c88
	ld [hl], e
	inc hl
	inc c
	push hl
	push bc
	ld a, e
	and $7f
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, $8800
	add hl, de
	push hl
	dec b
	ld l, b
	ld h, $0
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld de, GFX_63bef
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, $10
	call RequestVideoData
	pop bc
	pop hl
.asm_63ccb
	ld a, $7
	sub c
	ld c, a
	ld a, $93
	jr .asm_63cd4

.asm_63cd3
	ld [hli], a
.asm_63cd4
	dec c
	jr nz, .asm_63cd3
	ld [hl], $91
	ret

Func_63cd8:
	call Func_63c5f
	call WaitVideoTransfer
	ret

Func_63ce1: ; 63ce1 (18:7ce1)
	ld c, $4
	scf
	ccf
.asm_63ce5
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_63ce5
	ld a, c
	jr nc, .asm_63cf2
	inc a
.asm_63cf2
	ret

Func_63cf3: ; 63cf3 (18:7cf3)
	ld c, $4
	scf
	ccf
.asm_63cf7
	ld a, [de]
	ld b, a
	ld a, [hl]
	adc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_63cf7
	ld a, c
	jr nc, .asm_63d04
	inc a
.asm_63d04
	ret

Func_63d05: ; 63d05 (18:7d05)
	call Coord2TileMap
	push hl
	ld l, e
	ld h, d
	pop de
	ld a, $0
	ld bc, hBGP
.asm_63d11
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d11
	ld bc, $64
	add hl, bc
	dec a
	jr nz, .asm_63d3a
	ld a, $8f
	ld [de], a
	inc de
	ld a, $0
	ld bc, hPushOAM + 1
.asm_63d27
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d27
	ld bc, $a
	add hl, bc
	dec a
	jr nz, .asm_63d4c
	ld a, $8f
	ld [de], a
	inc de
	jr .asm_63d4e

.asm_63d3a
	ld [de], a
	inc de
	ld a, $0
	ld bc, hPushOAM + 1
.asm_63d41
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d41
	dec a
	ld bc, $a
	add hl, bc
.asm_63d4c
	ld [de], a
	inc de
.asm_63d4e
	ld a, $0
	ld bc, -1
.asm_63d53
	add hl, bc
	inc a
	bit 7, h
	jr z, .asm_63d53
	dec a
	ld [de], a
	ret

Func_63d5c: ; 63d5c (18:7d5c)
	or a
	jr nz, .asm_63d71
	ld a, $98
	ld [wDecompresLiteralCopyOffsetHi + 5], a
	ld a, [wSCX]
	ld [wDecompresLiteralCopyOffsetHi + 6], a
	ld a, [wSCY]
	ld [wDecompresLiteralCopyOffsetHi + 7], a
	ret

.asm_63d71
	ld a, $9c
	ld [wDecompresLiteralCopyOffsetHi + 5], a
	ld a, [wSCX2]
	ld [wDecompresLiteralCopyOffsetHi + 6], a
	ld a, [wSCY2]
	ld [wDecompresLiteralCopyOffsetHi + 7], a
	ret

Func_63d83: ; 63d83 (18:7d83)
	ld a, c
	or a
	jp z, PutOnVideoTransferQueue
	cp $1
	jp z, Func_63e01
	cp $2
	jp z, Func_63d93
	ret

Func_63d93: ; 63d93 (18:7d93)
	ld a, [wDecompresLiteralCopyOffsetHi + 7]
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
	ld [wDecompresLiteralCopyOffsetHi + 2], a
	ld a, [wDecompresLiteralCopyOffsetHi + 5]
	add c
	ld [wDecompresLiteralCopyOffsetHi + 3], a
	ld a, [wDecompresLiteralCopyOffsetHi + 6]
	srl a
	srl a
	srl a
	add d
	and $1f
	ld [wDecompresLiteralCopyOffsetHi + 4], a
	add b
	cp $21
	jr nc, asm_63de5
Func_63dd3: ; 63dd3 (18:7dd3)
	ld a, [wDecompresLiteralCopyOffsetHi + 2]
	ld e, a
	ld a, [wDecompresLiteralCopyOffsetHi + 4]
	add e
	ld e, a
	ld a, [wDecompresLiteralCopyOffsetHi + 3]
	adc $0
	ld d, a
	jp PutOnVideoTransferQueue

asm_63de5
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push hl
	call Func_63dd3
	xor a
	ld [wDecompresLiteralCopyOffsetHi + 4], a
	pop hl
	pop bc
	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld b, c
	jp Func_63dd3

Func_63e01: ; 63e01 (18:7e01)
	ld a, [wDecompresLiteralCopyOffsetHi + 7]
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
	ld [wDecompresLiteralCopyOffsetHi + 2], a
	ld a, [wDecompresLiteralCopyOffsetHi + 5]
	add c
	ld [wDecompresLiteralCopyOffsetHi + 3], a
	ld a, [wDecompresLiteralCopyOffsetHi + 6]
	srl a
	srl a
	srl a
	add h
	and $1f
	ld [wDecompresLiteralCopyOffsetHi + 4], a
	add b
	cp $21
	jr nc, asm_63e53
Func_63e41: ; 63e41 (18:7e41)
	ld a, [wDecompresLiteralCopyOffsetHi + 2]
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi + 4]
	add l
	ld l, a
	ld a, [wDecompresLiteralCopyOffsetHi + 3]
	adc $0
	ld h, a
	jp PutOnVideoTransferQueue

asm_63e53
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push de
	call Func_63e41
	xor a
	ld [wDecompresLiteralCopyOffsetHi + 4], a
	pop de
	pop bc
	ld a, e
	add b
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld b, c
	jp Func_63e41

Func_63e6f: ; 63e6f (18:7e6f)
	push bc
	ld b, $0
	ld a, h
	or a
	jr z, .asm_63e7e
	ld b, $1
	cp $1
	jr z, .asm_63e7e
	ld b, $ff
.asm_63e7e
	ld c, $0
	ld a, l
	or a
	jr z, .asm_63e8c
	ld c, $1
	cp $1
	jr z, .asm_63e8c
	ld c, $ff
.asm_63e8c
	ld a, b
	cp $ff
	jr z, asm_63ec7
	call Func_63d5c
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
	call Coord2TileMap
	pop bc
	ld a, e
	cp $12
	jp c, Func_63eaf
	sub $12
	ld e, a
Func_63eaf: ; 63eaf (18:7eaf)
	push bc
	push hl
	push de
	ld c, $2
	call Func_63d83
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
	jr nz, Func_63eaf
	ret

asm_63ec7
	ld a, c
	call Func_63d5c
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
	call Coord2TileMap
	pop bc
	push de
	push hl
	pop de
	pop hl
	ld a, l
	cp $12
	jp c, Func_63eea
	sub $12
	ld l, a
Func_63eea: ; 63eea (18:7eea)
	push bc
	push de
	push hl
	ld c, $1
	call Func_63d83
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
	jr nz, Func_63eea
	ret

SECTION "Bank 19", ROMX, BANK [$19]
	dr $64000, $64093

Data_64093:
	dr $64093, $64390

Data_64390:
	dr $64390, $64c7d

GFX_64c7d:
	dr $64c7d, $64c90

Data_64c90:
	dr $64c90, $657c5

Data_657c5:
	dr $657c5, $65bc8

INCLUDE "data/base_stats.asm"

Data_66ea7:
	dr $66ea7, $66efb

Data_66efb:
	dr $66efb, $66f73

GFX_66f73:
	dr $66f73, $673ff

Func_673ff: ; $673ff
	dr $673ff, $67a08

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $6810b

Func_6810b: ; $6810b
	dr $6810b, $681a6

Func_681a6: ; $681a6
	dr $681a6, $681bd

Func_681bd: ; $681bd
	dr $681bd, $69436

Func_69436:
	dr $69436, $6adb3

Func_6adb3: ; $6adb3
	dr $6adb3, $6bbf3

Func_6bbf3: ; $6bbf3
	dr $6bbf3, $6c000

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $6c11d

Func_6c11d
	dr $6c11d, $6c5bb

Func_6c5bb:
	dr $6c5bb, $6d395

Func_6d395:
	dr $6d395, $70000

SECTION "Bank 1d", ROMX [$4000], BANK [$1d]
	dr $74000, $76800

SECTION "Bank 1e", ROMX, BANK [$1e]
Data_78000:
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
	predef AnonJumpRelativeTable
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
	hlcoord 16, 4
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
	hlcoord 16, 4
	predef Func_7c8ec
	ret

Func_781a9: ; 781a9 (1e:41a9)
	ld e, $0
Func_781ab: ; 781ab (1e:41ab)
	ld a, e
	cp d
	jp z, Func_7822d
	push de
	hlcoord 16, 4
	predef Func_7ae5e
	pop de
	hlcoord 16, 4
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
	aCoord 6, 5
	Coorda 18, 12, wAttrMap
	hlcoord 8, 12, wAttrMap
	predef Func_7caa0
	jr c, .asm_7822c
	aCoord 5, 5
	bit 0, a
	jr z, .asm_781f1
	call Func_78929
	hlcoord 8, 12, wAttrMap
	call Func_7892c
.asm_781f1
	hlcoord 16, 4
	ld de, $c400
	ld bc, $100
	predef Func_7cc9a
	ld a, b
	or c
	jr z, .asm_7820a
	hlcoord 8, 12, wAttrMap
	ld de, $c400
	predef Func_7cca9
	jr .asm_781f1

.asm_7820a
	decoord 10, 12, wAttrMap
	hlcoord 18, 4
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
	hlcoord 8, 12, wAttrMap
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
	hlcoord 8, 12, wAttrMap
	decoord 8, 5
	aCoord 7, 5
	ld c, a
	ret

Func_78278: ; 78278 (1e:4278)
	hlcoord 16, 4
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
	hlcoord 16, 4
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
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	jr z, .asm_782d7
	ld hl, Data_78f85
	call Func_78bd2
	ld de, $710
	call Func_783e2
	jp nz, Func_783d4
	aCoord 18, 4
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
	predef CopyPredef
	predef Func_7d391
	ld [$ce01], a
	xor a
	Coorda 16, 4
	Coorda 17, 4
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
	hlcoord 16, 4
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
	hlcoord 8, 12, wAttrMap
	predef Func_7ceaf
	predef Func_7ac62
	jr asm_783ac

Func_78393: ; 78393 (1e:4393)
	decoord 12, 17
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
	hlcoord 16, 4
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
	hlcoord 16, 4
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
	lb de, $ff, $46
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
	predef DelayFrame
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
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	ret z
	hlcoord 3, 5
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
	aCoord 18, 4
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
	predef CopyPredef
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
	predef CopyPredef
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
	ld hl, Byte_0014
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
	predef CopyPredef
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
	Coorda 18, 12, wAttrMap
	hlcoord 8, 12, wAttrMap
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
	aCoord 5, 5
	bit 0, a
	jr z, asm_78700
	hlcoord 16, 4
	decoord 12, 17
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
	hlcoord 16, 4
	decoord 12, 17
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
	hlcoord 5, 5
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
	hlcoord 1, 5
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
	hlcoord 16, 4
	ld bc, $100
	predef CopyPredef
	pop de
	ld a, $0
	ld hl, $0
	ld bc, $502
	predef Func_7d6cc
	ret

Func_78929: ; 78929 (1e:4929)
	hlcoord 16, 4
Func_7892c: ; 7892c (1e:492c)
	ld de, $ffd2
	ld b, $0
	predef Func_7cb98
	ret

Func_78934: ; 78934 (1e:4934)
	aCoord 18, 4
	cp $ff
	jr z, .asm_7894a
	call Func_78929
	hlcoord 16, 4
	ld de, $c400
	ld bc, $2e
	predef Func_7cc9a
	ret

.asm_7894a
	hlcoord 16, 4
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
	predef CopyPredef
	ret

Func_78965: ; 78965 (1e:4965)
	push hl
	push de
	push bc
	decoord 12, 17
	predef Func_7addf
	hlcoord 12, 17
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
	predef CopyPredef
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
	predef DelayFrame
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
	predef CopyPredef
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
	hlcoord 5, 7, wAttrMap
	predef Func_7b85e
	ld a, $3
	predef Func_7d78e
asm_79ebb
	predef DelayFrame
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
	predef CopyPredef
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
	predef AnonJumpRelativeTable
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
	predef DelayFrame
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
	decoord 15, 10, wAttrMap
	ld a, $81
	ld [de], a
	hlcoord 16, 4
	ld c, $0
	predef Func_7afe6
	jr c, .asm_7a059
	ld a, $a
	call Func_79f89
	call Func_7a169
	jr c, .asm_7a06b
	hlcoord 16, 4
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
	hlcoord 12, 17
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
	hlcoord 5, 10, wAttrMap
	ld bc, $a
	predef CopyPredef
	ld a, $1
	predef Func_7c19f
	predef Func_7aa8e
	push af
	xor a
	predef Func_7c19f
	pop af
	jr c, .asm_7a10d
	aCoord 5, 10, wAttrMap
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
	hlcoord 5, 10, wAttrMap
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
	decoord 5, 10, wAttrMap
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
	decoord 16, 12, wAttrMap
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
	hlcoord 16, 10, wAttrMap
	predef Func_7be8b
	ret

Func_7a169: ; 7a169 (1e:6169)
	ld a, [$ffc4]
	ld d, a
	ld e, $1
	ld hl, Data_7a4c5
	predef Func_7bd42
Func_7a173: ; 7a173 (1e:6173)
	predef DelayFrame
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
	hlcoord 12, 17
	add hl, de
	add $80
	ld d, a
	ld e, $1
	ld a, b
	predef Func_7be72
	ld c, a
	ret

Pointers_7a1a1:
	dw Data_7a1c9
	dw Data_7a1de
	dw Data_7a1f4
	dw Data_7a216
	dw Data_7a239
	dw Data_7a252
	dw Data_7a26f
	dw Data_7a29c
	dw Data_7a2c9
	dw Data_7a2ef
	dw Data_7a32d
	dw Data_7a35e
	dw Data_7a373
	dw Data_7a399
	dw Data_7a3b5
	dw Data_7a3d1
	dw Data_7a40b
	dw Data_7a43c
	dw Data_7a465
	dw Data_7a490

Data_7a1c9: ; 7a1c9
	dr $7a1c9, $7a1de

Data_7a1de: ; 7a1de
	dr $7a1de, $7a1f4

Data_7a1f4: ; 7a1f4
	dr $7a1f4, $7a216

Data_7a216: ; 7a216
	dr $7a216, $7a239

Data_7a239: ; 7a239
	dr $7a239, $7a252

Data_7a252: ; 7a252
	dr $7a252, $7a26f

Data_7a26f: ; 7a26f
	dr $7a26f, $7a29c

Data_7a29c: ; 7a29c
	dr $7a29c, $7a2c9

Data_7a2c9: ; 7a2c9
	dr $7a2c9, $7a2ef

Data_7a2ef: ; 7a2ef
	dr $7a2ef, $7a32d

Data_7a32d: ; 7a32d
	dr $7a32d, $7a35e

Data_7a35e: ; 7a35e
	dr $7a35e, $7a373

Data_7a373: ; 7a373
	dr $7a373, $7a399

Data_7a399: ; 7a399
	dr $7a399, $7a3b5

Data_7a3b5: ; 7a3b5
	dr $7a3b5, $7a3d1

Data_7a3d1: ; 7a3d1
	dr $7a3d1, $7a40b

Data_7a40b: ; 7a40b
	dr $7a40b, $7a43c

Data_7a43c: ; 7a43c
	dr $7a43c, $7a465

Data_7a465: ; 7a465
	dr $7a465, $7a490

Data_7a490: ; 7a490
	dr $7a490, $7a4c5

Data_7a4c5: ; 7a4c5
	dr $7a4c5, $7a4d3

Func_7a4d3:
	hlcoord 16, 4
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
	predef CopyPredef
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
	decoord 16, 4
	ld hl, $c400
	ld bc, $100
	predef CopyPredef
	decoord 5, 7, wAttrMap
	call Func_7a65c
	call Func_7a651
	ld de, $c400
	hlcoord 16, 4
	ld bc, $100
	predef CopyPredef
	xor a
	ld [$ffc0], a
	ld [$ffc1], a
	ld [$ffc2], a
	ret

Func_7a651: ; 7a651 (1e:6651)
	hlcoord 12, 17
	ld bc, $99
	ld e, $20
	predef Func_7d5e7
	ret

Func_7a65c: ; 7a65c (1e:665c)
	ld l, e
	ld h, d
	push hl
	call Func_7a6e1
	pop hl
	ld de, $39
	add hl, de
	ld e, l
	ld d, h
	inc hl
	inc hl
	ld c, $30
.asm_7a66d
	ld a, [de]
	dec de
	ld [hld], a
	dec c
	jr nz, .asm_7a66d
	ld a, $20
	ld [hld], a
	ld [hl], a
	ret

Func_7a678: ; 7a678 (1e:6678)
	call Func_7a651
	hlcoord 16, 4
	decoord 9, 0, wAttrMap
	ld bc, $88
	predef Func_7cc9a
	hlcoord 5, 5
	ld b, [hl]
	inc hl
	inc hl
	ld a, [hl]
	bit 4, b
	jr z, .asm_7a699
	sub $60
	bit 3, b
	jr z, .asm_7a699
	sub $60
.asm_7a699
	ld c, a
	ld b, $0
	hlcoord 8, 5
	add hl, bc
	ld [hl], $0
	hlcoord 9, 5
	decoord 12, 17
	predef Func_7beff
	ret

Func_7a6ab: ; 7a6ab (1e:66ab)
	xor a
	Coorda 6, 5
	ld bc, $1ff
	ld de, $88
	predef Func_7caa0
	ret c
	decoord 9, 0, wAttrMap
	ld bc, $88
	predef Func_7cca9
	or a
	ret

Func_7a6c2: ; 7a6c2 (1e:66c2)
	push af
	ld a, $30
	ld hl, $102
	ld de, $3
	ld bc, $202
	predef Func_7be3e
	pop af
	ld e, a
	ld d, $30
	ld hl, Data_7bf6b
	ld c, $4
	predef Func_7bf2a
	ret

Func_7a6dc: ; 7a6dc (1e:66dc)
	ld h, $4
	predef Func_7d85d
	ret

Func_7a6e1: ; 7a6e1 (1e:66e1)
	lb de, $ff, $46
	ld bc, $3a
	push hl
	push bc
	predef Func_7c577
	pop bc
	pop hl
	ret

Func_7a6ee: ; 7a6ee (1e:66ee)
	ld a, $20
	predef Func_7d753
	call Func_7a5c6
	call Func_7a627
	call Func_7a6dc
	ld de, $0
	ld bc, $140d
Func_7a6ff: ; 7a6ff (1e:66ff)
	predef Func_7bdfe
	ld hl, Data_7a7c2
	ld de, $8001
	predef Func_7bd42
	ld hl, Data_7a7fe
.asm_7a70e
	call Func_7a7b5
	jr nz, .asm_7a71f
	push hl
	ld a, c
	ld c, $1
	ld hl, $100
	predef Func_7be3e
	pop hl
	jr .asm_7a70e

.asm_7a71f
	xor a
	ld [$ffc3], a
	predef Func_7c456
	jr nc, .asm_7a731
	ld a, $1
	ld [$ffc3], a
	predef Func_7ae29
	decoord 5, 7, wAttrMap
	predef Func_7a65c
.asm_7a731
	hlcoord 12, 17
	call Func_7a6e1
	ld de, $1
	predef Func_7bdaa
	ld a, $3
	predef Func_7d78e
	ld a, [$ffc3]
	or a
	jr nz, .asm_7a757
	call Func_7a52c
	ld hl, Data_7a824
	ld de, $b001
	predef Func_7bd42
	ld a, $10
	call Func_7a85d
	jr c, .asm_7a7b3
.asm_7a757
	ld de, $470d
	hlcoord 5, 7, wAttrMap
	predef Func_7b85e
.asm_7a75f
	ld hl, Data_7a7fe
.asm_7a762
	call Func_7a7b5
	jr nz, .asm_7a77b
	push hl
	hlcoord 12, 17
	ld e, c
	ld d, $0
	add hl, de
	ld d, c
	ld e, $1
	ld a, b
	predef Func_7be72
	ld c, a
	predef Func_7b93a
	pop hl
	jr .asm_7a762

.asm_7a77b
	ld hl, Data_7a80e
	ld de, $b001
	predef Func_7bd42
	ld a, $b
	call Func_7a85d
	jr nc, .asm_7a799
.asm_7a78a
	ld a, $7f
	ld de, Func_030a
	ld bc, $e02
	ld hl, $0
	predef Func_7be3e
	jr .asm_7a75f

.asm_7a799
	hlcoord 12, 17
	ld c, $3b
.asm_7a79e
	dec c
	jr z, .asm_7a78a
	ld a, [hli]
	cp $20
	jr z, .asm_7a79e
	predef Func_7ae29
	hlcoord 12, 17
	lb de, $ff, $46
	ld bc, $3a
	predef Func_7c5ca
.asm_7a7b3
	predef Func_0150
Func_7a7b5: ; 7a7b5 (1e:67b5)
	ld d, $6
	ld e, [hl]
	bit 7, e
	ret nz
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	xor a
	ret

Data_7a7c2:
	dr $7a7c2, $7a7fe

Data_7a7fe:
	dr $7a7fe, $7a80e

Data_7a80e:
	dr $7a80e, $7a824

Data_7a824:
	dr $7a824, $7a855

Data_7a855:
	dr $7a855, $7a85d

Func_7a85d: ; 7a85d (1e:685d)
	ld [$ff91], a
	ld a, $3
.asm_7a861
	ld [$ff90], a
	ld a, $f
	predef Func_7d9f9
	ld a, [$ff91]
	ld e, a
	ld d, $7
	predef Func_7bdec
	ld c, l
	ld b, h
	ld hl, Data_7a855
	ld de, $d301
	ld a, [$ff90]
	ld [hFFB4], a
	predef Func_7bd5b
	inc bc
	inc bc
	inc bc
	ld a, [$ff90]
	swap a
	ld [hFFB4], a
	predef Func_7bd5b
	ld a, $3
	ld [hFFB4], a
.asm_7a88b
	predef DelayFrame
	predef Func_7e17c
	ld b, a
	ld a, $3
	bit 4, b
	jr nz, .asm_7a861
	swap a
	bit 5, b
	jr nz, .asm_7a861
	scf
	bit 1, b
	ret nz
	bit 0, b
	jr z, .asm_7a88b
	ld a, [$ff90]
	cp $30
	ret

Func_7a8a9: ; 7a8a9 (1e:68a9)
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	ret

Func_7a8af: ; 7a8af (1e:68af)
	dec c
	jr z, .asm_7a8b6
	or a
	bit 0, [hl]
	ret

.asm_7a8b6
	scf
	ret

Func_7a8b8: ; 7a8b8 (1e:68b8)
	ld c, $8
.asm_7a8ba
	rla
	jr c, .asm_7a8c1
	ld b, $a
	jr .asm_7a8c4

.asm_7a8c1
	ld b, [hl]
	ld b, $1a
.asm_7a8c4
	call Func_7a98c
	dec c
	jr nz, .asm_7a8ba
	push bc
	pop bc
	ld b, $3c
	call Func_7a98c
	ld b, $a
	call Func_7a98c
	ret

Func_7a8d7: ; 7a8d7 (1e:68d7)
	ld b, $0
.asm_7a8d9
	call Func_7a99b
	jr c, .asm_7a8f5
	cp $1a
	jr nc, .asm_7a8e8
	cp $f
	rl d
	jr .asm_7a8d9

.asm_7a8e8
	ld a, [rJOYP]
	bit 1, a
	jr z, .asm_7a8f5
	bit 0, [hl]
	jr nz, .asm_7a8e8
	ld a, d
	cpl
	ret

.asm_7a8f5
	xor a
	ret

Func_7a8f7: ; 7a8f7 (1e:68f7)
	push hl
	push de
	push bc
	ld hl, $a000
	ld d, a
	ld [hl], $1
	ld c, $0
.asm_7a902
	call Func_7a8af
	jr c, asm_7a982
	jr z, .asm_7a902
	push bc
	pop bc
	push bc
	pop bc
	ld [hl], $0
	ld c, $0
.asm_7a911
	call Func_7a8af
	jr c, asm_7a982
	jr nz, .asm_7a911
	ld a, d
	ld c, $8
.asm_7a91b
	rla
	jr c, .asm_7a922
	ld b, $a
	jr .asm_7a925

.asm_7a922
	ld b, [hl]
	ld b, $1a
.asm_7a925
	call Func_7a98c
	dec c
	jr nz, .asm_7a91b
	push bc
	pop bc
	ld b, $a
	call Func_7a98c
	xor a
	pop bc
	pop de
	pop hl
	ret

Func_7a937: ; 7a937 (1e:6937)
	push hl
	push de
	push bc
	ld hl, $a000
	ld c, $0
	ld [hl], $0
.asm_7a941
	call Func_7a8af
	jr c, asm_7a982
	jr z, .asm_7a941
	ld [hl], $1
	ld c, $0
.asm_7a94c
	call Func_7a8af
	jr c, asm_7a982
	jr nz, .asm_7a94c
	push bc
	pop bc
	push bc
	pop bc
	ld [hl], $0
	ld c, $8
	ld b, $0
.asm_7a95d
	inc b
	jr z, asm_7a982
	bit 0, [hl]
	jr z, .asm_7a95d
	ld c, $8
.asm_7a966
	call Func_7a99b
	jr c, asm_7a982
	cp $f
	rl d
	dec c
	jr nz, .asm_7a966
	ld c, $0
.asm_7a974
	call Func_7a8af
	jr c, asm_7a982
	jr nz, .asm_7a974
	ld a, d
	cpl
	pop bc
	pop de
	pop hl
	or a
	ret

asm_7a982
	ld [hl], $0
	pop bc
	pop de
	pop hl
asm_7a987
	ld a, $ff
	or a
	scf
	ret

Func_7a98c: ; 7a98c (1e:698c)
	push af
	ld a, $a
	ld [hl], $1
.asm_7a991
	dec a
	jr nz, .asm_7a991
	ld [hl], a
	ld a, b
.asm_7a996
	dec a
	jr nz, .asm_7a996
	pop af
	ret

Func_7a99b: ; 7a99b (1e:699b)
	ld b, $0
.asm_7a99d
	inc b
	jr z, asm_7a987
	bit 0, [hl]
	jr z, .asm_7a99d
	ld b, $0
.asm_7a9a6
	inc b
	jr z, asm_7a987
	bit 0, [hl]
	jr nz, .asm_7a9a6
.asm_7a9ad
	inc b
	jr z, asm_7a987
	bit 0, [hl]
	jr z, .asm_7a9ad
	or a
	ld a, b
	ret

Func_7a9b7: ; 7a9b7 (1e:69b7)
	ld hl, $a000
.asm_7a9ba
	ld a, [rJOYP]
	bit 1, a
	jr z, asm_7a987
	ld a, $aa
	call Func_7a8b8
	call Func_7a8d7
	cp $55
	jr nz, .asm_7a9ba
	ld a, [rJOYP]
	bit 1, a
	jr z, asm_7a987
	ld a, $c3
	call Func_7a8b8
	call Func_7a8d7
	cp $3c
	jr nz, .asm_7a9ba
	xor a
	ret

Func_7a9e0: ; 7a9e0 (1e:69e0)
	ld hl, $a000
.asm_7a9e3
	ld a, [rJOYP]
	bit 1, a
	jr z, asm_7a987
	call Func_7a8d7
	cp $aa
	jr nz, .asm_7a9e3
	ld a, $55
	call Func_7a8b8
	ld a, [rJOYP]
	bit 1, a
	jr z, asm_7a987
	call Func_7a8d7
	cp $c3
	jr nz, .asm_7a9e3
	ld a, $3c
	call Func_7a8b8
	xor a
	ret

asm_7aa09
	jp asm_7a987

Func_7aa0c: ; 7aa0c (1e:6a0c)
	call Func_7a9b7
	jr c, asm_7aa09
	ld a, $48
	call Func_7a8f7
	ld a, $75
	call Func_7a8f7
	ld hl, $c0f8
	ld c, $8
	jp Func_7aa3e

asm_7aa23
	call Func_7a9e0
	jr c, asm_7aa09
	call Func_7a937
	cp $48
	jr nz, asm_7aa23
	call Func_7a937
	cp $75
	jr nz, asm_7aa23
	ld hl, $c0f8
	ld c, $8
	jp Func_7aa53

Func_7aa3e: ; 7aa3e (1e:6a3e)
	ld b, $0
.asm_7aa40
	ld a, b
	add [hl]
	ld b, a
	ld a, [hli]
	call Func_7a8f7
	jr c, .asm_7aa52
	dec c
	jr nz, .asm_7aa40
	ld a, b
	cpl
	inc a
	call Func_7a8f7
.asm_7aa52
	ret

Func_7aa53: ; 7aa53 (1e:6a53)
	ld b, $0
.asm_7aa55
	call Func_7a937
	jr c, asm_7aa09
	ld [hli], a
	add b
	ld b, a
	dec c
	jr nz, .asm_7aa55
	call Func_7a937
	add b
	or a
	jr nz, asm_7aa09
	ret

Func_7aa68: ; 7aa68 (1e:6a68)
	di
	ld a, $10
	ld [rJOYP], a
	call Func_7aa82
	xor a
	ld [HuC3RTC], a
	ret

Func_7aa75: ; 7aa75 (1e:6a75)
	xor a
	ld [HuC3RTC], a
	call Func_7aa87
	ld a, $30
	ld [rJOYP], a
	ei
	ret

Func_7aa82: ; 7aa82 (1e:6a82)
	push af
	ld a, $e
	jr asm_7aa89

Func_7aa87: ; 7aa87 (1e:6a87)
	push af
	xor a
asm_7aa89
	ld [HuC3SRamMode], a
	pop af
	ret

Func_7aa8e: ; 7aa8e (1e:6a8e)
	call Func_7aa68
.asm_7aa91
	call asm_7aa23
	jr c, .asm_7aaa8
	jr nz, .asm_7aa91
	ld hl, $c0f9
	ld a, [hl]
	ld hl, Pointers_7aab9
	cp $d
	jr nc, .asm_7aa91
	call Func_7aaae
	jr .asm_7aa91

.asm_7aaa8
	call Func_7aa75
	xor a
	scf
	ret

Func_7aaae: ; 7aaae (1e:6aae)
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

Pointers_7aab9:
	dw Func_7aae2
	dw Func_7aae8
	dw Func_7aaf3
	dw Func_7ab1a
	dw Func_7ab2a
	dw Func_7ab22
	dw Func_7ab77
	dw Func_7ab3b
	dw Func_7ab97
	dw Func_7aba1
	dw Func_7ab62
	dw Func_7abc8
	dw Func_7abd7

Func_7aad3: ; 7aad3 (1e:6ad3)
	call Func_7acfa
	call Func_7a9b7
	ret c
	ld hl, $c0f8
	ld c, $8
	jp Func_7aa3e

Func_7aae2: ; 7aae2 (1e:6ae2)
	call Func_7aa75
	pop hl
	or a
	ret

Func_7aae8: ; 7aae8 (1e:6ae8)
	ld hl, $0
	predef Func_7c5da
	ld a, [Byte_0014]
	jp Func_7aad3

Func_7aaf3: ; 7aaf3 (1e:6af3)
	call Func_7ad13
	ld hl, wOAMBuffer2
	call Func_7aa53
	ret c
	call Func_7aa87
	call Func_7ad13
	hlcoord 16, 4
	ld de, wOAM2_00YCoord
	predef Func_7afe6
asm_7ab0b
	call Func_7aa82
	call Func_7aad3
	ret c
	hlcoord 16, 4
	ld c, $0
	jp Func_7aa3e

Func_7ab1a: ; 7ab1a (1e:6b1a)
	call Func_7ab83
	ret c
	predef Func_7caa0
	jr asm_7ab0b

Func_7ab22: ; 7ab22 (1e:6b22)
	call Func_7ab83
	ret c
	predef Func_7c9de
	jr asm_7ab0b

Func_7ab2a: ; 7ab2a (1e:6b2a)
	call Func_7aa87
	call Func_7ad13
	hlcoord 16, 4
	predef Func_7cb98
	call Func_7aa82
	jp Func_7aad3

Func_7ab3b: ; 7ab3b (1e:6b3b)
	call Func_7ab4f
	push bc
	predef Func_7cc9a
	call Func_7aa82
	call Func_7aad3
	pop bc
	ret c
	ld hl, wOAM2_00YCoord
	jp Func_7aa3e

Func_7ab4f: ; 7ab4f (1e:6b4f)
	call Func_7ad13
	ld b, $0
	inc c
	dec c
	jr nz, .asm_7ab59
	inc b
.asm_7ab59
	hlcoord 16, 4
	ld de, wOAM2_00YCoord
	jp Func_7aa87

Func_7ab62: ; 7ab62 (1e:6b62)
	call Func_7ad13
	ld hl, wOAMBuffer2
	call Func_7aa53
	ret c
	call Func_7ab4f
	predef Func_7cca9
	call Func_7aa82
	jp Func_7aad3

Func_7ab77: ; 7ab77 (1e:6b77)
	call Func_7ab83
	ret c
	predef Func_7c8ec
	call Func_7aa82
	jp Func_7aad3

Func_7ab83: ; 7ab83 (1e:6b83)
	hlcoord 16, 4
	ld c, $0
	call Func_7aa53
	ret c
	call Func_7aa87
	call Func_7ad13
	hlcoord 16, 4
	or a
	ret

Func_7ab97: ; 7ab97 (1e:6b97)
	call Func_7a9b7
	ret c
	call Func_7ad13
	jp Func_7aa3e

Func_7aba1: ; 7aba1 (1e:6ba1)
	ld a, [hSRAMBank]
	push af
	call Func_7ad13
	call Func_7ac00
	ld de, wOAM2_00YCoord
	call Func_7aa87
	push de
	push bc
.asm_7abb2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7abb2
	call Func_7aa82
	call Func_7a9b7
	ret c
	pop bc
	pop hl
	call Func_7aa3e
	pop af
	jp Func_7a8a9

Func_7abc8: ; 7abc8 (1e:6bc8)
	call Func_7ad13
	ld l, e
	ld h, d
Func_7abcd: ; 7abcd (1e:6bcd)
	call Func_7aa53
	jr c, .asm_7abd6
	sub b
	call Func_7a8f7
.asm_7abd6
	ret

Func_7abd7: ; 7abd7 (1e:6bd7)
	ld a, [hSRAMBank]
	push af
	call Func_7ad13
	ld hl, wOAM2_00YCoord
	push hl
	push de
	push bc
	call Func_7abcd
	pop bc
	pop hl
	pop de
	jr c, .asm_7abfc
	call Func_7ac00
	ld a, $a
	ld [HuC3SRamMode], a
.asm_7abf3
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7abf3
	call Func_7aa82
.asm_7abfc
	pop af
	jp Func_7a8a9

Func_7ac00: ; 7ac00 (1e:6c00)
	push hl
	ld a, b
	rl h
	rla
	rl h
	rla
	rl h
	rla
	call Func_7a8a9
	pop hl
	ld a, h
	and $1f
	or $a0
	ld h, a
	ret

Func_7ac16: ; 7ac16 (1e:6c16)
	call Func_7aa68
	ld a, $0
	ld [$c0f9], a
	call Func_7aa0c
	jr asm_7ac76

Func_7ac23: ; 7ac23 (1e:6c23)
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac2a: ; 7ac2a (1e:6c2a)
	ld a, $2
	call Func_7ace6
	ld l, e
	ld h, d
	jr asm_7ac3e

Func_7ac33: ; 7ac33 (1e:6c33)
	ld a, $5
	jr asm_7ac39

Func_7ac37: ; 7ac37 (1e:6c37)
	ld a, $3
asm_7ac39
	call Func_7ace6
	ld c, $0
asm_7ac3e
	call Func_7aa3e
	jr c, asm_7ac76
	call Func_7ad13
	push hl
	call Func_7ac7c
	pop hl
	jr c, asm_7ac76
	ld c, $0
	call Func_7aa53
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac56: ; 7ac56 (1e:6c56)
	ld a, $4
	call Func_7ace6
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac62: ; 7ac62 (1e:6c62)
	ld a, $6
	call Func_7ace6
	ld c, $0
	call Func_7aa3e
	jr c, asm_7ac76
	call Func_7ac7c
	jr c, asm_7ac76
asm_7ac73
	call Func_7ad13
asm_7ac76
	push af
	call Func_7aa75
	pop af
	ret

Func_7ac7c: ; 7ac7c (1e:6c7c)
	call Func_7a9e0
	jr c, asm_7ac76
	ld hl, $c0f8
	ld c, $8
	jp Func_7aa53

Func_7ac89: ; 7ac89 (1e:6c89)
	ld a, $9
	jr asm_7ac8f

Func_7ac8d: ; 7ac8d (1e:6c8d)
	ld a, $8
asm_7ac8f
	call Func_7ace6
	push de
	push bc
	call Func_7a9e0
	pop bc
	pop hl
	jr c, asm_7ac76
	call Func_7aa53
	jr asm_7ac76

Func_7aca0: ; 7aca0 (1e:6ca0)
	ld a, $c
	jr asm_7aca6

Func_7aca4: ; 7aca4 (1e:6ca4)
	ld a, $b
asm_7aca6
	call Func_7ace6
	call Func_7aa3e
	jr c, asm_7ac76
	call Func_7a937
	jr c, asm_7ac76
	add b
	jr nz, .asm_7acb9
	xor a
	jr asm_7ac76

.asm_7acb9
	call asm_7a987
asm_7acbc
	jr asm_7ac76

Func_7acbe: ; 7acbe (1e:6cbe)
	ld a, $7
	call Func_7ace6
	push de
	push bc
	call Func_7ac7c
	pop bc
	pop hl
	jr c, asm_7ac76
	call Func_7aa53
	jr c, asm_7ac76
	jr asm_7ac73

Func_7acd3: ; 7acd3 (1e:6cd3)
	ld a, $a
	call Func_7ace6
	ld l, e
	ld h, d
	call Func_7aa3e
	jr c, asm_7ac76
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ace6: ; 7ace6 (1e:6ce6)
	push hl
	push de
	push bc
	call Func_7acfa
	call Func_7aa68
	call Func_7aa0c
	pop bc
	pop de
	pop hl
	ret nc
	inc sp
	inc sp
	jr asm_7acbc

Func_7acfa: ; 7acfa (1e:6cfa)
	push de
	push hl
	push af
	ld hl, $c0f8
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_7ad13: ; 7ad13 (1e:6d13)
	ld hl, $c0f8
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	pop af
	ret

Func_7ad2a: ; 7ad2a (1e:6d2a)
	ld b, [hl]
	inc hl
	push hl
	predef Func_7d738
	jp c, Func_7ad4a
	ld [$ffa1], a
	ld a, b
	pop bc
.asm_7ad36
	push af
	ld a, [bc]
	inc bc
	add e
	ld [hli], a
	ld a, [bc]
	inc bc
	add d
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	pop af
	dec a
	jr nz, .asm_7ad36
	push hl
Func_7ad4a: ; 7ad4a (1e:6d4a)
	pop hl
	ld a, [$ffa1]
	ret

Func_7ad4e: ; 7ad4e (1e:6d4e)
	ld hl, $c3ca
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c3cc
	ld [hl], $1
	inc hl
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hli], a
	ld [hl], $ef
	ld h, b
	ld l, $0
	xor a
.asm_7ad68
	ld [hl], a
	inc l
	jr nz, .asm_7ad68
	ret

Func_7ad6d: ; 7ad6d (1e:6d6d)
	push hl
	push de
.asm_7ad6f
	push bc
	call Func_7ad7e
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, .asm_7ad6f
	pop de
	pop hl
	ret

Func_7ad7e: ; 7ad7e (1e:6d7e)
	ld hl, $c3d0
	ld a, [hl]
	or a
	jr z, .asm_7ad91
	dec [hl]
	inc hl
.asm_7ad87
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc [hl]
	inc hl
	ld a, [bc]
	ld c, [hl]
	inc [hl]
	ld [bc], a
	ret

.asm_7ad91
	ld hl, $c3ca
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	dec [hl]
	inc hl
	jr nz, .asm_7ada3
	dec hl
	ld [hl], $8
	inc hl
	ld a, [bc]
	inc bc
	ld [hl], a
.asm_7ada3
	rl [hl]
	ld a, [bc]
	inc bc
	jr nc, .asm_7adb9
	ld hl, $c3ca
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $c3d1
	ld b, [hl]
	inc hl
	inc hl
	ld c, [hl]
	inc [hl]
	ld [bc], a
	ret

.asm_7adb9
	ld [$c3d2], a
	ld hl, $c3ce
	bit 0, [hl]
	jr nz, .asm_7add9
	set 0, [hl]
	inc hl
	ld a, [bc]
	inc bc
	ld [hli], a
	swap a
.asm_7adcb
	and $f
	inc a
	ld [hli], a
	push hl
	ld hl, $c3ca
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	jr .asm_7ad87

.asm_7add9
	res 0, [hl]
	inc hl
	ld a, [hli]
	jr .asm_7adcb

Func_7addf: ; 7addf (1e:6ddf)
	predef Func_7ccf1
	ret nc
	push hl
	push de
	ld bc, $c
	add hl, bc
	ld c, [hl]
	ld hl, wOAMBuffer2
	xor a
	ld [hli], a
	ld [hld], a
.asm_7adef
	push bc
	call Func_7b148
	pop bc
	jr c, .asm_7ae26
	ld a, [wOAM2_02XCoord]
	ld b, a
	bit 4, b
	jr z, .asm_7adef
	ld a, [wOAM2_03YCoord]
	cp c
	jr nz, .asm_7adef
	ld de, $d
	add hl, de
	ld a, [wOAM2_02Attrs]
	sub $61
	bit 3, b
	jr z, .asm_7ae13
	sub $60
.asm_7ae13
	ld e, a
	add hl, de
	pop de
	push de
	ld c, $60
.asm_7ae19
	ld a, [hli]
	ld [de], a
	inc de
	bit 3, b
	jr z, .asm_7ae21
	ld a, [hli]
.asm_7ae21
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7ae19
.asm_7ae26
	pop de
	pop hl
	ret

Func_7ae29: ; 7ae29 (1e:6e29)
	predef Func_7c437
	ld hl, Data_78000
	ld de, $fe00
.asm_7ae31
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	inc hl
	inc hl
	inc hl
	push bc
	push de
	ld b, a
	ld c, $ff
	push bc
	push hl
	ld hl, sp+$0
	ld bc, $4
	predef Func_7c5ca
	pop hl
	pop bc
	pop de
	pop hl
	inc e
	ld a, l
	or h
	jr nz, .asm_7ae31
	predef Func_02fd
	ret

Func_7ae5e: ; 7ae5e (1e:6e5e)
	add sp, -$4
	push hl
	ld hl, sp+$2
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop bc
	pop hl
	pop de
	ld a, l
	or h
	jr z, .asm_7ae7a
	ld a, e
	cp $ff
	jp z, Func_7b19c
	predef Func_7ca3c
	ret

.asm_7ae7a
	ld l, c
	ld h, b
	xor a
	ld [hli], a
	ld [hld], a
	scf
	ret

asm_7ae81
	cp c
	ld c, a
	ld b, a
	jr nz, asm_7ae89
Func_7ae86: ; 7ae86 (1e:6e86)
	ld c, $0
	ld b, c
asm_7ae89
	ld a, [hli]
	or a
	ret z
	cp $22
	jr z, asm_7ae81
	cp $27
	jr z, asm_7ae81
	inc b
	dec b
	jr nz, .asm_7ae9c
	predef Func_7c1b0
	jr asm_7ae89

.asm_7ae9c
	cp $40
	jr z, .asm_7aec0
	cp $25
	jr z, .asm_7aecd
	cp $3b
	jr z, .asm_7aed5
	cp $2b
	jr z, .asm_7aedf
	cp $5b
	jr z, .asm_7aee5
	cp $5d
	jr z, .asm_7aeeb
	inc c
	dec c
	jr z, .asm_7aebc
	predef Func_7c259
	jr asm_7ae89

.asm_7aebc
	predef Func_7c1b0
	jr asm_7ae89

.asm_7aec0
	ld a, $30
	call Func_7aef7
	ld a, $35
	predef Func_7c1b0
	ld c, $0
	jr asm_7ae89

.asm_7aecd
	ld a, $32
	call Func_7aef2
	ld c, b
	jr asm_7ae89

.asm_7aed5
	ld a, $23
	predef Func_7c1b0
	ld a, $23
	predef Func_7c1b0
	jr asm_7ae89

.asm_7aedf
	ld c, $0
	ld a, $38
	jr .asm_7aeed

.asm_7aee5
	ld c, $0
	ld a, $34
	jr .asm_7aeed

.asm_7aeeb
	ld a, $36
.asm_7aeed
	call Func_7aef7
	jr asm_7ae89

Func_7aef2: ; 7aef2 (1e:6ef2)
	push af
	call Func_7aef7
	pop af
Func_7aef7: ; 7aef7 (1e:6ef7)
	push af
	ld a, $2a
	predef Func_7c1b0
	pop af
	predef Func_7c1b0
	ret

Func_7af00: ; 7af00 (1e:6f00)
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	push af
	push de
	push bc
	and $7f
	ld c, a
	ld b, $0
	add a
	add e
	ld e, a
	ld a, b
	adc d
	ld d, a
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	dec hl
	ld a, l
	sub c
	ld a, h
	sbc b
	pop de
	pop bc
	ret nc
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	add hl, de
	bit 7, b
	jr nz, .asm_7af2f
	pop af
.asm_7af2f
	jp [hl]

Func_7af30: ; 7af30 (1e:6f30)
	push bc
	push de
	push hl
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_7af39: ; 7af39 (1e:6f39)
	ld hl, sp+$7
	ld b, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	dec hl
	ld a, [hl]
	dec hl
	ld l, [hl]
	ld h, a
	ld a, [hli]
	sub e
	ld a, [hl]
	sbc d
	dec hl
	jr z, .asm_7af5d
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$8
	add sp, $2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.asm_7af5d
	pop hl
	add sp, $8
	jp [hl]

Func_7af61: ; 7af61 (1e:6f61)
	push bc
.asm_7af62
	dec bc
	ld a, [hli]
	cp e
	jr z, .asm_7af6d
	ld a, b
	or c
	jr nz, .asm_7af62
	pop bc
	push bc
.asm_7af6d
	pop hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ret

Func_7af75: ; 7af75 (1e:6f75)
	ld a, [de]
	cp [hl]
	jr nz, .asm_7af84
	inc de
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, Func_7af75
	ld hl, $0
	ret

.asm_7af84
	sbc a
	ld h, a
	add a
	inc a
	ld l, a
	ret

Func_7af8a: ; 7af8a (1e:6f8a)
	ld d, h
	ld e, l
	ld hl, $0
.asm_7af8f
	ld a, [de]
	or a
	ret z
	inc de
	inc hl
	jr .asm_7af8f

Func_7af96: ; 7af96 (1e:6f96)
	ld a, [$ff92]
	ld e, a
	ld a, [hli]
	or a
	ret z
	bit 6, e
	jr nz, .asm_7afae
	cp " "
	jr c, .asm_7afd1
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .asm_7afae
	inc hl
	or a
	jr z, .asm_7afb5
.asm_7afae
	predef Func_7d93e
	jr Func_7af96

.asm_7afb2
	xor a
	jr .asm_7afae

.asm_7afb5
	ld a, [$ff92]
	bit 3, a
	jr z, .asm_7afb2
	push bc
	push hl
	ld c, a
	ld a, d
	ld d, e
	ld e, a
	ld b, $1
	ld hl, $c3e0
	predef Func_026c
	ld hl, $c3e0
	predef Func_7d98c
	pop hl
	pop bc
	ld a, $1
.asm_7afd1
	predef Func_7d9f9
	jr Func_7af96

Func_7afd5: ; 7afd5 (1e:6fd5)
	ld a, [hl]
	or a
	ret z
	push hl
	ld l, e
	ld h, d
	predef Func_7d905
	pop hl
	push de
	call Func_7af96
	pop de
	inc e
	jr Func_7afd5

Func_7afe6: ; 7afe6 (1e:6fe6)
	xor a
	ld b, a
	ld [hli], a
	ld [hld], a
	ld a, c
	or a
	jr nz, .asm_7aff7
	inc b
	push de
.asm_7aff0
	inc de
	inc c
	ld a, [de]
	or a
	jr nz, .asm_7aff0
	pop de
.asm_7aff7
	push de
	push bc
	call Func_7b148
	pop bc
	pop de
	jr c, .asm_7b007
	call Func_7b024
	jr nz, .asm_7aff7
	xor a
	ret

.asm_7b007
	push hl
	xor a
	ld [hli], a
	ld [hli], a
	ld b, $0
	ld a, $8
	add l
	ld l, a
	ld a, b
	adc h
	ld h, a
	ld a, [Byte_0014]
	ld [hli], a
	ld [hl], c
	inc hl
.asm_7b01a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7b01a
	pop hl
	xor a
	scf
	ret

Func_7b024: ; 7b024 (1e:7024)
	push hl
	push de
	push bc
	ld a, $9
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	or a
	jr z, .asm_7b045
	ld b, [hl]
	bit 4, b
	jr z, .asm_7b045
	inc hl
	inc hl
	ld a, [hli]
	sub $60
	bit 3, b
	jr z, .asm_7b048
	sub $60
	jr .asm_7b048

.asm_7b045
	inc hl
	inc hl
	ld a, [hli]
.asm_7b048
	cp c
	jr nz, .asm_7b052
	ld b, $0
	call Func_7af75
	ld a, h
	or l
.asm_7b052
	pop bc
	pop de
	pop hl
	ret

Func_7b056: ; 7b056 (1e:7056)
	pop de
	push de
	hlcoord 16, 4
	ld bc, $ff
	predef CopyPredef
	ld hl, wOAM2_00YCoord
	xor a
	ld [hli], a
	ld [hld], a
.asm_7b066
	call Func_7b148
	jr c, .asm_7b0aa
	ld a, [wOAM2_02XCoord]
	and $4
	jr z, .asm_7b066
	ld a, [wOAM2_03YCoord]
	and $7f
	ld b, a
	aCoord 8, 5
	and $7f
	cp b
	jr nz, .asm_7b066
	ld a, [wOAM2_02VTile]
	or a
	jr z, .asm_7b08d
	ld b, a
	ld a, [Byte_0014]
	cp b
	jr nz, .asm_7b066
.asm_7b08d
	ld a, [wOAM2_00VTile]
	cp $ff
	jr z, .asm_7b0a5
	ld hl, wOAM2_00YCoord
	call Func_7b113
	predef Func_7c586
	ld d, h
	ld e, l
.asm_7b09e
	pop bc
	ld sp, $e000
	push de
	jr asm_7b0f7

.asm_7b0a5
	call Func_7b124
	jr .asm_7b09e

.asm_7b0aa
	pop hl
	decoord 16, 4
	ld bc, $ff
	predef CopyPredef
	scf
	ret

Func_7b0b5: ; 7b0b5 (1e:70b5)
	ld a, [hli]
	or [hl]
	dec hl
	ret z
	xor a
	ld [$ffb7], a
	push hl
	inc hl
	inc hl
	ld a, [hl]
	dec hl
	dec hl
	cp $ff
	jr z, .asm_7b0e6
	call Func_7b113
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jr z, .asm_7b0d9
	ld a, [Byte_0014]
	cp [hl]
	jr z, .asm_7b0d9
	pop hl
	scf
	ret

.asm_7b0d9
	dec hl
	ld a, [hl]
	and $4
	jp z, Func_7b056
	predef Func_7c586
	ld d, h
	ld e, l
	jr .asm_7b0e9

.asm_7b0e6
	call Func_7b124
.asm_7b0e9
	pop bc
	ld sp, wStackTop
	push de
	call Func_7b108
	hlcoord 16, 4
	xor a
	ld [hli], a
	ld [hl], a
asm_7b0f7
	hlcoord 12, 17
	ld e, $0
	ld bc, $df00
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	predef Func_7d5e7
	ret

Func_7b108: ; 7b108 (1e:7108)
	ld hl, wOAM2_00YCoord
	ld d, b
	ld e, c
	ld bc, $ff
	predef CopyPredef
	ret

Func_7b113: ; 7b113 (1e:7113)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	ld [$ff97], a
	inc hl
	inc hl
	ld a, [hli]
	add e
	ld e, a
	ld a, [hli]
	adc d
	ld d, a
	ret

Func_7b124: ; 7b124 (1e:7124)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	add e
	ld e, a
	ld a, [hli]
	adc d
	ld d, a
	ret

Func_7b133: ; 7b133 (1e:7133)
	ld a, [hROMBank]
	ld e, a
	ld a, [hSRAMBank]
	ld d, a
	push de
	push hl
	ld hl, sp+$0
	ld de, rWave_c
	ld bc, $4
	predef Func_7c5ca
	pop hl
	pop de
	ret

Func_7b148: ; 7b148 (1e:7148)
	ld a, [hli]
	or [hl]
	jr z, .asm_7b153
	inc hl
	ld a, [hl]
	dec hl
	cp $ff
	jr z, .asm_7b15a
.asm_7b153
	dec hl
	predef Func_7c9de
	ret nc
	xor a
	ld [hli], a
	ld [hl], a
.asm_7b15a
	dec hl
	ld c, l
	ld b, h
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	or l
	jr z, .asm_7b195
	ld de, hPushOAM + 5
	add hl, de
	jr nc, .asm_7b16e
	ld a, h
	rlca
	jr nc, .asm_7b172
.asm_7b16e
	ld l, c
	ld h, b
	scf
	ret

.asm_7b172
	ld e, l
	ld d, h
	ld a, [hli]
	cpl
	cp [hl]
	jr nz, .asm_7b16e
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_7b16e
	ld a, h
	cp d
	jr c, .asm_7b18a
	jr nz, .asm_7b16e
	ld a, l
	cp e
	jr nc, .asm_7b16e
.asm_7b18a
	ld a, [hl]
	cp $52
	jr z, .asm_7b198
	cp $5a
	jr nz, .asm_7b172
	jr .asm_7b198

.asm_7b195
	ld hl, Data_78000
.asm_7b198
	ld de, $6
	add hl, de
Func_7b19c: ; 7b19c (1e:719c)
	ld e, l
	ld d, h
	push bc
	ld l, c
	ld h, b
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $ff
	ld [hli], a
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
	push bc
.asm_7b1bf
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7b1bf
	pop bc
	pop hl
	ld de, $2e
	bit 0, b
	jr nz, .asm_7b1cf
	ld e, d
.asm_7b1cf
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
	pop hl
	xor a
	ret

Func_7b1e1: ; 7b1e1 (1e:71e1)
	predef Func_7c456
	ret c
	push hl
	ld de, rLYC
	ld bc, $1
	ld hl, sp+$0
	predef Func_7c577
	pop hl
	bit 0, l
	ret z
	call Func_7b222
	bit 0, a
	ret nz
	bit 1, a
	jr nz, asm_7b220
	add sp, -$4
	ld hl, sp+$0
	ld de, rWave_c
	ld bc, $4
	predef Func_7c577
	pop de
	pop bc
	ld a, d
	or e
	jr z, asm_7b220
	ld a, c
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, b
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	push de
	ret

Func_7b21d: ; 7b21d (1e:721d)
	call Func_7b222
asm_7b220
	predef Func_0150
Func_7b222: ; 7b222 (1e:7222)
	predef Func_022c
	predef Func_7b848
	ld a, $a4
	ld bc, $102
	ld de, $f10
	ld h, $0
	predef Func_7d753
	ld de, Data_7b2e2
	ld bc, wOAM2_00YCoord
	predef Func_7ad4e
	decoord 12, 17
	ld bc, $8f0
	predef Func_7ad6d
	ld de, $20c
	hlcoord 12, 17
	ld bc, $b68
	predef Func_7dde6
	ld a, $1
	predef Func_7d78e
	ld a, $f0
	predef Func_7e0c2
	bit 2, a
	jp nz, Func_7a6ee
	ret

Func_7b25b: ; 7b25b (1e:725b)
	ld d, a
	push hl
	ld hl, Data_7b2cd
.asm_7b260
	ld a, [hl]
	cp $ff
	jr z, .asm_7b270
	ld a, d
	or a
	jr z, .asm_7b273
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jr .asm_7b260

.asm_7b270
	pop hl
	scf
	ret

.asm_7b273
	ld d, [hl]
	inc hl
	ld a, [hli]
	dec a
	cp e
	jr c, .asm_7b270
	sub e
	dec b
	cp b
	jr nc, .asm_7b280
	ld b, a
.asm_7b280
	inc b
	ld c, b
	ld b, $0
	jr nz, .asm_7b287
	inc b
.asm_7b287
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, d
	ld d, $0
	or a
	jr z, .asm_7b2aa
	ld a, $4
.asm_7b292
	sla e
	rl d
	sla c
	rl b
	dec a
	jr nz, .asm_7b292
	add hl, de
	ld e, l
	ld d, h
	pop hl
	push bc
	push hl
	predef CopyPredef
	pop hl
	pop bc
	add hl, bc
	or a
	ret

.asm_7b2aa
	ld b, e
	push bc
	ld e, l
	ld d, h
	ld bc, wOAM2_00YCoord
	predef Func_7ad4e
	pop bc
	pop hl
.asm_7b2b5
	push hl
	push bc
	ld d, h
	ld e, l
	ld bc, $10
	push bc
	predef Func_7ad6d
	pop de
	pop bc
	pop hl
	ld a, b
	dec b
	or a
	jr nz, .asm_7b2b5
	inc b
	add hl, de
	dec c
	jr nz, .asm_7b2b5
	ret

Data_7b2cd:
	dr $7b2cd, $7b2e2

Data_7b2e2:
	dr $7b2e2, $7b6d3

AnonJumpRelativeTable: ; 7b6d3 (1e:76d3)
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

AnonJumpRelativeTableLookup: ; 7b6ec (1e:76ec)
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

AnonJumpRelativeTableLookup2: ; 7b70d (1e:770d)
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
	predef DelayFrame
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
	predef CopyPredef
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
	predef DelayFrame
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	dw DelayFrame
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
	predef CopyPredef
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
	call DelayFrame
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
	call DelayFrame
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
	ld [HuC3SRamMode], a
	ret

Func_7c447: ; 7c447 (1f:4447)
	pop af
	call Bank1F_GetSRAMBank
	call Bank1F_SetSRAMReadOnly
	scf
	ret

Bank1F_SetSRAMReadWrite: ; 7c450 (1f:4450)
	ld a, SRAM_READWRITE
	ld [HuC3SRamMode], a
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
	predef CopyPredef
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
	predef CopyPredef
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
	lb de, $ff, $46
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
	lb de, $ff, $46
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	call DelayFrame
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
	predef CopyPredef
	ld a, [Bank_000f]
	ld [$c00b], a
	ld de, Func_7e05a
	ld hl, hPushOAM
	ld bc, $a
	predef CopyPredef
	xor a
	ld [hVBlankOccurred], a
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
	; no clue why bank 3 is here
	; the load in WRAM is overwritten before the interrupt is enabled
	ld a, $3
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

VBlank2: ; 7e070 (1f:6070)
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
	ld [hVBlankOccurred], a
	pop hl
	pop de
	pop bc
	ret

DelayFrame: ; 7e0b5 (1f:60b5)
	xor a
	ld [hVBlankOccurred], a
	ei
.asm_7e0b9
	halt
	ld a, [hVBlankOccurred]
	dec a
	jr nz, .asm_7e0b9
	ld [hVBlankOccurred], a
	ret

Func_7e0c2: ; 7e0c2 (1f:60c2)
	push bc
	ld b, a
.asm_7e0c4
	call DelayFrame
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
	ld hl, HuC3SRamMode
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
	ld hl, HuC3SRamMode
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
	ld hl, HuC3SRamMode
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
	ld [HuC3SRamMode], a
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
	ld [HuC3SRamMode], a
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
	ld [HuC3SRamMode], a
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
	ld [HuC3SRamMode], a
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
	predef CopyPredef
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
	predef CopyPredef
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
	predef CopyPredef
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
	dr $90000, $93370

Func_93370: ; $93370
	dr $93370, $93941

Func_93941:
	dr $93941, $93b87

Func_93b87:
	dr $93b87, $93c0c

Func_93c0c:
	dr $93c0c, $94000

SECTION "Bank 25", ROMX, BANK [$25]
	dr $94000, $98000

SECTION "Bank 26", ROMX, BANK [$26]
	dr $98000, $9a41d

Func_9a41d: ; $9a41d
	dr $9a41d, $9a8c3

Func_9a8c3: ; $9a8c3
	dr $9a8c3, $9b251

Func_9b251: ; $9b251
	dr $9b251, $9b326

Func_9b326: ; $9b326
	dr $9b326, $9c000

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
	dr $bc000, $bd6fa

Func_bd6fa: ; $bd6fa
	dr $bd6fa, $bf214

Func_bf214: ; $bf214
	dr $bf214, $bf431

Func_bf431:
	dr $bf431, $c0000

SECTION "Bank 30", ROMX, BANK [$30]
	dr $c0000, $c4000

SECTION "Bank 31", ROMX, BANK [$31]
	dr $c4000, $c7109

Func_c7109:
	dr $c7109, $c7551

Func_c7551:
	dr $c7551, $c7759

Func_c7759: ; $c7759
	dr $c7759, $c7ae6

Func_c7ae6: ; $c7ae6
	dr $c7ae6, $c7bd0

Func_c7bd0: ; $c7bd0
	dr $c7bd0, $c8000

SECTION "Bank 32", ROMX, BANK [$32]
	dr $c8000, $cc000

SECTION "Bank 33", ROMX, BANK [$33]
	dr $cc000, $d0000

SECTION "Bank 34", ROMX, BANK [$34]
	dr $d0000, $d4000

SECTION "Bank 35", ROMX, BANK [$35]
	dr $d4000, $d8000

SECTION "Bank 36", ROMX, BANK [$36]
	dr $d8000, $d9f38

Func_d9f38: ; $d9f38
	dr $d9f38, $d9f55

Func_d9f55: ; $d9f55
	dr $d9f55, $d9f68

Func_d9f68: ; $d9f68
	dr $d9f68, $d9f74

Func_d9f74: ; $d9f74
	dr $d9f74, $da07a

Func_da07a: ; $da07a
	dr $da07a, $da093

Func_da093:
	dr $da093, $da4dc

Func_da4dc: ; $da4dc
	dr $da4dc, $da4fc

Func_da4fc: ; $da4fc
	dr $da4fc, $da729

Func_da729:
	dr $da729, $da835

Func_da835: ; $da835
	dr $da835, $da839

Func_da839: ; $da839
	dr $da839, $da901

Func_da901: ; $da901
	dr $da901, $daa40

Func_daa40: ; $daa40
	dr $daa40, $daa72

Func_daa72: ; $daa72
	dr $daa72, $dc000

SECTION "Bank 37", ROMX, BANK [$37]
	dr $dc000, $e0000

SECTION "Bank 38", ROMX, BANK [$38]
	dr $e0000, $e1e83

Func_e1e83:
	dr $e1e83, $e1f2d

Func_e1f2d:
	dr $e1f2d, $e220d

Func_e220d: ; $e220d
	dr $e220d, $e2780

Func_e2780: ; $e2780
	dr $e2780, $e2bf8

Func_e2bf8:
	dr $e2bf8, $e2c29

Func_e2c29:
	dr $e2c29, $e4000

SECTION "Bank 39", ROMX, BANK [$39]
	dr $e4000, $e8000

SECTION "Bank 3e 2", ROMX [$6fb2], BANK [$3e]
	dr $fafb2, $fb2ed

Func_fb2ed:
	dr $fb2ed, $fb42d

Func_fb42d:
	dr $fb42d, $fbd5e

Func_fbd5e:
	dr $fbd5e, $fbfcd

SECTION "Bank 3f", ROMX, BANK [$3f]
IF DEF(SUN)
	dr $fc000, $fd213

Func_fd213:
	dr $fd213, $fd314

Func_fd314:
	dr $fd314, $fe102

Func_fe102:
	dr $fe102, $100000
ENDC
IF DEF(STAR)
	dr $fc000, $fd211

Func_fd213:
	dr $fd211, $fd312

Func_fd314:
	dr $fd312, $fe100

Func_fe102:
	dr $fe100, $100000
ENDC


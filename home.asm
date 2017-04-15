INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

SECTION "High Home", ROM0 [$68]
Predef:: ; 68 (0:0068)
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

Func_00c9:: ; c9 (0:00c9)
; Get a short from hl+[hl] and put it on the stack above the return address.
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

InitCartIRMode:: ; 00e9
	xor a
	ld [hSRAMBank], a
	inc a
	ld [HuC3LatchClock], a
	xor a
	ld [HuC3SRamMode], a
	ld a, [Bank_000c]
BankSwitch_00f7:: ; f7 (0:00f7)
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

SECTION "Init", ROM0 [$100]
Init::
	nop
	jp Start

SECTION "Header", ROM0 [$104]
	ds $150 - $104

SECTION "Home", ROM0 [$150]
Func_0150:: ; 0150
	ld a, [Bank_000b]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	jp Func_78100

CopyPredef::
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
	predef CopyFromVRAMPredef
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
	predef CopyToVRAMPredef
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
NullPredef::
	ret

SECTION "01e0", ROM0 [$1e0]
Pointers_01e0:: ; 01e0
	dw InitCartIRMode
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
	dw SoundOffPredef
	dw UpdateSoundPredef
	dw StartSongPredef
	dw StartSFXPredef
	dw SelectChannelsPredef
	dw CheckSongFinishedPredef
	dw CheckSFXFinishedPredef
	dw ToggleMusicPredef
	dw SetVolumePredef
	dw Func_0218
	dw Func_026c

Func_0218:: ; 0218
	ld de, $1c7d
	ret

Func_021c:: ; 21c (0:021c)
	push af
	push bc
	push de
	push hl
	ld a, [hFF99]
	bit 2, a
	call nz, UpdateSoundPredef
	pop hl
	pop de
	pop bc
	pop af
	reti

INCLUDE "home/audio.asm"

Func_026c:: ; 26c (0:026c)
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

Func_028e:: ; 028e
	di
	ld sp, wStackTop
	predef InitCartIRMode
	predef Func_7b1e1
Func_0296:: ; 296 (0:0296)
	ld hl, Func_0296
	predef Func_7b133
	jp Func_0300

SECTION "02fd", ROM0 [$2fd]
Func_02fd:: ; 2fd (0:02fd)
	jp Func_0309

Func_0300:: ; 300 (0:0300)
	jp Func_030a

Func_0303:: ; 0303
	jp Func_03a4

Func_0306:: ; 0306
	jp Func_03d1

Func_0309:: ; 309 (0:0309)
	ret

Func_030a:: ; 30a (0:030a)
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
	predef InitCartIRMode
	call SoundOff
Start:: ; 323 (0:0323)
	di
	ld sp, wStackTop
	ld [hSystemType], a
	push af
Func_032a:: ; 32a (0:032a)
	ld a, [rLY]
	cp $91
	jp nc, Func_032a
Func_0331:: ; 331 (0:0331)
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
	predef InitCartIRMode
	predef SoundOffPredef
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
Func_0388:: ; 388 (0:0388)
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch
	ld a, $3
	call GetSRAMBank
	call Func_4064
	call SoundOff
	ld a, BANK(Func_4000)
	call BankSwitch
	jp Func_4000

Func_03a4:: ; 3a4 (0:03a4)
	ld a, [hSystemType]
	ld [wSystemType], a
	di
	ld sp, wStackTop
	ld a, BANK(Func_4064)
	call BankSwitch
	ld a, $3
	call GetSRAMBank
	call Func_4064
	call SoundOff
	ld a, $ff
	ld [wc213], a
	ld a, BANK(Func_4000)
	call BankSwitch
	call Func_4000
	xor a
	ld [wc213], a
	jp Func_1e4d

Func_03d1:: ; 3d1 (0:03d1)
	scf
	ret

Func_03d3:: ; 3d3 (0:03d3)
	scf
	ret

GetSRAMBank:: ; 3d5 (0:03d5)
; a = SRAM bank
; bit 7: read-only if set, read/write else
	bit 7, a
	jr nz, GetSRAMBank_ReadOnly
	ld [hSRAMBank], a
	ld [HuC3SRamBank], a
	ld a, SRAM_READWRITE
	ld [HuC3SRamMode], a
	ret

GetSRAMBank_ReadOnly::
	set 7, a
	ld [hSRAMBank], a
	res 7, a
	ld [HuC3SRamBank], a
	xor a ; SRAM_READONLY
	ld [HuC3SRamMode], a
	ret

BankSwitch::
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

FarCall::
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

Func_0451:: ; 0451
	push bc
	ld a, [wOAM27VTile]
	push af
	xor a
	ld [wOAM27VTile], a
	call NextOverworldFrame
	ld c, a
	pop af
	ld [wOAM27VTile], a
	ld a, c
	pop bc
	ret

NextOverworldFrame:: ; 465 (0:0465)
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

CopyFromDEtoHL::
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

FillMemory::
; fill bc bytes at hl with e
.asm_0487
	ld a, e
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0487
	ret

SECTION "0500", ROM0 [$500]
Func_0500:: ; 0500
	ld sp, wStackTop
	di
	predef InitCartIRMode
	ld a, $7
	Coorda 16, 3, wAttrMap
	ld a, $ff
	Coorda 17, 3, wAttrMap
	ld a, $20
	predef Func_7d753
	ld hl, $400
	predef Func_7d85d
Func_0519:: ; 519 (0:0519)
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
Func_058a:: ; 058a
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

Data_059c:: ; 059c
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

Data_065e:: ; 065e
	db "  めにゅー", $0f, "を せんたくして", $0e, $00
	db " $"
	db $0f, "START/Aを おしてくたﾞさい", $0e, $00
	db $00

Data_0686:: ; 0686
	db "--------$"

Func_068f:: ; 68f (0:068f)
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
Func_072b:: ; 72b (0:072b)
	call BitIndexToMask
	ld d, a
	aCoord 17, 3, wAttrMap
	or d
	Coorda 17, 3, wAttrMap
	jp Func_0519

BitIndexToMask:: ; 739 (0:0739)
	push bc
	ld c, a
	ld a, $80
.loop
	rlca
	dec c
	jr nz, .loop
	pop bc
	ret

Data_0743:: ; 0743
	db " $"
	db "はﾟすわーとﾞ", $0f, "を にゅうりょくして ", $0e, $00
	db $0f, "STARTを おしてくたﾞさい  ", $0e, $00
	db $00

Func_076f:: ; 076f
	ld de, $4000
	ld a, $7
	call Func_0856
Func_0777:: ; 0777
	ld de, $4000
	ld a, $9
	call Func_0856
Func_077f:: ; 077f
	ld de, $4000
	ld a, $b
	call Func_0856
Func_0787:: ; 0787
	ld de, $4000
	ld a, $d
	call Func_0856
Func_078f:: ; 078f
	ld de, $4000
	ld a, $e
	call Func_0856
Func_0797:: ; 0797
	ld de, $4000
	ld a, $f
	call Func_0856
	jp Func_0519

Func_07a2:: ; 7a2 (0:07a2)
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

Data_07e7:: ; 07e7
	db "GB KISS  MINI GAME$"

Data_07fa:: ; 07fa
	dr $7fa, $83b

Func_083b:: ; 83b (0:083b)
	bcbgcoord 2, 14
Func_083e:: ; 083e
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

Func_0856:: ; 856 (0:0856)
	hlcoord 12, 17
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
Func_085d:: ; 85d (0:085d)
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
Func_088f:: ; 88f (0:088f)
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
Func_0906:: ; 906 (0:0906)
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

Func_09c2:: ; 9c2 (0:09c2)
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

Func_0a18:: ; a18 (0:0a18)
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

Func_0a91:: ; a91 (0:0a91)
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

Func_0aee:: ; aee (0:0aee)
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

Func_0b97:: ; b97 (0:0b97)
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
Func_0baa:: ; baa (0:0baa)
	or $1
	scf
	ret

Func_0bae:: ; bae (0:0bae)
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

Data_0bd3:: ; 0bd3
	dr $bd3, $c15

Data_0c15:: ; 0c15
	dr $c15, $c51

Func_0c51:: ; c51 (0:0c51)
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

Data_0cae:: ; 0cae
	dr $cae, $cbb

Func_0cbb:: ; cbb (0:0cbb)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac8d
	jr asm_0cf7

Func_0cc1:: ; cc1 (0:0cc1)
	ld [$c800], a
	ld de, $ce00
	ld hl, $c800
	ld c, $1
	predef FrameDelayPredef_7ceaf
	predef Func_7aca4
	jr asm_0cf7

Func_0cd2:: ; cd2 (0:0cd2)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac16
	jr asm_0cf7

Func_0cd8:: ; 0cd8
	hlcoord 8, 12, wAttrMap
	predef FrameDelayPredef_7ceaf
	predef Func_7ac62
	jr asm_0cf7

Func_0ce1:: ; ce1 (0:0ce1)
	predef FrameDelayPredef_7ceaf
	predef Func_7acd3
	jr asm_0cf7

Func_0ce7:: ; ce7 (0:0ce7)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac56
	jr asm_0cf7

Func_0ced:: ; ced (0:0ced)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac37
	jr asm_0cf7

Func_0cf3:: ; cf3 (0:0cf3)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac2a
asm_0cf7
	push af
	predef Func_7e0d2
	pop af
	ret

Data_0cfc:: ; 0cfc
	dr $cfc, $d3a

SECTION "0e00", ROM0 [$e00]
INCLUDE "home/vblank.asm"

TimerInterrupt::
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
	call UpdateSound
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

Func_1069:: ; 1069
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
	jp hl

Pointers_1090:: ; 1090
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

Func_10a6:: ; 10a6
	pop hl
	pop af
	reti

Func_10a9:: ; 10a9
	ld a, $2
	ld [wOAM07VTile], a
	pop hl
.asm_10af
	pop af
	reti

Func_10b1:: ; 10b1
	ld a, $6
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_10b9:: ; 10b9
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

Func_10cc:: ; 10cc
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

Func_10fc:: ; 10fc
	ld a, [wOAM07YCoord]
	ld [wOAM09YCoord], a
	ld a, $4
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_110a:: ; 110a
	ld a, $1
	ld [wOAM07Attrs], a
	ld a, [wOAM07YCoord]
	ld [wOAM09XCoord], a
	ld a, $0
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_111d:: ; 111d
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

Func_1130:: ; 1130
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

Func_115f:: ; 115f
	ld a, [wOAM09YCoord]
	ld [rSB], a
	ld a, $8
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

Func_116c:: ; 116c
	ld a, $1
	ld [wOAM07Attrs], a
	ld a, [wOAM09XCoord]
	ld [rSB], a
	ld a, $0
	ld [wOAM07VTile], a
	pop hl
	pop af
	reti

LCDInterrupt::
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

HandleVideoTransferRequest:: ; 11ce (0:11ce)
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

VBlankReadJoypad:: ; 120e (0:120e)
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

ReadJoypad:: ; 1222 (0:1222)
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

Decompress_ReadCBits:: ; 124e (0:124e)
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

Decompress:: ; 1263 (0:1263)
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

DecompressRequestRoboponPic::
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

RequestVideoTransferQueue:: ; 13ed (0:13ed)
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

PutOnVideoTransferQueue:: ; 1405 (0:1405)
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

RequestVideoData:: ; 1428 (0:1428)
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

FarCopyVideoData::
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call CopyFromDEtoHL
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarRequestVideoData::
	ld a, [hROMBank]
	push af
	ld a, [wFarCallDestBank]
	call BankSwitch
	call RequestVideoData
	call WaitVideoTransfer
	pop af
	call BankSwitch
	ret

FarDecompressVideoData::
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

Func_1a06:: ; 1a06
	inc e
	ld b, h
	ld c, l
	jr .handleLoop

.loop
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
.handleLoop
	ld l, c
	ld h, b
	dec e
	jr nz, .loop
	ret

MultiplyULongAtHLByUShortDE:: ; 1a1f
	push bc
	ld c, l
	ld b, h
	add sp, -$4
	ld hl, sp+$0
	ld a, $4
.copy
	push af
	ld a, [bc]
	ld [hli], a
	inc bc
	pop af
	dec a
	jr nz, .copy
	dec hl
	ld c, l
	ld b, h
	push de
	read_hl_from_sp_plus $8
	pop de
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	reg8rot a, l, c
	reg8rot a, h, b
.main_loop
	ld a, e
	or d
	jr z, .done
	srl d
	rr e
	push de
	jr nc, .next
	ccf
	push bc
	push hl
	ld e, $4
.add_loop
	ld a, [bc]
	adc [hl]
	ld [bc], a
	dec bc
	dec hl
	dec e
	jr nz, .add_loop
	pop hl
	pop bc
.next
	push hl
	ld e, $4
	scf
	ccf
.rotate_left
	ld a, [hl]
	rla
	ld [hld], a
	dec e
	jr nz, .rotate_left
	pop hl
	pop de
	jr .main_loop

.done
	add sp, $6
	ret

CallAudioEngine1C::
	ld h, a
	ld a, [wVideoTransferRequestFlags]
	bit 0, a
	jr z, .asm_1a7a
	xor a
	ret

.asm_1a7a
	ld a, [hROMBank]
	push af
	ld a, BANK(SoundOff_1c)
	call BankSwitch
	ld a, h
	ld de, .Return
	push de
	ld h, SoundOff_1c / $100
	push hl
	ret

.Return
	ld h, a
	pop af
	jp BankSwitch

SoundOff:: ; 1a90 (0:1a90)
	ld l, SoundOff_1c % $100
	jr CallAudioEngine1C

UpdateSound:: ; 1a94 (0:1a94)
	ld a, [hROMBank]
	ld [wVideoTransferRequestBank], a
	ld a, [wVideoTransferRequestFlags]
	set 1, a
	ld [wVideoTransferRequestFlags], a
	ld l, UpdateSound_1c % $100
	call CallAudioEngine1C
	ld a, [wVideoTransferRequestFlags]
	res 1, a
	ld [wVideoTransferRequestFlags], a
	ret

StartSong:: ; 1aaf (0:1aaf)
	ld l, StartSong_1c % $100
	ld h, a
	jr CallAudioEngine1C

StartSFX:: ; 1ab4 (0:1ab4)
	ld l, StartSFX_1c % $100
	ld h, a
	jr CallAudioEngine1C

SelectChannels:: ; 1ab9
	ld l, SelectChannels_1c % $100
	ld h, a
	jr CallAudioEngine1C

CheckSongFinished:: ; 1abe
	ld l, CheckSongFinished_1c % $100
	call CallAudioEngine1C
	ld a, h
	ret

CheckSFXFinished:: ; 1ac5
	ld l, CheckSFXFinished_1c % $100
	call CallAudioEngine1C
	ld a, h
	ret

ToggleMusic:: ; 1acc
	ld l, ToggleMusic_1c % $100
	jr CallAudioEngine1C

SetVolume:: ; 1ad0
	ld l, SetVolume_1c % $100
	ld h, a
	jr CallAudioEngine1C

BackUpMusicData:: ; 1ad5
	ld l, BackUpMusicData_1c % $100
	jr CallAudioEngine1C

RestoreMusicData:: ; 1ad9
	ld l, RestoreMusicData_1c % $100
	jr CallAudioEngine1C

GBKiss:: ; 1add
	di
	xor a
	ld [rIF], a
	ld [rIE], a
	ld a, $0
	call GetSRAMBank
	ld a, BANK(GBKiss)
	call BankSwitch
	ld sp, wStackTop
	ld a, $e4
	ld [rBGP], a
	ld [rOBP0], a
	ld a, $1b
	ld [rOBP1], a
	predef InitCartIRMode
	predef Func_7b21d
	jp @ - 1 ; better luck next time

Func_1b01:: ; 1b01
	ld sp, wStackTop
	ld a, $3
	call GetSRAMBank
	callba Func_fd213
	ld a, $3
	call GetSRAMBank
	ld a, BANK(Func_4060)
	call BankSwitch
	jp Func_4060

Func_1b28:: ; 1b28 (0:1b28)
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
	ld a, [wc01c]
	cp $11
	jr z, .asm_1b52
	di
	predef RTCUpdatePredef
	ei
	ld a, [wc01c]
	cp $10
	jp nz, .done
	ld a, $11
	ld [wc01c], a
	jp .done

.asm_1b52
	di
	predef RTCUpdatePredef
	ei
	ld a, $1
	ld [wc01c], a
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

SuppressVBlankCallback:: ; 1beb (0:1beb)
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

ApplyVBlankCallbackEnableFlag:: ; 1bff (0:1bff)
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

Func_1c11:: ; 1c11
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

Func_1c27:: ; 1c27
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

Func_1c3b:: ; 1c3b
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

Func_1c5a:: ; 1c5a
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

Func_1c69:: ; 1c69
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

Func_1c78:: ; 1c78
	ld a, [hSRAMBank]
	push af
	call SuppressVBlankCallback
	push bc
	predef Func_7aa8e
	jr asm_1c8c

Func_1c83:: ; 1c83
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

EnableVBlank::
	ld hl, rIE
	set 0, [hl]
	ret

DisableVBlank::
	ld hl, rIE
	res 0, [hl]
	ret

EnableHBlank::
	ld hl, rIE
	set 1, [hl]
	ret

DisableHBlank::
	ld hl, rIE
	res 1, [hl]
	ret

EnableTimerInt::
	ld hl, rIE
	set 2, [hl]
	ret

DisableTimerInt::
	ld hl, rIE
	res 2, [hl]
	ret

EnableJoypadInt::
	ld hl, rIE
	set 3, [hl]
	ret

DisableJoypadInt::
	ld hl, rIE
	res 3, [hl]
	ret

SECTION "1d00", ROM0 [$1d00]
INCLUDE "home/crash.asm"

Func_1db9:: ; 1db9
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
	ld hl, wEventFlags
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
	write_hl_to $c391
	ld hl, $0
	write_hl_to $c393
	ld bc, $5
	ld e, $0
	ld hl, wOAM02XCoord
	call FillMemory
	ret

Func_1e4d:: ; 1e4d (0:1e4d)
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
Func_1ea8:: ; 1ea8 (0:1ea8)
	ld a, [wc01c]
	cp $11
	jp z, Func_1ec2
	ld a, [wc01c]
	or a
	jp nz, Func_1ebc
	ld a, $1
	ld [wc01c], a
Func_1ebc:: ; 1ebc (0:1ebc)
	call NextOverworldFrame
	jp Func_1ea8

Func_1ec2:: ; 1ec2 (0:1ec2)
	call NextOverworldFrame
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
	reg16swap de, hl
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
Func_1f25:: ; 1f25 (0:1f25)
	ld a, $1
Func_1f27:: ; 1f27 (0:1f27)
	ld a, $ff
	ld [wOAM26Attrs], a
	call Func_144fd
	ret

Func_1f30:: ; 1f30
	read_hl_from $c30e
	ld a, l
	or h
	jp nz, Func_1f7a
	set_farcall_addrs_hli AllocateMemory
	ld hl, $100
	call FarCall
	write_hl_to $c30e
	call WaitVideoTransfer
	ld a, BANK(GFX_4a12)
	ld [wFarCallDestBank], a
	ld bc, $f0
	ld de, $88f0
	read_hl_from $c30e
	call FarRequestVideoData
	ld a, BANK(GFX_4a12)
	ld [wFarCallDestBank], a
	ld bc, $f0
	ld de, GFX_4a12
	ld hl, $88f0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_1f7a:: ; 1f7a (0:1f7a)
	ret

Func_1f7b:: ; 1f7b
	read_hl_from $c30e
	ld a, l
	or h
	jp z, Func_1fbd
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $f0
	read_hl_from $c30e
	reg16swap de, hl
	ld hl, $88f0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli DeallocateMemory
	read_hl_from $c30e
	call FarCall
	ld hl, $0
	write_hl_to $c30e
Func_1fbd:: ; 1fbd (0:1fbd)
	ret

Func_1fbe:: ; 1fbe
	read_hl_from $c2f2
	ld a, l
	or h
	jp nz, Func_2008
	set_farcall_addrs_hli AllocateMemory
	ld hl, $1ba
	call FarCall
	write_hl_to $c2f2
	call WaitVideoTransfer
	ld a, BANK(GFX_4b22)
	ld [wFarCallDestBank], a
	ld bc, $1ba
	ld de, $8cc0
	read_hl_from $c2f2
	call FarRequestVideoData
	ld a, BANK(GFX_4b22)
	ld [wFarCallDestBank], a
	ld bc, $1ba
	ld de, GFX_4b22
	ld hl, $8cc0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_2008:: ; 2008 (0:2008)
	ret

Func_2009:: ; 2009
	read_hl_from $c2f2
	ld a, l
	or h
	jp z, Func_204b
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $1ba
	read_hl_from $c2f2
	reg16swap de, hl
	ld hl, $8cc0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli DeallocateMemory
	read_hl_from $c2f2
	call FarCall
	ld hl, HuC3SRamMode
	write_hl_to $c2f2
Func_204b:: ; 204b
	ret

Func_204c:: ; 204c
	read_hl_from $c2f2
	ld a, l
	or h
	jp nz, Func_2096
	set_farcall_addrs_hli AllocateMemory
	ld hl, $50
	call FarCall
	write_hl_to $c2f2
	call WaitVideoTransfer
	ld a, BANK(GFX_4e02)
	ld [wFarCallDestBank], a
	ld bc, $50
	ld de, $8fa0
	read_hl_from $c2f2
	call FarRequestVideoData
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $50
	ld de, GFX_4e02
	ld hl, $8fa0
	call FarRequestVideoData
	call WaitVideoTransfer
Func_2096:: ; 2096 (0:2096)
	ret

Func_2097:: ; 2097
	read_hl_from $c2f2
	ld a, l
	or h
	jp z, Func_20d9
	call WaitVideoTransfer
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $50
	read_hl_from $c2f2
	reg16swap de, hl
	ld hl, $8fa0
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli DeallocateMemory
	read_hl_from $c2f2
	call FarCall
	ld hl, $0
	write_hl_to $c2f2
Func_20d9:: ; 20d9 (0:20d9)
	ret

Func_20da:: ; 20da (0:20da)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
Func_20e2:: ; 20e2 (0:20e2)
	cp l
	jp nc, Func_2122
	push hl
	push af
	xor a
Func_20e9:: ; 20e9 (0:20e9)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_2101
	push af
	read_hl_from_sp_plus $c
	ld a, [hl]
	inc hl
	call WriteHLToSPPlusParam8
	db $c
	ld [bc], a
	inc bc
	pop af
	inc a
	jp Func_20e9

Func_2101:: ; 2101 (0:2101)
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
	read_hl_from_sp_plus $c
	add hl, bc
	call WriteHLToSPPlusParam8
	db $c
	pop af
	inc a
	pop bc
	pop hl
	jp Func_20e2

Func_2122:: ; 2122 (0:2122)
	pop bc
	ret

Func_2124:: ; 2124
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

Func_2152:: ; 2152
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

Func_2180:: ; 2180 (0:2180)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
Func_2188:: ; 2188 (0:2188)
	cp l
	jp nc, Func_21c8
	push hl
	push af
	xor a
Func_218f:: ; 218f (0:218f)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_21a7
	push af
	ld a, [bc]
	inc bc
	read_hl_from_sp_plus $c
	ld [hl], a
	inc hl
	call WriteHLToSPPlusParam8
	db $c
	pop af
	inc a
	jp Func_218f

Func_21a7:: ; 21a7 (0:21a7)
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
	read_hl_from_sp_plus $c
	add hl, bc
	call WriteHLToSPPlusParam8
	db $c
	pop af
	inc a
	pop bc
	pop hl
	jp Func_2188

Func_21c8:: ; 21c8 (0:21c8)
	pop bc
	ret

Func_21ca:: ; 21ca
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

Func_21f8:: ; 21f8
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

Data_2226:: ; 2226
	dr $2226, $2230

Func_2230:: ; 2230
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	read_hl_from_sp_plus $c
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

Func_224f:: ; 224f (0:224f)
	read_hl_from_sp_plus $c
	ld e, h
	ld hl, sp+$4
	ld [hl], e
	read_hl_from_sp_plus $c
	ld e, l
	ld hl, sp+$3
	ld [hl], e
Func_225f:: ; 225f (0:225f)
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

Func_2285:: ; 2285 (0:2285)
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
Func_2299:: ; 2299 (0:2299)
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

Func_22ce:: ; 22ce (0:22ce)
	ld hl, Data_2309
	push hl
	call PlaceString
	pop bc
Func_22d6:: ; 22d6 (0:22d6)
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

Func_22e8:: ; 22e8 (0:22e8)
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
Func_22fe:: ; 22fe (0:22fe)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_2304:: ; 2304
	TX_SNUM
	db "$"

Data_2307:: ; 2307
	db "0$"

Data_2309:: ; 2309
	db " $"

Data_230b:: ; 230b
	TX_SNUM
	db "$"

PlaceStringDEatCoordHL:: ; 230e (0:230e)
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

Func_2323:: ; 2323
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

Func_236f:: ; 236f
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
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, 47
	call CopyFromDEtoHL
	pop af
	call GetSRAMBank
	ld bc, 47
	ld hl, sp+$0
	push hl
	read_hl_from_sp_plus $f2
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
	write_hl_to_sp_plus $f1
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
	read_hl_from_sp_plus $f3
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $f3
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
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	push hl
	read_hl_from_sp_plus $f4
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

Func_241f:: ; 241f
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
	write_hl_to_sp_plus $c6
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
	read_hl_from_sp_plus $c8
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $c8
	add hl, bc
	pop de
	ld bc, $c0
	call Decompress
	pop de
	ld l, e
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	push hl
	read_hl_from_sp_plus $c8
	pop de
	ld bc, $18
	call CopyFromDEtoHL
	pop af
	call BankSwitch
	ld hl, $c4
	add hl, sp
	ld sp, hl
	ret

Func_248f:: ; 248f
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

Func_24bb::
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

CheckButton:: ; 24e9 (0:24e9)
	call NextOverworldFrame
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

Func_2515:: ; 2515
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

Func_256d:: ; 256d (0:256d)
	ld e, $69
Func_256f:: ; 256f (0:256f)
	ld hl, sp+$c
	ld a, [hl]
	add $94
	add e
	ld hl, sp+$b
	ld [hl], a
Func_2578:: ; 2578 (0:2578)
	read_hl_from_sp_plus $12
	ld de, $fff8
	add hl, de
	inc h
	dec h
	bit 7, h
	jr nz, .asm_25a1
	read_hl_from_sp_plus $f
	ld [hl], $92
	inc hl
	call WriteHLToSPPlusParam8
	db $f
	read_hl_from_sp_plus $12
	ld de, $fff8
	add hl, de
	write_hl_to_sp_plus $12
	inc c
	jp Func_25a4

.asm_25a1
	jp Func_25a7

Func_25a4:: ; 25a4 (0:25a4)
	jp Func_2578

Func_25a7:: ; 25a7 (0:25a7)
	read_hl_from_sp_plus $12
	ld a, l
	or h
	jp z, Func_25eb
	inc c
	push bc
	ld hl, sp+$d
	ld a, [hl]
	read_hl_from_sp_plus $11
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $11
	ld a, $1
	ld [wFarCallDestBank], a
	ld bc, $10
	read_hl_from_sp_plus $14
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
Func_25eb:: ; 25eb (0:25eb)
	ld a, c
	cp $6
	jp nc, Func_2600
	read_hl_from_sp_plus $f
	ld [hl], $93
	inc hl
	call WriteHLToSPPlusParam8
	db $f
	inc c
	jp Func_25eb

Func_2600:: ; 2600 (0:2600)
	pop hl
	call Coord2TileMap
	ld c, l
	ld b, h
	ld hl, sp+$0
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $9
	call CopyFromDEtoHL
	add sp, $10
	ret

Func_2617:: ; 2617
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

Func_2642:: ; 2642 (0:2642)
	push de
	ld c, $0
Func_2645:: ; 2645 (0:2645)
	ld a, h
	and $40
	jp z, Func_264e
	jp Func_2653

Func_264e:: ; 264e (0:264e)
	inc c
	add hl, hl
	jp Func_2645

Func_2653:: ; 2653 (0:2653)
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
Func_2690:: ; 2690 (0:2690)
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

Func_26a3:: ; 26a3 (0:26a3)
	xor a
Func_26a4:: ; 26a4 (0:26a4)
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

Func_26d3:: ; 26d3 (0:26d3)
	pop bc
	pop bc
	pop bc
	ret

CopyUntilNull:: ; 26d7 (0:26d7)
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

FarCopyUntilNull::
; copy from c:de to hl
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

Func_270a:: ; 270a
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

Func_2730:: ; 2730 (0:2730)
	cp $b
	jp nc, Func_273b
	ld bc, $8
	jp Func_273e

Func_273b:: ; 273b (0:273b)
	ld bc, $7
Func_273e:: ; 273e (0:273e)
	ld a, c
Func_273f:: ; 273f (0:273f)
	dec e
	jp nz, Func_2746
	jp Func_2761

Func_2746:: ; 2746 (0:2746)
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

Func_2761:: ; 2761 (0:2761)
	pop de
	push bc
	ld a, e
	or d
	jp z, Func_2770
	ld hl, sp+$4
	ld bc, $4
	call MemCopy
Func_2770:: ; 2770 (0:2770)
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

Func_277c:: ; 277c
	ld a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, sp+$8
	reg16swap de, hl
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

Func_27c0:: ; 27c0 (0:27c0)
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
Func_27e0:: ; 27e0 (0:27e0)
	ld a, $3
	call GetSRAMBank
	ld de, $c989
	ld hl, sp+$8
	ld bc, $4
	call MemCopy
	pop af
	call GetSRAMBank
	ret

ClearSprites:: ; 27f5
	ld bc, $a0
	ld e, $0
	ld hl, wOAMBuffer2
	call FillMemory
	ret

Func_2801:: ; 2801 (0:2801)
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
	reg16swap de, hl
	push de
	ld a, $3
	call GetSRAMBank
	set_farcall_addrs_hli AllocateMemory
	pop de
	push de
	reg16swap de, hl
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
	read_hl_from_sp_plus $c
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
	reg16swap de, hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	reg16swap de, hl
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

Func_2887:: ; 2887 (0:2887)
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
	set_farcall_addrs_hli DeallocateMemory
	pop hl
	call FarCall
	pop af
	call GetSRAMBank
	pop bc
	pop bc
	pop bc
	ret

Func_292b:: ; 292b (0:292b)
	ld e, $0
Func_292d:: ; 292d (0:292d)
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
Func_2948:: ; 2948 (0:2948)
	jp Func_292d

Func_294b:: ; 294b (0:294b)
	inc e
	jp Func_292d

Func_294f:: ; 294f (0:294f)
	ld a, e
	ret

Func_2951:: ; 2951 (0:2951)
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
Func_2976:: ; 2976 (0:2976)
	pop hl
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	cp $ff
	jp nz, Func_2984
	ld hl, sp+$6
	ld [hl], $7
Func_2984:: ; 2984 (0:2984)
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
	reg16swap de, hl
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$4
	ld l, [hl]
	ld h, a
	call Func_2801
Func_29a6:: ; 29a6 (0:29a6)
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
Func_29cb:: ; 29cb (0:29cb)
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
	reg16swap de, hl
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
Func_2a26:: ; 2a26 (0:2a26)
	call CheckButton
	and $30
	jp z, Func_2a26
Func_2a2e:: ; 2a2e (0:2a2e)
	pop bc
	pop hl
	push hl
	ld a, c
	and $4
	jp nz, Func_2a3a
	call Func_2887
Func_2a3a:: ; 2a3a (0:2a3a)
	pop hl
	pop bc
	pop bc
	ret

Func_2a3e:: ; 2a3e
	ld c, e
	reg16swap de, hl
	ld hl, $ffff
	jp Func_2951

Func_2a49:: ; 2a49 (0:2a49)
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
	write_hl_to $c391
	ld hl, $676
	write_hl_to $c393
Func_2a78:: ; 2a78 (0:2a78)
	ret

Func_2a79:: ; 2a79 (0:2a79)
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
Func_2aa1:: ; 2aa1 (0:2aa1)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_2aa1
Func_2aab:: ; 2aab (0:2aab)
	ld a, BANK(Func_6b22)
	call BankSwitch
	pop af
	pop bc
	push af
Func_2ab3:: ; 2ab3 (0:2ab3)
	read_hl_from_sp_plus $16
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_2b70
	push bc
	xor a
	call Func_6b22
	read_hl_from_sp_plus $18
	ld de, $10
	call CompareHLtoDE
	jp c, Func_2add
	ld hl, sp+$14
	ld [hl], $10
	jp Func_2ae5

Func_2add:: ; 2add (0:2add)
	read_hl_from_sp_plus $18
	ld e, l
	ld hl, sp+$14
	ld [hl], e
Func_2ae5:: ; 2ae5 (0:2ae5)
	ld hl, sp+$15
	ld a, [hl]
	call BankSwitch
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $1a
	reg16swap de, hl
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
Func_2b20:: ; 2b20 (0:2b20)
	ld a, BANK(Func_6b37)
	call BankSwitch
	ld a, $10
	ld hl, sp+$4
Func_2b29:: ; 2b29 (0:2b29)
	cp $1
	jp c, Func_2b3b
	push hl
	push af
	ld a, [hl]
	call Func_6b37
	pop af
	dec a
	pop hl
	inc hl
	jp Func_2b29

Func_2b3b:: ; 2b3b (0:2b3b)
	ld a, $20
	call Func_6b22
asm_2b3f
	pop bc
	inc c
	dec c
	jp z, Func_2b49
	jp Func_2b70

Func_2b49:: ; 2b49 (0:2b49)
	push bc
	call Func_6b4b
	ld hl, sp+$14
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $18
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	write_hl_to_sp_plus $18
	read_hl_from_sp_plus $1a
	ld de, $10
	add hl, de
	write_hl_to_sp_plus $1a
	pop bc
	jp Func_2ab3

Func_2b70:: ; 2b70 (0:2b70)
	pop af
	ld [wNextVBlankFlags], a
	ld hl, sp+$11
	ld a, [hl]
	call BankSwitch
	add sp, $16
	ret

Func_2b7d:: ; 2b7d (0:2b7d)
	ld c, $0
	call Func_2a79
	ret

Func_2b83:: ; 2b83
	ld a, [wSystemType]
	cp $1
	jp z, .not_cgb
	ld a, [wSystemType]
	cp $ff
	jp nz, .nope
.not_cgb
	call Func_2b7d
.nope
	ret

Func_2b97:: ; 2b97
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
Func_2bb5:: ; 2bb5 (0:2bb5)
	inc hl
	ld a, [hl]
	and $80
	ld [hl], a
	ld b, $7
	xor a
Func_2bbd:: ; 2bbd (0:2bbd)
	dec hl
	ld [hl], a
	dec b
	jp nz, Func_2bbd
	jp Func_2c0b

Func_2bc6:: ; 2bc6 (0:2bc6)
	inc e
	ld hl, $4
	add hl, sp
	ld c, $8
	ld b, e
	call RightShiftArbitrarySize
	ld de, $0
.asm_2bd4
	jp Func_2bea

Func_2bd7:: ; 2bd7 (0:2bd7)
	ld hl, wOAMBuffer2
	add hl, bc
	reg16swap de, hl
	inc de
	ld a, d
	dec de
	cp $8
	jp c, Func_2bea
	ld de, $7ff
Func_2bea:: ; 2bea (0:2bea)
	ld hl, $4
	add hl, sp
	ld bc, $509
	call LeftShiftArbitrarySize
	ld hl, $c
	add hl, sp
	reg16swap de, hl
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
Func_2c0b:: ; 2c0b (0:2c0b)
	pop hl
	pop bc
	pop af
	push bc
	ret

Func_2c10:: ; 2c10
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
	reg16swap de, hl
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
Func_2c45:: ; 2c45 (0:2c45)
	ld a, b
Func_2c46:: ; 2c46 (0:2c46)
	ld bc, $3c01
	add hl, bc
	reg16swap de, hl
	push de
	ld b, $7
Func_2c51:: ; 2c51 (0:2c51)
	dec hl
	ld d, a
	ld e, [hl]
	ld a, e
	reg16swap de, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
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

Func_2c72:: ; 2c72
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
Func_2c90:: ; 2c90 (0:2c90)
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

Func_2c9f:: ; 2c9f (0:2c9f)
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

Func_2cb1:: ; 2cb1 (0:2cb1)
	reg16swap de, hl
	ld hl, $c080
	add hl, bc
	reg16swap de, hl
	ld a, d
	or a
	jp z, Func_2cc4
	ld e, $ff
Func_2cc4:: ; 2cc4 (0:2cc4)
	ld b, h
	ld c, l
	ld d, $3
Func_2cc8:: ; 2cc8 (0:2cc8)
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
Func_2ce0:: ; 2ce0 (0:2ce0)
	pop hl
	pop bc
	pop af
	pop af
	pop af
	push bc
	ret

Func_2ce7:: ; 2ce7
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
Func_2d10:: ; 2d10 (0:2d10)
	reg16swap de, hl
	ld hl, $3f81
	add hl, bc
	reg16swap de, hl
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

Func_2d31:: ; 2d31
	pop bc
	ld a, h
	push hl
	push hl
	ld hl, $0
	ld de, $400e
	jp Func_2d47

Func_2d3d:: ; 2d3d
	pop bc
	pop hl
	pop de
	ld a, d
	push de
	push de
	ld de, $401e
Func_2d47:: ; 2d47 (0:2d47)
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

Func_2d60:: ; 2d60
	pop bc
	ld de, $0
	jp Func_2d69

Func_2d66:: ; 2d66
	pop bc
	pop hl
	pop de
Func_2d69:: ; 2d69 (0:2d69)
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

Func_2d7c:: ; 2d7c
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

Func_2d90:: ; 2d90 (0:2d90)
	and $80
	ret z
	jp NegativeHL

Func_2d96:: ; 2d96
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
Func_2dab:: ; 2dab (0:2dab)
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

Func_2dc3:: ; 2dc3 (0:2dc3)
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
	reg16swap de, hl
	call RightShiftArbitrarySize
	pop af
	and a
	ret

Func_2dec:: ; 2dec (0:2dec)
	pop af
	scf
	ret

Func_2def:: ; 2def
	ld hl, $b
	add hl, sp
	ld a, [hl]
	xor $80
	jp nz, Func_2e09
	push hl
	ld c, $9
Func_2dfc:: ; 2dfc (0:2dfc)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2dfc
	pop hl
	or a
	jp nz, Func_2e09
	ld [hl], $0
Func_2e09:: ; 2e09 (0:2e09)
	reg16swap de, hl
	ld hl, $16
	add hl, sp
	push hl
	dec hl
	ld a, [hl]
	xor $80
	jp nz, Func_2e29
	push hl
	ld c, $9
Func_2e1c:: ; 2e1c (0:2e1c)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2e1c
	pop hl
	or a
	jp nz, Func_2e29
	ld [hl], $0
Func_2e29:: ; 2e29 (0:2e29)
	ld a, [de]
	or [hl]
	bit 7, a
	jp nz, Func_2e34
	reg16swap de, hl
Func_2e34:: ; 2e34 (0:2e34)
	ld c, $a
Func_2e36:: ; 2e36 (0:2e36)
	ld a, [de]
	cp [hl]
	jp nz, Func_2e41
	dec hl
	dec de
	dec c
	jp nz, Func_2e36
Func_2e41:: ; 2e41 (0:2e41)
	pop hl
	pop bc
	ld sp, hl
	push bc
	ret

Func_2e46:: ; 2e46
	ld hl, $b
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_2e5c
	push hl
	ld c, $9
Func_2e52:: ; 2e52 (0:2e52)
	dec hl
	or [hl]
	dec c
	jp nz, Func_2e52
	pop hl
	or a
	ret z
	ld a, [hl]
Func_2e5c:: ; 2e5c (0:2e5c)
	xor $80
	ld [hl], a
	ret

Func_2e60:: ; 2e60
	pop bc
	ld de, $0
	ld a, $c
Func_2e66:: ; 2e66 (0:2e66)
	push de
	dec a
	jp nz, Func_2e66
	push bc
	push hl
	ld hl, $26
	add hl, sp
	push hl
	reg16swap de, hl
	ld hl, $e
	add hl, sp
	ld c, $8
Func_2e7c:: ; 2e7c (0:2e7c)
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
	ld hl, $c
	add hl, sp
	reg16swap de, hl
	ld hl, $1c
	add hl, sp
	ld a, $48
Func_2ea7:: ; 2ea7 (0:2ea7)
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

Func_2ec4:: ; 2ec4 (0:2ec4)
	call AddArbitrarySize
Func_2ec7:: ; 2ec7 (0:2ec7)
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
Func_2ed6:: ; 2ed6 (0:2ed6)
	push bc
	reg16swap de, hl
	ld bc, $110
	call RightShiftArbitrarySize
	reg16swap de, hl
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
Func_2f01:: ; 2f01 (0:2f01)
	ld hl, $4000
	jp Func_2f14

Func_2f07:: ; 2f07 (0:2f07)
	ld de, $c001
	call CompareHLtoDE
	jp nc, Func_2f14
	reg16swap de, hl
Func_2f14:: ; 2f14 (0:2f14)
	ld de, $3fff
	add hl, de
	reg16swap de, hl
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
	reg16swap de, hl
	push bc
	ret

Func_2f2f:: ; 2f2f
	pop bc
	ld de, $0
	ld a, $9
Func_2f35:: ; 2f35 (0:2f35)
	push de
	dec a
	jp nz, Func_2f35
	push bc
	push hl
	ld hl, $27
	add hl, sp
	reg16swap de, hl
	ld hl, $4
	add hl, sp
	ld b, $80
	ld a, $40
Func_2f4c:: ; 2f4c (0:2f4c)
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
	reg16swap de, hl
	ld hl, $1c
	add hl, sp
	reg16swap de, hl
	ld bc, $8
	call AddArbitrarySize
	pop de
	jp nc, Func_2f78
	push hl
	add hl, bc
	call IncrementArbitrarySize
	pop hl
Func_2f78:: ; 2f78 (0:2f78)
	pop bc
Func_2f79:: ; 2f79 (0:2f79)
	ld a, b
	rrca
	ld b, a
	jp nc, Func_2f80
	dec de
Func_2f80:: ; 2f80 (0:2f80)
	pop af
	dec a
	jp nz, Func_2f4c
	reg16swap de, hl
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

Func_2fc0:: ; 2fc0 (0:2fc0)
	ld a, l
	sub $fe
	ld a, h
	sbc $bf
	jp nc, Func_2fcc
	ld hl, $3fff
Func_2fcc:: ; 2fcc (0:2fcc)
	ld de, $c001
	add hl, de
	reg16swap de, hl
	pop af
	pop hl
	ld c, $10
	call Func_3106
	pop de
	ld c, $a
Func_2fde:: ; 2fde (0:2fde)
	ld a, [hl]
	dec hl
	ld [de], a
	dec de
	dec c
	jp nz, Func_2fde
	inc de
	reg16swap de, hl
	pop de
	pop bc
	ld sp, hl
	reg16swap de, hl
	push bc
	ret

Func_2ff4:: ; 2ff4
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
	reg16swap de, hl
	add hl, bc
	reg16swap de, hl
	bit 7, d
	jp z, Func_3026
	ld de, $0
	jp c, Func_3026
	ld de, $7fff
Func_3026:: ; 3026 (0:3026)
	ld a, [hl]
	and $80
	or d
	ld [hl], a
	dec hl
	ld [hl], e
Func_302d:: ; 302d (0:302d)
	pop hl
	ret

Func_302f:: ; 302f
	reg16swap de, hl
	ld hl, Pointer_0015
	add hl, sp
	ld a, [hl]
	xor $80
	ld [hl], a
	reg16swap de, hl
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
	reg16swap de, hl
	pop de
	push af
	xor c
	push af
	call CompareHLtoDE
	jp z, Func_30a1
	jp c, Func_3076
	ld b, d
	ld c, e
	reg16swap de, hl
	ld hl, $9
	jp Func_307b

Func_3076:: ; 3076 (0:3076)
	ld b, h
	ld c, l
	ld hl, Byte_0013
Func_307b:: ; 307b (0:307b)
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

Func_3097:: ; 3097 (0:3097)
	xor a
Func_3098:: ; 3098 (0:3098)
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_3098
	jp Func_30a2

Func_30a1:: ; 30a1 (0:30a1)
	push hl
Func_30a2:: ; 30a2 (0:30a2)
	ld hl, $b
	add hl, sp
	reg16swap de, hl
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

Func_30c2:: ; 30c2 (0:30c2)
	call SubtractArbitrarySize
	pop de
	jp nc, Func_30db
	push hl
	ld b, c
	and a
Func_30cc:: ; 30cc (0:30cc)
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
Func_30db:: ; 30db (0:30db)
	pop af
	call Func_3106
	pop de
	pop bc
	ld hl, $c
	add hl, sp
	ld sp, hl
	reg16swap de, hl
	push bc
	ret

Func_30ec:: ; 30ec (0:30ec)
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

Func_3106:: ; 3106 (0:3106)
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
Func_311a:: ; 311a (0:311a)
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

Func_312b:: ; 312b (0:312b)
	dec b
Func_312c:: ; 312c (0:312c)
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

Func_315e:: ; 315e (0:315e)
	or [hl]
	inc hl
Func_3160:: ; 3160 (0:3160)
	dec b
	jp nz, Func_315e
	or a
	jp z, Func_316a
	ld a, $1
Func_316a:: ; 316a (0:316a)
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
Func_317e:: ; 317e (0:317e)
	call IncrementArbitrarySize
	jp nz, Func_318d
	add hl, bc
	dec hl
	ld [hl], $80
	inc de
	inc hl
	jp Func_3190

Func_318d:: ; 318d (0:318d)
	ld b, $0
	add hl, bc
Func_3190:: ; 3190 (0:3190)
	ld [hl], e
	inc hl
	pop af
	or d
	ld [hl], a
	ret

Func_3196:: ; 3196 (0:3196)
	pop hl
	pop de
Func_3198:: ; 3198 (0:3198)
	pop af
	xor a
Func_319a:: ; 319a (0:319a)
	ld [hl], a
	inc hl
	dec c
	jp nz, Func_319a
	ld [hl], a
	inc hl
	ld [hl], a
	ret

Func_31a4:: ; 31a4 (0:31a4)
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

Data_32b1:: ; 32b1
	dr $32b1, $32d1

INCLUDE "home/math/long.asm"

MemCopy:: ; 35e8 (0:35e8)
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

Func_3891:: ; 3891
	ret

CharacterMapping:: ; 3892 (0:3892)
INCLUDE "data/charmap.asm"

PrintNum:: ; 3992 (0:3992)
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

PrintNumSigned:: ; 3a20 (0:3a20)
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
	reg16swap de, hl
	call PrintNum
	pop bc
	pop bc
	ret

Func_3a36:: ; 3a36 (0:3a36)
	push hl
	push bc
	push bc
	ld hl, $0
	pop de
	push hl
	call GetHLAtSPPlus6
	call FindFirstNonzero
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

SetStringStartState:: ; 3a83 (0:3a83)
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
	write_hl_to $c261
	ret

Func_3aa8:: ; 3aa8 (0:3aa8)
	ld a, $8f ; blank tile
	call Func_3aae
	ret

Func_3aae:: ; 3aae (0:3aae)
	push af
	call ClearSprites
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

Func_3af6:: ; 3af6
	ld a, $8e
	call Func_3aae
	ret

Func_3afc:: ; 3afc (0:3afc)
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

Func_3b0d:: ; 3b0d (0:3b0d)
	ld a, $1
Func_3b0f:: ; 3b0f (0:3b0f)
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
	reg16swap de, hl
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
	reg16swap de, hl
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
Func_3bc0:: ; 3bc0 (0:3bc0)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_3bc5:: ; 3bc5 (0:3bc5)
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
	reg16swap de, hl
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
	reg16swap de, hl
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
	call ToggleBGMapSelect
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_3ca1:: ; 3ca1 (0:3ca1)
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

ToggleBGMapSelect:: ; 3cb8 (0:3cb8)
	push af
	or a
	jp nz, .toggle_bgmap_select
	ld a, [wLCDC]
	and $ff ^ $8
	ld [wLCDC], a
	jp .okay

.toggle_bgmap_select
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
.okay
	ld a, [wNextVBlankFlags]
	or $6 ; push OAM, push LCDC
	ld [wNextVBlankFlags], a
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
.wait_vblank
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp z, .done
	jp .wait_vblank

.done
	pop af
	ld [$c2cd], a
	ret

FindFirstNonzero:: ; 3cf2 (0:3cf2)
	push hl
	ld bc, $0
.loop
	pop hl
	push hl
	add hl, bc
	ld a, [hl]
	or a
	jp z, .done
	inc bc
	jp .loop

.done
	ld l, c
	ld h, b
	pop bc
	ret

IsBetween48And58::
	cp $30
	jp c, .nope
	cp $3a
	jp nc, .nope
	ld a, $1
	ret

.nope
	xor a
	ret

GetJoyPressed::
	ld a, [wJoyPressed]
	ret

GetAndResetJoyHeld::
	ld a, [wJoyHeld]
	ld l, a
	xor a
	ld [wJoyHeld], a
	ld a, l
	ret

SECTION "3f80", ROM0 [$3f80]
AudioEngineFarCall::
	push af
	ld a, $1d
	ld [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	ld bc, .Return
	push bc
	jp hl

.Return
	ld a, $1c
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

SECTION "3fe0", ROM0 [$3fe0]
Func_3fe0:: ; 3fe0
	push af
	ld a, $14
	rst $20
	pop af
	ld bc, .Return
	push bc
	jp hl

.Return
	ld a, $1c
	rst $20
	ret


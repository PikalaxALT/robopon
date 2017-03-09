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
Func_0020:
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
	call Func_00f7
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
	call Func_00f7
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
	ld [$ff81], a
	inc a
	ld [HuC3LatchClock], a
	xor a
	ld [HuC3SRamEnable], a
	ld a, [Bank_000c]
Func_00f7: ; f7 (0:00f7)
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
	ld l, $0
	jr asm_0253

Func_0230: ; 230 (0:0230)
	ld l, $3
	jr asm_0253

Func_0234: ; 234 (0:0234)
	ld l, $6
	jr asm_0253

Func_0238: ; 238 (0:0238)
	cp 60
	ret c
	sub 20
	ld l, $9
	jr asm_0253

Func_0241: ; 241 (0:0241)
	ld l, $c
	jr asm_0253

Func_0245: ; 245 (0:0245)
	ld l, $f
	jr asm_0253

Func_0249: ; 249 (0:0249)
	ld l, $12
	jr asm_0253

Func_024d: ; 24d (0:024d)
	ld l, $15
	jr asm_0253

Func_0251: ; 251 (0:0251)
	ld l, $18
asm_0253
	ld h, $40
	push af
	call Func_025e
	pop hl
	push af
	ld a, h
	jr asm_0267

Func_025e: ; 25e (0:025e)
	push hl
	push af
	ld a, [hROMBank]
	ld hl, sp+$7
	ld [hl], a
	ld a, $1c
asm_0267
	call Func_0020
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
	ld sp, $e000
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
	ld sp, $e000
	rst $08
	db $00
	call Func_1a90
Start:
	dr $323, $388

Func_0388:
	dr $388, $3a4

Func_03a4:
	dr $3a4, $3d1

Func_03d1:
	dr $3d1, $3d3

Func_03d3:
	dr $3d3, $1a90

Func_1a90:
	dr $1a90, $3fee

SECTION "Bank 01", ROMX, BANK [$01]
	dr $4000, $8000

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
	dr $60000, $64000

SECTION "Bank 19", ROMX, BANK [$19]
	dr $64000, $68000

SECTION "Bank 1a", ROMX, BANK [$1a]
	dr $68000, $6c000

SECTION "Bank 1b", ROMX, BANK [$1b]
	dr $6c000, $70000

SECTION "Bank 1c", ROMX, BANK [$1c]
	dr $70000, $74000

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
	dr $fc000, $100000

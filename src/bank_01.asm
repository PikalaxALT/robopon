INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 01", ROMX
Func_4000:: ; 4000
	ld a, $0
	call Func_6169
	ld a, $e4
	ldh [rBGP], a
	ld [wBGP], a
	ldh [rOBP0], a
	ld [wOBP0], a
	ld a, $e0
	ldh [rOBP1], a
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
	callba GameBoot_ValidateRTC
	callba IntroMovie
Func_4060:: ; 4060 (1:4060)
	jp Func_1e4d

Func_4063: ; 4063
	ret

Func_4064:: ; 4064 (1:4064)
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
	ld [wBGMapHi], a
	call Func_40f4
	ld a, $1
	ldh [rIE], a
	ldh a, [rSTAT]
	set 6, a
	ldh [rSTAT], a
	xor a
	ldh [rIF], a
	ei
	ld a, $d
	ld [wRNGState], a
	ld a, $4
	ld [wc24d], a
	xor a
	ld [wRTCTicker], a
	ld a, $80
	ldh [rSC], a
	ret

Func_40bf: ; 40bf
	jp TimerInterrupt

Func_40c2: ; 40c2
	jp Serial_

Func_40c5: ; 40c5
	jp VBlank

Func_40c8: ; 40c8
	jp LCDInterrupt

FillToStackBottomWithWillTestString: ; 40cb (1:40cb)
	ld hl, sp+$0
	ld de, wOAM0aYCoord
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
	dstr "WILL TEST"

Func_40f4: ; 40f4 (1:40f4)
	ld c, low(hPushOAM)
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
	ldh [rDMA], a
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

GFX_4122:: INCBIN "gfx/font/4122.2bpp", $0, $7d0
GFX_48f2:: INCBIN "gfx/font/4122.2bpp", $7d0, $30
GFX_4922:: INCBIN "gfx/font/4122.2bpp", $800, $c0
GFX_49e2:: INCBIN "gfx/font/4122.2bpp", $8c0, $20
GFX_4a02:: INCBIN "gfx/font/4122.2bpp", $8e0, $10
GFX_4a12:: INCBIN "gfx/font/4122.2bpp", $8f0, $80
GFX_4a92:: INCBIN "gfx/font/4122.2bpp", $970, $10
GFX_4aa2:: INCBIN "gfx/font/4122.2bpp", $980, $10
GFX_4ab2:: INCBIN "gfx/font/4122.2bpp", $990, $20
GFX_4ad2: INCBIN "gfx/font/4122.2bpp", $9b0, $50
GFX_4b22:: INCBIN "gfx/font/4122.2bpp", $a00, $1b0
GFX_4cd2:: INCBIN "gfx/font/4122.2bpp", $bb0, $10
GFX_4ce2:: INCBIN "gfx/font/4122.2bpp", $bc0, $50
GFX_4d32:: INCBIN "gfx/font/4122.2bpp", $c10, $70
GFX_4da2:: INCBIN "gfx/font/4122.2bpp", $c80, $60
GFX_4e02:: INCBIN "gfx/font/4122.2bpp", $ce0, $1320

GetBGMapAddresses: ; 6122 (1:6122)
	or a
	jr nz, .asm_6137
	ld a, $98
	ld [wCurBGMapHi], a
	ld a, [wSCX]
	ld [wCurScreenX], a
	ld a, [wSCY]
	ld [wCurScreenY], a
	ret

.asm_6137
	ld a, $9c
	ld [wCurBGMapHi], a
	ld a, [wSCX2]
	ld [wCurScreenX], a
	ld a, [wSCY2]
	ld [wCurScreenY], a
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

Func_6155: ; 6155
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
	ldh [rLCDC], a
	ret

Func_6183:: ; 6183
	push af
	ld a, [wLCDC]
	bit 7, a
	jr nz, .lcd_enabled
	pop af
	jp Func_617d

.lcd_enabled
	pop af
	jp Func_6169

Func_6193:: ; 6193
	ld a, [wBGMapHi]
	ld [wCurBGMapHi], a
	sub $98
	jr nz, .asm_61a3
	xor a
	call GetBGMapAddresses
	jr Func_61a8

.asm_61a3
	ld a, $1
	call GetBGMapAddresses
Func_61a8: ; 61a8
	ld a, c
	or a
	jp z, PutOnVideoTransferQueue
	cp $1
	jp z, .mode_1
	cp $2
	jp z, .mode_2
	ret

.mode_2
	ld a, [wCurScreenY]
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
	ld [wBGMapTransferRowStart], a
	ld a, [wCurBGMapHi]
	add c
	ld [wBGMapTransferRowStart + 1], a
	ld a, [wCurScreenX]
	srl a
	srl a
	srl a
	add d
	and $1f
	ld [wBGMapTransferColumnStart], a
	add b
	cp $21
	jr nc, .exceeds_0x20_mode2
.queue_mode2
	ld a, [wBGMapTransferRowStart]
	ld e, a
	ld a, [wBGMapTransferColumnStart]
	add e
	ld e, a
	ld a, [wBGMapTransferRowStart + 1]
	adc $0
	ld d, a
	jp PutOnVideoTransferQueue

.exceeds_0x20_mode2
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push hl
	call .queue_mode2
	xor a
	ld [wBGMapTransferColumnStart], a
	pop hl
	pop bc
	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld b, c
	jp .queue_mode2

.mode_1
	ld a, [wCurScreenY]
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
	ld [wBGMapTransferRowStart], a
	ld a, [wCurBGMapHi]
	add c
	ld [wBGMapTransferRowStart + 1], a
	ld a, [wCurScreenX]
	srl a
	srl a
	srl a
	add h
	and $1f
	ld [wBGMapTransferColumnStart], a
	add b
	cp $21
	jr nc, .exceeds_0x20_mode1
.queue_mode1
	ld a, [wBGMapTransferRowStart]
	ld l, a
	ld a, [wBGMapTransferColumnStart]
	add l
	ld l, a
	ld a, [wBGMapTransferRowStart + 1]
	adc $0
	ld h, a
	jp PutOnVideoTransferQueue

.exceeds_0x20_mode1
	sub $20
	ld c, a
	ld a, b
	sub c
	ld b, a
	push bc
	push de
	call .queue_mode1
	xor a
	ld [wBGMapTransferColumnStart], a
	pop de
	pop bc
	ld a, e
	add b
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld b, c
	jp .queue_mode1

Func_6294: ; 6294 (1:6294)
	push af
	push bc
.wait
	ld a, [wNextVBlankFlags]
	ld c, a
	ld a, [wLastVBlankFlags]
	cp c
	jr nz, .wait
	pop bc
	pop af
	ret

PushBGMapRegion_:: ; 62a3
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
	call GetBGMapAddresses
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
	cp SCREEN_HEIGHT
	jp c, Func_62e3
	sub SCREEN_HEIGHT
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
	add SCREEN_WIDTH
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop bc
	dec c
	jr nz, Func_62e3
	ret

asm_62fb:
	ld a, c
	call GetBGMapAddresses
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
	reg16swap de, hl
	ld a, l
	cp SCREEN_HEIGHT
	jp c, Func_631e
	sub SCREEN_HEIGHT
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
	add SCREEN_WIDTH
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop bc
	dec c
	jr nz, Func_631e
	ret

Func_6336: ; 6336
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
	ld [wCurBGMapHi], a
	ld a, [wSCX2]
	ld [wCurScreenX], a
	ld a, [wSCY2]
	ld [wCurScreenY], a
	jr .asm_6379

.asm_6368
	ld a, $98
	ld [wCurBGMapHi], a
	ld a, [wSCX]
	ld [wCurScreenX], a
	ld a, [wSCY]
	ld [wCurScreenY], a
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

Func_6392: ; 6392
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

Func_6493: ; 6493
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

FixAndLoadPoncotPicWithTilemap:: ; 65db (1:65db)
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
	reg8rot c, l, e
	reg8rot c, h, d
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

Func_667d:: ; 667d
	ld a, c
	cp $2
	jr z, .asm_66bc
	cp $3
	jr z, .asm_66d9
	call GetBGMapAddresses
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
	db "もやゆよらりるれろわん!?/:*" ; 70-7f
	db "Lp@@@@@@@@@@@G@ " ; 80-8f
	db "R@@@@@HPVE@@@@@@" ; 90-9f
	db "かきくけこさしすせそたちつてとは" ; a0-af
	db "ひふへほはひふへほ@@@@@@@" ; b0-bf
	db "かきくけこさしすせそたちつてとは" ; c0-cf
	db "ひふへほはひふへほうcABM#a" ; d0-df

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

ApplyPoncotNameCharmap:: ; 68b6 (1:68b6)
	; Convert character a and append to (hl)
	; If katakana, enclose in parentheses
	; Append dakuten/handakuten character
	; Register b returns the open delimiter state
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
	ld [hl], CHARVAL("(")
	inc hl
.no_hira
	bit 0, b
	jr z, .no_kata
	bit 0, c
	jr nz, .no_kata
	ld [hl], CHARVAL(")")
	inc hl
.no_kata
	ld [hli], a
	bit 2, c
	jr z, .test_dakuten
	ld a, CHARVAL("ﾟ")
	ld [hli], a
	jr .done_dakuten

.test_dakuten
	bit 1, c
	jr z, .done_dakuten
	ld a, CHARVAL("ﾞ")
	ld [hli], a
.done_dakuten
	ld a, c
	and $1
	ld b, a
	ret

Func_68fd:: ; 68fd
	ld d, c
	ld b, $1
	xor a
	ld [wFarCallSavedA], a
	ldh [rSCX], a
	ldh a, [rLY]
	ld c, a
.wait_next_line
	ldh a, [rLY]
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
	ldh [rSCX], a
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
	ldh [rSCX], a
	ret

Func_6938:: ; 6938
	ld d, c
	ld b, $5
.asm_693b
	ld c, $0
.asm_693d
	ldh a, [rLY]
	cp e
	jr c, .asm_693b
	bit 0, c
	jr nz, .asm_6957
	ld c, $1
	ld a, b
	ldh [rSCX], a
	xor $fe
	ld b, a
	dec hl
	ld a, l
	or h
	jr nz, .asm_693d
	xor a
	ldh [rSCX], a
	ret

.asm_6957
	cp d
	jr c, .asm_693d
	xor a
	ldh [rSCX], a
	jr .asm_693d

BlinkTextCursor::
	ld a, [wTextBlinkerFrameCounter]
	and $7f
	cp $1e
	jp nc, .toggle
	ret

.toggle
	ldh a, [rSCX]
	srl a
	srl a
	srl a
	ld e, a
	ld a, [wBlinkerX]
	add e
	and $1f
	ld e, a
	ldh a, [rSCY]
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
	ld a, [wOverworldTilemapSelector]
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
	ld a, low(wBlinkerTile)
	ld [hli], a
	ld a, high(wBlinkerTile)
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

DoShakeProgram::
	ld a, [wCurRobotPointer]
	ld l, a
	ld a, [wCurRobotPointer + 1]
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
	ldh [rSCX], a
	ld [hli], a
	ld a, [hl]
	cpl
	inc a
	ldh [rSCY], a
	ld [hl], a
	dec hl
	dec hl
	dec hl
	ld [hl], $0
.done
	ret

DoFlashProgram::
	ld a, [wCurRobotPointer]
	ld l, a
	ld a, [wCurRobotPointer + 1]
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
	ldh [rBGP], a
	ld a, [hl]
	ldh [rOBP0], a
.done
	ret

DoFadeProgram:
	ld a, [wCurRobotPointer]
	ld l, a
	ld a, [wCurRobotPointer + 1]
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
	ldh [rBGP], a
.no_bgp
	bit 2, e
	jr z, .done
	ldh [rOBP0], a
.done
	ret

Data_6a55: ; 6a55
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

Data_6a66: ; 6a66
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

Func_6a77:: ; 6a77
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
	ld [wHBlankLYCPrimary], a
	ld a, [wLCDC]
	res 2, a
	call Func_6183
	ld hl, wOAMBuffer
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
	ld hl, wOAM00YCoord
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
	ld hl, wOAMBuffer
	ld e, $0
	ld bc, $a0
	call FillMemory
	ld a, [wNextVBlankFlags]
	set 1, a
	ld [wNextVBlankFlags], a
	call Func_6294
	ld a, $28
	ld [wHBlankLYCPrimary], a
	ld a, [wLCDC]
	set 2, a
	jp Func_6183

CalcChecksum: ; 6b11
	xor a
	ld c, a
	ld b, a
.loop
	ld a, [hl]
	add c
	ld c, a
	ld a, [hli]
	xor b
	ld b, a
	dec de
	ld a, e
	or d
	jr nz, .loop
	ld l, c
	ld h, b
	ret

Func_6b22:: ; 6b22 (1:6b22)
	ldh [rJOYP], a
	push af
	pop af
	ld a, $30
	ldh [rJOYP], a
	push af
	pop af
	push af
	pop af
	ret

Func_6b2f: ; 6b2f
	ld a, $20
	jr Func_6b22

Func_6b33: ; 6b33
	ld a, $10
	jr Func_6b22

Func_6b37:: ; 6b37 (1:6b37)
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

Func_6b4b:: ; 6b4b (1:6b4b)
	ld bc, 10500
.asm_6b4e
	dec bc
	ld a, c
	or b
	jr nz, .asm_6b4e
	ret

Func_6b54: ; 6b54
	ret

GetRobotInParty:: ; 6b55 (1:6b55)
	push de
	pop hl
	push hl
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	ret

StackGetRobotInParty:: ; 6b74 (1:6b74)
	push de
	ld l, a
	ld h, 0
	get_party_bot
	push hl
	call GetHLAtSPPlus4
	pop de
	ld bc, $23
	call MemCopy
	pop bc
	ret

Func_6b94:: ; 6b94
	push hl
	add sp, -$24
	ld l, e
	push hl
	ld a, d
	push af
	ld a, l
	ld hl, sp+$4
	reg16swap de, hl
	call GetRobotInParty
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

MACRO macro_6b94
	read_hl_from_sp_plus $28
	push hl
	read_hl_from_sp_plus \1 + 2
	pop de
	add hl, de
	write_hl_to_sp_plus \1
	read_hl_from_sp_plus \1
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, .check_negative_\@
	ld hl, 999
	write_hl_to_sp_plus \1
	jp .done_\@

.check_negative_\@
	read_hl_from_sp_plus \1
	inc h
	dec h
	bit 7, h
	jr z, .done_\@
	ld hl, $0
	write_hl_to_sp_plus \1
.done_\@
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
	read_hl_from_sp_plus $28
	ld e, l
	ld hl, sp+$18
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
	reg16swap de, hl
	call StackGetRobotInParty
	add sp, $26
	ret

Func_6e1b:: ; 6e1b
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
	reg16swap de, hl
	call GetRobotInParty
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
	read_hl_from_sp_plus $e
	jp Func_6eb4

Func_6e6f: ; 6e6f (1:6e6f)
	read_hl_from_sp_plus $12
	jp Func_6eb4

Func_6e76: ; 6e76 (1:6e76)
	read_hl_from_sp_plus $16
	jp Func_6eb4

Func_6e7d: ; 6e7d (1:6e7d)
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	jp Func_6eb4

Func_6e85: ; 6e85 (1:6e85)
	read_hl_from_sp_plus $10
	jp Func_6eb4

Func_6e8c: ; 6e8c (1:6e8c)
	read_hl_from_sp_plus $14
	jp Func_6eb4

Func_6e93: ; 6e93 (1:6e93)
	read_hl_from_sp_plus $19
	jp Func_6eb4

Func_6e9a: ; 6e9a (1:6e9a)
	read_hl_from_sp_plus $1b
	jp Func_6eb4

Func_6ea1: ; 6ea1 (1:6ea1)
	read_hl_from_sp_plus $1d
	jp Func_6eb4

Func_6ea8: ; 6ea8 (1:6ea8)
	read_hl_from_sp_plus $1f
	jp Func_6eb4

Func_6eaf: ; 6eaf (1:6eaf)
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
Func_6eb4: ; 6eb4 (1:6eb4)
	reg16swap de, hl
	add sp, $24
	reg16swap de, hl
	ret

Func_6ebf:: ; 6ebf
	push hl
	add sp, -$24
	ld l, e
	push hl
	ld a, d
	push af
	ld a, l
	ld hl, sp+$4
	reg16swap de, hl
	call GetRobotInParty
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
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $10
	jp Func_6f6d

Func_6f0d: ; 6f0d (1:6f0d)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $14
	jp Func_6f6d

Func_6f18: ; 6f18 (1:6f18)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $18
	jp Func_6f6d

Func_6f23: ; 6f23 (1:6f23)
	read_hl_from_sp_plus $28
	ld e, l
	ld hl, sp+$18
	ld [hl], e
	jp Func_6f6d

Func_6f2e: ; 6f2e (1:6f2e)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $12
	jp Func_6f6d

Func_6f39: ; 6f39 (1:6f39)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $16
	jp Func_6f6d

Func_6f44: ; 6f44 (1:6f44)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $1b
	jp Func_6f6d

Func_6f4f: ; 6f4f (1:6f4f)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $1d
	jp Func_6f6d

Func_6f5a: ; 6f5a (1:6f5a)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $1f
	jp Func_6f6d

Func_6f65: ; 6f65 (1:6f65)
	read_hl_from_sp_plus $28
	write_hl_to_sp_plus $21
Func_6f6d: ; 6f6d (1:6f6d)
	pop hl
	ld a, l
	ld hl, sp+$0
	reg16swap de, hl
	call StackGetRobotInParty
	add sp, $26
	ret

Func_6f7b: ; 6f7b (1:6f7b)
	push hl
	push de
	ldh a, [rIE]
	push af
	call EnableVBlank
	call EnableTimerInt
	pop af
	pop de
	push af
	ld a, e
	or d
	jp z, Func_6f95
	reg16swap de, hl
	call Func_2887
Func_6f95: ; 6f95 (1:6f95)
	pop af
	pop hl
	push af
	ld e, $5
	call Func_2a3e
	reg16swap de, hl
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
	reg16swap de, hl
	ld hl, Data_6fc1
	jp Func_6f7b

Data_6fc1: ; 6fc1
	dstr "(つうしん まち)"

Func_6fcb: ; 6fcb (1:6fcb)
	reg16swap de, hl
	ld hl, Data_6fd5
	jp Func_6f7b

Data_6fd5: ; 6fd5
	dstr "(つうしん )エラー"

Func_6fe0:: ; 6fe0
	push bc
	ld e, $0
	push de
	ld hl, sp+$2
	ld [hl], $0
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	xor a
	ld [wc39e], a
	ld a, $3
	call GetSRAMBank
	call DisableJoypadInt
	ld hl, Func_1069
	write_hl_to wSerial + 1
	xor a
	ld [wc31e], a
	xor a
.asm_7005
	ld [wc31b], a
	ld [wc31d], a
	ldh [rSC], a
	xor a
	ld [wc319], a
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
	ld [wc31a], a
	ld a, $dd
	ld [wc31b], a
	ld a, $80
	ld [wc31d], a
	ld a, [wTextBlinkerFrameCounter]
	ld l, a
Func_7051: ; 7051 (1:7051)
	ld a, [wTextBlinkerFrameCounter]
	xor l
	and $2
	jp nz, Func_7061
	ld a, [wc31a]
	or a
	jp z, Func_7051
Func_7061: ; 7061 (1:7061)
	ld a, [wc31a]
	or a
	jp nz, Func_7090
	push de
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	cp $46
	jp nc, Func_708c
	ld a, $fe
	ld [wc31b], a
	ld a, $1
	ld [wc31d], a
	ld hl, sp+$6
	ld [hl], $1
Func_708c: ; 708c (1:708c)
	pop de
	jp Func_70b9

Func_7090: ; 7090 (1:7090)
	xor a
	ld [wc31a], a
	ld a, [wTextBlinkerFrameCounter]
	ld l, a
Func_7098: ; 7098 (1:7098)
	ld a, [wTextBlinkerFrameCounter]
	xor l
	and $2
	jp nz, Func_70a8
	ld a, [wc31a]
	or a
	jp z, Func_7098
Func_70a8: ; 70a8 (1:70a8)
	ld a, [wc31c]
	cp $fe
	jp nz, Func_70b9
	ld a, [wc31a]
	or a
	jp z, Func_70b9
	ld e, $80
Func_70b9: ; 70b9 (1:70b9)
	jp Func_711b

Func_70bc: ; 70bc (1:70bc)
	push de
	xor a
	ld [wc31a], a
	ld a, $fe
	ld [wc31b], a
	ld a, $1
	ld [wc31d], a
	ld a, $81
	ldh [rSC], a
	ld l, $0
Func_70d1: ; 70d1 (1:70d1)
	ld a, l
	cp $3
	jp nc, Func_70fa
Func_70d7: ; 70d7 (1:70d7)
	ld a, [wc31a]
	or a
	jp z, Func_70d7
	push hl
	xor a
	ld [wc31a], a
	call NextOverworldFrame
	ld a, $81
	ldh [rSC], a
	pop hl
	ld a, [wc31c]
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
	ld a, [wc31c]
	cp $dd
	jp nz, Func_710e
	ld e, $81
	jp Func_711b

Func_710e: ; 710e (1:710e)
	ld a, $dd
	ld [wc31b], a
	xor a
	ld [wc31d], a
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
	ld [wc31a], a
	xor a
	ld [wc31b], a
	ld a, $1
	ld [wc31d], a
	ld a, $81
	ldh [rSC], a
Func_7137: ; 7137 (1:7137)
	ld a, [wc31a]
	or a
	jp z, Func_7137
	ld a, $81
	ldh [rSC], a
	xor a
	ld [wc31a], a
Func_7146: ; 7146 (1:7146)
	ld a, [wc31a]
	or a
	jp z, Func_7146
	ld a, $1
	ld [wc39e], a
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
	ld a, [wc31a]
	or a
	jp z, Func_7172
	push hl
	xor a
	ld [wc31a], a
	call NextOverworldFrame
	ld a, $81
	ldh [rSC], a
	pop hl
	inc l
	jp Func_716c

Func_718a: ; 718a (1:718a)
	pop bc
	pop de
	pop hl
	ld a, [wc31c]
	cp $dd
	jp z, Func_7198
	jp Func_701d

Func_7198: ; 7198 (1:7198)
	push hl
	ld a, $81
	ld [wc319], a
	ld l, c
	ld h, b
	call Func_2887
	pop hl
	jp Func_71e4

Func_71a7: ; 71a7 (1:71a7)
	push hl
	push de
	xor a
	ld [wc31a], a
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
	ld a, [wc31c]
	cp $fe
	jp nz, Func_71d5
	ld a, [wc31a]
	or a
	jp nz, Func_71d8
Func_71d5: ; 71d5 (1:71d5)
	jp Func_701d

Func_71d8: ; 71d8 (1:71d8)
	push hl
	ld a, $80
	ld [wc319], a
	ld l, c
	ld h, b
	call Func_2887
	pop hl
Func_71e4: ; 71e4 (1:71e4)
	ld a, l
	call GetSRAMBank
	ld a, $1
	ld [wc39e], a
	xor a
Func_71ee: ; 71ee (1:71ee)
	pop bc
	ret

Data_71f0: ; 71f0
	dstr "(せつそﾞくちゅう)"

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
	ld [wc31a], a
Func_7221: ; 7221 (1:7221)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_7230
	ld a, [wc31a]
	or a
	jp z, Func_7221
Func_7230: ; 7230 (1:7230)
	ld a, [wc31a]
	ret

Func_7234: ; 7234 (1:7234)
	call Func_6fcb
	push hl
	call DisableJoypadInt
	xor a
	ld [wc31e], a
	ld a, $81
	ldh [rSC], a
Func_7243: ; 7243 (1:7243)
	ldh a, [rSC]
	and $80
	jp nz, Func_7243
	ld a, $81
	ldh [rSC], a
Func_724e: ; 724e (1:724e)
	ldh a, [rSC]
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
	ldh [rSC], a
Func_726a: ; 726a (1:726a)
	ldh a, [rSC]
	and $80
	jp nz, Func_726a
	ld a, $81
	ldh [rSC], a
Func_7275: ; 7275 (1:7275)
	ldh a, [rSC]
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
	ldh a, [rIE]
	push af
	ld hl, sp+$6
	ld a, [hl]
	and $1
	jp z, Func_72ab
	ldh a, [rIE]
	and $c
	ldh [rIE], a
Func_72ab: ; 72ab (1:72ab)
	ei
Func_72ac: ; 72ac (1:72ac)
	ld de, $0
	push de
	xor a
	ld [wc31e], a
	xor a
	ld [wc31f], a
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
	read_hl_from_sp_plus $e
	write_hl_to wc320
	read_hl_from_sp_plus $c
	write_hl_to wc322
	xor a
	ld [wc31f], a
	xor a
	ld [wc31a], a
	ld a, $1
	ld [wc31e], a
	xor a
	ld [wTimerCounter], a
	pop de
Func_72f4: ; 72f4 (1:72f4)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_731e
	ld a, [wc31f]
	or a
	jp nz, Func_731e
	ld a, [wc31a]
	or a
	jp z, Func_731b
	xor a
	ld [wc31a], a
	ld a, [wc31e]
	cp $2
	jp c, Func_731b
	inc de
	xor a
	ld [wTimerCounter], a
Func_731b: ; 731b (1:731b)
	jp Func_72f4

Func_731e: ; 731e (1:731e)
	ld a, [wc31f]
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
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CalcChecksum
	reg16swap de, hl
	read_hl_from wc324
	call CompareHLtoDE
	jp z, Func_7376
	ld a, $d0
	ld [wc31b], a
	call Func_721a
	ld a, $dd
	ld [wc31b], a
	call GetHLAtSPPlus6
	call Func_7234
	call WriteHLToSPPlus6
	ld hl, sp+$3
	ld [hl], $1
	jp Func_72ac

Func_7376: ; 7376
	ld a, $c0
	ld [wc31b], a
	call Func_721a
	or a
	jp z, Func_7386
	ld hl, sp+$2
	ld [hl], $1
Func_7386: ; 7386 (1:7386)
	ld a, $dd
	ld [wc31b], a
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_7395
	jp Func_72ac

Func_7395: ; 7395 (1:7395)
	di
	pop af
	ldh [rIE], a
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
	ldh a, [rIE]
	pop hl
	pop bc
	push af
	push hl
	push bc
	ld a, c
	and $1
	jp z, Func_73d5
	ldh a, [rIE]
	and $c
	ldh [rIE], a
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
	ld [wc31e], a
	xor a
	ld [wc31f], a
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
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	call CalcChecksum
	write_hl_to wc324
	read_hl_from_sp_plus $e
	write_hl_to wc320
	read_hl_from_sp_plus $c
	write_hl_to wc322
	xor a
	ld [wc31f], a
	ld a, $5
	ld [wc31e], a
	xor a
	ld [wc31a], a
	xor a
	ld [wTimerCounter], a
	pop de
Func_742f: ; 742f (1:742f)
	ld a, [wTimerCounter]
	cp $b4
	jp nc, Func_7459
	ld a, [wc31f]
	or a
	jp nz, Func_7459
	ld a, [wc31a]
	or a
	jp z, Func_7456
	xor a
	ld [wc31a], a
	ld a, [wc31e]
	cp $6
	jp c, Func_7456
	inc de
	xor a
	ld [wTimerCounter], a
Func_7456: ; 7456 (1:7456)
	jp Func_742f

Func_7459: ; 7459 (1:7459)
	pop bc
	ld a, [wc31f]
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
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CalcChecksum
	xor a
	ld [wTimerCounter], a
Func_748d: ; 748d (1:748d)
	ld a, [wTimerCounter]
	cp $5
	jp nc, Func_74a7
	ld a, [wc31c]
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
	ldh [rIE], a
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
	ldh [rSB], a
	xor a
	ld [wc31a], a
	ld a, $81
	ldh [rSC], a
Func_74e6: ; 74e6 (1:74e6)
	ld a, [wc31a]
	or a
	jp z, Func_74e6
	pop af
	and $1
	jp nz, Func_74fc
	call NextOverworldFrame
	call NextOverworldFrame
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
	ldh a, [rIE]
	ld l, a
	push hl
	ld hl, sp+$6
	ld a, [hl]
	and $1
	jp z, Func_7526
	ldh a, [rIE]
	and $c
	ldh [rIE], a
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
	ld a, [wc31c]
	cp $b2
	jp nz, Func_755b
	jp Func_755f

Func_755b: ; 755b (1:755b)
	dec l
	jp Func_7541

Func_755f: ; 755f (1:755f)
	ld a, [wc31c]
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
	ld a, [wc31c]
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
	ld a, [wc31c]
	ld [wc324], a
	ld e, $0
	ld hl, sp+$4
	ld a, [hl]
	call Func_74da
	ld a, [wc31c]
	ld [wc324 + 1], a
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	pop de
	call CalcChecksum
	reg16swap de, hl
	read_hl_from wc324
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

Func_75e8: ; 75e8
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
	ldh [rIE], a
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
	call NextOverworldFrame
	call NextOverworldFrame
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
	ldh a, [rIE]
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
	ldh a, [rIE]
	and $c
	ldh [rIE], a
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
	reg16swap de, hl
	call Func_6fb7
	reg16swap de, hl
Func_7658: ; 7658 (1:7658)
	push de
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	call CalcChecksum
	write_hl_to wc324
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
	ld a, [wc31c]
	cp $b0
	jp nz, Func_768a
	jp Func_768e

Func_768a: ; 768a (1:768a)
	dec l
	jp Func_7670

Func_768e: ; 768e (1:768e)
	pop de
	ld a, [wc31c]
	cp $b0
	jp z, Func_769c
	ld a, $1
	jp Func_7642

Func_769c: ; 769c (1:769c)
	push de
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
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
	ld a, [wc324]
	ld e, a
	ld a, c
	call Func_74da
	pop bc
	push bc
	ld a, [wc324 + 1]
	ld e, a
	ld a, c
	call Func_74da
	read_hl_from_sp_plus $e
	push hl
	read_hl_from_sp_plus $e
	pop de
	call CalcChecksum
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
	ld a, [wc31c]
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
	reg16swap de, hl
	call Func_725f
	reg16swap de, hl
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
	ldh [rIE], a
	ei
	pop de
	ld a, e
	or d
	jp z, Func_773c
	reg16swap de, hl
	call Func_2887
Func_773c: ; 773c (1:773c)
	call NextOverworldFrame
	call NextOverworldFrame
	xor a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_7748:: ; 7748
	xor a
	ld [wc39e], a
	ld a, [wc319]
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
	ld [wc39e], a
	ld a, l
	ret

Func_7766:: ; 7766
	xor a
	ld [wc39e], a
	ld a, [wc319]
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
	ld [wc39e], a
	ld a, l
	ret

Data_7784: ; 7784
	dstr "ROBOPON IR TAKANORI"

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
	ld a, [wc326]
	cp $80
	jp nz, Func_782a
	ld de, Data_7784
	ld hl, wc327
	call CopyUntilNull
	call Func_1c78
	or a
	jp z, Func_77ec
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_77ec: ; 77ec (1:77ec)
	ld c, $15
	ld de, wc327
	ld hl, wc327
	call Func_1c5a
	or a
	jp z, Func_7803
	ld hl, sp+$0
	ld a, [hl]
	or $1
	ld hl, sp+$0
	ld [hl], a
Func_7803: ; 7803 (1:7803)
	ld de, wc327
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
	ld de, wc327
	ld hl, wc327
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
	ld de, wc327
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
	ld hl, wc327
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

Func_7882:: ; 7882
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
	reg16swap de, hl
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
	ld de, wc327
	ld hl, wc327
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
	ld de, wc327
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

Func_790f:: ; 790f
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
	reg16swap de, hl
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
	reg16swap de, hl
	ld hl, wc327
	call CopyFromDEtoHL
	call Func_1c78
	or a
	jp z, Func_7966
	ld a, $1
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

INCLUDE "engine/validate_save.asm"

Func_7b0d:: ; 7b0d
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
	reg16swap de, hl
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
	read_hl_from_sp_plus $c
	pop de
	pop bc
	call Func_667d
	ld a, $2
	ld [wEnableAttrMapTransfer], a
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
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
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
	read_hl_from_sp_plus $c
	pop de
	pop bc
	call Func_667d
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_7c85: ; 7c85 (1:7c85)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_7c8a:: ; 7c8a
	push hl
	push de
	read_hl_from wCurRobotPointer
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
	check_cgb
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

Func_7cd1:: ; 7cd1
	ldh a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld de, sWarehouse
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
	reg16swap de, hl
	pop hl
	jp Func_7cdf

Func_7cf9: ; 7cf9 (1:7cf9)
	pop af
	push hl
	call GetSRAMBank
	pop hl
	ld a, l
	ret

Func_7d01:: ; 7d01
	ldh a, [hSRAMBank]
	push af
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld de, sWarehouse
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
	reg16swap de, hl
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

Func_7d39:: ; 7d39
	push af
	ldh a, [hSRAMBank]
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
	ld de, sWarehouse
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
	ld de, sWarehouse + 28
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
	ld de, sWarehouse
	add hl, de
	pop de
	pop bc
	call CopyFromDEtoHL
Func_7da6: ; 7da6 (1:7da6)
	xor a
	ld [sWarehouseEnd - 28], a
	pop af
	call GetSRAMBank
	pop bc
	ret

Func_7db0:: ; 7db0 (1:7db0)
	push de
	add sp, -$40
	push af
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $48
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
	ld de, sWarehouse
	add hl, de
	push hl
	ld hl, sp+$42
	reg16swap de, hl
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

Func_7dfc:: ; 7dfc (1:7dfc)
	add sp, -$24
	push de
	push af
	ldh a, [hSRAMBank]
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
	ld de, sWarehouse
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop bc
	ld hl, sp+$4
	reg16swap de, hl
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

Func_7e56:: ; 7e56
	add sp, -$24
	push af
	ld a, e
	ld hl, sp+$2
	reg16swap de, hl
	call GetRobotInParty
	pop af
	ld hl, sp+$0
	reg16swap de, hl
	call Func_7db0
	add sp, $24
	ret

Func_7e70:: ; 7e70
	add sp, -$24
	push de
	ld hl, sp+$2
	reg16swap de, hl
	call Func_7dfc
	pop de
	ld a, e
	ld hl, sp+$0
	reg16swap de, hl
	call StackGetRobotInParty
	add sp, $24
	ret

Func_7e8a:: ; 7e8a
	push de
	add sp, -$40
	push af
	ldh a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	ld de, 849
	call MultiplyHLbyDE
	ld de, s2_b29f
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
	read_hl_from_sp_plus $4a
	pop de
	call CopyFromDEtoHL
	pop hl
	pop bc
	push hl
	ld hl, $40
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $46
	ld de, $40
	add hl, de
	write_hl_to_sp_plus $46
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
	read_hl_from_sp_plus $44
	pop de
	call CopyFromDEtoHL
	add sp, $42
	ret

Func_7f14:: ; 7f14
	add sp, -$40
	push de
	push af
	ldh a, [hSRAMBank]
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	ld de, 849
	call MultiplyHLbyDE
	ld de, s2_b29f
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
	reg16swap de, hl
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
	reg16swap de, hl
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
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $11
	call CopyFromDEtoHL
	pop hl
	ld a, l
	call GetSRAMBank
	add sp, $40
	ret


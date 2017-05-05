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
	reg16swap de, hl
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
	reg16swap de, hl
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	; main execution loop
Func_e051: ; e051
	set_farcall_addrs_hli Func_667d
	ld hl, wc2cd
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
	ld hl, wc2cd
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
	ld hl, wc2cd
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
	ld hl, wc2cd
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
	ld hl, wc2cd
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
	call ClearSprites
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
	call FillVisibleAreaWithBlankTile
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
	ld a, BANK(GFX_4a02)
	ld [wFarCallDestBank], a
	ld bc, $d0
	ld de, GFX_4a02
	ld hl, $88e0
	call FarRequestVideoData
	call WaitVideoTransfer
	add sp, $14
	ret

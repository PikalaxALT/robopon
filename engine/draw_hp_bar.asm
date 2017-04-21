GFX_63bef: INCBIN "gfx/misc/63bef.2bpp" ; 63bef
DrawHPBar: ; 63c5f (18:7c5f)
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
	ld a, [wc2cd]
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

DrawHPBarAndWait: ; 63cd8
	call DrawHPBar
	call WaitVideoTransfer
	ret

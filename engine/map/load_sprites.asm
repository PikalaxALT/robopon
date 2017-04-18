Data_a2e7: ; a2e7
	db $18, $0c, $00, $0c

Func_a2eb:: ; a2eb
	push hl
	push bc
	push bc
	push bc
	ld a, [wc772]
	cp $14
	jp c, Func_a2fd
	ld hl, -1
	jp Func_a43f

Func_a2fd: ; a2fd (2:62fd)
	call GetHLAtSPPlus8
	push hl
	ld hl, wc772
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
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	pop de
	ld bc, $e
	call CopyFromDEtoHL
	ld hl, wc772
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, wc772
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
	reg16swap de, hl
	read_hl_from wObjectStructPointer
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
	ld a, [wc773]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call LoadSpriteGFX
	pop bc
	ld a, [wc773]
	ld [bc], a
	pop hl
	ld a, [wc773]
	add l
	ld [wc773], a
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
	ld a, [wMapWidth]
	ld [hl], a
Func_a3d5: ; a3d5 (2:63d5)
	pop hl
	ld a, l
	cp $64
	jp nz, Func_a3e0
	ld a, [wMapHeight]
	ld l, a
Func_a3e0: ; a3e0 (2:63e0)
	push hl
	ld e, c
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
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
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	pop hl
	jp Func_a407

Func_a438: ; a438 (2:6438)
	ld a, [wc772]
	inc a
	ld [wc772], a
Func_a43f: ; a43f (2:643f)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

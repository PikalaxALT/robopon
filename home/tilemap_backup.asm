BackUpRectangleAt:: ; 20da (0:20da)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
.loop
	cp l
	jp nc, .quit
	push hl
	push af
	xor a
.inner
	ld hl, sp+$4
	cp [hl]
	jp nc, .next
	push af
	read_hl_from_sp_plus $c
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $c
	ld [bc], a
	inc bc
	pop af
	inc a
	jp .inner

.next
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
	write_hl_to_sp_plus $c
	pop af
	inc a
	pop bc
	pop hl
	jp .loop

.quit
	pop bc
	ret

BackUpTileMapRectangle:: ; 2124
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
	call BackUpRectangleAt
	pop bc
	pop bc
	pop bc
	ret

BackUpAttrMapRectangle:: ; 2152
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
	call BackUpRectangleAt
	pop bc
	pop bc
	pop bc
	ret

RestoreUpRectangleTo:: ; 2180 (0:2180)
	push bc
	ld a, h
	ld a, l
	ld hl, sp+$0
	ld [hl], d
	ld l, e
	xor a
.loop
	cp l
	jp nc, .quit
	push hl
	push af
	xor a
.inner
	ld hl, sp+$4
	cp [hl]
	jp nc, .next
	push af
	ld a, [bc]
	inc bc
	read_hl_from_sp_plus $c
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $c
	pop af
	inc a
	jp .inner

.next
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
	write_hl_to_sp_plus $c
	pop af
	inc a
	pop bc
	pop hl
	jp .loop

.quit
	pop bc
	ret

RestoreTileMapRectangle:: ; 21ca
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
	call RestoreUpRectangleTo
	pop bc
	pop bc
	pop bc
	ret

RestoreAttrMapRectangle:: ; 21f8
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
	call RestoreUpRectangleTo
	pop bc
	pop bc
	pop bc
	ret

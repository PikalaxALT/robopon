Func_9a49:: ; 9a49 (2:5a49)
	push bc
	push af
	push de
	ld [wFunc94a9_c891], a
	set_farcall_addrs_hli Func_da835
	ld a, $4
	call FarCall
	ld a, $4
	ld [wFunc94a9_c888], a
	xor a
	ld [wFunc94a9_c889], a
	ld hl, wObjectStructPointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [wFunc94a9_c88a], a
	ld a, d
	ld [wFunc94a9_c88a + 1], a
	ld hl, wc776
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [wFunc94a9_c88c], a
	ld a, d
	ld [wFunc94a9_c88c + 1], a
.loop: ; 9a86 (2:5a86)
	ld a, [wNumPeopleLoaded]
	ld b, a
	ld a, [wFunc94a9_c889]
	cp b
	jp nc, .done
	ld a, [wFunc94a9_c88a]
	ld l, a
	ld a, [wFunc94a9_c88a + 1]
	ld h, a
	ld a, [hl]
	cp $ff
	jp z, .next
	ld a, [wFunc94a9_c88c]
	ld l, a
	ld a, [wFunc94a9_c88c + 1]
	ld h, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, .next
	ld a, [wFunc94a9_c88a]
	ld l, a
	ld a, [wFunc94a9_c88a + 1]
	ld h, a
	inc hl
	inc hl
	ld a, [hl]
	add $7
	ld b, a
	ld a, [wPlayerMapX]
	cp b
	jp nc, .next
	ld a, [hl]
	add $5
	ld b, a
	ld a, [wPlayerMapX]
	add $a
	cp b
	jp c, .next
	inc hl
	ld a, [hl]
	add $6
	ld b, a
	ld a, [wPlayerMapY]
	cp b
	jp nc, .next
	ld a, [hl]
	add $4
	ld b, a
	ld a, [wPlayerMapY]
	add $a
	cp b
	jp c, .next
	dec hl
	dec hl
	ld a, [hl]
	cp $4
	jr z, .asm_9b1d
	push hl
	ld a, [wFunc94a9_c88c]
	ld l, a
	ld a, [wFunc94a9_c88c + 1]
	ld h, a
	inc hl
	ld a, [hl]
	srl a
	srl a
	srl a
	ld [wFunc94a9_c88e], a
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
	ld [wFunc94a9_c88e], a
	jr .asm_9b21

.asm_9b1d
	xor a
	ld [wFunc94a9_c88e], a
.asm_9b21
	inc hl
	ld a, [hl]
	ld b, a
	ld a, [wMapX]
	sub b
	add a
	add a
	add a
	add a
	ld b, a
	ld a, $8
	sub b
	ld [wFunc94a9_c88f], a
	inc hl
	ld a, [hl]
	ld b, a
	ld a, [wMapY]
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
	ld [wFunc94a9_c890], a
	push hl
	ld a, [wFunc94a9_c88c]
	ld l, a
	ld a, [wFunc94a9_c88c + 1]
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
	ld a, [wFunc94a9_c890]
	sub b
	ld [wFunc94a9_c890], a
	jr .asm_9b99

.asm_9b7e
	ld a, [wFunc94a9_c88f]
	add b
	ld [wFunc94a9_c88f], a
	jr .asm_9b99

.asm_9b87
	ld a, [wFunc94a9_c890]
	add b
	ld [wFunc94a9_c890], a
	jr .asm_9b99

.asm_9b90
	ld a, [wFunc94a9_c88f]
	sub b
	ld [wFunc94a9_c88f], a
	jr .asm_9b99

.asm_9b99
	ld a, [wc83a]
	ld b, a
	ld a, [wFunc94a9_c891]
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
	ld a, [wFunc94a9_c890]
	add b
	ld [wFunc94a9_c890], a
	jr .asm_9bd2

.asm_9bb7
	ld a, [wFunc94a9_c88f]
	sub b
	ld [wFunc94a9_c88f], a
	jr .asm_9bd2

.asm_9bc0
	ld a, [wFunc94a9_c890]
	sub b
	ld [wFunc94a9_c890], a
	jr .asm_9bd2

.asm_9bc9
	ld a, [wFunc94a9_c88f]
	add b
	ld [wFunc94a9_c88f], a
	jr .asm_9bd2

.asm_9bd2
	push hl
	set_farcall_addrs_hli Func_da839
	pop hl
	ld a, [hl]
	ld b, a
	ld a, [wFunc94a9_c88e]
	ld c, a
	ld a, [wFunc94a9_c88f]
	ld d, a
	ld a, [wFunc94a9_c890]
	ld e, a
	push hl
	ld a, [wFunc94a9_c88c]
	ld l, a
	ld a, [wFunc94a9_c88c + 1]
	ld h, a
	ld a, [hl]
	pop hl
	call FarCall
	ld a, [wFunc94a9_c888]
	ld b, $4
	add b
	ld [wFunc94a9_c888], a
.next: ; 9c04 (2:5c04)
	ld a, [wFunc94a9_c889]
	inc a
	ld [wFunc94a9_c889], a
	ld a, [wFunc94a9_c88a]
	ld l, a
	ld a, [wFunc94a9_c88a + 1]
	ld h, a
	ld bc, $e
	add hl, bc
	ld a, l
	ld [wFunc94a9_c88a], a
	ld a, h
	ld [wFunc94a9_c88a + 1], a
	ld a, [wFunc94a9_c88c]
	ld l, a
	ld a, [wFunc94a9_c88c + 1]
	ld h, a
	ld bc, $4
	add hl, bc
	ld a, l
	ld [wFunc94a9_c88c], a
	ld a, h
	ld [wFunc94a9_c88c + 1], a
	jp .loop

.done: ; 9c36 (2:5c36)
	ld a, [wc84e]
	cp $1
	jp nz, .skip_multiply
	ld a, [wc850]
	inc a
	ld [wc850], a
	dec a
	cp $5
	jp c, .skip_multiply
	ld a, [wSCY]
	ld hl, wc84f
	add [hl]
	ld [wSCY], a
	ld a, [wSCY2]
	ld hl, wc84f
	add [hl]
	ld [wSCY2], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	ld a, [wc84f]
	ld b, $ff
	call MultiplyAbyB
	ld [wc84f], a
	xor a
	ld [wc850], a
.skip_multiply: ; 9c78 (2:5c78)
	call Func_a1fa
	pop de
	pop af
	call Func_9d80
	ld hl, sp+$0
	ld [hl], $40
	read_hl_from wFunc94a9_c888
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$0
	call FarCall
	ld e, $0
	read_hl_from wc82e
	ld a, l
	or h
	jp nz, .asm_9cbc
	push de
	callba_hli Func_da4fc
	pop de
	jp .finish

.asm_9cbc: ; 9cbc (2:5cbc)
	ld a, [wc834]
	ld hl, wc836
	add [hl]
	add $7
	ld hl, wPlayerMapX
	cp [hl]
	jp c, .asm_9d0e
	ld a, [wc834]
	add $6
	ld l, a
	ld a, [wPlayerMapX]
	add $a
	cp l
	jp c, .asm_9d0e
	ld a, [wc835]
	ld hl, wc837
	add [hl]
	add $6
	ld hl, wPlayerMapY
	cp [hl]
	jp c, .asm_9d0e
	ld a, [wc835]
	add $5
	ld l, a
	ld a, [wPlayerMapY]
	add $9
	cp l
	jp c, .asm_9d0e
	set_farcall_addrs_hli Func_da093
	ld a, $1
	call FarCall
	ld e, a
	jp .finish

.asm_9d0e: ; 9d0e (2:5d0e)
	push de
	callba_hli Func_da4fc
	pop de
.finish: ; 9d1e (2:5d1e)
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, e
	pop bc
	ret

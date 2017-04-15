AllocateMemory:: ; 17aba (5:7aba)
	push hl
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
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
	read_hl_from $c2de
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
	reg16swap de, hl
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
	read_hl_from $c2dc
	inc hl
	write_hl_to $c2dc
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
	call CheckButton
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

Data_17c44: ; 17c44
	db "ケﾞットハﾞッファー ヌル エラー$" ; GET BUFFER FULL ERROR

Func_17c56: ; 17c56
	ret

DeallocateMemory:: ; 17c57 (5:7c57)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, Func_17d77
	read_hl_from $c2dc
	dec hl
	write_hl_to $c2dc
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
	read_hl_from $c2de
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
	read_hl_from $c2de
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
	reg16swap de, hl
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

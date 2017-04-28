Func_aff1: ; aff1 (2:6ff1)
	ld hl, $c
	call AllocateMemory_Bank02
	write_hl_to wc778
	xor a
.loop
	cp $2
	jp nc, .quit
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc778
	add hl, de
	ld [hl], $ff
	inc a
	jp .loop

.quit
	ret

Func_b01b:: ; b01b
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
	reg16swap de, hl
	read_hl_from wc778
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
	reg16swap de, hl
	read_hl_from wObjectStructPointer
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
	reg16swap de, hl
	read_hl_from wc776
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
	reg16swap de, hl
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
	reg16swap de, hl
	read_hl_from wc778
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
	call ChangePersonFacing
Func_b14d: ; b14d (2:714d)
	add sp, $c
	ret

Func_b150:: ; b150 (2:7150)
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
	reg16swap de, hl
	read_hl_from wc778
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
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
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
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
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
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	reg16swap de, hl
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
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
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
	reg16swap de, hl
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
	write_hl_to wFarCallDestAddr
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
	call ChangePersonFacing
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

Func_b3ab:: ; b3ab (2:73ab)
	call NextOverworldFrame
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
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
	reg16swap de, hl
	read_hl_from wc778
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

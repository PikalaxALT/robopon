Func_a24c: ; a24c (2:624c)
	xor a
	ld [wNumPeopleLoaded], a
	ld a, $10
	ld [wc773], a
	ld hl, 14 * 20
	call AllocateMemory_Bank02
	write_hl_to wObjectStructPointer
	ld hl, $50
	call AllocateMemory_Bank02
	write_hl_to wc776
	ret

LoadSpriteGFX:: ; a26c (2:626c)
	push hl
	push de
	push bc
	push bc
	call GetHLAtSPPlus8
	ld a, l
	cp $1a
	jp nc, Func_a296
	ld a, BANK(GFX_d4000)
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, GFX_d4000
	add hl, de
	call WriteHLToSPPlus4
	jp Func_a2b0

Func_a296: ; a296 (2:6296)
	ld a, BANK(GFX_c0000)
	ld [wFarCallDestBank], a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, GFX_c0000 - $1a * $240
	add hl, de
	call WriteHLToSPPlus4
Func_a2b0: ; a2b0 (2:62b0)
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	push hl
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	ld l, h
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	pop de
	call FarRequestVideoData
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop bc
	pop bc
	pop bc
	ret

Data_a2e7: ; a2e7
	db $18, $c, $0, $c

LoadMapObject:: ; a2eb
	push hl
	push bc
	push bc
	push bc
	ld a, [wNumPeopleLoaded]
	cp 20
	jp c, .room_for_more
	ld hl, -1
	jp .quit

.room_for_more
	call GetHLAtSPPlus8
	push hl
	ld hl, wNumPeopleLoaded
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
	ld hl, wNumPeopleLoaded
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
	ld hl, wNumPeopleLoaded
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
	jp z, .skip_load_gfx
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
.skip_load_gfx
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
	jp nz, .dont_load_map_width
	ld hl, sp+$2
	ld a, [wMapWidth]
	ld [hl], a
.dont_load_map_width
	pop hl
	ld a, l
	cp $64
	jp nz, .dont_load_map_height
	ld a, [wMapHeight]
	ld l, a
.dont_load_map_height
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
.loop
	cp l
	jp nc, .break
	push hl
	push af
	push de
	ld c, $0
.loop2
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, .break2
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
	jp .loop2

.break2
	pop de
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	pop hl
	jp .loop

.break
	ld a, [wNumPeopleLoaded]
	inc a
	ld [wNumPeopleLoaded], a
.quit
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_a444:: ; a444
	push af
	push de
	push bc
	push bc
	ld hl, sp+$4
	ld c, [hl]
	ld hl, sp+$4
	ld a, [hl]
	and $7f
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	ld hl, wNumPeopleLoaded
	cp [hl]
	jp c, Func_a460
	jp Func_a57b

Func_a460: ; a460 (2:6460)
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld a, c
	and $80
	jp nz, Func_a4a0
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call Func_9a49
Func_a4a0: ; a4a0 (2:64a0)
	ld hl, sp+$7
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
	reg16swap de, hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
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
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_a543
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_a540
	xor a
Func_a510: ; a510 (2:6510)
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_a540
	push af
	push de
	ld c, $0
Func_a51a: ; a51a (2:651a)
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, Func_a52f
	ld a, [de]
	dec a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	inc c
	jp Func_a51a

Func_a52f: ; a52f (2:652f)
	pop de
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	jp Func_a510

Func_a540: ; a540 (2:6540)
	jp Func_a57b

Func_a543: ; a543 (2:6543)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_a57b
Func_a54a:
	xor a
Func_a54b: ; a54b (2:654b)
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_a57b
	push af
	push de
	ld c, $0
Func_a555: ; a555 (2:6555)
	ld a, c
	ld hl, sp+$6
	cp [hl]
	jp nc, Func_a56a
	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a
	inc c
	jp Func_a555

Func_a56a: ; a56a (2:656a)
	pop de
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	jp Func_a54b

Func_a57b: ; a57b (2:657b)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_a580:: ; a580
	push de
	pop hl
	push hl
	push hl
	ld l, a
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
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ret

Func_a5a4:: ; a5a4
	push hl
	push de
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_a5ab: ; a5ab (2:65ab)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, wNumPeopleLoaded
	cp [hl]
	jp nc, Func_a60b
	ld hl, sp+$0
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
	ld de, $c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	call CompareHLtoBC
	jp nz, Func_a601
	call GetHLAtSPPlus4
	push hl
	ld hl, sp+$2
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
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
Func_a601: ; a601 (2:6601)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_a5ab

Func_a60b: ; a60b (2:660b)
	pop bc
	pop bc
	pop bc
	ret

Func_a60f:: ; a60f
	push de
	push bc
	ld hl, wNumPeopleLoaded
	cp [hl]
	jp c, .proceed
	jp .quit

.proceed
	push af
	push bc

	ld l, a
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
	reg16swap de, hl

	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a

	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a

	ld hl, sp+$6
	ld a, [hl]
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld [hl], a

	pop bc
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld [hl], c

	pop af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, .quit

	push bc
	ld hl, sp+$2
	ld e, [hl]
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

	ld a, [de]
	dec a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a

	pop bc
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
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl

	ld a, [de]
	inc a
	and $7
	ld l, a
	ld a, [de]
	and $f8
	add l
	ld [de], a

.quit
	pop bc
	pop bc
	ret

Data_a6d4: ; a6d4
	db $18, $c, $0, $c

ChangePersonFacing:: ; a6d8 (2:66d8)
	push af
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_a6d4
	ld bc, $4
	call MemCopy
	pop de
	ld a, e
	and $80
	jp z, .bit_7_not_set
	ld a, $1
	jp .checked_bit_7

.bit_7_not_set
	xor a
.checked_bit_7
	push af
	ld a, e
	and $7f
	ld e, a
	push de
	ld hl, sp+$b
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
	ld c, l
	ld b, h
	pop de
	pop af
	push bc
	push de
	ld hl, $6
	add hl, bc
	ld [hl], e
	or a
	jp nz, .not_player
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call Func_9a49
.not_player
	pop de
	pop bc
	ld a, [bc]
	ld hl, sp+$5
	ld [hl], a
	cp $ff
	jp z, .quit
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	ld hl, sp+$5
	ld a, [hl]
	cp $1b
	jp z, .set_var_zero
	ld hl, sp+$5
	ld a, [hl]
	cp $1d
	jp nz, .load_gfx
.set_var_zero
	ld hl, sp+$4
	ld [hl], $0
.load_gfx
	ld c, e
	ld hl, sp+$4
	ld l, [hl]
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	ld d, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, d
	pop de
	call LoadSpriteGFX
	call Bank2_WaitVideoTransferIfLCDEnabled
.quit
	pop bc
	pop bc
	pop bc
	pop bc
	ret

CheckFacingObject: ; a783 (2:6783)
; a: flag: (00 = ??, 01 = bonking, 02 = pressing a)
; e: direction facing
	ld [wCheckFacingObjectFlag], a
	ld a, e
	ld [wCheckFacingObjectFacingDirection], a
	ld a, [wMovementDataAddr]
	ld b, a
	ld a, [wMovementDataAddr + 1]
	or b
	jr z, .okay
	ld a, $1
	ret

.okay
	ld a, $1
	ld [wCheckFacingObjectReturnFlag], a
	ld a, [wPlayerMapX]
	ld [wCheckFacingObjectX], a
	ld a, [wPlayerMapY]
	ld [wCheckFacingObjectY], a
	ld a, [wPlayerStandingTileOffset]
	ld l, a
	ld a, [wPlayerStandingTileOffset + 1]
	ld h, a
	ld c, l
	ld b, h
	ld a, [wMapCollisionPointer]
	ld l, a
	ld a, [wMapCollisionPointer + 1]
	ld h, a
	add hl, bc
	ld a, [wMapWidth]
	ld c, a
	ld b, $0
	ld a, [wCheckFacingObjectFlag]
	cp $1
	jr z, .do_fn_1
	cp $2
	jr z, .do_fn_1
	jr .skip_fn_1

.do_fn_1
	ld a, [wCheckFacingObjectFacingDirection]
	or a
	jr z, .up
	dec a
	jr z, .right
	dec a
	jr z, .down
	dec a
	jr z, .left
	jr .skip_fn_1

.up
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ld a, [wCheckFacingObjectY]
	dec a
	ld [wCheckFacingObjectY], a
	jr .skip_fn_1

.right
	inc hl
	ld a, [wCheckFacingObjectX]
	inc a
	ld [wCheckFacingObjectX], a
	jr .skip_fn_1

.down
	add hl, bc
	ld a, [wCheckFacingObjectY]
	inc a
	ld [wCheckFacingObjectY], a
	jr .skip_fn_1

.left
	dec hl
	ld a, [wCheckFacingObjectX]
	dec a
	ld [wCheckFacingObjectX], a
	jr .skip_fn_1

.skip_fn_1
	ld a, [hl]
	and $7
	jr nz, .no_tile_collision
	ld a, $1
	ret

.no_tile_collision
	ld hl, wObjectStructPointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [wCheckFacingObjectObjectStructPointer], a
	ld a, d
	ld [wCheckFacingObjectObjectStructPointer + 1], a
	ld hl, wc776
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [wCheckFacingObject_c890], a
	ld a, d
	ld [wCheckFacingObject_c890 + 1], a
	xor a
	ld [wCheckFacingObjectObjectCounter], a
.loop
	ld a, [wNumPeopleLoaded]
	ld b, a
	ld a, [wCheckFacingObjectObjectCounter]
	cp b
	jp nc, .done
	ld a, [wc84a]
	or a
	jp z, .done
	ld a, [wCheckFacingObject_c890]
	ld l, a
	ld a, [wCheckFacingObject_c890 + 1]
	ld h, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, .next
	ld a, [wCheckFacingObjectObjectStructPointer]
	ld l, a
	ld a, [wCheckFacingObjectObjectStructPointer + 1]
	ld h, a
	ld bc, $a
	add hl, bc
	ld a, [wCheckFacingObjectFlag]
	or a
	jr z, .check_word
	cp $2
	jr z, .check_word
	jr .skip_check_word

.check_word
	ld a, [hli]
	ld b, a
	ld a, [hli]
	dec hl
	dec hl
	or b
	jp z, .next
.skip_check_word
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, [wCheckFacingObjectX]
	bit 7, a
	jp nz, .next
	cp [hl]
	jp c, .next
	ld c, a
	ld a, [hl]
	ld b, a
	inc hl
	inc hl
	ld a, [hl]
	add b
	inc c
	cp c
	jp c, .next
	dec hl
	ld a, [wCheckFacingObjectY]
	bit 7, a
	jp nz, .next
	cp [hl]
	jp c, .next
	ld c, a
	ld a, [hl]
	ld b, a
	inc hl
	inc hl
	ld a, [hl]
	add b
	inc c
	cp c
	jp c, .next
	ld a, [wCheckFacingObjectFlag]
	or a
	jr z, .call_immediately
	cp $1
	jr z, .check_bonk
	cp $2
	jr z, .call_function
	jp .next

.call_immediately
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld e, $2
	ld a, [wCheckFacingObjectObjectCounter]
	call FarCall
	jp .next

.check_bonk
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	cp $0
	jr nz, .check_call
	ld a, [wMovementDataAddr]
	ld b, a
	ld a, [wMovementDataAddr + 1]
	or b
	jr nz, .check_call
	ld a, $0
	ld [wCheckFacingObjectReturnFlag], a
.check_call
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	or b
	jr z, .no_collision_here
	ld a, $0
	ld [wc7c4], a
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld a, $1
	ld e, a
	ld a, [wCheckFacingObjectObjectCounter]
	call FarCall
	ld a, [wc7c4]
	cp $1
	jr nz, .no_collision_here
	ld a, $1
	ld [wCheckFacingObjectReturnFlag], a
.no_collision_here
	jp .next

.call_function
	ld a, $0
	ld [wc7c4], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wFarCallDestBank], a
	ld a, [hli]
	ld [wFarCallDestAddr], a
	ld a, [hli]
	ld [wFarCallDestAddr + 1], a
	ld e, $0
	ld a, [wCheckFacingObjectObjectCounter]
	call FarCall
	ld a, [wc7c4]
	cp $1
	jp z, .done
.next
	ld a, [wCheckFacingObjectObjectStructPointer]
	ld l, a
	ld a, [wCheckFacingObjectObjectStructPointer + 1]
	ld h, a
	ld bc, $e
	add hl, bc
	ld a, l
	ld [wCheckFacingObjectObjectStructPointer], a
	ld a, h
	ld [wCheckFacingObjectObjectStructPointer + 1], a
	ld a, [wCheckFacingObject_c890]
	ld l, a
	ld a, [wCheckFacingObject_c890 + 1]
	ld h, a
	ld bc, $4
	add hl, bc
	ld a, l
	ld [wCheckFacingObject_c890], a
	ld a, h
	ld [wCheckFacingObject_c890 + 1], a
	ld a, [wCheckFacingObjectObjectCounter]
	inc a
	ld [wCheckFacingObjectObjectCounter], a
	jp nz, .loop
.done
	ld a, [wCheckFacingObjectReturnFlag]
	ret

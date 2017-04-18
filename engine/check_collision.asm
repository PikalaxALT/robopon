CheckFacingObject: ; a783 (2:6783)
; a: flag
; e: direction facing
	ld [wCheckCollisionFlag], a
	ld a, e
	ld [wCheckCollisionFacingDirection], a
	ld a, [$c83c]
	ld b, a
	ld a, [$c83d]
	or b
	jr z, .okay
	ld a, $1
	ret

.okay
	ld a, $1
	ld [wCheckCollisionReturnFlag], a
	ld a, [wPlayerMapX]
	ld [wCheckCollisionX], a
	ld a, [wPlayerMapY]
	ld [wCheckCollisionY], a
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
	ld a, [wCheckCollisionFlag]
	cp $1
	jr z, .do_fn_1
	cp $2
	jr z, .do_fn_1
	jr .skip_fn_1

.do_fn_1
	ld a, [wCheckCollisionFacingDirection]
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
	ld a, [wCheckCollisionY]
	dec a
	ld [wCheckCollisionY], a
	jr .skip_fn_1

.right
	inc hl
	ld a, [wCheckCollisionX]
	inc a
	ld [wCheckCollisionX], a
	jr .skip_fn_1

.down
	add hl, bc
	ld a, [wCheckCollisionY]
	inc a
	ld [wCheckCollisionY], a
	jr .skip_fn_1

.left
	dec hl
	ld a, [wCheckCollisionX]
	dec a
	ld [wCheckCollisionX], a
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
	ld [wCheckCollisionObjectStructPointer], a
	ld a, d
	ld [wCheckCollisionObjectStructPointer + 1], a
	ld hl, wc776
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	ld [wCheckCollision_c890], a
	ld a, d
	ld [wCheckCollision_c890 + 1], a
	xor a
	ld [wCheckCollisionObjectCounter], a
.loop: ; a836 (2:6836)
	ld a, [wc772]
	ld b, a
	ld a, [wCheckCollisionObjectCounter]
	cp b
	jp nc, .done
	ld a, [wc84a]
	or a
	jp z, .done
	ld a, [wCheckCollision_c890]
	ld l, a
	ld a, [wCheckCollision_c890 + 1]
	ld h, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, .next
	ld a, [wCheckCollisionObjectStructPointer]
	ld l, a
	ld a, [wCheckCollisionObjectStructPointer + 1]
	ld h, a
	ld bc, $a
	add hl, bc
	ld a, [wCheckCollisionFlag]
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
	ld a, [wCheckCollisionX]
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
	ld a, [wCheckCollisionY]
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
	ld a, [wCheckCollisionFlag]
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
	ld a, [wCheckCollisionObjectCounter]
	call FarCall
	jp .next

.check_bonk
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	cp $0
	jr nz, .check_call
	ld a, [$c83c]
	ld b, a
	ld a, [$c83c + 1]
	or b
	jr nz, .check_call
	ld a, $0
	ld [wCheckCollisionReturnFlag], a
.check_call
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	or b
	jr z, .no_collision_here
	ld a, $0
	ld [$c7c4], a
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
	ld a, [wCheckCollisionObjectCounter]
	call FarCall
	ld a, [$c7c4]
	cp $1
	jr nz, .no_collision_here
	ld a, $1
	ld [wCheckCollisionReturnFlag], a
.no_collision_here
	jp .next

.call_function
	ld a, $0
	ld [$c7c4], a
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
	ld a, [wCheckCollisionObjectCounter]
	call FarCall
	ld a, [$c7c4]
	cp $1
	jp z, .done
.next
	ld a, [wCheckCollisionObjectStructPointer]
	ld l, a
	ld a, [wCheckCollisionObjectStructPointer + 1]
	ld h, a
	ld bc, $e
	add hl, bc
	ld a, l
	ld [wCheckCollisionObjectStructPointer], a
	ld a, h
	ld [wCheckCollisionObjectStructPointer + 1], a
	ld a, [wCheckCollision_c890]
	ld l, a
	ld a, [wCheckCollision_c890 + 1]
	ld h, a
	ld bc, $4
	add hl, bc
	ld a, l
	ld [wCheckCollision_c890], a
	ld a, h
	ld [wCheckCollision_c890 + 1], a
	ld a, [wCheckCollisionObjectCounter]
	inc a
	ld [wCheckCollisionObjectCounter], a
	jp nz, .loop
.done
	ld a, [wCheckCollisionReturnFlag]
	ret

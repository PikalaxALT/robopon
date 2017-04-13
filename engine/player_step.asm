HandlePlayerStep:: ; 943f (2:543f)
	push bc
	push de
	push hl
	ld b, a
	ld c, e
	push af
	ld a, [$c86c]
	ld [$c872], a
	ld a, [$c86d]
	ld [$c873], a
	ld a, [$c86a]
	ld [$c870], a
	ld a, [$c86b]
	ld [$c871], a
	ld a, $1
	ld [wLastStepSucceeded], a
	pop af
	push bc
	call CheckMovingOffEdgeOfMap
	pop bc
	cp $ff
	jr nz, .asm_9470
	xor a
	ld [wLastStepSucceeded], a
.asm_9470
	push bc
	push de
	push hl
	ld a, [$c838]
	ld e, a
	ld a, $1
	call CheckObjectCollision
	pop hl
	pop de
	pop bc
	cp $0
	jr nz, .asm_9487
	xor a
	ld [wLastStepSucceeded], a
.asm_9487
	ld a, [$c84a]
	or a
	jr nz, .asm_94ae
	push bc
	push de
	ld a, [$c838]
	ld e, $0
	call Func_9d80
	pop de
	pop bc
	di
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ei
	jp Func_99de

; check background collision
.asm_94ae
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, b
	cp $0
	jr z, .asm_94c7
	cp $1
	jr z, .asm_94d2
	cp $2
	jr z, .asm_94d8
	cp $3
	jr z, .asm_94e1
.asm_94c7
	dec e
	ld a, [wMapWidth]
	cpl
	ld l, a
	ld h, $ff
	inc hl
	jr .asm_94e5

.asm_94d2
	inc d
	ld hl, $1
	jr .asm_94e5

.asm_94d8
	inc e
	ld a, [wMapWidth]
	ld l, a
	ld h, $0
	jr .asm_94e5

.asm_94e1
	dec d
	ld hl, -1
.asm_94e5
	push bc
	push de
	push hl
	ld a, d
	ld c, $0
	call CheckBackgroundCollision
	pop hl
	pop de
	pop bc
	cp $ff
	jr nz, .asm_94f9
	xor a
	ld [wLastStepSucceeded], a
.asm_94f9

; check player state
	ld a, [$c7e1]
	cp $2
	jr z, .asm_9508
	cp $3
	jr z, .asm_9508
	ld a, $1
	jr .asm_950a

.asm_9508
	ld a, $2
.asm_950a
	ld [wPlayerMovementRate], a
	ld a, [$c858]
	cp $0
	jr nz, .asm_952e
	ld a, [$c857]
	cp $ff
	jr z, .asm_952e
	push bc
	push de
	call Func_9f4c
	pop de
	pop bc
	ld h, a
	ld a, [$c857]
	cp h
	jr nz, .asm_952e
	ld a, $1
	ld [$c858], a
.asm_952e
	ld a, c
	cp $1
	jr z, .asm_9536
	xor a
	jr .asm_9538

.asm_9536
	ld a, $1
.asm_9538
	ld [$c84b], a
	ld a, [wSCX]
	srl a
	srl a
	srl a
	ld h, a
	ld a, [wSCY]
	srl a
	srl a
	srl a
	ld l, a
	ld a, b
	or a
	jr z, .asm_955c
	dec a
	jr z, .asm_9566
	dec a
	jr z, .asm_9570
	dec a
	jr z, .asm_957a
.asm_955c
	ld a, h
	sub $2
	ld h, a
	ld a, l
	sub $4
	ld l, a
	jr .asm_9584

.asm_9566
	ld a, h
	add $16
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .asm_9584

.asm_9570
	ld a, h
	sub $2
	ld h, a
	ld a, l
	add $14
	ld l, a
	jr .asm_9584

.asm_957a
	ld a, h
	sub $4
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .asm_9584

.asm_9584
	ld a, c
	cp $1
	jr z, .asm_95a3
	push hl
	ld a, [$c83c]
	ld l, a
	ld a, [$c83d]
	or l
	pop hl
	jr nz, .asm_95a3
	ld a, [wLastStepSucceeded]
	cp $1
	jr z, .asm_95a8
	ld a, $33
	call OverworldPlaySFX
	jr .asm_95a8

.asm_95a3
	ld a, $1
	ld [wLastStepSucceeded], a
.asm_95a8
	ld c, $0
Func_95aa: ; 95aa (2:55aa)
	ld a, [wLastStepSucceeded]
	cp $0
	jp z, Func_9844
	push hl
	push bc
	ld a, h
	and $1f
	ld b, $0
	ld c, a
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [$c2cd]
	cp $0
	jr z, .asm_95d2
	bcbgcoord 0, 0, vWindowMap
	jr .asm_95d5

.asm_95d2
	bcbgcoord 0, 0
.asm_95d5
	add hl, bc
	pop bc
	ld a, b
	or a
	jr z, .asm_95e7
	dec a
	jp z, Func_9678
	dec a
	jp z, Func_9716
	dec a
	jp z, Func_97a7
.asm_95e7
	ld a, c
	cp $c
	jp nc, Func_9670
	push bc
	push hl
	ld a, [$c868]
	add c
	ld l, a
	ld a, [$c869]
	adc $0
	ld h, a
	ld a, [wMapY]
	sub $2
	ld e, a
	ld a, [wMapX]
	add c
	dec a
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .queue0
	and $2
	jr z, .queue1
.queue0
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .queue_transfer

.queue1
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.queue_transfer
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
Func_9670: ; 9670 (2:5670)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp Func_9844

Func_9678: ; 9678 (2:5678)
	push bc
	push hl
	ld a, [$c870]
	ld l, a
	ld a, [$c871]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [$c870], a
	ld a, h
	ld [$c871], a
	pop de
	pop hl
	ld a, [wMapY]
	sub $1
	add c
	ld e, a
	ld a, [wMapX]
	add $b
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_96b9
	and $2
	jr z, .asm_96df
.asm_96b9
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9703

.asm_96df
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9703
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
	pop hl
	ld a, l
	add $2
	ld l, a
	jp Func_9844

Func_9716: ; 9716 (2:5716)
	ld a, c
	cp $c
	jp nc, Func_979f
	push bc
	push hl
	ld a, [$c86e]
	add c
	ld l, a
	ld a, [$c86f]
	adc $0
	ld h, a
	ld a, [wMapY]
	add $a
	ld e, a
	ld a, [wMapX]
	add c
	dec a
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_974a
	and $2
	jr z, .asm_9770
.asm_974a
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9794

.asm_9770
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9794
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
Func_979f: ; 979f (2:579f)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp Func_9844

Func_97a7: ; 97a7 (2:57a7)
	push bc
	push hl
	ld a, [$c872]
	ld l, a
	ld a, [$c873]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [$c872], a
	ld a, h
	ld [$c873], a
	pop de
	pop hl
	ld a, [wMapY]
	sub $1
	add c
	ld e, a
	ld a, [wMapX]
	sub $2
	push hl
	pop bc
	call Func_9ee2
	ld d, h
	ld e, l
	pop hl
	ld bc, $200
	ld a, [wVBlankTransferFlags]
	and $1
	jr z, .asm_97e8
	and $2
	jr z, .asm_980e
.asm_97e8
	ld a, e
	ld [wVBlankMetaTileTransferQueue0TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue0TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue0AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue0AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue0Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue0Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $1
	ld [wVBlankTransferFlags], a
	jr .asm_9832

.asm_980e
	ld a, e
	ld [wVBlankMetaTileTransferQueue1TileSource], a
	ld a, d
	ld [wVBlankMetaTileTransferQueue1TileSource + 1], a
	ld a, [wc91d]
	ld [wVBlankMetaTileTransferQueue1AttrSource], a
	ld a, [wc91d + 1]
	ld [wVBlankMetaTileTransferQueue1AttrSource + 1], a
	ld a, l
	ld [wVBlankMetaTileTransferQueue1Dest], a
	ld a, h
	ld [wVBlankMetaTileTransferQueue1Dest + 1], a
	ld a, [wVBlankTransferFlags]
	or $2
	ld [wVBlankTransferFlags], a
.asm_9832
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
	pop bc
	pop hl
	ld a, l
	add $2
	ld l, a
	jr Func_9844

Func_9844: ; 9844 (2:5844)
	ld a, [wPlayerMovementRate]
	cp $1
	jr z, .normal_movement_rate
	ld a, c
	and $1
	jr z, .normal_movement_rate
	jp Func_9900

.normal_movement_rate
	push bc
	push hl
	call NextOverworldFrame
	call Func_8dc8
	pop hl
	pop bc
	ld a, [wLastStepSucceeded]
	cp $0
	jp z, Func_98f3
	ld a, b
	cp $0
	jr z, .asm_9876
	cp $1
	jr z, .asm_9894
	cp $2
	jr z, .asm_98b2
	cp $3
	jr z, .asm_98d0
.asm_9876
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCY]
	sub e
	ld [wSCY], a
	ld [wSCY2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84d]
	inc a
	ld [$c84d], a
	jr .asm_98ee

.asm_9894
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCX]
	add e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84c]
	dec a
	ld [$c84c], a
	jr .asm_98ee

.asm_98b2
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCY]
	add e
	ld [wSCY], a
	ld [wSCY2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84d]
	dec a
	ld [$c84d], a
	jr .asm_98ee

.asm_98d0
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCX]
	sub e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [$c84b]
	cp $1
	jr nz, .asm_98ee
	ld a, [$c84c]
	inc a
	ld [$c84c], a
	jr .asm_98ee

.asm_98ee
	ld a, c
	inc a
	ld [$c83a], a
Func_98f3: ; 98f3 (2:58f3)
	push bc
	push de
	push hl
	ld c, a
	ld e, $1
	ld a, b
	call Func_9a49
	pop hl
	pop de
	pop bc
Func_9900: ; 9900 (2:5900)
	ld a, [wLastStepSucceeded]
	cp $0
	jp z, .skip_step_vector
	ld a, c
	cp $f
	jp nz, .skip_step_vector
	ld a, b
	or a
	jr z, .update_map_coords_up
	dec a
	jr z, .update_map_coords_right
	dec a
	jr z, .update_map_coords_down
	dec a
	jr z, .update_map_coords_left
.update_map_coords_up
	push de
	push hl
	ld a, [wPlayerStandingTileOffset]
	ld l, a
	ld a, [wPlayerStandingTileOffset + 1]
	ld h, a
	ld a, [wMapWidth]
	cpl
	ld e, a
	ld d, $ff
	inc de
	add hl, de
	ld a, l
	ld [wPlayerStandingTileOffset], a
	ld a, h
	ld [wPlayerStandingTileOffset + 1], a
	pop hl
	pop de
	ld a, [wMapY]
	dec a
	ld [wMapY], a
	ld a, [wPlayerMapY]
	dec a
	ld [wPlayerMapY], a
	jr .asm_99b7

.update_map_coords_right
	push hl
	ld a, [wPlayerStandingTileOffset]
	ld l, a
	ld a, [wPlayerStandingTileOffset + 1]
	ld h, a
	inc hl
	ld a, l
	ld [wPlayerStandingTileOffset], a
	ld a, h
	ld [wPlayerStandingTileOffset + 1], a
	pop hl
	ld a, [wMapX]
	inc a
	ld [wMapX], a
	ld a, [wPlayerMapX]
	inc a
	ld [wPlayerMapX], a
	jr .asm_99b7

.update_map_coords_down
	push de
	push hl
	ld a, [wPlayerStandingTileOffset]
	ld l, a
	ld a, [wPlayerStandingTileOffset + 1]
	ld h, a
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [wPlayerStandingTileOffset], a
	ld a, h
	ld [wPlayerStandingTileOffset + 1], a
	pop hl
	pop de
	ld a, [wMapY]
	inc a
	ld [wMapY], a
	ld a, [wPlayerMapY]
	inc a
	ld [wPlayerMapY], a
	jr .asm_99b7

.update_map_coords_left
	push hl
	ld a, [wPlayerStandingTileOffset]
	ld l, a
	ld a, [wPlayerStandingTileOffset + 1]
	ld h, a
	dec hl
	ld a, l
	ld [wPlayerStandingTileOffset], a
	ld a, h
	ld [wPlayerStandingTileOffset + 1], a
	pop hl
	ld a, [wMapX]
	dec a
	ld [wMapX], a
	ld a, [wPlayerMapX]
	dec a
	ld [wPlayerMapX], a
.asm_99b7
	xor a
	ld [$c83a], a
.skip_step_vector
	push bc
	push hl
	call Func_b150
	pop hl
	pop bc
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	inc c
	ld a, c
	cp $10
	jp nz, Func_95aa
	ld a, [wLastStepSucceeded]
	cp $0
	jr nz, Func_99de
	xor a
	ld [$c858], a
Func_99de: ; 99de (2:59de)
	pop hl
	pop de
	pop bc
	ret

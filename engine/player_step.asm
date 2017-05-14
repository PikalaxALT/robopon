HandlePlayerStep:: ; 943f (2:543f)
; a: direction
; e: if set, freeze player (bg scroll only)
	push bc
	push de
	push hl
	ld b, a
	ld c, e
	push af
	ld a, [wc86c]
	ld [wc872], a
	ld a, [wc86c + 1]
	ld [wc872 + 1], a
	ld a, [wc86a]
	ld [wc870], a
	ld a, [wc86a + 1]
	ld [wc870 + 1], a
	ld a, $1
	ld [wLastStepSucceeded], a
	pop af
	push bc
	call CheckMovingOffEdgeOfMap
	pop bc
	cp $ff
	jr nz, .not_edge_bonk
	xor a
	ld [wLastStepSucceeded], a
.not_edge_bonk
	push bc
	push de
	push hl
	ld a, [wPlayerFacing]
	ld e, a
	ld a, $1
	call CheckFacingObject
	pop hl
	pop de
	pop bc
	cp $0
	jr nz, .not_person_bonk
	xor a
	ld [wLastStepSucceeded], a
.not_person_bonk
	ld a, [wRemainInMap]
	or a
	jr nz, .not_leaving_map_status
	push bc
	push de
	ld a, [wPlayerFacing]
	ld e, $0
	call UpdatePlayerSprite
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
	jp .dontResetSliding

; check background collision
.not_leaving_map_status
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, b
	cp FACE_UP
	jr z, .bgcollision_up
	cp FACE_RIGHT
	jr z, .bgcollision_right
	cp FACE_DOWN
	jr z, .bgcollision_down
	cp FACE_LEFT
	jr z, .bgcollision_left
.bgcollision_up
	dec e
	ld a, [wMapWidth]
	cpl
	ld l, a
	ld h, high(-1)
	inc hl
	jr .bgcollision

.bgcollision_right
	inc d
	ld hl, $1
	jr .bgcollision

.bgcollision_down
	inc e
	ld a, [wMapWidth]
	ld l, a
	ld h, $0
	jr .bgcollision

.bgcollision_left
	dec d
	ld hl, -1
.bgcollision
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
	jr nz, .no_collision
	xor a
	ld [wLastStepSucceeded], a
.no_collision

; check player state
	ld a, [wPlayerState]
	cp $2
	jr z, .fast
	cp $3
	jr z, .fast
	ld a, $1
	jr .got_movement_rate

.fast
	ld a, $2
.got_movement_rate
	ld [wPlayerMovementRate], a
	ld a, [wSliding]
	cp $0
	jr nz, .not_sliding
	ld a, [wSlipperyCollision]
	cp $ff
	jr z, .not_sliding
	push bc
	push de
	call Func_9f4c
	pop de
	pop bc
	ld h, a
	ld a, [wSlipperyCollision]
	cp h
	jr nz, .not_sliding
	ld a, $1
	ld [wSliding], a
.not_sliding
	ld a, c
	cp $1
	jr z, .player_frozen
	xor a
	jr .got_centered_status

.player_frozen
	ld a, $1
.got_centered_status
	ld [wPlayerSpriteNotCenteredOnScreen], a
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
	jr z, .screen_up
	dec a
	jr z, .screen_right
	dec a
	jr z, .screen_down
	dec a
	jr z, .screen_left
.screen_up
	ld a, h
	sub $2
	ld h, a
	ld a, l
	sub $4
	ld l, a
	jr .done_screen_scroll

.screen_right
	ld a, h
	add $16
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .done_screen_scroll

.screen_down
	ld a, h
	sub $2
	ld h, a
	ld a, l
	add $14
	ld l, a
	jr .done_screen_scroll

.screen_left
	ld a, h
	sub $4
	ld h, a
	ld a, l
	sub $2
	ld l, a
	jr .done_screen_scroll

.done_screen_scroll
	ld a, c
	cp $1
	jr z, .no_player_movement
	push hl
	ld a, [wMovementDataAddr]
	ld l, a
	ld a, [wMovementDataAddr + 1]
	or l
	pop hl
	jr nz, .no_player_movement
	ld a, [wLastStepSucceeded]
	cp $1
	jr z, .no_bonk
	ld a, $33
	call OverworldPlaySFX
	jr .no_bonk

.no_player_movement
	ld a, $1
	ld [wLastStepSucceeded], a
.no_bonk
	ld c, $0
.Loop
	ld a, [wLastStepSucceeded]
	cp $0
	jp z, .DoMovementRate
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
	ld a, [wOverworldTilemapSelector]
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
	jr z, .scrollMapUp
	dec a
	jp z, .scrollMapRight
	dec a
	jp z, .scrollMapDown
	dec a
	jp z, .scrollMapLeft
.scrollMapUp
	ld a, c
	cp $c
	jp nc, .dontScrollUp
	push bc
	push hl
	ld a, [wc868]
	add c
	ld l, a
	ld a, [wc868 + 1]
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
.dontScrollUp: ; 9670 (2:5670)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp .DoMovementRate

.scrollMapRight: ; 9678 (2:5678)
	push bc
	push hl
	ld a, [wc870]
	ld l, a
	ld a, [wc870 + 1]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [wc870], a
	ld a, h
	ld [wc870 + 1], a
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
	jp .DoMovementRate

.scrollMapDown: ; 9716 (2:5716)
	ld a, c
	cp $c
	jp nc, .dontScrollDown
	push bc
	push hl
	ld a, [wc86e]
	add c
	ld l, a
	ld a, [wc86e + 1]
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
.dontScrollDown: ; 979f (2:579f)
	pop hl
	ld a, h
	add $2
	ld h, a
	jp .DoMovementRate

.scrollMapLeft: ; 97a7 (2:57a7)
	push bc
	push hl
	ld a, [wc872]
	ld l, a
	ld a, [wc872 + 1]
	adc $0
	ld h, a
	push hl
	push de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [wc872], a
	ld a, h
	ld [wc872 + 1], a
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
	jr .DoMovementRate

.DoMovementRate: ; 9844 (2:5844)
	ld a, [wPlayerMovementRate]
	cp $1
	jr z, .normal_movement_rate
	ld a, c
	and $1
	jr z, .normal_movement_rate
	jp .acceleratedMovementRate

.normal_movement_rate
	push bc
	push hl
	call NextOverworldFrame
	call MoveEmote_
	pop hl
	pop bc
	ld a, [wLastStepSucceeded]
	cp $0
	jp z, .stepDidNotSucceed
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
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_98ee
	ld a, [wPlayerSpriteYOffset]
	inc a
	ld [wPlayerSpriteYOffset], a
	jr .asm_98ee

.asm_9894
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCX]
	add e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_98ee
	ld a, [wPlayerSpriteXOffset]
	dec a
	ld [wPlayerSpriteXOffset], a
	jr .asm_98ee

.asm_98b2
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCY]
	add e
	ld [wSCY], a
	ld [wSCY2], a
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_98ee
	ld a, [wPlayerSpriteYOffset]
	dec a
	ld [wPlayerSpriteYOffset], a
	jr .asm_98ee

.asm_98d0
	ld a, [wPlayerMovementRate]
	ld e, a
	ld a, [wSCX]
	sub e
	ld [wSCX], a
	ld [wSCX2], a
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_98ee
	ld a, [wPlayerSpriteXOffset]
	inc a
	ld [wPlayerSpriteXOffset], a
	jr .asm_98ee

.asm_98ee
	ld a, c
	inc a
	ld [wc83a], a
.stepDidNotSucceed: ; 98f3 (2:58f3)
	push bc
	push de
	push hl
	ld c, a
	ld e, $1
	ld a, b
	call UpdateSprites
	pop hl
	pop de
	pop bc
.acceleratedMovementRate: ; 9900 (2:5900)
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
	ld [wc83a], a
.skip_step_vector
	push bc
	push hl
	call HandleNPCStep
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
	jp nz, .Loop
	ld a, [wLastStepSucceeded]
	cp $0
	jr nz, .dontResetSliding
	xor a
	ld [wSliding], a
.dontResetSliding: ; 99de (2:59de)
	pop hl
	pop de
	pop bc
	ret

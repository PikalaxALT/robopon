HandleMap: ; 90e9 (2:50e9)
	add sp, -$10
	ld a, $ff
	ld [wLastPlayerFacing], a
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	ld hl, sp+$e
	ld [hl], $ff
.loop: ; 90fe (2:50fe)
	ld a, [wRemainInMap]
	cp $1
	jp nz, .quit
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, .skip_frame
	call NextOverworldFrame
.skip_frame: ; 9111 (2:5111)
	call Func_b44d
	ld hl, sp+$e
	ld [hl], a
	read_hl_from wMovementDataAddr
	ld a, l
	or h
	jp z, .doPlayerStep
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, .doPlayerStep
	ld hl, $0
	write_hl_to wMovementDataAddr
	jp .quit

.doPlayerStep: ; 9134 (2:5134)
	ld e, $ff
	ld hl, sp+$e
	ld a, [hl]
	and $4
	jp z, .check_step_down
	xor a
	ld [wPlayerFacing], a
	ld e, a
	jp .done_player_step

.check_step_down: ; 9146 (2:5146)
	ld hl, sp+$e
	ld a, [hl]
	and $8
	jp z, .check_step_left
	ld a, FACE_DOWN
	ld [wPlayerFacing], a
	ld e, a
	jp .done_player_step

.check_step_left: ; 9157 (2:5157)
	ld hl, sp+$e
	ld a, [hl]
	and $2
	jp z, .check_step_right
	ld a, FACE_LEFT
	ld [wPlayerFacing], a
	ld e, a
	jp .done_player_step

.check_step_right: ; 9168 (2:5168)
	ld hl, sp+$e
	ld a, [hl]
	and $1
	jp z, .player_step_invalid
	ld a, FACE_RIGHT
	ld [wPlayerFacing], a
	ld e, a
	jp .done_player_step

.player_step_invalid: ; 9179 (2:5179)
	push de
	ld a, [wPlayerFacing]
	ld [wLastPlayerFacing], a
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	call HandleNPCStep
	pop de
.done_player_step: ; 918e (2:518e)
	push de
	ld a, [wLastPlayerFacing]
	ld hl, wPlayerFacing
	cp [hl]
	jp z, .skip_player_sprite_reload
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdatePlayerSprite
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call GetPlayerSprite
	ld a, [wPlayerFacing]
	ld [wLastPlayerFacing], a
.skip_player_sprite_reload: ; 91ba (2:51ba)
	call MoveEmote_
	pop de
	ld hl, sp+$e
	ld a, [hl]
	and $10
	jp z, .notPressingA
	ld e, $4
	ld a, [wPlayerFacing]
	ld e, a
	ld a, $2
	call CheckFacingObject
	ld a, [wRemainInMap]
	or a
	jp nz, .continue_map
	jp .quit

.continue_map: ; 91db (2:51db)
	callba_hli Func_9b326
	ld hl, sp+$e
	ld [hl], $ff
	jp .loop

.notPressingA: ; 91f0 (2:51f0)
	ld hl, sp+$e
	ld a, [hl]
	and $40
	jp z, .notPressingSelect
	; Press and hold Select to display the time and date
	push de
	ld hl, $0
	push hl
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_bf05
	call Func_bf12
	pop hl
	ld a, l
	or h
	jp nz, .asm_9222
	set_farcall_addrs_hli Func_da901
	ld de, $1403
	ld hl, $0
	call FarCall
.asm_9222: ; 9222 (2:5222)
	push hl
	ld hl, sp+$4
	ld [hl], $ff
.whileHoldingSelect: ; 9227 (2:5227)
	call GetJoyPressed
	and $40
	jp z, .releasedSelect
	call NextOverworldFrame
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$5
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$9
	cp [hl]
	jp nz, .asm_924e
	jp .whileHoldingSelect

.asm_924e: ; 924e (2:524e)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld e, $1
	ld a, $2
	call SetStringStartState
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $14
	ld hl, $0
	call FarCall
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld de, $784
	add hl, de
	push hl
	ld hl, Data_9416
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$8
	ld a, [hl]
	cp $a
	jp nc, .asm_92ab
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9420
	push hl
	call PlaceString
	pop bc
	pop bc
	jp .asm_92ba

.asm_92ab: ; 92ab (2:52ab)
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9425
	push hl
	call PlaceString
	pop bc
	pop bc
.asm_92ba: ; 92ba (2:52ba)
	ld hl, sp+$9
	ld a, [hl]
	cp $a
	jp nc, .asm_92d4
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9429
	push hl
	call PlaceString
	pop bc
	pop bc
	jp .asm_92e3

.asm_92d4: ; 92d4 (2:52d4)
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_942d
	push hl
	call PlaceString
	pop bc
	pop bc
.asm_92e3: ; 92e3 (2:52e3)
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $3
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	jp .whileHoldingSelect

.releasedSelect: ; 92f7 (2:52f7)
	call Func_8f44
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	pop de
	jp .doneJoypadCheck

.notPressingSelect: ; 930d (2:530d)
	ld hl, sp+$e
	ld a, [hl]
	and $80
	jp z, .doneJoypadCheck
	push de
	callba_hli Func_da4dc
	ld a, [wc7da]
	or a
	jp z, .asm_9371
	xor a
	ld [wOBP0], a
	ld [wBGP], a
	xor a
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Bank2_WaitVideoTransferIfLCDEnabled
	call FillVisibleAreaWithBlankTile
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, $e0
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Bank2_WaitVideoTransferIfLCDEnabled
	set_farcall_addrs_hli Func_c7bd0
	ld a, [wc867]
	call FarCall
.asm_9371: ; 9371 (2:5371)
	ld hl, sp+$c
	ld a, [wSpawnX]
	ld [hl], a
	ld hl, sp+$d
	ld a, [wSpawnY]
	ld [hl], a
	ld hl, sp+$e
	ld a, [wSpawnPushX]
	ld [hl], a
	ld hl, sp+$f
	ld a, [wSpawnPushY]
	ld [hl], a
	ld a, [wPlayerMapX]
	ld [wSpawnX], a
	ld a, [wPlayerMapY]
	ld [wSpawnY], a
	ld a, [wPlayerMapX]
	ld [wSpawnPushX], a
	ld a, [wPlayerMapY]
	ld [wSpawnPushY], a
	callba_hli Func_14675
	pop de
	ld a, [wRemainInMap]
	or a
	jp nz, .asm_93ba
	jp .quit

.asm_93ba: ; 93ba (2:53ba)
	push de
	xor a
	call FadeInMap
	pop de
.doneJoypadCheck: ; 93c0 (2:53c0)
	ld a, e
	cp $ff
	jp nz, .step
	ld hl, sp+$e
	ld [hl], $ff
	jp .loop

.step
	ld e, $0
	ld a, [wPlayerFacing]
	call HandlePlayerStep
	ld a, [wPlayerFacing]
	ld e, a
	xor a
	call CheckFacingObject
	ld a, [wRemainInMap]
	or a
	jp nz, .asm_93e7
	jp .quit

.asm_93e7: ; 93e7 (2:53e7)
	call CheckWarpTile
	cp $1
	jp nz, .asm_93f2
	jp .quit

.asm_93f2: ; 93f2 (2:53f2)
	call RollRandomEncounter
	cp $1
	jp z, .asm_9409
	cp $ff
	jp z, .asm_9406
	or a
	jp nz, .asm_940c
	jp .quit

.asm_9406: ; 9406 (2:5406)
	jp .asm_940c

.asm_9409: ; 9409 (2:5409)
	jp .loop

.asm_940c: ; 940c (2:540c)
	ld hl, sp+$e
	ld [hl], $0
	jp .loop

.quit: ; 9413 (2:5413)
	add sp, $10
	ret

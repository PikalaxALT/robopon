SpawnsFromWorldMap: ; 8151
	spawn $0c, $04, $0c, $05, MAP_00_00 ; 00
	spawn $05, $14, $06, $14, MAP_01_00 ; 01
	spawn $20, $0d, $1f, $0d, MAP_05_00 ; 02
	spawn $0c, $04, $0c, $05, MAP_03_00 ; 03
	spawn $23, $08, $22, $08, MAP_06_00 ; 04
	spawn $0c, $04, $0c, $05, MAP_07_00 ; 05
	spawn $05, $28, $06, $28, MAP_09_00 ; 06
	spawn $0d, $04, $0d, $05, MAP_20_00 ; 07
	spawn $11, $1d, $11, $1c, MAP_21_00 ; 08
	spawn $14, $05, $13, $05, MAP_22_00 ; 09
	spawn $11, $1c, $11, $1b, MAP_18_00 ; 0a
	spawn $07, $0a, $07, $09, MAP_31_00 ; 0b
	spawn $0c, $1c, $0c, $1b, MAP_25_01 ; 0c
	spawn $0e, $29, $0e, $28, MAP_27_00 ; 0d
	spawn $07, $13, $07, $12, MAP_32_10 ; 0e
	spawn $23, $0e, $22, $0e, MAP_11_00 ; 0f
	spawn $0f, $04, $0f, $05, MAP_19_22 ; 10
	spawn $0f, $1f, $0f, $1e, MAP_29_00 ; 11
	spawn $07, $0b, $07, $0a, MAP_31_00 ; 12

Data_81c3: ; 81c3
	spawn $20, $05, $1f, $05, MAP_24_00 ; conditional 09

Data_81c9: ; 81c9
	spawn $07, $0c, $07, $0b, MAP_26_00 ; conditional 0e

OverworldLoop: ; 81cf (2:41cf)
; c: 1 if continuing from a previous save
	push bc
	push bc
	ld a, [wSystemType]
	cp $11
	jp nz, .not_cgb
	set_farcall_addrs_hli MapFadeInCGB
	ld e, $0
	xor a
	call FarCall
.not_cgb
	pop bc
	inc c
	dec c
	jp nz, .not_new_game
	call NewSaveFileInWRam
	ld bc, wc7b1 - wc789
.loop
	ld l, c
	ld h, b
	ld de, wc7bd - wc789
	call CompareHLtoDE
	jp nc, .new_game
	ld hl, wc789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp .loop

.new_game
	xor a
	ld [wc318], a
	ld a, $1
	ld [wc7e2], a
	set_farcall_addrs_hli UnlockArea
	ld a, $1
	call FarCall
	ld a, $ff
	ld [wBackupMapNumber], a
	ld [wBackupMapGroup], a
	ld a, $3
	ld [wSpawnPushX], a
	ld [wSpawnX], a
	ld a, $5
	ld [wSpawnPushY], a
	ld [wSpawnY], a
	xor a
	ld [wMapGroup], a
	ld a, $2
	ld [wMapNumber], a
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	jp .continue

.not_new_game
	ld a, c
	cp $1
	jp nz, .not_map_1
	callba_hli LoadGame
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	callba_hli Func_9a8c3
	xor a
	ld [wMapMusic], a
	jp .continue

.not_map_1
	push bc
	callba_hli LoadDebugSaveState
	ld de, Data_840f
	lb hl, 5, 7
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli Func_51bf3
	pop bc
	ld a, c
	call FarCall
	ld a, $1
	ld [wc7e2], a
	ld bc, wc7b1 - wc789
.loop2
	ld l, c
	ld h, b
	ld de, wc7bd - wc789
	call CompareHLtoDE
	jp nc, .okay2
	ld hl, wc789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp .loop2

.okay2
	xor a
	ld [wc318], a
	ld a, $ff
	ld [wBackupMapNumber], a
	ld [wBackupMapGroup], a
	ld a, $3
	ld [wSpawnPushX], a
	ld [wSpawnX], a
	ld a, $5
	ld [wSpawnPushY], a
	ld [wSpawnY], a
	xor a
	ld [wMapGroup], a
	ld a, $2
	ld [wMapNumber], a
.continue
	ld a, $ff
	ld [wPlayerFacing], a
.loop3
	ld a, [wMapGroup]
	cp $ff
	jp nz, .okay3
	call Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_d9f68
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, $1
	call Func_bbc8
	call Func_b65f
	ld a, SONG_WORLD_MAP
	ld [wMapMusic], a
	callba_hli WorldMap
	ld hl, sp+$0
	ld [hl], a
	ld a, $ff
	ld [wBackupMapGroup], a
	ld a, $ff
	ld [wBackupMapNumber], a
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp nz, .no_lookup_Data_81c3
	ld hl, $44
	call CheckEventFlag
	cp $1
	jp nz, .no_lookup_Data_81c3
	ld bc, Data_81c3
	jp .set_spawn

.no_lookup_Data_81c3
	ld hl, sp+$0
	ld a, [hl]
	cp $e
	jp nz, .lookup_SpawnsFromWorldMap
	ld hl, $1c
	call CheckEventFlag
	cp $1
	jp nz, .lookup_SpawnsFromWorldMap
	ld bc, Data_81c9
	jp .set_spawn

.lookup_SpawnsFromWorldMap
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, SpawnsFromWorldMap
	add hl, de
	ld c, l
	ld b, h
.set_spawn
	ld de, wSpawnX - wc789
.loop4
	ld hl, wMapNumber - wc789
	call CompareHLtoDE
	jp c, .okay3
	ld hl, wc789
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	inc de
	jp .loop4

.okay3
	xor a
	ld [wVBlankTransferFlags], a
	ld c, $0
	ld a, [wMapNumber]
	ld e, a
	ld a, [wMapGroup]
	call PreloadNextMap
	xor a
	ld [wc7da], a
	set_farcall_addrs_hli EnterMap
	ld a, [wMapNumber]
	ld e, a
	ld a, [wMapGroup]
	call FarCall
	xor a
	ld [wSaveFileExists], a
	ld a, [wRemainInMap]
	cp $1
	jp nz, .skip_HandleMap
	call HandleMap
.skip_HandleMap
	call Func_8df1
	jp .loop3

Data_840f: ; 840f
	db "(なう ろーてﾞぃんくﾞ)", $0

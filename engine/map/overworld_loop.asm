Data_8151: ; 8151
	db $c, $4, $c, $5, $0, $0
	db $5, $14, $6, $14, $1, $0
	db $20, $d, $1f, $d, $5, $0
	db $c, $4, $c, $5, $3, $0
	db $23, $8, $22, $8, $6, $0
	db $c, $4, $c, $5, $7, $0
	db $5, $28, $6, $28, $9, $0
	db $d, $4, $d, $5, $14, $0
	db $11, $1d, $11, $1c, $15, $0
	db $14, $5, $13, $5, $16, $0
	db $11, $1c, $11, $1b, $12, $0
	db $7, $a, $7, $9, $1f, $0
	db $c, $1c, $c, $1b, $19, $1
	db $e, $29, $e, $28, $1b, $0
	db $7, $13, $7, $12, $20, $a
	db $23, $e, $22, $e, $b, $0
	db $f, $4, $f, $5, $13, $16
	db $f, $1f, $f, $1e, $1d, $0
	db $7, $b, $7, $a, $1f, $0

Data_81c3
	db $20, $5, $1f, $5, $18, $0

Data_81c9: ; 81c9
	db $7, $c, $7, $b, $1a, $0

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
	set_farcall_addrs_hli Func_e2780
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
	ld a, $14
	ld [wMapMusic], a
	callba_hli Func_e220d
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
	jp .do_trigger

.no_lookup_Data_81c3
	ld hl, sp+$0
	ld a, [hl]
	cp $e
	jp nz, .lookup_Data_8151
	ld hl, $1c
	call CheckEventFlag
	cp $1
	jp nz, .lookup_Data_8151
	ld bc, Data_81c9
	jp .do_trigger

.lookup_Data_8151
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_8151
	add hl, de
	ld c, l
	ld b, h
.do_trigger
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
	ld [wc798], a
	ld a, [wRemainInMap]
	cp $1
	jp nz, .skip_HandleMap
	call HandleMap
.skip_HandleMap
	call Func_8df1
	jp .loop3

Data_840f: ; 840f
	db "(なう ろーてﾞぃんくﾞ)", $0

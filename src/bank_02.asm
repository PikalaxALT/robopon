INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 02", ROMX
Func_8000: ; 8000
	ret

Data_8001: ; 8001
	db  0,  0
	db 14,  9
	dba DrawDebugMenu
	dbw 0, 0
	dba StartMenu_MoveCursor
	dba Func_80f6
	dba StartMenu_PressB
	dbw 0, 0
	dbw 0, 0
	dbw 0, 0
	dbw 0, 0

Data_8020:
	dstr "フィールトﾞテスト"

Data_802a:
	dstr "スフﾟライトテスト"

Data_8034:
	dstr "ワールトﾞマッフﾟテスト"

Data_8041:
	dstr "コンティニューテスト"

Func_804c:: ; 804c (2:404c)
	add sp, -$64
	ld hl, sp+$52
	reg16swap de, hl
	ld hl, Data_8020
	ld bc, $a
	call MemCopy
	ld hl, sp+$48
	reg16swap de, hl
	ld hl, Data_802a
	ld bc, $a
	call MemCopy
	ld hl, sp+$3b
	reg16swap de, hl
	ld hl, Data_8034
	ld bc, $d
	call MemCopy
	ld hl, sp+$30
	reg16swap de, hl
	ld hl, Data_8041
	ld bc, $b
	call MemCopy
	ld hl, sp+$52
	write_hl_to_sp_plus $5e
	ld hl, sp+$48
	write_hl_to_sp_plus $60
	ld hl, sp+$3b
	write_hl_to_sp_plus $62
	ld hl, sp+$30
	write_hl_to_sp_plus $64
	ld hl, sp+$11
	reg16swap de, hl
	ld hl, Data_8001
	ld bc, $1f
	call MemCopy
	ld hl, sp+$11
	call WriteHLToSPPlus3
	ld hl, $0
	call WriteHLToSPPlus7
	ld hl, $0
	call WriteHLToSPPlus5
	ld hl, -1
	write_hl_to_sp_plus $d
	ld hl, $4
	write_hl_to_sp_plus $b
	ld hl, $4
	call WriteHLToSPPlus9
	ld hl, $0
	write_hl_to_sp_plus $11
	ld hl, sp+$5c
	write_hl_to_sp_plus $f
	set_farcall_addrs_hli HandleMenu
	ld hl, sp+$0
	call FarCall
	add sp, $64
	ret

Func_80f6: ; 80f6
	reg16swap de, hl
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $5
	add hl, de
	ld l, [hl]
	add l
	cp $3
	jp z, .ContinueTest
	cp $2
	jp z, .WorldMapTest
	cp $1
	jp z, .SpriteTest
	or a
	jp nz, .Quit
	ld c, $0
	ld e, $0
	xor a
	call OverworldLoop
	jp .Quit

.SpriteTest
	callba_hli Debug_SpriteTest
	jp .Quit

.WorldMapTest
	callba_hli WorldMap
	jp .Quit

.ContinueTest
	ld c, $1
	ld e, $0
	xor a
	call OverworldLoop
.Quit
	ret

Func_814f: ; 814f
	ret

Func_8150: ; 8150
	ret

INCLUDE "engine/map/overworld_loop.asm"
INCLUDE "engine/map/load_map.asm"
INCLUDE "engine/map/load_tiles.asm"

Func_8b30: ; 8b30 (2:4b30)
	ld bc, $0
Func_8b33: ; 8b33 (2:4b33)
	ld l, c
	ld h, b
	ld de, $70
	call CompareHLtoDE
	jp nc, Func_8ba7
	ld l, c
	ld h, b
	add hl, hl
	reg16swap de, hl
	read_hl_from wc85d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	check_cgb
	jp nz, Func_8b7e
	push bc
	ld a, BANK(MapTiles_CGB)
	ld [wFarCallDestBank], a
	reg16swap de, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MapTiles_CGB
	add hl, de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
	jp Func_8ba3

Func_8b7e: ; 8b7e (2:4b7e)
	push bc
	ld a, BANK(MapTiles_SGB_DMG)
	ld [wFarCallDestBank], a
	reg16swap de, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MapTiles_SGB_DMG
	add hl, de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
Func_8ba3: ; 8ba3 (2:4ba3)
	inc bc
	jp Func_8b33

Func_8ba7: ; 8ba7 (2:4ba7)
	ret

FadeInMap:: ; 8ba8
	push af
	push bc
	call Func_b6f2
	ld a, [wMapX]
	add a
	add a
	add a
	add a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wMapY]
	add a
	add a
	add a
	add a
	ld [wSCY2], a
	ld [wSCY], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	xor a
	call Func_bbc8
	call Func_8b30
	ld hl, sp+$0
	ld [hl], $0
Func_8bdc: ; 8bdc (2:4bdc)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, wNumPeopleLoaded
	cp [hl]
	jp nc, Func_8c16
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
	ld de, $6
	add hl, de
	ld a, [hl]
	or $80
	ld e, a
	ld hl, sp+$0
	ld a, [hl]
	call ChangePersonFacing
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_8bdc

Func_8c16: ; 8c16 (2:4c16)
	call GetPlayerSprite
	ld a, [wSongCurrentlyPlaying]
	ld hl, wMapMusic
	cp [hl]
	jp z, Func_8c29
	ld a, [wMapMusic]
	call OverworldPlaySong
Func_8c29: ; 8c29 (2:4c29)
	ld a, [wc7da]
	or a
	jp nz, Func_8c65
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_8c57
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	jp Func_8c5f

Func_8c57: ; 8c57 (2:4c57)
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdatePlayerSprite
Func_8c5f: ; 8c5f (2:4c5f)
	call Func_b65f
	jp Func_8cc8

Func_8c65: ; 8c65 (2:4c65)
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_8c8c
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	jp Func_8c94

Func_8c8c: ; 8c8c (2:4c8c)
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdatePlayerSprite
Func_8c94: ; 8c94 (2:4c94)
	check_cgb
	jp z, Func_8cc1
	set_farcall_addrs_hli Func_c7bd0
	ld a, [wc867]
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_8cc1: ; 8cc1 (2:4cc1)
	ld e, $fe
	ld a, $fe
	call Func_b60d
Func_8cc8: ; 8cc8 (2:4cc8)
	pop bc
	pop bc
	ret

Data_8ccb: ; 8ccb
	db $18, $0c, $00, $0c

GetPlayerSprite: ; 8ccf (2:4ccf)
	call Bank2_WaitVideoTransferIfLCDEnabled
	ld hl, Data_8ccb
	ld a, [wPlayerFacing]
	cp $ff
	jp nz, Func_8ce3
	ld de, $2
	jp Func_8ce9

Func_8ce3: ; 8ce3 (2:4ce3)
	ld a, [wPlayerFacing]
	ld e, a
	ld d, $0
Func_8ce9: ; 8ce9 (2:4ce9)
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wPlayerSpritePointer
	add hl, de
	reg16swap de, hl
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	call Bank2_WaitVideoTransferIfLCDEnabled
	ret

Func_8d0c: ; 8d0c (2:4d0c)
	push bc
	push de
	push hl
	ld b, $0
.asm_8d11
	ld a, [hli]
	ld c, a
	push hl
	ld a, [wc844]
	ld l, a
	ld a, [wc844 + 1]
	ld h, a
	add hl, bc
	ld a, $1
	ld [hl], a
	pop hl
	dec de
	ld a, e
	or d
	jr nz, .asm_8d11
	pop hl
	pop de
	pop bc
	ret

LoadBlockData: ; 8d2a (2:4d2a)
	push bc
	push bc
	push bc
	push af
	ld a, BANK(BlockDataHeaders)
	ld [wFarCallDestBank], a
	pop af
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, BlockDataHeaders
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$6
	ld a, [hl]
	ld [wMapWidth], a
	ld hl, sp+$5
	ld a, [hl]
	ld [wMapHeight], a
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	push hl
	call malloc_Bank02
	write_hl_to wBlockdataPointer
	ld hl, sp+$4
	ld a, [hl]
	add BANK(BlockDataHeaders)
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld c, l
	ld b, h
	read_hl_from wBlockdataPointer
	push hl
	call GetHLAtSPPlus9
	pop de
	call FarDecompressVideoData
	ld bc, $80
	ld e, $0
	read_hl_from wc844
	call FillMemory
	read_hl_from wBlockdataPointer
	ld c, l
	ld b, h
	pop hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	call Func_8d0c
	pop af
	cp $24
	jp z, Func_8dbd
	cp $8f
	jp z, Func_8dbd
	read_hl_from wc844
	ld a, [wc859]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $1
Func_8dbd: ; 8dbd (2:4dbd)
	read_hl_from wc844
	ld [hl], $1
	pop bc
	pop bc
	pop bc
	ret

MoveEmote_:: ; 8dc8
	ld a, $50
	ld hl, wSCX
	sub [hl]
	ld l, a
	ld a, [wc832]
	add a
	add a
	add a
	add a
	add l
	add $10
	ld [wc2cb], a
	ld a, $50
	ld hl, wSCY
	sub [hl]
	ld l, a
	ld a, [wc833]
	add a
	add a
	add a
	add a
	add l
	add $8
	ld [wc2cc], a
	ret

Func_8df1: ; 8df1 (2:4df1)
MACRO del_if_defined
	read_hl_from \1
	ld a, l
	or h
	jp z, .okay_\@
	del \1
.okay_\@
	ENDM

	del_if_defined wc85d
	del_if_defined wc824
	del_if_defined wLoadAttrsSourcePointer
	del_if_defined wc826
	del_if_defined wBlockdataPointer
	del_if_defined wMapCollisionPointer
	del_if_defined wPlayerSpritePointer
	del_if_defined wc82c
	del_if_defined wc82e
	del_if_defined wWarpDataPointer
	del_if_defined wNPCMovementDataPointer
	del_if_defined wObjectStructPointer
	del_if_defined wc776
	ret

Func_8f44:: ; 8f44 (2:4f44)
; bgmap transfer?
	add sp, -$30
	ldh a, [rLCDC]
	and $80
	jp nz, .lcd_enabled
	jp .quit

.lcd_enabled
	ld a, [wOverworldTilemapSelector]
	or a
	jp z, .bgmap_9c00
	ld a, $98
	jp .got_bgmap_hi

.bgmap_9c00
	ld a, $9c
.got_bgmap_hi
	ld [wBGMapHi], a
	ld a, $1
	call Func_bbc8
	ld e, $0
.loop
	ld a, e
	cp $b
	jp nc, .check_attr
	ld l, $0
.loop2
	ld a, l
	cp $c
	jp nc, .next_row
	push de
	push hl
	ld a, [wMapY]
	add e
	dec a
	ld e, a
	ld a, [wMapX]
	add l
	dec a
	call Func_9eb4
	ld c, l
	ld b, h
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$5
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1c
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1d
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	inc l
	pop de
	jp .loop2

.next_row
	push de
	call Bank2_WaitVideoTransferIfLCDEnabled
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$2
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1e
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$1a
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1f
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop de
	inc e
	jp .loop

.check_attr
	check_cgb
	jp nz, .skip_attr
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	ld e, $0
.attr_loop
	ld a, e
	cp $b
	jp nc, .done_attr
	ld l, $0
.attr_loop2
	ld a, l
	cp $c
	jp nc, .attr_next_row
	push de
	push hl
	ld a, [wMapY]
	add e
	dec a
	ld e, a
	ld a, [wMapX]
	add l
	dec a
	call Func_9f1e
	ld c, l
	ld b, h
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$5
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1c
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	push hl
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1d
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop hl
	inc l
	pop de
	jp .attr_loop2

.attr_next_row
	push de
	call Bank2_WaitVideoTransferIfLCDEnabled
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$2
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1e
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	set_farcall_addrs_hli Func_6193
	pop de
	push de
	ld hl, sp+$1a
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, $1e1f
	add hl, de
	pop de
	ld bc, $1801
	call FarCall
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop de
	inc e
	jp .attr_loop

.done_attr
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
.skip_attr
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, .set_bgmap_9800
	ld a, $1
	jp .swap_bgmap

.set_bgmap_9800
	xor a
.swap_bgmap
	call ToggleBGMapSelect
.quit
	add sp, $30
	ret

INCLUDE "engine/map/handle_map.asm"

Func_9430: ; 9430
	callba_hli Func_17e91
	ret

INCLUDE "engine/player_step.asm"

Func_99e2: ; 99e2
	ret

CheckMovingOffEdgeOfMap: ; 99e3 (2:59e3)
	cp $3
	jp z, .check_left
	cp $2
	jp z, .check_down
	cp $1
	jp z, .check_right
	or a
	jp nz, .not_edge
	ld a, [wMapY]
	and $80
	jp z, .not_edge_up
	ld a, [wMapY]
	cpl
	inc a
	cp $4
	jp c, .not_edge_up
	ld a, $ff
	ret

.not_edge_up
	jp .not_edge

.check_right
	ld a, [wMapX]
	add $6
	ld hl, wMapWidth
	cp [hl]
	jp c, .not_edge_right
	ld a, $ff
	ret

.not_edge_right
	jp .not_edge

.check_down
	ld a, [wMapY]
	add $5
	ld hl, wMapHeight
	cp [hl]
	jp c, .not_edge_down
	ld a, $ff
	ret

.not_edge_down
	jp .not_edge

.check_left
	ld a, [wMapX]
	and $80
	jp z, .not_edge
	ld a, [wMapX]
	cpl
	inc a
	cp $5
	jp c, .not_edge
	ld a, $ff
	ret

.not_edge
	xor a
	ret

INCLUDE "engine/map/func_94a9.asm"

UpdatePlayerSprite: ; 9d80 (2:5d80)
	push hl
	ld h, a
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_9d8f
	ld a, [wPlayerFacing]
	pop hl
	jr .got_facing

.asm_9d8f
	ld a, h
	pop hl
.got_facing
	push af
	ld a, [wc841]
	ld a, [wc841]
	or a
	jp z, .bail
	ld a, e
	or a
	jr nz, .asm_9da4
	xor a
	ld [wCurrentDirectionalInputHeldFramesCounter], a
.asm_9da4
	ld a, [wSliding]
	cp $1
	jr nz, .asm_9db0
	xor a
	ld [wCurrentDirectionalInputHeldFramesCounter], a
	ld e, a
.asm_9db0
	ld a, [wCurrentDirectionalInputHeldFramesCounter]
	srl a
	srl a
	srl a
	and $3
	ld hl, Data_9ead
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld b, a
	ld hl, wOAM00YCoord
	lb de, $58, $4c
	ld a, [wPlayerSpriteNotCenteredOnScreen]
	cp $1
	jr nz, .asm_9de1
	ld d, $58
	ld a, [wPlayerSpriteXOffset]
	add d
	ld d, a
	ld e, $4c
	ld a, [wPlayerSpriteYOffset]
	add e
	ld e, a
	ld b, $0
.asm_9de1
	pop af
	cp $1
	jr z, .asm_9e41
	ld c, $10 ; palette 0, sgb palette 0
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	push de
	push hl
	ld hl, $0
	push bc
	call Func_9f4c
	pop bc
	push af
	ld hl, wc826
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld h, $0
	ld l, a
	add hl, de
	ld a, [hl]
	and $4
	jr z, .asm_9e23
	ld a, c
	or $80
	ld c, a
.asm_9e23
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wCurrentDirectionalInputHeldFramesCounter]
	inc a
	ld [wCurrentDirectionalInputHeldFramesCounter], a
	ret

.asm_9e41
	ld c, $30
	ld a, d
	add $8
	ld d, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	push de
	push hl
	ld hl, $0
	push bc
	call Func_9f4c
	pop bc
	push af
	ld hl, wc826
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld h, $0
	ld l, a
	add hl, de
	ld a, [hl]
	and $4
	jr z, .asm_9e82
	ld a, c
	or $80
	ld c, a
.asm_9e82
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $f8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wCurrentDirectionalInputHeldFramesCounter]
	inc a
	ld [wCurrentDirectionalInputHeldFramesCounter], a
	ret

.bail: ; 9ea0 (2:5ea0)
	pop af
	ld hl, wOAM00YCoord
	ld b, $10
	ld a, $ff
.asm_9ea8
	ld [hli], a
	dec b
	jr nz, .asm_9ea8
	ret

Data_9ead: ; 9ead
	db $00, $04, $00, $08

Func_9eb1:
	ret

Func_9eb2:
	ret

Func_9eb3:
	ret

Func_9eb4: ; 9eb4 (2:5eb4)
	push af
	ld hl, sp+$1
	ld a, [hl]
	ld hl, wMapWidth
	cp [hl]
	jp nc, Func_9ec7
	ld a, e
	ld hl, wMapHeight
	cp [hl]
	jp c, Func_9ecb
Func_9ec7: ; 9ec7 (2:5ec7)
	xor a
	jp Func_9ed1

Func_9ecb: ; 9ecb (2:5ecb)
	ld hl, sp+$1
	ld a, [hl]
	call Func_9f64
Func_9ed1: ; 9ed1 (2:5ed1)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wLoadAttrsSourcePointer
	add hl, de
	pop bc
	ret

Func_9ee2: ; 9ee2 (2:5ee2)
	ld hl, wMapWidth
	cp [hl]
	jp nc, Func_9ef1
	ld a, e
	ld hl, wMapHeight
	cp [hl]
	jp c, Func_9ef5
Func_9ef1: ; 9ef1 (2:5ef1)
	xor a
	jp Func_9efa

Func_9ef5: ; 9ef5 (2:5ef5)
	ld l, c
	ld h, b
	call Func_9f4c
Func_9efa: ; 9efa (2:5efa)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc824
	add hl, de
	write_hl_to wc91d
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wLoadAttrsSourcePointer
	add hl, de
	ret

Func_9f1e: ; 9f1e (2:5f1e)
	push af
	ld hl, sp+$1
	ld a, [hl]
	ld hl, wMapWidth
	cp [hl]
	jp nc, Func_9f31
	ld a, e
	ld hl, wMapHeight
	cp [hl]
	jp c, Func_9f35
Func_9f31: ; 9f31 (2:5f31)
	xor a
	jp Func_9f3b

Func_9f35: ; 9f35 (2:5f35)
	ld hl, sp+$1
	ld a, [hl]
	call Func_9f64
Func_9f3b: ; 9f3b (2:5f3b)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc824
	add hl, de
	pop bc
	ret

Func_9f4c: ; 9f4c (2:5f4c)
	push hl
	pop hl
	push hl
	push hl
	read_hl_from wPlayerStandingTileOffset
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	pop bc
	ret

Func_9f64:: ; 9f64 (2:5f64)
	push af
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	pop bc
	ret

INCLUDE "engine/map/collision_test.asm"

Func_a184: ; a184 (2:6184)
	push af
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wLoadAttrsSourcePointer
	add hl, de
	ld a, [hl]
	add $70
	ld [wc81f], a
	xor a
	ld [wc820], a
	ld hl, $30
	call malloc_Bank02
	write_hl_to wc82c
	ld c, $0
Func_a1ad: ; a1ad (2:61ad)
	ld a, c
	cp $3
	jp nc, Func_a1f8
	push bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wLoadAttrsSourcePointer
	add hl, de
	ld e, c
	ld d, $0
	inc de
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, BANK(MapTiles_SGB_DMG)
	ld [wFarCallDestBank], a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc82c
	add hl, de
	pop de
	ld bc, $10
	call FarRequestVideoData
	pop bc
	inc c
	jp Func_a1ad

Func_a1f8: ; a1f8 (2:61f8)
	pop bc
	ret

Func_a1fa: ; a1fa (2:61fa)
	ld a, [wc81f]
	cp $ff
	jp nz, Func_a203
	ret

Func_a203: ; a203 (2:6203)
	ld a, [wc820]
	inc a
	ld [wc820], a
	cp $18
	jp nz, Func_a213
	xor a
	ld [wc820], a
Func_a213: ; a213 (2:6213)
	ld a, [wc820]
	and $7
	jp z, Func_a21c
	ret

Func_a21c: ; a21c (2:621c)
	ld a, [wc820]
	rrca
	rrca
	rrca
	and $1f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc82c
	add hl, de
	push hl
	ld hl, wc81f
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8900
	add hl, de
	pop de
	ld bc, $10
	call RequestVideoData
	ret

INCLUDE "engine/map/people.asm"
INCLUDE "engine/event_flags.asm"
INCLUDE "engine/map/text.asm"
INCLUDE "engine/map/warps.asm"

Data_ae3d: ; ae3d
	db $01, $01, $00, $ff, $ff, $ff, $00, $01

Data_ae45: ; ae45
	db $00, $01, $01, $01, $00, $ff, $ff, $ff

Func_ae4d:: ; ae4d
	push bc
	push bc
	push bc
	push bc
	ld c, $c1
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call CheckBackgroundCollision
	cp $ff
	jp nz, Func_aef5
	ld hl, sp+$2
	ld [hl], $0
Func_ae66: ; ae66 (2:6e66)
	ld hl, sp+$2
	ld a, [hl]
	cp $9
	jp nc, Func_aeaa
	ld a, [wPlayerMapX]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, Data_ae3d
	add hl, de
	add [hl]
	ld hl, sp+$1
	ld [hl], a
	ld a, [wPlayerMapY]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, Data_ae45
	add hl, de
	add [hl]
	ld hl, sp+$0
	ld [hl], a
	ld c, $81
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	call CheckBackgroundCollision
	or a
	jp nz, Func_aea0
	jp Func_aeaa

Func_aea0: ; aea0 (2:6ea0)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_ae66

Func_aeaa: ; aeaa (2:6eaa)
	ld hl, sp+$2
	ld a, [hl]
	cp $9
	jp z, Func_aef5
	ld hl, sp+$1
	ld a, [hl]
	add $fb
	ld [wMapX], a
	ld hl, sp+$0
	ld a, [hl]
	add $fc
	ld [wMapY], a
	ld hl, sp+$1
	ld a, [hl]
	ld [wPlayerMapX], a
	ld hl, sp+$0
	ld a, [hl]
	ld [wPlayerMapY], a
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, [wPlayerMapY]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [wPlayerMapX]
	ld e, a
	ld d, $0
	add hl, de
	write_hl_to wPlayerStandingTileOffset
	ld hl, sp+$1
	ld a, [hl]
	ld [wSpawnPushX], a
	ld hl, sp+$0
	ld a, [hl]
	ld [wSpawnPushY], a
Func_aef5: ; aef5 (2:6ef5)
	ld hl, sp+$3
	ld a, [wSpawnPushX]
	ld [hl], a
	ld hl, sp+$4
	ld a, [wSpawnPushY]
	ld [hl], a
	ld hl, sp+$6
	ld a, $ff
	ld [hl], a
	ld hl, sp+$5
	ld [hl], a
	ld a, [wc7da]
	or a
	jp nz, Func_af33
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	call Func_b65f
	jp Func_af68

Func_af33: ; af33 (2:6f33)
	callba_hli Func_9a41d
	ld a, $1
	call Func_bbc8
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	set_farcall_addrs_hli Func_c7bd0
	ld a, [wc867]
	call FarCall
	ld e, $fe
	ld a, $fe
	call Func_b60d
Func_af68: ; af68 (2:6f68)
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld a, $2
	call StartMovement
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_af7a:: ; af7a
	push hl
	push bc
	push de
	call GetHLAtSPPlus6
	ld e, h
	ld hl, sp+$2
	ld [hl], e
	call GetHLAtSPPlus6
	ld a, l
	pop de
	push af
	ld c, d
	ld a, [wMapGroup]
	ld [wBackupMapGroup], a
	ld a, [wMapNumber]
	ld [wBackupMapNumber], a
	ld a, [wPlayerMapX]
	ld [wBackupMapX], a
	ld a, [wPlayerMapY]
	ld [wBackupMapY], a
	ld a, c
	ld [wSpawnPushX], a
	ld [wSpawnX], a
	ld a, e
	ld [wSpawnPushY], a
	ld [wSpawnY], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wMapGroup], a
	pop af
	ld [wMapNumber], a
	ld a, c
	add $fb
	ld [wMapX], a
	ld a, e
	add $fc
	ld [wMapY], a
	ld a, c
	ld [wPlayerMapX], a
	ld a, e
	ld [wPlayerMapY], a
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, [wPlayerMapY]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [wPlayerMapX]
	ld e, a
	ld d, $0
	add hl, de
	write_hl_to wPlayerStandingTileOffset
	xor a
	ld [wRemainInMap], a
	pop bc
	pop bc
	ret

INCLUDE "engine/map/engine_aff1.asm"
INCLUDE "engine/map/scripted_movement.asm"

Func_b52c:: ; b52c (2:752c)
	ld [wc841], a
	ret

SpawnPlayerAt:: ; b530 (2:7530)
; spawn player at (a, e)
	push af
	add -5
	ld [wMapX], a
	ld a, e
	add -4
	ld [wMapY], a
	pop af
	ld [wPlayerMapX], a
	ld a, e
	ld [wPlayerMapY], a
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, [wPlayerMapY]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld a, [wPlayerMapX]
	ld e, a
	ld d, $0
	add hl, de
	write_hl_to wPlayerStandingTileOffset
	ld a, [wMapX]
	add a
	add a
	add a
	add a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wMapY]
	add a
	add a
	add a
	add a
	ld [wSCY2], a
	ld [wSCY], a
	di
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	ei
	call MoveEmote_
	call Func_8f44
	ret

Data_b58a: ; b58a
	db $18, $0c, $00, $0c

Func_b58e:: ; b58e
	push bc
	push bc
	push af
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_b58a
	ld bc, $4
	call MemCopy
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wPlayerSpritePointer
	add hl, de
	push hl
	ld e, $0
	ld c, $0
	call UpdateSprites
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop de
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	pop af
	ld [wPlayerFacing], a
	ld [wLastPlayerFacing], a
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop bc
	pop bc
	ret

Func_b5db:: ; b5db
	push hl
	ld bc, $0
.loop
	pop hl
	push hl
	reg16swap de, hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, .done
	push bc
	call NextOverworldFrame
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call UpdateSprites
	call HandleNPCStep
	pop bc
	inc bc
	jp .loop

.done
	pop bc
	ret

Data_b605: ; b605
	db $00, $40, $90, $e4

Data_b609: ; b609
	db $00, $40, $90, $e0

Func_b60d: ; b60d (2:760d)
	push af
	check_cgb
	jp nz, Func_b646
	ld hl, sp+$1
	ld a, [hl]
	cp $fe
	jp nz, Func_b632
	set_farcall_addrs_hli MapFadeInCGB
	ld e, $1
	xor a
	call FarCall
	jp Func_b643

Func_b632: ; b632 (2:7632)
	set_farcall_addrs_hli MapFadeOutCGB
	ld e, $0
	xor a
	call FarCall
Func_b643: ; b643 (2:7643)
	jp Func_b65d

Func_b646: ; b646 (2:7646)
	ld hl, sp+$1
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, e
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
Func_b65d: ; b65d (2:765d)
	pop bc
	ret

Func_b65f:: ; b65f (2:765f)
	check_cgb
	jp nz, Func_b67c
	set_farcall_addrs_hli MapFadeInCGB
	ld e, $0
	ld a, $1
	call FarCall
	jp Func_b6f1

Func_b67c: ; b67c (2:767c)
	set_farcall_addrs_hli Func_c7bd0
	ld a, [wc867]
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	ld c, $0
Func_b6a2: ; b6a2 (2:76a2)
	ld a, c
	cp $4
	jp nc, Func_b6e2
	push bc
	xor a
Func_b6aa: ; b6aa (2:76aa)
	cp $4
	jp nc, Func_b6b8
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_b6aa

Func_b6b8: ; b6b8 (2:76b8)
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, Data_b605
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld e, c
	ld d, $0
	ld hl, Data_b609
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	pop bc
	inc c
	jp Func_b6a2

Func_b6e2: ; b6e2 (2:76e2)
	xor a
Func_b6e3: ; b6e3 (2:76e3)
	cp $4
	jp nc, Func_b6f1
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_b6e3

Func_b6f1: ; b6f1 (2:76f1)
	ret

Func_b6f2:: ; b6f2 (2:76f2)
	check_cgb
	jp nz, Func_b70f
	set_farcall_addrs_hli MapFadeOutCGB
	ld e, $0
	ld a, $1
	call FarCall
	jp Func_b772

Func_b70f: ; b70f (2:770f)
	ld c, $0
Func_b711: ; b711 (2:7711)
	ld a, c
	cp $4
	jp nc, Func_b763
	push bc
	xor a
Func_b719: ; b719 (2:7719)
	cp $4
	jp nc, Func_b727
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_b719

Func_b727: ; b727 (2:7727)
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, $3
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, Data_b605
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld e, c
	ld d, $0
	ld hl, $3
	ld a, l
	sub e
	ld e, a
	ld a, h
	sbc d
	ld d, a
	ld hl, Data_b609
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	pop bc
	inc c
	jp Func_b711

Func_b763: ; b763 (2:7763)
	xor a
Func_b764: ; b764 (2:7764)
	cp $4
	jp nc, Func_b772
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_b764

Func_b772: ; b772 (2:7772)
	ret

INCLUDE "engine/random_encounter.asm"

Func_bb37: ; bb37
	inc e
	dec e
	jp nz, Func_bba9
	push af
	ld a, $1c
	ld [wMapMusic], a
	ld a, [wMapMusic]
	call OverworldPlaySong
	ld c, $2
	ld e, $e
	ld hl, 999
	call DrawTextBoxAndOverworldText
	ld a, $2
	ld [wPlayerFacing], a
	ld a, $1
	ld [wc7e2], a
	ld de, $100d
	ld hl, $0
	call Func_af7a
	pop af
	cp $1
	jp nz, Func_bba6
	xor a
Func_bb6c: ; bb6c (2:7b6c)
	cp $4
	jp nc, Func_bba6
	push af
	set_farcall_addrs_hli Func_6b94
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_6b94
	pop af
	push af
	ld e, a
	ld d, $0
	inc d
	inc d
	inc d
	ld hl, $0
	call FarCall
	pop af
	inc a
	jp Func_bb6c

Func_bba6: ; bba6 (2:7ba6)
	jp Func_bbc7

Func_bba9: ; bba9 (2:7ba9)
	ld a, $1c
	ld [wMapMusic], a
	ld a, [wMapMusic]
	call OverworldPlaySong
	ld a, $2
	ld [wPlayerFacing], a
	ld a, $1
	ld [wc7e2], a
	ld de, $100d
	ld hl, $0
	call Func_af7a
Func_bbc7: ; bbc7 (2:7bc7)
	ret

Func_bbc8: ; bbc8 (2:7bc8)
	push af
	ldh a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, Func_bbe7
	ld a, l
	and $7f
	call FarCall
	jp Func_bbed

Func_bbe7: ; bbe7 (2:7be7)
	ld a, l
	or $80
	call FarCall
Func_bbed: ; bbed (2:7bed)
	ret

INCLUDE "battle/wrapper.asm"

Func_bc6d:: ; bc6d
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	read_hl_from_sp_plus $26
	reg16swap de, hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli AllocateMonsterStruct
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call LoadEnemyData
	xor a
	ld [wInBattle], a
	xor a
	ld [wc7c4], a
	set_farcall_addrs_hli Func_10abf
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bcd1
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call DrawTextBoxAndOverworldText
	cp $1
	jp nz, Func_bcd1
	ld e, $1
	xor a
	call Func_bb37
	ld a, $1
	ld [wc7c4], a
Func_bcd1: ; bcd1 (2:7cd1)
	callba_hli FreeMonsterStruct
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bce5:: ; bce5
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	read_hl_from_sp_plus $26
	reg16swap de, hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli AllocateMonsterStruct
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call LoadEnemyData
	xor a
	ld [wInBattle], a
	xor a
	ld [wc7c4], a
	set_farcall_addrs_hli Func_6c5bb
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bd49
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call DrawTextBoxAndOverworldText
	cp $1
	jp nz, Func_bd49
	ld e, $2
	xor a
	call Func_bb37
	ld a, $1
	ld [wc7c4], a
Func_bd49: ; bd49 (2:7d49)
	callba_hli FreeMonsterStruct
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bd5d:: ; bd5d
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	read_hl_from_sp_plus $26
	reg16swap de, hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli AllocateMonsterStruct
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call LoadEnemyData
	xor a
	ld [wInBattle], a
	xor a
	ld [wc7c4], a
	set_farcall_addrs_hli Func_1228e
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_bdc1
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call DrawTextBoxAndOverworldText
	cp $1
	jp nz, Func_bdc1
	ld e, $3
	xor a
	call Func_bb37
	ld a, $1
	ld [wc7c4], a
Func_bdc1: ; bdc1 (2:7dc1)
	callba_hli FreeMonsterStruct
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

Func_bdd5:: ; bdd5
	push bc
	add sp, -$20
	push de
	push af
	ld c, a
	read_hl_from_sp_plus $26
	reg16swap de, hl
	ld hl, sp+$5
	call FarCopyUntilNull
	callba_hli AllocateMonsterStruct
	pop af
	pop de
	ld hl, sp+$1
	ld c, l
	ld b, h
	call LoadEnemyData
	xor a
	ld [wInBattle], a
	xor a
	ld [wc7c4], a
	set_farcall_addrs_hli Func_6d395
	xor a
	call FarCall
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	cp $1
	jp nz, Func_be39
	ld c, $3
	ld e, $e
	ld hl, $7ce
	call DrawTextBoxAndOverworldText
	cp $1
	jp nz, Func_be39
	ld e, $4
	xor a
	call Func_bb37
	ld a, $1
	ld [wc7c4], a
Func_be39: ; be39 (2:7e39)
	callba_hli FreeMonsterStruct
	ld hl, sp+$0
	ld a, [hl]
	add sp, $22
	ret

malloc_Bank02: ; be4d (2:7e4d)
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	jp FarCall

free_Bank02: ; be5d (2:7e5d)
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Data_be6e: ; be6e
	db $17, $17, $18, $11, $13

Data_be73: ; be73
	db $18, $c, $0, $c

LoadPlayerSprite:: ; be77 (2:7e77)
	push af
	ld de, $240
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, .already_allocated
	reg16swap de, hl
	call malloc_Bank02
	write_hl_to wPlayerSpritePointer
	ld hl, sp+$1
	ld [hl], $1
	jp .get_graphics

.already_allocated
	ld a, [wPlayerState]
	ld hl, sp+$1
	cp [hl]
	jp nz, .get_graphics
	jp .quit

.get_graphics
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_be6e
	add hl, de
	ld l, [hl]
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
	reg16swap de, hl
	read_hl_from wPlayerSpritePointer
	ld bc, $240
	call FarCopyVideoData
	ld hl, wPlayerFacing
	ld l, [hl]
	ld h, $0
	ld de, Data_be73
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wPlayerSpritePointer
	add hl, de
	push hl
	call Bank2_WaitVideoTransferIfLCDEnabled
	pop de
	ld hl, $8000
	ld bc, $c0
	call RequestVideoData
	call Bank2_WaitVideoTransferIfLCDEnabled
	ld hl, sp+$1
	ld a, [hl]
	ld [wPlayerState], a
.quit
	pop bc
	ret

Func_bf05: ; bf05 (2:7f05)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_bf12: ; bf12 (2:7f12)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_bf1f: ; bf1f
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Func_bf2c: ; bf2c (2:7f2c)
	xor a
	ld [wc851], a
	ld hl, $0
	write_hl_to wc852
	ret

Func_bf39:: ; bf39
	ld [wc851], a
	reg16swap de, hl
	write_hl_to wc852
	ret

Func_bf46:: ; bf46 (2:7f46)
	ld [wSlipperyCollision], a
	ret

CheckBlackedOut: ; bf4a (2:7f4a)
	add sp, -$24
	ld c, $0
	ld e, $0
.loop: ; bf50 (2:7f50)
	ld a, e
	cp $4
	jp nc, .check_blackout
	push bc
	push de
	set_farcall_addrs_hli GetRobotInParty
	pop de
	push de
	ld a, e
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	pop de
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, .continue
	jp .next

.continue: ; bf7b (2:7f7b)
	push bc
	push de
	set_farcall_addrs_hli Func_6e1b
	pop de
	push de
	ld l, e
	ld h, $0
	call FarCall
	pop de
	pop bc
	ld a, l
	or h
	jp z, .next
	inc c
.next: ; bf98 (2:7f98)
	inc e
	jp .loop

.check_blackout: ; bf9c (2:7f9c)
	inc c
	dec c
	jp nz, .won
	ld a, $ff
	ld [wPlayerFacing], a
	ld a, $1
	jp .done

.won: ; bfab (2:7fab)
	xor a
.done: ; bfac (2:7fac)
	add sp, $24
	ret

Bank2_WaitVideoTransferIfLCDEnabled: ; bfaf (2:7faf)
	ldh a, [rLCDC]
	and $80
	jp z, Func_bfb9
	call WaitVideoTransfer
Func_bfb9: ; bfb9 (2:7fb9)
	ret


LoadMapTiles: ; 898a (2:498a)
	push bc
	push de
	push hl
	ld a, [wTilesetPointer]
	ld l, a
	ld a, [wTilesetPointer + 1]
	ld h, a
	ld bc, $2a8
	add hl, bc
	ld a, l
	ld [wLoadTilesSourcePointer], a
	ld a, h
	ld [wLoadTilesSourcePointer + 1], a
	xor a
	ld [wLoadTilesBlockCounter], a
	ld [wLoadTilesTileCounter], a
	ld [wLoadTilesTileCounter + 1], a
.loop
	ld a, [wLoadTilesTileCounter]
	ld l, a
	ld a, [wLoadTilesTileCounter + 1]
	ld h, a
	ld bc, $200
	ld a, h
	cp b
	jr c, .loop_okay
	ld a, l
	cp c
	jp nc, .quit
.loop_okay
	push hl
	srl h
	rr l
	srl h
	rr l
	ld a, [wc844]
	ld c, a
	ld a, [wc844 + 1]
	ld b, a
	add hl, bc
	ld a, [hl]
	cp $1
	pop hl
	jp nz, .attrOnly
	ld a, [wLoadTilesSourcePointer]
	ld c, a
	ld a, [wLoadTilesSourcePointer + 1]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wc88e], a
	ld a, [hli]
	ld b, a
	ld [wc88e + 1], a
	ld a, [wc842]
	ld l, a
	ld a, [wc842 + 1]
	ld h, a
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .noTile
	ld a, [wLoadTilesBlockCounter]
	cp $70
	jp nc, .quit
	ld [hl], a
	ld h, b
	ld l, c
	ld a, [wTilesetPointer]
	ld c, a
	ld a, [wTilesetPointer + 1]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wc88e], a
	ld a, [hli]
	ld b, a
	ld [wc88e + 1], a
	ld a, [wLoadTilesBlockCounter]
	ld l, a
	ld h, $0
	add hl, hl
	ld a, [wc85d]
	ld e, a
	ld a, [wc85d + 1]
	ld d, a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, [wSystemType]
	cp $11
	jr nz, .load_tile_cgb
	ld a, BANK(MapTiles_CGB)
	jr .got_bank

.load_tile_cgb
	ld a, BANK(MapTiles_SGB_DMG)
.got_bank
	ld [wFarCallDestBank], a
	ld h, b
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MapTiles_SGB_DMG
	add hl, de
	ld d, h
	ld e, l
	ld a, [wLoadTilesBlockCounter]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $8900
	add hl, bc
	ld bc, $10
	call FarCopyVideoData
	ld a, [wLoadTilesBlockCounter]
	inc a
	ld [wLoadTilesBlockCounter], a
	jr .getAttrParam

.noTile
	ld h, b
	ld l, c
	add hl, hl
	ld a, [wTilesetPointer]
	ld e, a
	ld a, [wTilesetPointer + 1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld c, a
	ld [wc88e], a
	ld a, [hli]
	ld b, a
	ld [wc88e + 1], a
.getAttrParam
	ld a, [wLoadTilesTileCounter]
	ld l, a
	ld a, [wLoadTilesTileCounter + 1]
	ld h, a
	add hl, hl
	ld a, [wLoadTilesSourcePointer]
	ld e, a
	ld a, [wLoadTilesSourcePointer + 1]
	ld d, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wc842]
	ld l, a
	ld a, [wc842 + 1]
	ld h, a
	add hl, de
	ld a, [hl]
	add $90
	ld [wc88b], a
	jr .loadAttr

.attrOnly
	ld a, [wLoadTilesTileCounter]
	ld l, a
	ld a, [wLoadTilesTileCounter + 1]
	ld h, a
	ld a, [wLoadTilesSourcePointer]
	ld c, a
	ld a, [wLoadTilesSourcePointer + 1]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wc88e], a
	ld a, [hli]
	ld b, a
	ld [wc88e + 1], a
	ld h, b
	ld l, c
	ld a, [wTilesetPointer]
	ld c, a
	ld a, [wTilesetPointer + 1]
	ld b, a
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wc88e], a
	ld a, [hli]
	ld b, a
	ld [wc88e + 1], a
	ld a, $fe
	ld a, [wc88b] ; whoops
.loadAttr
	ld a, [wLoadTilesTileCounter]
	ld c, a
	ld a, [wLoadTilesTileCounter + 1]
	ld b, a
	ld a, [wLoadAttrsSourcePointer]
	ld l, a
	ld a, [wLoadAttrsSourcePointer + 1]
	ld h, a
	add hl, bc
	ld a, [wc88b]
	ld [hl], a
	ld a, BANK(OverworldAttrMaps)
	ld [wFarCallDestBank], a
	ld a, [wc88e]
	ld l, a
	ld a, [wc88e + 1]
	ld h, a
	ld bc, OverworldAttrMaps
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wLoadTilesTileCounter]
	ld c, a
	ld a, [wLoadTilesTileCounter + 1]
	ld b, a
	ld a, [wc824]
	ld l, a
	ld a, [wc824 + 1]
	ld h, a
	add hl, bc
	ld bc, $1
	call FarCopyVideoData
	ld a, [wLoadTilesTileCounter]
	ld c, a
	ld a, [wLoadTilesTileCounter + 1]
	ld b, a
	inc bc
	ld a, c
	ld [wLoadTilesTileCounter], a
	ld a, b
	ld [wLoadTilesTileCounter + 1], a
	jp .loop

.quit
	pop hl
	pop de
	pop bc
	ret

UnloadWarps:: ; aca6 (2:6ca6)
	xor a
	ld [wNumWarps], a
	read_hl_from wWarpDataPointer
	ld a, l
	or h
	jp z, .unallocated
	read_hl_from wWarpDataPointer
	call FreeMemory_Bank02
.unallocated
	ld hl, 20 * 11
	call AllocateMemory_Bank02
	write_hl_to wWarpDataPointer
	ret

LoadWarp:: ; acc8
; arguments: 11-byte struct at hl
	push hl
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld l, [hl]
	ld h, $0
	add hl, bc
	pop de
	push hl
	xor a
.loop
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nc, .done
	push af
	ld c, $0
.loop2
	ld a, c
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nc, .next
	call GetHLAtSPPlus4
	ld e, c
	ld d, $0
	add hl, de
	ld a, $80
	or [hl]
	ld [hl], a
	inc c
	jp .loop2

.next
	call GetHLAtSPPlus4
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus4
	pop af
	inc a
	jp .loop

.done
	call GetHLAtSPPlus4
	push hl
	ld hl, wNumWarps
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wWarpDataPointer
	add hl, de
	pop de
	ld bc, $b
	call CopyFromDEtoHL
	ld a, [wNumWarps]
	inc a
	ld [wNumWarps], a
	pop bc
	pop bc
	ret

CheckWarpTile: ; ad56 (2:6d56)
	read_hl_from wPlayerStandingTileOffset
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	ld a, [hl]
	and $80
	jp nz, .getWarp
	xor a
	ret

.getWarp
	ld c, $0
.loop
	ld a, c
	ld hl, wNumWarps
	cp [hl]
	jp nc, .noWarp
	push bc
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wWarpDataPointer
	add hl, de
	reg16swap de, hl
	ld a, [de]
	ld [wCurWarpMinX], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld [wCurWarpMinY], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	ld [wCurWarpHDim], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wCurWarpVDim], a
	pop bc
	ld a, [wPlayerMapX]
	ld hl, wCurWarpMinX
	cp [hl]
	jp c, .nextWarp
	ld a, [wCurWarpMinX]
	ld hl, wCurWarpHDim
	add [hl]
	ld l, a
	ld a, [wPlayerMapX]
	cp l
	jp nc, .nextWarp
	ld a, [wPlayerMapY]
	ld hl, wCurWarpMinY
	cp [hl]
	jp c, .nextWarp
	ld a, [wCurWarpMinY]
	ld hl, wCurWarpVDim
	add [hl]
	ld l, a
	ld a, [wPlayerMapY]
	cp l
	jp nc, .nextWarp
	ld a, [wMapGroup]
	ld [wBackupMapGroup], a
	ld a, [wMapNumber]
	ld [wBackupMapNumber], a
	ld a, [wPlayerMapX]
	ld [wBackupMapX], a
	ld a, [wPlayerMapY]
	ld [wBackupMapY], a
	ld hl, $6
	add hl, de
	ld a, [hl]
	ld [wSpawnX], a
	ld hl, $7
	add hl, de
	ld a, [hl]
	ld [wSpawnY], a
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld [wc7e9], a
	ld hl, $9
	add hl, de
	ld a, [hl]
	ld [wc7ea], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wMapGroup], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld [wMapNumber], a
	ld a, $2e
	call OverworldPlaySFX
	xor a
	ld [wc84a], a
	ld a, $1
	ret

.nextWarp
	inc c
	jp .loop

.noWarp
	xor a
	ret

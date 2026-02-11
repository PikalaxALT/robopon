INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 1b", ROMX
Func_6c000:
	ret

Func_6c001:
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	jp FarCall

Func_6c011: ; 6c011 (1b:4011)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_6c011
	ret

Func_6c01c: ; 6c01c (1b:401c)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_6c030: ; 6c030 (1b:4030)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_6c044:
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, [wc319]
	cp $81
	jp nz, Func_6c062
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_6c030
	jp Func_6c070

Func_6c062: ; 6c062 (1b:4062)
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_6c01c
Func_6c070: ; 6c070 (1b:4070)
	pop bc
	ret

Func_6c072: ; 6c072 (1b:4072)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17975
	pop bc
	pop de
	pop hl
	jp FarCall

Func_6c086:
	ld c, $80
	jp Func_6c072

Func_6c08b: ; 6c08b (1b:408b)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_6c0a0: ; 6c0a0 (1b:40a0)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_6c08b
	ret

Func_6c0ab: ; 6c0ab (1b:40ab)
	push hl
	push de
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli PrintMapText_
	ld c, $a8
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	pop bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop bc
	ret

Func_6c102:
	push hl
	push de
	call Func_6c0a0
	pop de
	pop hl
	call Func_6c0ab
	ret

Data_6c10d:
	db $21, $01, $03, $1a, $04, $01, $0b, $08

Data_6c115:
	db $21, $01, $03, $1f, $04, $01, $0b, $08

Func_6c11d:: ; 6c11d (1b:411d)
	push af
	ld hl, -$114
	add hl, sp
	ld sp, hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $113
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $111
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld a, [hl]
	push af
	set_farcall_addrs_hli malloc ; has a crash check
	ld hl, $2d0
	call FarCall
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	call GetHLAtSPPlus4
	ld de, $168
	add hl, de
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call BackUpAttrMapRectangle
	pop af
	cp $b
	jp z, .set_equal_1
	cp $a
	jp z, .double
	cp $9
	jp nz, .okay
	ld hl, $115
	add hl, sp
	ld [hl], $5
	jp .okay

.double
	ld hl, $115
	add hl, sp
	ld a, [hl]
	add a
	ld hl, $115
	add hl, sp
	ld [hl], a
	jp .okay

.set_equal_1
	ld hl, $115
	add hl, sp
	ld [hl], $1
.okay
	xor a
.loop
	cp $a
	jp nc, .next
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$31
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fd
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp .loop

.next
	ld hl, $fa
	add hl, sp
	ld [hl], $0
	ld c, BANK(Text_200fd)
	ld hl, $fa
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fa
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fb
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_200fd
	call FarCopyUntilNull
	reg16swap de, hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call Func_6c086
	ld c, BANK(Text_20116)
	ld hl, $fa
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fa
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fb
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_20116
	call FarCopyUntilNull
	ld hl, $f9
	add hl, sp
	ld [hl], $0
Func_6c240: ; 6c240 (1b:4240)
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_6c2a9
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$e
	reg16swap de, hl
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $2d
	ld c, l
	ld b, h
	ld hl, sp+$e
	ld a, [hl]
	or a
	jp nz, Func_6c273
	jp Func_6c29b

Func_6c273: ; 6c273 (1b:4273)
	push bc
	ld hl, sp+$10
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$4
	call GetRobotBaseStats
	pop bc
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_6c295
	call GetHLAtSPPlus7
	reg16swap de, hl
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp c, Func_6c298
Func_6c295: ; 6c295 (1b:4295)
	jp Func_6c29b

Func_6c298: ; 6c298 (1b:4298)
	jp Func_6c2a9

Func_6c29b: ; 6c29b (1b:429b)
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $f9
	add hl, sp
	ld [hl], a
	jp Func_6c240

Func_6c2a9: ; 6c2a9 (1b:42a9)
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, Func_6c2d8
	ld c, BANK(Text_2015d)
	ld hl, $fa
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fa
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fb
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2015d
	call FarCopyUntilNull
Func_6c2d8: ; 6c2d8 (1b:42d8)
	ld hl, $fa
	add hl, sp
	ld e, [hl]
	ld hl, $fb
	add hl, sp
	call Func_6c102
	call Func_6c0a0
	ld hl, $f9
	add hl, sp
	ld a, [hl]
	cp $4
	jp c, Func_6c304
	set_farcall_addrs_hli free
	pop hl
	push hl
	call FarCall
	jp Func_6c534

Func_6c304: ; 6c304 (1b:4304)
	call Func_6c0a0
	ld de, Data_6c53a
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp z, Func_6c342
	set_farcall_addrs_hli free
	pop hl
	push hl
	call FarCall
	jp Func_6c534

Func_6c342: ; 6c342 (1b:4342)
	set_farcall_addrs_hli DisplayPartyMenu
	ld hl, $115
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld a, $3
	call FarCall
	push hl
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_6c37e
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_6c3a2
Func_6c37e: ; 6c37e (1b:437e)
	ld a, [wc316]
	or a
	jp nz, Func_6c391
	ld de, $8
	ld hl, Data_6c10d
	call Func_2b7d
	jp Func_6c3a2

Func_6c391: ; 6c391 (1b:4391)
	ld a, [wc316]
	cp $1
	jp nz, Func_6c3a2
	ld de, $8
	ld hl, Data_6c115
	call Func_2b7d
Func_6c3a2: ; 6c3a2 (1b:43a2)
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call RestoreTileMapRectangle
	call GetHLAtSPPlus4
	ld de, $168
	add hl, de
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call RestoreAttrMapRectangle
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	ld a, l
	and h
	inc a
	jp nz, Func_6c3fe
	jp Func_6c304

Func_6c3fe: ; 6c3fe (1b:43fe)
	set_farcall_addrs_hli free
	pop hl
	push hl
	call FarCall
	set_farcall_addrs_hli Func_6b94
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	reg16swap de, hl
	ld hl, $115
	add hl, sp
	ld l, [hl]
	ld h, $0
	call FarCall
	ld a, $1b
	ld [wFarCallDestAddr], a
	ld a, $6e
	ld [wFarCallDestAddr + 1], a
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$10
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$10
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$4
	call GetRobotBaseStats
	call GetHLAtSPPlus9
	reg16swap de, hl
	pop bc
	push de
	ld a, [wc2e9]
	read_hl_from_sp_plus $113
	ld de, $c6
	add hl, de
	cp [hl]
	jp nz, Func_6c491
	read_hl_from_sp_plus $115
	ld de, $29
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6c491: ; 6c491 (1b:4491)
	pop de
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_6c49d
	jp Func_6c534

Func_6c49d: ; 6c49d (1b:449d)
	push de
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$10
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	pop hl
	write_hl_to_sp_plus $2d
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$e
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, $fa
	add hl, sp
	ld [hl], $0
	ld hl, sp+$f
	push hl
	ld hl, $fc
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fc
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fd
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Func_6c102
	ld c, $8
	call FarCopyUntilNull
	ld c, $8
	ld hl, $fa
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $fa
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $fb
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Func_6c11d
	call FarCopyUntilNull
	ld hl, $fa
	add hl, sp
	ld e, [hl]
	ld hl, $fb
	add hl, sp
	call Func_6c102
Func_6c534: ; 6c534 (1b:4534)
	ld hl, $116
	add hl, sp
	ld sp, hl
	ret

Data_6c53a:
	dstr "(たへﾞさせますか?)"

Func_6c546:
	push hl
	ld bc, $a0
	ld e, $0
	ld hl, wOAM00YCoord
	call FillMemory
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_6c011
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	ld a, $28
	ldh [rLYC], a
	xor a
	ld [wHBlankMode], a
	xor a
	ld [wHBlankLYCPrimary], a
	ld a, $91
	ld [wHBlankLYCAlternate], a
	call EnableHBlank
	call Func_6c011
	call WaitVideoTransfer
	set_farcall_addrs_hli PlayBattleAnimScript
	pop hl
	call FarCall
	ld bc, $a0
	ld e, $0
	ld hl, wOAM00YCoord
	call FillMemory
	call DisableHBlank
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_6c011
	call WaitVideoTransfer
	ret

Func_6c5bb:: ; 6c5bb (1b:45bb)
	push af
	add sp, -$10
	ld hl, sp+$6
	xor a
	ld [hl], a
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$11
	ld a, [hl]
	cp $2
	jp nz, Func_6c5dc
	callba_hli Func_10766
	xor a
Func_6c5dc: ; 6c5dc (1b:45dc)
	ld hl, $0
	call WriteHLToSPPlus4
	pop de
	push hl
	ld hl, sp+$11
	ld a, [hl]
	cp $1
	jp nz, Func_6c600
	set_farcall_addrs_hli Func_105ce
	xor a
	call FarCall
	ld e, $1
	jp Func_6c610

Func_6c600: ; 6c600 (1b:4600)
	callba_hli Func_1028b
	ld e, $0
Func_6c610: ; 6c610 (1b:4610)
	push de
	ld a, SONG_PUNCH_MINIGAME
	call OverworldPlaySong
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli malloc
	ld hl, $80
	call FarCall
	write_hl_to_sp_plus $11
	ld hl, $80
	call FarCall
	write_hl_to_sp_plus $f
	ld hl, $80
	call FarCall
	write_hl_to_sp_plus $d
	ld hl, $200
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld hl, $80
	call FarCall
	pop bc
	push hl
	push bc
	ld bc, $80
	read_hl_from_sp_plus $15
	ld de, $9270
	call RequestVideoData
	call WaitVideoTransfer
	ld bc, $80
	read_hl_from_sp_plus $13
	ld de, $9340
	call RequestVideoData
	call WaitVideoTransfer
	ld bc, $80
	read_hl_from_sp_plus $11
	ld de, $9420
	call RequestVideoData
	call WaitVideoTransfer
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, $9520
	ld bc, $200
	call RequestVideoData
	call WaitVideoTransfer
	pop bc
	pop hl
	push bc
	push hl
	ld de, $9750
	ld bc, $80
	call RequestVideoData
	call WaitVideoTransfer
	ld a, BANK(GFX_58000)
	ld [wFarCallDestBank], a
	ld bc, $80
	ld de, GFX_58000
	ld hl, $9270
	call FarRequestVideoData
	ld a, BANK(GFX_58080)
	ld [wFarCallDestBank], a
	ld bc, $80
	ld de, GFX_58080
	ld hl, $9340
	call FarRequestVideoData
	ld a, BANK(GFX_58100)
	ld [wFarCallDestBank], a
	ld bc, $80
	ld de, GFX_58100
	ld hl, $9420
	call FarRequestVideoData
	ld a, BANK(GFX_58180)
	ld [wFarCallDestBank], a
	ld bc, $200
	ld de, GFX_58180
	ld hl, $9520
	call FarRequestVideoData
	ld a, BANK(GFX_58380)
	ld [wFarCallDestBank], a
	ld bc, $80
	ld de, GFX_58380
	ld hl, $9750
	call FarRequestVideoData
	pop hl
	pop bc
	pop de
	push bc
	push hl
Func_6c6fe: ; 6c6fe (1b:46fe)
	push de
	ld a, e
	call Func_6d167
	pop de
	push de
	ld hl, sp+$a
	call Func_6c8cf
	pop de
	push af
	push de
	callba_hli WaitAorBButtonOverworld_17a44
	pop de
	push de
	ld a, e
	cp $1
	jp nz, Func_6c726
	call Func_6c044
Func_6c726: ; 6c726 (1b:4726)
	pop de
	pop af
	push de
	or a
	jp nz, Func_6c74d
	read_hl_from_sp_plus $c
	push hl
	call GetHLAtSPPlus10
	pop de
	call CompareHLtoDE
	jp nc, Func_6c743
	read_hl_from_sp_plus $c
	call WriteHLToSPPlus8
Func_6c743: ; 6c743 (1b:4743)
	ld hl, sp+$d
	ld a, [hl]
	inc a
	ld hl, sp+$d
	ld [hl], a
	jp Func_6c770

Func_6c74d: ; 6c74d (1b:474d)
	cp $1
	jp nz, Func_6c770
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	pop de
	call CompareHLtoDE
	jp nc, Func_6c769
	read_hl_from_sp_plus $c
	call WriteHLToSPPlus10
Func_6c769: ; 6c769 (1b:4769)
	ld hl, sp+$c
	ld a, [hl]
	inc a
	ld hl, sp+$c
	ld [hl], a
Func_6c770: ; 6c770 (1b:4770)
	call FillVisibleAreaWithBlankTile
	pop de
	ld hl, sp+$b
	ld a, [hl]
	cp $2
	jp nz, Func_6c77f
	jp Func_6c78d

Func_6c77f: ; 6c77f (1b:477f)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nz, Func_6c78a
	jp Func_6c78d

Func_6c78a: ; 6c78a (1b:478a)
	jp Func_6c6fe

Func_6c78d: ; 6c78d (1b:478d)
	pop hl
	pop bc
	push de
	push hl
	push bc
	ld bc, $80
	read_hl_from_sp_plus $15
	reg16swap de, hl
	ld hl, $9270
	call FarRequestVideoData
	call WaitVideoTransfer
	ld bc, $80
	read_hl_from_sp_plus $13
	reg16swap de, hl
	ld hl, $9340
	call FarRequestVideoData
	call WaitVideoTransfer
	ld bc, $80
	read_hl_from_sp_plus $11
	reg16swap de, hl
	ld hl, $9420
	call FarRequestVideoData
	call WaitVideoTransfer
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, $9520
	ld bc, $200
	call FarRequestVideoData
	call WaitVideoTransfer
	pop bc
	pop hl
	push hl
	push bc
	reg16swap de, hl
	ld hl, $9750
	ld bc, $80
	call FarRequestVideoData
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $15
	call FarCall
	read_hl_from_sp_plus $13
	call FarCall
	read_hl_from_sp_plus $11
	call FarCall
	pop hl
	call FarCall
	pop hl
	call FarCall
	xor a
	ld [wPoncotPicAlignment], a
	ld hl, sp+$9
	ld a, [hl]
	cp $2
	jp nz, Func_6c833
	call GetHLAtSPPlus4
	call WriteHLToSPPlus8
	ld hl, sp+$a
	ld [hl], $0
	jp Func_6c83d

Func_6c833: ; 6c833 (1b:4833)
	call GetHLAtSPPlus6
	call WriteHLToSPPlus8
	ld hl, sp+$a
	ld [hl], $1
Func_6c83d: ; 6c83d (1b:483d)
	set_farcall_addrs_hli Func_107d7
	pop de
	push de
	ld c, e
	ld b, $0
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$a
	ld a, [hl]
	call FarCall
	pop de
	ld a, e
	cp $1
	jp nz, Func_6c864
	call Func_6c044
Func_6c864: ; 6c864 (1b:4864)
	ld hl, sp+$11
	ld a, [hl]
	cp $2
	jp nz, Func_6c87a
	callba_hli Func_107b8
Func_6c87a: ; 6c87a (1b:487a)
	ld hl, sp+$11
	ld a, [hl]
	or a
	jp nz, Func_6c88f
	ld hl, sp+$8
	ld a, [hl]
	cp $1
	jp nz, Func_6c88f
	ld hl, $1
	jp Func_6c8c4

Func_6c88f: ; 6c88f (1b:488f)
	ld hl, sp+$11
	ld a, [hl]
	cp $1
	jp nz, Func_6c8c1
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6c8ae
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	jp Func_6c8c4

Func_6c8ae: ; 6c8ae (1b:48ae)
	ld hl, sp+$8
	ld a, [hl]
	or a
	jp nz, Func_6c8bb
	ld hl, $1
	jp Func_6c8c4

Func_6c8bb: ; 6c8bb (1b:48bb)
	ld hl, $0
	jp Func_6c8c4

Func_6c8c1: ; 6c8c1 (1b:48c1)
	ld hl, $0
Func_6c8c4: ; 6c8c4 (1b:48c4)
	reg16swap de, hl
	add sp, $12
	reg16swap de, hl
	ret

Func_6c8cf: ; 6c8cf (1b:48cf)
	push hl
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$6
	ld [hl], $1
	ld hl, sp+$5
	ld [hl], $1
	ld hl, sp+$0
	xor a
	ld [hl], a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$1
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	or a
	jp nz, Func_6c8fd
	push bc
	ld hl, sp+$6
	ld [hl], $0
	call Func_6ca37
	ld hl, sp+$5
	ld [hl], a
	pop bc
	jp Func_6c917

Func_6c8fd: ; 6c8fd (1b:48fd)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6c911
	ld c, $0
	jp Func_6c913

Func_6c911: ; 6c911 (1b:4911)
	ld c, $1
Func_6c913: ; 6c913 (1b:4913)
	ld hl, sp+$4
	ld [hl], $0
Func_6c917: ; 6c917 (1b:4917)
	push bc
	ld hl, sp+$a
	ld c, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$8
	ld a, [hl]
	call Func_6d350
	ld l, $a
	push hl
	ld c, $4
	ld e, $0
	ld a, $d
	call PushBGMapRegion
	pop bc
	call GetJoyPressed
	and $10
	jp z, Func_6c943
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], $1
Func_6c943: ; 6c943 (1b:4943)
	pop bc
	ld hl, sp+$8
	ld a, [hl]
	or a
	jp nz, Func_6c99d
	push bc
	ld hl, sp+$2
	ld a, [hl]
	cp $15
	jp c, Func_6c983
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp z, Func_6c983
	ld hl, sp+$2
	ld a, [hl]
	cp $32
	jp nc, Func_6c983
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$5
	ld a, [hl]
	call Func_6ca8a
	cp $1
	jp nz, Func_6c979
	ld hl, sp+$4
	ld [hl], $1
	jp Func_6c980

Func_6c979: ; 6c979 (1b:4979)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_6c980: ; 6c980 (1b:4980)
	jp Func_6c999

Func_6c983: ; 6c983 (1b:4983)
	ld hl, sp+$2
	ld a, [hl]
	cp $33
	jp c, Func_6c992
	ld hl, sp+$4
	ld [hl], $1
	jp Func_6c999

Func_6c992: ; 6c992 (1b:4992)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_6c999: ; 6c999 (1b:4999)
	pop bc
	jp Func_6c9e1

Func_6c99d: ; 6c99d (1b:499d)
	inc c
	dec c
	jp nz, Func_6c9c3
	push bc
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $1
	call Func_6c01c
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call Func_6c030
	pop bc
	jp Func_6c9e1

Func_6c9c3: ; 6c9c3 (1b:49c3)
	push bc
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call Func_6c030
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $1
	call Func_6c01c
	pop bc
Func_6c9e1: ; 6c9e1 (1b:49e1)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_6ca08
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_6ca08
	ld hl, sp+$8
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $e
	ld c, l
	ld b, h
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$8
	ld a, [hl]
	call Func_6cb0f
	pop bc
	jp Func_6ca2a

Func_6ca08: ; 6ca08 (1b:4a08)
	push bc
	ld a, $63
	call Func_6c001
	inc a
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp z, Func_6ca1b
	ld hl, sp+$8
	ld [hl], e
Func_6ca1b: ; 6ca1b (1b:4a1b)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp z, Func_6ca27
	ld hl, sp+$5
	ld [hl], e
Func_6ca27: ; 6ca27 (1b:4a27)
	jp Func_6c917

Func_6ca2a: ; 6ca2a (1b:4a2a)
	add sp, $c
	ret

Data_6ca2d:
	db $05, $05, $05, $0a, $0f, $14, $0f, $0a, $05, $0a

Func_6ca37: ; 6ca37 (1b:4a37)
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_6ca2d
	ld bc, $a
	call MemCopy
	ld a, $64
	call Func_6c001
	ld e, a
	ld hl, sp+$a
	ld [hl], $0
	ld c, $0
Func_6ca58: ; 6ca58 (1b:4a58)
	ld a, c
	cp $a
	jp nc, Func_6ca7b
	push de
	ld hl, sp+$c
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	add [hl]
	ld hl, sp+$c
	ld [hl], a
	pop de
	ld a, e
	ld hl, sp+$a
	cp [hl]
	jp nc, Func_6ca77
	jp Func_6ca7b

Func_6ca77: ; 6ca77 (1b:4a77)
	inc c
	jp Func_6ca58

Func_6ca7b: ; 6ca7b (1b:4a7b)
	ld a, c
	add sp, $c
	ret

Data_6ca7f:
	db $01, $0b, $15, $1f, $29, $33, $3d, $47, $51, $5b, $65

Func_6ca8a: ; 6ca8a (1b:4a8a)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_6ca7f
	ld bc, $b
	call MemCopy
	ld hl, sp+$f
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld hl, sp+$c
	cp [hl]
	jp c, Func_6cac4
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$f
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1
	add hl, de
	cp [hl]
	jp nc, Func_6cac4
	ld a, $1
	jp Func_6cac6

Func_6cac4: ; 6cac4 (1b:4ac4)
	ld a, $ff
Func_6cac6: ; 6cac6 (1b:4ac6)
	add sp, $10
	ret

Data_6cac9:
	db $02, $00, $00, $01, $02, $01, $00, $0a, $03, $00, $00, $01, $04, $00, $01, $06, $ff, $28, $06, $04, $12, $06, $f8, $04, $1c, $06, $00, $02, $02, $00, $00, $01, $05, $01, $00

Data_6caec:
	db $02, $00, $00, $01, $02, $01, $00, $0a, $03, $01, $00, $0a, $04, $01, $01, $06, $ff, $28, $06, $04, $12, $06, $f8, $04, $1c, $06, $00, $02, $02, $01, $00, $0a, $05, $01, $00

Func_6cb0f: ; 6cb0f (1b:4b0f)
	push bc
	ld hl, -$8e
	add hl, sp
	ld sp, hl
	push de
	push af
	ld hl, sp+$27
	reg16swap de, hl
	ld hl, Data_6cac9
	ld bc, $23
	call MemCopy
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_6caec
	ld bc, $23
	call MemCopy
	ld hl, $8a
	add hl, sp
	ld [hl], $7
Func_6cb3b: ; 6cb3b (1b:4b3b)
	ld hl, $96
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_6cb5d
	ld hl, $96
	add hl, sp
	ld a, [hl]
	cp $1
	jp nz, Func_6cb78
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6cb78
Func_6cb5d: ; 6cb5d (1b:4b5d)
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8a
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	jp Func_6cb94

Func_6cb78: ; 6cb78 (1b:4b78)
	ld hl, $8a
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	add hl, bc
	reg16swap de, hl
Func_6cb94: ; 6cb94 (1b:4b94)
	ld c, $0
Func_6cb96: ; 6cb96 (1b:4b96)
	ld a, c
	cp $8
	jp nc, Func_6cbb1
	ld a, [de]
	cp $8f
	jp z, Func_6cba5
	jp Func_6cbb1

Func_6cba5: ; 6cba5 (1b:4ba5)
	inc c
	ld hl, $8
	add hl, de
	reg16swap de, hl
	jp Func_6cb96

Func_6cbb1: ; 6cbb1 (1b:4bb1)
	ld a, c
	cp $8
	jp c, Func_6cbc1
	ld hl, $8a
	add hl, sp
	ld a, [hl]
	cp $3
	jp nz, Func_6cbc4
Func_6cbc1: ; 6cbc1 (1b:4bc1)
	jp Func_6cbd2

Func_6cbc4: ; 6cbc4 (1b:4bc4)
	ld hl, $8a
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $8a
	add hl, sp
	ld [hl], a
	jp Func_6cb3b

Func_6cbd2: ; 6cbd2 (1b:4bd2)
	ld a, $8
	ld hl, $8a
	add hl, sp
	sub [hl]
	add a
	ld hl, sp+$3b
	add [hl]
	ld hl, sp+$3b
	ld [hl], a
	ld a, $8
	ld hl, $8a
	add hl, sp
	sub [hl]
	ld hl, sp+$3e
	add [hl]
	ld hl, sp+$3e
	ld [hl], a
	ld hl, $8a
	add hl, sp
	ld [hl], $7
Func_6cbf3: ; 6cbf3 (1b:4bf3)
	ld hl, $96
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_6cc15
	ld hl, $96
	add hl, sp
	ld a, [hl]
	cp $1
	jp nz, Func_6cc34
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6cc34
Func_6cc15: ; 6cc15 (1b:4c15)
	ld hl, $8a
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	add hl, bc
	reg16swap de, hl
	jp Func_6cc4c

Func_6cc34: ; 6cc34 (1b:4c34)
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8a
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
Func_6cc4c: ; 6cc4c (1b:4c4c)
	ld c, $0
Func_6cc4e: ; 6cc4e (1b:4c4e)
	ld a, c
	cp $8
	jp nc, Func_6cc69
	ld a, [de]
	cp $8f
	jp z, Func_6cc5d
	jp Func_6cc69

Func_6cc5d: ; 6cc5d (1b:4c5d)
	inc c
	ld hl, $8
	add hl, de
	reg16swap de, hl
	jp Func_6cc4e

Func_6cc69: ; 6cc69 (1b:4c69)
	ld a, c
	cp $8
	jp c, Func_6cc79
	ld hl, $8a
	add hl, sp
	ld a, [hl]
	cp $3
	jp nz, Func_6cc7c
Func_6cc79: ; 6cc79 (1b:4c79)
	jp Func_6cc8a

Func_6cc7c: ; 6cc7c (1b:4c7c)
	ld hl, $8a
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $8a
	add hl, sp
	ld [hl], a
	jp Func_6cbf3

Func_6cc8a: ; 6cc8a (1b:4c8a)
	ld a, $8
	ld hl, $8a
	add hl, sp
	sub [hl]
	add a
	ld hl, sp+$18
	add [hl]
	ld hl, sp+$18
	ld [hl], a
	ld a, $8
	ld hl, $8a
	add hl, sp
	sub [hl]
	ld hl, sp+$1b
	add [hl]
	ld hl, sp+$1b
	ld [hl], a
	ld hl, sp+$27
	call Func_6c546
	ld hl, sp+$4
	call Func_6c546
	ld hl, $96
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_6ccd1
	ld hl, $96
	add hl, sp
	ld a, [hl]
	cp $1
	jp nz, Func_6ccf4
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6ccf4
Func_6ccd1: ; 6ccd1 (1b:4cd1)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	pop de
	jp Func_6cd14

Func_6ccf4: ; 6ccf4 (1b:4cf4)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
Func_6cd14: ; 6cd14 (1b:4d14)
	push bc
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop de
	push de
	ld hl, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $8c
	pop de
	pop bc
	push de
	ld hl, $23
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $8c
	pop de
	ld hl, $2e
	add hl, de
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld [hl], a
	ld hl, $2e
	add hl, bc
	ld a, [hl]
	ld hl, $8f
	add hl, sp
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, $8c
	add hl, sp
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, $8d
	add hl, sp
	ld [hl], a
	ld hl, $17
	add hl, de
	ld a, [hl]
	ld hl, $90
	add hl, sp
	ld [hl], a
	ld hl, $17
	add hl, bc
	ld a, [hl]
	ld hl, $91
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, $92
	add hl, sp
	ld e, [hl]
	ld hl, sp+$4c
	call Func_241f
	ld hl, $93
	add hl, sp
	ld e, [hl]
	ld hl, sp+$64
	call Func_241f
	pop af
	call GetSRAMBank
	ld hl, sp+$5a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $88
	add hl, bc
	write_hl_to_sp_plus $88
	ld hl, sp+$72
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $8a
	add hl, bc
	write_hl_to_sp_plus $8a
	set_farcall_addrs_hli Func_e39a
	ld hl, $8b
	add hl, sp
	ld [hl], $0
Func_6cdd5: ; 6cdd5 (1b:4dd5)
	ld hl, $8b
	add hl, sp
	ld a, [hl]
	cp $2
	jp nc, Func_6ce5b
	ld hl, $8b
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8e
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_6ce4d
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_6ce4d: ; 6ce4d (1b:4e4d)
	ld hl, $8b
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8b
	add hl, sp
	ld [hl], a
	jp Func_6cdd5

Func_6ce5b: ; 6ce5b (1b:4e5b)
	ld hl, $8b
	add hl, sp
	ld [hl], $0
Func_6ce61: ; 6ce61 (1b:4e61)
	ld hl, $8b
	add hl, sp
	ld a, [hl]
	cp $2
	jp nc, Func_6cf1b
	ld hl, $8b
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8c
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $7
	jp z, Func_6ced8
	cp $6
	jp z, Func_6ced8
	cp $5
	jp z, Func_6ced8
	cp $4
	jp z, Func_6ced8
	cp $3
	jp z, Func_6ced8
	cp $2
	jp z, Func_6ced8
	cp $1
	jp z, Func_6ced8
	or a
	jp nz, Func_6cf0d
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6cf0d

Func_6ced8: ; 6ced8 (1b:4ed8)
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6cf0d: ; 6cf0d (1b:4f0d)
	ld hl, $8b
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8b
	add hl, sp
	ld [hl], a
	jp Func_6ce61

Func_6cf1b: ; 6cf1b (1b:4f1b)
	read_hl_from_sp_plus $88
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_6cf33
	ld hl, $1
	write_hl_to_sp_plus $88
Func_6cf33: ; 6cf33 (1b:4f33)
	read_hl_from_sp_plus $8a
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_6cf4b
	ld hl, $1
	write_hl_to_sp_plus $8a
Func_6cf4b: ; 6cf4b (1b:4f4b)
	pop af
	ld hl, sp+$78
	ld c, l
	ld b, h
	ld l, a
	ld h, $0
	ld de, $64
	call Func_2617
	ld hl, sp+$78
	ld c, l
	ld b, h
	read_hl_from_sp_plus $86
	reg16swap de, hl
	ld hl, sp+$78
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$78
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_6cf79
	dec bc
.asm_6cf79
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, Init
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$7d
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_6cf95
	dec bc
.asm_6cf95
	push bc
	push hl
	call AddLongsFromStack
	ld hl, $80
	add hl, sp
	call PutLongFromStackToHL
	ld hl, sp+$7a
	ld a, [hl]
	and $80
	jp z, Func_6cfb8
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	ld hl, $80
	add hl, sp
	call AddLongs
Func_6cfb8: ; 6cfb8 (1b:4fb8)
	pop de
	ld hl, sp+$76
	ld c, l
	ld b, h
	ld l, e
	ld h, $0
	ld de, $64
	call Func_2617
	ld hl, sp+$76
	ld c, l
	ld b, h
	read_hl_from_sp_plus $86
	reg16swap de, hl
	ld hl, sp+$76
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$76
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_6cfe6
	dec bc
.asm_6cfe6
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, Init
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_6d002
	dec bc
.asm_6d002
	push bc
	push hl
	call AddLongsFromStack
	ld hl, $82
	add hl, sp
	call PutLongFromStackToHL
	ld hl, sp+$78
	ld a, [hl]
	and $80
	jp z, Func_6d025
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	ld hl, $82
	add hl, sp
	call AddLongs
Func_6d025: ; 6d025 (1b:5025)
	ld hl, $87
	add hl, sp
	ld [hl], $0
Func_6d02b: ; 6d02b (1b:502b)
	ld hl, $87
	add hl, sp
	ld a, [hl]
	cp $2
	jp nc, Func_6d0be
	ld hl, $87
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$7a
	add hl, de
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_6d074
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$7e
	add hl, de
	call PutLongFromStackToHL
	jp Func_6d0b0

Func_6d074: ; 6d074 (1b:5074)
	ld hl, $0
	push hl
	ld hl, 999
	push hl
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$7e
	add hl, de
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_6d0b0
	ld hl, $0
	push hl
	ld hl, 999
	push hl
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$7e
	add hl, de
	call PutLongFromStackToHL
Func_6d0b0: ; 6d0b0 (1b:50b0)
	ld hl, $87
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $87
	add hl, sp
	ld [hl], a
	jp Func_6d02b

Func_6d0be: ; 6d0be (1b:50be)
	ld e, $4
	ld a, $f
	call SetStringStartState
	ld hl, sp+$7a
	call PutLongFromHLOnStack
	ld hl, Data_6d153
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $d
	ld a, $f
	call SetStringStartState
	ld hl, sp+$7e
	call PutLongFromHLOnStack
	ld hl, Data_6d156
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$7a
	call PutLongFromHLOnStack
	ld hl, $82
	add hl, sp
	call PutLongFromHLOnStack
	call CompareStackLongs
	jp nz, Func_6d11b
	ld hl, sp+$7a
	call PutLongFromHLOnStack
	pop bc
	pop af
	read_hl_from_sp_plus $90
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $2
	jp Func_6d14d

Func_6d11b: ; 6d11b (1b:511b)
	ld hl, sp+$7e
	call PutLongFromHLOnStack
	ld hl, sp+$7e
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_6d13d
	ld hl, sp+$7a
	call PutLongFromHLOnStack
	pop bc
	pop af
	read_hl_from_sp_plus $90
	ld [hl], c
	inc hl
	ld [hl], b
	xor a
	jp Func_6d14d

Func_6d13d: ; 6d13d (1b:513d)
	ld hl, sp+$7e
	call PutLongFromHLOnStack
	pop bc
	pop af
	read_hl_from_sp_plus $90
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $1
Func_6d14d: ; 6d14d (1b:514d)
	ld hl, $90
	add hl, sp
	ld sp, hl
	ret

Data_6d153:
	dstr "%d"

Data_6d156:
	dstr "%d"

Data_6d159:
	db $21, $02, $07, $1a, $00, $01, $0a, $08, $03, $1f, $00, $0a, $0a, $11

Func_6d167: ; 6d167 (1b:5167)
	push bc
	push af
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $5
	xor a
	call SetStringStartState
	ld hl, sp+$2
	ld [hl], $0
Func_6d17f: ; 6d17f (1b:517f)
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp nc, Func_6d20f
	ld hl, sp+$3
	ld [hl], $27
	ld c, $0
Func_6d18d: ; 6d18d (1b:518d)
	ld a, c
	cp $8
	jp nc, Func_6d205
	ld e, $0
Func_6d195: ; 6d195 (1b:5195)
	ld a, e
	cp $8
	jp nc, Func_6d1d1
	push de
	ld hl, sp+$5
	ld a, [hl]
	ld l, e
	ld h, $0
	ld de, $b
	add hl, de
	push hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld e, c
	ld d, $0
	inc de
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_6d195

Func_6d1d1: ; 6d1d1 (1b:51d1)
	inc c
	dec c
	jp nz, Func_6d1dd
	ld hl, sp+$3
	ld [hl], $34
	jp Func_6d201

Func_6d1dd: ; 6d1dd (1b:51dd)
	ld a, c
	cp $1
	jp nz, Func_6d1ea
	ld hl, sp+$3
	ld [hl], $42
	jp Func_6d201

Func_6d1ea: ; 6d1ea (1b:51ea)
	ld a, c
	cp $2
	jp nz, Func_6d1f7
	ld hl, sp+$3
	ld [hl], $52
	jp Func_6d201

Func_6d1f7: ; 6d1f7 (1b:51f7)
	ld a, c
	cp $6
	jp nz, Func_6d201
	ld hl, sp+$3
	ld [hl], $75
Func_6d201: ; 6d201 (1b:5201)
	inc c
	jp Func_6d18d

Func_6d205: ; 6d205 (1b:5205)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_6d17f

Func_6d20f: ; 6d20f (1b:520f)
	call WaitVideoTransfer
	check_cgb
	jp nz, Func_6d234
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
Func_6d234: ; 6d234 (1b:5234)
	ld a, $1
	ld [wPoncotPicAlignment], a
	pop af
	push af
	or a
	jp z, Func_6d253
	cp $1
	jp nz, Func_6d276
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6d276
Func_6d253: ; 6d253 (1b:5253)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	ld c, l
	ld b, h
	pop de
	jp Func_6d296

Func_6d276: ; 6d276 (1b:5276)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
Func_6d296: ; 6d296 (1b:5296)
	push bc
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	pop bc
	ld hl, $c
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld a, [wSystemType]
	cp $1
	jp z, Func_6d2e2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_6d2eb
Func_6d2e2: ; 6d2e2 (1b:52e2)
	ld de, $e
	ld hl, Data_6d159
	call Func_2b7d
Func_6d2eb: ; 6d2eb (1b:52eb)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	reg16swap de, hl
	ld hl, $a
	call FarCall
	call WaitVideoTransfer
	pop af
	ld c, a
	ld e, $1
	ld a, $1
	call Func_6d350
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	ret

Func_6d350: ; 6d350 (1b:5350)
	push bc
	push de
	ld e, $0
	ld hl, sp+$2
	ld [hl], $9
	ld c, a
	ld b, $0
	ld l, e
	ld h, $0
	ld de, $d00
	add hl, de
	ld de, $3
	call Func_2230
	pop de
	ld c, e
	ld b, $0
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	ld de, $d00
	add hl, de
	ld de, $3
	call Func_2230
	pop bc
	ret

Func_6d37d:
	ld a, [wLCDC]
	ldh [rLCDC], a
	ld hl, rIE
	res 1, [hl]
	ld hl, rIF
	res 1, [hl]
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ret

Func_6d395:: ; 6d395 (1b:5395)
	push bc
	push bc
	push af
	cp $2
	jp nz, Func_6d3ac
	callba_hli Func_10766
	xor a
Func_6d3ac: ; 6d3ac (1b:53ac)
	pop af
	push af
	cp $1
	jp nz, Func_6d3c7
	set_farcall_addrs_hli Func_105ce
	xor a
	call FarCall
	ld e, $1
	jp Func_6d3d7

Func_6d3c7: ; 6d3c7 (1b:53c7)
	callba_hli Func_1028b
	ld e, $0
Func_6d3d7: ; 6d3d7 (1b:53d7)
	push de
	call FillVisibleAreaWithBlankTile
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_6c011
	pop de
Func_6d3f5: ; 6d3f5 (1b:53f5)
	push de
	ld a, e
	call Func_6e77b
	ld a, $e
	call OverworldPlaySong
	pop de
	push de
	ld a, e
	ld hl, sp+$4
	reg16swap de, hl
	call Func_6d723
	ld hl, sp+$6
	ld [hl], a
	pop de
	push de
	ld a, e
	cp $1
	jp nz, Func_6d4f3
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6d47f
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call WaitVideoTransfer
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	call WaitVideoTransfer
	jp Func_6d4f0

Func_6d47f: ; 6d47f (1b:547f)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call WaitVideoTransfer
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	call WaitVideoTransfer
	ld hl, sp+$6
	ld a, [hl]
	or a
	jp nz, Func_6d4e4
	ld hl, sp+$6
	ld [hl], $1
	jp Func_6d4f0

Func_6d4e4: ; 6d4e4 (1b:54e4)
	ld hl, sp+$6
	ld a, [hl]
	cp $1
	jp nz, Func_6d4f0
	ld hl, sp+$6
	ld [hl], $0
Func_6d4f0: ; 6d4f0 (1b:54f0)
	jp Func_6d54a

Func_6d4f3: ; 6d4f3 (1b:54f3)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call WaitVideoTransfer
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	push de
	set_farcall_addrs_hli Func_dc0a
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	call WaitVideoTransfer
Func_6d54a: ; 6d54a (1b:554a)
	pop de
	ld hl, sp+$4
	ld a, [hl]
	cp $2
	jp z, Func_6d556
	jp Func_6d599

Func_6d556: ; 6d556 (1b:5556)
	push de
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_6d62f
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	xor a
	pop de
Func_6d586: ; 6d586 (1b:5586)
	cp $3c
	jp nc, Func_6d596
	push de
	push af
	call NextOverworldFrame
	pop af
	inc a
	pop de
	jp Func_6d586

Func_6d596: ; 6d596 (1b:5596)
	jp Func_6d3f5

Func_6d599: ; 6d599 (1b:5599)
	push de
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_107d7
	pop de
	push de
	ld c, e
	ld b, $0
	inc b
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	pop de
	push de
	ld a, e
	cp $1
	jp nz, Func_6d5c6
	call Func_6c044
Func_6d5c6: ; 6d5c6 (1b:55c6)
	pop de
	pop af
	push de
	cp $2
	jp nz, Func_6d5dc
	callba_hli Func_107b8
Func_6d5dc: ; 6d5dc (1b:55dc)
	pop de
	ld a, e
	cp $1
	jp nz, Func_6d61c
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6d5fa
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	jp Func_6d62c

Func_6d5fa: ; 6d5fa (1b:55fa)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_6d608
	ld hl, sp+$2
	ld [hl], $1
	jp Func_6d614

Func_6d608: ; 6d608 (1b:5608)
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_6d614
	ld hl, sp+$2
	ld [hl], $0
Func_6d614: ; 6d614 (1b:5614)
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	jp Func_6d62c

Func_6d61c: ; 6d61c (1b:561c)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_6d629
	ld hl, $0
	jp Func_6d62c

Func_6d629: ; 6d629 (1b:5629)
	ld hl, $1
Func_6d62c: ; 6d62c (1b:562c)
	pop bc
	pop bc
	ret

Data_6d62f:
	dstr "(ひきわけなのてﾞ もういちとﾞ)"

Func_6d641: ; 6d641 (1b:5641)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call ClearSprites
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6d67e
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_6d686

Func_6d67e: ; 6d67e (1b:567e)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_6d686: ; 6d686 (1b:5686)
	check_cgb
	jp nz, Func_6d6ba
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld a, [wOverworldTilemapSelector]
	ld c, a
	ld b, $0
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_6d6ba: ; 6d6ba (1b:56ba)
	set_farcall_addrs_hli Func_667d
	ld bc, $2
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $1b
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $537d
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $82
	ld [wNextVBlankFlags], a
Func_6d705: ; 6d705 (1b:5705)
	ld a, [wNextVBlankFlags]
	and $80
	jp nz, Func_6d705
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_6c011
	call WaitVideoTransfer
	ret

Func_6d723: ; 6d723 (1b:5723)
	push af
	push de
	add sp, -$2a
	ld hl, sp+$2d
	ld a, [hl]
	or a
	jp nz, Func_6d739
	ld hl, sp+$22
	ld [hl], $0
	ld hl, sp+$21
	ld [hl], $1
	jp Func_6d75b

Func_6d739: ; 6d739 (1b:5739)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6d753
	ld hl, sp+$22
	ld [hl], $0
	ld hl, sp+$21
	ld [hl], $1
	jp Func_6d75b

Func_6d753: ; 6d753 (1b:5753)
	ld hl, sp+$22
	ld [hl], $1
	ld hl, sp+$21
	ld [hl], $0
Func_6d75b: ; 6d75b (1b:575b)
	ld hl, $0
	write_hl_to_sp_plus $13
	write_hl_to_sp_plus $11
	ld hl, sp+$7
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$28
	ld [hl], a
	ld hl, sp+$27
	ld [hl], a
	ld hl, $0
	write_hl_to_sp_plus $27
	write_hl_to_sp_plus $25
	ld hl, sp+$5
	xor a
	ld [hl], a
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$1c
	ld a, $b0
	ld [hl], a
	ld hl, sp+$1b
	ld [hl], a
	ld hl, sp+$1d
	ld [hl], $0
	ld a, [hl]
	ld hl, sp+$1e
	ld [hl], a
	ld hl, $ff
	write_hl_to_sp_plus $1b
	write_hl_to_sp_plus $19
	ld hl, $0
	write_hl_to_sp_plus $f
	write_hl_to_sp_plus $d
	ld hl, sp+$22
	ld a, [hl]
	or a
	jp nz, Func_6d836
	set_farcall_addrs_hli Func_10a8b
	ld hl, sp+$22
	ld a, [hl]
	call FarCall
	ld hl, sp+$22
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_10a8b
	ld hl, sp+$21
	ld a, [hl]
	call FarCall
	ld hl, sp+$21
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld [hl], a
	ld c, $0
Func_6d7e8: ; 6d7e8 (1b:57e8)
	ld a, c
	cp $2
	jp nc, Func_6d836
	ld e, c
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld a, [hl]
	cp $8
	jp z, Func_6d82a
	cp $4
	jp z, Func_6d81f
	cp $2
	jp z, Func_6d814
	cp $1
	jp nz, Func_6d832
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld [hl], $3c
	jp Func_6d832

Func_6d814: ; 6d814 (1b:5814)
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld [hl], $78
	jp Func_6d832

Func_6d81f: ; 6d81f (1b:581f)
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld [hl], $b4
	jp Func_6d832

Func_6d82a: ; 6d82a (1b:582a)
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld [hl], $f0
Func_6d832: ; 6d832 (1b:5832)
	inc c
	jp Func_6d7e8

Func_6d836: ; 6d836 (1b:5836)
	ld hl, sp+$2d
	ld a, [hl]
	cp $1
	jp nz, Func_6d880
	ld hl, sp+$22
	ld a, [hl]
	or a
	jp nz, Func_6d864
	ld c, $2
	ld hl, sp+$1f
	reg16swap de, hl
	ld hl, $2
	call Func_6c030
	ld c, $2
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $2
	call Func_6c030
	jp Func_6d880

Func_6d864: ; 6d864 (1b:5864)
	ld c, $2
	ld hl, sp+$1f
	reg16swap de, hl
	ld hl, $2
	call Func_6c01c
	ld c, $2
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $2
	call Func_6c01c
Func_6d880: ; 6d880 (1b:5880)
	callba_hli WaitAorBButtonOverworld_17a44
	ld hl, sp+$2d
	ld a, [hl]
	cp $1
	jp nz, Func_6d8c1
	ld hl, sp+$6
	ld [hl], $ff
	ld a, [wc319]
	cp $81
	jp nz, Func_6d8b3
	ld c, $2
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_6c030
	jp Func_6d8c1

Func_6d8b3: ; 6d8b3 (1b:58b3)
	ld c, $2
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_6c01c
Func_6d8c1: ; 6d8c1 (1b:58c1)
	ld hl, sp+$22
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld hl, sp+$22
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$21
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	xor a
	ld c, $0
Func_6d91e: ; 6d91e (1b:591e)
	ld hl, sp+$22
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld a, [hl]
	cp $20
	jp c, Func_6d958
	push bc
	call GetJoyPressed
	pop bc
	and $10
	jp z, Func_6d956
	inc c
	dec c
	jp nz, Func_6d953
	ld c, $1
	ld hl, sp+$22
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_6d953: ; 6d953 (1b:5953)
	jp Func_6d958

Func_6d956: ; 6d956 (1b:5956)
	ld c, $0
Func_6d958: ; 6d958 (1b:5958)
	push bc
	ld hl, sp+$24
	ld a, [hl]
	or a
	jp nz, Func_6de4e
	ld hl, sp+$1f
	ld l, [hl]
	push hl
	ld hl, sp+$22
	ld l, [hl]
	push hl
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	add $70
	ld l, a
	push hl
	ld c, $48
	ld hl, sp+$2a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	add hl, de
	ld a, [hl]
	add $20
	ld e, a
	ld a, $48
	call Func_6ec6a
	pop bc
	pop bc
	pop bc
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6d9d0
	ld hl, sp+$24
	ld l, [hl]
	push hl
	ld hl, sp+$26
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	reg16swap de, hl
	xor a
	call Func_6e6d4
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	jp Func_6dbea

Func_6d9d0: ; 6d9d0 (1b:59d0)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6dbea
	ld hl, sp+$20
	ld a, [hl]
	inc a
	ld hl, sp+$20
	ld [hl], a
	ld hl, sp+$20
	ld a, [hl]
	cp $4
	jp nz, Func_6d9f1
	ld hl, sp+$20
	ld [hl], $0
Func_6d9f1: ; 6d9f1 (1b:59f1)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6db5b
	ld hl, sp+$2f
	ld a, [hl]
	cp $1
	jp nz, Func_6da12
	ld hl, sp+$9
	ld a, [hl]
	or a
	jp nz, Func_6da12
	ld hl, sp+$9
	ld [hl], $1
Func_6da12: ; 6da12 (1b:5a12)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc a
	inc hl
	or [hl]
	jp nz, Func_6db45
	ld hl, sp+$2f
	ld a, [hl]
	or a
	jp nz, Func_6db1f
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_6da73
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_6db1c

Func_6da73: ; 6da73 (1b:5a73)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call CompareHLtoDE
	jp nc, Func_6dab6
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $4
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6db1c

Func_6dab6: ; 6dab6 (1b:5ab6)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $3c
	call CompareHLtoDE
	jp nc, Func_6daf9
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $8
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6db1c

Func_6daf9: ; 6daf9 (1b:5af9)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $10
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6db1c: ; 6db1c (1b:5b1c)
	jp Func_6db45

Func_6db1f: ; 6db1f (1b:5b1f)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
Func_6db45: ; 6db45 (1b:5b45)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_6db5b: ; 6db5b (1b:5b5b)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld hl, sp+$26
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1b
	add hl, de
	ld e, [hl]
	push de
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$2a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$27
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$2a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	reg16swap de, hl
	xor a
	call Func_6e72f
	pop bc
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6dbea
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_6dbea
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6dbea: ; 6dbea (1b:5bea)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6dc30
	ld hl, sp+$23
	ld l, [hl]
	push hl
	ld hl, sp+$25
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	reg16swap de, hl
	ld a, $1
	call Func_6e6d4
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	jp Func_6de4b

Func_6dc30: ; 6dc30 (1b:5c30)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6de4b
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	ld hl, sp+$1f
	ld [hl], a
	ld hl, sp+$1f
	ld a, [hl]
	cp $4
	jp nz, Func_6dc51
	ld hl, sp+$1f
	ld [hl], $0
Func_6dc51: ; 6dc51 (1b:5c51)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6ddbb
	ld hl, sp+$2f
	ld a, [hl]
	cp $1
	jp nz, Func_6dc72
	ld hl, sp+$a
	ld a, [hl]
	or a
	jp nz, Func_6dc72
	ld hl, sp+$a
	ld [hl], $1
Func_6dc72: ; 6dc72 (1b:5c72)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc a
	inc hl
	or [hl]
	jp nz, Func_6dda5
	ld hl, sp+$2f
	ld a, [hl]
	or a
	jp nz, Func_6dd7f
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_6dcd3
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_6dd7c

Func_6dcd3: ; 6dcd3 (1b:5cd3)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call CompareHLtoDE
	jp nc, Func_6dd16
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $4
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6dd7c

Func_6dd16: ; 6dd16 (1b:5d16)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $3c
	call CompareHLtoDE
	jp nc, Func_6dd59
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $8
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6dd7c

Func_6dd59: ; 6dd59 (1b:5d59)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $10
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6dd7c: ; 6dd7c (1b:5d7c)
	jp Func_6dda5

Func_6dd7f: ; 6dd7f (1b:5d7f)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
Func_6dda5: ; 6dda5 (1b:5da5)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_6ddbb: ; 6ddbb (1b:5dbb)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld hl, sp+$25
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1b
	add hl, de
	ld e, [hl]
	push de
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$27
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	reg16swap de, hl
	ld a, $1
	call Func_6e72f
	pop bc
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6de4b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_6de4b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6de4b: ; 6de4b (1b:5e4b)
	jp Func_6e339

Func_6de4e: ; 6de4e (1b:5e4e)
	ld hl, sp+$20
	ld l, [hl]
	push hl
	ld hl, sp+$21
	ld l, [hl]
	push hl
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	add $20
	ld l, a
	push hl
	ld c, $48
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	add hl, de
	ld a, [hl]
	add $70
	ld e, a
	ld a, $48
	call Func_6ec6a
	pop bc
	pop bc
	pop bc
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6debf
	ld hl, sp+$23
	ld l, [hl]
	push hl
	ld hl, sp+$25
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	reg16swap de, hl
	ld a, $1
	call Func_6e6d4
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	jp Func_6e0da

Func_6debf: ; 6debf (1b:5ebf)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6e0da
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	ld hl, sp+$1f
	ld [hl], a
	ld hl, sp+$1f
	ld a, [hl]
	cp $4
	jp nz, Func_6dee0
	ld hl, sp+$1f
	ld [hl], $0
Func_6dee0: ; 6dee0 (1b:5ee0)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6e04a
	ld hl, sp+$2f
	ld a, [hl]
	cp $1
	jp nz, Func_6df01
	ld hl, sp+$a
	ld a, [hl]
	or a
	jp nz, Func_6df01
	ld hl, sp+$a
	ld [hl], $1
Func_6df01: ; 6df01 (1b:5f01)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc a
	inc hl
	or [hl]
	jp nz, Func_6e034
	ld hl, sp+$2f
	ld a, [hl]
	or a
	jp nz, Func_6e00e
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_6df62
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_6e00b

Func_6df62: ; 6df62 (1b:5f62)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call CompareHLtoDE
	jp nc, Func_6dfa5
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $4
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6e00b

Func_6dfa5: ; 6dfa5 (1b:5fa5)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $3c
	call CompareHLtoDE
	jp nc, Func_6dfe8
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $8
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6e00b

Func_6dfe8: ; 6dfe8 (1b:5fe8)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $10
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6e00b: ; 6e00b (1b:600b)
	jp Func_6e034

Func_6e00e: ; 6e00e (1b:600e)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
Func_6e034: ; 6e034 (1b:6034)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_6e04a: ; 6e04a (1b:604a)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld hl, sp+$25
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1b
	add hl, de
	ld e, [hl]
	push de
	ld hl, sp+$27
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$27
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	reg16swap de, hl
	ld a, $1
	call Func_6e72f
	pop bc
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6e0da
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_6e0da
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6e0da: ; 6e0da (1b:60da)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6e11f
	ld hl, sp+$24
	ld l, [hl]
	push hl
	ld hl, sp+$26
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	reg16swap de, hl
	xor a
	call Func_6e6d4
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	jp Func_6e339

Func_6e11f: ; 6e11f (1b:611f)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_6e339
	ld hl, sp+$20
	ld a, [hl]
	inc a
	ld hl, sp+$20
	ld [hl], a
	ld hl, sp+$20
	ld a, [hl]
	cp $4
	jp nz, Func_6e140
	ld hl, sp+$20
	ld [hl], $0
Func_6e140: ; 6e140 (1b:6140)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6e2aa
	ld hl, sp+$2f
	ld a, [hl]
	cp $1
	jp nz, Func_6e161
	ld hl, sp+$9
	ld a, [hl]
	or a
	jp nz, Func_6e161
	ld hl, sp+$9
	ld [hl], $1
Func_6e161: ; 6e161 (1b:6161)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc a
	inc hl
	or [hl]
	jp nz, Func_6e294
	ld hl, sp+$2f
	ld a, [hl]
	or a
	jp nz, Func_6e26e
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_6e1c2
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_6e26b

Func_6e1c2: ; 6e1c2 (1b:61c2)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call CompareHLtoDE
	jp nc, Func_6e205
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $4
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6e26b

Func_6e205: ; 6e205 (1b:6205)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $3c
	call CompareHLtoDE
	jp nc, Func_6e248
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $8
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_6e26b

Func_6e248: ; 6e248 (1b:6248)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld bc, $10
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6e26b: ; 6e26b (1b:626b)
	jp Func_6e294

Func_6e26e: ; 6e26e (1b:626e)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld de, $2
	ld [hl], e
	inc hl
	ld [hl], d
Func_6e294: ; 6e294 (1b:6294)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_6e2aa: ; 6e2aa (1b:62aa)
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	push hl
	ld hl, sp+$26
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$1b
	add hl, de
	ld e, [hl]
	push de
	ld hl, sp+$28
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$2a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$27
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$2a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	reg16swap de, hl
	xor a
	call Func_6e72f
	pop bc
	pop bc
	pop bc
	ld a, l
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	cp $20
	jp nc, Func_6e339
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_6e339
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_6e339: ; 6e339 (1b:6339)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$29
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_6e39e
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$25
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $f0
	call CompareHLtoDE
	jp nc, Func_6e39e
	ld e, $0
	ld a, $1
	call Func_6edcf
	check_cgb
	jp nz, Func_6e394
	ld e, $0
	ld a, $1
	call Func_6ee8b
Func_6e394: ; 6e394 (1b:6394)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, sp+$29
	add hl, de
	ld [hl], $1
Func_6e39e: ; 6e39e (1b:639e)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$29
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_6e403
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$21
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$25
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $f0
	call CompareHLtoDE
	jp nc, Func_6e403
	ld e, $1
	ld a, $1
	call Func_6edcf
	check_cgb
	jp nz, Func_6e3f9
	ld e, $1
	ld a, $1
	call Func_6ee8b
Func_6e3f9: ; 6e3f9 (1b:63f9)
	ld hl, sp+$23
	ld e, [hl]
	ld d, $0
	ld hl, sp+$29
	add hl, de
	ld [hl], $1
Func_6e403: ; 6e403 (1b:6403)
	pop bc
	ld hl, sp+$21
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld a, [hl]
	cp $1
	jp nc, Func_6e5da
	ld hl, sp+$22
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld a, [hl]
	cp $1
	jp nc, Func_6e5da
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_6c011
	call Func_6d641
	call FillVisibleAreaWithBlankTile
	ld hl, sp+$2d
	ld a, [hl]
	cp $1
	jp nz, Func_6e4a7
	ld hl, sp+$22
	ld a, [hl]
	or a
	jp nz, Func_6e475
	ld c, $1
	ld hl, sp+$22
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	reg16swap de, hl
	ld hl, $2
	call Func_6c030
	ld c, $1
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	reg16swap de, hl
	ld hl, $2
	call Func_6c01c
	jp Func_6e4a7

Func_6e475: ; 6e475 (1b:6475)
	ld c, $1
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	reg16swap de, hl
	ld hl, $2
	call Func_6c01c
	ld c, $1
	ld hl, sp+$22
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	reg16swap de, hl
	ld hl, $2
	call Func_6c030
Func_6e4a7: ; 6e4a7 (1b:64a7)
	xor a
Func_6e4a8: ; 6e4a8 (1b:64a8)
	cp $2
	jp nc, Func_6e587
	push af
	or a
	jp nz, Func_6e4bd
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus6
	jp Func_6e4c5

Func_6e4bd: ; 6e4bd (1b:64bd)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus6
Func_6e4c5: ; 6e4c5 (1b:64c5)
	call GetHLAtSPPlus6
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_6e4e6
	ld bc, $0
	jp Func_6e52b

Func_6e4e6: ; 6e4e6 (1b:64e6)
	call GetHLAtSPPlus6
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $28
	call CompareHLtoDE
	jp nc, Func_6e507
	ld bc, $7c
	jp Func_6e52b

Func_6e507: ; 6e507 (1b:6507)
	call GetHLAtSPPlus6
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$11
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $3c
	call CompareHLtoDE
	jp nc, Func_6e528
	ld bc, $f8
	jp Func_6e52b

Func_6e528: ; 6e528 (1b:6528)
	ld bc, $1f0
Func_6e52b: ; 6e52b (1b:652b)
	ld hl, $0
	call WriteHLToSPPlus4
Func_6e531: ; 6e531 (1b:6531)
	ld hl, -$40
	add hl, bc
	push hl
	call GetHLAtSPPlus6
	pop de
	call CompareHLtoDE
	jp nc, Func_6e582
	push bc
	call GetHLAtSPPlus8
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub $60
	ld a, d
	sbc $ea
	jp nc, Func_6e577
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$23
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus8
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_6e577: ; 6e577 (1b:6577)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	pop bc
	jp Func_6e531

Func_6e582: ; 6e582 (1b:6582)
	pop af
	inc a
	jp Func_6e4a8

Func_6e587: ; 6e587 (1b:6587)
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$24
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$26
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $32
	ld c, l
	ld b, h
	ld hl, sp+$28
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld a, [hl]
	ld hl, sp+$27
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_6e5ed
	pop bc
	pop bc
	pop bc
	jp Func_6e5ea

Func_6e5da: ; 6e5da (1b:65da)
	push bc
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_6c011
	pop bc
	jp Func_6d91e

Func_6e5ea: ; 6e5ea (1b:65ea)
	add sp, $2e
	ret

Func_6e5ed: ; 6e5ed (1b:65ed)
	push af
	push de
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_1099a
	xor a
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_1099a
	ld a, $1
	call FarCall
	reg16swap de, hl
	pop bc
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_6e653
	push de
	ld l, c
	ld h, b
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, sp+$d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $14
	add hl, bc
	pop de
	add hl, de
	call WriteHLToSPPlus8
	pop hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $14
	add hl, bc
	pop de
	add hl, de
	call WriteHLToSPPlus4
	jp Func_6e685

Func_6e653: ; 6e653 (1b:6653)
	push bc
	reg16swap de, hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, sp+$d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $14
	add hl, bc
	pop de
	add hl, de
	call WriteHLToSPPlus6
	pop hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $14
	add hl, bc
	pop de
	add hl, de
	call WriteHLToSPPlus6
Func_6e685: ; 6e685 (1b:6685)
	pop bc
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nc, Func_6e6a4
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	jp Func_6e6cf

Func_6e6a4: ; 6e6a4 (1b:66a4)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call CompareHLtoDE
	jp nc, Func_6e6c1
	pop hl
	push hl
	reg16swap de, hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $1
	jp Func_6e6cf

Func_6e6c1: ; 6e6c1 (1b:66c1)
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $2
Func_6e6cf: ; 6e6cf (1b:66cf)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_6e6d4: ; 6e6d4 (1b:66d4)
	cp $1
	jp z, Func_6e6e8
	or a
	jp nz, Func_6e6f0
	ld a, [bc]
	ld hl, wHBlankSCXAlternate + 1
	add [hl]
	ld [wHBlankSCXAlternate + 1], a
	jp Func_6e6f0

Func_6e6e8: ; 6e6e8 (1b:66e8)
	ld a, [bc]
	ld hl, wHBlankSCXAlternate
	add [hl]
	ld [wHBlankSCXAlternate], a
Func_6e6f0: ; 6e6f0 (1b:66f0)
	ld a, [de]
	cp $21
	jp c, Func_6e700
	ld l, e
	ld h, d
	ld a, [bc]
	ld e, a
	ld a, [hl]
	sub e
	ld [hl], a
	jp Func_6e729

Func_6e700: ; 6e700 (1b:6700)
	ld a, [de]
	cp $19
	jp c, Func_6e719
	ld l, e
	ld h, d
	ld a, [bc]
	ld e, a
	ld a, [hl]
	sub e
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld l, c
	ld h, b
	sub [hl]
	ld hl, sp+$2
	ld [hl], a
	jp Func_6e729

Func_6e719: ; 6e719 (1b:6719)
	reg16swap de, hl
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	dec a
	ld hl, sp+$2
	ld [hl], a
Func_6e729: ; 6e729 (1b:6729)
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ret

Func_6e72f: ; 6e72f (1b:672f)
	push af
	ld a, [de]
	ld a, [de]
	cp $20
	jp nc, Func_6e751
	ld hl, sp+$6
	ld a, [hl]
	or a
	jp nz, Func_6e74e
	reg16swap de, hl
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_6e74e: ; 6e74e (1b:674e)
	jp Func_6e75a

Func_6e751: ; 6e751 (1b:6751)
	reg16swap de, hl
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_6e75a: ; 6e75a (1b:675a)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_6e76c
	ld a, [bc]
	ld hl, wHBlankSCXAlternate + 1
	add [hl]
	ld [wHBlankSCXAlternate + 1], a
	jp Func_6e774

Func_6e76c: ; 6e76c (1b:676c)
	ld a, [bc]
	ld hl, wHBlankSCXAlternate
	add [hl]
	ld [wHBlankSCXAlternate], a
Func_6e774: ; 6e774 (1b:6774)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	pop bc
	ret

Func_6e77b: ; 6e77b (1b:677b)
	push af
	ldh a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	push hl
	ld a, l
	and $7f
	call FarCall
	call Func_6eb1f
	call Func_6e867
	pop hl
	pop af
	push hl
	cp $1
	jp nz, Func_6e7e0
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_6e7c8
	ld l, $0
	push hl
	ld l, $0
	push hl
	ld l, $70
	push hl
	ld c, $48
	ld e, $20
	ld a, $48
	call Func_6ec6a
	pop bc
	pop bc
	pop bc
	jp Func_6e7dd

Func_6e7c8: ; 6e7c8 (1b:67c8)
	ld l, $0
	push hl
	ld l, $0
	push hl
	ld l, $20
	push hl
	ld c, $48
	ld e, $70
	ld a, $48
	call Func_6ec6a
	pop bc
	pop bc
	pop bc
Func_6e7dd: ; 6e7dd (1b:67dd)
	jp Func_6e7f5

Func_6e7e0: ; 6e7e0 (1b:67e0)
	ld l, $0
	push hl
	ld l, $0
	push hl
	ld l, $70
	push hl
	ld c, $48
	ld e, $20
	ld a, $48
	call Func_6ec6a
	pop bc
	pop bc
	pop bc
Func_6e7f5: ; 6e7f5 (1b:67f5)
	set_farcall_addrs_hli Func_6183
	pop hl
	ld a, l
	call FarCall
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6e817
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_6e81f

Func_6e817: ; 6e817 (1b:6817)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_6e81f: ; 6e81f (1b:681f)
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_6c011
	ld a, $1
	ld [wHBlankMode], a
	ld a, $48
	ld [wHBlankLYCPrimary], a
	ld a, $90
	ld [wHBlankLYCAlternate], a
	xor a
	ld [wHBlankSCXAlternate], a
	xor a
	ld [wHBlankSCXAlternate + 1], a
	call Func_6c011
	ld a, [wLCDC]
	or $2
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call EnableHBlank
	ret

Data_6e85b:
	db $a0, $a1, $a2, $a3

Data_6e85f:
	db $04, $02, $02, $06, $03, $0c, $01, $10

Func_6e867: ; 6e867 (1b:6867)
	add sp, -$e
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_6e85f
	ld bc, $8
	call MemCopy
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	check_cgb
	jp nz, Func_6e88b
	call Func_6e9d1
Func_6e88b: ; 6e88b (1b:688b)
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $a400
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8400
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f08
	ld hl, $8
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $8100
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f09
	ld hl, $9
	call FarCall
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6e8fc
	hlbgcoord 0, 0
	write_hl_to_sp_plus $c
	jp Func_6e903

Func_6e8fc: ; 6e8fc (1b:68fc)
	hlbgcoord 0, 0, vWindowMap
	write_hl_to_sp_plus $c
Func_6e903: ; 6e903 (1b:6903)
	xor a
Func_6e904: ; 6e904 (1b:6904)
	cp $4
	jp nc, Func_6e994
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	ld e, [hl]
	ld hl, sp+$b
	ld [hl], e
	xor a
Func_6e92a: ; 6e92a (1b:692a)
	cp $4
	jp nc, Func_6e98f
	push af
	ld e, $0
	ld c, $0
Func_6e934: ; 6e934 (1b:6934)
	ld a, c
	cp $2
	jp nc, Func_6e982
	ld hl, sp+$10
	ld [hl], $0
Func_6e93e: ; 6e93e (1b:693e)
	ld hl, sp+$10
	ld a, [hl]
	cp $2
	jp nc, Func_6e97e
	push de
	ld d, $0
	ld hl, Data_6e85b
	add hl, de
	ld a, [hl]
	ld hl, sp+$12
	ld e, [hl]
	ld d, $0
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $16
	pop de
	add hl, de
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld hl, sp+$10
	ld [hl], a
	jp Func_6e93e

Func_6e97e: ; 6e97e (1b:697e)
	inc c
	jp Func_6e934

Func_6e982: ; 6e982 (1b:6982)
	ld hl, sp+$d
	ld a, [hl]
	add $8
	ld hl, sp+$d
	ld [hl], a
	pop af
	inc a
	jp Func_6e92a

Func_6e98f: ; 6e98f (1b:698f)
	pop af
	inc a
	jp Func_6e904

Func_6e994: ; 6e994 (1b:6994)
	ld e, $0
	xor a
	call Func_6edcf
	ld e, $1
	xor a
	call Func_6edcf
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6e9b6
	ld bc, $400
	debgcoord 0, 0
	hlbgcoord 0, 0, vWindowMap
	call CopyFromDEtoHL
	jp Func_6e9c2

Func_6e9b6: ; 6e9b6 (1b:69b6)
	ld bc, $400
	debgcoord 0, 0, vWindowMap
	hlbgcoord 0, 0
	call CopyFromDEtoHL
Func_6e9c2: ; 6e9c2 (1b:69c2)
	add sp, $e
	ret

Data_6e9c5:
	db $04, $04, $04, $04

Data_6e9c9:
	db $04, $02, $02, $06, $03, $0c, $01, $10

Func_6e9d1: ; 6e9d1 (1b:69d1)
	add sp, -$e
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_6e9c9
	ld bc, $8
	call MemCopy
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $500
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld a, [wOverworldTilemapSelector]
	ld c, a
	ld b, $0
	ld de, $1f08
	ld hl, $8
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld a, [wOverworldTilemapSelector]
	ld c, a
	ld b, $0
	ld de, $1f09
	ld hl, $9
	call FarCall
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6ea50
	hlbgcoord 0, 0
	write_hl_to_sp_plus $c
	jp Func_6ea57

Func_6ea50: ; 6ea50 (1b:6a50)
	hlbgcoord 0, 0, vWindowMap
	write_hl_to_sp_plus $c
Func_6ea57: ; 6ea57 (1b:6a57)
	xor a
Func_6ea58: ; 6ea58 (1b:6a58)
	cp $4
	jp nc, Func_6eae8
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$a
	ld [hl], e
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	ld e, [hl]
	ld hl, sp+$b
	ld [hl], e
	xor a
Func_6ea7e: ; 6ea7e (1b:6a7e)
	cp $4
	jp nc, Func_6eae3
	push af
	ld e, $0
	ld c, $0
Func_6ea88: ; 6ea88 (1b:6a88)
	ld a, c
	cp $2
	jp nc, Func_6ead6
	ld hl, sp+$10
	ld [hl], $0
Func_6ea92: ; 6ea92 (1b:6a92)
	ld hl, sp+$10
	ld a, [hl]
	cp $2
	jp nc, Func_6ead2
	push de
	ld d, $0
	ld hl, Data_6e9c5
	add hl, de
	ld a, [hl]
	ld hl, sp+$12
	ld e, [hl]
	ld d, $0
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $16
	pop de
	add hl, de
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$10
	ld a, [hl]
	inc a
	ld hl, sp+$10
	ld [hl], a
	jp Func_6ea92

Func_6ead2: ; 6ead2 (1b:6ad2)
	inc c
	jp Func_6ea88

Func_6ead6: ; 6ead6 (1b:6ad6)
	ld hl, sp+$d
	ld a, [hl]
	add $8
	ld hl, sp+$d
	ld [hl], a
	pop af
	inc a
	jp Func_6ea7e

Func_6eae3: ; 6eae3 (1b:6ae3)
	pop af
	inc a
	jp Func_6ea58

Func_6eae8: ; 6eae8 (1b:6ae8)
	ld e, $0
	xor a
	call Func_6ee8b
	ld e, $1
	xor a
	call Func_6ee8b
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6eb0a
	ld bc, $400
	debgcoord 0, 0
	hlbgcoord 0, 0, vWindowMap
	call CopyFromDEtoHL
	jp Func_6eb16

Func_6eb0a: ; 6eb0a (1b:6b0a)
	ld bc, $400
	debgcoord 0, 0, vWindowMap
	hlbgcoord 0, 0
	call CopyFromDEtoHL
Func_6eb16: ; 6eb16 (1b:6b16)
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	add sp, $e
	ret

Func_6eb1f: ; 6eb1f (1b:6b1f)
	push bc
	push bc
	check_cgb
	jp nz, Func_6eb31
	ld a, BANK(MapTiles_CGB)
	ld de, MapTiles_CGB
	jp Func_6eb36

Func_6eb31: ; 6eb31 (1b:6b31)
	ld a, BANK(MapTiles_SGB_DMG)
	ld de, MapTiles_SGB_DMG
Func_6eb36: ; 6eb36 (1b:6b36)
	push af
	push de
	ld [wFarCallDestBank], a
	ld hl, $6a0
	add hl, de
	reg16swap de, hl
	ld hl, $8a00
	ld bc, $20
	call FarRequestVideoData
	pop de
	push de
	ld hl, $7a0
	add hl, de
	reg16swap de, hl
	ld hl, $8a20
	ld bc, $20
	call FarRequestVideoData
	pop de
	push de
	inc d
	inc d
	inc d
	ld hl, $8a40
	ld bc, $10
	call FarRequestVideoData
	pop de
	push de
	ld hl, $19a0
	add hl, de
	reg16swap de, hl
	ld hl, $8a50
	ld bc, $30
	call FarRequestVideoData
	pop de
	push de
	ld hl, $1aa0
	add hl, de
	reg16swap de, hl
	ld hl, $8a80
	ld bc, $30
	call FarRequestVideoData
	pop de
	pop af
	push de
	push af
	ld hl, $1ba0
	add hl, de
	reg16swap de, hl
	ld hl, $8ab0
	ld bc, $30
	call FarRequestVideoData
	call ClearSprites
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld hl, $2b
	add hl, bc
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, $2b
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld c, $0
Func_6ebed: ; 6ebed (1b:6bed)
	ld a, c
	cp $2
	jp nc, Func_6ec3e
	push bc
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld e, [hl]
	call FarCall
	ld l, a
	push hl
	ld a, $e
	call OverworldPlaySong
	pop hl
	pop bc
	push bc
	push hl
	ld a, c
	add a
	add a
	ld d, a
	add a
	add d
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld h, a
	ld e, $c
	ld c, $c
	call FarCall
	pop bc
	inc c
	jp Func_6ebed

Func_6ec3e: ; 6ec3e (1b:6c3e)
	pop af
	ld [wFarCallDestBank], a
	pop de
	push de
	ld hl, $3f80
	add hl, de
	reg16swap de, hl
	ld hl, $8180
	ld bc, $40
	call FarRequestVideoData
	pop de
	ld hl, $3f80
	add hl, de
	reg16swap de, hl
	ld hl, $81c0
	ld bc, $40
	call FarRequestVideoData
	pop bc
	pop bc
	ret

Func_6ec6a: ; 6ec6a (1b:6c6a)
	push af
	push de
	push bc
	ld hl, sp+$5
	ld a, [hl]
	add $8
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	add $8
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	add $10
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	add $10
	ld hl, sp+$8
	ld [hl], a
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nz, Func_6eca8
	xor a
	jp Func_6ecb8

Func_6eca8: ; 6eca8 (1b:6ca8)
	ld hl, sp+$a
	ld a, [hl]
	cp $3
	jp nz, Func_6ecb5
	ld a, $2
	jp Func_6ecb8

Func_6ecb5: ; 6ecb5 (1b:6cb5)
	ld hl, sp+$a
	ld a, [hl]
Func_6ecb8: ; 6ecb8 (1b:6cb8)
	push af
	ld hl, sp+$e
	ld a, [hl]
	cp $2
	jp nz, Func_6ecc6
	ld l, $0
	jp Func_6ecd6

Func_6ecc6: ; 6ecc6 (1b:6cc6)
	ld hl, sp+$e
	ld a, [hl]
	cp $3
	jp nz, Func_6ecd3
	ld l, $2
	jp Func_6ecd6

Func_6ecd3: ; 6ecd3 (1b:6cd3)
	ld hl, sp+$e
	ld l, [hl]
Func_6ecd6: ; 6ecd6 (1b:6cd6)
	push hl
	set_farcall_addrs_hli UpdateCurSprite
	pop hl
	pop af
	push hl
	ld l, a
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	inc d
	ld c, e
	ld b, d
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld d, h
	xor a
	call FarCall
	set_farcall_addrs_hli UpdateCurSprite
	pop hl
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	inc d
	ld c, e
	ld b, d
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld d, h
	ld a, $c
	call FarCall
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_6ed34
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$8
	ld [hl], e
Func_6ed34: ; 6ed34 (1b:6d34)
	ld hl, sp+$2
	ld a, [hl]
	cp $30
	jp nc, Func_6ed73
	ld hl, sp+$2
	ld a, [hl]
	cp $1c
	jp nc, Func_6ed49
	ld l, $1a
	jp Func_6ed4b

Func_6ed49: ; 6ed49 (1b:6d49)
	ld l, $18
Func_6ed4b: ; 6ed4b (1b:6d4b)
	ld a, $38
	ld [wOAM18YCoord], a
	ld a, $50
	ld [wOAM18XCoord], a
	ld a, l
	ld [wOAM18VTile], a
	xor a
	ld [wOAM18Attrs], a
	ld a, $38
	ld [wOAM19YCoord], a
	ld a, $58
	ld [wOAM19XCoord], a
	ld a, l
	inc a
	ld [wOAM19VTile], a
	xor a
	ld [wOAM19Attrs], a
	jp Func_6ed7b

Func_6ed73: ; 6ed73 (1b:6d73)
	xor a
	ld [wOAM18YCoord], a
	xor a
	ld [wOAM19YCoord], a
Func_6ed7b: ; 6ed7b (1b:6d7b)
	ld hl, sp+$8
	ld a, [hl]
	cp $80
	jp nc, Func_6edba
	ld hl, sp+$8
	ld a, [hl]
	cp $6c
	jp nc, Func_6ed90
	ld l, $1e
	jp Func_6ed92

Func_6ed90: ; 6ed90 (1b:6d90)
	ld l, $1c
Func_6ed92: ; 6ed92 (1b:6d92)
	ld a, $88
	ld [wOAM1aYCoord], a
	ld a, $50
	ld [wOAM1aXCoord], a
	ld a, l
	ld [wOAM1aVTile], a
	xor a
	ld [wOAM1aAttrs], a
	ld a, $88
	ld [wOAM1bYCoord], a
	ld a, $58
	ld [wOAM1bXCoord], a
	ld a, l
	inc a
	ld [wOAM1bVTile], a
	xor a
	ld [wOAM1bAttrs], a
	jp Func_6edc2

Func_6edba: ; 6edba (1b:6dba)
	xor a
	ld [wOAM1aYCoord], a
	xor a
	ld [wOAM1bYCoord], a
Func_6edc2: ; 6edc2 (1b:6dc2)
	pop bc
	pop bc
	pop bc
	ret

Data_6edc6:
	db $a5, $a6, $a7, $a8, $a6, $aa, $ab, $ac, $ad

Func_6edcf: ; 6edcf (1b:6dcf)
	push bc
	push bc
	inc e
	dec e
	jp nz, Func_6eddd
	ld hl, sp+$3
	ld [hl], $0
	jp Func_6ede1

Func_6eddd: ; 6eddd (1b:6ddd)
	ld hl, sp+$3
	ld [hl], $a
Func_6ede1: ; 6ede1 (1b:6de1)
	or a
	jp nz, Func_6ee51
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6edf5
	hlbgcoord 0, 0
	call WriteHLToSPPlus3
	jp Func_6edfb

Func_6edf5: ; 6edf5 (1b:6df5)
	hlbgcoord 0, 0, vWindowMap
	call WriteHLToSPPlus3
Func_6edfb: ; 6edfb (1b:6dfb)
	ld e, $0
	ld c, $0
Func_6edff: ; 6edff (1b:6dff)
	ld a, c
	cp $3
	jp nc, Func_6ee4e
	ld hl, sp+$0
	ld [hl], $0
Func_6ee09: ; 6ee09 (1b:6e09)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_6ee4a
	push de
	ld d, $0
	ld hl, Data_6edc6
	add hl, de
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $1c
	add hl, de
	push hl
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, $0
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, de
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call GetHLAtSPPlus9
	pop de
	add hl, de
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6ee09

Func_6ee4a: ; 6ee4a (1b:6e4a)
	inc c
	jp Func_6edff

Func_6ee4e: ; 6ee4e (1b:6e4e)
	jp Func_6ee7f

Func_6ee51: ; 6ee51 (1b:6e51)
	set_farcall_addrs_hli Func_667d
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, $a400
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $1e06
	add hl, de
	push hl
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld de, $1c04
	add hl, de
	pop de
	call FarCall
Func_6ee7f: ; 6ee7f (1b:6e7f)
	pop bc
	pop bc
	ret

Data_6ee82:
	db $05, $05, $05, $05, $05, $05, $05, $05, $05

Func_6ee8b: ; 6ee8b (1b:6e8b)
	push bc
	push bc
	inc e
	dec e
	jp nz, Func_6ee99
	ld hl, sp+$3
	ld [hl], $0
	jp Func_6ee9d

Func_6ee99: ; 6ee99 (1b:6e99)
	ld hl, sp+$3
	ld [hl], $a
Func_6ee9d: ; 6ee9d (1b:6e9d)
	or a
	jp nz, Func_6ef0a
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_6eeb1
	hlbgcoord 0, 0
	call WriteHLToSPPlus3
	jp Func_6eeb7

Func_6eeb1: ; 6eeb1 (1b:6eb1)
	hlbgcoord 0, 0, vWindowMap
	call WriteHLToSPPlus3
Func_6eeb7: ; 6eeb7 (1b:6eb7)
	ld e, $0
	ld c, $0
Func_6eebb: ; 6eebb (1b:6ebb)
	ld a, c
	cp $3
	jp nc, Func_6ef0a
	ld hl, sp+$0
	ld [hl], $0
Func_6eec5: ; 6eec5 (1b:6ec5)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_6ef06
	push de
	ld d, $0
	ld hl, Data_6ee82
	add hl, de
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $1c
	add hl, de
	push hl
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, $0
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, de
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call GetHLAtSPPlus9
	pop de
	add hl, de
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6eec5

Func_6ef06: ; 6ef06 (1b:6f06)
	inc c
	jp Func_6eebb

Func_6ef0a: ; 6ef0a (1b:6f0a)
	pop bc
	pop bc
	ret

Func_6ef0d:: ; 6ef0d (1b:6f0d)
	ld hl, -$352
	add hl, sp
	ld sp, hl
	push af
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_7e8a
	pop hl
	pop af
	push hl
	push af
	add $55
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $351
	call FarCall
	ld a, $1
	call GetSRAMBank_ReadOnly
	set_farcall_addrs_hli Func_7766
	pop af
	ld l, a
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $1
	call FarCall
	pop hl
	ld a, l
	call GetSRAMBank
	ld hl, $352
	add hl, sp
	ld sp, hl
	ret

Func_6ef7f:: ; 6ef7f (1b:6f7f)
	ld hl, -$380
	add hl, sp
	ld sp, hl
	push af
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$31
	reg16swap de, hl
	ld hl, $351
	call FarCall
	set_farcall_addrs_hli Func_7f14
	pop af
	push af
	add $55
	ld hl, sp+$31
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $2f
	call FarCall
	pop af
	push af
	ld hl, sp+$e
	ld [hl], a
	set_farcall_addrs_hli Func_fb0db
	pop af
	push af
	add $55
	ld e, a
	ld hl, sp+$2
	call FarCall
	pop af
	ld hl, $380
	add hl, sp
	ld sp, hl
	ret

Func_6eff0::
	add sp, -$30
	push af
	push de
	ld hl, sp+$33
	ldh a, [hSRAMBank]
	ld [hl], a
	set_farcall_addrs_hli malloc
	ld hl, $351
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli malloc
	ld hl, $351
	call FarCall
	pop bc
	pop de
	pop af
	inc e
	dec e
	jp nz, Func_6f0f7
	push bc
	push hl
	push af
	set_farcall_addrs_hli Func_7e8a
	pop af
	pop hl
	pop bc
	push af
	push hl
	push bc
	ld e, c
	ld d, b
	add $55
	call FarCall
	set_farcall_addrs_hli Func_7766
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, $351
	ld c, $1
	call FarCall
	set_farcall_addrs_hli Func_7748
	pop bc
	pop hl
	push bc
	push hl
	reg16swap de, hl
	ld hl, $351
	ld c, $1
	call FarCall
	ld a, $1
	call GetSRAMBank_ReadOnly
	set_farcall_addrs_hli Func_7766
	pop hl
	pop bc
	pop af
	push bc
	push hl
	push af
	ld l, a
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $1
	call FarCall
	ld hl, sp+$35
	ld a, [hl]
	call GetSRAMBank
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2f
	call FarCall
	pop af
	push af
	ld hl, sp+$12
	ld [hl], a
	set_farcall_addrs_hli Func_7f14
	pop af
	pop hl
	push hl
	push af
	reg16swap de, hl
	add $55
	call FarCall
	set_farcall_addrs_hli Func_fb0db
	pop af
	add $55
	ld e, a
	ld hl, sp+$4
	call FarCall
	pop hl
	pop bc
	jp Func_6f1c5

Func_6f0f7: ; 6f0f7 (1b:70f7)
	push bc
	push hl
	push af
	set_farcall_addrs_hli Func_7e8a
	pop af
	pop hl
	pop bc
	push af
	push bc
	push hl
	ld e, c
	ld d, b
	add $55
	call FarCall
	set_farcall_addrs_hli Func_7748
	pop hl
	pop bc
	push hl
	push bc
	reg16swap de, hl
	ld hl, $351
	ld c, $1
	call FarCall
	set_farcall_addrs_hli Func_7766
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, $351
	ld c, $1
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2f
	call FarCall
	pop bc
	pop hl
	pop af
	push bc
	push hl
	push af
	ld hl, sp+$12
	ld [hl], a
	ld a, $1
	call GetSRAMBank_ReadOnly
	set_farcall_addrs_hli Func_7766
	pop af
	push af
	ld l, a
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $1
	call FarCall
	ld hl, sp+$35
	ld a, [hl]
	call GetSRAMBank
	set_farcall_addrs_hli Func_7f14
	pop af
	pop hl
	push hl
	push af
	reg16swap de, hl
	add $55
	call FarCall
	set_farcall_addrs_hli Func_fb0db
	pop af
	add $55
	ld e, a
	ld hl, sp+$4
	call FarCall
	pop hl
	pop bc
Func_6f1c5: ; 6f1c5 (1b:71c5)
	push hl
	push bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, sp+$c
	ld a, [hl]
	add sp, $30
	ret

Func_6f1eb:: ; 6f1eb (1b:71eb)
	push de
	add sp, -$54
	push af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $12
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$54
	ld [hl], $0
	ld c, e
	ld b, d
	push bc
	set_farcall_addrs_hli GetRobotFromWarehouse
	pop bc
	pop af
	push af
	push bc
	ld hl, sp+$58
	ld c, [hl]
	ld b, $0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$33
	reg16swap de, hl
	call FarCall
	pop bc
	ld hl, sp+$38
	ld a, [hl]
	cp $63
	jp c, Func_6f244
	ld bc, $0
Func_6f244: ; 6f244 (1b:7244)
	read_hl_from_sp_plus $47
	add hl, bc
	write_hl_to_sp_plus $47
	ld hl, sp+$31
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$38
	ld e, [hl]
	ld hl, sp+$2
	call FarCall
	read_hl_from_sp_plus $1e
	push hl
	read_hl_from_sp_plus $43
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $41
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $47
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $45
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4a
	read_hl_from_sp_plus $2b
	push hl
	read_hl_from_sp_plus $50
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4e
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4c
	ld de, $0
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$38
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $47
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, Func_6f34c
Func_6f2e8: ; 6f2e8 (1b:72e8)
	read_hl_from_sp_plus $47
	ld a, l
	sub c
	ld a, h
	sbc b
	jp c, Func_6f329
	ld hl, sp+$38
	ld a, [hl]
	cp $63
	jp nc, Func_6f329
	ld hl, sp+$38
	ld a, [hl]
	inc a
	ld hl, sp+$38
	ld [hl], a
	ld hl, sp+$54
	ld a, [hl]
	inc a
	ld hl, sp+$54
	ld [hl], a
	read_hl_from_sp_plus $47
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	write_hl_to_sp_plus $47
	ld de, $0
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$38
	ld l, [hl]
	ld h, a
	call Func_270a
	ld c, l
	ld b, h
	jp Func_6f32c

Func_6f329: ; 6f329 (1b:7329)
	jp Func_6f32f

Func_6f32c: ; 6f32c (1b:732c)
	jp Func_6f2e8

Func_6f32f: ; 6f32f (1b:732f)
	ld hl, sp+$31
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$38
	ld e, [hl]
	ld hl, sp+$2
	call FarCall
Func_6f34c: ; 6f34c (1b:734c)
	read_hl_from_sp_plus $1e
	push hl
	read_hl_from_sp_plus $43
	pop de
	add hl, de
	write_hl_to_sp_plus $41
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_6f36f
	ld hl, 999
	write_hl_to_sp_plus $41
Func_6f36f: ; 6f36f (1b:736f)
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $47
	pop de
	add hl, de
	write_hl_to_sp_plus $45
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_6f392
	ld hl, 999
	write_hl_to_sp_plus $45
Func_6f392: ; 6f392 (1b:7392)
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	add hl, de
	write_hl_to_sp_plus $4a
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_6f3b5
	ld hl, 999
	write_hl_to_sp_plus $4a
Func_6f3b5: ; 6f3b5 (1b:73b5)
	read_hl_from_sp_plus $2b
	push hl
	read_hl_from_sp_plus $50
	pop de
	add hl, de
	write_hl_to_sp_plus $4e
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_6f3d8
	ld hl, 999
	write_hl_to_sp_plus $4e
Func_6f3d8: ; 6f3d8 (1b:73d8)
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	add hl, de
	write_hl_to_sp_plus $4c
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_6f3fb
	ld hl, 999
	write_hl_to_sp_plus $4c
Func_6f3fb: ; 6f3fb (1b:73fb)
	read_hl_from_sp_plus $41
	write_hl_to_sp_plus $3f
	read_hl_from_sp_plus $45
	write_hl_to_sp_plus $43
	set_farcall_addrs_hli Func_7db0
	pop af
	ld hl, sp+$54
	ld c, [hl]
	ld b, $0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2f
	reg16swap de, hl
	call FarCall
	ld hl, sp+$52
	ld a, [hl]
	add sp, $56
	ret

Func_6f43b:: ; 6f43b (1b:743b)
	push af
	push bc
	ld hl, sp+$1
	ld [hl], $0
Func_6f441: ; 6f441 (1b:7441)
	ld hl, sp+$1
	ld a, [hl]
	cp $3
	jp nc, Func_6f4bb
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_6f4b1
	ld hl, sp+$0
	ld [hl], $0
Func_6f467: ; 6f467 (1b:7467)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_6f4b1
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	add hl, bc
	cp [hl]
	jp nc, Func_6f4a7
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	add hl, bc
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_6f4a7: ; 6f4a7 (1b:74a7)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6f467

Func_6f4b1: ; 6f4b1 (1b:74b1)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_6f441

Func_6f4bb: ; 6f4bb (1b:74bb)
	pop bc
	pop bc
	ret

INCLUDE "engine/std_scripts/heal.asm"

Func_6f6de:: ; 6f6de (1b:76de)
	push af
	inc e
	dec e
	jp nz, Func_6f74d
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6f74a
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6f737
	xor a
	call Func_6f785
	or a
	jp nz, Func_6f732
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	jp Func_6f760

Func_6f732: ; 6f732 (1b:7732)
	ld a, $ff
	jp Func_6f760

Func_6f737: ; 6f737 (1b:7737)
	callba_hli Func_fb205
	ld a, $1
	jp Func_6f760

Func_6f74a: ; 6f74a (1b:774a)
	jp Func_6f760

Func_6f74d: ; 6f74d (1b:774d)
	push de
	set_farcall_addrs_hli Func_4ec2b
	pop de
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
Func_6f760: ; 6f760 (1b:7760)
	pop bc
	ret

Pointers_6f762:
	dw Data_6f768
	dw Data_6f776
	dw $0

Data_6f768:
	dstr "(そうこもいっはﾟいてﾞ)"

Data_6f776:
	dstr "(これいしﾞょうもてないよ)"

Func_6f785:: ; 6f785 (1b:7785)
	push af
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpAttrMapRectangle
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	set_farcall_addrs_hli PrintMapText_
	ld bc, BANK(Pointers_6f762)
	ld de, Pointers_6f762
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld de, Data_6f95b
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld c, l
	ld b, h
	pop hl
	pop de
	push bc
	ld a, c
	or b
	jp nz, Func_6f906
	push de
	callba_hli Func_17470
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_6f886
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_6f89a
Func_6f886: ; 6f886 (1b:7886)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_6f89a: ; 6f89a (1b:789a)
	call Func_3af6
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp z, Func_6f8ba
	or a
	jp nz, Func_6f8c8
	callba_hli Func_1535c
	jp Func_6f8c8

Func_6f8ba: ; 6f8ba (1b:78ba)
	callba_hli Func_1491a
Func_6f8c8: ; 6f8c8 (1b:78c8)
	callba_hli Func_17488
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop de
	jp Func_6f947

Func_6f906: ; 6f906 (1b:7906)
	push hl
	push de
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld c, e
	ld b, d
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreAttrMapRectangle
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop de
	pop hl
	push de
	call FarCall
	pop de
Func_6f947: ; 6f947 (1b:7947)
	push de
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop bc
	ld a, c
	pop bc
	ret

Data_6f95b:
	dstr "(すてる?)"

Func_6f962:: ; 6f962 (1b:7962)
	add sp, -$52
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$2f
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$36
	ld e, [hl]
	ld hl, sp+$0
	call FarCall
	read_hl_from_sp_plus $1c
	push hl
	read_hl_from_sp_plus $41
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $3f
	read_hl_from_sp_plus $20
	push hl
	read_hl_from_sp_plus $45
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $43
	read_hl_from_sp_plus $25
	push hl
	read_hl_from_sp_plus $4a
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $48
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4c
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4a
	ld hl, sp+$36
	ld a, [hl]
	inc a
	ld hl, sp+$36
	ld [hl], a
	ld hl, sp+$2f
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotBaseStats
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$36
	ld e, [hl]
	ld hl, sp+$0
	call FarCall
	read_hl_from_sp_plus $1c
	push hl
	read_hl_from_sp_plus $41
	pop de
	add hl, de
	write_hl_to_sp_plus $3f
	read_hl_from_sp_plus $20
	push hl
	read_hl_from_sp_plus $45
	pop de
	add hl, de
	write_hl_to_sp_plus $43
	read_hl_from_sp_plus $25
	push hl
	read_hl_from_sp_plus $4a
	pop de
	add hl, de
	write_hl_to_sp_plus $48
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	add hl, de
	write_hl_to_sp_plus $4c
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	add hl, de
	write_hl_to_sp_plus $4a
	read_hl_from_sp_plus $3f
	write_hl_to_sp_plus $3d
	read_hl_from_sp_plus $43
	write_hl_to_sp_plus $41
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$36
	ld c, [hl]
	ld b, $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $502
	add hl, de
	ld de, $103
	call Func_2230
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	add sp, $52
	ret

Func_6faba:: ; 6faba (1b:7aba)
	push af
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_6face
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_6fae2
Func_6face: ; 6face (1b:7ace)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_6fae2: ; 6fae2 (1b:7ae2)
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $a
	ld hl, $506
	call FarCall
	ld e, $7
	ld a, $6
	call SetStringStartState
	pop af
	or a
	jp nz, Func_6fb1f
	ld hl, Data_6fb43
	push hl
	call PlaceString
	pop bc
	jp Func_6fb27

Func_6fb1f: ; 6fb1f (1b:7b1f)
	ld hl, Data_6fb4c
	push hl
	call PlaceString
	pop bc
Func_6fb27: ; 6fb27 (1b:7b27)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	xor a
Func_6fb34: ; 6fb34 (1b:7b34)
	cp $3c
	jp nc, Func_6fb42
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_6fb34

Func_6fb42: ; 6fb42 (1b:7b42)
	ret

Data_6fb43:
	dstr "(あなたのかち)"

Data_6fb4c:
	dstr "(あなたのまけ)"

INCLUDE "engine/predef.asm"


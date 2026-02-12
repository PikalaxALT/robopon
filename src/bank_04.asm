INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 04", ROMX
Func_10000: ; 10000
	ret

Func_10001: ; 10001
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	jp FarCall

Func_10011:: ; 10011 (4:4011)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $a
	ld e, $a
	ld hl, $0
	call FarCall
	ld e, $2
	ld a, $1
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_1019d
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $2
	ld a, $2
	call SetStringStartState
	ld hl, Data_101a0
	push hl
	call PlaceString
	pop bc
	ld e, $4
	ld a, $2
	call SetStringStartState
	ld hl, Data_101a8
	push hl
	call PlaceString
	pop bc
	ld e, $6
	ld a, $2
	call SetStringStartState
	ld hl, Data_101af
	push hl
	call PlaceString
	pop bc
	ld e, $8
	ld a, $2
	call SetStringStartState
	ld hl, Data_101b6
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld e, $0
	ld c, e
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
	pop bc
Func_100a4: ; 100a4 (4:40a4)
	push bc
	push de
	call NextOverworldFrame
	call GetJoyPressed
	ld l, a
	ld h, $0
	pop de
	pop bc
	ld a, l
	and $10
	jp z, Func_10102
	ld a, c
	cp $3
	jp z, Func_100ef
	cp $2
	jp z, Func_100e6
	cp $1
	jp z, Func_100d3
	or a
	jp nz, Func_100ff
	ld a, $2
	call Func_10abf
	jp Func_100ff

Func_100d3: ; 100d3 (4:40d3)
	set_farcall_addrs_hli Func_6c5bb
	ld a, $2
	call FarCall
	jp Func_100ff

Func_100e6: ; 100e6 (4:40e6)
	ld a, $2
	call Func_1228e
	ld a, l
	jp Func_100ff

Func_100ef: ; 100ef (4:40ef)
	set_farcall_addrs_hli Func_6d395
	ld a, $2
	call FarCall
Func_100ff: ; 100ff (4:40ff)
	jp Func_10190

Func_10102: ; 10102 (4:4102)
	ld a, l
	and $4
	jp z, Func_1013b
	ld a, c
	cp $1
	jp c, Func_1010f
	dec c
Func_1010f: ; 1010f (4:410f)
	push bc
	ld a, e
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8f
	ld [hl], a
	pop bc
	push bc
	ld a, c
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	jp Func_1017d

Func_1013b: ; 1013b (4:413b)
	ld a, l
	and $8
	jp z, Func_10174
	ld a, c
	cp $3
	jp nc, Func_10148
	inc c
Func_10148: ; 10148 (4:4148)
	push bc
	ld a, e
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8f
	ld [hl], a
	pop bc
	push bc
	ld a, c
	add a
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	jp Func_1017d

Func_10174: ; 10174 (4:4174)
	ld a, l
	and $20
	jp z, Func_1017d
	jp Func_10190

Func_1017d: ; 1017d (4:417d)
	push bc
	push de
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop de
	pop bc
	jp Func_100a4

Func_10190: ; 10190 (4:4190)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Data_1019d: ; 1019d
	dstr "%c"

Data_101a0: ; 101a0
	db "スヒﾟータﾞー", $0 ; speeder

Data_101a8: ; 101a8
	db "ハﾟンチャー", $0 ; puncher

Data_101af: ; 101af
	db "シールタﾞー", $0 ; shielder

Data_101b6: ; 101b6
	db "シﾞャンハﾟー", $0 ; jumper

Func_101be:: ; 101be
	push bc
	push bc
	push de
	push hl
	ld de, $100
	call DivideHLByDESigned
	ld c, l
	pop hl
	ld a, l
	pop de
	push bc
	push af
	push de
	reg16swap de, hl
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	pop de
	ld l, e
	pop af
	pop bc
	push hl
	ld e, a
	ld a, c
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld c, l
	ld b, h
	xor a
	pop hl
Func_101f0: ; 101f0 (4:41f0)
	cp l
	jp nc, Func_10212
	push hl
	push af
	call GetHLAtSPPlus8
	ld a, l
	ld [bc], a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_10206
	inc bc
	jp Func_1020c

Func_10206: ; 10206 (4:4206)
	ld hl, $14
	add hl, bc
	ld c, l
	ld b, h
Func_1020c: ; 1020c (4:420c)
	pop af
	inc a
	pop hl
	jp Func_101f0

Func_10212: ; 10212 (4:4212)
	pop bc
	pop bc
	ret

Func_10215: ; 10215
	push bc
	push bc
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	call WriteHLToSPPlus4
	xor a
	pop bc
Func_10224: ; 10224 (4:4224)
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_1025b
	push af
	xor a
Func_1022c: ; 1022c (4:422c)
	cp c
	jp nc, Func_10240
	call GetHLAtSPPlus4
	ld [hl], $8f
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	inc a
	jp Func_1022c

Func_10240: ; 10240 (4:4240)
	pop af
	push bc
	push af
	ld b, $0
	ld hl, $14
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop af
	inc a
	pop bc
	jp Func_10224

Func_1025b: ; 1025b (4:425b)
	pop bc
	ret

Func_1025d: ; 1025d (4:425d)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_1025d
	ret

Data_10268: ; 10268
	db $6c, $42, $00, $00, $bd, $b8, $d7, $af, $cc, $df, $28, $c6, $20, $c5, $af, $c3, $b2, $d9, $d6, $29, $00

Data_1027d: ; 1027d
	db $21, $02, $07, $1a, $00, $05, $09, $0c, $03, $1f, $0a, $05, $13, $0c

Func_1028b:: ; 1028b
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	push hl
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, Data_10268
	ld bc, $4
	call MemCopy
	ld a, $2
	ld [wInBattle], a
	ld a, SONG_WILD_BATTLE
	call OverworldPlaySong
	pop de
	pop bc
	push de
	ld a, $11
	ld [bc], a
	read_hl_from wCurRobotPointer
	ld de, $1aa
	add hl, de
	ld [hl], $0
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld [hl], a
	pop de
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_10327
	push bc
	push de
	callba_hli Func_f771
	pop de
	ld hl, $9
	add hl, de
	ld [hl], $3
	ld a, [hl]
	ld hl, $8
	add hl, de
	ld [hl], a
	pop bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, $6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], a
	ld a, $1
	jp Func_10342

Func_10327: ; 10327 (4:4327)
	xor a
	ld hl, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld hl, $8
	add hl, de
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $ff
	ld a, $1
Func_10342: ; 10342 (4:4342)
	push de
	push bc
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, wc7bd
	ld l, [hl]
	ld h, $0
	ld de, wc7b1
	add hl, de
	ld a, [hl]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld [hl], a
	pop bc
	push bc
	ld hl, $7
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	ld hl, $9
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
Func_10381: ; 10381 (4:4381)
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $3
	call FarCall
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	call FarCall
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_103b5
	jp Func_103fe

Func_103b5: ; 103b5 (4:43b5)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
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
	set_farcall_addrs_hli PrintMapText_
	ld c, $4
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	jp Func_10381

Func_103fe: ; 103fe (4:43fe)
	pop bc
	pop de
	inc de
	ld hl, $c
	add hl, bc
	ld bc, $6
	call MemCopy
	ld hl, sp+$a
	ld [hl], $0
Func_1040f: ; 1040f (4:440f)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nc, Func_10472
	set_farcall_addrs_hli Func_dbf5
	ld hl, sp+$a
	ld a, [hl]
	or a
	jp nz, Func_10445
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld c, [hl]
	ld a, [wc2e9]
	ld e, a
	ld hl, sp+$a
	ld a, [hl]
	call FarCall
	jp Func_10468

Func_10445: ; 10445 (4:4445)
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	inc hl
	ld c, [hl]
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	ld a, [hl]
	call FarCall
Func_10468: ; 10468 (4:4468)
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	jp Func_1040f

Func_10472: ; 10472 (4:4472)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld c, $0
Func_10480: ; 10480 (4:4480)
	ld a, c
	cp $2
	jp nc, Func_104b0
	push de
	push bc
	set_farcall_addrs_hli Func_dc0a
	pop bc
	pop de
	push de
	push bc
	ld hl, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, c
	call FarCall
	pop bc
	inc c
	pop de
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	jp Func_10480

Func_104b0: ; 104b0 (4:44b0)
	ld a, [wSystemType]
	cp $1
	jp z, Func_104c0
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_104c9
Func_104c0: ; 104c0 (4:44c0)
	ld de, $e
	ld hl, Data_1027d
	call Func_2b7d
Func_104c9: ; 104c9 (4:44c9)
	set_farcall_addrs_hli Func_d030
	xor a
	call FarCall
	xor a
	ld [wInBattle], a
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_104ef
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_10503
Func_104ef: ; 104ef (4:44ef)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_10503: ; 10503 (4:4503)
	add sp, $c
	ret

Func_10506: ; 10506 (4:4506)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_1051a: ; 1051a (4:451a)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_1052e: ; 1052e (4:452e)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, [wc319]
	cp $81
	jp nz, Func_1054c
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	jp Func_1055a

Func_1054c: ; 1054c (4:454c)
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_10506
Func_1055a: ; 1055a (4:455a)
	pop bc
	ret

Func_1055c: ; 1055c (4:455c)
	push af
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f1f
	ld hl, $0
	call FarCall
	check_cgb
	jp nz, Func_105af
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	ld de, $1f1f
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_105af: ; 105af (4:45af)
	call WaitVideoTransfer
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_105c4
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_105cc

Func_105c4: ; 105c4 (4:45c4)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_105cc: ; 105cc (4:45cc)
	pop bc
	ret

Func_105ce:: ; 105ce
	push af
	call Func_1052e
	ld a, [wc319]
	cp $81
	jp nz, Func_105e8
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld [hl], $3
	jp Func_105f3

Func_105e8: ; 105e8 (4:45e8)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld [hl], $1
Func_105f3: ; 105f3 (4:45f3)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_1063b
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOptionsMenu_StereoSelect]
	ld e, a
	ld a, $1
	call FarCall
	ld c, $0
	ld de, wRNGState
	ld hl, $2
	call Func_1051a
	jp Func_106b1

Func_1063b: ; 1063b (4:463b)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_1067b
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOptionsMenu_StereoSelect]
	ld e, a
	ld a, $1
	call FarCall
	ld c, $0
	ld de, wRNGState
	ld hl, $2
	call Func_10506
	jp Func_106b1

Func_1067b: ; 1067b (4:467b)
	set_farcall_addrs_hli Func_dbf5
	ld c, $8
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	ld a, $1
	call FarCall
	set_farcall_addrs_hli Func_dbf5
	ld c, $7
	ld a, [wOptionsMenu_StereoSelect]
	ld e, a
	xor a
	call FarCall
	ld c, $0
	ld de, wRNGState
	ld hl, $2
	call Func_10506
Func_106b1: ; 106b1 (4:46b1)
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	ld a, [wOverworldTilemapSelector]
	call Func_1055c
	xor a
	ld [wSCX2], a
	ld [wSCX], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
.asm_106f9
	ld a, [wNextVBlankFlags]
	or $14
	ld [wNextVBlankFlags], a
	call Func_1025d
	ld a, [wOverworldTilemapSelector]
	xor $1
	call Func_1055c
	ld a, [wSystemType]
	cp $1
	jp z, Func_1071e
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_10732
Func_1071e: ; 1071e (4:471e)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_10732: ; 10732 (4:4732)
	pop bc
	ret

Data_10734: ; 10734
	dstr "(てﾞはﾞっく)"

Data_1073d: ; 1073d
	db $00, $00, $00, $01, $00, $ae, $ad, $01, $00, $3f, $01, $00, $02, $32, $06, $09, $00, $06, $01, $01, $02, $03, $03, $03, $00, $02, $01, $03, $03, $03, $03, $00, $03, $01, $04, $03, $03, $03, $00, $00, $00

Func_10766:: ; 10766
	add sp, -$32
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, Data_10734
	ld bc, $9
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_1073d
	ld bc, $29
	call MemCopy
	callba_hli AllocateMonsterStruct
	ld hl, sp+$29
	call WriteHLToSPPlus3
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld bc, $29
	call MemCopy
	add sp, $32
	ret

Func_107b8:: ; 107b8
	callba_hli FreeMonsterStruct
	ret

Data_107c7: ; 107c7
	db $21, $1, $3, $1a, $4, $1, $b, $8

Data_107cf: ; 107cf
	db $21, $1, $3, $1f, $4, $1, $b, $8

Func_107d7:: ; 107d7
	push af
	push de
	ld a, b
	push af
	push bc
	ld hl, sp+$7
	ld a, [hl]
	ld [wc316], a
	ld a, [wSystemType]
	cp $1
	jp z, Func_107f2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_1082a
Func_107f2: ; 107f2 (4:47f2)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_10819
	ld de, $8
	ld hl, Data_107c7
	call Func_2b7d
	jp Func_1082a

Func_10819: ; 10819 (4:4819)
	ld hl, sp+$7
	ld a, [hl]
	cp $1
	jp nz, Func_1082a
	ld de, $8
	ld hl, Data_107cf
	call Func_2b7d
Func_1082a: ; 1082a (4:482a)
	call WaitVideoTransfer
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $a
	ld a, $8
	call SetStringStartState
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_10876
	ld hl, Data_1095c
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $401
	call FarCall
	jp Func_108b8

Func_10876: ; 10876 (4:4876)
	ld hl, sp+$7
	ld a, [hl]
	cp $1
	jp nz, Func_108b0
	ld hl, Data_10964
	push hl
	call PlaceString
	pop bc
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
	ld hl, $401
	call FarCall
	jp Func_108b8

Func_108b0: ; 108b0 (4:48b0)
	ld hl, Data_1096c
	push hl
	call PlaceString
	pop bc
Func_108b8: ; 108b8 (4:48b8)
	call WaitVideoTransfer
	pop bc
	pop af
	push bc
	push af
	cp $2
	jp z, Func_108d3
	ld e, $2
	ld a, $d
	call SetStringStartState
	ld hl, Data_10973
	push hl
	call PlaceString
	pop bc
Func_108d3: ; 108d3 (4:48d3)
	pop af
	pop bc
	pop de
	push bc
	cp $1
	jp nz, Func_108fb
	push de
	ld e, $3
	ld a, $e
	call SetStringStartState
	pop de
	push de
	ld hl, Data_10979
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_1097e
	ld hl, $f04
	call PlaceStringDEatCoordHL
	jp Func_10912

Func_108fb: ; 108fb (4:48fb)
	or a
	jp nz, Func_10912
	push de
	ld e, $3
	ld a, $e
	call SetStringStartState
	pop de
	push de
	ld hl, Data_10983
	push hl
	call PlaceString
	pop bc
	pop bc
Func_10912: ; 10912 (4:4912)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	push bc
	ld a, c
	cp $1
	jp nz, Func_10935
	xor a
Func_10927: ; 10927 (4:4927)
	cp $1e
	jp nc, Func_10935
.asm_1092c
	push af
	call NextOverworldFrame
.asm_1092f
	pop af
	inc a
	jp Func_10927

Func_10935: ; 10935 (4:4935)
	pop bc
	ld hl, sp+$1
	ld a, [hl]
.asm_10939
	or a
	jp nz, Func_1095a
	ld a, c
	cp $1
	jp z, Func_1095a
	ld a, $2
	ld [wInBattle], a
	callba_hli Func_222b7
.asm_1094b
	xor a
	ld [wInBattle], a
Func_1095a: ; 1095a (4:495a)
	pop bc
	ret

Data_1095c: ; 1095c
	dstr "(のしょうり)"

Data_10964: ; 10964
	dstr "(のしょうり)"

Data_1096c: ; 1096c
	dstr "(ひきわけ)"

Data_10973: ; 10973
	dstr "(きろく)"

Data_10979: ; 10979
	dstr "%dキロ"

Data_1097e: ; 1097e
	dstr "メートル"

Data_10983: ; 10983
	dstr "%d(とん)"

Data_1098a: ; 1098a
	db $20, $00, $40, $00, $60, $00, $7c, $00

Data_10992: ; 10992
	db $7c, $00, $60, $00, $40, $00, $20, $00

Func_1099a:: ; 1099a
	add sp, -$2a
	push af
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, Data_1098a
	ld bc, $8
	call MemCopy
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_10992
	ld bc, $8
	call MemCopy
	pop af
	or a
	jp nz, Func_109cf
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jp Func_109e3

Func_109cf: ; 109cf (4:49cf)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	reg16swap de, hl
Func_109e3: ; 109e3 (4:49e3)
	ld hl, $27
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	push af
	ld hl, $b
	add hl, de
	ld a, [hl]
	and $f
	push af
	push bc
	ld hl, $17
	add hl, de
	ld l, [hl]
	push hl
	ld hl, $2e
	add hl, de
	ld a, [hl]
	ld hl, sp+$18
	ld [hl], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop hl
	push af
	ld e, l
	ld hl, sp+$19
	call GetPart
	pop af
	call GetSRAMBank
	pop bc
	ld hl, sp+$27
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_e39a
	pop de
	ld hl, sp+$14
	ld a, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_10a58
	ld bc, $1
Func_10a58: ; 10a58 (4:4a58)
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	reg16swap de, hl
	add sp, $2a
	reg16swap de, hl
	ret

Func_10a8b:: ; 10a8b
	call Func_1099a
	reg16swap de, hl
	ld hl, 220
	call CompareHLtoDE
	jp c, Func_10aa0
	ld a, $1
	jp Func_10abe

Func_10aa0: ; 10aa0 (4:4aa0)
	ld hl, 338
	call CompareHLtoDE
	jp c, Func_10aae
	ld a, $2
	jp Func_10abe

Func_10aae: ; 10aae (4:4aae)
	ld hl, 580
	call CompareHLtoDE
	jp c, Func_10abc
	ld a, $4
	jp Func_10abe

Func_10abc: ; 10abc (4:4abc)
	ld a, $8
Func_10abe: ; 10abe (4:4abe)
	ret

Func_10abf:: ; 10abf (4:4abf)
	push af
	ld c, $0
	ld e, c
	push bc
	push de
	ld hl, sp+$5
	ld a, [hl]
	cp $2
	jp nz, Func_10ad0
	call Func_10766
Func_10ad0: ; 10ad0 (4:4ad0)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_10ae1
	xor a
	call Func_105ce
	ld l, $1
	jp Func_10ae6

Func_10ae1: ; 10ae1 (4:4ae1)
	call Func_1028b
	ld l, $0
Func_10ae6: ; 10ae6 (4:4ae6)
	push hl
	ld a, $d
	call OverworldPlaySong
	pop hl
	pop de
	pop bc
Func_10aef: ; 10aef (4:4aef)
	push hl
	push bc
	push de
	ld a, l
	call Func_10b8a
	pop de
	pop bc
	or a
	jp nz, Func_10b00
	inc e
	jp Func_10b06

Func_10b00: ; 10b00 (4:4b00)
	cp $1
	jp nz, Func_10b06
	inc c
Func_10b06: ; 10b06 (4:4b06)
	push bc
	push de
	callba_hli WaitAorBButtonOverworld_17a44
	pop de
	pop bc
	pop hl
	ld a, e
	cp $1
	jp nz, Func_10b24
	ld c, $0
	jp Func_10b32

Func_10b24: ; 10b24 (4:4b24)
	ld a, c
	cp $1
	jp nz, Func_10b2f
	ld c, $1
	jp Func_10b32

Func_10b2f: ; 10b2f (4:4b2f)
	jp Func_10aef

Func_10b32: ; 10b32 (4:4b32)
	push bc
	ld e, l
	ld a, c
	call Func_11fda
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp nz, Func_10b43
	call Func_107b8
Func_10b43: ; 10b43 (4:4b43)
	pop bc
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_10b57
	ld a, c
	cp $1
	jp nz, Func_10b57
	ld hl, $1
	jp Func_10b88

Func_10b57: ; 10b57 (4:4b57)
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_10b85
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_10b74
	ld l, c
	ld h, $0
	jp Func_10b88

Func_10b74: ; 10b74 (4:4b74)
	inc c
	dec c
	jp nz, Func_10b7f
	ld hl, $1
	jp Func_10b88

Func_10b7f: ; 10b7f (4:4b7f)
	ld hl, $0
	jp Func_10b88

Func_10b85: ; 10b85 (4:4b85)
	ld hl, $0
Func_10b88: ; 10b88 (4:4b88)
	pop bc
	ret

Func_10b8a: ; 10b8a (4:4b8a)
	push af
	add sp, -$1a
	ld hl, sp+$1b
	ld c, [hl]
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, sp+$1
	call Func_11cfb
	set_farcall_addrs_hli malloc
	ld hl, $1e
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $605
	ld hl, $705
	call BackUpTileMapRectangle
	ld hl, sp+$1d
	ld a, [hl]
	or a
	jp nz, Func_10bed
	ld hl, sp+$d
	reg16swap de, hl
	xor a
	call Func_115af
	ld hl, sp+$13
	ld a, [hl]
	cp $1
	jp nz, Func_10be3
	ld hl, sp+$12
	ld a, [hl]
	or a
	jp nz, Func_10be3
	ld hl, sp+$d
	reg16swap de, hl
	ld a, $4
	call Func_115af
Func_10be3: ; 10be3 (4:4be3)
	ld de, $0
	ld hl, sp+$2
	ld [hl], $0
	jp Func_10c0a

Func_10bed: ; 10bed (4:4bed)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_10c03
	ld hl, sp+$2
	ld [hl], $0
	jp Func_10c07

Func_10c03: ; 10c03 (4:4c03)
	ld hl, sp+$2
	ld [hl], $ff
Func_10c07: ; 10c07 (4:4c07)
	ld de, $0
Func_10c0a: ; 10c0a (4:4c0a)
	reg16swap de, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	add hl, de
	call Func_10ff0
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $605
	ld hl, $705
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10c8f
	ld hl, sp+$1b
	ld a, [hl]
	cp $1
	jp nz, Func_10c8f
	ld c, $1
	ld hl, sp+$11
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$10
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $0
	ld de, wRNGState
	ld hl, $2
	call Func_1051a
	jp Func_10cda

Func_10c8f: ; 10c8f (4:4c8f)
	ld hl, sp+$1b
	ld a, [hl]
	cp $1
	jp nz, Func_10cda
	ld c, $1
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$11
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$10
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $0
	ld de, wRNGState
	ld hl, $2
	call Func_10506
Func_10cda: ; 10cda (4:4cda)
	ld bc, $0
Func_10cdd: ; 10cdd (4:4cdd)
	ld l, c
	ld h, b
	ld de, $2
	call CompareHLtoDE
	jp nc, Func_10d19
	ld l, c
	ld h, b
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10d15
	ld l, c
	ld h, b
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1
	add hl, de
	ld de, $6
	add hl, de
	ld [hl], $15
Func_10d15: ; 10d15 (4:4d15)
	inc bc
	jp Func_10cdd

Func_10d19: ; 10d19 (4:4d19)
	ld hl, $2
	write_hl_to_sp_plus $18
	ld hl, $0
	write_hl_to_sp_plus $1a
	ld hl, $0
Func_10d2a: ; 10d2a (4:4d2a)
	ld hl, $0
Func_10d2d: ; 10d2d (4:4d2d)
	ld de, $5
	call CompareHLtoDE
	jp nc, Func_10d3f
	push hl
	call NextOverworldFrame
	pop hl
	inc hl
	jp Func_10d2d

Func_10d3f: ; 10d3f (4:4d3f)
	read_hl_from_sp_plus $18
	inc hl
	write_hl_to_sp_plus $18
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10d57
	ld hl, sp+$1
	call Func_10e03
	jp Func_10d5c

Func_10d57: ; 10d57 (4:4d57)
	ld hl, sp+$1
	call Func_10efa
Func_10d5c: ; 10d5c (4:4d5c)
	read_hl_from_sp_plus $1a
	inc hl
	write_hl_to_sp_plus $1a
	read_hl_from_sp_plus $1a
	ld a, l
	sub $4
	or h
	jp nz, Func_10d77
	ld hl, $0
	write_hl_to_sp_plus $1a
Func_10d77: ; 10d77 (4:4d77)
	read_hl_from_sp_plus $1a
	push hl
	ld hl, sp+$11
	ld l, [hl]
	push hl
	ld hl, sp+$9
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $15
	push hl
	read_hl_from_sp_plus $15
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	push hl
	read_hl_from_sp_plus $d
	pop de
	call Func_12029
	pop bc
	pop bc
	pop bc
	pop bc
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $f
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	call Func_11176
	pop bc
	ld hl, sp+$15
	ld [hl], a
	ld hl, sp+$15
	ld a, [hl]
	cp $ff
	jp z, Func_10dd3
	read_hl_from_sp_plus $18
	ld c, l
	ld b, h
	ld e, $4
	ld hl, sp+$15
	ld a, [hl]
	call Func_11b60
	jp Func_10dfd

Func_10dd3: ; 10dd3 (4:4dd3)
	read_hl_from_sp_plus $18
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	ld hl, $63
	call CompareHLtoDE
	jp nc, Func_10dfa
	read_hl_from_sp_plus $18
	ld c, l
	ld b, h
	ld e, $4
	ld a, $2
	call Func_11b60
	jp Func_10dfd

Func_10dfa: ; 10dfa (4:4dfa)
	jp Func_10d2a

Func_10dfd: ; 10dfd (4:4dfd)
	ld hl, sp+$15
	ld a, [hl]
	add sp, $1c
	ret

Func_10e03: ; 10e03 (4:4e03)
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $0
Func_10e09: ; 10e09 (4:4e09)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call Func_1108a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_114ea
	cp $1e
	jp z, Func_10ee2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	reg16swap de, hl
	call Func_115af
Func_10ee2: ; 10ee2 (4:4ee2)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_10eed
	jp Func_10ef7

Func_10eed: ; 10eed (4:4eed)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_10e09

Func_10ef7: ; 10ef7 (4:4ef7)
	pop bc
	pop bc
	ret

Func_10efa: ; 10efa (4:4efa)
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $1
Func_10f00: ; 10f00 (4:4f00)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call Func_1108a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $8
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_114ea
	cp $1e
	jp z, Func_10fd9
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	reg16swap de, hl
	call Func_11872
Func_10fd9: ; 10fd9 (4:4fd9)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_10fe3
	jp Func_10fed

Func_10fe3: ; 10fe3 (4:4fe3)
	ld hl, sp+$0
	ld a, [hl]
	dec a
	ld hl, sp+$0
	ld [hl], a
	jp Func_10f00

Func_10fed: ; 10fed (4:4fed)
	pop bc
	pop bc
	ret

Func_10ff0: ; 10ff0 (4:4ff0)
	push hl
	push bc
	xor a
	ld hl, $3
	pop de
	push hl
Func_10ff8: ; 10ff8 (4:4ff8)
	pop hl
	push hl
	inc h
	dec h
	bit 7, h
	jr nz, asm_1105a
	ld c, $0
Func_11002: ; 11002 (4:5002)
	ld a, c
	cp $3c
	jp nc, Func_11048
	push bc
	call CheckButton
	ld l, a
	ld h, $0
	pop bc
	ld a, l
	and $10
	jp z, Func_11044
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_11044
	call GetHLAtSPPlus4
	ld de, $6
	add hl, de
	ld [hl], $1
	pop hl
	push hl
	ld a, l
	or h
	jp nz, Func_1103b
	ld a, c
	cp $3a
	jp c, Func_1103b
	jp Func_11044

Func_1103b: ; 1103b (4:503b)
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld [hl], $4
Func_11044: ; 11044 (4:5044)
	inc c
	jp Func_11002

Func_11048: ; 11048 (4:5048)
	ld bc, $0
	pop hl
	push hl
	ld e, l
	xor a
	call Func_11b60
	pop hl
	push hl
	dec hl
	pop de
	push hl
	jp Func_10ff8

asm_1105a:
	xor a
Func_1105b: ; 1105b (4:505b)
	cp $a
	jp nc, Func_11087
	push af
	call CheckButton
	ld l, a
	ld h, $0
	ld a, l
	and $10
	jp z, Func_11082
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_11082
	call GetHLAtSPPlus6
	ld de, $6
	add hl, de
	ld [hl], $1
Func_11082: ; 11082 (4:5082)
	pop af
	inc a
	jp Func_1105b

Func_11087: ; 11087 (4:5087)
	pop bc
	pop bc
	ret

Func_1108a: ; 1108a (4:508a)
	push hl
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_110c3
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, $1
	add [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $4
	jp nz, Func_110c0
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
Func_110c0: ; 110c0 (4:50c0)
	jp Func_11174

Func_110c3: ; 110c3 (4:50c3)
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_110df
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	add $10
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
	jp Func_11174

Func_110df: ; 110df (4:50df)
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_1115d
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp z, Func_11148
	cp $2
	jp z, Func_11131
	cp $1
	jp z, Func_1111c
	or a
	jp nz, Func_1115a
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_1115a

Func_1111c: ; 1111c (4:511c)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
	jp Func_1115a

Func_11131: ; 11131 (4:5131)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	inc hl
	inc hl
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
	jp Func_1115a

Func_11148: ; 11148 (4:5148)
	pop hl
	push hl
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_1115a: ; 1115a (4:515a)
	jp Func_11174

Func_1115d: ; 1115d (4:515d)
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld a, [hl]
	cp $2
	jp c, Func_11174
	pop hl
	push hl
	ld de, $6
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_11174: ; 11174 (4:5174)
	pop bc
	ret

Func_11176: ; 11176 (4:5176)
	push hl
	push de
	call GetHLAtSPPlus4
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nz, Func_111ac
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nz, Func_111ac
	call GetHLAtSPPlus4
	ld a, l
	sub $48
	or h
	jp nz, Func_111a9
	pop hl
	push hl
	ld a, l
	sub $78
	or h
	jp nz, Func_111a9
	ld a, $2
	jp Func_111db

Func_111a9: ; 111a9 (4:51a9)
	jp Func_111d9

Func_111ac: ; 111ac (4:51ac)
	call GetHLAtSPPlus4
	ld a, l
	sub $48
	or h
	jp nz, Func_111c3
	pop hl
	push hl
	ld a, l
	sub $78
	or h
	jp nz, Func_111c3
	xor a
	jp Func_111db

Func_111c3: ; 111c3 (4:51c3)
	ld a, c
	sub $48
	or b
	jp nz, Func_111d9
	call GetHLAtSPPlus8
	ld a, l
	sub $78
	or h
	jp nz, Func_111d9
	ld a, $1
	jp Func_111db

Func_111d9: ; 111d9 (4:51d9)
	ld a, $ff
Func_111db: ; 111db (4:51db)
	pop bc
	pop bc
	ret

Data_111de: ; 111de
	db $00, $14, $00, $1e, $01, $00, $14, $00, $28, $01, $00, $23, $00, $23, $01, $00, $28, $00, $28, $01, $00, $32, $00, $28, $01, $00, $3c, $00, $1e, $01, $00, $4b, $00, $14, $01, $00, $28, $28, $00, $01, $00, $2d, $23, $00, $01, $00, $32, $1e, $00, $01, $00, $32, $14, $00, $01, $00, $32, $0f, $00, $01, $00, $3c, $0a, $00, $01, $00, $46, $0a, $00, $01, $00, $28, $00, $28, $01, $00, $2d, $00, $23, $01, $00, $32, $00, $1e, $01, $00, $32, $00, $14, $01, $00, $32, $00, $0f, $01, $00, $3c, $00, $0a, $01, $00, $46, $00, $0a, $01, $00, $14, $1e, $00, $01, $00, $14, $28, $00, $01, $00, $23, $23, $00, $01, $00, $28, $28, $00, $01, $00, $32, $28, $00, $01, $00, $3c, $1e, $00, $01, $00, $4b, $14, $00, $01, $14, $19, $00, $28, $02, $0f, $1e, $00, $28, $02, $0a, $23, $00, $28, $02, $0a, $23, $00, $2d, $02, $05, $23, $00, $32, $02, $05, $23, $00, $37, $02, $00, $14, $00, $4b, $02, $14, $2d, $0a, $00, $01, $0f, $32, $14, $00, $03, $05, $32, $19, $00, $01, $05, $37, $19, $00, $01, $05, $37, $05, $00, $01, $05, $3c, $19, $00, $01, $05, $46, $05, $00, $01, $14, $2d, $00, $0a, $01, $0f, $32, $00, $14, $03, $05, $32, $00, $19, $01, $05, $37, $00, $19, $01, $05, $37, $00, $05, $01, $05, $3c, $00, $19, $01, $05, $46, $00, $05, $01, $14, $19, $28, $00, $02, $0f, $1e, $28, $00, $02, $0a, $23, $28, $00, $02, $0a, $23, $2d, $00, $02, $05, $23, $32, $00, $02, $05, $23, $37, $00, $02, $00, $14, $4b, $00, $02, $19, $32, $00, $0f, $01, $0f, $32, $00, $19, $01, $14, $32, $00, $1e, $01, $05, $32, $00, $23, $01, $05, $37, $00, $28, $01, $05, $3c, $00, $19, $01, $00, $46, $00, $19, $01, $19, $32, $0f, $00, $01, $0f, $32, $19, $00, $01, $14, $32, $1e, $00, $01, $05, $32, $23, $00, $01, $05, $37, $28, $00, $01, $05, $3c, $19, $00, $01, $00, $46, $19, $00, $01, $14, $00, $00, $28, $01, $0f, $00, $00, $32, $01, $0a, $00, $00, $32, $01, $0a, $00, $00, $32, $01, $0a, $00, $00, $37, $01, $00, $00, $00, $3c, $01, $00, $00, $00, $46, $01, $14, $32, $05, $00, $01, $0f, $32, $0f, $00, $02, $05, $37, $19, $00, $02, $05, $37, $19, $00, $02, $05, $37, $19, $00, $02, $05, $3c, $19, $00, $02, $05, $46, $0f, $00, $02, $14, $32, $00, $05, $01, $0f, $32, $00, $0f, $02, $05, $37, $00, $19, $02, $05, $37, $00, $19, $02, $05, $37, $00, $19, $02, $05, $3c, $00, $19, $02, $05, $46, $00, $0f, $02, $14, $00, $28, $00, $01, $0f, $00, $32, $00, $01, $0a, $00, $32, $00, $01, $0a, $00, $32, $00, $01, $0a, $00, $37, $00, $01, $00, $00, $3c, $00, $01, $00, $00, $46, $00, $01, $00, $32, $00, $28, $02, $00, $32, $00, $23, $02, $00, $32, $00, $1e, $01, $00, $32, $00, $1e, $01, $00, $37, $00, $14, $01, $00, $3c, $00, $0f, $01, $00, $46, $00, $0a, $01, $0f, $00, $28, $1e, $02, $0f, $00, $2d, $19, $02, $0f, $00, $32, $14, $02, $0f, $00, $32, $0f, $01, $05, $00, $37, $0a, $01, $05, $00, $3c, $0a, $01, $00, $00, $46, $05, $01, $0f, $00, $1e, $28, $02, $0f, $00, $19, $2d, $02, $0f, $00, $14, $32, $02, $0f, $00, $0f, $32, $01, $05, $00, $0a, $37, $01, $05, $00, $0a, $3c, $01, $00, $00, $05, $46, $01, $00, $32, $28, $00, $02, $00, $32, $23, $00, $02, $00, $32, $1e, $00, $01, $00, $32, $1e, $00, $01, $00, $37, $14, $00, $01, $00, $3c, $0f, $00, $01, $00, $46, $0a, $00, $01, $23, $00, $00, $28, $01, $1e, $00, $00, $28, $01, $19, $00, $00, $28, $01, $14, $00, $00, $28, $01, $0f, $00, $00, $2d, $01, $0a, $00, $00, $32, $01, $00, $00, $00, $3c, $01, $00, $00, $28, $32, $01, $00, $00, $23, $32, $01, $00, $00, $1e, $32, $01, $00, $00, $19, $32, $01, $00, $00, $14, $37, $01, $00, $00, $19, $3c, $01, $00, $00, $0a, $46, $01, $00, $00, $32, $28, $01, $00, $00, $32, $23, $01, $00, $00, $32, $1e, $01, $00, $00, $32, $19, $01, $00, $00, $37, $14, $01, $00, $00, $3c, $19, $01, $00, $00, $46, $0a, $01, $23, $00, $28, $00, $01, $1e, $00, $28, $00, $01, $19, $00, $28, $00, $01, $14, $00, $28, $00, $01, $0f, $00, $2d, $00, $01, $0a, $00, $32, $00, $01, $00, $00, $3c, $00, $01

Data_114e0: ; 114e0
	db $01, $05, $0b, $0f, $13

Data_114e5: ; 114e5
	db $01, $04, $08, $0c, $0f

Func_114ea: ; 114ea (4:54ea)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, Data_114e0
	ld bc, $5
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_114e5
	ld bc, $5
	call MemCopy
	ld c, $0
Func_11511: ; 11511 (4:5511)
	ld a, c
	cp $5
	jp nc, Func_1156f
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	add a
	add a
	add a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_1156b
	ld hl, sp+$d
	ld a, [hl]
	cp $88
	jp z, Func_1155f
	cp $58
	jp z, Func_11553
	cp $38
	jp z, Func_11548
	cp $8
	jp nz, Func_1156b
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	jp Func_11590

Func_11548: ; 11548 (4:5548)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	inc a
	jp Func_11590

Func_11553: ; 11553 (4:5553)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	add $2
	jp Func_11590

Func_1155f: ; 1155f (4:555f)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	add $3
	jp Func_11590

Func_1156b: ; 1156b (4:556b)
	inc c
	jp Func_11511

Func_1156f: ; 1156f (4:556f)
	ld hl, sp+$a
	ld a, [hl]
	cp $30
	jp nz, Func_1158e
	ld hl, sp+$d
	ld a, [hl]
	cp $58
	jp z, Func_11589
	cp $38
	jp nz, Func_1158e
	ld a, $9
	jp Func_11590

Func_11589: ; 11589 (4:5589)
	ld a, $a
	jp Func_11590

Func_1158e: ; 1158e (4:558e)
	ld a, $1e
Func_11590: ; 11590 (4:5590)
	add sp, $e
	ret

Data_11593: ; 11593
	db $00, $01, $02, $03, $04, $05, $06, $00, $00, $01, $01, $02, $02, $03, $03, $04, $04, $05, $05, $06, $06

Data_115a8: ; 115a8
	db $19, $2d, $3c, $4b, $55, $5f, $64

Func_115af: ; 115af (4:55af)
	push af
	push de
	add sp, -$20
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, Data_11593
	ld bc, $15
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_115a8
	ld bc, $7
	call MemCopy
	ld hl, sp+$23
	ld a, [hl]
	or a
	jp nz, Func_11658
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	cp $23
	jp nc, Func_11609
	read_hl_from_sp_plus $22
	ld de, $5
	add hl, de
	ld [hl], $4
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	read_hl_from_sp_plus $22
	ld de, $6
	add hl, de
	ld [hl], $1
	jp Func_1185a

Func_11609: ; 11609 (4:5609)
	ld hl, sp+$1e
	ld a, [hl]
	cp $41
	jp nc, Func_11628
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	read_hl_from_sp_plus $22
	ld de, $6
	add hl, de
	ld [hl], $1
	jp Func_11658

Func_11628: ; 11628 (4:5628)
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	ld c, $0
Func_11632: ; 11632 (4:5632)
	ld a, c
	cp $7
	jp nc, Func_11658
	ld hl, sp+$1e
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	cp [hl]
	jp nc, Func_11654
	ld a, c
	add $32
	read_hl_from_sp_plus $22
	ld de, $6
	add hl, de
	ld [hl], a
	jp Func_1185a

Func_11654: ; 11654 (4:5654)
	inc c
	jp Func_11632

Func_11658: ; 11658 (4:5658)
	read_hl_from_sp_plus $22
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_1168e
	ld hl, sp+$23
	ld a, [hl]
	cp $10
	jp z, Func_11676
	ld hl, sp+$23
	ld a, [hl]
	cp $11
	jp nz, Func_1168b
Func_11676: ; 11676 (4:5676)
	read_hl_from_sp_plus $22
	ld de, $9
	add hl, de
	ld [hl], $0
	ld e, $1
	ld hl, sp+$23
	ld a, [hl]
	call Func_11a81
	jp Func_1168e

Func_1168b: ; 1168b (4:568b)
	jp Func_1185a

Func_1168e: ; 1168e (4:568e)
	ld a, $64
	call Func_10001
	ld hl, sp+$1e
	ld [hl], a
	read_hl_from_sp_plus $22
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld e, [hl]
	ld hl, sp+$1d
	ld [hl], e
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$1c
	ld [hl], e
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_116e3
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $2
	jp Func_1185a

Func_116e3: ; 116e3 (4:56e3)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_11722
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	jp Func_1185a

Func_11722: ; 11722 (4:5722)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_11762
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	jp Func_1185a

Func_11762: ; 11762 (4:5762)
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$1c
	ld [hl], a
	ld hl, sp+$1e
	ld a, [hl]
	ld hl, sp+$1c
	cp [hl]
	jp nc, Func_117a3
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $3
	jp Func_1185a

Func_117a3: ; 117a3 (4:57a3)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nz, Func_117db
	read_hl_from_sp_plus $22
	ld de, $5
	add hl, de
	ld [hl], $4
	jp Func_1185a

Func_117db: ; 117db (4:57db)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $2
	jp nz, Func_11813
	read_hl_from_sp_plus $22
	ld de, $5
	add hl, de
	ld [hl], $8
	jp Func_1185a

Func_11813: ; 11813 (4:5813)
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp nz, Func_1185a
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	read_hl_from_sp_plus $22
	ld de, $9
	add hl, de
	ld [hl], $1
	ld e, $0
	ld hl, sp+$23
	ld a, [hl]
	call Func_11a81
Func_1185a: ; 1185a (4:585a)
	add sp, $24
	ret

Data_1185d: ; 1185d
	db $00, $01, $02, $03, $04, $05, $06, $00, $00, $01, $01, $02, $02, $03, $03, $04, $04, $05, $05, $06, $06

Func_11872: ; 11872 (4:5872)
	push af
	push de
	add sp, -$18
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_1185d
	ld bc, $15
	call MemCopy
	read_hl_from_sp_plus $1a
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_118bb
	ld hl, sp+$1b
	ld a, [hl]
	cp $10
	jp z, Func_118a3
	ld hl, sp+$1b
	ld a, [hl]
	cp $11
	jp nz, Func_118b8
Func_118a3: ; 118a3 (4:58a3)
	read_hl_from_sp_plus $1a
	ld de, $9
	add hl, de
	ld [hl], $0
	ld e, $1
	ld hl, sp+$1b
	ld a, [hl]
	call Func_11a81
	jp Func_118bb

Func_118b8: ; 118b8 (4:58b8)
	jp Func_11a7e

Func_118bb: ; 118bb (4:58bb)
	ld a, $64
	call Func_10001
	read_hl_from_sp_plus $1a
	ld de, $8
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	ld hl, sp+$16
	ld [hl], e
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$15
	ld [hl], e
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_1190a
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $2
	jp Func_11a7e

Func_1190a: ; 1190a (4:590a)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_11948
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	jp Func_11a7e

Func_11948: ; 11948 (4:5948)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_11988
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $3
	jp Func_11a7e

Func_11988: ; 11988 (4:5988)
	push af
	ld hl, sp+$17
	ld a, [hl]
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$17
	ld [hl], a
	pop af
	ld hl, sp+$15
	cp [hl]
	jp nc, Func_119c7
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	jp Func_11a7e

Func_119c7: ; 119c7 (4:59c7)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp nz, Func_119ff
	read_hl_from_sp_plus $1a
	ld de, $5
	add hl, de
	ld [hl], $4
	jp Func_11a7e

Func_119ff: ; 119ff (4:59ff)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $2
	jp nz, Func_11a37
	read_hl_from_sp_plus $1a
	ld de, $5
	add hl, de
	ld [hl], $8
	jp Func_11a7e

Func_11a37: ; 11a37 (4:5a37)
	ld hl, sp+$1b
	ld l, [hl]
	ld h, $0
	mulhlby35
	ld de, Data_111de - 35
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $3
	jp nz, Func_11a7e
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	read_hl_from_sp_plus $1a
	ld de, $9
	add hl, de
	ld [hl], $1
	ld e, $0
	ld hl, sp+$1b
	ld a, [hl]
	call Func_11a81
Func_11a7e: ; 11a7e (4:5a7e)
	add sp, $1c
	ret

Func_11a81: ; 11a81 (4:5a81)
	cp $6
	jp z, Func_11a8b
	cp $10
	jp nz, Func_11a90
Func_11a8b: ; 11a8b (4:5a8b)
	ld l, $0
	jp Func_11a92

Func_11a90: ; 11a90 (4:5a90)
	ld l, $4
Func_11a92: ; 11a92 (4:5a92)
	inc e
	dec e
	jp nz, Func_11a9c
	ld a, $8a
	jp Func_11a9e

Func_11a9c: ; 11a9c (4:5a9c)
	ld a, $8f
Func_11a9e: ; 11a9e (4:5a9e)
	push hl
	push af
	ld a, l
	add $7
	ld e, $4
	call SetStringStartState
	pop af
	pop hl
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b47
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $6
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b4c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $8
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b51
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld a, l
	add $7
	ld e, $a
	call SetStringStartState
	pop hl
	pop af
	push af
	push hl
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b56
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	ld a, l
	add $7
	ld e, $c
	call SetStringStartState
	pop af
	ld l, a
	ld h, $0
	push hl
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_11b5b
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
	call PushBGMapRegion
	pop bc
	ret

Data_11b47: ; 11b47
	dstr "%c%c"

Data_11b4c: ; 11b4c
	dstr "%c%c"

Data_11b51: ; 11b51
	dstr "%c%c"

Data_11b56: ; 11b56
	dstr "%c%c"

Data_11b5b: ; 11b5b
	dstr "%c%c"

Func_11b60: ; 11b60 (4:5b60)
	push af
	push bc
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	pop de
	push de
	ld a, e
	cp $3
	jp z, Func_11b9b
	cp $4
	jp nz, Func_11baf
	ld c, $6
	ld e, $a
	ld hl, $505
	call FarCall
	ld e, $6
	ld a, $6
	call SetStringStartState
	jp Func_11bb6

Func_11b9b: ; 11b9b (4:5b9b)
	ld c, $5
	ld e, $6
	ld hl, $705
	call FarCall
	ld e, $7
	ld a, $8
	call SetStringStartState
	jp Func_11bb6

Func_11baf: ; 11baf (4:5baf)
	ld e, $7
	ld a, $8
	call SetStringStartState
Func_11bb6: ; 11bb6 (4:5bb6)
	pop de
	ld a, e
	cp $4
	jp z, Func_11beb
	cp $3
	jp z, Func_11bdb
	cp $2
	jp z, Func_11bdb
	cp $1
	jp z, Func_11bdb
	or a
	jp nz, Func_11cb2
	ld hl, Data_11cc1
	push hl
	call PlaceString
	pop bc
	jp Func_11cb2

Func_11bdb: ; 11bdb (4:5bdb)
	ld l, e
	ld h, $0
	push hl
	ld hl, Data_11cc6
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_11cb2

Func_11beb: ; 11beb (4:5beb)
	ld hl, sp+$3
	ld a, [hl]
	cp $2
	jp z, Func_11c12
	cp $1
	jp z, Func_11c07
	or a
	jp nz, Func_11c1a
	ld hl, Data_11cca
	push hl
	call PlaceString
	pop bc
	jp Func_11c1a

Func_11c07: ; 11c07 (4:5c07)
	ld hl, Data_11cd3
	push hl
	call PlaceString
	pop bc
	jp Func_11c1a

Func_11c12: ; 11c12 (4:5c12)
	ld hl, Data_11cdc
	push hl
	call PlaceString
	pop bc
Func_11c1a: ; 11c1a (4:5c1a)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	ld hl, $63
	call CompareHLtoDE
	jp nc, Func_11c41
	ld e, $8
	ld a, $6
	call SetStringStartState
	ld hl, Data_11ce3
	push hl
	call PlaceString
	pop bc
	jp Func_11c9e

Func_11c41: ; 11c41 (4:5c41)
	ld e, $8
	ld a, $6
	call SetStringStartState
	ld hl, Data_11cec
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	ld hl, $64
	call CompareHLtoDE
	jp nc, Func_11c7a
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, Data_11cf0
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_11c8c

Func_11c7a: ; 11c7a (4:5c7a)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, Data_11cf3
	push hl
	call PlaceString
	pop bc
	pop bc
Func_11c8c: ; 11c8c (4:5c8c)
	pop hl
	push hl
	ld de, $a
	call DivideHLByDESigned
	push de
	ld hl, Data_11cf7
	push hl
	call PlaceString
	pop bc
	pop bc
Func_11c9e: ; 11c9e (4:5c9e)
	set_farcall_addrs_hli Func_da901
	ld de, $a06
	ld hl, $505
	call FarCall
Func_11cb2: ; 11cb2 (4:5cb2)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop bc
	ret

Data_11cc1: ; 11cc1
	dstr "スタート"

Data_11cc6: ; 11cc6
	dstr " %d"

Data_11cca: ; 11cca
	dstr "(あなたのかち)"

Data_11cd3: ; 11cd3
	dstr "(あなたのまけ)"

Data_11cdc: ; 11cdc
	dstr "(ひきわけ)"

Data_11ce3: ; 11ce3
	dstr "タイムオーハﾞー"

Data_11cec: ; 11cec
	dstr "タイム"

Data_11cf0: ; 11cf0
	dstr "%d"

Data_11cf3: ; 11cf3
	dstr " %d"

Data_11cf7: ; 11cf7
	dstr ":%d"

Func_11cfb: ; 11cfb (4:5cfb)
	push hl
	push de
	push bc
	push bc
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $12
	ld e, $14
	ld hl, $0
	call FarCall
	ld c, $2
	ld e, $4
	ld hl, $306
	call FarCall
	ld c, $2
	ld e, $4
	ld hl, $d06
	call FarCall
	ld c, $4
	ld e, $2
	ld hl, $908
	call FarCall
	ld c, $2
	ld e, $6
	ld hl, $10a
	call FarCall
	ld c, $2
	ld e, $6
	ld hl, $d0a
	call FarCall
	ld c, $2
	ld e, $2
	ld hl, $90f
	call FarCall
	ld bc, $84
	ld de, $4
	ld hl, Func_0303
	call Func_101be
	ld bc, $84
	ld de, $4
	ld hl, $d03
	call Func_101be
	ld bc, $84
	ld de, $e
	ld hl, $30e
	call Func_101be
	ld bc, $87
	ld de, $105
	ld hl, $901
	call Func_101be
	ld bc, $86
	ld de, $105
	ld hl, $a01
	call Func_101be
	pop bc
	push bc
	inc c
	dec c
	jp z, Func_11db8
	ld a, c
	cp $1
	jp nz, Func_11ddb
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_11ddb
Func_11db8: ; 11db8 (4:5db8)
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
	jp Func_11dfb

Func_11ddb: ; 11ddb (4:5ddb)
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
Func_11dfb: ; 11dfb (4:5dfb)
	push de
	push bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, $2b
	add hl, bc
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	ld hl, $2b
	add hl, de
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld c, $0
Func_11e1f: ; 11e1f (4:5e1f)
	ld a, c
	cp $2
	jp nc, Func_11e6b
	push bc
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$8
	add hl, de
	ld e, [hl]
	call FarCall
	ld l, a
	pop bc
	push bc
	push hl
	ld a, c
	add a
	add a
	ld d, a
	add a
	add a
	add a
	add d
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld h, a
	ld e, $0
	ld c, $24
	call FarCall
	pop bc
	inc c
	jp Func_11e1f

Func_11e6b: ; 11e6b (4:5e6b)
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	read_hl_from_sp_plus $e
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $e
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	read_hl_from_sp_plus $e
	ld de, $6
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $e
	ld de, $5
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $e
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop bc
	ld hl, $2e
	add hl, bc
	ld a, [hl]
	dec a
	read_hl_from_sp_plus $c
	ld de, $8
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $88
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	inc hl
	inc hl
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	call GetHLAtSPPlus10
	ld de, $6
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop de
	ld hl, $2e
	add hl, de
	ld a, [hl]
	dec a
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	ld [hl], a
	pop bc
	inc c
	dec c
	jp z, Func_11f26
	ld a, c
	cp $1
	jp nz, Func_11f42
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_11f42
Func_11f26: ; 11f26 (4:5f26)
	xor a
	call Func_10a8b
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	ld a, $1
	call Func_10a8b
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld [hl], a
	jp Func_11f5b

Func_11f42: ; 11f42 (4:5f42)
	ld a, $1
	call Func_10a8b
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld [hl], a
	xor a
	call Func_10a8b
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld [hl], a
Func_11f5b: ; 11f5b (4:5f5b)
	ld l, $0
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $c
	inc hl
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $c
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $e
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $12
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_12029
	pop bc
	pop bc
	pop bc
	pop bc
	check_cgb
	jp nz, Func_11fc9
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wEnableAttrMapTransfer], a
Func_11fc9: ; 11fc9 (4:5fc9)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_11fda: ; 11fda (4:5fda)
	push de
	push af
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, $3
	ld [wc316], a
	pop af
	pop de
	or a
	jp nz, Func_12021
	inc e
	dec e
	jp nz, Func_12021
	ld a, $2
	ld [wInBattle], a
	callba_hli Func_222b7
	xor a
	ld [wInBattle], a
Func_12021: ; 12021 (4:6021)
	call FillVisibleAreaWithBlankTile
	ret

Data_12025: ; 12025
	db $0, $c, $18, $c

Func_12029: ; 12029 (4:6029)
	push hl
	add sp, -$12
	push de
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_12025
	ld bc, $4
	call MemCopy
	read_hl_from_sp_plus $18
	ld de, $8
	add hl, de
	write_hl_to_sp_plus $10
	pop bc
	ld hl, $8
	add hl, bc
	write_hl_to_sp_plus $10
	pop de
	ld hl, $10
	add hl, de
	call WriteHLToSPPlus8
	read_hl_from_sp_plus $18
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	ld hl, sp+$5
	xor a
	ld [hl], a
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$18
	ld a, [hl]
	cp $3
	jp nz, Func_12078
	ld hl, sp+$4
	ld [hl], $1
Func_12078: ; 12078 (4:6078)
	ld hl, sp+$1a
	ld a, [hl]
	cp $3
	jp nz, Func_12084
	ld hl, sp+$5
	ld [hl], $1
Func_12084: ; 12084 (4:6084)
	ld hl, sp+$1c
	ld a, [hl]
	cp $2
	jp nz, Func_12093
	ld hl, sp+$1c
	ld [hl], $0
	jp Func_1209f

Func_12093: ; 12093 (4:6093)
	ld hl, sp+$1c
	ld a, [hl]
	cp $3
	jp nz, Func_1209f
	ld hl, sp+$1c
	ld [hl], $2
Func_1209f: ; 1209f (4:609f)
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld hl, sp+$18
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $10
	set_farcall_addrs_hli UpdateCurSprite
	ld hl, sp+$1c
	ld l, [hl]
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	ld a, l
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $e
	ld h, l
	ld l, $0
	pop de
	add hl, de
	reg16swap de, hl
	call FarCall
	ld hl, sp+$1a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $24
	add hl, de
	write_hl_to_sp_plus $12
	set_farcall_addrs_hli UpdateCurSprite
	ld hl, sp+$1c
	ld l, [hl]
	ld h, $0
	ld de, $3
	call DivideHLByDESigned
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $12
	ld a, l
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $10
	ld h, l
	ld l, $0
	pop de
	add hl, de
	reg16swap de, hl
	call FarCall
	callba_hli QueueMoveAnimScriptGFXUpdate
	add sp, $14
	ret

Data_12155: ; 12155
	db $dc, $61, $00, $21, $03, $e1, $61, $00, $32, $01, $e6, $61, $05, $21, $03, $ed, $61, $05, $32, $01, $f5, $61, $01, $21, $03, $fb, $61, $01, $32, $01, $01, $62, $02, $21, $03, $06, $62, $02, $32, $01, $0d, $62, $04, $21, $03, $14, $62, $04, $32, $01, $1b, $62, $03, $21, $03, $23, $62, $03, $32, $01, $2a, $62, $07, $21, $03, $30, $62, $07, $32, $01, $38, $62, $08, $21, $03, $3d, $62, $08, $32, $01, $44, $62, $09, $21, $03, $4b, $62, $09, $32, $01, $52, $62, $0a, $21, $03, $5a, $62, $0a, $32, $01, $62, $62, $0b, $21, $03, $67, $62, $0b, $32, $01, $70, $62, $00, $00, $04, $73, $62, $00, $00, $04, $7b, $62, $00, $64, $02, $81, $62, $00, $c8, $01, $87, $62, $02, $32, $05, $ca, $df, $dd, $c1, $00, $ca, $dd, $cf, $b0, $00, $28, $c3, $de, $dd, $b7, $29, $00, $28, $b2, $c5, $bd, $de, $cf, $29, $00, $28, $cb, $c9, $ba, $29, $00, $28, $b6, $b4, $dd, $29, $00, $bd, $ba, $b0, $d9, $00, $28, $bd, $b2, $b1, $c2, $29, $00, $28, $c4, $de, $bc, $ac, $29, $00, $28, $d7, $b8, $be, $b7, $29, $00, $28, $b7, $c0, $b6, $be, $de, $29, $00, $28, $c0, $c2, $cf, $b7, $29, $00, $28, $cb, $b6, $d8, $29, $00, $28, $bf, $b3, $ba, $de, $dd, $29, $00, $28, $d4, $d0, $29, $00, $28, $b7, $ae, $b3, $cc, $29, $00, $28, $bc, $de, $bc, $dd, $29, $00, $28, $bc, $de, $dc, $da, $29, $00, $28, $bb, $bb, $de, $c5, $d0, $29, $00, $28, $b3, $bd, $de, $bc, $b5, $29, $00, $bf, $c6, $af, $b8, $00, $28, $ca, $de, $b8, $b9, $de, $b7, $29, $00, $bd, $b6, $00, $28, $d0, $b6, $de, $dc, $d8, $29, $00, $31, $30, $30, $c4, $dd, $00, $32, $30, $30, $c4, $dd, $00, $28, $bc, $ad, $b3, $d8, $29, $00

Func_1228e:: ; 1228e (4:628e)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	xor a
	ld hl, sp+$b
	ld a, [hl]
	cp $2
	jp nz, Func_122a1
	call Func_10766
	xor a
Func_122a1: ; 122a1 (4:62a1)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_122b3
	ld a, $1
	call Func_105ce
	ld l, $1
	jp Func_122b8

Func_122b3: ; 122b3 (4:62b3)
	call Func_1028b
	ld l, $0
Func_122b8: ; 122b8 (4:62b8)
	push hl
	callba_hli LoadBattlePals
	ld a, $f
	call OverworldPlaySong
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
Func_1230c: ; 1230c (4:630c)
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call Func_12b93
	ld l, $0
	push hl
	ld c, $0
	ld e, $0
	xor a
	call Func_12acb
	pop bc
	check_cgb
	jp nz, Func_12352
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wEnableAttrMapTransfer], a
Func_12352: ; 12352 (4:6352)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$b
	xor a
	ld [hl], a
	ld hl, sp+$a
	ld [hl], a
	pop hl
	push hl
	ld a, l
	call Func_12448
	ld c, a
	pop hl
	ld a, c
	cp $2
	jp nz, Func_123d2
	push hl
	call GetHLAtSPPlus8
	push hl
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus6
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_12436
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
Func_123c0: ; 123c0 (4:63c0)
	cp $3c
	jp nc, Func_123ce
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_123c0

Func_123ce: ; 123ce (4:63ce)
	pop hl
	jp Func_123d5

Func_123d2: ; 123d2 (4:63d2)
	jp Func_123d8

Func_123d5: ; 123d5 (4:63d5)
	jp Func_1230c

Func_123d8: ; 123d8 (4:63d8)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_123fe
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_123f2
	jp Func_123fe

Func_123f2: ; 123f2 (4:63f2)
	inc c
	dec c
	jp nz, Func_123fc
	ld c, $1
	jp Func_123fe

Func_123fc: ; 123fc (4:63fc)
	ld c, $0
Func_123fe: ; 123fe (4:63fe)
	push bc
	ld hl, sp+$d
	ld a, [hl]
	cp $2
.asm_12403
	jp nz, Func_1240a
	call Func_107b8
Func_1240a: ; 1240a (4:640a)
	pop bc
	ld hl, sp+$b
	ld a, [hl]
	or a
	jp nz, Func_1241e
	ld a, c
	cp $1
	jp nz, Func_1241e
	ld hl, $1
	jp Func_1242f

Func_1241e: ; 1241e (4:641e)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_1242c
	ld l, c
	ld h, $0
	jp Func_1242f

Func_1242c: ; 1242c (4:642c)
	ld hl, $0
Func_1242f: ; 1242f (4:642f)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_12436: ; 12436
	dstr "(ひきわけなのてﾞ もういちとﾞ)"

Func_12448: ; 12448 (4:6448)
	push af
	add sp, -$4e
	xor a
Func_1244c: ; 1244c (4:644c)
	cp $3c
	jp nc, Func_1245d
	ld e, a
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld [hl], $0
	inc a
	jp Func_1244c

Func_1245d: ; 1245d (4:645d)
	ld de, $0
	ld hl, sp+$a
	call Func_12892
	ld c, $0
Func_12467: ; 12467 (4:6467)
	ld a, c
	cp $6
	jp nc, Func_1247f
	ld e, c
	ld d, $0
	ld hl, sp+$a
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$46
	add hl, de
	ld [hl], a
	inc c
	jp Func_12467

Func_1247f: ; 1247f (4:647f)
	xor a
	ld hl, sp+$9
	ld [hl], $6
	ld hl, sp+$8
	xor a
	ld [hl], a
	ld hl, sp+$7
	ld [hl], a
	ld c, $0
	ld hl, sp+$4c
	ld [hl], c
	ld hl, sp+$6
	ld [hl], c
	ld hl, sp+$5
	ld [hl], c
	xor a
	ld hl, sp+$4d
	ld [hl], a
	ld hl, sp+$4f
	ld a, [hl]
	or a
	jp nz, Func_124a8
	ld hl, sp+$4
	ld [hl], $0
	jp Func_124c2

Func_124a8: ; 124a8 (4:64a8)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_124be
	ld hl, sp+$4
	ld [hl], $0
	jp Func_124c2

Func_124be: ; 124be (4:64be)
	ld hl, sp+$4
	ld [hl], $1
Func_124c2: ; 124c2 (4:64c2)
	ld hl, sp+$3
	xor a
	ld [hl], a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$1
	xor a
	ld [hl], a
	ld hl, sp+$0
	ld [hl], a
Func_124d0: ; 124d0 (4:64d0)
	push bc
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_12573
	call CheckButton
	ld l, a
	ld h, $0
	ld a, l
	and $1
	jp z, Func_124f6
	ld hl, sp+$9
	ld a, [hl]
	cp $5
	jp nc, Func_124f3
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
Func_124f3: ; 124f3 (4:64f3)
	jp Func_12570

Func_124f6: ; 124f6 (4:64f6)
	ld a, l
	and $2
	jp z, Func_1250e
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp c, Func_1250b
	ld hl, sp+$9
	ld a, [hl]
	dec a
	ld hl, sp+$9
	ld [hl], a
Func_1250b: ; 1250b (4:650b)
	jp Func_12570

Func_1250e: ; 1250e (4:650e)
	ld a, l
	and $4
	jp z, Func_12527
	ld hl, sp+$9
	ld a, [hl]
	cp $3
	jp c, Func_12524
	ld hl, sp+$9
	ld a, [hl]
	add $fd
	ld hl, sp+$9
	ld [hl], a
Func_12524: ; 12524 (4:6524)
	jp Func_12570

Func_12527: ; 12527 (4:6527)
	ld a, l
	and $8
	jp z, Func_12540
	ld hl, sp+$9
	ld a, [hl]
	cp $3
	jp nc, Func_1253d
	ld hl, sp+$9
	ld a, [hl]
	add $3
	ld hl, sp+$9
	ld [hl], a
Func_1253d: ; 1253d (4:653d)
	jp Func_12570

Func_12540: ; 12540 (4:6540)
	ld a, l
	and $10
	jp z, Func_12570
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp nz, Func_12554
	ld hl, sp+$4
	ld [hl], $1
	jp Func_12570

Func_12554: ; 12554 (4:6554)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_1256c
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$a
	cp [hl]
	jp z, Func_1256c
	ld hl, sp+$4
	ld [hl], $1
	jp Func_12570

Func_1256c: ; 1256c (4:656c)
	ld hl, sp+$4
	ld [hl], $0
Func_12570: ; 12570 (4:6570)
	jp Func_12576

Func_12573: ; 12573 (4:6573)
	call NextOverworldFrame
Func_12576: ; 12576 (4:6576)
	pop bc
	ld hl, sp+$4f
	ld a, [hl]
	or a
	jp nz, Func_125d4
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_125d4
	ld hl, sp+$4c
	ld a, [hl]
	cp $f
	jp nz, Func_125ca
	push bc
	call Func_1288c
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$4e
	ld [hl], $0
	pop bc
	inc c
	ld a, c
	cp $6
	jp nz, Func_125c7
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_125b8
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp z, Func_125b8
	ld hl, sp+$3
	ld [hl], $1
	jp Func_125c7

Func_125b8: ; 125b8 (4:65b8)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_125c6
	ld hl, sp+$3
	ld [hl], $1
	jp Func_125c7

Func_125c6: ; 125c6 (4:65c6)
	dec c
Func_125c7: ; 125c7 (4:65c7)
	jp Func_125d1

Func_125ca: ; 125ca (4:65ca)
	ld hl, sp+$4c
	ld a, [hl]
	inc a
	ld hl, sp+$4c
	ld [hl], a
Func_125d1: ; 125d1 (4:65d1)
	jp Func_1265a

Func_125d4: ; 125d4 (4:65d4)
	ld hl, sp+$4f
	ld a, [hl]
	cp $1
	jp nz, Func_1265a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_12620
	push bc
	ld c, $1
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	pop bc
	jp Func_1265a

Func_12620: ; 12620 (4:6620)
	push bc
	ld c, $1
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	ld c, $1
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_10506
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	pop bc
Func_1265a: ; 1265a (4:665a)
	push bc
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$7
	cp [hl]
	jp nz, Func_1266d
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp z, Func_1268a
Func_1266d: ; 1266d (4:666d)
	ld hl, sp+$8
	ld l, [hl]
	push hl
	ld hl, sp+$c
	ld c, [hl]
	ld hl, sp+$9
	ld e, [hl]
	ld hl, sp+$b
	ld a, [hl]
	call Func_12acb
	pop bc
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
Func_1268a: ; 1268a (4:668a)
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_126b9
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp z, Func_126b9
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp nz, Func_126b9
	ld e, $0
	ld hl, sp+$9
	ld a, [hl]
	call Func_128fd
	ld hl, sp+$2
	ld [hl], $1
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
Func_126b9: ; 126b9 (4:66b9)
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_126e8
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp z, Func_126e8
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_126e8
	ld e, $1
	ld hl, sp+$a
	ld a, [hl]
	call Func_128fd
	ld hl, sp+$3
	ld [hl], $1
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
Func_126e8: ; 126e8 (4:66e8)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_12815
	ld hl, sp+$3
	ld a, [hl]
	cp $1
	jp nz, Func_12815
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_12743
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_12743
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$8
	cp [hl]
	jp nz, Func_12743
	push bc
	ld hl, sp+$6
	ld a, [hl]
	or a
	jp nz, Func_1272d
	ld hl, sp+$5
	ld [hl], $0
	ld c, $1
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_1051a
	jp Func_1273f

Func_1272d: ; 1272d (4:672d)
	ld hl, sp+$4
	ld [hl], $0
	ld c, $1
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_10506
Func_1273f: ; 1273f (4:673f)
	pop bc
	jp Func_12815

Func_12743: ; 12743 (4:6743)
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$7
	ld h, [hl]
	ld d, h
	push de
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld l, [hl]
	ld h, a
	pop de
	call Func_12982
	xor a
Func_12763: ; 12763 (4:6763)
	cp $3c
	jp nc, Func_12771
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_12763

Func_12771: ; 12771 (4:6771)
	ld hl, sp+$1
	xor a
	ld [hl], a
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$4c
	ld [hl], $0
	ld c, [hl]
	push bc
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$48
	add hl, de
	ld e, [hl]
	call Func_12db3
	ld e, a
	pop bc
	ld a, e
	cp $ff
	jp nz, Func_127de
	push bc
	callba_hli WaitAorBButtonOverworld_17a44
	ld hl, sp+$51
	ld a, [hl]
	cp $1
	jp nz, Func_127be
	call Func_1052e
Func_127be: ; 127be (4:67be)
	ld hl, sp+$4f
	ld l, [hl]
	push hl
	ld hl, sp+$d
	ld l, [hl]
	push hl
	ld hl, sp+$10
	ld c, l
	ld b, h
	ld hl, sp+$4c
	reg16swap de, hl
	ld hl, sp+$d
	call Func_12ca4
	pop bc
	pop bc
	ld hl, sp+$b
	ld [hl], a
	pop bc
	jp Func_12815

Func_127de: ; 127de (4:67de)
	ld hl, sp+$4f
	ld a, [hl]
	cp $1
	jp z, Func_127fe
	push de
	inc e
	dec e
	jp nz, Func_127fa
	callba_hli Func_222b7
Func_127fa: ; 127fa (4:67fa)
	pop de
	jp Func_12812

Func_127fe: ; 127fe (4:67fe)
	push de
	call FillVisibleAreaWithBlankTile
	pop de
	push de
	ld a, e
	ld de, $0
	ld bc, $201
	call Func_107d7
	call Func_1052e
	pop de
Func_12812: ; 12812 (4:6812)
	jp Func_12818

Func_12815: ; 12815 (4:6815)
	jp Func_124d0

Func_12818: ; 12818 (4:6818)
	push de
	call FillVisibleAreaWithBlankTile
	pop de
	ld a, e
	add sp, $50
	ret

Func_12821: ; 12821
	push hl
	push de
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $f
	jp nz, Func_12881
	call Func_1288c
	pop hl
	push hl
	inc hl
	ld [hl], a
	call GetHLAtSPPlus8
	ld [hl], $0
	call GetHLAtSPPlus10
	ld a, $1
	add [hl]
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	cp $a
	jp nz, Func_12855
	call GetHLAtSPPlus4
	ld a, [hl]
	or a
	jp nz, Func_12855
	ld a, $1
	jp Func_12889

Func_12855: ; 12855 (4:6855)
	call GetHLAtSPPlus10
	ld a, [hl]
	cp $a
	jp nz, Func_1287e
	call GetHLAtSPPlus4
	ld a, [hl]
	cp $1
	jp nz, Func_1287e
	pop hl
	push hl
	ld a, [hl]
	pop hl
	push hl
	inc hl
	cp [hl]
	jp nz, Func_12879
	call GetHLAtSPPlus10
	ld [hl], $9
	jp Func_1287e

Func_12879: ; 12879 (4:6879)
	ld a, $2
	jp Func_12889

Func_1287e: ; 1287e (4:687e)
	jp Func_12888

Func_12881: ; 12881 (4:6881)
	call GetHLAtSPPlus8
	ld a, $1
	add [hl]
	ld [hl], a
Func_12888: ; 12888 (4:6888)
	xor a
Func_12889: ; 12889 (4:6889)
	pop bc
	pop bc
	ret

Func_1288c: ; 1288c (4:688c)
	ld a, $6
	call Func_10001
	ret

Func_12892: ; 12892 (4:6892)
	push hl
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
Func_12899: ; 12899 (4:6899)
	ld hl, sp+$2
	ld a, [hl]
	cp $3c
	jp nc, Func_128f9
	ld a, $3c
	call Func_10001
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$1
	ld [hl], $0
Func_128b1: ; 128b1 (4:68b1)
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_128db
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_128d1
	ld hl, sp+$3
	ld [hl], $ff
	jp Func_128db

Func_128d1: ; 128d1 (4:68d1)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_128b1

Func_128db: ; 128db (4:68db)
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_128f6
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_128f6: ; 128f6 (4:68f6)
	jp Func_12899

Func_128f9: ; 128f9 (4:68f9)
	pop bc
	pop bc
	pop bc
	ret

Func_128fd: ; 128fd (4:68fd)
	push bc
	push de
	push bc
	push af
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	ld hl, sp+$6
	ld [hl], a
	pop af
	pop bc
	cp $5
	jp z, Func_12938
	cp $2
	jp z, Func_12938
	cp $4
	jp z, Func_12933
	cp $1
	jp z, Func_12933
	cp $3
	jp z, Func_1292e
	or a
	jp nz, Func_1293a
Func_1292e: ; 1292e (4:692e)
	ld c, $1
	jp Func_1293a

Func_12933: ; 12933 (4:6933)
	ld c, $8
	jp Func_1293a

Func_12938: ; 12938 (4:6938)
	ld c, $f
Func_1293a: ; 1293a (4:693a)
	push bc
	ld l, $6
	push hl
	ld a, c
	ld hl, sp+$6
	ld e, [hl]
	ld c, $5
	call Func_10215
	pop bc
	pop bc
	pop de
	inc e
	dec e
	jp nz, Func_1295f
	ld hl, sp+$0
	ld l, [hl]
	ld h, c
	inc hl
	inc hl
	inc hl
	ld de, Data_12974
	call PlaceStringDEatCoordHL
	jp Func_12972

Func_1295f: ; 1295f (4:695f)
	ld a, e
	cp $1
	jp nz, Func_12972
	ld hl, sp+$0
	ld l, [hl]
	ld h, c
	inc hl
	inc hl
	inc hl
	ld de, Data_1297c
	call PlaceStringDEatCoordHL
Func_12972: ; 12972 (4:6972)
	pop bc
	ret

Data_12974: ; 12974
	dstr "(しﾞふﾞん)"

Data_1297c: ; 1297c
	dstr "(あいて)"

Func_12982: ; 12982 (4:6982)
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	read_hl_from_sp_plus $c
	ld e, h
	ld hl, sp+$7
	ld [hl], e
	read_hl_from_sp_plus $c
	ld e, l
	ld hl, sp+$8
	ld [hl], e
	pop de
	ld hl, sp+$0
	ld [hl], d
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$7
	ld [hl], $0
Func_129a3: ; 129a3 (4:69a3)
	ld hl, sp+$7
	ld a, [hl]
	cp $2
	jp nc, Func_129f7
	ld hl, sp+$2
	ld [hl], $0
	ld c, $0
Func_129b1: ; 129b1 (4:69b1)
	ld a, c
	cp $1b
	jp nc, Func_129ed
	ld hl, sp+$2
	ld a, [hl]
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	add hl, de
	cp [hl]
	jp c, Func_129e9
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld [hl], c
	jp Func_129ed

Func_129e9: ; 129e9 (4:69e9)
	inc c
	jp Func_129b1

Func_129ed: ; 129ed (4:69ed)
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	jp Func_129a3

Func_129f7: ; 129f7 (4:69f7)
	ld c, $0
Func_129f9: ; 129f9 (4:69f9)
	ld a, c
	cp $2
	jp nc, Func_12ab0
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld e, $2
	call Func_128fd
	pop bc
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	cp $5
	jp z, Func_12a6f
	cp $2
	jp z, Func_12a6f
	cp $4
	jp z, Func_12a50
	cp $1
	jp z, Func_12a50
	cp $3
	jp z, Func_12a31
	or a
	jp nz, Func_12a8b
Func_12a31: ; 12a31 (4:6a31)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $1
	call SetStringStartState
	pop bc
	jp Func_12a8b

Func_12a50: ; 12a50 (4:6a50)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $8
	call SetStringStartState
	pop bc
	jp Func_12a8b

Func_12a6f: ; 12a6f (4:6a6f)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld b, $3
	call DivideAbyB
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	add $2
	ld e, a
	ld a, $f
	call SetStringStartState
	pop bc
Func_12a8b: ; 12a8b (4:6a8b)
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_12ac2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	inc c
	jp Func_129f9

Func_12ab0: ; 12ab0 (4:6ab0)
	ld l, $e
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_12ac2: ; 12ac2
	dstr "%s"

Data_12ac5: ; 12ac5
	db $01, $71, $e1, $08, $78, $e8

Func_12acb: ; 12acb (4:6acb)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_12ac5
	ld bc, $6
	call MemCopy
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	ld l, a
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8f
	ld [hl], a
	ld hl, sp+$e
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	add $2
	ld l, a
	push hl
	ld hl, sp+$10
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8f
	ld [hl], a
	ld hl, sp+$b
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	and $f
	ld l, a
	push hl
	ld hl, sp+$d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8b
	ld [hl], a
	pop bc
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	and $f
	add $2
	ld l, a
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	pop de
	call SetStringStartState
	read_hl_from wStringStartTilemapAddress
	ld a, $8c
	ld [hl], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_12b93: ; 12b93 (4:6b93)
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_12ba6
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12bba
Func_12ba6: ; 12ba6 (4:6ba6)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_12bba: ; 12bba (4:6bba)
	call Func_1fbe
	ld e, $5
	xor a
	call SetStringStartState
	ld a, BANK(Func_17e95)
	ld [wFarCallDestBank], a
	ld hl, Func_17e95
	write_hl_to wFarCallDestAddr
	ld c, $6
	ld e, $5
	ld hl, $100
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $800
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $f00
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $107
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $807
	call FarCall
	ld c, $6
	ld e, $5
	ld hl, $f07
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $e602
	ld de, $404
	ld hl, $201
	call FarCall
	ld bc, $e602
	ld de, $b04
	ld hl, $901
	call FarCall
	ld bc, $e602
	ld de, $1204
	ld hl, $1001
	call FarCall
	ld bc, $e602
	ld de, $40b
	ld hl, $208
	call FarCall
	ld bc, $e602
	ld de, $b0b
	ld hl, $908
	call FarCall
	ld bc, $e602
	ld de, $120b
	ld hl, $1008
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, Data_12c88
	push hl
	call PlaceString
	pop bc
	ld e, $10
	ld a, $1
	call SetStringStartState
	ld hl, Data_12c96
	push hl
	call PlaceString
	pop bc
	ret

Data_12c88: ; 12c88
	dstr "カートﾞ(を えらんてﾞ)"

Data_12c96: ; 12c96
	dstr "Aホﾞタン(を おしてね)"

Func_12ca4: ; 12ca4 (4:6ca4)
	push hl
	push de
	push bc
	push bc
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_12cbb
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12ccf
Func_12cbb: ; 12cbb (4:6cbb)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_12ccf: ; 12ccf (4:6ccf)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call Func_12b93
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_12cff
	call GetHLAtSPPlus8
	inc hl
	ld l, [hl]
	push hl
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus10
	ld a, [hl]
	call GetHLAtSPPlus10
	ld e, [hl]
	call Func_12acb
	pop bc
	jp Func_12d16

Func_12cff: ; 12cff (4:6cff)
	call GetHLAtSPPlus8
	ld l, [hl]
	push hl
	call GetHLAtSPPlus10
	ld c, [hl]
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	ld e, [hl]
	call Func_12acb
	pop bc
Func_12d16: ; 12d16 (4:6d16)
	check_cgb
	jp nz, Func_12d40
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, $2
	ld [wEnableAttrMapTransfer], a
Func_12d40: ; 12d40 (4:6d40)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$2
	ld [hl], $0
	pop bc
Func_12d51: ; 12d51 (4:6d51)
	ld hl, sp+$0
	ld a, [hl]
	cp $6
	jp nc, Func_12d9e
	push bc
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	cp [hl]
	jp z, Func_12d6f
	ld hl, sp+$2
	ld a, [hl]
	call GetHLAtSPPlus8
	inc hl
	cp [hl]
	jp nz, Func_12d93
Func_12d6f: ; 12d6f (4:6d6f)
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$a
	ld a, [hl]
	cp $3c
	jp nz, Func_12d93
	ld hl, sp+$a
	ld [hl], $0
Func_12d93: ; 12d93 (4:6d93)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
	jp Func_12d51

Func_12d9e: ; 12d9e (4:6d9e)
	ld hl, sp+$8
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	ret

Data_12da5: ; 12da5
	db $21, $02, $07, $1a, $00, $05, $09, $0c, $03, $1f, $0a, $05, $13, $0c

Func_12db3: ; 12db3 (4:6db3)
	add sp, -$e
	push bc
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$d
	ld [hl], e
	ld hl, sp+$a
	ld [hl], $0
Func_12dc0: ; 12dc0 (4:6dc0)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nc, Func_12e14
	ld hl, sp+$b
	ld [hl], $0
	ld c, $0
Func_12dce: ; 12dce (4:6dce)
	ld a, c
	cp $1b
	jp nc, Func_12e0a
	ld hl, sp+$b
	ld a, [hl]
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$b
	ld [hl], a
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	add hl, de
	cp [hl]
	jp c, Func_12e06
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$e
	add hl, de
	ld [hl], c
	jp Func_12e0a

Func_12e06: ; 12e06 (4:6e06)
	inc c
	jp Func_12dce

Func_12e0a: ; 12e0a (4:6e0a)
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	jp Func_12dc0

Func_12e14: ; 12e14 (4:6e14)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	call Func_2009
	check_cgb
	jp nz, Func_12e48
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
Func_12e48: ; 12e48 (4:6e48)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	callba_hli Func_d767
	ld a, [wSystemType]
	cp $1
	jp z, Func_12ebc
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_12ec5
Func_12ebc: ; 12ebc (4:6ebc)
	ld de, $e
	ld hl, Data_12da5
	call Func_2b7d
Func_12ec5: ; 12ec5 (4:6ec5)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
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
	ld hl, $b05
	call FarCall
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $a
	ld hl, $d
	call FarCall
	ld c, $5
	ld e, $a
	ld hl, $a0d
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_13074
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $e
	ld a, $b
	call SetStringStartState
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_13077
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	push bc
	ld l, c
	push hl
	ld hl, sp+$8
	ld c, l
	ld b, h
	ld hl, sp+$11
	ld e, [hl]
	ld hl, sp+$10
	ld a, [hl]
	call Func_1307a
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	ld hl, sp+$d
	ld e, [hl]
	ld hl, sp+$c
	ld a, [hl]
	call Func_13668
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
	ld c, $0
Func_12fb0: ; 12fb0 (4:6fb0)
	ld a, c
	cp $2
	jp nc, Func_1302f
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_12ff1
	push bc
	set_farcall_addrs_hli DamageOrHeal
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, c
	call FarCall
	pop bc
	jp Func_1302b

Func_12ff1: ; 12ff1 (4:6ff1)
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, Func_1302b
	push bc
	set_farcall_addrs_hli Func_61a3e
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	ld a, [hl]
	cpl
	ld e, a
	inc hl
	ld a, [hl]
	cpl
	ld d, a
	inc de
	ld a, c
	call FarCall
	pop bc
Func_1302b: ; 1302b (4:702b)
	inc c
	jp Func_12fb0

Func_1302f: ; 1302f (4:702f)
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1304d
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1304d
	ld a, $2
	jp Func_13071

Func_1304d: ; 1304d (4:704d)
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1305f
	ld a, $1
	jp Func_13071

Func_1305f: ; 1305f (4:705f)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_1306f
	xor a
	jp Func_13071

Func_1306f: ; 1306f (4:706f)
	ld a, $ff
Func_13071: ; 13071 (4:7071)
	add sp, $e
	ret

Data_13074: ; 13074
	dstr "%s"

Data_13077: ; 13077
	dstr "%s"

Func_1307a: ; 1307a (4:707a)
	push af
	push de
	push bc
	add sp, -$4c
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $42
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $42
	ld de, $13
	add hl, de
	ld e, [hl]
	ld hl, sp+$49
	ld [hl], e
	read_hl_from_sp_plus $40
	ld de, $13
	add hl, de
	ld e, [hl]
	ld hl, sp+$4a
	ld [hl], e
	read_hl_from_sp_plus $42
	ld de, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3c
	read_hl_from_sp_plus $40
	ld de, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3e
	read_hl_from_sp_plus $42
	ld de, $25
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $38
	read_hl_from_sp_plus $40
	ld de, $25
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3a
	read_hl_from_sp_plus $42
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$34
	ld [hl], e
	read_hl_from_sp_plus $40
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$35
	ld [hl], e
	read_hl_from_sp_plus $42
	ld de, $2e
	add hl, de
	ld e, [hl]
	ld hl, sp+$47
	ld [hl], e
	read_hl_from_sp_plus $40
	ld de, $2e
	add hl, de
	ld e, [hl]
	ld hl, sp+$48
	ld [hl], e
	ld hl, sp+$46
	ld [hl], $0
Func_13130: ; 13130 (4:7130)
	ld hl, sp+$46
	ld a, [hl]
	cp $2
	jp nc, Func_131cd
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_131c3
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$48
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	pop de
	call GetPart
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld de, $10
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3a
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld de, $11
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$36
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_131c3: ; 131c3 (4:71c3)
	ld hl, sp+$46
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	jp Func_13130

Func_131cd: ; 131cd (4:71cd)
	ld hl, sp+$46
	ld [hl], $0
Func_131d1: ; 131d1 (4:71d1)
	ld hl, sp+$46
	ld a, [hl]
	cp $2
	jp nc, Func_13282
	set_farcall_addrs_hli Func_e39a
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$47
	add hl, de
	ld a, [hl]
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$36
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$36
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_1322e
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$36
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_1322e: ; 1322e (4:722e)
	ld hl, sp+$46
	ld e, [hl]
	ld d, $0
	ld hl, sp+$47
	add hl, de
	ld a, [hl]
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call FarCall
	ld c, l
	ld b, h
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_13278
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3a
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_13278: ; 13278 (4:7278)
	ld hl, sp+$46
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	jp Func_131d1

Func_13282: ; 13282 (4:7282)
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$42
	ld [hl], a
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$43
	ld [hl], a
	ld hl, sp+$42
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3e
	add hl, bc
	write_hl_to_sp_plus $3e
	ld hl, sp+$43
	ld e, [hl]
	ld d, $0
	ld hl, sp+$49
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3c
	add hl, bc
	write_hl_to_sp_plus $3c
	read_hl_from_sp_plus $38
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3e
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	read_hl_from_sp_plus $4e
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $3a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3c
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	xor a
Func_13319: ; 13319 (4:7319)
	cp $2
	jp nc, Func_1334b
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_13347
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
.asm_13347
	inc a
	jp Func_13319

Func_1334b: ; 1334b (4:734b)
	set_farcall_addrs_hli Func_e28f
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $44
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call FarCall
	ld hl, sp+$0
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1
	ld c, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $4e
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_133b0
	read_hl_from_sp_plus $4e
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_133b0: ; 133b0 (4:73b0)
	read_hl_from_sp_plus $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_133ee
	ld hl, sp+$51
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from_sp_plus $50
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_133ee: ; 133ee (4:73ee)
	set_farcall_addrs_hli Func_e28f
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $42
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call FarCall
	ld hl, sp+$0
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1
	ld c, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $0
	call CompareHLtoBC
	jp c, Func_13459
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_13459: ; 13459 (4:7459)
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_1349b
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_12155
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from_sp_plus $50
	inc hl
	inc hl
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_1349b: ; 1349b (4:749b)
	ld c, $0
Func_1349d: ; 1349d (4:749d)
	ld a, c
	cp $2
	jp nc, Func_134d3
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_134cf
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, 999
	ld [hl], e
	inc hl
	ld [hl], d
Func_134cf: ; 134cf (4:74cf)
	inc c
	jp Func_1349d

Func_134d3: ; 134d3 (4:74d3)
	ld hl, sp+$51
	ld a, [hl]
	ld hl, sp+$44
	ld [hl], a
	ld hl, sp+$4e
	ld a, [hl]
	ld hl, sp+$45
	ld [hl], a
	ld c, $0
Func_134e1: ; 134e1 (4:74e1)
	ld a, c
	cp $2
	jp nc, Func_13576
	ld e, c
	ld d, $0
	ld hl, sp+$44
	add hl, de
	ld a, [hl]
	cp $17
	jp z, Func_1355f
	cp $1a
	jp z, Func_13549
	cp $19
	jp z, Func_13533
	cp $18
	jp z, Func_1351d
	cp $16
	jp nz, Func_13572
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_1351d: ; 1351d (4:751d)
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $64
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_13533: ; 13533 (4:7533)
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $c8
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_13549: ; 13549 (4:7549)
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, hFFC9 + 5
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_13572

Func_1355f: ; 1355f (4:755f)
	read_hl_from_sp_plus $4e
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_13572: ; 13572 (4:7572)
	inc c
	jp Func_134e1

Func_13576: ; 13576 (4:7576)
	ld c, $0
Func_13578: ; 13578 (4:7578)
	ld a, c
	cp $2
	jp nc, Func_135ce
	ld e, c
	ld d, $0
	ld hl, sp+$44
	add hl, de
	ld a, [hl]
	cp $17
	jp nz, Func_135ca
	push bc
	inc c
	dec c
	jp nz, Func_135af
	read_hl_from_sp_plus $50
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $50
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $50
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_135c9

Func_135af: ; 135af (4:75af)
	read_hl_from_sp_plus $50
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $50
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $50
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_135c9: ; 135c9 (4:75c9)
	pop bc
Func_135ca: ; 135ca (4:75ca)
	inc c
	jp Func_13578

Func_135ce: ; 135ce (4:75ce)
	ld e, $10
	ld a, $1
	call SetStringStartState
	read_hl_from_sp_plus $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_135ed
	ld hl, Data_13640
	push hl
	call PlaceString
	pop bc
	jp Func_135fe

.asm_135ed
	read_hl_from_sp_plus $4e
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_1364a
.asm_135f8
	push hl
	call PlaceString
	pop bc
	pop bc
Func_135fe: ; 135fe (4:75fe)
	ld e, $10
	ld a, $b
	call SetStringStartState
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld e, [hl]
.asm_1360c
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_1361f
	ld hl, Data_13654
	push hl
	call PlaceString
	pop bc
	jp Func_13632

.asm_1361f
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_1365e
	push hl
	call PlaceString
	pop bc
	pop bc
Func_13632: ; 13632 (4:7632)
	ld hl, $0
	reg16swap de, hl
	add sp, $52
	reg16swap de, hl
	ret

Data_13640: ; 13640
	dstr "(かいふく) 50"

Data_1364a: ; 1364a
	dstr "タﾞメーシﾞ %d"

Data_13654: ; 13654
	dstr "(かいふく) 50"

Data_1365e: ; 1365e
	dstr "タﾞメーシﾞ %d"

Func_13668: ; 13668 (4:7668)
	inc c
	dec c
	jp nz, .asm_13691
	push af
	push de
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $0
	pop de
	ld a, e
	call Func_136cc
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $1
	pop af
	call Func_136cc
	jp Func_136b0

.asm_13691
	push de
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $1
	call Func_136cc
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $0
	pop de
	ld a, e
	call Func_136cc
Func_136b0: ; 136b0 (4:76b0)
	ret

Data_136b1: ; 136b1
	db $01, $02, $0f, $22, $15, $18, $1a, $1d, $27, $26, $24, $25, $50, $4e, $4f, $4d, $54, $32, $7f, $1b, $30, $13, $00, $00, $0c, $37, $29

Func_136cc: ; 136cc (4:76cc)
	push af
	add sp, -$1c
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_136b1
	ld bc, $1b
	call MemCopy
	ld hl, sp+$1d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_13726
	set_farcall_addrs_hli Func_dcaf
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	ld hl, sp+$1d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	call FarCall
	set_farcall_addrs_hli Func_dd0a
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	ld e, $0
	call FarCall
Func_13726: ; 13726 (4:7726)
	add sp, $1e
	ret


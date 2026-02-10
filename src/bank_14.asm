INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 14", ROMX, BANK [$14]
Func_50000: ; 50000
	ret

Data_50001: ; 50001
	db  2,  9
	db 14,  7
	dba OptionsMenu_Redraw
	dbw 5, 0
	dba OptionsMenu_UpDown
	dba OptionsMenu_AButton
	dbw 5, 0
	dba OptionsMenu_Right
	dba OptionsMenu_Left
	dbw 0, 0
	dbw 0, 0

Data_50020: ; 50020
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_5002f: ; 5002f
	db 6, 0
	db 8, 4
	dba Func_531fe
	dbw 5, 0
	dba Func_5346b
	dba Func_53667
	dbw 5, 0
	dba Func_5365b
	dba Func_53661
	dbw 0, 0
	dbw 0, 0

Data_5004e: ; 5004e
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $00, $00, $00

Data_5005d: ; 5005d
	db  6, 4
	db 11, 4
	dba Func_5321e
	dbw 5, 0
	dba Func_4e813
	dba Func_53667
	dbw 5, 0
	dba Func_4e175
	dba Func_4e1a4
	dbw 0, 0
	dbw 0, 0

Data_5007c: ; 5007c
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $20, $00, $00

Data_5008b: ; 5008b
	db 6, 8
	db 7, 4
	dba Func_5323f
	dbw 5, 0
	dba Func_5366b
	dba Func_53667
	dbw 5, 0
	dba Func_537d0
	dba Func_537d6
	dbw 0, 0
	dbw 0, 0

Data_500aa: ; 500aa
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $00, $00, $00

Data_500b9: ; 500b9
	db  0,  0
	db 20, 18
	dba Func_508e8
	dbw 5, 0
	dba Func_54981
	dba Func_509b3
	dba Func_50914
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_500d8: ; 500d8
	db $ff, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $10, $00, $23

Data_500e7: ; 500e7
	db  4,  2
	db 10, 13
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_51923
	dbw 5, 0
	dbw 5, 0
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0

Pointers_50106:
	dw Data_50112
	dw Data_5011b
	dw Data_50124
	dw Data_5012d
	dw Data_50136
	dw Data_5013f

Data_50112:
	dstr "クﾞレーテスト6"

Data_5011b:
	dstr "クﾞレーテスト5"

Data_50124:
	dstr "クﾞレーテスト4"

Data_5012d:
	dstr "クﾞレーテスト3"

Data_50136:
	dstr "クﾞレーテスト2"

Data_5013f:
	dstr "クﾞレーテスト1"

Data_50148: ; 50148
	db $00, $00, $00, $00, $ff, $ff, $06, $00, $06, $00, $00, $00, $06, $41, $00

Data_50157:
	db  3,  0
	db 13, 12
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_6275b
	dba Func_1746c
	dba Func_16038
	dba Func_160c2
	dbw 0, 0
	dbw 0, 0

Data_50176:
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $21, $00, $26

Func_50185: ; 50185 (14:4185)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

MainMenuSubmenu_Options:: ; 5019a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld a, [wOptions]
	ld l, a
	push hl
	ld a, e
	call GetSRAMBank
	pop hl
	ld a, l
	and $1
	ld [wOptionsMenu_BattleScene], a
	ld a, l
	and $2
	rrca
	and $7f
	ld [wOptionsMenu_StereoSelect], a
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_50020)
	ld de, Data_50020
	ld hl, Data_50001
	call FarCall
	ret

Func_501de: ; 501de (14:41de)
	push hl
	push bc
	push bc
	push bc
	push bc
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
	call GetHLAtSPPlus10
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	call GetHLAtSPPlus7
	ld de, $2
	call DivideHLByDESigned
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	ld a, l
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld de, $2
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	ld de, $c
	add hl, de
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	call GetHLAtSPPlus5
	ld de, $2
	call DivideHLByDESigned
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	inc hl
	inc hl
	inc hl
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	call GetHLAtSPPlus5
	ld de, $2
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	ld de, $c
	add hl, de
	ld c, l
	call GetHLAtSPPlus5
	ld a, l
	or h
	jp z, Func_50268
	call GetHLAtSPPlus5
	ld a, l
	dec a
	or h
	jp nz, Func_502ce
Func_50268: ; 50268 (14:4268)
	call GetHLAtSPPlus7
	ld a, l
	or h
	jp z, Func_50279
	call GetHLAtSPPlus7
	ld a, l
	dec a
	or h
	jp nz, Func_502a1
Func_50279: ; 50279 (14:4279)
	ld e, c
	ld hl, sp+$0
	ld a, [hl]
	call SetStringStartState
	ld hl, Data_50337
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_50339
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_502cb

Func_502a1: ; 502a1 (14:42a1)
	ld e, c
	ld hl, sp+$0
	ld a, [hl]
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_5033c
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_5033f
	push hl
	call PlaceString
	pop bc
	pop bc
Func_502cb: ; 502cb (14:42cb)
	jp Func_50331

Func_502ce: ; 502ce (14:42ce)
	call GetHLAtSPPlus7
	ld a, l
	or h
	jp z, Func_502df
	call GetHLAtSPPlus7
	ld a, l
	dec a
	or h
	jp nz, Func_5030c
Func_502df: ; 502df (14:42df)
	ld e, c
	ld hl, sp+$0
	ld a, [hl]
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_50342
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_50345
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_50331

Func_5030c: ; 5030c (14:430c)
	ld e, c
	ld hl, sp+$0
	ld a, [hl]
	call SetStringStartState
	ld hl, Data_50348
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$1
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_5034a
	push hl
	call PlaceString
	pop bc
	pop bc
Func_50331: ; 50331 (14:4331)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_50337: ; 50337
	dstr " "

Data_50339: ; 50339
	dstr "%c"

Data_5033c: ; 5033c
	dstr "%c"

Data_5033f: ; 5033f
	dstr "%c"

Data_50342: ; 50342
	dstr "%c"

Data_50345: ; 50345
	dstr "%c"

Data_50348: ; 50348
	dstr " "

Data_5034a: ; 5034a
	dstr "%c"

OptionsMenu_UpDown: ; 5034d (14:434d)
	push bc
	push de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_50410
	ld a, e
	sub $2
	or d
	jp z, Func_503e6
	ld a, e
	dec a
	or d
	jp z, Func_503ab
	ld a, e
	or d
	jp nz, Func_5043a
	ld a, c
	or b
	jp z, Func_50380
	ld a, c
	dec a
	or b
	jp nz, Func_50391
Func_50380: ; 50380 (14:4380)
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_5038a
	ld bc, $0
.asm_5038a
	ld a, c
	ld [wOptionsMenu_BattleScene], a
	jp Func_503a8

Func_50391: ; 50391 (14:4391)
	dec bc
	ld l, c
	ld h, b
	ld de, $2
	call CompareHLtoDE
	jp nc, Func_503a0
	ld bc, $2
Func_503a0: ; 503a0 (14:43a0)
	ld l, c
	ld h, b
	dec hl
	dec hl
	ld a, l
	ld [wOptionsMenu_StereoSelect], a
Func_503a8: ; 503a8 (14:43a8)
	jp Func_5043a

Func_503ab: ; 503ab (14:43ab)
	ld a, c
	or b
	jp z, Func_503b6
	ld a, c
	dec a
	or b
	jp nz, Func_503cc
Func_503b6: ; 503b6 (14:43b6)
	inc bc
	ld e, c
	ld d, b
	ld hl, $1
	call CompareHLtoDE
	jp nc, Func_503c5
	ld bc, $1
Func_503c5: ; 503c5 (14:43c5)
	ld a, c
	ld [wOptionsMenu_BattleScene], a
	jp Func_503e3

Func_503cc: ; 503cc (14:43cc)
	inc bc
	ld e, c
	ld d, b
	ld hl, $3
	call CompareHLtoDE
	jp nc, Func_503db
	ld bc, $3
Func_503db: ; 503db (14:43db)
	ld l, c
	ld h, b
	dec hl
	dec hl
	ld a, l
	ld [wOptionsMenu_StereoSelect], a
Func_503e3: ; 503e3 (14:43e3)
	jp Func_5043a

Func_503e6: ; 503e6 (14:43e6)
	ld a, c
	or b
	jp z, Func_503f1
	ld a, c
	dec a
	or b
	jp nz, Func_5040d
Func_503f1: ; 503f1 (14:43f1)
	ld a, c
	ld [wOptionsMenu_BattleScene], a
	ld a, [wOptionsMenu_StereoSelect]
	or a
	jp nz, Func_50402
	ld bc, $2
	jp Func_50405

Func_50402: ; 50402 (14:4402)
	ld bc, $3
Func_50405: ; 50405 (14:4405)
	ld l, c
	ld h, b
	dec hl
	dec hl
	ld a, l
	ld [wOptionsMenu_StereoSelect], a
Func_5040d: ; 5040d (14:440d)
	jp Func_5043a

Func_50410: ; 50410 (14:4410)
	ld a, c
	sub $2
	or b
	jp z, Func_5041e
	ld a, c
	sub $3
	or b
	jp nz, Func_5043a
Func_5041e: ; 5041e (14:441e)
	ld l, c
	ld h, b
	dec hl
	dec hl
	ld a, l
	ld [wOptionsMenu_StereoSelect], a
	ld a, [wOptionsMenu_BattleScene]
	or a
	jp nz, Func_50433
	ld bc, $0
	jp Func_50436

Func_50433: ; 50433 (14:4433)
	ld bc, $1
Func_50436: ; 50436 (14:4436)
	ld a, c
	ld [wOptionsMenu_BattleScene], a
Func_5043a: ; 5043a (14:443a)
	push bc
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, $7
	push hl
	ld c, $e
	ld e, $9
	ld a, $2
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus4
	call Func_501de
	ld l, $7
	push hl
	ld c, $e
	ld e, $9
	ld a, $2
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $4000
	pop bc
	ret

OptionsMenu_Right: ; 50473
	ld de, $2
	jp OptionsMenu_UpDown

OptionsMenu_Left: ; 50479
	ld de, $3
	jp OptionsMenu_UpDown

OptionsMenu_AButton: ; 5047f
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld l, $0
	ld a, [wOptionsMenu_BattleScene]
	or a
	jp nz, Func_504b1
	ld a, [wOptionsMenu_StereoSelect]
	or a
	jp nz, Func_504b1
	ld l, $0
	jp Func_504e1

Func_504b1: ; 504b1 (14:44b1)
	ld a, [wOptionsMenu_BattleScene]
	or a
	jp nz, Func_504c7
	ld a, [wOptionsMenu_StereoSelect]
	cp $1
	jp nz, Func_504c7
	ld a, l
	or $2
	ld l, a
	jp Func_504e1

Func_504c7: ; 504c7 (14:44c7)
	ld a, [wOptionsMenu_BattleScene]
	cp $1
	jp nz, Func_504dd
	ld a, [wOptionsMenu_StereoSelect]
	or a
	jp nz, Func_504dd
	ld a, l
	or $1
	ld l, a
	jp Func_504e1

Func_504dd: ; 504dd (14:44dd)
	ld a, l
	or $3
	ld l, a
Func_504e1: ; 504e1 (14:44e1)
	push hl
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	pop hl
	ld a, l
	ld [wOptions], a
	ld a, e
	call GetSRAMBank
	callba_hli Func_4fef1
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, -1
	ret

Pointers_5052d: ; 5052d
	dw Data_50531
	dw $0

Data_50531: ; 50531
	dstr "セーフﾞ(したよ)"

MainMenuSubmenu_Save:: ; 5053b
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	ld de, Data_505f9
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, .said_no
	callba_hli SaveGame
	ld l, $5
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5052d)
	ld de, Pointers_5052d
	ld hl, $10e
	call FarCall
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
.said_no
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Data_505f9: ; 505f9
	dstr "セーフﾞ(するよ)?"

Func_50604:: ; 50604 (14:4604)
	push bc
	push bc
	push bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$1
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$0
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, $5
	add hl, bc
	ld l, [hl]
	inc hl
	ld h, [hl]
	ld hl, $9
	add hl, bc
	ld l, [hl]
	inc hl
	ld h, [hl]
	ld hl, $7
	add hl, bc
	ld l, [hl]
	inc hl
	ld h, [hl]
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $1c
	jp z, Func_5083c
	cp $19
	jp z, Func_50760
	cp $13
	jp z, Func_50760
	cp $1d
	jp nz, Func_508bc
	call GetHLAtSPPlus4
	ld a, l
	and h
	inc a
	jp z, Func_506e2
	call GetHLAtSPPlus4
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_5068e
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus4
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$1
	ld a, [hl]
	inc a
	call SetStringStartState
	jp Func_506da

Func_5068e: ; 5068e (14:468e)
	call GetHLAtSPPlus4
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_506b5
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus4
	add hl, hl
	ld de, -8
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$1
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_506da

Func_506b5: ; 506b5 (14:46b5)
	call GetHLAtSPPlus4
	ld a, l
	sub $8
	or h
	jp nz, Func_506c9
	ld e, $d
	ld a, $2
	call SetStringStartState
	jp Func_506da

Func_506c9: ; 506c9 (14:46c9)
	call GetHLAtSPPlus4
	ld a, l
	sub $9
	or h
	jp nz, Func_506da
	ld e, $f
	ld a, $2
	call SetStringStartState
Func_506da: ; 506da (14:46da)
	ld hl, Data_508c0
	push hl
	call PlaceString
	pop bc
Func_506e2: ; 506e2 (14:46e2)
	call GetHLAtSPPlus6
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_50704
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus6
	add hl, hl
	add hl, bc
	ld e, l
	ld hl, sp+$1
	ld a, [hl]
	inc a
	call SetStringStartState
	jp Func_50750

Func_50704: ; 50704 (14:4704)
	call GetHLAtSPPlus6
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_5072b
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus6
	add hl, hl
	ld de, -8
	add hl, de
	add hl, bc
	ld e, l
	ld hl, sp+$1
	ld a, [hl]
	add $b
	call SetStringStartState
	jp Func_50750

Func_5072b: ; 5072b (14:472b)
	call GetHLAtSPPlus6
	ld a, l
	sub $8
	or h
	jp nz, Func_5073f
	ld e, $d
	ld a, $2
	call SetStringStartState
	jp Func_50750

Func_5073f: ; 5073f (14:473f)
	call GetHLAtSPPlus6
	ld a, l
	sub $9
	or h
	jp nz, Func_50750
	ld e, $f
	ld a, $2
	call SetStringStartState
Func_50750: ; 50750 (14:4750)
	ld hl, $8b
	push hl
	ld hl, Data_508c2
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_508bc

Func_50760: ; 50760 (14:4760)
	call GetHLAtSPPlus4
	ld a, l
	sub $36
	or h
	jp z, Func_50774
	call GetHLAtSPPlus4
	ld a, l
	sub $37
	or h
	jp nz, Func_5079d
Func_50774: ; 50774 (14:4774)
	ld hl, sp+$1
	ld [hl], $1
	call GetHLAtSPPlus4
	add hl, hl
	ld de, hFFA3
	add hl, de
	ld e, l
	ld hl, sp+$0
	ld [hl], e
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_508c5
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_507db

Func_5079d: ; 5079d (14:479d)
	call GetHLAtSPPlus4
	ld a, l
	and h
	inc a
	jp z, Func_507db
	call GetHLAtSPPlus4
	ld de, $6
	call DivideHLByDESigned
	add hl, hl
	inc hl
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	call GetHLAtSPPlus4
	ld de, $6
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	call SetStringStartState
	ld hl, Data_508c8
	push hl
	call PlaceString
	pop bc
Func_507db: ; 507db (14:47db)
	call GetHLAtSPPlus6
	ld a, l
	sub $37
	or h
	jp z, Func_507ec
	ld a, l
	sub $36
	or h
	jp nz, Func_507ff
Func_507ec: ; 507ec (14:47ec)
	ld hl, sp+$1
	ld [hl], $1
	call GetHLAtSPPlus6
	add hl, hl
	ld de, hFFA3
	add hl, de
	ld e, l
	ld hl, sp+$0
	ld [hl], e
	jp Func_50823

Func_507ff: ; 507ff (14:47ff)
	call GetHLAtSPPlus6
	ld de, $6
	call DivideHLByDESigned
	add hl, hl
	inc hl
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	call GetHLAtSPPlus6
	ld de, $6
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	ld a, l
	ld hl, sp+$0
	ld [hl], a
Func_50823: ; 50823 (14:4823)
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_508ca
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_508bc

Func_5083c: ; 5083c (14:483c)
	call GetHLAtSPPlus4
	ld a, l
	and h
	inc a
	jp z, Func_5087e
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus4
	ld a, l
	and $b
	ld l, a
	ld h, $0
	add hl, hl
	add hl, bc
	push hl
	call GetHLAtSPPlus6
	ld de, $4
	call DivideHLByDESigned
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, l
	pop de
	call SetStringStartState
	ld hl, Data_508cd
	push hl
	call PlaceString
	pop bc
Func_5087e: ; 5087e (14:487e)
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	inc bc
	call GetHLAtSPPlus6
	ld a, l
	and $b
	ld l, a
	ld h, $0
	add hl, hl
	add hl, bc
	push hl
	call GetHLAtSPPlus8
	ld de, $4
	call DivideHLByDESigned
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, l
	pop de
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_508cf
	push hl
	call PlaceString
	pop bc
	pop bc
Func_508bc: ; 508bc (14:48bc)
	pop bc
	pop bc
	pop bc
	ret

Data_508c0: ; 508c0
	dstr " "

Data_508c2: ; 508c2
	dstr "%c"

Data_508c5: ; 508c5
	dstr "%c"

Data_508c8: ; 508c8
	dstr " "

Data_508ca: ; 508ca
	dstr "%c"

Data_508cd: ; 508cd
	dstr " "

Data_508cf: ; 508cf
	dstr "%c"

Func_508d2: ; 508d2
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_500d8)
	ld de, Data_500d8
	ld hl, Data_500b9
	jp FarCall

Func_508e8: ; 508e8
	push hl
	ld l, $c
	push hl
	ld c, $1
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_54767
	pop hl
	call FarCall
	ld l, $c
	push hl
	ld c, $1
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	ret

Func_50914: ; 50914
	ld c, l
	ld b, h
	push bc
	ld l, $c
	push hl
	ld c, $1
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop bc
	push bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	inc hl
	ld a, l
	ld l, a
	ld h, $0
	ld de, Data_5098a
	call PlaceStringDEatCoordHL
	pop bc
	push bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp z, Func_50961
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	inc hl
	ld a, l
	ld l, a
	ld h, $0
	ld de, Data_5098c
	call PlaceStringDEatCoordHL
Func_50961: ; 50961 (14:4961)
	ld l, $c
	push hl
	ld c, $1
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc396
	add hl, de
	ld [hl], $0
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	ret

Data_5098a: ; 5098a
	dstr " "

Data_5098c: ; 5098c
	dstr " "

Pointers_5098e: ; 5098e
	dw Data_50994
	dw Data_509a4
	dw $0

Data_50994: ; 50994
	dstr "(おなしﾞ)ロホﾞホﾟン(は)"

Data_509a4: ; 509a4
	dstr "(ならひﾞかえてﾞきません)"

Func_509b3: ; 509b3
	push bc
	push hl
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wc310], a
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	pop bc
	pop hl
	ld a, [wc2f6]
	cp $1
	jp z, Func_50ad4
	or a
	jp nz, Func_50af6
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp nz, Func_50a11
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $4000
	jp Func_50ad1

Func_50a11: ; 50a11 (14:4a11)
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoDE
	jp z, Func_50a86
	push bc
	set_farcall_addrs_hli Func_57c4a
	pop bc
	push bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call FarCall
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc396
	add hl, de
	ld [hl], $0
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc396
	add hl, de
	ld [hl], $0
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $b
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $5000
	jp Func_50ad1

Func_50a86: ; 50a86 (14:4a86)
	push bc
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5098e)
	ld de, Pointers_5098e
	ld hl, $10e
	call FarCall
	ld l, $f
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	ld hl, $4000
	pop bc
Func_50ad1: ; 50ad1 (14:4ad1)
	jp Func_50af6

Func_50ad4: ; 50ad4 (14:4ad4)
	push bc
	callba_hli Func_5575d
	set_farcall_addrs_hli Func_56b35
	xor a
	call FarCall
	ld hl, $5000
	pop bc
Func_50af6: ; 50af6 (14:4af6)
	push hl
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc396
	add hl, de
	ld [hl], $0
	set_farcall_addrs_hli free
	call GetHLAtSPPlus4
	call FarCall
	pop hl
	pop bc
	ret

GetRobotSprite:: ; 50b19
	add sp, -$30
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	push hl
	ld e, a
	dec e
	ld hl, sp+$2
	call GetRobotOrTrainerBaseStats
	pop hl
	ld a, l
	call GetSRAMBank
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$2b
	ld e, [hl]
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	add sp, $30
	ret

Func_50b55:: ; 50b55
	push hl
	add sp, -$18
	ld hl, sp+$18
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
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
	pop hl
	write_hl_to_sp_plus $19
	read_hl_from_sp_plus $19
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $19
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	pop de
	push hl
	read_hl_from_sp_plus $19
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$6
	ld a, [hl]
	cp $2
	jp z, Func_50c0e
	cp $1
	jp nz, Func_50c24
	set_farcall_addrs_hli Func_5601b
	ld c, $0
	call GetHLAtSPPlus6
	ld e, l
	ld hl, sp+$7
	call FarCall
	jp Func_50c24

Func_50c0e: ; 50c0e (14:4c0e)
	set_farcall_addrs_hli Func_55f95
	ld c, $0
	call GetHLAtSPPlus6
	ld e, l
	ld hl, sp+$7
	call FarCall
Func_50c24: ; 50c24 (14:4c24)
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$5
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld de, Data_50cf6
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, Func_50ccc
	read_hl_from_sp_plus $1b
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	cp $2
	jp z, Func_50c9d
	cp $1
	jp nz, Func_50cb1
	set_farcall_addrs_hli Func_4ec2b
	call GetHLAtSPPlus4
	ld a, l
	ld e, $1
	call FarCall
	jp Func_50cb1

Func_50c9d: ; 50c9d (14:4c9d)
	set_farcall_addrs_hli Func_4ed70
	call GetHLAtSPPlus4
	ld a, l
	ld e, $1
	call FarCall
Func_50cb1: ; 50cb1 (14:4cb1)
	read_hl_from_sp_plus $1b
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $1b
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_50ccc: ; 50ccc (14:4ccc)
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, $8000
	reg16swap de, hl
	add sp, $1a
	reg16swap de, hl
	ret

Data_50cf6: ; 50cf6
	dstr "(を すてても よろしいてﾞすか)?"

GetZodiacSign:: ; 50d09
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wSaveScratchZodiacSign]
	push af
	ld a, l
	call GetSRAMBank
	pop af
	ret

Func_50d27:: ; 50d27 (14:4d27)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$2
	ld [hl], $0
Func_50d44: ; 50d44 (14:4d44)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_50d7c
	ld hl, sp+$2
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_50d6f
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_50d72

Func_50d6f: ; 50d6f (14:4d6f)
	jp Func_50d7c

Func_50d72: ; 50d72 (14:4d72)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_50d44

Func_50d7c: ; 50d7c (14:4d7c)
	pop af
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	pop bc
	ret

Func_50d85:: ; 50d85
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wcb57]
	push af
	ld a, l
	call GetSRAMBank
	pop af
	ret

Func_50da3: ; 50da3
	push af
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $3
	jp z, Func_50e80
	cp $2
	jp z, Func_50e42
	cp $1
	jp z, Func_50dfe
	or a
	jp nz, Func_50ebc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50dd4: ; 50dd4 (14:4dd4)
	ld a, c
	cp $14
	jp nc, Func_50dfa
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nz, Func_50df6
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	jp Func_50dfa

Func_50df6: ; 50df6 (14:4df6)
	inc c
	jp Func_50dd4

Func_50dfa: ; 50dfa (14:4dfa)
	pop bc
	jp Func_50ebc

Func_50dfe: ; 50dfe (14:4dfe)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50e15: ; 50e15 (14:4e15)
	ld a, c
	cp $50
	jp nc, Func_50e3e
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nz, Func_50e3a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	jp Func_50e3e

Func_50e3a: ; 50e3a (14:4e3a)
	inc c
	jp Func_50e15

Func_50e3e: ; 50e3e (14:4e3e)
	pop bc
	jp Func_50ebc

Func_50e42: ; 50e42 (14:4e42)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50e59: ; 50e59 (14:4e59)
	ld a, c
	cp $14
	jp nc, Func_50e7c
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_50e75
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_50e78

Func_50e75: ; 50e75 (14:4e75)
	jp Func_50e7c

Func_50e78: ; 50e78 (14:4e78)
	inc c
	jp Func_50e59

Func_50e7c: ; 50e7c (14:4e7c)
	pop bc
	jp Func_50ebc

Func_50e80: ; 50e80 (14:4e80)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50e97: ; 50e97 (14:4e97)
	ld a, c
	cp $50
	jp nc, Func_50ebb
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_50eb4
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_50eb7

Func_50eb4: ; 50eb4 (14:4eb4)
	jp Func_50ebb

Func_50eb7: ; 50eb7 (14:4eb7)
	inc c
	jp Func_50e97

Func_50ebb: ; 50ebb (14:4ebb)
	pop bc
Func_50ebc: ; 50ebc (14:4ebc)
	ld a, c
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	ret

Func_50ec6: ; 50ec6
	push bc
	ld hl, sp+$0
	ld [hl], $0
	ld a, e
	cp $3
	jp z, Func_50f14
	cp $2
	jp nz, Func_50f4f
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50eed: ; 50eed (14:4eed)
	ld a, c
	cp $14
	jp nc, Func_50f10
	ld e, c
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_50f09
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_50f0c

Func_50f09: ; 50f09 (14:4f09)
	jp Func_50f10

Func_50f0c: ; 50f0c (14:4f0c)
	inc c
	jp Func_50eed

Func_50f10: ; 50f10 (14:4f10)
	pop bc
	jp Func_50f4f

Func_50f14: ; 50f14 (14:4f14)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	push bc
	ld c, $0
Func_50f2b: ; 50f2b (14:4f2b)
	ld a, c
	cp $dc
	jp nc, Func_50f4e
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_50f47
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_50f4a

Func_50f47: ; 50f47 (14:4f47)
	jp Func_50f4e

Func_50f4a: ; 50f4a (14:4f4a)
	inc c
	jp Func_50f2b

Func_50f4e: ; 50f4e (14:4f4e)
	pop bc
Func_50f4f: ; 50f4f (14:4f4f)
	ld a, c
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_50f58:: ; 50f58 (14:4f58)
	push de
	push bc
	push bc
	push bc
	ld l, a
	ld h, 0
	get_party_bot
	ld l, [hl]
	push hl
	ld hl, sp+$2
	ld [hl], $ff
	ld hl, sp+$8
	ld a, [hl]
	cp $ff
	jp z, Func_50fa8
	set_farcall_addrs_hli malloc
	ld hl, $23
	call FarCall
	call WriteHLToSPPlus8
	set_farcall_addrs_hli Func_7dfc
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$8
	ld a, [hl]
	call FarCall
Func_50fa8: ; 50fa8 (14:4fa8)
	pop hl
	ld a, [wPlayerState]
	cp $1
	jp z, Func_510ea
	cp $4
	jp z, Func_510ea
	cp $3
	jp z, Func_5100d
	cp $2
	jp nz, Func_51235
	ld a, l
	cp $1f
	jp nz, Func_51006
	ld a, [wMapGroup]
	cp $9
	jp nz, Func_51003
	ld a, [wMapNumber]
	or a
	jp nz, Func_51003
	set_farcall_addrs_hli Func_6ab29
	ld a, $1f
	call FarCall
	cp $2
	jp c, Func_50fee
	ld hl, sp+$0
	ld [hl], $1
Func_50fee: ; 50fee (14:4fee)
	ld hl, sp+$6
	ld a, [hl]
	cp $ff
	jp z, Func_51003
	call GetHLAtSPPlus6
	ld a, [hl]
	cp $1f
	jp nz, Func_51003
	ld hl, sp+$0
	ld [hl], $1
Func_51003: ; 51003 (14:5003)
	jp Func_5100a

Func_51006: ; 51006 (14:5006)
	ld hl, sp+$0
	ld [hl], $1
Func_5100a: ; 5100a (14:500a)
	jp Func_51239

Func_5100d: ; 5100d (14:500d)
	ld a, l
	cp $20
	jp z, Func_5101f
	ld a, l
	cp $21
	jp z, Func_5101f
	ld a, l
	cp $7e
	jp nz, Func_510e3
Func_5101f: ; 5101f (14:501f)
	ld a, [wMapGroup]
	cp $9
	jp nz, Func_5102e
	ld a, [wMapNumber]
	or a
	jp z, Func_5103d
Func_5102e: ; 5102e (14:502e)
	ld a, [wMapGroup]
	cp $1b
	jp nz, Func_510e0
	ld a, [wMapNumber]
	or a
	jp nz, Func_510e0
Func_5103d: ; 5103d (14:503d)
	set_farcall_addrs_hli Func_6ab29
	ld a, $20
	call FarCall
	ld hl, sp+$3
	ld [hl], a
	cp $2
	jp c, Func_5105c
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_5105c: ; 5105c (14:505c)
	set_farcall_addrs_hli Func_6ab29
	ld a, $21
	call FarCall
	ld hl, sp+$2
	ld [hl], a
	cp $2
	jp c, Func_5107b
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_5107b: ; 5107b (14:507b)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	cp $2
	jp c, Func_5108d
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_5108d: ; 5108d (14:508d)
	set_farcall_addrs_hli Func_6ab29
	ld a, $7e
	call FarCall
	ld hl, sp+$1
	ld [hl], a
	cp $2
	jp c, Func_510ac
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_510ac: ; 510ac (14:50ac)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld hl, sp+$1
	add [hl]
	cp $2
	jp c, Func_510c1
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_510c1: ; 510c1 (14:50c1)
	ld hl, sp+$6
	ld a, [hl]
	cp $ff
	jp z, Func_510e0
	call GetHLAtSPPlus6
	ld a, [hl]
	cp $7e
	jp z, Func_510dc
	cp $21
	jp z, Func_510dc
	cp $20
	jp nz, Func_510e0
Func_510dc: ; 510dc (14:50dc)
	ld hl, sp+$0
	ld [hl], $1
Func_510e0: ; 510e0 (14:50e0)
	jp Func_510e7

Func_510e3: ; 510e3 (14:50e3)
	ld hl, sp+$0
	ld [hl], $1
Func_510e7: ; 510e7 (14:50e7)
	jp Func_51239

Func_510ea: ; 510ea (14:50ea)
	ld a, l
	cp $f
	jp z, Func_51102
	ld a, l
	cp $41
	jp z, Func_51102
	ld a, l
	cp $50
	jp z, Func_51102
	ld a, l
	cp $64
	jp nz, Func_5122e
Func_51102: ; 51102 (14:5102)
	ld a, [wMapGroup]
	cp $1e
	jp nz, Func_51111
	ld a, [wMapNumber]
	or a
	jp z, Func_51149
Func_51111: ; 51111 (14:5111)
	ld a, [wMapGroup]
	cp $1e
	jp nz, Func_51121
	ld a, [wMapNumber]
	cp $1
	jp z, Func_51149
Func_51121: ; 51121 (14:5121)
	ld a, [wMapGroup]
	cp $1e
	jp nz, Func_51131
	ld a, [wMapNumber]
	cp $2
	jp z, Func_51149
Func_51131: ; 51131 (14:5131)
	ld a, [wMapGroup]
	cp $1e
	jp nz, Func_51141
	ld a, [wMapNumber]
	cp $3
	jp z, Func_51149
Func_51141: ; 51141 (14:5141)
	ld a, [wMapGroup]
	cp $c
	jp nz, Func_51227
Func_51149: ; 51149 (14:5149)
	set_farcall_addrs_hli Func_6ab29
	ld a, $f
	call FarCall
	ld hl, sp+$3
	ld [hl], a
	cp $2
	jp c, Func_51168
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_51168: ; 51168 (14:5168)
	set_farcall_addrs_hli Func_6ab29
	ld a, $41
	call FarCall
	ld hl, sp+$2
	ld [hl], a
	cp $2
	jp c, Func_51187
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_51187: ; 51187 (14:5187)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	cp $2
	jp c, Func_51199
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_51199: ; 51199 (14:5199)
	set_farcall_addrs_hli Func_6ab29
	ld a, $50
	call FarCall
	ld hl, sp+$1
	ld [hl], a
	cp $2
	jp c, Func_511b8
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_511b8: ; 511b8 (14:51b8)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld hl, sp+$1
	add [hl]
	cp $2
	jp c, Func_511cd
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_511cd: ; 511cd (14:51cd)
	set_farcall_addrs_hli Func_6ab29
	ld a, $64
	call FarCall
	ld e, a
	cp $2
	jp c, Func_511ea
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_511ea: ; 511ea (14:51ea)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld hl, sp+$1
	add [hl]
	add e
	cp $2
	jp c, Func_51200
	ld hl, sp+$0
	ld [hl], $1
	jp Func_51239

Func_51200: ; 51200 (14:5200)
	ld hl, sp+$6
	ld a, [hl]
	cp $ff
	jp z, Func_51224
	call GetHLAtSPPlus6
	ld a, [hl]
	cp $64
	jp z, Func_51220
	cp $50
	jp z, Func_51220
	cp $41
	jp z, Func_51220
	cp $f
	jp nz, Func_51224
Func_51220: ; 51220 (14:5220)
	ld hl, sp+$0
	ld [hl], $1
Func_51224: ; 51224 (14:5224)
	jp Func_5122b

Func_51227: ; 51227 (14:5227)
	ld hl, sp+$0
	ld [hl], $1
Func_5122b: ; 5122b (14:522b)
	jp Func_51232

Func_5122e: ; 5122e (14:522e)
	ld hl, sp+$0
	ld [hl], $1
Func_51232: ; 51232 (14:5232)
	jp Func_51239

Func_51235: ; 51235 (14:5235)
	ld hl, sp+$0
	ld [hl], $1
Func_51239: ; 51239 (14:5239)
	ld hl, sp+$6
	ld a, [hl]
	cp $ff
	jp z, Func_51252
	set_farcall_addrs_hli free
	call GetHLAtSPPlus6
	call FarCall
Func_51252: ; 51252 (14:5252)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Pointers_5125a: ; 5125a
	dw Data_5125e
	dw $0

Data_5125e: ; 5125e
	dstr "(その)ロホﾞホﾟン(は はけん されているよ)"

Pointers_51277: ; 51277
	dw Data_5127b
	dw $0

Data_5127b: ; 5127b
	dstr "ハﾟーティー(かﾞ いっはﾟいたﾞよ)"

Pointers_5128f: ; 5128f
	dw Data_51293
	dw $0

Data_51293: ; 51293
	dstr "(こうかんしたよ)"

Pointers_5129d: ; 5129d
	dw Data_512a1
	dw $0

Data_512a1: ; 512a1
	dstr "(ひきたﾞしたよ)"

Pointers_512ab: ; 512ab
	dw Data_512b1
	dw Data_512c4
	dw $0

Data_512b1: ; 512b1
	dstr "(たたかえる) ロホﾞホﾟン(かﾞ)"

Data_512c4: ; 512c4
	dstr "(いなくなるよ)"

Pointers_512cd: ; 512cd
	dw Data_512d1
	dw $0

Data_512d1: ; 512d1
	dstr "(そいつは えらへﾞないよ)!"

Func_512e1: ; 512e1 (14:52e1)
	push af
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	pop hl
	pop af
	push hl
	cp $5
	jp z, Func_5137a
	cp $4
	jp z, Func_5136c
	cp $3
	jp z, Func_5135e
	cp $2
	jp z, Func_51350
	cp $1
	jp z, Func_51342
	or a
	jp nz, Func_51385
	ld c, BANK(Pointers_5125a)
	ld de, Pointers_5125a
	ld hl, $10e
	call FarCall
	jp Func_51385

Func_51342: ; 51342 (14:5342)
	ld c, BANK(Pointers_51277)
	ld de, Pointers_51277
	ld hl, $10e
	call FarCall
	jp Func_51385

Func_51350: ; 51350 (14:5350)
	ld c, BANK(Pointers_5128f)
	ld de, Pointers_5128f
	ld hl, $10e
	call FarCall
	jp Func_51385

Func_5135e: ; 5135e (14:535e)
	ld c, BANK(Pointers_5129d)
	ld de, Pointers_5129d
	ld hl, $10e
	call FarCall
	jp Func_51385

Func_5136c: ; 5136c (14:536c)
	ld c, BANK(Pointers_512ab)
	ld de, Pointers_512ab
	ld hl, $10e
	call FarCall
	jp Func_51385

Func_5137a: ; 5137a (14:537a)
	ld c, BANK(Pointers_512cd)
	ld de, Pointers_512cd
	ld hl, $10e
	call FarCall
Func_51385: ; 51385 (14:5385)
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_513a2:: ; 513a2
	push bc
	push bc
	push bc
	push bc
	push hl
	call WriteHLToSPPlus10
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$3
	ld [hl], a
	pop hl
	call Func_524b6
	cp $ff
	jp nz, Func_513d2
	ld hl, $8000
	jp Func_516c3

Func_513d2: ; 513d2 (14:53d2)
	ld hl, sp+$0
	ld [hl], $0
Func_513d6: ; 513d6 (14:53d6)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_51433
	ld hl, sp+$0
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
	jp nz, Func_51429
	ld c, $0
Func_513fa: ; 513fa (14:53fa)
	ld a, c
	cp $4
	jp nc, Func_51429
	ld hl, sp+$0
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
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	cp [hl]
	jp nz, Func_51425
	xor a
	call Func_512e1
	ld hl, $4000
	jp Func_516c3

Func_51425: ; 51425 (14:5425)
	inc c
	jp Func_513fa

Func_51429: ; 51429 (14:5429)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_513d6

Func_51433: ; 51433 (14:5433)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$2
	ld [hl], $0
Func_5144b: ; 5144b (14:544b)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_514ae
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld [hl], $ff
	ld hl, sp+$2
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_514a4
	ld hl, sp+$2
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_514a4
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld [hl], $1
Func_514a4: ; 514a4 (14:54a4)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_5144b

Func_514ae: ; 514ae (14:54ae)
	pop af
	call GetSRAMBank
	call Func_50d27
	cp $4
	jp nz, Func_5167d
	ld a, $1
	call Func_512e1
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	ld de, Data_516c8
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_516dc
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	ld c, l
	ld b, h
	pop hl
	push bc
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	pop hl
	pop bc
	ld a, c
	or b
	jp z, Func_5153f
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, $4000
	jp Func_516c3

Func_5153f: ; 5153f (14:553f)
	push hl
	set_farcall_addrs_hli malloc
	ld hl, $168
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	set_farcall_addrs_hli DisplayPartyMenu_
	xor a
	call FarCall
	ld c, l
	ld b, h
	push bc
	call Func_1fbe
	pop bc
	pop hl
	push bc
	push hl
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli free
	pop bc
	pop hl
	push bc
	call FarCall
	pop bc
	ld a, c
	and b
	inc a
	jp nz, Func_515ae
	ld hl, $4000
	jp Func_516c3

Func_515ae: ; 515ae (14:55ae)
	ld hl, sp+$1
	ld e, [hl]
	ld a, [wc2e9]
	call Func_50f58
	cp $ff
	jp nz, Func_515c7
	ld a, $5
	call Func_512e1
	ld hl, $4000
	jp Func_516c3

Func_515c7: ; 515c7 (14:55c7)
	ld bc, $4000
	ld hl, sp+$0
	ld [hl], $0
Func_515ce: ; 515ce (14:55ce)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_515fd
	ld a, [wc2e9]
	ld hl, sp+$0
	cp [hl]
	jp z, Func_515f3
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_515f3
	ld bc, $8000
	jp Func_515fd

Func_515f3: ; 515f3 (14:55f3)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_515ce

Func_515fd: ; 515fd (14:55fd)
	ld a, b
	sub $40
	or c
	jp nz, Func_5165b
	push bc
	set_farcall_addrs_hli malloc
	ld hl, $23
	call FarCall
	reg16swap de, hl
	push de
	set_farcall_addrs_hli Func_7dfc
	pop de
	push de
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	pop de
	pop bc
	push de
	ld hl, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_51644
	ld bc, $8000
Func_51644: ; 51644 (14:5644)
	push bc
	set_farcall_addrs_hli free
	pop bc
	pop de
	push bc
	reg16swap de, hl
	call FarCall
	pop bc
Func_5165b: ; 5165b (14:565b)
	push bc
	ld a, b
	sub $80
	or c
	jp nz, Func_51674
	ld hl, sp+$3
	ld e, [hl]
	ld a, [wc2e9]
	call Func_516e6
	ld a, $2
	call Func_512e1
	jp Func_51679

Func_51674: ; 51674 (14:5674)
	ld a, $4
	call Func_512e1
Func_51679: ; 51679 (14:5679)
	pop hl
	jp Func_516c3

Func_5167d: ; 5167d (14:567d)
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $3
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	ld a, $3
	call Func_512e1
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	ld hl, $8000
Func_516c3: ; 516c3 (14:56c3)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_516c8: ; 516c8
	dstr "ハﾟーティー(の) ロホﾞホﾟン(と)"

Data_516dc: ; 516dc
	dstr "(こうかんする)?"

Func_516e6: ; 516e6 (14:56e6)
	add sp, -$46
	push af
	push de
	set_farcall_addrs_hli Func_7dfc
	pop de
	push de
	ld a, e
	ld hl, sp+$27
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli GetRobotInParty
	pop de
	pop af
	push af
	push de
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli Func_7db0
	pop de
	ld a, e
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli StackGetRobotInParty
	pop af
	ld hl, sp+$23
	reg16swap de, hl
	call FarCall
	add sp, $46
	ret

Pointers_51747: ; 51747
	dw Data_5174b
	dw $0

Data_5174b: ; 5174b
	dstr "(を ひきたﾞしました)"

Pointers_51758: ; 51758
	dw Data_5175e
	dw Data_51772
	dw $0

Data_5175e: ; 5175e
	dstr "(これいしﾞょう) ハﾟーティー(に)"

Data_51772: ; 51772
	dstr "(ついかてﾞきないよ)"

Pointers_5177e: ; 5177e
	dw Data_51782
	dw $0

Data_51782: ; 51782
	dstr "(を すてた)"

Func_5178a: ; 5178a
	push hl
	add sp, -$38
	xor a
	read_hl_from_sp_plus $3a
	ld de, $d
	add hl, de
	ld e, [hl]
	push de
	ld hl, sp+$2
	ld [hl], $0
	read_hl_from_sp_plus $3c
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $3c
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	push hl
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	set_farcall_addrs_hli Func_7dfc
	pop bc
	pop hl
	push bc
	push hl
	ld a, l
	ld hl, sp+$1b
	reg16swap de, hl
	call FarCall
	ld bc, $6
	ld hl, sp+$1c
	reg16swap de, hl
	ld hl, sp+$7
	call CopyFromDEtoHL
	set_farcall_addrs_hli TryGiveRobot
	pop hl
	pop bc
	pop de
	push bc
	push de
	ld a, e
	cp $15
	jp nz, Func_51819
	ld a, l
	ld e, $4
	ld c, $0
	call FarCall
	jp Func_51821

Func_51819: ; 51819 (14:5819)
	ld a, l
	ld e, $3
	ld c, $0
	call FarCall
Func_51821: ; 51821 (14:5821)
	cp $1
	jp nz, Func_5182a
	ld hl, sp+$4
	ld [hl], $1
Func_5182a: ; 5182a (14:582a)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	pop de
	ld hl, sp+$2
	ld a, [hl]
	cp $1
	jp nz, Func_518c7
	push de
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$5
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	pop de
	ld a, e
	cp $15
	jp nz, Func_51882
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5177e)
	ld de, Pointers_5177e
	ld hl, $110
	call FarCall
	jp Func_51898

Func_51882: ; 51882 (14:5882)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51747)
	ld de, Pointers_51747
	ld hl, $110
	call FarCall
Func_51898: ; 51898 (14:5898)
	read_hl_from_sp_plus $3c
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $3c
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $3c
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	jp Func_518e3

Func_518c7: ; 518c7 (14:58c7)
	ld a, e
	cp $15
	jp nz, Func_518e3
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51758)
	ld de, Pointers_51758
	ld hl, $10e
	call FarCall
Func_518e3: ; 518e3 (14:58e3)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	push bc
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	add sp, $3a
	ret

Func_5190c:: ; 5190c (14:590c)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_50148)
	ld de, Data_50148
	ld hl, Data_500e7
	call FarCall
	ret

Func_51923: ; 51923
	ld c, l
	ld b, h
	push bc
	callba_hli Func_17488
	call Func_2097
	set_farcall_addrs_hli OverworldLoop
	pop bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	inc hl
	inc hl
	ld c, l
	ld e, $0
	xor a
	call FarCall
	ld hl, -1
	ret

Func_51961: ; 51961
	ld a, $7
	ld [wc790], a
	ret

Data_51967: ; 51967
	db $1
	db $1f
	db $3c
	db $6b
	db $73
	db $86
	db $80
	db $81
	db $82
	db $83
	db $84
	db $85
	db $59
	db $63

Func_51975: ; 51975
	ld a, $6
	ld [wc790], a
	ld a, $b
	ld [wc78c], a
	xor a
.loop
	cp $e
	jp nc, .done
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51967
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp .loop

.done
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $1
	ld a, $12
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $4
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $5
	call FarCall
	ret

Data_519dc: ; 519dc
	db $8
	db $15
	db $20
	db $28
	db $29
	db $2a
	db $2b
	db $2c
	db $36
	db $37
	db $39
	db $47
	db $88
	db $8d

Func_519ea: ; 519ea
	ld a, $5
	ld [wc790], a
	xor a
.loop
	cp $e
	jp nc, .done
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_519dc
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp .loop

.done
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $1
	ld a, $13
	call FarCall
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $0
	ld e, $1
	ld a, $3
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $6
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $7
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $8
	call FarCall
	ret

Data_51a70: ; 51a70
	db $21
	db $3b
	db $3d
	db $3e
	db $3f
	db $40
	db $41
	db $95
	db $9a
	db $9f
	db $a4
	db $a9
	db $aa
	db $ab
	db $ac
	db $ad
	db $ae

Func_51a81: ; 51a81
	ld a, $4
	ld [wc790], a
	ld a, $7
	ld [wc78d], a
	xor a
.loop
	cp $11
	jp nc, .done
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51a70
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp .loop

.done
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $0
	ld e, $1
	ld a, $4
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $9
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $10
	call FarCall
	ret

Data_51ae8: ; 51ae8
	db $44
	db $22
	db $46
	db $c2

Data_51aec: ; 51aec
	db $2a
	db $22
	db $5

Func_51aef: ; 51aef
	ld a, $1
	ld [wc78d], a
	ld a, $3
	ld [wc790], a
	xor a
.loop
	cp $4
	jp nc, .done
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51ae8
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp .loop

.done
	xor a
.loop2
	cp $3
	jp nc, .done2
	push af
	set_farcall_addrs_hli AdjustItemQuantity
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51aec
	add hl, de
	ld a, [hl]
	ld e, $1
	ld c, $2
	call FarCall
	pop af
	inc a
	jp .loop2

.done2
	set_farcall_addrs_hli UnlockArea
	ld a, $a
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $b
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $11
	call FarCall
	ret

Data_51b7a: ; 51b7a
	db $1b, $1c, $33, $34, $35, $c3, $f1

Func_51b81: ; 51b81
	ld a, $2
	ld [wc790], a
	xor a
_51b87: ; 51b87 (14:5b87)
	cp $7
	jp nc, _51bae
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51b7a
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp _51b87

_51bae: ; 51bae (14:5bae)
	set_farcall_addrs_hli UnlockArea
	ld a, $c
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $e
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $f
	call FarCall
	ret

Data_51bdf: ; 51bdf
	db $02, $03, $04, $05, $06, $07, $09, $0a, $0b, $0c, $0d, $0e, $0f, $14, $1e, $32

Data_51bef: ; 51bef
	db $08, $09, $0a, $16

Func_51bf3:: ; 51bf3 (14:5bf3)
	push af
	ld a, $1
	ld [wSaveBlock1], a
	xor a
	ld [wSaveBlock1 + 1], a
	ld a, BANK(DebugSaveState)
	ld [wFarCallDestBank], a
	ld bc, DebugSaveState_end-DebugSaveState
	ld de, DebugSaveState
	ld hl, wSaveScratch
	call FarCopyVideoData
	xor a
Func_51c0f: ; 51c0f (14:5c0f)
	cp $a9
	jp nc, Func_51c2f
	push af
	set_farcall_addrs_hli TryGiveRobot
	pop af
	push af
	inc a
	ld e, $5
	ld c, $62
	call FarCall
	pop af
	inc a
	jp Func_51c0f

Func_51c2f: ; 51c2f (14:5c2f)
	xor a
Func_51c30: ; 51c30 (14:5c30)
	cp $80
	jp nc, Func_51c4d
	push af
	set_farcall_addrs_hli Func_4ed70
	pop af
	push af
	ld e, $2
	call FarCall
	pop af
	inc a
	jp Func_51c30

Func_51c4d: ; 51c4d (14:5c4d)
	xor a
Func_51c4e: ; 51c4e (14:5c4e)
	cp $5c
	jp nc, Func_51c6b
	push af
	set_farcall_addrs_hli Func_4ed70
	pop af
	push af
	ld e, $2
	call FarCall
	pop af
	inc a
	jp Func_51c4e

Func_51c6b: ; 51c6b (14:5c6b)
	xor a
Func_51c6c: ; 51c6c (14:5c6c)
	cp $fa
	jp nc, Func_51c90
	push af
	set_farcall_addrs_hli Func_4ec2b
	pop af
	push af
	inc a
	ld b, $2d
	call DivideAbyB
	ld a, b
	ld e, $2
	call FarCall
	pop af
	inc a
	jp Func_51c6c

Func_51c90: ; 51c90 (14:5c90)
	xor a
Func_51c91: ; 51c91 (14:5c91)
	cp $10
	jp nc, Func_51cb8
	push af
	set_farcall_addrs_hli EventFlagAction
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51bdf
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, $1
	call FarCall
	pop af
	inc a
	jp Func_51c91

Func_51cb8: ; 51cb8 (14:5cb8)
	ld a, $1
Func_51cba: ; 51cba (14:5cba)
	cp $4
	jp nc, Func_51cd5
	push af
	set_farcall_addrs_hli UnlockArea
	pop af
	push af
	call FarCall
	pop af
	inc a
	jp Func_51cba

Func_51cd5: ; 51cd5 (14:5cd5)
	set_farcall_addrs_hli UnlockArea
	ld a, $d
	call FarCall
	set_farcall_addrs_hli UnlockArea
	ld a, $12
	call FarCall
	ld a, $4b
Func_51cf7: ; 51cf7 (14:5cf7)
	cp $4e
	jp nc, Func_51d16
	push af
	set_farcall_addrs_hli AdjustItemQuantity
	pop af
	push af
	ld e, $32
	ld c, $0
	call FarCall
	pop af
	inc a
	jp Func_51cf7

Func_51d16: ; 51d16 (14:5d16)
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $0
	ld e, $32
	ld a, $31
	call FarCall
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $0
	ld e, $32
	ld a, $35
	call FarCall
	xor a
Func_51d3f: ; 51d3f (14:5d3f)
	cp $4
	jp nc, Func_51d66
	push af
	set_farcall_addrs_hli AdjustItemQuantity
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, Data_51bef
	add hl, de
	ld a, [hl]
	ld e, $1
	ld c, $2
	call FarCall
	pop af
	inc a
	jp Func_51d3f

Func_51d66: ; 51d66 (14:5d66)
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $32
	ld a, $4a
	call FarCall
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $32
	ld a, $3a
	call FarCall
	ld a, $3b
Func_51d90: ; 51d90 (14:5d90)
	cp $4a
	jp nc, Func_51daf
	push af
	set_farcall_addrs_hli AdjustItemQuantity
	pop af
	push af
	ld e, $32
	ld c, $2
	call FarCall
	pop af
	inc a
	jp Func_51d90

Func_51daf: ; 51daf (14:5daf)
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $63
	ld a, $4c
	call FarCall
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $2
	ld e, $32
	ld a, $4e
	call FarCall
	push hl
	push hl
	push_long 999995
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	pop af
	cp $7
	jp z, Func_51e43
	cp $6
	jp z, Func_51e31
	cp $5
	jp z, Func_51e22
	cp $4
	jp z, Func_51e16
	cp $3
	jp z, Func_51e0d
	cp $2
	jp nz, Func_51e55
	call Func_51961
	jp Func_51e55

Func_51e0d: ; 51e0d (14:5e0d)
	call Func_51961
	call Func_51975
	jp Func_51e55

Func_51e16: ; 51e16 (14:5e16)
	call Func_51961
	call Func_51975
	call Func_519ea
	jp Func_51e55

Func_51e22: ; 51e22 (14:5e22)
	call Func_51961
	call Func_51975
	call Func_519ea
	call Func_51a81
	jp Func_51e55

Func_51e31: ; 51e31 (14:5e31)
	call Func_51961
	call Func_51975
	call Func_519ea
	call Func_51a81
	call Func_51aef
	jp Func_51e55

Func_51e43: ; 51e43 (14:5e43)
	call Func_51961
	call Func_51975
	call Func_519ea
	call Func_51a81
	call Func_51aef
	call Func_51b81
Func_51e55: ; 51e55 (14:5e55)
	ret

Pointers_51e56: ; 51e56
	dw Data_51e5a
	dw $0

Data_51e5a: ; 51e5a
	dstr "(これいしﾞょう ほかんてﾞきないよ)"

Pointers_51e6e: ; 51e6e
	dw Data_51e72
	dw $0

Data_51e72: ; 51e72
	dstr "(これいしﾞょう ひきたﾞせないよ)"

Pointers_51e85: ; 51e85
	dw Data_51e89
	dw $0

Data_51e89: ; 51e89
	dstr "(を ほかんしたよ)"

Pointers_51e94: ; 51e94
	dw Data_51e98
	dw $0

Data_51e98: ; 51e98
	dstr "(を ひきたﾞしたよ)"

Func_51ea4:: ; 51ea4
	push hl
	add sp, -$1c
	ld hl, sp+$1c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	push hl
	ld hl, -1
	write_hl_to_sp_plus $21
	pop hl
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $21
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $21
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	push bc
	read_hl_from_sp_plus $23
	ld de, $d
	add hl, de
	ld a, [hl]
	push af
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $21
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	pop af
	pop bc
	pop hl
	pop de
	cp $e
	jp z, Func_5200b
	cp $d
	jp nz, Func_520ef
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop bc
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	call GetSRAMBank
	ld e, $1
	ld hl, sp+$2
	ld a, [hl]
	call Func_50da3
	or a
	jp z, Func_51fa4
	cp $63
	jp nz, Func_51fee
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51e56)
	ld de, Pointers_51e56
	ld hl, $10e
	call FarCall
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $19
	call FarCall
	read_hl_from_sp_plus $1b
	jp Func_522ac

Func_51fa4: ; 51fa4 (14:5fa4)
	ld e, $3
	ld a, $ff
	call Func_50da3
	cp $50
	jp nz, Func_51fee
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51e56)
	ld de, Pointers_51e56
	ld hl, $10e
	call FarCall
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $19
	call FarCall
	read_hl_from_sp_plus $1b
	jp Func_522ac

Func_51fee: ; 51fee (14:5fee)
	ld e, $1
	ld hl, sp+$2
	ld a, [hl]
	call Func_50da3
	ld l, a
	push hl
	ld de, Data_522b7
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld hl, sp+$2
	ld [hl], $2
	ld e, $1
	pop hl
	jp Func_520ef

Func_5200b: ; 5200b (14:600b)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	call GetSRAMBank
	ld e, $0
	ld hl, sp+$2
	ld a, [hl]
	call Func_50da3
	or a
	jp z, Func_5208b
	cp $63
	jp nz, Func_520d5
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51e6e)
	ld de, Pointers_51e6e
	ld hl, $10e
	call FarCall
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $19
	call FarCall
	read_hl_from_sp_plus $1b
	jp Func_522ac

Func_5208b: ; 5208b (14:608b)
	ld e, $2
	ld a, $ff
	call Func_50da3
	cp $14
	jp nz, Func_520d5
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_51e6e)
	ld de, Pointers_51e6e
	ld hl, $10e
	call FarCall
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $19
	call FarCall
	read_hl_from_sp_plus $1b
	jp Func_522ac

Func_520d5: ; 520d5 (14:60d5)
	ld e, $0
	ld hl, sp+$2
	ld a, [hl]
	call Func_50da3
	ld l, a
	push hl
	ld de, Data_522c4
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld hl, sp+$2
	ld [hl], $0
	ld e, $3
	pop hl
Func_520ef: ; 520ef (14:60ef)
	push de
	push hl
	ld de, Data_522d1
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_14db8
	read_hl_from_sp_plus $21
	call FarCall
	pop hl
	pop de
	ld a, [wc2f6]
	cp $ff
	jp z, Func_52126
	or a
	jp nz, Func_52130
Func_52126: ; 52126 (14:6126)
	ld hl, $4000
	write_hl_to_sp_plus $1b
	jp Func_52287

Func_52130: ; 52130 (14:6130)
	ld a, [wc2f6]
	add l
	cp $64
	jp c, Func_52179
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_52164
	ld c, BANK(Pointers_51e56)
	ld de, Pointers_51e56
	ld hl, $10e
	call FarCall
	jp Func_5216f

Func_52164: ; 52164 (14:6164)
	ld c, BANK(Pointers_51e6e)
	ld de, Pointers_51e6e
	ld hl, $10e
	call FarCall
Func_5216f: ; 5216f (14:616f)
	ld hl, $4000
	write_hl_to_sp_plus $1b
	jp Func_52287

Func_52179: ; 52179 (14:6179)
	push de
	set_farcall_addrs_hli AdjustItemQuantity
	ld hl, sp+$2
	ld c, [hl]
	ld a, [wc2f6]
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli AdjustItemQuantity
	pop de
	ld c, e
	ld a, [wc2f6]
	ld e, a
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_521c7
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	jp Func_521da

Func_521c7: ; 521c7 (14:61c7)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
Func_521da: ; 521da (14:61da)
	push af
	set_farcall_addrs_hli GetName
	ld c, $a
	ld hl, sp+$5
	push hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $3ff
	add hl, de
	pop de
	call FarCall
	pop af
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	ld hl, wc2f6
	sub [hl]
	jp nz, Func_52217
	read_hl_from_sp_plus $1d
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_52217: ; 52217 (14:6217)
	read_hl_from_sp_plus $1d
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $1d
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$3
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli PrintMapText_
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_52275
	ld c, BANK(Pointers_51e85)
	ld de, Pointers_51e85
	ld hl, $110
	call FarCall
	jp Func_52280

Func_52275: ; 52275 (14:6275)
	ld c, BANK(Pointers_51e94)
	ld de, Pointers_51e94
	ld hl, $110
	call FarCall
Func_52280: ; 52280 (14:6280)
	ld hl, $8000
	write_hl_to_sp_plus $1b
Func_52287: ; 52287 (14:6287)
	read_hl_from_sp_plus $19
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $19
	call FarCall
	read_hl_from_sp_plus $1b
Func_522ac: ; 522ac (14:62ac)
	reg16swap de, hl
	add sp, $1e
	reg16swap de, hl
	ret

Data_522b7: ; 522b7
	dstr "(ほかんする こすうを)"

Data_522c4: ; 522c4
	dstr "(ひきたﾞす こすうを)"

Data_522d1: ; 522d1
	dstr "(にゅうりょくしてくたﾞさい)"

Pointers_522e1: ; 522e1
	dw Data_522e7
	dw Data_522fa
	dw $0

Data_522e7: ; 522e7
	dstr "(もちものかﾞ いっはﾟいなのてﾞ)"

Data_522fa: ; 522fa
	dstr "(ひきたﾞせないよ)"

Pointers_52305: ; 52305
	dw Data_5230b
	dw Data_5231a
	dw $0

Data_5230b: ; 5230b
	dstr "(これいしﾞょう そうこに)"

Data_5231a: ; 5231a
	dstr "(ついかてﾞきないよ)"

Func_52326:: ; 52326
	push bc
	push af
	ld hl, sp+$2
	ld [hl], $0
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop hl
	pop af
	push hl
	cp $b
	jp z, Func_52395
	cp $9
	jp nz, Func_523c5
	ld e, $3
	ld a, $ff
	call Func_50ec6
	cp $dc
	jp nz, Func_52392
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_52305)
	ld de, Pointers_52305
	ld hl, $10e
	call FarCall
	ld hl, sp+$2
	ld [hl], $ff
Func_52392: ; 52392 (14:6392)
	jp Func_523c5

Func_52395: ; 52395 (14:6395)
	ld e, $2
	ld a, $ff
	call Func_50ec6
	cp $14
	jp nz, Func_523c5
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_522e1)
	ld de, Pointers_522e1
	ld hl, $10e
	call FarCall
	ld hl, sp+$2
	ld [hl], $ff
Func_523c5: ; 523c5 (14:63c5)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_523f2:: ; 523f2
	push bc
	push bc
	ld c, l
	ld b, h
	push bc
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, $9
	add hl, bc
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld c, [hl]
	push bc
	ld hl, sp+$6
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop bc
	call GetHLAtSPPlus4
	push hl
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_52447
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	call WriteHLToSPPlus4
Func_52447: ; 52447 (14:6447)
	pop bc
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_16777
	pop hl
	call FarCall
	pop bc
	pop bc
	ret

Func_52475:: ; 52475
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $9
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	inc d
	dec d
	bit 7, d
	jr z, .asm_52492
	ld de, $0
.asm_52492
	push bc
	ld hl, $5
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_16777
	pop hl
	call FarCall
	ret

Func_524b6:: ; 524b6 (14:64b6)
	push hl
	ld hl, -$94
	add hl, sp
	ld sp, hl
	ld hl, $94
	add hl, sp
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $95
	read_hl_from_sp_plus $95
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $95
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$c
	ld [hl], a
	read_hl_from_sp_plus $95
	ld de, $d
	add hl, de
	ld l, [hl]
	push hl
	set_farcall_addrs_hli malloc
	set_farcall_addrs_hli malloc
	ld hl, $168
	call FarCall
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $15
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	call FillVisibleAreaWithBlankTile
	call Func_1f30
	ld c, $8
	ld e, $c
	ld hl, $802
	call Func_50185
	ld c, $6
	ld e, $b
	ld hl, $c
	call Func_50185
	ld c, $8
	ld e, $9
	ld hl, $b0a
	call Func_50185
	set_farcall_addrs_hli Func_7dfc
	ld hl, sp+$72
	reg16swap de, hl
	ld hl, sp+$e
	ld a, [hl]
	call FarCall
	ld bc, $6
	ld hl, sp+$73
	reg16swap de, hl
	ld hl, sp+$17
	call CopyFromDEtoHL
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$17
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	ld hl, sp+$17
	call FindFirstNonzero
	ld a, l
	sub $4
	or h
	jp nz, Func_52591
	ld hl, Data_52abf
	push hl
	call PlaceString
	pop bc
Func_52591: ; 52591 (14:6591)
	read_hl_from_sp_plus $91
	ld a, l
	push af
	ld hl, sp+$74
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$45
	call GetRobotOrTrainerBaseStats
	read_hl_from_sp_plus $4a
	push hl
	ld hl, sp+$4c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Text_66ea7
	add hl, de
	write_hl_to_sp_plus $15
	ld c, BANK(Text_66ea7)
	read_hl_from_sp_plus $15
	reg16swap de, hl
	ld hl, sp+$1b
	call FarCopyUntilNull
	ld hl, Data_52ac1
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$7d
	ld c, [hl]
	ld b, $0
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, Data_52ac5
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$1b
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	read_hl_from_sp_plus $98
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, TypeNames - 5
	add hl, de
	write_hl_to_sp_plus $15
	ld c, BANK(TypeNames)
	read_hl_from_sp_plus $15
	reg16swap de, hl
	ld hl, sp+$1b
	call FarCopyUntilNull
	ld de, Data_52ac7
	ld hl, $903
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$1b
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld a, $19
	ld [wFarCallDestBank], a
	ld hl, $98
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $3ff9
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1b
	call LiteralStringInTree
	ld e, $5
	ld a, $9
	call SetStringStartState
	ld hl, sp+$1b
	push hl
	ld hl, Data_52acd
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, $81
	add hl, sp
	ld a, [hl]
	ld e, a
	ld hl, sp+$2f
	call Func_241f
	ld hl, sp+$3f
	ld a, [hl]
	push af
	ld hl, sp+$42
	ld c, [hl]
	push bc
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$12
	ld [hl], a
	ld hl, sp+$7a
	ld a, [hl]
	cp $ab
	jp c, Func_5276c
	ld hl, sp+$7a
	ld a, [hl]
	cp $af
	jp nc, Func_5276c
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	write_hl_to_sp_plus $1f
	set_farcall_addrs_hli Func_7e8a
	read_hl_from_sp_plus $1f
	reg16swap de, hl
	ld hl, sp+$7a
	ld a, [hl]
	add $55
	call FarCall
	read_hl_from_sp_plus $1f
	inc hl
	write_hl_to_sp_plus $1b
	ld bc, $0
	ld hl, sp+$15
	ld [hl], $0
Func_526e4: ; 526e4 (14:66e4)
	ld hl, sp+$15
	ld a, [hl]
	cp $40
	jp nc, Func_5270e
	read_hl_from_sp_plus $1b
	ld a, [hl]
	or a
	jp nz, Func_526fb
	ld hl, $10
	add hl, bc
	ld c, l
	ld b, h
Func_526fb: ; 526fb (14:66fb)
	ld hl, sp+$15
	ld a, [hl]
	inc a
	ld hl, sp+$15
	ld [hl], a
	read_hl_from_sp_plus $1b
	inc hl
	write_hl_to_sp_plus $1b
	jp Func_526e4

Func_5270e: ; 5270e (14:670e)
	push bc
	set_farcall_addrs_hli FixAndLoadPoncotPicWithTilemap
	pop bc
	read_hl_from_sp_plus $1f
	ld de, $41
	add hl, de
	reg16swap de, hl
	ld hl, $89b0
	call FarCall
	call WaitVideoTransfer
	read_hl_from_sp_plus $1f
	ld e, [hl]
	ld hl, sp+$14
	ld [hl], e
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from_sp_plus $1f
	inc hl
	reg16swap de, hl
	ld hl, $2
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $1f
	call FarCall
	jp Func_527db

Func_5276c: ; 5276c (14:676c)
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	write_hl_to_sp_plus $1f
	ld bc, $89b0
	read_hl_from_sp_plus $1f
	reg16swap de, hl
	ld hl, sp+$7a
	ld a, [hl]
	dec a
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from_sp_plus $1f
	reg16swap de, hl
	ld hl, $2
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $1f
	call FarCall
	set_farcall_addrs_hli Func_615be
	ld hl, sp+$7a
	ld a, [hl]
	dec a
	call FarCall
	ld hl, sp+$14
	ld [hl], a
Func_527db: ; 527db (14:67db)
	set_farcall_addrs_hli Func_613fc
	ld e, $1
	ld hl, sp+$14
	ld a, [hl]
	call FarCall
	callba_hli Func_55723
	call Func_1fbe
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_57cf7
	read_hl_from_sp_plus $8a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $88
	reg16swap de, hl
	ld hl, $10d
	call FarCall
	read_hl_from_sp_plus $8e
	ld c, l
	ld b, h
	read_hl_from_sp_plus $8c
	reg16swap de, hl
	ld hl, $10f
	call FarCall
	ld de, Data_52ad4
	ld hl, $10f
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $88
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $20e
	call Func_2230
	ld hl, Data_52ad6
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $8a
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	read_hl_from_sp_plus $8c
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $210
	call Func_2230
	ld hl, Data_52ad8
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $8e
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	pop bc
	pop af
	push bc
	read_hl_from_sp_plus $91
	ld e, a
	ld d, $0
	add hl, de
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_528a5
	ld de, 999
Func_528a5: ; 528a5 (14:68a5)
	push de
	ld de, Data_52ada
	ld hl, $c0b
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100c
	call Func_2230
	pop bc
	read_hl_from_sp_plus $91
	ld e, c
	ld d, $0
	add hl, de
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_528d2
	ld de, 999
Func_528d2: ; 528d2 (14:68d2)
	push de
	ld de, Data_52ae2
	ld hl, $c0d
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100e
	call Func_2230
	ld hl, sp+$e
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $93
	add hl, bc
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_52900
	ld de, 999
Func_52900: ; 52900 (14:6900)
	push de
	ld de, Data_52aeb
	ld hl, $c0f
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $1010
	call Func_2230
	ld hl, sp+$4c
	ld a, [hl]
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, sp+$7d
	ld l, [hl]
	ld h, a
	call Func_270a
	reg16swap de, hl
	ld hl, sp+$7d
	ld a, [hl]
	cp $63
	jp nz, Func_52940
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$a
	call PutLongFromStackToHL
	jp Func_5295a

Func_52940: ; 52940 (14:6940)
	reg16swap de, hl
	ld bc, $0
	push bc
	push hl
	read_hl_from_sp_plus $90
	ld bc, $0
	push bc
	push hl
	call SubtractLongsFromStack
	ld hl, sp+$a
	call PutLongFromStackToHL
Func_5295a: ; 5295a (14:695a)
	ld e, $6
	ld a, $9
	call SetStringStartState
	ld hl, sp+$a
	call PutLongFromHLOnStack
	read_hl_from_sp_plus $90
	ld bc, $0
	push bc
	push hl
	call AddLongsFromStack
	ld hl, Data_52af3
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $8
	ld a, $b
	call SetStringStartState
	ld hl, sp+$6
	call PutLongFromHLOnStack
	ld hl, Data_52afb
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	pop af
	inc l
	dec l
	jp nz, Func_529a5
	ld de, Data_52b02
	ld hl, $a
	call PlaceStringDEatCoordHL
	jp Func_529d7

Func_529a5: ; 529a5 (14:69a5)
	cp l
	jp nc, Func_529ce
	push af
	push hl
	ld de, Data_52b0b
	ld hl, $a
	call PlaceStringDEatCoordHL
	pop hl
	pop af
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	ld hl, Data_52b16
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_529d7

Func_529ce: ; 529ce (14:69ce)
	ld de, Data_52b19
	ld hl, $a
	call PlaceStringDEatCoordHL
Func_529d7: ; 529d7 (14:69d7)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$b
	ld [hl], $ff
	callba_hli WaitAorBButtonOverworld_17a44
	pop hl
	cp $10
	jp nz, Func_52a51
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	pop hl
	ld a, l
	cp $21
	jp nz, Func_52a25
	ld de, Data_52b21
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_52a2e

Func_52a25: ; 52a25 (14:6a25)
	ld de, Data_52b2e
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_52a2e: ; 52a2e (14:6a2e)
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
	jp nz, Func_52a51
	ld hl, sp+$9
	ld [hl], $0
Func_52a51: ; 52a51 (14:6a51)
	call FillVisibleAreaWithBlankTile
	check_cgb
	jp nz, Func_52a72
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_52a86

Func_52a72: ; 52a72 (14:6a72)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_52a86: ; 52a86 (14:6a86)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	read_hl_from_sp_plus $13
	ld c, l
	ld b, h
	ld de, $1412
	ld hl, $0
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $13
	call FarCall
	call Func_1f7b
	ld hl, sp+$9
	ld a, [hl]
	ld hl, $96
	add hl, sp
	ld sp, hl
	ret

Data_52abf:
	dstr " "

Data_52ac1:
	dstr ":LV"

Data_52ac5:
	dstr " "

Data_52ac7:
	dstr "タイフﾟ:"

Data_52acd:
	dstr "CPU:%s"

Data_52ad4:
	dstr "E"

Data_52ad6:
	dstr "/"

Data_52ad8:
	dstr "/"

Data_52ada:
	dstr "(こうけﾞき)"

Data_52ae2:
	dstr "(ほﾞうきﾞょ)"

Data_52aeb:
	dstr "(すはﾞやさ)"

Data_52af3:
	dstr "E*P:%ld"

Data_52afb:
	dstr "(あと)%d"

Data_52b02:
	dstr "(しんかしない)"

Data_52b0b:
	dstr "(しんかする あと)"

Data_52b16:
	dstr "%d"

Data_52b19:
	dstr "(ひかってる)"

Data_52b21:
	dstr "(さくしﾞょするかい)?"

Data_52b2e:
	dstr "(ひきたﾞすかい)?"

Func_52b39:
	reg16swap de, hl
	ld hl, $d
	add hl, de
	ld a, [hl]
	cp $12
	jp nz, Func_52b4b
	ld hl, $4000
	ret

Func_52b4b: ; 52b4b (14:6b4b)
	ld hl, -1
	ret

Func_52b4f::
	push bc
	push hl
	ld hl, $4000
	call WriteHLToSPPlus4
	pop bc
	ld a, [wc39b]
	cp $ff
	jp nz, Func_52b7d
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld [wc39b], a
	ld hl, $8000
	pop de
	push hl
	jp Func_52ba9

Func_52b7d: ; 52b7d (14:6b7d)
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [wc39b]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp z, Func_52ba9
	ld l, c
	ld h, b
	call Func_52bbb
	ld a, $ff
	ld [wc39b], a
	ld hl, $8000
	pop de
	push hl
Func_52ba9: ; 52ba9 (14:6ba9)
	pop hl
	push hl
	pop bc
	ret

Pointers_52bad:
	dw Data_52bb1
	dw $0

Data_52bb1:
	dstr "(こうかんしたよ)"

Func_52bbb: ; 52bbb (14:6bbb)
	push bc
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	push af
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop de
	pop af
	push de
	push hl
	cp $2
	jp z, Func_52cb2
	cp $1
	jp z, Func_52c85
	or a
	jp nz, Func_52cdc
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld c, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	push af
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld [hl], a
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld [hl], a
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wSaveScratchBagItems
	add hl, de
	ld [hl], c
	pop af
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wSaveScratchBagItemQuantities
	add hl, de
	ld [hl], a
	jp Func_52cdc

Func_52c85: ; 52c85 (14:6c85)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld c, [hl]
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wc98e
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld [hl], a
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wc98e
	add hl, de
	ld [hl], c
	jp Func_52cdc

Func_52cb2: ; 52cb2 (14:6cb2)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld c, [hl]
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wc9a3
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld [hl], a
	ld hl, wc39b
	ld l, [hl]
	ld h, $0
	ld de, wc9a3
	add hl, de
	ld [hl], c
Func_52cdc: ; 52cdc (14:6cdc)
	pop hl
	ld a, l
	call GetSRAMBank
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_52bad)
	ld de, Pointers_52bad
	ld hl, $10e
	call FarCall
	pop de
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop bc
	ret

Func_52d1f:: ; 52d1f (14:6d1f)
	callba_hli Func_17470
	call Func_1fbe
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_50176)
	ld de, Data_50176
	ld hl, Data_50157
	call FarCall
	call Func_2009
	callba_hli Func_17488
	ret

Func_52d58:: ; 52d58 (14:6d58)
	push hl
	ld bc, wSaveScratchParty
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	ld a, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	ld [hl], a
	ld e, $0
	xor a
Func_52d73: ; 52d73 (14:6d73)
	cp $4
	jp nc, Func_52daa
	push af
	ld a, [bc]
	cp $ae
	jp z, Func_52d8e
	cp $ad
	jp z, Func_52d8e
	cp $ac
	jp z, Func_52d8e
	cp $ab
	jp nz, Func_52d9f
Func_52d8e: ; 52d8e (14:6d8e)
	push de
	ld l, a
	ld h, $0
	ld de, -$ab
	add hl, de
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
Func_52d9f: ; 52d9f (14:6d9f)
	pop af
	inc a
	ld hl, $23
	add hl, bc
	ld c, l
	ld b, h
	jp Func_52d73

Func_52daa: ; 52daa (14:6daa)
	ldh a, [hSRAMBank]
	push af
	push de
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld bc, sWarehouse
	xor a
	pop de
Func_52db8: ; 52db8 (14:6db8)
	cp $aa
	jp nc, Func_52def
	push af
	ld a, [bc]
	cp $ae
	jp z, Func_52dd3
	cp $ad
	jp z, Func_52dd3
	cp $ac
	jp z, Func_52dd3
	cp $ab
	jp nz, Func_52de4
Func_52dd3: ; 52dd3 (14:6dd3)
	push de
	ld l, a
	ld h, $0
	ld de, -$ab
	add hl, de
	push hl
	call GetHLAtSPPlus10
	pop de
	add hl, de
	ld [hl], a
	pop de
	inc e
Func_52de4: ; 52de4 (14:6de4)
	pop af
	inc a
	ld hl, $1c
	add hl, bc
	ld c, l
	ld b, h
	jp Func_52db8

Func_52def: ; 52def (14:6def)
	pop af
	push de
	call GetSRAMBank
	pop de
	ld a, e
	pop bc
	ret

INCLUDE "engine/time_set.asm"
INCLUDE "engine/robodex/flags.asm"

Func_53b6e::
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
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpAttrMapRectangle
	set_farcall_addrs_hli Func_320d8
	ld a, $2
	call FarCall
	ld l, a
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	pop de
	push hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreAttrMapRectangle
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop hl
	ld a, l
	ret

Pointers_53c10:
	dw Data_53c14
	dw $0

Data_53c14:
	dstr "(とﾞうやら せいこうした みたいしﾞゃ)"

Pointers_53c2a:
	dw Data_53c30
	dw Data_53c3f
	dw $0

Data_53c30:
	dstr "リモコン(の しﾞゅしんに)"

Data_53c3f:
	dstr "(しっはﾟいしました)"

Pointers_53c4b:
	dw Data_53c51
	dw Data_53c5f
	dw $0

Data_53c51:
	dstr "(なんしﾞゃ やめるのか)"

Data_53c5f:
	dstr "(いくしﾞかﾞないのう)"

Pointers_53c6c:
	dw Data_53c70
	dw $0

Data_53c70:
	dstr "(その)ロホﾞホﾟン(は) (えらへﾞないよ)"

Func_53c88::
	add sp, -$52
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli DisplayPartyMenu_
	xor a
	call FarCall
	ld a, l
	cp $5
	jp c, Func_53cb4
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	jp Func_53e49

Func_53cb4: ; 53cb4 (14:7cb4)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$1f
	ld a, [hl]
	and $2
	rrca
	and $7f
	cp $1
	jp nz, Func_53d22
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_53c6c)
	ld de, Pointers_53c6c
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	jp Func_53e49

Func_53d22: ; 53d22 (14:7d22)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$23
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$28
	ld a, [hl]
	push af
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop af
	ld hl, sp+$1f
	ld e, [hl]
	call FarCall
	push af
	set_farcall_addrs_hli Func_95c14
	pop af
	call FarCall
	set_farcall_addrs_hli Func_320d8
	ld a, $1
	call FarCall
	push af
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
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop af
	cp $2
	jp z, Func_53dd3
	or a
	jp nz, Func_53dec
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_53c10)
	ld de, Pointers_53c10
	ld hl, $10e
	call FarCall
	jp Func_53e02

Func_53dd3: ; 53dd3 (14:7dd3)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_53c4b)
	ld de, Pointers_53c4b
	ld hl, $10e
	call FarCall
	jp Func_53e02

Func_53dec: ; 53dec (14:7dec)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_53c2a)
	ld de, Pointers_53c2a
	ld hl, $10e
	call FarCall
Func_53e02: ; 53e02 (14:7e02)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$23
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$28
	ld a, [hl]
	push af
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop af
	ld hl, sp+$1f
	ld e, [hl]
	call FarCall
	push af
	set_farcall_addrs_hli Func_95c79
	pop af
	call FarCall
Func_53e49: ; 53e49 (14:7e49)
	add sp, $52
	ret


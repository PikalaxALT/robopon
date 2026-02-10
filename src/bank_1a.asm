INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 1a", ROMX, BANK [$1a]
Func_68000:
	ret

Data_68001:
	db $07, $00, $0d, $0e, $05, $77, $67, $05, $00, $00, $05, $8e, $6d, $1a, $d4, $41, $1a, $46, $43, $05, $38, $60, $05, $c2, $60, $00, $00, $00, $00, $00, $00

Data_68020:
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $1a, $00, $1d

Data_6802f: ; 6802f
	db $0a, $00, $0a, $06, $1a, $2b, $4a, $05, $00, $00, $1a, $f2, $4b, $1a, $e2, $4c, $1a, $2a, $4d, $1a, $d4, $4c, $1a, $db, $4c, $00, $00, $00, $00, $00, $00

Data_6804e: ; 6804e
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $1a, $00, $02

Data_6805d:
	db $01, $04, $07, $07, $1a, $b9, $5b, $05, $00, $00, $05, $c2, $51, $1a, $7d, $5c, $05, $3f, $74, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $82, $40, $89, $40, $90, $40, $28, $ba, $b3, $b6, $dd, $29, $00, $28, $b1, $b9, $de, $d9, $29, $00, $28, $d3, $d7, $b3, $29, $00

Data_68096:
	db $00, $00, $00, $00, $ff, $ff, $03, $00, $03, $00, $ff, $ff, $7c, $40, $02

Data_680a5:
	db $0a, $02, $08, $09, $1a, $74, $5d, $05, $00, $00, $16, $24, $57, $1a, $e9, $60, $05, $3f, $74, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00

Data_680c4:
	db $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00

Func_680d3:
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

GetBanks_1a: ; 680e4 (1a:40e4)
	push af
	push de
	set_farcall_addrs_hli GetBanks
	pop de
	pop af
	jp FarCall

Func_680f6:
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_6810b:: ; 6810b (1a:410b)
	push de
	add sp, -$48
	push af
	ld de, $19
	ld a, $3
	call GetBanks_1a
	ld e, a
	push de
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld c, [hl]
	pop de
	pop af
	push de
	ld e, a
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld a, [hl]
	push af
	ld e, c
	dec e
	ld hl, sp+$1c
	call GetRobotOrTrainerBaseStats
	pop af
	ld e, a
	ld hl, sp+$2
	call Func_241f
	ld hl, sp+$1f
	ld l, [hl]
	pop de
	push hl
	ld hl, sp+$a
	ld a, [hl]
	push af
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli Func_5ec99
	pop af
	pop hl
	ld e, a
	ld a, l
	call FarCall
	cp $1
	jp nz, Func_68187
	ld hl, sp+$48
	ld a, [hl]
	or a
	jp nz, Func_6817f
	ld hl, Data_681a2
	push hl
	call PlaceString
	pop bc
	jp Func_68184

Func_6817f: ; 6817f (1a:417f)
	ld a, $1
	jp Func_6819f

Func_68184: ; 68184 (1a:4184)
	jp Func_6819e

Func_68187: ; 68187 (1a:4187)
	ld hl, sp+$48
	ld a, [hl]
	or a
	jp nz, Func_68199
	ld hl, Data_681a4
	push hl
	call PlaceString
	pop bc
	jp Func_6819e

Func_68199: ; 68199 (1a:4199)
	ld a, $ff
	jp Func_6819f

Func_6819e: ; 6819e (1a:419e)
	xor a
Func_6819f: ; 6819f (1a:419f)
	add sp, $4a
	ret

Data_681a2:
	dstr "c"

Data_681a4:
	dstr "*"

Func_681a6:: ; 681a6 (1a:41a6)
	ld a, [wFarCallDestBank]
	push af
	callba_hli Func_61ef4
	pop af
	ld [wFarCallDestBank], a
	ret

Func_681bd:: ; 681bd (1a:41bd)
	push af
	push de
	push bc
	ld a, [wFarCallDestBank]
	set_farcall_addrs_hli Func_61f34
	pop bc
	pop de
	pop af
	jp FarCall

Func_681d4:
	push bc
	push bc
	push bc
	push bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
	ld hl, $5
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	ld hl, sp+$2
	ld [hl], $0
Func_681f5: ; 681f5 (1a:41f5)
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp nc, Func_6826c
	ld hl, sp+$2
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
	jp nz, Func_68262
	ld hl, sp+$0
	ld [hl], $0
Func_6821b: ; 6821b (1a:421b)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_68262
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
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
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	add hl, de
	call CompareHLtoBC
	jp nz, Func_68258
	ld e, $0
	ld a, $3
	call Func_6bbf3
	ld hl, $4000
	jp Func_68341

Func_68258: ; 68258 (1a:4258)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6821b

Func_68262: ; 68262 (1a:4262)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_681f5

Func_6826c: ; 6826c (1a:426c)
	ld hl, sp+$2
	ld [hl], $0
Func_68270: ; 68270 (1a:4270)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_682df
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	add hl, de
	call CompareHLtoBC
	jp nz, Func_682d5
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld [hl], $ff
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
Func_682a4: ; 682a4 (1a:42a4)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_682ca
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc383 + 1
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_682a4

Func_682ca: ; 682ca (1a:42ca)
	ld a, $ff
	ld [wc383 + 3], a
	ld hl, $4000
	jp Func_68341

Func_682d5: ; 682d5 (1a:42d5)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_68270

Func_682df: ; 682df (1a:42df)
	ld hl, sp+$2
	ld [hl], $0
Func_682e3: ; 682e3 (1a:42e3)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_6832e
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld a, [hl]
	cp $ff
	jp nz, Func_68324
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	add hl, de
	ld a, l
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	cp $3
	jp nz, Func_6831d
	ld hl, sp+$1
	ld [hl], $0
	jp Func_68321

Func_6831d: ; 6831d (1a:431d)
	ld hl, sp+$1
	ld [hl], $1
Func_68321: ; 68321 (1a:4321)
	jp Func_6832e

Func_68324: ; 68324 (1a:4324)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_682e3

Func_6832e: ; 6832e (1a:432e)
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_6833e
	call Func_683be
	ld hl, -1
	jp Func_68341

Func_6833e: ; 6833e (1a:433e)
	ld hl, $4000
Func_68341: ; 68341 (1a:4341)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_68346:
	push bc
	pop de
	push hl
	ld a, [wc383]
	cp $ff
	jp nz, Func_6835a
	call FillVisibleAreaWithBlankTile
	ld hl, -1
	jp Func_683a4

Func_6835a: ; 6835a (1a:435a)
	ld de, $3
Func_6835d: ; 6835d (1a:435d)
	inc d
	dec d
	bit 7, d
	jr nz, Func_683a4
	ld hl, wc383
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_683a0
	ld hl, wc383
	add hl, de
	ld [hl], $ff
	pop hl
	push hl
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld a, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_681bd
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	jp Func_683a4

Func_683a0: ; 683a0 (1a:43a0)
	dec de
	jp Func_6835d

Func_683a4: ; 683a4 (1a:43a4)
	pop bc
	ret

Pointers_683a6:
	dw Data_683aa
	dw $0

Data_683aa:
	dstr "(はけんする ちいきを えらんてﾞね)"

Func_683be: ; 683be (1a:43be)
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
	call Func_680f6
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_683a6)
	ld de, Pointers_683a6
	ld hl, $10e
	call FarCall
	call FillVisibleAreaWithBlankTile
	ld a, [wc7e2]
	push af
	ld a, $1
	ld [wc7e2], a
Func_68402: ; 68402 (1a:4402)
	call Func_2009
	ld a, [wSongCurrentlyPlaying]
	callba_hli WorldMap
	ld l, a
	push hl
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_6804e)
	ld de, Data_6804e
	ld hl, Data_6802f
	call FarCall
	ld a, l
	push af
	call FillVisibleAreaWithBlankTile
	pop af
	pop hl
	or a
	jp nz, Func_68441
	push hl
	call Func_3af6
	pop hl
	jp Func_68444

Func_68441: ; 68441 (1a:4441)
	jp Func_68402

Func_68444: ; 68444 (1a:4444)
	pop af
	ld [wc7e2], a
	ld a, l
	call Func_68457
	or a
	jp nz, Func_68454
	xor a
	jp Func_68456

Func_68454: ; 68454 (1a:4454)
	ld a, $ff
Func_68456: ; 68456 (1a:4456)
	ret

Func_68457: ; 68457 (1a:4457)
	push af
	add sp, -$1e
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld c, $5
	ld e, $a
	ld hl, $0
	call Func_680f6
	ld c, $5
	ld e, $a
	ld hl, $5
	call Func_680f6
	ld c, $b
	ld e, $a
	ld hl, $a00
	call Func_680f6
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld de, Data_68886
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld de, Data_6888f
	ld hl, $106
	call PlaceStringDEatCoordHL
	ld de, Data_68899
	ld hl, $b01
	call PlaceStringDEatCoordHL
	ld de, Data_688a5
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld hl, sp+$1f
	ld a, [hl]
	call Func_689f0
	ld hl, sp+$1f
	ld a, [hl]
	cp $e
	jp nz, Func_684dc
	set_farcall_addrs_hli CheckEventFlag
	ld a, $44
	call FarCall
	cp $1
	jp nz, Func_684d9
	ld hl, sp+$1f
	ld [hl], $13
Func_684d9: ; 684d9 (1a:44d9)
	jp Func_68516

Func_684dc: ; 684dc (1a:44dc)
	ld hl, sp+$1f
	ld a, [hl]
	cp $c
	jp nz, Func_68516
	set_farcall_addrs_hli CheckEventFlag
	ld a, $35
	call FarCall
	cp $1
	jp nz, Func_68516
	ld hl, sp+$1f
	ld [hl], $14
	set_farcall_addrs_hli CheckEventFlag
	ld a, $23
	call FarCall
	cp $1
	jp nz, Func_68516
	ld hl, sp+$1f
	ld [hl], $c
Func_68516: ; 68516 (1a:4516)
	ld e, $8
	ld a, $3
	call SetStringStartState
	ld hl, wTimeSetDaysOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetDaysTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMonthsOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMonthsTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688af
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	xor a
Func_68546: ; 68546 (1a:4546)
	cp $4
	jp nc, Func_68580
	push af
	ld e, a
	ld d, $0
	ld hl, wc383
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	call Func_6890a
	set_farcall_addrs_hli Func_16019
	pop af
	push af
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld l, a
	ld h, $0
	add hl, hl
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $b
	call FarCall
	pop af
	inc a
	jp Func_68546

Func_68580: ; 68580 (1a:4580)
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
	jp nz, Func_6887e
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
	call Func_680f6
	ld de, Data_688b9
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
	jp nz, Func_685f7
	ld hl, wc387
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
	ld de, $9
	add hl, de
	ld [hl], $1
	jp Func_6860e

Func_685f7: ; 685f7 (1a:45f7)
	ld hl, wc387
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
	ld de, $9
	add hl, de
	ld [hl], $0
Func_6860e: ; 6860e (1a:460e)
	ld hl, sp+$1f
	ld e, [hl]
	ld a, $c
	call Func_6bbf3
	call Func_3af6
	call Func_68ac3
	ld hl, wc387
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
	ld [hl], $1
	ld hl, wc387
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
	ld a, [wc383]
	ld [hl], a
	ld hl, wc387
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
	inc hl
	ld a, [wc383 + 1]
	ld [hl], a
	ld hl, wc387
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
	inc hl
	inc hl
	ld a, [wc383 + 2]
	ld [hl], a
	ld hl, wc387
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
	inc hl
	inc hl
	inc hl
	ld a, [wc383 + 3]
	ld [hl], a
	ld hl, wc387
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
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [wc388]
	ld [hl], a
	ld hl, wc387
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
	ld de, $5
	add hl, de
	ld a, [wc389]
	ld [hl], a
	ld hl, wc387
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
	ld de, $6
	add hl, de
	ld a, [wc38a]
	ld [hl], a
	ld hl, wc387
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
	ld de, $7
	add hl, de
	ld a, [wc38b]
	ld [hl], a
	ld hl, wc387
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
	ld de, $8
	add hl, de
	ld a, [wc38c]
	ld [hl], a
	ld hl, sp+$1f
	ld a, [hl]
	ld hl, wc387
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
	ld de, $11
	add hl, de
	ld [hl], a
	ld hl, wc387
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
	ld de, $e
	add hl, de
	ld [hl], $0
	ld hl, wc387
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
	ld de, $f
	add hl, de
	ld [hl], $0
	callba_hli Func_e2cc7
	ld c, $9
	ld e, $a
	ld hl, $505
	call Func_680f6
	ld de, Data_688c9
	ld hl, $606
	call PlaceStringDEatCoordHL
	ld e, $8
	ld a, $6
	call SetStringStartState
	ld a, [wc388]
	cp $a
	jp nc, Func_68794
	ld hl, wc389
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688d4
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_687a4

Func_68794: ; 68794 (1a:4794)
	ld hl, wc389
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688dd
	push hl
	call PlaceString
	pop bc
	pop bc
Func_687a4: ; 687a4 (1a:47a4)
	ld a, [wc38a]
	cp $a
	jp nc, Func_687bf
	ld hl, wc38a
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688e5
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_687cf

Func_687bf: ; 687bf (1a:47bf)
	ld hl, wc38a
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688ed
	push hl
	call PlaceString
	pop bc
	pop bc
Func_687cf: ; 687cf (1a:47cf)
	ld e, $a
	ld a, $6
	call SetStringStartState
	ld a, [wc38b]
	cp $a
	jp nc, Func_687f1
	ld hl, wc38b
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688f4
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_68801

Func_687f1: ; 687f1 (1a:47f1)
	ld hl, wc38b
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688f9
	push hl
	call PlaceString
	pop bc
	pop bc
Func_68801: ; 68801 (1a:4801)
	ld a, [wc38c]
	cp $a
	jp nc, Func_6881c
	ld hl, wc38c
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_688fd
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_6882c

Func_6881c: ; 6881c (1a:481c)
	ld hl, wc38c
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_68901
	push hl
	call PlaceString
	pop bc
	pop bc
Func_6882c: ; 6882c (1a:482c)
	ld de, Data_68904
	ld hl, $b0c
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_60001
	ld c, $0
	ld e, $c
	ld a, $d
	call FarCall
	callba_hli WaitAorBButtonOverworld_17a44
	set_farcall_addrs_hli Func_60001
	ld c, $1
	ld e, $c
	ld a, $d
	call FarCall
	call FillVisibleAreaWithBlankTile
	xor a
	jp Func_68883

Func_6887e: ; 6887e (1a:487e)
	call Func_3af6
	ld a, $ff
Func_68883: ; 68883 (1a:4883)
	add sp, $20
	ret

Data_68886:
	dstr "(はけんちいき)"

Data_6888f:
	dstr "(はけんしﾞかん)"

Data_68899:
	dstr "(はけん)ハﾟーティー"

Data_688a5:
	dstr "(これてﾞいい?)"

Data_688af:
	dstr "%d%d:%d%d"

Data_688b9:
	dstr "(しﾞかんを しらせますか)?"

Data_688c9:
	dstr "(きかんしﾞかんは)"

Data_688d4:
	dstr " %d(かﾞつ)"

Data_688dd:
	dstr "%d(かﾞつ)"

Data_688e5:
	dstr " %d(にち)"

Data_688ed:
	dstr "%d(にち)"

Data_688f4:
	dstr " %d:"

Data_688f9:
	dstr "%d:"

Data_688fd:
	dstr "0%d"

Data_68901:
	dstr "%d"

Data_68904:
	dstr "(たﾞよ)"

Func_6890a: ; 6890a (1a:490a)
	push hl
	add sp, -$24
	push de
	read_hl_from_sp_plus $28
	push hl
	read_hl_from_sp_plus $2a
	ld [hl], $81
	inc hl
	write_hl_to_sp_plus $2a
	set_farcall_addrs_hli Func_7dfc
	pop hl
	pop de
	push hl
	ld a, e
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld hl, sp+$9
	ld a, [hl]
	cp $a
	jp nc, Func_68972
	set_farcall_addrs_hli Func_17975
	ld c, $1
	read_hl_from_sp_plus $28
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	call FarCall
	read_hl_from_sp_plus $28
	inc hl
	write_hl_to_sp_plus $28
	read_hl_from_sp_plus $28
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $28
	jp Func_68999

Func_68972: ; 68972 (1a:4972)
	set_farcall_addrs_hli Func_17975
	ld c, $2
	read_hl_from_sp_plus $28
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	call FarCall
	read_hl_from_sp_plus $28
	inc hl
	inc hl
	write_hl_to_sp_plus $28
Func_68999: ; 68999 (1a:4999)
	ld bc, $6
	ld hl, sp+$3
	push hl
	read_hl_from_sp_plus $2a
	pop de
	call CopyFromDEtoHL
	pop hl
	call FindFirstNonzero
	ld c, l
	ld b, h
	push bc
	read_hl_from_sp_plus $28
	call FindFirstNonzero
	ld c, l
	ld b, h
	read_hl_from_sp_plus $28
	add hl, bc
	write_hl_to_sp_plus $28
	pop bc
Func_689c1: ; 689c1 (1a:49c1)
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_689db
	read_hl_from_sp_plus $26
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $26
	inc bc
	jp Func_689c1

Func_689db: ; 689db (1a:49db)
	read_hl_from_sp_plus $26
	ld [hl], $0
	read_hl_from_sp_plus $26
	reg16swap de, hl
	add sp, $26
	reg16swap de, hl
	ret

Func_689f0: ; 689f0 (1a:49f0)
	add sp, -$14
	push af
	ld a, [wc7e2]
	ld l, a
	pop af
	push hl
	inc a
	ld [wc7e2], a
	set_farcall_addrs_hli Func_e26e0
	ld hl, sp+$2
	call FarCall
	ld e, $3
	ld a, $1
	call SetStringStartState
	ld hl, sp+$2
	push hl
	ld hl, Data_68a28
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
	ld a, l
	ld [wc7e2], a
	add sp, $14
	ret

Data_68a28:
	dstr "%s"

Func_68a2b:
	call Func_1fbe
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
	call Func_680f6
	ld c, $4
	ld e, $14
	ld hl, $5
	call Func_680f6
	ld de, Data_68a98
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_68aa6
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld de, Data_68ab7
	ld hl, $106
	call PlaceStringDEatCoordHL
	ld de, Data_68ac1
	ld hl, $d06
	call PlaceStringDEatCoordHL
	xor a
	ld [wc2f7], a
	xor a
	ld [wTimeSetDaysOnesDigit], a
	ld [wTimeSetMonthsOnesDigit], a
	ld [wTimeSetMonthsTensDigit], a
	ld a, $1
	ld [wTimeSetDaysTensDigit], a
	call Func_68b7d
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	ret

Data_68a98:
	dstr "(はけんする しﾞかんを)"

Data_68aa6:
	dstr "(にゅうりょく してくたﾞさい)"

Data_68ab7:
	dstr "(はけんしﾞかん)"

Data_68ac1:
	dstr ":"

Func_68ac3: ; 68ac3 (1a:4ac3)
	push bc
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$3
	call FarCall
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$5
	ld c, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	call WriteHLToSPPlus3
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	ld hl, sp+$0
	ld [hl], a
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	add e
	push af
	ld b, $3c
	call DivideAbyB
	ld e, a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$8
	add [hl]
	add e
	push af
	ld l, a
	ld h, $0
	ld de, $18
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus7
	add hl, bc
	call WriteHLToSPPlus7
	pop af
	ld b, $18
	call DivideAbyB
	ld hl, sp+$8
	ld [hl], b
	pop af
	ld b, $3c
	call DivideAbyB
	ld hl, sp+$7
	ld [hl], b
	set_farcall_addrs_hli FixDays
	ld hl, sp+$3
	push hl
	call GetHLAtSPPlus5
	pop de
	call FarCall
	ld c, $0
Func_68b5b: ; 68b5b (1a:4b5b)
	ld a, c
	cp $5
	jp nc, Func_68b74
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc388
	add hl, de
	ld [hl], a
	inc c
	jp Func_68b5b

Func_68b74: ; 68b74 (1a:4b74)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_68b79:
	db $0b, $0c, $0e, $0f

Func_68b7d: ; 68b7d (1a:4b7d)
	ld l, $0
Func_68b7f: ; 68b7f (1a:4b7f)
	ld a, l
	cp $4
	jp nc, Func_68bea
	ld a, [wc2f7]
	cp l
	jp nz, Func_68ba8
	push hl
	ld e, l
	ld d, $0
	ld hl, Data_68b79
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $7
	add hl, de
	ld de, Data_68beb
	call PlaceStringDEatCoordHL
	pop hl
	jp Func_68bc1

Func_68ba8: ; 68ba8 (1a:4ba8)
	push hl
	ld e, l
	ld d, $0
	ld hl, Data_68b79
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $7
	add hl, de
	ld de, Data_68bed
	call PlaceStringDEatCoordHL
	pop hl
Func_68bc1: ; 68bc1 (1a:4bc1)
	push hl
	ld e, l
	ld d, $0
	ld hl, Data_68b79
	add hl, de
	ld a, [hl]
	ld e, $6
	call SetStringStartState
	pop hl
	push hl
	ld e, l
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_68bef
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
	inc l
	jp Func_68b7f

Func_68bea: ; 68bea (1a:4bea)
	ret

Data_68beb:
	dstr "b"

Data_68bed:
	dstr "_"

Data_68bef:
	dstr "%d"

Func_68bf2: ; 68bf2 (1a:4bf2)
	ld a, [wc2f7]
	cp $2
	jp nz, Func_68bff
	ld c, $5
	jp Func_68c01

Func_68bff: ; 68bff (1a:4bff)
	ld c, $9
Func_68c01: ; 68c01 (1a:4c01)
	ld a, e
	sub $3
	or d
	jp z, Func_68c8a
	ld a, e
	sub $2
	or d
	jp z, Func_68c78
	ld a, e
	dec a
	or d
	jp z, Func_68c49
	ld a, e
	or d
	jp nz, Func_68c99
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp c
	jp nz, Func_68c38
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], $0
	jp Func_68c46

Func_68c38: ; 68c38 (1a:4c38)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
Func_68c46: ; 68c46 (1a:4c46)
	jp Func_68c99

Func_68c49: ; 68c49 (1a:4c49)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_68c66
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], c
	jp Func_68c75

Func_68c66: ; 68c66 (1a:4c66)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_68c75: ; 68c75 (1a:4c75)
	jp Func_68c99

Func_68c78: ; 68c78 (1a:4c78)
	ld a, [wc2f7]
	cp $3
	jp nc, Func_68c87
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
Func_68c87: ; 68c87 (1a:4c87)
	jp Func_68c99

Func_68c8a: ; 68c8a (1a:4c8a)
	ld a, [wc2f7]
	cp $1
	jp c, Func_68c99
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
Func_68c99: ; 68c99 (1a:4c99)
	ld a, [wTimeSetMonthsTensDigit]
	or a
	jp nz, Func_68cc1
	ld a, [wTimeSetMonthsOnesDigit]
	or a
	jp nz, Func_68cc1
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	cp $a
	jp nc, Func_68cc1
	ld a, $1
	ld [wTimeSetDaysTensDigit], a
	xor a
	ld [wTimeSetDaysOnesDigit], a
Func_68cc1: ; 68cc1 (1a:4cc1)
	call Func_68b7d
	ld l, $4
	push hl
	ld c, $14
	ld e, $6
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	ret

Func_68cd4:
	ld de, $2
	call Func_68bf2
	ret

Func_68cdb:
	ld de, $3
	call Func_68bf2
	ret

Func_68ce2:
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	ld hl, wc387
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
	ld de, $7
	add hl, de
	ld [hl], a
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	ld hl, wc387
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
	ld de, $8
	add hl, de
	ld [hl], a
	ld hl, $0
	ret

Func_68d2a:
	ld hl, -1
	ret

Pointers_68d2e:
	dw Data_68dac
	dw Data_68db4
	dw $0

Pointers_68d34:
	dw Data_68dba
	dw Data_68dc0
	dw $0

Pointers_68d3a:
	dw Data_68dc7
	dw Data_68dcd
	dw $0

Pointers_68d40:
	dw Data_68dd5
	dw Data_68ddb
	dw $0

Pointers_68d46:
	dw Data_68de3
	dw Data_68de9
	dw $0

Pointers_68d4c:
	dw Data_68df4
	dw Data_68dfa
	dw $0

Pointers_68d52:
	dw Data_68dfe
	dw Data_68e04
	dw $0

Pointers_68d58:
	dw Data_68e08
	dw Data_68e0e
	dw $0

Pointers_68d5e:
	dw Data_68e16
	dw Data_68e1c
	dw $0

Pointers_68d64:
	dw Data_68e25
	dw Data_68e2b
	dw $0

Pointers_68d6a:
	dw Data_68e37
	dw Data_68e3e
	dw $0

Pointers_68d70:
	dw Data_68e47
	dw Data_68e4e
	dw $0

Pointers_68d76:
	dw Data_68e57
	dw Data_68e5e
	dw $0

Pointers_68d7c:
	dw Data_68e67
	dw Data_68e6e
	dw $0

Pointers_68d82:
	dw Data_68e72
	dw Data_68e79
	dw $0

Pointers_68d88:
	dw Data_68e85
	dw Data_68e8c
	dw $0

Pointers_68d8e:
	dw Data_68e97
	dw Data_68e9e
	dw $0

Pointers_68d94:
	dw Data_68ea6
	dw Data_68ead
	dw $0

Pointers_68d9a:
	dw Data_68eb6
	dw Data_68ebd
	dw $0

Pointers_68da0:
	dw Data_68ec7
	dw Data_68ece
	dw $0

Pointers_68da6:
	dw Data_68ed9
	dw Data_68ee0
	dw $0

Data_68dac:
	dstr "(ちか1かい)"

Data_68db4:
	dstr "(そうこ)"

Data_68dba:
	dstr "(1かい)"

Data_68dc0:
	dstr "(うけつけ)"

Data_68dc7:
	dstr "(2かい)"

Data_68dcd:
	dstr "アイテム(や)"

Data_68dd5:
	dstr "(3かい)"

Data_68ddb:
	dstr "ハﾟーツ(や)"

Data_68de3:
	dstr "(4かい)"

Data_68de9:
	dstr "(けんきゅうしﾞょ)"

Data_68df4:
	dstr "(5かい)"

Data_68dfa:
	dstr "トイレ"

Data_68dfe:
	dstr "(6かい)"

Data_68e04:
	dstr "ハﾞス"

Data_68e08:
	dstr "(7かい)"

Data_68e0e:
	dstr "(こういしつ)"

Data_68e16:
	dstr "(8かい)"

Data_68e1c:
	dstr "(はけんしﾞょ)"

Data_68e25:
	dstr "(9かい)"

Data_68e2b:
	dstr "レクリエーションルーム"

Data_68e37:
	dstr "(10かい)"

Data_68e3e:
	dstr "ケﾞームコーナー"

Data_68e47:
	dstr "(11かい)"

Data_68e4e:
	dstr "(かいきﾞしつ)"

Data_68e57:
	dstr "(12かい)"

Data_68e5e:
	dstr "リラックスルーム"

Data_68e67:
	dstr "(13かい)"

Data_68e6e:
	dstr "サウナ"

Data_68e72:
	dstr "(14かい)"

Data_68e79:
	dstr "カウンセリンクﾞルーム"

Data_68e85:
	dstr "(15かい)"

Data_68e8c:
	dstr "(しちょうかくしつ)"

Data_68e97:
	dstr "(16かい)"

Data_68e9e:
	dstr "(あきへﾞや)"

Data_68ea6:
	dstr "(17かい)"

Data_68ead:
	dstr "(おうせつしつ)"

Data_68eb6:
	dstr "(18かい)"

Data_68ebd:
	dstr "(しゃちょうしつ)"

Data_68ec7:
	dstr "(19かい)"

Data_68ece:
	dstr "(てんしﾞしﾞょう)"

Data_68ed9:
	dstr "(20かい)"

Data_68ee0:
	dstr "(てんほﾞうたﾞい)"

Func_68eeb::
	reg16swap de, hl
	push de
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
	ld hl, $64
	call FarCall
	pop de
	push hl
	push de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
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
	call Func_680f6
	set_farcall_addrs_hli PrintMapText_
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_68d2e
	add hl, de
	reg16swap de, hl
	ld hl, $10e
	ld c, BANK(Pointers_68d2e)
	call FarCall
	ld l, $f
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
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call PopBGMapRegion
	pop hl
	call Func_680d3
	ld hl, $4000
	ret

Data_68f86:
	db $0f, $00, $05, $0f, $0c, $00, $08, $0f, $09, $00, $0b, $0f

Func_68f92::
	push bc
	push bc
	push bc
	push hl
	ld a, [wc78c]
	ld b, $7
	call DivideAbyB
	ld l, a
	push hl
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_68f86
	add hl, de
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	pop hl
	push hl
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_68f86
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	pop hl
	push hl
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_68f86
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	push hl
	push af
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_68f86
	add hl, de
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop hl
	ld a, [wc78c]
	cp $6
	jp nc, Func_68ff4
	ld a, [wc78c]
	add a
	add $3
	ld l, a
Func_68ff4: ; 68ff4 (1a:4ff4)
	pop af
	ld c, l
	ld e, a
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_680f6
	ld c, $3
	ld e, $8
	ld hl, $c0f
	call Func_680f6
	pop hl
	ld a, l
	or a
	jp nz, Func_6904d
	ld c, $0
Func_69013: ; 69013 (1a:5013)
	ld a, [wc78c]
	cp c
	jp c, Func_6904a
	ld hl, sp+$6
	ld a, [hl]
	add $2
	ld e, a
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld l, a
	ld a, c
	add a
	add l
	inc c
	dec c
	jp nz, Func_6903a
	push bc
	ld h, e
	ld l, a
	ld de, Data_69114
	call PlaceStringDEatCoordHL
	pop bc
	jp Func_69046

Func_6903a: ; 6903a (1a:503a)
	push bc
	ld b, $0
	ld h, e
	ld l, a
	ld de, $2
	call Func_2230
	pop bc
Func_69046: ; 69046 (1a:5046)
	inc c
	jp Func_69013

Func_6904a: ; 6904a (1a:504a)
	jp Func_690e3

Func_6904d: ; 6904d (1a:504d)
	ld c, $0
Func_6904f: ; 6904f (1a:504f)
	ld a, l
	cp c
	jp c, Func_690e3
	push hl
	ld hl, sp+$4
	ld [hl], $0
Func_69059: ; 69059 (1a:5059)
	ld hl, sp+$4
	ld a, [hl]
	cp $7
	jp nc, Func_690de
	ld a, c
	ld d, a
	add a
	add d
	ld d, a
	ld hl, sp+$8
	ld a, [hl]
	add $2
	add d
	ld hl, sp+$6
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	add a
	ld e, a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	add e
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_6909a
	inc c
	dec c
	jp nz, Func_6909a
	push bc
	ld de, Data_69119
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	pop bc
	jp Func_690c0

Func_6909a: ; 6909a (1a:509a)
	push bc
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	ld c, l
	ld b, h
	ld de, $2
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_2230
	pop bc
Func_690c0: ; 690c0 (1a:50c0)
	ld a, c
	ld d, a
	add a
	ld e, a
	add a
	add d
	add e
	ld hl, sp+$4
	add [hl]
	ld hl, wc78c
	cp [hl]
	jp nz, Func_690d4
	jp Func_690de

Func_690d4: ; 690d4 (1a:50d4)
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp Func_69059

Func_690de: ; 690de (1a:50de)
	inc c
	pop hl
	jp Func_6904f

Func_690e3: ; 690e3 (1a:50e3)
	pop hl
	call Func_6912c
	ld a, [wc78c]
	ld c, a
	ld b, $0
	ld de, $2
	ld hl, $d10
	call Func_2230
	ld hl, Data_6911e
	push hl
	call PlaceString
	pop bc
	call Func_69581
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Data_69114:
	dstr "(ちか)"

Data_69119:
	dstr "(ちか)"

Data_6911e:
	dstr "(かいたﾞて)"

Data_69126:
	db $0f, $00, $0c, $00, $09, $00

Func_6912c: ; 6912c (1a:512c)
	push hl
	add sp, -$10
	ld hl, sp+$10
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push hl
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_69126
	ld bc, $6
	call MemCopy
	pop hl
	write_hl_to_sp_plus $11
	ld a, [wc78c]
	ld b, $7
	call DivideAbyB
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld e, [hl]
	ld hl, sp+$e
	ld [hl], e
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$d
	ld [hl], e
	read_hl_from_sp_plus $11
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	read_hl_from_sp_plus $11
	ld de, $b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	call GetHLAtSPPlus10
	ld de, $7
	call DivideHLByDESigned
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, l
	ld hl, sp+$c
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $7
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, l
	ld hl, sp+$b
	ld [hl], a
	call GetHLAtSPPlus8
	ld de, $7
	call DivideHLByDESigned
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, l
	ld hl, sp+$a
	ld [hl], a
	call GetHLAtSPPlus8
	ld de, $7
	call DivideHLByDESigned
	reg16swap de, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld c, l
	call GetHLAtSPPlus8
	ld a, l
	and h
	inc a
	jp nz, Func_6921f
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$c
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_6927c
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_69279

Func_6921f: ; 6921f (1a:521f)
	push bc
	ld l, $f
	push hl
	ld c, $b
	ld e, $0
	ld a, $9
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop bc
	ld hl, sp+$a
	ld a, [hl]
	ld l, c
	ld h, a
	ld de, Data_6927f
	call PlaceStringDEatCoordHL
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$c
	ld a, [hl]
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_69281
	push hl
	call PlaceString
	pop bc
	pop bc
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $13
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, $f
	push hl
	ld c, $b
	ld e, $0
	ld a, $9
	call PushBGMapRegion
	pop bc
	ld l, $f
	push hl
	ld c, $b
	ld e, $0
	ld a, $9
	call DoublePushBGMapRegion
	pop bc
Func_69279: ; 69279 (1a:5279)
	add sp, $12
	ret

Data_6927c:
	dstr "%c"

Data_6927f:
	dstr " "

Data_69281:
	dstr "%c"

Func_69284:: ; 69284 (1a:5284)
	push bc
	push bc
	push de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [wc78c]
	ld c, a
	push bc
	ld a, [wc78c]
	ld b, $7
	call DivideAbyB
	pop bc
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_6931d
	ld a, e
	sub $2
	or d
	jp z, Func_692fb
	ld a, e
	dec a
	or d
	jp z, Func_692e1
	ld a, e
	or d
	jp nz, Func_69335
	pop hl
	push hl
	dec hl
	pop de
	push hl
	inc h
	dec h
	bit 7, h
	jr z, .asm_692de
	ld hl, $0
	pop de
	push hl
.asm_692de
	jp Func_69335

Func_692e1: ; 692e1 (1a:52e1)
	pop hl
	push hl
	inc hl
	pop de
	push hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_692f8
	ld l, c
	ld h, $0
	pop de
	push hl
Func_692f8: ; 692f8 (1a:52f8)
	jp Func_69335

Func_692fb: ; 692fb (1a:52fb)
	pop hl
	push hl
	ld de, $7
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_6931a
	pop hl
	push hl
	ld de, -7
	add hl, de
	pop de
	push hl
Func_6931a: ; 6931a (1a:531a)
	jp Func_69335

Func_6931d: ; 6931d (1a:531d)
	pop hl
	push hl
	ld de, -7
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	inc h
	dec h
	bit 7, h
	jr z, Func_69335
	pop hl
	push hl
	ld de, $7
	add hl, de
	pop de
	push hl
Func_69335: ; 69335 (1a:5335)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	call Func_6912c
	ld hl, $4000
	pop bc
	pop bc
	ret

Func_6934e::
	ld de, $2
	jp Func_69284

Func_69354::
	ld de, $3
	jp Func_69284

Func_6935a:
	push hl
	ld bc, $8a00
	push bc
	call WaitVideoTransfer
	pop bc
	read_hl_from wc38e
	ld a, l
	or h
	jp nz, Func_69431
	push bc
	set_farcall_addrs_hli malloc
	ld hl, Func_0150
	call FarCall
	write_hl_to wc38e
	ld a, $6
	ld [wFarCallDestBank], a
	pop bc
	push bc
	ld e, c
	ld d, b
	read_hl_from wc38e
	ld bc, Func_0150
	call FarRequestVideoData
	pop bc
Func_69399: ; 69399 (1a:5399)
	pop hl
	push hl
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_69431
	check_cgb
	jp nz, Func_693e7
	ld a, BANK(MapTiles_CGB)
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp nz, Func_693c7
	push bc
	ld l, c
	ld h, b
	ld de, MapTiles_CGB
	ld bc, $10
	call FarRequestVideoData
	pop bc
	jp Func_693e4

Func_693c7: ; 693c7 (1a:53c7)
	push bc
	call GetHLAtSPPlus4
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MapTiles_CGB
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $10
	call FarRequestVideoData
	pop bc
Func_693e4: ; 693e4 (1a:53e4)
	jp Func_69422

Func_693e7: ; 693e7 (1a:53e7)
	ld a, BANK(MapTiles_SGB_DMG)
	ld [wFarCallDestBank], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	and [hl]
	inc a
	jp nz, Func_69405
	push bc
	ld l, c
	ld h, b
	ld de, MapTiles_SGB_DMG
	ld bc, $10
	call FarRequestVideoData
	pop bc
	jp Func_69422

Func_69405: ; 69405 (1a:5405)
	push bc
	call GetHLAtSPPlus4
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MapTiles_SGB_DMG
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $10
	call FarRequestVideoData
	pop bc
Func_69422: ; 69422 (1a:5422)
	ld hl, $10
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	push hl
	inc hl
	inc hl
	pop de
	push hl
	jp Func_69399

Func_69431: ; 69431 (1a:5431)
	call WaitVideoTransfer
	pop bc
	ret

Func_69436:: ; 69436 (1a:5436)
	ld bc, $8a00
	read_hl_from wc38e
	ld a, l
	or h
	jp z, Func_69469
	ld a, $6
	ld [wFarCallDestBank], a
	read_hl_from wc38e
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $150
	call FarRequestVideoData
	read_hl_from wc38e
	call Func_680d3
	ld hl, $0
	write_hl_to wc38e
Func_69469: ; 69469 (1a:5469)
	ret

Data_6946a:
	db $07, $01, $08, $01, $09, $01, $15, $01, $18, $01, $19, $01, $4c, $00, $4e, $00, $46, $00, $47, $00, $56, $00, $57, $00, $00, $00

Data_69484:
	db $00, $01, $01, $01, $01, $02, $03, $04, $04, $04, $04, $05, $06, $07, $08, $09, $06, $07, $06, $07, $0a, $0b, $06, $07

Data_6949c:
	db $32, $01, $33, $01, $34, $01, $42, $01, $43, $01, $44, $01, $52, $01, $53, $01, $54, $01, $12, $01, $14, $01, $76, $00, $77, $00, $2c, $02, $2d, $02, $22, $01, $23, $01, $3c, $02, $3d, $02, $24, $01, $2f, $00, $00, $00

Data_694c8:
	db $00, $01, $01, $01, $01, $02, $03, $04, $04, $04, $04, $05, $03, $04, $04, $04, $04, $05, $06, $07, $07, $07, $07, $08

Data_694e0:
	db $09, $14, $14, $14, $14, $0a, $09, $14, $0b, $0c, $14, $0a

Data_694ec:
	db $09, $14, $14, $14, $14, $0a, $09, $14, $0d, $0e, $14, $0a, $0f, $10, $11, $12, $10, $13

Func_694fe:
	push hl
	push de
	push bc
	push bc
	ld hl, sp+$1
	ld [hl], $0
	ld hl, sp+$0
	ld [hl], $0
	call GetHLAtSPPlus8
	ld e, h
	ld hl, sp+$2
	ld [hl], e
	call GetHLAtSPPlus8
	ld e, l
Func_69515: ; 69515 (1a:5515)
	ld a, c
	cp $1
	jp c, Func_69563
	push de
	push bc
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	call Coord2TileMap
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	add $a0
	ld [bc], a
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	cp $6
	jp c, Func_6955d
	ld hl, sp+$5
	ld [hl], $0
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_6955d: ; 6955d (1a:555d)
	pop bc
	dec c
	pop de
	jp Func_69515

Func_69563: ; 69563 (1a:5563)
	ld d, $0
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	pop de
	add hl, de
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_69581: ; 69581 (1a:5581)
	ld a, [wc78c]
	cp $5
	jp nc, Func_6958f
	call Func_69593
	jp Func_69592

Func_6958f: ; 6958f (1a:558f)
	call Func_69609
Func_69592: ; 69592 (1a:5592)
	ret

Func_69593: ; 69593 (1a:5593)
	push bc
	ld hl, Data_6946a
	call Func_6935a
	ld hl, sp+$0
	ld [hl], $0
Func_6959e: ; 6959e (1a:559e)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_695fb
	ld hl, sp+$1
	ld [hl], $0
Func_695aa: ; 695aa (1a:55aa)
	ld hl, sp+$1
	ld a, [hl]
	cp $6
	jp nc, Func_695f1
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_69484
	add hl, de
	ld a, [hl]
	add $a0
	push af
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $b
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	call Coord2TileMap
	pop af
	ld [hl], a
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_695aa

Func_695f1: ; 695f1 (1a:55f1)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6959e

Func_695fb: ; 695fb (1a:55fb)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	ret

Func_69609: ; 69609 (1a:5609)
	ld hl, Data_6949c
	call Func_6935a
	ld a, [wc78c]
	ld b, $5
	call DivideAbyB
	push af
	ld e, $1
	add a
	ld l, a
	ld a, $8
	sub l
	ld l, e
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	ld e, a
	ld d, $0
	add hl, de
	ld de, Data_694c8
	ld c, $18
	call Func_694fe
	pop af
Func_69633: ; 69633 (1a:5633)
	cp $1
	jp c, Func_69646
	push af
	ld de, Data_694e0
	ld c, $c
	call Func_694fe
	pop af
	dec a
	jp Func_69633

Func_69646: ; 69646 (1a:5646)
	ld de, Data_694ec
	ld c, $12
	call Func_694fe
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

RepairRobots::
	ld de, $19
	ld a, $3
	call GetBanks_1a
	push af
	xor a
.loop
	cp $4
	jp nc, .quit

	ld l, a
	ld h, 0
	get_party_bot

	ld de, $e
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld l, a
	ld h, 0
	get_party_bot

	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d

	ld l, a
	ld h, 0
	get_party_bot

	ld de, $12
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld l, a
	ld h, 0
	get_party_bot

	ld de, $10
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d

	ld l, a
	ld h, 0
	get_party_bot

	ld de, $16
	add hl, de
	ld [hl], $0
	inc a
	jp .loop

.quit
	pop af
	call GetSRAMBank
	ret

Func_696f3::
	push hl
	add sp, -$5e
	ld hl, sp+$5e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $62
	read_hl_from_sp_plus $62
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $62
	inc hl
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	read_hl_from_sp_plus $62
	inc hl
	inc hl
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $64
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $9
	add hl, bc
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $f
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_680f6
	set_farcall_addrs_hli Func_17863
	pop bc
	push bc
	ld l, c
	ld h, b
	call FarCall
	pop bc
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, $b
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld a, [hl]
	add $2
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld e, a
	ld a, [bc]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$1
	add [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_69812
	xor a
Func_697b2: ; 697b2 (1a:57b2)
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_6980f
	push de
	push af
	ld hl, sp+$8
	ld a, [hl]
	call SetStringStartState
	ld hl, sp+$4
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop af
	pop de
	push af
	push de
	read_hl_from_sp_plus $d
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$d
	ld bc, $2
	call FarCopyVideoData
	ld hl, sp+$4
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $3f
	read_hl_from_sp_plus $f
	reg16swap de, hl
	ld hl, sp+$23
	call FarCopyVideoData
	ld hl, sp+$23
	push hl
	ld hl, Data_698e2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	ld a, e
	add $2
	ld e, a
	pop af
	inc a
	jp Func_697b2

Func_6980f: ; 6980f (1a:580f)
	jp Func_69878

Func_69812: ; 69812 (1a:5812)
	ld hl, sp+$1
	ld c, [hl]
Func_69815: ; 69815 (1a:5815)
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_69878
	push de
	push bc
	ld hl, sp+$8
	ld a, [hl]
	call SetStringStartState
	ld hl, sp+$4
	ld a, [hl]
	ld [wFarCallDestBank], a
	pop bc
	pop de
	push bc
	push de
	read_hl_from_sp_plus $d
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$d
	ld bc, $2
	call FarCopyVideoData
	ld hl, sp+$4
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld bc, $3f
	read_hl_from_sp_plus $f
	reg16swap de, hl
	ld hl, sp+$23
	call FarCopyVideoData
	ld hl, sp+$23
	push hl
	ld hl, Data_698e5
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	ld a, e
	add $2
	ld e, a
	pop bc
	inc c
	jp Func_69815

Func_69878: ; 69878 (1a:5878)
	ld de, $19
	ld a, $3
	call GetBanks_1a
	push af
	ld hl, wSaveScratchPlayerName
	reg16swap de, hl
	ld hl, sp+$d
	ld bc, $5
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$b
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld de, Data_698e8
	ld hl, -1
	call PlaceStringDEatCoordHL
	ld de, Data_698f0
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	reg16swap de, hl
	add sp, $60
	reg16swap de, hl
	ret

Data_698e2:
	dstr "%s"

Data_698e5:
	dstr "%s"

Data_698e8:
	dstr "(しゃちょう)"

Data_698f0:
	dstr "(こﾞようけんは なんてﾞすか)?"

Func_69902::
	push hl
	add sp, -$18
	ld hl, sp+$18
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $19
	ld a, $3
	call GetBanks_1a
	ld l, a
	push hl
	ld bc, $0
	ld l, c
	ld h, b
	call WriteHLToSPPlus6
	xor a
Func_6991e: ; 6991e (1a:591e)
	cp $5
	jp nc, Func_699a3
	push af
	push bc
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld bc, $0
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wcb3f
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wcb49
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$15
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus10
	add hl, bc
	call WriteHLToSPPlus10
	pop bc
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	pop af
	inc a
	jp Func_6991e

Func_699a3: ; 699a3 (1a:59a3)
	read_hl_from wcb53
	call WriteHLToSPPlus4
	read_hl_from wcb55
	reg16swap de, hl
	ld a, [wcb57]
	pop hl
	push de
	push af
	push bc
	ld a, l
	call GetSRAMBank
	xor a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $2
	call FarCall
	ld bc, $81
	ld de, $14
	ld hl, $c
	call FarCall
	ld de, Data_69b31
	ld hl, $100
	call PlaceStringDEatCoordHL
	ld de, Data_69b39
	ld hl, $103
	call PlaceStringDEatCoordHL
	ld de, Data_69b3f
	ld hl, $105
	call PlaceStringDEatCoordHL
	ld de, Data_69b47
	ld hl, $107
	call PlaceStringDEatCoordHL
	ld de, Data_69b4f
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_69b56
	ld hl, $10b
	call PlaceStringDEatCoordHL
	ld de, Data_69b5d
	ld hl, $900
	call PlaceStringDEatCoordHL
	ld de, Data_69b62
	ld hl, $e00
	call PlaceStringDEatCoordHL
	xor a
Func_69a38: ; 69a38 (1a:5a38)
	cp $5
	jp nc, Func_69a7d
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$17
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $803
	add hl, de
	ld de, $3
	call Func_2230
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$d
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $d03
	add hl, de
	ld de, $3
	call Func_2230
	pop af
	inc a
	jp Func_69a38

Func_69a7d: ; 69a7d (1a:5a7d)
	call GetHLAtSPPlus10
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $a01
	call Func_2230
	pop bc
	ld de, $1
	ld hl, $f01
	call Func_2230
	ld a, BANK(GFX_58400)
	ld [wFarCallDestBank], a
	ld bc, $400
	ld de, GFX_58400
	ld hl, $8a00
	call FarRequestVideoData
	pop af
	cp $1
	jp nz, Func_69ae7
	ld hl, sp+$6
	ld [hl], $a0
	ld e, $0
Func_69ab2: ; 69ab2 (1a:5ab2)
	ld a, e
	cp $8
	jp nc, Func_69ae7
	ld c, $0
Func_69aba: ; 69aba (1a:5aba)
	ld a, c
	cp $8
	jp nc, Func_69ae3
	push de
	ld hl, sp+$8
	ld a, [hl]
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 13
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	pop de
	jp Func_69aba

Func_69ae3: ; 69ae3 (1a:5ae3)
	inc e
	jp Func_69ab2

Func_69ae7: ; 69ae7 (1a:5ae7)
	ld de, Data_69b67
	ld hl, $80d
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $4
	ld hl, $d0e
	call Func_2230
	ld hl, Data_69b78
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $811
	call Func_2230
	ld hl, Data_69b7a
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
	ld hl, $4000
	reg16swap de, hl
	add sp, $1a
	reg16swap de, hl
	ret

Data_69b31:
	dstr "(せいせきL)"

Data_69b39:
	dstr "ハﾞトラー"

Data_69b3f:
	dstr "シﾞャンハﾟー"

Data_69b47:
	dstr "スヒﾟータﾞー"

Data_69b4f:
	dstr "シールタﾞー"

Data_69b56:
	dstr "ハﾟンチャー"

Data_69b5d:
	dstr "(かち)"

Data_69b62:
	dstr "(まけ)"

Data_69b67:
	dstr "(おうしﾞゃにおくる) ヘﾞルト"

Data_69b78:
	dstr "p"

Data_69b7a:
	dstr "(れんしょうちゅう)!"

Func_69b86:: ; 69b86 (1a:5b86)
	callba_hli Func_17470
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_68096)
	ld de, Data_68096
	ld hl, Data_6805d
	call FarCall
	callba_hli Func_17488
	ret

Func_69bb9:
	push bc
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld l, [hl]
	push hl
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	set_farcall_addrs_hli Func_17e95
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_69c49
	ld hl, $305
	call PlaceStringDEatCoordHL
	ld de, Data_69c50
	ld hl, $307
	call PlaceStringDEatCoordHL
	ld de, Data_69c57
	ld hl, $309
	call PlaceStringDEatCoordHL
	ld de, Data_69c5d
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_69c6a
	ld hl, $110
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_17863
	pop hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	ret

Data_69c49:
	dstr "(こうかん)"

Data_69c50:
	dstr "(あけﾞる)"

Data_69c57:
	dstr "(もらう)"

Data_69c5d:
	dstr "キッス(てﾞ おこなう)"

Data_69c6a:
	dstr "モートﾞ(を えらんてﾞくたﾞさい)"

Func_69c7d:
	push bc
	push bc
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$4
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	pop hl
	push hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	ld [wOptionsMenu_BattleScene], a
	pop hl
	ld a, c
	sub $2
	or b
	jp z, Func_69cff
	ld a, c
	dec a
	or b
	jp z, Func_69cc9
	ld a, c
	or b
	jp nz, Func_69d0a
Func_69cc9: ; 69cc9 (1a:5cc9)
	push de
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	inc de
	ld l, c
	ld h, b
	add hl, hl
	add hl, de
	ld e, l
	ld hl, sp+$4
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_69d10
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	ld l, e
	push hl
	ld hl, sp+$2
	ld c, [hl]
	ld hl, sp+$3
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
	call Func_69d13
	jp Func_69d0a

Func_69cff: ; 69cff (1a:5cff)
	push hl
	call Func_1fbe
	pop hl
	call Func_6a0e9
	call Func_2009
Func_69d0a: ; 69d0a (1a:5d0a)
	ld hl, $8000
	pop bc
	pop bc
	ret

Data_69d10:
	dstr "%c"

Func_69d13: ; 69d13 (1a:5d13)
	call Func_1fbe
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_680c4)
	ld de, Data_680c4
	ld hl, Data_680a5
	call FarCall
	call Func_2009
	ret

Func_69d30: ; 69d30 (1a:5d30)
	jpba_hli Func_1c3b

Func_69d3e: ; 69d3e (1a:5d3e)
	jpba_hli Func_1c83

Func_69d4c: ; 69d4c (1a:5d4c)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7882
	pop bc
	pop de
	pop hl
	jp FarCall

Func_69d60: ; 69d60 (1a:5d60)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_790f
	pop bc
	pop de
	pop hl
	jp FarCall

Func_69d74:
	push hl
	add sp, -$7c
	ld hl, sp+$7c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $7e
	read_hl_from_sp_plus $7e
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $7e
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [bc]
	ld hl, sp+$3
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld e, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$1
	ld [hl], $0
	ld c, a
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_680f6
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld de, Data_69ed2
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, $19
	ld a, $3
	call GetBanks_1a
	push af
	ld hl, sp+$2
	ld [hl], $0
Func_69ddb: ; 69ddb (1a:5ddb)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_69e3b
	ld hl, sp+$2
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_69e31
	set_farcall_addrs_hli GetName
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	inc h
	ld c, $6
	call FarCall
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
Func_69e31: ; 69e31 (1a:5e31)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_69ddb

Func_69e3b: ; 69e3b (1a:5e3b)
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld [hl], $0
Func_69e43: ; 69e43 (1a:5e43)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	cp [hl]
	jp nc, Func_69e88
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $c
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_69e43

Func_69e88: ; 69e88 (1a:5e88)
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $7e
	ld de, $7
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $7e
	ld de, $9
	add hl, de
	ld de, $4
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_17863
	read_hl_from_sp_plus $7e
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	reg16swap de, hl
	add sp, $7e
	reg16swap de, hl
	ret

Data_69ed2:
	dstr "ロホﾞホﾟン(を) (えらんてﾞね)"

Func_69ee5: ; 69ee5 (1a:5ee5)
	push hl
	ld a, $b
	call OverworldPlaySong
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld c, $e
Func_69ef7: ; 69ef7 (1a:5ef7)
	pop hl
	push hl
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_69f1d
	push bc
	call GetHLAtSPPlus4
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	inc h
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlus4
	inc hl
	inc hl
	call WriteHLToSPPlus4
	pop bc
	ld a, c
	add $2
	ld c, a
	jp Func_69ef7

Func_69f1d: ; 69f1d (1a:5f1d)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_69f29: ; 69f29 (1a:5f29)
	call CheckButton
	and $30
	jp z, Func_69f29
	ld hl, -1
	pop bc
	ret

Func_69f36: ; 69f36 (1a:5f36)
	push hl
	pop hl
	push hl
	ld de, $e
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $12
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push hl
	ld de, $10
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	push hl
	ld de, $16
	add hl, de
	ld [hl], $0
	pop bc
	ret

Func_69f65: ; 69f65 (1a:5f65)
	push af
	xor a
Func_69f67: ; 69f67 (1a:5f67)
	cp $2
	jp nc, Func_69f86
	push af
	set_farcall_addrs_hli Func_53a0d
	pop af
	push af
	ld e, a
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	pop af
	inc a
	jp Func_69f67

Func_69f86: ; 69f86 (1a:5f86)
	pop bc
	ret

Pointers_69f88:
	dw Data_69f8c
	dw $0

Data_69f8c:
	dstr "(つうしん) エラー"

Pointers_69f97:
	dw Data_69f9b
	dw $0

Data_69f9b:
	dstr "モートﾞ(かﾞ ちかﾞうよ)"

Pointers_69faa:
	dw Data_69fb0
	dw Data_69fc3
	dw $0

Data_69fb0:
	dstr "ハﾟーティー(かﾞ いなくなるから)"

Data_69fc3:
	dstr "(あけﾞられないよ)"

Pointers_69fce:
	dw Data_69fd4
	dw Data_69fe5
	dw $0

Data_69fd4:
	dstr "(あいての)ハﾟーティー(かﾞ)"

Data_69fe5:
	dstr "(いなくなるのてﾞ もらえないよ)"

Pointers_69ff7:
	dw Data_69ffd
	dw Data_6a00e
	dw $0

Data_69ffd:
	dstr "(あいての)ハﾟーティー(かﾞ)"

Data_6a00e:
	dstr "(いっはﾟいなのてﾞ あけﾞられないよ)"

Pointers_6a023:
	dw Data_6a029
	dw Data_6a03e
	dw $0

Data_6a029:
	dstr "ハﾟーティー(かﾞ いっはﾟいなのてﾞ)"

Data_6a03e:
	dstr "(もらえないよ)"

Pointers_6a047:
	dw Data_6a04d
	dw Data_6a05b
	dw $0

Data_6a04d:
	dstr "(この)ロホﾞホﾟン(は)"

Data_6a05b:
	dstr "(こうかんてﾞきないよ)"

Pointers_6a068:
	dw Data_6a06e
	dw Data_6a07c
	dw $0

Data_6a06e:
	dstr "(この)ロホﾞホﾟン(は)"

Data_6a07c:
	dstr "(あけﾞられないよ)"

Pointers_6a087:
	dw Data_6a08d
	dw Data_6a09b
	dw $0

Data_6a08d:
	dstr "(この)ロホﾞホﾟン(は)"

Data_6a09b:
	dstr "(もらえないよ)"

Pointers_6a0a4:
	dw Data_6a0aa
	dw Data_6a0bb
	dw $0

Data_6a0aa:
	dstr "(いきてる)ロホﾞホﾟン(かﾞ)"

Data_6a0bb:
	dstr "(いなくなるよ)"

Pointers_6a0c4:
	dw Data_6a0c8
	dw $0

Data_6a0c8:
	dstr "(もらえないよ)"

Pointers_6a0d1:
	dw Data_6a0d5
	dw $0

Data_6a0d5:
	dstr "(せいしﾞょうに しゅうりょうしたよ)"

Func_6a0e9: ; 6a0e9 (1a:60e9)
	push hl
	add sp, -$5c
	ld hl, sp+$5c
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ldh a, [hSRAMBank]
	write_hl_to_sp_plus $5d
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	xor a
	call OverworldPlaySong
	set_farcall_addrs_hli Func_52d58
	ld hl, sp+$11
	call FarCall
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $0
Func_6a11f: ; 6a11f (1a:611f)
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp nc, Func_6a141
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_6a137
	jp Func_6a141

Func_6a137: ; 6a137 (1a:6137)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_6a11f

Func_6a141: ; 6a141 (1a:6141)
	callba_hli Func_50d27
	ld hl, sp+$c
	ld [hl], a
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld de, Data_6aa8f
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_6aaa2
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	call Func_69d30
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld de, Data_6aaba
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_6aac6
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	ld a, [wc326]
	cp $80
	jp nz, Func_6a1cb
	call NextOverworldFrame
Func_6a1b0: ; 6a1b0 (1a:61b0)
	ld a, [wJoyPressed]
	and $20
	jp nz, Func_6a1b0
	call Func_69d3e
	or a
	jp z, Func_6a1c8
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a1c8: ; 6a1c8 (1a:61c8)
	call CheckButton
Func_6a1cb: ; 6a1cb (1a:61cb)
	ld hl, sp+$a
	ld a, [wOptionsMenu_BattleScene]
	inc a
	add a
	add a
	add a
	add a
	ld [hl], a
	set_farcall_addrs_hli GetRobotInParty
	read_hl_from_sp_plus $5d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$15
	reg16swap de, hl
	call FarCall
	ld hl, sp+$15
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	ld de, $19
	ld a, $3
	call GetBanks_1a
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $0
Func_6a207: ; 6a207 (1a:6207)
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nc, Func_6a26a
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld [hl], $ff
	ld hl, sp+$0
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_6a260
	ld hl, sp+$0
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
	jp nc, Func_6a260
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld [hl], $1
Func_6a260: ; 6a260 (1a:6260)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6a207

Func_6a26a: ; 6a26a (1a:626a)
	ld hl, sp+$2
	ld a, [hl]
	call GetSRAMBank
	ld a, [wc326]
	cp $80
	jp nz, Func_6a353
	ld c, $0
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a293
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a293: ; 6a293 (1a:6293)
	ld c, $0
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a2ae
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a2ae: ; 6a2ae (1a:62ae)
	ld c, $0
	ld hl, sp+$c
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a2c9
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a2c9: ; 6a2c9 (1a:62c9)
	ld c, $0
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a2e4
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a2e4: ; 6a2e4 (1a:62e4)
	ld c, $0
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a2ff
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a2ff: ; 6a2ff (1a:62ff)
	ld c, $0
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a31a
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a31a: ; 6a31a (1a:631a)
	ld c, $0
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a335
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a335: ; 6a335 (1a:6335)
	ld c, $0
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a350
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a350: ; 6a350 (1a:6350)
	jp Func_6a42b

Func_6a353: ; 6a353 (1a:6353)
	ld c, $0
	ld hl, sp+$9
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a36e
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a36e: ; 6a36e (1a:636e)
	ld c, $0
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a389
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a389: ; 6a389 (1a:6389)
	ld c, $0
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a3a4
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a3a4: ; 6a3a4 (1a:63a4)
	ld c, $0
	ld hl, sp+$c
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a3bf
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a3bf: ; 6a3bf (1a:63bf)
	ld c, $0
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a3da
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a3da: ; 6a3da (1a:63da)
	ld c, $0
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a3f5
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a3f5: ; 6a3f5 (1a:63f5)
	ld c, $0
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a410
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a410: ; 6a410 (1a:6410)
	ld c, $0
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a42b
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a42b: ; 6a42b (1a:642b)
	ld e, $0
	ld hl, sp+$a
	ld a, [hl]
	cp $10
	jp nz, Func_6a442
	ld hl, sp+$9
	ld a, [hl]
	cp $10
	jp nz, Func_6a442
	ld e, $1
	jp Func_6a469

Func_6a442: ; 6a442 (1a:6442)
	ld hl, sp+$a
	ld a, [hl]
	cp $20
	jp nz, Func_6a457
	ld hl, sp+$9
	ld a, [hl]
	cp $30
	jp nz, Func_6a457
	ld e, $1
	jp Func_6a469

Func_6a457: ; 6a457 (1a:6457)
	ld hl, sp+$a
	ld a, [hl]
	cp $30
	jp nz, Func_6a469
	ld hl, sp+$9
	ld a, [hl]
	cp $20
	jp nz, Func_6a469
	ld e, $1
Func_6a469: ; 6a469 (1a:6469)
	inc e
	dec e
	jp nz, Func_6a477
	ld hl, Pointers_69f97
	call Func_69ee5
	jp Func_6aa84

Func_6a477: ; 6a477 (1a:6477)
	ld e, $0
	ld hl, sp+$a
	ld a, [hl]
	cp $30
	jp z, Func_6a93f
	cp $20
	jp z, Func_6a7ee
	cp $10
	jp nz, Func_6aa6d
	ld a, [wc326]
	cp $80
	jp nz, Func_6a62a
	ld hl, sp+$8
	ld a, [hl]
	cp $4
	jp nz, Func_6a4c4
	walle 16
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6a4c4
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6a4c4
	ld hl, Pointers_6a047
	call Func_69ee5
	jp Func_6aa84

Func_6a4c4: ; 6a4c4 (1a:64c4)
	ld hl, sp+$7
	ld a, [hl]
	cp $4
	jp nz, Func_6a4f5
	walle 16
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a4f5
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a4f5
	ld hl, Pointers_6a047
	call Func_69ee5
	jp Func_6aa84

Func_6a4f5: ; 6a4f5 (1a:64f5)
	ld c, $0
	ld hl, sp+$38
	reg16swap de, hl
	ld hl, $23
	call Func_69d4c
	or a
	jp z, Func_6a510
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a510: ; 6a510 (1a:6510)
	ld c, $0
	ld hl, sp+$15
	reg16swap de, hl
	ld hl, $23
	call Func_69d60
	or a
	jp z, Func_6a52b
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a52b: ; 6a52b (1a:652b)
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a5a5
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a5a5
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a570
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a570: ; 6a570 (1a:6570)
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, $7b84
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a5a5
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a5a5: ; 6a5a5 (1a:65a5)
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6a627
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6a627
	ld a, $1
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	ld de, sSRAMRobots
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a5ea
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a5ea: ; 6a5ea (1a:65ea)
	ld a, $2
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, s2_b29f
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a61f
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a61f: ; 6a61f (1a:661f)
	ld hl, sp+$1
	ld a, [hl]
	add $ab
	ld hl, sp+$38
	ld [hl], a
Func_6a627: ; 6a627 (1a:6627)
	jp Func_6a7be

Func_6a62a: ; 6a62a (1a:662a)
	ld hl, sp+$7
	ld a, [hl]
	cp $4
	jp nz, Func_6a65b
	walle 16
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a65b
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a65b
	ld hl, Pointers_6a047
	call Func_69ee5
	jp Func_6aa84

Func_6a65b: ; 6a65b (1a:665b)
	ld hl, sp+$8
	ld a, [hl]
	cp $4
	jp nz, Func_6a68c
	walle 16
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6a68c
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6a68c
	ld hl, Pointers_6a047
	call Func_69ee5
	jp Func_6aa84

Func_6a68c: ; 6a68c (1a:668c)
	ld c, $0
	ld hl, sp+$15
	reg16swap de, hl
	ld hl, $23
	call Func_69d60
	or a
	jp z, Func_6a6a7
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a6a7: ; 6a6a7 (1a:66a7)
	ld c, $0
	ld hl, sp+$38
	reg16swap de, hl
	ld hl, $23
	call Func_69d4c
	or a
	jp z, Func_6a6c2
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a6c2: ; 6a6c2 (1a:66c2)
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6a744
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6a744
	ld a, $1
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	ld de, sSRAMRobots
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a707
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a707: ; 6a707 (1a:6707)
	ld a, $2
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, s2_b29f
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a73c
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a73c: ; 6a73c (1a:673c)
	ld hl, sp+$1
	ld a, [hl]
	add $ab
	ld hl, sp+$38
	ld [hl], a
Func_6a744: ; 6a744 (1a:6744)
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a7be
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a7be
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a789
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a789: ; 6a789 (1a:6789)
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, $7b84
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a7be
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a7be: ; 6a7be (1a:67be)
	ld hl, sp+$38
	call Func_69f36
	set_farcall_addrs_hli StackGetRobotInParty
	read_hl_from_sp_plus $5d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$38
	reg16swap de, hl
	call FarCall
	ld hl, sp+$38
	ld a, [hl]
	call Func_69f65
	ld hl, sp+$15
	ld a, [hl]
	call Func_69f65
	jp Func_6aa6d

Func_6a7ee: ; 6a7ee (1a:67ee)
	ld hl, sp+$c
	ld a, [hl]
	cp $1
	jp nz, Func_6a7ff
	ld hl, Pointers_69faa
	call Func_69ee5
	jp Func_6aa84

Func_6a7ff: ; 6a7ff (1a:67ff)
	ld hl, sp+$b
	ld a, [hl]
	cp $4
	jp nz, Func_6a810
	ld hl, Pointers_69ff7
	call Func_69ee5
	jp Func_6aa84

Func_6a810: ; 6a810 (1a:6810)
	ld hl, sp+$4
	ld [hl], $ff
	ld c, $0
Func_6a816: ; 6a816 (1a:6816)
	ld a, c
	cp $4
	jp nc, Func_6a840
	ld a, [wc2e9]
	cp c
	jp z, Func_6a83c
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_6a83c
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	jp Func_6a840

Func_6a83c: ; 6a83c (1a:683c)
	inc c
	jp Func_6a816

Func_6a840: ; 6a840 (1a:6840)
	ld c, $0
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $1
	call Func_69d60
	or a
	jp z, Func_6a85b
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a85b: ; 6a85b (1a:685b)
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp nz, Func_6a86c
	ld hl, Pointers_6a0a4
	call Func_69ee5
	jp Func_6aa84

Func_6a86c: ; 6a86c (1a:686c)
	ld hl, sp+$7
	ld a, [hl]
	cp $4
	jp nz, Func_6a88d
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a88d
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a88d
	ld hl, Pointers_6a068
	call Func_69ee5
	jp Func_6aa84

Func_6a88d: ; 6a88d (1a:688d)
	ld c, $0
	ld hl, sp+$15
	reg16swap de, hl
	ld hl, $23
	call Func_69d60
	or a
	jp z, Func_6a8a8
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a8a8: ; 6a8a8 (1a:68a8)
	ld hl, sp+$6
	ld a, [hl]
	cp $ab
	jp c, Func_6a922
	ld hl, sp+$6
	ld a, [hl]
	cp $af
	jp nc, Func_6a922
	ld a, $1
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	debgcoord 31, 21
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a8ed
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a8ed: ; 6a8ed (1a:68ed)
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, $7b84
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d60
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6a922
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a922: ; 6a922 (1a:6922)
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	read_hl_from_sp_plus $5d
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld e, $1
	call FarCall
	jp Func_6aa6d

Func_6a93f: ; 6a93f (1a:693f)
	ld hl, sp+$b
	ld a, [hl]
	cp $1
	jp nz, Func_6a950
	ld hl, Pointers_69fce
	call Func_69ee5
	jp Func_6aa84

Func_6a950: ; 6a950 (1a:6950)
	ld hl, sp+$c
	ld a, [hl]
	cp $4
	jp nz, Func_6a961
	ld hl, Pointers_6a023
	call Func_69ee5
	jp Func_6aa84

Func_6a961: ; 6a961 (1a:6961)
	ld c, $0
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call Func_69d4c
	or a
	jp z, Func_6a97c
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a97c: ; 6a97c (1a:697c)
	ld hl, sp+$3
	ld a, [hl]
	cp $ff
	jp nz, Func_6a98d
	ld hl, Pointers_6a0c4
	call Func_69ee5
	jp Func_6aa84

Func_6a98d: ; 6a98d (1a:698d)
	ld hl, sp+$8
	ld a, [hl]
	cp $4
	jp nz, Func_6a9ae
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6a9ae
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6a9ae
	ld hl, Pointers_6a087
	call Func_69ee5
	jp Func_6aa84

Func_6a9ae: ; 6a9ae (1a:69ae)
	ld c, $0
	ld hl, sp+$38
	reg16swap de, hl
	ld hl, $23
	call Func_69d4c
	or a
	jp z, Func_6a9c9
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6a9c9: ; 6a9c9 (1a:69c9)
	ld hl, sp+$5
	ld a, [hl]
	cp $ab
	jp c, Func_6aa4b
	ld hl, sp+$5
	ld a, [hl]
	cp $af
	jp nc, Func_6aa4b
	ld a, $1
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $2f
	call MultiplyHLbyDE
	ld de, sSRAMRobots
	add hl, de
	reg16swap de, hl
	ld hl, $2f
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6aa0e
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6aa0e: ; 6aa0e (1a:6a0e)
	ld a, $2
	call GetSRAMBank
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, s2_b29f
	add hl, de
	reg16swap de, hl
	ld hl, $351
	ld c, $0
	call Func_69d4c
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	or a
	jp z, Func_6aa43
	ld hl, Pointers_69f88
	call Func_69ee5
	jp Func_6aa84

Func_6aa43: ; 6aa43 (1a:6a43)
	ld hl, sp+$1
	ld a, [hl]
	add $ab
	ld hl, sp+$38
	ld [hl], a
Func_6aa4b: ; 6aa4b (1a:6a4b)
	ld hl, sp+$38
	call Func_69f36
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$38
	reg16swap de, hl
	ld hl, sp+$c
	ld a, [hl]
	call FarCall
	ld hl, sp+$38
	ld a, [hl]
	call Func_69f65
Func_6aa6d: ; 6aa6d (1a:6a6d)
	callba_hli SaveGame
	ld hl, Pointers_6a0d1
	call Func_69ee5
	ld hl, -1
Func_6aa84: ; 6aa84 (1a:6a84)
	reg16swap de, hl
	add sp, $5e
	reg16swap de, hl
	ret

Data_6aa8f:
	dstr "ケﾞームホﾞーイ(を ちかつﾞけて)"

Data_6aaa2:
	dstr "(とﾞちらかかﾞ) Bホﾞタン(を おしてね)"

Data_6aaba:
	dstr "(ちゅうしするときは)"

Data_6aac6:
	dstr "Bホﾞタン(を おしてね)"

Func_6aad4::
	push af
	push bc
	ld de, $19
	ld a, $3
	call GetBanks_1a
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $0
Func_6aae5: ; 6aae5 (1a:6ae5)
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp nc, Func_6ab1e
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, 0
	get_party_bot
	cp [hl]
	jp nz, Func_6ab14
	ld hl, sp+$0
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	jp Func_6ab26

Func_6ab14: ; 6ab14 (1a:6b14)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_6aae5

Func_6ab1e: ; 6ab1e (1a:6b1e)
	ld hl, sp+$0
	ld a, [hl]
	call GetSRAMBank
	ld a, $ff
Func_6ab26: ; 6ab26 (1a:6b26)
	pop bc
	pop bc
	ret

Func_6ab29:: ; 6ab29 (1a:6b29)
	push af
	push bc
	ld de, $19
	ld a, $3
	call GetBanks_1a
	push af
	ld hl, sp+$2
	ld [hl], $0
	ld e, $0
Func_6ab3a: ; 6ab3a (1a:6b3a)
	ld a, e
	cp $4
	jp nc, Func_6ab66
	push de
	ld hl, sp+$7
	ld a, [hl]
	ld l, e
	ld h, 0
	get_party_bot
	cp [hl]
	jp nz, Func_6ab61
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_6ab61: ; 6ab61 (1a:6b61)
	pop de
	inc e
	jp Func_6ab3a

Func_6ab66: ; 6ab66 (1a:6b66)
	pop af
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	ret

DebugMenuMenuTestMenu::
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
	sub $7
	or h
	jp z, Func_6ac24
	ld a, l
	sub $6
	or h
	jp z, Func_6ac1e
	ld a, l
	sub $5
	or h
	jp z, Func_6ac0b
	ld a, l
	sub $4
	or h
	jp z, Func_6abf7
	ld a, l
	sub $3
	or h
	jp z, Func_6abe3
	ld a, l
	sub $2
	or h
	jp z, Func_6abcf
	ld a, l
	dec a
	or h
	jp z, Func_6abbb
	ld a, l
	or h
	jp nz, Func_6ac27
	jp Func_6ac27

Func_6abbb: ; 6abbb (1a:6bbb)
	set_farcall_addrs_hli StartMenu
	ld hl, $0
	call FarCall
	jp Func_6ac27

Func_6abcf: ; 6abcf (1a:6bcf)
	set_farcall_addrs_hli ReceptionCommandMenu
	ld hl, $0
	call FarCall
	jp Func_6ac27

Func_6abe3: ; 6abe3 (1a:6be3)
	set_farcall_addrs_hli MartMenu
	ld hl, $0
	call FarCall
	jp Func_6ac27

Func_6abf7: ; 6abf7 (1a:6bf7)
	set_farcall_addrs_hli ElevatorMenu
	ld hl, $0
	call FarCall
	jp Func_6ac27

Func_6ac0b: ; 6ac0b (1a:6c0b)
	set_farcall_addrs_hli NamingScreen__
	ld a, $1
	call FarCall
	jp Func_6ac27

Func_6ac1e: ; 6ac1e (1a:6c1e)
	call DispatchMenu
	jp Func_6ac27

Func_6ac24: ; 6ac24 (1a:6c24)
	call AttitudeMenu
Func_6ac27: ; 6ac27 (1a:6c27)
	ld hl, $8000
	ret

Pointers_6ac2b:
	dw Data_6ac2f
	dw $0

Data_6ac2f:
	dstr "(これいしﾞょう はけん てﾞきないよ)"

DispatchMenu:: ; 6ac44 (1a:6c44)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	call Func_6ad7c
	or a
	jp nz, Func_6acc5
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_6ac63
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_6ac77
Func_6ac63: ; 6ac63 (1a:6c63)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_6ac77: ; 6ac77 (1a:6c77)
	callba_hli Func_17470
	call Func_1fbe
	xor a
Func_6ac89: ; 6ac89 (1a:6c89)
	cp $4
	jp nc, Func_6ac9b
	ld e, a
	ld d, $0
	ld hl, wc383
	add hl, de
	ld [hl], $ff
	inc a
	jp Func_6ac89

Func_6ac9b: ; 6ac9b (1a:6c9b)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_68020)
	ld de, Data_68020
	ld hl, Data_68001
	call FarCall
	call Func_2009
	callba_hli Func_17488
	jp Func_6ad77

Func_6acc5: ; 6acc5 (1a:6cc5)
	ld a, $3
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
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6ac2b)
	ld de, Pointers_6ac2b
	ld hl, $10e
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
	pop de
	push de
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
	pop hl
	call Func_680d3
	ld hl, sp+$0
	ld [hl], $0
Func_6ad77: ; 6ad77 (1a:6d77)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	ret

Func_6ad7c: ; 6ad7c (1a:6d7c)
	ld c, $0
Func_6ad7e: ; 6ad7e (1a:6d7e)
	ld a, c
	cp $3
	jp nc, Func_6ada6
	ld l, c
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
	or a
	jp nz, Func_6ada2
	ld a, c
	ld [wc387], a
	jp Func_6ada6

Func_6ada2: ; 6ada2 (1a:6da2)
	inc c
	jp Func_6ad7e

Func_6ada6: ; 6ada6 (1a:6da6)
	ld a, c
	cp $3
	jp nz, Func_6adb1
	ld a, $1
	jp Func_6adb2

Func_6adb1: ; 6adb1 (1a:6db1)
	xor a
Func_6adb2: ; 6adb2 (1a:6db2)
	ret

LookUpRobotSpriteImage:: ; 6adb3 (1a:6db3)
	push af
	ld a, e
	rrca
	rrca
	rrca
	rrca
	and $f
	ld e, a
	pop af
	cp $b
	jp z, Func_6ae2f
	cp $a
	jp z, Func_6ae2a
	cp $9
	jp z, Func_6ae25
	cp $8
	jp z, Func_6ae20
	cp $7
	jp z, Func_6ae1b
	cp $6
	jp z, Func_6ae16
	cp $5
	jp z, Func_6ae11
	cp $4
	jp z, Func_6ae0c
	cp $3
	jp z, Func_6ae07
	cp $2
	jp z, Func_6ae02
	cp $1
	jp z, Func_6adfd
	or a
	jp nz, Func_6ae45
	ld a, $14
	jp Func_6ae46

Func_6adfd: ; 6adfd (1a:6dfd)
	ld a, $2b
	jp Func_6ae46

Func_6ae02: ; 6ae02 (1a:6e02)
	ld a, $2d
	jp Func_6ae46

Func_6ae07: ; 6ae07 (1a:6e07)
	ld a, $2f
	jp Func_6ae46

Func_6ae0c: ; 6ae0c (1a:6e0c)
	ld a, $2c
	jp Func_6ae46

Func_6ae11: ; 6ae11 (1a:6e11)
	ld a, $31
	jp Func_6ae46

Func_6ae16: ; 6ae16 (1a:6e16)
	ld a, $2e
	jp Func_6ae46

Func_6ae1b: ; 6ae1b (1a:6e1b)
	ld a, $30
	jp Func_6ae46

Func_6ae20: ; 6ae20 (1a:6e20)
	ld a, $12
	jp Func_6ae46

Func_6ae25: ; 6ae25 (1a:6e25)
	ld a, $13
	jp Func_6ae46

Func_6ae2a: ; 6ae2a (1a:6e2a)
	ld a, $11
	jp Func_6ae46

Func_6ae2f: ; 6ae2f (1a:6e2f)
	ld a, e
	cp $1
	jp c, Func_6ae40
	ld a, e
	cp $8
	jp nc, Func_6ae40
	ld a, $16
	jp Func_6ae42

Func_6ae40: ; 6ae40 (1a:6e40)
	ld a, $15
Func_6ae42: ; 6ae42 (1a:6e42)
	jp Func_6ae46

Func_6ae45: ; 6ae45 (1a:6e45)
	xor a
Func_6ae46: ; 6ae46 (1a:6e46)
	ret

Func_6ae47::
	add sp, -$24
	or a
	jp nz, Func_6aed0
	ld hl, sp+$0
	ld [hl], $0
	xor a
Func_6ae52: ; 6ae52 (1a:6e52)
	cp $a8
	jp nc, Func_6ae7b
	push af
	set_farcall_addrs_hli Func_53b1e
	pop af
	push af
	ld e, $1
	call FarCall
	cp $1
	jp nz, Func_6ae76
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_6ae76: ; 6ae76 (1a:6e76)
	pop af
	inc a
	jp Func_6ae52

Func_6ae7b: ; 6ae7b (1a:6e7b)
	ld de, $19
	ld a, $3
	call GetBanks_1a
	ld e, a
	ld a, $1
	ld [wcb57], a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	write_hl_to wcb55
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$1
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$20
	ld a, [hl]
	or $4
	ld hl, sp+$20
	ld [hl], a
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$1
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	jp Func_6af0a

Func_6aed0: ; 6aed0 (1a:6ed0)
	ld e, $0
Func_6aed2: ; 6aed2 (1a:6ed2)
	ld a, e
	cp $4
	jp nc, Func_6af0a
	push de
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$3
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	pop de
	ld hl, sp+$20
	ld a, [hl]
	and $4
	cp $1
	jp nz, Func_6af06
	ld hl, sp+$20
	ld a, [hl]
	and $b
	ld hl, sp+$20
	ld [hl], a
	jp Func_6af0a

Func_6af06: ; 6af06 (1a:6f06)
	inc e
	jp Func_6aed2

Func_6af0a: ; 6af0a (1a:6f0a)
	add sp, $24
	ret

Func_6af0d:: ; 6af0d (1a:6f0d)
	push af
	inc e
	dec e
	jp nz, Func_6af88
	push de
	set_farcall_addrs_hli Func_4ed70
	pop de
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6af85
	set_farcall_addrs_hli Func_4ed70
	ld e, $2
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6af72
	set_farcall_addrs_hli Func_6f785
	ld a, $1
	call FarCall
	or a
	jp nz, Func_6af6d
	set_farcall_addrs_hli Func_4ed70
	ld e, $0
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
	jp Func_6af9b

Func_6af6d: ; 6af6d (1a:6f6d)
	ld a, $ff
	jp Func_6af9b

Func_6af72: ; 6af72 (1a:6f72)
	callba_hli Func_fb205
	ld a, $1
	jp Func_6af9b

Func_6af85: ; 6af85 (1a:6f85)
	jp Func_6af9b

Func_6af88: ; 6af88 (1a:6f88)
	push de
	set_farcall_addrs_hli Func_4ed70
	pop de
	ld hl, sp+$1
	ld a, [hl]
	call FarCall
Func_6af9b: ; 6af9b (1a:6f9b)
	pop bc
	ret

Func_6af9d::
	push hl
	add sp, -$16
	ld hl, sp+$16
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
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
	reg16swap de, hl
	push de
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
	ld hl, $64
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	pop bc
	pop de
	push bc
	push de
	ld a, e
	ld e, $1
	call Func_6810b
	push af
	ld l, $0
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop hl
	pop af
	pop de
	cp $1
	jp nz, Func_6b28f
	push de
	ld de, $19
	ld a, $3
	call GetBanks_1a
	pop de
	push af
	push de
	set_farcall_addrs_hli Func_55f95
	pop de
	push de
	ld hl, sp+$9
	ld c, $0
	call FarCall
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld a, [hl]
	pop de
	push de
	push af
	ld hl, wc9a3
	add hl, de
	ld a, [hl]
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld [hl], a
	pop af
	pop de
	ld hl, wc9a3
	add hl, de
	ld [hl], a
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $9
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $a
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld [hl], $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $9
	add hl, de
	ld [hl], $0
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $a
	add hl, de
	ld [hl], $0
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_6b189
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b189
Func_6b13f: ; 6b13f (1a:713f)
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b183
	callba_hli Func_1535c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	cp $ff
	jp z, Func_6b180
	jp Func_6b189

Func_6b180: ; 6b180 (1a:7180)
	jp Func_6b186

Func_6b183: ; 6b183 (1a:7183)
	jp Func_6b189

Func_6b186: ; 6b186 (1a:7186)
	jp Func_6b13f

Func_6b189: ; 6b189 (1a:7189)
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp z, Func_6b1f2
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b1f2
Func_6b1a8: ; 6b1a8 (1a:71a8)
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b1ec
	callba_hli Func_1535c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	cp $ff
	jp z, Func_6b1e9
	jp Func_6b1f2

Func_6b1e9: ; 6b1e9 (1a:71e9)
	jp Func_6b1ef

Func_6b1ec: ; 6b1ec (1a:71ec)
	jp Func_6b1f2

Func_6b1ef: ; 6b1ef (1a:71ef)
	jp Func_6b1a8

Func_6b1f2: ; 6b1f2 (1a:71f2)
	ld hl, sp+$6
	ld a, [hl]
	or a
	jp z, Func_6b25b
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b25b
Func_6b211: ; 6b211 (1a:7211)
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_6b255
	callba_hli Func_1535c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	cp $ff
	jp z, Func_6b252
	jp Func_6b25b

Func_6b252: ; 6b252 (1a:7252)
	jp Func_6b258

Func_6b255: ; 6b255 (1a:7255)
	jp Func_6b25b

Func_6b258: ; 6b258 (1a:7258)
	jp Func_6b211

Func_6b25b: ; 6b25b (1a:725b)
	pop af
	call GetSRAMBank
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$5
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld de, Data_6b2ff
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $1
	jp Func_6b2a4

Func_6b28f: ; 6b28f (1a:728f)
	push hl
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld de, Data_6b30c
	ld hl, $10e
	call PlaceStringDEatCoordHL
	pop hl
Func_6b2a4: ; 6b2a4 (1a:72a4)
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli WaitAorBButtonOverworld_17a44
	pop hl
	pop bc
	push hl
	push bc
	ld a, l
	cp $1
	jp z, Func_6b2d2
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call PopBGMapRegion
Func_6b2d2: ; 6b2d2 (1a:72d2)
	pop hl
	call Func_680d3
	pop hl
	ld a, l
	cp $1
	jp nz, Func_6b2f1
	callba_hli Func_15330
	ld hl, rIE
	jp Func_6b2f4

Func_6b2f1: ; 6b2f1 (1a:72f1)
	ld hl, $8000
Func_6b2f4: ; 6b2f4 (1a:72f4)
	reg16swap de, hl
	add sp, $18
	reg16swap de, hl
	ret

Data_6b2ff:
	dstr "(を そうひﾞしました)"

Data_6b30c:
	dstr "(そうひﾞ てﾞきません)"

AttitudeMenu:: ; 6b31a (1a:731a)
	push bc
	push bc
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	call WriteHLToSPPlus4
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
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	call GetHLAtSPPlus4
	ld de, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpAttrMapRectangle
	ld c, $0
	ld hl, sp+$0
	ld [hl], c
	ld hl, sp+$1
	ld [hl], $0
Func_6b376: ; 6b376 (1a:7376)
	ld hl, sp+$1
	ld a, [hl]
	cp $3
	jp nc, Func_6b442
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
	jp nz, Func_6b438
	ld c, $1
	push bc
	ld hl, sp+$3
	ld a, [hl]
	call Func_6bdfa
	pop bc
	cp $ff
	jp z, Func_6b3cb
	or a
	jp nz, Func_6b438
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
	ld [hl], $2
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_6b438

Func_6b3cb: ; 6b3cb (1a:73cb)
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
	ld [hl], $2
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	xor a
Func_6b3e9: ; 6b3e9 (1a:73e9)
	cp $4
	jp nc, Func_6b40c
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
	ld de, $a
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $1
	inc a
	jp Func_6b3e9

Func_6b40c: ; 6b40c (1a:740c)
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
	ld de, $e
	add hl, de
	ld [hl], $0
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
	ld de, $f
	add hl, de
	ld [hl], $0
Func_6b438: ; 6b438 (1a:7438)
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	jp Func_6b376

Func_6b442: ; 6b442 (1a:7442)
	inc c
	dec c
	jp nz, Func_6b450
	ld e, $9
	xor a
	call Func_6bbf3
	jp Func_6b468

Func_6b450: ; 6b450 (1a:7450)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_6b460
	ld e, $1
	xor a
	call Func_6bbf3
	jp Func_6b468

Func_6b460: ; 6b460 (1a:7460)
	ld hl, sp+$0
	ld e, [hl]
	ld a, $a
	call Func_6bbf3
Func_6b468: ; 6b468 (1a:7468)
	ld hl, sp+$0
	ld [hl], $0
	ld c, $0
Func_6b46e: ; 6b46e (1a:746e)
	ld a, c
	cp $3
	jp nc, Func_6b4ae
	ld l, c
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
	cp $2
	jp nz, Func_6b4aa
	push bc
	ld hl, sp+$2
	ld e, [hl]
	ld a, $b
	call Func_6bbf3
	pop bc
	push bc
	ld a, c
	call GetHLAtSPPlus6
	reg16swap de, hl
	call Func_6b4e8
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop bc
Func_6b4aa: ; 6b4aa (1a:74aa)
	inc c
	jp Func_6b46e

Func_6b4ae: ; 6b4ae (1a:74ae)
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	call GetHLAtSPPlus4
	ld de, $64
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
	call GetHLAtSPPlus4
	call Func_680d3
	pop bc
	pop bc
	ret

Func_6b4e8: ; 6b4e8 (1a:74e8)
	push af
	push de
	add sp, -$62
	ld c, $0
	ld hl, sp+$65
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
	ld de, $a
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_6b558
	ld hl, sp+$65
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
	ld de, $b
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_6b558
	ld hl, sp+$65
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
	ld de, $c
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_6b558
	ld hl, sp+$65
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
	ld de, $d
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_6b558
	ld c, $2
Func_6b558: ; 6b558 (1a:7558)
	push bc
	ld hl, sp+$62
	ld [hl], $0
GetRobotInPartyd: ; 6b55d (1a:755d)
	ld hl, sp+$62
	ld a, [hl]
	cp $4
	jp nc, Func_6b5ec
	ld hl, sp+$62
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
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
	ld de, $a
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $1
	jp nz, Func_6b5e2
	set_farcall_addrs_hli Func_7dfc
	ld hl, sp+$62
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
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
	ld a, [hl]
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld hl, $1
	write_hl_to_sp_plus $10
	set_farcall_addrs_hli Func_7db0
	ld hl, sp+$62
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
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
	ld a, [hl]
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
Func_6b5e2: ; 6b5e2 (1a:75e2)
	ld hl, sp+$62
	ld a, [hl]
	inc a
	ld hl, sp+$62
	ld [hl], a
	jp GetRobotInPartyd

Func_6b5ec: ; 6b5ec (1a:75ec)
	pop bc
	push bc
	ld a, c
	cp $2
	jp nz, Func_6b5f9
	ld e, c
	xor a
	call Func_6bbf3
Func_6b5f9: ; 6b5f9 (1a:75f9)
	pop bc
	push bc
	ld a, c
	cp $2
	jp z, Func_6b745
	ld hl, sp+$61
	ld [hl], $0
	ld c, $0
Func_6b607: ; 6b607 (1a:7607)
	ld a, c
	cp $4
	jp nc, Func_6b737
	ld hl, sp+$67
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
	ld de, $a
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_6b6d4
	push bc
	set_farcall_addrs_hli Func_6f1eb
	pop bc
	push bc
	ld e, c
	ld hl, sp+$69
	ld a, [hl]
	call FarCall
	pop bc
	push af
	push bc
	set_farcall_addrs_hli GetName
	pop bc
	push bc
	ld hl, sp+$47
	push hl
	ld hl, sp+$6d
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
	ld l, [hl]
	ld h, $0
	ld de, $700
	add hl, de
	pop de
	ld c, $6
	call FarCall
	pop bc
	pop af
	push bc
	cp $1
	jp c, Func_6b6d0
	push af
	ld hl, sp+$65
	ld [hl], $1
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
	call Func_680f6
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$47
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	pop af
	ld l, a
	ld h, $0
	push hl
	ld hl, Data_6ba07
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld e, $0
	ld a, $4
	call Func_6bbf3
Func_6b6d0: ; 6b6d0 (1a:76d0)
	pop bc
	jp Func_6b733

Func_6b6d4: ; 6b6d4 (1a:76d4)
	push bc
	set_farcall_addrs_hli Func_7dfc
	ld hl, sp+$64
	ld c, [hl]
	ld b, $0
	ld hl, sp+$69
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
	ld a, [hl]
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	ld hl, $1
	write_hl_to_sp_plus $12
	set_farcall_addrs_hli Func_7db0
	ld hl, sp+$64
	ld c, [hl]
	ld b, $0
	ld hl, sp+$69
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
	ld a, [hl]
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	pop bc
Func_6b733: ; 6b733 (1a:7733)
	inc c
	jp Func_6b607

Func_6b737: ; 6b737 (1a:7737)
	ld hl, sp+$61
	ld a, [hl]
	or a
	jp nz, Func_6b745
	ld e, $0
	ld a, $5
	call Func_6bbf3
Func_6b745: ; 6b745 (1a:7745)
	pop bc
	ld hl, sp+$65
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
	ld de, $e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_6b99e
	ld a, c
	cp $2
	jp z, Func_6b99e
	ld e, $0
	ld a, $6
	call Func_6bbf3
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$23
	push hl
	ld hl, sp+$67
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
	ld l, [hl]
	ld h, $0
	ld de, $700
	add hl, de
	pop de
	call FarCall
	ld de, $19
	ld a, $3
	call GetBanks_1a
	push af
	set_farcall_addrs_hli GetName
	ld hl, sp+$67
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
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $3
	jp z, Func_6b81d
	cp $2
	jp z, Func_6b7f6
	cp $1
	jp nz, Func_6b83f
	ld c, $a
	ld hl, sp+$43
	push hl
	ld hl, sp+$69
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
	ld de, $f
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $3ff
	add hl, de
	pop de
	call FarCall
	jp Func_6b83f

Func_6b7f6: ; 6b7f6 (1a:77f6)
	ld c, $5
	ld hl, sp+$43
	push hl
	ld hl, sp+$69
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
	ld de, $f
	add hl, de
	ld a, [hl]
	and $3f
	ld l, a
	ld h, $0
	dec hl
	pop de
	call FarCall
	jp Func_6b83f

Func_6b81d: ; 6b81d (1a:781d)
	ld c, $8
	ld hl, sp+$43
	push hl
	ld hl, sp+$69
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
	ld de, $f
	add hl, de
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	pop de
	call FarCall
Func_6b83f: ; 6b83f (1a:783f)
	pop af
	call GetSRAMBank
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
	call Func_680f6
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$23
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld hl, Data_6ba15
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$41
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld hl, Data_6ba1c
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
	ld a, $7
	call Func_6bbf3
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	read_hl_from_sp_plus $64
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	read_hl_from_sp_plus $64
	ld de, $64
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
	ld hl, sp+$65
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
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $3
	jp z, Func_6b96d
	cp $2
	jp z, Func_6b939
	cp $1
	jp nz, Func_6b99e
	set_farcall_addrs_hli Func_5a0e0
	ld c, $0
	ld hl, sp+$65
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
	ld de, $f
	add hl, de
	ld a, [hl]
	ld e, $1
	call FarCall
	cp $ff
	jp nz, Func_6b936
	ld e, $0
	ld a, $d
	call Func_6bbf3
Func_6b936: ; 6b936 (1a:7936)
	jp Func_6b99e

Func_6b939: ; 6b939 (1a:7939)
	set_farcall_addrs_hli Func_4ed5d
	ld hl, sp+$65
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
	ld de, $f
	add hl, de
	ld a, [hl]
	ld e, $0
	call FarCall
	cp $ff
	jp nz, Func_6b96a
	ld e, $0
	ld a, $d
	call Func_6bbf3
Func_6b96a: ; 6b96a (1a:796a)
	jp Func_6b99e

Func_6b96d: ; 6b96d (1a:796d)
	set_farcall_addrs_hli Func_6af0d
	ld hl, sp+$65
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
	ld de, $f
	add hl, de
	ld a, [hl]
	ld e, $0
	call FarCall
	cp $ff
	jp nz, Func_6b99e
	ld e, $0
	ld a, $d
	call Func_6bbf3
Func_6b99e: ; 6b99e (1a:799e)
	ld hl, sp+$65
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
	ld [hl], $0
	ld hl, sp+$65
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
	ld de, $e
	add hl, de
	ld [hl], $0
	ld hl, sp+$65
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
	ld de, $f
	add hl, de
	ld [hl], $0
	xor a
Func_6b9e1: ; 6b9e1 (1a:79e1)
	cp $4
	jp nc, Func_6ba04
	ld hl, sp+$65
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
	ld de, $a
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	inc a
	jp Func_6b9e1

Func_6ba04: ; 6ba04 (1a:7a04)
	add sp, $66
	ret

Data_6ba07:
	dstr "(は)レヘﾞル(かﾞ)%d"

Data_6ba15:
	dstr "(たちは )"

Data_6ba1c:
	dstr "(を)"

Pointers_6ba20:
	dw Data_6ba26
	dw Data_6ba37
	dw $0

Data_6ba26:
	dstr "(はけんした)ハﾟーティー(は)"

Data_6ba37:
	dstr "(かえってきているよ!)"

Pointers_6ba44:
	dw Data_6ba4a
	dw Data_6ba5b
	dw $0

Data_6ba4a:
	dstr "(はけんした)ハﾟーティー(は)"

Data_6ba5b:
	dstr "(またﾞ かえってきて いないね#)"

Pointers_6ba6e:
	dw Data_6ba78
	dw Data_6ba89
	dw Data_6ba99
	dw Data_6baac
	dw $0

Data_6ba78:
	dstr "(はけんした)ハﾟーティー(は)"

Data_6ba89:
	dstr "(かえってきてはいるけとﾞ#)"

Data_6ba99:
	dstr "ホﾞロホﾞロ(のしﾞょうたいたﾞね)"

Data_6baac:
	dstr "(むりを させすきﾞしﾞゃないの?)"

Pointers_6babf:
	dw Data_6bac3
	dw $0

Data_6bac3:
	dstr "(その)ロホﾞホﾟン(は はけん されているよ)"

Pointers_6badc:
	dw Data_6bae0
	dw $0

Data_6bae0:
	dstr "(あかﾞったよ)"

Pointers_6bae9:
	dw Data_6baf3
	dw Data_6bb08
	dw Data_6bb20
	dw Data_6bb2e
	dw $0

Data_6baf3:
	dstr "(こんかいの はけんてﾞ)レヘﾞル(の)"

Data_6bb08:
	dstr "アッフﾟ(した) ロホﾞホﾟン(は いないね)"

Data_6bb20:
	dstr "(らくを させすきﾞても)"

Data_6bb2e:
	dstr "レヘﾞル(は あかﾞらないよ)"

Pointers_6bb3e:
	dw Data_6bb44
	dw Data_6bb56
	dw $0

Data_6bb44:
	dstr "(そうそう たひﾞのとちゅうてﾞ)"

Data_6bb56:
	dstr "(なにかを みつけてきたようたﾞね)"

Pointers_6bb69:
	dw Data_6bb6d
	dw $0

Data_6bb6d:
	dstr "(みつけてきた)"

Pointers_6bb76:
	dw Data_6bb7c
	dw Data_6bb8f
	dw $0

Data_6bb7c:
	dstr "(はけんしている)ハﾟーティー(は)"

Data_6bb8f:
	dstr "(いないよ)"

Pointers_6bb96:
	dw Data_6bb9a
	dw $0

Data_6bb9a:
	dstr "(かえってきてるよ)"

Pointers_6bba5:
	dw Data_6bba9
	dw $0

Data_6bba9:
	dstr "(くみめの) ハﾟーティー"

Pointers_6bbb7:
	dw Data_6bbbd
	dw Data_6bbd1
	dw $0

Data_6bbbd:
	dstr "(はけんにたﾞすときに たいりょくを)"

Data_6bbd1:
	dstr "(かいふく させとくよ!)"

Pointers_6bbdf:
	dw Data_6bbe3
	dw $0

Data_6bbe3:
	dstr "(いっはﾟいなのてﾞ すてた)"

Func_6bbf3:: ; 6bbf3 (1a:7bf3)
	push de
	push af
	cp $4
	jp z, Func_6bc1a
	cp $7
	jp z, Func_6bc1a
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_680f6
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_6bc1a: ; 6bc1a (1a:7c1a)
	pop af
	pop de
	cp $d
	jp z, Func_6bdc7
	cp $c
	jp z, Func_6bdae
	cp $b
	jp z, Func_6bd7e
	cp $a
	jp z, Func_6bd4f
	cp $7
	jp z, Func_6bd36
	cp $6
	jp z, Func_6bd1d
	cp $5
	jp z, Func_6bd04
	cp $4
	jp z, Func_6bceb
	cp $8
	jp z, Func_6bcab
	cp $3
	jp z, Func_6bcab
	or a
	jp nz, Func_6bddd
	push de
	set_farcall_addrs_hli PrintMapText_
	pop de
	ld a, e
	cp $9
	jp z, Func_6bc9d
	cp $2
	jp z, Func_6bc8f
	cp $1
	jp z, Func_6bc81
	or a
	jp nz, Func_6bca8
	ld c, BANK(Pointers_6ba20)
	ld de, Pointers_6ba20
	ld hl, $10e
	call FarCall
	jp Func_6bca8

Func_6bc81: ; 6bc81 (1a:7c81)
	ld c, BANK(Pointers_6ba44)
	ld de, Pointers_6ba44
	ld hl, $10e
	call FarCall
	jp Func_6bca8

Func_6bc8f: ; 6bc8f (1a:7c8f)
	ld c, BANK(Pointers_6ba6e)
	ld de, Pointers_6ba6e
	ld hl, $10e
	call FarCall
	jp Func_6bca8

Func_6bc9d: ; 6bc9d (1a:7c9d)
	ld c, BANK(Pointers_6bb76)
	ld de, Pointers_6bb76
	ld hl, $10e
	call FarCall
Func_6bca8: ; 6bca8 (1a:7ca8)
	jp Func_6bddd

Func_6bcab: ; 6bcab (1a:7cab)
	push af
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6babf)
	ld de, Pointers_6babf
	ld hl, $10e
	call FarCall
	pop af
	cp $3
	jp nz, Func_6bce8
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call Func_681a6
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_6bce8: ; 6bce8 (1a:7ce8)
	jp Func_6bddd

Func_6bceb: ; 6bceb (1a:7ceb)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6badc)
	ld de, Pointers_6badc
	ld hl, $110
	call FarCall
	jp Func_6bddd

Func_6bd04: ; 6bd04 (1a:7d04)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bae9)
	ld de, Pointers_6bae9
	ld hl, $10e
	call FarCall
	jp Func_6bddd

Func_6bd1d: ; 6bd1d (1a:7d1d)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bb3e)
	ld de, Pointers_6bb3e
	ld hl, $10e
	call FarCall
	jp Func_6bddd

Func_6bd36: ; 6bd36 (1a:7d36)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bb69)
	ld de, Pointers_6bb69
	ld hl, $110
	call FarCall
	jp Func_6bddd

Func_6bd4f: ; 6bd4f (1a:7d4f)
	push de
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop de
	ld l, e
	ld h, $0
	push hl
	ld hl, Data_6bdde
	push hl
	call PlaceString
	pop bc
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bb96)
	ld de, Pointers_6bb96
	ld hl, $110
	call FarCall
	jp Func_6bddd

Func_6bd7e: ; 6bd7e (1a:7d7e)
	push de
	ld e, $e
	ld a, $1
	call SetStringStartState
	pop de
	ld l, e
	ld h, $0
	inc hl
	push hl
	ld hl, Data_6bdf5
	push hl
	call PlaceString
	pop bc
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bba5)
	ld de, Pointers_6bba5
	ld hl, $30e
	call FarCall
	jp Func_6bddd

Func_6bdae: ; 6bdae (1a:7dae)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bbb7)
	ld de, Pointers_6bbb7
	ld hl, $10e
	call FarCall
	jp Func_6bddd

Func_6bdc7: ; 6bdc7 (1a:7dc7)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_6bbdf)
	ld de, Pointers_6bbdf
	ld hl, $10e
	call FarCall
Func_6bddd: ; 6bddd (1a:7ddd)
	ret

Data_6bdde:
	dstr "(はけんした) ハﾟーティー(は %dくみ)"

Data_6bdf5:
	dstr "(%d)"

Func_6bdfa: ; 6bdfa (1a:7dfa)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$6
	call FarCall
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$8
	ld c, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	push hl
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$f
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
	ld de, $6
	add hl, de
	ld c, [hl]
	ld hl, sp+$f
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
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$f
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
	ld de, $5
	add hl, de
	ld e, [hl]
	call FarCall
	reg16swap de, hl
	push de
	ld hl, sp+$11
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
	ld de, $7
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld hl, sp+$11
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
	ld de, $8
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, bc
	call WriteHLToSPPlus10
	pop de
	pop hl
	ld a, e
	sub l
	ld a, d
	sbc h
	jp nc, Func_6beda
	xor a
	jp Func_6bf38

Func_6beda: ; 6beda (1a:7eda)
	call CompareHLtoDE
	jp nz, Func_6bef8
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp c, Func_6bef3
	xor a
	jp Func_6bf38

Func_6bef3: ; 6bef3 (1a:7ef3)
	ld a, $1
	jp Func_6bf38

Func_6bef8: ; 6bef8 (1a:7ef8)
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	push hl
	ld a, $6
	sub l
	ld a, $0
	sbc h
	jp nc, Func_6bf0e
	ld a, $ff
	jp Func_6bf38

Func_6bf0e: ; 6bf0e (1a:7f0e)
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	push bc
	call GetHLAtSPPlus4
	ld de, $5a0
	call MultiplyHLbyDE
	pop bc
	add hl, bc
	ld a, $70
	sub l
	ld a, $17
	sbc h
	jp nc, Func_6bf36
	ld a, $ff
	jp Func_6bf38

Func_6bf36: ; 6bf36 (1a:7f36)
	ld a, $1
Func_6bf38: ; 6bf38 (1a:7f38)
	add sp, $e
	ret


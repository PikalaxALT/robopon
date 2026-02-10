INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 13", ROMX
Func_4c000: ; 4c000
	ret

Data_4c001: ; 4c001
	db $04, $00, $0c, $0d, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $13, $8a, $46, $13, $85, $4b, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $2c, $40, $37, $40, $3f, $40, $49, $40, $56, $40, $63, $40, $ca, $df, $b0, $c3, $a8, $b0, $ca, $de, $c4, $d9, $00, $c0, $b2, $c4, $d9, $cf, $af, $c1, $00, $c9, $dd, $c0, $b2, $c4, $d9, $cf, $af, $c1, $00, $db, $ce, $de, $ce, $df, $dd, $28, $ba, $b3, $b6, $dd, $29, $00, $db, $ce, $de, $ce, $df, $dd, $28, $b1, $b9, $de, $d9, $29, $00, $db, $ce, $de, $ce, $df, $dd, $28, $d3, $d7, $b3, $29, $00

Data_4c06f: ; 4c06f
	db $00, $00, $00, $00, $ff, $ff, $06, $00, $06, $00, $00, $00, $20, $40, $00

Data_4c07e: ; 4c07e
	db $00, $01, $08, $0b, $13, $f9, $4c, $05, $00, $00, $13, $b2, $4e, $13, $85, $4f, $13, $8d, $4f, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00

Data_4c09d: ; 4c09d
	db $00, $00, $00, $00, $ff, $ff, $05, $00, $05, $00, $ff, $ff, $00, $00, $1a

Func_4c0ac: ; 4c0ac (13:40ac)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_4c0b9: ; 4c0b9 (13:40b9)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_4c0c6: ; 4c0c6 (13:40c6)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Func_4c0d3: ; 4c0d3 (13:40d3)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Data_4c0e8: ; 4c0e8
	db $f2, $40, $03, $41, $0e, $41, $1d, $41, $00, $00, $28, $c2, $b3, $bc, $dd, $c9, $20, $bc, $de, $ad, $dd, $cb, $de, $b6, $de, $29, $00, $28, $c3, $de, $b7, $c3, $b2, $cf, $be, $dd, $29, $00, $28, $c2, $b3, $bc, $dd, $29, $b9, $b0, $cc, $de, $d9, $28, $a6, $29, $00, $28, $be, $c2, $bf, $de, $b8, $bc, $c3, $b8, $c0, $de, $bb, $b2, $29, $00

Func_4c12c:: ; 4c12c
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	call Func_4c0b9
	call Func_4c2a3
	or a
	jp nz, Func_4c1f5
	set_farcall_addrs_hli Func_da901
	ld de, $1402
	ld hl, $8
	call FarCall
	push hl
	callba_hli Func_6fe0
	pop hl
	or a
	jp nz, Func_4c1cf
	push hl
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	call Func_4c4b3
Func_4c176: ; 4c176 (13:4176)
	call Func_4c323
	ld a, [wc38d]
	cp $ff
	jp z, Func_4c197
	call Func_4c3de
	cp $ff
	jp z, Func_4c194
	push af
	call Func_1f30
	pop af
	call Func_4cf91
	call Func_1f7b
Func_4c194: ; 4c194 (13:4194)
	jp Func_4c19a

Func_4c197: ; 4c197 (13:4197)
	jp Func_4c19d

Func_4c19a: ; 4c19a (13:419a)
	jp Func_4c176

Func_4c19d: ; 4c19d (13:419d)
	xor a
	ld [wc31b], a
	xor a
	ld [wc319], a
	call DisableJoypadInt
	ld a, $81
	ldh [rSC], a
	ld e, $0
Func_4c1ae: ; 4c1ae (13:41ae)
	read_hl_from wGameTimer + 2
	push hl
	read_hl_from wGameTimer
	pop af
	ld a, e
	cp l
	jp nc, Func_4c1c8
	push de
	call NextOverworldFrame
	pop de
	inc e
	jp Func_4c1ae

Func_4c1c8: ; 4c1c8 (13:41c8)
	ld a, $80
	ldh [rSC], a
	jp Func_4c1f5

Func_4c1cf: ; 4c1cf (13:41cf)
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, $13
	ld de, $40e8
	ld hl, $10e
	call FarCall
Func_4c1f5: ; 4c1f5 (13:41f5)
	ret

Func_4c1f6: ; 4c1f6 (13:41f6)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_4c20a: ; 4c20a (13:420a)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_4c21e: ; 4c21e (13:421e)
	push bc
	ld hl, sp+$0
	ld [hl], $ff
	ld a, [wc319]
	cp $81
	jp nz, Func_4c23c
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_4c20a
	jp Func_4c24a

Func_4c23c: ; 4c23c (13:423c)
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_4c1f6
Func_4c24a: ; 4c24a (13:424a)
	pop bc
	ret

Func_4c24c: ; 4c24c
	push af
	push bc
	ld a, [wc319]
	cp $81
	jp nz, Func_4c275
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call Func_4c20a
	jp Func_4c291

Func_4c275: ; 4c275 (13:4275)
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call Func_4c20a
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_4c1f6
Func_4c291: ; 4c291 (13:4291)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_4c29e
	xor a
	jp Func_4c2a0

Func_4c29e: ; 4c29e (13:429e)
	ld a, $ff
Func_4c2a0: ; 4c2a0 (13:42a0)
	pop bc
	pop bc
	ret

Func_4c2a3: ; 4c2a3 (13:42a3)
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4c307
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4c318
	ld hl, $110
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	callba_hli Func_1482e
	push hl
	ld a, l
	or h
	jp nz, Func_4c304
	ld a, [wPlayerMapX]
	ld [wSpawnX], a
	ld a, [wPlayerMapY]
	ld [wSpawnY], a
	ld a, [wPlayerMapX]
	ld [wSpawnPushX], a
	ld a, [wPlayerMapY]
	ld [wSpawnPushY], a
	callba_hli SaveGame
Func_4c304: ; 4c304 (13:4304)
	pop hl
	ld a, l
	ret

Data_4c307: ; 4c307
	dstr "(つうしんてﾞ あそふﾞまえに)"

Data_4c318: ; 4c318
	dstr "(きろくしますか)?"

Func_4c323: ; 4c323 (13:4323)
	call FillVisibleAreaWithBlankTile
	check_cgb
	jp nz, Func_4c355
	set_farcall_addrs_hli Func_613fc
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_4c369

Func_4c355: ; 4c355 (13:4355)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4c369: ; 4c369 (13:4369)
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld a, [wc319]
	cp $81
	jp nz, Func_4c3ac
	ld de, Data_4c3be
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4c3c7
	ld hl, $110
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_4c06f)
	ld de, Data_4c06f
	ld hl, Data_4c001
	call FarCall
	jp Func_4c3bc

Func_4c3ac: ; 4c3ac (13:43ac)
	call Func_4c0b9
Func_4c3af: ; 4c3af (13:43af)
	call Func_4c4f8
	or a
	jp nz, Func_4c3b9
	jp Func_4c3bc

Func_4c3b9: ; 4c3b9 (13:43b9)
	jp Func_4c3af

Func_4c3bc: ; 4c3bc (13:43bc)
	xor a
	ret

Data_4c3be: ; 4c3be
	dstr "(ほんしﾞつは)"

Data_4c3c7: ; 4c3c7
	dstr "(とﾞの)モートﾞ(てﾞ あそひﾞますか)?"

Func_4c3de: ; 4c3de (13:43de)
	ld a, [wc38d]
	cp $5
	jp z, Func_4c48a
	cp $4
	jp z, Func_4c481
	or a
	jp z, Func_4c442
	cp $2
	jp z, Func_4c43e
	cp $1
	jp z, Func_4c43e
	cp $3
	jp nz, Func_4c493
	ld a, $ff
	ld [wOptionsMenu_StereoSelect], a
	ld [wOptionsMenu_BattleScene], a
	callba_hli Func_17470
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58d4e)
	ld de, Data_58d4e
	ld hl, Data_58d2f
	call FarCall
	callba_hli Func_17488
	call Func_4c21e
	jp Func_4c4b0

Func_4c43e: ; 4c43e (13:443e)
	call Func_4cbbc
	ret

Func_4c442: ; 4c442 (13:4442)
	callba_hli AllocateMonsterStruct2
	set_farcall_addrs_hli Func_60e81
	ld a, $ff
	call FarCall
	push af
	callba_hli FreeMonsterStruct
	set_farcall_addrs_hli Func_6faba
	pop af
	call FarCall
	jp Func_4c4b0

Func_4c481: ; 4c481 (13:4481)
	call Func_4fb46
	call Func_4c21e
	jp Func_4c4b0

Func_4c48a: ; 4c48a (13:448a)
	call Func_4fedf
	call Func_4c21e
	jp Func_4c4b0

Func_4c493: ; 4c493 (13:4493)
	call Func_4c0ac
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $d
	call FarCall
	call Func_4c0b9
Func_4c4b0: ; 4c4b0 (13:44b0)
	ld a, $ff
	ret

Func_4c4b3: ; 4c4b3 (13:44b3)
	push bc
	ld a, [wc319]
	cp $81
	jp nz, Func_4c4ca
	ld c, $1
	ld de, wc2f9
	ld hl, $1
	call Func_4c1f6
	jp Func_4c4f6

Func_4c4ca: ; 4c4ca (13:44ca)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld hl, sp+$0
	ld a, [wcb57]
	ld [hl], a
	ld a, e
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call Func_4c20a
Func_4c4f6: ; 4c4f6 (13:44f6)
	pop bc
	ret

Func_4c4f8: ; 4c4f8 (13:44f8)
	push bc
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4c5df
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4c5e7
	ld hl, $110
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	set_farcall_addrs_hli Func_7748
	ld c, $0
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	ld [wc38d], a
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp z, Func_4c54a
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp nz, Func_4c5d9
Func_4c54a: ; 4c54a (13:454a)
	ld hl, sp+$0
	ld [hl], $0
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	xor a
Func_4c563: ; 4c563 (13:4563)
	cp $4
	jp nc, Func_4c58c
	push af
	ld l, a
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_4c587
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_4c587: ; 4c587 (13:4587)
	pop af
	inc a
	jp Func_4c563

Func_4c58c: ; 4c58c (13:458c)
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_7766
	ld c, $0
	ld hl, sp+$0
	push de
	push hl
.asm_4c5a1
	pop de
	pop hl
	ld hl, $1
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
.asm_4c5ac
	cp $4
	jp nz, Func_4c5c1
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nz, Func_4c5c1
	call FillVisibleAreaWithBlankTile
	ld a, $1
	jp Func_4c5dd

Func_4c5c1: ; 4c5c1 (13:45c1)
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp nz, Func_4c5d9
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_4c5d9
	call FillVisibleAreaWithBlankTile
	ld a, $1
	jp Func_4c5dd

Func_4c5d9: ; 4c5d9 (13:45d9)
	call FillVisibleAreaWithBlankTile
	xor a
Func_4c5dd: ; 4c5dd (13:45dd)
	pop bc
	ret

Data_4c5df: ; 4c5df
	dstr "(たたﾞいま)"

Data_4c5e7: ; 4c5e7
	dstr "モートﾞ (せんたくちゅう)"

Pointers_4c5f6: ; 4c5f6
	dw Data_4c604
	dw Data_4c611
	dw Data_4c623
	dw Data_4c635
	dw Data_4c64e
	dw Data_4c662
	dw $0

Data_4c604: ; 4c604
	dstr "タイトルマッチ(てﾞは)"

Data_4c611: ; 4c611
	dstr "ヘﾞルト(をかけて たたかいます)"

Data_4c623: ; 4c623
	dstr "(かてはﾞ あいての もっている)"

Data_4c635: ; 4c635
	dstr "ヘﾞルト(を うはﾞうことかﾞ てﾞきますかﾞ)"

Data_4c64e: ; 4c64e
	dstr "(まけると しﾞふﾞんの もっている)"

Data_4c662: ; 4c662
	dstr "ヘﾞルト(を うはﾞわれて しまいます)"

Pointers_4c677: ; 4c677
	dw Data_4c67b
	dw $0

Data_4c67b: ; 4c67b
	dstr "ヘﾞルト(かﾞ ありません)"

Func_4c68a: ; 4c68a
	push bc
	push hl
	call Func_4c0ac
	call Func_4c0b9
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
	ld a, l
	ld hl, sp+$1
	ld [hl], a
	ld hl, sp+$1
	ld a, [hl]
	cp $1
	jp nz, Func_4c726
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld a, [wcb57]
	ld l, a
	push hl
	ld a, e
	call GetSRAMBank
	pop hl
	ld a, [wc2f9]
	cp $1
	jp nz, Func_4c6f5
	ld a, l
	cp $1
	jp nz, Func_4c6f5
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4c5f6)
	ld de, Pointers_4c5f6
	ld hl, $10e
	call FarCall
	jp Func_4c726

Func_4c6f5: ; 4c6f5 (13:46f5)
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4c677)
	ld de, Pointers_4c677
	ld hl, $10e
	call FarCall
	ld a, $4
	call Func_4ca74
	ld hl, $8000
	jp Func_4c8f7

Func_4c726: ; 4c726 (13:4726)
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp z, Func_4c78f
	cp $4
	jp z, Func_4c783
	or a
	jp z, Func_4c777
	cp $2
	jp z, Func_4c76b
	cp $1
	jp z, Func_4c75f
	cp $3
	jp nz, Func_4c798
	ld de, Data_4c8f9
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_4c798

Func_4c75f: ; 4c75f (13:475f)
	ld de, Data_4c908
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_4c798

Func_4c76b: ; 4c76b (13:476b)
	ld de, Data_4c914
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_4c798

Func_4c777: ; 4c777 (13:4777)
	ld de, Data_4c922
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_4c798

Func_4c783: ; 4c783 (13:4783)
	ld de, Data_4c931
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_4c798

Func_4c78f: ; 4c78f (13:478f)
	ld de, Data_4c940
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_4c798: ; 4c798 (13:4798)
	ld hl, sp+$1
	ld a, [hl]
	cp $3
	jp nc, Func_4c7ac
	ld de, Data_4c94e
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_4c7b5

Func_4c7ac: ; 4c7ac (13:47ac)
	ld de, Data_4c95b
	ld hl, $110
	call PlaceStringDEatCoordHL
Func_4c7b5: ; 4c7b5 (13:47b5)
	call Func_4c0b9
	callba_hli Func_1482e
	reg16swap de, hl
	ld a, e
	or d
	jp nz, Func_4c859
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp z, Func_4c7df
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp nz, Func_4c859
Func_4c7df: ; 4c7df (13:47df)
	push de
	ld hl, sp+$2
	ld [hl], $0
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	xor a
Func_4c7f9: ; 4c7f9 (13:47f9)
	cp $4
	jp nc, Func_4c822
	push af
	ld l, a
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_4c81d
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
Func_4c81d: ; 4c81d (13:481d)
	pop af
	inc a
	jp Func_4c7f9

Func_4c822: ; 4c822 (13:4822)
	pop af
	call GetSRAMBank
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp nz, Func_4c841
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nz, Func_4c841
	xor a
	call Func_4ca74
	ld de, $1
	jp Func_4c859

Func_4c841: ; 4c841 (13:4841)
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp nz, Func_4c859
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_4c859
	ld a, $1
	call Func_4ca74
	ld de, $1
Func_4c859: ; 4c859 (13:4859)
	ld a, e
	or d
	jp nz, Func_4c8ef
	ld hl, sp+$1
	ld a, [hl]
	ld [wc38d], a
	set_farcall_addrs_hli Func_7766
	ld c, $0
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp z, Func_4c88d
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp nz, Func_4c8e6
Func_4c88d: ; 4c88d (13:488d)
	set_farcall_addrs_hli Func_7748
	ld c, $0
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp nz, Func_4c8c6
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nz, Func_4c8c6
	ld a, $2
	call Func_4ca74
	ld a, $4
	call Func_4ca74
	ld hl, $8000
	jp Func_4c8f7

Func_4c8c6: ; 4c8c6 (13:48c6)
	ld hl, sp+$1
	ld a, [hl]
	cp $5
	jp nz, Func_4c8e6
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_4c8e6
	ld a, $3
	call Func_4ca74
	ld a, $4
	call Func_4ca74
	ld hl, $8000
	jp Func_4c8f7

Func_4c8e6: ; 4c8e6 (13:48e6)
	call FillVisibleAreaWithBlankTile
	ld hl, -1
	jp Func_4c8f7

Func_4c8ef: ; 4c8ef (13:48ef)
	ld a, $4
	call Func_4ca74
	ld hl, $8000
Func_4c8f7: ; 4c8f7 (13:48f7)
	pop bc
	ret

Data_4c8f9: ; 4c8f9
	dstr "ロホﾞホﾟン(こうかんてﾞ)"

Data_4c908: ; 4c908
	dstr "タイトルマッチ(てﾞ)"

Data_4c914: ; 4c914
	dstr "ノンタイトルマッチ(てﾞ)"

Data_4c922: ; 4c922
	dstr "ハﾟーティーハﾞトル(てﾞ)"

Data_4c931: ; 4c931
	dstr "ロホﾞホﾟン(あけﾞるてﾞ)"

Data_4c940: ; 4c940
	dstr "ロホﾞホﾟン(もらうてﾞ)"

Data_4c94e: ; 4c94e
	dstr "(たいせん しますか)?"

Data_4c95b: ; 4c95b
	dstr "(いいてﾞすか)?"

Pointers_4c965: ; 4c965
	dw Data_4c96b
	dw Data_4c984
	dw $0

Data_4c96b: ; 4c96b
	dstr "ハﾟーティー(に 4たい) ロホﾞホﾟン(かﾞ)"

Data_4c984: ; 4c984
	dstr "(いるから もらえないよ)"

Pointers_4c992: ; 4c992
	dw Data_4c998
	dw Data_4c9b3
	dw $0

Data_4c998: ; 4c998
	dstr "ハﾟーティー(に 1たいしか) ロホﾞホﾟン(かﾞ)"

Data_4c9b3: ; 4c9b3
	dstr "(いないから あけﾞれないよ)"

Pointers_4c9c3: ; 4c9c3
	dw Data_4c9c9
	dw Data_4c9df
	dw $0

Data_4c9c9: ; 4c9c9
	dstr "(あいての) ロホﾞホﾟン(かﾞ 4たい)"

Data_4c9df: ; 4c9df
	dstr "(いるから あけﾞれないよ)"

Pointers_4c9ee: ; 4c9ee
	dw Data_4c9f4
	dw Data_4ca0a
	dw $0

Data_4c9f4: ; 4c9f4
	dstr "(あいての) ロホﾞホﾟン(かﾞ 1たい)"

Data_4ca0a: ; 4ca0a
	dstr "(しかいないから もらえないよ)"

Pointers_4ca1b: ; 4ca1b
	dw Data_4ca21
	dw Data_4ca30
	dw $0

Data_4ca21: ; 4ca21
	dstr "(その) ロホﾞホﾟン(は)"

Data_4ca30: ; 4ca30
	dstr "(あけﾞれないよ)"

Pointers_4ca3a: ; 4ca3a
	dw Data_4ca3e
	dw $0

Data_4ca3e: ; 4ca3e
	dstr "(あけﾞたよ)"

Pointers_4ca46: ; 4ca46
	dw Data_4ca4a
	dw $0

Data_4ca4a: ; 4ca4a
	dstr "(もらったよ)"

Pointers_4ca52: ; 4ca52
	dw Data_4ca58
	dw Data_4ca6b
	dw $0

Data_4ca58: ; 4ca58
	dstr "(たたかえる) ロホﾞホﾟン(かﾞ)"

Data_4ca6b: ; 4ca6b
	dstr "(いなくなるよ)"

Func_4ca74: ; 4ca74 (13:4a74)
	push af
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
	call Func_4c0d3
	pop af
	push af
	cp $4
	jp z, Func_4ca9e
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_4ca9e: ; 4ca9e (13:4a9e)
	set_farcall_addrs_hli PrintMapText_
	pop af
	cp $a
	jp z, Func_4cb59
	cp $9
	jp z, Func_4cb4b
	cp $8
	jp z, Func_4cb3d
	cp $5
	jp z, Func_4cb2f
	cp $4
	jp z, Func_4cb0e
	cp $3
	jp z, Func_4cb00
	cp $2
	jp z, Func_4caf2
	cp $1
	jp z, Func_4cae4
	or a
	jp nz, Func_4cb64
	ld c, BANK(Pointers_4c965)
	ld de, Pointers_4c965
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cae4: ; 4cae4 (13:4ae4)
	ld c, BANK(Pointers_4c992)
	ld de, Pointers_4c992
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4caf2: ; 4caf2 (13:4af2)
	ld c, BANK(Pointers_4c9c3)
	ld de, Pointers_4c9c3
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cb00: ; 4cb00 (13:4b00)
	ld c, BANK(Pointers_4c9ee)
	ld de, Pointers_4c9ee
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cb0e: ; 4cb0e (13:4b0e)
	ld de, Data_4cb65
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4cb6e
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	jp Func_4cb64

Func_4cb2f: ; 4cb2f (13:4b2f)
	ld c, BANK(Pointers_4ca1b)
	ld de, Pointers_4ca1b
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cb3d: ; 4cb3d (13:4b3d)
	ld c, BANK(Pointers_4ca3a)
	ld de, Pointers_4ca3a
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cb4b: ; 4cb4b (13:4b4b)
	ld c, BANK(Pointers_4ca46)
	ld de, Pointers_4ca46
	ld hl, $10e
	call FarCall
	jp Func_4cb64

Func_4cb59: ; 4cb59 (13:4b59)
	ld c, BANK(Pointers_4ca52)
	ld de, Pointers_4ca52
	ld hl, $10e
	call FarCall
Func_4cb64: ; 4cb64 (13:4b64)
	ret

Data_4cb65: ; 4cb65
	dstr "(ほんしﾞつは)"

Data_4cb6e: ; 4cb6e
	dstr "(とﾞの)モートﾞ(てﾞ あそひﾞますか)?"

Func_4cb85: ; 4cb85
	ld a, $ff
	ld [wc38d], a
	set_farcall_addrs_hli Func_7766
	ld c, $0
	ld de, wc38d
	ld hl, $1
	call FarCall
	call FillVisibleAreaWithBlankTile
	ld hl, -1
	ret

Pointers_4cba7: ; 4cba7
	dw Data_4cbab
	dw $0

Data_4cbab: ; 4cbab
	dstr "スクラッフﾟ(に なっているよ)"

Func_4cbbc: ; 4cbbc (13:4bbc)
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Pointers_4cba7
	ld bc, $4
	call MemCopy
Func_4cbcf: ; 4cbcf (13:4bcf)
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $3
	call FarCall
	ld a, l
	cp $4
	jp nc, Func_4cc44
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	call FarCall
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_4cc09
	jp Func_4cc47

Func_4cc09: ; 4cc09 (13:4c09)
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
	call Func_4c0d3
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $13
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call FarCall
Func_4cc44: ; 4cc44 (13:4c44)
	jp Func_4cbcf

Func_4cc47: ; 4cc47 (13:4c47)
	ld a, [wc38d]
	cp $1
	jp nz, Func_4cc4f
Func_4cc4f: ; 4cc4f (13:4c4f)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_4c09d)
	ld de, Data_4c09d
	ld hl, Data_4c07e
	call FarCall
	call WriteHLToSPPlus8
	ld a, [wc319]
	cp $81
	jp nz, Func_4cc8f
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $2
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2
	call Func_4c20a
	jp Func_4ccab

Func_4cc8f: ; 4cc8f (13:4c8f)
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2
	call Func_4c20a
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $2
	call Func_4c1f6
Func_4ccab: ; 4ccab (13:4cab)
	call GetHLAtSPPlus8
	ld a, l
	and h
	inc a
	jp z, Func_4ccbd
	call GetHLAtSPPlus6
	ld a, l
	and h
	inc a
	jp nz, Func_4ccc2
Func_4ccbd: ; 4ccbd (13:4cbd)
	ld a, $ff
	jp Func_4ccc6

Func_4ccc2: ; 4ccc2 (13:4cc2)
	call GetHLAtSPPlus8
	ld a, l
Func_4ccc6: ; 4ccc6 (13:4cc6)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Pointers_4cccb: ; 4cccb
	dw Data_4ccd5
	dw Data_4ccdb
	dw Data_4cce3
	dw Data_4cceb
	dw Data_4ccf2

Data_4ccd5: ; 4ccd5
	dstr "ハﾞトラー"

Data_4ccdb: ; 4ccdb
	dstr "シﾞャンハﾟー"

Data_4cce3: ; 4cce3
	dstr "スヒﾟータﾞー"

Data_4cceb: ; 4cceb
	dstr "シールタﾞー"

Data_4ccf2: ; 4ccf2
	dstr "ハﾟンチャー"

Func_4ccf9: ; 4ccf9
	push bc
	push bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$1
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$0
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
	call Func_4c0ac
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call Func_4c0d3
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus4
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	add $2
	ld hl, sp+$1
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
Func_4cd52: ; 4cd52 (13:4d52)
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_4cd88
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, Pointers_4cccb
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$2
	ld a, [hl]
	add $2
	ld hl, sp+$2
	ld [hl], a
	pop bc
	inc c
	jp Func_4cd52

Func_4cd88: ; 4cd88 (13:4d88)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4cdb1
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4cdc3
	ld hl, $110
	call PlaceStringDEatCoordHL
	xor a
	call Func_4ce6c
	call Func_4c0b9
	ld hl, $4000
	pop bc
	pop bc
	ret

Data_4cdb1: ; 4cdb1
	dstr "(たいせんする) ステーシﾞ(を)"

Data_4cdc3: ; 4cdc3
	dstr "(えらんてﾞくたﾞさい)"

Pointers_4cdd0: ; 4cdd0
	dw Data_4cde4
	dw Data_4cdf6
	dw Data_4ce01
	dw Data_4ce0b
	dw Data_4ce1a

Pointers_4cdda: ; 4cdda
	dw Data_4ce27
	dw Data_4ce32
	dw Data_4ce41
	dw Data_4ce4f
	dw Data_4ce5c

Data_4cde4: ; 4cde4
	dstr "(つうしﾞょうの)ハﾞトル(てﾞ)"

Data_4cdf6: ; 4cdf6
	dstr "(ひきょりをきそう)"

Data_4ce01: ; 4ce01
	dstr "タイム(をきそう)"

Data_4ce0b: ; 4ce0b
	dstr "(かﾞんしﾞょうさをきそう)"

Data_4ce1a: ; 4ce1a
	dstr "(はかいりょくをきそう)"

Data_4ce27: ; 4ce27
	dstr "((たいせんします)"

Data_4ce32: ; 4ce32
	dstr "シﾞャンフﾟケﾞーム(てﾞ)"

Data_4ce41: ; 4ce41
	dstr "(めいろ)ケﾞーム(てﾞ)"

Data_4ce4f: ; 4ce4f
	dstr "カートﾞケﾞーム(てﾞ)"

Data_4ce5c: ; 4ce5c
	dstr "ハﾟンチンクﾞケﾞーム(てﾞ)"

Func_4ce6c: ; 4ce6c (13:4e6c)
	push af
	ld c, $7
	ld e, $c
	ld hl, $802
	call Func_4c0d3
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_4cdd0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $903
	call PlaceStringDEatCoordHL
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_4cdda
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $905
	call PlaceStringDEatCoordHL
	pop af
	or a
	jp z, Func_4ceb1
	read_hl_from Pointers_4cdda
	reg16swap de, hl
	ld hl, $907
	call PlaceStringDEatCoordHL
Func_4ceb1: ; 4ceb1 (13:4eb1)
	ret

Func_4ceb2: ; 4ceb2
	push bc
	push bc
	push bc
	push de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_4cf19
	ld a, e
	or d
	jp nz, Func_4cf4b
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_4cf16
	ld hl, $0
	call WriteHLToSPPlus4
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_4cf16
	ld bc, $0
.asm_4cf16
	jp Func_4cf4b

Func_4cf19: ; 4cf19 (13:4f19)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	pop de
	call CompareHLtoDE
	jp c, Func_4cf4b
	pop hl
	push hl
	dec hl
	call WriteHLToSPPlus4
	inc bc
	pop hl
	push hl
	add hl, bc
	push hl
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_4cf4b
	dec bc
Func_4cf4b: ; 4cf4b (13:4f4b)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus6
	call FarCall
	call GetHLAtSPPlus4
	ld a, l
	call Func_4ce6c
	call Func_4c0c6
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Func_4cf85: ; 4cf85
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ret

Func_4cf8d: ; 4cf8d
	ld hl, -1
	ret

Func_4cf91: ; 4cf91 (13:4f91)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	call Func_4c0ac
	call Func_4c0b9
	ld a, [wc319]
	cp $81
	jp nz, Func_4cfdd
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$6
	ld [hl], a
	ld c, $1
	ld hl, sp+$7
	reg16swap de, hl
	ld hl, $1
	call Func_4c1f6
	set_farcall_addrs_hli RandomRange
	ld a, $5
	call FarCall
	ld hl, sp+$8
	ld [hl], a
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $3
	call Func_4c20a
	jp Func_4cff9

Func_4cfdd: ; 4cfdd (13:4fdd)
	ld c, $1
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, $1
	call Func_4c20a
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $3
	call Func_4c1f6
Func_4cff9: ; 4cff9 (13:4ff9)
	call Func_4c0ac
	call FillVisibleAreaWithBlankTile
	ld e, $0
	ld hl, sp+$6
	call Func_4d84e
	ld hl, sp+$0
	ld a, [wOptionsMenu_BattleScene]
	ld [hl], a
	ld hl, sp+$1
	ld a, [wOptionsMenu_StereoSelect]
	ld [hl], a
	call Func_4c0b9
	callba_hli FreeMonsterStruct
Func_4d023: ; 4d023 (13:5023)
	callba_hli WaitAorBButtonOverworld_17a44
	cp $10
	jp nz, Func_4d039
	jp Func_4d03c

Func_4d039: ; 4d039 (13:5039)
	jp Func_4d023

Func_4d03c: ; 4d03c (13:503c)
	ld hl, sp+$5
	ld [hl], $0
Func_4d040: ; 4d040 (13:5040)
	ld hl, sp+$5
	ld a, [hl]
	cp $3
	jp nc, Func_4d12a
	callba_hli AllocateMonsterStruct2
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_4d069
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4d07d
Func_4d069: ; 4d069 (13:5069)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4d07d: ; 4d07d (13:507d)
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_4c0ac
	ld c, $3
	ld e, $a
	ld hl, $505
	call Func_4c0d3
	ld e, $6
	ld a, $6
	call SetStringStartState
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	inc hl
	push hl
	ld hl, Data_4d1d4
	push hl
	call PlaceString
	pop bc
	pop bc
	call Func_4c0b9
	xor a
Func_4d0aa: ; 4d0aa (13:50aa)
	cp $5a
	jp nc, Func_4d0b8
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_4d0aa

Func_4d0b8: ; 4d0b8 (13:50b8)
	ld c, $0
Func_4d0ba: ; 4d0ba (13:50ba)
	ld a, c
	cp $2
	jp nc, Func_4d0e5
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wOptionsMenu_BattleScene
	add hl, de
	cp [hl]
	jp z, Func_4d0e1
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wOptionsMenu_BattleScene
	add hl, de
	ld [hl], a
Func_4d0e1: ; 4d0e1 (13:50e1)
	inc c
	jp Func_4d0ba

Func_4d0e5: ; 4d0e5 (13:50e5)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld a, [hl]
	call Func_4d1e1
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld [hl], a
	callba_hli FreeMonsterStruct
	ld hl, sp+$5
	ld a, [hl]
	cp $1
	jp nz, Func_4d120
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$3
	cp [hl]
	jp nz, Func_4d120
	ld hl, sp+$4
	ld [hl], $ff
	jp Func_4d12a

Func_4d120: ; 4d120 (13:5120)
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	jp Func_4d040

Func_4d12a: ; 4d12a (13:512a)
	call FillVisibleAreaWithBlankTile
	callba_hli AllocateMonsterStruct2
	ld c, $0
Func_4d13d: ; 4d13d (13:513d)
	ld a, c
	cp $2
	jp nc, Func_4d168
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wOptionsMenu_BattleScene
	add hl, de
	cp [hl]
	jp z, Func_4d164
	ld e, c
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wOptionsMenu_BattleScene
	add hl, de
	ld [hl], a
Func_4d164: ; 4d164 (13:5164)
	inc c
	jp Func_4d13d

Func_4d168: ; 4d168 (13:5168)
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$6
	call Func_4d299
	callba_hli FreeMonsterStruct
	callba_hli SaveGame
	callba_hli WaitAorBButtonOverworld_17a44
	call Func_4c21e
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_4d1b3
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4d1c7
Func_4d1b3: ; 4d1b3 (13:51b3)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4d1c7: ; 4d1c7 (13:51c7)
	call Func_4c0c6
	ld hl, -1
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_4d1d4: ; 4d1d4
	dstr "(たﾞい)%d(しあい)"

Func_4d1e1: ; 4d1e1 (13:51e1)
	push af
	ld a, [wSongCurrentlyPlaying]
	ld e, a
	pop af
	push de
	cp $4
	jp z, Func_4d26c
	cp $3
	jp z, Func_4d259
	cp $2
	jp z, Func_4d246
	cp $1
	jp z, Func_4d233
	or a
	jp nz, Func_4d27c
	set_farcall_addrs_hli Func_60e81
	ld a, [wc319]
	cp $81
	jp nz, Func_4d21d
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	ld l, a
	jp Func_4d230

Func_4d21d: ; 4d21d (13:521d)
	ld a, [wOptionsMenu_StereoSelect]
	call FarCall
	ld l, a
	inc l
	dec l
	jp nz, Func_4d22e
	ld l, $1
	jp Func_4d230

Func_4d22e: ; 4d22e (13:522e)
	ld l, $0
Func_4d230: ; 4d230 (13:5230)
	jp Func_4d27c

Func_4d233: ; 4d233 (13:5233)
	set_farcall_addrs_hli Func_6d395
	ld a, $1
	call FarCall
	jp Func_4d27c

Func_4d246: ; 4d246 (13:5246)
	set_farcall_addrs_hli Func_10abf
	ld a, $1
	call FarCall
	jp Func_4d27c

Func_4d259: ; 4d259 (13:5259)
	set_farcall_addrs_hli Func_1228e
	ld a, $1
	call FarCall
	jp Func_4d27c

Func_4d26c: ; 4d26c (13:526c)
	set_farcall_addrs_hli Func_6c5bb
	ld a, $1
	call FarCall
Func_4d27c: ; 4d27c (13:527c)
	pop de
	push hl
	ld a, e
	call OverworldPlaySong
	pop hl
	ld a, l
	ret

Data_4d285: ; 4d285
	db $22, $03, $07, $1a, $01, $03, $08, $0a, $03, $1f, $0b, $03, $12, $0a, $03, $15, $04, $07, $0f, $0b

Func_4d299: ; 4d299 (13:5299)
	push hl
	ld hl, -$88
	add hl, sp
	ld sp, hl
	push de
	call Func_4c0ac
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_4d2b6
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4d2ca
Func_4d2b6: ; 4d2b6 (13:52b6)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4d2ca: ; 4d2ca (13:52ca)
	ld a, [wc319]
	cp $81
	jp nz, Func_4d2ec
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$67
	reg16swap de, hl
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	jp Func_4d303

Func_4d2ec: ; 4d2ec (13:52ec)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$44
	reg16swap de, hl
	ld a, [wOptionsMenu_StereoSelect]
	call FarCall
Func_4d303: ; 4d303 (13:5303)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	read_hl_from wcb55
	call WriteHLToSPPlus8
	ld hl, sp+$8
	xor a
	ld [hl], a
	ld hl, sp+$9
	ld [hl], a
	ld c, $0
	pop af
	pop de
	push af
Func_4d32b: ; 4d32b (13:532b)
	ld a, c
	cp $3
	jp nc, Func_4d469
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_4d465
	ld a, [wc319]
	cp $81
	jp nz, Func_4d3d4
	push de
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_4d390
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb3f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, 999
	call CompareHLtoDE
	jp nc, Func_4d386
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb3f
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_4d386: ; 4d386 (13:5386)
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
	jp Func_4d3d0

Func_4d390: ; 4d390 (13:5390)
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb49
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, 999
	call CompareHLtoDE
	jp nc, Func_4d3c9
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb49
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_4d3c9: ; 4d3c9 (13:53c9)
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
Func_4d3d0: ; 4d3d0 (13:53d0)
	pop de
	jp Func_4d465

Func_4d3d4: ; 4d3d4 (13:53d4)
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_4d423
	push de
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb3f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, 999
	call CompareHLtoDE
	jp nc, Func_4d418
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb3f
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_4d418: ; 4d418 (13:5418)
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	pop de
	jp Func_4d465

Func_4d423: ; 4d423 (13:5423)
	push de
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb49
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, 999
	call CompareHLtoDE
	jp nc, Func_4d45d
	read_hl_from_sp_plus $8e
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wcb49
	add hl, de
	ld a, [hl]
	add $1
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
Func_4d45d: ; 4d45d (13:545d)
	ld hl, sp+$9
	ld a, [hl]
	inc a
	ld hl, sp+$9
	ld [hl], a
	pop de
Func_4d465: ; 4d465 (13:5465)
	inc c
	jp Func_4d32b

Func_4d469: ; 4d469 (13:5469)
	pop af
	push de
	call GetSRAMBank
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	cp [hl]
	jp nc, Func_4d47c
	ld l, $0
	jp Func_4d47e

Func_4d47c: ; 4d47c (13:547c)
	ld l, $1
Func_4d47e: ; 4d47e (13:547e)
	push hl
	call Func_4c21e
	ld a, [wc319]
	cp $81
	jp nz, Func_4d4ce
	ld c, $1
	ld hl, sp+$46
	reg16swap de, hl
	ld hl, $23
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$69
	reg16swap de, hl
	ld hl, $23
	call Func_4c20a
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $2
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2
	call Func_4c20a
	ld hl, sp+$46
	ld e, [hl]
	ld hl, sp+$69
	ld a, [hl]
	call Func_4dad5
	jp Func_4d50f

Func_4d4ce: ; 4d4ce (13:54ce)
	ld c, $1
	ld hl, sp+$46
	reg16swap de, hl
	ld hl, $23
	call Func_4c20a
	ld c, $1
	ld hl, sp+$69
	reg16swap de, hl
	ld hl, $23
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $2
	call Func_4c20a
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $2
	call Func_4c1f6
	ld hl, sp+$46
	ld e, [hl]
	ld hl, sp+$69
	ld a, [hl]
	call Func_4dad5
Func_4d50f: ; 4d50f (13:550f)
	ld hl, sp+$6a
	reg16swap de, hl
	ld hl, sp+$a
	ld bc, $6
	call CopyFromDEtoHL
	ld hl, sp+$47
	reg16swap de, hl
	ld hl, sp+$28
	ld bc, $6
	call CopyFromDEtoHL
	ld a, [wc319]
	cp $81
	jp nz, Func_4d55b
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	ld hl, sp+$28
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $b
	call FarCall
	jp Func_4d580

Func_4d55b: ; 4d55b (13:555b)
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $b
	call FarCall
	ld hl, sp+$28
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
Func_4d580: ; 4d580 (13:5580)
	ld c, $a
	ld e, $a
	ld hl, $2
	call Func_4c0d3
	ld c, $a
	ld e, $a
	ld hl, $a02
	call Func_4c0d3
	xor a
Func_4d595: ; 4d595 (13:5595)
	cp $3
	jp nc, Func_4d5d4
	push af
	add a
	add $d
	ld e, a
	ld a, $4
	call SetStringStartState
	pop af
	push af
	ld l, a
	ld h, $0
	inc hl
	push hl
	ld hl, Data_4d7ac
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	push af
	read_hl_from_sp_plus $90
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_4cccb
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -1
	call PlaceStringDEatCoordHL
	pop af
	inc a
	jp Func_4d595

Func_4d5d4: ; 4d5d4 (13:55d4)
	ld a, [wSystemType]
	cp $1
	jp z, Func_4d5e4
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4d5ed
Func_4d5e4: ; 4d5e4 (13:55e4)
	ld de, $14
	ld hl, Data_4d285
	call Func_2b7d
Func_4d5ed: ; 4d5ed (13:55ed)
	ld a, [wc319]
	cp $81
	jp nz, Func_4d621
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$69
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$46
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	jp Func_4d64a

Func_4d621: ; 4d621 (13:5621)
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$46
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$69
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
Func_4d64a: ; 4d64a (13:564a)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $103
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
	ld hl, $b03
	call FarCall
	call WaitVideoTransfer
	ld c, $0
	pop hl
	pop de
	push hl
Func_4d698: ; 4d698 (13:5698)
	ld a, c
	cp $3
	jp nc, Func_4d713
	push de
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_4d70e
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_4d6ba
	ld a, [wc319]
	cp $81
	jp z, Func_4d6cb
Func_4d6ba: ; 4d6ba (13:56ba)
	ld l, c
	ld h, $0
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_4d6ee
	ld a, [wc319]
	cp $81
	jp z, Func_4d6ee
Func_4d6cb: ; 4d6cb (13:56cb)
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $d
	add hl, de
	ld de, Data_4d7ba
	call PlaceStringDEatCoordHL
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $120d
	add hl, de
	ld de, Data_4d7bf
	call PlaceStringDEatCoordHL
	pop bc
	jp Func_4d70e

Func_4d6ee: ; 4d6ee (13:56ee)
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $120d
	add hl, de
	ld de, Data_4d7c4
	call PlaceStringDEatCoordHL
	pop bc
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $d
	add hl, de
	ld de, Data_4d7c9
	call PlaceStringDEatCoordHL
	pop bc
Func_4d70e: ; 4d70e (13:570e)
	inc c
	pop de
	jp Func_4d698

Func_4d713: ; 4d713 (13:5713)
	pop hl
	ld a, [wc38d]
	cp $1
	jp nz, Func_4d769
	ld a, [wc319]
	cp $81
	jp nz, Func_4d745
	push hl
	ld a, l
	cp $1
	jp nz, Func_4d736
	ld de, $0
	ld a, $1
	call Func_4d7d6
	jp Func_4d741

Func_4d736: ; 4d736 (13:5736)
	call GetHLAtSPPlus4
	reg16swap de, hl
	xor a
	call Func_4d7d6
Func_4d741: ; 4d741 (13:5741)
	pop hl
	jp Func_4d764

Func_4d745: ; 4d745 (13:5745)
	inc l
	dec l
	jp nz, Func_4d757
	push hl
	ld de, $0
	ld a, $1
	call Func_4d7d6
	pop hl
	jp Func_4d764

Func_4d757: ; 4d757 (13:5757)
	push hl
	call GetHLAtSPPlus4
	reg16swap de, hl
	xor a
	call Func_4d7d6
	pop hl
Func_4d764: ; 4d764 (13:5764)
	push hl
	call Func_4c4b3
	pop hl
Func_4d769: ; 4d769 (13:5769)
	push hl
	ld c, $5
	ld e, $c
	ld hl, $407
	call Func_4c0d3
	set_farcall_addrs_hli Func_16019
	pop hl
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	ld c, l
	ld b, h
	ld de, $8
	ld hl, $5
	call FarCall
	ld de, Data_4d7ce
	ld hl, $90a
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	ld hl, $8a
	add hl, sp
	ld sp, hl
	ret

Data_4d7ac: ; 4d7ac
	dstr "(たﾞい)%d(しあい) "

Data_4d7ba: ; 4d7ba
	dstr "(かち)"

Data_4d7bf: ; 4d7bf
	dstr "(まけ)"

Data_4d7c4: ; 4d7c4
	dstr "(かち)"

Data_4d7c9: ; 4d7c9
	dstr "(まけ)"

Data_4d7ce: ; 4d7ce
	dstr "(のしょうり)"

Func_4d7d6: ; 4d7d6 (13:57d6)
	push de
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	pop af
	pop de
	or a
	jp nz, Func_4d825
	read_hl_from wcb53
	inc hl
	write_hl_to wcb53
	read_hl_from wcb55
	add hl, de
	ld a, low(30000)
	sub l
	ld a, high(30000)
	sbc h
	jp c, Func_4d81a
	read_hl_from wcb55
	add hl, de
	write_hl_to wcb55
	jp Func_4d822

Func_4d81a: ; 4d81a (13:581a)
	ld hl, 30000
	write_hl_to wcb55
Func_4d822: ; 4d822 (13:5822)
	jp Func_4d839

Func_4d825: ; 4d825 (13:5825)
	xor a
	ld [wcb57], a
	ld hl, $0
	write_hl_to wcb55
	ld hl, $0
	write_hl_to wcb53
Func_4d839: ; 4d839 (13:5839)
	ld a, c
	call GetSRAMBank
	ret

Data_4d83e: ; 4d83e
	db $21, $01, $03, $1a, $01, $03, $08, $0a

Data_4d846: ; 4d846
	db $21, $01, $03, $1f, $0b, $03, $12, $0a

Func_4d84e: ; 4d84e (13:584e)
	push hl
	ld hl, -$84
	add hl, sp
	ld sp, hl
	callba_hli AllocateMonsterStruct2
	ld a, [wc319]
	cp $81
	jp nz, Func_4d891
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$61
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$61
	ld a, [hl]
	dec a
	ld hl, sp+$0
	ld [hl], a
	ld a, [wc2e9]
	ld [wOptionsMenu_BattleScene], a
	jp Func_4d8b5

Func_4d891: ; 4d891 (13:5891)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$3e
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$3e
	ld a, [hl]
	dec a
	ld hl, sp+$1
	ld [hl], a
	ld a, [wc2e9]
	ld [wOptionsMenu_StereoSelect], a
Func_4d8b5: ; 4d8b5 (13:58b5)
	call Func_4c21e
	ld a, [wc319]
	cp $81
	jp nz, Func_4d905
	ld c, $1
	ld de, wOptionsMenu_StereoSelect
	ld hl, $1
	call Func_4c1f6
	ld c, $1
	ld de, wOptionsMenu_BattleScene
	ld hl, $1
	call Func_4c20a
	ld c, $1
	ld hl, sp+$3e
	reg16swap de, hl
	ld hl, $23
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$61
	reg16swap de, hl
	ld hl, $23
	call Func_4c20a
	ld hl, sp+$3e
	ld e, [hl]
	ld hl, sp+$61
	ld a, [hl]
	call Func_4dad5
	ld hl, sp+$3e
	ld a, [hl]
	dec a
	ld hl, sp+$1
	ld [hl], a
	jp Func_4d947

Func_4d905: ; 4d905 (13:5905)
	ld c, $1
	ld de, wOptionsMenu_StereoSelect
	ld hl, $1
	call Func_4c20a
	ld c, $1
	ld de, wOptionsMenu_BattleScene
	ld hl, $1
	call Func_4c1f6
	ld c, $1
	ld hl, sp+$3e
	reg16swap de, hl
	ld hl, $23
	call Func_4c20a
	ld c, $1
	ld hl, sp+$61
	reg16swap de, hl
	ld hl, $23
	call Func_4c1f6
	ld hl, sp+$61
	ld a, [hl]
	dec a
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$3e
	ld e, [hl]
	ld hl, sp+$61
	ld a, [hl]
	call Func_4dad5
Func_4d947: ; 4d947 (13:5947)
	ld hl, sp+$62
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $6
	call CopyFromDEtoHL
	ld hl, sp+$3f
	reg16swap de, hl
	ld hl, sp+$20
	ld bc, $6
	call CopyFromDEtoHL
	ld c, $a
	ld e, $a
	ld hl, $2
	call Func_4c0d3
	ld c, $a
	ld e, $a
	ld hl, $a02
	call Func_4c0d3
	xor a
Func_4d978: ; 4d978 (13:5978)
	cp $3
	jp nc, Func_4d9b7
	push af
	add a
	add $d
	ld e, a
	ld a, $4
	call SetStringStartState
	pop af
	push af
	ld l, a
	ld h, $0
	inc hl
	push hl
	ld hl, Data_4dac7
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	push af
	read_hl_from_sp_plus $88
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_4cccb
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, -1
	call PlaceStringDEatCoordHL
	pop af
	inc a
	jp Func_4d978

Func_4d9b7: ; 4d9b7 (13:59b7)
	ld a, [wSystemType]
	cp $1
	jp z, Func_4d9c7
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4d9d9
Func_4d9c7: ; 4d9c7 (13:59c7)
	ld de, $8
	ld hl, Data_4d83e
	call Func_2b7d
	ld de, $8
	ld hl, Data_4d846
	call Func_2b7d
Func_4d9d9: ; 4d9d9 (13:59d9)
	ld a, [wc319]
	cp $81
	jp nz, Func_4da2e
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	ld hl, sp+$20
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $b
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$0
	ld e, [hl]
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$1
	ld e, [hl]
	ld a, $1
	call FarCall
	jp Func_4da78

Func_4da2e: ; 4da2e (13:5a2e)
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $b
	call FarCall
	ld hl, sp+$20
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$1
	ld e, [hl]
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$0
	ld e, [hl]
	ld a, $1
	call FarCall
Func_4da78: ; 4da78 (13:5a78)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $103
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
	ld hl, $b03
	call FarCall
	call WaitVideoTransfer
	ld hl, $86
	add hl, sp
	ld sp, hl
	ret

Data_4dac7: ; 4dac7
	dstr "(たﾞい)%d(しあい) "

Func_4dad5: ; 4dad5 (13:5ad5)
	push af
	ld hl, -$352
	add hl, sp
	ld sp, hl
	ldh a, [hSRAMBank]
	ld c, a
	ld a, [wc319]
	cp $81
	jp nz, Func_4db69
	push de
	ld hl, $355
	add hl, sp
	ld a, [hl]
	cp $ab
	jp c, Func_4db31
	ld hl, $355
	add hl, sp
	ld a, [hl]
	cp $af
	jp nc, Func_4db31
	push bc
	ld a, $2
	call GetSRAMBank_ReadOnly
	ld hl, $357
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, (s2_b29f - $351 * $ab) & $ffff
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $351
	call CopyFromDEtoHL
	pop bc
	ld a, c
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $351
	call Func_4c20a
Func_4db31: ; 4db31 (13:5b31)
	pop de
	ld a, e
	cp $ab
	jp c, Func_4db66
	ld a, e
	cp $af
	jp nc, Func_4db66
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $351
	call Func_4c1f6
	ld bc, $351
	ld hl, sp+$0
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CopyFromDEtoHL
Func_4db66: ; 4db66 (13:5b66)
	jp Func_4dbe9

Func_4db69: ; 4db69 (13:5b69)
	push bc
	push de
	ld hl, $357
	add hl, sp
	ld a, [hl]
	cp $ab
	jp c, Func_4dba7
	ld hl, $357
	add hl, sp
	ld a, [hl]
	cp $af
	jp nc, Func_4dba7
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $351
	call Func_4c1f6
	ld bc, $351
	ld hl, sp+$4
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CopyFromDEtoHL
Func_4dba7: ; 4dba7 (13:5ba7)
	pop de
	pop bc
	ld a, e
	cp $ab
	jp c, Func_4dbe9
	ld a, e
	cp $af
	jp nc, Func_4dbe9
	push bc
	push de
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop de
	ld l, e
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, (s2_b29f - $351 * $ab) & $ffff
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $351
	call CopyFromDEtoHL
	pop bc
	ld a, c
	call GetSRAMBank
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $351
	call Func_4c20a
Func_4dbe9: ; 4dbe9 (13:5be9)
	ld hl, $354
	add hl, sp
	ld sp, hl
	ret

Func_4dbef:: ; 4dbef
	push bc
	push hl
	call Func_1fbe
	pop bc
	push bc
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld l, [hl]
	push hl
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld hl, $d
	add hl, bc
	ld a, [hl]
	push af
	xor a
Func_4dc29: ; 4dc29 (13:5c29)
	cp $5
	jp nc, Func_4dc44
	ld e, a
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], $ff
	ld e, a
	ld d, $0
	ld hl, wTimeSetHoursTensDigit
	add hl, de
	ld [hl], $ff
	inc a
	jp Func_4dc29

Func_4dc44: ; 4dc44 (13:5c44)
	xor a
	ld [wc2f7], a
	xor a
	ld [wc306], a
	xor a
	ld [wc2f9], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop af
	cp $13
	jp nz, Func_4dc77
	ld de, Data_4dcee
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld de, Data_4dcfe
	ld hl, $b11
	call PlaceStringDEatCoordHL
	jp Func_4dc89

Func_4dc77: ; 4dc77 (13:5c77)
	ld de, Data_4dd03
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld de, Data_4dd16
	ld hl, $b11
	call PlaceStringDEatCoordHL
Func_4dc89: ; 4dc89 (13:5c89)
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_4c0d3
	ld a, [wc2f9]
	call Func_4df45
	set_farcall_addrs_hli Func_50604
	pop hl
	call FarCall
	ld e, $f
	ld a, $1
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_4dd1c
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $11
	ld a, $1
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_4dd1f
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_4dd22
	ld hl, $211
	call PlaceStringDEatCoordHL
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

Data_4dcee: ; 4dcee
	dstr "ホﾞク(のなまえを きめて)ネ"

Data_4dcfe: ; 4dcfe
	dstr "b___"

Data_4dd03: ; 4dd03
	dstr "ロホﾞホﾟン(のなまえを きめて)ネ"

Data_4dd16: ; 4dd16
	dstr "b____"

Data_4dd1c: ; 4dd1c
	dstr "%c"

Data_4dd1f: ; 4dd1f
	dstr "%c"

Data_4dd22: ; 4dd22
	dstr "(けってい)"

Pointers_4dd29: ; 4dd29
	dw Data_4de01
	dw Data_4de05
	dw Data_4de09
	dw Data_4de0d
	dw Data_4de11
	dw Data_4de15
	dw Data_4de19
	dw Data_4de1d
	dw Data_4de21
	dw Data_4de25
	dw Data_4de29
	dw Data_4de2d
	dw Data_4de31
	dw Data_4de35
	dw Data_4de39
	dw Data_4de3d
	dw Data_4de41
	dw Data_4de45
	dw Data_4de49
	dw Data_4de4d
	dw Data_4de51
	dw Data_4de55
	dw Data_4de59
	dw Data_4de5d
	dw Data_4de61
	dw Data_4de65
	dw Data_4de69
	dw Data_4de6d
	dw Data_4de71
	dw Data_4de75
	dw Data_4de79
	dw Data_4de7d
	dw Data_4de81
	dw Data_4de85
	dw Data_4de89
	dw Data_4de8d
	dw Data_4de91
	dw Data_4de95
	dw Data_4de99
	dw Data_4de9d
	dw Data_4dea1
	dw Data_4dea5
	dw Data_4dea9
	dw Data_4dead
	dw Data_4deb1
	dw Data_4deb5
	dw Data_4deb9
	dw Data_4debd
	dw Data_4dec1
	dw Data_4dec5
	dw Data_4dec9
	dw Data_4decd
	dw Data_4ded1
	dw Data_4ded5
	dw Data_4ded9
	dw Data_4dedb
	dw Data_4dedd
	dw Data_4dedf
	dw Data_4dee1
	dw Data_4dee3
	dw Data_4dee5
	dw Data_4dee7
	dw Data_4dee9
	dw Data_4deeb
	dw Data_4deed
	dw Data_4deef
	dw Data_4def1
	dw Data_4def3
	dw Data_4def5
	dw Data_4def7
	dw Data_4def9
	dw Data_4defb
	dw Data_4defd
	dw Data_4deff
	dw Data_4df01
	dw Data_4df03
	dw Data_4df05
	dw Data_4df07
	dw Data_4df09
	dw Data_4df0b
	dw Data_4df0d
	dw Data_4df0f
	dw Data_4df11
	dw Data_4df13
	dw Data_4df15
	dw Data_4df17
	dw Data_4df19
	dw Data_4df1b
	dw Data_4df1d
	dw Data_4df1f
	dw Data_4df21
	dw Data_4df23
	dw Data_4df25
	dw Data_4df27
	dw Data_4df29
	dw Data_4df2b
	dw Data_4df2d
	dw Data_4df2f
	dw Data_4df31
	dw Data_4df33
	dw Data_4df35
	dw Data_4df37
	dw Data_4df39
	dw Data_4df3b
	dw Data_4df3d
	dw Data_4df3f
	dw Data_4df41
	dw Data_4df43

Data_4de01: ; 4de01
	dstr "(あ)"

Data_4de05: ; 4de05
	dstr "(い)"

Data_4de09: ; 4de09
	dstr "(う)"

Data_4de0d: ; 4de0d
	dstr "(え)"

Data_4de11: ; 4de11
	dstr "(お)"

Data_4de15: ; 4de15
	dstr "(ゃ)"

Data_4de19: ; 4de19
	dstr "(か)"

Data_4de1d: ; 4de1d
	dstr "(き)"

Data_4de21: ; 4de21
	dstr "(く)"

Data_4de25: ; 4de25
	dstr "(け)"

Data_4de29: ; 4de29
	dstr "(こ)"

Data_4de2d: ; 4de2d
	dstr "(ゅ)"

Data_4de31: ; 4de31
	dstr "(さ)"

Data_4de35: ; 4de35
	dstr "(し)"

Data_4de39: ; 4de39
	dstr "(す)"

Data_4de3d: ; 4de3d
	dstr "(せ)"

Data_4de41: ; 4de41
	dstr "(そ)"

Data_4de45: ; 4de45
	dstr "(ょ)"

Data_4de49: ; 4de49
	dstr "(た)"

Data_4de4d: ; 4de4d
	dstr "(ち)"

Data_4de51: ; 4de51
	dstr "(つ)"

Data_4de55: ; 4de55
	dstr "(て)"

Data_4de59: ; 4de59
	dstr "(と)"

Data_4de5d: ; 4de5d
	dstr "(っ)"

Data_4de61: ; 4de61
	dstr "(な)"

Data_4de65: ; 4de65
	dstr "(に)"

Data_4de69: ; 4de69
	dstr "(ぬ)"

Data_4de6d: ; 4de6d
	dstr "(ね)"

Data_4de71: ; 4de71
	dstr "(の)"

Data_4de75: ; 4de75
	dstr "(ﾞ)"

Data_4de79: ; 4de79
	dstr "(は)"

Data_4de7d: ; 4de7d
	dstr "(ひ)"

Data_4de81: ; 4de81
	dstr "(ふ)"

Data_4de85: ; 4de85
	dstr "(へ)"

Data_4de89: ; 4de89
	dstr "(ほ)"

Data_4de8d: ; 4de8d
	dstr "(ﾟ)"

Data_4de91: ; 4de91
	dstr "(ま)"

Data_4de95: ; 4de95
	dstr "(み)"

Data_4de99: ; 4de99
	dstr "(む)"

Data_4de9d: ; 4de9d
	dstr "(め)"

Data_4dea1: ; 4dea1
	dstr "(も)"

Data_4dea5: ; 4dea5
	dstr "(-)"

Data_4dea9: ; 4dea9
	dstr "(や)"

Data_4dead: ; 4dead
	dstr "(ゆ)"

Data_4deb1: ; 4deb1
	dstr "(よ)"

Data_4deb5: ; 4deb5
	dstr "(わ)"

Data_4deb9: ; 4deb9
	dstr "(を)"

Data_4debd: ; 4debd
	dstr "(ん)"

Data_4dec1: ; 4dec1
	dstr "(ら)"

Data_4dec5: ; 4dec5
	dstr "(り)"

Data_4dec9: ; 4dec9
	dstr "(る)"

Data_4decd: ; 4decd
	dstr "(れ)"

Data_4ded1: ; 4ded1
	dstr "(ろ)"

Data_4ded5: ; 4ded5
	dstr "( )"

Data_4ded9: ; 4ded9
	dstr "ア"

Data_4dedb: ; 4dedb
	dstr "イ"

Data_4dedd: ; 4dedd
	dstr "ウ"

Data_4dedf: ; 4dedf
	dstr "エ"

Data_4dee1: ; 4dee1
	dstr "オ"

Data_4dee3: ; 4dee3
	dstr "ャ"

Data_4dee5: ; 4dee5
	dstr "カ"

Data_4dee7: ; 4dee7
	dstr "キ"

Data_4dee9: ; 4dee9
	dstr "ク"

Data_4deeb: ; 4deeb
	dstr "ケ"

Data_4deed: ; 4deed
	dstr "コ"

Data_4deef: ; 4deef
	dstr "ュ"

Data_4def1: ; 4def1
	dstr "サ"

Data_4def3: ; 4def3
	dstr "シ"

Data_4def5: ; 4def5
	dstr "ス"

Data_4def7: ; 4def7
	dstr "セ"

Data_4def9: ; 4def9
	dstr "ソ"

Data_4defb: ; 4defb
	dstr "ョ"

Data_4defd: ; 4defd
	dstr "タ"

Data_4deff: ; 4deff
	dstr "チ"

Data_4df01: ; 4df01
	dstr "ツ"

Data_4df03: ; 4df03
	dstr "テ"

Data_4df05: ; 4df05
	dstr "ト"

Data_4df07: ; 4df07
	dstr "ッ"

Data_4df09: ; 4df09
	dstr "ナ"

Data_4df0b: ; 4df0b
	dstr "ニ"

Data_4df0d: ; 4df0d
	dstr "ヌ"

Data_4df0f: ; 4df0f
	dstr "ネ"

Data_4df11: ; 4df11
	dstr "ノ"

Data_4df13: ; 4df13
	dstr "ﾞ"

Data_4df15: ; 4df15
	dstr "ハ"

Data_4df17: ; 4df17
	dstr "ヒ"

Data_4df19: ; 4df19
	dstr "フ"

Data_4df1b: ; 4df1b
	dstr "ヘ"

Data_4df1d: ; 4df1d
	dstr "ホ"

Data_4df1f: ; 4df1f
	dstr "ﾟ"

Data_4df21: ; 4df21
	dstr "マ"

Data_4df23: ; 4df23
	dstr "ミ"

Data_4df25: ; 4df25
	dstr "ム"

Data_4df27: ; 4df27
	dstr "メ"

Data_4df29: ; 4df29
	dstr "モ"

Data_4df2b: ; 4df2b
	dstr "-"

Data_4df2d: ; 4df2d
	dstr "ヤ"

Data_4df2f: ; 4df2f
	dstr "ユ"

Data_4df31: ; 4df31
	dstr "ヨ"

Data_4df33: ; 4df33
	dstr "ワ"

Data_4df35: ; 4df35
	dstr "ヲ"

Data_4df37: ; 4df37
	dstr "ン"

Data_4df39: ; 4df39
	dstr "ラ"

Data_4df3b: ; 4df3b
	dstr "リ"

Data_4df3d: ; 4df3d
	dstr "ル"

Data_4df3f: ; 4df3f
	dstr "レ"

Data_4df41: ; 4df41
	dstr "ロ"

Data_4df43: ; 4df43
	dstr " "

Func_4df45: ; 4df45 (13:5f45)
	push af
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
Func_4df4c: ; 4df4c (13:5f4c)
	ld hl, sp+$2
	ld a, [hl]
	cp $9
	jp nc, Func_4dfdc
	ld hl, sp+$2
	ld a, [hl]
	add a
	add $2
	ld hl, sp+$1
	ld [hl], a
	ld hl, sp+$3
	ld [hl], $0
Func_4df61: ; 4df61 (13:5f61)
	ld hl, sp+$3
	ld a, [hl]
	cp $6
	jp nc, Func_4dfd2
	ld hl, sp+$3
	ld a, [hl]
	add a
	add $3
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp z, Func_4df82
	ld hl, sp+$2
	ld a, [hl]
	cp $5
	jp nz, Func_4df98
Func_4df82: ; 4df82 (13:5f82)
	ld hl, sp+$3
	ld a, [hl]
	cp $5
	jp nz, Func_4df98
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
Func_4df98: ; 4df98 (13:5f98)
	ld hl, sp+$3
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld de, $36
	call MultiplyHLbyDE
	pop de
	add hl, de
	add hl, hl
	ld de, Pointers_4dd29
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_4df61

Func_4dfd2: ; 4dfd2 (13:5fd2)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_4df4c

Func_4dfdc: ; 4dfdc (13:5fdc)
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp nz, Func_4dfef
	ld de, Data_4dffc
	ld hl, $20f
	call PlaceStringDEatCoordHL
	jp Func_4dff8

Func_4dfef: ; 4dfef (13:5fef)
	ld de, Data_4e001
	ld hl, $20f
	call PlaceStringDEatCoordHL
Func_4dff8: ; 4dff8 (13:5ff8)
	pop bc
	pop bc
	pop bc
	ret

Data_4dffc: ; 4dffc
	dstr "カタカナ"

Data_4e001: ; 4e001
	dstr "(かな  )"

Func_4e008:: ; 4e008 (13:6008)
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
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop de
	ld a, e
	sub $4
	or d
	jp z, Func_4e152
	ld a, e
	sub $3
	or d
	jp z, Func_4e12f
	ld a, e
	sub $2
	or d
	jp z, Func_4e107
	ld a, e
	dec a
	or d
	jp z, Func_4e096
	ld a, e
	or d
	jp nz, Func_4e155
	ld a, c
	sub $30
	or b
	jp z, Func_4e086
	ld a, c
	sub $2a
	or b
	jp z, Func_4e086
	ld a, c
	sub $24
	or b
	jp z, Func_4e086
	ld a, c
	sub $1e
	or b
	jp z, Func_4e086
	ld a, c
	sub $18
	or b
	jp z, Func_4e086
	ld a, c
	sub $12
	or b
	jp z, Func_4e086
	ld a, c
	sub $c
	or b
	jp z, Func_4e086
	ld a, c
	sub $6
	or b
	jp z, Func_4e086
	ld a, c
	sub $36
	or b
	jp nz, Func_4e089
	ld bc, $5
	jp Func_4e093

Func_4e086: ; 4e086 (13:6086)
	jp Func_4e093

Func_4e089: ; 4e089 (13:6089)
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, Func_4e093
	ld bc, $0
Func_4e093: ; 4e093 (13:6093)
	jp Func_4e155

Func_4e096: ; 4e096 (13:6096)
	ld a, c
	sub $37
	or b
	jp z, Func_4e0ef
	ld a, c
	sub $36
	or b
	jp z, Func_4e0e9
	ld a, c
	sub $35
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $2f
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $29
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $23
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $1d
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $17
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $11
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $b
	or b
	jp z, Func_4e0e3
	ld a, c
	sub $5
	or b
	jp nz, Func_4e0f5
Func_4e0e3: ; 4e0e3 (13:60e3)
	ld bc, $36
	jp Func_4e104

Func_4e0e9: ; 4e0e9 (13:60e9)
	ld bc, $37
	jp Func_4e104

Func_4e0ef: ; 4e0ef (13:60ef)
	ld bc, $37
	jp Func_4e104

Func_4e0f5: ; 4e0f5 (13:60f5)
	inc bc
	ld l, c
	ld h, b
	ld de, $36
	call CompareHLtoDE
	jp c, Func_4e104
	ld bc, $35
Func_4e104: ; 4e104 (13:6104)
	jp Func_4e155

Func_4e107: ; 4e107 (13:6107)
	ld a, c
	sub $36
	or b
	jp z, Func_4e12c
	ld a, c
	sub $37
	or b
	jp z, Func_4e12c
	ld hl, $6
	add hl, bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld de, $36
	call CompareHLtoDE
	jp c, Func_4e12c
	ld hl, -6
	add hl, bc
	ld c, l
	ld b, h
Func_4e12c: ; 4e12c (13:612c)
	jp Func_4e155

Func_4e12f: ; 4e12f (13:612f)
	ld a, c
	sub $36
	or b
	jp z, Func_4e14f
	ld a, c
	sub $37
	or b
	jp z, Func_4e14f
	ld hl, -6
	add hl, bc
	ld c, l
	ld b, h
	inc b
	dec b
	bit 7, b
	jr z, Func_4e14f
	ld hl, $6
	add hl, bc
	ld c, l
	ld b, h
Func_4e14f: ; 4e14f (13:614f)
	jp Func_4e155

Func_4e152: ; 4e152 (13:6152)
	ld bc, $37
Func_4e155: ; 4e155 (13:6155)
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli Func_50604
	pop hl
	push hl
	call FarCall
	call Func_4c0c6
	ld hl, $4000
	pop bc
	ret

Func_4e175:: ; 4e175
	push hl
	reg16swap de, hl
	ld hl, $d
	add hl, de
	ld a, [hl]
	pop hl
	cp $20
	jp z, Func_4e19d
	cp $14
	jp z, Func_4e19d
	cp $19
	jp z, Func_4e194
	cp $13
	jp nz, Func_4e1a3
Func_4e194: ; 4e194 (13:6194)
	ld de, $2
	call Func_4e008
	jp Func_4e1a3

Func_4e19d: ; 4e19d (13:619d)
	ld de, $2
	call Func_4e813
Func_4e1a3: ; 4e1a3 (13:61a3)
	ret

Func_4e1a4:: ; 4e1a4
	push hl
	reg16swap de, hl
	ld hl, $d
	add hl, de
	ld a, [hl]
	pop hl
	cp $20
	jp z, Func_4e1cc
	cp $14
	jp z, Func_4e1cc
	cp $19
	jp z, Func_4e1c3
	cp $13
	jp nz, Func_4e1d2
Func_4e1c3: ; 4e1c3 (13:61c3)
	ld de, $3
	call Func_4e008
	jp Func_4e1d2

Func_4e1cc: ; 4e1cc (13:61cc)
	ld de, $3
	call Func_4e813
Func_4e1d2: ; 4e1d2 (13:61d2)
	ret

Func_4e1d3:: ; 4e1d3
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
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
	call WriteHLToSPPlus3
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $13
	jp nz, Func_4e1fc
	ld c, $4
	jp Func_4e1fe

Func_4e1fc: ; 4e1fc (13:61fc)
	ld c, $5
Func_4e1fe: ; 4e1fe (13:61fe)
	push bc
	call Func_4c0ac
	ld a, $1
	pop bc
	call GetHLAtSPPlus3
	ld a, l
	sub $37
	or h
	jp z, Func_4e232
	ld a, l
	sub $36
	or h
	jp nz, Func_4e272
	ld a, [wc2f9]
	or a
	jp nz, Func_4e225
	ld a, $1
	ld [wc2f9], a
	jp Func_4e229

Func_4e225: ; 4e225 (13:6225)
	xor a
	ld [wc2f9], a
Func_4e229: ; 4e229 (13:6229)
	ld a, [wc2f9]
	call Func_4df45
	jp Func_4e39a

Func_4e232: ; 4e232 (13:6232)
	ld a, [wc2f7]
	or a
	jp nz, Func_4e23f
	ld hl, $4000
	jp Func_4e3a0

Func_4e23f: ; 4e23f (13:623f)
	ld hl, sp+$0
	ld a, [hl]
	cp $13
	jp nz, Func_4e259
	set_farcall_addrs_hli Func_335de
	xor a
	call FarCall
	jp Func_4e269

Func_4e259: ; 4e259 (13:6259)
	set_farcall_addrs_hli Func_335de
	ld a, $1
	call FarCall
Func_4e269: ; 4e269 (13:6269)
	call Func_4c0b9
	ld hl, -1
	jp Func_4e3a0

Func_4e272: ; 4e272 (13:6272)
	call GetHLAtSPPlus3
	ld a, l
	sub $23
	or h
	jp z, Func_4e283
	ld a, l
	sub $1d
	or h
	jp nz, Func_4e2e0
Func_4e283: ; 4e283 (13:6283)
	push bc
	ld a, [wc306]
	cp $1
	jp c, Func_4e2cc
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wSystemType
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus5
	ld e, l
	call Func_4e4ee
	cp $1
	jp nz, Func_4e2cc
	ld e, $10
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	call GetHLAtSPPlus5
	add hl, hl
	ld de, Pointers_4dd29
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PlaceString
	pop bc
	call GetHLAtSPPlus5
	ld a, l
	ld hl, wc306
	ld l, [hl]
	ld h, $0
	ld de, wc300
	add hl, de
	ld [hl], a
Func_4e2cc: ; 4e2cc (13:62cc)
	pop bc
	ld a, [wc2f7]
	cp c
	jp nz, Func_4e2dd
	call GetHLAtSPPlus6
	ld de, $4
	call Func_4e008
Func_4e2dd: ; 4e2dd (13:62dd)
	jp Func_4e39a

Func_4e2e0: ; 4e2e0 (13:62e0)
	ld a, [wc2f7]
	cp c
	jp nz, Func_4e2f3
	call GetHLAtSPPlus6
	ld de, $4
	call Func_4e008
	jp Func_4e39a

Func_4e2f3: ; 4e2f3 (13:62f3)
	push bc
	ld e, $10
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, wc2f9
	ld l, [hl]
	ld h, $0
	ld de, $36
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlus5
	add hl, bc
	add hl, hl
	ld de, Pointers_4dd29
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PlaceString
	pop bc
	ld hl, wc2f9
	ld l, [hl]
	ld h, $0
	ld de, $36
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	call GetHLAtSPPlus5
	add hl, bc
	ld a, l
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], a
	pop bc
	ld l, c
	dec l
	ld a, [wc2f7]
	cp l
	jp nz, Func_4e35f
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
	ld a, [wc306]
	inc a
	ld [wc306], a
	call GetHLAtSPPlus6
	ld de, $4
	call Func_4e008
	jp Func_4e39a

Func_4e35f: ; 4e35f (13:635f)
	ld l, c
	dec l
	ld a, [wc2f7]
	cp l
	jp nc, Func_4e39a
	ld e, $11
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e3a4
	push hl
	call PlaceString
	pop bc
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
	ld a, [wc306]
	inc a
	ld [wc306], a
	ld e, $11
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e3a6
	push hl
	call PlaceString
	pop bc
Func_4e39a: ; 4e39a (13:639a)
	call Func_4c0b9
	ld hl, $4000
Func_4e3a0: ; 4e3a0 (13:63a0)
	pop bc
	pop bc
	pop bc
	ret

Data_4e3a4: ; 4e3a4
	dstr "_"

Data_4e3a6: ; 4e3a6
	dstr "b"

Func_4e3a8:: ; 4e3a8
	reg16swap de, hl
	ld hl, $d
	add hl, de
	ld a, [hl]
	cp $13
	jp nz, Func_4e3bb
	ld c, $4
	jp Func_4e3bd

Func_4e3bb: ; 4e3bb (13:63bb)
	ld c, $5
Func_4e3bd: ; 4e3bd (13:63bd)
	ld a, [wc2f7]
	or a
	jp nz, Func_4e3f3
	ld a, c
	cp $4
	jp nz, Func_4e3ed
	ld a, $61
	ld [wTimeSetMonthsTensDigit], a
	ld a, $5f
	ld [wTimeSetMonthsOnesDigit], a
	ld a, $44
	ld [wTimeSetDaysTensDigit], a
	ld a, $3f
	ld [wTimeSetDaysOnesDigit], a
	set_farcall_addrs_hli Func_335de
	xor a
	call FarCall
Func_4e3ed: ; 4e3ed (13:63ed)
	ld hl, -1
	jp Func_4e4e3

Func_4e3f3: ; 4e3f3 (13:63f3)
	push bc
	call Func_4c0ac
	pop bc
	ld e, c
	ld d, $0
	ld hl, wSystemType
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_4e43e
	ld l, c
	dec l
	ld a, [wc2f7]
	cp l
	jp nz, Func_4e43e
	push bc
	ld e, $10
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e4e4
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, c
	ld d, $0
	ld hl, wSystemType
	add hl, de
	ld [hl], $ff
	ld e, c
	ld d, $0
	ld hl, wc300
	add hl, de
	ld [hl], $ff
	ld a, [wc306]
	dec a
	ld [wc306], a
	jp Func_4e4dd

Func_4e43e: ; 4e43e (13:643e)
	ld a, [wc2f7]
	cp c
	jp nz, Func_4e47a
	push bc
	ld a, c
	add $a
	ld e, $10
	call SetStringStartState
	ld hl, Data_4e4e6
	push hl
	call PlaceString
	pop bc
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
	ld a, [wc306]
	dec a
	ld [wc306], a
	pop bc
	ld e, c
	ld d, $0
	ld hl, wSystemType
	add hl, de
	ld [hl], $ff
	ld e, c
	ld d, $0
	ld hl, wc300
	add hl, de
	ld [hl], $ff
	jp Func_4e4dd

Func_4e47a: ; 4e47a (13:647a)
	ld a, [wc2f7]
	cp c
	jp nc, Func_4e4dd
	ld e, $11
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e4e8
	push hl
	call PlaceString
	pop bc
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
	ld a, [wc306]
	dec a
	ld [wc306], a
	ld e, $10
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e4ea
	push hl
	call PlaceString
	pop bc
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], $ff
	ld hl, wc306
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld [hl], $ff
	ld e, $11
	ld a, [wc2f7]
	add $b
	call SetStringStartState
	ld hl, Data_4e4ec
	push hl
	call PlaceString
	pop bc
Func_4e4dd: ; 4e4dd (13:64dd)
	call Func_4c0b9
	ld hl, $4000
Func_4e4e3: ; 4e4e3 (13:64e3)
	ret

Data_4e4e4: ; 4e4e4
	dstr " "

Data_4e4e6: ; 4e4e6
	dstr " "

Data_4e4e8: ; 4e4e8
	dstr "_"

Data_4e4ea: ; 4e4ea
	dstr " "

Data_4e4ec: ; 4e4ec
	dstr "b"

Func_4e4ee: ; 4e4ee (13:64ee)
	push af
	push de
	ld a, [wc2f9]
	or a
	jp nz, Func_4e4fc
	ld e, $0
	jp Func_4e4fe

Func_4e4fc: ; 4e4fc (13:64fc)
	ld e, $36
Func_4e4fe: ; 4e4fe (13:64fe)
	ld hl, sp+$3
	ld a, [hl]
	sub e
	ld hl, sp+$3
	ld [hl], a
	pop de
	ld a, e
	cp $23
	jp z, Func_4e56a
	cp $1d
	jp nz, Func_4e581
	ld hl, sp+$1
	ld a, [hl]
	cp $6
	jp c, Func_4e526
	ld hl, sp+$1
	ld a, [hl]
	cp $b
	jp nc, Func_4e526
	ld a, $1
	jp Func_4e581

Func_4e526: ; 4e526 (13:6526)
	ld hl, sp+$1
	ld a, [hl]
	cp $c
	jp c, Func_4e53b
	ld hl, sp+$1
	ld a, [hl]
	cp $11
	jp nc, Func_4e53b
	ld a, $1
	jp Func_4e581

Func_4e53b: ; 4e53b (13:653b)
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp c, Func_4e550
	ld hl, sp+$1
	ld a, [hl]
	cp $17
	jp nc, Func_4e550
	ld a, $1
	jp Func_4e581

Func_4e550: ; 4e550 (13:6550)
	ld hl, sp+$1
	ld a, [hl]
	cp $1e
	jp c, Func_4e565
	ld hl, sp+$1
	ld a, [hl]
	cp $23
	jp nc, Func_4e565
	ld a, $1
	jp Func_4e581

Func_4e565: ; 4e565 (13:6565)
	ld a, $ff
	jp Func_4e581

Func_4e56a: ; 4e56a (13:656a)
	ld hl, sp+$1
	ld a, [hl]
	cp $1e
	jp c, Func_4e57f
	ld hl, sp+$1
	ld a, [hl]
	cp $23
	jp nc, Func_4e57f
	ld a, $1
	jp Func_4e581

Func_4e57f: ; 4e57f (13:657f)
	ld a, $ff
Func_4e581: ; 4e581 (13:6581)
	pop bc
	ret

Data_4e583: ; 4e583
	db $21, $01, $03, $1a, $00, $04, $07, $0b

Func_4e58b:: ; 4e58b
	push hl
	add sp, -$16
	ld hl, sp+$16
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	xor a
	push af
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$19
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$18
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld l, [hl]
	push hl
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wSaveScratchPlayerName
	reg16swap de, hl
	ld hl, sp+$a
	ld bc, $5
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call Func_1fbe
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$19
	ld a, [hl]
	ld hl, sp+$18
	ld l, [hl]
	ld h, a
	call Func_4c0d3
	ld c, $3
	ld e, $a
	ld hl, $0
	call Func_4c0d3
	ld c, $5
	ld e, $a
	ld hl, $a06
	call Func_4c0d3
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4e743
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld de, Data_4e749
	ld hl, $b01
	call PlaceStringDEatCoordHL
	ld de, Data_4e754
	ld hl, $b07
	call PlaceStringDEatCoordHL
	ld de, Data_4e75b
	ld hl, $10e
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$4
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $5
	call FarCall
	xor a
	ld [wc2f7], a
	xor a
	ld [wTimeSetMonthsTensDigit], a
	ld a, $1
	ld [wTimeSetMonthsOnesDigit], a
	xor a
	ld [wTimeSetDaysTensDigit], a
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
	ld de, Data_4e771
	ld hl, $d03
	call PlaceStringDEatCoordHL
	ld de, Data_4e777
	ld hl, $1103
	call PlaceStringDEatCoordHL
	call Func_4e780
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	call WriteHLToSPPlus4
	pop af
	or a
	jp nz, Func_4e6ac
	ld hl, $0
	jp Func_4e6af

Func_4e6ac: ; 4e6ac (13:66ac)
	ld hl, $310
Func_4e6af: ; 4e6af (13:66af)
	ld de, $89b0
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	reg16swap de, hl
	ld a, $c5
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_615be
	ld a, $c5
	call FarCall
	push af
	set_farcall_addrs_hli Func_613fc
	pop af
	ld e, a
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_4e6f4
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4e6fd
Func_4e6f4: ; 4e6f4 (13:66f4)
	ld de, $8
	ld hl, Data_4e583
	call Func_2b7d
Func_4e6fd: ; 4e6fd (13:66fd)
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $4
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	pop hl
	push hl
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
	add sp, $18
	reg16swap de, hl
	ret

Data_4e743: ; 4e743
	dstr "(なまえ)"

Data_4e749: ; 4e749
	dstr "(たんしﾞょうひﾞ)"

Data_4e754: ; 4e754
	dstr "(せいさﾞ)"

Data_4e75b: ; 4e75b
	dstr "ホﾞク(の たんしﾞょうひﾞを きめて)ネ"

Data_4e771: ; 4e771
	dstr "(かﾞつ)"

Data_4e777: ; 4e777
	dstr "(にち)"

Data_4e77c: ; 4e77c
	db 11, 12
	db 15, 16

Func_4e780: ; 4e780 (13:6780)
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_4e77c
	ld bc, $4
	call MemCopy
	ld l, $0
Func_4e793: ; 4e793 (13:6793)
	ld a, l
	cp $4
	jp nc, Func_4e7fb
	ld a, [wc2f7]
	cp l
	jp nz, Func_4e7bb
	push hl
	ld e, l
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	inc hl
	ld de, Data_4e80c
	call PlaceStringDEatCoordHL
	pop hl
	jp Func_4e7d3

Func_4e7bb: ; 4e7bb (13:67bb)
	push hl
	ld e, l
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	inc hl
	ld de, Data_4e80e
	call PlaceStringDEatCoordHL
	pop hl
Func_4e7d3: ; 4e7d3 (13:67d3)
	push hl
	ld e, l
	ld d, $0
	ld hl, sp+$2
	add hl, de
	ld a, [hl]
	ld e, $3
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
	ld hl, Data_4e810
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
	inc l
	jp Func_4e793

Func_4e7fb: ; 4e7fb (13:67fb)
	callba_hli ComputeAndPrintZodiacSign
	pop bc
	pop bc
	ret

Data_4e80c: ; 4e80c
	dstr "b"

Data_4e80e: ; 4e80e
	dstr "_"

Data_4e810: ; 4e810
	dstr "%d"

Func_4e813:: ; 4e813 (13:6813)
	push bc
	push bc
	push de
	reg16swap de, hl
	ld hl, $d
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, $0
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	ld l, a
	push hl
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	ld c, $0
	pop hl
	ld a, [wc2f7]
	cp $3
	jp z, Func_4e89e
	cp $2
	jp z, Func_4e884
	cp $1
	jp z, Func_4e863
	or a
	jp nz, Func_4e8a9
	push hl
	ld c, $0
	ld hl, sp+$7
	ld [hl], $1
	pop hl
	jp Func_4e8a9

Func_4e863: ; 4e863 (13:6863)
	push hl
	ld a, [wTimeSetMonthsTensDigit]
	cp $1
	jp nz, Func_4e873
	ld hl, sp+$7
	ld [hl], $2
	jp Func_4e880

Func_4e873: ; 4e873 (13:6873)
	ld a, [wTimeSetMonthsTensDigit]
	or a
	jp nz, Func_4e87c
	ld c, $1
Func_4e87c: ; 4e87c (13:687c)
	ld hl, sp+$7
	ld [hl], $9
Func_4e880: ; 4e880 (13:6880)
	pop hl
	jp Func_4e8a9

Func_4e884: ; 4e884 (13:6884)
	push hl
	ld a, l
	cp $2
	jp nz, Func_4e894
	ld c, $0
	ld hl, sp+$7
	ld [hl], $2
	jp Func_4e89a

Func_4e894: ; 4e894 (13:6894)
	ld c, $0
	ld hl, sp+$7
	ld [hl], $3
Func_4e89a: ; 4e89a (13:689a)
	pop hl
	jp Func_4e8a9

Func_4e89e: ; 4e89e (13:689e)
	push hl
	ld hl, $0
	ld c, $0
	ld hl, sp+$7
	ld [hl], $9
	pop hl
Func_4e8a9: ; 4e8a9 (13:68a9)
	pop de
	push hl
	ld a, e
	sub $3
	or d
	jp z, Func_4e9a6
	ld a, e
	sub $2
	or d
	jp z, Func_4e994
	ld a, e
	dec a
	or d
	jp z, Func_4e92b
	ld a, e
	or d
	jp nz, Func_4e9b5
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nz, Func_4e902
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], c
	ld hl, sp+$5
	ld a, [hl]
	cp c
	jp z, Func_4e8ff
	ld a, [wc2f7]
	or a
	jp z, Func_4e8f6
	ld a, [wc2f7]
	cp $1
	jp nz, Func_4e8ff
Func_4e8f6: ; 4e8f6 (13:68f6)
	xor a
	ld [wTimeSetDaysTensDigit], a
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
Func_4e8ff: ; 4e8ff (13:68ff)
	jp Func_4e928

Func_4e902: ; 4e902 (13:6902)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
	ld a, [wc2f7]
	or a
	jp z, Func_4e91f
	ld a, [wc2f7]
	cp $1
	jp nz, Func_4e928
Func_4e91f: ; 4e91f (13:691f)
	xor a
	ld [wTimeSetDaysTensDigit], a
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
Func_4e928: ; 4e928 (13:6928)
	jp Func_4e9b5

Func_4e92b: ; 4e92b (13:692b)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp c
	jp nz, Func_4e96a
	ld hl, sp+$5
	ld a, [hl]
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld [hl], a
	ld hl, sp+$5
	ld a, [hl]
	cp c
	jp z, Func_4e967
	ld a, [wc2f7]
	or a
	jp z, Func_4e95e
	ld a, [wc2f7]
	cp $1
	jp nz, Func_4e967
Func_4e95e: ; 4e95e (13:695e)
	xor a
	ld [wTimeSetDaysTensDigit], a
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
Func_4e967: ; 4e967 (13:6967)
	jp Func_4e991

Func_4e96a: ; 4e96a (13:696a)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMonthsTensDigit
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	ld a, [wc2f7]
	or a
	jp z, Func_4e988
	ld a, [wc2f7]
	cp $1
	jp nz, Func_4e991
Func_4e988: ; 4e988 (13:6988)
	xor a
	ld [wTimeSetDaysTensDigit], a
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
Func_4e991: ; 4e991 (13:6991)
	jp Func_4e9b5

Func_4e994: ; 4e994 (13:6994)
	ld a, [wc2f7]
	cp $3
	jp nc, Func_4e9a3
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
Func_4e9a3: ; 4e9a3 (13:69a3)
	jp Func_4e9b5

Func_4e9a6: ; 4e9a6 (13:69a6)
	ld a, [wc2f7]
	cp $1
	jp c, Func_4e9b5
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
Func_4e9b5: ; 4e9b5 (13:69b5)
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	cp $d
	jp c, Func_4e9cd
	xor a
	ld [wTimeSetMonthsOnesDigit], a
	jp Func_4e9e1

Func_4e9cd: ; 4e9cd (13:69cd)
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	jp nz, Func_4e9e1
	ld a, $1
	ld [wTimeSetMonthsOnesDigit], a
Func_4e9e1: ; 4e9e1 (13:69e1)
	pop hl
	ld a, l
	cp $4
	jp z, Func_4e9fa
	ld a, l
	cp $6
	jp z, Func_4e9fa
	ld a, l
	cp $9
	jp z, Func_4e9fa
	ld a, l
	cp $b
	jp nz, Func_4ea12
Func_4e9fa: ; 4e9fa (13:69fa)
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	cp $1f
	jp c, Func_4ea0f
	xor a
	ld [wTimeSetDaysOnesDigit], a
Func_4ea0f: ; 4ea0f (13:6a0f)
	jp Func_4ead7

Func_4ea12: ; 4ea12 (13:6a12)
	ld a, l
	cp $2
	jp nz, Func_4eabc
	ld hl, sp+$2
	ld a, [hl]
	cp $20
	jp nz, Func_4eab9
	ld hl, wTimeSetCenturies
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	push hl
	ld hl, wTimeSetMillennia
	ld l, [hl]
	ld h, $0
	ld de, $3e8
	call MultiplyHLbyDE
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, wTimeSetDecades
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld a, [wTimeSetYears]
	ld e, a
	ld d, $0
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	ld de, $4
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_4ea73
	pop hl
	push hl
	ld de, $64
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_4ea80
Func_4ea73: ; 4ea73 (13:6a73)
	pop hl
	push hl
	ld de, $190
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_4ea9e
Func_4ea80: ; 4ea80 (13:6a80)
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	cp $1e
	jp c, Func_4ea9b
	ld a, $9
	ld [wTimeSetDaysOnesDigit], a
	ld a, $2
	ld [wTimeSetDaysTensDigit], a
Func_4ea9b: ; 4ea9b (13:6a9b)
	jp Func_4eab9

Func_4ea9e: ; 4ea9e (13:6a9e)
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	cp $1d
	jp c, Func_4eab9
	ld a, $8
	ld [wTimeSetDaysOnesDigit], a
	ld a, $2
	ld [wTimeSetDaysTensDigit], a
Func_4eab9: ; 4eab9 (13:6ab9)
	jp Func_4ead7

Func_4eabc: ; 4eabc (13:6abc)
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	cp $20
	jp c, Func_4ead7
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
	ld a, $3
	ld [wTimeSetDaysTensDigit], a
Func_4ead7: ; 4ead7 (13:6ad7)
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	jp nz, Func_4eaeb
	ld a, $1
	ld [wTimeSetDaysOnesDigit], a
Func_4eaeb: ; 4eaeb (13:6aeb)
	ld hl, sp+$2
	ld a, [hl]
	cp $20
	jp nz, Func_4eb51
	ld e, $5
	ld a, $7
	call SetStringStartState
	ld hl, wTimeSetMonthsOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMonthsTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_4eb67
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $5
	ld a, $c
	call SetStringStartState
	ld hl, wTimeSetDaysOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetDaysTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_4eb6c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	set_farcall_addrs_hli Func_533f8
	ld a, $1
	call FarCall
	ld l, $2
	push hl
	ld c, $8
	ld e, $5
	ld a, $7
	call PushBGMapRegion
	pop bc
	jp Func_4eb61

Func_4eb51: ; 4eb51 (13:6b51)
	call Func_4e780
	ld l, $b
	push hl
	ld c, $a
	ld e, $0
	ld a, $a
	call PushBGMapRegion
	pop bc
Func_4eb61: ; 4eb61 (13:6b61)
	ld hl, $4000
	pop bc
	pop bc
	ret

Data_4eb67: ; 4eb67
	dstr "%d%d"

Data_4eb6c: ; 4eb6c
	dstr "%d%d"

Func_4eb71:: ; 4eb71
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4ec21
	ld hl, $10e
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	callba_hli Func_1482e
	push hl
	callba_hli ComputeAndPrintZodiacSign
	ld c, a
	pop hl
	ld a, l
	or h
	jp nz, Func_4ec1d
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	ld [wSaveScratchBirthMonth], a
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	ld [wSaveScratchBirthDay], a
	pop bc
	ld a, c
	ld [wSaveScratchZodiacSign], a
	ld a, e
	call GetSRAMBank
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_4ec03
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4ec17
Func_4ec03: ; 4ec03 (13:6c03)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4ec17: ; 4ec17 (13:6c17)
	ld hl, $0
	jp Func_4ec20

Func_4ec1d: ; 4ec1d (13:6c1d)
	ld hl, $1
Func_4ec20: ; 4ec20 (13:6c20)
	ret

Data_4ec21: ; 4ec21
	dstr "(これてﾞいい)?"

Func_4ec2b:: ; 4ec2b (13:6c2b)
	push af
	push bc
	push de
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	ld hl, sp+$2
	ld [hl], $ff
	pop de
	ld a, e
	cp $3
	jp z, Func_4ed0e
	cp $2
	jp z, Func_4eccc
	cp $1
	jp z, Func_4ec88
	or a
	jp nz, Func_4ed53
	ld a, [wc9a2]
	cp $14
	jp c, Func_4ec6c
	ld a, c
	call GetSRAMBank
	ld a, $ff
	jp Func_4ed5a

Func_4ec6c: ; 4ec6c (13:6c6c)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, wc9a2
	ld l, [hl]
	ld h, $0
	ld de, wc98e
	add hl, de
	ld [hl], a
	ld a, [wc9a2]
	inc a
	ld [wc9a2], a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_4ed53

Func_4ec88: ; 4ec88 (13:6c88)
	push bc
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld [hl], $0
	ld a, [wc9a2]
	dec a
	ld [wc9a2], a
	ld hl, sp+$5
	ld c, [hl]
Func_4ec9e: ; 4ec9e (13:6c9e)
	ld a, c
	ld hl, wc9a2
	cp [hl]
	jp nc, Func_4ecbb
	ld e, c
	ld d, $0
	inc de
	ld hl, wc98e
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld [hl], a
	inc c
	jp Func_4ec9e

Func_4ecbb: ; 4ecbb (13:6cbb)
	ld e, c
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld [hl], $0
	ld hl, sp+$2
	ld [hl], $1
	pop bc
	jp Func_4ed53

Func_4eccc: ; 4eccc (13:6ccc)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, $0
Func_4ece2: ; 4ece2 (13:6ce2)
	ld a, c
	cp $fa
	jp nc, Func_4ed0a
	ld e, c
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_4ed06
	ld hl, sp+$5
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $1
	jp Func_4ed0a

Func_4ed06: ; 4ed06 (13:6d06)
	inc c
	jp Func_4ece2

Func_4ed0a: ; 4ed0a (13:6d0a)
	pop bc
	jp Func_4ed53

Func_4ed0e: ; 4ed0e (13:6d0e)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld [hl], $0
	ld hl, sp+$5
	ld c, [hl]
Func_4ed30: ; 4ed30 (13:6d30)
	ld a, c
	cp $f9
	jp nc, Func_4ed4a
	ld e, c
	ld d, $0
	ld hl, wSaveBlock4 + 1
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld [hl], a
	inc c
	jp Func_4ed30

Func_4ed4a: ; 4ed4a (13:6d4a)
	xor a
	ld [wSaveBlock4 + $f9], a
	ld hl, sp+$2
	ld [hl], $1
	pop bc
Func_4ed53: ; 4ed53 (13:6d53)
	ld a, c
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
Func_4ed5a: ; 4ed5a (13:6d5a)
	pop bc
	pop bc
	ret

Func_4ed5d:: ; 4ed5d (13:6d5d)
	push af
	push de
	set_farcall_addrs_hli Func_6f6de
	pop de
	pop af
	call FarCall
	ret

Func_4ed70:: ; 4ed70 (13:6d70)
	push af
	push bc
	push de
	ld hl, sp+$2
	ld [hl], $ff
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	pop de
	ld a, e
	cp $3
	jp z, Func_4ee63
	cp $2
	jp z, Func_4ee21
	cp $1
	jp z, Func_4edcd
	or a
	jp nz, Func_4eea3
	ld a, [wc9b7]
	cp $14
	jp c, Func_4edb1
	ld a, c
	call GetSRAMBank
	ld a, $ff
	jp Func_4eeaa

Func_4edb1: ; 4edb1 (13:6db1)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, wc9b7
	ld l, [hl]
	ld h, $0
	ld de, wc9a3
	add hl, de
	ld [hl], a
	ld a, [wc9b7]
	inc a
	ld [wc9b7], a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_4eea3

Func_4edcd: ; 4edcd (13:6dcd)
	ld a, [wc9b7]
	or a
	jp nz, Func_4eddd
	ld a, c
	call GetSRAMBank
	ld a, $ff
	jp Func_4eeaa

Func_4eddd: ; 4eddd (13:6ddd)
	push bc
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld [hl], $0
	ld a, [wc9b7]
	dec a
	ld [wc9b7], a
	ld hl, sp+$5
	ld c, [hl]
Func_4edf3: ; 4edf3 (13:6df3)
	ld a, c
	ld hl, wc9b7
	cp [hl]
	jp nc, Func_4ee10
	ld e, c
	ld d, $0
	inc de
	ld hl, wc9a3
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld [hl], a
	inc c
	jp Func_4edf3

Func_4ee10: ; 4ee10 (13:6e10)
	ld e, c
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld [hl], $0
	ld hl, sp+$2
	ld [hl], $1
	pop bc
	jp Func_4eea3

Func_4ee21: ; 4ee21 (13:6e21)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, $0
Func_4ee37: ; 4ee37 (13:6e37)
	ld a, c
	cp $dc
	jp nc, Func_4ee5f
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_4ee5b
	ld hl, sp+$5
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld [hl], a
	ld hl, sp+$2
	ld [hl], $1
	jp Func_4ee5f

Func_4ee5b: ; 4ee5b (13:6e5b)
	inc c
	jp Func_4ee37

Func_4ee5f: ; 4ee5f (13:6e5f)
	pop bc
	jp Func_4eea3

Func_4ee63: ; 4ee63 (13:6e63)
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$5
	ld c, [hl]
Func_4ee7a: ; 4ee7a (13:6e7a)
	ld a, c
	cp $dc
	jp nc, Func_4ee94
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3 + 1
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld [hl], a
	inc c
	jp Func_4ee7a

Func_4ee94: ; 4ee94 (13:6e94)
	xor a
	ld [$cd0f], a
	pop bc
	push bc
	ld a, c
	call GetSRAMBank
	ld hl, sp+$2
	ld [hl], $1
	pop bc
Func_4eea3: ; 4eea3 (13:6ea3)
	ld a, c
	call GetSRAMBank
	ld hl, sp+$0
	ld a, [hl]
Func_4eeaa: ; 4eeaa (13:6eaa)
	pop bc
	pop bc
	ret

INCLUDE "items/item_effects.asm"

Func_4f850: ; 4f850
	add sp, -$1e
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	push hl
	set_farcall_addrs_hli GetName
	pop hl
	pop af
	push hl
	ld hl, sp+$2
	push hl
	ld l, a
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	ld c, $a
	call FarCall
	pop hl
	ld a, l
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	add sp, $1e
	ret

Pointers_4f8a6: ; 4f8a6
	dw Data_4f8aa
	dw $0

Data_4f8aa: ; 4f8aa
	dstr "(しんかした)"

Data_4f8b2: ; 4f8b2
	db $21, $01, $07, $1f, $06, $04, $0d, $0b

Data_4f8ba: ; 4f8ba
	db $22, $00, $02, $00, $06, $04, $01, $03, $00, $06, $04, $01, $04, $00, $01, $20, $63, $16, $0a, $07, $1d, $0c, $18, $05, $00

Data_4f8d3: ; 4f8d3
	db $17, $03, $01, $06, $04, $01, $20, $5f, $1d, $0c, $18, $11, $20, $68, $0f, $20, $68, $0f, $02, $01, $06, $04, $05, $01, $00

Func_4f8ec:: ; 4f8ec (13:78ec)
	push af
	add sp, -$70
	push de
	ld hl, sp+$1b
	reg16swap de, hl
	ld hl, Data_4f8ba
	ld bc, $19
	call MemCopy
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_4f8d3
	ld bc, $19
	call MemCopy
	callba_hli AllocateMonsterStruct
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_dc0a
	ld hl, sp+$73
	ld e, [hl]
	xor a
	call FarCall
	set_farcall_addrs_hli Func_dc0a
	pop de
	push de
	ld a, $1
	call FarCall
	ld a, [wSongCurrentlyPlaying]
	push af
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld hl, sp+$1d
	call Func_4fac6
	ld hl, sp+$4
	call Func_4fac6
	ld a, [wSystemType]
	cp $1
	jp z, Func_4f978
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4f981
Func_4f978: ; 4f978 (13:7978)
	ld de, $8
	ld hl, Data_4f8b2
	call Func_2b7d
Func_4f981: ; 4f981 (13:7981)
	pop af
	call OverworldPlaySong
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$36
	ld [hl], $0
Func_4f99d: ; 4f99d (13:799d)
	ld hl, sp+$36
	ld a, [hl]
	cp $4
	jp nc, Func_4f9ce
	ld hl, sp+$36
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	dec a
	ld hl, sp+$75
	cp [hl]
	jp nz, Func_4f9c4
	jp Func_4f9ce

Func_4f9c4: ; 4f9c4 (13:79c4)
	ld hl, sp+$36
	ld a, [hl]
	inc a
	ld hl, sp+$36
	ld [hl], a
	jp Func_4f99d

Func_4f9ce: ; 4f9ce (13:79ce)
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$55
	reg16swap de, hl
	ld hl, sp+$36
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	inc h
	call FarCall
	set_farcall_addrs_hli GetName
	pop af
	pop de
	push af
	ld hl, sp+$35
	push hl
	ld l, e
	ld h, $0
	ld de, $600
	add hl, de
	pop de
	ld c, $6
	call FarCall
	pop af
	call GetSRAMBank
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$51
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld hl, Data_4fab2
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$33
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld hl, Data_4fab7
	push hl
	call PlaceString
	pop bc
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4f8a6)
	ld de, Pointers_4f8a6
	ld hl, $110
	call FarCall
	call Func_4c0ac
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_4fa8a
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_4fa9e
Func_4fa8a: ; 4fa8a (13:7a8a)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_4fa9e: ; 4fa9e (13:7a9e)
	call Func_4c0b9
	callba_hli FreeMonsterStruct
	add sp, $72
	ret

Data_4fab2: ; 4fab2
	dstr "(は) "

Data_4fab7: ; 4fab7
	dstr "(に)"

Func_4fabb: ; 4fabb (13:7abb)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_4fabb
	ret

Func_4fac6: ; 4fac6 (13:7ac6)
	push hl
	ld bc, $a0
	ld e, $0
	ld hl, wOAM00YCoord
	call FillMemory
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call Func_4fabb
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
	call Func_4fabb
	call WaitVideoTransfer
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $0
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
	call Func_4fabb
	call WaitVideoTransfer
	ret

Func_4fb46: ; 4fb46 (13:7b46)
	ld a, [wc319]
	cp $81
	jp nz, Func_4fb54
	call Func_4fb58
	jp Func_4fb57

Func_4fb54: ; 4fb54 (13:7b54)
	call Func_4fd2f
Func_4fb57: ; 4fb57 (13:7b57)
	ret

Func_4fb58: ; 4fb58 (13:7b58)
	add sp, -$2c
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$29
	ld [hl], $0
Func_4fb72: ; 4fb72 (13:7b72)
	ld hl, sp+$29
	ld a, [hl]
	cp $4
	jp nc, Func_4fbd5
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld [hl], $ff
	ld hl, sp+$29
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_4fbcb
	ld hl, sp+$29
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
	jp nc, Func_4fbcb
	ld hl, sp+$29
	ld e, [hl]
	ld d, $0
	ld hl, sp+$25
	add hl, de
	ld [hl], $1
Func_4fbcb: ; 4fbcb (13:7bcb)
	ld hl, sp+$29
	ld a, [hl]
	inc a
	ld hl, sp+$29
	ld [hl], a
	jp Func_4fb72

Func_4fbd5: ; 4fbd5 (13:7bd5)
	pop af
	call GetSRAMBank
Func_4fbd9: ; 4fbd9 (13:7bd9)
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $9
	call FarCall
	ld a, l
	ld hl, sp+$2a
	ld [hl], a
	ld hl, sp+$2a
	ld a, [hl]
	cp $4
	jp nc, Func_4fc32
	ld hl, sp+$28
	ld [hl], $0
	ld c, $0
Func_4fbfb: ; 4fbfb (13:7bfb)
	ld a, c
	cp $4
	jp nc, Func_4fc1f
	ld a, [wc2e9]
	cp c
	jp z, Func_4fc1b
	ld e, c
	ld d, $0
	ld hl, sp+$23
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_4fc1b
	ld hl, sp+$28
	ld [hl], $1
	jp Func_4fc1f

Func_4fc1b: ; 4fc1b (13:7c1b)
	inc c
	jp Func_4fbfb

Func_4fc1f: ; 4fc1f (13:7c1f)
	ld hl, sp+$28
	ld a, [hl]
	cp $1
	jp nz, Func_4fc2a
	jp Func_4fc38

Func_4fc2a: ; 4fc2a (13:7c2a)
	ld a, $a
	call Func_4ca74
	jp Func_4fc35

Func_4fc32: ; 4fc32 (13:7c32)
	jp Func_4fc38

Func_4fc35: ; 4fc35 (13:7c35)
	jp Func_4fbd9

Func_4fc38: ; 4fc38 (13:7c38)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$2a
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$2a
	ld a, [hl]
	cp $4
	jp nc, Func_4fd2c
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $23
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_4fd01
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_4fd01
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$2a
	ld [hl], a
	ld hl, sp+$29
	ld a, [hl]
	cp $4
	jp nc, Func_4fcf9
	set_farcall_addrs_hli Func_6ef0d
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $1
	ld a, [wc2e9]
	call FarCall
	callba_hli SaveGame
	ld a, $8
	call Func_4ca74
	jp Func_4fd2c

Func_4fcf9: ; 4fcf9 (13:7cf9)
	ld a, $5
	call Func_4ca74
	jp Func_4fd2c

Func_4fd01: ; 4fd01 (13:7d01)
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $1
	ld a, [wc2e9]
	call FarCall
	callba_hli SaveGame
	ld a, $8
	call Func_4ca74
	jp Func_4fd2c

Func_4fd2c: ; 4fd2c (13:7d2c)
	add sp, $2c
	ret

Func_4fd2f: ; 4fd2f (13:7d2f)
	add sp, -$2a
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld de, Data_4fec4
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_4fed4
	ld hl, $110
	call PlaceStringDEatCoordHL
	call Func_4c0b9
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$25
	reg16swap de, hl
	ld hl, $1
	call FarCall
	ld hl, sp+$25
	ld a, [hl]
	cp $4
	jp nc, Func_4fec1
	ld e, $0
	push de
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $23
	call FarCall
	pop de
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_4fe0e
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_4fe0e
	push de
	set_farcall_addrs_hli Func_52d58
	ld hl, sp+$28
	call FarCall
	ld hl, sp+$25
	ld [hl], a
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$25
	reg16swap de, hl
	ld hl, $1
	call FarCall
	pop de
	ld hl, sp+$23
	ld a, [hl]
	cp $4
	jp nz, Func_4fddc
	ld e, $1
	jp Func_4fe0e

Func_4fddc: ; 4fddc (13:7ddc)
	push de
	ld c, $0
Func_4fddf: ; 4fddf (13:7ddf)
	ld a, c
	cp $4
	jp nc, Func_4fdf7
	ld e, c
	ld d, $0
	ld hl, sp+$28
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_4fdf3
	jp Func_4fdf7

Func_4fdf3: ; 4fdf3 (13:7df3)
	inc c
	jp Func_4fddf

Func_4fdf7: ; 4fdf7 (13:7df7)
	push bc
	set_farcall_addrs_hli Func_6ef7f
	pop bc
	ld a, c
	add $ab
	call FarCall
	ld hl, sp+$2
	ld [hl], a
	pop de
Func_4fe0e: ; 4fe0e (13:7e0e)
	inc e
	dec e
	jp nz, Func_4fec1
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$26
	ld [hl], $0
Func_4fe2b: ; 4fe2b (13:7e2b)
	ld hl, sp+$26
	ld a, [hl]
	cp $4
	jp nc, Func_4feaa
	ld hl, sp+$26
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_4fea0
	read_hl_from_sp_plus $12
	write_hl_to_sp_plus $10
	read_hl_from_sp_plus $16
	write_hl_to_sp_plus $14
	ld hl, sp+$18
	ld [hl], $0
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$26
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $0
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $1
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	jp Func_4feaa

Func_4fea0: ; 4fea0 (13:7ea0)
	ld hl, sp+$26
	ld a, [hl]
	inc a
	ld hl, sp+$26
	ld [hl], a
	jp Func_4fe2b

Func_4feaa: ; 4feaa (13:7eaa)
	pop af
	call GetSRAMBank
	callba_hli SaveGame
	ld a, $9
	call Func_4ca74
Func_4fec1: ; 4fec1 (13:7ec1)
	add sp, $2a
	ret

Data_4fec4: ; 4fec4
	dstr "(くれる) ロホﾞホﾟン(を)"

Data_4fed4: ; 4fed4
	dstr "(えらんてﾞいるよ)"

Func_4fedf: ; 4fedf (13:7edf)
	ld a, [wc319]
	cp $81
	jp nz, Func_4feed
	call Func_4fd2f
	jp Func_4fef0

Func_4feed: ; 4feed (13:7eed)
	call Func_4fb58
Func_4fef0: ; 4fef0 (13:7ef0)
	ret

Func_4fef1:: ; 4fef1 (13:7ef1)
	push bc
	push bc
	push bc
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	ld a, [wOptions]
	and $2 ; Stereo
	push af
	ld a, l
	call GetSRAMBank
	pop af
	or a
	jp nz, .fail
	callba_hli Func_e3507
	callba_hli Func_e1aa9
	xor a
.loop
	cp $4
	jp nc, .break
	push af
	set_farcall_addrs_hli Func_93941
	pop af
	push af
	inc a
	call FarCall
	pop af
	inc a
	jp .loop

.break
	jp .quit

.fail
	ld bc, $8
	ld e, $0
	ld hl, sp+$0
	call FillMemory
	xor a
.loop2
	cp $b
	jp nc, .quit
	push af
	cp $a
	jp nz, .okay
	ld hl, sp+$4
	ld [hl], $8
.okay
	set_farcall_addrs_hli Func_935a8
	pop af
	push af
	ld hl, sp+$2
	reg16swap de, hl
	ld l, a
	ld h, $0
	call FarCall
	pop af
	inc a
	jp .loop2

.quit
	pop bc
	pop bc
	pop bc
	pop bc
	ret


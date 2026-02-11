INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 16", ROMX
GFX_58000:: INCBIN "gfx/misc/58000.2bpp"
GFX_58080:: INCBIN "gfx/misc/58080.2bpp"
GFX_58100:: INCBIN "gfx/misc/58100.2bpp"
GFX_58180:: INCBIN "gfx/misc/58180.2bpp"
GFX_58380:: INCBIN "gfx/misc/58380.2bpp"
GFX_58400:: INCBIN "gfx/misc/58400.2bpp"
GFX_58800: INCBIN "gfx/misc/58800.2bpp"

Func_58c00:
	ret

Data_58c01:: ; 58c01
	db  0, 0
	db 11, 5
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_33524
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Pointers_58c20:
	dw Data_58c24
	dw Data_58c30

Data_58c24:
	dstr "チッフﾟ(のこうしん)"

Data_58c30:
	dstr "(しんかのいらい)"

Data_58c3a::
	dw 0
	dw 0
	dw -1
	dw 2
	dw 2
	dw 0
	dw Pointers_58c20
	db 2

Data_58c49:: ; 58c49
	db  0, 0
	db 12, 7
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_fb118
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Pointers_58c68:
	dw Data_58c6e
	dw Data_58c79
	dw Data_58c87

Data_58c6e:
	dstr "(けんきゅうとうし)"

Data_58c79:
	dstr "ロホﾞホﾟン(こうにゅう)"

Data_58c87:
	dstr "ロホﾞホﾟン(はﾞいきゃく)"

Data_58c96:: ; 58c96
	dw 0
	dw 0
	dw -1
	dw 3
	dw 3
	dw 0
	dw Pointers_58c68
	db 2

Data_58ca5:: ; 58ca5
	db 12, 0
	db  8, 9
	dba Func_595ab
	dbw 5, 0
	dba Func_59724
	dba Func_59905
	dba Func_152bd
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0


Data_58cc4:: ; 58cc4
	dw 0
	dw 0
	dw -1
	dw 4
	dw 4
	dw 0
	dw $18
	db $13

Data_58cd3::
	db  7,  0
	db 13, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_59e79
	dba Func_5adce
	dba Func_16038
	dba Func_160c2
	dbw 0, 0
	dbw 0, 0

Data_58cf2::
	dw 0
	dw 0
	dw -1
	dw 0
	dw 0
	dw -1
	dw $1b
	db $20

Data_58d01:
	db  0, 0
	db 20, 8
	dba Func_5a4c8
	dbw 5, 0
	dba Func_59724
	dba Func_5aaf7
	dba Func_5adce
	dba Func_5aa13
	dba Func_5aa19
	dbw 0, 0
	dbw 0, 0

Data_58d20:
	dw 0
	dw 0
	dw -1
	dw 0
	dw 0
	dw -1
	dw $1c
	db $1e

Data_58d2f:: ; 58d2f
	db 1, 3
	db 8, 9
	dba Func_5ade6
	dbw 5, 0
	dba Func_5b1eb
	dba Func_5b3da
	dba Func_5ba1e
	dba Func_5b3ce
	dba Func_5b3d4
	dbw 0, 0
	dbw 0, 0

Data_58d4e:: ; 58d4e
	dw 0
	dw 0
	dw -1
	dw 0
	dw 0
	dw -1
	dw $1d
	db 2

NamingScreen__:: ; 58d5d
	push af
	ld a, [wFarCallDestBank]
	ld l, a
	push hl
	set_farcall_addrs_hli NamingScreen_
	pop hl
	pop af
	push hl
	call FarCall
	pop hl
	ld a, l
	ld [wFarCallDestBank], a
	ret

Func_58d7a::
	push hl
	ld a, [wFarCallDestBank]
	push af
	set_farcall_addrs_hli Func_61e5b
	pop af
	pop hl
	push af
	call FarCall
	pop af
	ld [wFarCallDestBank], a
	ret

Pointers_58d95:
	dw Data_58dad
	dw Data_58db5
	dw Data_58dbb
	dw Data_58dc2
	dw Data_58dc7
	dw Data_58dcc
	dw Data_58dd2
	dw Data_58dda
	dw Data_58de0
	dw Data_58de5
	dw Data_58deb
	dw Data_58df4

Data_58dad:
	dstr "(おひつしﾞ)"

Data_58db5:
	dstr "(おうし)"

Data_58dbb:
	dstr "(ふたこﾞ)"

Data_58dc2:
	dstr "(かに)"

Data_58dc7:
	dstr "(しし)"

Data_58dcc:
	dstr "(おとめ)"

Data_58dd2:
	dstr "(てんひﾞん)"

Data_58dda:
	dstr "(さそり)"

Data_58de0:
	dstr "(いて)"

Data_58de5:
	dstr "(やきﾞ)"

Data_58deb:
	dstr "(みすﾞかﾞめ)"

Data_58df4:
	dstr "(うお)"

Func_58df9:: ; 58df9 (16:4df9)
	add sp, -$1a
	ld hl, sp+$5
	ld [hl], $4
	ld e, $9
	push de
	set_farcall_addrs_hli malloc
	ld hl, $90
	call FarCall
	ld c, l
	ld b, h
	push bc
	ld de, $1009
	ld hl, $409
	call BackUpTileMapRectangle
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wSaveScratchPlayerName
	reg16swap de, hl
	ld hl, sp+$c
	ld bc, $5
	call FarCopyVideoData
	ld a, [wSaveScratchZodiacSign]
	ld l, a
	push hl
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, sp+$c
	ld [hl], $0
	xor a
Func_58e5b: ; 58e5b (16:4e5b)
	cp $4
	jp nc, Func_58e84
	push af
	ld l, a
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_58e7f
	ld hl, sp+$e
	ld a, [hl]
	inc a
	ld hl, sp+$e
	ld [hl], a
Func_58e7f: ; 58e7f (16:4e7f)
	pop af
	inc a
	jp Func_58e5b

Func_58e84: ; 58e84 (16:4e84)
	pop hl
	pop af
	pop bc
	pop de
	push bc
	push hl
	push de
	call GetSRAMBank
	callba_hli Func_7cd1
	ld hl, sp+$a
	add [hl]
	ld hl, sp+$a
	ld [hl], a
	set_farcall_addrs_hli Func_17e95
	pop de
	push de
	ld hl, sp+$b
	ld a, [hl]
	ld l, e
	ld h, a
	ld e, $10
	ld c, $9
	call FarCall
	set_farcall_addrs_hli Func_16019
	pop de
	push de
	ld hl, sp+$c
	ld c, l
	ld b, h
	ld d, $0
	inc de
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	inc hl
	call FarCall
	ld hl, Data_58fe6
	push hl
	call PlaceString
	pop bc
	pop de
	pop hl
	push de
	ld h, $0
	add hl, hl
	ld de, Pointers_58d95
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, Data_58fef
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	push de
	ld d, $0
	inc de
	inc de
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_58ff2
	call PlaceStringDEatCoordHL
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_59000
	push hl
	call PlaceString
	pop bc
	pop de
	push de
	ld a, e
	add $5
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, sp+$4
	call PutLongFromHLOnStack
	ld hl, Data_59005
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	read_hl_from wGameTimer + 2
	push hl
	read_hl_from wGameTimer
	push hl
	ld hl, $0
	push hl
	ld hl, $e1e
	push hl
	call StackDivideLongSigned
	pop hl
	pop af
	pop de
	push hl
	ld a, e
	add $7
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	inc a
	call SetStringStartState
	ld hl, Data_59013
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld de, $3c
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld de, $203
	ld hl, -1
	call Func_2230
	ld hl, Data_5901f
	push hl
	call PlaceString
	pop bc
	pop hl
	ld de, $3c
	call DivideHLByDESigned
	ld c, e
	ld b, d
	ld de, $202
	ld hl, -1
	call Func_2230
	ld l, $9
	push hl
	ld c, $10
	ld e, $9
	ld a, $4
	call PushBGMapRegion
	pop bc
	pop bc
Func_58fa9: ; 58fa9 (16:4fa9)
	push bc
	call CheckButton
	pop bc
	cp $10
	jp nz, Func_58fb7
	xor a
	jp Func_58fd1

Func_58fb7: ; 58fb7 (16:4fb7)
	cp $20
	jp nz, Func_58fce
	push bc
	ld a, $ff
	push af
	ld de, $1009
	ld hl, $409
	call PopBGMapRegion
	pop af
	pop bc
	jp Func_58fd1

Func_58fce: ; 58fce (16:4fce)
	jp Func_58fa9

Func_58fd1: ; 58fd1 (16:4fd1)
	push af
	push bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop af
	add sp, $1a
	ret

Data_58fe6:
	dstr "(しゃちょう) "

Data_58fef:
	dstr "%s"

Data_58ff2:
	dstr "ロホﾞホﾟン(のかすﾞ) "

Data_59000:
	dstr "(たい)"

Data_59005:
	dstr "(しょしﾞきん) %ldG"

Data_59013:
	dstr "フﾟレイ(しﾞかん) "

Data_5901f:
	dstr ":"

Pointers_59021:
	dw Data_59025
	dw $0

Data_59025:
	dstr "チッフﾟ(をこうしんしました)"

Pointers_59035:
	dw Data_59039
	dw $0

Data_59039:
	dstr "(おかねかﾞ たりないよ)"

Pointers_59047:
	dw Data_5904b
	dw $0

Data_5904b:
	dstr "(これいしﾞょう こうしんてﾞきないよ)"

Pointers_59060:
	dw Data_59064
	dw $0

Data_59064:
	dstr "スクラッフﾟ(に なっているよ)"

Data_59075:
	db 2, 4, 8, 16, 32, 64

Data_5907b: ; 5907b
	db 8, 10, 12, 14, 16, 18

Data_59081: ; 59081
	db 5, 10, 20, 30, 40, 50

Func_59087:: ; 59087 (16:5087)
	add sp, -$26
	ld hl, sp+$1
	ld [hl], $0
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $6
	call FarCall
	ld a, l
	cp $4
	jp c, Func_590a8
	ld a, $ff
	jp Func_59457

Func_590a8: ; 590a8 (16:50a8)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $f
	ld hl, Func_0500
	call FarCall
	ld c, $5
	ld e, $a
	ld hl, $3
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $22
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	inc h
	call FarCall
	pop de
	pop af
	push de
	call GetSRAMBank
	ld de, Data_5945a
	ld hl, $601
	call PlaceStringDEatCoordHL
	ld hl, sp+$5
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_594a4
	pop bc
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$9
	ld c, l
	ld b, h
	ld de, $4
	ld hl, $1
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	cp $7
	jp c, Func_591cc
	ld hl, sp+$4
	ld a, [hl]
	add $f9
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld hl, sp+$4
	ld [hl], a
Func_591cc: ; 591cc (16:51cc)
	ld c, $0
	pop de
	push de
	ld hl, sp+$4
	ld a, [hl]
	cp $6
	jp nc, Func_5925a
	ld a, e
	or d
	jp z, Func_5925a
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, Data_59081
	add hl, de
	cp [hl]
	jp c, Func_591ef
	ld c, $1
Func_591ef: ; 591ef (16:51ef)
	ld a, c
	cp $1
	jp nz, Func_5924f
	push bc
	ld e, $6
	ld a, $2
	call SetStringStartState
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, Data_59075
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_59463
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_59466
	ld hl, -1
	call PlaceStringDEatCoordHL
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, Data_5907b
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_5946e
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_59471
	ld hl, -1
	call PlaceStringDEatCoordHL
	ld de, Data_5947f
	ld hl, $110
	call PlaceStringDEatCoordHL
	pop bc
	jp Func_5925a

Func_5924f: ; 5924f (16:524f)
	push bc
	ld de, Data_59490
	ld hl, $206
	call PlaceStringDEatCoordHL
	pop bc
Func_5925a: ; 5925a (16:525a)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop de
	ld hl, sp+$2
	ld a, [hl]
	cp $6
	jp nc, Func_59276
	inc c
	dec c
	jp nz, Func_592c5
Func_59276: ; 59276 (16:5276)
	ld a, e
	or d
	jp z, Func_592c5
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
	ld c, BANK(Pointers_59047)
	ld de, Pointers_59047
	ld hl, $10e
	call FarCall
	ld hl, sp+$1
	ld [hl], $ff
	jp Func_59451

Func_592c5: ; 592c5 (16:52c5)
	ld a, e
	or d
	jp nz, Func_59314
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
	ld c, BANK(Pointers_59060)
	ld de, Pointers_59060
	ld hl, $10e
	call FarCall
	ld hl, sp+$1
	ld [hl], $ff
	jp Func_59451

Func_59314: ; 59314 (16:5314)
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, Func_5944d
	ld hl, sp+$3
	call PutLongFromHLOnStack
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, Data_5907b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld bc, $0
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call MultiplyLongsFromStack
	call SubtractLongsFromStack
	ld hl, sp+$7
	call PutLongFromStackToHL
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
	ld hl, sp+$3
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call CompareStackLongs_Signed
	jp c, Func_59424
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $1f
	add hl, de
	ld a, $1f
	and [hl]
	ld [hl], a
	ld de, wSaveScratchMoney
	ld hl, sp+$5
	ld bc, $4
	call MemCopy
	pop af
	call GetSRAMBank
	ld de, Data_5949b
	ld hl, $601
	call PlaceStringDEatCoordHL
	ld hl, sp+$3
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_594a4
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_59021)
	ld de, Pointers_59021
	ld hl, $10e
	call FarCall
	jp Func_5944a

Func_59424: ; 59424 (16:5424)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_59035)
	ld de, Pointers_59035
	ld hl, $10e
	call FarCall
	ld hl, sp+$1
	ld [hl], $ff
Func_5944a: ; 5944a (16:544a)
	jp Func_59451

Func_5944d: ; 5944d (16:544d)
	ld hl, sp+$1
	ld [hl], $ff
Func_59451: ; 59451 (16:5451)
	call Func_3af6
	ld hl, sp+$1
	ld a, [hl]
Func_59457: ; 59457 (16:5457)
	add sp, $26
	ret

Data_5945a:
	dstr "(しょしﾞきん)"

Data_59463:
	dstr "%d"

Data_59466:
	dstr "チッフﾟ(へ)"

Data_5946e:
	dstr "%d"

Data_59471:
	dstr "00G (ひつようてﾞす)"

Data_5947f:
	dstr "チッフﾟ(をこうしんしますか?)"

Data_59490:
	dstr "レヘﾞル(ふﾞそく)"

Data_5949b:
	dstr "(しょしﾞきん)"

Func_594a4: ; 594a4 (16:54a4)
	ld a, l
	and h
	inc a
	jp z, Func_594af
	ld e, l
	ld a, h
	call SetStringStartState
Func_594af: ; 594af (16:54af)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_594d4
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_59578
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_59577

Func_594d4: ; 594d4 (16:54d4)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_594f9
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_59583
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_59577

Func_594f9: ; 594f9 (16:54f9)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $3e8
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_5951e
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_5958d
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_59577

Func_5951e: ; 5951e (16:551e)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_59543
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_59596
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_59577

Func_59543: ; 59543 (16:5543)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $1
	push hl
	ld hl, $86a0
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_59568
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_5959e
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_59577

Func_59568: ; 59568 (16:5568)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_595a5
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
Func_59577: ; 59577 (16:5577)
	ret

Data_59578:
	dstr "      %ldG"

Data_59583:
	dstr "     %ldG"

Data_5958d:
	dstr "    %ldG"

Data_59596:
	dstr "   %ldG"

Data_5959e:
	dstr "  %ldG"

Data_595a5:
	dstr " %ldG"

Func_595ab:
	push hl
	add sp, -$20
	ld hl, sp+$20
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
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
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld l, [hl]
	inc hl
	ld h, [hl]
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	push de
	push bc
	read_hl_from_sp_plus $c
	ld de, $9
	add hl, de
	ld e, c
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop af
	pop hl
	push de
	push bc
	ld c, a
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$4
	ld l, [hl]
	ld h, a
	call FarCall
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	ld hl, sp+$5
	ld a, [hl]
	add $2
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	xor a
	pop bc
Func_5966c: ; 5966c (16:566c)
	cp c
	jp nc, Func_596d7
	push bc
	push de
	push af
	set_farcall_addrs_hli GetName
	pop af
	pop de
	push af
	push de
	ld hl, sp+$c
	reg16swap de, hl
	ld l, a
	ld h, $0
	inc h
	inc h
	inc h
	ld c, $6
	call FarCall
	pop de
	push de
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$c
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	call FarCall
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$8
	ld a, [hl]
	add $2
	ld hl, sp+$8
	ld [hl], a
	pop de
	pop af
	inc a
	pop bc
	jp Func_5966c

Func_596d7: ; 596d7 (16:56d7)
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus6
	call FarCall
	callba_hli Func_33375
	set_farcall_addrs_hli Func_333e0
	pop de
	ld a, e
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
	add sp, $22
	reg16swap de, hl
	ret

Func_59724: ; 59724 (16:5724)
	push bc
	push bc
	push bc
	push de
	xor a
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
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld a, [hl]
	push af
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_5977a
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
Func_5977a: ; 5977a (16:577a)
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	ld de, $b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	pop de
	push af
	ld a, e
	sub $3
	or d
	jp z, Func_59849
	ld a, e
	sub $2
	or d
	jp z, Func_59819
	ld a, e
	dec a
	or d
	jp z, Func_597d4
	ld a, e
	or d
	jp nz, Func_59870
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	inc h
	dec h
	bit 7, h
	jr z, .asm_597d1
	ld hl, $0
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_597cf
	ld hl, $0
	call WriteHLToSPPlus4
	jp .asm_597d1

.asm_597cf
	ld a, $1
.asm_597d1
	jp Func_59870

Func_597d4: ; 597d4 (16:57d4)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_59816
	ld l, c
	ld h, b
	dec hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	add hl, bc
	push hl
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_59814
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	jp Func_59816

Func_59814: ; 59814 (16:5814)
	ld a, $2
Func_59816: ; 59816 (16:5816)
	jp Func_59870

Func_59819: ; 59819 (16:5819)
	call GetHLAtSPPlus6
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_59846
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	inc hl
	call CompareHLtoBC
	jp nc, Func_59846
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus6
Func_59846: ; 59846 (16:5846)
	jp Func_59870

Func_59849: ; 59849 (16:5849)
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $3
	call CompareHLtoDE
	jp nc, Func_59870
	call GetHLAtSPPlus6
	dec hl
	dec hl
	dec hl
	dec hl
	inc h
	dec h
	bit 7, h
	jr nz, Func_59870
	call GetHLAtSPPlus6
	dec hl
	dec hl
	dec hl
	dec hl
	call WriteHLToSPPlus6
Func_59870: ; 59870 (16:5870)
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	cp $18
	jp nz, Func_598b9
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus6
	call FarCall
	set_farcall_addrs_hli Func_333e0
	call GetHLAtSPPlus4
	ld a, l
	call FarCall
	jp Func_598ea

Func_598b9: ; 598b9 (16:58b9)
	cp $1c
	jp nz, Func_598d9
	set_farcall_addrs_hli Func_50604
	call GetHLAtSPPlus6
	call FarCall
	call GetHLAtSPPlus4
	ld a, l
	call Func_5aa2f
	jp Func_598ea

Func_598d9: ; 598d9 (16:58d9)
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus6
	call FarCall
Func_598ea: ; 598ea (16:58ea)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Data_598fd:
	db $21, $01, $03, $1a, $06, $04, $0d, $0b

Func_59905:
	push hl
	ld hl, -$8c
	add hl, sp
	ld sp, hl
	ld hl, $8c
	add hl, sp
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $34
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
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	read_hl_from_sp_plus $36
	get_party_bot
	ld de, $1d
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	read_hl_from_sp_plus $38
	get_party_bot
	ld e, [hl]
	ld hl, sp+$35
	ld [hl], e
	read_hl_from_sp_plus $38
	get_party_bot
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$33
	ld [hl], e
	ld hl, sp+$35
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$4
	call GetRobotBaseStats
	call GetHLAtSPPlus9
	reg16swap de, hl
	pop bc
	pop af
	push bc
	push de
	push af
	ld hl, sp+$b
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
	reg16swap de, hl
	ld hl, sp+$3a
	ld bc, $7
	call FarCopyVideoData
	ld hl, sp+$8
	ld a, [hl]
	ld hl, sp+$36
	ld [hl], a
	ld hl, sp+$36
	ld a, [hl]
	cp $1
	jp c, Func_59a10
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$76
	push hl
	read_hl_from_sp_plus $3c
	inc h
	inc h
	inc h
	pop de
	call FarCall
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$58
	push hl
	ld hl, sp+$38
	ld l, [hl]
	ld h, $0
	ld de, $5ff
	add hl, de
	pop de
	call FarCall
Func_59a10: ; 59a10 (16:5a10)
	pop af
	call GetSRAMBank
	pop de
	pop bc
	ld a, e
	or d
	jp nz, Func_59a21
	ld hl, $4000
	jp Func_59c25

Func_59a21: ; 59a21 (16:5a21)
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_59a2f
	ld hl, $4000
	jp Func_59c25

Func_59a2f: ; 59a2f (16:5a2f)
	call Func_1f30
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$70
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	ld e, $1
	ld a, $7
	call SetStringStartState
	ld hl, $9a
	push hl
	ld hl, Data_59c33
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_59c36
	ld hl, -1
	call PlaceStringDEatCoordHL
	ld hl, sp+$2f
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_59c38
	push hl
	call PlaceString
	pop bc
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$34
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $c
	call FarCall
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	push hl
	reg16swap de, hl
	ld hl, sp+$33
	ld a, [hl]
	dec a
	ld bc, $89b0
	call DecompressRequestRoboponPic
	set_farcall_addrs_hli Func_615be
	ld hl, sp+$33
	ld a, [hl]
	dec a
	call FarCall
	push af
	set_farcall_addrs_hli Func_613fc
	pop af
	ld e, a
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_7c8a
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $604
	ld c, $2
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$70
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld hl, Data_59c3b
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$52
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld hl, Data_59c40
	push hl
	call PlaceString
	pop bc
	ld de, Data_59c44
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld a, [wSystemType]
	cp $1
	jp z, Func_59b7c
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_59b85
Func_59b7c: ; 59b7c (16:5b7c)
	ld de, $8
	ld hl, Data_598fd
	call Func_2b7d
Func_59b85: ; 59b85 (16:5b85)
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
	jp z, Func_59bec
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_59bc3
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_59bd7
Func_59bc3: ; 59bc3 (16:5bc3)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_59bd7: ; 59bd7 (16:5bd7)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call Func_1f7b
	ld hl, $8000
	jp Func_59c25

Func_59bec: ; 59bec (16:5bec)
	read_hl_from_sp_plus $34
	ld a, l
	ld [wc2e9], a
	set_farcall_addrs_hli Func_4f8ec
	ld hl, sp+$30
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$31
	ld a, [hl]
	dec a
	call FarCall
	call Func_2009
	call Func_1fbe
	callba_hli Func_54f0e
	call Func_1f7b
	ld hl, $8000
Func_59c25: ; 59c25 (16:5c25)
	reg16swap de, hl
	ld hl, $8e
	add hl, sp
	ld sp, hl
	reg16swap de, hl
	ret

Data_59c33:
	dstr "%c"

Data_59c36:
	dstr "V"

Data_59c38:
	dstr "%d"

Data_59c3b:
	dstr "(を) "

Data_59c40:
	dstr "(に)"

Data_59c44:
	dstr "(しんか させる?)"

Pointers_59c4f:
	dw Data_59c53
	dw $0

Data_59c53:
	dstr "(これいしﾞょう とうし てﾞきないよ)"

Pointers_59c68:
	dw Data_59c6c
	dw $0

Data_59c6c:
	dstr "(おかねかﾞ たりないよ)"

Pointers_59c7a:
	dw Data_59c7e
	dw $0

Data_59c7e:
	dstr "(とうし しました)"

Func_59c89::
	push bc
	push bc
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	ld de, wcb33
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	pop af
	call GetSRAMBank
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $f
	ld hl, Func_0500
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld c, $3
	ld e, $a
	ld hl, $a04
	call FarCall
	ld de, Data_59e42
	ld hl, $601
	call PlaceStringDEatCoordHL
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_594a4
	pop bc
	pop bc
	ld de, Data_59e4b
	ld hl, $b05
	call PlaceStringDEatCoordHL
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_59e55
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$4
	ld a, [hl]
	cp $8
	jp nc, Func_59d3e
	ld de, Data_59e59
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_59e69
	ld hl, $110
	call PlaceStringDEatCoordHL
Func_59d3e: ; 59d3e (16:5d3e)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$4
	ld a, [hl]
	cp $8
	jp nc, Func_59dcc
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, Func_59dc3
	ld hl, $0
	push hl
	ld hl, $7d0
	push hl
	ld hl, sp+$4
	call SubtractLongs
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call CompareStackLongs_Signed
	jp c, Func_59dbe
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld de, wSaveScratchMoney
	ld hl, sp+$2
	ld bc, $4
	call MemCopy
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_333ba
	ld hl, sp+$4
	ld a, [hl]
	inc a
	call FarCall
	xor a
	jp Func_59dc0

Func_59dbe: ; 59dbe (16:5dbe)
	ld a, $1
Func_59dc0: ; 59dc0 (16:5dc0)
	jp Func_59dc9

Func_59dc3: ; 59dc3 (16:5dc3)
	ld hl, $0
	jp Func_59e3e

Func_59dc9: ; 59dc9 (16:5dc9)
	jp Func_59dce

Func_59dcc: ; 59dcc (16:5dcc)
	ld a, $2
Func_59dce: ; 59dce (16:5dce)
	push af
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
	pop af
	or a
	jp nz, Func_59e1d
	ld c, BANK(Pointers_59c7a)
	ld de, Pointers_59c7a
	ld hl, $10e
	call FarCall
	ld hl, -1
	jp Func_59e3e

Func_59e1d: ; 59e1d (16:5e1d)
	cp $1
	jp nz, Func_59e30
	ld c, BANK(Pointers_59c68)
	ld de, Pointers_59c68
	ld hl, $10e
	call FarCall
	jp Func_59e3b

Func_59e30: ; 59e30 (16:5e30)
	ld c, BANK(Pointers_59c4f)
	ld de, Pointers_59c4f
	ld hl, $10e
	call FarCall
Func_59e3b: ; 59e3b (16:5e3b)
	ld hl, $0
Func_59e3e: ; 59e3e (16:5e3e)
	pop bc
	pop bc
	pop bc
	ret

Data_59e42:
	dstr "(しょしﾞきん)"

Data_59e4b:
	dstr "(とうし)レヘﾞル"

Data_59e55:
	dstr " %d"

Data_59e59:
	dstr "2000G (ひつようてﾞす)"

Data_59e69:
	dstr "(とうしを おこないますか)?"

Func_59e79:
	push hl
	add sp, -$5c
	ld hl, sp+$5c
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
	write_hl_to_sp_plus $54
	read_hl_from_sp_plus $54
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $54
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$5c
	ld [hl], a
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	write_hl_to_sp_plus $5c
	read_hl_from_sp_plus $5c
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	ld hl, sp+$59
	ld [hl], $0
Func_59ee3: ; 59ee3 (16:5ee3)
	ld hl, sp+$59
	ld a, [hl]
	cp $3
	jp nc, Func_59f7b
	ld hl, sp+$59
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
	jp nz, Func_59f71
	ld hl, sp+$58
	ld [hl], $0
Func_59f09: ; 59f09 (16:5f09)
	ld hl, sp+$58
	ld a, [hl]
	cp $4
	jp nc, Func_59f71
	ld hl, sp+$58
	ld c, [hl]
	ld b, $0
	ld hl, sp+$59
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
	ld hl, sp+$5c
	cp [hl]
	jp nz, Func_59f67
	set_farcall_addrs_hli Func_6bbf3
	ld e, $0
	ld a, $8
	call FarCall
	read_hl_from_sp_plus $5c
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call PopBGMapRegion
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $5c
	call FarCall
	ld hl, $4000
	jp Func_5a0b8

Func_59f67: ; 59f67 (16:5f67)
	ld hl, sp+$58
	ld a, [hl]
	inc a
	ld hl, sp+$58
	ld [hl], a
	jp Func_59f09

Func_59f71: ; 59f71 (16:5f71)
	ld hl, sp+$59
	ld a, [hl]
	inc a
	ld hl, sp+$59
	ld [hl], a
	jp Func_59ee3

Func_59f7b: ; 59f7b (16:5f7b)
	set_farcall_addrs_hli GetRobotFromWarehouse
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, sp+$5c
	ld a, [hl]
	call FarCall
	ld hl, sp+$7
	ld a, [hl]
	ld hl, sp+$5d
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$23
	call GetRobotBaseStats
	read_hl_from_sp_plus $25
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_59fb0
	dec bc
.asm_59fb0
	push bc
	push hl
	ld hl, sp+$58
	call PutLongFromStackToHL
	ld hl, sp+$54
	call PutLongFromHLOnStack
	ld hl, sp+$61
	ld l, [hl]
	ld h, $0
	ld bc, $0
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	call StackDivideLongSigned
	ld hl, sp+$58
	call PutLongFromStackToHL
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
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, sp+$54
	call PutLongFromHLOnStack
	ld hl, Data_5a0c3
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld de, Data_5a0d0
	ld hl, $110
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
	jp nz, Func_5a074
	push hl
	push hl
	ld hl, sp+$58
	call PutLongFromHLOnStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $4
	ld hl, sp+$5c
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $54
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	ld a, $4
	call Func_5a963
	jp Func_5a079

Func_5a074: ; 5a074 (16:6074)
	ld a, $3
	call Func_5a963
Func_5a079: ; 5a079 (16:6079)
	read_hl_from_sp_plus $5c
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call PopBGMapRegion
	read_hl_from_sp_plus $54
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $54
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $5c
	call FarCall
	ld hl, $8000
Func_5a0b8: ; 5a0b8 (16:60b8)
	reg16swap de, hl
	add sp, $5e
	reg16swap de, hl
	ret

Data_5a0c3:
	dstr "%dコﾞールトﾞ(てﾞ)"

Data_5a0d0:
	dstr "(かいとるけとﾞ いいかい)?"

Func_5a0e0:: ; 5a0e0 (16:60e0)
	push af
	push de
	inc c
	dec c
	jp nz, Func_5a13d
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call AdjustItemQuantity
	cp $ff
	jp nz, Func_5a13a
	ld c, $2
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call AdjustItemQuantity
	cp $ff
	jp nz, Func_5a10a
	ld a, $ff
	jp Func_5a146

Func_5a10a: ; 5a10a (16:610a)
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
	callba_hli Func_fb205
	ld a, $1
	jp Func_5a146

Func_5a13a: ; 5a13a (16:613a)
	jp Func_5a146

Func_5a13d: ; 5a13d (16:613d)
	ld hl, sp+$0
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call AdjustItemQuantity
Func_5a146: ; 5a146 (16:6146)
	pop bc
	pop bc
	ret

INCLUDE "engine/items.asm"

Func_5a3e1::
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58d20)
	ld de, Data_58d20
	ld hl, Data_58d01
	call FarCall
	ret

Data_5a3f8:
	db $34, $40, $62, $7a, $47, $92, $90, $6b
IF DEF(SUN)
	db $17, $33, $2a, $30, $2d, $2e, $2f, $04
	db $48, $3f, $62, $42, $40, $63, $41, $00
	db $08, $0b, $65, $68, $09, $0c, $0e, $00
	db $4b, $4c, $4d, $32, $91, $00, $00, $00
	db $02, $12, $25, $8f, $00, $00, $00, $00
	db $22, $1b, $18, $2a, $61, $05, $7d, $8d
ELIF DEF(STAR)
	db $17, $33, $2a, $30, $5a, $5c, $6c, $45
	db $48, $3f, $62, $42, $40, $63, $41, $00
	db $09, $0c, $65, $68, $08, $0b, $0e, $00
	db $4b, $4c, $4d, $32, $91, $00, $00, $00
	db $57, $12, $25, $8f, $00, $00, $00, $00
	db $24, $1b, $18, $2a, $61, $46, $14, $8d
ENDC
	db $56, $4e, $23, $03, $79, $60, $27, $36
	db $03, $00, $05, $00, $0a, $00, $0f, $00
	db $14, $00, $1e, $00, $07, $00, $07, $00

Data_5a448:
	db $8, $7, $6, $5, $4, $3, $2, $1
	db $8, $7, $6, $5, $4, $3, $2, $1
	db $7, $6, $5, $4, $3, $2, $1, $0
	db $7, $6, $5, $4, $3, $2, $1, $0
	db $5, $4, $3, $2, $1, $0, $0, $0
	db $4, $3, $2, $1, $0, $0, $0, $0
	db $8, $7, $6, $5, $4, $3, $2, $1
	db $8, $7, $6, $5, $4, $3, $2, $1
	db $1, $2, $3, $4, $5, $6, $7, $8
	db $1, $2, $3, $4, $5, $6, $7, $8
	db $0, $1, $2, $3, $4, $5, $6, $7
	db $0, $1, $2, $3, $4, $5, $6, $7
	db $0, $0, $0, $1, $2, $3, $4, $5
	db $0, $0, $0, $0, $1, $2, $3, $4
	db $1, $2, $3, $4, $5, $6, $7, $8
	db $1, $2, $3, $4, $5, $6, $7, $8

Func_5a4c8: ; 5a4c8 (16:64c8)
	push hl
	add sp, -$24
	ld hl, sp+$24
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push bc
	call WriteHLToSPPlus8
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	ld de, wcb33
	add hl, de
	ld c, [hl]
	pop af
	push bc
	call GetSRAMBank
	ld e, $7
	ld a, [wc79a]
	cp $1
	jp nz, Func_5a528
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a448
	add hl, de
	ld e, [hl]
	ld hl, sp+$29
	ld [hl], e
	ld e, $8
	jp Func_5a57e

Func_5a528: ; 5a528 (16:6528)
	ld a, [wc790]
	or a
	jp z, Func_5a537
	ld a, [wc790]
	cp $8
	jp nz, Func_5a53e
Func_5a537: ; 5a537 (16:6537)
	ld hl, sp+$29
	ld [hl], $0
	jp Func_5a57e

Func_5a53e: ; 5a53e (16:653e)
	ld a, [wc790]
	cp $1
	jp c, Func_5a56b
	ld a, [wc790]
	cp $8
	jp nc, Func_5a56b
	push de
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a448
	add hl, de
	ld a, [wc790]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$2b
	ld [hl], a
	pop de
	jp Func_5a57e

Func_5a56b: ; 5a56b (16:656b)
	push de
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a448
	add hl, de
	ld e, [hl]
	ld hl, sp+$2b
	ld [hl], e
	pop de
Func_5a57e: ; 5a57e (16:657e)
	pop bc
	push de
	inc c
	dec c
	jp nz, Func_5a589
	xor a
	jp Func_5a59c

Func_5a589: ; 5a589 (16:6589)
	dec c
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $6488
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
Func_5a59c: ; 5a59c (16:659c)
	ld hl, sp+$29
	cp [hl]
	jp nc, Func_5a5a5
	ld hl, sp+$29
	ld [hl], a
Func_5a5a5: ; 5a5a5 (16:65a5)
	ld hl, sp+$29
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus10
	ld de, $9
	add hl, de
	ld de, $8
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld a, [wCurShop]
	cp $7
	jp z, Func_5a5dd
	cp $6
	jp z, Func_5a5dd
	or a
	jp nz, Func_5a5eb
	ld a, [wc78c]
	ld d, a
	add a
	add d
	ld e, a
	jp Func_5a5f7

Func_5a5dd: ; 5a5dd (16:65dd)
	ld b, e
	ld a, $8
	ld hl, wc790
	sub [hl]
	call MultiplyAbyB
	ld e, a
	jp Func_5a5f7

Func_5a5eb: ; 5a5eb (16:65eb)
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $6438
	add hl, de
	ld e, [hl]
Func_5a5f7: ; 5a5f7 (16:65f7)
	push de
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
	ld c, $4
	ld e, $a
	ld hl, $9
	call FarCall
	ld c, $4
	ld e, $a
	ld hl, $a09
	call FarCall
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $0
	call FarCall
	ld bc, $81
	ld de, $14
	ld hl, $8
	call FarCall
	ld de, Data_5a860
	ld hl, $10a
	call PlaceStringDEatCoordHL
	ld de, Data_5a867
	ld hl, $b0a
	call PlaceStringDEatCoordHL
	ld hl, sp+$4
	call PutLongFromHLOnStack
	ld hl, $b0b
	call Func_594a4
	pop bc
	pop bc
	ld c, $0
	pop de
Func_5a672: ; 5a672 (16:6672)
	ld a, c
	ld hl, sp+$27
	cp [hl]
	jp nc, Func_5a72a
	push de
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop bc
	push af
	push bc
	set_farcall_addrs_hli GetName
	pop bc
	push bc
	ld hl, sp+$e
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a3f8
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $5ff
	add hl, de
	pop de
	ld c, $6
	call FarCall
	pop bc
	pop af
	push bc
	call GetSRAMBank
	pop bc
	push bc
	ld a, c
	ld b, $4
	call DivideAbyB
	add a
	ld d, a
	add a
	add a
	add d
	add $2
	ld l, a
	pop bc
	pop de
	push bc
	push de
	ld a, c
	and $b
	add a
	inc a
	ld e, a
	ld a, l
	call SetStringStartState
	pop de
	ld a, e
	cp $a
	jp nc, Func_5a6fc
	push de
	ld l, e
	ld h, $0
	push hl
	ld hl, Data_5a86d
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	jp Func_5a70b

Func_5a6fc: ; 5a6fc (16:66fc)
	push de
	ld l, e
	ld h, $0
	push hl
	ld hl, Data_5a872
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
Func_5a70b: ; 5a70b (16:670b)
	push de
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$c
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	pop de
	pop bc
	inc c
	jp Func_5a672

Func_5a72a: ; 5a72a (16:672a)
	pop bc
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_5a81d
	ld c, $0
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$28
	ld [hl], $0
Func_5a759: ; 5a759 (16:6759)
	ld hl, sp+$28
	ld a, [hl]
	cp $4
	jp nc, Func_5a787
	ld hl, sp+$28
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_5a77d
	jp Func_5a787

Func_5a77d: ; 5a77d (16:677d)
	ld hl, sp+$28
	ld a, [hl]
	inc a
	ld hl, sp+$28
	ld [hl], a
	jp Func_5a759

Func_5a787: ; 5a787 (16:6787)
	pop af
	call GetSRAMBank
	pop bc
	ld hl, sp+$24
	ld a, [hl]
	cp $4
	jp nz, Func_5a796
	ld c, $ff
Func_5a796: ; 5a796 (16:6796)
	ld a, c
	cp $ff
	jp nz, Func_5a7b6
	callba_hli Func_7d01
	cp $ff
	jp nz, Func_5a7b4
	ld c, $ff
	jp Func_5a7b6

Func_5a7b4: ; 5a7b4 (16:67b4)
	ld c, $0
Func_5a7b6: ; 5a7b6 (16:67b6)
	push bc
	ld a, c
	cp $ff
	jp z, Func_5a806
	ld de, Data_5a876
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_5a887
	ld hl, $110
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_50604
	call GetHLAtSPPlus8
	call FarCall
	call GetHLAtSPPlus8
	ld de, $b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call Func_5aa2f
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	jp Func_5a819

Func_5a806: ; 5a806 (16:6806)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	xor a
	call Func_5a963
	call Func_3af6
Func_5a819: ; 5a819 (16:6819)
	pop bc
	jp Func_5a833

Func_5a81d: ; 5a81d (16:681d)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld a, $1
	call Func_5a963
	call Func_3af6
	pop bc
Func_5a833: ; 5a833 (16:6833)
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_5a852
	ld a, c
	cp $ff
	jp z, Func_5a852
	ld hl, $4000
	jp Func_5a855

Func_5a852: ; 5a852 (16:6852)
	ld hl, -1
Func_5a855: ; 5a855 (16:6855)
	reg16swap de, hl
	add sp, $26
	reg16swap de, hl
	ret

Data_5a860:
	dstr "(ねたﾞん)"

Data_5a867:
	dstr "(しきん)"

Data_5a86d:
	dstr "L %d"

Data_5a872:
	dstr "L%d"

Data_5a876:
	dstr "(わかﾞ) (けんきゅうしﾞょ)"

Data_5a887:
	dstr "(しﾞまんの) ロホﾞホﾟン(たﾞよ)"

Pointers_5a89b:
	dw Data_5a89f
	dw $0

Data_5a89f:
	dstr "(これいしﾞょう) ロホﾞホﾟン(は かえないよ)"

Pointers_5a8b9:
	dw Data_5a8bd
	dw $0

Data_5a8bd:
	dstr "(こﾞめん またﾞてﾞきてないんたﾞ)"

Pointers_5a8d1:
	dw Data_5a8d5
	dw $0

Data_5a8d5:
	dstr "(おかねかﾞ たりないよ)"

Pointers_5a8e3:
	dw Data_5a8e9
	dw Data_5a8f0
	dw $0

Data_5a8e9:
	dstr "(そうかい)"

Data_5a8f0:
	dstr "(それは さﾞんねんたﾞね)"

Pointers_5a8ff:
	dw Data_5a905
	dw Data_5a91c
	dw $0

Data_5a905:
	dstr "(ありかﾞとう けんきゅうに やくたﾞつよ)"

Data_5a91c:
	dstr "(ほかにも うってくれるかい?)"

Pointers_5a92d:
	dw Data_5a931
	dw $0

Data_5a931:
	dstr "(ありかﾞとう つくったかいかﾞ あったね)"

Pointers_5a948:
	dw Data_5a94e
	dw Data_5a955
	dw $0

Data_5a94e:
	dstr "(そうかい)"

Data_5a955:
	dstr "(ほかにも ようはある?)"

Func_5a963: ; 5a963 (16:6963)
	push af
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	pop af
	cp $6
	jp z, Func_5aa07
	cp $5
	jp z, Func_5a9f9
	cp $4
	jp z, Func_5a9eb
	cp $3
	jp z, Func_5a9dd
	cp $2
	jp z, Func_5a9cf
	cp $1
	jp z, Func_5a9c1
	or a
	jp nz, Func_5aa12
	ld c, $16
	ld de, Pointers_5a89b
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5a9c1: ; 5a9c1 (16:69c1)
	ld c, $16
	ld de, Pointers_5a8b9
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5a9cf: ; 5a9cf (16:69cf)
	ld c, $16
	ld de, Pointers_5a8d1
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5a9dd: ; 5a9dd (16:69dd)
	ld c, $16
	ld de, Pointers_5a8e3
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5a9eb: ; 5a9eb (16:69eb)
	ld c, $16
	ld de, Pointers_5a8ff
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5a9f9: ; 5a9f9 (16:69f9)
	ld c, $16
	ld de, Pointers_5a92d
	ld hl, $10e
	call FarCall
	jp Func_5aa12

Func_5aa07: ; 5aa07 (16:6a07)
	ld c, $16
	ld de, Pointers_5a948
	ld hl, $10e
	call FarCall
Func_5aa12: ; 5aa12 (16:6a12)
	ret

Func_5aa13: ; 5aa13 (16:6a13)
	ld de, $2
	jp Func_59724

Func_5aa19: ; 5aa19 (16:6a19)
	ld de, $3
	jp Func_59724

Data_5aa1f:
	db $03, $00, $05, $00, $0a, $00, $0f, $00, $14, $00, $1e, $00, $07, $00, $07, $00

Func_5aa2f: ; 5aa2f (16:6a2f)
	add sp, -$34
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	ld de, wcb33
	add hl, de
	ld a, [hl]
	ld a, c
	call GetSRAMBank
	pop af
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a3f8
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotBaseStats
	ld a, [wc79a]
	cp $1
	jp nz, Func_5aa7c
	ld l, $8
	jp Func_5aa7e

Func_5aa7c: ; 5aa7c (16:6a7c)
	ld l, $7
Func_5aa7e: ; 5aa7e (16:6a7e)
	ld a, [wCurShop]
	cp $7
	jp z, Func_5aa98
	cp $6
	jp z, Func_5aa98
	or a
	jp nz, Func_5aaa5
	ld a, [wc78c]
	ld d, a
	add a
	add d
	jp Func_5aab1

Func_5aa98: ; 5aa98 (16:6a98)
	ld b, l
	ld a, $8
	ld hl, wc790
	sub [hl]
	call MultiplyAbyB
	jp Func_5aab1

Func_5aaa5: ; 5aaa5 (16:6aa5)
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_5aa1f
	add hl, de
	ld a, [hl]
Func_5aab1: ; 5aab1 (16:6ab1)
	ld l, a
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_5aabe
	dec bc
.asm_5aabe
	push bc
	push hl
	call GetHLAtSPPlus6
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_5aacd
	dec bc
.asm_5aacd
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$33
	call PutLongFromStackToHL
	ld hl, sp+$2f
	call PutLongFromHLOnStack
	ld hl, $10b
	call Func_594a4
	pop bc
	pop bc
	add sp, $34
	ret

Data_5aae7:
	db $03, $00, $05, $00, $0a, $00, $0f, $00, $14, $00, $1e, $00, $07, $00, $07, $00

Func_5aaf7: ; 5aaf7 (16:6af7)
	push hl
	add sp, -$38
	ld hl, sp+$38
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$38
	ld [hl], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	ld de, wcb33
	add hl, de
	ld a, [hl]
	ld hl, sp+$31
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	pop af
	call GetSRAMBank
	ld hl, sp+$38
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a3f8
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotBaseStats
	ld a, [wc79a]
	cp $1
	jp nz, Func_5ab61
	ld l, $8
	jp Func_5ab63

Func_5ab61: ; 5ab61 (16:6b61)
	ld l, $7
Func_5ab63: ; 5ab63 (16:6b63)
	ld a, [wCurShop]
	cp $7
	jp z, Func_5ab80
	cp $6
	jp z, Func_5ab80
	or a
	jp nz, Func_5ab90
	ld hl, sp+$37
	ld a, [wc78c]
	ld d, a
	add a
	add d
	ld [hl], a
	jp Func_5ab9f

Func_5ab80: ; 5ab80 (16:6b80)
	ld b, l
	ld a, $8
	ld hl, wc790
	sub [hl]
	call MultiplyAbyB
	ld hl, sp+$37
	ld [hl], a
	jp Func_5ab9f

Func_5ab90: ; 5ab90 (16:6b90)
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_5aae7
	add hl, de
	ld e, [hl]
	ld hl, sp+$37
	ld [hl], e
Func_5ab9f: ; 5ab9f (16:6b9f)
	ld hl, sp+$37
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_5abae
	dec bc
.asm_5abae
	push bc
	push hl
	call GetHLAtSPPlus6
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_5abbd
	dec bc
.asm_5abbd
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$37
	call PutLongFromStackToHL
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
	ld de, Data_5ac60
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
	jp nz, Func_5ac4d
	ld hl, sp+$33
	call PutLongFromHLOnStack
	ld hl, sp+$33
	call PutLongFromHLOnStack
.asm_5ac18
	call CompareStackLongs_Signed
	jp nc, Func_5ac45
	ld hl, sp+$37
	ld e, [hl]
	ld hl, sp+$38
	ld a, [hl]
	call Func_5ac68
	push hl
	push hl
	ld hl, sp+$37
	call PutLongFromHLOnStack
	ld hl, rIE
	push hl
	ld hl, rIE
	push hl
	call MultiplyLongsFromStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_5ac4a

Func_5ac45: ; 5ac45 (16:6c45)
	ld a, $2
	call Func_5a963
Func_5ac4a: ; 5ac4a (16:6c4a)
	jp Func_5ac52

Func_5ac4d: ; 5ac4d (16:6c4d)
	ld a, $3
	call Func_5a963
Func_5ac52: ; 5ac52 (16:6c52)
	ld hl, $8000
	reg16swap de, hl
	add sp, $3a
	reg16swap de, hl
	ret

Data_5ac60:
	dstr "(かうかい?)"

Func_5ac68: ; 5ac68 (16:6c68)
	add sp, -$24
	push de
	push af
	ld a, $5
	call Func_5a963
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_5adc1
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
	pop af
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_5a3f8
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	pop de
	ld a, c
	or b
	jp nz, Func_5ada8
	push hl
	push de
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$6
	ld [hl], $0
Func_5acde: ; 5acde (16:6cde)
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_5ad0c
	ld hl, sp+$6
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_5ad02
	jp Func_5ad0c

Func_5ad02: ; 5ad02 (16:6d02)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_5acde

Func_5ad0c: ; 5ad0c (16:6d0c)
	pop af
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	cp $4
	jp nz, Func_5ad4a
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$5
	reg16swap de, hl
	ld a, $3
	call FarCall
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $1
	ld a, $3
	call FarCall
	ld a, $3
	ld [wc2e9], a
	jp Func_5ad50

Func_5ad4a: ; 5ad4a (16:6d4a)
	ld hl, sp+$4
	ld a, [hl]
	ld [wc2e9], a
Func_5ad50: ; 5ad50 (16:6d50)
	set_farcall_addrs_hli TryGiveRobot
	pop de
	pop hl
	ld c, e
	ld a, l
	ld e, $0
	call FarCall
	set_farcall_addrs_hli Func_320d8
	xor a
	call FarCall
	ld hl, sp+$0
	ld a, [hl]
	cp $4
	jp nz, Func_5ada5
	set_farcall_addrs_hli TryGiveRobot
	ld c, $1
	ld e, $2
	ld a, $3
	call FarCall
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$1
	reg16swap de, hl
	ld a, $3
	call FarCall
Func_5ada5: ; 5ada5 (16:6da5)
	jp Func_5adbe

Func_5ada8: ; 5ada8 (16:6da8)
	push hl
	push de
	set_farcall_addrs_hli GiveRobot
	pop de
	pop hl
	ld c, e
	ld a, l
	ld e, $0
	call FarCall
Func_5adbe: ; 5adbe (16:6dbe)
	add sp, $24
	ret

Data_5adc1:
	dstr "(ひかりを あてるかい)"

Func_5adce: ; 5adce (16:6dce)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld a, $6
	call Func_5a963
	call Func_3af6
	ld hl, -1
	ret

Func_5ade6:
	push hl
	ld hl, -$10c
	add hl, sp
	ld sp, hl
	ld hl, $10c
	add hl, sp
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $10d
	read_hl_from_sp_plus $10d
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $10d
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [bc]
	ld hl, $10a
	add hl, sp
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	ld hl, $109
	add hl, sp
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld a, [hl]
	ld hl, $108
	add hl, sp
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	read_hl_from_sp_plus $10f
	ld de, $f
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli malloc
	ld hl, $8c
	call FarCall
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10f
	ld de, $f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $90
	add hl, sp
	ld [hl], $0
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, $10b
	add hl, sp
	ld [hl], $0
Func_5ae7e: ; 5ae7e (16:6e7e)
	ld hl, $10b
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_5aef0
	ld hl, $10b
	add hl, sp
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_5aee2
	set_farcall_addrs_hli GetName
	ld hl, $92
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $93
	add hl, sp
	add hl, de
	reg16swap de, hl
	ld hl, $10b
	add hl, sp
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	inc h
	ld c, $6
	call FarCall
	ld hl, $92
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $92
	add hl, sp
	ld [hl], a
Func_5aee2: ; 5aee2 (16:6ee2)
	ld hl, $10b
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $10b
	add hl, sp
	ld [hl], a
	jp Func_5ae7e

Func_5aef0: ; 5aef0 (16:6ef0)
	pop af
	call GetSRAMBank
	ld a, [wc319]
	cp $81
	jp nz, Func_5af6c
	set_farcall_addrs_hli Func_7748
	ld c, $1
	read_hl_from_sp_plus $10f
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8c
	call FarCall
	xor a
Func_5af1c: ; 5af1c (16:6f1c)
	cp $4
	jp nc, Func_5af50
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	push af
	ld l, a
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	reg16swap de, hl
	call FarCall
	pop af
	inc a
	jp Func_5af1c

Func_5af50: ; 5af50 (16:6f50)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $8c
	call FarCall
	jp Func_5afd9

Func_5af6c: ; 5af6c (16:6f6c)
	xor a
Func_5af6d: ; 5af6d (16:6f6d)
	cp $4
	jp nc, Func_5afa1
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	push af
	ld l, a
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	reg16swap de, hl
	call FarCall
	pop af
	inc a
	jp Func_5af6d

Func_5afa1: ; 5afa1 (16:6fa1)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $8c
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	read_hl_from_sp_plus $10f
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8c
	call FarCall
Func_5afd9: ; 5afd9 (16:6fd9)
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
	pop af
	push af
	ld c, a
	ld hl, $10a
	add hl, sp
	ld e, [hl]
	ld hl, $10c
	add hl, sp
	ld a, [hl]
	ld hl, $10b
	add hl, sp
	ld l, [hl]
	ld h, a
	call FarCall
	ld c, $3
	ld e, $5
	ld hl, Init
	call FarCall
	ld c, $5
	ld e, $b
	ld hl, $10c
	call FarCall
	pop af
	ld hl, $108
	add hl, sp
	ld l, [hl]
	push hl
	ld hl, $10b
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, $10c
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $a00
	add hl, de
	add hl, bc
	pop de
	ld c, a
	call FarCall
	ld c, $3
	ld e, $5
	ld hl, $b00
	call FarCall
	ld de, Data_5b1c6
	ld hl, $201
	call PlaceStringDEatCoordHL
	ld de, Data_5b1ce
	ld hl, $c01
	call PlaceStringDEatCoordHL
	ld de, Data_5b1d4
	ld hl, $30d
	call PlaceStringDEatCoordHL
	ld de, Data_5b1e0
	ld hl, $30f
	call PlaceStringDEatCoordHL
	ld hl, $107
	add hl, sp
	ld [hl], $0
Func_5b075: ; 5b075 (16:7075)
	ld hl, $107
	add hl, sp
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	cp [hl]
	jp nc, Func_5b0c9
	set_farcall_addrs_hli Func_16019
	ld hl, $107
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $8f
	add hl, sp
	add hl, de
	ld c, l
	ld b, h
	ld hl, $107
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $3
	call FarCall
	ld hl, $107
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $107
	add hl, sp
	ld [hl], a
	jp Func_5b075

Func_5b0c9: ; 5b0c9 (16:70c9)
	ld hl, $8e
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $10d
	ld de, $7
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $10d
	ld de, $9
	add hl, de
	ld de, $4
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wc390], a
	ld hl, $107
	add hl, sp
	ld [hl], $0
Func_5b0f5: ; 5b0f5 (16:70f5)
	ld hl, $107
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_5b196
	read_hl_from_sp_plus $10d
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, $109
	add hl, sp
	ld l, [hl]
	ld h, $0
	mulhlby35
	pop de
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5b188
	ld a, [wc390]
	inc a
	ld [wc390], a
	inc hl
	pop de
	push hl
	pop hl
	push hl
	push hl
	ld hl, $109
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $91
	add hl, sp
	add hl, de
	pop de
	ld bc, $6
	call FarCopyVideoData
	set_farcall_addrs_hli Func_16019
	ld hl, $107
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $1e
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $8f
	add hl, sp
	add hl, de
	ld c, l
	ld b, h
	ld hl, $107
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $d
	call FarCall
Func_5b188: ; 5b188 (16:7188)
	ld hl, $107
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $107
	add hl, sp
	ld [hl], a
	jp Func_5b0f5

Func_5b196: ; 5b196 (16:7196)
	set_farcall_addrs_hli Func_50604
	read_hl_from_sp_plus $10d
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
	ld hl, $10e
	add hl, sp
	ld sp, hl
	reg16swap de, hl
	ret

Data_5b1c6:
	dstr "(しﾞふﾞん)"

Data_5b1ce:
	dstr "(あいて)"

Data_5b1d4:
	dstr "(こうかんしﾞっこう)"

Data_5b1e0:
	dstr "(こうかんちゅうし)"

Func_5b1eb: ; 5b1eb (16:71eb)
	push bc
	push bc
	push de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_5b233
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
Func_5b233: ; 5b233 (16:7233)
	pop bc
	call GetHLAtSPPlus6
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop de
	ld a, e
	sub $3
	or d
	jp z, Func_5b32f
	ld a, e
	sub $2
	or d
	jp z, Func_5b31a
	ld a, e
	dec a
	or d
	jp z, Func_5b2b0
	ld a, e
	or d
	jp nz, Func_5b35f
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_5b272
	ld l, c
	ld h, b
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_5b272
	dec bc
	jp Func_5b2ad

Func_5b272: ; 5b272 (16:7272)
	ld e, c
	ld d, b
	ld hl, $4
	call CompareHLtoDE
	jp nc, Func_5b28c
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_5b28c
	dec bc
	jp Func_5b2ad

Func_5b28c: ; 5b28c (16:728c)
	ld a, c
	sub $8
	or b
	jp nz, Func_5b2a3
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld c, e
	ld b, d
	jp Func_5b2ad

Func_5b2a3: ; 5b2a3 (16:72a3)
	ld a, c
	sub $9
	or b
	jp nz, Func_5b2ad
	ld bc, $8
Func_5b2ad: ; 5b2ad (16:72ad)
	jp Func_5b35f

Func_5b2b0: ; 5b2b0 (16:72b0)
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_5b2c7
	inc bc
	jp Func_5b317

Func_5b2c7: ; 5b2c7 (16:72c7)
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nz, Func_5b2e0
	ld bc, $8
	jp Func_5b317

Func_5b2e0: ; 5b2e0 (16:72e0)
	ld a, c
	sub $8
	or b
	jp nz, Func_5b2ed
	ld bc, $9
	jp Func_5b317

Func_5b2ed: ; 5b2ed (16:72ed)
	ld l, c
	ld h, b
	ld de, $4
	call CompareHLtoDE
	jp c, Func_5b317
	ld e, c
	ld d, b
	ld hl, $7
	call CompareHLtoDE
	jp c, Func_5b317
	ld l, c
	ld h, b
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, [wc390]
	ld e, a
	ld d, $0
	dec de
	call CompareHLtoDE
	jp nc, Func_5b317
	inc bc
Func_5b317: ; 5b317 (16:7317)
	jp Func_5b35f

Func_5b31a: ; 5b31a (16:731a)
	ld l, c
	ld h, b
	ld a, [wc390]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp nc, Func_5b32c
	inc bc
	inc bc
	inc bc
	inc bc
Func_5b32c: ; 5b32c (16:732c)
	jp Func_5b35f

Func_5b32f: ; 5b32f (16:732f)
	ld e, c
	ld d, b
	ld hl, $3
	call CompareHLtoDE
	jp nc, Func_5b35f
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_5b35f
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	dec hl
	dec hl
	dec hl
	dec hl
	call CompareHLtoDE
	jp nc, Func_5b35f
	dec bc
	dec bc
	dec bc
	dec bc
Func_5b35f: ; 5b35f (16:735f)
	push bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli Func_50604
	call GetHLAtSPPlus6
	call FarCall
	pop bc
	ld a, [wOptionsMenu_BattleScene]
	cp $ff
	jp z, Func_5b3b9
	ld l, c
	ld h, b
	ld a, [wOptionsMenu_BattleScene]
	ld e, a
	ld d, $0
	call CompareHLtoDE
	jp z, Func_5b3b9
	ld a, [wOptionsMenu_BattleScene]
	add a
	add $4
	ld e, a
	ld a, $2
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_5b3cb
	push hl
	call PlaceString
	pop bc
	pop bc
Func_5b3b9: ; 5b3b9 (16:73b9)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	ret

Data_5b3cb:
	dstr "%c"

Func_5b3ce:
	ld de, $2
	jp Func_5b1eb

Func_5b3d4:
	ld de, $3
	jp Func_5b1eb

Func_5b3da:
	push hl
	add sp, -$4e
	read_hl_from_sp_plus $50
	write_hl_to_sp_plus $4e
	read_hl_from_sp_plus $4e
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
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	ld a, l
	cp $4
	jp nc, Func_5b414
	ld a, l
	call Func_5b8d8
	jp Func_5b83a

Func_5b414: ; 5b414 (16:7414)
	ld a, l
	cp $8
	jp nc, Func_5b427
	read_hl_from_sp_plus $50
	call Func_5ba6d
	ld hl, $4000
	jp Func_5b83d

Func_5b427: ; 5b427 (16:7427)
	ld a, l
	cp $8
	jp nz, Func_5b7ff
	ld a, [wOptionsMenu_BattleScene]
	cp $ff
	jp z, Func_5b7f7
	ld a, l
	call Func_5b855
	cp $ff
	jp nz, Func_5b46f
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	jp Func_5b83d

Func_5b46f: ; 5b46f (16:746f)
	ld a, [wc319]
	cp $81
	jp nz, Func_5b4c3
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$23
	reg16swap de, hl
	ld hl, $23
	call FarCall
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $23
	call FarCall
	jp Func_5b50c

Func_5b4c3: ; 5b4c3 (16:74c3)
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $23
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$23
	reg16swap de, hl
	ld hl, $23
	call FarCall
Func_5b50c: ; 5b50c (16:750c)
	ld hl, sp+$4b
	ld [hl], $0
	ld hl, sp+$23
	ld a, [hl]
	cp $ab
	jp c, Func_5b553
	ld hl, sp+$23
	ld a, [hl]
	cp $af
	jp nc, Func_5b553
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_5b530
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp c, Func_5b54c
Func_5b530: ; 5b530 (16:7530)
	set_farcall_addrs_hli Func_52d58
	ld hl, sp+$46
	call FarCall
	cp $4
	jp nc, Func_5b549
	ld hl, sp+$4b
	ld [hl], $1
Func_5b549: ; 5b549 (16:7549)
	jp Func_5b550

Func_5b54c: ; 5b54c (16:754c)
	ld hl, sp+$4b
	ld [hl], $1
Func_5b550: ; 5b550 (16:7550)
	jp Func_5b557

Func_5b553: ; 5b553 (16:7553)
	ld hl, sp+$4b
	ld [hl], $1
Func_5b557: ; 5b557 (16:7557)
	ld a, [wc319]
	cp $81
	jp nz, Func_5b594
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$4a
	reg16swap de, hl
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$4b
	reg16swap de, hl
	ld hl, $1
	call FarCall
	jp Func_5b5c6

Func_5b594: ; 5b594 (16:7594)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$4b
	reg16swap de, hl
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$4a
	reg16swap de, hl
	ld hl, $1
	call FarCall
Func_5b5c6: ; 5b5c6 (16:75c6)
	ld hl, sp+$4b
	ld a, [hl]
	cp $1
	jp nz, Func_5b7b9
	ld hl, sp+$4a
	ld a, [hl]
	cp $1
	jp nz, Func_5b7b9
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	ld a, [wc319]
	cp $81
	jp nz, Func_5b6a8
	ld hl, sp+$23
	ld a, [hl]
	cp $ab
	jp c, Func_5b634
	ld hl, sp+$23
	ld a, [hl]
	cp $af
	jp nc, Func_5b634
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_5b634
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_5b634
	set_farcall_addrs_hli Func_6eff0
	ld e, $0
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	ld hl, sp+$23
	ld [hl], a
	jp Func_5b6a5

Func_5b634: ; 5b634 (16:7634)
	ld hl, sp+$23
	ld a, [hl]
	cp $ab
	jp c, Func_5b684
	ld hl, sp+$23
	ld a, [hl]
	cp $af
	jp nc, Func_5b684
	set_farcall_addrs_hli Func_52d58
	ld hl, sp+$46
	call FarCall
	ld c, $0
Func_5b656: ; 5b656 (16:7656)
	ld a, c
	cp $4
	jp nc, Func_5b66e
	ld e, c
	ld d, $0
	ld hl, sp+$46
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5b66a
	jp Func_5b66e

Func_5b66a: ; 5b66a (16:766a)
	inc c
	jp Func_5b656

Func_5b66e: ; 5b66e (16:766e)
	push bc
	set_farcall_addrs_hli Func_6ef7f
	pop bc
	ld a, c
	add $ab
	call FarCall
	ld hl, sp+$23
	ld [hl], a
Func_5b684: ; 5b684 (16:7684)
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_5b6a5
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_5b6a5
	set_farcall_addrs_hli Func_6ef0d
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
Func_5b6a5: ; 5b6a5 (16:76a5)
	jp Func_5b752

Func_5b6a8: ; 5b6a8 (16:76a8)
	ld hl, sp+$23
	ld a, [hl]
	cp $ab
	jp c, Func_5b6e1
	ld hl, sp+$23
	ld a, [hl]
	cp $af
	jp nc, Func_5b6e1
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_5b6e1
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_5b6e1
	set_farcall_addrs_hli Func_6eff0
	ld e, $1
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
	ld hl, sp+$23
	ld [hl], a
	jp Func_5b752

Func_5b6e1: ; 5b6e1 (16:76e1)
	ld hl, sp+$0
	ld a, [hl]
	cp $ab
	jp c, Func_5b702
	ld hl, sp+$0
	ld a, [hl]
	cp $af
	jp nc, Func_5b702
	set_farcall_addrs_hli Func_6ef0d
	ld hl, sp+$0
	ld a, [hl]
	call FarCall
Func_5b702: ; 5b702 (16:7702)
	ld hl, sp+$23
	ld a, [hl]
	cp $ab
	jp c, Func_5b752
	ld hl, sp+$23
	ld a, [hl]
	cp $af
	jp nc, Func_5b752
	set_farcall_addrs_hli Func_52d58
	ld hl, sp+$46
	call FarCall
	ld c, $0
Func_5b724: ; 5b724 (16:7724)
	ld a, c
	cp $4
	jp nc, Func_5b73c
	ld e, c
	ld d, $0
	ld hl, sp+$46
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5b738
	jp Func_5b73c

Func_5b738: ; 5b738 (16:7738)
	inc c
	jp Func_5b724

Func_5b73c: ; 5b73c (16:773c)
	push bc
	set_farcall_addrs_hli Func_6ef7f
	pop bc
	ld a, c
	add $ab
	call FarCall
	ld hl, sp+$23
	ld [hl], a
Func_5b752: ; 5b752 (16:7752)
	read_hl_from_sp_plus $33
	write_hl_to_sp_plus $31
	read_hl_from_sp_plus $37
	write_hl_to_sp_plus $35
	ld hl, sp+$39
	ld [hl], $0
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$23
	reg16swap de, hl
	ld a, [wOptionsMenu_BattleScene]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $0
	ld hl, sp+$23
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $1
	ld hl, sp+$23
	ld a, [hl]
	call FarCall
	callba_hli SaveGame
	ld a, $2
	call Func_5b95d
	jp Func_5b7e3

Func_5b7b9: ; 5b7b9 (16:77b9)
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld de, Data_5b848
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
Func_5b7e3: ; 5b7e3 (16:77e3)
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	jp Func_5b83d

Func_5b7f7: ; 5b7f7 (16:77f7)
	ld a, $1
	call Func_5b95d
	jp Func_5b83a

Func_5b7ff: ; 5b7ff (16:77ff)
	ld a, l
	cp $9
	jp nz, Func_5b83a
	ld a, l
	call Func_5b855
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	read_hl_from_sp_plus $4e
	ld de, $f
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	jp Func_5b83d

Func_5b83a: ; 5b83a (16:783a)
	ld hl, $4000
Func_5b83d: ; 5b83d (16:783d)
	reg16swap de, hl
	add sp, $50
	reg16swap de, hl
	ret

Data_5b848:
	dstr "(こうかんてﾞきないよ)"

Func_5b855: ; 5b855 (16:7855)
	push af
	push bc
	ld a, [wc319]
	cp $81
	jp nz, Func_5b894
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call FarCall
	jp Func_5b8c6

Func_5b894: ; 5b894 (16:7894)
	set_farcall_addrs_hli Func_7766
	ld c, $1
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_7748
	ld c, $1
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $1
	call FarCall
Func_5b8c6: ; 5b8c6 (16:78c6)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_5b8d3
	xor a
	jp Func_5b8d5

Func_5b8d3: ; 5b8d3 (16:78d3)
	ld a, $ff
Func_5b8d5: ; 5b8d5 (16:78d5)
	pop bc
	pop bc
	ret

Func_5b8d8: ; 5b8d8 (16:78d8)
	push af
	ld a, [wOptionsMenu_BattleScene]
	ld hl, sp+$1
	cp [hl]
	jp z, Func_5b913
	ld a, [wOptionsMenu_BattleScene]
	cp $ff
	jp z, Func_5b90a
	ld a, [wOptionsMenu_BattleScene]
	add a
	add $4
	ld e, a
	ld a, $2
	call SetStringStartState
	ld hl, Data_5b91a
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
Func_5b90a: ; 5b90a (16:790a)
	ld hl, sp+$1
	ld a, [hl]
	ld [wOptionsMenu_BattleScene], a
	jp Func_5b918

Func_5b913: ; 5b913 (16:7913)
	ld a, $ff
	ld [wOptionsMenu_BattleScene], a
Func_5b918: ; 5b918 (16:7918)
	pop bc
	ret

Data_5b91a:
	dstr " "

Pointers_5b91c:
	dw Data_5b920
	dw $0

Data_5b920:
	dstr "(その)ロホﾞホﾟン (は えらへﾞないよ)"

Pointers_5b937:
	dw Data_5b93b
	dw $0

Data_5b93b:
	dstr "ロホﾞホﾟン(を えらんてﾞないよ)"

Pointers_5b94e:
	dw Data_5b952
	dw $0

Data_5b952:
	dstr "(こうかんしたよ!)"

Func_5b95d: ; 5b95d (16:795d)
	push af
	set_farcall_addrs_hli malloc
	ld hl, $64
	call FarCall
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call BackUpTileMapRectangle
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	pop af
	push hl
	cp $2
	jp z, Func_5b9df
	cp $1
	jp z, Func_5b9c6
	or a
	jp nz, Func_5b9f5
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5b91c)
	ld de, Pointers_5b91c
	ld hl, $10e
	call FarCall
	jp Func_5b9f5

Func_5b9c6: ; 5b9c6 (16:79c6)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5b937)
	ld de, Pointers_5b937
	ld hl, $10e
	call FarCall
	jp Func_5b9f5

Func_5b9df: ; 5b9df (16:79df)
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5b94e)
	ld de, Pointers_5b94e
	ld hl, $10e
	call FarCall
Func_5b9f5: ; 5b9f5 (16:79f5)
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call RestoreTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_5ba1e:
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
	pop de
	push de
	ld a, $ff
	call Func_5b855
	set_farcall_addrs_hli free
	pop de
	push de
	ld hl, $f
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call FarCall
	pop de
	ld hl, $f
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	ret

Data_5ba65:
	db $21, $01, $03, $1a
	db $00, $02, $07, $09

Func_5ba6d: ; 5ba6d (16:7a6d)
	push hl
	add sp, -$70
	ld hl, sp+$70
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push bc
	push hl
	set_farcall_addrs_hli malloc
	ld hl, $168
	call FarCall
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	call FillVisibleAreaWithBlankTile
	call Func_1fbe
	call Func_1f30
	pop de
	pop hl
	push de
	write_hl_to_sp_plus $75
	read_hl_from_sp_plus $75
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $77
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	mulhlby35
	ld de, -$8c
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $73
	read_hl_from_sp_plus $73
	ld de, $b
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	call Func_241f
	read_hl_from_sp_plus $73
	inc hl
	reg16swap de, hl
	ld hl, sp+$53
	ld bc, $6
	call FarCopyVideoData
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	read_hl_from_sp_plus $75
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$1e
	call GetRobotBaseStats
	pop af
	call GetSRAMBank
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
	pop bc
	push de
	read_hl_from_sp_plus $71
	ld a, [hl]
	cp $ab
	jp c, Func_5bb54
	read_hl_from_sp_plus $71
	ld a, [hl]
	cp $af
	jp nc, Func_5bb54
	push bc
	ld e, $3
	ld a, $2
	call SetStringStartState
	ld hl, Data_5bfb3
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_5bbb7

Func_5bb54: ; 5bb54 (16:7b54)
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	ld c, l
	ld b, h
	push bc
	read_hl_from_sp_plus $73
	ld a, [hl]
	dec a
	ld e, c
	ld d, b
	ld bc, $89b0
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_7c8a
	pop bc
	push bc
	ld e, c
	ld d, b
	ld hl, $2
	ld c, $2
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_615be
	read_hl_from_sp_plus $71
	ld a, [hl]
	dec a
	call FarCall
	ld c, a
Func_5bbb7: ; 5bbb7 (16:7bb7)
	push bc
	set_farcall_addrs_hli Func_613fc
	pop bc
	ld a, c
	ld e, $1
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_5bbda
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_5bbe3
Func_5bbda: ; 5bbda (16:7bda)
	ld de, $8
	ld hl, Data_5ba65
	call Func_2b7d
Func_5bbe3: ; 5bbe3 (16:7be3)
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$51
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call FarCall
	set_farcall_addrs_hli Func_17e95
	ld c, $8
	ld e, $c
	ld hl, $802
	call FarCall
	ld c, $8
	ld e, $b
	ld hl, $a
	call FarCall
	ld c, $8
	ld e, $9
	ld hl, $b0a
	call FarCall
	ld hl, Data_5bfb7
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $71
	ld de, $7
	add hl, de
	ld c, [hl]
	ld b, $0
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, Data_5bfbb
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli GetBanks
	ld de, BANK(Text_66ea7)
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$21
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
	reg16swap de, hl
	ld hl, sp+$53
	ld bc, $7
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$51
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	set_farcall_addrs_hli Func_57cf7
	read_hl_from_sp_plus $71
	ld de, $e
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $71
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $10b
	call FarCall
	read_hl_from_sp_plus $71
	ld de, $12
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $71
	ld de, $10
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $10f
	call FarCall
	ld de, Data_5bfbd
	ld hl, $10f
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $71
	ld de, $c
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $20c
	call Func_2230
	ld hl, Data_5bfbf
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $71
	ld de, $e
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $103
	ld hl, -1
	call Func_2230
	read_hl_from_sp_plus $71
	ld de, $10
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $3
	ld hl, $210
	call Func_2230
	ld hl, Data_5bfc1
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $71
	ld de, $12
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld de, $103
	ld hl, -1
	call Func_2230
	read_hl_from_sp_plus $71
	ld de, $17
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$12
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_5bd62
	ld de, 999
Func_5bd62: ; 5bd62 (16:7d62)
	push de
	ld de, Data_5bfc3
	ld hl, $c0b
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100c
	call Func_2230
	read_hl_from_sp_plus $71
	ld de, $19
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_5bd97
	ld de, 999
Func_5bd97: ; 5bd97 (16:7d97)
	push de
	ld de, Data_5bfcb
	ld hl, $c0d
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100e
	call Func_2230
	read_hl_from_sp_plus $71
	ld de, $1b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$14
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_5bdcc
	ld de, 999
Func_5bdcc: ; 5bdcc (16:7dcc)
	push de
	ld de, Data_5bfd4
	ld hl, $c0f
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $1010
	call Func_2230
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	read_hl_from_sp_plus $71
	ld de, $20
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	and $f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $6ef6
	add hl, de
	push hl
	ld a, c
	call GetSRAMBank
	pop de
	ld hl, sp+$51
	ld bc, $5
	call FarCopyVideoData
	ld de, Data_5bfdc
	ld hl, $903
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$51
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	read_hl_from_sp_plus $73
	ld de, $22
	add hl, de
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
	ld hl, sp+$53
	call LiteralStringInTree
	ld e, $5
	ld a, $9
	call SetStringStartState
	ld hl, sp+$53
	push hl
	ld hl, Data_5bfe2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop af
	call GetSRAMBank
	ld hl, sp+$1f
	ld a, [hl]
	ld hl, sp+$4d
	push hl
	read_hl_from_sp_plus $73
	ld de, $7
	add hl, de
	ld l, [hl]
	ld h, a
	pop de
	call Func_270a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $71
	ld de, $7
	add hl, de
	ld a, [hl]
	cp $63
	jp nz, Func_5bebc
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$4d
	call PutLongFromStackToHL
	jp Func_5bedb

Func_5bebc: ; 5bebc (16:7ebc)
	ld l, c
	ld h, b
	ld bc, $0
	push bc
	push hl
	read_hl_from_sp_plus $75
	ld de, $14
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld bc, $0
	push bc
	push de
	call SubtractLongsFromStack
	ld hl, sp+$4d
	call PutLongFromStackToHL
Func_5bedb: ; 5bedb (16:7edb)
	ld e, $6
	ld a, $9
	call SetStringStartState
	ld hl, sp+$4d
	call PutLongFromHLOnStack
	read_hl_from_sp_plus $75
	ld de, $14
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld bc, $0
	push bc
	push de
	call AddLongsFromStack
	ld hl, Data_5bfe9
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $6
	ld a, $9
	call SetStringStartState
	ld hl, sp+$4d
	call PutLongFromHLOnStack
	ld hl, Data_5bff1
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $8
	ld a, $b
	call SetStringStartState
	ld hl, sp+$49
	call PutLongFromHLOnStack
	ld hl, Data_5bff9
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
	callba_hli WaitAorBButtonOverworld_17a44
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call FillVisibleAreaWithBlankTile
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld a, [wSystemType]
	cp $1
	jp z, Func_5bf6e
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_5bf82
Func_5bf6e: ; 5bf6e (16:7f6e)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_5bf82: ; 5bf82 (16:7f82)
	pop de
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call RestoreTileMapRectangle
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	call Func_1f7b
	call Func_2009
	add sp, $72
	ret

Data_5bfb3:
	dstr "???"

Data_5bfb7:
	dstr ":LV"

Data_5bfbb:
	dstr " "

Data_5bfbd:
	dstr "E"

Data_5bfbf:
	dstr "/"

Data_5bfc1:
	dstr "/"

Data_5bfc3:
	dstr "(こうけﾞき)"

Data_5bfcb:
	dstr "(ほﾞうきﾞょ)"

Data_5bfd4:
	dstr "(すはﾞやさ)"

Data_5bfdc:
	dstr "タイフﾟ:"

Data_5bfe2:
	dstr "CPU:%s"

Data_5bfe9:
	dstr "E*P:%ld"

Data_5bff1:
	dstr "E*P:%ld"

Data_5bff9:
	dstr "(あと)%d"


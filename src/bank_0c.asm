INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 0c", ROMX [$4000], BANK [$c]
Func_30000: ; 30000
	ret

Data_30001: ; 30001
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_32a37
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_30020: ; 30020
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $06, $00, $ff, $ff, $32, $00, $0f

Data_3002f: ; 3002f
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_3103d
	dba Func_15297
	dba Func_30cc1
	dba Func_30d44
	dbw 0, 0
	dbw 0, 0

Data_3004e: ; 3004e
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $00, $00, $00, $00, $33, $00, $12

Data_3005d: ; 3005d
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_32c30
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_3007c: ; 3007c
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $06, $00, $00, $00, $34, $00, $0f

Data_3008b: ; 3008b
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_3103d
	dba Func_15297
	dba Func_30cc1
	dba Func_30d44
	dbw 0, 0
	dbw 0, 0

Data_300aa: ; 300aa
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $06, $00, $00, $00, $35, $00, $15

Data_300b9: ; 300b9
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_32c30
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_300d8: ; 300d8
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $06, $00, $00, $00, $36, $00, $0f

Data_300e7: ; 300e7
	db  0,  2
	db 19, 10
	dba Func_30676
	dbw 5, 0
	dba Func_309da
	dba Func_3103d
	dba Func_15297
	dba Func_30cc1
	dba Func_30d44
	dbw 0, 0
	dbw 0, 0

Data_30106: ; 30106
	db $00, $00, $00, $00, $ff, $ff, $04, $00, $06, $00, $00, $00, $37, $00, $16

Data_30115: ; 30115
	db  0,  0
	db  5,  5
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_15281
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_30134:
	db $38, $41, $3d, $41, $28, $b6, $b3, $29, $00, $28, $b3, $d9, $29, $00

Data_30142: ; 30142
	db $00, $00, $00, $00, $ff, $ff, $02, $00, $02, $00, $00, $00, $34, $41, $00

ShopItems: ; 30151
	db KEROSENE, TEN_VOLTS, BAR_MAGNET, FLAPPING_CROW, GROUND_ESCAPE, THOUSAND_VOLTS
	db SUB_BATTERY, HEMWIDTH_COVER, SCAN_DISK, VERSION_UP, VERSION_DOWN, SIDE_EFFECT
	db KEROSENE, KEIYU, TEN_VOLTS, HUNDRED_VOLTS, BAR_MAGNET, GROUND_ESCAPE
	db KEIYU, GASOLINE, HUNDRED_VOLTS, THOUSAND_VOLTS, BAR_MAGNET, U_MAGNET
	db GASOLINE, THOUSAND_VOLTS, HYDRO_SYSTEM, U_MAGNET, FLAPPING_CROW, GROUND_ESCAPE
	db GASOLINE, HIGH_OCTANE, THOUSAND_VOLTS, MILLION_VOLTS, U_MAGNET, ELECTROMAGNET
	db SUB_BATTERY, HEMWIDTH_COVER, SCAN_DISK, VERSION_UP, VERSION_DOWN, SIDE_EFFECT
	db HIGH_OCTANE, MILLION_VOLTS, HYDRO_SYSTEM, ELECTROMAGNET, DEFRAG, GROUND_ESCAPE
	db HYDRO_SYSTEM, SOLAR_SYSTEM, DEFRAG, BACKUP, U_MAGNET, ELECTROMAGNET
	db SUB_BATTERY, HEMWIDTH_COVER, SCAN_DISK, VERSION_UP, VERSION_DOWN, SIDE_EFFECT
	db KEROSENE, KEIYU, TEN_VOLTS, HUNDRED_VOLTS, BAR_MAGNET, U_MAGNET
	db GASOLINE, HIGH_OCTANE, THOUSAND_VOLTS, MILLION_VOLTS, ELECTROMAGNET, DEFRAG
	db HYDRO_SYSTEM, SOLAR_SYSTEM, DEFRAG, BACKUP, FLAPPING_CROW, GROUND_ESCAPE
	db KEROSENE, KEIYU, GASOLINE, HIGH_OCTANE, BAR_MAGNET, FLAPPING_CROW
	db TEN_VOLTS, HUNDRED_VOLTS, THOUSAND_VOLTS, MILLION_VOLTS, U_MAGNET, GROUND_ESCAPE
	db SIDE_EFFECT, DEFRAG, BACKUP, RECOVERY_PROGRAM, HYDRO_SYSTEM, SOLAR_SYSTEM
	db CUP_RAMEN, FRIED_EGGS, CROQUETTE, FRIED_SHRIMP, HANDBAG, SUKIYAKI_SET
	db HYDRO_SYSTEM, SOLAR_SYSTEM, BEGINNER_TICKET, MIDDLE_TICKET, ADVANCED_TICKET, FREE_TICKET

Data_301bd: ; 301bd
	db $01, $02, $03, $04, $05, $06, $41, $42, $43, $44, $45, $46, $47, $49, $4c, $4e, $4f, $51, $81, $82, $83, $84, $85, $86, $87, $89, $8c, $8e, $8f, $91, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c9, $cc, $ce, $cf, $d1, $88, $8a, $8b, $8d, $93, $94, $96, $97, $98, $99, $9b, $50, $07, $09, $0c, $0e, $0f, $11, $4a, $52, $53, $55, $5e, $5f, $92, $95, $9e, $9f, $90, $ab, $c8, $ca, $cb, $cd, $d0, $d3, $d2, $d5, $dc, $d4, $de, $df, $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $00, $00, $00, $00, $00, $00

Data_30223: ; 30223
	db $01, $0c, $17, $22, $2d, $39, $03, $0e, $19, $24, $2f, $3b, $46, $51, $5c, $67, $7d, $78, $04, $10, $1a, $25, $30, $3c, $47, $52, $5d, $68, $71, $79, $07, $12, $1c, $27, $32, $3e, $49, $54, $5f, $6a, $7e, $7b, $08, $13, $1d, $29, $33, $3f, $4a, $55, $61, $6e, $72, $35, $44, $4f, $5a, $65, $70, $7f, $02, $0d, $18, $23, $2e, $3a, $05, $11, $1b, $26, $31, $3d, $09, $14, $1e, $2b, $34, $40, $45, $50, $5b, $66, $73, $80, $48, $53, $5e, $69, $74, $7a, $4b, $56, $63, $6f, $75, $7c, $00, $00, $00, $00, $00, $00

Func_30289: ; 30289 (c:4289)
	push af
	push de
	push bc
	read_hl_from_sp_plus $c
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld d, h
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call BackUpTileMapRectangle
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $c
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld d, h
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call BackUpAttrMapRectangle
	pop bc
	pop bc
	pop bc
	ret

Func_302ce: ; 302ce (c:42ce)
	push af
	push de
	push bc
	read_hl_from_sp_plus $c
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld d, h
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call RestoreTileMapRectangle
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $c
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld d, h
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call RestoreAttrMapRectangle
	pop bc
	pop bc
	pop bc
	ret

Func_30313: ; 30313 (c:4313)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_30328:: ; 30328
	ld a, $f
	ld [wCurShop], a
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
	call Func_30348
	ld hl, -1
	ret

Func_30348:: ; 30348 (c:4348)
	push af
	push bc
	push bc
	push bc
	push bc
	check_cgb
	jp nz, Func_3035a
	ld a, $2
	ld [wEnableAttrMapTransfer], a
Func_3035a: ; 3035a (c:435a)
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
	call PushBGMapRegion
	pop bc
	ld hl, sp+$9
	ld a, [hl]
	cp $5
	jp z, Func_3038d
	cp $4
	jp z, Func_30384
	cp $3
	jp nz, Func_30393
Func_30384: ; 30384 (c:4384)
	ld hl, sp+$9
	ld a, [hl]
	call Func_3318e
	jp Func_3058a

Func_3038d: ; 3038d (c:438d)
	call Func_3312f
	jp Func_3058a

Func_30393: ; 30393 (c:4393)
	ld hl, sp+$7
	ld [hl], $0
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	reg16swap de, hl
	push de
	ld hl, $5a
	call FarCall
	pop de
	push de
	push hl
	push de
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_30289
	pop bc
	pop bc
	pop hl
	pop de
	push hl
	push de
	push hl
	ld l, $3
	push hl
	ld c, $f
	ld e, $0
	ld a, $5
	call Func_30289
	pop bc
	pop bc
	set_farcall_addrs_hli Func_da901
	ld de, $f03
	ld hl, $500
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_da901
	ld de, $1405
	ld hl, $d
	call FarCall
	write_hl_to_sp_plus $d
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$6
	call FarCall
	ld hl, sp+$9
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld [wc7bd], a
	ld a, $ff
	ld a, [wc7bd]
	cp $c
	jp nc, Func_30454
	ld hl, wc7bd
	ld l, [hl]
	ld h, $0
	ld de, wc7b1
	add hl, de
	ld a, [hl]
	cp $15
	jp nz, Func_30443
	ld a, $1
	ld [wc38d], a
	jp Func_30454

Func_30443: ; 30443 (c:4443)
	cp $17
	jp nz, Func_30450
	ld a, $2
	ld [wc38d], a
	jp Func_30454

Func_30450: ; 30450 (c:4450)
	xor a
	ld [wc38d], a
Func_30454: ; 30454 (c:4454)
	ld hl, sp+$d
	ld a, [hl]
	call Func_30590
	reg16swap de, hl
	ld hl, sp+$d
	ld [hl], $1
	ld a, e
	or d
	jp nz, Func_304c2
	ld hl, sp+$f
	ld a, [hl]
	call Func_32822
	cp $1
	jp nz, Func_3047a
	ld a, $1
	call Func_3304d
	jp Func_30519

Func_3047a: ; 3047a (c:447a)
	set_farcall_addrs_hli Func_da901
	ld de, $140a
	ld hl, $2
	call FarCall
	push hl
	ld hl, sp+$11
	ld a, [hl]
	or a
	jp nz, Func_3049d
	xor a
	call Func_3321d
	jp Func_304b0

Func_3049d: ; 3049d (c:449d)
	ld hl, sp+$11
	ld a, [hl]
	cp $1
	jp nz, Func_304ac
	xor a
	call Func_332ab
	jp Func_304b0

Func_304ac: ; 304ac (c:44ac)
	xor a
	call Func_33339
Func_304b0: ; 304b0 (c:44b0)
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	jp Func_30516

Func_304c2: ; 304c2 (c:44c2)
	ld a, e
	dec a
	or d
	jp nz, Func_30513
	set_farcall_addrs_hli Func_da901
	ld de, $140a
	ld hl, $2
	call FarCall
	push hl
	ld hl, sp+$11
	ld a, [hl]
	or a
	jp nz, Func_304ec
	ld a, $1
	call Func_3321d
	jp Func_30501

Func_304ec: ; 304ec (c:44ec)
	ld hl, sp+$11
	ld a, [hl]
	cp $1
	jp nz, Func_304fc
	ld a, $1
	call Func_332ab
	jp Func_30501

Func_304fc: ; 304fc (c:44fc)
	ld a, $1
	call Func_33339
Func_30501: ; 30501 (c:4501)
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	jp Func_30516

Func_30513: ; 30513 (c:4513)
	jp Func_30519

Func_30516: ; 30516 (c:4516)
	jp Func_30454

Func_30519: ; 30519 (c:4519)
	ld a, $6
	call Func_3304d
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	pop bc
	pop de
	push bc
	push de
	push de
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_302ce
	pop bc
	pop bc
	pop de
	pop bc
	pop hl
	push hl
	push de
	push bc
	push hl
	ld l, $3
	push hl
	ld c, $f
	ld e, $0
	ld a, $5
	call Func_302ce
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	read_hl_from_sp_plus $b
	call FarCall
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop hl
	call FarCall
Func_3058a: ; 3058a (c:458a)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_30590: ; 30590 (c:4590)
	push bc
	push bc
	push af
	ld c, $3
	ld e, $f
	ld hl, $500
	call Func_30313
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$6
	call PutLongFromStackToHL
	ld de, Data_3064a
	ld hl, $601
	call PlaceStringDEatCoordHL
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_319be
	pop bc
	pop bc
	pop af
	or a
	jp nz, Func_305eb
	ld de, Data_30653
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_3065c
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_305f4

Func_305eb: ; 305eb (c:45eb)
	ld de, Data_30667
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_305f4: ; 305f4 (c:45f4)
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_da901
	ld de, $505
	ld hl, $0
	call FarCall
	push hl
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_30142)
	ld de, Data_30142
	ld hl, Data_30115
	call FarCall
	reg16swap de, hl
	push de
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop de
	pop hl
	push de
	call FarCall
	pop hl
	pop bc
	pop bc
	ret

Data_3064a: ; 3064a
	dstr "(しょしﾞきん)"

Data_30653: ; 30653
	dstr "(いらっしゃい)"

Data_3065c: ; 3065c
	dstr "(ようけんはなに)?"

Data_30667: ; 30667
	dstr "(ほかにも ようかﾞある)?"

Func_30676: ; 30676 (c:4676)
	push bc
	push bc
	push bc
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$1
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
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	read_hl_from_sp_plus $c
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	read_hl_from_sp_plus $e
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$8
	ld [hl], e
	add $fe
	ld b, $2
	call DivideAbyB
	ld hl, sp+$b
	ld [hl], a
	pop bc
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp nc, Func_306db
	ld hl, sp+$9
	ld [hl], c
Func_306db: ; 306db (c:46db)
	ld hl, sp+$9
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $c
	ld de, $9
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop af
	pop hl
	push bc
	ld c, a
	ld e, l
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$3
	ld l, [hl]
	ld h, a
	call Func_30313
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
	ld hl, sp+$4
	ld a, [hl]
	add $2
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	cp $37
	jp z, Func_30772
	cp $35
	jp z, Func_3075b
	cp $33
	jp nz, Func_30786
	ld a, [wSaveScratchca6c]
	cp $1
	jp nc, Func_30758
	ld a, e
	ld e, $0
	call Func_30869
	ld hl, -1
	jp Func_30865

Func_30758: ; 30758 (c:4758)
	jp Func_30786

Func_3075b: ; 3075b (c:475b)
	ld a, [wc9a2]
	cp $1
	jp nc, Func_3076f
	ld a, e
	ld e, $1
	call Func_30869
	ld hl, -1
	jp Func_30865

Func_3076f: ; 3076f (c:476f)
	jp Func_30786

Func_30772: ; 30772 (c:4772)
	ld a, [wc9b7]
	cp $1
	jp nc, Func_30786
	ld a, e
	ld e, $2
	call Func_30869
	ld hl, -1
	jp Func_30865

Func_30786: ; 30786 (c:4786)
	push de
	xor a
Func_30788: ; 30788 (c:4788)
	ld hl, sp+$5
	cp [hl]
	jp nc, Func_307bf
	push bc
	push af
	ld hl, sp+$6
	ld l, [hl]
	push hl
	ld l, a
	ld h, $0
	add hl, bc
	ld c, l
	ld hl, sp+$9
	ld e, [hl]
	ld hl, sp+$a
	ld a, [hl]
	call Func_308da
	pop bc
	pop af
	pop bc
	push bc
	push af
	ld hl, sp+$6
	ld e, [hl]
	ld l, a
	ld h, $0
	add hl, bc
	call Func_30dfd
	ld hl, sp+$7
	ld a, [hl]
	add $2
	ld hl, sp+$7
	ld [hl], a
	pop af
	inc a
	pop bc
	jp Func_30788

Func_307bf: ; 307bf (c:47bf)
	pop de
	push bc
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli Func_17863
	call GetHLAtSPPlus8
	call FarCall
	ld hl, sp+$2
	ld a, [hl]
	cp $37
	jp z, Func_307fe
	cp $35
	jp z, Func_307fe
	cp $33
	jp z, Func_307fe
	cp $36
	jp z, Func_307f7
	cp $34
	jp z, Func_307f7
	cp $32
	jp nz, Func_30803
Func_307f7: ; 307f7 (c:47f7)
	xor a
	call Func_30ff8
	jp Func_30803

Func_307fe: ; 307fe (c:47fe)
	ld a, $1
	call Func_30ff8
Func_30803: ; 30803 (c:4803)
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	cp $32
	jp nz, Func_30851
	push bc
	ld c, $3
	ld e, $14
	ld hl, $b
	call Func_30313
	set_farcall_addrs_hli Func_61133
	pop bc
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	pop de
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $a9 - 1 ; TreeBitstreamText_4b486
	add hl, de
	reg16swap de, hl
	ld hl, $10c
	call FarCall
Func_30851: ; 30851 (c:4851)
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
Func_30865: ; 30865 (c:4865)
	pop bc
	pop bc
	pop bc
	ret

Func_30869: ; 30869 (c:4869)
	push de
	push af
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	pop af
	call GetSRAMBank
	pop de
	ld a, e
	cp $2
	jp z, Func_3089c
	cp $1
	jp z, Func_30890
	or a
	jp nz, Func_308a5
	ld de, Data_308c0
	ld hl, $203
	call PlaceStringDEatCoordHL
	jp Func_308a5

Func_30890: ; 30890 (c:4890)
	ld de, Data_308c9
	ld hl, $203
	call PlaceStringDEatCoordHL
	jp Func_308a5

Func_3089c: ; 3089c (c:489c)
	ld de, Data_308d1
	ld hl, $203
	call PlaceStringDEatCoordHL
Func_308a5: ; 308a5 (c:48a5)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli WaitAorBButtonOverworld_17a44
	ret

Data_308c0: ; 308c0
	dstr "アイテム(なし)"

Data_308c9: ; 308c9
	dstr "ソフト(なし)"

Data_308d1: ; 308d1
	dstr "ハﾟーツ(なし)"

Func_308da: ; 308da (c:48da)
	push bc
	add sp, -$1e
	push af
	push de
	ld hl, sp+$26
	ld a, [hl]
	cp $3a
	jp z, Func_309a9
	cp $37
	jp z, Func_309a9
	cp $36
	jp z, Func_3097b
	cp $39
	jp z, Func_30963
	cp $35
	jp z, Func_30963
	cp $34
	jp z, Func_30935
	cp $38
	jp z, Func_3091d
	cp $33
	jp z, Func_3091d
	cp $32
	jp nz, Func_309be
	ld hl, sp+$26
	ld c, [hl]
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call Func_30d85
	jp Func_309be

Func_3091d: ; 3091d (c:491d)
	set_farcall_addrs_hli Func_55ed2
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_309be

Func_30935: ; 30935 (c:4935)
	ld hl, sp+$22
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_301bd
	add hl, de
	add hl, bc
	ld a, [hl]
	push af
	set_farcall_addrs_hli Func_5601b
	pop af
	ld e, a
	ld hl, sp+$4
	ld c, $3
	call FarCall
	jp Func_309be

Func_30963: ; 30963 (c:4963)
	set_farcall_addrs_hli Func_5601b
	ld c, $4
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	jp Func_309be

Func_3097b: ; 3097b (c:497b)
	ld hl, sp+$22
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_30223
	add hl, de
	add hl, bc
	ld a, [hl]
	push af
	set_farcall_addrs_hli Func_55f95
	pop af
	ld e, a
	ld hl, sp+$4
	ld c, $2
	call FarCall
	jp Func_309be

Func_309a9: ; 309a9 (c:49a9)
	set_farcall_addrs_hli Func_55f95
	ld c, $0
	ld hl, sp+$22
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
Func_309be: ; 309be (c:49be)
	set_farcall_addrs_hli Func_16019
	pop de
	pop af
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld d, $0
	ld l, a
	ld h, $0
	call FarCall
	add sp, $20
	ret

Func_309da: ; 309da
	push hl
	add sp, -$10
	ld hl, sp+$10
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	pop hl
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $13
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $13
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $13
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $13
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$a
	ld [hl], a
	read_hl_from_sp_plus $13
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$9
	ld [hl], a
	read_hl_from_sp_plus $13
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$8
	ld [hl], a
	read_hl_from_sp_plus $13
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$7
	ld [hl], a
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $15
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_30a85
	read_hl_from_sp_plus $13
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
Func_30a85: ; 30a85 (c:4a85)
	ld hl, sp+$6
	ldh a, [hSRAMBank]
	ld [hl], a
	read_hl_from_sp_plus $13
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_30acb
	ld a, e
	or d
	jp nz, Func_30b1e
	dec bc
	inc b
	dec b
	bit 7, b
	jr z, .asm_30ac8
	ld bc, $0
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $d
	inc h
	dec h
	bit 7, h
	jr z, .asm_30ac4
	ld hl, $0
	write_hl_to_sp_plus $d
	jp .asm_30ac8

.asm_30ac4
	ld hl, sp+$2
	ld [hl], $1
.asm_30ac8
	jp Func_30b1e

Func_30acb: ; 30acb (c:4acb)
	read_hl_from_sp_plus $f
	reg16swap de, hl
	inc bc
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp c, Func_30b1e
	read_hl_from_sp_plus $f
	dec hl
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	inc hl
	write_hl_to_sp_plus $d
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $f
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $13
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_30b1a
	read_hl_from_sp_plus $d
	dec hl
	write_hl_to_sp_plus $d
	jp Func_30b1e

Func_30b1a: ; 30b1a (c:4b1a)
	ld hl, sp+$2
	ld [hl], $2
Func_30b1e: ; 30b1e (c:4b1e)
	push bc
	read_hl_from_sp_plus $13
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $f
	push hl
	read_hl_from_sp_plus $15
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_30c4d
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, de
	dec hl
	dec hl
	push hl
	ld hl, sp+$a
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	add hl, de
	ld h, l
	ld l, $0
	dec h
	dec h
	pop de
	add hl, de
	call Coord2TileMap
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_17ef7
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld c, a
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	dec de
	dec de
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	dec h
	dec h
	dec h
	add hl, de
	push hl
	ld hl, sp+$b
	ld e, [hl]
	ld d, $0
	ld hl, sp+$c
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	pop de
	call FarCall
	ld a, $3
	call GetSRAMBank
	ld hl, sp+$4
	ld a, [hl]
	cp $1
	jp nz, Func_30bd3
	ld hl, sp+$5
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $11
	ld c, l
	ld hl, sp+$b
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add $2
	call Func_308da
	pop bc
	read_hl_from_sp_plus $f
	write_hl_to_sp_plus $d
	call GetHLAtSPPlus4
	ld [hl], $8a
	jp Func_30c2c

Func_30bd3: ; 30bd3 (c:4bd3)
	ld hl, sp+$5
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $13
	push hl
	read_hl_from_sp_plus $13
	pop de
	add hl, de
	dec hl
	push hl
	ld hl, sp+$d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $15
	add hl, hl
	add hl, bc
	dec hl
	ld e, l
	ld hl, sp+$e
	ld a, [hl]
	add $2
	pop bc
	call Func_308da
	pop bc
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $11
	pop de
	add hl, de
	dec hl
	write_hl_to_sp_plus $d
	read_hl_from_sp_plus $13
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $11
	push hl
	read_hl_from_sp_plus $11
	pop de
	add hl, de
	call CompareHLtoBC
	jp c, Func_30c2c
	call GetHLAtSPPlus4
	ld [hl], $8f
Func_30c2c: ; 30c2c (c:4c2c)
	ld hl, sp+$6
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$5
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $f
	pop de
	call Func_30dfd
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	jp Func_30c5f

Func_30c4d: ; 30c4d (c:4c4d)
	set_farcall_addrs_hli Func_17863
	read_hl_from_sp_plus $13
	call FarCall
Func_30c5f: ; 30c5f (c:4c5f)
	pop bc
	ld hl, sp+$3
	ld a, [hl]
	cp $32
	jp nz, Func_30ca7
	push bc
	ld c, $3
	ld e, $14
	ld hl, $b
	call Func_30313
	set_farcall_addrs_hli Func_61133
	pop bc
	read_hl_from_sp_plus $d
	add hl, bc
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	pop de
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $a9 - 1 ; TreeBitstreamText_4b486
	add hl, de
	reg16swap de, hl
	ld hl, $10c
	call FarCall
Func_30ca7: ; 30ca7 (c:4ca7)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	reg16swap de, hl
	add sp, $12
	reg16swap de, hl
	ret

Func_30cc1: ; 30cc1
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
	jp nc, Func_30d16
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
Func_30d16: ; 30d16 (c:4d16)
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
	set_farcall_addrs_hli Func_30676
	pop hl
	call FarCall
	pop bc
	pop bc
	ret

Func_30d44: ; 30d44
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
	jr z, .asm_30d61
	ld de, $0
.asm_30d61
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
	set_farcall_addrs_hli Func_30676
	pop hl
	call FarCall
	ret

Func_30d85: ; 30d85 (c:4d85)
	push hl
	push de
	ld a, c
	cp $32
	jp nz, Func_30da7
	ld hl, sp+$0
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	jp Func_30db2

Func_30da7: ; 30da7 (c:4da7)
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	dec a
Func_30db2: ; 30db2 (c:4db2)
	push af
	set_farcall_addrs_hli GetName
	pop af
	call GetHLAtSPPlus4
	push hl
	ld l, a
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	ld c, $a
	call FarCall
	call GetHLAtSPPlus4
	call FindFirstNonzero
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
Func_30ddf: ; 30ddf (c:4ddf)
	ld l, c
	ld h, b
	ld de, $9
	call CompareHLtoDE
	jp nc, Func_30df7
	call GetHLAtSPPlus4
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus4
	inc bc
	jp Func_30ddf

Func_30df7: ; 30df7 (c:4df7)
	call GetHLAtSPPlus4
	pop bc
	pop bc
	ret

Func_30dfd: ; 30dfd (c:4dfd)
	push hl
	add sp, -$36
	push bc
	push de
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop de
	pop bc
	push af
	ld a, e
	cp $3a
	jp z, Func_30fae
	cp $37
	jp z, Func_30fae
	cp $36
	jp z, Func_30f5d
	cp $39
	jp z, Func_30ea5
	cp $35
	jp z, Func_30ea5
	cp $34
	jp z, Func_30ea5
	cp $32
	jp nz, Func_30fe0
	read_hl_from_sp_plus $3a
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, ItemAttributes
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2b
	ld bc, $d
	call FarCopyVideoData
	read_hl_from_sp_plus $38
	ld a, [wc38d]
	cp $1
	jp nz, Func_30e86
	ld de, $2
	call DivideHLByDESigned
	jp Func_30e8f

Func_30e86: ; 30e86 (c:4e86)
	ld a, [wc38d]
	cp $2
	jp nz, Func_30e8f
	add hl, hl
Func_30e8f: ; 30e8f (c:4e8f)
	ld c, l
	ld b, h
	ld de, $4
	ld hl, -1
	call Func_2230
	ld hl, Data_30fe7
	push hl
	call PlaceString
	pop bc
	jp Func_30fe0

Func_30ea5: ; 30ea5 (c:4ea5)
	push de
	ld a, e
	cp $39
	jp z, Func_30ed2
	cp $35
	jp z, Func_30ed2
	cp $34
	jp nz, Func_30edd
	read_hl_from_sp_plus $3c
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_301bd
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	jp Func_30edd

Func_30ed2: ; 30ed2 (c:4ed2)
	read_hl_from_sp_plus $3c
	ld de, wc98e
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
Func_30edd: ; 30edd (c:4edd)
	push bc
	ld a, c
	and $3f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4093
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1e
	ld bc, $11
	call FarCopyVideoData
	pop bc
	read_hl_from_sp_plus $2c
	reg16swap de, hl
	ld l, c
	ld h, $0
	ld b, $6
	call RightShiftHL
	inc hl
	call MultiplyHLbyDE
	pop de
	ld a, e
	cp $39
	jp z, Func_30f1c
	cp $35
	jp nz, Func_30f25
Func_30f1c: ; 30f1c (c:4f1c)
	ld de, $2
	call DivideHLByDESigned
	jp Func_30f3f

Func_30f25: ; 30f25 (c:4f25)
	ld a, [wc38d]
	cp $1
	jp nz, Func_30f36
	ld de, $2
	call DivideHLByDESigned
	jp Func_30f3f

Func_30f36: ; 30f36 (c:4f36)
	ld a, [wc38d]
	cp $2
	jp nz, Func_30f3f
	add hl, hl
Func_30f3f: ; 30f3f (c:4f3f)
	push hl
	ld hl, Data_30fea
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, $5
	ld hl, -1
	call Func_2230
	ld hl, Data_30fef
	push hl
	call PlaceString
	pop bc
	jp Func_30fe0

Func_30f5d: ; 30f5d (c:4f5d)
	read_hl_from_sp_plus $3a
	push hl
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_30223
	add hl, de
	pop de
	add hl, de
	ld c, [hl]
	ld e, c
	ld hl, sp+$2
	call Func_241f
	read_hl_from_sp_plus $19
	ld a, [wc38d]
	cp $1
	jp nz, Func_30f8f
	ld de, $2
	call DivideHLByDESigned
	jp Func_30f98

Func_30f8f: ; 30f8f (c:4f8f)
	ld a, [wc38d]
	cp $2
	jp nz, Func_30f98
	add hl, hl
Func_30f98: ; 30f98 (c:4f98)
	ld c, l
	ld b, h
	ld de, $5
	ld hl, -1
	call Func_2230
	ld hl, Data_30ff1
	push hl
	call PlaceString
	pop bc
	jp Func_30fe0

Func_30fae: ; 30fae (c:4fae)
	read_hl_from_sp_plus $3a
	ld de, wc9a3
	add hl, de
	ld c, [hl]
	ld e, c
	ld hl, sp+$2
	call Func_241f
	read_hl_from_sp_plus $19
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld de, $5
	ld hl, -1
	call Func_2230
	ld hl, Data_30ff5
	push hl
	call PlaceString
	pop bc
Func_30fe0: ; 30fe0 (c:4fe0)
	pop af
	call GetSRAMBank
	add sp, $38
	ret

Data_30fe7: ; 30fe7
	dstr "0G"

Data_30fea: ; 30fea
	dstr "    "

Data_30fef: ; 30fef
	dstr "G"

Data_30ff1: ; 30ff1
	dstr "00G"

Data_30ff5: ; 30ff5
	dstr "0G"

Func_30ff8: ; 30ff8 (c:4ff8)
	push af
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld e, $14
	ld a, $d
	call SetStringStartState
	pop af
	or a
	jp nz, Func_3101b
	ld de, Data_31025
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_31024

Func_3101b: ; 3101b (c:501b)
	ld de, Data_3102f
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_31024: ; 31024 (c:5024)
	ret

Data_31025: ; 31025
	dstr "(なにを かう)?"

Data_3102f: ; 3102f
	dstr "(なにを うってくれる)?"

Func_3103d: ; 3103d
	push hl
	add sp, -$3c
	read_hl_from_sp_plus $3e
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
	push hl
	ld hl, $d
	add hl, bc
	ld a, [hl]
	push af
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
	pop af
	pop hl
	cp $33
	jp nz, Func_31154
	push hl
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop hl
	push af
	ld e, l
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	dec a
	ld hl, sp+$3c
	ld [hl], a
	ld hl, sp+$3c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, ItemAttributes
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2b
	ld bc, $d
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	read_hl_from_sp_plus $36
	ld a, l
	or h
	jp nz, Func_310d5
	ld a, $7
	call Func_3304d
	ld hl, $8000
	jp Func_31299

Func_310d5: ; 310d5 (c:50d5)
	read_hl_from_sp_plus $36
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_310e3
	dec bc
.asm_310e3
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $5
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$3a
	call PutLongFromStackToHL
	set_farcall_addrs_hli Func_14db8
	read_hl_from_sp_plus $3e
	call FarCall
	ld a, [wc2f6]
	cp $ff
	jp z, Func_31116
	ld a, [wc2f6]
	or a
	jp nz, Func_3111c
Func_31116: ; 31116 (c:5116)
	ld hl, $8000
	jp Func_31299

Func_3111c: ; 3111c (c:511c)
	read_hl_from_sp_plus $36
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_3112a
	dec bc
.asm_3112a
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $5
	push hl
	call MultiplyLongsFromStack
	ld hl, wc2f6
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_31147
	dec bc
.asm_31147
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$3a
	call PutLongFromStackToHL
	jp Func_3122e

Func_31154: ; 31154 (c:5154)
	push hl
	push af
	set_farcall_addrs_hli GetBanks
	ld de, BANK(Moves)
	ld a, $3
	call FarCall
	ld e, a
	pop af
	pop hl
	push de
	cp $37
	jp z, Func_311e9
	cp $35
	jp nz, Func_31229
	ld e, l
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld a, [hl]
	dec a
	ld hl, sp+$3c
	ld [hl], a
	ld hl, sp+$3c
	ld a, [hl]
	and $3f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Moves
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1a
	ld bc, $11
	call FarCopyVideoData
	read_hl_from_sp_plus $2a
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_311b0
	dec bc
.asm_311b0
	push bc
	push hl
	ld hl, sp+$40
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_311c1
	dec bc
.asm_311c1
	push bc
	push hl
	ld b, $6
	call RightShiftLongFromStack
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	call AddLongsFromStack
	call MultiplyLongsFromStack
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	call StackDivideLongSigned
	ld hl, sp+$3c
	call PutLongFromStackToHL
	jp Func_31229

Func_311e9: ; 311e9 (c:51e9)
	ld e, l
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld e, [hl]
	ld hl, sp+$3c
	ld [hl], e
	ld hl, sp+$3c
	ld e, [hl]
	ld hl, sp+$2
	call Func_241f
	read_hl_from_sp_plus $19
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_3120a
	dec bc
.asm_3120a
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$3c
	call PutLongFromStackToHL
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$3c
	call DivideLongSigned
Func_31229: ; 31229 (c:5229)
	pop de
	ld a, e
	call GetSRAMBank
Func_3122e: ; 3122e (c:522e)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld hl, sp+$36
	call PutLongFromHLOnStack
	ld a, $1
	call Func_314da
	pop bc
	pop bc
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$36
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call CompareStackLongs
	jp nz, Func_31277
	callba_hli WaitAorBButtonOverworld_17a44
	ld hl, $8000
	jp Func_31299

Func_31277: ; 31277 (c:5277)
	ld hl, sp+$36
	call PutLongFromHLOnStack
	read_hl_from_sp_plus $42
	ld c, l
	ld b, h
	ld hl, sp+$3e
	ld e, [hl]
	ld a, $1
	call Func_31539
	pop bc
	pop bc
	or a
	jp nz, Func_31296
	ld hl, $8000
	jp Func_31299

Func_31296: ; 31296 (c:5296)
	ld hl, -1
Func_31299: ; 31299 (c:5299)
	reg16swap de, hl
	add sp, $3e
	reg16swap de, hl
	ret

Func_312a4: ; 312a4
	push af
	push bc
	add sp, -$12
	ld a, e
	cp $32
	jp nz, Func_312c7
	ld hl, sp+$15
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	dec hl
Func_312c7: ; 312c7 (c:52c7)
	push hl
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop hl
	push af
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, ItemAttributes
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $d
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	ld c, $4
	ld e, $9
	ld hl, $b0d
	call Func_30313
	read_hl_from_sp_plus $d
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_31312
	dec bc
.asm_31312
	push bc
	push hl
	ld hl, sp+$16
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_31323
	dec bc
.asm_31323
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$11
	call PutLongFromStackToHL
	ld a, [wc38d]
	cp $1
	jp nz, Func_31345
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$11
	call DivideLongSigned
	jp Func_3135a

Func_31345: ; 31345 (c:5345)
	ld a, [wc38d]
	cp $2
	jp nz, Func_3135a
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$11
	call MultiplyLongs
Func_3135a: ; 3135a (c:535a)
	ld de, Data_31435
	ld hl, $d0e
	call PlaceStringDEatCoordHL
	ld e, $f
	ld a, $c
	call SetStringStartState
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call CompareStackLongs
	jp nz, Func_3138f
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, Data_3143c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31432

Func_3138f: ; 3138f (c:538f)
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_313b4
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, Data_31446
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31432

Func_313b4: ; 313b4 (c:53b4)
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_313d9
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, Data_31450
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31432

Func_313d9: ; 313d9 (c:53d9)
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $3e8
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_313fe
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, Data_31459
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31432

Func_313fe: ; 313fe (c:53fe)
	ld hl, sp+$d
.asm_313ff
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_31423
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, $5461
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31432

Func_31423: ; 31423 (c:5423)
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, Data_31468
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
Func_31432: ; 31432 (c:5432)
	add sp, $16
	ret

Data_31435: ; 31435
	dstr "(ねたﾞん)"

Data_3143c: ; 3143c
	dstr "     %ldG"

Data_31446: ; 31446
	dstr "    %ld0G"

Data_31450: ; 31450
	dstr "   %ld0G"

Data_31459: ; 31459
	dstr "  %ld0G"

Data_31461: ; 31461
	dstr " %ld0G"

Data_31468: ; 31468
	dstr "%ld0G"

Func_31475: ; 31475
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_667d
	ld bc, $8e02
	ld de, $1311
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

GetItemAttributes2: ; 3149e
	push de
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, ItemAttributes
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld e, c
	ld d, b
	ld bc, $d
	call FarCopyVideoData
	pop hl
	ld a, l
	call GetSRAMBank
	pop bc
	ret

Func_314da: ; 314da (c:54da)
	push af
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, sp+$4
	call PutLongFromHLOnStack
	ld hl, Data_31515
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld de, Data_3151a
	ld hl, -1
	call PlaceStringDEatCoordHL
	pop af
	or a
	jp nz, Func_3150b
	ld de, Data_31522
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_31514

Func_3150b: ; 3150b (c:550b)
	ld de, Data_31530
	ld hl, $110
	call PlaceStringDEatCoordHL
Func_31514: ; 31514 (c:5514)
	ret

Data_31515: ; 31515
	dstr "%ldG"

Data_3151a: ; 3151a
	dstr "(になります)"

Data_31522: ; 31522
	dstr "(おもとめになりますか)?"

Data_31530: ; 31530
	dstr "(うりますか)?"

Func_31539: ; 31539 (c:5539)
	push de
	push bc
	push bc
	push bc
	push bc
	call GetHLAtSPPlus8
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $d
	add hl, de
	ld e, [hl]
	push de
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
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
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$8
	call PutLongFromStackToHL
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld hl, sp+$10
	call PutLongFromHLOnStack
	ld a, $1
	call Func_314da
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	pop bc
	pop de
	ld a, l
	or h
	jp nz, Func_3174c
	push de
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
	pop de
	push de
	ld a, e
	cp $37
	jp z, Func_3160c
	cp $35
	jp z, Func_315f6
	cp $33
	jp nz, Func_3161f
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $1
	ld a, [wc2f6]
	ld e, a
	ld hl, sp+$a
	ld a, [hl]
	inc a
	call FarCall
	jp Func_3161f

Func_315f6: ; 315f6 (c:55f6)
	push bc
	set_farcall_addrs_hli Func_4ec2b
	pop bc
	ld a, c
	ld e, $1
	call FarCall
	jp Func_3161f

Func_3160c: ; 3160c (c:560c)
	push bc
	set_farcall_addrs_hli Func_4ed70
	pop bc
	ld a, c
	ld e, $1
	call FarCall
Func_3161f: ; 3161f (c:561f)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	pop de
	ld a, e
	cp $37
	jp z, Func_316b2
	cp $35
	jp z, Func_31679
	cp $33
	jp nz, Func_316e8
	push bc
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld a, [wSaveScratchca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $38
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	call Func_30676
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $33
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	jp Func_316e8

Func_31679: ; 31679 (c:5679)
	push bc
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld a, [wc9a2]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	call GetSRAMBank
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $39
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	call Func_30676
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $35
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	jp Func_316e8

Func_316b2: ; 316b2 (c:56b2)
	push bc
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld a, [wc9b7]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	call GetSRAMBank
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $3a
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	call Func_30676
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld de, $37
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
Func_316e8: ; 316e8 (c:56e8)
	ld a, c
	call GetSRAMBank
	push hl
	push hl
	ld hl, sp+$10
	call PutLongFromHLOnStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$4
	call PutLongFromStackToHL
	ld l, $2
	push hl
	ld c, $e
	ld e, $1
	ld a, $6
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $1
	ld a, $6
	call SetStringStartState
	ld hl, Data_31756
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$0
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_319be
	pop bc
	pop bc
	ld l, $2
	push hl
	ld c, $e
	ld e, $1
	ld a, $6
	call DoublePushBGMapRegion
	pop bc
	ld a, $4
	call Func_3304d
	jp Func_31750

Func_3174c: ; 3174c (c:574c)
	ld hl, $1
	xor a
Func_31750: ; 31750 (c:5750)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_31756: ; 31756
	dstr "(しょしﾞきん)"

Func_3175f: ; 3175f
	add sp, -$3e
	push de
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	pop de
	cp $2
	jp z, Func_31869
	cp $1
	jp z, Func_3178a
	or a
	jp nz, Func_31932
	jp Func_31932

Func_3178a: ; 3178a (c:578a)
	ld a, e
	rlca
	rlca
	and $3
	inc a
	push af
	push hl
	ld a, e
	and $3f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Moves
	add hl, de
	reg16swap de, hl
	ld hl, sp+$30
	ld bc, $11
	call FarCopyVideoData
	ld hl, sp+$35
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, TypeNames
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $5
	call FarCopyVideoData
	pop hl
	ld a, l
	call GetSRAMBank
	ld c, $9
	ld e, $a
	ld hl, $a03
	call Func_30313
	ld de, Data_31935
	ld hl, $b04
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld de, Data_3193b
	ld hl, $b06
	call PlaceStringDEatCoordHL
	pop af
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	ld hl, Data_31940
	push hl
	call PlaceString
	pop bc
	pop bc
	ld de, Data_31945
	ld hl, $b08
	call PlaceStringDEatCoordHL
	pop af
	push af
	read_hl_from_sp_plus $36
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $1008
	call Func_2230
	ld e, $a
	ld a, $b
	call SetStringStartState
	ld hl, $7d
	push hl
	ld hl, $8c
	push hl
	ld hl, Data_3194c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop af
	read_hl_from_sp_plus $38
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $100a
	call Func_2230
	jp Func_31932

Func_31869: ; 31869 (c:5869)
	push hl
	ld hl, sp+$16
	call Func_241f
	pop hl
	ld a, l
	call GetSRAMBank
	ld c, $9
	ld e, $a
	ld hl, $a02
	call Func_30313
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $14
	ld hl, $a
	call Func_30313
	ld de, Data_31951
	ld hl, $b03
	call PlaceStringDEatCoordHL
	ld de, Data_31959
	ld hl, $b05
	call PlaceStringDEatCoordHL
	ld de, Data_31962
	ld hl, $b07
	call PlaceStringDEatCoordHL
	ld de, Data_3196a
	ld hl, $b09
	call PlaceStringDEatCoordHL
	ld hl, sp+$24
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $1003
	call Func_2230
	ld hl, sp+$25
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $1005
	call Func_2230
	ld hl, sp+$26
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $1007
	call Func_2230
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $f09
	call Func_2230
	ld hl, Data_3196f
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$1c
	ld a, [hl]
	cp $ff
	jp z, Func_31929
	cp $ee
	jp z, Func_3191d
	cp $dc
	jp nz, Func_31932
	ld de, Data_31971
	ld hl, $10b
	call PlaceStringDEatCoordHL
	jp Func_31932

Func_3191d: ; 3191d (c:591d)
	ld de, Data_3198b
	ld hl, $10b
	call PlaceStringDEatCoordHL
	jp Func_31932

Func_31929: ; 31929 (c:5929)
	ld de, Data_319a6
	ld hl, $10b
	call PlaceStringDEatCoordHL
Func_31932: ; 31932 (c:5932)
	add sp, $3e
	ret

Data_31935: ; 31935
	dstr "タイフﾟ:"

Data_3193b: ; 3193b
	dstr "RAM:"

Data_31940: ; 31940
	dstr " %dM"

Data_31945: ; 31945
	dstr "(いりょく)"

Data_3194c: ; 3194c
	dstr "%c%c"

Data_31951: ; 31951
	dstr "(こうけﾞき)"

Data_31959: ; 31959
	dstr "(ほﾞうきﾞょ)"

Data_31962: ; 31962
	dstr "(すはﾞやさ)"

Data_3196a: ; 3196a
	dstr "RAM:"

Data_3196f: ; 3196f
	dstr "M"

Data_31971: ; 31971
	dstr "(すへﾞての)アーム(そﾞくかﾞ そうひﾞかのう)"

Data_3198b: ; 3198b
	dstr "(すへﾞての)ムーフﾞ(そﾞくかﾞ そうひﾞかのう)"

Data_319a6: ; 319a6
	dstr "フﾞート(そﾞくいかﾞいかﾞ そうひﾞかのう)"

Func_319be: ; 319be (c:59be)
	ld a, l
	and h
	inc a
	jp z, Func_319ce
	ld e, l
	ld b, $4
	call RightShiftHL
	ld a, l
	call SetStringStartState
Func_319ce: ; 319ce (c:59ce)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_319f3
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31a97
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31a96

Func_319f3: ; 319f3 (c:59f3)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_31a18
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31aa2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31a96

Func_31a18: ; 31a18 (c:5a18)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $3e8
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_31a3d
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31aac
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31a96

Func_31a3d: ; 31a3d (c:5a3d)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_31a62
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31ab5
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31a96

Func_31a62: ; 31a62 (c:5a62)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, $1
	push hl
	ld hl, $86a0
	push hl
	call CompareStackLongs_Signed
	jp nc, Func_31a87
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31abd
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_31a96

Func_31a87: ; 31a87 (c:5a87)
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_31ac4
	push hl
	call PlaceString
.asm_31a91
	pop bc
	pop bc
	pop bc
Func_31a96: ; 31a96 (c:5a96)
	ret

Data_31a97: ; 31a97
	dstr "      %ldG"

Data_31aa2: ; 31aa2
	dstr "     %ldG"

Data_31aac: ; 31aac
	dstr "    %ldG"

Data_31ab5: ; 31ab5
	dstr "   %ldG"

Data_31abd: ; 31abd
	dstr "  %ldG"

Data_31ac4: ; 31ac4
	dstr " %ldG"

INCLUDE "engine/give_robot.asm"

Func_3202e: ; 3202e (c:602e)
	push af
	ld l, $0
Func_32031: ; 32031 (c:6031)
	ld a, l
	cp $8
	jp nc, Func_32055
	push hl
	xor a
Func_32039: ; 32039 (c:6039)
	ld hl, sp+$3
	cp [hl]
	jp nc, Func_32048
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_32039

Func_32048: ; 32048 (c:6048)
	pop hl
	push hl
	ld a, $7
	sub l
	call SetVolume
	pop hl
	inc l
	jp Func_32031

Func_32055: ; 32055 (c:6055)
	pop bc
	ret

Func_32057: ; 32057 (c:6057)
	push af
	xor a
Func_32059: ; 32059 (c:6059)
	cp $8
	jp nc, Func_32079
	push af
	xor a
Func_32060: ; 32060 (c:6060)
	ld hl, sp+$3
	cp [hl]
	jp nc, Func_3206f
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_32060

Func_3206f: ; 3206f (c:606f)
	pop af
	push af
	call SetVolume
	pop af
	inc a
	jp Func_32059

Func_32079: ; 32079 (c:6079)
	pop bc
	ret

Pointers_3207b: ; 3207b
	dw Data_3207f
	dw $0

Data_3207f: ; 3207f
	dstr "(その)ロホﾞホﾟン(は) (えらへﾞないよ)"

Pointers_32097: ; 32097
	dw Data_3209d
	dw Data_320ac
	dw $0

Data_3209d: ; 3209d
	dstr "リモコン(の しﾞゅしんに)"

Data_320ac: ; 320ac
	dstr "(しっはﾟいしました)"

Pointers_320b8: ; 320b8
	dw Data_320be
	dw Data_320cd
	dw $0

Data_320be: ; 320be
	dstr "リモコン(の しﾞゅしんに)"

Data_320cd: ; 320cd
	dstr "(せいこうしました)"

Func_320d8:: ; 320d8
	push af
	ld hl, -$94
	add hl, sp
	ld sp, hl
	ld hl, $95
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, Func_3214e
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
	jp nz, Func_3214e
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
	call Func_30313
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_3207b)
	ld de, Pointers_3207b
	ld hl, $10e
	call FarCall
	ld a, $ff
	jp Func_322a1

Func_3214e: ; 3214e (c:614e)
	ld a, $f
	call Func_3202e
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
	call Func_30313
	ld de, Data_322a7
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_1c11
	ld hl, sp+$2d
	reg16swap de, hl
	ld hl, $66
	call FarCall
	push af
	ld a, $f
	call Func_32057
	pop af
	cp $ff
	jp nz, Func_321ab
	ld a, $2
	jp Func_322a1

Func_321ab: ; 321ab (c:61ab)
	set_farcall_addrs_hli Func_1c27
	ld hl, sp+$2d
	reg16swap de, hl
	ld hl, sp+$23
	call FarCall
	ld c, h
	ld e, l
	ld a, e
	cp $2
	jp z, Func_321db
	ld a, e
	cp $3
	jp z, Func_321db
	ld a, e
	cp $4
	jp z, Func_321db
	ld a, e
	cp $6
	jp nz, Func_3222c
Func_321db: ; 321db (c:61db)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, Func_32227
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp z, Func_3220d
	ld hl, sp+$0
	ld a, [hl]
	cp $c
	jp z, Func_3220d
	ld hl, sp+$0
	ld a, [hl]
	cp $65
	jp z, Func_3220d
	ld hl, sp+$0
	ld a, [hl]
	cp $68
	jp z, Func_3220d
	ld hl, sp+$0
	ld a, [hl]
	cp $6b
	jp nz, Func_3221d
Func_3220d: ; 3220d (c:620d)
	ld a, e
	ld hl, sp+$23
	reg16swap de, hl
	ld hl, sp+$0
	ld c, [hl]
	call Func_324c1
	jp Func_32227

Func_3221d: ; 3221d (c:621d)
	ld a, e
	ld hl, sp+$23
	reg16swap de, hl
	call Func_322ce
Func_32227: ; 32227 (c:6227)
	ld e, $0
	jp Func_3222e

Func_3222c: ; 3222c (c:622c)
	ld e, $ff
Func_3222e: ; 3222e (c:622e)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	or a
	jp z, Func_32241
	ld hl, $95
	add hl, sp
	ld a, [hl]
	cp $2
	jp nz, Func_322a0
Func_32241: ; 32241 (c:6241)
	push de
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
	call Func_30313
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	pop de
	inc e
	dec e
	jp nz, Func_32293
	push de
	ld hl, $97
	add hl, sp
	ld a, [hl]
	or a
	jp nz, Func_3228f
	ld c, BANK(Pointers_320b8)
	ld de, Pointers_320b8
	ld hl, $10e
	call FarCall
Func_3228f: ; 3228f (c:628f)
	pop de
	jp Func_322a0

Func_32293: ; 32293 (c:6293)
	push de
	ld c, BANK(Pointers_32097)
	ld de, Pointers_32097
	ld hl, $10e
	call FarCall
	pop de
Func_322a0: ; 322a0 (c:62a0)
	ld a, e
Func_322a1: ; 322a1 (c:62a1)
	ld hl, $96
	add hl, sp
	ld sp, hl
	ret

Data_322a7: ; 322a7
	dstr "リモコン(の) ホﾞタン(を おしてね)"

Data_322bc: ; 322bc
	db $00, $01, $02, $03, $04, $05, $05, $04, $03, $02, $01, $00, $02, $03, $00, $04, $05, $01

Func_322ce: ; 322ce (c:62ce)
	push af
	add sp, -$26
	push de
IF DEF(STAR)
	inc c
	ld a, c
	cp $3
	jp c, .okay
	ld c, $0
.okay
ENDC
	push bc
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$4
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	xor a
	pop bc
	pop de
Func_322ed: ; 322ed (c:62ed)
	ld hl, sp+$27
	cp [hl]
	jp nc, Func_3248b
	push af
	push de
	push bc
	reg16swap de, hl
	ld a, [hl]
	ld hl, sp+$2a
	ld [hl], a
	ld hl, sp+$2a
	ld a, [hl]
	ld b, $64
	call DivideAbyB
	ld c, a
	push bc
	ld a, c
	add a
	add a
	ld d, a
	add a
	add a
	add a
	ld e, a
	add a
	add d
	add e
	ld e, a
	ld hl, sp+$2c
	ld a, [hl]
	sub e
	ld b, $a
	call DivideAbyB
	ld hl, sp+$2b
	ld [hl], a
	pop bc
	ld hl, sp+$29
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld l, a
	ld a, c
	add a
	add a
	ld d, a
	add a
	add a
	add a
	ld e, a
	add a
	add d
	add e
	add l
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	sub e
	ld e, a
	ld hl, sp+$29
	ld a, [hl]
	add c
	add e
	ld hl, sp+$2a
	ld [hl], a
	pop bc
	pop de
	pop af
	push bc
	push af
	push de
	ld l, c
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_322bc
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	cp $5
	jp z, Func_3243c
	cp $4
	jp z, Func_32416
	cp $3
	jp z, Func_323f0
	cp $2
	jp z, Func_323c7
	cp $1
	jp z, Func_323a1
	or a
	jp nz, Func_32483
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $1f
	add hl, bc
	write_hl_to_sp_plus $1f
	read_hl_from_sp_plus $1f
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_3239e
	ld hl, 999
	write_hl_to_sp_plus $1f
Func_3239e: ; 3239e (c:639e)
	jp Func_32483

Func_323a1: ; 323a1 (c:63a1)
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $21
	add hl, bc
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $21
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_323c7
	ld hl, 999
	write_hl_to_sp_plus $21
Func_323c7: ; 323c7 (c:63c7)
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $23
	add hl, bc
	write_hl_to_sp_plus $23
	read_hl_from_sp_plus $23
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_323ed
	ld hl, 999
	write_hl_to_sp_plus $23
Func_323ed: ; 323ed (c:63ed)
	jp Func_32483

Func_323f0: ; 323f0 (c:63f0)
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $16
	add hl, bc
	write_hl_to_sp_plus $16
	read_hl_from_sp_plus $16
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_32416
	ld hl, 999
	write_hl_to_sp_plus $16
Func_32416: ; 32416 (c:6416)
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $1a
	add hl, bc
	write_hl_to_sp_plus $1a
	read_hl_from_sp_plus $1a
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_3243c
	ld hl, 999
	write_hl_to_sp_plus $1a
Func_3243c: ; 3243c (c:643c)
	ld hl, sp+$2a
	ld a, [hl]
	cp $c
	jp c, Func_3245d
	ld hl, sp+$2a
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	push bc
	ld hl, sp+$2c
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	pop bc
	add b
	ld hl, sp+$2a
	ld [hl], a
	jp Func_32460

Func_3245d: ; 3245d (c:645d)
	jp Func_32463

Func_32460: ; 32460 (c:6460)
	jp Func_3243c

Func_32463: ; 32463 (c:6463)
	read_hl_from_sp_plus $28
	ld a, l
	and $f0
	ld l, a
	write_hl_to_sp_plus $28
	ld hl, sp+$2a
	ld c, [hl]
	ld b, $0
	inc bc
	read_hl_from_sp_plus $28
	ld a, l
	or c
	ld l, a
	ld a, h
	or b
	ld h, a
	write_hl_to_sp_plus $28
Func_32483: ; 32483 (c:6483)
	pop de
	inc de
	pop af
	inc a
	pop bc
	jp Func_322ed

Func_3248b: ; 3248b (c:648b)
	ld hl, sp+$1f
	ld a, [hl]
	or $2
	ld hl, sp+$1f
	ld [hl], a
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$0
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	add sp, $28
	ret

Data_324ad: ; 324ad
	db GRAMPS
	db DOLLBY
	db SAMMI
	db Q_
	db MEDBOT
	db TOONA
	db LEACHY
	db RAZOR
	db ORBIT
	db WOODY

Data_324b7: ; 324b7
	db CARD
	db UNIBOT
	db REX
	db VIRUS
	db BOOM
	db PALMER
	db ZAPPA
	db PAWS
	db STINKY
	db DETNO

Func_324c1: ; 324c1 (c:64c1)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	push hl
	push bc
	push de
	ld hl, $0
	write_hl_to_sp_plus $10
	xor a
	pop de
Func_324d3: ; 324d3 (c:64d3)
	ld hl, sp+$f
	cp [hl]
	jp nc, Func_324f5
	push af
	push de
	reg16swap de, hl
	ld a, [hl]
	ld l, a
	ld h, $0
	ld c, l
	ld b, h
	read_hl_from_sp_plus $12
	add hl, bc
	write_hl_to_sp_plus $12
	pop de
	inc de
	pop af
	inc a
	jp Func_324d3

Func_324f5: ; 324f5 (c:64f5)
	read_hl_from_sp_plus $e
	ld de, $3e8
	call DivideHLByDESigned
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $c
	ld de, $3e8
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $64
	call DivideHLByDESigned
	call WriteHLToSPPlus10
	call GetHLAtSPPlus10
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
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $a
	call DivideHLByDESigned
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	pop de
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $e
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_3258d
	jp Func_32590

Func_3258d: ; 3258d (c:658d)
	jp Func_324f5

Func_32590: ; 32590 (c:6590)
	pop bc
	pop hl
	ld a, c
	cp $68
	jp z, Func_325c6
	cp $65
	jp z, Func_325bb
	cp $6b
	jp z, Func_325b6
	cp $c
	jp z, Func_325b1
	cp $9
	jp nz, Func_325ce
	ld l, $a
	jp Func_325ce

Func_325b1: ; 325b1 (c:65b1)
	ld l, $d
	jp Func_325ce

Func_325b6: ; 325b6 (c:65b6)
	ld l, $97
	jp Func_325ce

Func_325bb: ; 325bb (c:65bb)
	call GetHLAtSPPlus10
	ld de, Data_324ad
	add hl, de
	ld l, [hl]
	jp Func_325ce

Func_325c6: ; 325c6 (c:65c6)
	call GetHLAtSPPlus10
	ld de, Data_324b7
	add hl, de
	ld l, [hl]
Func_325ce: ; 325ce (c:65ce)
	ld a, l
	call Func_325d5
	add sp, $c
	ret

Func_325d5: ; 325d5 (c:65d5)
	add sp, -$52
	push af
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$31
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$31
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$53
	ld e, [hl]
	push de
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$3a
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
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
	read_hl_from_sp_plus $24
	push hl
	read_hl_from_sp_plus $49
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $47
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
	read_hl_from_sp_plus $2d
	push hl
	read_hl_from_sp_plus $52
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $50
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
	pop de
	pop af
	push de
	push af
	ld e, a
	dec e
	ld hl, sp+$4
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli Func_4f8ec
	pop af
	push af
	ld e, a
	dec e
	ld hl, sp+$33
	ld a, [hl]
	dec a
	call FarCall
	read_hl_from wc2f2
	ld a, l
	or h
	jp z, Func_326a5
	call Func_2009
	call Func_1fbe
Func_326a5: ; 326a5 (c:66a5)
	set_farcall_addrs_hli Func_53a0d
	pop af
	push af
	ld e, $1
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	pop af
	push af
	ld e, $0
	call FarCall
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$3a
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$52
	ld a, [hl]
	and $1
	jp nz, Func_326fe
	ld c, $0
Func_326e6: ; 326e6 (c:66e6)
	ld a, c
	cp $6
	jp nc, Func_326fe
	ld e, c
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld [hl], a
	inc c
	jp Func_326e6

Func_326fe: ; 326fe (c:66fe)
	pop af
	ld hl, sp+$31
	ld [hl], a
	read_hl_from_sp_plus $1e
	push hl
	read_hl_from_sp_plus $43
	pop de
	add hl, de
	write_hl_to_sp_plus $41
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $47
	pop de
	add hl, de
	write_hl_to_sp_plus $45
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	add hl, de
	write_hl_to_sp_plus $4a
	read_hl_from_sp_plus $2b
	push hl
	read_hl_from_sp_plus $50
	pop de
	add hl, de
	write_hl_to_sp_plus $4e
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	add hl, de
	write_hl_to_sp_plus $4c
	ld hl, $0
	write_hl_to_sp_plus $50
	pop de
	ld hl, sp+$51
	ld [hl], e
	read_hl_from_sp_plus $3f
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_32770
	ld hl, 999
	write_hl_to_sp_plus $3f
Func_32770: ; 32770 (c:6770)
	read_hl_from_sp_plus $43
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_32788
	ld hl, 999
	write_hl_to_sp_plus $43
Func_32788: ; 32788 (c:6788)
	read_hl_from_sp_plus $3d
	push hl
	read_hl_from_sp_plus $41
	pop de
	call CompareHLtoDE
	jp nc, Func_327a0
	read_hl_from_sp_plus $3f
	write_hl_to_sp_plus $3d
Func_327a0: ; 327a0 (c:67a0)
	read_hl_from_sp_plus $41
	push hl
	read_hl_from_sp_plus $45
	pop de
	call CompareHLtoDE
	jp nc, Func_327b8
	read_hl_from_sp_plus $43
	write_hl_to_sp_plus $41
Func_327b8: ; 327b8 (c:67b8)
	read_hl_from_sp_plus $48
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_327d0
	ld hl, 999
	write_hl_to_sp_plus $48
Func_327d0: ; 327d0 (c:67d0)
	read_hl_from_sp_plus $4a
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_327e8
	ld hl, 999
	write_hl_to_sp_plus $4a
Func_327e8: ; 327e8 (c:67e8)
	read_hl_from_sp_plus $4c
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_32800
	ld hl, 999
	write_hl_to_sp_plus $4c
Func_32800: ; 32800 (c:6800)
	ld hl, sp+$4e
	ld a, [hl]
	or $2
	ld hl, sp+$4e
	ld [hl], a
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	add sp, $52
	ret

Func_32822: ; 32822 (c:6822)
	push hl
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld e, a
	pop af
	pop hl
	push de
	cp $2
	jp z, Func_32886
	cp $1
	jp z, Func_3284e
	or a
	jp nz, Func_328bb
	ld l, $0
	jp Func_328bb

Func_3284e: ; 3284e (c:684e)
	ld a, [wc9a2]
	cp $14
	jp nz, Func_32881
	ld c, $0
Func_32858: ; 32858 (c:6858)
	ld a, c
	cp $fa
	jp nc, Func_32871
	ld e, c
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_3286d
	jp Func_32871

Func_3286d: ; 3286d (c:686d)
	inc c
	jp Func_32858

Func_32871: ; 32871 (c:6871)
	ld a, c
	cp $fa
	jp nz, Func_3287c
	ld l, $1
	jp Func_3287e

Func_3287c: ; 3287c (c:687c)
	ld l, $0
Func_3287e: ; 3287e (c:687e)
	jp Func_32883

Func_32881: ; 32881 (c:6881)
	ld l, $0
Func_32883: ; 32883 (c:6883)
	jp Func_328bb

Func_32886: ; 32886 (c:6886)
	ld a, [wc9b7]
	cp $14
	jp nz, Func_328b9
	ld c, $0
Func_32890: ; 32890 (c:6890)
	ld a, c
	cp $dc
	jp nc, Func_328a9
	ld e, c
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_328a5
	jp Func_328a9

Func_328a5: ; 328a5 (c:68a5)
	inc c
	jp Func_32890

Func_328a9: ; 328a9 (c:68a9)
	ld a, c
	cp $dc
	jp nz, Func_328b4
	ld l, $1
	jp Func_328b6

Func_328b4: ; 328b4 (c:68b4)
	ld l, $0
Func_328b6: ; 328b6 (c:68b6)
	jp Func_328bb

Func_328b9: ; 328b9 (c:68b9)
	ld l, $0
Func_328bb: ; 328bb (c:68bb)
	pop de
	push hl
	ld a, e
	call GetSRAMBank
	pop hl
	ld a, l
	ret

Func_328c4: ; 328c4 (c:68c4)
	push af
	add sp, -$1a
	push de
	ld hl, sp+$19
	ld [hl], $ff
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	pop de
	push af
	inc e
	dec e
	jp nz, Func_3297b
	ld c, $0
Func_328e8: ; 328e8 (c:68e8)
	ld a, c
	ld hl, wSaveScratchca6c
	cp [hl]
	jp nc, Func_32916
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld hl, sp+$1d
	cp [hl]
	jp nz, Func_32912
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, $63
	sub [hl]
	ld hl, sp+$1a
	ld [hl], a
	ld hl, sp+$19
	ld [hl], $0
	jp Func_32916

Func_32912: ; 32912 (c:6912)
	inc c
	jp Func_328e8

Func_32916: ; 32916 (c:6916)
	ld hl, sp+$19
	ld a, [hl]
	cp $ff
	jp nz, Func_3292e
	ld a, [wSaveScratchca6c]
	cp $14
	jp nc, Func_3292e
	ld hl, sp+$1a
	ld [hl], $63
	ld hl, sp+$19
	ld [hl], $0
Func_3292e: ; 3292e (c:692e)
	ld hl, sp+$19
	ld a, [hl]
	cp $ff
	jp nz, Func_3296c
	ld a, $3
	call GetSRAMBank
	ld c, $0
Func_3293d: ; 3293d (c:693d)
	ld a, c
	cp $50
	jp nc, Func_3296c
	ld hl, sp+$1d
	ld a, [hl]
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	cp [hl]
	jp nz, Func_32968
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, $63
	sub [hl]
	ld hl, sp+$1a
	ld [hl], a
	ld hl, sp+$19
	ld [hl], $0
	jp Func_3296c

Func_32968: ; 32968 (c:6968)
	inc c
	jp Func_3293d

Func_3296c: ; 3296c (c:696c)
	ld hl, sp+$19
	ld a, [hl]
	cp $ff
	jp nz, Func_32978
	ld hl, sp+$1a
	ld [hl], $63
Func_32978: ; 32978 (c:6978)
	jp Func_32a2d

Func_3297b: ; 3297b (c:697b)
	ld hl, sp+$1a
	ld [hl], $63
	ld hl, sp+$13
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, sp+$1d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $57b8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $d
	call FarCopyVideoData
	ld a, [wc38d]
	cp $1
	jp nz, Func_329c5
	read_hl_from_sp_plus $f
	ld de, $2
	call DivideHLByDESigned
	write_hl_to_sp_plus $19
	jp Func_329e1

Func_329c5: ; 329c5 (c:69c5)
	ld a, [wc38d]
	cp $2
	jp nz, Func_329d9
	read_hl_from_sp_plus $f
	add hl, hl
	write_hl_to_sp_plus $19
	jp Func_329e1

Func_329d9: ; 329d9 (c:69d9)
	read_hl_from_sp_plus $f
	write_hl_to_sp_plus $19
Func_329e1: ; 329e1 (c:69e1)
	ld hl, sp+$13
	call PutLongFromHLOnStack
	read_hl_from_sp_plus $1d
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_329f4
	dec bc
.asm_329f4
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call MultiplyLongsFromStack
	call StackDivideLongSigned
	ld hl, sp+$13
	call PutLongFromStackToHL
	ld hl, $0
	push hl
	ld hl, $63
	push hl
	ld hl, sp+$13
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_32a23
	ld hl, sp+$1a
	ld [hl], $63
	jp Func_32a2d

Func_32a23: ; 32a23 (c:6a23)
	ld hl, sp+$f
	call PutLongFromHLOnStack
	pop de
	pop af
	ld hl, sp+$1a
	ld [hl], e
Func_32a2d: ; 32a2d (c:6a2d)
	pop af
	call GetSRAMBank
	ld hl, sp+$18
	ld a, [hl]
	add sp, $1c
	ret

Func_32a37: ; 32a37
	push hl
	add sp, -$16
	read_hl_from_sp_plus $18
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
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ShopItems
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	push bc
	ld a, c
	ld hl, sp+$2
	reg16swap de, hl
	call GetItemAttributes2
	ld l, $10
	push hl
	ld c, $14
	ld e, $2
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	push bc
	ld a, c
	inc a
	ld e, $0
	call Func_328c4
	ld l, a
	pop bc
	push bc
	push hl
	ld a, c
	inc a
	ld e, $1
	call Func_328c4
	pop hl
	pop bc
	inc l
	dec l
	jp nz, Func_32aa5
	ld a, $1
	call Func_3304d
	ld hl, $8000
	jp Func_32c1c

Func_32aa5: ; 32aa5 (c:6aa5)
	or a
	jp nz, Func_32ab3
	xor a
	call Func_3304d
	ld hl, -1
	jp Func_32c1c

Func_32ab3: ; 32ab3 (c:6ab3)
	push bc
	cp l
	jp nc, Func_32abe
	ld [wc2f6], a
	jp Func_32ac2

Func_32abe: ; 32abe (c:6abe)
	ld a, l
	ld [wc2f6], a
Func_32ac2: ; 32ac2 (c:6ac2)
	set_farcall_addrs_hli Func_14db8
	read_hl_from_sp_plus $1a
	call FarCall
	pop bc
	ld a, [wc2f6]
	cp $ff
	jp z, Func_32ae4
	ld a, [wc2f6]
	or a
	jp nz, Func_32aea
Func_32ae4: ; 32ae4 (c:6ae4)
	ld hl, $8000
	jp Func_32c1c

Func_32aea: ; 32aea (c:6aea)
	push bc
	read_hl_from_sp_plus $f
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_32af9
	dec bc
.asm_32af9
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $a
	push hl
	call MultiplyLongsFromStack
	ld hl, wc2f6
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_32b16
	dec bc
.asm_32b16
	push bc
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$17
	call PutLongFromStackToHL
	ld a, [wc38d]
	cp $1
	jp nz, Func_32b38
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$17
	call DivideLongSigned
	jp Func_32b4d

Func_32b38: ; 32b38 (c:6b38)
	ld a, [wc38d]
	cp $2
	jp nz, Func_32b4d
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$17
	call MultiplyLongs
Func_32b4d: ; 32b4d (c:6b4d)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld hl, sp+$13
	call PutLongFromHLOnStack
	xor a
	call Func_314da
	pop bc
	pop bc
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	pop bc
	ld a, l
	or h
	jp nz, Func_32c0e
	push bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_5a0e0
	pop bc
	ld a, [wc2f6]
	ld e, a
	ld a, c
	inc a
	ld c, $0
	call FarCall
	push hl
	push hl
	ld hl, sp+$15
	call PutLongFromHLOnStack
	ld hl, -1
	push hl
	ld hl, -1
	push hl
	call MultiplyLongsFromStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$11
	call PutLongFromStackToHL
	ld e, $1
	ld a, $6
	call SetStringStartState
	ld hl, Data_32c27
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$d
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_319be
	pop bc
	pop bc
	ld l, $2
	push hl
	ld c, $e
	ld e, $1
	ld a, $6
	call DoublePushBGMapRegion
	pop bc
	ld a, $2
	call Func_3304d
	jp Func_32c0f

Func_32c0e: ; 32c0e (c:6c0e)
	xor a
Func_32c0f: ; 32c0f (c:6c0f)
	or a
	jp nz, Func_32c19
	ld hl, $8000
	jp Func_32c1c

Func_32c19: ; 32c19 (c:6c19)
	ld hl, -1
Func_32c1c: ; 32c1c (c:6c1c)
	reg16swap de, hl
	add sp, $18
	reg16swap de, hl
	ret

Data_32c27: ; 32c27
	dstr "(しょしﾞきん)"

Func_32c30: ; 32c30
	push hl
	add sp, -$32
	ld hl, sp+$32
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
	ld a, l
	ld hl, sp+$32
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld hl, sp+$31
	ld [hl], a
	ld hl, sp+$31
	ld a, [hl]
	cp $34
	jp nz, Func_32c7d
	ld hl, sp+$32
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_301bd
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld hl, sp+$33
	ld [hl], a
	jp Func_32c96

Func_32c7d: ; 32c7d (c:6c7d)
	ld hl, sp+$32
	ld c, [hl]
	ld b, $0
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_30223
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$33
	ld [hl], e
Func_32c96: ; 32c96 (c:6c96)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$2b
	reg16swap de, hl
	ld hl, wSaveScratchMoney
	ld bc, $4
	call MemCopy
	ld hl, sp+$33
	ld a, [hl]
	cp $34
	jp nz, Func_32ce3
	ld hl, sp+$35
	ld a, [hl]
	and $3f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $4093
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1a
	ld bc, $11
	call FarCopyVideoData
	jp Func_32ceb

Func_32ce3: ; 32ce3 (c:6ce3)
	ld hl, sp+$35
	ld e, [hl]
	ld hl, sp+$2
	call Func_241f
Func_32ceb: ; 32ceb (c:6ceb)
	pop af
	call GetSRAMBank
	ld l, $10
	push hl
	ld c, $14
	ld e, $2
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, sp+$31
	ld a, [hl]
	cp $34
	jp nz, Func_32d3f
	read_hl_from_sp_plus $28
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_32d11
	dec bc
.asm_32d11
	push bc
	push hl
	ld hl, sp+$37
	ld l, [hl]
	ld h, $0
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_32d22
	dec bc
.asm_32d22
	push bc
	push hl
	ld b, $6
	call RightShiftLongFromStack
	ld hl, $0
	push hl
	ld hl, $1
	push hl
	call AddLongsFromStack
	call MultiplyLongsFromStack
	ld hl, sp+$31
	call PutLongFromStackToHL
	jp Func_32d5f

Func_32d3f: ; 32d3f (c:6d3f)
	read_hl_from_sp_plus $17
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_32d4d
	dec bc
.asm_32d4d
	push bc
	push hl
	ld hl, $0
	push hl
	ld hl, $64
	push hl
	call MultiplyLongsFromStack
	ld hl, sp+$31
	call PutLongFromStackToHL
Func_32d5f: ; 32d5f (c:6d5f)
	ld a, [wc38d]
	cp $1
	jp nz, Func_32d77
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$31
	call DivideLongSigned
	jp Func_32d8c

Func_32d77: ; 32d77 (c:6d77)
	ld a, [wc38d]
	cp $2
	jp nz, Func_32d8c
	ld hl, $0
	push hl
	ld hl, $2
	push hl
	ld hl, sp+$31
	call MultiplyLongs
Func_32d8c: ; 32d8c (c:6d8c)
	ld hl, sp+$29
	call PutLongFromHLOnStack
	ld hl, sp+$31
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp nc, Func_32da6
	xor a
	call Func_3304d
	ld hl, $8000
	jp Func_32f6f

Func_32da6: ; 32da6 (c:6da6)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld hl, sp+$2d
	call PutLongFromHLOnStack
	xor a
	call Func_314da
	pop bc
	pop bc
	ld hl, sp+$31
	ld a, [hl]
	cp $34
	jp nz, Func_32df4
	set_farcall_addrs_hli malloc
	ld hl, $b4
	call FarCall
	reg16swap de, hl
	push de
	push de
	ld l, $9
	push hl
	ld c, $a
	ld e, $3
	ld a, $a
	call Func_30289
	pop bc
	pop bc
	ld hl, sp+$35
	ld e, [hl]
	ld a, $1
	call Func_3175f
	pop de
	jp Func_32e21

Func_32df4: ; 32df4 (c:6df4)
	set_farcall_addrs_hli malloc
	ld hl, $1b8
	call FarCall
	reg16swap de, hl
	push de
	push de
	ld l, $b
	push hl
	ld c, $14
	ld e, $2
	xor a
	call Func_30289
	pop bc
	pop bc
	ld hl, sp+$35
	ld e, [hl]
	ld a, $2
	call Func_3175f
	pop de
Func_32e21: ; 32e21 (c:6e21)
	push de
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $10
	push hl
	ld c, $14
	ld e, $2
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_1482e
	pop de
	push hl
	ld hl, sp+$33
	ld a, [hl]
	cp $34
	jp nz, Func_32e5f
	push de
	push de
	ld l, $9
	push hl
	ld c, $a
	ld e, $3
	ld a, $a
	call Func_302ce
	pop bc
	pop bc
	pop de
	jp Func_32e6f

Func_32e5f: ; 32e5f (c:6e5f)
	push de
	push de
	ld l, $b
	push hl
	ld c, $14
	ld e, $2
	xor a
	call Func_302ce
	pop bc
	pop bc
	pop de
Func_32e6f: ; 32e6f (c:6e6f)
	push de
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $10
	push hl
	ld c, $14
	ld e, $2
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop hl
	ld a, l
	or h
	jp nz, Func_32f61
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, sp+$31
	ld a, [hl]
	cp $34
	jp nz, Func_32ed2
	set_farcall_addrs_hli Func_4ed5d
	ld e, $0
	ld hl, sp+$33
	ld a, [hl]
	inc a
	call FarCall
	ld e, $0
	ld a, $1
	call Func_32822
	jp Func_32eec

Func_32ed2: ; 32ed2 (c:6ed2)
	set_farcall_addrs_hli Func_6af0d
	ld e, $0
	ld hl, sp+$33
	ld a, [hl]
	call FarCall
	ld e, $0
	ld a, $2
	call Func_32822
Func_32eec: ; 32eec (c:6eec)
	push af
	push hl
	push hl
	ld hl, sp+$33
	call PutLongFromHLOnStack
	ld hl, -1
	push hl
	ld hl, -1
	push hl
	call MultiplyLongsFromStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$2f
	call PutLongFromStackToHL
	ld e, $1
	ld a, $6
	call SetStringStartState
	ld hl, Data_32f7a
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$2b
	call PutLongFromHLOnStack
	ld hl, -1
	call Func_319be
	pop bc
	pop bc
	ld l, $2
	push hl
	ld c, $e
	ld e, $1
	ld a, $6
	call DoublePushBGMapRegion
	pop bc
	pop af
	cp $1
	jp nz, Func_32f58
	ld a, $8
	call Func_3304d
	ld a, $1
	call Func_3304d
	ld a, $1
	jp Func_32f5e

Func_32f58: ; 32f58 (c:6f58)
	ld a, $2
	call Func_3304d
	xor a
Func_32f5e: ; 32f5e (c:6f5e)
	jp Func_32f62

Func_32f61: ; 32f61 (c:6f61)
	xor a
Func_32f62: ; 32f62 (c:6f62)
	or a
	jp nz, Func_32f6c
	ld hl, $8000
	jp Func_32f6f

Func_32f6c: ; 32f6c (c:6f6c)
	ld hl, -1
Func_32f6f: ; 32f6f (c:6f6f)
	reg16swap de, hl
	add sp, $34
	reg16swap de, hl
	ret

Data_32f7a: ; 32f7a
	dstr "(しょしﾞきん)"

Pointers_32f83: ; 32f83
	dw Data_32f87
	dw $0

Data_32f87: ; 32f87
	dstr "(おかねかﾞたりないよ)"

Pointers_32f94: ; 32f94
	dw Data_32f98
	dw $0

Data_32f98: ; 32f98
	dstr "(これいしﾞょう かえないよ)"

Pointers_32fa8: ; 32fa8
	dw Data_32fac
	dw $0

Data_32fac: ; 32fac
	dstr "(とﾞうもありかﾞとう)"

Pointers_32fb9: ; 32fb9
	dw Data_32fbf
	dw Data_32fcc
	dw $0

Data_32fbf: ; 32fbf
	dstr "(とﾞうもありかﾞとう)"

Data_32fcc: ; 32fcc
	dstr "(ほかにも かうかい)?"

Pointers_32fd9: ; 32fd9
	dw Data_32fdd
	dw $0

Data_32fdd: ; 32fdd
	dstr "(ほかのものは かうかい)?"

Pointers_32fec: ; 32fec
	dw Data_32ff2
	dw Data_32fff
	dw $0

Data_32ff2: ; 32ff2
	dstr "(とﾞうもありかﾞとう)"

Data_32fff: ; 32fff
	dstr "(ほかにも うるかい)?"

Pointers_3300c: ; 3300c
	dw Data_33010
	dw $0

Data_33010: ; 33010
	dstr "(ほかのものは うるかい)?"

Pointers_3301f: ; 3301f
	dw Data_33025
	dw Data_33032
	dw $0

Data_33025: ; 33025
	dstr "(とﾞうもありかﾞとう)"

Data_33032: ; 33032
	dstr "(またきてね)"

Pointers_3303a: ; 3303a
	dw Data_3303e
	dw $0

Data_3303e: ; 3303e
	dstr "(それは うっちゃたﾞめ)!"

Func_3304d: ; 3304d (c:704d)
	push hl
	push af
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	pop af
	pop hl
	cp $8
	jp z, Func_33116
	cp $7
	jp z, Func_33107
	cp $6
	jp z, Func_330f8
	cp $5
	jp z, Func_330e9
	cp $4
	jp z, Func_330da
	cp $3
	jp z, Func_330cb
	cp $2
	jp z, Func_330bc
	cp $1
	jp z, Func_330ad
	or a
	jp nz, Func_33122
	ld c, BANK(Pointers_32f83)
	ld de, Pointers_32f83
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330ad: ; 330ad (c:70ad)
	ld c, BANK(Pointers_32f94)
	ld de, Pointers_32f94
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330bc: ; 330bc (c:70bc)
	ld c, BANK(Pointers_32fb9)
	ld de, Pointers_32fb9
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330cb: ; 330cb (c:70cb)
	ld c, BANK(Pointers_32fd9)
	ld de, Pointers_32fd9
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330da: ; 330da (c:70da)
	ld c, BANK(Pointers_32fec)
	ld de, Pointers_32fec
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330e9: ; 330e9 (c:70e9)
	ld c, BANK(Pointers_3300c)
	ld de, Pointers_3300c
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_330f8: ; 330f8 (c:70f8)
	ld c, BANK(Pointers_3301f)
	ld de, Pointers_3301f
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_33107: ; 33107 (c:7107)
	ld c, BANK(Pointers_3303a)
	ld de, Pointers_3303a
	ld hl, $10e
	call FarCall
	ld l, a
	jp Func_33122

Func_33116: ; 33116 (c:7116)
	ld c, BANK(Pointers_32fa8)
	ld de, Pointers_32fa8
	ld hl, $10e
	call FarCall
	ld l, a
Func_33122: ; 33122 (c:7122)
	ld a, l
	and $10
	jp z, Func_3312c
	xor a
	jp Func_3312e

Func_3312c: ; 3312c (c:712c)
	ld a, $1
Func_3312e: ; 3312e (c:712e)
	ret

Func_3312f: ; 3312f (c:712f)
	set_farcall_addrs_hli malloc
	ld hl, $c8
	call FarCall
	push hl
	push hl
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_30289
	pop bc
	pop bc
	callba_hli AskRepairRobots
	pop hl
	push hl
	push hl
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_302ce
	pop bc
	pop bc
	ld a, $2
	ld [wEnableAttrMapTransfer], a
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
	ret

Func_3318e: ; 3318e (c:718e)
	push af
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_331a2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_331b6
Func_331a2: ; 331a2 (c:71a2)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_331b6: ; 331b6 (c:71b6)
	call Func_1fbe
	callba_hli Func_17470
	pop af
	cp $3
	jp nz, Func_331e6
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58c3a)
	ld de, Data_58c3a
	ld hl, Data_58c01
	call FarCall
	jp Func_331fc

Func_331e6: ; 331e6 (c:71e6)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58c96)
	ld de, Data_58c96
	ld hl, Data_58c49
	call FarCall
Func_331fc: ; 331fc (c:71fc)
	call FillVisibleAreaWithBlankTile
	call Func_2009
	callba_hli Func_17488
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_3321d: ; 3321d (c:721d)
	or a
	jp nz, Func_33294
	set_farcall_addrs_hli malloc
	ld hl, $208
	call FarCall
	push hl
	push hl
	ld l, $d
	push hl
	ld c, $14
	ld e, $2
	xor a
	call Func_30289
	pop bc
	pop bc
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_30020)
	ld de, Data_30020
	ld hl, Data_30001
	call FarCall
	pop hl
	push hl
	push hl
	ld l, $d
	push hl
	ld c, $14
	ld e, $2
	xor a
	call Func_302ce
	pop bc
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	ld a, $2
	ld [wEnableAttrMapTransfer], a
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
	jp Func_332aa

Func_33294: ; 33294 (c:7294)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_3004e)
	ld de, Data_3004e
	ld hl, Data_3002f
	call FarCall
Func_332aa: ; 332aa (c:72aa)
	ret

Func_332ab: ; 332ab (c:72ab)
	push af
	ld a, BANK(GFX_4aa2)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4aa2
	ld hl, $88e0
	call FarRequestVideoData
	ld bc, $10
	ld de, GFX_4ab2
	ld hl, $88c0
	call FarRequestVideoData
	ld bc, $10
	ld de, GFX_4a92
	ld hl, $97d0
	call FarRequestVideoData
	call Func_1fbe
	pop af
	or a
	jp nz, Func_332f6
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_3007c)
	ld de, Data_3007c
	ld hl, Data_3005d
	call FarCall
	jp Func_3330c

Func_332f6: ; 332f6 (c:72f6)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_300aa)
	ld de, Data_300aa
	ld hl, Data_3008b
	call FarCall
Func_3330c: ; 3330c (c:730c)
	call Func_2009
	ld a, BANK(GFX_4a02)
	ld [wFarCallDestBank], a
	ld bc, $10
	ld de, GFX_4a02
	ld hl, $88e0
	call FarRequestVideoData
	ld bc, $10
	ld de, GFX_49e2
	ld hl, $88c0
	call FarRequestVideoData
	ld bc, $10
	ld de, GFX_48f2
	ld hl, $97d0
	call FarRequestVideoData
	ret

Func_33339: ; 33339 (c:7339)
	push af
	call Func_1fbe
	pop af
	or a
	jp nz, Func_3335b
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_300d8)
	ld de, Data_300d8
	ld hl, Data_300b9
	call FarCall
	jp Func_33371

Func_3335b: ; 3335b (c:735b)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_30106)
	ld de, Data_30106
	ld hl, Data_300e7
	call FarCall
Func_33371: ; 33371 (c:7371)
	call Func_2009
	ret

Func_33375:: ; 33375
	ld c, $4
	ld e, $c
	ld hl, $0
	call Func_30313
	ld c, $5
	ld e, $c
	ld hl, $4
	call Func_30313
	ld c, $4
	ld e, $8
	ld hl, $c09
	call Func_30313
	ld de, Data_333a6
	ld hl, $101
	call PlaceStringDEatCoordHL
	ld de, Data_333b3
	ld hl, $d0a
	call PlaceStringDEatCoordHL
	ret

Data_333a6: ; 333a6
	dstr "(ひつよう)エネルキﾞー"

Data_333b3: ; 333b3
	dstr "エネルキﾞー"

Func_333ba:: ; 333ba
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld c, a
	pop af
	ld hl, wCurShop
	ld l, [hl]
	ld h, $0
	ld de, wcb33
	add hl, de
	ld [hl], a
	ld a, c
	call GetSRAMBank
	ret

Func_333e0:: ; 333e0
	add sp, -$4e
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	ld de, $1d
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push bc
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$4
	call GetRobotOrTrainerBaseStats
	call GetHLAtSPPlus9
	reg16swap de, hl
	pop hl
	push de
	push hl
	ld hl, sp+$8
	ld a, [hl]
	cp $1
	jp c, Func_3345e
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$35
	push hl
	ld l, a
	ld h, $0
	ld de, $5ff
	add hl, de
	pop de
	ld c, $6
	call FarCall
Func_3345e: ; 3345e (c:745e)
	pop hl
	ld a, l
	call GetSRAMBank
	ld c, $5
	ld e, $c
	ld hl, $4
	call Func_30313
	pop de
	pop bc
	push bc
	ld l, c
	ld h, b
	call CompareHLtoDE
	jp c, Func_334af
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_334af
	push de
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$33
	ld c, l
	ld b, h
	ld de, $5
	ld hl, $1
	call FarCall
	ld hl, Data_334ee
	push hl
	call PlaceString
	pop bc
	ld de, Data_334f0
	ld hl, $207
	call PlaceStringDEatCoordHL
	pop de
	jp Func_334d6

Func_334af: ; 334af (c:74af)
	ld a, e
	or d
	jp nz, Func_334c2
	push de
	ld de, Data_334fa
	ld hl, $106
	call PlaceStringDEatCoordHL
	pop de
	jp Func_334d6

Func_334c2: ; 334c2 (c:74c2)
	push de
	ld de, Data_33507
	ld hl, $105
	call PlaceStringDEatCoordHL
	ld de, Data_33517
	ld hl, $107
	call PlaceStringDEatCoordHL
	pop de
Func_334d6: ; 334d6 (c:74d6)
	pop bc
	push de
	ld de, $3
	ld hl, $100b
	call Func_2230
	pop bc
	ld de, $3
	ld hl, $702
	call Func_2230
	add sp, $4e
	ret

Data_334ee: ; 334ee
	dstr "ヘ"

Data_334f0: ; 334f0
	dstr "(しんか かのう)"

Data_334fa: ; 334fa
	dstr "(しんか てﾞきないよ)"

Data_33507: ; 33507
	dstr "エネルキﾞー (ふﾞそくてﾞ)"

Data_33517: ; 33517
	dstr "(しんか てﾞきないよ)"

Func_33524:: ; 33524
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
	cp $1
	jp z, Func_33555
	or a
	jp nz, Func_3356b
	callba_hli Func_59087
	ld l, a
	ld h, $0
	jp Func_3356b

Func_33555: ; 33555 (c:7555)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_58cc4)
	ld de, Data_58cc4
	ld hl, Data_58ca5
	call FarCall
Func_3356b: ; 3356b (c:756b)
	call Func_3af6
	ld hl, $8000
	ret

Data_33572: ; 33572
IF DEF(SUN)
	db $15, $16, $17, $18, $19, $10, $1a, $1b, $1c, $1d, $1e, $11, $1f, $20, $21, $22, $23, $12, $24, $25, $26, $27, $28, $13, $29, $2a, $2b, $2c, $2d, $00, $2e, $2f, $30, $31, $32, $00, $33, $34, $35, $36, $37, $14, $38, $39, $3a, $40, $0a, $41, $3b, $3c, $3d, $3e, $3f, $8f, $4e, $4f, $50, $51, $52, $4a, $53, $54, $55, $56, $57, $4b, $58, $59, $5a, $5b, $5c, $4c, $5d, $5e, $5f, $60, $61, $4d, $62, $63, $64, $65, $66, $00, $67, $68, $69, $6a, $6b, $00, $6c, $6d, $6e, $6f, $70, $14, $71, $72, $73, $79, $44, $7a, $74, $75, $76, $77, $78, $8f
ELIF DEF(STAR)
	db $15, $16, $17, $18, $19, $10, $1a, $1b, $1c, $1d, $1e, $11, $1f, $20, $21, $22, $23, $12, $24, $25, $26, $27, $28, $13, $29, $2a, $2b, $2c, $2d, $00, $2e, $2f, $30, $31, $32, $00, $33, $34, $35, $36, $37, $14, $38, $39, $3a, $40, $0a, $41, $3b, $3c, $3d, $3e, $3f, $8f, $4e, $4f, $50, $51, $52, $4a, $53, $54, $55, $56, $57, $4b, $58, $59, $5a, $5b, $5c, $4c, $5d, $5e, $5f, $60, $61, $4d, $62, $63, $64, $65, $66, $00, $67, $68, $69, $6a, $6b, $00, $6c, $6d, $6e, $6f, $70, $14, $71, $72, $73, $79, $44, $7a, $74, $75, $76, $77, $78, $8f
ENDC

Func_335de:: ; 335de
	push af
	push bc
	push bc
	push bc
	push bc
	xor a
Func_335e4: ; 335e4 (c:75e4)
	cp $5
	jp nc, Func_335f5
	ld e, a
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld [hl], $0
	inc a
	jp Func_335e4

Func_335f5: ; 335f5 (c:75f5)
	ld c, $0
Func_335f7: ; 335f7 (c:75f7)
	ld a, c
	cp $5
	jp nc, Func_337b3
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_337ac
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_33572
	add hl, de
	ld a, [hl]
	inc a
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld [hl], a
	ld e, c
	ld d, $0
	ld hl, wTimeSetHoursTensDigit
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_337a9
	ld e, c
	ld d, $0
	ld hl, wTimeSetHoursTensDigit
	add hl, de
	ld a, [hl]
	cp $23
	jp z, Func_33778
	cp $1d
	jp nz, Func_337a9
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $6
	jp c, Func_33667
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $b
	jp nc, Func_33667
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $86
	add [hl]
	ld [hl], a
	jp Func_33775

Func_33667: ; 33667 (c:7667)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $c
	jp c, Func_3368e
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $11
	jp nc, Func_3368e
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $86
	add [hl]
	ld [hl], a
	jp Func_33775

Func_3368e: ; 3368e (c:768e)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $12
	jp c, Func_336b5
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $17
	jp nc, Func_336b5
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $86
	add [hl]
	ld [hl], a
	jp Func_33775

Func_336b5: ; 336b5 (c:76b5)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $1e
	jp c, Func_336dc
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $23
	jp nc, Func_336dc
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $81
	add [hl]
	ld [hl], a
	jp Func_33775

Func_336dc: ; 336dc (c:76dc)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $3c
	jp c, Func_33703
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $41
	jp nc, Func_33703
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $6d
	add [hl]
	ld [hl], a
	jp Func_33775

Func_33703: ; 33703 (c:7703)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $42
	jp c, Func_3372a
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $47
	jp nc, Func_3372a
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $6d
	add [hl]
	ld [hl], a
	jp Func_33775

Func_3372a: ; 3372a (c:772a)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $48
	jp c, Func_33751
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $4d
	jp nc, Func_33751
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $6d
	add [hl]
	ld [hl], a
	jp Func_33775

Func_33751: ; 33751 (c:7751)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $54
	jp c, Func_33775
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $59
	jp nc, Func_33775
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $68
	add [hl]
	ld [hl], a
Func_33775: ; 33775 (c:7775)
	jp Func_337a9

Func_33778: ; 33778 (c:7778)
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $1e
	jp c, Func_3379f
	ld e, c
	ld d, $0
	ld hl, wTimeSetMonthsTensDigit
	add hl, de
	ld a, [hl]
	cp $23
	jp nc, Func_3379f
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $86
	add [hl]
	ld [hl], a
	jp Func_337a9

Func_3379f: ; 3379f (c:779f)
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, $6d
	add [hl]
	ld [hl], a
Func_337a9: ; 337a9 (c:77a9)
	jp Func_337af

Func_337ac: ; 337ac (c:77ac)
	jp Func_337b3

Func_337af: ; 337af (c:77af)
	inc c
	jp Func_335f7

Func_337b3: ; 337b3 (c:77b3)
	ld hl, sp+$0
	ld [hl], $0
	ld c, $0
Func_337b9: ; 337b9 (c:77b9)
	ld a, c
	cp $5
	jp nc, Func_337e7
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_337e0
	ld e, c
	ld d, $0
	ld hl, sp+$1
	add hl, de
	ld a, [hl]
	cp $90
	jp z, Func_337dd
	ld hl, sp+$0
	ld [hl], $1
	jp Func_337e7

Func_337dd: ; 337dd (c:77dd)
	jp Func_337e3

Func_337e0: ; 337e0 (c:77e0)
	jp Func_337e7

Func_337e3: ; 337e3 (c:77e3)
	inc c
	jp Func_337b9

Func_337e7: ; 337e7 (c:77e7)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_3380c
	ld hl, sp+$9
	ld a, [hl]
	or a
	jp nz, Func_3380c
	ld hl, sp+$1
	ld [hl], $73
	ld hl, sp+$2
	ld [hl], $15
	ld hl, sp+$3
	ld [hl], $5b
	ld hl, sp+$4
	ld [hl], $57
	ld hl, sp+$5
	ld [hl], $0
	jp Func_3381e

Func_3380c: ; 3380c (c:780c)
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_3381e
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp nz, Func_3381e
	jp Func_338ef

Func_3381e: ; 3381e (c:781e)
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$b
	ld a, [hl]
	or a
	jp nz, Func_33878
	ld hl, sp+$8
	ld [hl], $0
Func_3383d: ; 3383d (c:783d)
	ld hl, sp+$8
	ld a, [hl]
	cp $4
	jp nc, Func_33875
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchPlayerName
	add hl, de
	ld [hl], a
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wPlayerName
	add hl, de
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_3383d

Func_33875: ; 33875 (c:7875)
	jp Func_338d5

Func_33878: ; 33878 (c:7878)
	ld hl, sp+$8
	ld [hl], $0
Func_3387c: ; 3387c (c:787c)
	ld hl, sp+$8
	ld a, [hl]
	cp $5
	jp nc, Func_338b8
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	inc hl
	reg16swap de, hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, de
	ld [hl], a
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp Func_3387c

Func_338b8: ; 338b8 (c:78b8)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $1f
	add hl, de
	ld a, $1
	or [hl]
	ld [hl], a
Func_338d5: ; 338d5 (c:78d5)
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchPlayerName
	add hl, de
	ld [hl], $0
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wPlayerName
	add hl, de
	ld [hl], $0
	pop af
	call GetSRAMBank
Func_338ef: ; 338ef (c:78ef)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_338f5:: ; 338f5 (c:78f5)
	push bc
	push bc
	push bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus5
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	call GetHLAtSPPlus5
	inc hl
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	ld hl, $d
	add hl, bc
	ld l, [hl]
	push hl
	push af
	ld a, [wc2f6]
	ld e, a
	pop af
	push de
	push af
	ld b, $a
	call DivideAbyB
	ld a, b
	pop af
	ld b, $a
	call DivideAbyB
	pop de
	pop hl
	push hl
	push de
	ld a, l
	cp $32
	jp nz, Func_33946
	xor a
Func_33946: ; 33946 (c:7946)
	ld l, $a
	push hl
	ld c, $a
	ld e, $8
	ld a, $a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus9
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus9
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, a
	call Func_30313
	pop de
	ld c, e
	ld b, $0
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	inc hl
	ld de, $202
	call Func_2230
	pop hl
	ld a, l
	cp $32
	jp nz, Func_33996
	ld a, [wc2f6]
	ld c, a
	ld e, l
	ld hl, sp+$0
	ld a, [hl]
	call Func_312a4
Func_33996: ; 33996 (c:7996)
	ld a, [wc2f7]
	cp $1
	jp z, Func_339d4
	or a
	jp nz, Func_33a03
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_33a17
	call PlaceStringDEatCoordHL
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	ld de, Data_33a19
	call PlaceStringDEatCoordHL
	jp Func_33a03

Func_339d4: ; 339d4 (c:79d4)
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, Data_33a1b
	call PlaceStringDEatCoordHL
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	ld de, Data_33a1d
	call PlaceStringDEatCoordHL
Func_33a03: ; 33a03 (c:7a03)
	ld l, $a
	push hl
	ld c, $a
	ld e, $8
	ld a, $a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Data_33a17: ; 33a17
	dstr "_"

Data_33a19: ; 33a19
	dstr "b"

Data_33a1b: ; 33a1b
	dstr "b"

Data_33a1d: ; 33a1d
	dstr "_"

Func_33a1f:: ; 33a1f
	push bc
	push bc
	push bc
	push hl
	push de
	reg16swap de, hl
	ld hl, $5
	add hl, de
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, wc2f6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	call WriteHLToSPPlus8
	ld hl, wc2f6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	call WriteHLToSPPlus6
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_33aee
	ld a, e
	or d
	jp nz, Func_33b9b
	ld a, [wc2f7]
	cp $1
	jp z, Func_33ac0
	or a
	jp nz, Func_33aeb
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, Func_33a99
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	ld de, $a
	call CompareHLtoDE
	jp c, Func_33a96
	ld hl, $0
	call WriteHLToSPPlus6
Func_33a96: ; 33a96 (c:7a96)
	jp Func_33abd

Func_33a99: ; 33a99 (c:7a99)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_33abd
	ld hl, $0
	call WriteHLToSPPlus6
Func_33abd: ; 33abd (c:7abd)
	jp Func_33aeb

Func_33ac0: ; 33ac0 (c:7ac0)
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	pop de
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_33aeb
	ld hl, $0
	call WriteHLToSPPlus4
Func_33aeb: ; 33aeb (c:7aeb)
	jp Func_33b9b

Func_33aee: ; 33aee (c:7aee)
	ld a, [wc2f7]
	cp $1
	jp z, Func_33b48
	or a
	jp nz, Func_33b9b
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, Func_33b26
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	inc h
	dec h
	bit 7, h
	jr z, .asm_33b23
	ld hl, $9
	call WriteHLToSPPlus6
.asm_33b23
	jp Func_33b45

Func_33b26: ; 33b26 (c:7b26)
	call GetHLAtSPPlus6
	dec hl
	call WriteHLToSPPlus6
	inc h
	dec h
	bit 7, h
	jr z, Func_33b45
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	call WriteHLToSPPlus6
Func_33b45: ; 33b45 (c:7b45)
	jp Func_33b9b

Func_33b48: ; 33b48 (c:7b48)
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, Func_33b9b
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_33b8d
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	dec hl
	call WriteHLToSPPlus4
	jp Func_33b9b

Func_33b8d: ; 33b8d (c:7b8d)
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld de, $a
	call DivideHLByDESigned
	call WriteHLToSPPlus4
Func_33b9b: ; 33b9b (c:7b9b)
	call GetHLAtSPPlus4
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus8
	pop de
	add hl, de
	ld a, l
	ld [wc2f6], a
	pop hl
	call Func_338f5
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Func_33bb9:: ; 33bb9
	xor a
	ld [wc2f7], a
	call Func_338f5
	ld hl, $4000
	ret

Func_33bc4:: ; 33bc4
	ld a, $1
	ld [wc2f7], a
	call Func_338f5
	ld hl, $4000
	ret

Func_33bd0:: ; 33bd0 (c:7bd0)
	ld hl, -$8e
	add hl, sp
	ld sp, hl
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld a, [hl]
	push af
	ld e, a
	ld hl, sp+$4a
	call Func_241f
	set_farcall_addrs_hli Func_55f95
	pop af
	ld e, a
	ld hl, sp+$2
	ld c, $2
	call FarCall
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	push af
	set_farcall_addrs_hli GetName
	ld c, $6
	ld hl, sp+$36
	reg16swap de, hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	inc h
	call FarCall
	pop af
	ld e, a
	dec e
	ld hl, sp+$60
	call GetRobotOrTrainerBaseStats
	ld a, BANK(Text_66ea7)
	ld [wFarCallDestBank], a
	ld hl, sp+$65
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
	ld hl, sp+$20
	ld bc, $7
	call FarCopyVideoData
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$32
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $0
	call FarCall
	ld hl, Data_33d73
	push hl
	call PlaceString
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$1e
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call FarCall
	ld de, Data_33d75
	ld hl, $4
	call PlaceStringDEatCoordHL
	ld de, Data_33d80
	ld hl, $506
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $9
	ld hl, $7
	call FarCall
	ld c, $8
	ld e, $a
	ld hl, $a
	call FarCall
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $8
	ld hl, $1
	call FarCall
	ld de, Data_33d85
	ld hl, $10b
	call PlaceStringDEatCoordHL
	ld hl, sp+$56
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_33d8e
	ld hl, $10d
	call PlaceStringDEatCoordHL
	ld hl, sp+$57
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_33d98
	ld hl, $10f
	call PlaceStringDEatCoordHL
	ld hl, sp+$58
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_33da1
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld hl, sp+$55
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_33da6
	push hl
	call PlaceString
	pop bc
	ld hl, $8e
	add hl, sp
	ld sp, hl
	ret

Data_33d73: ; 33d73
	dstr ":"

Data_33d75: ; 33d75
	dstr "(そうひﾞちゅうの)"

Data_33d80: ; 33d80
	dstr "ハﾟーツ"

Data_33d85: ; 33d85
	dstr "(こうけﾞき )"

Data_33d8e: ; 33d8e
	dstr "(ほﾞうきﾞょ )"

Data_33d98: ; 33d98
	dstr "(すはﾞやさ )"

Data_33da1: ; 33da1
	dstr "RAM:"

Data_33da6: ; 33da6
	dstr "M"

Pointers_33da8: ; 33da8
	dw Data_33dac
	dw $0

Data_33dac: ; 33dac
	dstr "(すてちゃ)タﾞメ!"

Func_33db7:: ; 33db7 (c:7db7)
	push bc
	push bc
	call WriteHLToSPPlus3
	call GetHLAtSPPlus3
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus3
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$0
	ld [hl], a
	call GetHLAtSPPlus3
	call Func_33f72
	cp $1
	jp nz, Func_33efa
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
	call Func_30313
	ld de, Data_33f40
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_33f4b
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld a, $ff
	ld [wc39b], a
	set_farcall_addrs_hli Func_14db8
	call GetHLAtSPPlus3
	call FarCall
	ld a, [wc2f6]
	cp $ff
	jp z, Func_33ef7
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
	call Func_30313
	ld de, Data_33f5b
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_33f63
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
	jp nz, Func_33ef7
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld l, [hl]
	push hl
	push af
	set_farcall_addrs_hli AdjustItemQuantity
	ld c, $1
	ld a, [wc2f6]
	ld l, a
	push hl
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	pop de
	call FarCall
	ld c, a
	pop af
	push bc
	call GetSRAMBank
	pop bc
	pop hl
	ld a, c
	cp $1
	jp nz, Func_33ef7
	ld a, [wc2f6]
	cp l
	jp nz, Func_33ede
	call GetHLAtSPPlus3
	ld de, $7
	add hl, de
	ld e, c
	ld d, $0
	ld a, [hl]
	sub e
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc d
	ld [hl], a
Func_33ede: ; 33ede (c:7ede)
	call GetHLAtSPPlus3
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus3
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_33ef7: ; 33ef7 (c:7ef7)
	jp Func_33f3d

Func_33efa: ; 33efa (c:7efa)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_33da8)
	ld de, Pointers_33da8
	ld hl, $10e
	call FarCall
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_33f3d: ; 33f3d (c:7f3d)
	pop bc
	pop bc
	ret

Data_33f40: ; 33f40
	dstr "(すてる こすうを)"

Data_33f4b: ; 33f4b
	dstr "(にゅうりょくしてくたﾞさい)"

Data_33f5b: ; 33f5b
	dstr "(ほんとうに)"

Data_33f63: ; 33f63
	dstr "(すてても いいてﾞすか?)"

Func_33f72: ; 33f72 (c:7f72)
	push hl
	add sp, -$e
	read_hl_from_sp_plus $10
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	push hl
	ld e, a
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $57b8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $d
	call FarCopyVideoData
	pop hl
	ld a, l
	call GetSRAMBank
	read_hl_from_sp_plus $d
	ld a, l
	or h
	jp nz, Func_33fdc
	ld hl, $ff
	jp Func_33fdf

Func_33fdc: ; 33fdc (c:7fdc)
	ld hl, $1
Func_33fdf: ; 33fdf (c:7fdf)
	ld a, l
	add sp, $10
	ret


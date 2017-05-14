Data_e1f7a:
	db $00, $00
	db $06, $08
	db $09, $08
	db $12, $08
	db $12, $0c
	db $12, $04
	db $12, $01
	db $0c, $01
	db $0e, $0c
	db $0b, $0c
	db $01, $08
	db $01, $05
	db $0c, $05
	db $06, $01
	db $01, $01
	db $01, $0c
	db $05, $0c
	db $05, $10
	db $09, $03
	db $0f, $05

Data_e1fa2: ; e1fa2
	db $ff, $ff, $ff, $ff
	db $0d, $02, $ff, $0a
	db $12, $03, $ff, $01
	db $05, $ff, $04, $02
	db $03, $ff, $ff, $08
	db $06, $ff, $03, $ff
	db $ff, $ff, $05, $07
	db $ff, $06, $0c, $0d
	db $ff, $04, $ff, $09
	db $ff, $08, $ff, $10
	db $0b, $01, $0f, $ff
	db $0e, $0c, $0a, $ff
	db $07, $13, $ff, $0b
	db $ff, $07, $01, $0e
	db $ff, $0d, $0b, $ff
	db $0a, $10, $ff, $ff
	db $ff, $09, $11, $0f
	db $10, $ff, $ff, $ff
	db $ff, $ff, $02, $ff
	db $ff, $ff, $ff, $0c

Pointers_e1ff2:
	dw Data_e201a
	dw Data_e2023
	dw Data_e202d
	dw Data_e2036
	dw Data_e2040
	dw Data_e2049
	dw Data_e2052
	dw Data_e205c
	dw Data_e2065
	dw Data_e2070
	dw Data_e2079
	dw Data_e2083
	dw Data_e2090
	dw Data_e2099
	dw Data_e20a2
	dw Data_e20ab
	dw Data_e20b4
	dw Data_e20bf
	dw Data_e20c9
	dw Data_e20d6

Data_e201a:
	db "カフﾟリ(むら)", $0

Data_e2023:
	db "リフﾞラ(のまち)", $0

Data_e202d:
	db "カリーユ(まち)", $0

Data_e2036:
	db "ハﾞンサﾞ(むら)", $0

Data_e2040:
	db "キャロル(むら)", $0

Data_e2049:
	db "クールス(まち)", $0

Data_e2052:
	db "クﾞリース(やま)", $0

Data_e205c:
	db "タﾞイン(まち)", $0

Data_e2065:
	db "アホﾟロ(ようさい)", $0

Data_e2070:
	db "カﾞーナ(いけ)", $0

Data_e2079:
	db "メイシﾞ(のもり)", $0

Data_e2083:
	db "コﾞルトﾞ(へいけﾞん)", $0

Data_e2090:
	db "テール(のしろ)", $0

Data_e2099:
	db "ツキカﾞ(おか)", $0

Data_e20a2:
	db "オワリ(のもり)", $0

Data_e20ab:
	db "ホﾟロ(のむら)", $0

Data_e20b4:
	db "ハﾞートﾞ(しﾞま)", $0

Data_e20bf:
	db "(まほﾞろしむら)", $0

Data_e20c9:
	db "コﾞルトﾞ(へいけﾞん)", $0

Data_e20d6:
	db "(すいちゅう)", $0

Func_e20de:
	ld e, $0
	push de
	call GetJoyPressed
	ld c, a
	ld l, $0
	pop de
Func_e20e8: ; e20e8 (38:60e8)
	ld a, l
	cp $8
	jp nc, Func_e2110
	ld b, l
	ld a, [wc874]
	call RightShiftA
	and $1
	jp nz, Func_e210c
	ld a, c
	ld b, l
	call RightShiftA
	and $1
	jp z, Func_e210c
	ld b, l
	ld a, $1
	call LeftShiftA
	or e
	ld e, a
Func_e210c: ; e210c (38:610c)
	inc l
	jp Func_e20e8

Func_e2110: ; e2110 (38:6110)
	ld a, c
	ld [wc874], a
	ld a, e
	ret

Data_e2116: ; e2116
	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 26, 16, 04
	RGB 17, 08, 05
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 00, 16, 00
	RGB 17, 08, 05
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 06, 19, 27
	RGB 07, 07, 27
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 31, 00, 31
	RGB 16, 00, 16
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 08, 19, 19
	RGB 00, 11, 11
	RGB 00, 00, 00

	RGB 30, 23, 00
	RGB 31, 00, 00
	RGB 16, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 16
	RGB 11, 05, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 22, 14
	RGB 24, 07, 07
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 16, 31
	RGB 08, 08, 16
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 16, 16
	RGB 16, 08, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 08, 16
	RGB 04, 04, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 08, 08
	RGB 08, 04, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 23, 19
	RGB 22, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 23, 31
	RGB 10, 14, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 14, 25
	RGB 22, 12, 10
	RGB 00, 00, 00

Data_e2196: ; e2196
	db D_UP,   D_RIGHT
	db D_DOWN, D_LEFT

Data_e219a: ; e219a
	db 0, 1
	db 0, 2

Data_e219e: ; e219e
	dr $e219e, $e220d

WorldMap:: ; e220d
	ld hl, -$96
	add hl, sp
	ld sp, hl
	ld hl, sp+$74
	reg16swap de, hl
	ld hl, Data_e2196
	ld bc, $4
	call MemCopy
	ld hl, sp+$70
	reg16swap de, hl
	ld hl, Data_e219a
	ld bc, $4
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_e219e
	ld bc, $6f
	call MemCopy
	ld de, $384
	push de
	ld bc, $438
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, $84
	add hl, sp
	call FarCall
	ld hl, $87
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, $88
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, de
	pop bc
	pop de
	call CompareHLtoDE
	jp c, Func_e2287
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nc, Func_e2287
	ld a, $1
	jp Func_e2288

Func_e2287: ; e2287 (38:6287)
	xor a
Func_e2288: ; e2288 (38:6288)
	ld hl, sp+$6f
	ld [hl], a
Func_e228b: ; e228b (38:628b)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_e228b
	ld bc, $80
	ld de, Data_e2116
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	di
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ei
Func_e22a9: ; e22a9 (38:62a9)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_e22a9
	ld a, $14
	call OverworldPlaySong
	ld hl, sp+$79
	ld a, [wc7e2]
	ld [hl], a
	ld hl, sp+$79
	ld a, [hl]
	cp $12
	jp nz, Func_e22c8
	ld hl, sp+$6f
	ld [hl], $1
Func_e22c8: ; e22c8 (38:62c8)
	xor a
	call Func_e1f07
	ld a, BANK(GFX_e0000)
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e0000
	ld hl, $8900
	call FarRequestVideoData
	call Func_e2a17
	hlcoord 0, 0
	write_hl_to_sp_plus $7e
	hlcoord 0, 0, wAttrMap
	write_hl_to_sp_plus $7c
	ld de, Data_e06f0
	xor a
Func_e22f2: ; e22f2 (38:62f2)
	cp $12
	jp nc, Func_e2350
	push af
	push de
	ld a, BANK(Data_e06f0)
	ld [wFarCallDestBank], a
	ld hl, $84
	add hl, sp
	ld bc, $14
	call FarCopyVideoData
	ld c, $0
Func_e230a: ; e230a (38:630a)
	ld a, c
	cp $14
	jp nc, Func_e2342
	ld e, c
	ld d, $0
	ld hl, $84
	add hl, sp
	add hl, de
	ld a, [hl]
	add $90
	read_hl_from_sp_plus $82
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $82
	ld e, c
	ld d, $0
	ld hl, $84
	add hl, sp
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$4
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $80
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $80
	inc c
	jp Func_e230a

Func_e2342: ; e2342 (38:6342)
	pop de
	ld hl, $14
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	jp Func_e22f2

Func_e2350: ; e2350 (38:6350)
	ld hl, $94
	add hl, sp
	ld [hl], $1
Func_e2356: ; e2356 (38:6356)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $14
	jp nc, Func_e243e
	ld hl, $94
	add hl, sp
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp z, Func_e2430
	ld hl, $95
	add hl, sp
	ld [hl], $0
Func_e2372: ; e2372 (38:6372)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2430
	ld hl, $95
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, $94
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$78
	ld [hl], a
	cp $ff
	jp z, Func_e2422
	ld hl, sp+$78
	ld a, [hl]
	ld hl, $94
	add hl, sp
	cp [hl]
	jp nc, Func_e23a8
	jp Func_e2422

Func_e23a8: ; e23a8 (38:63a8)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $10
	jp z, Func_e23bc
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $11
	jp nz, Func_e23d7
Func_e23bc: ; e23bc (38:63bc)
	ld hl, sp+$78
	ld a, [hl]
	cp $10
	jp z, Func_e23cc
	ld hl, sp+$78
	ld a, [hl]
	cp $11
	jp nz, Func_e23d7
Func_e23cc: ; e23cc (38:63cc)
	ld hl, sp+$79
	ld a, [hl]
	cp $11
	jp z, Func_e23d7
	jp Func_e2422

Func_e23d7: ; e23d7 (38:63d7)
	ld hl, sp+$6f
	ld a, [hl]
	or a
	jp nz, Func_e240d
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $2
	jp z, Func_e23f2
	ld hl, $94
	add hl, sp
	ld a, [hl]
	cp $12
	jp nz, Func_e240d
Func_e23f2: ; e23f2 (38:63f2)
	ld hl, sp+$78
	ld a, [hl]
	cp $2
	jp z, Func_e2402
	ld hl, sp+$78
	ld a, [hl]
	cp $12
	jp nz, Func_e240d
Func_e2402: ; e2402 (38:6402)
	ld hl, sp+$79
	ld a, [hl]
	cp $12
	jp z, Func_e240d
	jp Func_e2422

Func_e240d: ; e240d (38:640d)
	ld hl, sp+$78
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp z, Func_e2422
	ld hl, sp+$78
	ld e, [hl]
	ld hl, $94
	add hl, sp
	ld a, [hl]
	call Func_e2851
Func_e2422: ; e2422 (38:6422)
	ld hl, $95
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $95
	add hl, sp
	ld [hl], a
	jp Func_e2372

Func_e2430: ; e2430 (38:6430)
	ld hl, $94
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $94
	add hl, sp
	ld [hl], a
	jp Func_e2356

Func_e243e: ; e243e (38:643e)
	ld hl, sp+$79
	ld a, [hl]
	call Func_e262f
	callba_hli Func_da4fc
	ld hl, sp+$7f
	ld [hl], $0
	ld hl, sp+$7e
	ld [hl], $17
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$7f
	ld a, [hl]
	ld hl, sp+$7e
	ld l, [hl]
	ld h, a
	call FarCall
	ld a, $1
	call Func_e1f07
	call NextOverworldFrame
	call CheckButton
	set_farcall_addrs_hli Func_c7bd0
	xor a
	call FarCall
	ld e, $0
	push de
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	call Func_e2a24
	xor a
	ld [wc874], a
	pop de
Func_e24a3: ; e24a3 (38:64a3)
	push de
	call NextOverworldFrame
	call CheckButton
	ld hl, sp+$7a
	ld [hl], a
	ld hl, $97
	add hl, sp
	ld [hl], $0
Func_e24b3: ; e24b3 (38:64b3)
	ld hl, $97
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e258f
	ld hl, sp+$7a
	ld a, [hl]
	ld hl, $97
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$76
	add hl, de
	and [hl]
	jp z, Func_e2581
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $ff
	jp z, Func_e2581
	ld hl, sp+$7b
	ld a, [hl]
	cp $10
	jp nz, Func_e250b
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $11
	jp nz, Func_e250b
	jp Func_e2581

Func_e250b: ; e250b (38:650b)
	ld hl, sp+$71
	ld a, [hl]
	or a
	jp nz, Func_e2536
	ld hl, sp+$7b
	ld a, [hl]
	cp $2
	jp nz, Func_e2536
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	cp $12
	jp nz, Func_e2536
	jp Func_e2581

Func_e2536: ; e2536 (38:6536)
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp z, Func_e2581
	ld hl, $97
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e1fa2
	add hl, de
	add hl, bc
	ld e, [hl]
	ld hl, sp+$7b
	ld [hl], e
	ld hl, sp+$7b
	ld a, [hl]
	call Func_e262f
	ld l, $3
	push hl
	ld c, $a
	ld e, $f
	ld a, $a
	call PushBGMapRegion
	pop bc
	call NextOverworldFrame
	jp Func_e258f

Func_e2581: ; e2581 (38:6581)
	ld hl, $97
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $97
	add hl, sp
	ld [hl], a
	jp Func_e24b3

Func_e258f: ; e258f (38:658f)
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	set_farcall_addrs_hli UpdateCurSprite
	pop de
	push de
	ld l, e
	ld h, $0
	ld b, $4
	call RightShiftHL
	reg16swap de, hl
	ld hl, sp+$72
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $c
	add hl, de
	push hl
	ld hl, sp+$7d
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $400
	add hl, de
	pop de
	add hl, de
	reg16swap de, hl
	xor a
	call FarCall
	callba_hli QueueMoveAnimScriptGFXUpdate
	pop de
	ld a, e
	inc a
	and $3f
	ld e, a
	ld hl, sp+$78
	ld a, [hl]
	and A_BUTTON
	jp z, Func_e2626
	call NextOverworldFrame
	call NextOverworldFrame
	call NextOverworldFrame
	ld hl, sp+$79
	ld a, [hl]
	ld [wc7e2], a
	ld hl, sp+$79
	ld a, [hl]
	dec a
	jp Func_e2629

Func_e2626: ; e2626 (38:6626)
	jp Func_e24a3

Func_e2629: ; e2629 (38:6629)
	ld hl, $96
	add hl, sp
	ld sp, hl
	ret

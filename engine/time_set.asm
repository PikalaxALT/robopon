Func_52df8: ; 52df8 (14:6df8)
	push bc
	push bc
	push bc
	push bc
	push hl
	call FillVisibleAreaWithBlankTile
	call Func_1fbe
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld de, Data_530bd
	ld hl, $20c
	call PlaceStringDEatCoordHL
	ld a, $3
	ld [wc2f7], a
	call Func_530d4
	xor a
	ld [wc2f7], a
	call Func_53260
	call Func_53327
	ld e, $1
	ld a, $1
	call SetStringStartState
	ld hl, $8b ; cursor
	push hl
	ld hl, Data_530ca
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld e, $0
	pop hl
Func_52e4d: ; 52e4d (14:6e4d)
	push de
	ld a, e
	cp $3
	jp z, Func_52f66
	cp $2
	jp z, Func_52f49
	cp $1
	jp z, Func_52f2c
	or a
	jp nz, Func_52f83
	ld a, $3
	ld [wc2f7], a
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_5004e)
	ld de, Data_5004e
	ld hl, Data_5002f
	call FarCall

	; Is it February 29?
	push hl
	ld a, [wTimeSetMonthsTensDigit]
	or a
	jp nz, Func_52f28
	ld a, [wTimeSetMonthsOnesDigit]
	cp $2
	jp nz, Func_52f28
	ld a, [wTimeSetDaysTensDigit]
	cp $2
	jp nz, Func_52f28
	ld a, [wTimeSetDaysOnesDigit]
	cp $9
	jp nz, Func_52f28
	xor a
	ld [wc2f7], a
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
	ld de, 1000
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
	call WriteHLToSPPlus6
	; Is this a leap year?
	; an inline duplicate of IsLeapYear
	call GetHLAtSPPlus6
	ld de, 4
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_52ef7
	call GetHLAtSPPlus6
	ld de, 100
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_52f05
Func_52ef7: ; 52ef7 (14:6ef7)
	call GetHLAtSPPlus6
	ld de, 400
	call DivideHLByDESigned
	ld a, e
	or d
	jp nz, Func_52f08
Func_52f05: ; 52f05 (14:6f05)
	jp Func_52f28

Func_52f08: ; 52f08 (14:6f08)
	; It's not a leap year, therefore
	; February 29 is not a valid date.
	; Set the date to February 28.
	ld e, $5
	ld a, $d
	call SetStringStartState
	ld hl, Data_530cd
	push hl
	call PlaceString
	pop bc
	ld a, $8
	ld [wTimeSetDaysOnesDigit], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_52f28: ; 52f28 (14:6f28)
	pop hl
	jp Func_52f83

Func_52f2c: ; 52f2c (14:6f2c)
	xor a
	ld [wc2f7], a
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_5007c)
	ld de, Data_5007c
	ld hl, Data_5005d
	call FarCall
	jp Func_52f83

Func_52f49: ; 52f49 (14:6f49)
	xor a
	ld [wc2f7], a
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_500aa)
	ld de, Data_500aa
	ld hl, Data_5008b
	call FarCall
	jp Func_52f83

Func_52f66: ; 52f66 (14:6f66)
	call CheckButton
	ld l, a
	ld a, l
	and A_BUTTON
	jp z, Func_52f75
	ld l, 1
	jp Func_52f83

Func_52f75: ; 52f75 (14:6f75)
	ld a, l
	and B_BUTTON
	jp z, Func_52f80
	ld l, -1
	jp Func_52f83

Func_52f80: ; 52f80 (14:6f80)
	jp Func_52f66

Func_52f83: ; 52f83 (14:6f83)
	pop de
	push hl
	push de
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	pop de
	ld a, e
	cp $3
	jp nz, Func_52fa5
	push de
	ld e, $c
	ld a, $1
	call SetStringStartState
	pop de
	jp Func_52fb1

Func_52fa5: ; 52fa5 (14:6fa5)
	push de
	ld a, e
	add a
	add a
	inc a
	ld e, a
	ld a, $1
	call SetStringStartState
	pop de
Func_52fb1: ; 52fb1 (14:6fb1)
	push de
	ld hl, Data_530cf
	push hl
	call PlaceString
	pop bc
	pop de
	pop hl
	ld a, l
	cp $1
	jp nz, Func_52fd2
	ld a, e
	cp $3
	jp nc, Func_52fcc
	inc e
	jp Func_52fcf

Func_52fcc: ; 52fcc (14:6fcc)
	jp Func_5301d

Func_52fcf: ; 52fcf (14:6fcf)
	jp Func_52fdf

Func_52fd2: ; 52fd2 (14:6fd2)
	ld a, e
	cp $1
	jp c, Func_52fdc
	dec e
	jp Func_52fdf

Func_52fdc: ; 52fdc (14:6fdc)
	jp Func_5301d

Func_52fdf: ; 52fdf (14:6fdf)
	push hl
	ld a, e
	cp $3
	jp nz, Func_52ff2
	push de
	ld e, $c
	ld a, $1
	call SetStringStartState
	pop de
	jp Func_52ffe

Func_52ff2: ; 52ff2 (14:6ff2)
	push de
	ld a, e
	add a
	add a
	inc a
	ld e, a
	ld a, $1
	call SetStringStartState
	pop de
Func_52ffe: ; 52ffe (14:6ffe)
	push de
	ld hl, $8b ; cursor
	push hl
	ld hl, Data_530d1
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop de
	pop hl
	jp Func_52e4d

Func_5301d: ; 5301d (14:701d)
	ld a, e
	cp $3
	jp nz, Func_530b2
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
	ld de, 1000
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
	reg16swap de, hl
	ld hl, -1924
	add hl, de
	ld a, l
	ld hl, sp+$2
	ld [hl], a
	ld a, [wTimeSetMonthsTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMonthsOnesDigit
	add [hl]
	ld hl, sp+$3
	ld [hl], a
	ld a, [wTimeSetDaysTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetDaysOnesDigit
	add [hl]
	ld hl, sp+$4
	ld [hl], a
	ld a, [wTimeSetHoursTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetHoursOnesDigit
	add [hl]
	ld hl, sp+$5
	ld [hl], a
	ld a, [wTimeSetMinutesTensDigit]
	add a
	ld d, a
	add a
	add a
	add d
	ld hl, wTimeSetMinutesOnesDigit
	add [hl]
	ld hl, sp+$6
	ld [hl], a
	set_farcall_addrs_hli Func_932bd
	ld hl, sp+$2
	call FarCall
Func_530b2: ; 530b2 (14:70b2)
	call FillVisibleAreaWithBlankTile
	call Func_2009
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_530bd:
	db "(せっていしゅうりょう)", $0

Data_530ca:
	TX_STACK
	db $0

Data_530cd:
	db "8", $0

Data_530cf:
	db " ", $0

Data_530d1:
	TX_STACK
	db $0

Func_530d4: ; 530d4 (14:70d4)
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$0
	call FarCall
	ld c, $4
	ld e, $8
	ld hl, $600
	call Func_50185
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_50185
	ld de, Data_531c8
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_531db
	ld hl, $110
	call PlaceStringDEatCoordHL
	ld de, Data_531e9
	ld hl, $201
	call PlaceStringDEatCoordHL
	ld de, Data_531f0
	ld hl, $b01
	call PlaceStringDEatCoordHL
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	ld de, $784
	add hl, de
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld de, 1950
	call CompareHLtoDE
	jp nc, Func_5313b
	ld bc, 1950
	jp Func_53149

Func_5313b: ; 5313b (14:713b)
	ld e, c
	ld d, b
	ld hl, $802
	call CompareHLtoDE
	jp nc, Func_53149
	ld bc, $802
Func_53149: ; 53149 (14:7149)
	push bc
	ld l, c
	ld h, b
	ld de, 1000
	call DivideHLByDESigned
	ld a, l
	ld [wTimeSetMillennia], a
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, 1000
	call DivideHLByDESigned
	reg16swap de, hl
	ld de, $64
	call DivideHLByDESigned
	ld a, l
	ld [wTimeSetCenturies], a
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, $64
	call DivideHLByDESigned
	reg16swap de, hl
	ld de, $a
	call DivideHLByDESigned
	ld a, l
	ld [wTimeSetDecades], a
	pop hl
	ld de, $a
	call DivideHLByDESigned
	ld a, e
	ld [wTimeSetYears], a
	ld e, $1
	ld a, $7
	call SetStringStartState
	ld hl, wTimeSetYears
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetDecades
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetCenturies
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMillennia
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_531f5
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	xor a
	call Func_533f8
	pop bc
	pop bc
	pop bc
	ret

Data_531c8:
	db "(せいれき ひつﾞけ しﾞかん を)", $0

Data_531db:
	db "(せっていしてくたﾞさい)", $0

Data_531e9:
	db "(せいれき)", $0

Data_531f0:
	db "(ねん)", $0

Data_531f5:
	TX_SNUM
	TX_SNUM
	TX_SNUM
	TX_SNUM
	db $0

Func_531fe:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	xor a
	call Func_533f8
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, $4000
	ret

Func_5321e:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld a, $1
	call Func_533f8
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, $4000
	ret

Func_5323f:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld a, $2
	call Func_533f8
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	ld hl, $4000
	ret

Func_53260: ; 53260 (14:7260)
	push bc
	push bc
	push bc
	ld c, $4
	ld e, $b
	ld hl, $604
	call Func_50185
	ld de, Data_5330b
	ld hl, $205
	call PlaceStringDEatCoordHL
	ld de, Data_53312
	ld hl, $905
	call PlaceStringDEatCoordHL
	ld de, Data_53318
	ld hl, $e05
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$0
	call FarCall
	ld hl, sp+$1
	ld a, [hl]
	push af
	ld b, 10
	call DivideAbyB
	ld [wTimeSetMonthsTensDigit], a
	pop af
	ld b, 10
	call DivideAbyB
	ld a, b
	ld [wTimeSetMonthsOnesDigit], a
	ld hl, sp+$2
	ld a, [hl]
	push af
	ld b, 10
	call DivideAbyB
	ld [wTimeSetDaysTensDigit], a
	pop af
	ld b, 10
	call DivideAbyB
	ld a, b
	ld [wTimeSetDaysOnesDigit], a
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
	ld hl, Data_5331d
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
	ld hl, Data_53322
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld a, $1
	call Func_533f8
	pop bc
	pop bc
	pop bc
	ret

Data_5330b:
	db "(ひつﾞけ)", $0

Data_53312:
	db "(かﾞつ)", $0

Data_53318:
	db "(にち)", $0

Data_5331d:
	TX_SNUM
	TX_SNUM
	db $0

Data_53322:
	TX_SNUM
	TX_SNUM
	db $0

Func_53327: ; 53327 (14:7327)
	push bc
	push bc
	push bc
	ld c, $4
	ld e, $7
	ld hl, $608
	call Func_50185
	ld de, Data_533d4
	ld hl, $209
	call PlaceStringDEatCoordHL
	ld de, Data_533db
	ld hl, $909
	call PlaceStringDEatCoordHL
	ld de, Data_533dd
	ld hl, $e05
	call PlaceStringDEatCoordHL
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$0
	call FarCall
	ld hl, sp+$3
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	ld [wTimeSetHoursTensDigit], a
	ld hl, sp+$3
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	ld a, b
	ld [wTimeSetHoursOnesDigit], a
	ld hl, sp+$4
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	ld [wTimeSetMinutesTensDigit], a
	ld hl, sp+$4
	ld a, [hl]
	ld b, $a
	call DivideAbyB
	ld a, b
	ld [wTimeSetMinutesOnesDigit], a
	ld e, $9
	ld a, $7
	call SetStringStartState
	ld hl, wTimeSetHoursOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetHoursTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_533e2
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $9
	ld a, $a
	call SetStringStartState
	ld hl, wTimeSetMinutesOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMinutesTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_533e7
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld a, $2
	call Func_533f8
	pop bc
	pop bc
	pop bc
	ret

Data_533d4:
	db "(しﾞかん)", $0

Data_533db:
	db ":", $0

Data_533dd:
	db "(にち)", $0

Data_533e2:
	TX_SNUM
	TX_SNUM
	db $0

Data_533e7:
	TX_SNUM
	TX_SNUM
	db $0

Data_533ec:
	db  7,  8,  9, 10
	db  7,  8, 12, 13
	db  7,  8, 10, 11

Func_533f8: ; 533f8 (14:73f8)
	push af
	ld c, $0
Func_533fb: ; 533fb (14:73fb)
	ld a, c
	cp $4
	jp nc, Func_53465
	ld a, [wc2f7]
	cp c
	jp nz, Func_53436
	push bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, $73ec
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_53467
	call PlaceStringDEatCoordHL
	pop bc
	jp Func_53461

Func_53436: ; 53436 (14:7436)
	push bc
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_533ec
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Data_53469
	call PlaceStringDEatCoordHL
	pop bc
Func_53461: ; 53461 (14:7461)
	inc c
	jp Func_533fb

Func_53465: ; 53465 (14:7465)
	pop bc
	ret

Data_53467:
	db "b", $0

Data_53469:
	db "_", $0

Func_5346b: ; 5346b (14:746b)
	push bc
	ld a, [wc2f7]
	cp $3
	jp z, Func_534bf
	cp $2
	jp z, Func_534a5
	cp $1
	jp z, Func_5348b
	or a
	jp nz, Func_534c5
	ld c, $2
	ld hl, sp+$0
	ld [hl], $1
	jp Func_534c5

Func_5348b: ; 5348b (14:748b)
	ld a, [wTimeSetMillennia]
	cp $2
	jp nz, Func_5349c
	ld c, $0
	ld hl, sp+$0
	ld [hl], $0
	jp Func_534a2

Func_5349c: ; 5349c (14:749c)
	ld c, $9
	ld hl, sp+$0
	ld [hl], $9
Func_534a2: ; 534a2 (14:74a2)
	jp Func_534c5

Func_534a5: ; 534a5 (14:74a5)
	ld a, [wTimeSetCenturies]
	cp $9
	jp nz, Func_534b6
	ld c, $9
	ld hl, sp+$0
	ld [hl], $5
	jp Func_534bc

Func_534b6: ; 534b6 (14:74b6)
	ld c, $9
	ld hl, sp+$0
	ld [hl], $0
Func_534bc: ; 534bc (14:74bc)
	jp Func_534c5

Func_534bf: ; 534bf (14:74bf)
	ld c, $9
	ld hl, sp+$0
	ld [hl], $0
Func_534c5: ; 534c5 (14:74c5)
	ld a, e
	sub $3
	or d
	jp z, Func_53552
	ld a, e
	sub $2
	or d
	jp z, Func_53540
	ld a, e
	dec a
	or d
	jp z, Func_5350f
	ld a, e
	or d
	jp nz, Func_53561
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld a, [hl]
	cp c
	jp nz, Func_534fe
	ld hl, sp+$0
	ld a, [hl]
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld [hl], a
	jp Func_5350c

Func_534fe: ; 534fe (14:74fe)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
Func_5350c: ; 5350c (14:750c)
	jp Func_53561

Func_5350f: ; 5350f (14:750f)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_5352e
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld [hl], c
	jp Func_5353d

Func_5352e: ; 5352e (14:752e)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetMillennia
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_5353d: ; 5353d (14:753d)
	jp Func_53561

Func_53540: ; 53540 (14:7540)
	ld a, [wc2f7]
	cp $3
	jp nc, Func_5354f
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
Func_5354f: ; 5354f (14:754f)
	jp Func_53561

Func_53552: ; 53552 (14:7552)
	ld a, [wc2f7]
	cp $1
	jp c, Func_53561
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
Func_53561: ; 53561 (14:7561)
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
	ld de, 1000
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
	ld de, $79e
	call CompareHLtoDE
	jp nc, Func_535b7
	ld a, $1
	ld [wTimeSetMillennia], a
	ld a, $9
	ld [wTimeSetCenturies], a
	ld a, $5
	ld [wTimeSetDecades], a
	xor a
	ld [wTimeSetYears], a
	jp Func_5360d

Func_535b7: ; 535b7 (14:75b7)
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
	ld de, 1000
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
	reg16swap de, hl
	ld hl, $802
	call CompareHLtoDE
	jp nc, Func_5360d
	ld a, $2
	ld [wTimeSetMillennia], a
	xor a
	ld [wTimeSetCenturies], a
	ld a, $5
	ld [wTimeSetDecades], a
	xor a
	ld [wTimeSetYears], a
Func_5360d: ; 5360d (14:760d)
	ld e, $1
	ld a, $7
	call SetStringStartState
	ld hl, wTimeSetYears
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetDecades
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetCenturies
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMillennia
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_53652
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	xor a
	call Func_533f8
	ld l, $2
	push hl
	ld c, $4
	ld e, $1
	ld a, $7
	call Func_3bc5
	pop bc
	ld hl, $4000
	pop bc
	ret

Data_53652:
	TX_SNUM
	TX_SNUM
	TX_SNUM
	TX_SNUM
	db $0

Func_5365b:
	ld de, $2
	jp Func_5346b

Func_53661:
	ld de, $3
	jp Func_5346b

Func_53667:
	ld hl, $1
	ret

Func_5366b: ; 5366b (14:766b)
	push bc
	ld a, [wc2f7]
	cp $3
	jp z, Func_536cf
	cp $2
	jp z, Func_536c6
	cp $1
	jp z, Func_536ac
	or a
	jp nz, Func_536d5
	ld a, [wTimeSetHoursOnesDigit]
	cp $4
	jp nc, Func_53693
	ld hl, sp+$0
	ld [hl], $2
	ld c, $0
	jp Func_536a9

Func_53693: ; 53693 (14:7693)
	ld a, [wTimeSetHoursOnesDigit]
	or a
	jp nz, Func_536a3
	ld hl, sp+$0
	ld [hl], $2
	ld c, $1
	jp Func_536a9

Func_536a3: ; 536a3 (14:76a3)
	ld hl, sp+$0
	ld [hl], $1
	ld c, $0
Func_536a9: ; 536a9 (14:76a9)
	jp Func_536d5

Func_536ac: ; 536ac (14:76ac)
	ld a, [wTimeSetHoursTensDigit]
	cp $2
	jp nz, Func_536bd
	ld hl, sp+$0
	ld [hl], $3
	ld c, $0
	jp Func_536c3

Func_536bd: ; 536bd (14:76bd)
	ld hl, sp+$0
	ld [hl], $9
	ld c, $0
Func_536c3: ; 536c3 (14:76c3)
	jp Func_536d5

Func_536c6: ; 536c6 (14:76c6)
	ld hl, sp+$0
	ld [hl], $5
	ld c, $0
	jp Func_536d5

Func_536cf: ; 536cf (14:76cf)
	ld hl, sp+$0
	ld [hl], $9
	ld c, $0
Func_536d5: ; 536d5 (14:76d5)
	ld a, e
	sub $3
	or d
	jp z, Func_53762
	ld a, e
	sub $2
	or d
	jp z, Func_53750
	ld a, e
	dec a
	or d
	jp z, Func_5371e
	ld a, e
	or d
	jp nz, Func_53771
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nz, Func_5370d
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld [hl], c
	jp Func_5371b

Func_5370d: ; 5370d (14:770d)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
Func_5371b: ; 5371b (14:771b)
	jp Func_53771

Func_5371e: ; 5371e (14:771e)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld a, [hl]
	cp c
	jp nz, Func_5373e
	ld hl, sp+$0
	ld a, [hl]
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld [hl], a
	jp Func_5374d

Func_5373e: ; 5373e (14:773e)
	ld hl, wc2f7
	ld l, [hl]
	ld h, $0
	ld de, wTimeSetHoursTensDigit
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
Func_5374d: ; 5374d (14:774d)
	jp Func_53771

Func_53750: ; 53750 (14:7750)
	ld a, [wc2f7]
	cp $3
	jp nc, Func_5375f
	ld a, [wc2f7]
	inc a
	ld [wc2f7], a
Func_5375f: ; 5375f (14:775f)
	jp Func_53771

Func_53762: ; 53762 (14:7762)
	ld a, [wc2f7]
	cp $1
	jp c, Func_53771
	ld a, [wc2f7]
	dec a
	ld [wc2f7], a
Func_53771: ; 53771 (14:7771)
	ld e, $9
	ld a, $7
	call SetStringStartState
	ld hl, wTimeSetHoursOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetHoursTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_537c6
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $9
	ld a, $a
	call SetStringStartState
	ld hl, wTimeSetMinutesOnesDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, wTimeSetMinutesTensDigit
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_537cb
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld a, $2
	call Func_533f8
	ld l, $2
	push hl
	ld c, $5
	ld e, $9
	ld a, $7
	call Func_3bc5
	pop bc
	ld hl, $4000
	pop bc
	ret

Data_537c6:
	TX_SNUM
	TX_SNUM
	db $0

Data_537cb:
	TX_SNUM
	TX_SNUM
	db $0

Func_537d0:
	ld de, $2
	jp Func_5366b

Func_537d6:
	ld de, $3
	jp Func_5366b

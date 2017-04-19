Crash:: ; 1d00 (0:1d00)
	push de
	push bc
	push hl
	callba_hli Func_4064
	ld a, $ff
	ld [wc213], a
	callba_hli Func_4000
	ld a, [wNextVBlankFlags]
	or $11
	ld [wNextVBlankFlags], a
.wait
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .wait
	call FillVisibleAreaWithBlankTile
	ld de, Data_1d8d
	lb hl, 0, 1
	call PlaceStringDEatCoordHL
	ld de, Data_1d94
	lb hl, 0, 3
	call PlaceStringDEatCoordHL
	ld e, $5
	xor a
	call SetStringStartState
	pop hl
	push hl
	ld hl, Data_1da2
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $7
	xor a
	call SetStringStartState
	pop bc
	push bc
	ld hl, Data_1daa
	push hl
	call PlaceString
	pop bc
	pop bc
	ld e, $9
	xor a
	call SetStringStartState
	pop de
	push de
	ld hl, Data_1db0
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp @ - 1 ; better luck next time

Data_1d8d:: ; 1d8d
	db "<HIRA>あれ<KATA> ?", $00

Data_1d94:: ; 1d94
	db "<HIRA>てﾞんけﾞんきってね<KATA>!", $00

Data_1da2:: ; 1da2
	db "スタック:"
	TX_SNUM
	db $00

Data_1daa:: ; 1daa
	db "ロム:"
	TX_SNUM
	db $00

Data_1db0:: ; 1db0
	db "アトﾞレス:"
	TX_SNUM
	db $00

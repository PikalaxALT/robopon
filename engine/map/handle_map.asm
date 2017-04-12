HandleMap: ; 90e9 (2:50e9)
	add sp, -$10
	ld a, $ff
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	ld hl, sp+$e
	ld [hl], $ff
Func_90fe: ; 90fe (2:50fe)
	ld a, [$c84a]
	cp $1
	jp nz, Func_9413
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, Func_9111
	call NextOverworldFrame
Func_9111: ; 9111 (2:5111)
	call Func_b44d
	ld hl, sp+$e
	ld [hl], a
	read_hl_from $c83c
	ld a, l
	or h
	jp z, Func_9134
	ld hl, sp+$e
	ld a, [hl]
	cp $ff
	jp nz, Func_9134
	ld hl, $0
	write_hl_to $c83c
	jp Func_9413

Func_9134: ; 9134 (2:5134)
	ld e, $ff
	ld hl, sp+$e
	ld a, [hl]
	and $4
	jp z, Func_9146
	xor a
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9146: ; 9146 (2:5146)
	ld hl, sp+$e
	ld a, [hl]
	and $8
	jp z, Func_9157
	ld a, $2
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9157: ; 9157 (2:5157)
	ld hl, sp+$e
	ld a, [hl]
	and $2
	jp z, Func_9168
	ld a, $3
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9168: ; 9168 (2:5168)
	ld hl, sp+$e
	ld a, [hl]
	and $1
	jp z, Func_9179
	ld a, $1
	ld [$c838], a
	ld e, a
	jp Func_918e

Func_9179: ; 9179 (2:5179)
	push de
	ld a, [$c838]
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call Func_b150
	pop de
Func_918e: ; 918e (2:518e)
	push de
	ld a, [$c839]
	ld hl, $c838
	cp [hl]
	jp z, Func_91ba
	ld e, $0
	ld a, [$c838]
	call Func_9d80
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_8ccf
	ld a, [$c838]
	ld [$c839], a
Func_91ba: ; 91ba (2:51ba)
	call Func_8dc8
	pop de
	ld hl, sp+$e
	ld a, [hl]
	and $10
	jp z, Func_91f0
	ld e, $4
	ld a, [$c838]
	ld e, a
	ld a, $2
	call Func_a783
	ld a, [$c84a]
	or a
	jp nz, Func_91db
	jp Func_9413

Func_91db: ; 91db (2:51db)
	callba_hli Func_9b326
	ld hl, sp+$e
	ld [hl], $ff
	jp Func_90fe

Func_91f0: ; 91f0 (2:51f0)
	ld hl, sp+$e
	ld a, [hl]
	and $40
	jp z, Func_930d
	push de
	ld hl, $0
	push hl
	ld a, $3
	ld [wOAM26VTile], a
	call Func_bf05
	call Func_bf12
	pop hl
	ld a, l
	or h
	jp nz, Func_9222
	set_farcall_addrs_hli Func_da901
	ld de, $1403
	ld hl, $0
	call FarCall
Func_9222: ; 9222 (2:5222)
	push hl
	ld hl, sp+$4
	ld [hl], $ff
Func_9227: ; 9227 (2:5227)
	call GetJoyPressed
	and $40
	jp z, Func_92f7
	call NextOverworldFrame
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$5
	call FarCall
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$9
	cp [hl]
	jp nz, Func_924e
	jp Func_9227

Func_924e: ; 924e (2:524e)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld e, $1
	ld a, $2
	call SetStringStartState
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $14
	ld hl, $0
	call FarCall
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld de, $784
	add hl, de
	push hl
	ld hl, Data_9416
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$8
	ld a, [hl]
	cp $a
	jp nc, Func_92ab
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9420
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_92ba

Func_92ab: ; 92ab (2:52ab)
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9425
	push hl
	call PlaceString
	pop bc
	pop bc
Func_92ba: ; 92ba (2:52ba)
	ld hl, sp+$9
	ld a, [hl]
	cp $a
	jp nc, Func_92d4
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_9429
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_92e3

Func_92d4: ; 92d4 (2:52d4)
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, Data_942d
	push hl
	call PlaceString
	pop bc
	pop bc
Func_92e3: ; 92e3 (2:52e3)
	ld a, $1
	ld [wOAM26VTile], a
	ld l, $3
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	jp Func_9227

Func_92f7: ; 92f7 (2:52f7)
	call Func_8f44
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
	pop de
	jp Func_93c0

Func_930d: ; 930d (2:530d)
	ld hl, sp+$e
	ld a, [hl]
	and $80
	jp z, Func_93c0
	push de
	callba_hli Func_da4dc
	ld a, [$c7da]
	or a
	jp z, Func_9371
	xor a
	ld [wOBP0], a
	ld [wBGP], a
	xor a
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Func_bfaf
	call Func_3aa8
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, $e0
	ld [wOBP1], a
	di
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	ei
	call Func_bfaf
	set_farcall_addrs_hli Func_c7bd0
	ld a, [$c867]
	call FarCall
Func_9371: ; 9371 (2:5371)
	ld hl, sp+$c
	ld a, [$c7e7]
	ld [hl], a
	ld hl, sp+$d
	ld a, [$c7e8]
	ld [hl], a
	ld hl, sp+$e
	ld a, [$c7e9]
	ld [hl], a
	ld hl, sp+$f
	ld a, [$c7ea]
	ld [hl], a
	ld a, [$c85f]
	ld [$c7e7], a
	ld a, [$c860]
	ld [$c7e8], a
	ld a, [$c85f]
	ld [$c7e9], a
	ld a, [$c860]
	ld [$c7ea], a
	callba_hli Func_14675
	pop de
	ld a, [$c84a]
	or a
	jp nz, Func_93ba
	jp Func_9413

Func_93ba: ; 93ba (2:53ba)
	push de
	xor a
	call Func_8ba8
	pop de
Func_93c0: ; 93c0 (2:53c0)
	ld a, e
	cp $ff
	jp nz, Func_93cd
	ld hl, sp+$e
	ld [hl], $ff
	jp Func_90fe

Func_93cd: ; 93cd (2:53cd)
	ld e, $0
	ld a, [$c838]
	call Func_943f
	ld a, [$c838]
	ld e, a
	xor a
	call Func_a783
	ld a, [$c84a]
	or a
	jp nz, Func_93e7
	jp Func_9413

Func_93e7: ; 93e7 (2:53e7)
	call Func_ad56
	cp $1
	jp nz, Func_93f2
	jp Func_9413

Func_93f2: ; 93f2 (2:53f2)
	call Func_b821
	cp $1
	jp z, Func_9409
	cp $ff
	jp z, Func_9406
	or a
	jp nz, Func_940c
	jp Func_9413

Func_9406: ; 9406 (2:5406)
	jp Func_940c

Func_9409: ; 9409 (2:5409)
	jp Func_90fe

Func_940c: ; 940c (2:540c)
	ld hl, sp+$e
	ld [hl], $0
	jp Func_90fe

Func_9413: ; 9413 (2:5413)
	add sp, $10
	ret

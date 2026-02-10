SECTION "Bank 1e", ROMX, BANK [$1e]
Data_78000:: ; 78000
	db $5a, $a5, $00, $00, $00, $a0, $1e, $00, $06, $00, $0a, $01, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $c3, $9d, $5e

Data_78018:: ; 78018
	db $00, $00

Data_7801a:: ; 7801a
	db $47, $42, $20, $4b, $49, $53, $53, $20, $4d, $45, $4e, $55, $20, $00

Data_78028:: ; 78028
	db $00, $00, $82, $82, $44, $44, $28, $28, $10, $10, $28, $28, $44, $44, $82, $82

Data_78038:: ; 78038
	db $00, $00, $10, $10, $38, $28, $38, $28, $7c, $44, $7c, $44, $fe, $82, $fe, $fe

Data_78048:: ; 78048
	db $00, $00, $38, $38, $7c, $44, $fe, $82, $fe, $82, $fe, $82, $7c, $44, $38, $38

Data_78058:: ; 78058
	db $00, $00, $10, $10, $38, $28, $7c, $44, $fe, $82, $7c, $44, $38, $28, $10, $10

Data_78068:: ; 78068
	db $00, $00, $38, $38, $7c, $44, $fe, $92, $fe, $aa, $fe, $92, $7c, $44, $38, $38

Data_78078:: ; 78078
	db $10, $10, $18, $18, $fc, $fc, $fe, $fe, $fc, $fc, $18, $18, $10, $10, $00, $00

SECTION "Predef 1e", ROMX [$4096], BANK [$1e]
Pointers_78096:: ; 78096
	dw Func_7bdc7
	dw Func_7bf2a
	dw Func_7be72
	dw Func_7beff
	dw Func_7be8b
	dw Func_7b25b
	dw Func_7a65c
	dw Func_7b72b
	dw Func_7b848
	dw Func_7b85e
	dw Func_7b93a
	dw Func_7b8eb
	dw Func_7bdec
	dw Func_7bdfe
	dw Func_7be3e
	dw Func_7bd42
	dw Func_7bd5b
	dw Func_7b767
	dw Func_7bdaa
	dw Func_7b7a9
	dw Func_7b776
	dw Func_7ad2a
	dw Func_7b21d
	dw Func_7ad4e
	dw Func_7ad6d
	dw Func_7addf
	dw Func_7ae29
	dw Func_7af61
	dw Func_7af75
	dw Func_7af8a
	dw Func_7af96
	dw Func_7afd5
	dw Func_7afe6
	dw Func_7b148
	dw Func_7b0b5
	dw Func_7b1e1
	dw Func_7b133
	dw Func_7ae86
	dw Func_7ae5e
	dw Func_7aa8e
	dw Func_7ac16
	dw Func_7ac23
	dw Func_7ac2a
	dw Func_7ac37
	dw Func_7ac56
	dw Func_7ac33
	dw Func_7ac62
	dw Func_7acbe
	dw Func_7ac89
	dw Func_7ac8d
	dw Func_7acd3
	dw Func_7aca0
	dw Func_7aca4

Func_78100:: ; 78100 (1e:4100)
	ld sp, wStackTop
	ld hl, Func_78100
	predef Func_7b133
	xor a
	ldh [hFFB7], a
	call Func_7898a
Func_7810e:: ; 7810e (1e:410e)
	call Func_78b33
	ld hl, hFFC0
	lb de, $ff, $44
	ld bc, $1
	predef Func_7c577
	ld a, $ff
	ldh [hFFC2], a
	xor a
	ldh [hFFC3], a
	ldh [hFFC1], a
asm_78125:
	call Func_787eb
	jp c, Func_0303
	and $1
	jp z, Func_782a6
	call Func_7890e
	ldh a, [hFF8A]
	bit 2, a
	jp nz, Func_78290
Func_7813a:: ; 7813a (1e:413a)
	call Func_78acb
	and $2
	jr nz, .asm_78154
	ld h, a
	ld l, c
	predef AnonJumpRelativeTable
	db 6
	; 4146
	dw Func_78159 - @
	dw Func_7841d - @
	dw Func_78164 - @
	dw Func_78290 - @
	dw Func_782b6 - @
	dw Func_783be - @
	dw .asm_78154 - @

.asm_78154
	call Func_78b36
	jr asm_78125

Func_78159:: ; 78159
	hlcoord 16, 4
	predef Func_7b0b5
	ld hl, Data_78fb1
	jp Func_783b4

Func_78164:: ; 78164
	ldh a, [hFFC0]
	ldh [hFFC2], a
	ldh a, [hFFC1]
	ldh [hFFC3], a
	call Func_78990
	push af
.asm_78170
	call Func_787eb
	jr c, .asm_7819b
	bit 0, a
	jr z, .asm_78170
	call Func_78990
	pop de
	ld e, a
	call Func_78235
	push de
	jr nz, .asm_7819b
	ld a, d
	cp e
	jr nz, .asm_7819b
	ld hl, Data_78fc1
	call Func_78bd2
	ld de, $b10
	call Func_783e2
	jr nz, .asm_7819b
	pop de
	call Func_781a9
	push af
.asm_7819b
	pop af
	ld a, $ff
	ldh [hFFC2], a
	jp Func_7810e

Func_781a3:: ; 781a3 (1e:41a3)
	hlcoord 16, 4
	predef Func_7c8ec
	ret

Func_781a9:: ; 781a9 (1e:41a9)
	ld e, $0
Func_781ab:: ; 781ab (1e:41ab)
	ld a, e
	cp d
	jp z, Func_7822d
	push de
	hlcoord 16, 4
	predef Func_7ae5e
	pop de
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	jr z, Func_7822d
	inc hl
	ld a, [hl]
	cp $ff
	jr z, Func_7822d
	push de
	call Func_7826d
	predef Func_7afe6
	pop de
	jr c, Func_7822d
	push de
	call Func_7878a
	pop hl
	push hl
	ld c, h
	aCoord 6, 5
	Coorda 18, 12, wAttrMap
	hlcoord 8, 12, wAttrMap
	predef Func_7caa0
	jr c, .asm_7822c
	aCoord 5, 5
	bit 0, a
	jr z, .asm_781f1
	call Func_78929
	hlcoord 8, 12, wAttrMap
	call Func_7892c
.asm_781f1
	hlcoord 16, 4
	ld de, wOAMBuffer
	ld bc, $100
	predef Func_7cc9a
	ld a, b
	or c
	jr z, .asm_7820a
	hlcoord 8, 12, wAttrMap
	ld de, wOAMBuffer
	predef Func_7cca9
	jr .asm_781f1

.asm_7820a
	decoord 10, 12, wAttrMap
	hlcoord 18, 4
	ld b, $3
.asm_78212
	ld a, [de]
	cp [hl]
	jr c, .asm_7821d
	jr nz, .asm_78224
	dec de
	dec hl
	dec b
	jr nz, .asm_78212
.asm_7821d
	hlcoord 8, 12, wAttrMap
	predef Func_7c8ec
	jr .asm_7822c

.asm_78224
	pop de
	push de
	call Func_78235
	call Func_781a3
.asm_7822c
	pop de
Func_7822d:: ; 7822d (1e:422d)
	inc e
	ld a, e
	cp $78
	jp c, Func_781ab
	ret

Func_78235:: ; 78235 (1e:4235)
	add sp, -$8
	ld hl, sp+$0
	push de
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop de
	ld hl, sp+$4
	push de
	ld e, d
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop de
	ld hl, sp+$4
	push de
	ld d, $fe
	ld bc, $4
	predef Func_7c5ca
	pop de
	ld hl, sp+$0
	push de
	ld e, d
	ld d, $fe
	ld bc, $4
	predef Func_7c5ca
	pop de
	ld hl, sp+$0
	ld a, [hli]
	or [hl]
	add sp, $8
	or a
	ret

Func_7826d:: ; 7826d (1e:426d)
	hlcoord 8, 12, wAttrMap
	decoord 8, 5
	aCoord 7, 5
	ld c, a
	ret

Func_78278:: ; 78278 (1e:4278)
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	ret z
	inc hl
	ld a, [hl]
	cp $ff
	ret

Func_78283:: ; 78283 (1e:4283)
	ld hl, Data_78f76
	call Func_78bd2
	ld a, $b4
	predef Func_7e0c2
	jp Func_7813a

Func_78290:: ; 78290 (1e:4290)
	call Func_78278
	jp z, Func_78283
	call Func_78632
	jp c, Func_7810e
	hlcoord 16, 4
	ld c, $1
	predef Func_7c96e
	jp Func_7810e

Func_782a6:: ; 782a6 (1e:42a6)
	ld hl, Data_78ca0
	call Func_79033
	call Func_78b5e
	xor a
	call Func_782f5
	jp Func_7810e

Func_782b6:: ; 782b6
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	jr z, .asm_782d7
	ld hl, Data_78f85
	call Func_78bd2
	ld de, $710
	call Func_783e2
	jp nz, Func_783d4
	aCoord 18, 4
	cp $ff
	jp z, Func_783b1
	call Func_781a3
.asm_782d7
	ld hl, Data_78cbe
	call Func_79033
	call Func_78b5e
	call Func_7901f
	jp nz, Func_78491
	call Func_78b5e
	call Func_78990
	call Func_782f5
	jp nz, Func_78491
	jp Func_7810e

Func_782f5:: ; 782f5 (1e:42f5)
	ld [wce0f], a
	ld hl, $ce00
	ld de, Data_78018
	ld bc, $f
	predef CopyPredef
	predef RandomPredef
	ld [$ce01], a
	xor a
	Coorda 16, 4
	Coorda 17, 4
	call Func_78764
	call Func_7835f
	jr c, .asm_7833d
	cp $1
	jr nz, .asm_7833d
	ld de, Data_79a8f
	ld hl, Data_78d06
	call Func_7908f
	call Func_7835f
	jr c, .asm_7833d
	cp $2
	jr nz, .asm_7833d
	hlcoord 16, 4
	ld c, $ff
	predef Func_7c96e
	ld de, Data_79b4f
	ld hl, Data_78d1e
	xor a
	jr .asm_7834f

.asm_7833d
	ld de, Data_79c0f
	ld hl, Data_78d5f
	ld a, [$ce00]
	cp $4
	jr nz, .asm_7834f
	ld hl, Data_78dfe
	or $1
.asm_7834f
	push af
	call Func_7908f
	call Func_7875c
	pop af
	ret

Func_78358:: ; 78358
.asm_78358
	predef Func_7e168
	and $2
	jr nz, .asm_78358
	ret

Func_7835f:: ; 7835f (1e:435f)
	predef FrameDelayPredef_7ceaf
	predef Func_7aa8e
	ld a, [$ce00]
	push af
	cp $5
	call z, Func_781a3
	predef Func_7e0d2
	pop af
	ret

Func_78370:: ; 78370 (1e:4370)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac8d
	jr asm_783ac

Func_78376:: ; 78376 (1e:4376)
	ld hl, $ce00
	ld [hl], a
	ld d, h
	ld e, l
	ld c, $1
	predef FrameDelayPredef_7ceaf
	predef Func_7aca4
	jr asm_783ac

Func_78384:: ; 78384 (1e:4384)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac16
	jr asm_783ac

Func_7838a:: ; 7838a (1e:438a)
	hlcoord 8, 12, wAttrMap
	predef FrameDelayPredef_7ceaf
	predef Func_7ac62
	jr asm_783ac

Func_78393:: ; 78393 (1e:4393)
	decoord 12, 17
Func_78396:: ; 78396 (1e:4396)
	predef FrameDelayPredef_7ceaf
	predef Func_7acd3
	jr asm_783ac

Func_7839c:: ; 7839c (1e:439c)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac56
	jr asm_783ac

Func_783a2:: ; 783a2 (1e:43a2)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac37
	jr asm_783ac

Func_783a8:: ; 783a8 (1e:43a8)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac2a
asm_783ac:
	push af
	predef Func_7e0d2
	pop af
	ret

Func_783b1:: ; 783b1 (1e:43b1)
	ld hl, Data_78f66
Func_783b4:: ; 783b4 (1e:43b4)
	call Func_78bd2
	ld a, $b4
	predef Func_7e0c2
	jp Func_7813a

Func_783be:: ; 783be
	call Func_78278
	jr z, Func_783b1
	call Func_783f1
	ld hl, Data_78f0f
	call Func_783dc
	jr nz, Func_783d4
	call Func_781a3
	jp Func_7810e

Func_783d4:: ; 783d4 (1e:43d4)
	ldh a, [hFFC1]
	call Func_78a36
	jp Func_7813a

Func_783dc:: ; 783dc (1e:43dc)
	call Func_78bd2
	ld de, $710
Func_783e2:: ; 783e2 (1e:43e2)
	ld a, $1
	ld bc, $2308
	ld hl, $302
	predef Func_7de32
	or a
	ret nz
	bit 1, h
	ret

Func_783f1:: ; 783f1 (1e:43f1)
	call Func_78b52
	ret c
	push af
	ld hl, $68
	predef Func_7d918
	hlcoord 16, 4
	predef Func_7c881
	ld e, d
	pop af
	cp e
	ret nc
	call Func_78b45
	ld hl, Data_7840d
	predef Func_7af96
	ret

Data_7840d:: ; 7840d
	db $b4, $d8, $b1, $0f, $c9, $b1, $b7, $b6, $de, $c3, $de, $b7, $cf, $bd, $0e, $00

Func_7841d:: ; 7841d
	ld a, $c4
	ld h, $4
	ld bc, $301
	ld de, $d12
	predef Func_7d753
	ld de, $0
	ld hl, Data_784a6
	predef Func_7afd5
	call Func_78526
	ld bc, $a
	hlcoord 16, 4
	call Func_78965
	ld hl, $753
Func_78440:: ; 78440 (1e:4440)
	ld de, $8865
	ld bc, $791
	predef Func_7ea15
	ld hl, $153
	predef Func_7d918
	ld hl, Data_78510
	predef Func_7af96
	ld hl, wOAMBuffer
	lb de, $ff, $46
	ld bc, $a
	predef Func_7c577
	xor a
	ld [wOAM02VTile], a
	ld hl, wOAMBuffer
	call Func_785dd
	ld hl, $15c
	predef Func_7d918
	ld hl, Data_78518
	predef Func_7af96
	add sp, -$4
	ld hl, sp+$0
	lb de, $ff, $40
	ld bc, $4
	predef Func_7c577
	pop de
	pop bc
	ld hl, wOAMBuffer
	predef PrintNumLongPredef
	ld hl, wOAM01YCoord
	predef Func_7af96
.asm_78489
	predef DelayFrame
	predef Func_7e17c
	and $3
	jr z, .asm_78489
Func_78491:: ; 78491 (1e:4491)
	call Func_78997
	call Func_7879d
	ld a, h
	call Func_78a36
	call Func_7890e
	jp Func_7813a

Func_784a1:: ; 784a1 (1e:44a1)
	ld a, $32
	predef Func_7e0c2
	ret

Data_784a6:: ; 784a6
	db $0f, $c5, $cf, $b4, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $b4, $d8, $b1, $20, $0f, $bd, $b3, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $ce, $df, $b2, $dd, $c4, $0f, $b6, $c1, $0e, $3a, $00, $20, $20, $20, $20, $20, $20, $cc, $a7, $b2, $d9, $0f, $bc, $de, $af, $ba, $b3, $3a, $0e, $00, $0f, $20, $2d, $2d, $2d, $20, $c2, $b3, $bc, $dd, $20, $d8, $da, $b7, $20, $2d, $2d, $2d, $0e, $00, $0f, $bb, $b8, $bc, $ac, $3a, $0e, $00, $4e, $6f, $2e, $31, $3a, $00, $4e, $6f, $2e, $32, $3a, $00, $4e, $6f, $2e, $33, $3a, $00, $00

Data_78510:: ; 78510
	db $d5, $b0, $bb, $de, $b0, $20, $3a, $00

Data_78518:: ; 78518
	db $ce, $df, $b2, $dd, $c4, $0f, $ba, $de, $b3, $b9, $b2, $3a, $0e, $00

Func_78526:: ; 78526 (1e:4526)
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	ret z
	hlcoord 3, 5
	ld a, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push hl
	ld d, $0
	or a
	jr z, .asm_7853a
	inc de
.asm_7853a
	ld hl, wOAMBuffer
	predef PrintNumShortPredef
	ld hl, $d01
	predef Func_7d905
	ld hl, wOAM00XCoord
	predef Func_7af96
	pop hl
	aCoord 18, 4
	ld bc, $111b
	call Func_785ec
.asm_78551
	push de
	ld a, [hli]
	dec a
	inc hl
	bit 4, d
	jr z, .asm_78563
	bit 3, d
	jr z, .asm_78561
	sub $60
.asm_78561
	sub $60
.asm_78563
	ld c, a
	ld b, $0
	ld e, l
	ld d, h
	ld hl, wOAMBuffer
	push hl
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	ld [hl], $0
	ld hl, $400
	predef Func_7d905
	ld hl, wOAMBuffer
	predef Func_7af96
	pop de
	bit 0, d
	ret z
	call Func_78934
	ld hl, $d02
	predef Func_7d905
	ld hl, wOAMBuffer
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	ld hl, wOAM0bVTile
	ld bc, $0
	predef PrintNumLongPredef
	ld hl, wOAM0dYCoord
	predef Func_7af96
	pop de
	ld hl, $505
.asm_785a3
	push hl
	push de
	predef Func_7d905
	ld hl, wOAM0bVTile
	ld bc, $a
	predef CopyPredef
	xor a
	ld [wOAM0eYCoord], a
	ld hl, wOAM0bVTile
	call Func_785dd
	pop hl
	ld bc, $a
	add hl, bc
	ld a, [hli]
	pop de
	push de
	push hl
	ld l, e
	ld h, $f
	ld e, a
	ld d, $0
	predef Func_7d905
	ld hl, wOAM0bVTile
	predef PrintNumShortPredef
	ld hl, wOAM0cXCoord
	predef Func_7af96
	pop de
	pop hl
	inc l
	ld a, l
	cp $9
	jr c, .asm_785a3
	ret

Func_785dd:: ; 785dd (1e:45dd)
	ldh a, [hFF92]
	push af
	or $40
	ldh [hFF92], a
	predef Func_7af96
	pop af
	and $fb
	ldh [hFF92], a
	ret

Func_785ec:: ; 785ec (1e:45ec)
	cp $ff
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	push hl
	push de
	push bc
	jr z, .asm_78617
	or a
	jr z, .asm_78605
	ld hl, Byte_0014
	cp [hl]
	jr z, .asm_78605
	ld de, Data_78028
	jr .asm_7861f

.asm_78605
	bit 2, d
	jr z, .asm_7861c
	bit 1, d
	jr z, .asm_78612
	ld de, Data_78058
	jr .asm_7861f

.asm_78612
	ld de, Data_78048
	jr .asm_7861f

.asm_78617
	ld de, Data_78068
	jr .asm_7861f

.asm_7861c
	ld de, Data_78038
.asm_7861f
	ld hl, wOAMBuffer
	ld bc, $10
	push hl
	predef CopyPredef
	pop hl
	ld bc, $108
	pop de
	predef Func_7dde6
	pop de
	pop hl
	ret

Func_78632:: ; 78632 (1e:4632)
	call Func_79019
	scf
	ret nz
	call Func_78764
	ld hl, $ce00
	ld de, $ce00
	ld c, $10
	call Func_78370
	ld a, $3
	jp c, Func_7871b
	ld hl, Data_7801a
	ld de, $ce02
	ld bc, $d
	predef Func_7af75
	ld a, h
	or l
	ld hl, Data_78d8d
	ld a, $6
	jp nz, Func_78741
	ld a, [$ce00]
	or a
	jp nz, Func_78741
	ld a, [wce0f]
	push af
	ld a, $1
	call Func_78376
	call Func_78384
.asm_78672
	ld hl, Data_78cd8
	ld de, Data_79a8f
	call Func_7908f
	call Func_7826d
	call Func_783a8
	pop bc
	jp c, Func_7869a
	push bc
	ld hl, Data_78dc6
	call Func_78bd2
	ld de, $c10
	call Func_783e2
	jp nz, Func_78737
	call Func_7838a
	jr .asm_78672

Func_7869a:: ; 7869a (1e:469a)
	cp $ff
	jp z, Func_7871b
	push bc
	ld a, $5
	call Func_78376
	call Func_7878a
	pop af
	ld c, a
	ld a, $ff
	Coorda 18, 12, wAttrMap
	hlcoord 8, 12, wAttrMap
	call Func_783a2
	jr nc, .asm_786c2
	cp $ff
	jr z, asm_78719
	ld hl, Data_78d36
	ld a, $4
	jr asm_78740

.asm_786c2
	push hl
	ld hl, sp+$0
	ld d, h
	ld e, l
	ld hl, $ce00
	ld c, $2
	push hl
	call Func_78370
	pop hl
	pop bc
	ld a, [hli]
	cp c
	jr nz, asm_78719
	ld a, [hl]
	cp b
	jr nz, asm_78719
	aCoord 5, 5
	bit 0, a
	jr z, asm_78700
	hlcoord 16, 4
	decoord 12, 17
	predef Func_7cbed
	jr c, asm_78721
	ld a, b
	or c
	jr z, asm_78721
	push bc
	ld de, hFFD2
	ld b, $0
	call Func_7839c
	pop bc
	jr c, asm_78719
	call Func_78393
	jr c, asm_78719
asm_78700:
	hlcoord 16, 4
	decoord 12, 17
	ld bc, $100
	predef Func_7cc9a
	jr c, asm_78721
Func_7870d:: ; 7870d (1e:470d)
	ld a, b
	or c
	jr z, asm_78721
	call Func_78393
	jr nc, asm_78700
	call Func_7838a
asm_78719:
	ld a, $5
Func_7871b:: ; 7871b (1e:471b)
	ld hl, Data_78d5f
	scf
	jr Func_78741

asm_78721:
	call Func_78769
	jr c, asm_78719
	ld a, $2
	call Func_78376
	ld hl, Data_78cef
	ld de, Data_79b4f
	xor a
	call Func_78752
	xor a
	ret

Func_78737:: ; 78737 (1e:4737)
	call Func_78358
	ld hl, Data_78dfa
	ld a, $7
	pop bc
asm_78740:
	or a
Func_78741:: ; 78741 (1e:4741)
	push af
	jr c, .asm_78749
	push hl
	call Func_78376
	pop hl
.asm_78749
	ld de, Data_79c0f
	pop af
	call Func_78752
	scf
	ret

Func_78752:: ; 78752 (1e:4752)
	push af
	call Func_7908f
	pop af
	jr c, Func_7875c
	call Func_78384
Func_7875c:: ; 7875c (1e:475c)
	xor a
	predef Func_7c19f
	ld a, $b4
	predef Func_7e0c2
	ret

Func_78764:: ; 78764 (1e:4764)
	ld a, $1
	predef Func_7c19f
	ret

Func_78769:: ; 78769 (1e:4769)
	hlcoord 5, 5
	ld a, [hli]
	push hl
	inc hl
	ld b, $0
	bit 0, a
	ld a, $fe
	jr z, .asm_78779
	sub $2e
.asm_78779
	sub [hl]
	ld e, a
	ld a, $ff
	sbc b
	ld d, a
	call Func_7839c
	pop de
	ret c
	ld bc, $1
	jp Func_78396

Func_7878a:: ; 7878a (1e:478a)
	hlcoord 1, 5
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	inc hl
	ld b, [hl]
	ret

Func_7879d:: ; 7879d (1e:479d)
	ld hl, $c800
	ld bc, $20
	ldh a, [hFFC0]
	ld e, a
.asm_787a6
	push bc
	push de
	push hl
	predef Func_7ae5e
	pop hl
	pop de
	pop bc
	call Func_78965
	jr nc, .asm_787b7
	inc e
	inc h
	jr .asm_787a6

.asm_787b7
	ldh a, [hFFC1]
Func_787b9:: ; 787b9 (1e:47b9)
	ld de, $c3c
	ld h, a
	ld bc, $0
	cp $3
	jr c, .asm_787ca
	ld c, $1
	ld e, $5c
	sub $3
.asm_787ca
	or a
Func_787cb:: ; 787cb (1e:47cb)
	ret z
	dec a
	jr z, .asm_787d4
	inc b
	ld a, d
	add $28
	ld d, a
.asm_787d4
	inc b
	ld a, d
	add $28
	ld d, a
	ret

Data_787da:: ; 787da
	db $04, $00, $00, $00, $00, $10, $00, $02, $00, $00, $20, $10, $00, $10, $20, $12, $00

Func_787eb:: ; 787eb (1e:47eb)
	ld hl, hFFC0
	ld de, rLY
	ld bc, $1
	predef Func_7c5ca
.asm_787f6
	ldh a, [hFFC2]
	ld c, a
	ldh a, [hFFC0]
	cp c
.asm_787fc
	jr nz, .asm_7880c
	ldh a, [hFFC3]
	call Func_787b9
	ld hl, Data_787da
	ld a, $1c
	predef Func_7ad2a
	jr .asm_78811

.asm_7880c
	ld bc, $41c
	predef Func_7d8c8
.asm_78811
	call Func_7879d
Func_78814:: ; 78814
.asm_78814
	call Func_78fec
	push af
	ld a, h
	ldh [hFFC1], a
	pop af
	or a
	bit 0, a
	ret nz
	bit 3, a
	ret nz
	bit 1, a
	scf
	ret nz
	ld l, a
	ldh a, [hFF8A]
	bit 4, l
	jr nz, asm_78877
	bit 6, l
	jp nz, Func_788d7
	bit 7, l
	jp nz, Func_788f2
	bit 5, l
	jr z, .asm_78814
	ld l, $e2
	bit 2, a
	jr nz, asm_788af
	ld a, b
	or a
	jr z, .asm_7884f
	dec b
	dec h
	ld a, d
	sub $28
	ld d, a
	jp Func_78814

.asm_7884f
	ld a, c
	or a
	jr z, .asm_7885e
	ld b, $2
	ld c, $0
	dec h
	ld de, Data_79c3c
	jp Func_78814

.asm_7885e
	ld l, $5
Func_78860:: ; 78860 (1e:4860)
	ldh a, [hFFC0]
	or a
	jp z, Func_78814
	ldh a, [hFFC1]
	add l
	ldh [hFFC1], a
	ldh a, [hFFC0]
	sub $6
	jr nc, .asm_78872
	xor a
.asm_78872
	ldh [hFFC0], a
	jp Func_787eb

asm_78877:
	ld l, $1e
	bit 2, a
	jr nz, asm_788af
	ld a, b
	cp $2
	jr z, .asm_7888b
	inc h
	inc b
	ld a, d
	add $28
	ld d, a
	jp Func_78814

.asm_7888b
	ld a, c
	or a
	jr nz, .asm_7889a
	ld b, $0
	ld c, $1
	inc h
	ld de, $c5c
	jp Func_78814

.asm_7889a
	ld l, $5
Func_7889c:: ; 7889c (1e:489c)
	ldh a, [hFFC0]
	add $6
	cp $78
	jp nc, Func_787eb
	ldh [hFFC0], a
	ldh a, [hFFC1]
	sub l
	ldh [hFFC1], a
	jp Func_787eb

asm_788af:
	push hl
	ldh a, [hFFC0]
	ld e, a
	ld d, $0
	ld hl, $1e
	push hl
	predef DivideSignedShortPredef
	pop de
	predef MultiplySignedShortPredef
	ld a, l
	pop hl
	jr asm_788c4

asm_788c2:
	ldh a, [hFFC0]
asm_788c4:
	add l
	cp $c4
	jr nc, .asm_788d0
	cp $78
	jr c, .asm_788d2
	xor a
	jr .asm_788d2

.asm_788d0
	sub $88
.asm_788d2
	ldh [hFFC0], a
	jp Func_787eb

Func_788d7:: ; 788d7 (1e:48d7)
	ld l, $fa
	bit 2, a
	jr nz, asm_788c2
	ld a, c
	or a
	jr nz, .asm_788e6
	ld l, $3
	jp Func_78860

.asm_788e6
	dec c
	ld a, h
	sub $3
	ld h, a
	ld a, e
	sub $20
	ld e, a
	jp Func_78814

Func_788f2:: ; 788f2 (1e:48f2)
	ld l, $6
	bit 2, a
	jr nz, asm_788c2
	ld a, c
	cp $1
	jr nz, .asm_78902
	ld l, $3
	jp Func_7889c

.asm_78902
	ld a, h
	add $3
	ld h, a
	inc c
	ld a, e
	add $20
	ld e, a
	jp Func_78814

Func_7890e:: ; 7890e (1e:490e)
	push de
	ld a, h
	ld de, $c800
	add d
	ld d, a
	hlcoord 16, 4
	ld bc, $100
	predef CopyPredef
	pop de
	ld a, $0
	ld hl, $0
	ld bc, $502
	predef Func_7d6cc
	ret

Func_78929:: ; 78929 (1e:4929)
	hlcoord 16, 4
Func_7892c:: ; 7892c (1e:492c)
	ld de, hFFD2
	ld b, $0
	predef Func_7cb98
	ret

Func_78934:: ; 78934 (1e:4934)
	aCoord 18, 4
	cp $ff
	jr z, .asm_7894a
	call Func_78929
	hlcoord 16, 4
	ld de, wOAMBuffer
	ld bc, $2e
	predef Func_7cc9a
	ret

.asm_7894a
	hlcoord 16, 4
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld de, hFFD2
	add hl, de
	ld d, h
	ld e, l
	ld hl, wOAMBuffer
	ld bc, $2e
	predef CopyPredef
	ret

Func_78965:: ; 78965 (1e:4965)
	push hl
	push de
	push bc
	decoord 12, 17
	predef Func_7addf
	hlcoord 12, 17
	pop de
	push de
	ld bc, $418
	predef Func_7dde6
	pop bc
	pop de
	pop hl
	ld a, b
	add $5
	ld b, a
	cp $f
	ret c
	ld b, $0
	ld a, c
	add $20
	ld c, a
	cp $60
	ret

Func_7898a:: ; 7898a (1e:498a)
	predef Func_7c456
	ret nc
	jp Func_7a6ee

Func_78990:: ; 78990 (1e:4990)
	ldh a, [hFFC0]
	ld c, a
	ldh a, [hFFC1]
	add c
	ret

Func_78997:: ; 78997 (1e:4997)
	ld a, $a4
	ld h, $4
	ld bc, $101
	ld de, $e0e
	predef Func_7d753
	ld hl, $1200
	predef Func_7e064
	ld a, $e4
	ldh [hOBP0], a
	ld a, $1b
	ldh [hOBP1], a
	ld de, $0
	ld bc, $1005
	predef Func_7bdfe
	ld a, $80
	ld hl, $e01
	ld de, $101
	ld bc, $e03
	predef Func_7be3e
	ld a, $83
	ld hl, $e01
	ld de, $105
	ld bc, $e09
	predef Func_7be3e
	ld de, $e
	ld bc, $1004
	predef Func_7bdfe
	ld a, $8c
	ld hl, $e01
	ld de, $10f
	ld bc, $e02
	predef Func_7be3e
	ld de, Data_79d33
	ld bc, wOAMBuffer
	predef Func_7ad4e
	ld de, $8000
	ld bc, $380
	predef Func_7ad6d
	ld a, $7
	predef Func_7d78e
	ld h, $a
	ld d, $8c
Func_789ff:: ; 789ff (1e:49ff)
	ld e, $14
	ld l, $14
	call Func_78a28
	ld e, $2c
	ld l, $1a
	call Func_78a26
	ld e, $44
	ld l, $20
	call Func_78a26
	ld e, $5c
	ld l, $26
	call Func_78a26
	ld e, $74
	ld l, $2c
	call Func_78a26
	ld e, $8c
	ld l, $32
Func_78a26:: ; 78a26 (1e:4a26)
	ld h, $ff
Func_78a28:: ; 78a28 (1e:4a28)
	ld b, $0
Func_78a2a:: ; 78a2a (1e:4a2a)
	push de
	push hl
	ld a, h
	ld h, b
	ld bc, $301
	predef Func_7d6cc
	pop hl
	pop de
	ret

Func_78a36:: ; 78a36 (1e:4a36)
	push bc
	push de
	push hl
	push af
	push af
	ld hl, wOAMBuffer
	ld e, $0
	ld bc, $11
	predef Func_7d5e7
	ld hl, $60
	predef Func_7d918
	pop af
	ld hl, $c800
	add h
	ld h, a
	push hl
	ld a, [hli]
	or [hl]
	jr z, .asm_78a7c
	ld de, $8
	add hl, de
	ld b, [hl]
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	inc hl
	bit 4, b
	jr z, .asm_78a6b
	sub $60
	bit 3, b
	jr z, .asm_78a6b
	sub $60
.asm_78a6b
	dec a
	cp $10
	jr c, .asm_78a72
	ld a, $10
.asm_78a72
	ld c, a
	ld b, $0
	ld e, l
	ld d, h
	ld hl, wOAMBuffer
	predef CopyPredef
.asm_78a7c
	ld hl, wOAMBuffer
	predef Func_7af96
	ld a, $e
	predef Func_7d9f9
	ld a, $e
	predef Func_7d91f
	ld hl, $68
	predef Func_7d918
	pop hl
	ld a, [hli]
	or [hl]
	jr z, .asm_78aa3
	push af
	push hl
	inc hl
	ld a, [hl]
	ld de, $7
	add hl, de
	ld bc, $d60
	call Func_785ec
	pop hl
	pop af
.asm_78aa3
	ld bc, $7
	add hl, bc
	ld e, [hl]
	inc e
	or a
	jr nz, .asm_78aad
	ld e, a
.asm_78aad
	call Func_78b45
	ld hl, Data_78ac2
	predef Func_7af96
	ldh a, [hFFC0]
	pop de
	add d
	ld e, a
	inc e
	call Func_78b45
	pop hl
	pop de
	pop bc
	ret

Data_78ac2:: ; 78ac2
	db $b4, $d8, $b1, $20, $20, $4e, $6f, $2e, $00

Func_78acb:: ; 78acb (1e:4acb)
	ld de, $8c14
	ld hl, $a14
	ld c, $0
Func_78ad3:: ; 78ad3 (1e:4ad3)
	ld a, c
	call Func_78b88
.asm_78ad7
	push bc
	ld b, $11
	call Func_78a2a
	call Func_784a1
	jr nz, .asm_78aec
	call Func_78a28
	call Func_784a1
.asm_78ae7
	pop bc
	jr z, .asm_78ad7
	push bc
.asm_78aec
	push af
	call Func_78a28
	pop af
	pop bc
	ld b, a
	and $3
	ret nz
	bit 6, b
	jr nz, .asm_78b1f
	bit 7, b
	jr z, .asm_78ad7
	ld a, c
	cp $5
	jp z, Func_78acb
	inc c
	ld a, e
	add $18
	ld e, a
	ld a, h
	add $3
	ld h, a
	ld a, l
	add $6
	ld l, a
	jp Func_78ad3

.asm_78b14
	ld c, $5
	ld de, $8c8c
	ld hl, $1932
	jp Func_78ad3

.asm_78b1f
	ld a, c
	or a
	jr z, .asm_78b14
	dec c
	ld a, e
	sub $18
	ld e, a
	ld a, h
	sub $3
	ld h, a
	ld a, l
	sub $6
	ld l, a
	jp Func_78ad3

Func_78b33:: ; 78b33 (1e:4b33)
	call Func_78997
Func_78b36:: ; 78b36 (1e:4b36)
	ld hl, Data_78f3b
	call Func_78bd2
	ld hl, $90e
	predef Func_7d918
	xor a
	predef Func_7c926
	ld e, c
Func_78b45:: ; 78b45 (1e:4b45)
	ld d, $0
	ld hl, wOAMBuffer
	predef PrintNumShortPredef
	ld hl, wOAM00Attrs
	predef Func_7af96
	ret

Func_78b52:: ; 78b52 (1e:4b52)
	ld a, $1
	predef Func_7c926
	ld a, b
	or a
	ret z
	ld a, e
	cp $20
	ccf
	ret

Func_78b5e:: ; 78b5e (1e:4b5e)
	ld hl, $0
	predef Func_7d918
	call Func_78b52
	jr nc, .asm_78b6d
	ld a, $10
	predef Func_7d91f
	ret

.asm_78b6d
	ld e, a
	ld d, $0
	push af
	ld hl, wOAMBuffer
	predef PrintNumShortPredef
	pop af
	ld hl, Data_78c8a
	or a
	jr z, .asm_78b85
	ld hl, wOAM01YCoord
	predef Func_7af96
	ld hl, Data_78c77
.asm_78b85
	predef Func_7af96
	ret

Func_78b88:: ; 78b88 (1e:4b88)
	push bc
	push de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_78bf6
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_78bd2
	pop hl
	pop de
	pop bc
	ret

Func_78b9d:: ; 78b9d (1e:4b9d)
	push hl
	ld h, $0
	ld l, a
	predef Func_7d918
	pop hl
	ret

asm_78ba5:
	push hl
	ld hl, Data_78c15
	call Func_78bd2
	ld a, $10
	call Func_78b9d
	ld a, $20
	predef Func_7d93e
	predef Func_7af96
	pop hl
	jr asm_78be1

asm_78bba:
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	predef Func_7af96
	pop hl
	inc hl
	jr asm_78be1

asm_78bc4:
	push hl
	ld hl, Data_78c02
	call Func_78bd2
	pop hl
	jr Func_78bd2

asm_78bce:
	ld a, $e
	predef Func_7d9f9
Func_78bd2:: ; 78bd2 (1e:4bd2)
	ld a, [hli]
	cp $ff
	ret z
	cp $fe
	jr z, asm_78bc4
	cp $fd
	jr z, asm_78ba5
	call Func_78b9d
asm_78be1:
	ld a, [hli]
	or a
	jr z, asm_78bce
	cp $fc
	jr z, asm_78bba
	sub $e0
	jr c, .asm_78bf1
	predef Func_7d91f
	jr asm_78be1

.asm_78bf1
	dec hl
	predef Func_7af96
	jr asm_78be1

Data_78bf6:: ; 78bf6
	db $28, $4e, $44, $4e, $65, $4e, $9b, $4e, $b9, $4e, $ef, $4e

Data_78c02:: ; 78c02
	db $00, $20, $20, $20, $0f, $ba, $c9, $00, $fc, $26, $4c, $ca, $00, $ee, $00, $08, $ee, $00, $ff

Data_78c15:: ; 78c15
	db $08, $0f, $20, $20, $20, $be, $dd, $c0, $b8, $bc, $c3, $b2, $d9, $00, $ee, $00, $ff, $0e, $cc, $a7, $b2, $d9, $0f, $00, $c3, $de, $b7, $cf, $be, $dd, $00, $0f, $ca, $b2, $20, $b2, $b2, $b4, $00, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2, $0f, $00, $ce, $de, $c0, $dd, $0f, $a6, $20, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $0f, $b1, $b7, $0e, $b4, $d8, $b1, $0f, $bd, $b3, $b6, $de, $c0, $d8, $cf, $be, $dd, $00, $0f, $b1, $b7, $0e, $b4, $d8, $b1, $0f, $a6, $20, $b6, $b8, $ce, $00

Data_78c77:: ; 78c77
	db $b4, $d8, $b1, $0f, $cf, $c3, $de, $bc, $de, $ad, $bc, $dd, $b6, $c9, $b3, $c3, $de, $bd, $00

Data_78c8a:: ; 78c8a
	db $0f, $bc, $de, $ad, $bc, $dd, $0e, $b4, $d8, $b1, $0f, $b6, $de, $20, $b1, $b2, $c3, $b2, $cf, $be, $dd, $00

Data_78ca0:: ; 78ca0
	db $08, $0f, $c2, $b3, $bc, $dd, $a6, $20, $c1, $ad, $b3, $bc, $bd, $d9, $ca, $de, $b1, $b2, $ca, $00, $00, $10, $42, $00, $fc, $47, $4c, $f0, $00, $ff

Data_78cbe:: ; 78cbe
	db $08, $fc, $3c, $4c, $c4, $de, $b3, $bc, $a6, $20, $b8, $af, $c2, $b9, $c3, $00, $00, $10, $41, $00, $fc, $47, $4c, $f0, $00, $ff

Data_78cd8:: ; 78cd8
	db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b5, $b8, $af, $c3, $b2, $cf, $bd, $00, $f0, $00, $10, $f0, $00, $ff

Data_78cef:: ; 78cef
	db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b5, $b8, $d8, $cf, $bc, $c0, $21, $00, $f0, $00, $10, $f0, $00, $ff

Data_78d06:: ; 78d06
	db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $af, $c3, $b2, $cf, $bd, $00, $f0, $00, $10, $f0, $00, $ff

Data_78d1e:: ; 78d1e
	db $00, $f0, $00, $08, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $d8, $cf, $bc, $c0, $21, $00, $f0, $00, $10, $f0, $00, $ff

Data_78d36:: ; 78d36
	db $00, $0f, $b1, $b2, $c3, $c9, $00, $fc, $3c, $4c, $c9, $00, $f0, $00, $08, $fc, $57, $4c, $f0, $00, $10, $0f, $b6, $b8, $ce, $bc, $c3, $20, $d3, $d7, $af, $c3, $b8, $c0, $de, $bb, $b2, $00, $f0, $00, $ff

Data_78d5f:: ; 78d5f
	db $00, $0f, $c2, $b3, $bc, $dd, $a6, $20, $bc, $af, $ca, $df, $b2, $bc, $cf, $bc, $c0, $00, $f0, $00, $08, $f0, $00, $10, $0f, $d3, $b3, $b2, $c1, $c4, $de, $d4, $d8, $c5, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $20, $00, $00, $ff

Data_78d8d:: ; 78d8d
	db $00, $0f, $b1, $b2, $c3, $c9, $00, $fc, $3c, $4c, $b6, $de, $00, $f0, $00, $08, $47, $42, $20, $4b, $49, $53, $53, $20, $d2, $c6, $ad, $b0, $0f, $c9, $00, $f0, $00, $10, $0f, $bc, $de, $ad, $bc, $dd, $bc, $de, $ae, $b3, $c0, $b2, $c3, $de, $b1, $d8, $cf, $be, $dd, $20, $00, $00, $ff

Data_78dc6:: ; 78dc6
	db $00, $0f, $b1, $b2, $c3, $c6, $20, $b5, $c5, $bc, $de, $00, $fc, $26, $4c, $b6, $de, $00, $f0, $00, $08, $0f, $bf, $dd, $bb, $de, $b2, $bc, $cf, $bd, $00, $f0, $00, $10, $0f, $b3, $dc, $b6, $de, $b7, $bc, $cf, $bd, $b6, $3f, $00, $fc, $34, $4c, $f0, $00, $ff

Data_78dfa:: ; 78dfa
	db $10, $f0, $00, $ff

Data_78dfe:: ; 78dfe
	db $00, $fc, $57, $4c, $f0, $00, $08, $0f, $b2, $b8, $c2, $b6, $00, $fc, $26, $4c, $0f, $a6, $bb, $b8, $bc, $de, $ae, $bc, $c3, $00, $f0, $00, $10, $fc, $69, $4c, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $00, $ff, $00, $e3, $3c, $20, $bd, $c0, $b0, $c4, $20, $3e, $00, $ee, $00, $fd, $a6, $bc, $de, $af, $ba, $b3, $bc, $cf, $bd, $20, $0e, $00, $00, $ff, $00, $20, $3c, $00, $fc, $26, $4c, $20, $bc, $de, $ae, $b3, $ce, $b3, $3e, $20, $00, $00, $fd, $c9, $bc, $de, $ae, $b3, $ce, $b3, $c3, $de, $bd, $20, $00, $00, $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $b2, $da, $b6, $b4, $20, $3e, $20, $00, $00, $08, $0f, $20, $be, $dd, $c0, $b8, $bc, $c0, $20, $00, $fc, $26, $4c, $c4, $20, $00, $00, $10, $0f, $20, $20, $ca, $de, $bc, $ae, $a6, $b2, $da, $b6, $b4, $cf, $bd, $00, $ee, $00, $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $bf, $b3, $bc, $dd, $20, $3e, $20, $00, $00, $fd, $a6, $bf, $b3, $bc, $dd, $bc, $cf, $bd, $20, $00, $00, $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $bc, $de, $ad, $bc, $dd, $20, $3e, $20, $00, $00, $08, $0f, $20, $20, $20, $be, $dd, $c0, $b8, $cc, $de, $cc, $de, $dd, $c6, $00, $ee, $00, $10, $20, $00, $fc, $26, $4c, $a6, $20, $b3, $b9, $c4, $d8, $cf, $bd, $20, $00, $00, $ff, $00, $20, $3c, $20, $00, $fc, $26, $4c, $bb, $b8, $bc, $de, $ae, $20, $3e, $20, $00, $00, $fd, $a6, $bb, $b8, $bc, $de, $ae, $bc, $cf, $bd, $20, $00, $00, $ff

Data_78f0f:: ; 78f0f
	db $00, $0f, $20, $ce, $dd, $c4, $b3, $c6, $bb, $b8, $bc, $de, $ae, $bc, $c3, $00, $ee, $00, $08, $fc, $2f, $4f, $ee, $00, $10, $e4, $fc, $34, $4c, $ee, $00, $ff, $20, $0f, $d6, $db, $bc, $b2, $c3, $de, $bd, $b6, $3f, $00

Data_78f3b:: ; 78f3b
	db $00, $ee, $00, $08, $ee, $00, $10, $ee, $00, $02, $20, $47, $42, $20, $4b, $49, $53, $53, $20, $d2, $c6, $ad, $b0, $00, $00, $0e, $0f, $20, $c4, $b3, $db, $b8, $00, $fc, $26, $4c, $20, $20, $20, $ba, $00, $00, $ff

Data_78f66:: ; 78f66
	db $fe, $10, $e2, $0f, $bb, $b8, $bc, $de, $ae, $00, $fc, $2d, $4c, $ee, $00, $ff

Data_78f76:: ; 78f76
	db $fe, $10, $e2, $0f, $bf, $b3, $bc, $dd, $00, $fc, $2d, $4c, $ee, $00, $ff

Data_78f85:: ; 78f85
	db $00, $0f, $20, $20, $ba, $c9, $00, $fc, $26, $4c, $a6, $b9, $bc, $c3, $00, $ee, $00, $08, $0f, $20, $ba, $ba, $c6, $bc, $de, $ad, $bc, $dd, $bc, $cf, $bd, $b6, $3f, $00, $ee, $00, $10, $e4, $fc, $34, $4c, $ee, $00, $ff

Data_78fb1:: ; 78fb1
	db $fe, $10, $e2, $0f, $bc, $de, $af, $ba, $b3, $00, $fc, $2d, $4c, $ee, $00, $ff

Data_78fc1:: ; 78fc1
	db $00, $0f, $c5, $b2, $cc, $de, $0e, $c3, $de, $b0, $c0, $0f, $c9, $20, $c5, $d7, $cd, $de, $b6, $b4, $c3, $de, $00, $00, $08, $fc, $69, $4c, $bc, $cf, $bd, $20, $00, $00, $10, $fc, $30, $4f, $fc, $34, $4c, $00, $ff

Func_78fec:: ; 78fec (1e:4fec)
	push bc
	push de
	push hl
	ld a, h
	call Func_78a36
.asm_78ff3
	ld h, $0
	push de
	push hl
	ld a, $0
	ld l, $0
	ld bc, $502
	predef Func_7d6cc
	call Func_784a1
	jr nz, .asm_79013
	ld bc, $a00
	predef Func_7d8c8
	call Func_784a1
	jr nz, .asm_79013
	pop hl
	pop de
	jr .asm_78ff3

.asm_79013
	pop hl
	pop de
	pop hl
	pop de
	pop bc
	ret

Func_79019:: ; 79019 (1e:5019)
	ld hl, Data_78cbe
	call Func_79033
Func_7901f:: ; 7901f (1e:501f)
	predef DelayFrame
	predef Func_7e17c
	and $3
	jr z, Func_7901f
	and $2
	ret nz
	push af
	ld hl, Data_78ca0
	call Func_78bd2
	pop af
	ret

Func_79033:: ; 79033 (1e:5033)
	push hl
	ld a, $a4
.asm_79036
	ld h, $0
	ld bc, $e02
	ld de, $310
	predef Func_7d753
	hlbgcoord 0, 0
	ld bc, $240
	ld e, $4
	predef Func_7d5e7
	ld a, $ca
	ld bc, $e02
	ld de, $310
	predef Func_7dc58
	ld de, Data_790b2
	ld bc, wOAMBuffer
	predef Func_7ad4e
	ld de, $9000
	ld bc, $800
	predef Func_7ad6d
	ld de, $8800
	ld bc, $470
	predef Func_7ad6d
	ld hl, $8c70
	ld bc, $390
	ld e, $0
	predef Func_7d5e7
	hlbgcoord 0, 13
	ld de, Data_79ccf
	ld b, $5
	ld c, $14
	call Func_7909b
	pop hl
	ld de, Data_799cf
	call Func_7908f
	ld a, $1
	predef Func_7d78e
	ret

Func_7908f:: ; 7908f (1e:508f)
	push de
	call Func_78bd2
	pop de
	hlbgcoord 2, 0
	ld b, $c
	ld c, $10
Func_7909b:: ; 7909b (1e:509b)
	push bc
	push hl
	push de
	ld b, $0
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, Func_7909b
	ret

Data_790b2:: ; 790b2
	db $7f, $ee, $44, $1f, $00, $30, $00, $28, $07, $23, $e8, $0f, $24, $0c, $ee, $ff, $01, $30, $0a, $ed, $60, $ff, $f8, $00, $04, $0c, $34, $cc, $c4, $ec, $c3, $04, $2c, $fd, $1f, $cf, $de, $ee, $10, $23, $21, $ff, $07, $06, $01, $01, $27, $27, $64, $64, $3f, $49, $ee, $22, $c0, $e0, $20, $20, $60, $40, $fd, $e1, $f0, $91, $91, $f1, $f1, $ee, $44, $ef, $44, $c4, $44, $0a, $00, $80, $80, $bf, $bf, $36, $69, $ee, $20, $02, $02, $47, $c4, $c4, $73, $00, $1f, $69, $47, $02, $ee, $28, $28, $7f, $7f, $c8, $f9, $c8, $7e, $7e, $48, $48, $89, $02, $ee, $04, $ff, $04, $05, $07, $0c, $08, $0b, $0b, $19, $3c, $9b, $12, $ee, $90, $90, $fc, $fc, $a3, $20, $ee, $8f, $fc, $15, $03, $70, $73, $01, $7f, $5f, $72, $62, $9e, $42, $bb, $ed, $62, $f1, $e1, $30, $10, $ca, $7f, $ee, $44, $3f, $1f, $f7, $e3, $1e, $0c, $3a, $ed, $12, $61, $21, $0d, $c7, $c7, $6e, $00, $81, $e0, $80, $43, $41, $73, $0d, $20, $ca, $0a, $00, $ca, $fc, $f8, $f0, $3c, $18, $1c, $14, $1d, $0c, $ff, $c7, $24, $24, $49, $00, $0f, $0f, $04, $38, $30, $5f, $b6, $4f, $9f, $f0, $f0, $a3, $00, $a0, $b0, $bf, $08, $21, $02, $bf, $6b, $20, $6b, $a0, $35, $10, $6b, $bf, $20, $ff, $83, $82, $06, $04, $00, $80, $87, $87, $0c, $69, $6d, $40, $8b, $85, $00, $20, $20, $67, $53, $00, $0a, $53, $bf, $20, $99, $99, $01, $0d, $63, $09, $67, $12, $0c, $bf, $0f, $00, $a5, $6f, $42, $28, $2c, $bf, $bb, $00, $60, $51, $02, $42, $b3, $26, $ed, $29, $15, $ce, $bf, $21, $df, $60, $40, $a0, $60, $39, $30, $1f, $0f, $7b, $bf, $40, $03, $02, $01, $01, $97, $c0, $c0, $3f, $4a, $31, $97, $34, $24, $ec, $c4, $08, $08, $f7, $30, $10, $60, $60, $97, $40, $24, $0c, $28, $f9, $07, $28, $00, $20, $1f, $d6, $95, $72, $ff, $0f, $df, $55, $04, $97, $0d, $16, $cc, $04, $1c, $0c, $ef, $fc, $f8, $f8, $97, $38, $38, $44, $44, $3c, $7f, $00, $7f, $39, $39, $07, $07, $b1, $20, $97, $f0, $1c, $1c, $63, $63, $47, $26, $47, $97, $20, $47, $3f, $a0, $06, $57, $0e, $0e, $11, $11, $21, $21, $cf, $46, $46, $f7, $04, $1d, $03, $03, $04, $04, $71, $67, $01, $12, $12, $14, $4b, $b1, $00, $af, $06, $ff, $05, $0e, $09, $0c, $0b, $18, $17, $19, $ef, $17, $31, $2f, $17, $08, $e0, $60, $78, $98, $ff, $1c, $e4, $4f, $f3, $b3, $bc, $0c, $0f, $cf, $02, $03, $95, $b5, $08, $f0, $30, $38, $c8, $33, $95, $41, $20, $0f, $0c, $f9, $b1, $00, $07, $06, $ff, $1e, $19, $78, $67, $f3, $8f, $cc, $3c, $df, $30, $f0, $b5, $e0, $20, $f0, $10, $30, $ff, $d0, $18, $e8, $98, $e8, $8c, $f4, $4c, $bf, $74, $27, $22, $a0, $a0, $90, $90, $7e, $7e, $fc, $10, $10, $08, $08, $0f, $0f, $2b, $29, $02, $7e, $29, $22, $22, $49, $49, $85, $85, $43, $00, $cf, $0c, $0c, $b9, $2b, $20, $28, $28, $27, $27, $03, $37, $79, $00, $2b, $b9, $00, $b9, $35, $00, $e1, $e1, $ff, $13, $12, $17, $14, $32, $2e, $62, $5e, $ff, $e4, $9c, $c8, $b8, $89, $79, $93, $73, $f3, $16, $f6, $2c, $ec, $4f, $83, $00, $3c, $3c, $fa, $e2, $e2, $82, $82, $02, $52, $06, $45, $00, $ff, $9e, $e6, $67, $79, $19, $1e, $04, $07, $07, $43, $83, $20, $d1, $83, $02, $5f, $70, $90, $3c, $fe, $cc, $ce, $f2, $26, $3a, $4e, $72, $83, $22, $33, $91, $55, $00, $1c, $13, $5d, $5d, $00, $3c, $33, $ff, $79, $47, $e6, $9e, $98, $78, $60, $e0, $03, $79, $75, $40, $07, $0d, $00, $0d, $bb, $00, $18, $18, $ff, $38, $38, $6c, $6c, $66, $7a, $27, $39, $fc, $13, $1d, $11, $1e, $09, $0e, $bc, $15, $00, $cf, $02, $03, $bc, $6f, $20, $90, $9f, $a0, $bf, $ff, $e1, $7f, $e1, $3f, $62, $be, $45, $c5, $30, $7f, $cd, $00, $89, $89, $07, $19, $20, $19, $b9, $00, $c3, $1c, $1c, $b9, $bd, $02, $69, $17, $20, $e6, $e5, $ff, $2c, $2b, $7e, $79, $ff, $f0, $3f, $e0, $ff, $7f, $e0, $ff, $c0, $7f, $43, $28, $e8, $bf, $42, $e0, $e2, $12, $f0, $cc, $3c, $f3, $f9, $0f, $fc, $03, $fe, $01, $d1, $00, $57, $98, $fb, $18, $10, $90, $a0, $00, $dd, $00, $d8, $d8, $ff, $66, $c6, $14, $14, $24, $24, $4d, $4d, $ff, $49, $49, $9a, $9b, $12, $13, $34, $37, $ff, $28, $2f, $8c, $f4, $98, $e8, $18, $e8, $df, $30, $d0, $e5, $60, $a0, $e0, $20, $c0, $fe, $40, $19, $17, $18, $17, $0c, $0b, $f3, $00, $fc, $06, $05, $07, $04, $03, $02, $33, $5b, $00, $ff, $8f, $8f, $86, $86, $42, $c2, $43, $c3, $ff, $21, $e1, $30, $f0, $90, $70, $44, $44, $e7, $06, $06, $02, $fc, $31, $10, $80, $80, $88, $e7, $88, $31, $31, $6d, $33, $00, $41, $01, $02, $fd, $43, $0c, $0f, $33, $3c, $cf, $a6, $c0, $ef, $74, $9c, $78, $45, $00, $88, $f8, $08, $fc, $ec, $04, $fe, $02, $39, $ff, $71, $8a, $20, $21, $06, $fb, $00, $fb, $f9, $00, $f9, $72, $01, $ff, $8f, $4f, $fa, $07, $ff, $06, $ff, $00, $57, $71, $80, $61, $7e, $58, $70, $e4, $54, $fe, $3e, $f9, $07, $bb, $7f, $57, $51, $e0, $09, $0e, $11, $1e, $f3, $fd, $f7, $63, $fd, $0e, $f2, $39, $06, $fa, $0e, $01, $19, $00, $19, $3f, $26, $93, $21, $0a, $93, $3f, $00, $88, $ff, $78, $c8, $b8, $c4, $bc, $65, $5d, $73, $ff, $4f, $70, $6f, $5b, $74, $5f, $70, $06, $fe, $07, $19, $1e, $67, $78, $9f, $e0, $2d, $61, $57, $34, $60, $7f, $64, $76, $02, $d6, $58, $25, $71, $c3, $ff, $70, $5f, $64, $30, $3f, $8f, $26, $c0, $40, $63, $f5, $07, $06, $9f, $a0, $21, $57, $31, $c0, $7f, $ff, $70, $4f, $7c, $87, $fe, $89, $f9, $08, $bc, $f8, $61, $40, $ff, $10, $ff, $4e, $03, $5e, $f1, $7f, $60, $ff, $e7, $2f, $10, $54, $58, $70, $fb, $ff, $0f, $f5, $1d, $f9, $19, $e4, $24, $f9, $fe, $39, $d0, $50, $88, $88, $87, $87, $9b, $f7, $fc, $fc, $02, $02, $01, $00, $c1, $c1, $21, $e7, $21, $22, $22, $51, $9b, $00, $3f, $3f, $40, $bf, $40, $f2, $83, $83, $84, $84, $44, $44, $7f, $61, $00, $cf, $f8, $af, $b8, $9f, $9c, $0f, $ff, $0c, $9f, $9e, $09, $09, $11, $11, $e0, $f7, $e0, $ff, $78, $ff, $1e, $f0, $ff, $30, $10, $35, $52, $ea, $0e, $01, $02, $25, $24, $02, $36, $0e, $40, $ff, $01, $fe, $06, $fa, $0e, $f1, $3f, $d1, $e1, $df, $10, $1f, $f5, $f2, $08, $03, $b1, $41, $07, $f4, $07, $08, $08, $10, $c7, $20, $cb, $10, $01, $7f, $55, $20, $37, $37, $0c, $0c, $04, $04, $03, $b7, $03, $08, $10, $f0, $df, $20, $d0, $f0, $30, $b7, $30, $c5, $28, $28, $c7, $00, $1f, $18, $17, $e3, $1c, $0b, $0f, $f3, $d7, $00, $c7, $14, $14, $13, $c5, $01, $a3, $94, $00, $07, $51, $c9, $24, $c0, $c0, $00, $b7, $7d, $00, $c7, $c5, $00, $c5, $d9, $00, $d9, $8d, $00, $f1, $7f, $40, $ff, $c0, $61, $d7, $60, $a5, $f8, $ec, $18, $f0, $70, $e5, $82, $08, $0f, $3f, $f5, $80, $30, $bd, $65, $20, $ec, $ec, $e7, $09, $42, $cb, $cb, $28, $c8, $1f, $1f, $b3, $b7, $20, $ff, $99, $b7, $34, $15, $60, $c5, $04, $f8, $f8, $b7, $c5, $41, $ed, $68, $52, $1b, $0f, $1b, $26, $87, $79, $40, $cb, $2f, $27, $7c, $78, $f7, $27, $23, $2e, $2c, $79, $40, $01, $01, $e1, $bd, $e1, $db, $e1, $c1, $21, $21, $79, $40, $05, $f7, $05, $7f, $3f, $e0, $24, $1e, $71, $61, $21, $99, $60, $28, $0c, $81, $36, $6c, $e9, $00, $28, $06, $4c, $fa, $06, $02, $6c, $97, $44, $0f, $0f, $79, $50, $00, $37, $87, $4f, $26, $f0, $f0, $6c, $c7, $c5, $07, $e3, $06, $84, $84, $a3, $04, $b1, $64, $00, $ff, $fe, $8f, $23, $cd, $3a, $10, $64, $60, $20, $6c, $44, $fd, $48, $48, $4c, $48, $4f, $47, $79, $22, $61, $fb, $41, $03, $01, $03, $02, $54, $e2, $e2, $0f, $79, $20, $53, $79, $00, $41, $40, $40, $60, $40, $01, $d7, $04, $8b, $8f, $04, $f7, $c9, $02, $f1, $54, $32, $02, $3f, $19, $aa, $84, $1f, $0f, $18, $10, $19, $11, $cb, $1f, $0e, $11, $15, $00, $c0, $1c, $e0, $b8, $98, $18, $f1, $40, $2b, $07, $07, $ae, $02, $19, $87, $40, $71, $3a, $ff, $ff, $20, $3e, $12, $33, $f1, $21, $18, $11, $cf, $89, $80, $f1, $c6, $df, $1a, $d3, $20, $53, $01, $27, $20, $7a, $21, $fc, $fb, $f6, $00, $e1, $00, $1a, $dd, $00, $06, $de, $02, $22, $00, $6a, $00, $c0, $7b, $9e, $00, $87, $00, $58, $62, $05, $00, $63, $c2, $40, $44, $d8, $88, $40, $12, $7e, $00, $12, $2f, $ad, $00, $32, $06, $10, $89, $40, $48, $3f, $00, $00, $5f, $42, $08, $89, $60, $32, $2e, $62, $5e, $e4, $ff, $9c, $c8, $b8, $88, $78, $90, $70, $10, $fa, $f0, $20, $e0, $01, $01, $c5, $10, $63, $12, $ff, $08, $08, $0c, $0c, $0e, $0e, $1b, $1b, $ff, $9e, $e6, $67, $79, $19, $1e, $04, $07, $9f, $03, $fc, $ec, $78, $9c, $9c, $a3, $bf, $c3, $fb, $7f, $ec, $3c, $70, $b0, $ec, $c0, $c0, $6f, $c5, $00, $70, $70, $5d, $40, $c0, $21, $e0, $ff, $10, $f1, $cc, $3c, $f3, $0f, $fc, $03, $fd, $fe, $01, $11, $11, $30, $30, $c5, $01, $40, $3d, $3d, $d8, $00, $c8, $c8, $26, $e6, $6b, $78, $ff, $78, $31, $31, $21, $21, $62, $63, $c2, $ff, $c3, $84, $87, $08, $0f, $74, $94, $78, $ff, $98, $78, $88, $fb, $0b, $fe, $06, $fe, $fa, $02, $ff, $03, $ff, $71, $67, $07, $04, $e1, $6f, $67, $00, $f0, $f0, $d2, $e6, $1e, $f9, $07, $6f, $ab, $03, $ff, $00, $f7, $e0, $09, $0e, $11, $ff, $1e, $93, $9d, $63, $fd, $0f, $f3, $fe, $fd, $03, $fc, $07, $f8, $0f, $80, $0f, $10, $33, $ff, $33, $4c, $4c, $90, $90, $a1, $a1, $a0, $e1, $a0, $88, $88, $5f, $97, $20, $b1, $67, $00, $05, $e3, $05, $86, $87, $2b, $57, $00, $55, $c4, $bc, $ff, $e5, $dd, $f3, $cf, $30, $ef, $3b, $f4, $ef, $3f, $f0, $fc, $07, $00, $13, $f0, $10, $e0, $77, $9f, $20, $c0, $40, $0f, $20, $54, $d4, $d3, $b6, $d3, $b1, $10, $10, $27, $02, $06, $06, $1f, $3f, $2b, $00, $29, $89, $89, $75, $75, $0a, $0a, $f7, $1c, $1c, $e0, $e0, $92, $00, $4f, $c8, $8f, $ec, $88, $07, $04, $73, $03, $02, $1f, $02, $1f, $7b, $92, $40, $07, $05, $c7, $c6, $29, $84, $84, $36, $7e, $40, $b3, $fe, $ff, $1f, $09, $fd, $fd, $7b, $e6, $03, $1e, $1c, $7d, $62, $7e, $f0, $f8, $27, $04, $fd, $18, $10, $70, $60, $40, $40, $7e, $02, $d7, $06, $0e, $59, $00, $0e, $ca, $0c, $0e, $87, $ba, $87, $20, $00, $01, $81, $83, $d4, $82, $d8, $02, $6b, $7e, $ff, $ff, $17, $00, $90, $55, $10, $1b, $ee, $11, $1f, $0e, $a9, $a3, $07, $06, $03, $7c, $33, $bd, $06, $ff, $80, $c0, $7e, $20, $cc, $08, $0c, $4f, $7e, $21, $18, $17, $7e, $21, $3c, $33, $79, $47, $fe, $e6, $9e, $98, $78, $60, $e0, $c0, $0a, $1e, $17, $00, $29, $4c, $00, $1e, $1e, $23, $23, $93, $3f, $93, $02, $53, $66, $7a, $27, $39, $13, $1d, $ff, $91, $9e, $c9, $ce, $68, $6f, $34, $37, $ff, $1a, $1b, $14, $14, $92, $92, $99, $99, $ff, $49, $c9, $4c, $cc, $24, $e4, $36, $f6, $cf, $92, $72, $17, $00, $b7, $0c, $0c, $04, $04, $ff, $82, $80, $42, $42, $0d, $0d, $33, $31, $ef, $0a, $0b, $21, $d3, $00, $21, $22, $83, $8c, $ff, $0f, $33, $3c, $cf, $f0, $3f, $c0, $13, $fe, $15, $1f, $1e, $67, $78, $9f, $e0, $7d, $97, $ff, $de, $00, $de, $60, $ad, $40, $01, $01, $c1, $b1, $c1, $95, $81, $81, $95, $0a, $eb, $28, $04, $7c, $90, $38, $ef, $f9, $01, $0f, $ea, $f9, $00, $81, $ef, $42, $d9, $f0, $f0, $ef, $fc, $f8, $64, $06, $ef, $1f, $ef, $0f, $78, $70, $ef, $60, $50, $50, $28, $28, $57, $28, $60, $37, $24, $20, $a2, $02, $02, $22, $50, $f7, $10, $62, $fa, $42, $9b, $21, $9a, $04, $32, $a2, $c6, $0f, $06, $b5, $0a, $9f, $a1, $82, $03, $03, $a2, $6f, $65, $00, $0c, $08, $60, $38, $10, $f0, $60, $cf, $c0, $80, $a1, $80, $9e, $07, $03, $0e, $0c, $3a, $a2, $20, $e9, $60, $40, $c0, $52, $06, $80, $3a, $a3, $42, $5f, $10, $c3, $62, $04, $29, $3a, $10, $10, $cf, $b0, $20, $ab, $02, $a2, $32, $2e, $62, $5e, $ff, $e4, $9c, $c8, $b8, $88, $78, $91, $71, $f3, $12, $f2, $24, $e4, $02, $00, $56, $90, $90, $f7, $a0, $a0, $c1, $c1, $04, $40, $9e, $e6, $67, $f3, $79, $19, $1e, $04, $47, $2a, $10, $18, $18, $7f, $ea, $3c, $33, $79, $47, $e6, $9e, $98, $dc, $78, $60, $e7, $00, $c0, $0c, $0c, $f5, $b9, $00, $1d, $56, $2f, $00, $f5, $41, $41, $40, $c9, $30, $66, $ff, $7a, $a7, $b9, $93, $9d, $91, $9e, $89, $fe, $8e, $c8, $cf, $a4, $a7, $92, $93, $78, $df, $78, $f8, $8d, $03, $14, $f4, $cf, $3f, $f3, $f7, $0f, $fc, $03, $fe, $03, $07, $07, $09, $bf, $09, $97, $00, $21, $21, $e0, $e0, $3e, $fe, $1f, $b9, $43, $11, $03, $02, $03, $42, $03, $54, $e1, $87, $18, $2f, $8f, $20, $56, $52, $20, $fa, $35, $e7, $f0, $94, $72, $b9, $00, $c9, $70, $70, $48, $9f, $48, $c7, $00, $61, $02, $82, $3d, $3d, $82, $ff, $83, $8f, $8f, $11, $11, $12, $13, $ec, $ff, $ef, $33, $3c, $cf, $f0, $3f, $c0, $99, $fb, $79, $e7, $1f, $f9, $07, $eb, $03, $ff, $00, $7f, $47, $e0, $46, $47, $59, $5e, $67, $78, $c8, $9f, $e0, $3d, $03, $47, $60

Data_799cf:: ; 799cf
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $04, $11, $03, $04, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $04, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20, $04, $04, $04, $21, $04, $04, $04, $04, $21, $04, $04, $04, $22, $23, $24, $04, $04, $25, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $2c, $2d, $04, $04, $04, $04, $2e, $2f, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $04, $04, $04, $04, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $04, $04, $04, $04, $04, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $04, $04, $04, $04, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $04, $04, $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04, $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

Data_79a8f:: ; 79a8f
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $03, $6c, $6d, $6e, $6f, $70, $71, $72, $05, $06, $07, $73, $74, $04, $04, $11, $03, $75, $76, $77, $78, $79, $7a, $7b, $12, $13, $14, $7c, $7d, $7e, $7f, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20, $04, $04, $04, $04, $04, $04, $80, $81, $82, $83, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $26, $27, $28, $84, $85, $29, $2a, $2b, $04, $04, $04, $04, $04, $04, $2e, $2f, $86, $87, $88, $33, $34, $35, $36, $37, $89, $8a, $04, $04, $04, $04, $3a, $3b, $8b, $8c, $8d, $3f, $40, $41, $42, $43, $8e, $8f, $04, $04, $04, $04, $45, $46, $47, $90, $91, $92, $93, $94, $4d, $4e, $4f, $50, $04, $04, $04, $04, $51, $52, $53, $54, $95, $96, $97, $98, $59, $5a, $5b, $5c, $04, $04, $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04, $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

Data_79b4f:: ; 79b4f
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $03, $04, $04, $04, $05, $06, $07, $99, $9a, $9b, $9c, $9d, $04, $04, $04, $11, $03, $04, $04, $04, $12, $13, $14, $9e, $9f, $a0, $a1, $a2, $04, $04, $04, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $04, $04, $04, $04, $04, $04, $2e, $2f, $30, $31, $32, $33, $34, $a3, $a4, $a5, $89, $8a, $04, $04, $04, $04, $3a, $3b, $3c, $3d, $3e, $3f, $40, $a6, $a7, $a8, $8e, $8f, $04, $04, $04, $04, $45, $46, $47, $48, $91, $92, $93, $94, $a9, $4e, $4f, $50, $04, $04, $04, $04, $51, $52, $53, $54, $95, $96, $97, $98, $59, $5a, $5b, $5c, $04, $04, $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04, $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

Data_79c0f:: ; 79c0f
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $03, $04, $05, $06, $07, $aa, $ab, $ac, $ad, $ae, $af, $b0, $04, $9d, $04, $11, $03, $04, $12, $13, $14, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8

Data_79c3c:: ; 79c3c
	db $a2, $04, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20, $04, $04, $04, $21, $04, $04, $04, $04, $04, $04, $04, $04, $22, $23, $04, $04, $04, $04, $04, $04, $26, $27, $28, $04, $04, $29, $2a, $2b, $2c, $2d, $04, $04, $04, $04, $2e, $2f, $b9, $ba, $bb, $33, $34, $bc, $bd, $be, $38, $39, $04, $04, $04, $04, $3a, $3b, $bf, $c0, $c1, $3f, $40, $c2, $c3, $c4, $44, $04, $04, $04, $04, $04, $45, $46, $47, $c5, $49, $4a, $4b, $4c, $c6, $4e, $4f, $50, $04, $04, $04, $04, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $04, $04, $04, $5d, $5e, $5f, $60, $61, $62, $04, $04, $5d, $63, $64, $65, $66, $62, $04, $04, $67, $68, $69, $6a, $68, $6b, $04, $04, $67, $68, $69, $6a, $68, $6b, $04

Data_79ccf:: ; 79ccf
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $03, $04, $ca, $cd, $d0, $d3, $d6, $d9, $dc, $df, $e2, $e5, $e8, $eb, $ee, $f1, $f4, $f7, $04, $11, $03, $04, $cb, $ce, $d1, $d4, $d7, $da, $dd, $e0, $e3, $e6, $e9, $ec, $ef, $f2, $f5, $f8, $04, $11, $03, $04, $cc, $cf, $d2, $d5, $d8, $db, $de, $e1, $e4, $e7, $ea, $ed, $f0, $f3, $f6, $f9, $04, $11, $1e, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $1f, $20

Data_79d33:: ; 79d33
	db $bc, $ff, $ee, $1f, $c0, $3f, $c0, $20, $f5, $06, $fe, $30, $17, $ef, $00, $80, $7f, $2c, $ef, $22, $30, $36, $ff, $00, $47, $df, $f1, $ed, $6c, $1f, $30, $80, $ff, $91, $63, $ff, $0f, $74, $c4, $ff, $d5, $a7, $60, $fc, $00, $fa, $06, $e0, $0a, $f6, $0a, $f2, $f6, $ff, $07, $18, $d0, $f1, $df, $02, $fe, $2c, $01, $3f, $3f, $7f, $40, $ff, $fe, $80, $ff, $81, $ff, $97, $ff, $99, $37, $ef, $91, $ff, $87, $35, $10, $9f, $ff, $82, $ff, $87, $8c, $33, $31, $00, $2f, $ad, $41, $ff, $02, $ff, $ff, $e4, $ff, $11, $ff, $d2, $ff, $16, $ff, $a9, $ca, $55, $f2, $45, $13, $62, $51, $ee, $00, $fc, $b8, $fe, $56, $01, $ff, $f9, $73, $12, $74, $5a, $04, $21, $7e, $3e, $00, $61, $73, $71, $00, $6f, $2f, $51, $88, $ce, $ff, $8b, $39, $44, $01, $9b, $ff, $9e, $9d, $87, $8a, $97, $10, $a4, $4a, $a0, $46, $ef, $ff, $c2, $74, $ec, $11, $e5, $ff, $25, $b7, $22, $c1, $3a, $6a, $ff, $51, $ff, $e9, $ff, $49, $ff, $d1, $ff, $e0, $59, $ff, $69, $d7, $10, $d6, $dc, $00, $e0, $8a, $a1, $bb, $84, $43, $8e, $ff, $95, $f9, $31, $8f, $ff, $87, $85, $03, $44, $0a, $4a, $34, $01, $f7, $ff, $a2, $7f, $19, $67, $ff, $92, $ff, $e2, $ff, $c7, $54, $51, $1b, $f1, $69, $b1, $d7, $11, $a9, $7b, $3a, $25, $8a, $21, $3f, $8a, $a0, $a4, $81, $97, $11, $98, $01, $5c, $96, $01, $89, $a3, $8c, $ff, $93, $a9, $b0, $c4, $ff, $43, $ff, $e4, $ff, $8d, $ff, $f4, $ff, $e8, $c5, $ff, $24, $bf, $11, $15, $bd, $2a, $a3, $46, $23, $97, $70, $28, $09, $47, $d0, $16, $02, $21, $9e, $ff, $ef, $91, $ff, $96, $15, $86, $ff, $83, $ff, $8f, $9c, $09, $b0, $22, $78, $23, $1d, $ff, $94, $ff, $e8, $55, $ff, $44, $03, $75, $89, $ff, $9a, $ab, $91, $94, $95, $b9, $c0, $01, $99, $bd, $9f, $1d, $5c, $68, $90, $16, $df, $10, $e0, $56, $3b, $12, $38, $e0, $00, $36, $ba, $64, $e9, $b1, $71, $ff, $89, $a7, $a9, $f5, $30, $00, $f6, $5c, $02, $64, $aa, $30, $3e, $20, $cf, $b3, $cd, $27, $66, $cd, $d3, $64

Func_79ea7:: ; 79ea7
	call Func_7a57f
	ld a, $1
	call Func_7a6c2
	ld de, $470d
	hlcoord 5, 7, wAttrMap
	predef Func_7b85e
	ld a, $3
	predef Func_7d78e
asm_79ebb:
	predef DelayFrame
	predef Func_7e17c
	ld c, a
	and $6
	jp nz, Func_79f61
	ld a, c
	and $9
	jr nz, Func_79ef2
	bit 6, c
	jr nz, .asm_79ed7
	bit 7, c
	jr nz, .asm_79edf
	call Func_79f2d
	jr asm_79ebb

.asm_79ed7
	call Func_79ee7
	call Func_79f21
	jr asm_79ebb

.asm_79edf
	call Func_79ee7
	call Func_79f15
	jr asm_79ebb

Func_79ee7:: ; 79ee7 (1e:5ee7)
	xor a
	ldh [hFFC1], a
	call Func_7a181
	ld c, $11
	predef Func_7bdaa
	ret

Func_79ef2:: ; 79ef2
	xor a
	call Func_7a6c2
	call Func_7a181
	predef Func_7b93a
	jr c, .asm_79f0e
	ld a, $1
	ldh [hFFC2], a
	ldh a, [hFF8A]
	bit 2, a
	jp nz, Func_79f61
	call Func_79f15
	xor a
	ldh [hFFC1], a
.asm_79f0e
	ld a, $1
	call Func_7a6c2
	jr asm_79ebb

Func_79f15:: ; 79f15 (1e:5f15)
	ldh a, [hFFC0]
	inc a
	cp $9
	jr c, .asm_79f1e
	ld a, $1
.asm_79f1e
	ldh [hFFC0], a
	ret

Func_79f21:: ; 79f21 (1e:5f21)
	ldh a, [hFFC0]
	dec a
	bit 7, a
	jr z, .asm_79f2a
	ld a, $8
.asm_79f2a
	ldh [hFFC0], a
	ret

Func_79f2d:: ; 79f2d (1e:5f2d)
	ld hl, hFFC1
	ld a, [hl]
	inc [hl]
	and $f
	ret z
	bit 4, [hl]
	push af
	call Func_7a181
	ld c, $11
	pop af
	jr z, .asm_79f44
	predef Func_7bdaa
	jr .asm_79f60

.asm_79f44
	ld b, e
.asm_79f45
	push hl
	push de
	push bc
	ld e, [hl]
	predef Func_7bdc7
	push hl
	ld hl, wc3ee
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop hl
	predef CopyPredef
	pop bc
	pop de
	pop hl
	inc hl
	ld a, b
	add d
	ld d, a
	dec c
	jr nz, .asm_79f45
.asm_79f60
	ret

Func_79f61:: ; 79f61 (1e:5f61)
	call Func_79ee7
	call Func_7a501
Func_79f67:: ; 79f67
	xor a
	ld de, Data_79f82
	predef Func_7b776
	jp c, Func_79ea7
	ld l, a
	ld h, $0
	predef AnonJumpRelativeTable
	db 6
	; 5f76
	dw Func_79ea7 - @
	dw Func_7a01f - @
	dw Func_7a071 - @
	dw Func_7a0ba - @
	dw Func_79fb7 - @
	dw Func_79fa4 - @

Data_79f82:: ; 79f82
	db $06, $04, $05, $70, $7f, $02, $00

Func_79f89:: ; 79f89 (1e:5f89)
	push af
	call Func_7a52c
	pop af
	add a
	ld c, a
	ld b, $0
	ld hl, Pointers_7a1a1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, $30
	ld e, $1
	predef Func_7bd42
	ld a, d
	ldh [hFFC4], a
	or a
	ret

Func_79fa4:: ; 79fa4
	ldh a, [hFFC2]
	or a
	jr z, Func_79fb5
	ld a, $8
	call Func_79f89
	call Func_7a169
	jr nc, Func_79fb5
	jr Func_79f67

Func_79fb5:: ; 79fb5
	predef Func_0150

Func_79fb7:: ; 79fb7
	call Func_7a57f
	ldh a, [hFFC0]
	push af
	ld a, $1
	ldh [hFFC0], a
	ld a, $7
	call Func_79f89
	ld a, $3
	predef Func_7d78e
.asm_79fca
	predef DelayFrame
	predef Func_7e17c
	bit 6, a
	jr nz, .asm_79fed
	bit 7, a
	jr nz, .asm_79ffa
	bit 0, a
	jr nz, .asm_7a002
	bit 4, a
	jr nz, .asm_7a002
	and $6
	jr nz, .asm_79fe7
.asm_79fe2
	call Func_79f2d
	jr .asm_79fca

.asm_79fe7
	pop af
	ldh [hFFC0], a
	jp Func_79f61

.asm_79fed
	call Func_79ee7
.asm_79ff0
	call Func_79f21
	ldh a, [hFFC0]
	or a
	jr z, .asm_79ff0
	jr .asm_79fe2

.asm_79ffa
	call Func_79ee7
	call Func_79f15
	jr .asm_79fe2

.asm_7a002
	call Func_79ee7
	predef SoundOffPredef
	ld hl, $400
	predef Func_7e064
	call Func_7a14f
	predef Func_7ae86
	call Func_79f15
	ld hl, $404
	predef Func_7e064
	predef SoundOffPredef
	predef Func_7e0d2
	jr .asm_79fca

Func_7a01f:: ; 7a01f
	ldh a, [hFFC0]
	push af
	xor a
	ldh [hFFC0], a
.asm_7a025
	call Func_7a14f
	or a
	jr nz, .asm_7a037
	ld a, $9
	call Func_79f89
	call Func_7a173
	pop af
	jp Func_79ea7

.asm_7a037
	inc a
	ld c, a
	decoord 15, 10, wAttrMap
	ld a, $81
	ld [de], a
	hlcoord 16, 4
	ld c, $0
	predef Func_7afe6
	jr c, .asm_7a059
	ld a, $a
	call Func_79f89
	call Func_7a169
	jr c, .asm_7a06b
	hlcoord 16, 4
	predef Func_7c8ec
	jr .asm_7a025

.asm_7a059
	call Func_7a6ab
	ld a, $6
	jr c, .asm_7a065
	xor a
	ldh [hFFC2], a
	ld a, $b
.asm_7a065
	call Func_79f89
	call Func_7a173
.asm_7a06b
	pop af
	ldh [hFFC0], a
	jp Func_79f67

Func_7a071:: ; 7a071
	call Func_7a57f
	ld a, $c
	call Func_79f89
	ld a, $3
	predef Func_7d78e
	call Func_7a169
	jp c, Func_79f61
	ld a, $d
	call Func_79f89
	ld a, $1
	predef Func_7c19f
	predef FrameDelayPredef_7ceaf
	call Func_7a11d
	jr c, .asm_7a0b0
	hlcoord 12, 17
	ld e, l
	ld d, h
	ld c, $99
	predef Func_7aca4
	jr c, .asm_7a0b5
	predef Func_7ac16
	jr c, .asm_7a0b5
	ld a, $e
	call Func_79f89
.asm_7a0a7
	xor a
	predef Func_7c19f
	call Func_7a173
	jp Func_79f61

.asm_7a0b0
	call Func_7a114
	jr .asm_7a0a7

.asm_7a0b5
	call Func_7a112
	jr .asm_7a0a7

Func_7a0ba:: ; 7a0ba
	ldh a, [hFFC2]
	or a
	jr z, .asm_7a0c9
	ld a, $12
	call Func_79f89
	call Func_7a169
	jr c, .asm_7a103
.asm_7a0c9
	ld a, $11
	call Func_79f89
	predef FrameDelayPredef_7ceaf
	ld de, Data_7a61d
	hlcoord 5, 10, wAttrMap
	ld bc, $a
	predef CopyPredef
	ld a, $1
	predef Func_7c19f
	predef Func_7aa8e
	push af
	xor a
	predef Func_7c19f
	pop af
	jr c, .asm_7a10d
	aCoord 5, 10, wAttrMap
	or a
	jr z, .asm_7a106
	xor a
	ldh [hFFC0], a
	call Func_79ee7
	call Func_79f15
	ld a, $e
	call Func_79f89
	ld a, $1
	ldh [hFFC2], a
.asm_7a100
	call Func_7a173
.asm_7a103
	jp Func_79f67

.asm_7a106
	ld a, $f
	call Func_79f89
	jr .asm_7a100

.asm_7a10d
	call Func_7a112
	jr .asm_7a100

Func_7a112:: ; 7a112 (1e:6112)
	ld a, $10
Func_7a114:: ; 7a114 (1e:6114)
	call Func_79f89
.asm_7a117
	predef Func_7e17c
	or a
	jr nz, .asm_7a117
	ret

Func_7a11d:: ; 7a11d (1e:611d)
	hlcoord 5, 10, wAttrMap
	ld de, wOAMBuffer
	ld bc, $a
	predef Func_7ac8d
	jr c, .asm_7a146
	ld hl, wOAMBuffer
	ld de, Data_7a61d
	ld bc, $a
	predef Func_7af75
	or a
	jr nz, .asm_7a149
	inc a
	ld hl, wOAMBuffer
	ld [hl], a
	decoord 5, 10, wAttrMap
	ld bc, $a
	predef Func_7aca4
	ret nc
.asm_7a146
	ld a, $10
	ret

.asm_7a149
	predef Func_7ac16
	ld a, $f
	scf
	ret

Func_7a14f:: ; 7a14f (1e:614f)
	call Func_7a181
	decoord 16, 12, wAttrMap
	push de
	inc c
	dec c
	jr z, .asm_7a160
.asm_7a15a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7a15a
.asm_7a160
	xor a
	ld [de], a
	pop de
	hlcoord 16, 10, wAttrMap
	predef Func_7be8b
	ret

Func_7a169:: ; 7a169 (1e:6169)
	ldh a, [hFFC4]
	ld d, a
	ld e, $1
	ld hl, Data_7a4c5
	predef Func_7bd42
Func_7a173:: ; 7a173 (1e:6173)
	predef DelayFrame
	predef Func_7e17c
	and $3
	jr z, Func_7a173
	or a
	bit 1, a
	ret z
	scf
	ret

Func_7a181:: ; 7a181 (1e:6181)
	ld b, $11
	ldh a, [hFFC0]
	or a
	jr nz, .asm_7a18a
	ld b, $c
.asm_7a18a
	ld e, a
	add a
	add a
	add a
	add a
	add e
	ld e, a
	ld d, $0
	hlcoord 12, 17
	add hl, de
	add $80
	ld d, a
	ld e, $1
	ld a, b
	predef Func_7be72
	ld c, a
	ret

Pointers_7a1a1:: ; 7a1a1
	dw Data_7a1c9
	dw Data_7a1de
	dw Data_7a1f4
	dw Data_7a216
	dw SaveGameSignature9
	dw Data_7a252
	dw Data_7a26f
	dw Data_7a29c
	dw Data_7a2c9
	dw Data_7a2ef
	dw Data_7a32d
	dw Data_7a35e
	dw Data_7a373
	dw Data_7a399
	dw Data_7a3b5
	dw Data_7a3d1
	dw Data_7a40b
	dw Data_7a43c
	dw Data_7a465
	dw Data_7a490

Data_7a1c9:: ; 7a1c9
	db $01, $0e, $0f, $cd, $dd, $bc, $ad, $b3, $b6, $de, $d2, $dd, $c6, $d3, $c4, $de, $d8, $cf, $bd, $00, $ff

Data_7a1de:: ; 7a1de
	db $01, $0e, $0f, $b2, $cf, $c9, $cc, $de, $dd, $bc, $ae, $b3, $a6, $ce, $bf, $de, $dd, $bc, $cf, $bd, $00, $ff

Data_7a1f4:: ; 7a1f4
	db $01, $0e, $0f, $ce, $b6, $c9, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2, $0f, $c6, $cc, $de, $dd, $bc, $ae, $b3, $a6, $00, $01, $0f, $b5, $b8, $d8, $cf, $bd, $00, $ff

Data_7a216:: ; 7a216
	db $01, $0e, $0f, $ce, $b6, $c9, $0e, $b9, $de, $b0, $d1, $ce, $de, $b0, $b2, $0f, $b6, $d7, $cc, $de, $dd, $bc, $ae, $b3, $a6, $00, $01, $0f, $d3, $d7, $b2, $cf, $bd, $00, $ff

SaveGameSignature9:: ; 7a239
	db $01, $0e, $0e, $ce, $df, $b9, $cd, $de, $d9, $0f, $c6, $cc, $de, $dd, $bc, $ae, $b3, $a6, $b5, $b8, $d8, $cf, $bd, $00, $ff

Data_7a252:: ; 7a252
	db $01, $0e, $a2, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $a3, $0f, $a6, $00, $01, $0f, $bc, $ad, $b3, $d8, $ae, $b3, $bc, $cf, $bd, $00, $ff

Data_7a26f:: ; 7a26f
	db $01, $0e, $0f, $b1, $b7, $d6, $b3, $d8, $ae, $b3, $b6, $de, $c0, $d8, $c5, $b8, $c3, $0e, $be, $b0, $cc, $de, $00, $01, $0f, $0f, $c3, $de, $b7, $cf, $be, $dd, $c3, $de, $bc, $c0, $00, $01, $10, $4f, $4b, $3a, $41, $00, $ff

Data_7a29c:: ; 7a29c
	db $01, $0e, $0e, $41, $ce, $de, $c0, $dd, $0f, $a6, $b5, $bd, $c4, $31, $b7, $de, $ae, $b3, $ba, $de, $c4, $c6, $00, $01, $0f, $ca, $af, $bc, $dd, $bc, $cf, $bd, $00, $01, $10, $bc, $ad, $b3, $d8, $ae, $b3, $3a, $42, $00, $ff

Data_7a2c9:: ; 7a2c9
	db $01, $0e, $0e, $be, $b0, $cc, $de, $0f, $bb, $da, $c3, $b2, $cf, $be, $dd, $b6, $de, $00, $01, $0f, $bc, $ad, $b3, $d8, $ae, $b3, $bc, $c3, $d3, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a2ef:: ; 7a2ef
	db $01, $0e, $0e, $c0, $b2, $c4, $d9, $0f, $b6, $de, $c6, $ad, $b3, $d8, $ae, $b8, $bb, $da, $c3, $b2, $cf, $be, $dd, $00, $01, $0f, $c6, $ad, $b3, $d8, $ae, $b8, $bc, $c0, $b1, $c4, $c3, $de, $d3, $b3, $b2, $c1, $c4, $de, $00, $01, $10, $0e, $be, $b0, $cc, $de, $0f, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $ff

Data_7a32d:: ; 7a32d
	db $01, $0e, $0f, $b5, $c5, $bc, $de, $c5, $cf, $b4, $c9, $cc, $de, $dd, $bc, $ae, $b3, $b6, $de, $b1, $d8, $cf, $bd, $00, $01, $0f, $b3, $dc, $b6, $de, $b7, $bc, $c3, $ce, $bf, $de, $dd, $bc, $c3, $d3, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a35e:: ; 7a35e
	db $01, $0e, $0e, $be, $b0, $cc, $de, $0f, $bc, $cf, $bc, $c0, $00, $01, $0f, $4f, $4b, $3a, $41, $00, $ff

Data_7a373:: ; 7a373
	db $01, $0e, $0f, $ba, $c9, $cc, $de, $dd, $bc, $ae, $b3, $a6, $bf, $b3, $bc, $dd, $bc, $cf, $bd, $00, $01, $0f, $bc, $de, $ad, $dd, $cb, $de, $ca, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a399:: ; 7a399
	db $01, $0e, $0f, $c2, $b3, $bc, $dd, $c1, $ad, $b3, $c3, $de, $bd, $00, $01, $0f, $c1, $ad, $b3, $c0, $de, $dd, $bd, $d9, $3a, $42, $00, $ff

Data_7a3b5:: ; 7a3b5
	db $01, $0e, $0f, $c2, $b3, $bc, $dd, $b6, $de, $bc, $ad, $b3, $d8, $ae, $b3, $bc, $cf, $bc, $c0, $00, $01, $0f, $4f, $4b, $3a, $41, $00, $ff

Data_7a3d1:: ; 7a3d1
	db $01, $0e, $a2, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $a3, $0f, $c4, $de, $b3, $bc, $c3, $de, $c5, $b2, $c4, $00, $01, $0f, $c2, $b3, $bc, $dd, $c3, $de, $b7, $cf, $be, $dd, $00, $01, $10, $d3, $b3, $b2, $c1, $c4, $de, $d4, $d8, $c5, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $ff

Data_7a40b:: ; 7a40b
	db $01, $0e, $0f, $c2, $b3, $bc, $dd, $b6, $de, $c1, $ad, $b3, $c0, $de, $dd, $bb, $da, $cf, $bc, $c0, $00, $01, $0f, $d3, $b3, $b2, $c1, $c4, $de, $d4, $d8, $c5, $b5, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $01, $10, $4f, $4b, $3a, $41, $00, $ff

Data_7a43c:: ; 7a43c
	db $01, $0e, $0f, $bc, $de, $ad, $bc, $dd, $c0, $b2, $b7, $c1, $ad, $b3, $c3, $de, $bd, $00, $01, $0f, $b1, $b2, $c3, $c9, $bf, $b3, $bc, $dd, $a6, $b6, $b2, $bc, $bc, $c3, $b8, $c0, $de, $bb, $b2, $00, $ff

Data_7a465:: ; 7a465
	db $01, $0e, $0f, $cd, $dd, $bc, $ad, $b3, $c1, $ad, $b3, $c9, $cc, $de, $dd, $bc, $ae, $b3, $b6, $de, $00, $01, $0f, $b7, $b4, $c3, $bc, $cf, $b2, $cf, $bd, $b6, $de, $a4, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a490:: ; 7a490
	db $06, $00, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $00, $01, $0e, $0e, $be, $b0, $cc, $de, $0f, $c3, $de, $b7, $d9, $d6, $b3, $d8, $ae, $b3, $b6, $de, $c0, $d8, $cf, $be, $dd, $00, $01, $0f, $bf, $da, $c3, $de, $d3, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a4c5:: ; 7a4c5
	db $01, $10, $ca, $b2, $3a, $41, $20, $b2, $b2, $b4, $3a, $42, $00, $ff

Func_7a4d3:: ; 7a4d3
	hlcoord 16, 4
	ld a, [hli]
	or [hl]
	jp nz, Func_7a678
	ld hl, $d2
	predef Func_7c5da
	bit 7, h
	jr nz, .asm_7a4ec
	predef Func_7c7b7
	xor a
	predef Func_7c926
	inc b
	dec b
	ret nz
.asm_7a4ec
	call Func_7a6dc
	ld a, $3
	predef Func_7d78e
	ld a, $13
	call Func_79f89
	call Func_7a169
	jp c, Func_79fb5
	predef Func_7d8d7
	ret

Func_7a501:: ; 7a501
	predef Func_7d8d7
	call Func_7a6dc
	ld de, Data_78078
	ld hl, $9700
	ld bc, $10
	predef CopyPredef
	call Func_7a5db
	ld de, $204
	ld bc, $1109
	predef Func_7bdfe
	ld hl, Data_7a535
	ld de, $9101
	predef Func_7bd42
	call Func_7a52c
	ld a, $3
	predef Func_7d78e
	ret

Func_7a52c:: ; 7a52c (1e:652c)
	ld de, $d
	ld bc, $1405
	predef Func_7bdfe
	ret

Data_7a535:: ; 7a535
	db $05, $05, $0f, $c2, $c2, $de, $b9, $d9, $00, $05, $06, $0e, $be, $b0, $cc, $de, $0f, $bd, $d9, $00, $05, $07, $bf, $b3, $bc, $dd, $bd, $d9, $00, $05, $08, $bc, $de, $ad, $bc, $dd, $bd, $d9, $00, $05, $09, $0e, $ce, $df, $b9, $cd, $de, $d9, $0f, $c6, $b5, $b8, $d9, $00, $05, $0a, $4b, $49, $53, $53, $0e, $d2, $c6, $ad, $b0, $0f, $c6, $d3, $c4, $de, $d9, $0e, $00, $ff

Func_7a57f:: ; 7a57f (1e:657f)
	predef Func_7d8d7
	call Func_7a6dc
	ld a, $e4
	ldh [hOBP0], a
	call Func_7a5c6
	call Func_7a5db
	ld de, $103
	ld bc, $130a
	predef Func_7bdfe
	ld a, $73
	ld de, $103
	predef Func_7d9c5
	inc a
	ld d, $13
	predef Func_7d9c5
	ld a, $91
	ld hl, $111
	ld de, $204
	ld bc, $1108
	predef Func_7be3e
	ldh a, [hFFC0]
	push af
	xor a
	ldh [hFFC0], a
	ld c, $9
.asm_7a5b7
	push bc
	call Func_79ee7
	call Func_79f15
	pop bc
	dec c
	jr nz, .asm_7a5b7
	pop af
	ldh [hFFC0], a
	ret

Func_7a5c6:: ; 7a5c6 (1e:65c6)
	ld hl, $8800
	ld bc, $f30
	ld e, $0
	predef Func_7d5e7
	hlbgcoord 0, 0
	ld bc, $400
	ld e, $7f
	predef Func_7d5e7
	ret

Func_7a5db:: ; 7a5db (1e:65db)
	hlbgcoord 0, 0
	ld bc, $400
.asm_7a5e1
	ld a, $7f
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_7a5e1
	ld de, $101
	ld bc, $1303
	predef Func_7bdfe
	ld a, $80
	ld hl, $111
	ld de, $702
	ld bc, $c01
	predef Func_7be3e
	ld hl, Data_7a607
	ld de, $2001
	predef Func_7bd42
	ret

Data_7a607:: ; 7a607
	db $06, $00, $4b, $49, $53, $53, $20, $4d, $41, $49, $4c, $00, $02, $02, $0e, $c0, $b2, $c4, $d9, $3a, $00, $ff

Data_7a61d:: ; 7a61d
	db $00, $4b, $49, $53, $53, $2d, $4d, $41, $49, $4c

Func_7a627:: ; 7a627 (1e:6627)
	call Func_7a651
Func_7a62a:: ; 7a62a (1e:662a)
	decoord 16, 4
	ld hl, wOAMBuffer
	ld bc, $100
	predef CopyPredef
	decoord 5, 7, wAttrMap
	call Func_7a65c
	call Func_7a651
	ld de, wOAMBuffer
	hlcoord 16, 4
	ld bc, $100
	predef CopyPredef
	xor a
	ldh [hFFC0], a
	ldh [hFFC1], a
	ldh [hFFC2], a
	ret

Func_7a651:: ; 7a651 (1e:6651)
	hlcoord 12, 17
	ld bc, $99
	ld e, $20
	predef Func_7d5e7
	ret

Func_7a65c:: ; 7a65c (1e:665c)
	ld l, e
	ld h, d
	push hl
	call Func_7a6e1
	pop hl
	ld de, $39
	add hl, de
	ld e, l
	ld d, h
	inc hl
	inc hl
	ld c, $30
.asm_7a66d
	ld a, [de]
	dec de
	ld [hld], a
	dec c
	jr nz, .asm_7a66d
	ld a, $20
	ld [hld], a
	ld [hl], a
	ret

Func_7a678:: ; 7a678 (1e:6678)
	call Func_7a651
	hlcoord 16, 4
	decoord 9, 0, wAttrMap
	ld bc, $88
	predef Func_7cc9a
	hlcoord 5, 5
	ld b, [hl]
	inc hl
	inc hl
	ld a, [hl]
	bit 4, b
	jr z, .asm_7a699
	sub $60
	bit 3, b
	jr z, .asm_7a699
	sub $60
.asm_7a699
	ld c, a
	ld b, $0
	hlcoord 8, 5
	add hl, bc
	ld [hl], $0
	hlcoord 9, 5
	decoord 12, 17
	predef Func_7beff
	ret

Func_7a6ab:: ; 7a6ab (1e:66ab)
	xor a
	Coorda 6, 5
	ld bc, $1ff
	ld de, $88
	predef Func_7caa0
	ret c
	decoord 9, 0, wAttrMap
	ld bc, $88
	predef Func_7cca9
	or a
	ret

Func_7a6c2:: ; 7a6c2 (1e:66c2)
	push af
	ld a, $30
	ld hl, $102
	ld de, $3
	ld bc, $202
	predef Func_7be3e
	pop af
	ld e, a
	ld d, $30
	ld hl, Data_7bf6b
	ld c, $4
	predef Func_7bf2a
	ret

Func_7a6dc:: ; 7a6dc (1e:66dc)
	ld h, $4
	predef Func_7d85d
	ret

Func_7a6e1:: ; 7a6e1 (1e:66e1)
	lb de, $ff, $46
	ld bc, $3a
	push hl
	push bc
	predef Func_7c577
	pop bc
	pop hl
	ret

Func_7a6ee:: ; 7a6ee (1e:66ee)
	ld a, $20
	predef Func_7d753
	call Func_7a5c6
	call Func_7a627
	call Func_7a6dc
	ld de, $0
	ld bc, $140d
Func_7a6ff:: ; 7a6ff (1e:66ff)
	predef Func_7bdfe
	ld hl, Data_7a7c2
	ld de, $8001
	predef Func_7bd42
	ld hl, Data_7a7fe
.asm_7a70e
	call Func_7a7b5
	jr nz, .asm_7a71f
	push hl
	ld a, c
	ld c, $1
	ld hl, $100
	predef Func_7be3e
	pop hl
	jr .asm_7a70e

.asm_7a71f
	xor a
	ldh [hFFC3], a
	predef Func_7c456
	jr nc, .asm_7a731
	ld a, $1
	ldh [hFFC3], a
	predef Func_7ae29
	decoord 5, 7, wAttrMap
	predef Func_7a65c
.asm_7a731
	hlcoord 12, 17
	call Func_7a6e1
	ld de, $1
	predef Func_7bdaa
	ld a, $3
	predef Func_7d78e
	ldh a, [hFFC3]
	or a
	jr nz, .asm_7a757
	call Func_7a52c
	ld hl, Data_7a824
	ld de, $b001
	predef Func_7bd42
	ld a, $10
	call Func_7a85d
	jr c, .asm_7a7b3
.asm_7a757
	ld de, $470d
	hlcoord 5, 7, wAttrMap
	predef Func_7b85e
.asm_7a75f
	ld hl, Data_7a7fe
.asm_7a762
	call Func_7a7b5
	jr nz, .asm_7a77b
	push hl
	hlcoord 12, 17
	ld e, c
	ld d, $0
	add hl, de
	ld d, c
	ld e, $1
	ld a, b
	predef Func_7be72
	ld c, a
	predef Func_7b93a
	pop hl
	jr .asm_7a762

.asm_7a77b
	ld hl, Data_7a80e
	ld de, $b001
	predef Func_7bd42
	ld a, $b
	call Func_7a85d
	jr nc, .asm_7a799
.asm_7a78a
	ld a, $7f
	ld de, Func_030a
	ld bc, $e02
	ld hl, $0
	predef Func_7be3e
	jr .asm_7a75f

.asm_7a799
	hlcoord 12, 17
	ld c, $3b
.asm_7a79e
	dec c
	jr z, .asm_7a78a
	ld a, [hli]
	cp $20
	jr z, .asm_7a79e
	predef Func_7ae29
	hlcoord 12, 17
	lb de, $ff, $46
	ld bc, $3a
	predef Func_7c5ca
.asm_7a7b3
	predef Func_0150
Func_7a7b5:: ; 7a7b5 (1e:67b5)
	ld d, $6
	ld e, [hl]
	bit 7, e
	ret nz
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	xor a
	ret

Data_7a7c2:: ; 7a7c2
	db $04, $01, $0f, $ba, $c9, $0e, $b6, $b0, $c4, $d8, $af, $bc, $de, $0f, $c6, $b1, $c5, $c0, $c9, $00, $04, $02, $bc, $de, $ae, $b3, $ce, $b3, $a6, $c4, $b3, $db, $b8, $bc, $cf, $bd, $00, $02, $04, $c5, $cf, $b4, $3a, $00, $02, $05, $c3, $de, $dd, $dc, $3a, $00, $03, $06, $0e, $d2, $d3, $3a, $00, $ff

Data_7a7fe:: ; 7a7fe
	db $04, $00, $0a, $05, $0a, $0c, $06, $16, $0c, $07, $22, $0c, $08, $2e, $0c, $ff

Data_7a80e:: ; 7a80e
	db $03, $0a, $0f, $ba, $c9, $bc, $de, $ae, $b3, $ce, $b3, $c3, $de, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a824:: ; 7a824
	db $01, $0e, $0f, $ba, $c9, $bc, $de, $ae, $b3, $ce, $b3, $a6, $b6, $b4, $d9, $c4, $2c, $bd, $cd, $de, $c3, $c9, $00, $01, $0f, $0e, $cc, $a7, $b2, $d9, $0f, $b6, $de, $b7, $b4, $cf, $bd, $b6, $de, $a4, $b2, $b2, $c3, $de, $bd, $b6, $3f, $00, $ff

Data_7a855:: ; 7a855
	db $ca, $b2, $20, $00, $b2, $b2, $b4, $00

Func_7a85d:: ; 7a85d (1e:685d)
	ldh [hFF91], a
	ld a, $3
.asm_7a861
	ldh [hFF90], a
	ld a, $f
	predef Func_7d9f9
	ldh a, [hFF91]
	ld e, a
	ld d, $7
	predef Func_7bdec
	ld c, l
	ld b, h
	ld hl, Data_7a855
	ld de, $d301
	ldh a, [hFF90]
	ldh [hFFB4], a
	predef Func_7bd5b
	inc bc
	inc bc
	inc bc
	ldh a, [hFF90]
	swap a
	ldh [hFFB4], a
	predef Func_7bd5b
	ld a, $3
	ldh [hFFB4], a
.asm_7a88b
	predef DelayFrame
	predef Func_7e17c
	ld b, a
	ld a, $3
	bit 4, b
	jr nz, .asm_7a861
	swap a
	bit 5, b
	jr nz, .asm_7a861
	scf
	bit 1, b
	ret nz
	bit 0, b
	jr z, .asm_7a88b
	ldh a, [hFF90]
	cp $30
	ret

Bank1E_GetSRAMBank:: ; 7a8a9 (1e:68a9)
	ldh [hSRAMBank], a
	ld [HuC3SRamBank], a
	ret

WaitIRReady:: ; 7a8af (1e:68af)
	dec c
	jr z, .timed_out
	or a
	bit 0, [hl]
	ret

.timed_out
	scf
	ret

IR_SendByte:: ; 7a8b8 (1e:68b8)
	ld c, $8
.loop
	rla
	jr c, .set
	ld b, $a
	jr .unset

.set
	ld b, [hl]
	ld b, $1a
.unset
	call IR_SendBit
	dec c
	jr nz, .loop
	push bc
	pop bc
	ld b, $3c
	call IR_SendBit
	ld b, $a
	call IR_SendBit
	ret

IR_ReceiveByte:: ; 7a8d7 (1e:68d7)
	ld b, $0
.loop
	call IR_ReceiveBit
	jr c, .quit
	cp $1a
	jr nc, .loop2
	cp $f
	rl d
	jr .loop

.loop2
	ldh a, [rJOYP]
	bit 1, a
	jr z, .quit
	bit 0, [hl]
	jr nz, .loop2
	ld a, d
	cpl
	ret

.quit
	xor a
	ret

IR_SendByte2:: ; 7a8f7 (1e:68f7)
	push hl
	push de
	push bc
	ld hl, HuC3RTC
	ld d, a
	ld [hl], $1
	ld c, $0
.wait
	call WaitIRReady
	jr c, ir_quit_fail_2
	jr z, .wait
	push bc
	pop bc
	push bc
	pop bc
	ld [hl], $0
	ld c, $0
.wait2
	call WaitIRReady
	jr c, ir_quit_fail_2
	jr nz, .wait2
	ld a, d
	ld c, $8
.loop
	rla
	jr c, .send_1
	ld b, $a
	jr .got_bit

.send_1
	ld b, [hl]
	ld b, $1a
.got_bit
	call IR_SendBit
	dec c
	jr nz, .loop
	push bc
	pop bc
	ld b, $a
	call IR_SendBit
	xor a
	pop bc
	pop de
	pop hl
	ret

IR_ReceiveByte2:: ; 7a937 (1e:6937)
	push hl
	push de
	push bc
	ld hl, HuC3RTC
	ld c, $0
	ld [hl], $0
.wait
	call WaitIRReady
	jr c, ir_quit_fail_2
	jr z, .wait
	ld [hl], $1
	ld c, $0
.wait2
	call WaitIRReady
	jr c, ir_quit_fail_2
	jr nz, .wait2
	push bc
	pop bc
	push bc
	pop bc
	ld [hl], $0
	ld c, $8
	ld b, $0
.wait3
	inc b
	jr z, ir_quit_fail_2
	bit 0, [hl]
	jr z, .wait3
	ld c, $8
.loop
	call IR_ReceiveBit
	jr c, ir_quit_fail_2
	cp $f
	rl d
	dec c
	jr nz, .loop
	ld c, $0
.wait4
	call WaitIRReady
	jr c, ir_quit_fail_2
	jr nz, .wait4
	ld a, d
	cpl
	pop bc
	pop de
	pop hl
	or a
	ret

ir_quit_fail_2:
	ld [hl], $0
	pop bc
	pop de
	pop hl
ir_quit_fail:
	ld a, $ff
	or a
	scf
	ret

IR_SendBit:: ; 7a98c (1e:698c)
	push af
	ld a, $a
	ld [hl], $1
.wait_a
	dec a
	jr nz, .wait_a
	ld [hl], a
	ld a, b
.wait_b
	dec a
	jr nz, .wait_b
	pop af
	ret

IR_ReceiveBit:: ; 7a99b (1e:699b)
	ld b, $0
.wait_bit_set
	inc b
	jr z, ir_quit_fail
	bit 0, [hl]
	jr z, .wait_bit_set
	ld b, $0
.wait_bit_cleared
	inc b
	jr z, ir_quit_fail
	bit 0, [hl]
	jr nz, .wait_bit_cleared
.wait_bit_set_again
	inc b
	jr z, ir_quit_fail
	bit 0, [hl]
	jr z, .wait_bit_set_again
	or a
	ld a, b
	ret

Func_7a9b7:: ; 7a9b7 (1e:69b7)
	ld hl, HuC3RTC
.loop
	ldh a, [rJOYP]
	bit 1, a
	jr z, ir_quit_fail
	ld a, $aa
	call IR_SendByte
	call IR_ReceiveByte
	cp $55
	jr nz, .loop
	ldh a, [rJOYP]
	bit 1, a
	jr z, ir_quit_fail
	ld a, $c3
	call IR_SendByte
	call IR_ReceiveByte
	cp $3c
	jr nz, .loop
	xor a
	ret

Func_7a9e0:: ; 7a9e0 (1e:69e0)
	ld hl, HuC3RTC
.loop
	ldh a, [rJOYP]
	bit 1, a
	jr z, ir_quit_fail
	call IR_ReceiveByte
	cp $aa
	jr nz, .loop
	ld a, $55
	call IR_SendByte
	ldh a, [rJOYP]
	bit 1, a
	jr z, ir_quit_fail
	call IR_ReceiveByte
	cp $c3
	jr nz, .loop
	ld a, $3c
	call IR_SendByte
	xor a
	ret

ir_quit_fail_3:
	jp ir_quit_fail

Func_7aa0c:: ; 7aa0c (1e:6a0c)
	call Func_7a9b7
	jr c, ir_quit_fail_3
	ld a, $48
	call IR_SendByte2
	ld a, $75
	call IR_SendByte2
	ld hl, wc0f8
	ld c, $8
	jp IR_SendDataFrom

Func_7aa23:
.wait
	call Func_7a9e0
	jr c, ir_quit_fail_3
	call IR_ReceiveByte2
	cp $48
	jr nz, .wait
	call IR_ReceiveByte2
	cp $75
	jr nz, .wait
	ld hl, wc0f8
	ld c, $8
	jp IR_ReceiveDataTo

IR_SendDataFrom:: ; 7aa3e (1e:6a3e)
	ld b, $0
.loop
	ld a, b
	add [hl]
	ld b, a
	ld a, [hli]
	call IR_SendByte2
	jr c, .quit
	dec c
	jr nz, .loop
	ld a, b
	cpl
	inc a
	call IR_SendByte2
.quit
	ret

IR_ReceiveDataTo:: ; 7aa53 (1e:6a53)
	ld b, $0
.loop
	call IR_ReceiveByte2
	jr c, ir_quit_fail_3
	ld [hli], a
	add b
	ld b, a
	dec c
	jr nz, .loop
	call IR_ReceiveByte2
	add b
	or a
	jr nz, ir_quit_fail_3
	ret

EnterIR:: ; 7aa68 (1e:6a68)
	di
	ld a, $10
	ldh [rJOYP], a
	call EnableIR
	xor a
	ld [HuC3RTC], a
	ret

ExitIR:: ; 7aa75 (1e:6a75)
	xor a
	ld [HuC3RTC], a
	call DisableIR
	ld a, $30
	ldh [rJOYP], a
	ei
	ret

EnableIR:: ; 7aa82 (1e:6a82)
	push af
	ld a, CART_IR_ON
	jr setIRmode

DisableIR:: ; 7aa87 (1e:6a87)
	push af
	xor a
setIRmode:
	ld [HuC3SRamMode], a
	pop af
	ret

Func_7aa8e:: ; 7aa8e (1e:6a8e)
	call EnterIR
.while
	call Func_7aa23
	jr c, .done
	jr nz, .while
	ld hl, wc0f9
	ld a, [hl]
	ld hl, Pointers_7aab9
	cp $d
	jr nc, .while
	call .CallRoutine
	jr .while

.done
	call ExitIR
	xor a
	scf
	ret

.CallRoutine
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_7aab9:: ; 7aab9
	dw Func_7aae2
	dw Func_7aae8
	dw Func_7aaf3
	dw Func_7ab1a
	dw Func_7ab2a
	dw Func_7ab22
	dw Func_7ab77
	dw Func_7ab3b
	dw Func_7ab97
	dw Func_7aba1
	dw Func_7ab62
	dw Func_7abc8
	dw Func_7abd7

Func_7aad3:: ; 7aad3 (1e:6ad3)
	call Func_7acfa
	call Func_7a9b7
	ret c
	ld hl, wc0f8
	ld c, $8
	jp IR_SendDataFrom

Func_7aae2:: ; 7aae2 (1e:6ae2)
	call ExitIR
	pop hl
	or a
	ret

Func_7aae8:: ; 7aae8 (1e:6ae8)
	ld hl, $0
	predef Func_7c5da
	ld a, [Byte_0014]
	jp Func_7aad3

Func_7aaf3:: ; 7aaf3 (1e:6af3)
	call Func_7ad13
	ld hl, wOAMBuffer
	call IR_ReceiveDataTo
	ret c
	call DisableIR
	call Func_7ad13
	hlcoord 16, 4
	ld de, wOAM00YCoord
	predef Func_7afe6
asm_7ab0b:
	call EnableIR
	call Func_7aad3
	ret c
	hlcoord 16, 4
	ld c, $0
	jp IR_SendDataFrom

Func_7ab1a:: ; 7ab1a (1e:6b1a)
	call Func_7ab83
	ret c
	predef Func_7caa0
	jr asm_7ab0b

Func_7ab22:: ; 7ab22 (1e:6b22)
	call Func_7ab83
	ret c
	predef Func_7c9de
	jr asm_7ab0b

Func_7ab2a:: ; 7ab2a (1e:6b2a)
	call DisableIR
	call Func_7ad13
	hlcoord 16, 4
	predef Func_7cb98
	call EnableIR
	jp Func_7aad3

Func_7ab3b:: ; 7ab3b (1e:6b3b)
	call Func_7ab4f
	push bc
	predef Func_7cc9a
	call EnableIR
	call Func_7aad3
	pop bc
	ret c
	ld hl, wOAM00YCoord
	jp IR_SendDataFrom

Func_7ab4f:: ; 7ab4f (1e:6b4f)
	call Func_7ad13
	ld b, $0
	inc c
	dec c
	jr nz, .asm_7ab59
	inc b
.asm_7ab59
	hlcoord 16, 4
	ld de, wOAM00YCoord
	jp DisableIR

Func_7ab62:: ; 7ab62 (1e:6b62)
	call Func_7ad13
	ld hl, wOAMBuffer
	call IR_ReceiveDataTo
	ret c
	call Func_7ab4f
	predef Func_7cca9
	call EnableIR
	jp Func_7aad3

Func_7ab77:: ; 7ab77 (1e:6b77)
	call Func_7ab83
	ret c
	predef Func_7c8ec
	call EnableIR
	jp Func_7aad3

Func_7ab83:: ; 7ab83 (1e:6b83)
	hlcoord 16, 4
	ld c, $0
	call IR_ReceiveDataTo
	ret c
	call DisableIR
	call Func_7ad13
	hlcoord 16, 4
	or a
	ret

Func_7ab97:: ; 7ab97 (1e:6b97)
	call Func_7a9b7
	ret c
	call Func_7ad13
	jp IR_SendDataFrom

Func_7aba1:: ; 7aba1 (1e:6ba1)
	ldh a, [hSRAMBank]
	push af
	call Func_7ad13
	call Func_7ac00
	ld de, wOAM00YCoord
	call DisableIR
	push de
	push bc
.asm_7abb2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7abb2
	call EnableIR
	call Func_7a9b7
	ret c
	pop bc
	pop hl
	call IR_SendDataFrom
	pop af
	jp Bank1E_GetSRAMBank

Func_7abc8:: ; 7abc8 (1e:6bc8)
	call Func_7ad13
	ld l, e
	ld h, d
Func_7abcd:: ; 7abcd (1e:6bcd)
	call IR_ReceiveDataTo
	jr c, .asm_7abd6
	sub b
	call IR_SendByte2
.asm_7abd6
	ret

Func_7abd7:: ; 7abd7 (1e:6bd7)
	ldh a, [hSRAMBank]
	push af
	call Func_7ad13
	ld hl, wOAM00YCoord
	push hl
	push de
	push bc
	call Func_7abcd
	pop bc
	pop hl
	pop de
	jr c, .asm_7abfc
	call Func_7ac00
	ld a, SRAM_READWRITE
	ld [HuC3SRamMode], a
.asm_7abf3
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7abf3
	call EnableIR
.asm_7abfc
	pop af
	jp Bank1E_GetSRAMBank

Func_7ac00:: ; 7ac00 (1e:6c00)
	push hl
	ld a, b
	rl h
	rla
	rl h
	rla
	rl h
	rla
	call Bank1E_GetSRAMBank
	pop hl
	ld a, h
	and $1f
	or $a0
	ld h, a
	ret

Func_7ac16:: ; 7ac16 (1e:6c16)
	call EnterIR
	ld a, $0
	ld [wc0f9], a
	call Func_7aa0c
	jr asm_7ac76

Func_7ac23:: ; 7ac23 (1e:6c23)
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac2a:: ; 7ac2a (1e:6c2a)
	ld a, $2
	call Func_7ace6
	ld l, e
	ld h, d
	jr asm_7ac3e

Func_7ac33:: ; 7ac33 (1e:6c33)
	ld a, $5
	jr asm_7ac39

Func_7ac37:: ; 7ac37 (1e:6c37)
	ld a, $3
asm_7ac39:
	call Func_7ace6
	ld c, $0
asm_7ac3e:
	call IR_SendDataFrom
	jr c, asm_7ac76
	call Func_7ad13
	push hl
	call Func_7ac7c
	pop hl
	jr c, asm_7ac76
	ld c, $0
	call IR_ReceiveDataTo
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac56:: ; 7ac56 (1e:6c56)
	ld a, $4
	call Func_7ace6
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ac62:: ; 7ac62 (1e:6c62)
	ld a, $6
	call Func_7ace6
	ld c, $0
	call IR_SendDataFrom
	jr c, asm_7ac76
	call Func_7ac7c
	jr c, asm_7ac76
asm_7ac73:
	call Func_7ad13
asm_7ac76:
	push af
	call ExitIR
	pop af
	ret

Func_7ac7c:: ; 7ac7c (1e:6c7c)
	call Func_7a9e0
	jr c, asm_7ac76
	ld hl, wc0f8
	ld c, $8
	jp IR_ReceiveDataTo

Func_7ac89:: ; 7ac89 (1e:6c89)
	ld a, $9
	jr asm_7ac8f

Func_7ac8d:: ; 7ac8d (1e:6c8d)
	ld a, $8
asm_7ac8f:
	call Func_7ace6
	push de
	push bc
	call Func_7a9e0
	pop bc
	pop hl
	jr c, asm_7ac76
	call IR_ReceiveDataTo
	jr asm_7ac76

Func_7aca0:: ; 7aca0 (1e:6ca0)
	ld a, $c
	jr asm_7aca6

Func_7aca4:: ; 7aca4 (1e:6ca4)
	ld a, $b
asm_7aca6:
	call Func_7ace6
	call IR_SendDataFrom
	jr c, asm_7ac76
	call IR_ReceiveByte2
	jr c, asm_7ac76
	add b
	jr nz, .asm_7acb9
	xor a
	jr asm_7ac76

.asm_7acb9
	call ir_quit_fail
asm_7acbc:
	jr asm_7ac76

Func_7acbe:: ; 7acbe (1e:6cbe)
	ld a, $7
	call Func_7ace6
	push de
	push bc
	call Func_7ac7c
	pop bc
	pop hl
	jr c, asm_7ac76
	call IR_ReceiveDataTo
	jr c, asm_7ac76
	jr asm_7ac73

Func_7acd3:: ; 7acd3 (1e:6cd3)
	ld a, $a
	call Func_7ace6
	ld l, e
	ld h, d
	call IR_SendDataFrom
	jr c, asm_7ac76
	call Func_7ac7c
	jr c, asm_7ac76
	jr asm_7ac73

Func_7ace6:: ; 7ace6 (1e:6ce6)
	push hl
	push de
	push bc
	call Func_7acfa
	call EnterIR
	call Func_7aa0c
	pop bc
	pop de
	pop hl
	ret nc
	inc sp
	inc sp
	jr asm_7acbc

Func_7acfa:: ; 7acfa (1e:6cfa)
	push de
	push hl
	push af
	ld hl, wc0f8
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_7ad13:: ; 7ad13 (1e:6d13)
	ld hl, wc0f8
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	pop af
	ret

Func_7ad2a:: ; 7ad2a (1e:6d2a)
	ld b, [hl]
	inc hl
	push hl
	predef Func_7d738
	jp c, .quit
	ldh [hFFA1], a
	ld a, b
	pop bc
.loop
	push af
	ld a, [bc]
	inc bc
	add e
	ld [hli], a
	ld a, [bc]
	inc bc
	add d
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	pop af
	dec a
	jr nz, .loop
	push hl
.quit
	pop hl
	ldh a, [hFFA1]
	ret

Func_7ad4e:: ; 7ad4e (1e:6d4e)
	ld hl, wc3ca
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wc3cc
	ld [hl], $1
	inc hl
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hli], a
	ld [hl], $ef
	ld h, b
	ld l, $0
	xor a
.asm_7ad68
	ld [hl], a
	inc l
	jr nz, .asm_7ad68
	ret

Func_7ad6d:: ; 7ad6d (1e:6d6d)
	push hl
	push de
.asm_7ad6f
	push bc
	call Func_7ad7e
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, .asm_7ad6f
	pop de
	pop hl
	ret

Func_7ad7e:: ; 7ad7e (1e:6d7e)
	ld hl, wc3d0
	ld a, [hl]
	or a
	jr z, .asm_7ad91
	dec [hl]
	inc hl
.asm_7ad87
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc [hl]
	inc hl
	ld a, [bc]
	ld c, [hl]
	inc [hl]
	ld [bc], a
	ret

.asm_7ad91
	ld hl, wc3ca
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	dec [hl]
	inc hl
	jr nz, .asm_7ada3
	dec hl
	ld [hl], $8
	inc hl
	ld a, [bc]
	inc bc
	ld [hl], a
.asm_7ada3
	rl [hl]
	ld a, [bc]
	inc bc
	jr nc, .asm_7adb9
	ld hl, wc3ca
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, wc3d1
	ld b, [hl]
	inc hl
	inc hl
	ld c, [hl]
	inc [hl]
	ld [bc], a
	ret

.asm_7adb9
	ld [wc3d2], a
	ld hl, wc3ce
	bit 0, [hl]
	jr nz, .asm_7add9
	set 0, [hl]
	inc hl
	ld a, [bc]
	inc bc
	ld [hli], a
	swap a
.asm_7adcb
	and $f
	inc a
	ld [hli], a
	push hl
	ld hl, wc3ca
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	jr .asm_7ad87

.asm_7add9
	res 0, [hl]
	inc hl
	ld a, [hli]
	jr .asm_7adcb

Func_7addf:: ; 7addf (1e:6ddf)
	predef Func_7ccf1
	ret nc
	push hl
	push de
	ld bc, $c
	add hl, bc
	ld c, [hl]
	ld hl, wOAMBuffer
	xor a
	ld [hli], a
	ld [hld], a
.asm_7adef
	push bc
	call Func_7b148
	pop bc
	jr c, .asm_7ae26
	ld a, [wOAM02XCoord]
	ld b, a
	bit 4, b
	jr z, .asm_7adef
	ld a, [wOAM03YCoord]
	cp c
	jr nz, .asm_7adef
	ld de, $d
	add hl, de
	ld a, [wOAM02Attrs]
	sub $61
	bit 3, b
	jr z, .asm_7ae13
	sub $60
.asm_7ae13
	ld e, a
	add hl, de
	pop de
	push de
	ld c, $60
.asm_7ae19
	ld a, [hli]
	ld [de], a
	inc de
	bit 3, b
	jr z, .asm_7ae21
	ld a, [hli]
.asm_7ae21
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7ae19
.asm_7ae26
	pop de
	pop hl
	ret

Func_7ae29:: ; 7ae29 (1e:6e29)
	predef Func_7c437
	ld hl, Data_78000
	ld de, $fe00
.asm_7ae31
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	inc hl
	inc hl
	inc hl
	push bc
	push de
	ld b, a
	ld c, $ff
	push bc
	push hl
	ld hl, sp+$0
	ld bc, $4
	predef Func_7c5ca
	pop hl
	pop bc
	pop de
	pop hl
	inc e
	ld a, l
	or h
	jr nz, .asm_7ae31
	predef Func_02fd
	ret

Func_7ae5e:: ; 7ae5e (1e:6e5e)
	add sp, -$4
	push hl
	ld hl, sp+$2
	ld d, $fe
	ld bc, $4
	predef Func_7c577
	pop bc
	pop hl
	pop de
	ld a, l
	or h
	jr z, .asm_7ae7a
	ld a, e
	cp $ff
	jp z, Func_7b19c
	predef Func_7ca3c
	ret

.asm_7ae7a
	ld l, c
	ld h, b
	xor a
	ld [hli], a
	ld [hld], a
	scf
	ret

asm_7ae81:
	cp c
	ld c, a
	ld b, a
	jr nz, asm_7ae89
Func_7ae86:: ; 7ae86 (1e:6e86)
	ld c, $0
	ld b, c
asm_7ae89:
	ld a, [hli]
	or a
	ret z
	cp $22
	jr z, asm_7ae81
	cp $27
	jr z, asm_7ae81
	inc b
	dec b
	jr nz, .asm_7ae9c
	predef Func_7c1b0
	jr asm_7ae89

.asm_7ae9c
	cp $40
	jr z, .asm_7aec0
	cp $25
	jr z, .asm_7aecd
	cp $3b
	jr z, .asm_7aed5
	cp $2b
	jr z, .asm_7aedf
	cp $5b
	jr z, .asm_7aee5
	cp $5d
	jr z, .asm_7aeeb
	inc c
	dec c
	jr z, .asm_7aebc
	predef Func_7c259
	jr asm_7ae89

.asm_7aebc
	predef Func_7c1b0
	jr asm_7ae89

.asm_7aec0
	ld a, $30
	call Func_7aef7
	ld a, $35
	predef Func_7c1b0
	ld c, $0
	jr asm_7ae89

.asm_7aecd
	ld a, $32
	call Func_7aef2
	ld c, b
	jr asm_7ae89

.asm_7aed5
	ld a, $23
	predef Func_7c1b0
	ld a, $23
	predef Func_7c1b0
	jr asm_7ae89

.asm_7aedf
	ld c, $0
	ld a, $38
	jr .asm_7aeed

.asm_7aee5
	ld c, $0
	ld a, $34
	jr .asm_7aeed

.asm_7aeeb
	ld a, $36
.asm_7aeed
	call Func_7aef7
	jr asm_7ae89

Func_7aef2:: ; 7aef2 (1e:6ef2)
	push af
	call Func_7aef7
	pop af
Func_7aef7:: ; 7aef7 (1e:6ef7)
	push af
	ld a, $2a
	predef Func_7c1b0
	pop af
	predef Func_7c1b0
	ret

Func_7af00:: ; 7af00 (1e:6f00)
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	push af
	push de
	push bc
	and $7f
	ld c, a
	ld b, $0
	add a
	add e
	ld e, a
	ld a, b
	adc d
	ld d, a
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	dec hl
	ld a, l
	sub c
	ld a, h
	sbc b
	pop de
	pop bc
	ret nc
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	add hl, de
	bit 7, b
	jr nz, .asm_7af2f
	pop af
.asm_7af2f
	jp hl

Func_7af30:: ; 7af30 (1e:6f30)
	push bc
	push de
	push hl
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_7af39:: ; 7af39 (1e:6f39)
	ld hl, sp+$7
	ld b, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	dec hl
	ld a, [hl]
	dec hl
	ld l, [hl]
	ld h, a
	ld a, [hli]
	sub e
	ld a, [hl]
	sbc d
	dec hl
	jr z, .asm_7af5d
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, sp+$8
	add sp, $2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_7af5d
	pop hl
	add sp, $8
	jp hl

Func_7af61:: ; 7af61 (1e:6f61)
	push bc
.asm_7af62
	dec bc
	ld a, [hli]
	cp e
	jr z, .asm_7af6d
	ld a, b
	or c
	jr nz, .asm_7af62
	pop bc
	push bc
.asm_7af6d
	pop hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ret

Func_7af75:: ; 7af75 (1e:6f75)
	ld a, [de]
	cp [hl]
	jr nz, .asm_7af84
	inc de
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, Func_7af75
	ld hl, $0
	ret

.asm_7af84
	sbc a
	ld h, a
	add a
	inc a
	ld l, a
	ret

Func_7af8a:: ; 7af8a (1e:6f8a)
	ld d, h
	ld e, l
	ld hl, $0
.asm_7af8f
	ld a, [de]
	or a
	ret z
	inc de
	inc hl
	jr .asm_7af8f

Func_7af96:: ; 7af96 (1e:6f96)
	ldh a, [hFF92]
	ld e, a
	ld a, [hli]
	or a
	ret z
	bit 6, e
	jr nz, .asm_7afae
	cp CHARVAL(" ")
	jr c, .asm_7afd1
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .asm_7afae
	inc hl
	or a
	jr z, .asm_7afb5
.asm_7afae
	predef Func_7d93e
	jr Func_7af96

.asm_7afb2
	xor a
	jr .asm_7afae

.asm_7afb5
	ldh a, [hFF92]
	bit 3, a
	jr z, .asm_7afb2
	push bc
	push hl
	ld c, a
	reg8rot a, d, e
	ld b, $1
	ld hl, wc3e0
	predef Func_026c
	ld hl, wc3e0
	predef Func_7d98c
	pop hl
	pop bc
	ld a, $1
.asm_7afd1
	predef Func_7d9f9
	jr Func_7af96

Func_7afd5:: ; 7afd5 (1e:6fd5)
	ld a, [hl]
	or a
	ret z
	push hl
	ld l, e
	ld h, d
	predef Func_7d905
	pop hl
	push de
	call Func_7af96
	pop de
	inc e
	jr Func_7afd5

Func_7afe6:: ; 7afe6 (1e:6fe6)
	xor a
	ld b, a
	ld [hli], a
	ld [hld], a
	ld a, c
	or a
	jr nz, .asm_7aff7
	inc b
	push de
.asm_7aff0
	inc de
	inc c
	ld a, [de]
	or a
	jr nz, .asm_7aff0
	pop de
.asm_7aff7
	push de
	push bc
	call Func_7b148
	pop bc
	pop de
	jr c, .asm_7b007
	call Func_7b024
	jr nz, .asm_7aff7
	xor a
	ret

.asm_7b007
	push hl
	xor a
	ld [hli], a
	ld [hli], a
	ld b, $0
	ld a, $8
	add l
	ld l, a
	ld a, b
	adc h
	ld h, a
	ld a, [Byte_0014]
	ld [hli], a
	ld [hl], c
	inc hl
.asm_7b01a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7b01a
	pop hl
	xor a
	scf
	ret

Func_7b024:: ; 7b024 (1e:7024)
	push hl
	push de
	push bc
	ld a, $9
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	or a
	jr z, .asm_7b045
	ld b, [hl]
	bit 4, b
	jr z, .asm_7b045
	inc hl
	inc hl
	ld a, [hli]
	sub $60
	bit 3, b
	jr z, .asm_7b048
	sub $60
	jr .asm_7b048

.asm_7b045
	inc hl
	inc hl
	ld a, [hli]
.asm_7b048
	cp c
	jr nz, .asm_7b052
	ld b, $0
	call Func_7af75
	ld a, h
	or l
.asm_7b052
	pop bc
	pop de
	pop hl
	ret

Func_7b056:: ; 7b056 (1e:7056)
	pop de
	push de
	hlcoord 16, 4
	ld bc, $ff
	predef CopyPredef
	ld hl, wOAM00YCoord
	xor a
	ld [hli], a
	ld [hld], a
.asm_7b066
	call Func_7b148
	jr c, .asm_7b0aa
	ld a, [wOAM02XCoord]
	and $4
	jr z, .asm_7b066
	ld a, [wOAM03YCoord]
	and $7f
	ld b, a
	aCoord 8, 5
	and $7f
	cp b
	jr nz, .asm_7b066
	ld a, [wOAM02VTile]
	or a
	jr z, .asm_7b08d
	ld b, a
	ld a, [Byte_0014]
	cp b
	jr nz, .asm_7b066
.asm_7b08d
	ld a, [wOAM00VTile]
	cp $ff
	jr z, .asm_7b0a5
	ld hl, wOAM00YCoord
	call Func_7b113
	predef Func_7c586
	ld d, h
	ld e, l
.asm_7b09e
	pop bc
	ld sp, $e000
	push de
	jr asm_7b0f7

.asm_7b0a5
	call Func_7b124
	jr .asm_7b09e

.asm_7b0aa
	pop hl
	decoord 16, 4
	ld bc, $ff
	predef CopyPredef
	scf
	ret

Func_7b0b5:: ; 7b0b5 (1e:70b5)
	ld a, [hli]
	or [hl]
	dec hl
	ret z
	xor a
	ldh [hFFB7], a
	push hl
	inc hl
	inc hl
	ld a, [hl]
	dec hl
	dec hl
	cp $ff
	jr z, .asm_7b0e6
	call Func_7b113
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jr z, .asm_7b0d9
	ld a, [Byte_0014]
	cp [hl]
	jr z, .asm_7b0d9
	pop hl
	scf
	ret

.asm_7b0d9
	dec hl
	ld a, [hl]
	and $4
	jp z, Func_7b056
	predef Func_7c586
	ld d, h
	ld e, l
	jr .asm_7b0e9

.asm_7b0e6
	call Func_7b124
.asm_7b0e9
	pop bc
	ld sp, wStackTop
	push de
	call Func_7b108
	hlcoord 16, 4
	xor a
	ld [hli], a
	ld [hl], a
asm_7b0f7:
	hlcoord 12, 17
	ld e, $0
	ld bc, $df00
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	predef Func_7d5e7
	ret

Func_7b108:: ; 7b108 (1e:7108)
	ld hl, wOAM00YCoord
	ld d, b
	ld e, c
	ld bc, $ff
	predef CopyPredef
	ret

Func_7b113:: ; 7b113 (1e:7113)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	ldh [hFF97], a
	inc hl
	inc hl
	ld a, [hli]
	add e
	ld e, a
	ld a, [hli]
	adc d
	ld d, a
	ret

Func_7b124:: ; 7b124 (1e:7124)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	add e
	ld e, a
	ld a, [hli]
	adc d
	ld d, a
	ret

Func_7b133:: ; 7b133 (1e:7133)
	ldh a, [hROMBank]
	ld e, a
	ldh a, [hSRAMBank]
	ld d, a
	push de
	push hl
	ld hl, sp+$0
	ld de, rWave_c
	ld bc, $4
	predef Func_7c5ca
	pop hl
	pop de
	ret

Func_7b148:: ; 7b148 (1e:7148)
	ld a, [hli]
	or [hl]
	jr z, .asm_7b153
	inc hl
	ld a, [hl]
	dec hl
	cp $ff
	jr z, .asm_7b15a
.asm_7b153
	dec hl
	predef Func_7c9de
	ret nc
	xor a
	ld [hli], a
	ld [hl], a
.asm_7b15a
	dec hl
	ld c, l
	ld b, h
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	or l
	jr z, .asm_7b195
	ld de, -6
	add hl, de
	jr nc, .asm_7b16e
	ld a, h
	rlca
	jr nc, .asm_7b172
.asm_7b16e
	ld l, c
	ld h, b
	scf
	ret

.asm_7b172
	ld e, l
	ld d, h
	ld a, [hli]
	cpl
	cp [hl]
	jr nz, .asm_7b16e
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_7b16e
	ld a, h
	cp d
	jr c, .asm_7b18a
	jr nz, .asm_7b16e
	ld a, l
	cp e
	jr nc, .asm_7b16e
.asm_7b18a
	ld a, [hl]
	cp $52
	jr z, .asm_7b198
	cp $5a
	jr nz, .asm_7b172
	jr .asm_7b198

.asm_7b195
	ld hl, Data_78000
.asm_7b198
	ld de, $6
	add hl, de
Func_7b19c:: ; 7b19c (1e:719c)
	ld e, l
	ld d, h
	push bc
	ld l, c
	ld h, b
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $ff
	ld [hli], a
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld b, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld c, a
	push bc
.asm_7b1bf
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7b1bf
	pop bc
	pop hl
	ld de, $2e
	bit 0, b
	jr nz, .asm_7b1cf
	ld e, d
.asm_7b1cf
	ld a, $5
	add c
	ld c, a
	add e
	ld e, a
	ld a, d
	adc a
	ld [hl], e
	inc hl
	ld [hl], a
	inc hl
	ld [hl], e
	inc hl
	ld [hl], a
	pop hl
	xor a
	ret

Func_7b1e1:: ; 7b1e1 (1e:71e1)
	predef Func_7c456
	ret c
	push hl
	lb de, $ff, $45
	ld bc, $1
	ld hl, sp+$0
	predef Func_7c577
	pop hl
	bit 0, l
	ret z
	call Func_7b222
	bit 0, a
	ret nz
	bit 1, a
	jr nz, asm_7b220
	add sp, -$4
	ld hl, sp+$0
	lb de, $ff, $3c
	ld bc, $4
	predef Func_7c577
	pop de
	pop bc
	ld a, d
	or e
	jr z, asm_7b220
	ld a, c
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld a, b
	ldh [hSRAMBank], a
	ld [HuC3SRamBank], a
	push de
	ret

Func_7b21d:: ; 7b21d (1e:721d)
	call Func_7b222
asm_7b220:
	predef Func_0150
Func_7b222:: ; 7b222 (1e:7222)
	predef SoundOffPredef
	predef Func_7b848
	ld a, $a4
	ld bc, $102
	ld de, $f10
	ld h, $0
	predef Func_7d753
	ld de, Data_7b2e2
	ld bc, wOAM00YCoord
	predef Func_7ad4e
	decoord 12, 17
	ld bc, $8f0
	predef Func_7ad6d
	ld de, $20c
	hlcoord 12, 17
	ld bc, $b68
	predef Func_7dde6
	ld a, $1
	predef Func_7d78e
	ld a, $f0
	predef Func_7e0c2
	bit 2, a
	jp nz, Func_7a6ee
	ret

Func_7b25b:: ; 7b25b (1e:725b)
	ld d, a
	push hl
	ld hl, Data_7b2cd
.asm_7b260
	ld a, [hl]
	cp $ff
	jr z, .asm_7b270
	ld a, d
	or a
	jr z, .asm_7b273
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jr .asm_7b260

.asm_7b270
	pop hl
	scf
	ret

.asm_7b273
	ld d, [hl]
	inc hl
	ld a, [hli]
	dec a
	cp e
	jr c, .asm_7b270
	sub e
	dec b
	cp b
	jr nc, .asm_7b280
	ld b, a
.asm_7b280
	inc b
	ld c, b
	ld b, $0
	jr nz, .asm_7b287
	inc b
.asm_7b287
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, d
	ld d, $0
	or a
	jr z, .asm_7b2aa
	ld a, $4
.asm_7b292
	sla e
	rl d
	sla c
	rl b
	dec a
	jr nz, .asm_7b292
	add hl, de
	ld e, l
	ld d, h
	pop hl
	push bc
	push hl
	predef CopyPredef
	pop hl
	pop bc
	add hl, bc
	or a
	ret

.asm_7b2aa
	ld b, e
	push bc
	ld e, l
	ld d, h
	ld bc, wOAM00YCoord
	predef Func_7ad4e
	pop bc
	pop hl
.asm_7b2b5
	push hl
	push bc
	ld d, h
	ld e, l
	ld bc, $10
	push bc
	predef Func_7ad6d
	pop de
	pop bc
	pop hl
	ld a, b
	dec b
	or a
	jr nz, .asm_7b2b5
	inc b
	add hl, de
	dec c
	jr nz, .asm_7b2b5
	ret

Data_7b2cd:: ; 7b2cd
	db $00, $c7, $b2, $50, $00, $38, $33, $5d, $00, $8f, $e2, $72, $10, $06, $28, $40, $10, $09, $6b, $7f, $ff

Data_7b2e2:: ; 7b2e2
	db $ab, $1f, $ef, $11, $1b, $f3, $18, $f7, $80, $1e, $1e, $8b, $1f, $03, $01, $01, $f7, $1c, $0b, $02, $19, $18, $de, $1b, $19, $f3, $1f, $19, $1f, $1c, $04, $10, $40, $f3, $19, $0f, $0f, $22, $33, $ff, $44, $55, $ff, $66, $0d, $77, $f4, $f7, $ef, $27, $e6, $01, $03, $9d, $00, $07, $c4, $0f, $07, $a0, $a4, $a1, $a3, $07, $9f, $00, $9d, $2e, $9b, $02, $eb, $ff, $bf, $11, $cf, $8f, $9f, $ef, $dd, $0d, $0d, $98, $30, $00, $03, $01, $b4, $0f, $ff, $06, $1e, $0c, $3c, $18, $78, $30, $f0, $fe, $60, $e0, $c0, $c0, $80, $80, $00, $e3, $00, $1f, $e1, $df, $00, $dd, $f8, $30, $fc, $98, $fe, $fd, $cc, $ff, $66, $7f, $33, $3f, $18, $00, $0c, $20, $d5, $b6, $13, $01, $ba, $05, $ff, $16, $27, $ff, $38, $19, $49, $f6, $bb, $96, $42, $be, $7f, $bf, $bf, $00, $e7, $56, $70, $c3, $e0, $05, $c7, $77, $c3, $c3, $73, $00, $36, $71, $6b, $44, $bd, $7e, $bd, $8f, $86, $7e, $11, $ff, $c1, $bf, $9c, $7f, $3e, $f7, $63, $e3, $c1, $c1, $c1, $e2, $a4, $f9, $b0, $01, $00, $ff, $87, $ec, $03, $cf, $86, $f1, $00, $fc, $78, $ed, $a1, $00, $18, $9f, $9d, $00, $9b, $3e, $1c, $b0, $ff, $e9, $fa, $ff, $1a, $0b, $1c, $f9, $5e, $87, $07, $77, $02, $e7, $3d, $da, $c7, $47, $39, $07, $07, $f7, $47, $e7, $50, $00, $31, $41, $41, $01, $c7, $07, $44, $2d, $60, $a3, $c0, $fb, $80, $e0, $c0, $f0, $60, $cd, $00, $fc, $98, $7f, $c9, $ff, $66, $7f, $33, $3f, $19, $1f, $f8, $0c, $0f, $06, $07, $03, $c3, $00, $80, $c3, $00, $3f, $7d, $7b, $00, $1e, $0c, $3c, $18, $78, $30, $dc, $f1, $60, $d1, $c7, $83, $8f, $88, $50, $6b, $fd, $e5, $c3, $ff, $bf, $bd, $3e, $25, $89, $05, $f6, $03, $3f, $3f, $3d, $a4, $06, $01, $b1, $00, $40, $b1, $01, $5d, $01, $80, $c8, $6f, $1e, $e3, $ff, $25, $67, $2c, $12, $fc, $fe, $2f, $60, $00, $ef, $df, $cf, $8c, $cf, $11, $0b, $4c, $0f, $fd, $fe, $fd, $aa, $34, $7f, $65, $87, $bc, $98, $9e, $8c, $8e, $86, $8e, $7f, $96, $f8, $d8, $d8, $98, $98, $18, $38, $ff, $18, $10, $38, $38, $30, $20, $70, $60, $4f, $49, $01, $c0, $44, $c8, $01, $03, $03, $07, $07, $ff, $0e, $3f, $1c, $ff, $79, $e7, $f3, $ae, $ff, $c7, $0e, $0e, $0c, $1c, $3d, $18, $11, $ff, $3b, $77, $3f, $fd, $7e, $f4, $f8, $d0, $b6, $e0, $6e, $c0, $81, $95, $14, $c1, $81, $9c, $0a, $34, $ff, $b3, $f5, $f1, $06, $0f, $d9, $10, $8f, $dd, $55, $13, $01, $cf, $df, $8f, $dc, $10, $0f, $e2, $ef, $00, $13, $12, $f0, $14, $00, $13, $dc, $00, $d9, $2d, $ff, $0d, $4f, $1e, $e3, $18, $2f, $65, $40, $70, $30, $60, $70, $7f, $5d, $c2, $e1, $cb, $c7, $ce, $9f, $f8, $ff, $3d, $fb, $71, $e3, $e3, $87, $c7, $07, $ff, $8e, $0e, $1c, $1f, $39, $7f, $73, $fe, $fc, $e7, $fc, $ce, $38, $9c, $30, $39, $10, $3f, $bd, $60, $92, $1a, $c1, $c0, $80, $c1, $9b, $01, $f4, $00, $03, $01, $03, $7b, $20, $01, $77, $82, $ff, $3e, $c4, $2b, $20, $e7, $e3, $e7, $e7, $ef, $ac, $c8, $ef, $ff, $b0, $02, $cf, $fe, $b3, $32, $cf, $f0, $20, $10, $ab, $ab, $00, $4b, $e3, $fd, $ff, $dd, $1f, $f5, $30, $7f, $35, $41, $77, $3f, $ff, $7f, $f6, $f8, $c0, $6f, $64, $80, $c0, $68, $01, $00, $80, $0b, $07, $f8, $5f, $3f, $7a, $fc, $f0, $15, $99, $40, $1d, $ff, $0f, $1f, $3a, $3c, $60, $70, $40, $e0, $7f, $67, $02, $83, $c1, $c7, $83, $8f, $86, $9e, $ff, $8c, $bc, $98, $78, $30, $f1, $60, $e3, $7f, $3a, $06, $9e, $0c, $dc, $8c, $fe, $cc, $ff, $ff, $66, $7f, $33, $3f, $19, $1f, $0c, $e6, $0f, $06, $07, $7e, $f6, $cf, $01, $03, $aa, $10, $bf, $c7, $7c, $c3, $87, $81, $83, $87, $07, $3a, $84, $40, $83, $87, $87, $c7, $8e, $00, $c7, $7b, $40, $ab, $00, $f7, $96, $99, $1f, $cd, $ad, $ff, $be, $cc, $b0, $01, $18, $18, $0f, $d1, $28, $30, $61, $5f, $00, $5d, $cf, $fb, $c6, $de, $cc, $3c, $18, $43, $82, $1e, $0c, $76, $01, $f0, $60, $e0, $ef, $09, $80, $80, $cc, $0f, $19, $00, $17, $15, $00, $13, $f8, $30, $fc, $98, $28, $51, $c6, $9f, $80, $ef, $02, $e0, $4a, $49, $00, $47, $e8, $e1, $e0, $e1, $79, $01, $e3, $79, $5a, $10, $79, $20, $55, $00, $53, $e2, $5c, $5f, $9d, $7d, $ff, $8e, $9f, $ff, $11, $b0, $f2, $31, $29, $e0, $2d, $00, $01, $0d, $00, $7f, $fe, $06, $ff, $73, $ff, $f9, $df, $8c, $0b, $00, $3d, $00, $f9, $f7, $0f, $e0, $c2, $10, $df, $dd, $00, $3d, $1b, $3b, $00, $cf, $cd, $00, $78, $30, $2b, $e6, $c6, $fc, $cf, $8f, $8f, $0f, $07, $07, $09, $0f, $6f, $7b, $c2, $10, $7e, $fc, $fe, $fe, $24, $e8, $dc, $f3, $e0, $f0, $fc, $f8, $26, $01, $24, $fe, $3e, $78, $23, $1f, $f8, $fc, $e8, $f0, $6d, $4d, $ff, $5e, $1e, $6f, $ff, $80, $91, $f1, $80, $00, $c0, $80, $c7, $bf, $60, $cb, $00, $fc, $98, $fe, $cc, $ff, $66, $fd, $7f, $33, $3f, $19, $1f, $0c, $fb, $0e, $77, $fc, $40, $31, $f0, $61, $a7, $c0, $83, $83, $45, $f9, $00, $07, $f6, $9d, $40, $c6, $e0, $d7, $1f, $ce, $e7, $c6, $fe, $ee, $3f, $9e, $10, $2f, $1f, $3f, $f8, $7f, $ff, $7f, $7d, $fb, $24, $e0, $00, $f6, $7b, $f5, $02, $3f, $1f, $47, $ef, $fd, $3d, $7e, $50, $3d, $01, $f8, $0f, $18, $13, $ff, $24, $35, $ff, $46, $1f, $57, $ff, $68, $72, $70, $98, $18, $d8, $98, $f8, $fd, $d8, $f8, $78, $78, $38, $38, $72, $d8, $04, $88, $00, $88, $84, $03, $80, $83, $00, $18, $8d, $8b, $00, $03, $89, $0f, $12, $96, $72, $12, $0f, $e3, $e1, $c0, $80, $b0, $c0, $c3, $00, $80, $0d, $00, $ca, $c3, $01, $c4, $00, $d2, $14, $c7, $0d, $00

AnonJumpRelativeTable:: ; 7b6d3 (1e:76d3)
	pop de
	ld a, [de]
	inc de
	inc h
	dec h
	jr nz, .default
	cp l
	jr nc, .go
.default
	ld l, a
.go
	ld a, l
	add a
	add e
	ld l, a
	ld a, $0
	adc d
	ld h, a
relAnonJumpTable::
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	add hl, de
	jp hl

AnonJumpRelativeTableLookup:: ; 7b6ec (1e:76ec)
	ld e, l
	ld d, h
	pop hl
	inc d
	dec d
	jr nz, .find_first_null
.indexed_array_in_table
	ld a, [hli]
	cp e
	jr z, relAnonJumpTable_find_first_non_null
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .indexed_array_in_table
	jr relAnonJumpTable

.find_first_null
	inc hl
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .find_first_null
relAnonJumpTable_find_first_non_null:
	ld a, [hli]
	or [hl]
	inc hl
	jr z, relAnonJumpTable_find_first_non_null
	dec hl
	dec hl
	jr relAnonJumpTable

AnonJumpRelativeTableLookup2:: ; 7b70d (1e:770d)
	ld e, l
	ld d, h
	pop hl
.find_in_table
	ld a, [hli]
	cp e
	jr nz, .not_found
	ld a, [hli]
	cp d
	jr z, relAnonJumpTable_find_first_non_null
	dec hl
.not_found
	inc hl
	ld a, [hli]
	or [hl]
	inc hl
	jr nz, .find_in_table
	jr relAnonJumpTable

asm_7b721:
	ld b, $a0
	bit 7, d
	jr z, asm_7b74e
	ld b, $41
	jr asm_7b74e

Func_7b72b:: ; 7b72b (1e:772b)
	ld a, d
	xor h
	rla
	jr c, asm_7b721
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	rra
	and $c0
	ld b, a
	ld a, l
	or h
	jr nz, .asm_7b742
	set 4, b
	jr asm_7b74e

.asm_7b742
	bit 7, h
	jr nz, .asm_7b748
	set 5, b
.asm_7b748
	bit 7, b
	jr nz, asm_7b74e
	set 0, b
asm_7b74e:
	ld a, b
	ld b, $0
	ld hl, Data_7b75d
	add hl, bc
	and [hl]
	ld hl, $0
	ret z
	inc hl
	scf
	ret

Data_7b75d:: ; 7b75d
	db $10, $60, $80, $90, $01, $11, $40, $50, $20, $30

Func_7b767:: ; 7b767 (1e:7767)
	ld a, [hli]
	bit 7, a
	ret nz
	push hl
	ld l, [hl]
	ld h, a
	predef Func_7d905
	pop hl
	inc hl
	predef Func_7af96
	jr Func_7b767

Func_7b776:: ; 7b776 (1e:7776)
	add sp, -$a
	ld hl, sp+$0
	ld [hli], a
	ld [hl], $0
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld [hl], $0
	ld hl, sp+$5
	ld a, [de]
	inc de
	ld [hld], a
	ld a, [de]
	inc de
	ld [hl], a
	ld hl, sp+$6
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
asm_7b797:
	dec de
	ld h, a
	or l
	jr z, .asm_7b79d
	add hl, de
.asm_7b79d
	ld e, l
	ld d, h
	ld hl, sp+$8
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$0
	ld e, [hl]
	jr asm_7b7f4

Func_7b7a9:: ; 7b7a9 (1e:77a9)
	push hl
	push de
	push hl
	add sp, -$4
	ld hl, sp+$0
	ld [hl], c
	inc hl
	ld [hl], $0
	inc hl
	ld [hl], b
	ld hl, sp+$8
	xor a
	ld [hli], a
	ld [hl], a
asm_7b7bb:
	predef DelayFrame
	predef Func_7e17c
	ld hl, sp+$3
	ld [hl], a
	ld c, a
	and $9
	jr nz, asm_7b813
	ld a, c
	and $6
	jr nz, asm_7b81d
	ld hl, sp+$2
	ld b, [hl]
	ld hl, sp+$0
	ld a, [hl]
	bit 6, c
	jr nz, .asm_7b7df
	bit 7, c
	jr nz, .asm_7b7e8
	call Func_7b827
	jr asm_7b7bb

.asm_7b7df
	dec a
	bit 7, a
	jr z, .asm_7b7ed
	ld a, b
	dec a
	jr .asm_7b7ed

.asm_7b7e8
	inc a
	cp b
	jr c, .asm_7b7ed
	xor a
.asm_7b7ed
	ld e, a
	call Func_7b832
	ld hl, sp+$0
	ld [hl], e
asm_7b7f4:
	inc hl
	ld [hl], $0
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld hl, sp+$8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_7b80e
	ld a, e
	ld de, .Return
	push de
	jp hl

.Return: ; 7b809 (1e:7809)
	jr nc, .asm_7b80e
	ld hl, sp+$0
	ld [hl], a
.asm_7b80e
	call Func_7b827
	jr asm_7b7bb

asm_7b813:
	call Func_7b832
	ld hl, sp+$0
	ld a, [hl]
	add sp, $a
	or a
	ret

asm_7b81d:
	call Func_7b832
	ld hl, sp+$0
	ld a, [hl]
	add sp, $a
	scf
	ret

Func_7b827:: ; 7b827 (1e:7827)
	ld hl, sp+$3
	ld a, [hl]
	inc [hl]
	and $f
	ret nz
	bit 4, [hl]
	jr z, asm_7b836
Func_7b832:: ; 7b832 (1e:7832)
	ld hl, sp+$9
	jr asm_7b838

asm_7b836:
	ld hl, sp+$8
asm_7b838:
	ld c, [hl]
	ld hl, sp+$2
	ld b, [hl]
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	add b
	ld l, a
	predef Func_7d905
	ld a, c
	predef Func_7d93e
	ret

Func_7b848:: ; 7b848 (1e:7848)
	ld hl, hFFAB
	xor a
	ld [hli], a
	ld [hl], a
	ldh [hFFAE], a
	ld c, $5
	ld hl, hFFAF
.asm_7b855
	ld [hli], a
	dec c
	jr nz, .asm_7b855
	ld a, $3
	ldh [hFFB4], a
	ret

Func_7b85e:: ; 7b85e (1e:785e)
	ld a, d
	ldh [hFFAA], a
	push de
	ld e, l
	ld d, h
	ld hl, hFFA8
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, e
	or d
	jr nz, .asm_7b878
	ld de, hFFAE
	ld a, [de]
	cp $4
	jr nz, .asm_7b878
	xor a
	ld [de], a
.asm_7b878
	pop de
	push de
	ld d, $1
	ld bc, $1305
	predef Func_7bdfe
	pop de
	push de
	ld a, d
	inc e
	ld d, $2
	ld hl, $10c
	ld bc, $c03
	predef Func_7be3e
	pop de
	push de
	inc e
	inc e
	ld bc, $1
	ld d, $0
	ld a, $7f
	predef Func_7d9c5
	predef Func_7d9c5
	predef Func_7d9c5
	pop de
	push de
	ld bc, $1
	ld d, $e
	ld a, $7e
	predef Func_7d9c5
	ld a, $75
	predef Func_7d9c5
	predef Func_7d9c5
	predef Func_7d9c5
	ld a, $7d
	predef Func_7d9c5
	pop de
	push de
	inc e
	inc e
	ld a, d
	add $24
	ld d, $f
	ld hl, $104
	ld bc, $401
	predef Func_7be3e
	pop de
	push de
	ld a, d
	add $28
	ld d, $0
	ld hl, $102
	ld bc, $202
	predef Func_7be3e
	xor a
	call Func_7bf1f
	pop de
	call Func_7bb09
	ld de, Data_7bfeb
	ld hl, $87f0
	ld bc, $10
	predef CopyPredef
	ret

Func_7b8eb:: ; 7b8eb (1e:78eb)
	push hl
	push de
	push bc
	add sp, -$3c
	ld hl, sp+$0
	ld e, l
	ld d, h
	ld hl, sp+$40
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7beff
	push af
	ld c, a
	jr .asm_7b905

.asm_7b900
	ld a, $20
	ld [de], a
	inc de
	inc c
.asm_7b905
	ld a, b
	cp c
	jr nz, .asm_7b900
	pop af
	ld c, a
	cp b
	jr nz, .asm_7b90f
	dec c
.asm_7b90f
	ld hl, sp+$3d
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	predef Func_7b93a
	ld hl, sp+$3d
	ld a, [hl]
	ld hl, sp+$0
	call Func_7be72
	ld c, a
	ld b, $0
	add hl, bc
	ld [hl], $0
	ld hl, sp+$0
	ld e, l
	ld d, h
	ld hl, sp+$40
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_7be8b
	add sp, $3c
	pop bc
	pop de
	pop hl
	ret

Func_7b93a:: ; 7b93a (1e:793a)
	push hl
	ld hl, hFFA2
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], b
	inc hl
	ld [hl], c
	inc hl
	pop bc
	push bc
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	ldh a, [hFFA4]
	ld c, a
	call Func_7bdaa
	ldh a, [hFFA5]
	ld c, a
	or a
	ld a, d
	jr z, .asm_7b959
.asm_7b959
	add e
	dec c
	jr nz, .asm_7b959
	ldh [hFFA2], a
	ld a, $1
	call Func_7bf1f
asm_7b964:
	predef DelayFrame
	predef Func_7e17c
	ld b, a
	and $c
	jr nz, asm_7b983
	ldh a, [hFFAB]
	cp $c
	jr z, Func_7b97b
	bit 0, b
	jr nz, asm_7b98e
	bit 1, b
	jr nz, asm_7b9c0
Func_7b97b:: ; 7b97b
	call Func_7b9f9
	call Func_7ba84
	jr asm_7b964

asm_7b983:
	call Func_7ba80
	xor a
	call Func_7bf1f
	ldh a, [hFFA5]
	or a
	ret

asm_7b98e:
	ldh a, [hFFAB]
	cp $c
	jr z, Func_7b97b
	ld hl, hFFA5
	ld a, [hld]
	cp [hl]
	jr nc, .asm_7b9be
	ldh a, [hFFAE]
	call Func_7bba4
	ld e, a
	ldh a, [hFFA2]
	ld d, a
	call Func_7bdbb
	call GetWordAtFFA6
	ldh a, [hFFA5]
	ld c, a
	ld b, $0
	add hl, bc
	ld [hl], e
	ld hl, hFFA4
	cp [hl]
	jr nc, .asm_7b9be
	inc hl
	inc [hl]
	ldh a, [hFFA3]
	add d
	ldh [hFFA2], a
.asm_7b9be
	jr Func_7b97b

asm_7b9c0:
	ldh a, [hFFA2]
	ld d, a
	ld hl, hFFA5
	ld a, [hld]
	ld c, a
	or a
	jr z, Func_7b97b
	cp [hl]
	jr nc, .asm_7b9d3
	ld e, $20
	call Func_7bdbb
.asm_7b9d3
	dec hl
	ld a, d
	sub [hl]
	ldh [hFFA2], a
	ld d, a
	ld e, $20
	call Func_7bdbb
	ld hl, hFFA5
	ld a, [hl]
	dec [hl]
	dec hl
	cp [hl]
	jr c, .asm_7b9e8
	dec a
.asm_7b9e8
	push af
	ld c, a
	ld b, $0
	call GetWordAtFFA6
	add hl, bc
	ld [hl], e
	pop af
	jr nc, .asm_7b9f6
	dec hl
	ld [hl], e
.asm_7b9f6
	jp Func_7b97b

Func_7b9f9:: ; 7b9f9 (1e:79f9)
	ldh a, [hFFB6]
	ld b, a
	ld hl, hFFAB
	ld a, [hli]
	cp $c
	jr z, .asm_7ba1a
	ld a, [hl]
	bit 6, b
	jr nz, .asm_7ba60
	bit 7, b
	jr nz, .asm_7ba6e
.asm_7ba0d
	ld hl, hFFAB
	ld a, [hl]
	bit 5, b
	jr nz, .asm_7ba4e
	bit 4, b
	jr nz, .asm_7ba57
	ret

.asm_7ba1a
	ld c, $5
	ld hl, hFFA8
	ld a, [hli]
	or [hl]
	jr nz, .asm_7ba25
	ld c, $4
.asm_7ba25
	ld hl, hFFAE
	ld a, [hl]
	bit 6, b
	jr nz, .asm_7ba3c
	bit 7, b
	jr nz, .asm_7ba45
	ld a, b
	and $30
	ret z
	push bc
	call Func_7ba80
	pop bc
	jr .asm_7ba0d

.asm_7ba3c
	dec a
	bit 7, a
	jr z, .asm_7ba4a
	ld a, c
	dec a
	jr .asm_7ba4a

.asm_7ba45
	inc a
	cp c
	jr c, .asm_7ba4a
	xor a
.asm_7ba4a
	ld [hl], a
	jp Func_7bb09

.asm_7ba4e
	dec a
	bit 7, a
	jr z, .asm_7ba5d
	ld a, $c
	jr .asm_7ba5d

.asm_7ba57
	inc a
	cp $d
	jr c, .asm_7ba5d
	xor a
.asm_7ba5d
	ld [hl], a
	jr asm_7ba7c

.asm_7ba60
	or a
	jr nz, .asm_7ba6b
	call Func_7bb56
	call Func_7bb09
	jr asm_7ba7c

.asm_7ba6b
	dec a
	jr asm_7ba7b

.asm_7ba6e
	cp $2
	jr c, .asm_7ba7a
	call Func_7bb66
	call Func_7bb09
	jr asm_7ba7c

.asm_7ba7a
	inc a
asm_7ba7b:
	ld [hl], a
asm_7ba7c:
	xor a
	ldh [hFFAD], a
	ret

Func_7ba80:: ; 7ba80 (1e:7a80)
	ld a, $10
	ldh [hFFAD], a
Func_7ba84:: ; 7ba84 (1e:7a84)
	ldh a, [hFFAD]
	and $f
	jr nz, .asm_7babc
	ldh a, [hFFA2]
	ld d, a
	ld hl, hFFA5
	ld a, [hld]
	ld c, a
	cp [hl]
	jr c, .asm_7ba9a
	dec hl
	ld a, d
	sub [hl]
	ld d, a
	dec c
.asm_7ba9a
	ldh a, [hFFAD]
	bit 4, a
	jr z, .asm_7baac
	ld b, $0
	call GetWordAtFFA6
	add hl, bc
	ld e, [hl]
	call Func_7bdc7
	jr .asm_7baba

.asm_7baac
	ld e, $20
	call Func_7bdc7
	push hl
	ld hl, wc3ee
	ld a, $ff
	ld [hli], a
	ld [hl], a
	pop hl
.asm_7baba
	predef CopyPredef
.asm_7babc
	ld hl, wc39c
	push hl
	xor a
	ld [hli], a
	ld [hld], a
	pop de
	ld hl, hFFAD
	ldh a, [hFFAB]
	cp $c
	jr z, .asm_7baed
	ld a, [hl]
	inc [hl]
	and $10
	ret nz
	ld hl, hFFAC
	ld a, [hld]
	add a
	add a
	add a
	add $80
	ld [de], a
	inc de
	ld a, [hl]
	add a
	add a
	add a
	add $18
	ld [de], a
	inc de
	ld a, $7f
	ld [de], a
	inc de
	ld a, $0
	ld [de], a
	ret

.asm_7baed
	ld a, [hl]
	inc [hl]
	and $f
	ret nz
	bit 4, [hl]
	jr nz, .asm_7bafa
	ld a, $30
	ldh [hFFB4], a
.asm_7bafa
	call Func_7bb2a
	ld a, $3
	ldh [hFFB4], a
	ret

GetWordAtFFA6:: ; 7bb02 (1e:7b02)
	ld hl, hFFA6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_7bb09:: ; 7bb09 (1e:7b09)
	ld c, $3
	call Func_7bb72
	push af
	ldh a, [hFFAA]
	ld d, a
.asm_7bb12
	ld b, $c
.asm_7bb14
	ld a, [hli]
	ld e, a
	call Func_7bdbb
	inc d
	dec b
	jr nz, .asm_7bb14
	push de
	call Func_7bb66
	pop de
	dec c
	jr nz, .asm_7bb12
	call Func_7bb72
	pop af
	ld [de], a
Func_7bb2a:: ; 7bb2a (1e:7b2a)
	ldh a, [hFFAA]
.asm_7bb2c
	add $24
	ld d, a
	ldh a, [hFFAE]
	add a
	add a
	ld c, a
	ld b, $0
	ld hl, Data_7bb42
	add hl, bc
	ld c, $4
	ld e, $1
	call Func_7bdaa
	ret

Data_7bb42:: ; 7bb42
	db $7b, $87, $8e, $75, $b6, $c0, $b6, $c5, $31, $32, $33, $34, $41, $42, $43, $44, $d2, $d3, $20, $20

Func_7bb56:: ; 7bb56 (1e:7b56)
	push de
	call Func_7bb8b
	ld a, [de]
	dec a
	bit 7, a
	jr z, .asm_7bb62
	ld a, [hl]
	dec a
.asm_7bb62
	ld [de], a
	pop de
	jr Func_7bb72

Func_7bb66:: ; 7bb66 (1e:7b66)
	push de
	call Func_7bb8b
	ld a, [de]
	inc a
	cp [hl]
	jr c, .asm_7bb70
	xor a
.asm_7bb70
	ld [de], a
	pop de
Func_7bb72:: ; 7bb72 (1e:7b72)
	push bc
	call Func_7bb8b
	inc hl
	ld a, [de]
	call Func_7bbcd
	ldh a, [hFFAE]
	cp $4
	jr nz, .asm_7bb87
	ld hl, hFFA8
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_7bb87
	add hl, bc
	ld a, [de]
	pop bc
	ret

Func_7bb8b:: ; 7bb8b (1e:7b8b)
	push bc
	ldh a, [hFFAE]
	ld c, a
	ld b, $0
	ld hl, hFFAF
	add hl, bc
	push hl
	add a
	ld e, a
	ld d, $0
	ld hl, Data_7bbd7
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	pop bc
	ret

Func_7bba4:: ; 7bba4 (1e:7ba4)
	push hl
	push de
	push bc
	call Func_7bbc0
	ldh a, [hFFAE]
	cp $4
	jr nz, .asm_7bbb6
	ld hl, hFFA8
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_7bbb6
	add hl, bc
	ldh a, [hFFAB]
	ld c, a
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_7bbc0:: ; 7bbc0 (1e:7bc0)
	call Func_7bb8b
	ldh a, [hFFAC]
	ld c, a
	ld a, [de]
	add c
	cp [hl]
	jr c, .asm_7bbcc
	sub [hl]
.asm_7bbcc
	inc hl
Func_7bbcd:: ; 7bbcd (1e:7bcd)
	ld c, a
	add a
	add a
	ld c, a
	add a
	add c
	ld c, a
	ld b, $0
	ret

Data_7bbd7:: ; 7bbd7
	db $68, $7c, $d5, $7c, $e2, $7b, $1f, $7c, $e1, $7b, $05, $05, $30, $31, $32, $33, $34, $20, $35, $36, $37, $38, $39, $20, $20, $28, $29, $3c, $3e, $20, $1b, $1d, $5b, $5d, $40, $20, $21, $3f, $22, $27, $23, $20, $2b, $2d, $2a, $2f, $25, $20, $2c, $2e, $5c, $24, $3d, $20, $3a, $3b, $5e, $26, $1c, $20, $1e, $1f, $5f, $20, $41, $20, $42, $43, $44, $45, $46, $20, $06, $41, $42, $43, $44, $45, $20, $46, $47, $48, $49, $4a, $20, $4b, $4c, $4d, $4e, $4f, $20, $50, $51, $52, $53, $54, $20, $55, $56, $57, $58, $59, $20, $5a, $20, $2e, $21, $3f, $20, $01, $02, $03, $04, $05, $20, $06, $07, $08, $09, $0a, $20, $0b, $0c, $0d, $0e, $0f, $20, $10, $11, $12, $13, $14, $20, $15, $16, $17, $18, $19, $20, $1a, $2d, $27, $28, $29, $20, $09, $61, $62, $63, $64, $65, $20, $66, $67, $68, $69, $6a, $20, $6b, $6c, $6d, $6e, $6f, $20, $70, $71, $72, $73, $74, $20, $75, $76, $77, $78, $79, $20, $7a, $7b, $7c, $7d, $7e, $20, $7f, $80, $81, $82, $83, $20, $84, $20, $85, $20, $86, $20, $87, $88, $89, $8a, $8b, $20, $8c, $20, $60, $20, $8d, $20, $8e, $8f, $90, $91, $92, $20, $93, $94, $95, $96, $97, $20, $98, $99, $9a, $9b, $9c, $20, $9d, $9e, $9f, $a0, $a1, $20, $a2, $a3, $a4, $a5, $a6, $20, $a7, $a8, $a9, $aa, $ab, $20, $ac, $ad, $ae, $af, $20, $20, $2d, $2c, $2e, $21, $3f, $20, $09, $b1, $b2, $b3, $b4, $b5, $20, $b6, $b7, $b8, $b9, $ba, $20, $bb, $bc, $bd, $be, $bf, $20, $c0, $c1, $c2, $c3, $c4, $20, $c5, $c6, $c7, $c8, $c9, $20, $ca, $cb, $cc, $cd, $ce, $20, $cf, $d0, $d1, $d2, $d3, $20, $d4, $20, $d5, $20, $d6, $20, $d7, $d8, $d9, $da, $db, $20, $dc, $20, $b0, $20, $dd, $20, $de, $df, $e0, $e1, $e2, $20, $e3, $e4, $e5, $e6, $e7, $20, $e8, $e9, $ea, $eb, $ec, $20, $ed, $ee, $ef, $f0, $f1, $20, $f2, $f3, $f4, $f5, $f6, $20, $f7, $f8, $f9, $fa, $fb, $20, $fc, $fd, $fe, $ff, $20, $20, $2d, $2c, $2e, $21, $3f, $20

Func_7bd42:: ; 7bd42 (1e:7d42)
	push bc
.asm_7bd43
	ld a, [hli]
	bit 7, a
	jr nz, .asm_7bd59
	push de
	ld d, a
	ld e, [hl]
	inc hl
	push hl
	call Func_7bdec
	ld c, l
	ld b, h
	pop hl
	pop de
	call Func_7bd5b
	jr .asm_7bd43

.asm_7bd59
	pop bc
	ret

Func_7bd5b:: ; 7bd5b (1e:7d5b)
	push hl
	push bc
	add sp, -$20
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld hl, sp+$22
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [hli]
	or a
	jr z, .quit
	cp $20
	jr nc, .next
	predef Func_7d9f9
	jr .loop

.next
	push de
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .no_carry
	inc hl
.no_carry
	pop de
	push de
	ld e, a
	call Func_7bdbb
	pop de
	ld a, d
	ld [bc], a
	inc bc
	ld a, d
	add e
	ld d, a
	jr .loop

.quit
	push de
	ld e, l
	ld d, h
	ld hl, sp+$24
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$2
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	ld e, l
	ld d, h
	ld hl, sp+$22
	ld a, [hli]
	ld h, [hl]
	ld l, a
	predef CopyPredef
	pop de
	add sp, $20
	pop bc
	pop hl
	ret

Func_7bdaa:: ; 7bdaa (1e:7daa)
	push de
	push bc
	ld b, e
.asm_7bdad
	ld e, [hl]
	inc hl
	call Func_7bdbb
	ld a, b
	add d
	ld d, a
	dec c
	jr nz, .asm_7bdad
	pop bc
	pop de
	ret

Func_7bdbb:: ; 7bdbb (1e:7dbb)
	push hl
	push de
	push bc
	call Func_7bdc7
	predef CopyPredef
	pop bc
	pop de
	pop hl
	ret

Func_7bdc7:: ; 7bdc7 (1e:7dc7)
	ld b, d
	ld hl, wc3e0
	push hl
	ldh a, [hFFB4]
	ld c, a
	predef GetJUTFCharacter_1bpp
	ld a, b
	xor $80
	ld h, $0
	add a
	rl h
	add a
	rl h
	add a
	rl h
	add a
	rl h
	ld l, a
	ld bc, $8800
	add hl, bc
	pop de
	ld bc, $10
	ret

Func_7bdec:: ; 7bdec (1e:7dec)
	ld h, e
	xor a
	srl h
	rra
	srl h
	rra
	srl h
	rra
	add d
	ld l, a
	ld a, h
	adc $98
	ld h, a
	ret

Func_7bdfe:: ; 7bdfe (1e:7dfe)
	call Func_7bdec
	ld a, $79
	lb de, $77, $78
	call Func_7be1b
	dec c
	dec c
.asm_7be0b
	ld a, $7f
	lb de, $75, $76
	call Func_7be1b
	dec c
	jr nz, .asm_7be0b
	ld a, $7c
	lb de, $7a, $7b
Func_7be1b:: ; 7be1b (1e:7e1b)
	add sp, -$20
	push hl
	push bc
	ld hl, sp+$4
	dec b
	dec b
	push hl
	ld [hl], d
	inc hl
.asm_7be26
	ld [hli], a
	dec b
	jr nz, .asm_7be26
	ld [hl], e
	pop de
	pop bc
	pop hl
	push hl
	push bc
	ld c, b
	ld b, $0
	predef CopyPredef
	pop bc
	pop de
	ld hl, $20
	add hl, de
	add sp, $20
	ret

Func_7be3e:: ; 7be3e (1e:7e3e)
	push af
	push hl
	add sp, -$20
	call Func_7bdec
.asm_7be45
	push hl
	push bc
	ld hl, sp+$25
	ld d, [hl]
	ld hl, sp+$27
	ld a, [hl]
	ld hl, sp+$4
	push hl
.asm_7be50
	ld [hli], a
	add d
	dec b
	jr nz, .asm_7be50
	pop de
	pop bc
	pop hl
	push hl
	push bc
	ld c, b
	ld b, $0
	predef CopyPredef
	ld hl, sp+$24
	ld a, [hl]
	ld hl, sp+$27
	add [hl]
	ld [hl], a
	pop bc
	pop de
	ld hl, $20
	add hl, de
	dec c
	jr nz, .asm_7be45
	add sp, $24
	ret

Func_7be72:: ; 7be72 (1e:7e72)
	push hl
	push de
	push bc
	ld b, a
	ld c, b
	ld e, b
	ld d, $0
	add hl, de
	dec hl
	inc c
.asm_7be7d
	scf
	dec c
	jr z, .asm_7be86
	ld a, [hld]
	cp $20
	jr z, .asm_7be7d
.asm_7be86
	ld a, c
	pop bc
	pop de
	pop hl
	ret

Func_7be8b:: ; 7be8b (1e:7e8b)
	push hl
	push bc
	ld c, $0
	ld b, $80
.asm_7be91
	ld a, [de]
	inc de
	cp $20
	jr c, .asm_7bea3
	cp $b0
	jr nc, .asm_7bec1
	cp $60
	jr nc, .asm_7beaf
.asm_7be9f
	ld [hli], a
	inc c
	jr .asm_7be91

.asm_7bea3
	add $60
	cp $60
	jr nz, .asm_7be9f
	ld [hl], $0
	ld a, c
	pop bc
	pop hl
	ret

.asm_7beaf
	bit 7, b
	jr z, .asm_7beb9
.asm_7beb3
	ld b, $1
	ld [hl], $f
	inc hl
	inc c
.asm_7beb9
	bit 0, b
	jr z, .asm_7beb3
	add $50
	jr .asm_7becf

.asm_7bec1
	bit 7, b
	jr z, .asm_7becb
.asm_7bec5
	ld b, $0
	ld [hl], $e
	inc hl
	inc c
.asm_7becb
	bit 0, b
	jr nz, .asm_7bec5
.asm_7becf
	cp $f7
	jr nc, .asm_7bedf
	cp $de
	jr nc, .asm_7bee3
	cp $b0
	jr nz, .asm_7be9f
	ld a, $a6
	jr .asm_7be9f

.asm_7bedf
	add $b0
	jr .asm_7be9f

.asm_7bee3
	cp $ed
	jr nc, .asm_7beef
	add $d8
.asm_7bee9
	ld [hli], a
	inc c
	ld a, $de
	jr .asm_7be9f

.asm_7beef
	cp $f2
	jr nc, .asm_7bef7
	add $dd
	jr .asm_7bee9

.asm_7bef7
	add $d8
	ld [hli], a
	inc c
	ld a, $df
	jr .asm_7be9f

Func_7beff:: ; 7beff (1e:7eff)
	push bc
	ld c, $0
.asm_7bf02
	ld a, [hli]
	or a
	jr z, .asm_7bf1c
	cp $20
	jr nc, .asm_7bf0e
	predef Func_7d9f9
	jr .asm_7bf02

.asm_7bf0e
	push de
	ld e, a
	ld d, [hl]
	predef Func_7db91
	jr nc, .asm_7bf16
	inc hl
.asm_7bf16
	pop de
	ld [de], a
	inc de
	inc c
	jr .asm_7bf02

.asm_7bf1c
	ld a, c
	pop bc
	ret

Func_7bf1f:: ; 7bf1f (1e:7f1f)
	ld e, a
	ldh a, [hFFAA]
	add $28
	ld d, a
	ld c, $4
	ld hl, Data_7bfab
Func_7bf2a:: ; 7bf2a (1e:7f2a)
	ld a, e
	push af
	push hl
	push bc
	ld e, d
	call Func_7bdc7
	pop bc
	pop de
	pop af
	or a
	jr nz, .asm_7bf46
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	predef CopyPredef
	ret

.asm_7bf46
	push bc
	push hl
	ld hl, wc3e0
	ld b, $10
.asm_7bf4d
	ld a, [de]
	inc de
	xor $ff
	ld [hli], a
	dec b
	jr nz, .asm_7bf4d
	pop hl
	push de
	push hl
	ld de, wc3e0
	ld bc, $10
	predef CopyPredef
	pop hl
	ld de, $10
	add hl, de
	pop de
	pop bc
	dec c
	jr nz, .asm_7bf46
	ret

Data_7bf6b:: ; 7bf6b
	db $ff, $7f, $80, $80, $9f, $8f, $90, $90, $90, $90, $90, $90, $94, $93, $90, $90, $ff, $ff, $01, $01, $f9, $f1, $09, $09, $09, $09, $09, $09, $29, $c9, $09, $09, $94, $93, $90, $90, $90, $90, $94, $93, $90, $90, $9f, $8f, $80, $80, $7f, $ff, $29, $c9, $09, $09, $09, $09, $29, $c9, $09, $09, $f9, $f1, $01, $01, $ff, $fe
 
Data_7bfab:: ; 7bfab
	db $ff, $7f, $80, $80, $81, $80, $83, $81, $87, $82, $8f, $84, $9f, $89, $9e, $9e, $fe, $fe, $01, $01, $f1, $e1, $f9, $31, $cd, $49, $8d, $8d, $15, $1d, $25, $3d, $92, $92, $91, $91, $90, $90, $b8, $98, $9f, $bf, $88, $b0, $80, $80, $7f, $ff, $49, $79, $91, $f1, $b1, $e1, $e1, $c1, $81, $c1, $01, $01, $01, $01, $ff, $fe
 
Data_7bfeb:: ; 7bfeb
	db $c3, $c3, $81, $81, $00, $00, $00, $00, $00, $00, $00, $00, $81, $81, $c3, $c3, $00

SECTION "Bank 1f", ROMX, BANK [$1f]
Pointers_7c000:: ; 7c000
	dw XorShortsPredef
	dw OrShortsPredef
	dw AndShortsPredef
	dw CplShortPredef
	dw CompareShortPredef
	dw RightShiftShortPredef
	dw LeftShiftShortPredef
	dw AddShortsPredef
	dw SubtractShortsPredef
	dw MultiplySignedShortPredef
	dw DivideSignedShortPredef
	dw NegateShortPredef
	dw AbsoluteValueShortPredef
	dw SeedRNGPredef
	dw RandomPredef
	dw Func_7c96e
	dw ReadRTCPredef
	dw WriteRTCPredef
	dw Func_7e2d8
	dw Func_7e320
	dw Func_7e486
	dw Func_7e497
	dw Func_7e373
	dw Func_7e44d
	dw Func_7e4aa
	dw Func_7e4d2
	dw Func_7e2fd
	dw SetRTCPredef
	dw Func_7e4f4
	dw Func_7e523
	dw RTCUpdatePredef
	dw Func_7c17e
	dw PrintNumLongPredef
	dw HexToIntPredef
	dw StrToIntPredef
	dw PrintNumShortPredef
	dw PrintHexShortPredef
	dw Func_7d5da
	dw Func_7d5e7
	dw Func_7db91
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw IR_Listen
	dw Func_7e6bd
	dw Func_7e75b
	dw Func_7e556
	dw IR_Receive_Predef
	dw Func_7dff6
	dw DelayFrame
	dw Func_7c17e
	dw Func_7d753
	dw Func_7d78e
	dw Func_7d8d7
	dw Func_7e064
	dw Func_7d8fc
	dw Func_7d905
	dw Func_7d9f9
	dw GetJUTFCharacter_1bpp
	dw Func_7d93e
	dw Func_7c100
	dw Func_7d918
	dw Func_7d98c
	dw Func_7de32
	dw Func_7dde6
	dw Func_7de0c
	dw Func_7ea15
	dw FrameDelayPredef_7ceaf
	dw Func_7d8c8
	dw Func_7d6cc
	dw Func_7d738
	dw Func_7d724
	dw Func_7d91f
	dw Func_7dc58
	dw Func_7d85d
	dw Func_7c17f
	dw Func_7c19f
	dw Func_7d9c5
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7e17c
	dw Func_0150
	dw Func_7e168
	dw Func_7e0d2
	dw Func_7e0c2
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c437
	dw Func_7c456
	dw Func_7c54a
	dw Func_7c566
	dw Func_7c577
	dw Func_7c5ca
	dw Func_7c5da
	dw Func_7c7b7
	dw Func_7c9de
	dw Func_7caa0
	dw Func_7cb98
	dw Func_7cc9a
	dw Func_7cca9
	dw Func_7ccf1
	dw Func_7c17e
	dw Func_7c8ec
	dw Func_7cbed
	dw Func_7c926
	dw Func_7c881
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c17e
	dw Func_7c1b0
	dw Func_7c259
	dw Func_7c17e
	dw Func_7c586
	dw Func_7ca3c
	dw CopyToVRAMPredef
	dw CopyFromVRAMPredef
	dw Func_7ce36

Func_7c100:: ; 7c100 (1f:4100)
	ld d, a
	push hl
	ld hl, Data_7c171
.asm_7c105
	ld a, [hl]
	cp $ff
	jr z, .asm_7c115
	ld a, d
	or a
	jr z, .asm_7c118
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jr .asm_7c105

.asm_7c115
	pop hl
	scf
	ret

.asm_7c118
	ld d, [hl]
	inc hl
	ld a, [hli]
	dec a
	cp e
	jr c, .asm_7c115
	sub e
	dec b
	cp b
	jr nc, .asm_7c125
	ld b, a
.asm_7c125
	inc b
	ld c, b
	ld b, $0
	jr nz, .asm_7c12c
	inc b
.asm_7c12c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, d
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	cp $8
	jr z, .asm_7c156
	sla e
	rl d
	sla c
	rl b
.asm_7c156
	add hl, de
	ld e, l
	ld d, h
	pop hl
	cp $8
	jr z, Func_7c167
	push bc
	push hl
	predef CopyPredef
	pop hl
	pop bc
	add hl, bc
	or a
	ret

Func_7c167:
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, Func_7c167
	ret

Data_7c171:: ; 7c171
	db $08, $00, $b5, $6f, $10, $0c, $b5, $77, $10, $78, $7f, $78, $ff

Func_7c17e:: ; 7c17e (1f:417e)
	ret

Func_7c17f:: ; 7c17f (1f:417f)
	ldh a, [rLCDC]
	bit 7, a
	ret z
.asm_7c184
	ldh a, [rLY]
	cp $48
	jr nc, .asm_7c184
	ld a, $0
	ldh [rTAC], a
	ld a, l
	ldh [rTMA], a
	ld a, h
	ldh [rTAC], a
	and $4
	ld h, a
	ldh a, [rIE]
	and $fb
	or h
	ldh [rIE], a
	ret

Func_7c19f:: ; 7c19f (1f:419f)
	push bc
	push de
	push hl
	ld c, a
	predef ToggleMusicPredef
	cp c
	jr z, .asm_7c1aa
	predef ToggleMusicPredef
.asm_7c1aa
	predef UpdateSoundPredef
	pop hl
	pop de
	pop bc
	ret

Func_7c1b0:: ; 7c1b0 (1f:41b0)
	cp $2d
	scf
	ret z
	cp $2a
	jr nz, .asm_7c1bc
	ld a, $a
	jr .asm_7c1cd

.asm_7c1bc
	cp $23
	jr nz, .asm_7c1c4
	ld a, $b
	jr .asm_7c1cd

.asm_7c1c4
	cp $30
	ret c
	cp $3a
	ccf
	ret c
	sub $30
.asm_7c1cd
	push bc
	push hl
	push af
	push de
	ld a, $80
	ldh [rNR52], a
	ld a, $66
	ldh [rNR51], a
	ld a, $77
	ldh [rNR50], a
	ld a, $80
	ldh [rNR21], a
	ld a, $f0
	ldh [rNR22], a
	ld a, $80
	ldh [rNR30], a
	ld a, $20
	ldh [rNR32], a
	ld hl, $ff30
	ld de, Data_7c231
	ld b, $10
.asm_7c1f5
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_7c1f5
	pop de
	pop af
	ld hl, Data_7c241
	add a
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hli]
	ldh [rNR33], a
	ld a, [hl]
	ldh [rNR23], a
	ld a, $87
	ldh [rNR24], a
	ldh [rNR34], a
	ld b, $6
.asm_7c213
	call DelayFrame
	dec b
	jr nz, .asm_7c213
	ldh a, [rNR30]
	and $7f
	ldh [rNR30], a
	ldh a, [rNR52]
	and $7f
	ldh [rNR52], a
	ld b, $6
.asm_7c227
	call DelayFrame
	dec b
	jr nz, .asm_7c227
	pop hl
	pop bc
	xor a
	ret

Data_7c231:: ; 7c231
	db $8a, $df, $fe, $ca, $74, $20, $01, $35, $8a, $df, $fe, $ca, $74, $20, $01, $35

Data_7c241:: ; 7c241
	db $74, $9e, $44, $94, $44, $9e, $44, $a8, $54, $94, $54, $9e, $54, $a8, $64, $94, $64, $9e, $64, $a8, $74, $94, $74, $a8

Func_7c259:: ; 7c259 (1f:4259)
	push bc
	push hl
	call Func_7c26e
	or a
	jr z, .asm_7c26a
	ld a, [hli]
	call Func_7c1b0
	ld a, [hl]
	call Func_7c1b0
	scf
.asm_7c26a
	ccf
	pop hl
	pop bc
	ret

Func_7c26e:: ; 7c26e (1f:426e)
	ld b, a
	ld hl, Data_7c30a
	ld a, c
	cp $27
	jr nz, .asm_7c27a
	ld hl, Data_7c283
.asm_7c27a
	ld a, [hli]
	or a
	ret z
	cp b
	ret z
	inc hl
	inc hl
	jr .asm_7c27a

Data_7c283:: ; 7c283
	db $45, $32, $36, $46, $32, $37, $47, $32, $38, $48, $32, $39, $49, $33, $36, $4a, $33, $37, $4b, $33, $38, $4c, $33, $39, $4d, $34, $36, $4e, $34, $37, $4f, $34, $38, $50, $34, $39, $51, $35, $36, $52, $35, $37, $53, $35, $38, $54, $35, $39, $55, $36, $36, $56, $36, $37, $57, $36, $38, $58, $36, $39, $59, $37, $36, $5a, $37, $37, $3f, $37, $38, $21, $37, $39, $2d, $30, $37, $2f, $30, $36, $5c, $38, $39, $26, $30, $38, $77, $39, $38, $74, $39, $39, $68, $38, $38, $2a, $38, $37, $23, $38, $36, $20, $30, $39, $75, $39, $36, $64, $39, $37, $31, $31, $30, $32, $32, $30, $33, $33, $30, $34, $34, $30, $35, $35, $30, $36, $36, $30, $37, $37, $30, $38, $38, $30, $39, $39, $30

Data_7c30a:: ; 7c30a
	db $b1, $31, $31, $b2, $31, $32, $b3, $31, $33, $b4, $31, $34, $b5, $31, $35, $b6, $32, $31, $b7, $32, $32, $b8, $32, $33, $b9, $32, $34, $ba, $32, $35, $bb, $33, $31, $bc, $33, $32, $bd, $33, $33, $be, $33, $34, $bf, $33, $35, $c0, $34, $31, $c1, $34, $32, $c2, $34, $33, $c3, $34, $34, $c4, $34, $35, $c5, $35, $31, $c6, $35, $32, $c7, $35, $33, $c8, $35, $34, $c9, $35, $35, $ca, $36, $31, $cb, $36, $32, $cc, $36, $33, $cd, $36, $34, $ce, $36, $35, $cf, $37, $31, $d0, $37, $32, $d1, $37, $33, $d2, $37, $34, $d3, $37, $35, $d4, $38, $31, $28, $38, $32, $d5, $38, $33, $29, $38, $34, $d6, $38, $35, $d7, $39, $31, $d8, $39, $32, $d9, $39, $33, $da, $39, $34, $db, $39, $35, $dc, $30, $31, $a6, $30, $32, $dd, $30, $33, $de, $30, $34, $df, $30, $35, $41, $31, $36, $42, $31, $37, $43, $31, $38, $44, $31, $39, $45, $31, $30, $46, $32, $36, $47, $32, $37, $48, $32, $38, $49, $32, $39, $4a, $32, $30, $4b, $33, $36, $4c, $33, $37, $4d, $33, $38, $4e, $33, $39, $4f, $33, $30, $50, $34, $36, $51, $34, $37, $52, $34, $38, $53, $34, $39, $54, $34, $30, $55, $35, $36, $56, $35, $37, $57, $35, $38, $58, $35, $39, $59, $35, $30, $5a, $36, $36, $3f, $36, $37, $21, $36, $38, $2d, $36, $39, $2f, $36, $30, $5c, $37, $36, $26, $37, $37, $77, $37, $38, $74, $37, $39, $63, $37, $30, $2a, $38, $36, $23, $38, $37, $20, $38, $38, $68, $38, $39, $20, $38, $30, $31, $39, $36, $32, $39, $37, $33, $39, $38, $34, $39, $39, $35, $39, $30, $36, $30, $36, $37, $30, $37, $38, $30, $38, $39, $30, $39, $30, $30, $30, $00

Func_7c437:: ; 7c437 (1f:4437)
	ldh a, [hSRAMBank]
	push af
	call Func_7c4e9
Bank1F_PreviousSRAMBankReadOnly:: ; 7c43d (1f:443d)
	pop af
	or a
	call Bank1F_GetSRAMBank
Bank1F_SetSRAMReadOnly::
	xor a
	ld [HuC3SRamMode], a
	ret

Func_7c447:: ; 7c447 (1f:4447)
	pop af
	call Bank1F_GetSRAMBank
	call Bank1F_SetSRAMReadOnly
	scf
	ret

Bank1F_SetSRAMReadWrite:: ; 7c450 (1f:4450)
	ld a, SRAM_READWRITE
	ld [HuC3SRamMode], a
	ret

Func_7c456:: ; 7c456 (1f:4456)
	ldh a, [hSRAMBank]
	push af
	call Func_7c47b
	jr c, Func_7c466
Func_7c45e:: ; 7c45e
	pop af
	call Bank1F_GetSRAMBank
	xor a
	ret

Func_7c464:: ; 7c464
	add sp, $2
Func_7c466:: ; 7c466
	pop af
	call Bank1F_GetSRAMBank
	scf
	ret

Func_7c46c:: ; 7c46c
	ld hl, Pointer_0015 + 1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Pointer_0015]
Bank1F_GetSRAMBank:: ; 7c475 (1f:4475)
	ldh [hSRAMBank], a
	ld [HuC3SRamBank], a
	ret

Func_7c47b:
	call Func_7c46c
	ld de, $53ac
	ld a, [hli]
	cp d
	jr nz, .asm_7c4e5
	ld a, [hli]
	cp e
	jr nz, .asm_7c4e5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [bc]
	cp d
	jr nz, .asm_7c4e5
	inc bc
	ld a, [bc]
	cp e
	jr nz, .asm_7c4e5
	ld de, $c000
	dec bc
	jr .asm_7c4a4

.asm_7c49b
	inc hl
	cpl
	cp [hl]
	jr nz, .asm_7c4e5
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_7c4a4
	inc hl
	ld a, [hli]
	cp e
	jr nz, .asm_7c4e5
	ld a, [hl]
	cp d
	jr nz, .asm_7c4e5
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld a, h
	cp $a0
	jr c, .asm_7c4e7
	cp d
	jr c, .asm_7c4d0
	jr nz, .asm_7c4c4
	ld a, l
	cp e
	jr c, .asm_7c4d0
.asm_7c4c4
	ldh a, [hSRAMBank]
	or a
	jr z, .asm_7c4e5
	dec a
	call Bank1F_GetSRAMBank
	ld de, $c000
.asm_7c4d0
	ld a, [hl]
	cp $46
	jr z, .asm_7c49b
	cp $5a
	jr z, .asm_7c49b
	cp $52
	jr z, .asm_7c49b
	cp $44
	jr z, .asm_7c49b
	cp $53
	jr z, .asm_7c49b
.asm_7c4e5
	scf
	ret

.asm_7c4e7
	xor a
	ret

Func_7c4e9:: ; 7c4e9 (1f:44e9)
	call Func_7c46c
	call Bank1F_SetSRAMReadWrite
	push hl
	ld bc, -$1e6
	add hl, bc
	push hl
	xor a
	ld b, $f6
	call Func_7c545
	ld b, $f0
	call Func_7c545
	ld b, $46
	call Func_7c545
	ld a, $20
	ld b, $3a
	call Func_7c545
	pop bc
	pop hl
	ld de, $c000
	call Func_7c534
	ld bc, $a002
	call Func_7c534
.asm_7c51a
	ldh a, [hSRAMBank]
	or a
	jr nz, .asm_7c522
	ld bc, $4000
.asm_7c522
	ld a, $46
	call Func_7c536
	ld de, $c000
	ldh a, [hSRAMBank]
	or a
	ret z
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c51a

Func_7c534:: ; 7c534 (1f:4534)
	ld a, $53
Func_7c536:: ; 7c536 (1f:4536)
	push hl
	ld [hli], a
	cpl
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop de
	ld l, c
	ld h, b
	ret

Func_7c545:: ; 7c545 (1f:4545)
	ld [hli], a
	dec b
	jr nz, Func_7c545
	ret

Func_7c54a:: ; 7c54a (1f:454a)
	ldh a, [hSRAMBank]
	push af
	call Func_7c556
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_7c45e

Func_7c556:: ; 7c556 (1f:4556)
	call Func_7c46c
	ld a, e
	and $1f
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld de, $6
	add hl, de
	ret

Func_7c566:: ; 7c566 (1f:4566)
	ldh a, [hSRAMBank]
	push af
	push hl
	call Func_7c556
	call Bank1F_SetSRAMReadWrite
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7c577:: ; 7c577 (1f:4577)
	ldh a, [hSRAMBank]
	push af
	push hl
	call Func_7c586
	ld e, l
	ld d, h
	pop hl
	predef CopyPredef
	jp Func_7c45e

Func_7c586:: ; 7c586 (1f:4586)
	ld a, d
	cp $ff
	jr z, Func_7c5a8
	cp $fe
	jr z, asm_7c5af
	ld h, d
	ld l, e
Func_7c591:: ; 7c591 (1f:4591)
	ld a, h
	and $60
	rlca
	rlca
	rlca
	push af
	ld a, h
	and $1f
	or $a0
	ld h, a
	pop af
	push hl
	ld hl, hFF97
	or [hl]
	pop hl
	jp Bank1F_GetSRAMBank

Func_7c5a8:: ; 7c5a8
	call Func_7c46c
	ld d, $0
	add hl, de
	ret

asm_7c5af:
	call Func_7c46c
	ld a, $77
	sub e
	jr nc, .asm_7c5b9
	ld a, $77
.asm_7c5b9
	inc a
	push af
	ld e, l
	ld d, h
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop af
	ret

Func_7c5ca:: ; 7c5ca (1f:45ca)
	ldh a, [hSRAMBank]
	push af
	push hl
	call Func_7c586
	call Bank1F_SetSRAMReadWrite
	pop de
	predef CopyPredef
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7c5da:: ; 7c5da (1f:45da)
	ld a, h
	or l
	jr nz, .asm_7c5e1
	ld hl, $1fff
.asm_7c5e1
	ldh a, [hSRAMBank]
	push af
	push hl
	call Func_7c46c
	pop bc
	ld de, $0
	push de
	ld a, b
	ld e, a
	and $1f
	ld b, a
	ld a, e
	and $e0
	ld e, $44
	jr z, .asm_7c606
	ld e, $52
	cp $20
	jr z, .asm_7c606
	ld e, $5a
	cp $40
	jp nz, Func_7c464
.asm_7c606
	push bc
	ld d, $46
	call Func_7c71e
	pop bc
	jp c, Func_7c6ee
	ld a, e
	cp $5a
	jr nz, .asm_7c61f
	ld a, h
	cp $a0
	jr nz, .asm_7c606
	ld a, l
	cp $2
	jr nz, .asm_7c606
.asm_7c61f
	push hl
	push de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld a, e
	sub c
	ld a, d
	sbc b
	jr nc, .asm_7c649
	push bc
	ld hl, sp+$6
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld a, b
	sbc d
	jr nc, .asm_7c644
	ld [hl], d
	dec hl
	ld [hl], e
.asm_7c644
	pop bc
	pop de
	pop hl
	jr .asm_7c606

.asm_7c649
	pop de
	pop hl
	push hl
	call Bank1F_SetSRAMReadWrite
	ld a, e
	cp $5a
	jr z, .asm_7c67f
	push de
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld a, l
	sub c
	ld e, a
	ld a, h
	sbc b
	ld d, a
	ld a, e
	sub $6
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_7c67d
	ld c, e
	ld b, d
	pop hl
	pop de
	ld a, e
	ld e, $46
	jr .asm_7c681

.asm_7c67d
	pop hl
	pop de
.asm_7c67f
	ld a, $46
.asm_7c681
	push af
	ld a, e
	ld [hli], a
	cpl
	ld [hli], a
	inc hl
	inc hl
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, c
	add l
	ld c, a
	ld a, b
	adc h
	ld b, a
	push bc
	ld a, e
	sub c
	ld c, a
	ld a, d
	sbc b
	ld b, a
	jr nz, .asm_7c6a7
	ld a, c
	cp $7
	jr nc, .asm_7c6a7
	pop bc
	pop hl
	pop af
	pop hl
	jr .asm_7c6e2

.asm_7c6a7
	pop bc
	pop hl
	pop af
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, c
	ld h, b
	pop bc
	push hl
	ld [hli], a
	cpl
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	pop bc
	cpl
	cp $46
	jr z, .asm_7c6c5
	ld l, c
	ld h, b
.asm_7c6c5
	ld a, d
	sub $c0
	or e
	jr nz, .asm_7c6df
	ld de, $a002
	ldh a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	call Func_7c877
	ldh a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c6e2

.asm_7c6df
	call Func_7c877
.asm_7c6e2
	ld de, $6
	add hl, de
	call Func_7c70a
	add sp, $2
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7c6ee:: ; 7c6ee (1f:46ee)
	pop hl
	set 7, h
	jp Func_7c45e

Func_7c6f4:: ; 7c6f4 (1f:46f4)
	ldh a, [hSRAMBank]
	push af
.asm_7c6f7
	call Func_7c46c
	ld d, $44
	call Func_7c71e
	jp c, Func_7c466
	call Func_7c70a
	call Func_7c7c5
	jr .asm_7c6f7

Func_7c70a:: ; 7c70a (1f:470a)
	ld a, h
	and $1f
	ld h, a
	ldh a, [hSRAMBank]
	and $fc
	ldh [hFF97], a
	ldh a, [hSRAMBank]
	and $3
	rrca
	rrca
	rrca
	or h
	ld h, a
	ret

Func_7c71e:: ; 7c71e (1f:471e)
	ld a, [hl]
	inc hl
	cpl
	cp [hl]
	jr nz, .asm_7c75b
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	dec hl
	dec hl
	dec hl
	ld a, b
	cp $a0
	jr c, .asm_7c75b
	cp h
	jr c, .asm_7c742
	jr nz, .asm_7c739
	ld a, c
	cp l
	jr c, .asm_7c742
.asm_7c739
	ldh a, [hSRAMBank]
	or a
	jr z, .asm_7c75b
	dec a
	call Bank1F_GetSRAMBank
.asm_7c742
	ld l, c
	ld h, b
	ld a, [hl]
	cp d
	ret z
	cp $46
	jr z, Func_7c71e
	cp $5a
	jr z, Func_7c71e
	cp $52
	jr z, Func_7c71e
	cp $44
	jr z, Func_7c71e
	cp $53
	jr z, Func_7c71e
.asm_7c75b
	scf
	ret

Func_7c75d:: ; 7c75d (1f:475d)
	ld a, b
	cp $a0
	jr c, .asm_7c76d
	cp h
	jr c, .asm_7c76b
	jr nz, .asm_7c770
	ld a, c
	cp l
	jr nc, .asm_7c770
.asm_7c76b
	xor a
	ret

.asm_7c76d
	xor a
	scf
	ret

.asm_7c770
	xor a
	inc a
	ret

Func_7c773:: ; 7c773 (1f:4773)
	call Func_7c75d
	ret c
	jp z, Func_7c83d
	ldh a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	push hl
	ld hl, $c000
	call Func_7c83d
	pop hl
	push af
	ldh a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	pop af
	ret

Func_7c791:: ; 7c791 (1f:4791)
	ld a, d
	sub $c0
	or e
	jp nz, Func_7c856
	ldh a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	push de
	ld de, $a002
	call Func_7c856
	pop de
	push af
	ldh a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	pop af
	ret

Func_7c7af:: ; 7c7af (1f:47af)
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

Func_7c7b7:: ; 7c7b7 (1f:47b7)
	ld a, h
	or l
	jp z, Func_7c6f4
	ld de, -6
	add hl, de
	ccf
	ret c
	ld a, h
	rlca
	ret c
Func_7c7c5:: ; 7c7c5 (1f:47c5)
	ld e, l
	ld d, h
	ldh a, [hSRAMBank]
	push af
	call Func_7c586
	push hl
	ld a, [hli]
	cp $53
	jp z, Func_7c838
	cpl
	cp [hl]
	jp nz, Func_7c838
	inc hl
	call Func_7c7af
	pop hl
	call Func_7c773
	jp nz, Func_7c466
	call Func_7c791
	jp nz, Func_7c466
	call Bank1F_SetSRAMReadWrite
	ld a, $46
	ld [hli], a
	cpl
	ld [hld], a
	call Func_7c75d
	jr c, Func_7c808
	jp nz, Func_7c808
	ld a, [bc]
	cp $46
	jr nz, Func_7c808
asm_7c7ff:
	ld hl, $4
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
Func_7c808:: ; 7c808
	ld b, h
	ld c, l
	ld a, d
	sub $c0
	or e
	jr nz, .asm_7c824
	ldh a, [hSRAMBank]
	inc a
	call Bank1F_GetSRAMBank
	ld de, $a002
	call Func_7c877
	ldh a, [hSRAMBank]
	dec a
	call Bank1F_GetSRAMBank
	jr .asm_7c835

.asm_7c824
	ld a, [de]
	cp $46
	jr nz, .asm_7c832
	ld hl, $4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	jr asm_7c7ff

.asm_7c832
	call Func_7c877
.asm_7c835
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7c838:: ; 7c838 (1f:4838)
	add sp, $2
	jp Func_7c466

Func_7c83d:: ; 7c83d (1f:483d)
	push bc
	push de
	push hl
	ld a, [bc]
	ld d, a
	inc bc
	ld a, [bc]
	cpl
	cp d
	jr nz, asm_7c852
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp l
	jr nz, asm_7c852
	inc bc
	ld a, [bc]
	cp h
asm_7c852:
	pop hl
	pop de
	pop bc
	ret

Func_7c856:: ; 7c856 (1f:4856)
	push bc
	push de
	push hl
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	cpl
	cp b
	jr nz, asm_7c852
	inc de
	ld a, [de]
	cp l
	jr nz, asm_7c852
	inc de
	ld a, [de]
	cp h
	jr asm_7c852

Func_7c86b:: ; 7c86b
	push bc
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, e
	ld [bc], a
	inc bc
	ld a, d
	ld [bc], a
	pop bc
	ret

Func_7c877:: ; 7c877 (1f:4877)
	push de
	inc de
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	pop de
	ret

Func_7c881:: ; 7c881 (1f:4881)
	push hl
	call Func_7c889
	ld e, l
	ld d, h
	pop hl
	ret

Func_7c889:: ; 7c889 (1f:4889)
	call Func_7c8dc
	ret c
	ld e, l
	ld d, h
	ldh a, [hSRAMBank]
	push af
	call Func_7c586
	push hl
	ld a, [hli]
	cpl
	cp [hl]
	jp nz, Func_7c838
	inc hl
	call Func_7c7af
	pop hl
	call Func_7c773
	jp nz, Func_7c466
	call Func_7c791
	jp nz, Func_7c466
	call Func_7c75d
	jr c, Func_7c8ba
	jp nz, Func_7c8ba
	ld a, [bc]
	cp $46
	jr z, asm_7c8bc
Func_7c8ba:: ; 7c8ba
	ld c, l
	ld b, h
asm_7c8bc:
	ld a, d
	sub $c0
	or e
	jr z, .asm_7c8ce
	ld a, [de]
	cp $46
	jr nz, .asm_7c8ce
	ld hl, $4
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
.asm_7c8ce
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc b
	ld h, a
	ld de, -6
	add hl, de
	xor a
	jp Func_7c45e

Func_7c8dc:: ; 7c8dc (1f:48dc)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ldh [hFF97], a
	ld hl, -6
	add hl, de
	ccf
	ret c
	ld a, h
	rlca
	ret

Func_7c8ec:: ; 7c8ec (1f:48ec)
	call Func_7c8dc
	ret c
	push de
	call Func_7c7c5
	pop de
	ldh a, [hSRAMBank]
	push af
	push de
	ld de, $fe00
	call Bank1F_SetSRAMReadWrite
	call Func_7c586
	ld b, a
	pop de
.asm_7c904
	ld a, [hli]
	cp e
	jr nz, .asm_7c91d
	ld a, [hli]
	cp d
	jr nz, .asm_7c91e
	ldh a, [hFF97]
	cp [hl]
	jr nz, .asm_7c91e
	xor a
	ld [hld], a
	ld [hld], a
	ld [hl], a
	ld a, $78
	sub b
	ldh [hFFB7], a
	jp Bank1F_PreviousSRAMBankReadOnly

.asm_7c91d
	inc hl
.asm_7c91e
	inc hl
	inc hl
	dec b
	jr nz, .asm_7c904
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7c926:: ; 7c926 (1f:4926)
	or a
	ldh a, [hSRAMBank]
	push af
	push af
	ld de, $fe00
	call Func_7c586
	ld b, a
	ld c, $0
.asm_7c934
	ld a, [hli]
	or [hl]
	jr z, .asm_7c939
	inc c
.asm_7c939
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_7c934
	ld a, $78
	sub c
	ld b, a
	pop af
	jp z, Func_7c45e
	push bc
	ld hl, $0
.asm_7c94b
	push hl
	ld hl, $1ff8
	call Func_7c5da
	bit 7, h
	jr nz, .asm_7c95d
	pop hl
	ld de, $1f
	add hl, de
	jr .asm_7c94b

.asm_7c95d
	ld a, h
	and $1f
	ld e, a
	ld d, $0
	pop hl
	add hl, de
	push hl
	call Func_7c6f4
	pop de
	pop bc
	jp Func_7c45e

Func_7c96e:: ; 7c96e (1f:496e)
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	cp $ff
	jp z, Func_7c9dc
	ldh [hFF97], a
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	bit 0, a
	jr z, Func_7c9dc
	ld hl, -6
	add hl, de
	jr nc, Func_7c9dc
	ld a, h
	rlca
	jr c, Func_7c9dc
	push bc
	ldh a, [hSRAMBank]
	push af
	call Func_7c591
	ld bc, $a
	add hl, bc
	ld c, [hl]
	inc hl
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop af
	call Bank1F_GetSRAMBank
	pop bc
	ld a, c
	ld bc, $0
	dec a
	jr z, .asm_7c9ba
	ld a, e
	or d
	jr z, .asm_7c9ba
	dec b
	dec c
	ld a, e
	cpl
	ld e, a
	ld a, d
	cpl
	ld d, a
	inc de
.asm_7c9ba
	ldh a, [hSRAMBank]
	push af
	push de
	push bc
	ld e, $40
	call Func_7c5a8
	call Bank1F_SetSRAMReadWrite
	pop bc
	pop de
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	pop af
	call Bank1F_GetSRAMBank
	call Bank1F_SetSRAMReadOnly
Func_7c9dc:: ; 7c9dc (1f:49dc)
	pop hl
	ret

Func_7c9de:: ; 7c9de (1f:49de)
	ld c, l
	ld b, h
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	or e
	jr z, .asm_7ca05
	ld a, [hl]
	ldh [hFF97], a
	ld hl, -6
	add hl, de
	jr nc, .asm_7c9fc
	ld a, h
	rlca
	jr c, .asm_7c9fc
	ldh a, [hSRAMBank]
	push af
	call Func_7c591
	jr .asm_7ca0b

.asm_7c9fc
	ld l, c
	ld h, b
	scf
	ret

.asm_7ca00
	ld l, c
	ld h, b
	jp Func_7c466

.asm_7ca05
	ldh a, [hSRAMBank]
	push af
	call Func_7c46c
.asm_7ca0b
	ld e, l
	ld d, h
	ld a, [hli]
	cpl
	cp [hl]
	jr nz, .asm_7ca00
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $a0
	jr c, .asm_7ca00
	cp d
	jr c, .asm_7ca2d
	jr nz, .asm_7ca24
	ld a, l
	cp e
	jr c, .asm_7ca2d
.asm_7ca24
	ldh a, [hSRAMBank]
	or a
	jr z, .asm_7ca00
	dec a
	call Bank1F_GetSRAMBank
.asm_7ca2d
	ld a, [hl]
	cp $52
	jr z, .asm_7ca36
	cp $5a
	jr nz, .asm_7ca0b
.asm_7ca36
	call Func_7ca4b
	jp Func_7c45e

Func_7ca3c:: ; 7ca3c (1f:4a3c)
	ld a, e
	ldh [hFF97], a
	ldh a, [hSRAMBank]
	push af
	call Func_7c591
	call Func_7ca4f
	jp Func_7c45e

Func_7ca4b:: ; 7ca4b (1f:4a4b)
	ld de, $6
	add hl, de
Func_7ca4f:: ; 7ca4f (1f:4a4f)
	ld e, l
	ld d, h
	call Func_7c70a
	push bc
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	inc bc
	ldh a, [hFF97]
	ld [bc], a
	inc bc
	ld l, c
	ld h, b
	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld b, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld c, a
	or a
	jr z, .asm_7ca82
	push bc
.asm_7ca7b
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7ca7b
	pop bc
.asm_7ca82
	pop hl
	call Func_7ca88
	pop hl
	ret

Func_7ca88:: ; 7ca88 (1f:4a88)
	ld de, $2e
	bit 0, b
	jr nz, .asm_7ca90
	ld e, d
.asm_7ca90
	ld a, $5
	add c
	ld c, a
	add e
	ld e, a
	ld a, d
	adc a
	ld [hl], e
	inc hl
	ld [hl], a
	inc hl
	ld [hl], e
	inc hl
	ld [hl], a
	ret

Func_7caa0:: ; 7caa0 (1f:4aa0)
	ld a, c
	cp $ff
	jr nz, .asm_7caa8
	ldh a, [hFFB7]
	ld c, a
.asm_7caa8
	push bc
	push hl
	ld a, $b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld hl, $2e
	bit 0, b
	jr nz, .asm_7cabb
	ld l, h
.asm_7cabb
	ld a, $5
	add c
	add l
	ld l, a
	ld a, h
	adc a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	pop bc
	push bc
	push hl
	ld a, $7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], b
	ld a, $20
	bit 1, b
	jr z, .asm_7cadf
	ld a, $40
.asm_7cadf
	or d
	ld h, a
	ld l, e
	call Func_7c5da
	ld d, h
	ld e, l
	pop hl
	pop bc
	ld a, d
	rlca
	ret c
	push bc
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ldh a, [hFF97]
	ld [hl], a
	inc hl
	push hl
	ld bc, $6
	add hl, bc
	ld b, [hl]
	inc hl
	inc hl
	ld c, [hl]
	pop hl
	push de
	call Func_7ca88
	pop de
	pop hl
	push hl
	push de
	push bc
	ld b, $0
	ld a, $7
	add l
	ld l, a
	ld a, b
	adc h
	ld h, a
	call Func_7c5ca
	pop bc
	pop hl
	pop de
	push de
	bit 0, b
	jr z, .asm_7cb5c
	ld b, $0
	add hl, bc
	add sp, -$2e
	push hl
	ld hl, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	predef DivideSignedShortPredef
	ld de, $a
	predef MultiplySignedShortPredef
	ld e, l
	ld d, h
	ld hl, sp+$2
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	push hl
	lb de, $ff, $46
	ld bc, $a
	push bc
	call Func_7c577
	pop bc
	pop hl
	add hl, bc
	xor a
	ld b, $22
.asm_7cb4d
	ld [hli], a
	dec b
	jr nz, .asm_7cb4d
	ld hl, sp+$2
	pop de
	ld bc, $2e
	call Func_7c5ca
	add sp, $2e
.asm_7cb5c
	pop hl
	pop de
	ldh a, [hSRAMBank]
	push af
	push hl
	push hl
	ld d, $fe
	call Bank1F_SetSRAMReadWrite
	call Func_7c586
	ld b, a
.asm_7cb6c
	ld a, [hli]
	or [hl]
	jr z, .asm_7cb7e
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_7cb6c
	pop hl
	call Func_7c8ec
	pop hl
	jp Func_7c447

.asm_7cb7e
	dec hl
	pop de
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	ld a, [de]
	ld [hl], a
	pop hl
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7cb98:: ; 7cb98 (1f:4b98)
	push hl
	inc hl
	inc hl
	inc hl
	push hl
	ld a, b
	call Func_7cbb9
	pop hl
	push af
	jr c, .asm_7cba9
	ld [hl], e
	inc hl
	ld [hl], d
	dec hl
.asm_7cba9
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop af
	pop hl
	ret

Func_7cbb9:: ; 7cbb9 (1f:4bb9)
	or a
	jr z, .asm_7cbc4
	dec a
	jr z, .asm_7cbdc
	dec a
	jr z, .asm_7cbe3
	scf
	ret

.asm_7cbc4
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_7cbc9
	inc hl
.asm_7cbca
	ld a, e
	add c
	ld e, a
	ld a, d
	adc b
	ld d, a
	cp $20
	ccf
	ret c
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld a, b
	sbc d
	ret

.asm_7cbdc
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	inc hl
	jr .asm_7cbc9

.asm_7cbe3
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	dec hl
	jr .asm_7cbca

Func_7cbed:: ; 7cbed (1f:4bed)
	add sp, -$a
	push hl
	push de
	ld de, -$2e
	ld b, $0
	call Func_7cb98
	pop de
	push de
	ld bc, $2e
	call Func_7cc9a
	pop de
	push bc
	push de
	jr c, .asm_7cc7e
	ld a, c
	cp $2e
	jr c, .asm_7cc7e
	ld hl, sp+$6
	lb de, $ff, $46
	ld bc, $a
	call Func_7c577
	pop hl
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .asm_7cc29
	srl d
	rr e
	jr nc, .asm_7cc25
	inc de
.asm_7cc25
	ld [hl], d
	dec hl
	ld [hl], e
	inc hl
.asm_7cc29
	inc hl
	ld b, $4
.asm_7cc2c
	ld e, l
	ld d, h
	ld a, [de]
	or a
	jr z, .asm_7cc5c
	ld hl, sp+$6
	push bc
	push de
	ld bc, $a
	predef Func_7af75
	ld a, h
	or l
	pop de
	pop bc
	jr z, .asm_7cc6a
	ld hl, $b
	add hl, de
	dec b
	jr nz, .asm_7cc2c
	pop de
	push de
	ld hl, $d
	add hl, de
	ld e, l
	ld d, h
	ld hl, $b
	add hl, de
	ld b, $16
.asm_7cc56
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7cc56
.asm_7cc5c
	ld hl, sp+$6
	push de
	ld b, $a
.asm_7cc61
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7cc61
	xor a
	ld [de], a
	pop de
.asm_7cc6a
	ld hl, $a
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_7cc74
	inc [hl]
.asm_7cc74
	pop de
	pop bc
	pop hl
	push hl
	push bc
	push de
	call Func_7cc8b
	xor a
.asm_7cc7e
	pop de
	pop bc
	pop hl
	jr c, .asm_7cc87
	add sp, $a
	xor a
	ret

.asm_7cc87
	add sp, $a
	scf
	ret

Func_7cc8b:: ; 7cc8b (1f:4c8b)
	push de
	push bc
	ld de, -$2e
	ld b, $0
	call Func_7cb98
	pop bc
	pop de
	jp Func_7cca9

Func_7cc9a:: ; 7cc9a (1f:4c9a)
	push hl
	push de
	call Func_7ccb8
	pop hl
	push bc
	ldh [hFF97], a
	call Func_7c577
	pop bc
	pop hl
	ret

Func_7cca9:: ; 7cca9 (1f:4ca9)
	push hl
	push de
	call Func_7ccb8
	pop hl
	push bc
	ldh [hFF97], a
	call Func_7c5ca
	pop bc
	pop hl
	ret

Func_7ccb8:: ; 7ccb8 (1f:4cb8)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hl]
	inc hl
	push af
	ld a, [hli]
	add e
	ld e, a
	ld a, [hl]
	adc d
	ld d, a
	push de
	push hl
	push bc
	ld d, [hl]
	dec hl
	ld e, [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	sub e
	ld e, a
	ld a, b
	sbc d
	ld d, a
	pop bc
	pop hl
	ld a, e
	sub c
	ld a, d
	sbc b
	jr nc, .asm_7cce2
	ld c, e
	ld b, d
.asm_7cce2
	ld d, [hl]
	dec hl
	ld e, [hl]
	ld a, e
	add c
	ld e, a
	ld a, d
	adc b
	ld d, a
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	pop af
	ret

Func_7ccf1:: ; 7ccf1 (1f:4cf1)
	push de
	push hl
	ld a, [hli]
	or [hl]
	ld a, $ff
	jr z, asm_7cd4c
	ld bc, $8
	add hl, bc
	ld c, [hl]
	inc hl
	inc hl
	ld b, [hl]
	inc hl
	reg8rot a, l, e
	reg8rot a, h, d
	ld a, b
	bit 4, c
	jp z, Func_7cd44
	or a
	push af
	bit 3, c
	jp nz, Func_7cd26
	sub $61
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	inc de
	ld bc, $60
	call Func_7c167
	jr Func_7cd37

Func_7cd26:: ; 7cd26 (1f:4d26)
	sub $c1
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	inc de
	ld b, $4
.asm_7cd31
	call Func_7cd3b
	dec b
	jr nz, .asm_7cd31
Func_7cd37:: ; 7cd37
	pop af
	pop hl
	pop de
	ret

Func_7cd3b:: ; 7cd3b (1f:4d3b)
	ld c, $30
.asm_7cd3d
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_7cd3d
	ret

Func_7cd44:: ; 7cd44 (1f:4d44)
	ld c, a
	ld a, [de]
	inc de
	or a
	jr z, asm_7cd6f
	ld d, h
	ld e, l
asm_7cd4c:
	ld b, a
	ld c, $0
	ld hl, Data_7f875
.asm_7cd52
	ld a, [hli]
	cp b
	jr z, .asm_7cd5c
	inc c
	or a
	jr nz, .asm_7cd52
	dec c
	scf
.asm_7cd5c
	push af
	ld l, e
	ld h, d
	ld a, c
	add a
	add a
	ld e, a
	add a
	add e
	ld e, a
	ld d, $a2
	ld b, $c
	predef Func_026c
	jp Func_7cd37

asm_7cd6f:
	ld a, c
	dec a
	ld bc, $2020
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push hl
	ld c, e
	ld b, d
	ld d, a
	ld e, $0
	ld h, $0
.asm_7cd82
	ld a, [bc]
	inc bc
	cp $e
	jr z, .asm_7cda7
	cp $f
	jr z, .asm_7cda7
	push de
	ld e, a
	ld a, [bc]
	ld d, a
	call Func_7db91
	pop de
	jr nc, .asm_7cd9a
	inc bc
	dec d
	jr z, .asm_7cdc6
.asm_7cd9a
	cp $60
	jr c, .asm_7cdb3
	cp $b0
	jr nc, .asm_7cda4
	add $50
.asm_7cda4
	sub h
	jr .asm_7cdb3

.asm_7cda7
	sub $e
	jr z, .asm_7cdad
	ld a, $50
.asm_7cdad
	ld h, a
	dec d
	jr z, .asm_7cdc6
	jr .asm_7cd82

.asm_7cdb3
	push de
	push hl
	ld d, $0
	ld hl, sp+$6
	add hl, de
	ld [hl], a
	pop hl
	pop de
	dec d
	jr z, .asm_7cdc6
	inc e
	ld a, e
	cp $c
	jr nz, .asm_7cd82
.asm_7cdc6
	ld hl, sp+$2
	ld e, l
	ld d, h
	pop hl
	ld b, $4
.asm_7cdcd
	push bc
	push de
	call Func_7cde4
	call Func_7cde4
	call Func_7cdee
	pop de
	pop bc
	inc de
	dec b
	jr nz, .asm_7cdcd
	add sp, $c
	pop hl
	pop de
	xor a
	ret

Func_7cde4:: ; 7cde4 (1f:4de4)
	push de
	call Func_7cdee
	pop de
	inc de
	inc de
	inc de
	inc de
	ret

Func_7cdee:: ; 7cdee (1f:4dee)
	ld a, [de]
	ld e, a
	ld c, $3
	jp GetJUTFCharacter_1bpp

asm_7cdf5:
	halt
CopyToVRAMPredef:: ; 7cdf6 (1f:4df6)
	ldh a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $12
	jr c, asm_7cdf5
	push hl
	push bc
	add $4
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $5
	call DivideShortByCharPredef
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

asm_7ce15:
	halt
Func_7ce16:: ; 7ce16 (1f:4e16)
	ldh a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $15
	jr c, asm_7ce15
	push hl
	push bc
	add $5
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $6
	call DivideShortByCharPredef
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

asm_7ce35:
	halt
Func_7ce36:: ; 7ce36 (1f:4e36)
	ldh a, [hFF88]
	ld b, a
	ldh a, [hFF87]
	sub b
	add c
	jr c, asm_7ce35
	cp $f0
	jr nc, asm_7ce35
	ld a, c
	srl a
	srl a
	inc a
	add c
	add $12
	ld b, a
	jr .asm_7ce50

.asm_7ce4f
	halt
.asm_7ce50
	ldh a, [hFF89]
	add b
	jr c, .asm_7ce4f
	cp $c8
	jr nc, .asm_7ce4f
	push bc
	push hl
	ldh a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $2
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld b, a
	add a
	add b
	ld bc, HBlankCopyRoutine
	add c
	ld [hl], a
	ld a, $0
	adc b
	inc l
	ld [hl], a
	inc l
	pop bc
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	pop bc
	ret

CopyFromVRAMPredef:: ; 7ce7d (1f:4e7d)
	ld a, b
	or a
.loop
	push af
	call Func_7ce16
	pop af
	push af
	jr nz, .continue
	ld a, b
	cp c
	jr nc, .done
.continue
	push bc
	push hl
	push de
	ld c, b
	ld b, $0
	push bc
	call Func_7ceb8
	pop bc
	pop hl
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	pop bc
	pop af
	push hl
	ld l, b
	ld b, a
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	pop hl
	jr .loop

.done
	pop af
	call Func_7ceb8
FrameDelayPredef_7ceaf:: ; 7ceaf (1f:4eaf)
.loop
	ei
	halt
	ldh a, [hFF89]
	or a
	jr nz, .loop
	ret

asm_7ceb7:
	halt
Func_7ceb8:: ; 7ceb8 (1f:4eb8)
	ldh a, [hFF88]
	ld b, a
	ldh a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7ceb7
	ld a, c
	srl a
	inc a
	add c
	add $15
	ld b, a
	jr .asm_7cecd

.asm_7cecc
	halt
.asm_7cecd
	ldh a, [hFF89]
	add b
	jr c, .asm_7cecc
	cp $c8
	jr nc, .asm_7cecc
	push hl
	push de
	ldh a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $3
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld e, a
	add a
	add e
	ld de, Func_7cfcf
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	di
	ld a, l
	ldh [hFF87], a
	ldh a, [hFF89]
	add b
	ldh [hFF89], a
	ei
	ret

Func_7cf08:: ; 7cf08
	REPT 64
	ld a, [hl]
	cpl
	ld [hli], a
	ENDR
	ld a, b
	ldh [hFF89], a
	ld a, c
	ldh [hFF88], a
	ret

Func_7cfcf:: ; 7cfcf
	REPT 64
	ld a, [hli]
	ld [de], a
	inc de
	ENDR
	ld a, b
	ldh [hFF89], a
	ld a, c
	ldh [hFF88], a
	ret

Func_7d096:: ; 7d096
	REPT 128
	ld [hli], a
	ENDR
	ld a, b
	ldh [hFF89], a
	ld a, c
	ldh [hFF88], a
	ret

HBlankCopyRoutine:: ; 7d11d
	REPT 64
	ld a, [de]
	inc e
	ld [hli], a
	ENDR
	ld a, e
	ldh [hFF88], a
	ld a, b
	ldh [hFF89], a
	ret

Func_7d1e4:: ; 7d1e4 (1f:51e4)
	ldh a, [hFF88]
	ld l, a
	ldh a, [hFF87]
	sub l
	ret z
	ldh a, [rLY]
	cp $90
	ret c
	ld e, a
	ld h, $c2
	ld c, [hl]
	inc l
	ld b, [hl]
	inc l
	ld a, $99
	sub e
	ret z
	ld e, a
	add a
	ld d, a
	add a
	add a
	ld h, a
	add a
	add h
	add d
	add e
	sub $7
	cp b
	ret c
	ld h, $c2
	ld de, Func_7d1e4
	push de
	ldh a, [hFF89]
	sub b
	ld b, a
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	push de
	ld a, c
	cp $2
	jr z, .asm_7d23a
	cp $1
	jr z, .asm_7d243
	cp $3
	jr z, .asm_7d24d
	cp $4
	jr z, .asm_7d233
	pop af
	pop af
	xor a
	ldh [hFF87], a
	ldh [hFF88], a
	ldh [hFF89], a
	ret

.asm_7d233
	ld a, [hl]
	inc l
	ld h, [hl]
	inc l
	ld c, l
	ld l, a
	ret

.asm_7d23a
	ld c, [hl]
	inc l
	ld a, [hl]
	inc l
	ld e, l
	ld d, h
	ld l, c
	ld h, a
	ret

.asm_7d243
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	ld a, [hl]
	inc l
	ld c, l
	ld l, e
	ld h, d
	ret

.asm_7d24d
	ld c, [hl]
	inc l
	ld a, [hl]
	inc l
	ld e, [hl]
	inc l
	ld d, [hl]
	inc l
	ld h, a
	ld a, l
	ld l, c
	ld c, a
	ret

DivideShortByCharPredef:: ; 7d25a (1f:525a)
	ld b, $8
.loop
	add hl, hl
	ld a, h
	sub c
	jr c, .next
	ld h, a
	inc l
.next
	dec b
	jr nz, .loop
	ret

XorShortsPredef:: ; 7d267 (1f:5267)
	ld a, h
	xor d
	ld h, a
	ld a, l
	xor e
	ld l, a
	ret

OrShortsPredef:: ; 7d26e (1f:526e)
	ld a, h
	or d
	ld h, a
	ld a, l
	or e
	ld l, a
	ret

AndShortsPredef:: ; 7d275 (1f:5275)
	ld a, h
	and d
	ld h, a
	ld a, l
	and e
	ld l, a
	ret

CplShortPredef:: ; 7d27c (1f:527c)
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	ret

CompareShortPredef:: ; 7d283 (1f:5283)
; if de and hl have different signs, then b = (de < 0 ? 2 | 4)
	ld a, d
	xor h
	rlca
	ld a, d
	jr c, .different_signs
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld b, $1
	or l
	jr z, .bit_mask
	ld a, h
.different_signs
	ld b, $2
	rlca
	jr c, .bit_mask
	ld b, $4
.bit_mask
	ld a, b
	ld b, $0
	ld hl, Data_7d2aa
	add hl, bc
	and [hl]
	jr z, predefMath_returnZero
	ld hl, -1
	ret

Data_7d2aa:: ; 7d2aa
	db %110, %110, %101, %101, %011, %011, %100, %010, %001

RightShiftShortPredef:: ; 7d2b3 (1f:52b3)
	ld a, h
	or a
	jr nz, predefMath_returnZero
	ld a, l
	cp $10
	jr nc, predefMath_returnZero
	ld l, e
	ld h, d
	or a
	ret z
.asm_7d2c0
	srl h
	rr l
	dec a
	jr nz, .asm_7d2c0
	ret

LeftShiftShortPredef:: ; 7d2c8 (1f:52c8)
	ld a, h
	or a
	jr nz, predefMath_returnZero
	ld a, l
	cp $10
	jr nc, predefMath_returnZero
	ld l, e
	ld h, d
	or a
	ret z
.asm_7d2d5
	add hl, hl
	dec a
	jr nz, .asm_7d2d5
	ret

predefMath_returnZero:
	ld hl, $0
	ret

AddShortsPredef:: ; 7d2de (1f:52de)
	add hl, de
	ret

SubtractShortsPredef:: ; 7d2e0 (1f:52e0)
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ret

MultiplySignedShortPredef:: ; 7d2e7 (1f:52e7)
	ld a, h
	or l
	ret z
	ld a, d
	or e
	jr z, predefMath_returnZero
	ld a, h
	xor d
	rlca
	push af
	ld a, d
	rlca
	jr nc, .de_positive
	ld a, d
	cpl
	ld d, a
	ld a, e
	cpl
	ld e, a
	inc de
.de_positive
	ld a, h
	rlca
	jr nc, .hl_positive
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
.hl_positive
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
.loop
	add hl, hl
	rl c
	rl b
	jr nc, .next
	add hl, de
	jr nc, .next
	inc c
	jr nz, .next
	inc b
.next
	dec a
	jr nz, .loop
	jr predefMath_fixSign

DivideSignedShortPredef:: ; 7d322 (1f:5322)
	call DivideSignedShortPredef_
	ld a, e
	ld [wc3b0], a
	ld a, d
	ld [wc3b0 + 1], a
	ret

DivideShortPredef:: ; 7d32e (1f:532e)
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
.asm_7d335
	push af
	sla e
	rl d
	rl l
	rl h
	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .asm_7d349
	ld h, a
	ld a, l
	sub c
	ld l, a
	inc e
.asm_7d349
	pop af
	dec a
	jr nz, .asm_7d335
	ret

DivideSignedShortPredef_:: ; 7d34e (1f:534e)
	ld a, h
	or l
	jr nz, .asm_7d356
	xor a
	ld e, a
	ld d, a
	ret

.asm_7d356
	ld a, d
	xor h
	rlca
	push af
	ld a, d
	rlca
	push af
	jr nc, .asm_7d366
	ld a, d
	cpl
	ld d, a
	ld a, e
	cpl
	ld e, a
	inc de
.asm_7d366
	ld a, h
	rlca
	jr nc, .asm_7d371
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
.asm_7d371
	call DivideShortPredef
	pop af
	jr nc, .asm_7d37a
	call NegateShortPredef
.asm_7d37a
	reg8rot a, l, e
	reg8rot a, h, d
predefMath_fixSign:
	pop af
	ret nc
NegateShortPredef:: ; 7d382 (1f:5382)
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc l
	ret nz
	inc h
	ret

AbsoluteValueShortPredef:: ; 7d38c (1f:538c)
	bit 7, h
	ret z
	jr NegateShortPredef

RandomPredef:: ; 7d391 (1f:5391)
	ld hl, wSTDLibRNGState
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	rlca
	rlca
	rlca
	xor l
	rrca
	push af
	ld a, h
	xor l
	ld h, a
	ld a, [wSTDLibRNGCount]
	inc a
	ld [wSTDLibRNGCount], a
	xor l
	ld l, a
	pop af
	rl l
	rl h
	ld a, l
	ld [wSTDLibRNGState], a
	ld a, h
	ld [wSTDLibRNGState + 1], a
	xor l
	ld l, a
	ld h, $0
	ret

SeedRNGPredef:: ; 7d3bc (1f:53bc)
	ld a, l
	ld [wSTDLibRNGState], a
	ld a, h
	ld [wSTDLibRNGState + 1], a
	xor a
	ld [wSTDLibRNGCount], a
	ret

HexToIntPredef:: ; 7d3c9 (1f:53c9)
.loop
	call .ConvertAndLoadChar
	ret c
	ld [hli], a
	jr .loop

.ConvertAndLoadChar:
	ld c, $0
	ld a, [de]
	call .ConvertChar
	ret c
	ld c, a
	inc de
	ld a, [de]
	call .ConvertChar
	ret c
	inc de
	ld b, a
	ld a, c
	rlca
	rlca
	rlca
	rlca
	or b
	ret

.ConvertChar:
	or CHARVAL(" ")
	sub CHARVAL("0")
	ret c
	cp 10
	ccf
	ret nc
	sub CHARVAL("A") - 10 - $10
	cp 10
	ret c
	cp $10
	ccf
	ret

StrToIntPredef:: ; 7d3f9 (1f:53f9)
	ld e, l
	ld d, h
.leading_space_loop
	ld a, [de]
	inc de
	cp CHARVAL(" ")
	jr z, .leading_space_loop
	cp CHARVAL("'")
	jr z, .apostrophe
	cp CHARVAL("$")
	jr z, .dollar_sign
	cp CHARVAL("+")
	jr z, .plus
	cp CHARVAL("-")
	jr z, .minus
	dec de
.plus
	call .ParsePositiveNumber
	ret nc
	ld hl, $0
	ret

.minus
	call .plus
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
	ret

.dollar_sign
	call .ParseHexidecimalNumber
	ret nc
	ld hl, $0
	ret

.apostrophe
	ld hl, $0
.find_trailing_apostrophe
	ld a, [de]
	or a
	ret z
	cp CHARVAL("'")
	ret z
	ld h, l
	ld l, a
	inc de
	jr .find_trailing_apostrophe

.ParsePositiveNumber:
	ld hl, $0
.positive_number_loop
	ld a, [de]
	or a
	ret z
	cp CHARVAL("0")
	ccf
	ret nc
	cp CHARVAL("9") + 1
	ret nc
	inc de
	sub CHARVAL("0")
	ld c, l
	ld b, h
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, bc
	ret c
	add hl, hl
	ret c
	add l
	ld l, a
	ld a, h
	adc $0
	ld h, a
	jr nc, .positive_number_loop
	ret

.ParseHexidecimalNumber:
	ld hl, $0
.hex_loop
	ld a, [de]
	or a
	ret z
	sub CHARVAL("0")
	ccf
	ret nc
	cp 10
	jr c, .decimal
	add CHARVAL("0")
	and $df
	sub CHARVAL("A") - 10
	cp 10
	ccf
	ret nc
	cp $10
	ret nc
.decimal
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, hl
	ret c
	add hl, hl
	ret c
	add l
	ld l, a
	inc de
	jr .hex_loop

PrintNumShortPredef:: ; 7d486 (1f:5486)
	ld [hl], CHARVAL(" ")
	inc hl
	reg8rot a, l, e
	reg8rot a, h, d
	ld a, CHARVAL(" ")
	bit 7, h
	jr z, .asm_7d49e
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	inc hl
	ld a, CHARVAL("-")
.asm_7d49e
	push af
	push de
	ld bc, -10000
	call GetDigitShort
	ld bc, -1000
	call GetDigitShort
	ld bc, -100
	call GetDigitShort
	ld bc, -10
	call GetDigitShort
	ld a, l
	add CHARVAL("0")
	ld [de], a
	inc de
	xor a
	ld [de], a
	pop hl
	ld b, $4
.asm_7d4c2
	ld a, [hl]
	cp CHARVAL("0")
	jr nz, .asm_7d4cd
	ld [hl], CHARVAL(" ")
	inc hl
	dec b
	jr nz, .asm_7d4c2
.asm_7d4cd
	dec hl
	pop af
	ld [hl], a
	ret

GetDigitShort:: ; 7d4d1 (1f:54d1)
	ld a, CHARVAL("0") - 1
.loop
	inc a
	add hl, bc
	jr c, .loop
	ld [de], a
	inc de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ret

PrintNumLongPredef:: ; 7d4e0 (1f:54e0)
	ld [hl], CHARVAL(" ")
	inc hl
	reg8rot a, l, e
	reg8rot a, h, d
	ld a, CHARVAL(" ")
	bit 7, b
	jr z, .positive
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	add $1
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, $0
	adc c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, CHARVAL("-")
.positive
	push af
	push de
	push bc
	push hl
	push de
	ld de, (-1000000000) >> 16
	ld bc, (-1000000000) & $ffff
	call .GetDigitLong
	ld de, (-100000000) >> 16
	ld bc, (-100000000) & $ffff
	call .GetDigitLong
	ld de, (-10000000) >> 16
	ld bc, (-10000000) & $ffff
	call .GetDigitLong
	ld de, (-1000000) >> 16
	ld bc, (-1000000) & $ffff
	call .GetDigitLong
	ld de, (-100000) >> 16
	ld bc, (-100000) & $ffff
	call .GetDigitLong
	ld de, (-10000) >> 16
	ld bc, (-10000) & $ffff
	call .GetDigitLong
	pop de
	pop hl
	pop bc
	ld bc, (-1000) & $ffff
	call GetDigitShort
	ld bc, (-100) & $ffff
	call GetDigitShort
	ld bc, (-10) & $ffff
	call GetDigitShort
	ld a, l
	add CHARVAL("0")
	ld [de], a
	inc de
	xor a
	ld [de], a
	pop hl
	ld b, $9
.find_nonzero_leader
	ld a, [hl]
	cp CHARVAL("0")
	jr nz, .break
	ld [hl], CHARVAL(" ")
	inc hl
	dec b
	jr nz, .find_nonzero_leader
.break
	dec hl
	pop af
	ld [hl], a
	ret

.GetDigitLong: ; 7d574 (1f:5574)
	ld a, CHARVAL("0") - 1
	push af
.loop
	ld hl, sp+$1
	inc [hl]
	ld hl, sp+$6
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hli], a
	ld a, [hl]
	adc e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .loop
	pop af
	ld hl, sp+$2
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	pop de
	ld hl, sp+$4
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc b
	ld [hli], a
	ld a, [hl]
	sbc e
	ld [hli], a
	ld a, [hl]
	sbc d
	ld [hl], a
	ret

PrintHexShortPredef:: ; 7d5a6 (1f:55a6)
	reg8rot a, l, e
	reg8rot a, h, d
	push de
	ld a, h
	call .PrintHexChar
	ld a, l
	call .PrintHexChar
	xor a
	ld [de], a
	pop hl
	inc hl
	inc hl
	ret

.PrintHexChar:
	push af
	and $f0
	rrca
	rrca
	rrca
	rrca
	call .GetHexChar
	ld [de], a
	inc de
	pop af
	and $f
	call .GetHexChar
	ld [de], a
	inc de
	ret

.GetHexChar:
	cp 10
	jr nc, .high_hex
	add CHARVAL("0")
	ret

.high_hex
	add CHARVAL("A") - 10
	ret

Func_7d5da:: ; 7d5da (1f:55da)
	push hl
	ld a, d
	or a
	jr z, .asm_7d5e1
	ld [hl], d
	inc hl
.asm_7d5e1
	ld [hl], e
	inc hl
	ld [hl], $0
	pop hl
	ret

Func_7d5e7:: ; 7d5e7 (1f:55e7)
	ld a, b
	or c
	ret z
	ldh a, [hFF86]
	or a
	jr z, .asm_7d5f6
	ld a, h
	and $e0
	cp $80
	jr z, .asm_7d5fe
.asm_7d5f6
	ld [hl], e
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_7d5f6
	ret

.asm_7d5fe
	ld a, b
	or a
.asm_7d600
	push af
	call Func_7d676
	pop af
	push af
	jr nz, .asm_7d60f
	ld a, b
	cp c
	jr c, .asm_7d60f
	pop af
	jr Func_7d62b

.asm_7d60f
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call Func_7d62b
	pop bc
	pop hl
	add hl, bc
	pop bc
	pop af
	push hl
	ld l, b
	ld b, a
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	pop hl
	jr .asm_7d600

asm_7d62a:
	halt
Func_7d62b:: ; 7d62b
	ldh a, [hFF88]
	ld b, a
	ldh a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7d62a
	ld a, c
	srl a
	inc a
	add $13
	ld b, a
	jr .asm_7d63f

.asm_7d63e
	halt
.asm_7d63f
	ldh a, [hFF89]
	add b
	jr c, .asm_7d63e
	cp $c8
	jr nc, .asm_7d63e
	push de
	push hl
	ldh a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $1
	inc l
	ld [hl], b
	inc l
	ld a, $80
	sub c
	ld de, Func_7d096
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	pop de
	ld [hl], e
	inc l
	di
	ld a, l
	ldh [hFF87], a
	ldh a, [hFF89]
	add b
	ldh [hFF89], a
	ei
	ret

asm_7d675:
	halt
Func_7d676:: ; 7d676 (1f:5676)
	ldh a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $13
	jr c, asm_7d675
	ld b, $80
	inc a
	add a
	ret c
	cp b
	ret nc
	ld b, a
	ret

GetJUTFCharacter_1bpp:: ; 7d689 (1f:5689)
; e: which character
; c: flags
	push bc
	push de
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_7efb5
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld b, $8
.loop
	ld a, $ff
	bit 4, c
	jr nz, .check_bit_0_1
	inc a
	bit 0, c
	jr z, .load1
	ld a, [de]
	jr .load1

.check_bit_0_1
	bit 0, c
	jr nz, .load1
	ld a, [de]
	cpl
.load1
	ld [hli], a
	ld a, $ff
	bit 5, c
	jr nz, .check_bit_0_2
	inc a
	bit 1, c
	jr z, .load2
	ld a, [de]
	jr .load2

.check_bit_0_2
	bit 0, c
	jr nz, .load2
	ld a, [de]
	cpl
.load2
	ld [hli], a
	inc de
	dec b
	jr nz, .loop
	pop de
	pop bc
	ret

Func_7d6cc:: ; 7d6cc (1f:56cc)
	push bc
	push hl
	push de
	ld d, c
	push de
	push af
	ld l, b
	ld h, $0
	ld d, h
	ld e, c
	predef MultiplySignedShortPredef
	ld b, l
	pop af
	call Func_7d738
	jp c, Func_7d71d
	ldh [hFFA1], a
	ld e, l
	ld d, h
	ldh a, [rLCDC]
	and $4
	rrca
	rrca
	inc a
	ld c, a
.asm_7d6ed
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
	ld a, c
	add a
	add a
	add a
	add [hl]
	ld [hli], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	add c
	ld [hli], a
	ld a, [hli]
	ld [de], a
	inc de
	dec [hl]
	ld a, [hl]
	or a
	jr nz, .asm_7d6ed
	push hl
	ld hl, sp+$2
	ld a, [hli]
	ld b, [hl]
	ld hl, sp+$4
	ld [hl], a
	inc hl
	ld a, [hl]
	add $8
	ld [hl], a
	pop hl
	ld a, b
	ld [hli], a
	dec [hl]
	ld a, [hl]
	or a
	jr nz, .asm_7d6ed
Func_7d71d:: ; 7d71d (1f:571d)
	pop de
	pop de
	pop hl
	pop bc
	ldh a, [hFFA1]
	ret

Func_7d724:: ; 7d724 (1f:5724)
	call Func_7d738
	jr c, .asm_7d735
.asm_7d729
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	dec b
	jr nz, .asm_7d729
	or a
.asm_7d735
	ldh a, [hFFA1]
	ret

Func_7d738:: ; 7d738 (1f:5738)
	cp $ff
	jr nz, .asm_7d73e
	ldh a, [hFFA1]
.asm_7d73e
	ld l, a
	add b
	cp $41
	ccf
	ret c
	push af
	ld a, l
	add a
	add a
	ld hl, wc300
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	ret

Func_7d753:: ; 7d753 (1f:5753)
	push af
	push bc
	push de
	push hl
	di
	call Func_7dff6
	hlbgcoord 0, 0
	call Func_7d8fc
	xor a
	ldh [hFF8E], a
	ldh [hFF8F], a
	call Func_7d8e5
	call Func_7d835
	call Func_7d847
	call Func_7d8c5
	call Func_7e0d2
	ldh a, [rIE]
	or $1
	ldh [rIE], a
	ei
	pop hl
	pop de
	pop bc
	pop af
	push af
	and $cc
	or $3
	call LoadJUTFFont
	pop af
	and $20
	ret nz
	ld a, $7
Func_7d78e:: ; 7d78e (1f:578e)
	or $80
	ldh [hFF86], a
	ldh [rLCDC], a
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

LoadJUTFFont:: ; 7d79c (1f:579c)
	bit 7, a
	jr nz, .asm_7d7cf
	ld a, $3
	ldh [hFF92], a
	ld e, $20
	call Func_7d854
	ld hl, $8800
	ld e, $80
	ld bc, $3
.copyLoop
	push bc
	push de
	push hl
	ld hl, wc3e0
	push hl
	call GetJUTFCharacter_1bpp
	pop de
	pop hl
	push hl
	ld bc, $10
	predef CopyPredef
	pop hl
	ld bc, $10
	add hl, bc
	pop de
	pop bc
	inc e
	dec b
	jr nz, .copyLoop
	ret

.asm_7d7cf
	bit 2, a
	jr nz, .asm_7d7d5
	ld h, $4
.asm_7d7d5
	push af
	push bc
	push de
	push hl
	push bc
	push de
	and $83
	or $8
	ldh [hFF92], a
	ld e, $7f
	call Func_7d854
	pop de
	pop bc
	ld a, $80
	call Func_7dc58
	pop bc
	push bc
	call Func_7dd7f
	pop hl
	pop de
	pop bc
	pop af
	bit 6, a
	jr z, .asm_7d805
	push hl
	dec b
	dec c
	inc d
	inc d
	inc e
	inc e
	call Func_7dcba
	pop hl
.asm_7d805
	call Func_7d85d
	ld a, [wc3bb]
	add $80
	cp $b5
	ret nc
	ld hl, $9340
	ld e, $21
	ld bc, $3f03
.copyLoop2
	push bc
	push de
	push hl
	ld hl, wc3e0
	push hl
	call GetJUTFCharacter_1bpp
	pop de
	pop hl
	push hl
	ld bc, $10
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	pop de
	pop bc
	inc e
	dec b
	jr nz, .copyLoop2
	ret

Func_7d835:: ; 7d835 (1f:5835)
	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ldh [rWY], a
	ldh [rWX], a
	ldh [hSCY], a
	ldh [hSCX], a
	ldh [hWY], a
	ldh [hWX], a
	ret

Func_7d847:: ; 7d847 (1f:5847)
	ld a, $e4
	ldh [hBGP], a
	ld a, $d8
	ldh [hOBP0], a
	ld a, $9c
	ldh [hOBP1], a
	ret

Func_7d854:: ; 7d854 (1f:5854)
	hlbgcoord 0, 0
	ld bc, $800
	jp Func_7d5e7

Func_7d85d:: ; 7d85d (1f:585d)
	ld a, h
	or a
	jr z, .asm_7d8a0
	cp $2
	jr z, .asm_7d8ac
	cp $4
	jr z, .asm_7d895
	ld b, h
	ld c, l
	ld hl, $9730
	call Func_7e7d1
	call Func_7e81f
	call Func_7e86d
	call Func_7e87e
	call Func_7e88f
	call Func_7e8b7
	call Func_7e8df
	call Func_7e902
	call Func_7e92a
	call Func_7e952
	call Func_7e975
	call Func_7e9a1
	jp Func_7e9cd

.asm_7d895
	ld hl, $9730
	ld de, Data_7f7b5
	ld bc, $c0
	predef CopyPredef
.asm_7d8a0
	ld hl, $97f0
	ld e, $0
	ld bc, $10
	call Func_7d5e7
	ret

.asm_7d8ac
	ld hl, $97c0
	ld de, Data_7f845
	ld bc, $10
	predef CopyPredef
	ld hl, $97d0
	ld bc, $0
	call Func_7e975
	call Func_7e9a1
	jr .asm_7d8a0

Func_7d8c5:: ; 7d8c5 (1f:58c5)
	ld bc, $2800
Func_7d8c8:: ; 7d8c8 (1f:58c8)
	ld a, c
	ldh [hFFA1], a
	call Func_7d738
	xor a
.asm_7d8cf
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .asm_7d8cf
	ret

Func_7d8d7:: ; 7d8d7 (1f:58d7)
	ldh a, [rLCDC]
	and $80
	ret z
	ei
	call FrameDelayPredef_7ceaf
	call Func_7d8e5
	ei
	ret

Func_7d8e5:: ; 7d8e5 (1f:58e5)
	di
	ldh a, [rLCDC]
	and $80
	jr z, .asm_7d8f8
.asm_7d8ec
	ldh a, [rLY]
	cp $91
	jr nz, .asm_7d8ec
	ldh a, [rLCDC]
	and $7f
	ldh [rLCDC], a
.asm_7d8f8
	xor a
	ldh [hFF86], a
	ret

Func_7d8fc:: ; 7d8fc (1f:58fc)
	ld a, l
	ld [wc3c8], a
	ld a, h
	ld [wc3c8 + 1], a
	ret

Func_7d905:: ; 7d905 (1f:5905)
	ldh a, [hFF92]
	bit 3, a
	jr nz, .asm_7d912
	ld a, h
	ldh [hFF8E], a
	ld a, l
	ldh [hFF8F], a
	ret

.asm_7d912
	ld a, l
	add a
	add a
	add a
	add l
	ld l, a
Func_7d918:: ; 7d918 (1f:5918)
	ld a, h
	ldh [hFF90], a
	ld a, l
	ldh [hFF91], a
	ret

Func_7d91f:: ; 7d91f (1f:591f)
	push bc
	ld c, a
	ldh a, [hFF92]
	bit 3, a
	ldh a, [hFF90]
	jr nz, .asm_7d92b
	ldh a, [hFF8E]
.asm_7d92b
	ld b, a
	ld a, c
	sub b
	jr c, .asm_7d93b
	jr z, .asm_7d93b
	ld b, a
.asm_7d933
	ld a, $20
	call Func_7d93e
	dec b
	jr nz, .asm_7d933
.asm_7d93b
	xor a
	pop bc
	ret

Func_7d93e:: ; 7d93e (1f:593e)
	push bc
	push de
	push hl
	ld e, a
	ldh a, [hFF92]
	bit 3, a
	jr nz, .asm_7d952
	call Func_7d974
	call Func_7db3d
	pop hl
	pop de
	pop bc
	ret

.asm_7d952
	call Func_7d983
	call Func_7db6f
	pop hl
	pop de
	pop bc
	ret

Func_7d95c:: ; 7d95c (1f:595c)
	push bc
	push de
	push hl
	ld e, a
	ldh a, [hFF92]
	bit 3, a
	jr nz, .asm_7d96d
	call Func_7d974
	pop hl
	pop de
	pop bc
	ret

.asm_7d96d
	call Func_7d983
	pop hl
	pop de
	pop bc
	ret

Func_7d974:: ; 7d974 (1f:5974)
	ldh a, [hFF8E]
	ld h, a
	ldh a, [hFF8F]
	ld l, a
	call Func_7d9e0
	ld bc, $1
	jp Func_7d5e7

Func_7d983:: ; 7d983 (1f:5983)
	ld c, a
	ld hl, wc3e0
	push hl
	call GetJUTFCharacter_1bpp
	pop hl
Func_7d98c:: ; 7d98c (1f:598c)
	push hl
	ldh a, [hFF90]
	ld h, a
	ldh a, [hFF91]
	ld l, a
	call Func_7d99d
	pop de
	ld bc, $10
	predef CopyPredef
	ret

Func_7d99d:: ; 7d99d (1f:599d)
	push de
	push bc
	ld a, l
	ld c, h
	push af
	ld b, $5
	ld hl, wc3bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
.asm_7d9ab
	rr c
	jr nc, .asm_7d9b7
	ld a, e
	add [hl]
	inc hl
	ld e, a
	ld a, d
	adc [hl]
	ld d, a
	dec hl
.asm_7d9b7
	inc hl
	inc hl
	dec b
	jr nz, .asm_7d9ab
	pop af
	pop bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	pop de
	ret

Func_7d9c5:: ; 7d9c5 (1f:59c5)
	push af
	push bc
	push de
	push hl
	ld h, d
	ld l, e
	ld e, a
	call Func_7d9e0
	ld bc, $1
	call Func_7d5e7
	pop hl
	pop de
	pop bc
	ld a, d
	add b
	ld d, a
	ld a, e
	add c
	ld e, a
	pop af
	ret

Func_7d9e0:: ; 7d9e0 (1f:59e0)
	ld a, h
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wc3c8]
	add l
	ld l, a
	ld a, [wc3c8 + 1]
	adc h
	ld h, a
	ret

Func_7d9f9:: ; 7d9f9 (1f:59f9)
	push bc
	push de
	push hl
	call .Function
	pop hl
	pop de
	pop bc
	ret

.Function: ; 7da03 (1f:5a03)
	ld hl, hFF92
	bit 7, [hl]
	jr z, .asm_7da19
	bit 3, [hl]
	jr z, .asm_7da1d
	ld de, Data_7da60
	ld bc, hFF90
	cp $18
	jr c, .asm_7da27
	ret

.asm_7da19
	cp $7
	jr z, Func_7da41
.asm_7da1d
	ld de, Data_7da42
	ld bc, hFF8E
	cp $10
	jr nc, Func_7da41
.asm_7da27
	sub $1
	jr c, Func_7da41
	cp $d
	push af
	add a
	add e
	ld l, a
	ld a, $0
	adc d
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	push de
	ld l, c
	ld h, b
	jr c, Func_7da41
	ld hl, hFF92
Func_7da41:: ; 7da41
	ret

Data_7da42:: ; 7da42
	dw Func_7db40
	dw Func_7db50
	dw Func_7db47
	dw Func_7db61
	dw Func_7dad4
	dw Func_7da8e
	dw Func_7da94
	dw Func_7db0d
	dw Func_7daea
	dw Func_7da41
	dw Func_7db39
	dw Func_7db15
	dw Func_7db45
	dw Func_7da9a
	dw Func_7da9d

Data_7da60:: ; 7da60
	dw Func_7db72
	dw Func_7db81
	dw Func_7db7b
	dw Func_7db8a
	dw Func_7da41
	dw Func_7da8e
	dw Func_7da94
	dw Func_7db67
	dw Func_7da41
	dw Func_7da41
	dw Func_7db39
	dw Func_7dd7c
	dw Func_7db79
	dw Func_7da9a
	dw Func_7da9d
	dw Func_7daa0
	dw Func_7daa5
	dw Func_7daac
	dw Func_7dab3
	dw Func_7daba
	dw Func_7dabf
	dw Func_7dac6
	dw Func_7dacd

Func_7da8e:: ; 7da8e
	ld hl, hFF92
	res 3, [hl]
	ret

Func_7da94:: ; 7da94
	ld hl, hFF92
	set 3, [hl]
	ret

Func_7da9a:: ; 7da9a
	res 2, [hl]
	ret

Func_7da9d:: ; 7da9d
	set 2, [hl]
	ret

Func_7daa0:: ; 7daa0
	ld a, [hl]
	and $fc
	ld [hl], a
	ret

Func_7daa5:: ; 7daa5
	ld a, [hl]
	and $fc
	or $1
	ld [hl], a
	ret

Func_7daac:: ; 7daac
	ld a, [hl]
	and $fc
	or $2
	ld [hl], a
	ret

Func_7dab3:: ; 7dab3
	ld a, [hl]
	and $fc
	or $3
	ld [hl], a
	ret

Func_7daba:: ; 7daba
	ld a, [hl]
	and $cf
	ld [hl], a
	ret

Func_7dabf:: ; 7dabf
	ld a, [hl]
	and $cf
	or $10
	ld [hl], a
	ret

Func_7dac6:: ; 7dac6
	ld a, [hl]
	and $cf
	or $20
	ld [hl], a
	ret

Func_7dacd:: ; 7dacd
	ld a, [hl]
	and $cf
	or $30
	ld [hl], a
	ret

Func_7dad4:: ; 7dad4
	push bc
	push de
	ld e, $20
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, $14
	sub h
	ld c, a
	ld b, $0
	call Func_7d9e0
	call Func_7d5e7
	pop de
	pop bc
	ret

Func_7daea:: ; 7daea
	push bc
	push de
	ld e, $20
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and $3
	ld d, a
	ld a, $4
	sub d
	ld c, a
	ld b, $0
	push af
	call Func_7d9e0
	call Func_7d5e7
	pop af
	ld hl, hFF8E
	add [hl]
	ld [hl], a
	call Func_7db42
	pop de
	pop bc
	ret

Func_7db0d:: ; 7db0d
	call Func_7db50
	ld a, $20
	jp Func_7d95c

Func_7db15:: ; 7db15
	push bc
	push de
	ld a, [wc3c8]
	ld l, a
	ld a, [wc3c8 + 1]
	ld h, a
	ld e, $20
	ld d, $12
.asm_7db23
	push de
	push hl
	ld bc, $14
	call Func_7d5e7
	pop hl
	pop de
	ld bc, $20
	add hl, bc
	dec d
	jr nz, .asm_7db23
	pop de
	pop bc
	ld hl, hFF8E
Func_7db39:: ; 7db39
	xor a
	ld [hli], a
	ld [hl], a
	ret

Func_7db3d:: ; 7db3d (1f:5b3d)
	ld hl, hFF8E
Func_7db40:: ; 7db40
	inc [hl]
	ld a, [hl]
Func_7db42:: ; 7db42 (1f:5b42)
	cp $14
	ret c
Func_7db45:: ; 7db45
	ld [hl], $0
Func_7db47:: ; 7db47
	inc hl
	inc [hl]
	ld a, [hl]
	cp $12
	ret c
	ld [hl], $0
	ret

Func_7db50:: ; 7db50 (1f:5b50)
	ld a, [hl]
	dec [hl]
	or a
	jr nz, .asm_7db60
	ld [hl], $13
	inc hl
	ld a, [hl]
	dec [hl]
	or a
	jr nz, .asm_7db5f
	ld [hl], $11
.asm_7db5f
	dec hl
.asm_7db60
	ret

Func_7db61:: ; 7db61
	inc hl
	ld a, [hl]
	or a
	ret z
	dec [hl]
	ret

Func_7db67:: ; 7db67
	call Func_7db81
	ld a, $20
	jp Func_7d95c

Func_7db6f:: ; 7db6f (1f:5b6f)
	ld hl, hFF90
Func_7db72:: ; 7db72
	inc [hl]
	ld a, [wc3b9]
	dec a
	cp [hl]
	ret nc
Func_7db79:: ; 7db79
	ld [hl], $0
Func_7db7b:: ; 7db7b
	inc hl
	ld a, [hl]
	add $9
	ld [hl], a
	ret

Func_7db81:: ; 7db81 (1f:5b81)
	ld a, [hl]
	dec [hl]
	or a
	ret nz
	ld a, [wc3b9]
	dec a
	ld [hl], a
Func_7db8a:: ; 7db8a
	inc hl
	ld a, [hl]
	sub $9
	ret c
	ld [hl], a
	ret

Func_7db91:: ; 7db91 (1f:5b91)
	ldh a, [hFF92]
	bit 6, a
	jr nz, .asm_7dbb8
	bit 7, a
	jr z, .asm_7dbce
	bit 3, a
	jr nz, .asm_7dbbb
	ld a, e
	cp $21
	jr c, .asm_7dbb4
	cp $7b
	jr nc, .asm_7dbb4
	cp $60
	jr z, .asm_7dbb4
	jr c, .asm_7dbb0
	sub $20
.asm_7dbb0
	add $13
	or a
	ret

.asm_7dbb4
	ld a, $7f
	or a
	ret

.asm_7dbb8
	ld a, e
	or a
	ret

.asm_7dbbb
	ld a, e
	cp $80
	jr c, .asm_7dbce
	cp $a0
	jr c, .asm_7dbc8
	cp $e0
	jr c, .asm_7dbce
.asm_7dbc8
	ld a, d
	or a
	ret z
	xor a
	scf
	ret

.asm_7dbce
	ld a, e
	cp $20
	jr c, asm_7dc41
	cp $60
	jr c, asm_7dc53
	cp $80
	jr c, asm_7dc55
	cp $a1
	jr z, asm_7dc45
	cp $a2
	jr z, asm_7dc4e
	cp $a3
	jr z, asm_7dc4b
	cp $a4
	jr z, asm_7dc48
	cp $a5
	jr z, asm_7dc45
	cp $a6
	jr z, .asm_7dc2f
	cp $b0
	jr z, asm_7dc51
	jr c, .asm_7dc33
	cp $b6
	jr c, Func_7dc35
	cp $c5
	jr c, .asm_7dc27
	cp $ca
	jr c, Func_7dc35
	cp $de
	jr z, asm_7dc41
	cp $df
	jr z, asm_7dc41
	cp $cf
	jr nc, Func_7dc35
	ld a, d
	cp $de
	jr z, .asm_7dc1f
	cp $df
	jr nz, .asm_7dc2c
.asm_7dc1a
	ld a, e
	add $28
	jr .asm_7dc22

.asm_7dc1f
	ld a, e
	add $23
.asm_7dc22
	call Func_7dc35
	scf
	ret

.asm_7dc27
	ld a, d
	cp $de
	jr z, .asm_7dc1a
.asm_7dc2c
	ld a, e
	jr Func_7dc35

.asm_7dc2f
	ld a, $b0
	jr Func_7dc35

.asm_7dc33
	add $50
Func_7dc35:: ; 7dc35
	push hl
	ld hl, hFF92
	or a
	bit 2, [hl]
	pop hl
	ret z
	sub $50
	ret

asm_7dc41:
	ld a, $20
	or a
	ret

asm_7dc45:
	ld a, $2e
	ret

asm_7dc48:
	ld a, $2c
	ret

asm_7dc4b:
	ld a, $1d
	ret

asm_7dc4e:
	ld a, $1b
	ret

asm_7dc51:
	ld a, $2d
asm_7dc53:
	or a
	ret

asm_7dc55:
	and $1f
	ret

Func_7dc58:: ; 7dc58 (1f:5c58)
	ld hl, wc3b5
	ld [hli], a
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld h, c
	ld l, b
	call Func_7d9e0
	ld a, [wc3b5]
	ld c, a
.asm_7dc6e
	push hl
	ld b, d
.asm_7dc70
	ld [hl], c
	inc c
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_7dc70
	pop hl
	inc hl
	dec e
	jr nz, .asm_7dc6e
	ld a, c
	ld [wc3bb], a
	ld a, [wc3b5]
	call Func_7dcad
	ld [wc3bd], a
	ld a, l
	ld [wc3bc], a
	ld a, [wc3b6]
	add a
	add a
	add a
	ld e, a
	ld d, $0
	ld b, $5
	ld hl, wc3be
.asm_7dca1
	sla e
	rl d
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .asm_7dca1
	ret

Func_7dcad:: ; 7dcad (1f:5cad)
	sub $80
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, $88
	add h
	ret

Func_7dcba:: ; 7dcba (1f:5cba)
	ld a, e
	cp $3
	ret c
	ld a, d
	cp $3
	ret c
	push hl
	ld h, c
	ld l, b
	call Func_7d9e0
	pop bc
	push bc
	push de
	push hl
	ld hl, wc3e0
	ld d, b
	ld c, e
	ld b, e
	ld a, $77
	call Func_7dd59
	ld [hli], a
	dec b
	dec b
	ld a, $79
	call Func_7dd59
.asm_7dcdf
	ld [hli], a
	dec b
	jr nz, .asm_7dcdf
	ld a, $78
	call Func_7dd59
	ld [hli], a
	pop hl
	push hl
	ld de, wc3e0
	predef CopyPredef
	pop hl
	pop de
	pop bc
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	push bc
	ld a, $75
	call Func_7dd59
	ld b, a
	ld a, $76
	call Func_7dd59
	ld c, a
	dec d
	dec d
.asm_7dd0a
	push bc
	push hl
	push de
	push hl
	ld e, b
	push bc
	ld bc, $1
	call Func_7d5e7
	pop bc
	pop hl
	pop de
	push de
	dec e
	ld d, $0
	add hl, de
	ld e, c
	ld bc, $1
	call Func_7d5e7
	pop de
	pop hl
	pop bc
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec d
	jr nz, .asm_7dd0a
	pop bc
	push hl
	ld d, b
	ld hl, wc3e0
	ld c, e
	ld b, e
	ld a, $7a
	call Func_7dd59
	ld [hli], a
	dec b
	dec b
	ld a, $7c
	call Func_7dd59
.asm_7dd48
	ld [hli], a
	dec b
	jr nz, .asm_7dd48
	ld a, $7b
	call Func_7dd59
	ld [hli], a
	pop hl
	ld de, wc3e0
	predef CopyPredef
	ret

Func_7dd59:: ; 7dd59 (1f:5d59)
	push hl
	ld l, a
	ld a, [wc3bb]
	cp $7c
	jr z, .asm_7dd6b
	cp $7f
	jr nz, .asm_7dd68
.asm_7dd66
	ld l, $7f
.asm_7dd68
	ld a, l
	pop hl
	ret

.asm_7dd6b
	ld a, l
	cp $75
	jr c, .asm_7dd78
	cp $77
	jr c, .asm_7dd66
	cp $7c
	jr nc, .asm_7dd68
.asm_7dd78
	ld l, $7c
	jr .asm_7dd68

Func_7dd7c:: ; 7dd7c
	ldh a, [hFF92]
	ld b, a
Func_7dd7f:: ; 7dd7f (1f:5d7f)
	ld a, b
	and $30
	ld e, a
	jr z, .asm_7ddc5
	dec e
	cp $30
	jr z, .asm_7ddc5
	add sp, -$10
	ld hl, sp+$0
	call Func_7ea06
	ld e, l
	ld d, h
	ld hl, sp+$0
	ld b, $e
	call Func_7e9f0
	xor a
	ldh [hFF90], a
	ldh [hFF91], a
	ld a, [wc3bc]
	ld l, a
	ld a, [wc3bd]
	ld h, a
	ld a, [wc3bb]
	add $80
	ld b, a
.asm_7ddad
	push bc
	push hl
	push hl
	ld hl, sp+$6
	ld e, l
	ld d, h
	pop hl
	ld bc, $10
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_7ddad
	add sp, $10
	ret

.asm_7ddc5
	push de
	xor a
	ldh [hFF90], a
	ldh [hFF91], a
	ld a, [wc3bc]
	ld e, a
	ld a, [wc3bd]
	ld d, a
	ld a, [wc3bb]
	call Func_7dcad
	ld h, a
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld l, e
	ld h, d
	pop de
	jp Func_7d5e7

Func_7dde6:: ; 7dde6 (1f:5de6)
	push hl
	ld l, e
	ld h, d
	call Func_7d99d
	pop de
	sla c
.asm_7ddef
	push bc
	push hl
	push de
	ld b, $0
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [wc3be]
	add l
	ld l, a
	ld a, [wc3be + 1]
	adc h
	ld h, a
	pop bc
	dec b
	jr nz, .asm_7ddef
	ret

Func_7de0c:: ; 7de0c (1f:5e0c)
	push hl
	ld l, e
	ld h, d
	call Func_7d99d
	ld e, l
	ld d, h
	pop hl
	sla c
.asm_7de17
	push bc
	push de
	push hl
	ld b, $0
	push bc
	predef CopyPredef
	pop bc
	pop hl
	add hl, bc
	pop de
	ld a, [wc3be]
	add e
	ld e, a
	ld a, [wc3be + 1]
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .asm_7de17
	ret

Func_7de32:: ; 7de32 (1f:5e32)
	push hl
	push af
	push bc
	push de
	ld hl, sp+$0
	call Func_7df32
.asm_7de3b
	call DelayFrame
	call Func_7e17c
	or a
	jr z, .asm_7de3b
	ld c, a
	and $f
	jr nz, .asm_7de84
	ld a, c
	bit 4, a
	jr nz, .asm_7de75
	bit 5, a
	jr nz, .asm_7de6c
	bit 6, a
	jr nz, .asm_7de63
	bit 7, a
	jr z, .asm_7de3b
	push bc
	call Func_7df32
	call Func_7df0f
	jr .asm_7de7c

.asm_7de63
	push bc
	call Func_7df32
	call Func_7deee
	jr .asm_7de7c

.asm_7de6c
	push bc
	call Func_7df32
	call Func_7dec7
	jr .asm_7de7c

.asm_7de75
	push bc
	call Func_7df32
	call Func_7de9a
.asm_7de7c
	push af
	call Func_7df32
	pop af
	pop bc
	jr nc, .asm_7de3b
.asm_7de84
	ld hl, sp+$7
	ld b, [hl]
	ld a, b
	and c
	jr nz, .asm_7de8f
	ld hl, sp+$0
	jr .asm_7de3b

.asm_7de8f
	ld [hl], c
	ld hl, sp+$0
	call Func_7df32
	pop de
	pop bc
	pop af
	pop hl
	ret

Func_7de9a:: ; 7de9a (1f:5e9a)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	inc hl
	ld a, [hli]
	inc a
	cp [hl]
	jr nc, asm_7dec4
.asm_7deb3
	sub b
	jr z, asm_7dec4
	jr nc, .asm_7deb3
	dec hl
	inc [hl]
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, d
	add c
	ld [hl], a
asm_7dec1:
	pop hl
Func_7dec2:: ; 7dec2 (1f:5ec2)
	or a
	ret

asm_7dec4:
	pop hl
	scf
	ret

Func_7dec7:: ; 7dec7 (1f:5ec7)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	inc hl
	ld a, [hl]
	or a
	jr z, asm_7dec4
.asm_7dedf
	sub b
	jr z, asm_7dec4
	jr nc, .asm_7dedf
	dec [hl]
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, d
	sub c
	ld [hl], a
	jr asm_7dec1

Func_7deee:: ; 7deee (1f:5eee)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	srl b
	srl b
	srl b
	srl b
	inc hl
	inc hl
	ld a, [hl]
	sub b
	jr c, asm_7dec4
	ld [hl], a
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, e
	sub c
	ld [hl], a
	jr asm_7dec1

Func_7df0f:: ; 7df0f (1f:5f0f)
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	srl b
	srl b
	srl b
	srl b
	inc hl
	inc hl
	ld a, [hli]
	add b
	cp [hl]
	jr nc, asm_7dec4
	dec hl
	ld [hl], a
	dec hl
	dec hl
	dec hl
	dec hl
	dec hl
	ld a, e
	add c
	ld [hl], a
	jr asm_7dec1

Func_7df32:: ; 7df32 (1f:5f32)
	push hl
	ld a, [hli]
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, a
	ld h, d
	ld a, b
	and $f
	ld b, a
	call Func_7d99d
	sla c
	ld a, [wc3be]
	ld e, a
	ld a, [wc3be + 1]
	ld d, a
.asm_7df4c
	push bc
	push de
	push hl
	ld b, $0
	call Func_7df7d
	pop hl
	pop de
	pop bc
	add hl, de
	dec b
	jr nz, .asm_7df4c
	pop hl
	ret

asm_7df5d:
	halt
Func_7df5e:: ; 7df5e (1f:5f5e)
	ldh a, [hFF89]
	ld b, a
	ld a, $c8
	sub b
	sub $14
	jr c, asm_7df5d
	push hl
	push bc
	add $4
	ld l, a
	add hl, hl
	add hl, hl
	ld c, $5
	call DivideShortByCharPredef
	ld a, l
	pop bc
	pop hl
	ld b, $40
	cp b
	ret nc
	ld b, a
	ret

Func_7df7d:: ; 7df7d (1f:5f7d)
	ld a, b
	or a
.asm_7df7f
	push af
	call Func_7df5e
	pop af
	push af
	jr nz, .asm_7df8e
	ld a, b
	cp c
	jr c, .asm_7df8e
	pop af
	jr Func_7dfaa

.asm_7df8e
	push bc
	push hl
	ld c, b
	ld b, $0
	push bc
	call Func_7dfaa
	pop bc
	pop hl
	add hl, bc
	pop bc
	pop af
	push hl
	ld l, b
	ld b, a
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	pop hl
	jr .asm_7df7f

asm_7dfa9:
	halt
Func_7dfaa:: ; 7dfaa
	ldh a, [hFF88]
	ld b, a
	ldh a, [hFF87]
	sub b
	cp $f0
	jr nc, asm_7dfa9
	ld a, c
	srl a
	srl a
	inc a
	add c
	add $14
	ld b, a
	jr .asm_7dfc1

.asm_7dfc0
	halt
.asm_7dfc1
	ldh a, [hFF89]
	add b
	jr c, .asm_7dfc0
	cp $c8
	jr nc, .asm_7dfc0
	push hl
	ldh a, [hFF87]
	ld l, a
	ld h, $c2
	ld [hl], $4
	inc l
	ld [hl], b
	inc l
	ld a, $40
	sub c
	ld d, a
	add a
	add d
	ld de, Func_7cf08
	add e
	ld [hl], a
	ld a, $0
	adc d
	inc l
	ld [hl], a
	inc l
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	di
	ld a, l
	ldh [hFF87], a
	ldh a, [hFF89]
	add b
	ldh [hFF89], a
	ei
	ret

Func_7dff6:: ; 7dff6 (1f:5ff6)
	di
	ld de, Func_7e03a
	ld hl, wTimer
	ld bc, $20
	predef CopyPredef
	ld a, [Bank_000f]
	ld [wVBlank + 5], a
	ld de, Func_7e05a
	ld hl, hPushOAM
	ld bc, $a
	predef CopyPredef
	xor a
	ldh [hVBlankOccurred], a
	ldh [hFF83], a
	ldh [hFF84], a
	ldh [hFF85], a
	ldh [hFF86], a
	ldh [hFF87], a
	ldh [hFF88], a
	ldh [hFF89], a
	ldh [hFF8B], a
	ldh [hFF8C], a
	ldh [hFF8D], a
	ldh [hFF93], a
	ldh [hFF94], a
	ldh [hFF95], a
	ldh [hFF96], a
	cpl
	ldh [hFF8A], a
	ldh [hFF98], a
	ldh [hFF99], a
	ret

Func_7e03a:: ; Timer
	jp Timer_

Func_7e03d:: ; Serial
	reti

	ds 2
Func_7e040:: ; VBlank
	push af
	ldh a, [hROMBank]
	push af
	; no clue why bank 3 is here
	; the load in WRAM is overwritten before the interrupt is enabled
	ld a, $3
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	call VBlank2
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	reti

	ds 4

Func_7e05a:: ; PushOAM
	ld a, $c3
	ldh [rDMA], a
	ld a, $28
.asm_7e060
	dec a
	jr nz, .asm_7e060
	ret

Func_7e064:: ; 7e064 (1f:6064)
	ld a, l
	and h
	ld l, a
	ldh a, [hFF99]
	cpl
	or h
	cpl
	or l
	ldh [hFF99], a
	ret

VBlank2:: ; 7e070 (1f:6070)
	push bc
	push de
	push hl
	ldh a, [rLY]
	cp $90
	jr c, .asm_7e097
	ld hl, hSCY
	ld a, [hli]
	ldh [rSCY], a
	ld a, [hli]
	ldh [rSCX], a
	ld de, rBGP
	ld b, $5
.asm_7e087
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7e087
	ldh a, [hFF99]
	bit 0, a
	call nz, hPushOAM
	call Func_7d1e4
.asm_7e097
	ldh a, [hFF99]
	bit 1, a
	call nz, Func_7e0ea
	ldh a, [rIE]
	bit 2, a
	call z, Timer_
	ld hl, hFF83
	inc [hl]
	ld hl, hFF84
	inc [hl]
	ld a, $1
	ldh [hVBlankOccurred], a
	pop hl
	pop de
	pop bc
	ret

DelayFrame:: ; 7e0b5 (1f:60b5)
	xor a
	ldh [hVBlankOccurred], a
	ei
.asm_7e0b9
	halt
	ldh a, [hVBlankOccurred]
	dec a
	jr nz, .asm_7e0b9
	ldh [hVBlankOccurred], a
	ret

Func_7e0c2:: ; 7e0c2 (1f:60c2)
	push bc
	ld b, a
.asm_7e0c4
	call DelayFrame
	call Func_7e17c
	or a
	jr nz, .asm_7e0d0
	dec b
	jr nz, .asm_7e0c4
.asm_7e0d0
	pop bc
	ret

Func_7e0d2:: ; 7e0d2 (1f:60d2)
	push bc
	push de
	push hl
	xor a
	ldh [hFF8C], a
	ldh [hFF8D], a
	ldh [hFF8B], a
	ldh [hFFB6], a
	cpl
	ldh [hFF8A], a
	ldh [hFFB5], a
	call Func_7e0ea
	pop hl
	pop de
	pop bc
	ret

Func_7e0ea:: ; 7e0ea (1f:60ea)
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	cpl
	and $f
	or b
	ld b, a
	ldh [hFF8A], a
	ld a, $30
	ldh [rJOYP], a
	ldh a, [hFFB5]
	xor b
	and b
	ld c, a
	ldh [hFF8B], a
	ldh [hFFB6], a
	ld a, b
	ldh [hFFB5], a
	jr nz, .asm_7e13b
	and $f0
	ret z
	ldh a, [hFF98]
	ld b, a
	ldh a, [hFF84]
	cp b
	jr c, .asm_7e137
	ldh a, [hFF8A]
	and $f0
	ld c, a
	ldh [hFFB6], a
	ld a, $6
	jr .asm_7e142

.asm_7e137
	xor a
	ldh [hFFB6], a
	ret

.asm_7e13b
	ld a, c
	and $f0
	jr z, .asm_7e147
	ld a, $18
.asm_7e142
	ldh [hFF98], a
	xor a
	ldh [hFF84], a
.asm_7e147
	ldh [hFF85], a
	ldh a, [hFF99]
	and $10
	ret z
	ldh a, [hFF8D]
	ld l, a
	ldh a, [hFF8C]
	ld e, a
	ld h, $f
	sub l
	and h
	cp h
	ret z
	ld d, $0
	ld hl, wc3a0
	add hl, de
	ld [hl], c
	ld a, e
	inc a
	and $f
	ldh [hFF8C], a
	ret

Func_7e168:: ; 7e168 (1f:6168)
	push bc
	push de
	ldh a, [hFF99]
	bit 1, a
	call z, Func_7e0ea
	ldh a, [hFFB6]
	ld h, a
	ldh a, [hFF8B]
	ld l, a
	ldh a, [hFF8A]
	pop de
	pop bc
	ret

Func_7e17c:: ; 7e17c (1f:617c)
	push hl
	call Func_7e168
	bit 3, a
	jr z, .asm_7e18c
	bit 2, l
	jr z, .asm_7e18c
	di
	jp Init

.asm_7e18c
	pop hl
	ldh a, [hFF99]
	and $10
	ldh a, [hFFB6]
	ret z
	push de
	push hl
	ldh a, [hFF8D]
	ld e, a
	ldh a, [hFF8C]
	sub e
	jr z, .asm_7e1ac
	ld a, e
	inc a
	and $f
	ldh [hFF8D], a
	ld d, $0
	ld hl, wc3a0
	add hl, de
	ld a, [hl]
	or a
.asm_7e1ac
	pop hl
	pop de
	ret

Func_7e1af:: ; 7e1af (1f:61af)
	push af
	and $f0
	swap a
	or $50
	call WriteRTC
	pop af
	and $f
	or $40
	jr WriteRTC

WriteRTCPredef:: ; 7e1c0 (1f:61c0)
	call ForceUpdateRTCWithClockPaused
WriteRTC:: ; 7e1c3 (1f:61c3)
	push de
	push hl
	push af
	ld hl, HuC3SRamMode
	ld [hl], RTC_STATUS
	ld de, HuC3RTC
.wait1
	ld a, [de]
	bit 0, a
	jr z, .wait1
	ld a, $c
.wait2
	dec a
	jr nz, .wait2
	ld [hl], RTC_WRITE
	pop af
	ld [de], a
	nop
	ld [hl], RTC_STATUS
	ld a, $fe
	ld [de], a
	nop
closeRTC:
	ld [hl], $0
	pop hl
	pop de
	ret

ReadRTCPredef:: ; 7e1e8 (1f:61e8)
	call ForceUpdateRTCWithClockPaused
ReadRTC:: ; 7e1eb (1f:61eb)
	call WriteRTC
	push de
	push hl
	ld hl, HuC3SRamMode
	ld [hl], RTC_STATUS
	ld de, HuC3RTC
.wait1
	ld a, [de]
	bit 0, a
	jr z, .wait1
	ld [hl], RTC_READ
	nop
	ld a, [de]
	and $f
	jr closeRTC

ForceUpdateRTCWithClockPaused:: ; 7e205 (1f:6205)
	push af
	push bc
	push hl
	ld a, [wRTCTicker]
	or $80
	ld [wRTCTicker], a
.loop
	call ForceUpdateRTC
	ld a, [wRTCTicker]
	and $7f
	jr z, .done
	cp $10
	jr c, .loop
.done
	ld [wRTCTicker], a
	pop hl
	pop bc
	pop af
	ret

RTCUpdatePredef:: ; 7e225 (1f:6225)
	ld a, [wRTCTicker]
	rlca
	ret c
ForceUpdateRTC:: ; 7e22a (1f:622a)
	ld hl, wRTCTicker
	ld a, [hl]
	and $7f
	ret z
	cp $10
	ret z
	cp $11
	jr z, .end_of_clock_cycle
	ret nc
	inc [hl]
	dec a
	jr z, .phase_1
	dec a
	jr z, .phase_2
	dec a
	jr z, .phase_3
	dec a
	srl a
	jr nc, .phase_even_4_to_16
	srl a
	push af
	inc a
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	ld hl, HuC3SRamMode
	ld [hl], RTC_STATUS
	nop
	ld a, [HuC3RTC]
	bit 0, a
	jr z, .rtc_not_working
	ld [hl], RTC_READ
	nop
	ld a, [HuC3RTC]
	and $f
	ld [hl], SRAM_READONLY
	pop hl
	ld c, a
	pop af
	jr c, .phase_5_9_13
	; 7, 11, 15
	ld [hl], c
	jr .inc_ticker_again

.phase_5_9_13
	cp $2
	push af
	ld a, c
	swap a
	or [hl]
	ld [hl], a
	pop af
	ret z
.inc_ticker_again
	ld hl, wRTCTicker
	inc [hl]
.phase_even_4_to_16
	ld a, $10
	jr .rtc_request

.end_of_clock_cycle
	jr .quit

.rtc_not_working
	pop bc
.rtc_not_ready
	pop af
	ld [hl], $0
	ld hl, wRTCTicker
	dec [hl]
	ret

.phase_1
	ld a, $60
	jr .rtc_request

.phase_2
	ld a, $50
	jr .rtc_request

.phase_3
	ld a, $40
	jr .rtc_request

.rtc_request
	push af
	ld hl, HuC3SRamMode
	ld [hl], RTC_STATUS
	ld bc, HuC3RTC
	ld a, [bc]
	bit 0, a
	jr z, .rtc_not_ready
	ld a, $c
.wait_12
	dec a
	jr nz, .wait_12
	ld [hl], $b
	pop af
	ld [bc], a
	nop
	ld [hl], RTC_STATUS
	ld a, $fe
	ld [bc], a
	nop
	ld [hl], SRAM_READONLY
	ret

.quit
	xor a
	ld [hli], a
asm_7e2bc:
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and $f
	ld b, a
	push bc
	ld a, [hli]
	swap a
	and $f
	ld c, a
	ld a, [hl]
	swap a
	ld b, a
	and $f0
	or c
	ld c, a
	ld a, b
	and $f
	ld b, a
	push bc
	jr asm_7e2f4

Func_7e2d8:: ; 7e2d8 (1f:62d8)
	call ForceUpdateRTCWithClockPaused
	ld hl, wRTCTicker
	ld a, [hli]
	cp $10
	jr z, asm_7e2bc
	ld a, $60
	call WriteRTC
	xor a
	call Func_7e1af
	call read12bitrtcvalue_7e30a
	push hl
	call read12bitrtcvalue_7e30a
	push hl
asm_7e2f4:
	call GetStartDay
	pop bc
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ret

Func_7e2fd:: ; 7e2fd (1f:62fd)
	call ForceUpdateRTCWithClockPaused
	ld a, $60
	call WriteRTC
	ld a, $3
	call Func_7e1af
read12bitrtcvalue_7e30a:
	ld a, $10
	call ReadRTC
	ld l, a
	ld a, $10
	call ReadRTC
	swap a
	or l
	ld l, a
	ld a, $10
	call ReadRTC
	ld h, a
	ret

Func_7e320:: ; 7e320 (1f:6320)
	push hl
	call Func_7e2fd
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld c, l
	ld b, h
	pop hl
	jr asm_7e332

SetRTCPredef:: ; 7e32f (1f:632f)
	call ForceUpdateRTCWithClockPaused
asm_7e332:
	push hl
	push bc
	call SetStartDay
	xor a
	call Func_7e1af
	ld hl, sp+$2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call .write12bitrtcvalue
	ld hl, sp+$0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call .write12bitrtcvalue
	ld a, $31
	call WriteRTC
	ld a, $61
	call WriteRTC
	pop bc
	pop hl
	ret

.write12bitrtcvalue
	ld a, l
	and $f
	or $30
	call WriteRTC
	ld a, l
	swap a
	and $f
	or $30
	call WriteRTC
	ld a, h
	and $f
	or $30
	call WriteRTC
	ret

Func_7e373:: ; 7e373 (1f:6373)
	push hl
	push de
	push bc
	or a
	jr z, .asm_7e381
	call GetStartDay
	pop bc
	pop de
	add hl, de
	push hl
	push bc
.asm_7e381
	ld hl, sp+$2
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de
	ld hl, $5b5
	call DivideShortPredef
	ld l, e
	ld h, d
	pop de
	ld a, e
	sub l
	ld e, a
	ld a, d
	sbc h
	ld d, a
	ld hl, $16d
	call DivideShortPredef
	reg8rot a, l, e
	reg8rot a, h, d
	ld bc, $784
	add hl, bc
	push hl
	ld hl, Data_7e401 + -1
	ld c, $2
.asm_7e3ac
	inc c
	inc hl
	ld b, e
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr nc, .asm_7e3ac
	inc b
	pop de
	ld a, c
	cp $d
	jr c, .asm_7e3c3
	sub $c
	ld c, a
	inc de
.asm_7e3c3
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	push hl
	ld hl, sp+$2
	ld a, [hli]
	ld d, [hl]
	add $6
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld hl, $7
	call DivideShortPredef
	ld a, l
	pop hl
	ld [hli], a
	push hl
	ld hl, sp+$4
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $2d0
	call DivideShortPredef
	ld a, e
	ld e, l
	ld d, h
	pop hl
	ld [hli], a
	push hl
	ld hl, $3c
	call DivideShortPredef
	ld a, l
	pop hl
	ld [hl], e
	inc hl
	ld [hl], a
	pop de
	pop hl
	ret

Data_7e401:: ; 7e401
	db $1f, $1e, $1f, $1e, $1f, $1f, $1e, $1f, $1e, $1f, $1f, $1c

Func_7e40d:: ; 7e40d (1f:640d)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld hl, -1924
	add hl, de
	cp $3
	jr nc, .asm_7e41c
	dec hl
.asm_7e41c
	push af
	push hl
	ld de, 365
	call MultiplySignedShortPredef
	pop de
	push hl
	ld hl, $4
	call DivideShortPredef
	pop hl
	add hl, de
	ld e, l
	ld d, h
	pop af
	cp $3
	jr nc, .asm_7e437
	add $c
.asm_7e437
	rst $10
	dw Data_7e401 - @
	pop hl
	sub $3
	jr z, .asm_7e44a
	ld b, a
.asm_7e440
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_7e440
.asm_7e44a
	ld a, [hl]
	pop hl
	ret

Func_7e44d:: ; 7e44d (1f:644d)
	call Func_7e40d
	ld a, [hli]
	dec a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	push de
	push hl
	push de
	call GetStartDay
	pop de
	ld a, e
	sub l
	ld c, a
	ld a, d
	sbc h
	ld b, a
	pop hl
	push bc
	inc hl
	ld a, [hli]
	push af
	ld a, [hli]
	push hl
	ld l, a
	ld h, $0
	ld de, $3c
	call MultiplySignedShortPredef
	pop de
	ld a, [de]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	or a
	jr z, .asm_7e483
	ld de, $2d0
	add hl, de
.asm_7e483
	pop bc
	pop de
	ret

Func_7e486:: ; 7e486 (1f:6486)
	call ForceUpdateRTCWithClockPaused
	ld a, c
	call Func_7e1af
.asm_7e48d
	ld a, $10
	call ReadRTC
	ld [hli], a
	dec b
	jr nz, .asm_7e48d
	ret

Func_7e497:: ; 7e497 (1f:6497)
	call ForceUpdateRTCWithClockPaused
	ld a, c
	call Func_7e1af
.asm_7e49e
	ld a, [hli]
	and $f
	or $30
	call WriteRTC
	dec b
	jr nz, .asm_7e49e
	ret

Func_7e4aa:: ; 7e4aa (1f:64aa)
	push bc
	push de
	call Func_7e40d
	ld b, a
	dec hl
	ld a, [hl]
	cp $2
	jr nz, .asm_7e4be
	dec hl
	dec hl
	ld a, [hl]
	and $3
	jr nz, .asm_7e4be
	inc b
.asm_7e4be
	push bc
	ld a, e
	add $6
	ld e, a
	ld a, d
	adc $0
	ld d, a
	ld hl, $7
	call DivideSignedShortPredef_
	pop hl
	ld l, e
	pop de
	pop bc
	ret

Func_7e4d2:: ; 7e4d2 (1f:64d2)
	call ForceUpdateRTCWithClockPaused
.asm_7e4d5
	ld a, $62
	call ReadRTC
	cp $1
	jr nz, .asm_7e4d5
	xor a
	call Func_7e1af
	ld b, $7
	ld c, $f
.asm_7e4e6
	ld a, $10
	call ReadRTC
	and c
	ld c, a
	dec b
	jr nz, .asm_7e4e6
	ld a, c
	cp $f
	ret

Func_7e4f4:: ; 7e4f4 (1f:64f4)
	ld a, [Byte_0013]
	ret

GetStartDay:: ; 7e4f8 (1f:64f8)
	ldh a, [hSRAMBank]
	push af
	ld a, $0
	call Bank1F_GetSRAMBank
	xor a ; SRAM_READONLY
	ld [HuC3SRamMode], a
	ld hl, $a000
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Bank1F_PreviousSRAMBankReadOnly

SetStartDay:: ; 7e50d (1f:650d)
	ldh a, [hSRAMBank]
	push af
	ld a, $0
	call Bank1F_GetSRAMBank
	ld a, SRAM_READWRITE
	ld [HuC3SRamMode], a
	ld hl, $a000
	ld [hl], e
	inc hl
	ld [hl], d
	jp Bank1F_PreviousSRAMBankReadOnly

Func_7e523:: ; 7e523 (1f:6523)
	push af
	push bc
	push hl
	ld l, e
	ld h, d
	pop de
	ld a, e
	and $f
	ld [hli], a
	ld a, e
	swap a
	and $f
	ld [hli], a
	ld a, d
	and $7
	ld [hli], a
	pop de
	ld a, e
	and $f
	ld [hli], a
	ld a, e
	swap a
	and $f
	ld [hli], a
	ld a, d
	and $7
	ld [hli], a
	pop de
	ld a, d
	and $f
	ld [hli], a
	ld a, d
	swap a
	and $f
	ld [hl], a
	ld de, -$5
	add hl, de
	ret

Func_7e556:: ; 7e556 (1f:6556)
	ld bc, $0
	ld a, [de]
	or a
	ret z
	inc de
	ld a, [de]
	dec de
	inc a
	ret z
	push hl
	push hl
	push de
	ld hl, $2
	add hl, de
	lb de, $ff, $0
	lb bc, $ff, $0
.asm_7e56e
	ld a, [hli]
	or a
	jr z, .asm_7e5b3
	cp $78
	jr nc, .asm_7e5b3
	cp d
	jr nc, .asm_7e57a
	ld d, a
.asm_7e57a
	cp e
	jr c, .asm_7e58f
	push hl
	ld l, a
	ld a, e
	or a
	jr z, .asm_7e58d
	ld a, d
	add a
	jr c, .asm_7e58d
	add a
	jr c, .asm_7e58d
	cp l
	jr c, .asm_7e5b2
.asm_7e58d
	ld e, l
	pop hl
.asm_7e58f
	ld a, [hli]
	or a
	jr z, .asm_7e5b3
	cp $78
	jr nc, .asm_7e5b3
	cp b
	jr nc, .asm_7e59b
	ld b, a
.asm_7e59b
	cp c
	jr c, .asm_7e5b0
	push hl
	ld l, a
	ld a, c
	or a
	jr z, .asm_7e5ae
	ld a, b
	add a
	jr c, .asm_7e5ae
	add a
	jr c, .asm_7e5ae
	cp l
	jr c, .asm_7e5b2
.asm_7e5ae
	ld c, l
	pop hl
.asm_7e5b0
	jr .asm_7e56e

.asm_7e5b2
	pop hl
.asm_7e5b3
	ld a, e
	add d
	inc a
	srl a
	ld h, a
	ld a, c
	add b
	inc a
	srl a
	ld l, a
	ld c, l
	ld b, h
	ld a, e
	srl a
	srl a
	add e
	pop hl
	cp [hl]
	ld a, $1
	jr nc, .asm_7e5dd
	ld a, d
	srl a
	srl a
	add d
	cp e
	ld a, $2
	jr nc, .asm_7e5db
	inc a
	ld c, b
	dec hl
.asm_7e5db
	inc hl
	inc hl
.asm_7e5dd
	inc hl
	pop de
	push af
.asm_7e5e0
	push de
	ld de, $800
.asm_7e5e4
	ld a, [hli]
	or a
	jr z, .asm_7e5fa
	ld b, a
	inc a
	jr z, .asm_7e5fa
	ld a, [hli]
	ld a, c
	cp b
	rr e
	dec d
	jr nz, .asm_7e5e4
	ld a, e
	pop de
	ld [de], a
	inc de
	jr .asm_7e5e0

.asm_7e5fa
	pop hl
	ld a, d
	cp $8
	jr z, .asm_7e609
.asm_7e600
	xor a
	rr e
	dec d
	jr nz, .asm_7e600
	ld a, e
	ld [hl], a
	inc hl
.asm_7e609
	pop bc
	pop de
	ld a, l
	sub e
	ld c, a
	or a
	ret

IR_Listen:: ; 7e610 (1f:6610)
	di
	ld a, $10
	ldh [rJOYP], a
	ld a, CART_IR_ON
	ld [HuC3SRamMode], a
	xor a
	ld [HuC3RTC], a
.wait_a000_not_set
	ldh a, [rJOYP]
	bit 1, a
	ret z
	ld a, [HuC3RTC]
	rra
	jr c, .wait_a000_not_set
	ld hl, $100
.wait_a000_set
	ldh a, [rJOYP]
	bit 1, a
	ret z
	inc l
	jr nz, .less_than_256_tries
	ld h, $0
.less_than_256_tries
	ld a, [HuC3RTC]
	rra
	jr nc, .wait_a000_set
	dec h
	jr z, .wait_a000_not_set
	ret

IR_Receive_Predef:: ; 7e640 (1f:6640)
	call IR_Listen
	jr z, .b_button_cancel
	ld hl, HuC3RTC
	push bc
.loop
	xor a
	ld b, a
.loop2
	add b
	jr nc, .no_carry
	sbc a
.no_carry
	ld b, a
	ld c, $0
.loop3
	push bc
	rl b
	pop bc
	inc b
	jr nz, .no_overflow_b
	dec b
.no_overflow_b
	ldh a, [rJOYP]
	rra
	rra
	jr nc, .pop_b_button_cancel
	bit 0, [hl]
	jr nz, .loop3
.loop4
	inc c
	jr z, .next
	bit 0, [hl]
	jr nz, .next2
	ldh a, [rJOYP]
	rra
	bit 0, [hl]
	jr nz, .next2
	rra
	jr nc, .pop_b_button_cancel
	bit 0, [hl]
	jr z, .loop4
.next2
	ld a, c
	cp $b
	jr c, .loop2
	ld a, b
	cp $7
	jr c, .loop
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	dec bc
	ld a, b
	or c
	jr z, .l_2_exit
	push bc
	ld bc, $200
	jr .loop3

.next
	ld a, b
	cp $7
	jr c, .loop
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc de
	pop bc
	ld l, $1
	jr .exit

.pop_b_button_cancel
	pop bc
.b_button_cancel
	ld l, $ff
	jr .exit

.l_2_exit
	ld l, $2
.exit
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld [HuC3RTC], a
	ld [HuC3SRamMode], a
	ld a, $30
	ldh [rJOYP], a
	ld a, l
	ei
	ret

Func_7e6bd:: ; 7e6bd (1f:66bd)
	push de
	ld d, $80
	ld e, a
	push de
	ld de, $1
	push de
	push hl
	push bc
	ld bc, $0
	ld de, $100
	call Func_7e75b
	pop bc
	or a
	jr nz, .asm_7e717
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	res 0, b
	ld a, b
	cp $12
	jr nc, .asm_7e6e4
	or a
	jr nz, .asm_7e6e6
.asm_7e6e4
	ld b, $12
.asm_7e6e6
	pop de
	push de
	push bc
	push de
	call Func_7e71c
	call Func_7e71c
	ld d, h
	ld e, l
	pop hl
	push de
	ld bc, $280
	ld de, $400
	call Func_7e75b
	pop hl
	pop bc
	dec b
	dec b
	jr nz, .asm_7e6e6
	ld bc, $0
	ld de, $400
	call Func_7e75b
	ld hl, sp+$2
	ld bc, $4
	ld de, $200
	call Func_7e75b
.asm_7e717
	pop hl
	pop de
	pop de
	pop de
	ret

Func_7e71c:: ; 7e71c (1f:671c)
	push bc
	push hl
	ld b, $14
.asm_7e720
	call Func_7e74b
	call Func_7e72f
	dec b
	jr nz, .asm_7e720
	pop hl
	pop bc
	ld b, $0
	add hl, bc
	ret

Func_7e72f:: ; 7e72f (1f:672f)
	push hl
	push bc
	xor $80
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $8800
	add hl, bc
	ld b, $10
.asm_7e740
	call Func_7e74b
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7e740
	pop bc
	pop hl
	ret

Func_7e74b:: ; 7e74b (1f:674b)
	ldh a, [rSTAT]
	bit 1, a
	jr nz, Func_7e74b
	ld c, [hl]
	ldh a, [rSTAT]
	bit 1, a
	jr nz, Func_7e74b
	inc hl
	ld a, c
	ret

Func_7e75b:: ; 7e75b (1f:675b)
	ld a, $88
	call Func_7e7a9
	ld a, $33
	call Func_7e7a9
	ld a, e
	push af
	ld a, d
	ld de, $0
	call Func_7e7a1
	pop af
	call Func_7e7a1
	ld a, c
	call Func_7e7a1
	ld a, b
	call Func_7e7a1
.asm_7e77a
	ld a, b
	or c
	jr z, .asm_7e785
	ld a, [hli]
	call Func_7e7a1
	dec bc
	jr .asm_7e77a

.asm_7e785
	ld a, e
	call Func_7e7a9
	ld a, d
	call Func_7e7a9
	xor a
	call Func_7e7a9
	ld h, a
	xor a
	call Func_7e7a9
	ld l, a
	ld bc, $5dc
.asm_7e79a
	dec bc
	ld a, b
	or c
	jr nz, .asm_7e79a
	ld a, l
	ret

Func_7e7a1:: ; 7e7a1 (1f:67a1)
	push af
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	pop af
Func_7e7a9:: ; 7e7a9 (1f:67a9)
	push bc
	push hl
	ld hl, rSC
	ldh [rSB], a
	ld [hl], $1
	ld [hl], $81
	ld bc, $53
.asm_7e7b7
	dec bc
	ld a, b
	and c
	cp $ff
	jr z, .asm_7e7ce
	bit 7, [hl]
	jr nz, .asm_7e7b7
	ldh a, [rSB]
	ld l, a
	ld bc, $1e
.asm_7e7c8
	dec bc
	ld a, b
	or c
	jr nz, .asm_7e7c8
	ld a, l
.asm_7e7ce
	pop hl
	pop bc
	ret

Func_7e7d1:: ; 7e7d1 (1f:67d1)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, wc3ea
	call Func_7ebb4
	ld hl, wc3ee
	call Func_7e9f7
	ld hl, wc3e0
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $e
	ld [hli], a
	ld a, [hl]
	or $e
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $c
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	ld a, [hl]
	or $8
	ld [hli], a
	jp Func_7e9d8

Func_7e81f:: ; 7e81f (1f:681f)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, wc3ea
	call Func_7ebb4
	ld hl, wc3ee
	call Func_7e9f7
	ld hl, wc3e0
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $30
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	ld a, [hl]
	or $10
	ld [hli], a
	jp Func_7e9d8

Func_7e86d:: ; 7e86d (1f:686d)
	push bc
	push hl
	ld hl, wc3e0
	ld de, $f010
	call Func_7ec88
	call Func_7e9e8
	jp Func_7e9d8

Func_7e87e:: ; 7e87e (1f:687e)
	push bc
	push hl
	ld hl, wc3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	jp Func_7e9d8

Func_7e88f:: ; 7e88f (1f:688f)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7e9f7
	ld hl, wc3e2
	ld de, $f010
	call Func_7ebe9
	ld hl, wc3e6
	ld de, $f010
	call Func_7ec88
	ld hl, wc3e6
	ld de, wc3e8
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e8b7:: ; 7e8b7 (1f:68b7)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7e9f7
	ld hl, wc3e2
	ld de, $f808
	call Func_7edc6
	ld hl, wc3e6
	ld de, $f808
	call Func_7eea3
	ld hl, wc3e6
	ld de, wc3e8
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e8df:: ; 7e8df (1f:68df)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7e9f7
	ld hl, wc3e2
	call Func_7eb61
	ld hl, wc3e6
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	jp Func_7e9d8

Func_7e902:: ; 7e902 (1f:6902)
	push bc
	push hl
	ld hl, wc3ee
	call Func_7e9f7
	ld de, $f010
	ld hl, wc3ea
	call Func_7ed05
	ld hl, wc3e0
	ld de, $f010
	call Func_7ec88
	ld hl, wc3e0
	ld de, wc3e2
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e92a:: ; 7e92a (1f:692a)
	push bc
	push hl
	ld hl, wc3ee
	call Func_7e9f7
	ld hl, wc3ea
	ld de, $f808
	call Func_7ef16
	ld hl, wc3e0
	ld de, $f808
	call Func_7eea3
	ld hl, wc3e0
	ld de, wc3e2
	ld b, $8
	call Func_7e9f0
	jp Func_7e9d8

Func_7e952:: ; 7e952 (1f:6952)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	call Func_7ea06
	ld hl, wc3ea
	call Func_7ebb4
	ld hl, wc3ee
	call Func_7e9f7
	jp Func_7e9d8

Func_7e975:: ; 7e975 (1f:6975)
	push bc
	push hl
	ld hl, wc3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	ld hl, wc3e4
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	jp Func_7e9d8

Func_7e9a1:: ; 7e9a1 (1f:69a1)
	push bc
	push hl
	ld hl, wc3e0
	ld de, $f808
	call Func_7eea3
	call Func_7e9e8
	ld hl, wc3e6
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $f8
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $70
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	ld a, [hl]
	or $20
	ld [hli], a
	jp Func_7e9d8

Func_7e9cd:: ; 7e9cd (1f:69cd)
	push bc
	push hl
	ld hl, wc3e0
	call Func_7e9f7
	call Func_7e9e8
Func_7e9d8:: ; 7e9d8 (1f:69d8)
	pop hl
	ld de, wc3e0
	ld bc, $10
	push bc
	push hl
	predef CopyPredef
	pop hl
	pop bc
	add hl, bc
	pop bc
	ret

Func_7e9e8:: ; 7e9e8 (1f:69e8)
	ld hl, wc3e0
	ld de, wc3e2
	ld b, $e
Func_7e9f0:: ; 7e9f0 (1f:69f0)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, Func_7e9f0
	ret

Func_7e9f7:: ; 7e9f7 (1f:69f7)
	xor a
	bit 6, b
	jr z, .asm_7e9fd
	dec a
.asm_7e9fd
	ld [hli], a
	xor a
	bit 7, b
	jr z, .asm_7ea04
	dec a
.asm_7ea04
	ld [hli], a
	ret

Func_7ea06:: ; 7ea06 (1f:6a06)
	xor a
	bit 4, b
	jr z, .asm_7ea0c
	dec a
.asm_7ea0c
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7ea13
	dec a
.asm_7ea13
	ld [hli], a
	ret

Func_7ea15:: ; 7ea15 (1f:6a15)
	ld a, h
	cp d
	jr c, .asm_7ea1b
	ld h, d
	ld d, a
.asm_7ea1b
	ld a, l
	cp e
	jr c, .asm_7ea21
	ld l, e
	ld e, a
.asm_7ea21
	push bc
	ld c, $2
	bit 2, b
	jr nz, .asm_7ea2e
	dec c
	bit 1, b
	jr nz, .asm_7ea2e
	dec c
.asm_7ea2e
	ld a, d
	sub h
	cp $8
	jr c, .asm_7ea6a
	ld a, h
	and $7
	cp c
	jr c, .asm_7ea6a
	ld a, l
	cp c
	jr c, .asm_7ea6a
	ld a, [wc3b9]
	add a
	add a
	add a
	dec a
	ld c, a
	ld a, [wc3ba]
	add a
	add a
	add a
	dec a
	bit 1, b
	jr z, .asm_7ea59
	dec c
	dec a
	bit 2, b
	jr z, .asm_7ea59
	dec c
	dec a
.asm_7ea59
	cp e
	jr c, .asm_7ea6a
	ld a, c
	cp d
	jr c, .asm_7ea6a
	and $7
	inc a
	ld c, a
	ld a, d
	and $7
	cp c
	jr c, .asm_7ea6c
.asm_7ea6a
	pop bc
	ret

.asm_7ea6c
	pop bc
	push de
	push hl
	ld a, e
	inc a
	sub l
	ld e, a
	srl d
	srl d
	srl d
	srl h
	srl h
	srl h
	ld a, d
	inc a
	sub h
	bit 1, b
	jr z, .asm_7ea88
	sub $2
.asm_7ea88
	ld d, a
	call Func_7d99d
	push hl
	push de
	push bc
	bit 1, b
	call nz, Func_7eaca
	pop bc
	pop de
	push de
	push bc
	ld a, d
	or a
	jr z, .asm_7eabd
	call Func_7eb86
	push bc
	ld de, wOAMBuffer
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	ld hl, sp+$5
	ld h, [hl]
	pop af
	ld l, a
.asm_7eaae
	push hl
	push bc
	push de
	ld a, l
	ld hl, sp+$a
	call Func_7eb09
	pop de
	pop bc
	pop hl
	dec h
	jr nz, .asm_7eaae
.asm_7eabd
	pop bc
	push bc
	bit 1, b
	call nz, Func_7eb44
	pop bc
	pop de
	pop hl
	pop hl
	pop de
	ret

Func_7eaca:: ; 7eaca (1f:6aca)
	ld hl, sp+$9
	call Func_7ebd9
	ld hl, wOAMBuffer
	call Func_7ebe9
	push hl
	ld hl, sp+$6
	ld a, [hl]
	pop hl
.asm_7eada
	push af
	call Func_7ec88
	pop af
	dec a
	jr nz, .asm_7eada
	call Func_7ed05
asm_7eae5:
	push bc
	ld de, wOAMBuffer
	ld a, l
	sub e
	ld c, a
	ld a, h
	sbc d
	ld b, a
	pop af
	ld hl, sp+$6
asm_7eaf2:
	push hl
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	call Func_7eb37
asm_7eafb:
	predef CopyPredef
	pop hl
	ld a, [wc3be]
	add [hl]
	ld [hli], a
	ld a, [wc3be + 1]
	adc [hl]
	ld [hl], a
	ret

Func_7eb09:: ; 7eb09 (1f:6b09)
	bit 0, a
	jr nz, asm_7eaf2
	push hl
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push hl
	call Func_7eb37
	pop bc
	push bc
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	push bc
	push de
	predef CopyPredef
	pop hl
	pop bc
	add hl, bc
	pop de
	ld a, e
	add [hl]
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld d, a
	inc hl
	reg8rot a, d, h
	reg8rot a, e, l
	jr asm_7eafb

Func_7eb37:: ; 7eb37 (1f:6b37)
	bit 1, a
	jr z, .asm_7eb3d
	dec hl
	dec hl
.asm_7eb3d
	bit 2, a
	jr z, .asm_7eb43
	dec hl
	dec hl
.asm_7eb43
	ret

Func_7eb44:: ; 7eb44 (1f:6b44)
	ld hl, sp+$b
	call Func_7ebd9
	ld hl, wOAMBuffer
	call Func_7edc6
	push hl
	ld hl, sp+$6
	ld a, [hl]
	pop hl
.asm_7eb54
	push af
	call Func_7eea3
	pop af
	dec a
	jr nz, .asm_7eb54
	call Func_7ef16
	jr asm_7eae5

Func_7eb61:: ; 7eb61 (1f:6b61)
	bit 2, b
	jr z, .asm_7eb73
	xor a
	bit 2, c
	jr z, .asm_7eb6b
	dec a
.asm_7eb6b
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7eb72
	dec a
.asm_7eb72
	ld [hli], a
.asm_7eb73
	bit 1, b
	jr z, .asm_7eb85
	xor a
	bit 0, c
	jr z, .asm_7eb7d
	dec a
.asm_7eb7d
	ld [hli], a
	xor a
	bit 1, c
	jr z, .asm_7eb84
	dec a
.asm_7eb84
	ld [hli], a
.asm_7eb85
	ret

Func_7eb86:: ; 7eb86 (1f:6b86)
	ld hl, wOAMBuffer
	call Func_7eb61
	bit 0, b
	jr z, .asm_7ebaa
	ld d, b
	push bc
	ld c, $0
	bit 4, d
	jr z, .asm_7eb99
	dec c
.asm_7eb99
	ld b, $0
	bit 5, d
	jr z, .asm_7eba0
	dec b
.asm_7eba0
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	dec e
	jr nz, .asm_7eba0
	pop bc
	jr Func_7ebb4

.asm_7ebaa
	ld d, $0
	sla e
	rl d
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
Func_7ebb4:: ; 7ebb4 (1f:6bb4)
	bit 1, b
	jr z, .asm_7ebc6
	xor a
	bit 4, c
	jr z, .asm_7ebbe
	dec a
.asm_7ebbe
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ebc5
	dec a
.asm_7ebc5
	ld [hli], a
.asm_7ebc6
	bit 2, b
	jr z, .asm_7ebd8
	xor a
	bit 6, c
	jr z, .asm_7ebd0
	dec a
.asm_7ebd0
	ld [hli], a
	xor a
	bit 7, c
	jr z, .asm_7ebd7
	dec a
.asm_7ebd7
	ld [hli], a
.asm_7ebd8
	ret

Func_7ebd9:: ; 7ebd9 (1f:6bd9)
	ld a, [hl]
	ld de, $8080
	and $7
	ret z
.asm_7ebe0
	scf
	rr d
	srl e
	dec a
	jr nz, .asm_7ebe0
	ret

Func_7ebe9:: ; 7ebe9 (1f:6be9)
	bit 2, b
	jr z, .asm_7ec25
	xor a
	bit 2, c
	jr z, .asm_7ebfa
	ld a, d
	sla a
	sla a
	sla a
	cpl
.asm_7ebfa
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ec07
	ld a, d
	sla a
	sla a
	sla a
.asm_7ec07
	or [hl]
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7ec16
	ld a, d
	sla a
	sla a
	sla a
	cpl
.asm_7ec16
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ec23
	ld a, d
	sla a
	sla a
	sla a
.asm_7ec23
	or [hl]
	ld [hli], a
.asm_7ec25
	bit 1, b
	jr z, .asm_7ec87
	ld a, $ff
	bit 0, c
	jr z, .asm_7ec34
	ld a, d
	sla a
	sla a
.asm_7ec34
	cpl
	ld [hl], a
	bit 2, b
	jr z, .asm_7ec44
	xor a
	bit 2, c
	jr z, .asm_7ec44
	ld a, e
	sla a
	sla a
.asm_7ec44
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ec56
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ec56
	sla a
.asm_7ec56
	or [hl]
	ld [hli], a
	ld a, $ff
	bit 1, c
	jr z, .asm_7ec63
	ld a, d
	sla a
	sla a
.asm_7ec63
	cpl
	ld [hl], a
	bit 2, b
	jr z, .asm_7ec73
	xor a
	bit 3, c
	jr z, .asm_7ec73
	ld a, e
	sla a
	sla a
.asm_7ec73
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ec85
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ec85
	sla a
.asm_7ec85
	or [hl]
	ld [hli], a
.asm_7ec87
	ret

Func_7ec88:: ; 7ec88 (1f:6c88)
	xor a
	bit 4, b
	jr z, .asm_7ec91
	ld a, d
	sla a
	cpl
.asm_7ec91
	ld [hl], a
	ld a, d
	sla a
	bit 1, b
	jr z, .asm_7ecbf
	xor a
	bit 0, c
	jr z, .asm_7eca1
	ld a, e
	sla a
.asm_7eca1
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ecbf
	xor a
	bit 2, c
	jr z, .asm_7ecb6
	ld a, e
	sla a
	sla a
.asm_7ecb6
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	sla a
.asm_7ecbf
	bit 6, b
	jr nz, .asm_7ecc4
	xor a
.asm_7ecc4
	or [hl]
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7eccf
	ld a, d
	sla a
	cpl
.asm_7eccf
	ld [hl], a
	ld a, d
	srl a
	bit 1, b
	jr z, .asm_7ecfd
	xor a
	bit 1, c
	jr z, .asm_7ecdf
	ld a, e
	sla a
.asm_7ecdf
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ecfd
	xor a
	bit 3, c
	jr z, .asm_7ecf4
	ld a, e
	sla a
	sla a
.asm_7ecf4
	or [hl]
	ld [hl], a
	ld a, d
	sla a
	sla a
	sla a
.asm_7ecfd
	bit 7, b
	jr nz, .asm_7ed02
	xor a
.asm_7ed02
	or [hl]
	ld [hli], a
	ret

Func_7ed05:: ; 7ed05 (1f:6d05)
	bit 1, b
	jr z, .asm_7ed65
	xor a
	bit 4, c
	jr z, .asm_7ed14
	ld a, d
	sla a
	sla a
	cpl
.asm_7ed14
	ld [hl], a
	bit 2, b
	jr z, .asm_7ed25
	xor a
	bit 2, c
	jr z, .asm_7ed23
	ld a, e
	sla a
	sla a
.asm_7ed23
	or [hl]
	ld [hl], a
.asm_7ed25
	xor a
	bit 6, b
	jr z, .asm_7ed35
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ed35
	sla a
.asm_7ed35
	or [hl]
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ed42
	ld a, d
	sla a
	sla a
	cpl
.asm_7ed42
	ld [hl], a
	bit 2, b
	jr z, .asm_7ed53
	xor a
	bit 3, c
	jr z, .asm_7ed51
	ld a, e
	sla a
	sla a
.asm_7ed51
	or [hl]
	ld [hl], a
.asm_7ed53
	xor a
	bit 7, b
	jr z, .asm_7ed63
	ld a, d
	sla a
	sla a
	bit 2, b
	jr z, .asm_7ed63
	sla a
.asm_7ed63
	or [hl]
	ld [hli], a
.asm_7ed65
	bit 2, b
	jr z, .asm_7edc5
	ld a, $ff
	bit 6, c
	jr z, .asm_7ed72
	ld a, d
	sla a
.asm_7ed72
	cpl
	ld [hl], a
	xor a
	bit 3, b
	jr z, .asm_7ed7d
	bit 6, c
	jr .asm_7ed7f

.asm_7ed7d
	bit 6, b
.asm_7ed7f
	jr z, .asm_7ed87
	ld a, e
	sla a
	or e
	sla a
.asm_7ed87
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ed95
	ld a, d
	sla a
	sla a
	sla a
.asm_7ed95
	or [hl]
	ld [hli], a
	ld a, $ff
	bit 7, c
	jr z, .asm_7eda0
	ld a, d
	sla a
.asm_7eda0
	cpl
	ld [hl], a
	xor a
	bit 3, b
	jr z, .asm_7edab
	bit 7, c
	jr .asm_7edad

.asm_7edab
	bit 7, b
.asm_7edad
	jr z, .asm_7edb5
	ld a, e
	sla a
	or e
	sla a
.asm_7edb5
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7edc3
	ld a, d
	sla a
	sla a
	sla a
.asm_7edc3
	or [hl]
	ld [hli], a
.asm_7edc5
	ret

Func_7edc6:: ; 7edc6 (1f:6dc6)
	bit 2, b
	jr z, .asm_7ee24
	xor a
	bit 2, c
	jr z, .asm_7edd3
	ld a, d
	scf
	rr a
.asm_7edd3
	ld [hl], a
	xor a
	bit 3, b
	jr nz, .asm_7eddd
	bit 6, b
	jr .asm_7eddf

.asm_7eddd
	bit 6, c
.asm_7eddf
	jr z, .asm_7ede6
	ld a, e
	srl a
	srl a
.asm_7ede6
	or [hl]
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7edf5
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7edf5
	or [hl]
	ld [hli], a
	xor a
	bit 3, c
	jr z, .asm_7ee00
	ld a, d
	scf
	rr a
.asm_7ee00
	ld [hl], a
	xor a
	bit 3, b
	jr nz, .asm_7ee0a
	bit 7, b
	jr .asm_7ee0c

.asm_7ee0a
	bit 7, c
.asm_7ee0c
	jr z, .asm_7ee13
	ld a, e
	srl a
	srl a
.asm_7ee13
	or [hl]
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7ee22
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7ee22
	or [hl]
	ld [hli], a
.asm_7ee24
	bit 1, b
	jr z, .asm_7eea2
	xor a
	bit 0, c
	jr z, .asm_7ee2e
	ld a, d
.asm_7ee2e
	ld [hl], a
	xor a
	bit 4, c
	jr z, .asm_7ee37
	ld a, e
	srl a
.asm_7ee37
	or [hl]
	ld [hl], a
	bit 2, b
	jr z, .asm_7ee4f
	xor a
	bit 3, b
	jr nz, .asm_7ee46
	bit 6, b
	jr .asm_7ee48

.asm_7ee46
	bit 6, c
.asm_7ee48
	jr z, .asm_7ee4f
	ld a, e
	srl a
	srl a
.asm_7ee4f
	or [hl]
	ld [hl], a
	ld a, $ff
	bit 6, b
	jr z, .asm_7ee62
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ee62
	scf
	rr a
.asm_7ee62
	cpl
	or [hl]
	ld [hli], a
	xor a
	bit 1, c
	jr z, .asm_7ee6b
	ld a, d
.asm_7ee6b
	ld [hl], a
	xor a
	bit 5, c
	jr z, .asm_7ee74
	ld a, e
	srl a
.asm_7ee74
	or [hl]
	ld [hl], a
	bit 2, b
	jr z, .asm_7ee8c
	xor a
	bit 3, b
	jr nz, .asm_7ee83
	bit 7, b
	jr .asm_7ee85

.asm_7ee83
	bit 7, c
.asm_7ee85
	jr z, .asm_7ee8c
	ld a, e
	srl a
	srl a
.asm_7ee8c
	or [hl]
	ld [hl], a
	ld a, $ff
	bit 7, b
	jr z, .asm_7ee9f
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ee9f
	scf
	rr a
.asm_7ee9f
	cpl
	or [hl]
	ld [hli], a
.asm_7eea2
	ret

Func_7eea3:: ; 7eea3 (1f:6ea3)
	xor a
	bit 4, b
	jr z, .asm_7eea9
	ld a, d
.asm_7eea9
	ld [hl], a
	ld a, d
	bit 1, b
	jr z, .asm_7eed4
	xor a
	bit 4, c
	jr z, .asm_7eeb7
	ld a, e
	srl a
.asm_7eeb7
	or [hl]
	ld [hl], a
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7eed4
	xor a
	bit 6, c
	jr z, .asm_7eecb
	ld a, e
	srl a
	srl a
.asm_7eecb
	or [hl]
	ld [hl], a
	ld a, d
	srl a
	srl a
	or $c0
.asm_7eed4
	cpl
	bit 6, b
	jr nz, .asm_7eeda
	xor a
.asm_7eeda
	or [hl]
	ld [hli], a
	xor a
	bit 5, b
	jr z, .asm_7eee2
	ld a, d
.asm_7eee2
	ld [hl], a
	ld a, d
	bit 1, b
	jr z, .asm_7ef0d
	xor a
	bit 5, c
	jr z, .asm_7eef0
	ld a, e
	srl a
.asm_7eef0
	or [hl]
	ld [hl], a
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef0d
	xor a
	bit 7, c
	jr z, .asm_7ef04
	ld a, e
	srl a
	srl a
.asm_7ef04
	or [hl]
	ld [hl], a
	ld a, d
	srl a
	srl a
	or $c0
.asm_7ef0d
	cpl
	bit 7, b
	jr nz, .asm_7ef13
	xor a
.asm_7ef13
	or [hl]
	ld [hli], a
	ret

Func_7ef16:: ; 7ef16 (1f:6f16)
	bit 1, b
	jr z, .asm_7ef78
	xor a
	bit 4, c
	jr z, .asm_7ef23
	ld a, d
	scf
	rr a
.asm_7ef23
	ld [hl], a
	xor a
	bit 2, b
	jr z, .asm_7ef35
	xor a
	bit 6, c
	jr z, .asm_7ef33
	ld a, e
	srl a
	srl a
.asm_7ef33
	or [hl]
	ld [hl], a
.asm_7ef35
	ld a, $ff
	bit 6, b
	jr z, .asm_7ef46
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef46
	scf
	rr a
.asm_7ef46
	cpl
	or [hl]
	ld [hli], a
	xor a
	bit 5, c
	jr z, .asm_7ef52
	ld a, d
	scf
	rr a
.asm_7ef52
	ld [hl], a
	xor a
	bit 2, b
	jr z, .asm_7ef64
	xor a
	bit 7, c
	jr z, .asm_7ef62
	ld a, e
	srl a
	srl a
.asm_7ef62
	or [hl]
	ld [hl], a
.asm_7ef64
	ld a, $ff
	bit 7, b
	jr z, .asm_7ef75
	ld a, d
	scf
	rr a
	bit 2, b
	jr z, .asm_7ef75
	scf
	rr a
.asm_7ef75
	cpl
	or [hl]
	ld [hli], a
.asm_7ef78
	bit 2, b
	jr z, .asm_7efb4
	xor a
	bit 6, c
	jr z, .asm_7ef88
	ld a, d
	srl a
	srl a
	or $c0
.asm_7ef88
	ld [hl], a
	xor a
	bit 6, b
	jr z, .asm_7ef96
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7ef96
	or [hl]
	ld [hli], a
	xor a
	bit 7, c
	jr z, .asm_7efa4
	ld a, d
	srl a
	srl a
	or $c0
.asm_7efa4
	ld [hl], a
	xor a
	bit 7, b
	jr z, .asm_7efb2
	ld a, d
	srl a
	srl a
	or $c0
	cpl
.asm_7efb2
	or [hl]
	ld [hli], a
.asm_7efb4
	ret

Data_7efb5::
	INCBIN "gfx/font/7efb5.1bpp" ; 7efb5
 
Data_7f7b5:: ; 7f7b5
	db $5e, $5e, $43, $43, $98, $98, $ad, $a5, $bd, $a5, $99, $99, $43, $42, $5e, $5c, $7a, $7a, $c2, $c2, $19, $19, $ad, $a5, $bd, $a5, $99, $99, $c2, $42, $7a, $3a, $58, $50, $58, $50, $58, $50, $58, $50, $58, $50, $58, $50, $58, $50, $58, $50, $1a, $0a, $1a, $0a, $1a, $0a, $1a, $0a, $1a, $0a, $1a, $0a, $1a, $0a, $1a, $0a, $0e, $0e, $0b, $0b, $38, $38, $2d, $25, $fd, $e5, $99, $99, $c3, $c2, $5e, $5c, $70, $70, $d0, $d0, $1c, $1c, $ac, $a4, $bf, $a7, $99, $99, $c3, $43, $7a, $3a, $00, $00, $ff, $ff, $00, $00, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $5e, $5c, $c3, $c2, $99, $99, $ed, $e5, $3d, $25, $38, $38, $0b, $0b, $0e, $0e, $7a, $3a, $c3, $43, $99, $99, $af, $a7, $bc, $a4, $1c, $1c, $d0, $d0, $70, $70

Data_7f845:: ; 7f845
	db $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $ff, $00, $00, $ff, $ff, $00, $00, $5e, $5c, $c3, $c2, $99, $99, $ad, $a5, $bd, $a5, $18, $18, $c3, $c3, $3e, $3e, $3e, $3e, $c3, $c3, $18, $18, $ad, $a5, $bd, $a5, $99, $99, $c3, $c2, $5e, $5c

Data_7f875:: ; 7f875
	db $01, $81, $40, $41, $42, $43, $44, $45, $ff, $00, $ff, $00, $80, $00, $80, $00, $80, $00, $81, $01, $81, $01, $87, $07, $85, $04, $be, $3e, $b2, $22, $a1, $29, $91, $15, $90, $12, $88, $09, $88, $08, $84, $04, $84, $04, $82, $02, $83, $03, $80, $00, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $81, $be, $80, $80, $c0, $5f, $40, $40, $60, $2f, $a0, $a0, $b0, $97, $d0, $50, $58, $4b, $28, $28, $2c, $24, $f7, $f7, $10, $10, $1f, $0f, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $f8, $f8, $04, $04, $04, $04, $02, $02, $02, $03, $08, $f2, $01, $04, $12, $e9, $05, $13, $2a, $d6, $1c, $2c, $78, $b0, $00, $00, $00, $00, $ff, $ff, $00, $00, $ff, $ff, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $0a, $31, $12, $49, $2a, $99, $52, $31, $a2, $61, $42, $c1, $82, $81, $82, $81, $42, $41, $42, $41, $22, $21, $22, $21, $12, $11, $f2, $f1, $42, $41, $c2, $c1, $02, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $9f, $0f, $90, $18, $98, $16, $8c, $09, $8c, $08, $86, $04, $86, $04, $83, $02, $83, $02, $81, $01, $81, $01, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $80, $00, $60, $03, $1b, $03, $07, $00, $01, $00, $00, $80, $00, $ff, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $fe, $fe, $01, $03, $01, $05, $00, $08, $00, $10, $80, $a0, $80, $c0, $00, $80, $00, $00, $00, $00, $ff, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $82, $81, $82, $81, $42, $41, $42, $41, $22, $21, $22, $21, $12, $11, $f2, $11, $e2, $e1, $02, $01, $02, $01, $02, $01, $02, $01, $fe, $01, $00, $ff, $ff, $00, $85, $03, $b6, $0e, $bd, $03, $be, $03, $bb, $04, $bf, $00, $bf, $00, $b7, $0e, $a5, $13, $b7, $0e, $bf, $00, $bf, $00, $bf, $00, $bd, $03, $b9, $04, $bd, $03, $bf, $00, $bf, $00, $bf, $00, $bf, $00, $bf, $00, $ff, $00, $00, $ff, $ff, $00, $10, $60, $37, $38, $5f, $60, $bf, $e0, $ef, $90, $7f, $80, $ff, $00, $ff, $07, $b9, $58, $e0, $20, $ff, $20, $f8, $1f, $ff, $07, $ff, $80, $6f, $d0, $fb, $84, $df, $24, $f5, $1f, $ea, $1b, $b1, $71, $ea, $1b, $ff, $00, $00, $ff, $ff, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $72, $ad, $9c, $45, $3c, $f8, $ff, $07, $00, $83, $7c, $8a, $87, $8b, $87, $cb, $46, $ff, $3f, $ee, $22, $7f, $9f, $ff, $00, $ff, $00, $bf, $c0, $ff, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $fa, $01, $fa, $01, $fa, $01, $fa, $01, $fa, $81, $fa, $81, $ca, $f1, $aa, $d9, $d6, $cd, $ba, $c9, $ca, $f1, $fa, $81, $fa, $01, $fa, $01, $fa, $81, $fa, $01, $fa, $01, $fa, $01, $fa, $01, $fa, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $8f, $0f, $92, $10, $90, $10, $94, $10, $8f, $0f, $9f, $10, $9f, $10, $9f, $10, $9f, $10, $9f, $11, $9f, $11, $9f, $11, $8f, $0f, $9a, $10, $9a, $10, $9a, $10, $8f, $0f, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $fe, $fe, $11, $01, $85, $01, $21, $01, $ff, $ff, $fb, $11, $fb, $11, $fb, $11, $fb, $f1, $ab, $01, $ab, $01, $ab, $01, $af, $0f, $bf, $10, $bf, $10, $bf, $10, $ef, $ef, $00, $00, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $ef, $ef, $1a, $10, $1a, $10, $1a, $10, $1f, $1f, $01, $01, $01, $01, $01, $01, $f1, $f1, $f0, $10, $f0, $10, $f0, $10, $ff, $1f, $ff, $01, $ff, $01, $ff, $01, $fe, $fe, $00, $00, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $e2, $e1, $b2, $11, $b2, $11, $b2, $11, $b2, $11, $b2, $11, $b2, $11, $b2, $11, $e2, $e1, $12, $11, $12, $11, $12, $11, $12, $11, $12, $11, $12, $11, $12, $11, $e2, $e1, $02, $01, $02, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $81, $01, $81, $01, $81, $01, $81, $01, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $83, $03, $84, $04, $85, $05, $83, $03, $80, $00, $81, $01, $82, $02, $85, $04, $8a, $09, $8d, $0b, $86, $06, $ff, $00, $00, $ff, $ff, $00, $00, $00, $e0, $e0, $10, $10, $48, $08, $04, $24, $82, $92, $41, $49, $20, $24, $10, $12, $08, $09, $1c, $14, $aa, $a6, $5f, $49, $76, $52, $bc, $a4, $78, $58, $a4, $64, $5a, $da, $92, $92, $0c, $0c, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $0f, $0f, $11, $11, $25, $21, $41, $49, $82, $92, $84, $24, $88, $c8, $70, $50, $20, $20, $11, $91, $0a, $4a, $25, $25, $95, $95, $4a, $4a, $3d, $35, $4a, $4c, $b5, $b6, $92, $93, $61, $61, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $82, $81, $42, $41, $42, $41, $82, $81, $02, $01, $02, $01, $82, $81, $42, $41, $a2, $21, $62, $a1, $c2, $c1, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $81, $01, $82, $02, $86, $02, $85, $05, $8d, $05, $9e, $0a, $92, $16, $91, $17, $8b, $09, $85, $04, $82, $02, $81, $01, $80, $00, $80, $00, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $1f, $1f, $f4, $74, $be, $9e, $74, $54, $d0, $f0, $70, $50, $31, $11, $b3, $93, $b1, $91, $72, $52, $76, $52, $b7, $b1, $b3, $b0, $d1, $50, $df, $cf, $74, $78, $08, $30, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $f0, $f0, $0b, $0b, $0c, $0c, $0a, $0a, $13, $13, $a0, $a0, $cc, $cc, $8c, $8c, $0f, $0f, $0f, $0f, $00, $00, $00, $00, $99, $99, $ca, $4a, $e4, $e4, $38, $18, $00, $00, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $82, $81, $42, $41, $22, $21, $12, $11, $0a, $09, $0a, $09, $12, $11, $22, $21, $42, $41, $82, $81, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $80, $00, $8f, $1f, $8c, $08, $84, $04, $9c, $18, $90, $10, $88, $08, $98, $11, $90, $10, $98, $10, $89, $08, $90, $10, $91, $11, $88, $0c, $98, $08, $97, $11, $9f, $1e, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $f8, $f0, $0f, $0f, $00, $00, $00, $18, $00, $3f, $10, $ff, $00, $fc, $00, $39, $00, $9f, $00, $bf, $84, $be, $c0, $df, $00, $87, $00, $00, $fc, $f8, $ff, $07, $1f, $00, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $01, $01, $03, $02, $06, $04, $e4, $c4, $3c, $3c, $04, $04, $04, $04, $05, $dc, $05, $fc, $29, $f8, $09, $f8, $29, $18, $9b, $70, $14, $f3, $1f, $17, $0d, $19, $17, $0f, $ff, $c0, $ff, $3f, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $e2, $c1, $72, $21, $72, $11, $52, $31, $d2, $31, $d2, $31, $92, $71, $b2, $61, $a2, $61, $a2, $61, $a2, $61, $a2, $61, $a2, $61, $a2, $61, $a2, $e1, $62, $e1, $a2, $61, $42, $c1, $82, $81, $02, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $86, $0f, $8b, $09, $89, $0f, $8f, $09, $89, $0f, $8e, $0b, $8c, $0e, $88, $0d, $90, $1b, $a2, $35, $bc, $38, $8c, $08, $8c, $08, $8c, $08, $8c, $08, $bc, $08, $af, $1f, $b0, $0f, $bf, $00, $bf, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $18, $18, $24, $3c, $42, $66, $81, $db, $18, $a5, $24, $42, $00, $a5, $41, $24, $82, $24, $00, $e7, $00, $00, $3c, $18, $7e, $24, $66, $42, $7e, $62, $7e, $42, $ff, $ff, $24, $c3, $c3, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $82, $81, $43, $c7, $21, $60, $12, $b1, $0d, $db, $47, $af, $3d, $1c, $32, $11, $35, $13, $3b, $17, $30, $10, $3f, $10, $f4, $fb, $0e, $f1, $ff, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $42, $41, $e2, $41, $52, $e1, $ea, $f1, $fa, $f9, $52, $e1, $ea, $f1, $f2, $f9, $fa, $f9, $f2, $e1, $ea, $f1, $f2, $f9, $fa, $f9, $e2, $41, $fa, $41, $ea, $f1, $1a, $e1, $fa, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $ff, $00, $00, $ff, $ff, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $fe, $01, $00, $ff, $ff, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $82, $02, $85, $05, $8d, $09, $89, $09, $90, $18, $98, $10, $98, $10, $9c, $10, $8e, $08, $8b, $0c, $84, $07, $bf, $03, $9e, $01, $80, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $0c, $09, $11, $10, $18, $18, $29, $28, $23, $21, $c3, $c6, $41, $41, $40, $40, $75, $70, $19, $10, $1f, $10, $9f, $1c, $f3, $0f, $07, $fc, $ff, $f8, $00, $00, $ff, $00, $00, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $c0, $c0, $60, $20, $10, $10, $30, $30, $29, $29, $89, $09, $87, $c7, $04, $04, $04, $04, $5c, $1c, $30, $10, $f0, $10, $f3, $70, $9e, $e1, $c1, $7f, $ff, $3e, $00, $00, $ff, $00, $00, $ff, $fe, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $82, $81, $42, $41, $62, $21, $22, $21, $32, $11, $32, $11, $32, $11, $72, $11, $e2, $21, $a2, $61, $42, $c1, $fa, $81, $f2, $01, $02, $01, $fe, $01, $00, $ff, $00

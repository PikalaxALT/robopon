Func_0500:: ; 0500
	ld sp, wStackTop
	di
	predef InitCartIRMode
	ld a, $7
	Coorda 16, 3, wAttrMap
	ld a, $ff
	Coorda 17, 3, wAttrMap
	ld a, $20
	predef Func_7d753
	ld hl, $400
	predef Func_7d85d
Func_0519:: ; 519 (0:0519)
	call Func_07a2
	ld de, $204
	predef Func_7bdec
	ld c, $80
	ld de, $59c
	aCoord 16, 3, wAttrMap
	ld b, a
	aCoord 17, 3, wAttrMap
.asm_052d
	push bc
	push hl
	push af
	ld a, c
	ld c, l
	ld b, h
	ld l, e
	ld h, d
	ld d, a
	ld e, $7
	pop af
	rrca
	push af
	call Func_058a
	pop af
	ld e, l
	ld d, h
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	inc c
	dec b
	jr nz, .asm_052d
	ld hl, Data_065e
	call Func_083b
	ld a, $1
	predef Func_7d78e
	ld c, $0
.loop
	aCoord 16, 3, wAttrMap
	ld b, a
	ld hl, $104
	ld d, $20
	ld e, $3e
	predef Func_7b7a9
	jr c, .default
	ld c, a
	inc a
	call BitIndexToMask
	ld h, a
	aCoord 17, 3, wAttrMap
	and h
	jr z, .loop
	ld l, c
	ld h, $0
	predef AnonJumpRelativeTable
	db 8
	; 578
	dw Func_068f - @
	dw Func_076f - @
	dw Func_0777 - @
	dw Func_077f - @
	dw Func_0787 - @
	dw Func_078f - @
	dw Func_0797 - @
	dw .default - @

.default
	predef Func_0150
Func_058a:: ; 058a
	jr nc, .wait
	predef Func_7bd5b
	ret

.wait
	ld a, [hli]
	or a
	jr nz, .wait
	ld a, $d
	predef Func_7d9f9
	ld a, $1
	predef Func_7d9f9
	ret

Data_059c:: ; 059c
	db " PASSWORD INPUT", $e, $d, $1, $0
	db " キャラハﾞンハﾞーシﾞョン 5ケﾞーム", $d, $1, $0
	db " キスモン&ハﾞケ", $f, "ちゅ", $e, "リレー", $f, "ほか4", $e, $d, $1, $0
	db " 15ハﾟスﾞル&キャノン", $f, " ほか4こ", $e, $d, $1, $0
	db " ハﾞイナリーラントﾞ", $f, "&BJほか2こ", $e, $d, $1, $0
	db " ミニケﾞーム", $f, "かﾞそﾞういれかえ", $e, "テﾞータ", $d, $1, $0
	db " GB KISS TOOLS", $d, $1, $0

Data_0636:
	db "KISSMON CANNON  BINARY  GAMEDATAKISSTOOL"

Data_065e:: ; 065e
	db "  メニュー", $f, "を せんたくして", $e, $0
	dstr " "
	db $f, "START/Aを おしてくたﾞさい", $e, $0
	db $0

Data_0686:: ; 0686
	dstr "--------"

Func_068f:: ; 68f (0:068f)
	call Func_07a2
	ld a, $20
	ld de, $204
	ld bc, $1004
	ld hl, $0
	predef Func_7be3e
	ld a, $f0
	ld de, $208
	ld bc, $1003
	ld hl, $301
	predef Func_7be3e
	ld hl, $204
	predef Func_7d905
	ld hl, Data_059c
	predef Func_7af96
	ld hl, $607
	predef Func_7d905
	ld hl, Data_0686
	predef Func_7af96
	ld hl, Data_0743
	bcbgcoord 2, 8
	call Func_083e
	ld a, $3
	ldh [hFFAE], a
	ld de, $900d
	ld hl, $0
	predef Func_7b85e
	ld a, $80
	ld de, $606
	ld bc, $801
	ld hl, $100
	predef Func_7be3e
	ld a, $3
	predef Func_7d78e
	hlcoord 18, 3, wAttrMap
	ld e, $20
	ld bc, $8
	predef Func_7d5e7
	ld de, $8001
	ld b, $8
	hlcoord 18, 3, wAttrMap
	ld c, $0
	predef Func_7b93a
	jp c, Func_0519
	ld hl, Data_0636
	ld bc, $502
.asm_0705
	push bc
	push hl
	decoord 18, 3, wAttrMap
	ld bc, $8
	push bc
	predef Func_7af75
	pop bc
	ld a, h
	or l
	pop hl
	add hl, bc
	pop bc
	inc c
	or a
	jr z, .asm_0720
	dec b
	jr nz, .asm_0705
	jp Func_0519

.asm_0720
	aCoord 16, 3, wAttrMap
	cp c
	ld a, c
	jp nc, Func_072b
	Coorda 16, 3, wAttrMap
Func_072b:: ; 72b (0:072b)
	call BitIndexToMask
	ld d, a
	aCoord 17, 3, wAttrMap
	or d
	Coorda 17, 3, wAttrMap
	jp Func_0519

BitIndexToMask:: ; 739 (0:0739)
	push bc
	ld c, a
	ld a, $80
.loop
	rlca
	dec c
	jr nz, .loop
	pop bc
	ret

Data_0743:: ; 0743
	dstr " "
	db "はﾟすわーとﾞ", $f, "を にゅうりょくして ", $e, $0
	db $f, "STARTを おしてくたﾞさい  ", $e, $0
	db $0

Func_076f:: ; 076f
	ld de, $4000
	ld a, $7
	call Func_0856
Func_0777:: ; 0777
	ld de, $4000
	ld a, $9
	call Func_0856
Func_077f:: ; 077f
	ld de, $4000
	ld a, $b
	call Func_0856
Func_0787:: ; 0787
	ld de, $4000
	ld a, $d
	call Func_0856
Func_078f:: ; 078f
	ld de, $4000
	ld a, $e
	call Func_0856
Func_0797:: ; 0797
	ld de, $4000
	ld a, $f
	call Func_0856
	jp Func_0519

Func_07a2:: ; 7a2 (0:07a2)
	predef Func_7d8d7
	ld a, $c
	predef Func_7d9f9
	ld hl, $8800
	ld e, $0
	ld bc, $a00
	predef Func_7d5e7
	ld de, $3
	ld bc, $1409
	predef Func_7bdfe
	ld a, $80
	ld de, $204
	ld bc, $1007
	ld hl, $701
	predef Func_7be3e
	ld de, $d
	ld bc, $1405
	predef Func_7bdfe
	ld a, $f0
	ld de, $20e
	ld bc, $1003
	ld hl, $301
	predef Func_7be3e
	ld hl, $101
	predef Func_7d905
	ld hl, Data_07e7
	predef Func_7af96
	ret

Data_07e7:: ; 07e7
	dstr "GB KISS  MINI GAME"

Data_07fa:: ; 07fa
	db $f, "していの", $e, "テﾞータ", $f, "を てんそうします", $e, $0
	db $f, "  AてﾞGBKISSてんそう  ", $e, $0
	db $f, "STARTてﾞ しﾞふﾞんのSRAMへ", $e, $0
	db $0

Func_083b:: ; 83b (0:083b)
	bcbgcoord 2, 14
Func_083e:: ; 083e
	ld d, $f0
	ld e, $3
.loop
	ld a, [hl]
	or a
	ret z
	push de
	push bc
	predef Func_7bd5b
	pop bc
	ld a, BG_MAP_WIDTH
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	pop de
	inc d
	jr .loop

Func_0856:: ; 856 (0:0856)
	hlcoord 12, 17
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
Func_085d:: ; 85d (0:085d)
	call Func_07a2
	ld hl, Data_07fa
	call Func_083b
	ldh a, [hROMBank]
	push af
	hlcoord 12, 17
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	hlcoord 16, 17
	ld bc, $28
	predef CopyPredef
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld de, $304
	predef Func_7bdec
	ld b, $7
	ld c, $87
	decoord 16, 17
Func_088f:: ; 88f (0:088f)
	push bc
	push hl
	ld l, e
	ld h, d
	ld a, [hli]
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	or a
	jr z, .asm_08da
	ldh a, [hROMBank]
	push af
	ld a, b
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld a, d
	cp $80
	jr c, .asm_08af
	sub $40
	ld d, a
.asm_08af
	push bc
	hlcoord 4, 2, wAttrMap
	ld bc, $20
	predef CopyPredef
	pop bc
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld d, c
	ld e, $7
	pop hl
	pop bc
	push bc
	push hl
	hlcoord 8, 2, wAttrMap
	predef Func_7bd5b
	pop de
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	inc c
	dec b
	jp nz, Func_088f
	push bc
	push hl
	push de
.asm_08da
	ld a, $1
	predef Func_7d78e
	pop de
	pop hl
	pop bc
	ld a, $7
	sub b
	ld b, a
	ld c, $0
.asm_08e7
	ld hl, $104
	ld d, $20
	ld e, $3e
	push bc
	predef Func_7b7a9
	pop bc
	jr c, .asm_08ff
	ld c, a
	push bc
	call Func_0906
	pop bc
	jr nc, .asm_08e7
	jp Func_085d

.asm_08ff
	ldh a, [hFF8A]
	and $4
	ret z
	predef Func_0150
Func_0906:: ; 906 (0:0906)
	hlcoord 16, 17
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	or a
	scf
	ret z
	ldh a, [hFF8A]
	Coorda 8, 4, wAttrMap
	ldh a, [hROMBank]
	Coorda 7, 4, wAttrMap
	push af
	ld a, [hli]
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $80
	jr c, .asm_092f
	sub $40
	ld h, a
.asm_092f
	ld a, [hli]
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	cp $44
	jr z, .asm_09a2
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	push bc
	push de
	ld a, $4
	add c
	ld l, a
	ld h, $1
	predef Func_7d905
	ld a, $2a
	predef Func_7d93e
	aCoord 8, 4, wAttrMap
	and $1
	call nz, Func_0c51
	pop de
	pop bc
	ret c
	ldh a, [hROMBank]
	push af
	ld a, b
	Coorda 6, 4, wAttrMap
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld l, e
	ld h, d
	push bc
	call Func_09c2
	pop bc
	jr c, .asm_0972
	ld de, $cfc
	jr .asm_097e

.asm_0972
	ld de, $d0f
	aCoord 12, 4, wAttrMap
	or a
	jr z, .asm_097e
	ld de, $d24
.asm_097e
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld a, $4
	add c
	push de
	push bc
	ld e, a
	ld d, $2
	predef Func_7bdec
	ld c, l
	ld b, h
	pop de
	ld a, $80
	add e
	ld d, a
	ld e, $7
	pop hl
	predef Func_7bd5b
	ld hl, Data_07fa
	call Func_083b
	xor a
	ret

.asm_09a2
	pop af
	ldh [hROMBank], a
	ld [HuC3RomBank], a
	ld c, b
	hlcoord 12, 17
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	push hl
	ld a, c
	call Func_0856
	pop de
	pop af
	hlcoord 12, 17
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

Func_09c2:: ; 9c2 (0:09c2)
	xor a
	Coorda 12, 4, wAttrMap
	aCoord 8, 4, wAttrMap
	bit 0, a
	jp nz, Func_0a91
	bit 7, h
	jr nz, .asm_0a07
	push hl
	call Func_0a18
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
.asm_09dd
	push bc
	ld a, b
	cp $8
	jr c, .asm_09e6
	ld bc, $800
.asm_09e6
	ld e, l
	ld d, h
	push de
	push bc
	ld hl, $c900
	predef CopyPredef
	pop bc
	push bc
	ld de, $c900
	hlcoord 16, 4
	predef Func_7cca9
	pop de
	pop hl
	add hl, de
	pop bc
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	or c
	jr nz, .asm_09dd
	ret

.asm_0a07
	ld de, $c000
	add hl, de
	push hl
	call Func_0a18
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
	jr .asm_09dd

Func_0a18:: ; a18 (0:0a18)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld c, [hl]
	inc hl
	push bc
	push af
	ld e, l
	ld d, h
	push bc
	ld hl, wOAMBuffer
	ld b, $0
	push hl
	predef CopyPredef
	pop de
	pop bc
	hlcoord 16, 4
	push bc
	push de
	predef Func_7afe6
	pop de
	pop bc
	jr nc, .asm_0a85
	pop hl
	pop bc
	pop de
	ld a, $2e
	bit 0, b
	jr nz, .asm_0a46
	xor a
.asm_0a46
	add $5
	add c
	ld c, a
	push bc
	push bc
	ld a, $0
	adc a
	ld b, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop bc
	ld c, $0
	ld a, h
	hlcoord 6, 5
	ld [hl], a
	hlcoord 16, 4
	push de
	predef Func_7caa0
	pop de
	pop bc
	jr c, .asm_0a8d
	bit 0, b
	ret z
	push bc
	push de
	ld b, $0
	ld de, hFFD2
	hlcoord 16, 4
	predef Func_7cb98
	pop de
	ld hl, $2e
	add hl, de
	ld e, l
	ld d, h
	pop bc
	ld a, c
	sub $2e
	ld c, a
	xor a
	ret

.asm_0a85
	ld a, $1
	Coorda 12, 4, wAttrMap
	pop hl
	pop bc
	pop de
.asm_0a8d
	or $1
	scf
	ret

Func_0a91:: ; a91 (0:0a91)
	bit 7, h
	jr nz, .asm_0add
	push hl
	call Func_0aee
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
.asm_0aa0
	push bc
	ld a, b
	or a
	jr z, .asm_0aa8
	ld bc, $100
.asm_0aa8
	ld e, l
	ld d, h
	push de
	push bc
	ld hl, $c900
	predef CopyPredef
	pop bc
	push bc
	ld de, $c900
	call Func_0ce1
	pop de
	pop hl
	push af
	add hl, de
	pop af
	pop bc
	jr c, .asm_0adb
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	or c
	jr nz, .asm_0aa0
	call Func_0bae
	jr c, .asm_0adb
	ld a, $2
	call Func_0cc1
	jr c, .asm_0adb
	call Func_0cd2
	xor a
	ret

.asm_0adb
	scf
	ret

.asm_0add
	ld de, $c000
	add hl, de
	push hl
	call Func_0aee
	pop hl
	ret c
	ld b, $0
	add hl, bc
	ld c, e
	ld b, d
	jr .asm_0aa0

Func_0aee:: ; aee (0:0aee)
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld c, [hl]
	inc hl
	push bc
	Coorda 9, 4, wAttrMap
	ld e, l
	ld d, h
	push bc
	ld hl, wOAMBuffer
	ld b, $0
	push hl
	predef CopyPredef
	pop de
	pop bc
	hlcoord 8, 12, wAttrMap
	push bc
	push de
	call Func_0cf3
	pop de
	pop bc
	jp nc, Func_0b97
	pop bc
	pop de
	cp $ff
	jp z, Func_0baa
	ld a, $2e
	bit 0, b
	jr nz, .asm_0b24
	xor a
.asm_0b24
	add $5
	add c
	ld c, a
	push bc
	push bc
	ld a, $0
	adc a
	ld b, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	pop bc
	aCoord 10, 4, wAttrMap
	ld c, a
	ld a, $ff
	hlcoord 18, 12, wAttrMap
	ld [hl], a
	push de
	push bc
	ld a, $5
	call Func_0cc1
	pop bc
	pop de
	push de
	hlcoord 8, 12, wAttrMap
	call Func_0ced
	pop de
	pop bc
	jr nc, .asm_0b5b
	cp $ff
	jr z, Func_0baa
	ld a, $4
	jr asm_0ba4

.asm_0b5b
	push bc
	push de
	push hl
	ld hl, sp+$0
	ld d, h
	ld e, l
	ld hl, $ce00
	ld c, $2
	call Func_0cbb
	pop hl
	pop de
	pop bc
	aCoord 11, 4, wAttrMap
	cp h
	jr nz, asm_0ba2
	ld a, $5
	cp l
	jr nz, asm_0ba2
	xor a
	bit 0, b
	ret z
	push bc
	push de
	ld b, $0
	ld de, hFFD2
	hlcoord 8, 12, wAttrMap
	call Func_0ce7
	pop de
	ld hl, $2e
	add hl, de
	ld e, l
	ld d, h
	pop bc
	ld a, c
	sub $2e
	ld c, a
	xor a
	ret

Func_0b97:: ; b97 (0:0b97)
	ld a, $1
	Coorda 12, 4, wAttrMap
	pop bc
	pop de
	ld a, $7
	jr asm_0ba4

asm_0ba2:
	ld a, $5
asm_0ba4:
	call Func_0cc1
	call Func_0cd2
Func_0baa:: ; baa (0:0baa)
	or $1
	scf
	ret

Func_0bae:: ; bae (0:0bae)
	hlcoord 17, 12, wAttrMap
	ld a, [hli]
	push hl
	inc hl
	ld b, $0
	bit 0, a
	ld a, $fe
	jr z, .asm_0bbe
	sub $2e
.asm_0bbe
	sub [hl]
	ld e, a
	ld a, $ff
	sbc b
	ld d, a
	call Func_0ce7
	pop de
	ret c
	aCoord 9, 4, wAttrMap
	ld [de], a
	ld bc, $1
	jp Func_0ce1

Data_0bd3:: ; 0bd3
	db $f, "つうしんしﾞゅんひﾞちゅう にして  ", $e, $0
	db "ケﾞームホﾞーイ", $f, "とﾞうしを くっつけ ", $e, $0
	db "Aホﾞタン", $f, "を おしてくたﾞさい   ", $e, $0
	db $0

Data_0c15:: ; 0c15
	db $f, "つうしんを ちゅうしするはﾞあいは ", $e, $0
	dstr "                "
	db "Bホﾞタン", $f, "を おしてくたﾞさい   ", $e, $0
	db $0

Func_0c51:: ; c51 (0:0c51)
	ld hl, Data_0bd3
	call Func_083b
.asm_0c57
	predef Func_7e17c
	bit 1, a
	jr nz, .asm_0ca4
	and $1
	jr z, .asm_0c57
	ld hl, Data_0c15
	call Func_083b
	ld hl, $ce00
	ld de, $c800
	ld c, $10
	call Func_0cbb
	jr c, .asm_0ca4
	rst $10
	add hl, sp
	nop
	pop hl
	ld de, $c802
	ld bc, $d
	predef Func_7af75
	ld a, h
	or l
	ld a, $6
	jr nz, .asm_0ca6
	ld a, [$c800]
	or a
	jr nz, .asm_0ca6
.asm_0c8b
	ld a, [$c801]
	Coorda 11, 4, wAttrMap
	ld a, [$c80f]
	Coorda 10, 4, wAttrMap
	ld a, $1
	call Func_0cc1
	jr c, .asm_0ca4
	call Func_0cd2
	xor a
	ret

.asm_0ca4
	scf
	ret

.asm_0ca6
	call Func_0cc1
	call Func_0cd2
	scf
	ret

Data_0cae:: ; 0cae
	db "GB KISS MENU "

Func_0cbb:: ; cbb (0:0cbb)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac8d
	jr asm_0cf7

Func_0cc1:: ; cc1 (0:0cc1)
	ld [$c800], a
	ld de, $ce00
	ld hl, $c800
	ld c, $1
	predef FrameDelayPredef_7ceaf
	predef Func_7aca4
	jr asm_0cf7

Func_0cd2:: ; cd2 (0:0cd2)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac16
	jr asm_0cf7

Func_0cd8:: ; 0cd8
	hlcoord 8, 12, wAttrMap
	predef FrameDelayPredef_7ceaf
	predef Func_7ac62
	jr asm_0cf7

Func_0ce1:: ; ce1 (0:0ce1)
	predef FrameDelayPredef_7ceaf
	predef Func_7acd3
	jr asm_0cf7

Func_0ce7:: ; ce7 (0:0ce7)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac56
	jr asm_0cf7

Func_0ced:: ; ced (0:0ced)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac37
	jr asm_0cf7

Func_0cf3:: ; cf3 (0:0cf3)
	predef FrameDelayPredef_7ceaf
	predef Func_7ac2a
asm_0cf7:
	push af
	predef Func_7e0d2
	pop af
	ret

Data_0cfc:: ; 0cfc
	db $f, "- <てんそう されました> -", $e, $0
	db $f, "- てんそうてﾞきませんてﾞした -", $e, $0
	db $f, "- おなしﾞ", $e, "ファイル", $f, "かﾞあります -", $e, $0
	db $0

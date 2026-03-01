
Data_8620c: ; 8620c
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
ENDC

Data_86252: ; 86252
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
ENDC

Data_86298: ; 86298
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $04
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $08, $02
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $0a
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $09, $06
ENDC

Data_862de:
	dtext_tree_pointer TreeBitstreamText_402e4
	dw -1

Data_862e2:
	dtext_tree_pointer TreeBitstreamText_3f9b7
	dw -1

Data_862e6:
	dtext_tree_pointer TreeBitstreamText_40405
	dw -1

Data_862ea:
	dtext_tree_pointer TreeBitstreamText_3fb74
	dw -1

Data_862ee:
	dtext_tree_pointer TreeBitstreamText_3fa09
	dw -1

Data_862f2:
	dtext_tree_pointer TreeBitstreamText_40542
	dw -1

Data_862f6:
	dtext_tree_pointer TreeBitstreamText_3fa9a
	dw -1

Data_862fa:
	dtext_tree_pointer TreeBitstreamText_4027b
	dw -1

Data_862fe: ; 862fe
	warpdef $0a, $01, $01, $01, MAP_02_03, $0a, $01, $0a, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_02_01, $09, $01, $09, $02, SFX_2E
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_8631f: ; 8631f
	warpdef $0a, $01, $01, $01, MAP_02_03, $0a, $01, $0a, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_02_03, $09, $01, $09, $02, SFX_2E
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_86340: ; 86340
	warpdef $0a, $01, $01, $01, MAP_02_02, $0a, $01, $0a, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_02_03, $09, $01, $09, $02, SFX_2E
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_86361: ; 86361
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_862de
	person_event $07, $04, $03, $0a, $01, $01, $02, $04, $00, Func_86625, NULL
	person_event $03, $04, $09, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_21, Data_862e2

Data_8638b: ; 8638b
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_862e6
	person_event $00, $04, $09, $0a, $01, $01, $02, $04, $00, Func_866df, NULL
	person_event $02, $04, $03, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_862ea
	person_event $07, $04, $0b, $0c, $01, $01, $03, $04, $00, PrintTextFacePlayer_21, Data_862ee

Data_863c3: ; 863c3
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_862f2
	person_event $05, $04, $0a, $0a, $01, $01, $03, $04, $00, Func_86799, NULL
	person_event $0a, $04, $03, $0b, $01, $01, $01, $04, $00, PrintTextFacePlayer_21, Data_862f6
	person_event $00, $04, $04, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_21, Data_862fa

Func_863fb::
	push bc
	push bc
	push bc
	ld hl, sp+$0
	scall Func_80f94
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld bc, $474
	ld de, $168
	call CompareHLtoDE
	jp c, .asm_8642c
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, .asm_86437
.asm_8642c: ; 8642c (21:642c)
	setevent $38
	jp .asm_8643f

.asm_86437: ; 86437 (21:6437)
	resetevent $38
.asm_8643f: ; 8643f (21:643f)
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_86467
	ld a, [wMapX]
	cp $5
	jp nz, .asm_86458
	ld a, [wc7de]
	dec a
	ld [wc7de], a
	jp .asm_86467

.asm_86458: ; 86458 (21:6458)
	ld a, [wMapX]
	cp $4
	jp nz, .asm_86467
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_86467: ; 86467 (21:6467)
	checkevent $38
	cp $1
	jp nz, .asm_8649b
	checkevent $7
	cp $1
	jp nz, .asm_8649b
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, .asm_86494
	ld a, $1
	ld [wc7da], a
	jp .asm_86498

.asm_86494: ; 86494 (21:6494)
	xor a
	ld [wc7da], a
.asm_86498: ; 86498 (21:6498)
	jp .asm_864a0

.asm_8649b: ; 8649b (21:649b)
	playmusic SONG_TOWN3
.asm_864a0: ; 864a0 (21:64a0)
	ld a, [wc7de]
	cp $6
	jp z, .asm_86536
	cp $4
	jp z, .asm_864f4
	cp $2
	jp nz, .asm_86575
	loadwarps $3, Data_862fe
	checkevent $38
	cp $1
	jp nz, .asm_864e0
	checkevent $7
	cp $1
	jp nz, .asm_864e0
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_8620c
	jp .asm_864e8

.asm_864e0: ; 864e0 (21:64e0)
	loadpeople $3, Data_86361
.asm_864e8: ; 864e8 (21:64e8)
	scall Func_8001c
	landmarksign TreeBitstreamText_467c7
	jp .asm_86575

.asm_864f4: ; 864f4 (21:64f4)
	loadwarps $3, Data_8631f
	checkevent $38
	cp $1
	jp nz, .asm_86522
	checkevent $7
	cp $1
	jp nz, .asm_86522
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_86252
	jp .asm_8652a

.asm_86522: ; 86522 (21:6522)
	loadpeople $4, Data_8638b
.asm_8652a: ; 8652a (21:652a)
	scall Func_8001c
	landmarksign TreeBitstreamText_467df
	jp .asm_86575

.asm_86536: ; 86536 (21:6536)
	loadwarps $3, Data_86340
	checkevent $38
	cp $1
	jp nz, .asm_86564
	checkevent $7
	cp $1
	jp nz, .asm_86564
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_86298
	jp .asm_8656c

.asm_86564: ; 86564 (21:6564)
	loadpeople $4, Data_863c3
.asm_8656c: ; 8656c (21:656c)
	scall Func_8001c
	landmarksign TreeBitstreamText_467f7
.asm_86575: ; 86575 (21:6575)
	pop bc
	pop bc
	pop bc
	ret

Func_86579:
	push af
	ld a, e
	or a
	jp nz, .asm_865fa
	face_player -$1
	checkevent $14
	or a
	jp nz, .asm_865f4
	checkevent $c5
	or a
	jp nz, .asm_865eb
	ld a, $3b
	scall Func_80e5d
	cp $1
	jp nz, .asm_865e2
	writenpctext_yesorno TreeBitstreamText_3f7e8
	or a
	jp nz, .asm_865be
	writenpctext TreeBitstreamText_3f85e
	setevent $c5
	jp .asm_865df

.asm_865be: ; 865be (21:65be)
	writenpctext TreeBitstreamText_3f8cd
	writetext TreeBitstreamText_3f8f1
	ld e, $0
	ld a, $7f
	scall Func_80d74
	writenpctext TreeBitstreamText_3f901
	setevent $c5
.asm_865df: ; 865df (21:65df)
	jp .asm_865e8

.asm_865e2: ; 865e2 (21:65e2)
	writenpctext TreeBitstreamText_3f7ae
.asm_865e8: ; 865e8 (21:65e8)
	jp .asm_865f1

.asm_865eb: ; 865eb (21:65eb)
	writetext TreeBitstreamText_3fa6b
.asm_865f1: ; 865f1 (21:65f1)
	jp .asm_865fa

.asm_865f4: ; 865f4 (21:65f4)
	writetext TreeBitstreamText_3fa6b
.asm_865fa: ; 865fa (21:65fa)
	pop bc
	ret

Data_865fc:
	db $00, $00, $00, $01, $00, $c5, $b7, $00, $00, $91, $01, $08, $02, $05, $0f, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_86625:
	push af
	ld a, e
	or a
	jp nz, .asm_866a7
	face_player -$1
	checkevent $c0
	cp $1
	jp nz, .asm_866a1
	checkevent $65
	or a
	jp nz, .asm_86698
	writenpctext TreeBitstreamText_39f37
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8668f
	startbattle Data_866a9, Data_865fc
	or a
	jp nz, .asm_86666
	jp .asm_866a7

.asm_86666: ; 86666 (21:6666)
	setevent $65
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep 60
	writenpctext TreeBitstreamText_39f4e
	jp .asm_86695

.asm_8668f: ; 8668f (21:668f)
	writenpctext TreeBitstreamText_39f5f
.asm_86695: ; 86695 (21:6695)
	jp .asm_8669e

.asm_86698: ; 86698 (21:6698)
	writenpctext TreeBitstreamText_39f70
.asm_8669e: ; 8669e (21:669e)
	jp .asm_866a7

.asm_866a1: ; 866a1 (21:66a1)
	writetext TreeBitstreamText_3a27f
.asm_866a7: ; 866a7 (21:66a7)
	pop bc
	ret

Data_866a9:
	dstr "(こくこﾞの せんせい)"

Data_866b6:
	db $00, $00, $00, $01, $00, $c5, $c9, $00, $00, $73, $01, $65, $02, $06, $06, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_866df:
	push af
	ld a, e
	or a
	jp nz, .asm_86761
	face_player -$1
	checkevent $c0
	cp $1
	jp nz, .asm_8675b
	checkevent $67
	or a
	jp nz, .asm_86752
	writenpctext TreeBitstreamText_3a097
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_86749
	startbattle Data_86763, Data_866b6
	or a
	jp nz, .asm_86720
	jp .asm_86761

.asm_86720: ; 86720 (21:6720)
	setevent $67
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep 60
	writenpctext TreeBitstreamText_3a0b1
	jp .asm_8674f

.asm_86749: ; 86749 (21:6749)
	writenpctext TreeBitstreamText_3a0c9
.asm_8674f: ; 8674f (21:674f)
	jp .asm_86758

.asm_86752: ; 86752 (21:6752)
	writenpctext TreeBitstreamText_3a0e1
.asm_86758: ; 86758 (21:6758)
	jp .asm_86761

.asm_8675b: ; 8675b (21:675b)
	writetext TreeBitstreamText_3a27f
.asm_86761: ; 86761 (21:6761)
	pop bc
	ret

Data_86763:
	dstr "(たいいくの せんせい)"

Data_86770:
	db $00, $00, $00, $01, $00, $c5, $b5, $00, $00, $2a, $01, $2a, $02, $06, $06, $00
	db $00, $0b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_86799:
	push af
	ld a, e
	or a
	jp nz, .asm_8681b
	face_player -$1
	checkevent $c0
	cp $1
	jp nz, .asm_86815
	checkevent $69
	or a
	jp nz, .asm_8680c
	writenpctext TreeBitstreamText_39fb2
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_86803
	startbattle Data_8681d, Data_86770
	or a
	jp nz, .asm_867da
	jp .asm_8681b

.asm_867da: ; 867da (21:67da)
	setevent $69
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep 60
	writenpctext TreeBitstreamText_39fc7
	jp .asm_86809

.asm_86803: ; 86803 (21:6803)
	writenpctext TreeBitstreamText_39fd9
.asm_86809: ; 86809 (21:6809)
	jp .asm_86812

.asm_8680c: ; 8680c (21:680c)
	writenpctext TreeBitstreamText_39fe7
.asm_86812: ; 86812 (21:6812)
	jp .asm_8681b

.asm_86815: ; 86815 (21:6815)
	writetext TreeBitstreamText_3a27f
.asm_8681b: ; 8681b (21:681b)
	pop bc
	ret

Data_8681d:
	dstr "(すうかﾞくの せんせい)"

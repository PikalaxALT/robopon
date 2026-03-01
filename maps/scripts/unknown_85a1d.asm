
Data_85938:
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, BOOBOT + 1, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, SKULBY + 1, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, RUDY + 1, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, UNIX + 1, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, ZOMBOT + 1, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, BOOBOT + 1, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, ROOTER + 1, $05, $07, $7e, $02, $03, $00, $09, $08
	wildbot $00, $02, $0c, $0b, ZOMBOT + 1, $06, $08, $7e, $07, $07, $00, $08, $06
	wildbot $00, $02, $0c, $0b, RAMBY + 1, $04, $06, $7e, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, RUDY + 1, $07, $09, $7e, $07, $12, $00, $0a, $02
ENDC

Data_8597e:
	dtext_tree_pointer TreeBitstreamText_402a7
	dw -1

Data_85982:
	dtext_tree_pointer TreeBitstreamText_3f956
	dw -1

Data_85986:
	dtext_tree_pointer TreeBitstreamText_3f97f
	dw -1

Data_8598a:
	dtext_tree_pointer TreeBitstreamText_3a2bb
	dw -1

Data_8598e: ; 8598e
	dtext_tree_pointer TreeBitstreamText_3a2d1
	dw -1

Data_85992: ; 85992
	warpdef $01, $0c, $02, $01, MAP_02_00, $07, $0b, $07, $0c, SFX_2E
	warpdef $05, $0c, $02, $01, MAP_02_00, $0c, $0b, $0c, $0c, SFX_2E
	warpdef $09, $0c, $02, $01, MAP_02_00, $11, $0b, $11, $0c, SFX_2E
	warpdef $09, $01, $01, $01, MAP_02_04, $09, $01, $09, $02, SFX_2E
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_859c9: ; 859c9
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_8597e
	person_event $0c, $04, $00, $07, $01, $01, $01, $04, $00, Func_85b98, NULL
	person_event $03, $04, $0a, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_21, Data_85982
	person_event $02, $04, $06, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_21, Data_85986
	person_event $0f, $04, $00, $04, $01, $01, $01, $04, $00, Func_85b17, NULL

Data_85a0f: ; 85a0f
	person_event $00, $04, $00, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_21, Data_8598a

Func_85a1d::
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
	jp c, .asm_85a4e
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, .asm_85a59
.asm_85a4e: ; 85a4e (21:5a4e)
	setevent $38
	jp .asm_85a61

.asm_85a59: ; 85a59 (21:5a59)
	resetevent $38
.asm_85a61: ; 85a61 (21:5a61)
	ld a, $1
	ld [wc7de], a
	loadwarps $5, Data_85992
	checkevent $38
	cp $1
	jp nz, .asm_85aaf
	checkevent $7
	cp $1
	jp nz, .asm_85aaf
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_85938
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, .asm_85aa8
	ld a, $1
	ld [wc7da], a
	jp .asm_85aac

.asm_85aa8: ; 85aa8 (21:5aa8)
	xor a
	ld [wc7da], a
.asm_85aac: ; 85aac (21:5aac)
	jp .asm_85abc

.asm_85aaf: ; 85aaf (21:5aaf)
	loadpeople $5, Data_859c9
	playmusic SONG_TOWN3
.asm_85abc: ; 85abc (21:5abc)
	ld a, [wc797]
	cp $7
	jp c, .asm_85afc
	checkevent $38
	cp $1
	jp nz, .asm_85ada
	checkevent $7
	cp $1
	jp z, .asm_85afc
.asm_85ada: ; 85ada (21:5ada)
	hideperson $4
	loadpeople $1, Data_85a0f
	checkevent $14
	cp $1
	jp nz, .asm_85afc
	ld de, Data_8598e
	ld a, $5
	scall SetPersonTextPointer
.asm_85afc: ; 85afc (21:5afc)
	scall Func_8001c
	landmarksign TreeBitstreamText_467bb
	pop bc
	pop bc
	pop bc
	ret

Data_85b09:
	dtext_tree_pointer TreeBitstreamText_39d7e
	dtext_tree_pointer TreeBitstreamText_39d95
	dtext_tree_pointer TreeBitstreamText_39dac
	dtext_tree_pointer TreeBitstreamText_39dc3
	dtext_tree_pointer TreeBitstreamText_39dda
	dtext_tree_pointer TreeBitstreamText_39df1
	dtext_tree_pointer TreeBitstreamText_39e08

Func_85b17:
	push af
	ld a, e
	or a
	jp nz, .asm_85b6d
	checkevent $c0
	or a
	jp nz, .asm_85b52
	face_player -$1
	writenpctext TreeBitstreamText_39cd9
	playsfx $2a
	writetext TreeBitstreamText_39d70
	ld c, $0
	ld e, $1
	ld a, $17
	scall Func_80d4d
	setevent $c0
	jp .asm_85b6d

.asm_85b52: ; 85b52 (21:5b52)
	face_player -$1
	ld hl, wc797
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_85b09
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	scall PrintTextStandard
.asm_85b6d: ; 85b6d (21:5b6d)
	pop bc
	ret

Data_85b6f:
	db $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $01, $01, $7a, $02, $05, $05, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_85b98:
	push af
	ld a, e
	or a
	jp nz, .asm_85c1a
	face_player -$1
	checkevent $c0
	cp $1
	jp nz, .asm_85c14
	checkevent $64
	or a
	jp nz, .asm_85c0b
	writenpctext TreeBitstreamText_39eb7
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_85c02
	startbattle Data_85c1c, Data_85b6f
	or a
	jp nz, .asm_85bd9
	jp .asm_85c1a

.asm_85bd9: ; 85bd9 (21:5bd9)
	setevent $64
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_39ed3
	jp .asm_85c08

.asm_85c02: ; 85c02 (21:5c02)
	writenpctext TreeBitstreamText_39ef3
.asm_85c08: ; 85c08 (21:5c08)
	jp .asm_85c11

.asm_85c0b: ; 85c0b (21:5c0b)
	writenpctext TreeBitstreamText_39f09
.asm_85c11: ; 85c11 (21:5c11)
	jp .asm_85c1a

.asm_85c14: ; 85c14 (21:5c14)
	writetext TreeBitstreamText_3a27f
.asm_85c1a: ; 85c1a (21:5c1a)
	pop bc
	ret

Data_85c1c:
	dstr "(ほけんの せんせい)"

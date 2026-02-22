
Data_85c28: ; 85c28
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
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $06
ENDC

Data_85c6e:
	dtext_tree_pointer TreeBitstreamText_405cb
	dw -1

Data_85c72:
	dtext_tree_pointer TreeBitstreamText_3facf
	dw -1

Data_85c76:
	dtext_tree_pointer TreeBitstreamText_3fb3a
	dw -1

Data_85c7a:
	dtext_tree_pointer TreeBitstreamText_3fb02
	dw -1

Data_85c7e: ; 85c7e
	dtext_tree_pointer TreeBitstreamText_3a29a
	dw -1

Data_85c82: ; 85c82
	warpdef $0a, $01, $01, $01, MAP_02_04, $0a, $01, $0a, $02, $2e
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $34

Data_85c98: ; 85c98
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_85c6e
	person_event $07, $04, $09, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_21, Data_85c72
	person_event $02, $04, $01, $0b, $01, $01, $01, $04, $00, PrintTextFacePlayer_21, Data_85c76
	person_event $03, $04, $02, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_21, Data_85c7a
	person_event $06, $04, $0a, $03, $01, $01, $02, $04, $00, Func_85dcd, $0000

Func_85cde::
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
	jp c, .asm_85d0f
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, .asm_85d1a
.asm_85d0f: ; 85d0f (21:5d0f)
	setevent $38
	jp .asm_85d22

.asm_85d1a: ; 85d1a (21:5d1a)
	resetevent $38
.asm_85d22: ; 85d22 (21:5d22)
	ld a, $7
	ld [wc7de], a
	loadwarps $2, Data_85c82
	checkevent $38
	cp $1
	jp nz, .asm_85d70
	checkevent $7
	cp $1
	jp nz, .asm_85d70
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_85c28
	playmusic SONG_CAVE
	checkevent $0
	or a
	jp nz, .asm_85d69
	ld a, $1
	ld [wc7da], a
	jp .asm_85d6d

.asm_85d69: ; 85d69 (21:5d69)
	xor a
	ld [wc7da], a
.asm_85d6d: ; 85d6d (21:5d6d)
	jp .asm_85d7d

.asm_85d70: ; 85d70 (21:5d70)
	loadpeople $5, Data_85c98
	playmusic SONG_TOWN3
.asm_85d7d: ; 85d7d (21:5d7d)
	checkevent $14
	or a
	jp nz, .asm_85d97
	ld a, [wc797]
	cp $7
	jp nz, .asm_85d97
	ld de, Data_85c7e
	ld a, $3
	scall SetPersonTextPointer
.asm_85d97: ; 85d97 (21:5d97)
	scall Func_8001c
	landmarksign TreeBitstreamText_46803
	pop bc
	pop bc
	pop bc
	ret

Data_85da4:
	db $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $01, $01, $91, $02, $06, $13, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_85dcd:
	push af
	ld a, e
	or a
	jp nz, .asm_85e60
	face_player -$1
	checkevent $c0
	cp $1
	jp nz, .asm_85e5a
	ld a, [wc797]
	cp $6
	jp c, .asm_85e51
	checkevent $6a
	or a
	jp nz, .asm_85e48
	writenpctext TreeBitstreamText_3a1de
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_85e3f
	startbattle Data_85e62, Data_85da4
	or a
	jp nz, .asm_85e16
	jp .asm_85e60

.asm_85e16: ; 85e16 (21:5e16)
	setevent $6a
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx $28
	writetext TreeBitstreamText_3a272
	script_sleep $3c
	writenpctext TreeBitstreamText_3a202
	jp .asm_85e45

.asm_85e3f: ; 85e3f (21:5e3f)
	writenpctext TreeBitstreamText_3a215
.asm_85e45: ; 85e45 (21:5e45)
	jp .asm_85e4e

.asm_85e48: ; 85e48 (21:5e48)
	writenpctext TreeBitstreamText_3a22e
.asm_85e4e: ; 85e4e (21:5e4e)
	jp .asm_85e57

.asm_85e51: ; 85e51 (21:5e51)
	writenpctext TreeBitstreamText_3a1b9
.asm_85e57: ; 85e57 (21:5e57)
	jp .asm_85e60

.asm_85e5a: ; 85e5a (21:5e5a)
	writetext TreeBitstreamText_3a27f
.asm_85e60: ; 85e60 (21:5e60)
	pop bc
	ret

Data_85e62:
	dstr "(りかの せんせい)"

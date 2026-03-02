
Data_85e6d: ; 85e6d
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $02
ENDC

Data_85eb3: ; 85eb3
IF DEF(SUN)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $31, $05, $07, $7e, $06, $1e, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $95, $06, $08, $7e, $07, $12, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $09, $04, $06, $7e, $0f, $00, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $94, $07, $09, $7e, $07, $07, $00, $0a, $02
ELIF DEF(STAR)
	wildbot $00, $02, $0c, $0b, $43, $05, $07, $7e, $07, $00, $00, $08, $0a
	wildbot $00, $02, $0c, $0b, $63, $05, $07, $77, $02, $03, $00, $08, $08
	wildbot $00, $02, $0c, $0b, $94, $06, $08, $7e, $07, $07, $00, $09, $06
	wildbot $00, $02, $0c, $0b, $0c, $04, $06, $77, $05, $19, $00, $01, $04
	wildbot $00, $02, $0c, $0b, $95, $07, $09, $7e, $07, $12, $00, $0a, $02
ENDC

Data_85ef9:
	dtext_tree_pointer TreeBitstreamText_40371
    dw -1

Data_85efd:
	dtext_tree_pointer TreeBitstreamText_40491
    dw -1

Data_85f01:
	dtext_tree_pointer TreeBitstreamText_3fbab
    dw -1

Data_85f05: ; 85f05
	warpdef $09, $01, $01, $01, MAP_02_04, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_02_04, $0a, $01, $0a, $02, SFX_2E
	warpdef $0b, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_85f26: ; 85f26
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_85ef9
	person_event $0e, $04, $00, $07, $01, $01, $01, $04, $00, Func_860c1, NULL

Data_85f42: ; 85f42
	person_event $ff, $00, $01, $01, $06, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_85efd
	person_event $02, $04, $04, $0a, $01, $01, $02, $04, $00, PrintTextFacePlayer_21, Data_85f01
	person_event $04, $04, $09, $0b, $01, $01, $00, $04, $00, Func_8617b, NULL

Func_85f6c::
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
	jp c, .asm_85f9d
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, .asm_85fa8
.asm_85f9d: ; 85f9d (21:5f9d)
	setevent EVENT_038
	jp .asm_85fb0

.asm_85fa8: ; 85fa8 (21:5fa8)
	resetevent EVENT_038
.asm_85fb0: ; 85fb0 (21:5fb0)
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_85fd8
	ld a, [wMapX]
	cp $5
	jp nz, .asm_85fc9
	ld a, [wc7de]
	inc a
	ld [wc7de], a
	jp .asm_85fd8

.asm_85fc9: ; 85fc9 (21:5fc9)
	ld a, [wMapX]
	cp $4
	jp nz, .asm_85fd8
	ld a, [wc7de]
	dec a
	ld [wc7de], a
.asm_85fd8: ; 85fd8 (21:5fd8)
	loadwarps $3, Data_85f05
	checkevent EVENT_038
	cp $1
	jp nz, .asm_86014
	checkevent EVENT_007
	cp $1
	jp nz, .asm_86014
	playmusic SONG_CAVE
	checkevent EVENT_000
	or a
	jp nz, .asm_8600d
	ld a, $1
	ld [wc7da], a
	jp .asm_86011

.asm_8600d: ; 8600d (21:600d)
	xor a
	ld [wc7da], a
.asm_86011: ; 86011 (21:6011)
	jp .asm_86019

.asm_86014: ; 86014 (21:6014)
	playmusic SONG_TOWN3
.asm_86019: ; 86019 (21:6019)
	scall Func_8001c
	ld a, [wc7de]
	cp $5
	jp z, .asm_86060
	cp $3
	jp nz, .asm_86094
	checkevent EVENT_038
	cp $1
	jp nz, .asm_8604f
	checkevent EVENT_007
	cp $1
	jp nz, .asm_8604f
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_85e6d
	jp .asm_86057

.asm_8604f: ; 8604f (21:604f)
	loadpeople $2, Data_85f26
.asm_86057: ; 86057 (21:6057)
	landmarksign TreeBitstreamText_467d3
	jp .asm_86094

.asm_86060: ; 86060 (21:6060)
	checkevent EVENT_038
	cp $1
	jp nz, .asm_86086
	checkevent EVENT_007
	cp $1
	jp nz, .asm_86086
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_85eb3
	jp .asm_8608e

.asm_86086: ; 86086 (21:6086)
	loadpeople $3, Data_85f42
.asm_8608e: ; 8608e (21:608e)
	landmarksign TreeBitstreamText_467eb
.asm_86094: ; 86094 (21:6094)
	pop bc
	pop bc
	pop bc
	ret

Data_86098:
	db $00, $00, $00, $01, $00, $c5, $b6, $00, $00, $72, $01, $42, $02, $05, $06, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_860c1:
	push af
	ld a, e
	or a
	jp nz, .asm_86143
	face_player -$1
	checkevent EVENT_0C0
	cp $1
	jp nz, .asm_8613d
	checkevent EVENT_066
	or a
	jp nz, .asm_86134
	writenpctext TreeBitstreamText_3a00a
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8612b
	startbattle Data_86145, Data_86098
	or a
	jp nz, .asm_86102
	jp .asm_86143

.asm_86102: ; 86102 (21:6102)
	setevent EVENT_066
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx SFX_28
	writetext TreeBitstreamText_3a272
	script_sleep 60
	writenpctext TreeBitstreamText_3a024
	jp .asm_86131

.asm_8612b: ; 8612b (21:612b)
	writenpctext TreeBitstreamText_3a03a
.asm_86131: ; 86131 (21:6131)
	jp .asm_8613a

.asm_86134: ; 86134 (21:6134)
	writenpctext TreeBitstreamText_3a04b
.asm_8613a: ; 8613a (21:613a)
	jp .asm_86143

.asm_8613d: ; 8613d (21:613d)
	writetext TreeBitstreamText_3a27f
.asm_86143: ; 86143 (21:6143)
	pop bc
	ret

Data_86145:
	dstr "(えいこﾞの せんせい)"

Data_86152:
	db $00, $00, $00, $01, $00, $c5, $b4, $00, $00, $02, $01, $2a, $02, $06, $06, $00
	db $00, $7e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8617b:
	push af
	ld a, e
	or a
	jp nz, .asm_861fd
	face_player -$1
	checkevent EVENT_0C0
	cp $1
	jp nz, .asm_861f7
	checkevent EVENT_068
	or a
	jp nz, .asm_861ee
	writenpctext TreeBitstreamText_3a138
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_861e5
	startbattle Data_861ff, Data_86152
	or a
	jp nz, .asm_861bc
	jp .asm_861fd

.asm_861bc: ; 861bc (21:61bc)
	setevent EVENT_068
	ld a, [wc797]
	inc a
	ld [wc797], a
	playsfx SFX_28
	writetext TreeBitstreamText_3a272
	script_sleep 60
	writenpctext TreeBitstreamText_3a151
	jp .asm_861eb

.asm_861e5: ; 861e5 (21:61e5)
	writenpctext TreeBitstreamText_3a167
.asm_861eb: ; 861eb (21:61eb)
	jp .asm_861f4

.asm_861ee: ; 861ee (21:61ee)
	writenpctext TreeBitstreamText_3a184
.asm_861f4: ; 861f4 (21:61f4)
	jp .asm_861fd

.asm_861f7: ; 861f7 (21:61f7)
	writetext TreeBitstreamText_3a27f
.asm_861fd: ; 861fd (21:61fd)
	pop bc
	ret

Data_861ff:
	dstr "(しゃかいの せんせい)"

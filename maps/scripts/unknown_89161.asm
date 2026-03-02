
Data_890b4:
	db $1b, $10, $05, $03, $12

MapObjects_890b9:
	person_event $0c, $0c, $0d, $10, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0c, $0c, $0e, $0e, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0c, $0c, $0f, $10, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $11, $01, $03, $02, $04, $01, Func_89237, NULL

MapObjects_890f1:
	person_event $ff, $00, $09, $09, $01, $01, $00, $04, $00, Func_89353, NULL
	person_event $ff, $00, $0f, $09, $01, $01, $00, $04, $00, Func_893a6, NULL
	person_event $ff, $00, $0c, $09, $01, $01, $00, $04, $00, Func_893f9, NULL

Data_8911b:
IF DEF(SUN)
	wildbot $00, $02, $14, $11, $77, $09, $0b, $7f, $09, $18, $00, $01, $0a, $00
	wildbot $00, $02, $14, $11, $3d, $0a, $0c, $7f, $1f, $17, $00, $02, $09, $00
	wildbot $00, $02, $14, $11, $52, $0b, $0d, $2d, $09, $09, $00, $0a, $08, $00
	wildbot $00, $02, $14, $11, $1b, $0c, $0e, $7f, $04, $0a, $00, $0b, $06, $00
	wildbot $00, $02, $14, $11, $3a, $0e, $10, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $11, $7b, $09, $0b, $77, $17, $05, $1e, $0a, $0a, $00
	wildbot $00, $02, $14, $11, $52, $0a, $0c, $2d, $09, $09, $00, $0b, $09, $00
	wildbot $00, $02, $14, $11, $3d, $0b, $0d, $7f, $1f, $17, $00, $02, $08, $00
	wildbot $00, $02, $14, $11, $31, $0c, $0e, $7e, $06, $1e, $00, $0a, $06, $00
	wildbot $00, $02, $14, $11, $91, $0e, $10, $3b, $04, $17, $00, $02, $02, $00
ENDC

Func_89161::
	ld e, $01
	ld hl, Data_890b4
	scall Func_80ce7
	ld a, $04
	ld [wc7e2], a
	checkevent EVENT_073
	if_true .asm_89180
	loadpeople $04, MapObjects_890b9
.asm_89180
	loadpeople $03, MapObjects_890f1
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8911b
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468a2
	ret

Data_891a4:
	db $0d, $11, $0e, $11, $0e, $10, $ff, $ff

Data_891ac:
	db $0f, $09, $ff, $ff

Data_891b0:
	db $0d, $09, $ff, $ff

Data_891b4:
	db $0e, $0f, $ff, $ff

Data_891b8:
	db $0e, $09, $ff, $ff

Data_891bc:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $17, $03, $0e, $1f, $07
	db $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_891e5:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $0e, $03, $0e, $04, $17
	db $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8920e:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $6b, $03, $0e, $17, $17
	db $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_89237:
	ld a, e
	cp $02
	jp nz, .asm_89348
	checkevent EVENT_073
	if_true .asm_89348
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	move_player $01, Data_891a4
	sprite_face $03, $02
	ld a, $01
	scall PlayerFace
	writetext TreeBitstreamText_42972
	writetext TreeBitstreamText_47192
.asm_89272
	ld de, Data_89349
	ld hl, Data_891bc
	scall Func_8039e
	if_true .asm_8928a
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_89272
	jp .asm_89348
.asm_8928a
	writetext TreeBitstreamText_42972
	move_person $02, Data_891ac, 1
	scall WaitNPCStep
	hideperson $02
	sprite_face $01, 0
	ld a, $03
	scall PlayerFace
	writetext TreeBitstreamText_42972
	writetext TreeBitstreamText_47192
.asm_892bb
	ld de, Data_8934c
	ld hl, Data_891e5
	scall Func_8039e
	if_true .asm_892d3
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_892bb
	jp .asm_89348
.asm_892d3
	writetext TreeBitstreamText_42972
	move_person 0, Data_891b0, 1
	scall WaitNPCStep
	hideperson 0
	move_person $01, Data_891b4, 1
	xor a
	scall PlayerFace
	writetext TreeBitstreamText_42972
	writetext TreeBitstreamText_47192
.asm_89305
	ld de, Data_89350
	ld hl, Data_8920e
	scall Func_8039e
	if_true .asm_8931d
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_89305
	jp .asm_89348
.asm_8931d
	writetext TreeBitstreamText_42972
	setevent EVENT_073
	move_person $01, Data_891b8, 1
	scall WaitNPCStep
	hideperson $01
	playmusic SONG_NONE
	playmusic SONG_TOWER
.asm_89348
	ret

Data_89349:
	dstr "ゆき"

Data_8934c:
	dstr "なつこ"

Data_89350:
	dstr "あい"

Func_89353:
	ld a, e
	if_true .asm_893a5
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89362
	jp .asm_893a5
.asm_89362
	checkevent EVENT_059
	cp $01
	jp nz, .asm_89376
	writetext TreeBitstreamText_47037
	jp .asm_893a5
.asm_89376
	loademote $01, $01, $09
	xor a
	scall Func_80653
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld a, $0e
	ld [wc78a], a
	warp_player MAP_32_03, $03, $03
.asm_893a5
	ret

Func_893a6:
	ld a, e
	if_true .asm_893f8
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_893b5
	jp .asm_893f8
.asm_893b5
	checkevent EVENT_059
	cp $01
	jp nz, .asm_893c9
	writetext TreeBitstreamText_47037
	jp .asm_893f8
.asm_893c9
	loademote $01, $01, $09
	xor a
	scall Func_80653
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld a, $0f
	ld [wc78a], a
	warp_player MAP_05_32, $11, $09
.asm_893f8
	ret

Func_893f9:
	ld a, e
	if_true .asm_89431
	checkevent EVENT_059
	if_true .asm_8941e
	setevent EVENT_059
	playsfx SFX_31
	writetext TreeBitstreamText_47029
	jp .asm_89431
.asm_8941e
	resetevent EVENT_059
	playsfx SFX_32
	writetext TreeBitstreamText_4701b
.asm_89431
	ret

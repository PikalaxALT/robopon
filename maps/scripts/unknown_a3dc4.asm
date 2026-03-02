
Data_a3d73:
	warpdef $04, $0c, $03, $01, MAP_19_20, $0c, $02, $0c, $03, SFX_2E

Data_a3d7e:
IF DEF(SUN)
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
ENDC

Data_a3da8:
IF DEF(SUN)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $12, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ELIF DEF(STAR)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $2c, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ENDC

Func_a3dc4:: ; a3dc4
	loadwarps $01, Data_a3d73
	playmusic SONG_CAVE
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_a3d7e
	checkevent EVENT_0C7
	or a
	jp nz, .asm_a3e05
	loadpeople $02, Data_a3da8
	ld a, $01
	ld [wc7da], a
	hideperson $01
	scall Func_8001c
	call Func_a3e3c
	jp .asm_a3e08
.asm_a3e05:
	scall Func_8001c
.asm_a3e08:
	ret

Data_a3e09:
	db $05, $06, $ff, $ff

Data_a3e0d:
	db $06, $07, $05, $0b, $ff, $ff

Data_a3e13:
IF DEF(SUN)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $46
	db $07, $28, $07, $07, $07, $6a, $01, $0b
ELIF DEF(STAR)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $06
	db $07, $28, $03, $03, $01, $08, $01, $0b
ENDC

Func_a3e3c:
	writenpctext TreeBitstreamText_45bb0
	xor a
	ld [wc7da], a
	scall Func_80f02
	script_sleep 30
	move_player $01, Data_a3e09
	scall WaitNPCStep
	startbattle Data_a3f51, Data_a3e13
	or a
	jp nz, label_a3e6a
	ret
label_a3e6a:
	writenpctext TreeBitstreamText_45c00
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_BEAUTY
	move_person 0, Data_a3e0d, 1
	scall WaitNPCStep
	hideperson 0
	playmusic SONG_TEIL_TOWN
	script_sleep 60
	loademote $01, $01, $05
	ld e, $06
	ld a, $05
	scall MoveEmote
	playsfx SFX_28
	scall WaitEmote
	scall HideEmote
	script_sleep 30
	playsfx SFX_5E
	loademote $02, $02, $08
	ld e, $05
	ld a, $05
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_28
	showperson $01
	playsfx SFX_60
	sprite_face $03, $01
	sprite_face $00, $01
	sprite_face $01, $01
	sprite_face $02, $01
	sprite_face $03, $01
	sprite_face $00, $01
	sprite_face $01, $01
	sprite_face $02, $01
	move_person $01, Data_a3e09, 1
	scall WaitNPCStep
	hideperson $01
	playsfx SFX_2A
	writetext TreeBitstreamText_45c64
	ld c, $28
	ld e, $00
IF DEF(SUN)
	ld a, $95
ELIF DEF(STAR)
	ld a, $96
ENDC
	scall GiveRobot
	cp $ff
	jp nz, label_a3f48
label_a3f48:
	setevent EVENT_0C7
	ret

Data_a3f51:
	dstr "(なそﾞのしﾞんふﾞつ)"

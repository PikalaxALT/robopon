
Data_cb9ed:
	warpdef $02, $0d, $01, $01, MAP_21_24, $02, $0d, $02, $0c, SFX_2E

Data_cb9f8:
	db $35, $0e, $07, $03, $0b

Data_cb9fd:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1c, $1e, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1d, $1f, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1c, $1e, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1d, $1f, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cba43:
	person_event $20, $0c, $0b, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $01, Func_cbac1, NULL
	person_event $ff, $00, $0e, $03, $01, $01, $00, $04, $00, Func_cbb24, NULL

Func_cba6d:: ; cba6d
	loadwarps $01, Data_cb9ed
	ld e, $01
	ld hl, Data_cb9f8
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_cb9fd
	loadpeople $03, Data_cba43
	checkevent $0016
	cp $01
	jp nz, .asm_cbaaa
	hideperson 0
	hideperson $01
.asm_cbaaa:
	playmusic SONG_TOWN2
	scall Func_8001c
	landmarksign TreeBitstreamText_46af6
	ret

Data_cbab9:
	db $09, $04, $ff, $ff

Data_cbabd:
	db $0e, $04, $ff, $ff

Func_cbac1:
	ld a, e
	cp $02
	jp nz, .asm_cbb23
	checkevent $0016
	or a
	jp nz, .asm_cbb23
	playmusic SONG_NONE
	sprite_face $03, 0
	move_player $01, Data_cbab9
	scall WaitNPCStep
	playmusic SONG_TITLE
	writenpctext TreeBitstreamText_3cb2d
	move_person 0, Data_cbabd, 1
	scall WaitNPCStep
	sprite_face $00, 0
	hideperson 0
	hideperson $01
	setevent $0016
	playmusic SONG_NONE
	playmusic SONG_TOWN2
.asm_cbb23:
	ret

Func_cbb24:
	ld a, e
	or a
	jp nz, .asm_cbb5e
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_cbb33
	jp .asm_cbb5e
.asm_cbb33:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld l, $06
	push hl
	ld c, $07
	ld e, $00
	ld a, $1c
	scall Func_80dff
	pop bc
	script_sleep 30
.asm_cbb5e:
	ret


Data_cb835:
	warpdef $07, $13, $01, $01, MAP_21_23, $07, $13, $07, $12, SFX_2E
	warpdef $0c, $02, $01, $01, MAP_21_23, $0c, $02, $0c, $03, SFX_2E
	warpdef $11, $09, $01, $01, MAP_21_23, $11, $09, $11, $08, SFX_2E
	warpdef $02, $0d, $01, $01, MAP_21_25, $02, $0d, $03, $0d, SFX_2E

Data_cb861:
	db $34, $0f, $06, $02, $35

Data_cb866:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb8ac:
	person_event $09, $0c, $01, $08, $01, $01, $01, $04, $00, NULL, NULL
	person_event $ff, $00, $03, $05, $01, $05, $00, $04, $01, Func_cb91e, NULL
	person_event $ff, $00, $00, $0a, $03, $01, $00, $04, $01, Func_cb91e, NULL

Func_cb8d6:: ; cb8d6
	loadwarps $04, Data_cb835
	ld e, $01
	ld hl, Data_cb861
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_cb866
	checkevent EVENT_0AE
	or a
	jp nz, .asm_cb905
	loadpeople $03, Data_cb8ac
.asm_cb905:
	playmusic SONG_TOWN2
	scall Func_8001c
	landmarksign TreeBitstreamText_46aeb
	ret

Data_cb914:
	db $03, $08, $02, $08, $ff, $ff

Data_cb91a:
	db $01, $09, $ff, $ff

Func_cb91e:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb969
	checkevent EVENT_0AE
	or a
	jp nz, .asm_cb969
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb94d
	move_player $01, Data_cb914
	jp .asm_cb95d
.asm_cb94d:
	move_player $01, Data_cb91a
	sprite_face $02, 0
.asm_cb95d:
	call Func_cb99c
	playmusic SONG_NONE
	playmusic SONG_TOWN2
.asm_cb969:
	pop bc
	ret

Data_cb96b:
	db $01, $0d, $ff, $ff

Data_cb96f:
	db $02, $0d, $ff, $ff

Data_cb973:
	db $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $05, $21, $14, $1e, $1e, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_cb99c:
	writetext TreeBitstreamText_3c9c1
	startbattle Data_cb9e5, Data_cb973
	or a
	jp nz, .asm_cb9b0
	ret
.asm_cb9b0:
	writetext TreeBitstreamText_3ca00
	setevent EVENT_0AE
	ld a, [wPlayerFacing]
	cp $03
	jp nz, .asm_cb9d2
	move_person 0, Data_cb96b, 1
	jp .asm_cb9db
.asm_cb9d2:
	move_person 0, Data_cb96f, 1
.asm_cb9db:
	scall WaitNPCStep
	hideperson 0
	ret

Data_cb9e5:
	dstr "(くﾞんそう)"

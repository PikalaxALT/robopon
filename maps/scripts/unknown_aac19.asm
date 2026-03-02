
Data_aab93:
	warpdef $01, $04, $01, $01, MAP_25_04, $09, $18, $09, $17, SFX_2E
	warpdef $0e, $03, $01, $03, MAP_28_01, $05, $14, $06, $14, SFX_2E

Data_aaba9:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aabe1:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaccc, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaccc, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_aada6, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_aada6, NULL

Func_aac19:: ; aac19
	loadwarps $02, Data_aab93
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_aaba9
	setevent EVENT_0C2
	checkevent EVENT_022
	cp $01
	jp nz, .asm_aac8a
	checkevent EVENT_043
	or a
	jp nz, .asm_aac8a
	loadpeople $04, Data_aabe1
	playmusic SONG_WILD_BATTLE
	checkevent EVENT_0AF
	or a
	jp z, .asm_aac6f
	hideperson 0
	hideperson $01
.asm_aac6f
	checkevent EVENT_0B0
	or a
	jp z, .asm_aac87
	hideperson $02
	hideperson $03
.asm_aac87
	jp .asm_aac8f
.asm_aac8a
	playmusic SONG_CAVE
.asm_aac8f
	scall Func_8001c
	ret

Data_aac93:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $87, $06, $28, $03, $03, $00, $14, $88, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $84, $06, $28, $03, $03, $00, $14, $85, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_aacbc:
	db $08, $04, $ff, $ff

Data_aacc0:
	db $08, $04, $01, $04, $ff, $ff

Data_aacc6:
	db $06, $04, $01, $04, $ff, $ff

Func_aaccc:
	push de
	checkevent EVENT_0AF
	or a
	jp nz, .asm_aad67
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aace3
	or a
	jp nz, .asm_aad67
.asm_aace3
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aacf4
	face_player 0
	jp .asm_aad02
.asm_aacf4
	move_player $01, Data_aacbc
	xor a
	scall PlayerFace
.asm_aad02
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_3d8ab
	startbattle Data_aad69, Data_aac93
	or a
	jp nz, .asm_aad21
	jp .asm_aad67
.asm_aad21
	writetext TreeBitstreamText_3d897
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aad3d
	move_person 0, Data_aacc0, 1
	jp .asm_aad46
.asm_aad3d
	move_person 0, Data_aacc6, 1
.asm_aad46
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	setevent EVENT_0AF
.asm_aad67
	pop bc
	ret

Data_aad69:
	dstr "(へいし)"

Data_aad6f:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $84, $06, $28, $04, $04, $00, $14, $85, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $87, $06, $28, $04, $04, $00, $14, $88, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aad98:
	db $0a, $04, $ff, $ff

Data_aad9c:
	db $0a, $04, $0e, $04, $ff, $ff

Data_aada2:
	db $0e, $03, $ff, $ff

Func_aada6:
	push de
	checkevent EVENT_0B0
	or a
	jp nz, .asm_aae45
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aadbd
	or a
	jp nz, .asm_aae45
.asm_aadbd
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aadcf
	face_player $02
	jp .asm_aaddd
.asm_aadcf
	move_player $01, Data_aad98
	xor a
	scall PlayerFace
.asm_aaddd
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_3d844
	startbattle Data_aae47, Data_aad6f
	or a
	jp nz, .asm_aadfc
	jp .asm_aae45
.asm_aadfc
	writetext TreeBitstreamText_3d897
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aae19
	move_person $02, Data_aad9c, 1
	jp .asm_aae23
.asm_aae19
	move_person $02, Data_aada2, 1
.asm_aae23
	scall WaitNPCStep
	hideperson $02
	hideperson $03
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	setevent EVENT_0B0
.asm_aae45
	pop bc
	ret

Data_aae47:
	dstr "(へいし)"


Data_aa1a2:
	warpdef $08, $05, $02, $01, MAP_25_20, $0f, $1c, $0f, $1b, SFX_2E
	warpdef $08, $15, $02, $01, MAP_25_01, $0c, $05, $0c, $06, SFX_2E
	warpdef $05, $12, $01, $01, MAP_25_04, $09, $04, $09, $05, SFX_2E
	warpdef $0c, $12, $01, $01, MAP_25_05, $01, $04, $01, $05, SFX_2E

Data_aa1ce:
	dtext_tree_pointer TreeBitstreamText_465a4
	dw -1

Data_aa1d2:
	person_event $09, $0c, $07, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $0a, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $07, $09, $04, $01, $00, $04, $01, Func_aa277, NULL

Data_aa1fc:
	person_event $ff, $00, $07, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce
	person_event $ff, $00, $0a, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce

Func_aa218:: ; aa218
	ld a, $09
	ld [wc789], a
	ld a, $0d
	ld [wc7e2], a
	loadwarps $04, Data_aa1a2
	checkevent $00b7
	or a
	jp nz, .asm_aa23c
	loadpeople $03, Data_aa1d2
.asm_aa23c:
	loadpeople $02, Data_aa1fc
	checkevent $0022
	cp $01
	jp nz, .asm_aa261
	checkevent $0043
	or a
	jp nz, .asm_aa261
	playmusic SONG_WILD_BATTLE
	jp .asm_aa266
.asm_aa261:
	playmusic SONG_TEIL_TOWN
.asm_aa266:
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_aa26f:
	db $08, $07, $ff, $ff

Data_aa273:
	db $09, $07, $ff, $ff

Func_aa277:
	push de
	checkevent $00b7
	or a
	jp nz, .asm_aa2f2
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_aa2f2
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	move_player $01, Data_aa26f
	sprite_face $01, 0
	ld a, $03
	scall PlayerFace
	resetevent $00f7
	call Func_aa321
	checkevent $00f7
	or a
	jp z, .asm_aa2c0
	jp .asm_aa2f2
.asm_aa2c0:
	move_person $01, Data_aa273, 1
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	resetevent $00f7
	call Func_aa392
	checkevent $00f7
	or a
	jp z, .asm_aa2ea
	jp .asm_aa2f2
.asm_aa2ea:
	setevent $00b7
.asm_aa2f2:
	pop bc
	ret

Data_aa2f4:
	db $07, $0f, $ff, $ff

Data_aa2f8:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $02, $06, $2a, $0f, $17
	db $00, $6f, $2d, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $57, $06, $2a, $0f, $17
	db $00, $6f, $5a, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_aa321:
	writetext TreeBitstreamText_3d831
	startbattle Data_aa35f, Data_aa2f8
	or a
	jp nz, Func_aa33d
	setevent $00f7
	ret

Func_aa33d:
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	writetext TreeBitstreamText_3d897
	move_person 0, Data_aa2f4, 1
	scall WaitNPCStep
	hideperson 0
	ret

Data_aa35f:
	dstr "(へいし)"

Data_aa365:
	db $09, $0f, $ff, $ff

Data_aa369:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $7d, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $14, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_aa392:
	writetext TreeBitstreamText_3d85e
	startbattle Data_aa3d2, Data_aa369
	or a
	jp nz, .asm_aa3ae
	setevent $00f7
	ret
.asm_aa3ae:
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	writetext TreeBitstreamText_3d897
	move_person $01, Data_aa365, 1
	scall WaitNPCStep
	hideperson $01
	ret

Data_aa3d2:
	dstr "(へいし)"

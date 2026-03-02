
Data_aae4d:
	warpdef $11, $04, $01, $01, MAP_25_05, $01, $18, $01, $17, SFX_2E
	warpdef $05, $03, $01, $03, MAP_28_01, $1d, $14, $1c, $14, SFX_2E

Data_aae63:
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

Data_aae9b:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaf84, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaf84, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_ab05c, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_ab05c, NULL

Func_aaed3:: ; aaed3
	loadwarps $02, Data_aae4d
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_aae63
	setevent EVENT_0C2
	checkevent EVENT_022
	cp $01
	jp nz, .asm_aaf44
	checkevent EVENT_043
	or a
	jp nz, .asm_aaf44
	loadpeople $04, Data_aae9b
	playmusic SONG_WILD_BATTLE
	checkevent EVENT_0B3
	or a
	jp z, .asm_aaf29
	hideperson 0
	hideperson $01
.asm_aaf29
	checkevent EVENT_0B4
	or a
	jp z, .asm_aaf41
	hideperson $02
	hideperson $03
.asm_aaf41
	jp .asm_aaf49
.asm_aaf44
	playmusic SONG_CAVE
.asm_aaf49
	scall Func_8001c
	ret

Data_aaf4d:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $57, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $02, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aaf76:
	db $08, $04, $ff, $ff

Data_aaf7a:
	db $08, $04, $05, $04, $ff, $ff

Data_aaf80:
	db $05, $03, $ff, $ff

Func_aaf84:
	push de
	checkevent EVENT_0B3
	or a
	jp nz, .asm_ab01b
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aaf9b
	or a
	jp nz, .asm_ab01b
.asm_aaf9b
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aafaa
	face_player 0
	jp .asm_aafb8
.asm_aafaa
	move_player $01, Data_aaf76
	xor a
	scall PlayerFace
.asm_aafb8
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_3d86d
	startbattle Data_ab01d, Data_aaf4d
	or a
	jp nz, .asm_aafd7
	jp .asm_ab01b
.asm_aafd7
	writetext TreeBitstreamText_3d897
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aaff1
	move_person 0, Data_aaf7a, 1
	jp .asm_aaffa
.asm_aaff1
	move_person 0, Data_aaf80, 1
.asm_aaffa
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	setevent EVENT_0B3
.asm_ab01b
	pop bc
	ret

Data_ab01d:
	dstr "(へいし)"

Data_ab023:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $24, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $22, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab04c:
	db $0a, $04, $ff, $ff

Data_ab050:
	db $0a, $04, $11, $04, $ff, $ff

Data_ab056:
	db $0c, $04, $11, $04, $ff, $ff

Func_ab05c:
	push de
	checkevent EVENT_0B4
	or a
	jp nz, .asm_ab0f7
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab073
	or a
	jp nz, .asm_ab0f7
.asm_ab073
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab083
	face_player $02
	jp .asm_ab091
.asm_ab083
	move_player $01, Data_ab04c
	xor a
	scall PlayerFace
.asm_ab091
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_3d831
	startbattle Data_ab0f9, Data_ab023
	or a
	jp nz, .asm_ab0b0
	jp .asm_ab0f7
.asm_ab0b0
	writetext TreeBitstreamText_3d897
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab0cb
	move_person $02, Data_ab050, 1
	jp .asm_ab0d5
.asm_ab0cb
	move_person $02, Data_ab056, 1
.asm_ab0d5
	scall WaitNPCStep
	hideperson $02
	hideperson $03
	playmusic SONG_NONE
	playmusic SONG_WILD_BATTLE
	setevent EVENT_0B4
.asm_ab0f7
	pop bc
	ret

Data_ab0f9:
	dstr "(へいし)"

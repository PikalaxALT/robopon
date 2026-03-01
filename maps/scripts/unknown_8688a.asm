
Data_8682b:
	warpdef $08, $15, $02, $01, MAP_02_00, $1f, $09, $1f, $0a, SFX_2E

Data_86836: ; 86836
	person_event $19, $0c, $09, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0b, $0c, $03, $05, $01, $01, $01, $04, $00, NULL, NULL
	person_event $0b, $0c, $03, $06, $01, $01, $01, $04, $00, NULL, NULL
	person_event $0f, $0c, $0c, $06, $01, $01, $02, $04, $00, Func_86ac9, NULL

Data_8686e: ; 8686e
	person_event $0f, $04, $0e, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0e, $04, $01, $01, $02, $04, $00, Func_86b0d, NULL

Func_8688a::
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $2
	scall Func_80f24
	pop bc
	ld l, $1
	push hl
	ld c, $1
	ld e, $6
	ld a, $f
	scall Func_80f24
	pop bc
	loadpeople $2, Data_8686e
	hideperson 0
	loadwarps $1, Data_8682b
	checkevent $7
	or a
	jp nz, .asm_868d5
	loadpeople $4, Data_86836
	scall Func_8001c
	call Func_86943
	jp .asm_868dd

.asm_868d5: ; 868d5 (21:68d5)
	playmusic SONG_TOWN2
	scall Func_8001c
.asm_868dd: ; 868dd (21:68dd)
	ret

Data_868de:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $bc, $00, $00, $00, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $46, $03, $06, $07, $07, $00, $7e
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $bc, $00, $00, $00, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $05, $03, $06, $01, $06, $00, $2d
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_86907: ; 86907
	db $0b, $13, $0b, $08, $09, $08, $ff, $ff

Data_8690f: ; 8690f
	db $07, $05, $ff, $ff

Data_86913: ; 86913
	db $07, $06, $ff, $ff

Data_86917: ; 86917
	db $0e, $05, $0e, $08, $0c, $08, $ff, $ff

Data_8691f: ; 8691f
	db $0c, $0d, $ff, $ff

Data_86923: ; 86923
	db $04, $05, $ff, $ff

Data_86927: ; 86927
	db $04, $06, $04, $08, $ff, $ff

Data_8692d: ; 8692d
	db $04, $08, $ff, $ff

Data_86931: ; 86931
	db $06, $08, $ff, $ff

Data_86935: ; 86935
	db $06, $08, $06, $0d, $ff, $ff

Data_8693b: ; 8693b
	db $06, $0e, $ff, $ff

Data_8693f: ; 8693f
	db $09, $06, $ff, $ff

Func_86943: ; 86943 (21:6943)
	playmusic SONG_NONE
	playmusic SONG_TITLE
	scall WaitNPCStep
	move_player $1, Data_86907
	scall WaitNPCStep
	xor a
	scall PlayerFace
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	loademote $1, $1, $7
	playsfx $68
	scall WaitEmote
	writenpctext TreeBitstreamText_3a38a
	move_person $3, Data_8690f, 0
	move_person $4, Data_86913, 1
	scall WaitNPCStep
	sprite_face $3, $2
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writenpctext TreeBitstreamText_3a3ac
	writenpctext TreeBitstreamText_3a3c2
	sprite_face $2, $2
	writenpctext TreeBitstreamText_3a3dc
	startbattle Data_86ac4, Data_868de
	or a
	jp nz, .asm_869e7
	ret

.asm_869e7: ; 869e7 (21:69e7)
	playsfx $69
	writenpctext TreeBitstreamText_3a420
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_BEAUTY
	move_person $2, Data_86917, 1
	scall WaitNPCStep
	ld a, $1
	scall PlayerFace
	move_person $2, Data_8691f, 1
	scall WaitNPCStep
	hideperson $2
	xor a
	scall PlayerFace
	move_person $3, Data_86923, 1
	move_person $4, Data_86927, 1
	scall WaitNPCStep
	move_person $3, Data_8692d, 0
	move_person $4, Data_86931, 1
	scall WaitNPCStep
	ld a, $3
	scall PlayerFace
	move_person $3, Data_86935, 0
	move_person $4, Data_8693b, 1
	scall WaitNPCStep
	hideperson $3
	hideperson $4
	playmusic SONG_NONE
	playmusic SONG_TOWN2
	script_sleep $1e
	move_person $5, Data_8693f, 1
	scall WaitNPCStep
	sprite_face $2, $5
	script_sleep $1e
	xor a
	scall PlayerFace
	script_sleep $1e
	writenpctext TreeBitstreamText_3a481
	setevent $7
	ld a, $8
	ld [wc790], a
	ret

Data_86ac4:
	dstr "ヒﾞスコ"

Func_86ac9:
	ld a, e
	or a
	jp nz, .asm_86b0c
	sprite_face $1, $5
	sprite_face $0, $5
	sprite_face $3, $5
	sprite_face $2, $5
	script_sleep $1e
	sprite_face $3, $5
	sprite_face $0, $5
	sprite_face $1, $5
	sprite_face $2, $5
.asm_86b0c: ; 86b0c (21:6b0c)
	ret

Func_86b0d:
	ld a, e
	or a
	jp nz, .asm_86c00
	checkevent $d6
	or a
	jp nz, .asm_86bfa
	playsfx $5e
	loademote $2, $2, $8
	ld e, $4
	ld a, $e
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx $28
	showperson 0
	playsfx $60
	sprite_face $3, 0
	sprite_face $0, 0
	sprite_face $1, 0
	sprite_face $2, 0
	sprite_face $3, 0
	sprite_face $0, 0
	sprite_face $1, 0
	sprite_face $2, 0
	ld a, $f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $1
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep $1e
	ld c, $8
	ld e, $7
	ld a, $6
	scall Func_80e8d
	setevent $d6
	playsfx $60
	sprite_face $3, 0
	sprite_face $0, 0
	sprite_face $1, 0
	sprite_face $2, 0
	sprite_face $3, 0
	sprite_face $0, 0
	sprite_face $1, 0
	sprite_face $2, 0
	ld a, $f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $1
	scall FadeInAudio
	playmusic SONG_TOWN2
	face_player 0
	hideperson 0
	jp .asm_86c00

.asm_86bfa: ; 86bfa (21:6bfa)
	writetext TreeBitstreamText_3f79e
.asm_86c00: ; 86c00 (21:6c00)
	ret

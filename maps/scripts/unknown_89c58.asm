
Data_89bca:
	warpdef $09, $03, $01, $01, MAP_32_03, $03, $02, $03, $03, SFX_2E

Data_89bd5:
	db $21, $0e, $12, $03, $0d

Data_89bda:
IF DEF(SUN)
	wildbot $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	wildbot $00, $02, $14, $14, $1c, $08, $0a, $7f, $1f, $17, $11, $08, $09, $00
	wildbot $00, $02, $14, $14, $26, $08, $0a, $5a, $01, $00, $00, $01, $08, $00
	wildbot $00, $02, $14, $14, $07, $09, $0b, $45, $06, $06, $11, $01, $04, $00
	wildbot $00, $02, $14, $14, $03, $0a, $0c, $02, $0f, $17, $00, $02, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $14, $18, $07, $09, $17, $1f, $07, $18, $01, $0a, $00
	wildbot $00, $02, $14, $14, $38, $08, $0a, $18, $0d, $0b, $00, $01, $09, $00
	wildbot $00, $02, $14, $14, $34, $08, $0a, $19, $17, $05, $1e, $01, $08, $00
	wildbot $00, $02, $14, $14, $3a, $09, $0b, $17, $1f, $1e, $08, $01, $04, $00
	wildbot $00, $02, $14, $14, $58, $0a, $0c, $02, $1f, $17, $11, $02, $02, $00
ENDC

Data_89c20:
	person_event $0c, $0c, $10, $09, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0e, $0a, $01, $02, $00, $04, $01, Func_89d8a, NULL
	person_event $ff, $00, $09, $03, $01, $01, $00, $04, $00, Func_89ca9, NULL
	person_event $ff, $00, $0a, $03, $01, $01, $00, $04, $00, Func_89d04, NULL

Func_89c58:: ; 89c58
	loadwarps $01, Data_89bca
	ld e, $01
	ld hl, Data_89bd5
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_89bda
	loadpeople $04, Data_89c20
	playmusic SONG_TOWER
	ld a, $03
	ld [wc7e2], a
	checkevent $006b
	cp $01
	jp nz, .asm_89c9f
	hideperson 0
	hideperson $01
.asm_89c9f:
	scall Func_8001c
	landmarksign TreeBitstreamText_468ba
	ret

Func_89ca9:
	ld a, e
	or a
	jp nz, .asm_89d03
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_89cb8
	jp .asm_89d03
.asm_89cb8:
	checkevent $0059
	cp $01
	jp nz, .asm_89ccc
	writetext TreeBitstreamText_47037
	jp .asm_89d03
.asm_89ccc:
	ld a, $01
	ld [wc78a], a
	resetevent $00fc
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
.asm_89d03:
	ret

Func_89d04:
	ld a, e
	or a
	jp nz, .asm_89d54
	ld a, [wc790]
	or a
	jp z, .asm_89d21
	ld a, [wc790]
	cp $07
	jp nc, .asm_89d21
	writetext TreeBitstreamText_47041
	jp .asm_89d54
.asm_89d21:
	checkevent $0059
	or a
	jp nz, .asm_89d41
	setevent $0059
	playsfx SFX_32
	writetext TreeBitstreamText_47029
	jp .asm_89d54
.asm_89d41:
	resetevent $0059
	playsfx SFX_28
	writetext TreeBitstreamText_4701b
.asm_89d54:
	ret

Data_89d55:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $90, $01, $90, $02, $0a, $04, $17
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_89d7e:
	db $10, $0a, $ff, $ff

Data_89d82:
	db $10, $06, $09, $06, $09, $04, $ff, $ff

Func_89d8a:
	ld a, e
	cp $02
	jp nz, .asm_89df8
	checkevent $006b
	or a
	jp nz, .asm_89df8
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	move_player $01, Data_89d7e
	scall WaitNPCStep
	xor a
	scall PlayerFace
	writenpctext TreeBitstreamText_3af8c
	startbattle Data_89df9, Data_89d55
	or a
	jp nz, .asm_89dca
	jp .asm_89df8
.asm_89dca:
	setevent $006b
	writenpctext TreeBitstreamText_3afbf
	move_person 0, Data_89d82, 1
	playsfx SFX_2E
	scall WaitNPCStep
	hideperson 0
	playmusic SONG_NONE
	playmusic SONG_TOWER
.asm_89df8:
	ret

Data_89df9:
	dstr "チネン"

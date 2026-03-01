
Data_a9e12:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9e1d:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $10, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $10, $03, $00
ENDC

Data_a9e63:
	person_event $ff, $00, $0c, $15, $01, $01, $00, $04, $01, Func_a9e97, NULL

Func_a9e71:: ; a9e71
	loadwarps $01, Data_a9e12
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9e1d
	loadpeople $01, Data_a9e63
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9e97:
	ld a, e
	cp $02
	jp nz, .asm_a9ec6
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $12
	ld e, $13
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9ec6:
	ret

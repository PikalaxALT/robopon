
Data_a98f8:
	warpdef $14, $12, $01, $01, MAP_24_18, $0e, $15, $0d, $15, SFX_2E

Data_a9903:
IF DEF(SUN)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9949:
	person_event $ff, $00, $04, $08, $01, $01, $00, $04, $01, Func_a997d, NULL

Func_a9957:: ; a9957
	loadwarps $01, Data_a98f8
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9903
	loadpeople $01, Data_a9949
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a997d:
	ld a, e
	cp $02
	jp nz, .asm_a99ac
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_10, $05, $08
.asm_a99ac:
	ret

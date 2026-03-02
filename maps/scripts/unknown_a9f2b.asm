
Data_a9ec7:
	warpdef $15, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9ed2:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9f18:
	db $3b, $15, $03, $01, $31

Data_a9f1d:
	person_event $ff, $00, $05, $0f, $01, $01, $00, $04, $01, Func_a9f59, NULL

Func_a9f2b:: ; a9f2b
	loadwarps $01, Data_a9ec7
	ld e, $01
	ld hl, Data_a9f18
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9ed2
	loadpeople $01, Data_a9f1d
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9f59:
	ld a, e
	cp $02
	jp nz, .asm_a9f88
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_20, $0c, $15
.asm_a9f88:
	ret

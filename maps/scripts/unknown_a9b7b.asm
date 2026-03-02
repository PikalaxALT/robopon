
Data_a9b17:
	warpdef $0f, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9b22:
	db $37, $06, $0e, $01, $31

Data_a9b27:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9b6d:
	person_event $ff, $00, $05, $15, $01, $01, $00, $04, $01, Func_a9ba9, NULL

Func_a9b7b:: ; a9b7b
	loadwarps $01, Data_a9b17
	ld e, $01
	ld hl, Data_a9b22
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9b27
	loadpeople $01, Data_a9b6d
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9ba9:
	ld a, e
	cp $02
	jp nz, .asm_a9bd8
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_17, $05, $08
.asm_a9bd8
	ret

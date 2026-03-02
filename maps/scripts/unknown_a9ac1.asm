
Data_a9a62:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9a6d:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9ab3:
	person_event $ff, $00, $12, $0f, $01, $01, $00, $04, $01, Func_a9ae7, NULL

Func_a9ac1:: ; a9ac1
	loadwarps $01, Data_a9a62
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9a6d
	loadpeople $01, Data_a9ab3
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9ae7:
	ld a, e
	cp $02
	jp nz, .asm_a9b16
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_16, $05, $15
.asm_a9b16:
	ret

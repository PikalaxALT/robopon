
Data_a99ad:
	warpdef $02, $18, $01, $01, MAP_24_11, $02, $04, $02, $05, SFX_2E

Data_a99b8:
IF DEF(SUN)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a99fe:
	person_event $ff, $00, $0c, $08, $01, $01, $00, $04, $01, Func_a9a32, NULL

Func_a9a0c:: ; a9a0c
	loadwarps $01, Data_a99ad
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a99b8
	loadpeople $01, Data_a99fe
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9a32:
	ld a, e
	cp $02
	jp nz, .asm_a9a61
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_15, $12, $0f
	pop bc
.asm_a9a61:
	ret

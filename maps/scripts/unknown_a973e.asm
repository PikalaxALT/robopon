
Data_a96df:
	warpdef $04, $1a, $03, $01, MAP_24_00, $07, $0f, $07, $10, SFX_2E

Data_a96ea:
IF DEF(SUN)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9730:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9764, NULL

Func_a973e:: ; a973e
	loadwarps $01, Data_a96df
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a96ea
	loadpeople $01, Data_a9730
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9764:
	ld a, e
	cp $02
	jp nz, .asm_a9793
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_11, $12, $0c
.asm_a9793
	ret

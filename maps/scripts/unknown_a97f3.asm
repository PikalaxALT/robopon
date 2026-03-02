
Data_a9794:
	warpdef $02, $04, $01, $01, MAP_24_14, $02, $18, $03, $18, SFX_2E

Data_a979f:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0b, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0b, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0b, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0b, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0b, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a97e5:
	person_event $ff, $00, $12, $0c, $01, $01, $00, $04, $01, Func_a9819, NULL

Func_a97f3:: ; a97f3
	loadwarps $01, Data_a9794
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a979f
	loadpeople $01, Data_a97e5
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9819:
	ld a, e
	cp $02
	jp nz, .asm_a9848
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	warp_player MAP_24_12, $05, $14
	pop bc
.asm_a9848:
	ret

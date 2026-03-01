
Data_a9d50:
	warpdef $02, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9d5b:
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

Data_a9da1:
	db $3a, $02, $14, $01, $31

Data_a9da6:
	person_event $ff, $00, $12, $08, $01, $01, $00, $04, $01, Func_a9de2, NULL

Func_a9db4:: ; a9db4
	loadwarps $01, Data_a9d50
	ld e, $01
	ld hl, Data_a9da1
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9d5b
	loadpeople $01, Data_a9da6
	playmusic SONG_CAVE
	scall Func_8001c
	ret

Func_a9de2:
	ld a, e
	cp $02
	jp nz, .asm_a9e11
	playsfx SFX_31
	script_sleep 30
	scall StartShakingScreen
	playsfx SFX_64
	script_sleep 90
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $05
	ld e, $12
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9e11:
	ret

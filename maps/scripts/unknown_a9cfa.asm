
Data_a9c9b:
	warpdef $0e, $15, $01, $01, MAP_24_13, $14, $12, $14, $11, SFX_2E

Data_a9ca6:
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

Data_a9cec:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9d20, NULL

Func_a9cfa:: ; a9cfa
	loadwarps $01, Data_a9c9b
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9ca6
	loadpeople $01, Data_a9cec
	playmusic $08
	scall Func_8001c
	ret

Func_a9d20:
	ld a, e
	cp $02
	jp nz, .asm_a9d4f
	playsfx $31
	script_sleep 30
	scall StartShakingScreen
	playsfx $64
	script_sleep 90
	scall StopShakingScreen
	ld l, $0f
	push hl
	ld c, $05
	ld e, $15
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9d4f:
	ret

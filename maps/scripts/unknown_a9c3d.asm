
Data_a9bd9:
	warpdef $15, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, SFX_2E

Data_a9be4:
	db $38, $16, $07, $01, $31

Data_a9be9:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9c2f:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9c6b, NULL

Func_a9c3d:: ; a9c3d
	loadwarps $01, Data_a9bd9
	ld e, $01
	ld hl, Data_a9be4
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a9be9
	loadpeople $01, Data_a9c2f
	playmusic $08
	scall Func_8001c
	ret

Func_a9c6b:
	ld a, e
	cp $02
	jp nz, .asm_a9c9a
	playsfx $31
	script_sleep 30
	scall StartShakingScreen
	playsfx $64
	script_sleep 90
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $0c
	ld e, $0e
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9c9a:
	ret


Data_a9e12:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9e1d:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $10, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $10, $03, $00
ENDC

Data_a9e63:
	person_event $ff, $00, $0c, $15, $01, $01, $00, $04, $01, Func_a9e97, NULL

Func_a9e71:: ; a9e71
	ld e, $01
	ld hl, Data_a9e12
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9e1d
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9e63
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9e97:
	ld a, e
	cp $02
	jp nz, .asm_a9ec6
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $12
	ld e, $13
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9ec6:
	ret

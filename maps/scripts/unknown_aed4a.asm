
Data_aecf9:
	warpdef $01, $07, $01, $01, MAP_27_06, $01, $08, $01, $09, $2e

Data_aed04:
IF DEF(SUN)
	wildbot $00, $03, $10, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $10, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aed4a:: ; aed4a
	ld l, $00
	push hl
	ld c, $07
	ld e, $08
	ld a, $06
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $09
	ld a, $05
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $0c
	scall Func_80f24
	pop bc
	ld e, $01
	ld hl, Data_aecf9
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aed04
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031b
	scall LandmarkSign
	ret

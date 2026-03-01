
Data_ae90b:
	warpdef $14, $0c, $01, $01, MAP_27_02, $19, $14, $18, $14, $2e
	warpdef $19, $0c, $01, $01, MAP_27_02, $1e, $14, $1e, $13, $2e
	warpdef $11, $04, $01, $01, MAP_27_04, $09, $04, $08, $04, $2e
	warpdef $1e, $04, $01, $01, MAP_27_04, $16, $04, $15, $04, $2e

Data_ae937:
IF DEF(SUN)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ENDC

Func_ae97d:: ; ae97d
	ld e, $04
	ld hl, Data_ae90b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae937
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0317
	scall LandmarkSign
	ret

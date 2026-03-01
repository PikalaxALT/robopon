
Data_aea80:
	warpdef $0d, $0c, $01, $01, MAP_27_04, $01, $0c, $01, $0b, SFX_2E
	warpdef $01, $11, $01, $01, MAP_27_06, $09, $08, $09, $09, SFX_2E

Data_aea96:
	db $45, $19, $16, $02, $6c

Data_aea9b:
IF DEF(SUN)
	wildbot $00, $03, $1a, $15, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1a, $15, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $86, $32, $35, $7f, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aeae1:: ; aeae1
	ld e, $02
	ld hl, Data_aea80
	scall LoadWarps
	ld e, $01
	ld hl, Data_aea96
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aea9b
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0319
	scall LandmarkSign
	ret

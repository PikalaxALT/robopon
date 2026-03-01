
Data_ae875:
	warpdef $11, $0c, $01, $01, MAP_27_01, $0f, $0c, $0f, $0b, SFX_2E
	warpdef $16, $0c, $01, $01, MAP_27_01, $14, $0c, $14, $0b, SFX_2E
	warpdef $19, $14, $01, $01, MAP_27_03, $14, $0c, $14, $0d, SFX_2E
	warpdef $1e, $14, $01, $01, MAP_27_03, $19, $0c, $19, $0b, SFX_2E

Data_ae8a1:
IF DEF(SUN)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $49, $2b, $2e, $06, $02, $02, $02, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ENDC

Func_ae8e7:: ; ae8e7
	loadwarps $04, Data_ae875
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_ae8a1
	playmusic $08
	scall Func_8001c
	ld hl, $0316
	scall LandmarkSign
	ret

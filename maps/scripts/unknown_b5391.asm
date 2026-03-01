
Data_b5315:
	warpdef $00, $1d, $01, $03, MAP_30_02, $2f, $1e, $2e, $1e, SFX_2E
	warpdef $2e, $00, $02, $01, MAP_30_01, $2e, $1f, $2e, $1e, SFX_2E
	warpdef $18, $1e, $01, $01, MAP_11_00, $0e, $09, $0e, $0a, SFX_2E
	warpdef $2e, $1e, $01, $01, MAP_03_15, $04, $0a, $04, $0b, SFX_2E

Data_b5341:
	db $54, $07, $16, $02, $1f
	db $55, $01, $08, $01, $39

Data_b534b:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
ENDC

Func_b5391:: ; b5391
	ld a, $14
	ld [wc7e2], a
	loadwarps $04, Data_b5315
	ld e, $02
	ld hl, Data_b5341
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b534b
	playmusic SONG_0A
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

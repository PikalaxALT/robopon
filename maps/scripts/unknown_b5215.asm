
Data_b5194:
	warpdef $00, $03, $01, $03, MAP_30_00, $2f, $04, $2e, $04, $2e
	warpdef $2e, $1f, $02, $01, MAP_30_03, $2e, $00, $2e, $01, $2e
	warpdef $0a, $12, $01, $01, MAP_25_01, $13, $09, $13, $0a, $2e
	warpdef $2e, $04, $01, $01, MAP_08_01, $05, $16, $05, $17, $2e

Data_b51c0:
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0f, $0a, $00

Data_b5206:
	db $4f, $29, $04, $01, $44
	db $50, $1d, $0b, $01, $4e
	db $51, $25, $12, $01, $37

Func_b5215:: ; b5215
	ld a, $14
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_b5194
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b51c0
	scall LoadEncounters
	ld e, $03
	ld hl, Data_b5206
	scall Func_80ce7
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

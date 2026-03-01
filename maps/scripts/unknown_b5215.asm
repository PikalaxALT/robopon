
Data_b5194:
	warpdef $00, $03, $01, $03, MAP_30_00, $2f, $04, $2e, $04, SFX_2E
	warpdef $2e, $1f, $02, $01, MAP_30_03, $2e, $00, $2e, $01, SFX_2E
	warpdef $0a, $12, $01, $01, MAP_25_01, $13, $09, $13, $0a, SFX_2E
	warpdef $2e, $04, $01, $01, MAP_08_01, $05, $16, $05, $17, SFX_2E

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
	loadwarps $04, Data_b5194
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b51c0
	ld e, $03
	ld hl, Data_b5206
	scall Func_80ce7
	playmusic SONG_0A
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

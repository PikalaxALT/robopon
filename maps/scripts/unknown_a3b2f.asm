
Data_a3ad3:
	warpdef $0b, $0d, $01, $01, MAP_19_37, $0b, $0d, $0a, $0d, SFX_2E
	warpdef $01, $0d, $01, $01, MAP_19_39, $03, $21, $03, $20, SFX_2E

Data_a3ae9:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0d, $0c, $34, $16, $18, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0d, $0c, $57, $15, $17, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $0d, $0c, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $5f, $16, $18, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $2a, $17, $19, $10, $05, $05, $05, $04, $02, $00
ENDC

Func_a3b2f:: ; a3b2f
	loadwarps $02, Data_a3ad3
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_a3ae9
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_4695b
	ret

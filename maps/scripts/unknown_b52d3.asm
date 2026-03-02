
Data_b5245:
	warpdef $00, $00, $02, $01, MAP_30_00, $01, $1f, $01, $1e, SFX_2E
	warpdef $2f, $1d, $01, $03, MAP_30_03, $00, $1e, $01, $1e, SFX_2E
	warpdef $01, $10, $01, $01, MAP_22_01, $01, $06, $01, $07, SFX_2E
	warpdef $2d, $09, $01, $01, MAP_01_00, $07, $06, $07, $07, SFX_2E

Data_b5271:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ENDC

Data_b52b7:
	db $52, $0a, $11, $03, $27
	db $53, $0e, $1e, $01, $0f

Data_b52c1:
	dtext_tree_pointer TreeBitstreamText_4249f
	dw -1

Data_b52c5:
	person_event $26, $04, $01, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b52c1

Func_b52d3:: ; b52d3
	ld a, $14
	ld [wc7e2], a
	loadwarps $04, Data_b5245
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_b5271
	ld e, $02
	ld hl, Data_b52b7
	scall Func_80ce7
	checkevent EVENT_021
	or a
	jp nz, .asm_b5307
	loadpeople $01, Data_b52c5
.asm_b5307:
	playmusic SONG_0A
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

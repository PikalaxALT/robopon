
Data_b50b4:
	warpdef $00, $1f, $02, $01, MAP_30_02, $01, $00, $01, $01, SFX_2E
	warpdef $2f, $03, $01, $03, MAP_30_01, $00, $04, $01, $04, SFX_2E
	warpdef $0c, $0b, $01, $01, MAP_12_00, $0d, $0f, $0d, $0e, SFX_2E
	warpdef $25, $0b, $01, $01, MAP_02_00, $16, $07, $16, $08, SFX_2E
	warpdef $2d, $12, $01, $01, MAP_22_01, $0b, $06, $0b, $07, SFX_2E

Data_b50eb:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $66, $02, $02, $05, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $19, $23, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $14, $1e, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $66, $02, $02, $00, $0e, $0a, $00
ENDC

Data_b5131:
	db $4c, $10, $0a, $01, $32
	db $4d, $17, $03, $01, $45
	db $4e, $2c, $0c, $01, $41

Data_b5140:
	dtext_tree_pointer TreeBitstreamText_4249f
	dw -1

Data_b5144:
	person_event $26, $04, $2d, $12, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b5140

Func_b5152:: ; b5152
	ld a, $14
	ld [wc7e2], a
	ld e, $05
	ld hl, Data_b50b4
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b50eb
	scall LoadEncounters
	ld e, $03
	ld hl, Data_b5131
	scall Func_80ce7
	ld hl, $0021
	scall CheckEventFlag
	or a
	jp nz, .asm_b5186
	ld e, $01
	ld hl, Data_b5144
	scall LoadMapObjects
.asm_b5186:
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

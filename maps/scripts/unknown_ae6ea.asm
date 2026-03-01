
Data_ae675:
	warpdef $11, $1c, $03, $01, MAP_27_00, $09, $06, $09, $07, SFX_2E
	warpdef $0f, $0c, $01, $01, MAP_27_02, $11, $0c, $11, $0b, SFX_2E
	warpdef $14, $0c, $01, $01, MAP_27_02, $16, $0c, $17, $0c, SFX_2E

Data_ae696:
IF DEF(SUN)
	wildbot $00, $03, $22, $19, $48, $2a, $2d, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $22, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $12, $09, $00
	wildbot $00, $03, $22, $19, $49, $2b, $2e, $06, $02, $02, $02, $06, $08, $00
	wildbot $00, $03, $22, $19, $44, $2c, $2f, $7a, $14, $08, $00, $13, $07, $00
	wildbot $00, $03, $22, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $22, $19, $49, $2a, $2d, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $22, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $12, $09, $00
	wildbot $00, $03, $22, $19, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $08, $00
	wildbot $00, $03, $22, $19, $44, $2c, $2f, $7a, $14, $08, $00, $13, $07, $00
	wildbot $00, $03, $22, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $06, $00
ENDC

Data_ae6dc:
	person_event $0d, $0c, $0a, $11, $01, $01, $02, $04, $00, NULL, NULL

Func_ae6ea:: ; ae6ea
	loadwarps $03, Data_ae675
	ld a, $01
	scall LoadPlayerSprite
	checkevent $0033
	or a
	jp nz, .asm_ae720
	loadpeople $01, Data_ae6dc
	scall Func_8001c
	ld hl, $0315
	scall LandmarkSign
	call Func_ae74c
	setevent $0033
	jp .asm_ae73b
.asm_ae720:
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_ae696
	playmusic $08
	scall Func_8001c
	ld hl, $0315
	scall LandmarkSign
.asm_ae73b:
	ret

Data_ae73c:
	db $12, $17, $ff, $ff

Data_ae740:
	db $12, $15, $ff, $ff

Data_ae744:
	db $11, $1c, $ff, $ff

Data_ae748:
	db $0a, $15, $ff, $ff

Func_ae74c:
	playmusic SONG_NONE
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	xor a
	scall Func_80653
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	playmusic $01
	move_person 0, Data_ae748, 1
	scall WaitNPCStep
	ld hl, $0131
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld a, $01
	scall Func_80653
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	move_player $01, Data_ae73c
	scall WaitNPCStep
	move_person 0, Data_ae740, 1
	scall WaitNPCStep
	sprite_face $02, 0
	loademote $01, $01, $05
	ld e, $15
	ld a, $12
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0132
	scall PrintTextWithNPCName
	move_person 0, Data_ae744, 1
	scall WaitNPCStep
	hideperson 0
	playmusic SONG_NONE
	playmusic $08
	ret

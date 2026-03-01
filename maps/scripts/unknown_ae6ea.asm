
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
	ld e, $03
	ld hl, Data_ae675
	scall LoadWarps
	ld a, $01
	scall LoadPlayerSprite
	ld hl, $0033
	scall CheckEventFlag
	or a
	jp nz, .asm_ae720
	ld e, $01
	ld hl, Data_ae6dc
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $0315
	scall LandmarkSign
	call Func_ae74c
	ld e, $01
	ld hl, $0033
	scall EventFlagAction
	jp .asm_ae73b
.asm_ae720:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae696
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
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
	xor a
	scall PlayMusic
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
	ld a, $01
	scall PlayMusic
	ld bc, Data_ae748
	ld e, $2b
	xor a
	scall MovePersonAndWait
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
	ld c, $01
	ld de, Data_ae73c
	ld a, $2b
	scall MovePlayer
	scall WaitNPCStep
	ld bc, Data_ae740
	ld e, $2b
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $15
	ld a, $12
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0132
	scall PrintTextWithNPCName
	ld bc, Data_ae744
	ld e, $2b
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $08
	scall PlayMusic
	ret

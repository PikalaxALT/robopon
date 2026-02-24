
Data_a3d73:
	warpdef $04, $0c, $03, $01, MAP_19_20, $0c, $02, $0c, $03, $2e

Data_a3d7e:
IF DEF(SUN)
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
ENDC

Data_a3da8:
IF DEF(SUN)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $12, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ELIF DEF(STAR)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $2c, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ENDC

Func_a3dc4:: ; a3dc4
	ld e, $01
	ld hl, Data_a3d73
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a3d7e
	scall LoadEncounters
	ld hl, $00c7
	scall CheckEventFlag
	or a
	jp nz, .asm_a3e05
	ld e, $02
	ld hl, Data_a3da8
	scall LoadMapObjects
	ld a, $01
	ld [wc7da], a
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall Func_8001c
	call Func_a3e3c
	jp .asm_a3e08
.asm_a3e05:
	scall Func_8001c
.asm_a3e08:
	ret

Data_a3e09:
	db $05, $06, $ff, $ff

Data_a3e0d:
	db $06, $07, $05, $0b, $ff, $ff

Data_a3e13:
IF DEF(SUN)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $46
	db $07, $28, $07, $07, $07, $6a, $01, $0b
ELIF DEF(STAR)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $06
	db $07, $28, $03, $03, $01, $08, $01, $0b
ENDC

Func_a3e3c:
	ld hl, $043e
	scall PrintTextWithNPCName
	xor a
	ld [wc7da], a
	scall Func_80f02
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_a3e09
	ld a, $28
	scall MovePlayer
	scall WaitNPCStep
	ld de, Data_a3f51
	ld hl, Data_a3e13
	scall ScriptedBattle
	or a
	jp nz, label_a3e6a
	ret
label_a3e6a:
	ld hl, $043f
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $18
	scall PlayMusic
	ld bc, Data_a3e0d
	ld e, $28
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $12
	scall PlayMusic
	ld hl, $003c
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $06
	ld a, $05
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $05
	ld a, $05
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld bc, Data_a3e09
	ld e, $28
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $2a
	scall PlaySFX
	ld hl, $0440
	scall PrintTextStandard
	ld c, $28
	ld e, $00
IF DEF(SUN)
	ld a, $95
ELIF DEF(STAR)
	ld a, $96
ENDC
	scall GiveRobot
	cp $ff
	jp nz, label_a3f48
label_a3f48:
	ld e, $01
	ld hl, $00c7
	scall EventFlagAction
	ret

Data_a3f51:
	dstr "(なそﾞのしﾞんふﾞつ)"

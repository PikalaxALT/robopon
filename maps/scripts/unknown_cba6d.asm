
Data_cb9ed:
	warpdef $02, $0d, $01, $01, MAP_21_24, $02, $0d, $02, $0c, $2e

Data_cb9f8:
	db $35, $0e, $07, $03, $0b

Data_cb9fd:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1c, $1e, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1d, $1f, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1c, $1e, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1d, $1f, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1f, $21, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $20, $22, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $22, $24, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cba43:
	person_event $20, $0c, $0b, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $01, Func_cbac1, NULL
	person_event $ff, $00, $0e, $03, $01, $01, $00, $04, $00, Func_cbb24, NULL

Func_cba6d:: ; cba6d
	ld e, $01
	ld hl, Data_cb9ed
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb9f8
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb9fd
	scall LoadEncounters
	ld e, $03
	ld hl, Data_cba43
	scall LoadMapObjects
	ld hl, $0016
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cbaaa
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_cbaaa:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0304
	scall LandmarkSign
	ret

Data_cbab9:
	db $09, $04, $ff, $ff

Data_cbabd:
	db $0e, $04, $ff, $ff

Func_cbac1:
	ld a, e
	cp $02
	jp nz, .asm_cbb23
	ld hl, $0016
	scall CheckEventFlag
	or a
	jp nz, .asm_cbb23
	xor a
	scall PlayMusic
	ld e, $03
	xor a
	scall SpriteFace
	ld c, $01
	ld de, Data_cbab9
	ld a, $32
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayMusic
	ld hl, $00df
	scall PrintTextWithNPCName
	ld bc, Data_cbabd
	ld e, $32
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0016
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cbb23:
	ret

Func_cbb24:
	ld a, e
	or a
	jp nz, .asm_cbb5e
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_cbb33
	jp .asm_cbb5e
.asm_cbb33:
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $09
	scall LoadEmote
	ld a, $5a
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld l, $06
	push hl
	ld c, $07
	ld e, $00
	ld a, $1c
	scall Func_80dff
	pop bc
	ld hl, $001e
	scall ScriptSleep
.asm_cbb5e:
	ret

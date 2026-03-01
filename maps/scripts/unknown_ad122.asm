
Data_ad0b4:
	warpdef $06, $0c, $04, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $07, $05, $02, $01, MAP_30_13, $0d, $0f, $0d, $0e, SFX_2E

Data_ad0ca:
	wildbot $04, $06, $0b, $17, $69, $24, $27, $7a, $05, $0f, $00, $10, $0a, $00
	wildbot $04, $06, $0b, $17, $31, $24, $27, $7a, $06, $1e, $00, $11, $0a, $00
	wildbot $04, $06, $0b, $17, $43, $24, $27, $7a, $06, $07, $00, $10, $0a, $00

Data_ad0f4:
	dtext_tree_pointer TreeBitstreamText_466f0
	dw -1

Data_ad0f8:
	person_event $ff, $00, $06, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b, Data_ad0f4
	person_event $ff, $00, $09, $0b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b, Data_ad0f4

Data_ad114:
	person_event $19, $0c, $08, $05, $01, $01, $02, $04, $00, NULL, NULL

Func_ad122:: ; ad122
	ld a, $0f
	ld [wc7e2], a
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_ad0ca
	scall LoadEncounters
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ad152
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ad152
	ld e, $01
	ld hl, Data_ad114
	scall LoadMapObjects
	call Func_ad225
	jp .asm_ad1c5
.asm_ad152:
	ld e, $02
	ld hl, Data_ad0b4
	scall LoadWarps
	ld e, $02
	ld hl, Data_ad0f8
	scall LoadMapObjects
	ld hl, $0034
	scall CheckEventFlag
	or a
	jp nz, .asm_ad18a
	xor a
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	xor a
	scall Func_80653
	scall StartShakingScreen
	ld a, $65
	scall PlaySFX
	scall Func_8001c
	call Func_ad1c6
	jp .asm_ad1c5
.asm_ad18a:
	ld hl, $00c3
	scall CheckEventFlag
	or a
	jp nz, .asm_ad1b8
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ad1b8
	ld hl, $0035
	scall CheckEventFlag
	or a
	jp nz, .asm_ad1b8
	scall Func_8001c
	call Func_ad302
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	jp .asm_ad1c5
.asm_ad1b8:
	ld a, $01
	scall LoadPlayerSprite
	ld a, $13
	scall PlayMusic
	scall Func_8001c
.asm_ad1c5:
	ret

Func_ad1c6:
	ld a, $65
	scall PlaySFX
	ld c, $05
	ld e, $02
	ld a, $14
	scall LoadEmote
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	ld a, $65
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $14
	scall LoadEmote
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $65
	scall PlaySFX
	ld hl, $0128
	scall PrintTextWithNPCName
	scall StopShakingScreen
	ld l, $0a
	push hl
	ld c, $09
	ld e, $02
	ld a, $1f
	scall Func_80dff
	pop bc
	ret

Data_ad215:
	db $08, $08, $ff, $ff

Data_ad219:
	db $07, $08, $ff, $ff

Data_ad21d:
	db $08, $0c, $ff, $ff

Data_ad221:
	db $07, $0c, $ff, $ff

Func_ad225:
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	xor a
	scall Func_80653
	scall StartShakingScreen
	scall Func_8001c
	ld hl, $0078
	scall ScriptSleep
	ld a, $65
	scall PlaySFX
	ld c, $05
	ld e, $02
	ld a, $14
	scall LoadEmote
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld bc, Data_ad215
	ld e, $2b
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $65
	scall PlaySFX
	ld c, $05
	ld e, $02
	ld a, $14
	scall LoadEmote
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld a, $02
	scall PlayerFace
	ld a, $01
	scall Func_80653
	ld a, $65
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $14
	scall LoadEmote
	ld e, $05
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld c, $01
	ld de, Data_ad219
	ld a, $2b
	scall MovePlayer
	ld bc, Data_ad21d
	ld e, $2b
	xor a
	scall MovePerson
	ld c, $01
	ld de, Data_ad221
	ld a, $2b
	scall MovePlayer
	scall WaitNPCStep
	scall StopShakingScreen
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	xor a
	scall PlayMusic
	ld l, $05
	push hl
	ld c, $04
	ld e, $02
	xor a
	scall Func_80dff
	pop bc
	ret
Func_ad302:
	ld l, $06
	push hl
	ld c, $19
	ld e, $01
	ld a, $19
	scall Func_80dff
	pop bc
	ret

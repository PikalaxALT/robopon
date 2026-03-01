
Data_a50b4:
	warpdef $14, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, SFX_2E
	warpdef $06, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, SFX_34

Data_a50ca:
	dtext_tree_pointer TreeBitstreamText_46686
	dw -1

Data_a50ce:
	dtext_tree_pointer TreeBitstreamText_466b3
	dw -1

Data_a50d2:
	person_event $02, $0c, $08, $06, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $12, $05, $01, $01, $00, $04, $01, Func_a5264, NULL
	person_event $ff, $00, $09, $0d, $01, $01, $00, $04, $01, Func_a5264, NULL

Data_a50fc:
	person_event $ff, $00, $13, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ca
	person_event $ff, $00, $13, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ce

Data_a5118:
	person_event $ff, $00, $09, $0f, $01, $01, $00, $04, $01, Func_a5398, NULL

Func_a5126:: ; a5126
	ld a, $0a
	ld [wc7e2], a
	ld e, $02
	ld hl, Data_a50b4
	scall LoadWarps
	ld a, $03
	scall PlayMusic
	ld hl, $002e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a5163
	ld hl, $002f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a5163
	ld hl, $0044
	scall CheckEventFlag
	or a
	jp nz, .asm_a5163
	ld e, $03
	ld hl, Data_a50d2
	scall LoadMapObjects
	jp .asm_a516b
.asm_a5163:
	ld e, $01
	ld hl, Data_a5118
	scall LoadMapObjects
.asm_a516b:
	ld a, $01
	scall LoadPlayerSprite
	ld e, $02
	ld hl, Data_a50fc
	scall LoadMapObjects
	scall Func_8001c
	ret

Func_a517c:: ; a517c
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $11
	scall LoadEmote
	scall WaitEmote
	ld hl, $003c
	scall ScriptSleep
	pop af
	push af
	cp $02
	jp z, .asm_a51f7
	cp $01
	jp z, .asm_a51d6
	or a
	jp nz, .asm_a5223
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0332
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld hl, $0336
	scall PrintTextWithNPCName
	jp .asm_a5223
.asm_a51d6:
	ld c, $01
	ld e, $02
	ld a, $11
	scall LoadEmote
	scall WaitEmote
	ld hl, $0333
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
	ld hl, $0336
	scall PrintTextWithNPCName
	jp .asm_a5223
.asm_a51f7:
	ld c, $01
	ld e, $02
	ld a, $11
	scall LoadEmote
	scall WaitEmote
	ld hl, $003c
	scall ScriptSleep
	ld a, $28
	scall PlaySFX
	ld c, $01
	ld e, $04
	ld a, $11
	scall LoadEmote
	xor a
	scall PlayMusic
	ld a, $15
	scall PlayMusic
	scall WaitEmote
.asm_a5223:
	scall HideEmote
	pop af
	cp $02
	jp nz, .asm_a5247
	ld a, $45
	scall PlaySFX
	ld hl, $032e
	scall PrintTextWithNPCName
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
	jp .asm_a524c
.asm_a5247:
	ld a, $01
	scall Func_80653
.asm_a524c:
	ret

Data_a524d:
	db $0c, $06, $ff, $ff

Data_a5251:
	db $09, $06, $0c, $06, $ff

Data_a5256:
	db $09, $06, $ff, $ff

Data_a525a:
	db $09, $05, $12, $05, $ff, $ff

Data_a5260:
	db $0b, $06, $ff, $ff

Func_a5264:
	push af
	ld a, e
	cp $02
	jp nz, .asm_a5383
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_a5289
	ld c, $01
	ld de, Data_a524d
	ld a, $29
	scall MovePlayer
	jp .asm_a5293
.asm_a5289:
	ld c, $01
	ld de, Data_a5251
	ld a, $29
	scall MovePlayer
.asm_a5293:
	ld bc, Data_a5256
	ld e, $29
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $003c
	scall ScriptSleep
	ld e, $01
	xor a
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0109
	scall PrintTextWithNPCName
	ld a, $01
	scall FadeInAudio
	ld a, $1b
	scall PlayMusic
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld a, $5b
	scall PlaySFX
	ld c, $01
	ld e, $0f
	ld a, $15
	scall LoadEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	xor a
	scall Func_80653
	ld hl, $003c
	scall ScriptSleep
	ld a, $46
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $46
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld a, $46
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall WaitEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld a, $01
	scall Func_80653
	scall HideEmote
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld hl, $010a
	scall PrintTextWithNPCName
	scall StartShakingScreen
	ld a, $65
	scall PlaySFX
	xor a
	scall PlayMusic
	ld a, $1b
	scall PlayMusic
	ld bc, Data_a525a
	ld e, $29
	xor a
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $65
	scall PlaySFX
	ld c, $01
	ld de, Data_a5260
	ld a, $29
	scall MovePlayer
	scall WaitNPCStep
	ld l, $06
	push hl
	ld c, $16
	ld e, $00
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a5383:
	pop bc
	ret

Func_a5385:
	ld a, $45
	scall PlaySFX
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
	ret

Func_a5398:
	ld a, e
	cp $02
	jp nz, .asm_a53dd
	ld hl, $002d
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a53dd
	ld a, $2a
	scall Func_80e5d
	or a
	jp z, .asm_a53d7
	ld hl, $0334
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a53d4
	ld a, $45
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	ld l, $18
	push hl
	ld c, $13
	ld e, $00
	ld a, $17
	scall Func_80dff
	pop bc
.asm_a53d4:
	jp .asm_a53dd
.asm_a53d7:
	ld hl, $0335
	scall PrintTextStandard
.asm_a53dd:
	ret

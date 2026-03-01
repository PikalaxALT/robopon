
Data_a90b4:
	warpdef $20, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $11, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, $34
	warpdef $0e, $13, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $12, $13, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $14, $1a, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $18, $1a, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $09, $10, $01, $01, MAP_32_02, $01, $0a, $01, $09, $34
	warpdef $1e, $19, $01, $01, MAP_32_02, $01, $0a, $01, $09, $34
	warpdef $06, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $0a, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $0e, $1b, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $17, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $1b, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $1f, $11, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $07, $0f, $01, $01, MAP_24_10, $05, $1a, $05, $19, $34

Data_a9159:
	dw $20f
	dw -1

Data_a915d:
	dw $215
	dw -1

Data_a9161:
	dw $202
	dw -1

Data_a9165:
	dw $20b
	dw -1

Data_a9169:
	dw $201
	dw -1

Data_a916d:
	dw $208
	dw -1

Data_a9171:
	dw $210
	dw -1

Data_a9175:
	dw $2c0
	dw -1

Data_a9179:
	db $5c, $10, $13, $11, $46
	db $5d, $08, $1b, $11, $4f

Data_a9183:
	person_event $00, $04, $08, $1f, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_a9159
	person_event $02, $04, $1b, $18, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a915d
	person_event $27, $04, $11, $1a, $01, $01, $03, $04, $00, Func_a94fe, NULL
	person_event $04, $04, $16, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9161
	person_event $04, $04, $1f, $15, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_a9165
	person_event $26, $04, $06, $0f, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9169
	person_event $26, $04, $0c, $15, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a916d
	person_event $27, $04, $06, $17, $01, $01, $03, $04, $00, PrintTextFacePlayer_2a, Data_a9171
	person_event $ff, $00, $1f, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $ff, $00, $1f, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_a9175
	person_event $0f, $04, $06, $1f, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $06, $1f, $01, $01, $02, $04, $00, Func_a95d7, NULL

Func_a922b:: ; a922b
	call Func_a933a
	ld hl, Func_a933a
	scall Func_80f11
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $14
	ld a, $0c
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1c
	ld a, $0f
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1b
	ld a, $12
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $14
	ld a, $13
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $12
	ld a, $15
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $11
	ld a, $19
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1a
	ld a, $1c
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $01
	ld e, $1b
	ld a, $19
	scall Func_80f24
	pop bc
	ld e, $0f
	ld hl, Data_a90b4
	scall LoadWarps
	ld a, $01
	scall LoadPlayerSprite
	ld a, $0a
	ld [wc7e2], a
	ld a, $07
	ld [wc789], a
	ld hl, $0044
	scall CheckEventFlag
	or a
	jp nz, .asm_a92e4
	xor a
	scall PlayMusic
	scall Func_8001c
	call Func_a93b6
	jp .asm_a9303
.asm_a92e4:
	ld e, $02
	ld hl, Data_a9179
	scall Func_80ce7
	ld e, $0c
	ld hl, Data_a9183
	scall LoadMapObjects
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	ld a, $03
	scall PlayMusic
	scall Func_8001c
.asm_a9303:
	ret

Data_a9304:
	db $16, $0e, $03, $01, $16, $0f

Data_a930a:
	db $16, $0e, $01, $01, $1a, $0f

Data_a9310:
	db $0d, $0f, $06, $01, $10, $10

Data_a9316:
	db $11, $0f, $02, $01, $14, $11

Data_a931c:
	db $1e, $0f, $03, $01, $16, $0f

Data_a9322:
	db $1e, $0f, $01, $01, $1a, $0f

Data_a9328:
	db $1a, $14, $03, $01, $13, $10

Data_a932e:
	db $0d, $10, $03, $01, $10, $10

Data_a9334:
	db $1a, $14, $02, $01, $14, $11

Func_a933a:
	ld hl, $00bf
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a9351
	ld hl, Data_a931c
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9351:
	ld hl, $00c1
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a9368
	ld hl, Data_a9322
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9368:
	ld hl, $0044
	scall CheckEventFlag
	or a
	jp nz, .asm_a9390
	ld hl, Data_a9304
	scall Func_80d9b
	ld hl, Data_a930a
	scall Func_80d9b
	ld hl, Data_a9310
	scall Func_80d9b
	ld hl, Data_a9316
	scall Func_80d9b
	scall Func_80f02
	jp .asm_a93b1
.asm_a9390:
	ld hl, Data_a931c
	scall Func_80d9b
	ld hl, Data_a9322
	scall Func_80d9b
	ld hl, Data_a9328
	scall Func_80d9b
	ld hl, Data_a932e
	scall Func_80d9b
	ld hl, Data_a9334
	scall Func_80d9b
	scall Func_80f02
.asm_a93b1:
	ret

Data_a93b2:
	db $14, $0f, $ff, $ff

Func_a93b6:
	call Func_a933a
	scall Func_80f02
	ld a, $65
	scall PlaySFX
	scall StartShakingScreen
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld a, $24
	scall PlaySFX
	scall WaitEmote
	ld hl, $001e
	scall ScriptSleep
	scall HideEmote
	scall StopShakingScreen
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_a93ee:
	cp $05
	jp nc, .asm_a9400
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_a93ee
.asm_a9400:
	scall StartShakingScreen
	ld hl, $001e
	scall ScriptSleep
	ld a, $45
	scall PlaySFX
	ld c, $01
	ld e, $04
	ld a, $12
	scall LoadEmote
	ld e, $16
	ld a, $18
	scall MoveEmote
	ld e, $01
	ld hl, $00bf
	scall EventFlagAction
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld a, $45
	scall PlaySFX
	ld c, $01
	ld e, $04
	ld a, $12
	scall LoadEmote
	ld e, $16
	ld a, $1b
	scall MoveEmote
	ld e, $00
	ld hl, $00bf
	scall EventFlagAction
	ld e, $01
	ld hl, $00c1
	scall EventFlagAction
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	scall HideEmote
	scall StopShakingScreen
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_a9473:
	cp $02
	jp nc, .asm_a9485
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_a9473
.asm_a9485:
	scall StartShakingScreen
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld e, $08
	ld a, $12
	scall LoadEmote
	ld e, $16
	ld a, $17
	scall MoveEmote
	ld a, $45
	scall PlaySFX
	ld e, $00
	ld hl, $00c1
	scall EventFlagAction
	ld e, $01
	ld hl, $0044
	scall EventFlagAction
	call Func_a933a
	scall Func_80f02
	scall WaitEmote
	ld hl, $001e
	scall ScriptSleep
	scall HideEmote
	scall StopShakingScreen
	xor a
.asm_a94c9:
	cp $07
	jp nc, .asm_a94da
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_a94c9
.asm_a94da:
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_a93b2
	ld a, $2a
	scall MovePlayer
	ld hl, $001e
	scall ScriptSleep
	ld l, $0f
	push hl
	ld c, $14
	ld e, $00
	ld a, $18
	scall Func_80dff
	pop bc
	ret

Func_a94fe:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_a95d4
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	ld a, [wc796]
	cp $0e
	jp nz, .asm_a9599
	ld a, $83
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a9596
	ld hl, $0415
	scall PrintTextWithNPCName
	ld a, $83
	scall Func_80e7d
	cp $01
	jp nz, .asm_a958d
	ld hl, $0294
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a957c
	ld a, $68
	scall PlaySFX
	ld hl, $040a
	scall PrintTextWithNPCName
	ld hl, sp+$01
	ld l, [hl]
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	ld a, l
	push af
	ld c, $00
	ld e, $01
	ld hl, sp+$03
	ld a, [hl]
	scall GiveRobot
	pop af
	ld c, a
	ld e, $00
IF DEF(SUN)
	ld a, $a9
ELIF DEF(STAR)
	ld a, $aa
ENDC
	scall GiveRobot
	ld a, $0f
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a958a
.asm_a957c:
	ld a, $69
	scall PlaySFX
	ld hl, $040b
	scall PrintTextWithNPCName
	jp .asm_a95d4
.asm_a958a:
	jp .asm_a9596
.asm_a958d:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_a95d4
.asm_a9596:
	jp .asm_a95af
.asm_a9599:
	ld a, $83
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a95af
	ld hl, $0140
	scall PrintTextStandard
	jp .asm_a95d4
.asm_a95af:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_a95d4
	ld a, [wc796]
	cp $0f
	jp nz, .asm_a95c8
	ld hl, $0430
	scall PrintTextWithNPCName
	jp .asm_a95d4
.asm_a95c8:
	ld hl, $0415
	scall PrintTextWithNPCName
	ld hl, $042a
	scall PrintTextWithNPCName
.asm_a95d4:
	pop bc
	pop bc
	ret

Func_a95d7:
	ld a, e
	or a
	jp nz, .asm_a96de
	ld hl, $00de
	scall CheckEventFlag
	or a
	jp nz, .asm_a96d8
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $1f
	ld a, $06
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $0a
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $0a
	scall SpriteFace
	ld e, $00
	ld a, $0a
	scall SpriteFace
	ld e, $01
	ld a, $0a
	scall SpriteFace
	ld e, $02
	ld a, $0a
	scall SpriteFace
	ld e, $03
	ld a, $0a
	scall SpriteFace
	ld e, $00
	ld a, $0a
	scall SpriteFace
	ld e, $01
	ld a, $0a
	scall SpriteFace
	ld e, $02
	ld a, $0a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ld a, $0a
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $0d
	ld e, $14
	ld a, $0a
	scall Func_80e8d
	ld e, $01
	ld hl, $00de
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $0a
	scall SpriteFace
	ld e, $00
	ld a, $0a
	scall SpriteFace
	ld e, $01
	ld a, $0a
	scall SpriteFace
	ld e, $02
	ld a, $0a
	scall SpriteFace
	ld e, $03
	ld a, $0a
	scall SpriteFace
	ld e, $00
	ld a, $0a
	scall SpriteFace
	ld e, $01
	ld a, $0a
	scall SpriteFace
	ld e, $02
	ld a, $0a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $03
	scall PlayMusic
	ld a, $0a
	scall FacePlayer
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	jp .asm_a96de
.asm_a96d8:
	ld hl, $015c
	scall PrintTextStandard
.asm_a96de:
	ret

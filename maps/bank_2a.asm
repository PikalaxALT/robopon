INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2a", ROMX
	script_library 2a

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

Data_a96df:
	warpdef $04, $1a, $03, $01, MAP_24_00, $07, $0f, $07, $10, $2e

Data_a96ea:
IF DEF(SUN)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9730:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9764, NULL

Func_a973e:: ; a973e
	ld e, $01
	ld hl, Data_a96df
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a96ea
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9730
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9764:
	ld a, e
	cp $02
	jp nz, .asm_a9793
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $0c
	push hl
	ld c, $12
	ld e, $0b
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9793:
	ret

Data_a9794:
	warpdef $02, $04, $01, $01, MAP_24_14, $02, $18, $03, $18, $2e

Data_a979f:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0b, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0b, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0b, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0b, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0b, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $0e, $03, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $0e, $03, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $0e, $03, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $0e, $03, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $0e, $03, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a97e5:
	person_event $ff, $00, $12, $0c, $01, $01, $00, $04, $01, Func_a9819, NULL

Func_a97f3:: ; a97f3
	ld e, $01
	ld hl, Data_a9794
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a979f
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a97e5
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9819:
	ld a, e
	cp $02
	jp nz, .asm_a9848
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $14
	push hl
	ld c, $05
	ld e, $0c
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9848:
	ret

Data_a9849:
	db $36, $0f, $04, $01, $31

Data_a984e:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9894:
	person_event $ff, $00, $05, $14, $01, $01, $00, $04, $01, Func_a98c8, NULL

Func_a98a2:: ; a98a2
	ld e, $01
	ld hl, Data_a9849
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a984e
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9894
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a98c8:
	ld a, e
	cp $02
	jp nz, .asm_a98f7
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $04
	ld e, $0d
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a98f7:
	ret

Data_a98f8:
	warpdef $14, $12, $01, $01, MAP_24_18, $0e, $15, $0d, $15, $2e

Data_a9903:
IF DEF(SUN)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $0a, $07, $0d, $0e, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $0a, $07, $0d, $0e, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $0a, $07, $0d, $0e, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $0a, $07, $0d, $0e, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $0a, $07, $0d, $0e, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9949:
	person_event $ff, $00, $04, $08, $01, $01, $00, $04, $01, Func_a997d, NULL

Func_a9957:: ; a9957
	ld e, $01
	ld hl, Data_a98f8
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9903
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9949
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a997d:
	ld a, e
	cp $02
	jp nz, .asm_a99ac
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $05
	ld e, $0a
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a99ac:
	ret

Data_a99ad:
	warpdef $02, $18, $01, $01, MAP_24_11, $02, $04, $02, $05, $2e

Data_a99b8:
IF DEF(SUN)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $0e, $0e, $0d, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $0e, $0e, $0d, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $0e, $0e, $0d, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $0e, $0e, $0d, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $0e, $0e, $0d, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a99fe:
	person_event $ff, $00, $0c, $08, $01, $01, $00, $04, $01, Func_a9a32, NULL

Func_a9a0c:: ; a9a0c
	ld e, $01
	ld hl, Data_a99ad
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a99b8
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a99fe
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9a32:
	ld a, e
	cp $02
	jp nz, .asm_a9a61
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $0f
	push hl
	ld c, $12
	ld e, $0f
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9a61:
	ret

Data_a9a62:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9a6d:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0e, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $0d, $0e, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $0d, $0e, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $0d, $0e, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $0d, $0e, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9ab3:
	person_event $ff, $00, $12, $0f, $01, $01, $00, $04, $01, Func_a9ae7, NULL

Func_a9ac1:: ; a9ac1
	ld e, $01
	ld hl, Data_a9a62
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9a6d
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9ab3
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9ae7:
	ld a, e
	cp $02
	jp nz, .asm_a9b16
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $15
	push hl
	ld c, $05
	ld e, $10
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9b16:
	ret

Data_a9b17:
	warpdef $0f, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9b22:
	db $37, $06, $0e, $01, $31

Data_a9b27:
IF DEF(SUN)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $04, $03, $0e, $0c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $04, $03, $0e, $0c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $04, $03, $0e, $0c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $04, $03, $0e, $0c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $04, $03, $0e, $0c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9b6d:
	person_event $ff, $00, $05, $15, $01, $01, $00, $04, $01, Func_a9ba9, NULL

Func_a9b7b:: ; a9b7b
	ld e, $01
	ld hl, Data_a9b17
	scall LoadWarps
	ld e, $01
	ld hl, Data_a9b22
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9b27
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9b6d
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9ba9:
	ld a, e
	cp $02
	jp nz, .asm_a9bd8
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $05
	ld e, $11
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9bd8:
	ret

Data_a9bd9:
	warpdef $15, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9be4:
	db $38, $16, $07, $01, $31

Data_a9be9:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $1f, $21, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $20, $22, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $23, $25, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $1f, $21, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $1f, $21, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $20, $22, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $21, $23, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $23, $25, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9c2f:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9c6b, NULL

Func_a9c3d:: ; a9c3d
	ld e, $01
	ld hl, Data_a9bd9
	scall LoadWarps
	ld e, $01
	ld hl, Data_a9be4
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9be9
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9c2f
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9c6b:
	ld a, e
	cp $02
	jp nz, .asm_a9c9a
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $0c
	ld e, $0e
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9c9a:
	ret

Data_a9c9b:
	warpdef $0e, $15, $01, $01, MAP_24_13, $14, $12, $14, $11, $2e

Data_a9ca6:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9cec:
	person_event $ff, $00, $05, $08, $01, $01, $00, $04, $01, Func_a9d20, NULL

Func_a9cfa:: ; a9cfa
	ld e, $01
	ld hl, Data_a9c9b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9ca6
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9cec
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9d20:
	ld a, e
	cp $02
	jp nz, .asm_a9d4f
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $0f
	push hl
	ld c, $05
	ld e, $15
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9d4f:
	ret

Data_a9d50:
	warpdef $02, $12, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9d5b:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9da1:
	db $3a, $02, $14, $01, $31

Data_a9da6:
	person_event $ff, $00, $12, $08, $01, $01, $00, $04, $01, Func_a9de2, NULL

Func_a9db4:: ; a9db4
	ld e, $01
	ld hl, Data_a9d50
	scall LoadWarps
	ld e, $01
	ld hl, Data_a9da1
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9d5b
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9da6
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9de2:
	ld a, e
	cp $02
	jp nz, .asm_a9e11
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $05
	ld e, $12
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9e11:
	ret

Data_a9e12:
	warpdef $02, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9e1d:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $79, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $10, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $10, $03, $00
ENDC

Data_a9e63:
	person_event $ff, $00, $0c, $15, $01, $01, $00, $04, $01, Func_a9e97, NULL

Func_a9e71:: ; a9e71
	ld e, $01
	ld hl, Data_a9e12
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9e1d
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9e63
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9e97:
	ld a, e
	cp $02
	jp nz, .asm_a9ec6
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $08
	push hl
	ld c, $12
	ld e, $13
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9ec6:
	ret

Data_a9ec7:
	warpdef $15, $05, $01, $01, MAP_24_22, $05, $08, $04, $08, $2e

Data_a9ed2:
IF DEF(SUN)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $05, $20, $22, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $23, $21, $23, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $06, $24, $26, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1c, $1c, $4e, $20, $22, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $00, $1c, $1c, $46, $20, $22, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $00, $1c, $1c, $25, $21, $23, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $00, $1c, $1c, $24, $22, $24, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $00, $1c, $1c, $47, $24, $26, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_a9f18:
	db $3b, $15, $03, $01, $31

Data_a9f1d:
	person_event $ff, $00, $05, $0f, $01, $01, $00, $04, $01, Func_a9f59, NULL

Func_a9f2b:: ; a9f2b
	ld e, $01
	ld hl, Data_a9ec7
	scall LoadWarps
	ld e, $01
	ld hl, Data_a9f18
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a9ed2
	scall LoadEncounters
	ld e, $01
	ld hl, Data_a9f1d
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Func_a9f59:
	ld a, e
	cp $02
	jp nz, .asm_a9f88
	ld a, $31
	scall PlaySFX
	ld hl, $001e
	scall ScriptSleep
	scall StartShakingScreen
	ld a, $64
	scall PlaySFX
	ld hl, $005a
	scall ScriptSleep
	scall StopShakingScreen
	ld l, $15
	push hl
	ld c, $0c
	ld e, $14
	ld a, $18
	scall Func_80dff
	pop bc
.asm_a9f88:
	ret

Data_a9f89:
	warpdef $05, $08, $01, $01, MAP_24_15, $02, $05, $02, $06, $2e
	warpdef $05, $08, $01, $01, MAP_24_16, $0f, $05, $0e, $05, $2e
	warpdef $05, $08, $01, $01, MAP_24_17, $15, $12, $15, $11, $2e
	warpdef $05, $08, $01, $01, MAP_24_19, $02, $12, $02, $11, $2e
	warpdef $05, $08, $01, $01, MAP_24_20, $02, $05, $03, $05, $2e
	warpdef $05, $08, $01, $01, MAP_24_21, $15, $05, $15, $06, $2e

Data_a9fcb:
	db $71, $02, $06, $01, $2d
	db $72, $03, $06, $01, $2b
	db $73, $04, $06, $01, $2d

Data_a9fda:
	db $74, $02, $06, $01, $2c
	db $75, $03, $06, $01, $2d
	db $76, $04, $06, $01, $2e

Data_a9fe9:
	db $77, $02, $06, $01, $2d
	db $78, $03, $06, $01, $2d
	db $79, $04, $06, $01, $2b

Data_a9ff8:
	db $7a, $02, $06, $01, $2e
	db $7b, $03, $06, $01, $2c
	db $7c, $04, $06, $01, $2d

Data_aa007:
	db $7d, $02, $06, $01, $2b
	db $7e, $03, $06, $01, $2d
	db $7f, $04, $06, $01, $2e

Data_aa016:
	db $80, $02, $06, $01, $2d
	db $81, $03, $06, $01, $2d
	db $82, $04, $06, $01, $2c

Data_aa025:
IF DEF(SUN)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $05, $1e, $20, $30, $01, $06, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $23, $1f, $21, $52, $1e, $1e, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $06, $22, $24, $30, $03, $03, $01, $11, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $07, $07, $4e, $1e, $20, $3c, $04, $18, $00, $05, $0a, $00
	wildbot $00, $03, $07, $07, $46, $1e, $20, $78, $14, $14, $00, $10, $09, $00
	wildbot $00, $03, $07, $07, $25, $1f, $21, $79, $18, $18, $00, $11, $08, $00
	wildbot $00, $03, $07, $07, $24, $20, $22, $79, $18, $18, $1e, $10, $06, $00
	wildbot $00, $03, $07, $07, $47, $22, $24, $78, $07, $07, $07, $11, $03, $00
ENDC

Data_aa06b:
	map MAP_24_15
	db $02, $05

	map MAP_24_16
	db $0f, $05

	map MAP_24_17
	db $15, $12

	map MAP_24_19
	db $02, $12

	map MAP_24_20
	db $02, $05

	map MAP_24_21
	db $15, $05

Func_aa083:: ; aa083
	ld c, $00
.asm_aa085:
	ld a, c
	cp $06
	jp nc, .asm_aa0ed
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_aa06b
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_aa0e9
	ld l, c
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a9f89
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_aa0ed
.asm_aa0e9:
	inc c
	jp .asm_aa085
.asm_aa0ed:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa108
	ld a, [wBackupMapNumber]
	cp $0f
	jp nz, .asm_aa108
	ld e, $03
	ld hl, Data_a9fcb
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa108:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa123
	ld a, [wBackupMapNumber]
	cp $10
	jp nz, .asm_aa123
	ld e, $03
	ld hl, Data_a9fda
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa123:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa13e
	ld a, [wBackupMapNumber]
	cp $11
	jp nz, .asm_aa13e
	ld e, $03
	ld hl, Data_a9fe9
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa13e:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa159
	ld a, [wBackupMapNumber]
	cp $13
	jp nz, .asm_aa159
	ld e, $03
	ld hl, Data_a9ff8
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa159:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa174
	ld a, [wBackupMapNumber]
	cp $14
	jp nz, .asm_aa174
	ld e, $03
	ld hl, Data_aa007
	scall Func_80ce7
	jp .asm_aa18c
.asm_aa174:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_aa18c
	ld a, [wBackupMapNumber]
	cp $15
	jp nz, .asm_aa18c
	ld e, $03
	ld hl, Data_aa016
	scall Func_80ce7
.asm_aa18c:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aa025
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ret

Data_aa1a2:
	warpdef $08, $05, $02, $01, MAP_25_20, $0f, $1c, $0f, $1b, $2e
	warpdef $08, $15, $02, $01, MAP_25_01, $0c, $05, $0c, $06, $2e
	warpdef $05, $12, $01, $01, MAP_25_04, $09, $04, $09, $05, $2e
	warpdef $0c, $12, $01, $01, MAP_25_05, $01, $04, $01, $05, $2e

Data_aa1ce:
	dw $2b3
	dw -1

Data_aa1d2:
	person_event $09, $0c, $07, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $0a, $07, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $07, $09, $04, $01, $00, $04, $01, Func_aa277, NULL

Data_aa1fc:
	person_event $ff, $00, $07, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce
	person_event $ff, $00, $0a, $14, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa1ce

Func_aa218:: ; aa218
	ld a, $09
	ld [wc789], a
	ld a, $0d
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_aa1a2
	scall LoadWarps
	ld hl, $00b7
	scall CheckEventFlag
	or a
	jp nz, .asm_aa23c
	ld e, $03
	ld hl, Data_aa1d2
	scall LoadMapObjects
.asm_aa23c:
	ld e, $02
	ld hl, Data_aa1fc
	scall LoadMapObjects
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa261
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aa261
	ld a, $04
	scall PlayMusic
	jp .asm_aa266
.asm_aa261:
	ld a, $12
	scall PlayMusic
.asm_aa266:
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_aa26f:
	db $08, $07, $ff, $ff

Data_aa273:
	db $09, $07, $ff, $ff

Func_aa277:
	push de
	ld hl, $00b7
	scall CheckEventFlag
	or a
	jp nz, .asm_aa2f2
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_aa2f2
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld c, $01
	ld de, Data_aa26f
	ld a, $2a
	scall MovePlayer
	ld e, $01
	xor a
	scall SpriteFace
	ld a, $03
	scall PlayerFace
	ld e, $00
	ld hl, $00f7
	scall EventFlagAction
	call Func_aa321
	ld hl, $00f7
	scall CheckEventFlag
	or a
	jp z, .asm_aa2c0
	jp .asm_aa2f2
.asm_aa2c0:
	ld bc, Data_aa273
	ld e, $2a
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld e, $00
	ld hl, $00f7
	scall EventFlagAction
	call Func_aa392
	ld hl, $00f7
	scall CheckEventFlag
	or a
	jp z, .asm_aa2ea
	jp .asm_aa2f2
.asm_aa2ea:
	ld e, $01
	ld hl, $00b7
	scall EventFlagAction
.asm_aa2f2:
	pop bc
	ret

Data_aa2f4:
	db $07, $0f, $ff, $ff

Data_aa2f8:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $02, $06, $2a, $0f, $17
	db $00, $6f, $2d, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $02, $01, $57, $06, $2a, $0f, $17
	db $00, $6f, $5a, $06, $2a, $05, $09, $1b, $06, $81, $06, $2a, $01, $01, $01, $06
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_aa321:
	ld hl, $010b
	scall PrintTextStandard
	ld de, Data_aa35f
	ld hl, Data_aa2f8
	scall ScriptedBattle
	or a
	jp nz, Func_aa33d
	ld e, $01
	ld hl, $00f7
	scall EventFlagAction
	ret

Func_aa33d:
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld hl, $010f
	scall PrintTextStandard
	ld bc, Data_aa2f4
	ld e, $2a
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ret

Data_aa35f:
	dstr "(へいし)"

Data_aa365:
	db $09, $0f, $ff, $ff

Data_aa369:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $7d, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $2e, $01, $14, $06, $2a, $04
	db $0e, $00, $05, $13, $06, $2a, $03, $03, $03, $06, $81, $06, $2a, $03, $03, $03
	db $06, $00, $00, $00, $00, $00, $00, $00, $00, $0c,
ENDC

Func_aa392:
	ld hl, $010d
	scall PrintTextStandard
	ld de, Data_aa3d2
	ld hl, Data_aa369
	scall ScriptedBattle
	or a
	jp nz, .asm_aa3ae
	ld e, $01
	ld hl, $00f7
	scall EventFlagAction
	ret
.asm_aa3ae:
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld hl, $010f
	scall PrintTextStandard
	ld bc, Data_aa365
	ld e, $2a
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ret

Data_aa3d2:
	dstr "(へいし)"

Data_aa3d8:
	warpdef $0c, $1c, $02, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $0c, $04, $02, $01, MAP_25_00, $08, $14, $08, $13, $2e
	warpdef $19, $04, $01, $01, MAP_28_00, $06, $1a, $06, $19, $2e
	warpdef $05, $0e, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $08, $0e, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $1d, $16, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $20, $16, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $05, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $08, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $11, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $14, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $17, $15, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $1e, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $21, $0a, $01, $01, MAP_32_01, $01, $08, $01, $07, $34

Data_aa472:
	warpdef $07, $08, $01, $01, MAP_32_03, $01, $08, $01, $07, $34

Data_aa47d:
	dw $1bb
	dw -1

Data_aa481:
	dw $1be
	dw -1

Data_aa485:
	dw $1bc
	dw -1

Data_aa489:
	dw $1bd
	dw -1

Data_aa48d:
	dw $2af
	dw -1

Data_aa491:
	dw $2b1
	dw -1

Data_aa495:
	dw $2b0
	dw -1

Data_aa499:
	dw $323, $324, $325
	dw -1

Data_aa4a1:
	dw $326
	dw -1

Data_aa4a5:
	person_event $ff, $00, $0b, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $0e, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa491
	person_event $ff, $00, $18, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $1a, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa495
	person_event $ff, $00, $0b, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $0e, $1b, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa48d
	person_event $ff, $00, $07, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $14, $19, $01, $01, $00, $04, $00, PrintTextFacePlayerYesOrNo_2a, Data_aa499
	person_event $ff, $00, $12, $07, $03, $03, $00, $04, $00, Func_aa6ee, NULL

Data_aa523:
	person_event $09, $04, $0b, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa481
	person_event $ff, $00, $0c, $06, $01, $01, $00, $04, $01, Func_aa7b6, NULL
	person_event $ff, $00, $0d, $06, $01, $01, $00, $04, $01, Func_aa7f5, NULL
	person_event $09, $04, $0e, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa485
	person_event $09, $04, $18, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2a, Data_aa489
	person_event $ff, $00, $19, $06, $01, $01, $00, $04, $01, Func_aa834, NULL

Data_aa577:
	person_event $03, $04, $0d, $18, $01, $01, $02, $04, $00, Func_aa86f, NULL
	person_event $00, $04, $0c, $11, $01, $01, $01, $04, $00, PrintTextFacePlayer_2a, Data_aa47d

Data_aa593:
	person_event $10, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5a1:
	person_event $0b, $0c, $19, $00, $01, $01, $02, $04, $00, NULL, NULL

Data_aa5af:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_aa4a1

Data_aa5bd:
	person_event $ff, $00, $07, $08, $01, $01, $00, $04, $01, Func_aab87, NULL

Func_aa5cb:: ; aa5cb
	ld a, $09
	ld [wc789], a
	ld a, $0d
	ld [wc7e2], a
	call Func_aaaad
	ld hl, Func_aaaad
	scall Func_80f11
	ld e, $0e
	ld hl, Data_aa3d8
	scall LoadWarps
	ld e, $09
	ld hl, Data_aa4a5
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_aa577
	scall LoadMapObjects
	ld a, $01
	scall LoadPlayerSprite
	ld a, $12
	scall PlayMusic
	ld a, [wc790]
	or a
	jp z, .asm_aa622
	ld a, [wc790]
	cp $07
	jp nc, .asm_aa622
	ld e, $01
	ld hl, Data_aa472
	scall LoadWarps
	ld e, $01
	ld hl, Data_aa5bd
	scall LoadMapObjects
	jp .asm_aa62a
.asm_aa622:
	ld e, $01
	ld hl, Data_aa5af
	scall LoadMapObjects
.asm_aa62a:
	ld hl, $0034
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa666
	ld hl, $00c3
	scall CheckEventFlag
	or a
	jp nz, .asm_aa666
	ld a, [wBackupMapGroup]
	cp $1a
	jp nz, .asm_aa666
	ld hl, $0035
	scall CheckEventFlag
	or a
	jp nz, .asm_aa666
	ld e, $01
	ld hl, Data_aa5a1
	scall LoadMapObjects
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_aab3f
	jp .asm_aa6dd
.asm_aa666:
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa69e
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aa69e
	ld hl, $00c2
	scall CheckEventFlag
	or a
	jp nz, .asm_aa69e
	ld a, [wBackupMapGroup]
	cp $ff
	jp z, .asm_aa69b
	ld e, $01
	ld hl, Data_aa593
	scall LoadMapObjects
	scall Func_8001c
	call Func_aaad6
.asm_aa69b:
	jp .asm_aa6dd
.asm_aa69e:
	ld hl, $0022
	scall CheckEventFlag
	or a
	jp nz, .asm_aa6da
	ld e, $06
	ld hl, Data_aa523
	scall LoadMapObjects
	ld hl, $0014
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa6d4
	ld hl, $0007
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aa6d4
	ld e, $00
	ld a, $10
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $11
	scall SetPersonVisibilityState
.asm_aa6d4:
	scall Func_8001c
	jp .asm_aa6dd
.asm_aa6da:
	scall Func_8001c
.asm_aa6dd:
	ret

Data_aa6de:
	db $13, $0a, $ff, $ff

Data_aa6e2:
	db $11, $0a, $13, $0a, $ff, $ff

Data_aa6e8:
	db $15, $0a, $13, $0a, $ff, $ff

Func_aa6ee:
	ld a, e
	or a
	jp nz, .asm_aa7b1
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_aa71b
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_aa7ab
.asm_aa71b:
	ld a, [wc790]
	or a
	jp z, .asm_aa7a2
	ld a, [wc790]
	cp $06
	jp nc, .asm_aa7a2
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa79f
	ld a, [wPlayerFacing]
	cp $01
	jp z, .asm_aa74d
	or a
	jp nz, .asm_aa75a
	ld c, $01
	ld de, Data_aa6de
	ld a, $2a
	scall MovePlayer
	jp .asm_aa764
.asm_aa74d:
	ld c, $01
	ld de, Data_aa6e2
	ld a, $2a
	scall MovePlayer
	jp .asm_aa764
.asm_aa75a:
	ld c, $01
	ld de, Data_aa6e8
	ld a, $2a
	scall MovePlayer
.asm_aa764:
	scall WaitNPCStep
	xor a
	scall PlayMusic
	ld a, $0a
	scall PlayMusic
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $0b
	scall LoadEmote
	ld a, $44
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $02
	scall PlayerFace
	ld l, $12
	push hl
	ld c, $0a
	ld e, $01
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_aa79f:
	jp .asm_aa7a8
.asm_aa7a2:
	ld hl, $0377
	scall PrintTextStandard
.asm_aa7a8:
	jp .asm_aa7b1
.asm_aa7ab:
	ld hl, $0376
	scall PrintTextStandard
.asm_aa7b1:
	ret

Data_aa7b2:
	db $0c, $07, $ff, $ff

Func_aa7b6:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa7ef
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	ld a, $69
	scall PlaySFX
	ld hl, $01bc
	scall PrintTextStandard
	ld c, $01
	ld de, Data_aa7b2
	ld a, $2a
	scall MovePlayer
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
.asm_aa7ef:
	pop bc
	ret

Data_aa7f1:
	db $0d, $07, $ff, $ff

Func_aa7f5:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa82e
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $01
	scall PlayerFace
	ld a, $69
	scall PlaySFX
	ld hl, $01bc
	scall PrintTextStandard
	ld c, $01
	ld de, Data_aa7f1
	ld a, $2a
	scall MovePlayer
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
.asm_aa82e:
	pop bc
	ret

Data_aa830:
	db $19, $07, $ff, $ff

Func_aa834:
	push af
	ld a, e
	cp $02
	jp nz, .asm_aa86d
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	ld a, $69
	scall PlaySFX
	ld hl, $01bd
	scall PrintTextStandard
	ld c, $01
	ld de, Data_aa830
	ld a, $2a
	scall MovePlayer
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	dec a
	scall SpriteFace
.asm_aa86d:
	pop bc
	ret

Func_aa86f:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_aaaa4
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	ld a, [wc796]
	cp $04
	jp nz, .asm_aa90a
	ld a, $49
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aa907
	ld hl, $0416
	scall PrintTextWithNPCName
	ld a, $49
	scall Func_80e7d
	cp $01
	jp nz, .asm_aa8fe
	ld hl, $0295
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa8ed
	ld a, $68
	scall PlaySFX
	ld hl, $040c
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
	ld a, $4a
	scall GiveRobot
	ld a, $05
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_aa8fb
.asm_aa8ed:
	ld a, $69
	scall PlaySFX
	ld hl, $040d
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aa8fb:
	jp .asm_aa907
.asm_aa8fe:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_aaaa4
.asm_aa907:
	jp .asm_aaa4f
.asm_aa90a:
	ld a, [wc796]
	cp $0c
	jp nz, .asm_aa994
	ld a, $7c
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aa991
	ld hl, $0416
	scall PrintTextWithNPCName
	ld a, $7c
	scall Func_80e7d
	cp $01
	jp nz, .asm_aa988
	ld hl, $0296
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_aa977
	ld a, $68
	scall PlaySFX
	ld hl, $0432
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
	ld a, $7e
	scall GiveRobot
	ld a, $0d
	ld [wc796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_aa985
.asm_aa977:
	ld a, $69
	scall PlaySFX
	ld hl, $0433
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aa985:
	jp .asm_aa991
.asm_aa988:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_aaaa4
.asm_aa991:
	jp .asm_aaa4f
.asm_aa994:
	ld a, $49
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_aa9ae
	ld a, $7c
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_aaa4f
.asm_aa9ae:
	ld a, [wc796]
	cp $08
	jp z, .asm_aaa37
	cp $06
	jp z, .asm_aaa37
	cp $0a
	jp z, .asm_aaa28
	cp $05
	jp z, .asm_aaa28
	cp $07
	jp z, .asm_aaa19
	or a
	jp z, .asm_aaa19
	cp $0d
	jp z, .asm_aaa0a
	cp $03
	jp z, .asm_aaa0a
	cp $0b
	jp z, .asm_aa9fb
	cp $02
	jp z, .asm_aa9fb
	cp $09
	jp z, .asm_aa9ec
	cp $01
	jp nz, .asm_aaa46
.asm_aa9ec:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034d
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aa9fb:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0205
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa0a:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $020a
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa19:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034b
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa28:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0241
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa37:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0244
	scall PrintTextStandard
	jp .asm_aaa4c
.asm_aaa46:
	ld hl, $0416
	scall PrintTextWithNPCName
.asm_aaa4c:
	jp .asm_aaaa4
.asm_aaa4f:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_aaaa4
	ld a, [wc796]
	cp $0d
	jp nc, .asm_aaa76
	ld a, [wc796]
	cp $05
	jp c, .asm_aaa76
	ld hl, $0416
	scall PrintTextWithNPCName
	ld hl, $0431
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa76:
	ld a, [wc796]
	cp $0f
	jp nz, .asm_aaa87
	ld hl, $0416
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa87:
	ld a, [wc796]
	cp $0d
	jp c, .asm_aaa98
	ld hl, $0434
	scall PrintTextWithNPCName
	jp .asm_aaaa4
.asm_aaa98:
	ld hl, $0416
	scall PrintTextWithNPCName
	ld hl, $01ba
	scall PrintTextWithNPCName
.asm_aaaa4:
	pop bc
	pop bc
	ret

Data_aaaa7:
	db $05, $0e, $01, $01
	db $07, $08

Func_aaaad:
	ld a, [wc790]
	or a
	jp z, .asm_aaac5
	ld a, [wc790]
	cp $07
	jp nc, .asm_aaac5
	ld hl, Data_aaaa7
	scall Func_80d9b
	scall Func_80f02
.asm_aaac5:
	ret

Data_aaac6:
	db $19, $05, $ff, $ff

Data_aaaca:
	db $19, $0d, $ff, $ff

Data_aaace:
	db $1a, $06, $ff, $ff

Data_aaad2:
	db $19, $07, $ff, $ff

Func_aaad6:
	ld bc, Data_aaac6
	ld e, $2a
	ld a, $0c
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $01
	ld de, Data_aaace
	ld a, $2a
	scall MovePlayer
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	ld bc, Data_aaaca
	ld e, $2a
	ld a, $0c
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $02
	scall PlayerFace
	ld e, $00
	ld a, $0c
	scall SetPersonVisibilityState
	ld hl, $0112
	scall PrintTextStandard
	ld c, $01
	ld de, Data_aaad2
	ld a, $2a
	scall MovePlayer
	scall WaitNPCStep
	ld e, $01
	ld hl, $00c2
	scall EventFlagAction
	ld l, $07
	push hl
	ld c, $19
	ld e, $01
	ld a, $19
	scall Func_80dff
	pop bc
	ret

Data_aab37:
	db $19, $06, $ff, $ff

Data_aab3b:
	db $19, $0d, $ff, $ff

Func_aab3f:
	ld bc, Data_aab37
	ld e, $2a
	ld a, $0c
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld hl, $01bf
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_aab3b
	ld e, $2a
	ld a, $0c
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld l, $06
	push hl
	ld c, $07
	ld e, $00
	ld a, $1a
	scall Func_80dff
	pop bc
	ld e, $01
	ld hl, $00c3
	scall EventFlagAction
	ret

Func_aab87:
	ld a, e
	cp $02
	jp nz, .asm_aab92
	ld a, $0c
	ld [wc78a], a
.asm_aab92:
	ret

Data_aab93:
	warpdef $01, $04, $01, $01, MAP_25_04, $09, $18, $09, $17, $2e
	warpdef $0e, $03, $01, $03, MAP_28_01, $05, $14, $06, $14, $2e

Data_aaba9:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aabe1:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaccc, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaccc, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_aada6, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_aada6, NULL

Func_aac19:: ; aac19
	ld e, $02
	ld hl, Data_aab93
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_aaba9
	scall LoadEncounters
	ld e, $01
	ld hl, $00c2
	scall EventFlagAction
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aac8a
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aac8a
	ld e, $04
	ld hl, Data_aabe1
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00af
	scall CheckEventFlag
	or a
	jp z, .asm_aac6f
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_aac6f:
	ld hl, $00b0
	scall CheckEventFlag
	or a
	jp z, .asm_aac87
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_aac87:
	jp .asm_aac8f
.asm_aac8a:
	ld a, $08
	scall PlayMusic
.asm_aac8f:
	scall Func_8001c
	ret

Data_aac93:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $87, $06, $28, $03, $03, $00, $14, $88, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $84, $01, $84, $06, $28, $03, $03, $00, $14, $85, $06, $28, $03
	db $10, $00, $71, $3c, $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_aacbc:
	db $08, $04, $ff, $ff

Data_aacc0:
	db $08, $04, $01, $04, $ff, $ff

Data_aacc6:
	db $06, $04, $01, $04, $ff, $ff

Func_aaccc:
	push de
	ld hl, $00af
	scall CheckEventFlag
	or a
	jp nz, .asm_aad67
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aace3
	or a
	jp nz, .asm_aad67
.asm_aace3:
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aacf4
	xor a
	scall FacePlayer
	jp .asm_aad02
.asm_aacf4:
	ld c, $01
	ld de, Data_aacbc
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_aad02:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $0114
	scall PrintTextStandard
	ld de, Data_aad69
	ld hl, Data_aac93
	scall ScriptedBattle
	or a
	jp nz, .asm_aad21
	jp .asm_aad67
.asm_aad21:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aad3d
	ld bc, Data_aacc0
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_aad46
.asm_aad3d:
	ld bc, Data_aacc6
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_aad46:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00af
	scall EventFlagAction
.asm_aad67:
	pop bc
	ret

Data_aad69:
	dstr "(へいし)"

Data_aad6f:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $84, $06, $28, $04, $04, $00, $14, $85, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $87
	db $01, $87, $06, $28, $04, $04, $00, $14, $88, $06, $28, $04, $10, $00, $71, $3c
	db $06, $28, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aad98:
	db $0a, $04, $ff, $ff

Data_aad9c:
	db $0a, $04, $0e, $04, $ff, $ff

Data_aada2:
	db $0e, $03, $ff, $ff

Func_aada6:
	push de
	ld hl, $00b0
	scall CheckEventFlag
	or a
	jp nz, .asm_aae45
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aadbd
	or a
	jp nz, .asm_aae45
.asm_aadbd:
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aadcf
	ld a, $02
	scall FacePlayer
	jp .asm_aaddd
.asm_aadcf:
	ld c, $01
	ld de, Data_aad98
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_aaddd:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010c
	scall PrintTextStandard
	ld de, Data_aae47
	ld hl, Data_aad6f
	scall ScriptedBattle
	or a
	jp nz, .asm_aadfc
	jp .asm_aae45
.asm_aadfc:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	add a, $04
	cp $03
	jp nz, .asm_aae19
	ld bc, Data_aad9c
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_aae23
.asm_aae19:
	ld bc, Data_aada2
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_aae23:
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b0
	scall EventFlagAction
.asm_aae45:
	pop bc
	ret

Data_aae47:
	dstr "(へいし)"

Data_aae4d:
	warpdef $11, $04, $01, $01, MAP_25_05, $01, $18, $01, $17, $2e
	warpdef $05, $03, $01, $03, MAP_28_01, $1d, $14, $1c, $14, $2e

Data_aae63:
IF DEF(SUN)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $88, $26, $29, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $13, $03, $3f, $23, $26, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $13, $03, $56, $24, $27, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $13, $03, $36, $26, $29, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $13, $03, $85, $26, $29, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_aae9b:
	person_event $09, $0c, $08, $03, $01, $01, $02, $04, $00, Func_aaf84, NULL
	person_event $ff, $00, $08, $04, $01, $02, $00, $04, $01, Func_aaf84, NULL
	person_event $09, $0c, $0a, $03, $01, $01, $02, $04, $00, Func_ab05c, NULL
	person_event $ff, $00, $0a, $04, $01, $02, $00, $04, $01, Func_ab05c, NULL

Func_aaed3:: ; aaed3
	ld e, $02
	ld hl, Data_aae4d
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_aae63
	scall LoadEncounters
	ld e, $01
	ld hl, $00c2
	scall EventFlagAction
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aaf44
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_aaf44
	ld e, $04
	ld hl, Data_aae9b
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b3
	scall CheckEventFlag
	or a
	jp z, .asm_aaf29
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_aaf29:
	ld hl, $00b4
	scall CheckEventFlag
	or a
	jp z, .asm_aaf41
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_aaf41:
	jp .asm_aaf49
.asm_aaf44:
	ld a, $08
	scall PlayMusic
.asm_aaf49:
	scall Func_8001c
	ret

Data_aaf4d:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $57, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0a, $01, $02, $06, $28, $0f, $17
	db $00, $05, $03, $06, $28, $01, $18, $00, $6f, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_aaf76:
	db $08, $04, $ff, $ff

Data_aaf7a:
	db $08, $04, $05, $04, $ff, $ff

Data_aaf80:
	db $05, $03, $ff, $ff

Func_aaf84:
	push de
	ld hl, $00b3
	scall CheckEventFlag
	or a
	jp nz, .asm_ab01b
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_aaf9b
	or a
	jp nz, .asm_ab01b
.asm_aaf9b:
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aafaa
	xor a
	scall FacePlayer
	jp .asm_aafb8
.asm_aafaa:
	ld c, $01
	ld de, Data_aaf76
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_aafb8:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010e
	scall PrintTextStandard
	ld de, Data_ab01d
	ld hl, Data_aaf4d
	scall ScriptedBattle
	or a
	jp nz, .asm_aafd7
	jp .asm_ab01b
.asm_aafd7:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_aaff1
	ld bc, Data_aaf7a
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_aaffa
.asm_aaff1:
	ld bc, Data_aaf80
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_aaffa:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b3
	scall EventFlagAction
.asm_ab01b:
	pop bc
	ret

Data_ab01d:
	dstr "(へいし)"

Data_ab023:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $24, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $23, $01, $22, $06, $28, $1e, $1e
	db $00, $05, $23, $06, $28, $18, $18, $1e, $04, $3c, $06, $28, $1f, $08, $08, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab04c:
	db $0a, $04, $ff, $ff

Data_ab050:
	db $0a, $04, $11, $04, $ff, $ff

Data_ab056:
	db $0c, $04, $11, $04, $ff, $ff

Func_ab05c:
	push de
	ld hl, $00b4
	scall CheckEventFlag
	or a
	jp nz, .asm_ab0f7
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab073
	or a
	jp nz, .asm_ab0f7
.asm_ab073:
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab083
	ld a, $02
	scall FacePlayer
	jp .asm_ab091
.asm_ab083:
	ld c, $01
	ld de, Data_ab04c
	ld a, $2a
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_ab091:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010b
	scall PrintTextStandard
	ld de, Data_ab0f9
	ld hl, Data_ab023
	scall ScriptedBattle
	or a
	jp nz, .asm_ab0b0
	jp .asm_ab0f7
.asm_ab0b0:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wMapY]
	cp $ff
	jp nz, .asm_ab0cb
	ld bc, Data_ab050
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab0d5
.asm_ab0cb:
	ld bc, Data_ab056
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab0d5:
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b4
	scall EventFlagAction
.asm_ab0f7:
	pop bc
	ret

Data_ab0f9:
	dstr "(へいし)"

Data_ab0ff:
	warpdef $09, $18, $01, $01, MAP_25_02, $01, $04, $02, $04, $2e
	warpdef $09, $04, $01, $01, MAP_25_00, $05, $12, $06, $12, $2e

Data_ab115:
	db $3c, $01, $08, $03, $1c
	db $3d, $01, $0c, $01, $0f
	db $3e, $00, $09, $03, $1e
	db $3f, $00, $0b, $03, $1f

Data_ab129:
IF DEF(SUN)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_ab161:
	person_event $09, $0c, $08, $0e, $01, $01, $01, $04, $00, Func_ab24a, NULL
	person_event $ff, $00, $09, $0e, $02, $01, $00, $04, $01, Func_ab24a, NULL
	person_event $09, $0c, $08, $0c, $01, $01, $01, $04, $00, Func_ab327, NULL
	person_event $ff, $00, $09, $0c, $02, $01, $00, $04, $01, Func_ab327, NULL

Func_ab199:: ; ab199
	ld e, $02
	ld hl, Data_ab0ff
	scall LoadWarps
	ld e, $04
	ld hl, Data_ab115
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_ab129
	scall LoadEncounters
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab20a
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab20a
	ld e, $04
	ld hl, Data_ab161
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b1
	scall CheckEventFlag
	or a
	jp z, .asm_ab1ef
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_ab1ef:
	ld hl, $00b2
	scall CheckEventFlag
	or a
	jp z, .asm_ab207
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_ab207:
	jp .asm_ab20f
.asm_ab20a:
	ld a, $08
	scall PlayMusic
.asm_ab20f:
	scall Func_8001c
	ret

Data_ab213:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $72, $01, $72, $06, $29, $06, $09, $0b, $06, $4e, $06, $29, $01
	db $02, $00, $14, $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c
ENDC

Data_ab23c:
	db $09, $0e, $ff, $ff

Data_ab240:
	db $09, $0e, $09, $15, $ff, $ff

Data_ab246:
	db $08, $15, $ff, $ff

Func_ab24a:
	push de
	ld hl, $00b1
	scall CheckEventFlag
	or a
	jp nz, .asm_ab2e8
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab261
	or a
	jp nz, .asm_ab2e8
.asm_ab261:
	ld a, [wMapX]
	add a, $05
	cp $08
	jp nz, .asm_ab272
	xor a
	scall FacePlayer
	jp .asm_ab281
.asm_ab272:
	ld c, $01
	ld de, Data_ab23c
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab281:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010c
	scall PrintTextStandard
	ld de, Data_ab2ea
	ld hl, Data_ab213
	scall ScriptedBattle
	or a
	jp nz, .asm_ab2a0
	jp .asm_ab2e8
.asm_ab2a0:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab2b2
	or a
	jp nz, .asm_ab2be
.asm_ab2b2:
	ld bc, Data_ab240
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_ab2c7
.asm_ab2be:
	ld bc, Data_ab246
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_ab2c7:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b1
	scall EventFlagAction
.asm_ab2e8:
	pop bc
	ret

Data_ab2ea:
	dstr "(へいし)"

Data_ab2f0:
IF DEF(SUN)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00
	db $16, $01, $16, $04, $29, $0c, $0d, $00, $06, $30, $06, $29, $06, $1e, $00, $14
	db $3c, $06, $29, $1f, $08, $08, $14, $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Data_ab319:
	db $09, $0c, $ff, $ff

Data_ab31d:
	db $09, $0c, $09, $06, $ff, $ff

Data_ab323:
	db $08, $06, $ff, $ff

Func_ab327:
	push de
	ld hl, $00b2
	scall CheckEventFlag
	or a
	jp nz, .asm_ab3c9
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab33e
	or a
	jp nz, .asm_ab3c9
.asm_ab33e:
	ld a, [wMapX]
	add a, $05
	cp $08
	jp nz, .asm_ab350
	ld a, $02
	scall FacePlayer
	jp .asm_ab35f
.asm_ab350:
	ld c, $01
	ld de, Data_ab319
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab35f:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010d
	scall PrintTextStandard
	ld de, Data_ab3cb
	ld hl, Data_ab2f0
	scall ScriptedBattle
	or a
	jp nz, .asm_ab37e
	jp .asm_ab3c9
.asm_ab37e:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab390
	or a
	jp nz, .asm_ab39d
.asm_ab390:
	ld bc, Data_ab31d
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab3a7
.asm_ab39d:
	ld bc, Data_ab323
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab3a7:
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b2
	scall EventFlagAction
.asm_ab3c9:
	pop bc
	ret

Data_ab3cb:
	dstr "(へいし)"

Data_ab3d1:
	warpdef $01, $04, $01, $01, MAP_25_00, $0c, $12, $0b, $12, $2e
	warpdef $01, $18, $01, $01, MAP_25_03, $11, $04, $10, $04, $2e

Data_ab3e7:
	db $40, $09, $08, $01, $0f
	db $41, $09, $0c, $01, $36
	db $42, $0a, $09, $01, $4a
	db $43, $0a, $0b, $01, $42

Data_ab3fb:
IF DEF(SUN)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $88, $27, $2a, $7a, $04, $04, $00, $05, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0b, $17, $3f, $24, $27, $26, $0c, $0f, $00, $05, $0a, $00
	wildbot $00, $03, $0b, $17, $56, $25, $28, $48, $0c, $0c, $0c, $10, $0a, $00
	wildbot $00, $03, $0b, $17, $36, $27, $2a, $7a, $0f, $0b, $00, $05, $06, $00
	wildbot $00, $03, $0b, $17, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $06, $00
ENDC

Data_ab433:
	person_event $09, $0c, $00, $0e, $01, $01, $01, $04, $00, Func_ab51a, NULL
	person_event $ff, $00, $01, $0e, $02, $01, $00, $04, $01, Func_ab51a, NULL
	person_event $09, $0c, $00, $0c, $01, $01, $01, $04, $00, Func_ab5f4, NULL
	person_event $ff, $00, $01, $0c, $02, $01, $00, $04, $01, Func_ab5f4, NULL

Func_ab46b:: ; ab46b
	ld e, $02
	ld hl, Data_ab3d1
	scall LoadWarps
	ld e, $04
	ld hl, Data_ab3e7
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_ab3fb
	scall LoadEncounters
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab4dc
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab4dc
	ld e, $04
	ld hl, Data_ab433
	scall LoadMapObjects
	ld a, $04
	scall PlayMusic
	ld hl, $00b5
	scall CheckEventFlag
	or a
	jp z, .asm_ab4c1
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_ab4c1:
	ld hl, $00b6
	scall CheckEventFlag
	or a
	jp z, .asm_ab4d9
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
.asm_ab4d9:
	jp .asm_ab4e1
.asm_ab4dc:
	ld a, $08
	scall PlayMusic
.asm_ab4e1:
	scall Func_8001c
	ret

Data_ab4e5:
	db $00, $00, $00, $03, $00, $c5
	db $ba, $00, $00, $09, $01, $09, $06, $29, $04, $0f, $00, $05, $0c, $06, $29, $01
	db $05, $00, $05, $3c, $06, $29, $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00
	db $00, $00, $0c

Data_ab50e:
	db $01, $0e, $ff, $ff

Data_ab512:
	db $01, $14, $ff, $ff

Data_ab516:
	db $00, $14, $ff, $ff

Func_ab51a:
	push de
	ld hl, $00b5
	scall CheckEventFlag
	or a
	jp nz, .asm_ab5b7
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab531
	or a
	jp nz, .asm_ab5b7
.asm_ab531:
	ld a, [wMapX]
	add a, $05
	or a
	jp nz, .asm_ab541
	xor a
	scall FacePlayer
	jp .asm_ab550
.asm_ab541:
	ld c, $01
	ld de, Data_ab50e
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab550:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010c
	scall PrintTextStandard
	ld de, Data_ab5b9
	ld hl, Data_ab4e5
	scall ScriptedBattle
	or a
	jp nz, .asm_ab56f
	jp .asm_ab5b7
.asm_ab56f:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab581
	or a
	jp nz, .asm_ab58d
.asm_ab581:
	ld bc, Data_ab512
	ld e, $2a
	xor a
	scall MovePersonAndWait
	jp .asm_ab596
.asm_ab58d:
	ld bc, Data_ab516
	ld e, $2a
	xor a
	scall MovePersonAndWait
.asm_ab596:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b5
	scall EventFlagAction
.asm_ab5b7:
	pop bc
	ret

Data_ab5b9:
	dstr "(へいし)"

Data_ab5bf:
	db $00, $00, $00, $03, $00, $c5, $ba, $00, $00, $0b, $01, $08
	db $06, $29, $03, $0f, $00, $05, $0b, $06, $29, $05, $17, $00, $05, $3c, $06, $29
	db $1f, $08, $08, $05, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_ab5e8:
	db $01, $0c, $ff, $ff

Data_ab5ec:
	db $01, $06, $ff, $ff

Data_ab5f0:
	db $00, $06, $ff, $ff

Func_ab5f4:
	push de
	ld hl, $00b6
	scall CheckEventFlag
	or a
	jp nz, .asm_ab695
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp z, .asm_ab60b
	or a
	jp nz, .asm_ab695
.asm_ab60b:
	ld a, [wMapX]
	add a, $05
	or a
	jp nz, .asm_ab61c
	ld a, $02
	scall FacePlayer
	jp .asm_ab62b
.asm_ab61c:
	ld c, $01
	ld de, Data_ab5e8
	ld a, $2a
	scall MovePlayer
	ld a, $03
	scall PlayerFace
.asm_ab62b:
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $010e
	scall PrintTextStandard
	ld de, Data_ab697
	ld hl, Data_ab5bf
	scall ScriptedBattle
	or a
	jp nz, .asm_ab64a
	jp .asm_ab695
.asm_ab64a:
	ld hl, $010f
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_ab65c
	or a
	jp nz, .asm_ab669
.asm_ab65c:
	ld bc, Data_ab5ec
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	jp .asm_ab673
.asm_ab669:
	ld bc, Data_ab5f0
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
.asm_ab673:
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	ld e, $01
	ld hl, $00b6
	scall EventFlagAction
.asm_ab695:
	pop bc
	ret

Data_ab697:
	dstr "(へいし)"

Data_ab69d:
	warpdef $0e, $1b, $04, $01, MAP_25_20, $0f, $05, $0f, $06, $2e

Data_ab6a8:
	db $22, $01, $ff, $ff

Data_ab6ac:
	db $b3, $02, $ff, $ff

Data_ab6b0:
	db $1a, $04, $ff, $ff

Data_ab6b4:
	person_event $23, $0c, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $0d, $0c, $0f, $05, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6a8
	person_event $1a, $0c, $09, $10, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $0c, $0d, $0c, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $0c, $11, $0c, $01, $01, $02, $04, $00, NULL, NULL

Data_ab6fa:
	person_event $0d, $04, $0f, $07, $01, $01, $02, $04, $00, Func_abf5b, NULL
	person_event $23, $04, $10, $07, $01, $01, $02, $04, $00, Func_808fc_2a, Data_ab6b0
	person_event $1c, $04, $10, $07, $01, $01, $02, $04, $00, NULL, NULL

Data_ab724:
	person_event $0d, $04, $0f, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $00, $04, $10, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0c, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0d, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $0e, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0c, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $04, $11, $0e, $01, $01, $03, $04, $00, NULL, NULL

Data_ab794:
	person_event $ff, $00, $0c, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac
	person_event $ff, $00, $13, $1a, $01, $01, $00, $04, $00, PrintTextFacePlayer_2a, Data_ab6ac

Data_ab7b0:
	person_event $0f, $04, $16, $14, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $16, $14, $01, $01, $02, $04, $00, Func_abe67, NULL

Func_ab7cc:: ; ab7cc
	ld e, $02
	ld hl, Data_ab7b0
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab7e9
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab7f9
.asm_ab7e9:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab804
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab804
.asm_ab7f9:
	ld e, $08
	ld hl, Data_ab724
	scall LoadMapObjects
	jp .asm_ab860
.asm_ab804:
	ld e, $01
	ld hl, Data_ab69d
	scall LoadWarps
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab829
	ld e, $05
	ld hl, Data_ab6b4
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
	jp .asm_ab860
.asm_ab829:
	ld hl, $0023
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ab858
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_ab858
	ld e, $03
	ld hl, Data_ab6fa
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	jp .asm_ab860
.asm_ab858:
	ld e, $02
	ld hl, Data_ab794
	scall LoadMapObjects
.asm_ab860:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ab86f
	ld a, [wBackupMapNumber]
	cp $02
	jp z, .asm_ab87f
.asm_ab86f:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_ab88a
	ld a, [wBackupMapNumber]
	cp $0e
	jp nz, .asm_ab88a
.asm_ab87f:
	ld a, $03
	scall PlayMusic
	call Func_abc22
	jp .asm_ab8c8
.asm_ab88a:
	ld hl, $0043
	scall CheckEventFlag
	or a
	jp nz, .asm_ab8c0
	xor a
	scall Func_80653
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	call Func_ab8e1
	ld e, $01
	ld hl, $0043
	scall EventFlagAction
	ld a, $0c
	scall Func_80c94
	xor a
	scall PlayMusic
	ld a, $12
	scall PlayMusic
	jp .asm_ab8c8
.asm_ab8c0:
	ld a, $12
	scall PlayMusic
	scall Func_8001c
.asm_ab8c8:
	ret

Data_ab8c9:
	db $0f, $0f, $ff, $ff

Data_ab8cd:
	db $0d, $0f, $ff, $ff

Data_ab8d1:
	db $11, $0f, $ff, $ff

Data_ab8d5:
	db $10, $0f, $ff, $ff

Data_ab8d9:
	db $0e, $0f, $ff, $ff

Data_ab8dd:
	db $10, $12, $ff, $ff

Func_ab8e1:
	xor a
.asm_ab8e2:
	cp $0a
	jp nc, .asm_ab8f3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_ab8e2
.asm_ab8f3:
	ld hl, $003c
	scall ScriptSleep
	ld c, $15
	ld e, $0f
	ld a, $04
	scall Func_80080
	ld bc, Data_ab8c9
Func_ab904:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $003c
	scall ScriptSleep
	ld bc, Data_ab8cd
	ld e, $2a
	ld a, $05
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld bc, Data_ab8d1
	ld e, $2a
	ld a, $06
	scall MovePersonAndWait
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_ab8d5
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $62
	scall PlaySFX
	ld e, $00
	ld a, $06
	scall SpriteFace
	ld e, $01
	ld a, $06
	scall SpriteFace
	ld e, $02
	ld a, $06
	scall SpriteFace
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld e, $00
	ld a, $06
	scall SpriteFace
	ld e, $01
	ld a, $06
	scall SpriteFace
	ld e, $02
	ld a, $06
	scall SpriteFace
	ld e, $03
	ld a, $06
	scall SpriteFace
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld a, $4e
	scall PlaySFX
	ld bc, Data_ab8d9
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $63
	scall PlaySFX
	ld e, $00
	ld a, $05
	scall SpriteFace
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld e, $02
	ld a, $05
	scall SpriteFace
	ld e, $03
	ld a, $05
	scall SpriteFace
	ld e, $00
	ld a, $05
	scall SpriteFace
	ld e, $01
	ld a, $05
	scall SpriteFace
	ld e, $02
	ld a, $05
	scall SpriteFace
	ld e, $03
	ld a, $05
	scall SpriteFace
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld a, $4e
	scall PlaySFX
	ld hl, $0078
	scall ScriptSleep
	ld c, $15
	ld e, $11
	ld a, $03
	scall Func_80080
	ld bc, Data_ab8d1
	ld e, $2a
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	ld a, $03
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld hl, $0115
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $0116
	scall PrintTextWithNPCName
	ld hl, $0117
	scall PrintTextWithNPCName
	ld hl, $0118
	scall PrintTextWithNPCName
	ld hl, $0119
	scall PrintTextWithNPCName
	ld hl, $011a
	scall PrintTextWithNPCName
	ld hl, $011b
	scall PrintTextWithNPCName
	ld hl, $011c
	scall PrintTextWithNPCName
	ld bc, Data_ab8c9
Func_aba78:
	ld e, $2a
	ld a, $04
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $01
	ld e, $01
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld a, $61
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $011d
	scall PrintTextWithNPCName
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $02
	ld a, $03
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $0f
	ld a, $11
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	xor a
.asm_abad4:
	cp $02
	jp nc, .asm_abae6
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abad4
.asm_abae6:
	ld c, $19
	ld e, $10
	ld a, $02
	scall Func_80080
	ld bc, Data_ab8dd
	ld e, $2a
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $011e
	scall PrintTextWithNPCName
	ld hl, $0120
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $02
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld a, $60
	scall PlaySFX
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $03
	ld a, $03
	scall SpriteFace
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld hl, $011f
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $04
	ld a, $16
	scall LoadEmote
	ld e, $0f
	ld a, $10
	scall MoveEmote
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall Func_80653
	xor a
.asm_abb61:
	cp $08
	jp nc, .asm_abb73
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_abb61
.asm_abb73:
	ret

Func_abb74:: ; abb74
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	xor a
	scall PlayerFace
	ld c, $01
	ld e, $3f
	ld a, $1c
	scall LoadEmote
	ld e, $08
	ld a, $10
	scall MoveEmote
	ld a, $5e
	scall PlaySFX
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	ld c, $01
	ld e, $3f
	ld a, $1d
	scall LoadEmote
	ld e, $08
	ld a, $10
	scall MoveEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	scall WaitEmote
	ld e, $01
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $03
	scall SetPersonVisibilityState
	scall HideEmote
	ld hl, $03fe
	scall PrintTextWithNPCName
	ld hl, $03fc
	scall PrintTextStandard
	ld c, $1e
	ld e, $00
	ld a, $80
	scall GiveRobot
	cp $ff
	jp nz, .asm_abc02
.asm_abc02:
	ld hl, $03ff
	scall PrintTextWithNPCName
	ld hl, $03fd
	scall PrintTextStandard
	ld e, $00
	ld a, $2c
	scall Func_80d62
	ld e, $01
	ld hl, $0048
	scall EventFlagAction
	ret

Data_abc1e:
	db $0f, $07, $ff, $ff

Func_abc22:
	xor a
	scall PlayerFace
	scall Func_8001c
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abc3d
	ld e, $1c
	ld a, $03
	scall ChangeSprite
	jp .asm_abc44
.asm_abc3d:
	ld e, $23
	ld a, $03
	scall ChangeSprite
.asm_abc44:
	ld e, $02
	ld a, $03
	scall SpriteFace
	ld c, $01
	ld de, Data_abc1e
	ld a, $2a
	scall MovePlayer
	ld hl, $003c
	scall ScriptSleep
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_abc6b
	ld hl, $014f
	scall PrintTextWithNPCName
.asm_abc6b:
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abc7b
	ld hl, $0489
	scall PrintTextWithNPCName
.asm_abc7b:
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_abc9c
	ld hl, $03aa
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $07
	scall Func_80d4d
	ld e, $01
	ld hl, $005a
	scall EventFlagAction
.asm_abc9c:
	ld hl, $0150
	scall PrintTextWithNPCName
	ld hl, $003c
	scall ScriptSleep
.asm_abca8:
	ld a, [wRTCTicker]
	cp $11
	jp z, .asm_abcc2
	ld a, [wRTCTicker]
	or a
	jp nz, .asm_abcbc
	ld a, $01
	ld [wRTCTicker], a
.asm_abcbc:
	call NextOverworldFrame
	jp .asm_abca8
.asm_abcc2:
	xor a
	ld [wc39e], a
	ld a, $02
	scall PlayMusic
	ld a, $01
	ld [wc790], a
	scall ScriptLibrary
	or a
	jp nz, .asm_abdda
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $04
	ld [wNextVBlankFlags], a
.asm_abd24:
	ld a, [wNextVBlankFlags]
	ld hl, $c204
	cp [hl]
	jp nz, .asm_abd24
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	scall Func_80f02
	ld hl, $0393
	scall PrintTextWithNPCName
	xor a
	scall Func_8103e
	ld hl, $0394
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $00e1
	scall EventFlagAction
	ld e, $00
	ld hl, $00e2
	scall EventFlagAction
	ld e, $00
	ld hl, $00e3
	scall EventFlagAction
	ld e, $00
	ld hl, $00e4
	scall EventFlagAction
	ld e, $00
	ld hl, $00e5
	scall EventFlagAction
	ld e, $00
	ld hl, $00e6
	scall EventFlagAction
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Credits2
	jp .asm_abe66
.asm_abdda:
	ld e, $00
	ld hl, $00e1
	scall EventFlagAction
	ld e, $00
	ld hl, $00e2
	scall EventFlagAction
	ld e, $00
	ld hl, $00e3
	scall EventFlagAction
	ld e, $00
	ld hl, $00e4
	scall EventFlagAction
	ld e, $00
	ld hl, $00e5
	scall EventFlagAction
	ld e, $00
	ld hl, $00e6
	scall EventFlagAction
	ld a, $01
	ld [wc79a], a
	ld l, $0d
	push hl
	ld c, $10
	ld e, $00
	xor a
	scall Func_80dff
	pop bc
	callba_hli SaveGame
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	callba_hli Func_da4dc
	ld a, [wLCDC]
	or $03
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $06
	ld [wNextVBlankFlags], a
	callba_hli Func_fafa8
.asm_abe66:
	ret

Func_abe67:
	ld a, e
	or a
	jp nz, .asm_abf5a
	ld hl, $00df
	scall CheckEventFlag
	or a
	jp nz, .asm_abf54
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $14
	ld a, $16
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	xor a
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $11
	ld e, $10
	ld a, $0f
	scall Func_80e8d
	ld e, $01
	ld hl, $00df
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $02
	xor a
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $12
	scall PlayMusic
	xor a
	scall FacePlayer
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	jp .asm_abf5a
.asm_abf54:
	ld hl, $015c
	scall PrintTextStandard
.asm_abf5a:
	ret

Func_abf5b:
	ld a, e
	or a
	jp nz, .asm_abf79
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_abf73
	ld hl, $0139
	scall PrintTextWithNPCName
	jp .asm_abf79
.asm_abf73:
	ld hl, $0419
	scall PrintTextWithNPCName
.asm_abf79:
	ret

Data_abf7a:
	warpdef $0e, $1c, $04, $01, MAP_25_00, $08, $05, $08, $06, $2e
	warpdef $0e, $05, $04, $01, MAP_25_10, $10, $1a, $10, $19, $2e

Func_abf90:: ; abf90
	ld e, $02
	ld hl, Data_abf7a
	scall LoadWarps
	scall Func_8001c
	ret

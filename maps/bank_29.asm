INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 29", ROMX
	script_library 29

Data_a50b4:
	warpdef $14, $05, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $06, $04, $01, $01, MAP_22_01, $03, $0c, $03, $0b, $34

Data_a50ca:
	dw $2be
	dw -1

Data_a50ce:
	dw $2bf
	dw -1

Data_a50d2:
	person_event $02, $0c, $08, $06, $01, $01, $02, $04, $00, $0000, $0000
	person_event $ff, $00, $12, $05, $01, $01, $00, $04, $01, Func_a5264, $0000
	person_event $ff, $00, $09, $0d, $01, $01, $00, $04, $01, Func_a5264, $0000

Data_a50fc:
	person_event $ff, $00, $13, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ca
	person_event $ff, $00, $13, $06, $01, $01, $00, $04, $00, PrintTextFacePlayer_29, Data_a50ce

Data_a5118:
	person_event $ff, $00, $09, $0f, $01, $01, $00, $04, $01, Func_a5398, $0000

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

Data_a53de:
	warpdef $02, $0c, $02, $01, MAP_22_00, $06, $04, $06, $05, $2e

Data_a53e9:
	warpdef $02, $0c, $02, $01, MAP_24_00, $11, $04, $11, $05, $2e

Data_a53f4:
	dw $18e
	dw -1

Data_a53f8:
	person_event $06, $04, $06, $03, $01, $02, $02, $04, $00, Func_a549d, NULL
	person_event $13, $0c, $06, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $05, $07, $03, $03, $00, $04, $00, Func_a5500, NULL
	person_event $ff, $00, $00, $04, $03, $03, $00, $04, $00, Func_a553a, NULL
	person_event $0e, $04, $06, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_29, Data_a53f4
	person_event $ff, $00, $0a, $04, $03, $03, $00, $04, $00, Func_a55c0, NULL

Func_a544c:: ; a544c
	ld a, $10
	ld [wc789], a
	ld e, $06
	ld hl, Data_a53f8
	scall LoadMapObjects
	ld hl, $0044
	scall CheckEventFlag
	or a
	jp nz, .asm_a546e
	ld e, $01
	ld hl, Data_a53de
	scall LoadWarps
	jp .asm_a547d
.asm_a546e:
	ld e, $01
	ld hl, Data_a53e9
	scall LoadWarps
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
.asm_a547d:
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $0c
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	ld a, $0a
	ld [wc7e2], a
	scall Func_8001c
	ld hl, $0307
	scall LandmarkSign
	ret

Func_a549d:
	ld a, e
	or a
	jp nz, .asm_a54f1
	ld hl, $0017
	scall CheckEventFlag
	or a
	jp nz, .asm_a54ea
	ld hl, $00fe
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $00ff
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $22
	scall Func_80d4d
	cp $ff
	jp nz, .asm_a54df
	ld hl, $0290
	scall PrintTextStandard
	ld c, $02
	ld e, $01
	ld a, $22
	scall Func_80d4d
	cp $ff
	jp nz, .asm_a54df
.asm_a54df:
	ld e, $01
	ld hl, $0017
	scall EventFlagAction
	jp .asm_a54f1
.asm_a54ea:
	ld e, $00
	ld a, $10
	scall Func_806a0
.asm_a54f1:
	ret

Data_a54f2:
	db $06, $09, $06, $08, $06, $09, $05, $07, $07, $09
	db $06, $08, $ff, $ff

Func_a5500:
	ld a, e
	or a
	jp nz, .asm_a5533
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $003c
	scall ScriptSleep
	ld bc, Data_a54f2
	ld e, $29
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_a5533:
	ret

Data_a5534:
	db $03, $07, $01, $07, $ff, $ff

Func_a553a:
	ld a, e
	or a
	jp nz, .asm_a55b9
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a5567
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a5567
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a5567
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_a55b3
.asm_a5567:
	ld a, [wc790]
	or a
	jp z, .asm_a55aa
	ld a, [wc790]
	cp $06
	jp nc, .asm_a55aa
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a55a7
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_a558a
	jp .asm_a5597
.asm_a558a:
	ld c, $01
	ld de, Data_a5534
	ld a, $29
	scall MovePlayer
	scall WaitNPCStep
.asm_a5597:
	call Func_a5640
	ld l, $10
	push hl
	ld c, $01
	ld e, $02
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_a55a7:
	jp .asm_a55b0
.asm_a55aa:
	ld hl, $0377
	scall PrintTextStandard
.asm_a55b0:
	jp .asm_a55b9
.asm_a55b3:
	ld hl, $0376
	scall PrintTextStandard
.asm_a55b9:
	ret

Data_a55ba:
	db $09, $07
	db $0b, $07, $ff, $ff

Func_a55c0:
	ld a, e
	or a
	jp nz, .asm_a563f
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a55ed
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a55ed
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_a55ed
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_a5639
.asm_a55ed:
	ld a, [wc790]
	or a
	jp z, .asm_a5630
	ld a, [wc790]
	cp $06
	jp nc, .asm_a5630
	ld hl, $032d
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a562d
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_a5610
	jp .asm_a561d
.asm_a5610:
	ld c, $01
	ld de, $55ba
	ld a, $29
	scall MovePlayer
	scall WaitNPCStep
.asm_a561d:
	call Func_a5640
	ld l, $12
	push hl
	ld c, $2d
	ld e, $00
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_a562d:
	jp .asm_a5636
.asm_a5630:
	ld hl, $0377
	scall PrintTextStandard
.asm_a5636:
	jp .asm_a563f
.asm_a5639:
	ld hl, $0376
	scall PrintTextStandard
.asm_a563f:
	ret

Func_a5640:
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
	ld a, $01
	scall PlayerFace
	ret

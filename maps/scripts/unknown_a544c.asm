
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

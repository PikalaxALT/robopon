
Data_ae3c9:
	warpdef $0e, $29, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $09, $06, $01, $01, MAP_27_01, $12, $1c, $12, $1b, $2e

Data_ae3df:
IF DEF(SUN)
	wildbot $05, $05, $10, $23, $66, $2a, $2d, $7b, $06, $09, $00, $12, $0a, $00
	wildbot $05, $05, $10, $23, $67, $2a, $2d, $7a, $05, $13, $00, $13, $0a, $00
	wildbot $05, $05, $10, $23, $3f, $2c, $2f, $26, $0c, $0f, $00, $06, $05, $00
	wildbot $05, $05, $10, $23, $68, $2d, $30, $7a, $05, $05, $05, $12, $04, $00
ELIF DEF(STAR)
	wildbot $05, $05, $10, $23, $66, $2a, $2d, $7b, $06, $09, $00, $12, $0a, $00
	wildbot $05, $05, $10, $23, $67, $2a, $2d, $7a, $05, $13, $00, $13, $0a, $00
	wildbot $05, $05, $10, $23, $3f, $2c, $2f, $26, $0c, $0f, $00, $06, $05, $00
	wildbot $05, $05, $10, $23, $68, $2d, $30, $7a, $05, $05, $05, $12, $04, $00
ENDC

Data_ae417:
	dw $02e
	dw -1

Data_ae41b:
	person_event $ff, $00, $12, $08, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $12, $12, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $05, $18, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $05, $21, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $0f, $04, $0d, $21, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0d, $21, $01, $01, $02, $04, $01, Func_ae56c, NULL
	person_event $ff, $00, $0c, $28, $02, $01, $00, $04, $00, PrintTextFacePlayer_2b_2, Data_ae417
	person_event $ff, $00, $0f, $28, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b_2, Data_ae417

Func_ae48b:: ; ae48b
	ld a, $0e
	ld [wc7e2], a
	ld e, $02
	ld hl, Data_ae3c9
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $04
	ld hl, Data_ae3df
	scall LoadEncounters
	ld e, $08
	ld hl, Data_ae41b
	scall LoadMapObjects
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, .asm_ae4d2
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, .asm_ae4d2
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp z, .asm_ae4da
.asm_ae4d2:
	ld a, $03
	scall LoadPlayerSprite
	jp .asm_ae4f1
.asm_ae4da:
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, .asm_ae4ec
	ld a, $02
	scall LoadPlayerSprite
	jp .asm_ae4f1
.asm_ae4ec:
	ld a, $01
	scall LoadPlayerSprite
.asm_ae4f1:
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	ret

Func_ae4fa:
	push de
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, $20
	scall Func_80e6d
	cp $ff
	jp nz, .asm_ae563
	ld a, $21
	scall Func_80e6d
	cp $ff
	jp nz, .asm_ae563
	ld a, $7e
	scall Func_80e6d
	cp $ff
	jp nz, .asm_ae563
	ld hl, sp+$04
	ld a, [hl]
	cp $02
	jp nz, .asm_ae560
	ld hl, $035a
	scall PrintTextStandard
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_ae54b
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_ae553
.asm_ae54b:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_ae553:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2b
	scall MovePlayer
.asm_ae560:
	jp .asm_ae568
.asm_ae563:
	ld a, $03
	scall LoadPlayerSprite
.asm_ae568:
	pop bc
	pop bc
	pop bc
	ret

Func_ae56c:
	ld a, e
	or a
	jp nz, .asm_ae674
	ld hl, $00e0
	scall CheckEventFlag
	or a
	jp nz, .asm_ae66e
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $21
	ld a, $0d
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $04
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld e, $00
	ld a, $04
	scall SpriteFace
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld e, $00
	ld a, $04
	scall SpriteFace
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	ld a, $04
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ld a, $04
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $07
	ld e, $04
	ld a, $01
	scall Func_80e8d
	ld e, $01
	ld hl, $00e0
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld e, $00
	ld a, $04
	scall SpriteFace
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld e, $03
	ld a, $04
	scall SpriteFace
	ld e, $00
	ld a, $04
	scall SpriteFace
	ld e, $01
	ld a, $04
	scall SpriteFace
	ld e, $02
	ld a, $04
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $13
	scall PlayMusic
	ld a, $04
	scall FacePlayer
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	jp .asm_ae674
.asm_ae66e:
	ld hl, $015c
	scall PrintTextStandard
.asm_ae674:
	ret

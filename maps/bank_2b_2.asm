INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2b, 2", ROMX
	script_library 2b_2

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

Data_ae675:
	warpdef $11, $1c, $03, $01, MAP_27_00, $09, $06, $09, $07, $2e
	warpdef $0f, $0c, $01, $01, MAP_27_02, $11, $0c, $11, $0b, $2e
	warpdef $14, $0c, $01, $01, MAP_27_02, $16, $0c, $17, $0c, $2e

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

Data_ae875:
	warpdef $11, $0c, $01, $01, MAP_27_01, $0f, $0c, $0f, $0b, $2e
	warpdef $16, $0c, $01, $01, MAP_27_01, $14, $0c, $14, $0b, $2e
	warpdef $19, $14, $01, $01, MAP_27_03, $14, $0c, $14, $0d, $2e
	warpdef $1e, $14, $01, $01, MAP_27_03, $19, $0c, $19, $0b, $2e

Data_ae8a1:
IF DEF(SUN)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $49, $2b, $2e, $06, $02, $02, $02, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ENDC

Func_ae8e7:: ; ae8e7
	ld e, $04
	ld hl, Data_ae875
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae8a1
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0316
	scall LandmarkSign
	ret

Data_ae90b:
	warpdef $14, $0c, $01, $01, MAP_27_02, $19, $14, $18, $14, $2e
	warpdef $19, $0c, $01, $01, MAP_27_02, $1e, $14, $1e, $13, $2e
	warpdef $11, $04, $01, $01, MAP_27_04, $09, $04, $08, $04, $2e
	warpdef $1e, $04, $01, $01, MAP_27_04, $16, $04, $15, $04, $2e

Data_ae937:
IF DEF(SUN)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ENDC

Func_ae97d:: ; ae97d
	ld e, $04
	ld hl, Data_ae90b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae937
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0317
	scall LandmarkSign
	ret

Data_ae9a1:
	warpdef $09, $04, $01, $01, MAP_27_03, $11, $04, $11, $05, $2e
	warpdef $16, $04, $01, $01, MAP_27_03, $1e, $04, $1e, $05, $2e
	warpdef $01, $0c, $01, $01, MAP_27_05, $0d, $0c, $0d, $0b, $2e

Data_ae9c2:
	db $44, $15, $0a, $02, $76

Data_ae9c7:
IF DEF(SUN)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ENDC

Data_aea0d:
	person_event $ff, $00, $06, $0f, $03, $01, $01, $04, $01, Func_aea4f, NULL

Func_aea1b:: ; aea1b
	ld e, $03
	ld hl, Data_ae9a1
	scall LoadWarps
	ld e, $01
	ld hl, Data_ae9c2
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ae9c7
	scall LoadEncounters
	ld e, $01
	ld hl, Data_aea0d
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0318
	scall LandmarkSign
	ret

Func_aea4f:
	ld a, e
	cp $02
	jp nz, .asm_aea7f
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld a, $02
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $0e
	ld e, $07
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_aea7f:
	ret

Data_aea80:
	warpdef $0d, $0c, $01, $01, MAP_27_04, $01, $0c, $01, $0b, $2e
	warpdef $01, $11, $01, $01, MAP_27_06, $09, $08, $09, $09, $2e

Data_aea96:
	db $45, $19, $16, $02, $6c

Data_aea9b:
IF DEF(SUN)
	wildbot $00, $03, $1a, $15, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1a, $15, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $86, $32, $35, $7f, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aeae1:: ; aeae1
	ld e, $02
	ld hl, Data_aea80
	scall LoadWarps
	ld e, $01
	ld hl, Data_aea96
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aea9b
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $0319
	scall LandmarkSign
	ret

Data_aeb0d:
	warpdef $09, $08, $01, $01, MAP_27_05, $01, $11, $01, $12, $2e
	warpdef $01, $08, $01, $01, MAP_27_07, $01, $07, $01, $06, $2e

Data_aeb23:
	db $46, $18, $07, $01, $42

Data_aeb28:
IF DEF(SUN)
	wildbot $00, $06, $19, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $06, $19, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aeb6e:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL
	person_event $00, $0c, $18, $06, $01, $01, $02, $04, $00, Func_aec4d, NULL

Data_aeb8a:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL

Func_aeb98:: ; aeb98
	call Func_aebfc
	ld hl, Func_aebfc
	scall Func_80f11
	ld e, $02
	ld hl, Data_aeb0d
	scall LoadWarps
	ld e, $01
	ld hl, Data_aeb23
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aeb28
	scall LoadEncounters
	ld hl, $00d4
	scall CheckEventFlag
	or a
	jp nz, .asm_aebd3
	ld e, $02
	ld hl, Data_aeb6e
	scall LoadMapObjects
	jp .asm_aebdb
.asm_aebd3:
	ld e, $01
	ld hl, Data_aeb8a
	scall LoadMapObjects
.asm_aebdb:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031a
	scall LandmarkSign
	ret

Data_aebea:
	db $00, $00, $01, $01, $18, $03

Data_aebf0:
	db $00, $00, $01, $01, $18, $04

Data_aebf6:
	db $00, $00, $01, $01, $18, $05

Func_aebfc:
	ld hl, $00d4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_aec1c
	ld hl, Data_aebea
	scall Func_80d9b
	ld hl, Data_aebf0
	scall Func_80d9b
	ld hl, Data_aebf6
	scall Func_80d9b
	scall Func_80f02
.asm_aec1c:
	ret

Func_aec1d:
	ld a, e
	cp $02
	jp nz, .asm_aec48
	xor a
	scall Func_80653
	ld c, $01
	ld e, $01
	ld a, $1b
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld l, $08
	push hl
	ld c, $06
	ld e, $08
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_aec48:
	ret

Data_aec49:
	db $18, $01, $ff, $ff

Func_aec4d:
	ld a, e
	or a
	jp nz, .asm_aecf8
	xor a
	scall PlayerFace
	ld e, $00
	ld a, $01
	scall SpriteFace
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
	ld hl, $0142
	scall PrintTextWithNPCName
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
	ld a, [wMapX]
	add a, $05
	cp $19
	jp nz, .asm_aecb0
	ld a, $03
	scall PlayerFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	jp .asm_aecbc
.asm_aecb0:
	ld a, $01
	scall PlayerFace
	ld e, $03
	ld a, $01
	scall SpriteFace
.asm_aecbc:
	ld hl, $0143
	scall PrintTextWithNPCName
	scall Func_81094
	or a
	jp nz, .asm_aecf8
	ld e, $01
	ld hl, $00d4
	scall EventFlagAction
	call Func_aebfc
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld hl, $0144
	scall PrintTextWithNPCName
	ld bc, Data_aec49
	ld e, $2b
	ld a, $01
	scall MovePersonAndWait
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_aecf8:
	ret

Data_aecf9:
	warpdef $01, $07, $01, $01, MAP_27_06, $01, $08, $01, $09, $2e

Data_aed04:
IF DEF(SUN)
	wildbot $00, $03, $10, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $10, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aed4a:: ; aed4a
	ld l, $00
	push hl
	ld c, $07
	ld e, $08
	ld a, $06
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $09
	ld a, $05
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $0c
	scall Func_80f24
	pop bc
	ld e, $01
	ld hl, Data_aecf9
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aed04
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031b
	scall LandmarkSign
	ret

Data_aeda2:
	warpdef $12, $14, $01, $01, MAP_27_09, $12, $04, $11, $04, $2e

Data_aedad:
	db $47, $0a, $03, $02, $63

Data_aedb2:
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aedf8:: ; aedf8
	ld l, $00
	push hl
	ld c, $06
	ld e, $07
	ld a, $0e
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $06
	ld e, $08
	ld a, $02
	scall Func_80f24
	pop bc
	ld l, $00
	push hl
	ld c, $09
	ld e, $0e
	ld a, $08
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $05
	ld e, $09
	ld a, $01
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $0d
	ld a, $04
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $02
	ld e, $07
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0f
	ld a, $07
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $06
	ld e, $06
	ld a, $0a
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $08
	ld a, $0d
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $03
	ld e, $0c
	ld a, $10
	scall Func_80f24
	pop bc
	ld l, $01
	push hl
	ld c, $08
	ld e, $08
	ld a, $13
	scall Func_80f24
	pop bc
	ld e, $01
	ld hl, Data_aeda2
	scall LoadWarps
	ld e, $01
	ld hl, Data_aedad
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aedb2
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031c
	scall LandmarkSign
	ret

Data_aeeb3:
	db $12, $04, $01, $01, $1b, $08, $12, $14, $11, $14, $2e
	db $0a, $04, $01, $01, $1b, $0a, $09, $04, $0a, $04, $2e
	db $05, $04, $01, $01, $1b, $0a, $04, $04, $04, $05, $2e

Data_aeed4:
	db $4b, $13, $05, $02, $56

Data_aeed9:
IF DEF(SUN)
	db $00, $03, $14, $14, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	db $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	db $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	db $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $14, $14, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	db $00, $03, $14, $14, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	db $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	db $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	db $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $14, $14, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aef1f:
	person_event $1b, $04, $05, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $04, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $06, $0e, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Data_aef9d:
	person_event $1b, $04, $04, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $07, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $03, $0f, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Func_af01b:: ; af01b
	ld e, $03
	ld hl, Data_aeeb3
	scall LoadWarps
	ld e, $01
	ld hl, Data_aeed4
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_aeed9
	scall LoadEncounters
	ld hl, $004e
	scall CheckEventFlag
	or a
	jp nz, .asm_af057
	ld hl, $004d
	scall CheckEventFlag
	or a
	jp nz, .asm_af057
	ld e, $09
	ld hl, Data_aef1f
	scall LoadMapObjects
	jp .asm_af074
.asm_af057:
	ld hl, $004e
	scall CheckEventFlag
	or a
	jp nz, .asm_af074
	ld hl, $004d
	scall CheckEventFlag
	cp $01
	jp nz, .asm_af074
	ld e, $09
	ld hl, Data_aef9d
	scall LoadMapObjects
.asm_af074:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031d
	scall LandmarkSign
	ret

Func_af083:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0a2
	cp $01
	jp nz, .asm_af0a5
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af09f
	ld a, $01
	ld [wc7c4], a
.asm_af09f:
	jp .asm_af0a5
.asm_af0a2:
	call Func_af113
.asm_af0a5:
	pop bc
	ret

Func_af0a7:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0c6
	cp $01
	jp nz, .asm_af0c9
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af0c3
	ld a, $01
	ld [wc7c4], a
.asm_af0c3:
	jp .asm_af0c9
.asm_af0c6:
	call Func_af113
.asm_af0c9:
	pop bc
	ret

Func_af0cb:
	push af
	ld a, e
	cp $03
	jp z, .asm_af0ea
	cp $01
	jp nz, .asm_af0ed
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af0e7
	ld a, $01
	ld [wc7c4], a
.asm_af0e7:
	jp .asm_af0ed
.asm_af0ea:
	call Func_af113
.asm_af0ed:
	pop bc
	ret

Func_af0ef:
	push af
	ld a, e
	cp $03
	jp z, .asm_af10e
	cp $01
	jp nz, .asm_af111
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_af10b
	ld a, $01
	ld [wc7c4], a
.asm_af10b:
	jp .asm_af111
.asm_af10e:
	call Func_af113
.asm_af111:
	pop bc
	ret

Func_af113:
	push bc
	ld hl, sp+$01
	ld [hl], $04
.asm_af118:
	ld hl, sp+$01
	ld a, [hl]
	cp $08
	jp nc, .asm_af15c
	ld hl, sp+$00
	ld [hl], $00
.asm_af124:
	ld hl, sp+$00
	ld a, [hl]
	cp $04
	jp nc, .asm_af152
	ld hl, sp+$01
	ld e, [hl]
	ld hl, sp+$00
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	cp $01
	jp nz, .asm_af13d
	jp .asm_af152
.asm_af13d:
	ld hl, sp+$00
	ld a, [hl]
	cp $03
	jp nz, .asm_af148
	jp .asm_af15f
.asm_af148:
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
	jp .asm_af124
.asm_af152:
	ld hl, sp+$01
	ld a, [hl]
	inc a
	ld hl, sp+$01
	ld [hl], a
	jp .asm_af118
.asm_af15c:
	call Func_af161
.asm_af15f:
	pop bc
	ret

Func_af161:
	ld e, $01
	ld hl, $004e
	scall EventFlagAction
	ld a, $2b
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ret

Func_af1b1:
	push af
	ld a, e
	or a
	jp nz, .asm_af223
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $004d
	scall CheckEventFlag
	or a
	jp nz, .asm_af21d
	ld hl, $004e
	scall CheckEventFlag
	or a
	jp nz, .asm_af21d
	ld hl, $013b
	scall PrintTextWithNPCName
	ld a, $24
	scall Func_80e5d
	cp $01
	jp nz, .asm_af214
	ld hl, $013c
	scall PrintTextWithNPCName
	ld hl, $013d
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_af20b
	ld c, $01
	ld e, $01
	ld a, $24
	scall Func_80d4d
	ld e, $01
	ld hl, $004d
	scall EventFlagAction
	ld hl, $013e
	scall PrintTextWithNPCName
	jp .asm_af211
.asm_af20b:
	ld hl, $013f
	scall PrintTextWithNPCName
.asm_af211:
	jp .asm_af21a
.asm_af214:
	ld hl, $013c
	scall PrintTextWithNPCName
.asm_af21a:
	jp .asm_af223
.asm_af21d:
	ld hl, $0141
	scall PrintTextWithNPCName
.asm_af223:
	pop bc
	ret

Data_af225:
	warpdef $09, $04, $01, $01, MAP_27_09, $0a, $04, $0b, $04, $2e
	warpdef $04, $04, $01, $01, MAP_27_09, $05, $04, $05, $05, $2e
	warpdef $04, $0e, $01, $01, MAP_27_11, $04, $15, $04, $14, $2e

Data_af246:
IF DEF(SUN)
	wildbot $00, $03, $12, $1c, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $12, $1c, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $12, $1c, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $12, $1c, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $12, $1c, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $12, $1c, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_af28c:
	person_event $00, $0c, $04, $12, $01, $01, $00, $04, $00, Func_af34c, NULL

Func_af29a:: ; af29a
	call Func_af309
	ld hl, Func_af309
	scall Func_80f11
	ld e, $03
	ld hl, Data_af225
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_af246
	scall LoadEncounters
	ld hl, $004f
	scall CheckEventFlag
	or a
	jp nz, .asm_af2ca
	ld e, $01
	ld hl, Data_af28c
	scall LoadMapObjects
.asm_af2ca:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031e
	scall LandmarkSign
	ret

Data_af2d9:
	db $12, $1d, $01, $01, $03, $0d

Data_af2df:
	db $12, $1d, $01, $01, $05, $0d

Data_af2e5:
	db $12, $1d, $01, $01, $03, $0f

Data_af2eb:
	db $12, $1d, $01, $01, $05, $0f

Data_af2f1:
	db $11, $1d, $01, $01, $03, $10

Data_af2f7:
	db $11, $1d, $01, $01, $05, $10

Data_af2fd:
	db $12, $1e, $01, $01, $04, $10

Data_af303:
	db $12, $1e, $01, $01, $04, $11

Func_af309:
	ld hl, $004e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_af347
	ld hl, Data_af2d9
	scall Func_80d9b
	ld hl, Data_af2df
	scall Func_80d9b
	ld hl, Data_af2e5
	scall Func_80d9b
	ld hl, Data_af2eb
	scall Func_80d9b
	ld hl, Data_af2f1
	scall Func_80d9b
	ld hl, Data_af2f7
	scall Func_80d9b
	ld hl, Data_af2fd
	scall Func_80d9b
	ld hl, Data_af303
	scall Func_80d9b
	scall Func_80f02
.asm_af347:
	ret

Data_af348:
	db $04, $0e, $ff, $ff

Func_af34c:
	ld a, e
	or a
	jp nz, .asm_af384
	ld hl, $004e
	scall CheckEventFlag
	or a
	jp nz, .asm_af364
	ld hl, $0145
	scall PrintTextWithNPCName
	jp .asm_af384
.asm_af364:
	ld hl, $0146
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $004f
	scall EventFlagAction
	ld bc, Data_af348
	ld e, $2b
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
.asm_af384:
	ret

Data_af385:
	warpdef $04, $15, $01, $01, MAP_27_10, $04, $0e, $04, $0f, $2e

Data_af390:
	db $00, $04, $07, $01, $15

Data_af395:
IF DEF(SUN)
	wildbot $00, $03, $09, $17, $48, $30, $33, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $09, $17, $49, $30, $33, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $09, $17, $89, $35, $38, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $09, $17, $49, $30, $33, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $09, $17, $48, $30, $33, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $09, $17, $86, $35, $38, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_af3bf:
	person_event $ff, $00, $03, $0b, $03, $01, $00, $04, $01, Func_af46a, NULL
	person_event $00, $04, $04, $08, $01, $01, $02, $04, $00, Func_af4c3, NULL

Data_af3db:
	person_event $00, $04, $04, $08, $01, $01, $02, $04, $00, Func_af4c3, NULL

Func_af3e9:: ; af3e9
	ld e, $01
	ld hl, Data_af385
	scall LoadWarps
	ld e, $01
	ld hl, Data_af390
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_af395
	scall LoadEncounters
	ld hl, $0050
	scall CheckEventFlag
	or a
	jp nz, .asm_af41b
	ld e, $02
	ld hl, Data_af3bf
	scall LoadMapObjects
	jp .asm_af432
.asm_af41b:
	ld e, $02
	ld hl, Data_af3bf
	scall LoadMapObjects
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, Data_af3db
	scall LoadMapObjects
.asm_af432:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $031f
	scall LandmarkSign
	ret

Data_af441:
IF DEF(SUN)
	db $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $a9, $07, $41, $1d, $1d, $1d, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09
ELIF DEF(STAR)
	db $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $aa, $07, $41, $1a, $1a, $1a, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09
ENDC

Func_af46a:
	ld a, e
	cp $02
	jp nz, .asm_af4bd
	ld hl, $0050
	scall CheckEventFlag
	or a
	jp nz, .asm_af4a1
	ld hl, $0147
	scall PrintTextWithNPCName
	ld de, Data_af4be
	ld hl, Data_af441
	scall ScriptedBattle
	or a
	jp nz, .asm_af490
	jp .asm_af4bd
.asm_af490:
	ld e, $01
	ld hl, $0050
	scall EventFlagAction
	ld hl, $0148
	scall PrintTextWithNPCName
	jp .asm_af4bd
.asm_af4a1:
	ld hl, $0149
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_af4bd
	ld a, $5a
	scall PlaySFX
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af4bd:
	ret

Data_af4be:
	db $ca, $dd, $c0, $b0, $00

Func_af4c3:
	push af
	ld a, e
	or a
	jp nz, .asm_af537
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0048
	scall CheckEventFlag
	or a
	jp nz, .asm_af505
	ld a, $15
	scall Func_80e5d
	or a
	jp z, .asm_af4fc
	ld hl, $0149
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_af4f9
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af4f9:
	jp .asm_af502
.asm_af4fc:
	ld hl, $0148
	scall PrintTextWithNPCName
.asm_af502:
	jp .asm_af537
.asm_af505:
	ld hl, $0100
	scall CheckEventFlag
	or a
	jp nz, .asm_af520
	ld hl, $033a
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $0100
	scall EventFlagAction
	jp .asm_af537
.asm_af520:
	ld hl, $0149
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_af537
	ld l, $1b
	push hl
	ld c, $12
	ld e, $01
	ld a, $1b
	scall Func_80dff
	pop bc
.asm_af537:
	pop bc
	ret

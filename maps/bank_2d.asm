INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2d", ROMX
	script_library 2d

Data_b50b4:
	warpdef $00, $1f, $02, $01, MAP_30_02, $01, $00, $01, $01, $2e
	warpdef $2f, $03, $01, $03, MAP_30_01, $00, $04, $01, $04, $2e
	warpdef $0c, $0b, $01, $01, MAP_12_00, $0d, $0f, $0d, $0e, $2e
	warpdef $25, $0b, $01, $01, MAP_02_00, $16, $07, $16, $08, $2e
	warpdef $2d, $12, $01, $01, MAP_22_01, $0b, $06, $0b, $07, $2e

Data_b50eb:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $66, $02, $02, $05, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $64, $19, $23, $67, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $67, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $19, $23, $66, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $14, $1e, $67, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $66, $02, $02, $00, $0e, $0a, $00
ENDC

Data_b5131:
	db $4c, $10, $0a, $01, $32
	db $4d, $17, $03, $01, $45
	db $4e, $2c, $0c, $01, $41

Data_b5140:
	dw $472
	dw -1

Data_b5144:
	person_event $26, $04, $2d, $12, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b5140

Func_b5152:: ; b5152
	ld a, $14
	ld [wc7e2], a
	ld e, $05
	ld hl, Data_b50b4
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b50eb
	scall LoadEncounters
	ld e, $03
	ld hl, Data_b5131
	scall Func_80ce7
	ld hl, $0021
	scall CheckEventFlag
	or a
	jp nz, .asm_b5186
	ld e, $01
	ld hl, Data_b5144
	scall LoadMapObjects
.asm_b5186:
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_b5194:
	warpdef $00, $03, $01, $03, MAP_30_00, $2f, $04, $2e, $04, $2e
	warpdef $2e, $1f, $02, $01, MAP_30_03, $2e, $00, $2e, $01, $2e
	warpdef $0a, $12, $01, $01, MAP_25_01, $13, $09, $13, $0a, $2e
	warpdef $2e, $04, $01, $01, MAP_08_01, $05, $16, $05, $17, $2e

Data_b51c0:
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0f, $0a, $00

Data_b5206:
	db $4f, $29, $04, $01, $44
	db $50, $1d, $0b, $01, $4e
	db $51, $25, $12, $01, $37

Func_b5215:: ; b5215
	ld a, $14
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_b5194
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b51c0
	scall LoadEncounters
	ld e, $03
	ld hl, Data_b5206
	scall Func_80ce7
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_b5245:
	warpdef $00, $00, $02, $01, MAP_30_00, $01, $1f, $01, $1e, $2e
	warpdef $2f, $1d, $01, $03, MAP_30_03, $00, $1e, $01, $1e, $2e
	warpdef $01, $10, $01, $01, MAP_22_01, $01, $06, $01, $07, $2e
	warpdef $2d, $09, $01, $01, MAP_01_00, $07, $06, $07, $07, $2e

Data_b5271:
IF DEF(SUN)
	db $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	db $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	db $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	db $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	db $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	db $00, $03, $30, $1d, $10, $14, $1e, $67, $0e, $0e, $0e, $04, $0a, $00
	db $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	db $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	db $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
ENDC

Data_b52b7:
	db $52, $0a, $11, $03, $27
	db $53, $0e, $1e, $01, $0f

Data_b52c1:
	dw $472
	dw -1

Data_b52c5:
	person_event $26, $04, $01, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_2d, Data_b52c1

Func_b52d3:: ; b52d3
	ld a, $14
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_b5245
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5271
	scall LoadEncounters
	ld e, $02
	ld hl, Data_b52b7
	scall Func_80ce7
	ld hl, $0021
	scall CheckEventFlag
	or a
	jp nz, .asm_b5307
	ld e, $01
	ld hl, Data_b52c5
	scall LoadMapObjects
.asm_b5307:
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_b5315:
	warpdef $00, $1d, $01, $03, MAP_30_02, $2f, $1e, $2e, $1e, $2e
	warpdef $2e, $00, $02, $01, MAP_30_01, $2e, $1f, $2e, $1e, $2e
	warpdef $18, $1e, $01, $01, MAP_11_00, $0e, $09, $0e, $0a, $2e
	warpdef $2e, $1e, $01, $01, MAP_03_15, $04, $0a, $04, $0b, $2e

Data_b5341:
	db $54, $07, $16, $02, $1f
	db $55, $01, $08, $01, $39

Data_b534b:
IF DEF(SUN)
	wildbot $00, $03, $30, $1d, $65, $19, $23, $67, $02, $02, $00, $0e, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $03, $30, $1d, $42, $19, $23, $67, $02, $02, $05, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $64, $19, $23, $78, $0d, $09, $0a, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $40, $14, $1e, $78, $02, $09, $00, $04, $0a, $00
	wildbot $00, $03, $30, $1d, $51, $14, $1e, $67, $02, $11, $00, $0f, $0a, $00
	wildbot $00, $03, $30, $1d, $41, $19, $23, $78, $0e, $0e, $00, $04, $0a, $00
ENDC

Func_b5391:: ; b5391
	ld a, $14
	ld [wc7e2], a
	ld e, $04
	ld hl, Data_b5315
	scall LoadWarps
	ld e, $02
	ld hl, Data_b5341
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b534b
	scall LoadEncounters
	ld a, $0a
	scall PlayMusic
	ld a, $04
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_b53c1:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b53cc:
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $07, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b53e2:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $54, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $28, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $12, $06, $06, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b5428:
	person_event $19, $0c, $0c, $0b, $01, $01, $03, $04, $00, NULL, NULL

Data_b5436:
	person_event $ff, $00, $0d, $02, $01, $01, $00, $04, $01, Func_b5576, NULL
	person_event $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, Func_b55be, NULL

Func_b5452:: ; b5452
	ld a, [wc790]
	or a
	jp z, .asm_b5475
	ld a, [wc790]
	cp $03
	jp nc, .asm_b5475
	call Func_b556c
	ld hl, Func_b556c
	scall Func_80f11
	ld e, $02
	ld hl, Data_b53cc
	scall LoadWarps
	jp .asm_b547d
.asm_b5475:
	ld e, $01
	ld hl, Data_b53c1
	scall LoadWarps
.asm_b547d:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b53e2
	scall LoadEncounters
	ld a, $0f
	ld [wc7e2], a
	ld hl, $0034
	scall CheckEventFlag
	or a
	jp nz, .asm_b54c0
	ld e, $01
	ld hl, Data_b5428
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_b5436
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
	call Func_b5526
	ld e, $01
	ld hl, $0034
	scall EventFlagAction
	jp .asm_b551f
.asm_b54c0:
	ld e, $02
	ld hl, Data_b5436
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5516
	ld a, [wBackupMapNumber]
	cp $08
	jp nz, .asm_b5516
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_b5516
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b5516
	ld hl, $00ff
	scall CheckEventFlag
	or a
	jp nz, .asm_b550a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
	call Func_b55fd
	jp .asm_b5513
.asm_b550a:
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
.asm_b5513:
	jp .asm_b551f
.asm_b5516:
	scall Func_8001c
	ld hl, $0314
	scall LandmarkSign
.asm_b551f:
	ret

Data_b5520:
	db $0c, $0c, $0b, $0c, $ff, $ff

Func_b5526:
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $18
	scall PlayMusic
	ld hl, $012a
	scall PrintTextWithNPCName
	ld a, $18
	scall PlayMusic
	ld bc, Data_b5520
	ld e, $2d
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $2e
	scall PlaySFX
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $09
	scall PlayMusic
	ret

Data_b5566:
	db $0d, $02, $01, $01, $07, $01

Func_b556c:
	ld hl, Data_b5566
	scall Func_80d9b
	scall Func_80f02
	ret

Func_b5576:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b55bb
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b55a6
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b55ae
.asm_b55a6:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b55ae:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b55bb:
	pop bc
	pop bc
	ret

Func_b55be:
	ld a, e
	cp $02
	jp nz, .asm_b55fc
	ld hl, $00b4
	scall LandmarkSign
	ld e, $00
	ld hl, $00fe
	scall EventFlagAction
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
	ld a, $02
	scall PlayerFace
	ld l, $0c
	push hl
	ld c, $0b
	ld e, $08
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b55fc:
	ret

Func_b55fd:
	ld a, $09
	scall PlayMusic
	ld a, $02
	scall PlayerFace
	ld c, $01
	ld e, $02
	ld a, $09
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld e, $01
	ld hl, $00ff
	scall EventFlagAction
	ret

Data_b562f:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b563a:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b5680:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b56ba, NULL

Func_b568e:: ; b568e
	ld e, $01
	ld hl, Data_b562f
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b563a
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5680
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $0313
	scall LandmarkSign
	ret

Func_b56ba:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b56ff
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b56ea
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b56f2
.asm_b56ea:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b56f2:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b56ff:
	pop bc
	pop bc
	ret

Data_b5702:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5718:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b575e:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5798, NULL

Func_b576c:: ; b576c
	ld e, $02
	ld hl, Data_b5702
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5718
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b575e
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $0312
	scall LandmarkSign
	ret

Func_b5798:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b57dd
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b57c8
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b57d0
.asm_b57c8:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b57d0:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b57dd:
	pop bc
	pop bc
	ret

Data_b57e0:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b57f6:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $88, $25, $28, $7a, $04, $04, $00, $05, $0a, $00
	wildbot $00, $02, $0f, $0e, $70, $26, $29, $53, $01, $10, $00, $10, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3d, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $4b, $28, $2b, $26, $0e, $08, $14, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $7d, $29, $2c, $11, $06, $08, $11, $13, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $25, $28, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $26, $29, $26, $01, $02, $00, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $27, $2a, $3f, $07, $11, $14, $05, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $28, $2b, $12, $06, $06, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $28, $0e, $08, $14, $12, $06, $00
ENDC

Data_b583c:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5876, NULL

Func_b584a:: ; b584a
	ld e, $02
	ld hl, Data_b57e0
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b57f6
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b583c
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $0311
	scall LandmarkSign
	ret

Func_b5876:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b58bb
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b58a6
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b58ae
.asm_b58a6:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b58ae:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b58bb:
	pop bc
	pop bc
	ret

Func_b58be:
	scall Func_8001c
	ld hl, $0310
	scall LandmarkSign
	ret

Data_b58c8:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00,
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00,
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b590e:
	db $83, $00, $07, $02, $7c
	db $84, $06, $0d, $03, $2b
	db $85, $0b, $04, $01, $4a

Data_b591d:
	db $ff, $00, $0b, $0c, $01, $01, $00, $04, $01, $2d, $d9, $59, $00, $00
	db $ff, $00, $09, $0a, $01, $01, $00, $04, $01, $2d, $18, $5a, $00, $00

Func_b5939:: ; b5939
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b58c8
	scall LoadEncounters
	ld e, $03
	ld hl, Data_b590e
	scall Func_80ce7
	ld e, $02
	ld hl, Data_b591d
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5998
	ld a, [wBackupMapNumber]
	cp $0d
	jp nz, .asm_b5998
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_b5998
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b5998
	ld hl, $00fe
	scall CheckEventFlag
	or a
	jp nz, .asm_b5992
	xor a
	scall Func_80653
	call Func_b58be
	call Func_b5a57
	jp .asm_b5995
.asm_b5992:
	call Func_b58be
.asm_b5995:
	jp .asm_b59d8
.asm_b5998:
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b59d5
	ld a, [wBackupMapNumber]
	cp $04
	jp nz, .asm_b59d5
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_b59d5
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b59d5
	ld hl, $00fe
	scall CheckEventFlag
	or a
	jp nz, .asm_b59cf
	xor a
	scall Func_80653
	call Func_b58be
	call Func_b5a57
	jp .asm_b59d2
.asm_b59cf:
	call Func_b58be
.asm_b59d2:
	jp .asm_b59d8
.asm_b59d5:
	call Func_b58be
.asm_b59d8:
	ret

Func_b59d9:
	ld a, e
	cp $02
	jp nz, .asm_b5a17
	ld hl, $046c
	scall LandmarkSign
	ld e, $00
	ld hl, $00ff
	scall EventFlagAction
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
	ld a, $02
	scall PlayerFace
	ld l, $0c
	push hl
	ld c, $0b
	ld e, $04
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b5a17:
	ret

Func_b5a18:
	ld a, e
	cp $02
	jp nz, .asm_b5a56
	ld hl, $0464
	scall LandmarkSign
	ld e, $00
	ld hl, $00fd
	scall EventFlagAction
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
	ld a, $02
	scall PlayerFace
	ld l, $0a
	push hl
	ld c, $09
	ld e, $0d
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b5a56:
	ret

Func_b5a57:
	ld a, $09
	scall PlayMusic
	ld a, $02
	scall PlayerFace
	ld c, $01
	ld e, $02
	ld a, $09
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld e, $01
	ld hl, $00fe
	scall EventFlagAction
	ret

Data_b5a89:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5a94:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5ada:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5b14, NULL

Func_b5ae8:: ; b5ae8
	ld e, $01
	ld hl, Data_b5a89
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5a94
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5ada
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $030f
	scall LandmarkSign
	ret

Func_b5b14:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5b59
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5b44
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5b4c
.asm_b5b44:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5b4c:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5b59:
	pop bc
	pop bc
	ret

Data_b5b5c:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5b67:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $52, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3c, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $01, $02, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5bad:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5be7, NULL

Func_b5bbb:: ; b5bbb
	ld e, $01
	ld hl, Data_b5b5c
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5b67
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5bad
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $030e
	scall LandmarkSign
	ret

Func_b5be7:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5c2c
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5c17
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5c1f
.asm_b5c17:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5c1f:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5c2c:
	pop bc
	pop bc
	ret

Data_b5c2f:
	warpdef $07, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5c45:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $70, $27, $2a, $53, $01, $10, $00, $10, $0a, $00
	wildbot $00, $02, $0f, $0e, $4a, $28, $2b, $3d, $07, $11, $14, $06, $09, $00
	wildbot $00, $02, $0f, $0e, $4b, $29, $2c, $26, $0e, $08, $14, $12, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $11, $06, $08, $11, $13, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2b, $2e, $26, $06, $07, $00, $12, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $85, $27, $2a, $7b, $14, $0d, $1f, $11, $0a, $00
	wildbot $00, $02, $0f, $0e, $4f, $28, $2b, $26, $01, $02, $00, $13, $09, $00
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $08, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $4b, $2b, $2e, $28, $0e, $08, $14, $13, $06, $00
ENDC

Data_b5c8b:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5cc5, NULL

Func_b5c99:: ; b5c99
	ld e, $02
	ld hl, Data_b5c2f
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5c45
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5c8b
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $030d
	scall LandmarkSign
	ret

Func_b5cc5:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5d0a
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5cf5
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5cfd
.asm_b5cf5:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5cfd:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5d0a:
	pop bc
	pop bc
	ret

Data_b5d0d:
	warpdef $0d, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5d18:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3d, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $4b, $2a, $2d, $26, $0e, $08, $14, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $7d, $2b, $2e, $11, $06, $08, $11, $13, $08, $00
	wildbot $00, $02, $0f, $0e, $4f, $2c, $2f, $26, $06, $07, $00, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04, $04, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $70, $2b, $2e, $53, $01, $10, $00, $10, $08, $00
	wildbot $00, $02, $0f, $0e, $85, $2c, $2f, $7b, $14, $0d, $1f, $11, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01, $02, $00, $13, $06, $00
ENDC

Data_b5d5e:
	person_event $ff, $00, $01, $02, $01, $01, $00, $04, $01, Func_b5d98, NULL

Func_b5d6c:: ; b5d6c
	ld e, $01
	ld hl, Data_b5d0d
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5d18
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5d5e
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $030c
	scall LandmarkSign
	ret

Func_b5d98:
	push bc
	push bc
	ld hl, sp+$03
	ld a, $ff
	ld [hl], a
	ld hl, sp+$02
	ld [hl], a
	ld a, e
	cp $02
	jp nz, .asm_b5ddd
	ld hl, $0327
	scall LandmarkSign
	ld hl, sp+$00
	ld a, [wMapX]
	add a, $05
	ld [hl], a
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_b5dc8
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $05
	ld [hl], a
	jp .asm_b5dd0
.asm_b5dc8:
	ld hl, sp+$01
	ld a, [wMapY]
	add a, $03
	ld [hl], a
.asm_b5dd0:
	ld c, $01
	ld hl, sp+$00
	reg16swap de, hl
	ld a, $2d
	scall MovePlayer
.asm_b5ddd:
	pop bc
	pop bc
	ret

Data_b5de0:
	warpdef $0d, $0f, $02, $01, MAP_26_00, $07, $05, $07, $06, $2e
	warpdef $01, $02, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5df6:
IF DEF(SUN)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3d, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $4b, $2a, $2d, $26, $0e, $08, $14, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $7d, $2b, $2e, $11, $06, $08, $11, $13, $08, $00
	wildbot $00, $02, $0f, $0e, $4f, $2c, $2f, $26, $06, $07, $00, $12, $07, $00
	wildbot $00, $02, $0f, $0e, $88, $2d, $30, $7a, $04, $04, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $02, $0f, $0e, $4a, $29, $2c, $3f, $07, $11, $14, $06, $0a, $00
	wildbot $00, $02, $0f, $0e, $7d, $2a, $2d, $12, $06, $06, $11, $12, $09, $00
	wildbot $00, $02, $0f, $0e, $70, $2b, $2e, $53, $01, $10, $00, $10, $08, $00
	wildbot $00, $02, $0f, $0e, $85, $2c, $2f, $7b, $14, $0d, $1f, $11, $07, $00
	wildbot $00, $02, $0f, $0e, $4f, $2d, $30, $26, $01, $02, $00, $13, $06, $00
ENDC

Data_b5e3c:
	person_event $ff, $00, $09, $0a, $01, $01, $00, $04, $01, Func_b5ec4, NULL

Func_b5e4a:: ; b5e4a
	ld e, $02
	ld hl, Data_b5de0
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_b5df6
	scall LoadEncounters
	ld e, $01
	ld hl, Data_b5e3c
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	ld a, $0f
	ld [wc7e2], a
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_b5eba
	ld a, [wBackupMapNumber]
	cp $08
	jp nz, .asm_b5eba
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_b5eba
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b5eba
	ld hl, $00fd
	scall CheckEventFlag
	or a
	jp nz, .asm_b5eae
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $030b
	scall LandmarkSign
	call Func_b5f03
	jp .asm_b5eb7
.asm_b5eae:
	scall Func_8001c
	ld hl, $030b
	scall LandmarkSign
.asm_b5eb7:
	jp .asm_b5ec3
.asm_b5eba:
	scall Func_8001c
	ld hl, $030b
	scall LandmarkSign
.asm_b5ec3:
	ret

Func_b5ec4:
	ld a, e
	cp $02
	jp nz, .asm_b5f02
	ld hl, $00b4
	scall LandmarkSign
	ld e, $00
	ld hl, $00fe
	scall EventFlagAction
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
	ld a, $02
	scall PlayerFace
	ld l, $0a
	push hl
	ld c, $09
	ld e, $08
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_b5f02:
	ret

Func_b5f03:
	ld a, $09
	scall PlayMusic
	ld a, $02
	scall PlayerFace
	ld c, $01
	ld e, $02
	ld a, $09
	scall LoadEmote
	ld a, $37
	scall PlaySFX
	scall WaitEmote
	ld a, $01
	scall Func_80653
	ld hl, $0001
	scall ScriptSleep
	scall HideEmote
	ld e, $01
	ld hl, $00fd
	scall EventFlagAction
	ret

Data_b5f35:
	warpdef $0c, $05, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_b5f40:
	person_event $1a, $04, $0c, $0a, $01, $01, $02, $04, $00, NULL, NULL
	person_event $19, $0c, $0c, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $0e, $01, $01, $00, $04, $01, Func_b6117, NULL

Data_b5f6a:
	person_event $19, $0c, $0c, $0b, $01, $01, $02, $04, $00, Func_b6291, NULL
	person_event $1e, $0c, $0b, $0a, $01, $01, $02, $04, $00, Func_b634c, NULL
	person_event $1f, $0c, $0d, $0a, $01, $01, $02, $04, $00, Func_b6422, NULL
	person_event $20, $0c, $0a, $09, $01, $01, $02, $04, $00, Func_b6501, NULL
	person_event $21, $0c, $0c, $09, $01, $01, $02, $04, $00, Func_b65e9, NULL
	person_event $0d, $0c, $0e, $09, $01, $01, $02, $04, $00, Func_b66d1, NULL

Func_b5fbe:: ; b5fbe
	ld e, $01
	ld hl, Data_b5f35
	scall LoadWarps
	ld hl, $005a
	scall CheckEventFlag
	or a
	jp nz, .asm_b5fe2
	ld e, $03
	ld hl, Data_b5f40
	scall LoadMapObjects
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	jp .asm_b60c9
.asm_b5fe2:
	ld hl, $005a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60c9
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e5
	scall CheckEventFlag
	or a
	jp z, .asm_b6029
	ld hl, $00e6
	scall CheckEventFlag
	or a
	jp nz, .asm_b60c9
.asm_b6029:
	ld e, $06
	ld hl, Data_b5f6a
	scall LoadMapObjects
	ld hl, $00e1
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b604b
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $01
	scall Func_80080
.asm_b604b:
	ld hl, $00e2
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b6066
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $02
	scall Func_80080
.asm_b6066:
	ld hl, $00e3
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b6081
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $03
	scall Func_80080
.asm_b6081:
	ld hl, $00e4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b609c
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $04
	scall Func_80080
.asm_b609c:
	ld hl, $00e5
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60b7
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld c, $0b
	ld e, $0c
	ld a, $05
	scall Func_80080
.asm_b60b7:
	ld hl, $00e6
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b60c9
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
.asm_b60c9:
	ld a, $13
	scall PlayMusic
	scall Func_8001c
	ret

Data_b60d2:
IF DEF(SUN)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $87
	db $06, $39, $04, $00, $00, $7b, $88, $06, $39, $04, $04, $00, $7b, $89, $06, $39
	db $04, $04, $04, $7c, $12, $07, $39, $1d, $1d, $1d, $09, $01, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $04, $00, $c5, $c4, $00, $00, $30, $01, $84
	db $06, $39, $03, $00, $00, $7b, $85, $06, $39, $03, $03, $00, $7b, $86, $06, $39
	db $03, $03, $03, $7c, $12, $07, $39, $1a, $1a, $1a, $09, $01, $0c
ENDC

Data_b60fb:
	db $0c, $0c, $ff, $ff

Data_b60ff:
	db $0c, $07, $08, $07, $ff, $ff

Data_b6105:
	db $08, $10, $08, $10, $ff, $ff

Data_b610b:
	db $0c, $0d, $ff, $ff

Data_b610f:
	db $0c, $10, $08, $07, $0c, $05, $ff, $ff

Func_b6117:
	ld a, e
	cp $02
	jp nz, .asm_b625f
	xor a
	scall PlayMusic
	scall AllocateSpaceForWarps
	ld c, $01
	ld de, Data_b60fb
	ld a, $2d
	scall MovePlayer
	ld a, $01
	scall PlayMusic
	ld hl, $014a
	scall PrintTextWithNPCName
	ld de, Data_b6260
	ld hl, Data_b60d2
	scall ScriptedBattle
	or a
	jp nz, .asm_b6149
	jp .asm_b625f
.asm_b6149:
	ld hl, $014b
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld e, $0a
	ld a, $0c
	scall MoveEmote
	ld a, $01
	scall FadeInAudio
	ld a, $43
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld hl, $003c
	scall ScriptSleep
	scall StartShakingScreen
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	scall WaitEmote
	ld a, $28
	scall PlaySFX
	scall HideEmote
	ld hl, $003c
	scall ScriptSleep
	xor a
.asm_b61a2:
	cp $04
	jp nc, .asm_b61b3
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61a2
.asm_b61b3:
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $18
	scall PlayMusic
	ld hl, $0078
	scall ScriptSleep
	ld bc, Data_b60ff
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
	ld bc, Data_b6105
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	ld a, $01
	scall SpriteFace
	xor a
.asm_b61ec:
	cp $02
	jp nc, .asm_b61fe
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b61ec
.asm_b61fe:
	ld a, $02
	scall PlayerFace
	xor a
.asm_b6204:
	cp $02
	jp nc, .asm_b6216
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b6204
.asm_b6216:
	ld bc, Data_b610b
	ld e, $2d
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	xor a
	scall PlayMusic
	ld a, $04
	scall PlayMusic
	scall StopShakingScreen
	ld hl, $014c
	scall PrintTextWithNPCName
	scall StartShakingScreen
	ld bc, Data_b610f
	ld e, $2d
	ld a, $01
	scall MovePerson
	ld c, $01
	ld de, Data_b610f
	ld a, $2d
	scall MovePlayer
	scall WaitNPCStep
	scall StopShakingScreen
	ld l, $05
	push hl
	ld c, $07
	ld e, $00
	ld a, $1a
	scall Func_80dff
	pop bc
.asm_b625f:
	ret

Data_b6260:
	dstr "セﾞロ"

Data_b6264:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $46, $07, $28, $07, $07, $07, $6b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $bc, $00, $00, $30
	db $01, $4f, $06, $28, $14, $14, $00, $54, $61, $06, $28, $14, $1e, $1e, $08, $72
	db $06, $28, $06, $09, $0b, $12, $05, $07, $28, $03, $03, $01, $09, $01, $0b
ENDC

Data_b628d:
	db $0c, $0b, $ff, $ff

Func_b6291:
	push af
	ld a, e
	or a
	jp nz, .asm_b6312
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0442
	scall PrintTextWithNPCName
	ld de, Data_b6314
	ld hl, Data_b6264
	scall ScriptedBattle
	or a
	jp nz, .asm_b62b3
	jp .asm_b6312
.asm_b62b3:
	ld hl, $0443
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $18
	scall PlayMusic
	ld hl, $0078
	scall ScriptSleep
	xor a
.asm_b62d3:
	cp $04
	jp nc, .asm_b62e5
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b62d3
.asm_b62e5:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $13
	scall PlayMusic
	ld bc, Data_b628d
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $01
	ld hl, $00e1
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b6312:
	pop bc
	ret

Data_b6314:
	dstr "ヒﾞスコ"

Data_b6319:
	db $00, $00, $00, $04, $32, $c5, $bd, $00, $00, $90, $01, $0e, $06, $2d, $04, $17
	db $00, $53, $38, $06, $2d, $0e, $0b, $00, $1b, $18, $06, $2d, $09, $09, $0b, $1c
	db $07, $07, $2d, $01, $13, $00, $63, $01, $0b

Data_b6342:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b6348:
	db $0c, $0b, $ff, $ff

Func_b634c:
	push af
	ld a, e
	or a
	jp nz, .asm_b63e6
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp nz, .asm_b6373
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b63e6
.asm_b6373:
	ld hl, $0444
	scall PrintTextWithNPCName
	ld de, Data_b63e8
	ld hl, Data_b6319
	scall ScriptedBattle
	or a
	jp nz, .asm_b6389
	jp .asm_b63e6
.asm_b6389:
	ld hl, $0445
	scall PrintTextWithNPCName
	xor a
.asm_b6390:
	cp $04
	jp nc, .asm_b63a2
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6390
.asm_b63a2:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b63c1
	ld bc, Data_b6342
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b63cd
.asm_b63c1:
	ld bc, Data_b6348
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b63cd:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e2
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b63e6:
	pop bc
	ret

Data_b63e8:
	dstr "アムロン"

Data_b63ed:
	db $00, $00, $00, $04, $32, $c5, $be, $00, $00, $4e, $01, $3a, $06, $32, $07, $0b
	db $00, $49, $0f, $06, $32, $28, $12, $00, $6a, $21, $06, $32, $0c, $0f, $00, $7a
	db $3b, $07, $32, $07, $09, $00, $4a, $01, $0b

Data_b6416:
	db $0b, $0b, $0c, $0b, $ff, $ff

Data_b641c:
	db $0b, $0a, $0c, $0b, $ff, $ff

Func_b6422:
	push af
	ld a, e
	or a
	jp nz, .asm_b64c6
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b6442
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp nz, .asm_b6453
.asm_b6442:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b64c6
.asm_b6453:
	ld hl, $0446
	scall PrintTextWithNPCName
	ld de, Data_b64c8
	ld hl, Data_b63ed
	scall ScriptedBattle
	or a
	jp nz, .asm_b6469
	jp .asm_b64c6
.asm_b6469:
	ld hl, $0447
	scall PrintTextWithNPCName
	xor a
.asm_b6470:
	cp $04
	jp nc, .asm_b6482
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6470
.asm_b6482:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b64a1
	ld bc, Data_b6416
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b64ad
.asm_b64a1:
	ld bc, Data_b641c
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b64ad:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e3
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b64c6:
	pop bc
	ret

Data_b64c8:
	dstr "ワイルトﾞ"

Data_b64ce:
	db $00, $00, $00, $04, $32, $c5, $bf, $00, $00, $75, $01, $31, $06, $37, $07, $0c
	db $00, $48, $73, $06, $37, $0c, $08, $00, $49, $74, $06, $37, $0d, $09, $00, $49
	db $32, $07, $37, $07, $07, $14, $4a, $01, $0b

Data_b64f7:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b64fd:
	db $0c, $0b, $ff, $ff

Func_b6501:
	push af
	ld a, e
	or a
	jp nz, .asm_b65af
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b652b
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b652b
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp nz, .asm_b653c
.asm_b652b:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b65af
.asm_b653c:
	ld hl, $0448
	scall PrintTextWithNPCName
	ld de, Data_b65b1
	ld hl, Data_b64ce
	scall ScriptedBattle
	or a
	jp nz, .asm_b6552
	jp .asm_b65af
.asm_b6552:
	ld hl, $0449
	scall PrintTextWithNPCName
	xor a
.asm_b6559:
	cp $04
	jp nc, .asm_b656b
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b6559
.asm_b656b:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b658a
	ld bc, Data_b64f7
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6596
.asm_b658a:
	ld bc, Data_b64fd
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6596:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e4
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b65af:
	pop bc
	ret

Data_b65b1:
	dstr "カマット"

Data_b65b6:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0d, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c1, $00
	db $00, $45, $01, $1d, $06, $3c, $23, $12, $00, $3e, $91, $06, $3c, $0e, $13, $00
	db $7a, $0a, $06, $3c, $04, $18, $04, $7b, $8d, $07, $3c, $0d, $0e, $13, $7b, $01
	db $0b
ENDC

Data_b65df:
	db $0d, $0b, $0c, $0b, $ff, $ff

Data_b65e5:
	db $0c, $0b, $ff, $ff

Func_b65e9:
	push af
	ld a, e
	or a
	jp nz, .asm_b66a1
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b661d
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp nz, .asm_b662e
.asm_b661d:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b66a1
.asm_b662e:
	ld hl, $044a
	scall PrintTextWithNPCName
	ld de, Data_b66a3
	ld hl, Data_b65b6
	scall ScriptedBattle
	or a
	jp nz, .asm_b6644
	jp .asm_b66a1
.asm_b6644:
	ld hl, $044b
	scall PrintTextWithNPCName
	xor a
.asm_b664b:
	cp $04
	jp nc, .asm_b665d
	push af
	ld e, a
	ld hl, sp+$03
	ld a, [hl]
	scall SpriteFace
	pop af
	inc a
	jp .asm_b664b
.asm_b665d:
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_b667c
	ld bc, Data_b65df
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
	jp .asm_b6688
.asm_b667c:
	ld bc, Data_b65e5
	ld e, $2d
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall MovePersonAndWait
.asm_b6688:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	inc a
	scall SpriteFace
	ld e, $01
	ld hl, $00e5
	scall EventFlagAction
	ld a, $01
	ld [wc7c4], a
.asm_b66a1:
	pop bc
	ret

Data_b66a3:
	dstr "ヘットﾞ"

Data_b66a8:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $03, $03, $03
	db $7b, $01, $0b
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5
	db $c3, $00, $00, $2e, $01, $80, $06, $41, $10, $00, $00, $08, $81, $06, $41, $10
	db $01, $03, $08, $82, $06, $41, $10, $04, $07, $09, $86, $07, $41, $04, $04, $04
	db $7b, $01, $0b
ENDC

Func_b66d1:
	push af
	ld a, e
	or a
	jp nz, .asm_b6751
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $00e1
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e2
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e3
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e4
	scall CheckEventFlag
	or a
	jp z, .asm_b670f
	ld hl, $00e5
	scall CheckEventFlag
	or a
	jp nz, .asm_b6720
.asm_b670f:
	ld hl, $017c
	scall PrintTextStandard
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	jp .asm_b6751
.asm_b6720:
	ld hl, $044c
	scall PrintTextWithNPCName
	ld de, Data_b6753
	ld hl, Data_b66a8
	scall ScriptedBattle
	or a
	jp nz, .asm_b6736
	jp .asm_b6751
.asm_b6736:
	ld hl, $044d
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $00e6
	scall EventFlagAction
	ld l, $1a
	push hl
	ld c, $0f
	ld e, $0a
	ld a, $19
	scall Func_80dff
	pop bc
.asm_b6751:
	pop bc
	ret

Data_b6753:
	dstr "テール"

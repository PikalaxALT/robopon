INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 32", ROMX
	script_library 32

Data_c90b4:
	warpdef $10, $1d, $03, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $11, $09, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $05, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $1d, $11, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $0b, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $17, $1a, $01, $01, MAP_21_10, $09, $13, $09, $12, $34
	warpdef $0b, $0c, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $17, $0c, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $0a, $14, $01, $01, MAP_32_05, $06, $0b, $06, $0a, $34
	warpdef $18, $14, $01, $01, MAP_32_06, $06, $0c, $06, $0b, $34
	warpdef $11, $13, $01, $01, MAP_21_20, $09, $13, $09, $12, $34

Data_c912d:
	dw $2bd
	dw -1

Data_c9131:
	dw $0bd
	dw -1

Data_c9135:
	person_event $ff, $00, $12, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $ff, $00, $10, $1c, $01, $01, $00, $04, $00, PrintTextFacePlayer_32, Data_c912d
	person_event $09, $04, $12, $14, $01, $01, $02, $04, $00, PrintTextFacePlayer_32, Data_c9131
	person_event $1d, $04, $04, $12, $01, $01, $02, $04, $00, NULL, NULL

Func_c916d:: ; c916d
	call Func_c91a4
	ld hl, Func_c91a4
	scall Func_80f11
	ld a, $06
	ld [wc789], a
	ld a, $09
	ld [wc7e2], a
	ld e, $0b
	ld hl, Data_c90b4
	scall LoadWarps
	ld e, $04
	ld hl, Data_c9135
	scall LoadMapObjects
	ld a, $13
	scall PlayMusic
	ld a, $01
	scall LoadPlayerSprite
	scall Func_8001c
	ret

Data_c919e:
	db $10, $1e, $03, $01, $10, $1d

Func_c91a4:
	ld hl, $001f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c91b8
	ld hl, Data_c919e
	scall Func_80d9b
	scall Func_80f02
.asm_c91b8:
	ret

Data_c91b9:
	warpdef $09, $13, $02, $01, MAP_21_00, $17, $1a, $17, $1b, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91cf:
	warpdef $09, $13, $02, $01, MAP_21_00, $0b, $1a, $0b, $1b, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91e5:
	warpdef $09, $13, $02, $01, MAP_21_00, $1d, $11, $1d, $12, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c91fb:
	warpdef $09, $13, $02, $01, MAP_21_00, $05, $11, $05, $12, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c9211:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $09, $11, $0a, $2e
	warpdef $08, $08, $01, $01, MAP_21_11, $08, $08, $07, $08, $2e

Data_c9227:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $16, $18, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $16, $18, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c926d:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c92b3:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $78, $28, $17, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $78, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $78, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $78, $0c, $17, $00, $04, $02, $00
ENDC

Data_c92f9:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c933f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0f, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c9385:
	person_event $09, $04, $09, $0f, $01, $01, $02, $04, $00, Func_c9614, NULL
	person_event $ff, $00, $0a, $0f, $01, $01, $00, $04, $01, Func_c95da, NULL

Func_c93a1:: ; c93a1
	ld a, [wBackupMapGroup]
	cp $15
	jp nz, .asm_c9424
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_c9424
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_c93c8
	ld a, [wBackupMapY]
	cp $09
	jp nz, .asm_c93c8
	ld a, $04
	ld [wc78b], a
	jp .asm_c9424
.asm_c93c8:
	ld a, [wBackupMapX]
	cp $05
	jp nz, .asm_c93e0
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_c93e0
	ld a, $03
	ld [wc78b], a
	jp .asm_c9424
.asm_c93e0:
	ld a, [wBackupMapX]
	cp $1d
	jp nz, .asm_c93f8
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_c93f8
	ld a, $02
	ld [wc78b], a
	jp .asm_c9424
.asm_c93f8:
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_c9410
	ld a, [wBackupMapY]
	cp $1a
	jp nz, .asm_c9410
	ld a, $01
	ld [wc78b], a
	jp .asm_c9424
.asm_c9410:
	ld a, [wBackupMapX]
	cp $17
	jp nz, .asm_c9424
	ld a, [wBackupMapY]
	cp $1a
	jp nz, .asm_c9424
	xor a
	ld [wc78b], a
.asm_c9424:
	ld e, $02
	ld hl, Data_c9385
	scall LoadMapObjects
	ld a, [wc78b]
	cp $04
	jp z, .asm_c94df
	cp $03
	jp z, .asm_c94b9
	cp $02
	jp z, .asm_c9493
	cp $01
	jp z, .asm_c946d
	or a
	jp nz, .asm_c9502
	ld e, $02
	ld hl, Data_c91b9
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9227
	scall LoadEncounters
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e6
	scall LandmarkSign
	jp .asm_c9502
.asm_c946d:
	ld e, $02
	ld hl, Data_c91cf
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c926d
	scall LoadEncounters
	ld a, $0e
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f5
	scall LandmarkSign
	jp .asm_c9502
.asm_c9493:
	ld e, $02
	ld hl, Data_c91e5
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c92b3
	scall LoadEncounters
	ld a, $0d
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f0
	scall LandmarkSign
	jp .asm_c9502
.asm_c94b9:
	ld e, $02
	ld hl, Data_c91fb
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c92f9
	scall LoadEncounters
	ld a, $0f
	scall PlayMusic
	scall Func_8001c
	ld hl, $02eb
	scall LandmarkSign
	jp .asm_c9502
.asm_c94df:
	ld e, $02
	ld hl, Data_c9211
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c933f
	scall LoadEncounters
	ld a, $10
	scall PlayMusic
	scall Func_8001c
	ld hl, $02fa
	scall LandmarkSign
.asm_c9502:
	ret

Func_c9503:
	ld a, [wc78b]
	cp $04
	jp z, .asm_c95b2
	cp $03
	jp z, .asm_c958d
	cp $02
	jp z, .asm_c9568
	cp $01
	jp z, .asm_c9543
	or a
	jp nz, .asm_c95d4
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c952e
	ld l, $02
	jp .asm_c9540
.asm_c952e:
	ld hl, $003d
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c953e
	ld l, $00
	jp .asm_c9540
.asm_c953e:
	ld l, $01
.asm_c9540:
	jp .asm_c95d4
.asm_c9543:
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c9553
	ld l, $02
	jp .asm_c9565
.asm_c9553:
	ld hl, $003e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c9563
	ld l, $00
	jp .asm_c9565
.asm_c9563:
	ld l, $01
.asm_c9565:
	jp .asm_c95d4
.asm_c9568:
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c9578
	ld l, $02
	jp .asm_c958a
.asm_c9578:
	ld hl, $003f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c9588
	ld l, $00
	jp .asm_c958a
.asm_c9588:
	ld l, $01
.asm_c958a:
	jp .asm_c95d4
.asm_c958d:
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c959d
	ld l, $02
	jp .asm_c95af
.asm_c959d:
	ld hl, $0040
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c95ad
	ld l, $00
	jp .asm_c95af
.asm_c95ad:
	ld l, $01
.asm_c95af:
	jp .asm_c95d4
.asm_c95b2:
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c95c2
	ld l, $02
	jp .asm_c95d4
.asm_c95c2:
	ld hl, $0041
	scall CheckEventFlag
	cp $01
	jp nz, .asm_c95d2
	ld l, $00
	jp .asm_c95d4
.asm_c95d2:
	ld l, $01
.asm_c95d4:
	ld a, l
	ret

Data_c95d6:
	db $0a, $10, $ff, $ff

Func_c95da:
	push de
	ld a, $ff
	call Func_c9503
	pop de
	cp $01
	jp nz, .asm_c9613
	ld a, e
	cp $02
	jp nz, .asm_c9613
	ld e, $01
	xor a
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	ld hl, $00d4
	scall PrintTextStandard
	ld c, $01
	ld de, Data_c95d6
	ld a, $32
	scall MovePlayer
	ld e, $02
	xor a
	scall SpriteFace
.asm_c9613:
	ret

Func_c9614:
	push af
	push de
	ld a, $ff
	call Func_c9503
	ld l, a
	pop de
	ld a, e
	or a
	jp nz, .asm_c9651
	push hl
	ld hl, sp+$03
	ld a, [hl]
	scall FacePlayer
	pop hl
	ld a, l
	cp $02
	jp z, .asm_c964b
	cp $01
	jp z, .asm_c9642
	or a
	jp nz, .asm_c9651
	ld hl, $00d3
	scall PrintTextStandard
	jp .asm_c9651
.asm_c9642:
	ld hl, $00d4
	scall PrintTextStandard
	jp .asm_c9651
.asm_c964b:
	ld hl, $010f
	scall PrintTextStandard
.asm_c9651:
	pop bc
	ret

Data_c9653:
	db $01, $08, $01, $01, $15, $0c, $01, $08, $01, $09, $2e
	db $08, $08, $01, $01, $15, $0a, $08, $08, $08, $09, $2e

Data_c9669:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $16, $18, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $15, $17, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $16, $18, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c96af:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c96f5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_c973b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c9781:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c97c7:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9915, NULL

Data_c97d5:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c999b, NULL

Data_c97e3:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9a2f, NULL

Data_c97f1:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9ac3, NULL

Data_c97ff:
	person_event $09, $04, $06, $04, $01, $01, $01, $04, $00, Func_c9b57, NULL

Func_c980d:: ; c980d
	ld e, $02
	ld hl, Data_c9653
	scall LoadWarps
	ld a, [wc78b]
	cp $04
	jp z, .asm_c98c8
	cp $03
	jp z, .asm_c98a2
	cp $02
	jp z, .asm_c987c
	cp $01
	jp z, .asm_c9856
	or a
	jp nz, .asm_c98eb
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9669
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c97c7
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e7
	scall LandmarkSign
	jp .asm_c98eb
.asm_c9856:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c96af
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c97d5
	scall LoadMapObjects
	ld a, $0e
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f6
	scall LandmarkSign
	jp .asm_c98eb
.asm_c987c:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c96f5
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c97e3
	scall LoadMapObjects
	ld a, $0d
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f1
	scall LandmarkSign
	jp .asm_c98eb
.asm_c98a2:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c973b
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c97f1
	scall LoadMapObjects
	ld a, $0f
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ec
	scall LandmarkSign
	jp .asm_c98eb
.asm_c98c8:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9781
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c97ff
	scall LoadMapObjects
	ld a, $10
	scall PlayMusic
	scall Func_8001c
	ld hl, $02fb
	scall LandmarkSign
.asm_c98eb:
	ret

Data_c98ec:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $08, $01, $08, $04, $1b, $03, $0f
	db $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9915:
	ld a, e
	or a
	jp nz, .asm_c9968
	xor a
	scall FacePlayer
	ld hl, $0092
	scall CheckEventFlag
	or a
	jp nz, .asm_c9962
	ld hl, $025f
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9959
	ld de, Data_c9969
	ld hl, Data_c98ec
	scall ScriptedBattle
	or a
	jp nz, .asm_c9948
	jp .asm_c9968
.asm_c9948:
	ld e, $01
	ld hl, $0092
	scall EventFlagAction
	ld hl, $0266
	scall PrintTextStandard
	jp .asm_c995f
.asm_c9959:
	ld hl, $0268
	scall PrintTextStandard
.asm_c995f:
	jp .asm_c9968
.asm_c9962:
	ld hl, $0266
	scall PrintTextStandard
.asm_c9968:
	ret

Data_c9969:
	dstr "(くﾞんしﾞん)"

Data_c9972:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $3f, $01
	db $3f, $04, $1b, $02, $09, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c999b:
	ld a, e
	or a
	jp nz, .asm_c99fc
	xor a
	scall FacePlayer
	ld hl, $0097
	scall CheckEventFlag
	or a
	jp nz, .asm_c99f6
	ld hl, $0261
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c99ed
	ld hl, $015e
	scall PrintTextStandard
.asm_c99c4:
	ld de, Data_c99fd
	ld hl, Data_c9972
	scall Func_803f5
	or a
	jp nz, .asm_c99dc
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c99c4
	jp .asm_c99fc
.asm_c99dc:
	ld e, $01
	ld hl, $0097
	scall EventFlagAction
	ld hl, $0262
	scall PrintTextStandard
	jp .asm_c99f3
.asm_c99ed:
	ld hl, $0269
	scall PrintTextStandard
.asm_c99f3:
	jp .asm_c99fc
.asm_c99f6:
	ld hl, $0263
	scall PrintTextStandard
.asm_c99fc:
	ret

Data_c99fd:
	dstr "(くﾞんしﾞん)"

Data_c9a06:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $7e, $01, $7e, $04, $1b, $28, $12, $00, $71, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_c9a2f:
	ld a, e
	or a
	jp nz, .asm_c9a90
	xor a
	scall FacePlayer
	ld hl, $009c
	scall CheckEventFlag
	or a
	jp nz, .asm_c9a8a
	ld hl, $0261
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9a81
	ld hl, $017a
	scall PrintTextStandard
.asm_c9a58:
	ld de, Data_c9a91
	ld hl, Data_c9a06
	scall Func_802ef
	or a
	jp nz, .asm_c9a70
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c9a58
	jp .asm_c9a90
.asm_c9a70:
	ld e, $01
	ld hl, $009c
	scall EventFlagAction
	ld hl, $0262
	scall PrintTextStandard
	jp .asm_c9a87
.asm_c9a81:
	ld hl, $0268
	scall PrintTextStandard
.asm_c9a87:
	jp .asm_c9a90
.asm_c9a8a:
	ld hl, $0260
	scall PrintTextStandard
.asm_c9a90:
	ret

Data_c9a91:
	dstr "(くﾞんしﾞん)"

Data_c9a9a:
	db $00, $00, $00
	db $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e, $04, $1b, $01, $02, $00, $05, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_c9ac3:
	ld a, e
	or a
	jp nz, .asm_c9b24
	xor a
	scall FacePlayer
	ld hl, $00a1
	scall CheckEventFlag
	or a
	jp nz, .asm_c9b1e
	ld hl, $0261
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9b15
	ld hl, $016b
	scall PrintTextStandard
.asm_c9aec:
	ld de, Data_c9b25
	ld hl, Data_c9a9a
	scall Func_80347
	or a
	jp nz, .asm_c9b04
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c9aec
	jp .asm_c9b24
.asm_c9b04:
	ld e, $01
	ld hl, $00a1
	scall EventFlagAction
	ld hl, $0266
	scall PrintTextStandard
	jp .asm_c9b1b
.asm_c9b15:
	ld hl, $0269
	scall PrintTextStandard
.asm_c9b1b:
	jp .asm_c9b24
.asm_c9b1e:
	ld hl, $0266
	scall PrintTextStandard
.asm_c9b24:
	ret

Data_c9b25:
	dstr "(くﾞんしﾞん)"

Data_c9b2e:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $62, $01, $62, $04, $1b, $02
	db $03, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9b57:
	ld a, e
	or a
	jp nz, .asm_c9bb8
	xor a
	scall FacePlayer
	ld hl, $00a6
	scall CheckEventFlag
	or a
	jp nz, .asm_c9bb2
	ld hl, $0261
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9ba9
	ld hl, $015d
	scall PrintTextStandard
.asm_c9b80:
	ld de, Data_c9bb9
	ld hl, Data_c9b2e
	scall Func_8039e
	or a
	jp nz, .asm_c9b98
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c9b80
	jp .asm_c9bb8
.asm_c9b98:
	ld e, $01
	ld hl, $00a6
	scall EventFlagAction
	ld hl, $0260
	scall PrintTextStandard
	jp .asm_c9baf
.asm_c9ba9:
	ld hl, $0267
	scall PrintTextStandard
.asm_c9baf:
	jp .asm_c9bb8
.asm_c9bb2:
	ld hl, $0266
	scall PrintTextStandard
.asm_c9bb8:
	ret

Data_c9bb9:
	dstr "(くﾞんしﾞん)"

Data_c9bc2:
	warpdef $01, $08, $01, $01, MAP_21_11, $01, $08, $02, $08, $2e
	warpdef $0c, $12, $01, $01, MAP_21_13, $0c, $12, $0b, $12, $2e
	warpdef $10, $06, $01, $01, MAP_21_13, $10, $06, $10, $07, $2e

Data_c9be3:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $15, $17, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $17, $19, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $18, $1a, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $19, $1b, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $15, $17, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $17, $19, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $18, $1a, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $19, $1b, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_c9c29:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $15, $17, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $18, $1a, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $15, $17, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $16, $18, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $17, $19, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $18, $1a, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $19, $1b, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_c9c6f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $16, $18, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $17, $19, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $18, $1a, $78, $17, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $18, $1a, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1b, $1d, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_c9cb5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $17, $19, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $17, $19, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $18, $1a, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1a, $1c, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $17, $19, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $17, $19, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $18, $1a, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $18, $1a, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1a, $1c, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_c9cfb:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $18, $1a, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1c, $1e, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $18, $1a, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $18, $1a, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $19, $1b, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1a, $1c, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1c, $1e, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_c9d41:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9ea5, NULL

Data_c9d4f:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9f2b, NULL

Data_c9d5d:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_c9fbf, NULL

Data_c9d6b:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_ca053, NULL

Data_c9d79:
	person_event $09, $04, $07, $0e, $01, $01, $01, $04, $00, Func_ca0e7, NULL

Data_c9d87:
	person_event $ff, $00, $11, $09, $03, $03, $00, $04, $00, Func_ca152, NULL

Func_c9d95:: ; c9d95
	ld e, $03
	ld hl, Data_c9bc2
	scall LoadWarps
	ld a, [wc78b]
	cp $04
	jp z, .asm_c9e50
	cp $03
	jp z, .asm_c9e2a
	cp $02
	jp z, .asm_c9e04
	cp $01
	jp z, .asm_c9dde
	or a
	jp nz, .asm_c9e73
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9be3
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c9d41
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e8
	scall LandmarkSign
	jp .asm_c9e73
.asm_c9dde:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9c29
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c9d4f
	scall LoadMapObjects
	ld a, $0e
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f7
	scall LandmarkSign
	jp .asm_c9e73
.asm_c9e04:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9c6f
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c9d5d
	scall LoadMapObjects
	ld a, $0d
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f2
	scall LandmarkSign
	jp .asm_c9e73
.asm_c9e2a:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9cb5
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c9d6b
	scall LoadMapObjects
	ld a, $0f
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ed
	scall LandmarkSign
	jp .asm_c9e73
.asm_c9e50:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_c9cfb
	scall LoadEncounters
	ld e, $01
	ld hl, Data_c9d79
	scall LoadMapObjects
	ld a, $10
	scall PlayMusic
	scall Func_8001c
	ld hl, $02fc
	scall LandmarkSign
.asm_c9e73:
	ld e, $01
	ld hl, Data_c9d87
	scall LoadMapObjects
	ret

Data_c9e7c:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $0b, $01, $0b, $04, $1c, $05, $17, $00, $08, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9ea5:
	ld a, e
	or a
	jp nz, .asm_c9ef8
	xor a
	scall FacePlayer
	ld hl, $0093
	scall CheckEventFlag
	or a
	jp nz, .asm_c9ef2
	ld hl, $025f
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9ee9
	ld de, Data_c9ef9
	ld hl, Data_c9e7c
	scall ScriptedBattle
	or a
	jp nz, .asm_c9ed8
	jp .asm_c9ef8
.asm_c9ed8:
	ld e, $01
	ld hl, $0093
	scall EventFlagAction
	ld hl, $0260
	scall PrintTextStandard
	jp .asm_c9eef
.asm_c9ee9:
	ld hl, $0269
	scall PrintTextStandard
.asm_c9eef:
	jp .asm_c9ef8
.asm_c9ef2:
	ld hl, $0266
	scall PrintTextStandard
.asm_c9ef8:
	ret

Data_c9ef9:
	dstr "(くﾞんしﾞん)"

Data_c9f02:
	db $00, $00, $00
	db $01, $00, $c5, $ba, $00, $00, $01, $01, $01, $04, $1c, $17, $17, $00, $71, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_c9f2b:
	ld a, e
	or a
	jp nz, .asm_c9f8c
	xor a
	scall FacePlayer
	ld hl, $0098
	scall CheckEventFlag
	or a
	jp nz, .asm_c9f86
	ld hl, $0260
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_c9f7d
	ld hl, $015e
	scall PrintTextStandard
.asm_c9f54:
	ld de, Data_c9f8d
	ld hl, Data_c9f02
	scall Func_803f5
	or a
	jp nz, .asm_c9f6c
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c9f54
	jp .asm_c9f8c
.asm_c9f6c:
	ld e, $01
	ld hl, $0098
	scall EventFlagAction
	ld hl, $0263
	scall PrintTextStandard
	jp .asm_c9f83
.asm_c9f7d:
	ld hl, $0267
	scall PrintTextStandard
.asm_c9f83:
	jp .asm_c9f8c
.asm_c9f86:
	ld hl, $0264
	scall PrintTextStandard
.asm_c9f8c:
	ret

Data_c9f8d:
	dstr "(くﾞんしﾞん)"

Data_c9f96:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4f, $01, $4f, $04, $1c, $14
	db $14, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_c9fbf:
	ld a, e
	or a
	jp nz, .asm_ca020
	xor a
	scall FacePlayer
	ld hl, $009d
	scall CheckEventFlag
	or a
	jp nz, .asm_ca01a
	ld hl, $0263
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca011
	ld hl, $017a
	scall PrintTextStandard
.asm_c9fe8:
	ld de, Data_ca021
	ld hl, Data_c9f96
	scall Func_802ef
	or a
	jp nz, .asm_ca000
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_c9fe8
	jp .asm_ca020
.asm_ca000:
	ld e, $01
	ld hl, $009d
	scall EventFlagAction
	ld hl, $0264
	scall PrintTextStandard
	jp .asm_ca017
.asm_ca011:
	ld hl, $0262
	scall PrintTextStandard
.asm_ca017:
	jp .asm_ca020
.asm_ca01a:
	ld hl, $0263
	scall PrintTextStandard
.asm_ca020:
	ret

Data_ca021:
	dstr "(くﾞんしﾞん)"

Data_ca02a:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $3d, $01
	db $3d, $04, $1c, $1f, $17, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca053:
	ld a, e
	or a
	jp nz, .asm_ca0b4
	xor a
	scall FacePlayer
	ld hl, $00a2
	scall CheckEventFlag
	or a
	jp nz, .asm_ca0ae
	ld hl, $0260
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca0a5
	ld hl, $016b
	scall PrintTextStandard
.asm_ca07c:
	ld de, Data_ca0b5
	ld hl, Data_ca02a
	scall Func_80347
	or a
	jp nz, .asm_ca094
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca07c
	jp .asm_ca0b4
.asm_ca094:
	ld e, $01
	ld hl, $00a2
	scall EventFlagAction
	ld hl, $0262
	scall PrintTextStandard
	jp .asm_ca0ab
.asm_ca0a5:
	ld hl, $0268
	scall PrintTextStandard
.asm_ca0ab:
	jp .asm_ca0b4
.asm_ca0ae:
	ld hl, $0266
	scall PrintTextStandard
.asm_ca0b4:
	ret

Data_ca0b5:
	dstr "(くﾞんしﾞん)"

Data_ca0be:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $6b, $01, $6b, $04, $1c, $17, $17, $0a, $04, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_ca0e7:
	ld a, e
	or a
	jp nz, .asm_ca148
	xor a
	scall FacePlayer
	ld hl, $00a7
	scall CheckEventFlag
	or a
	jp nz, .asm_ca142
	ld hl, $025f
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca139
	ld hl, $015d
	scall PrintTextStandard
.asm_ca110:
	ld de, Data_ca149
	ld hl, Data_ca0be
	scall Func_8039e
	or a
	jp nz, .asm_ca128
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca110
	jp .asm_ca148
.asm_ca128:
	ld e, $01
	ld hl, $00a7
	scall EventFlagAction
	ld hl, $0266
	scall PrintTextStandard
	jp .asm_ca13f
.asm_ca139:
	ld hl, $0269
	scall PrintTextStandard
.asm_ca13f:
	jp .asm_ca148
.asm_ca142:
	ld hl, $0266
	scall PrintTextStandard
.asm_ca148:
	ret

Data_ca149:
	dstr "(くﾞんしﾞん)"

Func_ca152:
	ld a, e
	or a
	jp nz, .asm_ca1b3
	scall RepairRobots
	xor a
	scall PlayMusic
	ld a, $16
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld hl, $0322
	scall PrintTextStandard
	ld a, [wc78b]
	cp $03
	jp z, .asm_ca1a6
	cp $02
	jp z, .asm_ca19e
	cp $01
	jp z, .asm_ca196
	or a
	jp nz, .asm_ca1ae
	ld a, $09
	scall PlayMusic
	jp .asm_ca1b3
.asm_ca196:
	ld a, $0e
	scall PlayMusic
	jp .asm_ca1b3
.asm_ca19e:
	ld a, $0d
	scall PlayMusic
	jp .asm_ca1b3
.asm_ca1a6:
	ld a, $0f
	scall PlayMusic
	jp .asm_ca1b3
.asm_ca1ae:
	ld a, $10
	scall PlayMusic
.asm_ca1b3:
	ret

Data_ca1b4:
	warpdef $06, $03, $01, $01, MAP_21_14, $06, $03, $06, $04, $2e
	warpdef $0c, $12, $01, $01, MAP_21_12, $0c, $12, $0c, $11, $2e
	warpdef $10, $06, $01, $01, MAP_21_12, $10, $06, $10, $07, $2e

Data_ca1d5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $17, $19, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $18, $1a, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $19, $1b, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $1a, $1c, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $17, $19, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $18, $1a, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $19, $1b, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $1a, $1c, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_ca21b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $16, $18, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $19, $1b, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $16, $18, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $19, $1b, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_ca261:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_ca2a7:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $18, $1a, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $18, $1a, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $19, $1b, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1b, $1d, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $18, $1a, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $18, $1a, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $19, $1b, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1b, $1d, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_ca2ed:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $19, $1b, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1c, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1d, $1f, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $19, $1b, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1c, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1d, $1f, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_ca333:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca481, NULL

Data_ca341:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca507, NULL

Data_ca34f:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca59b, NULL

Data_ca35d:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca62f, NULL

Data_ca36b:
	person_event $09, $04, $0c, $08, $01, $01, $02, $04, $00, Func_ca6c3, NULL

Func_ca379:: ; ca379
	ld e, $03
	ld hl, Data_ca1b4
	scall LoadWarps
	ld a, [wc78b]
	cp $04
	jp z, .asm_ca434
	cp $03
	jp z, .asm_ca40e
	cp $02
	jp z, .asm_ca3e8
	cp $01
	jp z, .asm_ca3c2
	or a
	jp nz, .asm_ca457
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca1d5
	scall LoadEncounters
	ld e, $01
	ld hl, Data_ca333
	scall LoadMapObjects
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $02e9
	scall LandmarkSign
	jp .asm_ca457
.asm_ca3c2:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca21b
	scall LoadEncounters
	ld e, $01
	ld hl, Data_ca341
	scall LoadMapObjects
	ld a, $0e
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f8
	scall LandmarkSign
	jp .asm_ca457
.asm_ca3e8:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca261
	scall LoadEncounters
	ld e, $01
	ld hl, Data_ca34f
	scall LoadMapObjects
	ld a, $0d
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f3
	scall LandmarkSign
	jp .asm_ca457
.asm_ca40e:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca2a7
	scall LoadEncounters
	ld e, $01
	ld hl, Data_ca35d
	scall LoadMapObjects
	ld a, $0f
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ee
	scall LandmarkSign
	jp .asm_ca457
.asm_ca434:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca2ed
	scall LoadEncounters
	ld e, $01
	ld hl, Data_ca36b
	scall LoadMapObjects
	ld a, $10
	scall PlayMusic
	scall Func_8001c
	ld hl, $02fd
	scall LandmarkSign
.asm_ca457:
	ret

Data_ca458:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $7b, $01, $7b, $04, $1c, $02, $05
	db $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca481:
	ld a, e
	or a
	jp nz, .asm_ca4d4
	xor a
	scall FacePlayer
	ld hl, $0094
	scall CheckEventFlag
	or a
	jp nz, .asm_ca4ce
	ld hl, $0260
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca4c5
	ld de, Data_ca4d5
	ld hl, Data_ca458
	scall ScriptedBattle
	or a
	jp nz, .asm_ca4b4
	jp .asm_ca4d4
.asm_ca4b4:
	ld e, $01
	ld hl, $0094
	scall EventFlagAction
	ld hl, $0264
	scall PrintTextStandard
	jp .asm_ca4cb
.asm_ca4c5:
	ld hl, $0269
	scall PrintTextStandard
.asm_ca4cb:
	jp .asm_ca4d4
.asm_ca4ce:
	ld hl, $0267
	scall PrintTextStandard
.asm_ca4d4:
	ret

Data_ca4d5:
	dstr "(くﾞんしﾞん)"

Data_ca4de:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $1c, $01, $13
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca507:
	ld a, e
	or a
	jp nz, .asm_ca568
	xor a
	scall FacePlayer
	ld hl, $0099
	scall CheckEventFlag
	or a
	jp nz, .asm_ca562
	ld hl, $0262
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca559
	ld hl, $015e
	scall PrintTextStandard
.asm_ca530:
	ld de, Data_ca569
	ld hl, Data_ca4de
	scall Func_803f5
	or a
	jp nz, .asm_ca548
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca530
	jp .asm_ca568
.asm_ca548:
	ld e, $01
	ld hl, $0099
	scall EventFlagAction
	ld hl, $0264
	scall PrintTextStandard
	jp .asm_ca55f
.asm_ca559:
	ld hl, $0268
	scall PrintTextStandard
.asm_ca55f:
	jp .asm_ca568
.asm_ca562:
	ld hl, $0262
	scall PrintTextStandard
.asm_ca568:
	ret

Data_ca569:
	dstr "(くﾞんしﾞん)"

Data_ca572:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4a, $01, $4a, $04, $1c, $0e, $08
	db $14, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca59b:
	ld a, e
	or a
	jp nz, .asm_ca5fc
	xor a
	scall FacePlayer
	ld hl, $009e
	scall CheckEventFlag
	or a
	jp nz, .asm_ca5f6
	ld hl, $0265
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca5ed
	ld hl, $017a
	scall PrintTextStandard
.asm_ca5c4:
	ld de, Data_ca5fd
	ld hl, Data_ca572
	scall Func_802ef
	or a
	jp nz, .asm_ca5dc
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca5c4
	jp .asm_ca5fc
.asm_ca5dc:
	ld e, $01
	ld hl, $009e
	scall EventFlagAction
	ld hl, $0266
	scall PrintTextStandard
	jp .asm_ca5f3
.asm_ca5ed:
	ld hl, $0269
	scall PrintTextStandard
.asm_ca5f3:
	jp .asm_ca5fc
.asm_ca5f6:
	ld hl, $0266
	scall PrintTextStandard
.asm_ca5fc:
	ret

Data_ca5fd:
	dstr "(くﾞんしﾞん)"

Data_ca606:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $33, $01, $33, $04, $1c, $17, $05
	db $1e, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca62f:
	ld a, e
	or a
	jp nz, .asm_ca690
	xor a
	scall FacePlayer
	ld hl, $00a3
	scall CheckEventFlag
	or a
	jp nz, .asm_ca68a
	ld hl, $025f
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca681
	ld hl, $016b
	scall PrintTextStandard
.asm_ca658:
	ld de, Data_ca691
	ld hl, Data_ca606
	scall Func_80347
	or a
	jp nz, .asm_ca670
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca658
	jp .asm_ca690
.asm_ca670:
	ld e, $01
	ld hl, $00a3
	scall EventFlagAction
	ld hl, $0266
	scall PrintTextStandard
	jp .asm_ca687
.asm_ca681:
	ld hl, $0268
	scall PrintTextStandard
.asm_ca687:
	jp .asm_ca690
.asm_ca68a:
	ld hl, $0266
	scall PrintTextStandard
.asm_ca690:
	ret

Data_ca691:
	dstr "(くﾞんしﾞん)"

Data_ca69a:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4f, $01, $4f, $04, $1c, $14, $14
	db $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_ca6c3:
	ld a, e
	or a
	jp nz, .asm_ca724
	xor a
	scall FacePlayer
	ld hl, $00a8
	scall CheckEventFlag
	or a
	jp nz, .asm_ca71e
	ld hl, $0263
	scall PrintTextStandard
	ld hl, $032c
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_ca715
	ld hl, $015d
	scall PrintTextStandard
.asm_ca6ec:
	ld de, Data_ca725
	ld hl, Data_ca69a
	scall Func_8039e
	or a
	jp nz, .asm_ca704
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_ca6ec
	jp .asm_ca724
.asm_ca704:
	ld e, $01
	ld hl, $00a8
	scall EventFlagAction
	ld hl, $0264
	scall PrintTextStandard
	jp .asm_ca71b
.asm_ca715:
	ld hl, $0263
	scall PrintTextStandard
.asm_ca71b:
	jp .asm_ca724
.asm_ca71e:
	ld hl, $0263
	scall PrintTextStandard
.asm_ca724:
	ret

Data_ca725:
	dstr "(くﾞんしﾞん)"

Data_ca72e:
	warpdef $06, $03, $01, $01, MAP_21_13, $06, $03, $07, $03, $2e

Data_ca739:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $7e, $17, $19, $3b, $03, $00, $00, $0e, $05, $00
	wildbot $00, $03, $14, $11, $2f, $18, $1a, $3b, $04, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $30, $19, $1b, $3b, $17, $1b, $1c, $04, $05, $00
	wildbot $00, $03, $14, $11, $2e, $1a, $1c, $0f, $05, $09, $1b, $04, $05, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $2c, $16, $18, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $15, $17, $19, $0f, $14, $0f, $17, $04, $05, $00
	wildbot $00, $03, $14, $11, $5d, $18, $1a, $0d, $09, $0b, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $6d, $19, $1b, $03, $09, $0e, $00, $04, $05, $00
	wildbot $00, $03, $14, $11, $5b, $1a, $1c, $3b, $18, $18, $1e, $04, $05, $00
ENDC

Data_ca77f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $04, $16, $18, $5c, $01, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $02, $19, $1b, $5c, $17, $17, $17, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $02, $16, $18, $5c, $17, $17, $17, $04, $0a, $00
	wildbot $00, $03, $14, $11, $08, $17, $19, $5c, $01, $13, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $27, $18, $1a, $5c, $01, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $04, $19, $1b, $5c, $01, $18, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $8f, $1a, $1c, $5c, $0f, $0d, $14, $0f, $03, $00
ENDC

Data_ca7c5:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $7f, $17, $19, $71, $28, $00, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $20, $18, $1a, $71, $17, $00, $00, $04, $08, $00
	wildbot $00, $03, $14, $11, $21, $19, $1b, $71, $17, $00, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $1f, $19, $1b, $71, $17, $00, $00, $04, $06, $00
	wildbot $00, $03, $14, $11, $22, $1c, $1e, $71, $0c, $00, $00, $04, $02, $00
ENDC

Data_ca80b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $71, $18, $1a, $78, $07, $12, $00, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $88, $18, $1a, $78, $04, $04, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $91, $19, $1b, $3b, $04, $17, $00, $04, $07, $00
	wildbot $00, $03, $14, $11, $80, $1b, $1d, $78, $1f, $1e, $07, $04, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $80, $18, $1a, $78, $1f, $1e, $07, $04, $0a, $00
	wildbot $00, $03, $14, $11, $85, $18, $1a, $7b, $14, $0d, $1f, $0e, $09, $00
	wildbot $00, $03, $14, $11, $73, $19, $1b, $0f, $06, $09, $0b, $0f, $08, $00
	wildbot $00, $03, $14, $11, $93, $19, $1b, $2e, $14, $14, $0d, $0e, $07, $00
	wildbot $00, $03, $14, $11, $71, $1b, $1d, $78, $07, $12, $00, $0f, $06, $00
ENDC

Data_ca851:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4c, $19, $1b, $46, $01, $01, $01, $04, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0f, $08, $00
	wildbot $00, $03, $14, $11, $62, $1b, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $57, $1d, $1f, $46, $1f, $17, $11, $0e, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $11, $19, $1b, $03, $1f, $1e, $18, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $4d, $19, $1b, $30, $2a, $12, $00, $0f, $09, $00
	wildbot $00, $03, $14, $11, $12, $1a, $1c, $03, $1f, $07, $16, $0e, $08, $00
	wildbot $00, $03, $14, $11, $62, $1b, $1d, $03, $14, $1e, $1e, $04, $06, $00
	wildbot $00, $03, $14, $11, $6c, $1d, $1f, $03, $17, $17, $0a, $04, $04, $00
ENDC

Data_ca897:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_caa1f, NULL

Data_ca8a5:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cab3c, NULL

Data_ca8b3:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cac75, NULL

Data_ca8c1:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_cadae, NULL

Data_ca8cf:
	person_event $09, $0c, $0a, $0b, $01, $01, $02, $04, $00, Func_caee7, NULL

Func_ca8dd:: ; ca8dd
	ld e, $01
	ld hl, Data_ca72e
	scall LoadWarps
	ld a, [wc78b]
	cp $04
	jp z, .asm_ca9c0
	cp $03
	jp z, .asm_ca990
	cp $02
	jp z, .asm_ca960
	cp $01
	jp z, .asm_ca930
	or a
	jp nz, .asm_ca9ed
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca739
	scall LoadEncounters
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp nz, .asm_ca91f
	ld e, $01
	ld hl, Data_ca897
	scall LoadMapObjects
.asm_ca91f:
	ld a, $09
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ea
	scall LandmarkSign
	jp .asm_ca9ed
.asm_ca930:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca77f
	scall LoadEncounters
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp nz, .asm_ca94f
	ld e, $01
	ld hl, Data_ca8a5
	scall LoadMapObjects
.asm_ca94f:
	ld a, $0e
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f9
	scall LandmarkSign
	jp .asm_ca9ed
.asm_ca960:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca7c5
	scall LoadEncounters
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp nz, .asm_ca97f
	ld e, $01
	ld hl, Data_ca8b3
	scall LoadMapObjects
.asm_ca97f:
	ld a, $0d
	scall PlayMusic
	scall Func_8001c
	ld hl, $02f4
	scall LandmarkSign
	jp .asm_ca9ed
.asm_ca990:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca80b
	scall LoadEncounters
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp nz, .asm_ca9af
	ld e, $01
	ld hl, Data_ca8c1
	scall LoadMapObjects
.asm_ca9af:
	ld a, $0f
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ef
	scall LandmarkSign
	jp .asm_ca9ed
.asm_ca9c0:
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_ca851
	scall LoadEncounters
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_ca9df
	ld e, $01
	ld hl, Data_ca8cf
	scall LoadMapObjects
.asm_ca9df:
	ld a, $10
	scall PlayMusic
	scall Func_8001c
	ld hl, $02fe
	scall LandmarkSign
.asm_ca9ed:
	ret

Data_ca9ee:
	db $0a, $05, $ff, $ff

Data_ca9f2:
	db $0b, $05, $ff, $ff

Data_ca9f6:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $4f, $01, $4f, $05, $1d, $14, $14
	db $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_caa1f:
	ld a, e
	or a
	jp nz, .asm_cab02
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp nz, .asm_cab02
	xor a
	scall FacePlayer
	ld hl, $00c9
	scall PrintTextStandard
	ld de, Data_cab03
	ld hl, Data_ca9f6
	scall ScriptedBattle
	or a
	jp nz, .asm_caa48
	jp .asm_cab02
.asm_caa48:
	ld hl, $00ca
	scall PrintTextStandard
	ld e, $01
	ld hl, $0095
	scall EventFlagAction
	ld e, $00
	ld hl, $0042
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $1e
	scall Func_80d4d
	cp $ff
	jp nz, .asm_caa75
	ld c, $03
	ld e, $01
	ld a, $1e
	scall Func_80d4d
.asm_caa75:
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_caaca
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_caaca
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_caaca
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_caaca
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_caaca
	ld c, $00
	ld e, $01
	ld a, $21
	scall Func_80d4d
	ld hl, $046f
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $0470
	scall PrintTextStandard
	xor a
	ld [wc78f], a
.asm_caaca:
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_caade
	ld bc, Data_ca9f2
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_caae7
.asm_caade:
	ld bc, Data_ca9ee
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_caae7:
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld l, $1b
	push hl
	ld c, $17
	ld e, $00
	ld a, $15
	scall Func_80dff
	pop bc
.asm_cab02:
	ret

Data_cab03:
	dstr "(くﾞんそう)"

Data_cab0b:
	db $0a, $05, $ff, $ff

Data_cab0f:
	db $0b, $05, $ff, $ff

Data_cab13:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $03, $01, $03, $05, $1e, $01, $18
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cab3c:
	ld a, e
	or a
	jp nz, .asm_cac3b
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp nz, .asm_cac3b
	xor a
	scall FacePlayer
	ld hl, $00cb
	scall PrintTextStandard
	ld hl, $015e
	scall PrintTextStandard
.asm_cab5b:
	ld de, Data_cac3c
	ld hl, Data_cab13
	scall Func_803f5
	or a
	jp nz, .asm_cab73
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_cab5b
	jp .asm_cac3b
.asm_cab73:
	ld hl, $00cc
	scall PrintTextStandard
	ld e, $01
	ld hl, $009a
	scall EventFlagAction
	ld e, $00
	ld hl, $0042
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $1c
	scall Func_80d4d
	cp $ff
	jp nz, .asm_caba0
	ld c, $03
	ld e, $01
	ld a, $1c
	scall Func_80d4d
.asm_caba0:
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cabf5
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cabf5
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cabf5
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cabf5
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cabf5
	ld c, $00
	ld e, $01
	ld a, $21
	scall Func_80d4d
	ld hl, $046f
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $0470
	scall PrintTextStandard
	xor a
	ld [wc78f], a
.asm_cabf5:
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_cac17
	cp $03
	jp z, .asm_cac0b
	cp $01
	jp z, .asm_cac0b
	or a
	jp nz, .asm_cac20
.asm_cac0b:
	ld bc, Data_cab0b
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cac20
.asm_cac17:
	ld bc, Data_cab0f
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cac20:
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld l, $1b
	push hl
	ld c, $0b
	ld e, $00
	ld a, $15
	scall Func_80dff
	pop bc
.asm_cac3b:
	ret

Data_cac3c:
	dstr "(くﾞんそう)"

Data_cac44:
	db $0a, $05, $ff, $ff

Data_cac48:
	db $0b, $05, $ff, $ff

Data_cac4c:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $1d, $17, $17
	db $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cac75:
	ld a, e
	or a
	jp nz, .asm_cad74
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp nz, .asm_cad74
	xor a
	scall FacePlayer
	ld hl, $00cd
	scall PrintTextStandard
	ld hl, $017a
	scall PrintTextStandard
.asm_cac94:
	ld de, Data_cad75
	ld hl, Data_cac4c
	scall Func_802ef
	or a
	jp nz, .asm_cacac
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_cac94
	jp .asm_cad74
.asm_cacac:
	ld hl, $00ce
	scall PrintTextStandard
	ld e, $01
	ld hl, $009f
	scall EventFlagAction
	ld e, $00
	ld hl, $0042
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $1d
	scall Func_80d4d
	cp $ff
	jp nz, .asm_cacd9
	ld c, $03
	ld e, $01
	ld a, $1d
	scall Func_80d4d
.asm_cacd9:
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cad2e
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cad2e
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cad2e
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cad2e
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cad2e
	ld c, $00
	ld e, $01
	ld a, $21
	scall Func_80d4d
	ld hl, $046f
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $0470
	scall PrintTextStandard
	xor a
	ld [wc78f], a
.asm_cad2e:
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_cad50
	cp $03
	jp z, .asm_cad44
	cp $01
	jp z, .asm_cad44
	or a
	jp nz, .asm_cad59
.asm_cad44:
	ld bc, Data_cac44
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cad59
.asm_cad50:
	ld bc, Data_cac48
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cad59:
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld l, $12
	push hl
	ld c, $1d
	ld e, $00
	ld a, $15
	scall Func_80dff
	pop bc
.asm_cad74:
	ret

Data_cad75:
	dstr "(くﾞんそう)"

Data_cad7d:
	db $0a, $05, $ff, $ff

Data_cad81:
	db $0b, $05, $ff, $ff

Data_cad85:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $1d, $26, $12
	db $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cadae:
	ld a, e
	or a
	jp nz, .asm_caead
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp nz, .asm_caead
	xor a
	scall FacePlayer
	ld hl, $00cf
	scall PrintTextStandard
	ld hl, $016b
	scall PrintTextStandard
.asm_cadcd:
	ld de, Data_caeae
	ld hl, Data_cad85
	scall Func_80347
	or a
	jp nz, .asm_cade5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_cadcd
	jp .asm_caead
.asm_cade5:
	ld hl, $00d0
	scall PrintTextStandard
	ld e, $01
	ld hl, $00a4
	scall EventFlagAction
	ld e, $00
	ld hl, $0042
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $20
	scall Func_80d4d
	cp $ff
	jp nz, .asm_cae12
	ld c, $03
	ld e, $01
	ld a, $20
	scall Func_80d4d
.asm_cae12:
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cae67
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cae67
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cae67
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cae67
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cae67
	ld c, $00
	ld e, $01
	ld a, $21
	scall Func_80d4d
	ld hl, $046f
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $0470
	scall PrintTextStandard
	xor a
	ld [wc78f], a
.asm_cae67:
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_cae89
	cp $03
	jp z, .asm_cae7d
	cp $01
	jp z, .asm_cae7d
	or a
	jp nz, .asm_cae92
.asm_cae7d:
	ld bc, Data_cad7d
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cae92
.asm_cae89:
	ld bc, Data_cad81
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cae92:
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld l, $12
	push hl
	ld c, $05
	ld e, $00
	ld a, $15
	scall Func_80dff
	pop bc
.asm_caead:
	ret

Data_caeae:
	dstr "(くﾞんそう)"

Data_caeb6:
	db $0a, $05, $ff, $ff

Data_caeba:
	db $0b, $05, $ff, $ff

Data_caebe:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $04, $1d, $14, $1e
	db $1e, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_caee7:
	ld a, e
	or a
	jp nz, .asm_cafe6
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_cafe6
	xor a
	scall FacePlayer
	ld hl, $00d1
	scall PrintTextStandard
	ld hl, $015d
	scall PrintTextStandard
.asm_caf06:
	ld de, Data_cafe7
	ld hl, Data_caebe
	scall Func_8039e
	or a
	jp nz, .asm_caf1e
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_caf06
	jp .asm_cafe6
.asm_caf1e:
	ld hl, $00d2
	scall PrintTextStandard
	ld e, $01
	ld hl, $00a9
	scall EventFlagAction
	ld e, $00
	ld hl, $0042
	scall EventFlagAction
	ld c, $01
	ld e, $01
	ld a, $1f
	scall Func_80d4d
	cp $ff
	jp nz, .asm_caf4b
	ld c, $03
	ld e, $01
	ld a, $1f
	scall Func_80d4d
.asm_caf4b:
	ld hl, $0095
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cafa0
	ld hl, $009a
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cafa0
	ld hl, $009f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cafa0
	ld hl, $00a4
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cafa0
	ld hl, $00a9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cafa0
	ld hl, $046f
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $0470
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $21
	scall Func_80d4d
	xor a
	ld [wc78f], a
.asm_cafa0:
	ld a, [wPlayerFacing]
	cp $02
	jp z, .asm_cafc2
	cp $03
	jp z, .asm_cafb6
	cp $01
	jp z, .asm_cafb6
	or a
	jp nz, .asm_cafcb
.asm_cafb6:
	ld bc, Data_caeb6
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cafcb
.asm_cafc2:
	ld bc, Data_caeba
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cafcb:
	ld a, $2e
	scall PlaySFX
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld l, $0a
	push hl
	ld c, $11
	ld e, $00
	ld a, $15
	scall Func_80dff
	pop bc
.asm_cafe6:
	ret

Data_cafe7:
	dstr "(くﾞんそう)"

Data_cafef:
	warpdef $09, $13, $02, $01, MAP_21_00, $11, $13, $11, $14, $2e
	warpdef $06, $0a, $01, $01, MAP_21_21, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_21, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_21, $0d, $0a, $0d, $09, $2e

Data_cb01b:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb061:
	person_event $09, $0c, $0a, $0c, $01, $01, $00, $04, $00, NULL, NULL
	person_event $09, $04, $09, $06, $01, $01, $00, $04, $00, Func_cb1e9, NULL
	person_event $ff, $00, $09, $08, $02, $01, $02, $04, $01, Func_cb10e, NULL
	person_event $ff, $00, $0a, $06, $01, $01, $00, $04, $01, Func_cb183, NULL

Func_cb099:: ; cb099
	ld e, $04
	ld hl, Data_cafef
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb01b
	scall LoadEncounters
	ld e, $04
	ld hl, Data_cb061
	scall LoadMapObjects
	ld hl, $00aa
	scall CheckEventFlag
	cp $01
	jp nz, .asm_cb0ce
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
.asm_cb0ce:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $02ff
	scall LandmarkSign
	ret

Data_cb0dd:
	db $0a, $0b, $ff, $ff

Data_cb0e1:
	db $09, $06, $ff, $ff

Data_cb0e5:
IF DEF(SUN)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $2e, $05, $1f, $04, $0e
	db $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ELIF DEF(STAR)
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $2e, $01, $5c, $05, $1f, $05, $05
	db $05, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c
ENDC

Func_cb10e:
	ld a, e
	cp $02
	jp nz, .asm_cb176
	ld hl, $00aa
	scall CheckEventFlag
	or a
	jp nz, .asm_cb176
	ld c, $01
	ld de, Data_cb0dd
	ld a, $32
	scall MovePlayer
	ld e, $00
	xor a
	scall SpriteFace
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, $00d9
	scall PrintTextStandard
	ld de, Data_cb177
	ld hl, Data_cb0e5
	scall ScriptedBattle
	or a
	jp nz, .asm_cb14d
	jp .asm_cb176
.asm_cb14d:
	ld hl, $00da
	scall PrintTextStandard
	ld bc, Data_cb0e1
	ld e, $32
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00aa
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb176:
	ret

Data_cb177:
	dstr "(くﾞんそう)"

Data_cb17f:
	db $0a, $05, $ff, $ff

Func_cb183:
	push de
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp z, .asm_cb1b6
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_cb1e7
.asm_cb1b6:
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_cb1e7
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	ld hl, $00be
	scall PrintTextStandard
	ld c, $01
	ld de, Data_cb17f
	ld a, $32
	scall MovePlayer
	ld e, $00
	ld a, $01
	scall SpriteFace
.asm_cb1e7:
	pop bc
	ret

Func_cb1e9:
	push af
	ld a, e
	or a
	jp nz, .asm_cb236
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0095
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $009a
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $009f
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $00a4
	scall CheckEventFlag
	or a
	jp z, .asm_cb227
	ld hl, $00a9
	scall CheckEventFlag
	or a
	jp nz, .asm_cb230
.asm_cb227:
	ld hl, $00be
	scall PrintTextStandard
	jp .asm_cb236
.asm_cb230:
	ld hl, $03be
	scall PrintTextStandard
.asm_cb236:
	pop bc
	ret

Data_cb238:
	warpdef $06, $0a, $01, $01, MAP_21_20, $06, $0a, $06, $0b, $2e
	warpdef $0a, $0e, $01, $01, MAP_21_20, $0a, $0e, $0a, $0d, $2e
	warpdef $0d, $0a, $01, $01, MAP_21_20, $0d, $0a, $0d, $0b, $2e
	warpdef $01, $0d, $01, $01, MAP_21_22, $01, $0d, $02, $0d, $2e
	warpdef $09, $09, $01, $01, MAP_21_22, $09, $09, $09, $0a, $2e
	warpdef $12, $08, $01, $01, MAP_21_22, $12, $08, $11, $08, $2e

Data_cb27a:
	db $30, $0a, $02, $03, $19

Data_cb27f:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb2c5:
	person_event $09, $0c, $03, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $03, $06, $01, $04, $00, $04, $01, Func_cb335, NULL
	person_event $ff, $00, $04, $04, $01, $05, $00, $04, $01, Func_cb335, NULL

Func_cb2ef:: ; cb2ef
	ld e, $06
	ld hl, Data_cb238
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb27a
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb27f
	scall LoadEncounters
	ld hl, $00ab
	scall CheckEventFlag
	or a
	jp nz, .asm_cb31e
	ld e, $03
	ld hl, Data_cb2c5
	scall LoadMapObjects
.asm_cb31e:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0300
	scall LandmarkSign
	ret

Data_cb32d:
	db $03, $06, $ff, $ff

Data_cb331:
	db $04, $05, $ff, $ff

Func_cb335:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb391
	ld hl, $00ab
	scall CheckEventFlag
	or a
	jp nz, .asm_cb391
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb368
	ld c, $01
	ld de, Data_cb32d
	ld a, $32
	scall MovePlayer
	xor a
	scall PlayerFace
	jp .asm_cb37d
.asm_cb368:
	ld c, $01
	ld de, Data_cb331
	ld a, $32
	scall MovePlayer
	ld a, $03
	scall PlayerFace
	ld e, $01
	xor a
	scall SpriteFace
.asm_cb37d:
	call Func_cb3c6
	ld e, $01
	ld hl, $00ab
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb391:
	pop bc
	ret

Data_cb393:
	db $0c, $05, $ff, $ff

Data_cb397:
	db $03, $06, $0c, $06, $ff, $ff

Data_cb39d:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $03, $01, $03, $05, $1f, $01, $18
	db $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_cb3c6:
	ld hl, $00d7
	scall PrintTextStandard
	ld de, Data_cb406
	ld hl, Data_cb39d
	scall ScriptedBattle
	or a
	jp nz, Func_cb3da
	ret

Func_cb3da:
	ld hl, $00d8
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_cb3f3
	ld bc, Data_cb393
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cb3fc
.asm_cb3f3:
	ld bc, Data_cb397
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cb3fc:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ret

Data_cb406:
	dstr "(くﾞんそう)"

Data_cb40e:
	warpdef $01, $0d, $01, $01, MAP_21_21, $01, $0d, $01, $0c, $2e
	warpdef $09, $09, $01, $01, MAP_21_21, $09, $09, $09, $0a, $2e
	warpdef $12, $08, $01, $01, MAP_21_21, $12, $08, $12, $09, $2e
	warpdef $01, $0a, $01, $01, MAP_21_23, $01, $0a, $01, $09, $2e
	warpdef $0d, $0b, $01, $01, MAP_21_23, $0d, $0b, $0c, $0b, $2e
	warpdef $12, $0d, $01, $01, MAP_21_23, $12, $0d, $11, $0d, $2e

Data_cb450:
	db $32, $06, $0b, $03, $1b

Data_cb455:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1b, $1d, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0e, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1a, $1c, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1b, $1d, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1d, $1f, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1e, $20, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $22, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb49b:
	person_event $09, $0c, $0b, $0b, $01, $01, $02, $04, $00, Func_cb534, NULL
	person_event $ff, $00, $0b, $09, $01, $02, $00, $04, $01, Func_cb534, NULL
	person_event $ff, $00, $0b, $0c, $01, $03, $00, $04, $01, Func_cb534, NULL

Func_cb4c5:: ; cb4c5
	ld e, $06
	ld hl, Data_cb40e
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb450
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb455
	scall LoadEncounters
	ld hl, $00ac
	scall CheckEventFlag
	or a
	jp nz, .asm_cb4f4
	ld e, $03
	ld hl, Data_cb49b
	scall LoadMapObjects
.asm_cb4f4:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0301
	scall LandmarkSign
	ret

Data_cb503:
	db $00, $00, $00, $01, $00, $c5, $ca, $00, $00, $1f, $01, $1f, $05, $20, $17, $17
	db $17, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_cb52c:
	db $0b, $0a, $ff, $ff

Data_cb530:
	db $0b, $0c, $ff, $ff

Func_cb534:
	push af
	ld l, $ff
	ld a, e
	cp $02
	jp z, .asm_cb541
	or a
	jp nz, .asm_cb580
.asm_cb541:
	ld a, [wMapY]
	add a, $04
	cp $0b
	jp nz, .asm_cb550
	ld l, $01
	jp .asm_cb580
.asm_cb550:
	ld a, e
	cp $02
	jp nz, .asm_cb580
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb570
	ld c, $01
	ld de, Data_cb52c
	ld a, $32
	scall MovePlayer
	ld a, $02
	scall PlayerFace
	jp .asm_cb57e
.asm_cb570:
	ld c, $01
	ld de, Data_cb530
	ld a, $32
	scall MovePlayer
	xor a
	scall PlayerFace
.asm_cb57e:
	ld l, $01
.asm_cb580:
	ld a, l
	cp $01
	jp nz, .asm_cb604
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	xor a
	scall FacePlayer
	ld hl, $00dd
	scall PrintTextStandard
	ld de, Data_cb606
	ld hl, Data_cb503
	scall ScriptedBattle
	or a
	jp nz, .asm_cb5a9
	jp .asm_cb604
.asm_cb5a9:
	ld hl, $00de
	scall PrintTextStandard
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
	ld e, $03
	xor a
	scall SpriteFace
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ac
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb604:
	pop bc
	ret

Data_cb606:
	dstr "(くﾞんそう)"

Data_cb60e:
	warpdef $01, $0a, $01, $01, MAP_21_22, $01, $0a, $01, $09, $2e
	warpdef $0d, $0b, $01, $01, MAP_21_22, $0d, $0b, $0c, $0b, $2e
	warpdef $12, $0d, $01, $01, MAP_21_22, $12, $0d, $11, $0d, $2e
	warpdef $07, $13, $01, $01, MAP_21_24, $07, $13, $07, $12, $2e
	warpdef $0c, $02, $01, $01, MAP_21_24, $0c, $02, $0c, $03, $2e
	warpdef $11, $09, $01, $01, MAP_21_24, $11, $09, $11, $0a, $2e

Data_cb650:
	db $33, $0c, $05, $03, $18

Data_cb655:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $23, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb69b:
	person_event $09, $0c, $0e, $03, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0d, $03, $01, $03, $00, $04, $01, Func_cb721, NULL
	person_event $ff, $00, $0e, $06, $04, $01, $00, $04, $01, Func_cb721, NULL

Data_cb6c5:
	person_event $ff, $00, $09, $0a, $02, $02, $00, $04, $00, Func_cb809, NULL

Func_cb6d3:: ; cb6d3
	ld e, $06
	ld hl, Data_cb60e
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb650
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb655
	scall LoadEncounters
	ld hl, $00ad
	scall CheckEventFlag
	or a
	jp nz, .asm_cb702
	ld e, $03
	ld hl, Data_cb69b
	scall LoadMapObjects
.asm_cb702:
	ld e, $01
	ld hl, Data_cb6c5
	scall LoadMapObjects
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0302
	scall LandmarkSign
	ret

Data_cb719:
	db $0d, $03, $ff, $ff

Data_cb71d:
	db $0e, $04, $ff, $ff

Func_cb721:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb774
	ld hl, $00ad
	scall CheckEventFlag
	or a
	jp nz, .asm_cb774
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb756
	ld c, $01
	ld de, Data_cb719
	ld a, $32
	scall MovePlayer
	ld e, $03
	xor a
	scall SpriteFace
	jp .asm_cb760
.asm_cb756:
	ld c, $01
	ld de, Data_cb71d
	ld a, $32
	scall MovePlayer
.asm_cb760:
	call Func_cb7a9
	ld e, $01
	ld hl, $00ad
	scall EventFlagAction
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb774:
	pop bc
	ret

Data_cb776:
	db $0e, $06, $11, $09, $ff, $ff

Data_cb77c:
	db $0c, $02, $ff, $ff

Data_cb780:
	db $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $20, $26, $12, $00, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_cb7a9:
	ld hl, $00db
	scall PrintTextStandard
	ld de, Data_cb801
	ld hl, Data_cb780
	scall ScriptedBattle
	or a
	jp nz, Func_cb7bd
	ret

Func_cb7bd:
	ld hl, $00dc
	scall PrintTextStandard
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_cb7d7
	ld bc, Data_cb776
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cb7e0
.asm_cb7d7:
	ld bc, Data_cb77c
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cb7e0:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
	ret

Data_cb801:
	dstr "(くﾞんそう)"

Func_cb809:
	ld a, e
	or a
	jp nz, .asm_cb834
	scall RepairRobots
	xor a
	scall PlayMusic
	ld a, $16
	scall PlayMusic
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	ld hl, $0322
	scall PrintTextStandard
	ld a, $07
	scall PlayMusic
.asm_cb834:
	ret

Data_cb835:
	warpdef $07, $13, $01, $01, MAP_21_23, $07, $13, $07, $12, $2e
	warpdef $0c, $02, $01, $01, MAP_21_23, $0c, $02, $0c, $03, $2e
	warpdef $11, $09, $01, $01, MAP_21_23, $11, $09, $11, $08, $2e
	warpdef $02, $0d, $01, $01, MAP_21_25, $02, $0d, $03, $0d, $2e

Data_cb861:
	db $34, $0f, $06, $02, $35

Data_cb866:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb8ac:
	person_event $09, $0c, $01, $08, $01, $01, $01, $04, $00, NULL, NULL
	person_event $ff, $00, $03, $05, $01, $05, $00, $04, $01, Func_cb91e, NULL
	person_event $ff, $00, $00, $0a, $03, $01, $00, $04, $01, Func_cb91e, NULL

Func_cb8d6:: ; cb8d6
	ld e, $04
	ld hl, Data_cb835
	scall LoadWarps
	ld e, $01
	ld hl, Data_cb861
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_cb866
	scall LoadEncounters
	ld hl, $00ae
	scall CheckEventFlag
	or a
	jp nz, .asm_cb905
	ld e, $03
	ld hl, Data_cb8ac
	scall LoadMapObjects
.asm_cb905:
	ld a, $07
	scall PlayMusic
	scall Func_8001c
	ld hl, $0303
	scall LandmarkSign
	ret

Data_cb914:
	db $03, $08, $02, $08, $ff, $ff

Data_cb91a:
	db $01, $09, $ff, $ff

Func_cb91e:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb969
	ld hl, $00ae
	scall CheckEventFlag
	or a
	jp nz, .asm_cb969
	xor a
	scall PlayMusic
	ld a, $1a
	scall PlayMusic
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb94d
	ld c, $01
	ld de, Data_cb914
	ld a, $32
	scall MovePlayer
	jp .asm_cb95d
.asm_cb94d:
	ld c, $01
	ld de, Data_cb91a
	ld a, $32
	scall MovePlayer
	ld e, $02
	xor a
	scall SpriteFace
.asm_cb95d:
	call Func_cb99c
	xor a
	scall PlayMusic
	ld a, $07
	scall PlayMusic
.asm_cb969:
	pop bc
	ret

Data_cb96b:
	db $01, $0d, $ff, $ff

Data_cb96f:
	db $02, $0d, $ff, $ff

Data_cb973:
	db $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $61, $01, $61, $05, $21, $14, $1e, $1e, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_cb99c:
	ld hl, $00d5
	scall PrintTextStandard
	ld de, Data_cb9e5
	ld hl, Data_cb973
	scall ScriptedBattle
	or a
	jp nz, .asm_cb9b0
	ret
.asm_cb9b0:
	ld hl, $00d6
	scall PrintTextStandard
	ld e, $01
	ld hl, $00ae
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $03
	jp nz, .asm_cb9d2
	ld bc, Data_cb96b
	ld e, $32
	xor a
	scall MovePersonAndWait
	jp .asm_cb9db
.asm_cb9d2:
	ld bc, Data_cb96f
	ld e, $32
	xor a
	scall MovePersonAndWait
.asm_cb9db:
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ret

Data_cb9e5:
	dstr "(くﾞんそう)"

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

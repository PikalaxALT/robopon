INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2c", ROMX
	script_library 2c

Data_b10b4:
	warpdef $06, $1b, $01, $01, MAP_25_01, $19, $05, $19, $06, $2e
	warpdef $06, $04, $04, $01, MAP_28_01, $11, $19, $11, $18, $2e

Data_b10ca:
	dw $2b2
	dw -1

Data_b10ce:
	person_event $ff, $00, $05, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca
	person_event $ff, $00, $07, $1a, $01, $01, $00, $04, $01, PrintTextFacePlayer_2c, Data_b10ca

Func_b10ea:: ; b10ea
	ld e, $02
	ld hl, Data_b10b4
	scall LoadWarps
	ld e, $02
	ld hl, Data_b10ce
	scall LoadMapObjects
	ld a, $0d
	ld [wc7e2], a
	ld a, $12
	scall PlayMusic
	scall Func_8001c
	call Func_b110b
	ret

Func_b110b:
	ld hl, $001e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b112d
	ld hl, $0009
	scall CheckEventFlag
	or a
	jp nz, .asm_b112d
	ld l, $04
	push hl
	ld c, $11
	ld e, $01
	ld a, $1c
	scall Func_80dff
	pop bc
.asm_b112d:
	ret

Data_b112e:
	warpdef $10, $19, $03, $01, MAP_28_00, $07, $04, $07, $05, $2e
	warpdef $05, $13, $01, $03, MAP_25_02, $0e, $04, $0d, $04, $2e
	warpdef $1d, $13, $01, $03, MAP_25_03, $05, $04, $06, $04, $2e
	warpdef $0c, $08, $01, $01, MAP_28_01, $11, $03, $11, $04, $2e
	warpdef $11, $03, $01, $01, MAP_28_01, $0c, $08, $0c, $09, $2e

Data_b1165:
	dw $12f
	dw -1

Data_b1169:
	dw $1c0
	dw -1

Data_b116d:
	dw $10c
	dw -1

Data_b1171:
	dw $10e
	dw -1

Data_b1175:
	dw $338
	dw -1

Data_b1179:
	dw $339
	dw -1

Data_b117d:
	dw $3de
	dw -1

Data_b1181:
	dw $3df
	dw -1

Data_b1185:
	dw $130
	dw -1

Data_b1189:
	person_event $0d, $0c, $10, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b117d
	person_event $23, $0c, $12, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1181
	person_event $06, $0c, $11, $0c, $01, $01, $02, $04, $00, PrintTextFacePlayer_2c, Data_b1169

Data_b11b3:
	person_event $09, $0c, $06, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_2c, Data_b116d
	person_event $ff, $00, $06, $13, $01, $01, $00, $04, $01, $6038, NULL
	person_event $ff, $00, $06, $15, $01, $01, $00, $04, $01, $6038, NULL
	person_event $09, $0c, $1c, $14, $01, $01, $03, $04, $00, PrintTextFacePlayer_2c, Data_b1171
	person_event $ff, $00, $1c, $13, $01, $01, $00, $04, $01, $60b3, NULL
	person_event $ff, $00, $1c, $15, $01, $01, $00, $04, $01, $60b3, NULL

Data_b1207:
	person_event $19, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $0b, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $0b, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5686, NULL

Data_b123f:
	person_event $1e, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5817, NULL

Data_b125b:
	person_event $1f, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $28, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $28, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $591e, NULL
	person_event $13, $04, $11, $0e, $01, $01, $03, $04, $01, NULL, NULL

Data_b12a1:
	person_event $20, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5ab8, NULL

Data_b12d9:
	person_event $21, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5b9b, NULL
	person_event $0b, $0c, $11, $19, $01, $01, $00, $04, $00, NULL, NULL

Data_b1303:
	person_event $1a, $04, $12, $0e, $01, $01, $03, $04, $00, Func_808fc_2c, Data_b1165
	person_event $0d, $0c, $10, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $23, $04, $11, $0c, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1185
	person_event $ff, $00, $10, $16, $03, $01, $00, $04, $01, $5c59, NULL
	person_event $ff, $00, $07, $12, $01, $03, $00, $04, $01, $5c59, NULL
	person_event $ff, $00, $1b, $12, $01, $03, $00, $04, $01, $5c59, NULL

Data_b1357:
	person_event $0d, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $1a, $0c, $10, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1175
	person_event $23, $04, $12, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1179
	person_event $ff, $ff, $11, $11, $01, $01, $00, $04, $01, $5d8b, NULL

Func_b138f:: ; b138f
	ld e, $05
	ld hl, Data_b112e
	scall LoadWarps
	ld hl, $0014
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b13da
	ld hl, $0007
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b13da
	ld hl, $001e
	scall CheckEventFlag
	or a
	jp nz, .asm_b13da
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $04
	ld hl, Data_b1207
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b13da:
	ld hl, $0014
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1468
	ld hl, $0007
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1468
	ld hl, $001e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1468
	ld hl, $0009
	scall CheckEventFlag
	or a
	jp nz, .asm_b1468
	ld a, [wBackupMapGroup]
	cp $1c
	jp nz, .asm_b1439
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b1439
	ld a, [wBackupMapX]
	cp $07
	jp nz, .asm_b1439
	ld a, [wBackupMapY]
	cp $05
	jp nz, .asm_b1439
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_b17c6
	jp .asm_b1465
.asm_b1439:
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld a, $14
	scall PlayMusic
	scall Func_8001c
.asm_b1465:
	jp .asm_b1640
.asm_b1468:
	ld hl, $003c
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b14ab
	ld hl, $001e
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b14ab
	ld hl, $001f
	scall CheckEventFlag
	or a
	jp nz, .asm_b14ab
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_b123f
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b14ab:
	ld hl, $0015
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b14f5
	ld hl, $001f
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b14f5
	ld hl, $0020
	scall CheckEventFlag
	or a
	jp nz, .asm_b14f5
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $05
	ld hl, Data_b125b
	scall LoadMapObjects
	ld e, $00
	ld a, $0d
	scall SetPersonVisibilityState
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b14f5:
	ld hl, $0016
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1538
	ld hl, $0020
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1538
	ld hl, $0021
	scall CheckEventFlag
	or a
	jp nz, .asm_b1538
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $04
	ld hl, Data_b12a1
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b1538:
	ld a, [wc78d]
	cp $01
	jp nz, .asm_b157f
	ld hl, $0021
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b157f
	ld hl, $0022
	scall CheckEventFlag
	or a
	jp nz, .asm_b157f
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $03
	ld hl, Data_b12d9
	scall LoadMapObjects
	ld e, $00
	ld a, $0b
	scall SetPersonVisibilityState
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b157f:
	ld hl, $0034
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b15c7
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b15c7
	ld hl, $0023
	scall CheckEventFlag
	or a
	jp nz, .asm_b15c7
	ld hl, $0035
	scall CheckEventFlag
	or a
	jp nz, .asm_b15c7
	ld hl, $00c3
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b15c7
	ld e, $06
	ld hl, Data_b1303
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b15c7:
	ld hl, $0033
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1605
	ld hl, $0022
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1605
	ld hl, $0023
	scall CheckEventFlag
	or a
	jp nz, .asm_b1605
	ld hl, $0035
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b1605
	ld e, $04
	ld hl, Data_b1357
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	jp .asm_b1640
.asm_b1605:
	ld a, [wc790]
	or a
	jp z, .asm_b1638
	ld a, [wc790]
	cp $04
	jp c, .asm_b1638
	ld e, $03
	ld hl, Data_b1189
	scall LoadMapObjects
	ld e, $06
	ld hl, Data_b11b3
	scall LoadMapObjects
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
.asm_b1638:
	ld a, $14
	scall PlayMusic
	scall Func_8001c
.asm_b1640:
	ret

Data_b1641:
IF DEF(SUN)
	db $00, $00, $00, $04, $2f, $c5, $bc, $00, $00, $30, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $72, $02, $06, $0c, $00, $00, $0b
	db $46, $03, $06, $07, $07, $07, $7f, $01, $0e
ELIF DEF(STAR)
	db $00, $00, $00, $04, $2f, $c5, $bc, $00, $00, $30, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $72, $02, $06, $0c, $00, $00, $0b
	db $05, $03, $06, $03, $03, $01, $30, $01, $0e
ENDC

Data_b166a:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1670:
	db $11, $0e, $11, $14, $ff, $ff

Data_b1676:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b167e:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b1686:
	ld a, e
	cp $02
	jp nz, .asm_b17c0
	ld hl, $001e
	scall CheckEventFlag
	or a
	jp nz, .asm_b17c0
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b166a
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $004d
	scall PrintTextWithNPCName
	ld hl, $004e
	scall PrintTextWithNPCName
	ld hl, $004f
	scall PrintTextWithNPCName
	ld hl, $0050
	scall PrintTextWithNPCName
	ld hl, $0051
	scall PrintTextWithNPCName
	ld hl, $0052
	scall PrintTextWithNPCName
	ld hl, $0053
	scall PrintTextWithNPCName
	ld hl, $0054
	scall PrintTextWithNPCName
	xor a
	scall PlayerFace
	ld e, $00
	ld a, $09
	scall SpriteFace
	ld hl, $0057
	scall PrintTextWithNPCName
	xor a
.asm_b16fd:
	cp $08
	jp nc, .asm_b170e
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b16fd
.asm_b170e:
	ld hl, $0055
	scall PrintTextWithNPCName
	xor a
.asm_b1715:
	cp $08
	jp nc, .asm_b1727
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1715
.asm_b1727:
	ld hl, $0056
	scall PrintTextWithNPCName
	ld e, $03
	ld a, $09
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $01
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	ld de, Data_b17c1
	ld hl, Data_b1641
	scall ScriptedBattle
	or a
	jp nz, .asm_b1755
	jp .asm_b17c0
.asm_b1755:
	ld hl, $0058
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $18
	scall PlayMusic
	ld bc, Data_b1670
	ld e, $2c
	ld a, $09
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	ld bc, Data_b1676
	ld e, $2c
	ld a, $0a
	scall MovePerson
	ld bc, Data_b167e
	ld e, $2c
	ld a, $0b
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $0b
	scall SetPersonVisibilityState
	ld a, $07
	ld [wc790], a
	call Func_b213e
	ld e, $01
	ld hl, $001e
	scall EventFlagAction
	ld a, $03
	scall Func_80c94
	ld a, $12
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $01
	scall Func_80d4d
.asm_b17c0:
	ret

Data_b17c1:
	dstr "ヒﾞスコ"

Func_b17c6:
	ld hl, $005b
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $0009
	scall EventFlagAction
	ld l, $05
	push hl
	ld c, $07
	ld e, $00
	ld a, $1c
	scall Func_80dff
	pop bc
	ret

Data_b17e2:
	db $00, $00, $00, $04, $30, $c5, $bd, $00, $00, $90, $01, $0e, $02,  $11, $04, $17
	db $00, $7f, $38, $02, $11, $0e, $0b, $00, $18, $18, $02, $11, $09,  $09, $0b, $18
	db $07, $03, $11, $01, $13, $00, $5b, $01, $0f

Data_b180b:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1811:
	db $11, $0e, $11, $14, $ff, $ff

Func_b1817:
	ld a, e
	cp $02
	jp nz, .asm_b18d3
	ld hl, $001f
	scall CheckEventFlag
	or a
	jp nz, .asm_b18d3
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b180b
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $007e
	scall PrintTextWithNPCName
	ld de, Data_b18d4
	ld hl, Data_b17e2
	scall ScriptedBattle
	or a
	jp nz, .asm_b1862
	jp .asm_b18d3
.asm_b1862:
	ld hl, $007f
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $0367
	scall PrintTextStandard
	ld hl, $0368
	scall PrintTextWithNPCName
	ld bc, Data_b1811
	ld e, $2c
	ld a, $09
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	ld c, $0f
	ld e, $00
	ld a, $1e
	scall GiveRobot
	cp $ff
	jp nz, .asm_b189b
.asm_b189b:
	ld a, $06
	ld [wc790], a
	call Func_b213e
	ld e, $01
	ld hl, $001f
	scall EventFlagAction
	ld a, $05
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $02
	scall Func_80d4d
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	ld hl, $0086
	scall CheckEventFlag
	or a
	jp nz, .asm_b18d3
	ld e, $01
	ld hl, $0086
	scall EventFlagAction
.asm_b18d3:
	ret

Data_b18d4:
	dstr "アムロン"

Data_b18d9:
	db $00, $00, $00, $04, $31, $c5, $be, $00, $00, $4e, $01, $0f, $03, $16, $0e, $0e
	db $0e, $67, $3a, $03, $16, $07, $0b, $00, $46, $7e, $03, $16, $28, $12, $00, $71
	db $3b, $03, $16, $07, $09, $00, $46, $01, $10

Data_b1902:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1908:
	db $11, $0e, $11, $14, $ff, $ff

Data_b190e:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b1916:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b191e:
	ld a, e
	cp $02
	jp nz, .asm_b1a6c
	ld hl, $0020
	scall CheckEventFlag
	or a
	jp nz, .asm_b1a6c
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b1902
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld e, $01
	ld a, $0d
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $0d
	scall SpriteFace
	ld e, $01
	ld a, $0d
	scall SpriteFace
	ld e, $02
	ld a, $0d
	scall SpriteFace
	ld e, $03
	ld a, $0d
	scall SpriteFace
	ld e, $00
	ld a, $0d
	scall SpriteFace
	ld e, $01
	ld a, $0d
	scall SpriteFace
	ld e, $02
	ld a, $0d
	scall SpriteFace
	ld e, $03
	ld a, $0d
	scall SpriteFace
	ld hl, $00aa
	scall PrintTextWithNPCName
	ld de, Data_b1a6d
	ld hl, Data_b18d9
	scall ScriptedBattle
	or a
	jp nz, .asm_b19a8
	jp .asm_b1a6c
.asm_b19a8:
	ld hl, $00ab
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $0d
	scall SpriteFace
	ld e, $01
	ld a, $0d
	scall SpriteFace
	ld e, $02
	ld a, $0d
	scall SpriteFace
	ld e, $03
	ld a, $0d
	scall SpriteFace
	ld e, $00
	ld a, $0d
	scall SpriteFace
	ld e, $01
	ld a, $0d
	scall SpriteFace
	ld e, $02
	ld a, $0d
	scall SpriteFace
	ld e, $03
	ld a, $0d
	scall SpriteFace
	ld e, $00
	ld a, $0d
	scall SpriteFace
	ld e, $01
	ld a, $0d
	scall SpriteFace
	ld e, $00
	ld a, $0d
	scall SetPersonVisibilityState
	ld hl, $036a
	scall PrintTextStandard
	ld hl, $036b
	scall PrintTextWithNPCName
	ld bc, Data_b1908
	ld e, $2c
	ld a, $09
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	ld bc, Data_b190e
	ld e, $2c
	ld a, $0a
	scall MovePerson
	ld bc, Data_b1916
	ld e, $2c
	ld a, $0b
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $0b
	scall SetPersonVisibilityState
	ld c, $19
	ld e, $00
	ld a, $0f
	scall GiveRobot
	cp $ff
	jp nz, .asm_b1a4e
.asm_b1a4e:
	ld a, $05
	ld [wc790], a
	call Func_b213e
	ld e, $01
	ld hl, $0020
	scall EventFlagAction
	ld a, $08
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $03
	scall Func_80d4d
.asm_b1a6c:
	ret

Data_b1a6d:
	dstr "ワイルトﾞ"

Data_b1a73:
	db $00, $00, $00, $04, $31, $c5, $bf, $00, $00, $75, $01, $31, $04, $20, $07, $0c
	db $00, $79, $73, $04, $20, $0c, $08, $00, $79, $74, $04, $20, $0d, $09, $00, $79
	db $32, $05, $20, $07, $07, $14, $30, $01, $11

Data_b1a9c:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1aa2:
	db $11, $0e, $11, $14, $ff, $ff

Data_b1aa8:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b1ab0:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b1ab8:
	ld a, e
	cp $02
	jp nz, .asm_b1b60
	ld hl, $0021
	scall CheckEventFlag
	or a
	jp nz, .asm_b1b60
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b1a9c
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $00e0
	scall PrintTextWithNPCName
	ld de, Data_b1b61
	ld hl, Data_b1a73
	scall ScriptedBattle
	or a
	jp nz, .asm_b1b03
	jp .asm_b1b60
.asm_b1b03:
	ld hl, $00e1
	scall PrintTextWithNPCName
	ld bc, Data_b1aa2
	ld e, $2c
	ld a, $09
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	ld bc, Data_b1aa8
	ld e, $2c
	ld a, $0a
	scall MovePerson
	ld bc, Data_b1ab0
	ld e, $2c
	ld a, $0b
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $0a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $0b
	scall SetPersonVisibilityState
	ld a, $04
	ld [wc790], a
	call Func_b213e
	ld e, $01
	ld hl, $0021
	scall EventFlagAction
	ld a, $07
	ld [wc78d], a
	ld c, $00
	ld e, $01
	ld a, $04
	scall Func_80d4d
.asm_b1b60:
	ret

Data_b1b61:
	dstr "カマット"

Data_b1b66:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c1, $00, $00, $45, $01, $1d, $04, $25, $23, $12
	db $00, $7a, $91, $04, $25, $0e, $13, $00, $7a, $0d, $04, $25, $04, $18, $04, $7a
	db $8d, $05, $25, $0d, $0e, $13, $7a, $01, $12
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c1, $00, $00, $45, $01, $1d, $04, $25, $23, $12
	db $00, $7a, $91, $04, $25, $0e, $13, $00, $7a, $0a, $04, $25, $04, $18, $04, $7a
	db $8d, $05, $25, $0d, $0e, $13, $7a, $01, $12
ENDC

Data_b1b8f:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1b95:
	db $11, $0e, $11, $14, $ff, $ff

Func_b1b9b:
	ld a, e
	cp $02
	jp nz, .asm_b1c47
	ld hl, $0022
	scall CheckEventFlag
	or a
	jp nz, .asm_b1c47
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b1b8f
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $00f9
	scall PrintTextWithNPCName
	ld de, Data_b1c48
	ld hl, Data_b1b66
	scall ScriptedBattle
	or a
	jp nz, .asm_b1be6
	jp .asm_b1c47
.asm_b1be6:
	ld hl, $00fa
	scall PrintTextWithNPCName
	ld bc, Data_b1b95
	ld e, $2c
	ld a, $09
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $09
	scall SetPersonVisibilityState
	call Func_b2275
	ld e, $01
	ld hl, $0022
	scall EventFlagAction
	ld a, $03
	ld [wc790], a
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $06
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $08
	scall SetPersonVisibilityState
.asm_b1c47:
	ret

Data_b1c48:
	dstr "ヘットﾞ"

Data_b1c4d:
	db $11, $13, $ff, $ff

Data_b1c51:
	db $11, $10, $ff, $ff

Data_b1c55:
	db $11, $15, $ff, $ff

Func_b1c59:
	ld a, e
	cp $02
	jp nz, .asm_b1d4f
	ld hl, $0035
	scall CheckEventFlag
	or a
	jp nz, .asm_b1d4f
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b1c4d
	ld a, $2c
	scall MovePlayer
	xor a
	scall PlayerFace
	xor a
.asm_b1c81:
	cp $05
	jp nc, .asm_b1c92
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1c81
.asm_b1c92:
	ld a, $01
	scall FadeInAudio
	ld a, $13
	scall PlayMusic
	ld hl, $012b
	scall PrintTextWithNPCName
	ld hl, $012c
	scall PrintTextWithNPCName
	ld hl, $012d
	scall PrintTextWithNPCName
	ld bc, Data_b1c55
	ld e, $2c
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $003c
	scall ScriptSleep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	xor a
	scall PlayMusic
	xor a
.asm_b1ccd:
	cp $05
	jp nc, .asm_b1cdf
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1ccd
.asm_b1cdf:
	ld c, $01
	ld de, Data_b1c51
	ld a, $2c
	scall MovePlayer
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $0e
	ld a, $12
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $012e
	scall PrintTextWithNPCName
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld hl, $0130
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $02
	ld a, $02
	scall SpriteFace
	ld a, $0e
	scall Func_80c94
	ld e, $01
	ld hl, $0035
	scall EventFlagAction
	ld a, $07
	scall PlayMusic
.asm_b1d4f:
	ret

Data_b1d50:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c3, $00, $00, $2e, $01, $80, $05, $32, $10, $00
	db $00, $08, $81, $05, $32, $10, $01, $03, $08, $82, $05, $32, $10, $04, $07, $09
	db $86, $06, $32, $03, $03, $03, $7b, $01, $13
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c3, $00, $00, $2e, $01, $80, $05, $32, $10, $00
	db $00, $08, $81, $05, $32, $10, $01, $03, $08, $82, $05, $32, $10, $04, $07, $09
	db $86, $06, $32, $04, $04, $04, $7b, $01, $13
ENDC

Data_b1d79:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1d7f:
	db $11, $0e, $ff, $ff

Data_b1d83:
	db $11, $0d, $ff, $ff

Data_b1d87:
	db $11, $03, $ff, $ff

Func_b1d8b:
	ld a, e
	cp $02
	jp nz, .asm_b202b
	ld hl, $0023
	scall CheckEventFlag
	or a
	jp nz, .asm_b202b
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $01
	ld de, Data_b1d79
	ld a, $2c
	scall MovePlayer
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $0133
	scall PrintTextWithNPCName
	ld de, Data_b202c
	ld hl, Data_b1d50
	scall ScriptedBattle
	or a
	jp nz, .asm_b1dd6
	jp .asm_b202b
.asm_b1dd6:
	ld hl, $0134
	scall PrintTextWithNPCName
	ld bc, Data_b1d7f
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SpriteFace
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $04
	scall PlayMusic
	ld hl, $0135
	scall PrintTextWithNPCName
	ld bc, Data_b1d83
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayerFace
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld c, $01
	ld e, $01
	ld a, $17
	scall LoadEmote
	ld e, $0d
	ld a, $0f
	scall MoveEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $59
	scall PlaySFX
	ld c, $05
	ld e, $11
	xor a
	scall Func_80080
	xor a
.asm_b1e4e:
	cp $08
	jp nc, .asm_b1e6a
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $05
	jp nz, .asm_b1e65
	xor a
	scall Func_80653
.asm_b1e65:
	pop af
	inc a
	jp .asm_b1e4e
.asm_b1e6a:
	scall WaitEmote
	ld e, $01
	xor a
	scall SetPersonVisibilityState
	scall HideEmote
	ld e, $03
	ld a, $02
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	xor a
	scall SpriteFace
	ld hl, $003c
	scall ScriptSleep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $0136
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $00
	xor a
	scall SpriteFace
	ld e, $00
	ld a, $02
	scall SpriteFace
	ld c, $01
	ld e, $01
	ld a, $18
	scall LoadEmote
	scall WaitEmote
	ld c, $01
	ld e, $03
	ld a, $18
	scall LoadEmote
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld a, $63
	scall PlaySFX
	scall WaitEmote
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $0137
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $07
	ld a, $19
	scall LoadEmote
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall FadeInAudio
	ld a, $13
	scall PlayMusic
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $0138
	scall PrintTextWithNPCName
	xor a
.asm_b1f29:
	cp $02
	jp nc, .asm_b1f3b
	push af
	ld e, $01
	ld a, $03
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f29
.asm_b1f3b:
	ld a, $01
	scall Func_80653
	xor a
.asm_b1f41:
	cp $09
	jp nc, .asm_b1f53
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f41
.asm_b1f53:
	ld c, $01
	ld e, $0f
	ld a, $1a
	scall LoadEmote
	ld hl, $0078
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	scall WaitEmote
	ld hl, $0139
	scall PrintTextWithNPCName
	ld c, $01
	ld e, $30
	ld a, $1a
	scall LoadEmote
	ld e, $0e
	ld a, $0c
	scall MoveEmote
	ld hl, $0078
	scall ScriptSleep
	ld a, $02
	scall PlayerFace
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b1f9f:
	cp $09
	jp nc, .asm_b1fb0
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f9f
.asm_b1fb0:
	ld hl, $001e
	scall ScriptSleep
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $03c6
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $06
	scall Func_80d4d
	ld hl, $013a
	scall PrintTextWithNPCName
	ld bc, Data_b1d87
	ld e, $2c
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $0023
	scall EventFlagAction
	ld a, $02
	ld [wc790], a
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b2006:
	cp $09
	jp nc, .asm_b2018
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b2006
.asm_b2018:
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $07
	scall PlayMusic
.asm_b202b:
	ret

Data_b202c:
	dstr "テール"

Data_b2030:
	db $07, $13, $ff, $ff

Data_b2034:
	db $07, $15, $ff, $ff

Func_b2038:
	push af
	push de
	ld hl, $0022
	scall CheckEventFlag
	or a
	jp nz, .asm_b20a8
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_b20a8
	ld hl, sp+$03
	ld a, [hl]
	cp $04
	jp nz, .asm_b2063
	ld e, $00
	ld a, $03
	scall SpriteFace
	ld a, $02
	scall PlayerFace
	jp .asm_b206e
.asm_b2063:
	ld e, $02
	ld a, $03
	scall SpriteFace
	xor a
	scall PlayerFace
.asm_b206e:
	scall WaitNPCStep
	ld a, $69
	scall PlaySFX
	ld hl, $010c
	scall PrintTextStandard
	ld hl, sp+$03
	ld a, [hl]
	cp $04
	jp nz, .asm_b2091
	ld c, $01
	ld de, Data_b2030
	ld a, $2c
	scall MovePlayer
	jp .asm_b209b
.asm_b2091:
	ld c, $01
	ld de, Data_b2034
	ld a, $2c
	scall MovePlayer
.asm_b209b:
	scall WaitNPCStep
	ld e, $01
	ld a, $03
	scall SpriteFace
	scall WaitNPCStep
.asm_b20a8:
	pop bc
	pop bc
	ret

Data_b20ab:
	db $1b, $13, $ff, $ff

Data_b20af:
	db $1b, $15, $ff, $ff

Func_b20b3:
	push af
	push de
	ld hl, $0022
	scall CheckEventFlag
	or a
	jp nz, .asm_b2123
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_b2123
	ld hl, sp+$03
	ld a, [hl]
	cp $07
	jp nz, .asm_b20de
	ld e, $00
	ld a, $06
	scall SpriteFace
	ld a, $02
	scall PlayerFace
	jp .asm_b20e9
.asm_b20de:
	ld e, $02
	ld a, $06
	scall SpriteFace
	xor a
	scall PlayerFace
.asm_b20e9:
	scall WaitNPCStep
	ld a, $69
	scall PlaySFX
	ld hl, $010e
	scall PrintTextStandard
	ld hl, sp+$03
	ld a, [hl]
	cp $07
	jp nz, .asm_b210c
	ld c, $01
	ld de, Data_b20ab
	ld a, $2c
	scall MovePlayer
	jp .asm_b2116
.asm_b210c:
	ld c, $01
	ld de, Data_b20af
	ld a, $2c
	scall MovePlayer
.asm_b2116:
	scall WaitNPCStep
	ld e, $03
	ld a, $06
	scall SpriteFace
	scall WaitNPCStep
.asm_b2123:
	pop bc
	pop bc
	ret

Data_b2126:
	db $0c, $14, $ff, $ff

Data_b212a:
	db $11, $10, $12, $0e, $ff, $ff

Data_b2130:
	db $12, $10, $11, $14, $ff, $ff

Data_b2136:
	db $11, $0e, $ff, $ff

Data_b213a:
	db $11, $13, $ff, $ff

Func_b213e:
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $12
	scall PlayMusic
	ld c, $09
	ld e, $0c
	xor a
	scall Func_80080
	ld e, $02
	xor a
	scall SpriteFace
	ld bc, Data_b2126
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $14
	ld e, $11
	xor a
	scall Func_80080
	ld e, $00
	xor a
	scall SpriteFace
	ld bc, Data_b212a
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld a, [wc790]
	cp $04
	jp z, .asm_b21de
	cp $05
	jp z, .asm_b21ca
	cp $06
	jp z, .asm_b21b6
	cp $07
	jp nz, .asm_b21f2
	ld hl, $0059
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $005a
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21b6:
	ld hl, $0081
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $0080
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21ca:
	ld hl, $00ad
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $00ac
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21de:
	ld hl, $00e3
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $00e2
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21f2:
	ld hl, $00ae
	scall PrintTextWithNPCName
.asm_b21f8:
	ld bc, Data_b2130
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld bc, Data_b2136
	ld e, $2c
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	ld a, $02
	scall SpriteFace
	ld hl, $01c0
	scall PrintTextStandard
	ld bc, Data_b213a
	ld e, $2c
	ld a, $02
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $02
	scall SetPersonVisibilityState
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ret

Data_b2253:
	db $0c, $14, $ff, $ff

Data_b2257:
	db $11, $10, $12, $0e, $ff, $ff

Data_b225d:
	db $12, $10, $11, $14, $ff, $ff

Data_b2263:
	db $11, $10, $12, $0f, $ff, $ff

Data_b2269:
	db $11, $15, $ff, $ff

Data_b226d:
	db $11, $14, $ff, $ff

Data_b2271:
	db $0a, $14, $ff, $ff

Func_b2275:
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $12
	scall PlayMusic
	ld c, $09
	ld e, $0c
	xor a
	scall Func_80080
	ld e, $02
	xor a
	scall SpriteFace
	ld bc, Data_b2253
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $14
	ld e, $11
	xor a
	scall Func_80080
	ld e, $00
	xor a
	scall SpriteFace
	ld bc, Data_b2257
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $0337
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $05
	scall Func_80d4d
	ld hl, $00fb
	scall PrintTextWithNPCName
	ld a, $05
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld c, $14
	ld e, $11
	ld a, $03
	scall Func_80080
	ld bc, Data_b2263
	ld e, $2c
	ld a, $03
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $02
	xor a
	scall SpriteFace
	ld hl, $00fc
	scall PrintTextStandard
	ld e, $03
	xor a
	scall SpriteFace
	ld a, $01
	scall FadeInAudio
	ld a, $01
	scall PlayMusic
	ld hl, $00fd
	scall PrintTextWithNPCName
	ld bc, Data_b2269
	ld e, $2c
	ld a, $03
	scall MovePerson
	ld bc, Data_b225d
	ld e, $2c
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld c, $09
	ld e, $0c
	ld a, $01
	scall Func_80080
	ld bc, Data_b2253
	ld e, $2c
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $03
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $04
	scall SetPersonVisibilityState
	ld e, $00
	ld a, $05
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $0b
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	ld a, $0a
	scall FadeOutAudio
	xor a
	scall PlayMusic
	xor a
.asm_b2383:
	cp $0a
	jp nc, .asm_b2395
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b2383
.asm_b2395:
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0113
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_b226d
	ld e, $2c
	ld a, $0b
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $0b
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $03
	ld a, $0b
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $0b
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_b2271
	ld e, $2c
	ld a, $0b
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $0b
	scall SetPersonVisibilityState
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b23fc:
	cp $0a
	jp nc, .asm_b240d
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b23fc
.asm_b240d:
	ld a, $01
	scall FadeInAudio
	ld a, $07
	scall PlayMusic
	ret

Emotes_b2418:: ; b2418
	dw $0, $0
	emote_header Emotes_b2418, GFX_b2440, $3e2
	emote_header Emotes_b2418, GFX_b2720, $3f2
	emote_header Emotes_b2418, GFX_b2a29, $332
	emote_header Emotes_b2418, GFX_b2b7a, $342
	emote_header Emotes_b2418, GFX_b2d1b, $382
	emote_header Emotes_b2418, GFX_b2f5c, $3e2
	emote_header Emotes_b2418, GFX_b31f3, $202
	emote_header Emotes_b2418, GFX_b32dd, $1f2
	emote_header Emotes_b2418, GFX_b348c, $222

GFX_b2440:: INCBIN "gfx/emotes/emote_b2440.emote.rz"
GFX_b2720:: INCBIN "gfx/emotes/emote_b2720.emote.rz"
GFX_b2a29:: INCBIN "gfx/emotes/emote_b2a29.emote.rz"
GFX_b2b7a:: INCBIN "gfx/emotes/emote_b2b7a.emote.rz"
GFX_b2d1b:: INCBIN "gfx/emotes/emote_b2d1b.emote.rz"
GFX_b2f5c:: INCBIN "gfx/emotes/emote_b2f5c.emote.rz"
GFX_b31f3:: INCBIN "gfx/emotes/emote_b31f3.emote.rz"
GFX_b32dd:: INCBIN "gfx/emotes/emote_b32dd.emote.rz"
GFX_b348c:: INCBIN "gfx/emotes/emote_b348c.emote.rz"

EmoteAttrs_b3607:: ; b3607
	dw $0, $0
	emote_header EmoteAttrs_b3607, Data_b3633, $367
	emote_header EmoteAttrs_b3607, Data_b376f, $352
	emote_header EmoteAttrs_b3607, Data_b3884, $8f8
	emote_header EmoteAttrs_b3607, Data_b39da, $b25
	emote_header EmoteAttrs_b3607, Data_b3c0b, $278
	emote_header EmoteAttrs_b3607, Data_b3cd5, $ac
	emote_header EmoteAttrs_b3607, Data_b3d24, $2f9
	emote_header EmoteAttrs_b3607, Data_b3e2b, $148
	emote_header EmoteAttrs_b3607, Data_b3ecb, $111
	emote_header EmoteAttrs_b3607, Data_b3f35, $18c

Data_b3633: INCBIN "gfx/emotes/emote_b3633.emoteattrs.rz" ; b3633
Data_b376f: INCBIN "gfx/emotes/emote_b376f.emoteattrs.rz" ; b376f
Data_b3884: INCBIN "gfx/emotes/emote_b3884.emoteattrs.rz" ; b3884
Data_b39da: INCBIN "gfx/emotes/emote_b39da.emoteattrs.rz" ; b39da
Data_b3c0b: INCBIN "gfx/emotes/emote_b3c0b.emoteattrs.rz" ; b3c0b
Data_b3cd5: INCBIN "gfx/emotes/emote_b3cd5.emoteattrs.rz" ; b3cd5
Data_b3d24: INCBIN "gfx/emotes/emote_b3d24.emoteattrs.rz" ; b3d24
Data_b3e2b: INCBIN "gfx/emotes/emote_b3e2b.emoteattrs.rz" ; b3e2b
Data_b3ecb: INCBIN "gfx/emotes/emote_b3ecb.emoteattrs.rz" ; b3ecb
Data_b3f35: INCBIN "gfx/emotes/emote_b3f35.emoteattrs.rz" ; b3f35


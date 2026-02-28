INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2e", ROMX
	script_library 2e

Data_b90b4:
	warpdef $01, $05, $02, $01, MAP_01_00, $1d, $0c, $1d, $0d, $34
	warpdef $01, $05, $02, $01, MAP_01_00, $1d, $12, $1d, $13, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $09, $09, $09, $0a, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $07, $0d, $07, $0e, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $05, $11, $05, $12, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $11, $09, $11, $0a, $34
	warpdef $01, $05, $02, $01, MAP_03_00, $17, $13, $17, $14, $34
	warpdef $01, $05, $02, $01, MAP_20_00, $14, $09, $14, $0a, $34
	warpdef $01, $05, $02, $01, MAP_20_00, $14, $0c, $14, $0d, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $19, $06, $19, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $1d, $06, $1d, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $21, $06, $21, $07, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $08, $10, $08, $11, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $0c, $10, $0c, $11, $34
	warpdef $01, $05, $02, $01, MAP_23_00, $10, $10, $10, $11, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $17, $11, $17, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $1b, $11, $1b, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $1f, $11, $1f, $12, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $06, $1b, $06, $1c, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $0a, $1b, $0a, $1c, $34
	warpdef $01, $05, $02, $01, MAP_24_00, $0e, $1b, $0e, $1c, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $0f, $0d, $0f, $0e, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $13, $11, $13, $12, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $1b, $10, $1b, $11, $34
	warpdef $01, $05, $02, $01, MAP_11_00, $1c, $0b, $1c, $0c, $34

Data_b91c7:
	dw $195
	dw -1

Data_b91cb:
	dw $19c
	dw -1

Data_b91cf:
	dw $1cb
	dw -1

Data_b91d3:
	dw $1cd
	dw -1

Data_b91d7:
	dw $39a
	dw -1

Data_b91db:
	dw $1ce
	dw -1

Data_b91df:
	dw $1cc
	dw -1

Data_b91e3:
	dw $1eb
	dw -1

Data_b91e7:
	dw $1ee
	dw -1

Data_b91eb:
	dw $1fd
	dw -1

Data_b91ef:
	dw $200
	dw -1

Data_b91f3:
	dw $1fc
	dw -1

Data_b91f7:
	dw $1fb
	dw -1

Data_b91fb:
	dw $107
	dw -1

Data_b91ff:
	dw $209
	dw -1

Data_b9203:
	dw $204
	dw -1

Data_b9207:
	dw $207
	dw -1

Data_b920b:
	dw $212
	dw -1

Data_b920f:
	dw $206
	dw -1

Data_b9213:
	dw $3a7
	dw -1

Data_b9217:
	dw $328
	dw -1

Data_b921b:
	dw $3a4
	dw -1

Data_b921f:
	dw $3f8
	dw -1

Data_b9223:
	dw $3a5
	dw -1

Data_b9227:
	dw $196
	dw -1

Data_b922b:
	dw $19d
	dw -1

Data_b922f:
	person_event $06, $04, $01, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b91c7

Data_b923d:
	person_event $04, $04, $05, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91cb

Data_b924b:
	person_event $05, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91cf

Data_b9259:
	person_event $00, $04, $04, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91d3

Data_b9267:
	person_event $1e, $04, $06, $04, $01, $01, $03, $04, $00, Func_808fc_2e, Data_b91d7

Data_b9275:
	person_event $06, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91db

Data_b9283:
	person_event $04, $04, $06, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91df

Data_b9291:
	person_event $10, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91e3

Data_b929f:
	person_event $02, $04, $01, $03, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91e7

Data_b92ad:
	person_event $0c, $04, $02, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91eb

Data_b92bb:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b91ef

Data_b92c9:
	person_event $00, $04, $06, $05, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91f3

Data_b92d7:
	person_event $01, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b91f7

Data_b92e5:
	person_event $07, $0c, $03, $02, $01, $01, $02, $04, $00, Func_808fc_2e, Data_b91fb
	person_event $02, $0c, $06, $03, $01, $01, $01, $04, $00, NULL, NULL

Data_b9301:
	person_event $0c, $04, $02, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b91ff

Data_b930f:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9203

Data_b931d:
	person_event $26, $04, $07, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9207

Data_b932b:
	person_event $01, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b920b

Data_b9339:
	person_event $03, $04, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b920f

Data_b9347:
	person_event $07, $04, $02, $04, $01, $01, $01, $04, $00, Func_808fc_2e, Data_b9213

Data_b9355:
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9217

Data_b9363:
	person_event $03, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b921b

Data_b9371:
	person_event $12, $04, $06, $04, $01, $01, $02, $04, $00, Func_808fc_2e, Data_b921f

Data_b937f:
	person_event $0a, $04, $00, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9223

Data_b938d:
	map MAP_01_00
	db $1d, $0c
	map MAP_01_00
	db $1d, $12
	map MAP_03_00
	db $09, $09
	map MAP_03_00
	db $07, $0d
	map MAP_03_00
	db $05, $11
	map MAP_03_00
	db $11, $09
	map MAP_03_00
	db $17, $13
	map MAP_20_00
	db $14, $09
	map MAP_20_00
	db $14, $0c
	map MAP_23_00
	db $19, $06
	map MAP_23_00
	db $1d, $06
	map MAP_23_00
	db $21, $06
	map MAP_23_00
	db $08, $10
	map MAP_23_00
	db $0c, $10
	map MAP_23_00
	db $10, $10
	map MAP_24_00
	db $17, $11
	map MAP_24_00
	db $1b, $11
	map MAP_24_00
	db $1f, $11
	map MAP_24_00
	db $06, $1b
	map MAP_24_00
	db $0a, $1b
	map MAP_24_00
	db $0e, $1b
	map MAP_11_00
	db $0f, $0d
	map MAP_11_00
	db $13, $11
	map MAP_11_00
	db $1b, $10
	map MAP_11_00
	db $1c, $0b

Func_b93f1:: ; b93f1
	ld c, $00
.asm_b93f3:
	ld a, c
	cp $19
	jp nc, .asm_b945b
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b938d
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_b9457
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b938d
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_b9457
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b938d
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_b9457
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b938d
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_b9457
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
	ld de, Data_b90b4
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_b945b
.asm_b9457:
	inc c
	jp .asm_b93f3
.asm_b945b:
	ld a, [wBackupMapGroup]
	cp $01
	jp nz, .asm_b94cc
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b94cc
	ld a, [wBackupMapX]
	cp $1d
	jp nz, .asm_b949b
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b949b
	ld e, $01
	ld hl, Data_b922f
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9498
	ld a, [wc790]
	cp $04
	jp nz, .asm_b9498
	ld de, Data_b9227
	xor a
	scall SetPersonTextPointer
.asm_b9498:
	jp .asm_b94c9
.asm_b949b:
	ld a, [wBackupMapX]
	cp $1d
	jp nz, .asm_b94c9
	ld a, [wBackupMapY]
	cp $12
	jp nz, .asm_b94c9
	ld e, $01
	ld hl, Data_b923d
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b94c9
	ld a, [wc790]
	cp $04
	jp nz, .asm_b94c9
	ld de, Data_b922b
	xor a
	scall SetPersonTextPointer
.asm_b94c9:
	jp .asm_b975a
.asm_b94cc:
	ld a, [wBackupMapGroup]
	cp $03
	jp nz, .asm_b9571
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9571
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_b94f6
	ld a, [wBackupMapY]
	cp $09
	jp nz, .asm_b94f6
	ld e, $01
	ld hl, Data_b924b
	scall LoadMapObjects
	jp .asm_b956e
.asm_b94f6:
	ld a, [wBackupMapX]
	cp $07
	jp nz, .asm_b9511
	ld a, [wBackupMapY]
	cp $0d
	jp nz, .asm_b9511
	ld e, $01
	ld hl, Data_b9259
	scall LoadMapObjects
	jp .asm_b956e
.asm_b9511:
	ld a, [wBackupMapX]
	cp $05
	jp nz, .asm_b953b
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_b953b
	ld a, [wc790]
	or a
	jp z, .asm_b9538
	ld a, [wc790]
	cp $07
	jp nc, .asm_b9538
	ld e, $01
	ld hl, Data_b9267
	scall LoadMapObjects
.asm_b9538:
	jp .asm_b956e
.asm_b953b:
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_b9556
	ld a, [wBackupMapY]
	cp $09
	jp nz, .asm_b9556
	ld e, $01
	ld hl, Data_b9275
	scall LoadMapObjects
	jp .asm_b956e
.asm_b9556:
	ld a, [wBackupMapX]
	cp $17
	jp nz, .asm_b956e
	ld a, [wBackupMapY]
	cp $13
	jp nz, .asm_b956e
	ld e, $01
	ld hl, Data_b9283
	scall LoadMapObjects
.asm_b956e:
	jp .asm_b975a
.asm_b9571:
	ld a, [wBackupMapGroup]
	cp $14
	jp nz, .asm_b95b6
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b95b6
	ld a, [wBackupMapX]
	cp $14
	jp nz, .asm_b959b
	ld a, [wBackupMapY]
	cp $09
	jp nz, .asm_b959b
	ld e, $01
	ld hl, Data_b9291
	scall LoadMapObjects
	jp .asm_b95b3
.asm_b959b:
	ld a, [wBackupMapX]
	cp $14
	jp nz, .asm_b95b3
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b95b3
	ld e, $01
	ld hl, Data_b929f
	scall LoadMapObjects
.asm_b95b3:
	jp .asm_b975a
.asm_b95b6:
	ld a, [wBackupMapGroup]
	cp $17
	jp nz, .asm_b964c
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b964c
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_b95e0
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b95e0
	ld e, $01
	ld hl, Data_b92ad
	scall LoadMapObjects
	jp .asm_b9649
.asm_b95e0:
	ld a, [wBackupMapX]
	cp $1d
	jp nz, .asm_b95fb
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b95fb
	ld e, $01
	ld hl, Data_b92bb
	scall LoadMapObjects
	jp .asm_b9649
.asm_b95fb:
	ld a, [wBackupMapX]
	cp $21
	jp nz, .asm_b9616
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b9616
	ld e, $01
	ld hl, Data_b92c9
	scall LoadMapObjects
	jp .asm_b9649
.asm_b9616:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_b9631
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_b9631
	ld e, $01
	ld hl, Data_b92d7
	scall LoadMapObjects
	jp .asm_b9649
.asm_b9631:
	ld a, [wBackupMapX]
	cp $10
	jp nz, .asm_b9649
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_b9649
	ld e, $02
	ld hl, Data_b92e5
	scall LoadMapObjects
.asm_b9649:
	jp .asm_b975a
.asm_b964c:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_b96fd
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b96fd
	ld a, [wBackupMapX]
	cp $17
	jp nz, .asm_b9676
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_b9676
	ld e, $01
	ld hl, Data_b9301
	scall LoadMapObjects
	jp .asm_b96fa
.asm_b9676:
	ld a, [wBackupMapX]
	cp $1b
	jp nz, .asm_b9691
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_b9691
	ld e, $01
	ld hl, Data_b930f
	scall LoadMapObjects
	jp .asm_b96fa
.asm_b9691:
	ld a, [wBackupMapX]
	cp $1f
	jp nz, .asm_b96ac
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_b96ac
	ld e, $01
	ld hl, Data_b931d
	scall LoadMapObjects
	jp .asm_b96fa
.asm_b96ac:
	ld a, [wBackupMapX]
	cp $06
	jp nz, .asm_b96c7
	ld a, [wBackupMapY]
	cp $1b
	jp nz, .asm_b96c7
	ld e, $01
	ld hl, Data_b932b
	scall LoadMapObjects
	jp .asm_b96fa
.asm_b96c7:
	ld a, [wBackupMapX]
	cp $0a
	jp nz, .asm_b96e2
	ld a, [wBackupMapY]
	cp $1b
	jp nz, .asm_b96e2
	ld e, $01
	ld hl, Data_b9339
	scall LoadMapObjects
	jp .asm_b96fa
.asm_b96e2:
	ld a, [wBackupMapX]
	cp $0e
	jp nz, .asm_b96fa
	ld a, [wBackupMapY]
	cp $1b
	jp nz, .asm_b96fa
	ld e, $01
	ld hl, Data_b9347
	scall LoadMapObjects
.asm_b96fa:
	jp .asm_b975a
.asm_b96fd:
	ld a, [wBackupMapGroup]
	cp $0b
	jp nz, .asm_b975a
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b975a
	ld a, [wBackupMapX]
	cp $0f
	jp nz, .asm_b9727
	ld a, [wBackupMapY]
	cp $0d
	jp nz, .asm_b9727
	ld e, $01
	ld hl, Data_b9363
	scall LoadMapObjects
	jp .asm_b975a
.asm_b9727:
	ld a, [wBackupMapX]
	cp $13
	jp nz, .asm_b9742
	ld a, [wBackupMapY]
	cp $11
	jp nz, .asm_b9742
	ld e, $01
	ld hl, Data_b9371
	scall LoadMapObjects
	jp .asm_b975a
.asm_b9742:
	ld a, [wBackupMapX]
	cp $1b
	jp nz, .asm_b975a
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_b975a
	ld e, $01
	ld hl, Data_b937f
	scall LoadMapObjects
.asm_b975a:
	ld e, $01
	ld hl, Data_b9355
	scall LoadMapObjects
	ld a, [wBackupMapX]
	cp $10
	jp nz, .asm_b979a
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_b979a
	ld hl, $002d
	scall CheckEventFlag
	or a
	jp nz, .asm_b978d
	scall Func_8001c
	call Func_b97c4
	ld e, $01
	ld hl, $002d
	scall EventFlagAction
	jp .asm_b9797
.asm_b978d:
	scall Func_8001c
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_b9797:
	jp .asm_b979d
.asm_b979a:
	scall Func_8001c
.asm_b979d:
	ld a, [wBackupMapGroup]
	cp $17
	jp nz, .asm_b97b4
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b97b4
	ld a, $0a
	scall PlayMusic
	jp .asm_b97b9
.asm_b97b4:
	ld a, $11
	scall PlayMusic
.asm_b97b9:
	ret

Data_b97ba:
	db $05, $05, $02, $05, $ff, $ff

Data_b97c0:
	db $02, $04, $ff, $ff

Func_b97c4:
	ld a, $01
	scall PlayerFace
	ld hl, $0103
	scall PrintTextWithNPCName
	ld e, $01
	xor a
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld hl, $0104
	scall PrintTextWithNPCName
	ld bc, Data_b97ba
	ld e, $2e
	ld a, $01
	scall MovePerson
	scall WaitNPCStep
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld hl, $001e
	scall ScriptSleep
	ld a, $34
	scall PlaySFX
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld e, $01
	ld a, $03
	scall PlayerStep
	ld bc, Data_b97c0
	ld e, $2e
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $03
	xor a
	scall SpriteFace
	ld hl, $0105
	scall PrintTextWithNPCName
	ld a, $2a
	scall PlaySFX
	ld hl, $0106
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $2a
	scall Func_80d4d
	ld e, $01
	ld a, $03
	scall PlayerStep
	ret

Data_b9858:
	warpdef $01, $08, $02, $01, MAP_01_00, $11, $0c, $11, $0d, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $19, $0c, $19, $0d, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $11, $12, $11, $13, $34
	warpdef $01, $08, $02, $01, MAP_01_00, $19, $12, $19, $13, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $08, $06, $08, $07, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $15, $06, $15, $07, $34
	warpdef $01, $08, $02, $01, MAP_17_00, $06, $04, $06, $05, $34
	warpdef $01, $08, $02, $01, MAP_17_00, $0f, $04, $0f, $05, $34
	warpdef $01, $08, $02, $01, MAP_20_00, $06, $06, $06, $07, $34
	warpdef $01, $08, $02, $01, MAP_20_00, $15, $06, $15, $07, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $1e, $0a, $1e, $0b, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $21, $0a, $21, $0b, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $05, $15, $05, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $08, $15, $08, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $11, $15, $11, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $14, $15, $14, $16, $34
	warpdef $01, $08, $02, $01, MAP_25_01, $17, $15, $17, $16, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $08, $13, $08, $14, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $0a, $19, $0a, $1a, $34
	warpdef $01, $08, $02, $01, MAP_29_00, $12, $19, $12, $1a, $34

Data_b9934:
	dw $188
	dw -1

Data_b9938:
	dw $186
	dw -1

Data_b993c:
	dw $17e
	dw -1

Data_b9940:
	dw $184
	dw -1

Data_b9944:
	dw $1d9
	dw -1

Data_b9948:
	dw $02a
	dw -1

Data_b994c:
	dw $02a
	dw -1

Data_b9950:
	dw $1ed
	dw -1

Data_b9954:
	dw $1e9
	dw -1

Data_b9958:
	dw $1ef
	dw -1

Data_b995c:
	dw $1e7
	dw -1

Data_b9960:
	dw $1ea
	dw -1

Data_b9964:
	dw $1b8
	dw -1

Data_b9968:
	dw $1ae
	dw -1

Data_b996c:
	dw $1ad
	dw -1

Data_b9970:
	dw $17b
	dw -1

Data_b9974:
	dw $1af
	dw -1

Data_b9978:
	dw $1b0
	dw -1

Data_b997c:
	dw $1ab
	dw -1

Data_b9980:
	dw $375
	dw -1

Data_b9984:
	dw $1ac
	dw -1

Data_b9988:
	dw $29b
	dw -1

Data_b998c:
	dw $383
	dw -1

Data_b9990:
	dw $386
	dw -1

Data_b9994:
	dw $328
	dw -1

Data_b9998:
	dw $32a
	dw -1

Data_b999c:
	dw $32b
	dw -1

Data_b99a0:
	dw $397
	dw -1

Data_b99a4:
	dw $181
	dw -1

Data_b99a8:
	dw $187
	dw -1

Data_b99ac:
	dw $183
	dw -1

Data_b99b0:
	dw $3b0
	dw -1

Data_b99b4:
	dw $3af
	dw -1

Data_b99b8:
	dw $3b1
	dw -1

Data_b99bc:
	person_event $02, $04, $06, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9934

Data_b99ca:
	person_event $03, $04, $08, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9938

Data_b99d8:
	person_event $00, $04, $03, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b993c

Data_b99e6:
	person_event $06, $04, $07, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9940

Data_b99f4:
	person_event $01, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9944
	person_event $ff, $00, $0a, $07, $01, $02, $01, $04, $01, Func_b9f71, NULL

Data_b9a10:
	person_event $03, $04, $01, $03, $01, $01, $02, $04, $00, Func_b9fad, NULL
	person_event $ff, $00, $0a, $07, $01, $02, $01, $04, $01, Func_b9f8f, NULL

Data_b9a2c:
	person_event $04, $04, $06, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9948

Data_b9a3a:
	person_event $10, $04, $06, $04, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b994c

Data_b9a48:
	person_event $06, $04, $02, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9950
	person_event $02, $04, $09, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9954

Data_b9a64:
	person_event $00, $04, $06, $07, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9958
	person_event $07, $04, $03, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b995c
	person_event $03, $04, $09, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9960

Data_b9a8e:
	person_event $01, $04, $01, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9964
	person_event $00, $04, $0a, $08, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9968

Data_b9aaa:
	person_event $03, $04, $03, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b996c

Data_b9ab8:
	person_event $03, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9970

Data_b9ac6:
	person_event $02, $04, $07, $07, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b9974
	person_event $07, $04, $03, $03, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9978

Data_b9ae2:
	person_event $00, $04, $08, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b997c

Data_b9af0:
	person_event $13, $04, $02, $04, $01, $02, $02, $04, $00, PrintTextFacePlayer_2e, Data_b9980

Data_b9afe:
	person_event $01, $04, $04, $03, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b9984

Data_b9b0c:
	person_event $0e, $04, $07, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9988

Data_b9b1a:
	person_event $02, $04, $01, $03, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_b998c

Data_b9b28:
	person_event $05, $04, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9990
	person_event $04, $04, $08, $07, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_b99a0

Data_b9b44:
	person_event $ff, $00, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9994
	person_event $ff, $00, $07, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b9998
	person_event $ff, $00, $09, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_b999c

Data_b9b6e:
	map MAP_01_00
	db $11, $0c
	map MAP_01_00
	db $19, $0c
	map MAP_01_00
	db $11, $12
	map MAP_01_00
	db $19, $12
	map MAP_06_00
	db $08, $06
	map MAP_06_00
	db $15, $06
	map MAP_17_00
	db $06, $04
	map MAP_17_00
	db $0f, $04
	map MAP_20_00
	db $06, $06
	map MAP_20_00
	db $15, $06
	map MAP_25_01
	db $1e, $0a
	map MAP_25_01
	db $21, $0a
	map MAP_25_01
	db $05, $15
	map MAP_25_01
	db $08, $15
	map MAP_25_01
	db $11, $15
	map MAP_25_01
	db $14, $15
	map MAP_25_01
	db $17, $15
	map MAP_29_00
	db $08, $13
	map MAP_29_00
	db $0a, $19
	map MAP_29_00
	db $12, $19

Func_b9bbe:: ; b9bbe
	ld c, $00
.asm_b9bc0:
	ld a, c
	cp $14
	jp nc, .asm_b9c28
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b9b6e
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_b9c24
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b9b6e
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_b9c24
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b9b6e
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_b9c24
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_b9b6e
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_b9c24
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
	ld de, Data_b9858
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_b9c28
.asm_b9c24:
	inc c
	jp .asm_b9bc0
.asm_b9c28:
	call Func_b9f52
	ld hl, Func_b9f52
	scall Func_80f11
	ld a, [wBackupMapGroup]
	cp $01
	jp nz, .asm_b9cee
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9cee
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_b9c71
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b9c71
	ld e, $01
	ld hl, Data_b99bc
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9c6e
	ld a, [wc790]
	cp $04
	jp nz, .asm_b9c6e
	ld de, Data_b99a4
	xor a
	scall SetPersonTextPointer
.asm_b9c6e:
	jp .asm_b9ceb
.asm_b9c71:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_b9ca2
	ld a, [wBackupMapY]
	cp $0c
	jp nz, .asm_b9ca2
	ld e, $01
	ld hl, Data_b99ca
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9c9f
	ld a, [wc790]
	cp $04
	jp nz, .asm_b9c9f
	ld de, Data_b99a8
	xor a
	scall SetPersonTextPointer
.asm_b9c9f:
	jp .asm_b9ceb
.asm_b9ca2:
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_b9cbd
	ld a, [wBackupMapY]
	cp $12
	jp nz, .asm_b9cbd
	ld e, $01
	ld hl, Data_b99d8
	scall LoadMapObjects
	jp .asm_b9ceb
.asm_b9cbd:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_b9ceb
	ld a, [wBackupMapY]
	cp $12
	jp nz, .asm_b9ceb
	ld e, $01
	ld hl, Data_b99e6
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9ceb
	ld a, [wc790]
	cp $04
	jp nz, .asm_b9ceb
	ld de, Data_b99ac
	xor a
	scall SetPersonTextPointer
.asm_b9ceb:
	jp .asm_b9f35
.asm_b9cee:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_b9d3f
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9d3f
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_b9d1e
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b9d1e
	ld e, $02
	ld hl, Data_b99f4
	scall LoadMapObjects
	call Func_b9f52
	scall Func_80f02
	jp .asm_b9d3c
.asm_b9d1e:
	ld a, [wBackupMapX]
	cp $15
	jp nz, .asm_b9d3c
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b9d3c
	ld e, $02
	ld hl, Data_b9a10
	scall LoadMapObjects
	call Func_b9f52
	scall Func_80f02
.asm_b9d3c:
	jp .asm_b9f35
.asm_b9d3f:
	ld a, [wBackupMapGroup]
	cp $11
	jp nz, .asm_b9d84
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9d84
	ld a, [wBackupMapX]
	cp $06
	jp nz, .asm_b9d69
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_b9d69
	ld e, $01
	ld hl, Data_b9a2c
	scall LoadMapObjects
	jp .asm_b9d81
.asm_b9d69:
	ld a, [wBackupMapX]
	cp $0f
	jp nz, .asm_b9d81
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_b9d81
	ld e, $01
	ld hl, Data_b9a3a
	scall LoadMapObjects
.asm_b9d81:
	jp .asm_b9f35
.asm_b9d84:
	ld a, [wBackupMapGroup]
	cp $14
	jp nz, .asm_b9e0b
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9e0b
	ld a, [wBackupMapX]
	cp $06
	jp nz, .asm_b9dcb
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b9dcb
	ld e, $02
	ld hl, Data_b9a48
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9dc8
	ld a, [wc790]
	cp $05
	jp nc, .asm_b9dc8
	ld de, Data_b99b0
	xor a
	scall SetPersonTextPointer
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_b9dc8:
	jp .asm_b9e08
.asm_b9dcb:
	ld a, [wBackupMapX]
	cp $15
	jp nz, .asm_b9e08
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_b9e08
	ld e, $03
	ld hl, Data_b9a64
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_b9e08
	ld a, [wc790]
	cp $05
	jp nc, .asm_b9e08
	ld de, Data_b99b8
	ld a, $01
	scall SetPersonTextPointer
	ld de, Data_b99b4
	ld a, $02
	scall SetPersonTextPointer
	ld e, $00
	xor a
	scall SetPersonVisibilityState
.asm_b9e08:
	jp .asm_b9f35
.asm_b9e0b:
	ld a, [wBackupMapGroup]
	cp $19
	jp nz, .asm_b9ed8
	ld a, [wBackupMapNumber]
	cp $01
	jp nz, .asm_b9ed8
	ld a, [wBackupMapX]
	cp $1e
	jp nz, .asm_b9e36
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b9e36
	ld e, $02
	ld hl, Data_b9a8e
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9e36:
	ld a, [wBackupMapX]
	cp $21
	jp nz, .asm_b9e51
	ld a, [wBackupMapY]
	cp $0a
	jp nz, .asm_b9e51
	ld e, $01
	ld hl, Data_b9aaa
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9e51:
	ld a, [wBackupMapX]
	cp $05
	jp nz, .asm_b9e6c
	ld a, [wBackupMapY]
	cp $15
	jp nz, .asm_b9e6c
	ld e, $01
	ld hl, Data_b9ab8
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9e6c:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_b9e87
	ld a, [wBackupMapY]
	cp $15
	jp nz, .asm_b9e87
	ld e, $02
	ld hl, Data_b9ac6
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9e87:
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_b9ea2
	ld a, [wBackupMapY]
	cp $15
	jp nz, .asm_b9ea2
	ld e, $01
	ld hl, Data_b9ae2
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9ea2:
	ld a, [wBackupMapX]
	cp $14
	jp nz, .asm_b9ebd
	ld a, [wBackupMapY]
	cp $15
	jp nz, .asm_b9ebd
	ld e, $01
	ld hl, Data_b9afe
	scall LoadMapObjects
	jp .asm_b9ed5
.asm_b9ebd:
	ld a, [wBackupMapX]
	cp $17
	jp nz, .asm_b9ed5
	ld a, [wBackupMapY]
	cp $15
	jp nz, .asm_b9ed5
	ld e, $01
	ld hl, Data_b9af0
	scall LoadMapObjects
.asm_b9ed5:
	jp .asm_b9f35
.asm_b9ed8:
	ld a, [wBackupMapGroup]
	cp $1d
	jp nz, .asm_b9f35
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9f35
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_b9f02
	ld a, [wBackupMapY]
	cp $13
	jp nz, .asm_b9f02
	ld e, $01
	ld hl, Data_b9b0c
	scall LoadMapObjects
	jp .asm_b9f35
.asm_b9f02:
	ld a, [wBackupMapX]
	cp $0a
	jp nz, .asm_b9f1d
	ld a, [wBackupMapY]
	cp $19
	jp nz, .asm_b9f1d
	ld e, $01
	ld hl, Data_b9b1a
	scall LoadMapObjects
	jp .asm_b9f35
.asm_b9f1d:
	ld a, [wBackupMapX]
	cp $12
	jp nz, .asm_b9f35
	ld a, [wBackupMapY]
	cp $19
	jp nz, .asm_b9f35
	ld e, $02
	ld hl, Data_b9b28
	scall LoadMapObjects
.asm_b9f35:
	ld e, $03
	ld hl, Data_b9b44
	scall LoadMapObjects
	scall Func_8001c
	ld a, $11
	scall PlayMusic
	ret

Data_b9f46:
	db $01, $08, $01, $01, $0a, $07

Data_b9f4c:
	db $01, $08, $01, $01, $0a, $08

Func_b9f52:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_b9f70
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b9f70
	ld hl, Data_b9f46
	scall Func_80d9b
	ld hl, Data_b9f4c
	scall Func_80d9b
	scall Func_80f02
.asm_b9f70:
	ret

Func_b9f71:
	ld a, e
	cp $02
	jp nz, .asm_b9f8e
	ld a, $2e
	scall PlaySFX
	ld l, $05
	push hl
	ld c, $0a
	ld e, $00
	ld a, $06
	scall Func_80dff
	pop bc
	ld a, $01
	ld [wPlayerFacing], a
.asm_b9f8e:
	ret

Func_b9f8f:
	ld a, e
	cp $02
	jp nz, .asm_b9fac
	ld l, $05
	push hl
	ld c, $17
	ld e, $00
	ld a, $06
	scall Func_80dff
	pop bc
	ld a, $2e
	scall PlaySFX
	ld a, $01
	ld [wPlayerFacing], a
.asm_b9fac:
	ret

Func_b9fad:
	push af
	ld a, e
	or a
	jp nz, .asm_ba023
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld a, [wc790]
	or a
	jp z, .asm_b9fd1
	ld a, [wc790]
	cp $06
	jp nc, .asm_b9fd1
	ld hl, $0454
	scall PrintTextStandard
	jp .asm_ba023
.asm_b9fd1:
	ld hl, $00e9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_b9ff7
	ld hl, $00eb
	scall CheckEventFlag
	or a
	jp nz, .asm_b9ff7
	ld hl, $0452
	scall PrintTextStandard
	ld e, $01
	ld hl, $00eb
	scall EventFlagAction
	jp .asm_ba023
.asm_b9ff7:
	ld hl, $00ea
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ba01d
	ld hl, $00eb
	scall CheckEventFlag
	or a
	jp nz, .asm_ba01d
	ld hl, $0453
	scall PrintTextStandard
	ld e, $01
	ld hl, $00eb
	scall EventFlagAction
	jp .asm_ba023
.asm_ba01d:
	ld hl, $0455
	scall PrintTextStandard
.asm_ba023:
	pop bc
	ret

Data_ba025:
	warpdef $01, $0a, $02, $01, MAP_00_00, $09, $07, $09, $08, $34
	warpdef $01, $0a, $02, $01, MAP_01_00, $11, $06, $11, $07, $34
	warpdef $01, $0a, $02, $01, MAP_01_00, $19, $06, $19, $07, $34
	warpdef $01, $0a, $02, $01, MAP_06_00, $0e, $12, $0e, $13, $34
	warpdef $01, $0a, $02, $01, MAP_06_00, $1c, $0e, $1c, $0f, $34
	warpdef $01, $0a, $02, $01, MAP_23_00, $0b, $05, $0b, $06, $34
	warpdef $01, $0a, $02, $01, MAP_23_00, $20, $0e, $20, $0f, $34
	warpdef $01, $0a, $02, $01, MAP_24_00, $09, $10, $09, $11, $34
	warpdef $01, $0a, $02, $01, MAP_24_00, $1e, $19, $1e, $1a, $34

Data_ba088:
	db $66, $07, $02, $11, $2b
	db $67, $09, $02, $11, $2d

Data_ba092:
	db $68, $07, $02, $11, $2b
	db $69, $09, $02, $11, $2e

Data_ba09c:
	dw $412
	dw -1

Data_ba0a0:
	dw $199
	dw -1

Data_ba0a4:
	dw $191
	dw -1

Data_ba0a8:
	dw $1dc
	dw -1

Data_ba0ac:
	dw $1d6
	dw -1

Data_ba0b0:
	dw $1fa
	dw -1

Data_ba0b4:
	dw $1f8
	dw -1

Data_ba0b8:
	dw $213
	dw -1

Data_ba0bc:
	dw $20c
	dw -1

Data_ba0c0:
	dw $19b
	dw -1

Data_ba0c4:
	dw $193
	dw -1

Data_ba0c8:
	dw $1db
	dw -1

Data_ba0cc:
	dw $1da
	dw -1

Data_ba0d0:
	dw $1d7
	dw -1

Data_ba0d4:
	dw $1fe
	dw -1

Data_ba0d8:
	dw $1f9
	dw -1

Data_ba0dc:
	dw $214
	dw -1

Data_ba0e0:
	dw $20d
	dw -1

Data_ba0e4:
	dw $32b
	dw -1

Data_ba0e8:
	dw $328
	dw -1

Data_ba0ec:
	dw $329
	dw -1

Data_ba0f0:
	dw $19a
	dw -1

Data_ba0f4:
	dw $192
	dw -1

Data_ba0f8:
	dw $194
	dw -1

Data_ba0fc:
	dw $41d
	dw -1

Data_ba100:
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba09c
	person_event $02, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0fc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba162:
	person_event $03, $04, $0d, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0a0
	person_event $06, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba1c4:
	person_event $03, $04, $05, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0a4
	person_event $0a, $04, $0a, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0c4
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba226:
	person_event $00, $04, $0b, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0a8
	person_event $07, $04, $05, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0c8
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba288:
	person_event $02, $04, $01, $08, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ac
	person_event $05, $04, $09, $05, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0cc
	person_event $06, $04, $0d, $09, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba2f8:
	person_event $0e, $04, $01, $08, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0b0
	person_event $02, $04, $0c, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0d4
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba33e:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0b4
	person_event $03, $04, $09, $05, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba0d8
	person_event $ff, $00, $03, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $04, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba384:
	person_event $0e, $04, $01, $08, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba0b8
	person_event $02, $04, $04, $08, $01, $01, $03, $04, $00, PrintTextFacePlayer_2e, Data_ba0dc
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec

Data_ba3e6:
	person_event $05, $04, $02, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0bc
	person_event $03, $04, $01, $03, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e0
	person_event $ff, $00, $03, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0ec
	person_event $ff, $00, $04, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $07, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4
	person_event $ff, $00, $09, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba0e4

Data_ba448:
	map MAP_00_00
	db $09, $07

	map MAP_01_00
	db $11, $06

	map MAP_01_00
	db $19, $06

	map MAP_06_00
	db $0e, $12

	map MAP_06_00
	db $1c, $0e

	map MAP_23_00
	db $0b, $05

	map MAP_23_00
	db $20, $0e

	map MAP_24_00
	db $09, $10

	map MAP_24_00
	db $1e, $19

Func_ba46c:: ; ba46c
	ld c, $00
.asm_ba46e:
	ld a, c
	cp $09
	jp nc, .asm_ba4d6
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_ba4d2
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_ba448
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_ba4d2
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
	ld de, Data_ba025
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_ba4d6
.asm_ba4d2:
	inc c
	jp .asm_ba46e
.asm_ba4d6:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_ba4ff
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba4ff
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_ba4fc
	ld a, [wBackupMapY]
	cp $07
	jp nz, .asm_ba4fc
	ld e, $07
	ld hl, Data_ba100
	scall LoadMapObjects
.asm_ba4fc:
	jp .asm_ba654
.asm_ba4ff:
	ld a, [wBackupMapGroup]
	cp $01
	jp nz, .asm_ba578
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba578
	ld a, [wBackupMapX]
	cp $11
	jp nz, .asm_ba53f
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_ba53f
	ld e, $07
	ld hl, Data_ba162
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_ba53c
	ld a, [wc790]
	cp $04
	jp nz, .asm_ba53c
	ld de, Data_ba0f0
	xor a
	scall SetPersonTextPointer
.asm_ba53c:
	jp .asm_ba575
.asm_ba53f:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_ba575
	ld a, [wBackupMapY]
	cp $06
	jp nz, .asm_ba575
	ld e, $07
	ld hl, Data_ba1c4
	scall LoadMapObjects
	ld a, [wc790]
	or a
	jp z, .asm_ba575
	ld a, [wc790]
	cp $04
	jp nz, .asm_ba575
	ld de, Data_ba0f4
	xor a
	scall SetPersonTextPointer
	ld de, Data_ba0f8
	ld a, $01
	scall SetPersonTextPointer
.asm_ba575:
	jp .asm_ba654
.asm_ba578:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_ba5bd
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba5bd
	ld a, [wBackupMapX]
	cp $0e
	jp nz, .asm_ba5a2
	ld a, [wBackupMapY]
	cp $12
	jp nz, .asm_ba5a2
	ld e, $07
	ld hl, Data_ba226
	scall LoadMapObjects
	jp .asm_ba5ba
.asm_ba5a2:
	ld a, [wBackupMapX]
	cp $1c
	jp nz, .asm_ba5ba
	ld a, [wBackupMapY]
	cp $0e
	jp nz, .asm_ba5ba
	ld e, $08
	ld hl, Data_ba288
	scall LoadMapObjects
.asm_ba5ba:
	jp .asm_ba654
.asm_ba5bd:
	ld a, [wBackupMapGroup]
	cp $17
	jp nz, .asm_ba612
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba612
	ld a, [wBackupMapX]
	cp $0b
	jp nz, .asm_ba5ef
	ld a, [wBackupMapY]
	cp $05
	jp nz, .asm_ba5ef
	ld e, $05
	ld hl, Data_ba2f8
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ba088
	scall Func_80ce7
	jp .asm_ba60f
.asm_ba5ef:
	ld a, [wBackupMapX]
	cp $20
	jp nz, .asm_ba60f
	ld a, [wBackupMapY]
	cp $0e
	jp nz, .asm_ba60f
	ld e, $05
	ld hl, Data_ba33e
	scall LoadMapObjects
	ld e, $02
	ld hl, Data_ba092
	scall Func_80ce7
.asm_ba60f:
	jp .asm_ba654
.asm_ba612:
	ld a, [wBackupMapGroup]
	cp $18
	jp nz, .asm_ba654
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_ba654
	ld a, [wBackupMapX]
	cp $09
	jp nz, .asm_ba63c
	ld a, [wBackupMapY]
	cp $10
	jp nz, .asm_ba63c
	ld e, $07
	ld hl, Data_ba384
	scall LoadMapObjects
	jp .asm_ba654
.asm_ba63c:
	ld a, [wBackupMapX]
	cp $1e
	jp nz, .asm_ba654
	ld a, [wBackupMapY]
	cp $19
	jp nz, .asm_ba654
	ld e, $07
	ld hl, Data_ba3e6
	scall LoadMapObjects
.asm_ba654:
	scall Func_8001c
	ld a, $11
	scall PlayMusic
	ret

Data_ba65d:
	db $00, $02, $0a, $0a, $0f, $0f, $19, $7f, $04, $17, $00, $03, $0a, $00

Data_ba66b:
	db $65, $00, $ff, $ff

Data_ba66f:
	db $66, $00, $ff, $ff

Data_ba673:
	db $67, $00, $ff, $ff

Data_ba677:
	db $68, $00, $ff, $ff

Data_ba67b:
	db $6a, $00, $ff, $ff

Data_ba67f:
	db $6c, $00, $ff, $ff

Data_ba683:
	db $6d, $00, $ff, $ff

Data_ba687:
	db $63, $03, $ff, $ff

Data_ba68b:
	db $b4, $01, $ff, $ff

Data_ba68f:
	db $46, $03, $ff, $ff

Data_ba693:
	db $7a, $03, $ff, $ff

Data_ba697:
	db $78, $03, $ff, $ff

Data_ba69b:
	db $29, $03, $ff, $ff

Data_ba69f:
	db $8e, $03, $ff, $ff

Data_ba6a3:
	db $83, $02, $ff, $ff

Data_ba6a7:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, Func_baa60, NULL
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, Func_babdc, NULL
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, Func_baefe, NULL

Data_ba6d1:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_badb0, NULL

Data_ba6df:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_bae5a, NULL

Data_ba6ed:
	person_event $00, $0c, $01, $04, $01, $01, $00, $04, $00, Func_baeb6, NULL

Data_ba6fb:
	person_event $01, $0c, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba66b

Data_ba709:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba66f

Data_ba717:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba673

Data_ba725:
	person_event $01, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba677

Data_ba733:
	person_event $0b, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67b

Data_ba741:
	person_event $04, $0c, $06, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba67f

Data_ba74f:
	person_event $05, $0c, $01, $04, $01, $01, $01, $04, $00, PrintTextFacePlayer_2e, Data_ba683

Data_ba75d:
	person_event $16, $0c, $06, $02, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba687

Data_ba76b:
	person_event $02, $0c, $05, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68b

Data_ba779:
	person_event $0a, $0c, $02, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba68f

Data_ba787:
	person_event $09, $0c, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba693

Data_ba795:
	person_event $00, $0c, $01, $04, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_ba697

Data_ba7a3:
	person_event $ff, $00, $00, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69b
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba69f

Data_ba7bf:
	person_event $ff, $00, $04, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $03, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_ba6a3
	person_event $ff, $00, $05, $02, $01, $01, $00, $04, $00, $6efe, NULL

Func_ba7e9:: ; ba7e9
	ld e, $00
	ld hl, $00fb
	scall EventFlagAction
	call Func_bb0b0
	ld hl, Func_bb0b0
	scall Func_80f11
	ld e, $02
	ld hl, Data_ba7a3
	scall LoadMapObjects
	ld a, $11
	scall PlayMusic
	ld a, [wc790]
	or a
	jp z, .asm_ba839
	ld a, [wc790]
	cp $07
	jp nc, .asm_ba839
	ld e, $03
	ld hl, Data_ba7bf
	scall LoadMapObjects
	ld a, $01
	scall Func_80d01
	ld e, $01
	ld hl, Data_ba65d
	scall LoadEncounters
	call Func_bafd6
	ld a, $11
	scall PlayMusic
	scall Func_8001c
	jp .asm_baa5f
.asm_ba839:
	ld e, $03
	ld hl, Data_ba6a7
	scall LoadMapObjects
	ld a, [wc78a]
	cp $0f
	jp z, .asm_baa4a
	cp $0e
	jp z, .asm_baa2a
	cp $0d
	jp z, .asm_baa0a
	cp $0c
	jp z, .asm_ba9f0
	cp $0b
	jp z, .asm_ba9bd
	cp $0a
	jp z, .asm_ba99d
	cp $09
	jp z, .asm_ba97d
	cp $08
	jp z, .asm_ba95d
	cp $07
	jp z, .asm_ba943
	cp $06
	jp z, .asm_ba929
	cp $05
	jp z, .asm_ba8f6
	cp $04
	jp z, .asm_ba8c4
	cp $03
	jp z, .asm_ba8b2
	cp $01
	jp z, .asm_ba898
	or a
	jp nz, .asm_baa5c
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
.asm_ba898:
	ld e, $01
	ld hl, Data_ba75d
	scall LoadMapObjects
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8b2:
	ld a, $04
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8c4:
	ld e, $01
	ld hl, Data_ba6fb
	scall LoadMapObjects
	ld hl, $0052
	scall CheckEventFlag
	or a
	jp nz, .asm_ba8de
	ld e, $01
	ld hl, Data_ba6d1
	scall LoadMapObjects
.asm_ba8de:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cb
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba8f6:
	ld e, $01
	ld hl, Data_ba709
	scall LoadMapObjects
	ld hl, $0052
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ba911
	ld e, $01
	ld hl, Data_ba6df
	scall LoadMapObjects
.asm_ba911:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cc
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba929:
	ld e, $01
	ld hl, Data_ba76b
	scall LoadMapObjects
	ld a, $01
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba943:
	ld e, $01
	ld hl, Data_ba779
	scall LoadMapObjects
	ld a, $02
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_ba95d:
	ld e, $01
	ld hl, Data_ba717
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02cd
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba97d:
	ld e, $01
	ld hl, Data_ba725
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02ce
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba99d:
	ld e, $01
	ld hl, Data_ba733
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d2
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9bd:
	ld e, $01
	ld hl, Data_ba741
	scall LoadMapObjects
	ld hl, $00ed
	scall CheckEventFlag
	cp $01
	jp nz, .asm_ba9d8
	ld e, $01
	ld hl, Data_ba6ed
	scall LoadMapObjects
.asm_ba9d8:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d3
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_ba9f0:
	ld e, $01
	ld hl, Data_ba787
	scall LoadMapObjects
	ld a, $0d
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa0a:
	ld e, $01
	ld hl, Data_ba795
	scall LoadMapObjects
	ld a, $08
	ld [wc7e2], a
	xor a
	scall Func_80653
	call Func_bb0b0
	scall Func_80f02
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa2a:
	ld e, $01
	ld hl, Data_ba74f
	scall LoadMapObjects
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	ld hl, $02d4
	scall LandmarkSign
	call Func_bad5c
	jp .asm_baa5f
.asm_baa4a:
	ld a, $03
	ld [wc7e2], a
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_bad5c
	jp .asm_baa5f
.asm_baa5c:
	scall Func_8001c
.asm_baa5f:
	ret

Func_baa60:
	ld a, e
	or a
	jp nz, .asm_babdb
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_baa79
	ld hl, $0283
	scall PrintTextStandard
	jp .asm_babdb
.asm_baa79:
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_baa83
	jp .asm_babdb
.asm_baa83:
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
	ld e, $00
	ld hl, $00fa
	scall EventFlagAction
	ld a, [wc78a]
	cp $0e
	jp z, .asm_babc9
	cp $0d
	jp z, .asm_babb4
	cp $0c
	jp z, .asm_bab9f
	cp $0b
	jp z, .asm_bab8a
	cp $0a
	jp z, .asm_bab75
	cp $09
	jp z, .asm_bab60
	cp $08
	jp z, .asm_bab4b
	cp $07
	jp z, .asm_bab36
	cp $06
	jp z, .asm_bab21
	cp $05
	jp z, .asm_bab0c
	cp $04
	jp z, .asm_baaf7
	cp $01
	jp nz, .asm_babdb
	ld a, $02
	ld [wc78a], a
	ld l, $0c
	push hl
	ld c, $09
	ld e, $14
	ld a, $05
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_baaf7:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab0c:
	ld a, $06
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab21:
	ld a, $07
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab36:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab4b:
	ld a, $09
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab60:
	ld a, $0a
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab75:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab8a:
	ld a, $0c
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_bab9f:
	ld a, $0d
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_babb4:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_babdb
.asm_babc9:
	ld a, $0f
	ld [wc78a], a
	ld l, $04
	push hl
	ld c, $0c
	ld e, $01
	ld a, $04
	scall Func_80dff
	pop bc
.asm_babdb:
	ret

Func_babdc:
	ld a, e
	or a
	jp nz, .asm_bad5b
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_babeb
	jp .asm_bad5b
.asm_babeb:
	ld hl, $0059
	scall CheckEventFlag
	cp $01
	jp nz, .asm_babff
	ld hl, $0283
	scall PrintTextStandard
	jp .asm_bad5b
.asm_babff:
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
	ld e, $00
	ld hl, $00fa
	scall EventFlagAction
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bad49
	cp $0d
	jp z, .asm_bad34
	cp $0c
	jp z, .asm_bad1f
	cp $0b
	jp z, .asm_bad0a
	cp $0a
	jp z, .asm_bacf5
	cp $09
	jp z, .asm_bace0
	cp $08
	jp z, .asm_baccb
	cp $07
	jp z, .asm_bacb6
	cp $06
	jp z, .asm_baca1
	cp $05
	jp z, .asm_bac8c
	cp $04
	jp z, .asm_bac77
	cp $01
	jp nz, .asm_bad5b
	xor a
	scall PlayerFace
	ld l, $10
	push hl
	ld c, $09
	ld e, $15
	ld a, $05
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bac77:
	ld a, $03
	ld [wc78a], a
	ld l, $0f
	push hl
	ld c, $16
	ld e, $0c
	ld a, $03
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bac8c:
	ld a, $08
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_baca1:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bacb6:
	ld a, $06
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_baccb:
	ld a, $05
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bace0:
	ld a, $08
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bacf5:
	ld a, $09
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad0a:
	ld a, $0e
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad1f:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad34:
	ld a, $0c
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
	jp .asm_bad5b
.asm_bad49:
	ld a, $0b
	ld [wc78a], a
	ld l, $03
	push hl
	ld c, $03
	ld e, $03
	ld a, $20
	scall Func_80dff
	pop bc
.asm_bad5b:
	ret

Func_bad5c:
	ld hl, $00fa
	scall CheckEventFlag
	or a
	jp nz, .asm_bad9a
	ld a, $11
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
	ld hl, $00fa
	scall EventFlagAction
	jp .asm_bad9f
.asm_bad9a:
	ld a, $01
	scall Func_80653
.asm_bad9f:
	ret

Data_bada0:
	db $02, $03, $04, $03, $04, $02, $ff, $ff

Data_bada8:
	db $01, $03, $04, $03, $04, $02, $ff, $ff

Func_badb0:
	push af
	ld a, e
	or a
	jp nz, .asm_bae4c
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $006e
	scall PrintTextWithNPCName
	push hl
	push hl
	ld hl, $0000
	push hl
	ld hl, $0000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, $0000
	push hl
	ld hl, $0064
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_bade8
	ld hl, $0070
	scall PrintTextWithNPCName
	jp .asm_bae4c
.asm_bade8:
	ld hl, $006f
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bae46
	ld hl, $041b
	scall PrintTextStandard
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $ff9c
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $0072
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $0052
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae2d
	ld bc, Data_bada0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae38
.asm_bae2d:
	ld bc, Data_bada8
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae38:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	jp .asm_bae4c
.asm_bae46:
	ld hl, $0071
	scall PrintTextWithNPCName
.asm_bae4c:
	pop bc
	ret

Data_bae4e:
	db $02, $03, $03, $02, $ff, $ff

Data_bae54:
	db $01, $03, $03, $02, $ff, $ff

Func_bae5a:
	push af
	ld a, e
	or a
	jp nz, .asm_baea8
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0073
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $0052
	scall EventFlagAction
	ld e, $01
	ld hl, $00ed
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_bae92
	ld bc, Data_bae4e
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_bae9d
.asm_bae92:
	ld bc, Data_bae54
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_bae9d:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baea8:
	pop bc
	ret

Data_baeaa:
	db $02, $03, $03, $02, $ff, $ff

Data_baeb0:
	db $01, $03, $03, $02, $ff, $ff

Func_baeb6:
	push af
	ld a, e
	or a
	jp nz, .asm_baefc
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, $0073
	scall PrintTextWithNPCName
	ld e, $00
	ld hl, $00ed
	scall EventFlagAction
	ld a, [wPlayerFacing]
	cp $02
	jp nz, .asm_baee6
	ld bc, Data_baeaa
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
	jp .asm_baef1
.asm_baee6:
	ld bc, Data_baeb0
	ld e, $2e
	ld hl, sp+$01
	ld a, [hl]
	scall MovePersonAndWait
.asm_baef1:
	scall WaitNPCStep
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
.asm_baefc:
	pop bc
	ret

Func_baefe:
	ld a, e
	or a
	jp nz, .asm_baf51
	ld a, [wc790]
	or a
	jp z, .asm_baf1b
	ld a, [wc790]
	cp $07
	jp nc, .asm_baf1b
	ld hl, $03dd
	scall PrintTextStandard
	jp .asm_baf51
.asm_baf1b:
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_baf3b
	ld e, $01
	ld hl, $0059
	scall EventFlagAction
	ld a, $32
	scall PlaySFX
	ld hl, $035b
	scall PrintTextStandard
	jp .asm_baf4e
.asm_baf3b:
	ld e, $00
	ld hl, $0059
	scall EventFlagAction
	ld a, $28
	scall PlaySFX
	ld hl, $035c
	scall PrintTextStandard
.asm_baf4e:
	call Func_bafd6
.asm_baf51:
	ret

Data_baf52:
	warpdef $01, $08, $02, $01, MAP_03_00, $1c, $10, $1c, $11, $34

Data_baf5d:
	warpdef $01, $08, $02, $01, MAP_05_00, $08, $0b, $08, $0c, $34

Data_baf68:
	warpdef $01, $08, $02, $01, MAP_05_00, $19, $0b, $19, $0c, $34

Data_baf73:
	warpdef $01, $08, $02, $01, MAP_00_00, $1b, $14, $1b, $15, $34

Data_baf7e:
	warpdef $01, $08, $02, $01, MAP_25_01, $07, $08, $07, $09, $34

Data_baf89:
	warpdef $01, $08, $02, $01, MAP_05_00, $0a, $0e, $0a, $0f, $34

Data_baf94:
	warpdef $01, $08, $02, $01, MAP_05_00, $16, $0e, $16, $0f, $34

Data_baf9f:
	warpdef $01, $08, $02, $01, MAP_05_00, $0d, $14, $0d, $15, $34

Data_bafaa:
	warpdef $01, $08, $02, $01, MAP_05_00, $13, $14, $13, $15, $34

Data_bafb5:
	warpdef $01, $08, $02, $01, MAP_01_00, $07, $11, $07, $12, $34

Data_bafc0:
	warpdef $01, $08, $02, $01, MAP_20_00, $15, $11, $15, $12, $34

Data_bafcb:
	warpdef $01, $08, $02, $01, MAP_05_00, $10, $15, $10, $16, $34

Func_bafd6:
	ld hl, $0059
	scall CheckEventFlag
	or a
	jp nz, .asm_bafe6
	scall AllocateSpaceForWarps
	jp .asm_bb0a9
.asm_bafe6:
	scall AllocateSpaceForWarps
	ld a, [wc78a]
	cp $0e
	jp z, .asm_bb0a1
	cp $0d
	jp z, .asm_bb096
	cp $0c
	jp z, .asm_bb08b
	cp $0b
	jp z, .asm_bb080
	cp $0a
	jp z, .asm_bb075
	cp $09
	jp z, .asm_bb06a
	cp $08
	jp z, .asm_bb05f
	cp $07
	jp z, .asm_bb054
	cp $06
	jp z, .asm_bb049
	cp $05
	jp z, .asm_bb03e
	cp $04
	jp z, .asm_bb033
	cp $01
	jp nz, .asm_bb0a9
	ld e, $01
	ld hl, Data_baf52
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb033:
	ld e, $01
	ld hl, Data_baf5d
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb03e:
	ld e, $01
	ld hl, Data_baf68
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb049:
	ld e, $01
	ld hl, Data_baf73
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb054:
	ld e, $01
	ld hl, Data_bafb5
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb05f:
	ld e, $01
	ld hl, Data_baf89
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb06a:
	ld e, $01
	ld hl, Data_baf94
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb075:
	ld e, $01
	ld hl, Data_baf9f
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb080:
	ld e, $01
	ld hl, Data_bafaa
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb08b:
	ld e, $01
	ld hl, Data_baf7e
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb096:
	ld e, $01
	ld hl, Data_bafc0
	scall LoadWarps
	jp .asm_bb0a9
.asm_bb0a1:
	ld e, $01
	ld hl, Data_bafcb
	scall LoadWarps
.asm_bb0a9:
	ret

Data_bb0aa:
	db $07, $07, $02, $02, $01, $07

Func_bb0b0:
	ld a, [wc790]
	or a
	jp z, .asm_bb0d0
	ld a, [wc790]
	cp $07
	jp nz, .asm_bb0d0
	ld a, [wc78a]
	cp $0d
	jp nz, .asm_bb0d0
	ld hl, Data_bb0aa
	scall Func_80d9b
	scall Func_80f02
.asm_bb0d0:
	ret

Data_bb0d1:
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $08, $07, $08, $34
	warpdef $00, $07, $01, $02, MAP_00_00, $08, $0f, $07, $0f, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $0c, $04, $0c, $05, $34
	warpdef $01, $08, $02, $01, MAP_06_00, $19, $04, $19, $05, $34

Data_bb0fd:
	db $8e, $03, $ff, $ff

Data_bb101:
	db $8f, $03, $ff, $ff

Data_bb105:
	db $28, $03, $ff, $ff

Data_bb109:
	db $2a, $03, $ff, $ff

Data_bb10d:
	db $02, $08, $04, $01, $4b

Data_bb112:
	db $31, $08, $04

Data_bb115:
	db $31, $08, $04, $00, $00

Data_bb11a:
	db $17, $08, $04, $02, $47

Data_bb11f:
	db $20, $08, $04, $02, $79

Data_bb124:
	person_event $00, $04, $08, $05, $01, $01, $02, $04, $00, Func_806dd_2e, Data_bb112

Data_bb132:
	person_event $ff, $00, $05, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb0fd
	person_event $ff, $00, $06, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb101
	person_event $ff, $00, $02, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb105
	person_event $ff, $00, $04, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb109

Data_bb16a:
	map MAP_00_00
	db $08, $08

	map MAP_00_00
	db $08, $0f

	map MAP_06_00
	db $0c, $04

	map MAP_06_00
	db $19, $04

Func_bb17a:: ; bb17a
	ld c, $00
.asm_bb17c:
	ld a, c
	cp $04
	jp nc, .asm_bb1e4
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_bb1e0
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb16a
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_bb1e0
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
	ld de, Data_bb0d1
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_bb1e4
.asm_bb1e0:
	inc c
	jp .asm_bb17c
.asm_bb1e4:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_bb239
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_bb239
	call Func_bb29e
	ld hl, Func_bb29e
	scall Func_80f11
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb216
	ld a, [wBackupMapY]
	cp $08
	jp nz, .asm_bb216
	ld e, $01
	ld hl, Data_bb10d
	scall Func_80ce7
	jp .asm_bb236
.asm_bb216:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb236
	ld a, [wBackupMapY]
	cp $0f
	jp nz, .asm_bb236
	ld e, $01
	ld hl, Data_bb115
	scall Func_80ce7
	ld e, $01
	ld hl, Data_bb124
	scall LoadMapObjects
.asm_bb236:
	jp .asm_bb27b
.asm_bb239:
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_bb27b
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_bb27b
	ld a, [wBackupMapX]
	cp $0c
	jp nz, .asm_bb263
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_bb263
	ld e, $01
	ld hl, Data_bb11a
	scall Func_80ce7
	jp .asm_bb27b
.asm_bb263:
	ld a, [wBackupMapX]
	cp $19
	jp nz, .asm_bb27b
	ld a, [wBackupMapY]
	cp $04
	jp nz, .asm_bb27b
	ld e, $01
	ld hl, Data_bb11f
	scall Func_80ce7
.asm_bb27b:
	ld e, $04
	ld hl, Data_bb132
	scall LoadMapObjects
	ld a, $11
	scall PlayMusic
	scall Func_8001c
	ret

Data_bb28c:
	db $02, $08, $01, $01, $00, $07

Data_bb292:
	db $02, $08, $01, $01, $00, $08

Data_bb298:
	db $03, $08, $02, $01, $01, $08

Func_bb29e:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb2c6
	ld a, [wBackupMapY]
	cp $08
	jp nz, .asm_bb2c6
	ld hl, Data_bb28c
	scall Func_80d9b
	ld hl, Data_bb292
	scall Func_80d9b
	ld hl, Data_bb298
	scall Func_80d9b
	scall Func_80f02
	jp .asm_bb2eb
.asm_bb2c6:
	ld a, [wBackupMapX]
	cp $08
	jp nz, .asm_bb2eb
	ld a, [wBackupMapY]
	cp $0f
	jp nz, .asm_bb2eb
	ld hl, Data_bb28c
	scall Func_80d9b
	ld hl, Data_bb292
	scall Func_80d9b
	ld hl, Data_bb298
	scall Func_80d9b
	scall Func_80f02
.asm_bb2eb:
	ret

Data_bb2ec:
	warpdef $06, $0b, $02, $01, MAP_01_00, $0c, $12, $0c, $13, $34
	warpdef $06, $0b, $02, $01, MAP_03_00, $1a, $0a, $1a, $0b, $34
	warpdef $06, $0b, $02, $01, MAP_05_00, $1e, $12, $1e, $13, $34
	warpdef $06, $0b, $02, $01, MAP_06_00, $1c, $05, $1c, $06, $34
	warpdef $06, $0b, $02, $01, MAP_17_00, $1d, $04, $1d, $05, $34
	warpdef $06, $0b, $02, $01, MAP_21_00, $0a, $14, $0a, $15, $34
	warpdef $06, $0b, $02, $01, MAP_23_00, $16, $0f, $16, $10, $34
	warpdef $06, $0b, $02, $01, MAP_24_00, $14, $1a, $14, $1b, $34
	warpdef $06, $0b, $02, $01, MAP_25_01, $05, $0e, $05, $0f, $34
	warpdef $06, $0b, $02, $01, MAP_29_00, $13, $08, $13, $09, $34
	warpdef $06, $0b, $02, $01, MAP_00_10, $09, $01, $09, $02, $34
	warpdef $06, $0b, $02, $01, MAP_01_00, $23, $14, $23, $15, $34

Data_bb370:
	dw $38e
	dw -1

Data_bb374:
	dw $38f
	dw -1

Data_bb378:
	dw $328
	dw -1

Data_bb37c:
	dw $32a
	dw -1

Data_bb380:
	dw $34c
	dw -1

Data_bb384:
	person_event $0e, $04, $04, $08, $01, $01, $02, $04, $00, Func_bb4e8, NULL
	person_event $ff, $00, $00, $02, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb370
	person_event $ff, $00, $01, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb374
	person_event $ff, $00, $0c, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb378
	person_event $ff, $00, $0d, $07, $01, $01, $00, $04, $00, PrintTextFacePlayer_2e, Data_bb37c

Data_bb3ca:
	person_event $2b, $04, $08, $06, $01, $01, $03, $04, $00, Func_bb5c2, NULL
	person_event $12, $04, $08, $07, $01, $01, $03, $04, $00, Func_bb5c2, NULL
	person_event $11, $04, $09, $08, $01, $01, $02, $04, $00, Func_bb5c2, NULL
	person_event $15, $04, $0a, $08, $01, $01, $02, $04, $00, Func_bb5c2, NULL
	person_event $14, $04, $0b, $08, $01, $01, $02, $04, $00, Func_bb5c2, NULL
	person_event $00, $04, $08, $09, $01, $01, $02, $04, $00, PrintTextFacePlayer_2e, Data_bb380

Data_bb41e:
	map MAP_01_00
	db $0c, $12

	map MAP_03_00
	db $1a, $0a

	map MAP_05_00
	db $1e, $12

	map MAP_06_00
	db $1c, $05

	map MAP_17_00
	db $1d, $04

	map MAP_21_00
	db $0a, $14

	map MAP_23_00
	db $16, $0f

	map MAP_24_00
	db $14, $1a

	map MAP_25_01
	db $05, $0e

	map MAP_29_00
	db $13, $08

	map MAP_00_10
	db $09, $01

	map MAP_01_00
	db $23, $14


Func_bb44e:: ; bb44e
	ld c, $00
.asm_bb450:
	ld a, c
	cp $0c
	jp nc, .asm_bb4b8
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb41e
	add hl, de
	ld a, [wBackupMapGroup]
	cp [hl]
	jp nz, .asm_bb4b4
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb41e
	add hl, de
	inc hl
	ld a, [wBackupMapNumber]
	cp [hl]
	jp nz, .asm_bb4b4
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb41e
	add hl, de
	inc hl
	inc hl
	ld a, [wBackupMapX]
	cp [hl]
	jp nz, .asm_bb4b4
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld de, Data_bb41e
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [wBackupMapY]
	cp [hl]
	jp nz, .asm_bb4b4
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
	ld de, Data_bb2ec
	add hl, de
	ld e, $01
	scall LoadWarps
	jp .asm_bb4b8
.asm_bb4b4:
	inc c
	jp .asm_bb450
.asm_bb4b8:
	ld a, [wBackupMapGroup]
	or a
	jp nz, .asm_bb4d7
	ld a, [wBackupMapNumber]
	cp $0a
	jp nz, .asm_bb4d7
	ld e, $06
	ld hl, Data_bb3ca
	scall LoadMapObjects
	ld a, $14
	scall PlayMusic
	jp .asm_bb4e4
.asm_bb4d7:
	ld e, $05
	ld hl, Data_bb384
	scall LoadMapObjects
	ld a, $0c
	scall PlayMusic
.asm_bb4e4:
	scall Func_8001c
	ret

Func_bb4e8:
	ld a, e
	or a
	jp nz, .asm_bb4f4
	xor a
	scall FacePlayer
	scall AskRepairRobots
.asm_bb4f4:
	ret

Data_bb4f5:
	db $00, $00, $00, $02, $00, $c5, $27, $00, $00, $52, $01, $29, $01, $05, $05, $05
	db $05, $0c, $28, $01, $05, $01, $01, $01, $0c, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Data_bb51e:
	db $00, $00, $00, $01, $00, $c5, $25, $00, $00, $52, $01, $26, $01, $0a, $03, $00
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Data_bb547:
	db $00, $00, $00, $01, $00, $c5, $1f, $00, $00, $52, $01, $20, $01, $0a, $03, $00
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Data_bb570:
	db $00, $00, $00, $01, $00, $c5, $44, $00, $00, $52, $01, $45, $01, $05, $03, $00
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Data_bb599:
	db $00, $00, $00, $01, $00, $c5, $01, $00, $00, $52, $01, $02, $01, $0a, $03, $00
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_bb5c2:
	push af
	ld a, e
	or a
	jp nz, .asm_bb6fa
	ld hl, sp+$01
	ld a, [hl]
	scall FacePlayer
	ld hl, sp+$01
	ld a, [hl]
	cp $04
	jp z, .asm_bb6c3
	cp $03
	jp z, .asm_bb689
	cp $02
	jp z, .asm_bb64f
	cp $01
	jp z, .asm_bb615
	or a
	jp nz, .asm_bb6fa
	ld hl, $03e0
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bb60c
	ld de, Data_bb6fc
	ld hl, Data_bb4f5
	scall ScriptedBattle
	or a
	jp nz, .asm_bb603
	jp .asm_bb6fa
.asm_bb603:
	ld hl, $03e4
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb60c:
	ld hl, $03e3
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb615:
	ld hl, $0352
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bb646
	ld hl, $015e
	scall PrintTextStandard
.asm_bb625:
	ld de, Data_bb700
	ld hl, Data_bb51e
	scall Func_803f5
	or a
	jp nz, .asm_bb63d
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_bb625
	jp .asm_bb6fa
.asm_bb63d:
	ld hl, $03e2
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb646:
	ld hl, $03e1
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb64f:
	ld hl, $034f
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bb680
	ld hl, $017a
	scall PrintTextStandard
.asm_bb65f:
	ld de, Data_bb706
	ld hl, Data_bb547
	scall Func_802ef
	or a
	jp nz, .asm_bb677
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_bb65f
	jp .asm_bb6fa
.asm_bb677:
	ld hl, $045f
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb680:
	ld hl, $045e
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb689:
	ld hl, $0351
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bb6ba
	ld hl, $016b
	scall PrintTextStandard
.asm_bb699:
	ld de, Data_bb70b
	ld hl, Data_bb570
	scall Func_80347
	or a
	jp nz, .asm_bb6b1
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_bb699
	jp .asm_bb6fa
.asm_bb6b1:
	ld hl, $0463
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb6ba:
	ld hl, $0462
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb6c3:
	ld hl, $0350
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_bb6f4
	ld hl, $015d
	scall PrintTextStandard
.asm_bb6d3:
	ld de, Data_bb712
	ld hl, Data_bb599
	scall Func_8039e
	or a
	jp nz, .asm_bb6eb
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_bb6d3
	jp .asm_bb6fa
.asm_bb6eb:
	ld hl, $0461
	scall PrintTextWithNPCName
	jp .asm_bb6fa
.asm_bb6f4:
	ld hl, $0460
	scall PrintTextWithNPCName
.asm_bb6fa:
	pop bc
	ret

Data_bb6fc:
	dstr "ムサシ"

Data_bb700:
	dstr "トリヘﾟル"

Data_bb706:
	dstr "ヨンクー"

Data_bb70b:
	dstr "ハﾞクﾞエル"

Data_bb712:
	dstr "ロホﾞ(まる)"


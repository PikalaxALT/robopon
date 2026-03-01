
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

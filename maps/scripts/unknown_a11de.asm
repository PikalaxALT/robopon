
Data_a10b4:
	warpdef $0d, $04, $02, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $06, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $15, $06, $01, $01, MAP_32_01, $01, $08, $01, $07, $34
	warpdef $07, $0b, $01, $01, MAP_32_07, $05, $09, $05, $08, $34
	warpdef $07, $11, $01, $01, MAP_32_08, $05, $09, $05, $08, $34
	warpdef $14, $09, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $14, $0c, $01, $01, MAP_32_00, $01, $05, $01, $04, $34
	warpdef $0d, $11, $01, $01, MAP_20_01, $04, $09, $04, $08, $34

Data_a110c:
	warpdef $15, $11, $01, $01, MAP_32_03, $01, $08, $01, $07, $34

Data_a1117:
	dw $1e4
	dw -1

Data_a111b:
	dw $1ec
	dw -1

Data_a111f:
	dw $1e5
	dw -1

Data_a1123:
	dw $1e8
	dw -1

Data_a1127:
	dw $2bc
	dw -1

Data_a112b:
	dw $326
	dw -1

Data_a112f:
	dw $3ab
	dw -1

Data_a1133:
	dw $3ad
	dw -1

Data_a1137:
	dw $3ac
	dw -1

Data_a113b:
	dw $3ae
	dw -1

Data_a113f:
	db $5b, $0e, $09, $11, $4f

Data_a1144:
	person_event $02, $04, $0e, $0b, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a1117

Data_a1152:
	person_event $09, $04, $16, $12, $01, $01, $03, $04, $00, PrintTextFacePlayer_28, Data_a111b
	person_event $00, $04, $10, $10, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a111f
	person_event $01, $04, $06, $0d, $01, $01, $01, $04, $00, Func_a12b1, NULL
	person_event $06, $04, $08, $06, $01, $01, $02, $04, $00, PrintTextFacePlayer_28, Data_a1123
	person_event $ff, $00, $0c, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a1127
	person_event $ff, $00, $0f, $05, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a1127
	person_event $0f, $04, $0c, $08, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0c, $08, $01, $01, $02, $04, $00, Func_a1514, NULL

Data_a11c2:
	person_event $ff, $00, $15, $11, $01, $01, $00, $04, $00, PrintTextFacePlayer_28, Data_a112b

Data_a11d0:
	person_event $ff, $00, $15, $11, $01, $01, $00, $04, $01, Func_a1508, NULL

Func_a11de:: ; a11de
	ld a, $5
	ld [wc789], a
	ld a, $8
	ld [wc7e2], a
	call Func_a14ef
	ld hl, Func_a14ef
	scall Func_80f11
	checkevent $42
	cp $1
	jp nz, .asm_a120b
	ld a, $9
	scall Func_80c94
	ld a, $10
	scall Func_80c94
	ld a, $11
	scall Func_80c94
.asm_a120b:
	ld a, [wc793]
	cp $1
	jp z, .asm_a121b
	ld a, [wc793]
	cp $2
	jp nz, .asm_a122c
.asm_a121b:
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $2710
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
.asm_a122c:
	loadwarps $8, Data_a10b4
	ld e, $1
	ld hl, Data_a113f
	scall Func_80ce7
	loadpeople $9, Data_a1144
	ld a, $13
	scall PlayMusic
	ld a, $1
	scall LoadPlayerSprite
	ld e, $0
	ld a, $7
	scall SetPersonVisibilityState
	ld a, [wc790]
	or a
	jp z, .asm_a1283
	ld a, [wc790]
	cp $5
	jp nc, .asm_a1283
	ld de, Data_a112f
	xor a
	scall SetPersonTextPointer
	ld de, Data_a1133
	ld a, $1
	scall SetPersonTextPointer
	ld de, Data_a1137
	ld a, $2
	scall SetPersonTextPointer
	ld de, Data_a113b
	ld a, $4
	scall SetPersonTextPointer
.asm_a1283:
	ld a, [wc790]
	or a
	jp z, .asm_a12a5
	ld a, [wc790]
	cp 7
	jp nc, .asm_a12a5
	loadwarps $1, Data_a110c
	loadpeople $1, Data_a11d0
	jp .asm_a12ad
.asm_a12a5:
	loadpeople $1, Data_a11c2
.asm_a12ad:
	scall Func_8001c
	ret

Func_a12b1:
	push af
	push bc
	ld hl, sp+$00
	ld [hl], $ff
	ld a, e
	or a
	jp nz, .asm_a14e6
	face_player -$03
	ld a, [wc796]
	cp $03
	jp nz, .asm_a134c
	ld a, $32
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a1349
	ld hl, $0414
	scall PrintTextWithNPCName
	ld a, $32
	scall Func_80e7d
	cp $01
	jp nz, .asm_a1340
	ld hl, $0292
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a132f
	ld a, $68
	scall PlaySFX
	ld hl, $0408
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
	ld a, $49
	scall GiveRobot
	ld a, $04
	ld [$c796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a133d

.asm_a132f:
	ld a, $69
	scall PlaySFX
	ld hl, $0409
	scall PrintTextWithNPCName
	jp .asm_a14e6

.asm_a133d:
	jp .asm_a1349

.asm_a1340:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_a14e6

.asm_a1349:
	jp .asm_a1491

.asm_a134c:
	ld a, [$c796]
	cp $0d
	jp nz, .asm_a13d6
	ld a, $7e
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a13d3
	ld hl, $0414
	scall PrintTextWithNPCName
	ld a, $7e
	scall Func_80e7d
	cp $01
	jp nz, .asm_a13ca
	ld hl, $0293
	scall PrintTextWithNPCName
	ld hl, $0400
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a13b9
	ld a, $68
	scall PlaySFX
	ld hl, $042d
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
	ld a, $83
	scall GiveRobot
	ld a, $0e
	ld [$c796], a
	ld hl, sp+$00
	ld [hl], $01
	jp .asm_a13c7

.asm_a13b9:
	ld a, $69
	scall PlaySFX
	ld hl, $042e
	scall PrintTextWithNPCName
	jp .asm_a14e6

.asm_a13c7:
	jp .asm_a13d3

.asm_a13ca:
	ld hl, $046e
	scall PrintTextStandard
	jp .asm_a14e6

.asm_a13d3:
	jp .asm_a1491

.asm_a13d6:
	ld a, $32
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp nz, .asm_a13f0
	ld a, $7e
	scall Func_80e6d
	ld hl, sp+$01
	ld [hl], a
	cp $ff
	jp z, .asm_a1491
.asm_a13f0:
	ld a, [$c796]
	cp $08
	jp z, .asm_a1479
	cp $06
	jp z, .asm_a1479
	cp $0a
	jp z, .asm_a146a
	cp $05
	jp z, .asm_a146a
	cp $0c
	jp z, .asm_a145b
	cp $04
	jp z, .asm_a145b
	cp $07
	jp z, .asm_a144c
	or a
	jp z, .asm_a144c
	cp $0b
	jp z, .asm_a143d
	cp $02
	jp z, .asm_a143d
	cp $09
	jp z, .asm_a142e
	cp $01
	jp nz, .asm_a1488
.asm_a142e:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034d
	scall PrintTextStandard
	jp .asm_a148e

.asm_a143d:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0205
	scall PrintTextStandard
	jp .asm_a148e

.asm_a144c:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $034b
	scall PrintTextStandard
	jp .asm_a148e

.asm_a145b:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0218
	scall PrintTextStandard
	jp .asm_a148e

.asm_a146a:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0241
	scall PrintTextStandard
	jp .asm_a148e

.asm_a1479:
	ld hl, $0140
	scall PrintTextStandard
	ld hl, $0244
	scall PrintTextStandard
	jp .asm_a148e

.asm_a1488:
	ld hl, $0414
	scall PrintTextWithNPCName
.asm_a148e:
	jp .asm_a14e6

.asm_a1491:
	ld hl, sp+$00
	ld a, [hl]
	cp $ff
	jp nz, .asm_a14e6
	ld a, [$c796]
	cp $0e
	jp nc, .asm_a14b8
	ld a, [$c796]
	cp $04
	jp c, .asm_a14b8
	ld hl, $0414
	scall PrintTextWithNPCName
	ld hl, $042c
	scall PrintTextWithNPCName
	jp .asm_a14e6

.asm_a14b8:
	ld a, [$c796]
	cp $0f
	jp nz, .asm_a14c9
	ld hl, $0414
	scall PrintTextWithNPCName
	jp .asm_a14e6

.asm_a14c9:
	ld a, [$c796]
	cp $0e
	jp c, .asm_a14da
	ld hl, $042f
	scall PrintTextWithNPCName
	jp .asm_a14e6

.asm_a14da:
	ld hl, $0414
	scall PrintTextWithNPCName
	ld hl, $01e6
	scall PrintTextWithNPCName
.asm_a14e6:
	pop bc
	pop bc
	ret

Data_a14e9:
	db $14, $0c, $01, $01, $15, $11

Func_a14ef:
	ld a, [wc790]
	or a
	jp z, .asm_a1507
	ld a, [wc790]
	cp $07
	jp nc, .asm_a1507
	ld hl, Data_a14e9
	scall Func_80d9b
	scall Func_80f02
.asm_a1507:
	ret

Func_a1508:
	ld a, e
	cp $02
	jp nz, .asm_a1513
	ld a, $0d
	ld [wc78a], a
.asm_a1513:
	ret

Func_a1514:
	ld a, e
	or a
	jp nz, .asm_a161b
	ld hl, $00dd
	scall CheckEventFlag
	or a
	jp nz, .asm_a1615
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $08
	ld a, $0c
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $07
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $07
	scall SpriteFace
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld e, $01
	ld a, $07
	scall SpriteFace
	ld e, $02
	ld a, $07
	scall SpriteFace
	ld e, $03
	ld a, $07
	scall SpriteFace
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld e, $01
	ld a, $07
	scall SpriteFace
	ld e, $02
	ld a, $07
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $14
	scall PlayMusic
	ld a, $07
	scall FacePlayer
	ld hl, $001e
	scall ScriptSleep
	ld c, $11
	ld e, $0a
	ld a, $03
	scall Func_80e8d
	ld e, $01
	ld hl, $00dd
	scall EventFlagAction
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $07
	scall SpriteFace
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld e, $01
	ld a, $07
	scall SpriteFace
	ld e, $02
	ld a, $07
	scall SpriteFace
	ld e, $03
	ld a, $07
	scall SpriteFace
	ld e, $00
	ld a, $07
	scall SpriteFace
	ld e, $01
	ld a, $07
	scall SpriteFace
	ld e, $02
	ld a, $07
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	xor a
	scall PlayMusic
	ld a, $01
	scall FadeInAudio
	ld a, $13
	scall PlayMusic
	ld a, $07
	scall FacePlayer
	ld e, $00
	ld a, $07
	scall SetPersonVisibilityState
	jp .asm_a161b
.asm_a1615:
	ld hl, $015c
	scall PrintTextStandard
.asm_a161b:
	ret

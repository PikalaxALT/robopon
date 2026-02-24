INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 28", ROMX
	script_library 28

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


Data_a161c: ; a161c
	warpdef $04, $09, $02, $01, MAP_20_00, $0d, $11, $0d, $12, $34
Data_a161c_end:

Data_a1627:
	person_event $09, $04, $04, $03, $01, $02, $02, $04, $00, Func_a16f4, NULL
	person_event $09, $04, $00, $05, $01, $01, $01, $04, $00, Func_a17a6, NULL
	person_event $09, $04, $00, $06, $01, $01, $01, $04, $00, Func_a187b, NULL
	person_event $09, $04, $09, $05, $01, $01, $03, $04, $00, Func_a195e, NULL
	person_event $09, $04, $09, $06, $01, $01, $03, $04, $00, Func_a1a41, NULL
	person_event $09, $04, $09, $07, $01, $01, $03, $04, $00, Func_a1b24, NULL
Data_a1627_end:

Func_a167b:: ; a167b
	ld e, (Data_a161c_end - Data_a161c) / 11
	ld hl, Data_a161c
	scall LoadWarps
	ld e, (Data_a1627_end - Data_a1627) / 14
	ld hl, Data_a1627
	scall LoadMapObjects
	checkevent $0095
	cp $1
	jp nz, .asm_a16e5
	checkevent $009a
	cp $1
	jp nz, .asm_a16e5
	checkevent $009f
	cp $1
	jp nz, .asm_a16e5
	checkevent $00a4
	cp $1
	jp nz, .asm_a16e5
	checkevent $00a9
	cp $1
	jp nz, .asm_a16e5
	ld e, $0
	ld a, $1
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $2
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $3
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $4
	scall SetPersonVisibilityState
	ld e, $0
	ld a, $5
	scall SetPersonVisibilityState
.asm_a16e5:
	ld a, $14
	scall PlayMusic
	scall Func_8001c
	ld hl, $02bb
	scall LandmarkSign
	ret

Func_a16f4:
	ld a, e
	or a
	jp nz, .asm_a177c
	ld hl, $003b
	scall CheckEventFlag
	or a
	jp nz, .asm_a175e
	ld hl, $00af
	scall PrintTextWithNPCNameAndYesNoBox
	or a
	jp nz, .asm_a1755
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
	ld hl, $03e8
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_a1733
	ld hl, $00b1
	scall PrintTextWithNPCName
	jp .asm_a1752
.asm_a1733:
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $fc18
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, $00b2
	scall PrintTextWithNPCName
	ld e, $01
	ld hl, $003b
	scall EventFlagAction
.asm_a1752:
	jp .asm_a175b
.asm_a1755:
	ld hl, $00b0
	scall PrintTextWithNPCName
.asm_a175b:
	jp .asm_a177c
.asm_a175e:
	ld a, [wc790]
	or a
	jp z, .asm_a1776
	ld a, [wc790]
	cp $05
	jp nc, .asm_a1776
	ld hl, $010f
	scall PrintTextStandard
	jp .asm_a177c
.asm_a1776:
	ld hl, $00bf
	scall PrintTextWithNPCName
.asm_a177c:
	ret

Data_a177d:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $8d, $01, $8d, $04, $19, $0c, $0d, $14, $03, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_a17a6:
	ld a, e
	or a
	jp nz, .asm_a1848
	ld a, $01
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1842
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1839
	ld hl, $003d
	scall CheckEventFlag
	or a
	jp nz, .asm_a1830
	ld hl, $00c1
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1827
	ld hl, $00c6
	scall PrintTextStandard
	ld de, Data_a1849
	ld hl, Data_a177d
	scall ScriptedBattle
	or a
	jp nz, .asm_a17ef
	jp .asm_a1848
.asm_a17ef:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00bb
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003d
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1e
	scall Func_80d4d
	ld a, $01
	ld [wc78f], a
	jp .asm_a182d
.asm_a1827:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a182d:
	jp .asm_a1836
.asm_a1830:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1836:
	jp .asm_a183f
.asm_a1839:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a183f:
	jp .asm_a1848
.asm_a1842:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1848:
	ret

Data_a1849:
	dstr "(くﾞんしﾞん)"

Data_a1852:
	db $00, $00
	db $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $19, $01, $13, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c

Func_a187b:
	ld a, e
	or a
	jp nz, .asm_a192b
	ld a, $02
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1925
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a191c
	ld hl, $003e
	scall CheckEventFlag
	or a
	jp nz, .asm_a1913
	ld hl, $00c2
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a190a
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $015e
	scall PrintTextStandard
.asm_a18ba:
	ld de, Data_a192c
	ld hl, Data_a1852
	scall Func_803f5
	or a
	jp nz, .asm_a18d2
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a18ba
	jp .asm_a192b
.asm_a18d2:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b6
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003e
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1c
	scall Func_80d4d
	ld a, $02
	ld [wc78f], a
	jp .asm_a1910
.asm_a190a:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1910:
	jp .asm_a1919
.asm_a1913:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1919:
	jp .asm_a1922
.asm_a191c:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1922:
	jp .asm_a192b
.asm_a1925:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a192b:
	ret

Data_a192c:
	dstr "(くﾞんしﾞん)"

Data_a1935:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $1f, $01, $1f, $04, $19, $17
	db $17, $17, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a195e:
	ld a, e
	or a
	jp nz, .asm_a1a0e
	ld a, $03
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1a08
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a19ff
	ld hl, $003f
	scall CheckEventFlag
	or a
	jp nz, .asm_a19f6
	ld hl, $00c3
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a19ed
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $017a
	scall PrintTextStandard
.asm_a199d:
	ld de, Data_a1a0f
	ld hl, Data_a1935
	scall Func_802ef
	or a
	jp nz, .asm_a19b5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a199d
	jp .asm_a1a0e
.asm_a19b5:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b8
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $003f
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1d
	scall Func_80d4d
	ld a, $03
	ld [wc78f], a
	jp .asm_a19f3
.asm_a19ed:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a19f3:
	jp .asm_a19fc
.asm_a19f6:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a19fc:
	jp .asm_a1a05
.asm_a19ff:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1a05:
	jp .asm_a1a0e
.asm_a1a08:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1a0e:
	ret

Data_a1a0f:
	dstr "(くﾞんしﾞん)"

Data_a1a18:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e
	db $04, $19, $01, $02, $03, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1a41:
	ld a, e
	or a
	jp nz, .asm_a1af1
	ld a, $04
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1aeb
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1ae2
	ld hl, $0040
	scall CheckEventFlag
	or a
	jp nz, .asm_a1ad9
	ld hl, $00c4
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1ad0
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $016b
	scall PrintTextStandard
.asm_a1a80:
	ld de, Data_a1af2
	ld hl, Data_a1a18
	scall Func_80347
	or a
	jp nz, .asm_a1a98
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1a80
	jp .asm_a1af1
.asm_a1a98:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00ba
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $0040
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $20
	scall Func_80d4d
	ld a, $04
	ld [wc78f], a
	jp .asm_a1ad6
.asm_a1ad0:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1ad6:
	jp .asm_a1adf
.asm_a1ad9:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1adf:
	jp .asm_a1ae8
.asm_a1ae2:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1ae8:
	jp .asm_a1af1
.asm_a1aeb:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1af1:
	ret

Data_a1af2:
	dstr "(くﾞんしﾞん)"

Data_a1afb:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $10, $01, $10, $04, $19, $1f, $1e, $18, $02, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1b24:
	ld a, e
	or a
	jp nz, .asm_a1bd4
	ld a, $05
	scall FacePlayer
	ld hl, $003b
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a1bce
	ld hl, $0042
	scall CheckEventFlag
	or a
	jp nz, .asm_a1bc5
	ld hl, $0041
	scall CheckEventFlag
	or a
	jp nz, .asm_a1bbc
	ld hl, $00c5
	scall PrintTextWithYesNoBox
	or a
	jp nz, .asm_a1bb3
	ld hl, $00c6
	scall PrintTextStandard
	ld hl, $015d
	scall PrintTextStandard
.asm_a1b63:
	ld de, Data_a1bd5
	ld hl, Data_a1afb
	scall Func_8039e
	or a
	jp nz, .asm_a1b7b
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1b63
	jp .asm_a1bd4
.asm_a1b7b:
	ld hl, $00c8
	scall PrintTextStandard
	ld a, $2a
	scall PlaySFX
	ld hl, $00b9
	scall PrintTextStandard
	ld hl, $00bc
	scall PrintTextStandard
	ld e, $01
	ld hl, $0041
	scall EventFlagAction
	ld e, $01
	ld hl, $0042
	scall EventFlagAction
	ld c, $00
	ld e, $01
	ld a, $1f
	scall Func_80d4d
	ld a, $05
	ld [wc78f], a
	jp .asm_a1bb9
.asm_a1bb3:
	ld hl, $00c7
	scall PrintTextStandard
.asm_a1bb9:
	jp .asm_a1bc2
.asm_a1bbc:
	ld hl, $00b7
	scall PrintTextStandard
.asm_a1bc2:
	jp .asm_a1bcb
.asm_a1bc5:
	ld hl, $00b5
	scall PrintTextStandard
.asm_a1bcb:
	jp .asm_a1bd4
.asm_a1bce:
	ld hl, $00c0
	scall PrintTextStandard
.asm_a1bd4:
	ret

Data_a1bd5:
	dstr "(くﾞんしﾞん)"

Data_a1bde:
	warpdef $0a, $0d, $01, $01, MAP_29_01, $0a, $04, $0b, $04, $2e

Data_a1be9:
	warpdef $01, $01, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $01, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $01, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $01, $01, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a1c15:
	warpdef $19, $07, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $19, $07, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $19, $07, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $19, $07, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a1c41:
	warpdef $19, $13, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $19, $13, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $19, $13, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $19, $13, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a1c6d:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a1cb3:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a1cf9:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a1d3f:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a1d85:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $1b, $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $1b, $18, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a1dcb:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a1e11:
IF DEF(SUN)
	wildbot $00, $00, $1b, $18, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $1b, $18, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $1b, $18, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $1b, $18, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a1e57:: ; a1e57
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a1e6d
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a1e6d:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a1e7d
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a1e7d:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a1f52
	cp $1d
	jp z, .asm_a1f52
	cp $1c
	jp z, .asm_a1f52
	cp $1b
	jp z, .asm_a1f52
	cp $1a
	jp z, .asm_a1f52
	cp $19
	jp z, .asm_a1f47
	cp $18
	jp z, .asm_a1f47
	cp $17
	jp z, .asm_a1f47
	cp $16
	jp z, .asm_a1f47
	cp $15
	jp z, .asm_a1f47
	cp $14
	jp z, .asm_a1f3c
	cp $13
	jp z, .asm_a1f3c
	cp $12
	jp z, .asm_a1f3c
	cp $11
	jp z, .asm_a1f3c
	cp $10
	jp z, .asm_a1f3c
	cp $0f
	jp z, .asm_a1f31
	cp $0e
	jp z, .asm_a1f31
	cp $0d
	jp z, .asm_a1f31
	cp $0c
	jp z, .asm_a1f31
	cp $0b
	jp z, .asm_a1f31
	cp $0a
	jp z, .asm_a1f26
	cp $09
	jp z, .asm_a1f26
	cp $08
	jp z, .asm_a1f26
	cp $07
	jp z, .asm_a1f26
	cp $06
	jp z, .asm_a1f26
	cp $05
	jp z, .asm_a1f1b
	cp $04
	jp z, .asm_a1f1b
	cp $03
	jp z, .asm_a1f1b
	cp $02
	jp z, .asm_a1f1b
	cp $01
	jp nz, .asm_a1f5d
.asm_a1f1b:
	ld e, $05
	ld hl, Data_a1c6d
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f26:
	ld e, $05
	ld hl, Data_a1cb3
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f31:
	ld e, $05
	ld hl, Data_a1cf9
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f3c:
	ld e, $05
	ld hl, Data_a1d3f
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f47:
	ld e, $05
	ld hl, Data_a1d85
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f52:
	ld e, $05
	ld hl, Data_a1dcb
	scall LoadEncounters
	jp .asm_a1f65
.asm_a1f5d:
	ld e, $05
	ld hl, Data_a1e11
	scall LoadEncounters
.asm_a1f65:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a1fa5
	call Func_a1fe2
	ld hl, Func_a1fe2
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
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
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a1be9
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a1fa5:
	ld e, $01
	ld hl, Data_a1bde
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a1fc6
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a1fcf
.asm_a1fc6:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a1fcf:
	ret

Data_a1fd0:
	db $19, $00, $01, $01, $01, $01
	db $19, $00, $01, $01, $19, $07
	db $19, $00, $01, $01, $19, $13

Func_a1fe2:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a1fd0
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_a1ff8:
	warpdef $10, $10, $01, $01, MAP_29_01, $0a, $04, $0b, $04, $2e

Data_a2003:
	warpdef $01, $13, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $01, $13, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $01, $13, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $01, $13, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a202f:
	warpdef $07, $01, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $07, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $07, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $07, $01, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a205b:
	warpdef $22, $0a, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $22, $0a, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $22, $0a, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $22, $0a, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a2087:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a20cd:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $2c, $16, $1a, $78, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $16, $1a, $78, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $16, $1a, $78, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $16, $1a, $78, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $06, $16, $1a, $2f, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2113:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $24, $20, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $24, $20, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2159:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $24, $20, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $24, $20, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a219f:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $24, $20, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $24, $20, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a21e5:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $24, $20, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $24, $20, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a222b:
IF DEF(SUN)
	wildbot $00, $00, $24, $20, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $24, $20, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $24, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2271:: ; a2271
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2287
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2287:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2297
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a2297:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a236c
	cp $1d
	jp z, .asm_a236c
	cp $1c
	jp z, .asm_a236c
	cp $1b
	jp z, .asm_a236c
	cp $1a
	jp z, .asm_a236c
	cp $19
	jp z, .asm_a2361
	cp $18
	jp z, .asm_a2361
	cp $17
	jp z, .asm_a2361
	cp $16
	jp z, .asm_a2361
	cp $15
	jp z, .asm_a2361
	cp $14
	jp z, .asm_a2356
	cp $13
	jp z, .asm_a2356
	cp $12
	jp z, .asm_a2356
	cp $11
	jp z, .asm_a2356
	cp $10
	jp z, .asm_a2356
	cp $0f
	jp z, .asm_a234b
	cp $0e
	jp z, .asm_a234b
	cp $0d
	jp z, .asm_a234b
	cp $0c
	jp z, .asm_a234b
	cp $0b
	jp z, .asm_a234b
	cp $0a
	jp z, .asm_a2340
	cp $09
	jp z, .asm_a2340
	cp $08
	jp z, .asm_a2340
	cp $07
	jp z, .asm_a2340
	cp $06
	jp z, .asm_a2340
	cp $05
	jp z, .asm_a2335
	cp $04
	jp z, .asm_a2335
	cp $03
	jp z, .asm_a2335
	cp $02
	jp z, .asm_a2335
	cp $01
	jp nz, .asm_a2377
.asm_a2335:
	ld e, $05
	ld hl, Data_a2087
	scall LoadEncounters
	jp .asm_a237f
.asm_a2340:
	ld e, $05
	ld hl, Data_a20cd
	scall LoadEncounters
	jp .asm_a237f
.asm_a234b:
	ld e, $05
	ld hl, Data_a2113
	scall LoadEncounters
	jp .asm_a237f
.asm_a2356:
	ld e, $05
	ld hl, Data_a2159
	scall LoadEncounters
	jp .asm_a237f
.asm_a2361:
	ld e, $05
	ld hl, Data_a219f
	scall LoadEncounters
	jp .asm_a237f
.asm_a236c:
	ld e, $05
	ld hl, Data_a21e5
	scall LoadEncounters
	jp .asm_a237f
.asm_a2377:
	ld e, $05
	ld hl, Data_a222b
	scall LoadEncounters
.asm_a237f:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a23bf
	call Func_a23fc
	ld hl, Func_a23fc
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
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
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a2003
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a23bf:
	ld e, $01
	ld hl, $5ff8
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a23e0
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a23e9
.asm_a23e0:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a23e9:
	ret

Data_a23ea:
	db $22, $1f, $01, $01, $01, $13
	db $22, $1f, $01, $01, $07, $01
	db $22, $1f, $01, $01, $22, $0a

Func_a23fc:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a23ea
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_a2412:
	warpdef $07, $15, $01, $01, MAP_29_01, $0a, $04, $0b, $04, $2e

Data_a241d:
	warpdef $0d, $1b, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $0d, $1b, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $0d, $1b, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $0d, $1b, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a2449:
	warpdef $1e, $1b, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $1e, $1b, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $1e, $1b, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $1e, $1b, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a2475:
	warpdef $21, $08, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $21, $08, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $21, $08, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e
	warpdef $21, $08, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a24a1:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a24e7:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a252d:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $20, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $20, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2573:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $20, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $20, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a25b9:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $20, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $23, $20, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $20, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a25ff:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $20, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $20, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2645:
IF DEF(SUN)
	wildbot $00, $00, $23, $20, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $20, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $20, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a268b:: ; a268b
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a26a1
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a26a1:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a26b1
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a26b1:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a2786
	cp $1d
	jp z, .asm_a2786
	cp $1c
	jp z, .asm_a2786
	cp $1b
	jp z, .asm_a2786
	cp $1a
	jp z, .asm_a2786
	cp $19
	jp z, .asm_a277b
	cp $18
	jp z, .asm_a277b
	cp $17
	jp z, .asm_a277b
	cp $16
	jp z, .asm_a277b
	cp $15
	jp z, .asm_a277b
	cp $14
	jp z, .asm_a2770
	cp $13
	jp z, .asm_a2770
	cp $12
	jp z, .asm_a2770
	cp $11
	jp z, .asm_a2770
	cp $10
	jp z, .asm_a2770
	cp $0f
	jp z, .asm_a2765
	cp $0e
	jp z, .asm_a2765
	cp $0d
	jp z, .asm_a2765
	cp $0c
	jp z, .asm_a2765
	cp $0b
	jp z, .asm_a2765
	cp $0a
	jp z, .asm_a275a
	cp $09
	jp z, .asm_a275a
	cp $08
	jp z, .asm_a275a
	cp $07
	jp z, .asm_a275a
	cp $06
	jp z, .asm_a275a
	cp $05
	jp z, .asm_a274f
	cp $04
	jp z, .asm_a274f
	cp $03
	jp z, .asm_a274f
	cp $02
	jp z, .asm_a274f
	cp $01
	jp nz, .asm_a2791
.asm_a274f:
	ld e, $05
	ld hl, Data_a24a1
	scall LoadEncounters
	jp .asm_a2799
.asm_a275a:
	ld e, $05
	ld hl, Data_a24e7
	scall LoadEncounters
	jp .asm_a2799
.asm_a2765:
	ld e, $05
	ld hl, Data_a252d
	scall LoadEncounters
	jp .asm_a2799
.asm_a2770:
	ld e, $05
	ld hl, Data_a2573
	scall LoadEncounters
	jp .asm_a2799
.asm_a277b:
	ld e, $05
	ld hl, Data_a25b9
	scall LoadEncounters
	jp .asm_a2799
.asm_a2786:
	ld e, $05
	ld hl, Data_a25ff
	scall LoadEncounters
	jp .asm_a2799
.asm_a2791:
	ld e, $05
	ld hl, Data_a2645
	scall LoadEncounters
.asm_a2799:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a27d9
	call Func_a2816
	ld hl, Func_a2816
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
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
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a241d
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a27d9:
	ld e, $01
	ld hl, Data_a2412
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a27fa
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a2803
.asm_a27fa:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a2803:
	ret

Data_a2804:
	db $00, $00, $01, $01, $0d, $1b
	db $00, $00, $01, $01, $1e, $1b
	db $00, $00, $01, $01, $21, $08

Func_a2816:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a2804
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_a282c:
	warpdef $21, $0a, $01, $01, MAP_29_01, $0a, $04, $0b, $04, $2e

Data_a2837:
	warpdef $01, $04, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $01, $04, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $01, $04, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $01, $04, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a2863:
	warpdef $08, $10, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $08, $10, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $08, $10, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $08, $10, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a288f:
	warpdef $21, $10, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $21, $10, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $21, $10, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $21, $10, $01, $01, MAP_29_24, $16, $13, $16, $12, $2e

Data_a28bb:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2901:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2947:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a298d:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a29d3:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $23, $1e, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2a19:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2a5f:
IF DEF(SUN)
	wildbot $00, $00, $23, $1e, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $23, $1e, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2aa5:: ; a2aa5
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2abb
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2abb:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2acb
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a2acb:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a2ba0
	cp $1d
	jp z, .asm_a2ba0
	cp $1c
	jp z, .asm_a2ba0
	cp $1b
	jp z, .asm_a2ba0
	cp $1a
	jp z, .asm_a2ba0
	cp $19
	jp z, .asm_a2b95
	cp $18
	jp z, .asm_a2b95
	cp $17
	jp z, .asm_a2b95
	cp $16
	jp z, .asm_a2b95
	cp $15
	jp z, .asm_a2b95
	cp $14
	jp z, .asm_a2b8a
	cp $13
	jp z, .asm_a2b8a
	cp $12
	jp z, .asm_a2b8a
	cp $11
	jp z, .asm_a2b8a
	cp $10
	jp z, .asm_a2b8a
	cp $0f
	jp z, .asm_a2b7f
	cp $0e
	jp z, .asm_a2b7f
	cp $0d
	jp z, .asm_a2b7f
	cp $0c
	jp z, .asm_a2b7f
	cp $0b
	jp z, .asm_a2b7f
	cp $0a
	jp z, .asm_a2b74
	cp $09
	jp z, .asm_a2b74
	cp $08
	jp z, .asm_a2b74
	cp $07
	jp z, .asm_a2b74
	cp $06
	jp z, .asm_a2b74
	cp $05
	jp z, .asm_a2b69
	cp $04
	jp z, .asm_a2b69
	cp $03
	jp z, .asm_a2b69
	cp $02
	jp z, .asm_a2b69
	cp $01
	jp nz, .asm_a2bab
.asm_a2b69:
	ld e, $05
	ld hl, Data_a28bb
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2b74:
	ld e, $05
	ld hl, Data_a2901
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2b7f:
	ld e, $05
	ld hl, Data_a2947
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2b8a:
	ld e, $05
	ld hl, Data_a298d
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2b95:
	ld e, $05
	ld hl, Data_a29d3
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2ba0:
	ld e, $05
	ld hl, Data_a2a19
	scall LoadEncounters
	jp .asm_a2bb3
.asm_a2bab:
	ld e, $05
	ld hl, Data_a2a5f
	scall LoadEncounters
.asm_a2bb3:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a2bf3
	call Func_a2c30
	ld hl, Func_a2c30
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
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
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a2837
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a2bf3:
	ld e, $01
	ld hl, Data_a282c
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2c14
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a2c1d
.asm_a2c14:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a2c1d:
	ret

Data_a2c1e:
	db $21, $00, $01, $01, $01, $04
	db $21, $00, $01, $01, $08, $10
	db $21, $00, $01, $01, $21, $10

Func_a2c30:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a2c1e
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_a2c46:
	warpdef $16, $13, $01, $01, MAP_29_01, $0a, $04, $0b, $04, $2e

Data_a2c51:
	warpdef $01, $1c, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $01, $1c, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $01, $1c, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $01, $1c, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e

Data_a2c7d:
	warpdef $16, $0a, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $16, $0a, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $16, $0a, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $16, $0a, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e

Data_a2ca9:
	warpdef $25, $01, $01, $01, MAP_29_20, $0a, $0d, $09, $0d, $2e
	warpdef $25, $01, $01, $01, MAP_29_21, $10, $10, $0f, $10, $2e
	warpdef $25, $01, $01, $01, MAP_29_22, $07, $15, $08, $15, $2e
	warpdef $25, $01, $01, $01, MAP_29_23, $21, $0a, $20, $0a, $2e

Data_a2cd5:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2d1b:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2d61:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $33, $21, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $33, $21, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2da7:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	wildbot $00, $00, $33, $21, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1a, $1e, $30, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	wildbot $00, $00, $33, $21, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a2ded:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $33, $21, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	wildbot $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	wildbot $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	wildbot $00, $00, $33, $21, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2e33:
IF DEF(SUN)
	wildbot $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $33, $21, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	wildbot $00, $00, $33, $21, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2e79:
	wildbot $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
IF DEF(STAR)
	wildbot $00, $00, $33, $21, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	wildbot $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	wildbot $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	wildbot $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2ebf:: ; a2ebf
	ld a, [wSaveFileExists]
	or a
	jp nz, .asm_a2ed5
	ld a, $03
	scall Random
	ld [wc7dd], a
	ld a, [wc7de]
	inc a
	ld [wc7de], a
.asm_a2ed5:
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a2ee5
	ld e, $01
	ld hl, $005f
	scall EventFlagAction
.asm_a2ee5:
	ld a, $03
	scall Func_80d01
	ld a, [wc7de]
	cp $1e
	jp z, .asm_a2fba
	cp $1d
	jp z, .asm_a2fba
	cp $1c
	jp z, .asm_a2fba
	cp $1b
	jp z, .asm_a2fba
	cp $1a
	jp z, .asm_a2fba
	cp $19
	jp z, .asm_a2faf
	cp $18
	jp z, .asm_a2faf
	cp $17
	jp z, .asm_a2faf
	cp $16
	jp z, .asm_a2faf
	cp $15
	jp z, .asm_a2faf
	cp $14
	jp z, .asm_a2fa4
	cp $13
	jp z, .asm_a2fa4
	cp $12
	jp z, .asm_a2fa4
	cp $11
	jp z, .asm_a2fa4
	cp $10
	jp z, .asm_a2fa4
	cp $0f
	jp z, .asm_a2f99
	cp $0e
	jp z, .asm_a2f99
	cp $0d
	jp z, .asm_a2f99
	cp $0c
	jp z, .asm_a2f99
	cp $0b
	jp z, .asm_a2f99
	cp $0a
	jp z, .asm_a2f8e
	cp $09
	jp z, .asm_a2f8e
	cp $08
	jp z, .asm_a2f8e
	cp $07
	jp z, .asm_a2f8e
	cp $06
	jp z, .asm_a2f8e
	cp $05
	jp z, .asm_a2f83
	cp $04
	jp z, .asm_a2f83
	cp $03
	jp z, .asm_a2f83
	cp $02
	jp z, .asm_a2f83
	cp $01
	jp nz, .asm_a2fc5
.asm_a2f83:
	ld e, $05
	ld hl, Data_a2cd5
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2f8e:
	ld e, $05
	ld hl, Data_a2d1b
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2f99:
	ld e, $05
	ld hl, Data_a2d61
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2fa4:
	ld e, $05
	ld hl, Data_a2da7
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2faf:
	ld e, $05
	ld hl, Data_a2ded
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2fba:
	ld e, $05
	ld hl, Data_a2e33
	scall LoadEncounters
	jp .asm_a2fcd
.asm_a2fc5:
IF DEF(SUN)
	ld e, $05
ELIF DEF(STAR)
	ld e, $0a
ENDC
	ld hl, Data_a2e79
	scall LoadEncounters
.asm_a2fcd:
	ld a, [wc7de]
	inc a
	cp $24
	jp nc, .asm_a300d
	call Func_a304a
	ld hl, Func_a304a
	scall Func_80f11
	ld a, $04
	scall Random
	ld l, a
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
	push hl
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_a2c51
	add hl, de
	pop de
	add hl, de
	ld e, $01
	scall LoadWarps
.asm_a300d:
	ld e, $01
	ld hl, Data_a2c46
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld a, [wc7de]
	cp $23
	jp nz, .asm_a302e
	ld hl, $00f8
	scall PrintTextStandard
	jp .asm_a3037
.asm_a302e:
	ld hl, wc7de
	ld l, [hl]
	ld h, $00
	scall Func_80f83
.asm_a3037:
	ret

Data_a3038:
	db $00, $0e, $01, $01, $01, $1c
	db $00, $0e, $01, $01, $16, $0a
	db $00, $0e, $01, $01, $25, $01

Func_a304a:
	ld hl, wc7dd
	ld l, [hl]
	ld h, $00
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_a3038
	add hl, de
	scall Func_80d9b
	scall Func_80f02
	ret

Data_a3060:
	warpdef $0b, $0c, $01, $01, MAP_19_31, $0b, $0c, $0a, $0c, $2e

Data_a306b:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $14, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $14, $17, $46, $1f, $17, $11, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3095:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3137, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3197, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a31f7, NULL

Data_a30bf:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a30cd:: ; a30cd
	ld e, $01
	ld hl, Data_a3060
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a306b
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00c8
	scall CheckEventFlag
	or a
	jp z, .asm_a3105
	ld hl, $00c9
	scall CheckEventFlag
	or a
	jp z, .asm_a3105
	ld hl, $00ca
	scall CheckEventFlag
	or a
	jp nz, .asm_a3125
.asm_a3105:
	ld e, $00
	ld hl, $00c8
	scall EventFlagAction
	ld e, $00
	ld hl, $00c9
	scall EventFlagAction
	ld e, $00
	ld hl, $00ca
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3095
	scall LoadMapObjects
.asm_a3125:
	ld e, $01
	ld hl, Data_a30bf
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $041c
	scall LandmarkSign
	ret

Func_a3137:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3156
	cp $01
	jp nz, .asm_a3195
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3153
	ld a, $01
	ld [wc7c4], a
.asm_a3153:
	jp .asm_a3195
.asm_a3156:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3195
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00c8
	scall EventFlagAction
	ld hl, $00c9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3195
	ld hl, $00ca
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3195
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a3195:
	pop bc
	ret

Func_a3197:
	push af
	ld a, e
	cp $03
	jp z, .asm_a31b6
	cp $01
	jp nz, .asm_a31f5
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a31b3
	ld a, $01
	ld [wc7c4], a
.asm_a31b3:
	jp .asm_a31f5
.asm_a31b6:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a31f5
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00c9
	scall EventFlagAction
	ld hl, $00c8
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a31f5
	ld hl, $00ca
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a31f5
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a31f5:
	pop bc
	ret

Func_a31f7:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3216
	cp $01
	jp nz, .asm_a3255
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3213
	ld a, $01
	ld [wc7c4], a
.asm_a3213:
	jp .asm_a3255
.asm_a3216:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3255
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ca
	scall EventFlagAction
	ld hl, $00c8
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3255
	ld hl, $00c9
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3255
	ld e, $01
	ld hl, $00d1
	scall EventFlagAction
.asm_a3255:
	pop bc
	ret

Data_a3257:
	warpdef $0b, $0c, $01, $01, MAP_19_30, $0b, $0c, $0a, $0c, $2e
	warpdef $0e, $0c, $01, $01, MAP_19_32, $0e, $0c, $0d, $0c, $2e

Data_a326d:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3297:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3339, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3399, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a33f9, NULL

Data_a32c1:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a32cf:: ; a32cf
	ld e, $02
	ld hl, Data_a3257
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a326d
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00cb
	scall CheckEventFlag
	or a
	jp z, .asm_a3307
	ld hl, $00cc
	scall CheckEventFlag
	or a
	jp z, .asm_a3307
	ld hl, $00cd
	scall CheckEventFlag
	or a
	jp nz, .asm_a3327
.asm_a3307:
	ld e, $00
	ld hl, $00cb
	scall EventFlagAction
	ld e, $00
	ld hl, $00cc
	scall EventFlagAction
	ld e, $00
	ld hl, $00cd
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3297
	scall LoadMapObjects
.asm_a3327:
	ld e, $01
	ld hl, Data_a32c1
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $03ee
	scall LandmarkSign
	ret
Func_a3339:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3358
	cp $01
	jp nz, .asm_a3397
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3355
	ld a, $01
	ld [wc7c4], a
.asm_a3355:
	jp .asm_a3397
.asm_a3358:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3397
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cb
	scall EventFlagAction
	ld hl, $00cc
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3397
	ld hl, $00cd
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3397
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a3397:
	pop bc
	ret
Func_a3399:
	push af
	ld a, e
	cp $03
	jp z, .asm_a33b8
	cp $01
	jp nz, .asm_a33f7
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a33b5
	ld a, $01
	ld [wc7c4], a
.asm_a33b5:
	jp .asm_a33f7
.asm_a33b8:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a33f7
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cc
	scall EventFlagAction
	ld hl, $00cb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a33f7
	ld hl, $00cd
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a33f7
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a33f7:
	pop bc
	ret
Func_a33f9:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3418
	cp $01
	jp nz, .asm_a3457
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3415
	ld a, $01
	ld [wc7c4], a
.asm_a3415:
	jp .asm_a3457
.asm_a3418:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3457
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cd
	scall EventFlagAction
	ld hl, $00cb
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3457
	ld hl, $00cc
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3457
	ld e, $01
	ld hl, $00d2
	scall EventFlagAction
.asm_a3457:
	pop bc
	ret

Data_a3459:
	warpdef $0b, $0c, $01, $01, MAP_19_33, $0b, $11, $0a, $11, $2e
	warpdef $0e, $0c, $01, $01, MAP_19_31, $0e, $0c, $0d, $0c, $2e

Data_a346f:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3499:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a353b, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a359b, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a35fb, NULL

Data_a34c3:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a34d1:: ; a34d1
	ld e, $02
	ld hl, Data_a3459
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a346f
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	ld hl, $00ce
	scall CheckEventFlag
	or a
	jp z, .asm_a3509
	ld hl, $00cf
	scall CheckEventFlag
	or a
	jp z, .asm_a3509
	ld hl, $00d0
	scall CheckEventFlag
	or a
	jp nz, .asm_a3529
.asm_a3509:
	ld e, $00
	ld hl, $00ce
	scall EventFlagAction
	ld e, $00
	ld hl, $00cf
	scall EventFlagAction
	ld e, $00
	ld hl, $00d0
	scall EventFlagAction
	ld e, $03
	ld hl, Data_a3499
	scall LoadMapObjects
.asm_a3529:
	ld e, $01
	ld hl, Data_a34c3
	scall LoadMapObjects
	scall Func_8001c
	ld hl, $034a
	scall LandmarkSign
	ret

Func_a353b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a355a
	cp $01
	jp nz, .asm_a3599
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3557
	ld a, $01
	ld [wc7c4], a
.asm_a3557:
	jp .asm_a3599
.asm_a355a:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3599
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00ce
	scall EventFlagAction
	ld hl, $00cf
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3599
	ld hl, $00d0
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3599
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a3599:
	pop bc
	ret

Func_a359b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a35ba
	cp $01
	jp nz, .asm_a35f9
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a35b7
	ld a, $01
	ld [wc7c4], a
.asm_a35b7:
	jp .asm_a35f9
.asm_a35ba:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a35f9
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00cf
	scall EventFlagAction
	ld hl, $00ce
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a35f9
	ld hl, $00d0
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a35f9
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a35f9:
	pop bc
	ret

Func_a35fb:
	push af
	ld a, e
	cp $03
	jp z, .asm_a361a
	cp $01
	jp nz, .asm_a3659
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3617
	ld a, $01
	ld [wc7c4], a
.asm_a3617:
	jp .asm_a3659
.asm_a361a:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3659
	ld a, $2b
	scall PlaySFX
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	ld e, $01
	ld hl, $00d0
	scall EventFlagAction
	ld hl, $00ce
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3659
	ld hl, $00cf
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3659
	ld e, $01
	ld hl, $00d3
	scall EventFlagAction
.asm_a3659:
	pop bc
	ret

Data_a365b:
	warpdef $0b, $11, $01, $01, MAP_19_32, $0b, $0c, $0a, $0c, $2e
	warpdef $01, $04, $01, $01, MAP_19_37, $01, $0d, $02, $0d, $2e
	warpdef $03, $17, $03, $01, MAP_09_00, $0b, $21, $0b, $22, $2e

Data_a367c:
IF DEF(SUN)
	wildbot $03, $0d, $0a, $0a, $5f, $12, $14, $77, $05, $06, $00, $03, $0a, $00
	wildbot $03, $0d, $0a, $0a, $50, $12, $14, $77, $14, $14, $00, $0c, $09, $00
	wildbot $03, $0d, $0a, $0a, $34, $13, $15, $17, $17, $05, $1e, $03, $08, $00
	wildbot $00, $03, $09, $08, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $09, $08, $34, $16, $18, $17, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $09, $08, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $09, $08, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $03, $0d, $0a, $0a, $50, $12, $14, $77, $14, $14, $00, $0c, $09, $00
	wildbot $03, $0d, $0a, $0a, $57, $12, $14, $46, $1f, $17, $11, $0d, $04, $00
	wildbot $03, $0d, $0a, $0a, $26, $13, $15, $5b, $01, $00, $00, $03, $08, $00
	wildbot $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $09, $08, $57, $15, $17, $46, $1f, $17, $11, $0f, $04, $00
	wildbot $00, $03, $09, $08, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $09, $08, $5f, $16, $18, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $09, $08, $2a, $17, $19, $10, $05, $05, $05, $04, $0a, $00
ENDC

Func_a36ec:: ; a36ec
	call Func_a3730
	ld hl, Func_a3730
	scall Func_80f11
	ld e, $03
	ld hl, Data_a365b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $08
	ld hl, Data_a367c
	scall LoadEncounters
	ld a, $01
	scall LoadPlayerSprite
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $02a9
	scall LandmarkSign
	ret

Data_a371e:
	db $0a, $0b, $03, $01, $03, $0c

Data_a3724:
	db $0a, $0b, $03, $01, $03, $0b

Data_a372a:
	db $0a, $0b, $03, $01, $03, $0a

Func_a3730:
	ld hl, $00d1
	scall CheckEventFlag
	cp $01
	jp z, .asm_a3751
	ld hl, $00d2
	scall CheckEventFlag
	cp $01
	jp z, .asm_a3751
	ld hl, $00d3
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3787
.asm_a3751:
	ld hl, $00d1
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3762
	ld hl, Data_a371e
	scall Func_80d9b
.asm_a3762:
	ld hl, $00d2
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3773
	ld hl, Data_a3724
	scall Func_80d9b
.asm_a3773:
	ld hl, $00d3
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3784
	ld hl, Data_a372a
	scall Func_80d9b
.asm_a3784:
	scall Func_80f02
.asm_a3787:
	ret

Func_a3788:: ; a3788
	ret

Func_a3789:: ; a3789
	ret

Func_a378a:: ; a378a
	ret

Data_a378b:
	warpdef $01, $0d, $01, $01, MAP_19_33, $01, $04, $02, $04, $2e
	warpdef $0b, $0d, $01, $01, MAP_19_38, $0b, $0d, $0a, $0d, $2e
	warpdef $06, $02, $01, $01, MAP_19_11, $02, $1b, $02, $1a, $2e

Data_a37ac:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0d, $0c, $34, $16, $18, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0d, $0c, $57, $15, $17, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $0d, $0c, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $5f, $16, $18, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $2a, $17, $19, $10, $05, $05, $05, $04, $02, $00
ENDC

Data_a37f2:
	person_event $ff, $00, $00, $04, $01, $01, $00, $04, $01, Func_a38b8, NULL
	person_event $ff, $00, $01, $08, $01, $01, $00, $04, $01, Func_a38e9, NULL
	person_event $ff, $00, $02, $0a, $01, $01, $00, $04, $01, Func_a391a, NULL
	person_event $ff, $00, $04, $0c, $01, $01, $00, $04, $01, Func_a394b, NULL
	person_event $ff, $00, $05, $05, $01, $01, $00, $04, $01, Func_a397c, NULL
	person_event $ff, $00, $05, $07, $01, $01, $00, $04, $01, Func_a39ad, NULL
	person_event $ff, $00, $06, $0a, $01, $01, $00, $04, $01, Func_a39de, NULL
	person_event $ff, $00, $07, $04, $01, $01, $00, $04, $01, Func_a3a0f, NULL
	person_event $ff, $00, $07, $0c, $01, $01, $00, $04, $01, Func_a3a40, NULL
	person_event $ff, $00, $09, $07, $01, $01, $00, $04, $01, Func_a3a71, NULL
	person_event $ff, $00, $0a, $0a, $01, $01, $00, $04, $01, Func_a3aa2, NULL

Func_a388c:: ; a388c
	ld e, $03
	ld hl, Data_a378b
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a37ac
	scall LoadEncounters
	ld e, $0b
	ld hl, Data_a37f2
	scall LoadMapObjects
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $041e
	scall LandmarkSign
	ret

Func_a38b8:
	ld a, e
	cp $02
	jp nz, .asm_a38e8
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
	ld c, $00
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a38e8:
	ret

Func_a38e9:
	ld a, e
	cp $02
	jp nz, .asm_a3919
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
	ld l, $08
	push hl
	ld c, $01
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3919:
	ret

Func_a391a:
	ld a, e
	cp $02
	jp nz, .asm_a394a
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
	ld l, $0a
	push hl
	ld c, $02
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a394a:
	ret

Func_a394b:
	ld a, e
	cp $02
	jp nz, .asm_a397b
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
	ld l, $0c
	push hl
	ld c, $04
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a397b:
	ret

Func_a397c:
	ld a, e
	cp $02
	jp nz, .asm_a39ac
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
	ld l, $05
	push hl
	ld c, $05
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a39ac:
	ret

Func_a39ad:
	ld a, e
	cp $02
	jp nz, .asm_a39dd
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
	ld l, $07
	push hl
	ld c, $05
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a39dd:
	ret

Func_a39de:
	ld a, e
	cp $02
	jp nz, .asm_a3a0e
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
	ld l, $0a
	push hl
	ld c, $06
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a0e:
	ret

Func_a3a0f:
	ld a, e
	cp $02
	jp nz, .asm_a3a3f
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
	ld c, $07
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a3f:
	ret

Func_a3a40:
	ld a, e
	cp $02
	jp nz, .asm_a3a70
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
	ld l, $0c
	push hl
	ld c, $07
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3a70:
	ret

Func_a3a71:
	ld a, e
	cp $02
	jp nz, .asm_a3aa1
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
	ld l, $07
	push hl
	ld c, $09
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3aa1:
	ret

Func_a3aa2:
	ld a, e
	cp $02
	jp nz, .asm_a3ad2
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
	ld l, $0a
	push hl
	ld c, $0a
	ld e, $26
	ld a, $13
	scall Func_80dff
	pop bc
.asm_a3ad2:
	ret

Data_a3ad3:
	warpdef $0b, $0d, $01, $01, MAP_19_37, $0b, $0d, $0a, $0d, $2e
	warpdef $01, $0d, $01, $01, MAP_19_39, $03, $21, $03, $20, $2e

Data_a3ae9:
IF DEF(SUN)
	wildbot $00, $03, $0d, $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0d, $0c, $34, $16, $18, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0d, $0c, $57, $15, $17, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $0d, $0c, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $0d, $0c, $5f, $16, $18, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $0d, $0c, $2a, $17, $19, $10, $05, $05, $05, $04, $02, $00
ENDC

Func_a3b2f:: ; a3b2f
	ld e, $02
	ld hl, Data_a3ad3
	scall LoadWarps
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a3ae9
	scall LoadEncounters
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $041f
	scall LandmarkSign
	ret

Data_a3b53:
	warpdef $03, $21, $01, $01, MAP_19_38, $01, $0d, $02, $0d, $2e

Data_a3b5e:
	db $28, $03, $05

Data_a3b61:
	db $28, $03, $05, $00, $00

Data_a3b66:
	person_event $00, $04, $02, $05, $01, $01, $03, $04, $00, Func_806dd_28, Data_a3b5e
	person_event $00, $04, $03, $1a, $01, $01, $00, $04, $00, Func_a3cd5, NULL

Data_a3b82:
IF DEF(SUN)
	wildbot $00, $03, $06, $21, $5f, $15, $19, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $06, $21, $34, $16, $1a, $18, $17, $05, $1e, $04, $08, $00
	wildbot $00, $03, $06, $21, $35, $16, $1a, $77, $17, $12, $11, $04, $06, $00
	wildbot $00, $03, $06, $21, $29, $17, $1b, $0d, $01, $01, $01, $04, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $06, $21, $57, $15, $19, $46, $1f, $17, $11, $0d, $09, $00
	wildbot $00, $03, $06, $21, $26, $16, $1a, $5b, $01, $00, $00, $04, $08, $00
	wildbot $00, $03, $06, $21, $5f, $16, $1a, $77, $05, $06, $00, $04, $06, $00
	wildbot $00, $03, $06, $21, $2a, $17, $1b, $10, $05, $05, $05, $04, $02, $00
ENDC

Func_a3bc8:: ; a3bc8
	call Func_a3c8b
	ld hl, Func_a3c8b
	scall Func_80f11
	ld e, $01
	ld hl, Data_a3b53
	scall LoadWarps
	ld e, $01
	ld hl, Data_a3b61
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	ld e, $05
	ld hl, Data_a3b82
	scall LoadEncounters
	ld e, $02
	ld hl, Data_a3b66
	scall LoadMapObjects
	ld hl, $00ec
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3c08
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
.asm_a3c08:
	ld a, $08
	scall PlayMusic
	scall Func_8001c
	ld hl, $045d
	scall LandmarkSign
	ret

Func_a3c17:: ; a3c17
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld a, $3a
	scall PlaySFX
	ld c, $01
	ld e, $01
	ld a, $0a
	scall LoadEmote
	ld a, [wc799]
	cp $02
	jp z, .asm_a3c63
	cp $01
	jp z, .asm_a3c54
	or a
	jp nz, .asm_a3c6f
	ld e, $19
	ld a, $03
	scall MoveEmote
	ld a, $01
	ld [wc799], a
	jp .asm_a3c6f
.asm_a3c54:
	ld e, $14
	ld a, $03
	scall MoveEmote
	ld a, $02
	ld [wc799], a
	jp .asm_a3c6f
.asm_a3c63:
	ld e, $0f
	ld a, $03
	scall MoveEmote
	ld a, $03
	ld [wc799], a
.asm_a3c6f:
	scall WaitEmote
	scall HideEmote
	call Func_a3c8b
	ret

Data_a3c79:
	db $02, $1b, $01, $02, $03, $18

Data_a3c7f:
	db $02, $1b, $01, $02, $03, $13

Data_a3c85:
	db $02, $1b, $01, $02, $03, $0e

Func_a3c8b:
	ld a, [wc799]
	cp $03
	jp z, .asm_a3cb5
	cp $02
	jp z, .asm_a3ca6
	cp $01
	jp nz, .asm_a3cc7
	ld hl, Data_a3c79
	scall Func_80d9b
	jp .asm_a3cc7
.asm_a3ca6:
	ld hl, Data_a3c79
	scall Func_80d9b
	ld hl, Data_a3c7f
	scall Func_80d9b
	jp .asm_a3cc7
.asm_a3cb5:
	ld hl, Data_a3c79
	scall Func_80d9b
	ld hl, Data_a3c7f
	scall Func_80d9b
	ld hl, Data_a3c85
	scall Func_80d9b
.asm_a3cc7:
	scall Func_80f02
	ret

Data_a3ccb:
	db $02, $1a, $ff, $ff

Data_a3ccf:
	db $02, $1b, $03, $1b, $ff, $ff

Func_a3cd5:
	ld a, e
	or a
	jp nz, .asm_a3d72
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_a3cf6
	ld c, $01
	ld de, Data_a3ccf
	ld a, $28
	scall MovePlayer
	scall WaitNPCStep
	xor a
	scall PlayerFace
	jp .asm_a3cf6
.asm_a3cf6:
	ld a, $01
	scall FacePlayer
	ld a, [wc790]
	cp $05
	jp nc, .asm_a3d51
	ld a, $2e
	scall Func_80e5d
	cp $01
	jp nz, .asm_a3d51
	ld hl, $00ec
	scall CheckEventFlag
	or a
	jp nz, .asm_a3d48
	ld hl, $045c
	scall PrintTextWithNPCName
	ld hl, $001e
	scall ScriptSleep
	ld bc, Data_a3ccb
	ld e, $28
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld hl, $00ec
	scall EventFlagAction
	jp .asm_a3d4e
.asm_a3d48:
	ld hl, $010f
	scall PrintTextStandard
.asm_a3d4e:
	jp .asm_a3d72
.asm_a3d51:
	ld hl, $00ec
	scall CheckEventFlag
	cp $01
	jp nz, .asm_a3d65
	ld hl, $010f
	scall PrintTextStandard
	jp .asm_a3d72
.asm_a3d65:
	ld hl, $045b
	scall PrintTextWithNPCName
	ld e, $00
	ld a, $01
	scall SpriteFace
.asm_a3d72:
	ret

Data_a3d73:
	warpdef $04, $0c, $03, $01, MAP_19_20, $0c, $02, $0c, $03, $2e

Data_a3d7e:
IF DEF(SUN)
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
ELIF DEF(STAR)
	wildbot $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e, $05, $0a, $00
	wildbot $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a, $00
ENDC

Data_a3da8:
IF DEF(SUN)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $12, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ELIF DEF(STAR)
	person_event $19, $0c, $05, $05, $01, $01, $02, $04, $00, NULL, NULL
	person_event $2c, $0c, $05, $05, $01, $01, $02, $04, $01, NULL, NULL
ENDC

Func_a3dc4:: ; a3dc4
	ld e, $01
	ld hl, Data_a3d73
	scall LoadWarps
	ld a, $08
	scall PlayMusic
	ld a, $03
	scall Func_80d01
	ld e, $03
	ld hl, Data_a3d7e
	scall LoadEncounters
	ld hl, $00c7
	scall CheckEventFlag
	or a
	jp nz, .asm_a3e05
	ld e, $02
	ld hl, Data_a3da8
	scall LoadMapObjects
	ld a, $01
	ld [wc7da], a
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall Func_8001c
	call Func_a3e3c
	jp .asm_a3e08
.asm_a3e05:
	scall Func_8001c
.asm_a3e08:
	ret

Data_a3e09:
	db $05, $06, $ff, $ff

Data_a3e0d:
	db $06, $07, $05, $0b, $ff, $ff

Data_a3e13:
IF DEF(SUN)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $46
	db $07, $28, $07, $07, $07, $6a, $01, $0b
ELIF DEF(STAR)
	db $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $06
	db $07, $28, $03, $03, $01, $08, $01, $0b
ENDC

Func_a3e3c:
	ld hl, $043e
	scall PrintTextWithNPCName
	xor a
	ld [wc7da], a
	scall Func_80f02
	ld hl, $001e
	scall ScriptSleep
	ld c, $01
	ld de, Data_a3e09
	ld a, $28
	scall MovePlayer
	scall WaitNPCStep
	ld de, Data_a3f51
	ld hl, Data_a3e13
	scall ScriptedBattle
	or a
	jp nz, label_a3e6a
	ret
label_a3e6a:
	ld hl, $043f
	scall PrintTextWithNPCName
	xor a
	scall PlayMusic
	ld a, $18
	scall PlayMusic
	ld bc, Data_a3e0d
	ld e, $28
	xor a
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	xor a
	scall SetPersonVisibilityState
	ld a, $12
	scall PlayMusic
	ld hl, $003c
	scall ScriptSleep
	ld c, $01
	ld e, $01
	ld a, $05
	scall LoadEmote
	ld e, $06
	ld a, $05
	scall MoveEmote
	ld a, $28
	scall PlaySFX
	scall WaitEmote
	scall HideEmote
	ld hl, $001e
	scall ScriptSleep
	ld a, $5e
	scall PlaySFX
	ld c, $02
	ld e, $02
	ld a, $08
	scall LoadEmote
	ld e, $05
	ld a, $05
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	ld a, $28
	scall PlaySFX
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $60
	scall PlaySFX
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $03
	ld a, $01
	scall SpriteFace
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SpriteFace
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld bc, Data_a3e09
	ld e, $28
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ld a, $2a
	scall PlaySFX
	ld hl, $0440
	scall PrintTextStandard
	ld c, $28
	ld e, $00
IF DEF(SUN)
	ld a, $95
ELIF DEF(STAR)
	ld a, $96
ENDC
	scall GiveRobot
	cp $ff
	jp nz, label_a3f48
label_a3f48:
	ld e, $01
	ld hl, $00c7
	scall EventFlagAction
	ret

Data_a3f51:
	dstr "(なそﾞのしﾞんふﾞつ)"

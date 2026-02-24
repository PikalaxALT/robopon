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
	ld a, [wc790] ; A14EF (28:54ef) -> FA 90 C7
	or a ; A14F2 (28:54f2) -> B7
	jp z, .asm_a1507 ; A14F3 (28:54f3) -> CA 07 55
	ld a, [wc790] ; A14F6 (28:54f6) -> FA 90 C7
	cp $07 ; A14F9 (28:54f9) -> FE 07
	jp nc, .asm_a1507 ; A14FB (28:54fb) -> D2 07 55
	ld hl, Data_a14e9 ; A14FE (28:54fe) -> 21 E9 54
	scall Func_80d9b ; A1501 (28:5501) -> CD 9B 4D
	scall Func_80f02 ; A1504 (28:5504) -> CD 02 4F
.asm_a1507:
	ret  ; A1507 (28:5507) -> C9

Func_a1508:
	ld a, e ; A1508 (28:5508) -> 7B
	cp $02 ; A1509 (28:5509) -> FE 02
	jp nz, .asm_a1513 ; A150B (28:550b) -> C2 13 55
	ld a, $0d ; A150E (28:550e) -> 3E 0D
	ld [wc78a], a ; A1510 (28:5510) -> EA 8A C7
.asm_a1513:
	ret  ; A1513 (28:5513) -> C9

Func_a1514:
	ld a, e ; A1514 (28:5514) -> 7B
	or a ; A1515 (28:5515) -> B7
	jp nz, .asm_a161b ; A1516 (28:5516) -> C2 1B 56
	ld hl, $00dd ; A1519 (28:5519) -> 21 DD 00
	scall CheckEventFlag ; A151C (28:551c) -> CD 2E 46
	or a ; A151F (28:551f) -> B7
	jp nz, .asm_a1615 ; A1520 (28:5520) -> C2 15 56
	ld a, $5e ; A1523 (28:5523) -> 3E 5E
	scall PlaySFX ; A1525 (28:5525) -> CD FE 4E
	ld c, $02 ; A1528 (28:5528) -> 0E 02
	ld e, $02 ; A152A (28:552a) -> 1E 02
	ld a, $08 ; A152C (28:552c) -> 3E 08
	scall LoadEmote ; A152E (28:552e) -> CD 76 41
	ld e, $08 ; A1531 (28:5531) -> 1E 08
	ld a, $0c ; A1533 (28:5533) -> 3E 0C
	scall MoveEmote ; A1535 (28:5535) -> CD E4 41
	scall WaitEmote ; A1538 (28:5538) -> CD D5 41
	scall HideEmote ; A153B (28:553b) -> CD 8B 41
	ld a, $28 ; A153E (28:553e) -> 3E 28
	scall PlaySFX ; A1540 (28:5540) -> CD FE 4E
	ld e, $01 ; A1543 (28:5543) -> 1E 01
	ld a, $07 ; A1545 (28:5545) -> 3E 07
	scall SetPersonVisibilityState ; A1547 (28:5547) -> CD 3D 41
	ld a, $60 ; A154A (28:554a) -> 3E 60
	scall PlaySFX ; A154C (28:554c) -> CD FE 4E
	ld e, $03 ; A154F (28:554f) -> 1E 03
	ld a, $07 ; A1551 (28:5551) -> 3E 07
	scall SpriteFace ; A1553 (28:5553) -> CD 95 40
	ld e, $00 ; A1556 (28:5556) -> 1E 00
	ld a, $07 ; A1558 (28:5558) -> 3E 07
	scall SpriteFace ; A155A (28:555a) -> CD 95 40
	ld e, $01 ; A155D (28:555d) -> 1E 01
	ld a, $07 ; A155F (28:555f) -> 3E 07
	scall SpriteFace ; A1561 (28:5561) -> CD 95 40
	ld e, $02 ; A1564 (28:5564) -> 1E 02
	ld a, $07 ; A1566 (28:5566) -> 3E 07
	scall SpriteFace ; A1568 (28:5568) -> CD 95 40
	ld e, $03 ; A156B (28:556b) -> 1E 03
	ld a, $07 ; A156D (28:556d) -> 3E 07
	scall SpriteFace ; A156F (28:556f) -> CD 95 40
	ld e, $00 ; A1572 (28:5572) -> 1E 00
	ld a, $07 ; A1574 (28:5574) -> 3E 07
	scall SpriteFace ; A1576 (28:5576) -> CD 95 40
	ld e, $01 ; A1579 (28:5579) -> 1E 01
	ld a, $07 ; A157B (28:557b) -> 3E 07
	scall SpriteFace ; A157D (28:557d) -> CD 95 40
	ld e, $02 ; A1580 (28:5580) -> 1E 02
	ld a, $07 ; A1582 (28:5582) -> 3E 07
	scall SpriteFace ; A1584 (28:5584) -> CD 95 40
	ld a, $0f ; A1587 (28:5587) -> 3E 0F
	scall FadeOutAudio ; A1589 (28:5589) -> CD F1 4F
	xor a ; A158C (28:558c) -> AF
	scall PlayMusic ; A158D (28:558d) -> CD E6 4E
	ld a, $01 ; A1590 (28:5590) -> 3E 01
	scall FadeInAudio ; A1592 (28:5592) -> CD 1A 50
	ld a, $14 ; A1595 (28:5595) -> 3E 14
	scall PlayMusic ; A1597 (28:5597) -> CD E6 4E
	ld a, $07 ; A159A (28:559a) -> 3E 07
	scall FacePlayer ; A159C (28:559c) -> CD 4B 44
	ld hl, $001e ; A159F (28:559f) -> 21 1E 00
	scall ScriptSleep ; A15A2 (28:55a2) -> CD 8F 46
	ld c, $11 ; A15A5 (28:55a5) -> 0E 11
	ld e, $0a ; A15A7 (28:55a7) -> 1E 0A
	ld a, $03 ; A15A9 (28:55a9) -> 3E 03
	scall Func_80e8d ; A15AB (28:55ab) -> CD 8D 4E
	ld e, $01 ; A15AE (28:55ae) -> 1E 01
	ld hl, $00dd ; A15B0 (28:55b0) -> 21 DD 00
	scall EventFlagAction ; A15B3 (28:55b3) -> CD 1B 46
	ld a, $60 ; A15B6 (28:55b6) -> 3E 60
	scall PlaySFX ; A15B8 (28:55b8) -> CD FE 4E
	ld e, $03 ; A15BB (28:55bb) -> 1E 03
	ld a, $07 ; A15BD (28:55bd) -> 3E 07
	scall SpriteFace ; A15BF (28:55bf) -> CD 95 40
	ld e, $00 ; A15C2 (28:55c2) -> 1E 00
	ld a, $07 ; A15C4 (28:55c4) -> 3E 07
	scall SpriteFace ; A15C6 (28:55c6) -> CD 95 40
	ld e, $01 ; A15C9 (28:55c9) -> 1E 01
	ld a, $07 ; A15CB (28:55cb) -> 3E 07
	scall SpriteFace ; A15CD (28:55cd) -> CD 95 40
	ld e, $02 ; A15D0 (28:55d0) -> 1E 02
	ld a, $07 ; A15D2 (28:55d2) -> 3E 07
	scall SpriteFace ; A15D4 (28:55d4) -> CD 95 40
	ld e, $03 ; A15D7 (28:55d7) -> 1E 03
	ld a, $07 ; A15D9 (28:55d9) -> 3E 07
	scall SpriteFace ; A15DB (28:55db) -> CD 95 40
	ld e, $00 ; A15DE (28:55de) -> 1E 00
	ld a, $07 ; A15E0 (28:55e0) -> 3E 07
	scall SpriteFace ; A15E2 (28:55e2) -> CD 95 40
	ld e, $01 ; A15E5 (28:55e5) -> 1E 01
	ld a, $07 ; A15E7 (28:55e7) -> 3E 07
	scall SpriteFace ; A15E9 (28:55e9) -> CD 95 40
	ld e, $02 ; A15EC (28:55ec) -> 1E 02
	ld a, $07 ; A15EE (28:55ee) -> 3E 07
	scall SpriteFace ; A15F0 (28:55f0) -> CD 95 40
	ld a, $0f ; A15F3 (28:55f3) -> 3E 0F
	scall FadeOutAudio ; A15F5 (28:55f5) -> CD F1 4F
	xor a ; A15F8 (28:55f8) -> AF
	scall PlayMusic ; A15F9 (28:55f9) -> CD E6 4E
	ld a, $01 ; A15FC (28:55fc) -> 3E 01
	scall FadeInAudio ; A15FE (28:55fe) -> CD 1A 50
	ld a, $13 ; A1601 (28:5601) -> 3E 13
	scall PlayMusic ; A1603 (28:5603) -> CD E6 4E
	ld a, $07 ; A1606 (28:5606) -> 3E 07
	scall FacePlayer ; A1608 (28:5608) -> CD 4B 44
	ld e, $00 ; A160B (28:560b) -> 1E 00
	ld a, $07 ; A160D (28:560d) -> 3E 07
	scall SetPersonVisibilityState ; A160F (28:560f) -> CD 3D 41
	jp .asm_a161b ; A1612 (28:5612) -> C3 1B 56
.asm_a1615:
	ld hl, $015c ; A1615 (28:5615) -> 21 5C 01
	scall PrintTextStandard ; A1618 (28:5618) -> CD 98 44
.asm_a161b:
	ret  ; A161B (28:561b) -> C9


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
	ld a, e ; A16F4 (28:56f4) -> 7B
	or a ; A16F5 (28:56f5) -> B7
	jp nz, .asm_a177c ; A16F6 (28:56f6) -> C2 7C 57
	ld hl, $003b ; A16F9 (28:56f9) -> 21 3B 00
	scall CheckEventFlag ; A16FC (28:56fc) -> CD 2E 46
	or a ; A16FF (28:56ff) -> B7
	jp nz, .asm_a175e ; A1700 (28:5700) -> C2 5E 57
	ld hl, $00af ; A1703 (28:5703) -> 21 AF 00
	scall PrintTextWithNPCNameAndYesNoBox ; A1706 (28:5706) -> CD CA 44
	or a ; A1709 (28:5709) -> B7
	jp nz, .asm_a1755 ; A170A (28:570a) -> C2 55 57
	push hl ; A170D (28:570d) -> E5
	push hl ; A170E (28:570e) -> E5
	ld hl, $0000 ; A170F (28:570f) -> 21 00 00
	push hl ; A1712 (28:5712) -> E5
	ld hl, $0000 ; A1713 (28:5713) -> 21 00 00
	push hl ; A1716 (28:5716) -> E5
	call AdjustMoney ; A1717 (28:5717) -> CD 7C 27
	pop bc ; A171A (28:571a) -> C1
	pop bc ; A171B (28:571b) -> C1
	ld hl, $0000 ; A171C (28:571c) -> 21 00 00
	push hl ; A171F (28:571f) -> E5
	ld hl, $03e8 ; A1720 (28:5720) -> 21 E8 03
	push hl ; A1723 (28:5723) -> E5
	call CompareStackLongs_Signed ; A1724 (28:5724) -> CD 79 35
	jp nc, .asm_a1733 ; A1727 (28:5727) -> D2 33 57
	ld hl, $00b1 ; A172A (28:572a) -> 21 B1 00
	scall PrintTextWithNPCName ; A172D (28:572d) -> CD A9 44
	jp .asm_a1752 ; A1730 (28:5730) -> C3 52 57
.asm_a1733:
	push hl ; A1733 (28:5733) -> E5
	push hl ; A1734 (28:5734) -> E5
	ld hl, $ffff ; A1735 (28:5735) -> 21 FF FF
	push hl ; A1738 (28:5738) -> E5
	ld hl, $fc18 ; A1739 (28:5739) -> 21 18 FC
	push hl ; A173C (28:573c) -> E5
	call AdjustMoney ; A173D (28:573d) -> CD 7C 27
	pop bc ; A1740 (28:5740) -> C1
	pop bc ; A1741 (28:5741) -> C1
	pop bc ; A1742 (28:5742) -> C1
	pop bc ; A1743 (28:5743) -> C1
	ld hl, $00b2 ; A1744 (28:5744) -> 21 B2 00
	scall PrintTextWithNPCName ; A1747 (28:5747) -> CD A9 44
	ld e, $01 ; A174A (28:574a) -> 1E 01
	ld hl, $003b ; A174C (28:574c) -> 21 3B 00
	scall EventFlagAction ; A174F (28:574f) -> CD 1B 46
.asm_a1752:
	jp .asm_a175b ; A1752 (28:5752) -> C3 5B 57
.asm_a1755:
	ld hl, $00b0 ; A1755 (28:5755) -> 21 B0 00
	scall PrintTextWithNPCName ; A1758 (28:5758) -> CD A9 44
.asm_a175b:
	jp .asm_a177c ; A175B (28:575b) -> C3 7C 57
.asm_a175e:
	ld a, [wc790] ; A175E (28:575e) -> FA 90 C7
	or a ; A1761 (28:5761) -> B7
	jp z, .asm_a1776 ; A1762 (28:5762) -> CA 76 57
	ld a, [wc790] ; A1765 (28:5765) -> FA 90 C7
	cp $05 ; A1768 (28:5768) -> FE 05
	jp nc, .asm_a1776 ; A176A (28:576a) -> D2 76 57
	ld hl, $010f ; A176D (28:576d) -> 21 0F 01
	scall PrintTextStandard ; A1770 (28:5770) -> CD 98 44
	jp .asm_a177c ; A1773 (28:5773) -> C3 7C 57
.asm_a1776:
	ld hl, $00bf ; A1776 (28:5776) -> 21 BF 00
	scall PrintTextWithNPCName ; A1779 (28:5779) -> CD A9 44
.asm_a177c:
	ret  ; A177C (28:577c) -> C9

Data_a177d:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $8d, $01, $8d, $04, $19, $0c, $0d, $14, $03, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_a17a6:
	ld a, e ; A17A6 (28:57a6) -> 7B
	or a ; A17A7 (28:57a7) -> B7
	jp nz, .asm_a1848 ; A17A8 (28:57a8) -> C2 48 58
	ld a, $01 ; A17AB (28:57ab) -> 3E 01
	scall FacePlayer ; A17AD (28:57ad) -> CD 4B 44
	ld hl, $003b ; A17B0 (28:57b0) -> 21 3B 00
	scall CheckEventFlag ; A17B3 (28:57b3) -> CD 2E 46
	cp $01 ; A17B6 (28:57b6) -> FE 01
	jp nz, .asm_a1842 ; A17B8 (28:57b8) -> C2 42 58
	ld hl, $0042 ; A17BB (28:57bb) -> 21 42 00
	scall CheckEventFlag ; A17BE (28:57be) -> CD 2E 46
	or a ; A17C1 (28:57c1) -> B7
	jp nz, .asm_a1839 ; A17C2 (28:57c2) -> C2 39 58
	ld hl, $003d ; A17C5 (28:57c5) -> 21 3D 00
	scall CheckEventFlag ; A17C8 (28:57c8) -> CD 2E 46
	or a ; A17CB (28:57cb) -> B7
	jp nz, .asm_a1830 ; A17CC (28:57cc) -> C2 30 58
	ld hl, $00c1 ; A17CF (28:57cf) -> 21 C1 00
	scall PrintTextWithYesNoBox ; A17D2 (28:57d2) -> CD BA 44
	or a ; A17D5 (28:57d5) -> B7
	jp nz, .asm_a1827 ; A17D6 (28:57d6) -> C2 27 58
	ld hl, $00c6 ; A17D9 (28:57d9) -> 21 C6 00
	scall PrintTextStandard ; A17DC (28:57dc) -> CD 98 44
	ld de, Data_a1849 ; A17DF (28:57df) -> 11 49 58
	ld hl, Data_a177d ; A17E2 (28:57e2) -> 21 7D 57
	scall ScriptedBattle ; A17E5 (28:57e5) -> CD D3 4D
	or a ; A17E8 (28:57e8) -> B7
	jp nz, .asm_a17ef ; A17E9 (28:57e9) -> C2 EF 57
	jp .asm_a1848 ; A17EC (28:57ec) -> C3 48 58
.asm_a17ef:
	ld hl, $00c8 ; A17EF (28:57ef) -> 21 C8 00
	scall PrintTextStandard ; A17F2 (28:57f2) -> CD 98 44
	ld a, $2a ; A17F5 (28:57f5) -> 3E 2A
	scall PlaySFX ; A17F7 (28:57f7) -> CD FE 4E
	ld hl, $00bb ; A17FA (28:57fa) -> 21 BB 00
	scall PrintTextStandard ; A17FD (28:57fd) -> CD 98 44
	ld hl, $00bc ; A1800 (28:5800) -> 21 BC 00
	scall PrintTextStandard ; A1803 (28:5803) -> CD 98 44
	ld e, $01 ; A1806 (28:5806) -> 1E 01
	ld hl, $003d ; A1808 (28:5808) -> 21 3D 00
	scall EventFlagAction ; A180B (28:580b) -> CD 1B 46
	ld e, $01 ; A180E (28:580e) -> 1E 01
	ld hl, $0042 ; A1810 (28:5810) -> 21 42 00
	scall EventFlagAction ; A1813 (28:5813) -> CD 1B 46
	ld c, $00 ; A1816 (28:5816) -> 0E 00
	ld e, $01 ; A1818 (28:5818) -> 1E 01
	ld a, $1e ; A181A (28:581a) -> 3E 1E
	scall Func_80d4d ; A181C (28:581c) -> CD 4D 4D
	ld a, $01 ; A181F (28:581f) -> 3E 01
	ld [wc78f], a ; A1821 (28:5821) -> EA 8F C7
	jp .asm_a182d ; A1824 (28:5824) -> C3 2D 58
.asm_a1827:
	ld hl, $00c7 ; A1827 (28:5827) -> 21 C7 00
	scall PrintTextStandard ; A182A (28:582a) -> CD 98 44
.asm_a182d:
	jp .asm_a1836 ; A182D (28:582d) -> C3 36 58
.asm_a1830:
	ld hl, $00b7 ; A1830 (28:5830) -> 21 B7 00
	scall PrintTextStandard ; A1833 (28:5833) -> CD 98 44
.asm_a1836:
	jp .asm_a183f ; A1836 (28:5836) -> C3 3F 58
.asm_a1839:
	ld hl, $00b5 ; A1839 (28:5839) -> 21 B5 00
	scall PrintTextStandard ; A183C (28:583c) -> CD 98 44
.asm_a183f:
	jp .asm_a1848 ; A183F (28:583f) -> C3 48 58
.asm_a1842:
	ld hl, $00c0 ; A1842 (28:5842) -> 21 C0 00
	scall PrintTextStandard ; A1845 (28:5845) -> CD 98 44
.asm_a1848:
	ret  ; A1848 (28:5848) -> C9

Data_a1849:
	dstr "(くﾞんしﾞん)"

Data_a1852:
	db $00, $00
	db $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $19, $01, $13, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c

Func_a187b:
	ld a, e ; A187B (28:587b) -> 7B
	or a ; A187C (28:587c) -> B7
	jp nz, .asm_a192b ; A187D (28:587d) -> C2 2B 59
	ld a, $02 ; A1880 (28:5880) -> 3E 02
	scall FacePlayer ; A1882 (28:5882) -> CD 4B 44
	ld hl, $003b ; A1885 (28:5885) -> 21 3B 00
	scall CheckEventFlag ; A1888 (28:5888) -> CD 2E 46
	cp $01 ; A188B (28:588b) -> FE 01
	jp nz, .asm_a1925 ; A188D (28:588d) -> C2 25 59
	ld hl, $0042 ; A1890 (28:5890) -> 21 42 00
	scall CheckEventFlag ; A1893 (28:5893) -> CD 2E 46
	or a ; A1896 (28:5896) -> B7
	jp nz, .asm_a191c ; A1897 (28:5897) -> C2 1C 59
	ld hl, $003e ; A189A (28:589a) -> 21 3E 00
	scall CheckEventFlag ; A189D (28:589d) -> CD 2E 46
	or a ; A18A0 (28:58a0) -> B7
	jp nz, .asm_a1913 ; A18A1 (28:58a1) -> C2 13 59
	ld hl, $00c2 ; A18A4 (28:58a4) -> 21 C2 00
	scall PrintTextWithYesNoBox ; A18A7 (28:58a7) -> CD BA 44
	or a ; A18AA (28:58aa) -> B7
	jp nz, .asm_a190a ; A18AB (28:58ab) -> C2 0A 59
	ld hl, $00c6 ; A18AE (28:58ae) -> 21 C6 00
	scall PrintTextStandard ; A18B1 (28:58b1) -> CD 98 44
	ld hl, $015e ; A18B4 (28:58b4) -> 21 5E 01
	scall PrintTextStandard ; A18B7 (28:58b7) -> CD 98 44
.asm_a18ba:
	ld de, Data_a192c ; A18BA (28:58ba) -> 11 2C 59
	ld hl, Data_a1852 ; A18BD (28:58bd) -> 21 52 58
	scall Func_803f5 ; A18C0 (28:58c0) -> CD F4 43
	or a ; A18C3 (28:58c3) -> B7
	jp nz, .asm_a18d2 ; A18C4 (28:58c4) -> C2 D2 58
	ld a, [wc7c4] ; A18C7 (28:58c7) -> FA C4 C7
	cp $01 ; A18CA (28:58ca) -> FE 01
	jp nz, .asm_a18ba ; A18CC (28:58cc) -> C2 BA 58
	jp .asm_a192b ; A18CF (28:58cf) -> C3 2B 59
.asm_a18d2:
	ld hl, $00c8 ; A18D2 (28:58d2) -> 21 C8 00
	scall PrintTextStandard ; A18D5 (28:58d5) -> CD 98 44
	ld a, $2a ; A18D8 (28:58d8) -> 3E 2A
	scall PlaySFX ; A18DA (28:58da) -> CD FE 4E
	ld hl, $00b6 ; A18DD (28:58dd) -> 21 B6 00
	scall PrintTextStandard ; A18E0 (28:58e0) -> CD 98 44
	ld hl, $00bc ; A18E3 (28:58e3) -> 21 BC 00
	scall PrintTextStandard ; A18E6 (28:58e6) -> CD 98 44
	ld e, $01 ; A18E9 (28:58e9) -> 1E 01
	ld hl, $003e ; A18EB (28:58eb) -> 21 3E 00
	scall EventFlagAction ; A18EE (28:58ee) -> CD 1B 46
	ld e, $01 ; A18F1 (28:58f1) -> 1E 01
	ld hl, $0042 ; A18F3 (28:58f3) -> 21 42 00
	scall EventFlagAction ; A18F6 (28:58f6) -> CD 1B 46
	ld c, $00 ; A18F9 (28:58f9) -> 0E 00
	ld e, $01 ; A18FB (28:58fb) -> 1E 01
	ld a, $1c ; A18FD (28:58fd) -> 3E 1C
	scall Func_80d4d ; A18FF (28:58ff) -> CD 4D 4D
	ld a, $02 ; A1902 (28:5902) -> 3E 02
	ld [wc78f], a ; A1904 (28:5904) -> EA 8F C7
	jp .asm_a1910 ; A1907 (28:5907) -> C3 10 59
.asm_a190a:
	ld hl, $00c7 ; A190A (28:590a) -> 21 C7 00
	scall PrintTextStandard ; A190D (28:590d) -> CD 98 44
.asm_a1910:
	jp .asm_a1919 ; A1910 (28:5910) -> C3 19 59
.asm_a1913:
	ld hl, $00b7 ; A1913 (28:5913) -> 21 B7 00
	scall PrintTextStandard ; A1916 (28:5916) -> CD 98 44
.asm_a1919:
	jp .asm_a1922 ; A1919 (28:5919) -> C3 22 59
.asm_a191c:
	ld hl, $00b5 ; A191C (28:591c) -> 21 B5 00
	scall PrintTextStandard ; A191F (28:591f) -> CD 98 44
.asm_a1922:
	jp .asm_a192b ; A1922 (28:5922) -> C3 2B 59
.asm_a1925:
	ld hl, $00c0 ; A1925 (28:5925) -> 21 C0 00
	scall PrintTextStandard ; A1928 (28:5928) -> CD 98 44
.asm_a192b:
	ret  ; A192B (28:592b) -> C9

Data_a192c:
	dstr "(くﾞんしﾞん)"

Data_a1935:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $1f, $01, $1f, $04, $19, $17
	db $17, $17, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a195e:
	ld a, e ; A195E (28:595e) -> 7B
	or a ; A195F (28:595f) -> B7
	jp nz, .asm_a1a0e ; A1960 (28:5960) -> C2 0E 5A
	ld a, $03 ; A1963 (28:5963) -> 3E 03
	scall FacePlayer ; A1965 (28:5965) -> CD 4B 44
	ld hl, $003b ; A1968 (28:5968) -> 21 3B 00
	scall CheckEventFlag ; A196B (28:596b) -> CD 2E 46
	cp $01 ; A196E (28:596e) -> FE 01
	jp nz, .asm_a1a08 ; A1970 (28:5970) -> C2 08 5A
	ld hl, $0042 ; A1973 (28:5973) -> 21 42 00
	scall CheckEventFlag ; A1976 (28:5976) -> CD 2E 46
	or a ; A1979 (28:5979) -> B7
	jp nz, .asm_a19ff ; A197A (28:597a) -> C2 FF 59
	ld hl, $003f ; A197D (28:597d) -> 21 3F 00
	scall CheckEventFlag ; A1980 (28:5980) -> CD 2E 46
	or a ; A1983 (28:5983) -> B7
	jp nz, .asm_a19f6 ; A1984 (28:5984) -> C2 F6 59
	ld hl, $00c3 ; A1987 (28:5987) -> 21 C3 00
	scall PrintTextWithYesNoBox ; A198A (28:598a) -> CD BA 44
	or a ; A198D (28:598d) -> B7
	jp nz, .asm_a19ed ; A198E (28:598e) -> C2 ED 59
	ld hl, $00c6 ; A1991 (28:5991) -> 21 C6 00
	scall PrintTextStandard ; A1994 (28:5994) -> CD 98 44
	ld hl, $017a ; A1997 (28:5997) -> 21 7A 01
	scall PrintTextStandard ; A199A (28:599a) -> CD 98 44
.asm_a199d:
	ld de, Data_a1a0f ; A199D (28:599d) -> 11 0F 5A
	ld hl, Data_a1935 ; A19A0 (28:59a0) -> 21 35 59
	scall Func_802ef ; A19A3 (28:59a3) -> CD EF 42
	or a ; A19A6 (28:59a6) -> B7
	jp nz, .asm_a19b5 ; A19A7 (28:59a7) -> C2 B5 59
	ld a, [wc7c4] ; A19AA (28:59aa) -> FA C4 C7
	cp $01 ; A19AD (28:59ad) -> FE 01
	jp nz, .asm_a199d ; A19AF (28:59af) -> C2 9D 59
	jp .asm_a1a0e ; A19B2 (28:59b2) -> C3 0E 5A
.asm_a19b5:
	ld hl, $00c8 ; A19B5 (28:59b5) -> 21 C8 00
	scall PrintTextStandard ; A19B8 (28:59b8) -> CD 98 44
	ld a, $2a ; A19BB (28:59bb) -> 3E 2A
	scall PlaySFX ; A19BD (28:59bd) -> CD FE 4E
	ld hl, $00b8 ; A19C0 (28:59c0) -> 21 B8 00
	scall PrintTextStandard ; A19C3 (28:59c3) -> CD 98 44
	ld hl, $00bc ; A19C6 (28:59c6) -> 21 BC 00
	scall PrintTextStandard ; A19C9 (28:59c9) -> CD 98 44
	ld e, $01 ; A19CC (28:59cc) -> 1E 01
	ld hl, $003f ; A19CE (28:59ce) -> 21 3F 00
	scall EventFlagAction ; A19D1 (28:59d1) -> CD 1B 46
	ld e, $01 ; A19D4 (28:59d4) -> 1E 01
	ld hl, $0042 ; A19D6 (28:59d6) -> 21 42 00
	scall EventFlagAction ; A19D9 (28:59d9) -> CD 1B 46
	ld c, $00 ; A19DC (28:59dc) -> 0E 00
	ld e, $01 ; A19DE (28:59de) -> 1E 01
	ld a, $1d ; A19E0 (28:59e0) -> 3E 1D
	scall Func_80d4d ; A19E2 (28:59e2) -> CD 4D 4D
	ld a, $03 ; A19E5 (28:59e5) -> 3E 03
	ld [wc78f], a ; A19E7 (28:59e7) -> EA 8F C7
	jp .asm_a19f3 ; A19EA (28:59ea) -> C3 F3 59
.asm_a19ed:
	ld hl, $00c7 ; A19ED (28:59ed) -> 21 C7 00
	scall PrintTextStandard ; A19F0 (28:59f0) -> CD 98 44
.asm_a19f3:
	jp .asm_a19fc ; A19F3 (28:59f3) -> C3 FC 59
.asm_a19f6:
	ld hl, $00b7 ; A19F6 (28:59f6) -> 21 B7 00
	scall PrintTextStandard ; A19F9 (28:59f9) -> CD 98 44
.asm_a19fc:
	jp .asm_a1a05 ; A19FC (28:59fc) -> C3 05 5A
.asm_a19ff:
	ld hl, $00b5 ; A19FF (28:59ff) -> 21 B5 00
	scall PrintTextStandard ; A1A02 (28:5a02) -> CD 98 44
.asm_a1a05:
	jp .asm_a1a0e ; A1A05 (28:5a05) -> C3 0E 5A
.asm_a1a08:
	ld hl, $00c0 ; A1A08 (28:5a08) -> 21 C0 00
	scall PrintTextStandard ; A1A0B (28:5a0b) -> CD 98 44
.asm_a1a0e:
	ret  ; A1A0E (28:5a0e) -> C9

Data_a1a0f:
	dstr "(くﾞんしﾞん)"

Data_a1a18:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e
	db $04, $19, $01, $02, $03, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1a41:
	ld a, e ; A1A41 (28:5a41) -> 7B
	or a ; A1A42 (28:5a42) -> B7
	jp nz, .asm_a1af1 ; A1A43 (28:5a43) -> C2 F1 5A
	ld a, $04 ; A1A46 (28:5a46) -> 3E 04
	scall FacePlayer ; A1A48 (28:5a48) -> CD 4B 44
	ld hl, $003b ; A1A4B (28:5a4b) -> 21 3B 00
	scall CheckEventFlag ; A1A4E (28:5a4e) -> CD 2E 46
	cp $01 ; A1A51 (28:5a51) -> FE 01
	jp nz, .asm_a1aeb ; A1A53 (28:5a53) -> C2 EB 5A
	ld hl, $0042 ; A1A56 (28:5a56) -> 21 42 00
	scall CheckEventFlag ; A1A59 (28:5a59) -> CD 2E 46
	or a ; A1A5C (28:5a5c) -> B7
	jp nz, .asm_a1ae2 ; A1A5D (28:5a5d) -> C2 E2 5A
	ld hl, $0040 ; A1A60 (28:5a60) -> 21 40 00
	scall CheckEventFlag ; A1A63 (28:5a63) -> CD 2E 46
	or a ; A1A66 (28:5a66) -> B7
	jp nz, .asm_a1ad9 ; A1A67 (28:5a67) -> C2 D9 5A
	ld hl, $00c4 ; A1A6A (28:5a6a) -> 21 C4 00
	scall PrintTextWithYesNoBox ; A1A6D (28:5a6d) -> CD BA 44
	or a ; A1A70 (28:5a70) -> B7
	jp nz, .asm_a1ad0 ; A1A71 (28:5a71) -> C2 D0 5A
	ld hl, $00c6 ; A1A74 (28:5a74) -> 21 C6 00
	scall PrintTextStandard ; A1A77 (28:5a77) -> CD 98 44
	ld hl, $016b ; A1A7A (28:5a7a) -> 21 6B 01
	scall PrintTextStandard ; A1A7D (28:5a7d) -> CD 98 44
.asm_a1a80:
	ld de, Data_a1af2 ; A1A80 (28:5a80) -> 11 F2 5A
	ld hl, Data_a1a18 ; A1A83 (28:5a83) -> 21 18 5A
	scall Func_80347 ; A1A86 (28:5a86) -> CD 46 43
	or a ; A1A89 (28:5a89) -> B7
	jp nz, .asm_a1a98 ; A1A8A (28:5a8a) -> C2 98 5A
	ld a, [wc7c4] ; A1A8D (28:5a8d) -> FA C4 C7
	cp $01 ; A1A90 (28:5a90) -> FE 01
	jp nz, .asm_a1a80 ; A1A92 (28:5a92) -> C2 80 5A
	jp .asm_a1af1 ; A1A95 (28:5a95) -> C3 F1 5A
.asm_a1a98:
	ld hl, $00c8 ; A1A98 (28:5a98) -> 21 C8 00
	scall PrintTextStandard ; A1A9B (28:5a9b) -> CD 98 44
	ld a, $2a ; A1A9E (28:5a9e) -> 3E 2A
	scall PlaySFX ; A1AA0 (28:5aa0) -> CD FE 4E
	ld hl, $00ba ; A1AA3 (28:5aa3) -> 21 BA 00
	scall PrintTextStandard ; A1AA6 (28:5aa6) -> CD 98 44
	ld hl, $00bc ; A1AA9 (28:5aa9) -> 21 BC 00
	scall PrintTextStandard ; A1AAC (28:5aac) -> CD 98 44
	ld e, $01 ; A1AAF (28:5aaf) -> 1E 01
	ld hl, $0040 ; A1AB1 (28:5ab1) -> 21 40 00
	scall EventFlagAction ; A1AB4 (28:5ab4) -> CD 1B 46
	ld e, $01 ; A1AB7 (28:5ab7) -> 1E 01
	ld hl, $0042 ; A1AB9 (28:5ab9) -> 21 42 00
	scall EventFlagAction ; A1ABC (28:5abc) -> CD 1B 46
	ld c, $00 ; A1ABF (28:5abf) -> 0E 00
	ld e, $01 ; A1AC1 (28:5ac1) -> 1E 01
	ld a, $20 ; A1AC3 (28:5ac3) -> 3E 20
	scall Func_80d4d ; A1AC5 (28:5ac5) -> CD 4D 4D
	ld a, $04 ; A1AC8 (28:5ac8) -> 3E 04
	ld [wc78f], a ; A1ACA (28:5aca) -> EA 8F C7
	jp .asm_a1ad6 ; A1ACD (28:5acd) -> C3 D6 5A
.asm_a1ad0:
	ld hl, $00c7 ; A1AD0 (28:5ad0) -> 21 C7 00
	scall PrintTextStandard ; A1AD3 (28:5ad3) -> CD 98 44
.asm_a1ad6:
	jp .asm_a1adf ; A1AD6 (28:5ad6) -> C3 DF 5A
.asm_a1ad9:
	ld hl, $00b7 ; A1AD9 (28:5ad9) -> 21 B7 00
	scall PrintTextStandard ; A1ADC (28:5adc) -> CD 98 44
.asm_a1adf:
	jp .asm_a1ae8 ; A1ADF (28:5adf) -> C3 E8 5A
.asm_a1ae2:
	ld hl, $00b5 ; A1AE2 (28:5ae2) -> 21 B5 00
	scall PrintTextStandard ; A1AE5 (28:5ae5) -> CD 98 44
.asm_a1ae8:
	jp .asm_a1af1 ; A1AE8 (28:5ae8) -> C3 F1 5A
.asm_a1aeb:
	ld hl, $00c0 ; A1AEB (28:5aeb) -> 21 C0 00
	scall PrintTextStandard ; A1AEE (28:5aee) -> CD 98 44
.asm_a1af1:
	ret  ; A1AF1 (28:5af1) -> C9

Data_a1af2:
	dstr "(くﾞんしﾞん)"

Data_a1afb:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $10, $01, $10, $04, $19, $1f, $1e, $18, $02, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1b24:
	ld a, e ; A1B24 (28:5b24) -> 7B
	or a ; A1B25 (28:5b25) -> B7
	jp nz, .asm_a1bd4 ; A1B26 (28:5b26) -> C2 D4 5B
	ld a, $05 ; A1B29 (28:5b29) -> 3E 05
	scall FacePlayer ; A1B2B (28:5b2b) -> CD 4B 44
	ld hl, $003b ; A1B2E (28:5b2e) -> 21 3B 00
	scall CheckEventFlag ; A1B31 (28:5b31) -> CD 2E 46
	cp $01 ; A1B34 (28:5b34) -> FE 01
	jp nz, .asm_a1bce ; A1B36 (28:5b36) -> C2 CE 5B
	ld hl, $0042 ; A1B39 (28:5b39) -> 21 42 00
	scall CheckEventFlag ; A1B3C (28:5b3c) -> CD 2E 46
	or a ; A1B3F (28:5b3f) -> B7
	jp nz, .asm_a1bc5 ; A1B40 (28:5b40) -> C2 C5 5B
	ld hl, $0041 ; A1B43 (28:5b43) -> 21 41 00
	scall CheckEventFlag ; A1B46 (28:5b46) -> CD 2E 46
	or a ; A1B49 (28:5b49) -> B7
	jp nz, .asm_a1bbc ; A1B4A (28:5b4a) -> C2 BC 5B
	ld hl, $00c5 ; A1B4D (28:5b4d) -> 21 C5 00
	scall PrintTextWithYesNoBox ; A1B50 (28:5b50) -> CD BA 44
	or a ; A1B53 (28:5b53) -> B7
	jp nz, .asm_a1bb3 ; A1B54 (28:5b54) -> C2 B3 5B
	ld hl, $00c6 ; A1B57 (28:5b57) -> 21 C6 00
	scall PrintTextStandard ; A1B5A (28:5b5a) -> CD 98 44
	ld hl, $015d ; A1B5D (28:5b5d) -> 21 5D 01
	scall PrintTextStandard ; A1B60 (28:5b60) -> CD 98 44
.asm_a1b63:
	ld de, Data_a1bd5 ; A1B63 (28:5b63) -> 11 D5 5B
	ld hl, Data_a1afb ; A1B66 (28:5b66) -> 21 FB 5A
	scall Func_8039e ; A1B69 (28:5b69) -> CD 9D 43
	or a ; A1B6C (28:5b6c) -> B7
	jp nz, .asm_a1b7b ; A1B6D (28:5b6d) -> C2 7B 5B
	ld a, [wc7c4] ; A1B70 (28:5b70) -> FA C4 C7
	cp $01 ; A1B73 (28:5b73) -> FE 01
	jp nz, .asm_a1b63 ; A1B75 (28:5b75) -> C2 63 5B
	jp .asm_a1bd4 ; A1B78 (28:5b78) -> C3 D4 5B
.asm_a1b7b:
	ld hl, $00c8 ; A1B7B (28:5b7b) -> 21 C8 00
	scall PrintTextStandard ; A1B7E (28:5b7e) -> CD 98 44
	ld a, $2a ; A1B81 (28:5b81) -> 3E 2A
	scall PlaySFX ; A1B83 (28:5b83) -> CD FE 4E
	ld hl, $00b9 ; A1B86 (28:5b86) -> 21 B9 00
	scall PrintTextStandard ; A1B89 (28:5b89) -> CD 98 44
	ld hl, $00bc ; A1B8C (28:5b8c) -> 21 BC 00
	scall PrintTextStandard ; A1B8F (28:5b8f) -> CD 98 44
	ld e, $01 ; A1B92 (28:5b92) -> 1E 01
	ld hl, $0041 ; A1B94 (28:5b94) -> 21 41 00
	scall EventFlagAction ; A1B97 (28:5b97) -> CD 1B 46
	ld e, $01 ; A1B9A (28:5b9a) -> 1E 01
	ld hl, $0042 ; A1B9C (28:5b9c) -> 21 42 00
	scall EventFlagAction ; A1B9F (28:5b9f) -> CD 1B 46
	ld c, $00 ; A1BA2 (28:5ba2) -> 0E 00
	ld e, $01 ; A1BA4 (28:5ba4) -> 1E 01
	ld a, $1f ; A1BA6 (28:5ba6) -> 3E 1F
	scall Func_80d4d ; A1BA8 (28:5ba8) -> CD 4D 4D
	ld a, $05 ; A1BAB (28:5bab) -> 3E 05
	ld [wc78f], a ; A1BAD (28:5bad) -> EA 8F C7
	jp .asm_a1bb9 ; A1BB0 (28:5bb0) -> C3 B9 5B
.asm_a1bb3:
	ld hl, $00c7 ; A1BB3 (28:5bb3) -> 21 C7 00
	scall PrintTextStandard ; A1BB6 (28:5bb6) -> CD 98 44
.asm_a1bb9:
	jp .asm_a1bc2 ; A1BB9 (28:5bb9) -> C3 C2 5B
.asm_a1bbc:
	ld hl, $00b7 ; A1BBC (28:5bbc) -> 21 B7 00
	scall PrintTextStandard ; A1BBF (28:5bbf) -> CD 98 44
.asm_a1bc2:
	jp .asm_a1bcb ; A1BC2 (28:5bc2) -> C3 CB 5B
.asm_a1bc5:
	ld hl, $00b5 ; A1BC5 (28:5bc5) -> 21 B5 00
	scall PrintTextStandard ; A1BC8 (28:5bc8) -> CD 98 44
.asm_a1bcb:
	jp .asm_a1bd4 ; A1BCB (28:5bcb) -> C3 D4 5B
.asm_a1bce:
	ld hl, $00c0 ; A1BCE (28:5bce) -> 21 C0 00
	scall PrintTextStandard ; A1BD1 (28:5bd1) -> CD 98 44
.asm_a1bd4:
	ret  ; A1BD4 (28:5bd4) -> C9

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
	ld a, [wSaveFileExists] ; A1E57 (28:5e57) -> FA 98 C7
	or a ; A1E5A (28:5e5a) -> B7
	jp nz, .asm_a1e6d ; A1E5B (28:5e5b) -> C2 6D 5E
	ld a, $03 ; A1E5E (28:5e5e) -> 3E 03
	scall Random ; A1E60 (28:5e60) -> CD D7 4C
	ld [wc7dd], a ; A1E63 (28:5e63) -> EA DD C7
	ld a, [wc7de] ; A1E66 (28:5e66) -> FA DE C7
	inc a ; A1E69 (28:5e69) -> 3C
	ld [wc7de], a ; A1E6A (28:5e6a) -> EA DE C7
.asm_a1e6d:
	ld a, [wc7de] ; A1E6D (28:5e6d) -> FA DE C7
	cp $23 ; A1E70 (28:5e70) -> FE 23
	jp nz, .asm_a1e7d ; A1E72 (28:5e72) -> C2 7D 5E
	ld e, $01 ; A1E75 (28:5e75) -> 1E 01
	ld hl, $005f ; A1E77 (28:5e77) -> 21 5F 00
	scall EventFlagAction ; A1E7A (28:5e7a) -> CD 1B 46
.asm_a1e7d:
	ld a, $03 ; A1E7D (28:5e7d) -> 3E 03
	scall Func_80d01 ; A1E7F (28:5e7f) -> CD 01 4D
	ld a, [wc7de] ; A1E82 (28:5e82) -> FA DE C7
	cp $1e ; A1E85 (28:5e85) -> FE 1E
	jp z, .asm_a1f52 ; A1E87 (28:5e87) -> CA 52 5F
	cp $1d ; A1E8A (28:5e8a) -> FE 1D
	jp z, .asm_a1f52 ; A1E8C (28:5e8c) -> CA 52 5F
	cp $1c ; A1E8F (28:5e8f) -> FE 1C
	jp z, .asm_a1f52 ; A1E91 (28:5e91) -> CA 52 5F
	cp $1b ; A1E94 (28:5e94) -> FE 1B
	jp z, .asm_a1f52 ; A1E96 (28:5e96) -> CA 52 5F
	cp $1a ; A1E99 (28:5e99) -> FE 1A
	jp z, .asm_a1f52 ; A1E9B (28:5e9b) -> CA 52 5F
	cp $19 ; A1E9E (28:5e9e) -> FE 19
	jp z, .asm_a1f47 ; A1EA0 (28:5ea0) -> CA 47 5F
	cp $18 ; A1EA3 (28:5ea3) -> FE 18
	jp z, .asm_a1f47 ; A1EA5 (28:5ea5) -> CA 47 5F
	cp $17 ; A1EA8 (28:5ea8) -> FE 17
	jp z, .asm_a1f47 ; A1EAA (28:5eaa) -> CA 47 5F
	cp $16 ; A1EAD (28:5ead) -> FE 16
	jp z, .asm_a1f47 ; A1EAF (28:5eaf) -> CA 47 5F
	cp $15 ; A1EB2 (28:5eb2) -> FE 15
	jp z, .asm_a1f47 ; A1EB4 (28:5eb4) -> CA 47 5F
	cp $14 ; A1EB7 (28:5eb7) -> FE 14
	jp z, .asm_a1f3c ; A1EB9 (28:5eb9) -> CA 3C 5F
	cp $13 ; A1EBC (28:5ebc) -> FE 13
	jp z, .asm_a1f3c ; A1EBE (28:5ebe) -> CA 3C 5F
	cp $12 ; A1EC1 (28:5ec1) -> FE 12
	jp z, .asm_a1f3c ; A1EC3 (28:5ec3) -> CA 3C 5F
	cp $11 ; A1EC6 (28:5ec6) -> FE 11
	jp z, .asm_a1f3c ; A1EC8 (28:5ec8) -> CA 3C 5F
	cp $10 ; A1ECB (28:5ecb) -> FE 10
	jp z, .asm_a1f3c ; A1ECD (28:5ecd) -> CA 3C 5F
	cp $0f ; A1ED0 (28:5ed0) -> FE 0F
	jp z, .asm_a1f31 ; A1ED2 (28:5ed2) -> CA 31 5F
	cp $0e ; A1ED5 (28:5ed5) -> FE 0E
	jp z, .asm_a1f31 ; A1ED7 (28:5ed7) -> CA 31 5F
	cp $0d ; A1EDA (28:5eda) -> FE 0D
	jp z, .asm_a1f31 ; A1EDC (28:5edc) -> CA 31 5F
	cp $0c ; A1EDF (28:5edf) -> FE 0C
	jp z, .asm_a1f31 ; A1EE1 (28:5ee1) -> CA 31 5F
	cp $0b ; A1EE4 (28:5ee4) -> FE 0B
	jp z, .asm_a1f31 ; A1EE6 (28:5ee6) -> CA 31 5F
	cp $0a ; A1EE9 (28:5ee9) -> FE 0A
	jp z, .asm_a1f26 ; A1EEB (28:5eeb) -> CA 26 5F
	cp $09 ; A1EEE (28:5eee) -> FE 09
	jp z, .asm_a1f26 ; A1EF0 (28:5ef0) -> CA 26 5F
	cp $08 ; A1EF3 (28:5ef3) -> FE 08
	jp z, .asm_a1f26 ; A1EF5 (28:5ef5) -> CA 26 5F
	cp $07 ; A1EF8 (28:5ef8) -> FE 07
	jp z, .asm_a1f26 ; A1EFA (28:5efa) -> CA 26 5F
	cp $06 ; A1EFD (28:5efd) -> FE 06
	jp z, .asm_a1f26 ; A1EFF (28:5eff) -> CA 26 5F
	cp $05 ; A1F02 (28:5f02) -> FE 05
	jp z, .asm_a1f1b ; A1F04 (28:5f04) -> CA 1B 5F
	cp $04 ; A1F07 (28:5f07) -> FE 04
	jp z, .asm_a1f1b ; A1F09 (28:5f09) -> CA 1B 5F
	cp $03 ; A1F0C (28:5f0c) -> FE 03
	jp z, .asm_a1f1b ; A1F0E (28:5f0e) -> CA 1B 5F
	cp $02 ; A1F11 (28:5f11) -> FE 02
	jp z, .asm_a1f1b ; A1F13 (28:5f13) -> CA 1B 5F
	cp $01 ; A1F16 (28:5f16) -> FE 01
	jp nz, .asm_a1f5d ; A1F18 (28:5f18) -> C2 5D 5F
.asm_a1f1b:
	ld e, $05 ; A1F1B (28:5f1b) -> 1E 05
	ld hl, Data_a1c6d ; A1F1D (28:5f1d) -> 21 6D 5C
	scall LoadEncounters ; A1F20 (28:5f20) -> CD 24 4D
	jp .asm_a1f65 ; A1F23 (28:5f23) -> C3 65 5F
.asm_a1f26:
	ld e, $05 ; A1F26 (28:5f26) -> 1E 05
	ld hl, Data_a1cb3 ; A1F28 (28:5f28) -> 21 B3 5C
	scall LoadEncounters ; A1F2B (28:5f2b) -> CD 24 4D
	jp .asm_a1f65 ; A1F2E (28:5f2e) -> C3 65 5F
.asm_a1f31:
	ld e, $05 ; A1F31 (28:5f31) -> 1E 05
	ld hl, Data_a1cf9 ; A1F33 (28:5f33) -> 21 F9 5C
	scall LoadEncounters ; A1F36 (28:5f36) -> CD 24 4D
	jp .asm_a1f65 ; A1F39 (28:5f39) -> C3 65 5F
.asm_a1f3c:
	ld e, $05 ; A1F3C (28:5f3c) -> 1E 05
	ld hl, Data_a1d3f ; A1F3E (28:5f3e) -> 21 3F 5D
	scall LoadEncounters ; A1F41 (28:5f41) -> CD 24 4D
	jp .asm_a1f65 ; A1F44 (28:5f44) -> C3 65 5F
.asm_a1f47:
	ld e, $05 ; A1F47 (28:5f47) -> 1E 05
	ld hl, Data_a1d85 ; A1F49 (28:5f49) -> 21 85 5D
	scall LoadEncounters ; A1F4C (28:5f4c) -> CD 24 4D
	jp .asm_a1f65 ; A1F4F (28:5f4f) -> C3 65 5F
.asm_a1f52:
	ld e, $05 ; A1F52 (28:5f52) -> 1E 05
	ld hl, Data_a1dcb ; A1F54 (28:5f54) -> 21 CB 5D
	scall LoadEncounters ; A1F57 (28:5f57) -> CD 24 4D
	jp .asm_a1f65 ; A1F5A (28:5f5a) -> C3 65 5F
.asm_a1f5d:
	ld e, $05 ; A1F5D (28:5f5d) -> 1E 05
	ld hl, Data_a1e11 ; A1F5F (28:5f5f) -> 21 11 5E
	scall LoadEncounters ; A1F62 (28:5f62) -> CD 24 4D
.asm_a1f65:
	ld a, [wc7de] ; A1F65 (28:5f65) -> FA DE C7
	inc a ; A1F68 (28:5f68) -> 3C
	cp $24 ; A1F69 (28:5f69) -> FE 24
	jp nc, .asm_a1fa5 ; A1F6B (28:5f6b) -> D2 A5 5F
	call Func_a1fe2 ; A1F6E (28:5f6e) -> CD E2 5F
	ld hl, Func_a1fe2 ; A1F71 (28:5f71) -> 21 E2 5F
	scall Func_80f11 ; A1F74 (28:5f74) -> CD 11 4F
	ld a, $04 ; A1F77 (28:5f77) -> 3E 04
	scall Random ; A1F79 (28:5f79) -> CD D7 4C
	ld l, a ; A1F7C (28:5f7c) -> 6F
	ld h, $00 ; A1F7D (28:5f7d) -> 26 00
	ld e, l ; A1F7F (28:5f7f) -> 5D
	ld d, h ; A1F80 (28:5f80) -> 54
	add hl, hl ; A1F81 (28:5f81) -> 29
	ld c, l ; A1F82 (28:5f82) -> 4D
	ld b, h ; A1F83 (28:5f83) -> 44
	add hl, hl ; A1F84 (28:5f84) -> 29
	add hl, hl ; A1F85 (28:5f85) -> 29
	add hl, de ; A1F86 (28:5f86) -> 19
	add hl, bc ; A1F87 (28:5f87) -> 09
	push hl ; A1F88 (28:5f88) -> E5
	ld hl, wc7dd ; A1F89 (28:5f89) -> 21 DD C7
	ld l, [hl] ; A1F8C (28:5f8c) -> 6E
	ld h, $00 ; A1F8D (28:5f8d) -> 26 00
	add hl, hl ; A1F8F (28:5f8f) -> 29
	add hl, hl ; A1F90 (28:5f90) -> 29
	ld e, l ; A1F91 (28:5f91) -> 5D
	ld d, h ; A1F92 (28:5f92) -> 54
	add hl, hl ; A1F93 (28:5f93) -> 29
	ld c, l ; A1F94 (28:5f94) -> 4D
	ld b, h ; A1F95 (28:5f95) -> 44
	add hl, hl ; A1F96 (28:5f96) -> 29
	add hl, hl ; A1F97 (28:5f97) -> 29
	add hl, de ; A1F98 (28:5f98) -> 19
	add hl, bc ; A1F99 (28:5f99) -> 09
	ld de, Data_a1be9 ; A1F9A (28:5f9a) -> 11 E9 5B
	add hl, de ; A1F9D (28:5f9d) -> 19
	pop de ; A1F9E (28:5f9e) -> D1
	add hl, de ; A1F9F (28:5f9f) -> 19
	ld e, $01 ; A1FA0 (28:5fa0) -> 1E 01
	scall LoadWarps ; A1FA2 (28:5fa2) -> CD 3A 40
.asm_a1fa5:
	ld e, $01 ; A1FA5 (28:5fa5) -> 1E 01
	ld hl, Data_a1bde ; A1FA7 (28:5fa7) -> 21 DE 5B
	scall LoadWarps ; A1FAA (28:5faa) -> CD 3A 40
	ld a, $08 ; A1FAD (28:5fad) -> 3E 08
	scall PlayMusic ; A1FAF (28:5faf) -> CD E6 4E
	scall Func_8001c ; A1FB2 (28:5fb2) -> CD 1C 40
	ld a, [wc7de] ; A1FB5 (28:5fb5) -> FA DE C7
	cp $23 ; A1FB8 (28:5fb8) -> FE 23
	jp nz, .asm_a1fc6 ; A1FBA (28:5fba) -> C2 C6 5F
	ld hl, $00f8 ; A1FBD (28:5fbd) -> 21 F8 00
	scall PrintTextStandard ; A1FC0 (28:5fc0) -> CD 98 44
	jp .asm_a1fcf ; A1FC3 (28:5fc3) -> C3 CF 5F
.asm_a1fc6:
	ld hl, wc7de ; A1FC6 (28:5fc6) -> 21 DE C7
	ld l, [hl] ; A1FC9 (28:5fc9) -> 6E
	ld h, $00 ; A1FCA (28:5fca) -> 26 00
	scall Func_80f83 ; A1FCC (28:5fcc) -> CD 83 4F
.asm_a1fcf:
	ret  ; A1FCF (28:5fcf) -> C9

Data_a1fd0:
	db $19, $00, $01, $01, $01, $01
	db $19, $00, $01, $01, $19, $07
	db $19, $00, $01, $01, $19, $13

Func_a1fe2:
	ld hl, wc7dd ; A1FE2 (28:5fe2) -> 21 DD C7
	ld l, [hl] ; A1FE5 (28:5fe5) -> 6E
	ld h, $00 ; A1FE6 (28:5fe6) -> 26 00
	add hl, hl ; A1FE8 (28:5fe8) -> 29
	ld e, l ; A1FE9 (28:5fe9) -> 5D
	ld d, h ; A1FEA (28:5fea) -> 54
	add hl, hl ; A1FEB (28:5feb) -> 29
	add hl, de ; A1FEC (28:5fec) -> 19
	ld de, Data_a1fd0 ; A1FED (28:5fed) -> 11 D0 5F
	add hl, de ; A1FF0 (28:5ff0) -> 19
	scall Func_80d9b ; A1FF1 (28:5ff1) -> CD 9B 4D
	scall Func_80f02 ; A1FF4 (28:5ff4) -> CD 02 4F
	ret  ; A1FF7 (28:5ff7) -> C9

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
	ld a, [wSaveFileExists] ; A2271 (28:6271) -> FA 98 C7
	or a ; A2274 (28:6274) -> B7
	jp nz, .asm_a2287 ; A2275 (28:6275) -> C2 87 62
	ld a, $03 ; A2278 (28:6278) -> 3E 03
	scall Random ; A227A (28:627a) -> CD D7 4C
	ld [wc7dd], a ; A227D (28:627d) -> EA DD C7
	ld a, [wc7de] ; A2280 (28:6280) -> FA DE C7
	inc a ; A2283 (28:6283) -> 3C
	ld [wc7de], a ; A2284 (28:6284) -> EA DE C7
.asm_a2287:
	ld a, [wc7de] ; A2287 (28:6287) -> FA DE C7
	cp $23 ; A228A (28:628a) -> FE 23
	jp nz, .asm_a2297 ; A228C (28:628c) -> C2 97 62
	ld e, $01 ; A228F (28:628f) -> 1E 01
	ld hl, $005f ; A2291 (28:6291) -> 21 5F 00
	scall EventFlagAction ; A2294 (28:6294) -> CD 1B 46
.asm_a2297:
	ld a, $03 ; A2297 (28:6297) -> 3E 03
	scall Func_80d01 ; A2299 (28:6299) -> CD 01 4D
	ld a, [wc7de] ; A229C (28:629c) -> FA DE C7
	cp $1e ; A229F (28:629f) -> FE 1E
	jp z, .asm_a236c ; A22A1 (28:62a1) -> CA 6C 63
	cp $1d ; A22A4 (28:62a4) -> FE 1D
	jp z, .asm_a236c ; A22A6 (28:62a6) -> CA 6C 63
	cp $1c ; A22A9 (28:62a9) -> FE 1C
	jp z, .asm_a236c ; A22AB (28:62ab) -> CA 6C 63
	cp $1b ; A22AE (28:62ae) -> FE 1B
	jp z, .asm_a236c ; A22B0 (28:62b0) -> CA 6C 63
	cp $1a ; A22B3 (28:62b3) -> FE 1A
	jp z, .asm_a236c ; A22B5 (28:62b5) -> CA 6C 63
	cp $19 ; A22B8 (28:62b8) -> FE 19
	jp z, .asm_a2361 ; A22BA (28:62ba) -> CA 61 63
	cp $18 ; A22BD (28:62bd) -> FE 18
	jp z, .asm_a2361 ; A22BF (28:62bf) -> CA 61 63
	cp $17 ; A22C2 (28:62c2) -> FE 17
	jp z, .asm_a2361 ; A22C4 (28:62c4) -> CA 61 63
	cp $16 ; A22C7 (28:62c7) -> FE 16
	jp z, .asm_a2361 ; A22C9 (28:62c9) -> CA 61 63
	cp $15 ; A22CC (28:62cc) -> FE 15
	jp z, .asm_a2361 ; A22CE (28:62ce) -> CA 61 63
	cp $14 ; A22D1 (28:62d1) -> FE 14
	jp z, .asm_a2356 ; A22D3 (28:62d3) -> CA 56 63
	cp $13 ; A22D6 (28:62d6) -> FE 13
	jp z, .asm_a2356 ; A22D8 (28:62d8) -> CA 56 63
	cp $12 ; A22DB (28:62db) -> FE 12
	jp z, .asm_a2356 ; A22DD (28:62dd) -> CA 56 63
	cp $11 ; A22E0 (28:62e0) -> FE 11
	jp z, .asm_a2356 ; A22E2 (28:62e2) -> CA 56 63
	cp $10 ; A22E5 (28:62e5) -> FE 10
	jp z, .asm_a2356 ; A22E7 (28:62e7) -> CA 56 63
	cp $0f ; A22EA (28:62ea) -> FE 0F
	jp z, .asm_a234b ; A22EC (28:62ec) -> CA 4B 63
	cp $0e ; A22EF (28:62ef) -> FE 0E
	jp z, .asm_a234b ; A22F1 (28:62f1) -> CA 4B 63
	cp $0d ; A22F4 (28:62f4) -> FE 0D
	jp z, .asm_a234b ; A22F6 (28:62f6) -> CA 4B 63
	cp $0c ; A22F9 (28:62f9) -> FE 0C
	jp z, .asm_a234b ; A22FB (28:62fb) -> CA 4B 63
	cp $0b ; A22FE (28:62fe) -> FE 0B
	jp z, .asm_a234b ; A2300 (28:6300) -> CA 4B 63
	cp $0a ; A2303 (28:6303) -> FE 0A
	jp z, .asm_a2340 ; A2305 (28:6305) -> CA 40 63
	cp $09 ; A2308 (28:6308) -> FE 09
	jp z, .asm_a2340 ; A230A (28:630a) -> CA 40 63
	cp $08 ; A230D (28:630d) -> FE 08
	jp z, .asm_a2340 ; A230F (28:630f) -> CA 40 63
	cp $07 ; A2312 (28:6312) -> FE 07
	jp z, .asm_a2340 ; A2314 (28:6314) -> CA 40 63
	cp $06 ; A2317 (28:6317) -> FE 06
	jp z, .asm_a2340 ; A2319 (28:6319) -> CA 40 63
	cp $05 ; A231C (28:631c) -> FE 05
	jp z, .asm_a2335 ; A231E (28:631e) -> CA 35 63
	cp $04 ; A2321 (28:6321) -> FE 04
	jp z, .asm_a2335 ; A2323 (28:6323) -> CA 35 63
	cp $03 ; A2326 (28:6326) -> FE 03
	jp z, .asm_a2335 ; A2328 (28:6328) -> CA 35 63
	cp $02 ; A232B (28:632b) -> FE 02
	jp z, .asm_a2335 ; A232D (28:632d) -> CA 35 63
	cp $01 ; A2330 (28:6330) -> FE 01
	jp nz, .asm_a2377 ; A2332 (28:6332) -> C2 77 63
.asm_a2335:
	ld e, $05 ; A2335 (28:6335) -> 1E 05
	ld hl, Data_a2087 ; A2337 (28:6337) -> 21 87 60
	scall LoadEncounters ; A233A (28:633a) -> CD 24 4D
	jp .asm_a237f ; A233D (28:633d) -> C3 7F 63
.asm_a2340:
	ld e, $05 ; A2340 (28:6340) -> 1E 05
	ld hl, Data_a20cd ; A2342 (28:6342) -> 21 CD 60
	scall LoadEncounters ; A2345 (28:6345) -> CD 24 4D
	jp .asm_a237f ; A2348 (28:6348) -> C3 7F 63
.asm_a234b:
	ld e, $05 ; A234B (28:634b) -> 1E 05
	ld hl, Data_a2113 ; A234D (28:634d) -> 21 13 61
	scall LoadEncounters ; A2350 (28:6350) -> CD 24 4D
	jp .asm_a237f ; A2353 (28:6353) -> C3 7F 63
.asm_a2356:
	ld e, $05 ; A2356 (28:6356) -> 1E 05
	ld hl, Data_a2159 ; A2358 (28:6358) -> 21 59 61
	scall LoadEncounters ; A235B (28:635b) -> CD 24 4D
	jp .asm_a237f ; A235E (28:635e) -> C3 7F 63
.asm_a2361:
	ld e, $05 ; A2361 (28:6361) -> 1E 05
	ld hl, Data_a219f ; A2363 (28:6363) -> 21 9F 61
	scall LoadEncounters ; A2366 (28:6366) -> CD 24 4D
	jp .asm_a237f ; A2369 (28:6369) -> C3 7F 63
.asm_a236c:
	ld e, $05 ; A236C (28:636c) -> 1E 05
	ld hl, Data_a21e5 ; A236E (28:636e) -> 21 E5 61
	scall LoadEncounters ; A2371 (28:6371) -> CD 24 4D
	jp .asm_a237f ; A2374 (28:6374) -> C3 7F 63
.asm_a2377:
	ld e, $05 ; A2377 (28:6377) -> 1E 05
	ld hl, Data_a222b ; A2379 (28:6379) -> 21 2B 62
	scall LoadEncounters ; A237C (28:637c) -> CD 24 4D
.asm_a237f:
	ld a, [wc7de] ; A237F (28:637f) -> FA DE C7
	inc a ; A2382 (28:6382) -> 3C
	cp $24 ; A2383 (28:6383) -> FE 24
	jp nc, .asm_a23bf ; A2385 (28:6385) -> D2 BF 63
	call Func_a23fc ; A2388 (28:6388) -> CD FC 63
	ld hl, Func_a23fc ; A238B (28:638b) -> 21 FC 63
	scall Func_80f11 ; A238E (28:638e) -> CD 11 4F
	ld a, $04 ; A2391 (28:6391) -> 3E 04
	scall Random ; A2393 (28:6393) -> CD D7 4C
	ld l, a ; A2396 (28:6396) -> 6F
	ld h, $00 ; A2397 (28:6397) -> 26 00
	ld e, l ; A2399 (28:6399) -> 5D
	ld d, h ; A239A (28:639a) -> 54
	add hl, hl ; A239B (28:639b) -> 29
	ld c, l ; A239C (28:639c) -> 4D
	ld b, h ; A239D (28:639d) -> 44
	add hl, hl ; A239E (28:639e) -> 29
	add hl, hl ; A239F (28:639f) -> 29
	add hl, de ; A23A0 (28:63a0) -> 19
	add hl, bc ; A23A1 (28:63a1) -> 09
	push hl ; A23A2 (28:63a2) -> E5
	ld hl, wc7dd ; A23A3 (28:63a3) -> 21 DD C7
	ld l, [hl] ; A23A6 (28:63a6) -> 6E
	ld h, $00 ; A23A7 (28:63a7) -> 26 00
	add hl, hl ; A23A9 (28:63a9) -> 29
	add hl, hl ; A23AA (28:63aa) -> 29
	ld e, l ; A23AB (28:63ab) -> 5D
	ld d, h ; A23AC (28:63ac) -> 54
	add hl, hl ; A23AD (28:63ad) -> 29
	ld c, l ; A23AE (28:63ae) -> 4D
	ld b, h ; A23AF (28:63af) -> 44
	add hl, hl ; A23B0 (28:63b0) -> 29
	add hl, hl ; A23B1 (28:63b1) -> 29
	add hl, de ; A23B2 (28:63b2) -> 19
	add hl, bc ; A23B3 (28:63b3) -> 09
	ld de, Data_a2003 ; A23B4 (28:63b4) -> 11 03 60
	add hl, de ; A23B7 (28:63b7) -> 19
	pop de ; A23B8 (28:63b8) -> D1
	add hl, de ; A23B9 (28:63b9) -> 19
	ld e, $01 ; A23BA (28:63ba) -> 1E 01
	scall LoadWarps ; A23BC (28:63bc) -> CD 3A 40
.asm_a23bf:
	ld e, $01 ; A23BF (28:63bf) -> 1E 01
	ld hl, $5ff8 ; A23C1 (28:63c1) -> 21 F8 5F
	scall LoadWarps ; A23C4 (28:63c4) -> CD 3A 40
	ld a, $08 ; A23C7 (28:63c7) -> 3E 08
	scall PlayMusic ; A23C9 (28:63c9) -> CD E6 4E
	scall Func_8001c ; A23CC (28:63cc) -> CD 1C 40
	ld a, [wc7de] ; A23CF (28:63cf) -> FA DE C7
	cp $23 ; A23D2 (28:63d2) -> FE 23
	jp nz, .asm_a23e0 ; A23D4 (28:63d4) -> C2 E0 63
	ld hl, $00f8 ; A23D7 (28:63d7) -> 21 F8 00
	scall PrintTextStandard ; A23DA (28:63da) -> CD 98 44
	jp .asm_a23e9 ; A23DD (28:63dd) -> C3 E9 63
.asm_a23e0:
	ld hl, wc7de ; A23E0 (28:63e0) -> 21 DE C7
	ld l, [hl] ; A23E3 (28:63e3) -> 6E
	ld h, $00 ; A23E4 (28:63e4) -> 26 00
	scall Func_80f83 ; A23E6 (28:63e6) -> CD 83 4F
.asm_a23e9:
	ret  ; A23E9 (28:63e9) -> C9

Data_a23ea:
	db $22, $1f, $01, $01, $01, $13
	db $22, $1f, $01, $01, $07, $01
	db $22, $1f, $01, $01, $22, $0a

Func_a23fc:
	ld hl, wc7dd ; A23FC (28:63fc) -> 21 DD C7
	ld l, [hl] ; A23FF (28:63ff) -> 6E
	ld h, $00 ; A2400 (28:6400) -> 26 00
	add hl, hl ; A2402 (28:6402) -> 29
	ld e, l ; A2403 (28:6403) -> 5D
	ld d, h ; A2404 (28:6404) -> 54
	add hl, hl ; A2405 (28:6405) -> 29
	add hl, de ; A2406 (28:6406) -> 19
	ld de, Data_a23ea ; A2407 (28:6407) -> 11 EA 63
	add hl, de ; A240A (28:640a) -> 19
	scall Func_80d9b ; A240B (28:640b) -> CD 9B 4D
	scall Func_80f02 ; A240E (28:640e) -> CD 02 4F
	ret  ; A2411 (28:6411) -> C9

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
	ld a, [wSaveFileExists] ; A268B (28:668b) -> FA 98 C7
	or a ; A268E (28:668e) -> B7
	jp nz, .asm_a26a1 ; A268F (28:668f) -> C2 A1 66
	ld a, $03 ; A2692 (28:6692) -> 3E 03
	scall Random ; A2694 (28:6694) -> CD D7 4C
	ld [wc7dd], a ; A2697 (28:6697) -> EA DD C7
	ld a, [wc7de] ; A269A (28:669a) -> FA DE C7
	inc a ; A269D (28:669d) -> 3C
	ld [wc7de], a ; A269E (28:669e) -> EA DE C7
.asm_a26a1:
	ld a, [wc7de] ; A26A1 (28:66a1) -> FA DE C7
	cp $23 ; A26A4 (28:66a4) -> FE 23
	jp nz, .asm_a26b1 ; A26A6 (28:66a6) -> C2 B1 66
	ld e, $01 ; A26A9 (28:66a9) -> 1E 01
	ld hl, $005f ; A26AB (28:66ab) -> 21 5F 00
	scall EventFlagAction ; A26AE (28:66ae) -> CD 1B 46
.asm_a26b1:
	ld a, $03 ; A26B1 (28:66b1) -> 3E 03
	scall Func_80d01 ; A26B3 (28:66b3) -> CD 01 4D
	ld a, [wc7de] ; A26B6 (28:66b6) -> FA DE C7
	cp $1e ; A26B9 (28:66b9) -> FE 1E
	jp z, .asm_a2786 ; A26BB (28:66bb) -> CA 86 67
	cp $1d ; A26BE (28:66be) -> FE 1D
	jp z, .asm_a2786 ; A26C0 (28:66c0) -> CA 86 67
	cp $1c ; A26C3 (28:66c3) -> FE 1C
	jp z, .asm_a2786 ; A26C5 (28:66c5) -> CA 86 67
	cp $1b ; A26C8 (28:66c8) -> FE 1B
	jp z, .asm_a2786 ; A26CA (28:66ca) -> CA 86 67
	cp $1a ; A26CD (28:66cd) -> FE 1A
	jp z, .asm_a2786 ; A26CF (28:66cf) -> CA 86 67
	cp $19 ; A26D2 (28:66d2) -> FE 19
	jp z, .asm_a277b ; A26D4 (28:66d4) -> CA 7B 67
	cp $18 ; A26D7 (28:66d7) -> FE 18
	jp z, .asm_a277b ; A26D9 (28:66d9) -> CA 7B 67
	cp $17 ; A26DC (28:66dc) -> FE 17
	jp z, .asm_a277b ; A26DE (28:66de) -> CA 7B 67
	cp $16 ; A26E1 (28:66e1) -> FE 16
	jp z, .asm_a277b ; A26E3 (28:66e3) -> CA 7B 67
	cp $15 ; A26E6 (28:66e6) -> FE 15
	jp z, .asm_a277b ; A26E8 (28:66e8) -> CA 7B 67
	cp $14 ; A26EB (28:66eb) -> FE 14
	jp z, .asm_a2770 ; A26ED (28:66ed) -> CA 70 67
	cp $13 ; A26F0 (28:66f0) -> FE 13
	jp z, .asm_a2770 ; A26F2 (28:66f2) -> CA 70 67
	cp $12 ; A26F5 (28:66f5) -> FE 12
	jp z, .asm_a2770 ; A26F7 (28:66f7) -> CA 70 67
	cp $11 ; A26FA (28:66fa) -> FE 11
	jp z, .asm_a2770 ; A26FC (28:66fc) -> CA 70 67
	cp $10 ; A26FF (28:66ff) -> FE 10
	jp z, .asm_a2770 ; A2701 (28:6701) -> CA 70 67
	cp $0f ; A2704 (28:6704) -> FE 0F
	jp z, .asm_a2765 ; A2706 (28:6706) -> CA 65 67
	cp $0e ; A2709 (28:6709) -> FE 0E
	jp z, .asm_a2765 ; A270B (28:670b) -> CA 65 67
	cp $0d ; A270E (28:670e) -> FE 0D
	jp z, .asm_a2765 ; A2710 (28:6710) -> CA 65 67
	cp $0c ; A2713 (28:6713) -> FE 0C
	jp z, .asm_a2765 ; A2715 (28:6715) -> CA 65 67
	cp $0b ; A2718 (28:6718) -> FE 0B
	jp z, .asm_a2765 ; A271A (28:671a) -> CA 65 67
	cp $0a ; A271D (28:671d) -> FE 0A
	jp z, .asm_a275a ; A271F (28:671f) -> CA 5A 67
	cp $09 ; A2722 (28:6722) -> FE 09
	jp z, .asm_a275a ; A2724 (28:6724) -> CA 5A 67
	cp $08 ; A2727 (28:6727) -> FE 08
	jp z, .asm_a275a ; A2729 (28:6729) -> CA 5A 67
	cp $07 ; A272C (28:672c) -> FE 07
	jp z, .asm_a275a ; A272E (28:672e) -> CA 5A 67
	cp $06 ; A2731 (28:6731) -> FE 06
	jp z, .asm_a275a ; A2733 (28:6733) -> CA 5A 67
	cp $05 ; A2736 (28:6736) -> FE 05
	jp z, .asm_a274f ; A2738 (28:6738) -> CA 4F 67
	cp $04 ; A273B (28:673b) -> FE 04
	jp z, .asm_a274f ; A273D (28:673d) -> CA 4F 67
	cp $03 ; A2740 (28:6740) -> FE 03
	jp z, .asm_a274f ; A2742 (28:6742) -> CA 4F 67
	cp $02 ; A2745 (28:6745) -> FE 02
	jp z, .asm_a274f ; A2747 (28:6747) -> CA 4F 67
	cp $01 ; A274A (28:674a) -> FE 01
	jp nz, .asm_a2791 ; A274C (28:674c) -> C2 91 67
.asm_a274f:
	ld e, $05 ; A274F (28:674f) -> 1E 05
	ld hl, Data_a24a1 ; A2751 (28:6751) -> 21 A1 64
	scall LoadEncounters ; A2754 (28:6754) -> CD 24 4D
	jp .asm_a2799 ; A2757 (28:6757) -> C3 99 67
.asm_a275a:
	ld e, $05 ; A275A (28:675a) -> 1E 05
	ld hl, Data_a24e7 ; A275C (28:675c) -> 21 E7 64
	scall LoadEncounters ; A275F (28:675f) -> CD 24 4D
	jp .asm_a2799 ; A2762 (28:6762) -> C3 99 67
.asm_a2765:
	ld e, $05 ; A2765 (28:6765) -> 1E 05
	ld hl, Data_a252d ; A2767 (28:6767) -> 21 2D 65
	scall LoadEncounters ; A276A (28:676a) -> CD 24 4D
	jp .asm_a2799 ; A276D (28:676d) -> C3 99 67
.asm_a2770:
	ld e, $05 ; A2770 (28:6770) -> 1E 05
	ld hl, Data_a2573 ; A2772 (28:6772) -> 21 73 65
	scall LoadEncounters ; A2775 (28:6775) -> CD 24 4D
	jp .asm_a2799 ; A2778 (28:6778) -> C3 99 67
.asm_a277b:
	ld e, $05 ; A277B (28:677b) -> 1E 05
	ld hl, Data_a25b9 ; A277D (28:677d) -> 21 B9 65
	scall LoadEncounters ; A2780 (28:6780) -> CD 24 4D
	jp .asm_a2799 ; A2783 (28:6783) -> C3 99 67
.asm_a2786:
	ld e, $05 ; A2786 (28:6786) -> 1E 05
	ld hl, Data_a25ff ; A2788 (28:6788) -> 21 FF 65
	scall LoadEncounters ; A278B (28:678b) -> CD 24 4D
	jp .asm_a2799 ; A278E (28:678e) -> C3 99 67
.asm_a2791:
	ld e, $05 ; A2791 (28:6791) -> 1E 05
	ld hl, Data_a2645 ; A2793 (28:6793) -> 21 45 66
	scall LoadEncounters ; A2796 (28:6796) -> CD 24 4D
.asm_a2799:
	ld a, [wc7de] ; A2799 (28:6799) -> FA DE C7
	inc a ; A279C (28:679c) -> 3C
	cp $24 ; A279D (28:679d) -> FE 24
	jp nc, .asm_a27d9 ; A279F (28:679f) -> D2 D9 67
	call Func_a2816 ; A27A2 (28:67a2) -> CD 16 68
	ld hl, Func_a2816 ; A27A5 (28:67a5) -> 21 16 68
	scall Func_80f11 ; A27A8 (28:67a8) -> CD 11 4F
	ld a, $04 ; A27AB (28:67ab) -> 3E 04
	scall Random ; A27AD (28:67ad) -> CD D7 4C
	ld l, a ; A27B0 (28:67b0) -> 6F
	ld h, $00 ; A27B1 (28:67b1) -> 26 00
	ld e, l ; A27B3 (28:67b3) -> 5D
	ld d, h ; A27B4 (28:67b4) -> 54
	add hl, hl ; A27B5 (28:67b5) -> 29
	ld c, l ; A27B6 (28:67b6) -> 4D
	ld b, h ; A27B7 (28:67b7) -> 44
	add hl, hl ; A27B8 (28:67b8) -> 29
	add hl, hl ; A27B9 (28:67b9) -> 29
	add hl, de ; A27BA (28:67ba) -> 19
	add hl, bc ; A27BB (28:67bb) -> 09
	push hl ; A27BC (28:67bc) -> E5
	ld hl, wc7dd ; A27BD (28:67bd) -> 21 DD C7
	ld l, [hl] ; A27C0 (28:67c0) -> 6E
	ld h, $00 ; A27C1 (28:67c1) -> 26 00
	add hl, hl ; A27C3 (28:67c3) -> 29
	add hl, hl ; A27C4 (28:67c4) -> 29
	ld e, l ; A27C5 (28:67c5) -> 5D
	ld d, h ; A27C6 (28:67c6) -> 54
	add hl, hl ; A27C7 (28:67c7) -> 29
	ld c, l ; A27C8 (28:67c8) -> 4D
	ld b, h ; A27C9 (28:67c9) -> 44
	add hl, hl ; A27CA (28:67ca) -> 29
	add hl, hl ; A27CB (28:67cb) -> 29
	add hl, de ; A27CC (28:67cc) -> 19
	add hl, bc ; A27CD (28:67cd) -> 09
	ld de, Data_a241d ; A27CE (28:67ce) -> 11 1D 64
	add hl, de ; A27D1 (28:67d1) -> 19
	pop de ; A27D2 (28:67d2) -> D1
	add hl, de ; A27D3 (28:67d3) -> 19
	ld e, $01 ; A27D4 (28:67d4) -> 1E 01
	scall LoadWarps ; A27D6 (28:67d6) -> CD 3A 40
.asm_a27d9:
	ld e, $01 ; A27D9 (28:67d9) -> 1E 01
	ld hl, Data_a2412 ; A27DB (28:67db) -> 21 12 64
	scall LoadWarps ; A27DE (28:67de) -> CD 3A 40
	ld a, $08 ; A27E1 (28:67e1) -> 3E 08
	scall PlayMusic ; A27E3 (28:67e3) -> CD E6 4E
	scall Func_8001c ; A27E6 (28:67e6) -> CD 1C 40
	ld a, [wc7de] ; A27E9 (28:67e9) -> FA DE C7
	cp $23 ; A27EC (28:67ec) -> FE 23
	jp nz, .asm_a27fa ; A27EE (28:67ee) -> C2 FA 67
	ld hl, $00f8 ; A27F1 (28:67f1) -> 21 F8 00
	scall PrintTextStandard ; A27F4 (28:67f4) -> CD 98 44
	jp .asm_a2803 ; A27F7 (28:67f7) -> C3 03 68
.asm_a27fa:
	ld hl, wc7de ; A27FA (28:67fa) -> 21 DE C7
	ld l, [hl] ; A27FD (28:67fd) -> 6E
	ld h, $00 ; A27FE (28:67fe) -> 26 00
	scall Func_80f83 ; A2800 (28:6800) -> CD 83 4F
.asm_a2803:
	ret  ; A2803 (28:6803) -> C9

Data_a2804:
	db $00, $00, $01, $01, $0d, $1b
	db $00, $00, $01, $01, $1e, $1b
	db $00, $00, $01, $01, $21, $08

Func_a2816:
	ld hl, wc7dd
	ld l, [hl] ; A2819 (28:6819) -> 6E
	ld h, $00 ; A281A (28:681a) -> 26 00
	add hl, hl ; A281C (28:681c) -> 29
	ld e, l ; A281D (28:681d) -> 5D
	ld d, h ; A281E (28:681e) -> 54
	add hl, hl ; A281F (28:681f) -> 29
	add hl, de ; A2820 (28:6820) -> 19
	ld de, Data_a2804 ; A2821 (28:6821) -> 11 04 68
	add hl, de ; A2824 (28:6824) -> 19
	scall Func_80d9b ; A2825 (28:6825) -> CD 9B 4D
	scall Func_80f02 ; A2828 (28:6828) -> CD 02 4F
	ret  ; A282B (28:682b) -> C9

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
	ld a, [wSaveFileExists] ; A2AA5 (28:6aa5) -> FA 98 C7
	or a ; A2AA8 (28:6aa8) -> B7
	jp nz, .asm_a2abb ; A2AA9 (28:6aa9) -> C2 BB 6A
	ld a, $03 ; A2AAC (28:6aac) -> 3E 03
	scall Random ; A2AAE (28:6aae) -> CD D7 4C
	ld [wc7dd], a ; A2AB1 (28:6ab1) -> EA DD C7
	ld a, [wc7de] ; A2AB4 (28:6ab4) -> FA DE C7
	inc a ; A2AB7 (28:6ab7) -> 3C
	ld [wc7de], a ; A2AB8 (28:6ab8) -> EA DE C7
.asm_a2abb:
	ld a, [wc7de] ; A2ABB (28:6abb) -> FA DE C7
	cp $23 ; A2ABE (28:6abe) -> FE 23
	jp nz, .asm_a2acb ; A2AC0 (28:6ac0) -> C2 CB 6A
	ld e, $01 ; A2AC3 (28:6ac3) -> 1E 01
	ld hl, $005f ; A2AC5 (28:6ac5) -> 21 5F 00
	scall EventFlagAction ; A2AC8 (28:6ac8) -> CD 1B 46
.asm_a2acb:
	ld a, $03 ; A2ACB (28:6acb) -> 3E 03
	scall Func_80d01 ; A2ACD (28:6acd) -> CD 01 4D
	ld a, [wc7de] ; A2AD0 (28:6ad0) -> FA DE C7
	cp $1e ; A2AD3 (28:6ad3) -> FE 1E
	jp z, .asm_a2ba0 ; A2AD5 (28:6ad5) -> CA A0 6B
	cp $1d ; A2AD8 (28:6ad8) -> FE 1D
	jp z, .asm_a2ba0 ; A2ADA (28:6ada) -> CA A0 6B
	cp $1c ; A2ADD (28:6add) -> FE 1C
	jp z, .asm_a2ba0 ; A2ADF (28:6adf) -> CA A0 6B
	cp $1b ; A2AE2 (28:6ae2) -> FE 1B
	jp z, .asm_a2ba0 ; A2AE4 (28:6ae4) -> CA A0 6B
	cp $1a ; A2AE7 (28:6ae7) -> FE 1A
	jp z, .asm_a2ba0 ; A2AE9 (28:6ae9) -> CA A0 6B
	cp $19 ; A2AEC (28:6aec) -> FE 19
	jp z, .asm_a2b95 ; A2AEE (28:6aee) -> CA 95 6B
	cp $18 ; A2AF1 (28:6af1) -> FE 18
	jp z, .asm_a2b95 ; A2AF3 (28:6af3) -> CA 95 6B
	cp $17 ; A2AF6 (28:6af6) -> FE 17
	jp z, .asm_a2b95 ; A2AF8 (28:6af8) -> CA 95 6B
	cp $16 ; A2AFB (28:6afb) -> FE 16
	jp z, .asm_a2b95 ; A2AFD (28:6afd) -> CA 95 6B
	cp $15 ; A2B00 (28:6b00) -> FE 15
	jp z, .asm_a2b95 ; A2B02 (28:6b02) -> CA 95 6B
	cp $14 ; A2B05 (28:6b05) -> FE 14
	jp z, .asm_a2b8a ; A2B07 (28:6b07) -> CA 8A 6B
	cp $13 ; A2B0A (28:6b0a) -> FE 13
	jp z, .asm_a2b8a ; A2B0C (28:6b0c) -> CA 8A 6B
	cp $12 ; A2B0F (28:6b0f) -> FE 12
	jp z, .asm_a2b8a ; A2B11 (28:6b11) -> CA 8A 6B
	cp $11 ; A2B14 (28:6b14) -> FE 11
	jp z, .asm_a2b8a ; A2B16 (28:6b16) -> CA 8A 6B
	cp $10 ; A2B19 (28:6b19) -> FE 10
	jp z, .asm_a2b8a ; A2B1B (28:6b1b) -> CA 8A 6B
	cp $0f ; A2B1E (28:6b1e) -> FE 0F
	jp z, .asm_a2b7f ; A2B20 (28:6b20) -> CA 7F 6B
	cp $0e ; A2B23 (28:6b23) -> FE 0E
	jp z, .asm_a2b7f ; A2B25 (28:6b25) -> CA 7F 6B
	cp $0d ; A2B28 (28:6b28) -> FE 0D
	jp z, .asm_a2b7f ; A2B2A (28:6b2a) -> CA 7F 6B
	cp $0c ; A2B2D (28:6b2d) -> FE 0C
	jp z, .asm_a2b7f ; A2B2F (28:6b2f) -> CA 7F 6B
	cp $0b ; A2B32 (28:6b32) -> FE 0B
	jp z, .asm_a2b7f ; A2B34 (28:6b34) -> CA 7F 6B
	cp $0a ; A2B37 (28:6b37) -> FE 0A
	jp z, .asm_a2b74 ; A2B39 (28:6b39) -> CA 74 6B
	cp $09 ; A2B3C (28:6b3c) -> FE 09
	jp z, .asm_a2b74 ; A2B3E (28:6b3e) -> CA 74 6B
	cp $08 ; A2B41 (28:6b41) -> FE 08
	jp z, .asm_a2b74 ; A2B43 (28:6b43) -> CA 74 6B
	cp $07 ; A2B46 (28:6b46) -> FE 07
	jp z, .asm_a2b74 ; A2B48 (28:6b48) -> CA 74 6B
	cp $06 ; A2B4B (28:6b4b) -> FE 06
	jp z, .asm_a2b74 ; A2B4D (28:6b4d) -> CA 74 6B
	cp $05 ; A2B50 (28:6b50) -> FE 05
	jp z, .asm_a2b69 ; A2B52 (28:6b52) -> CA 69 6B
	cp $04 ; A2B55 (28:6b55) -> FE 04
	jp z, .asm_a2b69 ; A2B57 (28:6b57) -> CA 69 6B
	cp $03 ; A2B5A (28:6b5a) -> FE 03
	jp z, .asm_a2b69 ; A2B5C (28:6b5c) -> CA 69 6B
	cp $02 ; A2B5F (28:6b5f) -> FE 02
	jp z, .asm_a2b69 ; A2B61 (28:6b61) -> CA 69 6B
	cp $01 ; A2B64 (28:6b64) -> FE 01
	jp nz, .asm_a2bab ; A2B66 (28:6b66) -> C2 AB 6B
.asm_a2b69:
	ld e, $05 ; A2B69 (28:6b69) -> 1E 05
	ld hl, Data_a28bb ; A2B6B (28:6b6b) -> 21 BB 68
	scall LoadEncounters ; A2B6E (28:6b6e) -> CD 24 4D
	jp .asm_a2bb3 ; A2B71 (28:6b71) -> C3 B3 6B
.asm_a2b74:
	ld e, $05 ; A2B74 (28:6b74) -> 1E 05
	ld hl, Data_a2901 ; A2B76 (28:6b76) -> 21 01 69
	scall LoadEncounters ; A2B79 (28:6b79) -> CD 24 4D
	jp .asm_a2bb3 ; A2B7C (28:6b7c) -> C3 B3 6B
.asm_a2b7f:
	ld e, $05 ; A2B7F (28:6b7f) -> 1E 05
	ld hl, Data_a2947 ; A2B81 (28:6b81) -> 21 47 69
	scall LoadEncounters ; A2B84 (28:6b84) -> CD 24 4D
	jp .asm_a2bb3 ; A2B87 (28:6b87) -> C3 B3 6B
.asm_a2b8a:
	ld e, $05 ; A2B8A (28:6b8a) -> 1E 05
	ld hl, Data_a298d ; A2B8C (28:6b8c) -> 21 8D 69
	scall LoadEncounters ; A2B8F (28:6b8f) -> CD 24 4D
	jp .asm_a2bb3 ; A2B92 (28:6b92) -> C3 B3 6B
.asm_a2b95:
	ld e, $05 ; A2B95 (28:6b95) -> 1E 05
	ld hl, Data_a29d3 ; A2B97 (28:6b97) -> 21 D3 69
	scall LoadEncounters ; A2B9A (28:6b9a) -> CD 24 4D
	jp .asm_a2bb3 ; A2B9D (28:6b9d) -> C3 B3 6B
.asm_a2ba0:
	ld e, $05 ; A2BA0 (28:6ba0) -> 1E 05
	ld hl, Data_a2a19 ; A2BA2 (28:6ba2) -> 21 19 6A
	scall LoadEncounters ; A2BA5 (28:6ba5) -> CD 24 4D
	jp .asm_a2bb3 ; A2BA8 (28:6ba8) -> C3 B3 6B
.asm_a2bab:
	ld e, $05 ; A2BAB (28:6bab) -> 1E 05
	ld hl, Data_a2a5f ; A2BAD (28:6bad) -> 21 5F 6A
	scall LoadEncounters ; A2BB0 (28:6bb0) -> CD 24 4D
.asm_a2bb3:
	ld a, [wc7de] ; A2BB3 (28:6bb3) -> FA DE C7
	inc a ; A2BB6 (28:6bb6) -> 3C
	cp $24 ; A2BB7 (28:6bb7) -> FE 24
	jp nc, .asm_a2bf3 ; A2BB9 (28:6bb9) -> D2 F3 6B
	call Func_a2c30 ; A2BBC (28:6bbc) -> CD 30 6C
	ld hl, Func_a2c30 ; A2BBF (28:6bbf) -> 21 30 6C
	scall Func_80f11 ; A2BC2 (28:6bc2) -> CD 11 4F
	ld a, $04 ; A2BC5 (28:6bc5) -> 3E 04
	scall Random ; A2BC7 (28:6bc7) -> CD D7 4C
	ld l, a ; A2BCA (28:6bca) -> 6F
	ld h, $00 ; A2BCB (28:6bcb) -> 26 00
	ld e, l ; A2BCD (28:6bcd) -> 5D
	ld d, h ; A2BCE (28:6bce) -> 54
	add hl, hl ; A2BCF (28:6bcf) -> 29
	ld c, l ; A2BD0 (28:6bd0) -> 4D
	ld b, h ; A2BD1 (28:6bd1) -> 44
	add hl, hl ; A2BD2 (28:6bd2) -> 29
	add hl, hl ; A2BD3 (28:6bd3) -> 29
	add hl, de ; A2BD4 (28:6bd4) -> 19
	add hl, bc ; A2BD5 (28:6bd5) -> 09
	push hl ; A2BD6 (28:6bd6) -> E5
	ld hl, wc7dd ; A2BD7 (28:6bd7) -> 21 DD C7
	ld l, [hl] ; A2BDA (28:6bda) -> 6E
	ld h, $00 ; A2BDB (28:6bdb) -> 26 00
	add hl, hl ; A2BDD (28:6bdd) -> 29
	add hl, hl ; A2BDE (28:6bde) -> 29
	ld e, l ; A2BDF (28:6bdf) -> 5D
	ld d, h ; A2BE0 (28:6be0) -> 54
	add hl, hl ; A2BE1 (28:6be1) -> 29
	ld c, l ; A2BE2 (28:6be2) -> 4D
	ld b, h ; A2BE3 (28:6be3) -> 44
	add hl, hl ; A2BE4 (28:6be4) -> 29
	add hl, hl ; A2BE5 (28:6be5) -> 29
	add hl, de ; A2BE6 (28:6be6) -> 19
	add hl, bc ; A2BE7 (28:6be7) -> 09
	ld de, Data_a2837 ; A2BE8 (28:6be8) -> 11 37 68
	add hl, de ; A2BEB (28:6beb) -> 19
	pop de ; A2BEC (28:6bec) -> D1
	add hl, de ; A2BED (28:6bed) -> 19
	ld e, $01 ; A2BEE (28:6bee) -> 1E 01
	scall LoadWarps ; A2BF0 (28:6bf0) -> CD 3A 40
.asm_a2bf3:
	ld e, $01 ; A2BF3 (28:6bf3) -> 1E 01
	ld hl, Data_a282c ; A2BF5 (28:6bf5) -> 21 2C 68
	scall LoadWarps ; A2BF8 (28:6bf8) -> CD 3A 40
	ld a, $08 ; A2BFB (28:6bfb) -> 3E 08
	scall PlayMusic ; A2BFD (28:6bfd) -> CD E6 4E
	scall Func_8001c ; A2C00 (28:6c00) -> CD 1C 40
	ld a, [wc7de] ; A2C03 (28:6c03) -> FA DE C7
	cp $23 ; A2C06 (28:6c06) -> FE 23
	jp nz, .asm_a2c14 ; A2C08 (28:6c08) -> C2 14 6C
	ld hl, $00f8 ; A2C0B (28:6c0b) -> 21 F8 00
	scall PrintTextStandard ; A2C0E (28:6c0e) -> CD 98 44
	jp .asm_a2c1d ; A2C11 (28:6c11) -> C3 1D 6C
.asm_a2c14:
	ld hl, wc7de ; A2C14 (28:6c14) -> 21 DE C7
	ld l, [hl] ; A2C17 (28:6c17) -> 6E
	ld h, $00 ; A2C18 (28:6c18) -> 26 00
	scall Func_80f83 ; A2C1A (28:6c1a) -> CD 83 4F
.asm_a2c1d:
	ret  ; A2C1D (28:6c1d) -> C9

Data_a2c1e:
	db $21, $00, $01, $01, $01, $04
	db $21, $00, $01, $01, $08, $10
	db $21, $00, $01, $01, $21, $10

Func_a2c30:
	ld hl, wc7dd ; A2C30 (28:6c30) -> 21 DD C7
	ld l, [hl] ; A2C33 (28:6c33) -> 6E
	ld h, $00 ; A2C34 (28:6c34) -> 26 00
	add hl, hl ; A2C36 (28:6c36) -> 29
	ld e, l ; A2C37 (28:6c37) -> 5D
	ld d, h ; A2C38 (28:6c38) -> 54
	add hl, hl ; A2C39 (28:6c39) -> 29
	add hl, de ; A2C3A (28:6c3a) -> 19
	ld de, Data_a2c1e ; A2C3B (28:6c3b) -> 11 1E 6C
	add hl, de ; A2C3E (28:6c3e) -> 19
	scall Func_80d9b ; A2C3F (28:6c3f) -> CD 9B 4D
	scall Func_80f02 ; A2C42 (28:6c42) -> CD 02 4F
	ret  ; A2C45 (28:6c45) -> C9

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
	ld a, [wSaveFileExists] ; A2EBF (28:6ebf) -> FA 98 C7
	or a ; A2EC2 (28:6ec2) -> B7
	jp nz, .asm_a2ed5 ; A2EC3 (28:6ec3) -> C2 D5 6E
	ld a, $03 ; A2EC6 (28:6ec6) -> 3E 03
	scall Random ; A2EC8 (28:6ec8) -> CD D7 4C
	ld [wc7dd], a ; A2ECB (28:6ecb) -> EA DD C7
	ld a, [wc7de] ; A2ECE (28:6ece) -> FA DE C7
	inc a ; A2ED1 (28:6ed1) -> 3C
	ld [wc7de], a ; A2ED2 (28:6ed2) -> EA DE C7
.asm_a2ed5:
	ld a, [wc7de] ; A2ED5 (28:6ed5) -> FA DE C7
	cp $23 ; A2ED8 (28:6ed8) -> FE 23
	jp nz, .asm_a2ee5 ; A2EDA (28:6eda) -> C2 E5 6E
	ld e, $01 ; A2EDD (28:6edd) -> 1E 01
	ld hl, $005f ; A2EDF (28:6edf) -> 21 5F 00
	scall EventFlagAction ; A2EE2 (28:6ee2) -> CD 1B 46
.asm_a2ee5:
	ld a, $03 ; A2EE5 (28:6ee5) -> 3E 03
	scall Func_80d01 ; A2EE7 (28:6ee7) -> CD 01 4D
	ld a, [wc7de] ; A2EEA (28:6eea) -> FA DE C7
	cp $1e ; A2EED (28:6eed) -> FE 1E
	jp z, .asm_a2fba ; A2EEF (28:6eef) -> CA BA 6F
	cp $1d ; A2EF2 (28:6ef2) -> FE 1D
	jp z, .asm_a2fba ; A2EF4 (28:6ef4) -> CA BA 6F
	cp $1c ; A2EF7 (28:6ef7) -> FE 1C
	jp z, .asm_a2fba ; A2EF9 (28:6ef9) -> CA BA 6F
	cp $1b ; A2EFC (28:6efc) -> FE 1B
	jp z, .asm_a2fba ; A2EFE (28:6efe) -> CA BA 6F
	cp $1a ; A2F01 (28:6f01) -> FE 1A
	jp z, .asm_a2fba ; A2F03 (28:6f03) -> CA BA 6F
	cp $19 ; A2F06 (28:6f06) -> FE 19
	jp z, .asm_a2faf ; A2F08 (28:6f08) -> CA AF 6F
	cp $18 ; A2F0B (28:6f0b) -> FE 18
	jp z, .asm_a2faf ; A2F0D (28:6f0d) -> CA AF 6F
	cp $17 ; A2F10 (28:6f10) -> FE 17
	jp z, .asm_a2faf ; A2F12 (28:6f12) -> CA AF 6F
	cp $16 ; A2F15 (28:6f15) -> FE 16
	jp z, .asm_a2faf ; A2F17 (28:6f17) -> CA AF 6F
	cp $15 ; A2F1A (28:6f1a) -> FE 15
	jp z, .asm_a2faf ; A2F1C (28:6f1c) -> CA AF 6F
	cp $14 ; A2F1F (28:6f1f) -> FE 14
	jp z, .asm_a2fa4 ; A2F21 (28:6f21) -> CA A4 6F
	cp $13 ; A2F24 (28:6f24) -> FE 13
	jp z, .asm_a2fa4 ; A2F26 (28:6f26) -> CA A4 6F
	cp $12 ; A2F29 (28:6f29) -> FE 12
	jp z, .asm_a2fa4 ; A2F2B (28:6f2b) -> CA A4 6F
	cp $11 ; A2F2E (28:6f2e) -> FE 11
	jp z, .asm_a2fa4 ; A2F30 (28:6f30) -> CA A4 6F
	cp $10 ; A2F33 (28:6f33) -> FE 10
	jp z, .asm_a2fa4 ; A2F35 (28:6f35) -> CA A4 6F
	cp $0f ; A2F38 (28:6f38) -> FE 0F
	jp z, .asm_a2f99 ; A2F3A (28:6f3a) -> CA 99 6F
	cp $0e ; A2F3D (28:6f3d) -> FE 0E
	jp z, .asm_a2f99 ; A2F3F (28:6f3f) -> CA 99 6F
	cp $0d ; A2F42 (28:6f42) -> FE 0D
	jp z, .asm_a2f99 ; A2F44 (28:6f44) -> CA 99 6F
	cp $0c ; A2F47 (28:6f47) -> FE 0C
	jp z, .asm_a2f99 ; A2F49 (28:6f49) -> CA 99 6F
	cp $0b ; A2F4C (28:6f4c) -> FE 0B
	jp z, .asm_a2f99 ; A2F4E (28:6f4e) -> CA 99 6F
	cp $0a ; A2F51 (28:6f51) -> FE 0A
	jp z, .asm_a2f8e ; A2F53 (28:6f53) -> CA 8E 6F
	cp $09 ; A2F56 (28:6f56) -> FE 09
	jp z, .asm_a2f8e ; A2F58 (28:6f58) -> CA 8E 6F
	cp $08 ; A2F5B (28:6f5b) -> FE 08
	jp z, .asm_a2f8e ; A2F5D (28:6f5d) -> CA 8E 6F
	cp $07 ; A2F60 (28:6f60) -> FE 07
	jp z, .asm_a2f8e ; A2F62 (28:6f62) -> CA 8E 6F
	cp $06 ; A2F65 (28:6f65) -> FE 06
	jp z, .asm_a2f8e ; A2F67 (28:6f67) -> CA 8E 6F
	cp $05 ; A2F6A (28:6f6a) -> FE 05
	jp z, .asm_a2f83 ; A2F6C (28:6f6c) -> CA 83 6F
	cp $04 ; A2F6F (28:6f6f) -> FE 04
	jp z, .asm_a2f83 ; A2F71 (28:6f71) -> CA 83 6F
	cp $03 ; A2F74 (28:6f74) -> FE 03
	jp z, .asm_a2f83 ; A2F76 (28:6f76) -> CA 83 6F
	cp $02 ; A2F79 (28:6f79) -> FE 02
	jp z, .asm_a2f83 ; A2F7B (28:6f7b) -> CA 83 6F
	cp $01 ; A2F7E (28:6f7e) -> FE 01
	jp nz, .asm_a2fc5 ; A2F80 (28:6f80) -> C2 C5 6F
.asm_a2f83:
	ld e, $05 ; A2F83 (28:6f83) -> 1E 05
	ld hl, Data_a2cd5 ; A2F85 (28:6f85) -> 21 D5 6C
	scall LoadEncounters ; A2F88 (28:6f88) -> CD 24 4D
	jp .asm_a2fcd ; A2F8B (28:6f8b) -> C3 CD 6F
.asm_a2f8e:
	ld e, $05 ; A2F8E (28:6f8e) -> 1E 05
	ld hl, Data_a2d1b ; A2F90 (28:6f90) -> 21 1B 6D
	scall LoadEncounters ; A2F93 (28:6f93) -> CD 24 4D
	jp .asm_a2fcd ; A2F96 (28:6f96) -> C3 CD 6F
.asm_a2f99:
	ld e, $05 ; A2F99 (28:6f99) -> 1E 05
	ld hl, Data_a2d61 ; A2F9B (28:6f9b) -> 21 61 6D
	scall LoadEncounters ; A2F9E (28:6f9e) -> CD 24 4D
	jp .asm_a2fcd ; A2FA1 (28:6fa1) -> C3 CD 6F
.asm_a2fa4:
	ld e, $05 ; A2FA4 (28:6fa4) -> 1E 05
	ld hl, Data_a2da7 ; A2FA6 (28:6fa6) -> 21 A7 6D
	scall LoadEncounters ; A2FA9 (28:6fa9) -> CD 24 4D
	jp .asm_a2fcd ; A2FAC (28:6fac) -> C3 CD 6F
.asm_a2faf:
	ld e, $05 ; A2FAF (28:6faf) -> 1E 05
	ld hl, Data_a2ded ; A2FB1 (28:6fb1) -> 21 ED 6D
	scall LoadEncounters ; A2FB4 (28:6fb4) -> CD 24 4D
	jp .asm_a2fcd ; A2FB7 (28:6fb7) -> C3 CD 6F
.asm_a2fba:
	ld e, $05 ; A2FBA (28:6fba) -> 1E 05
	ld hl, Data_a2e33 ; A2FBC (28:6fbc) -> 21 33 6E
	scall LoadEncounters ; A2FBF (28:6fbf) -> CD 24 4D
	jp .asm_a2fcd ; A2FC2 (28:6fc2) -> C3 CD 6F
.asm_a2fc5:
IF DEF(SUN)
	ld e, $05 ; A2FC5 (28:6fc5) -> 1E 05
ELIF DEF(STAR)
	ld e, $0a ; A2FC5 (28:6fc5) -> 1E 05
ENDC
	ld hl, Data_a2e79 ; A2FC7 (28:6fc7) -> 21 79 6E
	scall LoadEncounters ; A2FCA (28:6fca) -> CD 24 4D
.asm_a2fcd:
	ld a, [wc7de] ; A2FCD (28:6fcd) -> FA DE C7
	inc a ; A2FD0 (28:6fd0) -> 3C
	cp $24 ; A2FD1 (28:6fd1) -> FE 24
	jp nc, .asm_a300d ; A2FD3 (28:6fd3) -> D2 0D 70
	call Func_a304a ; A2FD6 (28:6fd6) -> CD 4A 70
	ld hl, Func_a304a ; A2FD9 (28:6fd9) -> 21 4A 70
	scall Func_80f11 ; A2FDC (28:6fdc) -> CD 11 4F
	ld a, $04 ; A2FDF (28:6fdf) -> 3E 04
	scall Random ; A2FE1 (28:6fe1) -> CD D7 4C
	ld l, a ; A2FE4 (28:6fe4) -> 6F
	ld h, $00 ; A2FE5 (28:6fe5) -> 26 00
	ld e, l ; A2FE7 (28:6fe7) -> 5D
	ld d, h ; A2FE8 (28:6fe8) -> 54
	add hl, hl ; A2FE9 (28:6fe9) -> 29
	ld c, l ; A2FEA (28:6fea) -> 4D
	ld b, h ; A2FEB (28:6feb) -> 44
	add hl, hl ; A2FEC (28:6fec) -> 29
	add hl, hl ; A2FED (28:6fed) -> 29
	add hl, de ; A2FEE (28:6fee) -> 19
	add hl, bc ; A2FEF (28:6fef) -> 09
	push hl ; A2FF0 (28:6ff0) -> E5
	ld hl, wc7dd ; A2FF1 (28:6ff1) -> 21 DD C7
	ld l, [hl] ; A2FF4 (28:6ff4) -> 6E
	ld h, $00 ; A2FF5 (28:6ff5) -> 26 00
	add hl, hl ; A2FF7 (28:6ff7) -> 29
	add hl, hl ; A2FF8 (28:6ff8) -> 29
	ld e, l ; A2FF9 (28:6ff9) -> 5D
	ld d, h ; A2FFA (28:6ffa) -> 54
	add hl, hl ; A2FFB (28:6ffb) -> 29
	ld c, l ; A2FFC (28:6ffc) -> 4D
	ld b, h ; A2FFD (28:6ffd) -> 44
	add hl, hl ; A2FFE (28:6ffe) -> 29
	add hl, hl ; A2FFF (28:6fff) -> 29
	add hl, de ; A3000 (28:7000) -> 19
	add hl, bc ; A3001 (28:7001) -> 09
	ld de, Data_a2c51 ; A3002 (28:7002) -> 11 51 6C
	add hl, de ; A3005 (28:7005) -> 19
	pop de ; A3006 (28:7006) -> D1
	add hl, de ; A3007 (28:7007) -> 19
	ld e, $01 ; A3008 (28:7008) -> 1E 01
	scall LoadWarps ; A300A (28:700a) -> CD 3A 40
.asm_a300d:
	ld e, $01 ; A300D (28:700d) -> 1E 01
	ld hl, Data_a2c46 ; A300F (28:700f) -> 21 46 6C
	scall LoadWarps ; A3012 (28:7012) -> CD 3A 40
	ld a, $08 ; A3015 (28:7015) -> 3E 08
	scall PlayMusic ; A3017 (28:7017) -> CD E6 4E
	scall Func_8001c ; A301A (28:701a) -> CD 1C 40
	ld a, [wc7de] ; A301D (28:701d) -> FA DE C7
	cp $23 ; A3020 (28:7020) -> FE 23
	jp nz, .asm_a302e ; A3022 (28:7022) -> C2 2E 70
	ld hl, $00f8 ; A3025 (28:7025) -> 21 F8 00
	scall PrintTextStandard ; A3028 (28:7028) -> CD 98 44
	jp .asm_a3037 ; A302B (28:702b) -> C3 37 70
.asm_a302e:
	ld hl, wc7de ; A302E (28:702e) -> 21 DE C7
	ld l, [hl] ; A3031 (28:7031) -> 6E
	ld h, $00 ; A3032 (28:7032) -> 26 00
	scall Func_80f83 ; A3034 (28:7034) -> CD 83 4F
.asm_a3037:
	ret  ; A3037 (28:7037) -> C9

Data_a3038:
	db $00, $0e, $01, $01, $01, $1c
	db $00, $0e, $01, $01, $16, $0a
	db $00, $0e, $01, $01, $25, $01

Func_a304a:
	ld hl, wc7dd ; A304A (28:704a) -> 21 DD C7
	ld l, [hl] ; A304D (28:704d) -> 6E
	ld h, $00 ; A304E (28:704e) -> 26 00
	add hl, hl ; A3050 (28:7050) -> 29
	ld e, l ; A3051 (28:7051) -> 5D
	ld d, h ; A3052 (28:7052) -> 54
	add hl, hl ; A3053 (28:7053) -> 29
	add hl, de ; A3054 (28:7054) -> 19
	ld de, Data_a3038 ; A3055 (28:7055) -> 11 38 70
	add hl, de ; A3058 (28:7058) -> 19
	scall Func_80d9b ; A3059 (28:7059) -> CD 9B 4D
	scall Func_80f02 ; A305C (28:705c) -> CD 02 4F
	ret  ; A305F (28:705f) -> C9

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
	ld e, $01 ; A30CD (28:70cd) -> 1E 01
	ld hl, Data_a3060 ; A30CF (28:70cf) -> 21 60 70
	scall LoadWarps ; A30D2 (28:70d2) -> CD 3A 40
	ld a, $03 ; A30D5 (28:70d5) -> 3E 03
	scall Func_80d01 ; A30D7 (28:70d7) -> CD 01 4D
	ld e, $03 ; A30DA (28:70da) -> 1E 03
	ld hl, Data_a306b ; A30DC (28:70dc) -> 21 6B 70
	scall LoadEncounters ; A30DF (28:70df) -> CD 24 4D
	ld a, $08 ; A30E2 (28:70e2) -> 3E 08
	scall PlayMusic ; A30E4 (28:70e4) -> CD E6 4E
	ld hl, $00c8 ; A30E7 (28:70e7) -> 21 C8 00
	scall CheckEventFlag ; A30EA (28:70ea) -> CD 2E 46
	or a ; A30ED (28:70ed) -> B7
	jp z, .asm_a3105 ; A30EE (28:70ee) -> CA 05 71
	ld hl, $00c9 ; A30F1 (28:70f1) -> 21 C9 00
	scall CheckEventFlag ; A30F4 (28:70f4) -> CD 2E 46
	or a ; A30F7 (28:70f7) -> B7
	jp z, .asm_a3105 ; A30F8 (28:70f8) -> CA 05 71
	ld hl, $00ca ; A30FB (28:70fb) -> 21 CA 00
	scall CheckEventFlag ; A30FE (28:70fe) -> CD 2E 46
	or a ; A3101 (28:7101) -> B7
	jp nz, .asm_a3125 ; A3102 (28:7102) -> C2 25 71
.asm_a3105:
	ld e, $00 ; A3105 (28:7105) -> 1E 00
	ld hl, $00c8 ; A3107 (28:7107) -> 21 C8 00
	scall EventFlagAction ; A310A (28:710a) -> CD 1B 46
	ld e, $00 ; A310D (28:710d) -> 1E 00
	ld hl, $00c9 ; A310F (28:710f) -> 21 C9 00
	scall EventFlagAction ; A3112 (28:7112) -> CD 1B 46
	ld e, $00 ; A3115 (28:7115) -> 1E 00
	ld hl, $00ca ; A3117 (28:7117) -> 21 CA 00
	scall EventFlagAction ; A311A (28:711a) -> CD 1B 46
	ld e, $03 ; A311D (28:711d) -> 1E 03
	ld hl, Data_a3095 ; A311F (28:711f) -> 21 95 70
	scall LoadMapObjects ; A3122 (28:7122) -> CD FB 40
.asm_a3125:
	ld e, $01 ; A3125 (28:7125) -> 1E 01
	ld hl, Data_a30bf ; A3127 (28:7127) -> 21 BF 70
	scall LoadMapObjects ; A312A (28:712a) -> CD FB 40
	scall Func_8001c ; A312D (28:712d) -> CD 1C 40
	ld hl, $041c ; A3130 (28:7130) -> 21 1C 04
	scall LandmarkSign ; A3133 (28:7133) -> CD 72 4F
	ret  ; A3136 (28:7136) -> C9

Func_a3137:
	push af ; A3137 (28:7137) -> F5
	ld a, e ; A3138 (28:7138) -> 7B
	cp $03 ; A3139 (28:7139) -> FE 03
	jp z, .asm_a3156 ; A313B (28:713b) -> CA 56 71
	cp $01 ; A313E (28:713e) -> FE 01
	jp nz, .asm_a3195 ; A3140 (28:7140) -> C2 95 71
	ld hl, sp+$01 ; A3143 (28:7143) -> F8 01
	ld a, [hl] ; A3145 (28:7145) -> 7E
	scall Func_80bde ; A3146 (28:7146) -> CD DE 4B
	cp $01 ; A3149 (28:7149) -> FE 01
	jp nz, .asm_a3153 ; A314B (28:714b) -> C2 53 71
	ld a, $01 ; A314E (28:714e) -> 3E 01
	ld [wc7c4], a ; A3150 (28:7150) -> EA C4 C7
.asm_a3153:
	jp .asm_a3195 ; A3153 (28:7153) -> C3 95 71
.asm_a3156:
	ld e, $03 ; A3156 (28:7156) -> 1E 03
	ld hl, sp+$01 ; A3158 (28:7158) -> F8 01
	ld a, [hl] ; A315A (28:715a) -> 7E
	scall CheckObjectsOccupyingSameTile ; A315B (28:715b) -> CD E9 40
	or a ; A315E (28:715e) -> B7
	jp z, .asm_a3195 ; A315F (28:715f) -> CA 95 71
	ld a, $2b ; A3162 (28:7162) -> 3E 2B
	scall PlaySFX ; A3164 (28:7164) -> CD FE 4E
	ld e, $00 ; A3167 (28:7167) -> 1E 00
	ld hl, sp+$01 ; A3169 (28:7169) -> F8 01
	ld a, [hl] ; A316B (28:716b) -> 7E
	scall SetPersonVisibilityState ; A316C (28:716c) -> CD 3D 41
	ld e, $01 ; A316F (28:716f) -> 1E 01
	ld hl, $00c8 ; A3171 (28:7171) -> 21 C8 00
	scall EventFlagAction ; A3174 (28:7174) -> CD 1B 46
	ld hl, $00c9 ; A3177 (28:7177) -> 21 C9 00
	scall CheckEventFlag ; A317A (28:717a) -> CD 2E 46
	cp $01 ; A317D (28:717d) -> FE 01
	jp nz, .asm_a3195 ; A317F (28:717f) -> C2 95 71
	ld hl, $00ca ; A3182 (28:7182) -> 21 CA 00
	scall CheckEventFlag ; A3185 (28:7185) -> CD 2E 46
	cp $01 ; A3188 (28:7188) -> FE 01
	jp nz, .asm_a3195 ; A318A (28:718a) -> C2 95 71
	ld e, $01 ; A318D (28:718d) -> 1E 01
	ld hl, $00d1 ; A318F (28:718f) -> 21 D1 00
	scall EventFlagAction ; A3192 (28:7192) -> CD 1B 46
.asm_a3195:
	pop bc ; A3195 (28:7195) -> C1
	ret  ; A3196 (28:7196) -> C9

Func_a3197:
	push af ; A3197 (28:7197) -> F5
	ld a, e ; A3198 (28:7198) -> 7B
	cp $03 ; A3199 (28:7199) -> FE 03
	jp z, .asm_a31b6 ; A319B (28:719b) -> CA B6 71
	cp $01 ; A319E (28:719e) -> FE 01
	jp nz, .asm_a31f5 ; A31A0 (28:71a0) -> C2 F5 71
	ld hl, sp+$01 ; A31A3 (28:71a3) -> F8 01
	ld a, [hl] ; A31A5 (28:71a5) -> 7E
	scall Func_80bde ; A31A6 (28:71a6) -> CD DE 4B
	cp $01 ; A31A9 (28:71a9) -> FE 01
	jp nz, .asm_a31b3 ; A31AB (28:71ab) -> C2 B3 71
	ld a, $01 ; A31AE (28:71ae) -> 3E 01
	ld [wc7c4], a ; A31B0 (28:71b0) -> EA C4 C7
.asm_a31b3:
	jp .asm_a31f5 ; A31B3 (28:71b3) -> C3 F5 71
.asm_a31b6:
	ld e, $03 ; A31B6 (28:71b6) -> 1E 03
	ld hl, sp+$01 ; A31B8 (28:71b8) -> F8 01
	ld a, [hl] ; A31BA (28:71ba) -> 7E
	scall CheckObjectsOccupyingSameTile ; A31BB (28:71bb) -> CD E9 40
	or a ; A31BE (28:71be) -> B7
	jp z, .asm_a31f5 ; A31BF (28:71bf) -> CA F5 71
	ld a, $2b ; A31C2 (28:71c2) -> 3E 2B
	scall PlaySFX ; A31C4 (28:71c4) -> CD FE 4E
	ld e, $00 ; A31C7 (28:71c7) -> 1E 00
	ld hl, sp+$01 ; A31C9 (28:71c9) -> F8 01
	ld a, [hl] ; A31CB (28:71cb) -> 7E
	scall SetPersonVisibilityState ; A31CC (28:71cc) -> CD 3D 41
	ld e, $01 ; A31CF (28:71cf) -> 1E 01
	ld hl, $00c9 ; A31D1 (28:71d1) -> 21 C9 00
	scall EventFlagAction ; A31D4 (28:71d4) -> CD 1B 46
	ld hl, $00c8 ; A31D7 (28:71d7) -> 21 C8 00
	scall CheckEventFlag ; A31DA (28:71da) -> CD 2E 46
	cp $01 ; A31DD (28:71dd) -> FE 01
	jp nz, .asm_a31f5 ; A31DF (28:71df) -> C2 F5 71
	ld hl, $00ca ; A31E2 (28:71e2) -> 21 CA 00
	scall CheckEventFlag ; A31E5 (28:71e5) -> CD 2E 46
	cp $01 ; A31E8 (28:71e8) -> FE 01
	jp nz, .asm_a31f5 ; A31EA (28:71ea) -> C2 F5 71
	ld e, $01 ; A31ED (28:71ed) -> 1E 01
	ld hl, $00d1 ; A31EF (28:71ef) -> 21 D1 00
	scall EventFlagAction ; A31F2 (28:71f2) -> CD 1B 46
.asm_a31f5:
	pop bc ; A31F5 (28:71f5) -> C1
	ret  ; A31F6 (28:71f6) -> C9

Func_a31f7:
	push af ; A31F7 (28:71f7) -> F5
	ld a, e ; A31F8 (28:71f8) -> 7B
	cp $03 ; A31F9 (28:71f9) -> FE 03
	jp z, .asm_a3216 ; A31FB (28:71fb) -> CA 16 72
	cp $01 ; A31FE (28:71fe) -> FE 01
	jp nz, .asm_a3255 ; A3200 (28:7200) -> C2 55 72
	ld hl, sp+$01 ; A3203 (28:7203) -> F8 01
	ld a, [hl] ; A3205 (28:7205) -> 7E
	scall Func_80bde ; A3206 (28:7206) -> CD DE 4B
	cp $01 ; A3209 (28:7209) -> FE 01
	jp nz, .asm_a3213 ; A320B (28:720b) -> C2 13 72
	ld a, $01 ; A320E (28:720e) -> 3E 01
	ld [wc7c4], a ; A3210 (28:7210) -> EA C4 C7
.asm_a3213:
	jp .asm_a3255 ; A3213 (28:7213) -> C3 55 72
.asm_a3216:
	ld e, $03 ; A3216 (28:7216) -> 1E 03
	ld hl, sp+$01 ; A3218 (28:7218) -> F8 01
	ld a, [hl] ; A321A (28:721a) -> 7E
	scall CheckObjectsOccupyingSameTile ; A321B (28:721b) -> CD E9 40
	or a ; A321E (28:721e) -> B7
	jp z, .asm_a3255 ; A321F (28:721f) -> CA 55 72
	ld a, $2b ; A3222 (28:7222) -> 3E 2B
	scall PlaySFX ; A3224 (28:7224) -> CD FE 4E
	ld e, $00 ; A3227 (28:7227) -> 1E 00
	ld hl, sp+$01 ; A3229 (28:7229) -> F8 01
	ld a, [hl] ; A322B (28:722b) -> 7E
	scall SetPersonVisibilityState ; A322C (28:722c) -> CD 3D 41
	ld e, $01 ; A322F (28:722f) -> 1E 01
	ld hl, $00ca ; A3231 (28:7231) -> 21 CA 00
	scall EventFlagAction ; A3234 (28:7234) -> CD 1B 46
	ld hl, $00c8 ; A3237 (28:7237) -> 21 C8 00
	scall CheckEventFlag ; A323A (28:723a) -> CD 2E 46
	cp $01 ; A323D (28:723d) -> FE 01
	jp nz, .asm_a3255 ; A323F (28:723f) -> C2 55 72
	ld hl, $00c9 ; A3242 (28:7242) -> 21 C9 00
	scall CheckEventFlag ; A3245 (28:7245) -> CD 2E 46
	cp $01 ; A3248 (28:7248) -> FE 01
	jp nz, .asm_a3255 ; A324A (28:724a) -> C2 55 72
	ld e, $01 ; A324D (28:724d) -> 1E 01
	ld hl, $00d1 ; A324F (28:724f) -> 21 D1 00
	scall EventFlagAction ; A3252 (28:7252) -> CD 1B 46
.asm_a3255:
	pop bc ; A3255 (28:7255) -> C1
	ret  ; A3256 (28:7256) -> C9

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
	ld e, $02 ; A32CF (28:72cf) -> 1E 02
	ld hl, Data_a3257 ; A32D1 (28:72d1) -> 21 57 72
	scall LoadWarps ; A32D4 (28:72d4) -> CD 3A 40
	ld a, $03 ; A32D7 (28:72d7) -> 3E 03
	scall Func_80d01 ; A32D9 (28:72d9) -> CD 01 4D
	ld e, $03 ; A32DC (28:72dc) -> 1E 03
	ld hl, Data_a326d ; A32DE (28:72de) -> 21 6D 72
	scall LoadEncounters ; A32E1 (28:72e1) -> CD 24 4D
	ld a, $08 ; A32E4 (28:72e4) -> 3E 08
	scall PlayMusic ; A32E6 (28:72e6) -> CD E6 4E
	ld hl, $00cb ; A32E9 (28:72e9) -> 21 CB 00
	scall CheckEventFlag ; A32EC (28:72ec) -> CD 2E 46
	or a ; A32EF (28:72ef) -> B7
	jp z, .asm_a3307 ; A32F0 (28:72f0) -> CA 07 73
	ld hl, $00cc ; A32F3 (28:72f3) -> 21 CC 00
	scall CheckEventFlag ; A32F6 (28:72f6) -> CD 2E 46
	or a ; A32F9 (28:72f9) -> B7
	jp z, .asm_a3307 ; A32FA (28:72fa) -> CA 07 73
	ld hl, $00cd ; A32FD (28:72fd) -> 21 CD 00
	scall CheckEventFlag ; A3300 (28:7300) -> CD 2E 46
	or a ; A3303 (28:7303) -> B7
	jp nz, .asm_a3327 ; A3304 (28:7304) -> C2 27 73
.asm_a3307:
	ld e, $00 ; A3307 (28:7307) -> 1E 00
	ld hl, $00cb ; A3309 (28:7309) -> 21 CB 00
	scall EventFlagAction ; A330C (28:730c) -> CD 1B 46
	ld e, $00 ; A330F (28:730f) -> 1E 00
	ld hl, $00cc ; A3311 (28:7311) -> 21 CC 00
	scall EventFlagAction ; A3314 (28:7314) -> CD 1B 46
	ld e, $00 ; A3317 (28:7317) -> 1E 00
	ld hl, $00cd ; A3319 (28:7319) -> 21 CD 00
	scall EventFlagAction ; A331C (28:731c) -> CD 1B 46
	ld e, $03 ; A331F (28:731f) -> 1E 03
	ld hl, Data_a3297 ; A3321 (28:7321) -> 21 97 72
	scall LoadMapObjects ; A3324 (28:7324) -> CD FB 40
.asm_a3327:
	ld e, $01 ; A3327 (28:7327) -> 1E 01
	ld hl, Data_a32c1 ; A3329 (28:7329) -> 21 C1 72
	scall LoadMapObjects ; A332C (28:732c) -> CD FB 40
	scall Func_8001c ; A332F (28:732f) -> CD 1C 40
	ld hl, $03ee ; A3332 (28:7332) -> 21 EE 03
	scall LandmarkSign ; A3335 (28:7335) -> CD 72 4F
	ret  ; A3338 (28:7338) -> C9
Func_a3339:
	push af ; A3339 (28:7339) -> F5
	ld a, e ; A333A (28:733a) -> 7B
	cp $03 ; A333B (28:733b) -> FE 03
	jp z, .asm_a3358 ; A333D (28:733d) -> CA 58 73
	cp $01 ; A3340 (28:7340) -> FE 01
	jp nz, .asm_a3397 ; A3342 (28:7342) -> C2 97 73
	ld hl, sp+$01 ; A3345 (28:7345) -> F8 01
	ld a, [hl] ; A3347 (28:7347) -> 7E
	scall Func_80bde ; A3348 (28:7348) -> CD DE 4B
	cp $01 ; A334B (28:734b) -> FE 01
	jp nz, .asm_a3355 ; A334D (28:734d) -> C2 55 73
	ld a, $01 ; A3350 (28:7350) -> 3E 01
	ld [wc7c4], a ; A3352 (28:7352) -> EA C4 C7
.asm_a3355:
	jp .asm_a3397 ; A3355 (28:7355) -> C3 97 73
.asm_a3358:
	ld e, $03 ; A3358 (28:7358) -> 1E 03
	ld hl, sp+$01 ; A335A (28:735a) -> F8 01
	ld a, [hl] ; A335C (28:735c) -> 7E
	scall CheckObjectsOccupyingSameTile ; A335D (28:735d) -> CD E9 40
	or a ; A3360 (28:7360) -> B7
	jp z, .asm_a3397 ; A3361 (28:7361) -> CA 97 73
	ld a, $2b ; A3364 (28:7364) -> 3E 2B
	scall PlaySFX ; A3366 (28:7366) -> CD FE 4E
	ld e, $00 ; A3369 (28:7369) -> 1E 00
	ld hl, sp+$01 ; A336B (28:736b) -> F8 01
	ld a, [hl] ; A336D (28:736d) -> 7E
	scall SetPersonVisibilityState ; A336E (28:736e) -> CD 3D 41
	ld e, $01 ; A3371 (28:7371) -> 1E 01
	ld hl, $00cb ; A3373 (28:7373) -> 21 CB 00
	scall EventFlagAction ; A3376 (28:7376) -> CD 1B 46
	ld hl, $00cc ; A3379 (28:7379) -> 21 CC 00
	scall CheckEventFlag ; A337C (28:737c) -> CD 2E 46
	cp $01 ; A337F (28:737f) -> FE 01
	jp nz, .asm_a3397 ; A3381 (28:7381) -> C2 97 73
	ld hl, $00cd ; A3384 (28:7384) -> 21 CD 00
	scall CheckEventFlag ; A3387 (28:7387) -> CD 2E 46
	cp $01 ; A338A (28:738a) -> FE 01
	jp nz, .asm_a3397 ; A338C (28:738c) -> C2 97 73
	ld e, $01 ; A338F (28:738f) -> 1E 01
	ld hl, $00d2 ; A3391 (28:7391) -> 21 D2 00
	scall EventFlagAction ; A3394 (28:7394) -> CD 1B 46
.asm_a3397:
	pop bc ; A3397 (28:7397) -> C1
	ret  ; A3398 (28:7398) -> C9
Func_a3399:
	push af ; A3399 (28:7399) -> F5
	ld a, e ; A339A (28:739a) -> 7B
	cp $03 ; A339B (28:739b) -> FE 03
	jp z, .asm_a33b8 ; A339D (28:739d) -> CA B8 73
	cp $01 ; A33A0 (28:73a0) -> FE 01
	jp nz, .asm_a33f7 ; A33A2 (28:73a2) -> C2 F7 73
	ld hl, sp+$01 ; A33A5 (28:73a5) -> F8 01
	ld a, [hl] ; A33A7 (28:73a7) -> 7E
	scall Func_80bde ; A33A8 (28:73a8) -> CD DE 4B
	cp $01 ; A33AB (28:73ab) -> FE 01
	jp nz, .asm_a33b5 ; A33AD (28:73ad) -> C2 B5 73
	ld a, $01 ; A33B0 (28:73b0) -> 3E 01
	ld [wc7c4], a ; A33B2 (28:73b2) -> EA C4 C7
.asm_a33b5:
	jp .asm_a33f7 ; A33B5 (28:73b5) -> C3 F7 73
.asm_a33b8:
	ld e, $03 ; A33B8 (28:73b8) -> 1E 03
	ld hl, sp+$01 ; A33BA (28:73ba) -> F8 01
	ld a, [hl] ; A33BC (28:73bc) -> 7E
	scall CheckObjectsOccupyingSameTile ; A33BD (28:73bd) -> CD E9 40
	or a ; A33C0 (28:73c0) -> B7
	jp z, .asm_a33f7 ; A33C1 (28:73c1) -> CA F7 73
	ld a, $2b ; A33C4 (28:73c4) -> 3E 2B
	scall PlaySFX ; A33C6 (28:73c6) -> CD FE 4E
	ld e, $00 ; A33C9 (28:73c9) -> 1E 00
	ld hl, sp+$01 ; A33CB (28:73cb) -> F8 01
	ld a, [hl] ; A33CD (28:73cd) -> 7E
	scall SetPersonVisibilityState ; A33CE (28:73ce) -> CD 3D 41
	ld e, $01 ; A33D1 (28:73d1) -> 1E 01
	ld hl, $00cc ; A33D3 (28:73d3) -> 21 CC 00
	scall EventFlagAction ; A33D6 (28:73d6) -> CD 1B 46
	ld hl, $00cb ; A33D9 (28:73d9) -> 21 CB 00
	scall CheckEventFlag ; A33DC (28:73dc) -> CD 2E 46
	cp $01 ; A33DF (28:73df) -> FE 01
	jp nz, .asm_a33f7 ; A33E1 (28:73e1) -> C2 F7 73
	ld hl, $00cd ; A33E4 (28:73e4) -> 21 CD 00
	scall CheckEventFlag ; A33E7 (28:73e7) -> CD 2E 46
	cp $01 ; A33EA (28:73ea) -> FE 01
	jp nz, .asm_a33f7 ; A33EC (28:73ec) -> C2 F7 73
	ld e, $01 ; A33EF (28:73ef) -> 1E 01
	ld hl, $00d2 ; A33F1 (28:73f1) -> 21 D2 00
	scall EventFlagAction ; A33F4 (28:73f4) -> CD 1B 46
.asm_a33f7:
	pop bc ; A33F7 (28:73f7) -> C1
	ret  ; A33F8 (28:73f8) -> C9
Func_a33f9:
	push af ; A33F9 (28:73f9) -> F5
	ld a, e ; A33FA (28:73fa) -> 7B
	cp $03 ; A33FB (28:73fb) -> FE 03
	jp z, .asm_a3418 ; A33FD (28:73fd) -> CA 18 74
	cp $01 ; A3400 (28:7400) -> FE 01
	jp nz, .asm_a3457 ; A3402 (28:7402) -> C2 57 74
	ld hl, sp+$01 ; A3405 (28:7405) -> F8 01
	ld a, [hl] ; A3407 (28:7407) -> 7E
	scall Func_80bde ; A3408 (28:7408) -> CD DE 4B
	cp $01 ; A340B (28:740b) -> FE 01
	jp nz, .asm_a3415 ; A340D (28:740d) -> C2 15 74
	ld a, $01 ; A3410 (28:7410) -> 3E 01
	ld [wc7c4], a ; A3412 (28:7412) -> EA C4 C7
.asm_a3415:
	jp .asm_a3457 ; A3415 (28:7415) -> C3 57 74
.asm_a3418:
	ld e, $03 ; A3418 (28:7418) -> 1E 03
	ld hl, sp+$01 ; A341A (28:741a) -> F8 01
	ld a, [hl] ; A341C (28:741c) -> 7E
	scall CheckObjectsOccupyingSameTile ; A341D (28:741d) -> CD E9 40
	or a ; A3420 (28:7420) -> B7
	jp z, .asm_a3457 ; A3421 (28:7421) -> CA 57 74
	ld a, $2b ; A3424 (28:7424) -> 3E 2B
	scall PlaySFX ; A3426 (28:7426) -> CD FE 4E
	ld e, $00 ; A3429 (28:7429) -> 1E 00
	ld hl, sp+$01 ; A342B (28:742b) -> F8 01
	ld a, [hl] ; A342D (28:742d) -> 7E
	scall SetPersonVisibilityState ; A342E (28:742e) -> CD 3D 41
	ld e, $01 ; A3431 (28:7431) -> 1E 01
	ld hl, $00cd ; A3433 (28:7433) -> 21 CD 00
	scall EventFlagAction ; A3436 (28:7436) -> CD 1B 46
	ld hl, $00cb ; A3439 (28:7439) -> 21 CB 00
	scall CheckEventFlag ; A343C (28:743c) -> CD 2E 46
	cp $01 ; A343F (28:743f) -> FE 01
	jp nz, .asm_a3457 ; A3441 (28:7441) -> C2 57 74
	ld hl, $00cc ; A3444 (28:7444) -> 21 CC 00
	scall CheckEventFlag ; A3447 (28:7447) -> CD 2E 46
	cp $01 ; A344A (28:744a) -> FE 01
	jp nz, .asm_a3457 ; A344C (28:744c) -> C2 57 74
	ld e, $01 ; A344F (28:744f) -> 1E 01
	ld hl, $00d2 ; A3451 (28:7451) -> 21 D2 00
	scall EventFlagAction ; A3454 (28:7454) -> CD 1B 46
.asm_a3457:
	pop bc ; A3457 (28:7457) -> C1
	ret  ; A3458 (28:7458) -> C9

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
	ld e, $02 ; A34D1 (28:74d1) -> 1E 02
	ld hl, Data_a3459 ; A34D3 (28:74d3) -> 21 59 74
	scall LoadWarps ; A34D6 (28:74d6) -> CD 3A 40
	ld a, $03 ; A34D9 (28:74d9) -> 3E 03
	scall Func_80d01 ; A34DB (28:74db) -> CD 01 4D
	ld e, $03 ; A34DE (28:74de) -> 1E 03
	ld hl, Data_a346f ; A34E0 (28:74e0) -> 21 6F 74
	scall LoadEncounters ; A34E3 (28:74e3) -> CD 24 4D
	ld a, $08 ; A34E6 (28:74e6) -> 3E 08
	scall PlayMusic ; A34E8 (28:74e8) -> CD E6 4E
	ld hl, $00ce ; A34EB (28:74eb) -> 21 CE 00
	scall CheckEventFlag ; A34EE (28:74ee) -> CD 2E 46
	or a ; A34F1 (28:74f1) -> B7
	jp z, .asm_a3509 ; A34F2 (28:74f2) -> CA 09 75
	ld hl, $00cf ; A34F5 (28:74f5) -> 21 CF 00
	scall CheckEventFlag ; A34F8 (28:74f8) -> CD 2E 46
	or a ; A34FB (28:74fb) -> B7
	jp z, .asm_a3509 ; A34FC (28:74fc) -> CA 09 75
	ld hl, $00d0 ; A34FF (28:74ff) -> 21 D0 00
	scall CheckEventFlag ; A3502 (28:7502) -> CD 2E 46
	or a ; A3505 (28:7505) -> B7
	jp nz, .asm_a3529 ; A3506 (28:7506) -> C2 29 75
.asm_a3509:
	ld e, $00 ; A3509 (28:7509) -> 1E 00
	ld hl, $00ce ; A350B (28:750b) -> 21 CE 00
	scall EventFlagAction ; A350E (28:750e) -> CD 1B 46
	ld e, $00 ; A3511 (28:7511) -> 1E 00
	ld hl, $00cf ; A3513 (28:7513) -> 21 CF 00
	scall EventFlagAction ; A3516 (28:7516) -> CD 1B 46
	ld e, $00 ; A3519 (28:7519) -> 1E 00
	ld hl, $00d0 ; A351B (28:751b) -> 21 D0 00
	scall EventFlagAction ; A351E (28:751e) -> CD 1B 46
	ld e, $03 ; A3521 (28:7521) -> 1E 03
	ld hl, Data_a3499 ; A3523 (28:7523) -> 21 99 74
	scall LoadMapObjects ; A3526 (28:7526) -> CD FB 40
.asm_a3529:
	ld e, $01 ; A3529 (28:7529) -> 1E 01
	ld hl, Data_a34c3 ; A352B (28:752b) -> 21 C3 74
	scall LoadMapObjects ; A352E (28:752e) -> CD FB 40
	scall Func_8001c ; A3531 (28:7531) -> CD 1C 40
	ld hl, $034a ; A3534 (28:7534) -> 21 4A 03
	scall LandmarkSign ; A3537 (28:7537) -> CD 72 4F
	ret  ; A353A (28:753a) -> C9

Func_a353b:
	push af ; A353B (28:753b) -> F5
	ld a, e ; A353C (28:753c) -> 7B
	cp $03 ; A353D (28:753d) -> FE 03
	jp z, .asm_a355a ; A353F (28:753f) -> CA 5A 75
	cp $01 ; A3542 (28:7542) -> FE 01
	jp nz, .asm_a3599 ; A3544 (28:7544) -> C2 99 75
	ld hl, sp+$01 ; A3547 (28:7547) -> F8 01
	ld a, [hl] ; A3549 (28:7549) -> 7E
	scall Func_80bde ; A354A (28:754a) -> CD DE 4B
	cp $01 ; A354D (28:754d) -> FE 01
	jp nz, .asm_a3557 ; A354F (28:754f) -> C2 57 75
	ld a, $01 ; A3552 (28:7552) -> 3E 01
	ld [wc7c4], a ; A3554 (28:7554) -> EA C4 C7
.asm_a3557:
	jp .asm_a3599 ; A3557 (28:7557) -> C3 99 75
.asm_a355a:
	ld e, $03 ; A355A (28:755a) -> 1E 03
	ld hl, sp+$01 ; A355C (28:755c) -> F8 01
	ld a, [hl] ; A355E (28:755e) -> 7E
	scall CheckObjectsOccupyingSameTile ; A355F (28:755f) -> CD E9 40
	or a ; A3562 (28:7562) -> B7
	jp z, .asm_a3599 ; A3563 (28:7563) -> CA 99 75
	ld a, $2b ; A3566 (28:7566) -> 3E 2B
	scall PlaySFX ; A3568 (28:7568) -> CD FE 4E
	ld e, $00 ; A356B (28:756b) -> 1E 00
	ld hl, sp+$01 ; A356D (28:756d) -> F8 01
	ld a, [hl] ; A356F (28:756f) -> 7E
	scall SetPersonVisibilityState ; A3570 (28:7570) -> CD 3D 41
	ld e, $01 ; A3573 (28:7573) -> 1E 01
	ld hl, $00ce ; A3575 (28:7575) -> 21 CE 00
	scall EventFlagAction ; A3578 (28:7578) -> CD 1B 46
	ld hl, $00cf ; A357B (28:757b) -> 21 CF 00
	scall CheckEventFlag ; A357E (28:757e) -> CD 2E 46
	cp $01 ; A3581 (28:7581) -> FE 01
	jp nz, .asm_a3599 ; A3583 (28:7583) -> C2 99 75
	ld hl, $00d0 ; A3586 (28:7586) -> 21 D0 00
	scall CheckEventFlag ; A3589 (28:7589) -> CD 2E 46
	cp $01 ; A358C (28:758c) -> FE 01
	jp nz, .asm_a3599 ; A358E (28:758e) -> C2 99 75
	ld e, $01 ; A3591 (28:7591) -> 1E 01
	ld hl, $00d3 ; A3593 (28:7593) -> 21 D3 00
	scall EventFlagAction ; A3596 (28:7596) -> CD 1B 46
.asm_a3599:
	pop bc ; A3599 (28:7599) -> C1
	ret  ; A359A (28:759a) -> C9

Func_a359b:
	push af ; A359B (28:759b) -> F5
	ld a, e ; A359C (28:759c) -> 7B
	cp $03 ; A359D (28:759d) -> FE 03
	jp z, .asm_a35ba ; A359F (28:759f) -> CA BA 75
	cp $01 ; A35A2 (28:75a2) -> FE 01
	jp nz, .asm_a35f9 ; A35A4 (28:75a4) -> C2 F9 75
	ld hl, sp+$01 ; A35A7 (28:75a7) -> F8 01
	ld a, [hl] ; A35A9 (28:75a9) -> 7E
	scall Func_80bde ; A35AA (28:75aa) -> CD DE 4B
	cp $01 ; A35AD (28:75ad) -> FE 01
	jp nz, .asm_a35b7 ; A35AF (28:75af) -> C2 B7 75
	ld a, $01 ; A35B2 (28:75b2) -> 3E 01
	ld [wc7c4], a ; A35B4 (28:75b4) -> EA C4 C7
.asm_a35b7:
	jp .asm_a35f9 ; A35B7 (28:75b7) -> C3 F9 75
.asm_a35ba:
	ld e, $03 ; A35BA (28:75ba) -> 1E 03
	ld hl, sp+$01 ; A35BC (28:75bc) -> F8 01
	ld a, [hl] ; A35BE (28:75be) -> 7E
	scall CheckObjectsOccupyingSameTile ; A35BF (28:75bf) -> CD E9 40
	or a ; A35C2 (28:75c2) -> B7
	jp z, .asm_a35f9 ; A35C3 (28:75c3) -> CA F9 75
	ld a, $2b ; A35C6 (28:75c6) -> 3E 2B
	scall PlaySFX ; A35C8 (28:75c8) -> CD FE 4E
	ld e, $00 ; A35CB (28:75cb) -> 1E 00
	ld hl, sp+$01 ; A35CD (28:75cd) -> F8 01
	ld a, [hl] ; A35CF (28:75cf) -> 7E
	scall SetPersonVisibilityState ; A35D0 (28:75d0) -> CD 3D 41
	ld e, $01 ; A35D3 (28:75d3) -> 1E 01
	ld hl, $00cf ; A35D5 (28:75d5) -> 21 CF 00
	scall EventFlagAction ; A35D8 (28:75d8) -> CD 1B 46
	ld hl, $00ce ; A35DB (28:75db) -> 21 CE 00
	scall CheckEventFlag ; A35DE (28:75de) -> CD 2E 46
	cp $01 ; A35E1 (28:75e1) -> FE 01
	jp nz, .asm_a35f9 ; A35E3 (28:75e3) -> C2 F9 75
	ld hl, $00d0 ; A35E6 (28:75e6) -> 21 D0 00
	scall CheckEventFlag ; A35E9 (28:75e9) -> CD 2E 46
	cp $01 ; A35EC (28:75ec) -> FE 01
	jp nz, .asm_a35f9 ; A35EE (28:75ee) -> C2 F9 75
	ld e, $01 ; A35F1 (28:75f1) -> 1E 01
	ld hl, $00d3 ; A35F3 (28:75f3) -> 21 D3 00
	scall EventFlagAction ; A35F6 (28:75f6) -> CD 1B 46
.asm_a35f9:
	pop bc ; A35F9 (28:75f9) -> C1
	ret  ; A35FA (28:75fa) -> C9

Func_a35fb:
	push af ; A35FB (28:75fb) -> F5
	ld a, e ; A35FC (28:75fc) -> 7B
	cp $03 ; A35FD (28:75fd) -> FE 03
	jp z, .asm_a361a ; A35FF (28:75ff) -> CA 1A 76
	cp $01 ; A3602 (28:7602) -> FE 01
	jp nz, .asm_a3659 ; A3604 (28:7604) -> C2 59 76
	ld hl, sp+$01 ; A3607 (28:7607) -> F8 01
	ld a, [hl] ; A3609 (28:7609) -> 7E
	scall Func_80bde ; A360A (28:760a) -> CD DE 4B
	cp $01 ; A360D (28:760d) -> FE 01
	jp nz, .asm_a3617 ; A360F (28:760f) -> C2 17 76
	ld a, $01 ; A3612 (28:7612) -> 3E 01
	ld [wc7c4], a ; A3614 (28:7614) -> EA C4 C7
.asm_a3617:
	jp .asm_a3659 ; A3617 (28:7617) -> C3 59 76
.asm_a361a:
	ld e, $03 ; A361A (28:761a) -> 1E 03
	ld hl, sp+$01 ; A361C (28:761c) -> F8 01
	ld a, [hl] ; A361E (28:761e) -> 7E
	scall CheckObjectsOccupyingSameTile ; A361F (28:761f) -> CD E9 40
	or a ; A3622 (28:7622) -> B7
	jp z, .asm_a3659 ; A3623 (28:7623) -> CA 59 76
	ld a, $2b ; A3626 (28:7626) -> 3E 2B
	scall PlaySFX ; A3628 (28:7628) -> CD FE 4E
	ld e, $00 ; A362B (28:762b) -> 1E 00
	ld hl, sp+$01 ; A362D (28:762d) -> F8 01
	ld a, [hl] ; A362F (28:762f) -> 7E
	scall SetPersonVisibilityState ; A3630 (28:7630) -> CD 3D 41
	ld e, $01 ; A3633 (28:7633) -> 1E 01
	ld hl, $00d0 ; A3635 (28:7635) -> 21 D0 00
	scall EventFlagAction ; A3638 (28:7638) -> CD 1B 46
	ld hl, $00ce ; A363B (28:763b) -> 21 CE 00
	scall CheckEventFlag ; A363E (28:763e) -> CD 2E 46
	cp $01 ; A3641 (28:7641) -> FE 01
	jp nz, .asm_a3659 ; A3643 (28:7643) -> C2 59 76
	ld hl, $00cf ; A3646 (28:7646) -> 21 CF 00
	scall CheckEventFlag ; A3649 (28:7649) -> CD 2E 46
	cp $01 ; A364C (28:764c) -> FE 01
	jp nz, .asm_a3659 ; A364E (28:764e) -> C2 59 76
	ld e, $01 ; A3651 (28:7651) -> 1E 01
	ld hl, $00d3 ; A3653 (28:7653) -> 21 D3 00
	scall EventFlagAction ; A3656 (28:7656) -> CD 1B 46
.asm_a3659:
	pop bc ; A3659 (28:7659) -> C1
	ret  ; A365A (28:765a) -> C9

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
	call Func_a3730 ; A36EC (28:76ec) -> CD 30 77
	ld hl, Func_a3730 ; A36EF (28:76ef) -> 21 30 77
	scall Func_80f11 ; A36F2 (28:76f2) -> CD 11 4F
	ld e, $03 ; A36F5 (28:76f5) -> 1E 03
	ld hl, Data_a365b ; A36F7 (28:76f7) -> 21 5B 76
	scall LoadWarps ; A36FA (28:76fa) -> CD 3A 40
	ld a, $03 ; A36FD (28:76fd) -> 3E 03
	scall Func_80d01 ; A36FF (28:76ff) -> CD 01 4D
	ld e, $08 ; A3702 (28:7702) -> 1E 08
	ld hl, Data_a367c ; A3704 (28:7704) -> 21 7C 76
	scall LoadEncounters ; A3707 (28:7707) -> CD 24 4D
	ld a, $01 ; A370A (28:770a) -> 3E 01
	scall LoadPlayerSprite ; A370C (28:770c) -> CD C6 4C
	ld a, $08 ; A370F (28:770f) -> 3E 08
	scall PlayMusic ; A3711 (28:7711) -> CD E6 4E
	scall Func_8001c ; A3714 (28:7714) -> CD 1C 40
	ld hl, $02a9 ; A3717 (28:7717) -> 21 A9 02
	scall LandmarkSign ; A371A (28:771a) -> CD 72 4F
	ret  ; A371D (28:771d) -> C9

Data_a371e:
	db $0a, $0b, $03, $01, $03, $0c

Data_a3724:
	db $0a, $0b, $03, $01, $03, $0b

Data_a372a:
	db $0a, $0b, $03, $01, $03, $0a

Func_a3730:
	ld hl, $00d1 ; A3730 (28:7730) -> 21 D1 00
	scall CheckEventFlag ; A3733 (28:7733) -> CD 2E 46
	cp $01 ; A3736 (28:7736) -> FE 01
	jp z, .asm_a3751 ; A3738 (28:7738) -> CA 51 77
	ld hl, $00d2 ; A373B (28:773b) -> 21 D2 00
	scall CheckEventFlag ; A373E (28:773e) -> CD 2E 46
	cp $01 ; A3741 (28:7741) -> FE 01
	jp z, .asm_a3751 ; A3743 (28:7743) -> CA 51 77
	ld hl, $00d3 ; A3746 (28:7746) -> 21 D3 00
	scall CheckEventFlag ; A3749 (28:7749) -> CD 2E 46
	cp $01 ; A374C (28:774c) -> FE 01
	jp nz, .asm_a3787 ; A374E (28:774e) -> C2 87 77
.asm_a3751:
	ld hl, $00d1 ; A3751 (28:7751) -> 21 D1 00
	scall CheckEventFlag ; A3754 (28:7754) -> CD 2E 46
	cp $01 ; A3757 (28:7757) -> FE 01
	jp nz, .asm_a3762 ; A3759 (28:7759) -> C2 62 77
	ld hl, Data_a371e ; A375C (28:775c) -> 21 1E 77
	scall Func_80d9b ; A375F (28:775f) -> CD 9B 4D
.asm_a3762:
	ld hl, $00d2 ; A3762 (28:7762) -> 21 D2 00
	scall CheckEventFlag ; A3765 (28:7765) -> CD 2E 46
	cp $01 ; A3768 (28:7768) -> FE 01
	jp nz, .asm_a3773 ; A376A (28:776a) -> C2 73 77
	ld hl, Data_a3724 ; A376D (28:776d) -> 21 24 77
	scall Func_80d9b ; A3770 (28:7770) -> CD 9B 4D
.asm_a3773:
	ld hl, $00d3 ; A3773 (28:7773) -> 21 D3 00
	scall CheckEventFlag ; A3776 (28:7776) -> CD 2E 46
	cp $01 ; A3779 (28:7779) -> FE 01
	jp nz, .asm_a3784 ; A377B (28:777b) -> C2 84 77
	ld hl, Data_a372a ; A377E (28:777e) -> 21 2A 77
	scall Func_80d9b ; A3781 (28:7781) -> CD 9B 4D
.asm_a3784:
	scall Func_80f02 ; A3784 (28:7784) -> CD 02 4F
.asm_a3787:
	ret  ; A3787 (28:7787) -> C9

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
	ld e, $03 ; A388C (28:788c) -> 1E 03
	ld hl, Data_a378b ; A388E (28:788e) -> 21 8B 77
	scall LoadWarps ; A3891 (28:7891) -> CD 3A 40
	ld a, $03 ; A3894 (28:7894) -> 3E 03
	scall Func_80d01 ; A3896 (28:7896) -> CD 01 4D
	ld e, $05 ; A3899 (28:7899) -> 1E 05
	ld hl, Data_a37ac ; A389B (28:789b) -> 21 AC 77
	scall LoadEncounters ; A389E (28:789e) -> CD 24 4D
	ld e, $0b ; A38A1 (28:78a1) -> 1E 0B
	ld hl, Data_a37f2 ; A38A3 (28:78a3) -> 21 F2 77
	scall LoadMapObjects ; A38A6 (28:78a6) -> CD FB 40
	ld a, $08 ; A38A9 (28:78a9) -> 3E 08
	scall PlayMusic ; A38AB (28:78ab) -> CD E6 4E
	scall Func_8001c ; A38AE (28:78ae) -> CD 1C 40
	ld hl, $041e ; A38B1 (28:78b1) -> 21 1E 04
	scall LandmarkSign ; A38B4 (28:78b4) -> CD 72 4F
	ret  ; A38B7 (28:78b7) -> C9

Func_a38b8:
	ld a, e ; A38B8 (28:78b8) -> 7B
	cp $02 ; A38B9 (28:78b9) -> FE 02
	jp nz, .asm_a38e8 ; A38BB (28:78bb) -> C2 E8 78
	xor a ; A38BE (28:78be) -> AF
	scall Func_80653 ; A38BF (28:78bf) -> CD 53 46
	ld c, $01 ; A38C2 (28:78c2) -> 0E 01
	ld e, $01 ; A38C4 (28:78c4) -> 1E 01
	ld a, $1b ; A38C6 (28:78c6) -> 3E 1B
	scall LoadEmote ; A38C8 (28:78c8) -> CD 76 41
	ld a, $37 ; A38CB (28:78cb) -> 3E 37
	scall PlaySFX ; A38CD (28:78cd) -> CD FE 4E
	scall WaitEmote ; A38D0 (28:78d0) -> CD D5 41
	scall HideEmote ; A38D3 (28:78d3) -> CD 8B 41
	ld a, $02 ; A38D6 (28:78d6) -> 3E 02
	scall PlayerFace ; A38D8 (28:78d8) -> CD 77 46
	ld l, $04 ; A38DB (28:78db) -> 2E 04
	push hl ; A38DD (28:78dd) -> E5
	ld c, $00 ; A38DE (28:78de) -> 0E 00
	ld e, $26 ; A38E0 (28:78e0) -> 1E 26
	ld a, $13 ; A38E2 (28:78e2) -> 3E 13
	scall Func_80dff ; A38E4 (28:78e4) -> CD FF 4D
	pop bc ; A38E7 (28:78e7) -> C1
.asm_a38e8:
	ret  ; A38E8 (28:78e8) -> C9

Func_a38e9:
	ld a, e ; A38E9 (28:78e9) -> 7B
	cp $02 ; A38EA (28:78ea) -> FE 02
	jp nz, .asm_a3919 ; A38EC (28:78ec) -> C2 19 79
	xor a ; A38EF (28:78ef) -> AF
	scall Func_80653 ; A38F0 (28:78f0) -> CD 53 46
	ld c, $01 ; A38F3 (28:78f3) -> 0E 01
	ld e, $01 ; A38F5 (28:78f5) -> 1E 01
	ld a, $1b ; A38F7 (28:78f7) -> 3E 1B
	scall LoadEmote ; A38F9 (28:78f9) -> CD 76 41
	ld a, $37 ; A38FC (28:78fc) -> 3E 37
	scall PlaySFX ; A38FE (28:78fe) -> CD FE 4E
	scall WaitEmote ; A3901 (28:7901) -> CD D5 41
	scall HideEmote ; A3904 (28:7904) -> CD 8B 41
	ld a, $02 ; A3907 (28:7907) -> 3E 02
	scall PlayerFace ; A3909 (28:7909) -> CD 77 46
	ld l, $08 ; A390C (28:790c) -> 2E 08
	push hl ; A390E (28:790e) -> E5
	ld c, $01 ; A390F (28:790f) -> 0E 01
	ld e, $26 ; A3911 (28:7911) -> 1E 26
	ld a, $13 ; A3913 (28:7913) -> 3E 13
	scall Func_80dff ; A3915 (28:7915) -> CD FF 4D
	pop bc ; A3918 (28:7918) -> C1
.asm_a3919:
	ret  ; A3919 (28:7919) -> C9

Func_a391a:
	ld a, e ; A391A (28:791a) -> 7B
	cp $02 ; A391B (28:791b) -> FE 02
	jp nz, .asm_a394a ; A391D (28:791d) -> C2 4A 79
	xor a ; A3920 (28:7920) -> AF
	scall Func_80653 ; A3921 (28:7921) -> CD 53 46
	ld c, $01 ; A3924 (28:7924) -> 0E 01
	ld e, $01 ; A3926 (28:7926) -> 1E 01
	ld a, $1b ; A3928 (28:7928) -> 3E 1B
	scall LoadEmote ; A392A (28:792a) -> CD 76 41
	ld a, $37 ; A392D (28:792d) -> 3E 37
	scall PlaySFX ; A392F (28:792f) -> CD FE 4E
	scall WaitEmote ; A3932 (28:7932) -> CD D5 41
	scall HideEmote ; A3935 (28:7935) -> CD 8B 41
	ld a, $02 ; A3938 (28:7938) -> 3E 02
	scall PlayerFace ; A393A (28:793a) -> CD 77 46
	ld l, $0a ; A393D (28:793d) -> 2E 0A
	push hl ; A393F (28:793f) -> E5
	ld c, $02 ; A3940 (28:7940) -> 0E 02
	ld e, $26 ; A3942 (28:7942) -> 1E 26
	ld a, $13 ; A3944 (28:7944) -> 3E 13
	scall Func_80dff ; A3946 (28:7946) -> CD FF 4D
	pop bc ; A3949 (28:7949) -> C1
.asm_a394a:
	ret  ; A394A (28:794a) -> C9

Func_a394b:
	ld a, e ; A394B (28:794b) -> 7B
	cp $02 ; A394C (28:794c) -> FE 02
	jp nz, .asm_a397b ; A394E (28:794e) -> C2 7B 79
	xor a ; A3951 (28:7951) -> AF
	scall Func_80653 ; A3952 (28:7952) -> CD 53 46
	ld c, $01 ; A3955 (28:7955) -> 0E 01
	ld e, $01 ; A3957 (28:7957) -> 1E 01
	ld a, $1b ; A3959 (28:7959) -> 3E 1B
	scall LoadEmote ; A395B (28:795b) -> CD 76 41
	ld a, $37 ; A395E (28:795e) -> 3E 37
	scall PlaySFX ; A3960 (28:7960) -> CD FE 4E
	scall WaitEmote ; A3963 (28:7963) -> CD D5 41
	scall HideEmote ; A3966 (28:7966) -> CD 8B 41
	ld a, $02 ; A3969 (28:7969) -> 3E 02
	scall PlayerFace ; A396B (28:796b) -> CD 77 46
	ld l, $0c ; A396E (28:796e) -> 2E 0C
	push hl ; A3970 (28:7970) -> E5
	ld c, $04 ; A3971 (28:7971) -> 0E 04
	ld e, $26 ; A3973 (28:7973) -> 1E 26
	ld a, $13 ; A3975 (28:7975) -> 3E 13
	scall Func_80dff ; A3977 (28:7977) -> CD FF 4D
	pop bc ; A397A (28:797a) -> C1
.asm_a397b:
	ret  ; A397B (28:797b) -> C9

Func_a397c:
	ld a, e ; A397C (28:797c) -> 7B
	cp $02 ; A397D (28:797d) -> FE 02
	jp nz, .asm_a39ac ; A397F (28:797f) -> C2 AC 79
	xor a ; A3982 (28:7982) -> AF
	scall Func_80653 ; A3983 (28:7983) -> CD 53 46
	ld c, $01 ; A3986 (28:7986) -> 0E 01
	ld e, $01 ; A3988 (28:7988) -> 1E 01
	ld a, $1b ; A398A (28:798a) -> 3E 1B
	scall LoadEmote ; A398C (28:798c) -> CD 76 41
	ld a, $37 ; A398F (28:798f) -> 3E 37
	scall PlaySFX ; A3991 (28:7991) -> CD FE 4E
	scall WaitEmote ; A3994 (28:7994) -> CD D5 41
	scall HideEmote ; A3997 (28:7997) -> CD 8B 41
	ld a, $02 ; A399A (28:799a) -> 3E 02
	scall PlayerFace ; A399C (28:799c) -> CD 77 46
	ld l, $05 ; A399F (28:799f) -> 2E 05
	push hl ; A39A1 (28:79a1) -> E5
	ld c, $05 ; A39A2 (28:79a2) -> 0E 05
	ld e, $26 ; A39A4 (28:79a4) -> 1E 26
	ld a, $13 ; A39A6 (28:79a6) -> 3E 13
	scall Func_80dff ; A39A8 (28:79a8) -> CD FF 4D
	pop bc ; A39AB (28:79ab) -> C1
.asm_a39ac:
	ret  ; A39AC (28:79ac) -> C9

Func_a39ad:
	ld a, e ; A39AD (28:79ad) -> 7B
	cp $02 ; A39AE (28:79ae) -> FE 02
	jp nz, .asm_a39dd ; A39B0 (28:79b0) -> C2 DD 79
	xor a ; A39B3 (28:79b3) -> AF
	scall Func_80653 ; A39B4 (28:79b4) -> CD 53 46
	ld c, $01 ; A39B7 (28:79b7) -> 0E 01
	ld e, $01 ; A39B9 (28:79b9) -> 1E 01
	ld a, $1b ; A39BB (28:79bb) -> 3E 1B
	scall LoadEmote ; A39BD (28:79bd) -> CD 76 41
	ld a, $37 ; A39C0 (28:79c0) -> 3E 37
	scall PlaySFX ; A39C2 (28:79c2) -> CD FE 4E
	scall WaitEmote ; A39C5 (28:79c5) -> CD D5 41
	scall HideEmote ; A39C8 (28:79c8) -> CD 8B 41
	ld a, $02 ; A39CB (28:79cb) -> 3E 02
	scall PlayerFace ; A39CD (28:79cd) -> CD 77 46
	ld l, $07 ; A39D0 (28:79d0) -> 2E 07
	push hl ; A39D2 (28:79d2) -> E5
	ld c, $05 ; A39D3 (28:79d3) -> 0E 05
	ld e, $26 ; A39D5 (28:79d5) -> 1E 26
	ld a, $13 ; A39D7 (28:79d7) -> 3E 13
	scall Func_80dff ; A39D9 (28:79d9) -> CD FF 4D
	pop bc ; A39DC (28:79dc) -> C1
.asm_a39dd:
	ret  ; A39DD (28:79dd) -> C9

Func_a39de:
	ld a, e ; A39DE (28:79de) -> 7B
	cp $02 ; A39DF (28:79df) -> FE 02
	jp nz, .asm_a3a0e ; A39E1 (28:79e1) -> C2 0E 7A
	xor a ; A39E4 (28:79e4) -> AF
	scall Func_80653 ; A39E5 (28:79e5) -> CD 53 46
	ld c, $01 ; A39E8 (28:79e8) -> 0E 01
	ld e, $01 ; A39EA (28:79ea) -> 1E 01
	ld a, $1b ; A39EC (28:79ec) -> 3E 1B
	scall LoadEmote ; A39EE (28:79ee) -> CD 76 41
	ld a, $37 ; A39F1 (28:79f1) -> 3E 37
	scall PlaySFX ; A39F3 (28:79f3) -> CD FE 4E
	scall WaitEmote ; A39F6 (28:79f6) -> CD D5 41
	scall HideEmote ; A39F9 (28:79f9) -> CD 8B 41
	ld a, $02 ; A39FC (28:79fc) -> 3E 02
	scall PlayerFace ; A39FE (28:79fe) -> CD 77 46
	ld l, $0a ; A3A01 (28:7a01) -> 2E 0A
	push hl ; A3A03 (28:7a03) -> E5
	ld c, $06 ; A3A04 (28:7a04) -> 0E 06
	ld e, $26 ; A3A06 (28:7a06) -> 1E 26
	ld a, $13 ; A3A08 (28:7a08) -> 3E 13
	scall Func_80dff ; A3A0A (28:7a0a) -> CD FF 4D
	pop bc ; A3A0D (28:7a0d) -> C1
.asm_a3a0e:
	ret  ; A3A0E (28:7a0e) -> C9

Func_a3a0f:
	ld a, e ; A3A0F (28:7a0f) -> 7B
	cp $02 ; A3A10 (28:7a10) -> FE 02
	jp nz, .asm_a3a3f ; A3A12 (28:7a12) -> C2 3F 7A
	xor a ; A3A15 (28:7a15) -> AF
	scall Func_80653 ; A3A16 (28:7a16) -> CD 53 46
	ld c, $01 ; A3A19 (28:7a19) -> 0E 01
	ld e, $01 ; A3A1B (28:7a1b) -> 1E 01
	ld a, $1b ; A3A1D (28:7a1d) -> 3E 1B
	scall LoadEmote ; A3A1F (28:7a1f) -> CD 76 41
	ld a, $37 ; A3A22 (28:7a22) -> 3E 37
	scall PlaySFX ; A3A24 (28:7a24) -> CD FE 4E
	scall WaitEmote ; A3A27 (28:7a27) -> CD D5 41
	scall HideEmote ; A3A2A (28:7a2a) -> CD 8B 41
	ld a, $02 ; A3A2D (28:7a2d) -> 3E 02
	scall PlayerFace ; A3A2F (28:7a2f) -> CD 77 46
	ld l, $04 ; A3A32 (28:7a32) -> 2E 04
	push hl ; A3A34 (28:7a34) -> E5
	ld c, $07 ; A3A35 (28:7a35) -> 0E 07
	ld e, $26 ; A3A37 (28:7a37) -> 1E 26
	ld a, $13 ; A3A39 (28:7a39) -> 3E 13
	scall Func_80dff ; A3A3B (28:7a3b) -> CD FF 4D
	pop bc ; A3A3E (28:7a3e) -> C1
.asm_a3a3f:
	ret  ; A3A3F (28:7a3f) -> C9

Func_a3a40:
	ld a, e ; A3A40 (28:7a40) -> 7B
	cp $02 ; A3A41 (28:7a41) -> FE 02
	jp nz, .asm_a3a70 ; A3A43 (28:7a43) -> C2 70 7A
	xor a ; A3A46 (28:7a46) -> AF
	scall Func_80653 ; A3A47 (28:7a47) -> CD 53 46
	ld c, $01 ; A3A4A (28:7a4a) -> 0E 01
	ld e, $01 ; A3A4C (28:7a4c) -> 1E 01
	ld a, $1b ; A3A4E (28:7a4e) -> 3E 1B
	scall LoadEmote ; A3A50 (28:7a50) -> CD 76 41
	ld a, $37 ; A3A53 (28:7a53) -> 3E 37
	scall PlaySFX ; A3A55 (28:7a55) -> CD FE 4E
	scall WaitEmote ; A3A58 (28:7a58) -> CD D5 41
	scall HideEmote ; A3A5B (28:7a5b) -> CD 8B 41
	ld a, $02 ; A3A5E (28:7a5e) -> 3E 02
	scall PlayerFace ; A3A60 (28:7a60) -> CD 77 46
	ld l, $0c ; A3A63 (28:7a63) -> 2E 0C
	push hl ; A3A65 (28:7a65) -> E5
	ld c, $07 ; A3A66 (28:7a66) -> 0E 07
	ld e, $26 ; A3A68 (28:7a68) -> 1E 26
	ld a, $13 ; A3A6A (28:7a6a) -> 3E 13
	scall Func_80dff ; A3A6C (28:7a6c) -> CD FF 4D
	pop bc ; A3A6F (28:7a6f) -> C1
.asm_a3a70:
	ret  ; A3A70 (28:7a70) -> C9

Func_a3a71:
	ld a, e ; A3A71 (28:7a71) -> 7B
	cp $02 ; A3A72 (28:7a72) -> FE 02
	jp nz, .asm_a3aa1 ; A3A74 (28:7a74) -> C2 A1 7A
	xor a ; A3A77 (28:7a77) -> AF
	scall Func_80653 ; A3A78 (28:7a78) -> CD 53 46
	ld c, $01 ; A3A7B (28:7a7b) -> 0E 01
	ld e, $01 ; A3A7D (28:7a7d) -> 1E 01
	ld a, $1b ; A3A7F (28:7a7f) -> 3E 1B
	scall LoadEmote ; A3A81 (28:7a81) -> CD 76 41
	ld a, $37 ; A3A84 (28:7a84) -> 3E 37
	scall PlaySFX ; A3A86 (28:7a86) -> CD FE 4E
	scall WaitEmote ; A3A89 (28:7a89) -> CD D5 41
	scall HideEmote ; A3A8C (28:7a8c) -> CD 8B 41
	ld a, $02 ; A3A8F (28:7a8f) -> 3E 02
	scall PlayerFace ; A3A91 (28:7a91) -> CD 77 46
	ld l, $07 ; A3A94 (28:7a94) -> 2E 07
	push hl ; A3A96 (28:7a96) -> E5
	ld c, $09 ; A3A97 (28:7a97) -> 0E 09
	ld e, $26 ; A3A99 (28:7a99) -> 1E 26
	ld a, $13 ; A3A9B (28:7a9b) -> 3E 13
	scall Func_80dff ; A3A9D (28:7a9d) -> CD FF 4D
	pop bc ; A3AA0 (28:7aa0) -> C1
.asm_a3aa1:
	ret  ; A3AA1 (28:7aa1) -> C9

Func_a3aa2:
	ld a, e ; A3AA2 (28:7aa2) -> 7B
	cp $02 ; A3AA3 (28:7aa3) -> FE 02
	jp nz, .asm_a3ad2 ; A3AA5 (28:7aa5) -> C2 D2 7A
	xor a ; A3AA8 (28:7aa8) -> AF
	scall Func_80653 ; A3AA9 (28:7aa9) -> CD 53 46
	ld c, $01 ; A3AAC (28:7aac) -> 0E 01
	ld e, $01 ; A3AAE (28:7aae) -> 1E 01
	ld a, $1b ; A3AB0 (28:7ab0) -> 3E 1B
	scall LoadEmote ; A3AB2 (28:7ab2) -> CD 76 41
	ld a, $37 ; A3AB5 (28:7ab5) -> 3E 37
	scall PlaySFX ; A3AB7 (28:7ab7) -> CD FE 4E
	scall WaitEmote ; A3ABA (28:7aba) -> CD D5 41
	scall HideEmote ; A3ABD (28:7abd) -> CD 8B 41
	ld a, $02 ; A3AC0 (28:7ac0) -> 3E 02
	scall PlayerFace ; A3AC2 (28:7ac2) -> CD 77 46
	ld l, $0a ; A3AC5 (28:7ac5) -> 2E 0A
	push hl ; A3AC7 (28:7ac7) -> E5
	ld c, $0a ; A3AC8 (28:7ac8) -> 0E 0A
	ld e, $26 ; A3ACA (28:7aca) -> 1E 26
	ld a, $13 ; A3ACC (28:7acc) -> 3E 13
	scall Func_80dff ; A3ACE (28:7ace) -> CD FF 4D
	pop bc ; A3AD1 (28:7ad1) -> C1
.asm_a3ad2:
	ret  ; A3AD2 (28:7ad2) -> C9

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
	ld e, $02 ; A3B2F (28:7b2f) -> 1E 02
	ld hl, Data_a3ad3 ; A3B31 (28:7b31) -> 21 D3 7A
	scall LoadWarps ; A3B34 (28:7b34) -> CD 3A 40
	ld a, $03 ; A3B37 (28:7b37) -> 3E 03
	scall Func_80d01 ; A3B39 (28:7b39) -> CD 01 4D
	ld e, $05 ; A3B3C (28:7b3c) -> 1E 05
	ld hl, Data_a3ae9 ; A3B3E (28:7b3e) -> 21 E9 7A
	scall LoadEncounters ; A3B41 (28:7b41) -> CD 24 4D
	ld a, $08 ; A3B44 (28:7b44) -> 3E 08
	scall PlayMusic ; A3B46 (28:7b46) -> CD E6 4E
	scall Func_8001c ; A3B49 (28:7b49) -> CD 1C 40
	ld hl, $041f ; A3B4C (28:7b4c) -> 21 1F 04
	scall LandmarkSign ; A3B4F (28:7b4f) -> CD 72 4F
	ret  ; A3B52 (28:7b52) -> C9

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
	call Func_a3c8b ; A3BC8 (28:7bc8) -> CD 8B 7C
	ld hl, Func_a3c8b ; A3BCB (28:7bcb) -> 21 8B 7C
	scall Func_80f11 ; A3BCE (28:7bce) -> CD 11 4F
	ld e, $01 ; A3BD1 (28:7bd1) -> 1E 01
	ld hl, Data_a3b53 ; A3BD3 (28:7bd3) -> 21 53 7B
	scall LoadWarps ; A3BD6 (28:7bd6) -> CD 3A 40
	ld e, $01 ; A3BD9 (28:7bd9) -> 1E 01
	ld hl, Data_a3b61 ; A3BDB (28:7bdb) -> 21 61 7B
	scall Func_80ce7 ; A3BDE (28:7bde) -> CD E7 4C
	ld a, $03 ; A3BE1 (28:7be1) -> 3E 03
	scall Func_80d01 ; A3BE3 (28:7be3) -> CD 01 4D
	ld e, $05 ; A3BE6 (28:7be6) -> 1E 05
	ld hl, Data_a3b82 ; A3BE8 (28:7be8) -> 21 82 7B
	scall LoadEncounters ; A3BEB (28:7beb) -> CD 24 4D
	ld e, $02 ; A3BEE (28:7bee) -> 1E 02
	ld hl, Data_a3b66 ; A3BF0 (28:7bf0) -> 21 66 7B
	scall LoadMapObjects ; A3BF3 (28:7bf3) -> CD FB 40
	ld hl, $00ec ; A3BF6 (28:7bf6) -> 21 EC 00
	scall CheckEventFlag ; A3BF9 (28:7bf9) -> CD 2E 46
	cp $01 ; A3BFC (28:7bfc) -> FE 01
	jp nz, label_a3c08 ; A3BFE (28:7bfe) -> C2 08 7C
	ld e, $00 ; A3C01 (28:7c01) -> 1E 00
	ld a, $01 ; A3C03 (28:7c03) -> 3E 01
	scall SetPersonVisibilityState ; A3C05 (28:7c05) -> CD 3D 41
label_a3c08:
	ld a, $08 ; A3C08 (28:7c08) -> 3E 08
	scall PlayMusic ; A3C0A (28:7c0a) -> CD E6 4E
	scall Func_8001c ; A3C0D (28:7c0d) -> CD 1C 40
	ld hl, $045d ; A3C10 (28:7c10) -> 21 5D 04
	scall LandmarkSign ; A3C13 (28:7c13) -> CD 72 4F
	ret  ; A3C16 (28:7c16) -> C9

Func_a3c17:: ; a3c17
		ld hl, $c21a ; A3C17 (28:7c17) -> 21 1A C2
	ld [hl], $02 ; A3C1A (28:7c1a) -> 36 02
	inc hl ; A3C1C (28:7c1c) -> 23
	ld [hl], $a8 ; A3C1D (28:7c1d) -> 36 A8
	inc hl ; A3C1F (28:7c1f) -> 23
	ld [hl], $4b ; A3C20 (28:7c20) -> 36 4B
	xor a ; A3C22 (28:7c22) -> AF
	call FarCall ; A3C23 (28:7c23) -> CD F8 03
	ld a, $3a ; A3C26 (28:7c26) -> 3E 3A
	call PlaySFX_28 ; A3C28 (28:7c28) -> CD FE 4E
	ld c, $01 ; A3C2B (28:7c2b) -> 0E 01
	ld e, $01 ; A3C2D (28:7c2d) -> 1E 01
	ld a, $0a ; A3C2F (28:7c2f) -> 3E 0A
	call LoadEmote_28 ; A3C31 (28:7c31) -> CD 76 41
	ld a, [wc799] ; A3C34 (28:7c34) -> FA 99 C7
	cp $02 ; A3C37 (28:7c37) -> FE 02
	jp z, .asm_a3c63 ; A3C39 (28:7c39) -> CA 63 7C
	cp $01 ; A3C3C (28:7c3c) -> FE 01
	jp z, .asm_a3c54 ; A3C3E (28:7c3e) -> CA 54 7C
	or a ; A3C41 (28:7c41) -> B7
	jp nz, .asm_a3c6f ; A3C42 (28:7c42) -> C2 6F 7C
	ld e, $19 ; A3C45 (28:7c45) -> 1E 19
	ld a, $03 ; A3C47 (28:7c47) -> 3E 03
	call MoveEmote_28 ; A3C49 (28:7c49) -> CD E4 41
	ld a, $01 ; A3C4C (28:7c4c) -> 3E 01
	ld [wc799], a ; A3C4E (28:7c4e) -> EA 99 C7
	jp .asm_a3c6f ; A3C51 (28:7c51) -> C3 6F 7C
.asm_a3c54:
	ld e, $14 ; A3C54 (28:7c54) -> 1E 14
	ld a, $03 ; A3C56 (28:7c56) -> 3E 03
	call MoveEmote_28 ; A3C58 (28:7c58) -> CD E4 41
	ld a, $02 ; A3C5B (28:7c5b) -> 3E 02
	ld [wc799], a ; A3C5D (28:7c5d) -> EA 99 C7
	jp .asm_a3c6f ; A3C60 (28:7c60) -> C3 6F 7C
.asm_a3c63:
	ld e, $0f ; A3C63 (28:7c63) -> 1E 0F
	ld a, $03 ; A3C65 (28:7c65) -> 3E 03
	call MoveEmote_28 ; A3C67 (28:7c67) -> CD E4 41
	ld a, $03 ; A3C6A (28:7c6a) -> 3E 03
	ld [wc799], a ; A3C6C (28:7c6c) -> EA 99 C7
.asm_a3c6f:
	call WaitEmote_28 ; A3C6F (28:7c6f) -> CD D5 41
	call HideEmote_28 ; A3C72 (28:7c72) -> CD 8B 41
	call Func_a3c8b ; A3C75 (28:7c75) -> CD 8B 7C
	ret  ; A3C78 (28:7c78) -> C9

Data_a3c79:
	db $02, $1b, $01, $02, $03, $18

Data_a3c7f:
	db $02, $1b, $01, $02, $03, $13

Data_a3c85:
	db $02, $1b, $01, $02, $03, $0e

Func_a3c8b:
	ld a, [wc799] ; A3C8B (28:7c8b) -> FA 99 C7
	cp $03 ; A3C8E (28:7c8e) -> FE 03
	jp z, .asm_a3cb5 ; A3C90 (28:7c90) -> CA B5 7C
	cp $02 ; A3C93 (28:7c93) -> FE 02
	jp z, .asm_a3ca6 ; A3C95 (28:7c95) -> CA A6 7C
	cp $01 ; A3C98 (28:7c98) -> FE 01
	jp nz, .asm_a3cc7 ; A3C9A (28:7c9a) -> C2 C7 7C
	ld hl, Data_a3c79 ; A3C9D (28:7c9d) -> 21 79 7C
	call Func_80d9b_28 ; A3CA0 (28:7ca0) -> CD 9B 4D
	jp .asm_a3cc7 ; A3CA3 (28:7ca3) -> C3 C7 7C
.asm_a3ca6:
	ld hl, Data_a3c79 ; A3CA6 (28:7ca6) -> 21 79 7C
	call Func_80d9b_28 ; A3CA9 (28:7ca9) -> CD 9B 4D
	ld hl, Data_a3c7f ; A3CAC (28:7cac) -> 21 7F 7C
	call Func_80d9b_28 ; A3CAF (28:7caf) -> CD 9B 4D
	jp .asm_a3cc7 ; A3CB2 (28:7cb2) -> C3 C7 7C
.asm_a3cb5:
	ld hl, Data_a3c79 ; A3CB5 (28:7cb5) -> 21 79 7C
	call Func_80d9b_28 ; A3CB8 (28:7cb8) -> CD 9B 4D
	ld hl, Data_a3c7f ; A3CBB (28:7cbb) -> 21 7F 7C
	call Func_80d9b_28 ; A3CBE (28:7cbe) -> CD 9B 4D
	ld hl, Data_a3c85 ; A3CC1 (28:7cc1) -> 21 85 7C
	call Func_80d9b_28 ; A3CC4 (28:7cc4) -> CD 9B 4D
.asm_a3cc7:
	call Func_80f02_28 ; A3CC7 (28:7cc7) -> CD 02 4F
	ret  ; A3CCA (28:7cca) -> C9

Data_a3ccb:
	db $02, $1a, $ff, $ff

Data_a3ccf:
	db $02, $1b, $03, $1b, $ff, $ff

Func_a3cd5:
	ld a, e ; A3CD5 (28:7cd5) -> 7B
	or a ; A3CD6 (28:7cd6) -> B7
	jp nz, .asm_a3d72 ; A3CD7 (28:7cd7) -> C2 72 7D
	ld a, [wPlayerFacing] ; A3CDA (28:7cda) -> FA 38 C8
	cp $01 ; A3CDD (28:7cdd) -> FE 01
	jp nz, .asm_a3cf6 ; A3CDF (28:7cdf) -> C2 F6 7C
	ld c, $01 ; A3CE2 (28:7ce2) -> 0E 01
	ld de, Data_a3ccf ; A3CE4 (28:7ce4) -> 11 CF 7C
	ld a, $28 ; A3CE7 (28:7ce7) -> 3E 28
	call MovePlayer_28 ; A3CE9 (28:7ce9) -> CD 3E 46
	call WaitNPCStep_28 ; A3CEC (28:7cec) -> CD 0C 42
	xor a ; A3CEF (28:7cef) -> AF
	call PlayerFace_28 ; A3CF0 (28:7cf0) -> CD 77 46
	jp .asm_a3cf6 ; A3CF3 (28:7cf3) -> C3 F6 7C
.asm_a3cf6:
	ld a, $01 ; A3CF6 (28:7cf6) -> 3E 01
	call FacePlayer_28 ; A3CF8 (28:7cf8) -> CD 4B 44
	ld a, [wc790] ; A3CFB (28:7cfb) -> FA 90 C7
	cp $05 ; A3CFE (28:7cfe) -> FE 05
	jp nc, .asm_a3d51 ; A3D00 (28:7d00) -> D2 51 7D
	ld a, $2e ; A3D03 (28:7d03) -> 3E 2E
	call Func_80e5d_28 ; A3D05 (28:7d05) -> CD 5D 4E
	cp $01 ; A3D08 (28:7d08) -> FE 01
	jp nz, .asm_a3d51 ; A3D0A (28:7d0a) -> C2 51 7D
	ld hl, $00ec ; A3D0D (28:7d0d) -> 21 EC 00
	call CheckEventFlag_28 ; A3D10 (28:7d10) -> CD 2E 46
	or a ; A3D13 (28:7d13) -> B7
	jp nz, .asm_a3d48 ; A3D14 (28:7d14) -> C2 48 7D
	ld hl, $045c ; A3D17 (28:7d17) -> 21 5C 04
	call PrintTextWithNPCName_28 ; A3D1A (28:7d1a) -> CD A9 44
	ld hl, $001e ; A3D1D (28:7d1d) -> 21 1E 00
	call ScriptSleep_28 ; A3D20 (28:7d20) -> CD 8F 46
	ld bc, Data_a3ccb ; A3D23 (28:7d23) -> 01 CB 7C
	ld e, $28 ; A3D26 (28:7d26) -> 1E 28
	ld a, $01 ; A3D28 (28:7d28) -> 3E 01
	call MovePersonAndWait_28 ; A3D2A (28:7d2a) -> CD 88 46
	call WaitNPCStep_28 ; A3D2D (28:7d2d) -> CD 0C 42
	ld hl, $001e ; A3D30 (28:7d30) -> 21 1E 00
	call ScriptSleep_28 ; A3D33 (28:7d33) -> CD 8F 46
	ld e, $01 ; A3D36 (28:7d36) -> 1E 01
	ld a, $01 ; A3D38 (28:7d38) -> 3E 01
	call SpriteFace_28 ; A3D3A (28:7d3a) -> CD 95 40
	ld e, $01 ; A3D3D (28:7d3d) -> 1E 01
	ld hl, $00ec ; A3D3F (28:7d3f) -> 21 EC 00
	call EventFlagAction_28 ; A3D42 (28:7d42) -> CD 1B 46
	jp .asm_a3d4e ; A3D45 (28:7d45) -> C3 4E 7D
.asm_a3d48:
	ld hl, $010f ; A3D48 (28:7d48) -> 21 0F 01
	call PrintTextStandard_28 ; A3D4B (28:7d4b) -> CD 98 44
.asm_a3d4e:
	jp .asm_a3d72 ; A3D4E (28:7d4e) -> C3 72 7D
.asm_a3d51:
	ld hl, $00ec ; A3D51 (28:7d51) -> 21 EC 00
	call CheckEventFlag_28 ; A3D54 (28:7d54) -> CD 2E 46
	cp $01 ; A3D57 (28:7d57) -> FE 01
	jp nz, .asm_a3d65 ; A3D59 (28:7d59) -> C2 65 7D
	ld hl, $010f ; A3D5C (28:7d5c) -> 21 0F 01
	call PrintTextStandard_28 ; A3D5F (28:7d5f) -> CD 98 44
	jp .asm_a3d72 ; A3D62 (28:7d62) -> C3 72 7D
.asm_a3d65:
	ld hl, $045b ; A3D65 (28:7d65) -> 21 5B 04
	call PrintTextWithNPCName_28 ; A3D68 (28:7d68) -> CD A9 44
	ld e, $00 ; A3D6B (28:7d6b) -> 1E 00
	ld a, $01 ; A3D6D (28:7d6d) -> 3E 01
	call SpriteFace_28 ; A3D6F (28:7d6f) -> CD 95 40
.asm_a3d72:
	ret  ; A3D72 (28:7d72) -> C9

Data_a3d73:
IF DEF(SUN)
	db $04, $0c, $03, $01
	db $13, $14, $0c, $02, $0c, $03, $2e, $00, $04, $0b, $08, $5f, $28, $2d, $79, $05
	db $06, $00, $05, $0a, $00, $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e
	db $05, $0a, $00, $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a
	db $00, $19, $0c, $05, $05, $01, $01, $02, $04, $00, $28, $00, $00, $00, $00, $12
	db $0c, $05, $05, $01, $01, $02, $04, $01, $28, $00, $00, $00, $00
ELIF DEF(STAR)
	db $04, $0c, $03, $01
	db $13, $14, $0c, $02, $0c, $03, $2e, $00, $04, $0b, $08, $26, $28, $2d, $5d, $01
	db $01, $00, $05, $0a, $00, $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e
	db $05, $0a, $00, $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a
	db $00, $19, $0c, $05, $05, $01, $01, $02, $04, $00, $28, $00, $00, $00, $00, $2c
	db $0c, $05, $05, $01, $01, $02, $04, $01, $28, $00, $00, $00, $00
ENDC

Func_a3dc4:: ; a3dc4
IF DEF(SUN)
	db $1e, $01, $21, $73, $7d, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $3e, $03, $cd
	db $01, $4d, $1e, $03, $21, $7e, $7d, $cd, $24, $4d, $21, $c7, $00, $cd, $2e, $46
	db $b7, $c2, $05, $7e, $1e, $02, $21, $a8, $7d, $cd, $fb, $40, $3e, $01, $ea, $da
	db $c7, $1e, $00, $3e, $01, $cd, $3d, $41, $cd, $1c, $40, $cd, $3c, $7e, $c3, $08
	db $7e, $cd, $1c, $40, $c9, $05, $06, $ff, $ff, $06, $07, $05, $0b, $ff, $ff, $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $46
	db $07, $28, $07, $07, $07, $6a, $01, $0b, $21, $3e, $04, $cd, $a9, $44, $af, $ea
	db $da, $c7, $cd, $02, $4f, $21, $1e, $00, $cd, $8f, $46, $0e, $01, $11, $09, $7e
	db $3e, $28, $cd, $3e, $46, $cd, $0c, $42, $11, $51, $7f, $21, $13, $7e, $cd, $d3
	db $4d, $b7, $c2, $6a, $7e, $c9, $21, $3f, $04, $cd, $a9, $44, $af, $cd, $e6, $4e
	db $3e, $18, $cd, $e6, $4e, $01, $0d, $7e, $1e, $28, $af, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $af, $cd, $3d, $41, $3e, $12, $cd, $e6, $4e, $21, $3c, $00, $cd
	db $8f, $46, $0e, $01, $1e, $01, $3e, $05, $cd, $76, $41, $1e, $06, $3e, $05, $cd
	db $e4, $41, $3e, $28, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $21, $1e, $00
	db $cd, $8f, $46, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76
	db $41, $1e, $05, $3e, $05, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28
	db $cd, $fe, $4e, $1e, $01, $3e, $01, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e
	db $03, $3e, $01, $cd, $95, $40, $1e, $00, $3e, $01, $cd, $95, $40, $1e, $01, $3e
	db $01, $cd, $95, $40, $1e, $02, $3e, $01, $cd, $95, $40, $1e, $03, $3e, $01, $cd
	db $95, $40, $1e, $00, $3e, $01, $cd, $95, $40, $1e, $01, $3e, $01, $cd, $95, $40
	db $1e, $02, $3e, $01, $cd, $95, $40, $01, $09, $7e, $1e, $28, $3e, $01, $cd, $88
	db $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $3e, $2a, $cd, $fe, $4e
	db $21, $40, $04, $cd, $98, $44, $0e, $28, $1e, $00, $3e, $95, $cd, $87, $4d, $fe
	db $ff, $c2, $48, $7f, $1e, $01, $21, $c7, $00, $cd, $1b, $46, $c9, $28, $c5, $bf
	db $de, $c9, $bc, $de, $dd, $cc, $de, $c2, $29, $00

ELIF DEF(STAR)
	db $1e, $01, $21, $b9, $7d, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $3e, $03, $cd
	db $01, $4d, $1e, $03, $21, $c4, $7d, $cd, $24, $4d, $21, $c7, $00, $cd, $2e, $46
	db $b7, $c2, $4b, $7e, $1e, $02, $21, $ee, $7d, $cd, $fb, $40, $3e, $01, $ea, $da
	db $c7, $1e, $00, $3e, $01, $cd, $3d, $41, $cd, $1c, $40, $cd, $82, $7e, $c3, $4e
	db $7e, $cd, $1c, $40, $c9, $05, $06, $ff, $ff, $06, $07, $05, $0b, $ff, $ff, $00
	db $00, $00, $04, $32, $c5, $bc, $00, $00, $30, $01, $4f, $06, $28, $14, $14, $00
	db $53, $61, $06, $28, $14, $1e, $1e, $07, $72, $06, $28, $06, $09, $0b, $11, $06
	db $07, $28, $03, $03, $01, $08, $01, $0b, $21, $3e, $04, $cd, $a9, $44, $af, $ea
	db $da, $c7, $cd, $02, $4f, $21, $1e, $00, $cd, $8f, $46, $0e, $01, $11, $4f, $7e
	db $3e, $28, $cd, $3e, $46, $cd, $0c, $42, $11, $97, $7f, $21, $59, $7e, $cd, $d3
	db $4d, $b7, $c2, $b0, $7e, $c9, $21, $3f, $04, $cd, $a9, $44, $af, $cd, $e6, $4e
	db $3e, $18, $cd, $e6, $4e, $01, $53, $7e, $1e, $28, $af, $cd, $88, $46, $cd, $0c
	db $42, $1e, $00, $af, $cd, $3d, $41, $3e, $12, $cd, $e6, $4e, $21, $3c, $00, $cd
	db $8f, $46, $0e, $01, $1e, $01, $3e, $05, $cd, $76, $41, $1e, $06, $3e, $05, $cd
	db $e4, $41, $3e, $28, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $21, $1e, $00
	db $cd, $8f, $46, $3e, $5e, $cd, $fe, $4e, $0e, $02, $1e, $02, $3e, $08, $cd, $76
	db $41, $1e, $05, $3e, $05, $cd, $e4, $41, $cd, $d5, $41, $cd, $8b, $41, $3e, $28
	db $cd, $fe, $4e, $1e, $01, $3e, $01, $cd, $3d, $41, $3e, $60, $cd, $fe, $4e, $1e
	db $03, $3e, $01, $cd, $95, $40, $1e, $00, $3e, $01, $cd, $95, $40, $1e, $01, $3e
	db $01, $cd, $95, $40, $1e, $02, $3e, $01, $cd, $95, $40, $1e, $03, $3e, $01, $cd
	db $95, $40, $1e, $00, $3e, $01, $cd, $95, $40, $1e, $01, $3e, $01, $cd, $95, $40
	db $1e, $02, $3e, $01, $cd, $95, $40, $01, $4f, $7e, $1e, $28, $3e, $01, $cd, $88
	db $46, $cd, $0c, $42, $1e, $00, $3e, $01, $cd, $3d, $41, $3e, $2a, $cd, $fe, $4e
	db $21, $40, $04, $cd, $98, $44, $0e, $28, $1e, $00, $3e, $96, $cd, $87, $4d, $fe
	db $ff, $c2, $8e, $7f, $1e, $01, $21, $c7, $00, $cd, $1b, $46, $c9, $28, $c5, $bf
	db $de, $c9, $bc, $de, $dd, $cc, $de, $c2, $29, $00
ENDC


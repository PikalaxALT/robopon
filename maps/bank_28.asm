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
	db $e4, $01, $ff, $ff

Data_a111b:
	db $ec, $01, $ff, $ff

Data_a111f:
	db $e5, $01, $ff, $ff

Data_a1123:
	db $e8, $01, $ff, $ff

Data_a1127:
	db $bc, $02, $ff, $ff

Data_a112b:
	db $26, $03, $ff, $ff

Data_a112f:
	db $ab, $03, $ff, $ff

Data_a1133:
	db $ad, $03, $ff, $ff

Data_a1137:
	db $ac, $03, $ff, $ff

Data_a113b:
	db $ae, $03, $ff, $ff

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
	jp nz, label_a177c ; A16F6 (28:56f6) -> C2 7C 57
	ld hl, $003b ; A16F9 (28:56f9) -> 21 3B 00
	scall CheckEventFlag ; A16FC (28:56fc) -> CD 2E 46
	or a ; A16FF (28:56ff) -> B7
	jp nz, label_a175e ; A1700 (28:5700) -> C2 5E 57
	ld hl, $00af ; A1703 (28:5703) -> 21 AF 00
	scall PrintTextWithNPCNameAndYesNoBox ; A1706 (28:5706) -> CD CA 44
	or a ; A1709 (28:5709) -> B7
	jp nz, label_a1755 ; A170A (28:570a) -> C2 55 57
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
	jp nc, label_a1733 ; A1727 (28:5727) -> D2 33 57
	ld hl, $00b1 ; A172A (28:572a) -> 21 B1 00
	scall PrintTextWithNPCName ; A172D (28:572d) -> CD A9 44
	jp label_a1752 ; A1730 (28:5730) -> C3 52 57
label_a1733:
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
label_a1752:
	jp label_a175b ; A1752 (28:5752) -> C3 5B 57
label_a1755:
	ld hl, $00b0 ; A1755 (28:5755) -> 21 B0 00
	scall PrintTextWithNPCName ; A1758 (28:5758) -> CD A9 44
label_a175b:
	jp label_a177c ; A175B (28:575b) -> C3 7C 57
label_a175e:
	ld a, [wc790] ; A175E (28:575e) -> FA 90 C7
	or a ; A1761 (28:5761) -> B7
	jp z, label_a1776 ; A1762 (28:5762) -> CA 76 57
	ld a, [wc790] ; A1765 (28:5765) -> FA 90 C7
	cp $05 ; A1768 (28:5768) -> FE 05
	jp nc, label_a1776 ; A176A (28:576a) -> D2 76 57
	ld hl, $010f ; A176D (28:576d) -> 21 0F 01
	scall PrintTextStandard ; A1770 (28:5770) -> CD 98 44
	jp label_a177c ; A1773 (28:5773) -> C3 7C 57
label_a1776:
	ld hl, $00bf ; A1776 (28:5776) -> 21 BF 00
	scall PrintTextWithNPCName ; A1779 (28:5779) -> CD A9 44
label_a177c:
	ret  ; A177C (28:577c) -> C9

Data_a177d:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $8d, $01, $8d, $04, $19, $0c, $0d, $14, $03, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_a17a6:
	ld a, e ; A17A6 (28:57a6) -> 7B
	or a ; A17A7 (28:57a7) -> B7
	jp nz, label_a1848 ; A17A8 (28:57a8) -> C2 48 58
	ld a, $01 ; A17AB (28:57ab) -> 3E 01
	scall FacePlayer ; A17AD (28:57ad) -> CD 4B 44
	ld hl, $003b ; A17B0 (28:57b0) -> 21 3B 00
	scall CheckEventFlag ; A17B3 (28:57b3) -> CD 2E 46
	cp $01 ; A17B6 (28:57b6) -> FE 01
	jp nz, label_a1842 ; A17B8 (28:57b8) -> C2 42 58
	ld hl, $0042 ; A17BB (28:57bb) -> 21 42 00
	scall CheckEventFlag ; A17BE (28:57be) -> CD 2E 46
	or a ; A17C1 (28:57c1) -> B7
	jp nz, label_a1839 ; A17C2 (28:57c2) -> C2 39 58
	ld hl, $003d ; A17C5 (28:57c5) -> 21 3D 00
	scall CheckEventFlag ; A17C8 (28:57c8) -> CD 2E 46
	or a ; A17CB (28:57cb) -> B7
	jp nz, label_a1830 ; A17CC (28:57cc) -> C2 30 58
	ld hl, $00c1 ; A17CF (28:57cf) -> 21 C1 00
	scall PrintTextWithYesNoBox ; A17D2 (28:57d2) -> CD BA 44
	or a ; A17D5 (28:57d5) -> B7
	jp nz, label_a1827 ; A17D6 (28:57d6) -> C2 27 58
	ld hl, $00c6 ; A17D9 (28:57d9) -> 21 C6 00
	scall PrintTextStandard ; A17DC (28:57dc) -> CD 98 44
	ld de, Data_a1849 ; A17DF (28:57df) -> 11 49 58
	ld hl, Data_a177d ; A17E2 (28:57e2) -> 21 7D 57
	scall ScriptedBattle ; A17E5 (28:57e5) -> CD D3 4D
	or a ; A17E8 (28:57e8) -> B7
	jp nz, label_a17ef ; A17E9 (28:57e9) -> C2 EF 57
	jp label_a1848 ; A17EC (28:57ec) -> C3 48 58
label_a17ef:
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
	jp label_a182d ; A1824 (28:5824) -> C3 2D 58
label_a1827:
	ld hl, $00c7 ; A1827 (28:5827) -> 21 C7 00
	scall PrintTextStandard ; A182A (28:582a) -> CD 98 44
label_a182d:
	jp label_a1836 ; A182D (28:582d) -> C3 36 58
label_a1830:
	ld hl, $00b7 ; A1830 (28:5830) -> 21 B7 00
	scall PrintTextStandard ; A1833 (28:5833) -> CD 98 44
label_a1836:
	jp label_a183f ; A1836 (28:5836) -> C3 3F 58
label_a1839:
	ld hl, $00b5 ; A1839 (28:5839) -> 21 B5 00
	scall PrintTextStandard ; A183C (28:583c) -> CD 98 44
label_a183f:
	jp label_a1848 ; A183F (28:583f) -> C3 48 58
label_a1842:
	ld hl, $00c0 ; A1842 (28:5842) -> 21 C0 00
	scall PrintTextStandard ; A1845 (28:5845) -> CD 98 44
label_a1848:
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
	jp nz, label_a192b ; A187D (28:587d) -> C2 2B 59
	ld a, $02 ; A1880 (28:5880) -> 3E 02
	scall FacePlayer ; A1882 (28:5882) -> CD 4B 44
	ld hl, $003b ; A1885 (28:5885) -> 21 3B 00
	scall CheckEventFlag ; A1888 (28:5888) -> CD 2E 46
	cp $01 ; A188B (28:588b) -> FE 01
	jp nz, label_a1925 ; A188D (28:588d) -> C2 25 59
	ld hl, $0042 ; A1890 (28:5890) -> 21 42 00
	scall CheckEventFlag ; A1893 (28:5893) -> CD 2E 46
	or a ; A1896 (28:5896) -> B7
	jp nz, label_a191c ; A1897 (28:5897) -> C2 1C 59
	ld hl, $003e ; A189A (28:589a) -> 21 3E 00
	scall CheckEventFlag ; A189D (28:589d) -> CD 2E 46
	or a ; A18A0 (28:58a0) -> B7
	jp nz, label_a1913 ; A18A1 (28:58a1) -> C2 13 59
	ld hl, $00c2 ; A18A4 (28:58a4) -> 21 C2 00
	scall PrintTextWithYesNoBox ; A18A7 (28:58a7) -> CD BA 44
	or a ; A18AA (28:58aa) -> B7
	jp nz, label_a190a ; A18AB (28:58ab) -> C2 0A 59
	ld hl, $00c6 ; A18AE (28:58ae) -> 21 C6 00
	scall PrintTextStandard ; A18B1 (28:58b1) -> CD 98 44
	ld hl, $015e ; A18B4 (28:58b4) -> 21 5E 01
	scall PrintTextStandard ; A18B7 (28:58b7) -> CD 98 44
label_a18ba:
	ld de, Data_a192c ; A18BA (28:58ba) -> 11 2C 59
	ld hl, Data_a1852 ; A18BD (28:58bd) -> 21 52 58
	scall Func_803f5 ; A18C0 (28:58c0) -> CD F4 43
	or a ; A18C3 (28:58c3) -> B7
	jp nz, label_a18d2 ; A18C4 (28:58c4) -> C2 D2 58
	ld a, [wc7c4] ; A18C7 (28:58c7) -> FA C4 C7
	cp $01 ; A18CA (28:58ca) -> FE 01
	jp nz, label_a18ba ; A18CC (28:58cc) -> C2 BA 58
	jp label_a192b ; A18CF (28:58cf) -> C3 2B 59
label_a18d2:
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
	jp label_a1910 ; A1907 (28:5907) -> C3 10 59
label_a190a:
	ld hl, $00c7 ; A190A (28:590a) -> 21 C7 00
	scall PrintTextStandard ; A190D (28:590d) -> CD 98 44
label_a1910:
	jp label_a1919 ; A1910 (28:5910) -> C3 19 59
label_a1913:
	ld hl, $00b7 ; A1913 (28:5913) -> 21 B7 00
	scall PrintTextStandard ; A1916 (28:5916) -> CD 98 44
label_a1919:
	jp label_a1922 ; A1919 (28:5919) -> C3 22 59
label_a191c:
	ld hl, $00b5 ; A191C (28:591c) -> 21 B5 00
	scall PrintTextStandard ; A191F (28:591f) -> CD 98 44
label_a1922:
	jp label_a192b ; A1922 (28:5922) -> C3 2B 59
label_a1925:
	ld hl, $00c0 ; A1925 (28:5925) -> 21 C0 00
	scall PrintTextStandard ; A1928 (28:5928) -> CD 98 44
label_a192b:
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
	jp nz, label_a1a0e ; A1960 (28:5960) -> C2 0E 5A
	ld a, $03 ; A1963 (28:5963) -> 3E 03
	scall FacePlayer ; A1965 (28:5965) -> CD 4B 44
	ld hl, $003b ; A1968 (28:5968) -> 21 3B 00
	scall CheckEventFlag ; A196B (28:596b) -> CD 2E 46
	cp $01 ; A196E (28:596e) -> FE 01
	jp nz, label_a1a08 ; A1970 (28:5970) -> C2 08 5A
	ld hl, $0042 ; A1973 (28:5973) -> 21 42 00
	scall CheckEventFlag ; A1976 (28:5976) -> CD 2E 46
	or a ; A1979 (28:5979) -> B7
	jp nz, label_a19ff ; A197A (28:597a) -> C2 FF 59
	ld hl, $003f ; A197D (28:597d) -> 21 3F 00
	scall CheckEventFlag ; A1980 (28:5980) -> CD 2E 46
	or a ; A1983 (28:5983) -> B7
	jp nz, label_a19f6 ; A1984 (28:5984) -> C2 F6 59
	ld hl, $00c3 ; A1987 (28:5987) -> 21 C3 00
	scall PrintTextWithYesNoBox ; A198A (28:598a) -> CD BA 44
	or a ; A198D (28:598d) -> B7
	jp nz, label_a19ed ; A198E (28:598e) -> C2 ED 59
	ld hl, $00c6 ; A1991 (28:5991) -> 21 C6 00
	scall PrintTextStandard ; A1994 (28:5994) -> CD 98 44
	ld hl, $017a ; A1997 (28:5997) -> 21 7A 01
	scall PrintTextStandard ; A199A (28:599a) -> CD 98 44
label_a199d:
	ld de, Data_a1a0f ; A199D (28:599d) -> 11 0F 5A
	ld hl, Data_a1935 ; A19A0 (28:59a0) -> 21 35 59
	scall Func_802ef ; A19A3 (28:59a3) -> CD EF 42
	or a ; A19A6 (28:59a6) -> B7
	jp nz, label_a19b5 ; A19A7 (28:59a7) -> C2 B5 59
	ld a, [wc7c4] ; A19AA (28:59aa) -> FA C4 C7
	cp $01 ; A19AD (28:59ad) -> FE 01
	jp nz, label_a199d ; A19AF (28:59af) -> C2 9D 59
	jp label_a1a0e ; A19B2 (28:59b2) -> C3 0E 5A
label_a19b5:
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
	jp label_a19f3 ; A19EA (28:59ea) -> C3 F3 59
label_a19ed:
	ld hl, $00c7 ; A19ED (28:59ed) -> 21 C7 00
	scall PrintTextStandard ; A19F0 (28:59f0) -> CD 98 44
label_a19f3:
	jp label_a19fc ; A19F3 (28:59f3) -> C3 FC 59
label_a19f6:
	ld hl, $00b7 ; A19F6 (28:59f6) -> 21 B7 00
	scall PrintTextStandard ; A19F9 (28:59f9) -> CD 98 44
label_a19fc:
	jp label_a1a05 ; A19FC (28:59fc) -> C3 05 5A
label_a19ff:
	ld hl, $00b5 ; A19FF (28:59ff) -> 21 B5 00
	scall PrintTextStandard ; A1A02 (28:5a02) -> CD 98 44
label_a1a05:
	jp label_a1a0e ; A1A05 (28:5a05) -> C3 0E 5A
label_a1a08:
	ld hl, $00c0 ; A1A08 (28:5a08) -> 21 C0 00
	scall PrintTextStandard ; A1A0B (28:5a0b) -> CD 98 44
label_a1a0e:
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
	jp nz, label_a1af1 ; A1A43 (28:5a43) -> C2 F1 5A
	ld a, $04 ; A1A46 (28:5a46) -> 3E 04
	scall FacePlayer ; A1A48 (28:5a48) -> CD 4B 44
	ld hl, $003b ; A1A4B (28:5a4b) -> 21 3B 00
	scall CheckEventFlag ; A1A4E (28:5a4e) -> CD 2E 46
	cp $01 ; A1A51 (28:5a51) -> FE 01
	jp nz, label_a1aeb ; A1A53 (28:5a53) -> C2 EB 5A
	ld hl, $0042 ; A1A56 (28:5a56) -> 21 42 00
	scall CheckEventFlag ; A1A59 (28:5a59) -> CD 2E 46
	or a ; A1A5C (28:5a5c) -> B7
	jp nz, label_a1ae2 ; A1A5D (28:5a5d) -> C2 E2 5A
	ld hl, $0040 ; A1A60 (28:5a60) -> 21 40 00
	scall CheckEventFlag ; A1A63 (28:5a63) -> CD 2E 46
	or a ; A1A66 (28:5a66) -> B7
	jp nz, label_a1ad9 ; A1A67 (28:5a67) -> C2 D9 5A
	ld hl, $00c4 ; A1A6A (28:5a6a) -> 21 C4 00
	scall PrintTextWithYesNoBox ; A1A6D (28:5a6d) -> CD BA 44
	or a ; A1A70 (28:5a70) -> B7
	jp nz, label_a1ad0 ; A1A71 (28:5a71) -> C2 D0 5A
	ld hl, $00c6 ; A1A74 (28:5a74) -> 21 C6 00
	scall PrintTextStandard ; A1A77 (28:5a77) -> CD 98 44
	ld hl, $016b ; A1A7A (28:5a7a) -> 21 6B 01
	scall PrintTextStandard ; A1A7D (28:5a7d) -> CD 98 44
label_a1a80:
	ld de, Data_a1af2 ; A1A80 (28:5a80) -> 11 F2 5A
	ld hl, Data_a1a18 ; A1A83 (28:5a83) -> 21 18 5A
	scall Func_80347 ; A1A86 (28:5a86) -> CD 46 43
	or a ; A1A89 (28:5a89) -> B7
	jp nz, label_a1a98 ; A1A8A (28:5a8a) -> C2 98 5A
	ld a, [wc7c4] ; A1A8D (28:5a8d) -> FA C4 C7
	cp $01 ; A1A90 (28:5a90) -> FE 01
	jp nz, label_a1a80 ; A1A92 (28:5a92) -> C2 80 5A
	jp label_a1af1 ; A1A95 (28:5a95) -> C3 F1 5A
label_a1a98:
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
	jp label_a1ad6 ; A1ACD (28:5acd) -> C3 D6 5A
label_a1ad0:
	ld hl, $00c7 ; A1AD0 (28:5ad0) -> 21 C7 00
	scall PrintTextStandard ; A1AD3 (28:5ad3) -> CD 98 44
label_a1ad6:
	jp label_a1adf ; A1AD6 (28:5ad6) -> C3 DF 5A
label_a1ad9:
	ld hl, $00b7 ; A1AD9 (28:5ad9) -> 21 B7 00
	scall PrintTextStandard ; A1ADC (28:5adc) -> CD 98 44
label_a1adf:
	jp label_a1ae8 ; A1ADF (28:5adf) -> C3 E8 5A
label_a1ae2:
	ld hl, $00b5 ; A1AE2 (28:5ae2) -> 21 B5 00
	scall PrintTextStandard ; A1AE5 (28:5ae5) -> CD 98 44
label_a1ae8:
	jp label_a1af1 ; A1AE8 (28:5ae8) -> C3 F1 5A
label_a1aeb:
	ld hl, $00c0 ; A1AEB (28:5aeb) -> 21 C0 00
	scall PrintTextStandard ; A1AEE (28:5aee) -> CD 98 44
label_a1af1:
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
	jp nz, label_a1bd4 ; A1B26 (28:5b26) -> C2 D4 5B
	ld a, $05 ; A1B29 (28:5b29) -> 3E 05
	scall FacePlayer ; A1B2B (28:5b2b) -> CD 4B 44
	ld hl, $003b ; A1B2E (28:5b2e) -> 21 3B 00
	scall CheckEventFlag ; A1B31 (28:5b31) -> CD 2E 46
	cp $01 ; A1B34 (28:5b34) -> FE 01
	jp nz, label_a1bce ; A1B36 (28:5b36) -> C2 CE 5B
	ld hl, $0042 ; A1B39 (28:5b39) -> 21 42 00
	scall CheckEventFlag ; A1B3C (28:5b3c) -> CD 2E 46
	or a ; A1B3F (28:5b3f) -> B7
	jp nz, label_a1bc5 ; A1B40 (28:5b40) -> C2 C5 5B
	ld hl, $0041 ; A1B43 (28:5b43) -> 21 41 00
	scall CheckEventFlag ; A1B46 (28:5b46) -> CD 2E 46
	or a ; A1B49 (28:5b49) -> B7
	jp nz, label_a1bbc ; A1B4A (28:5b4a) -> C2 BC 5B
	ld hl, $00c5 ; A1B4D (28:5b4d) -> 21 C5 00
	scall PrintTextWithYesNoBox ; A1B50 (28:5b50) -> CD BA 44
	or a ; A1B53 (28:5b53) -> B7
	jp nz, label_a1bb3 ; A1B54 (28:5b54) -> C2 B3 5B
	ld hl, $00c6 ; A1B57 (28:5b57) -> 21 C6 00
	scall PrintTextStandard ; A1B5A (28:5b5a) -> CD 98 44
	ld hl, $015d ; A1B5D (28:5b5d) -> 21 5D 01
	scall PrintTextStandard ; A1B60 (28:5b60) -> CD 98 44
label_a1b63:
	ld de, Data_a1bd5 ; A1B63 (28:5b63) -> 11 D5 5B
	ld hl, Data_a1afb ; A1B66 (28:5b66) -> 21 FB 5A
	scall Func_8039e ; A1B69 (28:5b69) -> CD 9D 43
	or a ; A1B6C (28:5b6c) -> B7
	jp nz, label_a1b7b ; A1B6D (28:5b6d) -> C2 7B 5B
	ld a, [wc7c4] ; A1B70 (28:5b70) -> FA C4 C7
	cp $01 ; A1B73 (28:5b73) -> FE 01
	jp nz, label_a1b63 ; A1B75 (28:5b75) -> C2 63 5B
	jp label_a1bd4 ; A1B78 (28:5b78) -> C3 D4 5B
label_a1b7b:
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
	jp label_a1bb9 ; A1BB0 (28:5bb0) -> C3 B9 5B
label_a1bb3:
	ld hl, $00c7 ; A1BB3 (28:5bb3) -> 21 C7 00
	scall PrintTextStandard ; A1BB6 (28:5bb6) -> CD 98 44
label_a1bb9:
	jp label_a1bc2 ; A1BB9 (28:5bb9) -> C3 C2 5B
label_a1bbc:
	ld hl, $00b7 ; A1BBC (28:5bbc) -> 21 B7 00
	scall PrintTextStandard ; A1BBF (28:5bbf) -> CD 98 44
label_a1bc2:
	jp label_a1bcb ; A1BC2 (28:5bc2) -> C3 CB 5B
label_a1bc5:
	ld hl, $00b5 ; A1BC5 (28:5bc5) -> 21 B5 00
	scall PrintTextStandard ; A1BC8 (28:5bc8) -> CD 98 44
label_a1bcb:
	jp label_a1bd4 ; A1BCB (28:5bcb) -> C3 D4 5B
label_a1bce:
	ld hl, $00c0 ; A1BCE (28:5bce) -> 21 C0 00
	scall PrintTextStandard ; A1BD1 (28:5bd1) -> CD 98 44
label_a1bd4:
	ret  ; A1BD4 (28:5bd4) -> C9

Data_a1bd5:
IF DEF(SUN)
	db $28, $b8, $de, $dd, $bc, $de, $dd, $29, $00, $0a, $0d, $01, $01, $1d, $01
	db $0a, $04, $0b, $04, $2e, $01, $01, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e
	db $01, $01, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $01, $01, $01, $1d
	db $17, $21, $0a, $20, $0a, $2e, $01, $01, $01, $01, $1d, $18, $16, $13, $16, $12
	db $2e, $19, $07, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $19, $07, $01, $01
	db $1d, $16, $07, $15, $08, $15, $2e, $19, $07, $01, $01, $1d, $17, $21, $0a, $20
	db $0a, $2e, $19, $07, $01, $01, $1d, $18, $16, $13, $16, $12, $2e, $19, $13, $01
	db $01, $1d, $15, $10, $10, $0f, $10, $2e, $19, $13, $01, $01, $1d, $16, $07, $15
	db $08, $15, $2e, $19, $13, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $19, $13
	db $01, $01, $1d, $18, $16, $13, $16, $12, $2e, $00, $00, $1b, $18, $0a, $14, $18
	db $79, $04, $0f, $00, $04, $0a, $00, $00, $00, $1b, $18, $12, $14, $18, $04, $1f
	db $07, $16, $0e, $0a, $00, $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00
	db $04, $0a, $00, $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a
	db $00, $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00, $00
	db $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $1b
	db $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00, $00, $00, $1b, $18, $3e
	db $16, $1a, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $1b, $18, $44, $16, $1a
	db $79, $14, $08, $00, $0f, $0a, $00, $00, $00, $1b, $18, $06, $16, $1a, $30, $03
	db $03, $01, $0e, $0a, $00, $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00
	db $04, $0a, $00, $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a
	db $00, $00, $00, $1b, $18, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00, $00
	db $00, $1b, $18, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00, $00, $00, $1b
	db $18, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00, $00, $00, $1b, $18, $06
	db $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00, $00, $00, $1b, $18, $29, $1a, $1e
	db $10, $01, $01, $01, $04, $0a, $00, $00, $00, $1b, $18, $88, $1a, $1e, $79, $04
	db $04, $00, $04, $0a, $00, $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08
	db $0f, $0a, $00, $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a
	db $00, $00, $00, $1b, $18, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00, $00
	db $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00, $00, $00, $1b
	db $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $1b, $18, $19
	db $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00, $00, $00, $1b, $18, $0a, $1c, $20
	db $79, $04, $0f, $00, $04, $0a, $00, $00, $00, $1b, $18, $36, $1e, $22, $79, $0f
	db $0b, $00, $05, $0a, $00, $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b
	db $05, $0a, $00, $00, $00, $1b, $18, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a
	db $00, $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00, $00
	db $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00, $00, $00, $1b
	db $18, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00, $00, $00, $1b, $18, $12
	db $20, $24, $04, $1f, $07, $16, $10, $0a, $00, $00, $00, $1b, $18, $2c, $20, $24
	db $79, $06, $11, $00, $05, $0a, $00, $00, $00, $1b, $18, $32, $20, $24, $79, $07
	db $0c, $00, $11, $0a, $00, $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00
	db $05, $0a, $00
ELIF DEF(STAR)
	db $28, $b8, $de, $dd, $bc, $de, $dd, $29, $00, $0a, $0d, $01, $01, $1d, $01
	db $0a, $04, $0b, $04, $2e, $01, $01, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e
	db $01, $01, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $01, $01, $01, $1d
	db $17, $21, $0a, $20, $0a, $2e, $01, $01, $01, $01, $1d, $18, $16, $13, $16, $12
	db $2e, $19, $07, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $19, $07, $01, $01
	db $1d, $16, $07, $15, $08, $15, $2e, $19, $07, $01, $01, $1d, $17, $21, $0a, $20
	db $0a, $2e, $19, $07, $01, $01, $1d, $18, $16, $13, $16, $12, $2e, $19, $13, $01
	db $01, $1d, $15, $10, $10, $0f, $10, $2e, $19, $13, $01, $01, $1d, $16, $07, $15
	db $08, $15, $2e, $19, $13, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $19, $13
	db $01, $01, $1d, $18, $16, $13, $16, $12, $2e, $00, $00, $1b, $18, $0d, $14, $18
	db $77, $01, $05, $00, $04, $0a, $00, $00, $00, $1b, $18, $12, $14, $18, $04, $1f
	db $07, $16, $0e, $0a, $00, $00, $00, $1b, $18, $2c, $14, $18, $79, $06, $11, $00
	db $04, $0a, $00, $00, $00, $1b, $18, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a
	db $00, $00, $00, $1b, $18, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00, $00
	db $00, $1b, $18, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $1b
	db $18, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00, $00, $00, $1b, $18, $3e
	db $16, $1a, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $1b, $18, $44, $16, $1a
	db $79, $14, $08, $00, $0f, $0a, $00, $00, $00, $1b, $18, $47, $16, $1a, $78, $07
	db $07, $07, $10, $0a, $00, $00, $00, $1b, $18, $3e, $18, $1c, $79, $1f, $17, $00
	db $04, $0a, $00, $00, $00, $1b, $18, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a
	db $00, $00, $00, $1b, $18, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00, $00
	db $00, $1b, $18, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00, $00, $00, $1b
	db $18, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00, $00, $00, $1b, $18, $47
	db $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00, $00, $00, $1b, $18, $2a, $1a, $1e
	db $10, $05, $05, $05, $04, $0a, $00, $00, $00, $1b, $18, $85, $1a, $1e, $7b, $14
	db $0d, $1f, $0e, $0a, $00, $00, $00, $1b, $18, $1d, $1a, $1e, $52, $1f, $17, $08
	db $0f, $0a, $00, $00, $00, $1b, $18, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a
	db $00, $00, $00, $1b, $18, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00, $00
	db $00, $1b, $18, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00, $00, $00, $1b
	db $18, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $1b, $18, $19
	db $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00, $00, $00, $1b, $18, $0d, $1c, $20
	db $77, $01, $05, $00, $04, $0a, $00, $00, $00, $1b, $18, $36, $1e, $22, $79, $0f
	db $0b, $00, $05, $0a, $00, $00, $00, $1b, $18, $19, $1e, $22, $1a, $09, $09, $0b
	db $05, $0a, $00, $00, $00, $1b, $18, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a
	db $00, $00, $00, $1b, $18, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00, $00
	db $00, $1b, $18, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00, $00, $00, $1b
	db $18, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $1b, $18, $12
	db $20, $24, $04, $1f, $07, $16, $10, $0a, $00, $00, $00, $1b, $18, $2c, $20, $24
	db $79, $06, $11, $00, $05, $0a, $00, $00, $00, $1b, $18, $32, $20, $24, $79, $07
	db $0c, $00, $11, $0a, $00, $00, $00, $1b, $18, $3e, $20, $24, $79, $1f, $17, $00
	db $05, $0a, $00
ENDC

Func_a1e57:: ; a1e57
IF DEF(SUN)
	db $fa, $98, $c7, $b7, $c2, $6d, $5e, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $7d, $5e, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $52, $5f, $fe, $1d, $ca, $52, $5f, $fe, $1c, $ca, $52, $5f, $fe, $1b, $ca
	db $52, $5f, $fe, $1a, $ca, $52, $5f, $fe, $19, $ca, $47, $5f, $fe, $18, $ca, $47
	db $5f, $fe, $17, $ca, $47, $5f, $fe, $16, $ca, $47, $5f, $fe, $15, $ca, $47, $5f
	db $fe, $14, $ca, $3c, $5f, $fe, $13, $ca, $3c, $5f, $fe, $12, $ca, $3c, $5f, $fe
	db $11, $ca, $3c, $5f, $fe, $10, $ca, $3c, $5f, $fe, $0f, $ca, $31, $5f, $fe, $0e
	db $ca, $31, $5f, $fe, $0d, $ca, $31, $5f, $fe, $0c, $ca, $31, $5f, $fe, $0b, $ca
	db $31, $5f, $fe, $0a, $ca, $26, $5f, $fe, $09, $ca, $26, $5f, $fe, $08, $ca, $26
	db $5f, $fe, $07, $ca, $26, $5f, $fe, $06, $ca, $26, $5f, $fe, $05, $ca, $1b, $5f
	db $fe, $04, $ca, $1b, $5f, $fe, $03, $ca, $1b, $5f, $fe, $02, $ca, $1b, $5f, $fe
	db $01, $c2, $5d, $5f, $1e, $05, $21, $6d, $5c, $cd, $24, $4d, $c3, $65, $5f, $1e
	db $05, $21, $b3, $5c, $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $f9, $5c, $cd
	db $24, $4d, $c3, $65, $5f, $1e, $05, $21, $3f, $5d, $cd, $24, $4d, $c3, $65, $5f
	db $1e, $05, $21, $85, $5d, $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $cb, $5d
	db $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $11, $5e, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $a5, $5f, $cd, $e2, $5f, $21, $e2, $5f, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $e9, $5b, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $de, $5b, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $c6, $5f, $21, $f8, $00, $cd, $98, $44, $c3, $cf, $5f, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $19, $00, $01, $01, $01, $01, $19
	db $00, $01, $01, $19, $07, $19, $00, $01, $01, $19, $13, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $d0, $5f, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $10, $10, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $13, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $13, $01, $01, $1d, $16, $07, $15, $08
	db $15, $2e, $01, $13, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $01, $13, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $07, $01, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $07, $01, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $07, $01
	db $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $07, $01, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $22, $0a, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $22
	db $0a, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $22, $0a, $01, $01, $1d, $17
	db $21, $0a, $20, $0a, $2e, $22, $0a, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $24, $20, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $24, $20
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $24, $20, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $24, $20, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $24, $20, $2c, $16, $1a, $78, $06, $11
	db $00, $04, $0a, $00, $00, $00, $24, $20, $32, $16, $1a, $78, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $24, $20, $3e, $16, $1a, $78, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $24, $20, $44, $16, $1a, $78, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $24, $20, $06, $16, $1a, $2f, $03, $03, $01, $0e, $0a, $00, $00, $00, $24, $20
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $24, $20, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $24, $20, $06, $18, $1c, $30
	db $03, $03, $01, $0f, $0a, $00, $00, $00, $24, $20, $29, $18, $1c, $10, $01, $01
	db $01, $04, $0a, $00, $00, $00, $24, $20, $88, $18, $1c, $79, $04, $04, $00, $04
	db $0a, $00, $00, $00, $24, $20, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $24, $20, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00, $00, $00
	db $24, $20, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00, $00, $00, $24, $20
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $24, $20, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $24, $20, $88, $1c, $20, $79
	db $04, $04, $00, $04, $0a, $00, $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $24, $20, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $24, $20
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $24, $20, $0a, $1e
	db $22, $79, $04, $0f, $00, $05, $0a, $00, $00, $00, $24, $20, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $24, $20, $0a, $20, $24, $79, $04, $0f, $00, $05
	db $0a, $00, $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $24, $20
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $fa, $98, $c7, $b7, $c2, $6d, $5e, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $7d, $5e, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $52, $5f, $fe, $1d, $ca, $52, $5f, $fe, $1c, $ca, $52, $5f, $fe, $1b, $ca
	db $52, $5f, $fe, $1a, $ca, $52, $5f, $fe, $19, $ca, $47, $5f, $fe, $18, $ca, $47
	db $5f, $fe, $17, $ca, $47, $5f, $fe, $16, $ca, $47, $5f, $fe, $15, $ca, $47, $5f
	db $fe, $14, $ca, $3c, $5f, $fe, $13, $ca, $3c, $5f, $fe, $12, $ca, $3c, $5f, $fe
	db $11, $ca, $3c, $5f, $fe, $10, $ca, $3c, $5f, $fe, $0f, $ca, $31, $5f, $fe, $0e
	db $ca, $31, $5f, $fe, $0d, $ca, $31, $5f, $fe, $0c, $ca, $31, $5f, $fe, $0b, $ca
	db $31, $5f, $fe, $0a, $ca, $26, $5f, $fe, $09, $ca, $26, $5f, $fe, $08, $ca, $26
	db $5f, $fe, $07, $ca, $26, $5f, $fe, $06, $ca, $26, $5f, $fe, $05, $ca, $1b, $5f
	db $fe, $04, $ca, $1b, $5f, $fe, $03, $ca, $1b, $5f, $fe, $02, $ca, $1b, $5f, $fe
	db $01, $c2, $5d, $5f, $1e, $05, $21, $6d, $5c, $cd, $24, $4d, $c3, $65, $5f, $1e
	db $05, $21, $b3, $5c, $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $f9, $5c, $cd
	db $24, $4d, $c3, $65, $5f, $1e, $05, $21, $3f, $5d, $cd, $24, $4d, $c3, $65, $5f
	db $1e, $05, $21, $85, $5d, $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $cb, $5d
	db $cd, $24, $4d, $c3, $65, $5f, $1e, $05, $21, $11, $5e, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $a5, $5f, $cd, $e2, $5f, $21, $e2, $5f, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $e9, $5b, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $de, $5b, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $c6, $5f, $21, $f8, $00, $cd, $98, $44, $c3, $cf, $5f, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $19, $00, $01, $01, $01, $01, $19
	db $00, $01, $01, $19, $07, $19, $00, $01, $01, $19, $13, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $d0, $5f, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $10, $10, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $13, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $13, $01, $01, $1d, $16, $07, $15, $08
	db $15, $2e, $01, $13, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $01, $13, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $07, $01, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $07, $01, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $07, $01
	db $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $07, $01, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $22, $0a, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $22
	db $0a, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $22, $0a, $01, $01, $1d, $17
	db $21, $0a, $20, $0a, $2e, $22, $0a, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $24, $20, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $24, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $24, $20
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $24, $20, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $24, $20, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $24, $20, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $24, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $24, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $24, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $24, $20, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00, $00, $00, $24, $20
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $24, $20, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $24, $20, $47, $18, $1c, $78
	db $07, $07, $07, $0f, $0a, $00, $00, $00, $24, $20, $2a, $18, $1c, $10, $05, $05
	db $05, $04, $0a, $00, $00, $00, $24, $20, $85, $18, $1c, $7b, $14, $0d, $1f, $0e
	db $0a, $00, $00, $00, $24, $20, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $24, $20, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00, $00, $00
	db $24, $20, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00, $00, $00, $24, $20
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $24, $20, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $24, $20, $85, $1c, $20, $7b
	db $14, $0d, $1f, $0f, $0a, $00, $00, $00, $24, $20, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $24, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $24, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $24, $20, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $24, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $24, $20
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $24, $20, $0d, $1e
	db $22, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $24, $20, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $24, $20, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $24, $20, $0d, $20, $24, $77, $01, $05, $00, $05
	db $0a, $00, $00, $00, $24, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $24, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $24, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $24, $20
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2271:: ; a2271
IF DEF(SUN)
	db $fa, $98, $c7, $b7, $c2, $87, $62, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $97, $62, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $6c, $63, $fe, $1d, $ca, $6c, $63, $fe, $1c, $ca, $6c, $63, $fe, $1b, $ca
	db $6c, $63, $fe, $1a, $ca, $6c, $63, $fe, $19, $ca, $61, $63, $fe, $18, $ca, $61
	db $63, $fe, $17, $ca, $61, $63, $fe, $16, $ca, $61, $63, $fe, $15, $ca, $61, $63
	db $fe, $14, $ca, $56, $63, $fe, $13, $ca, $56, $63, $fe, $12, $ca, $56, $63, $fe
	db $11, $ca, $56, $63, $fe, $10, $ca, $56, $63, $fe, $0f, $ca, $4b, $63, $fe, $0e
	db $ca, $4b, $63, $fe, $0d, $ca, $4b, $63, $fe, $0c, $ca, $4b, $63, $fe, $0b, $ca
	db $4b, $63, $fe, $0a, $ca, $40, $63, $fe, $09, $ca, $40, $63, $fe, $08, $ca, $40
	db $63, $fe, $07, $ca, $40, $63, $fe, $06, $ca, $40, $63, $fe, $05, $ca, $35, $63
	db $fe, $04, $ca, $35, $63, $fe, $03, $ca, $35, $63, $fe, $02, $ca, $35, $63, $fe
	db $01, $c2, $77, $63, $1e, $05, $21, $87, $60, $cd, $24, $4d, $c3, $7f, $63, $1e
	db $05, $21, $cd, $60, $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $13, $61, $cd
	db $24, $4d, $c3, $7f, $63, $1e, $05, $21, $59, $61, $cd, $24, $4d, $c3, $7f, $63
	db $1e, $05, $21, $9f, $61, $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $e5, $61
	db $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $2b, $62, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $bf, $63, $cd, $fc, $63, $21, $fc, $63, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $03, $60, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $f8, $5f, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $e0, $63, $21, $f8, $00, $cd, $98, $44, $c3, $e9, $63, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $22, $1f, $01, $01, $01, $13, $22
	db $1f, $01, $01, $07, $01, $22, $1f, $01, $01, $22, $0a, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $ea, $63, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $07, $15, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $0d, $1b, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $0d, $1b, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $0d, $1b, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $0d, $1b, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $1e, $1b, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $1e, $1b, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $1e, $1b
	db $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $1e, $1b, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $21, $08, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $21
	db $08, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $21, $08, $01, $01, $1d, $17
	db $21, $0a, $20, $0a, $2e, $21, $08, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $23, $20, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $23, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $23, $20
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $23, $20, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $23, $20, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $20, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $23, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $23, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $23, $20, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00, $00, $00, $23, $20
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $20, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $23, $20, $06, $18, $1c, $30
	db $03, $03, $01, $0f, $0a, $00, $00, $00, $23, $20, $29, $18, $1c, $10, $01, $01
	db $01, $04, $0a, $00, $00, $00, $23, $20, $88, $18, $1c, $79, $04, $04, $00, $04
	db $0a, $00, $00, $00, $23, $20, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $23, $20, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00, $00, $00
	db $23, $20, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00, $00, $00, $23, $20
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $23, $20, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $23, $20, $88, $1c, $20, $79
	db $04, $04, $00, $04, $0a, $00, $00, $00, $23, $20, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $23, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $23, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $20, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $23, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $23, $20
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $23, $20, $0a, $1e
	db $22, $79, $04, $0f, $00, $05, $0a, $00, $00, $00, $23, $20, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $23, $20, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $23, $20, $0a, $20, $24, $79, $04, $0f, $00, $05
	db $0a, $00, $00, $00, $23, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $23, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $23, $20
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $fa, $98, $c7, $b7, $c2, $87, $62, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $97, $62, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $6c, $63, $fe, $1d, $ca, $6c, $63, $fe, $1c, $ca, $6c, $63, $fe, $1b, $ca
	db $6c, $63, $fe, $1a, $ca, $6c, $63, $fe, $19, $ca, $61, $63, $fe, $18, $ca, $61
	db $63, $fe, $17, $ca, $61, $63, $fe, $16, $ca, $61, $63, $fe, $15, $ca, $61, $63
	db $fe, $14, $ca, $56, $63, $fe, $13, $ca, $56, $63, $fe, $12, $ca, $56, $63, $fe
	db $11, $ca, $56, $63, $fe, $10, $ca, $56, $63, $fe, $0f, $ca, $4b, $63, $fe, $0e
	db $ca, $4b, $63, $fe, $0d, $ca, $4b, $63, $fe, $0c, $ca, $4b, $63, $fe, $0b, $ca
	db $4b, $63, $fe, $0a, $ca, $40, $63, $fe, $09, $ca, $40, $63, $fe, $08, $ca, $40
	db $63, $fe, $07, $ca, $40, $63, $fe, $06, $ca, $40, $63, $fe, $05, $ca, $35, $63
	db $fe, $04, $ca, $35, $63, $fe, $03, $ca, $35, $63, $fe, $02, $ca, $35, $63, $fe
	db $01, $c2, $77, $63, $1e, $05, $21, $87, $60, $cd, $24, $4d, $c3, $7f, $63, $1e
	db $05, $21, $cd, $60, $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $13, $61, $cd
	db $24, $4d, $c3, $7f, $63, $1e, $05, $21, $59, $61, $cd, $24, $4d, $c3, $7f, $63
	db $1e, $05, $21, $9f, $61, $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $e5, $61
	db $cd, $24, $4d, $c3, $7f, $63, $1e, $05, $21, $2b, $62, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $bf, $63, $cd, $fc, $63, $21, $fc, $63, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $03, $60, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $f8, $5f, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $e0, $63, $21, $f8, $00, $cd, $98, $44, $c3, $e9, $63, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $22, $1f, $01, $01, $01, $13, $22
	db $1f, $01, $01, $07, $01, $22, $1f, $01, $01, $22, $0a, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $ea, $63, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $07, $15, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $0d, $1b, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $0d, $1b, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $0d, $1b, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $0d, $1b, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $1e, $1b, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $1e, $1b, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $1e, $1b
	db $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e, $1e, $1b, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $21, $08, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $21
	db $08, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $21, $08, $01, $01, $1d, $17
	db $21, $0a, $20, $0a, $2e, $21, $08, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $23, $20, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $23, $20, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $23, $20
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $23, $20, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $23, $20, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $20, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $23, $20, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $23, $20, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $20, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $23, $20, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00, $00, $00, $23, $20
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $20, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $23, $20, $47, $18, $1c, $78
	db $07, $07, $07, $0f, $0a, $00, $00, $00, $23, $20, $2a, $18, $1c, $10, $05, $05
	db $05, $04, $0a, $00, $00, $00, $23, $20, $85, $18, $1c, $7b, $14, $0d, $1f, $0e
	db $0a, $00, $00, $00, $23, $20, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $23, $20, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00, $00, $00
	db $23, $20, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00, $00, $00, $23, $20
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $23, $20, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $23, $20, $85, $1c, $20, $7b
	db $14, $0d, $1f, $0f, $0a, $00, $00, $00, $23, $20, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $23, $20, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $23, $20, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $20, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $23, $20, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $23, $20
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $23, $20, $0d, $1e
	db $22, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $23, $20, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $23, $20, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $23, $20, $0d, $20, $24, $77, $01, $05, $00, $05
	db $0a, $00, $00, $00, $23, $20, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $20, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $23, $20, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $23, $20
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a268b:: ; a268b
IF DEF(SUN)
	db $fa, $98, $c7, $b7, $c2, $a1, $66, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $b1, $66, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $86, $67, $fe, $1d, $ca, $86, $67, $fe, $1c, $ca, $86, $67, $fe, $1b, $ca
	db $86, $67, $fe, $1a, $ca, $86, $67, $fe, $19, $ca, $7b, $67, $fe, $18, $ca, $7b
	db $67, $fe, $17, $ca, $7b, $67, $fe, $16, $ca, $7b, $67, $fe, $15, $ca, $7b, $67
	db $fe, $14, $ca, $70, $67, $fe, $13, $ca, $70, $67, $fe, $12, $ca, $70, $67, $fe
	db $11, $ca, $70, $67, $fe, $10, $ca, $70, $67, $fe, $0f, $ca, $65, $67, $fe, $0e
	db $ca, $65, $67, $fe, $0d, $ca, $65, $67, $fe, $0c, $ca, $65, $67, $fe, $0b, $ca
	db $65, $67, $fe, $0a, $ca, $5a, $67, $fe, $09, $ca, $5a, $67, $fe, $08, $ca, $5a
	db $67, $fe, $07, $ca, $5a, $67, $fe, $06, $ca, $5a, $67, $fe, $05, $ca, $4f, $67
	db $fe, $04, $ca, $4f, $67, $fe, $03, $ca, $4f, $67, $fe, $02, $ca, $4f, $67, $fe
	db $01, $c2, $91, $67, $1e, $05, $21, $a1, $64, $cd, $24, $4d, $c3, $99, $67, $1e
	db $05, $21, $e7, $64, $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $2d, $65, $cd
	db $24, $4d, $c3, $99, $67, $1e, $05, $21, $73, $65, $cd, $24, $4d, $c3, $99, $67
	db $1e, $05, $21, $b9, $65, $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $ff, $65
	db $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $45, $66, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $d9, $67, $cd, $16, $68, $21, $16, $68, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $1d, $64, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $12, $64, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $fa, $67, $21, $f8, $00, $cd, $98, $44, $c3, $03, $68, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $00, $00, $01, $01, $0d, $1b, $00
	db $00, $01, $01, $1e, $1b, $00, $00, $01, $01, $21, $08, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $04, $68, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $21, $0a, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $04, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $04, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $01, $04, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $04, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $08, $10, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $08, $10, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $08, $10
	db $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $08, $10, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $21, $10, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $21
	db $10, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $21, $10, $01, $01, $1d, $16
	db $07, $15, $08, $15, $2e, $21, $10, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $23, $1e, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $23, $1e
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $23, $1e, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $23, $1e, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $23, $1e, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00, $00, $00, $23, $1e
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $1e, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $23, $1e, $06, $18, $1c, $30
	db $03, $03, $01, $0f, $0a, $00, $00, $00, $23, $1e, $29, $18, $1c, $10, $01, $01
	db $01, $04, $0a, $00, $00, $00, $23, $1e, $88, $18, $1c, $79, $04, $04, $00, $04
	db $0a, $00, $00, $00, $23, $1e, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $23, $1e, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00, $00, $00
	db $23, $1e, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00, $00, $00, $23, $1e
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $23, $1e, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $23, $1e, $88, $1c, $20, $79
	db $04, $04, $00, $04, $0a, $00, $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $1e, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $23, $1e
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $23, $1e, $0a, $1e
	db $22, $79, $04, $0f, $00, $05, $0a, $00, $00, $00, $23, $1e, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $23, $1e, $0a, $20, $24, $79, $04, $0f, $00, $05
	db $0a, $00, $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $23, $1e
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $fa, $98, $c7, $b7, $c2, $a1, $66, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $b1, $66, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $86, $67, $fe, $1d, $ca, $86, $67, $fe, $1c, $ca, $86, $67, $fe, $1b, $ca
	db $86, $67, $fe, $1a, $ca, $86, $67, $fe, $19, $ca, $7b, $67, $fe, $18, $ca, $7b
	db $67, $fe, $17, $ca, $7b, $67, $fe, $16, $ca, $7b, $67, $fe, $15, $ca, $7b, $67
	db $fe, $14, $ca, $70, $67, $fe, $13, $ca, $70, $67, $fe, $12, $ca, $70, $67, $fe
	db $11, $ca, $70, $67, $fe, $10, $ca, $70, $67, $fe, $0f, $ca, $65, $67, $fe, $0e
	db $ca, $65, $67, $fe, $0d, $ca, $65, $67, $fe, $0c, $ca, $65, $67, $fe, $0b, $ca
	db $65, $67, $fe, $0a, $ca, $5a, $67, $fe, $09, $ca, $5a, $67, $fe, $08, $ca, $5a
	db $67, $fe, $07, $ca, $5a, $67, $fe, $06, $ca, $5a, $67, $fe, $05, $ca, $4f, $67
	db $fe, $04, $ca, $4f, $67, $fe, $03, $ca, $4f, $67, $fe, $02, $ca, $4f, $67, $fe
	db $01, $c2, $91, $67, $1e, $05, $21, $a1, $64, $cd, $24, $4d, $c3, $99, $67, $1e
	db $05, $21, $e7, $64, $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $2d, $65, $cd
	db $24, $4d, $c3, $99, $67, $1e, $05, $21, $73, $65, $cd, $24, $4d, $c3, $99, $67
	db $1e, $05, $21, $b9, $65, $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $ff, $65
	db $cd, $24, $4d, $c3, $99, $67, $1e, $05, $21, $45, $66, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $d9, $67, $cd, $16, $68, $21, $16, $68, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $1d, $64, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $12, $64, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $fa, $67, $21, $f8, $00, $cd, $98, $44, $c3, $03, $68, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $00, $00, $01, $01, $0d, $1b, $00
	db $00, $01, $01, $1e, $1b, $00, $00, $01, $01, $21, $08, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $04, $68, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $21, $0a, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $04, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $04, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $01, $04, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $04, $01
	db $01, $1d, $18, $16, $13, $16, $12, $2e, $08, $10, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $08, $10, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $08, $10
	db $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $08, $10, $01, $01, $1d, $18, $16
	db $13, $16, $12, $2e, $21, $10, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $21
	db $10, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $21, $10, $01, $01, $1d, $16
	db $07, $15, $08, $15, $2e, $21, $10, $01, $01, $1d, $18, $16, $13, $16, $12, $2e
	db $00, $00, $23, $1e, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $23, $1e
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $23, $1e, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $23, $1e, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $23, $1e, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00, $00, $00, $23, $1e
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $23, $1e, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $23, $1e, $47, $18, $1c, $78
	db $07, $07, $07, $0f, $0a, $00, $00, $00, $23, $1e, $2a, $18, $1c, $10, $05, $05
	db $05, $04, $0a, $00, $00, $00, $23, $1e, $85, $18, $1c, $7b, $14, $0d, $1f, $0e
	db $0a, $00, $00, $00, $23, $1e, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $23, $1e, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00, $00, $00
	db $23, $1e, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00, $00, $00, $23, $1e
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $23, $1e, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $23, $1e, $85, $1c, $20, $7b
	db $14, $0d, $1f, $0f, $0a, $00, $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $1e, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $23, $1e
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $23, $1e, $0d, $1e
	db $22, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $23, $1e, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $23, $1e, $0d, $20, $24, $77, $01, $05, $00, $05
	db $0a, $00, $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $23, $1e
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2aa5:: ; a2aa5
IF DEF(SUN)
	db $fa, $98, $c7, $b7, $c2, $bb, $6a, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $cb, $6a, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $a0, $6b, $fe, $1d, $ca, $a0, $6b, $fe, $1c, $ca, $a0, $6b, $fe, $1b, $ca
	db $a0, $6b, $fe, $1a, $ca, $a0, $6b, $fe, $19, $ca, $95, $6b, $fe, $18, $ca, $95
	db $6b, $fe, $17, $ca, $95, $6b, $fe, $16, $ca, $95, $6b, $fe, $15, $ca, $95, $6b
	db $fe, $14, $ca, $8a, $6b, $fe, $13, $ca, $8a, $6b, $fe, $12, $ca, $8a, $6b, $fe
	db $11, $ca, $8a, $6b, $fe, $10, $ca, $8a, $6b, $fe, $0f, $ca, $7f, $6b, $fe, $0e
	db $ca, $7f, $6b, $fe, $0d, $ca, $7f, $6b, $fe, $0c, $ca, $7f, $6b, $fe, $0b, $ca
	db $7f, $6b, $fe, $0a, $ca, $74, $6b, $fe, $09, $ca, $74, $6b, $fe, $08, $ca, $74
	db $6b, $fe, $07, $ca, $74, $6b, $fe, $06, $ca, $74, $6b, $fe, $05, $ca, $69, $6b
	db $fe, $04, $ca, $69, $6b, $fe, $03, $ca, $69, $6b, $fe, $02, $ca, $69, $6b, $fe
	db $01, $c2, $ab, $6b, $1e, $05, $21, $bb, $68, $cd, $24, $4d, $c3, $b3, $6b, $1e
	db $05, $21, $01, $69, $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $47, $69, $cd
	db $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $8d, $69, $cd, $24, $4d, $c3, $b3, $6b
	db $1e, $05, $21, $d3, $69, $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $19, $6a
	db $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $5f, $6a, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $f3, $6b, $cd, $30, $6c, $21, $30, $6c, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $37, $68, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $2c, $68, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $14, $6c, $21, $f8, $00, $cd, $98, $44, $c3, $1d, $6c, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $21, $00, $01, $01, $01, $04, $21
	db $00, $01, $01, $08, $10, $21, $00, $01, $01, $21, $10, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $1e, $6c, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $16, $13, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $1c, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $1c, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $01, $1c, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $1c, $01
	db $01, $1d, $17, $21, $0a, $20, $0a, $2e, $16, $0a, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $16, $0a, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $16, $0a
	db $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $16, $0a, $01, $01, $1d, $17, $21
	db $0a, $20, $0a, $2e, $25, $01, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $25
	db $01, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $25, $01, $01, $01, $1d, $16
	db $07, $15, $08, $15, $2e, $25, $01, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e
	db $00, $00, $33, $21, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $33, $21
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $33, $21, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $33, $21, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $33, $21, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00, $00, $00, $33, $21
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $33, $21, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $33, $21, $06, $18, $1c, $30
	db $03, $03, $01, $0f, $0a, $00, $00, $00, $33, $21, $29, $18, $1c, $10, $01, $01
	db $01, $04, $0a, $00, $00, $00, $33, $21, $88, $18, $1c, $79, $04, $04, $00, $04
	db $0a, $00, $00, $00, $33, $21, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $33, $21, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00, $00, $00
	db $33, $21, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00, $00, $00, $33, $21
	db $1d, $1a, $1e, $30, $1f, $17, $08, $0f, $0a, $00, $00, $00, $33, $21, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $33, $21, $88, $1c, $20, $79
	db $04, $04, $00, $04, $0a, $00, $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $33, $21, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00, $00, $00
	db $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $33, $21
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $33, $21, $0a, $1e
	db $22, $79, $04, $0f, $00, $05, $0a, $00, $00, $00, $33, $21, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05
	db $0a, $00, $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $33, $21
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00

Func_a2ebf:: ; a2ebf
	db $fa, $98, $c7, $b7, $c2, $d5, $6e, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $e5, $6e, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $ba, $6f, $fe, $1d, $ca, $ba, $6f, $fe, $1c, $ca, $ba, $6f, $fe, $1b, $ca
	db $ba, $6f, $fe, $1a, $ca, $ba, $6f, $fe, $19, $ca, $af, $6f, $fe, $18, $ca, $af
	db $6f, $fe, $17, $ca, $af, $6f, $fe, $16, $ca, $af, $6f, $fe, $15, $ca, $af, $6f
	db $fe, $14, $ca, $a4, $6f, $fe, $13, $ca, $a4, $6f, $fe, $12, $ca, $a4, $6f, $fe
	db $11, $ca, $a4, $6f, $fe, $10, $ca, $a4, $6f, $fe, $0f, $ca, $99, $6f, $fe, $0e
	db $ca, $99, $6f, $fe, $0d, $ca, $99, $6f, $fe, $0c, $ca, $99, $6f, $fe, $0b, $ca
	db $99, $6f, $fe, $0a, $ca, $8e, $6f, $fe, $09, $ca, $8e, $6f, $fe, $08, $ca, $8e
	db $6f, $fe, $07, $ca, $8e, $6f, $fe, $06, $ca, $8e, $6f, $fe, $05, $ca, $83, $6f
	db $fe, $04, $ca, $83, $6f, $fe, $03, $ca, $83, $6f, $fe, $02, $ca, $83, $6f, $fe
	db $01, $c2, $c5, $6f, $1e, $05, $21, $d5, $6c, $cd, $24, $4d, $c3, $cd, $6f, $1e
	db $05, $21, $1b, $6d, $cd, $24, $4d, $c3, $cd, $6f, $1e, $05, $21, $61, $6d, $cd
	db $24, $4d, $c3, $cd, $6f, $1e, $05, $21, $a7, $6d, $cd, $24, $4d, $c3, $cd, $6f
	db $1e, $05, $21, $ed, $6d, $cd, $24, $4d, $c3, $cd, $6f, $1e, $05, $21, $33, $6e
	db $cd, $24, $4d, $c3, $cd, $6f, $1e, $05, $21, $79, $6e, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $0d, $70, $cd, $4a, $70, $21, $4a, $70, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $51, $6c, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $46, $6c, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $2e, $70, $21, $f8, $00, $cd, $98, $44, $c3, $37, $70, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $00, $0e, $01, $01, $01, $1c, $00
	db $0e, $01, $01, $16, $0a, $00, $0e, $01, $01, $25, $01, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $38, $70, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $0b, $0c, $01, $01, $13, $1f, $0b, $0c, $0a, $0c, $2e, $00, $03, $0e, $0b
	db $5f, $14, $17, $77, $05, $06, $00, $04, $0a, $00, $00, $03, $0e, $0b, $50, $14
	db $17, $77, $14, $14, $00, $0e, $09, $00, $00, $03, $0e, $0b, $34, $14, $17, $18
	db $17, $05, $1e, $04, $08, $00, $1b, $04, $01, $06, $01, $01, $02, $04, $00, $28
	db $37, $71, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04, $00, $28, $97, $71
	db $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28, $f7, $71, $00, $00
	db $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00, $00, $00

Func_a30cd:: ; a30cd
	db $1e, $01, $21, $60, $70, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $6b, $70, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $c8, $00, $cd, $2e, $46
	db $b7, $ca, $05, $71, $21, $c9, $00, $cd, $2e, $46, $b7, $ca, $05, $71, $21, $ca
	db $00, $cd, $2e, $46, $b7, $c2, $25, $71, $1e, $00, $21, $c8, $00, $cd, $1b, $46
	db $1e, $00, $21, $c9, $00, $cd, $1b, $46, $1e, $00, $21, $ca, $00, $cd, $1b, $46
	db $1e, $03, $21, $95, $70, $cd, $fb, $40, $1e, $01, $21, $bf, $70, $cd, $fb, $40
	db $cd, $1c, $40, $21, $1c, $04, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $56
	db $71, $fe, $01, $c2, $95, $71, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $53
	db $71, $3e, $01, $ea, $c4, $c7, $c3, $95, $71, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $95, $71, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $c8, $00, $cd, $1b, $46, $21, $c9, $00, $cd, $2e, $46
	db $fe, $01, $c2, $95, $71, $21, $ca, $00, $cd, $2e, $46, $fe, $01, $c2, $95, $71
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $b6
	db $71, $fe, $01, $c2, $f5, $71, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $b3
	db $71, $3e, $01, $ea, $c4, $c7, $c3, $f5, $71, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $f5, $71, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $c9, $00, $cd, $1b, $46, $21, $c8, $00, $cd, $2e, $46
	db $fe, $01, $c2, $f5, $71, $21, $ca, $00, $cd, $2e, $46, $fe, $01, $c2, $f5, $71
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $16
	db $72, $fe, $01, $c2, $55, $72, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $13
	db $72, $3e, $01, $ea, $c4, $c7, $c3, $55, $72, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $55, $72, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $ca, $00, $cd, $1b, $46, $21, $c8, $00, $cd, $2e, $46
	db $fe, $01, $c2, $55, $72, $21, $c9, $00, $cd, $2e, $46, $fe, $01, $c2, $55, $72
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $0b, $0c, $01, $01, $13, $1e
	db $0b, $0c, $0a, $0c, $2e, $0e, $0c, $01, $01, $13, $20, $0e, $0c, $0d, $0c, $2e
	db $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00, $00, $03
	db $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00, $00, $03, $0e, $0b
	db $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00, $1b, $04, $01, $06, $01, $01
	db $02, $04, $00, $28, $39, $73, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04
	db $00, $28, $99, $73, $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28
	db $f9, $73, $00, $00, $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00
	db $00, $00

Func_a32cf:: ; a32cf
	db $1e, $02, $21, $57, $72, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $6d, $72, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $cb, $00, $cd, $2e, $46
	db $b7, $ca, $07, $73, $21, $cc, $00, $cd, $2e, $46, $b7, $ca, $07, $73, $21, $cd
	db $00, $cd, $2e, $46, $b7, $c2, $27, $73, $1e, $00, $21, $cb, $00, $cd, $1b, $46
	db $1e, $00, $21, $cc, $00, $cd, $1b, $46, $1e, $00, $21, $cd, $00, $cd, $1b, $46
	db $1e, $03, $21, $97, $72, $cd, $fb, $40, $1e, $01, $21, $c1, $72, $cd, $fb, $40
	db $cd, $1c, $40, $21, $ee, $03, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $58
	db $73, $fe, $01, $c2, $97, $73, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $55
	db $73, $3e, $01, $ea, $c4, $c7, $c3, $97, $73, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $97, $73, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cb, $00, $cd, $1b, $46, $21, $cc, $00, $cd, $2e, $46
	db $fe, $01, $c2, $97, $73, $21, $cd, $00, $cd, $2e, $46, $fe, $01, $c2, $97, $73
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $b8
	db $73, $fe, $01, $c2, $f7, $73, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $b5
	db $73, $3e, $01, $ea, $c4, $c7, $c3, $f7, $73, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $f7, $73, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cc, $00, $cd, $1b, $46, $21, $cb, $00, $cd, $2e, $46
	db $fe, $01, $c2, $f7, $73, $21, $cd, $00, $cd, $2e, $46, $fe, $01, $c2, $f7, $73
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $18
	db $74, $fe, $01, $c2, $57, $74, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $15
	db $74, $3e, $01, $ea, $c4, $c7, $c3, $57, $74, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $57, $74, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cd, $00, $cd, $1b, $46, $21, $cb, $00, $cd, $2e, $46
	db $fe, $01, $c2, $57, $74, $21, $cc, $00, $cd, $2e, $46, $fe, $01, $c2, $57, $74
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $0b, $0c, $01, $01, $13, $21
	db $0b, $11, $0a, $11, $2e, $0e, $0c, $01, $01, $13, $1f, $0e, $0c, $0d, $0c, $2e
	db $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00, $00, $03
	db $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00, $00, $03, $0e, $0b
	db $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00, $1b, $04, $01, $06, $01, $01
	db $02, $04, $00, $28, $3b, $75, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04
	db $00, $28, $9b, $75, $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28
	db $fb, $75, $00, $00, $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00
	db $00, $00

Func_a34d1:: ; a34d1
	db $1e, $02, $21, $59, $74, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $6f, $74, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $ce, $00, $cd, $2e, $46
	db $b7, $ca, $09, $75, $21, $cf, $00, $cd, $2e, $46, $b7, $ca, $09, $75, $21, $d0
	db $00, $cd, $2e, $46, $b7, $c2, $29, $75, $1e, $00, $21, $ce, $00, $cd, $1b, $46
	db $1e, $00, $21, $cf, $00, $cd, $1b, $46, $1e, $00, $21, $d0, $00, $cd, $1b, $46
	db $1e, $03, $21, $99, $74, $cd, $fb, $40, $1e, $01, $21, $c3, $74, $cd, $fb, $40
	db $cd, $1c, $40, $21, $4a, $03, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $5a
	db $75, $fe, $01, $c2, $99, $75, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $57
	db $75, $3e, $01, $ea, $c4, $c7, $c3, $99, $75, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $99, $75, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $ce, $00, $cd, $1b, $46, $21, $cf, $00, $cd, $2e, $46
	db $fe, $01, $c2, $99, $75, $21, $d0, $00, $cd, $2e, $46, $fe, $01, $c2, $99, $75
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $ba
	db $75, $fe, $01, $c2, $f9, $75, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $b7
	db $75, $3e, $01, $ea, $c4, $c7, $c3, $f9, $75, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $f9, $75, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cf, $00, $cd, $1b, $46, $21, $ce, $00, $cd, $2e, $46
	db $fe, $01, $c2, $f9, $75, $21, $d0, $00, $cd, $2e, $46, $fe, $01, $c2, $f9, $75
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $1a
	db $76, $fe, $01, $c2, $59, $76, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $17
	db $76, $3e, $01, $ea, $c4, $c7, $c3, $59, $76, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $59, $76, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $d0, $00, $cd, $1b, $46, $21, $ce, $00, $cd, $2e, $46
	db $fe, $01, $c2, $59, $76, $21, $cf, $00, $cd, $2e, $46, $fe, $01, $c2, $59, $76
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $0b, $11, $01, $01, $13, $20
	db $0b, $0c, $0a, $0c, $2e, $01, $04, $01, $01, $13, $25, $01, $0d, $02, $0d, $2e
	db $03, $17, $03, $01, $09, $00, $0b, $21, $0b, $22, $2e, $03, $0d, $0a, $0a, $5f
	db $12, $14, $77, $05, $06, $00, $03, $0a, $00, $03, $0d, $0a, $0a, $50, $12, $14
	db $77, $14, $14, $00, $0c, $09, $00, $03, $0d, $0a, $0a, $34, $13, $15, $17, $17
	db $05, $1e, $03, $08, $00, $00, $03, $09, $08, $5f, $15, $17, $77, $05, $06, $00
	db $04, $0a, $00, $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00, $0e, $09
	db $00, $00, $03, $09, $08, $34, $16, $18, $17, $17, $05, $1e, $04, $08, $00, $00
	db $03, $09, $08, $35, $16, $18, $77, $17, $12, $11, $04, $06, $00, $00, $03, $09
	db $08, $29, $17, $19, $0d, $01, $01, $01, $04, $02, $00

Func_a36ec:: ; a36ec
	db $cd, $30, $77, $21, $30, $77, $cd, $11, $4f, $1e, $03, $21, $5b, $76, $cd, $3a
	db $40, $3e, $03, $cd, $01, $4d, $1e, $08, $21, $7c, $76, $cd, $24, $4d, $3e, $01
	db $cd, $c6, $4c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $a9, $02, $cd, $72
	db $4f, $c9, $0a, $0b, $03, $01, $03, $0c, $0a, $0b, $03, $01, $03, $0b, $0a, $0b
	db $03, $01, $03, $0a, $21, $d1, $00, $cd, $2e, $46, $fe, $01, $ca, $51, $77, $21
	db $d2, $00, $cd, $2e, $46, $fe, $01, $ca, $51, $77, $21, $d3, $00, $cd, $2e, $46
	db $fe, $01, $c2, $87, $77, $21, $d1, $00, $cd, $2e, $46, $fe, $01, $c2, $62, $77
	db $21, $1e, $77, $cd, $9b, $4d, $21, $d2, $00, $cd, $2e, $46, $fe, $01, $c2, $73
	db $77, $21, $24, $77, $cd, $9b, $4d, $21, $d3, $00, $cd, $2e, $46, $fe, $01, $c2
	db $84, $77, $21, $2a, $77, $cd, $9b, $4d, $cd, $02, $4f, $c9

Func_a3788:: ; a3788
	ret

Func_a3789:: ; a3789
	ret

Func_a378a:: ; a378a
	ret

Data_a378b:
	db $01, $0d, $01, $01, $13, $21, $01, $04, $02, $04, $2e, $0b, $0d, $01, $01
	db $13, $26, $0b, $0d, $0a, $0d, $2e, $06, $02, $01, $01, $13, $0b, $02, $1b, $02
	db $1a, $2e, $00, $03, $0d, $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00
	db $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $09, $00, $00, $03
	db $0d, $0c, $34, $16, $18, $18, $17, $05, $1e, $04, $08, $00, $00, $03, $0d, $0c
	db $35, $16, $18, $77, $17, $12, $11, $04, $06, $00, $00, $03, $0d, $0c, $29, $17
	db $19, $0d, $01, $01, $01, $04, $02, $00, $ff, $00, $00, $04, $01, $01, $00, $04
	db $01, $28, $b8, $78, $00, $00, $ff, $00, $01, $08, $01, $01, $00, $04, $01, $28
	db $e9, $78, $00, $00, $ff, $00, $02, $0a, $01, $01, $00, $04, $01, $28, $1a, $79
	db $00, $00, $ff, $00, $04, $0c, $01, $01, $00, $04, $01, $28, $4b, $79, $00, $00
	db $ff, $00, $05, $05, $01, $01, $00, $04, $01, $28, $7c, $79, $00, $00, $ff, $00
	db $05, $07, $01, $01, $00, $04, $01, $28, $ad, $79, $00, $00, $ff, $00, $06, $0a
	db $01, $01, $00, $04, $01, $28, $de, $79, $00, $00, $ff, $00, $07, $04, $01, $01
	db $00, $04, $01, $28, $0f, $7a, $00, $00, $ff, $00, $07, $0c, $01, $01, $00, $04
	db $01, $28, $40, $7a, $00, $00, $ff, $00, $09, $07, $01, $01, $00, $04, $01, $28
	db $71, $7a, $00, $00, $ff, $00, $0a, $0a, $01, $01, $00, $04, $01, $28, $a2, $7a
	db $00, $00

Func_a388c:: ; a388c
	db $1e, $03, $21, $8b, $77, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $ac, $77, $cd, $24, $4d, $1e, $0b, $21, $f2, $77, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $21, $1e, $04, $cd, $72, $4f, $c9, $7b, $fe, $02, $c2
	db $e8, $78, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e
	db $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e
	db $04, $e5, $0e, $00, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02
	db $c2, $19, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41
	db $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46
	db $2e, $08, $e5, $0e, $01, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe
	db $02, $c2, $4a, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76
	db $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77
	db $46, $2e, $0a, $e5, $0e, $02, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b
	db $fe, $02, $c2, $7b, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd
	db $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd
	db $77, $46, $2e, $0c, $e5, $0e, $04, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9
	db $7b, $fe, $02, $c2, $ac, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b
	db $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02
	db $cd, $77, $46, $2e, $05, $e5, $0e, $05, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1
	db $c9, $7b, $fe, $02, $c2, $dd, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e
	db $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e
	db $02, $cd, $77, $46, $2e, $07, $e5, $0e, $05, $1e, $26, $3e, $13, $cd, $ff, $4d
	db $c1, $c9, $7b, $fe, $02, $c2, $0e, $7a, $af, $cd, $53, $46, $0e, $01, $1e, $01
	db $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41
	db $3e, $02, $cd, $77, $46, $2e, $0a, $e5, $0e, $06, $1e, $26, $3e, $13, $cd, $ff
	db $4d, $c1, $c9, $7b, $fe, $02, $c2, $3f, $7a, $af, $cd, $53, $46, $0e, $01, $1e
	db $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b
	db $41, $3e, $02, $cd, $77, $46, $2e, $04, $e5, $0e, $07, $1e, $26, $3e, $13, $cd
	db $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $70, $7a, $af, $cd, $53, $46, $0e, $01
	db $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd
	db $8b, $41, $3e, $02, $cd, $77, $46, $2e, $0c, $e5, $0e, $07, $1e, $26, $3e, $13
	db $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $a1, $7a, $af, $cd, $53, $46, $0e
	db $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41
	db $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e, $07, $e5, $0e, $09, $1e, $26, $3e
	db $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $d2, $7a, $af, $cd, $53, $46
	db $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5
	db $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e, $0a, $e5, $0e, $0a, $1e, $26
	db $3e, $13, $cd, $ff, $4d, $c1, $c9, $0b, $0d, $01, $01, $13, $25, $0b, $0d, $0a
	db $0d, $2e, $01, $0d, $01, $01, $13, $27, $03, $21, $03, $20, $2e, $00, $03, $0d
	db $0c, $5f, $15, $17, $77, $05, $06, $00, $04, $0a, $00, $00, $03, $0d, $0c, $50
	db $15, $17, $77, $14, $14, $00, $0e, $09, $00, $00, $03, $0d, $0c, $34, $16, $18
	db $18, $17, $05, $1e, $04, $08, $00, $00, $03, $0d, $0c, $35, $16, $18, $77, $17
	db $12, $11, $04, $06, $00, $00, $03, $0d, $0c, $29, $17, $19, $0d, $01, $01, $01
	db $04, $02, $00

Func_a3b2f:: ; a3b2f
	db $1e, $02, $21, $d3, $7a, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $e9, $7a, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $1f, $04
	db $cd, $72, $4f, $c9, $03, $21, $01, $01, $13, $26, $01, $0d, $02, $0d, $2e, $28
	db $03, $05, $28, $03, $05, $00, $00, $00, $04, $02, $05, $01, $01, $03, $04, $00
	db $28, $dd, $46, $5e, $7b, $00, $04, $03, $1a, $01, $01, $00, $04, $00, $28, $d5
	db $7c, $00, $00, $00, $03, $06, $21, $5f, $15, $19, $77, $05, $06, $00, $04, $0a
	db $00, $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $09, $00, $00
	db $03, $06, $21, $34, $16, $1a, $18, $17, $05, $1e, $04, $08, $00, $00, $03, $06
	db $21, $35, $16, $1a, $77, $17, $12, $11, $04, $06, $00, $00, $03, $06, $21, $29
	db $17, $1b, $0d, $01, $01, $01, $04, $02, $00

Func_a3bc8:: ; a3bc8
	db $cd, $8b, $7c, $21, $8b, $7c, $cd, $11, $4f, $1e, $01, $21, $53, $7b, $cd, $3a
	db $40, $1e, $01, $21, $61, $7b, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05
	db $21, $82, $7b, $cd, $24, $4d, $1e, $02, $21, $66, $7b, $cd, $fb, $40, $21, $ec
	db $00, $cd, $2e, $46, $fe, $01, $c2, $08, $7c, $1e, $00, $3e, $01, $cd, $3d, $41
	db $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $5d, $04, $cd, $72, $4f, $c9

Func_a3c17:: ; a3c17
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $3e
	db $3a, $cd, $fe, $4e, $0e, $01, $1e, $01, $3e, $0a, $cd, $76, $41, $fa, $99, $c7
	db $fe, $02, $ca, $63, $7c, $fe, $01, $ca, $54, $7c, $b7, $c2, $6f, $7c, $1e, $19
	db $3e, $03, $cd, $e4, $41, $3e, $01, $ea, $99, $c7, $c3, $6f, $7c, $1e, $14, $3e
	db $03, $cd, $e4, $41, $3e, $02, $ea, $99, $c7, $c3, $6f, $7c, $1e, $0f, $3e, $03
	db $cd, $e4, $41, $3e, $03, $ea, $99, $c7, $cd, $d5, $41, $cd, $8b, $41, $cd, $8b
	db $7c, $c9, $02, $1b, $01, $02, $03, $18, $02, $1b, $01, $02, $03, $13, $02, $1b
	db $01, $02, $03, $0e, $fa, $99, $c7, $fe, $03, $ca, $b5, $7c, $fe, $02, $ca, $a6
	db $7c, $fe, $01, $c2, $c7, $7c, $21, $79, $7c, $cd, $9b, $4d, $c3, $c7, $7c, $21
	db $79, $7c, $cd, $9b, $4d, $21, $7f, $7c, $cd, $9b, $4d, $c3, $c7, $7c, $21, $79
	db $7c, $cd, $9b, $4d, $21, $7f, $7c, $cd, $9b, $4d, $21, $85, $7c, $cd, $9b, $4d
	db $cd, $02, $4f, $c9, $02, $1a, $ff, $ff, $02, $1b, $03, $1b, $ff, $ff, $7b, $b7
	db $c2, $72, $7d, $fa, $38, $c8, $fe, $01, $c2, $f6, $7c, $0e, $01, $11, $cf, $7c
	db $3e, $28, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $77, $46, $c3, $f6, $7c, $3e
	db $01, $cd, $4b, $44, $fa, $90, $c7, $fe, $05, $d2, $51, $7d, $3e, $2e, $cd, $5d
	db $4e, $fe, $01, $c2, $51, $7d, $21, $ec, $00, $cd, $2e, $46, $b7, $c2, $48, $7d
	db $21, $5c, $04, $cd, $a9, $44, $21, $1e, $00, $cd, $8f, $46, $01, $cb, $7c, $1e
	db $28, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $21, $1e, $00, $cd, $8f, $46, $1e
	db $01, $3e, $01, $cd, $95, $40, $1e, $01, $21, $ec, $00, $cd, $1b, $46, $c3, $4e
	db $7d, $21, $0f, $01, $cd, $98, $44, $c3, $72, $7d, $21, $ec, $00, $cd, $2e, $46
	db $fe, $01, $c2, $65, $7d, $21, $0f, $01, $cd, $98, $44, $c3, $72, $7d, $21, $5b
	db $04, $cd, $a9, $44, $1e, $00, $3e, $01, $cd, $95, $40, $c9, $04, $0c, $03, $01
	db $13, $14, $0c, $02, $0c, $03, $2e, $00, $04, $0b, $08, $5f, $28, $2d, $79, $05
	db $06, $00, $05, $0a, $00, $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e
	db $05, $0a, $00, $00, $04, $0b, $08, $26, $28, $2d, $5d, $01, $01, $00, $05, $0a
	db $00, $19, $0c, $05, $05, $01, $01, $02, $04, $00, $28, $00, $00, $00, $00, $12
	db $0c, $05, $05, $01, $01, $02, $04, $01, $28, $00, $00, $00, $00

Func_a3dc4:: ; a3dc4
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
	db $fa, $98, $c7, $b7, $c2, $bb, $6a, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $cb, $6a, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $a0, $6b, $fe, $1d, $ca, $a0, $6b, $fe, $1c, $ca, $a0, $6b, $fe, $1b, $ca
	db $a0, $6b, $fe, $1a, $ca, $a0, $6b, $fe, $19, $ca, $95, $6b, $fe, $18, $ca, $95
	db $6b, $fe, $17, $ca, $95, $6b, $fe, $16, $ca, $95, $6b, $fe, $15, $ca, $95, $6b
	db $fe, $14, $ca, $8a, $6b, $fe, $13, $ca, $8a, $6b, $fe, $12, $ca, $8a, $6b, $fe
	db $11, $ca, $8a, $6b, $fe, $10, $ca, $8a, $6b, $fe, $0f, $ca, $7f, $6b, $fe, $0e
	db $ca, $7f, $6b, $fe, $0d, $ca, $7f, $6b, $fe, $0c, $ca, $7f, $6b, $fe, $0b, $ca
	db $7f, $6b, $fe, $0a, $ca, $74, $6b, $fe, $09, $ca, $74, $6b, $fe, $08, $ca, $74
	db $6b, $fe, $07, $ca, $74, $6b, $fe, $06, $ca, $74, $6b, $fe, $05, $ca, $69, $6b
	db $fe, $04, $ca, $69, $6b, $fe, $03, $ca, $69, $6b, $fe, $02, $ca, $69, $6b, $fe
	db $01, $c2, $ab, $6b, $1e, $05, $21, $bb, $68, $cd, $24, $4d, $c3, $b3, $6b, $1e
	db $05, $21, $01, $69, $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $47, $69, $cd
	db $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $8d, $69, $cd, $24, $4d, $c3, $b3, $6b
	db $1e, $05, $21, $d3, $69, $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $19, $6a
	db $cd, $24, $4d, $c3, $b3, $6b, $1e, $05, $21, $5f, $6a, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $f3, $6b, $cd, $30, $6c, $21, $30, $6c, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $37, $68, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $2c, $68, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $14, $6c, $21, $f8, $00, $cd, $98, $44, $c3, $1d, $6c, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $21, $00, $01, $01, $01, $04, $21
	db $00, $01, $01, $08, $10, $21, $00, $01, $01, $21, $10, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $1e, $6c, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $16, $13, $01, $01, $1d, $01, $0a, $04, $0b, $04, $2e, $01, $1c, $01, $01
	db $1d, $14, $0a, $0d, $09, $0d, $2e, $01, $1c, $01, $01, $1d, $15, $10, $10, $0f
	db $10, $2e, $01, $1c, $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $01, $1c, $01
	db $01, $1d, $17, $21, $0a, $20, $0a, $2e, $16, $0a, $01, $01, $1d, $14, $0a, $0d
	db $09, $0d, $2e, $16, $0a, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $16, $0a
	db $01, $01, $1d, $16, $07, $15, $08, $15, $2e, $16, $0a, $01, $01, $1d, $17, $21
	db $0a, $20, $0a, $2e, $25, $01, $01, $01, $1d, $14, $0a, $0d, $09, $0d, $2e, $25
	db $01, $01, $01, $1d, $15, $10, $10, $0f, $10, $2e, $25, $01, $01, $01, $1d, $16
	db $07, $15, $08, $15, $2e, $25, $01, $01, $01, $1d, $17, $21, $0a, $20, $0a, $2e
	db $00, $00, $33, $21, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00, $00, $00, $33, $21
	db $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00, $00, $00, $33, $21, $32, $14
	db $18, $79, $07, $0c, $00, $0f, $0a, $00, $00, $00, $33, $21, $3e, $14, $18, $79
	db $1f, $17, $00, $04, $0a, $00, $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11
	db $00, $04, $0a, $00, $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e
	db $0a, $00, $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00, $00, $00
	db $33, $21, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00, $00, $00, $33, $21
	db $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00, $00, $00, $33, $21, $44, $18
	db $1c, $79, $14, $08, $00, $0e, $0a, $00, $00, $00, $33, $21, $47, $18, $1c, $78
	db $07, $07, $07, $0f, $0a, $00, $00, $00, $33, $21, $2a, $18, $1c, $10, $05, $05
	db $05, $04, $0a, $00, $00, $00, $33, $21, $85, $18, $1c, $7b, $14, $0d, $1f, $0e
	db $0a, $00, $00, $00, $33, $21, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $33, $21, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00, $00, $00
	db $33, $21, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00, $00, $00, $33, $21
	db $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00, $00, $00, $33, $21, $36, $1a
	db $1e, $79, $0f, $0b, $00, $04, $0a, $00, $00, $00, $33, $21, $85, $1c, $20, $7b
	db $14, $0d, $1f, $0f, $0a, $00, $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17
	db $08, $0e, $0a, $00, $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04
	db $0a, $00, $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $33, $21, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00, $00, $00
	db $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00, $00, $00, $33, $21
	db $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00, $00, $00, $33, $21, $0d, $1e
	db $22, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $33, $21, $12, $1e, $22, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05
	db $0a, $00, $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00, $00, $00
	db $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00, $00, $00, $33, $21
	db $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00, $00, $00, $33, $21, $0d, $20
	db $24, $77, $01, $05, $00, $05, $0a, $00, $00, $00, $33, $21, $12, $20, $24, $04
	db $1f, $07, $16, $10, $0a, $00, $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11
	db $00, $05, $0a, $00, $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11
	db $0a, $00, $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00

Func_a2ebf:: ; a2f05
	db $fa, $98, $c7, $b7, $c2, $1b, $6f, $3e, $03, $cd, $d7, $4c, $ea, $dd, $c7, $fa
	db $de, $c7, $3c, $ea, $de, $c7, $fa, $de, $c7, $fe, $23, $c2, $2b, $6f, $1e, $01
	db $21, $5f, $00, $cd, $1b, $46, $3e, $03, $cd, $01, $4d, $fa, $de, $c7, $fe, $1e
	db $ca, $00, $70, $fe, $1d, $ca, $00, $70, $fe, $1c, $ca, $00, $70, $fe, $1b, $ca
	db $00, $70, $fe, $1a, $ca, $00, $70, $fe, $19, $ca, $f5, $6f, $fe, $18, $ca, $f5
	db $6f, $fe, $17, $ca, $f5, $6f, $fe, $16, $ca, $f5, $6f, $fe, $15, $ca, $f5, $6f
	db $fe, $14, $ca, $ea, $6f, $fe, $13, $ca, $ea, $6f, $fe, $12, $ca, $ea, $6f, $fe
	db $11, $ca, $ea, $6f, $fe, $10, $ca, $ea, $6f, $fe, $0f, $ca, $df, $6f, $fe, $0e
	db $ca, $df, $6f, $fe, $0d, $ca, $df, $6f, $fe, $0c, $ca, $df, $6f, $fe, $0b, $ca
	db $df, $6f, $fe, $0a, $ca, $d4, $6f, $fe, $09, $ca, $d4, $6f, $fe, $08, $ca, $d4
	db $6f, $fe, $07, $ca, $d4, $6f, $fe, $06, $ca, $d4, $6f, $fe, $05, $ca, $c9, $6f
	db $fe, $04, $ca, $c9, $6f, $fe, $03, $ca, $c9, $6f, $fe, $02, $ca, $c9, $6f, $fe
	db $01, $c2, $0b, $70, $1e, $05, $21, $d5, $6c, $cd, $24, $4d, $c3, $13, $70, $1e
	db $05, $21, $1b, $6d, $cd, $24, $4d, $c3, $13, $70, $1e, $05, $21, $61, $6d, $cd
	db $24, $4d, $c3, $13, $70, $1e, $05, $21, $a7, $6d, $cd, $24, $4d, $c3, $13, $70
	db $1e, $05, $21, $ed, $6d, $cd, $24, $4d, $c3, $13, $70, $1e, $05, $21, $33, $6e
	db $cd, $24, $4d, $c3, $13, $70, $1e, $0a, $21, $79, $6e, $cd, $24, $4d, $fa, $de
	db $c7, $3c, $fe, $24, $d2, $53, $70, $cd, $90, $70, $21, $90, $70, $cd, $11, $4f
	db $3e, $04, $cd, $d7, $4c, $6f, $26, $00, $5d, $54, $29, $4d, $44, $29, $29, $19
	db $09, $e5, $21, $dd, $c7, $6e, $26, $00, $29, $29, $5d, $54, $29, $4d, $44, $29
	db $29, $19, $09, $11, $51, $6c, $19, $d1, $19, $1e, $01, $cd, $3a, $40, $1e, $01
	db $21, $46, $6c, $cd, $3a, $40, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $fa, $de
	db $c7, $fe, $23, $c2, $74, $70, $21, $f8, $00, $cd, $98, $44, $c3, $7d, $70, $21
	db $de, $c7, $6e, $26, $00, $cd, $83, $4f, $c9, $00, $0e, $01, $01, $01, $1c, $00
	db $0e, $01, $01, $16, $0a, $00, $0e, $01, $01, $25, $01, $21, $dd, $c7, $6e, $26
	db $00, $29, $5d, $54, $29, $19, $11, $7e, $70, $19, $cd, $9b, $4d, $cd, $02, $4f
	db $c9, $0b, $0c, $01, $01, $13, $1f, $0b, $0c, $0a, $0c, $2e, $00, $03, $0e, $0b
	db $50, $14, $17, $77, $14, $14, $00, $0e, $0a, $00, $00, $03, $0e, $0b, $57, $14
	db $17, $46, $1f, $17, $11, $0e, $09, $00, $00, $03, $0e, $0b, $26, $14, $17, $5b
	db $01, $01, $00, $04, $08, $00, $1b, $04, $01, $06, $01, $01, $02, $04, $00, $28
	db $7d, $71, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04, $00, $28, $dd, $71
	db $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28, $3d, $72, $00, $00
	db $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00, $00, $00

Func_a30cd:: ; a3113
	db $1e, $01, $21, $a6, $70, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $b1, $70, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $c8, $00, $cd, $2e, $46
	db $b7, $ca, $4b, $71, $21, $c9, $00, $cd, $2e, $46, $b7, $ca, $4b, $71, $21, $ca
	db $00, $cd, $2e, $46, $b7, $c2, $6b, $71, $1e, $00, $21, $c8, $00, $cd, $1b, $46
	db $1e, $00, $21, $c9, $00, $cd, $1b, $46, $1e, $00, $21, $ca, $00, $cd, $1b, $46
	db $1e, $03, $21, $db, $70, $cd, $fb, $40, $1e, $01, $21, $05, $71, $cd, $fb, $40
	db $cd, $1c, $40, $21, $1c, $04, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $9c
	db $71, $fe, $01, $c2, $db, $71, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $99
	db $71, $3e, $01, $ea, $c4, $c7, $c3, $db, $71, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $db, $71, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $c8, $00, $cd, $1b, $46, $21, $c9, $00, $cd, $2e, $46
	db $fe, $01, $c2, $db, $71, $21, $ca, $00, $cd, $2e, $46, $fe, $01, $c2, $db, $71
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $fc
	db $71, $fe, $01, $c2, $3b, $72, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $f9
	db $71, $3e, $01, $ea, $c4, $c7, $c3, $3b, $72, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $3b, $72, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $c9, $00, $cd, $1b, $46, $21, $c8, $00, $cd, $2e, $46
	db $fe, $01, $c2, $3b, $72, $21, $ca, $00, $cd, $2e, $46, $fe, $01, $c2, $3b, $72
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $5c
	db $72, $fe, $01, $c2, $9b, $72, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $59
	db $72, $3e, $01, $ea, $c4, $c7, $c3, $9b, $72, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $9b, $72, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $ca, $00, $cd, $1b, $46, $21, $c8, $00, $cd, $2e, $46
	db $fe, $01, $c2, $9b, $72, $21, $c9, $00, $cd, $2e, $46, $fe, $01, $c2, $9b, $72
	db $1e, $01, $21, $d1, $00, $cd, $1b, $46, $c1, $c9, $0b, $0c, $01, $01, $13, $1e
	db $0b, $0c, $0a, $0c, $2e, $0e, $0c, $01, $01, $13, $20, $0e, $0c, $0d, $0c, $2e
	db $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00, $00, $03
	db $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00, $00, $03, $0e, $0b
	db $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00, $1b, $04, $01, $06, $01, $01
	db $02, $04, $00, $28, $7f, $73, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04
	db $00, $28, $df, $73, $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28
	db $3f, $74, $00, $00, $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00
	db $00, $00

Func_a32cf:: ; a3315
	db $1e, $02, $21, $9d, $72, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $b3, $72, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $cb, $00, $cd, $2e, $46
	db $b7, $ca, $4d, $73, $21, $cc, $00, $cd, $2e, $46, $b7, $ca, $4d, $73, $21, $cd
	db $00, $cd, $2e, $46, $b7, $c2, $6d, $73, $1e, $00, $21, $cb, $00, $cd, $1b, $46
	db $1e, $00, $21, $cc, $00, $cd, $1b, $46, $1e, $00, $21, $cd, $00, $cd, $1b, $46
	db $1e, $03, $21, $dd, $72, $cd, $fb, $40, $1e, $01, $21, $07, $73, $cd, $fb, $40
	db $cd, $1c, $40, $21, $ee, $03, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $9e
	db $73, $fe, $01, $c2, $dd, $73, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $9b
	db $73, $3e, $01, $ea, $c4, $c7, $c3, $dd, $73, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $dd, $73, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cb, $00, $cd, $1b, $46, $21, $cc, $00, $cd, $2e, $46
	db $fe, $01, $c2, $dd, $73, $21, $cd, $00, $cd, $2e, $46, $fe, $01, $c2, $dd, $73
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $fe
	db $73, $fe, $01, $c2, $3d, $74, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $fb
	db $73, $3e, $01, $ea, $c4, $c7, $c3, $3d, $74, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $3d, $74, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cc, $00, $cd, $1b, $46, $21, $cb, $00, $cd, $2e, $46
	db $fe, $01, $c2, $3d, $74, $21, $cd, $00, $cd, $2e, $46, $fe, $01, $c2, $3d, $74
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $5e
	db $74, $fe, $01, $c2, $9d, $74, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $5b
	db $74, $3e, $01, $ea, $c4, $c7, $c3, $9d, $74, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $9d, $74, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cd, $00, $cd, $1b, $46, $21, $cb, $00, $cd, $2e, $46
	db $fe, $01, $c2, $9d, $74, $21, $cc, $00, $cd, $2e, $46, $fe, $01, $c2, $9d, $74
	db $1e, $01, $21, $d2, $00, $cd, $1b, $46, $c1, $c9, $0b, $0c, $01, $01, $13, $21
	db $0b, $11, $0a, $11, $2e, $0e, $0c, $01, $01, $13, $1f, $0e, $0c, $0d, $0c, $2e
	db $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00, $00, $03
	db $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00, $00, $03, $0e, $0b
	db $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00, $1b, $04, $01, $06, $01, $01
	db $02, $04, $00, $28, $81, $75, $00, $00, $1b, $04, $04, $09, $01, $01, $02, $04
	db $00, $28, $e1, $75, $00, $00, $1b, $04, $07, $06, $01, $01, $02, $04, $00, $28
	db $41, $76, $00, $00, $ff, $00, $04, $06, $01, $01, $00, $04, $01, $28, $00, $00
	db $00, $00

Func_a34d1:: ; a3517
	db $1e, $02, $21, $9f, $74, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $03, $21
	db $b5, $74, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $21, $ce, $00, $cd, $2e, $46
	db $b7, $ca, $4f, $75, $21, $cf, $00, $cd, $2e, $46, $b7, $ca, $4f, $75, $21, $d0
	db $00, $cd, $2e, $46, $b7, $c2, $6f, $75, $1e, $00, $21, $ce, $00, $cd, $1b, $46
	db $1e, $00, $21, $cf, $00, $cd, $1b, $46, $1e, $00, $21, $d0, $00, $cd, $1b, $46
	db $1e, $03, $21, $df, $74, $cd, $fb, $40, $1e, $01, $21, $09, $75, $cd, $fb, $40
	db $cd, $1c, $40, $21, $4a, $03, $cd, $72, $4f, $c9, $f5, $7b, $fe, $03, $ca, $a0
	db $75, $fe, $01, $c2, $df, $75, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $9d
	db $75, $3e, $01, $ea, $c4, $c7, $c3, $df, $75, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $df, $75, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $ce, $00, $cd, $1b, $46, $21, $cf, $00, $cd, $2e, $46
	db $fe, $01, $c2, $df, $75, $21, $d0, $00, $cd, $2e, $46, $fe, $01, $c2, $df, $75
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $00
	db $76, $fe, $01, $c2, $3f, $76, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $fd
	db $75, $3e, $01, $ea, $c4, $c7, $c3, $3f, $76, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $3f, $76, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $cf, $00, $cd, $1b, $46, $21, $ce, $00, $cd, $2e, $46
	db $fe, $01, $c2, $3f, $76, $21, $d0, $00, $cd, $2e, $46, $fe, $01, $c2, $3f, $76
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $f5, $7b, $fe, $03, $ca, $60
	db $76, $fe, $01, $c2, $9f, $76, $f8, $01, $7e, $cd, $de, $4b, $fe, $01, $c2, $5d
	db $76, $3e, $01, $ea, $c4, $c7, $c3, $9f, $76, $1e, $03, $f8, $01, $7e, $cd, $e9
	db $40, $b7, $ca, $9f, $76, $3e, $2b, $cd, $fe, $4e, $1e, $00, $f8, $01, $7e, $cd
	db $3d, $41, $1e, $01, $21, $d0, $00, $cd, $1b, $46, $21, $ce, $00, $cd, $2e, $46
	db $fe, $01, $c2, $9f, $76, $21, $cf, $00, $cd, $2e, $46, $fe, $01, $c2, $9f, $76
	db $1e, $01, $21, $d3, $00, $cd, $1b, $46, $c1, $c9, $0b, $11, $01, $01, $13, $20
	db $0b, $0c, $0a, $0c, $2e, $01, $04, $01, $01, $13, $25, $01, $0d, $02, $0d, $2e
	db $03, $17, $03, $01, $09, $00, $0b, $21, $0b, $22, $2e, $03, $0d, $0a, $0a, $50
	db $12, $14, $77, $14, $14, $00, $0c, $09, $00, $03, $0d, $0a, $0a, $57, $12, $14
	db $46, $1f, $17, $11, $0d, $04, $00, $03, $0d, $0a, $0a, $26, $13, $15, $5b, $01
	db $00, $00, $03, $08, $00, $00, $03, $09, $08, $50, $15, $17, $77, $14, $14, $00
	db $0e, $09, $00, $00, $03, $09, $08, $57, $15, $17, $46, $1f, $17, $11, $0f, $04
	db $00, $00, $03, $09, $08, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00, $00
	db $03, $09, $08, $5f, $16, $18, $77, $05, $06, $00, $04, $0a, $00, $00, $03, $09
	db $08, $2a, $17, $19, $10, $05, $05, $05, $04, $0a, $00

Func_a36ec:: ; a3732
	db $cd, $76, $77, $21, $76, $77, $cd, $11, $4f, $1e, $03, $21, $a1, $76, $cd, $3a
	db $40, $3e, $03, $cd, $01, $4d, $1e, $08, $21, $c2, $76, $cd, $24, $4d, $3e, $01
	db $cd, $c6, $4c, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $a9, $02, $cd, $72
	db $4f, $c9, $0a, $0b, $03, $01, $03, $0c, $0a, $0b, $03, $01, $03, $0b, $0a, $0b
	db $03, $01, $03, $0a, $21, $d1, $00, $cd, $2e, $46, $fe, $01, $ca, $97, $77, $21
	db $d2, $00, $cd, $2e, $46, $fe, $01, $ca, $97, $77, $21, $d3, $00, $cd, $2e, $46
	db $fe, $01, $c2, $cd, $77, $21, $d1, $00, $cd, $2e, $46, $fe, $01, $c2, $a8, $77
	db $21, $64, $77, $cd, $9b, $4d, $21, $d2, $00, $cd, $2e, $46, $fe, $01, $c2, $b9
	db $77, $21, $6a, $77, $cd, $9b, $4d, $21, $d3, $00, $cd, $2e, $46, $fe, $01, $c2
	db $ca, $77, $21, $70, $77, $cd, $9b, $4d, $cd, $02, $4f, $c9

Func_a3788:: ; a37ce
	ret

Func_a3789:: ; a37cf
	ret

Func_a378a:: ; a37d0
	ret

Data_a378b:
	db $01, $0d, $01, $01, $13, $21, $01, $04, $02, $04, $2e, $0b, $0d, $01, $01
	db $13, $26, $0b, $0d, $0a, $0d, $2e, $06, $02, $01, $01, $13, $0b, $02, $1b, $02
	db $1a, $2e, $00, $03, $0d, $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00
	db $00, $03, $0d, $0c, $57, $15, $17, $46, $1f, $17, $11, $0d, $09, $00, $00, $03
	db $0d, $0c, $26, $16, $18, $5b, $01, $00, $00, $04, $08, $00, $00, $03, $0d, $0c
	db $5f, $16, $18, $77, $05, $06, $00, $04, $06, $00, $00, $03, $0d, $0c, $2a, $17
	db $19, $10, $05, $05, $05, $04, $02, $00, $ff, $00, $00, $04, $01, $01, $00, $04
	db $01, $28, $fe, $78, $00, $00, $ff, $00, $01, $08, $01, $01, $00, $04, $01, $28
	db $2f, $79, $00, $00, $ff, $00, $02, $0a, $01, $01, $00, $04, $01, $28, $60, $79
	db $00, $00, $ff, $00, $04, $0c, $01, $01, $00, $04, $01, $28, $91, $79, $00, $00
	db $ff, $00, $05, $05, $01, $01, $00, $04, $01, $28, $c2, $79, $00, $00, $ff, $00
	db $05, $07, $01, $01, $00, $04, $01, $28, $f3, $79, $00, $00, $ff, $00, $06, $0a
	db $01, $01, $00, $04, $01, $28, $24, $7a, $00, $00, $ff, $00, $07, $04, $01, $01
	db $00, $04, $01, $28, $55, $7a, $00, $00, $ff, $00, $07, $0c, $01, $01, $00, $04
	db $01, $28, $86, $7a, $00, $00, $ff, $00, $09, $07, $01, $01, $00, $04, $01, $28
	db $b7, $7a, $00, $00, $ff, $00, $0a, $0a, $01, $01, $00, $04, $01, $28, $e8, $7a
	db $00, $00

Func_a388c:: ; a38d2
	db $1e, $03, $21, $d1, $77, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $f2, $77, $cd, $24, $4d, $1e, $0b, $21, $38, $78, $cd, $fb, $40, $3e, $08, $cd
	db $e6, $4e, $cd, $1c, $40, $21, $1e, $04, $cd, $72, $4f, $c9, $7b, $fe, $02, $c2
	db $2e, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e
	db $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e
	db $04, $e5, $0e, $00, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02
	db $c2, $5f, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41
	db $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46
	db $2e, $08, $e5, $0e, $01, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe
	db $02, $c2, $90, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd, $76
	db $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd, $77
	db $46, $2e, $0a, $e5, $0e, $02, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9, $7b
	db $fe, $02, $c2, $c1, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b, $cd
	db $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02, $cd
	db $77, $46, $2e, $0c, $e5, $0e, $04, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1, $c9
	db $7b, $fe, $02, $c2, $f2, $79, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e, $1b
	db $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e, $02
	db $cd, $77, $46, $2e, $05, $e5, $0e, $05, $1e, $26, $3e, $13, $cd, $ff, $4d, $c1
	db $c9, $7b, $fe, $02, $c2, $23, $7a, $af, $cd, $53, $46, $0e, $01, $1e, $01, $3e
	db $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41, $3e
	db $02, $cd, $77, $46, $2e, $07, $e5, $0e, $05, $1e, $26, $3e, $13, $cd, $ff, $4d
	db $c1, $c9, $7b, $fe, $02, $c2, $54, $7a, $af, $cd, $53, $46, $0e, $01, $1e, $01
	db $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b, $41
	db $3e, $02, $cd, $77, $46, $2e, $0a, $e5, $0e, $06, $1e, $26, $3e, $13, $cd, $ff
	db $4d, $c1, $c9, $7b, $fe, $02, $c2, $85, $7a, $af, $cd, $53, $46, $0e, $01, $1e
	db $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd, $8b
	db $41, $3e, $02, $cd, $77, $46, $2e, $04, $e5, $0e, $07, $1e, $26, $3e, $13, $cd
	db $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $b6, $7a, $af, $cd, $53, $46, $0e, $01
	db $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41, $cd
	db $8b, $41, $3e, $02, $cd, $77, $46, $2e, $0c, $e5, $0e, $07, $1e, $26, $3e, $13
	db $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $e7, $7a, $af, $cd, $53, $46, $0e
	db $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5, $41
	db $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e, $07, $e5, $0e, $09, $1e, $26, $3e
	db $13, $cd, $ff, $4d, $c1, $c9, $7b, $fe, $02, $c2, $18, $7b, $af, $cd, $53, $46
	db $0e, $01, $1e, $01, $3e, $1b, $cd, $76, $41, $3e, $37, $cd, $fe, $4e, $cd, $d5
	db $41, $cd, $8b, $41, $3e, $02, $cd, $77, $46, $2e, $0a, $e5, $0e, $0a, $1e, $26
	db $3e, $13, $cd, $ff, $4d, $c1, $c9, $0b, $0d, $01, $01, $13, $25, $0b, $0d, $0a
	db $0d, $2e, $01, $0d, $01, $01, $13, $27, $03, $21, $03, $20, $2e, $00, $03, $0d
	db $0c, $50, $15, $17, $77, $14, $14, $00, $0e, $0a, $00, $00, $03, $0d, $0c, $57
	db $15, $17, $46, $1f, $17, $11, $0d, $09, $00, $00, $03, $0d, $0c, $26, $16, $18
	db $5b, $01, $00, $00, $04, $08, $00, $00, $03, $0d, $0c, $5f, $16, $18, $77, $05
	db $06, $00, $04, $06, $00, $00, $03, $0d, $0c, $2a, $17, $19, $10, $05, $05, $05
	db $04, $02, $00

Func_a3b2f:: ; a3b75
	db $1e, $02, $21, $19, $7b, $cd, $3a, $40, $3e, $03, $cd, $01, $4d, $1e, $05, $21
	db $2f, $7b, $cd, $24, $4d, $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $1f, $04
	db $cd, $72, $4f, $c9, $03, $21, $01, $01, $13, $26, $01, $0d, $02, $0d, $2e, $28
	db $03, $05, $28, $03, $05, $00, $00, $00, $04, $02, $05, $01, $01, $03, $04, $00
	db $28, $dd, $46, $a4, $7b, $00, $04, $03, $1a, $01, $01, $00, $04, $00, $28, $1b
	db $7d, $00, $00, $00, $03, $06, $21, $50, $15, $19, $77, $14, $14, $00, $0e, $0a
	db $00, $00, $03, $06, $21, $57, $15, $19, $46, $1f, $17, $11, $0d, $09, $00, $00
	db $03, $06, $21, $26, $16, $1a, $5b, $01, $00, $00, $04, $08, $00, $00, $03, $06
	db $21, $5f, $16, $1a, $77, $05, $06, $00, $04, $06, $00, $00, $03, $06, $21, $2a
	db $17, $1b, $10, $05, $05, $05, $04, $02, $00

Func_a3bc8:: ; a3c0e
	db $cd, $d1, $7c, $21, $d1, $7c, $cd, $11, $4f, $1e, $01, $21, $99, $7b, $cd, $3a
	db $40, $1e, $01, $21, $a7, $7b, $cd, $e7, $4c, $3e, $03, $cd, $01, $4d, $1e, $05
	db $21, $c8, $7b, $cd, $24, $4d, $1e, $02, $21, $ac, $7b, $cd, $fb, $40, $21, $ec
	db $00, $cd, $2e, $46, $fe, $01, $c2, $4e, $7c, $1e, $00, $3e, $01, $cd, $3d, $41
	db $3e, $08, $cd, $e6, $4e, $cd, $1c, $40, $21, $5d, $04, $cd, $72, $4f, $c9

Func_a3c17:: ; a3c17
	db $21, $1a, $c2, $36, $02, $23, $36, $a8, $23, $36, $4b, $af, $cd, $f8, $03, $3e
	db $3a, $cd, $fe, $4e, $0e, $01, $1e, $01, $3e, $0a, $cd, $76, $41, $fa, $99, $c7
	db $fe, $02, $ca, $a9, $7c, $fe, $01, $ca, $9a, $7c, $b7, $c2, $b5, $7c, $1e, $19
	db $3e, $03, $cd, $e4, $41, $3e, $01, $ea, $99, $c7, $c3, $b5, $7c, $1e, $14, $3e
	db $03, $cd, $e4, $41, $3e, $02, $ea, $99, $c7, $c3, $b5, $7c, $1e, $0f, $3e, $03
	db $cd, $e4, $41, $3e, $03, $ea, $99, $c7, $cd, $d5, $41, $cd, $8b, $41, $cd, $d1
	db $7c, $c9, $02, $1b, $01, $02, $03, $18, $02, $1b, $01, $02, $03, $13, $02, $1b
	db $01, $02, $03, $0e, $fa, $99, $c7, $fe, $03, $ca, $fb, $7c, $fe, $02, $ca, $ec
	db $7c, $fe, $01, $c2, $0d, $7d, $21, $bf, $7c, $cd, $9b, $4d, $c3, $0d, $7d, $21
	db $bf, $7c, $cd, $9b, $4d, $21, $c5, $7c, $cd, $9b, $4d, $c3, $0d, $7d, $21, $bf
	db $7c, $cd, $9b, $4d, $21, $c5, $7c, $cd, $9b, $4d, $21, $cb, $7c, $cd, $9b, $4d
	db $cd, $02, $4f, $c9, $02, $1a, $ff, $ff, $02, $1b, $03, $1b, $ff, $ff, $7b, $b7
	db $c2, $b8, $7d, $fa, $38, $c8, $fe, $01, $c2, $3c, $7d, $0e, $01, $11, $15, $7d
	db $3e, $28, $cd, $3e, $46, $cd, $0c, $42, $af, $cd, $77, $46, $c3, $3c, $7d, $3e
	db $01, $cd, $4b, $44, $fa, $90, $c7, $fe, $05, $d2, $97, $7d, $3e, $2e, $cd, $5d
	db $4e, $fe, $01, $c2, $97, $7d, $21, $ec, $00, $cd, $2e, $46, $b7, $c2, $8e, $7d
	db $21, $5c, $04, $cd, $a9, $44, $21, $1e, $00, $cd, $8f, $46, $01, $11, $7d, $1e
	db $28, $3e, $01, $cd, $88, $46, $cd, $0c, $42, $21, $1e, $00, $cd, $8f, $46, $1e
	db $01, $3e, $01, $cd, $95, $40, $1e, $01, $21, $ec, $00, $cd, $1b, $46, $c3, $94
	db $7d, $21, $0f, $01, $cd, $98, $44, $c3, $b8, $7d, $21, $ec, $00, $cd, $2e, $46
	db $fe, $01, $c2, $ab, $7d, $21, $0f, $01, $cd, $98, $44, $c3, $b8, $7d, $21, $5b
	db $04, $cd, $a9, $44, $1e, $00, $3e, $01, $cd, $95, $40, $c9, $04, $0c, $03, $01
	db $13, $14, $0c, $02, $0c, $03, $2e, $00, $04, $0b, $08, $26, $28, $2d, $5d, $01
	db $01, $00, $05, $0a, $00, $00, $04, $0b, $08, $34, $28, $2d, $1a, $17, $05, $1e
	db $05, $0a, $00, $00, $04, $0b, $08, $5f, $28, $2d, $79, $05, $06, $00, $05, $0a
	db $00, $19, $0c, $05, $05, $01, $01, $02, $04, $00, $28, $00, $00, $00, $00, $2c
	db $0c, $05, $05, $01, $01, $02, $04, $01, $28, $00, $00, $00, $00

Func_a3dc4:: ; a3e0a
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


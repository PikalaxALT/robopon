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
	db $00, $00, $23, $1e, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	db $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	db $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	db $00, $00, $23, $1e, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	db $00, $00, $23, $1e, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2901:
IF DEF(SUN)
	db $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	db $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	db $00, $00, $23, $1e, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	db $00, $00, $23, $1e, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	db $00, $00, $23, $1e, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2947:
IF DEF(SUN)
	db $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	db $00, $00, $23, $1e, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	db $00, $00, $23, $1e, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	db $00, $00, $23, $1e, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	db $00, $00, $23, $1e, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $23, $1e, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	db $00, $00, $23, $1e, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a298d:
IF DEF(SUN)
	db $00, $00, $23, $1e, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $23, $1e, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	db $00, $00, $23, $1e, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	db $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $23, $1e, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	db $00, $00, $23, $1e, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	db $00, $00, $23, $1e, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	db $00, $00, $23, $1e, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a29d3:
IF DEF(SUN)
	db $00, $00, $23, $1e, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	db $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $1e, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	db $00, $00, $23, $1e, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	db $00, $00, $23, $1e, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	db $00, $00, $23, $1e, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $23, $1e, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2a19:
IF DEF(SUN)
	db $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	db $00, $00, $23, $1e, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	db $00, $00, $23, $1e, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2a5f:
IF DEF(SUN)
	db $00, $00, $23, $1e, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	db $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $23, $1e, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $23, $1e, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	db $00, $00, $23, $1e, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	db $00, $00, $23, $1e, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
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
	db $00, $00, $33, $21, $0a, $14, $18, $79, $04, $0f, $00, $04, $0a, $00
	db $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	db $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	db $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $0d, $14, $18, $77, $01, $05, $00, $04, $0a, $00
	db $00, $00, $33, $21, $12, $14, $18, $04, $1f, $07, $16, $0e, $0a, $00
	db $00, $00, $33, $21, $2c, $14, $18, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $33, $21, $32, $14, $18, $79, $07, $0c, $00, $0f, $0a, $00
	db $00, $00, $33, $21, $3e, $14, $18, $79, $1f, $17, $00, $04, $0a, $00
ENDC

Data_a2d1b:
IF DEF(SUN)
	db $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	db $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	db $00, $00, $33, $21, $06, $16, $1a, $30, $03, $03, $01, $0e, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $2c, $16, $1a, $79, $06, $11, $00, $04, $0a, $00
	db $00, $00, $33, $21, $32, $16, $1a, $79, $07, $0c, $00, $0e, $0a, $00
	db $00, $00, $33, $21, $3e, $16, $1a, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $16, $1a, $79, $14, $08, $00, $0f, $0a, $00
	db $00, $00, $33, $21, $47, $16, $1a, $78, $07, $07, $07, $10, $0a, $00
ENDC

Data_a2d61:
IF DEF(SUN)
	db $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	db $00, $00, $33, $21, $06, $18, $1c, $30, $03, $03, $01, $0f, $0a, $00
	db $00, $00, $33, $21, $29, $18, $1c, $10, $01, $01, $01, $04, $0a, $00
	db $00, $00, $33, $21, $88, $18, $1c, $79, $04, $04, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $3e, $18, $1c, $79, $1f, $17, $00, $04, $0a, $00
	db $00, $00, $33, $21, $44, $18, $1c, $79, $14, $08, $00, $0e, $0a, $00
	db $00, $00, $33, $21, $47, $18, $1c, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $33, $21, $2a, $18, $1c, $10, $05, $05, $05, $04, $0a, $00
	db $00, $00, $33, $21, $85, $18, $1c, $7b, $14, $0d, $1f, $0e, $0a, $00
ENDC

Data_a2da7:
IF DEF(SUN)
	db $00, $00, $33, $21, $06, $1a, $1e, $30, $03, $03, $01, $0e, $0a, $00
	db $00, $00, $33, $21, $29, $1a, $1e, $10, $01, $01, $01, $04, $0a, $00
	db $00, $00, $33, $21, $88, $1a, $1e, $79, $04, $04, $00, $04, $0a, $00
	db $00, $00, $33, $21, $1d, $1a, $1e, $30, $1f, $17, $08, $0f, $0a, $00
	db $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $47, $1a, $1e, $78, $07, $07, $07, $0f, $0a, $00
	db $00, $00, $33, $21, $2a, $1a, $1e, $10, $05, $05, $05, $04, $0a, $00
	db $00, $00, $33, $21, $85, $1a, $1e, $7b, $14, $0d, $1f, $0e, $0a, $00
	db $00, $00, $33, $21, $1d, $1a, $1e, $52, $1f, $17, $08, $0f, $0a, $00
	db $00, $00, $33, $21, $36, $1a, $1e, $79, $0f, $0b, $00, $04, $0a, $00
ENDC

Data_a2ded:
IF DEF(SUN)
	db $00, $00, $33, $21, $88, $1c, $20, $79, $04, $04, $00, $04, $0a, $00
	db $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	db $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	db $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $33, $21, $0a, $1c, $20, $79, $04, $0f, $00, $04, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $85, $1c, $20, $7b, $14, $0d, $1f, $0f, $0a, $00
	db $00, $00, $33, $21, $1d, $1c, $20, $52, $1f, $17, $08, $0e, $0a, $00
	db $00, $00, $33, $21, $36, $1c, $20, $79, $0f, $0b, $00, $04, $0a, $00
	db $00, $00, $33, $21, $19, $1c, $20, $1a, $09, $09, $0b, $04, $0a, $00
	db $00, $00, $33, $21, $0d, $1c, $20, $77, $01, $05, $00, $04, $0a, $00
ENDC

Data_a2e33:
IF DEF(SUN)
	db $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	db $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	db $00, $00, $33, $21, $0a, $1e, $22, $79, $04, $0f, $00, $05, $0a, $00
	db $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $36, $1e, $22, $79, $0f, $0b, $00, $05, $0a, $00
	db $00, $00, $33, $21, $19, $1e, $22, $1a, $09, $09, $0b, $05, $0a, $00
	db $00, $00, $33, $21, $0d, $1e, $22, $77, $01, $05, $00, $05, $0a, $00
	db $00, $00, $33, $21, $12, $1e, $22, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $1e, $22, $79, $06, $11, $00, $05, $0a, $00
ENDC

Data_a2e79:
IF DEF(SUN)
	db $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	db $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	db $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	db $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ELIF DEF(STAR)
	db $00, $00, $33, $21, $0a, $20, $24, $79, $04, $0f, $00, $05, $0a, $00
	db $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	db $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	db $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
	db $00, $00, $33, $21, $0d, $20, $24, $77, $01, $05, $00, $05, $0a, $00
	db $00, $00, $33, $21, $12, $20, $24, $04, $1f, $07, $16, $10, $0a, $00
	db $00, $00, $33, $21, $2c, $20, $24, $79, $06, $11, $00, $05, $0a, $00
	db $00, $00, $33, $21, $32, $20, $24, $79, $07, $0c, $00, $11, $0a, $00
	db $00, $00, $33, $21, $3e, $20, $24, $79, $1f, $17, $00, $05, $0a, $00
ENDC

Func_a2ebf:: ; a2ebf
	ld a, [wSaveFileExists] ; A2EBF (28:6ebf) -> FA 98 C7
	or a ; A2EC2 (28:6ec2) -> B7
	jp nz, .asm_a2ed5 ; A2EC3 (28:6ec3) -> C2 D5 6E
	ld a, $03 ; A2EC6 (28:6ec6) -> 3E 03
	call Random_28 ; A2EC8 (28:6ec8) -> CD D7 4C
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
	call EventFlagAction_28 ; A2EE2 (28:6ee2) -> CD 1B 46
.asm_a2ee5:
	ld a, $03 ; A2EE5 (28:6ee5) -> 3E 03
	call Func_80d01_28 ; A2EE7 (28:6ee7) -> CD 01 4D
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
	call LoadEncounters_28 ; A2F88 (28:6f88) -> CD 24 4D
	jp .asm_a2fcd ; A2F8B (28:6f8b) -> C3 CD 6F
.asm_a2f8e:
	ld e, $05 ; A2F8E (28:6f8e) -> 1E 05
	ld hl, Data_a2d1b ; A2F90 (28:6f90) -> 21 1B 6D
	call LoadEncounters_28 ; A2F93 (28:6f93) -> CD 24 4D
	jp .asm_a2fcd ; A2F96 (28:6f96) -> C3 CD 6F
.asm_a2f99:
	ld e, $05 ; A2F99 (28:6f99) -> 1E 05
	ld hl, Data_a2d61 ; A2F9B (28:6f9b) -> 21 61 6D
	call LoadEncounters_28 ; A2F9E (28:6f9e) -> CD 24 4D
	jp .asm_a2fcd ; A2FA1 (28:6fa1) -> C3 CD 6F
.asm_a2fa4:
	ld e, $05 ; A2FA4 (28:6fa4) -> 1E 05
	ld hl, Data_a2da7 ; A2FA6 (28:6fa6) -> 21 A7 6D
	call LoadEncounters_28 ; A2FA9 (28:6fa9) -> CD 24 4D
	jp .asm_a2fcd ; A2FAC (28:6fac) -> C3 CD 6F
.asm_a2faf:
	ld e, $05 ; A2FAF (28:6faf) -> 1E 05
	ld hl, Data_a2ded ; A2FB1 (28:6fb1) -> 21 ED 6D
	call LoadEncounters_28 ; A2FB4 (28:6fb4) -> CD 24 4D
	jp .asm_a2fcd ; A2FB7 (28:6fb7) -> C3 CD 6F
.asm_a2fba:
	ld e, $05 ; A2FBA (28:6fba) -> 1E 05
	ld hl, Data_a2e33 ; A2FBC (28:6fbc) -> 21 33 6E
	call LoadEncounters_28 ; A2FBF (28:6fbf) -> CD 24 4D
	jp .asm_a2fcd ; A2FC2 (28:6fc2) -> C3 CD 6F
.asm_a2fc5:
IF DEF(SUN)
	ld e, $05 ; A2FC5 (28:6fc5) -> 1E 05
ELIF DEF(STAR)
	ld e, $0a ; A2FC5 (28:6fc5) -> 1E 05
ENDC
	ld hl, Data_a2e79 ; A2FC7 (28:6fc7) -> 21 79 6E
	call LoadEncounters_28 ; A2FCA (28:6fca) -> CD 24 4D
.asm_a2fcd:
	ld a, [wc7de] ; A2FCD (28:6fcd) -> FA DE C7
	inc a ; A2FD0 (28:6fd0) -> 3C
	cp $24 ; A2FD1 (28:6fd1) -> FE 24
	jp nc, .asm_a300d ; A2FD3 (28:6fd3) -> D2 0D 70
	call Func_a304a ; A2FD6 (28:6fd6) -> CD 4A 70
	ld hl, Func_a304a ; A2FD9 (28:6fd9) -> 21 4A 70
	call Func_80f11_28 ; A2FDC (28:6fdc) -> CD 11 4F
	ld a, $04 ; A2FDF (28:6fdf) -> 3E 04
	call Random_28 ; A2FE1 (28:6fe1) -> CD D7 4C
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
	call LoadWarps_28 ; A300A (28:700a) -> CD 3A 40
.asm_a300d:
	ld e, $01 ; A300D (28:700d) -> 1E 01
	ld hl, Data_a2c46 ; A300F (28:700f) -> 21 46 6C
	call LoadWarps_28 ; A3012 (28:7012) -> CD 3A 40
	ld a, $08 ; A3015 (28:7015) -> 3E 08
	call PlayMusic_28 ; A3017 (28:7017) -> CD E6 4E
	call Func_8001c_28 ; A301A (28:701a) -> CD 1C 40
	ld a, [wc7de] ; A301D (28:701d) -> FA DE C7
	cp $23 ; A3020 (28:7020) -> FE 23
	jp nz, .asm_a302e ; A3022 (28:7022) -> C2 2E 70
	ld hl, $00f8 ; A3025 (28:7025) -> 21 F8 00
	call PrintTextStandard_28 ; A3028 (28:7028) -> CD 98 44
	jp .asm_a3037 ; A302B (28:702b) -> C3 37 70
.asm_a302e:
	ld hl, wc7de ; A302E (28:702e) -> 21 DE C7
	ld l, [hl] ; A3031 (28:7031) -> 6E
	ld h, $00 ; A3032 (28:7032) -> 26 00
	call Func_80f83_28 ; A3034 (28:7034) -> CD 83 4F
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
	call Func_80d9b_28 ; A3059 (28:7059) -> CD 9B 4D
	call Func_80f02_28 ; A305C (28:705c) -> CD 02 4F
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
	call LoadWarps_28 ; A30D2 (28:70d2) -> CD 3A 40
	ld a, $03 ; A30D5 (28:70d5) -> 3E 03
	call Func_80d01_28 ; A30D7 (28:70d7) -> CD 01 4D
	ld e, $03 ; A30DA (28:70da) -> 1E 03
	ld hl, Data_a306b ; A30DC (28:70dc) -> 21 6B 70
	call LoadEncounters_28 ; A30DF (28:70df) -> CD 24 4D
	ld a, $08 ; A30E2 (28:70e2) -> 3E 08
	call PlayMusic_28 ; A30E4 (28:70e4) -> CD E6 4E
	ld hl, $00c8 ; A30E7 (28:70e7) -> 21 C8 00
	call CheckEventFlag_28 ; A30EA (28:70ea) -> CD 2E 46
	or a ; A30ED (28:70ed) -> B7
	jp z, .asm_a3105 ; A30EE (28:70ee) -> CA 05 71
	ld hl, $00c9 ; A30F1 (28:70f1) -> 21 C9 00
	call CheckEventFlag_28 ; A30F4 (28:70f4) -> CD 2E 46
	or a ; A30F7 (28:70f7) -> B7
	jp z, .asm_a3105 ; A30F8 (28:70f8) -> CA 05 71
	ld hl, $00ca ; A30FB (28:70fb) -> 21 CA 00
	call CheckEventFlag_28 ; A30FE (28:70fe) -> CD 2E 46
	or a ; A3101 (28:7101) -> B7
	jp nz, .asm_a3125 ; A3102 (28:7102) -> C2 25 71
.asm_a3105:
	ld e, $00 ; A3105 (28:7105) -> 1E 00
	ld hl, $00c8 ; A3107 (28:7107) -> 21 C8 00
	call EventFlagAction_28 ; A310A (28:710a) -> CD 1B 46
	ld e, $00 ; A310D (28:710d) -> 1E 00
	ld hl, $00c9 ; A310F (28:710f) -> 21 C9 00
	call EventFlagAction_28 ; A3112 (28:7112) -> CD 1B 46
	ld e, $00 ; A3115 (28:7115) -> 1E 00
	ld hl, $00ca ; A3117 (28:7117) -> 21 CA 00
	call EventFlagAction_28 ; A311A (28:711a) -> CD 1B 46
	ld e, $03 ; A311D (28:711d) -> 1E 03
	ld hl, Data_a3095 ; A311F (28:711f) -> 21 95 70
	call LoadMapObjects_28 ; A3122 (28:7122) -> CD FB 40
.asm_a3125:
	ld e, $01 ; A3125 (28:7125) -> 1E 01
	ld hl, Data_a30bf ; A3127 (28:7127) -> 21 BF 70
	call LoadMapObjects_28 ; A312A (28:712a) -> CD FB 40
	call Func_8001c_28 ; A312D (28:712d) -> CD 1C 40
	ld hl, $041c ; A3130 (28:7130) -> 21 1C 04
	call LandmarkSign_28 ; A3133 (28:7133) -> CD 72 4F
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
	call Func_80bde_28 ; A3146 (28:7146) -> CD DE 4B
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
	call CheckObjectsOccupyingSameTile_28 ; A315B (28:715b) -> CD E9 40
	or a ; A315E (28:715e) -> B7
	jp z, .asm_a3195 ; A315F (28:715f) -> CA 95 71
	ld a, $2b ; A3162 (28:7162) -> 3E 2B
	call PlaySFX_28 ; A3164 (28:7164) -> CD FE 4E
	ld e, $00 ; A3167 (28:7167) -> 1E 00
	ld hl, sp+$01 ; A3169 (28:7169) -> F8 01
	ld a, [hl] ; A316B (28:716b) -> 7E
	call SetPersonVisibilityState_28 ; A316C (28:716c) -> CD 3D 41
	ld e, $01 ; A316F (28:716f) -> 1E 01
	ld hl, $00c8 ; A3171 (28:7171) -> 21 C8 00
	call EventFlagAction_28 ; A3174 (28:7174) -> CD 1B 46
	ld hl, $00c9 ; A3177 (28:7177) -> 21 C9 00
	call CheckEventFlag_28 ; A317A (28:717a) -> CD 2E 46
	cp $01 ; A317D (28:717d) -> FE 01
	jp nz, .asm_a3195 ; A317F (28:717f) -> C2 95 71
	ld hl, $00ca ; A3182 (28:7182) -> 21 CA 00
	call CheckEventFlag_28 ; A3185 (28:7185) -> CD 2E 46
	cp $01 ; A3188 (28:7188) -> FE 01
	jp nz, .asm_a3195 ; A318A (28:718a) -> C2 95 71
	ld e, $01 ; A318D (28:718d) -> 1E 01
	ld hl, $00d1 ; A318F (28:718f) -> 21 D1 00
	call EventFlagAction_28 ; A3192 (28:7192) -> CD 1B 46
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
	call Func_80bde_28 ; A31A6 (28:71a6) -> CD DE 4B
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
	call CheckObjectsOccupyingSameTile_28 ; A31BB (28:71bb) -> CD E9 40
	or a ; A31BE (28:71be) -> B7
	jp z, .asm_a31f5 ; A31BF (28:71bf) -> CA F5 71
	ld a, $2b ; A31C2 (28:71c2) -> 3E 2B
	call PlaySFX_28 ; A31C4 (28:71c4) -> CD FE 4E
	ld e, $00 ; A31C7 (28:71c7) -> 1E 00
	ld hl, sp+$01 ; A31C9 (28:71c9) -> F8 01
	ld a, [hl] ; A31CB (28:71cb) -> 7E
	call SetPersonVisibilityState_28 ; A31CC (28:71cc) -> CD 3D 41
	ld e, $01 ; A31CF (28:71cf) -> 1E 01
	ld hl, $00c9 ; A31D1 (28:71d1) -> 21 C9 00
	call EventFlagAction_28 ; A31D4 (28:71d4) -> CD 1B 46
	ld hl, $00c8 ; A31D7 (28:71d7) -> 21 C8 00
	call CheckEventFlag_28 ; A31DA (28:71da) -> CD 2E 46
	cp $01 ; A31DD (28:71dd) -> FE 01
	jp nz, .asm_a31f5 ; A31DF (28:71df) -> C2 F5 71
	ld hl, $00ca ; A31E2 (28:71e2) -> 21 CA 00
	call CheckEventFlag_28 ; A31E5 (28:71e5) -> CD 2E 46
	cp $01 ; A31E8 (28:71e8) -> FE 01
	jp nz, .asm_a31f5 ; A31EA (28:71ea) -> C2 F5 71
	ld e, $01 ; A31ED (28:71ed) -> 1E 01
	ld hl, $00d1 ; A31EF (28:71ef) -> 21 D1 00
	call EventFlagAction_28 ; A31F2 (28:71f2) -> CD 1B 46
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
	call Func_80bde_28 ; A3206 (28:7206) -> CD DE 4B
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
	call CheckObjectsOccupyingSameTile_28 ; A321B (28:721b) -> CD E9 40
	or a ; A321E (28:721e) -> B7
	jp z, .asm_a3255 ; A321F (28:721f) -> CA 55 72
	ld a, $2b ; A3222 (28:7222) -> 3E 2B
	call PlaySFX_28 ; A3224 (28:7224) -> CD FE 4E
	ld e, $00 ; A3227 (28:7227) -> 1E 00
	ld hl, sp+$01 ; A3229 (28:7229) -> F8 01
	ld a, [hl] ; A322B (28:722b) -> 7E
	call SetPersonVisibilityState_28 ; A322C (28:722c) -> CD 3D 41
	ld e, $01 ; A322F (28:722f) -> 1E 01
	ld hl, $00ca ; A3231 (28:7231) -> 21 CA 00
	call EventFlagAction_28 ; A3234 (28:7234) -> CD 1B 46
	ld hl, $00c8 ; A3237 (28:7237) -> 21 C8 00
	call CheckEventFlag_28 ; A323A (28:723a) -> CD 2E 46
	cp $01 ; A323D (28:723d) -> FE 01
	jp nz, .asm_a3255 ; A323F (28:723f) -> C2 55 72
	ld hl, $00c9 ; A3242 (28:7242) -> 21 C9 00
	call CheckEventFlag_28 ; A3245 (28:7245) -> CD 2E 46
	cp $01 ; A3248 (28:7248) -> FE 01
	jp nz, .asm_a3255 ; A324A (28:724a) -> C2 55 72
	ld e, $01 ; A324D (28:724d) -> 1E 01
	ld hl, $00d1 ; A324F (28:724f) -> 21 D1 00
	call EventFlagAction_28 ; A3252 (28:7252) -> CD 1B 46
.asm_a3255:
	pop bc ; A3255 (28:7255) -> C1
	ret  ; A3256 (28:7256) -> C9

Data_a3257:

IF DEF(SUN)
	db $0b, $0c, $01, $01, $13, $1e
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
	db $0b, $0c, $01, $01, $13, $1e
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


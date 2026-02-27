INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 2b, 2", ROMX
	script_library 2b_2

Data_ae3c9:
	warpdef $0e, $29, $01, $01, MAP_N_A, $ff, $ff, $ff, $ff, $2e
	warpdef $09, $06, $01, $01, MAP_27_01, $12, $1c, $12, $1b, $2e

Data_ae3df:
IF DEF(SUN)
	wildbot $05, $05, $10, $23, $66, $2a, $2d, $7b, $06, $09, $00, $12, $0a, $00
	wildbot $05, $05, $10, $23, $67, $2a, $2d, $7a, $05, $13, $00, $13, $0a, $00
	wildbot $05, $05, $10, $23, $3f, $2c, $2f, $26, $0c, $0f, $00, $06, $05, $00
	wildbot $05, $05, $10, $23, $68, $2d, $30, $7a, $05, $05, $05, $12, $04, $00
ELIF DEF(STAR)
	wildbot $05, $05, $10, $23, $66, $2a, $2d, $7b, $06, $09, $00, $12, $0a, $00
	wildbot $05, $05, $10, $23, $67, $2a, $2d, $7a, $05, $13, $00, $13, $0a, $00
	wildbot $05, $05, $10, $23, $3f, $2c, $2f, $26, $0c, $0f, $00, $06, $05, $00
	wildbot $05, $05, $10, $23, $68, $2d, $30, $7a, $05, $05, $05, $12, $04, $00
ENDC

Data_ae417:
	dw $02e
	dw -1

Data_ae41b:
	person_event $ff, $00, $12, $08, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $12, $12, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $05, $18, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $ff, $00, $05, $21, $03, $01, $00, $04, $01, Func_ae4fa, NULL
	person_event $0f, $04, $0d, $21, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0d, $21, $01, $01, $02, $04, $01, Func_ae56c, NULL
	person_event $ff, $00, $0c, $28, $02, $01, $00, $04, $00, PrintTextFacePlayer_2b_2, Data_ae417
	person_event $ff, $00, $0f, $28, $01, $01, $00, $04, $00, PrintTextFacePlayer_2b_2, Data_ae417

Func_ae48b:: ; ae48b
	ld a, $0e ; AE48B (2b:648b) -> 3E 0E
	ld [wc7e2], a ; AE48D (2b:648d) -> EA E2 C7
	ld e, $02 ; AE490 (2b:6490) -> 1E 02
	ld hl, Data_ae3c9 ; AE492 (2b:6492) -> 21 C9 63
	scall LoadWarps ; AE495 (2b:6495) -> CD 4F 53
	ld a, $03 ; AE498 (2b:6498) -> 3E 03
	scall Func_80d01 ; AE49A (2b:649a) -> CD 16 60
	ld e, $04 ; AE49D (2b:649d) -> 1E 04
	ld hl, Data_ae3df ; AE49F (2b:649f) -> 21 DF 63
	scall LoadEncounters ; AE4A2 (2b:64a2) -> CD 39 60
	ld e, $08 ; AE4A5 (2b:64a5) -> 1E 08
	ld hl, Data_ae41b ; AE4A7 (2b:64a7) -> 21 1B 64
	scall LoadMapObjects ; AE4AA (2b:64aa) -> CD 10 54
	ld e, $00 ; AE4AD (2b:64ad) -> 1E 00
	ld a, $04 ; AE4AF (2b:64af) -> 3E 04
	scall SetPersonVisibilityState ; AE4B1 (2b:64b1) -> CD 52 54
	ld a, $20 ; AE4B4 (2b:64b4) -> 3E 20
	scall Func_80e6d ; AE4B6 (2b:64b6) -> CD 82 61
	cp $ff ; AE4B9 (2b:64b9) -> FE FF
	jp nz, .asm_ae4d2 ; AE4BB (2b:64bb) -> C2 D2 64
	ld a, $21 ; AE4BE (2b:64be) -> 3E 21
	scall Func_80e6d ; AE4C0 (2b:64c0) -> CD 82 61
	cp $ff ; AE4C3 (2b:64c3) -> FE FF
	jp nz, .asm_ae4d2 ; AE4C5 (2b:64c5) -> C2 D2 64
	ld a, $7e ; AE4C8 (2b:64c8) -> 3E 7E
	scall Func_80e6d ; AE4CA (2b:64ca) -> CD 82 61
	cp $ff ; AE4CD (2b:64cd) -> FE FF
	jp z, .asm_ae4da ; AE4CF (2b:64cf) -> CA DA 64
.asm_ae4d2:
	ld a, $03 ; AE4D2 (2b:64d2) -> 3E 03
	scall LoadPlayerSprite ; AE4D4 (2b:64d4) -> CD DB 5F
	jp .asm_ae4f1 ; AE4D7 (2b:64d7) -> C3 F1 64
.asm_ae4da:
	ld a, $1f ; AE4DA (2b:64da) -> 3E 1F
	scall Func_80e6d ; AE4DC (2b:64dc) -> CD 82 61
	cp $ff ; AE4DF (2b:64df) -> FE FF
	jp z, .asm_ae4ec ; AE4E1 (2b:64e1) -> CA EC 64
	ld a, $02 ; AE4E4 (2b:64e4) -> 3E 02
	scall LoadPlayerSprite ; AE4E6 (2b:64e6) -> CD DB 5F
	jp .asm_ae4f1 ; AE4E9 (2b:64e9) -> C3 F1 64
.asm_ae4ec:
	ld a, $01 ; AE4EC (2b:64ec) -> 3E 01
	scall LoadPlayerSprite ; AE4EE (2b:64ee) -> CD DB 5F
.asm_ae4f1:
	ld a, $13 ; AE4F1 (2b:64f1) -> 3E 13
	scall PlayMusic ; AE4F3 (2b:64f3) -> CD FB 61
	scall Func_8001c ; AE4F6 (2b:64f6) -> CD 31 53
	ret  ; AE4F9 (2b:64f9) -> C9

Func_ae4fa:
	push de ; AE4FA (2b:64fa) -> D5
	push bc ; AE4FB (2b:64fb) -> C5
	push bc ; AE4FC (2b:64fc) -> C5
	ld hl, sp+$03 ; AE4FD (2b:64fd) -> F8 03
	ld a, $ff ; AE4FF (2b:64ff) -> 3E FF
	ld [hl], a ; AE501 (2b:6501) -> 77
	ld hl, sp+$02 ; AE502 (2b:6502) -> F8 02
	ld [hl], a ; AE504 (2b:6504) -> 77
	ld a, $20 ; AE505 (2b:6505) -> 3E 20
	scall Func_80e6d ; AE507 (2b:6507) -> CD 82 61
	cp $ff ; AE50A (2b:650a) -> FE FF
	jp nz, .asm_ae563 ; AE50C (2b:650c) -> C2 63 65
	ld a, $21 ; AE50F (2b:650f) -> 3E 21
	scall Func_80e6d ; AE511 (2b:6511) -> CD 82 61
	cp $ff ; AE514 (2b:6514) -> FE FF
	jp nz, .asm_ae563 ; AE516 (2b:6516) -> C2 63 65
	ld a, $7e ; AE519 (2b:6519) -> 3E 7E
	scall Func_80e6d ; AE51B (2b:651b) -> CD 82 61
	cp $ff ; AE51E (2b:651e) -> FE FF
	jp nz, .asm_ae563 ; AE520 (2b:6520) -> C2 63 65
	ld hl, sp+$04 ; AE523 (2b:6523) -> F8 04
	ld a, [hl] ; AE525 (2b:6525) -> 7E
	cp $02 ; AE526 (2b:6526) -> FE 02
	jp nz, .asm_ae560 ; AE528 (2b:6528) -> C2 60 65
	ld hl, $035a ; AE52B (2b:652b) -> 21 5A 03
	scall PrintTextStandard ; AE52E (2b:652e) -> CD AD 57
	ld hl, sp+$00 ; AE531 (2b:6531) -> F8 00
	ld a, [wMapX] ; AE533 (2b:6533) -> FA D8 C2
	add a, $05 ; AE536 (2b:6536) -> C6 05
	ld [hl], a ; AE538 (2b:6538) -> 77
	ld a, [wPlayerFacing] ; AE539 (2b:6539) -> FA 38 C8
	or a ; AE53C (2b:653c) -> B7
	jp nz, .asm_ae54b ; AE53D (2b:653d) -> C2 4B 65
	ld hl, sp+$01 ; AE540 (2b:6540) -> F8 01
	ld a, [wMapY] ; AE542 (2b:6542) -> FA D9 C2
	add a, $05 ; AE545 (2b:6545) -> C6 05
	ld [hl], a ; AE547 (2b:6547) -> 77
	jp .asm_ae553 ; AE548 (2b:6548) -> C3 53 65
.asm_ae54b:
	ld hl, sp+$01 ; AE54B (2b:654b) -> F8 01
	ld a, [wMapY] ; AE54D (2b:654d) -> FA D9 C2
	add a, $03 ; AE550 (2b:6550) -> C6 03
	ld [hl], a ; AE552 (2b:6552) -> 77
.asm_ae553:
	ld c, $01 ; AE553 (2b:6553) -> 0E 01
	ld hl, sp+$00 ; AE555 (2b:6555) -> F8 00
	push de ; AE557 (2b:6557) -> D5
	push hl ; AE558 (2b:6558) -> E5
	pop de ; AE559 (2b:6559) -> D1
	pop hl ; AE55A (2b:655a) -> E1
	ld a, $2b ; AE55B (2b:655b) -> 3E 2B
	scall MovePlayer ; AE55D (2b:655d) -> CD 53 59
.asm_ae560:
	jp .asm_ae568 ; AE560 (2b:6560) -> C3 68 65
.asm_ae563:
	ld a, $03 ; AE563 (2b:6563) -> 3E 03
	scall LoadPlayerSprite ; AE565 (2b:6565) -> CD DB 5F
.asm_ae568:
	pop bc ; AE568 (2b:6568) -> C1
	pop bc ; AE569 (2b:6569) -> C1
	pop bc ; AE56A (2b:656a) -> C1
	ret  ; AE56B (2b:656b) -> C9

Func_ae56c:
	ld a, e ; AE56C (2b:656c) -> 7B
	or a ; AE56D (2b:656d) -> B7
	jp nz, .asm_ae674 ; AE56E (2b:656e) -> C2 74 66
	ld hl, $00e0 ; AE571 (2b:6571) -> 21 E0 00
	scall CheckEventFlag ; AE574 (2b:6574) -> CD 43 59
	or a ; AE577 (2b:6577) -> B7
	jp nz, .asm_ae66e ; AE578 (2b:6578) -> C2 6E 66
	ld a, $5e ; AE57B (2b:657b) -> 3E 5E
	scall PlaySFX ; AE57D (2b:657d) -> CD 13 62
	ld c, $02 ; AE580 (2b:6580) -> 0E 02
	ld e, $02 ; AE582 (2b:6582) -> 1E 02
	ld a, $08 ; AE584 (2b:6584) -> 3E 08
	scall LoadEmote ; AE586 (2b:6586) -> CD 8B 54
	ld e, $21 ; AE589 (2b:6589) -> 1E 21
	ld a, $0d ; AE58B (2b:658b) -> 3E 0D
	scall MoveEmote ; AE58D (2b:658d) -> CD F9 54
	scall WaitEmote ; AE590 (2b:6590) -> CD EA 54
	scall HideEmote ; AE593 (2b:6593) -> CD A0 54
	ld a, $28 ; AE596 (2b:6596) -> 3E 28
	scall PlaySFX ; AE598 (2b:6598) -> CD 13 62
	ld e, $01 ; AE59B (2b:659b) -> 1E 01
	ld a, $04 ; AE59D (2b:659d) -> 3E 04
	scall SetPersonVisibilityState ; AE59F (2b:659f) -> CD 52 54
	ld a, $60 ; AE5A2 (2b:65a2) -> 3E 60
	scall PlaySFX ; AE5A4 (2b:65a4) -> CD 13 62
	ld e, $03 ; AE5A7 (2b:65a7) -> 1E 03
	ld a, $04 ; AE5A9 (2b:65a9) -> 3E 04
	scall SpriteFace ; AE5AB (2b:65ab) -> CD AA 53
	ld e, $00 ; AE5AE (2b:65ae) -> 1E 00
	ld a, $04 ; AE5B0 (2b:65b0) -> 3E 04
	scall SpriteFace ; AE5B2 (2b:65b2) -> CD AA 53
	ld e, $01 ; AE5B5 (2b:65b5) -> 1E 01
	ld a, $04 ; AE5B7 (2b:65b7) -> 3E 04
	scall SpriteFace ; AE5B9 (2b:65b9) -> CD AA 53
	ld e, $02 ; AE5BC (2b:65bc) -> 1E 02
	ld a, $04 ; AE5BE (2b:65be) -> 3E 04
	scall SpriteFace ; AE5C0 (2b:65c0) -> CD AA 53
	ld e, $03 ; AE5C3 (2b:65c3) -> 1E 03
	ld a, $04 ; AE5C5 (2b:65c5) -> 3E 04
	scall SpriteFace ; AE5C7 (2b:65c7) -> CD AA 53
	ld e, $00 ; AE5CA (2b:65ca) -> 1E 00
	ld a, $04 ; AE5CC (2b:65cc) -> 3E 04
	scall SpriteFace ; AE5CE (2b:65ce) -> CD AA 53
	ld e, $01 ; AE5D1 (2b:65d1) -> 1E 01
	ld a, $04 ; AE5D3 (2b:65d3) -> 3E 04
	scall SpriteFace ; AE5D5 (2b:65d5) -> CD AA 53
	ld e, $02 ; AE5D8 (2b:65d8) -> 1E 02
	ld a, $04 ; AE5DA (2b:65da) -> 3E 04
	scall SpriteFace ; AE5DC (2b:65dc) -> CD AA 53
	ld a, $0f ; AE5DF (2b:65df) -> 3E 0F
	scall FadeOutAudio ; AE5E1 (2b:65e1) -> CD 06 63
	ld a, $04 ; AE5E4 (2b:65e4) -> 3E 04
	scall PlayMusic ; AE5E6 (2b:65e6) -> CD FB 61
	ld a, $01 ; AE5E9 (2b:65e9) -> 3E 01
	scall FadeInAudio ; AE5EB (2b:65eb) -> CD 2F 63
	ld a, $14 ; AE5EE (2b:65ee) -> 3E 14
	scall PlayMusic ; AE5F0 (2b:65f0) -> CD FB 61
	ld a, $04 ; AE5F3 (2b:65f3) -> 3E 04
	scall FacePlayer ; AE5F5 (2b:65f5) -> CD 60 57
	ld hl, $001e ; AE5F8 (2b:65f8) -> 21 1E 00
	scall ScriptSleep ; AE5FB (2b:65fb) -> CD A4 59
	ld c, $07 ; AE5FE (2b:65fe) -> 0E 07
	ld e, $04 ; AE600 (2b:6600) -> 1E 04
	ld a, $01 ; AE602 (2b:6602) -> 3E 01
	scall Func_80e8d ; AE604 (2b:6604) -> CD A2 61
	ld e, $01 ; AE607 (2b:6607) -> 1E 01
	ld hl, $00e0 ; AE609 (2b:6609) -> 21 E0 00
	scall EventFlagAction ; AE60C (2b:660c) -> CD 30 59
	ld a, $60 ; AE60F (2b:660f) -> 3E 60
	scall PlaySFX ; AE611 (2b:6611) -> CD 13 62
	ld e, $03 ; AE614 (2b:6614) -> 1E 03
	ld a, $04 ; AE616 (2b:6616) -> 3E 04
	scall SpriteFace ; AE618 (2b:6618) -> CD AA 53
	ld e, $00 ; AE61B (2b:661b) -> 1E 00
	ld a, $04 ; AE61D (2b:661d) -> 3E 04
	scall SpriteFace ; AE61F (2b:661f) -> CD AA 53
	ld e, $01 ; AE622 (2b:6622) -> 1E 01
	ld a, $04 ; AE624 (2b:6624) -> 3E 04
	scall SpriteFace ; AE626 (2b:6626) -> CD AA 53
	ld e, $02 ; AE629 (2b:6629) -> 1E 02
	ld a, $04 ; AE62B (2b:662b) -> 3E 04
	scall SpriteFace ; AE62D (2b:662d) -> CD AA 53
	ld e, $03 ; AE630 (2b:6630) -> 1E 03
	ld a, $04 ; AE632 (2b:6632) -> 3E 04
	scall SpriteFace ; AE634 (2b:6634) -> CD AA 53
	ld e, $00 ; AE637 (2b:6637) -> 1E 00
	ld a, $04 ; AE639 (2b:6639) -> 3E 04
	scall SpriteFace ; AE63B (2b:663b) -> CD AA 53
	ld e, $01 ; AE63E (2b:663e) -> 1E 01
	ld a, $04 ; AE640 (2b:6640) -> 3E 04
	scall SpriteFace ; AE642 (2b:6642) -> CD AA 53
	ld e, $02 ; AE645 (2b:6645) -> 1E 02
	ld a, $04 ; AE647 (2b:6647) -> 3E 04
	scall SpriteFace ; AE649 (2b:6649) -> CD AA 53
	ld a, $0f ; AE64C (2b:664c) -> 3E 0F
	scall FadeOutAudio ; AE64E (2b:664e) -> CD 06 63
	xor a ; AE651 (2b:6651) -> AF
	scall PlayMusic ; AE652 (2b:6652) -> CD FB 61
	ld a, $01 ; AE655 (2b:6655) -> 3E 01
	scall FadeInAudio ; AE657 (2b:6657) -> CD 2F 63
	ld a, $13 ; AE65A (2b:665a) -> 3E 13
	scall PlayMusic ; AE65C (2b:665c) -> CD FB 61
	ld a, $04 ; AE65F (2b:665f) -> 3E 04
	scall FacePlayer ; AE661 (2b:6661) -> CD 60 57
	ld e, $00 ; AE664 (2b:6664) -> 1E 00
	ld a, $04 ; AE666 (2b:6666) -> 3E 04
	scall SetPersonVisibilityState ; AE668 (2b:6668) -> CD 52 54
	jp .asm_ae674 ; AE66B (2b:666b) -> C3 74 66
.asm_ae66e:
	ld hl, $015c ; AE66E (2b:666e) -> 21 5C 01
	scall PrintTextStandard ; AE671 (2b:6671) -> CD AD 57
.asm_ae674:
	ret  ; AE674 (2b:6674) -> C9

Data_ae675:
	warpdef $11, $1c, $03, $01, MAP_27_00, $09, $06, $09, $07, $2e
	warpdef $0f, $0c, $01, $01, MAP_27_02, $11, $0c, $11, $0b, $2e
	warpdef $14, $0c, $01, $01, MAP_27_02, $16, $0c, $17, $0c, $2e

Data_ae696:
IF DEF(SUN)
	wildbot $00, $03, $22, $19, $48, $2a, $2d, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $22, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $12, $09, $00
	wildbot $00, $03, $22, $19, $49, $2b, $2e, $06, $02, $02, $02, $06, $08, $00
	wildbot $00, $03, $22, $19, $44, $2c, $2f, $7a, $14, $08, $00, $13, $07, $00
	wildbot $00, $03, $22, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $06, $00
ELIF DEF(STAR)
	wildbot $00, $03, $22, $19, $49, $2a, $2d, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $22, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $12, $09, $00
	wildbot $00, $03, $22, $19, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $08, $00
	wildbot $00, $03, $22, $19, $44, $2c, $2f, $7a, $14, $08, $00, $13, $07, $00
	wildbot $00, $03, $22, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $06, $00
ENDC

Data_ae6dc:
	person_event $0d, $0c, $0a, $11, $01, $01, $02, $04, $00, NULL, NULL

Func_ae6ea:: ; ae6ea
	ld e, $03 ; AE6EA (2b:66ea) -> 1E 03
	ld hl, Data_ae675 ; AE6EC (2b:66ec) -> 21 75 66
	scall LoadWarps ; AE6EF (2b:66ef) -> CD 4F 53
	ld a, $01 ; AE6F2 (2b:66f2) -> 3E 01
	scall LoadPlayerSprite ; AE6F4 (2b:66f4) -> CD DB 5F
	ld hl, $0033 ; AE6F7 (2b:66f7) -> 21 33 00
	scall CheckEventFlag ; AE6FA (2b:66fa) -> CD 43 59
	or a ; AE6FD (2b:66fd) -> B7
	jp nz, label_ae720 ; AE6FE (2b:66fe) -> C2 20 67
	ld e, $01 ; AE701 (2b:6701) -> 1E 01
	ld hl, Data_ae6dc ; AE703 (2b:6703) -> 21 DC 66
	scall LoadMapObjects ; AE706 (2b:6706) -> CD 10 54
	scall Func_8001c ; AE709 (2b:6709) -> CD 31 53
	ld hl, $0315 ; AE70C (2b:670c) -> 21 15 03
	scall LandmarkSign ; AE70F (2b:670f) -> CD 87 62
	call Func_ae74c ; AE712 (2b:6712) -> CD 4C 67
	ld e, $01 ; AE715 (2b:6715) -> 1E 01
	ld hl, $0033 ; AE717 (2b:6717) -> 21 33 00
	scall EventFlagAction ; AE71A (2b:671a) -> CD 30 59
	jp label_ae73b ; AE71D (2b:671d) -> C3 3B 67
label_ae720:
	ld a, $03 ; AE720 (2b:6720) -> 3E 03
	scall Func_80d01 ; AE722 (2b:6722) -> CD 16 60
	ld e, $05 ; AE725 (2b:6725) -> 1E 05
	ld hl, Data_ae696 ; AE727 (2b:6727) -> 21 96 66
	scall LoadEncounters ; AE72A (2b:672a) -> CD 39 60
	ld a, $08 ; AE72D (2b:672d) -> 3E 08
	scall PlayMusic ; AE72F (2b:672f) -> CD FB 61
	scall Func_8001c ; AE732 (2b:6732) -> CD 31 53
	ld hl, $0315 ; AE735 (2b:6735) -> 21 15 03
	scall LandmarkSign ; AE738 (2b:6738) -> CD 87 62
label_ae73b:
	ret  ; AE73B (2b:673b) -> C9

Data_ae73c:
	db $12, $17, $ff, $ff

Data_ae740:
	db $12, $15, $ff, $ff

Data_ae744:
	db $11, $1c, $ff, $ff

Data_ae748:
	db $0a, $15, $ff, $ff

Func_ae74c:
	xor a ; AE74C (2b:674c) -> AF
	scall PlayMusic ; AE74D (2b:674d) -> CD FB 61
	ld e, $01 ; AE750 (2b:6750) -> 1E 01
	xor a ; AE752 (2b:6752) -> AF
	scall PlayerStep ; AE753 (2b:6753) -> CD 33 61
	ld e, $01 ; AE756 (2b:6756) -> 1E 01
	xor a ; AE758 (2b:6758) -> AF
	scall PlayerStep ; AE759 (2b:6759) -> CD 33 61
	ld e, $01 ; AE75C (2b:675c) -> 1E 01
	xor a ; AE75E (2b:675e) -> AF
	scall PlayerStep ; AE75F (2b:675f) -> CD 33 61
	ld e, $01 ; AE762 (2b:6762) -> 1E 01
	xor a ; AE764 (2b:6764) -> AF
	scall PlayerStep ; AE765 (2b:6765) -> CD 33 61
	ld e, $01 ; AE768 (2b:6768) -> 1E 01
	xor a ; AE76A (2b:676a) -> AF
	scall PlayerStep ; AE76B (2b:676b) -> CD 33 61
	xor a ; AE76E (2b:676e) -> AF
	scall Func_80653 ; AE76F (2b:676f) -> CD 68 59
	ld e, $01 ; AE772 (2b:6772) -> 1E 01
	ld a, $03 ; AE774 (2b:6774) -> 3E 03
	scall PlayerStep ; AE776 (2b:6776) -> CD 33 61
	ld e, $01 ; AE779 (2b:6779) -> 1E 01
	ld a, $03 ; AE77B (2b:677b) -> 3E 03
	scall PlayerStep ; AE77D (2b:677d) -> CD 33 61
	ld e, $01 ; AE780 (2b:6780) -> 1E 01
	ld a, $03 ; AE782 (2b:6782) -> 3E 03
	scall PlayerStep ; AE784 (2b:6784) -> CD 33 61
	ld e, $01 ; AE787 (2b:6787) -> 1E 01
	ld a, $03 ; AE789 (2b:6789) -> 3E 03
	scall PlayerStep ; AE78B (2b:678b) -> CD 33 61
	ld e, $01 ; AE78E (2b:678e) -> 1E 01
	ld a, $03 ; AE790 (2b:6790) -> 3E 03
	scall PlayerStep ; AE792 (2b:6792) -> CD 33 61
	ld e, $01 ; AE795 (2b:6795) -> 1E 01
	ld a, $03 ; AE797 (2b:6797) -> 3E 03
	scall PlayerStep ; AE799 (2b:6799) -> CD 33 61
	ld e, $01 ; AE79C (2b:679c) -> 1E 01
	ld a, $03 ; AE79E (2b:679e) -> 3E 03
	scall PlayerStep ; AE7A0 (2b:67a0) -> CD 33 61
	ld a, $01 ; AE7A3 (2b:67a3) -> 3E 01
	scall PlayMusic ; AE7A5 (2b:67a5) -> CD FB 61
	ld bc, Data_ae748 ; AE7A8 (2b:67a8) -> 01 48 67
	ld e, $2b ; AE7AB (2b:67ab) -> 1E 2B
	xor a ; AE7AD (2b:67ad) -> AF
	scall MovePersonAndWait ; AE7AE (2b:67ae) -> CD 9D 59
	scall WaitNPCStep ; AE7B1 (2b:67b1) -> CD 21 55
	ld hl, $0131 ; AE7B4 (2b:67b4) -> 21 31 01
	scall PrintTextWithNPCName ; AE7B7 (2b:67b7) -> CD BE 57
	ld e, $01 ; AE7BA (2b:67ba) -> 1E 01
	ld a, $01 ; AE7BC (2b:67bc) -> 3E 01
	scall PlayerStep ; AE7BE (2b:67be) -> CD 33 61
	ld e, $01 ; AE7C1 (2b:67c1) -> 1E 01
	ld a, $01 ; AE7C3 (2b:67c3) -> 3E 01
	scall PlayerStep ; AE7C5 (2b:67c5) -> CD 33 61
	ld e, $01 ; AE7C8 (2b:67c8) -> 1E 01
	ld a, $01 ; AE7CA (2b:67ca) -> 3E 01
	scall PlayerStep ; AE7CC (2b:67cc) -> CD 33 61
	ld e, $01 ; AE7CF (2b:67cf) -> 1E 01
	ld a, $01 ; AE7D1 (2b:67d1) -> 3E 01
	scall PlayerStep ; AE7D3 (2b:67d3) -> CD 33 61
	ld e, $01 ; AE7D6 (2b:67d6) -> 1E 01
	ld a, $01 ; AE7D8 (2b:67d8) -> 3E 01
	scall PlayerStep ; AE7DA (2b:67da) -> CD 33 61
	ld e, $01 ; AE7DD (2b:67dd) -> 1E 01
	ld a, $01 ; AE7DF (2b:67df) -> 3E 01
	scall PlayerStep ; AE7E1 (2b:67e1) -> CD 33 61
	ld e, $01 ; AE7E4 (2b:67e4) -> 1E 01
	ld a, $01 ; AE7E6 (2b:67e6) -> 3E 01
	scall PlayerStep ; AE7E8 (2b:67e8) -> CD 33 61
	ld a, $01 ; AE7EB (2b:67eb) -> 3E 01
	scall Func_80653 ; AE7ED (2b:67ed) -> CD 68 59
	ld e, $01 ; AE7F0 (2b:67f0) -> 1E 01
	ld a, $02 ; AE7F2 (2b:67f2) -> 3E 02
	scall PlayerStep ; AE7F4 (2b:67f4) -> CD 33 61
	ld e, $01 ; AE7F7 (2b:67f7) -> 1E 01
	ld a, $02 ; AE7F9 (2b:67f9) -> 3E 02
	scall PlayerStep ; AE7FB (2b:67fb) -> CD 33 61
	ld e, $01 ; AE7FE (2b:67fe) -> 1E 01
	ld a, $02 ; AE800 (2b:6800) -> 3E 02
	scall PlayerStep ; AE802 (2b:6802) -> CD 33 61
	ld e, $01 ; AE805 (2b:6805) -> 1E 01
	ld a, $02 ; AE807 (2b:6807) -> 3E 02
	scall PlayerStep ; AE809 (2b:6809) -> CD 33 61
	ld e, $01 ; AE80C (2b:680c) -> 1E 01
	ld a, $02 ; AE80E (2b:680e) -> 3E 02
	scall PlayerStep ; AE810 (2b:6810) -> CD 33 61
	ld c, $01 ; AE813 (2b:6813) -> 0E 01
	ld de, Data_ae73c ; AE815 (2b:6815) -> 11 3C 67
	ld a, $2b ; AE818 (2b:6818) -> 3E 2B
	scall MovePlayer ; AE81A (2b:681a) -> CD 53 59
	scall WaitNPCStep ; AE81D (2b:681d) -> CD 21 55
	ld bc, Data_ae740 ; AE820 (2b:6820) -> 01 40 67
	ld e, $2b ; AE823 (2b:6823) -> 1E 2B
	xor a ; AE825 (2b:6825) -> AF
	scall MovePersonAndWait ; AE826 (2b:6826) -> CD 9D 59
	scall WaitNPCStep ; AE829 (2b:6829) -> CD 21 55
	ld e, $02 ; AE82C (2b:682c) -> 1E 02
	xor a ; AE82E (2b:682e) -> AF
	scall SpriteFace ; AE82F (2b:682f) -> CD AA 53
	ld c, $01 ; AE832 (2b:6832) -> 0E 01
	ld e, $01 ; AE834 (2b:6834) -> 1E 01
	ld a, $05 ; AE836 (2b:6836) -> 3E 05
	scall LoadEmote ; AE838 (2b:6838) -> CD 8B 54
	ld e, $15 ; AE83B (2b:683b) -> 1E 15
	ld a, $12 ; AE83D (2b:683d) -> 3E 12
	scall MoveEmote ; AE83F (2b:683f) -> CD F9 54
	ld a, $28 ; AE842 (2b:6842) -> 3E 28
	scall PlaySFX ; AE844 (2b:6844) -> CD 13 62
	scall WaitEmote ; AE847 (2b:6847) -> CD EA 54
	scall HideEmote ; AE84A (2b:684a) -> CD A0 54
	ld hl, $001e ; AE84D (2b:684d) -> 21 1E 00
	scall ScriptSleep ; AE850 (2b:6850) -> CD A4 59
	ld hl, $0132 ; AE853 (2b:6853) -> 21 32 01
	scall PrintTextWithNPCName ; AE856 (2b:6856) -> CD BE 57
	ld bc, Data_ae744 ; AE859 (2b:6859) -> 01 44 67
	ld e, $2b ; AE85C (2b:685c) -> 1E 2B
	xor a ; AE85E (2b:685e) -> AF
	scall MovePersonAndWait ; AE85F (2b:685f) -> CD 9D 59
	scall WaitNPCStep ; AE862 (2b:6862) -> CD 21 55
	ld e, $00 ; AE865 (2b:6865) -> 1E 00
	xor a ; AE867 (2b:6867) -> AF
	scall SetPersonVisibilityState ; AE868 (2b:6868) -> CD 52 54
	xor a ; AE86B (2b:686b) -> AF
	scall PlayMusic ; AE86C (2b:686c) -> CD FB 61
	ld a, $08 ; AE86F (2b:686f) -> 3E 08
	scall PlayMusic ; AE871 (2b:6871) -> CD FB 61
	ret  ; AE874 (2b:6874) -> C9

Data_ae875:
	warpdef $11, $0c, $01, $01, MAP_27_01, $0f, $0c, $0f, $0b, $2e
	warpdef $16, $0c, $01, $01, MAP_27_01, $14, $0c, $14, $0b, $2e
	warpdef $19, $14, $01, $01, MAP_27_03, $14, $0c, $14, $0d, $2e
	warpdef $1e, $14, $01, $01, MAP_27_03, $19, $0c, $19, $0b, $2e

Data_ae8a1:
IF DEF(SUN)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $49, $2b, $2e, $06, $02, $02, $02, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $16, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $16, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $16, $44, $2c, $2f, $7a, $14, $08, $00, $12, $08, $00
	wildbot $00, $03, $20, $16, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $20, $16, $8e, $2f, $32, $7a, $0d, $0e, $13, $13, $04, $00
ENDC

Func_ae8e7:: ; ae8e7
	ld e, $04 ; AE8E7 (2b:68e7) -> 1E 04
	ld hl, Data_ae875 ; AE8E9 (2b:68e9) -> 21 75 68
	scall LoadWarps ; AE8EC (2b:68ec) -> CD 4F 53
	ld a, $03 ; AE8EF (2b:68ef) -> 3E 03
	scall Func_80d01 ; AE8F1 (2b:68f1) -> CD 16 60
	ld e, $05 ; AE8F4 (2b:68f4) -> 1E 05
	ld hl, Data_ae8a1 ; AE8F6 (2b:68f6) -> 21 A1 68
	scall LoadEncounters ; AE8F9 (2b:68f9) -> CD 39 60
	ld a, $08 ; AE8FC (2b:68fc) -> 3E 08
	scall PlayMusic ; AE8FE (2b:68fe) -> CD FB 61
	scall Func_8001c ; AE901 (2b:6901) -> CD 31 53
	ld hl, $0316 ; AE904 (2b:6904) -> 21 16 03
	scall LandmarkSign ; AE907 (2b:6907) -> CD 87 62
	ret  ; AE90A (2b:690a) -> C9

Data_ae90b:
	warpdef $14, $0c, $01, $01, MAP_27_02, $19, $14, $18, $14, $2e
	warpdef $19, $0c, $01, $01, MAP_27_02, $1e, $14, $1e, $13, $2e
	warpdef $11, $04, $01, $01, MAP_27_04, $09, $04, $08, $04, $2e
	warpdef $1e, $04, $01, $01, MAP_27_04, $16, $04, $15, $04, $2e

Data_ae937:
IF DEF(SUN)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $20, $19, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $20, $19, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $20, $19, $44, $2c, $2f, $7a, $14, $08, $00, $06, $08, $00
	wildbot $00, $03, $20, $19, $39, $2d, $30, $1b, $0e, $0b, $00, $13, $07, $00
	wildbot $00, $03, $20, $19, $8e, $2f, $32, $7a, $0d, $0e, $13, $06, $04, $00
ENDC

Func_ae97d:: ; ae97d
	ld e, $04 ; AE97D (2b:697d) -> 1E 04
	ld hl, Data_ae90b ; AE97F (2b:697f) -> 21 0B 69
	scall LoadWarps ; AE982 (2b:6982) -> CD 4F 53
	ld a, $03 ; AE985 (2b:6985) -> 3E 03
	scall Func_80d01 ; AE987 (2b:6987) -> CD 16 60
	ld e, $05 ; AE98A (2b:698a) -> 1E 05
	ld hl, Data_ae937 ; AE98C (2b:698c) -> 21 37 69
	scall LoadEncounters ; AE98F (2b:698f) -> CD 39 60
	ld a, $08 ; AE992 (2b:6992) -> 3E 08
	scall PlayMusic ; AE994 (2b:6994) -> CD FB 61
	scall Func_8001c ; AE997 (2b:6997) -> CD 31 53
	ld hl, $0317 ; AE99A (2b:699a) -> 21 17 03
	scall LandmarkSign ; AE99D (2b:699d) -> CD 87 62
	ret  ; AE9A0 (2b:69a0) -> C9

Data_ae9a1:
	db $09, $04, $01, $01, $1b, $03, $11, $04, $11, $05, $2e
	db $16, $04, $01, $01, $1b, $03, $1e, $04, $1e, $05, $2e
	db $01, $0c, $01, $01, $1b, $05, $0d, $0c, $0d, $0b, $2e

Data_ae9c2:
	db $44, $15, $0a, $02, $76

Data_ae9c7:
IF DEF(SUN)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $49, $2b, $2e, $06, $02, $02, $02, $12, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ELIF DEF(STAR)
	wildbot $00, $03, $18, $0d, $8f, $2b, $2e, $5e, $0f, $0d, $14, $06, $0a, $00
	wildbot $00, $03, $18, $0d, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $09, $00
	wildbot $00, $03, $18, $0d, $44, $2c, $2f, $7a, $14, $08, $00, $13, $08, $00
	wildbot $00, $03, $18, $0d, $39, $2d, $30, $1b, $0e, $0b, $00, $06, $07, $00
	wildbot $00, $03, $18, $0d, $8e, $2f, $32, $7a, $0d, $0e, $13, $12, $04, $00
ENDC

Data_aea0d:
	person_event $ff, $00, $06, $0f, $03, $01, $01, $04, $01, Func_aea4f, NULL

Func_aea1b:: ; aea1b
	ld e, $03 ; AEA1B (2b:6a1b) -> 1E 03
	ld hl, Data_ae9a1 ; AEA1D (2b:6a1d) -> 21 A1 69
	scall LoadWarps ; AEA20 (2b:6a20) -> CD 4F 53
	ld e, $01 ; AEA23 (2b:6a23) -> 1E 01
	ld hl, Data_ae9c2 ; AEA25 (2b:6a25) -> 21 C2 69
	scall Func_80ce7 ; AEA28 (2b:6a28) -> CD FC 5F
	ld a, $03 ; AEA2B (2b:6a2b) -> 3E 03
	scall Func_80d01 ; AEA2D (2b:6a2d) -> CD 16 60
	ld e, $05 ; AEA30 (2b:6a30) -> 1E 05
	ld hl, Data_ae9c7 ; AEA32 (2b:6a32) -> 21 C7 69
	scall LoadEncounters ; AEA35 (2b:6a35) -> CD 39 60
	ld e, $01 ; AEA38 (2b:6a38) -> 1E 01
	ld hl, Data_aea0d ; AEA3A (2b:6a3a) -> 21 0D 6A
	scall LoadMapObjects ; AEA3D (2b:6a3d) -> CD 10 54
	ld a, $08 ; AEA40 (2b:6a40) -> 3E 08
	scall PlayMusic ; AEA42 (2b:6a42) -> CD FB 61
	scall Func_8001c ; AEA45 (2b:6a45) -> CD 31 53
	ld hl, $0318 ; AEA48 (2b:6a48) -> 21 18 03
	scall LandmarkSign ; AEA4B (2b:6a4b) -> CD 87 62
	ret  ; AEA4E (2b:6a4e) -> C9

Func_aea4f:
	ld a, e ; AEA4F (2b:6a4f) -> 7B
	cp $02 ; AEA50 (2b:6a50) -> FE 02
	jp nz, label_aea7f ; AEA52 (2b:6a52) -> C2 7F 6A
	xor a ; AEA55 (2b:6a55) -> AF
	scall Func_80653 ; AEA56 (2b:6a56) -> CD 68 59
	ld c, $01 ; AEA59 (2b:6a59) -> 0E 01
	ld e, $01 ; AEA5B (2b:6a5b) -> 1E 01
	ld a, $1b ; AEA5D (2b:6a5d) -> 3E 1B
	scall LoadEmote ; AEA5F (2b:6a5f) -> CD 8B 54
	ld a, $37 ; AEA62 (2b:6a62) -> 3E 37
	scall PlaySFX ; AEA64 (2b:6a64) -> CD 13 62
	scall WaitEmote ; AEA67 (2b:6a67) -> CD EA 54
	scall HideEmote ; AEA6A (2b:6a6a) -> CD A0 54
	ld a, $02 ; AEA6D (2b:6a6d) -> 3E 02
	scall PlayerFace ; AEA6F (2b:6a6f) -> CD 8C 59
	ld l, $04 ; AEA72 (2b:6a72) -> 2E 04
	push hl ; AEA74 (2b:6a74) -> E5
	ld c, $0e ; AEA75 (2b:6a75) -> 0E 0E
	ld e, $07 ; AEA77 (2b:6a77) -> 1E 07
	ld a, $1b ; AEA79 (2b:6a79) -> 3E 1B
	scall Func_80dff ; AEA7B (2b:6a7b) -> CD 14 61
	pop bc ; AEA7E (2b:6a7e) -> C1
label_aea7f:
	ret  ; AEA7F (2b:6a7f) -> C9

Data_aea80:
IF DEF(SUN)
	db $0d, $0c, $01, $01, $1b, $04, $01, $0c, $01, $0b, $2e
	db $01, $11, $01, $01, $1b, $06, $09, $08, $09, $09, $2e, $45, $19, $16, $02, $6c
	db $00, $03, $1a, $15, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00, $00, $03
	db $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $1a, $15
	db $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00, $00, $03, $1a, $15, $8e, $30
	db $33, $7a, $0d, $0e, $13, $13, $04, $00, $00, $03, $1a, $15, $89, $32, $35, $5e
	db $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	db $0d, $0c, $01, $01, $1b, $04, $01, $0c, $01, $0b, $2e
	db $01, $11, $01, $01, $1b, $06, $09, $08, $09, $09, $2e, $45, $19, $16, $02, $6c
	db $00, $03, $1a, $15, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03
	db $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $1a, $15
	db $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00, $00, $03, $1a, $15, $8e, $30
	db $33, $7a, $0d, $0e, $13, $13, $04, $00, $00, $03, $1a, $15, $86, $32, $35, $7f
	db $14, $0d, $1f, $14, $01, $00
ENDC

Func_aeae1:: ; aeae1
IF DEF(SUN)
	db $1e, $02, $21, $80, $6a, $cd, $4f, $53, $1e, $01, $21, $96, $6a, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $05, $21, $9b, $6a, $cd, $39, $60, $3e, $08, $cd
	db $fb, $61, $cd, $31, $53, $21, $19, $03, $cd, $87, $62, $c9, $09, $08, $01, $01
	db $1b, $05, $01, $11, $01, $12, $2e, $01, $08, $01, $01, $1b, $07, $01, $07, $01
	db $06, $2e, $46, $18, $07, $01, $42, $00, $06, $19, $0c, $49, $2c, $2f, $06, $02
	db $02, $02, $06, $0a, $00, $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00
	db $12, $09, $00, $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08
	db $00, $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00, $00
	db $06, $19, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00, $ff, $00, $18
	db $01, $01, $01, $01, $04, $01, $2b, $1d, $6c, $00, $00, $00, $0c, $18, $06, $01
	db $01, $02, $04, $00, $2b, $4d, $6c, $00, $00, $ff, $00, $18, $01, $01, $01, $01
	db $04, $01, $2b, $1d, $6c, $00, $00
ELIF DEF(STAR)
	db $1e, $02, $21, $80, $6a, $cd, $4f, $53, $1e, $01, $21, $96, $6a, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $05, $21, $9b, $6a, $cd, $39, $60, $3e, $08, $cd
	db $fb, $61, $cd, $31, $53, $21, $19, $03, $cd, $87, $62, $c9, $09, $08, $01, $01
	db $1b, $05, $01, $11, $01, $12, $2e, $01, $08, $01, $01, $1b, $07, $01, $07, $01
	db $06, $2e, $46, $18, $07, $01, $42, $00, $06, $19, $0c, $48, $2c, $2f, $7a, $14
	db $0d, $1e, $06, $0a, $00, $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00
	db $12, $09, $00, $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08
	db $00, $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00, $00
	db $06, $19, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00, $ff, $00, $18
	db $01, $01, $01, $01, $04, $01, $2b, $1d, $6c, $00, $00, $00, $0c, $18, $06, $01
	db $01, $02, $04, $00, $2b, $4d, $6c, $00, $00, $ff, $00, $18, $01, $01, $01, $01
	db $04, $01, $2b, $1d, $6c, $00, $00
ENDC

Func_aeb98:: ; aeb98
IF DEF(SUN)
	db $cd, $fc, $6b, $21, $fc, $6b, $cd, $26, $62, $1e, $02, $21, $0d, $6b, $cd, $4f
	db $53, $1e, $01, $21, $23, $6b, $cd, $fc, $5f, $3e, $03, $cd, $16, $60, $1e, $05
	db $21, $28, $6b, $cd, $39, $60, $21, $d4, $00, $cd, $43, $59, $b7, $c2, $d3, $6b
	db $1e, $02, $21, $6e, $6b, $cd, $10, $54, $c3, $db, $6b, $1e, $01, $21, $8a, $6b
	db $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31, $53, $21, $1a, $03, $cd, $87
	db $62, $c9, $00, $00, $01, $01, $18, $03, $00, $00, $01, $01, $18, $04, $00, $00
	db $01, $01, $18, $05, $21, $d4, $00, $cd, $43, $59, $fe, $01, $c2, $1c, $6c, $21
	db $ea, $6b, $cd, $b0, $60, $21, $f0, $6b, $cd, $b0, $60, $21, $f6, $6b, $cd, $b0
	db $60, $cd, $17, $62, $c9, $7b, $fe, $02, $c2, $48, $6c, $af, $cd, $68, $59, $0e
	db $01, $1e, $01, $3e, $1b, $cd, $8b, $54, $3e, $37, $cd, $13, $62, $cd, $ea, $54
	db $cd, $a0, $54, $2e, $08, $e5, $0e, $06, $1e, $08, $3e, $1b, $cd, $14, $61, $c1
	db $c9, $18, $01, $ff, $ff, $7b, $b7, $c2, $f8, $6c, $af, $cd, $8c, $59, $1e, $00
	db $3e, $01, $cd, $aa, $53, $1e, $01, $af, $cd, $33, $61, $1e, $01, $af, $cd, $33
	db $61, $1e, $01, $af, $cd, $33, $61, $1e, $01, $af, $cd, $33, $61, $21, $42, $01
	db $cd, $be, $57, $1e, $01, $3e, $02, $cd, $33, $61, $1e, $01, $3e, $02, $cd, $33
	db $61, $1e, $01, $3e, $02, $cd, $33, $61, $1e, $01, $3e, $02, $cd, $33, $61, $fa
	db $d8, $c2, $c6, $05, $fe, $19, $c2, $b0, $6c, $3e, $03, $cd, $8c, $59, $1e, $01
	db $3e, $01, $cd, $aa, $53, $c3, $bc, $6c, $3e, $01, $cd, $8c, $59, $1e, $03, $3e
	db $01, $cd, $aa, $53, $21, $43, $01, $cd, $be, $57, $cd, $a9, $63, $b7, $c2, $f8
	db $6c, $1e, $01, $21, $d4, $00, $cd, $30, $59, $cd, $fc, $6b, $21, $3c, $00, $cd
	db $a4, $59, $1e, $00, $3e, $01, $cd, $aa, $53, $21, $44, $01, $cd, $be, $57, $01
	db $49, $6c, $1e, $2b, $3e, $01, $cd, $9d, $59, $1e, $00, $3e, $01, $cd, $52, $54
	db $c9, $01, $07, $01, $01, $1b, $06, $01, $08, $01, $09, $2e, $00, $03, $10, $0c
	db $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00, $00, $03, $10, $0c, $44, $2d
	db $30, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $10, $0c, $39, $2e, $31, $1b
	db $0e, $0b, $00, $06, $08, $00, $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e
	db $13, $13, $04, $00, $00, $03, $10, $0c, $89, $32, $35, $5e, $04, $10, $00, $07
	db $01, $00
ELIF DEF(STAR)
	db $cd, $fc, $6b, $21, $fc, $6b, $cd, $26, $62, $1e, $02, $21, $0d, $6b, $cd, $4f
	db $53, $1e, $01, $21, $23, $6b, $cd, $fc, $5f, $3e, $03, $cd, $16, $60, $1e, $05
	db $21, $28, $6b, $cd, $39, $60, $21, $d4, $00, $cd, $43, $59, $b7, $c2, $d3, $6b
	db $1e, $02, $21, $6e, $6b, $cd, $10, $54, $c3, $db, $6b, $1e, $01, $21, $8a, $6b
	db $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31, $53, $21, $1a, $03, $cd, $87
	db $62, $c9, $00, $00, $01, $01, $18, $03, $00, $00, $01, $01, $18, $04, $00, $00
	db $01, $01, $18, $05, $21, $d4, $00, $cd, $43, $59, $fe, $01, $c2, $1c, $6c, $21
	db $ea, $6b, $cd, $b0, $60, $21, $f0, $6b, $cd, $b0, $60, $21, $f6, $6b, $cd, $b0
	db $60, $cd, $17, $62, $c9, $7b, $fe, $02, $c2, $48, $6c, $af, $cd, $68, $59, $0e
	db $01, $1e, $01, $3e, $1b, $cd, $8b, $54, $3e, $37, $cd, $13, $62, $cd, $ea, $54
	db $cd, $a0, $54, $2e, $08, $e5, $0e, $06, $1e, $08, $3e, $1b, $cd, $14, $61, $c1
	db $c9, $18, $01, $ff, $ff, $7b, $b7, $c2, $f8, $6c, $af, $cd, $8c, $59, $1e, $00
	db $3e, $01, $cd, $aa, $53, $1e, $01, $af, $cd, $33, $61, $1e, $01, $af, $cd, $33
	db $61, $1e, $01, $af, $cd, $33, $61, $1e, $01, $af, $cd, $33, $61, $21, $42, $01
	db $cd, $be, $57, $1e, $01, $3e, $02, $cd, $33, $61, $1e, $01, $3e, $02, $cd, $33
	db $61, $1e, $01, $3e, $02, $cd, $33, $61, $1e, $01, $3e, $02, $cd, $33, $61, $fa
	db $d8, $c2, $c6, $05, $fe, $19, $c2, $b0, $6c, $3e, $03, $cd, $8c, $59, $1e, $01
	db $3e, $01, $cd, $aa, $53, $c3, $bc, $6c, $3e, $01, $cd, $8c, $59, $1e, $03, $3e
	db $01, $cd, $aa, $53, $21, $43, $01, $cd, $be, $57, $cd, $a9, $63, $b7, $c2, $f8
	db $6c, $1e, $01, $21, $d4, $00, $cd, $30, $59, $cd, $fc, $6b, $21, $3c, $00, $cd
	db $a4, $59, $1e, $00, $3e, $01, $cd, $aa, $53, $21, $44, $01, $cd, $be, $57, $01
	db $49, $6c, $1e, $2b, $3e, $01, $cd, $9d, $59, $1e, $00, $3e, $01, $cd, $52, $54
	db $c9, $01, $07, $01, $01, $1b, $06, $01, $08, $01, $09, $2e, $00, $03, $10, $0c
	db $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03, $10, $0c, $44, $2d
	db $30, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $10, $0c, $39, $2e, $31, $1b
	db $0e, $0b, $00, $06, $08, $00, $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e
	db $13, $13, $04, $00, $00, $03, $10, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14
	db $01, $00
ENDC

Func_aed4a:: ; aed4a
IF DEF(SUN)
	db $2e, $00, $e5, $0e, $07, $1e, $08, $3e, $06, $cd, $39, $62, $c1, $2e, $01, $e5
	db $0e, $02, $1e, $07, $3e, $02, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e
	db $09, $3e, $05, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $02, $1e, $07, $3e, $0c
	db $cd, $39, $62, $c1, $1e, $01, $21, $f9, $6c, $cd, $4f, $53, $3e, $03, $cd, $16
	db $60, $1e, $05, $21, $04, $6d, $cd, $39, $60, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1b, $03, $cd, $87, $62, $c9, $12, $14, $01, $01, $1b, $09, $12, $04
	db $11, $04, $2e, $47, $0a, $03, $02, $63, $00, $03, $1d, $16, $48, $2d, $30, $7a
	db $14, $0d, $1e, $06, $0a, $00, $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08
	db $00, $12, $09, $00, $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06
	db $08, $00, $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $1d, $16, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	db $2e, $00, $e5, $0e, $07, $1e, $08, $3e, $06, $cd, $39, $62, $c1, $2e, $01, $e5
	db $0e, $02, $1e, $07, $3e, $02, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e
	db $09, $3e, $05, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $02, $1e, $07, $3e, $0c
	db $cd, $39, $62, $c1, $1e, $01, $21, $f9, $6c, $cd, $4f, $53, $3e, $03, $cd, $16
	db $60, $1e, $05, $21, $04, $6d, $cd, $39, $60, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1b, $03, $cd, $87, $62, $c9, $12, $14, $01, $01, $1b, $09, $12, $04
	db $11, $04, $2e, $47, $0a, $03, $02, $63, $00, $03, $1d, $16, $49, $2d, $30, $06
	db $02, $02, $02, $06, $0a, $00, $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08
	db $00, $12, $09, $00, $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06
	db $08, $00, $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $1d, $16, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aedf8:: ; aedf8
IF DEF(SUN)
	db $2e, $00, $e5, $0e, $06, $1e, $07, $3e, $0e, $cd, $39, $62, $c1, $2e, $00, $e5
	db $0e, $06, $1e, $08, $3e, $02, $cd, $39, $62, $c1, $2e, $00, $e5, $0e, $09, $1e
	db $0e, $3e, $08, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $05, $1e, $09, $3e, $01
	db $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $02, $1e, $0d, $3e, $04, $cd, $39, $62
	db $c1, $2e, $01, $e5, $0e, $02, $1e, $07, $3e, $07, $cd, $39, $62, $c1, $2e, $01
	db $e5, $0e, $03, $1e, $0f, $3e, $07, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $06
	db $1e, $06, $3e, $0a, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e, $08, $3e
	db $0d, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e, $0c, $3e, $10, $cd, $39
	db $62, $c1, $2e, $01, $e5, $0e, $08, $1e, $08, $3e, $13, $cd, $39, $62, $c1, $1e
	db $01, $21, $a2, $6d, $cd, $4f, $53, $1e, $01, $21, $ad, $6d, $cd, $fc, $5f, $3e
	db $03, $cd, $16, $60, $1e, $05, $21, $b2, $6d, $cd, $39, $60, $3e, $08, $cd, $fb
	db $61, $cd, $31, $53, $21, $1c, $03, $cd, $87, $62, $c9, $12, $04, $01, $01, $1b
	db $08, $12, $14, $11, $14, $2e, $0a, $04, $01, $01, $1b, $0a, $09, $04, $0a, $04
	db $2e, $05, $04, $01, $01, $1b, $0a, $04, $04, $04, $05, $2e, $4b, $13, $05, $02
	db $56, $00, $03, $14, $14, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00, $00
	db $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $14
	db $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00, $00, $03, $14, $14, $8f
	db $31, $34, $5e, $0f, $0d, $14, $13, $07, $00, $00, $03, $14, $14, $89, $34, $37
	db $5e, $04, $10, $00, $07, $01, $00, $1b, $04, $05, $0d, $01, $01, $02, $04, $00
	db $2b, $83, $70, $00, $00, $1b, $04, $04, $0e, $01, $01, $02, $04, $00, $2b, $a7
	db $70, $00, $00, $1b, $04, $06, $0e, $01, $01, $02, $04, $00, $2b, $cb, $70, $00
	db $00, $1b, $04, $05, $0f, $01, $01, $02, $04, $00, $2b, $ef, $70, $00, $00, $ff
	db $00, $04, $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06
	db $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $04, $0f, $01
	db $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0f, $01, $01, $00
	db $04, $01, $2b, $00, $00, $00, $00, $00, $04, $03, $0a, $01, $01, $01, $04, $00
	db $2b, $b1, $71, $00, $00, $1b, $04, $04, $0d, $01, $01, $02, $04, $00, $2b, $83
	db $70, $00, $00, $1b, $04, $07, $0e, $01, $01, $02, $04, $00, $2b, $a7, $70, $00
	db $00, $1b, $04, $03, $0f, $01, $01, $02, $04, $00, $2b, $cb, $70, $00, $00, $1b
	db $04, $05, $0f, $01, $01, $02, $04, $00, $2b, $ef, $70, $00, $00, $ff, $00, $04
	db $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0d, $01
	db $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $04, $0f, $01, $01, $00
	db $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0f, $01, $01, $00, $04, $01
	db $2b, $00, $00, $00, $00, $00, $04, $03, $0a, $01, $01, $01, $04, $00, $2b, $b1
	db $71, $00, $00
ELIF DEF(STAR)
	db $2e, $00, $e5, $0e, $06, $1e, $07, $3e, $0e, $cd, $39, $62, $c1, $2e, $00, $e5
	db $0e, $06, $1e, $08, $3e, $02, $cd, $39, $62, $c1, $2e, $00, $e5, $0e, $09, $1e
	db $0e, $3e, $08, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $05, $1e, $09, $3e, $01
	db $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $02, $1e, $0d, $3e, $04, $cd, $39, $62
	db $c1, $2e, $01, $e5, $0e, $02, $1e, $07, $3e, $07, $cd, $39, $62, $c1, $2e, $01
	db $e5, $0e, $03, $1e, $0f, $3e, $07, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $06
	db $1e, $06, $3e, $0a, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e, $08, $3e
	db $0d, $cd, $39, $62, $c1, $2e, $01, $e5, $0e, $03, $1e, $0c, $3e, $10, $cd, $39
	db $62, $c1, $2e, $01, $e5, $0e, $08, $1e, $08, $3e, $13, $cd, $39, $62, $c1, $1e
	db $01, $21, $a2, $6d, $cd, $4f, $53, $1e, $01, $21, $ad, $6d, $cd, $fc, $5f, $3e
	db $03, $cd, $16, $60, $1e, $05, $21, $b2, $6d, $cd, $39, $60, $3e, $08, $cd, $fb
	db $61, $cd, $31, $53, $21, $1c, $03, $cd, $87, $62, $c9, $12, $04, $01, $01, $1b
	db $08, $12, $14, $11, $14, $2e, $0a, $04, $01, $01, $1b, $0a, $09, $04, $0a, $04
	db $2e, $05, $04, $01, $01, $1b, $0a, $04, $04, $04, $05, $2e, $4b, $13, $05, $02
	db $56, $00, $03, $14, $14, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00, $00
	db $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00, $00, $03, $14
	db $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00, $00, $03, $14, $14, $8f
	db $31, $34, $5e, $0f, $0d, $14, $13, $07, $00, $00, $03, $14, $14, $86, $34, $37
	db $77, $14, $0d, $1f, $14, $01, $00, $1b, $04, $05, $0d, $01, $01, $02, $04, $00
	db $2b, $83, $70, $00, $00, $1b, $04, $04, $0e, $01, $01, $02, $04, $00, $2b, $a7
	db $70, $00, $00, $1b, $04, $06, $0e, $01, $01, $02, $04, $00, $2b, $cb, $70, $00
	db $00, $1b, $04, $05, $0f, $01, $01, $02, $04, $00, $2b, $ef, $70, $00, $00, $ff
	db $00, $04, $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06
	db $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $04, $0f, $01
	db $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0f, $01, $01, $00
	db $04, $01, $2b, $00, $00, $00, $00, $00, $04, $03, $0a, $01, $01, $01, $04, $00
	db $2b, $b1, $71, $00, $00, $1b, $04, $04, $0d, $01, $01, $02, $04, $00, $2b, $83
	db $70, $00, $00, $1b, $04, $07, $0e, $01, $01, $02, $04, $00, $2b, $a7, $70, $00
	db $00, $1b, $04, $03, $0f, $01, $01, $02, $04, $00, $2b, $cb, $70, $00, $00, $1b
	db $04, $05, $0f, $01, $01, $02, $04, $00, $2b, $ef, $70, $00, $00, $ff, $00, $04
	db $0d, $01, $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0d, $01
	db $01, $00, $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $04, $0f, $01, $01, $00
	db $04, $01, $2b, $00, $00, $00, $00, $ff, $00, $06, $0f, $01, $01, $00, $04, $01
	db $2b, $00, $00, $00, $00, $00, $04, $03, $0a, $01, $01, $01, $04, $00, $2b, $b1
	db $71, $00, $00
ENDC

Func_af01b:: ; af01b
IF DEF(SUN)
	db $1e, $03, $21, $b3, $6e, $cd, $4f, $53, $1e, $01, $21, $d4, $6e, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $05, $21, $d9, $6e, $cd, $39, $60, $21, $4e, $00
	db $cd, $43, $59, $b7, $c2, $57, $70, $21, $4d, $00, $cd, $43, $59, $b7, $c2, $57
	db $70, $1e, $09, $21, $1f, $6f, $cd, $10, $54, $c3, $74, $70, $21, $4e, $00, $cd
	db $43, $59, $b7, $c2, $74, $70, $21, $4d, $00, $cd, $43, $59, $fe, $01, $c2, $74
	db $70, $1e, $09, $21, $9d, $6f, $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1d, $03, $cd, $87, $62, $c9, $f5, $7b, $fe, $03, $ca, $a2, $70, $fe
	db $01, $c2, $a5, $70, $f8, $01, $7e, $cd, $f3, $5e, $fe, $01, $c2, $9f, $70, $3e
	db $01, $ea, $c4, $c7, $c3, $a5, $70, $cd, $13, $71, $c1, $c9, $f5, $7b, $fe, $03
	db $ca, $c6, $70, $fe, $01, $c2, $c9, $70, $f8, $01, $7e, $cd, $f3, $5e, $fe, $01
	db $c2, $c3, $70, $3e, $01, $ea, $c4, $c7, $c3, $c9, $70, $cd, $13, $71, $c1, $c9
	db $f5, $7b, $fe, $03, $ca, $ea, $70, $fe, $01, $c2, $ed, $70, $f8, $01, $7e, $cd
	db $f3, $5e, $fe, $01, $c2, $e7, $70, $3e, $01, $ea, $c4, $c7, $c3, $ed, $70, $cd
	db $13, $71, $c1, $c9, $f5, $7b, $fe, $03, $ca, $0e, $71, $fe, $01, $c2, $11, $71
	db $f8, $01, $7e, $cd, $f3, $5e, $fe, $01, $c2, $0b, $71, $3e, $01, $ea, $c4, $c7
	db $c3, $11, $71, $cd, $13, $71, $c1, $c9, $c5, $f8, $01, $36, $04, $f8, $01, $7e
	db $fe, $08, $d2, $5c, $71, $f8, $00, $36, $00, $f8, $00, $7e, $fe, $04, $d2, $52
	db $71, $f8, $01, $5e, $f8, $00, $7e, $cd, $fe, $53, $fe, $01, $c2, $3d, $71, $c3
	db $52, $71, $f8, $00, $7e, $fe, $03, $c2, $48, $71, $c3, $5f, $71, $f8, $00, $7e
	db $3c, $f8, $00, $77, $c3, $24, $71, $f8, $01, $7e, $3c, $f8, $01, $77, $c3, $18
	db $71, $cd, $61, $71, $c1, $c9, $1e, $01, $21, $4e, $00, $cd, $30, $59, $3e, $2b
	db $cd, $13, $62, $1e, $00, $af, $cd, $52, $54, $21, $1e, $00, $cd, $a4, $59, $3e
	db $2b, $cd, $13, $62, $1e, $00, $3e, $01, $cd, $52, $54, $21, $1e, $00, $cd, $a4
	db $59, $3e, $2b, $cd, $13, $62, $1e, $00, $3e, $02, $cd, $52, $54, $21, $1e, $00
	db $cd, $a4, $59, $3e, $2b, $cd, $13, $62, $1e, $00, $3e, $03, $cd, $52, $54, $21
	db $1e, $00, $cd, $a4, $59, $c9, $f5, $7b, $b7, $c2, $23, $72, $f8, $01, $7e, $cd
	db $60, $57, $21, $4d, $00, $cd, $43, $59, $b7, $c2, $1d, $72, $21, $4e, $00, $cd
	db $43, $59, $b7, $c2, $1d, $72, $21, $3b, $01, $cd, $be, $57, $3e, $24, $cd, $72
	db $61, $fe, $01, $c2, $14, $72, $21, $3c, $01, $cd, $be, $57, $21, $3d, $01, $cd
	db $df, $57, $b7, $c2, $0b, $72, $0e, $01, $1e, $01, $3e, $24, $cd, $62, $60, $1e
	db $01, $21, $4d, $00, $cd, $30, $59, $21, $3e, $01, $cd, $be, $57, $c3, $11, $72
	db $21, $3f, $01, $cd, $be, $57, $c3, $1a, $72, $21, $3c, $01, $cd, $be, $57, $c3
	db $23, $72, $21, $41, $01, $cd, $be, $57, $c1, $c9, $09, $04, $01, $01, $1b, $09
	db $0a, $04, $0b, $04, $2e, $04, $04, $01, $01, $1b, $09, $05, $04, $05, $05, $2e
	db $04, $0e, $01, $01, $1b, $0b, $04, $15, $04, $14, $2e, $00, $03, $12, $1c, $48
	db $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03, $12, $1c, $44, $2e, $31
	db $7a, $14, $08, $00, $12, $09, $00, $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e
	db $0b, $00, $06, $08, $00, $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14
	db $13, $07, $00, $00, $03, $12, $1c, $89, $34, $37, $5e, $04, $10, $00, $07, $01
	db $00, $00, $0c, $04, $12, $01, $01, $00, $04, $00, $2b, $4c, $73, $00, $00
ELIF DEF(STAR)
	db $1e, $03, $21, $b3, $6e, $cd, $4f, $53, $1e, $01, $21, $d4, $6e, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $05, $21, $d9, $6e, $cd, $39, $60, $21, $4e, $00
	db $cd, $43, $59, $b7, $c2, $57, $70, $21, $4d, $00, $cd, $43, $59, $b7, $c2, $57
	db $70, $1e, $09, $21, $1f, $6f, $cd, $10, $54, $c3, $74, $70, $21, $4e, $00, $cd
	db $43, $59, $b7, $c2, $74, $70, $21, $4d, $00, $cd, $43, $59, $fe, $01, $c2, $74
	db $70, $1e, $09, $21, $9d, $6f, $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1d, $03, $cd, $87, $62, $c9, $f5, $7b, $fe, $03, $ca, $a2, $70, $fe
	db $01, $c2, $a5, $70, $f8, $01, $7e, $cd, $f3, $5e, $fe, $01, $c2, $9f, $70, $3e
	db $01, $ea, $c4, $c7, $c3, $a5, $70, $cd, $13, $71, $c1, $c9, $f5, $7b, $fe, $03
	db $ca, $c6, $70, $fe, $01, $c2, $c9, $70, $f8, $01, $7e, $cd, $f3, $5e, $fe, $01
	db $c2, $c3, $70, $3e, $01, $ea, $c4, $c7, $c3, $c9, $70, $cd, $13, $71, $c1, $c9
	db $f5, $7b, $fe, $03, $ca, $ea, $70, $fe, $01, $c2, $ed, $70, $f8, $01, $7e, $cd
	db $f3, $5e, $fe, $01, $c2, $e7, $70, $3e, $01, $ea, $c4, $c7, $c3, $ed, $70, $cd
	db $13, $71, $c1, $c9, $f5, $7b, $fe, $03, $ca, $0e, $71, $fe, $01, $c2, $11, $71
	db $f8, $01, $7e, $cd, $f3, $5e, $fe, $01, $c2, $0b, $71, $3e, $01, $ea, $c4, $c7
	db $c3, $11, $71, $cd, $13, $71, $c1, $c9, $c5, $f8, $01, $36, $04, $f8, $01, $7e
	db $fe, $08, $d2, $5c, $71, $f8, $00, $36, $00, $f8, $00, $7e, $fe, $04, $d2, $52
	db $71, $f8, $01, $5e, $f8, $00, $7e, $cd, $fe, $53, $fe, $01, $c2, $3d, $71, $c3
	db $52, $71, $f8, $00, $7e, $fe, $03, $c2, $48, $71, $c3, $5f, $71, $f8, $00, $7e
	db $3c, $f8, $00, $77, $c3, $24, $71, $f8, $01, $7e, $3c, $f8, $01, $77, $c3, $18
	db $71, $cd, $61, $71, $c1, $c9, $1e, $01, $21, $4e, $00, $cd, $30, $59, $3e, $2b
	db $cd, $13, $62, $1e, $00, $af, $cd, $52, $54, $21, $1e, $00, $cd, $a4, $59, $3e
	db $2b, $cd, $13, $62, $1e, $00, $3e, $01, $cd, $52, $54, $21, $1e, $00, $cd, $a4
	db $59, $3e, $2b, $cd, $13, $62, $1e, $00, $3e, $02, $cd, $52, $54, $21, $1e, $00
	db $cd, $a4, $59, $3e, $2b, $cd, $13, $62, $1e, $00, $3e, $03, $cd, $52, $54, $21
	db $1e, $00, $cd, $a4, $59, $c9, $f5, $7b, $b7, $c2, $23, $72, $f8, $01, $7e, $cd
	db $60, $57, $21, $4d, $00, $cd, $43, $59, $b7, $c2, $1d, $72, $21, $4e, $00, $cd
	db $43, $59, $b7, $c2, $1d, $72, $21, $3b, $01, $cd, $be, $57, $3e, $24, $cd, $72
	db $61, $fe, $01, $c2, $14, $72, $21, $3c, $01, $cd, $be, $57, $21, $3d, $01, $cd
	db $df, $57, $b7, $c2, $0b, $72, $0e, $01, $1e, $01, $3e, $24, $cd, $62, $60, $1e
	db $01, $21, $4d, $00, $cd, $30, $59, $21, $3e, $01, $cd, $be, $57, $c3, $11, $72
	db $21, $3f, $01, $cd, $be, $57, $c3, $1a, $72, $21, $3c, $01, $cd, $be, $57, $c3
	db $23, $72, $21, $41, $01, $cd, $be, $57, $c1, $c9, $09, $04, $01, $01, $1b, $09
	db $0a, $04, $0b, $04, $2e, $04, $04, $01, $01, $1b, $09, $05, $04, $05, $05, $2e
	db $04, $0e, $01, $01, $1b, $0b, $04, $15, $04, $14, $2e, $00, $03, $12, $1c, $49
	db $2d, $30, $06, $02, $02, $02, $06, $0a, $00, $00, $03, $12, $1c, $44, $2e, $31
	db $7a, $14, $08, $00, $12, $09, $00, $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e
	db $0b, $00, $06, $08, $00, $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14
	db $13, $07, $00, $00, $03, $12, $1c, $86, $34, $37, $77, $14, $0d, $1f, $14, $01
	db $00, $00, $0c, $04, $12, $01, $01, $00, $04, $00, $2b, $4c, $73, $00, $00
ENDC

Func_af29a:: ; af29a
IF DEF(SUN)
	db $cd, $09, $73, $21, $09, $73, $cd, $26, $62, $1e, $03, $21, $25, $72, $cd, $4f
	db $53, $3e, $03, $cd, $16, $60, $1e, $05, $21, $46, $72, $cd, $39, $60, $21, $4f
	db $00, $cd, $43, $59, $b7, $c2, $ca, $72, $1e, $01, $21, $8c, $72, $cd, $10, $54
	db $3e, $08, $cd, $fb, $61, $cd, $31, $53, $21, $1e, $03, $cd, $87, $62, $c9, $12
	db $1d, $01, $01, $03, $0d, $12, $1d, $01, $01, $05, $0d, $12, $1d, $01, $01, $03
	db $0f, $12, $1d, $01, $01, $05, $0f, $11, $1d, $01, $01, $03, $10, $11, $1d, $01
	db $01, $05, $10, $12, $1e, $01, $01, $04, $10, $12, $1e, $01, $01, $04, $11, $21
	db $4e, $00, $cd, $43, $59, $fe, $01, $c2, $47, $73, $21, $d9, $72, $cd, $b0, $60
	db $21, $df, $72, $cd, $b0, $60, $21, $e5, $72, $cd, $b0, $60, $21, $eb, $72, $cd
	db $b0, $60, $21, $f1, $72, $cd, $b0, $60, $21, $f7, $72, $cd, $b0, $60, $21, $fd
	db $72, $cd, $b0, $60, $21, $03, $73, $cd, $b0, $60, $cd, $17, $62, $c9, $04, $0e
	db $ff, $ff, $7b, $b7, $c2, $84, $73, $21, $4e, $00, $cd, $43, $59, $b7, $c2, $64
	db $73, $21, $45, $01, $cd, $be, $57, $c3, $84, $73, $21, $46, $01, $cd, $be, $57
	db $1e, $01, $21, $4f, $00, $cd, $30, $59, $01, $48, $73, $1e, $2b, $af, $cd, $9d
	db $59, $cd, $21, $55, $1e, $00, $af, $cd, $52, $54, $c9, $04, $15, $01, $01, $1b
	db $0a, $04, $0e, $04, $0f, $2e, $00, $04, $07, $01, $15, $00, $03, $09, $17, $48
	db $30, $33, $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03, $09, $17, $49, $30, $33
	db $06, $02, $02, $02, $06, $0a, $00, $00, $03, $09, $17, $89, $35, $38, $5e, $04
	db $10, $00, $07, $01, $00, $ff, $00, $03, $0b, $03, $01, $00, $04, $01, $2b, $6a
	db $74, $00, $00, $00, $04, $04, $08, $01, $01, $02, $04, $00, $2b, $c3, $74, $00
	db $00, $00, $04, $04, $08, $01, $01, $02, $04, $00, $2b, $c3, $74, $00, $00
ELIF DEF(STAR)
	db $cd, $09, $73, $21, $09, $73, $cd, $26, $62, $1e, $03, $21, $25, $72, $cd, $4f
	db $53, $3e, $03, $cd, $16, $60, $1e, $05, $21, $46, $72, $cd, $39, $60, $21, $4f
	db $00, $cd, $43, $59, $b7, $c2, $ca, $72, $1e, $01, $21, $8c, $72, $cd, $10, $54
	db $3e, $08, $cd, $fb, $61, $cd, $31, $53, $21, $1e, $03, $cd, $87, $62, $c9, $12
	db $1d, $01, $01, $03, $0d, $12, $1d, $01, $01, $05, $0d, $12, $1d, $01, $01, $03
	db $0f, $12, $1d, $01, $01, $05, $0f, $11, $1d, $01, $01, $03, $10, $11, $1d, $01
	db $01, $05, $10, $12, $1e, $01, $01, $04, $10, $12, $1e, $01, $01, $04, $11, $21
	db $4e, $00, $cd, $43, $59, $fe, $01, $c2, $47, $73, $21, $d9, $72, $cd, $b0, $60
	db $21, $df, $72, $cd, $b0, $60, $21, $e5, $72, $cd, $b0, $60, $21, $eb, $72, $cd
	db $b0, $60, $21, $f1, $72, $cd, $b0, $60, $21, $f7, $72, $cd, $b0, $60, $21, $fd
	db $72, $cd, $b0, $60, $21, $03, $73, $cd, $b0, $60, $cd, $17, $62, $c9, $04, $0e
	db $ff, $ff, $7b, $b7, $c2, $84, $73, $21, $4e, $00, $cd, $43, $59, $b7, $c2, $64
	db $73, $21, $45, $01, $cd, $be, $57, $c3, $84, $73, $21, $46, $01, $cd, $be, $57
	db $1e, $01, $21, $4f, $00, $cd, $30, $59, $01, $48, $73, $1e, $2b, $af, $cd, $9d
	db $59, $cd, $21, $55, $1e, $00, $af, $cd, $52, $54, $c9, $04, $15, $01, $01, $1b
	db $0a, $04, $0e, $04, $0f, $2e, $00, $04, $07, $01, $15, $00, $03, $09, $17, $49
	db $30, $33, $06, $02, $02, $02, $06, $0a, $00, $00, $03, $09, $17, $48, $30, $33
	db $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03, $09, $17, $86, $35, $38, $77, $14
	db $0d, $1f, $14, $01, $00, $ff, $00, $03, $0b, $03, $01, $00, $04, $01, $2b, $6a
	db $74, $00, $00, $00, $04, $04, $08, $01, $01, $02, $04, $00, $2b, $c3, $74, $00
	db $00, $00, $04, $04, $08, $01, $01, $02, $04, $00, $2b, $c3, $74, $00, $00
ENDC

Func_af3e9:: ; af3e9
IF DEF(SUN)
	db $1e, $01, $21, $85, $73, $cd, $4f, $53, $1e, $01, $21, $90, $73, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $03, $21, $95, $73, $cd, $39, $60, $21, $50, $00
	db $cd, $43, $59, $b7, $c2, $1b, $74, $1e, $02, $21, $bf, $73, $cd, $10, $54, $c3
	db $32, $74, $1e, $02, $21, $bf, $73, $cd, $10, $54, $1e, $00, $3e, $01, $cd, $52
	db $54, $1e, $01, $21, $db, $73, $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1f, $03, $cd, $87, $62, $c9, $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $a9, $07, $41, $1d, $1d, $1d, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09, $7b, $fe, $02, $c2, $bd, $74, $21, $50, $00, $cd, $43, $59, $b7, $c2, $a1
	db $74, $21, $47, $01, $cd, $be, $57, $11, $be, $74, $21, $41, $74, $cd, $e8, $60
	db $b7, $c2, $90, $74, $c3, $bd, $74, $1e, $01, $21, $50, $00, $cd, $30, $59, $21
	db $48, $01, $cd, $be, $57, $c3, $bd, $74, $21, $49, $01, $cd, $df, $57, $b7, $c2
	db $bd, $74, $3e, $5a, $cd, $13, $62, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b
	db $cd, $14, $61, $c1, $c9, $ca, $dd, $c0, $b0, $00, $f5, $7b, $b7, $c2, $37, $75
	db $f8, $01, $7e, $cd, $60, $57, $21, $48, $00, $cd, $43, $59, $b7, $c2, $05, $75
	db $3e, $15, $cd, $72, $61, $b7, $ca, $fc, $74, $21, $49, $01, $cd, $df, $57, $b7
	db $c2, $f9, $74, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b, $cd, $14, $61, $c1
	db $c3, $02, $75, $21, $48, $01, $cd, $be, $57, $c3, $37, $75, $21, $00, $01, $cd
	db $43, $59, $b7, $c2, $20, $75, $21, $3a, $03, $cd, $be, $57, $1e, $01, $21, $00
	db $01, $cd, $30, $59, $c3, $37, $75, $21, $49, $01, $cd, $df, $57, $b7, $c2, $37
	db $75, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b, $cd, $14, $61, $c1, $c1, $c9
ELIF DEF(STAR)
	db $1e, $01, $21, $85, $73, $cd, $4f, $53, $1e, $01, $21, $90, $73, $cd, $fc, $5f
	db $3e, $03, $cd, $16, $60, $1e, $03, $21, $95, $73, $cd, $39, $60, $21, $50, $00
	db $cd, $43, $59, $b7, $c2, $1b, $74, $1e, $02, $21, $bf, $73, $cd, $10, $54, $c3
	db $32, $74, $1e, $02, $21, $bf, $73, $cd, $10, $54, $1e, $00, $3e, $01, $cd, $52
	db $54, $1e, $01, $21, $db, $73, $cd, $10, $54, $3e, $08, $cd, $fb, $61, $cd, $31
	db $53, $21, $1f, $03, $cd, $87, $62, $c9, $00, $00, $00, $01, $32, $c5, $b0, $00
	db $00, $30, $01, $aa, $07, $41, $1a, $1a, $1a, $06, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $09, $7b, $fe, $02, $c2, $bd, $74, $21, $50, $00, $cd, $43, $59, $b7, $c2, $a1
	db $74, $21, $47, $01, $cd, $be, $57, $11, $be, $74, $21, $41, $74, $cd, $e8, $60
	db $b7, $c2, $90, $74, $c3, $bd, $74, $1e, $01, $21, $50, $00, $cd, $30, $59, $21
	db $48, $01, $cd, $be, $57, $c3, $bd, $74, $21, $49, $01, $cd, $df, $57, $b7, $c2
	db $bd, $74, $3e, $5a, $cd, $13, $62, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b
	db $cd, $14, $61, $c1, $c9, $ca, $dd, $c0, $b0, $00, $f5, $7b, $b7, $c2, $37, $75
	db $f8, $01, $7e, $cd, $60, $57, $21, $48, $00, $cd, $43, $59, $b7, $c2, $05, $75
	db $3e, $15, $cd, $72, $61, $b7, $ca, $fc, $74, $21, $49, $01, $cd, $df, $57, $b7
	db $c2, $f9, $74, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b, $cd, $14, $61, $c1
	db $c3, $02, $75, $21, $48, $01, $cd, $be, $57, $c3, $37, $75, $21, $00, $01, $cd
	db $43, $59, $b7, $c2, $20, $75, $21, $3a, $03, $cd, $be, $57, $1e, $01, $21, $00
	db $01, $cd, $30, $59, $c3, $37, $75, $21, $49, $01, $cd, $df, $57, $b7, $c2, $37
	db $75, $2e, $1b, $e5, $0e, $12, $1e, $01, $3e, $1b, $cd, $14, $61, $c1, $c1, $c9
ENDC


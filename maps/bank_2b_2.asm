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
	jp nz, .asm_ae720 ; AE6FE (2b:66fe) -> C2 20 67
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
	jp .asm_ae73b ; AE71D (2b:671d) -> C3 3B 67
.asm_ae720:
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
.asm_ae73b:
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
	warpdef $09, $04, $01, $01, MAP_27_03, $11, $04, $11, $05, $2e
	warpdef $16, $04, $01, $01, MAP_27_03, $1e, $04, $1e, $05, $2e
	warpdef $01, $0c, $01, $01, MAP_27_05, $0d, $0c, $0d, $0b, $2e

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
	jp nz, .asm_aea7f ; AEA52 (2b:6a52) -> C2 7F 6A
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
.asm_aea7f:
	ret  ; AEA7F (2b:6a7f) -> C9

Data_aea80:
	warpdef $0d, $0c, $01, $01, MAP_27_04, $01, $0c, $01, $0b, $2e
	warpdef $01, $11, $01, $01, MAP_27_06, $09, $08, $09, $09, $2e

Data_aea96:
	db $45, $19, $16, $02, $6c

Data_aea9b:
IF DEF(SUN)
	wildbot $00, $03, $1a, $15, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1a, $15, $48, $2b, $2e, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1a, $15, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1a, $15, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1a, $15, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $1a, $15, $86, $32, $35, $7f, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aeae1:: ; aeae1
	ld e, $02 ; AEAE1 (2b:6ae1) -> 1E 02
	ld hl, Data_aea80 ; AEAE3 (2b:6ae3) -> 21 80 6A
	scall LoadWarps ; AEAE6 (2b:6ae6) -> CD 4F 53
	ld e, $01 ; AEAE9 (2b:6ae9) -> 1E 01
	ld hl, Data_aea96 ; AEAEB (2b:6aeb) -> 21 96 6A
	scall Func_80ce7 ; AEAEE (2b:6aee) -> CD FC 5F
	ld a, $03 ; AEAF1 (2b:6af1) -> 3E 03
	scall Func_80d01 ; AEAF3 (2b:6af3) -> CD 16 60
	ld e, $05 ; AEAF6 (2b:6af6) -> 1E 05
	ld hl, Data_aea9b ; AEAF8 (2b:6af8) -> 21 9B 6A
	scall LoadEncounters ; AEAFB (2b:6afb) -> CD 39 60
	ld a, $08 ; AEAFE (2b:6afe) -> 3E 08
	scall PlayMusic ; AEB00 (2b:6b00) -> CD FB 61
	scall Func_8001c ; AEB03 (2b:6b03) -> CD 31 53
	ld hl, $0319 ; AEB06 (2b:6b06) -> 21 19 03
	scall LandmarkSign ; AEB09 (2b:6b09) -> CD 87 62
	ret  ; AEB0C (2b:6b0c) -> C9

Data_aeb0d:
	warpdef $09, $08, $01, $01, MAP_27_05, $01, $11, $01, $12, $2e
	warpdef $01, $08, $01, $01, MAP_27_07, $01, $07, $01, $06, $2e

Data_aeb23:
	db $46, $18, $07, $01, $42

Data_aeb28:
IF DEF(SUN)
	wildbot $00, $06, $19, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $06, $19, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $06, $19, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $06, $19, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $06, $19, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $06, $19, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aeb6e:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL
	person_event $00, $0c, $18, $06, $01, $01, $02, $04, $00, Func_aec4d, NULL

Data_aeb8a:
	person_event $ff, $00, $18, $01, $01, $01, $01, $04, $01, Func_aec1d, NULL

Func_aeb98:: ; aeb98
	call Func_aebfc ; AEB98 (2b:6b98) -> CD FC 6B
	ld hl, Func_aebfc ; AEB9B (2b:6b9b) -> 21 FC 6B
	scall Func_80f11 ; AEB9E (2b:6b9e) -> CD 26 62
	ld e, $02 ; AEBA1 (2b:6ba1) -> 1E 02
	ld hl, Data_aeb0d ; AEBA3 (2b:6ba3) -> 21 0D 6B
	scall LoadWarps ; AEBA6 (2b:6ba6) -> CD 4F 53
	ld e, $01 ; AEBA9 (2b:6ba9) -> 1E 01
	ld hl, Data_aeb23 ; AEBAB (2b:6bab) -> 21 23 6B
	scall Func_80ce7 ; AEBAE (2b:6bae) -> CD FC 5F
	ld a, $03 ; AEBB1 (2b:6bb1) -> 3E 03
	scall Func_80d01 ; AEBB3 (2b:6bb3) -> CD 16 60
	ld e, $05 ; AEBB6 (2b:6bb6) -> 1E 05
	ld hl, Data_aeb28 ; AEBB8 (2b:6bb8) -> 21 28 6B
	scall LoadEncounters ; AEBBB (2b:6bbb) -> CD 39 60
	ld hl, $00d4 ; AEBBE (2b:6bbe) -> 21 D4 00
	scall CheckEventFlag ; AEBC1 (2b:6bc1) -> CD 43 59
	or a ; AEBC4 (2b:6bc4) -> B7
	jp nz, .asm_aebd3 ; AEBC5 (2b:6bc5) -> C2 D3 6B
	ld e, $02 ; AEBC8 (2b:6bc8) -> 1E 02
	ld hl, Data_aeb6e ; AEBCA (2b:6bca) -> 21 6E 6B
	scall LoadMapObjects ; AEBCD (2b:6bcd) -> CD 10 54
	jp .asm_aebdb ; AEBD0 (2b:6bd0) -> C3 DB 6B
.asm_aebd3:
	ld e, $01 ; AEBD3 (2b:6bd3) -> 1E 01
	ld hl, Data_aeb8a ; AEBD5 (2b:6bd5) -> 21 8A 6B
	scall LoadMapObjects ; AEBD8 (2b:6bd8) -> CD 10 54
.asm_aebdb:
	ld a, $08 ; AEBDB (2b:6bdb) -> 3E 08
	scall PlayMusic ; AEBDD (2b:6bdd) -> CD FB 61
	scall Func_8001c ; AEBE0 (2b:6be0) -> CD 31 53
	ld hl, $031a ; AEBE3 (2b:6be3) -> 21 1A 03
	scall LandmarkSign ; AEBE6 (2b:6be6) -> CD 87 62
	ret  ; AEBE9 (2b:6be9) -> C9

Data_aebea:
	db $00, $00, $01, $01, $18, $03

Data_aebf0:
	db $00, $00, $01, $01, $18, $04

Data_aebf6:
	db $00, $00, $01, $01, $18, $05

Func_aebfc:
	ld hl, $00d4 ; AEBFC (2b:6bfc) -> 21 D4 00
	scall CheckEventFlag ; AEBFF (2b:6bff) -> CD 43 59
	cp $01 ; AEC02 (2b:6c02) -> FE 01
	jp nz, .asm_aec1c ; AEC04 (2b:6c04) -> C2 1C 6C
	ld hl, Data_aebea ; AEC07 (2b:6c07) -> 21 EA 6B
	scall Func_80d9b ; AEC0A (2b:6c0a) -> CD B0 60
	ld hl, Data_aebf0 ; AEC0D (2b:6c0d) -> 21 F0 6B
	scall Func_80d9b ; AEC10 (2b:6c10) -> CD B0 60
	ld hl, Data_aebf6 ; AEC13 (2b:6c13) -> 21 F6 6B
	scall Func_80d9b ; AEC16 (2b:6c16) -> CD B0 60
	scall Func_80f02 ; AEC19 (2b:6c19) -> CD 17 62
.asm_aec1c:
	ret  ; AEC1C (2b:6c1c) -> C9

Func_aec1d:
	ld a, e ; AEC1D (2b:6c1d) -> 7B
	cp $02 ; AEC1E (2b:6c1e) -> FE 02
	jp nz, .asm_aec48 ; AEC20 (2b:6c20) -> C2 48 6C
	xor a ; AEC23 (2b:6c23) -> AF
	scall Func_80653 ; AEC24 (2b:6c24) -> CD 68 59
	ld c, $01 ; AEC27 (2b:6c27) -> 0E 01
	ld e, $01 ; AEC29 (2b:6c29) -> 1E 01
	ld a, $1b ; AEC2B (2b:6c2b) -> 3E 1B
	scall LoadEmote ; AEC2D (2b:6c2d) -> CD 8B 54
	ld a, $37 ; AEC30 (2b:6c30) -> 3E 37
	scall PlaySFX ; AEC32 (2b:6c32) -> CD 13 62
	scall WaitEmote ; AEC35 (2b:6c35) -> CD EA 54
	scall HideEmote ; AEC38 (2b:6c38) -> CD A0 54
	ld l, $08 ; AEC3B (2b:6c3b) -> 2E 08
	push hl ; AEC3D (2b:6c3d) -> E5
	ld c, $06 ; AEC3E (2b:6c3e) -> 0E 06
	ld e, $08 ; AEC40 (2b:6c40) -> 1E 08
	ld a, $1b ; AEC42 (2b:6c42) -> 3E 1B
	scall Func_80dff ; AEC44 (2b:6c44) -> CD 14 61
	pop bc ; AEC47 (2b:6c47) -> C1
.asm_aec48:
	ret  ; AEC48 (2b:6c48) -> C9

Data_aec49:
	db $18, $01, $ff, $ff

Func_aec4d:
	ld a, e ; AEC4D (2b:6c4d) -> 7B
	or a ; AEC4E (2b:6c4e) -> B7
	jp nz, .asm_aecf8 ; AEC4F (2b:6c4f) -> C2 F8 6C
	xor a ; AEC52 (2b:6c52) -> AF
	scall PlayerFace ; AEC53 (2b:6c53) -> CD 8C 59
	ld e, $00 ; AEC56 (2b:6c56) -> 1E 00
	ld a, $01 ; AEC58 (2b:6c58) -> 3E 01
	scall SpriteFace ; AEC5A (2b:6c5a) -> CD AA 53
	ld e, $01 ; AEC5D (2b:6c5d) -> 1E 01
	xor a ; AEC5F (2b:6c5f) -> AF
	scall PlayerStep ; AEC60 (2b:6c60) -> CD 33 61
	ld e, $01 ; AEC63 (2b:6c63) -> 1E 01
	xor a ; AEC65 (2b:6c65) -> AF
	scall PlayerStep ; AEC66 (2b:6c66) -> CD 33 61
	ld e, $01 ; AEC69 (2b:6c69) -> 1E 01
	xor a ; AEC6B (2b:6c6b) -> AF
	scall PlayerStep ; AEC6C (2b:6c6c) -> CD 33 61
	ld e, $01 ; AEC6F (2b:6c6f) -> 1E 01
	xor a ; AEC71 (2b:6c71) -> AF
	scall PlayerStep ; AEC72 (2b:6c72) -> CD 33 61
	ld hl, $0142 ; AEC75 (2b:6c75) -> 21 42 01
	scall PrintTextWithNPCName ; AEC78 (2b:6c78) -> CD BE 57
	ld e, $01 ; AEC7B (2b:6c7b) -> 1E 01
	ld a, $02 ; AEC7D (2b:6c7d) -> 3E 02
	scall PlayerStep ; AEC7F (2b:6c7f) -> CD 33 61
	ld e, $01 ; AEC82 (2b:6c82) -> 1E 01
	ld a, $02 ; AEC84 (2b:6c84) -> 3E 02
	scall PlayerStep ; AEC86 (2b:6c86) -> CD 33 61
	ld e, $01 ; AEC89 (2b:6c89) -> 1E 01
	ld a, $02 ; AEC8B (2b:6c8b) -> 3E 02
	scall PlayerStep ; AEC8D (2b:6c8d) -> CD 33 61
	ld e, $01 ; AEC90 (2b:6c90) -> 1E 01
	ld a, $02 ; AEC92 (2b:6c92) -> 3E 02
	scall PlayerStep ; AEC94 (2b:6c94) -> CD 33 61
	ld a, [wMapX] ; AEC97 (2b:6c97) -> FA D8 C2
	add a, $05 ; AEC9A (2b:6c9a) -> C6 05
	cp $19 ; AEC9C (2b:6c9c) -> FE 19
	jp nz, .asm_aecb0 ; AEC9E (2b:6c9e) -> C2 B0 6C
	ld a, $03 ; AECA1 (2b:6ca1) -> 3E 03
	scall PlayerFace ; AECA3 (2b:6ca3) -> CD 8C 59
	ld e, $01 ; AECA6 (2b:6ca6) -> 1E 01
	ld a, $01 ; AECA8 (2b:6ca8) -> 3E 01
	scall SpriteFace ; AECAA (2b:6caa) -> CD AA 53
	jp .asm_aecbc ; AECAD (2b:6cad) -> C3 BC 6C
.asm_aecb0:
	ld a, $01 ; AECB0 (2b:6cb0) -> 3E 01
	scall PlayerFace ; AECB2 (2b:6cb2) -> CD 8C 59
	ld e, $03 ; AECB5 (2b:6cb5) -> 1E 03
	ld a, $01 ; AECB7 (2b:6cb7) -> 3E 01
	scall SpriteFace ; AECB9 (2b:6cb9) -> CD AA 53
.asm_aecbc:
	ld hl, $0143 ; AECBC (2b:6cbc) -> 21 43 01
	scall PrintTextWithNPCName ; AECBF (2b:6cbf) -> CD BE 57
	scall Func_81094 ; AECC2 (2b:6cc2) -> CD A9 63
	or a ; AECC5 (2b:6cc5) -> B7
	jp nz, .asm_aecf8 ; AECC6 (2b:6cc6) -> C2 F8 6C
	ld e, $01 ; AECC9 (2b:6cc9) -> 1E 01
	ld hl, $00d4 ; AECCB (2b:6ccb) -> 21 D4 00
	scall EventFlagAction ; AECCE (2b:6cce) -> CD 30 59
	call Func_aebfc ; AECD1 (2b:6cd1) -> CD FC 6B
	ld hl, $003c ; AECD4 (2b:6cd4) -> 21 3C 00
	scall ScriptSleep ; AECD7 (2b:6cd7) -> CD A4 59
	ld e, $00 ; AECDA (2b:6cda) -> 1E 00
	ld a, $01 ; AECDC (2b:6cdc) -> 3E 01
	scall SpriteFace ; AECDE (2b:6cde) -> CD AA 53
	ld hl, $0144 ; AECE1 (2b:6ce1) -> 21 44 01
	scall PrintTextWithNPCName ; AECE4 (2b:6ce4) -> CD BE 57
	ld bc, Data_aec49 ; AECE7 (2b:6ce7) -> 01 49 6C
	ld e, $2b ; AECEA (2b:6cea) -> 1E 2B
	ld a, $01 ; AECEC (2b:6cec) -> 3E 01
	scall MovePersonAndWait ; AECEE (2b:6cee) -> CD 9D 59
	ld e, $00 ; AECF1 (2b:6cf1) -> 1E 00
	ld a, $01 ; AECF3 (2b:6cf3) -> 3E 01
	scall SetPersonVisibilityState ; AECF5 (2b:6cf5) -> CD 52 54
.asm_aecf8:
	ret  ; AECF8 (2b:6cf8) -> C9

Data_aecf9:
	warpdef $01, $07, $01, $01, MAP_27_06, $01, $08, $01, $09, $2e

Data_aed04:
IF DEF(SUN)
	wildbot $00, $03, $10, $0c, $49, $2c, $2f, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $89, $32, $35, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $10, $0c, $48, $2c, $2f, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $10, $0c, $44, $2d, $30, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $10, $0c, $39, $2e, $31, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $10, $0c, $8e, $30, $33, $7a, $0d, $0e, $13, $13, $04, $00
	wildbot $00, $03, $10, $0c, $86, $32, $35, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aed4a:: ; aed4a
	ld l, $00 ; AED4A (2b:6d4a) -> 2E 00
	push hl ; AED4C (2b:6d4c) -> E5
	ld c, $07 ; AED4D (2b:6d4d) -> 0E 07
	ld e, $08 ; AED4F (2b:6d4f) -> 1E 08
	ld a, $06 ; AED51 (2b:6d51) -> 3E 06
	scall Func_80f24 ; AED53 (2b:6d53) -> CD 39 62
	pop bc ; AED56 (2b:6d56) -> C1
	ld l, $01 ; AED57 (2b:6d57) -> 2E 01
	push hl ; AED59 (2b:6d59) -> E5
	ld c, $02 ; AED5A (2b:6d5a) -> 0E 02
	ld e, $07 ; AED5C (2b:6d5c) -> 1E 07
	ld a, $02 ; AED5E (2b:6d5e) -> 3E 02
	scall Func_80f24 ; AED60 (2b:6d60) -> CD 39 62
	pop bc ; AED63 (2b:6d63) -> C1
	ld l, $01 ; AED64 (2b:6d64) -> 2E 01
	push hl ; AED66 (2b:6d66) -> E5
	ld c, $03 ; AED67 (2b:6d67) -> 0E 03
	ld e, $09 ; AED69 (2b:6d69) -> 1E 09
	ld a, $05 ; AED6B (2b:6d6b) -> 3E 05
	scall Func_80f24 ; AED6D (2b:6d6d) -> CD 39 62
	pop bc ; AED70 (2b:6d70) -> C1
	ld l, $01 ; AED71 (2b:6d71) -> 2E 01
	push hl ; AED73 (2b:6d73) -> E5
	ld c, $02 ; AED74 (2b:6d74) -> 0E 02
	ld e, $07 ; AED76 (2b:6d76) -> 1E 07
	ld a, $0c ; AED78 (2b:6d78) -> 3E 0C
	scall Func_80f24 ; AED7A (2b:6d7a) -> CD 39 62
	pop bc ; AED7D (2b:6d7d) -> C1
	ld e, $01 ; AED7E (2b:6d7e) -> 1E 01
	ld hl, Data_aecf9 ; AED80 (2b:6d80) -> 21 F9 6C
	scall LoadWarps ; AED83 (2b:6d83) -> CD 4F 53
	ld a, $03 ; AED86 (2b:6d86) -> 3E 03
	scall Func_80d01 ; AED88 (2b:6d88) -> CD 16 60
	ld e, $05 ; AED8B (2b:6d8b) -> 1E 05
	ld hl, Data_aed04 ; AED8D (2b:6d8d) -> 21 04 6D
	scall LoadEncounters ; AED90 (2b:6d90) -> CD 39 60
	ld a, $08 ; AED93 (2b:6d93) -> 3E 08
	scall PlayMusic ; AED95 (2b:6d95) -> CD FB 61
	scall Func_8001c ; AED98 (2b:6d98) -> CD 31 53
	ld hl, $031b ; AED9B (2b:6d9b) -> 21 1B 03
	scall LandmarkSign ; AED9E (2b:6d9e) -> CD 87 62
	ret  ; AEDA1 (2b:6da1) -> C9

Data_aeda2:
	warpdef $12, $14, $01, $01, MAP_27_09, $12, $04, $11, $04, $2e

Data_aedad:
	db $47, $0a, $03, $02, $63

Data_aedb2:
IF DEF(SUN)
	wildbot $00, $03, $1d, $16, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	wildbot $00, $03, $1d, $16, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	wildbot $00, $03, $1d, $16, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	wildbot $00, $03, $1d, $16, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	wildbot $00, $03, $1d, $16, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	wildbot $00, $03, $1d, $16, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Func_aedf8:: ; aedf8
	ld l, $00 ; AEDF8 (2b:6df8) -> 2E 00
	push hl ; AEDFA (2b:6dfa) -> E5
	ld c, $06 ; AEDFB (2b:6dfb) -> 0E 06
	ld e, $07 ; AEDFD (2b:6dfd) -> 1E 07
	ld a, $0e ; AEDFF (2b:6dff) -> 3E 0E
	scall Func_80f24 ; AEE01 (2b:6e01) -> CD 39 62
	pop bc ; AEE04 (2b:6e04) -> C1
	ld l, $00 ; AEE05 (2b:6e05) -> 2E 00
	push hl ; AEE07 (2b:6e07) -> E5
	ld c, $06 ; AEE08 (2b:6e08) -> 0E 06
	ld e, $08 ; AEE0A (2b:6e0a) -> 1E 08
	ld a, $02 ; AEE0C (2b:6e0c) -> 3E 02
	scall Func_80f24 ; AEE0E (2b:6e0e) -> CD 39 62
	pop bc ; AEE11 (2b:6e11) -> C1
	ld l, $00 ; AEE12 (2b:6e12) -> 2E 00
	push hl ; AEE14 (2b:6e14) -> E5
	ld c, $09 ; AEE15 (2b:6e15) -> 0E 09
	ld e, $0e ; AEE17 (2b:6e17) -> 1E 0E
	ld a, $08 ; AEE19 (2b:6e19) -> 3E 08
	scall Func_80f24 ; AEE1B (2b:6e1b) -> CD 39 62
	pop bc ; AEE1E (2b:6e1e) -> C1
	ld l, $01 ; AEE1F (2b:6e1f) -> 2E 01
	push hl ; AEE21 (2b:6e21) -> E5
	ld c, $05 ; AEE22 (2b:6e22) -> 0E 05
	ld e, $09 ; AEE24 (2b:6e24) -> 1E 09
	ld a, $01 ; AEE26 (2b:6e26) -> 3E 01
	scall Func_80f24 ; AEE28 (2b:6e28) -> CD 39 62
	pop bc ; AEE2B (2b:6e2b) -> C1
	ld l, $01 ; AEE2C (2b:6e2c) -> 2E 01
	push hl ; AEE2E (2b:6e2e) -> E5
	ld c, $02 ; AEE2F (2b:6e2f) -> 0E 02
	ld e, $0d ; AEE31 (2b:6e31) -> 1E 0D
	ld a, $04 ; AEE33 (2b:6e33) -> 3E 04
	scall Func_80f24 ; AEE35 (2b:6e35) -> CD 39 62
	pop bc ; AEE38 (2b:6e38) -> C1
	ld l, $01 ; AEE39 (2b:6e39) -> 2E 01
	push hl ; AEE3B (2b:6e3b) -> E5
	ld c, $02 ; AEE3C (2b:6e3c) -> 0E 02
	ld e, $07 ; AEE3E (2b:6e3e) -> 1E 07
	ld a, $07 ; AEE40 (2b:6e40) -> 3E 07
	scall Func_80f24 ; AEE42 (2b:6e42) -> CD 39 62
	pop bc ; AEE45 (2b:6e45) -> C1
	ld l, $01 ; AEE46 (2b:6e46) -> 2E 01
	push hl ; AEE48 (2b:6e48) -> E5
	ld c, $03 ; AEE49 (2b:6e49) -> 0E 03
	ld e, $0f ; AEE4B (2b:6e4b) -> 1E 0F
	ld a, $07 ; AEE4D (2b:6e4d) -> 3E 07
	scall Func_80f24 ; AEE4F (2b:6e4f) -> CD 39 62
	pop bc ; AEE52 (2b:6e52) -> C1
	ld l, $01 ; AEE53 (2b:6e53) -> 2E 01
	push hl ; AEE55 (2b:6e55) -> E5
	ld c, $06 ; AEE56 (2b:6e56) -> 0E 06
	ld e, $06 ; AEE58 (2b:6e58) -> 1E 06
	ld a, $0a ; AEE5A (2b:6e5a) -> 3E 0A
	scall Func_80f24 ; AEE5C (2b:6e5c) -> CD 39 62
	pop bc ; AEE5F (2b:6e5f) -> C1
	ld l, $01 ; AEE60 (2b:6e60) -> 2E 01
	push hl ; AEE62 (2b:6e62) -> E5
	ld c, $03 ; AEE63 (2b:6e63) -> 0E 03
	ld e, $08 ; AEE65 (2b:6e65) -> 1E 08
	ld a, $0d ; AEE67 (2b:6e67) -> 3E 0D
	scall Func_80f24 ; AEE69 (2b:6e69) -> CD 39 62
	pop bc ; AEE6C (2b:6e6c) -> C1
	ld l, $01 ; AEE6D (2b:6e6d) -> 2E 01
	push hl ; AEE6F (2b:6e6f) -> E5
	ld c, $03 ; AEE70 (2b:6e70) -> 0E 03
	ld e, $0c ; AEE72 (2b:6e72) -> 1E 0C
	ld a, $10 ; AEE74 (2b:6e74) -> 3E 10
	scall Func_80f24 ; AEE76 (2b:6e76) -> CD 39 62
	pop bc ; AEE79 (2b:6e79) -> C1
	ld l, $01 ; AEE7A (2b:6e7a) -> 2E 01
	push hl ; AEE7C (2b:6e7c) -> E5
	ld c, $08 ; AEE7D (2b:6e7d) -> 0E 08
	ld e, $08 ; AEE7F (2b:6e7f) -> 1E 08
	ld a, $13 ; AEE81 (2b:6e81) -> 3E 13
	scall Func_80f24 ; AEE83 (2b:6e83) -> CD 39 62
	pop bc ; AEE86 (2b:6e86) -> C1
	ld e, $01 ; AEE87 (2b:6e87) -> 1E 01
	ld hl, Data_aeda2 ; AEE89 (2b:6e89) -> 21 A2 6D
	scall LoadWarps ; AEE8C (2b:6e8c) -> CD 4F 53
	ld e, $01 ; AEE8F (2b:6e8f) -> 1E 01
	ld hl, Data_aedad ; AEE91 (2b:6e91) -> 21 AD 6D
	scall Func_80ce7 ; AEE94 (2b:6e94) -> CD FC 5F
	ld a, $03 ; AEE97 (2b:6e97) -> 3E 03
	scall Func_80d01 ; AEE99 (2b:6e99) -> CD 16 60
	ld e, $05 ; AEE9C (2b:6e9c) -> 1E 05
	ld hl, Data_aedb2 ; AEE9E (2b:6e9e) -> 21 B2 6D
	scall LoadEncounters ; AEEA1 (2b:6ea1) -> CD 39 60
	ld a, $08 ; AEEA4 (2b:6ea4) -> 3E 08
	scall PlayMusic ; AEEA6 (2b:6ea6) -> CD FB 61
	scall Func_8001c ; AEEA9 (2b:6ea9) -> CD 31 53
	ld hl, $031c ; AEEAC (2b:6eac) -> 21 1C 03
	scall LandmarkSign ; AEEAF (2b:6eaf) -> CD 87 62
	ret  ; AEEB2 (2b:6eb2) -> C9

Data_aeeb3:
	db $12, $04, $01, $01, $1b, $08, $12, $14, $11, $14, $2e
	db $0a, $04, $01, $01, $1b, $0a, $09, $04, $0a, $04, $2e
	db $05, $04, $01, $01, $1b, $0a, $04, $04, $04, $05, $2e

Data_aeed4:
	db $4b, $13, $05, $02, $56

Data_aeed9:
IF DEF(SUN)
	db $00, $03, $14, $14, $48, $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00
	db $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	db $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	db $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $14, $14, $89, $34, $37, $5e, $04, $10, $00, $07, $01, $00
ELIF DEF(STAR)
	db $00, $03, $14, $14, $49, $2d, $30, $06, $02, $02, $02, $06, $0a, $00
	db $00, $03, $14, $14, $44, $2e, $31, $7a, $14, $08, $00, $12, $09, $00
	db $00, $03, $14, $14, $39, $2f, $32, $1b, $0e, $0b, $00, $06, $08, $00
	db $00, $03, $14, $14, $8f, $31, $34, $5e, $0f, $0d, $14, $13, $07, $00
	db $00, $03, $14, $14, $86, $34, $37, $77, $14, $0d, $1f, $14, $01, $00
ENDC

Data_aef1f:
	person_event $1b, $04, $05, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $04, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $06, $0e, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Data_aef9d:
	person_event $1b, $04, $04, $0d, $01, $01, $02, $04, $00, Func_af083, NULL
	person_event $1b, $04, $07, $0e, $01, $01, $02, $04, $00, Func_af0a7, NULL
	person_event $1b, $04, $03, $0f, $01, $01, $02, $04, $00, Func_af0cb, NULL
	person_event $1b, $04, $05, $0f, $01, $01, $02, $04, $00, Func_af0ef, NULL
	person_event $ff, $00, $04, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0d, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $04, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $ff, $00, $06, $0f, $01, $01, $00, $04, $01, NULL, NULL
	person_event $00, $04, $03, $0a, $01, $01, $01, $04, $00, Func_af1b1, NULL

Func_af01b:: ; af01b
	ld e, $03 ; AF01B (2b:701b) -> 1E 03
	ld hl, Data_aeeb3 ; AF01D (2b:701d) -> 21 B3 6E
	scall LoadWarps ; AF020 (2b:7020) -> CD 4F 53
	ld e, $01 ; AF023 (2b:7023) -> 1E 01
	ld hl, Data_aeed4 ; AF025 (2b:7025) -> 21 D4 6E
	scall Func_80ce7 ; AF028 (2b:7028) -> CD FC 5F
	ld a, $03 ; AF02B (2b:702b) -> 3E 03
	scall Func_80d01 ; AF02D (2b:702d) -> CD 16 60
	ld e, $05 ; AF030 (2b:7030) -> 1E 05
	ld hl, Data_aeed9 ; AF032 (2b:7032) -> 21 D9 6E
	scall LoadEncounters ; AF035 (2b:7035) -> CD 39 60
	ld hl, $004e ; AF038 (2b:7038) -> 21 4E 00
	scall CheckEventFlag ; AF03B (2b:703b) -> CD 43 59
	or a ; AF03E (2b:703e) -> B7
	jp nz, .asm_af057 ; AF03F (2b:703f) -> C2 57 70
	ld hl, $004d ; AF042 (2b:7042) -> 21 4D 00
	scall CheckEventFlag ; AF045 (2b:7045) -> CD 43 59
	or a ; AF048 (2b:7048) -> B7
	jp nz, .asm_af057 ; AF049 (2b:7049) -> C2 57 70
	ld e, $09 ; AF04C (2b:704c) -> 1E 09
	ld hl, Data_aef1f ; AF04E (2b:704e) -> 21 1F 6F
	scall LoadMapObjects ; AF051 (2b:7051) -> CD 10 54
	jp .asm_af074 ; AF054 (2b:7054) -> C3 74 70
.asm_af057:
	ld hl, $004e ; AF057 (2b:7057) -> 21 4E 00
	scall CheckEventFlag ; AF05A (2b:705a) -> CD 43 59
	or a ; AF05D (2b:705d) -> B7
	jp nz, .asm_af074 ; AF05E (2b:705e) -> C2 74 70
	ld hl, $004d ; AF061 (2b:7061) -> 21 4D 00
	scall CheckEventFlag ; AF064 (2b:7064) -> CD 43 59
	cp $01 ; AF067 (2b:7067) -> FE 01
	jp nz, .asm_af074 ; AF069 (2b:7069) -> C2 74 70
	ld e, $09 ; AF06C (2b:706c) -> 1E 09
	ld hl, Data_aef9d ; AF06E (2b:706e) -> 21 9D 6F
	scall LoadMapObjects ; AF071 (2b:7071) -> CD 10 54
.asm_af074:
	ld a, $08 ; AF074 (2b:7074) -> 3E 08
	scall PlayMusic ; AF076 (2b:7076) -> CD FB 61
	scall Func_8001c ; AF079 (2b:7079) -> CD 31 53
	ld hl, $031d ; AF07C (2b:707c) -> 21 1D 03
	scall LandmarkSign ; AF07F (2b:707f) -> CD 87 62
	ret  ; AF082 (2b:7082) -> C9

Func_af083:
	push af ; AF083 (2b:7083) -> F5
	ld a, e ; AF084 (2b:7084) -> 7B
	cp $03 ; AF085 (2b:7085) -> FE 03
	jp z, .asm_af0a2 ; AF087 (2b:7087) -> CA A2 70
	cp $01 ; AF08A (2b:708a) -> FE 01
	jp nz, .asm_af0a5 ; AF08C (2b:708c) -> C2 A5 70
	ld hl, sp+$01 ; AF08F (2b:708f) -> F8 01
	ld a, [hl] ; AF091 (2b:7091) -> 7E
	scall Func_80bde ; AF092 (2b:7092) -> CD F3 5E
	cp $01 ; AF095 (2b:7095) -> FE 01
	jp nz, .asm_af09f ; AF097 (2b:7097) -> C2 9F 70
	ld a, $01 ; AF09A (2b:709a) -> 3E 01
	ld [wc7c4], a ; AF09C (2b:709c) -> EA C4 C7
.asm_af09f:
	jp .asm_af0a5 ; AF09F (2b:709f) -> C3 A5 70
.asm_af0a2:
	call Func_af113 ; AF0A2 (2b:70a2) -> CD 13 71
.asm_af0a5:
	pop bc ; AF0A5 (2b:70a5) -> C1
	ret  ; AF0A6 (2b:70a6) -> C9

Func_af0a7:
	push af ; AF0A7 (2b:70a7) -> F5
	ld a, e ; AF0A8 (2b:70a8) -> 7B
	cp $03 ; AF0A9 (2b:70a9) -> FE 03
	jp z, .asm_af0c6 ; AF0AB (2b:70ab) -> CA C6 70
	cp $01 ; AF0AE (2b:70ae) -> FE 01
	jp nz, .asm_af0c9 ; AF0B0 (2b:70b0) -> C2 C9 70
	ld hl, sp+$01 ; AF0B3 (2b:70b3) -> F8 01
	ld a, [hl] ; AF0B5 (2b:70b5) -> 7E
	scall Func_80bde ; AF0B6 (2b:70b6) -> CD F3 5E
	cp $01 ; AF0B9 (2b:70b9) -> FE 01
	jp nz, .asm_af0c3 ; AF0BB (2b:70bb) -> C2 C3 70
	ld a, $01 ; AF0BE (2b:70be) -> 3E 01
	ld [wc7c4], a ; AF0C0 (2b:70c0) -> EA C4 C7
.asm_af0c3:
	jp .asm_af0c9 ; AF0C3 (2b:70c3) -> C3 C9 70
.asm_af0c6:
	call Func_af113 ; AF0C6 (2b:70c6) -> CD 13 71
.asm_af0c9:
	pop bc ; AF0C9 (2b:70c9) -> C1
	ret  ; AF0CA (2b:70ca) -> C9

Func_af0cb:
	push af ; AF0CB (2b:70cb) -> F5
	ld a, e ; AF0CC (2b:70cc) -> 7B
	cp $03 ; AF0CD (2b:70cd) -> FE 03
	jp z, .asm_af0ea ; AF0CF (2b:70cf) -> CA EA 70
	cp $01 ; AF0D2 (2b:70d2) -> FE 01
	jp nz, .asm_af0ed ; AF0D4 (2b:70d4) -> C2 ED 70
	ld hl, sp+$01 ; AF0D7 (2b:70d7) -> F8 01
	ld a, [hl] ; AF0D9 (2b:70d9) -> 7E
	scall Func_80bde ; AF0DA (2b:70da) -> CD F3 5E
	cp $01 ; AF0DD (2b:70dd) -> FE 01
	jp nz, .asm_af0e7 ; AF0DF (2b:70df) -> C2 E7 70
	ld a, $01 ; AF0E2 (2b:70e2) -> 3E 01
	ld [wc7c4], a ; AF0E4 (2b:70e4) -> EA C4 C7
.asm_af0e7:
	jp .asm_af0ed ; AF0E7 (2b:70e7) -> C3 ED 70
.asm_af0ea:
	call Func_af113 ; AF0EA (2b:70ea) -> CD 13 71
.asm_af0ed:
	pop bc ; AF0ED (2b:70ed) -> C1
	ret  ; AF0EE (2b:70ee) -> C9

Func_af0ef:
	push af ; AF0EF (2b:70ef) -> F5
	ld a, e ; AF0F0 (2b:70f0) -> 7B
	cp $03 ; AF0F1 (2b:70f1) -> FE 03
	jp z, .asm_af10e ; AF0F3 (2b:70f3) -> CA 0E 71
	cp $01 ; AF0F6 (2b:70f6) -> FE 01
	jp nz, .asm_af111 ; AF0F8 (2b:70f8) -> C2 11 71
	ld hl, sp+$01 ; AF0FB (2b:70fb) -> F8 01
	ld a, [hl] ; AF0FD (2b:70fd) -> 7E
	scall Func_80bde ; AF0FE (2b:70fe) -> CD F3 5E
	cp $01 ; AF101 (2b:7101) -> FE 01
	jp nz, .asm_af10b ; AF103 (2b:7103) -> C2 0B 71
	ld a, $01 ; AF106 (2b:7106) -> 3E 01
	ld [wc7c4], a ; AF108 (2b:7108) -> EA C4 C7
.asm_af10b:
	jp .asm_af111 ; AF10B (2b:710b) -> C3 11 71
.asm_af10e:
	call Func_af113 ; AF10E (2b:710e) -> CD 13 71
.asm_af111:
	pop bc ; AF111 (2b:7111) -> C1
	ret  ; AF112 (2b:7112) -> C9

Func_af113:
	push bc ; AF113 (2b:7113) -> C5
	ld hl, sp+$01 ; AF114 (2b:7114) -> F8 01
	ld [hl], $04 ; AF116 (2b:7116) -> 36 04
.asm_af118:
	ld hl, sp+$01 ; AF118 (2b:7118) -> F8 01
	ld a, [hl] ; AF11A (2b:711a) -> 7E
	cp $08 ; AF11B (2b:711b) -> FE 08
	jp nc, .asm_af15c ; AF11D (2b:711d) -> D2 5C 71
	ld hl, sp+$00 ; AF120 (2b:7120) -> F8 00
	ld [hl], $00 ; AF122 (2b:7122) -> 36 00
.asm_af124:
	ld hl, sp+$00 ; AF124 (2b:7124) -> F8 00
	ld a, [hl] ; AF126 (2b:7126) -> 7E
	cp $04 ; AF127 (2b:7127) -> FE 04
	jp nc, .asm_af152 ; AF129 (2b:7129) -> D2 52 71
	ld hl, sp+$01 ; AF12C (2b:712c) -> F8 01
	ld e, [hl] ; AF12E (2b:712e) -> 5E
	ld hl, sp+$00 ; AF12F (2b:712f) -> F8 00
	ld a, [hl] ; AF131 (2b:7131) -> 7E
	scall CheckObjectsOccupyingSameTile ; AF132 (2b:7132) -> CD FE 53
	cp $01 ; AF135 (2b:7135) -> FE 01
	jp nz, .asm_af13d ; AF137 (2b:7137) -> C2 3D 71
	jp .asm_af152 ; AF13A (2b:713a) -> C3 52 71
.asm_af13d:
	ld hl, sp+$00 ; AF13D (2b:713d) -> F8 00
	ld a, [hl] ; AF13F (2b:713f) -> 7E
	cp $03 ; AF140 (2b:7140) -> FE 03
	jp nz, .asm_af148 ; AF142 (2b:7142) -> C2 48 71
	jp .asm_af15f ; AF145 (2b:7145) -> C3 5F 71
.asm_af148:
	ld hl, sp+$00 ; AF148 (2b:7148) -> F8 00
	ld a, [hl] ; AF14A (2b:714a) -> 7E
	inc a ; AF14B (2b:714b) -> 3C
	ld hl, sp+$00 ; AF14C (2b:714c) -> F8 00
	ld [hl], a ; AF14E (2b:714e) -> 77
	jp .asm_af124 ; AF14F (2b:714f) -> C3 24 71
.asm_af152:
	ld hl, sp+$01 ; AF152 (2b:7152) -> F8 01
	ld a, [hl] ; AF154 (2b:7154) -> 7E
	inc a ; AF155 (2b:7155) -> 3C
	ld hl, sp+$01 ; AF156 (2b:7156) -> F8 01
	ld [hl], a ; AF158 (2b:7158) -> 77
	jp .asm_af118 ; AF159 (2b:7159) -> C3 18 71
.asm_af15c:
	call Func_af161 ; AF15C (2b:715c) -> CD 61 71
.asm_af15f:
	pop bc ; AF15F (2b:715f) -> C1
	ret  ; AF160 (2b:7160) -> C9

Func_af161:
	ld e, $01 ; AF161 (2b:7161) -> 1E 01
	ld hl, $004e ; AF163 (2b:7163) -> 21 4E 00
	scall EventFlagAction ; AF166 (2b:7166) -> CD 30 59
	ld a, $2b ; AF169 (2b:7169) -> 3E 2B
	scall PlaySFX ; AF16B (2b:716b) -> CD 13 62
	ld e, $00 ; AF16E (2b:716e) -> 1E 00
	xor a ; AF170 (2b:7170) -> AF
	scall SetPersonVisibilityState ; AF171 (2b:7171) -> CD 52 54
	ld hl, $001e ; AF174 (2b:7174) -> 21 1E 00
	scall ScriptSleep ; AF177 (2b:7177) -> CD A4 59
	ld a, $2b ; AF17A (2b:717a) -> 3E 2B
	scall PlaySFX ; AF17C (2b:717c) -> CD 13 62
	ld e, $00 ; AF17F (2b:717f) -> 1E 00
	ld a, $01 ; AF181 (2b:7181) -> 3E 01
	scall SetPersonVisibilityState ; AF183 (2b:7183) -> CD 52 54
	ld hl, $001e ; AF186 (2b:7186) -> 21 1E 00
	scall ScriptSleep ; AF189 (2b:7189) -> CD A4 59
	ld a, $2b ; AF18C (2b:718c) -> 3E 2B
	scall PlaySFX ; AF18E (2b:718e) -> CD 13 62
	ld e, $00 ; AF191 (2b:7191) -> 1E 00
	ld a, $02 ; AF193 (2b:7193) -> 3E 02
	scall SetPersonVisibilityState ; AF195 (2b:7195) -> CD 52 54
	ld hl, $001e ; AF198 (2b:7198) -> 21 1E 00
	scall ScriptSleep ; AF19B (2b:719b) -> CD A4 59
	ld a, $2b ; AF19E (2b:719e) -> 3E 2B
	scall PlaySFX ; AF1A0 (2b:71a0) -> CD 13 62
	ld e, $00 ; AF1A3 (2b:71a3) -> 1E 00
	ld a, $03 ; AF1A5 (2b:71a5) -> 3E 03
	scall SetPersonVisibilityState ; AF1A7 (2b:71a7) -> CD 52 54
	ld hl, $001e ; AF1AA (2b:71aa) -> 21 1E 00
	scall ScriptSleep ; AF1AD (2b:71ad) -> CD A4 59
	ret  ; AF1B0 (2b:71b0) -> C9

Func_af1b1:
	push af ; AF1B1 (2b:71b1) -> F5
	ld a, e ; AF1B2 (2b:71b2) -> 7B
	or a ; AF1B3 (2b:71b3) -> B7
	jp nz, .asm_af223 ; AF1B4 (2b:71b4) -> C2 23 72
	ld hl, sp+$01 ; AF1B7 (2b:71b7) -> F8 01
	ld a, [hl] ; AF1B9 (2b:71b9) -> 7E
	scall FacePlayer ; AF1BA (2b:71ba) -> CD 60 57
	ld hl, $004d ; AF1BD (2b:71bd) -> 21 4D 00
	scall CheckEventFlag ; AF1C0 (2b:71c0) -> CD 43 59
	or a ; AF1C3 (2b:71c3) -> B7
	jp nz, .asm_af21d ; AF1C4 (2b:71c4) -> C2 1D 72
	ld hl, $004e ; AF1C7 (2b:71c7) -> 21 4E 00
	scall CheckEventFlag ; AF1CA (2b:71ca) -> CD 43 59
	or a ; AF1CD (2b:71cd) -> B7
	jp nz, .asm_af21d ; AF1CE (2b:71ce) -> C2 1D 72
	ld hl, $013b ; AF1D1 (2b:71d1) -> 21 3B 01
	scall PrintTextWithNPCName ; AF1D4 (2b:71d4) -> CD BE 57
	ld a, $24 ; AF1D7 (2b:71d7) -> 3E 24
	scall Func_80e5d ; AF1D9 (2b:71d9) -> CD 72 61
	cp $01 ; AF1DC (2b:71dc) -> FE 01
	jp nz, .asm_af214 ; AF1DE (2b:71de) -> C2 14 72
	ld hl, $013c ; AF1E1 (2b:71e1) -> 21 3C 01
	scall PrintTextWithNPCName ; AF1E4 (2b:71e4) -> CD BE 57
	ld hl, $013d ; AF1E7 (2b:71e7) -> 21 3D 01
	scall PrintTextWithNPCNameAndYesNoBox ; AF1EA (2b:71ea) -> CD DF 57
	or a ; AF1ED (2b:71ed) -> B7
	jp nz, .asm_af20b ; AF1EE (2b:71ee) -> C2 0B 72
	ld c, $01 ; AF1F1 (2b:71f1) -> 0E 01
	ld e, $01 ; AF1F3 (2b:71f3) -> 1E 01
	ld a, $24 ; AF1F5 (2b:71f5) -> 3E 24
	scall Func_80d4d ; AF1F7 (2b:71f7) -> CD 62 60
	ld e, $01 ; AF1FA (2b:71fa) -> 1E 01
	ld hl, $004d ; AF1FC (2b:71fc) -> 21 4D 00
	scall EventFlagAction ; AF1FF (2b:71ff) -> CD 30 59
	ld hl, $013e ; AF202 (2b:7202) -> 21 3E 01
	scall PrintTextWithNPCName ; AF205 (2b:7205) -> CD BE 57
	jp .asm_af211 ; AF208 (2b:7208) -> C3 11 72
.asm_af20b:
	ld hl, $013f ; AF20B (2b:720b) -> 21 3F 01
	scall PrintTextWithNPCName ; AF20E (2b:720e) -> CD BE 57
.asm_af211:
	jp .asm_af21a ; AF211 (2b:7211) -> C3 1A 72
.asm_af214:
	ld hl, $013c ; AF214 (2b:7214) -> 21 3C 01
	scall PrintTextWithNPCName ; AF217 (2b:7217) -> CD BE 57
.asm_af21a:
	jp .asm_af223 ; AF21A (2b:721a) -> C3 23 72
.asm_af21d:
	ld hl, $0141 ; AF21D (2b:721d) -> 21 41 01
	scall PrintTextWithNPCName ; AF220 (2b:7220) -> CD BE 57
.asm_af223:
	pop bc ; AF223 (2b:7223) -> C1
	ret  ; AF224 (2b:7224) -> C9

IF DEF(SUN)
	db $09, $04, $01, $01, $1b, $09
	db $0a, $04, $0b, $04, $2e, $04, $04, $01, $01, $1b, $09, $05, $04, $05, $05, $2e
	db $04, $0e, $01, $01, $1b, $0b, $04, $15, $04, $14, $2e, $00, $03, $12, $1c, $48
	db $2d, $30, $7a, $14, $0d, $1e, $06, $0a, $00, $00, $03, $12, $1c, $44, $2e, $31
	db $7a, $14, $08, $00, $12, $09, $00, $00, $03, $12, $1c, $39, $2f, $32, $1b, $0e
	db $0b, $00, $06, $08, $00, $00, $03, $12, $1c, $8f, $31, $34, $5e, $0f, $0d, $14
	db $13, $07, $00, $00, $03, $12, $1c, $89, $34, $37, $5e, $04, $10, $00, $07, $01
	db $00, $00, $0c, $04, $12, $01, $01, $00, $04, $00, $2b, $4c, $73, $00, $00
ELIF DEF(STAR)
	db $09, $04, $01, $01, $1b, $09
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


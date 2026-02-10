INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 15", ROMX, BANK [$15]
Func_54000:
	ret

Data_54001:: ; 54001
	db 0, 0
	db 11, 13
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_58d7a
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_54020:: ; 54020
	db 0, 0
	db 12, 17
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba DebugMenuMenuTestMenu
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5403f:: ; 5403f
	db 4, 3
	db 11, 11
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_2391e
	dba Func_1746c
	dbw 5, 0
	dbw 5, 0
	dba Func_dd5a
	dbw 0, 0

Data_5405e:: ; 5405e
	db 4, 4
	db 11, 9
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_2391e
	dba Func_1746c
	dbw 5, 0
	dbw 5, 0
	dba Func_dd5a
	dbw 0, 0

Data_5407d:: ; 5407d
	db 4, 4
	db 11, 9
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_23a68
	dba Func_1746c
	dbw 5, 0
	dbw 5, 0
	dba Func_dd5a
	dbw 0, 0

Data_5409c:: ; 5409c
	db 4, 5
	db 11, 7
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_23a68
	dba Func_1746c
	dbw 5, 0
	dbw 5, 0
	dba Func_dd5a
	dbw 0, 0

Data_540bb:: ; 540bb
	db 0, 3
	db 15, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba BagSubmenu
	dba Func_17454
	dba Func_523f2
	dba Func_52475
	dbw 5, 0
	dba Func_52b4f

StartMenuHeader:: ; 540da
	db 13, 0
	db 7, 15
	dba StartMenu_DrawMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba StartMenu_PressA
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_540f9:: ; 540f9
	db 7, 0
	db 13, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_513a2
	dba StartMenu_PressB
	dba Func_16038
	dba Func_160c2
	dbw 0, 0
	dbw 0, 0

Data_54118:: ; 54118
	db 10, 5
	db 7, 7
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_55c41
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_54137:: ; 54137
	db 0, 0
	db 11, 7
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_55ce2
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_54156:: ; 54156
	db 10, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dbw 5, 0
	dba Func_17454
	dba Func_523f2
	dba Func_52475
	dbw 5, 0
	dba Func_52b4f

Data_54175:: ; 54175
	db 9, 0
	db 11, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_6af9d
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_54194:: ; 54194
	db 10, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_50b55
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_541b3:: ; 541b3
	db 0, 9
	db 7, 5
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_561cf
	dbw 5, 0
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_541d2:: ; 541d2
	db 14, 13
	db 6, 5
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_15281
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_541f1:: ; 541f1
	db 11, 8
	db 6, 5
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_15281
	dba Func_15297
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_54210:: ; 54210
	db 0, 0
	db 11, 7
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_55d5c
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5422f:: ; 5422f
	db 10, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_1551f
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 5, 0
	dba Func_52b4f

Data_5424e:: ; 5424e
	db 0, 2
	db 10, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16377
	dba Func_15bde
	dba StartMenu_PressB
	dba Func_16038
	dba Func_160c2
	dbw 0, 0
	dbw 0, 0

Data_5426d:: ; 5426d
	db 10, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_50b55
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_5428c:: ; 5428c
	db 0, 0
	db 7, 9
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_5616f
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_542ab:: ; 542ab
	db 0, 3
	db 15, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_51ea4
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_542ca:: ; 542ca
	db 7, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_562ec
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_542e9:: ; 542e9
	db 7, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_562ec
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_54308:: ; 54308
	db 0, 3
	db 15, 10
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_51ea4
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_54327:: ; 54327
	db 7, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_562ec
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_54346:: ; 54346
	db 7, 0
	db 10, 14
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_562ec
	dba StartMenu_PressB
	dba Func_523f2
	dba Func_52475
	dbw 0, 0
	dbw 0, 0

Data_54365:: ; 54365
	db 8, 10
	db 12, 8
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba StartMenu_PressB
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_54384:: ; 54384
	dw 0
	dw 0
	dw -1
	dw 3
	dw 0
	dw -1
	dw $08
	db $0d

Data_54393: ; 54393
	dw 0
	dw 0
	dw -1
	dw 3
	dw 0
	dw 0
	dw $1f
	db $25

Data_543a2:: ; 543a2
	db 10, 0
	db 10, 14
	dba Func_573a4
	dbw 5, 0
	dbw 5, 0
	dba StartMenu_PressB
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_543c1:: ; 543c1
	db 0, 0
	db 13, 18
	dba Func_16777
	dbw 5, 0
	dba Func_16d8e
	dba Func_578e9
	dba Func_17454
	dba Func_16038
	dba Func_160c2
	dbw 0, 0
	dbw 0, 0

Data_543e0:: ; 543e0
	db 10, 0
	db 10, 14
	dba Func_69902
	dbw 5, 0
	dbw 5, 0
	dba Func_17454
	dba Func_17454
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_543ff:: ; 543ff
	db 9, 0
	db 11, 7
	dba Func_696f3
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_555b6
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5441e:: ; 5441e
	db 9, 0
	db 11, 5
	dba Func_696f3
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_555b6
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5443d:: ; 5443d
	db 9, 0
	db 11, 15
	dba Func_68f92
	dbw 5, 0
	dba Func_69284
	dba Func_68eeb
	dba StartMenu_PressB
	dba Func_6934e
	dba Func_69354
	dbw 0, 0
	dbw 0, 0

Data_5445c:: ; 5445c
	db 9, 0
	db 11, 13
	dba DrawDebugMenu
	dbw 5, 0
	dba StartMenu_MoveCursor
	dba Func_30328
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5447b:: ; 5447b
	db 0, 0
	db 5, 12
	dba Func_fb783
	dbw 5, 0
	dba Func_fb7f9
	dba Func_fb8e9
	dba StartMenu_PressB
	dbw 5, 0
	dbw 5, 0
	dbw 0, 0
	dbw 0, 0

Data_5449a:: ; 5449a
	db 0, 2
	db 20, 13
	dba Func_4dbef
	dbw 5, 0
	dba Func_4e008
	dba Func_4e1d3
	dba Func_4e3a8
	dba Func_4e175
	dba Func_4e1a4
	dbw 0, 0
	dbw 0, 0

Data_544b9:: ; 544b9
	db 10, 0
	db 10, 6
	dba Func_4e58b
	dbw 5, 0
	dba Func_4e813
	dba Func_4eb71
	dba Func_fb18e
	dba Func_4e175
	dba Func_4e1a4
	dbw 0, 0
	dbw 0, 0

Data_544d8:: ; 544d8
	db 15, 9
	db 4, 4
	dba Func_338f5
	dbw 5, 0
	dba Func_33a1f
	dba StartMenu_PressB
	dba Func_152db
	dba Func_33bb9
	dba Func_33bc4
	dbw 0, 0
	dbw 0, 0

Pointers_544f7:: ; 544f7
	dw Data_54503
	dw Data_5450e
	dw Data_5451a
	dw Data_54526
	dw Data_54531
	dw Data_5453d

Data_54503:
	dstr "(まきしま) テスト"

Data_5450e:
	dstr "(おおてﾞ)  テスト"

Data_5451a:
	dstr "(やしﾞま)  テスト"

Data_54526:
	dstr "(さえき)  テスト"

Data_54531:
	dstr "(ますたﾞ)  テスト"

Data_5453d:
	dstr "(おと)   テスト"

Pointers_54548::
	dw Data_54558
	dw Data_54563
	dw Data_5456e
	dw Data_5457a
	dw Data_5457f
	dw Data_54587
	dw Data_54593
	dw Data_54599

Data_54558:
	dstr "ロホﾞホﾟンメニュー"

Data_54563:
	dstr "フィールトﾞメニュー"

Data_5456e:
	dstr "(うけつけ)コマントﾞ"

Data_5457a:
	dstr "(みせ)"

Data_5457f:
	dstr "エレヘﾞーター"

Data_54587:
	dstr "(なまえにゅうりょく)"

Data_54593:
	dstr "(はけん)"

Data_54599:
	dstr "(はけんきかんしょり)"

Pointers_545a5:: ; 545a5
	dw Data_545af
	dw Data_545bc
	dw Data_545c9
	dw Data_545d4
	dw Data_545dc

Data_545af:
	dstr "(つつﾞきからあそふﾞ)"

Data_545bc:
	dstr "(はしﾞめからあそふﾞ)"

Data_545c9:
	dstr "(にちしﾞせってい)"

Data_545d4:
	dstr "gh ijkk"

Data_545dc:
	dstr "テﾞハﾞックﾞ"

Pointers_545e4:: ; 545e4
	dw Data_545ec
	dw Data_545f9
	dw Data_54604
	dw Data_5460c

Data_545ec:
	dstr "(はしﾞめからあそふﾞ)"

Data_545f9:
	dstr "(にちしﾞせってい)"

Data_54604:
	dstr "gh ijkk"

Data_5460c:
	dstr "テﾞハﾞックﾞ"

Pointers_54614:: ; 54614
	dw Data_54622
	dw Data_54629
	dw Data_54630
	dw Data_54636
	dw Data_5463b
	dw Data_54642
	dw Data_54647

Data_54622:
	dstr "ロホﾞホﾟン"

Data_54629:
	dstr "(もちもの)"

Data_54630:
	dstr "(そうこ)"

Data_54636:
	dstr "テﾞータ"

Data_5463b:
	dstr "(せってい)"

Data_54642:
	dstr "セーフﾞ"

Data_54647:
	dstr "タイトル"

Pointers_5464c:: ; 5464c
	dw Data_54652
	dw Data_54657
	dw Data_5465b

Data_54652:
	dstr "アイテム"

Data_54657:
	dstr "ソフト"

Data_5465b:
	dstr "ハﾟーツ"

Pointers_54660:: ; 54660
	dw Data_54666
	dw Data_54671
	dw Data_5467c

Data_54666:
	dstr "ソフト(のいちらん)"

Data_54671:
	dstr "ソフト(のそうひﾞ)"

Data_5467c:
	dstr "ソフト(をすてる)"

Pointers_54686:: ; 54686
	dw Data_5468c
	dw Data_54698
	dw Data_546a4

Data_5468c:
	dstr "ハﾟーツ(のいちらん)"

Data_54698:
	dstr "ハﾟーツ(のそうひﾞ)"

Data_546a4:
	dstr "ハﾟーツ(をすてる)"

Pointers_546af:: ; 546af
	dw Data_546b3
	dw Data_546b9

Data_546b3:
	dstr "(ほかん)"

Data_546b9:
	dstr "(ひきたﾞす)"

Pointers_546c1:: ; 546c1
	dw Data_546c5
	dw Data_546ca

Data_546c5:
	dstr "(はい)"

Data_546ca:
	dstr "(いいえ)"

Pointers_546d0:: ; 546d0
	dw Data_546d4
	dw Data_546da

Data_546d4:
	dstr "(つかう)"

Data_546da:
	dstr "(すてる)"

Pointers_546e0:: ; 546e0
	dw Data_546e8
	dw Data_546ef
	dw Data_546f4
	dw Data_546f8

Data_546e8:
	dstr "ロホﾞホﾟン"

Data_546ef:
	dstr "アイテム"

Data_546f4:
	dstr "ソフト"

Data_546f8:
	dstr "ハﾟーツ"

Pointers_546fd:: ; 546fd
	dw Data_54703
	dw Data_5470e
	dw Data_5471b

Data_54703:
	dstr "(かいしゃあんない)"

Data_5470e:
	dstr "(つうしんてﾞあそふﾞ)"

Data_5471b:
	dstr "キッス(てﾞつうしん)"

Pointers_54727:: ; 54727
	dw Data_54733
	dw Data_5473a
	dw Data_54740
	dw Data_54747
	dw Data_54752
	dw Data_5475e

Data_54733:
	dstr "(あいてむ)"

Data_5473a:
	dstr "(そふと)"

Data_54740:
	dstr "(はﾟーつ)"

Data_54747:
	dstr "(けんきゅうしﾞょ)"

Data_54752:
	dstr "(けんきゅうしﾞょ2)"

Data_5475e:
	dstr "(こうしﾞょう)"

Func_54767:: ; 54767 (15:4767)
	push hl
	ld a, [wFarCallDestBank]
	push af
	set_farcall_addrs_hli Func_61c90
	pop af
	pop hl
	push af
	call FarCall
	pop af
	ld [wFarCallDestBank], a
	ret

Func_54782:
	push hl
	add sp, -$54
	ld c, $0
Func_54787: ; 54787 (15:4787)
	read_hl_from_sp_plus $56
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_54826
	push bc
	set_farcall_addrs_hli GetRobotInParty
	pop bc
	push bc
	ld a, c
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld de, $19
	ld a, $3
	call GetBanks_15
	pop bc
	push bc
	push af
	ld l, c
	ld h, 0
	get_party_bot
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$27
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$2c
	ld e, [hl]
	pop af
	push de
	call GetSRAMBank
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop de
	ld a, e
	ld hl, sp+$21
	ld e, [hl]
	call FarCall
	ld e, a
	pop bc
	push bc
	ld a, c
	add a
	add a
	ld d, a
	add a
	add d
	ld hl, sp+$55
	ld [hl], a
	ld hl, sp+$54
	ld [hl], e
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$55
	ld a, [hl]
	ld hl, sp+$54
	ld l, [hl]
	ld h, a
	call FarCall
	pop bc
	inc c
	jp Func_54787

Func_54826: ; 54826 (15:4826)
	add sp, $56
	ret

Func_54829:
	push hl
	push de
	ld a, [wFarCallDestBank]
	push af
	set_farcall_addrs_hli Func_61d3e
	pop af
	pop de
	pop hl
	push af
	call FarCall
	pop af
	ld [wFarCallDestBank], a
	ret

Func_54846:
	push hl
	add sp, -$38
	push de
	read_hl_from_sp_plus $3c
	ld e, h
	ld hl, sp+$2
	ld [hl], e
	read_hl_from_sp_plus $3c
	ld a, l
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	pop de
	push af
	push de
	ld a, e
	ld hl, sp+$19
	reg16swap de, hl
	call FarCall
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld l, a
	pop de
	pop af
	push de
	push hl
	push af
	ld hl, $6
	push hl
	ld a, $3
	ld hl, sp+$9
	ld c, l
	ld b, h
	call Func_57ea2
	pop bc
	set_farcall_addrs_hli Func_679e5
	pop af
	pop hl
	push af
	push hl
	ld hl, sp+$31
	ld l, [hl]
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $500
	add hl, de
	ld e, a
	ld d, $0
	inc de
	add hl, de
	pop de
	call FarCall
	pop hl
	ld a, l
	call GetSRAMBank
	pop af
	push af
	ld hl, sp+$5
	ld c, l
	ld b, h
	ld e, a
	ld d, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	call Func_57e8d
	pop af
	push af
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld de, Data_54972
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $27
	ld c, l
	ld b, h
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_54975
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $29
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	pop af
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	ld e, a
	ld d, $0
	inc de
	add hl, de
	ld de, Data_54977
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $29
	ld c, l
	ld b, h
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_5497a
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $2b
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	pop de
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	ld de, Data_5497c
	call PlaceStringDEatCoordHL
	ld hl, sp+$1c
	ld c, [hl]
	ld b, $0
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, Data_5497f
	push hl
	call PlaceString
	pop bc
	add sp, $3a
	ret

Data_54972:
	dstr "Hp"

Data_54975:
	dstr "/"

Data_54977:
	dstr "Ep"

Data_5497a:
	dstr "/"

Data_5497c:
	dstr "LV"

Data_5497f:
	dstr ":"

Func_54981::
	push bc
	push bc
	push de
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_549bd
	ld a, e
	or d
	jp nz, Func_549cf
	pop hl
	push hl
	dec hl
	pop de
	push hl
	inc h
	dec h
	bit 7, h
	jr z, .asm_549ba
	ld hl, $0
	pop de
	push hl
.asm_549ba
	jp Func_549cf

Func_549bd: ; 549bd (15:49bd)
	pop hl
	push hl
	inc hl
	pop de
	push hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_549cf
	ld l, c
	ld h, b
	dec hl
	pop de
	push hl
Func_549cf: ; 549cf (15:49cf)
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, $b
	push hl
	ld c, $1
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call GetHLAtSPPlus4
	call Func_54767
	ld l, $b
	push hl
	ld c, $1
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	pop bc
	ret

Func_54a00::
	call Func_54af8
	cp $ff
	jp nz, Func_54a0c
	ld hl, -1
	ret

Func_54a0c: ; 54a0c (15:4a0c)
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ret

Pointers_54a13:
	dw Data_54a17
	dw $0

Data_54a17:
	dstr "スクラッフﾟ(に なっているよ)"

Pointers_54a28:
	dw Data_54a2c
	dw $0

Data_54a2c:
	dstr "スクラッフﾟ(しﾞゃないよ)"

Pointers_54a3b:
	dw Data_54a3f
	dw $0

Data_54a3f:
	dstr "(しんか しないよ)"

Pointers_54a4a:
	dw Data_54a50
	dw Data_54a63
	dw $0

Data_54a50:
	dstr "(これいしﾞょう) レヘﾞルアッフﾟ"

Data_54a63:
	dstr "(てﾞきないよ)"

Func_54a6c:
	push af
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld hl, $5
	push hl
	ld bc, $14
	ld de, $d
	ld hl, $0
	call Func_57e52
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	pop af
	cp $3
	jp z, Func_54adf
	cp $2
	jp z, Func_54ad1
	cp $1
	jp z, Func_54ac3
	or a
	jp nz, Func_54aea
	ld c, BANK(Pointers_54a3b)
	ld de, Pointers_54a3b
	ld hl, $10e
	call FarCall
	jp Func_54aea

Func_54ac3: ; 54ac3 (15:4ac3)
	ld c, BANK(Pointers_54a4a)
	ld de, Pointers_54a4a
	ld hl, $10e
	call FarCall
	jp Func_54aea

Func_54ad1: ; 54ad1 (15:4ad1)
	ld c, BANK(Pointers_54a13)
	ld de, Pointers_54a13
	ld hl, $10e
	call FarCall
	jp Func_54aea

Func_54adf: ; 54adf (15:4adf)
	ld c, BANK(Pointers_54a28)
	ld de, Pointers_54a28
	ld hl, $10e
	call FarCall
Func_54aea: ; 54aea (15:4aea)
	ret

Pointers_54aeb:
	dw Data_54aef
	dw $0

Data_54aef:
	dstr "(を つかった)"

Func_54af8:: ; 54af8 (15:4af8)
	add sp, -$3c
	ld hl, sp+$a
	xor a
	ld [hl], a
	ld hl, sp+$9
	ld [hl], a
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $b
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $e
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus9
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $10
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $12
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $16
	add hl, de
	ld a, [hl]
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $7
	add hl, de
	ld l, [hl]
	pop af
	push hl
	push af
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld c, [hl]
	push bc
	set_farcall_addrs_hli GetName
	ld c, $a
	ld hl, sp+$23
	push hl
	ld hl, wCurItem
	ld l, [hl]
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	call FarCall
	pop bc
	pop af
	push bc
	call GetSRAMBank
	pop bc
	pop hl
	ld a, [wCurItem]
	cp $4a
	jp nz, Func_54c22
	push bc
	call Func_54ee5
	ld hl, sp+$2
	ld [hl], a
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_54c1f
	xor a
	call Func_54a6c
	ld a, $ff
	jp Func_54ee2

Func_54c1f: ; 54c1f (15:4c1f)
	jp Func_54c3a

Func_54c22: ; 54c22 (15:4c22)
	ld a, [wCurItem]
	cp $49
	jp nz, Func_54c3a
	ld a, l
	cp $63
	jp nz, Func_54c3a
	ld a, $1
	call Func_54a6c
	ld a, $ff
	jp Func_54ee2

Func_54c3a: ; 54c3a (15:4c3a)
	call GetHLAtSPPlus9
	ld a, l
	or h
	jp nz, Func_54c60
	ld a, [wCurItem]
	inc a
	cp $42
	jp z, Func_54c50
	cp $41
	jp nz, Func_54c53
Func_54c50: ; 54c50 (15:4c50)
	jp Func_54c5d

Func_54c53: ; 54c53 (15:4c53)
	ld a, $2
	call Func_54a6c
	ld a, $ff
	jp Func_54ee2

Func_54c5d: ; 54c5d (15:4c5d)
	jp Func_54c78

Func_54c60: ; 54c60 (15:4c60)
	ld a, [wCurItem]
	inc a
	cp $42
	jp z, Func_54c6e
	cp $41
	jp nz, Func_54c78
Func_54c6e: ; 54c6e (15:4c6e)
	ld a, $3
	call Func_54a6c
	ld a, $ff
	jp Func_54ee2

Func_54c78: ; 54c78 (15:4c78)
	push bc
	ld a, [wCurItem]
	inc a
	cp $4b
	jp z, Func_54d34
	cp $4a
	jp z, Func_54d23
	cp $47
	jp z, Func_54cbd
	cp $46
	jp z, Func_54cbd
	cp $41
	jp nz, Func_54d37
	call GetHLAtSPPlus9
	ld de, $2
	call DivideHLByDESigned
	write_hl_to wc312
	ld hl, $0
	write_hl_to wc314
	ld c, $0
	call GetHLAtSPPlus7
	push hl
	read_hl_from_sp_plus $d
	pop de
	call Func_5512e
	jp Func_54da5

Func_54cbd: ; 54cbd (15:4cbd)
	read_hl_from wc312
	push hl
	read_hl_from_sp_plus $b
	ld de, 999
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_54ce8
	call GetHLAtSPPlus9
	ld de, 999
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	write_hl_to wc312
Func_54ce8: ; 54ce8 (15:4ce8)
	read_hl_from wc314
	push hl
	call GetHLAtSPPlus7
	ld de, 999
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_54d12
	call GetHLAtSPPlus5
	ld de, 999
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	write_hl_to wc314
Func_54d12: ; 54d12 (15:4d12)
	ld c, $1
	call GetHLAtSPPlus5
	push hl
	read_hl_from_sp_plus $b
	pop de
	call Func_5512e
	jp Func_54da5

Func_54d23: ; 54d23 (15:4d23)
	callba_hli Func_6f962
	jp Func_54da5

Func_54d34: ; 54d34 (15:4d34)
	jp Func_54da5

Func_54d37: ; 54d37 (15:4d37)
	read_hl_from wc312
	push hl
	read_hl_from_sp_plus $d
	push hl
	read_hl_from_sp_plus $d
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_54d69
	read_hl_from_sp_plus $b
	push hl
	read_hl_from_sp_plus $b
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to wc312
Func_54d69: ; 54d69 (15:4d69)
	read_hl_from wc314
	push hl
	call GetHLAtSPPlus9
	push hl
	call GetHLAtSPPlus9
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call CompareHLtoDE
	jp nc, Func_54d97
	call GetHLAtSPPlus7
	push hl
	call GetHLAtSPPlus7
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to wc314
Func_54d97: ; 54d97 (15:4d97)
	ld c, $0
	call GetHLAtSPPlus7
	push hl
	read_hl_from_sp_plus $d
	pop de
	call Func_5512e
Func_54da5: ; 54da5 (15:4da5)
	ld a, [wCurItem]
	inc a
	cp $42
	jp z, Func_54db3
	cp $41
	jp nz, Func_54e67
Func_54db3: ; 54db3 (15:4db3)
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld a, [wInBattle]
	cp $1
	jp nz, Func_54e04
	set_farcall_addrs_hli Func_5c694
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	call FarCall
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $16
	add hl, de
	ld [hl], a
	jp Func_54e1f

Func_54e04: ; 54e04 (15:4e04)
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $16
	add hl, de
	ld [hl], $0
Func_54e1f: ; 54e1f (15:4e1f)
	pop af
	call GetSRAMBank
	set_farcall_addrs_hli Func_679e5
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $16
	add hl, de
	ld l, [hl]
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $802
	add hl, de
	pop de
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_54e67: ; 54e67 (15:4e67)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld hl, $5
	push hl
	ld bc, $14
	ld de, $d
	ld hl, $0
	call Func_57e52
	pop bc
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$1f
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_54aeb)
	ld de, Pointers_54aeb
	ld hl, $110
	call FarCall
	pop bc
	ld a, [wCurItem]
	cp $4a
	jp nz, Func_54ee1
	push bc
	set_farcall_addrs_hli Func_4f8ec
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	dec a
	ld e, a
	ld a, c
	dec a
	call FarCall
	call Func_54f0e
Func_54ee1: ; 54ee1 (15:4ee1)
	xor a
Func_54ee2: ; 54ee2 (15:4ee2)
	add sp, $3c
	ret

Func_54ee5: ; 54ee5 (15:4ee5)
	add sp, -$52
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$2f
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$2
	ld a, [hl]
	add sp, $52
	ret

Func_54f0e:: ; 54f0e (15:4f0e)
	add sp, -$52
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	ld hl, sp+$2f
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$2
	ld a, [hl]
	push af
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$38
	ld e, [hl]
	ld hl, sp+$2
	call FarCall
	ld hl, sp+$53
	ld c, [hl]
	read_hl_from_sp_plus $1e
	push hl
	read_hl_from_sp_plus $43
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $41
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $47
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $45
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4a
	read_hl_from_sp_plus $2b
	push hl
	read_hl_from_sp_plus $50
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4e
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $4c
	pop af
	push bc
	push af
	ld e, a
	dec e
	ld hl, sp+$4
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli Func_53a0d
	pop af
	push af
	ld e, $0
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	pop af
	push af
	ld e, $1
	call FarCall
	set_farcall_addrs_hli Func_dbe2
	ld hl, sp+$3a
	ld e, [hl]
	ld hl, sp+$4
	call FarCall
	ld hl, sp+$52
	ld a, [hl]
	and $1
	jp nz, Func_55012
	ld c, $0
Func_54ffa: ; 54ffa (15:4ffa)
	ld a, c
	cp $6
	jp nc, Func_55012
	ld e, c
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld [hl], a
	inc c
	jp Func_54ffa

Func_55012: ; 55012 (15:5012)
	pop af
	ld hl, sp+$31
	ld [hl], a
	read_hl_from_sp_plus $1e
	push hl
	read_hl_from_sp_plus $43
	pop de
	add hl, de
	write_hl_to_sp_plus $41
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $47
	pop de
	add hl, de
	write_hl_to_sp_plus $45
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $4c
	pop de
	add hl, de
	write_hl_to_sp_plus $4a
	read_hl_from_sp_plus $2b
	push hl
	read_hl_from_sp_plus $50
	pop de
	add hl, de
	write_hl_to_sp_plus $4e
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $4e
	pop de
	add hl, de
	write_hl_to_sp_plus $4c
	ld hl, $0
	write_hl_to_sp_plus $50
	pop bc
	ld hl, sp+$51
	ld [hl], c
	read_hl_from_sp_plus $3f
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_55084
	ld hl, 999
	write_hl_to_sp_plus $3f
Func_55084: ; 55084 (15:5084)
	read_hl_from_sp_plus $43
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_5509c
	ld hl, 999
	write_hl_to_sp_plus $43
Func_5509c: ; 5509c (15:509c)
	read_hl_from_sp_plus $48
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_550b4
	ld hl, 999
	write_hl_to_sp_plus $48
Func_550b4: ; 550b4 (15:50b4)
	read_hl_from_sp_plus $4c
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_550cc
	ld hl, 999
	write_hl_to_sp_plus $4c
Func_550cc: ; 550cc (15:50cc)
	read_hl_from_sp_plus $4a
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_550e4
	ld hl, 999
	write_hl_to_sp_plus $4a
Func_550e4: ; 550e4 (15:50e4)
	read_hl_from_sp_plus $3d
	push hl
	read_hl_from_sp_plus $41
	pop de
	call CompareHLtoDE
	jp nc, Func_550fc
	read_hl_from_sp_plus $3f
	write_hl_to_sp_plus $3d
Func_550fc: ; 550fc (15:50fc)
	read_hl_from_sp_plus $41
	push hl
	read_hl_from_sp_plus $45
	pop de
	call CompareHLtoDE
	jp nc, Func_55114
	read_hl_from_sp_plus $43
	write_hl_to_sp_plus $41
Func_55114: ; 55114 (15:5114)
	set_farcall_addrs_hli StackGetRobotInParty
	ld hl, sp+$2f
	reg16swap de, hl
	ld a, [wc2e9]
	call FarCall
	add sp, $52
	ret

Func_5512e: ; 5512e (15:512e)
	push hl
	push de
	push bc
Func_55131: ; 55131 (15:5131)
	read_hl_from wc312
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_551a7
	read_hl_from wc312
	ld de, $64
	call CompareHLtoDE
	jp c, Func_5516c
	call GetHLAtSPPlus6
	ld de, $64
	add hl, de
	call WriteHLToSPPlus6
	read_hl_from wc312
	ld de, hBGP
	add hl, de
	write_hl_to wc312
	jp Func_551a7

Func_5516c: ; 5516c (15:516c)
	read_hl_from wc312
	ld de, $a
	call CompareHLtoDE
	jp c, Func_55195
	call GetHLAtSPPlus6
	ld de, $a
	add hl, de
	call WriteHLToSPPlus6
	read_hl_from wc312
	ld de, -10
	add hl, de
	write_hl_to wc312
	jp Func_551a7

Func_55195: ; 55195 (15:5195)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	read_hl_from wc312
	dec hl
	write_hl_to wc312
Func_551a7: ; 551a7 (15:51a7)
	read_hl_from wc314
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_5521d
	read_hl_from wc314
	ld de, $64
	call CompareHLtoDE
	jp c, Func_551e2
	call GetHLAtSPPlus4
	ld de, $64
	add hl, de
	call WriteHLToSPPlus4
	read_hl_from wc314
	ld de, hBGP
	add hl, de
	write_hl_to wc314
	jp Func_5521d

Func_551e2: ; 551e2 (15:51e2)
	read_hl_from wc314
	ld de, $a
	call CompareHLtoDE
	jp c, Func_5520b
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	call WriteHLToSPPlus4
	read_hl_from wc314
	ld de, -10
	add hl, de
	write_hl_to wc314
	jp Func_5521d

Func_5520b: ; 5520b (15:520b)
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	read_hl_from wc314
	dec hl
	write_hl_to wc314
Func_5521d: ; 5521d (15:521d)
	push bc
	ld a, c
	add a
	add a
	add $d
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$2
	ld a, [wc2e9]
	ld d, a
	add a
	add d
	inc a
	ld [hl], a
	call GetHLAtSPPlus8
	ld c, l
	ld b, h
	ld de, $3
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_2230
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	ld de, $3
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	inc hl
	call Func_2230
	ld l, $6
	push hl
	ld c, $3
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld a, [hl]
	call PushBGMapRegion
	pop bc
	pop bc
	read_hl_from wc312
	ld a, l
	or h
	jp nz, Func_5527c
	read_hl_from wc314
	ld a, l
	or h
	jp nz, Func_5527c
	jp Func_5527f

Func_5527c: ; 5527c (15:527c)
	jp Func_55131

Func_5527f: ; 5527f (15:527f)
	push bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	pop bc
	inc c
	dec c
	jp nz, Func_552d3
	call GetHLAtSPPlus6
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $c
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $10
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_55315

Func_552d3: ; 552d3 (15:52d3)
	call GetHLAtSPPlus6
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $e
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	push hl
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $12
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
Func_55315: ; 55315 (15:5315)
	call GetSRAMBank
	pop bc
	pop bc
	pop bc
	ret

Func_5531c::
	call Func_55439
	ret

Pointers_55320:
	dw Data_55326
	dw Data_55334
	dw $0

Data_55326:
	dstr "(おいおい! ひとりてﾞ)"

Data_55334:
	dstr "(たひﾞするつもりかい)?"

Pointers_55342:
	dw Data_55346
	dw $0

Data_55346:
	dstr "(そうこかﾞ いっはﾟいたﾞよ)"

Pointers_55357:
	dw Data_5535d
	dw Data_55370
	dw $0

Data_5535d:
	dstr "(たたかえる) ろほﾞほﾟん(かﾞ)"

Data_55370:
	dstr "(いなくなるよ)"

Pointers_55379:
	dw Data_5537d
	dw $0

Data_5537d:
	dstr "(ほかんしたよ)"

Pointers_55386:
	dw Data_5538a
	dw $0

Data_5538a:
	dstr "(そいつは えらへﾞないよ)!"

Func_5539a: ; 5539a (15:539a)
	push af
	ld hl, $64
	call malloc_Bank15
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld hl, $5
	push hl
	ld bc, $14
	ld de, $d
	ld hl, $0
	call Func_57e52
	pop bc
	set_farcall_addrs_hli PrintMapText_
	pop hl
	pop af
	push hl
	cp $4
	jp z, Func_5541c
	cp $3
	jp z, Func_5540e
	cp $2
	jp z, Func_55400
	cp $1
	jp z, Func_553f2
	or a
	jp nz, Func_55427
	ld c, BANK(Pointers_55320)
	ld de, Pointers_55320
	ld hl, $10e
	call FarCall
	jp Func_55427

Func_553f2: ; 553f2 (15:53f2)
	ld c, BANK(Pointers_55342)
	ld de, Pointers_55342
	ld hl, $10e
	call FarCall
	jp Func_55427

Func_55400: ; 55400 (15:5400)
	ld c, BANK(Pointers_55357)
	ld de, Pointers_55357
	ld hl, $10e
	call FarCall
	jp Func_55427

Func_5540e: ; 5540e (15:540e)
	ld c, BANK(Pointers_55379)
	ld de, Pointers_55379
	ld hl, $10e
	call FarCall
	jp Func_55427

Func_5541c: ; 5541c (15:541c)
	ld c, BANK(Pointers_55386)
	ld de, Pointers_55386
	ld hl, $10e
	call FarCall
Func_55427: ; 55427 (15:5427)
	pop hl
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	pop hl
	call free_Bank15
	ret

Func_55439: ; 55439 (15:5439)
	push hl
	push bc
	push bc
	push bc
	push bc
	call GetHLAtSPPlus10
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$0
	ld [hl], $ff
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, sp+$3
	ld [hl], $0
Func_55468: ; 55468 (15:5468)
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nc, Func_554cb
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], $ff
	ld hl, sp+$3
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_554c1
	ld hl, sp+$3
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_554c1
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], $1
Func_554c1: ; 554c1 (15:54c1)
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
	jp Func_55468

Func_554cb: ; 554cb (15:54cb)
	pop af
	call GetSRAMBank
	callba_hli Func_50d27
	push af
	callba_hli Func_7cd1
	ld l, a
	pop af
	cp $1
	jp nz, Func_554fd
	xor a
	call Func_5539a
	ld hl, $4000
	jp Func_555b0

Func_554fd: ; 554fd (15:54fd)
	ld a, l
	cp $aa
	jp nz, Func_5550e
	ld a, $1
	call Func_5539a
	ld hl, $4000
	jp Func_555b0

Func_5550e: ; 5550e (15:550e)
	ld c, $0
Func_55510: ; 55510 (15:5510)
	ld a, c
	cp $4
	jp nc, Func_55534
	ld hl, sp+$2
	ld a, [hl]
	cp c
	jp z, Func_55530
	ld e, c
	ld d, $0
	ld hl, sp+$3
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_55530
	ld hl, sp+$0
	ld [hl], $1
	jp Func_55534

Func_55530: ; 55530 (15:5530)
	inc c
	jp Func_55510

Func_55534: ; 55534 (15:5534)
	ld hl, sp+$0
	ld a, [hl]
	cp $ff
	jp nz, Func_55547
	ld a, $2
	call Func_5539a
	ld hl, $4000
	jp Func_555b0

Func_55547: ; 55547 (15:5547)
	set_farcall_addrs_hli Func_50f58
	ld e, $ff
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_5556a
	ld a, $4
	call Func_5539a
	ld hl, $4000
	jp Func_555b0

Func_5556a: ; 5556a (15:556a)
	set_farcall_addrs_hli TryGiveRobot
	ld c, $0
	ld e, $2
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	ld de, $b
	add hl, de
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	ld a, $3
	call Func_5539a
	ld hl, $8000
Func_555b0: ; 555b0 (15:55b0)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_555b6:
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	sub $2
	or h
	jp z, Func_55600
	ld a, l
	dec a
	or h
	jp z, Func_555ef
	ld a, l
	or h
	jp nz, Func_5560e
	set_farcall_addrs_hli Func_14c55
	ld hl, $0
	call FarCall
	jp Func_5560e

Func_555ef: ; 555ef (15:55ef)
	callba_hli Func_4c12c
	jp Func_5560e

Func_55600: ; 55600 (15:5600)
	callba_hli Func_69b86
Func_5560e: ; 5560e (15:560e)
	set_farcall_addrs_hli FadeInMap
	ld a, $1
	call FarCall
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld hl, $8000
	ret

StartMenu_PressA:
	push bc
	push hl
	ld hl, $8000
	call WriteHLToSPPlus4
	pop bc
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	sub $6
	or h
	jp z, .title
	ld a, l
	sub $5
	or h
	jp z, .save
	ld a, l
	sub $4
	or h
	jp z, .options
	ld a, l
	sub $3
	or h
	jp z, .data
	ld a, l
	sub $2
	or h
	jp z, .warehouse
	ld a, l
	dec a
	or h
	jp z, .belongings
	ld a, l
	or h
	jp nz, .return
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $1
	call FarCall
	call Func_3af6
	jp .return

.belongings: ; 55693 (15:5693)
	callba_hli MainMenuSubmenu_Belongings
	ld hl, $4000
	pop de
	push hl
	jp .return

.warehouse: ; 556a9 (15:56a9)
	callba_hli MainMenuSubmenu_Warehouse
	jp .return

.data: ; 556ba (15:56ba)
	callba_hli MainMenuSubmenu_Data
	jp .return

.options: ; 556cb (15:56cb)
	callba_hli MainMenuSubmenu_Options
	ld hl, $4000
	pop de
	push hl
	jp .return

.save: ; 556e1 (15:56e1)
	callba_hli MainMenuSubmenu_Save
	ld hl, $4000
	pop de
	push hl
	jp .return

.title: ; 556f7 (15:56f7)
	callba_hli MainMenuSubmenu_Title
	ld hl, $4000
	pop de
	push hl
.return: ; 5570a (15:570a)
	ld a, [wc317]
	or a
	jp nz, .exit_menu
	pop hl
	push hl
	jp .done

.exit_menu: ; 55716 (15:5716)
	ld hl, -1
.done: ; 55719 (15:5719)
	pop bc
	ret

Data_5571b:
	db $21, $01, $07, $1a, $00, $02, $07, $09

Func_55723:: ; 55723 (15:5723)
	ld a, [wSystemType]
	cp $ff
	jp z, .dmg_or_sgb
	cp $1
	jp z, .dmg_or_sgb
	cp $11
	jp nz, .quit
	set_farcall_addrs_hli Func_c7109
	ld c, $2
	ld de, $808
	ld hl, $2
	call FarCall
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	jp .quit

.dmg_or_sgb
	ld de, $8
	ld hl, Data_5571b
	call Func_2b83
.quit
	ret

Func_5575d:: ; 5575d (15:575d)
	push hl
	ld hl, -$3d6
	add hl, sp
	ld sp, hl
	ld hl, $3d6
	add hl, sp
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	set_farcall_addrs_hli GetRobotInParty
	ld hl, $386
	add hl, sp
	reg16swap de, hl
	ld a, [wc310]
	call FarCall
	call FillVisibleAreaWithBlankTile
	ld hl, $8
	push hl
	ld bc, $c
	ld de, $2
	ld hl, $8
	call Func_57e52
	pop bc
	ld hl, $8
	push hl
	ld bc, $b
	ld de, $a
	ld hl, $0
	call Func_57e52
	pop bc
	ld hl, $8
	push hl
	ld bc, $9
	ld de, $a
	ld hl, $b
	call Func_57e52
	pop bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, $388
	add hl, sp
	ld a, [hl]
	dec a
	ld e, a
	ld hl, $3ab
	add hl, sp
	call GetRobotOrTrainerBaseStats
	ld hl, wc310
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld e, [hl]
	ld hl, $370
	add hl, sp
	call Func_241f
	ld hl, $6
	push hl
	ld hl, $35e
	add hl, sp
	ld c, l
	ld b, h
	ld a, [wc310]
	ld e, a
	ld a, $3
	call Func_57ea2
	pop bc
	ld hl, $35c
	add hl, sp
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call Func_57e8d
	ld hl, $35c
	add hl, sp
	call FindFirstNonzero
	ld a, l
	sub $4
	or h
	jp nz, Func_5582b
	ld hl, Data_55bfe
	push hl
	call PlaceString
	pop bc
Func_5582b: ; 5582b (15:582b)
	pop af
	call GetSRAMBank
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, $3b0
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $6ea7
	add hl, de
	reg16swap de, hl
	ld hl, $35c
	add hl, sp
	ld bc, $7
	call FarCopyVideoData
	ld hl, Data_55c00
	push hl
	call PlaceString
	pop bc
	ld hl, $38f
	add hl, sp
	ld c, [hl]
	ld b, $0
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, Data_55c04
	push hl
	call PlaceString
	pop bc
	ld hl, $35c
	add hl, sp
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call Func_57e8d
	pop af
	call GetSRAMBank
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	read_hl_from_sp_plus $3aa
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, $6ef6
	add hl, de
	reg16swap de, hl
	ld hl, $35c
	add hl, sp
	ld bc, $5
	call FarCopyVideoData
	ld de, Data_55c06
	ld hl, $903
	call PlaceStringDEatCoordHL
	ld hl, $35c
	add hl, sp
	ld c, l
	ld b, h
	ld de, -1
	ld hl, -1
	call Func_57e8d
	pop af
	call GetSRAMBank
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld e, a
	push de
	ld hl, $3aa
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $3ff9
	add hl, de
	reg16swap de, hl
	ld hl, $35c
	add hl, sp
	call LiteralStringInTree
	ld e, $5
	ld a, $9
	call SetStringStartState
	ld hl, $35c
	add hl, sp
	push hl
	ld hl, Data_55c0c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	push de
	ld a, e
	call GetSRAMBank
	pop de
	ld hl, $386
	add hl, sp
	ld a, [hl]
	cp $ab
	jp c, Func_559c2
	ld hl, $386
	add hl, sp
	ld a, [hl]
	cp $af
	jp nc, Func_559c2
	push de
	ld hl, $388
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, $7b84
	add hl, de
	push hl
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop hl
	push hl
	reg16swap de, hl
	inc de
	ld hl, sp+$e
	ld bc, $350
	call CopyFromDEtoHL
	pop hl
	push hl
	inc hl
	push hl
	ld hl, $0
	call WriteHLToSPPlus8
	ld c, $0
	pop hl
Func_5595f: ; 5595f (15:595f)
	ld a, c
	cp $40
	jp nc, Func_5597b
	push hl
	ld a, [hl]
	or a
	jp nz, Func_55975
	call GetHLAtSPPlus8
	ld de, $10
	add hl, de
	call WriteHLToSPPlus8
Func_55975: ; 55975 (15:5975)
	inc c
	pop hl
	inc hl
	jp Func_5595f

Func_5597b: ; 5597b (15:597b)
	set_farcall_addrs_hli FixAndLoadPoncotPicWithTilemap
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	ld hl, sp+$4e
	reg16swap de, hl
	ld hl, $89b0
	call FarCall
	call WaitVideoTransfer
	pop hl
	ld a, [hl]
	pop de
	push af
	ld a, e
	call GetSRAMBank
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	ld hl, sp+$c
	reg16swap de, hl
	ld hl, $2
	call FarCall
	call WaitVideoTransfer
	pop af
	jp Func_55a26

Func_559c2: ; 559c2 (15:59c2)
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	push hl
	reg16swap de, hl
	ld hl, $388
	add hl, sp
	ld a, [hl]
	dec a
	ld bc, $89b0
	call DecompressRequestRoboponPic
	call WaitVideoTransfer
	set_farcall_addrs_hli Func_7c8a
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $2
	ld c, $2
	call FarCall
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli Func_615be
	ld hl, $386
	add hl, sp
	ld a, [hl]
	dec a
	call FarCall
Func_55a26: ; 55a26 (15:5a26)
	push af
	set_farcall_addrs_hli Func_613fc
	pop af
	ld e, a
	call FarCall
	call Func_55723
	call Func_1fbe
	call WaitVideoTransfer
	read_hl_from_sp_plus $396
	ld c, l
	ld b, h
	read_hl_from_sp_plus $394
	reg16swap de, hl
	ld hl, $10b
	call Func_57cf7
	read_hl_from_sp_plus $39a
	ld c, l
	ld b, h
	read_hl_from_sp_plus $398
	reg16swap de, hl
	ld hl, $10f
	call Func_57cf7
	ld de, Data_55c13
	ld hl, $10f
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $394
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $20c
	call Func_2230
	ld hl, Data_55c15
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $396
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	read_hl_from_sp_plus $398
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $210
	call Func_2230
	ld hl, Data_55c17
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $39a
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, $37e
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $39f
	add hl, bc
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_55ae2
	ld de, 999
Func_55ae2: ; 55ae2 (15:5ae2)
	push de
	ld de, Data_55c19
	ld hl, $c0b
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100c
	call Func_2230
	ld hl, $37f
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $3a1
	add hl, bc
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_55b13
	ld de, 999
Func_55b13: ; 55b13 (15:5b13)
	push de
	ld de, Data_55c21
	ld hl, $c0d
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $100e
	call Func_2230
	ld hl, $380
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $3a3
	add hl, bc
	reg16swap de, hl
	ld hl, 999
	call CompareHLtoDE
	jp nc, Func_55b44
	ld de, 999
Func_55b44: ; 55b44 (15:5b44)
	push de
	ld de, Data_55c2a
	ld hl, $c0f
	call PlaceStringDEatCoordHL
	pop bc
	ld de, $3
	ld hl, $1010
	call Func_2230
	ld hl, $3ae
	add hl, sp
	ld a, [hl]
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $38d
	add hl, sp
	ld l, [hl]
	ld h, a
	call Func_270a
	reg16swap de, hl
	ld hl, $38d
	add hl, sp
	ld a, [hl]
	cp $63
	jp nz, Func_55b8a
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	ld hl, sp+$6
	call PutLongFromStackToHL
	jp Func_55ba5

Func_55b8a: ; 55b8a (15:5b8a)
	reg16swap de, hl
	ld bc, $0
	push bc
	push hl
	read_hl_from_sp_plus $3a0
	ld bc, $0
	push bc
	push hl
	call SubtractLongsFromStack
	ld hl, sp+$6
	call PutLongFromStackToHL
Func_55ba5: ; 55ba5 (15:5ba5)
	ld e, $6
	ld a, $9
	call SetStringStartState
	ld hl, sp+$6
	call PutLongFromHLOnStack
	read_hl_from_sp_plus $3a0
	ld bc, $0
	push bc
	push hl
	call AddLongsFromStack
	ld hl, Data_55c32
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $8
	ld a, $b
	call SetStringStartState
	ld hl, sp+$2
	call PutLongFromHLOnStack
	ld hl, Data_55c3a
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	callba_hli WaitAorBButtonOverworld_17a44
	ld hl, $3d8
	add hl, sp
	ld sp, hl
	ret

Data_55bfe:
	dstr " "

Data_55c00:
	dstr ":LV"

Data_55c04:
	dstr " "

Data_55c06:
	dstr "タイフﾟ:"

Data_55c0c:
	dstr "CPU:%s"

Data_55c13:
	dstr "E"

Data_55c15:
	dstr "/"

Data_55c17:
	dstr "/"

Data_55c19:
	dstr "(こうけﾞき)"

Data_55c21:
	dstr "(ほﾞうきﾞょ)"

Data_55c2a:
	dstr "(すはﾞやさ)"

Data_55c32:
	dstr "E*P:%ld"

Data_55c3a:
	dstr "(あと)%d"

Func_55c41:
	push hl
	ld hl, $168
	call malloc_Bank15
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	pop de
	pop hl
	push de
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	sub $2
	or h
	jp z, Func_55ca8
	ld a, l
	dec a
	or h
	jp z, Func_55c94
	ld a, l
	or h
	jp nz, Func_55cb9
	set_farcall_addrs_hli Func_1488e
	ld hl, $0
	call FarCall
	jp Func_55cb9

Func_55c94: ; 55c94 (15:5c94)
	set_farcall_addrs_hli Func_152e4
	ld hl, $0
	call FarCall
	jp Func_55cb9

Func_55ca8: ; 55ca8 (15:5ca8)
	set_farcall_addrs_hli Func_148ae
	ld hl, $0
	call FarCall
Func_55cb9: ; 55cb9 (15:5cb9)
	pop de
	ld a, [wc317]
	or a
	jp nz, Func_55cd7
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call PopBGMapRegion
	pop hl
	call free_Bank15
	ld hl, $8000
	jp Func_55ce1

Func_55cd7: ; 55cd7 (15:5cd7)
	reg16swap de, hl
	call free_Bank15
	ld hl, -1
Func_55ce1: ; 55ce1 (15:5ce1)
	ret

Func_55ce2:
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	sub $2
	or h
	jp z, Func_55d44
	ld a, l
	dec a
	or h
	jp z, Func_55d1b
	ld a, l
	or h
	jp nz, Func_55d55
	set_farcall_addrs_hli Func_148ce
	ld hl, $0
	call FarCall
	jp Func_55d55

Func_55d1b: ; 55d1b (15:5d1b)
	set_farcall_addrs_hli DisplayPartyMenu_
	xor a
	call FarCall
	ld a, l
	and h
	inc a
	jp z, Func_55d41
	set_farcall_addrs_hli Func_148f4
	ld hl, $0
	call FarCall
Func_55d41: ; 55d41 (15:5d41)
	jp Func_55d55

Func_55d44: ; 55d44 (15:5d44)
	set_farcall_addrs_hli Func_1491a
	ld hl, $0
	call FarCall
Func_55d55: ; 55d55 (15:5d55)
	call Func_3af6
	ld hl, $8000
	ret

Func_55d5c:
	ld c, l
	ld b, h
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	sub $2
	or h
	jp z, Func_55dbe
	ld a, l
	dec a
	or h
	jp z, Func_55d95
	ld a, l
	or h
	jp nz, Func_55dcf
	set_farcall_addrs_hli Func_15304
	ld hl, $0
	call FarCall
	jp Func_55dcf

Func_55d95: ; 55d95 (15:5d95)
	set_farcall_addrs_hli DisplayPartyMenu_
	xor a
	call FarCall
	ld a, l
	and h
	inc a
	jp z, Func_55dbb
	set_farcall_addrs_hli Func_15330
	ld hl, $0
	call FarCall
Func_55dbb: ; 55dbb (15:5dbb)
	jp Func_55dcf

Func_55dbe: ; 55dbe (15:5dbe)
	set_farcall_addrs_hli Func_1535c
	ld hl, $0
	call FarCall
Func_55dcf: ; 55dcf (15:5dcf)
	call Func_3af6
	ld hl, $8000
	ret

Func_55dd6:: ; 55dd6 (15:5dd6)
	push hl
	add sp, -$24
	push de
	read_hl_from_sp_plus $28
	push hl
	read_hl_from_sp_plus $2a
	ld [hl], $81
	inc hl
	write_hl_to_sp_plus $2a
	set_farcall_addrs_hli Func_7dfc
	pop hl
	pop de
	push hl
	ld a, e
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld hl, sp+$9
	ld a, [hl]
	cp $a
	jp nc, Func_55e49
	set_farcall_addrs_hli Func_17975
	ld c, $1
	read_hl_from_sp_plus $28
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	call FarCall
	read_hl_from_sp_plus $28
	inc hl
	write_hl_to_sp_plus $28
	read_hl_from_sp_plus $28
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $28
	read_hl_from_sp_plus $28
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $28
	jp Func_55e7b

Func_55e49: ; 55e49 (15:5e49)
	set_farcall_addrs_hli Func_17975
	ld c, $2
	read_hl_from_sp_plus $28
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	call FarCall
	read_hl_from_sp_plus $28
	inc hl
	inc hl
	write_hl_to_sp_plus $28
	read_hl_from_sp_plus $28
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $28
Func_55e7b: ; 55e7b (15:5e7b)
	ld bc, $6
	ld hl, sp+$3
	push hl
	read_hl_from_sp_plus $2a
	pop de
	call CopyFromDEtoHL
	pop hl
	call FindFirstNonzero
	ld c, l
	ld b, h
	push bc
	read_hl_from_sp_plus $28
	call FindFirstNonzero
	ld c, l
	ld b, h
	read_hl_from_sp_plus $28
	add hl, bc
	write_hl_to_sp_plus $28
	pop bc
Func_55ea3: ; 55ea3 (15:5ea3)
	ld l, c
	ld h, b
	ld de, $a
	call CompareHLtoDE
	jp nc, Func_55ebd
	read_hl_from_sp_plus $26
	ld [hl], $90
	inc hl
	write_hl_to_sp_plus $26
	inc bc
	jp Func_55ea3

Func_55ebd: ; 55ebd (15:5ebd)
	read_hl_from_sp_plus $26
	ld [hl], $0
	read_hl_from_sp_plus $26
	reg16swap de, hl
	add sp, $26
	reg16swap de, hl
	ret

Func_55ed2:: ; 55ed2 (15:5ed2)
	push hl
	push de
	push bc
	ld a, $19
	ld [wFarCallDestBank], a
	push bc
	ld a, c
	cp $1
	jp z, Func_55ef5
	or a
	jp nz, Func_55f03
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	jp Func_55f03

Func_55ef5: ; 55ef5 (15:5ef5)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
Func_55f03: ; 55f03 (15:5f03)
	ld hl, $a
	push hl
	call GetHLAtSPPlus10
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld e, a
	ld a, $4
	call Func_57ea2
	pop bc
	call GetHLAtSPPlus8
	call FindFirstNonzero
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
Func_55f26: ; 55f26 (15:5f26)
	ld l, c
	ld h, b
	ld de, $9
	call CompareHLtoDE
	jp nc, Func_55f3e
	call GetHLAtSPPlus8
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus8
	inc bc
	jp Func_55f26

Func_55f3e: ; 55f3e (15:5f3e)
	call GetHLAtSPPlus8
	ld [hl], $80
	inc hl
	call WriteHLToSPPlus8
	set_farcall_addrs_hli Func_17975
	pop bc
	ld a, c
	cp $1
	jp z, Func_55f76
	or a
	jp nz, Func_55f8e
	ld c, $82
	call GetHLAtSPPlus6
	push hl
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call FarCall
	jp Func_55f8e

Func_55f76: ; 55f76 (15:5f76)
	ld c, $82
	call GetHLAtSPPlus6
	push hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld l, [hl]
	ld h, $0
	pop de
	call FarCall
Func_55f8e: ; 55f8e (15:5f8e)
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_55f95:: ; 55f95 (15:5f95)
	push hl
	push bc
	ld a, $19
	ld [wFarCallDestBank], a
	ld a, c
	cp $2
	jp z, Func_55fc5
	cp $1
	jp z, Func_55fb8
	or a
	jp nz, Func_55fc8
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	jp Func_55fc8

Func_55fb8: ; 55fb8 (15:5fb8)
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	jp Func_55fc8

Func_55fc5: ; 55fc5 (15:5fc5)
	ld hl, sp+$0
	ld [hl], e
Func_55fc8: ; 55fc8 (15:5fc8)
	ld hl, $8
	push hl
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	ld hl, sp+$2
	ld e, [hl]
	ld a, $2
	call Func_57ea2
	pop bc
	call GetHLAtSPPlus4
	call FindFirstNonzero
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	ld l, c
	ld h, b
	ld de, $7
	call CompareHLtoDE
	jp nc, Func_56015
Func_55ff4: ; 55ff4 (15:5ff4)
	ld l, c
	ld h, b
	ld de, $7
	call CompareHLtoDE
	jp nc, Func_5600c
	call GetHLAtSPPlus4
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus4
	inc bc
	jp Func_55ff4

Func_5600c: ; 5600c (15:600c)
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
Func_56015: ; 56015 (15:6015)
	call GetHLAtSPPlus4
	pop bc
	pop bc
	ret

Func_5601b:: ; 5601b (15:601b)
	push hl
	push bc
	push bc
	ld a, $19
	ld [wFarCallDestBank], a
	ld hl, sp+$2
	ld a, [hl]
	cp $5
	jp z, Func_5609d
	cp $3
	jp z, Func_5609d
	cp $2
	jp z, Func_56090
	cp $1
	jp nz, Func_560a3
	ld c, $0
	ld hl, sp+$0
	ld [hl], $0
Func_56040: ; 56040 (15:6040)
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nc, Func_5608d
	push bc
	push de
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	pop de
	pop bc
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp z, Func_56083
	ld a, c
	cp e
	jp nz, Func_56082
	jp Func_5608d

Func_56082: ; 56082 (15:6082)
	inc c
Func_56083: ; 56083 (15:6083)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_56040

Func_5608d: ; 5608d (15:608d)
	jp Func_560ad

Func_56090: ; 56090 (15:6090)
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
	jp Func_560ad

Func_5609d: ; 5609d (15:609d)
	ld hl, sp+$1
	ld [hl], e
	jp Func_560ad

Func_560a3: ; 560a3 (15:60a3)
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld e, [hl]
	ld hl, sp+$1
	ld [hl], e
Func_560ad: ; 560ad (15:60ad)
	ld hl, $5
	push hl
	call GetHLAtSPPlus8
	ld c, l
	ld b, h
	ld hl, sp+$3
	ld a, [hl]
	and $3f
	dec a
	ld e, a
	xor a
	call Func_57ea2
	pop bc
	call GetHLAtSPPlus6
	call FindFirstNonzero
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, Func_560e2
	ld hl, sp+$4
	ld a, [hl]
	cp $4
	jp nz, Func_560ee
Func_560e2: ; 560e2 (15:60e2)
	call GetHLAtSPPlus8
	ld [hl], $df
	inc hl
	call WriteHLToSPPlus8
	jp Func_560f7

Func_560ee: ; 560ee (15:60ee)
	call GetHLAtSPPlus8
	ld [hl], $99
	inc hl
	call WriteHLToSPPlus8
Func_560f7: ; 560f7 (15:60f7)
	set_farcall_addrs_hli Func_17975
	ld c, $81
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld b, $6
	call RightShiftHL
	inc hl
	call FarCall
	call GetHLAtSPPlus8
	inc hl
	call WriteHLToSPPlus8
	ld hl, sp+$2
	ld [hl], $0
	pop bc
Func_56125: ; 56125 (15:6125)
	ld de, $4
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_5614c
	call GetHLAtSPPlus6
	ld [hl], $90
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_56125

Func_5614c: ; 5614c (15:614c)
	call GetHLAtSPPlus6
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_5615c:: ; 5615c (15:615c)
	ld de, Data_56166
	ld hl, $10c
	call PlaceStringDEatCoordHL
	ret

Data_56166:
	dstr "(のこり)RAM"

Func_5616f:
	ld c, l
	ld b, h
	push bc
	ld l, $9
	push hl
	ld c, $7
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop bc
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld [wc2e9], a
	ld a, [wc2e9]
	cp $3
	jp z, Func_561aa
	cp $2
	jp z, Func_561aa
	cp $1
	jp z, Func_561aa
	or a
	jp nz, Func_561b9
Func_561aa: ; 561aa (15:61aa)
	call Func_1fbe
	call Func_1f30
	call Func_561bd
	call Func_1f7b
	call Func_2009
Func_561b9: ; 561b9 (15:61b9)
	ld hl, $8000
	ret

Func_561bd: ; 561bd (15:61bd)
	set_farcall_addrs_hli Func_1480e
	ld hl, $0
	call FarCall
	ret

Func_561cf:
	push hl
	ld hl, $168
	call malloc_Bank15
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call BackUpTileMapRectangle
	pop de
	pop bc
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld a, [wc2e9]
	push af
	push de
	ld hl, $5
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	dec a
	or h
	jp z, Func_56273
	ld a, l
	or h
	jp nz, Func_562d3
	ld a, [wc2e9]
	cp $3
	jp z, Func_5625f
	cp $2
	jp z, Func_5624b
	cp $1
	jp z, Func_56237
	or a
	jp nz, Func_56270
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $2
	call FarCall
	jp Func_56270

Func_56237: ; 56237 (15:6237)
	set_farcall_addrs_hli Func_14aa4
	ld hl, $0
	call FarCall
	jp Func_56270

Func_5624b: ; 5624b (15:624b)
	set_farcall_addrs_hli Func_14a84
	ld hl, $0
	call FarCall
	jp Func_56270

Func_5625f: ; 5625f (15:625f)
	set_farcall_addrs_hli Func_14ac4
	ld hl, $0
	call FarCall
Func_56270: ; 56270 (15:6270)
	jp Func_562d3

Func_56273: ; 56273 (15:6273)
	ld a, [wc2e9]
	cp $3
	jp z, Func_562c2
	cp $2
	jp z, Func_562ae
	cp $1
	jp z, Func_5629a
	or a
	jp nz, Func_562d3
	callba_hli Func_147e8
	jp Func_562d3

Func_5629a: ; 5629a (15:629a)
	set_farcall_addrs_hli Func_14ae4
	ld hl, $0
	call FarCall
	jp Func_562d3

Func_562ae: ; 562ae (15:62ae)
	set_farcall_addrs_hli Func_14b04
	ld hl, $0
	call FarCall
	jp Func_562d3

Func_562c2: ; 562c2 (15:62c2)
	set_farcall_addrs_hli Func_14b24
	ld hl, $0
	call FarCall
Func_562d3: ; 562d3 (15:62d3)
	pop de
	push de
	ld c, e
	ld b, d
	ld de, $1412
	ld hl, $0
	call PopBGMapRegion
	pop hl
	call free_Bank15
	pop af
	ld [wc2e9], a
	ld hl, $8000
	ret

Func_562ec:
	push hl
	add sp, -$18
	ld hl, sp+$18
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	pop hl
	push hl
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli Func_52326
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	cp $ff
	jp nz, Func_56340
	ld hl, -1
	jp Func_5664b

Func_56340: ; 56340 (15:6340)
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld c, a
	ld de, -1
	ld hl, sp+$3
	ld a, [hl]
	cp $b
	jp z, Func_56481
	cp $a
	jp z, Func_56423
	cp $9
	jp z, Func_563c3
	cp $7
	jp nz, Func_564dc
	ld a, [wc9a2]
	or a
	jp nz, Func_56374
	ld a, c
	call GetSRAMBank
	ld hl, -1
	jp Func_5664b

Func_56374: ; 56374 (15:6374)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc98e
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld a, c
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ec2b
	ld e, $2
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld l, a
	ld h, $0
	reg16swap de, hl
	push de
	ld a, e
	dec a
	or d
	jp nz, Func_563bf
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld c, a
	push bc
	ld c, $0
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	call Func_5601b
	pop bc
	ld a, c
	call GetSRAMBank
Func_563bf: ; 563bf (15:63bf)
	pop de
	jp Func_564dc

Func_563c3: ; 563c3 (15:63c3)
	ld a, [wc9b7]
	or a
	jp nz, Func_563d4
	ld a, c
	call GetSRAMBank
	ld hl, -1
	jp Func_5664b

Func_563d4: ; 563d4 (15:63d4)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc9a3
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld a, c
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ed70
	ld e, $2
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	ld l, a
	ld h, $0
	reg16swap de, hl
	push de
	ld a, e
	dec a
	or d
	jp nz, Func_5641f
	ld de, $19
	ld a, $3
	call GetBanks_15
	ld c, a
	push bc
	ld c, $0
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	call Func_55f95
	pop bc
	ld a, c
	call GetSRAMBank
Func_5641f: ; 5641f (15:641f)
	pop de
	jp Func_564dc

Func_56423: ; 56423 (15:6423)
	ld a, [wc9a2]
	cp $14
	jp nc, Func_56478
	push bc
	ld c, $2
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$7
	call Func_5601b
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveBlock4
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop bc
	ld a, c
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ec2b
	ld e, $3
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	ld l, a
	ld h, $0
	reg16swap de, hl
	jp Func_5647e

Func_56478: ; 56478 (15:6478)
	push de
	ld a, c
	call GetSRAMBank
	pop de
Func_5647e: ; 5647e (15:647e)
	jp Func_564dc

Func_56481: ; 56481 (15:6481)
	ld a, [wc9b7]
	cp $14
	jp nc, Func_564d6
	push bc
	ld c, $1
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$7
	call Func_55f95
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveBlock3
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop bc
	ld a, c
	call GetSRAMBank
	set_farcall_addrs_hli Func_4ed70
	ld e, $3
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	ld l, a
	ld h, $0
	reg16swap de, hl
	jp Func_564dc

Func_564d6: ; 564d6 (15:64d6)
	push de
	ld a, c
	call GetSRAMBank
	pop de
Func_564dc: ; 564dc (15:64dc)
	push de
	ld hl, $64
	call malloc_Bank15
	pop de
	push hl
	push de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop de
	push de
	ld a, e
	dec a
	or d
	jp nz, Func_56548
	ld hl, $5
	push hl
	ld bc, $14
	ld de, $d
	ld hl, $0
	call Func_57e52
	pop bc
	ld hl, sp+$9
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call Func_57e8d
	ld hl, sp+$7
	ld a, [hl]
	cp $b
	jp z, Func_56530
	cp $a
	jp nz, Func_5653c
Func_56530: ; 56530 (15:6530)
	ld de, Data_56656
	ld hl, -1
	call PlaceStringDEatCoordHL
	jp Func_56545

Func_5653c: ; 5653c (15:653c)
	ld de, Data_56662
	ld hl, -1
	call PlaceStringDEatCoordHL
Func_56545: ; 56545 (15:6545)
	jp Func_5657b

Func_56548: ; 56548 (15:6548)
	ld hl, $5
	push hl
	ld bc, $14
	ld de, $d
	ld hl, $0
	call Func_57e52
	pop bc
	ld hl, sp+$7
	ld a, [hl]
	cp $b
	jp z, Func_56566
	cp $a
	jp nz, Func_56572
Func_56566: ; 56566 (15:6566)
	ld de, Data_5666d
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_5657b

Func_56572: ; 56572 (15:6572)
	ld de, Data_56680
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_5657b: ; 5657b (15:657b)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop de
	push de
	ld a, e
	dec a
	or d
	jp nz, Func_56625
	xor a
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	cp $b
	jp z, Func_565f9
	cp $a
	jp z, Func_565e3
	cp $9
	jp z, Func_565cd
	cp $7
	jp nz, Func_5660c
	set_farcall_addrs_hli Func_4ec2b
	ld e, $1
	ld hl, sp+$8
	ld a, [hl]
	call FarCall
	jp Func_5660c

Func_565cd: ; 565cd (15:65cd)
	set_farcall_addrs_hli Func_4ed70
	ld e, $1
	ld hl, sp+$8
	ld a, [hl]
	call FarCall
	jp Func_5660c

Func_565e3: ; 565e3 (15:65e3)
	set_farcall_addrs_hli Func_4ec2b
	ld e, $0
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	jp Func_5660c

Func_565f9: ; 565f9 (15:65f9)
	set_farcall_addrs_hli Func_4ed70
	ld e, $0
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
Func_5660c: ; 5660c (15:660c)
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_56625: ; 56625 (15:6625)
	call WaitAorBButtonOverworld_57ec5
	pop de
	pop hl
	push de
	push hl
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
	pop hl
	call free_Bank15
	pop de
	ld a, e
	and d
	inc a
	jp nz, Func_56648
	ld hl, -1
	jp Func_5664b

Func_56648: ; 56648 (15:6648)
	ld hl, $8000
Func_5664b: ; 5664b (15:664b)
	reg16swap de, hl
	add sp, $1a
	reg16swap de, hl
	ret

Data_56656:
	dstr "(を ひきたﾞしたよ)"

Data_56662:
	dstr "(を ほかんしたよ)"

Data_5666d:
	dstr "(これいしﾞょう ひきたﾞせないよ)"

Data_56680:
	dstr "(これいしﾞょう ほかんてﾞきないよ)"

StartMenu_DrawMenu:
	push hl
	set_farcall_addrs_hli Func_fbbb5
	pop hl
	call FarCall
	ld hl, $4000
	ret

Func_566a8:
	ret

Data_566a9::
	db $00, $00, $10, $07, $05, $01, $50, $05, $00, $00, $05, $c2, $51, $15, $35, $73, $05, $3f, $74, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $ce, $66, $dd, $66, $ec, $66, $28, $bc, $ad, $bc, $de, $dd, $ba, $b3, $c9, $29, $c3, $de, $b0, $c0, $00, $db, $ce, $de, $ce, $df, $dd, $c3, $de, $b0, $c0, $cc, $a7, $b2, $d9, $00, $ca, $de, $c4, $d9, $bc, $de, $aa, $c8, $bc, $bd, $35, $28, $be, $b2, $be, $b7, $29, $00

Func_566fe:: ; 566fe (15:66fe)
	add sp, -$6a
	check_cgb
	jp nz, Func_5671e
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_56732

Func_5671e: ; 5671e (15:671e)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_56732: ; 56732 (15:6732)
	ld hl, $4
	push hl
	ld bc, $c
	ld de, $4
	ld hl, $0
	call Func_57e52
	pop bc
	ld hl, $7
	push hl
	ld bc, $8
	ld de, $a
	ld hl, $0
	call Func_57e52
	pop bc
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, wc310
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $1d
	add hl, de
	ld e, [hl]
	push de
	ld hl, wc310
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$3e
	call GetRobotOrTrainerBaseStats
	read_hl_from_sp_plus $43
	pop de
	pop af
	push de
	push hl
	push af
	ld hl, $6
	push hl
	ld hl, sp+$c
	ld c, l
	ld b, h
	ld a, [wc310]
	ld e, a
	ld a, $3
	call Func_57ea2
	pop bc
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $1
	ld hl, $1
	call Func_57e8d
	ld hl, sp+$a
	call FindFirstNonzero
	ld a, l
	sub $4
	or h
	jp nz, Func_567d1
	ld hl, Data_56981
	push hl
	call PlaceString
	pop bc
Func_567d1: ; 567d1 (15:67d1)
	ld hl, Data_56983
	push hl
	call PlaceString
	pop bc
	pop af
	call GetSRAMBank
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	ld hl, wc310
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $b
	add hl, de
	ld a, [hl]
	push af
	ld e, a
	ld hl, sp+$2a
	call Func_241f
	pop af
	ld e, a
	ld hl, sp+$a
	ld c, $2
	call Func_55f95
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld de, $5
	ld hl, $1
	call Func_57e8d
	pop af
	call GetSRAMBank
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	set_farcall_addrs_hli Func_16104
	ld e, $0
	ld a, [wc310]
	call FarCall
	ld hl, sp+$7
	ld [hl], a
	ld e, $1
	ld a, [wc310]
	call FarCall
	ld hl, sp+$8
	ld [hl], a
	ld e, $2
	ld a, [wc310]
	call FarCall
	ld hl, sp+$9
	ld [hl], a
	ld a, $19
	ld [wFarCallDestBank], a
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_5686e
	ld de, Data_56985
	ld hl, $10b
	call PlaceStringDEatCoordHL
	jp Func_568b9

Func_5686e: ; 5686e (15:686e)
	ld hl, sp+$6
	ld [hl], $0
Func_56872: ; 56872 (15:6872)
	ld hl, sp+$6
	ld a, [hl]
	cp $3
	jp nc, Func_568b9
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_568af
	ld c, $5
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld e, [hl]
	ld hl, sp+$a
	call Func_5601b
	ld hl, sp+$a
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $b
	add hl, de
	reg16swap de, hl
	ld hl, $1
	call Func_57e8d
Func_568af: ; 568af (15:68af)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_56872

Func_568b9: ; 568b9 (15:68b9)
	pop af
	call GetSRAMBank
	pop hl
	pop de
	inc l
	dec l
	jp nz, Func_568d0
	ld de, Data_5698d
	ld hl, $701
	call PlaceStringDEatCoordHL
	jp Func_56902

Func_568d0: ; 568d0 (15:68d0)
	ld a, e
	cp l
	jp nc, Func_568f9
	push de
	push hl
	ld de, Data_56996
	ld hl, $701
	call PlaceStringDEatCoordHL
	pop hl
	pop de
	ld h, $0
	ld d, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	ld hl, Data_569a1
	push hl
	call PlaceString
	pop bc
	pop bc
	jp Func_56902

Func_568f9: ; 568f9 (15:68f9)
	ld de, Data_569a4
	ld hl, $701
	call PlaceStringDEatCoordHL
Func_56902: ; 56902 (15:6902)
	ld de, Data_569ac
	ld hl, $103
	call PlaceStringDEatCoordHL
	ld hl, sp+$31
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld c, a
	ld b, $0
	ld de, $3
	ld hl, $706
	call Func_2230
	ld hl, Data_569b1
	push hl
	call PlaceString
	pop bc
	ld de, Data_569b3
	ld hl, $c03
	call PlaceStringDEatCoordHL
	ld hl, sp+$32
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_569bc
	ld hl, $c05
	call PlaceStringDEatCoordHL
	ld hl, sp+$33
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_569c6
	ld hl, $c07
	call PlaceStringDEatCoordHL
	ld hl, sp+$34
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_569cf
	ld hl, $109
	call PlaceStringDEatCoordHL
	ld de, Data_569d3
	ld hl, $909
	call PlaceStringDEatCoordHL
	add sp, $6a
	ret

Data_56981:
	dstr " "

Data_56983:
	dstr ":"

Data_56985:
	dstr "ソフト(なし)"

Data_5698d:
	dstr "(しんかしない)"

Data_56996:
	dstr "(しんかする あと)"

Data_569a1:
	dstr "%d"

Data_569a4:
	dstr "(ひかってる)"

Data_569ac:
	dstr "ハﾟーツ"

Data_569b1:
	dstr "M"

Data_569b3:
	dstr "(こうけﾞき )"

Data_569bc:
	dstr "(ほﾞうきﾞょ )"

Data_569c6:
	dstr "(すはﾞやさ )"

Data_569cf:
	dstr "ソフト"

Data_569d3:
	dstr "(わさﾞ)"

Func_569d9:: ; 569d9 (15:69d9)
	push hl
	add sp, -$1c
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	read_hl_from_sp_plus $20
	ld de, wc9a3
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld e, $0
	ld c, e
	ld hl, sp+$2
	ld [hl], c
	ld hl, sp+$3
	ld [hl], c
	ld a, [wc9b7]
	or a
	jp z, Func_56a21
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	call Func_241f
	ld hl, sp+$15
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$16
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$17
	ld c, [hl]
	ld hl, sp+$14
	ld a, [hl]
	add a
	ld d, a
	add a
	add a
	add d
	ld e, a
Func_56a21: ; 56a21 (15:6a21)
	pop af
	push de
	push bc
	call GetSRAMBank
	ld hl, $8
	push hl
	ld bc, $a
	ld de, $a
	ld hl, $a
	call Func_57e52
	pop bc
	ld de, Data_56a9c
	ld hl, $b0b
	call PlaceStringDEatCoordHL
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_56aa5
	ld hl, $b0d
	call PlaceStringDEatCoordHL
	ld hl, sp+$4
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_56aaf
	ld hl, $b0f
	call PlaceStringDEatCoordHL
	pop bc
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld de, Data_56ab8
	ld hl, $b10
	call PlaceStringDEatCoordHL
	pop de
	ld c, e
	ld b, $0
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_56abd
	push hl
	call PlaceString
	pop bc
	add sp, $1e
	ret

Data_56a9c:
	dstr "(こうけﾞき )"

Data_56aa5:
	dstr "(ほﾞうきﾞょ )"

Data_56aaf:
	dstr "(すはﾞやさ )"

Data_56ab8:
	dstr "RAM:"

Data_56abd:
	dstr "M"

Func_56abf:: ; 56abf (15:6abf)
	push hl
	add sp, -$18
	ld de, $19
	ld a, $3
	call GetBanks_15
	push af
	read_hl_from_sp_plus $1c
	ld de, wc9a3
	add hl, de
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $1c
	read_hl_from_sp_plus $1c
	ld e, l
	ld hl, sp+$2
	call Func_241f
	pop af
	call GetSRAMBank
	ld hl, sp+$10
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $607
	call Func_2230
	ld hl, sp+$11
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $609
	call Func_2230
	ld hl, sp+$12
	ld c, [hl]
	ld b, $0
	ld de, $3
	ld hl, $60b
	call Func_2230
	ld hl, sp+$f
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
	ld de, $3
	ld hl, $50d
	call Func_2230
	ld hl, Data_56b33
	push hl
	call PlaceString
	pop bc
	add sp, $1a
	ret

Data_56b33:
	dstr "M"

Func_56b35:: ; 56b35 (15:6b35)
	push af
	callba_hli AllocateMonsterStruct
	set_farcall_addrs_hli Func_dbf5
	ld c, $0
	ld a, [wc310]
	ld e, a
	xor a
	call FarCall
	pop af
	or a
	jp nz, Func_56b77
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_54384)
	ld de, Data_54384
	ld hl, Data_54365
	call FarCall
	jp Func_56b8d

Func_56b77: ; 56b77 (15:6b77)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_54393)
	ld de, Data_54393
	ld hl, Data_54365
	call FarCall
Func_56b8d: ; 56b8d (15:6b8d)
	callba_hli FreeMonsterStruct
	ret


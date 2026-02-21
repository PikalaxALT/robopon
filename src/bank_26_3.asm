INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 26, 3", ROMX

Func_9a174:
	push af
	ldh a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, .asm_9a193
	ld a, l
	and $7f
	call FarCall
	jp .asm_9a199
.asm_9a193:
	ld a, l
	or $80
	call FarCall
.asm_9a199:
	ret

Func_9a19a:
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	jp FarCall

Func_9a1aa:
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

LandmarkSign::
	push hl
	add sp, -$40
	ld hl, sp+$40
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3f
	ld hl, -1
	write_hl_to_sp_plus $41
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_9a377
	call Func_9a391
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, sp+$3d
	call PrintCharacterFromTree
	ld hl, sp+$1
	call Func_292b
	add $2
	ld l, a
	push hl
	ld a, $14
	sub l
	ld b, $2
	call DivideAbyB
	push af
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_da901
	pop af
	pop hl
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	inc hl
	call FarCall
	push hl
	ld c, $5
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	ld hl, sp+$4
	ld [hl], $0
Func_9a236:
	ld hl, sp+$4
	ld a, [hl]
	cp $3c
	jp nc, Func_9a25d
	call NextOverworldFrame
	ld hl, sp+$4
	ld a, [hl]
	cp $10
	jp c, Func_9a253
	call GetJoyPressed
	or a
	jp z, Func_9a253
	jp Func_9a25d

Func_9a253:
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp Func_9a236

Func_9a25d:
	callba_hli Func_8f44
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	add sp, $42
	ret

Func_9a28c::
	push hl
	add sp, -$3e
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_9a377
	call Func_9a391
	ld de, Data_9a36c
	ld hl, sp+$1
	call CopyUntilNull
	ld hl, sp+$0
	ld [hl], $0
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2bc
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a2e4
Func_9a2bc:
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$5
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a2e4:
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2fa
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a322
Func_9a2fa:
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a322:
	read_hl_from_sp_plus $40
	ld de, $30
	add hl, de
	ld e, l
	ld hl, sp+$7
	ld [hl], e
	ld c, $5
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	xor a
Func_9a33e:
	cp $3c
	jp nc, Func_9a34c
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_9a33e

Func_9a34c:
	callba_hli Func_8f44
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	add sp, $40
	ret

Data_9a36c:
	dstr "(ちか   0かい)"

Func_9a377:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_9a384:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_9a391:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

CheckObjectsOccupyingSameTile::
	push af
	push de
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld a, $1
	jp Func_9a41a

Func_9a419:
	xor a
Func_9a41a:
	pop bc
	pop bc
	ret

Func_9a41d:: ; 9a41d
	push bc ; 9A41D (26:641d) -> C5
	ld a, [wOverworldTilemapSelector] ; 9A41E (26:641e) -> FA CD C2
	or a ; 9A421 (26:6421) -> B7
	jp z, label_9a42a ; 9A422 (26:6422) -> CA 2A 64
	ld a, $98 ; 9A425 (26:6425) -> 3E 98
	jp label_9a42c ; 9A427 (26:6427) -> C3 2C 64
label_9a42a:
	ld a, $9c ; 9A42A (26:642a) -> 3E 9C
label_9a42c:
	ld [wBGMapHi], a ; 9A42C (26:642c) -> EA 10 C2
	ld a, [wBGMapHi] ; 9A42F (26:642f) -> FA 10 C2
	cp $98 ; 9A432 (26:6432) -> FE 98
	jp nz, label_9a43d ; 9A434 (26:6434) -> C2 3D 64
	ld bc, $9800 ; 9A437 (26:6437) -> 01 00 98
	jp label_9a440 ; 9A43A (26:643a) -> C3 40 64
label_9a43d:
	ld bc, $9c00 ; 9A43D (26:643d) -> 01 00 9C
label_9a440:
	ld a, [wSCX] ; 9A440 (26:6440) -> FA 0C C2
	add a, $f0 ; 9A443 (26:6443) -> C6 F0
	rrca  ; 9A445 (26:6445) -> 0F
	rrca  ; 9A446 (26:6446) -> 0F
	rrca  ; 9A447 (26:6447) -> 0F
	and $1f ; 9A448 (26:6448) -> E6 1F
	ld e, a ; 9A44A (26:644a) -> 5F
	ld a, [wSCY] ; 9A44B (26:644b) -> FA 0E C2
	add a, $f0 ; 9A44E (26:644e) -> C6 F0
	rrca  ; 9A450 (26:6450) -> 0F
	rrca  ; 9A451 (26:6451) -> 0F
	rrca  ; 9A452 (26:6452) -> 0F
	and $1f ; 9A453 (26:6453) -> E6 1F
	ld l, a ; 9A455 (26:6455) -> 6F
	ld h, $00 ; 9A456 (26:6456) -> 26 00
	add hl, hl ; 9A458 (26:6458) -> 29
	add hl, hl ; 9A459 (26:6459) -> 29
	add hl, hl ; 9A45A (26:645a) -> 29
	add hl, hl ; 9A45B (26:645b) -> 29
	add hl, hl ; 9A45C (26:645c) -> 29
	ld d, $00 ; 9A45D (26:645d) -> 16 00
	add hl, de ; 9A45F (26:645f) -> 19
	add hl, bc ; 9A460 (26:6460) -> 09
	ld c, l ; 9A461 (26:6461) -> 4D
	ld b, h ; 9A462 (26:6462) -> 44
	ld hl, sp+$00 ; 9A463 (26:6463) -> F8 00
	ld [hl], $00 ; 9A465 (26:6465) -> 36 00
label_9a467:
	ld hl, sp+$00 ; 9A467 (26:6467) -> F8 00
	ld a, [hl] ; 9A469 (26:6469) -> 7E
	cp $0b ; 9A46A (26:646a) -> FE 0B
	jp nc, label_9a4fd ; 9A46C (26:646c) -> D2 FD 64
	push bc ; 9A46F (26:646f) -> C5
	ld l, c ; 9A470 (26:6470) -> 69
	ld h, b ; 9A471 (26:6471) -> 60
	ld e, c ; 9A472 (26:6472) -> 59
	ld d, b ; 9A473 (26:6473) -> 50
	ld c, $00 ; 9A474 (26:6474) -> 0E 00
label_9a476:
	ld a, c ; 9A476 (26:6476) -> 79
	cp $0c ; 9A477 (26:6477) -> FE 0C
	jp nc, label_9a4d6 ; 9A479 (26:6479) -> D2 D6 64
	push de ; 9A47C (26:647c) -> D5
	push bc ; 9A47D (26:647d) -> C5
	set_farcall_addrs_hli Func_9eb4
	pop bc ; 9A489 (26:6489) -> C1
	pop de ; 9A48A (26:648a) -> D1
	push bc ; 9A48B (26:648b) -> C5
	push de ; 9A48C (26:648c) -> D5
	ld a, [wMapY] ; 9A48D (26:648d) -> FA D9 C2
	ld hl, sp+$06 ; 9A490 (26:6490) -> F8 06
	add a, [hl] ; 9A492 (26:6492) -> 86
	dec a ; 9A493 (26:6493) -> 3D
	ld e, a ; 9A494 (26:6494) -> 5F
	ld a, [wMapX] ; 9A495 (26:6495) -> FA D8 C2
	add a, c ; 9A498 (26:6498) -> 81
	dec a ; 9A499 (26:6499) -> 3D
	call FarCall ; 9A49A (26:649a) -> CD F8 03
	ld c, l ; 9A49D (26:649d) -> 4D
	ld b, h ; 9A49E (26:649e) -> 44
	pop de ; 9A49F (26:649f) -> D1
	push de ; 9A4A0 (26:64a0) -> D5
	ld a, [bc] ; 9A4A1 (26:64a1) -> 0A
	inc bc ; 9A4A2 (26:64a2) -> 03
	ld [de], a ; 9A4A3 (26:64a3) -> 12
	inc de ; 9A4A4 (26:64a4) -> 13
	ld a, [bc] ; 9A4A5 (26:64a5) -> 0A
	inc bc ; 9A4A6 (26:64a6) -> 03
	ld [de], a ; 9A4A7 (26:64a7) -> 12
	inc de ; 9A4A8 (26:64a8) -> 13
	ld hl, $001e ; 9A4A9 (26:64a9) -> 21 1E 00
	add hl, de ; 9A4AC (26:64ac) -> 19
	push de ; 9A4AD (26:64ad) -> D5
	push hl ; 9A4AE (26:64ae) -> E5
	pop de ; 9A4AF (26:64af) -> D1
	pop hl ; 9A4B0 (26:64b0) -> E1
	ld a, [bc] ; 9A4B1 (26:64b1) -> 0A
	inc bc ; 9A4B2 (26:64b2) -> 03
	ld [de], a ; 9A4B3 (26:64b3) -> 12
	inc de ; 9A4B4 (26:64b4) -> 13
	ld a, [bc] ; 9A4B5 (26:64b5) -> 0A
	inc bc ; 9A4B6 (26:64b6) -> 03
	ld [de], a ; 9A4B7 (26:64b7) -> 12
	inc de ; 9A4B8 (26:64b8) -> 13
	pop de ; 9A4B9 (26:64b9) -> D1
	ld a, e ; 9A4BA (26:64ba) -> 7B
	and $e0 ; 9A4BB (26:64bb) -> E6 E0
	ld l, a ; 9A4BD (26:64bd) -> 6F
	ld h, d ; 9A4BE (26:64be) -> 62
	inc de ; 9A4BF (26:64bf) -> 13
	inc de ; 9A4C0 (26:64c0) -> 13
	ld a, e ; 9A4C1 (26:64c1) -> 7B
	and $1f ; 9A4C2 (26:64c2) -> E6 1F
	ld e, a ; 9A4C4 (26:64c4) -> 5F
	ld d, $00 ; 9A4C5 (26:64c5) -> 16 00
	ld a, l ; 9A4C7 (26:64c7) -> 7D
	or e ; 9A4C8 (26:64c8) -> B3
	ld l, a ; 9A4C9 (26:64c9) -> 6F
	ld a, h ; 9A4CA (26:64ca) -> 7C
	or d ; 9A4CB (26:64cb) -> B2
	ld h, a ; 9A4CC (26:64cc) -> 67
	push de ; 9A4CD (26:64cd) -> D5
	push hl ; 9A4CE (26:64ce) -> E5
	pop de ; 9A4CF (26:64cf) -> D1
	pop hl ; 9A4D0 (26:64d0) -> E1
	pop bc ; 9A4D1 (26:64d1) -> C1
	inc c ; 9A4D2 (26:64d2) -> 0C
	jp label_9a476 ; 9A4D3 (26:64d3) -> C3 76 64
label_9a4d6:
	pop bc ; 9A4D6 (26:64d6) -> C1
	ld hl, $0040 ; 9A4D7 (26:64d7) -> 21 40 00
	add hl, bc ; 9A4DA (26:64da) -> 09
	ld a, l ; 9A4DB (26:64db) -> 7D
	and $e0 ; 9A4DC (26:64dc) -> E6 E0
	ld e, a ; 9A4DE (26:64de) -> 5F
	ld a, h ; 9A4DF (26:64df) -> 7C
	and $03 ; 9A4E0 (26:64e0) -> E6 03
	ld d, a ; 9A4E2 (26:64e2) -> 57
	ld a, c ; 9A4E3 (26:64e3) -> 79
	and $1f ; 9A4E4 (26:64e4) -> E6 1F
	ld l, a ; 9A4E6 (26:64e6) -> 6F
	ld a, b ; 9A4E7 (26:64e7) -> 78
	and $fc ; 9A4E8 (26:64e8) -> E6 FC
	ld h, a ; 9A4EA (26:64ea) -> 67
	ld a, l ; 9A4EB (26:64eb) -> 7D
	or e ; 9A4EC (26:64ec) -> B3
	ld l, a ; 9A4ED (26:64ed) -> 6F
	ld a, h ; 9A4EE (26:64ee) -> 7C
	or d ; 9A4EF (26:64ef) -> B2
	ld h, a ; 9A4F0 (26:64f0) -> 67
	ld c, l ; 9A4F1 (26:64f1) -> 4D
	ld b, h ; 9A4F2 (26:64f2) -> 44
	ld hl, sp+$00 ; 9A4F3 (26:64f3) -> F8 00
	ld a, [hl] ; 9A4F5 (26:64f5) -> 7E
	inc a ; 9A4F6 (26:64f6) -> 3C
	ld hl, sp+$00 ; 9A4F7 (26:64f7) -> F8 00
	ld [hl], a ; 9A4F9 (26:64f9) -> 77
	jp label_9a467 ; 9A4FA (26:64fa) -> C3 67 64
label_9a4fd:
	ld a, [wSystemType] ; 9A4FD (26:64fd) -> FA FB C2
	cp $11 ; 9A500 (26:6500) -> FE 11
	jp nz, label_9a5df ; 9A502 (26:6502) -> C2 DF 65
	ldh a, [rVBK] ; 9A505 (26:6505) -> F0 4F
	or $01 ; 9A507 (26:6507) -> F6 01
	ldh [rVBK], a ; 9A509 (26:6509) -> E0 4F
	ld a, [wBGMapHi] ; 9A50B (26:650b) -> FA 10 C2
	cp $98 ; 9A50E (26:650e) -> FE 98
	jp nz, label_9a519 ; 9A510 (26:6510) -> C2 19 65
	ld bc, $9800 ; 9A513 (26:6513) -> 01 00 98
	jp label_9a51c ; 9A516 (26:6516) -> C3 1C 65
label_9a519:
	ld bc, $9c00 ; 9A519 (26:6519) -> 01 00 9C
label_9a51c:
	ld a, [wSCX] ; 9A51C (26:651c) -> FA 0C C2
	add a, $f0 ; 9A51F (26:651f) -> C6 F0
	rrca  ; 9A521 (26:6521) -> 0F
	rrca  ; 9A522 (26:6522) -> 0F
	rrca  ; 9A523 (26:6523) -> 0F
	and $1f ; 9A524 (26:6524) -> E6 1F
	ld e, a ; 9A526 (26:6526) -> 5F
	ld a, [wSCY] ; 9A527 (26:6527) -> FA 0E C2
	add a, $f0 ; 9A52A (26:652a) -> C6 F0
	rrca  ; 9A52C (26:652c) -> 0F
	rrca  ; 9A52D (26:652d) -> 0F
	rrca  ; 9A52E (26:652e) -> 0F
	and $1f ; 9A52F (26:652f) -> E6 1F
	ld l, a ; 9A531 (26:6531) -> 6F
	ld h, $00 ; 9A532 (26:6532) -> 26 00
	add hl, hl ; 9A534 (26:6534) -> 29
	add hl, hl ; 9A535 (26:6535) -> 29
	add hl, hl ; 9A536 (26:6536) -> 29
	add hl, hl ; 9A537 (26:6537) -> 29
	add hl, hl ; 9A538 (26:6538) -> 29
	ld d, $00 ; 9A539 (26:6539) -> 16 00
	add hl, de ; 9A53B (26:653b) -> 19
	add hl, bc ; 9A53C (26:653c) -> 09
	ld c, l ; 9A53D (26:653d) -> 4D
	ld b, h ; 9A53E (26:653e) -> 44
	ld hl, sp+$00 ; 9A53F (26:653f) -> F8 00
	ld [hl], $00 ; 9A541 (26:6541) -> 36 00
label_9a543:
	ld hl, sp+$00 ; 9A543 (26:6543) -> F8 00
	ld a, [hl] ; 9A545 (26:6545) -> 7E
	cp $0b ; 9A546 (26:6546) -> FE 0B
	jp nc, label_9a5d9 ; 9A548 (26:6548) -> D2 D9 65
	push bc ; 9A54B (26:654b) -> C5
	ld l, c ; 9A54C (26:654c) -> 69
	ld h, b ; 9A54D (26:654d) -> 60
	ld e, c ; 9A54E (26:654e) -> 59
	ld d, b ; 9A54F (26:654f) -> 50
	ld c, $00 ; 9A550 (26:6550) -> 0E 00
label_9a552:
	ld a, c ; 9A552 (26:6552) -> 79
	cp $0c ; 9A553 (26:6553) -> FE 0C
	jp nc, label_9a5b2 ; 9A555 (26:6555) -> D2 B2 65
	push de ; 9A558 (26:6558) -> D5
	push bc ; 9A559 (26:6559) -> C5
	set_farcall_addrs_hli Func_9f1e
	pop bc ; 9A565 (26:6565) -> C1
	pop de ; 9A566 (26:6566) -> D1
	push bc ; 9A567 (26:6567) -> C5
	push de ; 9A568 (26:6568) -> D5
	ld a, [wMapY] ; 9A569 (26:6569) -> FA D9 C2
	ld hl, sp+$06 ; 9A56C (26:656c) -> F8 06
	add a, [hl] ; 9A56E (26:656e) -> 86
	dec a ; 9A56F (26:656f) -> 3D
	ld e, a ; 9A570 (26:6570) -> 5F
	ld a, [wMapX] ; 9A571 (26:6571) -> FA D8 C2
	add a, c ; 9A574 (26:6574) -> 81
	dec a ; 9A575 (26:6575) -> 3D
	call FarCall ; 9A576 (26:6576) -> CD F8 03
	ld c, l ; 9A579 (26:6579) -> 4D
	ld b, h ; 9A57A (26:657a) -> 44
	pop de ; 9A57B (26:657b) -> D1
	push de ; 9A57C (26:657c) -> D5
	ld a, [bc] ; 9A57D (26:657d) -> 0A
	inc bc ; 9A57E (26:657e) -> 03
	ld [de], a ; 9A57F (26:657f) -> 12
	inc de ; 9A580 (26:6580) -> 13
	ld a, [bc] ; 9A581 (26:6581) -> 0A
	inc bc ; 9A582 (26:6582) -> 03
	ld [de], a ; 9A583 (26:6583) -> 12
	inc de ; 9A584 (26:6584) -> 13
	ld hl, $001e ; 9A585 (26:6585) -> 21 1E 00
	add hl, de ; 9A588 (26:6588) -> 19
	push de ; 9A589 (26:6589) -> D5
	push hl ; 9A58A (26:658a) -> E5
	pop de ; 9A58B (26:658b) -> D1
	pop hl ; 9A58C (26:658c) -> E1
	ld a, [bc] ; 9A58D (26:658d) -> 0A
	inc bc ; 9A58E (26:658e) -> 03
	ld [de], a ; 9A58F (26:658f) -> 12
	inc de ; 9A590 (26:6590) -> 13
	ld a, [bc] ; 9A591 (26:6591) -> 0A
	inc bc ; 9A592 (26:6592) -> 03
	ld [de], a ; 9A593 (26:6593) -> 12
	inc de ; 9A594 (26:6594) -> 13
	pop de ; 9A595 (26:6595) -> D1
	ld a, e ; 9A596 (26:6596) -> 7B
	and $e0 ; 9A597 (26:6597) -> E6 E0
	ld l, a ; 9A599 (26:6599) -> 6F
	ld h, d ; 9A59A (26:659a) -> 62
	inc de ; 9A59B (26:659b) -> 13
	inc de ; 9A59C (26:659c) -> 13
	ld a, e ; 9A59D (26:659d) -> 7B
	and $1f ; 9A59E (26:659e) -> E6 1F
	ld e, a ; 9A5A0 (26:65a0) -> 5F
	ld d, $00 ; 9A5A1 (26:65a1) -> 16 00
	ld a, l ; 9A5A3 (26:65a3) -> 7D
	or e ; 9A5A4 (26:65a4) -> B3
	ld l, a ; 9A5A5 (26:65a5) -> 6F
	ld a, h ; 9A5A6 (26:65a6) -> 7C
	or d ; 9A5A7 (26:65a7) -> B2
	ld h, a ; 9A5A8 (26:65a8) -> 67
	push de ; 9A5A9 (26:65a9) -> D5
	push hl ; 9A5AA (26:65aa) -> E5
	pop de ; 9A5AB (26:65ab) -> D1
	pop hl ; 9A5AC (26:65ac) -> E1
	pop bc ; 9A5AD (26:65ad) -> C1
	inc c ; 9A5AE (26:65ae) -> 0C
	jp label_9a552 ; 9A5AF (26:65af) -> C3 52 65
label_9a5b2:
	pop bc ; 9A5B2 (26:65b2) -> C1
	ld hl, $0040 ; 9A5B3 (26:65b3) -> 21 40 00
	add hl, bc ; 9A5B6 (26:65b6) -> 09
	ld a, l ; 9A5B7 (26:65b7) -> 7D
	and $e0 ; 9A5B8 (26:65b8) -> E6 E0
	ld e, a ; 9A5BA (26:65ba) -> 5F
	ld a, h ; 9A5BB (26:65bb) -> 7C
	and $03 ; 9A5BC (26:65bc) -> E6 03
	ld d, a ; 9A5BE (26:65be) -> 57
	ld a, c ; 9A5BF (26:65bf) -> 79
	and $1f ; 9A5C0 (26:65c0) -> E6 1F
	ld l, a ; 9A5C2 (26:65c2) -> 6F
	ld a, b ; 9A5C3 (26:65c3) -> 78
	and $fc ; 9A5C4 (26:65c4) -> E6 FC
	ld h, a ; 9A5C6 (26:65c6) -> 67
	ld a, l ; 9A5C7 (26:65c7) -> 7D
	or e ; 9A5C8 (26:65c8) -> B3
	ld l, a ; 9A5C9 (26:65c9) -> 6F
	ld a, h ; 9A5CA (26:65ca) -> 7C
	or d ; 9A5CB (26:65cb) -> B2
	ld h, a ; 9A5CC (26:65cc) -> 67
	ld c, l ; 9A5CD (26:65cd) -> 4D
	ld b, h ; 9A5CE (26:65ce) -> 44
	ld hl, sp+$00 ; 9A5CF (26:65cf) -> F8 00
	ld a, [hl] ; 9A5D1 (26:65d1) -> 7E
	inc a ; 9A5D2 (26:65d2) -> 3C
	ld hl, sp+$00 ; 9A5D3 (26:65d3) -> F8 00
	ld [hl], a ; 9A5D5 (26:65d5) -> 77
	jp label_9a543 ; 9A5D6 (26:65d6) -> C3 43 65
label_9a5d9:
	ldh a, [rVBK] ; 9A5D9 (26:65d9) -> F0 4F
	and $fe ; 9A5DB (26:65db) -> E6 FE
	ldh [rVBK], a ; 9A5DD (26:65dd) -> E0 4F
label_9a5df:
	ld a, $01 ; 9A5DF (26:65df) -> 3E 01
	call Func_9a174 ; 9A5E1 (26:65e1) -> CD 74 61
	ld a, [wOverworldTilemapSelector] ; 9A5E4 (26:65e4) -> FA CD C2
	or a ; 9A5E7 (26:65e7) -> B7
	jp nz, label_9a5f0 ; 9A5E8 (26:65e8) -> C2 F0 65
	ld a, $01 ; 9A5EB (26:65eb) -> 3E 01
	jp label_9a5f1 ; 9A5ED (26:65ed) -> C3 F1 65
label_9a5f0:
	xor a ; 9A5F0 (26:65f0) -> AF
label_9a5f1:
	call ToggleBGMapSelect ; 9A5F1 (26:65f1) -> CD B8 3C
	pop bc ; 9A5F4 (26:65f4) -> C1
	ret  ; 9A5F5 (26:65f5) -> C9

Data_9a5f6: ; 9a5f6
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0d, $0d
	db $0e, $0f, $10, $11, $11, $12, $13, $14, $15, $15, $15, $16, $17, $17, $18, $19
	db $1a, $1b

Data_9a618: ; 9a618
	db $00, $01, $02, $03, $03, $04, $05, $06, $07, $08, $09

Data_9a623: ; 9a623
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
	db $20, $21

Data_9a645: ; 9a645
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a

Data_9a650: ; 9a650
	db $00, $15, $05, $24, $01, $00, $00, $09, $00, $00, $00, $00, $06, $21, $1b, $1b
	db $02, $09, $16, $07, $07, $0c, $11, $10, $11, $11, $10, $00, $10, $10, $00, $00
	db $15, $00

Data_9a672: ; 9a672
REPT 11
	db $0
ENDR

Data_9a67d: ; 9a67d
	db $00, $0d, $04, $05, $0d, $00, $00, $06, $00, $00, $00, $00, $01, $08, $08, $08
	db $05, $0f, $06, $0a, $04, $06, $05, $0e, $05, $05, $0e, $00, $06, $06, $00, $05
	db $0c, $00

Data_9a69f: ; 9a69f
REPT 11
	db $0
ENDR

LoadEmote::
	push af
	push de
	push bc
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a6c7
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a6c7:
	pop bc
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $22
	jp nc, Func_9a780
	push de
	push bc
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a5f6
	add hl, de
	ld c, [hl]
	ld de, Emotes_c4000
	ld a, BANK(Emotes_c4000)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a623
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_c5b26
	ld a, BANK(EmoteAttrs_c5b26)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp Func_9a771

Func_9a75a:
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld e, [hl]
	call MoveEmote
Func_9a771:
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
	jp Func_9a834

Func_9a780:
	push de
	push bc
	ld hl, sp+$5
	ld a, [hl]
	add -$21
	ld hl, sp+$5
	ld [hl], a
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a618
	add hl, de
	ld c, [hl]
	ld de, Emotes_b2418
	ld a, BANK(Emotes_b2418)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a645
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_b3607
	ld a, BANK(EmoteAttrs_b3607)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp .done_show_emote

.not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld e, [hl]
	call MoveEmote
.done_show_emote
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
Func_9a834:
	ld hl, sp+$1
	ld a, [hl]
	cp $c
	jp z, Func_9a844
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp nz, Func_9a848
Func_9a844:
	xor a
	ld [wc85a], a
Func_9a848:
	pop bc
	ret

Func_9a84a::
	call NextOverworldFrame
	set_farcall_addrs_hli UpdateSprites
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call FarCall
	cp $1
	jp z, Func_9a86a
	jp Func_9a87b

Func_9a86a:
	callba_hli HandleNPCStep
	jp Func_9a84a

Func_9a87b:
	ret

Func_9a87c::
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a896
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a896:
	ret

MoveEmote:: ; 9a897
	add -5
	ld [wc832], a
	ld a, e
	add -4
	ld [wc833], a
	callba_hli MoveEmote_
	ret

Func_9a8b1:
	ld [wc834], a
	ld a, e
	ld [wc835], a
	ld a, c
	ld [wc836], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wc837], a
	ret

Func_9a8c3:: ; 9a8c3
	push bc ; 9A8C3 (26:68c3) -> C5
	push bc ; 9A8C4 (26:68c4) -> C5
	push bc ; 9A8C5 (26:68c5) -> C5
	push bc ; 9A8C6 (26:68c6) -> C5
	call Func_9a377 ; 9A8C7 (26:68c7) -> CD 77 63
	ld hl, sp+$06 ; 9A8CA (26:68ca) -> F8 06
	ld [hl], $00 ; 9A8CC (26:68cc) -> 36 00
	set_farcall_addrs_hli Func_93370 ; 9A8D7 (26:68d7) -> 36 73
	ld hl, sp+$00 ; 9A8D9 (26:68d9) -> F8 00
	call FarCall ; 9A8DB (26:68db) -> CD F8 03
	ld hl, sp+$03 ; 9A8DE (26:68de) -> F8 03
	ld l, [hl] ; 9A8E0 (26:68e0) -> 6E
	ld h, $00 ; 9A8E1 (26:68e1) -> 26 00
	ld de, $003c ; 9A8E3 (26:68e3) -> 11 3C 00
	call MultiplyHLbyDE ; 9A8E6 (26:68e6) -> CD 59 37
	push de ; 9A8E9 (26:68e9) -> D5
	push hl ; 9A8EA (26:68ea) -> E5
	pop de ; 9A8EB (26:68eb) -> D1
	pop hl ; 9A8EC (26:68ec) -> E1
	ld hl, sp+$04 ; 9A8ED (26:68ed) -> F8 04
	ld l, [hl] ; 9A8EF (26:68ef) -> 6E
	ld h, $00 ; 9A8F0 (26:68f0) -> 26 00
	add hl, de ; 9A8F2 (26:68f2) -> 19
	ld c, l ; 9A8F3 (26:68f3) -> 4D
	ld b, h ; 9A8F4 (26:68f4) -> 44
	push bc ; 9A8F5 (26:68f5) -> C5
	set_farcall_addrs_hli Func_83e56 ; 9A8FF (26:68ff) -> 36 7E
	call FarCall ; 9A901 (26:6901) -> CD F8 03
	or a ; 9A904 (26:6904) -> B7
	jp z, label_9a90d ; 9A905 (26:6905) -> CA 0D 69
	cp $ff ; 9A908 (26:6908) -> FE FF
	jp nz, label_9a93e ; 9A90A (26:690a) -> C2 3E 69
label_9a90d:
	set_farcall_addrs_hli Func_17e95 ; 9A916 (26:6916) -> 36 7E
	ld c, $03 ; 9A918 (26:6918) -> 0E 03
	ld e, $14 ; 9A91A (26:691a) -> 1E 14
	ld hl, sp+$08 ; 9A91C (26:691c) -> F8 08
	ld l, [hl] ; 9A91E (26:691e) -> 6E
	ld h, $00 ; 9A91F (26:691f) -> 26 00
	call FarCall ; 9A921 (26:6921) -> CD F8 03
	ld hl, sp+$08 ; 9A924 (26:6924) -> F8 08
	ld a, [hl] ; 9A926 (26:6926) -> 7E
	inc a ; 9A927 (26:6927) -> 3C
	ld e, a ; 9A928 (26:6928) -> 5F
	ld a, $01 ; 9A929 (26:6929) -> 3E 01
	call SetStringStartState ; 9A92B (26:692b) -> CD 83 3A
	ld hl, Data_9abb6 ; 9A92E (26:692e) -> 21 B6 6B
	push hl ; 9A931 (26:6931) -> E5
	call PlaceString ; 9A932 (26:6932) -> CD 0E 15
	pop bc ; 9A935 (26:6935) -> C1
	ld hl, sp+$08 ; 9A936 (26:6936) -> F8 08
	ld a, [hl] ; 9A938 (26:6938) -> 7E
	add a, $03 ; 9A939 (26:6939) -> C6 03
	ld hl, sp+$08 ; 9A93B (26:693b) -> F8 08
	ld [hl], a ; 9A93D (26:693d) -> 77
label_9a93e:
	ld hl, sp+$07 ; 9A93E (26:693e) -> F8 07
	ld [hl], $00 ; 9A940 (26:6940) -> 36 00
	ld c, $00 ; 9A942 (26:6942) -> 0E 00
label_9a944:
	ld a, c ; 9A944 (26:6944) -> 79
	cp $03 ; 9A945 (26:6945) -> FE 03
	jp nc, label_9a989 ; 9A947 (26:6947) -> D2 89 69
	ld l, c ; 9A94A (26:694a) -> 69
	ld h, $00 ; 9A94B (26:694b) -> 26 00
	add hl, hl ; 9A94D (26:694d) -> 29
	add hl, hl ; 9A94E (26:694e) -> 29
	ld e, l ; 9A94F (26:694f) -> 5D
	ld d, h ; 9A950 (26:6950) -> 54
	add hl, hl ; 9A951 (26:6951) -> 29
	add hl, hl ; 9A952 (26:6952) -> 29
	add hl, de ; 9A953 (26:6953) -> 19
	ld de, $c347 ; 9A954 (26:6954) -> 11 47 C3
	add hl, de ; 9A957 (26:6957) -> 19
	ld de, $0010 ; 9A958 (26:6958) -> 11 10 00
	add hl, de ; 9A95B (26:695b) -> 19
	ld a, [hl] ; 9A95C (26:695c) -> 7E
	cp $01 ; 9A95D (26:695d) -> FE 01
	jp nz, label_9a985 ; 9A95F (26:695f) -> C2 85 69
	push bc ; 9A962 (26:6962) -> C5
	set_farcall_addrs_hli Func_6bdfa ; 9A96C (26:696c) -> 36 7D
	pop bc ; 9A96E (26:696e) -> C1
	push bc ; 9A96F (26:696f) -> C5
	ld a, c ; 9A970 (26:6970) -> 79
	call FarCall ; 9A971 (26:6971) -> CD F8 03
	pop bc ; 9A974 (26:6974) -> C1
	or a ; 9A975 (26:6975) -> B7
	jp z, label_9a97e ; 9A976 (26:6976) -> CA 7E 69
	cp $ff ; 9A979 (26:6979) -> FE FF
	jp nz, label_9a985 ; 9A97B (26:697b) -> C2 85 69
label_9a97e:
	ld hl, sp+$07 ; 9A97E (26:697e) -> F8 07
	ld a, [hl] ; 9A980 (26:6980) -> 7E
	inc a ; 9A981 (26:6981) -> 3C
	ld hl, sp+$07 ; 9A982 (26:6982) -> F8 07
	ld [hl], a ; 9A984 (26:6984) -> 77
label_9a985:
	inc c ; 9A985 (26:6985) -> 0C
	jp label_9a944 ; 9A986 (26:6986) -> C3 44 69
label_9a989:
	ld hl, sp+$07 ; 9A989 (26:6989) -> F8 07
	ld a, [hl] ; 9A98B (26:698b) -> 7E
	or a ; 9A98C (26:698c) -> B7
	jp z, label_9a9db ; 9A98D (26:698d) -> CA DB 69
	set_farcall_addrs_hli Func_17e95 ; 9A999 (26:6999) -> 36 7E
	ld c, $05 ; 9A99B (26:699b) -> 0E 05
	ld e, $14 ; 9A99D (26:699d) -> 1E 14
	ld hl, sp+$08 ; 9A99F (26:699f) -> F8 08
	ld l, [hl] ; 9A9A1 (26:69a1) -> 6E
	ld h, $00 ; 9A9A2 (26:69a2) -> 26 00
	call FarCall ; 9A9A4 (26:69a4) -> CD F8 03
	ld hl, sp+$08 ; 9A9A7 (26:69a7) -> F8 08
	ld a, [hl] ; 9A9A9 (26:69a9) -> 7E
	inc a ; 9A9AA (26:69aa) -> 3C
	ld e, a ; 9A9AB (26:69ab) -> 5F
	ld a, $01 ; 9A9AC (26:69ac) -> 3E 01
	call SetStringStartState ; 9A9AE (26:69ae) -> CD 83 3A
	ld hl, Data_9abcf ; 9A9B1 (26:69b1) -> 21 CF 6B
	push hl ; 9A9B4 (26:69b4) -> E5
	call PlaceString ; 9A9B5 (26:69b5) -> CD 0E 15
	pop bc ; 9A9B8 (26:69b8) -> C1
	ld hl, sp+$08 ; 9A9B9 (26:69b9) -> F8 08
	ld a, [hl] ; 9A9BB (26:69bb) -> 7E
	add a, $03 ; 9A9BC (26:69bc) -> C6 03
	ld e, a ; 9A9BE (26:69be) -> 5F
	ld a, $01 ; 9A9BF (26:69bf) -> 3E 01
	call SetStringStartState ; 9A9C1 (26:69c1) -> CD 83 3A
	ld hl, sp+$07 ; 9A9C4 (26:69c4) -> F8 07
	ld l, [hl] ; 9A9C6 (26:69c6) -> 6E
	ld h, $00 ; 9A9C7 (26:69c7) -> 26 00
	push hl ; 9A9C9 (26:69c9) -> E5
	ld hl, Data_9abe5 ; 9A9CA (26:69ca) -> 21 E5 6B
	push hl ; 9A9CD (26:69cd) -> E5
	call PlaceString ; 9A9CE (26:69ce) -> CD 0E 15
	pop bc ; 9A9D1 (26:69d1) -> C1
	pop bc ; 9A9D2 (26:69d2) -> C1
	ld hl, sp+$08 ; 9A9D3 (26:69d3) -> F8 08
	ld a, [hl] ; 9A9D5 (26:69d5) -> 7E
	add a, $05 ; 9A9D6 (26:69d6) -> C6 05
	ld hl, sp+$08 ; 9A9D8 (26:69d8) -> F8 08
	ld [hl], a ; 9A9DA (26:69da) -> 77
label_9a9db:
	set_farcall_addrs_hli CheckEventFlag ; 9A9E4 (26:69e4) -> 36 6A
	ld hl, $0007 ; 9A9E6 (26:69e6) -> 21 07 00
	call FarCall ; 9A9E9 (26:69e9) -> CD F8 03
	or a ; 9A9EC (26:69ec) -> B7
	jp z, label_9aa0b ; 9A9ED (26:69ed) -> CA 0B 6A
	set_farcall_addrs_hli CheckUnlockedArea ; 9A9F9 (26:69f9) -> 36 68
	ld a, $02 ; 9A9FB (26:69fb) -> 3E 02
	call FarCall ; 9A9FD (26:69fd) -> CD F8 03
	cp $01 ; 9AA00 (26:6a00) -> FE 01
	jp nz, label_9aa0a ; 9AA02 (26:6a02) -> C2 0A 6A
	ld a, $01 ; 9AA05 (26:6a05) -> 3E 01
	jp label_9aa0b ; 9AA07 (26:6a07) -> C3 0B 6A
label_9aa0a:
	xor a ; 9AA0A (26:6a0a) -> AF
label_9aa0b:
	pop bc ; 9AA0B (26:6a0b) -> C1
	push bc ; 9AA0C (26:6a0c) -> C5
	or a ; 9AA0D (26:6a0d) -> B7
	jp z, label_9aa2b ; 9AA0E (26:6a0e) -> CA 2B 6A
	ld hl, $0474 ; 9AA11 (26:6a11) -> 21 74 04
	ld de, $0168 ; 9AA14 (26:6a14) -> 11 68 01
	ld a, c ; 9AA17 (26:6a17) -> 79
	sub e ; 9AA18 (26:6a18) -> 93
	ld a, b ; 9AA19 (26:6a19) -> 78
	sbc a, d ; 9AA1A (26:6a1a) -> 9A
	jp c, label_9aa25 ; 9AA1B (26:6a1b) -> DA 25 6A
	ld a, c ; 9AA1E (26:6a1e) -> 79
	sub l ; 9AA1F (26:6a1f) -> 95
	ld a, b ; 9AA20 (26:6a20) -> 78
	sbc a, h ; 9AA21 (26:6a21) -> 9C
	jp c, label_9aa2a ; 9AA22 (26:6a22) -> DA 2A 6A
label_9aa25:
	ld a, $01 ; 9AA25 (26:6a25) -> 3E 01
	jp label_9aa2b ; 9AA27 (26:6a27) -> C3 2B 6A
label_9aa2a:
	xor a ; 9AA2A (26:6a2a) -> AF
label_9aa2b:
	or a ; 9AA2B (26:6a2b) -> B7
	jp z, label_9aa73 ; 9AA2C (26:6a2c) -> CA 73 6A
	set_farcall_addrs_hli Func_17e95 ; 9AA38 (26:6a38) -> 36 7E
	ld c, $05 ; 9AA3A (26:6a3a) -> 0E 05
	ld e, $14 ; 9AA3C (26:6a3c) -> 1E 14
	ld hl, sp+$08 ; 9AA3E (26:6a3e) -> F8 08
	ld l, [hl] ; 9AA40 (26:6a40) -> 6E
	ld h, $00 ; 9AA41 (26:6a41) -> 26 00
	call FarCall ; 9AA43 (26:6a43) -> CD F8 03
	ld hl, sp+$08 ; 9AA46 (26:6a46) -> F8 08
	ld a, [hl] ; 9AA48 (26:6a48) -> 7E
	inc a ; 9AA49 (26:6a49) -> 3C
	ld e, a ; 9AA4A (26:6a4a) -> 5F
	ld a, $01 ; 9AA4B (26:6a4b) -> 3E 01
	call SetStringStartState ; 9AA4D (26:6a4d) -> CD 83 3A
	ld hl, Data_9abf9 ; 9AA50 (26:6a50) -> 21 F9 6B
	push hl ; 9AA53 (26:6a53) -> E5
	call PlaceString ; 9AA54 (26:6a54) -> CD 0E 15
	pop bc ; 9AA57 (26:6a57) -> C1
	ld hl, sp+$08 ; 9AA58 (26:6a58) -> F8 08
	ld a, [hl] ; 9AA5A (26:6a5a) -> 7E
	add a, $03 ; 9AA5B (26:6a5b) -> C6 03
	ld e, a ; 9AA5D (26:6a5d) -> 5F
	ld a, $01 ; 9AA5E (26:6a5e) -> 3E 01
	call SetStringStartState ; 9AA60 (26:6a60) -> CD 83 3A
	ld hl, Data_9ac0e ; 9AA63 (26:6a63) -> 21 0E 6C
	push hl ; 9AA66 (26:6a66) -> E5
	call PlaceString ; 9AA67 (26:6a67) -> CD 0E 15
	pop bc ; 9AA6A (26:6a6a) -> C1
	ld hl, sp+$08 ; 9AA6B (26:6a6b) -> F8 08
	ld a, [hl] ; 9AA6D (26:6a6d) -> 7E
	add a, $05 ; 9AA6E (26:6a6e) -> C6 05
	ld hl, sp+$08 ; 9AA70 (26:6a70) -> F8 08
	ld [hl], a ; 9AA72 (26:6a72) -> 77
label_9aa73:
	set_farcall_addrs_hli CheckUnlockedArea ; 9AA7C (26:6a7c) -> 36 68
	ld a, $12 ; 9AA7E (26:6a7e) -> 3E 12
	call FarCall ; 9AA80 (26:6a80) -> CD F8 03
	pop bc ; 9AA83 (26:6a83) -> C1
	push bc ; 9AA84 (26:6a84) -> C5
	or a ; 9AA85 (26:6a85) -> B7
	jp z, label_9aaa3 ; 9AA86 (26:6a86) -> CA A3 6A
	ld hl, $0384 ; 9AA89 (26:6a89) -> 21 84 03
	ld de, $0438 ; 9AA8C (26:6a8c) -> 11 38 04
	ld a, c ; 9AA8F (26:6a8f) -> 79
	sub l ; 9AA90 (26:6a90) -> 95
	ld a, b ; 9AA91 (26:6a91) -> 78
	sbc a, h ; 9AA92 (26:6a92) -> 9C
	jp c, label_9aaa2 ; 9AA93 (26:6a93) -> DA A2 6A
	ld a, c ; 9AA96 (26:6a96) -> 79
	sub e ; 9AA97 (26:6a97) -> 93
	ld a, b ; 9AA98 (26:6a98) -> 78
	sbc a, d ; 9AA99 (26:6a99) -> 9A
	jp nc, label_9aaa2 ; 9AA9A (26:6a9a) -> D2 A2 6A
	ld a, $01 ; 9AA9D (26:6a9d) -> 3E 01
	jp label_9aaa3 ; 9AA9F (26:6a9f) -> C3 A3 6A
label_9aaa2:
	xor a ; 9AAA2 (26:6aa2) -> AF
label_9aaa3:
	or a ; 9AAA3 (26:6aa3) -> B7
	jp z, label_9aaeb ; 9AAA4 (26:6aa4) -> CA EB 6A
	set_farcall_addrs_hli Func_17e95 ; 9AAB0 (26:6ab0) -> 36 7E
	ld c, $05 ; 9AAB2 (26:6ab2) -> 0E 05
	ld e, $14 ; 9AAB4 (26:6ab4) -> 1E 14
	ld hl, sp+$08 ; 9AAB6 (26:6ab6) -> F8 08
	ld l, [hl] ; 9AAB8 (26:6ab8) -> 6E
	ld h, $00 ; 9AAB9 (26:6ab9) -> 26 00
	call FarCall ; 9AABB (26:6abb) -> CD F8 03
	ld hl, sp+$08 ; 9AABE (26:6abe) -> F8 08
	ld a, [hl] ; 9AAC0 (26:6ac0) -> 7E
	inc a ; 9AAC1 (26:6ac1) -> 3C
	ld e, a ; 9AAC2 (26:6ac2) -> 5F
	ld a, $01 ; 9AAC3 (26:6ac3) -> 3E 01
	call SetStringStartState ; 9AAC5 (26:6ac5) -> CD 83 3A
	ld hl, Data_9ac16 ; 9AAC8 (26:6ac8) -> 21 16 6C
	push hl ; 9AACB (26:6acb) -> E5
	call PlaceString ; 9AACC (26:6acc) -> CD 0E 15
	pop bc ; 9AACF (26:6acf) -> C1
	ld hl, sp+$08 ; 9AAD0 (26:6ad0) -> F8 08
	ld a, [hl] ; 9AAD2 (26:6ad2) -> 7E
	add a, $03 ; 9AAD3 (26:6ad3) -> C6 03
	ld e, a ; 9AAD5 (26:6ad5) -> 5F
	ld a, $01 ; 9AAD6 (26:6ad6) -> 3E 01
	call SetStringStartState ; 9AAD8 (26:6ad8) -> CD 83 3A
	ld hl, Data_9ac2c ; 9AADB (26:6adb) -> 21 2C 6C
	push hl ; 9AADE (26:6ade) -> E5
	call PlaceString ; 9AADF (26:6adf) -> CD 0E 15
	pop bc ; 9AAE2 (26:6ae2) -> C1
	ld hl, sp+$08 ; 9AAE3 (26:6ae3) -> F8 08
	ld a, [hl] ; 9AAE5 (26:6ae5) -> 7E
	add a, $05 ; 9AAE6 (26:6ae6) -> C6 05
	ld hl, sp+$08 ; 9AAE8 (26:6ae8) -> F8 08
	ld [hl], a ; 9AAEA (26:6aea) -> 77
label_9aaeb:
	set_farcall_addrs_hli CheckEventFlag ; 9AAF4 (26:6af4) -> 36 6A
	ld hl, $00b9 ; 9AAF6 (26:6af6) -> 21 B9 00
	call FarCall ; 9AAF9 (26:6af9) -> CD F8 03
	ld hl, sp+$09 ; 9AAFC (26:6afc) -> F8 09
	ld [hl], a ; 9AAFE (26:6afe) -> 77
	set_farcall_addrs_hli CheckUnlockedArea ; 9AB08 (26:6b08) -> 36 68
	ld a, $0b ; 9AB0A (26:6b0a) -> 3E 0B
	call FarCall ; 9AB0C (26:6b0c) -> CD F8 03
	cp $01 ; 9AB0F (26:6b0f) -> FE 01
	jp nz, label_9ab23 ; 9AB11 (26:6b11) -> C2 23 6B
	ld hl, sp+$09 ; 9AB14 (26:6b14) -> F8 09
	ld a, [hl] ; 9AB16 (26:6b16) -> 7E
	cp $01 ; 9AB17 (26:6b17) -> FE 01
	jp nz, label_9ab23 ; 9AB19 (26:6b19) -> C2 23 6B
	ld hl, sp+$09 ; 9AB1C (26:6b1c) -> F8 09
	ld [hl], $01 ; 9AB1E (26:6b1e) -> 36 01
	jp label_9ab27 ; 9AB20 (26:6b20) -> C3 27 6B
label_9ab23:
	ld hl, sp+$09 ; 9AB23 (26:6b23) -> F8 09
	ld [hl], $00 ; 9AB25 (26:6b25) -> 36 00
label_9ab27:
	pop bc ; 9AB27 (26:6b27) -> C1
	ld hl, sp+$07 ; 9AB28 (26:6b28) -> F8 07
	ld a, [hl] ; 9AB2A (26:6b2a) -> 7E
	or a ; 9AB2B (26:6b2b) -> B7
	jp z, label_9ab4e ; 9AB2C (26:6b2c) -> CA 4E 6B
	ld hl, $0438 ; 9AB2F (26:6b2f) -> 21 38 04
	ld de, $04b0 ; 9AB32 (26:6b32) -> 11 B0 04
	ld a, c ; 9AB35 (26:6b35) -> 79
	sub l ; 9AB36 (26:6b36) -> 95
	ld a, b ; 9AB37 (26:6b37) -> 78
	sbc a, h ; 9AB38 (26:6b38) -> 9C
	jp c, label_9ab4a ; 9AB39 (26:6b39) -> DA 4A 6B
	ld a, c ; 9AB3C (26:6b3c) -> 79
	sub e ; 9AB3D (26:6b3d) -> 93
	ld a, b ; 9AB3E (26:6b3e) -> 78
	sbc a, d ; 9AB3F (26:6b3f) -> 9A
	jp nc, label_9ab4a ; 9AB40 (26:6b40) -> D2 4A 6B
	ld hl, sp+$07 ; 9AB43 (26:6b43) -> F8 07
	ld [hl], $01 ; 9AB45 (26:6b45) -> 36 01
	jp label_9ab4e ; 9AB47 (26:6b47) -> C3 4E 6B
label_9ab4a:
	ld hl, sp+$07 ; 9AB4A (26:6b4a) -> F8 07
	ld [hl], $00 ; 9AB4C (26:6b4c) -> 36 00
label_9ab4e:
	ld hl, sp+$07 ; 9AB4E (26:6b4e) -> F8 07
	ld a, [hl] ; 9AB50 (26:6b50) -> 7E
	or a ; 9AB51 (26:6b51) -> B7
	jp z, label_9ab99 ; 9AB52 (26:6b52) -> CA 99 6B
	set_farcall_addrs_hli Func_17e95 ; 9AB5E (26:6b5e) -> 36 7E
	ld c, $05 ; 9AB60 (26:6b60) -> 0E 05
	ld e, $14 ; 9AB62 (26:6b62) -> 1E 14
	ld hl, sp+$06 ; 9AB64 (26:6b64) -> F8 06
	ld l, [hl] ; 9AB66 (26:6b66) -> 6E
	ld h, $00 ; 9AB67 (26:6b67) -> 26 00
	call FarCall ; 9AB69 (26:6b69) -> CD F8 03
	ld hl, sp+$06 ; 9AB6C (26:6b6c) -> F8 06
	ld a, [hl] ; 9AB6E (26:6b6e) -> 7E
	inc a ; 9AB6F (26:6b6f) -> 3C
	ld e, a ; 9AB70 (26:6b70) -> 5F
	ld a, $01 ; 9AB71 (26:6b71) -> 3E 01
	call SetStringStartState ; 9AB73 (26:6b73) -> CD 83 3A
	ld hl, Data_9ac34 ; 9AB76 (26:6b76) -> 21 34 6C
	push hl ; 9AB79 (26:6b79) -> E5
	call PlaceString ; 9AB7A (26:6b7a) -> CD 0E 15
	pop bc ; 9AB7D (26:6b7d) -> C1
	ld hl, sp+$06 ; 9AB7E (26:6b7e) -> F8 06
	ld a, [hl] ; 9AB80 (26:6b80) -> 7E
	add a, $03 ; 9AB81 (26:6b81) -> C6 03
	ld e, a ; 9AB83 (26:6b83) -> 5F
	ld a, $01 ; 9AB84 (26:6b84) -> 3E 01
	call SetStringStartState ; 9AB86 (26:6b86) -> CD 83 3A
	ld hl, Data_9ac4c ; 9AB89 (26:6b89) -> 21 4C 6C
	push hl ; 9AB8C (26:6b8c) -> E5
	call PlaceString ; 9AB8D (26:6b8d) -> CD 0E 15
	pop bc ; 9AB90 (26:6b90) -> C1
	ld hl, sp+$06 ; 9AB91 (26:6b91) -> F8 06
	ld a, [hl] ; 9AB93 (26:6b93) -> 7E
	add a, $05 ; 9AB94 (26:6b94) -> C6 05
	ld hl, sp+$06 ; 9AB96 (26:6b96) -> F8 06
	ld [hl], a ; 9AB98 (26:6b98) -> 77
label_9ab99:
	call Func_9a384 ; 9AB99 (26:6b99) -> CD 84 63
	ld hl, sp+$06 ; 9AB9C (26:6b9c) -> F8 06
	ld a, [hl] ; 9AB9E (26:6b9e) -> 7E
	or a ; 9AB9F (26:6b9f) -> B7
	jp z, label_9abb1 ; 9ABA0 (26:6ba0) -> CA B1 6B
	set_farcall_addrs_hli Func_ac37 ; 9ABAC (26:6bac) -> 36 6C
	call FarCall ; 9ABAE (26:6bae) -> CD F8 03
label_9abb1:
	pop bc ; 9ABB1 (26:6bb1) -> C1
	pop bc ; 9ABB2 (26:6bb2) -> C1
	pop bc ; 9ABB3 (26:6bb3) -> C1
	pop bc ; 9ABB4 (26:6bb4) -> C1
	ret  ; 9ABB5 (26:6bb5) -> C9

Data_9abb6:
	db $28, $c0, $de, $b2, $b8, $c9, $29, $b9, $dd, $28, $bb, $dd, $b6
	db $de, $20, $b6, $b4, $af, $c3, $b7, $c3, $d9, $d6, $29, $00

Data_9abcf:
	db $ca, $b9, $dd, $28
	db $c6, $c0, $de, $bc, $c0, $29, $20, $db, $ce, $de, $ce, $df, $dd, $28, $b6, $de
	db $29, $00

Data_9abe5:
	db $25, $64, $ca, $df, $b0, $c3, $a8, $b0, $20, $28, $b6, $b4, $af, $c3
	db $b7, $c3, $d9, $d6, $29, $00

Data_9abf9:
	db $28, $d6, $d9, $c9, $b6, $de, $af, $ba, $b3, $c6
	db $20, $b1, $bb, $36, $bc, $de, $cf, $c3, $de, $29, $00

Data_9ac0e:
	db $28, $ca, $b2, $da, $d9
	db $d6, $29, $00

Data_9ac16:
	db $28, $cf, $ce, $de, $db, $bc, $d1, $d7, $c6, $20, $ba, $de, $ba
	db $de, $36, $bc, $de, $cf, $c3, $de, $29, $00

Data_9ac2c:
	db $28, $ca, $b2, $da, $d9, $d6, $29
	db $00

Data_9ac34:
	db $d2, $b2, $bc, $de, $28, $c4, $de, $b3, $b8, $c2, $c6, $20, $ba, $de, $ba
	db $de, $38, $bc, $de, $cf, $c3, $de, $29, $00

Data_9ac4c:
	db $28, $ca, $b2, $da, $d9, $d6, $29
	db $00

Data_9ac54:
IF DEF(SUN)
	db $4d, $0a, $15, $20, $36, $42, $58, $62, $6b, $76, $2c, $59, $16, $21, $2a
	db $38, $43, $4e, $64, $6d, $77, $0f, $eb, $dc, $db, $d5, $d2, $d0, $cd, $cb, $ca
	db $c8, $ed, $4e, $0b, $0c, $24, $38, $3b, $42, $45, $4a, $4b, $4f, $50, $48, $4a
	db $4b, $4d, $52, $55, $5b, $5c, $6b, $6d, $12, $0e, $2c, $3e, $44, $53, $64, $75
	db $8c, $91, $0a, $91, $8c, $75, $64, $53, $44, $3e, $2c, $12, $0e, $0d, $01, $01
	db $02, $00, $02, $03, $03, $02, $04, $18, $e7, $09, $f6, $00, $00, $03, $02, $91
	db $00, $00, $00, $00, $00, $01, $02, $47, $11, $00, $00, $00, $00, $02, $06, $02
	db $20, $80, $00, $32, $b2, $02, $04, $40, $bf, $0f, $f0, $00, $00, $01, $02, $08
	db $00, $00, $00, $00, $00, $02, $04, $30, $cf, $16, $e9, $00, $00
ELIF DEF(STAR)
	db $6b, $42, $58, $62, $0a, $4d, $76, $20, $36, $15, $2c, $43, $38, $64, $16
	db $6d, $59, $77, $4e, $21, $2a, $0f, $c8, $ca, $cb, $cd, $d0, $d2, $d5, $db, $dc
	db $eb, $ed, $4a, $0c, $3b, $42, $38, $45, $4b, $38, $24, $0b, $4f, $55, $4d, $4b
	db $5b, $5c, $50, $6b, $4a, $48, $52, $6d, $8c, $3e, $75, $64, $12, $91, $2c, $53
	db $44, $0e, $0a, $0e, $12, $2c, $3e, $44, $53, $64, $75, $8c, $91, $0d, $01, $01
	db $02, $00, $02, $03, $03, $02, $04, $18, $e7, $09, $f6, $00, $00, $03, $02, $91
	db $00, $00, $00, $00, $00, $01, $02, $47, $11, $00, $00, $00, $00, $02, $06, $02
	db $20, $80, $00, $32, $b2, $02, $04, $40, $bf, $0f, $f0, $00, $00, $01, $02, $08
	db $00, $00, $00, $00, $00, $02, $04, $30, $cf, $16, $e9, $00, $00
ENDC

Func_9ace0:: ; 9ace0
	db $f5, $c5, $e8, $8a, $d5, $2e, $00, $7d, $fe, $08, $d2, $08, $6d, $e5, $3e, $07
	db $95, $cd, $d0, $1a, $af, $fe, $0a, $d2, $03, $6d, $f5, $cd, $65, $04, $f1, $3c
	db $c3, $f5, $6c, $e1, $2c, $c3, $e7, $6c, $21, $1a, $c2, $36, $02, $23, $36, $44
	db $23, $36, $4f, $cd, $f8, $03, $21, $1a, $c2, $36, $36, $23, $36, $01, $23, $36
	db $69, $11, $03, $0f, $21, $07, $02, $cd, $f8, $03, $e5, $1e, $07, $21, $5c, $6f
	db $cd, $3e, $2a, $21, $1a, $c2, $36, $00, $23, $36, $11, $23, $36, $1c, $f8, $11
	db $d5, $e5, $d1, $e1, $21, $66, $00, $cd, $f8, $03, $f8, $05, $77, $af, $fe, $08
	db $d2, $6b, $6d, $f5, $cd, $d0, $1a, $af, $fe, $0a, $d2, $66, $6d, $f5, $cd, $65
	db $04, $f1, $3c, $c3, $58, $6d, $f1, $3c, $c3, $4e, $6d, $21, $1a, $c2, $36, $02
	db $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $21, $1a, $c2, $36, $36, $23, $36
	db $40, $23, $36, $6a, $e1, $cd, $f8, $03, $d1, $f8, $01, $7e, $fe, $ff, $c2, $95
	db $6d, $af, $c3, $59, $6f, $d5, $21, $1a, $c2, $36, $00, $23, $36, $27, $23, $36
	db $1c, $f8, $0f, $d5, $e5, $d1, $e1, $f8, $05, $cd, $f8, $03, $d5, $e5, $d1, $e1
	db $f8, $76, $72, $f8, $75, $73, $d1, $f8, $74, $7e, $fe, $ff, $ca, $c7, $6d, $f8
	db $73, $7e, $fe, $ff, $c2, $cb, $6d, $af, $c3, $59, $6f, $d5, $f8, $7b, $7e, $fe
	db $31, $ca, $1c, $6e, $fe, $28, $ca, $15, $6e, $fe, $24, $ca, $0e, $6e, $fe, $22
	db $ca, $07, $6e, $fe, $1d, $ca, $00, $6e, $fe, $1c, $ca, $f9, $6d, $fe, $1a, $c2
	db $20, $6e, $f8, $04, $36, $04, $c3, $20, $6e, $f8, $04, $36, $06, $c3, $20, $6e
	db $f8, $04, $36, $02, $c3, $20, $6e, $f8, $04, $36, $00, $c3, $20, $6e, $f8, $04
	db $36, $05, $c3, $20, $6e, $f8, $04, $36, $01, $c3, $20, $6e, $f8, $04, $36, $03
	db $f8, $03, $36, $01, $f8, $02, $36, $00, $0e, $00, $79, $fe, $08, $d2, $ae, $6e
	db $0c, $0d, $c2, $4f, $6e, $f8, $04, $6e, $26, $00, $29, $29, $29, $11, $a8, $6c
	db $19, $7e, $f8, $76, $be, $ca, $4c, $6e, $f8, $03, $36, $00, $c3, $aa, $6e, $79
	db $fe, $01, $c2, $70, $6e, $f8, $04, $6e, $26, $00, $29, $29, $29, $11, $a8, $6c
	db $19, $23, $7e, $f8, $75, $be, $ca, $6d, $6e, $f8, $03, $36, $00, $c3, $aa, $6e
	db $f8, $75, $7e, $c6, $02, $6f, $79, $bd, $da, $7e, $6e, $c3, $ae, $6e, $f8, $04
	db $6e, $26, $00, $29, $29, $29, $11, $a8, $6c, $19, $59, $16, $00, $19, $7e, $59
	db $16, $00, $f8, $03, $19, $be, $ca, $9d, $6e, $f8, $03, $36, $00, $f8, $02, $7e
	db $59, $16, $00, $f8, $03, $19, $86, $f8, $02, $77, $0c, $c3, $2a, $6e, $f8, $03
	db $7e, $fe, $01, $c2, $d0, $6e, $f8, $04, $6e, $26, $00, $5d, $54, $29, $4d, $44
	db $29, $29, $19, $09, $11, $54, $6c, $19, $11, $0a, $00, $19, $4e, $c3, $f1, $6e
	db $f8, $02, $6e, $26, $00, $11, $0a, $00, $cd, $c6, $36, $d5, $f8, $06, $6e, $26
	db $00, $5d, $54, $29, $4d, $44, $29, $29, $19, $09, $11, $54, $6c, $19, $d1, $19
	db $4e, $f8, $04, $5e, $16, $00, $21, $a1, $6c, $19, $7e, $fe, $03, $ca, $19, $6f
	db $fe, $02, $ca, $15, $6f, $fe, $01, $ca, $12, $6f, $b7, $c2, $19, $6f, $0d, $c3
	db $19, $6f, $c3, $19, $6f, $0d, $c3, $19, $6f, $d1, $f8, $76, $6e, $e5, $6b, $e5
	db $f8, $06, $5e, $16, $00, $21, $a1, $6c, $19, $7e, $3c, $5f, $f8, $7d, $7e, $cd
	db $6f, $6f, $c1, $c1, $fe, $ff, $ca, $57, $6f, $f8, $79, $7e, $e6, $07, $47, $3e
	db $01, $cd, $45, $36, $f5, $f8, $7b, $6e, $26, $00, $11, $08, $00, $cd, $c6, $36
	db $11, $c5, $c7, $19, $f1, $b6, $77, $3e, $01, $e8, $7a, $c9, $d8, $d3, $ba, $dd
	db $28, $c9, $29, $ce, $de, $c0, $dd, $28, $a6, $b5, $bc, $c3, $c8, $29, $00, $f5
	db $d5, $c5, $e8, $be, $f8, $01, $36, $00, $f8, $47, $6e, $26, $00, $11, $08, $00
	db $cd, $c6, $36, $11, $c5, $c7, $19, $5e, $f8, $47, $7e, $e6, $07, $47, $3e, $01
	db $cd, $45, $36, $a3, $ca, $9a, $6f, $c3, $33, $72, $21, $1a, $c2, $36, $05, $23
	db $36, $07, $23, $36, $60, $11, $19, $00, $3e, $03, $cd, $f8, $03, $f5, $f8, $46
	db $7e, $fe, $04, $ca, $26, $70, $fe, $03, $ca, $05, $70, $fe, $02, $ca, $e5, $6f
	db $fe, $01, $c2, $43, $70, $21, $1a, $c2, $36, $05, $23, $36, $d6, $23, $36, $5a
	db $0e, $0a, $f8, $26, $e5, $f8, $46, $6e, $26, $00, $11, $00, $04, $19, $d1, $cd
	db $f8, $03, $c3, $43, $70, $21, $1a, $c2, $36, $05, $23, $36, $d6, $23, $36, $5a
	db $0e, $08, $f8, $26, $d5, $e5, $d1, $e1, $f8, $44, $6e, $26, $00, $24, $24, $cd
	db $f8, $03, $c3, $43, $70, $21, $1a, $c2, $36, $05, $23, $36, $d6, $23, $36, $5a
	db $0e, $05, $f8, $26, $d5, $e5, $d1, $e1, $f8, $44, $7e, $e6, $3f, $6f, $26, $00
	db $cd, $f8, $03, $c3, $43, $70, $21, $1a, $c2, $36, $05, $23, $36, $d6, $23, $36
	db $5a, $0e, $06, $f8, $26, $e5, $f8, $46, $6e, $26, $00, $11, $ff, $05, $19, $d1
	db $cd, $f8, $03, $f1, $cd, $d5, $03, $fa, $59, $c8, $b7, $ca, $ad, $70, $3e, $31
	db $cd, $02, $15, $f8, $4c, $5e, $16, $00, $21, $d6, $c2, $6e, $26, $00, $cd, $59
	db $37, $d5, $e5, $d1, $e1, $cd, $75, $38, $28, $c8, $19, $d5, $e5, $d1, $e1, $f8
	db $4a, $6e, $26, $00, $19, $7e, $f8, $00, $77, $f8, $4c, $5e, $16, $00, $21, $d6
	db $c2, $6e, $26, $00, $cd, $59, $37, $d5, $e5, $d1, $e1, $cd, $75, $38, $28, $c8
	db $19, $d5, $e5, $d1, $e1, $f8, $4a, $6e, $26, $00, $19, $fa, $59, $c8, $77, $21
	db $1a, $c2, $36, $02, $23, $36, $44, $23, $36, $4f, $cd, $f8, $03, $f8, $24, $d5
	db $e5, $d1, $e1, $f8, $06, $cd, $94, $14, $2b, $11, $39, $72, $cd, $d7, $26, $f8
	db $06, $cd, $97, $37, $21, $00, $00, $cd, $8b, $37, $3e, $03, $ea, $9a, $c3, $2e
	db $12, $e5, $0e, $14, $1e, $00, $af, $cd, $fc, $3a, $c1, $21, $1a, $c2, $36, $05
	db $23, $36, $95, $23, $36, $7e, $0e, $05, $1e, $14, $21, $0d, $00, $cd, $f8, $03
	db $2e, $12, $e5, $0e, $14, $1e, $00, $af, $cd, $c5, $3b, $c1, $21, $1a, $c2, $36
	db $03, $23, $36, $68, $23, $36, $48, $0e, $80, $f8, $02, $d5, $e5, $d1, $e1, $21
	db $0e, $01, $cd, $f8, $03, $21, $1a, $c2, $36, $02, $23, $36, $44, $23, $36, $4f
	db $cd, $f8, $03, $f8, $44, $7e, $fe, $04, $ca, $89, $71, $fe, $03, $ca, $6f, $71
	db $fe, $02, $ca, $56, $71, $fe, $01, $c2, $a1, $71, $21, $1a, $c2, $36, $16, $23
	db $36, $e0, $23, $36, $60, $0e, $00, $1e, $01, $f8, $42, $7e, $3c, $cd, $f8, $03
	db $f8, $01, $77, $c3, $a1, $71, $21, $1a, $c2, $36, $1a, $23, $36, $0d, $23, $36
	db $6f, $1e, $00, $f8, $42, $7e, $cd, $f8, $03, $f8, $01, $77, $c3, $a1, $71, $21
	db $1a, $c2, $36, $13, $23, $36, $5d, $23, $36, $6d, $1e, $00, $f8, $42, $7e, $3c
	db $cd, $f8, $03, $f8, $01, $77, $c3, $a1, $71, $21, $1a, $c2, $36, $0c, $23, $36
	db $f1, $23, $36, $5a, $0e, $14, $1e, $00, $f8, $42, $7e, $cd, $f8, $03, $f8, $01
	db $77, $f8, $01, $7e, $fe, $ff, $c2, $33, $72, $11, $41, $72, $f8, $06, $cd, $d7
	db $26, $f8, $06, $cd, $97, $37, $21, $00, $00, $cd, $8b, $37, $3e, $02, $ea, $9a
	db $c3, $21, $1a, $c2, $36, $05, $23, $36, $95, $23, $36, $7e, $0e, $05, $1e, $14
	db $21, $0d, $00, $cd, $f8, $03, $2e, $12, $e5, $0e, $14, $1e, $00, $af, $cd, $c5
	db $3b, $c1, $21, $1a, $c2, $36, $03, $23, $36, $68, $23, $36, $48, $0e, $80, $f8
	db $02, $d5, $e5, $d1, $e1, $21, $0e, $01, $cd, $f8, $03, $f8, $4c, $5e, $16, $00
	db $21, $d6, $c2, $6e, $26, $00, $cd, $59, $37, $d5, $e5, $d1, $e1, $cd, $75, $38
	db $28, $c8, $19, $d5, $e5, $d1, $e1, $f8, $4a, $6e, $26, $00, $19, $d5, $e5, $d1
	db $e1, $f8, $00, $7e, $12, $21, $1a, $c2, $36, $02, $23, $36, $44, $23, $36, $4f
	db $cd, $f8, $03, $f8, $01, $7e, $e8, $48, $c9, $28, $a6, $d0, $c2, $b9, $c0, $29
	db $00, $28, $ba, $da, $b2, $bc, $de, $ae, $b3, $20, $cb, $db, $b4, $c5, $b2, $29
	db $00

Func_9b251:: ; 9b251
	db $af, $ea, $85, $c7, $21, $00, $00, $cd, $55, $38, $86, $c7, $af, $ea, $88, $c7
	db $c9

Func_9b262::
	ld [wc785], a
	reg16swap de, hl
	write_hl_to wc786
	ld a, c
	ld [wc788], a
	call Func_9b276
	ret

Func_9b276:
	push bc
	push bc
	push bc
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b286
	jp Func_9b322

Func_9b286:
	ld e, $0
Func_9b288:
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b314
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b30f
	ld hl, sp+$6
	ld a, [hl]
	and $10
	jp nz, Func_9b30f
	ld a, [wc859]
	or a
	jp z, Func_9b30f
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
Func_9b30f:
	pop de
	inc e
	jp Func_9b288

Func_9b314:
	callba_hli Func_8f44
Func_9b322:
	pop bc
	pop bc
	pop bc
	ret

Func_9b326::
	add sp, -$4a
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b335
	jp Func_9b72f

Func_9b335:
	ld e, $0
Func_9b337:
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b72f
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$45
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$4a
	ld [hl], a
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b38c
	jp Func_9b72a

Func_9b38c:
	ld hl, sp+$44
	ld a, [wPlayerMapX]
	ld [hl], a
	ld a, [wPlayerMapY]
	ld e, a
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b3cd
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_9b3c6
	cp $2
	jp z, Func_9b3c2
	cp $1
	jp z, Func_9b3b8
	or a
	jp nz, Func_9b3cd
	dec e
	jp Func_9b3cd

Func_9b3b8:
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	jp Func_9b3cd

Func_9b3c2:
	inc e
	jp Func_9b3cd

Func_9b3c6:
	ld hl, sp+$44
	ld a, [hl]
	dec a
	ld hl, sp+$44
	ld [hl], a
Func_9b3cd:
	ld hl, sp+$46
	ld a, [hl]
	ld hl, sp+$44
	cp [hl]
	jp nz, Func_9b72a
	ld hl, sp+$47
	ld a, [hl]
	cp e
	jp nz, Func_9b72a
	ld hl, sp+$4a
	ld a, [hl]
	cp $31
	jp z, Func_9b403
	cp $28
	jp z, Func_9b403
	cp $24
	jp z, Func_9b403
	cp $22
	jp z, Func_9b403
	cp $1d
	jp z, Func_9b403
	cp $1c
	jp z, Func_9b403
	cp $1a
	jp nz, Func_9b44d
Func_9b403:
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	set_farcall_addrs_hli DrawTextBoxAndOverworldText
	ld c, $0
	ld e, $c
	ld hl, $69
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	jp Func_9b72a

Func_9b44d:
	push de
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4c
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b4c2
	cp $2
	jp z, Func_9b49f
	cp $1
	jp nz, Func_9b4e1
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	push hl
	ld l, a
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	ld c, $a
	call FarCall
	jp Func_9b4e1

Func_9b49f:
	ld hl, sp+$4d
	ld a, [hl]
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	inc h
	inc h
	ld c, $8
	call FarCall
	jp Func_9b4e1

Func_9b4c2:
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld c, $5
	call FarCall
Func_9b4e1:
	pop af
	call GetSRAMBank
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b557
	ld a, [wc859]
	or a
	jp z, Func_9b554
	push de
	ld a, $31
	call OverworldPlaySFX
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
	callba_hli Func_8f44
	pop de
Func_9b554:
	jp Func_9b55e

Func_9b557:
	push de
	ld a, $2a
	call OverworldPlaySFX
	pop de
Func_9b55e:
	push de
	ld hl, sp+$28
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	dec hl
	ld de, $7732
	call CopyUntilNull
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	ld hl, sp+$4a
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b652
	cp $2
	jp z, Func_9b639
	cp $1
	jp nz, Func_9b668
	set_farcall_addrs_hli Func_5a0e0
	ld c, $0
	ld e, $1
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b639:
	set_farcall_addrs_hli Func_6af0d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b652:
	set_farcall_addrs_hli Func_4ed5d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
Func_9b668:
	pop de
	ld hl, sp+$3
	ld a, [hl]
	cp $ff
	jp nz, Func_9b70c
	push de
	ld de, $773a
	ld hl, sp+$a
	call CopyUntilNull
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b6fb
	ld a, [wc859]
	or a
	jp z, Func_9b6fb
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$44
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
Func_9b6fb:
	callba_hli Func_8f44
	jp Func_9b72a

Func_9b70c:
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	push af
	ld hl, sp+$4c
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	pop af
	or [hl]
	ld [hl], a
Func_9b72a:
	pop de
	inc e
	jp Func_9b337

Func_9b72f:
	add sp, $4a
	ret

Data_9b732:
	dstr "(をみつけた)"

Data_9b73a:
	dstr "(これいしﾞょう ひろえない)"


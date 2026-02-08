Func_14000: ; 14000
	ret

Func_14001: ; 14001
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_1400e: ; 1400e
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_1401b: ; 1401b
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Menu: ; 14028 (5:4028)
; Args: 7 bytes on stack, bc, de, hl
	push hl
	add sp, -$32
	ld hl, sp+$32
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a

	push hl
	push de
	ld hl, sp+$19
	write_hl_to_sp_plus $b
	read_hl_from_sp_plus $3c
	ld l, h
	ld h, $0
	write_hl_to_sp_plus $f
	read_hl_from_sp_plus $3c
	ld h, $0
	write_hl_to_sp_plus $d
	read_hl_from_sp_plus $3e
	ld l, h
	ld h, $0
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $3e
	ld h, $0
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $40
	ld l, h
	ld h, $0
	write_hl_to_sp_plus $11
	pop hl
	write_hl_to_sp_plus $17
	ld l, c
	ld h, b
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $3e
	ld c, l
	read_hl_from_sp_plus $13
	ld a, l
	inc a
	or h
	jp nz, .dont_write_m1_a
	ld hl, -1
	write_hl_to_sp_plus $13
.dont_write_m1_a: ; 1408f (5:408f)
	read_hl_from_sp_plus $b
	ld a, l
	inc a
	or h
	jp nz, .dont_write_m1_b
	ld hl, -1
	write_hl_to_sp_plus $b
.dont_write_m1_b: ; 140a0 (5:40a0)
	read_hl_from_sp_plus $d
	ld a, l
	inc a
	or h
	jp nz, .dont_write_m1_c
	ld hl, -1
	write_hl_to_sp_plus $d
.dont_write_m1_c: ; 140b1 (5:40b1)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$3e
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld hl, sp+$6
	ld [hl], a
	pop hl
	push bc
	reg16swap de, hl
	ld hl, sp+$17
	ld bc, $1f
	call FarCopyVideoData
	pop bc
	ld a, c
	cp $3
	jp c, Func_1436d
	push bc
	ld de, $19
	ld a, $3
	call GetBanks
	ld hl, sp+$3e
	ld [hl], a
	pop bc
	push bc
	ld a, c
	cp $1f
	jp z, Func_1435c
	cp $18
	jp z, Func_1433d
	cp $25
	jp z, Func_142f2
	cp $d
	jp z, Func_142f2
	cp $c
	jp z, Func_142be
	cp $b
	jp z, Func_1428a
	cp $8
	jp z, Func_14237
	cp $21
	jp z, Func_1422a
	cp $16
	jp z, Func_1422a
	cp $a
	jp z, Func_1422a
	cp $24
	jp z, Func_1422a
	cp $7
	jp z, Func_1422a
	cp $6
	jp z, Func_1422a
	cp $15
	jp z, Func_1421d
	cp $9
	jp z, Func_1421d
	cp $5
	jp z, Func_1421d
	cp $4
	jp z, Func_1421d
	cp $11
	jp z, Func_141e6
	cp $12
	jp z, Func_141d9
	cp $10
	jp z, Func_141d9
	cp $3
	jp z, Func_141d9
	cp $26
	jp z, Func_141b9
	cp $20
	jp z, Func_141b9
	cp $1d
	jp z, Func_141b9
	cp $17
	jp z, Func_141b9
	cp $23
	jp z, .getPartyBots
	cp $22
	jp z, .getPartyBots
	cp $1c
	jp z, .getPartyBots
	cp $14
	jp z, .getPartyBots
	cp $13
	jp nz, Func_14366
.getPartyBots: ; 14180 (5:4180)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld hl, $0
.partyLoop: ; 1418a (5:418a)
	ld de, $4
	call CompareHLtoDE
	jp nc, .partyBreak
	push hl
	get_party_bot
	ld a, [hl]
	or a
	jp z, .next_bot
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
.next_bot: ; 141b1 (5:41b1)
	pop hl
	inc hl
	jp .partyLoop

.partyBreak: ; 141b6 (5:41b6)
	jp Func_14366

Func_141b9: ; 141b9 (5:41b9)
	ld de, $19
	ld a, $2
	call GetBanks
	callba_hli Func_7cd1
	ld l, a
	ld h, $0
	write_hl_to_sp_plus $f
	jp Func_14366

Func_141d9: ; 141d9 (5:41d9)
	ld hl, wSaveScratchca6c
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $f
	jp Func_14366

Func_141e6: ; 141e6 (5:41e6)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld bc, $0
Func_141f0: ; 141f0 (5:41f0)
	ld l, c
	ld h, b
	ld de, $50
	call CompareHLtoDE
	jp nc, Func_1421a
	ld l, c
	ld h, b
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_14213
	read_hl_from_sp_plus $f
	inc hl
	write_hl_to_sp_plus $f
	jp Func_14216

Func_14213: ; 14213 (5:4213)
	jp Func_1421a

Func_14216: ; 14216 (5:4216)
	inc bc
	jp Func_141f0

Func_1421a: ; 1421a (5:421a)
	jp Func_14366

Func_1421d: ; 1421d (5:421d)
	ld hl, wc9a2
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $f
	jp Func_14366

Func_1422a: ; 1422a (5:422a)
	ld hl, wc9b7
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $f
	jp Func_14366

Func_14237: ; 14237 (5:4237)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld hl, $0
	call WriteHLToSPPlus6
Func_14244: ; 14244 (5:4244)
	call GetHLAtSPPlus6
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_14287
	ld hl, wc2e9
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_1427d
	read_hl_from_sp_plus $f
	inc hl
	write_hl_to_sp_plus $f
Func_1427d: ; 1427d (5:427d)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_14244

Func_14287: ; 14287 (5:4287)
	jp Func_14366

Func_1428a: ; 1428a (5:428a)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld bc, $0
Func_14294: ; 14294 (5:4294)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_142bb
	ld hl, wSaveBlock4
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142b4
	read_hl_from_sp_plus $f
	inc hl
	write_hl_to_sp_plus $f
	jp Func_142b7

Func_142b4: ; 142b4 (5:42b4)
	jp Func_142bb

Func_142b7: ; 142b7 (5:42b7)
	inc bc
	jp Func_14294

Func_142bb: ; 142bb (5:42bb)
	jp Func_14366

Func_142be: ; 142be (5:42be)
	ld hl, $0
	write_hl_to_sp_plus $f
	ld bc, $0
Func_142c8: ; 142c8 (5:42c8)
	ld l, c
	ld h, b
	ld de, $dc
	call CompareHLtoDE
	jp nc, Func_142ef
	ld hl, wSaveBlock3
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142e8
	read_hl_from_sp_plus $f
	inc hl
	write_hl_to_sp_plus $f
	jp Func_142eb

Func_142e8: ; 142e8 (5:42e8)
	jp Func_142ef

Func_142eb: ; 142eb (5:42eb)
	inc bc
	jp Func_142c8

Func_142ef: ; 142ef (5:42ef)
	jp Func_14366

Func_142f2: ; 142f2 (5:42f2)
	ld hl, sp+$3e
	ld a, [hl]
	call GetSRAMBank
	ld hl, $1
	write_hl_to_sp_plus $f
	ld bc, $0
Func_14302: ; 14302 (5:4302)
	ld l, c
	ld h, b
	ld de, $8
	call CompareHLtoDE
	jp nc, Func_1433a
	ld l, c
	ld h, b
	ld de, $7
	call CompareHLtoDE
	jp nc, Func_14336
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	inc hl
	inc hl
	inc hl
	inc hl
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_14336
	read_hl_from_sp_plus $f
	inc hl
	write_hl_to_sp_plus $f
Func_14336: ; 14336 (5:4336)
	inc bc
	jp Func_14302

Func_1433a: ; 1433a (5:433a)
	jp Func_14366

Func_1433d: ; 1433d (5:433d)
	ld a, [wBackupMapGroup]
	or a
	jp nz, Func_14352
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	inc hl
	write_hl_to_sp_plus $f
	jp Func_14359

Func_14352: ; 14352 (5:4352)
	ld hl, $7
	write_hl_to_sp_plus $f
Func_14359: ; 14359 (5:4359)
	jp Func_14366

Func_1435c: ; 1435c (5:435c)
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $f
Func_14366: ; 14366 (5:4366)
	ld hl, sp+$3e
	ld a, [hl]
	call GetSRAMBank
	pop bc
Func_1436d: ; 1436d (5:436d)
	push bc
	ld a, c
	cp $24
	jp z, Func_143e3
	cp $22
	jp z, Func_143e3
	cp $21
	jp z, Func_143e3
	cp $1e
	jp z, Func_143e3
	cp $1b
	jp z, Func_143e3
	cp $14
	jp z, Func_143e3
	cp $13
	jp z, Func_143e3
	cp $d
	jp z, Func_143e3
	cp $5
	jp z, Func_143e3
	cp $26
	jp z, Func_143dd
	cp $20
	jp z, Func_143dd
	cp $1f
	jp z, Func_143dd
	cp $1d
	jp z, Func_143dd
	cp $11
	jp z, Func_143dd
	cp $10
	jp z, Func_143dd
	cp $e
	jp z, Func_143dd
	cp $8
	jp z, Func_143dd
	cp $7
	jp z, Func_143dd
	cp $6
	jp z, Func_143dd
	cp $4
	jp z, Func_143dd
	cp $3
	jp z, Func_143dd
	cp $2
	jp nz, Func_143e6
Func_143dd: ; 143dd (5:43dd)
	call Func_3af6
	jp Func_143e6

Func_143e3: ; 143e3 (5:43e3)
	call FillVisibleAreaWithBlankTile
Func_143e6: ; 143e6 (5:43e6)
	pop bc
	push bc
	ld a, c
	cp $1
	jp nz, .only_once
.forever
	ld hl, sp+$6
	call HandleMenu
	jp .forever

.only_once
	ld hl, sp+$6
	call HandleMenu
	pop bc
	push hl
	ld a, c
	cp $1a
	jp z, Func_1444f
	cp $1b
	jp z, Func_1444f
	cp $d
	jp z, Func_1444f
	cp $22
	jp z, Func_1444f
	cp $13
	jp z, Func_1444f
	cp $24
	jp z, Func_14449
	cp $1f
	jp z, Func_14449
	cp $14
	jp z, Func_14449
	cp $11
	jp z, Func_14449
	cp $10
	jp z, Func_14449
	cp $e
	jp z, Func_14449
	cp $8
	jp z, Func_14449
	cp $7
	jp z, Func_14449
	cp $5
	jp z, Func_14449
	cp $4
	jp nz, Func_14452
Func_14449: ; 14449 (5:4449)
	call Func_3af6
	jp Func_14452

Func_1444f: ; 1444f (5:444f)
	call FillVisibleAreaWithBlankTile
Func_14452: ; 14452 (5:4452)
	pop hl
	reg16swap de, hl
	add sp, $34
	reg16swap de, hl
	ret

MenuWithSecondaryHeader: ; 1445e
	push hl
	add sp, -$10
	push bc
	ld a, c
	ld [wFarCallDestBank], a
	ld hl, sp+$2
	ld bc, $f
	call FarCopyVideoData
	pop bc
	ld l, c
	push hl
	ld hl, sp+$10 ; [0e]
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $c
	ld h, l
	ld l, $0
	add hl, bc
	push hl
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlus10
	push hl
	call GetHLAtSPPlus10
	ld h, l
	ld l, $0
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $16
	ld c, l
	ld b, h
	read_hl_from_sp_plus $14
	push hl
	read_hl_from_sp_plus $1c
	pop de
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	reg16swap de, hl
	add sp, $12
	reg16swap de, hl
	ret

Func_144bd: ; 144bd
	ld l, BANK(Data_54001)
	push hl
	ld hl, $600
	push hl
	ld hl, $ff06
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_544f7
	ld de, $0
	ld hl, Data_54001
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_144dd: ; 144dd (5:44dd)
	ld l, BANK(Data_54020)
	push hl
	ld hl, $81e
	push hl
	ld hl, $ff08
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_54548
	ld de, $0
	ld hl, Data_54020
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_144fd:: ; 144fd (5:44fd)
	push bc
	ld c, $1
	push bc
	ld hl, sp+$2
	ld [hl], $1
	call Func_17470
	call Func_204c
	pop bc
	ld a, [wc213]
	cp $ff
	jp nz, Func_1451a
	ld c, $0
	xor a
	ld [wc213], a
Func_1451a: ; 1451a (5:451a)
	push bc
	set_farcall_addrs_hli CalcSaveChecksum
	ld a, $1
	call FarCall
	push hl
	set_farcall_addrs_hli GetSaveChecksum
	ld a, $1
	call FarCall
	reg16swap de, hl
	push de
	set_farcall_addrs_hli ValidateSaveGameSignature
	pop de
	pop hl
	call CompareHLtoDE
	jp nz, Func_1455c
	call FarCall
	cp $ff
	jp nz, Func_14560
Func_1455c: ; 1455c (5:455c)
	ld hl, sp+$2
	ld [hl], $ff
Func_14560: ; 14560 (5:4560)
	pop bc
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_145ef
	ld a, [wSystemType]
	cp $1
	jp z, Func_14579
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_1458e
Func_14579: ; 14579 (5:4579)
	push bc
	set_farcall_addrs_hli Func_fbd5e
	pop bc
	ld e, c
	xor a
	call FarCall
	jp Func_145ec

Func_1458e: ; 1458e (5:458e)
	inc c
	dec c
	jp nz, Func_145b5
	ld l, BANK(Data_5403f)
	push hl
	ld hl, $502
	push hl
	ld hl, $ff05
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_545a5
	ld de, $0
	ld hl, Data_5403f
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_145ec

Func_145b5: ; 145b5 (5:45b5)
	ld l, BANK(Data_5405e)
	push hl
	ld e, c
	ld d, $0
	ld hl, $5
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld h, l
	ld l, $0
	inc hl
	inc hl
	push hl
	ld e, c
	ld d, $0
	ld hl, $5
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec h
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_545a5
	ld de, $0
	ld hl, Data_5405e
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
Func_145ec: ; 145ec (5:45ec)
	jp Func_14673

Func_145ef: ; 145ef (5:45ef)
	ld a, [wSystemType]
	cp $1
	jp z, Func_145ff
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_14615
Func_145ff: ; 145ff (5:45ff)
	push bc
	set_farcall_addrs_hli Func_fbd5e
	pop bc
	ld e, c
	ld a, $1
	call FarCall
	jp Func_14673

Func_14615: ; 14615 (5:4615)
	inc c
	dec c
	jp nz, Func_1463c
	ld l, BANK(Data_5407d)
	push hl
	ld hl, $402
	push hl
	ld hl, $ff04
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_545e4
	ld de, $0
	ld hl, Data_5407d
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14673

Func_1463c: ; 1463c (5:463c)
	ld l, BANK(Data_5409c)
	push hl
	ld e, c
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld h, l
	ld l, $0
	inc hl
	inc hl
	push hl
	ld e, c
	ld d, $0
	ld hl, $4
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec h
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_545e4
	ld de, $0
	ld hl, Data_5409c
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
Func_14673: ; 14673 (5:4673)
	pop bc
	ret

StartMenu: ; 14675 (5:4675)
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	and $7f
	call FarCall
	ld bc, $800
	ld e, $8f
	hlbgcoord 0, 0
	call FillMemory
	check_cgb
	jp nz, Func_146b5
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	ld bc, $800
	ld e, $0
	hlbgcoord 0, 0
	call FillMemory
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_146b5: ; 146b5 (5:46b5)
	set_farcall_addrs_hli Func_6183
	ld a, [wLCDC]
	or $80
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	check_cgb
	jp nz, Func_14703
	set_farcall_addrs_hli Func_613fc
	ld e, $0
	xor a
	call FarCall
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
	jp Func_14717

Func_14703: ; 14703 (5:4703)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_14717: ; 14717 (5:4717)
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
Func_1472c: ; 1472c (5:472c)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_1472c
	call Func_17470
	ld l, BANK(StartMenuHeader)
	push hl
	ld hl, $702
	push hl
	ld hl, $ff07
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_54614
	ld de, -1
	ld hl, StartMenuHeader
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, [wc317]
	or a
	jp z, Func_14763
	xor a
	ld [wc317], a
Func_14763: ; 14763 (5:4763)
	call Func_17488
	ret

Data_14767: ; 14767
	db  0
	db -1
	db  1
	db  2
	db  3
	db  4
	db  5
	db  6
	db  7
	db  8

DisplayPartyMenu_:: ; 14771 (5:4771)
	push af
	xor a
	ld [wc396 + 3], a
	ld [wc396 + 2], a
	ld [wc396 + 1], a
	ld [wc396], a
	pop af
	cp $1
	jp z, Func_147d4
	cp $9
	jp z, Func_147b1
	cp $8
	jp z, Func_147b1
	cp $7
	jp z, Func_147b1
	cp $6
	jp z, Func_147b1
	cp $5
	jp z, Func_147b1
	cp $4
	jp z, Func_147b1
	cp $3
	jp z, Func_147b1
	cp $2
	jp z, Func_147b1
	or a
	jp nz, Func_147e7
Func_147b1: ; 147b1 (5:47b1)
	push af
	set_farcall_addrs_hli DisplayPartyMenu
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_14767
	add hl, de
	ld e, [hl]
	ld d, $0
	ld a, $6
	call FarCall
	ld a, l
	ld [wc310], a
	jp Func_147e7

Func_147d4: ; 147d4 (5:47d4)
	set_farcall_addrs_hli DisplayPartyMenu
	ld de, $0
	ld a, $7
	call FarCall
Func_147e7: ; 147e7 (5:47e7)
	ret

Func_147e8: ; 147e8
	call Func_1fbe
	ld l, BANK(Data_540f9)
	push hl
	ld hl, $17
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $11
	ld de, $0
	ld hl, Data_540f9
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_1480e: ; 1480e
	ld l, BANK(Data_541b3)
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546af
	ld de, $0
	ld hl, Data_541b3
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1482e:: ; 1482e (5:482e)
	ld l, BANK(Data_541d2)
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546c1
	ld de, $0
	ld hl, Data_541d2
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

UseTossSelect: ; 1484e
	ld l, BANK(Data_541f1)
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546d0
	ld de, $0
	ld hl, Data_541f1
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

MainMenuSubmenu_Belongings: ; 1486e
	ld l, BANK(Data_54118)
	push hl
	ld hl, $300
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_5464c
	ld de, $0
	ld hl, Data_54118
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_1488e: ; 1488e
	ld l, BANK(Data_540bb)
	push hl
	ld hl, $3
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, Data_540bb
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_148ae: ; 148ae
	ld l, BANK(Data_54137)
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_54686
	ld de, $0
	ld hl, Data_54137
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_148ce: ; 148ce
	call Func_1fbe
	ld l, BANK(Data_54156)
	push hl
	ld hl, $6
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $2
	ld de, -1
	ld hl, Data_54156
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_148f4: ; 148f4
	call Func_1fbe
	ld l, BANK(Data_54175)
	push hl
	ld hl, $24
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $5
	ld de, -1
	ld hl, Data_54175
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

Func_1491a: ; 1491a
	call Func_1fbe
	ld l, BANK(Data_54194)
	push hl
	ld hl, $7
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $2
	ld de, -1
	ld hl, Data_54194
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ret

MainMenuSubmenu_Warehouse:: ; 14940
	ld l, BANK(Data_5428c)
	push hl
	ld hl, $402
	push hl
	ld hl, $ff04
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546e0
	ld de, $0
	ld hl, Data_5428c
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

MainMenuSubmenu_Data: ; 14960
	ld l, BANK(Data_566a9)
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, $66c8
	ld de, $0
	ld hl, Data_566a9
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14980: ; 14980
	ld l, BANK(Data_543a2)
	push hl
	ld hl, $21
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, Data_543a2
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_149b2
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_149c6
Func_149b2: ; 149b2 (5:49b2)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_149c6: ; 149c6 (5:49c6)
	callba_hli Func_e1e83
	ret

Func_149d5: ; 149d5
	push bc
	ld hl, sp+$0
	xor a
	ld [hl], a
	ld hl, sp+$1
	ld [hl], a
	xor a
Func_149de: ; 149de (5:49de)
	cp $a8
	jp nc, Func_14a07
	push af
	set_farcall_addrs_hli Func_53b1e
	pop af
	push af
	ld e, $0
	call FarCall
	cp $1
	jp nz, Func_14a02
	ld hl, sp+$3
	ld a, [hl]
	inc a
	ld hl, sp+$3
	ld [hl], a
Func_14a02: ; 14a02 (5:4a02)
	pop af
	inc a
	jp Func_149de

Func_14a07: ; 14a07 (5:4a07)
	xor a
Func_14a08: ; 14a08 (5:4a08)
	cp $a8
	jp nc, Func_14a31
	push af
	set_farcall_addrs_hli Func_53b1e
	pop af
	push af
	ld e, $1
	call FarCall
	cp $1
	jp nz, Func_14a2c
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
Func_14a2c: ; 14a2c (5:4a2c)
	pop af
	inc a
	jp Func_14a08

Func_14a31: ; 14a31 (5:4a31)
	ld hl, sp+$1
	ld a, [hl]
	ld [wc39c], a
	ld hl, sp+$0
	ld a, [hl]
	ld [wc39d], a
	call Func_1fbe
	ld l, BANK(Data_543c1)
	push hl
	ld hl, $961e
	push hl
	ld hl, $ff0b
	push hl
	ld hl, $0
	push hl
	ld bc, $6
	ld de, -1
	ld hl, Data_543c1
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	pop bc
	ret

Func_14a64: ; 14a64
	ld l, BANK(Data_543e0)
	push hl
	ld hl, $1e
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, -1
	ld hl, Data_543e0
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14a84: ; 14a84
	ld l, BANK(Data_542ca)
	push hl
	ld hl, $9
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $7
	ld de, $0
	ld hl, Data_542ca
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14aa4: ; 14aa4
	ld l, BANK(Data_542ab)
	push hl
	ld hl, $10
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $d
	ld de, $0
	ld hl, Data_542ab
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14ac4: ; 14ac4
	ld l, BANK(Data_542e9)
	push hl
	ld hl, $a
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $9
	ld de, $0
	ld hl, Data_542e9
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14ae4: ; 14ae4
	ld l, BANK(Data_54308)
	push hl
	ld hl, $11
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $e
	ld de, $0
	ld hl, Data_54308
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14b04: ; 14b04
	ld l, BANK(Data_54327)
	push hl
	ld hl, $b
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $a
	ld de, $0
	ld hl, Data_54327
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_14b24: ; 14b24
	ld l, BANK(Data_54346)
	push hl
	ld hl, $c
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $b
	ld de, $0
	ld hl, Data_54346
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

ReceptionCommandMenu:: ; 14b44
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $c8
	call malloc
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpAttrMapRectangle
	set_farcall_addrs_hli Func_da901
	ld de, $b05
	ld hl, $900
	call FarCall
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_da901
	ld de, $1405
	ld hl, $d
	call FarCall
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_14bc4
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_14be6
Func_14bc4: ; 14bc4 (5:4bc4)
	ld l, BANK(Data_5441e)
	push hl
	ld hl, $200
	push hl
	ld hl, $ff02
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546fd
	ld de, $0
	ld hl, Data_5441e
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14c05

Func_14be6: ; 14be6 (5:4be6)
	ld l, BANK(Data_543ff)
	push hl
	ld hl, $300
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_546fd
	ld de, $0
	ld hl, Data_543ff
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
Func_14c05: ; 14c05 (5:4c05)
	call Func_14001
	pop hl
	pop bc
	pop de
	push hl
	push bc
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreAttrMapRectangle
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	call Func_1400e
	pop hl
	call free
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	ret

Func_14c55: ; 14c55
	call Func_17470
	ld l, BANK(Data_5443d)
	push hl
	ld hl, $151f
	push hl
	ld hl, $ff15
	push hl
	ld hl, $0
	push hl
	ld bc, $c
	ld de, -1
	ld hl, Data_5443d
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_17488
	callba_hli Func_69436
	ret

MartMenu: ; 14c89
	ld l, BANK(Data_5445c)
	push hl
	ld hl, $61e
	push hl
	ld hl, $ff06
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_54727
	ld de, $0
	ld hl, Data_5445c
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

ElevatorMenu:: ; 14ca9
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $c8
	call malloc
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call BackUpAttrMapRectangle
	ld l, BANK(Data_5447b)
	push hl
	ld hl, $18
	push hl
	ld hl, $ff05
	push hl
	ld hl, $0
	push hl
	ld bc, $0
	ld de, $0
	ld hl, Data_5447b
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	pop de
	push hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call RestoreTileMapRectangle
	pop de
	push de
	ld hl, $64
	add hl, de
	ld c, l
	ld b, h
	ld de, $1405
	ld hl, $d
	call RestoreAttrMapRectangle
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	call free
	pop hl
	ld a, l
	and h
	inc a
	jp nz, Func_14d48
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
Func_14d48: ; 14d48 (5:4d48)
	ld a, l
	ret

NamingScreen: ; 14d4a (5:4d4a)
	or a
	jp nz, Func_14d70
	ld l, BANK(Data_5449a)
	push hl
	ld hl, $381b
	push hl
	ld hl, $ff38
	push hl
	ld hl, $0
	push hl
	ld bc, $13
	ld de, -1
	ld hl, Data_5449a
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	jp Func_14d8f

Func_14d70: ; 14d70 (5:4d70)
	ld l, BANK(Data_5449a)
	push hl
	ld hl, $381b
	push hl
	ld hl, $ff38
	push hl
	ld hl, $0
	push hl
	ld bc, $19
	ld de, -1
	ld hl, Data_5449a
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
Func_14d8f: ; 14d8f (5:4d8f)
	call Func_2009
	ret

Func_14d93:: ; 14d93 (5:4d93)
	ld l, BANK(Data_544b9)
	push hl
	ld hl, $1b
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $14
	ld de, -1
	ld hl, Data_544b9
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	push hl
	call Func_2009
	pop hl
	ret

Func_14db8: ; 14db8
	push bc
	ld c, l
	ld b, h
	xor a
	ld [wc2f7], a
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
	ld hl, sp+$1
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld e, [hl]
	push de
	ld de, $19
	ld a, $3
	call GetBanks
	pop de
	push de
	push af
	ld a, e
	cp $33
	jp z, Func_14ecb
	or a
	jp z, Func_14ecb
	cp $d
	jp z, Func_14e68
	cp $e
	jp z, Func_14e0b
	cp $32
	jp nz, Func_14edb
	ld hl, sp+$4
	ld a, [wc2f6]
	ld [hl], a
	xor a
	ld [wc2f6], a
	jp Func_14edb

Func_14e0b: ; 14e0b (5:4e0b)
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wc2f6], a
	ld bc, $0
Func_14e20: ; 14e20 (5:4e20)
	ld l, c
	ld h, b
	ld de, $14
	call CompareHLtoDE
	jp nc, Func_14e65
	ld hl, wSaveScratchBagItems
	add hl, bc
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	cp [hl]
	jp nz, Func_14e61
	ld hl, wSaveScratchBagItemQuantities
	add hl, bc
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	add [hl]
	cp 100
	jp c, Func_14e61
	ld hl, wSaveScratchBagItemQuantities
	add hl, bc
	ld a, 99
	sub [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wc2f6], a
Func_14e61: ; 14e61 (5:4e61)
	inc bc
	jp Func_14e20

Func_14e65: ; 14e65 (5:4e65)
	jp Func_14edb

Func_14e68: ; 14e68 (5:4e68)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wc2f6], a
	ld bc, $0
Func_14e7b: ; 14e7b (5:4e7b)
	ld l, c
	ld h, b
	ld de, $50
	call CompareHLtoDE
	jp nc, Func_14ec8
	ld l, c
	ld h, b
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	cp [hl]
	jp nz, Func_14ec4
	ld l, c
	ld h, b
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	add [hl]
	cp $64
	jp c, Func_14ec4
	ld l, c
	ld h, b
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, $63
	sub [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wc2f6], a
Func_14ec4: ; 14ec4 (5:4ec4)
	inc bc
	jp Func_14e7b

Func_14ec8: ; 14ec8 (5:4ec8)
	jp Func_14edb

Func_14ecb: ; 14ecb (5:4ecb)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld [wc2f6], a
Func_14edb: ; 14edb (5:4edb)
	pop af
	call GetSRAMBank
	call Func_1fbe
	pop de
	ld l, BANK(Data_544d8)
	push hl
	ld hl, $0
	push hl
	ld hl, $ff00
	push hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	push hl
	ld c, e
	ld b, $0
	ld de, $0
	ld hl, Data_544d8
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	ld hl, $0
	pop bc
	ret

BagSubmenu: ; 14f0e
	push bc
	push hl
	ld bc, $8000
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld hl, $64
	call malloc
	reg16swap de, hl
	push de
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call BackUpTileMapRectangle
	pop de
	pop bc
	pop hl
	push de
	push bc
	call WriteHLToSPPlus6
	call GetHLAtSPPlus6
	ld de, $5
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld e, l
	push de
	call UseTossSelect
	pop de
	pop bc
	ld a, l
	dec a
	or h
	jp z, .toss
	ld a, l
	or h
	jp nz, .pressed_b
	push de
	set_farcall_addrs_hli DoItemEffect
	pop de
	ld a, e
	call FarCall
	ld a, $ff
	ld [wc39b], a
	ld a, [wInBattle]
	or a
	jp nz, .skip_use
	ld a, [wc317]
	or a
	jp nz, .skip_use
	ld de, $19
	ld a, $3
	call GetBanks
	ld c, a
	call GetHLAtSPPlus4
	ld de, $7
	add hl, de
	ld a, [wSaveScratchca6c]
	ld e, a
	ld d, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, c
	call GetSRAMBank
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld bc, $8000
	jp .done_use

.skip_use: ; 14fc5 (5:4fc5)
	ld bc, -1
.done_use: ; 14fc8 (5:4fc8)
	jp .pressed_b

.toss: ; 14fcb (5:4fcb)
	push bc
	set_farcall_addrs_hli Func_33db7
	call GetHLAtSPPlus6
	call FarCall
	pop bc
.pressed_b: ; 14fde (5:4fde)
	pop de
	push bc
	push de
	ld a, [wInBattle]
	or a
	jp nz, Func_14ffa
	ld a, [wc317]
	or a
	jp nz, Func_14ffa
	ld c, e
	ld b, d
	ld de, $1405
	ld hl, $d
	call PopBGMapRegion
Func_14ffa: ; 14ffa (5:4ffa)
	pop hl
	call free
	pop hl
	pop bc
	ret

DrawDebugMenu: ; 15001 (5:5001)
	push bc
	push hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld c, [hl]
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	push bc
	push af
	call Func_1503d
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	pop af
	pop bc
	ld l, a
	push hl
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call PushBGMapRegion
	pop bc
	ld hl, $4000
	pop bc
	ret

Func_1503d: ; 1503d (5:503d)
	push hl
	add sp, -$4a
	ld hl, sp+$4a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $4c
	read_hl_from_sp_plus $4c
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$49
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$48
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld a, [hl]
	push af
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	read_hl_from_sp_plus $4e
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$47
	ld [hl], e
	read_hl_from_sp_plus $4e
	ld de, $b
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $4e
	ld de, $9
	add hl, de
	ld e, [hl]
	ld hl, sp+$46
	ld [hl], e
	read_hl_from_sp_plus $4e
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$45
	ld [hl], e
	read_hl_from_sp_plus $4e
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $45
	pop af
	ld e, a
	ld hl, sp+$49
	ld a, [hl]
	ld hl, sp+$48
	ld l, [hl]
	ld h, a
	call Func_17e95
	read_hl_from_sp_plus $4c
	call Func_17863
	ld hl, sp+$45
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $4c
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$49
	ld a, [hl]
	add $2
	ld hl, sp+$47
	ld [hl], a
	ld hl, sp+$48
	ld a, [hl]
	inc a
	ld hl, sp+$46
	ld [hl], a
	read_hl_from_sp_plus $4c
	ld e, [hl]
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$43
	add [hl]
	ld hl, sp+$44
	cp [hl]
	jp nc, Func_1514f
	xor a
Func_150eb: ; 150eb (5:50eb)
	ld hl, sp+$44
	cp [hl]
	jp nc, Func_1514c
	push af
	push de
	ld hl, sp+$4a
	ld e, [hl]
	ld hl, sp+$4b
	ld a, [hl]
	call SetStringStartState
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	pop af
	push af
	push de
	read_hl_from_sp_plus $47
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $2
	call FarCopyVideoData
	pop de
	push de
	ld a, e
	ld [wFarCallDestBank], a
	ld bc, $3f
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$6
	call FarCopyVideoData
	ld hl, sp+$6
	push hl
	ld hl, Data_151bc
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$4a
	ld a, [hl]
	add $2
	ld hl, sp+$4a
	ld [hl], a
	pop de
	pop af
	inc a
	jp Func_150eb

Func_1514c: ; 1514c (5:514c)
	jp Func_151b9

Func_1514f: ; 1514f (5:514f)
	ld hl, sp+$43
	ld c, [hl]
Func_15152: ; 15152 (5:5152)
	ld hl, sp+$43
	ld a, [hl]
	ld hl, sp+$44
	add [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_151b9
	push bc
	push de
	ld hl, sp+$4a
	ld e, [hl]
	ld hl, sp+$4b
	ld a, [hl]
	call SetStringStartState
	pop de
	ld a, e
	ld [wFarCallDestBank], a
	pop bc
	push bc
	push de
	read_hl_from_sp_plus $47
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $2
	call FarCopyVideoData
	pop de
	push de
	ld a, e
	ld [wFarCallDestBank], a
	ld bc, $3f
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$6
	call FarCopyVideoData
	ld hl, sp+$6
	push hl
	ld hl, Data_151bf
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$4a
	ld a, [hl]
	add $2
	ld hl, sp+$4a
	ld [hl], a
	pop de
	pop bc
	inc c
	jp Func_15152

Func_151b9: ; 151b9 (5:51b9)
	add sp, $4c
	ret

Data_151bc: ; 151bc
	dstr "%s"

Data_151bf: ; 151bf
	dstr "%s"

StartMenu_MoveCursor: ; 151c2
	push bc
	push bc
	push bc
	push de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus8
	ld de, $9
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, e
	dec a
	or d
	jp z, Func_15220
	ld a, e
	or d
	jp nz, Func_15258
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, .asm_1521d
	ld hl, $0
	call WriteHLToSPPlus4
	pop hl
	push hl
	dec hl
	pop de
	push hl
	inc h
	dec h
	bit 7, h
	jr z, .asm_1521d
	ld hl, $0
	pop de
	push hl
.asm_1521d
	jp Func_15258

Func_15220: ; 15220 (5:5220)
	call GetHLAtSPPlus4
	inc hl
	call WriteHLToSPPlus4
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp c, Func_15258
	ld l, c
	ld h, b
	dec hl
	call WriteHLToSPPlus4
	pop hl
	push hl
	inc hl
	pop de
	push hl
	pop hl
	push hl
	add hl, bc
	push hl
	call GetHLAtSPPlus8
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_15258
	pop hl
	push hl
	dec hl
	pop de
	push hl
Func_15258: ; 15258 (5:5258)
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	ld de, $5
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	call DrawDebugMenu
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Func_15281: ; 15281
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
	pop bc
	ret

Func_15297: ; 15297
	push hl
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_14001
	call Func_1400e
	pop bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, -1
	ret

Func_152bd: ; 152bd
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $5
	add hl, bc
	ld de, -1
	ld [hl], e
	inc hl
	ld [hl], d
	call FillVisibleAreaWithBlankTile
	ld hl, -1
	ret

Func_152db: ; 152db
	ld a, $ff
	ld [wc2f6], a
	ld hl, -1
	ret

Func_152e4: ; 152e4
	ld l, BANK(Data_54210)
	push hl
	ld hl, $302
	push hl
	ld hl, $ff03
	push hl
	ld hl, $0
	push hl
	ld bc, Pointers_54660
	ld de, $0
	ld hl, Data_54210
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_15304: ; 15304
	call Func_1fbe
	call Func_1f30
	ld l, BANK(Data_5422f)
	push hl
	ld hl, $4
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $1
	ld de, -1
	ld hl, Data_5422f
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_15330: ; 15330
	call Func_1fbe
	call Func_1f30
	ld l, BANK(Data_5424e)
	push hl
	ld hl, $5
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $3
	ld de, -1
	ld hl, Data_5424e
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_1535c: ; 1535c
	call Func_1fbe
	call Func_1f30
	ld l, BANK(Data_5426d)
	push hl
	ld hl, $4
	push hl
	ld hl, $ff00
	push hl
	ld hl, $0
	push hl
	ld bc, $1
	ld de, -1
	ld hl, Data_5426d
	call Menu
	pop bc
	pop bc
	pop bc
	pop bc
	call Func_2009
	call Func_1f7b
	ret

Func_15388: ; 15388
	push hl
	set_farcall_addrs_hli Func_61fb8
	pop hl
	call FarCall
	ret


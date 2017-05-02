Pointers_2326e: ; 2326e
	dw Data_23274
	dw Data_23284
	dw $0

Data_23274: ; 23274
	db "(つうしん)ハﾞトル(てﾞは)", $0

Data_23284: ; 23284
	db "(にけﾞられない)!", $0

DoBattle: ; 2328f (8:728f)
	add sp, -$52
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	write_hl_to_sp_plus $51
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $4f
	read_hl_from wCurRobotPointer
	ld de, $e4
	add hl, de
	write_hl_to_sp_plus $4d
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $4b
	set_farcall_addrs_hli Func_613fc
	read_hl_from wCurRobotPointer
	ld de, $1c8
	add hl, de
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $1c9
	add hl, de
	ld e, [hl]
	call FarCall
BattleCoreLoop: ; 232f2 (8:72f2)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_23303
	call Func_20318
Func_23303: ; 23303 (8:7303)
	ld a, $64
	call BattleRandom
	ld hl, sp+$48
	ld [hl], a
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	read_hl_from_sp_plus $4f
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	read_hl_from_sp_plus $4f
	ld de, $c6
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from_sp_plus $51
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $51
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
Func_23352: ; 23352 (8:7352)
	call Func_21160
	ld c, $0
Func_23357: ; 23357 (8:7357)
	ld a, c
	cp $2
	jp nc, Func_2339b
	read_hl_from_sp_plus $4f
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $4
	jp z, Func_2337e
	push bc
	set_farcall_addrs_hli Func_673ff
	pop bc
	push bc
	ld a, c
	call FarCall
	pop bc
Func_2337e: ; 2337e (8:737e)
	read_hl_from_sp_plus $4f
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $f3
	ld [hl], a
	inc hl
	inc c
	read_hl_from_sp_plus $4f
	ld de, $c8
	add hl, de
	write_hl_to_sp_plus $4f
	jp Func_23357

Func_2339b: ; 2339b (8:739b)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $4f
	call Func_20398
	xor a
Func_233ac: ; 233ac (8:73ac)
	cp $4
	jp nc, Func_233d6
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$1
	add hl, de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3f
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_233ac

Func_233d6: ; 233d6 (8:73d6)
	read_hl_from_sp_plus $4f
	ld de, $75
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	read_hl_from_sp_plus $4f
	ld de, $6f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	jp z, Func_23400
	ld hl, sp+$0
	ld [hl], $18
Func_23400: ; 23400 (8:7400)
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, Func_23489
	cp $9
	jp z, Func_23412
	cp $a
	jp nz, Func_234c2
Func_23412: ; 23412 (8:7412)
	ld hl, sp+$45
	ld [hl], $0
	ld c, BANK(Text_2414b)
	ld hl, sp+$45
	ld a, [hl]
	inc a
	ld hl, sp+$45
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, Text_2414b
	call FarCopyUntilNull
	ld de, Text_24069
	ld c, BANK(Text_24069)
	call FarCopyUntilNull
	ld de, Text_24150
	ld c, BANK(Text_24150)
	call FarCopyUntilNull
	ld de, Text_2416e
	ld c, BANK(Text_2416e)
	call FarCopyUntilNull
	ld hl, sp+$45
	ld e, [hl]
	ld hl, sp+$3d
	call Func_203a3
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp z, Func_23472
	ld hl, sp+$0
	ld a, [hl]
	cp $18
	jp z, Func_2346f
	read_hl_from_sp_plus $4f
	ld de, $5e
	add hl, de
	ld [hl], $ff
Func_2346f: ; 2346f (8:746f)
	jp Func_23486

Func_23472: ; 23472 (8:7472)
	read_hl_from_sp_plus $4f
	ld de, $5f
	add hl, de
	ld [hl], $0
	ld a, [hl]
	read_hl_from_sp_plus $4f
	ld de, $5e
	add hl, de
	ld [hl], a
Func_23486: ; 23486 (8:7486)
	jp Func_23654

Func_23489: ; 23489 (8:7489)
	ld hl, sp+$45
	ld [hl], $0
	read_hl_from_sp_plus $4b
	ld de, $d
	add hl, de
	push hl
	ld hl, sp+$47
	ld a, [hl]
	inc a
	ld hl, sp+$47
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$3f
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	call CopyUntilNull
	ld de, Text_201b7
	call CopyUntilNull
	ld hl, sp+$45
	ld e, [hl]
	ld hl, sp+$3d
	call Func_203a3
	jp Func_23654

Func_234c2: ; 234c2 (8:74c2)
	ld de, Data_237b5
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_20a54)
	ld de, Data_20a54
	ld hl, Data_20a63
	call FarCall
	write_hl_to_sp_plus $48
	read_hl_from_sp_plus $48
	ld a, l
	and h
	inc a
	jp nz, .parse_battle_menu
	read_hl_from_sp_plus $4f
	ld de, $5e
	add hl, de
	ld [hl], $ff
	jp Func_23654

.parse_battle_menu: ; 23508 (8:7508)
	ld de, $1311
	ld hl, $d
	call Func_2036d
	ld bc, -1
	read_hl_from_sp_plus $48
	ld a, l
	cp $5
	jp z, Func_235eb
	cp $4
	jp z, Func_235e5
	cp $3
	jp z, Func_235b3
	cp $1
	jp z, Battle_AttackMenu
	cp $2
	jp z, Func_23572
	or a
	jp nz, Func_235ee
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, Func_2354e
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, Func_23557
	ld hl, sp+$48
	ld a, [hl]
	cp $3c
	jp nc, Func_23557
Func_2354e: ; 2354e (8:754e)
	push bc
	xor a
	call Func_218e2
	pop bc
	jp Func_2356f

Func_23557: ; 23557 (8:7557)
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_20a82)
	ld de, Data_20a82
	ld hl, Data_20a91
	call FarCall
	ld c, l
	ld b, h
Func_2356f: ; 2356f (8:756f)
	jp Func_235ee

Func_23572: ; 23572 (8:7572)
	call Func_23159
	ld c, l
	ld b, h
	jp Func_235ee

Battle_AttackMenu: ; 2357a (8:757a)
	ld hl, sp+$0
	ld a, [hl]
	cp $7
	jp z, Func_23592
	ld hl, sp+$0
	ld a, [hl]
	cp $8
	jp nz, Func_2359c
	ld hl, sp+$48
	ld a, [hl]
	cp $3c
	jp nc, Func_2359c
Func_23592: ; 23592 (8:7592)
	push bc
	ld a, $2
	call Func_218e2
	pop bc
	jp Func_235b0

Func_2359c: ; 2359c (8:759c)
	set_farcall_addrs_hli DisplayPartyMenu
	ld de, $0
	xor a
	call FarCall
	ld c, l
	ld b, h
Func_235b0: ; 235b0 (8:75b0)
	jp Func_235ee

Func_235b3: ; 235b3 (8:75b3)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_235df
	push bc
	call Func_20398
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_2326e)
	ld de, Pointers_2326e
	ld hl, $10e
	call FarCall
	pop bc
	jp Func_235e2

Func_235df: ; 235df (8:75df)
	ld bc, $0
Func_235e2: ; 235e2 (8:75e2)
	jp Func_235ee

Func_235e5: ; 235e5 (8:75e5)
	ld bc, $0
	jp Func_235ee

Func_235eb: ; 235eb (8:75eb)
	ld bc, $0
Func_235ee: ; 235ee (8:75ee)
	push bc
	call Func_21160
	pop bc
	ld a, c
	and b
	inc a
	jp nz, Func_235fc
	jp Func_23352

Func_235fc: ; 235fc (8:75fc)
	read_hl_from_sp_plus $48
	ld a, l
	read_hl_from_sp_plus $4f
	ld de, $5e
	add hl, de
	ld [hl], a
	cp $5
	jp z, Func_23654
	cp $4
	jp z, Func_23651
	cp $3
	jp z, Func_2364e
	cp $1
	jp z, Func_2363f
	cp $2
	jp z, Func_23633
	or a
	jp nz, Func_23654
	read_hl_from_sp_plus $4f
	ld de, $5f
	add hl, de
	ld [hl], c
	jp Func_23654

Func_23633: ; 23633 (8:7633)
	read_hl_from_sp_plus $4f
	ld de, $5f
	add hl, de
	ld [hl], c
	jp Func_23654

Func_2363f: ; 2363f (8:763f)
	read_hl_from_sp_plus $4f
	ld de, $5f
	add hl, de
	ld a, [wc2e9]
	ld [hl], a
	jp Func_23654

Func_2364e: ; 2364e (8:764e)
	jp Func_23654

Func_23651: ; 23651 (8:7651)
	jp Func_23654

Func_23654: ; 23654 (8:7654)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2366e
	call Func_20fd5
	call Func_216e2
	call Func_21593
	jp Func_23677

Func_2366e: ; 2366e (8:766e)
	call Func_21593
	call Func_2035e
	call Func_21441
Func_23677: ; 23677 (8:7677)
	read_hl_from_sp_plus $51
	ld de, $7
	add hl, de
	ld [hl], $0
	callba_hli Func_27750
	or a
	jp nz, Func_23696
	jp BattleCoreLoop

Func_23696: ; 23696 (8:7696)
	set_farcall_addrs_hli Func_dbf5
	ld c, $3
	read_hl_from_sp_plus $4f
	ld de, $c6
	add hl, de
	ld e, [hl]
	xor a
	call FarCall
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_236d9
	set_farcall_addrs_hli Func_dbf5
	ld c, $6
	read_hl_from_sp_plus $4d
	ld de, $c6
	add hl, de
	ld e, [hl]
	ld a, $1
	call FarCall
Func_236d9: ; 236d9 (8:76d9)
	ld hl, sp+$0
	ld [hl], $0
	read_hl_from_sp_plus $51
	ld de, $7
	add hl, de
	ld a, [hl]
	and $c
	jp z, Func_236ee
	jp Func_23746

Func_236ee: ; 236ee (8:76ee)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_23717
	call Func_21b0d
	or a
	jp z, Func_2370a
	ld hl, sp+$0
	ld [hl], $1
	jp Func_23746

Func_2370a: ; 2370a (8:770a)
	call Func_22cd0
	or a
	jp nz, Func_23714
	jp BattleCoreLoop

Func_23714: ; 23714 (8:7714)
	jp Func_23746

Func_23717: ; 23717 (8:7717)
	call Func_2193a
	cp $2
	jp z, Func_23742
	cp $1
	jp z, Func_2372b
	or a
	jp nz, Func_23746
	jp BattleCoreLoop

Func_2372b: ; 2372b (8:772b)
	ld a, SONG_VICTORY
	call OverworldPlaySong
.loop
	call CheckSongFinished
	or a
	jp z, .done
	call CheckButton
	and $30
	jp z, .loop
.done
	jp Func_23746

Func_23742: ; 23742 (8:7742)
	ld hl, sp+$0
	ld [hl], $1
Func_23746: ; 23746 (8:7746)
	xor a
Func_23747: ; 23747 (8:7747)
	cp $4
	jp nc, Func_237af
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	push af
	read_hl_from_sp_plus $4d
	ld de, $c
	add hl, de
	reg16swap de, hl
	call FarCall
	read_hl_from_sp_plus $4d
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_23784
	read_hl_from_sp_plus $4d
.asm_2377b
	ld de, $22
	add hl, de
	ld [hl], $e
	jp Func_2378e

Func_23784: ; 23784 (8:7784)
	read_hl_from_sp_plus $4d
	ld de, $22
	add hl, de
	ld [hl], $0
Func_2378e: ; 2378e (8:778e)
	set_farcall_addrs_hli StackGetRobotInParty
	pop af
	push af
	read_hl_from_sp_plus $4d
	ld de, $c
	add hl, de
	reg16swap de, hl
	call FarCall
	pop af
	inc a
	jp Func_23747

Func_237af: ; 237af (8:77af)
	ld hl, sp+$0
	ld a, [hl]
	add sp, $52
	ret

Data_237b5: ; 237b5
	db "(とﾞうする?)", $0

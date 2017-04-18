Data_5e4c8:
	dr $5e4c8, $5e4e7

Data_5e4e7:
	dr $5e4e7, $5e4f6

Data_5e4f6:
	dr $5e4f6, $5e504

DisplayPartyMenu: ; 5e504 (17:6504)
	push af
	push de
	add sp, -$4a
	push de
	push bc
	ld hl, sp+$3a
	reg16swap de, hl
	ld hl, Data_5e4f6
	ld bc, $e
	call MemCopy
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli AllocateMemory
	ld hl, $2f
	call FarCall
	call WriteHLToSPPlus10
	set_farcall_addrs_hli AllocateMemory
	ld hl, $23
	call FarCall
	call WriteHLToSPPlus8
	set_farcall_addrs_hli AllocateMemory
	ld hl, $c8
	call FarCall
	call WriteHLToSPPlus6
	ld hl, sp+$4d
	ld [hl], $0
Func_5e55c: ; 5e55c (17:655c)
	ld hl, sp+$4d
	ld a, [hl]
	cp $4
	jp nc, Func_5e58a
	ld hl, sp+$4d
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, $c9b8
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5e580
	jp Func_5e58a

Func_5e580: ; 5e580 (17:6580)
	ld hl, sp+$4d
	ld a, [hl]
	inc a
	ld hl, sp+$4d
	ld [hl], a
	jp Func_5e55c

Func_5e58a: ; 5e58a (17:658a)
	ld hl, sp+$4d
	ld a, [hl]
	call Func_5d35f
	pop bc
	ld hl, sp+$4f
	ld a, [hl]
	cp $7
	jp z, Func_5e616
	cp $6
	jp z, Func_5e600
	cp $5
	jp z, Func_5e600
	cp $8
	jp z, Func_5e5bb
	cp $3
	jp z, Func_5e5bb
	cp $2
	jp z, Func_5e5bb
	cp $1
	jp z, Func_5e5bb
	or a
	jp nz, Func_5e61e
Func_5e5bb: ; 5e5bb (17:65bb)
	call Func_1fbe
	ld a, [wSystemType]
	cp $1
	jp z, Func_5e5ce
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_5e5e2
Func_5e5ce: ; 5e5ce (17:65ce)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_5e5e2: ; 5e5e2 (17:65e2)
	read_hl_from wc2e6
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	read_hl_from wc2e6
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	jp Func_5e61e

Func_5e600: ; 5e600 (17:6600)
	push bc
	read_hl_from_sp_plus $50
	ld a, l
	sub $7
	or h
	jp z, Func_5e612
	call Func_1fbe
	call Func_1f30
Func_5e612: ; 5e612 (17:6612)
	pop bc
	jp Func_5e61e

Func_5e616: ; 5e616 (17:6616)
	push bc
	call Func_1fbe
	call Func_1f30
	pop bc
Func_5e61e: ; 5e61e (17:661e)
	pop de
	ld hl, sp+$4d
	ld a, [hl]
	cp $8
	jp z, Func_5eadb
	cp $6
	jp z, Func_5ea5b
	cp $7
	jp z, Func_5e9f4
	cp $5
	jp z, Func_5e9f4
	cp $3
	jp z, Func_5e831
	cp $1
	jp z, Func_5e822
	or a
	jp nz, Func_5eb43
Func_5e644: ; 5e644 (17:6644)
	push bc
	ld c, $0
Func_5e647: ; 5e647 (17:6647)
	ld a, c
	ld hl, sp+$4b
	cp [hl]
	jp nc, Func_5e663
	ld e, c
	ld d, $0
	ld hl, sp+$3b
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $c396
	add hl, de
	ld [hl], a
	inc c
	jp Func_5e647

Func_5e663: ; 5e663 (17:6663)
	ld bc, $1f
	ld de, Data_5dd4f
	ld hl, sp+$a
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5dd6e
	ld hl, sp+$29
	call CopyFromDEtoHL
	ld hl, sp+$4f
	ld a, [hl]
	ld hl, sp+$3a
	ld [hl], a
	ld hl, sp+$4b
	ld a, [hl]
	ld hl, sp+$3f
	ld [hl], a
	ld hl, sp+$38
	write_hl_to_sp_plus $37
	xor a
	ld [$c395], a
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, sp+$a
	call Func_5d34b
	reg16swap de, hl
	ld hl, sp+$42
	ld a, [hl]
	or a
	jp z, Func_5e6ac
	ld hl, sp+$42
	ld [hl], $0
	ld de, $0
Func_5e6ac: ; 5e6ac (17:66ac)
	pop bc
	ld a, e
	and d
	inc a
	jp z, Func_5e81f
	push bc
	push de
	ld bc, $1f
	ld de, Data_5e4c8
	ld hl, sp+$c
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5e4e7
	ld hl, sp+$2b
	call CopyFromDEtoHL
	ld hl, sp+$4d
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $33
	write_hl_to_sp_plus $35
	pop de
	push de
	ld a, e
	inc a
	ld hl, sp+$3c
	ld [hl], a
	ld hl, sp+$3a
	write_hl_to_sp_plus $39
	xor a
	ld [$c395], a
	pop de
	pop bc
Func_5e6eb: ; 5e6eb (17:66eb)
	push de
	push bc
	ld hl, sp+$2b
	reg16swap de, hl
	ld hl, sp+$c
	call Func_5d34b
	pop bc
	pop de
	ld a, l
	and h
	inc a
	jp nz, Func_5e720
	push bc
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	ld hl, sp+$4f
	ld [hl], $0
	pop bc
	jp Func_5e644

Func_5e720: ; 5e720 (17:6720)
	ld a, e
	cp $1
	jp z, Func_5e72d
	or a
	jp nz, Func_5e81f
	jp Func_5e81f

Func_5e72d: ; 5e72d (17:672d)
	push de
	push bc
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld l, c
	ld h, b
	ld bc, $c8
	call MemCopy
	call GetHLAtSPPlus10
	push hl
	read_hl_from_sp_plus $e
	pop de
	ld bc, $2f
	call MemCopy
	ld a, [Data_5dd4f + 3]
	ld e, a
	ld a, [Data_5dd4f + 2]
	ld d, a
	ld a, [Data_5dd4f + 1]
	ld l, a
	ld a, [Data_5dd4f]
	ld h, a
	call Func_2801
	pop bc
	push hl
	push bc
	ld a, [wc2e8 + 1]
	ld [$c310], a
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $82
	add hl, bc
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld l, c
	ld h, b
	ld e, $0
	ld bc, $c8
	call FillMemory
	set_farcall_addrs_hli Func_dbf5
	ld c, $0
	ld a, [wc2e8 + 1]
	ld e, a
	xor a
	call FarCall
	pop af
	pop bc
	push bc
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $82
	add hl, bc
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $e
	ld de, $22
	add hl, de
	ld [hl], a
	callba_hli Func_5575d
	xor a
	ld [wc2fa], a
	set_farcall_addrs_hli Func_1445e
	ld c, BANK(Data_54384)
	ld de, Data_54384
	ld hl, Data_54365
	call FarCall
	ld a, $1
	ld [wc2fa], a
	pop bc
	pop hl
	push bc
	write_hl_to_sp_plus $44
	call GetHLAtSPPlus6
	ld e, c
	ld d, b
	ld bc, $c8
	call MemCopy
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	pop de
	ld bc, $2f
	call MemCopy
	pop bc
	pop de
	jp Func_5e6eb

Func_5e81f: ; 5e81f (17:681f)
	jp Func_5eb43

Func_5e822: ; 5e822 (17:6822)
	ld hl, sp+$4d
	ld [hl], $0
	ld hl, sp+$43
	ld a, $1
	ld [hl], a
	ld hl, sp+$40
	ld [hl], a
	jp Func_5e644

Func_5e831: ; 5e831 (17:6831)
	ld hl, sp+$48
	ld [hl], $0
Func_5e835: ; 5e835 (17:6835)
	ld hl, sp+$48
	ld a, [hl]
	ld hl, sp+$49
	cp [hl]
	jp nc, Func_5e8bc
	set_farcall_addrs_hli Func_6b55
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, sp+$48
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlus4
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_236f
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_5e888
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	ld de, $1d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp c, Func_5e895
Func_5e888: ; 5e888 (17:6888)
	ld hl, sp+$48
	ld e, [hl]
	ld d, $0
	ld hl, sp+$39
	add hl, de
	ld [hl], $0
	jp Func_5e89f

Func_5e895: ; 5e895 (17:6895)
	ld hl, sp+$48
	ld e, [hl]
	ld d, $0
	ld hl, sp+$39
	add hl, de
	ld [hl], $1
Func_5e89f: ; 5e89f (17:689f)
	ld hl, sp+$48
	ld e, [hl]
	ld d, $0
	ld hl, sp+$39
	add hl, de
	ld a, [hl]
	ld hl, sp+$48
	ld e, [hl]
	ld d, $0
	ld hl, $c396
	add hl, de
	ld [hl], a
	ld hl, sp+$48
	ld a, [hl]
	inc a
	ld hl, sp+$48
	ld [hl], a
	jp Func_5e835

Func_5e8bc: ; 5e8bc (17:68bc)
	ld bc, $1f
	ld de, Data_5e4c8
	ld hl, sp+$8
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5e4e7
	ld hl, sp+$27
	call CopyFromDEtoHL
	ld hl, sp+$49
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $2f
	write_hl_to_sp_plus $31
	ld hl, sp+$4d
	ld a, [hl]
	ld hl, sp+$38
	ld [hl], a
	ld hl, sp+$49
	ld a, [hl]
	ld hl, sp+$3d
	ld [hl], a
	ld hl, sp+$37
	ld [hl], $4
	ld hl, sp+$36
	write_hl_to_sp_plus $35
	xor a
	ld [$c395], a
	ld hl, sp+$27
	reg16swap de, hl
	ld hl, sp+$8
	call Func_5d34b
	reg16swap de, hl
	push de
	ld a, e
	and d
	inc a
	jp z, Func_5e9f0
	set_farcall_addrs_hli Func_6e1b
	ld hl, wc2e8 + 1
	ld l, [hl]
	ld h, $0
	ld de, $900
	add hl, de
	call FarCall
	write_hl_to_sp_plus $48
	set_farcall_addrs_hli Func_6b55
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld a, [wc2e8 + 1]
	call FarCall
	call GetHLAtSPPlus6
	ld a, [hl]
	dec a
	ld l, a
	push hl
	call GetHLAtSPPlus10
	pop de
	call Func_236f
	ld hl, sp+$49
	ld [hl], $3
	ld hl, sp+$48
	ld a, [wc2e8 + 1]
	add a
	add a
	inc a
	ld [hl], a
	ld hl, sp+$4a
	ld [hl], $0
Func_5e962: ; 5e962 (17:6962)
	ld hl, sp+$4a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $4e
	call CompareHLtoBC
	jp c, Func_5e9e1
	ld hl, sp+$4a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $48
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call CompareHLtoBC
	jp nc, Func_5e993
	jp Func_5e9e1

Func_5e993: ; 5e993 (17:6993)
	ld hl, sp+$48
	ld c, [hl]
	ld b, $0
	ld hl, sp+$49
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	inc hl
	inc hl
	ld de, Data_5ec5a
	call PlaceStringDEatCoordHL
	ld hl, sp+$4a
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $48
	add hl, bc
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	ld l, $3
	push hl
	ld c, $10
	ld hl, sp+$4a
	ld e, [hl]
	ld hl, sp+$4b
	ld a, [hl]
	call Func_3bc5
	pop bc
	call NextOverworldFrame
	call NextOverworldFrame
	ld hl, sp+$4a
	ld a, [hl]
	inc a
	ld hl, sp+$4a
	ld [hl], a
	jp Func_5e962

Func_5e9e1: ; 5e9e1 (17:69e1)
	xor a
Func_5e9e2: ; 5e9e2 (17:69e2)
	cp $1e
	jp nc, Func_5e9f0
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_5e9e2

Func_5e9f0: ; 5e9f0 (17:69f0)
	pop de
	jp Func_5eb43

Func_5e9f4: ; 5e9f4 (17:69f4)
	push de
	ld c, $0
Func_5e9f7: ; 5e9f7 (17:69f7)
	ld a, c
	ld hl, sp+$4b
	cp [hl]
	jp nc, Func_5ea13
	ld e, c
	ld d, $0
	ld hl, sp+$3b
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $c396
	add hl, de
	ld [hl], a
	inc c
	jp Func_5e9f7

Func_5ea13: ; 5ea13 (17:6a13)
	ld hl, sp+$4f
	ld a, [hl]
	ld hl, sp+$3a
	ld [hl], a
	ld hl, sp+$4b
	ld a, [hl]
	ld hl, sp+$3f
	ld [hl], a
	ld bc, $1f
	ld de, Data_5e4c8
	ld hl, sp+$a
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5e4e7
	ld hl, sp+$29
	call CopyFromDEtoHL
	ld hl, sp+$4b
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $31
	write_hl_to_sp_plus $33
	ld hl, sp+$38
	write_hl_to_sp_plus $37
	xor a
	ld [$c395], a
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, sp+$a
	call Func_5d34b
	pop de
	jp Func_5eb43

Func_5ea5b: ; 5ea5b (17:6a5b)
	ld c, $0
Func_5ea5d: ; 5ea5d (17:6a5d)
	ld a, c
	ld hl, sp+$49
	cp [hl]
	jp nc, Func_5ea79
	ld e, c
	ld d, $0
	ld hl, sp+$39
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $c396
	add hl, de
	ld [hl], a
	inc c
	jp Func_5ea5d

Func_5ea79: ; 5ea79 (17:6a79)
	ld hl, sp+$4d
	ld a, [hl]
	ld hl, sp+$38
	ld [hl], a
	ld hl, sp+$49
	ld a, [hl]
	ld hl, sp+$3d
	ld [hl], a
	read_hl_from_sp_plus $4c
	ld e, l
	ld hl, sp+$42
	ld [hl], e
	read_hl_from_sp_plus $4c
	ld a, l
	sub $2
	or h
	jp nz, Func_5ea9c
	ld hl, sp+$40
	ld [hl], $1
Func_5ea9c: ; 5ea9c (17:6a9c)
	ld bc, $1f
	ld de, Data_5e4c8
	ld hl, sp+$8
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5e4e7
	ld hl, sp+$27
	call CopyFromDEtoHL
	ld hl, sp+$49
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $2f
	write_hl_to_sp_plus $31
	ld hl, sp+$36
	write_hl_to_sp_plus $35
	xor a
	ld [$c395], a
	ld hl, sp+$27
	reg16swap de, hl
	ld hl, sp+$8
	call Func_5d34b
	reg16swap de, hl
	jp Func_5eb43

Func_5eadb: ; 5eadb (17:6adb)
	push de
	ld c, $0
Func_5eade: ; 5eade (17:6ade)
	ld a, c
	ld hl, sp+$4b
	cp [hl]
	jp nc, Func_5eafa
	ld e, c
	ld d, $0
	ld hl, sp+$3b
	add hl, de
	ld [hl], $0
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, $c396
	add hl, de
	ld [hl], a
	inc c
	jp Func_5eade

Func_5eafa: ; 5eafa (17:6afa)
	ld hl, sp+$4f
	ld a, [hl]
	ld hl, sp+$3a
	ld [hl], a
	ld hl, sp+$4b
	ld a, [hl]
	ld hl, sp+$3f
	ld [hl], a
	ld hl, sp+$42
	ld [hl], $1
	ld bc, $1f
	ld de, Data_5e4c8
	ld hl, sp+$a
	call CopyFromDEtoHL
	ld bc, $f
	ld de, Data_5e4e7
	ld hl, sp+$29
	call CopyFromDEtoHL
	ld hl, sp+$4b
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $31
	write_hl_to_sp_plus $33
	ld hl, sp+$38
	write_hl_to_sp_plus $37
	xor a
	ld [$c395], a
	ld hl, sp+$29
	reg16swap de, hl
	ld hl, sp+$a
	call Func_5d34b
	pop de
Func_5eb43: ; 5eb43 (17:6b43)
	push de
	ld hl, sp+$4f
	ld a, [hl]
	cp $6
	jp nz, Func_5eb57
	read_hl_from_sp_plus $4e
	ld a, l
	sub $7
	or h
	jp z, Func_5eb5a
Func_5eb57: ; 5eb57 (17:6b57)
	call FillVisibleAreaWithBlankTile
Func_5eb5a: ; 5eb5a (17:6b5a)
	ld hl, sp+$4f
	ld a, [hl]
	cp $7
	jp z, Func_5ec15
	cp $6
	jp z, Func_5ec01
	cp $5
	jp z, Func_5ec01
	cp $8
	jp z, Func_5eb84
	cp $3
	jp z, Func_5eb84
	cp $2
	jp z, Func_5eb84
	cp $1
	jp z, Func_5eb84
	or a
	jp nz, Func_5ec1b
Func_5eb84: ; 5eb84 (17:6b84)
	call Func_2009
	ld a, [wSystemType]
	cp $1
	jp z, Func_5eb97
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_5ebab
Func_5eb97: ; 5eb97 (17:6b97)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
Func_5ebab: ; 5ebab (17:6bab)
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus10
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call FarCall
	call GetHLAtSPPlus10
	ld de, $2f
	add hl, de
	call WriteHLToSPPlus10
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus10
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call FarCall
	ld a, [wc2fa]
	cp $2
	jp z, Func_5ebfe
	callba_hli Func_d767
Func_5ebfe: ; 5ebfe (17:6bfe)
	jp Func_5ec1b

Func_5ec01: ; 5ec01 (17:6c01)
	read_hl_from_sp_plus $4e
	ld a, l
	sub $7
	or h
	jp z, Func_5ec12
	call Func_1f7b
	call Func_2009
Func_5ec12: ; 5ec12 (17:6c12)
	jp Func_5ec1b

Func_5ec15: ; 5ec15 (17:6c15)
	call Func_1f7b
	call Func_2009
Func_5ec1b: ; 5ec1b (17:6c1b)
	set_farcall_addrs_hli FreeMemory
	call GetHLAtSPPlus4
	call FarCall
	set_farcall_addrs_hli FreeMemory
	call GetHLAtSPPlus6
	call FarCall
	set_farcall_addrs_hli FreeMemory
	call GetHLAtSPPlus8
	call FarCall
	pop hl
	reg16swap de, hl
	add sp, $4e
	reg16swap de, hl
	ret

Data_5ec5a:
	db "エネ:$"

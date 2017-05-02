Pointers_4eead: ; 4eead
	dw Data_4eeb1
	dw $0

Data_4eeb1: ; 4eeb1
	db "(それはつかえない)", $0

ItemEffect_NoUse: ; 4eebc (13:6ebc)
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Pointers_4eead
	ld bc, $4
	call MemCopy
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3afc
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $13
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	pop bc
	pop bc
	ret

ItemEffect_PartyRestore: ; 4ef0b
	push af
	call ItemEffects_AskSelectPartyMember
	set_farcall_addrs_hli Func_fb42d
	pop af
	push af
	inc a
	call FarCall
	pop af
	ld [wc311], a
	call ItemEffects_SelectPartyMember
	ret

Pointers_4ef28: ; 4ef28
	dw Data_4ef2c
	dw $0

Data_4ef2c: ; 4ef2c
	db "(を つかった)", $0

ItemEffect_WaterUse: ; 4ef35
	push af
	add sp, -$1e
	ld l, $0
	ld a, [wMapGroup]
	cp $16
	jp nz, Func_4f01a
	ld a, [wMapNumber]
	or a
	jp nz, Func_4f01a
	ld a, [wMapX]
	cp $4
	jp nz, Func_4f01a
	ld a, [wMapY]
	cp $b
	jp nz, Func_4f01a
	ld l, $1
	set_farcall_addrs_hli GetName
	ld c, $a
	ld hl, sp+$0
	push hl
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	call FarCall
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4ef28)
	ld de, Pointers_4ef28
	ld hl, $110
	call FarCall
	set_farcall_addrs_hli Func_5a149
	ld c, $1
	ld e, $1
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	call FarCall
	set_farcall_addrs_hli Func_a517c
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	cp $29
	jp z, Func_4f00d
	cp $28
	jp z, Func_4f005
	cp $27
	jp z, Func_4f005
	cp $26
	jp z, Func_4f005
	cp $25
	jp z, Func_4effe
	cp $24
	jp z, Func_4effe
	cp $23
	jp nz, Func_4f012
Func_4effe: ; 4effe (13:6ffe)
	xor a
	call FarCall
	jp Func_4f012

Func_4f005: ; 4f005 (13:7005)
	ld a, $1
	call FarCall
	jp Func_4f012

Func_4f00d: ; 4f00d (13:700d)
	ld a, $2
	call FarCall
Func_4f012: ; 4f012 (13:7012)
	ld a, $1
	ld [wc317], a
	jp Func_4f03d

Func_4f01a: ; 4f01a (13:701a)
	inc l
	dec l
	jp nz, Func_4f03d
	call ItemEffects_AskSelectPartyMember
	ld hl, sp+$1f
	ld a, [hl]
	ld [wc311], a
	set_farcall_addrs_hli Func_fb42d
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	call FarCall
	call ItemEffects_SelectPartyMember
Func_4f03d: ; 4f03d (13:703d)
	add sp, $20
	ret

Pointers_4f040: ; 4f040
	dw Data_4f044
	dw $0

Data_4f044: ; 4f044
	db "(を つかった)", $0

ItemEffect_Ticket: ; 4f04d
	push af
	add sp, -$1e
	ld l, $0
	ld a, [wMapGroup]
	cp $1d
	jp nz, Func_4f076
	ld a, [wMapNumber]
	cp $1
	jp nz, Func_4f076
	ld a, [wMapX]
	add $5
	cp $a
	jp c, Func_4f076
	ld a, [wMapY]
	cp $3
	jp nz, Func_4f076
	ld l, $1
Func_4f076: ; 4f076 (13:7076)
	ld a, l
	cp $1
	jp nz, Func_4f123
	set_farcall_addrs_hli GetName
	ld c, $a
	ld hl, sp+$0
	push hl
	ld hl, sp+$21
	ld l, [hl]
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	call FarCall
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4f040)
	ld de, Pointers_4f040
	ld hl, $110
	call FarCall
	ld hl, sp+$1f
	ld a, [hl]
	cp $13
	jp z, Func_4f10b
	set_farcall_addrs_hli Func_5a149
	ld c, $1
	ld e, $1
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	call FarCall
	set_farcall_addrs_hli Func_d18ba
	ld hl, sp+$1f
	ld a, [hl]
	add $fa
	call FarCall
	jp Func_4f11b

Func_4f10b: ; 4f10b (13:710b)
	set_farcall_addrs_hli Func_d18ba
	ld a, $4
	call FarCall
Func_4f11b: ; 4f11b (13:711b)
	ld a, $1
	ld [wc317], a
	jp Func_4f129

Func_4f123: ; 4f123 (13:7123)
	ld hl, sp+$1f
	ld a, [hl]
	call ItemEffect_NoUse
Func_4f129: ; 4f129 (13:7129)
	add sp, $20
	ret

Pointers_4f12c: ; 4f12c
	dw Data_4f130
	dw $0

Data_4f130: ; 4f130
	db "(を つかった)", $0

ItemEffect_CaveUse: ; 4f139
	push af
	add sp, -$1e
	ld e, $0
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	cp GROUND_ESCAPE
	jp z, Func_4f213
	cp MORRIS_SUNSET
	jp z, Func_4f1ee
	cp BLUE_BAKUDAN
	jp z, Func_4f198
	cp WHITE_BAKUDAN
	jp z, Func_4f160
	cp BLACK_BAKUDAN
	jp z, Func_4f160
	cp RED_BAKUDAN
	jp nz, Func_4f437
Func_4f160: ; 4f160 (13:7160)
	ld a, [wMapGroup]
	cp $1
	jp nz, Func_4f195
	ld a, [wMapNumber]
	or a
	jp nz, Func_4f195
	ld a, [wMapX]
	add $5
	cp $21
	jp c, Func_4f195
	ld a, [wMapX]
	add $5
	cp $25
	jp nc, Func_4f195
	ld a, [wMapY]
	cp $11
	jp nz, Func_4f195
	ld a, [wc78d]
	cp $2
	jp c, Func_4f195
	ld e, $1
Func_4f195: ; 4f195 (13:7195)
	jp Func_4f437

Func_4f198: ; 4f198 (13:7198)
	ld a, [wMapGroup]
	cp $13
	jp nz, Func_4f1eb
	ld a, [wMapNumber]
	cp $27
	jp nz, Func_4f1eb
	ld a, [wMapX]
	cp $fe
	jp nz, Func_4f1eb
	ld a, [wMapY]
	cp $16
	jp nz, Func_4f1c4
	ld a, [wc799]
	or a
	jp nz, Func_4f1c4
	ld e, $1
	jp Func_4f1eb

Func_4f1c4: ; 4f1c4 (13:71c4)
	ld a, [wMapY]
	cp $11
	jp nz, Func_4f1d9
	ld a, [wc799]
	cp $1
	jp nz, Func_4f1d9
	ld e, $1
	jp Func_4f1eb

Func_4f1d9: ; 4f1d9 (13:71d9)
	ld a, [wMapY]
	cp $c
	jp nz, Func_4f1eb
	ld a, [wc799]
	cp $2
	jp nz, Func_4f1eb
	ld e, $1
Func_4f1eb: ; 4f1eb (13:71eb)
	jp Func_4f437

Func_4f1ee: ; 4f1ee (13:71ee)
	ld a, [wMapGroup]
	cp $19
	jp nz, Func_4f210
	ld a, [wMapNumber]
	cp $a
	jp nz, Func_4f210
	ld a, [wMapX]
	cp $b
	jp nz, Func_4f210
	ld a, [wMapY]
	cp $4
	jp nz, Func_4f210
	ld e, $1
Func_4f210: ; 4f210 (13:7210)
	jp Func_4f437

Func_4f213: ; 4f213 (13:7213)
	ld a, [wMapGroup]
	cp $1e
	jp z, Func_4f423
	cp $1d
	jp z, Func_4f3de
	cp $1b
	jp z, Func_4f3c7
	cp $19
	jp z, Func_4f3b0
	cp $18
	jp z, Func_4f399
	cp $15
	jp z, Func_4f372
	cp $13
	jp z, Func_4f30c
	cp $12
	jp z, Func_4f2f5
	cp $9
	jp z, Func_4f2d5
	cp $8
	jp z, Func_4f2ab
	cp $5
	jp z, Func_4f27d
	cp $4
	jp z, Func_4f26e
	cp $3
	jp nz, Func_4f437
	ld a, [wMapNumber]
	cp $a
	jp c, Func_4f26b
	ld a, [wMapNumber]
	cp $10
	jp nc, Func_4f26b
	ld c, $0
	ld e, $1
Func_4f26b: ; 4f26b (13:726b)
	jp Func_4f437

Func_4f26e: ; 4f26e (13:726e)
	ld a, [wMapNumber]
	cp $1
	jp nz, Func_4f27a
	ld c, $1
	ld e, $1
Func_4f27a: ; 4f27a (13:727a)
	jp Func_4f437

Func_4f27d: ; 4f27d (13:727d)
	ld a, [wMapNumber]
	cp $14
	jp c, Func_4f294
	ld a, [wMapNumber]
	cp $16
	jp nc, Func_4f294
	ld c, $2
	ld e, $1
	jp Func_4f2a8

Func_4f294: ; 4f294 (13:7294)
	ld a, [wMapNumber]
	cp $1e
	jp c, Func_4f2a8
	ld a, [wMapNumber]
	cp $25
	jp nc, Func_4f2a8
	ld c, $3
	ld e, $1
Func_4f2a8: ; 4f2a8 (13:72a8)
	jp Func_4f437

Func_4f2ab: ; 4f2ab (13:72ab)
	ld a, [wMapNumber]
	cp $1
	jp nz, Func_4f2d2
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_4f2d2
	ld a, [wBackupMapGroup]
	cp $8
	jp z, Func_4f2ce
	cp $6
	jp nz, Func_4f2d2
	ld c, $d
	ld e, $1
	jp Func_4f2d2

Func_4f2ce: ; 4f2ce (13:72ce)
	ld c, $4
	ld e, $1
Func_4f2d2: ; 4f2d2 (13:72d2)
	jp Func_4f437

Func_4f2d5: ; 4f2d5 (13:72d5)
	ld a, [wMapNumber]
	cp $3
	jp z, Func_4f2ee
	cp $2
	jp z, Func_4f2ee
	cp $1
	jp nz, Func_4f2f2
	ld c, $6
	ld e, $1
	jp Func_4f2f2

Func_4f2ee: ; 4f2ee (13:72ee)
	ld c, $5
	ld e, $1
Func_4f2f2: ; 4f2f2 (13:72f2)
	jp Func_4f437

Func_4f2f5: ; 4f2f5 (13:72f5)
	ld a, [wMapNumber]
	cp $a
	jp c, Func_4f309
	ld a, [wMapNumber]
	cp $13
	jp nc, Func_4f309
	ld c, $11
	ld e, $1
Func_4f309: ; 4f309 (13:7309)
	jp Func_4f437

Func_4f30c: ; 4f30c (13:730c)
	ld a, [wMapNumber]
	cp $b
	jp z, Func_4f334
	ld a, [wMapNumber]
	cp $1e
	jp c, Func_4f324
	ld a, [wMapNumber]
	cp $22
	jp c, Func_4f334
Func_4f324: ; 4f324 (13:7324)
	ld a, [wMapNumber]
	cp $25
	jp c, Func_4f33b
	ld a, [wMapNumber]
	cp $28
	jp nc, Func_4f33b
Func_4f334: ; 4f334 (13:7334)
	ld c, $6
	ld e, $1
	jp Func_4f36f

Func_4f33b: ; 4f33b (13:733b)
	ld a, [wMapNumber]
	cp $2
	jp z, Func_4f36b
	ld a, [wMapNumber]
	cp $3
	jp z, Func_4f36b
	ld a, [wMapNumber]
	cp $a
	jp z, Func_4f36b
	ld a, [wMapNumber]
	cp $14
	jp z, Func_4f36b
	ld a, [wMapNumber]
	cp $16
	jp z, Func_4f36b
	ld a, [wMapNumber]
	cp $28
	jp nz, Func_4f36f
Func_4f36b: ; 4f36b (13:736b)
	ld c, $e
	ld e, $1
Func_4f36f: ; 4f36f (13:736f)
	jp Func_4f437

Func_4f372: ; 4f372 (13:7372)
	ld a, [wMapNumber]
	cp $a
	jp c, Func_4f382
	ld a, [wMapNumber]
	cp $f
	jp c, Func_4f392
Func_4f382: ; 4f382 (13:7382)
	ld a, [wMapNumber]
	cp $14
	jp c, Func_4f396
	ld a, [wMapNumber]
	cp $1a
	jp nc, Func_4f396
Func_4f392: ; 4f392 (13:7392)
	ld c, $7
	ld e, $1
Func_4f396: ; 4f396 (13:7396)
	jp Func_4f437

Func_4f399: ; 4f399 (13:7399)
	ld a, [wMapNumber]
	cp $a
	jp c, Func_4f3ad
	ld a, [wMapNumber]
	cp $17
	jp nc, Func_4f3ad
	ld c, $8
	ld e, $1
Func_4f3ad: ; 4f3ad (13:73ad)
	jp Func_4f437

Func_4f3b0: ; 4f3b0 (13:73b0)
	ld a, [wMapNumber]
	cp $2
	jp c, Func_4f3c4
	ld a, [wMapNumber]
	cp $6
	jp nc, Func_4f3c4
	ld c, $9
	ld e, $1
Func_4f3c4: ; 4f3c4 (13:73c4)
	jp Func_4f437

Func_4f3c7: ; 4f3c7 (13:73c7)
	ld a, [wMapNumber]
	cp $1
	jp c, Func_4f3db
	ld a, [wMapNumber]
	cp $c
	jp nc, Func_4f3db
	ld c, $a
	ld e, $1
Func_4f3db: ; 4f3db (13:73db)
	jp Func_4f437

Func_4f3de: ; 4f3de (13:73de)
	ld a, [wMapNumber]
	cp $a
	jp c, Func_4f3f5
	ld a, [wMapNumber]
	cp $f
	jp nc, Func_4f3f5
	ld c, $b
	ld e, $1
	jp Func_4f420

Func_4f3f5: ; 4f3f5 (13:73f5)
	ld a, [wMapNumber]
	cp $14
	jp c, Func_4f40c
	ld a, [wMapNumber]
	cp $19
	jp nc, Func_4f40c
	ld c, $f
	ld e, $1
	jp Func_4f420

Func_4f40c: ; 4f40c (13:740c)
	ld a, [wMapNumber]
	cp $1e
	jp c, Func_4f420
	ld a, [wMapNumber]
	cp $23
	jp nc, Func_4f420
	ld c, $10
	ld e, $1
Func_4f420: ; 4f420 (13:7420)
	jp Func_4f437

Func_4f423: ; 4f423 (13:7423)
	ld a, [wMapNumber]
	cp $4
	jp c, Func_4f437
	ld a, [wMapNumber]
	cp $e
	jp nc, Func_4f437
	ld c, $c
	ld e, $1
Func_4f437: ; 4f437 (13:7437)
	ld a, e
	cp $1
	jp nz, Func_4f583
	push bc
	set_farcall_addrs_hli GetName
	ld c, $a
	ld hl, sp+$2
	push hl
	ld hl, sp+$23
	ld l, [hl]
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	call FarCall
	call Func_4c0ac
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	set_farcall_addrs_hli Func_16019
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $e
	ld hl, $1
	call FarCall
	call Func_4c0b9
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4f12c)
	ld de, Pointers_4f12c
	ld hl, $110
	call FarCall
	set_farcall_addrs_hli Func_5a149
	ld c, $1
	ld e, $1
	ld hl, sp+$21
	ld a, [hl]
	inc a
	call FarCall
	pop bc
	ld hl, sp+$1f
	ld a, [hl]
	cp $14
	jp nz, Func_4f4ce
	callba_hli Func_abb74
	ld a, $1
	ld [wc317], a
	jp Func_4f58e

Func_4f4ce: ; 4f4ce (13:74ce)
	ld hl, sp+$1f
	ld a, [hl]
	cp $48
	jp nz, Func_4f4ef
	push bc
	set_farcall_addrs_hli Func_8208c
	pop bc
	ld a, c
	call FarCall
	ld a, $1
	ld [wc317], a
	jp Func_4f58e

Func_4f4ef: ; 4f4ef (13:74ef)
	ld hl, sp+$1f
	ld a, [hl]
	cp $2d
	jp nz, Func_4f50d
	callba_hli Func_a3c17
	ld a, $1
	ld [wc317], a
	jp Func_4f58e

Func_4f50d: ; 4f50d (13:750d)
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	cp $2d
	jp z, Func_4f569
	cp $2c
	jp z, Func_4f532
	cp $2b
	jp nz, Func_4f569
	ld a, [wc78d]
	cp $2
	jp c, Func_4f52f
	ld a, [wc78d]
	dec a
	ld [wc78d], a
Func_4f52f: ; 4f52f (13:752f)
	jp Func_4f569

Func_4f532: ; 4f532 (13:7532)
	ld a, [wc78d]
	cp $2
	jp nz, Func_4f544
	ld a, [wc78d]
	dec a
	ld [wc78d], a
	jp Func_4f566

Func_4f544: ; 4f544 (13:7544)
	ld a, [wc78d]
	cp $3
	jp c, Func_4f557
	ld a, [wc78d]
	add $fe
	ld [wc78d], a
	jp Func_4f566

Func_4f557: ; 4f557 (13:7557)
	ld a, [wc78d]
	cp $2
	jp c, Func_4f566
	ld a, [wc78d]
	dec a
	ld [wc78d], a
Func_4f566: ; 4f566 (13:7566)
	jp Func_4f569

Func_4f569: ; 4f569 (13:7569)
	set_farcall_addrs_hli Func_8d4d8
	ld hl, sp+$1f
	ld a, [hl]
	inc a
	call FarCall
	ld a, $1
	ld [wc317], a
	jp Func_4f58e

Func_4f583: ; 4f583 (13:7583)
	inc e
	dec e
	jp nz, Func_4f58e
	ld hl, sp+$1f
	ld a, [hl]
	call ItemEffect_NoUse
Func_4f58e: ; 4f58e (13:758e)
	add sp, $20
	ret

ItemEffect_DownloadRAM: ; 4f591
	push af
	call ItemEffects_AskSelectPartyMember
	ld hl, sp+$1
	ld a, [hl]
	ld [wc311], a
	xor a
	ld [wc316], a
	ld hl, $0
	write_hl_to wc312
	ld hl, $0
	write_hl_to wc314
	ld hl, sp+$1
	ld a, [hl]
	inc a
	cp $47
	jp z, Func_4f5dc
	cp $46
	jp nz, Func_4f5f8
	set_farcall_addrs_hli RandomRange
	ld a, $6
	call FarCall
	ld l, a
	ld h, $0
	ld de, $5
	add hl, de
	write_hl_to wc312
	jp Func_4f5f8

Func_4f5dc: ; 4f5dc (13:75dc)
	set_farcall_addrs_hli RandomRange
	ld a, $6
	call FarCall
	ld l, a
	ld h, $0
	ld de, $5
	add hl, de
	write_hl_to wc314
Func_4f5f8: ; 4f5f8 (13:75f8)
	call ItemEffects_SelectPartyMember
	cp $ff
	jp z, Func_4f655
	ld hl, sp+$1
	ld a, [hl]
	inc a
	cp $45
	jp z, Func_4f613
	cp $44
	jp z, Func_4f613
	cp $43
	jp nz, Func_4f655
Func_4f613: ; 4f613 (13:7613)
	set_farcall_addrs_hli RandomRange
	ld a, $5
	call FarCall
	ld l, a
	ld h, $0
	ld de, $5
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_6b94
	pop bc
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, wOAMBuffer
	add hl, de
	ld a, [wc2e9]
	ld e, a
	ld d, $0
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	call FarCall
Func_4f655: ; 4f655 (13:7655)
	pop bc
	ret

ItemEffect_Evolve: ; 4f657
	push af
	call ItemEffects_AskSelectPartyMember
	ld hl, sp+$1
	ld a, [hl]
	inc a
	cp $4b
	jp z, .go
	cp $4a
	jp nz, .quit
.go
	ld hl, sp+$1
	ld a, [hl]
	ld [wc311], a
	xor a
	ld [wc316], a
	ld hl, $0
	write_hl_to wc312
	ld hl, $0
	write_hl_to wc314
	call ItemEffects_SelectPartyMember
.quit
	pop bc
	ret

Pointers_4f688: ; 4f688
	dw Data_4f68c
	dw $0

Data_4f68c: ; 4f68c
	db "(とﾞの)ロホﾞホﾟン(に つかいますか)?", $0

ItemEffects_AskSelectPartyMember: ; 4f6a3 (13:76a3)
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3afc
	pop bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_4c0d3
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call Func_3ca1
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_4f688)
	ld de, Pointers_4f688
	ld hl, $10e
	call FarCall
	ret

ItemEffects_SelectPartyMember: ; 4f6dc (13:76dc)
	set_farcall_addrs_hli DisplayPartyMenu_
	ld a, $4
	call FarCall
	ld a, l
	cp $ff
	jp z, .did_not_select_party_member
	set_farcall_addrs_hli Func_5a149
	ld c, $1
	ld e, $1
	ld a, [wc311]
	inc a
	call FarCall
	call Func_3af6
	xor a
	ret

.did_not_select_party_member: ; 4f70d (13:770d)
	call Func_3af6
	ld a, $ff
	ret

ItemEffectPointers: ; 4f713
	dba ItemEffect_NoUse ; 01
	dba ItemEffect_NoUse ; 02
	dba ItemEffect_NoUse ; 03
	dba ItemEffect_NoUse ; 04
	dba ItemEffect_NoUse ; 05
	dba ItemEffect_NoUse ; 06
	dba ItemEffect_NoUse ; 07
	dba ItemEffect_Ticket       ; 08
	dba ItemEffect_Ticket       ; 09
	dba ItemEffect_Ticket       ; 0a
	dba ItemEffect_NoUse ; 0b
	dba ItemEffect_PartyRestore       ; 0c
	dba ItemEffect_NoUse ; 0d
	dba ItemEffect_NoUse ; 0e
	dba ItemEffect_NoUse ; 0f
	dba ItemEffect_NoUse ; 10
	dba ItemEffect_NoUse ; 11
	dba ItemEffect_NoUse ; 12
	dba ItemEffect_NoUse ; 13
	dba ItemEffect_Ticket       ; 14
	dba ItemEffect_CaveUse       ; 15
	dba ItemEffect_NoUse ; 16
	dba ItemEffect_NoUse ; 17
	dba ItemEffect_NoUse ; 18
	dba ItemEffect_NoUse ; 19
	dba ItemEffect_NoUse ; 1a
	dba ItemEffect_NoUse ; 1b
	dba ItemEffect_NoUse ; 1c
	dba ItemEffect_NoUse ; 1d
	dba ItemEffect_NoUse ; 1e
	dba ItemEffect_NoUse ; 1f
	dba ItemEffect_NoUse ; 20
	dba ItemEffect_NoUse ; 21
	dba ItemEffect_NoUse ; 22
	dba ItemEffect_WaterUse       ; 23
	dba ItemEffect_WaterUse       ; 24
	dba ItemEffect_WaterUse       ; 25
	dba ItemEffect_WaterUse       ; 26
	dba ItemEffect_WaterUse       ; 27
	dba ItemEffect_WaterUse       ; 28
	dba ItemEffect_WaterUse       ; 29
	dba ItemEffect_CaveUse       ; 2a
	dba ItemEffect_CaveUse       ; 2b
	dba ItemEffect_CaveUse       ; 2c
	dba ItemEffect_CaveUse       ; 2d
	dba ItemEffect_CaveUse       ; 2e
	dba ItemEffect_PartyRestore       ; 2f
	dba ItemEffect_PartyRestore       ; 30
	dba ItemEffect_PartyRestore       ; 31
	dba ItemEffect_PartyRestore       ; 32
	dba ItemEffect_PartyRestore       ; 33
	dba ItemEffect_PartyRestore       ; 34
	dba ItemEffect_PartyRestore       ; 35
	dba ItemEffect_PartyRestore       ; 36
	dba ItemEffect_PartyRestore       ; 37
	dba ItemEffect_PartyRestore       ; 38
	dba ItemEffect_PartyRestore       ; 39
	dba ItemEffect_NoUse ; 3a
	dba ItemEffect_NoUse ; 3b
	dba ItemEffect_NoUse ; 3c
	dba ItemEffect_NoUse ; 3d
	dba ItemEffect_NoUse ; 3e
	dba ItemEffect_NoUse ; 3f
	dba ItemEffect_NoUse ; 40
	dba ItemEffect_PartyRestore       ; 41
	dba ItemEffect_PartyRestore       ; 42
	dba ItemEffect_DownloadRAM       ; 43
	dba ItemEffect_DownloadRAM       ; 44
	dba ItemEffect_DownloadRAM       ; 45
	dba ItemEffect_DownloadRAM       ; 46
	dba ItemEffect_DownloadRAM       ; 47
	dba ItemEffect_NoUse ; 48
	dba ItemEffect_CaveUse       ; 49
	dba ItemEffect_Evolve ; 4a
	dba ItemEffect_Evolve ; 4b
	dba ItemEffect_NoUse ; 4c
	dba ItemEffect_NoUse ; 4d
	dba ItemEffect_NoUse ; 4e
	dba ItemEffect_NoUse ; 4f

DoItemEffect: ; 4f800 (13:7800)
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld l, a
	pop af
	push hl
	ld e, a
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld c, [hl]
	pop hl
	push bc
	ld a, l
	call GetSRAMBank
	pop bc
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ItemEffectPointers - 3
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, ItemEffectPointers - 3
	add hl, de
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	ld a, c
	dec a
	call FarCall
	ret

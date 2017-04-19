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
	write_hl_to_sp_plus $0b
	read_hl_from_sp_plus $3c
	ld l, h
	ld h, $0
	write_hl_to_sp_plus $0f
	read_hl_from_sp_plus $3c
	ld h, $0
	write_hl_to_sp_plus $0d
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
	jp nz, Func_1408f
	ld hl, -1
	write_hl_to_sp_plus $13
Func_1408f: ; 1408f (5:408f)
	read_hl_from_sp_plus $0b
	ld a, l
	inc a
	or h
	jp nz, Func_140a0
	ld hl, -1
	write_hl_to_sp_plus $0b
Func_140a0: ; 140a0 (5:40a0)
	read_hl_from_sp_plus $0d
	ld a, l
	inc a
	or h
	jp nz, Func_140b1
	ld hl, -1
	write_hl_to_sp_plus $0d
Func_140b1: ; 140b1 (5:40b1)
	read_hl_from wc2e6
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
	call Func_16007
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
	jp z, Func_14180
	cp $22
	jp z, Func_14180
	cp $1c
	jp z, Func_14180
	cp $14
	jp z, Func_14180
	cp $13
	jp nz, Func_14366
Func_14180: ; 14180 (5:4180)
	ld hl, $0
	write_hl_to_sp_plus $0f
	ld hl, $0
Func_1418a: ; 1418a (5:418a)
	ld de, $4
	call CompareHLtoDE
	jp nc, Func_141b6
	push hl
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
	jp z, Func_141b1
	read_hl_from_sp_plus $11
	inc hl
	write_hl_to_sp_plus $11
Func_141b1: ; 141b1 (5:41b1)
	pop hl
	inc hl
	jp Func_1418a

Func_141b6: ; 141b6 (5:41b6)
	jp Func_14366

Func_141b9: ; 141b9 (5:41b9)
	ld de, $19
	ld a, $2
	call Func_16007
	callba_hli Func_7cd1
	ld l, a
	ld h, $0
	write_hl_to_sp_plus $0f
	jp Func_14366

Func_141d9: ; 141d9 (5:41d9)
	ld hl, $ca6c
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $0f
	jp Func_14366

Func_141e6: ; 141e6 (5:41e6)
	ld hl, $0
	write_hl_to_sp_plus $0f
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
	ld de, $cb94
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_14213
	read_hl_from_sp_plus $0f
	inc hl
	write_hl_to_sp_plus $0f
	jp Func_14216

Func_14213: ; 14213 (5:4213)
	jp Func_1421a

Func_14216: ; 14216 (5:4216)
	inc bc
	jp Func_141f0

Func_1421a: ; 1421a (5:421a)
	jp Func_14366

Func_1421d: ; 1421d (5:421d)
	ld hl, $c9a2
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $0f
	jp Func_14366

Func_1422a: ; 1422a (5:422a)
	ld hl, $c9b7
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $0f
	jp Func_14366

Func_14237: ; 14237 (5:4237)
	ld hl, $0
	write_hl_to_sp_plus $0f
	ld hl, $0
	call WriteHLToSPPlus6
Func_14244: ; 14244 (5:4244)
	call GetHLAtSPPlus6
	ld de, $3
	call CompareHLtoDE
	jp nc, Func_14287
	ld hl, wc2e9
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
	ld de, $8
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_1427d
	read_hl_from_sp_plus $0f
	inc hl
	write_hl_to_sp_plus $0f
Func_1427d: ; 1427d (5:427d)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_14244

Func_14287: ; 14287 (5:4287)
	jp Func_14366

Func_1428a: ; 1428a (5:428a)
	ld hl, $0
	write_hl_to_sp_plus $0f
	ld bc, $0
Func_14294: ; 14294 (5:4294)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_142bb
	ld hl, $cd10
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142b4
	read_hl_from_sp_plus $0f
	inc hl
	write_hl_to_sp_plus $0f
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
	write_hl_to_sp_plus $0f
	ld bc, $0
Func_142c8: ; 142c8 (5:42c8)
	ld l, c
	ld h, b
	ld de, $dc
	call CompareHLtoDE
	jp nc, Func_142ef
	ld hl, $cc34
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_142e8
	read_hl_from_sp_plus $0f
	inc hl
	write_hl_to_sp_plus $0f
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
	write_hl_to_sp_plus $0f
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
	read_hl_from_sp_plus $0f
	inc hl
	write_hl_to_sp_plus $0f
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
	write_hl_to_sp_plus $0f
	jp Func_14359

Func_14352: ; 14352 (5:4352)
	ld hl, $7
	write_hl_to_sp_plus $0f
Func_14359: ; 14359 (5:4359)
	jp Func_14366

Func_1435c: ; 1435c (5:435c)
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $0f
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
	jp nz, Func_143f6
Func_143ee: ; 143ee (5:43ee)
	ld hl, sp+$6
	call HandleMenu
	jp Func_143ee

Func_143f6: ; 143f6 (5:43f6)
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

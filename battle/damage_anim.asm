Func_615ce: ; 615ce (18:55ce)
	push hl
	push bc
	push bc
	push de
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wOAMBuffer
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	call WriteHLToSPPlus8
	pop de
	ld hl, $10
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp z, Func_6160e
	ld hl, $30
	add hl, de
	reg16swap de, hl
	ld bc, -$10
	jp Func_61611

Func_6160e: ; 6160e (18:560e)
	ld bc, $10
Func_61611: ; 61611 (18:5611)
	xor a
Func_61612: ; 61612 (18:5612)
	cp $4
	jp nc, Func_616c2
	push af
	push bc
	push de
	ld c, e
	ld b, d
	inc b
	dec b
	bit 7, b
	jr nz, .bc_not_in_range_0x98
	ld e, c
	ld d, b
	ld hl, $98
	call CompareHLtoDE
	jp nc, .bc_lessthan_0x98
.bc_not_in_range_0x98
	ld bc, $0
.bc_lessthan_0x98: ; 61630 (18:5630)
	ld hl, sp+$7
	ld [hl], $0
Func_61634: ; 61634 (18:5634)
	ld hl, sp+$7
	ld a, [hl]
	cp $8
	jp nc, Func_616b2
	push bc
	ld hl, sp+$8
	ld a, [hl]
	and $20
	jp z, Func_61662
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, $7
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld c, l
	ld b, h
	jp Func_61675

Func_61662: ; 61662 (18:5662)
	read_hl_from_sp_plus $e
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
Func_61675: ; 61675 (18:5675)
	inc b
	dec b
	bit 7, b
	jr nz, .asm_61686
	ld e, c
	ld d, b
	ld hl, $a8
	call CompareHLtoDE
	jp nc, Func_61689
.asm_61686
	ld bc, $0
Func_61689: ; 61689 (18:5689)
	read_hl_from_sp_plus $c
	inc hl
	ld [hl], c
	pop bc
	call GetHLAtSPPlus10
	ld [hl], c
	ld hl, sp+$6
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus10
	jp Func_61634

Func_616b2: ; 616b2 (18:56b2)
	pop de
	pop bc
	reg16swap de, hl
	add hl, bc
	reg16swap de, hl
	pop af
	inc a
	jp Func_61612

Func_616c2: ; 616c2 (18:56c2)
	pop bc
	pop bc
	pop bc
	ret

Data_616c6: ; 616c6
	battleanim_03 0
	battleanim_doublepushscreen
	battleanim_clearsprites
	battleanim_04 0
	battleanim_doublepushscreen
	battleanim_end

Data_616ce: ; 616ce
	db 2, 0, 1, 5, 5, 1, 0

Data_616d5: ; 616d5
	db $06, $0a
	db $56, $5a
	db $08, $58

Data_616db: ; 616db
	db $08, $58

DamageOrHeal:: ; 616dd
; bool a: which side
; s16 de: how much
	push af
	push de
	add sp, -$26
	ld e, $2
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	ld hl, sp+$27
	ld [hl], a
	ld hl, sp+$26
	ld [hl], $0

	ld hl, sp+$9
	reg16swap de, hl
	ld hl, Data_616c6
	ld bc, $8
	call MemCopy

	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_616ce
	ld bc, $7
	call MemCopy

	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
.waitLoop
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .waitLoop

	ld hl, sp+$2b
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], a

	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$9
	call FarCall

	ld hl, sp+$2b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_616d5
	add hl, de
	ld e, [hl]
	ld hl, sp+$19
	ld [hl], e

	ld hl, sp+$2b
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_616d5
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$1a
	ld [hl], e

	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_6178d

	ld hl, $2
	write_hl_to_sp_plus $26
	ld hl, $703
	write_hl_to_sp_plus $24
	ld hl, sp+$27
	ld [hl], $1
	xor a
	jp Func_6179d

Func_6178d: ; 6178d (18:578d)
	ld hl, $b02
	write_hl_to_sp_plus $26
	ld hl, $1203
	write_hl_to_sp_plus $24
	ld a, $b
Func_6179d: ; 6179d (18:579d)
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2d
	ld a, [hl]
	or a
	jp nz, Func_617b7
	ld hl, $0
	jp Func_617ba

Func_617b7: ; 617b7 (18:57b7)
	ld hl, $2f
Func_617ba: ; 617ba (18:57ba)
	add hl, de
	ld c, l
	ld b, h
	push bc
	ld hl, $1a
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $26
	ld hl, $18
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $24
	read_hl_from_sp_plus $2e
	push hl
	read_hl_from_sp_plus $26
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	write_hl_to_sp_plus $22
	read_hl_from_sp_plus $22
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_61802
	ld hl, $0
	write_hl_to_sp_plus $22
Func_61802: ; 61802 (18:5802)
	ld hl, sp+$19
	ld c, l
	ld b, h
	read_hl_from_sp_plus $26
	push hl
	read_hl_from_sp_plus $26
	pop de
	call Func_2617
	ld hl, sp+$19
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$19
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1b
	ld a, [hl]
	and $80
	jp z, Func_6182e
	ld hl, sp+$1a
	ld a, [hl]
	inc a
	ld hl, sp+$1a
	ld [hl], a
Func_6182e: ; 6182e (18:582e)
	ld hl, sp+$1a
	ld a, [hl]
	push af
	ld hl, sp+$17
	ld c, l
	ld b, h
	read_hl_from_sp_plus $28
	push hl
	read_hl_from_sp_plus $26
	pop de
	call Func_2617
	ld hl, sp+$17
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$17
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$19
	ld a, [hl]
	and $80
	jp z, Func_6185e
	ld hl, sp+$18
	ld a, [hl]
	inc a
	ld hl, sp+$18
	ld [hl], a
Func_6185e: ; 6185e (18:585e)
	ld hl, sp+$18
	ld a, [hl]
	ld hl, sp+$21
	ld [hl], a
	read_hl_from_sp_plus $26
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$1b
	ld [hl], a
	read_hl_from_sp_plus $26
	ld e, l
	ld hl, sp+$1c
	ld [hl], e
	ld hl, sp+$1e
	xor a
	ld [hl], a
	ld hl, sp+$1d
	ld [hl], a
	pop af
	push af
	ld hl, sp+$17
	ld c, l
	ld b, h
	ld hl, sp+$21
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	push hl
	read_hl_from_sp_plus $26
	push hl
	read_hl_from_sp_plus $2a
	pop de
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	pop de
	call Func_2617
	ld a, SFX_5D
	call OverworldPlaySFX
	pop af
	ld e, a

	; Damage Loop
Func_618b1: ; 618b1 (18:58b1)
	ld hl, sp+$1f
	ld a, [hl]
	cp e
	jp nc, Func_6197c
	push de
	ld hl, sp+$31
	ld a, [hl]
	ld l, e
	ld h, a
	push hl
	read_hl_from_sp_plus $2e
	pop de
	call DrawHPBar
	ld hl, sp+$1a
	reg16swap de, hl
	ld hl, sp+$1e
	call Func_63ce1
	ld hl, sp+$2d
	ld a, [hl]
	or a
	jp z, Func_618eb
	ld hl, sp+$1c
	ld e, [hl]
	ld hl, sp+$1b
	ld h, [hl]
	ld d, h
	push de
	read_hl_from_sp_plus $2e
	inc h
	inc hl
	pop de
	call Func_63d05
Func_618eb: ; 618eb (18:58eb)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	read_hl_from_sp_plus $2c
	ld c, l
	ld b, h
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call Func_63e6f
	pop de
	ld hl, sp+$2a
	ld a, [hl]
	cp $7
	jp c, Func_6192c
	push de
	ld hl, sp+$31
	ld e, [hl]
	ld d, $0
	ld hl, Data_616db
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	pop de
	jp Func_61940

Func_6192c: ; 6192c (18:592c)
	push de
	ld a, e
	and $1
	ld e, a
	ld d, $0
	ld hl, sp+$1f
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	pop de
Func_61940: ; 61940 (18:5940)
	push de
	call WaitVideoTransfer
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_61956
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_6195e

Func_61956: ; 61956 (18:5956)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_6195e: ; 6195e (18:595e)
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
Func_61966: ; 61966 (18:5966)
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, Func_61966
	pop de
	dec e
	ld hl, sp+$2a
	ld a, [hl]
	inc a
	ld hl, sp+$2a
	ld [hl], a
	jp Func_618b1

Func_6197c: ; 6197c (18:597c)
	ld hl, sp+$2a
	ld a, [hl]
	cp $7
	jp nc, Func_619a5
	ld hl, sp+$2a
	ld a, [hl]
	and $1
	ld e, a
	ld d, $0
	ld hl, sp+$1d
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $28
	call Func_615ce
	call NextBattleFrame
	ld hl, sp+$2a
	ld a, [hl]
	inc a
	ld hl, sp+$2a
	ld [hl], a
	jp Func_6197c

Func_619a5: ; 619a5 (18:59a5)
	ld hl, sp+$1f
	ld a, [hl]
	or a
	jp nz, Func_619c1
	read_hl_from_sp_plus $22
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_619c1
	ld hl, sp+$1f
	ld [hl], $1
Func_619c1: ; 619c1 (18:59c1) (ApplyDamage?)
	ld hl, sp+$1f
	ld e, [hl]
	ld hl, sp+$2f
	ld h, [hl]
	ld d, h
	push de
	read_hl_from_sp_plus $2c
	pop de
	call DrawHPBar
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp z, Func_619e7
	read_hl_from_sp_plus $22
	push hl
	read_hl_from_sp_plus $2c
	inc h
	inc hl
	pop de
	call Func_63d05
Func_619e7: ; 619e7 (18:59e7)
	call WaitVideoTransfer
	pop bc
	read_hl_from_sp_plus $20
	reg16swap de, hl
	ld hl, $18
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	pop de
	ld l, $2
	push hl
	ld c, $8
	call DoublePushBGMapRegion
	pop bc
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
.waitLoop
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .waitLoop
	read_hl_from_sp_plus $1c
	reg16swap de, hl
	add sp, $2a
	reg16swap de, hl
	ret

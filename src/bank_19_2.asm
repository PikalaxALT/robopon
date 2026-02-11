INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 19 2", ROMX
INCLUDE "charmap.asm"
Func_67187: ; 67187 (19:7187)
	push af
	push bc
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp z, Func_67195
	inc e
	dec e
	jp nz, Func_67199
Func_67195: ; 67195 (19:7195)
	xor a
	jp Func_67202

Func_67199: ; 67199 (19:7199)
	ld bc, Moves
	ld hl, sp+$0
	ld [hl], $0
Func_671a0: ; 671a0 (19:71a0)
	ld hl, sp+$0
	ld a, [hl]
	cp $97
	jp nc, Func_671f2
	ld hl, $b
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_671b4
	jp Func_671e2

Func_671b4: ; 671b4 (19:71b4)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, $9
	add hl, bc
	cp [hl]
	jp nz, Func_671cb
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp e
	jp nz, Func_671cb
	jp Func_671f2

Func_671cb: ; 671cb (19:71cb)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	cp e
	jp nz, Func_671e2
	ld hl, sp+$3
	ld a, [hl]
	ld hl, $a
	add hl, bc
	cp [hl]
	jp nz, Func_671e2
	jp Func_671f2

Func_671e2: ; 671e2 (19:71e2)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	ld hl, $13
	add hl, bc
	ld c, l
	ld b, h
	jp Func_671a0

Func_671f2: ; 671f2 (19:71f2)
	ld hl, sp+$0
	ld a, [hl]
	cp $97
	jp c, Func_671fe
	xor a
	jp Func_67202

Func_671fe: ; 671fe (19:71fe)
	ld hl, sp+$0
	ld a, [hl]
	inc a
Func_67202: ; 67202 (19:7202)
	pop bc
	pop bc
	ret

Func_67205:
	push hl
	push de
	push bc
	call GetHLAtSPPlus4
	ld [hl], $0
	call GetHLAtSPPlus6
	ld a, [hl]
	or a
	jp z, Func_67350
	call GetHLAtSPPlus6
	inc hl
	ld a, [hl]
	or a
	jp z, Func_67350
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_67350
	ld bc, Moves
	ld hl, sp+$0
	ld [hl], $0
Func_6722f: ; 6722f (19:722f)
	ld hl, sp+$0
	ld a, [hl]
	cp $97
	jp nc, Func_6731c
	ld hl, $9
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	cp [hl]
	jp nz, Func_6727f
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	cp [hl]
	jp nz, Func_67261
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_67261
	jp Func_6731c

Func_67261: ; 67261 (19:7261)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_6727f
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	cp [hl]
	jp nz, Func_6727f
	jp Func_6731c

Func_6727f: ; 6727f (19:727f)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	cp [hl]
	jp nz, Func_672c6
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	cp [hl]
	jp nz, Func_672a9
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_672a9
	jp Func_6731c

Func_672a9: ; 672a9 (19:72a9)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_672c6
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	cp [hl]
	jp nz, Func_672c6
	jp Func_6731c

Func_672c6: ; 672c6 (19:72c6)
	ld hl, $9
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_6730c
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	cp [hl]
	jp nz, Func_672f0
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	cp [hl]
	jp nz, Func_672f0
	jp Func_6731c

Func_672f0: ; 672f0 (19:72f0)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	cp [hl]
	jp nz, Func_6730c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	cp [hl]
	jp nz, Func_6730c
	jp Func_6731c

Func_6730c: ; 6730c (19:730c)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	ld hl, $13
	add hl, bc
	ld c, l
	ld b, h
	jp Func_6722f

Func_6731c: ; 6731c (19:731c)
	ld hl, sp+$0
	ld a, [hl]
	cp $97
	jp nc, Func_67350
	ld hl, sp+$0
	ld a, [hl]
	inc a
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $1
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $2
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
Func_67350: ; 67350 (19:7350)
	call GetHLAtSPPlus6
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	ld e, [hl]
	call Func_67187
	or a
	jp z, Func_67388
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $1
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $ff
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
Func_67388: ; 67388 (19:7388)
	call GetHLAtSPPlus6
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld e, [hl]
	call Func_67187
	or a
	jp z, Func_673c1
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $2
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $ff
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
Func_673c1: ; 673c1 (19:73c1)
	call GetHLAtSPPlus6
	inc hl
	ld a, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld e, [hl]
	call Func_67187
	or a
	jp z, Func_673fb
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $1
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $2
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $ff
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld [hl], $0
Func_673fb: ; 673fb (19:73fb)
	pop bc
	pop bc
	pop bc
	ret

Func_673ff:: ; 673ff (19:73ff)
	add sp, -$40
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	or a
	jp nz, Func_67417
	ld hl, $0
	jp Func_6741a

Func_67417: ; 67417 (19:7417)
	ld hl, $2f
Func_6741a: ; 6741a (19:741a)
	add hl, de
	reg16swap de, hl
	push de
	ld l, a
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $2b
	read_hl_from_sp_plus $2b
	write_hl_to_sp_plus $29
	read_hl_from_sp_plus $2b
	ld de, $20
	add hl, de
	ld c, l
	ld b, h
	push bc
	read_hl_from_sp_plus $2d
	ld de, $23
	add hl, de
	write_hl_to_sp_plus $23
	read_hl_from_sp_plus $2d
	ld de, $26
	add hl, de
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $2d
	ld de, $36
	add hl, de
	write_hl_to_sp_plus $1b
	read_hl_from_sp_plus $2d
	ld de, $3e
	add hl, de
	write_hl_to_sp_plus $19
	read_hl_from_sp_plus $2d
	ld de, $4e
	add hl, de
	write_hl_to_sp_plus $17
	ld bc, $20
	read_hl_from_sp_plus $2b
	ld e, $0
	call FillMemory
	ld bc, $3
	read_hl_from_sp_plus $23
	ld e, $0
	call FillMemory
	read_hl_from_sp_plus $2d
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $fe
	ld [hl], a
	inc hl
	pop bc
	pop de
	ld hl, $14
	add hl, de
	write_hl_to_sp_plus $3e
	ld hl, sp+$3b
	ld [hl], $0
Func_674c2: ; 674c2 (19:74c2)
	ld hl, sp+$3b
	ld a, [hl]
	cp $3
	jp nc, Func_67533
	push bc
	read_hl_from_sp_plus $40
	ld a, [hl]
	and $3f
	read_hl_from_sp_plus $21
	ld [hl], a
	read_hl_from_sp_plus $40
	ld a, [hl]
	rlca
	rlca
	and $3
	inc a
	ld [bc], a
	read_hl_from_sp_plus $2b
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp nz, Func_6750f
	read_hl_from_sp_plus $2b
	ld de, $71
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$3d
	ld b, [hl]
	ld hl, $1
	call LeftShiftHL
	ld a, e
	and l
	ld l, a
	ld a, d
	and h
	ld h, a
	ld a, l
	or h
	jp z, Func_67515
Func_6750f: ; 6750f (19:750f)
	read_hl_from_sp_plus $21
	ld [hl], $0
Func_67515: ; 67515 (19:7515)
	ld hl, sp+$3d
	ld a, [hl]
	inc a
	ld hl, sp+$3d
	ld [hl], a
	read_hl_from_sp_plus $21
	inc hl
	write_hl_to_sp_plus $21
	pop bc
	inc bc
	read_hl_from_sp_plus $3e
	inc hl
	write_hl_to_sp_plus $3e
	jp Func_674c2

Func_67533: ; 67533 (19:7533)
	read_hl_from_sp_plus $29
	ld de, $71
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$3f
	ld [hl], e
	ld hl, sp+$3f
	ld a, [hl]
	dec a
	ld hl, sp+$3f
	ld [hl], a
	read_hl_from_sp_plus $27
	ld [hl], $0
	read_hl_from_sp_plus $15
	ld [hl], $0
	inc hl
	ld [hl], $0
	inc hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $27
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $27
	read_hl_from_sp_plus $1d
	ld [hl], $0
	inc hl
	ld [hl], $0
	inc hl
	write_hl_to_sp_plus $1d
	read_hl_from_sp_plus $17
	ld [hl], $0
	inc hl
	write_hl_to_sp_plus $17
	read_hl_from_sp_plus $13
	ld [hl], $46
	inc hl
	ld [hl], $0
	inc hl
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $29
	ld de, $23
	add hl, de
	write_hl_to_sp_plus $1f
	read_hl_from_sp_plus $29
	ld de, $20
	add hl, de
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $27
	write_hl_to_sp_plus $23
	read_hl_from_sp_plus $1d
	ld c, l
	ld b, h
	ld hl, sp+$3b
	ld [hl], $0
Func_675c8: ; 675c8 (19:75c8)
	ld hl, sp+$3b
	ld a, [hl]
	cp $3
	jp nc, Func_67758
	read_hl_from_sp_plus $1f
	ld a, [hl]
	or a
	jp z, Func_6773c
	push bc
	read_hl_from_sp_plus $21
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2b
	call GetMove
	pop bc
	ld hl, sp+$3f
	ld a, [hl]
	ld hl, sp+$2e
	cp [hl]
	jp nz, Func_675f3
	jp Func_6773c

Func_675f3: ; 675f3 (19:75f3)
	push bc
	read_hl_from_sp_plus $29
	ld [hl], $fe
	ld hl, sp+$3d
	ld a, [hl]
	read_hl_from_sp_plus $29
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $23
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $39
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $1f
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	write_hl_to_sp_plus $1f
	ld l, c
	ld h, b
	write_hl_to_sp_plus $1b
	read_hl_from_sp_plus $23
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $35
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $17
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	write_hl_to_sp_plus $17
	ld hl, sp+$30
	ld a, [hl]
	read_hl_from_sp_plus $19
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $19
	read_hl_from_sp_plus $35
	ld c, l
	ld b, h
	read_hl_from_sp_plus $15
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $39
	ld a, l
	and $80
	jp z, Func_67688
	ld a, l
	and $7f
	ld l, a
	ld h, $0
	ld a, l
	sub $16
	or h
	jp nz, Func_67688
	read_hl_from_sp_plus $2b
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $1
	ld [hl], a
	inc hl
Func_67688: ; 67688 (19:7688)
	read_hl_from_sp_plus $25
	write_hl_to_sp_plus $27
	pop bc
	push bc
	ld l, c
	ld h, b
	write_hl_to_sp_plus $1d
Func_67698: ; 67698 (19:7698)
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $29
	pop de
	call CompareHLtoDE
	jp z, Func_676ef
	read_hl_from_sp_plus $27
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $2b
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	read_hl_from_sp_plus $21
	cp [hl]
	jp nz, Func_676d6
	read_hl_from_sp_plus $1d
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $1b
	call CompareHLtoBC
	jp nz, Func_676d6
	jp Func_676ef

Func_676d6: ; 676d6 (19:76d6)
	read_hl_from_sp_plus $27
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $27
	read_hl_from_sp_plus $1d
	inc hl
	inc hl
	write_hl_to_sp_plus $1d
	jp Func_67698

Func_676ef: ; 676ef (19:76ef)
	pop bc
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $27
	pop de
	call CompareHLtoDE
	jp z, Func_67730
	read_hl_from_sp_plus $17
	dec hl
	write_hl_to_sp_plus $17
	read_hl_from_sp_plus $1d
	dec hl
	dec hl
	write_hl_to_sp_plus $1d
	read_hl_from_sp_plus $15
	dec hl
	dec hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $13
	dec hl
	dec hl
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $27
	ld [hl], $0
	jp Func_6773c

Func_67730: ; 67730 (19:7730)
	read_hl_from_sp_plus $27
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $27
Func_6773c: ; 6773c (19:773c)
	ld hl, sp+$3b
	ld a, [hl]
	inc a
	ld hl, sp+$3b
	ld [hl], a
	read_hl_from_sp_plus $1f
	inc hl
	write_hl_to_sp_plus $1f
	read_hl_from_sp_plus $21
	inc hl
	write_hl_to_sp_plus $21
	jp Func_675c8

Func_67758: ; 67758 (19:7758)
	ld hl, sp+$0
	push hl
	read_hl_from_sp_plus $2b
	ld de, $23
	add hl, de
	pop de
	call Func_67205
	read_hl_from_sp_plus $27
	write_hl_to_sp_plus $23
	read_hl_from_sp_plus $1d
	ld c, l
	ld b, h
	ld hl, sp+$0
	write_hl_to_sp_plus $3e
	ld hl, sp+$3a
	ld [hl], $0
Func_6777f: ; 6777f (19:777f)
	ld hl, sp+$3a
	ld a, [hl]
	cp $4
	jp nc, Func_679e2
	read_hl_from_sp_plus $3e
	ld a, [hl]
	or a
	jp z, Func_679e2
	push bc
	read_hl_from_sp_plus $40
	ld l, [hl]
	ld h, $0
	mulhlby19
	ld de, Moves - $13
	add hl, de
	ld de, $12
	add hl, de
	ld e, [hl]
	ld hl, sp+$40
	ld [hl], e
	pop bc
	ld hl, sp+$3f
	ld a, [hl]
	ld hl, sp+$3e
	cp [hl]
	jp nz, Func_677c7
	read_hl_from_sp_plus $3e
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $3e
	jp Func_679d8

Func_677c7: ; 677c7 (19:77c7)
	push bc
	read_hl_from_sp_plus $40
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $29
	ld [hl], a
	read_hl_from_sp_plus $40
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $29
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $40
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $40
	ld a, [hl]
	inc hl
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	ld [hl], a
	read_hl_from_sp_plus $1f
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $15
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $17
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$3d
	ld [hl], $0
Func_6782c: ; 6782c (19:782c)
	ld hl, sp+$3d
	ld a, [hl]
	cp $3
	jp nc, Func_678e7
	ld hl, sp+$3d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $29
	inc hl
	add hl, bc
	ld a, [hl]
	cp $ff
	jp z, Func_678dd
	ld hl, sp+$3d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $29
	inc hl
	add hl, bc
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $2b
	ld de, $20
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $23
	ld hl, sp+$3d
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $29
	inc hl
	add hl, bc
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $2b
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2b
	call GetMove
	read_hl_from_sp_plus $23
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $39
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $1f
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	read_hl_from_sp_plus $23
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $35
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $17
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	read_hl_from_sp_plus $35
	push hl
	read_hl_from_sp_plus $17
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_678dd
	read_hl_from_sp_plus $35
	push hl
	read_hl_from_sp_plus $17
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
Func_678dd: ; 678dd (19:78dd)
	ld hl, sp+$3d
	ld a, [hl]
	inc a
	ld hl, sp+$3d
	ld [hl], a
	jp Func_6782c

Func_678e7: ; 678e7 (19:78e7)
	read_hl_from_sp_plus $29
	ld l, [hl]
	ld h, $0
	mulhlby19
	ld de, Moves - $13
	add hl, de
	ld de, $12
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $19
	ld [hl], a
	inc hl
	write_hl_to_sp_plus $19
	read_hl_from_sp_plus $1f
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	write_hl_to_sp_plus $1f
	ld l, c
	ld h, b
	write_hl_to_sp_plus $1b
	read_hl_from_sp_plus $17
	inc hl
	inc hl
	write_hl_to_sp_plus $17
	read_hl_from_sp_plus $15
	inc hl
	inc hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $25
	write_hl_to_sp_plus $27
	pop bc
	push bc
	ld l, c
	ld h, b
	write_hl_to_sp_plus $1d
Func_67941: ; 67941 (19:7941)
	read_hl_from_sp_plus $29
	push hl
	read_hl_from_sp_plus $29
	pop de
	call CompareHLtoDE
	jp z, Func_6798b
	read_hl_from_sp_plus $27
	ld a, [hl]
	read_hl_from_sp_plus $29
	cp [hl]
	jp nz, Func_67972
	read_hl_from_sp_plus $1d
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $1b
	call CompareHLtoBC
	jp nz, Func_67972
	jp Func_6798b

Func_67972: ; 67972 (19:7972)
	read_hl_from_sp_plus $27
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $27
	read_hl_from_sp_plus $1d
	inc hl
	inc hl
	write_hl_to_sp_plus $1d
	jp Func_67941

Func_6798b: ; 6798b (19:798b)
	pop bc
	read_hl_from_sp_plus $27
	push hl
	read_hl_from_sp_plus $27
	pop de
	call CompareHLtoDE
	jp z, Func_679cc
	read_hl_from_sp_plus $17
	dec hl
	write_hl_to_sp_plus $17
	read_hl_from_sp_plus $1d
	dec hl
	dec hl
	write_hl_to_sp_plus $1d
	read_hl_from_sp_plus $13
	dec hl
	dec hl
	write_hl_to_sp_plus $13
	read_hl_from_sp_plus $15
	dec hl
	dec hl
	write_hl_to_sp_plus $15
	read_hl_from_sp_plus $27
	ld [hl], $0
	jp Func_679d8

Func_679cc: ; 679cc (19:79cc)
	read_hl_from_sp_plus $27
	inc hl
	inc hl
	inc hl
	inc hl
	write_hl_to_sp_plus $27
Func_679d8: ; 679d8 (19:79d8)
	ld hl, sp+$3a
	ld a, [hl]
	inc a
	ld hl, sp+$3a
	ld [hl], a
	jp Func_6777f

Func_679e2: ; 679e2 (19:79e2)
	add sp, $40
	ret

Func_679e5:: ; 679e5 (19:79e5)
	push hl
	add sp, -$40
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Text_66f37
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	call LiteralStringInTree
	ld hl, sp+$0
	push hl
	read_hl_from_sp_plus $44
	pop de
	call PlaceStringDEatCoordHL
	add sp, $42
	ret


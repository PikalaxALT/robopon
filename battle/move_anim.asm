BattleAnim_DoublePushScreen: ; e3bd
; Arguments: void
	push hl
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	pop hl
	ret

Func_e3d1: ; e3d1
; Arguments: char, char, char
	push hl
	push bc
	call GetHLAtSPPlus4
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus4
	push af
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld hl, sp+$2
	ld [hl], a
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e408
	ld a, $c
	ld hl, sp+$3
	sub [hl]
	ld hl, sp+$3
	ld [hl], a
Func_e408: ; e408 (3:6408)
	set_farcall_addrs_hli Func_7c8a
	pop af
	push af
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	reg16swap de, hl
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	ld c, $2
	call FarCall
	pop af
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, a
	ld d, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	pop bc
	pop bc
	ret

Func_e4b4: ; e4b4
	push af
	check_cgb
	jp nz, Func_e4ce
	ld hl, sp+$1
	ld a, [hl]
	or a
	jp nz, Func_e4c9
	ld a, $2
	jp Func_e4cf

Func_e4c9: ; e4c9 (3:64c9)
	ld a, $3
	jp Func_e4cf

Func_e4ce: ; e4ce (3:64ce)
	xor a
Func_e4cf: ; e4cf (3:64cf)
	pop bc
	ret

Func_e4d1: ; e4d1 (3:64d1)
; Arguments: char
	push hl
	push bc
	push bc
	push bc
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld hl, sp+$5
	ld [hl], a
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld [hl], a
	ld hl, sp+$5
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	xor [hl]
	call Func_e4b4
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld [hl], a
	ld hl, $8000
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	ld l, $0
Func_e538: ; e538 (3:6538)
	ld a, l
	cp $8
	jp nc, Func_e5b7
	xor a
Func_e53f: ; e53f (3:653f)
	cp $8
	jp nc, Func_e5b0
	push hl
	push af
	push bc
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	ld bc, $10
	call RequestVideoData
	call GetHLAtSPPlus10
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	pop bc
	pop af
	pop hl
	push hl
	push bc
	push af
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8
	add hl, de
	add hl, bc
	ld e, a
	ld d, $0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus10
	ld e, c
	ld d, b
	ld bc, $10
	call RequestVideoData
	call GetHLAtSPPlus10
	ld de, $10
	add hl, de
	call WriteHLToSPPlus10
	pop af
	inc a
	pop bc
	pop hl
	jp Func_e53f

Func_e5b0: ; e5b0 (3:65b0)
	ld a, l
	add $2
	ld l, a
	jp Func_e538

Func_e5b7: ; e5b7 (3:65b7)
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	pop de
	push hl
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	ld c, l
	ld b, h
	pop hl
	push hl
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e5e1
	pop hl
	push hl
	dec h
	pop de
	push hl
Func_e5e1: ; e5e1 (3:65e1)
	ld l, c
	ld h, b
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e5ed
	dec b
Func_e5ed: ; e5ed (3:65ed)
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e608
	pop hl
	push hl
	ld de, $c
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	push hl
Func_e608: ; e608 (3:6608)
	pop hl
	push hl
	add hl, hl
	add hl, hl
	add hl, hl
	pop de
	push hl
	ld l, c
	ld h, b
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	push bc
	call GetHLAtSPPlus4
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld a, e
	xor l
	ld l, a
	ld a, d
	xor h
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	pop de
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld a, e
	xor l
	ld l, a
	ld a, d
	xor h
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	pop de
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, wOAMBuffer
	reg16swap de, hl
	ld hl, sp+$6
	ld [hl], $0
Func_e675: ; e675 (3:6675)
	ld hl, sp+$6
	ld a, [hl]
	cp $4
	jp nc, Func_e6a4
	ld c, $0
Func_e67f: ; e67f (3:667f)
	ld a, c
	cp $8
	jp nc, Func_e69a
	ld hl, sp+$6
	ld a, [hl]
	add a
	add a
	add a
	add c
	add a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld [hl], a
	inc c
	inc de
	inc de
	inc de
	inc de
	jp Func_e67f

Func_e69a: ; e69a (3:669a)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_e675

Func_e6a4: ; e6a4 (3:66a4)
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, b
	call Func_de2c
	call WaitVideoTransfer
	call GetHLAtSPPlus8
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e6b7: ; e6b7
; Arguments: char
	push bc
	ld a, [hl]
	inc hl
	push hl
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $8
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	pop af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	ld a, l
	xor e
	ld l, a
	ld a, h
	xor d
	ld h, a
	add hl, hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	pop de
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $8
	call DivideHLByDESigned
	ld c, l
	push bc
	set_farcall_addrs_hli Func_667d
	pop bc
	push bc
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld de, $7
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld a, [hl]
	ld l, c
	ld h, a
	ld bc, $8f02
	call FarCall
	pop bc
	check_cgb
	jp nz, Func_e784
	push bc
	set_farcall_addrs_hli Func_667d
	pop bc
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $700
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld de, $7
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld a, [hl]
	ld l, c
	ld h, a
	ld bc, $3
	call FarCall
Func_e784: ; e784 (3:6784)
	pop hl
	pop bc
	ret

BattleAnim_ClearSprites: ; e787
	push hl
	call ClearSprites
	pop hl
	ret

Func_e78d: ; e78d
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e7b1
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_e7b1: ; e7b1 (3:67b1)
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e7d5
	call GetHLAtSPPlus6
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus6
Func_e7d5: ; e7d5 (3:67d5)
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop af
Func_e836: ; e836 (3:6836)
	cp $1
	jp c, Func_e862
	push bc
	push af
	call GetHLAtSPPlus6
	ld e, c
	ld d, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	jp Func_e836

Func_e862: ; e862 (3:6862)
	pop hl
	push hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_e89b: ; e89b
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_e8bf
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_e8bf: ; e8bf (3:68bf)
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop bc
	pop af
Func_e92b: ; e92b (3:692b)
	cp $1
	jp c, Func_e95b
	push bc
	push af
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	jp Func_e92b

Func_e95b: ; e95b (3:695b)
	pop hl
	push hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_e994: ; e994
	push hl
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld a, $20
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_e9a4: ; e9a4
	push hl
	set_farcall_addrs_hli Func_6938
	ld c, $67
	ld e, $28
	ld hl, $14
	call FarCall
	pop hl
	ret

Func_e9bc: ; e9bc
	push hl
	set_farcall_addrs_hli Func_68fd
	ld c, $68
	ld e, $28
	ld hl, $2710
	call FarCall
	pop hl
	ret

Func_e9d4: ; e9d4
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld l, a
	ld h, $0
	pop de
	push hl
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_ea05
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_ea05: ; ea05 (3:6a05)
	pop hl
	push hl
	ld de, $80
	call CompareHLtoDE
	jp c, Func_ea15
	pop hl
	push hl
	dec h
	pop de
	push hl
Func_ea15: ; ea15 (3:6a15)
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_ea32
	call GetHLAtSPPlus4
	ld de, $c
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	call WriteHLToSPPlus4
Func_ea32: ; ea32 (3:6a32)
	call GetHLAtSPPlus4
	add hl, hl
	add hl, hl
	add hl, hl
	call WriteHLToSPPlus4
	pop hl
	push hl
	add hl, hl
	add hl, hl
	add hl, hl
	pop de
	push hl
	call GetHLAtSPPlus4
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call Func_de2c
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_eab8: ; eab8
	push hl
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld a, $40
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_eac8: ; eac8
	push hl
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld a, $80
	xor [hl]
	ld [hl], a
	pop hl
	ret

Func_ead8: ; ead8
	push hl
	xor a
	call Func_df28
	pop hl
	ret

Func_eadf: ; eadf
	push hl
	ld a, $1
	call Func_df28
	pop hl
	ret

Func_eae7: ; eae7 (3:6ae7)
	push bc
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld c, $0
Func_eaf5: ; eaf5 (3:6af5)
	ld a, c
	cp $4
	jp nc, Func_eb15
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_eaf5

Func_eb15: ; eb15 (3:6b15)
	inc hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	reg16swap de, hl
	push de
	read_hl_from wCurRobotPointer
	ld de, $24a
	add hl, de
	call WriteHLToSPPlus7
	xor a
	pop de
Func_eb33: ; eb33 (3:6b33)
	cp $8
	jp nc, Func_ec10
	push af
	ld c, $0
Func_eb3b: ; eb3b (3:6b3b)
	ld a, c
	cp $4
	jp nc, Func_ec0b
	push bc
	push de
	reg16swap de, hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	inc hl
	inc hl
	write_hl_to_sp_plus $b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_eb3b

Func_ec0b: ; ec0b (3:6c0b)
	pop af
	inc a
	jp Func_eb33

Func_ec10: ; ec10 (3:6c10)
	pop hl
	push de
	ld c, $0
Func_ec14: ; ec14 (3:6c14)
	ld a, c
	cp $4
	jp nc, Func_ec34
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ec14

Func_ec34: ; ec34 (3:6c34)
	inc hl
	xor a
	pop de
	push hl
Func_ec38: ; ec38 (3:6c38)
	cp $8
	jp nc, Func_ed15
	push af
	ld c, $0
Func_ec40: ; ec40 (3:6c40)
	ld a, c
	cp $4
	jp nc, Func_ed10
	push bc
	push de
	reg16swap de, hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	inc hl
	inc hl
	write_hl_to_sp_plus $b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ec40

Func_ed10: ; ed10 (3:6d10)
	pop af
	inc a
	jp Func_ec38

Func_ed15: ; ed15 (3:6d15)
	ld c, $0
	pop hl
Func_ed18: ; ed18 (3:6d18)
	ld a, c
	cp $4
	jp nc, Func_ed38
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ed18

Func_ed38: ; ed38 (3:6d38)
	inc hl
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	reg16swap de, hl
	push de
	read_hl_from wCurRobotPointer
	ld de, $2ca
	add hl, de
	call WriteHLToSPPlus7
	xor a
	pop de
Func_ed56: ; ed56 (3:6d56)
	cp $8
	jp nc, Func_ee33
	push af
	ld c, $0
Func_ed5e: ; ed5e (3:6d5e)
	ld a, c
	cp $4
	jp nc, Func_ee2e
	push bc
	push de
	reg16swap de, hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$d
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $d
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	read_hl_from_sp_plus $b
	inc hl
	inc hl
	write_hl_to_sp_plus $b
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ed5e

Func_ee2e: ; ee2e (3:6e2e)
	pop af
	inc a
	jp Func_ed56

Func_ee33: ; ee33 (3:6e33)
	pop hl
	push de
	ld c, $0
Func_ee37: ; ee37 (3:6e37)
	ld a, c
	cp $4
	jp nc, Func_ee57
	push hl
	ld a, [hl]
	and $3
	ld l, a
	ld a, $4
	sub l
	ld e, c
	ld d, $0
	ld hl, sp+$7
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	rrca
	rrca
	and $3f
	ld [hl], a
	inc c
	jp Func_ee37

Func_ee57: ; ee57 (3:6e57)
	xor a
	pop de
Func_ee59: ; ee59 (3:6e59)
	cp $8
	jp nc, Func_ef31
	push af
	ld c, $0
Func_ee61: ; ee61 (3:6e61)
	ld a, c
	cp $4
	jp nc, Func_ef2c
	push bc
	push de
	reg16swap de, hl
	ld a, [hl]
	and $1f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$6
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	push af
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld l, a
	ld h, $0
	ld a, l
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $b
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $b
	ld b, $5
	call LeftShiftPointer
	pop af
	pop de
	pop bc
	push de
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld l, a
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlus9
	ld b, $5
	call LeftShiftPointer
	pop bc
	pop de
	push bc
	push de
	ld e, c
	ld d, $0
	ld hl, sp+$9
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld a, [hl]
	or c
	ld [hl], a
	inc hl
	ld a, [hl]
	or b
	ld [hl], a
	call GetHLAtSPPlus9
	inc hl
	inc hl
	call WriteHLToSPPlus9
	pop de
	inc de
	inc de
	pop bc
	inc c
	jp Func_ee61

Func_ef2c: ; ef2c (3:6f2c)
	pop af
	inc a
	jp Func_ee59

Func_ef31: ; ef31 (3:6f31)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_ef36: ; ef36
	ld a, [wNextVBlankFlags]
	and $40
	jp z, Func_ef3f
	ret

Func_ef3f: ; ef3f (3:6f3f)
	read_hl_from wCurRobotPointer
	inc hl
	ld a, $1
	add [hl]
	ld [hl], a
	read_hl_from wCurRobotPointer
	cp [hl]
	jp nc, Func_ef53
	ret

Func_ef53: ; ef53 (3:6f53)
	read_hl_from wCurRobotPointer
	inc hl
	ld [hl], $0
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_ef80
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $24a
	add hl, de
	reg16swap de, hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	jp Func_ef96

Func_ef80: ; ef80 (3:6f80)
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $2ca
	add hl, de
	reg16swap de, hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
Func_ef96: ; ef96 (3:6f96)
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld a, $1
	xor [hl]
	ld [hl], a
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
	ret

Func_efaa: ; efaa
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld [hl], a
	read_hl_from wCurRobotPointer
	inc hl
	ld [hl], $0
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $5
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $6
	add hl, de
	ld [hl], a
	check_cgb
	jp nz, Func_f049
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	call Func_eae7
	call WaitVideoTransfer
	ld a, $2
	ld [wc24d], a
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $6f36
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	jp Func_f063

Func_f049: ; f049 (3:7049)
	ld a, BANK(DoFlashProgram)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, DoFlashProgram
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f063: ; f063 (3:7063)
	pop hl
	push hl
	pop bc
	ret

Func_f067: ; f067
	push hl
	check_cgb
	jp nz, Func_f0b2
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wc2e8], a
Func_f07c: ; f07c (3:707c)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_f07c
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	reg16swap de, hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_f0a2: ; f0a2 (3:70a2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_f0a2
	ld a, $4
	ld [wc24d], a
	jp Func_f0cd

Func_f0b2: ; f0b2 (3:70b2)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ld a, $e4
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
Func_f0cd: ; f0cd (3:70cd)
	pop hl
	ret

BattleAnim_PlayMoveAnimScript: ; f0cf (3:70cf)
; Arguments: char
	ld a, [hl]
	inc hl
	push hl
	push af
	ld a, [wLCDC]
	ld e, a
	push de
	ldh a, [rIE]
	ld l, a
	push hl
	ld a, [wLCDC]
	and $fb
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call DisableHBlank
	set_farcall_addrs_hli StartMoveAnimScript
	pop hl
	pop de
	pop af
	push hl
	push de
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld e, [hl]
	call FarCall
	pop af
	push hl
	push af
	set_farcall_addrs_hli StartBattleSFXScript
	pop af
	call FarCall
.loop: ; f122 (3:7122)
	call NextBattleFrame
	callba_hli PlayBattleSFXScript
	set_farcall_addrs_hli PlayMoveAnimScript
	xor a
	call FarCall
	or a
	jp nz, .next
	jp .done

.next: ; f149 (3:7149)
	callba_hli QueueMoveAnimScriptGFXUpdate
	jp .loop

.done: ; f15a (3:715a)
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	ld a, e
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop hl
	ld a, l
	and $2
	jp z, .skip_hblank_enable
	call EnableHBlank
.skip_hblank_enable: ; f191 (3:7191)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	pop hl
	ret

Func_f19f: ; f19f
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
	ld h, $0
	ld de, $9c
	call MultiplyHLbyDE
	call Func_ddc2
	pop hl
	push hl
	pop bc
	ret

Func_f1b6: ; f1b6
	push hl
	read_hl_from wCurRobotPointer
	ld de, $7
	add hl, de
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $8
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $9
	add hl, de
	ld [hl], a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $a
	add hl, de
	ld [hl], a
	ld a, BANK(DoShakeProgram)
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, DoShakeProgram
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	pop hl
	push hl
	pop bc
	ret

Func_f210: ; f210
	push hl
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wSCY2], a
	ld [wSCY], a
	ld [wSCX2], a
	ld [wSCX], a
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop hl
	ret

Func_f233:: ; f233 (3:7233)
	push bc
	ld bc, wCGB_BGPalsBuffer
	read_hl_from wCurRobotPointer
	ld de, $24a
	add hl, de
	pop de
	push hl
	xor a
Func_f243: ; f243 (3:7243)
	cp $40
	jp nc, Func_f29b
	push af
	push bc
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $a
	call RightShiftHL
	ld a, l
	and $1f
	ld c, a
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop bc
	push bc
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $5
	call RightShiftHL
	ld a, l
	and $1f
	ld c, a
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop bc
	pop af
	push bc
	push af
	ld l, c
	ld h, b
	ld a, [hl]
	and $1f
	ld c, a
	inc hl
	ld b, $0
	call GetHLAtSPPlus6
	ld [hl], c
	inc hl
	call WriteHLToSPPlus6
	pop af
	inc a
	pop bc
	inc bc
	inc bc
	jp Func_f243

Func_f29b: ; f29b (3:729b)
	pop bc
	ret

Func_f29d: ; f29d
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld [hl], a
	read_hl_from wCurRobotPointer
	inc hl
	ld [hl], $0
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld [hl], $0
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld [hl], $1
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	inc hl
	ld [hl], $0
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $5
	add hl, de
	ld [hl], a
	ld a, [wSystemType]
	or a
	jp z, Func_f31b
	cp $ff
	jp z, Func_f31b
	cp $1
	jp z, Func_f31b
	cp $11
	jp nz, Func_f335
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	call Func_f233
	call WaitVideoTransfer
	ld a, $2
	ld [wc24d], a
	ld a, $1
	ld [wc2e8], a
	jp Func_f335

Func_f31b: ; f31b (3:731b)
	ld a, $1
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $6a16
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f335: ; f335 (3:7335)
	pop hl
	push hl
	pop bc
	ret

Func_f339: ; f339
	push hl
	check_cgb
	jp nz, Func_f358
	xor a
	ld [wc2e8], a
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld [hl], $ff
	ld a, $1
	ld [wc2e8], a
	jp Func_f375

Func_f358: ; f358 (3:7358)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld [hl], $ff
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_f375: ; f375 (3:7375)
	pop hl
	ret

Func_f377: ; f377
	push hl
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $ff
	jp nz, Func_f395
Func_f386: ; f386 (3:7386)
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_f3a2
	jp Func_f386

Func_f395: ; f395 (3:7395)
	read_hl_from wCurRobotPointer
	inc hl
	inc hl
	ld a, [hl]
	cp $10
	jp nz, Func_f395
Func_f3a2: ; f3a2 (3:73a2)
	pop hl
	ret

Func_f3a4: ; f3a4
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
	xor a
Func_f3ad: ; f3ad (3:73ad)
	cp l
	jp nc, Func_f3bc
	push hl
	push af
	call NextBattleFrame
	pop af
	inc a
	pop hl
	jp Func_f3ad

Func_f3bc: ; f3bc (3:73bc)
	pop hl
	push hl
	pop bc
	ret

Func_f3c0: ; f3c0
	push hl
	ld hl, Data_c009
	call PlayBattleAnimScript
	pop hl
	ret

Func_f3c9: ; f3c9
	push hl
	ld hl, Data_c016
	call PlayBattleAnimScript
	pop hl
	ret

Func_f3d2: ; f3d2
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	push af
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld l, a
	ld h, $0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $80
	call CompareHLtoDE
	jp c, Func_f40c
	call GetHLAtSPPlus6
	dec h
	call WriteHLToSPPlus6
Func_f40c: ; f40c (3:740c)
	ld l, c
	ld h, b
	ld de, $80
	call CompareHLtoDE
	jp c, Func_f418
	dec b
Func_f418: ; f418 (3:7418)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_f434
	call GetHLAtSPPlus8
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus8
Func_f434: ; f434 (3:7434)
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop af
Func_f496: ; f496 (3:7496)
	cp $1
	jp c, Func_f4ea
	push de
	push af
	push bc
	reg16swap de, hl
	add hl, bc
	push hl
	read_hl_from_sp_plus $c
	push hl
	read_hl_from_sp_plus $c
	pop de
	add hl, de
	pop de
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_f4bf: ; f4bf (3:74bf)
	cp $2
	jp nc, Func_f4cd
	push af
	call NextBattleFrame
	pop af
	inc a
	jp Func_f4bf

Func_f4cd: ; f4cd (3:74cd)
	call GetHLAtSPPlus10
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	call WriteHLToSPPlus10
	pop bc
	ld a, c
	cpl
	ld l, a
	ld a, b
	cpl
	ld h, a
	inc hl
	ld c, l
	ld b, h
	pop af
	dec a
	pop de
	jp Func_f496

Func_f4ea: ; f4ea (3:74ea)
	call GetHLAtSPPlus6
	pop bc
	pop bc
	pop bc
	ret

Func_f4f1: ; f4f1
	ld a, [hl]
	inc hl
	push hl
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $d
	add hl, de
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, l
	xor c
	ld l, a
	ld a, h
	xor b
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $11
	add hl, de
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop af
Func_f554: ; f554 (3:7554)
	cp $1
	jp c, Func_f5c5
	push af
	push bc
	push de
	ld hl, $8
	add hl, bc
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	push bc
	push de
	ld hl, -8
	add hl, de
	reg16swap de, hl
	ld hl, $8
	add hl, bc
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	push bc
	push de
	ld hl, -8
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	pop af
	push bc
	push de
	push af
	ld l, c
	ld h, b
	call Func_de2c
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop af
	dec a
	pop de
	pop bc
	jp Func_f554

Func_f5c5: ; f5c5 (3:75c5)
	pop hl
	ret

Func_f5c7: ; f5c7
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld c, a
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	ld l, a
Func_f5d6: ; f5d6 (3:75d6)
	ld a, c
	cp $1
	jp c, Func_f5f5
	push hl
	push bc
	ld h, $0
	add hl, hl
	ld de, Data_c6e1
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call PlayBattleAnimScript
	pop bc
	dec c
	pop hl
	jp Func_f5d6

Func_f5f5: ; f5f5 (3:75f5)
	pop hl
	push hl
	pop bc
	ret

Func_f5f9: ; f5f9
	push hl
	set_farcall_addrs_hli Func_6a77
	pop hl
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call FarCall
	pop hl
	inc hl
	inc hl
	ret

Func_f612: ; f612
	push hl
.loop
	call CheckSFXFinished
	or a
	jp nz, .loop
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call OverworldPlaySFX
	pop hl
	push hl
	pop bc
	ret

Func_f627: ; f627
	ld a, [hl]
	inc hl
	ld [wc318], a
	ret

Func_f62d: ; f62d
	push hl
	pop hl
	push hl
	ld a, [hl]
	inc hl
	pop de
	push hl
	call OverworldPlaySong
	pop hl
	push hl
	pop bc
	ret

Func_f63b: ; f63b
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_f64c
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_f660
Func_f64c: ; f64c (3:764c)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
Func_f660: ; f660 (3:7660)
	pop hl
	ret

Func_f662: ; f662
	push hl
	ld a, [wSystemType]
	cp $1
	jp z, Func_f673
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_f687
Func_f673: ; f673 (3:7673)
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $3
	ld a, $2
	call FarCall
Func_f687: ; f687 (3:7687)
	pop hl
	ret

Func_f689: ; f689
	push hl
	ld e, $0
	xor a
	call SetStringStartState
	ld hl, Data_f6cb
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
.asm_f69e
	xor a
	call PushBGMapRegion
	pop bc
	xor a
	ld [wJoyHeld], a
Func_f6a8: ; f6a8 (3:76a8)
	call NextOverworldFrame
	or a
	jp z, Func_f6a8
	ld e, $0
	xor a
	call SetStringStartState
	ld hl, Data_f6d1
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	pop hl
	ret

Data_f6cb: ; f6cb
	dstr "キー マチ"

Data_f6d1: ; f6d1
	dstr "     "

Pointers_f6d7: ; f6d7
	dw $0        ; 00 (dummy)
	dw BattleAnim_DoublePushScreen ; 01
	dw Func_e3d1 ; 02
	dw Func_e4d1 ; 03
	dw Func_e6b7 ; 04
	dw BattleAnim_ClearSprites ; 05
	dw Func_e78d ; 06
	dw Func_e89b ; 07
	dw Func_e994 ; 08
	dw Func_e9a4 ; 09
	dw Func_e9bc ; 0a
	dw Func_e9d4 ; 0b
	dw Func_eab8 ; 0c
	dw Func_eac8 ; 0d
	dw Func_ead8 ; 0e
	dw Func_eadf ; 0f
	dw Func_efaa ; 10
	dw Func_f067 ; 11
	dw BattleAnim_PlayMoveAnimScript ; 12
	dw Func_f19f ; 13
	dw Func_f1b6 ; 14
	dw Func_f210 ; 15
	dw Func_f29d ; 16
	dw Func_f339 ; 17
	dw Func_f377 ; 18
	dw Func_f3a4 ; 19
	dw Func_f3c0 ; 1a
	dw Func_f3c9 ; 1b
	dw Func_f3d2 ; 1c
	dw Func_f4f1 ; 1d
	dw Func_f5c7 ; 1e
	dw Func_f5f9 ; 1f
	dw Func_f612 ; 20
	dw Func_f627 ; 21
	dw Func_f62d ; 22
	dw Func_f63b ; 23
	dw Func_f662 ; 24
	dw Func_f689 ; 25

PlayBattleAnimScript:: ; f723 (3:7723)
	push hl
.loop
	pop hl
	push hl
	ld a, [hl]
	or a
	jp z, .Quit
	ld hl, .Return
	push hl
	call GetHLAtSPPlus4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_f6d7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	inc hl
	ret

.Return
	pop de
	push hl
	jp .loop

.Quit
	pop bc
	ret

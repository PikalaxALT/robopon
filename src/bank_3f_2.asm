INCLUDE "includes.asm"
INCLUDE "charmap.asm"

IF DEF(SUN)
DEF __offset_3F_2 EQU $573e
ELIF DEF(STAR)
DEF __offset_3F_2 EQU $573c
ENDC

SECTION "Bank 3f, 2", ROMX

INCLUDE "charmap.asm"
Func_fd73e:
	ret

Func_fd73f:
	ret

Data_fd740:
	db $16, $04, $06, $00

Data_fd744:
	dw $18

Func_fd746:
	push bc
	push bc
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_fd740
	ld bc, $4
	call MemCopy
	read_hl_from Data_fd744
	pop de
	push hl
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$2
	call FarCall
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	pop bc
	pop bc
	pop bc
	ret

Data_fd783:
IF DEF(SUN)
	db $17, $18, $11, $00
ELIF DEF(STAR)
	db $17, $18, $11, $00
ENDC

Func_fd787: ; fd787 (3f:5787)
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_fd783
	ld bc, $4
	call MemCopy
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	pop bc
	pop bc
	ret

Func_fd7ab: ; fd7ab (3f:57ab)
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $103
	ld de, $1311
	ld hl, $0
	call FarCall
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ret

Func_fd7df: ; fd7df (3f:57df)
	ret

Func_fd7e0: ; fd7e0 (3f:57e0)
	add sp, -$3e
	push de
	push af
	call Func_fd7ab
	pop af
	or a
	jp nz, Func_fd7f3
	ld hl, sp+$3
	ld [hl], $b
	jp Func_fd7f7

Func_fd7f3: ; fd7f3 (3f:57f3)
	ld hl, sp+$3
	ld [hl], $1
Func_fd7f7: ; fd7f7 (3f:57f7)
	ld c, $0
	pop de
Func_fd7fa: ; fd7fa (3f:57fa)
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_fd809
	inc c
	jp Func_fd7fa

Func_fd809: ; fd809 (3f:5809)
	push de
	ld a, c
	add a
	ld l, a
	ld a, $12
	sub l
	ld b, $2
	call DivideAbyB
	ld hl, sp+$2
	ld [hl], a
	ld c, $0
	pop de
Func_fd81b: ; fd81b (3f:581b)
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_fd84a
	push de
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call FindFirstNonzero
	ld e, l
	ld hl, sp+$5
	ld a, [hl]
	add e
	cp $13
	jp c, Func_fd844
	ld a, $13
	sub e
	ld hl, sp+$5
	ld [hl], a
Func_fd844: ; fd844 (3f:5844)
	pop bc
	inc c
	pop de
	jp Func_fd81b

Func_fd84a: ; fd84a (3f:584a)
	ld l, e
	ld h, d
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_fd884
	push de
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call SetStringStartState
	ld a, $3f
	ld [wFarCallDestBank], a
	pop de
	push de
	reg16swap de, hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$4
	call LiteralStringInTree
	ld hl, sp+$4
	push hl
	call PlaceString
	pop bc
	pop de
	inc de
	inc de
	ld hl, sp+$0
	ld a, [hl]
	add $2
	ld hl, sp+$0
	ld [hl], a
	jp Func_fd84a

Func_fd884: ; fd884 (3f:5884)
	add sp, $3e
	ret

Data_fd887:
IF DEF(SUN)
	db $03, $00, $f8, $05, $06, $04, $13, $19, $78, $06, $fc, $14, $00
ELIF DEF(STAR)
	db $03, $00, $f8, $05, $06, $04, $13, $19, $78, $06, $fc, $14, $00
ENDC

Func_fd894: ; fd894 (3f:5894)
	add sp, -$e
	push af
	push de
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_fd887
	ld bc, $d
	call MemCopy
	set_farcall_addrs_hli Func_dc0a
	pop de
	pop af
	push af
	call FarCall
	pop af
	push af
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli Func_61424
	pop af
	or a
	jp nz, Func_fd8e0
	ld c, $1
	ld e, $1
	ld a, $2
	call FarCall
	jp Func_fd8e9

Func_fd8e0: ; fd8e0 (3f:58e0)
	ld c, $1
	ld e, $3
	ld a, $1
	call FarCall
Func_fd8e9: ; fd8e9 (3f:58e9)
	set_farcall_addrs_hli PlayBattleAnimScript
	ld hl, sp+$0
	call FarCall
	add sp, $e
	ret

Func_fd8fc: ; fd8fc (3f:58fc)
	set_farcall_addrs_hli Func_c7bd0
	xor a
	call FarCall
	ld a, [wSystemType]
	cp $1
	jp z, Func_fd91b
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_fd92e
Func_fd91b: ; fd91b (3f:591b)
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
Func_fd92e: ; fd92e (3f:592e)
	call Func_fd746
	ld hl, wSCY
	ld a, [wOverworldTilemapSelector]
	ld e, a
	ld d, $0
	ld a, e
	xor $1
	ld e, a
	add hl, de
	ld [hl], $0
	ld c, [hl]
	ld hl, wSCX
	ld a, [wOverworldTilemapSelector]
	ld e, a
	ld d, $0
	ld a, e
	xor $1
	ld e, a
	add hl, de
	ld [hl], c
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, wSCY
	add hl, de
	ld [hl], c
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	ld de, wSCX
	add hl, de
	ld [hl], c
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call Func_fc092
	call ClearSprites
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_fc092
	ret

Func_fd989:
	push hl
	push bc
	push de
	ld hl, sp+$2
	ld [hl], $0
	xor a
	call Func_fd8fc
	ld de, Pointers_fd3e3
	xor a
	call Func_fd7e0
	set_farcall_addrs_hli Func_dc0a
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld e, a
	ld hl, sp+$2
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $105
	call FarCall
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	check_cgb
	jp nz, Func_fda3e
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_fda3e: ; fda3e (3f:5a3e)
	call WaitVideoTransfer
	call Func_fc756
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	check_cgb
	jp nz, Func_fda5b
	xor a
	ld [wc2e8], a
Func_fda5b: ; fda5b (3f:5a5b)
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
	check_cgb
	jp nz, Func_fdaad
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	callba_hli Func_f233
	ld a, $1
	ld [wc2e8], a
	jp Func_fdac1

Func_fdaad: ; fdaad (3f:5aad)
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	ld a, $2
	call FarCall
Func_fdac1: ; fdac1 (3f:5ac1)
	call Func_fd787
	xor a
	ld [wInBattle], a
	call Func_fd7df
	xor a
Func_fdacc: ; fdacc (3f:5acc)
	cp $78
	jp nc, Func_fdada
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_fdacc

Func_fdada: ; fdada (3f:5ada)
	ld l, $1
	ld c, $1
	pop de
Func_fdadf: ; fdadf (3f:5adf)
	ld a, c
	cp e
	jp nc, Func_fdb85
	push de
	push bc
	push hl
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	ld hl, sp+$6
	ld a, [hl]
	xor $1
	ld hl, sp+$6
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, Pointers_fd714
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call Func_fd7e0
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	check_cgb
	jp nz, Func_fdb5a
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_fdb5a: ; fdb5a (3f:5b5a)
	call WaitVideoTransfer
	call Func_fc756
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	pop hl
	push hl
	ld c, l
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld e, a
	ld hl, sp+$6
	ld a, [hl]
	call Func_fd894
	pop hl
	pop bc
	inc c
	inc l
	pop de
	jp Func_fdadf

Func_fdb85: ; fdb85 (3f:5b85)
	ld a, [wSystemType]
	cp $1
	jp z, Func_fdb95
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_fdba8
Func_fdb95: ; fdb95 (3f:5b95)
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
Func_fdba8: ; fdba8 (3f:5ba8)
	call Func_fd746
	call FillVisibleAreaWithBlankTile
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wc2e8], a
	call Func_fc092
	xor a
	ld [wOBP1], a
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld a, [wLCDC]
	and $fd
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	pop bc
	pop bc
	ret

Func_fdbe8:
	push hl
	push de
	push bc
	call Func_fd8fc
	pop bc
	push bc
	ld a, c
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_fd714
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_fd7e0
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	set_farcall_addrs_hli Func_dc0a
	pop bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus6
	ld e, a
	ld a, c
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	pop bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	inc c
	dec c
	jp nz, Func_fdc51
	ld hl, $0
	jp Func_fdc54

Func_fdc51: ; fdc51 (3f:5c51)
	ld hl, $b
Func_fdc54: ; fdc54 (3f:5c54)
	ld h, l
	ld l, $0
	ld de, $5
	add hl, de
	pop de
	ld c, $2
	call FarCall
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	check_cgb
	jp nz, Func_fdcb3
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_fdcb3: ; fdcb3 (3f:5cb3)
	call WaitVideoTransfer
	call Func_fc756
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	check_cgb
	jp nz, Func_fdcd0
	xor a
	ld [wc2e8], a
Func_fdcd0: ; fdcd0 (3f:5cd0)
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
	pop bc
	check_cgb
	jp nz, Func_fdd25
	push bc
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	callba_hli Func_f233
	ld a, $1
	ld [wc2e8], a
	pop bc
	jp Func_fdd4f

Func_fdd25: ; fdd25 (3f:5d25)
	push bc
	set_farcall_addrs_hli Func_61424
	pop bc
	inc c
	dec c
	jp nz, Func_fdd45
	push bc
	ld c, $0
	ld e, $0
	ld a, $2
	call FarCall
	pop bc
	jp Func_fdd4f

Func_fdd45: ; fdd45 (3f:5d45)
	push bc
	ld c, $0
	ld e, $3
	xor a
	call FarCall
	pop bc
Func_fdd4f: ; fdd4f (3f:5d4f)
	push bc
	call Func_fd787
	xor a
	ld [wInBattle], a
	call Func_fd7df
	xor a
Func_fdd5b: ; fdd5b (3f:5d5b)
	cp $78
	jp nc, Func_fdd69
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_fdd5b

Func_fdd69: ; fdd69 (3f:5d69)
	ld a, $1
	pop bc
	pop de
Func_fdd6d: ; fdd6d (3f:5d6d)
	cp e
	jp nc, Func_fde18
	push de
	push af
	ld a, c
	xor $1
	ld c, a
	push bc
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	ld a, c
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_fd714
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_fd7e0
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	check_cgb
	jp nz, Func_fdde3
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $12
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_fdde3: ; fdde3 (3f:5de3)
	call WaitVideoTransfer
	call Func_fc756
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	pop bc
	pop af
	push bc
	push af
	call GetHLAtSPPlus8
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus8
	ld e, a
	ld a, c
	ld hl, sp+$a
	ld c, [hl]
	call Func_fd894
	pop af
	inc a
	push af
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	pop af
	pop bc
	pop de
	jp Func_fdd6d

Func_fde18: ; fde18 (3f:5e18)
	call Func_fd746
	call FillVisibleAreaWithBlankTile
	ld a, [wSystemType]
	cp $1
	jp z, Func_fde2e
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_fde41
Func_fde2e: ; fde2e (3f:5e2e)
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
Func_fde41: ; fde41 (3f:5e41)
	ld e, $8
	ld a, $8
	call SetStringStartState
	ld hl, Data_fdf06
	push hl
	call PlaceString
	pop bc
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	call Func_fd787
Func_fde64: ; fde64 (3f:5e64)
	call CheckButton
	and $70
	jp z, Func_fde64
	ld a, $7
Func_fde6e: ; fde6e (3f:5e6e)
	or a
	jp nz, Func_fde75
	jp Func_fde8d

Func_fde75: ; fde75 (3f:5e75)
	dec a
	push af
	call SetVolume
	xor a
Func_fde7b: ; fde7b (3f:5e7b)
	cp $4
	jp nc, Func_fde89
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_fde7b

Func_fde89: ; fde89 (3f:5e89)
	pop af
	jp Func_fde6e

Func_fde8d: ; fde8d (3f:5e8d)
	xor a
	call OverworldPlaySong
	ld a, $7
	call SetVolume
	call Func_fd746
	ld a, [wSystemType]
	cp $1
	jp z, Func_fdea9
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_fdebc
Func_fdea9: ; fdea9 (3f:5ea9)
	set_farcall_addrs_hli Func_61424
	ld c, $0
	ld e, $0
	xor a
	call FarCall
Func_fdebc: ; fdebc (3f:5ebc)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	xor a
	ld [wc2e8], a
	call Func_fc092
	xor a
	ld [wOBP1], a
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call Func_fc092
	ld a, [wLCDC]
	and $fd
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call Func_fc092
	call FillVisibleAreaWithBlankTile
	callba_hli Func_fdfe2
	pop bc
	ret

Data_fdf06:
	dstr "(おわり)"

Data_fdf0c:
IF DEF(SUN)
	db $01, $58, $15, $3a, $2a, $4a, $8f
ELIF DEF(STAR)
	db $01, $58, $15, $3a, $2a, $4a, $8f
ENDC

Credits:: ; fdf13 (3f:5f13)
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_fdf0c
	ld bc, $7
	call MemCopy
	call Func_fd73e
	callba_hli AllocateMonsterStruct
	ld a, $4
	ld [wInBattle], a
	ld e, $7
	ld hl, sp+$0
	call Func_fd989
	call Func_fd73f
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_fdf4b:
IF DEF(SUN)
	db $92, $11, $0e, $20, $35, $17, $31, $96, $94, $95, $8b, $85, $55, $28
ELIF DEF(STAR)
	db $92, $11, $0e, $20, $35, $17, $31, $96, $94, $95, $8b, $85, $55, $28
ENDC

Credits2:: ; fdf59 (3f:5f59)
	add sp, -$e
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_fdf4b
	ld bc, $e
	call MemCopy
	call Func_fd73e
	callba_hli AllocateMonsterStruct
	ld a, $4
	ld [wInBattle], a
	ld l, $7
	push hl
	ld c, $1
	ld e, $e
	ld hl, sp+$2
	call Func_fdbe8
	pop bc
	call Func_fd73f
	add sp, $e
	ret

Data_fdf93:
IF DEF(SUN)
	db $01, $58, $15, $3a, $2a, $4a, $8f, $92, $11, $0e, $20, $35, $17, $31, $96, $94, $95, $8b, $85, $55, $28
ELIF DEF(STAR)
	db $01, $58, $15, $3a, $2a, $4a, $8f, $92, $11, $0e, $20, $35, $17, $31, $96, $94, $95, $8b, $85, $55, $28
ENDC

Func_fafa8:
	add sp, -$16
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_fdf93
	ld bc, $15
	call MemCopy
	call Func_fd73e
	callba_hli AllocateMonsterStruct
	ld a, $4
	ld [wInBattle], a
	ld l, $0
	push hl
	ld c, $0
	ld e, $15
	ld hl, sp+$2
	call Func_fdbe8
	pop bc
	call Func_fd73f
	add sp, $16
	ret

Func_fdfe2: ; fdfe2 (3f:5fe2)
	jp Func_0388

Func_fdfe5:: ; fdfe5 (3f:5fe5)
	xor a
	ld [wc319], a
	ld [wc31a], a
	ld [wc31b], a
	ld [wc31e], a
	ld hl, Func_fe03a
	ld de, wLCDInterrupt2
	ld bc, $5c
.asm_fdffb
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_fdffb
	ret

Func_fe004:: ; fe004 (3f:6004)
	xor a
	ld [wc319], a
	ld [wc31e], a
	ld a, $1c
	ld [wc31a], a
	add $1
	ld [wc31b], a
	ld hl, Func_fe096
	ld de, wLCDInterrupt2
	ld bc, $6c
.asm_fe01e
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_fe01e
	ld a, [wc31a]
	ldh [rLYC], a
	di
	ldh a, [rIF]
	and $fd
	ldh [rIF], a
	ldh a, [rIE]
	or $2
	ldh [rIE], a
	ei
	ret

Func_fe03a: ; fe03a (3f:603a)
	push af
	push bc
	ld a, [wc319]
	inc a
	ld [wc319], a
	cp $1
	jr z, .asm_fe055
	cp $2
	jr z, .asm_fe05a
	cp $3
	jr z, .asm_fe06c
	cp $4
	jr z, .asm_fe074
	jr .asm_fe086

.asm_fe055
	ld bc, $20
	jr .asm_fe08d

.asm_fe05a
	ld a, [wc31a]
	add $4
	cp $18
	jr nz, .asm_fe064
	xor a
.asm_fe064
	ld [wc31a], a
	ld b, a
	ld c, $28
	jr .asm_fe08d

.asm_fe06c
	ld a, [wc31e]
	ld b, a
	ld c, $68
	jr .asm_fe08d

.asm_fe074
	ld a, [wc31b]
	sub $4
	cp $e8
	jr nz, .asm_fe07e
	xor a
.asm_fe07e
	ld [wc31b], a
	ld b, a
	ld c, $6f
	jr .asm_fe08d

.asm_fe086
	xor a
	ld [wc319], a
	ld bc, $0
.asm_fe08d
	ld a, b
	ldh [rSCX], a
	ld a, c
	ldh [rLYC], a
	pop bc
	pop af
	reti

Func_fe096: ; fe096 (3f:6096)
	push af
	push bc
	ld b, $0
	ld a, [wc319]
	xor $1
	ld [wc319], a
	jr z, .asm_fe0b3
	ldh a, [rLCDC]
	ld a, [wLCDC]
	ldh [rLCDC], a
	ld a, [wc31b]
	ldh [rLYC], a
	pop bc
	pop af
	reti

.asm_fe0b3
	ld a, [wLCDC]
	xor $8
	ldh [rLCDC], a
	ld a, [wc31a]
	ldh [rLYC], a
	ld a, [wc31e]
	inc a
	cp $2
	jr nc, .asm_fe0cd
	ld [wc31e], a
	pop bc
	pop af
	reti

.asm_fe0cd
	xor a
	ld [wc31e], a
	ld a, [wc31a]
	dec a
	cp $ff
	jr nz, .asm_fe0dc
	set 0, b
	xor a
.asm_fe0dc
	ld [wc31a], a
	ld a, [wc31b]
	inc a
	cp $39
	jr nz, .asm_fe0ea
	set 1, b
	dec a
.asm_fe0ea
	ld [wc31b], a
	ld a, b
	cp $3
	jr nz, .asm_fe0ff
	ld a, [wLCDC]
	ldh [rLCDC], a
	ldh a, [rIE]
	and $fd
	ldh [rIE], a
	ldh [rIF], a
.asm_fe0ff
	pop bc
	pop af
	reti

Func_fe102:: ; fe102 (3f:6102)
	ld bc, $3c
	call Func_ffd81
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
.asm_fe113
	ld a, [wNextVBlankFlags]
	and $2
	jr nz, .asm_fe113
	di
	xor a
	ldh [rBGP], a
	ld a, [wSystemType]
	or a
	ret z
	cp $11
	ret z
	cp $1
	jr z, .asm_fe133
	cp $ff
	jr z, .asm_fe133
.asm_fe12e
	xor a
	ld [wSystemType], a
	ret

.asm_fe133
	call Func_ffcd4
	jp nc, .asm_fe12e
	ld hl, Data_fe444
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe1da
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe1ea
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe1fa
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe20a
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe21a
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe22a
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe23a
	ld de, $10
	call Func_2b7d
	ld hl, Data_fe24a
	ld de, $10
	call Func_2b7d
	ld hl, Data_fecd4
	ld de, Data_fe404
	call Func_ffd49
	ld bc, $a
	call Func_ffd81
	ld hl, Data_fe474
	ld de, Data_fe414
	call Func_ffd49
	ld bc, $a
	call Func_ffd81
	ld hl, Data_fe2b4
	ld de, Data_fe384
	call Func_ffd49
	ld bc, $a
	call Func_ffd81
	ld hl, Data_fe374
	ld de, $10
	call Func_2b7d
	ld bc, $a
	call Func_ffd81
	ld bc, $3c
	call Func_ffd81
	xor a
	ldh [rBGP], a
	ld hl, Data_fe454
	ld de, $10
	call Func_2b7d
	ei
	ret

IF DEF(SUN)
Data_fe1da: ; fe1da
	db $79, $5d, $08, $00, $0b, $8c, $d0, $f4, $60, $00, $00, $00, $00, $00, $00, $00

Data_fe1ea: ; fe1ea
	db $79, $52, $08, $00, $0b, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0

Data_fe1fa: ; fe1fa
	db $79, $47, $08, $00, $0b, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28

Data_fe20a: ; fe20a
	db $79, $3c, $08, $00, $0b, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9

Data_fe21a: ; fe21a
	db $79, $31, $08, $00, $0b, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e

Data_fe22a: ; fe22a
	db $79, $26, $08, $00, $0b, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0

Data_fe23a: ; fe23a
	db $79, $1b, $08, $00, $0b, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0

Data_fe24a: ; fe24a
	db $79, $10, $08, $00, $0b, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe2b4: ; fe2b4
	db $df, $6f, $7f, $3f, $da, $01, $00, $00, $df, $6f, $b0, $2a, $09, $02, $00, $00, $df, $6f, $18, $7b, $d0, $70, $00, $00, $df, $6f, $5f, $57, $3f, $46, $00, $00, $01, $ea, $4f, $e0, $03, $60, $02, $20, $01, $3f, $01, $1f, $00, $0b, $00, $00, $09, $ea, $4f, $00, $7c, $00, $5c, $00, $28, $3f, $05, $39, $3a, $dd, $4e, $00, $11, $ff, $7f, $da, $5a, $94, $31, $bf, $14, $e0, $01, $bf, $02, $00, $00, $00, $19, $38, $6b, $50, $56, $88, $3d, $a0, $28, $48, $00, $39, $3a, $dd, $4e, $00, $21, $02, $03, $09, $01, $01, $05, $05, $02, $06, $07, $07, $0e, $0e, $00, $00, $29, $02, $af, $42, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $31, $27, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $39, $00, $00, $28, $00, $00, $00, $00, $00, $00, $00, $55, $55, $55, $55, $55, $41, $01, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $49, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe374: ; fe374
	db $51, $00, $00, $01, $00, $02, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe384: ; fe384
	db $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $61, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $69, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $79, $00, $80, $7e, $0b, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $81, $00, $80, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $89, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $91, $00, $80, $7f, $00, $88, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe404: ; fe404
	db $99, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe414: ; fe414
	db $a1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $a9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $b1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe444: ; fe444
	db $b9, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe454: ; fe454
	db $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $c1, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe474: ; fe474
	db $40, $10, $41, $10, $04, $10, $05, $10, $0a, $10, $0b, $10, $0c, $10, $0d, $10, $0e, $10, $0f, $10, $20, $10, $62, $10, $62, $10, $09, $10, $09, $50, $09, $10, $09, $50, $09, $10, $09, $50, $62, $10, $62, $10, $21, $10, $22, $10, $23, $10, $24, $10, $25, $10, $26, $10, $27, $10, $05, $50, $04, $50, $41, $50, $40, $50, $50, $10, $51, $10, $14, $10, $15, $10, $1a, $10, $1b, $10, $1c, $10, $1d, $10, $1e, $10, $1f, $10, $30, $10, $62, $10, $62, $10, $19, $10, $19, $50, $19, $10, $19, $50, $19, $10, $19, $50, $62, $10, $62, $10, $31, $10, $32, $10, $33, $10, $34, $10, $35, $10, $36, $10, $37, $10, $15, $50, $14, $50, $51, $50, $50, $50, $62, $10, $02, $10, $03, $10, $62, $10, $06, $90, $06, $90, $06, $90, $06, $90, $06, $90, $06, $90, $07, $90, $3a, $10, $3b, $10, $3c, $10, $3d, $10, $2a, $10, $2b, $10, $2c, $10, $2d, $10, $2e, $10, $3e, $10, $07, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $62, $10, $03, $50, $02, $50, $62, $10, $62, $10, $12, $10, $13, $10, $62, $10, $62, $10, $62, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $62, $10, $62, $10, $62, $10, $13, $50, $12, $50, $62, $10, $62, $10, $42, $10, $43, $10, $62, $10, $62, $10, $08, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $08, $50, $62, $10, $62, $10, $43, $50, $42, $50, $62, $10, $62, $10, $52, $10, $53, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $53, $50, $52, $50, $62, $10, $62, $10, $44, $10, $54, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $54, $50, $44, $50, $62, $10, $62, $10, $45, $10, $46, $10, $47, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $47, $50, $46, $50, $45, $50, $62, $10, $28, $10, $29, $10, $5f, $10, $16, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $16, $50, $5f, $50, $29, $50, $28, $50, $38, $10, $39, $10, $48, $10, $49, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $49, $50, $48, $50, $39, $50, $38, $50, $55, $10, $56, $10, $57, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $57, $50, $56, $50, $55, $50, $5e, $10, $5f, $10, $4a, $10, $4b, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4f, $d0, $4e, $d0, $5f, $50, $5e, $50, $5e, $10, $5f, $10, $5a, $10, $5b, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $5d, $d0, $5c, $d0, $5f, $50, $5e, $50, $5e, $10, $5f, $10, $4c, $10, $4d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4d, $d0, $4c, $d0, $5f, $50, $5e, $50, $5e, $90, $5f, $90, $4c, $10, $4d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4d, $d0, $4c, $d0, $5f, $d0, $5e, $d0, $5e, $90, $5f, $90, $5c, $10, $5d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $5b, $d0, $5a, $d0, $5f, $d0, $5e, $d0, $5e, $90, $5f, $90, $4e, $10, $4f, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4b, $d0, $4a, $d0, $5f, $d0, $5e, $d0, $55, $90, $56, $90, $57, $90, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $57, $d0, $56, $d0, $55, $d0, $38, $90, $39, $90, $48, $90, $49, $90, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $49, $d0, $48, $d0, $39, $d0, $38, $d0, $28, $90, $29, $90, $5f, $10, $16, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $16, $50, $5f, $50, $29, $d0, $28, $d0, $62, $10, $45, $90, $46, $90, $47, $90, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $47, $d0, $46, $d0, $45, $d0, $62, $10, $62, $10, $42, $10, $43, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $43, $50, $42, $50, $62, $10, $62, $10, $52, $10, $53, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $53, $50, $52, $50, $62, $10, $62, $10, $44, $10, $54, $10, $62, $10, $62, $10, $08, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $08, $d0, $62, $10, $62, $10, $54, $50, $44, $50, $62, $10, $62, $10, $12, $90, $13, $90, $62, $10, $62, $10, $62, $10, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $63, $14, $64, $14, $65, $14, $2f, $90, $2f, $90, $69, $14, $6a, $14, $6b, $14, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $62, $10, $62, $10, $62, $10, $13, $d0, $12, $d0, $62, $10, $62, $10, $02, $90, $03, $90, $62, $10, $06, $10, $06, $10, $06, $10, $06, $10, $07, $10, $62, $10, $62, $10, $62, $10, $62, $10, $66, $14, $67, $14, $68, $14, $68, $54, $67, $54, $66, $54, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $06, $50, $06, $50, $06, $50, $06, $50, $62, $10, $03, $d0, $02, $d0, $62, $10, $50, $90, $51, $90, $14, $90, $15, $90, $60, $10, $60, $10, $60, $10, $60, $10, $01, $50, $17, $10, $61, $10, $17, $50, $58, $10, $6c, $14, $6d, $14, $6e, $14, $6e, $54, $6d, $54, $6c, $54, $58, $50, $17, $10, $18, $10, $17, $50, $01, $10, $60, $50, $60, $50, $60, $50, $60, $50, $15, $d0, $14, $d0, $51, $d0, $50, $d0, $40, $90, $41, $90, $04, $90, $05, $90, $60, $90, $60, $90, $60, $90, $60, $90, $01, $d0, $17, $90, $18, $90, $17, $d0, $58, $90, $6f, $14, $70, $14, $71, $14, $71, $54, $70, $54, $6f, $54, $58, $d0, $17, $90, $61, $90, $17, $d0, $01, $90, $60, $d0, $60, $d0, $60, $d0, $60, $d0, $05, $d0, $04, $d0, $41, $d0, $40, $d0, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $7f, $f7, $5e, $31, $46, $4a, $29, $00, $00, $27, $02, $ff, $03, $9f, $02, $d9, $01, $00, $7c, $3d, $53, $7b, $36, $93, $21, $ea, $14, $ff, $7f, $00, $00, $ff, $7f, $f7, $5e, $31, $46, $4a, $29, $00, $00, $27, $02, $ff, $03, $3f, $03, $9f, $02, $1b, $02, $1f, $3e, $1f, $00, $12, $00, $00, $03, $e0, $2b, $00, $00, $1f, $00, $bf, $01, $ff, $03, $ed, $03, $e0, $03, $e0, $37, $e0, $7f, $a0, $7d, $00, $7c, $0d, $7c, $1f, $7c, $1f, $34, $29, $25, $52, $4a, $ff, $7f

Data_fecd4: ; fecd4
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $1c, $eb, $39, $d6, $2b, $c5, $72, $ac, $77, $aa, $77, $aa, $77, $aa, $77, $aa, $ef, $10, $d6, $29, $cd, $32, $ac, $53, $ba, $45, $bb, $44, $bb, $44, $bb, $44, $e7, $58, $ce, $b1, $9c, $6b, $b8, $57, $28, $c7, $70, $af, $70, $af, $70, $af, $79, $84, $f3, $08, $6f, $90, $d7, $28, $cf, $30, $af, $50, $bf, $40, $bf, $40, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $03, $fd, $07, $fa, $0e, $f5, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $01, $fd, $02, $fb, $04, $f7, $08, $00, $fc, $3d, $c0, $71, $b0, $fd, $40, $c1, $bc, $81, $7c, $3d, $c0, $71, $b0, $ff, $00, $c3, $3c, $b3, $4c, $7f, $80, $ff, $00, $ff, $00, $c3, $3c, $b3, $4c, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $22, $aa, $00, $aa, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $dd, $00, $dd, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $20, $af, $00, $af, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $df, $00, $df, $00, $00, $ff, $3f, $c0, $60, $80, $4f, $80, $5f, $80, $5f, $80, $5c, $80, $5d, $80, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $01, $ff, $01, $fd, $10, $f7, $01, $ed, $03, $fa, $07, $d4, $6f, $fb, $ff, $00, $ff, $00, $fd, $02, $f7, $08, $ed, $12, $fa, $04, $d4, $28, $fb, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $e0, $00, $e7, $00, $e7, $00, $e7, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $70, $00, $27, $00, $27, $00, $27, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $60, $00, $27, $00, $27, $00, $20, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $70, $00, $27, $00, $27, $00, $67, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $60, $00, $20, $00, $3d, $00, $3d, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $3f, $00, $3f, $00, $ff, $00, $f8, $00, $00, $ff, $00, $c0, $1f, $c0, $10, $cf, $17, $cf, $00, $c0, $1f, $c0, $00, $ff, $ff, $00, $ff, $00, $e0, $00, $e0, $00, $e0, $00, $ff, $00, $ff, $00, $ff, $00, $5d, $80, $5d, $00, $dd, $80, $dd, $80, $dd, $80, $5d, $00, $dd, $00, $5d, $80, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $57, $8a, $55, $88, $55, $88, $ee, $66, $ff, $11, $ee, $22, $77, $88, $00, $ff, $9b, $64, $99, $66, $99, $66, $6e, $91, $3b, $80, $2a, $91, $ff, $00, $ff, $00, $70, $af, $50, $8f, $50, $8f, $e8, $67, $f8, $17, $e8, $27, $70, $8f, $00, $ff, $bf, $40, $9f, $60, $9f, $60, $ef, $10, $bf, $00, $af, $10, $ff, $00, $ff, $00, $1c, $eb, $39, $c6, $73, $8d, $e7, $1a, $ce, $b1, $9c, $63, $39, $c6, $73, $ac, $ef, $10, $ce, $21, $9d, $42, $3b, $84, $f3, $08, $e7, $10, $ce, $21, $bc, $42, $fd, $40, $c1, $bc, $81, $7c, $3d, $c0, $71, $b0, $fd, $40, $c1, $bc, $80, $7c, $7f, $80, $ff, $00, $ff, $00, $c3, $3c, $b3, $4c, $7f, $80, $ff, $00, $ff, $00, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $01, $fe, $0f, $f0, $1b, $e6, $0f, $f0, $01, $fe, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $f1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $5a, $e7, $00, $ff, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $00, $ff, $00, $81, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $6f, $ff, $07, $d7, $03, $fb, $01, $ed, $10, $f7, $01, $fd, $01, $ff, $00, $ff, $ff, $00, $d7, $28, $fb, $04, $ed, $12, $f7, $08, $fd, $02, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $e7, $00, $e0, $00, $e7, $00, $e7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $67, $00, $27, $00, $30, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $27, $00, $27, $00, $60, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $27, $00, $27, $00, $70, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $3d, $00, $3d, $00, $3d, $00, $7d, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $f8, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $1f, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $81, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $9c, $00, $9c, $00, $8c, $00, $84, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $8c, $00, $9f, $00, $9f, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $80, $00, $80, $00, $f7, $00, $f7, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9f, $00, $81, $00, $00, $ff, $00, $fc, $0b, $f3, $1e, $ea, $0c, $e4, $18, $d8, $10, $d0, $10, $d0, $ff, $03, $ff, $0f, $fc, $1f, $f1, $3b, $f3, $37, $e7, $7f, $ef, $7f, $ef, $7f, $00, $ff, $20, $5f, $b0, $8f, $18, $07, $08, $07, $14, $13, $14, $13, $34, $33, $ff, $80, $ff, $c0, $7f, $e0, $ff, $f0, $ff, $f0, $ef, $f8, $ef, $f8, $cf, $f8, $00, $ff, $1c, $e3, $1c, $e3, $0a, $f5, $0f, $f0, $07, $f8, $07, $f8, $00, $ff, $ff, $00, $e7, $00, $e7, $00, $e2, $00, $f2, $00, $f0, $00, $f9, $00, $ff, $00, $00, $ff, $ff, $00, $f8, $07, $ff, $00, $b8, $47, $b8, $47, $3f, $c0, $3f, $c0, $ff, $00, $40, $00, $4f, $00, $41, $00, $cf, $00, $cf, $00, $c0, $00, $ff, $00, $00, $ff, $fe, $01, $73, $8c, $73, $8c, $7f, $80, $7f, $80, $f7, $08, $f7, $08, $ff, $00, $83, $00, $9d, $00, $9d, $00, $83, $00, $99, $00, $99, $00, $ff, $00, $00, $ff, $7d, $82, $ff, $00, $7f, $80, $3b, $c4, $df, $20, $7f, $80, $7d, $82, $ff, $00, $86, $00, $1a, $00, $0e, $00, $c2, $00, $22, $00, $86, $00, $ff, $00, $00, $ff, $df, $20, $fb, $04, $fb, $04, $fb, $04, $fb, $04, $df, $20, $df, $20, $ff, $00, $61, $00, $4c, $00, $4c, $00, $4c, $00, $4c, $00, $61, $00, $ff, $00, $00, $ff, $00, $ff, $00, $81, $3a, $81, $22, $99, $2a, $99, $2a, $99, $2a, $99, $ff, $00, $ff, $00, $ff, $00, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $00, $00, $1f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $00, $00, $9c, $00, $81, $00, $9f, $00, $9f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9c, $00, $9c, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $90, $00, $98, $00, $9c, $00, $9c, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9f, $00, $9f, $00, $8c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9c, $00, $9c, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $f7, $00, $f7, $00, $f7, $00, $f7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $c0, $00, $fc, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $e0, $10, $e0, $0b, $f3, $0f, $f0, $0b, $f4, $08, $f7, $1c, $eb, $08, $f7, $ff, $3f, $ff, $3f, $fc, $1f, $ff, $03, $ff, $00, $ff, $00, $f7, $08, $ff, $00, $78, $57, $f8, $a7, $b0, $8f, $e0, $1f, $a1, $5e, $22, $dc, $77, $aa, $2e, $d5, $8f, $d0, $1f, $b0, $7f, $e0, $ff, $80, $fe, $01, $fc, $03, $db, $24, $f7, $08, $00, $ff, $0f, $f0, $1f, $e0, $0f, $f0, $07, $f8, $1b, $e4, $0f, $f0, $0f, $f0, $ff, $00, $f0, $00, $e3, $00, $e1, $00, $f8, $00, $e4, $00, $f0, $00, $ff, $00, $00, $ff, $bb, $44, $fb, $04, $fb, $04, $7b, $84, $fb, $04, $df, $20, $9f, $60, $ff, $00, $cc, $00, $4c, $00, $cc, $00, $4c, $00, $4c, $00, $e1, $00, $ff, $00, $00, $ff, $e7, $18, $e7, $18, $f7, $08, $ff, $00, $ff, $00, $f7, $08, $77, $88, $ff, $00, $99, $00, $99, $00, $89, $00, $91, $00, $99, $00, $99, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $67, $98, $e7, $18, $f7, $08, $ff, $00, $ff, $00, $77, $88, $77, $88, $ff, $00, $99, $00, $99, $00, $89, $00, $91, $00, $99, $00, $99, $00, $ff, $00, $3a, $b9, $ff, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $ff, $00, $c7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $fe, $01, $f9, $02, $f3, $07, $e4, $0e, $e9, $15, $db, $11, $df, $1a, $de, $ff, $00, $fe, $00, $fc, $00, $f8, $00, $f0, $00, $e0, $00, $e0, $00, $e1, $00, $00, $1f, $e0, $e7, $70, $f3, $28, $e9, $5c, $d5, $bf, $ae, $7f, $5e, $ff, $be, $ff, $00, $1f, $00, $0f, $00, $17, $00, $2b, $00, $51, $00, $a1, $00, $41, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $80, $2f, $30, $58, $67, $70, $4f, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c0, $00, $80, $00, $80, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $02, $01, $f7, $0c, $75, $8c, $e5, $1c, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $03, $00, $03, $00, $03, $00, $20, $3f, $1f, $1f, $c0, $00, $7f, $80, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $c0, $00, $e0, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $39, $c6, $7f, $88, $7f, $88, $5e, $98, $3b, $c0, $05, $f8, $03, $fd, $01, $fe, $de, $21, $8c, $42, $9c, $42, $9c, $63, $c2, $3d, $f9, $06, $fd, $02, $fe, $01, $ce, $31, $ff, $42, $ff, $42, $f7, $c6, $de, $00, $29, $c6, $9c, $6b, $ce, $b5, $f7, $08, $63, $10, $e7, $10, $e7, $18, $10, $ef, $ce, $31, $ef, $10, $f7, $08, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f, $40, $3f, $e0, $5f, $70, $af, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80, $7f, $80, $bf, $40, $e7, $5a, $e7, $5a, $a5, $18, $a5, $18, $4a, $31, $94, $63, $39, $d6, $73, $ad, $7b, $84, $7b, $84, $39, $c6, $39, $c6, $73, $8c, $e7, $18, $de, $21, $bd, $42, $38, $d7, $38, $d7, $28, $c7, $28, $c7, $50, $8f, $a0, $1f, $c0, $bf, $80, $7f, $df, $20, $df, $20, $cf, $30, $cf, $30, $9f, $60, $3f, $c0, $ff, $00, $ff, $00, $00, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $ff, $00, $ff, $00, $ff, $00, $df, $00, $d8, $00, $fb, $00, $fb, $00, $f8, $00, $00, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $ff, $00, $ff, $00, $ff, $00, $fd, $00, $0d, $00, $ef, $00, $ef, $00, $af, $00, $0f, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $ff, $00, $ff, $00, $ff, $00, $df, $00, $df, $00, $ff, $00, $ff, $00, $ff, $00, $f8, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $7f, $00, $7f, $00, $7f, $00, $7d, $00, $7d, $00, $7f, $00, $7f, $00, $7f, $00, $0f, $e0, $0f, $e0, $0f, $e0, $2f, $c1, $4f, $a0, $6f, $a0, $2f, $c0, $00, $e0, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $df, $00, $df, $00, $ff, $00, $ff, $00, $f8, $03, $f8, $03, $fa, $a1, $f9, $12, $fb, $02, $fa, $01, $f8, $03, $00, $03, $af, $00, $ef, $00, $4f, $00, $0d, $00, $fd, $00, $ff, $00, $ff, $00, $ff, $00, $1d, $dd, $0b, $ea, $07, $e5, $02, $f3, $01, $f9, $01, $fe, $00, $ff, $00, $ff, $e2, $00, $f5, $00, $fa, $00, $fc, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $7e, $fe, $fd, $3a, $f9, $94, $73, $f9, $e6, $e3, $1d, $07, $fa, $0e, $f5, $81, $00, $03, $00, $07, $00, $0f, $00, $1e, $01, $fd, $02, $fb, $04, $f7, $08, $61, $5e, $63, $5c, $67, $58, $6e, $51, $7c, $43, $79, $46, $72, $4d, $64, $5b, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $c5, $3c, $95, $6c, $25, $dc, $45, $bc, $85, $7c, $05, $fc, $05, $fc, $05, $fc, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $05, $fc, $f9, $f8, $03, $00, $fe, $01, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $03, $00, $07, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $03, $fd, $05, $f8, $0a, $f1, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $01, $fd, $02, $f9, $06, $f3, $0c, $1c, $eb, $39, $c6, $73, $8c, $e7, $5a, $ce, $b5, $9c, $6b, $29, $c6, $52, $8c, $ef, $10, $ce, $21, $9c, $42, $7b, $84, $f7, $08, $ef, $10, $ce, $31, $9c, $63, $e7, $5a, $ce, $31, $9c, $63, $38, $d7, $70, $af, $e0, $5f, $40, $3f, $80, $7f, $7b, $84, $73, $08, $e7, $10, $df, $20, $bf, $40, $7f, $80, $7f, $80, $ff, $00, $7f, $80, $df, $1f, $a8, $2f, $c3, $54, $eb, $6c, $c7, $78, $df, $60, $df, $60, $ff, $00, $e0, $00, $d0, $00, $a8, $00, $90, $00, $80, $00, $80, $00, $80, $00, $ff, $00, $ff, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0f, $e2, $0f, $e4, $0f, $e0, $2f, $c1, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $fc, $00, $f9, $00, $fa, $00, $f8, $00, $df, $00, $df, $00, $ff, $00, $fe, $00, $f8, $03, $f8, $03, $fa, $a1, $f9, $12, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $af, $00, $ef, $00, $4f, $00, $0d, $00, $fd, $00, $ff, $00, $7f, $00, $3f, $00, $0f, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $fe, $00, $ff, $00, $ff, $00, $df, $00, $d8, $00, $fb, $00, $fb, $00, $f8, $00, $f8, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $3f, $00, $7f, $00, $ff, $00, $fd, $00, $0d, $00, $ef, $00, $ef, $00, $af, $00, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $81, $00, $bd, $24, $81, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $00, $ff, $24, $c3, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $2a, $99, $3f, $80, $20, $80, $30, $80, $38, $80, $0c, $80, $06, $f8, $03, $fc, $c7, $00, $df, $00, $ff, $1f, $ff, $1f, $df, $0f, $ff, $07, $ff, $03, $ff, $00, $2a, $99, $ea, $19, $fe, $e1, $3f, $3c, $0f, $0f, $01, $01, $00, $00, $80, $00, $c7, $00, $e7, $00, $1f, $e0, $c3, $fc, $f0, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $2a, $99, $2a, $99, $2a, $99, $a2, $19, $fa, $81, $f8, $c1, $7e, $21, $9f, $10, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $67, $80, $3f, $c0, $e7, $80, $91, $60, $e0, $00, $79, $80, $1f, $e0, $07, $f8, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $7f, $ff, $1e, $ff, $06, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $8f, $0c, $07, $07, $81, $01, $f0, $00, $ff, $00, $1f, $e0, $03, $fc, $06, $f8, $8c, $70, $07, $f8, $01, $fe, $00, $ff, $e0, $1f, $ff, $00, $ff, $00, $ff, $03, $80, $7f, $c0, $3f, $a0, $9f, $7f, $00, $fc, $03, $dd, $1a, $bc, $3b, $02, $01, $ff, $00, $7f, $00, $bf, $40, $3f, $c0, $7f, $99, $e6, $7a, $c7, $f9, $ff, $fc, $2a, $99, $2a, $99, $2a, $99, $23, $98, $3f, $81, $1f, $83, $7e, $84, $f9, $08, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $c6, $01, $fc, $03, $e7, $01, $89, $06, $2a, $99, $2f, $98, $3f, $87, $fc, $3c, $f0, $f0, $80, $80, $00, $00, $01, $00, $c7, $00, $c7, $00, $f8, $07, $c3, $3f, $0f, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $2a, $99, $fa, $01, $06, $01, $0e, $01, $1a, $01, $30, $01, $60, $1f, $c0, $3f, $c7, $00, $ff, $00, $ff, $f8, $ff, $f8, $ff, $f0, $ff, $e0, $ff, $c0, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $02, $01, $fd, $00, $fb, $e0, $17, $e0, $f7, $00, $f6, $00, $ee, $01, $ef, $00, $cf, $00, $ff, $07, $1f, $0c, $1f, $08, $3f, $18, $3f, $18, $7e, $38, $fe, $38, $fe, $30, $ff, $00, $ff, $00, $bf, $40, $ff, $80, $ef, $00, $ff, $00, $ff, $00, $db, $24, $ff, $80, $ff, $00, $9f, $00, $37, $00, $37, $00, $3f, $00, $3f, $00, $1b, $00, $ff, $02, $fb, $02, $f9, $01, $fc, $00, $fe, $00, $07, $f8, $ff, $fc, $ff, $00, $04, $02, $0c, $06, $0e, $07, $0f, $07, $0f, $07, $07, $03, $03, $01, $ff, $00, $ce, $01, $ce, $00, $cf, $00, $cf, $00, $c3, $00, $c0, $00, $e0, $00, $f0, $00, $fe, $70, $ff, $70, $ff, $70, $ff, $70, $ff, $7e, $ff, $7f, $ff, $7f, $ff, $7f, $e7, $1c, $fb, $00, $77, $88, $5e, $60, $fb, $02, $07, $07, $08, $08, $00, $00, $03, $00, $07, $00, $07, $00, $9f, $03, $fc, $1e, $f8, $ff, $f7, $ff, $ff, $ff
ELIF DEF(STAR)
Data_fe1da: ; fe1da
	db $79, $5d, $08, $00, $0b, $8c, $d0, $f4, $60, $00, $00, $00, $00, $00, $00, $00

Data_fe1ea: ; fe1ea
	db $79, $52, $08, $00, $0b, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0

Data_fe1fa: ; fe1fa
	db $79, $47, $08, $00, $0b, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28

Data_fe20a: ; fe20a
	db $79, $3c, $08, $00, $0b, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9

Data_fe21a: ; fe21a
	db $79, $31, $08, $00, $0b, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e

Data_fe22a: ; fe22a
	db $79, $26, $08, $00, $0b, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0

Data_fe23a: ; fe23a
	db $79, $1b, $08, $00, $0b, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0

Data_fe24a: ; fe24a
	db $79, $10, $08, $00, $0b, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe2b4: ; fe2b4
	db $df, $6f, $7f, $3f, $da, $01, $00, $00, $df, $6f, $b0, $2a, $09, $02, $00, $00, $df, $6f, $18, $7b, $d0, $70, $00, $00, $df, $6f, $5f, $57, $3f, $46, $00, $00, $01, $ea, $4f, $e0, $03, $60, $02, $20, $01, $3f, $01, $1f, $00, $0b, $00, $00, $09, $ea, $4f, $00, $7c, $00, $5c, $00, $28, $3f, $05, $39, $3a, $dd, $4e, $00, $11, $ff, $7f, $da, $5a, $94, $31, $bf, $14, $e0, $01, $bf, $02, $00, $00, $00, $19, $38, $6b, $50, $56, $88, $3d, $a0, $28, $48, $00, $39, $3a, $dd, $4e, $00, $21, $02, $03, $09, $01, $01, $05, $05, $02, $06, $07, $07, $0e, $0e, $00, $00, $29, $02, $af, $42, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $31, $27, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $39, $00, $00, $28, $00, $00, $00, $00, $00, $00, $00, $55, $55, $55, $55, $55, $41, $01, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $49, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe374: ; fe374
	db $51, $00, $00, $01, $00, $02, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe384: ; fe384
	db $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $61, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $69, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $79, $00, $80, $7e, $0b, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $81, $00, $80, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $89, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $91, $00, $80, $7f, $00, $88, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe404: ; fe404
	db $99, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe414: ; fe414
	db $a1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $a9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $b1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe444: ; fe444
	db $b9, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe454: ; fe454
	db $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $c1, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_fe474: ; fe474
	db $40, $10, $41, $10, $04, $10, $05, $10, $0a, $10, $0b, $10, $0c, $10, $0d, $10, $0e, $10, $0f, $10, $20, $10, $62, $10, $62, $10, $09, $10, $09, $50, $09, $10, $09, $50, $09, $10, $09, $50, $62, $10, $62, $10, $21, $10, $22, $10, $23, $10, $24, $10, $25, $10, $26, $10, $27, $10, $05, $50, $04, $50, $41, $50, $40, $50, $50, $10, $51, $10, $14, $10, $15, $10, $1a, $10, $1b, $10, $1c, $10, $1d, $10, $1e, $10, $1f, $10, $30, $10, $62, $10, $62, $10, $19, $10, $19, $50, $19, $10, $19, $50, $19, $10, $19, $50, $62, $10, $62, $10, $31, $10, $32, $10, $33, $10, $34, $10, $35, $10, $36, $10, $37, $10, $15, $50, $14, $50, $51, $50, $50, $50, $62, $10, $02, $10, $03, $10, $62, $10, $06, $90, $06, $90, $06, $90, $06, $90, $06, $90, $06, $90, $07, $90, $3a, $10, $3b, $10, $3c, $10, $3d, $10, $2a, $10, $2b, $10, $2c, $10, $2d, $10, $2e, $10, $3e, $10, $07, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $06, $d0, $62, $10, $03, $50, $02, $50, $62, $10, $62, $10, $12, $10, $13, $10, $62, $10, $62, $10, $62, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $62, $10, $62, $10, $62, $10, $13, $50, $12, $50, $62, $10, $62, $10, $42, $10, $43, $10, $62, $10, $62, $10, $08, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $3f, $10, $08, $50, $62, $10, $62, $10, $43, $50, $42, $50, $62, $10, $62, $10, $52, $10, $53, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $53, $50, $52, $50, $62, $10, $62, $10, $44, $10, $54, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $54, $50, $44, $50, $62, $10, $62, $10, $45, $10, $46, $10, $47, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $47, $50, $46, $50, $45, $50, $62, $10, $28, $10, $29, $10, $5f, $10, $16, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $16, $50, $5f, $50, $29, $50, $28, $50, $38, $10, $39, $10, $48, $10, $49, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $49, $50, $48, $50, $39, $50, $38, $50, $55, $10, $56, $10, $57, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $57, $50, $56, $50, $55, $50, $5e, $10, $5f, $10, $4a, $10, $4b, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4f, $d0, $4e, $d0, $5f, $50, $5e, $50, $5e, $10, $5f, $10, $5a, $10, $5b, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $5d, $d0, $5c, $d0, $5f, $50, $5e, $50, $5e, $10, $5f, $10, $4c, $10, $4d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4d, $d0, $4c, $d0, $5f, $50, $5e, $50, $5e, $90, $5f, $90, $4c, $10, $4d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4d, $d0, $4c, $d0, $5f, $d0, $5e, $d0, $5e, $90, $5f, $90, $5c, $10, $5d, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $5b, $d0, $5a, $d0, $5f, $d0, $5e, $d0, $5e, $90, $5f, $90, $4e, $10, $4f, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $4b, $d0, $4a, $d0, $5f, $d0, $5e, $d0, $55, $90, $56, $90, $57, $90, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $57, $d0, $56, $d0, $55, $d0, $38, $90, $39, $90, $48, $90, $49, $90, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $49, $d0, $48, $d0, $39, $d0, $38, $d0, $28, $90, $29, $90, $5f, $10, $16, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $16, $50, $5f, $50, $29, $d0, $28, $d0, $62, $10, $45, $90, $46, $90, $47, $90, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $47, $d0, $46, $d0, $45, $d0, $62, $10, $62, $10, $42, $10, $43, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $43, $50, $42, $50, $62, $10, $62, $10, $52, $10, $53, $10, $62, $10, $10, $10, $11, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $10, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $00, $50, $11, $50, $10, $50, $62, $10, $53, $50, $52, $50, $62, $10, $62, $10, $44, $10, $54, $10, $62, $10, $62, $10, $08, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $3f, $90, $08, $d0, $62, $10, $62, $10, $54, $50, $44, $50, $62, $10, $62, $10, $12, $90, $13, $90, $62, $10, $62, $10, $62, $10, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $63, $14, $64, $14, $65, $14, $66, $14, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $2f, $90, $62, $10, $62, $10, $62, $10, $13, $d0, $12, $d0, $62, $10, $62, $10, $02, $90, $03, $90, $62, $10, $06, $10, $06, $10, $06, $10, $06, $10, $07, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $67, $14, $68, $14, $68, $54, $67, $54, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $06, $50, $06, $50, $06, $50, $06, $50, $62, $10, $03, $d0, $02, $d0, $62, $10, $50, $90, $51, $90, $14, $90, $15, $90, $60, $10, $60, $10, $60, $10, $60, $10, $01, $50, $17, $10, $61, $10, $17, $50, $58, $10, $59, $10, $69, $14, $6a, $14, $6a, $54, $69, $54, $59, $10, $58, $50, $17, $10, $18, $10, $17, $50, $01, $10, $60, $50, $60, $50, $60, $50, $60, $50, $15, $d0, $14, $d0, $51, $d0, $50, $d0, $40, $90, $41, $90, $04, $90, $05, $90, $60, $90, $60, $90, $60, $90, $60, $90, $01, $d0, $17, $90, $18, $90, $17, $d0, $58, $90, $59, $90, $6b, $14, $6c, $14, $6c, $54, $6b, $54, $59, $90, $58, $d0, $17, $90, $61, $90, $17, $d0, $01, $90, $60, $d0, $60, $d0, $60, $d0, $60, $d0, $05, $d0, $04, $d0, $41, $d0, $40, $d0, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $62, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $7f, $f7, $5e, $31, $46, $4a, $29, $00, $00, $27, $02, $ff, $03, $9f, $02, $d9, $01, $00, $7c, $3d, $53, $7b, $36, $93, $21, $ea, $14, $ff, $7f, $00, $00, $ff, $7f, $f7, $5e, $31, $46, $4a, $29, $00, $00, $27, $02, $ff, $03, $3f, $03, $9f, $02, $1b, $02, $1f, $3e, $1f, $00, $12, $00, $00, $03, $e0, $2b, $00, $00, $1f, $00, $bf, $01, $ff, $03, $ed, $03, $e0, $03, $e0, $37, $e0, $7f, $a0, $7d, $00, $7c, $0d, $7c, $1f, $7c, $1f, $34, $29, $25, $52, $4a, $ff, $7f

Data_fecd4: ; fecd4
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $1c, $eb, $39, $d6, $2b, $c5, $72, $ac, $77, $aa, $77, $aa, $77, $aa, $77, $aa, $ef, $10, $d6, $29, $cd, $32, $ac, $53, $ba, $45, $bb, $44, $bb, $44, $bb, $44, $e7, $58, $ce, $b1, $9c, $6b, $b8, $57, $28, $c7, $70, $af, $70, $af, $70, $af, $79, $84, $f3, $08, $6f, $90, $d7, $28, $cf, $30, $af, $50, $bf, $40, $bf, $40, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $03, $fd, $07, $fa, $0e, $f5, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $01, $fd, $02, $fb, $04, $f7, $08, $00, $fc, $3d, $c0, $71, $b0, $fd, $40, $c1, $bc, $81, $7c, $3d, $c0, $71, $b0, $ff, $00, $c3, $3c, $b3, $4c, $7f, $80, $ff, $00, $ff, $00, $c3, $3c, $b3, $4c, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $22, $aa, $00, $aa, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $dd, $00, $dd, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $20, $af, $00, $af, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $df, $00, $df, $00, $00, $ff, $3f, $c0, $60, $80, $4f, $80, $5f, $80, $5f, $80, $5c, $80, $5d, $80, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $01, $ff, $03, $fe, $00, $f8, $00, $ff, $7b, $4f, $37, $bc, $07, $d1, $ff, $00, $ff, $00, $fe, $00, $f8, $07, $ff, $00, $4f, $80, $bc, $40, $d1, $28, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $e0, $00, $e7, $00, $e7, $00, $e7, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $70, $00, $27, $00, $27, $00, $27, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $60, $00, $27, $00, $27, $00, $20, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $70, $00, $27, $00, $27, $00, $67, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $60, $00, $20, $00, $3d, $00, $3d, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $3f, $00, $3f, $00, $ff, $00, $f8, $00, $00, $ff, $00, $c0, $1f, $c0, $10, $cf, $17, $cf, $00, $c0, $1f, $c0, $00, $ff, $ff, $00, $ff, $00, $e0, $00, $e0, $00, $e0, $00, $ff, $00, $ff, $00, $ff, $00, $5d, $80, $5d, $00, $dd, $80, $dd, $80, $dd, $80, $5d, $00, $dd, $00, $5d, $80, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $57, $8a, $55, $88, $55, $88, $ee, $66, $ff, $11, $ee, $22, $77, $88, $00, $ff, $9b, $64, $99, $66, $99, $66, $6e, $91, $3b, $80, $2a, $91, $ff, $00, $ff, $00, $70, $af, $50, $8f, $50, $8f, $e8, $67, $f8, $17, $e8, $27, $70, $8f, $00, $ff, $bf, $40, $9f, $60, $9f, $60, $ef, $10, $bf, $00, $af, $10, $ff, $00, $ff, $00, $1c, $eb, $39, $c6, $73, $8d, $e7, $1a, $ce, $b1, $9c, $63, $39, $c6, $73, $ac, $ef, $10, $ce, $21, $9d, $42, $3b, $84, $f3, $08, $e7, $10, $ce, $21, $bc, $42, $fd, $40, $c1, $bc, $81, $7c, $3d, $c0, $71, $b0, $fd, $40, $c1, $bc, $80, $7c, $7f, $80, $ff, $00, $ff, $00, $c3, $3c, $b3, $4c, $7f, $80, $ff, $00, $ff, $00, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $38, $d7, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $df, $20, $01, $fe, $0f, $f0, $1b, $e6, $0f, $f0, $01, $fe, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $f1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $5a, $e7, $00, $ff, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $00, $ff, $00, $81, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $0f, $fb, $0f, $ff, $07, $f7, $13, $fb, $39, $dd, $18, $cb, $20, $e7, $00, $ff, $fb, $00, $ff, $00, $f7, $08, $fb, $04, $dd, $22, $cb, $24, $e7, $18, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $e7, $00, $e0, $00, $e7, $00, $e7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $67, $00, $27, $00, $30, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $27, $00, $27, $00, $60, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $27, $00, $27, $00, $27, $00, $70, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $3d, $00, $3d, $00, $3d, $00, $7d, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $f8, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $1f, $00, $00, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $81, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $9c, $00, $9c, $00, $8c, $00, $84, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $8c, $00, $9f, $00, $9f, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9c, $00, $9c, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $80, $00, $80, $00, $f7, $00, $f7, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c1, $00, $9c, $00, $9f, $00, $81, $00, $00, $ff, $00, $fc, $0b, $f3, $1e, $ea, $0c, $e4, $18, $d8, $10, $d0, $10, $d0, $ff, $03, $ff, $0f, $fc, $1f, $f1, $3b, $f3, $37, $e7, $7f, $ef, $7f, $ef, $7f, $00, $ff, $20, $5f, $b0, $8f, $18, $07, $08, $07, $14, $13, $14, $13, $34, $33, $ff, $80, $ff, $c0, $7f, $e0, $ff, $f0, $ff, $f0, $ef, $f8, $ef, $f8, $cf, $f8, $00, $ff, $1c, $e3, $1c, $e3, $0a, $f5, $0f, $f0, $07, $f8, $07, $f8, $00, $ff, $ff, $00, $e7, $00, $e7, $00, $e2, $00, $f2, $00, $f0, $00, $f9, $00, $ff, $00, $00, $ff, $ff, $00, $f8, $07, $ff, $00, $b8, $47, $b8, $47, $3f, $c0, $3f, $c0, $ff, $00, $40, $00, $4f, $00, $41, $00, $cf, $00, $cf, $00, $c0, $00, $ff, $00, $00, $ff, $fe, $01, $73, $8c, $73, $8c, $7f, $80, $7f, $80, $f7, $08, $f7, $08, $ff, $00, $83, $00, $9d, $00, $9d, $00, $83, $00, $99, $00, $99, $00, $ff, $00, $00, $ff, $7d, $82, $ff, $00, $7f, $80, $3b, $c4, $df, $20, $7f, $80, $7d, $82, $ff, $00, $86, $00, $1a, $00, $0e, $00, $c2, $00, $22, $00, $86, $00, $ff, $00, $00, $ff, $df, $20, $fb, $04, $fb, $04, $fb, $04, $fb, $04, $df, $20, $df, $20, $ff, $00, $61, $00, $4c, $00, $4c, $00, $4c, $00, $4c, $00, $61, $00, $ff, $00, $00, $ff, $00, $ff, $00, $81, $3a, $81, $22, $99, $2a, $99, $2a, $99, $2a, $99, $ff, $00, $ff, $00, $ff, $00, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $00, $00, $1f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $7f, $00, $00, $00, $9c, $00, $81, $00, $9f, $00, $9f, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9c, $00, $9c, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $90, $00, $98, $00, $9c, $00, $9c, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9f, $00, $9f, $00, $8c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $9c, $00, $9c, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $f7, $00, $f7, $00, $f7, $00, $f7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $c0, $00, $fc, $00, $9c, $00, $c1, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $e0, $10, $e0, $0b, $f3, $0f, $f0, $0b, $f4, $08, $f7, $1c, $eb, $08, $f7, $ff, $3f, $ff, $3f, $fc, $1f, $ff, $03, $ff, $00, $ff, $00, $f7, $08, $ff, $00, $78, $57, $f8, $a7, $b0, $8f, $e0, $1f, $a1, $5e, $22, $dc, $77, $aa, $2e, $d5, $8f, $d0, $1f, $b0, $7f, $e0, $ff, $80, $fe, $01, $fc, $03, $db, $24, $f7, $08, $00, $ff, $7d, $82, $fe, $01, $7e, $81, $3a, $c5, $de, $21, $7e, $81, $7c, $83, $ff, $00, $86, $00, $1b, $00, $0f, $00, $c3, $00, $23, $00, $87, $00, $ff, $00, $00, $ff, $fd, $02, $7f, $80, $73, $8c, $73, $8c, $73, $8c, $73, $8c, $73, $8c, $ff, $00, $06, $00, $9c, $00, $9c, $00, $9c, $00, $9c, $00, $9c, $00, $ff, $00, $00, $ff, $f7, $08, $9e, $61, $9e, $61, $ff, $00, $9f, $60, $9f, $60, $9f, $60, $ff, $00, $18, $00, $e9, $00, $e9, $00, $08, $00, $e9, $00, $e9, $00, $ff, $00, $00, $ff, $e0, $1f, $30, $cf, $30, $cf, $f0, $0f, $70, $8f, $70, $8f, $70, $8f, $ff, $00, $3f, $00, $df, $00, $df, $00, $3f, $00, $9f, $00, $9f, $00, $ff, $00, $00, $ff, $67, $98, $e7, $18, $f7, $08, $ff, $00, $ff, $00, $77, $88, $77, $88, $ff, $00, $99, $00, $99, $00, $89, $00, $91, $00, $99, $00, $99, $00, $ff, $00, $3a, $b9, $ff, $00, $00, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $ff, $00, $c7, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $fe, $01, $f9, $02, $f3, $07, $e4, $0e, $e9, $15, $db, $11, $df, $1a, $de, $ff, $00, $fe, $00, $fc, $00, $f8, $00, $f0, $00, $e0, $00, $e0, $00, $e1, $00, $00, $1f, $e0, $e7, $70, $f3, $28, $e9, $5c, $d5, $bf, $ae, $7f, $5e, $ff, $be, $ff, $00, $1f, $00, $0f, $00, $17, $00, $2b, $00, $51, $00, $a1, $00, $41, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $80, $2f, $30, $58, $67, $70, $4f, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $c0, $00, $80, $00, $80, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $02, $01, $f7, $0c, $75, $8c, $e5, $1c, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $03, $00, $03, $00, $03, $00, $20, $3f, $1f, $1f, $c0, $00, $7f, $80, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $c0, $00, $e0, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $39, $c6, $7f, $88, $7f, $88, $5e, $98, $3b, $c0, $05, $f8, $03, $fd, $01, $fe, $de, $21, $8c, $42, $9c, $42, $9c, $63, $c2, $3d, $f9, $06, $fd, $02, $fe, $01, $ce, $31, $ff, $42, $ff, $42, $f7, $c6, $de, $00, $29, $c6, $9c, $6b, $ce, $b5, $f7, $08, $63, $10, $e7, $10, $e7, $18, $10, $ef, $ce, $31, $ef, $10, $f7, $08, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $80, $7f, $40, $3f, $e0, $5f, $70, $af, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $7f, $80, $7f, $80, $bf, $40, $e7, $5a, $e7, $5a, $a5, $18, $a5, $18, $4a, $31, $94, $63, $39, $d6, $73, $ad, $7b, $84, $7b, $84, $39, $c6, $39, $c6, $73, $8c, $e7, $18, $de, $21, $bd, $42, $38, $d7, $38, $d7, $28, $c7, $28, $c7, $50, $8f, $a0, $1f, $c0, $bf, $80, $7f, $df, $20, $df, $20, $cf, $30, $cf, $30, $9f, $60, $3f, $c0, $ff, $00, $ff, $00, $00, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $ff, $00, $ff, $00, $ff, $00, $df, $00, $d8, $00, $fb, $00, $fb, $00, $f8, $00, $00, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $ff, $00, $ff, $00, $ff, $00, $fd, $00, $0d, $00, $ef, $00, $ef, $00, $af, $00, $0f, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $ff, $00, $ff, $00, $ff, $00, $df, $00, $df, $00, $ff, $00, $ff, $00, $ff, $00, $f8, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $7f, $00, $7f, $00, $7f, $00, $7d, $00, $7d, $00, $7f, $00, $7f, $00, $7f, $00, $0f, $e0, $0f, $e0, $0f, $e0, $2f, $c1, $4f, $a0, $6f, $a0, $2f, $c0, $00, $e0, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $df, $00, $df, $00, $ff, $00, $ff, $00, $f8, $03, $f8, $03, $fa, $a1, $f9, $12, $fb, $02, $fa, $01, $f8, $03, $00, $03, $af, $00, $ef, $00, $4f, $00, $0d, $00, $fd, $00, $ff, $00, $ff, $00, $ff, $00, $1d, $dd, $0b, $ea, $07, $e5, $02, $f3, $01, $f9, $01, $fe, $00, $ff, $00, $ff, $e2, $00, $f5, $00, $fa, $00, $fc, $00, $fe, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $7e, $fe, $fd, $3a, $f9, $94, $73, $f9, $e6, $e3, $1d, $07, $fa, $0e, $f5, $81, $00, $03, $00, $07, $00, $0f, $00, $1e, $01, $fd, $02, $fb, $04, $f7, $08, $61, $5e, $63, $5c, $67, $58, $6e, $51, $7c, $43, $79, $46, $72, $4d, $64, $5b, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $80, $00, $c5, $3c, $95, $6c, $25, $dc, $45, $bc, $85, $7c, $05, $fc, $05, $fc, $05, $fc, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $05, $fc, $f9, $f8, $03, $00, $fe, $01, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $03, $00, $07, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fe, $03, $fd, $05, $f8, $0a, $f1, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $fe, $01, $fd, $02, $f9, $06, $f3, $0c, $1c, $eb, $39, $c6, $73, $8c, $e7, $5a, $ce, $b5, $9c, $6b, $29, $c6, $52, $8c, $ef, $10, $ce, $21, $9c, $42, $7b, $84, $f7, $08, $ef, $10, $ce, $31, $9c, $63, $e7, $5a, $ce, $31, $9c, $63, $38, $d7, $70, $af, $e0, $5f, $40, $3f, $80, $7f, $7b, $84, $73, $08, $e7, $10, $df, $20, $bf, $40, $7f, $80, $7f, $80, $ff, $00, $7f, $80, $df, $1f, $a8, $2f, $c3, $54, $eb, $6c, $c7, $78, $df, $60, $df, $60, $ff, $00, $e0, $00, $d0, $00, $a8, $00, $90, $00, $80, $00, $80, $00, $80, $00, $ff, $00, $ff, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0f, $e2, $0f, $e4, $0f, $e0, $2f, $c1, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $fc, $00, $f9, $00, $fa, $00, $f8, $00, $df, $00, $df, $00, $ff, $00, $fe, $00, $f8, $03, $f8, $03, $fa, $a1, $f9, $12, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $af, $00, $ef, $00, $4f, $00, $0d, $00, $fd, $00, $ff, $00, $7f, $00, $3f, $00, $0f, $e0, $0f, $e0, $2f, $c0, $4f, $a0, $6f, $a0, $2f, $c0, $0f, $e0, $0f, $e0, $fe, $00, $ff, $00, $ff, $00, $df, $00, $d8, $00, $fb, $00, $fb, $00, $f8, $00, $f8, $03, $f8, $03, $fa, $01, $f9, $02, $fb, $02, $fa, $01, $f8, $03, $f8, $03, $3f, $00, $7f, $00, $ff, $00, $fd, $00, $0d, $00, $ef, $00, $ef, $00, $af, $00, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $1c, $eb, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $ef, $10, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $e7, $5a, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $7b, $84, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $81, $00, $bd, $24, $81, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $00, $ff, $24, $c3, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $2a, $99, $2a, $99, $2a, $99, $22, $99, $3f, $80, $19, $82, $23, $de, $23, $de, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $fe, $02, $fe, $0e, $fe, $0e, $2f, $98, $2b, $92, $2a, $93, $ff, $00, $00, $ff, $d0, $ff, $d0, $fe, $c1, $fd, $c7, $00, $cc, $00, $cc, $00, $ff, $00, $ff, $7f, $ff, $fe, $fe, $fd, $ff, $f0, $ea, $19, $da, $49, $5a, $c9, $ff, $00, $00, $ff, $0b, $ff, $0b, $7f, $83, $bf, $e7, $00, $37, $00, $37, $00, $ff, $00, $ff, $fe, $ff, $7f, $7f, $bf, $ff, $0f, $2a, $99, $2a, $99, $2a, $99, $22, $99, $fa, $01, $98, $41, $c4, $7b, $c4, $7b, $c7, $00, $c7, $00, $c7, $00, $c7, $00, $e7, $00, $7f, $40, $7f, $70, $7f, $70, $23, $de, $21, $d9, $2d, $ce, $31, $de, $31, $df, $39, $d9, $23, $c4, $2b, $d2, $fe, $0e, $fe, $08, $f0, $00, $e0, $00, $e0, $00, $e6, $00, $f8, $06, $e2, $1c, $8f, $86, $83, $f2, $0b, $fb, $36, $f2, $14, $14, $81, $0e, $f1, $01, $9f, $77, $76, $08, $0a, $04, $07, $00, $0a, $05, $ed, $02, $00, $ff, $71, $0e, $8f, $00, $eb, $12, $eb, $d2, $2a, $d1, $ea, $11, $eb, $10, $eb, $10, $eb, $10, $ea, $11, $e3, $1c, $23, $1c, $22, $1c, $22, $1c, $22, $1c, $22, $1c, $22, $1c, $22, $1c, $7f, $8b, $d5, $29, $ff, $05, $fb, $05, $ff, $01, $ef, $01, $ef, $01, $d6, $2c, $07, $00, $15, $02, $2b, $00, $3b, $00, $3b, $00, $3b, $10, $3b, $10, $12, $01, $eb, $12, $eb, $12, $eb, $12, $eb, $12, $eb, $12, $2b, $d2, $eb, $d2, $eb, $12, $23, $1c, $23, $1c, $22, $1c, $22, $1c, $22, $1c, $22, $1c, $22, $1c, $e2, $1c, $fc, $00, $77, $88, $fb, $01, $f7, $04, $ff, $7f, $e7, $68, $dc, $40, $f3, $43, $04, $03, $05, $02, $8a, $04, $75, $0a, $7f, $00, $67, $18, $58, $27, $43, $3c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ENDC

REPT $1c0
	db $00
ENDR

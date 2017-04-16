InitAllocatableMemoryBlocks:: ; 17a67 (5:7a67)
	write_hl_to wMemoryAllocationPointer
	read_hl_from wMemoryAllocationPointer
	ld c, l
	ld b, h
	ld a, $55
	ld [bc], a
	ld hl, -5
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, sAllocatableBlock1
	ld [hl], e
	inc hl
	ld [hl], d
	ld bc, sAllocatableBlock1
	ld a, $55
	ld [bc], a
	ld l, c
	ld h, b
	inc hl
	ld de, $1ffd
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wMemoryAllocationMode], a
	ld hl, $0
	write_hl_to wMemoryAllocationNumBlocks
	ret

SetAllocationMode: ; 17ab6 (5:7ab6)
	ld [wMemoryAllocationMode], a
	ret

AllocateMemory:: ; 17aba (5:7aba)
	push hl
	push bc
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, .okay
	ld hl, $0
	jp .done

.okay
	; round size up to nearest 16
	call GetHLAtSPPlus4
	ld de, $f
	add hl, de
	ld de, $10
	call DivideHLByDESigned
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	call WriteHLToSPPlus4
	read_hl_from wMemoryAllocationPointer
	pop de
	push hl
.loop
	pop hl
	push hl
	ld a, l
	or h
	jp z, .crash
	ld a, [wMemoryAllocationMode]
	cp $1
	jp nz, .okay2
	pop hl
	push hl
	ld a, l
	sub $c000 % $100
	ld a, h
	sbc $c000 / $100
	jp nc, .okay2
	jp .next

.okay2
	ld a, [wMemoryAllocationMode]
	cp $2
	jp nz, .okay_3
	pop hl
	push hl
	ld a, l
	sub $c000 % $100
	ld a, h
	sbc $c000 / $100
	jp c, .okay_3
	jp .next

.okay_3
	pop hl
	push hl
	ld a, [hl]
	cp $55
	jp nz, .next
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp c, .next
	pop hl
	push hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	ld de, $a
	add hl, de
	call CompareHLtoBC
	jp nc, .set_aa
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc h
	ld h, a
	ld de, -5
	add hl, de
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld [hl], $aa
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus6
	push hl
	call GetHLAtSPPlus6
	pop de
	add hl, de
	ld de, $5
	add hl, de
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld [hl], $55
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	jp .finish

.set_aa
	pop hl
	push hl
	ld [hl], $aa
.finish
	read_hl_from wMemoryAllocationNumBlocks
	inc hl
	write_hl_to wMemoryAllocationNumBlocks
	pop hl
	push hl
	ld de, $5
	add hl, de
	jp .done

.next
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	jp .loop

.crash
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	call FillVisibleAreaWithBlankTile
	ld e, $1
	xor a
	call SetStringStartState
	ld hl, Data_17c44
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
.crash_wait
	call CheckButton
	or a
	jp z, .crash_wait
	set_farcall_addrs_hli Func_bf431
	ld hl, -1
	call FarCall
	set_farcall_addrs_hli Func_bf431
	call GetHLAtSPPlus4
	call FarCall
	jp @ - 1 ; better luck next time

.done
	pop bc
	pop bc
	ret

Data_17c44: ; 17c44
	db "ケﾞットハﾞッファー ヌル エラー$" ; GET BUFFER FULL ERROR

Func_17c56: ; 17c56
	ret

FreeMemory:: ; 17c57 (5:7c57)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, Func_17d77
	read_hl_from wMemoryAllocationNumBlocks
	dec hl
	write_hl_to wMemoryAllocationNumBlocks
	call GetHLAtSPPlus6
	ld de, hPushOAM + 6
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld a, [hl]
	cp $aa
	jp nz, Func_17d77
	call GetHLAtSPPlus4
	ld [hl], $55
	read_hl_from wMemoryAllocationPointer
	ld c, l
	ld b, h
Func_17c8c: ; 17c8c (5:7c8c)
	ld a, c
	or b
	jp z, Func_17cc9
	push bc
	call GetHLAtSPPlus6
	call WriteHLToSPPlus4
	call GetHLAtSPPlus6
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	pop hl
	push hl
	ld e, c
	ld d, b
	call CompareHLtoDE
	jp nz, Func_17cbe
	jp Func_17cc9

Func_17cbe: ; 17cbe (5:7cbe)
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp Func_17c8c

Func_17cc9: ; 17cc9 (5:7cc9)
	ld a, c
	or b
	jp z, Func_17cfc
	ld a, [bc]
	cp $55
	jp nz, Func_17cfc
	push bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	inc hl
	inc hl
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5
	add hl, de
	push hl
	call GetHLAtSPPlus6
	inc hl
	pop de
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_17cfc: ; 17cfc (5:7cfc)
	read_hl_from wMemoryAllocationPointer
	ld c, l
	ld b, h
Func_17d03: ; 17d03 (5:7d03)
	ld a, c
	or b
	jp z, Func_17d42
	push bc
	ld l, c
	ld h, b
	call WriteHLToSPPlus4
	ld l, c
	ld h, b
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $5
	add hl, de
	call WriteHLToSPPlus4
	pop bc
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus4
	pop de
	call CompareHLtoDE
	jp nz, Func_17d37
	jp Func_17d42

Func_17d37: ; 17d37 (5:7d37)
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp Func_17d03

Func_17d42: ; 17d42 (5:7d42)
	ld a, c
	or b
	jp z, Func_17d77
	ld a, [bc]
	cp $55
	jp nz, Func_17d77
	call GetHLAtSPPlus4
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5
	add hl, de
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_17d77: ; 17d77 (5:7d77)
	pop bc
	pop bc
	pop bc
	ret

Func_17d7b: ; 17d7b
	push bc
	push bc
	push bc
	push bc
	read_hl_from wMemoryAllocationPointer
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus6
	ld bc, $0
	ld l, c
	ld h, b
	call WriteHLToSPPlus4
	ld hl, $0
	pop de
	push hl
Func_17d9a: ; 17d9a (5:7d9a)
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, Func_17e0c
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $55
	jp nz, Func_17df5
	call GetHLAtSPPlus8
	ld a, l
	sub $0
	ld a, h
	sbc $c0
	jp c, Func_17dca
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	pop bc
	jp Func_17dd5

Func_17dca: ; 17dca (5:7dca)
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
Func_17dd5: ; 17dd5 (5:7dd5)
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, Func_17df1
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
Func_17df1: ; 17df1 (5:7df1)
	pop bc
	jp Func_17dfc

Func_17df5: ; 17df5 (5:7df5)
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
Func_17dfc: ; 17dfc (5:7dfc)
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	jp Func_17d9a

Func_17e0c: ; 17e0c (5:7e0c)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld e, $0
	xor a
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	read_hl_from wMemoryAllocationNumBlocks
	push hl
	ld hl, Data_17e6c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $2
	xor a
.asm_17e36
	call SetStringStartState
	pop bc
	push bc
	call GetHLAtSPPlus6
	push hl
	ld hl, Data_17e77
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $4
	xor a
	call SetStringStartState
	pop hl
	push hl
	push hl
	ld hl, Data_17e88
	push hl
	call PlaceString
	pop bc
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_17e6c: ; 17e6c
	db "カウント "
	TX_SNUM
	db " "
	TX_SNUM
	db "$"

Data_17e77: ; 17e77
	db "ナイフﾞ "
	TX_SNUM
	db " カﾞイフﾞ "
	TX_SNUM
	db "$"

Data_17e88: ; 17e88
	db "サイタﾞイ "
	TX_SNUM
	db "$"

Func_17e91: ; 17e91 (5:7e91)
	call Func_17d7b
	ret

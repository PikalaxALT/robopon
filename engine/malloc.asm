InitHeap:: ; 17a67 (5:7a67)
	write_hl_to wHeapPtr
	read_hl_from wHeapPtr
	ld c, l
	ld b, h
	ld a, MEM_BLOCK_FREE
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
	ld de, sHeap
	ld [hl], e
	inc hl
	ld [hl], d
	ld bc, sHeap
	ld a, MEM_BLOCK_FREE
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
	write_hl_to wMallocNBlocks
	ret

SetAllocationMode: ; 17ab6 (5:7ab6)
	ld [wMemoryAllocationMode], a
	ret

malloc:: ; 17aba (5:7aba)
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
	read_hl_from wHeapPtr
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
	sub low($c000)
	ld a, h
	sbc high($c000)
	jp nc, .okay2
	jp .next

.okay2
	ld a, [wMemoryAllocationMode]
	cp $2
	jp nz, .okay_3
	pop hl
	push hl
	ld a, l
	sub low($c000)
	ld a, h
	sbc high($c000)
	jp c, .okay_3
	jp .next

.okay_3
	pop hl
	push hl
	ld a, [hl]
	cp MEM_BLOCK_FREE
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
	ld [hl], MEM_BLOCK_USED
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
	ld [hl], MEM_BLOCK_FREE
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
	ld [hl], MEM_BLOCK_USED
.finish
	read_hl_from wMallocNBlocks
	inc hl
	write_hl_to wMallocNBlocks
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
	call PushBGMapRegion_NoWaitBefore
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
	call DoublePushBGMapRegion
	pop bc
.crash_wait
	call CheckButton
	or a
	jp z, .crash_wait
	set_farcall_addrs_hli PrintMemoryAllocationErrorDetails
	ld hl, -1
	call FarCall
	set_farcall_addrs_hli PrintMemoryAllocationErrorDetails
	call GetHLAtSPPlus4
	call FarCall
	jp @ - 1 ; better luck next time

.done
	pop bc
	pop bc
	ret

Data_17c44: ; 17c44
	db "ケﾞットハﾞッファー ヌル エラー", $0 ; GET BUFFER FULL ERROR

Func_17c56: ; 17c56
	ret

free:: ; 17c57 (5:7c57)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, .nothing_to_free
	read_hl_from wMallocNBlocks
	dec hl
	write_hl_to wMallocNBlocks
	call GetHLAtSPPlus6
	ld de, -5
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld a, [hl]
	cp MEM_BLOCK_USED
	jp nz, .nothing_to_free
	call GetHLAtSPPlus4
	ld [hl], MEM_BLOCK_FREE
	read_hl_from wHeapPtr
	ld c, l
	ld b, h
.loop
	ld a, c
	or b
	jp z, .break
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
	jp nz, .next
	jp .break

.next
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp .loop

.break
	ld a, c
	or b
	jp z, .get_alloc_pointer
	ld a, [bc]
	cp MEM_BLOCK_FREE
	jp nz, .get_alloc_pointer
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
.get_alloc_pointer
	read_hl_from wHeapPtr
	ld c, l
	ld b, h
.loop2
	ld a, c
	or b
	jp z, .break2
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
	jp nz, .next2
	jp .break2

.next2
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	jp .loop2

.break2
	ld a, c
	or b
	jp z, .nothing_to_free
	ld a, [bc]
	cp MEM_BLOCK_FREE
	jp nz, .nothing_to_free
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
.nothing_to_free
	pop bc
	pop bc
	pop bc
	ret

Func_17d7b: ; 17d7b
	push bc
	push bc
	push bc
	push bc
	read_hl_from wHeapPtr
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
.loop
	call GetHLAtSPPlus8
	ld a, l
	or h
	jp z, .break
	call GetHLAtSPPlus8
	ld a, [hl]
	cp MEM_BLOCK_FREE
	jp nz, .inc_next
	call GetHLAtSPPlus8
	ld a, l
	sub low($c000)
	ld a, h
	sbc high($c000)
	jp c, .sram
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
	jp .okay

.sram
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
.okay
	push bc
	call GetHLAtSPPlus10
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	call CompareHLtoBC
	jp nc, .pop_next
	call GetHLAtSPPlus10
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
.pop_next
	pop bc
	jp .next

.inc_next
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
.next
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	jp .loop

.break
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $0
	xor a
	call SetStringStartState
	call GetHLAtSPPlus8
	push hl
	read_hl_from wMallocNBlocks
	push hl
	ld hl, Data_17e6c
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	ld e, $2
	xor a
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
	call DoublePushBGMapRegion
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_17e6c: ; 17e6c
	dstr "カウント %d %d"

Data_17e77: ; 17e77
	dstr "ナイフﾞ %d カﾞイフﾞ %d"

Data_17e88: ; 17e88
	dstr "サイタﾞイ %d"

Func_17e91: ; 17e91 (5:7e91)
	call Func_17d7b
	ret

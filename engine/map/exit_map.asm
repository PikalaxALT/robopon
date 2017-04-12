ExitMap: ; 854b (2:454b)
macro_854b: MACRO
	read_hl_from \1
	call Func_be5d
	ld hl, $0
	write_hl_to \1
	ENDM
	
	push af
	push de
	add sp, -$62

	push bc
	ld hl, sp+$55
	reg16swap de, hl
	ld hl, Data_84f1
	ld bc, $8
	call MemCopy

	ld hl, sp+$3
	reg16swap de, hl
	ld hl, Data_84f9
	ld bc, $52
	call MemCopy
	xor a
	ld [$c7a5], a
	pop bc

	push bc
	inc c
	dec c
	jp nz, .c_is_zero
	ld hl, $0
	write_hl_to $c85d
	ld hl, $0
	write_hl_to $c830
	write_hl_to $c82e
	write_hl_to $c82c
	write_hl_to $c828
	write_hl_to $c826
	write_hl_to $c822
	write_hl_to $c824
	ld hl, $0
	write_hl_to $c77a
	ld hl, $0
	write_hl_to $c778
	ld hl, $0
	write_hl_to $c774
	ld hl, $0
	write_hl_to $c776
	ld hl, $0
	write_hl_to $c82a
	xor a
	ld [$c84d], a
	ld [$c84c], a
	ld [$c84b], a
	ld a, $1
	ld [$c84a], a
	jp .okay

.c_is_zero
	macro_854b $c824
	macro_854b $c822
	macro_854b $c826
	macro_854b $c828
	macro_854b $c82c
	macro_854b $c82e
	macro_854b $c82a
	macro_854b $c85d
.okay
	set_farcall_addrs_hli GetMapTriggerIndex
	ld hl, sp+$64
	ld e, [hl]
	ld hl, sp+$67
	ld a, [hl]
	call FarCall
	ld a, l
	ld hl, sp+$5d
	ld [hl], a
	ld hl, $200
	call Func_be4d
	write_hl_to $c824
	ld hl, $200
	call Func_be4d
	write_hl_to $c822
	ld hl, $80
	call Func_be4d
	write_hl_to $c826
	ld hl, $80
	call Func_be4d
	write_hl_to $c844
	ld hl, $e0
	call Func_be4d
	write_hl_to $c85d
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	and $7
	ld e, a
	ld d, $0
	ld hl, sp+$55
	add hl, de
	ld a, [hl]
	ld [$c859], a
	ld hl, sp+$5d
	ld a, [hl]
	call Func_8d2a
	ld a, BANK(GFX_1c000)
	ld [wFarCallDestBank], a
	ld bc, $3
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	and $7
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, GFX_1c000
	add hl, de
	reg16swap de, hl
	ld hl, sp+$5e
	call FarCopyVideoData
	ld hl, $728
	push hl
	call Func_be4d
	write_hl_to $c85b
	ld hl, sp+$60
	ld a, [hl]
	add BANK(GFX_1c000)
	ld [wFarCallDestBank], a
	pop bc
	read_hl_from $c85b
	push hl
	read_hl_from_sp_plus $63
	pop de
	call FarDecompressVideoData
	read_hl_from $c85b
	ld de, $2a8
	add hl, de
	reg16swap de, hl
	ld hl, $400
	add hl, de
	push hl
	ld hl, $154
	call Func_be4d
	write_hl_to $c842
	ld bc, $154
	ld e, $ff
	read_hl_from $c842
	call FillMemory
	ld a, [$c7da]
	or a
	jp nz, Func_8752
	call Func_b6f2
	xor a
	call Func_bbc8
	jp Func_875d

Func_8752: ; 8752 (2:4752)
	ld e, $ff
	ld a, $ff
	call Func_b60d
	xor a
	call Func_bbc8
Func_875d: ; 875d (2:475d)
	ld a, $ff
	ld [$c81f], a
	ld hl, sp+$4
	ld [hl], $ff
	ld bc, $0
Func_8769: ; 8769 (2:4769)
	ld l, c
	ld h, b
	ld de, $52
	call CompareHLtoDE
	jp nc, Func_87b9
	ld hl, sp+$69
	ld a, [hl]
	ld hl, sp+$5
	add hl, bc
	cp [hl]
	jp nz, Func_87b4
	ld hl, sp+$66
	ld a, [hl]
	ld hl, sp+$6
	add hl, bc
	cp [hl]
	jp nz, Func_87b4
	ld hl, sp+$5f
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	and $7
	cp $4
	jp z, Func_87a0
	ld hl, sp+$4
	ld [hl], $7
	jp Func_87a4

Func_87a0: ; 87a0 (2:47a0)
	ld hl, sp+$4
	ld [hl], $27
Func_87a4: ; 87a4 (2:47a4)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	read_hl_from $c844
	add hl, de
	ld [hl], $1
	jp Func_87b9

Func_87b4: ; 87b4 (2:47b4)
	inc bc
	inc bc
	jp Func_8769

Func_87b9: ; 87b9 (2:47b9)
	call Func_898a
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp z, Func_87ca
	ld hl, sp+$4
	ld a, [hl]
	call Func_a184
Func_87ca: ; 87ca (2:47ca)
	pop de
	read_hl_from $c826
	ld bc, $80
	call CopyFromDEtoHL
	read_hl_from $c842
	call Func_be5d
	read_hl_from $c844
	call Func_be5d
	read_hl_from $c85b
	call Func_be5d
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_8827
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c2d7]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	call Func_be4d
	write_hl_to $c830
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld a, [$c2d7]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld e, $0
	read_hl_from $c830
	call FillMemory
Func_8827: ; 8827 (2:4827)
	ld a, [$c7e8]
	ld e, a
	ld a, [$c7e7]
	call Func_b530
	xor a
	call Func_be77
	ld hl, sp+$5d
	ld e, [hl]
	ld d, $0
	ld hl, Data_841d
	add hl, de
	ld a, [hl]
	ld b, $8
	call DivideAbyB
	ld [$c867], a
	xor a
	ld [$c837], a
	ld [$c836], a
	ld [$c835], a
	ld [$c834], a
	ld [$c833], a
	ld [$c832], a
	ld [$c821], a
	xor a
	ld [$c83a], a
	xor a
	ld [$c858], a
	pop bc
	push bc
	inc c
	dec c
	jp nz, Func_8894
	call Func_a24c
	call Func_aff1
	call Func_aca6
	call Func_b773
	call Func_b407
	call Func_9d31
	call Func_bf2c
	ld a, $ff
	call Func_bf46
	callba_hli Func_9b251
Func_8894: ; 8894 (2:4894)
	ld a, $1
	call Func_b52c
	callba_hli Func_da07a
	ld hl, sp+$5e
	ld [hl], $40
	ld hl, sp+$5f
	ld [hl], $0
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$5e
	call FarCall
	callba_hli Func_da4fc
	read_hl_from $c82e
	ld a, l
	or h
	jp z, Func_88df
	read_hl_from $c82e
	call Func_be5d
Func_88df: ; 88df (2:48df)
	pop bc
	ld a, c
	cp $1
	jp nz, Func_88f8
	ld a, $ff
	ld [$c839], a
	ld c, $0
	ld e, $0
	ld a, [$c838]
	call Func_9a49
	call NextOverworldFrame
Func_88f8: ; 88f8 (2:48f8)
	ld a, [$c7ea]
	ld l, a
	push hl
	ld a, [$c7e9]
	ld c, a
	ld a, [$c7e8]
	ld e, a
	ld a, [$c7e7]
	call Func_b377
	pop bc
	ld [$c838], a
	ld a, [$c838]
	cp $ff
	jp nz, Func_891c
	ld a, $2
	ld [$c838], a
Func_891c: ; 891c (2:491c)
	call Func_8ccf
	call Func_bfaf
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, hPushOAM + 5
	add hl, de
	write_hl_to $c868
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, hPushOAM + 5
	add hl, de
	write_hl_to $c86e
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, hPushOAM + 4
	add hl, de
	write_hl_to $c86c
	ld hl, $c2d6
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld de, $6
	add hl, de
	write_hl_to $c86a
	add sp, $66
	ret

DrawTextBoxAndOverworldText: ; aa5d (2:6a5d)
; e = ???
; c = 1 if yes/no box else 0
	push hl
	push de
	add sp, -$44
	push bc
	ld a, $3
	ld [$c39a], a
	ld l, $d
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3afc
	pop bc
	ld hl, $0
	call WriteHLToSPPlus4
	ld hl, sp+$46
	ld a, [hl]
	cp $c
	jp nz, Func_ab15
	read_hl_from_sp_plus $4a
	write_hl_to_sp_plus $43
	ld hl, -1
	write_hl_to_sp_plus $45
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, sp+$41
	call PrintCharacterFromTree
	ld hl, sp+$4
	ld [hl], $0
	ld c, $0
Func_aaa1: ; aaa1 (2:6aa1)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_aaaf
	jp Func_aad8

Func_aaaf: ; aaaf (2:6aaf)
	ld e, c
	ld d, $0
	ld hl, sp+$5
	add hl, de
	ld a, [hl]
	cp $df
	jp z, Func_aaca
	cp $de
	jp z, Func_aaca
	cp $29
	jp z, Func_aaca
	cp $28
	jp nz, Func_aacd
Func_aaca: ; aaca (2:6aca)
	jp Func_aad4

Func_aacd: ; aacd (2:6acd)
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
Func_aad4: ; aad4 (2:6ad4)
	inc c
	jp Func_aaa1

Func_aad8: ; aad8 (2:6ad8)
	set_farcall_addrs_hli Func_da901
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $203
	add hl, de
	reg16swap de, hl
	ld hl, $b
	call FarCall
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld hl, sp+$4
	ld a, [hl]
	add $2
	ld e, a
	ld hl, $b
	call FarCall
Func_ab15: ; ab15 (2:6b15)
	set_farcall_addrs_hli Func_da901
	ld de, $1405
	ld hl, $d
	call FarCall
	reg16swap de, hl
	push de
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	read_hl_from_sp_plus $4c
	write_hl_to_sp_plus $45
	ld l, $0
	push hl
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	pop hl
	pop de
	pop bc
	push de
	push hl
	push bc
	ld a, c
	and $1
	jp z, .print_text
	set_farcall_addrs_hli PrintMapText
	ld bc, $1603
	ld hl, sp+$45
	reg16swap de, hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	inc h
	call FarCall
	jp .done_text

.print_text
	set_farcall_addrs_hli PrintMapText_
	ld c, $c3
	ld hl, sp+$45
	reg16swap de, hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	inc h
	call FarCall
.done_text
	pop bc
	pop hl
	push bc
	ld a, c
	and $1
	jp z, .no_delay
	xor a
.delay10
	cp $a
	jp nc, .done_delay
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp .delay10

.done_delay
	callba_hli Func_1482e
	ld a, l
	cp $ff
	jp nz, .no_delay
	ld l, $1
.no_delay
	pop bc
	pop de
	push hl
	push de
	ld a, c
	and $2
	jp nz, Func_abdd
	call Func_8f44
Func_abdd: ; abdd (2:6bdd)
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp z, Func_abf6
	set_farcall_addrs_hli Func_daa40
	call GetHLAtSPPlus6
	call FarCall
Func_abf6: ; abf6 (2:6bf6)
	pop de
	ld a, e
	or d
	jp z, Func_ac0c
	push de
	set_farcall_addrs_hli Func_daa40
	pop hl
	call FarCall
Func_ac0c: ; ac0c (2:6c0c)
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call NextOverworldFrame
	pop hl
	ld a, l
	add sp, $48
	ret

PrintOverworldTextIndexUnadorned:: ; ac24
	ld e, $e
	ld c, $0
	call DrawTextBoxAndOverworldText
	ret

PrintOverworldTextIndexWithNPCName:: ; ac2c
	ld e, $c
	ld c, $0
	call DrawTextBoxAndOverworldText
	ret

Func_ac34: ; ac34
	ret

Func_ac35:: ; ac35
	ret

Func_ac36:: ; ac36
	ret

Func_ac37:: ; ac37
	ld a, $8a
	ld [wBlinkerOffTile], a
	set_farcall_addrs_hli Func_60001
	ld c, $0
	ld e, $10
	ld a, $12
	call FarCall
Func_ac50: ; ac50 (2:6c50)
	call GetJoyPressed
	ld l, a
	ld a, l
	and A_BUTTON
	jp z, Func_ac5d
	jp Func_ac69

Func_ac5d: ; ac5d (2:6c5d)
	ld a, l
	and B_BUTTON
	jp z, Func_ac66
	jp Func_ac69

Func_ac66: ; ac66 (2:6c66)
	jp Func_ac50

Func_ac69: ; ac69 (2:6c69)
	call GetJoyPressed
	ld l, a
	ld a, l
	and A_BUTTON
	jp z, Func_ac76
	jp Func_ac69

Func_ac76: ; ac76 (2:6c76)
	ld a, l
	and B_BUTTON
	jp z, Func_ac7f
	jp Func_ac69

Func_ac7f: ; ac7f (2:6c7f)
	set_farcall_addrs_hli Func_60001
	ld c, $1
	ld e, $10
	ld a, $12
	call FarCall
	ret

PrintOverworldTextIndexWithYesNoBox:: ; ac94
	ld e, $e
	ld c, $1
	jp DrawTextBoxAndOverworldText

Func_ac9b:: ; ac9b
	xor a
	ret

PrintOverworldTextIndexWithNPCNameAndYesNoBox:: ; ac9d
	ld e, $c
	ld c, $1
	jp DrawTextBoxAndOverworldText

Func_aca4:: ; aca4
	xor a
	ret


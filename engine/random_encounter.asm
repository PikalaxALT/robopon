RollRandomEncounter: ; b821 (2:7821)
	add sp, -$3c
	read_hl_from $c83c
	ld a, l
	or h
	jp z, Func_b832
	ld a, $ff
	jp Func_ba44

Func_b832: ; b832 (2:7832)
	ld a, [wRandomEncounterCooldown]
	or a
	jp z, Func_b845
	ld a, [wRandomEncounterCooldown]
	dec a
	ld [wRandomEncounterCooldown], a
	ld a, $ff
	jp Func_ba44

Func_b845: ; b845 (2:7845)
	push bc
	set_farcall_addrs_hli RandomRange
	ld a, $ff
	call FarCall
	ld hl, sp+$2c
	ld [hl], a
	pop bc
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, wRandomEncounterRate
	cp [hl]
	jp nc, Func_ba42
	ld hl, sp+$2a
	xor a
	ld [hl], a
	ld hl, sp+$2b
	ld [hl], a
	ld l, a
	ld h, $0
	write_hl_to_sp_plus $2e
	ld hl, sp+$29
	ld [hl], $0
Func_b876: ; b876 (2:7876)
	ld hl, sp+$29
	ld a, [hl]
	cp $2
	jp nc, Func_b996
	ld c, $0
Func_b880: ; b880 (2:7880)
	ld a, c
	ld hl, $c780
	cp [hl]
	jp nc, Func_b96d
	push bc
	ld a, [$c77d]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from $c77e
	add hl, de
	reg16swap de, hl
	ld hl, sp+$30
	ld bc, $e
	call FarCopyVideoData
	pop bc
	ld a, [wPlayerMapX]
	ld hl, sp+$2e
	cp [hl]
	jp c, Func_b969
	ld hl, sp+$2e
	ld a, [hl]
	ld hl, sp+$30
	add [hl]
	ld l, a
	ld a, [wPlayerMapX]
	cp l
	jp nc, Func_b969
	ld a, [wPlayerMapY]
	ld hl, sp+$2f
	cp [hl]
	jp c, Func_b969
	ld hl, sp+$2f
	ld a, [hl]
	ld hl, sp+$31
	add [hl]
	ld l, a
	ld a, [wPlayerMapY]
	cp l
	jp nc, Func_b969
	ld hl, sp+$29
	ld a, [hl]
	or a
	jp nz, Func_b919
	push bc
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $30
	add hl, bc
	write_hl_to_sp_plus $30
	pop bc
	push bc
	ld a, [$c784]
	or a
	jp z, Func_b915
	ld a, [$c780]
	dec a
	cp c
	jp nz, Func_b915
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $30
	add hl, bc
	write_hl_to_sp_plus $30
Func_b915: ; b915 (2:7915)
	pop bc
	jp Func_b969

Func_b919: ; b919 (2:7919)
	ld a, [$c784]
	or a
	jp z, Func_b946
	ld a, [$c780]
	dec a
	cp c
	jp nz, Func_b946
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, Func_b943
	ld hl, sp+$3a
	ld a, [hl]
	add a
	ld hl, sp+$2b
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, Func_b943
	jp Func_b96d

Func_b943: ; b943 (2:7943)
	jp Func_b960

Func_b946: ; b946 (2:7946)
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, Func_b960
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, Func_b960
	jp Func_b96d

Func_b960: ; b960 (2:7960)
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld hl, sp+$2b
	ld [hl], a
Func_b969: ; b969 (2:7969)
	inc c
	jp Func_b880

Func_b96d: ; b96d (2:796d)
	push bc
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_b98b
	set_farcall_addrs_hli RandomRange
	read_hl_from_sp_plus $30
	ld a, l
	call FarCall
	ld hl, sp+$2c
	ld [hl], a
Func_b98b: ; b98b (2:798b)
	ld hl, sp+$2b
	ld a, [hl]
	inc a
	ld hl, sp+$2b
	ld [hl], a
	pop bc
	jp Func_b876

Func_b996: ; b996 (2:7996)
	ld a, [$c780]
	cp c
	jp z, Func_ba42
	ld a, $3
	ld [wRandomEncounterCooldown], a
	ld hl, sp+$0
	ld [hl], $0
	ld hl, $0
	call WriteHLToSPPlus3
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$4
	ld [hl], $0
	ld hl, sp+$5
	ld [hl], $c5
	ld hl, sp+$6
	ld [hl], $0
	ld hl, sp+$28
	ld [hl], $0
	ld hl, sp+$7
	ld [hl], $0
	ld hl, sp+$8
	ld [hl], $0
	ld hl, sp+$32
	ld a, [hl]
	dec a
	ld hl, sp+$9
	ld [hl], a
	ld hl, sp+$a
	ld [hl], $1
	ld hl, sp+$32
	ld a, [hl]
	cp $1
	jp nz, Func_b9e2
	ld hl, sp+$b
	ld [hl], $1
	jp Func_b9e9

Func_b9e2: ; b9e2 (2:79e2)
	ld hl, sp+$32
	ld a, [hl]
	dec a
	ld hl, sp+$b
	ld [hl], a
Func_b9e9: ; b9e9 (2:79e9)
	ld hl, sp+$39
	ld a, [hl]
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$33
	ld a, [hl]
	ld hl, sp+$34
	cp [hl]
	jp nc, Func_ba11
	set_farcall_addrs_hli RandomRange
	ld hl, sp+$34
	ld a, [hl]
	ld hl, sp+$33
	sub [hl]
	inc a
	call FarCall
	ld e, a
	jp Func_ba13

Func_ba11: ; ba11 (2:7a11)
	ld e, $1
Func_ba13: ; ba13 (2:7a13)
	ld hl, sp+$33
	ld a, [hl]
	add e
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$36
	ld a, [hl]
	ld hl, sp+$e
	ld [hl], a
	ld hl, sp+$37
	ld a, [hl]
	ld hl, sp+$f
	ld [hl], a
	ld hl, sp+$38
	ld a, [hl]
	ld hl, sp+$10
	ld [hl], a
	ld hl, sp+$35
	ld a, [hl]
	ld hl, sp+$11
	ld [hl], a
	ld bc, $0
	ld hl, sp+$0
	reg16swap de, hl
	xor a
	call StartBattle
	jp Func_ba44

Func_ba42: ; ba42 (2:7a42)
	ld a, $ff
Func_ba44: ; ba44 (2:7a44)
	add sp, $3c
	ret

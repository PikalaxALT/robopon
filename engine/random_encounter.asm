Func_b773: ; b773 (2:7773)
	xor a
	ld [wRandomEncounterTableLength], a
	xor a
	ld [wRandomEncounterRate], a
	ld a, $3
	ld [wRandomEncounterCooldown], a
	xor a
	ld [wc784], a
	ret

Func_b785:: ; b785
	push af
	push bc
	push bc
	push bc
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$0
	call FarCall
	ld hl, sp+$3
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld [wc7bd], a
	ld a, [wc7bd]
	cp $c
	jp nc, Func_b7f2
	ld e, a
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $14
	jp z, Func_b7e5
	cp $13
	jp z, Func_b7d4
	cp $12
	jp nz, Func_b7ec
	ld hl, sp+$7
	ld a, [hl]
	ld b, $5
	call DivideAbyB
	ld hl, sp+$7
	add [hl]
	ld [wRandomEncounterRate], a
	jp Func_b7f2

Func_b7d4: ; b7d4 (2:77d4)
	ld hl, sp+$7
	ld a, [hl]
	ld b, $2
	call DivideAbyB
	ld hl, sp+$7
	add [hl]
	ld [wRandomEncounterRate], a
	jp Func_b7f2

Func_b7e5: ; b7e5 (2:77e5)
	xor a
	ld [wRandomEncounterRate], a
	jp Func_b7f2

Func_b7ec: ; b7ec (2:77ec)
	ld hl, sp+$7
	ld a, [hl]
	ld [wRandomEncounterRate], a
Func_b7f2: ; b7f2 (2:77f2)
	ld hl, sp+$7
	ld a, [hl]
	ld [wc782], a
	pop bc
	pop bc
	pop bc
	pop bc
	ret

LoadEncounterTable:: ; b7fd
	ld [wRandomEncounterTableBank], a
	reg16swap de, hl
	write_hl_to wRandomEncounterTableAddr
	ld a, c
	ld [wRandomEncounterTableLength], a
	set_farcall_addrs_hli Func_e1f2d
	ld a, $11
	call FarCall
	ld [wc784], a
	ret

RollRandomEncounter: ; b821 (2:7821)
	add sp, -$3c
	read_hl_from wMovementDataAddr
	ld a, l
	or h
	jp z, .check_cooldown
	ld a, $ff
	jp .quit

.check_cooldown
	ld a, [wRandomEncounterCooldown]
	or a
	jp z, .roll
	ld a, [wRandomEncounterCooldown]
	dec a
	ld [wRandomEncounterCooldown], a
	ld a, $ff
	jp .quit

.roll
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
	jp nc, .roll_failed
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
.loop
	ld hl, sp+$29
	ld a, [hl]
	cp $2
	jp nc, .check_2
	ld c, $0
.loop2
	ld a, c
	ld hl, wRandomEncounterTableLength
	cp [hl]
	jp nc, .next
	push bc
	ld a, [wRandomEncounterTableBank]
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
	read_hl_from wRandomEncounterTableAddr
	add hl, de
	reg16swap de, hl
	ld hl, sp+$30
	ld bc, $e
	call FarCopyVideoData
	pop bc

	; coord check
	ld a, [wPlayerMapX]
	ld hl, sp+$2e
	cp [hl]
	jp c, .next2
	ld hl, sp+$2e
	ld a, [hl]
	ld hl, sp+$30
	add [hl]
	ld l, a
	ld a, [wPlayerMapX]
	cp l
	jp nc, .next2
	ld a, [wPlayerMapY]
	ld hl, sp+$2f
	cp [hl]
	jp c, .next2
	ld hl, sp+$2f
	ld a, [hl]
	ld hl, sp+$31
	add [hl]
	ld l, a
	ld a, [wPlayerMapY]
	cp l
	jp nc, .next2

	ld hl, sp+$29
	ld a, [hl]
	or a
	jp nz, .asm_b919

	push bc
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $30
	add hl, bc
	write_hl_to_sp_plus $30
	pop bc

	push bc
	ld a, [wc784]
	or a
	jp z, .asm_b915
	ld a, [wRandomEncounterTableLength]
	dec a
	cp c
	jp nz, .asm_b915
	ld hl, sp+$3c
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $30
	add hl, bc
	write_hl_to_sp_plus $30
.asm_b915
	pop bc
	jp .next2

.asm_b919
	ld a, [wc784]
	or a
	jp z, .asm_b946
	ld a, [wRandomEncounterTableLength]
	dec a
	cp c
	jp nz, .asm_b946

	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, .asm_b943
	ld hl, sp+$3a
	ld a, [hl]
	add a
	ld hl, sp+$2b
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, .asm_b943
	jp .next

.asm_b943
	jp .asm_b960

.asm_b946
	ld hl, sp+$2a
	ld a, [hl]
	ld hl, sp+$2b
	cp [hl]
	jp c, .asm_b960
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld e, a
	ld hl, sp+$2a
	ld a, [hl]
	cp e
	jp nc, .asm_b960
	jp .next

.asm_b960
	ld hl, sp+$2b
	ld a, [hl]
	ld hl, sp+$3a
	add [hl]
	ld hl, sp+$2b
	ld [hl], a
.next2
	inc c
	jp .loop2

.next
	push bc
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, .skip_roll
	set_farcall_addrs_hli RandomRange
	read_hl_from_sp_plus $30
	ld a, l
	call FarCall
	ld hl, sp+$2c
	ld [hl], a
.skip_roll
	ld hl, sp+$2b
	ld a, [hl]
	inc a
	ld hl, sp+$2b
	ld [hl], a
	pop bc
	jp .loop

.check_2
	ld a, [wRandomEncounterTableLength]
	cp c
	jp z, .roll_failed
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
	jp nz, .asm_b9e2
	ld hl, sp+$b
	ld [hl], $1
	jp .asm_b9e9

.asm_b9e2
	ld hl, sp+$32
	ld a, [hl]
	dec a
	ld hl, sp+$b
	ld [hl], a
.asm_b9e9
	ld hl, sp+$39
	ld a, [hl]
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$33
	ld a, [hl]
	ld hl, sp+$34
	cp [hl]
	jp nc, .asm_ba11
	set_farcall_addrs_hli RandomRange
	ld hl, sp+$34
	ld a, [hl]
	ld hl, sp+$33
	sub [hl]
	inc a
	call FarCall
	ld e, a
	jp .asm_ba13

.asm_ba11
	ld e, $1
.asm_ba13
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
	jp .quit

.roll_failed
	ld a, $ff
.quit
	add sp, $3c
	ret

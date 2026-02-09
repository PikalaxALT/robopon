GetName:: ; 15ad6 (5:5ad6)
	push hl
	push de
	add sp, -$6c
	push bc
	read_hl_from_sp_plus $72
	ld de, $100
	call DivideHLByDESigned
	ld c, l
	read_hl_from_sp_plus $72
	reg16swap de, hl
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	ld a, BANK(Moves)
	ld [wFarCallDestBank], a
	ld a, c
	cp $7
	jp z, .getWarehouseNickname
	cp $6
	jp z, .getRobotName
	cp $3
	jp z, .getPartyNickname
	cp $4
	jp z, .getItemName
	cp $2
	jp z, .asm_15b61
	cp $5
	jp z, .asm_15b52
	cp $1
	jp z, .asm_15b3b
	or a
	jp nz, .gotName
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld de, Moves
	add hl, de
	write_hl_to_sp_plus $6e
	jp .gotName

.asm_15b3b: ; 15b3b (5:5b3b)
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_64c90
	add hl, de
	write_hl_to_sp_plus $6e
	jp .gotName

.asm_15b52: ; 15b52 (5:5b52)
	ld e, l
	ld hl, sp+$54
	call Func_241f
	ld hl, sp+$5d
	write_hl_to_sp_plus $6e
	jp .gotName

.asm_15b61: ; 15b61 (5:5b61)
	ld e, l
	ld hl, sp+$54
	call Func_241f
	ld hl, sp+$54
	write_hl_to_sp_plus $6e
	jp .gotName

.getItemName: ; 15b70 (5:5b70)
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	ld de, ItemAttributes
	add hl, de
	write_hl_to_sp_plus $6e
	jp .gotName

.getPartyNickname: ; 15b86 (5:5b86)
	ld h, $0
	get_party_bot
	inc hl
	write_hl_to_sp_plus $6e
	jp .gotName

.getRobotName: ; 15b9f (5:5b9f)
	ld e, l
	ld hl, sp+$25
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$32
	write_hl_to_sp_plus $6e
	jp .gotName

.getWarehouseNickname: ; 15bae (5:5bae)
	push hl
	set_farcall_addrs_hli Func_7dfc
	pop hl
	ld a, l
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld hl, sp+$3
	write_hl_to_sp_plus $6e
.gotName: ; 15bcb (5:5bcb)
	pop bc
	ld b, $0
	read_hl_from_sp_plus $6c
	push hl
	read_hl_from_sp_plus $70
	pop de
	call FarCopyVideoData
	add sp, $70
	ret

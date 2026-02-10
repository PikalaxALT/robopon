Func_5c0b2::
	push af
	push de
	ld hl, -$354
	add hl, sp
	ld sp, hl
	ldh a, [hSRAMBank]
	ld e, a
	ld hl, $354
	add hl, sp
	ld a, [hl]
	cp $aa
	jp c, .hardCoded
	ld hl, $354
	add hl, sp
	ld a, [hl]
	cp $ae
	jp nc, .hardCoded
	ld hl, $357
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_5c197
	push de
	ld hl, $356
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld de, $351
	call MultiplyHLbyDE
	ld de, $7ed5
	add hl, de
	push hl
	ld a, $2
	call GetSRAMBank_ReadOnly
	pop hl
	push hl
	reg16swap de, hl
	inc de
	ld hl, sp+$4
	ld bc, $350
	call CopyFromDEtoHL
	pop hl
	push hl
	inc hl
	ld c, l
	ld b, h
	ld hl, $0
	write_hl_to_sp_plus $356
	xor a
.softCodedLoop
	cp $40
	jp nc, .softCodedBreak
	push af
	ld a, [bc]
	or a
	jp nz, .softCodedNext
	read_hl_from_sp_plus $358
	ld de, $10
	add hl, de
	write_hl_to_sp_plus $358
.softCodedNext
	pop af
	inc a
	inc bc
	jp .softCodedLoop

.softCodedBreak
	set_farcall_addrs_hli FixAndLoadPoncotPicWithTilemap
	read_hl_from_sp_plus $356
	ld c, l
	ld b, h
	ld hl, sp+$44
	push hl
	ld hl, $35d
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .softCodedLoadToTileBC
	ld hl, $0
	jp .softCodedLoadToTile9B

.softCodedLoadToTileBC
	ld hl, $310
.softCodedLoadToTile9B
	ld de, $89b0
	add hl, de
	pop de
	call FarCall
	call WaitVideoTransfer
	pop hl
	ld a, [hl]
	ld hl, $356
	add hl, sp
	ld [hl], a
	pop de
	ld a, e
	call GetSRAMBank
	ld bc, $40
	ld hl, sp+$0
	push hl
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $359
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .softCodedOffset40
	ld hl, $0
	jp .softCodedNoOffset

.softCodedOffset40
	ld hl, $40
.softCodedNoOffset
	add hl, de
	pop de
	call CopyFromDEtoHL
	jp .asm_5c240

.asm_5c197
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	reg16swap de, hl
	inc hl
	ld c, l
	ld b, h
	ld hl, $0
	write_hl_to_sp_plus $354
	xor a
.asm_5c1b4
	cp $40
	jp nc, .asm_5c1d3
	push af
	ld a, [bc]
	or a
	jp nz, .asm_5c1cd
	read_hl_from_sp_plus $356
	ld de, $10
	add hl, de
	write_hl_to_sp_plus $356
.asm_5c1cd
	pop af
	inc a
	inc bc
	jp .asm_5c1b4

.asm_5c1d3
	pop de
	push de
	inc de
	ld hl, sp+$2
	ld bc, $350
	call CopyFromDEtoHL
	set_farcall_addrs_hli FixAndLoadPoncotPicWithTilemap
	read_hl_from_sp_plus $354
	ld c, l
	ld b, h
	ld hl, sp+$42
	push hl
	ld hl, $35b
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_5c202
	ld hl, $0
	jp .asm_5c205

.asm_5c202
	ld hl, $310
.asm_5c205
	ld de, $89b0
	add hl, de
	pop de
	call FarCall
	call WaitVideoTransfer
	pop de
	ld a, [de]
	ld hl, $354
	add hl, sp
	ld [hl], a
	ld bc, $40
	ld hl, sp+$0
	push hl
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $359
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_5c238
	ld hl, $0
	jp .asm_5c23b

.asm_5c238
	ld hl, $40
.asm_5c23b
	add hl, de
	pop de
	call CopyFromDEtoHL
.asm_5c240
	ld hl, $354
	add hl, sp
	ld a, [hl]
	ld hl, $357
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $1c8
	add hl, de
	add hl, bc
	ld [hl], a
	jp .asm_5c300

.hardCoded
	set_farcall_addrs_hli malloc
	ld hl, $400
	call FarCall
	write_hl_to_sp_plus $354
	ld hl, $357
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_5c27f
	ld hl, $0
	jp .asm_5c282

.asm_5c27f
	ld hl, $310
.asm_5c282
	ld de, $89b0
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $354
	reg16swap de, hl
	ld hl, $354
	add hl, sp
	ld a, [hl]
	call DecompressRequestRoboponPic
	ld bc, $40
	read_hl_from_sp_plus $354
	push hl
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $359
	add hl, sp
	ld a, [hl]
	or a
	jp nz, .asm_5c2bd
	ld hl, $0
	jp .asm_5c2c0

.asm_5c2bd
	ld hl, $40
.asm_5c2c0
	add hl, de
	pop de
	call CopyFromDEtoHL
	call WaitVideoTransfer
	set_farcall_addrs_hli free
	read_hl_from_sp_plus $354
	call FarCall
	set_farcall_addrs_hli Func_615be
	ld hl, $354
	add hl, sp
	ld a, [hl]
	call FarCall
	ld hl, $357
	add hl, sp
	ld c, [hl]
	ld b, $0
	read_hl_from wCurRobotPointer
	ld de, $1c8
	add hl, de
	add hl, bc
	ld [hl], a
.asm_5c300
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
	ld hl, $358
	add hl, sp
	ld sp, hl
	ret

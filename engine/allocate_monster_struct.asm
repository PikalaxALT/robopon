AllocateMonsterStruct:: ; cb4a (3:4b4a)
	read_hl_from wCurRobotPointer
	ld a, l
	or h
	jp nz, .bail
	; force SRAM allocation
	set_farcall_addrs_hli SetAllocationMode
	ld a, $2
	call FarCall
	; allocate 842 bytes and save the pointer
	set_farcall_addrs_hli AllocateMemory
	ld hl, $34a
	call FarCall
	write_hl_to wCurRobotPointer
	; clear the data
	ld bc, $34a
	ld e, $0
	read_hl_from wCurRobotPointer
	call FillMemory
	; allocate an additional 128 bytes and store the pointer in the
	; larger struct
	set_farcall_addrs_hli AllocateMemory
	ld hl, $80
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	; allocate an additional 145 bytes and store the pointer in the
	; larger struct
	set_farcall_addrs_hli AllocateMemory
	ld hl, $91
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	; clear the 145-byte struct
	ld bc, $91
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $0
	call FillMemory
	; allocate an additional 223 bytes and store the pointer in the
	; larger struct
	set_farcall_addrs_hli AllocateMemory
	ld hl, $df
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	; reset SRAM allocation
	set_farcall_addrs_hli SetAllocationMode
	xor a
	call FarCall
.bail
	ret

AllocateMonsterStruct2: ; cc0c
	read_hl_from wCurRobotPointer
	ld a, l
	or h
	jp nz, .bail
	set_farcall_addrs_hli SetAllocationMode
	ld a, $2
	call FarCall
	set_farcall_addrs_hli AllocateMemory
	ld hl, $34a
	call FarCall
	write_hl_to wCurRobotPointer
	ld bc, $34a
	ld e, $0
	read_hl_from wCurRobotPointer
	call FillMemory
	set_farcall_addrs_hli AllocateMemory
	ld hl, $80
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli AllocateMemory
	ld hl, $91
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld bc, $91
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $0
	call FillMemory
	set_farcall_addrs_hli AllocateMemory
	ld hl, $df
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli AllocateMemory
	ld hl, $351
	call FarCall
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	set_farcall_addrs_hli SetAllocationMode
	xor a
	call FarCall
.bail
	ret

FreeMonsterStruct:: ; cced (3:4ced)
	read_hl_from wCurRobotPointer
	ld a, l
	or h
	jp z, Func_cd99
	set_farcall_addrs_hli FreeMemory
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli FreeMemory
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	set_farcall_addrs_hli FreeMemory
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_cd7e
	set_farcall_addrs_hli FreeMemory
	read_hl_from wCurRobotPointer
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FarCall
Func_cd7e: ; cd7e (3:4d7e)
	set_farcall_addrs_hli FreeMemory
	read_hl_from wCurRobotPointer
	call FarCall
	ld hl, $0
	write_hl_to wCurRobotPointer
Func_cd99: ; cd99 (3:4d99)
	ret

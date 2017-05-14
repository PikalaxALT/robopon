BattleIntro: ; fa81 (3:7a81)
	add sp, -$32
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	write_hl_to_sp_plus $32
	read_hl_from_sp_plus $32
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	write_hl_to_sp_plus $32
	read_hl_from_sp_plus $34
	ld [hl], $10
	read_hl_from wCurRobotPointer
	ld de, $1aa
	add hl, de
	ld [hl], $0
	read_hl_from_sp_plus $34
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld a, l
	cp $1
	jp c, Func_fb2d
	push hl
	read_hl_from_sp_plus $36
	ld de, $27
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_faeb
	ld a, SONG_TRAINER_BATTLE
	call OverworldPlaySong
	jp Func_faf0

Func_faeb: ; faeb (3:7aeb)
	ld a, SONG_GYM_LEADER_BATTLE
	call OverworldPlaySong
Func_faf0: ; faf0 (3:7af0)
	call Func_f771
	read_hl_from_sp_plus $34
	ld de, $9
	add hl, de
	ld [hl], $3
	ld a, [hl]
	read_hl_from_sp_plus $34
	ld de, $8
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $36
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$27
	ld [hl], e
	read_hl_from_sp_plus $36
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$28
	ld [hl], e
	ld hl, sp+$2f
	ld [hl], $1
	read_hl_from_sp_plus $34
	ld [hl], $2
	pop hl
	jp Func_fb64

Func_fb2d: ; fb2d (3:7b2d)
	ld a, SONG_WILD_BATTLE
	call OverworldPlaySong
	ld hl, sp+$2d
	ld [hl], $0
	read_hl_from_sp_plus $32
	ld de, $9
	add hl, de
	ld [hl], $0
	ld a, [hl]
	read_hl_from_sp_plus $32
	ld de, $8
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $34
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$25
	ld [hl], e
	ld hl, sp+$26
	ld [hl], $ff
	ld l, $1
	push hl
	read_hl_from_sp_plus $34
	ld [hl], $0
	pop hl
Func_fb64: ; fb64 (3:7b64)
	push hl
	read_hl_from_sp_plus $34
	ld de, $7
	add hl, de
	ld [hl], $0
	ld a, [hSRAMBank]
	ld e, a
	push de
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [wOptions]
	pop de
	push de
	push af
	ld a, e
	call GetSRAMBank
	pop af
	and $1 ; Battle Scene
	jp z, Func_fb90
	read_hl_from_sp_plus $36
	ld a, $4
	or [hl]
	ld [hl], a
Func_fb90: ; fb90 (3:7b90)
	xor a
	pop de
	pop hl
	pop bc
	push de
Func_fb95: ; fb95 (3:7b95)
	cp l
	jp nc, Func_fc20
	push hl
	push af
	push bc
	read_hl_from_sp_plus $38
	inc hl
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop bc
	pop af
	push bc
	push af
	ld a, [bc]
	ld e, a
	ld hl, sp+$31
	ld [hl], e
	ld a, $1
	ld c, $1
	call Func_dbf5
	pop af
	push af
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $166
	add hl, de
	pop de
	add hl, de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $155
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	pop af
	push af
	ld e, a
	ld a, $1
	ld c, $6
	call Func_dbf5
	ld hl, sp+$31
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wSaveScratchDexSeenFlags
	add hl, de
	push hl
	ld a, [hl]
	ld e, a
	ld hl, sp+$33
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	or e
	ld e, a
	pop hl
	ld a, e
	ld [hl], a
	pop af
	inc a
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	jp Func_fb95

Func_fc20: ; fc20 (3:7c20)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	write_hl_to_sp_plus $30
	ld hl, sp+$2c
	ld [hl], $0
Func_fc31: ; fc31 (3:7c31)
	ld hl, sp+$2c
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp z, Func_fccb
	ld hl, sp+$2c
	ld a, [hl]
	cp $4
	jp nc, Func_fccb
	ld c, $0
	ld hl, sp+$2c
	ld e, [hl]
	xor a
	call Func_dbf5
	ld hl, sp+$2c
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	read_hl_from_sp_plus $32
	ld de, $82
	add hl, de
	pop de
	add hl, de
	push hl
	read_hl_from_sp_plus $32
	ld de, $71
	add hl, de
	pop de
	ld bc, $11
	call MemCopy
	read_hl_from_sp_plus $30
	ld de, $75
	add hl, de
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $22
	add hl, de
	ld [hl], a
	set_farcall_addrs_hli StackGetRobotInParty
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2c
	ld a, [hl]
	call FarCall
	ld hl, sp+$2c
	ld a, [hl]
	inc a
	ld hl, sp+$2c
	ld [hl], a
	jp Func_fc31

Func_fccb: ; fccb (3:7ccb)
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, wc7bd
	ld l, [hl]
	ld h, $0
	ld de, wc7b1
	add hl, de
	ld a, [hl]
	pop de
	push de
	push af
	ld a, e
	call GetSRAMBank
	pop af
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld [hl], a
	ld c, $0
Func_fcef: ; fcef (3:7cef)
	ld a, c
	cp $4
	jp nc, Func_fd26
	push bc
	set_farcall_addrs_hli GetRobotInParty
	pop bc
	push bc
	ld a, c
	ld hl, sp+$4
	reg16swap de, hl
	call FarCall
	pop bc
	read_hl_from_sp_plus $10
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_fd22
	jp Func_fd26

Func_fd22: ; fd22 (3:7d22)
	inc c
	jp Func_fcef

Func_fd26: ; fd26 (3:7d26)
	push bc
	read_hl_from_sp_plus $36
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	read_hl_from_sp_plus $34
	inc hl
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	ld bc, $6
	call MemCopy
	pop bc
	push bc
	ld b, c
	ld a, $1
	call LeftShiftA
	read_hl_from_sp_plus $36
	or [hl]
	ld [hl], a
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld [hl], c
	read_hl_from_sp_plus $36
	ld de, $7
	add hl, de
	ld [hl], c
	ld a, $3
	call GetSRAMBank
	pop bc
	ld a, c
	ld [wc98d], a
	pop de
	ld a, e
	call GetSRAMBank
	read_hl_from_sp_plus $32
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $27
	read_hl_from_sp_plus $32
	ld de, $9
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $29
	read_hl_from_sp_plus $32
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	cp $1
	jp c, Func_fda8
	ld hl, sp+$27
	ld [hl], $0
	ld hl, sp+$28
	ld [hl], $5
Func_fda8: ; fda8 (3:7da8)
	ld hl, sp+$23
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_d7f5
	add sp, $32
	ret

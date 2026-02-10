Data_31aca: ; 31aca
	dw Data_31ad0
	dw Data_31ae2
	dw $0

Data_31ad0: ; 31ad0
	dstr "(そうこかﾞ いっはﾟいなのてﾞ)"

Data_31ae2: ; 31ae2
	dstr "(さくしﾞょしてくたﾞさい)"

GiveRobot:: ; 31af1
	push af
	push bc
	push bc
	push bc

	push de
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, Data_31aca
	ld bc, $6
	call MemCopy
	pop bc
	pop de

	; Try to put it first in the location specified in register e.
	push de
	push bc
	ld hl, sp+$b
	ld a, [hl]
	call TryGiveRobot
	pop bc
	pop de
	inc e
	dec e
	jp nz, .quit
	cp $ff
	jp nz, .quit
	; There is no room in that location, so try the warehouse
	push bc
	ld e, $5
	ld hl, sp+$9
	ld a, [hl]
	call TryGiveRobot
	pop bc
	cp $ff
	jp nz, .quit
	; There is no room for the robot
	push bc
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_30313
	set_farcall_addrs_hli PrintMapText_
	ld c, $c
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $5
	push hl
	ld c, $14
	ld e, $d
	xor a
	call DoublePushBGMapRegion
	pop bc
	call FillVisibleAreaWithBlankTile
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	callba_hli Func_52d1f
	pop bc
	ld e, $5
	ld hl, sp+$7
	ld a, [hl]
	call TryGiveRobot
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld a, $1
.quit: ; 31bb9 (c:5bb9)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

TryGiveRobot:: ; 31bbe (c:5bbe)
	push af
	add sp, -$58
	push de
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$5b
	ld [hl], a
	ld hl, sp+$59
	ld [hl], $ff
	pop bc
	pop de
	ld a, e
	cp $4
	jp z, Func_31fa9
	cp $3
	jp z, Func_31f49
	cp $5
	jp z, Func_31e24
	cp $2
	jp z, Func_31e24
	cp $1
	jp z, Func_31d7a
	or a
	jp nz, Func_31fc0
	push de
	push bc
	ld hl, sp+$5a
	ld [hl], $0
Func_31c03: ; 31c03 (c:5c03)
	ld hl, sp+$5a
	ld a, [hl]
	cp $4
	jp nc, Func_31c35
	ld hl, sp+$5a
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_31c2b
	ld hl, sp+$59
	ld [hl], $1
	jp Func_31c35

Func_31c2b: ; 31c2b (c:5c2b)
	ld hl, sp+$5a
	ld a, [hl]
	inc a
	ld hl, sp+$5a
	ld [hl], a
	jp Func_31c03

Func_31c35: ; 31c35 (c:5c35)
	pop bc
	pop de
	ld hl, sp+$55
	ld a, [hl]
	cp $ff
	jp nz, Func_31c4a
	ld hl, sp+$57
	ld a, [hl]
	call GetSRAMBank
	ld a, $ff
	jp Func_3202b

Func_31c4a: ; 31c4a (c:5c4a)
	push de
	push bc
	ld hl, sp+$5d
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$29
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$5d
	ld a, [hl]
	ld hl, sp+$5a
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld [hl], a
	ld hl, sp+$35
	push hl
	ld hl, sp+$5c
	ld l, [hl]
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call CopyFromDEtoHL
	ld hl, sp+$5a
	ld l, [hl]
	ld h, 0
	get_party_bot
	call WriteHLToSPPlus6
	pop bc
	push bc
	call GetHLAtSPPlus6
	ld de, $7
	add hl, de
	ld [hl], c
	ld e, c
	ld d, $0
	ld hl, sp+$2f
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $43
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $e
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus6
	ld de, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$30
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $47
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $12
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus6
	ld de, $10
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$31
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4e
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $17
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	push bc
	ld e, c
	ld d, $0
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $52
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	ld de, $1b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ld e, c
	ld d, $0
	ld hl, sp+$30
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4e
	add hl, bc
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld de, $19
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	call GetHLAtSPPlus4
	ld de, $1d
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	call GetHLAtSPPlus4
	ld de, $1f
	add hl, de
	ld a, $f0
	and [hl]
	ld [hl], a
	pop de
	jp Func_31fc0

Func_31d7a: ; 31d7a (c:5d7a)
	push de
	ld hl, sp+$5b
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld [hl], $0
	ld hl, sp+$56
	ld [hl], $0
Func_31d95: ; 31d95 (c:5d95)
	ld hl, sp+$56
	ld a, [hl]
	cp $3
	jp nc, Func_31e1c
	ld hl, sp+$56
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_31e12
	ld hl, sp+$56
	ld l, [hl]
	ld h, $0
	get_party_bot $23
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $23
	call FarCopyVideoData
	ld hl, sp+$4
	push hl
	ld hl, sp+$58
	ld l, [hl]
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call FarCopyVideoData
	ld hl, sp+$56
	ld l, [hl]
	ld h, $0
	get_party_bot $23
	ld [hl], $0
Func_31e12: ; 31e12 (c:5e12)
	ld hl, sp+$56
	ld a, [hl]
	inc a
	ld hl, sp+$56
	ld [hl], a
	jp Func_31d95

Func_31e1c: ; 31e1c (c:5e1c)
	ld hl, sp+$57
	ld [hl], $1
	pop de
	jp Func_31fc0

Func_31e24: ; 31e24 (c:5e24)
	push de
	push bc
	callba_hli Func_7d01
	ld hl, sp+$5a
	ld [hl], a
	pop bc
	pop de
	ld hl, sp+$56
	ld a, [hl]
	cp $ff
	jp z, Func_31f46
	push de
	ld a, e
	cp $5
	jp nz, Func_31e84
	push bc
	ld hl, sp+$5d
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$29
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli Func_6086c
	pop bc
	push bc
	ld e, c
	ld hl, sp+$29
	call FarCall
	pop bc
	ld hl, sp+$3a
	ld [hl], c
	set_farcall_addrs_hli Func_7db0
	ld hl, sp+$33
	reg16swap de, hl
	ld hl, sp+$58
	ld a, [hl]
	call FarCall
	jp Func_31f3e

Func_31e84: ; 31e84 (c:5e84)
	set_farcall_addrs_hli Func_7e56
	ld hl, sp+$5b
	ld e, [hl]
	ld hl, sp+$58
	ld a, [hl]
	call FarCall
	ld a, $3
	call GetSRAMBank
	ld hl, sp+$5b
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld [hl], $0
	ld hl, sp+$56
	ld [hl], $0
Func_31eb7: ; 31eb7 (c:5eb7)
	ld hl, sp+$56
	ld a, [hl]
	cp $3
	jp nc, Func_31f3e
	ld hl, sp+$56
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_31f34
	ld hl, sp+$56
	ld l, [hl]
	ld h, $0
	get_party_bot $23
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $23
	call FarCopyVideoData
	ld hl, sp+$4
	push hl
	ld hl, sp+$58
	ld l, [hl]
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call FarCopyVideoData
	ld hl, sp+$56
	ld l, [hl]
	ld h, $0
	get_party_bot $23
	ld [hl], $0
Func_31f34: ; 31f34 (c:5f34)
	ld hl, sp+$56
	ld a, [hl]
	inc a
	ld hl, sp+$56
	ld [hl], a
	jp Func_31eb7

Func_31f3e: ; 31f3e (c:5f3e)
	ld hl, sp+$57
	ld [hl], $1
	pop de
	jp Func_31fc0

Func_31f46: ; 31f46 (c:5f46)
	jp Func_31fc0

Func_31f49: ; 31f49 (c:5f49)
	push de
	ld hl, sp+$58
	ld [hl], $0
Func_31f4e: ; 31f4e (c:5f4e)
	ld hl, sp+$58
	ld a, [hl]
	cp $4
	jp nc, Func_31fa5
	ld hl, sp+$58
	ld l, [hl]
	ld h, 0
	get_party_bot
	ld a, [hl]
	or a
	jp nz, Func_31f9b
	set_farcall_addrs_hli Func_7e70
	ld hl, sp+$58
	ld e, [hl]
	ld hl, sp+$5b
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_7d39
	ld hl, sp+$5b
	ld a, [hl]
	call FarCall
	ld hl, sp+$57
	ld [hl], $1
	jp Func_31fa5

Func_31f9b: ; 31f9b (c:5f9b)
	ld hl, sp+$58
	ld a, [hl]
	inc a
	ld hl, sp+$58
	ld [hl], a
	jp Func_31f4e

Func_31fa5: ; 31fa5 (c:5fa5)
	pop de
	jp Func_31fc0

Func_31fa9: ; 31fa9 (c:5fa9)
	push de
	set_farcall_addrs_hli Func_7d39
	ld hl, sp+$5b
	ld a, [hl]
	call FarCall
	ld hl, sp+$57
	ld [hl], $1
	pop de
Func_31fc0: ; 31fc0 (c:5fc0)
	push de
	ld hl, sp+$59
	ld a, [hl]
	call GetSRAMBank
	pop de
	push de
	ld hl, sp+$57
	ld a, [hl]
	cp $1
	jp nz, Func_31fee
	ld a, e
	cp $3
	jp z, Func_31fdd
	ld a, e
	cp $4
	jp nz, Func_31fee
Func_31fdd: ; 31fdd (c:5fdd)
	set_farcall_addrs_hli Func_6f43b
	ld hl, sp+$5b
	ld a, [hl]
	call FarCall
Func_31fee: ; 31fee (c:5fee)
	pop de
	ld hl, sp+$55
	ld a, [hl]
	cp $1
	jp nz, Func_32028
	inc e
	dec e
	jp z, Func_32002
	ld a, e
	cp $5
	jp nz, Func_32028
Func_32002: ; 32002 (c:6002)
	set_farcall_addrs_hli Func_53a0d
	ld e, $0
	ld hl, sp+$59
	ld a, [hl]
	call FarCall
	set_farcall_addrs_hli Func_53a0d
	ld e, $1
	ld hl, sp+$59
	ld a, [hl]
	call FarCall
Func_32028: ; 32028 (c:6028)
	ld hl, sp+$55
	ld a, [hl]
Func_3202b: ; 3202b (c:602b)
	add sp, $5a
	ret

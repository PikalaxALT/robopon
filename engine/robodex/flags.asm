Func_53a0d:: ; 53a0d (14:7a0d)
	push bc
	push bc
	cp NUM_ROBOTS + 1
	jp c, Func_53a1c
	cp $af
	jp nc, Func_53a1c
	jp Func_53b1b

Func_53a1c: ; 53a1c (14:7a1c)
	push de
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$7
	ld [hl], a
	pop af
	push af
	dec a
	ld b, $8
	call DivideAbyB
	ld hl, sp+$6
	ld [hl], a
	pop af
	dec a
	and $7
	ld l, a
	pop de
	push hl
	push de
	inc e
	dec e
	jp nz, Func_53a59
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchDexSeenFlags
	add hl, de
	ld c, [hl]
	jp Func_53a63

Func_53a59: ; 53a59 (14:7a59)
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchDexCaughtFlags
	add hl, de
	ld c, [hl]
Func_53a63: ; 53a63 (14:7a63)
	pop de
	pop hl
	ld a, c
	ld b, l
	call RightShiftA
	and $1
	cp $1
	jp nz, Func_53a7a
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	jp Func_53b1b

Func_53a7a: ; 53a7a (14:7a7a)
	ld b, l
	ld a, $1
	call LeftShiftA
	or c
	ld c, a
	inc e
	dec e
	jp nz, Func_53a94
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchDexSeenFlags
	add hl, de
	ld [hl], c
	jp Func_53a9e

Func_53a94: ; 53a94 (14:7a94)
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchDexCaughtFlags
	add hl, de
	ld [hl], c
Func_53a9e: ; 53a9e (14:7a9e)
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld [hl], $0
	ld hl, sp+$0
	ld [hl], $0
Func_53aac: ; 53aac (14:7aac)
	ld hl, sp+$0
	ld a, [hl]
	cp NUM_OBTAINABLE_ROBOTS
	jp nc, Func_53b1b
	ld e, $1
	ld hl, sp+$0
	ld a, [hl]
	call Func_53b1e
	cp $1
	jp nz, Func_53b11
	ld hl, sp+$1
	ld a, [hl]
	inc a
	ld hl, sp+$1
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $95
	jp nz, Func_53aee
	ld hl, sp+$1
	ld a, [hl]
	cp $96
	jp nz, Func_53aeb
	set_farcall_addrs_hli EventFlagAction
	ld e, $1
	ld hl, $f3
	call FarCall
Func_53aeb: ; 53aeb (14:7aeb)
	jp Func_53b11

Func_53aee: ; 53aee (14:7aee)
	ld hl, sp+$0
	ld a, [hl]
	cp $a7
	jp nz, Func_53b11
	ld hl, sp+$1
	ld a, [hl]
	cp $a8
	jp nz, Func_53b11
	set_farcall_addrs_hli EventFlagAction
	ld e, $1
	ld hl, $f4
	call FarCall
Func_53b11: ; 53b11 (14:7b11)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_53aac

Func_53b1b: ; 53b1b (14:7b1b)
	pop bc
	pop bc
	ret

Func_53b1e:: ; 53b1e (14:7b1e)
	push bc
	push de
	push af
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$4
	ld [hl], a
	pop af
	push af
	ld b, $8
	call DivideAbyB
	ld l, a
	pop af
	and $7
	ld c, a
	pop de
	push bc
	inc e
	dec e
	jp nz, Func_53b55
	ld e, l
	ld d, $0
	ld hl, wSaveScratchDexSeenFlags
	add hl, de
	ld a, [hl]
	jp Func_53b5d

Func_53b55: ; 53b55 (14:7b55)
	ld e, l
	ld d, $0
	ld hl, wSaveScratchDexCaughtFlags
	add hl, de
	ld a, [hl]
Func_53b5d: ; 53b5d (14:7b5d)
	push af
	ld hl, sp+$4
	ld a, [hl]
	call GetSRAMBank
	pop af
	pop bc
	ld b, c
	call RightShiftA
	and $1
	pop bc
	ret

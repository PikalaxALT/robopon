INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 17", ROMX, BANK [$17]
Func_5c000:
	ret

Data_5c001:
	db $00, $0a, $14, $1e, $28, $32, $3c, $46

Data_5c009:
	db $50, $5a, $64, $7d, $96, $af, $05, $0f

Data_5c011:
	db $00, $00, $00, $00, $00, $00, $00, $00, $06, $03, $06, $03, $04, $06, $04, $06, $08, $03, $06, $09, $06, $09

Func_5c027:
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_5c03b:
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_5c04f: ; 5c04f (17:404f)
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	call FarCall
	ret

Func_5c060:
	callba_hli Func_5ec5e
	ret

Func_5c06f:
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_e28f
	pop bc
	pop de
	pop hl
	jp FarCall

Func_5c083:
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	ret

INCLUDE "engine/pics/load_pic.asm"

Func_5c328:: ; 5c328 (17:4328)
	push af
	push de
	set_farcall_addrs_hli PushBGMapRegion_
	pop de
	push de
	ld hl, sp+$3
	ld a, [hl]
	ld l, e
	ld h, a
	ld de, $1311
	ld bc, $0
	call FarCall
	pop de
	check_cgb
	jp nz, Func_5c37b
	push de
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	pop de
	ld hl, sp+$1
	ld a, [hl]
	ld l, e
	ld h, a
	ld de, $1323
	ld bc, $12
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_5c37b: ; 5c37b (17:437b)
	call WaitVideoTransfer
	pop bc
	ret

Data_5c380:
	db $03, $02, $00, $01, $04, $05

Func_5c386:: ; 5c386 (17:4386)
	add sp, -$3a
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	push af
	ld hl, sp+$34
	ld [hl], $0
Func_5c3a3: ; 5c3a3 (17:43a3)
	ld hl, sp+$34
	ld a, [hl]
	cp $2
	jp nc, Func_5c43a
	push bc
	ld hl, sp+$36
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$36
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$39
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld e, c
	ld d, b
	ld hl, $5e
	add hl, de
	ld a, [hl]
	cp $6
	jp c, Func_5c3f5
	ld hl, sp+$36
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld [hl], $5
	jp Func_5c40a

Func_5c3f5: ; 5c3f5 (17:43f5)
	ld hl, $5e
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_5c380
	add hl, de
	ld a, [hl]
	ld hl, sp+$36
	ld e, [hl]
	ld d, $0
	ld hl, sp+$34
	add hl, de
	ld [hl], a
Func_5c40a: ; 5c40a (17:440a)
	pop bc
	push bc
	ld hl, $17
	add hl, bc
	ld l, [hl]
	push hl
	ld hl, sp+$38
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	pop de
	call Func_241f
	ld hl, sp+$36
	ld a, [hl]
	inc a
	ld hl, sp+$36
	ld [hl], a
	pop bc
	ld hl, $2f
	add hl, bc
	ld c, l
	ld b, h
	jp Func_5c3a3

Func_5c43a: ; 5c43a (17:443a)
	pop af
	cp $1
	jp nz, Func_5c447
	ld hl, sp+$34
	ld [hl], $1
	jp Func_5c44b

Func_5c447: ; 5c447 (17:4447)
	ld hl, sp+$34
	ld [hl], $0
Func_5c44b: ; 5c44b (17:444b)
	ld hl, sp+$34
	ld a, [hl]
	xor $1
	ld hl, sp+$33
	ld [hl], a
	ld hl, sp+$34
	ld e, [hl]
	ld d, $0
	ld hl, sp+$30
	add hl, de
	ld a, [hl]
	ld hl, sp+$33
	ld e, [hl]
	ld d, $0
	ld hl, sp+$30
	add hl, de
	cp [hl]
	jp c, Func_5c495
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	ld l, a
	ld h, $0
	ld a, l
	sub $2
	or h
	jp nz, Func_5c49b
Func_5c495: ; 5c495 (17:4495)
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c49b: ; 5c49b (17:449b)
	ld hl, sp+$33
	ld e, [hl]
	ld d, $0
	ld hl, sp+$30
	add hl, de
	ld a, [hl]
	ld hl, sp+$34
	ld e, [hl]
	ld d, $0
	ld hl, sp+$30
	add hl, de
	cp [hl]
	jp c, Func_5c4dd
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $6f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	ld l, a
	ld h, $0
	ld a, l
	sub $2
	or h
	jp nz, Func_5c4e3
Func_5c4dd: ; 5c4dd (17:44dd)
	ld hl, sp+$33
	ld a, [hl]
	jp Func_5c691

Func_5c4e3: ; 5c4e3 (17:44e3)
	ld hl, sp+$34
	ld e, [hl]
	ld d, $0
	ld hl, sp+$30
	add hl, de
	ld a, [hl]
	cp $3
	jp z, Func_5c4f7
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c4f7: ; 5c4f7 (17:44f7)
	read_hl_from_sp_plus $37
	ld de, $5f
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5c511
	read_hl_from_sp_plus $39
	ld de, $5f
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5c608
Func_5c511: ; 5c511 (17:4511)
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a8
	inc hl
	or [hl]
	jp nz, Func_5c536
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c536: ; 5c536 (17:4536)
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a8
	inc hl
	or [hl]
	jp nz, Func_5c57d
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a8
	inc hl
	or [hl]
	jp z, Func_5c57a
	ld hl, sp+$33
	ld a, [hl]
	jp Func_5c691

Func_5c57a: ; 5c57a (17:457a)
	jp Func_5c608

Func_5c57d: ; 5c57d (17:457d)
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a9
	inc hl
	or [hl]
	jp nz, Func_5c5c4
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a9
	inc hl
	or [hl]
	jp z, Func_5c5c1
	ld hl, sp+$33
	ld a, [hl]
	jp Func_5c691

Func_5c5c1: ; 5c5c1 (17:45c1)
	jp Func_5c608

Func_5c5c4: ; 5c5c4 (17:45c4)
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a9
	inc hl
	or [hl]
	jp nz, Func_5c608
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	mulhlby24
	reg16swap de, hl
	ld hl, sp+$0
	add hl, de
	ld de, $13
	add hl, de
	ld a, [hl]
	sub $a9
	inc hl
	or [hl]
	jp z, Func_5c608
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c608: ; 5c608 (17:4608)
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $64
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_5c643
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c643: ; 5c643 (17:4643)
	ld hl, sp+$33
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $64
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$34
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$35
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_5c67e
	ld hl, sp+$33
	ld a, [hl]
	jp Func_5c691

Func_5c67e: ; 5c67e (17:467e)
	ld a, $64
	call Func_5c04f
	cp $33
	jp c, Func_5c68e
	ld hl, sp+$34
	ld a, [hl]
	jp Func_5c691

Func_5c68e: ; 5c68e (17:468e)
	ld hl, sp+$33
	ld a, [hl]
Func_5c691: ; 5c691 (17:4691)
	add sp, $3a
	ret

Func_5c694:: ; 5c694 (17:4694)
	push hl
	add sp, -$18
	read_hl_from_sp_plus $1a
	ld de, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5c6aa
	ld a, $e
	jp Func_5c6e0

Func_5c6aa: ; 5c6aa (17:46aa)
	read_hl_from_sp_plus $1a
	ld de, $22
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_5c011
	add hl, de
	ld l, [hl]
	inc l
	dec l
	jp z, Func_5c6c3
	ld a, l
	jp Func_5c6e0

Func_5c6c3: ; 5c6c3 (17:46c3)
	read_hl_from_sp_plus $1a
	ld de, $b
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	call Func_241f
	read_hl_from_sp_plus $15
	ld a, l
	and $80
	jp z, Func_5c6dd
	ld l, $0
Func_5c6dd: ; 5c6dd (17:46dd)
	ld a, l
	and $f
Func_5c6e0: ; 5c6e0 (17:46e0)
	add sp, $1a
	ret

Func_5c6e3:: ; 5c6e3 (17:46e3)
	push hl
	add sp, -$18
	read_hl_from_sp_plus $1a
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5c6f9
	ld a, $e
	jp Func_5c72f

Func_5c6f9: ; 5c6f9 (17:46f9)
	read_hl_from_sp_plus $1a
	ld de, $2e
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_5c011
	add hl, de
	ld l, [hl]
	inc l
	dec l
	jp z, Func_5c712
	ld a, l
	jp Func_5c72f

Func_5c712: ; 5c712 (17:4712)
	read_hl_from_sp_plus $1a
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	call Func_241f
	read_hl_from_sp_plus $15
	ld a, l
	and $80
	jp z, Func_5c72c
	ld l, $0
Func_5c72c: ; 5c72c (17:472c)
	ld a, l
	and $f
Func_5c72f: ; 5c72f (17:472f)
	add sp, $1a
	ret

Func_5c732:: ; 5c732 (17:4732)
	ld c, l
	ld l, h
	ld a, e
	and $80
	jp z, Func_5c73d
	jp Func_5c73e

Func_5c73d: ; 5c73d (17:473d)
	ld l, c
Func_5c73e: ; 5c73e (17:473e)
	ld a, e
	and $7f
	cp $3
	jp z, Func_5c78a
	cp $2
	jp z, Func_5c776
	cp $1
	jp z, Func_5c768
	or a
	jp nz, Func_5c795
	ld a, l
	rrca
	rrca
	rrca
	rrca
	and $f
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_5c001
	add hl, de
	ld a, [hl]
	jp Func_5c795

Func_5c768: ; 5c768 (17:4768)
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_5c001
	add hl, de
	ld a, [hl]
	jp Func_5c795

Func_5c776: ; 5c776 (17:4776)
	ld a, l
	rrca
	rrca
	rrca
	rrca
	and $f
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_5c009
	add hl, de
	ld a, [hl]
	jp Func_5c795

Func_5c78a: ; 5c78a (17:478a)
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_5c009
	add hl, de
	ld a, [hl]
Func_5c795: ; 5c795 (17:4795)
	ret

Func_5c796:: ; 5c796 (17:4796)
	add sp, -$4e
	push af
	ld hl, sp+$4e
	ld [hl], $0
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	or a
	jp nz, Func_5c7b3
	ld hl, $0
	jp Func_5c7b6

Func_5c7b3: ; 5c7b3 (17:47b3)
	ld hl, $2f
Func_5c7b6: ; 5c7b6 (17:47b6)
	add hl, de
	write_hl_to_sp_plus $42
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	xor $1
	jp nz, Func_5c7d2
	ld hl, $0
	jp Func_5c7d5

Func_5c7d2: ; 5c7d2 (17:47d2)
	ld hl, $2f
Func_5c7d5: ; 5c7d5 (17:47d5)
	add hl, de
	write_hl_to_sp_plus $40
	pop af
	ld l, a
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $44
	ld l, a
	ld h, $0
	ld a, l
	xor $1
	ld l, a
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $42
	read_hl_from_sp_plus $44
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5c82f
	jp Func_5cdad

Func_5c82f: ; 5c82f (17:482f)
	read_hl_from_sp_plus $40
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$24
	call Func_241f
	read_hl_from_sp_plus $39
	write_hl_to_sp_plus $4c
	push hl
	read_hl_from_sp_plus $46
	ld de, $67
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $44
	ld de, $5f
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $46
	pop de
	add hl, de
	ld c, l
	ld b, h
	push af
	ld a, [bc]
	cp $fe
	jp z, Func_5c877
	or a
	jp nz, Func_5c8e2
	jp Func_5c991

Func_5c877: ; 5c877 (17:4877)
	push bc
	ld l, c
	ld h, b
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $48
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$17
	call GetMove
	ld hl, sp+$1c
	ld a, [hl]
	ld hl, sp+$50
	ld [hl], a
	read_hl_from_sp_plus $25
	write_hl_to_sp_plus $50
	pop bc
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $4
	jp z, Func_5c8df
	read_hl_from_sp_plus $46
	ld de, $71
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	inc hl
	ld b, [hl]
	ld hl, $1
	call LeftShiftHL
	ld a, e
	and l
	ld l, a
	ld a, d
	and h
	ld h, a
	ld a, l
	or h
	jp z, Func_5c8dc
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
	jp Func_5c8df

Func_5c8dc: ; 5c8dc (17:48dc)
	jp Func_5c913

Func_5c8df: ; 5c8df (17:48df)
	jp Func_5c991

Func_5c8e2: ; 5c8e2 (17:48e2)
	ld a, BANK(Data_64c90)
	ld [wFarCallDestBank], a
	ld a, [bc]
	ld l, a
	ld h, $0
	mulhlby19
	ld de, Data_64c90 - $13
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $13
	call FarCopyVideoData
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$4e
	ld [hl], a
	read_hl_from_sp_plus $10
	write_hl_to_sp_plus $4e
Func_5c913: ; 5c913 (17:4913)
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $4
	jp z, Func_5c991
	read_hl_from_sp_plus $46
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	or h
	jp z, Func_5c976
	read_hl_from_sp_plus $46
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	dec hl
	reg16swap de, hl
	ld hl, sp+$4e
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nz, Func_5c976
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
	jp Func_5c991

Func_5c976: ; 5c976 (17:4976)
	read_hl_from_sp_plus $46
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp z, Func_5c991
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
Func_5c991: ; 5c991 (17:4991)
	read_hl_from_sp_plus $46
	ld de, $64
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $44
	ld de, $64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_5c9b4
	ld bc, $46
	jp Func_5c9ea

Func_5c9b4: ; 5c9b4 (17:49b4)
	ld hl, sp+$46
	ld c, l
	ld b, h
	read_hl_from_sp_plus $44
	ld de, $64
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $48
	ld de, $64
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_2617
	ld hl, sp+$46
	ld c, l
	ld b, h
	ld de, $46
	ld hl, sp+$46
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$47
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
Func_5c9ea: ; 5c9ea (17:49ea)
	pop af
	read_hl_from_sp_plus $44
	ld de, $4e
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $44
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $5
	jp nz, Func_5ca1b
	ld l, c
	ld h, b
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
Func_5ca1b: ; 5ca1b (17:4a1b)
	push bc
	read_hl_from_sp_plus $44
	ld de, $71
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_5cb18
	read_hl_from_sp_plus $44
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $2
	jp z, Func_5caaa
	ld hl, sp+$4e
	ld a, [hl]
	cp $1
	jp z, Func_5ca57
	cp $5
	jp nz, Func_5caa7
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $2
	call MultiplyPointerByDE
	jp Func_5caa7

Func_5ca57: ; 5ca57 (17:4a57)
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $2
	call DividePointerByDESigned
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5caa7
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_5caa7: ; 5caa7 (17:4aa7)
	jp Func_5cb18

Func_5caaa: ; 5caaa (17:4aaa)
	ld hl, sp+$4e
	ld a, [hl]
	cp $5
	jp z, Func_5cac8
	cp $1
	jp nz, Func_5cb18
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $2
	call MultiplyPointerByDE
	jp Func_5cb18

Func_5cac8: ; 5cac8 (17:4ac8)
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $2
	call DividePointerByDESigned
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5cb18
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_5cb18: ; 5cb18 (17:4b18)
	read_hl_from_sp_plus $44
	ld de, $62
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $46
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub c
	ld l, a
	ld a, d
	sbc b
	ld h, a
	write_hl_to_sp_plus $4c
	read_hl_from_sp_plus $42
	ld de, $13
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $4c
	call CompareHLtoBC
	jp nc, Func_5cb5c
	read_hl_from_sp_plus $42
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	write_hl_to_sp_plus $4c
Func_5cb5c: ; 5cb5c (17:4b5c)
	read_hl_from_sp_plus $42
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $3
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4c
	call CompareHLtoBC
	jp c, Func_5cb9d
	read_hl_from_sp_plus $46
	ld de, $5f
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5cb9d
	read_hl_from_sp_plus $42
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, $3
	call DivideHLByDESigned
	write_hl_to_sp_plus $4c
Func_5cb9d: ; 5cb9d (17:4b9d)
	read_hl_from_sp_plus $4c
	add hl, hl
	ld de, $3
	call DivideHLByDESigned
	push hl
	read_hl_from_sp_plus $4e
	ld de, $3
	call DivideHLByDESigned
	inc hl
	ld a, l
	call Func_5c04f
	ld l, a
	ld h, $0
	pop de
	add hl, de
	inc hl
	write_hl_to_sp_plus $4c
	ld hl, sp+$46
	ld c, l
	ld b, h
	ld hl, sp+$4e
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $42
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_5c06f
	read_hl_from_sp_plus $46
	ld de, $c7
	add hl, de
	ld [hl], a
	ld hl, sp+$46
	ld c, l
	ld b, h
	read_hl_from_sp_plus $4c
	reg16swap de, hl
	ld hl, sp+$46
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$46
	ld a, [hl]
	ld hl, sp+$47
	ld l, [hl]
	ld h, a
	write_hl_to_sp_plus $4c
	ld a, l
	or h
	jp nz, Func_5cc0e
	ld hl, $1
	write_hl_to_sp_plus $4c
Func_5cc0e: ; 5cc0e (17:4c0e)
	pop bc
	read_hl_from_sp_plus $42
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $40
	jp z, Func_5cc20
	ld bc, $0
Func_5cc20: ; 5cc20 (17:4c20)
	read_hl_from_sp_plus $4c
	ld a, l
	and $80
	jp z, Func_5cd02
	read_hl_from_sp_plus $4c
	ld a, l
	and $7f
	ld l, a
	ld h, $0
	ld a, l
	sub $1e
	or h
	jp z, Func_5ccef
	ld a, l
	sub $19
	or h
	jp z, Func_5ccd9
	ld a, l
	sub $17
	or h
	jp z, Func_5ccc6
	ld a, l
	sub $18
	or h
	jp nz, Func_5ccff
	push bc
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	ld l, a
	ld h, $0
	ld a, l
	cp $3
	jp z, Func_5cca9
	cp $1
	jp z, Func_5cca9
	cp $2
	jp z, Func_5cca0
	or a
	jp nz, Func_5ccc2
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld a, e
	or $10
	ld c, a
	ld b, d
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_5ccc2

Func_5cca0: ; 5cca0 (17:4ca0)
	read_hl_from_sp_plus $4c
	add hl, hl
	write_hl_to_sp_plus $4c
Func_5cca9: ; 5cca9 (17:4ca9)
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $cf
	ld c, a
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $46
	ld de, $6f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_5ccc2: ; 5ccc2 (17:4cc2)
	pop bc
	jp Func_5ccff

Func_5ccc6: ; 5ccc6 (17:4cc6)
	push bc
	read_hl_from_sp_plus $4c
	ld de, $a
	call DivideHLByDESigned
	write_hl_to_sp_plus $4c
	pop bc
	jp Func_5ccff

Func_5ccd9: ; 5ccd9 (17:4cd9)
	read_hl_from_sp_plus $4a
	add hl, hl
	write_hl_to_sp_plus $4a
	ld l, c
	ld h, b
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	jp Func_5ccff

Func_5ccef: ; 5ccef (17:4cef)
	push bc
	read_hl_from_sp_plus $4c
	ld de, $2
	call DivideHLByDESigned
	write_hl_to_sp_plus $4c
	pop bc
Func_5ccff: ; 5ccff (17:4cff)
	jp Func_5cd16

Func_5cd02: ; 5cd02 (17:4d02)
	read_hl_from_sp_plus $4c
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld a, l
	sub $d
	or h
	jp nz, Func_5cd16
	ld bc, $64
Func_5cd16: ; 5cd16 (17:4d16)
	push bc
	read_hl_from_sp_plus $44
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $4
	jp nz, Func_5cd33
	read_hl_from_sp_plus $4c
	ld de, $2
	call DivideHLByDESigned
	write_hl_to_sp_plus $4c
Func_5cd33: ; 5cd33 (17:4d33)
	pop bc
	read_hl_from_sp_plus $42
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $5
	jp nz, Func_5cd4c
	ld l, c
	ld h, b
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
Func_5cd4c: ; 5cd4c (17:4d4c)
	ld hl, sp+$4c
	ld a, [hl]
	read_hl_from_sp_plus $44
	ld de, $66
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $4c
	push hl
	read_hl_from_sp_plus $46
	ld de, $69
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_5cd7a
	ld bc, $1
	jp Func_5cd7a

Func_5cd7a: ; 5cd7a (17:4d7a)
	read_hl_from_sp_plus $44
	ld de, $6b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $4a
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_5cd9c
	ld bc, $1
	jp Func_5cda2

Func_5cd9c: ; 5cd9c (17:4d9c)
	read_hl_from_sp_plus $4a
	ld c, l
	ld b, h
Func_5cda2: ; 5cda2 (17:4da2)
	read_hl_from_sp_plus $44
	ld de, $6d
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_5cdad: ; 5cdad (17:4dad)
	add sp, $4e
	ret

Func_5cdb0:: ; 5cdb0 (17:4db0)
	push bc
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	ld hl, $60
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	ld hl, $62
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, $64
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1c5
	add hl, de
	ld a, [hl]
	cp $ff
	jp nz, Func_5cdf0
	jp Func_5cf19

Func_5cdf0: ; 5cdf0 (17:4df0)
	push bc
	cp $8
	jp z, Func_5ce98
	cp $7
	jp z, Func_5ce8e
	cp $6
	jp z, Func_5ce79
	cp $5
	jp z, Func_5ce6a
	cp $4
	jp z, Func_5ce60
	cp $3
	jp z, Func_5ce4b
	cp $2
	jp z, Func_5ce3c
	cp $1
	jp z, Func_5ce32
	or a
	jp nz, Func_5cea4
	call GetHLAtSPPlus8
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	add hl, bc
	call WriteHLToSPPlus8
	jp Func_5cea4

Func_5ce32: ; 5ce32 (17:4e32)
	call GetHLAtSPPlus8
	add hl, hl
	call WriteHLToSPPlus8
	jp Func_5cea4

Func_5ce3c: ; 5ce3c (17:4e3c)
	call GetHLAtSPPlus8
	ld de, $2
	call DivideHLByDESigned
	call WriteHLToSPPlus8
	jp Func_5cea4

Func_5ce4b: ; 5ce4b (17:4e4b)
	call GetHLAtSPPlus6
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	add hl, bc
	call WriteHLToSPPlus6
	jp Func_5cea4

Func_5ce60: ; 5ce60 (17:4e60)
	call GetHLAtSPPlus6
	add hl, hl
	call WriteHLToSPPlus6
	jp Func_5cea4

Func_5ce6a: ; 5ce6a (17:4e6a)
	call GetHLAtSPPlus6
	ld de, $2
	call DivideHLByDESigned
	call WriteHLToSPPlus6
	jp Func_5cea4

Func_5ce79: ; 5ce79 (17:4e79)
	call GetHLAtSPPlus4
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	add hl, bc
	call WriteHLToSPPlus4
	jp Func_5cea4

Func_5ce8e: ; 5ce8e (17:4e8e)
	call GetHLAtSPPlus4
	add hl, hl
	call WriteHLToSPPlus4
	jp Func_5cea4

Func_5ce98: ; 5ce98 (17:4e98)
	call GetHLAtSPPlus4
	ld de, $2
	call DivideHLByDESigned
	call WriteHLToSPPlus4
Func_5cea4: ; 5cea4 (17:4ea4)
	call GetHLAtSPPlus8
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_5ceba
	ld hl, $1
	call WriteHLToSPPlus8
Func_5ceba: ; 5ceba (17:4eba)
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_5ced0
	ld hl, $1
	call WriteHLToSPPlus6
Func_5ced0: ; 5ced0 (17:4ed0)
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_5cee6
	ld hl, $1
	call WriteHLToSPPlus4
Func_5cee6: ; 5cee6 (17:4ee6)
	pop bc
	ld hl, $5e
	add hl, bc
	ld a, [hl]
	or a
	jp nz, Func_5cefe
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $60
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
Func_5cefe: ; 5cefe (17:4efe)
	call GetHLAtSPPlus4
	reg16swap de, hl
	ld hl, $62
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	reg16swap de, hl
	ld hl, $64
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
Func_5cf19: ; 5cf19 (17:4f19)
	pop bc
	pop bc
	pop bc
	ret

Func_5cf1d:: ; 5cf1d (17:4f1d)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	ld c, $0
Func_5cf2f: ; 5cf2f (17:4f2f)
	ld a, c
	cp $a
	jp nc, Func_5cf73
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	call GetHLAtSPPlus4
	ld de, $17
	add hl, de
	pop de
	add hl, de
	push hl
	call GetHLAtSPPlus4
	inc hl
	inc hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	inc hl
	inc hl
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld [hl], $0
	inc c
	jp Func_5cf2f

Func_5cf73: ; 5cf73 (17:4f73)
	pop hl
	push hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	push hl
	ld de, $16
	add hl, de
	ld [hl], $0
	pop bc
	ret

Func_5cf85:: ; 5cf85 (17:4f85)
	push hl
	push de
	add sp, -$20
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $20
	read_hl_from_sp_plus $20
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5cfb7
	read_hl_from_sp_plus $20
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $20
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_5d00a

Func_5cfb7: ; 5cfb7 (17:4fb7)
	ld hl, sp+$20
	ld c, [hl]
	read_hl_from_sp_plus $24
	reg16swap de, hl
	ld hl, sp+$0
	call FarCopyUntilNull
	read_hl_from_sp_plus $20
	ld de, $16
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	push hl
	read_hl_from_sp_plus $22
	inc hl
	inc hl
	pop de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call FindFirstNonzero
	push hl
	ld hl, sp+$2
	call FindFirstNonzero
	pop de
	add hl, de
	reg16swap de, hl
	ld hl, $12
	call CompareHLtoDE
	jp nc, Func_5d00a
	ld hl, sp+$20
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $26
	pop de
	call Func_5d02d
	jp Func_5d02a

Func_5d00a: ; 5d00a (17:500a)
	ld hl, sp+$20
	ld c, [hl]
	read_hl_from_sp_plus $24
	push hl
	read_hl_from_sp_plus $22
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call FarCopyUntilNull
	ld c, l
	ld b, h
	read_hl_from_sp_plus $20
	ld [hl], c
	inc hl
	ld [hl], b
Func_5d02a: ; 5d02a (17:502a)
	add sp, $24
	ret

Func_5d02d:: ; 5d02d (17:502d)
	push hl
	push de
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_5d052
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_5d07e

Func_5d052: ; 5d052 (17:5052)
	push bc
	ld hl, $16
	add hl, bc
	ld a, $1
	add [hl]
	ld [hl], a
	cp $9
	jp c, Func_5d068
	ld e, $0
	ld hl, Data_5d084
	call Func_2a3e
Func_5d068: ; 5d068 (17:5068)
	pop bc
	ld hl, $16
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, c
	ld d, b
	inc de
	inc de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	ld [hl], e
	inc hl
	ld [hl], d
Func_5d07e: ; 5d07e (17:507e)
	pop de
	pop hl
	call Func_5cf85
	ret

Data_5d084:
	dstr "ハﾞトル メッセーシﾞ オーハﾞー"

Func_5d096:: ; 5d096 (17:5096)
	push bc
	push af
	read_hl_from wCurRobotPointer
	ld de, $1c6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	call GetHLAtSPPlus4
	ld de, $16
	add hl, de
	ld a, $1
	add [hl]
	ld [hl], a
	ld l, a
	ld h, $0
	add hl, hl
	push hl
	call GetHLAtSPPlus6
	inc hl
	inc hl
	pop de
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	set_farcall_addrs_hli PrintMapText
	pop af
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	ld de, $109
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	inc hl
	inc hl
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	call Func_5cf1d
	pop bc
	ret

Func_5d107:: ; 5d107 (17:5107)
	ld a, $2
	call Func_5d096
	ret

Func_5d10d:: ; 5d10d (17:510d)
	ld a, $3
	call Func_5d096
	ret

Func_5d113:: ; 5d113 (17:5113)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	reg16swap de, hl
	push de
	ld hl, $8
	add hl, de
	ld a, [hl]
	and $4
	jp nz, Func_5d151
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
Func_5d151: ; 5d151 (17:5151)
	pop de
	ld hl, $9
	add hl, de
	ld a, [hl]
	and $4
	jp nz, Func_5d183
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	reg16swap de, hl
	ld hl, $b05
	call FarCall
Func_5d183: ; 5d183 (17:5183)
	ret

Func_5d184:: ; 5d184 (17:5184)
	add sp, -$40
	push af
	xor a
	pop af
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	or a
	jp nz, Func_5d1a0
	ld hl, $0
	jp Func_5d1a3

Func_5d1a0: ; 5d1a0 (17:51a0)
	ld hl, $2f
Func_5d1a3: ; 5d1a3 (17:51a3)
	add hl, de
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	xor $1
	jp nz, Func_5d1bd
	ld hl, $0
	jp Func_5d1c0

Func_5d1bd: ; 5d1bd (17:51bd)
	ld hl, $2f
Func_5d1c0: ; 5d1c0 (17:51c0)
	add hl, de
	pop af
	push bc
	ld l, a
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $40
	ld l, a
	ld h, $0
	ld a, l
	xor $1
	ld l, a
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	read_hl_from_sp_plus $40
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $4
	ld [hl], a
	inc hl
	pop bc
	read_hl_from_sp_plus $3e
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5d221
	jp Func_5d348

Func_5d221: ; 5d221 (17:5221)
	ld hl, $17
	add hl, bc
	ld e, [hl]
	ld hl, sp+$24
	call Func_241f
	read_hl_from_sp_plus $39
	read_hl_from_sp_plus $3e
	ld de, $5f
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $40
	pop de
	add hl, de
	write_hl_to_sp_plus $40
	read_hl_from_sp_plus $40
	ld a, [hl]
	cp $fe
	jp z, Func_5d259
	or a
	jp nz, Func_5d2b1
	jp Func_5d348

Func_5d259: ; 5d259 (17:5259)
	read_hl_from_sp_plus $40
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $3e
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$13
	call GetMove
	ld hl, sp+$18
	ld c, [hl]
	read_hl_from_sp_plus $21
	read_hl_from_sp_plus $40
	inc hl
	ld b, [hl]
	ld hl, $1
	call LeftShiftHL
	push hl
	read_hl_from_sp_plus $40
	ld de, $71
	add hl, de
	pop de
	ld a, e
	and [hl]
	ld e, a
	inc hl
	ld a, d
	and [hl]
	ld d, a
	ld a, e
	or d
	jp z, Func_5d2ab
	read_hl_from_sp_plus $3e
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
	jp Func_5d2ae

Func_5d2ab: ; 5d2ab (17:52ab)
	jp Func_5d2de

Func_5d2ae: ; 5d2ae (17:52ae)
	jp Func_5d348

Func_5d2b1: ; 5d2b1 (17:52b1)
	ld a, BANK(Data_64c90)
	ld [wFarCallDestBank], a
	read_hl_from_sp_plus $40
	ld l, [hl]
	ld h, $0
	mulhlby19
	ld de, Data_64c90 - $13
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld bc, $13
	call FarCopyVideoData
	ld hl, sp+$12
	ld c, [hl]
	read_hl_from_sp_plus $e
Func_5d2de: ; 5d2de (17:52de)
	read_hl_from_sp_plus $3e
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	or h
	jp z, Func_5d32d
	read_hl_from_sp_plus $3e
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	ld e, a
	inc hl
	ld d, $0
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	dec hl
	ld e, c
	ld d, $0
	call CompareHLtoDE
	jp nz, Func_5d32d
	read_hl_from_sp_plus $3e
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
	jp Func_5d348

Func_5d32d: ; 5d32d (17:532d)
	read_hl_from_sp_plus $3e
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp z, Func_5d348
	read_hl_from_sp_plus $3e
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
Func_5d348: ; 5d348 (17:5348)
	add sp, $40
	ret

Func_5d34b:
	push hl
	push de
	set_farcall_addrs_hli MenuWithSecondaryHeader
	pop de
	pop hl
	ld c, $8
	jp FarCall

Func_5d35f: ; 5d35f (17:535f)
	push af
	add sp, -$54
	xor a
.loop
	ld hl, sp+$55
	cp [hl]
	jp nc, .break
	push af
	set_farcall_addrs_hli GetRobotInParty
	pop af
	push af
	ld hl, sp+$2
	reg16swap de, hl
	call FarCall
	ld hl, sp+$2
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$25
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$2a
	ld e, [hl]
	push de
	set_farcall_addrs_hli LookUpRobotSpriteImage
	pop de
	ld a, e
	ld hl, sp+$21
	ld e, [hl]
	call FarCall
	ld e, a
	pop af
	push af
	add a
	add a
	ld d, a
	add a
	add d
	ld hl, sp+$55
	ld [hl], a
	ld hl, sp+$54
	ld [hl], e
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$55
	ld a, [hl]
	ld hl, sp+$54
	ld l, [hl]
	ld h, a
	call FarCall
	pop af
	inc a
	jp .loop

.break
	add sp, $56
	ret

Func_5d3d6: ; 5d3d6 (17:53d6)
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, .selectMap1
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp .ret

.selectMap1
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
.ret
	ret

Func_5d3f1: ; 5d3f1 (17:53f1)
.wait
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .wait
	ret

Func_5d3fc:
	push hl
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_5d43b
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $d
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5d432
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5d438
Func_5d432: ; 5d432 (17:5432)
	ld hl, $4000
	jp Func_5d4a2

Func_5d438: ; 5d438 (17:5438)
	jp Func_5d49f

Func_5d43b: ; 5d43b (17:543b)
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5d453
	ld hl, $4000
	jp Func_5d4a2

Func_5d453: ; 5d453 (17:5453)
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_5d49f
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	ld d, a
	add a
	add d
	inc a
	ld e, a
	xor a
	call SetStringStartState
	ld hl, Data_5d4a4
	push hl
	call PlaceString
	pop bc
	pop hl
	push hl
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld [hl], $ff
	pop hl
	push hl
	call Func_5de14
	ld hl, $4000
	jp Func_5d4a2

Func_5d49f: ; 5d49f (17:549f)
	ld hl, -1
Func_5d4a2: ; 5d4a2 (17:54a2)
	pop bc
	ret

Data_5d4a4:
	dstr " "

Func_5d4a6:
	push hl
	add sp, -$68
	push bc
	ld hl, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	read_hl_from_sp_plus $6e
	ld e, h
	ld hl, sp+$6b
	ld [hl], e
	read_hl_from_sp_plus $6e
	ld e, l
	ld hl, sp+$6a
	ld [hl], e
	set_farcall_addrs_hli GetRobotInParty
	pop af
	pop bc
	push af
	ld a, c
	ld hl, sp+$45
	reg16swap de, hl
	call FarCall
	ld hl, sp+$46
	reg16swap de, hl
	ld hl, sp+$2
	call LiteralStringInTree
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$69
	ld a, [hl]
	ld hl, sp+$68
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld a, $19
	ld [wFarCallDestBank], a
	ld hl, sp+$5b
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, $6f37
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	call LiteralStringInTree
	ld hl, sp+$2
	push hl
	ld hl, sp+$6a
	ld c, [hl]
	ld b, $0
	inc bc
	ld hl, sp+$6b
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $500
	add hl, de
	add hl, bc
	pop de
	call PlaceStringDEatCoordHL
	ld hl, sp+$68
	ld c, [hl]
	ld b, $0
	ld hl, sp+$69
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	ld de, Data_5d65a
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $53
	ld c, l
	ld b, h
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_5d65d
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $55
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, sp+$68
	ld c, [hl]
	ld b, $0
	inc bc
	ld hl, sp+$69
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	ld de, Data_5d65f
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $57
	ld c, l
	ld b, h
	ld de, $3
	ld hl, -1
	call Func_2230
	ld hl, Data_5d662
	push hl
	call PlaceString
	pop bc
	read_hl_from_sp_plus $59
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
	ld de, Data_5d664
	ld hl, sp+$69
	ld a, [hl]
	ld hl, sp+$68
	ld l, [hl]
	ld h, a
	inc hl
	call PlaceStringDEatCoordHL
	ld hl, sp+$4c
	ld c, [hl]
	ld b, $0
	ld de, $103
	ld hl, -1
	call Func_2230
	ld hl, Data_5d667
	push hl
	call PlaceString
	pop bc
	pop af
	cp $3
	jp nz, Func_5d657
	ld hl, sp+$43
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$14
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$16
	ld a, [hl]
	or a
	jp z, Func_5d63d
	read_hl_from_sp_plus $19
	push hl
	read_hl_from_sp_plus $64
	pop de
	call CompareHLtoDE
	jp c, Func_5d611
	ld hl, sp+$66
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	inc hl
	inc hl
	ld de, Data_5d669
	call PlaceStringDEatCoordHL
	jp Func_5d63a

Func_5d611: ; 5d611 (17:5611)
	ld hl, sp+$66
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	inc hl
	inc hl
	ld de, Data_5d672
	call PlaceStringDEatCoordHL
	read_hl_from_sp_plus $62
	ld c, l
	ld b, h
	ld de, $103
	ld hl, -1
	call Func_2230
Func_5d63a: ; 5d63a (17:563a)
	jp Func_5d657

Func_5d63d: ; 5d63d (17:563d)
	ld hl, sp+$66
	ld c, [hl]
	ld b, $0
	ld hl, sp+$67
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $800
	add hl, de
	add hl, bc
	inc hl
	inc hl
	ld de, Data_5d676
	call PlaceStringDEatCoordHL
Func_5d657: ; 5d657 (17:5657)
	add sp, $6a
	ret

Data_5d65a:
	dstr "Hp"

Data_5d65d:
	dstr "/"

Data_5d65f:
	dstr "Ep"

Data_5d662:
	dstr "/"

Data_5d664:
	dstr "LV"

Data_5d667:
	dstr ":"

Data_5d669:
	dstr "(ひかっている)"

Data_5d672:
	dstr "エネ:"

Data_5d676:
	dstr "(しんか しない)"

Data_5d680:
	db $00, $01, $00, $02

Func_5d684: ; 5d684 (17:5684)
	push hl
	push de
	push bc
	push bc
	callba_hli Func_da4dc
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$0
	ld [hl], a
	ld c, $0
Func_5d6b6: ; 5d6b6 (17:56b6)
	ld a, c
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $7
	add hl, de
	cp [hl]
	jp nc, Func_5d730
	push bc
	ld a, c
	add a
	add a
	ld d, a
	add a
	add d
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$5
	ld [hl], $10
	ld b, c
	ld hl, sp+$2
	ld a, [hl]
	add a
	add a
	add a
	call MultiplyAbyB
	add $18
	ld hl, sp+$4
	ld [hl], a
	call GetHLAtSPPlus8
	ld a, [hl]
	cp $1
	jp c, Func_5d6fe
	inc a
	cp $5
	jp nz, Func_5d6f7
	ld a, $1
Func_5d6f7: ; 5d6f7 (17:56f7)
	call GetHLAtSPPlus8
	ld [hl], a
	jp Func_5d700

Func_5d6fe: ; 5d6fe (17:56fe)
	ld a, $1
Func_5d700: ; 5d700 (17:5700)
	push af
	set_farcall_addrs_hli UpdateCurSprite
	pop af
	ld e, a
	ld d, $0
	ld hl, Data_5d680 - 1
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$5
	ld h, [hl]
	ld d, h
	ld hl, sp+$3
	ld a, [hl]
	call FarCall
	pop bc
	inc c
	call GetHLAtSPPlus6
	inc hl
	call WriteHLToSPPlus6
	jp Func_5d6b6

Func_5d730: ; 5d730 (17:5730)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_5d735:
	db $0, $0, $0, $0

Func_5d739: ; 5d739 (17:5739)
	push bc
	push bc
	push bc
	push bc
	push hl
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_5d735
	ld bc, $4
	call MemCopy
	pop hl
	call WriteHLToSPPlus7
	call GetHLAtSPPlus7
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	call GetHLAtSPPlus7
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus9
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	ld c, [hl]
	pop af
	push bc
	push af
	ld c, $0
Func_5d779: ; 5d779 (17:5779)
	ld a, c
	read_hl_from_sp_plus $b
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $7
	add hl, de
	cp [hl]
	jp nc, Func_5d7ac
	read_hl_from_sp_plus $b
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, $0
	inc hl
	inc hl
	inc hl
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], a
	inc c
	jp Func_5d779

Func_5d7ac: ; 5d7ac (17:57ac)
	pop af
	cp $3
	jp z, Func_5d805
	cp $8
	jp z, Func_5d7d4
	cp $7
	jp z, Func_5d7d4
	cp $6
	jp z, Func_5d7d4
	cp $5
	jp z, Func_5d7d4
	cp $2
	jp z, Func_5d7d4
	cp $1
	jp z, Func_5d7d4
	or a
	jp nz, Func_5d833
Func_5d7d4: ; 5d7d4 (17:57d4)
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $c
	call FarCall
	jp Func_5d833

Func_5d805: ; 5d805 (17:5805)
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_101be
	ld bc, $81
	ld de, $14
	ld hl, $10
	call FarCall
Func_5d833: ; 5d833 (17:5833)
	ld hl, sp+$6
	ld [hl], $0
	pop bc
Func_5d838: ; 5d838 (17:5838)
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus7
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $7
	add hl, de
	cp [hl]
	jp nc, Func_5d876
	push bc
	ld hl, sp+$6
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $b
	push hl
	ld e, c
	ld d, $0
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	ld de, $301
	add hl, de
	pop de
	pop bc
	call Func_5d4a6
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	pop bc
	jp Func_5d838

Func_5d876: ; 5d876 (17:5876)
	ld hl, sp+$0
	push hl
	call GetHLAtSPPlus9
	pop de
	call Func_5d684
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_5d885: ; 5d885 (17:5885)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_5d89a: ; 5d89a (17:589a)
	push hl
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	ld de, $b
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus4
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld l, [hl]
	push hl
	call GetHLAtSPPlus6
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	ld e, [hl]
	inc e
	pop hl
	push de
	inc l
	ld a, c
	and b
	inc a
	jp z, Func_5d8df
	push hl
	ld l, c
	ld h, b
	add hl, hl
	ld d, $0
	add hl, de
	ld a, l
	pop hl
	push hl
	ld h, l
	ld l, a
	ld de, Data_5d909
	call PlaceStringDEatCoordHL
	pop hl
Func_5d8df: ; 5d8df (17:58df)
	pop de
	pop bc
	push bc
	push hl
	ld l, c
	ld h, b
	add hl, hl
	ld d, $0
	add hl, de
	ld a, l
	pop hl
	ld e, a
	ld a, l
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_5d90b
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	pop hl
	push hl
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

Data_5d909:
	dstr " "


Data_5d90b:
	dstr "%c"

Pointers_5d90e:
	dw Data_5d912
	dw Data_5d919

Data_5d912:
	dstr "(こうかん)"

Data_5d919:
	dstr "ステータス"

Func_5d91f:
	push hl
	push bc
	call GetHLAtSPPlus4
	ld c, l
	ld b, h
	push bc
	ld l, c
	ld h, b
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld l, e
	ld h, d
	inc hl
	inc hl
	ld l, [hl]
	push hl
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	call GetHLAtSPPlus10
	call Func_5d739
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_5d885
	xor a
Func_5d95c: ; 5d95c (17:595c)
	cp $2
	jp nc, Func_5d991
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_5d90e
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$7
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	inc h
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop af
	inc a
	jp Func_5d95c

Func_5d991: ; 5d991 (17:5991)
	pop bc
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_5d9ae
	call GetHLAtSPPlus4
	call Func_5e021
	ld hl, -1
	jp Func_5d9c7

Func_5d9ae: ; 5d9ae (17:59ae)
	ld l, c
	ld h, b
	call Func_5d89a
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
Func_5d9c7: ; 5d9c7 (17:59c7)
	pop bc
	pop bc
	ret

Func_5d9ca: ; 5d9ca (17:59ca)
	push hl
	add sp, -$26
	read_hl_from_sp_plus $28
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$24
	ld [hl], e
	read_hl_from_sp_plus $28
	ld de, $b
	add hl, de
	ld c, [hl]
	read_hl_from_sp_plus $28
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$23
	ld [hl], a
	read_hl_from_sp_plus $28
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld l, [hl]
	ld a, c
	cp $ff
	jp z, Func_5da36
	push hl
	push bc
	ld a, c
	ld hl, sp+$27
	ld b, [hl]
	call MultiplyAbyB
	inc a
	ld l, a
	ld h, $0
	ld de, Data_5db13
	call PlaceStringDEatCoordHL
	pop bc
	pop hl
	ld a, l
	cp $6
	jp z, Func_5da2b
	cp $2
	jp z, Func_5da2b
	cp $1
	jp nz, Func_5da36
Func_5da2b: ; 5da2b (17:5a2b)
	push hl
	ld e, c
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $0
	pop hl
Func_5da36: ; 5da36 (17:5a36)
	push hl
	read_hl_from_sp_plus $2a
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_5da75
	read_hl_from_sp_plus $2a
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	ld hl, sp+$25
	ld b, [hl]
	call MultiplyAbyB
	inc a
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_5db15
	push hl
	call PlaceString
	pop bc
	pop bc
Func_5da75: ; 5da75 (17:5a75)
	ld hl, sp+$26
	ld a, [hl]
	ld hl, sp+$25
	ld b, [hl]
	call MultiplyAbyB
	inc a
	ld e, a
	xor a
	call SetStringStartState
	ld hl, $8b
	push hl
	ld hl, Data_5db18
	push hl
	call PlaceString
	pop bc
	pop bc
	pop hl
	ld a, l
	cp $2
	jp z, Func_5daf5
	cp $6
	jp z, Func_5daf5
	cp $8
	jp z, Func_5daa7
	cp $1
	jp nz, Func_5db00
Func_5daa7: ; 5daa7 (17:5aa7)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$26
	ld a, [hl]
	call FarCall
	pop bc
	read_hl_from_sp_plus $e
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_5daf2
	ld hl, $c6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$24
	cp [hl]
	jp z, Func_5daf2
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $1
Func_5daf2: ; 5daf2 (17:5af2)
	jp Func_5db00

Func_5daf5: ; 5daf5 (17:5af5)
	ld hl, sp+$24
	ld e, [hl]
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $1
Func_5db00: ; 5db00 (17:5b00)
	ld hl, sp+$24
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $28
	ld de, $b
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	add sp, $28
	ret

Data_5db13:
	dstr " "

Data_5db15:
	dstr "%c"

Data_5db18:
	dstr "%c"

Func_5db1b: ; 5db1b (17:5b1b)
	push af
	add sp, -$24
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli GetRobotInParty
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$27
	ld a, [hl]
	call FarCall
	ld de, Data_5db9e
	ld hl, $10d
	call PlaceStringDEatCoordHL
	pop bc
	read_hl_from_sp_plus $e
	ld a, l
	or h
	jp nz, Func_5db69
	ld de, Data_5dba8
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_5dbb2
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_5db9b

Func_5db69: ; 5db69 (17:5b69)
	ld hl, $c6
	add hl, bc
	ld a, [hl]
	ld hl, sp+$25
	cp [hl]
	jp nz, Func_5db89
	ld de, Data_5dbba
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_5dbc1
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_5db9b

Func_5db89: ; 5db89 (17:5b89)
	ld de, Data_5dbcb
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_5dbd2
	ld hl, $110
	call PlaceStringDEatCoordHL
Func_5db9b: ; 5db9b (17:5b9b)
	add sp, $26
	ret

Data_5db9e:
	dstr "         "

Data_5dba8:
	dstr "スクラッフﾟ(に)"

Data_5dbb2:
	dstr "(なっている)"

Data_5dbba:
	dstr "(そいつは)"

Data_5dbc1:
	dstr "(たたかっている)"

Data_5dbcb:
	dstr "(そいつは)"

Data_5dbd2:
	dstr "(こうかんてﾞきる)"

Func_5dbdd:
	push bc
	push bc
	push bc
	push de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld c, [hl]
	call GetHLAtSPPlus8
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus8
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus8
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	pop de
	push bc
	push hl
	ld a, e
	dec a
	or d
	jp z, Func_5dc46
	ld a, e
	or d
	jp nz, Func_5dc6c
	call GetHLAtSPPlus8
	dec hl
	call WriteHLToSPPlus8
	inc h
	dec h
	bit 7, h
	jr z, .asm_5dc43
	ld hl, $0
	call WriteHLToSPPlus8
.asm_5dc43
	jp Func_5dc6c

Func_5dc46: ; 5dc46 (17:5c46)
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	inc hl
	call WriteHLToSPPlus8
	call CompareHLtoBC
	jp c, Func_5dc6c
	call GetHLAtSPPlus10
	ld de, $7
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	dec hl
	call WriteHLToSPPlus8
Func_5dc6c: ; 5dc6c (17:5c6c)
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $c
	inc hl
	inc hl
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	pop hl
	pop bc
	ld a, c
	cp $7
	jp z, Func_5dd33
	cp $6
	jp z, Func_5dd33
	cp $5
	jp z, Func_5dd33
	cp $3
	jp z, Func_5dd33
	cp $2
	jp z, Func_5dd33
	cp $1
	jp z, Func_5dcbe
	cp $8
	jp z, Func_5dcbe
	or a
	jp nz, Func_5dd48
	push hl
	call GetHLAtSPPlus8
	call Func_5d89a
	pop hl
	push hl
	ld c, $1
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	inc a
	call DoublePushBGMapRegion
	pop bc
	jp Func_5dd48

Func_5dcbe: ; 5dcbe (17:5cbe)
	call GetHLAtSPPlus6
	call Func_5d9ca
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $a10
	ld hl, $e
	call FarCall
	call GetHLAtSPPlus4
	ld a, l
	call Func_5db1b
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	call Func_5d3d6
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $0
	ld de, $11
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $d
	ld de, $a10
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call Func_5d3f1
	jp Func_5dd48

Func_5dd33: ; 5dd33 (17:5d33)
	push hl
	call GetHLAtSPPlus8
	call Func_5d9ca
	pop hl
	push hl
	ld c, $1
	ld hl, sp+$2
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
Func_5dd48: ; 5dd48 (17:5d48)
	ld hl, $4000
	pop bc
	pop bc
	pop bc
	ret

Data_5dd4f:
	db $0b, $0d, $09, $05, $17, $1f, $59, $00, $00, $00, $17, $dd, $5b, $17, $21, $60, $17, $fc, $53, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_5dd6e:
	db $00, $00, $00, $00, $ff, $ff, $02, $00, $02, $00, $ff, $ff, $00, $00, $00

Func_5dd7d: ; 5dd7d (17:5d7d)
	push hl
	push bc
	push bc
	call GetHLAtSPPlus6
	ldh a, [hSRAMBank]
	push af
	push hl
	ld a, $3
	call GetSRAMBank
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$5
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$6
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$4
	ld [hl], a
	call GetHLAtSPPlus10
	ld a, [hl]
	inc hl
	call WriteHLToSPPlus10
	call GetHLAtSPPlus10
	ld c, l
	ld b, h
	ld hl, sp+$4
	ld l, [hl]
	ld h, a
	ld e, l
	ld d, h
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$5
	ld l, [hl]
	ld h, a
	call RestoreTileMapRectangle
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	pop af
	call GetSRAMBank
	pop bc
	pop bc
	pop bc
	ret

Pointers_5dde1:
	dw Data_5dde7
Pointers_5dde3:
	dw Data_5ddfe
	dw $0

Data_5dde7:
	dstr "Aホﾞタン(てﾞ)ステータス(かﾞみれるよ)"

Data_5ddfe:
	dstr "セレクトホﾞタン(てﾞこうかんてﾞきるよ)"

Func_5de14: ; 5de14 (17:5e14)
	push hl
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	ld e, [hl]
	push de
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jp z, Func_5de78
	push bc
	push de
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	pop hl
	call Func_5dd7d
	pop bc
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $8
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_5de78: ; 5de78 (17:5e78)
	pop de
	pop af
	pop hl
	push de
	push af
	push bc
	call Func_5d739
	pop bc
	push bc
	ld l, c
	ld h, b
	call Func_5d9ca
	pop bc
	pop af
	pop de
	cp $8
	jp z, Func_5df3c
	cp $7
	jp z, Func_5df1b
	cp $5
	jp z, Func_5df1b
	cp $6
	jp z, Func_5deca
	cp $2
	jp z, Func_5deb5
	cp $1
	jp nz, Func_5df96
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call Func_5db1b
	jp Func_5df96

Func_5deb5: ; 5deb5 (17:5eb5)
	ld de, Data_5dfab
	ld hl, $10e
	call PlaceStringDEatCoordHL
	ld de, Data_5dfba
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_5df96

Func_5deca: ; 5deca (17:5eca)
	ld a, e
	cp $7
	jp z, Func_5df0f
	cp $3
	jp z, Func_5df0f
	cp $8
	jp z, Func_5df03
	cp $6
	jp z, Func_5def7
	cp $5
	jp z, Func_5def7
	cp $4
	jp z, Func_5def7
	cp $2
	jp z, Func_5def7
	cp $1
	jp z, Func_5def7
	or a
	jp nz, Func_5df18
Func_5def7: ; 5def7 (17:5ef7)
	ld de, Data_5dfc2
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_5df18

Func_5df03: ; 5df03 (17:5f03)
	ld de, Data_5dfd4
	ld hl, $10e
	call PlaceStringDEatCoordHL
	jp Func_5df18

Func_5df0f: ; 5df0f (17:5f0f)
	ld de, Data_5dfe8
	ld hl, $10e
	call PlaceStringDEatCoordHL
Func_5df18: ; 5df18 (17:5f18)
	jp Func_5df96

Func_5df1b: ; 5df1b (17:5f1b)
	read_hl_from Pointers_5dde1
	reg16swap de, hl
	ld hl, $10e
	call PlaceStringDEatCoordHL
	read_hl_from Pointers_5dde3
	reg16swap de, hl
	ld hl, $110
	call PlaceStringDEatCoordHL
	jp Func_5df96

Func_5df3c: ; 5df3c (17:5f3c)
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	or a
	jp nz, Func_5df96
	push bc
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_5d885
	set_farcall_addrs_hli PrintMapText_
	ld c, BANK(Pointers_5dde1)
	ld de, Pointers_5dde1
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $d
	call FarCall
	pop bc
	push bc
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	call Func_5db1b
	pop bc
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld [hl], $1
Func_5df96: ; 5df96 (17:5f96)
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	ret

Data_5dfab:
	dstr "(とﾞの)ロホﾞホﾟン(に)"

Data_5dfba:
	dstr "(しますか)?"

Data_5dfc2:
	dstr "(とﾞの)ロホﾞホﾟン(にする)?"

Data_5dfd4:
	dstr "(とﾞの)ロホﾞホﾟン(をあけﾞる)?"

Data_5dfe8:
	dstr "(とﾞの)ロホﾞホﾟン(につかう)?"

Func_5dffb:
	ld a, [wc395]
	inc a
	ld [wc395], a
	cp $14
	jp nc, Func_5e00b
	ld hl, $4000
	ret

Func_5e00b: ; 5e00b (17:600b)
	xor a
	ld [wc395], a
	ld de, wc396
	call Func_5d684
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	ld hl, $4000
	ret

Func_5e021: ; 5e021 (17:6021)
	push hl
	add sp, -$58
	read_hl_from_sp_plus $5a
	write_hl_to_sp_plus $58
	read_hl_from_sp_plus $58
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	read_hl_from_sp_plus $58
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$55
	ld [hl], a
	read_hl_from_sp_plus $58
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$54
	ld [hl], a
	read_hl_from_sp_plus $58
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld c, [hl]
	read_hl_from_sp_plus $58
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c
	add hl, de
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $5a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld a, l
	ld [wc2e9], a
	pop hl
	ld a, c
	cp $7
	jp z, Func_5e226
	cp $6
	jp z, Func_5e1b9
	cp $8
	jp z, Func_5e174
	cp $5
	jp z, Func_5e174
	cp $3
	jp z, Func_5e135
	cp $1
	jp z, Func_5e0f4
	or a
	jp nz, Func_5e264
	ld hl, sp+$54
	ld a, [hl]
	pop hl
	push hl
	add hl, hl
	inc hl
	add l
	ld e, a
	ld hl, sp+$54
	ld [hl], e
	ld hl, sp+$55
	ld a, [hl]
	inc a
	ld hl, sp+$55
	ld [hl], a
	call SetStringStartState
	ld hl, $8c
	push hl
	ld hl, Data_5e271
	push hl
	call PlaceString
	pop bc
	pop bc
	read_hl_from_sp_plus $58
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $a
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5e0f1
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $1
	push hl
	ld c, $1
	ld hl, sp+$56
	ld e, [hl]
	ld hl, sp+$57
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
Func_5e0f1: ; 5e0f1 (17:60f1)
	jp Func_5e264

Func_5e0f4: ; 5e0f4 (17:60f4)
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli GetRobotInParty
	call GetHLAtSPPlus4
	ld a, l
	ld hl, sp+$33
	reg16swap de, hl
	call FarCall
	pop bc
	read_hl_from_sp_plus $3f
	ld a, l
	or h
	jp z, Func_5e12d
	ld hl, $c6
	add hl, bc
	ld a, [hl]
	pop hl
	push hl
	cp l
	jp nz, Func_5e132
Func_5e12d: ; 5e12d (17:612d)
	ld hl, $4000
	pop de
	push hl
Func_5e132: ; 5e132 (17:6132)
	jp Func_5e264

Func_5e135: ; 5e135 (17:6135)
	set_farcall_addrs_hli GetRobotInParty
	pop hl
	push hl
	ld a, l
	ld hl, sp+$31
	reg16swap de, hl
	call FarCall
	ld hl, sp+$31
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$2
	call GetRobotOrTrainerBaseStats
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_5e16c
	call GetHLAtSPPlus7
	push hl
	read_hl_from_sp_plus $52
	pop de
	call CompareHLtoDE
	jp c, Func_5e171
Func_5e16c: ; 5e16c (17:616c)
	ld hl, $4000
	pop de
	push hl
Func_5e171: ; 5e171 (17:6171)
	jp Func_5e264

Func_5e174: ; 5e174 (17:6174)
	ld a, [wc2e9]
	ld [wc310], a
	callba_hli Func_5575d
	ld a, [wInBattle]
	ld c, a
	push bc
	xor a
	ld [wInBattle], a
	set_farcall_addrs_hli MenuWithSecondaryHeader
	ld c, BANK(Data_54384)
	ld de, Data_54384
	ld hl, Data_54365
	call FarCall
	pop bc
	ld a, c
	ld [wInBattle], a
	read_hl_from_sp_plus $5a
	call Func_5de14
	ld hl, $4000
	jp Func_5e266

Func_5e1b9: ; 5e1b9 (17:61b9)
	ld a, l
	cp $3
	jp z, Func_5e20f
	cp $1
	jp nz, Func_5e223
	set_farcall_addrs_hli Func_5531c
	read_hl_from_sp_plus $58
	call FarCall
	pop de
	push hl
	read_hl_from_sp_plus $58
	ld de, $7
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $58
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $7
	add hl, de
	ld [hl], c
	read_hl_from_sp_plus $58
	ld de, $7
	add hl, de
	ld a, [hl]
	call Func_5d35f
	call Func_5c083
	read_hl_from_sp_plus $5a
	call Func_5de14
	ld hl, $4000
	jp Func_5e266

Func_5e20f: ; 5e20f (17:620f)
	set_farcall_addrs_hli Func_54a00
	read_hl_from_sp_plus $58
	call FarCall
	pop de
	push hl
Func_5e223: ; 5e223 (17:6223)
	jp Func_5e264

Func_5e226: ; 5e226 (17:6226)
	ld a, [wc2e9]
	ld [wc310], a
	callba_hli Func_5575d
	ld a, [wInBattle]
	ld c, a
	push bc
	xor a
	ld [wInBattle], a
	set_farcall_addrs_hli Func_56b35
	xor a
	call FarCall
	pop bc
	ld a, c
	ld [wInBattle], a
	read_hl_from_sp_plus $5a
	call Func_5de14
	ld hl, $4000
	jp Func_5e266

Func_5e264: ; 5e264 (17:6264)
	pop hl
	push hl
Func_5e266: ; 5e266 (17:6266)
	reg16swap de, hl
	add sp, $5a
	reg16swap de, hl
	ret

Data_5e271:
	dstr "%c"

Pointers_5e274:
	dw Data_5e278
	dw $0

Data_5e278:
	dstr "(こうかんしたよ)"

Pointers_5e282:
	dw Data_5e288
	dw Data_5e298
	dw $0

Data_5e288:
	dstr "(おなしﾞ)ロホﾞホﾟン(は)"

Data_5e298:
	dstr "(こうかんてﾞきないよ)"

Func_5e2a5:
	push hl
	add sp, -$2a
	read_hl_from_sp_plus $2c
	write_hl_to_sp_plus $29
	read_hl_from_sp_plus $29
	inc hl
	ld l, [hl]
	inc hl
	ld h, [hl]
	read_hl_from_sp_plus $29
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld hl, sp+$26
	ld [hl], a
	read_hl_from_sp_plus $29
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$25
	ld [hl], a
	read_hl_from_sp_plus $29
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$24
	ld [hl], a
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld c, [hl]
	ld a, c
	cp $8
	jp nz, Func_5e30e
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [wc2e9], a
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	jp Func_5e4bd

Func_5e30e: ; 5e30e (17:630e)
	read_hl_from_sp_plus $29
	ld de, $7
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1
	call CompareHLtoDE
	jp nc, Func_5e32e
	ld a, c
	cp $5
	jp z, Func_5e334
	ld a, c
	cp $7
	jp z, Func_5e334
Func_5e32e: ; 5e32e (17:632e)
	ld hl, $4000
	jp Func_5e4bd

Func_5e334: ; 5e334 (17:6334)
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	cp $ff
	jp nz, Func_5e398
	read_hl_from_sp_plus $2c
	call Func_5d9ca
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld [hl], c
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, wc396
	add hl, de
	ld [hl], $1
	ld hl, sp+$24
	ld l, [hl]
	push hl
	ld c, $1
	ld hl, sp+$27
	ld e, [hl]
	ld hl, sp+$28
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
	ld hl, $4000
	jp Func_5e4bd

Func_5e398: ; 5e398 (17:6398)
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_5d885
	set_farcall_addrs_hli PrintMapText_
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp z, Func_5e491
	ld c, BANK(Pointers_5e274)
	ld de, Pointers_5e274
	ld hl, $10e
	call FarCall
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld e, [hl]
	ld hl, sp+$0
	ld [hl], e
	read_hl_from_sp_plus $29
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	push af
	ld hl, sp+$3
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	pop af
	ld l, a
	ld h, 0
	get_party_bot
	push hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	ld hl, sp+$0
	ld l, [hl]
	ld h, 0
	get_party_bot
	reg16swap de, hl
	ld hl, sp+$1
	ld bc, $23
	call MemCopy
	read_hl_from_sp_plus $29
	ld de, $d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $b
	add hl, de
	ld [hl], $ff
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	read_hl_from_sp_plus $29
	ld de, $7
	add hl, de
	ld a, [hl]
	call Func_5d35f
	jp Func_5e4b3

Func_5e491: ; 5e491 (17:6491)
	ld c, BANK(Pointers_5e282)
	ld de, Pointers_5e282
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
Func_5e4b3: ; 5e4b3 (17:64b3)
	read_hl_from_sp_plus $2c
	call Func_5de14
	ld hl, $4000
Func_5e4bd: ; 5e4bd (17:64bd)
	reg16swap de, hl
	add sp, $2c
	reg16swap de, hl
	ret

INCLUDE "engine/menu/party_menu.asm"

Func_5ec5e:: ; 5ec5e (17:6c5e)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $1
	jp nz, Func_5ec70
	jp Func_5ec98

Func_5ec70: ; 5ec70 (17:6c70)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_5ec8d
	ld c, $1
	ld de, wRNGState
	ld hl, $2
	call Func_5c03b
	jp Func_5ec98

Func_5ec8d: ; 5ec8d (17:6c8d)
	ld c, $1
	ld de, wRNGState
	ld hl, $2
	call Func_5c027
Func_5ec98: ; 5ec98 (17:6c98)
	ret

Func_5ec99::
	push af
	ld a, e
	and $f
	ld c, a
	ld a, e
	rrca
	rrca
	rrca
	rrca
	and $f
	ld e, a
	ld a, c
	cp $c
	jp z, Func_5ecb2
	ld a, e
	cp $c
	jp nz, Func_5eccd
Func_5ecb2: ; 5ecb2 (17:6cb2)
	ld hl, sp+$1
	ld a, [hl]
	cp $6
	jp z, Func_5ecc8
	cp $5
	jp z, Func_5ecc8
	cp $1
	jp z, Func_5ecc8
	or a
	jp nz, Func_5eccd
Func_5ecc8: ; 5ecc8 (17:6cc8)
	ld a, $1
	jp Func_5ed49

Func_5eccd: ; 5eccd (17:6ccd)
	ld a, c
	cp $d
	jp z, Func_5ecd9
	ld a, e
	cp $d
	jp nz, Func_5ecf5
Func_5ecd9: ; 5ecd9 (17:6cd9)
	ld hl, sp+$1
	ld a, [hl]
	cp $7
	jp z, Func_5ecf0
	cp $4
	jp z, Func_5ecf0
	cp $3
	jp z, Func_5ecf0
	cp $2
	jp nz, Func_5ecf5
Func_5ecf0: ; 5ecf0 (17:6cf0)
	ld a, $1
	jp Func_5ed49

Func_5ecf5: ; 5ecf5 (17:6cf5)
	ld a, c
	cp $e
	jp z, Func_5ed01
	ld a, e
	cp $e
	jp nz, Func_5ed18
Func_5ed01: ; 5ed01 (17:6d01)
	ld hl, sp+$1
	ld a, [hl]
	cp $a
	jp z, Func_5ed13
	cp $9
	jp z, Func_5ed13
	cp $8
	jp nz, Func_5ed18
Func_5ed13: ; 5ed13 (17:6d13)
	ld a, $1
	jp Func_5ed49

Func_5ed18: ; 5ed18 (17:6d18)
	ld a, c
	cp $f
	jp z, Func_5ed24
	ld a, e
	cp $f
	jp nz, Func_5ed34
Func_5ed24: ; 5ed24 (17:6d24)
	ld hl, sp+$1
	ld a, [hl]
	cp $b
	jp nz, Func_5ed2f
	jp Func_5ed34

Func_5ed2f: ; 5ed2f (17:6d2f)
	ld a, $1
	jp Func_5ed49

Func_5ed34: ; 5ed34 (17:6d34)
	ld hl, sp+$1
	ld a, [hl]
	cp c
	jp z, Func_5ed42
	ld hl, sp+$1
	ld a, [hl]
	cp e
	jp nz, Func_5ed47
Func_5ed42: ; 5ed42 (17:6d42)
	ld a, $1
	jp Func_5ed49

Func_5ed47: ; 5ed47 (17:6d47)
	ld a, $ff
Func_5ed49: ; 5ed49 (17:6d49)
	pop bc
	ret


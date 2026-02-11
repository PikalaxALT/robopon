INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 9 part 2", ROMX
INCLUDE "charmap.asm"
Data_245c8: ; 245c8
	db $00, $0a, $14, $1e, $28, $32, $3c, $46

Data_245d0: ; 245d0
	db $50, $5a, $64, $7d, $96, $af, $05, $0f

Func_245d8: ; 245d8
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7748
	pop bc
	pop de
	pop hl
	jp FarCall

Func_245ec: ; 245ec
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_7766
	pop bc
	pop de
	pop hl
	jp FarCall

Func_24600: ; 24600 (9:4600)
	push af
	set_farcall_addrs_hli RandomRange
	pop af
	call FarCall
	ret

Func_24611: ; 24611
	callba_hli Func_5ec5e
	ret

Bank9_DamageOrHeal: ; 24620 (9:4620)
	push af
	push de
	set_farcall_addrs_hli DamageOrHeal
	pop de
	pop af
	jp FarCall

Func_24632: ; 24632 (9:4632)
	push af
	push de
	set_farcall_addrs_hli Func_61a3e
	pop de
	pop af
	jp FarCall

Func_24644: ; 24644
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ret

Func_2465a: ; 2465a (9:465a)
	push af
	push de
	set_farcall_addrs_hli Func_dcaf
	pop de
	pop af
	call FarCall
	ret

Func_2466d: ; 2466d (9:466d)
	push af
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_2469a
	ld hl, $0
	jp Func_2469d

Func_2469a: ; 2469a (9:469a)
	ld hl, $2f
Func_2469d: ; 2469d (9:469d)
	add hl, de
	reg16swap de, hl
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_246c2
	push de
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus4
	ld de, $8
	add hl, de
	add hl, bc
	ld a, $4
	or [hl]
	ld [hl], a
	pop de
	jp Func_246c5

Func_246c2: ; 246c2 (9:46c2)
	jp Func_2472d

Func_246c5: ; 246c5 (9:46c5)
	push de
	ld a, $2d
	call OverworldPlaySFX
	set_farcall_addrs_hli Func_dd47
	ld hl, sp+$5
	ld a, [hl]
	call FarCall
	pop de
	push de
	ld hl, $d
	add hl, de
	call Func_24023
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp z, Func_24701
	ld hl, Text_24071
	call Func_24010
	ld hl, Text_241eb
	call Func_24023
	ld hl, Text_241f1
	call Func_24010
	jp Func_24713

Func_24701: ; 24701 (9:4701)
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_241eb
	call Func_24023
	ld hl, Text_241b9
	call Func_24010
Func_24713: ; 24713 (9:4713)
	call Func_24045
	pop de
	ld hl, $22
	add hl, de
	ld [hl], $e
	ld a, $1
	ld hl, sp+$3
	ld b, [hl]
	call LeftShiftA
	pop hl
	push hl
	ld de, $7
	add hl, de
	or [hl]
	ld [hl], a
Func_2472d: ; 2472d (9:472d)
	pop bc
	pop bc
	ret

Func_24730: ; 24730 (9:4730)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17975
	pop bc
	pop de
	pop hl
	jp FarCall

Func_24744: ; 24744 (9:4744)
	ld c, $80
	jp Func_24730

Func_24749: ; 24749 (9:4749)
	push hl
	set_farcall_addrs_hli Func_5c6e3
	pop hl
	jp FarCall

Func_24759: ; 24759 (9:4759)
	push de
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_243a6 - $11 * 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	pop de
	call CopyUntilNull
	pop de
	push hl
	pop hl
	push hl
	ld de, Text_2426f
	call CopyUntilNull
	pop bc
	ret

Func_24779: ; 24779 (9:4779)
	push af
	push de
	set_farcall_addrs_hli Func_e39a
	pop de
	pop af
	jp FarCall

Func_2478b: ; 2478b (9:478b)
	push hl
	push de
	set_farcall_addrs_hli Func_5c732
	pop de
	pop hl
	jp FarCall

Data_2479d: ; 2479d
	db $0, $0, $26, $66

Func_247a1: ; 247a1 (9:47a1)
	add sp, -$16
	xor a
	ld a, $2
	call Func_24600
	ld hl, sp+$13
	ld [hl], a
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_247c3
	ld hl, sp+$13
	ld a, [hl]
	xor $1
	ld hl, sp+$13
	ld [hl], a
Func_247c3: ; 247c3 (9:47c3)
	ld hl, sp+$a
	ld [hl], $0
Func_247c7: ; 247c7 (9:47c7)
	ld hl, sp+$a
	ld a, [hl]
	cp $2
	jp nc, Func_24bd4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$13
	ld a, [hl]
	or a
	jp nz, Func_247e8
	ld hl, $0
	jp Func_247eb

Func_247e8: ; 247e8 (9:47e8)
	ld hl, $2f
Func_247eb: ; 247eb (9:47eb)
	add hl, de
	write_hl_to_sp_plus $13
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $11
	read_hl_from_sp_plus $13
	call Func_24749
	call Func_24001
	ld hl, sp+$14
	ld [hl], $0
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $3
	jp z, Func_2486e
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $2
	jp z, Func_24858
	ld hl, Text_240b9
	call Func_24023
	jp Func_2485e

Func_24858: ; 24858 (9:4858)
	ld hl, Text_240bf
	call Func_24023
Func_2485e: ; 2485e (9:485e)
	ld hl, sp+$14
	ld [hl], $1
	ld hl, Text_2406b
	call Func_24010
	ld hl, Text_2417a
	call Func_24010
Func_2486e: ; 2486e (9:486e)
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_248a9
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, sp+$14
	ld [hl], $1
	ld hl, Text_2406b
	call Func_24010
	ld hl, Text_2417a
	call Func_24010
	ld hl, sp+$14
	ld [hl], $1
Func_248a9: ; 248a9 (9:48a9)
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp nz, Func_248c7
	read_hl_from_sp_plus $11
	ld de, $74
	add hl, de
	ld a, $a
	add [hl]
	ld [hl], a
	jp Func_248f7

Func_248c7: ; 248c7 (9:48c7)
	ld hl, sp+$14
	ld [hl], $1
	ld hl, Text_240c6
	call Func_24023
	ld a, $64
	call Func_24600
	cp $1e
	jp nc, Func_248f1
	ld hl, Text_24233
	call Func_24010
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $fb
	ld [hl], a
	jp Func_248f7

Func_248f1: ; 248f1 (9:48f1)
	ld hl, Text_2423d
	call Func_24010
Func_248f7: ; 248f7 (9:48f7)
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp z, Func_24901
	call Func_24036
Func_24901: ; 24901 (9:4901)
	call Func_24001
	ld hl, sp+$14
	ld [hl], $0
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld bc, $0
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_24a7a
	cp $2
	jp z, Func_249ea
	cp $3
	jp z, Func_24985
	cp $8
	jp nz, Func_24b00
	read_hl_from_sp_plus $13
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	ld c, l
	ld b, h
	push bc
	ld hl, sp+$16
	ld [hl], $1
	ld hl, Text_240ac
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24225
	call Func_24010
	pop bc
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_24744
	ld hl, sp+$2
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24195
	call Func_24010
	ld hl, Text_24067
	call Func_24010
	pop bc
	jp Func_24b00

Func_24985: ; 24985 (9:4985)
	ld hl, sp+$b
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Data_2479d
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$c
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	ld a, c
	or b
	jp nz, Func_249ab
	ld bc, $1
Func_249ab: ; 249ab (9:49ab)
	push bc
	ld hl, sp+$16
	ld [hl], $1
	ld hl, Text_24097
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24225
	call Func_24010
	pop bc
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_24744
	ld hl, sp+$2
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24195
	call Func_24010
	ld hl, Text_24067
	call Func_24010
	pop bc
	jp Func_24b00

Func_249ea: ; 249ea (9:49ea)
	push bc
	ld hl, sp+$16
	ld [hl], $1
	ld hl, Text_24093
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24225
	call Func_24010
	read_hl_from_sp_plus $13
	ld de, $73
	add hl, de
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld c, a
	push bc
	read_hl_from_sp_plus $15
	ld de, $76
	add hl, de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	ld hl, sp+$6
	call Func_24023
	ld e, $0
	pop hl
	pop bc
Func_24a28: ; 24a28 (9:4a28)
	ld a, e
	cp $4
	jp nc, Func_24a6a
	push bc
	push de
	ld a, c
	and $1
	jp z, Func_24a5c
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Pointers_24122
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24010
	ld hl, Text_24065
	call Func_24010
	pop hl
	ld a, $14
	add [hl]
	ld [hl], a
	cp $65
	jp c, Func_24a5c
	ld a, $64
	ld [hl], a
Func_24a5c: ; 24a5c (9:4a5c)
	pop de
	inc e
	pop bc
	ld a, c
	rrca
	and $7f
	ld c, a
	inc hl
	inc hl
	inc hl
	jp Func_24a28

Func_24a6a: ; 24a6a (9:4a6a)
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24165
	call Func_24010
	pop bc
	jp Func_24b00

Func_24a7a: ; 24a7a (9:4a7a)
	push bc
	ld hl, sp+$16
	ld [hl], $1
	ld hl, Text_2408f
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_2422d
	call Func_24010
	read_hl_from_sp_plus $13
	ld de, $73
	add hl, de
	ld c, [hl]
	push bc
	read_hl_from_sp_plus $15
	ld de, $76
	add hl, de
	push hl
	ld hl, sp+$6
	ld [hl], $0
	ld hl, sp+$6
	call Func_24023
	ld e, $0
	pop hl
	pop bc
Func_24ab1: ; 24ab1 (9:4ab1)
	ld a, e
	cp $4
	jp nc, Func_24af3
	push bc
	push de
	ld a, c
	and $1
	jp z, Func_24ae5
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Pointers_24122
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24010
	ld hl, Text_24065
	call Func_24010
	pop hl
	ld a, $a
	add [hl]
	ld [hl], a
	cp $65
	jp c, Func_24ae5
	ld a, $64
	ld [hl], a
Func_24ae5: ; 24ae5 (9:4ae5)
	pop de
	inc e
	pop bc
	ld a, c
	rrca
	and $7f
	ld c, a
	inc hl
	inc hl
	inc hl
	jp Func_24ab1

Func_24af3: ; 24af3 (9:4af3)
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24160
	call Func_24010
	pop bc
Func_24b00: ; 24b00 (9:4b00)
	push bc
	ld hl, sp+$16
	ld a, [hl]
	or a
	jp z, Func_24b0b
	call Func_24036
Func_24b0b: ; 24b0b (9:4b0b)
	pop bc
	ld a, c
	or b
	jp z, Func_24b4d
	ld e, c
	ld d, b
	ld hl, sp+$13
	ld a, [hl]
	call Bank9_DamageOrHeal
	ld c, l
	ld b, h
	read_hl_from_sp_plus $13
	ld de, $18
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, c
	or b
	jp nz, Func_24b4d
	ld hl, sp+$13
	ld a, [hl]
	call Func_2466d
	ld a, $1
	ld hl, sp+$13
	ld b, [hl]
	call LeftShiftA
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $65
	add hl, de
	ld [hl], a
	jp Func_24bd4

Func_24b4d: ; 24b4d (9:4b4d)
	read_hl_from_sp_plus $11
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_24ba5
	cp $5
	jp z, Func_24b85
	cp $4
	jp nz, Func_24bc2
	call Func_24001
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_243ef
	call Func_24023
	call Func_24036
	jp Func_24bc2

Func_24b85: ; 24b85 (9:4b85)
	call Func_24001
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_243f8
	call Func_24023
	call Func_24036
	jp Func_24bc2

Func_24ba5: ; 24ba5 (9:4ba5)
	call Func_24001
	read_hl_from_sp_plus $13
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24404
	call Func_24023
	call Func_24036
Func_24bc2: ; 24bc2 (9:4bc2)
	ld hl, sp+$a
	ld a, [hl]
	inc a
	ld hl, sp+$a
	ld [hl], a
	ld hl, sp+$13
	ld a, [hl]
	xor $1
	ld hl, sp+$13
	ld [hl], a
	jp Func_247c7

Func_24bd4: ; 24bd4 (9:4bd4)
	call Func_24001
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $65
	add hl, de
	ld a, [hl]
	add sp, $16
	ret

Func_24beb: ; 24beb (9:4beb)
	push af
	set_farcall_addrs_hli Func_5c796
	pop af
	call FarCall
	ret

Func_24bfc: ; 24bfc (9:4bfc)
	callba_hli Func_5cdb0
	ret

Func_24c0b: ; 24c0b
	add sp, -$34
	ld l, $0
	ld c, l
Func_24c10: ; 24c10 (9:4c10)
	ld a, l
	cp $2
	jp nc, Func_24cd6
	push bc
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc c
	dec c
	jp nz, Func_24c2f
	ld hl, $0
	jp Func_24c32

Func_24c2f: ; 24c2f (9:4c2f)
	ld hl, $2f
Func_24c32: ; 24c32 (9:4c32)
	add hl, de
	write_hl_to_sp_plus $37
	ld l, c
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $34
	read_hl_from_sp_plus $37
	call Func_24749
	ld c, a
	read_hl_from_sp_plus $34
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $a
	jp nz, Func_24ccc
	push bc
	call Func_24001
	read_hl_from_sp_plus $39
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	read_hl_from_sp_plus $36
	ld de, $75
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	pop bc
	read_hl_from_sp_plus $34
	ld de, $75
	add hl, de
	ld [hl], c
	read_hl_from_sp_plus $37
	ld de, $22
	add hl, de
	ld [hl], c
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24180
	call Func_24010
	call Func_24036
	callba_hli Func_d767
Func_24ccc: ; 24ccc (9:4ccc)
	pop hl
	inc l
	pop bc
	ld a, c
	xor $1
	ld c, a
	jp Func_24c10

Func_24cd6: ; 24cd6 (9:4cd6)
	call Func_247a1
	or a
	jp z, Func_24ce0
	jp Func_251ce

Func_24ce0: ; 24ce0 (9:4ce0)
	push af
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_24cf5
	ld c, $1
	jp Func_24cf7

Func_24cf5: ; 24cf5 (9:4cf5)
	ld c, $0
Func_24cf7: ; 24cf7 (9:4cf7)
	ld l, $0
Func_24cf9: ; 24cf9 (9:4cf9)
	ld a, l
	cp $2
	jp nc, Func_2518e
	push bc
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc c
	dec c
	jp nz, Func_24d18
	ld hl, $0
	jp Func_24d1b

Func_24d18: ; 24d18 (9:4d18)
	ld hl, $2f
Func_24d1b: ; 24d1b (9:4d1b)
	add hl, de
	write_hl_to_sp_plus $39
	ld l, c
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $36
	read_hl_from_sp_plus $36
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $9
	jp nz, Func_24daf
	read_hl_from_sp_plus $39
	ld de, $23
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	push hl
	read_hl_from_sp_plus $38
	ld de, $60
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	read_hl_from_sp_plus $39
	ld de, $25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $62
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $39
	ld de, $27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $64
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	jp Func_25025

Func_24daf: ; 24daf (9:4daf)
	read_hl_from_sp_plus $39
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$17
	call Func_241f
	read_hl_from_sp_plus $39
	ld de, $2e
	add hl, de
	ld a, [hl]
	push af
	read_hl_from_sp_plus $3b
	ld de, $25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2a
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	call Func_24779
	ld c, l
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $62
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$32
	ld c, l
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $76
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $64
	call Func_2617
	ld hl, sp+$32
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3b
	ld de, $25
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$32
	call MultiplyULongAtHLByUShortDE
	read_hl_from_sp_plus $38
	ld de, $73
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_24e3c
	ld hl, sp+$33
	ld c, [hl]
	ld hl, sp+$32
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $62
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_24e60

Func_24e3c: ; 24e3c (9:4e3c)
	read_hl_from_sp_plus $38
	ld de, $73
	add hl, de
	ld a, [hl]
	and $10
	jp z, Func_24e60
	ld hl, sp+$33
	ld c, [hl]
	ld hl, sp+$32
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $62
	add hl, de
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
Func_24e60: ; 24e60 (9:4e60)
	read_hl_from_sp_plus $38
	ld de, $77
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $38
	ld de, $62
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	pop af
	push af
	read_hl_from_sp_plus $3b
	ld de, $27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$2b
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	call Func_24779
	ld c, l
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $64
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$32
	ld c, l
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $7c
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $64
	call Func_2617
	ld hl, sp+$32
	ld c, l
	ld b, h
	read_hl_from_sp_plus $3b
	ld de, $27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$32
	call MultiplyULongAtHLByUShortDE
	read_hl_from_sp_plus $38
	ld de, $73
	add hl, de
	ld a, [hl]
	and $4
	jp z, Func_24ef1
	ld hl, sp+$33
	ld c, [hl]
	ld hl, sp+$32
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $64
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_24f15

Func_24ef1: ; 24ef1 (9:4ef1)
	read_hl_from_sp_plus $38
	ld de, $73
	add hl, de
	ld a, [hl]
	and $40
	jp z, Func_24f15
	ld hl, sp+$33
	ld c, [hl]
	ld hl, sp+$32
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $38
	ld de, $64
	add hl, de
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
Func_24f15: ; 24f15 (9:4f15)
	read_hl_from_sp_plus $38
	ld de, $7d
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $38
	ld de, $64
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	read_hl_from_sp_plus $38
	ld de, $5f
	add hl, de
	ld e, [hl]
	ld hl, sp+$31
	ld [hl], e
	pop af
	read_hl_from_sp_plus $39
	ld de, $23
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$27
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	call Func_24779
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_24f71
	read_hl_from_sp_plus $36
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $fe
	jp nz, Func_25025
Func_24f71: ; 24f71 (9:4f71)
	read_hl_from_sp_plus $36
	ld de, $3e
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2f
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, c
	ld h, b
	add hl, de
	push hl
	read_hl_from_sp_plus $38
	ld de, $60
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$30
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $79
	add hl, de
	ld l, [hl]
	ld h, $0
	ld de, $64
	call Func_2617
	ld hl, sp+$30
	ld c, l
	ld b, h
	read_hl_from_sp_plus $39
	ld de, $23
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$30
	call MultiplyULongAtHLByUShortDE
	read_hl_from_sp_plus $36
	ld de, $73
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_24fe7
	ld hl, sp+$31
	ld c, [hl]
	ld hl, sp+$30
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_2500b

Func_24fe7: ; 24fe7 (9:4fe7)
	read_hl_from_sp_plus $36
	ld de, $73
	add hl, de
	ld a, [hl]
	and $20
	jp z, Func_2500b
	ld hl, sp+$31
	ld c, [hl]
	ld hl, sp+$30
	ld h, [hl]
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
Func_2500b: ; 2500b (9:500b)
	read_hl_from_sp_plus $36
	ld de, $7a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_25025: ; 25025 (9:5025)
	ld hl, sp+$36
	ld [hl], $0
Func_25029: ; 25029 (9:5029)
	ld hl, sp+$36
	ld a, [hl]
	cp $3
	jp nc, Func_2511e
	ld hl, sp+$36
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $36
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	or a
	jp z, Func_25114
	ld hl, sp+$36
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $36
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$6
	call GetMove
	read_hl_from_sp_plus $14
	ld a, l
	and $80
	jp z, Func_25114
	read_hl_from_sp_plus $14
	ld a, l
	and $7f
	ld l, a
	ld h, $0
	ld a, l
	cp $2b
	jp nz, Func_25114
	read_hl_from_sp_plus $14
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	cp $2
	jp z, Func_250e9
	cp $1
	jp z, Func_250bb
	or a
	jp nz, Func_25114
	read_hl_from_sp_plus $e
	push hl
	ld hl, sp+$38
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $38
	ld de, $20
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $62
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_25114

Func_250bb: ; 250bb (9:50bb)
	read_hl_from_sp_plus $e
	push hl
	ld hl, sp+$38
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $38
	ld de, $20
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	jp Func_25114

Func_250e9: ; 250e9 (9:50e9)
	read_hl_from_sp_plus $e
	push hl
	ld hl, sp+$38
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $38
	ld de, $20
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	pop de
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	read_hl_from_sp_plus $36
	ld de, $64
	add hl, de
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
Func_25114: ; 25114 (9:5114)
	ld hl, sp+$36
	ld a, [hl]
	inc a
	ld hl, sp+$36
	ld [hl], a
	jp Func_25029

Func_2511e: ; 2511e (9:511e)
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25140
	read_hl_from_sp_plus $36
	ld de, $60
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_25140: ; 25140 (9:5140)
	read_hl_from_sp_plus $36
	ld de, $62
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25162
	read_hl_from_sp_plus $36
	ld de, $62
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_25162: ; 25162 (9:5162)
	read_hl_from_sp_plus $36
	ld de, $64
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25184
	read_hl_from_sp_plus $36
	ld de, $64
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_25184: ; 25184 (9:5184)
	pop hl
	inc l
	pop bc
	ld a, c
	xor $1
	ld c, a
	jp Func_24cf9

Func_2518e: ; 2518e (9:518e)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2519f
	call Func_24bfc
Func_2519f: ; 2519f (9:519f)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_251b3
	ld l, $1
	jp Func_251b5

Func_251b3: ; 251b3 (9:51b3)
	ld l, $0
Func_251b5: ; 251b5 (9:51b5)
	ld e, $0
Func_251b7: ; 251b7 (9:51b7)
	ld a, e
	cp $2
	jp nc, Func_251cd
	push hl
	push de
	ld a, l
	call Func_24beb
	pop de
	inc e
	pop hl
	ld a, l
	xor $1
	ld l, a
	jp Func_251b7

Func_251cd: ; 251cd (9:51cd)
	pop af
Func_251ce: ; 251ce (9:51ce)
	add sp, $34
	ret

Func_251d1: ; 251d1
	push bc
	push bc
	push bc
	push bc
	xor a
	ld c, $0
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_251eb
	ld a, c
	xor $1
	ld c, a
Func_251eb: ; 251eb (9:51eb)
	xor a
Func_251ec: ; 251ec (9:51ec)
	cp $2
	jp nc, Func_253e9
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc c
	dec c
	jp nz, Func_25209
	ld hl, $0
	jp Func_2520c

Func_25209: ; 25209 (9:5209)
	ld hl, $2f
Func_2520c: ; 2520c (9:520c)
	add hl, de
	call WriteHLToSPPlus9
	ld l, c
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus7
	pop bc
	push bc
	push af
	ld l, c
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
	call WriteHLToSPPlus7
	read_hl_from_sp_plus $b
	call Func_24749
	ld hl, sp+$4
	ld [hl], a
	call Func_24001
	xor a
	read_hl_from_sp_plus $b
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25395
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $a
	jp z, Func_25395
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	call GetHLAtSPPlus9
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp nz, Func_25395
	ld a, $64
	call Func_24600
	call GetHLAtSPPlus9
	ld de, $74
	add hl, de
	cp [hl]
	jp nc, Func_25395
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp z, Func_25395
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_252e4
	cp $2
	jp nz, Func_25310
Func_252e4: ; 252e4 (9:52e4)
	call GetHLAtSPPlus9
	ld de, $73
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus9
	ld de, $76
	add hl, de
	ld c, l
	ld b, h
	xor a
Func_252f7: ; 252f7 (9:52f7)
	cp $4
	jp nc, Func_25310
	push af
	xor a
	ld [bc], a
	ld l, c
	ld h, b
	inc hl
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	inc a
	inc bc
	inc bc
	inc bc
	jp Func_252f7

Func_25310: ; 25310 (9:5310)
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $4
	jp nz, Func_2534d
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $fe
	jp nz, Func_2534a
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld [hl], $0
	call GetHLAtSPPlus9
	ld de, $71
	add hl, de
	ld a, [hl]
	and $cf
	ld c, a
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus9
	ld de, $71
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_2534a: ; 2534a (9:534a)
	jp Func_25363

Func_2534d: ; 2534d (9:534d)
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $6
	jp nz, Func_25363
	call GetHLAtSPPlus9
	ld de, $5e
	add hl, de
	ld [hl], $ff
Func_25363: ; 25363 (9:5363)
	ld hl, sp+$4
	ld a, [hl]
	call GetHLAtSPPlus9
	ld de, $75
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $b
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24180
	call Func_24010
	xor a
	call Func_24036
	callba_hli Func_d767
Func_25395: ; 25395 (9:5395)
	call GetHLAtSPPlus7
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
	dec a
	or h
	jp nz, Func_253dd
	call GetHLAtSPPlus9
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $80
	jp z, Func_253dd
	call GetHLAtSPPlus7
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $cf
	ld e, a
	inc hl
	ld d, [hl]
	ld a, e
	or $20
	ld c, a
	ld b, d
	call GetHLAtSPPlus7
	ld de, $6f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_253dd: ; 253dd (9:53dd)
	pop af
	inc a
	pop bc
	push af
	ld a, c
	xor $1
	ld c, a
	pop af
	jp Func_251ec

Func_253e9: ; 253e9 (9:53e9)
	push bc
	call Func_24001
	ld l, $0
	pop bc
Func_253f0: ; 253f0 (9:53f0)
	ld a, l
	cp $2
	jp nc, Func_2542b
	push bc
	push hl
	ld l, c
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	reg16swap de, hl
	ld hl, $6f
	add hl, de
	ld a, [hl]
	and $7f
	ld [hl], a
	inc hl
	pop hl
	inc l
	pop bc
	ld a, c
	xor $1
	ld c, a
	jp Func_253f0

Func_2542b: ; 2542b (9:542b)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_25430: ; 25430
	callba_hli Func_5c386
	ret

Func_2543f: ; 2543f (9:543f)
	push af
	push de
	add sp, -$18
	read_hl_from_sp_plus $1a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $18
	read_hl_from_sp_plus $1a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $16
	ld c, $0
	push bc
	xor a
	call Func_24001
	read_hl_from_sp_plus $18
	ld de, $d
	add hl, de
	call Func_24010
	pop bc
	read_hl_from_sp_plus $18
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
	dec a
	or h
	jp nz, Func_25497
	ld c, $18
	jp Func_254a7

Func_25497: ; 25497 (9:5497)
	read_hl_from_sp_plus $18
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_254a7
	ld c, $16
Func_254a7: ; 254a7 (9:54a7)
	ld a, c
	cp $16
	jp z, Func_254c4
	cp $18
	jp nz, Func_254f4
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_2433a
	call Func_24023
	call Func_24036
	jp Func_25662

Func_254c4: ; 254c4 (9:54c4)
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_2432c
	call Func_24023
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_254e0
	ld hl, Text_24347
	call Func_24010
	jp Func_254e6

Func_254e0: ; 254e0 (9:54e0)
	ld hl, Text_24342
	call Func_24010
Func_254e6: ; 254e6 (9:54e6)
	call Func_24036
	read_hl_from_sp_plus $16
	ld de, $d
	add hl, de
	call Func_24010
Func_254f4: ; 254f4 (9:54f4)
	read_hl_from_sp_plus $18
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25532
	cp $fe
	jp nz, Func_25662
	ld hl, Text_24247
	call Func_24010
	read_hl_from_sp_plus $16
	ld de, $17
	add hl, de
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $1c
	ld de, $12
	add hl, de
	pop de
	call Func_241f
	call Func_24036
	ld e, $1
	ld hl, sp+$1b
	ld a, [hl]
	xor $1
	call Func_2465a
	jp Func_25662

Func_25532: ; 25532 (9:5532)
	read_hl_from_sp_plus $18
	ld de, $5f
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $1a
	pop de
	add hl, de
	ld c, l
	ld b, h
	push bc
	push af
	ld hl, Text_2406f
	call Func_24010
	set_farcall_addrs_hli Func_56ba1
	pop af
	ld c, a
	ld hl, sp+$1d
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	call FarCall
	ld hl, sp+$2
	call Func_24023
	ld hl, Text_24067
	call Func_24010
	read_hl_from_sp_plus $18
	ld de, $17
	add hl, de
	ld l, [hl]
	push hl
	read_hl_from_sp_plus $1e
	ld de, $12
	add hl, de
	pop de
	call Func_241f
	call Func_24036
	pop bc
	read_hl_from_sp_plus $18
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $8
	jp nz, Func_2564d
	read_hl_from_sp_plus $1a
	ld de, $4e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_2564a
	ld a, [bc]
	cp $fe
	jp z, Func_255c4
	or a
	jp nz, Func_25604
	read_hl_from_sp_plus $1a
	ld de, $29
	add hl, de
	ld e, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	call Func_2465a
	jp Func_2564a

Func_255c4: ; 255c4 (9:55c4)
	push bc
	read_hl_from_sp_plus $1c
	ld de, $29
	add hl, de
	ld e, [hl]
	ld hl, sp+$1d
	ld a, [hl]
	call Func_2465a
	pop hl
	inc hl
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $18
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld l, a
	push hl
	read_hl_from_sp_plus $1c
	ld de, $2a
	add hl, de
	pop de
	call GetMove
	read_hl_from_sp_plus $1a
	ld de, $3a
	add hl, de
	ld e, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	call Func_2465a
	jp Func_2564a

Func_25604: ; 25604 (9:5604)
	ld a, BANK(Moves)
	ld [wFarCallDestBank], a
	ld a, [bc]
	ld l, a
	ld h, $0
	mulhlby19
	ld de, Moves - $13
	add hl, de
	push hl
	read_hl_from_sp_plus $1c
	ld de, $3b
	add hl, de
	pop de
	ld bc, $13
	call FarCopyVideoData
	xor a
Func_2562c: ; 2562c (9:562c)
	cp $3
	jp nc, Func_2564a
	push af
	read_hl_from_sp_plus $1c
	ld de, $49
	add hl, de
	ld e, a
	ld d, $0
	add hl, de
	ld e, [hl]
	ld hl, sp+$1d
	ld a, [hl]
	call Func_2465a
	pop af
	inc a
	jp Func_2562c

Func_2564a: ; 2564a (9:564a)
	jp Func_25662

Func_2564d: ; 2564d (9:564d)
	ld hl, Text_24252
	call Func_24010
	ld hl, Text_24278
	call Func_24023
	ld hl, Text_241ce
	call Func_24010
	call Func_24045
Func_25662: ; 25662 (9:5662)
	read_hl_from_sp_plus $18
	ld de, $66
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $1a
	ld de, $e
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $18
	ld de, $67
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $1a
	ld de, $8
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $18
	ld de, $69
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	read_hl_from_sp_plus $1a
	ld de, $a
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	add sp, $1c
	ret

Func_256a3: ; 256a3 (9:56a3)
	push de
	push bc
	push bc
	call GetHLAtSPPlus6
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus3
	call GetHLAtSPPlus6
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$2
	ld [hl], $0
	call GetHLAtSPPlus5
	ld de, $6b
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus8
	ld de, $f
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop de
	ld hl, $6f
	add hl, de
	ld a, [hl]
	and $40
	jp nz, Func_25707
	call GetHLAtSPPlus6
	ld de, $f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld a, $64
	call Func_24600
	ld l, a
	ld h, $0
	pop de
	call CompareHLtoDE
	jp c, Func_25703
	call GetHLAtSPPlus3
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $fe
	jp nz, Func_25707
Func_25703: ; 25703 (9:5703)
	ld hl, sp+$0
	ld [hl], $1
Func_25707: ; 25707 (9:5707)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	ret

Func_2570e: ; 2570e (9:570e)
	push af
	push de
	add sp, -$28
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	write_hl_to_sp_plus $27
	read_hl_from_sp_plus $2a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $25
	read_hl_from_sp_plus $2a
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $23
	read_hl_from_sp_plus $2a
	ld de, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $21
	read_hl_from_sp_plus $2a
	ld de, $e
	add hl, de
	ld e, [hl]
	ld hl, sp+$1e
	ld [hl], e
	read_hl_from_sp_plus $2a
	ld de, $a
	add hl, de
	ld c, [hl]
	push bc
	read_hl_from_sp_plus $2c
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $69
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $20
	ld hl, sp+$1d
	ld [hl], $1
	xor a
	ld hl, sp+$1c
	ld [hl], $0
	call Func_24001
	pop bc
	read_hl_from_sp_plus $25
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
	dec a
	or h
	jp nz, Func_257ab
	jp Func_25c7e

Func_257ab: ; 257ab (9:57ab)
	ld a, c
	and $80
	jp z, Func_257c4
	read_hl_from_sp_plus $25
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_257c4
	ld a, c
	and $7f
	ld hl, sp+$1a
	ld [hl], a
Func_257c4: ; 257c4 (9:57c4)
	ld hl, sp+$1a
	ld a, [hl]
	cp $12
	jp z, Func_25813
	cp $1f
	jp z, Func_25802
	cp $d
	jp z, Func_257f1
	cp $26
	jp z, Func_257e0
	cp $25
	jp nz, Func_25813
Func_257e0: ; 257e0 (9:57e0)
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_2639a
	jp Func_25c7e

Func_257f1: ; 257f1 (9:57f1)
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_2639a
	jp Func_25c7e

Func_25802: ; 25802 (9:5802)
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_26c02
	jp Func_25c7e

Func_25813: ; 25813 (9:5813)
	read_hl_from_sp_plus $25
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $fe
	jp nz, Func_25881
	read_hl_from_sp_plus $25
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $18
	call DivideHLByDESigned
	inc hl
	ld a, l
	call Func_24600
	ld l, a
	ld h, $0
	push hl
	read_hl_from_sp_plus $27
	ld de, $60
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $c
	call DivideHLByDESigned
	pop de
	add hl, de
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25869
	ld de, $1
	jp Func_25869

Func_25869: ; 25869 (9:5869)
	ld hl, sp+$2b
	ld a, [hl]
	call Bank9_DamageOrHeal
	reg16swap de, hl
	ld a, e
	or d
	jp nz, Func_2587e
	ld hl, sp+$2b
	ld a, [hl]
	call Func_2466d
Func_2587e: ; 2587e (9:587e)
	jp Func_25c7e

Func_25881: ; 25881 (9:5881)
	read_hl_from_sp_plus $25
	ld de, $6d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from_sp_plus $23
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_25a7b
	read_hl_from_sp_plus $1e
	ld a, l
	and $80
	jp z, Func_25a7b
	read_hl_from_sp_plus $1e
	ld a, l
	and $7f
	ld l, a
	ld h, $0
	ld a, l
	sub $22
	or h
	jp z, Func_259a4
	ld a, l
	sub $21
	or h
	jp z, Func_25944
	ld a, l
	sub $1d
	or h
	jp nz, Func_25a75
	read_hl_from_sp_plus $1e
	ld e, h
	ld d, $0
	ld hl, sp+$1e
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nz, Func_2593e
	ld a, $1
	ld hl, Text_24252
	call Func_24010
	ld hl, sp+$6
	reg16swap de, hl
	ld a, $1d
	call Func_24759
	ld hl, sp+$6
	call Func_24010
	read_hl_from_sp_plus $21
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24275
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_24744
	ld hl, sp+$6
	call Func_24010
	ld hl, Text_24160
	call Func_24010
	call Func_24045
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	xor $1
	call Func_24632
	call WriteHLToSPPlus6
	ld hl, sp+$1b
	ld [hl], $0
	jp Func_25941

Func_2593e: ; 2593e (9:593e)
	jp Func_25a7b

Func_25941: ; 25941 (9:5941)
	jp Func_25a78

Func_25944: ; 25944 (9:5944)
	read_hl_from_sp_plus $1e
	ld e, h
	ld d, $0
	ld hl, sp+$1e
	ld l, [hl]
	ld h, $0
	call CompareHLtoDE
	jp nz, Func_2599e
	ld a, $2
	ld hl, Text_24252
	call Func_24023
	ld hl, sp+$6
	reg16swap de, hl
	ld a, $21
	call Func_24759
	ld hl, sp+$6
	call Func_24010
	ld hl, Text_241be
	call Func_24023
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_25981
	call Func_24045
	jp Func_25984

Func_25981: ; 25981 (9:5981)
	call Func_24036
Func_25984: ; 25984 (9:5984)
	ld hl, sp+$4
	ld bc, $1
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $25
	ld de, $6d
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, sp+$1b
	ld [hl], $0
	jp Func_259a1

Func_2599e: ; 2599e (9:599e)
	jp Func_25a7b

Func_259a1: ; 259a1 (9:59a1)
	jp Func_25a78

Func_259a4: ; 259a4 (9:59a4)
	ld hl, Text_24252
	call Func_24023
	ld hl, sp+$6
	reg16swap de, hl
	ld a, $22
	call Func_24759
	ld hl, sp+$6
	call Func_24010
	ld hl, sp+$0
	push hl
	read_hl_from_sp_plus $20
	ld e, $81
	call Func_2478b
	ld l, a
	ld h, $0
	ld de, $64
	pop bc
	call Func_2617
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1
	ld c, [hl]
	ld hl, sp+$0
	ld h, [hl]
	ld b, h
	call GetHLAtSPPlus6
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	call WriteHLToSPPlus6
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25a06
	ld hl, $1
	call WriteHLToSPPlus6
Func_25a06: ; 25a06 (9:5a06)
	ld hl, Text_24195
	call Func_24023
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_24744
	ld hl, sp+$6
	call Func_24010
	ld hl, Text_241c9
	call Func_24010
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $27
	ld de, $6d
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d

	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	xor $1
	call Bank9_DamageOrHeal
	call WriteHLToSPPlus6

	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_25a66
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_25a60
	call Func_24045
	jp Func_25a63

Func_25a60: ; 25a60 (9:5a60)
	call Func_24036
Func_25a63: ; 25a63 (9:5a63)
	jp Func_25a6e

Func_25a66: ; 25a66 (9:5a66)
	ld hl, sp+$2b
	ld a, [hl]
	xor $1
	call Func_2466d
Func_25a6e: ; 25a6e (9:5a6e)
	ld hl, sp+$1b
	ld [hl], $0
	jp Func_25a78

Func_25a75: ; 25a75 (9:5a75)
	jp Func_25a7b

Func_25a78: ; 25a78 (9:5a78)
	jp Func_25b71

Func_25a7b: ; 25a7b (9:5a7b)
	read_hl_from_sp_plus $25
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $80
	ld [hl], a
	inc hl
	read_hl_from_sp_plus $25
	ld de, $6d
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	read_hl_from_sp_plus $21
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, sp+$1a
	ld a, [hl]
	cp $12
	jp nz, Func_25ab0
	ld hl, Text_24310
	call Func_24010
Func_25ab0: ; 25ab0 (9:5ab0)
	ld hl, Text_2406b
	call Func_24010
	ld hl, sp+$6
	push hl
	call GetHLAtSPPlus8
	pop de
	call Func_24744
	ld hl, sp+$6
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24195
	call Func_24010
	ld hl, Text_24067
	call Func_24010
	ld hl, sp+$1a
	ld a, [hl]
	cp $12
	jp nz, Func_25b19
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $23
	ld de, $1c
	add hl, de
	pop de
	ld a, [hl]
	sub e
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc d
	ld [hl], a
	ld hl, sp+$1b
	ld [hl], $0
	read_hl_from_sp_plus $21
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_25b16
	read_hl_from_sp_plus $21
	ld de, $1c
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
.asm_25b16
	jp Func_25b71

Func_25b19: ; 25b19 (9:5b19)
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	xor $1
	call Bank9_DamageOrHeal
	call WriteHLToSPPlus6

	call GetHLAtSPPlus6
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_25b48
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_25b48
	call Func_24045
	jp Func_25b71

Func_25b48: ; 25b48 (9:5b48)
	call Func_24036
	ld hl, sp+$2b
	ld a, [hl]
	xor $1
	call Func_2466d
	ld hl, sp+$1a
	ld a, [hl]
	cp $1e
	jp nz, Func_25b71
	call GetHLAtSPPlus6
	ld a, l
	or h
	jp nz, Func_25b71
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_26bab
Func_25b71: ; 25b71 (9:5b71)
	read_hl_from_sp_plus $27
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25b81
	jp Func_25c7e

Func_25b81: ; 25b81 (9:5b81)
	read_hl_from_sp_plus $2a
	ld de, $11
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_25c7e
	read_hl_from_sp_plus $2a
	ld de, $11
	add hl, de
	ld [hl], $1
	read_hl_from_sp_plus $25
	ld de, $5f
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25c40
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp z, Func_25c40
	ld hl, sp+$2b
	ld a, [hl]
	or a
	jp nz, Func_25bec
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_25bcf
	ld hl, Text_2456f
	call Func_24023
	ld hl, Text_24574
	call Func_24023
	jp Func_25be9

Func_25bcf: ; 25bcf (9:5bcf)
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	cp $4
	jp nz, Func_25be9
	ld hl, Text_2459a
	call Func_24023
	ld hl, Text_245a0
	call Func_24023
Func_25be9: ; 25be9 (9:5be9)
	jp Func_25c22

Func_25bec: ; 25bec (9:5bec)
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_25c08
	ld hl, Text_24584
	call Func_24023
	ld hl, Text_2458a
	call Func_24023
	jp Func_25c22

Func_25c08: ; 25c08 (9:5c08)
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	cp $4
	jp nz, Func_25c22
	ld hl, Text_245b3
	call Func_24023
	ld hl, Text_245b8
	call Func_24023
Func_25c22: ; 25c22 (9:5c22)
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25c3d
	read_hl_from_sp_plus $25
	ld de, $c7
	add hl, de
	ld a, [hl]
	cp $4
	jp nz, Func_25c40
Func_25c3d: ; 25c3d (9:5c3d)
	call Func_24036
Func_25c40: ; 25c40 (9:5c40)
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_2639a
	read_hl_from_sp_plus $27
	ld de, $8
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $27
	ld de, $9
	add hl, de
	or [hl]
	jp z, Func_25c66
	jp Func_25c7e

Func_25c66: ; 25c66 (9:5c66)
	read_hl_from_sp_plus $2a
	reg16swap de, hl
	ld hl, sp+$2b
	ld a, [hl]
	call Func_25c81
	read_hl_from_sp_plus $2a
	ld de, $11
	add hl, de
	ld [hl], $0
Func_25c7e: ; 25c7e (9:5c7e)
	add sp, $2c
	ret

Func_25c81: ; 25c81 (9:5c81)
	push af
	push de
	add sp, -$54
	ld hl, sp+$4
	push hl
	read_hl_from_sp_plus $58
	pop de
	ld bc, $4f
	call MemCopy
	read_hl_from_sp_plus $56
	ld de, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	read_hl_from_sp_plus $56
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $c
	read_hl_from_sp_plus $56
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop de
	push hl
	read_hl_from_sp_plus $56
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	ld c, l
	ld b, h
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_25cdc
	jp Func_25dd2

Func_25cdc: ; 25cdc (9:5cdc)
	pop hl
	push hl
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_25d05
	ld hl, $75
	add hl, bc
	ld a, [hl]
	cp $a
	jp z, Func_25d05
	ld hl, $6f
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld b, $4
	call RightShiftHL
	ld a, l
	and $3
	jp z, Func_25d08
Func_25d05: ; 25d05 (9:5d05)
	jp Func_25dd2

Func_25d08: ; 25d08 (9:5d08)
	pop hl
	push hl
	ld de, $67
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $e
	pop hl
	push hl
	ld de, $69
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $10
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld e, $81
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_25d3d
	jp Func_25dd2

Func_25d3d: ; 25d3d (9:5d3d)
	call GetHLAtSPPlus4
	ld e, l
	ld hl, sp+$10
	ld [hl], e
	call GetHLAtSPPlus4
	ld e, h
	ld hl, sp+$11
	ld [hl], e
	pop hl
	push hl
	ld de, $66
	add hl, de
	ld e, [hl]
	ld hl, sp+$12
	ld [hl], e
	pop hl
	push hl
	ld de, $6b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $15
	pop hl
	push hl
	ld de, $6d
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus4
	ld de, $6d
	add hl, de
	ld de, $2
	call DividePointerByDESigned
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_25d94
	call GetHLAtSPPlus4
	ld de, $6d
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
Func_25d94: ; 25d94 (9:5d94)
	call GetHLAtSPPlus4
	ld de, $6f
	add hl, de
	ld a, [hl]
	or $2
	ld [hl], a
	inc hl
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	xor $1
	call Func_2543f
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	xor $1
	call Func_2570e
	call GetHLAtSPPlus4
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $fd
	ld [hl], a
	inc hl
	pop bc
	pop hl
	push hl
	ld de, $6d
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_25dd2: ; 25dd2 (9:5dd2)
	add sp, $58
	ret

Func_25dd5: ; 25dd5 (9:5dd5)
	push de
	ld hl, Text_24252
	call Func_24010
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $d
	add hl, de
	call Func_24010
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_240f1
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24175
	call Func_24023
	call Func_24045
	ret

Func_25e07: ; 25e07 (9:5e07)
	push af
	add sp, -$12
	push de
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $13
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $11
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $f
	pop de
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $d
	pop de
	ld hl, $c
	add hl, de
	ld a, [hl]
	ld hl, sp+$8
	ld [hl], a
	ld hl, $d
	add hl, de
	ld a, [hl]
	ld hl, sp+$7
	ld [hl], a
	ld hl, $a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
	ld hl, sp+$4
	ld [hl], $0
	read_hl_from_sp_plus $d
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, sp+$8
	ld a, [hl]
	and $f
	ld hl, sp+$0
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp z, Func_25e90
	ld hl, sp+$0
	ld a, [hl]
	cp $d
	jp nz, Func_25f9c
Func_25e90: ; 25e90 (9:5e90)
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp nz, Func_25f99
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_24071
	call Func_24010
	ld hl, Text_241ac
	call Func_24010
	ld hl, sp+$0
	ld a, [hl]
	cp $d
	jp nz, Func_25f12
	ld a, $64
	call Func_24600
	push af
	ld hl, sp+$9
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, Data_245d0
	add hl, de
	pop af
	cp [hl]
	jp nc, Func_25f12
	ld a, $64
	call Func_24600
	push af
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld b, $4
	call RightShiftHL
	ld bc, Data_245d0
	add hl, bc
	pop af
	cp [hl]
	jp nc, Func_25f0b
	ld hl, sp+$4
	ld [hl], $3
	read_hl_from_sp_plus $11
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	or $4
	ld [hl], a
	jp Func_25f0f

Func_25f0b: ; 25f0b (9:5f0b)
	ld hl, sp+$4
	ld [hl], $2
Func_25f0f: ; 25f0f (9:5f0f)
	jp Func_25f99

Func_25f12: ; 25f12 (9:5f12)
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_25f99
	ld a, $64
	call Func_24600
	push af
	ld hl, sp+$9
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, Data_245d0
	add hl, de
	pop af
	cp [hl]
	jp nc, Func_25f99
	ld a, $64
	call Func_24600
	push af
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld b, $4
	call RightShiftHL
	ld bc, Data_245d0
	add hl, bc
	pop af
	cp [hl]
	jp nc, Func_25f95
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $1
	jp nc, Func_25f95
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld [hl], $1
	ld a, [hl]
	read_hl_from_sp_plus $d
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	ld b, $4
	call RightShiftHL
	ld bc, Data_245c8
	add hl, bc
	ld a, [hl]
	read_hl_from_sp_plus $11
	ld de, $74
	add hl, de
	ld [hl], a
	read_hl_from_sp_plus $11
	ld de, $73
	add hl, de
	ld [hl], $7
	ld hl, sp+$4
	ld [hl], $3
	jp Func_25f99

Func_25f95: ; 25f95 (9:5f95)
	ld hl, sp+$4
	ld [hl], $2
Func_25f99: ; 25f99 (9:5f99)
	jp Func_26265

Func_25f9c: ; 25f9c (9:5f9c)
	ld hl, sp+$0
	ld a, [hl]
	cp $a
	jp nz, Func_26008
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_26005
	read_hl_from_sp_plus $11
	ld de, $75
	add hl, de
	ld [hl], $a
	ld a, [hl]
	read_hl_from_sp_plus $d
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $64
	ld hl, sp+$4
	ld [hl], $5
	read_hl_from_sp_plus $11
	ld de, $74
	add hl, de
	ld [hl], $64
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_241b9
	call Func_24010
	call Func_24045
	callba_hli Func_d767
	jp Func_26397

Func_26005: ; 26005 (9:6005)
	jp Func_26265

Func_26008: ; 26008 (9:6008)
	ld hl, sp+$0
	ld a, [hl]
	cp $d
	jp z, Func_261cc
	cp $c
	jp z, Func_261a8
	cp $b
	jp z, Func_26184
	cp $9
	jp z, Func_26160
	cp $8
	jp z, Func_2613c
	cp $7
	jp z, Func_26118
	cp $6
	jp z, Func_260f4
	cp $5
	jp z, Func_260d0
	cp $4
	jp z, Func_260ac
	cp $3
	jp z, Func_26088
	cp $2
	jp z, Func_2606b
	cp $1
	jp nz, Func_261ed
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $82
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_2606b: ; 2606b (9:606b)
	ld hl, sp+$3
	ld [hl], $64
	call GetHLAtSPPlus7
	ld e, $81
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_26088: ; 26088 (9:6088)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_260ac: ; 260ac (9:60ac)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_260d0: ; 260d0 (9:60d0)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_260f4: ; 260f4 (9:60f4)
	call GetHLAtSPPlus7
	ld e, $81
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $82
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_26118: ; 26118 (9:6118)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_2613c: ; 2613c (9:613c)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_26160: ; 26160 (9:6160)
	call GetHLAtSPPlus7
	ld e, $81
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_26184: ; 26184 (9:6184)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_261a8: ; 261a8 (9:61a8)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $80
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
	jp Func_261ed

Func_261cc: ; 261cc (9:61cc)
	call GetHLAtSPPlus7
	ld e, $83
	call Func_2478b
	ld hl, sp+$3
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $82
	call Func_2478b
	ld hl, sp+$2
	ld [hl], a
	call GetHLAtSPPlus7
	ld e, $0
	call Func_2478b
	ld hl, sp+$1
	ld [hl], a
Func_261ed: ; 261ed (9:61ed)
	ld a, $64
	call Func_24600
	ld hl, sp+$3
	cp [hl]
	jp nc, Func_26265
	ld hl, sp+$4
	ld [hl], $1
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_24071
	call Func_24010
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_2456b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24010
	ld a, $64
	call Func_24600
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_26261
	read_hl_from_sp_plus $f
	ld de, $75
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	cp [hl]
	jp nc, Func_26261
	read_hl_from_sp_plus $f
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp z, Func_2625a
	ld hl, sp+$4
	ld [hl], $4
	jp Func_2625e

Func_2625a: ; 2625a (9:625a)
	ld hl, sp+$4
	ld [hl], $5
Func_2625e: ; 2625e (9:625e)
	jp Func_26265

Func_26261: ; 26261 (9:6261)
	ld hl, sp+$4
	ld [hl], $2
Func_26265: ; 26265 (9:6265)
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp z, Func_26397
	ld hl, sp+$4
	ld a, [hl]
	cp $5
	jp z, Func_262e0
	cp $4
	jp z, Func_262d1
	cp $3
	jp z, Func_26292
	cp $2
	jp nz, Func_26394
	ld hl, Text_24252
	call Func_24023
	ld hl, Text_241b2
	call Func_24010
	jp Func_26394

Func_26292: ; 26292 (9:6292)
	read_hl_from_sp_plus $d
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_24257
	call Func_24010
	call Func_24045
	callba_hli Func_d767
	jp Func_26397

Func_262d1: ; 262d1 (9:62d1)
	ld hl, Text_24252
	call Func_24023
	ld hl, Text_2425f
	call Func_24010
	jp Func_26394

Func_262e0: ; 262e0 (9:62e0)
	call Func_24036
	read_hl_from_sp_plus $b
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_240ce
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_241b9
	call Func_24010
	ld hl, sp+$0
	ld a, [hl]
	cp $b
	jp z, Func_2631e
	ld hl, sp+$0
	ld a, [hl]
	cp $c
	jp nz, Func_26346
Func_2631e: ; 2631e (9:631e)
	ld hl, sp+$0
	ld a, [hl]
	cp $b
	jp nz, Func_26336
	read_hl_from_sp_plus $f
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	or $2
	ld [hl], a
	jp Func_26343

Func_26336: ; 26336 (9:6336)
	read_hl_from_sp_plus $f
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	or $1
	ld [hl], a
Func_26343: ; 26343 (9:6343)
	jp Func_26380

Func_26346: ; 26346 (9:6346)
	ld hl, sp+$1
	ld a, [hl]
	read_hl_from_sp_plus $f
	ld de, $74
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	read_hl_from_sp_plus $b
	ld de, $22
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	read_hl_from_sp_plus $f
	ld de, $75
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_26380
	ld hl, sp+$7
	ld a, [hl]
	and $f0
	read_hl_from_sp_plus $f
	ld de, $73
	add hl, de
	ld [hl], a
Func_26380: ; 26380 (9:6380)
	call Func_24045
	callba_hli Func_d767
	jp Func_26397

Func_26394: ; 26394 (9:6394)
	call Func_24045
Func_26397: ; 26397 (9:6397)
	add sp, $14
	ret

Func_2639a: ; 2639a (9:639a)
	push af
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	or b
	jp nz, Func_263aa
	jp Func_263c9

Func_263aa: ; 263aa (9:63aa)
	ld hl, $c
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, $d
	add hl, de
	ld [hl], b
	and $80
	jp nz, Func_263c3
	ld hl, sp+$1
	ld a, [hl]
	call Func_25e07
	jp Func_263c9

Func_263c3: ; 263c3 (9:63c3)
	ld hl, sp+$1
	ld a, [hl]
	call Func_26fe8
Func_263c9: ; 263c9 (9:63c9)
	pop bc
	ret

Func_263cb: ; 263cb (9:63cb)
	push af
	push bc
	push bc
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	pop de
	push hl
	ld hl, Text_24284
	call Func_24010
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2644e
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld de, $8
	add hl, de
	add hl, bc
	ld a, [hl]
	and $1
	jp nz, Func_2644e
	ld a, $64
	call Func_24600
	push af
	call GetHLAtSPPlus6
	ld de, $69
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $83
	call Func_2478b
	pop bc
	cp b
	jp c, Func_2644e
	ld hl, Text_24299
	call Func_24023
	ld hl, sp+$5
	ld a, [hl]
	add $2
	ld b, a
	ld a, $1
	call LeftShiftA
	pop hl
	push hl
	ld de, $7
	add hl, de
	or [hl]
	ld [hl], a
	ld hl, $1
	jp Func_26457

Func_2644e: ; 2644e (9:644e)
	ld hl, Text_2428c
	call Func_24023
	ld hl, $0
Func_26457: ; 26457 (9:6457)
	pop bc
	pop bc
	pop bc
	ret

Func_2645b: ; 2645b (9:645b)
	push af
	push bc
	push bc
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	pop de
	push hl
	ld hl, Text_24284
	call Func_24010
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_264de
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	pop hl
	push hl
	ld de, $8
	add hl, de
	add hl, bc
	ld a, [hl]
	and $1
	jp nz, Func_264de
	ld a, $64
	call Func_24600
	push af
	call GetHLAtSPPlus6
	ld de, $69
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	pop bc
	cp b
	jp c, Func_264de
	ld hl, Text_24299
	call Func_24023
	ld hl, sp+$5
	ld a, [hl]
	add $2
	ld b, a
	ld a, $1
	call LeftShiftA
	pop hl
	push hl
	ld de, $7
	add hl, de
	or [hl]
	ld [hl], a
	ld hl, $1
	jp Func_264e7

Func_264de: ; 264de (9:64de)
	ld hl, Text_2428c
	call Func_24023
	ld hl, $0
Func_264e7: ; 264e7 (9:64e7)
	pop bc
	pop bc
	pop bc
	ret

Func_264eb: ; 264eb
	ret

Func_264ec: ; 264ec
	ret

Data_264ed: ; 264ed
	db $00, $00, $4c, $cc

Func_264f1: ; 264f1
	push af
	add sp, -$1e
	push de
	ld hl, $6
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $1f
	pop de
	push bc
	ld hl, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	reg16swap de, hl
	ld e, $83
	call Func_2478b
	ld hl, sp+$1e
	ld [hl], a
	pop hl
	ld b, $c
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$1b
	ld [hl], c
	pop bc
	ld hl, $2c
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	inc hl
	ld d, $0
	ld hl, sp+$18
	ld [hl], e
	ld a, $64
	call Func_24600
	ld hl, sp+$1a
	cp [hl]
	jp nc, Func_265cd
	ld hl, sp+$19
	ld a, [hl]
	ld hl, sp+$18
	cp [hl]
	jp z, Func_26570
	ld hl, sp+$19
	ld a, [hl]
	cp $d
	jp z, Func_26570
	ld hl, sp+$19
	ld a, [hl]
	cp $e
	jp nz, Func_265cd
	ld hl, sp+$18
	ld a, [hl]
	cp $a
	jp z, Func_26570
	ld hl, sp+$18
	ld a, [hl]
	cp $c
	jp nz, Func_265cd
Func_26570: ; 26570 (9:6570)
	ld hl, Text_2426b
	call Func_24010
	ld hl, Text_24313
	call Func_24023
	ld hl, sp+$14
	ld c, l
	ld b, h
	read_hl_from_sp_plus $1d
	ld de, $6d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, Data_264ed
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$15
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_265a8
	ld bc, $1
Func_265a8: ; 265a8 (9:65a8)
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_24744
	ld hl, sp+$2
	call Func_24010
	call Func_24036
	pop de
	ld hl, sp+$1f
	ld a, [hl]
	xor $1
	call Bank9_DamageOrHeal
	ld hl, sp+$1f
	ld a, [hl]
	xor $1
	call Func_2466d
Func_265cd: ; 265cd (9:65cd)
	add sp, $20
	ret

Func_265d0: ; 265d0
	push af
	add sp, -$1c
	push de
	reg16swap de, hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $1e
	pop de
	ld hl, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	ld hl, sp+$1b
	ld [hl], a
	pop hl
	ld e, $80
	call Func_2478b
	ld hl, sp+$18
	ld [hl], a
	ld a, $64
	call Func_24600
	ld hl, sp+$19
	cp [hl]
	jp nc, Func_26672
	ld hl, Text_24413
	call Func_24010
	ld hl, sp+$14
	ld c, l
	ld b, h
	ld de, $64
	ld hl, sp+$18
	ld l, [hl]
	ld h, $0
	call Func_2617
	ld hl, sp+$14
	ld c, l
	ld b, h
	read_hl_from_sp_plus $1c
	ld de, $6d
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$14
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$14
	ld a, [hl]
	ld hl, sp+$15
	ld l, [hl]
	ld h, a
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_26649
	ld bc, $1
Func_26649: ; 26649 (9:6649)
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_24744
	ld hl, sp+$2
	call Func_24023
	ld hl, Text_2441f
	call Func_24010
	call Func_24036
	pop de
	ld hl, sp+$1d
	ld a, [hl]
	call Bank9_DamageOrHeal
	ld c, l
	ld b, h
	ld hl, sp+$1d
	ld a, [hl]
	call Func_2466d
Func_26672: ; 26672 (9:6672)
	add sp, $1e
	ret

Func_26675: ; 26675 (9:6675)
	push af
	push bc
	push bc
	push bc
	push bc
	push bc
	push de
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $b
	pop de
	push de
	push bc
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $b
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	call WriteHLToSPPlus9
	ld e, $b
	ld hl, sp+$f
	ld a, [hl]
	xor $1
	call Func_2465a
	pop bc
	push bc
	ld hl, $d
	add hl, bc
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24326
	call Func_24023
	call Func_24045
	pop bc
	ld hl, $18
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	call GetHLAtSPPlus5
	reg16swap de, hl
	ld hl, sp+$d
	ld a, [hl]
	call Bank9_DamageOrHeal
	pop de
	ld hl, $a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, $81
	call Func_2478b
	ld hl, sp+$0
	ld [hl], a
	ld a, $64
	call Func_24600
	ld hl, sp+$0
	cp [hl]
	jp c, Func_2671a
	call GetHLAtSPPlus9
	ld de, $18
	add hl, de
	ld a, [hl]
	dec a
	inc hl
	or [hl]
	jp nz, Func_267a8
Func_2671a: ; 2671a (9:671a)
	call GetHLAtSPPlus9
	ld de, $d
	add hl, de
	call Func_24010
	call GetHLAtSPPlus7
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp z, Func_26759
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_2411d
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_240c6
	call Func_24010
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24185
	call Func_24010
	jp Func_267a5

Func_26759: ; 26759 (9:6759)
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_242a1
	call Func_24023
	ld e, $b
	ld hl, sp+$b
	ld a, [hl]
	call Func_2465a
	call GetHLAtSPPlus3
	push hl
	read_hl_from_sp_plus $b
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call CompareHLtoDE
	jp nc, Func_26796
	call GetHLAtSPPlus9
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	dec hl
	call WriteHLToSPPlus3
Func_26796: ; 26796 (9:6796)
	call GetHLAtSPPlus3
	reg16swap de, hl
	ld hl, sp+$b
	ld a, [hl]
	xor $1
	call Bank9_DamageOrHeal
Func_267a5: ; 267a5 (9:67a5)
	jp Func_267be

Func_267a8: ; 267a8 (9:67a8)
	ld hl, Text_24252
	call Func_24010
	call GetHLAtSPPlus9
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_241d9
	call Func_24023
Func_267be: ; 267be (9:67be)
	ld hl, sp+$b
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus5
	ld de, $8
	add hl, de
	add hl, bc
	ld a, $4
	or [hl]
	ld [hl], a
	set_farcall_addrs_hli Func_dd47
	ld hl, sp+$b
	ld a, [hl]
	call FarCall
	call GetHLAtSPPlus9
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_26816
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld a, l
	xor $1
	ld c, a
	ld b, h
	call GetHLAtSPPlus5
	ld de, $8
	add hl, de
	add hl, bc
	ld a, $4
	or [hl]
	ld [hl], a
	set_farcall_addrs_hli Func_dd47
	ld hl, sp+$b
	ld a, [hl]
	xor $1
	call FarCall
Func_26816: ; 26816 (9:6816)
	call Func_24045
	add sp, $c
	ret

Func_2681c: ; 2681c
	ret

Func_2681d: ; 2681d
	push af
	push bc
	push bc
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld hl, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_2685a
	jp Func_268a2

Func_2685a: ; 2685a (9:685a)
	pop hl
	push hl
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $4
	jp z, Func_26879
	ld hl, Text_2442a
	call Func_24010
	ld hl, Text_2442e
	call Func_24023
	call Func_24045
	jp Func_268a2

Func_26879: ; 26879 (9:6879)
	ld hl, Text_2443f
	call Func_24010
	ld hl, Text_2444b
	call Func_24023
	call Func_24045
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$5
	ld a, [hl]
	xor $1
	call Bank9_DamageOrHeal
	ld hl, sp+$5
	ld a, [hl]
	xor $1
	call Func_2466d
Func_268a2: ; 268a2 (9:68a2)
	pop bc
	pop bc
	pop bc
	ret

Func_268a6: ; 268a6
	ret

Func_268a7: ; 268a7
	ret

Func_268a8: ; 268a8 (9:68a8)
	push af
	set_farcall_addrs_hli Func_5d184
	pop af
	call FarCall
	ret

Func_268b9: ; 268b9
	push af
	add sp, -$1a
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $1b
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $19
	pop de
	ld hl, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_268f8
	jp Func_269f4

Func_268f8: ; 268f8 (9:68f8)
	read_hl_from_sp_plus $17
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
	jp z, Func_26915
	jp Func_269f4

Func_26915: ; 26915 (9:6915)
	ld c, $0
	ld hl, sp+$14
	ld [hl], c
Func_2691a: ; 2691a (9:691a)
	ld a, c
	cp $3
	jp nc, Func_26972
	read_hl_from_sp_plus $17
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp nz, Func_2695c
	read_hl_from_sp_plus $17
	ld de, $71
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, c
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
	jp nz, Func_2695c
	read_hl_from_sp_plus $17
	ld de, $23
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2695f
Func_2695c: ; 2695c (9:695c)
	jp Func_2696e

Func_2695f: ; 2695f (9:695f)
	ld hl, sp+$14
	ld a, [hl]
	inc a
	ld hl, sp+$14
	ld [hl], a
	dec a
	ld e, a
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld [hl], c
Func_2696e: ; 2696e (9:696e)
	inc c
	jp Func_2691a

Func_26972: ; 26972 (9:6972)
	ld hl, sp+$14
	ld a, [hl]
	or a
	jp nz, Func_2697c
	jp Func_269f4

Func_2697c: ; 2697c (9:697c)
	ld hl, sp+$14
	ld a, [hl]
	call Func_24600
	ld hl, sp+$14
	ld [hl], a
	ld hl, sp+$14
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld c, [hl]
	ld b, $0
	read_hl_from_sp_plus $17
	ld de, $23
	add hl, de
	add hl, bc
	ld a, [hl]
	dec a
	ld e, a
	ld hl, sp+$0
	call GetMove
	read_hl_from_sp_plus $19
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_2406f
	call Func_24010
	ld hl, Text_24065
	call Func_24010
	ld hl, sp+$0
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24486
	call Func_24023
	call Func_24045
	ld hl, sp+$14
	ld e, [hl]
	ld d, $0
	ld hl, sp+$11
	add hl, de
	ld b, [hl]
	ld hl, $1
	call LeftShiftHL
	push hl
	read_hl_from_sp_plus $19
	ld de, $71
	add hl, de
	pop de
	ld a, [hl]
	or e
	ld [hl], a
	inc hl
	ld a, [hl]
	or d
	ld [hl], a
	ld hl, sp+$1b
	ld a, [hl]
	xor $1
	call Func_268a8
Func_269f4: ; 269f4 (9:69f4)
	add sp, $1c
	ret

Func_269f7: ; 269f7
	push af
	push bc
	push bc
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	pop de
	ld hl, $a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_26a34
	jp Func_26a8a

Func_26a34: ; 26a34 (9:6a34)
	pop hl
	push hl
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp z, Func_26a43
	jp Func_26a8a

Func_26a43: ; 26a43 (9:6a43)
	pop hl
	push hl
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
	jp z, Func_26a5e
	jp Func_26a8a

Func_26a5e: ; 26a5e (9:6a5e)
	call GetHLAtSPPlus4
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_2445d
	call Func_24010
	ld hl, Text_24468
	call Func_24023
	call Func_24045
	pop hl
	push hl
	ld de, $71
	add hl, de
	ld a, [hl]
	or $8
	ld [hl], a
	inc hl
	ld hl, sp+$5
	ld a, [hl]
	xor $1
	call Func_268a8
Func_26a8a: ; 26a8a (9:6a8a)
	pop bc
	pop bc
	pop bc
	ret

Func_26a8e: ; 26a8e
	push af
	push bc
	push bc
	push bc
	push bc
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop de
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus8
	pop de
	push de
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop de
	ld hl, $a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	pop hl
	push hl
	ld e, $80
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_26adf
	jp Func_26ba4

Func_26adf: ; 26adf (9:6adf)
	call GetHLAtSPPlus4
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
	jp z, Func_26afb
	jp Func_26ba4

Func_26afb: ; 26afb (9:6afb)
	call GetHLAtSPPlus4
	ld de, $71
	add hl, de
	ld a, [hl]
	and $8
	jp nz, Func_26b15
	call GetHLAtSPPlus4
	ld de, $71
	add hl, de
	ld a, [hl]
	and $f0
	jp z, Func_26b18
Func_26b15: ; 26b15 (9:6b15)
	jp Func_26ba4

Func_26b18: ; 26b18 (9:6b18)
	pop hl
	push hl
	ld l, h
	ld h, $0
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld a, l
	push af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	call GetHLAtSPPlus8
	ld de, $71
	add hl, de
	pop de
	ld a, [hl]
	or e
	ld [hl], a
	inc hl
	ld a, [hl]
	or d
	ld [hl], a
	call GetHLAtSPPlus10
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24065
	call Func_24010
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_2406f
	call Func_24010
	pop af
	cp $1
	jp z, Func_26b85
	cp $c
	jp z, Func_26b80
	cp $b
	jp z, Func_26b7b
	cp $a
	jp nz, Func_26b87
	xor a
	jp Func_26b87

Func_26b7b: ; 26b7b (9:6b7b)
	ld a, $1
	jp Func_26b87

Func_26b80: ; 26b80 (9:6b80)
	ld a, $2
	jp Func_26b87

Func_26b85: ; 26b85 (9:6b85)
	ld a, $3
Func_26b87: ; 26b87 (9:6b87)
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $44d2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	call Func_24045
	ld hl, sp+$9
	ld a, [hl]
	xor $1
	call Func_268a8
Func_26ba4: ; 26ba4 (9:6ba4)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_26baa: ; 26baa
	ret

Func_26bab: ; 26bab (9:6bab)
	add sp, -$14
	push af
	reg16swap de, hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld a, $1e
	call Func_24759
	ld hl, sp+$4
	call Func_24010
	ld hl, Text_24275
	call Func_24023
	ld hl, Text_2406d
	call Func_24010
	pop bc
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld hl, $6d
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call Func_24744
	ld hl, sp+$4
	call Func_24010
	ld hl, Text_24160
	call Func_24010
	call Func_24045
	pop bc
	pop af
	ld hl, $6d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Func_24632
	add sp, $14
	ret

Func_26c02: ; 26c02 (9:6c02)
	add sp, -$1c
	push af
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $20
	pop hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $69
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$18
	push hl
	reg16swap de, hl
	ld e, $81
	call Func_2478b
	ld l, a
	ld h, $0
	ld de, $64
	pop bc
	call Func_2617
	ld hl, sp+$18
	ld c, l
	ld b, h
	read_hl_from_sp_plus $1e
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$18
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$18
	ld a, [hl]
	ld hl, sp+$19
	ld l, [hl]
	ld h, a
	write_hl_to_sp_plus $18
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_26c6a
	ld hl, $1
	write_hl_to_sp_plus $18
Func_26c6a: ; 26c6a (9:6c6a)
	read_hl_from_sp_plus $18
	ld de, $4
	call DivideHLByDESigned
	inc hl
	ld a, l
	call Func_24600
	ld l, a
	ld h, $0
	push hl
	read_hl_from_sp_plus $1a
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4
	call DivideHLByDESigned
	pop de
	add hl, de
	inc hl
	write_hl_to_sp_plus $18
	ld hl, sp+$2
	reg16swap de, hl
	ld a, $1f
	call Func_24759
	ld hl, sp+$2
	call Func_24010
	ld hl, Text_24275
	call Func_24023
	ld hl, Text_2406d
	call Func_24010
	ld hl, sp+$2
	push hl
	read_hl_from_sp_plus $1a
	pop de
	call Func_24744
	ld hl, sp+$2
	call Func_24010
	ld hl, Text_24160
	call Func_24010
	call Func_24045
	pop af
	read_hl_from_sp_plus $16
	reg16swap de, hl
	call Func_24632
	add sp, $1c
	ret

Func_26cd6: ; 26cd6
	push bc
	push bc
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus6
	pop hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	push bc
	call GetHLAtSPPlus6
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	pop bc
	push bc
	ld hl, $69
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, d
	push af
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $4122
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24023
	ld hl, Text_2406d
	call Func_24010
	ld hl, Text_24160
	call Func_24010
	call Func_24045
	pop af
	pop bc
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, $76
	add hl, bc
	add hl, de
	pop de
	push hl
	call GetHLAtSPPlus4
	ld de, $25
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
	ld de, $a
	call DivideHLByDESigned
	ld c, l
	ld b, h
	pop hl
	push hl
	inc hl
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	ld a, [hl]
	adc b
	ld [hl], a
	ld d, [hl]
	dec hl
	ld e, [hl]
	reg16swap de, hl
	ld de, $3e8
	call CompareHLtoDE
	jp c, Func_26d7c
	pop hl
	push hl
	inc hl
	ld de, $3e8
	ld [hl], e
	inc hl
	ld [hl], d
Func_26d7c: ; 26d7c (9:6d7c)
	pop bc
	pop bc
	ret

Func_26d7f: ; 26d7f
	ret

Func_26d80: ; 26d80
	ret

Func_26d81: ; 26d81
	push af
	push bc
	reg16swap de, hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	pop de
	push hl
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_26dd4
	ld hl, sp+$3
	ld a, [hl]
	or a
	jp nz, Func_26dd4
	pop hl
	push hl
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	and $8
	jp nz, Func_26dd4
	ld a, $64
	call Func_24600
	cp $46
	jp nc, Func_26dd4
	callba_hli Func_222b7
	pop hl
	push hl
	ld de, $71
	add hl, de
	inc hl
	ld a, [hl]
	or $8
	ld [hl], a
Func_26dd4: ; 26dd4 (9:6dd4)
	pop bc
	pop bc
	ret

Data_26dd7: ; 26dd7
	db $0

Func_26dd8: ; 26dd8
	push af
	push bc
	push bc
	push bc
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus7
	pop de
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus5
	pop hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$0
	ld a, [$6dd7]
	ld [hl], a
	ld hl, $69
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld e, $81
	call Func_2478b
	push af
	ld a, $64
	call Func_24600
	pop bc
	cp b
	jp c, Func_26e1e
	jp Func_26edb

Func_26e1e: ; 26e1e (9:6e1e)
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp z, Func_26e28
	jp Func_26edb

Func_26e28: ; 26e28 (9:6e28)
	call GetHLAtSPPlus5
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_244e3
	call Func_24010
	call GetHLAtSPPlus3
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_244e6
	call Func_24010
	ld hl, Text_244e8
	call Func_24023
	call GetHLAtSPPlus3
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_244f2
	call Func_24010
	call GetHLAtSPPlus3
	ld de, $2c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$2
	call Func_24023
	xor a
	pop de
Func_26e70: ; 26e70 (9:6e70)
	cp $4
	jp nc, Func_26ea8
	push de
	push af
	ld l, e
	ld h, d
	add a
	add a
	ld b, a
	call RightShiftHL
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld a, l
	or a
	jp z, Func_26ea2
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_242f2 - 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_24010
	ld hl, Text_24065
	call Func_24010
Func_26ea2: ; 26ea2 (9:6ea2)
	pop af
	inc a
	pop de
	jp Func_26e70

Func_26ea8: ; 26ea8 (9:6ea8)
	ld hl, Text_244fe
	call Func_24023
	ld hl, Text_24507
	call Func_24023
	ld a, $1
	call Func_24054
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, $1
	or [hl]
	ld [hl], a
	callba_hli Func_d767
Func_26edb: ; 26edb (9:6edb)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_26ee0: ; 26ee0
	call Func_263cb
	ld a, h
	call Func_24045
	ret

Func_26ee8: ; 26ee8
	push af
	add sp, -$18
	push de
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $1a
	pop de
	push de
	ld hl, $6
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $18
	pop de
	ld hl, sp+$19
	ld a, [hl]
	call Func_2645b
	ld c, l
	ld b, h
	ld a, c
	or a
	jp z, Func_26fa4
	ld hl, sp+$19
	ld a, [hl]
	cp $1
	jp z, Func_26fa4
	read_hl_from_sp_plus $16
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $18
	ld de, $13
	add hl, de
	ld e, [hl]
	ld d, $0
	pop hl
	call MultiplyHLbyDE
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld e, c
	ld d, b
	ld hl, 9990
	call CompareHLtoDE
	jp c, Func_26f50
	inc b
	dec b
	bit 7, b
	jr z, asm_26f53
Func_26f50: ; 26f50 (9:6f50)
	ld bc, 9990
asm_26f53:
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	call Func_24744
	read_hl_from_sp_plus $1a
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24520
	call Func_24010
	read_hl_from_sp_plus $18
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24523
	call Func_24010
	ld hl, sp+$2
	call Func_24023
	ld hl, Text_24526
	call Func_24010
	pop bc
	push hl
	push hl
	ld l, c
	ld h, b
	ld bc, $0
	inc h
	dec h
	bit 7, h
	jr z, .asm_26f9b
	dec bc
.asm_26f9b
	push bc
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
Func_26fa4: ; 26fa4 (9:6fa4)
	call Func_24045
	add sp, $1a
	ret

Func_26faa: ; 26faa
	ret

Func_26fab: ; 26fab
	ret

Func_26fac: ; 26fac
	ret

Func_26fad: ; 26fad
	ret

Func_26fae: ; 26fae
	ret

Func_26faf: ; 26faf
	ret

Pointers_26fb0: ; 26fb0
	dw Func_264eb
	dw Func_264ec
	dw Func_264f1
	dw Func_265d0
	dw Func_26675
	dw Func_2681c
	dw Func_2681d
	dw Func_268a6
	dw Func_268a7
	dw Func_268b9
	dw Func_269f7
	dw Func_26a8e
	dw Func_26baa
	dw Func_26bab
	dw Func_26c02
	dw Func_26cd6
	dw Func_26d7f
	dw Func_26d80
	dw Func_26d81
	dw Func_26dd8
	dw Func_26ee0
	dw Func_26ee8
	dw Func_26faa
	dw Func_26fab
	dw Func_26fac
	dw Func_26fad
	dw Func_26fae
	dw Func_26faf

Func_26fe8: ; 26fe8 (9:6fe8)
	push af
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	push bc
	call Func_24001
	ld hl, .Return
	push hl
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	ld a, [hl]
	and $7f
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_26fb0 - 17 * 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus10
	reg16swap de, hl
	ld hl, sp+$b
	ld a, [hl]
	ret

.Return
	pop bc
	pop de
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_27046
	ld hl, $7
	add hl, bc
	ld a, $1
	or [hl]
	ld [hl], a
Func_27046: ; 27046 (9:7046)
	ld hl, $2f
	add hl, de
	reg16swap de, hl
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_27060
	ld hl, $7
	add hl, bc
	ld a, $2
	or [hl]
	ld [hl], a
Func_27060: ; 27060 (9:7060)
	pop bc
	pop bc
	ret

Func_27063: ; 27063 (9:7063)
	push af
	push de
	add sp, -$54
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $54
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	write_hl_to_sp_plus $52
	ld hl, sp+$4f
	ld [hl], $1
	ld c, $0
	push bc
	ld hl, sp+$59
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus4
	ld hl, sp+$59
	ld l, [hl]
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
	call WriteHLToSPPlus6
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$5b
	ld a, [hl]
	or a
	jp nz, Func_270f3
	ld hl, $0
	jp Func_270f6

Func_270f3: ; 270f3 (9:70f3)
	ld hl, $1
Func_270f6: ; 270f6 (9:70f6)
	ld de, $2f
	call MultiplyHLbyDE
	pop de
	add hl, de
	call WriteHLToSPPlus8
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$5b
	ld a, [hl]
	or a
	jp nz, Func_2711b
	ld hl, $1
	jp Func_2711e

Func_2711b: ; 2711b (9:711b)
	ld hl, $0
Func_2711e: ; 2711e (9:711e)
	ld de, $2f
	call MultiplyHLbyDE
	pop de
	add hl, de
	call WriteHLToSPPlus10
	ld hl, sp+$13
	ld [hl], $0
	call Func_24001
	pop bc
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $fd
	jp nz, Func_27187
	ld hl, $195
	write_hl_to_sp_plus $c
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, sp+$57
	ld a, [hl]
	call Func_26675
	read_hl_from_sp_plus $54
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_2716a
	read_hl_from_sp_plus $52
	ld de, $7
	add hl, de
	ld a, $1
	or [hl]
	ld [hl], a
Func_2716a: ; 2716a (9:716a)
	read_hl_from_sp_plus $54
	ld de, $47
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_27184
	read_hl_from_sp_plus $52
	ld de, $7
	add hl, de
	ld a, $2
	or [hl]
	ld [hl], a
Func_27184: ; 27184 (9:7184)
	jp Func_272ed

Func_27187: ; 27187 (9:7187)
	pop hl
	push hl
	ld de, $5e
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2720f
	pop hl
	push hl
	ld de, $5f
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_2720f
	push bc
	call GetHLAtSPPlus8
	ld de, $17
	add hl, de
	ld e, [hl]
	ld hl, sp+$14
	call Func_241f
	pop bc
	read_hl_from_sp_plus $27
	ld a, l
	and $80
	jp z, Func_271c1
	read_hl_from_sp_plus $27
	ld a, l
	and $7f
	ld l, a
	ld h, $0
	ld c, l
Func_271c1: ; 271c1 (9:71c1)
	push bc
	ld a, c
	cp $27
	jp nz, Func_271e5
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24539
	call Func_24010
	ld hl, Text_2453c
	call Func_24023
	call Func_24036
	ld hl, sp+$51
	ld [hl], $3
Func_271e5: ; 271e5 (9:71e5)
	pop bc
	ld a, c
	cp $28
	jp nz, Func_2720c
	ld hl, sp+$54
	ld a, [hl]
	or a
	jp nz, Func_2720c
	call GetHLAtSPPlus6
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_2454d
	call Func_24010
	ld hl, Text_24550
	call Func_24023
	call Func_24036
Func_2720c: ; 2720c (9:720c)
	jp Func_27250

Func_2720f: ; 2720f (9:720f)
	pop hl
	push hl
	ld de, $69
	add hl, de
	ld a, [hl]
	and $80
	jp z, Func_27229
	pop hl
	push hl
	ld de, $69
	add hl, de
	ld a, [hl]
	and $7f
	ld e, a
	inc hl
	ld d, $0
	ld c, e
Func_27229: ; 27229 (9:7229)
	ld a, c
	cp $19
	jp nz, Func_27250
	ld hl, sp+$57
	ld a, [hl]
	or a
	jp nz, Func_27250
	read_hl_from_sp_plus $54
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_2447a
	call Func_24010
	call Func_24036
Func_27250: ; 27250 (9:7250)
	ld c, $0
Func_27252: ; 27252 (9:7252)
	ld a, c
	ld hl, sp+$4f
	cp [hl]
	jp nc, Func_272ed
	push bc
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	call Func_256a3
	ld hl, sp+$50
	ld [hl], a
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	call Func_2543f
	call GetHLAtSPPlus4
	ld de, $6f
	add hl, de
	ld a, [hl]
	and $8
	jp nz, Func_272a4
	ld hl, sp+$50
	ld a, [hl]
	or a
	jp z, Func_27298
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	call Func_2570e
	jp Func_272a4

Func_27298: ; 27298 (9:7298)
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, sp+$59
	ld a, [hl]
	call Func_25dd5
Func_272a4: ; 272a4 (9:72a4)
	read_hl_from_sp_plus $56
	ld de, $18
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_272be
	read_hl_from_sp_plus $54
	ld de, $7
	add hl, de
	ld a, $1
	or [hl]
	ld [hl], a
Func_272be: ; 272be (9:72be)
	read_hl_from_sp_plus $56
	ld de, $47
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_272d8
	read_hl_from_sp_plus $54
	ld de, $7
	add hl, de
	ld a, $2
	or [hl]
	ld [hl], a
Func_272d8: ; 272d8 (9:72d8)
	pop bc
	read_hl_from_sp_plus $52
	ld de, $7
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_272e9
	jp Func_272ed

Func_272e9: ; 272e9 (9:72e9)
	inc c
	jp Func_27252

Func_272ed: ; 272ed (9:72ed)
	add sp, $58
	ret

Func_272f0: ; 272f0 (9:72f0)
	push af
	push de
	add sp, -$10
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	call WriteHLToSPPlus7
	call Func_24001
	ld hl, sp+$10
	ld a, [hl]
	or a
	jp nz, Func_2747e
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$15
	ld a, [hl]
	or a
	jp nz, Func_2732b
	ld hl, $0
	jp Func_2732e

Func_2732b: ; 2732b (9:732b)
	ld hl, $1
Func_2732e: ; 2732e (9:732e)
	ld de, $2f
	call MultiplyHLbyDE
	pop de
	add hl, de
	write_hl_to_sp_plus $f
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$15
	ld a, [hl]
	or a
	jp nz, Func_27354
	ld hl, $1
	jp Func_27357

Func_27354: ; 27354 (9:7354)
	ld hl, $0
Func_27357: ; 27357 (9:7357)
	ld de, $2f
	call MultiplyHLbyDE
	pop de
	add hl, de
	write_hl_to_sp_plus $d
	ld hl, sp+$13
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $b
	ld hl, sp+$13
	ld l, [hl]
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
	call WriteHLToSPPlus9
	read_hl_from_sp_plus $d
	ld de, $13
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $f
	ld de, $13
	add hl, de
	cp [hl]
	jp nc, Func_273c6
	ld hl, sp+$4
	ld [hl], $46
	jp Func_273f7

Func_273c6: ; 273c6 (9:73c6)
	ld hl, sp+$0
	ld c, l
	ld b, h
	read_hl_from_sp_plus $d
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	read_hl_from_sp_plus $11
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	pop de
	call Func_2617
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $46
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
Func_273f7: ; 273f7 (9:73f7)
	read_hl_from_sp_plus $b
	ld de, $64
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus9
	ld de, $64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_2741e
	ld hl, sp+$4
	ld a, [hl]
	add $1e
	ld hl, sp+$4
	ld [hl], a
	jp Func_27455

Func_2741e: ; 2741e (9:741e)
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus9
	ld de, $64
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $d
	ld de, $64
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_2617
	ld hl, sp+$0
	ld c, l
	ld b, h
	ld de, $1e
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$1
	add [hl]
	ld hl, sp+$4
	ld [hl], a
Func_27455: ; 27455 (9:7455)
	ld hl, sp+$4
	ld a, [hl]
	cp $5b
	jp c, Func_27467
	ld a, $a
	call Func_24600
	add $5a
	ld hl, sp+$4
	ld [hl], a
Func_27467: ; 27467 (9:7467)
	read_hl_from_sp_plus $f
	ld de, $d
	add hl, de
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_24284
	call Func_24023
Func_2747e: ; 2747e (9:747e)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_274ce
	ld hl, sp+$10
	ld a, [hl]
	or a
	jp nz, Func_274b1
	ld hl, sp+$13
	ld c, [hl]
	ld b, $0
	call GetHLAtSPPlus7
	ld de, $8
	add hl, de
	add hl, bc
	ld a, [hl]
	and $1
	jp nz, Func_274ce
	ld a, $64
	call Func_24600
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_274ce
Func_274b1: ; 274b1 (9:74b1)
	ld hl, Text_24299
	call Func_24023
	ld hl, sp+$13
	ld a, [hl]
	add $2
	ld b, a
	ld a, $1
	call LeftShiftA
	call GetHLAtSPPlus7
	ld de, $7
	add hl, de
	or [hl]
	ld [hl], a
	jp Func_274d4

Func_274ce: ; 274ce (9:74ce)
	ld hl, Text_2428c
	call Func_24023
Func_274d4: ; 274d4 (9:74d4)
	call Func_24045
	add sp, $14
	ret

Func_274da: ; 274da (9:74da)
	add sp, -$22
	push af
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	pop de
	push hl
	push de
	dec e
	ld hl, sp+$6
	call GetItemAttributes
	call Func_24001
	pop de
	pop hl
	pop af
	push de
	push af
	or a
	jp nz, Func_27516
	set_farcall_addrs_hli Func_c812
	ld hl, sp+$11
	call FarCall
	jp Func_2752c

Func_27516: ; 27516 (9:7516)
	push hl
	set_farcall_addrs_hli Func_7b0d
	pop hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$11
	call FarCall
Func_2752c: ; 2752c (9:752c)
	ld hl, sp+$11
	call Func_24010
	ld hl, Text_24069
	call Func_24010
	ld hl, sp+$4
	call Func_24023
	ld hl, Text_24071
	call Func_24010
	ld hl, Text_241e6
	call Func_24010
	call Func_24045
	pop af
	pop de
	or a
	jp nz, Func_27566
	push de
	set_farcall_addrs_hli AdjustItemQuantity
	pop de
	ld a, e
	ld e, $1
	ld c, $1
	call FarCall
Func_27566: ; 27566 (9:7566)
	add sp, $22
	ret

Func_27569: ; 27569 (9:7569)
	call Func_274da
	callba_hli Func_228d3
	ret

Func_2757b: ; 2757b
	push af
	push de
	push bc
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$7
	ld a, [hl]
	or a
	jp nz, Func_27598
	ld hl, $0
	jp Func_2759b

Func_27598: ; 27598 (9:7598)
	ld hl, $2f
Func_2759b: ; 2759b (9:759b)
	add hl, de
	call WriteHLToSPPlus4
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
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	mulhlby200
	ld c, l
	ld b, h
	read_hl_from wCurRobotPointer
	ld de, $1c
	add hl, de
	add hl, bc
	call WriteHLToSPPlus4
	pop de
	ld hl, $7
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_275e7
	ld hl, $7
	add hl, de
	ld a, [hl]
	jp Func_2774b

Func_275e7: ; 275e7 (9:75e7)
	push de
	call GetHLAtSPPlus4
	ld de, $75
	add hl, de
	ld a, [hl]
	cp $7
	jp nz, Func_2762e
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_2761e
	call Func_24001
	call GetHLAtSPPlus6
	ld de, $d
	add hl, de
	call Func_24023
	ld hl, Text_24069
	call Func_24010
	ld hl, Text_243de
	call Func_24023
	call Func_24036
Func_2761e: ; 2761e (9:761e)
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_2762e
	jp Func_27745

Func_2762e: ; 2762e (9:762e)
	call GetHLAtSPPlus4
	ld de, $5e
	add hl, de
	ld a, [hl]
	cp $3
	jp z, Func_2773d
	cp $1
	jp z, Func_2773a
	cp $2
	jp z, Func_276c2
	cp $fd
	jp z, Func_276b6
	cp $fe
	jp z, Func_276b6
	or a
	jp nz, Func_27745
	ld hl, sp+$9
	ld a, [hl]
	or a
	jp nz, Func_276b6
	call GetHLAtSPPlus4
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
	jp nz, Func_276b6
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	push hl
	call GetHLAtSPPlus6
	ld de, $26
	add hl, de
	pop de
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	call GetHLAtSPPlus6
	ld de, $1c
	add hl, de
	ld a, [hl]
	sub c
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc b
	ld [hl], a
	call GetHLAtSPPlus6
	ld de, $1c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, Func_276b6
	call GetHLAtSPPlus6
	ld de, $1c
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_276b6: ; 276b6 (9:76b6)
	ld hl, sp+$6
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	call Func_27063
	jp Func_27745

Func_276c2: ; 276c2 (9:76c2)
	call GetHLAtSPPlus4
	ld de, $5f
	add hl, de
	ld c, [hl]
	ld a, c
	cp $4f
	jp z, Func_276f6
	cp $4e
	jp z, Func_276f6
	cp $4d
	jp z, Func_276f6
	cp $4c
	jp z, Func_276f6
	cp $48
	jp nz, Func_27700
	ld e, c
	ld hl, sp+$9
	ld a, [hl]
	call Func_274da
	ld e, $1
	ld hl, sp+$9
	ld a, [hl]
	call Func_272f0
	jp Func_27737

Func_276f6: ; 276f6 (9:76f6)
	ld e, c
	ld hl, sp+$9
	ld a, [hl]
	call Func_27569
	jp Func_27737

Func_27700: ; 27700 (9:7700)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_27737
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp nz, Func_27737
	ld a, c
	cp $2f
	jp c, Func_27737
	ld a, c
	cp $33
	jp nc, Func_27737
	ld e, c
	ld hl, sp+$9
	ld a, [hl]
	call Func_274da
	callba_hli Func_22e03
Func_27737: ; 27737 (9:7737)
	jp Func_27745

Func_2773a: ; 2773a (9:773a)
	jp Func_27745

Func_2773d: ; 2773d (9:773d)
	ld e, $0
	ld hl, sp+$9
	ld a, [hl]
	call Func_272f0
Func_27745: ; 27745 (9:7745)
	pop de
	ld hl, $7
	add hl, de
	ld a, [hl]
Func_2774b: ; 2774b (9:774b)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_27750:: ; 27750 (9:7750)
	push bc
	call Func_24c0b
	or a
	jp z, Func_2775b
	jp Func_27780

Func_2775b: ; 2775b (9:775b)
	call Func_25430
	ld hl, sp+$0
	ld [hl], a
	ld e, $0
	ld hl, sp+$0
	ld a, [hl]
	call Func_2757b
	or a
	jp nz, Func_27780
	ld e, $1
	ld hl, sp+$0
	ld a, [hl]
	xor $1
	call Func_2757b
	or a
	jp nz, Func_27780
	push af
	call Func_251d1
	pop af
Func_27780: ; 27780 (9:7780)
	pop bc
	ret


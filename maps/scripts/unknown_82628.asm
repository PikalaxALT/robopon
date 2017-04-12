Func_82628:
	ld a, e
	or a
	jp nz, Func_8271b
	ld hl, $d5
	call Func_8062e_20
	or a
	jp nz, Func_82715
	ld a, $5e
	call Func_80efe_20
	ld c, $2
	ld e, $2
	ld a, $8
	call Func_80176_20
	ld e, $2
	ld a, $4
	call Func_801e4_20
	call Func_801d5_20
	call Func_8018b_20
	ld a, $28
	call Func_80efe_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $14
	call Func_80ee6_20
	xor a
	call Func_8044b_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $b
	ld e, $a
	ld a, $9
	call Func_80e8d_20
	ld e, $1
	ld hl, $d5
	call Func_8061b_20
	ld a, $60
	call Func_80efe_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	ld e, $3
	xor a
	call Func_80095_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_80095_20
	ld e, $2
	xor a
	call Func_80095_20
	xor a
	call Func_8044b_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld a, $1
	call Func_8101a_20
	ld a, $11
	call Func_80ee6_20
	ld e, $0
	xor a
	call Func_8013d_20
	jp Func_8271b

Func_82715: ; 82715 (20:6715)
	ld hl, $15c
	call Func_80498_20
Func_8271b: ; 8271b (20:671b)
	ret


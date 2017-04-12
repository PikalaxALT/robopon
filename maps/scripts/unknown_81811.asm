Data_817d4:
	dr $817d4, $817fd

Data_817fd: ; 817fd
	dr $817fd, $81801

Data_81801: ; 81801
	dr $81801, $81805

Data_81805: ; 81805
	dr $81805, $8180d

Data_8180d: ; 8180d
	dr $8180d, $81811

Func_81811:
	ld a, e
	or a
	jp nz, Func_81966
	ld hl, $3
	call Func_8062e_20
	or a
	jp nz, Func_8193b
	ld c, $1
	ld de, Data_8180d
	ld a, BANK(Data_8180d)
	call Func_8063e_20
	ld a, $1
	call Func_80677_20
	ld a, $a
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld e, $3
	ld a, $3
	call Func_80095_20
	ld e, $3
	ld a, $4
	call Func_80095_20
	ld a, $1
	call Func_8101a_20
	ld a, $1a
	call Func_80ee6_20
	ld hl, $23
	call Func_804a9_20
	ld hl, $24
	call Func_804a9_20
	ld hl, $25
	call Func_804a9_20
	ld hl, $18
	call Func_804ba_20
	or a
	jp nz, Func_81910
	ld de, Data_81967
	ld hl, Data_817d4
	call Func_80dd3_20
	or a
	jp nz, Func_8187c
	jp Func_81966

Func_8187c: ; 8187c (20:587c)
	ld hl, $27
	call Func_804a9_20
	ld bc, Data_817fd
	ld e, BANK(Data_817fd)
	ld a, $4
	call Func_801f7_20
	ld a, $2e
	call Func_80efe_20
	call Func_8020c_20
	ld e, $0
	ld a, $4
	call Func_8013d_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_818b7
	ld hl, $28
	call Func_804a9_20
	jp Func_81905

Func_818b7: ; 818b7 (20:58b7)
	ld c, $1
	ld de, Data_81801
	ld a, BANK(Data_81801)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $1
	call Func_80677_20
	ld hl, $29
	call Func_804a9_20
	ld hl, $2a
	call Func_804a9_20
	ld hl, $2b
	call Func_804a9_20
	ld hl, $2c
	call Func_804a9_20
	ld a, $2e
	call Func_80efe_20
	ld bc, Data_81805
	ld e, BANK(Data_81805)
	ld a, $3
	call Func_80688_20
	ld a, $2
	call Func_80677_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_81905: ; 81905 (20:5905)
	ld e, $1
	ld hl, $3
	call Func_8061b_20
	jp Func_81938

Func_81910: ; 81910 (20:5910)
	ld a, $69
	call Func_80efe_20
	ld hl, $26
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $2
	ld a, $3
	call Func_80095_20
	ld e, $0
	ld a, $4
	call Func_80095_20
	xor a
	call Func_80ee6_20
	ld a, $3
	call Func_80ee6_20
Func_81938: ; 81938 (20:5938)
	jp Func_81966

Func_8193b: ; 8193b (20:593b)
	ld hl, $2
	call Func_8062e_20
	or a
	jp nz, Func_8194e
	ld hl, $28
	call Func_804a9_20
	jp Func_81966

Func_8194e: ; 8194e (20:594e)
	ld hl, $29
	call Func_804a9_20
	ld hl, $2a
	call Func_804a9_20
	ld hl, $2b
	call Func_804a9_20
	ld hl, $2c
	call Func_804a9_20
Func_81966: ; 81966 (20:5966)
	ret

Data_81967:
	db "<HIRA>こふﾞん2<KATA>$"


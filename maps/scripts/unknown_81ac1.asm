Data_81a66:
	dr $81a66, $81a84

Data_81a84: ; 81a84
	dr $81a84, $81abc

Data_81abc: ; 81abc
	dr $81abc, $81ac1

Func_81ac1:
	ld e, $2
	ld hl, Data_81a66
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_81abc
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_81ae8
	ld a, [$c793]
	cp $2
	jp z, Func_81ae8
	ld a, [$c793]
	cp $3
	jp nz, Func_81b20
Func_81ae8: ; 81ae8 (20:5ae8)
	ld hl, $b
	call Func_8062e_20
	or a
	jp nz, Func_81b15
	ld e, $4
	ld hl, Data_81a84
	call Func_800fb_20
	ld a, $2
	call Func_80677_20
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
	call Func_81b45
	ld e, $1
	ld hl, $b
	call Func_8061b_20
	jp Func_81b1d

Func_81b15: ; 81b15 (20:5b15)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81b1d: ; 81b1d (20:5b1d)
	jp Func_81b28

Func_81b20: ; 81b20 (20:5b20)
	ld a, $11
	call Func_80ee6_20
	call Func_8001c_20
Func_81b28: ; 81b28 (20:5b28)
	ret

Data_81b29:
	dr $81b29, $81b2d

Data_81b2d: ; 81b2d
	dr $81b2d, $81b31

Data_81b31: ; 81b31
	dr $81b31, $81b35

Data_81b35: ; 81b35
	dr $81b35, $81b39

Data_81b39: ; 81b39
	dr $81b39, $81b3d

Data_81b3d: ; 81b3d
	dr $81b3d, $81b45

Func_81b45: ; 81b45 (20:5b45)
	ld a, $3
	call Func_80677_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	ld hl, $1e
	call Func_8068f_20
	ld bc, Data_81b29
	ld e, BANK(Data_81b29)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld hl, $4
	call Func_804a9_20
	ld e, $1
	ld a, $1
	call Func_80095_20
	ld hl, $5
	call Func_804a9_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call Func_80095_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	xor a
	call Func_80095_20
	ld a, $2
	call Func_80677_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $3c
	call Func_8068f_20
	ld e, $1
	xor a
	call Func_80095_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $3
	call Func_80677_20
	ld hl, $6
	call Func_804a9_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $2
	call Func_80677_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $0
	xor a
	call Func_80095_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $1
	xor a
	call Func_80095_20
	ld a, $3
	call Func_80677_20
	ld hl, $7
	call Func_804a9_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld a, $34
	call Func_80efe_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	ld hl, $1e
	call Func_8068f_20
	ld a, $f
	call Func_80ff1_20
	xor a
	call Func_80ee6_20
	ld c, $1
	ld de, Data_81b35
	ld a, BANK(Data_81b35)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $2
	call Func_80677_20
	ld hl, $8
	call Func_804a9_20
	ld hl, $1e
	call Func_8068f_20
	ld c, $1
	ld de, Data_81b39
	ld a, BANK(Data_81b39)
	call Func_8063e_20
	call Func_8020c_20
	ld hl, $9
	call Func_80498_20
	ld c, $1
	ld de, Data_81b3d
	ld a, BANK(Data_81b3d)
	call Func_8063e_20
	call Func_8020c_20
	ld a, $1
	call Func_8101a_20
	ret

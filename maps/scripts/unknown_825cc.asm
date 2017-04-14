Data_82593:
	dr $82593, $825a2

Data_825a2: ; 825a2
	dr $825a2, $825be

Data_825be: ; 825be
	dr $825be, $825cc

Func_825cc:
	ld e, $1
	ld hl, Data_82593
	call LoadMapObjects_20
	ld a, [$c793]
	or a
	jp z, Func_825eb
	ld a, [$c793]
	cp $1
	jp z, Func_825eb
.asm_825e3
	ld a, [$c793]
	cp $2
	jp nz, Func_825f9
Func_825eb: ; 825eb (20:65eb)
	ld e, $2
	ld hl, Data_825a2
	call Func_800fb_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_825f9: ; 825f9 (20:65f9)
	ld hl, $2
	call Func_8062e_20
	cp $1
	jp nz, Func_8261f
	ld hl, $3
	call Func_8062e_20
	cp $1
	jp nz, Func_8261f
	ld a, [$c790]
	cp $4
	jp z, Func_8261f
	ld e, $1
	ld hl, Data_825be
	call Func_800fb_20
Func_8261f: ; 8261f (20:661f)
	ld a, $11
	call PlayMusic_20
	call Func_8001c_20
	ret

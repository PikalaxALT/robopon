Data_82593:
	dr $82593, $825a2

Data_825a2: ; 825a2
	dr $825a2, $825be

Data_825be: ; 825be
	dr $825be, $825cc

Func_825cc:
	loadwarps $1, Data_82593
	ld a, [wc793]
	or a
	jp z, Func_825eb
	ld a, [wc793]
	cp $1
	jp z, Func_825eb
.asm_825e3
	ld a, [wc793]
	cp $2
	jp nz, Func_825f9
Func_825eb: ; 825eb (20:65eb)
	loadpeople $2, Data_825a2
	ld e, $0
	xor a
	call Func_8013d_20
Func_825f9: ; 825f9 (20:65f9)
	checkevent $2
	cp $1
	jp nz, Func_8261f
	checkevent $3
	cp $1
	jp nz, Func_8261f
	ld a, [wc790]
	cp $4
	jp z, Func_8261f
	loadpeople $1, Data_825be
Func_8261f: ; 8261f (20:661f)
	playmusic $11
	call Func_8001c_20
	ret

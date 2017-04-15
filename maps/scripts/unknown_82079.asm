Func_82079:
	ld a, e
	cp $2
	jp nz, Func_8208b
	ld c, $6
	ld e, $1
	ld a, $2b
	call Func_80176_20
	call Func_801d5_20
Func_8208b: ; 8208b (20:608b)
	ret

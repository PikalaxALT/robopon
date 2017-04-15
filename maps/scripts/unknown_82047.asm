Func_82047:
	push de
	xor a
Func_82049: ; 82049 (20:6049)
	cp $14
	jp nc, Func_82057
	push af
	call Func_80c94_20
	pop af
	inc a
	jp Func_82049

Func_82057: ; 82057 (20:6057)
	pop de
	ld a, e
	cp $2
	jp nz, Func_82078
	xor a
	call Func_80653_20
	ld c, $32
	ld e, $0
	ld a, $1e
	call Func_80d87_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
Func_82078: ; 82078 (20:6078)
	ret

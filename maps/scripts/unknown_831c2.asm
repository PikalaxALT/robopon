Func_831c2:
	push af
	ld a, e
	or a
	jp nz, Func_831d1
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	call Func_8104f_20
Func_831d1: ; 831d1 (20:71d1)
	pop bc
	ret

Func_831d3:
	push af
	ld a, e
	or a
	jp nz, Func_831e2
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	call Func_81072_20
Func_831e2: ; 831e2 (20:71e2)
	pop bc
	ret

Func_831c2:
	push af
	ld a, e
	or a
	jp nz, Func_831d1
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	scall Func_8104f
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
	call FacePlayer_20
	scall Func_81072
Func_831e2: ; 831e2 (20:71e2)
	pop bc
	ret

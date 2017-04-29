
LCDInterrupt::
	push af
	push bc
	ld a, [wc2e1]
	or a
	jr nz, .asm_11ab
	ld a, [rLYC]
	ld c, a
	ld a, [wc2e2]
	cp c
	jr nz, .asm_119d
	ld a, [rLCDC]
	set 1, a
	ld [rLCDC], a
	ld a, [wc2e3]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_119d
	ld a, [rLCDC]
	res 1, a
	ld [rLCDC], a
	ld a, [wc2e2]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_11ab
	ld a, [rLYC]
	ld c, a
	ld a, [wc2e2]
	cp c
	jr nz, .asm_11c1
	ld a, [wc2e4]
	ld [rSCX], a
	ld a, [wc2e3]
	ld [rLYC], a
	pop bc
	pop af
	reti

.asm_11c1
	ld a, [wc2e5]
	ld [rSCX], a
	ld a, [wc2e2]
	ld [rLYC], a
	pop bc
	pop af
	reti

LCDInterrupt::
	push af
	push bc
	ld a, [wHBlankMode]
	or a
	jr nz, .mode1
	ldh a, [rLYC]
	ld c, a
	ld a, [wHBlankLYCPrimary]
	cp c
	jr nz, .mode0_primary
	ldh a, [rLCDC]
	set 1, a
	ldh [rLCDC], a
	ld a, [wHBlankLYCAlternate]
	ldh [rLYC], a
	pop bc
	pop af
	reti

.mode0_primary
	ldh a, [rLCDC]
	res 1, a
	ldh [rLCDC], a
	ld a, [wHBlankLYCPrimary]
	ldh [rLYC], a
	pop bc
	pop af
	reti

.mode1
	ldh a, [rLYC]
	ld c, a
	ld a, [wHBlankLYCPrimary]
	cp c
	jr nz, .mode1_primary
	ld a, [wHBlankSCXAlternate]
	ldh [rSCX], a
	ld a, [wHBlankLYCAlternate]
	ldh [rLYC], a
	pop bc
	pop af
	reti

.mode1_primary
	ld a, [wHBlankSCXPrimary]
	ldh [rSCX], a
	ld a, [wHBlankLYCPrimary]
	ldh [rLYC], a
	pop bc
	pop af
	reti

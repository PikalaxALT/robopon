LCDInterrupt::
	push af
	push bc
	ld a, [wHBlankMode]
	or a
	jr nz, .mode1
	ld a, [rLYC]
	ld c, a
	ld a, [wHBlankLYCPrimary]
	cp c
	jr nz, .mode0_primary
	ld a, [rLCDC]
	set 1, a
	ld [rLCDC], a
	ld a, [wHBlankLYCAlternate]
	ld [rLYC], a
	pop bc
	pop af
	reti

.mode0_primary
	ld a, [rLCDC]
	res 1, a
	ld [rLCDC], a
	ld a, [wHBlankLYCPrimary]
	ld [rLYC], a
	pop bc
	pop af
	reti

.mode1
	ld a, [rLYC]
	ld c, a
	ld a, [wHBlankLYCPrimary]
	cp c
	jr nz, .mode1_primary
	ld a, [wHBlankSCXAlternate]
	ld [rSCX], a
	ld a, [wHBlankLYCAlternate]
	ld [rLYC], a
	pop bc
	pop af
	reti

.mode1_primary
	ld a, [wHBlankSCXPrimary]
	ld [rSCX], a
	ld a, [wHBlankLYCPrimary]
	ld [rLYC], a
	pop bc
	pop af
	reti

Data_dd63: ; dd63
	dlong 0

RandomRange:: ; dd67 (3:5d67)
; Updates the RNG and returns a random byte less than a.
; The RNG is a 15-bit integer seeded at 0x000d.
; The update function is state = (state * 0x6d + 0x3fd) & 0x7fff.
	push bc
	push bc
	push af
	ld hl, sp+$2
	reg16swap de, hl
	ld hl, Data_dd63
	ld bc, $4
	call MemCopy
	read_hl_from wRNGState
	ld de, $6d
	call MultiplyHLbyDE
	ld de, $3fd
	add hl, de
	ld a, h
	and $7f
	ld h, a
	write_hl_to wRNGState
	read_hl_from wRNGState
	ld de, $100
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$4
	ld [hl], a
	read_hl_from wRNGState
	ld de, $100
	call DivideHLByDESigned
	ld hl, sp+$5
	ld [hl], e
	pop af
	ld hl, sp+$0
	ld c, l
	ld b, h
	add a
	ld e, a
	ld d, $0
	ld hl, sp+$0
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$1
	ld a, [hl]
	pop bc
	pop bc
	ret

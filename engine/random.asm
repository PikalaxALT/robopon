Data_dd63: ; dd63
	dlong 0

RandomRange:: ; dd67 (3:5d67)
; Updates the RNG and returns a random byte less than a.
; The RNG is a positive signed short seeded at 0x000d.
; This RNG implements the linear congruential method
;           X(n+1) = abs(a * X(n) + c)
; where a = 0x6d and c = 0x3fd. The seed for this RNG is 0x000d.
; Normally this function is written in straight ASM.  Hudson's is in C.
; There is a separate predef function with its own RNG, so it is unclear why
; Hudson thought it wise to write their own.
; char randrange(unsigned char maxval) {
; 	u_long curstate;
; 	wRNGState = abs(0x6d * wRNGState + 0x3fd);
; 	curstate = div(wRNGState, 0x100).quot + (div(wRNGState, 0x100).rem << 8);
; 	u_short denom = 2 * maxval;
; 	return curstate / denom;
; }
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

CompareHLtoBC: ; 35f8 (0:35f8)
; signed
;     z: hl = bc
;     c: hl < bc
; nz,nc: hl > bc
	ld a, h
	xor b
	bit 7, a
	jp z, .same_sign
	ld a, b
	cp h
	ret

.same_sign
	ld a, h
	cp b
	ret nz
	ld a, l
	cp c
	ret

CompareHLtoDE: ; 3608 (0:3608)
; signed
;     z: hl = de
;     c: hl < de
; nz,nc: hl > de
	ld a, h
	xor d
	bit 7, a
	jp z, .same_sign
	ld a, d
	cp h
	ret

.same_sign
	ld a, h
	cp d
	ret nz
	ld a, l
	cp e
	ret

RightShiftA:
	inc b
.loop
	dec b
	ret z
	and a
	rra
	jp .loop

RightShiftPointer:
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call RightShiftHL
	push de
	push hl
	pop de
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	push de
	push hl
	pop de
	pop hl
	pop de
	ret

RightShiftHL: ; 3638 (0:3638)
; hl >>= b
	inc b
.loop
	dec b
	ret z
	and a
	ld a, h
	rra
	ld h, a
	ld a, l
	rra
	ld l, a
	jp .loop

LeftShiftA:
; a <<= b
	inc b
.loop
	dec b
	ret z
	add a
	jp .loop

LeftShiftPointer:
; * hl >>= b
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	push hl
	pop de
	pop hl
	call LeftShiftHL
	push de
	push hl
	pop de
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	push de
	push hl
	pop de
	pop hl
	pop de
	ret

LeftShiftHL: ; 3664 (0:3664)
; hl >>= b
	inc b
.loop
	dec b
	ret z
	add hl, hl
	jp .loop

ModuloPointerByDESigned: ; *s16
; * hl %= de
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call DivideHLByDESigned
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	ret

ModuloPointerByDE: ; *u16
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call DivideHLbyDE
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	ret

DividePointerByDESigned: ; *s16
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call DivideHLByDESigned
	push de
	push hl
	pop de
	pop hl
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

DividePointerByDE: ; *u16
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call DivideHLbyDE
	push de
	push hl
	pop de
	pop hl
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

DivideAbyB: ; 36af (0:36af)
; dividend a, divisor b
; returns quotient a, remainder b
	push hl
	ld l, a
	ld h, $0
	ld c, $8
.loop
	add hl, hl
	ld a, h
	cp b
	jp c, .next
	sub b
	inc l
	ld h, a
.next
	dec c
	jp nz, .loop
	ld a, l
	ld b, h
	pop hl
	ret

DivideHLByDESigned: ; 36c6 (0:36c6)
	ld a, h
	or a
	push af
	xor d
	push af
	call .AbsoluteValueHL
	push de
	push hl
	pop de
	pop hl
	call .AbsoluteValueHL
	push de
	push hl
	pop de
	pop hl
	call DivideHLbyDE
	pop af
	call .CorrectSignOfHL
	pop af
	push de
	push hl
	pop de
	pop hl
	call .CorrectSignOfHL
	push de
	push hl
	pop de
	pop hl
	ret

.CorrectSignOfHL
	push af
	and $80
	jp nz, .NegativeRemainder
	pop af
	ret

.NegativeRemainder
	pop af
	call NegativeHL
	ret

.AbsoluteValueHL: ; 36fa (0:36fa)
	ld a, h
	and $80
	ret z
NegativeHL:
	dec hl
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	ret

DivideHLbyDE: ; 3706 (0:3706)
; returns quotient hl and remainder de
	ld b, d
	ld c, e
	push de
	push hl
	pop de
	pop hl
	ld hl, $0
	ld a, $10
.loop
	push af
	add hl, hl
	xor a
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	adc l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	inc e
	jp nc, .next
	add hl, bc
	dec e
.next
	pop af
	dec a
	jp nz, .loop
	push de
	push hl
	pop de
	pop hl
	ret

MultiplyAbyB:
; a *= b
	push hl
	ld h, a
	xor a
	ld c, $8
.loop
	add a
	add hl, hl
	jp nc, .next
	add b
.next
	dec c
	jp nz, .loop
	pop hl
	ret

MultiplyPointerByDE:
; Store [hl] * de at hl
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call MultiplyHLbyDE
	pop de
	push de
	push hl
	pop de
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
	push de
	push hl
	pop de
	pop hl
	ret

MultiplyHLbyDE: ; 3759 (0:3759)
; hl *= de
	ld b, h
	ld c, l
	ld hl, $0
	ld a, $10
.loop
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	add hl, hl
	push de
	push hl
	pop de
	pop hl
	jp nc, .next
	add hl, bc
.next
	dec a
	jp nz, .loop
	ret

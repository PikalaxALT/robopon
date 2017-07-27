WriteHLToSPPlus10:: ; 3773 (0:3773)
	ld de, $a
	jp WriteHLToSPPlusDE

WriteHLToSPPlus9::
	ld de, $9
	jp WriteHLToSPPlusDE

WriteHLToSPPlus8:: ; 377f (0:377f)
	ld de, $8
	jp WriteHLToSPPlusDE

WriteHLToSPPlus7::
	ld de, $7
	jp WriteHLToSPPlusDE

WriteHLToSPPlus6:: ; 378b (0:378b)
	ld de, $6
	jp WriteHLToSPPlusDE

WriteHLToSPPlus5:: ; 3791 (0:3791)
	ld de, $5
	jp WriteHLToSPPlusDE

WriteHLToSPPlus4:: ; 3797 (0:3797)
	ld de, $4
	jp WriteHLToSPPlusDE

WriteHLToSPPlus3::
	ld de, $3
	jp WriteHLToSPPlusDE

WriteHLToSPPlusParam16::
	push af
	push de
	push hl
	; Exchange the return pointer with what was previously hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	; Read the short from the return pointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push af
	push de
	push hl
	; Exchange the previous value of hl with the return pointer
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
WriteHLToSPPlusDE:: ; 37c7 (0:37c7)
	; write the previous value of hl at sp + param
	reg16swap de, hl
	add hl, sp
	ld [hl], e
	inc hl
	ld [hl], d
	reg16swap de, hl
	ret

WriteHLToSPPlusParam8:: ; 37d4 (0:37d4)
	push af
	push de
	push hl
	; Exchange the return pointer with what was previously hl
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	; Read the byte from the return pointer
	ld e, [hl]
	inc hl
	ld d, $0
	push af
	push de
	push hl
	; Exchange the previous value of hl with the return pointer
	ld hl, sp+$6
	pop de
	ld a, [hl]
	ld [hl], e
	ld e, a
	inc hl
	ld a, [hl]
	ld [hl], d
	ld h, a
	ld l, e
	pop de
	pop af
	; write the previous value of hl at sp + param
	reg16swap de, hl
	add hl, sp
	ld [hl], e
	inc hl
	ld [hl], d
	reg16swap de, hl
	ret

GetHLAtSPPlus10:: ; 3805 (0:3805)
	ld hl, $a
	jp GetHLAtSPPlusHL

GetHLAtSPPlus9::
	ld hl, $9
	jp GetHLAtSPPlusHL

GetHLAtSPPlus8:: ; 3811 (0:3811)
	ld hl, $8
	jp GetHLAtSPPlusHL

GetHLAtSPPlus7::
	ld hl, $7
	jp GetHLAtSPPlusHL

GetHLAtSPPlus6:: ; 381d (0:381d)
	ld hl, $6
	jp GetHLAtSPPlusHL

GetHLAtSPPlus5:: ; 3823 (0:3823)
	ld hl, $5
	jp GetHLAtSPPlusHL

GetHLAtSPPlus4:: ; 3829 (0:3829)
	ld hl, $4
	jp GetHLAtSPPlusHL

GetHLAtSPPlus3::
	ld hl, $3
	jp GetHLAtSPPlusHL

GetHLAtSPPlusParam16::
	pop hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	reg16swap de, hl
GetHLAtSPPlusHL:: ; 383f (0:383f)
	add hl, sp
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ret

GetHLAtSPPlusParam8:: ; 3848 (0:3848)
	pop hl
	ld e, [hl]
	inc hl
	push hl
	ld l, e
	ld h, $0
	add hl, sp
	ld e, [hl]
	inc hl
	ld h, [hl]
	ld l, e
	ret

WriteHalfWordTo:: ; 3855 (0:3855)
; s16 *dest
; s16 hl
; preserves registers
	push af
	push bc
	push de
	push hl
	; get the return pointer
	ld hl, sp+$8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; read the address there
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	; advance the return pointer
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld [hl], c
	inc hl
	ld [hl], b
	; store hl at the address
	ld l, e
	ld h, d
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, e
	ld h, d
	pop de
	pop bc
	pop af
	ret

ReadHalfWordAt:: ; 3875 (0:3875)
; s16 *dest
; preserves registers except hl
	push af
	push bc
	push de
	ld hl, sp+$6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, l
	ld b, h
	ld hl, sp+$6
	ld [hl], c
	inc hl
	ld [hl], b
	ld l, e
	ld h, d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	pop bc
	pop af
	ret

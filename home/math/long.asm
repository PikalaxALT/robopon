PutLongFromStackToHL: ; 32d1 (0:32d1)
	pop bc
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	dec hl
	dec hl
	dec hl
	push bc
	ret

PutLongFromHLOnStack: ; 32e0 (0:32e0)
	pop bc
	inc hl
	inc hl
	inc hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	push bc
	ret

BitwiseXorLongsFromStack:
	ld hl, $6
	add hl, sp
BitwiseXorLongs:
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	xor [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

BitwiseOrLongsFromStack:
	ld hl, $6
	add hl, sp
BitwiseOrLongs:
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	or [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

BitwiseAndLongsFromStack: ; 3343 (0:3343)
	ld hl, $6
	add hl, sp
BitwiseAndLongs:
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	and [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

ComplementLongFromStack:
	ld hl, $2
	add hl, sp
ComplementLong:
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	inc hl
	ld a, [hl]
	cpl
	ld [hl], a
	ret

LeftShiftLongFromStack:
	ld hl, $2
	add hl, sp
LeftShiftLong:
	ld a, b
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push hl
	jp .handleLoop

.loop
	ld d, e
	ld e, b
	ld b, c
	ld c, $0
.handleLoop
	ld l, a
	sub $8
	jp nc, .loop
	inc l
	jp .handleLoop2

.loop2
	ld a, c
	add a
	ld c, a
	ld a, b
	rla
	ld b, a
	ld a, e
	rla
	ld e, a
	ld a, d
	rla
	ld d, a
.handleLoop2
	dec l
	jp nz, .loop2
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	dec hl
	ld [hl], b
	dec hl
	ld [hl], c
	ret

RightShiftLongFromStack:
	ld hl, $2
	add hl, sp
RightShiftLong: ; 33bd (0:33bd)
	ld a, b
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push hl
	jp .handleLoop

.loop
	ld c, b
	ld b, e
	ld e, d
	ld d, $0
.handleLoop
	ld l, a
	sub $8
	jp nc, .loop
	inc l
	jp .handleLoop2

.loop2
	and a
	ld a, d
	rra
	ld d, a
	ld a, e
	rra
	ld e, a
	ld a, b
	rra
	ld b, a
	ld a, c
	rra
	ld c, a
.handleLoop2
	dec l
	jp nz, .loop2
	pop hl
	ld [hl], d
	dec hl
	ld [hl], e
	dec hl
	ld [hl], b
	dec hl
	ld [hl], c
	ret

StackDivideLongSigned_KeepRemainder: ; 33f2 (0:33f2)
	ld hl, $6
	add hl, sp
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	or a
	push af
	push hl
	call AbsoluteValueLong
	ld hl, $9
	add hl, sp
	ld a, [hl]
	dec hl
	dec hl
	dec hl
	or a
	call AbsoluteValueLong
	pop hl
	call DivideLong
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop af
	call AbsoluteValueLong
	pop bc
	pop af
	pop af
	push bc
	ret

StackDivideLongSigned: ; 3424 (0:3424)
	ld hl, $6
	add hl, sp
DivideLongSigned: ; 3428 (0:3428)
	push hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	pop hl
	or a
	push af
	call AbsoluteValueLong
	pop af
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
	xor [hl]
	push af
	ld a, [hl]
	dec hl
	dec hl
	dec hl
	or a
	call AbsoluteValueLong
	push de
	push hl
	pop de
	pop hl
	call DivideLong
	pop af
	call AbsoluteValueLong
	pop bc
	pop af
	pop af
	push bc
	ret

StackDivideLong_KeepRemainder:
	ld hl, $6
	add hl, sp
	push af
	call DivideLong
	pop af
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

DivideLong: ; 346d (0:346d)
; remainder bcde
	ld bc, $0
	ld d, b
	ld e, b
	ld a, $20
.loop: ; 3474 (0:3474)
	push af
	push hl
	ld a, [hl]
	add a
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	ld a, e
	rla
	ld e, a
	ld a, d
	rla
	ld d, a
	ld a, c
	rla
	ld c, a
	ld a, b
	rla
	ld b, a
	push de
	push bc
	ld hl, $e
	add hl, sp
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	inc hl
	ld a, c
	sbc [hl]
	ld c, a
	inc hl
	ld a, b
	sbc [hl]
	ld b, a
	jp nc, ._nc
	pop bc
	pop de
	pop hl
	jp .next

._nc
	pop af
	pop af
	pop hl
	inc [hl]
.next
	pop af
	dec a
	jp nz, .loop
	ret

DivideLongsFromStack:
	ld hl, $6
	add hl, sp
DivideLongs:
	push af
	call DivideLong
	pop af
	pop bc
	pop af
	pop af
	push bc
	ret

MultiplyLongsFromStack: ; 34c7 (0:34c7)
	ld hl, $6
	add hl, sp
MultiplyLongs:
	ld bc, $0
	ld d, b
	ld e, b
	push hl
	jp .handleLoop

.loop: ; 34d4 (0:34d4)
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	jp nc, .next
	pop hl
	push hl
	ld a, e
	add [hl]
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld d, a
	inc hl
	ld a, c
	adc [hl]
	ld c, a
	inc hl
	ld a, b
	adc [hl]
	ld b, a
.next: ; 34f7 (0:34f7)
	pop hl
	push hl
	ld a, [hl]
	add a
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	ld a, [hl]
	rla
	ld [hl], a
.handleLoop: ; 3508 (0:3508)
	ld hl, $4
	add hl, sp
	ld a, [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jp nz, .loop
	pop hl
	push hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

SubtractLongsFromStack:
	ld hl, $6
	add hl, sp
SubtractLongs:
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	sub [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	sbc [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

AddLongsFromStack:
	ld hl, $6
	add hl, sp
AddLongs: ; 3553 (0:3553)
	push de
	push hl
	pop de
	pop hl
	ld hl, $2
	add hl, sp
	ld a, [de]
	add [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec de
	dec de
	push de
	push hl
	pop de
	pop hl
	pop bc
	pop af
	pop af
	push bc
	ret

CompareStackLongs_Signed: ; 3579 (0:3579)
; compare de=[sp+9] with hl=[sp+5]
; return c if de < hl
; takes into account sign of each
	ld hl, $9
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
	ld a, [de]
	xor [hl]
	bit 7, a
	jp z, compare_stack_longs
	push de
	push hl
	pop de
	pop hl
	jp compare_stack_longs

CompareStackLongs: ; 3593 (0:3593)
; compare de=[sp+9] with hl=[sp+5]
; return c if de < hl
	ld hl, $9
	add hl, sp
	push de
	push hl
	pop de
	pop hl
	ld hl, $5
	add hl, sp
compare_stack_longs
	call CompareLong
	pop de
	push af
	ld hl, $a
	add hl, sp
	pop af
	ld sp, hl
	push de
	push hl
	pop de
	pop hl
	jp [hl]

CompareLong: ; 35af (0:35af)
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret nz
	dec de
	dec hl
	ld a, [de]
	cp [hl]
	ret

AbsoluteValueLong: ; 35c1 (0:35c1)
	push af
	and $80
	jp nz, .negate_long
	pop af
	ret

.negate_long
	pop af
	call NegateLongHL
	ret

NegateLongOnStack: ; 35ce (0:35ce)
; take negative of long
	ld hl, $2
	add hl, sp
NegateLongHL: ; 35d2 (0:35d2)
	xor a
	sub [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	inc hl
	ld a, $0
	sbc [hl]
	ld [hl], a
	dec hl
	dec hl
	dec hl
	ret

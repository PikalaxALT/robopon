LeftShiftArbitrarySize: ; 31b4 (0:31b4)
	push hl
	push de
	push bc
	ld e, b
	ld b, $0
.loop
	ld a, e
	sub $8
	jp c, .next
	ld e, a
	ld d, c
	dec d
	add hl, bc
	dec hl
.loop2
	dec hl
	ld a, [hl]
	inc hl
	ld [hl], a
	dec hl
	dec d
	jp nz, .loop2
	ld [hl], b
	jp .loop

.next
	inc e
	jp .handleLoop

.loop3
	push hl
	ld d, c
	and a
.loop4
	ld a, [hl]
	rla
	ld [hl], a
	inc hl
	dec d
	jp nz, .loop4
	pop hl
.handleLoop
	dec e
	jp nz, .loop3
	pop bc
	pop de
	pop hl
	ret

RightShiftArbitrarySize: ; 31ea (0:31ea)
	push hl
	push de
	push bc
	ld e, b
	ld b, $0
.loop
	ld a, e
	sub $8
	jp c, .right_shifting
	ld e, a
	push hl
	ld d, c
	dec d
.loop2
	inc hl
	ld a, [hl]
	dec hl
	ld [hl], a
	inc hl
	dec d
	jp nz, .loop2
	ld [hl], b
	pop hl
	jp .loop

.right_shifting
	inc e
	jp .handleLoop

.loop3
	ld d, c
	add hl, bc
.loop4
	dec hl
	ld a, [hl]
	rra
	ld [hl], a
	dec d
	jp nz, .loop4
.handleLoop
	dec e
	jp nz, .loop3
	pop bc
	pop de
	pop hl
	ret

IncrementArbitrarySize: ; 321e (0:321e)
	push hl
	push bc
	inc c
	jp .handleLoop

.loop
	inc [hl]
	jp nz, .done
	inc hl
.handleLoop
	dec c
	jp nz, .loop
.done
	pop bc
	pop hl
	ret

SubtractArbitrarySize: ; 3230 (0:3230)
	push hl
	push de
	push bc
	push de
	push hl
	pop de
	pop hl
	and a
.loop
	ld a, [de]
	sbc [hl]
	ld [de], a
	inc de
	inc hl
	dec c
	jp nz, .loop
	pop bc
	pop de
	pop hl
	ret

AddArbitrarySize: ; 3245 (0:3245)
	push hl
	push de
	push bc
	push de
	push hl
	pop de
	pop hl
	and a
.loop
	ld a, [de]
	adc [hl]
	ld [de], a
	inc de
	inc hl
	dec c
	jp nz, .loop
	pop bc
	pop de
	pop hl
	ret

StackCopyS80:
	pop hl
	push de
	push hl
	pop de
	pop hl
	ld hl, -10
	add hl, sp
	ld sp, hl
	ld c, $a
.loop
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	dec c
	jp nz, .loop
	push de
	push hl
	pop de
	pop hl
	jp [hl]

RetrieveS80FromStack:
	pop bc
	ld a, $5
.loop
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jp nz, .loop
	push bc
	ld bc, -10
	add hl, bc
	ret

RetrieveS64FromStack:
	pop bc
	ld a, $4
.loop
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jp nz, .loop
	push bc
	ld bc, -8
	add hl, bc
	ret

PutS64OnStack:
	ld bc, $8
	ld a, $4
	jp putLongOrUltraLongOnStack

PutS80OnStack:
	ld bc, $a
	ld a, $5
putLongOrUltraLongOnStack
	add hl, bc
	pop bc
.loop
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	push de
	dec a
	jp nz, .loop
	push bc
	ret

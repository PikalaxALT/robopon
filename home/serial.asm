Func_1069:: ; 1069, serial interrupt pointer for ???
	push af
	push hl
	ld a, [rSB]
	ld [wc31c], a
	ld a, $1
	ld [wc31a], a
	ld a, [wc31b]
	ld [rSB], a
	ld a, [wc31d]
	ld [rSC], a
	ld hl, Pointers_1090
	ld a, [wc31e]
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_1090:: ; 1090
	dw Func_10a6
	dw Func_10b9
	dw Func_10cc
	dw Func_10fc
	dw Func_110a
	dw Func_111d
	dw Func_1130
	dw Func_115f
	dw Func_116c
	dw Func_10a9
	dw Func_10b1

Func_10a6:: ; 10a6
	pop hl
	pop af
	reti

Func_10a9:: ; 10a9
	ld a, $2
	ld [wc31e], a
	pop hl
	pop af
	reti

Func_10b1:: ; 10b1
	ld a, $6
	ld [wc31e], a
	pop hl
	pop af
	reti

Func_10b9:: ; 10b9
	ld a, [wc31c]
	cp $a0
	jr nz, .asm_10c9
	ld a, $b0
	ld [rSB], a
	ld a, $9
	ld [wc31e], a
.asm_10c9
	pop hl
	pop af
	reti

Func_10cc:: ; 10cc
	ld a, [wc322]
	ld l, a
	ld a, [wc322 + 1]
	ld h, a
	ld a, [wc31c]
	ld [hli], a
	ld a, l
	ld [wc322], a
	ld a, h
	ld [wc322 + 1], a
	ld a, [wc320]
	ld l, a
	ld a, [wc320 + 1]
	ld h, a
	dec hl
	ld a, l
	ld [wc320], a
	ld a, h
	ld [wc320 + 1], a
	or l
	jr nz, .asm_10f9
	ld a, $3
	ld [wc31e], a
.asm_10f9
	pop hl
	pop af
	reti

Func_10fc:: ; 10fc
	ld a, [wc31c]
	ld [wc324], a
	ld a, $4
	ld [wc31e], a
	pop hl
	pop af
	reti

Func_110a:: ; 110a
	ld a, $1
	ld [wc31f], a
	ld a, [wc31c]
	ld [wc324 + 1], a
	ld a, $0
	ld [wc31e], a
	pop hl
	pop af
	reti

Func_111d:: ; 111d
	ld a, [wc31c]
	cp $a2
	jr nz, .asm_112d
	ld a, $b2
	ld [rSB], a
	ld a, $6
	ld [wc31e], a
.asm_112d
	pop hl
	pop af
	reti

Func_1130:: ; 1130
	ld a, [wc322]
	ld l, a
	ld a, [wc322 + 1]
	ld h, a
	ld a, [hli]
	ld [rSB], a
	ld a, l
	ld [wc322], a
	ld a, h
	ld [wc322 + 1], a
	ld a, [wc320]
	ld l, a
	ld a, [wc320 + 1]
	ld h, a
	dec hl
	ld a, l
	ld [wc320], a
	ld a, h
	ld [wc320 + 1], a
	or l
	jr nz, .asm_115c
	ld a, $7
	ld [wc31e], a
.asm_115c
	pop hl
	pop af
	reti

Func_115f:: ; 115f
	ld a, [wc324]
	ld [rSB], a
	ld a, $8
	ld [wc31e], a
	pop hl
	pop af
	reti

Func_116c:: ; 116c
	ld a, $1
	ld [wc31f], a
	ld a, [wc324 + 1]
	ld [rSB], a
	ld a, $0
	ld [wc31e], a
	pop hl
	pop af
	reti


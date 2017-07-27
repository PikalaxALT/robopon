AdjustItemQuantity: ; 5a149 (16:6149)
; a = item idx
; c = execution mode
;     0: put in bag
;     1: take from bag
;     2: put in storage
;     3: take from storage
; e = amount
	push af
	push de
	push bc
	push bc
	push bc
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	ld hl, sp+$3
	ld [hl], a
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, Func_5a171
	cp $2
	jp nz, Func_5a178
Func_5a171: ; 5a171 (16:6171)
	ld hl, sp+$2
	ld [hl], $50
	jp Func_5a17e

Func_5a178: ; 5a178 (16:6178)
	ld hl, sp+$2
	ld a, [wSaveScratchca6c]
	ld [hl], a
Func_5a17e: ; 5a17e (16:617e)
	ld c, $0
	ld hl, sp+$1
	ld [hl], $ff
	ld hl, sp+$0
	ld [hl], $0
Func_5a188: ; 5a188 (16:6188)
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_5a348
	ld hl, sp+$4
	ld a, [hl]
	cp $3
	jp z, Func_5a272
	cp $2
	jp z, Func_5a272
	cp $1
	jp z, Func_5a1a7
	or a
	jp nz, Func_5a33e
Func_5a1a7: ; 5a1a7 (16:61a7)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	cp [hl]
	jp nz, Func_5a26f
	ld hl, sp+$4
	ld a, [hl]
	or a
	jp nz, Func_5a1f0
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	cp 99
	jp nc, Func_5a1e2
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	add [hl]
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $1
	jp Func_5a1ed

Func_5a1e2: ; 5a1e2 (16:61e2)
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	ld a, $ff
	jp Func_5a3db

Func_5a1ed: ; 5a1ed (16:61ed)
	jp Func_5a26a

Func_5a1f0: ; 5a1f0 (16:61f0)
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	sub c
	ld [hl], a
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5a266
	ld hl, sp+$2
	ld a, [hl]
	dec a
	ld hl, sp+$2
	ld [hl], a
	cp $1
	jp c, Func_5a251
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_5a251
	ld hl, sp+$0
	ld c, [hl]
Func_5a225: ; 5a225 (16:6225)
	ld a, c
	cp $13
	jp nc, Func_5a251
	ld e, c
	ld d, $0
	inc de
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld [hl], a
	ld e, c
	ld d, $0
	inc de
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld [hl], a
	inc c
	jp Func_5a225

Func_5a251: ; 5a251 (16:6251)
	ld hl, sp+$2
	ld a, [hl]
	ld [wSaveScratchca6c], a
	xor a
	ld [wSaveScratchBagItems + 19], a
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	ld a, $1
	jp Func_5a3db

Func_5a266: ; 5a266 (16:6266)
	ld hl, sp+$1
	ld [hl], $1
Func_5a26a: ; 5a26a (16:626a)
	ld c, $1
	jp Func_5a33e

Func_5a26f: ; 5a26f (16:626f)
	jp Func_5a33e

Func_5a272: ; 5a272 (16:6272)
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	cp [hl]
	jp nz, Func_5a33e
	ld hl, sp+$4
	ld a, [hl]
	cp $2
	jp nz, Func_5a2d1
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	cp 99
	jp nc, Func_5a2ce
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	add [hl]
	ld [hl], a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	cp 100
	jp c, Func_5a2ca
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld [hl], 99
Func_5a2ca: ; 5a2ca (16:62ca)
	ld hl, sp+$1
	ld [hl], $1
Func_5a2ce: ; 5a2ce (16:62ce)
	jp Func_5a33c

Func_5a2d1: ; 5a2d1 (16:62d1)
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	sub c
	ld [hl], a
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld a, [hl]
	or a
	jp nz, Func_5a338
	ld hl, sp+$2
	ld a, [hl]
	dec a
	ld hl, sp+$0
	cp [hl]
	jp z, Func_5a329
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	dec hl
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2 + 2
	add hl, de
	push hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	pop de
	call CopyFromDEtoHL
Func_5a329: ; 5a329 (16:6329)
	xor a
	ld [wWarehouseItemQuantities + $9e], a
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	ld a, $1
	jp Func_5a3db

Func_5a338: ; 5a338 (16:6338)
	ld hl, sp+$1
	ld [hl], $1
Func_5a33c: ; 5a33c (16:633c)
	ld c, $1
Func_5a33e: ; 5a33e (16:633e)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_5a188

Func_5a348: ; 5a348 (16:6348)
	inc c
	dec c
	jp nz, Func_5a3d2
	ld hl, sp+$4
	ld a, [hl]
	cp $2
	jp z, Func_5a389
	or a
	jp nz, Func_5a3d2
	ld hl, sp+$2
	ld a, [hl]
	cp $14
	jp nc, Func_5a386
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$2
	ld e, [hl]
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld [hl], a
	ld a, [wSaveScratchca6c]
	inc a
	ld [wSaveScratchca6c], a
	ld hl, sp+$1
	ld [hl], $1
Func_5a386: ; 5a386 (16:6386)
	jp Func_5a3d2

Func_5a389: ; 5a389 (16:6389)
	ld hl, sp+$0
	ld [hl], $0
Func_5a38d: ; 5a38d (16:638d)
	ld hl, sp+$0
	ld a, [hl]
	cp $50
	jp nc, Func_5a3d2
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_5a3c8
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wSaveBlock2
	add hl, de
	inc hl
	ld [hl], a
	ld hl, sp+$1
	ld [hl], $1
	jp Func_5a3d2

Func_5a3c8: ; 5a3c8 (16:63c8)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_5a38d

Func_5a3d2: ; 5a3d2 (16:63d2)
	ld hl, sp+$3
	ld a, [hl]
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
Func_5a3db: ; 5a3db (16:63db)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

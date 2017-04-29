CheckBackgroundCollision:: ; 9f87 (2:5f87)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$0
	ld [hl], c
	ld a, c
	and $3f
	ld c, a
	ld a, c
	cp $1
	jp nz, Func_9fe7
	ld hl, sp+$b
	ld a, [hl]
	ld hl, wMapWidth
	cp [hl]
	jp nc, Func_9fae
	ld hl, sp+$8
	ld a, [hl]
	ld hl, wMapHeight
	cp [hl]
	jp c, Func_9fb3
Func_9fae: ; 9fae (2:5fae)
	ld a, $ff
	jp Func_a181

Func_9fb3: ; 9fb3 (2:5fb3)
	push bc
	ld hl, sp+$a
	ld e, [hl]
	ld hl, sp+$d
	ld a, [hl]
	call Func_9f64
	ld hl, sp+$3
	ld [hl], a
	pop bc
	push bc
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, [wPlayerMapY]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	ld a, [wPlayerMapX]
	ld e, a
	ld d, $0
	add hl, de
	ld e, [hl]
	pop bc
	jp Func_a055

Func_9fe7: ; 9fe7 (2:5fe7)
	push bc
	ld a, [wPlayerMapX]
	dec a
	ld hl, sp+$d
	cp [hl]
	jp nz, Func_9ff8
	ld de, -1
	jp Func_a03a

Func_9ff8: ; 9ff8 (2:5ff8)
	ld a, [wPlayerMapX]
	inc a
	ld hl, sp+$d
	cp [hl]
	jp nz, Func_a008
	ld de, $1
	jp Func_a03a

Func_a008: ; a008 (2:6008)
	ld a, [wPlayerMapY]
	dec a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_a026
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	reg16swap de, hl
	jp Func_a03a

Func_a026: ; a026 (2:6026)
	ld a, [wPlayerMapY]
	inc a
	ld hl, sp+$a
	cp [hl]
	jp nz, Func_a03a
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	reg16swap de, hl
Func_a03a: ; a03a (2:603a)
	reg16swap de, hl
	call Func_9f4c
	ld hl, sp+$3
	ld [hl], a
	read_hl_from wPlayerStandingTileOffset
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	ld e, [hl]
	pop bc
Func_a055: ; a055 (2:6055)
	ld hl, sp+$0
	ld a, [hl]
	and $80
	jp nz, Func_a09f
	ld a, [wPlayerFacing]
	cp FACE_LEFT
	jp z, Func_a094
	cp FACE_DOWN
	jp z, Func_a089
	cp FACE_RIGHT
	jp z, Func_a07e
	or a
	jp nz, Func_a09f
	ld a, e
	and $40
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a07e: ; a07e (2:607e)
	ld a, e
	and $20
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a089: ; a089 (2:6089)
	ld a, e
	and $10
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a094: ; a094 (2:6094)
	ld a, e
	and $8
	jp z, Func_a09f
	ld a, $ff
	jp Func_a181

Func_a09f: ; a09f (2:609f)
	ld a, c
	cp $1
	jp nz, Func_a15e
	ld hl, sp+$6
	ld [hl], $0
Func_a0a9: ; a0a9 (2:60a9)
	ld hl, sp+$6
	ld a, [hl]
	ld hl, wNumPeopleLoaded
	cp [hl]
	jp nc, Func_a15e
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld a, [hl]
	and $80
	jp z, Func_a0de
	ld a, [bc]
	cp $ff
	jp nz, Func_a0de
	jp Func_a154

Func_a0de: ; a0de (2:60de)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	or a
	jp nz, Func_a154
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	read_hl_from wc776
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	or a
	jp z, Func_a154
	ld l, c
	ld h, b
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$b
	ld e, [hl]
	ld hl, sp+$8
	ld c, [hl]
	ld a, e
	ld hl, sp+$5
	cp [hl]
	jp c, Func_a154
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$3
	add [hl]
	ld l, a
	ld a, e
	cp l
	jp nc, Func_a154
	ld a, c
	ld hl, sp+$4
	cp [hl]
	jp c, Func_a154
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$2
	add [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_a154
	ld a, $ff
	jp Func_a181

Func_a154: ; a154 (2:6154)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_a0a9

Func_a15e: ; a15e (2:615e)
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp nz, Func_a180
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	read_hl_from wc826
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_a17c
	ld a, $ff
	jp Func_a181

Func_a17c: ; a17c (2:617c)
	xor a
	jp Func_a181

Func_a180: ; a180 (2:6180)
	xor a
Func_a181: ; a181 (2:6181)
	add sp, $c
	ret

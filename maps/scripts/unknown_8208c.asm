Func_8208c:: ; 8208c (20:608c)
	cp $11
	jp z, Func_8224a
	cp $10
	jp z, Func_82235
	cp $f
	jp z, Func_82220
	cp $e
	jp z, Func_8220b
	cp $d
	jp z, Func_821f6
	cp $c
	jp z, Func_821e1
	cp $b
	jp z, Func_821cc
	cp $a
	jp z, Func_821b7
	cp $9
	jp z, Func_821a2
	cp $8
	jp z, Func_8218d
	cp $7
	jp z, Func_82178
	cp $6
	jp z, Func_82163
	cp $5
	jp z, Func_8214e
	cp $4
	jp z, Func_82139
	cp $3
	jp z, Func_82124
	cp $2
	jp z, Func_8210f
	cp $1
	jp z, Func_820fa
	or a
	jp nz, Func_8225c
	ld a, $5a
	call PlaySFX_20
	ld l, $7
	push hl
	ld c, $2b
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_820fa: ; 820fa (20:60fa)
	ld a, $5a
	call PlaySFX_20
	ld l, $13
	push hl
	ld c, $d
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8210f: ; 8210f (20:610f)
	ld a, $5a
	call PlaySFX_20
	ld l, $16
	push hl
	ld c, $5
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82124: ; 82124 (20:6124)
	ld a, $5a
	call PlaySFX_20
	ld l, $7
	push hl
	ld c, $10
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82139: ; 82139 (20:6139)
	ld a, $5a
	call PlaySFX_20
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	ld a, $8
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8214e: ; 8214e (20:614e)
	ld a, $5a
	call PlaySFX_20
	ld l, $e
	push hl
	ld c, $6
	ld e, $0
	ld a, $2
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82163: ; 82163 (20:6163)
	ld a, $5a
	call PlaySFX_20
	ld l, $2d
	push hl
	ld c, $5
	ld e, $0
	ld a, $9
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82178: ; 82178 (20:6178)
	ld a, $5a
	call PlaySFX_20
	ld l, $14
	push hl
	ld c, $11
	ld e, $0
	ld a, $15
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8218d: ; 8218d (20:618d)
	ld a, $5a
	call PlaySFX_20
	ld l, $10
	push hl
	ld c, $7
	ld e, $0
	ld a, $18
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821a2: ; 821a2 (20:61a2)
	ld a, $5a
	call PlaySFX_20
	ld l, $5
	push hl
	ld c, $7
	ld e, $0
	ld a, $1c
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821b7: ; 821b7 (20:61b7)
	ld a, $5a
	call PlaySFX_20
	ld l, $7
	push hl
	ld c, $9
	ld e, $0
	ld a, $1b
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821cc: ; 821cc (20:61cc)
	ld a, $5a
	call PlaySFX_20
	ld l, $4
	push hl
	ld c, $6
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821e1: ; 821e1 (20:61e1)
	ld a, $5a
	call PlaySFX_20
	ld l, $6
	push hl
	ld c, $7
	ld e, $0
	ld a, $1a
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821f6: ; 821f6 (20:61f6)
	ld a, $5a
	call PlaySFX_20
	ld l, $a
	push hl
	ld c, $10
	ld e, $0
	ld a, $6
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8220b: ; 8220b (20:620b)
	ld a, $5a
	call PlaySFX_20
	ld l, $17
	push hl
	ld c, $13
	ld e, $16
	ld a, $13
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82220: ; 82220 (20:6220)
	ld a, $5a
	call PlaySFX_20
	ld l, $4
	push hl
	ld c, $a
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82235: ; 82235 (20:6235)
	ld a, $5a
	call PlaySFX_20
	ld l, $4
	push hl
	ld c, $e
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8224a: ; 8224a (20:624a)
	ld a, $5a
	call PlaySFX_20
	ld l, $14
	push hl
	ld c, $5
	ld e, $a
	ld a, $12
	call Func_80dff_20
	pop bc
Func_8225c: ; 8225c (20:625c)
	ret

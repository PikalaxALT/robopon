Data_819ac:
	dr $819ac, $819b0

Func_819b0:
	push de
	ld hl, $2
	call CheckEventFlag_20
	or a
	jp nz, Func_819e8
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819e8
	ld e, $2
	ld a, $3
	call SpriteFace_20
	ld hl, $28
	call PrintTextWithNPCName_20
	xor a
	call PlayerFace_20
	ld c, $1
	ld de, Data_819ac
	ld a, BANK(Data_819ac)
	call ApplyMovementData_20
	call Func_8020c_20
	ld e, $3
	ld a, $3
	call SpriteFace_20
Func_819e8: ; 819e8 (20:59e8)
	pop bc
	ret

Func_819ea:
	ld a, e
	cp $1
	jp nz, Func_81a21
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_819fb
	jp Func_81a21

Func_819fb: ; 819fb (20:59fb)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	call Func_80dff_20
	pop bc
	ld a, $1
	ld [$c7e9], a
	ld a, $7
	ld [$c7ea], a
	ld a, $2e
	call PlaySFX_20
	ld a, $8
	ld [$c7db], a
	ld a, $8
	ld [$c7dc], a
Func_81a21: ; 81a21 (20:5a21)
	ret

Func_81a22:
	ld a, e
	cp $1
	jp nz, Func_81a59
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_81a33
	jp Func_81a59

Func_81a33: ; 81a33 (20:5a33)
	ld l, $7
	push hl
	ld c, $0
	ld e, $4
	ld a, $20
	call Func_80dff_20
	pop bc
	ld a, $1
	ld [$c7e9], a
	ld a, $7
	ld [$c7ea], a
	ld a, $2e
	call PlaySFX_20
	ld a, $8
	ld [$c7db], a
	ld a, $f
	ld [$c7dc], a
Func_81a59: ; 81a59 (20:5a59)
	ret

Func_81a5a:
	ld a, e
	cp $2
	jp nz, Func_81a65
	ld a, $6
	ld [$c78a], a
Func_81a65: ; 81a65 (20:5a65)
	ret

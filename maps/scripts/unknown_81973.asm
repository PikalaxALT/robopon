Data_8196f: ; 8196f
	dr $8196f, $81973

Func_81973:
	push de
	ld hl, $3
	call CheckEventFlag_20
	or a
	jp nz, Func_819aa
	ld hl, sp+$0
	ld a, [hl]
	cp $2
	jp nz, Func_819aa
	ld e, $3
	xor a
	call SpriteFace_20
	ld hl, $1d
	call PrintTextWithNPCName_20
	ld a, $1
	call PlayerFace_20
	ld c, $1
	ld de, Data_8196f
	ld a, BANK(Data_8196f)
	call ApplyMovementData_20
	call Func_8020c_20
	ld e, $2
	xor a
	call SpriteFace_20
Func_819aa: ; 819aa (20:59aa)
	pop bc
	ret

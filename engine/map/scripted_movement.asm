FacePlayer:: ; b3ef
	push af
	ld a, [wPlayerFacing]
	add $2
	and $3
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	call ChangePersonFacing
	pop bc
	ret

StartMovement:: ; b400 (2:7400)
	call SetMovementPointer
	call HandleMap
	ret

ClearMovementPointer: ; b407 (2:7407)
	ld hl, $0
	write_hl_to wMovementDataAddr
	xor a
	ld [wMovementCurPathEndpointY], a
	ld [wMovementCurPathEndpointX], a
	ld [wMovementPerson], a
	ld [wMovementDataBank], a
	ret

SetMovementPointer: ; b41d (2:741d)
	push bc
	push bc
	push de
	push af
	ld [wFarCallDestBank], a
	ld hl, sp+$6
	ld bc, $2
	call FarCopyVideoData
	pop af
	ld [wMovementDataBank], a
	pop hl
	write_hl_to wMovementDataAddr
	pop bc
	ld a, c
	ld [wMovementPerson], a
	ld hl, sp+$0
	ld a, [hl]
	ld [wMovementCurPathEndpointX], a
	ld hl, sp+$1
	ld a, [hl]
	ld [wMovementCurPathEndpointY], a
	pop bc
	ret

Data_b449: ; b449
	dr $b449, $b44d

Func_b44d: ; b44d (2:744d)
	push bc
	push bc
	push bc
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_b449
	ld bc, $4
	call MemCopy
	read_hl_from wMovementDataAddr
	ld a, l
	or h
	jp nz, Func_b4bd
	call GetJoyPressed
	ld hl, sp+$4
	ld [hl], a
	ld hl, $0
	call Func_9f4c
	ld hl, wSlipperyCollision
	cp [hl]
	jp nz, Func_b4b6
	ld a, [wSliding]
	cp $1
	jp nz, Func_b4b3
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_b4af
	cp $2
	jp z, Func_b4a8
	cp $1
	jp z, Func_b4a1
	or a
	jp nz, Func_b4b3
	ld hl, sp+$4
	ld [hl], $4
	jp Func_b4b3

Func_b4a1: ; b4a1 (2:74a1)
	ld hl, sp+$4
	ld [hl], $1
	jp Func_b4b3

Func_b4a8: ; b4a8 (2:74a8)
	ld hl, sp+$4
	ld [hl], $8
	jp Func_b4b3

Func_b4af: ; b4af (2:74af)
	ld hl, sp+$4
	ld [hl], $2
Func_b4b3: ; b4b3 (2:74b3)
	jp Func_b4ba

Func_b4b6: ; b4b6 (2:74b6)
	xor a
	ld [wSliding], a
Func_b4ba: ; b4ba (2:74ba)
	jp Func_b525

Func_b4bd: ; b4bd (2:74bd)
	ld a, [wMovementCurPathEndpointY]
	ld l, a
	push hl
	ld a, [wMovementCurPathEndpointX]
	ld c, a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call GetSpawnFacing
	pop bc
	ld hl, sp+$4
	ld [hl], a
	cp $ff
	jp nz, Func_b519
	read_hl_from wMovementDataAddr
	inc hl
	inc hl
	write_hl_to wMovementDataAddr
	ld a, [wMovementDataBank]
	ld [wFarCallDestBank], a
	ld bc, $2
	read_hl_from wMovementDataAddr
	reg16swap de, hl
	ld hl, sp+$4
	call FarCopyVideoData
	ld hl, sp+$4
	ld a, [hl]
	ld [wMovementCurPathEndpointX], a
	ld hl, sp+$5
	ld a, [hl]
	ld [wMovementCurPathEndpointY], a
	ld a, [wMovementCurPathEndpointX]
	cp $ff
	jp nz, Func_b515
	ld a, $ff
	jp Func_b528

Func_b515: ; b515 (2:7515)
	xor a
	jp Func_b528

Func_b519: ; b519 (2:7519)
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	jp Func_b528

Func_b525: ; b525 (2:7525)
	ld hl, sp+$4
	ld a, [hl]
Func_b528: ; b528 (2:7528)
	pop bc
	pop bc
	pop bc
	ret

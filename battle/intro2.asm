Data_d7e7: ; d7e7
	dr $d7e7, $d7f5

Func_d7f5: ; d7f5 (3:57f5)
	push bc
	push bc
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld c, l
	ld b, h
	pop de
	push bc
	cp $7
	jp z, Func_da26
	cp $6
	jp z, Func_da0c
	cp $5
	jp z, Func_d9f5
	cp $4
	jp z, Func_d99a
	cp $3
	jp z, Func_d96d
	cp $2
	jp z, Func_d945
	cp $1
	jp z, Func_d833
	or a
	jp nz, Func_dacf
Func_d833: ; d833 (3:5833)
	push af
	push de
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	reg16swap de, hl
	inc hl
	inc hl
	ld e, [hl]
	xor a
	call Func_dbf5
	pop de
	push de
	ld hl, $5
	add hl, de
	ld c, [hl]
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, $1
	call Func_dbf5
	pop de
	push de
	ld a, [de]
	ld l, a
	push hl
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus10
	pop hl
	pop de
	push hl
	ld l, e
	ld h, d
	inc hl
	ld c, [hl]
	ld a, c
	cp $ff
	jp nz, Func_d8a2
	ld hl, sp+$8
	ld [hl], $1
	call GetHLAtSPPlus8
	ld de, $2f
	add hl, de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus8
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	call GetHLAtSPPlus8
	ld de, hFFC9 + 8
	add hl, de
	call WriteHLToSPPlus8
	jp Func_d8a6

Func_d8a2: ; d8a2 (3:58a2)
	ld hl, sp+$8
	ld [hl], $0
Func_d8a6: ; d8a6 (3:58a6)
	pop hl
	pop af
	or a
	jp nz, Func_d8cd
	ld e, c
	ld a, l
	call Func_e015
	ld a, [wSystemType]
	cp $1
	jp z, Func_d8c1
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_d8ca
Func_d8c1: ; d8c1 (3:58c1)
	ld de, $e
	ld hl, Data_d7e7
	call Func_2b7d
Func_d8ca: ; d8ca (3:58ca)
	jp Func_d938

Func_d8cd: ; d8cd (3:58cd)
	call ClearSprites
	ld a, [wc2cd]
	xor $1
	ld [wc2cd], a
	call Func_c72e
	call Func_c6ff
	set_farcall_addrs_hli Func_667d
	ld hl, wc2cd
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1311
	ld hl, $0
	call FarCall
	ld a, [wSystemType]
	cp $11
	jp nz, Func_d932
	call WaitVideoTransfer
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld a, [wc2cd]
	ld c, a
	ld b, $0
	ld de, $1311
	ld hl, $0
	call FarCall
	call WaitVideoTransfer
	ld a, [rVBK]
	and $fe
	ld [rVBK], a
Func_d932: ; d932 (3:5932)
	call WaitVideoTransfer
	call Func_c779
Func_d938: ; d938 (3:5938)
	xor a
	call Func_d030
	call Func_c8fe
	call Func_c7ba
	jp Func_dacf

Func_d945: ; d945 (3:5945)
	ld l, e
	ld h, d
	inc hl
	inc hl
	inc hl
	ld c, [hl]
	reg16swap de, hl
	inc hl
	inc hl
	ld e, [hl]
	xor a
	call Func_dbf5
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
	jp Func_dacf

Func_d96d: ; d96d (3:596d)
	ld hl, $5
	add hl, de
	ld c, [hl]
	reg16swap de, hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld a, $1
	call Func_dbf5
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $2
	jp Func_dacf

Func_d99a: ; d99a (3:599a)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_d9c5
	ld c, $7
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	jp Func_d9de

Func_d9c5: ; d9c5 (3:59c5)
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	ld c, $7
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
Func_d9de: ; d9de (3:59de)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $0
	jp Func_d8cd

Func_d9f5: ; d9f5 (3:59f5)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
	jp Func_dacf

Func_da0c: ; da0c (3:5a0c)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $2f
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $2
	jp Func_dacf

Func_da26: ; da26 (3:5a26)
	read_hl_from wCurRobotPointer
	ld de, $1c4
	add hl, de
	ld a, [hl]
	and $2
	jp z, Func_da51
	ld c, $7
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	jp Func_da6a

Func_da51: ; da51 (3:5a51)
	ld c, $8
	ld e, $0
	ld a, $1
	call Func_dbf5
	ld c, $7
	read_hl_from wCurRobotPointer
	ld de, $e2
	add hl, de
	ld e, [hl]
	xor a
	call Func_dbf5
Func_da6a: ; da6a (3:5a6a)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld l, a
	call GetHLAtSPPlus4
	ld de, $2f
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld c, a
	ld e, c
	ld a, $c5
	call Func_e015
	ld a, [wSystemType]
	cp $1
	jp z, Func_daae
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_dab7
Func_daae: ; daae (3:5aae)
	ld de, $e
	ld hl, Data_d7e7
	call Func_2b7d
Func_dab7: ; dab7 (3:5ab7)
	xor a
	call Func_d030
	call Func_c8fe
	call Func_c7ba
	call GetHLAtSPPlus4
	ld de, hFFC9 + 8
	add hl, de
	call WriteHLToSPPlus4
	ld hl, sp+$4
	ld [hl], $1
Func_dacf: ; dacf (3:5acf)
	pop bc
	ld hl, sp+$2
	ld a, [hl]
	cp $2
	jp z, Func_db78
	cp $1
	jp z, Func_db2f
	or a
	jp nz, Func_dbd3
	ld a, $2
	call Func_d030
	call Func_c6ff
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call Func_dc0a
	pop hl
	push hl
	ld de, $2f
	add hl, de
	pop de
	push hl
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call Func_dc0a
	ld a, $1
	call Func_d030
	jp Func_dbd3

Func_db2f: ; db2f (3:5b2f)
	push bc
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $4
	jp nz, Func_db5a
	ld a, $3
	call Func_d030
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_db5a: ; db5a (3:5b5a)
	pop bc
	ld hl, $8
	add hl, bc
	ld a, $fb
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	xor a
	call Func_dc0a
	ld a, $4
	call Func_d030
	jp Func_dbd3

Func_db78: ; db78 (3:5b78)
	push bc
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, $fe
	and [hl]
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and $4
	jp nz, Func_dbb7
	ld a, $5
	call Func_d030
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	call Func_d767
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
Func_dbb7: ; dbb7 (3:5bb7)
	pop bc
	ld hl, $9
	add hl, bc
	ld a, $fb
	and [hl]
	ld [hl], a
	pop hl
	push hl
	ld de, $c
	add hl, de
	ld a, [hl]
	dec a
	ld e, a
	ld a, $1
	call Func_dc0a
	ld a, $6
	call Func_d030
Func_dbd3: ; dbd3 (3:5bd3)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3ca1
	pop bc
	pop bc
	pop bc
	ret

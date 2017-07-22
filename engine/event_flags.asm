Data_a983: ; a983
	db $1
	db $2
	db $4
	db $8
	db $10
	db $20
	db $40
	db $80

EventFlagAction:: ; a98b
	push hl
	push de
	call GetHLAtSPPlus4
	ld a, l
	sub $7
	or h
	jp nz, Func_a9b9
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, Func_a9b9
	call GetHLAtSPPlus4
	call CheckEventFlag
	or a
	jp nz, Func_a9b9
	set_farcall_addrs_hli Func_93941
	ld a, $2
	call FarCall
Func_a9b9: ; a9b9 (2:69b9)
	call GetHLAtSPPlus4
	ld a, l
	sub $b9
	or h
	jp nz, .check_mode
	ld hl, sp+$0
	ld a, [hl]
	cp $1
	jp nz, .check_mode
	call GetHLAtSPPlus4
	call CheckEventFlag
	or a
	jp nz, .check_mode
	set_farcall_addrs_hli Func_93941
	ld a, $3
	call FarCall
.check_mode
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp z, .reset
	cp $1
	jp nz, .done
	call GetHLAtSPPlus4
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	push af
	call GetHLAtSPPlus6
	ld de, $8
	call DivideHLByDESigned
	ld de, wEventFlags
	add hl, de
	pop af
	or [hl]
	ld [hl], a
	jp .done

.reset
	call GetHLAtSPPlus4
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	cpl
	push af
	call GetHLAtSPPlus6
	ld de, $8
	call DivideHLByDESigned
	ld de, wEventFlags
	add hl, de
	pop af
	and [hl]
	ld [hl], a
.done
	pop bc
	pop bc
	ret

CheckEventFlag:: ; aa36 (2:6a36)
	push hl
	pop hl
	push hl
	ld de, $8
	call DivideHLByDESigned
	ld de, wEventFlags
	add hl, de
	ld c, [hl]
	pop hl
	push hl
	ld a, l
	and $7
	ld e, a
	ld d, $0
	ld hl, Data_a983
	add hl, de
	ld a, [hl]
	and c
	jp z, Func_aa5a
	ld a, $1
	jp Func_aa5b

Func_aa5a: ; aa5a (2:6a5a)
	xor a
Func_aa5b: ; aa5b (2:6a5b)
	pop bc
	ret

Data_8151: ; 8151
	db $0c, $04, $0c, $05, $00, $00
	db $05, $14, $06, $14, $01, $00
	db $20, $0d, $1f, $0d, $05, $00
	db $0c, $04, $0c, $05, $03, $00
	db $23, $08, $22, $08, $06, $00
	db $0c, $04, $0c, $05, $07, $00
	db $05, $28, $06, $28, $09, $00
	db $0d, $04, $0d, $05, $14, $00
	db $11, $1d, $11, $1c, $15, $00
	db $14, $05, $13, $05, $16, $00
	db $11, $1c, $11, $1b, $12, $00
	db $07, $0a, $07, $09, $1f, $00
	db $0c, $1c, $0c, $1b, $19, $01
	db $0e, $29, $0e, $28, $1b, $00
	db $07, $13, $07, $12, $20, $0a
	db $23, $0e, $22, $0e, $0b, $00
	db $0f, $04, $0f, $05, $13, $16
	db $0f, $1f, $0f, $1e, $1d, $00
	db $07, $0b, $07, $0a, $1f, $00

Data_81c3
	db $20, $05, $1f, $05, $18, $00

Data_81c9: ; 81c9
	db $07, $0c, $07, $0b, $1a, $00

OverworldLoop: ; 81cf (2:41cf)
	push bc
	push bc
	ld a, [wSystemType]
	cp $11
	jp nz, .not_cgb
	set_farcall_addrs_hli Func_c7759
	ld e, $0
	xor a
	call FarCall
.not_cgb
	pop bc
	inc c
	dec c
	jp nz, .skip
	call Func_1db9
	ld bc, $c7b1 - $c789
.loop
	ld l, c
	ld h, b
	ld de, $c7bd - $c789
	call CompareHLtoDE
	jp nc, .okay
	ld hl, $c789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp .loop

.okay
	xor a
	ld [wOAM06YCoord], a
	ld a, $1
	ld [$c7e2], a
	set_farcall_addrs_hli Func_e2780
	ld a, $1
	call FarCall
	ld a, $ff
	ld [$c7e0], a
	ld [$c7df], a
	ld a, $3
	ld [$c7e9], a
	ld [$c7e7], a
	ld a, $5
	ld [$c7ea], a
	ld [$c7e8], a
	xor a
	ld [$c7eb], a
	ld a, $2
	ld [$c7ec], a
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	jp .continue

.skip
	ld a, c
	cp $1
	jp nz, .not_map_1
	callba_hli Func_56fc2
	callba_hli Func_4fef1
	callba_hli Func_93c0c
	callba_hli Func_9a8c3
	xor a
	ld [wMapMusic], a
	jp .continue

.not_map_1
	push bc
	callba_hli Func_238c8
	ld de, Data_840f
	lb hl, 5, 7
	call PlaceStringDEatCoordHL
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call Func_3bc5
	pop bc
	set_farcall_addrs_hli Func_51bf3
	pop bc
	ld a, c
	call FarCall
	ld a, $1
	ld [$c7e2], a
	ld bc, $c7b1 - $c789
.loop2
	ld l, c
	ld h, b
	ld de, $c7bd - $c789
	call CompareHLtoDE
	jp nc, .okay2
	ld hl, $c789
	add hl, bc
	ld [hl], $ff
	inc bc
	jp .loop2

.okay2
	xor a
	ld [wOAM06YCoord], a
	ld a, $ff
	ld [$c7e0], a
	ld [$c7df], a
	ld a, $3
	ld [$c7e9], a
	ld [$c7e7], a
	ld a, $5
	ld [$c7ea], a
	ld [$c7e8], a
	xor a
	ld [$c7eb], a
	ld a, $2
	ld [$c7ec], a
.continue
	ld a, $ff
	ld [$c838], a
.loop3
	ld a, [$c7eb]
	cp $ff
	jp nz, .okay3
	call Func_b6f2
	call Func_3aa8
	callba_hli Func_d9f68
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ld a, $1
	call Func_bbc8
	call Func_b65f
	ld a, $14
	ld [wMapMusic], a
	callba_hli Func_e220d
	ld hl, sp+$0
	ld [hl], a
	ld a, $ff
	ld [$c7df], a
	ld a, $ff
	ld [$c7e0], a
	ld hl, sp+$0
	ld a, [hl]
	cp $9
	jp nz, .no_lookup_Data_81c3
	ld hl, $44
	call Func_aa36
	cp $1
	jp nz, .no_lookup_Data_81c3
	ld bc, Data_81c3
	jp .do_trigger

.no_lookup_Data_81c3
	ld hl, sp+$0
	ld a, [hl]
	cp $e
	jp nz, .lookup_Data_8151
	ld hl, $1c
	call Func_aa36
	cp $1
	jp nz, .lookup_Data_8151
	ld bc, Data_81c9
	jp .do_trigger

.lookup_Data_8151
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_8151
	add hl, de
	ld c, l
	ld b, h
.do_trigger
	ld de, $c7e7 - $c789
.loop4
	ld hl, $c7ec - $c789
	call CompareHLtoDE
	jp c, .okay3
	ld hl, $c789
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	inc de
	jp .loop4

.okay3
	xor a
	ld [wVBlankTransferFlags], a
	ld c, $0
	ld a, [$c7ec]
	ld e, a
	ld a, [$c7eb]
	call ExitMap
	xor a
	ld [$c7da], a
	set_farcall_addrs_hli EnterMap
	ld a, [$c7ec]
	ld e, a
	ld a, [$c7eb]
	call FarCall
	xor a
	ld [$c798], a
	ld a, [$c84a]
	cp $1
	jp nz, .skip_HandleMap
	call HandleMap
.skip_HandleMap
	call Func_8df1
	jp .loop3

Data_840f: ; 840f
	db "<HIRA>なう ろーてﾞぃんくﾞ<KATA>$"

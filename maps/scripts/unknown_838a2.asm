
Data_8386f:
	warpdef $08, $01, $01, $01, MAP_00_10, $0c, $01, $0c, $02, $2e
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, $2e

Data_83885: ; 83885
	db $2b, $01, $08, $13, $15, $2c, $00, $05, $13, $1e, $2d, $02, $05, $13, $1f

Data_83894: ; 83894
	person_event $2a, $0c, $07, $05, $01, $01, $01, $04, $00, Func_83a1f, NULL

Func_838a2::
	call Func_838f0
	ld hl, Func_838f0
	scall Func_80f11
	xor a
	ld [wc7de], a
	loadwarps $2, Data_8386f
	ld e, $3
	ld hl, Data_83885
	scall Func_80ce7
	loadpeople $1, Data_83894
	playmusic SONG_SHOP
	call Func_83e56
	ld [wc7a4], a
	ld a, [wc7a4]
	cp $1
	jp nz, Func_838e0
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
Func_838e0: ; 838e0 (20:78e0)
	scall Func_8001c
	landmarksign TreeBitstreamText_46c00
	ret

Data_838ea: ; 838ea
	db $09, $01, $01, $01, $0a, $01

Func_838f0: ; 838f0 (20:78f0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83901
	ld hl, Data_838ea
	scall Func_80d9b
	scall Func_80f02
Func_83901: ; 83901 (20:7901)
	ret

Data_83902:
	db $32, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00, $32, $00, $00, $00
	db $64, $00, $00, $00, $96, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00, $00
	db $c8, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $00, $2c, $01, $00, $00
	db $c8, $00, $00, $00, $2c, $01, $00, $00, $90, $01, $00, $00, $2c, $01, $00, $00
	db $90, $01, $00, $00, $58, $02, $00, $00, $90, $01, $00, $00, $58, $02, $00, $00
	db $20, $03, $00, $00, $58, $02, $00, $00, $20, $03, $00, $00, $b0, $04, $00, $00
	db $20, $03, $00, $00, $b0, $04, $00, $00, $40, $06, $00, $00, $b0, $04, $00, $00
	db $40, $06, $00, $00, $60, $09, $00, $00, $40, $06, $00, $00, $60, $09, $00, $00
	db $80, $0c, $00, $00, $60, $09, $00, $00, $80, $0c, $00, $00, $c0, $12, $00, $00
	db $80, $0c, $00, $00, $c0, $12, $00, $00, $00, $19, $00, $00, $c0, $12, $00, $00
	db $00, $19, $00, $00, $80, $25, $00, $00, $00, $19, $00, $00, $80, $25, $00, $00
	db $00, $32, $00, $00, $80, $25, $00, $00, $00, $32, $00, $00, $00, $4b, $00, $00
	db $00, $32, $00, $00, $00, $4b, $00, $00, $00, $64, $00, $00, $00, $4b, $00, $00
	db $00, $64, $00, $00, $00, $96, $00, $00, $00, $64, $00, $00, $00, $96, $00, $00
	db $00, $c8, $00, $00, $00, $96, $00, $00, $00, $c8, $00, $00, $f4, $2d, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00


Data_839fe:
	db $05

Data_839ff: ; 839ff
	db $05, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13
	db $14, $15, $16, $17

Data_83a13: ; 83a13
	db $08, $01, $ff, $ff

Data_83a17: ; 83a17
	db $06, $07, $09, $02, $08, $01, $ff, $ff

Func_83a1f:
	push af
	ld hl, -$12e
	add hl, sp
	ld sp, hl
	push de
	ld hl, sp+$33
	reg16swap de, hl
	ld hl, Data_83902
	ld bc, $fc
	call MemCopy
	pop de
	ld a, e
	or a
	jp nz, .asm_83e48
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call FacePlayer_20
	checkevent $58
	or a
	jp nz, .asm_83a5e
	writenpctext TreeBitstreamText_45c80
	setevent $58
	jp .asm_83e48

.asm_83a5e: ; 83a5e (20:7a5e)
	ld a, [wc79d]
	cp $1
	jp nz, .asm_83b71
	ld a, [wc7a4]
	cp $ff
	jp nz, .asm_83a7b
	writenpctext TreeBitstreamText_47e30
	xor a
	ld [wc79d], a
	jp .asm_83b6e

.asm_83a7b: ; 83a7b (20:7a7b)
	writenpctext TreeBitstreamText_45e29
	ld a, [wc78c]
	inc a
	ld [wc78c], a
	xor a
	ld [wc79d], a
	ld a, [wc78c]
	cp $2
	jp z, .asm_83b53
	cp $3
	jp z, .asm_83b3b
	cp $4
	jp z, .asm_83b23
	cp $5
	jp z, .asm_83b0b
	cp $8
	jp z, .asm_83af3
	cp $9
	jp z, .asm_83adb
	cp $a
	jp nz, .asm_83b6e
	checkevent $110
	or a
	jp nz, .asm_83adb
	playsfx $5c
	script_sleep $78
	writenpctext TreeBitstreamText_39c6c
	writenpctext TreeBitstreamText_39c82
	setevent $110
.asm_83adb: ; 83adb (20:7adb)
	checkevent $106
	or a
	jp nz, .asm_83af3
	landmarksign TreeBitstreamText_461a9
	setevent $106
.asm_83af3: ; 83af3 (20:7af3)
	checkevent $105
	or a
	jp nz, .asm_83b0b
	landmarksign TreeBitstreamText_461b4
	setevent $105
.asm_83b0b: ; 83b0b (20:7b0b)
	checkevent $104
	or a
	jp nz, .asm_83b23
	landmarksign TreeBitstreamText_46175
	setevent $104
.asm_83b23: ; 83b23 (20:7b23)
	checkevent $103
	or a
	jp nz, .asm_83b3b
	landmarksign TreeBitstreamText_4619b
	setevent $103
.asm_83b3b: ; 83b3b (20:7b3b)
	checkevent $102
	or a
	jp nz, .asm_83b53
	landmarksign TreeBitstreamText_4618f
	setevent $102
.asm_83b53: ; 83b53 (20:7b53)
	checkevent $101
	or a
	jp nz, .asm_83b6b
	landmarksign TreeBitstreamText_46183
	setevent $101
.asm_83b6b: ; 83b6b (20:7b6b)
	jp .asm_83b6e

.asm_83b6e: ; 83b6e (20:7b6e)
	jp .asm_83e48

.asm_83b71: ; 83b71 (20:7b71)
	ld a, [wc78c]
	cp $14
	jp nz, .asm_83b96
	checkevent $e7
	cp $1
	jp nz, .asm_83b8d
	writenpctext TreeBitstreamText_45db0
	jp .asm_83b93

.asm_83b8d: ; 83b8d (20:7b8d)
	writenpctext TreeBitstreamText_45dff
.asm_83b93: ; 83b93 (20:7b93)
	jp .asm_83e48

.asm_83b96: ; 83b96 (20:7b96)
	push hl
	push hl
	ld hl, $0
	push hl
	ld hl, $0
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, sp+$f
	call PutLongFromStackToHL
	ld hl, sp+$7
	push hl
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	ld de, $8
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
	ld hl, sp+$b
	call PutLongFromHLOnStack
	ld hl, sp+$b
	call PutLongFromHLOnStack
	call CompareStackLongs_Signed
	jp c, .asm_83e42
	writenpctext_yesorno TreeBitstreamText_45cb9
	or a
	jp nz, .asm_83e39
	ld a, $3
	call Random_20
	cp $2
	jp z, .asm_83c48
	cp $1
	jp z, .asm_83c1e
	or a
	jp nz, .asm_83c6f
	writenpctext TreeBitstreamText_45d1c
	ld hl, sp+$b
	push hl
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
	jp .asm_83c6f

.asm_83c1e: ; 83c1e (20:7c1e)
	writenpctext TreeBitstreamText_45d3d
	ld hl, sp+$b
	push hl
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	pop de
	ld bc, $4
	call MemCopy
	jp .asm_83c6f

.asm_83c48: ; 83c48 (20:7c48)
	writenpctext TreeBitstreamText_45d61
	ld hl, sp+$b
	push hl
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$33
	add hl, de
	ld de, $8
	add hl, de
	pop de
	ld bc, $4
	call MemCopy
.asm_83c6f: ; 83c6f (20:7c6f)
	ld hl, sp+$b
	call PutLongFromHLOnStack
	ld hl, sp+$13
	call PrintNum
	pop bc
	pop bc
	ld hl, sp+$f
	call FindFirstNonzero
	reg16swap de, hl
	ld hl, sp+$f
	add hl, de
	ld de, Data_83e4e
	call strcpy
	ld hl, sp+$f
	write_hl_to_sp_plus $2f
	ld hl, $0
	write_hl_to_sp_plus $31
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	ld a, $2
	ld [wEnableAttrMapTransfer], a
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
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$2f
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	writenpctext TreeBitstreamText_45d82
	ld a, [wMapX]
	cp $3
	jp nz, .asm_83d45
	ld a, [wMapY]
	cp $1
	jp nz, .asm_83d45
	ld bc, Data_83a17
	ld e, BANK(Data_83a17)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	scall MovePersonAndWait
	playsfx $2e
	jp .asm_83d57

.asm_83d45: ; 83d45 (20:7d45)
	ld bc, Data_83a13
	ld e, BANK(Data_83a13)
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	scall MovePersonAndWait
	playsfx $2e
.asm_83d57: ; 83d57 (20:7d57)
	ld e, $0
	ld hl, $12f
	add hl, sp
	ld a, [hl]
	call SetPersonVisibilityState_20
	playsfx $2e
	push hl
	push hl
	ld hl, sp+$f
	call PutLongFromHLOnStack
	call NegateLongOnStack
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	ld hl, sp+$2
	scall Func_80f94
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$6
	ld c, [hl]
	ld hl, sp+$5
	ld e, [hl]
	ld hl, sp+$4
	ld a, [hl]
	call FarCall
	call WriteHLToSPPlus4
	pop bc
	ld hl, wc78c
	ld l, [hl]
	ld h, $0
	ld de, Data_839ff
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, bc
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld de, $5a0
	call CompareHLtoDE
	jp c, .asm_83dd5
	pop hl
	push hl
	inc hl
	pop de
	push hl
	ld hl, -$5a0
	add hl, bc
	ld c, l
	ld b, h
.asm_83dd5: ; 83dd5 (20:7dd5)
	push bc
	set_farcall_addrs_hli FixDays
	ld hl, sp+$4
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	push bc
	ld l, c
	ld h, b
	ld de, $3c
	call DivideHLByDESigned
	ld a, l
	ld hl, sp+$7
	ld [hl], a
	pop hl
	ld de, $3c
	call DivideHLByDESigned
	ld hl, sp+$6
	ld [hl], e
	ld a, $1
	ld [wc79d], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wc79e], a
	ld hl, sp+$3
	ld a, [hl]
	ld [wc79f], a
	ld hl, sp+$4
	ld a, [hl]
	ld [wc7a0], a
	ld hl, sp+$5
	ld a, [hl]
	ld [wc7a1], a
	ld hl, sp+$6
	ld a, [hl]
	ld [wc7a2], a
	set_farcall_addrs_hli Func_93941
	ld a, $4
	call FarCall
	jp .asm_83e3f

.asm_83e39: ; 83e39 (20:7e39)
	writenpctext TreeBitstreamText_45cff
.asm_83e3f: ; 83e3f (20:7e3f)
	jp .asm_83e48

.asm_83e42: ; 83e42 (20:7e42)
	writenpctext TreeBitstreamText_45cd8
.asm_83e48: ; 83e48 (20:7e48)
	ld hl, $130
	add hl, sp
	ld sp, hl
	ret

Data_83e4e:
	dstr "G(とられた)"

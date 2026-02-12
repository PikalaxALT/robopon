INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 38", ROMX
GFX_e0000: INCBIN "gfx/misc/e0000.w64.t1.2bpp"
Data_e06f0:
	db $01, $02, $03, $10, $10, $04, $05, $06, $10, $10, $10, $07, $02, $0d, $06, $1b, $04, $05, $06, $10, $1e, $58, $42, $0f, $07, $5a, $42, $59, $03, $1b, $1b, $09, $5a, $42, $58, $42, $5a, $43, $42, $08, $1e, $5a, $43, $08, $20, $32, $58, $3a, $3b, $42, $58, $40, $42, $43, $42, $48, $49, $42, $58, $0e, $11, $12, $12, $18, $20, $33, $42, $3c, $3d, $5a, $38, $59, $42, $5a, $4a, $4b, $4c, $4d, $5a, $0e, $04, $05, $06, $10, $20, $42, $59, $3e, $3f, $1d, $16, $1e, $42, $43, $4e, $4f, $50, $51, $43, $0e, $1e, $42, $5a, $03, $09, $58, $42, $42, $13, $10, $07, $42, $5a, $58, $52, $53, $54, $55, $42, $18, $1e, $59, $22, $23, $24, $25, $42, $5a, $0f, $10, $09, $2a, $2b, $2c, $2d, $44, $45, $41, $42, $08, $19, $42, $26, $27, $28, $29, $59, $42, $03, $01, $42, $2e, $2f, $30, $31, $46, $47, $58, $42, $0e, $17, $42, $5a, $42, $5a, $5a, $42, $42, $5a, $42, $5a, $42, $5a, $5a, $59, $5a, $5a, $42, $59, $18, $07, $42, $42, $42, $59, $42, $5a, $13, $11, $5a, $42, $58, $41, $42, $42, $42, $56, $59, $1f, $10, $21, $5a, $42, $58, $39, $58, $42, $08, $10, $11, $40, $34, $35, $58, $42, $56, $57, $56, $1f, $10, $21, $42, $58, $39, $59, $39, $58, $0a, $04, $0c, $59, $36, $37, $38, $42, $57, $59, $57, $1f, $10, $21, $59, $42, $42, $5a, $5a, $42, $13, $11, $42, $42, $5a, $5a, $42, $59, $42, $42, $42, $59, $08, $17, $42, $13, $14, $15, $15, $16, $10, $10, $14, $15, $15, $15, $15, $15, $1c, $42, $59, $42, $18, $10, $0b, $10, $10, $10, $04, $0c, $08, $10, $10, $10, $10, $10, $10, $10, $10, $0b, $0b, $0b, $10, $10, $10, $10, $10, $01, $5a, $43, $0a, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $1e, $58, $5a, $13, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $14, $15, $16, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10

Data_e0858:
	db $01, $02, $03, $10, $10, $04, $05, $06, $10, $10, $10, $07, $02, $0d, $06, $1b, $04, $05, $06, $10, $1e, $6c, $6d, $6d, $6d, $6d, $6c, $6d, $6d, $6d, $6d, $6d, $6c, $6d, $6d, $6d, $6d, $6d, $6c, $08, $1e, $6e, $43, $08, $20, $32, $6e, $3a, $3b, $42, $58, $40, $6e, $43, $42, $48, $49, $42, $6e, $0e, $11, $6e, $12, $18, $20, $33, $6e, $3c, $3d, $6c, $38, $59, $6e, $5a, $4a, $4b, $4c, $4d, $6e, $0e, $04, $6e, $06, $10, $20, $42, $6e, $3e, $3f, $6e, $16, $1e, $6e, $43, $4e, $4f, $50, $51, $6c, $0e, $1e, $6c, $6d, $6d, $6d, $6d, $6e, $6d, $6d, $6d, $6d, $6d, $6c, $58, $52, $53, $54, $55, $6e, $18, $1e, $6e, $22, $23, $24, $25, $6e, $5a, $0f, $6e, $09, $2a, $2b, $2c, $2d, $44, $45, $41, $6e, $08, $19, $6e, $26, $27, $28, $29, $6e, $42, $03, $6e, $42, $2e, $2f, $30, $31, $46, $47, $58, $6e, $0e, $17, $6c, $6d, $6d, $6d, $6d, $6c, $6d, $6d, $6c, $6d, $6d, $6d, $6d, $6d, $6d, $6d, $6d, $6c, $18, $07, $6e, $42, $42, $59, $42, $5a, $13, $11, $5a, $42, $58, $41, $42, $42, $42, $56, $59, $6e, $10, $21, $6e, $42, $58, $39, $58, $42, $08, $10, $11, $40, $34, $35, $58, $42, $56, $57, $56, $6e, $10, $21, $6e, $58, $39, $59, $39, $58, $0a, $04, $0c, $59, $36, $37, $38, $42, $57, $59, $57, $6e, $10, $21, $6c, $6d, $6d, $6d, $6c, $6d, $6d, $6d, $6d, $6d, $6c, $6d, $6d, $6c, $6d, $6d, $6d, $6c, $08, $17, $42, $13, $14, $15, $6e, $16, $10, $10, $14, $15, $15, $15, $15, $15, $1c, $42, $59, $42, $18, $10, $0b, $10, $10, $10, $6e, $0c, $08, $10, $10, $10, $10, $10, $10, $10, $10, $0b, $0b, $0b, $10, $10, $10, $10, $10, $01, $6e, $43, $0a, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $1e, $6c, $42, $13, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $14, $15, $16, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10

GFX_e09c0: INCBIN "gfx/misc/e09c0.2bpp"

Data_e10c0:
	db $5b, $01, $52
	db $5b, $01, $52
	db $5b, $01, $52
	db $02, $03, $52
	db $02, $03, $52
	db $02, $03, $52
	db $04, $05, $52
	db $04, $05, $52
	db $04, $05, $52

	db $20, $21, $5d
	db $20, $21, $5d
	db $20, $21, $5d
	db $22, $23, $5d
	db $22, $23, $5d
	db $22, $23, $5d
	db $24, $25, $5d
	db $24, $25, $5d
	db $24, $25, $5d

	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a
	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a
	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a

	db $06, $07, $52
	db $06, $07, $52
	db $06, $07, $52
	db $08, $09, $0a
	db $08, $09, $0a
	db $08, $09, $0a
	db $0b, $0c, $0d
	db $0b, $0c, $0d
	db $0b, $0c, $0d

	db $26, $27, $5d
	db $26, $27, $5d
	db $26, $27, $5d
	db $28, $29, $2a
	db $28, $29, $2a
	db $28, $29, $2a
	db $2b, $2c, $2d
	db $2b, $2c, $2d
	db $2b, $2c, $2d

	db $6e, $1e, $4d
	db $64, $67, $68
	db $6e, $1e, $4e
	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a
	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a

	db $0e, $0f, $52
	db $0e, $0f, $52
	db $0e, $0f, $52
	db $50, $51, $52
	db $40, $41, $52
	db $42, $43, $52
	db $10, $11, $52
	db $10, $11, $52
	db $10, $11, $52

	db $2e, $2f, $5d
	db $2e, $2f, $5d
	db $2e, $2f, $5d
	db $6b, $6c, $6d
	db $60, $61, $5d
	db $62, $63, $5d
	db $30, $31, $5d
	db $30, $31, $5d
	db $30, $31, $5d

	db $49, $4a, $46
	db $4b, $4c, $46
	db $6e, $4f, $46
	db $6e, $1e, $6f
	db $6e, $1e, $6f
	db $6e, $1e, $6f
	db $64, $65, $66
	db $64, $67, $68
	db $64, $69, $6a

	db $12, $13, $52
	db $12, $13, $52
	db $12, $13, $52
	db $17, $18, $52
	db $1b, $1c, $52
	db $19, $1a, $52
	db $14, $15, $52
	db $14, $15, $52
	db $14, $15, $52

	db $32, $33, $5d
	db $32, $33, $5d
	db $32, $33, $5d
	db $37, $38, $5d
	db $3b, $3c, $5d
	db $39, $3a, $5d
	db $34, $35, $5d
	db $34, $35, $5d
	db $34, $35, $5d

	db $6e, $1e, $1f
	db $6e, $3e, $3f
	db $6e, $5e, $5f
	db $57, $58, $1f
	db $57, $58, $3f
	db $59, $5a, $5f
	db $49, $4a, $46
	db $47, $48, $46
	db $44, $45, $46

	db $50, $51, $52
	db $00, $16, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00

	db $53, $54, $55
	db $00, $36, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00

	db $6e, $1e, $6f
	db $00, $56, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00

Data_e1255: ; e1255
	bigdw 1
	bigdw 2

Data_e1259: ; e1259
	db $5f, $52, $71, $52, $00, $00, $b5, $b2, $d7, $28, $a6, $20, $d0, $c2, $b9, $d9, $20, $c5, $dd, $bb, $de, $b1, $29, $00, $28, $c3, $b4, $bc, $c0, $20, $d4, $db, $b0, $c0, $de, $21, $29, $00

Data_e127f: ; e127f
	db $85, $52, $8f, $52, $00, $00, $28, $c3, $d4, $dd, $c3, $de, $b2, $21, $29, $00, $28, $d3, $af, $c3, $b9, $29, $20, $c4, $de, $db, $ce, $de, $b3, $21, $00

Data_e129e: ; e129e
	db $a4, $52, $ae, $52, $00, $00, $28, $ba, $da, $c3, $de, $b2, $b2, $29, $3f, $00, $00

Data_e12af: ; e12af
	db $b3, $52, $00, $00, $29, $ca, $df, $c8, $d9, $28, $a6, $ca, $d2, $c3, $c8, $29, $00

Data_e12c0: ; e12c0
	db $20, $53, $00, $00, $34, $53, $00, $00, $48, $53, $00, $00, $5c, $53, $00, $00, $71, $53, $00, $00, $86, $53, $00, $00, $9b, $53, $00, $00, $ac, $53, $00, $00, $bd, $53, $00, $00, $ce, $53, $00, $00, $e3, $53, $00, $00, $f6, $53, $00, $00, $0a, $54, $00, $00, $22, $54, $00, $00, $3a, $54, $00, $00, $52, $54, $00, $00, $69, $54, $00, $00, $80, $54, $00, $00, $97, $54, $00, $00, $b2, $54, $00, $00, $cd, $54, $00, $00, $df, $54, $00, $00, $f0, $54, $00, $00, $02, $55, $00, $00, $28, $ba, $b3, $b9, $de, $b7, $d8, $ae, $b8, $20, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $28, $ba, $b3, $b9, $de, $b7, $d8, $ae, $b8, $20, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $28, $ba, $b3, $b9, $de, $b7, $d8, $ae, $b8, $20, $c1, $ae, $af, $c4, $29, $c0, $de, $b3, $dd, $00, $28, $ce, $de, $b3, $b7, $de, $ae, $d8, $ae, $b8, $20, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $28, $ce, $de, $b3, $b7, $de, $ae, $d8, $ae, $b8, $20, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $28, $ce, $de, $b3, $b7, $de, $ae, $d8, $ae, $b8, $20, $c1, $ae, $af, $c4, $29, $c0, $de, $b3, $dd, $00, $28, $bd, $ca, $de, $d4, $bb, $20, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $28, $bd, $ca, $de, $d4, $bb, $20, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $28, $bd, $ca, $de, $d4, $bb, $20, $c1, $ae, $af, $c4, $29, $c0, $de, $b3, $dd, $00, $28, $b6, $b8, $c4, $b8, $29, $b4, $c8, $28, $c0, $de, $cf, $29, $20, $b5, $b0, $d9, $35, $ba, $29, $00, $28, $b6, $b8, $c4, $b8, $29, $b4, $c8, $28, $c0, $de, $cf, $20, $32, $ca, $de, $b2, $29, $00, $28, $b6, $b8, $c4, $b8, $29, $b4, $c8, $28, $c0, $de, $cf, $20, $31, $ba, $c0, $de, $b9, $29, $00, $28, $b6, $b8, $c4, $b8, $29, $ba, $de, $b0, $d9, $c4, $de, $20, $28, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $28, $b6, $b8, $c4, $b8, $29, $ba, $de, $b0, $d9, $c4, $de, $20, $28, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $28, $b6, $b8, $c4, $b8, $29, $ba, $de, $b0, $d9, $c4, $de, $20, $28, $c1, $ae, $af, $c4, $29, $c0, $de, $b3, $dd, $00, $28, $b6, $b8, $c4, $b8, $b9, $b2, $b9, $dd, $c1, $29, $20, $28, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $28, $b6, $b8, $c4, $b8, $b9, $b2, $b9, $dd, $c1, $29, $20, $28, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $28, $b6, $b8, $c4, $b8, $b9, $b2, $b9, $dd, $c1, $29, $20, $28, $c1, $ae, $af, $c4, $29, $c0, $de, $b3, $dd, $00, $db, $ce, $de, $ce, $df, $dd, $28, $bf, $b3, $b8, $de, $b3, $d8, $c2, $29, $20, $28, $c1, $ae, $af, $c4, $29, $b1, $af, $cc, $df, $00, $db, $ce, $de, $ce, $df, $dd, $28, $bf, $b3, $b8, $de, $b3, $d8, $c2, $29, $20, $28, $bd, $ba, $de, $b8, $29, $b1, $af, $cc, $df, $00, $db, $ce, $de, $ce, $df, $dd, $28, $c6, $bf, $b3, $b8, $de, $b3, $bc, $c5, $b2, $29, $00, $28, $b5, $d0, $be, $20, $b5, $b5, $d4, $bd, $b3, $d8, $29, $20, $c0, $b2, $d1, $00, $28, $ba, $dd, $c5, $29, $ca, $df, $c8, $d9, $28, $ca, $b1, $d8, $cf, $be, $dd, $29, $00, $28, $b5, $d0, $be, $20, $ce, $de, $af, $c0, $b8, $d8, $29, $20, $c0, $b2, $d1, $00

Func_e1513:: ; e1513 (38:5513)
	ld hl, -$86
	add hl, sp
	ld sp, hl
	push bc
	push de
	push af
	ld hl, $81
	add hl, sp
	reg16swap de, hl
	ld hl, Data_e1255
	ld bc, $4
	call MemCopy
	ld hl, sp+$7b
	reg16swap de, hl
	ld hl, Data_e1259
	ld bc, $6
	call MemCopy
	ld hl, sp+$75
	reg16swap de, hl
	ld hl, Data_e127f
	ld bc, $6
	call MemCopy
	ld hl, sp+$6f
	reg16swap de, hl
	ld hl, Data_e129e
	ld bc, $6
	call MemCopy
	ld hl, sp+$6b
	reg16swap de, hl
	ld hl, Data_e12af
	ld bc, $4
	call MemCopy
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, Data_e12c0
	ld bc, $60
	call MemCopy
	ld hl, sp+$9
	ld [hl], $0
	ld hl, sp+$a
	ld [hl], $0
	pop af
	ld hl, sp+$4
	ld [hl], a
	pop de
	ld hl, sp+$3
	ld [hl], e
	pop bc
	ld hl, sp+$2
	ld [hl], c
	callba_hli Func_b6f2
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_d9f74
	ld hl, sp+$3
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	callba_hli AllocateMonsterStruct
	set_farcall_addrs_hli Func_dc0a
	ld e, $bb
	xor a
	call FarCall
	ld c, $6
	push bc
	ld a, $2
	push af
	set_farcall_addrs_hli Func_7c8a
	pop af
	pop bc
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, c
	ld l, a
	ld c, $2
	call FarCall
	callba_hli FreeMonsterStruct
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	check_cgb
	jp z, Func_e164a
	callba_hli Func_b65f
Func_e164a: ; e164a (38:564a)
	ld e, $0
	ld hl, sp+$75
	call Func_e1d9c
	ld e, $0
	ld hl, sp+$6f
	call Func_e1d9c
	set_farcall_addrs_hli LoadEmote
	ld c, $0
	ld e, $f
	ld a, $21
	call FarCall
	ld a, $1
Func_e166e: ; e166e (38:566e)
	cp $4
	jp nc, Func_e1685
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_e166e

Func_e1685: ; e1685 (38:5685)
	xor a
	ld hl, $81
	add hl, sp
	ld [hl], $0
	ld e, $ff
Func_e168e: ; e168e (38:568e)
	push de
	call NextOverworldFrame
	call CheckButton
	ld l, a
	pop de
	push hl
	ld hl, $83
	add hl, sp
	ld a, [hl]
	cp e
	jp z, Func_e1733
	ld c, $1
Func_e16a3: ; e16a3 (38:56a3)
	ld a, c
	cp $4
	jp nc, Func_e172e
	ld hl, $83
	add hl, sp
	ld a, [hl]
	inc a
	cp c
	jp nz, Func_e171c
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	jp Func_e172a

Func_e171c: ; e171c (38:571c)
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
Func_e172a: ; e172a (38:572a)
	inc c
	jp Func_e16a3

Func_e172e: ; e172e (38:572e)
	ld hl, $83
	add hl, sp
	ld e, [hl]
Func_e1733: ; e1733 (38:5733)
	push de
	set_farcall_addrs_hli PlayMoveAnimScript
	ld a, $1
	call FarCall
	callba_hli QueueMoveAnimScriptGFXUpdate
	pop de
	pop hl
	ld a, l
	and $2
	jp z, Func_e1772
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $1
	jp c, Func_e176f
	ld hl, $81
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e176f: ; e176f (38:576f)
	jp Func_e179c

Func_e1772: ; e1772 (38:5772)
	ld a, l
	and $1
	jp z, Func_e1790
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $2
	jp nc, Func_e178d
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e178d: ; e178d (38:578d)
	jp Func_e179c

Func_e1790: ; e1790 (38:5790)
	ld a, l
	and $10
	jp z, Func_e179c
	call NextOverworldFrame
	jp Func_e179f

Func_e179c: ; e179c (38:579c)
	jp Func_e168e

Func_e179f: ; e179f (38:579f)
	ld hl, $81
	add hl, sp
	ld a, [hl]
	ld hl, $80
	add hl, sp
	ld [hl], a
	callba_hli Func_9a87c
	callba_hli Func_b6f2
	call FillVisibleAreaWithBlankTile
	ld a, $38
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e09c0
	ld hl, $8900
	call FarRequestVideoData
	ld hl, $83
	add hl, sp
	ld [hl], $0
	ld hl, $82
	add hl, sp
	ld [hl], $17
	ld l, $0
	push hl
	ld a, $c
	push af
	set_farcall_addrs_hli LoadSpriteGFX
	pop af
	pop hl
	ld c, a
	ld e, l
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld hl, $82
	add hl, sp
	ld l, [hl]
	ld h, a
	call FarCall
	callba_hli Func_b65f
	call FillVisibleAreaWithBlankTile
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld c, [hl]
	ld e, $6
	ld a, $9
	call Func_e1bb4
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$5
	add hl, de
	ld e, $0
	call Func_e1d9c
	call FillVisibleAreaWithBlankTile
	call Func_e1c97
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_e1864: ; e1864 (38:5864)
	ld e, $0
	ld hl, sp+$65
	call Func_e1d9c
	ld hl, $81
	add hl, sp
	ld [hl], $0
	ld e, $0
Func_e1873: ; e1873 (38:5873)
	push de
	call NextOverworldFrame
	call CheckButton
	ld l, a
	pop de
	ld a, l
	and $4
	jp z, Func_e189b
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $6
	jp c, Func_e1898
	ld hl, $81
	add hl, sp
	ld a, [hl]
	add $fa
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e1898: ; e1898 (38:5898)
	jp Func_e1981

Func_e189b: ; e189b (38:589b)
	ld a, l
	and $8
	jp z, Func_e18ba
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $6
	jp nc, Func_e18b7
	ld hl, $81
	add hl, sp
	ld a, [hl]
	add $6
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18b7: ; e18b7 (38:58b7)
	jp Func_e1981

Func_e18ba: ; e18ba (38:58ba)
	ld a, l
	and $2
	jp z, Func_e18d8
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $1
	jp c, Func_e18d5
	ld hl, $81
	add hl, sp
	ld a, [hl]
	dec a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18d5: ; e18d5 (38:58d5)
	jp Func_e1981

Func_e18d8: ; e18d8 (38:58d8)
	ld a, l
	and $1
	jp z, Func_e18f6
	ld hl, $81
	add hl, sp
	ld a, [hl]
	cp $b
	jp nc, Func_e18f3
	ld hl, $81
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $81
	add hl, sp
	ld [hl], a
Func_e18f3: ; e18f3 (38:58f3)
	jp Func_e1981

Func_e18f6: ; e18f6 (38:58f6)
	ld a, l
	and $10
	jp z, Func_e1981
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld e, [hl]
	ld hl, sp+$7f
	ld [hl], e
	ld hl, $80
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld [hl], a
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $ff
	jp z, Func_e197e
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld l, [hl]
	push hl
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, $85
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	pop bc
	call Func_e1bb4
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
Func_e197e: ; e197e (38:597e)
	jp Func_e1a0b

Func_e1981: ; e1981 (38:5981)
	push de
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	add a
	add a
	add a
	add $c
	ld hl, $87
	add hl, sp
	ld [hl], a
	ld hl, $83
	add hl, sp
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	add a
	add a
	add a
	add $10
	ld hl, $86
	add hl, sp
	ld [hl], a
	set_farcall_addrs_hli UpdateCurSprite
	pop de
	push de
	ld l, e
	ld h, $0
	ld b, $4
	call RightShiftHL
	reg16swap de, hl
	ld hl, sp+$7d
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, $86
	add hl, sp
	ld e, [hl]
	ld hl, $87
	add hl, sp
	ld h, [hl]
	ld d, h
	xor a
	call FarCall
	pop de
	inc e
	ld a, e
	and $3f
	ld e, a
	push de
	callba_hli QueueMoveAnimScriptGFXUpdate
	pop de
	jp Func_e1873

Func_e1a0b: ; e1a0b (38:5a0b)
	callba_hli Func_da4dc
	callba_hli QueueMoveAnimScriptGFXUpdate
	ld e, $1
	ld hl, sp+$69
	call Func_e1d9c
	callba_hli Func_1482e
	ld a, l
	or h
	jp nz, Func_e1a44
	jp Func_e1a65

Func_e1a44: ; e1a44 (38:5a44)
	ld hl, sp+$7f
	ld a, [hl]
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld [hl], a
	call Func_e1c97
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	jp Func_e1864

Func_e1a65: ; e1a65 (38:5a65)
	ld hl, $81
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $14
	jp z, Func_e1a80
	cp $13
	jp z, Func_e1a80
	cp $12
	jp nz, Func_e1a91
Func_e1a80: ; e1a80 (38:5a80)
	set_farcall_addrs_hli Func_b785
	ld a, [wc782]
	call FarCall
Func_e1a91: ; e1a91 (38:5a91)
	call Func_e1aa9
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld hl, $86
	add hl, sp
	ld sp, hl
	ret

Func_e1aa9:: ; e1aa9 (38:5aa9)
	push bc
	push bc
	push bc
	push bc
	callba_hli Func_9336a
	reg16swap de, hl
	push de
	ld bc, $8
	ld e, $0
	ld hl, sp+$2
	call FillMemory
	ld bc, $5
	push bc
	set_farcall_addrs_hli Func_935a8
	pop bc
	push bc
	ld hl, sp+$4
	reg16swap de, hl
	ld l, c
	ld h, b
	call FarCall
	set_farcall_addrs_hli Func_935a8
	pop bc
	ld hl, sp+$2
	reg16swap de, hl
	ld l, c
	ld h, b
	inc hl
	call FarCall
	ld l, $0
	pop de
Func_e1b01: ; e1b01 (38:5b01)
	ld a, l
	cp $c
	jp nc, Func_e1baf
	push de
	ld bc, $ff
	push hl
	ld e, l
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $15
	jp z, Func_e1b24
	cp $14
	jp nz, Func_e1b27
	ld bc, $5
	jp Func_e1b27

Func_e1b24: ; e1b24 (38:5b24)
	ld bc, $6
Func_e1b27: ; e1b27 (38:5b27)
	pop hl
	pop de
	push hl
	ld a, c
	inc a
	or b
	jp z, Func_e1baa
	push bc
	push de
	ld h, $0
	ld de, $78
	call MultiplyHLbyDE
	reg16swap de, hl
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	ld l, e
	ld h, d
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$7
	ld [hl], c
	ld e, d
	ld d, $0
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$8
	ld [hl], e
	pop de
	push de
	ld a, e
	and $f
	ld e, a
	ld d, $0
	ld hl, sp+$9
	ld [hl], e
	pop de
	push de
	reg16swap de, hl
	ld b, $4
	call RightShiftHL
	ld a, l
	and $f
	ld c, a
	ld b, $0
	ld hl, sp+$a
	ld [hl], c
	ld hl, sp+$b
	ld [hl], $9
	ld hl, sp+$c
	ld [hl], $1
	ld hl, sp+$d
	ld [hl], $1
	set_farcall_addrs_hli Func_935a8
	pop de
	pop bc
	push de
	ld hl, sp+$4
	reg16swap de, hl
	ld l, c
	ld h, b
	call FarCall
	pop de
Func_e1baa: ; e1baa (38:5baa)
	pop hl
	inc l
	jp Func_e1b01

Func_e1baf: ; e1baf (38:5baf)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e1bb4: ; e1bb4 (38:5bb4)
	push af
	push de
	push bc
	push bc
	push bc
	push bc
	push bc
	ld a, c
	ld b, $9
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	ld hl, sp+$6
	ld [hl], a
	pop bc
	push bc
	ld a, c
	ld b, $9
	call DivideAbyB
	ld d, a
	add a
	add d
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$8
	ld [hl], $0
	pop bc
Func_e1bdb: ; e1bdb (38:5bdb)
	ld hl, sp+$6
	ld a, [hl]
	cp $3
	jp nc, Func_e1c94
	push bc
	ld a, BANK(Data_e10c0)
	ld [wFarCallDestBank], a
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld de, 27
	call MultiplyHLbyDE
	ld de, Data_e10c0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld bc, $3
	call FarCopyVideoData
	ld hl, sp+$7
	ld [hl], $0
	pop bc
Func_e1c19: ; e1c19 (38:5c19)
	ld hl, sp+$5
	ld a, [hl]
	cp $3
	jp nc, Func_e1c8a
	ld a, c
	cp $2c
	jp nz, Func_e1c50
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	pop de
	add hl, de
	ld [hl], $8f
	jp Func_e1c80

Func_e1c50: ; e1c50 (38:5c50)
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$0
	add hl, de
	ld a, [hl]
	add $90
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	add hl, de
	push hl
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	pop de
	add hl, de
	ld [hl], a
Func_e1c80: ; e1c80 (38:5c80)
	ld hl, sp+$5
	ld a, [hl]
	inc a
	ld hl, sp+$5
	ld [hl], a
	jp Func_e1c19

Func_e1c8a: ; e1c8a (38:5c8a)
	ld hl, sp+$6
	ld a, [hl]
	inc a
	ld hl, sp+$6
	ld [hl], a
	jp Func_e1bdb

Func_e1c94: ; e1c94 (38:5c94)
	add sp, $c
	ret

Func_e1c97: ; e1c97 (38:5c97)
	push bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ld e, $2
	xor a
	call SetStringStartState
	ld hl, Data_e1d74
	push hl
	call PlaceString
	pop bc
	ld e, $8
	xor a
	call SetStringStartState
	ld hl, Data_e1d88
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$0
	ld [hl], $0
Func_e1cc4: ; e1cc4 (38:5cc4)
	ld hl, sp+$0
	ld a, [hl]
	cp $c
	jp nc, Func_e1d72
	ld hl, sp+$0
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	add $3
	ld c, a
	push bc
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $2
	pop bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], $90
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld a, [hl]
	cp $18
	jp c, Func_e1d10
	ld a, $ff
Func_e1d10: ; e1d10 (38:5d10)
	cp $ff
	jp z, Func_e1d45
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, wc7b1
	add hl, de
	ld l, [hl]
	push hl
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, sp+$4
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	pop bc
	call Func_e1bb4
	jp Func_e1d68

Func_e1d45: ; e1d45 (38:5d45)
	ld hl, sp+$0
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	add a
	ld d, a
	add a
	add d
	add $3
	ld l, a
	push hl
	ld hl, sp+$2
	ld a, [hl]
	ld b, $6
	call DivideAbyB
	ld a, b
	ld d, a
	add a
	add d
	inc a
	pop de
	ld c, $2c
	call Func_e1bb4
Func_e1d68: ; e1d68 (38:5d68)
	ld hl, sp+$0
	ld a, [hl]
	inc a
	ld hl, sp+$0
	ld [hl], a
	jp Func_e1cc4

Func_e1d72: ; e1d72 (38:5d72)
	pop bc
	ret

Data_e1d74:
	dstr "(  0  2  4  6  8 10"

Data_e1d88:
	dstr "( 12 14 16 18 20 22"

Func_e1d9c: ; e1d9c (38:5d9c)
	push hl
	ld hl, -$d2
	add hl, sp
	ld sp, hl
	push de
	ld c, $0
Func_e1da5: ; e1da5 (38:5da5)
	ld a, c
	cp $5
	jp nc, Func_e1e28
	read_hl_from_sp_plus $d6
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_e1e0e
	push bc
	read_hl_from_sp_plus $d8
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	add hl, de
	pop de
	call CopyUntilNull
	pop bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $cc
	add hl, sp
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_e1e24

Func_e1e0e: ; e1e0e (38:5e0e)
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, $ca
	add hl, sp
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_e1e28

Func_e1e24: ; e1e24 (38:5e24)
	inc c
	jp Func_e1da5

Func_e1e28: ; e1e28 (38:5e28)
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	pop de
	inc e
	dec e
	jp nz, Func_e1e61
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, $c8
	add hl, sp
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	jp Func_e1e7d

Func_e1e61: ; e1e61 (38:5e61)
	set_farcall_addrs_hli PrintMapText
	ld bc, $880
	ld hl, $c8
	add hl, sp
	reg16swap de, hl
	ld hl, $10e
	call FarCall
Func_e1e7d: ; e1e7d (38:5e7d)
	ld hl, $d4
	add hl, sp
	ld sp, hl
	ret

Func_e1e83:: ; e1e83 (38:5e83)
	call FillVisibleAreaWithBlankTile
	ld a, BANK(GFX_e09c0)
	ld [wFarCallDestBank], a
	ld bc, $700
	ld de, GFX_e09c0
	ld hl, $8900
	call FarRequestVideoData
	call Func_e1c97
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld e, $e
	ld a, $1
	call SetStringStartState
	ld hl, Data_e1eeb
	push hl
	call PlaceString
	pop bc
	ld e, $10
	ld a, $1
	call SetStringStartState
	ld hl, Data_e1ef9
	push hl
	call PlaceString
	pop bc
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	callba_hli Func_ac37
	call Func_3af6
	ret

Data_e1eeb:
	dstr "()スケシﾞュールハﾟネル"

Data_e1ef9:
	dstr "(せっていしﾞょうきょう)"

Func_e1f07: ; e1f07 (38:5f07)
	push af
	ldh a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, Func_e1f26
	ld a, l
	and $7f
	call FarCall
	jp Func_e1f2c

Func_e1f26: ; e1f26 (38:5f26)
	ld a, l
	or $80
	call FarCall
Func_e1f2c: ; e1f2c (38:5f2c)
	ret

Func_e1f2d:: ; e1f2d (38:5f2d)
	push af
	push bc
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, sp+$2
	ld a, [wSaveScratchca6c]
	ld [hl], a
	ld hl, sp+$3
	ld [hl], $0
	ld c, $0
Func_e1f43: ; e1f43 (38:5f43)
	ld a, c
	ld hl, sp+$2
	cp [hl]
	jp nc, Func_e1f70
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItems
	add hl, de
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nz, Func_e1f6c
	ld e, c
	ld d, $0
	ld hl, wSaveScratchBagItemQuantities
	add hl, de
	ld a, [hl]
	cp $1
	jp c, Func_e1f6c
	ld hl, sp+$3
	ld [hl], $1
	jp Func_e1f70

Func_e1f6c: ; e1f6c (38:5f6c)
	inc c
	jp Func_e1f43

Func_e1f70: ; e1f70 (38:5f70)
	pop af
	call GetSRAMBank
	ld hl, sp+$1
	ld a, [hl]
	pop bc
	pop bc
	ret

INCLUDE "maps/world_map.asm"

Func_e262f: ; e262f (38:662f)
	push af
	set_farcall_addrs_hli Func_17e95
	ld c, $3
	ld e, $a
	ld hl, $a0f
	call FarCall
	ld e, $10
	ld a, $b
	call SetStringStartState
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $1c
	call FarCall
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	cp $f
	jp nz, Func_e2677
	ld a, e
	cp $1
	jp nz, Func_e2677
	ld hl, Data_e26ce
	push hl
	call PlaceString
	pop bc
	jp Func_e26cc

Func_e2677: ; e2677 (38:6677)
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $35
	call FarCall
	ld e, a
	push de
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $23
	call FarCall
	ld c, a
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $d
	jp nz, Func_e26ba
.asm_e26a5
	inc e
	dec e
	jp z, Func_e26ba
	inc c
	dec c
	jp nz, Func_e26ba
	ld hl, Data_e26d7
	push hl
	call PlaceString
	pop bc
	jp Func_e26cc

Func_e26ba: ; e26ba (38:66ba)
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_e1ff2 - 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call PlaceString
	pop bc
Func_e26cc: ; e26cc (38:66cc)
	pop bc
	ret

Data_e26ce:
	dstr "セﾞロキャッスル"

Data_e26d7:
	dstr "セﾞロ(のしろ)"

Func_e26e0::
	push hl
	push bc
	ld hl, sp+$0
	ld a, [wc7e2]
	ld [hl], a
	set_farcall_addrs_hli CheckEventFlag
	ld hl, sp+$0
	ld a, [hl]
	cp $f
	jp nz, Func_e2712
	ld hl, $1c
	call FarCall
	cp $1
	jp nz, Func_e2712
	call GetHLAtSPPlus4
	ld de, Data_e276e
	call CopyUntilNull
	jp Func_e276b

Func_e2712: ; e2712 (38:6712)
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $35
	call FarCall
	ld e, a
	push de
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $23
	call FarCall
	ld c, a
	pop de
	ld hl, sp+$0
	ld a, [hl]
	cp $d
	jp nz, Func_e2756
	inc e
	dec e
	jp z, Func_e2756
	inc c
	dec c
	jp nz, Func_e2756
	call GetHLAtSPPlus4
	ld de, Data_e2777
	call CopyUntilNull
	jp Func_e276b

Func_e2756: ; e2756 (38:6756)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_e1ff2 - 2
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus6
	pop de
	call CopyUntilNull
Func_e276b: ; e276b (38:676b)
	pop bc
	pop bc
	ret

Data_e276e:
	dstr "セﾞロキャッスル"

Data_e2777:
	dstr "セﾞロ(のしろ)"

UnlockArea:: ; e2780
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp nz, _e27a3
	ld hl, sp+$1
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp nz, _e27a3
	set_farcall_addrs_hli Func_93941
	ld a, $1
	call FarCall
_e27a3: ; e27a3 (38:67a3)
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp nz, _e27c5
	ld hl, sp+$1
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp nz, _e27c5
	set_farcall_addrs_hli Func_93941
	ld a, $2
	call FarCall
_e27c5: ; e27c5 (38:67c5)
	ld hl, sp+$1
	ld a, [hl]
	cp $b
	jp nz, _e27e7
	ld hl, sp+$1
	ld a, [hl]
	call CheckUnlockedArea
	or a
	jp nz, _e27e7
	set_farcall_addrs_hli Func_93941
	ld a, $3
	call FarCall
_e27e7: ; e27e7 (38:67e7)
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wUnlockedAreaFlags
	add hl, de
	pop af
	or [hl]
	ld [hl], a
	pop bc
	ret

LockArea:: ; e2807 (38:6807)
	push af
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	cpl
	push af
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wUnlockedAreaFlags
	add hl, de
	pop af
	and [hl]
	ld [hl], a
	pop bc
	ret

CheckUnlockedArea:: ; e2829 (38:6829)
	push af
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wUnlockedAreaFlags
	add hl, de
	ld e, [hl]
	ld hl, sp+$1
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, _e284e
	ld a, $1
	jp _e284f

_e284e: ; e284e (38:684e)
	xor a
_e284f: ; e284f (38:684f)
	pop bc
	ret

Func_e2851:
	push af
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld e, [hl]
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	pop de
	push de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_e1f7a
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	pop de
	ld a, e
	ld hl, sp+$7
	cp [hl]
	jp nc, Func_e289b
	jp Func_e29f1

Func_e289b: ; e289b (38:689b)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	cp [hl]
	jp nc, Func_e28b0
	ld hl, sp+$5
	ld e, [hl]
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$3
	ld [hl], e
Func_e28b0: ; e28b0 (38:68b0)
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	cp [hl]
	jp nc, Func_e28c5
	ld hl, sp+$4
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld hl, sp+$2
	ld [hl], e
Func_e28c5: ; e28c5 (38:68c5)
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	ld [hl], $fc
	ld hl, sp+$3
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	ld [hl], $fc
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	ld [hl], $2
	ld hl, sp+$3
	ld c, [hl]
	ld b, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	ld [hl], $2
	ld hl, sp+$4
	ld a, [hl]
	ld hl, sp+$2
	cp [hl]
	jp nz, Func_e2986
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0
	add hl, de
	add hl, bc
	inc hl
	pop de
	push hl
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 0, wAttrMap
	add hl, de
	add hl, bc
	inc hl
	reg16swap de, hl
	ld c, $1
Func_e2964: ; e2964 (38:6964)
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$5
	sub [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_e2983
	push de
	call GetHLAtSPPlus4
	ld [hl], $fd
	inc hl
	call WriteHLToSPPlus4
	pop de
	ld a, $6
	ld [de], a
	inc de
	inc c
	jp Func_e2964

Func_e2983: ; e2983 (38:6983)
	jp Func_e29f1

Func_e2986: ; e2986 (38:6986)
	ld hl, sp+$5
	ld a, [hl]
	ld hl, sp+$3
	cp [hl]
	jp nz, Func_e29f1
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 1
	add hl, de
	add hl, bc
	pop de
	push hl
	ld hl, sp+$5
	ld c, [hl]
	ld b, $0
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	decoord 0, 1, wAttrMap
	add hl, de
	add hl, bc
	reg16swap de, hl
	ld c, $1
Func_e29c3: ; e29c3 (38:69c3)
	ld hl, sp+$2
	ld a, [hl]
	ld hl, sp+$4
	sub [hl]
	ld l, a
	ld a, c
	cp l
	jp nc, Func_e29f1
	push de
	call GetHLAtSPPlus4
	ld [hl], $fe
	pop de
	push de
	ld a, $6
	ld [de], a
	call GetHLAtSPPlus4
	ld de, $14
	add hl, de
	call WriteHLToSPPlus4
	pop de
	ld hl, $14
	add hl, de
	reg16swap de, hl
	inc c
	jp Func_e29c3

Func_e29f1: ; e29f1 (38:69f1)
	pop bc
	pop bc
	pop bc
	pop bc
	ret

malloc_Bank38:
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	jp FarCall

free_Bank38:
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_e2a17:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_e2a24:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_e2a31:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Data_e2a3e: ; e2a3e
	db $00
	db SFX_34, $ff
	db $ff

Data_e2a42: ; e2a42
	db $00
	db SFX_35, $ff
	db $ff

Data_e2a46: ; e2a46
	db $00
	db SFX_2F, $ff
	db $ff

Data_e2a4a: ; e2a4a
	db $00
	db SFX_36, $ff
	db $ff

Data_e2a4e: ; e2a4e
	db $00
	db SFX_36, $0a
	db SFX_35, $ff
	db $ff

Data_e2a54: ; e2a54
	db $00
	db SFX_36, $ff
	db $ff

Data_e2a58: ; e2a58
	db $00
	db SFX_34, $ff
	db $ff

Data_e2a5c: ; e2a5c
	db $00
	db SFX_34, $ff
	db $ff

Data_e2a60: ; e2a60
	db $00
	db SFX_37, $ff
	db $ff

Data_e2a64: ; e2a64
	db $00
	db SFX_37, $0a
	db SFX_37, $ff
	db $ff

Data_e2a6a: ; e2a6a
	db $00
	db SFX_39, $ff
	db $ff

Data_e2a6e: ; e2a6e
	db $00
	db SFX_3A, $ff
	db $ff

Data_e2a72: ; e2a72
	db $00
	db SFX_3B, $ff
	db $ff

Data_e2a76: ; e2a76
	db $00
	db SFX_3C, $ff
	db $ff

Data_e2a7a: ; e2a7a
	db $00
	db SFX_56, $ff
	db $ff

Data_e2a7e: ; e2a7e
	db $00
	db SFX_3D, $ff
	db $ff

Data_e2a82: ; e2a82
	db $00
	db SFX_3E, $ff
	db $ff

Data_e2a86: ; e2a86
	db $00
	db SFX_3F, $ff
	db $ff

Data_e2a8a: ; e2a8a
	db $00
	db SFX_40, $ff
	db $ff

Data_e2a8e: ; e2a8e
	db $00
	db SFX_41, $ff
	db $ff

Data_e2a92: ; e2a92
	db $00
	db SFX_42, $ff
	db $ff

Data_e2a96: ; e2a96
	db $00
	db SFX_41, $ff
	db $ff

Data_e2a9a: ; e2a9a
	db $00
	db SFX_42, $ff
	db $ff

Data_e2a9e: ; e2a9e
	db $00
	db SFX_43, $ff
	db $ff

Data_e2aa2: ; e2aa2
	db $00
	db SFX_44, $ff
	db $ff

Data_e2aa6: ; e2aa6
	db $00
	db SFX_44, $ff
	db $ff

Data_e2aaa: ; e2aaa
	db $00
	db SFX_45, $ff
	db $ff

Data_e2aae: ; e2aae
	db $00
	db SFX_46, $ff
	db $ff

Data_e2ab2: ; e2ab2
	db $00
	db SFX_46, $ff
	db $ff

Data_e2ab6: ; e2ab6
	db $00
	db SFX_47, $ff
	db $ff

Data_e2aba: ; e2aba
	db $00
	db SFX_47, $ff
	db $ff

Data_e2abe: ; e2abe
	db $00
	db SFX_47, $ff
	db $ff

Data_e2ac2: ; e2ac2
	db $00
	db SFX_48, $ff
	db $ff

Data_e2ac6: ; e2ac6
	db $00
	db SFX_49, $ff
	db $ff

Data_e2aca: ; e2aca
	db $00
	db SFX_4A, $ff
	db $ff

Data_e2ace: ; e2ace
	db $00
	db SFX_4B, $ff
	db $ff

Data_e2ad2: ; e2ad2
	db $00
	db SFX_4C, $ff
	db $ff

Data_e2ad6: ; e2ad6
	db $00
	db SFX_4D, $ff
	db $ff

Data_e2ada: ; e2ada
	db $00
	db SFX_4D, $ff
	db $ff

Data_e2ade: ; e2ade
	db $00
	db SFX_4F, $ff
	db $ff

Data_e2ae2: ; e2ae2
	db $00
	db SFX_50, $ff
	db $ff

Data_e2ae6: ; e2ae6
	db $00
	db SFX_51, $ff
	db $ff

Data_e2aea: ; e2aea
	db $00
	db SFX_34, $ff
	db $ff

Data_e2aee: ; e2aee
	db $00
	db SFX_35, $ff
	db $ff

Data_e2af2: ; e2af2
	db $00
	db SFX_58, $ff
	db $ff

Data_e2af6: ; e2af6
	db $00
	db SFX_59, $ff
	db $ff

Data_e2afa: ; e2afa
	db $00
	db SFX_53, $ff
	db $ff

Data_e2afe: ; e2afe
	db $00
	db SFX_52, $ff
	db $ff

Data_e2b02: ; e2b02
	db $00
	db SFX_53, $ff
	db $ff

Data_e2b06: ; e2b06
	db $00
	db SFX_54, $ff
	db $ff

Data_e2b0a: ; e2b0a
	db $00
	db SFX_55, $ff
	db $ff

Data_e2b0e: ; e2b0e
	db $00
	db SFX_56, $ff
	db $ff

Data_e2b12: ; e2b12
	db $00
	db SFX_44, $ff
	db $ff

Data_e2b16: ; e2b16
	db $00
	db SFX_57, $ff
	db $ff

Data_e2b1a: ; e2b1a
	db $00
	db SFX_58, $ff
	db $ff

Data_e2b1e: ; e2b1e
	db $00
	db SFX_62, $ff
	db $ff

Data_e2b22: ; e2b22
	db $00
	db SFX_62, $ff
	db $ff

Data_e2b26: ; e2b26
	db $00
	db SFX_62, $ff
	db $ff

Data_e2b2a: ; e2b2a
	db $00
	db SFX_64, $ff
	db $ff

Data_e2b2e: ; e2b2e
	db $00
	db SFX_65, $ff
	db $ff

Data_e2b32: ; e2b32
	db $00
	db SFX_64, $ff
	db $ff

Data_e2b36: ; e2b36
	db $00
	db SFX_65, $ff
	db $ff

Data_e2b3a: ; e2b3a
	db $00
	db SFX_60, $ff
	db $ff

Data_e2b3e: ; e2b3e
	db $00
	db SFX_61, $ff
	db $ff

Data_e2b42: ; e2b42
	db $00
	db SFX_62, $ff
	db $ff

Data_e2b46: ; e2b46
	db $00
	db SFX_63, $ff
	db $ff

Data_e2b4a: ; e2b4a
	db $00
	db SFX_5E, $ff
	db $ff

Data_e2b4e: ; e2b4e
	db $00
	db SFX_5F, $ff
	db $ff

Data_e2b52: ; e2b52
	db $00
	db SFX_63, $ff
	db $ff

Pointers_e2b56:
	dw $0000
	dw Data_e2a3e
	dw Data_e2a42
	dw Data_e2a46
	dw Data_e2a4a
	dw Data_e2a4e
	dw Data_e2a54
	dw Data_e2a58
	dw Data_e2a5c
	dw Data_e2a60
	dw Data_e2a64
	dw Data_e2a6a
	dw Data_e2a6e
	dw Data_e2a72
	dw Data_e2a76
	dw Data_e2a7a
	dw Data_e2a7e
	dw Data_e2a82
	dw Data_e2a86
	dw Data_e2a8a
	dw Data_e2a8e
	dw Data_e2a92
	dw Data_e2a96
	dw Data_e2a9a
	dw Data_e2a9e
	dw Data_e2aa2
	dw Data_e2aa6
	dw Data_e2aaa
	dw Data_e2aae
	dw Data_e2ab2
	dw Data_e2ab6
	dw Data_e2aba
	dw Data_e2abe
	dw Data_e2ac2
	dw Data_e2ac6
	dw Data_e2aca
	dw Data_e2ace
	dw Data_e2ad2
	dw Data_e2ad6
	dw Data_e2ada
	dw Data_e2ade
	dw Data_e2ae2
	dw Data_e2ae6
	dw Data_e2aea
	dw Data_e2aee
	dw Data_e2af2
	dw Data_e2af6
	dw Data_e2afa
	dw Data_e2afe
	dw Data_e2b02
	dw Data_e2b06
	dw Data_e2b0a
	dw Data_e2b0e
	dw Data_e2b12
	dw Data_e2b16
	dw Data_e2b1a
	dw Data_e2b1e
	dw Data_e2b22
	dw Data_e2b26
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw Data_e2b2a
	dw Data_e2b2e
	dw Data_e2b32
	dw Data_e2b36
	dw Data_e2b3a
	dw Data_e2b3e
	dw Data_e2b42
	dw Data_e2b46
	dw Data_e2b4a
	dw Data_e2b4e
	dw Data_e2b52

StartBattleSFXScript:: ; e2bf8 (38:6bf8)
	cp $ff
	jp nz, Func_e2c08
	ld hl, $0
	write_hl_to wCurBattleSFXScriptPointer
	jp Func_e2c28

Func_e2c08: ; e2c08 (38:6c08)
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Pointers_e2b56
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wCurBattleSFXScriptPointer
	read_hl_from wCurBattleSFXScriptPointer
	ld a, [hl]
	inc hl
	write_hl_to wCurBattleSFXScriptPointer
	ld [wCurBattleSFXTimer], a
Func_e2c28: ; e2c28 (38:6c28)
	ret

PlayBattleSFXScript:: ; e2c29 (38:6c29)
	read_hl_from wCurBattleSFXScriptPointer
	ld a, l
	or h
	jp nz, .play_sfx
	xor a
	ret

.play_sfx
	ld a, [wCurBattleSFXTimer]
	or a
	jp nz, .delay_timer
	read_hl_from wCurBattleSFXScriptPointer
	ld a, [hl]
	inc hl
	write_hl_to wCurBattleSFXScriptPointer
	call OverworldPlaySFX
	read_hl_from wCurBattleSFXScriptPointer
	ld a, [hl]
	inc hl
	write_hl_to wCurBattleSFXScriptPointer
	ld [wCurBattleSFXTimer], a
	cp $ff
	jp nz, .delay_timer
	ld hl, $0
	write_hl_to wCurBattleSFXScriptPointer
	xor a
	ret

.delay_timer
	ld a, [wCurBattleSFXTimer]
	dec a
	ld [wCurBattleSFXTimer], a
	ld a, $1
	ret

Data_e2c73:
	db $05, $0a, $0f, $14, $19, $1e, $23, $28, $2d, $32, $23, $37, $05, $3c, $41, $2d, $32, $0a, $32, $3c, $3c

Data_e2c88:
	db $05, $01, $01, $01, $01, $05, $01, $01, $05, $01, $05, $01, $01, $05, $05, $01, $05, $01, $01, $05, $01, $01, $05, $01, $01, $01, $05, $05, $05, $01, $05, $05, $01, $01, $05, $01, $01, $05, $01, $05, $01, $01, $01, $05, $01, $01, $01, $05, $05, $01, $01, $01, $05, $01, $01, $05, $01, $01, $05, $01, $01, $05, $01

Func_e2cc7:: ; e2cc7
	ld hl, -$90
	add hl, sp
	ld sp, hl
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2cd2: ; e2cd2 (38:6cd2)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2e0c
	set_farcall_addrs_hli GetRobotFromWarehouse
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	reg16swap de, hl
	call FarCall
	read_hl_from_sp_plus $10
	write_hl_to_sp_plus $e
	read_hl_from_sp_plus $14
	write_hl_to_sp_plus $12
	ld hl, sp+$16
	ld [hl], $0
	set_farcall_addrs_hli Func_7db0
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, wc383
	add hl, de
	ld a, [hl]
	ld hl, sp+$0
	reg16swap de, hl
	call FarCall
	ld hl, sp+$7
	ld c, [hl]
	ld b, $0
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	read_hl_from_sp_plus $e
	push hl
	ld hl, $90
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$6e
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$0
	ld a, [hl]
	ld e, a
	dec e
	ld hl, sp+$23
	call GetRobotBaseStats
	ld hl, sp+$28
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $8
	jp nc, Func_e2da9
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $0
	jp Func_e2dec

Func_e2da9: ; e2da9 (38:6da9)
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $8
	jp c, Func_e2dde
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld a, [hl]
	cp $b
	jp nc, Func_e2dde
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $1
	jp Func_e2dec

Func_e2dde: ; e2dde (38:6dde)
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld [hl], $2
Func_e2dec: ; e2dec (38:6dec)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2cd2

Func_e2e0c: ; e2e0c (38:6e0c)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2e12: ; e2e12 (38:6e12)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2e73
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	sub c
	ld c, a
	ld a, d
	sbc b
	ld b, a
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$74
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2e12

Func_e2e73: ; e2e73 (38:6e73)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2e79: ; e2e79 (38:6e79)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e2f60
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $8a
	add hl, sp
	add hl, de
	ld c, [hl]
	ld b, $0
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_e2c88
	add hl, de
	add hl, bc
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, $90
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$76
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, $92
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$70
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	ld de, $a
	call DivideHLByDESigned
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld l, [hl]
	ld h, $0
	ld a, c
	sub l
	ld l, a
	ld a, b
	sbc h
	ld h, a
	pop de
	add hl, de
	ld c, l
	ld b, h
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc d
	dec d
	bit 7, d
	jr z, .asm_e2f52
	ld hl, $8e
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld de, $1
	ld [hl], e
	inc hl
	ld [hl], d
.asm_e2f52
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2e79

Func_e2f60: ; e2f60 (38:6f60)
	ld hl, $8e
	add hl, sp
	ld [hl], $0
Func_e2f66: ; e2f66 (38:6f66)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e3010
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $85
	add hl, sp
	ld [hl], a
Func_e2f7b: ; e2f7b (38:6f7b)
	ld hl, $85
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_e3002
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	call CompareHLtoBC
	jp nc, Func_e2ff4
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld c, [hl]
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld a, [hl]
	ld hl, $8e
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], a
	ld hl, $85
	add hl, sp
	ld e, [hl]
	ld d, $0
	ld hl, $86
	add hl, sp
	add hl, de
	ld [hl], c
Func_e2ff4: ; e2ff4 (38:6ff4)
	ld hl, $85
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $85
	add hl, sp
	ld [hl], a
	jp Func_e2f7b

Func_e3002: ; e3002 (38:7002)
	ld hl, $8e
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $8e
	add hl, sp
	ld [hl], a
	jp Func_e2f66

Func_e3010: ; e3010 (38:7010)
	ld hl, $86
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$62
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	write_hl_to_sp_plus $5c
	read_hl_from_sp_plus $5c
	push hl
	ld hl, $89
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $5e
	read_hl_from_sp_plus $5e
	push hl
	ld hl, $8a
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $60
	read_hl_from_sp_plus $60
	push hl
	ld hl, $8b
	add hl, sp
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$64
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, -10
	add hl, de
	pop de
	add hl, de
	write_hl_to_sp_plus $62
	read_hl_from_sp_plus $62
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $54
	read_hl_from_sp_plus $54
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $56
	read_hl_from_sp_plus $56
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $58
	read_hl_from_sp_plus $58
	ld de, $a
	add hl, de
	write_hl_to_sp_plus $5a
	ld hl, wTimeSetMonthsTensDigit
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wTimeSetMonthsOnesDigit]
	ld e, a
	ld d, $0
	add hl, de
	ld de, $3c
	call MultiplyHLbyDE
	ld c, l
	ld b, h
	ld hl, wTimeSetDaysTensDigit
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wTimeSetDaysOnesDigit]
	ld e, a
	ld d, $0
	add hl, de
	add hl, bc
	write_hl_to_sp_plus $6c
	read_hl_from_sp_plus $6c
	push hl
	read_hl_from_sp_plus $5c
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, Func_e31aa
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $a
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $b
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $c
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $d
	add hl, de
	ld [hl], $1
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $0
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], $0
	jp Func_e31b8

Func_e31aa: ; e31aa (38:71aa)
	read_hl_from_sp_plus $6c
	call Func_e330f
	or a
	jp nz, Func_e31b8
	call Func_e3379
Func_e31b8: ; e31b8 (38:71b8)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $d
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_e3222
	read_hl_from_sp_plus $6c
	ld de, $a
	call DivideHLByDESigned
	push hl
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $11
	add hl, de
	ld e, [hl]
	ld d, $0
	ld hl, Data_e2c73
	add hl, de
	ld l, [hl]
	ld h, $0
	add hl, hl
	pop de
	call MultiplyHLbyDE
	ld de, $4
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $12
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
Func_e3222: ; e3222 (38:7222)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $9
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e3309
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$7c
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$7d
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$7e
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$7f
	ld [hl], e
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, $80
	add hl, sp
	ld [hl], e
	ld hl, $81
	add hl, sp
	ld a, [wc387]
	add $2
	ld [hl], a
	ld hl, $82
	add hl, sp
	ld [hl], $c
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [wOptions]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	and $2 ; stereo
	jp z, Func_e32ed
	ld hl, $83
	add hl, sp
	ld [hl], $0
	jp Func_e32f3

Func_e32ed: ; e32ed (38:72ed)
	ld hl, $83
	add hl, sp
	ld [hl], $1
Func_e32f3: ; e32f3 (38:72f3)
	ld hl, $84
	add hl, sp
	ld [hl], $0
	set_farcall_addrs_hli Func_9342a
	ld hl, sp+$7c
	call FarCall
Func_e3309: ; e3309 (38:7309)
	ld hl, $90
	add hl, sp
	ld sp, hl
	ret

Func_e330f: ; e330f (38:730f)
	ld de, $3c
	call DivideHLByDESigned
	ld de, $14
	call CompareHLtoDE
	jp c, Func_e3322
	xor a
	jp Func_e334c

Func_e3322: ; e3322 (38:7322)
	push hl
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	pop hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld l, a
	ld h, $0
	call CompareHLtoDE
	jp nc, Func_e334a
	xor a
	jp Func_e334c

Func_e334a: ; e334a (38:734a)
	ld a, $ff
Func_e334c: ; e334c (38:734c)
	ret

Data_e334d:
	db $0c, $2f, $34, $4e, $27, $42, $38, $47, $46, $45, $44

Data_e3358:
	db $0a, $0b, $0d, $13, $94, $9e, $9f, $eb, $db, $dc, $d0

Data_e3363:
	db $80, $78, $7a, $21, $2a, $59, $4e, $42, $38, $0b, $0f

Data_e336e:
	db $19, $14, $0f, $0a, $08, $07, $05, $04, $03, $02, $01

Func_e3379: ; e3379 (38:7379)
	add sp, -$2e
	ld hl, sp+$21
	reg16swap de, hl
	ld hl, Data_e334d
	ld bc, $b
	call MemCopy
	ld hl, sp+$16
	reg16swap de, hl
	ld hl, Data_e3358
	ld bc, $b
	call MemCopy
	ld hl, sp+$b
	reg16swap de, hl
	ld hl, Data_e3363
	ld bc, $b
	call MemCopy
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_e336e
	ld bc, $b
	call MemCopy
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	cp $3c
	jp nc, Func_e33e6
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $1
	jp Func_e341c

Func_e33e6: ; e33e6 (38:73e6)
	cp $50
	jp nc, Func_e3405
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $2
	jp Func_e341c

Func_e3405: ; e3405 (38:7405)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld [hl], $3
Func_e341c: ; e341c (38:741c)
	set_farcall_addrs_hli RandomRange
	ld a, $64
	call FarCall
	ld e, a
	ld hl, sp+$2c
	ld [hl], $0
	ld c, $0
Func_e3433: ; e3433 (38:7433)
	ld a, c
	cp $b
	jp nc, Func_e3504
	push de
	ld hl, sp+$2e
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, sp+$2
	add hl, de
	add [hl]
	ld hl, sp+$2e
	ld [hl], a
	pop de
	ld a, e
	ld hl, sp+$2c
	cp [hl]
	jp nc, Func_e3500
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e348a
	ld e, c
	ld d, $0
	ld hl, sp+$21
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
	jp Func_e34fd

Func_e348a: ; e348a (38:748a)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $2
	jp nz, Func_e34c5
	ld e, c
	ld d, $0
	ld hl, sp+$16
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
	jp Func_e34fd

Func_e34c5: ; e34c5 (38:74c5)
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $e
	add hl, de
	ld a, [hl]
	cp $3
	jp nz, Func_e34fd
	ld e, c
	ld d, $0
	ld hl, sp+$b
	add hl, de
	ld a, [hl]
	ld hl, wc387
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $f
	add hl, de
	ld [hl], a
Func_e34fd: ; e34fd (38:74fd)
	jp Func_e3504

Func_e3500: ; e3500 (38:7500)
	inc c
	jp Func_e3433

Func_e3504: ; e3504 (38:7504)
	add sp, $2e
	ret

Func_e3507:: ; e3507
	push bc
	push bc
	push bc
	push bc
	push bc
	ld c, $0
Func_e350e: ; e350e (38:750e)
	ld a, c
	cp $3
	jp nc, Func_e3613
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $10
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_e35e3
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $9
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_e35e3
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	inc hl
	inc hl
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $5
	add hl, de
	ld e, [hl]
	ld hl, sp+$3
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $6
	add hl, de
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $7
	add hl, de
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $8
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	ld a, c
	add $2
	ld hl, sp+$7
	ld [hl], a
	ld hl, sp+$8
	ld [hl], $c
	ldh a, [hSRAMBank]
	ld l, a
	push hl
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld a, [wOptions]
	pop hl
	push af
	ld a, l
	call GetSRAMBank
	pop af
	and $2 ; stereo
	jp z, Func_e35db
	ld hl, sp+$9
	ld [hl], $0
	jp Func_e35df

Func_e35db: ; e35db (38:75db)
	ld hl, sp+$9
	ld [hl], $1
Func_e35df: ; e35df (38:75df)
	pop bc
	jp Func_e35f9

Func_e35e3: ; e35e3 (38:75e3)
	push bc
	ld bc, $9
	ld e, $0
	ld hl, sp+$2
	call FillMemory
	pop bc
	ld a, c
	add $2
	ld hl, sp+$5
	ld [hl], a
	ld hl, sp+$7
	ld [hl], $0
Func_e35f9: ; e35f9 (38:75f9)
	push bc
	ld hl, sp+$a
	ld [hl], $0
	set_farcall_addrs_hli Func_9342a
	ld hl, sp+$2
	call FarCall
	pop bc
	inc c
	jp Func_e350e

Func_e3613: ; e3613 (38:7613)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_e3619:: ; e3619 (38:7619)
	push hl
	push bc
	push bc
	push de
	call GetHLAtSPPlus8
	ld e, h
	ld hl, sp+$4
	ld [hl], e
	call GetHLAtSPPlus8
	ld e, l
	ld hl, sp+$3
	ld [hl], e
	pop de
	inc c
	dec c
	jp nz, Func_e36ac
	ld hl, sp+$0
	ld [hl], $0
Func_e3635: ; e3635 (38:7635)
	ld hl, sp+$0
	ld a, [hl]
	cp e
	jp nc, Func_e36a9
	push de
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $10
	or [hl]
	ld [hl], a
	ld hl, sp+$3
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $40
	or [hl]
	ld [hl], a
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	pop de
	jp Func_e3635

Func_e36a9: ; e36a9 (38:76a9)
	jp Func_e3710

Func_e36ac: ; e36ac (38:76ac)
	xor a
Func_e36ad: ; e36ad (38:76ad)
	cp e
	jp nc, Func_e3710
	push de
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, $20
	or [hl]
	ld [hl], a
	pop af
	push af
	ld e, a
	ld d, $0
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wMapCollisionPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	inc hl
	add hl, de
	ld a, $8
	or [hl]
	ld [hl], a
	pop af
	inc a
	pop de
	jp Func_e36ad

Func_e3710: ; e3710 (38:7710)
	pop bc
	pop bc
	pop bc
	ret

Func_e3714:: ; e3714 (38:7714)
	push hl
	push bc
	push bc
	push bc
	push bc
	push de
	read_hl_from_sp_plus $c
	ld e, h
	ld hl, sp+$8
	ld [hl], e
	read_hl_from_sp_plus $c
	pop de
	push hl
	ld hl, sp+$7
	ld [hl], d
	ld hl, sp+$6
	ld [hl], b
	ld a, c
	pop hl
	push de
	push af
	ld e, l
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus8
	pop af
	ld e, a
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus4
	xor a
	pop de
.outer
	cp e
	jp nc, .quit
	push de
	push af
	ld c, $0
.inner
	ld a, c
	ld hl, sp+$9
	cp [hl]
	jp nc, .next
	call GetHLAtSPPlus8
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	call GetHLAtSPPlus6
	ld e, c
	ld d, $0
	add hl, de
	ld [hl], a
	inc c
	jp .inner

.next
	call GetHLAtSPPlus8
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus8
	call GetHLAtSPPlus6
	ld a, [wMapWidth]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus6
	pop af
	inc a
	pop de
	jp .outer

.quit
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

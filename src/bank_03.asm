INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 03", ROMX
Func_c000: ; c000
	ret

Data_c001: ; c001
	db $16, $04, $06, $18, $17, $18, $11, $00

Data_c009: ; c009
	db $03, $00, $01, $05, $04, $00, $01, $06, $f8, $0a, $05, $01, $00

Data_c016: ; c016
	db $03, $00, $f8, $05, $06, $08, $0a, $02, $00, $01, $05, $05, $01, $00

Data_c024: ; c024
	db $03, $01, $0b, $05, $04, $01, $01, $1c, $06, $04, $00, $20, $5d, $02, $01, $0b, $05, $05, $01, $00

Data_c038: ; c038
	db $03, $00, $01, $05, $04, $00, $01, $16, $01, $05, $18, $05, $01, $11, $00

Data_c047: ; c047
	db $1a, $12, $39, $09, $20, $4a, $09, $20, $4a, $03, $01, $0b, $05, $04, $01, $01, $06, $f8, $14, $05, $01, $1b, $00

Data_c05e: ; c05e
	db $1a, $12, $38, $09, $20, $4a, $09, $20, $4a, $03, $01, $0b, $05, $04, $01, $01, $06, $f4, $0d, $05, $01, $1b, $00

Data_c075: ; c075
	db $1a, $12, $3a, $09, $20, $4a, $09, $20, $4a, $03, $01, $0b, $05, $04, $01, $01, $06, $f0, $0a, $05, $01, $1b, $00

Data_c08c: ; c08c
	db $1a, $10, $04, $e4, $e4, $1b, $1b, $12, $3a, $09, $20, $4a, $09, $20, $4a, $03, $01, $0b, $05, $04, $01, $01, $06, $f0, $0a, $11, $05, $01, $1b, $00

Data_c0aa: ; c0aa
	db $1a, $12, $39, $09, $20, $4a, $09, $20, $4a, $1b, $00

Data_c0b5: ; c0b5
	db $1a, $12, $38, $09, $20, $4a, $09, $20, $4a, $1b, $00

Data_c0c0: ; c0c0
	db $1a, $12, $3a, $09, $20, $4a, $09, $20, $4a, $1b, $00

Data_c0cb: ; c0cb
	db $1a, $10, $04, $e4, $e4, $1b, $1b, $12, $3a, $09, $20, $4a, $09, $20, $4a, $11, $1b, $00

Data_c0dd: ; c0dd
	db $03, $01, $0b, $05, $04, $01, $01, $06, $fe, $0c, $02, $01, $08, $05, $05, $01, $00

Data_c0ee: ; c0ee
	db $03, $01, $08, $05, $04, $01, $01, $06, $02, $0c, $02, $01, $0b, $05, $05, $01, $00

Data_c0ff: ; c0ff
	db $03, $00, $01, $05, $04, $00, $01, $1d, $06, $00

Data_c109: ; c109
	db $02, $00, $01, $05, $05, $01, $00

Data_c110: ; c110
	db $03, $00, $01, $05, $04, $00, $01, $20, $60, $0a, $02, $00, $01, $05, $05, $01, $00

Data_c121: ; c121
	db $1e, $01, $02, $20, $35, $06, $08, $06, $06, $f0, $04, $1e, $01, $03, $00

Data_c130: ; c130
	db $10, $0a, $e4, $91, $1b, $1b, $20, $62, $03, $00, $01, $05, $04, $00, $01, $06, $f4, $08, $20, $35, $03, $00, $14, $05, $08, $06, $f7, $1c, $11, $03, $00, $f8, $05, $06, $08, $0a, $1e, $01, $03, $00

Data_c158: ; c158
	db $1e, $01, $02, $02, $00, $01, $05, $05, $01, $03, $01, $0b, $05, $04, $01, $01, $20, $5a, $07, $f8, $14, $0b, $0b, $f7, $0c, $20, $63, $07, $06, $19, $1c, $12, $00, $04, $05, $02, $01, $0b, $05, $01, $00

Data_c181: ; c181
	db $03, $00, $01, $05, $04, $00, $01, $06, $fe, $0c, $07, $f0, $08, $20, $59, $01, $1e, $01, $00, $03, $00, $0f, $f7, $08, $07, $08, $0e, $06, $f0, $0e, $20, $35, $05, $01, $1e, $01, $01, $03, $00, $01, $f7, $07, $04, $1c, $1e, $01, $03, $00

Data_c1b1: ; c1b1
	db $03, $00, $01, $05, $04, $00, $01, $07, $08, $14, $20, $57, $0b, $14, $05, $08, $20, $35, $06, $f8, $1d, $0b, $01, $12, $08, $07, $f8, $0d, $1e, $01, $03, $00

Data_c1d1: ; c1d1
	db $1e, $01, $02, $20, $60, $0a, $1e, $01, $03, $00

Data_c1db: ; c1db
	db $03, $00, $01, $05, $04, $00, $01, $20, $61, $13, $3c, $02, $00, $01, $05, $05, $01, $00

Data_c1ed: ; c1ed
	db $20, $61, $23, $16, $05, $03, $19, $1e, $18, $17, $18, $11, $24, $00

Data_c1fb: ; c1fb
	db $20, $5e, $16, $05, $02, $19, $1e, $18, $17, $18, $11, $00

Data_c207: ; c207
	db $20, $58, $0e, $0e, $00

Data_c20c: ; c20c
	db $20, $5e, $23, $0f, $0f, $24, $00

Data_c213: ; c213
	db $20, $63, $10, $0a, $1b, $1b, $1b, $1b, $19, $78, $11, $00

Data_c21f: ; c21f
	db $20, $5f, $23, $10, $0a, $c1, $c1, $c1, $c1, $19, $5a, $11, $24, $00

Data_c22d: ; c22d
	db $20, $64, $14, $03, $00, $04, $20, $64, $19, $3c, $15, $00

Data_c239: ; c239
	db $20, $65, $14, $06, $00, $08, $20, $65, $19, $3c, $15, $00

Data_c245: ; c245
	db $20, $65, $14, $03, $04, $00, $20, $65, $19, $3c, $15, $00

Data_c251: ; c251
	db $20, $65, $14, $06, $08, $00, $20, $65, $19, $3c, $15, $00

Data_c25d: ; c25d
	db $1e, $01, $02, $1e, $01, $03, $12, $09, $12, $09, $12, $09, $00

Data_c26a: ; c26a
	db $1e, $01, $02, $10, $0a, $e4, $91, $e4, $1b, $20, $5b, $03, $00, $01, $05, $04, $00, $01, $06, $f4, $08, $20, $2c, $03, $00, $14, $05, $08, $06, $f7, $13, $11, $20, $4e, $06, $f7, $13, $05, $01, $12, $10, $03, $00, $f8, $05, $06, $08, $0a, $1e, $01, $03, $00

Data_c29e: ; c29e
	db $10, $05, $1b, $1b, $1b, $1b, $12, $17, $12, $17, $11, $00

Data_c2aa: ; c2aa
	db $14, $05, $00, $04, $12, $1e, $12, $1e, $15, $00

Data_c2b4: ; c2b4
	db $10, $0a, $e4, $e4, $1b, $1b, $12, $22, $12, $22, $11, $1e, $01, $04, $00

Data_c2c3: ; c2c3
	db $10, $0a, $e4, $e4, $1b, $1b, $12, $23, $12, $23, $11, $1e, $01, $04, $00

Data_c2d2: ; c2d2
	db $23, $10, $0a, $e4, $e4, $81, $81, $12, $30, $12, $30, $12, $30, $11, $24, $00

Data_c2e2: ; c2e2
	db $0d, $14, $05, $00, $04, $20, $65, $0d, $12, $32, $0d, $12, $26, $15, $00

Data_c2f1: ; c2f1
	db $0d, $14, $04, $00, $02, $20, $65, $12, $32, $12, $32, $15, $00

Data_c2fe: ; c2fe
	db $10, $05, $1b, $1b, $1b, $1b, $03, $00, $01, $05, $04, $00, $01, $20, $60, $0a, $11, $02, $00, $01, $05, $05, $01, $00

Data_c316: ; c316
	db $14, $02, $00, $02, $20, $65, $0e, $0e, $20, $65, $0e, $15, $00

Data_c323: ; c323
	db $20, $63, $10, $0a, $e4, $e4, $1b, $1b, $13, $5a, $11, $20, $61, $23, $10, $0a, $06, $06, $f4, $f4, $13, $5a, $11, $24, $00

Data_c33c: ; c33c
	db $20, $62, $10, $0a, $e4, $e4, $1b, $1b, $19, $1e, $12, $32, $19, $1e, $12, $32, $19, $1e, $11, $00

Data_c350: ; c350
	db $10, $0a, $e4, $e4, $1b, $1b, $19, $1e, $12, $31, $19, $1e, $12, $31, $19, $1e, $11, $00

Data_c362: ; c362
	db $12, $12, $20, $49, $0e, $10, $0a, $1b, $1b, $1b, $1b, $12, $12, $20, $49, $11, $00

Data_c373: ; c373
	db $10, $0a, $e4, $e4, $1b, $1b, $12, $12, $12, $12, $11, $1e, $01, $04, $00

Data_c382: ; c382
	db $20, $48, $14, $05, $00, $02, $23, $0f, $19, $1e, $20, $48, $0f, $24, $19, $1e, $19, $1e, $15, $00

Data_c396: ; c396
	db $1e, $01, $02, $20, $59, $06, $08, $02, $06, $f8, $03, $07, $f4, $0a, $05, $01, $1e, $01, $00, $03, $00, $0f, $f8, $08, $07, $10, $07, $06, $f0, $0c, $05, $01, $20, $49, $23, $0f, $24, $19, $1e, $03, $00, $f7, $05, $06, $10, $0a, $20, $65, $23, $0f, $24, $14, $05, $00, $04, $07, $f0, $08, $05, $01, $20, $49, $23, $0f, $24, $19, $3c, $15, $1e, $01, $01, $03, $00, $01, $f9, $07, $0c, $08, $1e, $01, $03, $00

Data_c3e8: ; c3e8
	db $20, $49, $10, $0a, $40, $e4, $40, $e4, $19, $3c, $12, $29, $19, $14, $12, $29, $11, $00

Data_c3fa: ; c3fa
	db $12, $11, $10, $0a, $40, $e4, $40, $e4, $19, $3c, $12, $11, $19, $3c, $19, $14, $11, $00

Data_c40c: ; c40c
	db $20, $49, $10, $0a, $40, $e4, $e4, $e4, $19, $3c, $12, $11, $12, $11, $19, $3c, $19, $14, $11, $00

Data_c420: ; c420
	db $1e, $01, $02, $20, $59, $06, $08, $02, $06, $f8, $03, $07, $f4, $0a, $05, $01, $1e, $01, $00, $03, $00, $0f, $f8, $08, $07, $10, $07, $06, $f0, $0c, $05, $01, $20, $64, $14, $05, $04, $00, $19, $1e, $03, $00, $f7, $05, $06, $10, $0a, $07, $f0, $08, $05, $01, $20, $58, $0e, $19, $1e, $15, $1e, $01, $01, $03, $00, $01, $f7, $07, $04, $1c, $1e, $01, $03, $00

Data_c468: ; c468
	db $20, $58, $0d, $14, $04, $02, $00, $19, $1e, $12, $32, $20, $64, $0e, $12, $32, $0e, $19, $1e, $19, $0f, $15, $00

Data_c47f: ; c47f
	db $20, $4c, $0d, $14, $04, $02, $00, $19, $1e, $12, $12, $0e, $12, $12, $0e, $19, $1e, $19, $0f, $15, $00

Data_c494: ; c494
	db $1e, $01, $02, $20, $62, $06, $fe, $0c, $07, $f0, $08, $01, $20, $54, $10, $0a, $e4, $e4, $1b, $1b, $1e, $01, $00, $03, $00, $0f, $f7, $08, $07, $08, $0e, $06, $f0, $0e, $05, $01, $1e, $01, $01, $11, $03, $00, $01, $f7, $07, $04, $1c, $1e, $01, $03, $00

Data_c4c7: ; c4c7
	db $1e, $01, $02, $06, $fe, $0c, $07, $f0, $08, $01, $20, $5e, $23, $10, $0a, $06, $06, $f4, $f4, $1e, $01, $00, $03, $00, $0f, $f7, $08, $07, $08, $0e, $06, $f0, $0e, $20, $35, $05, $01, $1e, $01, $01, $11, $24, $03, $00, $01, $f7, $07, $04, $1c, $1e, $01, $03, $00

Data_c4fc: ; c4fc
	db $14, $05, $00, $04, $12, $1e, $12, $37, $15, $00

Data_c506: ; c506
	db $20, $64, $14, $02, $00, $02, $0e, $0e, $15, $10, $0a, $e4, $e4, $1b, $1b, $12, $37, $11, $14, $02, $00, $02, $20, $64, $15, $10, $0a, $e4, $e4, $1b, $1b, $12, $37, $11, $00

Data_c529: ; c529
	db $20, $5f, $10, $0a, $40, $e4, $e4, $e4, $19, $3c, $12, $11, $12, $11, $19, $3c, $19, $14, $11, $00

Data_c53d: ; c53d
	db $20, $5f, $10, $0a, $40, $e4, $e4, $e4, $19, $3c, $20, $48, $1f, $9b, $3c, $20, $4f, $1f, $9d, $3c, $20, $55, $1f, $9c, $3c, $11, $00

Data_c558: ; c558
	db $1e, $01, $02, $06, $fe, $0c, $07, $f0, $08, $01, $12, $25, $20, $4f, $10, $0a, $40, $e4, $40, $e4, $1e, $01, $00, $03, $00, $0f, $f7, $08, $07, $08, $14, $05, $01, $19, $01, $12, $30, $12, $30, $01, $19, $01, $1e, $01, $01, $11, $03, $00, $01, $f7, $07, $04, $1c, $1e, $01, $03, $00

Data_c591: ; c591
	db $1e, $01, $02, $1d, $06, $10, $0a, $e4, $e4, $1b, $1b, $20, $4f, $02, $00, $01, $05, $05, $01, $19, $01, $03, $01, $0b, $05, $04, $01, $01, $07, $f8, $14, $0b, $0b, $f7, $0c, $07, $06, $19, $1c, $0c, $00, $04, $07, $06, $0a, $05, $01, $19, $01, $12, $22, $12, $22, $11, $1e, $01, $03, $00

Data_c5cb: ; c5cb
	db $1e, $01, $02, $20, $61, $10, $0a, $40, $e4, $40, $e4, $07, $08, $14, $0b, $14, $05, $08, $06, $f8, $1d, $05, $20, $4f, $1f, $9d, $3c, $20, $35, $03, $00, $01, $12, $08, $07, $f8, $0e, $11, $1e, $01, $03, $00

Data_c5f5: ; c5f5
	db $1e, $01, $02, $10, $0a, $40, $e4, $40, $e4, $03, $00, $01, $05, $04, $00, $01, $06, $f4, $08, $03, $00, $14, $05, $08, $06, $f7, $18, $11, $20, $48, $1f, $9b, $3c, $06, $f7, $14, $05, $01, $03, $00, $f8, $05, $06, $08, $0a, $1e, $01, $03, $00

Data_c626: ; c626
	db $10, $0a, $40, $e4, $e4, $e4, $20, $5e, $19, $3c, $12, $25, $12, $22, $19, $3c, $20, $4e, $19, $14, $1e, $01, $04, $11, $00

Data_c63f: ; c63f
	db $12, $03, $0e, $12, $12, $0e, $00

Data_c646: ; c646
	db $10, $0a, $e4, $e4, $1b, $1b, $20, $3f, $12, $0c, $12, $0c, $11, $1e, $01, $04, $00

Data_c657: ; c657
	db $20, $48, $1f, $9b, $3c, $00

Data_c65d: ; c65d
	db $20, $4f, $1f, $9d, $3c, $00

Data_c663: ; c663
	db $20, $55, $1f, $9c, $3c, $00

Data_c669: ; c5dd
	dw Data_c121
	dw Data_c130
	dw Data_c158
	dw Data_c181
	dw Data_c1b1
	dw Data_c1d1
	dw Data_c1db
	dw Data_c1ed
	dw Data_c1fb
	dw Data_c207
	dw Data_c20c
	dw Data_c213
	dw Data_c21f
	dw Data_c22d
	dw Data_c239
	dw Data_c245
	dw Data_c251
	dw Data_c25d
	dw Data_c26a
	dw Data_c29e
	dw Data_c2aa
	dw Data_c2b4
	dw Data_c2c3
	dw Data_c2d2
	dw Data_c2e2
	dw Data_c2f1
	dw Data_c2fe
	dw Data_c316
	dw Data_c323
	dw Data_c33c
	dw Data_c350
	dw Data_c362
	dw Data_c373
	dw Data_c382
	dw Data_c396
	dw $0
	dw Data_c3e8
	dw Data_c3fa
	dw Data_c40c
	dw Data_c420
	dw Data_c468
	dw Data_c47f
	dw Data_c494
	dw Data_c4c7
	dw $0
	dw Data_c4fc
	dw Data_c506
	dw Data_c529
	dw Data_c53d
	dw Data_c558
	dw Data_c591
	dw Data_c5cb
	dw Data_c5f5
	dw Data_c626
	dw Data_c63f
	dw Data_c646
	dw Data_c657
	dw Data_c65d
	dw Data_c663
	dw Data_c001

Data_c6e1: ; c6e1
	dw Data_c0dd
	dw Data_c0ee
	dw Data_c0ff
	dw Data_c109
	dw Data_c110

Data_c6eb: ; c6eb
	dw Data_c024

Data_c6ed: ; c6ed
	dw Data_c047
	dw Data_c05e
	dw Data_c075
	dw Data_c08c
	dw Data_c0aa
	dw Data_c0b5
	dw Data_c0c0
	dw Data_c0cb

Data_c6fd: ; c6fd
	dw Data_c038

Func_c6ff: ; c6ff (3:46ff)
	set_farcall_addrs_hli Func_667d
	ld bc, $8f02
	ld de, $1311
	ld hl, $0
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $3
	ld de, $1311
	ld hl, $0
	call FarCall
	ret

Func_c72e: ; c72e (3:472e)
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_c740
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_c748

Func_c740: ; c740 (3:4740)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_c748: ; c748 (3:4748)
	ret

	call Func_c72e
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ret

Func_c758: ; c758 (3:4758)
	push af
	push de
	set_farcall_addrs_hli Func_5c328
	pop de
	pop af
	call FarCall
	ret

Data_c76b: ; c76b
	db $21, $02, $07, $1a, $00, $05, $09, $0c, $03, $1f, $0a, $05, $13, $0c

Func_c779: ; c779 (3:4779)
	ld a, [wOverworldTilemapSelector]
	ld e, a
	ld a, $2
	call Func_c758
	ld a, [wSystemType]
	cp $1
	jp z, Func_c792
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_c79d
Func_c792: ; c792 (3:4792)
	ld c, $1
	ld de, $e
	ld hl, Data_c76b
	call Func_2a79
Func_c79d: ; c79d (3:479d)
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Func_c7ba: ; c7ba
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	call Func_c72e
	call Func_c6ff
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld c, $2
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	reg16swap de, hl
	ld hl, $b05
	call FarCall
	call Func_c779
	ret

Func_c812:: ; c812
	push hl
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	pop af
	pop hl
	push af
	ld de, $c980
	call CopyUntilNull
	pop af
	push hl
	call GetSRAMBank
	pop hl
	ret

Func_c82b: ; c82b
	push hl
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld hl, wc98d
	ld l, [hl]
	ld h, 0
	get_party_bot
	inc hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call CopyUntilNull
	call WriteHLToSPPlus4
	pop af
	call GetSRAMBank
	pop hl
	push hl
	pop bc
	ret

DelayFrames_NoHalt: ; c85d (3:485d)
.loop
	ld a, [wNextVBlankFlags]
	ld hl, wLastVBlankFlags
	cp [hl]
	jp nz, .loop
	ret

PrintMapText_:: ; c868 (3:4868)
; h - x coordinate
; l - y coordinate
; de - string pointer table
; c -
;     bits 0-4: bank
;     bits 5-7: flags
	push hl
	push de
	push bc
	set_farcall_addrs_hli PrintMapText
	pop bc
	; transfer the high bits of c to b
	ld a, c
	and $e0
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, c
	and $1f
	ld e, a
	ld d, $0
	add hl, de
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call FarCall
	pop bc
	pop bc
	ret

Func_c896: ; c896 (3:4896)
	push hl
	push de
	push bc
	set_farcall_addrs_hli Func_17e95
	pop bc
	pop de
	pop hl
	call FarCall
	ret

Func_c8ab: ; c8ab (3:48ab)
	add $2
	ld e, a
	ld hl, $b
	ld c, $3
	call Func_c896
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	ret

Pointers_c8c1: ; c8c1
	dw Data_c8cb
	dw Data_c8d5
	dw Data_c8de
	dw Data_c8e6
	dw Data_c8ed

Data_c8cb: ; c8cb
	dstr "(たのんたﾞそﾞ)"

Data_c8d5: ; c8d5
	dstr "(かﾞんはﾞれ)"

Data_c8de: ; c8de
	dstr "(いっけぇー)"

Data_c8e6: ; c8e6
	dstr "(よしっ) "

Data_c8ed:
	dstr " (ゆけっ!!)"

Data_c8f6: ; c8f6
	db $21, $01, $03, $15, $00, $0b, $0d, $0d

Func_c8fe: ; c8fe
	add sp, -$68
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_c8f6
	ld bc, $8
	call MemCopy
	ld hl, sp+$29
	write_hl_to_sp_plus $25
	ld hl, sp+$48
	write_hl_to_sp_plus $27
	ld hl, $0
	write_hl_to_sp_plus $29
	ld hl, sp+$f
	call Func_c812
	ld hl, sp+$f
	push hl
	read_hl_from_sp_plus $27
	pop de
	call LiteralStringInTree
	read_hl_from_sp_plus $25
	call Func_292b
	ld e, a
	push de
	ld hl, sp+$11
	call Func_c82b
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	ld de, wSaveScratchParty
	ld hl, sp+$12
	ld [hl], $0
Func_c94f: ; c94f (3:494f)
	ld hl, sp+$12
	ld a, [hl]
	cp $4
	jp nc, Func_c976
	ld hl, $c
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_c964
	jp Func_c976

Func_c964: ; c964 (3:4964)
	ld hl, sp+$12
	ld a, [hl]
	inc a
	ld hl, sp+$12
	ld [hl], a
	ld hl, $23
	add hl, de
	reg16swap de, hl
	jp Func_c94f

Func_c976: ; c976 (3:4976)
	ld hl, sp+$12
	ld a, [hl]
	cp $4
	jp nc, Func_c985
	ld hl, sp+$12
	ld [hl], $0
	jp Func_c9e8

Func_c985: ; c985 (3:4985)
	ld hl, wc98d
	ld l, [hl]
	ld h, 0
	get_party_bot
	write_hl_to_sp_plus $12
	ld hl, sp+$c
	ld c, l
	ld b, h
	read_hl_from_sp_plus $12
	ld de, $e
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $14
	ld de, $c
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_2617
	ld hl, sp+$c
	ld a, [hl]
	or a
	jp nz, Func_c9de
	ld hl, sp+$d
	ld a, [hl]
	or a
	jp nz, Func_c9de
	ld hl, sp+$e
	ld a, [hl]
	cp $80
	jp nc, Func_c9de
	ld hl, sp+$12
	ld [hl], $1
	jp Func_c9e8

Func_c9de: ; c9de (3:49de)
	ld a, $2
	call RandomRange
	add $2
	ld hl, sp+$12
	ld [hl], a
Func_c9e8: ; c9e8 (3:49e8)
	pop af
	call GetSRAMBank
	ld hl, sp+$10
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Pointers_c8c1
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	read_hl_from_sp_plus $2b
	pop de
	call CopyUntilNull
	ld c, l
	ld b, h
	ld hl, sp+$10
	ld a, [hl]
	cp $3
	jp nc, Func_ca22
	ld a, $21
	ld [bc], a
	inc bc
	ld a, $20
	ld [bc], a
	inc bc
	ld hl, sp+$11
	reg16swap de, hl
	ld l, c
	ld h, b
	call LiteralStringInTree
	jp Func_ca3e

Func_ca22: ; ca22 (3:4a22)
	ld hl, sp+$11
	reg16swap de, hl
	ld l, c
	ld h, b
	call LiteralStringInTree
	ld c, l
	ld b, h
	read_hl_from $48c9
	reg16swap de, hl
	ld l, c
	ld h, b
	dec hl
	call CopyUntilNull
Func_ca3e: ; ca3e (3:4a3e)
	pop de
	push de
	ld a, e
	call Func_c8ab
	ld c, $0
Func_ca46: ; ca46 (3:4a46)
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$25
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_ca78
	push bc
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	ld hl, sp+$27
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, c
	ld h, $0
	add hl, hl
	ld de, $10c
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop bc
	inc c
	jp Func_ca46

Func_ca78: ; ca78 (3:4a78)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	call Func_c72e
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $b
	ld de, $1311
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	pop de
	ld a, e
	add $2
	ld e, a
	check_cgb
	jp nz, Func_cb00
	push de
	set_farcall_addrs_hli Func_667d
	pop de
	push de
	ld l, e
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $11
	add hl, de
	reg16swap de, hl
	ld hl, $b
	ld bc, $3
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli PushBGMapRegion_
	ld bc, $1d
	ld de, $1323
	ld hl, wOverworldTilemapSelector
	ld l, [hl]
	ld h, $0
	inc h
	inc h
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
	pop de
Func_cb00: ; cb00 (3:4b00)
	push de
	call WaitVideoTransfer
	pop de
	ld a, [wSystemType]
	cp $1
	jp z, Func_cb15
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_cb22
Func_cb15: ; cb15 (3:4b15)
	ld hl, sp+$6
	ld [hl], e
	ld c, $1
	ld de, $8
	ld hl, sp+$0
	call Func_2a79
Func_cb22: ; cb22 (3:4b22)
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_cb2e: ; cb2e (3:4b2e)
	cp $3c
	jp nc, Func_cb3c
	push af
	call NextBattleFrame
	pop af
	inc a
	jp Func_cb2e

Func_cb3c: ; cb3c (3:4b3c)
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld e, a
	ld a, $2
	call Func_c758
	add sp, $68
	ret

INCLUDE "engine/allocate_monster_struct.asm"

Func_cd9a:: ; cd9a (3:4d9a)
	callba_hli Func_bf214
	ret

Func_cda9: ; cda9
	call DisableHBlank
	xor a
	ldh [rSCX], a
	ld [wHBlankSCXAlternate], a
	ld a, [wLCDC]
	ldh [rLCDC], a
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	ret

Func_cdc0: ; cdc0 (3:4dc0)
	push af
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	ld de, $8f00
	add hl, de
	ld c, l
	ld b, h
	ld de, $1f0c
	ld hl, $5
	call FarCall
	check_cgb
	jp nz, Func_ce13
	call WaitVideoTransfer
	ldh a, [rVBK]
	or $1
	ldh [rVBK], a
	set_farcall_addrs_hli Func_667d
	ld hl, sp+$1
	ld c, [hl]
	ld b, $0
	ld de, $1f0c
	ld hl, $5
	call FarCall
	call WaitVideoTransfer
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
Func_ce13: ; ce13 (3:4e13)
	call WaitVideoTransfer
	pop bc
	ret

Func_ce18: ; ce18 (3:4e18)
	push af
	ld a, [wOverworldTilemapSelector]
	xor $1
	ld [wOverworldTilemapSelector], a
	pop af
	or a
	jp nz, Func_ce73
	set_farcall_addrs_hli Func_7c8a
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $105
	call FarCall
	set_farcall_addrs_hli Func_7c8a
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $40
	add hl, de
	reg16swap de, hl
	ld hl, $b05
	call FarCall
	jp Func_ce79

Func_ce73: ; ce73 (3:4e73)
	ld a, [wOverworldTilemapSelector]
	call Func_cdc0
Func_ce79: ; ce79 (3:4e79)
	call WaitVideoTransfer
	call Func_c72e
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, $4da9
	write_hl_to wVBlankCallbackAddress
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
Func_cea1: ; cea1 (3:4ea1)
	ld a, [wNextVBlankFlags]
	and $80
	jp nz, Func_cea1
	ld e, $2
	ld a, [wOverworldTilemapSelector]
	call Func_c758
	ld a, [wOverworldTilemapSelector]
	xor $1
	call Func_cdc0
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, $1
	ld [wEnableAttrMapTransfer], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

Func_ced9: ; ced9
	ld a, [wBlinkerOffTile]
	ld [wHBlankSCXAlternate], a
	ret

Data_cee0: ; cee0
	db  2, -2,  2, -2
	db  8,  8,  8,  8
	db  2,  2,  2,  2

Func_ceec: ; ceec (3:4eec)
	push af
	push bc
	push bc
	push bc
	push bc
	push de
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	ld e, [hl]
	ld hl, sp+$6
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	ld e, [hl]
	ld hl, sp+$5
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld hl, sp+$e
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_cee0
	add hl, de
	inc hl
	inc hl
	inc hl
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $80
	call CompareHLtoDE
	jp c, Func_cf49
	call GetHLAtSPPlus4
	dec h
	call WriteHLToSPPlus4
Func_cf49: ; cf49 (3:4f49)
	ld a, $3
	ld [wVBlankCallbackROMBank], a
	ld a, $3
	ld [wVBlankCallbackRAMBank], a
	ld hl, Func_ced9
	write_hl_to wVBlankCallbackAddress
	ld a, [wHBlankSCXAlternate]
	ld [wBlinkerOffTile], a
	ld a, [wNextVBlankFlags]
	or $80
	ld [wNextVBlankFlags], a
	ld hl, sp+$7
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	pop de
Func_cf71: ; cf71 (3:4f71)
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$9
	cp [hl]
	jp nc, Func_cfde
	ld hl, sp+$5
	ld a, [hl]
	cp e
	jp nc, Func_cfde
	push bc
	push de
	ld l, c
	ld h, b
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld de, $28
	call Func_de2c
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$d
	cp [hl]
	jp nc, Func_cfaa
	ld hl, sp+$a
	ld a, [hl]
	ld hl, sp+$8
	add [hl]
	ld hl, sp+$a
	ld [hl], a
	ld a, [wBlinkerOffTile]
	ld hl, sp+$7
	add [hl]
	ld [wBlinkerOffTile], a
Func_cfaa: ; cfaa (3:4faa)
	pop de
	pop bc
	push bc
	push de
	ld hl, sp+$9
	ld a, [hl]
	cp e
	jp nc, Func_cfce
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$6
	add [hl]
	ld hl, sp+$9
	ld [hl], a
	call GetHLAtSPPlus6
	reg16swap de, hl
	ld l, c
	ld h, b
	ld a, [hl]
	add e
	ld [hl], a
	inc hl
	ld a, [hl]
	adc d
	ld [hl], a
Func_cfce: ; cfce (3:4fce)
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop de
	pop bc
	jp Func_cf71

Func_cfde: ; cfde (3:4fde)
	ld a, [wNextVBlankFlags]
	and $7f
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_cfef: ; cfef
	db $01, $14, $05

Data_cff2: ; cff2
	db $03, $01, $0b, $05, $04, $01, $01, $00

Data_cffa: ; cffa
	db $03, $00, $01, $05, $04, $00, $01, $06, $fe, $28, $00

Data_d005: ; d005
	db $03, $00, $f7, $05, $20, $2c, $06, $02, $28, $05, $02, $00, $01, $05, $01, $00

Data_d015: ; d015
	db $03, $01, $0b, $05, $04, $01, $01, $06, $02, $28, $00

Data_d020: ; d020
	db $03, $01, $16, $05, $20, $2c, $06, $fe, $2c, $05, $02, $01, $0b, $05, $01, $00

Func_d030:: ; d030
	push bc
	push af
	ld hl, $a0
	call WriteHLToSPPlus4
	ld a, $1
	ld [wHBlankMode], a
	ld a, $27
	ld [wHBlankLYCPrimary], a
	ld a, $67
	ld [wHBlankLYCAlternate], a
	xor a
	ld [wHBlankSCXAlternate], a
	xor a
	ld [wHBlankSCXAlternate + 1], a
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $0
	set_farcall_addrs_hli Func_7c8a
	pop af
	cp $6
	jp z, Func_d156
	cp $5
	jp z, Func_d14d
	cp $4
	jp z, Func_d144
	cp $3
	jp z, Func_d13b
	cp $2
	jp z, Func_d111
	cp $1
	jp z, Func_d0d5
	or a
	jp nz, Func_d15c
	ld hl, $a0
	pop de
	push hl
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1805
	call FarCall
	ld hl, Data_cfef
	call Func_e4d1
	call EnableHBlank
	ld l, $0
	push hl
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld e, $48
	ld a, $48
	call Func_ceec
	pop bc
	xor a
	call Func_ce18
	jp Func_d15c

Func_d0d5: ; d0d5 (3:50d5)
	ld hl, $a0
	pop de
	push hl
	ld a, [wOverworldTilemapSelector]
	ld c, a
	read_hl_from wCurRobotPointer
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $1805
	call FarCall
	ld a, $48
	ld hl, Data_cfef
	call Func_e4d1
	call EnableHBlank
	ld l, $0
	push hl
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld e, $48
	ld a, $48
	call Func_ceec
	pop bc
	xor a
	call Func_ce18
	jp Func_d18c

Func_d111: ; d111 (3:5111)
	ld hl, $58
	pop de
	push hl
	ld a, $48
	ld c, a
	push bc
	push af
	ld hl, Data_cff2
	call PlayBattleAnimScript
	call EnableHBlank
	pop af
	pop bc
	ld l, $2
	push hl
	ld e, a
	ld a, c
	ld hl, sp+$2
	ld c, l
	ld b, h
	call Func_ceec
	pop bc
	ld a, $1
	call Func_ce18
	jp Func_d15c

Func_d13b: ; d13b (3:513b)
	ld hl, Data_cffa
	call PlayBattleAnimScript
	jp Func_d15c

Func_d144: ; d144 (3:5144)
	ld hl, Data_d005
	call PlayBattleAnimScript
	jp Func_d15c

Func_d14d: ; d14d (3:514d)
	ld hl, Data_d015
	call PlayBattleAnimScript
	jp Func_d15c

Func_d156: ; d156 (3:5156)
	ld hl, Data_d020
	call PlayBattleAnimScript
Func_d15c: ; d15c (3:515c)
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, Func_d16e
	ld a, [wLCDC]
	and $f7
	ld [wLCDC], a
	jp Func_d176

Func_d16e: ; d16e (3:516e)
	ld a, [wLCDC]
	or $8
	ld [wLCDC], a
Func_d176: ; d176 (3:5176)
	call DisableHBlank
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
Func_d18c: ; d18c (3:518c)
	pop bc
	ret

Func_d18e: ; d18e (3:518e)
	push de
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	ld c, l
	ld b, h
	ld hl, sp+$0
	ld e, [hl]
	ld d, $0
	ld hl, sp+$2
	ld l, [hl]
	ld h, a
	call Func_2515
	pop bc
	pop bc
	ret

	push af
	add sp, -$18
	push de
	ld hl, sp+$18
	ld [hl], $2
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d1c1
	ld hl, sp+$19
	ld [hl], $0
	jp Func_d1c5

Func_d1c1: ; d1c1 (3:51c1)
	ld hl, sp+$19
	ld [hl], $b
Func_d1c5: ; d1c5 (3:51c5)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d1de
	ld hl, $0
	jp Func_d1e1

Func_d1de: ; d1de (3:51de)
	ld hl, $2f
Func_d1e1: ; d1e1 (3:51e1)
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $12
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld a, c
	sub e
	ld l, a
	ld a, b
	sbc d
	ld h, a
	write_hl_to_sp_plus $12
	read_hl_from_sp_plus $12
	reg16swap de, hl
	ld hl, $0
	call CompareHLtoDE
	jp c, Func_d221
	ld hl, $0
	write_hl_to_sp_plus $12
Func_d221: ; d221 (3:5221)
	read_hl_from_sp_plus $12
	ld e, h
	ld hl, sp+$a
	ld [hl], e
	read_hl_from_sp_plus $12
	ld e, l
	ld hl, sp+$b
	ld [hl], e
	ld hl, sp+$6
	ld [hl], b
	ld hl, sp+$7
	ld [hl], c
	ld hl, sp+$9
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$2
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	ld de, $30
	call Func_2617
Func_d252: ; d252 (3:5252)
	ld hl, sp+$12
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	reg16swap de, hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d280
	inc e
Func_d280: ; d280 (3:5280)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d2ac
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d2c9
Func_d2ac: ; d2ac (3:52ac)
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$6
	ld h, [hl]
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d2c9: ; d2c9 (3:52c9)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call PushBGMapRegion
	pop bc
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, sp+$9
	call Func_fdb7
	or a
	jp z, Func_d2ea
	jp Func_d300

Func_d2ea: ; d2ea (3:52ea)
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, sp+$6
	call Func_fddb
	cp $1
	jp z, Func_d2fd
	jp Func_d300

Func_d2fd: ; d2fd (3:52fd)
	jp Func_d252

Func_d300: ; d300 (3:5300)
	ld hl, sp+$12
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $14
	pop de
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d329
	inc e
Func_d329: ; d329 (3:5329)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	read_hl_from_sp_plus $12
	push hl
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d365
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d384
Func_d365: ; d365 (3:5365)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d384: ; d384 (3:5384)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
	read_hl_from_sp_plus $12
	reg16swap de, hl
	add sp, $1a
	reg16swap de, hl
	ret

Func_d3a2:: ; d3a2
	push af
	add sp, -$18
	push de
	ld hl, sp+$18
	ld [hl], $2
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d3b8
	ld hl, sp+$19
	ld [hl], $0
	jp Func_d3bc

Func_d3b8: ; d3b8 (3:53b8)
	ld hl, sp+$19
	ld [hl], $b
Func_d3bc: ; d3bc (3:53bc)
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, sp+$1b
	ld a, [hl]
	or a
	jp nz, Func_d3d5
	ld hl, $0
	jp Func_d3d8

Func_d3d5: ; d3d5 (3:53d5)
	ld hl, $2f
Func_d3d8: ; d3d8 (3:53d8)
	add hl, de
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	ld de, $1a
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $12
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop de
	ld l, c
	ld h, b
	add hl, de
	write_hl_to_sp_plus $12
	read_hl_from_sp_plus $12
	push hl
	read_hl_from_sp_plus $12
	pop de
	call CompareHLtoDE
	jp nc, Func_d415
	read_hl_from_sp_plus $10
	write_hl_to_sp_plus $12
Func_d415: ; d415 (3:5415)
	read_hl_from_sp_plus $12
	ld e, h
	ld hl, sp+$a
	ld [hl], e
	read_hl_from_sp_plus $12
	ld e, l
	ld hl, sp+$b
	ld [hl], e
	ld hl, sp+$6
	ld [hl], b
	ld hl, sp+$7
	ld [hl], c
	ld hl, sp+$9
	xor a
	ld [hl], a
	ld hl, sp+$8
	ld [hl], a
	ld hl, sp+$d
	ld [hl], a
	ld hl, sp+$c
	ld [hl], a
	ld hl, sp+$2
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	ld de, $30
	call Func_2617
Func_d446: ; d446 (3:5446)
	ld hl, sp+$12
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	reg16swap de, hl
	ld hl, sp+$6
	ld a, [hl]
	ld hl, sp+$7
	ld l, [hl]
	ld h, a
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d474
	inc e
Func_d474: ; d474 (3:5474)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d4a0
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d4bd
Func_d4a0: ; d4a0 (3:54a0)
	ld hl, sp+$7
	ld c, [hl]
	ld hl, sp+$6
	ld h, [hl]
	ld b, h
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d4bd: ; d4bd (3:54bd)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call PushBGMapRegion
	pop bc
	ld hl, sp+$5
	reg16swap de, hl
	ld hl, sp+$9
	call Func_fdc9
	or a
	jp z, Func_d4de
	jp Func_d4f4

Func_d4de: ; d4de (3:54de)
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, sp+$6
	call Func_fddb
	cp $ff
	jp z, Func_d4f1
	jp Func_d4f4

Func_d4f1: ; d4f1 (3:54f1)
	jp Func_d446

Func_d4f4: ; d4f4 (3:54f4)
	ld hl, sp+$12
	ld c, l
	ld b, h
	read_hl_from_sp_plus $10
	push hl
	read_hl_from_sp_plus $14
	pop de
	call Func_2617
	ld hl, sp+$12
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$12
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$13
	ld e, [hl]
	ld hl, sp+$14
	ld a, [hl]
	and $80
	jp z, Func_d51d
	inc e
Func_d51d: ; d51d (3:551d)
	ld hl, sp+$19
	ld l, [hl]
	push hl
	ld c, e
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call Func_d18e
	pop bc
	read_hl_from_sp_plus $12
	push hl
	call GetHLAtSPPlus4
	ld de, $18
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$19
	ld a, [hl]
	or a
	jp z, Func_d559
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d578
Func_d559: ; d559 (3:5559)
	pop hl
	push hl
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$16
	ld e, [hl]
	ld d, $0
	inc de
	ld hl, sp+$17
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
Func_d578: ; d578 (3:5578)
	ld l, $2
	push hl
	ld c, $8
	ld hl, sp+$18
	ld e, [hl]
	ld hl, sp+$19
	ld a, [hl]
	call DoublePushBGMapRegion
	pop bc
	read_hl_from_sp_plus $12
	reg16swap de, hl
	add sp, $1a
	reg16swap de, hl
	ret

Func_d596: ; d596 (3:5596)
	add sp, -$1a
	ld hl, sp+$6
	ld [hl], $1
	or a
	jp nz, Func_d5a7
	ld hl, sp+$7
	ld [hl], $0
	jp Func_d5ab

Func_d5a7: ; d5a7 (3:55a7)
	ld hl, sp+$7
	ld [hl], $b
Func_d5ab: ; d5ab (3:55ab)
	push af
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	or a
	jp nz, Func_d5c2
	ld hl, $0
	jp Func_d5c5

Func_d5c2: ; d5c2 (3:55c2)
	ld hl, $2f
Func_d5c5: ; d5c5 (3:55c5)
	add hl, de
	call WriteHLToSPPlus8
	ld de, Data_d747
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld de, Data_d751
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	inc hl
	inc hl
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlus8
	ld de, $d
	add hl, de
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	ld hl, sp+$a
	reg16swap de, hl
	ld hl, sp+$9
	ld a, [hl]
	ld hl, sp+$8
	ld l, [hl]
	ld h, a
	call PlaceStringDEatCoordHL
	ld hl, sp+$8
	ld e, [hl]
	ld hl, sp+$9
	ld a, [hl]
	add $5
	call SetStringStartState
	call GetHLAtSPPlus8
	ld de, $22
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_d621
	cp $a
	jp nz, Func_d63d
Func_d621: ; d621 (3:5621)
	call GetHLAtSPPlus8
	ld de, $13
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	ld hl, $9a
	push hl
	ld hl, Data_d75a
	push hl
	call PlaceString
	pop bc
	pop bc
	pop bc
	jp Func_d665

Func_d63d: ; d63d (3:563d)
	push af
	ld hl, Data_d760
	push hl
	call PlaceString
	pop bc
	ld a, $19
	ld [wFarCallDestBank], a
	pop af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, $6f37
	add hl, de
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	ld hl, sp+$a
	push hl
	call PlaceString
	pop bc
Func_d665: ; d665 (3:5665)
	pop af
	push af
	or a
	jp z, Func_d681
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	ld a, [hl]
	and $1
	jp z, Func_d6e2
Func_d681: ; d681 (3:5681)
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	inc de
	inc de
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	inc h
	add hl, de
	ld de, $3
	call Func_2230
	ld hl, sp+$8
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $400
	add hl, de
	add hl, bc
	ld de, Data_d762
	call PlaceStringDEatCoordHL
	call GetHLAtSPPlus8
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld hl, sp+$a
	ld c, [hl]
	ld b, $0
	inc bc
	inc bc
	ld hl, sp+$b
	ld l, [hl]
	ld h, $0
	ld h, l
	ld l, $0
	ld de, $500
	add hl, de
	add hl, bc
	ld de, $100
	pop bc
	call Func_2230
Func_d6e2: ; d6e2 (3:56e2)
	ld hl, sp+$2
	ld c, l
	ld b, h
	call GetHLAtSPPlus8
	ld de, $1a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus10
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_2617
	ld hl, sp+$2
	ld c, l
	ld b, h
	ld de, $30
	ld hl, sp+$2
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$3
	ld c, [hl]
	ld hl, sp+$4
	ld a, [hl]
	and $80
	jp z, Func_d71b
	inc c
Func_d71b: ; d71b (3:571b)
	inc c
	dec c
	jp nz, Func_d735
	call GetHLAtSPPlus8
	ld de, $18
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
	call CompareHLtoDE
	jp nc, Func_d735
	ld c, $1
Func_d735: ; d735 (3:5735)
	pop af
	ld l, a
	push hl
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$9
	ld a, [hl]
	call Func_d18e
	pop bc
	add sp, $1a
	ret

Data_d747: ; d747
	dstr "         "

Data_d751: ; d751
	dstr "        "

Data_d75a: ; d75a
	dstr "%cV%d"

Data_d760: ; d760
	dstr " "

Data_d762: ; d762
	dstr "/   "

Func_d767:: ; d767
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	set_farcall_addrs_hli Func_667d
	ld bc, $8702
	ld de, $903
	ld hl, $900
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8602
	ld de, $a03
	ld hl, $a00
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8402
	ld de, $804
	ld hl, $4
	call FarCall
	set_farcall_addrs_hli Func_667d
	ld bc, $8402
	ld de, $1304
	ld hl, $b04
	call FarCall
	ld hl, $904
	call Coord2TileMap
	ld [hl], $85
	ld hl, $a04
	call Coord2TileMap
	ld [hl], $83
	xor a
	call Func_d596
	ld a, $1
	call Func_d596
	ret

INCLUDE "battle/intro2.asm"

Func_dbe2:: ; dbe2
	push hl
	push de
	set_farcall_addrs_hli Func_6086c
	pop de
	pop hl
	call FarCall
	ret

Func_dbf5:: ; dbf5 (3:5bf5)
	push af
	push de
	push bc
	set_farcall_addrs_hli Func_609d3
	pop bc
	pop de
	pop af
	call FarCall
	ret

Func_dc0a:: ; dc0a (3:5c0a)
	push af
	push de
	set_farcall_addrs_hli Func_5c0b2
	pop de
	pop af
	call FarCall
	ret

Func_dc1d: ; dc1d
	push de
	ld e, a
	xor a
	call Func_dc0a
	pop de
	ld a, $1
	call Func_dc0a
	ret

Data_dc2a: ; dc2a
	db $1, $0

Func_dc2c: ; dc2c (3:5c2c)
	push hl
	call ClearSprites
	ld a, [wNextVBlankFlags]
	or $2
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	ld a, [wLCDC]
	or $6
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	ld a, $28
	ldh [rLYC], a
	xor a
	ld [wHBlankMode], a
	ld a, $28
	ld [wHBlankLYCPrimary], a
	ld a, $69
	ld [wHBlankLYCAlternate], a
	call EnableHBlank
	call DelayFrames_NoHalt
	call WaitVideoTransfer
	callba_hli Func_5d113
	ld hl, Data_dc2a
	call PlayBattleAnimScript
	pop hl
	call PlayBattleAnimScript
	call ClearSprites
	callba_hli Func_5d113
	ld hl, Data_dc2a
	call PlayBattleAnimScript
	call DisableHBlank
	ld a, [wLCDC]
	and $f9
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $4
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	call WaitVideoTransfer
	ret

Func_dcaf:: ; dcaf
	push af
	push de
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $5e
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	cp $ff
	jp z, Func_dcd3
	ld a, [de]
	and $4
	jp z, Func_dcd6
Func_dcd3: ; dcd3 (3:5cd3)
	jp Func_dd07

Func_dcd6: ; dcd6 (3:5cd6)
	ld hl, sp+$3
	ld a, [hl]
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], a
	ld hl, sp+$0
	ld a, [hl]
	cp $46
	jp nc, Func_dcf3
	ld hl, sp+$0
	call BattleAnim_PlayMoveAnimScript
	jp Func_dd07

Func_dcf3: ; dcf3 (3:5cf3)
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_c669 - 2 * $46
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_dc2c
Func_dd07: ; dd07 (3:5d07)
	pop bc
	pop bc
	ret

Func_dd0a:: ; dd0a
	push de
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], a
	pop de
	ld l, e
	ld h, $0
	add hl, hl
	ld de, Data_c6eb
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_dc2c
	ret

Func_dd29:: ; dd29
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], $0
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Data_c6ed
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	call Func_dc2c
	ret

Func_dd47:: ; dd47
	read_hl_from wCurRobotPointer
	ld de, $b
	add hl, de
	ld [hl], a
	read_hl_from Data_c6fd
	call Func_dc2c
	ret

Func_dd5a:: ; dd5a
	ld a, $64
	call RandomRange
	ld hl, $4000
	ret

INCLUDE "engine/random.asm"

Func_ddc2: ; ddc2
	push hl
	push bc
	ld hl, sp+$0
	ld [hl], $fe
	ld c, $1
	ld hl, sp+$1
	ldh a, [rLY]
	ld [hl], a
Func_ddcf: ; ddcf (3:5dcf)
	ldh a, [rLY]
	ld e, a
	ld hl, sp+$1
	ld a, [hl]
	cp e
	jp z, Func_de1b
	ld hl, sp+$0
	ld a, [hl]
	ldh [rSCX], a
	ld hl, sp+$1
	ld [hl], e
	ld hl, sp+$0
	ld a, [hl]
	add c
	ld hl, sp+$0
	ld [hl], a
	ld a, c
	cp $1
	jp nz, Func_ddfb
	ld hl, sp+$0
	ld a, [hl]
	cp $3
	jp nz, Func_ddfb
	ld c, $ff
	jp Func_de0b

Func_ddfb: ; ddfb (3:5dfb)
	ld a, c
	cp $ff
	jp nz, Func_de0b
	ld hl, sp+$0
	ld a, [hl]
	cp $fe
	jp nz, Func_de0b
	ld c, $1
Func_de0b: ; de0b (3:5e0b)
	call GetHLAtSPPlus4
	dec hl
	call WriteHLToSPPlus4
	inc h
	dec h
	bit 7, h
	jr z, Func_de1b
	jp Func_de1e

Func_de1b: ; de1b (3:5e1b)
	jp Func_ddcf

Func_de1e: ; de1e (3:5e1e)
	ld a, [wNextVBlankFlags]
	or $10
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	pop bc
	pop bc
	ret

Func_de2c: ; de2c (3:5e2c)
	push hl
	push bc
	push bc
	push de
	read_hl_from wCurRobotPointer
	ld de, $15
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld [hl], e
	ld hl, wOAMBuffer
	call WriteHLToSPPlus6
	call GetHLAtSPPlus8
	ld de, $8
	add hl, de
	call WriteHLToSPPlus8
	pop de
	ld hl, $10
	add hl, de
	reg16swap de, hl
	ld hl, sp+$0
	ld a, [hl]
	and $40
	jp z, Func_de6c
	ld hl, $30
	add hl, de
	reg16swap de, hl
	ld bc, -$10
	jp Func_de6f

Func_de6c: ; de6c (3:5e6c)
	ld bc, $10
Func_de6f: ; de6f (3:5e6f)
	xor a
Func_de70: ; de70 (3:5e70)
	cp $4
	jp nc, Func_df20
	push af
	push bc
	push de
	ld c, e
	ld b, d
	inc b
	dec b
	bit 7, b
	jr nz, .asm_de8b
	ld e, c
	ld d, b
	ld hl, $98
	call CompareHLtoDE
	jp nc, Func_de8e
.asm_de8b
	ld bc, $0
Func_de8e: ; de8e (3:5e8e)
	ld hl, sp+$7
	ld [hl], $0
Func_de92: ; de92 (3:5e92)
	ld hl, sp+$7
	ld a, [hl]
	cp $8
	jp nc, Func_df10
	push bc
	ld hl, sp+$8
	ld a, [hl]
	and $20
	jp z, Func_dec0
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, $7
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	read_hl_from_sp_plus $10
	pop de
	add hl, de
	ld c, l
	ld b, h
	jp Func_ded3

Func_dec0: ; dec0 (3:5ec0)
	read_hl_from_sp_plus $e
	reg16swap de, hl
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld c, l
	ld b, h
Func_ded3: ; ded3 (3:5ed3)
	inc b
	dec b
	bit 7, b
	jr nz, .asm_dee4
	ld e, c
	ld d, b
	ld hl, $a8
	call CompareHLtoDE
	jp nc, Func_dee7
.asm_dee4
	ld bc, $0
Func_dee7: ; dee7 (3:5ee7)
	read_hl_from_sp_plus $c
	inc hl
	ld [hl], c
	pop bc
	call GetHLAtSPPlus10
	ld [hl], c
	ld hl, sp+$6
	ld a, [hl]
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	ld [hl], a
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
	call GetHLAtSPPlus10
	inc hl
	inc hl
	inc hl
	inc hl
	call WriteHLToSPPlus10
	jp Func_de92

Func_df10: ; df10 (3:5f10)
	pop de
	pop bc
	reg16swap de, hl
	add hl, bc
	reg16swap de, hl
	pop af
	inc a
	jp Func_de70

Func_df20: ; df20 (3:5f20)
	pop bc
	pop bc
	pop bc
	ret

Data_df24: ; df24
	db $e4, $1b, $06, $f4

Func_df28: ; df28
	push af
	ld c, $0
	check_cgb
	jp z, Func_df8b
	xor a
Func_df34: ; df34 (3:5f34)
	cp $6
	jp nc, Func_df74
	push af
	push bc
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, Data_df24
	add hl, de
	ld e, c
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	xor a
Func_df5c: ; df5c (3:5f5c)
	cp $a
	jp nc, Func_df6a
	push af
	call NextBattleFrame
	pop af
	inc a
	jp Func_df5c

Func_df6a: ; df6a (3:5f6a)
	pop bc
	ld a, c
	xor $1
	ld c, a
	pop af
	inc a
	jp Func_df34

Func_df74: ; df74 (3:5f74)
	ld a, [$5f24]
	ld [wOBP0], a
	ld [wBGP], a
	ld a, [wNextVBlankFlags]
	or $20
	ld [wNextVBlankFlags], a
	call DelayFrames_NoHalt
	jp Func_e013

Func_df8b: ; df8b (3:5f8b)
	push bc
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	ld de, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
	ld l, $0
	pop bc
Func_dfa1: ; dfa1 (3:5fa1)
	ld a, l
	cp $6
	jp nc, Func_e013
	push bc
	push hl
	inc c
	dec c
	jp nz, Func_dfd1
	ld hl, sp+$5
	ld a, [hl]
	or a
	jp nz, Func_dfc3
	ld bc, $80
	ld e, $0
	ld hl, wCGB_BGPalsBuffer
	call FillMemory
	jp Func_dfce

Func_dfc3: ; dfc3 (3:5fc3)
	ld bc, $80
	ld e, $ff
	ld hl, wCGB_BGPalsBuffer
	call FillMemory
Func_dfce: ; dfce (3:5fce)
	jp Func_dfe7

Func_dfd1: ; dfd1 (3:5fd1)
	ld bc, $80
	read_hl_from wCurRobotPointer
	ld de, $1ca
	add hl, de
	reg16swap de, hl
	ld hl, wCGB_BGPalsBuffer
	call CopyFromDEtoHL
Func_dfe7: ; dfe7 (3:5fe7)
	call WaitVideoTransfer
	ld a, [wNextVBlankFlags]
	or $40
	ld [wNextVBlankFlags], a
Func_dff2: ; dff2 (3:5ff2)
	ld a, [wNextVBlankFlags]
	and $40
	jp nz, Func_dff2
	xor a
Func_dffb: ; dffb (3:5ffb)
	cp $a
	jp nc, Func_e009
	push af
	call NextBattleFrame
	pop af
	inc a
	jp Func_dffb

Func_e009: ; e009 (3:6009)
	pop hl
	inc l
	pop bc
	ld a, c
	xor $1
	ld c, a
	jp Func_dfa1

Func_e013: ; e013 (3:6013)
	pop bc
	ret

INCLUDE "battle/intro_spiral.asm"

Data_e233: ; e233
	db $22, $22, $22, $21, $13, $22
	db $24, $31, $22, $2, $22, $22
	db $21, $42, $4, $22, $22, $22
	db $23, $24, $42, $22, $12, $21
	db $21, $21, $44, $22, $22, $44
	db $22, $12, $44, $22, $23, $10
	db $22, $22, $22, $42, $21, $11
	db $22, $22, $22, $23, $2, $22
	db $22, $22, $22, $20, $32, $22
	db $12, $22, $22, $22, $22, $4
	db $12, $22, $22, $22, $24, $20
	db $12, $22, $12, $22, $20, $22

Data_e27b: ; e27b
	db $0, $2, $0, $0
	db $0, $1, $80, $0
	db $0, $1, $0, $0
	db $0, $0, $80, $0
	db $0, $0, $40, $0

Func_e28f:: ; e28f
	push hl
	push de
	push bc
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
Func_e298: ; e298 (3:6298)
	ld hl, sp+$2
	ld a, [hl]
	cp $4
	jp nc, Func_e339
	ld hl, sp+$2
	ld a, [hl]
	add a
	add a
	ld b, a
	call GetHLAtSPPlus10
	call RightShiftHL
	ld a, l
	and $f
	ld l, a
	ld h, $0
	ld a, l
	or a
	jp z, Func_e32f
	dec a
	push af
	ld l, a
	ld h, $0
	ld de, $2
	call DivideHLByDESigned
	ld c, l
	ld b, h
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Data_e233
	add hl, de
	add hl, bc
	ld a, [hl]
	ld hl, sp+$3
	ld [hl], a
	pop af
	and $1
	jp z, Func_e2e8
	ld hl, sp+$1
	ld a, [hl]
	and $f
	ld hl, sp+$1
	ld [hl], a
	jp Func_e2f4

Func_e2e8: ; e2e8 (3:62e8)
	ld hl, sp+$1
	ld a, [hl]
	rrca
	rrca
	rrca
	rrca
	and $f
	ld hl, sp+$1
	ld [hl], a
Func_e2f4: ; e2f4 (3:62f4)
	ld hl, sp+$2
	ld a, [hl]
	or a
	jp z, Func_e313
	call GetHLAtSPPlus6
	push hl
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e27b
	add hl, de
	pop de
	call Func_fddb
	cp $ff
	jp nz, Func_e32f
Func_e313: ; e313 (3:6313)
	ld bc, $4
	ld hl, sp+$1
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e27b
	add hl, de
	push hl
	call GetHLAtSPPlus8
	pop de
	call CopyFromDEtoHL
	ld hl, sp+$1
	ld a, [hl]
	ld hl, sp+$0
	ld [hl], a
Func_e32f: ; e32f (3:632f)
	ld hl, sp+$2
	ld a, [hl]
	inc a
	ld hl, sp+$2
	ld [hl], a
	jp Func_e298

Func_e339: ; e339 (3:6339)
	ld hl, sp+$0
	ld a, [hl]
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_e342: ; e342
	db $0, $0, $0, $0
	db $0, $0, $99, $99
	db $0, $0, $c0, $0
	db $0, $0, $e6, $66
	db $0, $1, $1, $c
	db $0, $1, $33, $33
	db $0, $1, $1, $59
	db $0, $1, $80, $0
	db $0, $0, $80, $0
	db $0, $0, $99, $99
	db $0, $0, $b3, $33
	db $0, $0, $cc, $cc
	db $0, $0, $e6, $66
	db $0, $1, $0, $0
	db $0, $1, $19, $99
	db $0, $1, $33, $33
	db $0, $1, $4c, $cc
	db $0, $1, $66, $66
	db $0, $1, $80, $0
	db $0, $1, $99, $99
	db $0, $1, $b3, $33
	db $0, $1, $cc, $cc

Func_e39a:: ; e39a
	push de
	push bc
	push bc
	ld hl, sp+$0
	ld c, l
	ld b, h
	call GetHLAtSPPlus6
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_e342
	add hl, de
	pop de
	call MultiplyULongAtHLByUShortDE
	ld hl, sp+$0
	ld a, [hl]
	ld hl, sp+$1
	ld l, [hl]
	ld h, a
	pop bc
	pop bc
	pop bc
	ret

INCLUDE "battle/move_anim.asm"

Data_f74a: ; f74a
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

Data_f752: ; f752
	db $00, $00, $00, $00, $00, $00

Data_f758: ; f758
	db $ca, $de, $c4, $db, $ce, $de, $28, $bc, $ae, $b3, $cc, $de, $a6, $20, $b2, $c4, $de, $dd, $c3, $de, $b7, $c0, $21, $29, $00

Func_f771:: ; f771
	ld hl, -$ee
	add hl, sp
	ld sp, hl
	ld hl, $e5
	add hl, sp
	reg16swap de, hl
	ld hl, Data_f74a
	ld bc, $8
	call MemCopy
	read_hl_from wCurRobotPointer
	ld de, $16
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $68
	add hl, de
	write_hl_to_sp_plus $e4
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, Data_f752
	ld bc, $6
	call MemCopy
	ld hl, sp+$6
	pop de
	push hl
	ld hl, Data_f758
	call WriteHLToSPPlus4
	ld hl, $0
	call WriteHLToSPPlus6
	ldh a, [hSRAMBank]
	push af
	ld a, $3
	call GetSRAMBank_ReadOnly
	xor a
Func_f7c3: ; f7c3 (3:77c3)
	cp $4
	jp nc, Func_f7fd
	push af
	ld l, a
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$57
	add hl, de
	push hl
	ld l, a
	ld h, 0
	get_party_bot
	pop de
	ld bc, $23
	call MemCopy
	pop af
	inc a
	jp Func_f7c3

Func_f7fd: ; f7fd (3:77fd)
	pop af
	call GetSRAMBank
	read_hl_from_sp_plus $e4
	ld de, $b
	add hl, de
	ld c, l
	ld b, h
	push bc
	read_hl_from_sp_plus $e6
	ld de, $5
	add hl, de
	ld a, [hl]
	read_hl_from_sp_plus $e6
	ld de, $6
	add hl, de
	ld e, [hl]
	call Func_e015
	read_hl_from_sp_plus $e6
	ld de, $27
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, .skip_music
.loop
	call CheckSongFinished
	or a
	jp nz, .loop
	ld a, SONG_TRAINER_BATTLE
	call OverworldPlaySong
.skip_music
	call FillVisibleAreaWithBlankTile
	set_farcall_addrs_hli Func_61424
	ld c, $1
	ld e, $1
	ld a, $1
	call FarCall
	ld c, $5
	ld e, $14
	ld hl, $d
	call Func_c896
	ld hl, $e7
	add hl, sp
	write_hl_to_sp_plus $e3
	ld hl, $e3
	add hl, sp
	ld [hl], $0
Func_f86a: ; f86a (3:786a)
	ld hl, $e3
	add hl, sp
	ld a, [hl]
	cp $4
	jp nc, Func_f91d
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$55
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_f906
	ld e, a
	dec e
	ld hl, sp+$26
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$55
	add hl, de
	ld de, $1f
	add hl, de
	ld e, [hl]
	ld hl, sp+$2b
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $e3
	ld [hl], a
	ld hl, $e3
	add hl, sp
	ld l, [hl]
	ld h, $0
	mulhlby35
	reg16swap de, hl
	ld hl, sp+$55
	add hl, de
	inc hl
	reg16swap de, hl
	ld hl, sp+$8
	call LiteralStringInTree
	ld hl, sp+$8
	push hl
	ld hl, $e5
	add hl, sp
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $302
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
Func_f906: ; f906 (3:7906)
	ld hl, $e3
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e3
	add hl, sp
	ld [hl], a
	read_hl_from_sp_plus $e3
	inc hl
	write_hl_to_sp_plus $e3
	jp Func_f86a

Func_f91d: ; f91d (3:791d)
	xor a
	pop bc
Func_f91f: ; f91f (3:791f)
	read_hl_from_sp_plus $e4
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nc, Func_f980
	push bc
	push af
	ld a, [bc]
	ld e, a
	ld hl, sp+$28
	call GetRobotOrTrainerBaseStats
	set_farcall_addrs_hli LookUpRobotSpriteImage
	ld hl, sp+$53
	ld e, [hl]
	ld hl, sp+$2d
	ld a, [hl]
	call FarCall
	read_hl_from_sp_plus $e5
	ld [hl], a
	ld hl, sp+$35
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	pop af
	push af
	ld hl, sp+$a
	push hl
	ld l, a
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, $c02
	add hl, de
	pop de
	call PlaceStringDEatCoordHL
	pop af
	inc a
	pop bc
	ld hl, $7
	add hl, bc
	ld c, l
	ld b, h
	read_hl_from_sp_plus $e1
	inc hl
	write_hl_to_sp_plus $e1
	jp Func_f91f

Func_f980: ; f980 (3:7980)
	call ClearSprites
	ld hl, $e5
	add hl, sp
	reg16swap de, hl
	xor a
	ld hl, $e4
	add hl, sp
	ld [hl], a
Func_f991: ; f991 (3:7991)
	cp $8
	jp nc, Func_f9d2
	push af
	ld a, [de]
	cp $ff
	jp z, Func_f9cc
	push de
	set_farcall_addrs_hli LoadSpriteGFX
	pop de
	push de
	ld a, [de]
	ld e, a
	ld d, $0
	ld hl, $e8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e8
	add hl, sp
	ld [hl], a
	dec a
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	add hl, hl
	add hl, hl
	add hl, de
	ld e, $0
	ld c, $4
	call FarCall
	pop de
Func_f9cc: ; f9cc (3:79cc)
	pop af
	inc a
	inc de
	jp Func_f991

Func_f9d2: ; f9d2 (3:79d2)
	set_farcall_addrs_hli SetOAMUpdatePointer
	xor a
	call FarCall
	ld hl, $e5
	add hl, sp
	ld c, l
	ld b, h
	ld e, $0
	ld hl, $e4
	add hl, sp
	ld [hl], e
Func_f9ee: ; f9ee (3:79ee)
	ld a, e
	cp $8
	jp nc, Func_fa45
	push bc
	ld a, [bc]
	cp $ff
	jp z, Func_fa3f
	push de
	ld a, e
	ld b, $4
	call DivideAbyB
	add a
	add a
	add a
	add a
	add a
	add a
	add a
	add $10
	ld l, a
	pop de
	push de
	push hl
	ld a, e
	and $3
	add a
	add a
	add a
	ld d, a
	add a
	add d
	add $18
	push af
	set_farcall_addrs_hli UpdateCurSprite
	pop af
	pop hl
	ld d, l
	ld e, a
	ld hl, $e8
	add hl, sp
	ld a, [hl]
	inc a
	ld hl, $e8
	add hl, sp
	ld [hl], a
	dec a
	add a
	add a
	ld bc, $200
	call FarCall
	pop de
Func_fa3f: ; fa3f (3:7a3f)
	inc e
	pop bc
	inc bc
	jp Func_f9ee

Func_fa45: ; fa45 (3:7a45)
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	read_hl_from_sp_plus $e4
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	call GetHLAtSPPlus4
	pop de
	call CopyUntilNull
	ld de, String_fa7b
	call CopyUntilNull
	ld c, $83
	ld hl, sp+$0
	reg16swap de, hl
	ld hl, $10e
	call PrintMapText_
	ld hl, $ee
	add hl, sp
	ld sp, hl
	ret

String_fa7b: ; fa7b
	dstr " (かﾞ)"

INCLUDE "battle/intro.asm"

Func_fdb7: ; fdb7 (3:7db7)
	ld c, $4
	scf
	ccf
.asm_fdbb
	ld a, [de]
	ld b, a
	ld a, [hl]
	sbc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_fdbb
	ld a, c
	jr nc, .asm_fdc8
	inc a
.asm_fdc8
	ret

Func_fdc9: ; fdc9 (3:7dc9)
	ld c, $4
	scf
	ccf
.asm_fdcd
	ld a, [de]
	ld b, a
	ld a, [hl]
	adc b
	ld [hld], a
	dec de
	dec c
	jr nz, .asm_fdcd
	ld a, c
	jr nc, .asm_fdda
	inc a
.asm_fdda
	ret

Func_fddb: ; fddb (3:7ddb)
	ld c, $4
.asm_fddd
	ld a, [de]
	inc de
	ld b, a
	ld a, [hli]
	sub b
	jr c, .asm_fdeb
	jr nz, .asm_fdee
	dec c
	jr nz, .asm_fddd
	xor a
	ret

.asm_fdeb
	ld a, $ff
	ret

.asm_fdee
	ld a, $1
	ret

Func_fdf1: ; fdf1
	ret

Func_fdf2: ; fdf2
	ret


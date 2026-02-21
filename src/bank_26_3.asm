INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 26, 3", ROMX

Func_9a174:
	push af
	ldh a, [rLCDC]
	ld l, a
	push hl
	set_farcall_addrs_hli Func_6183
	pop hl
	pop af
	or a
	jp nz, .asm_9a193
	ld a, l
	and $7f
	call FarCall
	jp .asm_9a199
.asm_9a193:
	ld a, l
	or $80
	call FarCall
.asm_9a199:
	ret

Func_9a19a:
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	jp FarCall

Func_9a1aa:
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

LandmarkSign::
	push hl
	add sp, -$40
	ld hl, sp+$40
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to_sp_plus $3f
	ld hl, -1
	write_hl_to_sp_plus $41
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_9a377
	call Func_9a391
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, sp+$3d
	call PrintCharacterFromTree
	ld hl, sp+$1
	call Func_292b
	add $2
	ld l, a
	push hl
	ld a, $14
	sub l
	ld b, $2
	call DivideAbyB
	push af
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_da901
	pop af
	pop hl
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld h, l
	ld l, $0
	inc hl
	inc hl
	inc hl
	inc hl
	call FarCall
	push hl
	ld c, $5
	ld hl, sp+$3
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	ld hl, sp+$4
	ld [hl], $0
Func_9a236:
	ld hl, sp+$4
	ld a, [hl]
	cp $3c
	jp nc, Func_9a25d
	call NextOverworldFrame
	ld hl, sp+$4
	ld a, [hl]
	cp $10
	jp c, Func_9a253
	call GetJoyPressed
	or a
	jp z, Func_9a253
	jp Func_9a25d

Func_9a253:
	ld hl, sp+$4
	ld a, [hl]
	inc a
	ld hl, sp+$4
	ld [hl], a
	jp Func_9a236

Func_9a25d:
	callba_hli Func_8f44
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	add sp, $42
	ret

Func_9a28c::
	push hl
	add sp, -$3e
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	call Func_9a377
	call Func_9a391
	ld de, Data_9a36c
	ld hl, sp+$1
	call strcpy
	ld hl, sp+$0
	ld [hl], $0
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2bc
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a2e4
Func_9a2bc:
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$5
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $64
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a2e4:
	ld hl, sp+$0
	ld a, [hl]
	or a
	jp nz, Func_9a2fa
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld a, l
	or h
	jp z, Func_9a322
Func_9a2fa:
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	ld de, $30
	add hl, de
	ld a, l
	ld hl, sp+$6
	ld [hl], a
	read_hl_from_sp_plus $40
	ld de, $a
	call DivideHLByDESigned
	reg16swap de, hl
	write_hl_to_sp_plus $40
	ld hl, sp+$0
	ld [hl], $1
Func_9a322:
	read_hl_from_sp_plus $40
	ld de, $30
	add hl, de
	ld e, l
	ld hl, sp+$7
	ld [hl], e
	ld c, $5
	ld hl, sp+$1
	reg16swap de, hl
	ld hl, $ff04
	call Func_2951
	push hl
	xor a
Func_9a33e:
	cp $3c
	jp nc, Func_9a34c
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp Func_9a33e

Func_9a34c:
	callba_hli Func_8f44
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	add sp, $40
	ret

Data_9a36c:
	dstr "(ちか   0かい)"

Func_9a377:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	ret

Func_9a384:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call DoublePushBGMapRegion
	pop bc
	ret

Func_9a391:
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	ret

CheckObjectsOccupyingSameTile::
	push af
	push de
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld hl, sp+$3
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$0
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, de
	add hl, bc
	reg16swap de, hl
	read_hl_from wObjectStructPointer
	add hl, de
	inc hl
	inc hl
	inc hl
	cp [hl]
	jp nz, Func_9a419
	ld a, $1
	jp Func_9a41a

Func_9a419:
	xor a
Func_9a41a:
	pop bc
	pop bc
	ret

Func_9a41d:: ; 9a41d
	push bc
	ld a, [wOverworldTilemapSelector]
	or a
	jp z, .asm_9a42a
	ld a, $98
	jp .asm_9a42c
.asm_9a42a:
	ld a, $9c
.asm_9a42c:
	ld [wBGMapHi], a
	ld a, [wBGMapHi]
	cp $98
	jp nz, .asm_9a43d
	ld bc, $9800
	jp .asm_9a440
.asm_9a43d:
	ld bc, $9c00
.asm_9a440:
	ld a, [wSCX]
	add a, $f0
	rrca
	rrca
	rrca
	and $1f
	ld e, a
	ld a, [wSCY]
	add a, $f0
	rrca
	rrca
	rrca
	and $1f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld d, $00
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$00
	ld [hl], $00
.asm_9a467:
	ld hl, sp+$00
	ld a, [hl]
	cp $0b
	jp nc, .asm_9a4fd
	push bc
	ld l, c
	ld h, b
	ld e, c
	ld d, b
	ld c, $00
.asm_9a476:
	ld a, c
	cp $0c
	jp nc, .asm_9a4d6
	push de
	push bc
	set_farcall_addrs_hli Func_9eb4
	pop bc
	pop de
	push bc
	push de
	ld a, [wMapY]
	ld hl, sp+$06
	add a, [hl]
	dec a
	ld e, a
	ld a, [wMapX]
	add a, c
	dec a
	call FarCall
	ld c, l
	ld b, h
	pop de
	push de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld hl, $001e
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	pop de
	ld a, e
	and $e0
	ld l, a
	ld h, d
	inc de
	inc de
	ld a, e
	and $1f
	ld e, a
	ld d, $00
	ld a, l
	or e
	ld l, a
	ld a, h
	or d
	ld h, a
	push de
	push hl
	pop de
	pop hl
	pop bc
	inc c
	jp .asm_9a476
.asm_9a4d6:
	pop bc
	ld hl, $0040
	add hl, bc
	ld a, l
	and $e0
	ld e, a
	ld a, h
	and $03
	ld d, a
	ld a, c
	and $1f
	ld l, a
	ld a, b
	and $fc
	ld h, a
	ld a, l
	or e
	ld l, a
	ld a, h
	or d
	ld h, a
	ld c, l
	ld b, h
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
	jp .asm_9a467
.asm_9a4fd:
	ld a, [wSystemType]
	cp $11
	jp nz, .asm_9a5df
	ldh a, [rVBK]
	or $01
	ldh [rVBK], a
	ld a, [wBGMapHi]
	cp $98
	jp nz, .asm_9a519
	ld bc, $9800
	jp .asm_9a51c
.asm_9a519:
	ld bc, $9c00
.asm_9a51c:
	ld a, [wSCX]
	add a, $f0
	rrca
	rrca
	rrca
	and $1f
	ld e, a
	ld a, [wSCY]
	add a, $f0
	rrca
	rrca
	rrca
	and $1f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld d, $00
	add hl, de
	add hl, bc
	ld c, l
	ld b, h
	ld hl, sp+$00
	ld [hl], $00
.asm_9a543:
	ld hl, sp+$00
	ld a, [hl]
	cp $0b
	jp nc, .asm_9a5d9
	push bc
	ld l, c
	ld h, b
	ld e, c
	ld d, b
	ld c, $00
.asm_9a552:
	ld a, c
	cp $0c
	jp nc, .asm_9a5b2
	push de
	push bc
	set_farcall_addrs_hli Func_9f1e
	pop bc
	pop de
	push bc
	push de
	ld a, [wMapY]
	ld hl, sp+$06
	add a, [hl]
	dec a
	ld e, a
	ld a, [wMapX]
	add a, c
	dec a
	call FarCall
	ld c, l
	ld b, h
	pop de
	push de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld hl, $001e
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	pop de
	ld a, e
	and $e0
	ld l, a
	ld h, d
	inc de
	inc de
	ld a, e
	and $1f
	ld e, a
	ld d, $00
	ld a, l
	or e
	ld l, a
	ld a, h
	or d
	ld h, a
	push de
	push hl
	pop de
	pop hl
	pop bc
	inc c
	jp .asm_9a552
.asm_9a5b2:
	pop bc
	ld hl, $0040
	add hl, bc
	ld a, l
	and $e0
	ld e, a
	ld a, h
	and $03
	ld d, a
	ld a, c
	and $1f
	ld l, a
	ld a, b
	and $fc
	ld h, a
	ld a, l
	or e
	ld l, a
	ld a, h
	or d
	ld h, a
	ld c, l
	ld b, h
	ld hl, sp+$00
	ld a, [hl]
	inc a
	ld hl, sp+$00
	ld [hl], a
	jp .asm_9a543
.asm_9a5d9:
	ldh a, [rVBK]
	and $fe
	ldh [rVBK], a
.asm_9a5df:
	ld a, $01
	call Func_9a174
	ld a, [wOverworldTilemapSelector]
	or a
	jp nz, .asm_9a5f0
	ld a, $01
	jp .asm_9a5f1
.asm_9a5f0:
	xor a
.asm_9a5f1:
	call ToggleBGMapSelect
	pop bc
	ret

Data_9a5f6: ; 9a5f6
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0d, $0d
	db $0e, $0f, $10, $11, $11, $12, $13, $14, $15, $15, $15, $16, $17, $17, $18, $19
	db $1a, $1b

Data_9a618: ; 9a618
	db $00, $01, $02, $03, $03, $04, $05, $06, $07, $08, $09

Data_9a623: ; 9a623
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
	db $20, $21

Data_9a645: ; 9a645
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a

Data_9a650: ; 9a650
	db $00, $15, $05, $24, $01, $00, $00, $09, $00, $00, $00, $00, $06, $21, $1b, $1b
	db $02, $09, $16, $07, $07, $0c, $11, $10, $11, $11, $10, $00, $10, $10, $00, $00
	db $15, $00

Data_9a672: ; 9a672
REPT 11
	db $0
ENDR

Data_9a67d: ; 9a67d
	db $00, $0d, $04, $05, $0d, $00, $00, $06, $00, $00, $00, $00, $01, $08, $08, $08
	db $05, $0f, $06, $0a, $04, $06, $05, $0e, $05, $05, $0e, $00, $06, $06, $00, $05
	db $0c, $00

Data_9a69f: ; 9a69f
REPT 11
	db $0
ENDR

LoadEmote::
	push af
	push de
	push bc
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a6c7
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a6c7:
	pop bc
	pop de
	ld hl, sp+$1
	ld a, [hl]
	cp $22
	jp nc, Func_9a780
	push de
	push bc
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a5f6
	add hl, de
	ld c, [hl]
	ld de, Emotes_c4000
	ld a, BANK(Emotes_c4000)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a623
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_c5b26
	ld a, BANK(EmoteAttrs_c5b26)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_9a75a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp Func_9a771

Func_9a75a:
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a650
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a67d
	add hl, de
	ld e, [hl]
	call MoveEmote
Func_9a771:
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
	jp Func_9a834

Func_9a780:
	push de
	push bc
	ld hl, sp+$5
	ld a, [hl]
	add -$21
	ld hl, sp+$5
	ld [hl], a
	set_farcall_addrs_hli LoadEmoteGFX
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a618
	add hl, de
	ld c, [hl]
	ld de, Emotes_b2418
	ld a, BANK(Emotes_b2418)
	call FarCall
	set_farcall_addrs_hli DecompressEmoteAttrs
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a645
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_b3607
	ld a, BANK(EmoteAttrs_b3607)
	call FarCall
	write_hl_to wc82e
	set_farcall_addrs_hli Func_d9f7e
	pop bc
	pop de
	ld l, c
	ld h, $0
	ld h, l
	ld l, $0
	ld c, l
	ld b, h
	ld d, $0
	read_hl_from wc82e
	call FarCall
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld a, [hl]
	or a
	jp nz, .not_over_player
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wPlayerMapX]
	call MoveEmote
	jp .done_show_emote

.not_over_player
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a672
	add hl, de
	ld a, [hl]
	ld hl, sp+$1
	ld e, [hl]
	ld d, $0
	ld hl, Data_9a69f
	add hl, de
	ld e, [hl]
	call MoveEmote
.done_show_emote
	ld l, $50
	push hl
	ld c, $50
	ld e, $0
	xor a
	call Func_9a8b1
	pop bc
Func_9a834:
	ld hl, sp+$1
	ld a, [hl]
	cp $c
	jp z, Func_9a844
	ld hl, sp+$1
	ld a, [hl]
	cp $12
	jp nz, Func_9a848
Func_9a844:
	xor a
	ld [wc85a], a
Func_9a848:
	pop bc
	ret

Func_9a84a::
	call NextOverworldFrame
	set_farcall_addrs_hli UpdateSprites
	ld c, $0
	ld e, $0
	ld a, [wPlayerFacing]
	call FarCall
	cp $1
	jp z, Func_9a86a
	jp Func_9a87b

Func_9a86a:
	callba_hli HandleNPCStep
	jp Func_9a84a

Func_9a87b:
	ret

Func_9a87c::
	read_hl_from wc82e
	ld a, l
	or h
	jp z, Func_9a896
	read_hl_from wc82e
	call Func_9a1aa
	ld hl, $0
	write_hl_to wc82e
Func_9a896:
	ret

MoveEmote:: ; 9a897
	add -5
	ld [wc832], a
	ld a, e
	add -4
	ld [wc833], a
	callba_hli MoveEmote_
	ret

Func_9a8b1:
	ld [wc834], a
	ld a, e
	ld [wc835], a
	ld a, c
	ld [wc836], a
	ld hl, sp+$2
	ld a, [hl]
	ld [wc837], a
	ret

Func_9a8c3:: ; 9a8c3
	push bc
	push bc
	push bc
	push bc
	call Func_9a377
	ld hl, sp+$06
	ld [hl], $00
	set_farcall_addrs_hli Func_93370
	ld hl, sp+$00
	call FarCall
	ld hl, sp+$03
	ld l, [hl]
	ld h, $00
	ld de, $003c
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$04
	ld l, [hl]
	ld h, $00
	add hl, de
	ld c, l
	ld b, h
	push bc
	set_farcall_addrs_hli Func_83e56
	call FarCall
	or a
	jp z, .asm_9a90d
	cp $ff
	jp nz, .asm_9a93e
.asm_9a90d:
	set_farcall_addrs_hli Func_17e95
	ld c, $03
	ld e, $14
	ld hl, sp+$08
	ld l, [hl]
	ld h, $00
	call FarCall
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9abb6
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $03
	ld hl, sp+$08
	ld [hl], a
.asm_9a93e:
	ld hl, sp+$07
	ld [hl], $00
	ld c, $00
.asm_9a944:
	ld a, c
	cp $03
	jp nc, .asm_9a989
	ld l, c
	ld h, $00
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wc347
	add hl, de
	ld de, $0010
	add hl, de
	ld a, [hl]
	cp $01
	jp nz, .asm_9a985
	push bc
	set_farcall_addrs_hli Func_6bdfa
	pop bc
	push bc
	ld a, c
	call FarCall
	pop bc
	or a
	jp z, .asm_9a97e
	cp $ff
	jp nz, .asm_9a985
.asm_9a97e:
	ld hl, sp+$07
	ld a, [hl]
	inc a
	ld hl, sp+$07
	ld [hl], a
.asm_9a985:
	inc c
	jp .asm_9a944
.asm_9a989:
	ld hl, sp+$07
	ld a, [hl]
	or a
	jp z, .asm_9a9db
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, sp+$08
	ld l, [hl]
	ld h, $00
	call FarCall
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9abcf
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $03
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, sp+$07
	ld l, [hl]
	ld h, $00
	push hl
	ld hl, Data_9abe5
	push hl
	call PlaceString
	pop bc
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $05
	ld hl, sp+$08
	ld [hl], a
.asm_9a9db:
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $0007
	call FarCall
	or a
	jp z, .asm_9aa0b
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $02
	call FarCall
	cp $01
	jp nz, .asm_9aa0a
	ld a, $01
	jp .asm_9aa0b
.asm_9aa0a:
	xor a
.asm_9aa0b:
	pop bc
	push bc
	or a
	jp z, .asm_9aa2b
	ld hl, $0474
	ld de, $0168
	ld a, c
	sub e
	ld a, b
	sbc a, d
	jp c, .asm_9aa25
	ld a, c
	sub l
	ld a, b
	sbc a, h
	jp c, .asm_9aa2a
.asm_9aa25:
	ld a, $01
	jp .asm_9aa2b
.asm_9aa2a:
	xor a
.asm_9aa2b:
	or a
	jp z, .asm_9aa73
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, sp+$08
	ld l, [hl]
	ld h, $00
	call FarCall
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9abf9
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $03
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9ac0e
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $05
	ld hl, sp+$08
	ld [hl], a
.asm_9aa73:
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $12
	call FarCall
	pop bc
	push bc
	or a
	jp z, .asm_9aaa3
	ld hl, $0384
	ld de, $0438
	ld a, c
	sub l
	ld a, b
	sbc a, h
	jp c, .asm_9aaa2
	ld a, c
	sub e
	ld a, b
	sbc a, d
	jp nc, .asm_9aaa2
	ld a, $01
	jp .asm_9aaa3
.asm_9aaa2:
	xor a
.asm_9aaa3:
	or a
	jp z, .asm_9aaeb
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, sp+$08
	ld l, [hl]
	ld h, $00
	call FarCall
	ld hl, sp+$08
	ld a, [hl]
	inc a
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9ac16
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $03
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9ac2c
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$08
	ld a, [hl]
	add a, $05
	ld hl, sp+$08
	ld [hl], a
.asm_9aaeb:
	set_farcall_addrs_hli CheckEventFlag
	ld hl, $00b9
	call FarCall
	ld hl, sp+$09
	ld [hl], a
	set_farcall_addrs_hli CheckUnlockedArea
	ld a, $0b
	call FarCall
	cp $01
	jp nz, .asm_9ab23
	ld hl, sp+$09
	ld a, [hl]
	cp $01
	jp nz, .asm_9ab23
	ld hl, sp+$09
	ld [hl], $01
	jp .asm_9ab27
.asm_9ab23:
	ld hl, sp+$09
	ld [hl], $00
.asm_9ab27:
	pop bc
	ld hl, sp+$07
	ld a, [hl]
	or a
	jp z, .asm_9ab4e
	ld hl, $0438
	ld de, $04b0
	ld a, c
	sub l
	ld a, b
	sbc a, h
	jp c, .asm_9ab4a
	ld a, c
	sub e
	ld a, b
	sbc a, d
	jp nc, .asm_9ab4a
	ld hl, sp+$07
	ld [hl], $01
	jp .asm_9ab4e
.asm_9ab4a:
	ld hl, sp+$07
	ld [hl], $00
.asm_9ab4e:
	ld hl, sp+$07
	ld a, [hl]
	or a
	jp z, .asm_9ab99
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, sp+$06
	ld l, [hl]
	ld h, $00
	call FarCall
	ld hl, sp+$06
	ld a, [hl]
	inc a
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9ac34
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$06
	ld a, [hl]
	add a, $03
	ld e, a
	ld a, $01
	call SetStringStartState
	ld hl, Data_9ac4c
	push hl
	call PlaceString
	pop bc
	ld hl, sp+$06
	ld a, [hl]
	add a, $05
	ld hl, sp+$06
	ld [hl], a
.asm_9ab99:
	call Func_9a384
	ld hl, sp+$06
	ld a, [hl]
	or a
	jp z, .asm_9abb1
	set_farcall_addrs_hli Func_ac37
	call FarCall
.asm_9abb1:
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_9abb6:
	dstr "(たﾞいくの)ケン(さんかﾞ かえってきてるよ)"

Data_9abcf:
	dstr "ハケン(にたﾞした) ロホﾞホﾟン(かﾞ)"

Data_9abe5:
	dstr "%dハﾟーティー (かえってきてるよ)"

Data_9abf9:
	dstr "(よるのかﾞっこうに あさ6しﾞまてﾞ)"

Data_9ac0e:
	dstr "(はいれるよ)"

Data_9ac16:
	dstr "(まほﾞろしむらに こﾞこﾞ6しﾞまてﾞ)"

Data_9ac2c:
	dstr "(はいれるよ)"

Data_9ac34:
	dstr "メイシﾞ(とﾞうくつに こﾞこﾞ8しﾞまてﾞ)"

Data_9ac4c:
	dstr "(はいれるよ)"

Data_9ac54:
IF DEF(SUN)
	db $4d, $0a, $15, $20, $36, $42, $58, $62, $6b, $76, $2c
	db $59, $16, $21, $2a, $38, $43, $4e, $64, $6d, $77, $0f
	db $eb, $dc, $db, $d5, $d2, $d0, $cd, $cb, $ca, $c8, $ed
	db $4e, $0b, $0c, $24, $38, $3b, $42, $45, $4a, $4b, $4f
	db $50, $48, $4a, $4b, $4d, $52, $55, $5b, $5c, $6b, $6d
	db $12, $0e, $2c, $3e, $44, $53, $64, $75, $8c, $91, $0a
	db $91, $8c, $75, $64, $53, $44, $3e, $2c, $12, $0e, $0d
ELIF DEF(STAR)
	db $6b, $42, $58, $62, $0a, $4d, $76, $20, $36, $15, $2c
	db $43, $38, $64, $16, $6d, $59, $77, $4e, $21, $2a, $0f
	db $c8, $ca, $cb, $cd, $d0, $d2, $d5, $db, $dc, $eb, $ed
	db $4a, $0c, $3b, $42, $38, $45, $4b, $38, $24, $0b, $4f
	db $55, $4d, $4b, $5b, $5c, $50, $6b, $4a, $48, $52, $6d
	db $8c, $3e, $75, $64, $12, $91, $2c, $53, $44, $0e, $0a
	db $0e, $12, $2c, $3e, $44, $53, $64, $75, $8c, $91, $0d
ENDC

Data_9aca1:
	db $01, $01, $02, $00, $02, $03, $03

Data_9aca8:
	db $02, $04, $18, $e7, $09, $f6, $00, $00
	db $03, $02, $91, $00, $00, $00, $00, $00
	db $01, $02, $47, $11, $00, $00, $00, $00
	db $02, $06, $02, $20, $80, $00, $32, $b2
	db $02, $04, $40, $bf, $0f, $f0, $00, $00
	db $01, $02, $08, $00, $00, $00, $00, $00
	db $02, $04, $30, $cf, $16, $e9, $00, $00

Func_9ace0:: ; 9ace0
	push af
	push bc
	add sp, $8a
	push de
	ld l, $00
.asm_9ace7:
	ld a, l
	cp $08
	jp nc, .asm_9ad08
	push hl
	ld a, $07
	sub l
	call SetVolume
	xor a
.asm_9acf5:
	cp $0a
	jp nc, .asm_9ad03
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp .asm_9acf5
.asm_9ad03:
	pop hl
	inc l
	jp .asm_9ace7
.asm_9ad08:
	set_farcall_addrs_hli Func_8f44
	call FarCall
	set_farcall_addrs_hli Func_da901
	ld de, $0f03
	ld hl, $0207
	call FarCall
	push hl
	ld e, $07
	ld hl, Data_9af5c
	call Func_2a3e
	set_farcall_addrs_hli Func_1c11
	ld hl, sp+$11
	push de
	push hl
	pop de
	pop hl
	ld hl, $0066
	call FarCall
	ld hl, sp+$05
	ld [hl], a
	xor a
.asm_9ad4e:
	cp $08
	jp nc, .asm_9ad6b
	push af
	call SetVolume
	xor a
.asm_9ad58:
	cp $0a
	jp nc, .asm_9ad66
	push af
	call NextOverworldFrame
	pop af
	inc a
	jp .asm_9ad58
.asm_9ad66:
	pop af
	inc a
	jp .asm_9ad4e
.asm_9ad6b:
	set_farcall_addrs_hli Func_8f44
	call FarCall
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	pop de
	ld hl, sp+$01
	ld a, [hl]
	cp $ff
	jp nz, .asm_9ad95
	xor a
	jp .asm_9af59
.asm_9ad95:
	push de
	set_farcall_addrs_hli Func_1c27
	ld hl, sp+$0f
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$05
	call FarCall
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$76
	ld [hl], d
	ld hl, sp+$75
	ld [hl], e
	pop de
	ld hl, sp+$74
	ld a, [hl]
	cp $ff
	jp z, .asm_9adc7
	ld hl, sp+$73
	ld a, [hl]
	cp $ff
	jp nz, .asm_9adcb
.asm_9adc7:
	xor a
	jp .asm_9af59
.asm_9adcb:
	push de
	ld hl, sp+$7b
	ld a, [hl]
	cp $31
	jp z, .asm_9ae1c
	cp $28
	jp z, .asm_9ae15
	cp $24
	jp z, .asm_9ae0e
	cp $22
	jp z, .asm_9ae07
	cp $1d
	jp z, .asm_9ae00
	cp $1c
	jp z, .asm_9adf9
	cp $1a
	jp nz, .asm_9ae20
	ld hl, sp+$04
	ld [hl], $04
	jp .asm_9ae20
.asm_9adf9:
	ld hl, sp+$04
	ld [hl], $06
	jp .asm_9ae20
.asm_9ae00:
	ld hl, sp+$04
	ld [hl], $02
	jp .asm_9ae20
.asm_9ae07:
	ld hl, sp+$04
	ld [hl], $00
	jp .asm_9ae20
.asm_9ae0e:
	ld hl, sp+$04
	ld [hl], $05
	jp .asm_9ae20
.asm_9ae15:
	ld hl, sp+$04
	ld [hl], $01
	jp .asm_9ae20
.asm_9ae1c:
	ld hl, sp+$04
	ld [hl], $03
.asm_9ae20:
	ld hl, sp+$03
	ld [hl], $01
	ld hl, sp+$02
	ld [hl], $00
	ld c, $00
.asm_9ae2a:
	ld a, c
	cp $08
	jp nc, .asm_9aeae
	inc c
	dec c
	jp nz, .asm_9ae4f
	ld hl, sp+$04
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_9aca8
	add hl, de
	ld a, [hl]
	ld hl, sp+$76
	cp [hl]
	jp z, .asm_9ae4c
	ld hl, sp+$03
	ld [hl], $00
.asm_9ae4c:
	jp .asm_9aeaa
.asm_9ae4f:
	ld a, c
	cp $01
	jp nz, .asm_9ae70
	ld hl, sp+$04
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_9aca8
	add hl, de
	inc hl
	ld a, [hl]
	ld hl, sp+$75
	cp [hl]
	jp z, .asm_9ae6d
	ld hl, sp+$03
	ld [hl], $00
.asm_9ae6d:
	jp .asm_9aeaa
.asm_9ae70:
	ld hl, sp+$75
	ld a, [hl]
	add a, $02
	ld l, a
	ld a, c
	cp l
	jp c, .asm_9ae7e
	jp .asm_9aeae
.asm_9ae7e:
	ld hl, sp+$04
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data_9aca8
	add hl, de
	ld e, c
	ld d, $00
	add hl, de
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$03
	add hl, de
	cp [hl]
	jp z, .asm_9ae9d
	ld hl, sp+$03
	ld [hl], $00
.asm_9ae9d:
	ld hl, sp+$02
	ld a, [hl]
	ld e, c
	ld d, $00
	ld hl, sp+$03
	add hl, de
	add a, [hl]
	ld hl, sp+$02
	ld [hl], a
.asm_9aeaa:
	inc c
	jp .asm_9ae2a
.asm_9aeae:
	ld hl, sp+$03
	ld a, [hl]
	cp $01
	jp nz, .asm_9aed0
	ld hl, sp+$04
	ld l, [hl]
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_9ac54
	add hl, de
	ld de, $000a
	add hl, de
	ld c, [hl]
	jp .asm_9aef1
.asm_9aed0:
	ld hl, sp+$02
	ld l, [hl]
	ld h, $00
	ld de, $000a
	call DivideHLByDESigned
	push de
	ld hl, sp+$06
	ld l, [hl]
	ld h, $00
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_9ac54
	add hl, de
	pop de
	add hl, de
	ld c, [hl]
.asm_9aef1:
	ld hl, sp+$04
	ld e, [hl]
	ld d, $00
	ld hl, Data_9aca1
	add hl, de
	ld a, [hl]
	cp $03
	jp z, .asm_9af19
	cp $02
	jp z, .asm_9af15
	cp $01
	jp z, .asm_9af12
	or a
	jp nz, .asm_9af19
	dec c
	jp .asm_9af19
.asm_9af12:
	jp .asm_9af19
.asm_9af15:
	dec c
	jp .asm_9af19
.asm_9af19:
	pop de
	ld hl, sp+$76
	ld l, [hl]
	push hl
	ld l, e
	push hl
	ld hl, sp+$06
	ld e, [hl]
	ld d, $00
	ld hl, Data_9aca1
	add hl, de
	ld a, [hl]
	inc a
	ld e, a
	ld hl, sp+$7d
	ld a, [hl]
	call Func_9af6f
	pop bc
	pop bc
	cp $ff
	jp z, .asm_9af57
	ld hl, sp+$79
	ld a, [hl]
	and $07
	ld b, a
	ld a, $01
	call LeftShiftA
	push af
	ld hl, sp+$7b
	ld l, [hl]
	ld h, $00
	ld de, $0008
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	pop af
	or [hl]
	ld [hl], a
.asm_9af57:
	ld a, $01
.asm_9af59:
	add sp, $7a
	ret

Data_9af5c:
	dstr "リモコン(の)ホﾞタン(をおしてね)"

Func_9af6f:
	push af
	push de
	push bc
	add sp, $be
	ld hl, sp+$01
	ld [hl], $00
	ld hl, sp+$47
	ld l, [hl]
	ld h, $00
	ld de, $0008
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$47
	ld a, [hl]
	and $07
	ld b, a
	ld a, $01
	call LeftShiftA
	and e
	jp z, .asm_9af9a
	jp .asm_9b233
.asm_9af9a:
	set_farcall_addrs_hli GetBanks
	ld de, $0019
	ld a, $03
	call FarCall
	push af
	ld hl, sp+$46
	ld a, [hl]
	cp $04
	jp z, .asm_9b026
	cp $03
	jp z, .asm_9b005
	cp $02
	jp z, .asm_9afe5
	cp $01
	jp nz, .asm_9b043
	set_farcall_addrs_hli GetName
	ld c, $0a
	ld hl, sp+$26
	push hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $00
	ld de, $0400
	add hl, de
	pop de
	call FarCall
	jp .asm_9b043
.asm_9afe5:
	set_farcall_addrs_hli GetName
	ld c, $08
	ld hl, sp+$26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$44
	ld l, [hl]
	ld h, $00
	inc h
	inc h
	call FarCall
	jp .asm_9b043
.asm_9b005:
	set_farcall_addrs_hli GetName
	ld c, $05
	ld hl, sp+$26
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$44
	ld a, [hl]
	and $3f
	ld l, a
	ld h, $00
	call FarCall
	jp .asm_9b043
.asm_9b026:
	set_farcall_addrs_hli GetName
	ld c, $06
	ld hl, sp+$26
	push hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $00
	ld de, $05ff
	add hl, de
	pop de
	call FarCall
.asm_9b043:
	pop af
	call GetSRAMBank
	ld a, [wc859]
	or a
	jp z, .asm_9b0ad
	ld a, $31
	call OverworldPlaySFX
	ld hl, sp+$4c
	ld e, [hl]
	ld d, $00
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $00
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	read_hl_from wBlockdataPointer
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $00
	add hl, de
	ld a, [hl]
	ld hl, sp+$00
	ld [hl], a
	ld hl, sp+$4c
	ld e, [hl]
	ld d, $00
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $00
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	read_hl_from wBlockdataPointer
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $00
	add hl, de
	ld a, [wc859]
	ld [hl], a
	set_farcall_addrs_hli Func_8f44
	call FarCall
.asm_9b0ad:
	ld hl, sp+$24
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$06
	call LiteralStringInTree
	dec hl
	ld de, Data_9b239
	call strcpy
	ld hl, sp+$06
	call WriteHLToSPPlus4
	ld hl, $0000
	call WriteHLToSPPlus6
	ld a, $03
	ld [wc396End], a
	ld l, $12
	push hl
	ld c, $14
	ld e, $00
	xor a
	call PushBGMapRegion_NoWaitBefore
	pop bc
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, $000d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $00
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$02
	push de
	push hl
	pop de
	pop hl
	ld hl, $010e
	call FarCall
	set_farcall_addrs_hli Func_8f44
	call FarCall
	ld hl, sp+$44
	ld a, [hl]
	cp $04
	jp z, .asm_9b189
	cp $03
	jp z, .asm_9b16f
	cp $02
	jp z, .asm_9b156
	cp $01
	jp nz, .asm_9b1a1
	set_farcall_addrs_hli Func_5a0e0
	ld c, $00
	ld e, $01
	ld hl, sp+$42
	ld a, [hl]
	inc a
	call FarCall
	ld hl, sp+$01
	ld [hl], a
	jp .asm_9b1a1
.asm_9b156:
	set_farcall_addrs_hli Func_6af0d
	ld e, $00
	ld hl, sp+$42
	ld a, [hl]
	call FarCall
	ld hl, sp+$01
	ld [hl], a
	jp .asm_9b1a1
.asm_9b16f:
	set_farcall_addrs_hli Func_4ed5d
	ld e, $00
	ld hl, sp+$42
	ld a, [hl]
	inc a
	call FarCall
	ld hl, sp+$01
	ld [hl], a
	jp .asm_9b1a1
.asm_9b189:
	set_farcall_addrs_hli GiveRobot
	ld c, $14
	ld e, $00
	ld hl, sp+$42
	ld a, [hl]
	call FarCall
	ld hl, sp+$01
	ld [hl], a
.asm_9b1a1:
	ld hl, sp+$01
	ld a, [hl]
	cp $ff
	jp nz, .asm_9b233
	ld de, Data_9b241
	ld hl, sp+$06
	call strcpy
	ld hl, sp+$06
	call WriteHLToSPPlus4
	ld hl, $0000
	call WriteHLToSPPlus6
	ld a, $02
	ld [wc396End], a
	set_farcall_addrs_hli Func_17e95
	ld c, $05
	ld e, $14
	ld hl, $000d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $00
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$02
	push de
	push hl
	pop de
	pop hl
	ld hl, $010e
	call FarCall
	ld hl, sp+$4c
	ld e, [hl]
	ld d, $00
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $00
	call MultiplyHLbyDE
	push de
	push hl
	pop de
	pop hl
	read_hl_from wBlockdataPointer
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $00
	add hl, de
	push de
	push hl
	pop de
	pop hl
	ld hl, sp+$00
	ld a, [hl]
	ld [de], a
	set_farcall_addrs_hli Func_8f44
	call FarCall
.asm_9b233:
	ld hl, sp+$01
	ld a, [hl]
	add sp, $48
	ret

Data_9b239:
	dstr "(をみつけた)"

Data_9b241:
	dstr "(これいしﾞょう ひろえない)"

Func_9b251:: ; 9b251
	xor a
	ld [wc785], a
	ld hl, $0000
	write_hl_to wc786
	xor a
	ld [wc788], a
	ret

Func_9b262::
	ld [wc785], a
	reg16swap de, hl
	write_hl_to wc786
	ld a, c
	ld [wc788], a
	call Func_9b276
	ret

Func_9b276:
	push bc
	push bc
	push bc
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b286
	jp Func_9b322

Func_9b286:
	ld e, $0
Func_9b288:
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b314
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$3
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$3
	ld a, [hl]
	ld hl, sp+$2
	ld [hl], a
	ld hl, sp+$2
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$2
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b30f
	ld hl, sp+$6
	ld a, [hl]
	and $10
	jp nz, Func_9b30f
	ld a, [wc859]
	or a
	jp z, Func_9b30f
	ld hl, sp+$5
	ld e, [hl]
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
Func_9b30f:
	pop de
	inc e
	jp Func_9b288

Func_9b314:
	callba_hli Func_8f44
Func_9b322:
	pop bc
	pop bc
	pop bc
	ret

Func_9b326::
	add sp, -$4a
	read_hl_from wc786
	ld a, l
	or h
	jp nz, Func_9b335
	jp Func_9b72f

Func_9b335:
	ld e, $0
Func_9b337:
	ld a, e
	ld hl, wc788
	cp [hl]
	jp nc, Func_9b72f
	push de
	ld a, [wc785]
	ld [wFarCallDestBank], a
	ld l, e
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	read_hl_from wc786
	add hl, de
	reg16swap de, hl
	ld hl, sp+$45
	ld bc, $5
	call FarCopyVideoData
	ld hl, sp+$45
	ld a, [hl]
	ld hl, sp+$4a
	ld [hl], a
	ld hl, sp+$4a
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	ld e, [hl]
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	and e
	jp z, Func_9b38c
	jp Func_9b72a

Func_9b38c:
	ld hl, sp+$44
	ld a, [wPlayerMapX]
	ld [hl], a
	ld a, [wPlayerMapY]
	ld e, a
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b3cd
	ld a, [wPlayerFacing]
	cp $3
	jp z, Func_9b3c6
	cp $2
	jp z, Func_9b3c2
	cp $1
	jp z, Func_9b3b8
	or a
	jp nz, Func_9b3cd
	dec e
	jp Func_9b3cd

Func_9b3b8:
	ld hl, sp+$44
	ld a, [hl]
	inc a
	ld hl, sp+$44
	ld [hl], a
	jp Func_9b3cd

Func_9b3c2:
	inc e
	jp Func_9b3cd

Func_9b3c6:
	ld hl, sp+$44
	ld a, [hl]
	dec a
	ld hl, sp+$44
	ld [hl], a
Func_9b3cd:
	ld hl, sp+$46
	ld a, [hl]
	ld hl, sp+$44
	cp [hl]
	jp nz, Func_9b72a
	ld hl, sp+$47
	ld a, [hl]
	cp e
	jp nz, Func_9b72a
	ld hl, sp+$4a
	ld a, [hl]
	cp $31
	jp z, Func_9b403
	cp $28
	jp z, Func_9b403
	cp $24
	jp z, Func_9b403
	cp $22
	jp z, Func_9b403
	cp $1d
	jp z, Func_9b403
	cp $1c
	jp z, Func_9b403
	cp $1a
	jp nz, Func_9b44d
Func_9b403:
	set_farcall_addrs_hli Func_da901
	ld de, PutOnVideoTransferQueue
	ld hl, $d
	call FarCall
	push hl
	set_farcall_addrs_hli DrawTextBoxAndOverworldText
	ld c, $0
	ld e, $c
	ld hl, $69
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	jp Func_9b72a

Func_9b44d:
	push de
	ld a, $3
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli GetBanks
	ld de, $19
	ld a, $3
	call FarCall
	push af
	ld hl, sp+$4c
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b4c2
	cp $2
	jp z, Func_9b49f
	cp $1
	jp nz, Func_9b4e1
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	push hl
	ld l, a
	ld h, $0
	ld de, $400
	add hl, de
	pop de
	ld c, $a
	call FarCall
	jp Func_9b4e1

Func_9b49f:
	ld hl, sp+$4d
	ld a, [hl]
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	inc h
	inc h
	ld c, $8
	call FarCall
	jp Func_9b4e1

Func_9b4c2:
	ld hl, sp+$4d
	ld a, [hl]
	dec a
	push af
	set_farcall_addrs_hli GetName
	pop af
	ld hl, sp+$2a
	reg16swap de, hl
	ld l, a
	ld h, $0
	ld c, $5
	call FarCall
Func_9b4e1:
	pop af
	call GetSRAMBank
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b557
	ld a, [wc859]
	or a
	jp z, Func_9b554
	push de
	ld a, $31
	call OverworldPlaySFX
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	pop de
	push de
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$46
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [wc859]
	ld [hl], a
	callba_hli Func_8f44
	pop de
Func_9b554:
	jp Func_9b55e

Func_9b557:
	push de
	ld a, $2a
	call OverworldPlaySFX
	pop de
Func_9b55e:
	push de
	ld hl, sp+$28
	reg16swap de, hl
	ld hl, sp+$a
	call LiteralStringInTree
	dec hl
	ld de, Data_9b732
	call strcpy
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
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
	ld hl, sp+$8
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	callba_hli Func_8f44
	set_farcall_addrs_hli SetSpriteYCoordinatesAndCollectGarbage
	pop hl
	call FarCall
	ld hl, sp+$4a
	ld a, [hl]
	and $f
	cp $3
	jp z, Func_9b652
	cp $2
	jp z, Func_9b639
	cp $1
	jp nz, Func_9b668
	set_farcall_addrs_hli Func_5a0e0
	ld c, $0
	ld e, $1
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b639:
	set_farcall_addrs_hli Func_6af0d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
	jp Func_9b668

Func_9b652:
	set_farcall_addrs_hli Func_4ed5d
	ld e, $0
	ld hl, sp+$4b
	ld a, [hl]
	call FarCall
	ld hl, sp+$5
	ld [hl], a
Func_9b668:
	pop de
	ld hl, sp+$3
	ld a, [hl]
	cp $ff
	jp nz, Func_9b70c
	push de
	ld de, Data_9b73a
	ld hl, sp+$a
	call strcpy
	ld hl, sp+$a
	call WriteHLToSPPlus8
	ld hl, $0
	call WriteHLToSPPlus10
	ld a, $2
	ld [wEnableAttrMapTransfer], a
	set_farcall_addrs_hli Func_17e95
	ld c, $5
	ld e, $14
	ld hl, $d
	call FarCall
	ld l, $12
	push hl
	ld c, $14
	ld e, $0
	xor a
	call PushBGMapRegion
	pop bc
	set_farcall_addrs_hli PrintMapText_
	ld c, $80
	ld hl, sp+$6
	reg16swap de, hl
	ld hl, $10e
	call FarCall
	pop de
	ld hl, sp+$48
	ld a, [hl]
	and $10
	jp nz, Func_9b6fb
	ld a, [wc859]
	or a
	jp z, Func_9b6fb
	ld d, $0
	ld hl, wMapWidth
	ld l, [hl]
	ld h, $0
	call MultiplyHLbyDE
	reg16swap de, hl
	read_hl_from wBlockdataPointer
	add hl, de
	reg16swap de, hl
	ld hl, sp+$44
	ld l, [hl]
	ld h, $0
	add hl, de
	reg16swap de, hl
	ld hl, sp+$2
	ld a, [hl]
	ld [de], a
Func_9b6fb:
	callba_hli Func_8f44
	jp Func_9b72a

Func_9b70c:
	ld hl, sp+$4a
	ld a, [hl]
	and $7
	ld b, a
	ld a, $1
	call LeftShiftA
	push af
	ld hl, sp+$4c
	ld l, [hl]
	ld h, $0
	ld de, $8
	call DivideHLByDESigned
	ld de, wc7c5
	add hl, de
	pop af
	or [hl]
	ld [hl], a
Func_9b72a:
	pop de
	inc e
	jp Func_9b337

Func_9b72f:
	add sp, $4a
	ret

Data_9b732:
	dstr "(をみつけた)"

Data_9b73a:
	dstr "(これいしﾞょう ひろえない)"


INCLUDE "includes.asm"
INCLUDE "charmap.asm"

IF DEF(SUN)
DEF __offset_3F_3 EQU $7cd4
ELIF DEF(STAR)
DEF __offset_3F_3 EQU $7cd2
ENDC

SECTION "Bank 3f, 3", ROMX

Func_ffcd4:: ; ffcd4 (3f:7cd4)
	ld hl, Data_ffd39
	ld de, $10
	call Func_2b7d
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_ffd1e
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, $30
	ldh [rJOYP], a
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_ffd1e
	ld hl, Data_ffd29
	ld de, $10
	call Func_2b7d
	sub a
	ret

.asm_ffd1e
	ld hl, Data_ffd29
	ld de, $10
	call Func_2b7d
	scf
	ret

Data_ffd29:
IF DEF(SUN)
	db $89, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_ffd39:
	db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ELIF DEF(STAR)
	db $89, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_ffd39:
	db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ENDC

Func_ffd49:: ; ffd49 (3f:7d49)
	di
	push de
	call Func_ffd92
	ld a, $43
	ldh [rLCDC], a
	ld a, $e4
	ldh [rBGP], a
	ld de, $8800
	ld bc, $1000
	call Func_ffd99
	hlbgcoord 0, 0
	ld de, $c
	ld a, $80
	ld c, $d
.asm_ffd69
	ld b, $14
.asm_ffd6b
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_ffd6b
	add hl, de
	dec c
	jr nz, .asm_ffd69
	ld a, $c3
	ldh [rLCDC], a
	pop hl
	ld de, $10
	call Func_2b7d
	ei
	ret

Func_ffd81:: ; ffd81 (3f:7d81)
	ld de, $6d6
.asm_ffd84
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_ffd84
	dec bc
	ld a, b
	or c
	jr nz, Func_ffd81
	ret

Func_ffd92: ; ffd92 (3f:7d92)
	ldh a, [rLY]
	cp $94
	jr nz, Func_ffd92
	ret

Func_ffd99: ; ffd99 (3f:7d99)
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, Func_ffd99
	ret

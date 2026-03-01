INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 20", ROMX
	script_library 20

INCLUDE "maps/scripts/unknown_81281.asm"
INCLUDE "maps/scripts/unknown_81ac1.asm"
INCLUDE "maps/scripts/unknown_81d6a.asm"
INCLUDE "maps/scripts/unknown_8240c.asm"
INCLUDE "maps/scripts/unknown_825cc.asm"
INCLUDE "maps/scripts/unknown_82628.asm"
INCLUDE "maps/scripts/unknown_827a9.asm"
INCLUDE "maps/scripts/unknown_82b03.asm"
INCLUDE "maps/scripts/unknown_82c44.asm"
INCLUDE "maps/scripts/unknown_82d7f.asm"
INCLUDE "maps/scripts/unknown_82e70.asm"
INCLUDE "maps/scripts/unknown_82f08.asm"
INCLUDE "maps/scripts/unknown_82fa8.asm"
INCLUDE "maps/scripts/unknown_83026.asm"
INCLUDE "maps/scripts/unknown_83169.asm"
INCLUDE "maps/scripts/unknown_831c2.asm"
INCLUDE "maps/scripts/unknown_83213.asm"
INCLUDE "maps/scripts/unknown_83340.asm"
INCLUDE "maps/scripts/unknown_833ba.asm"
INCLUDE "maps/scripts/unknown_83431.asm"
INCLUDE "maps/scripts/unknown_834bd.asm"
INCLUDE "maps/scripts/unknown_83537.asm"
INCLUDE "maps/scripts/unknown_835ae.asm"
INCLUDE "maps/scripts/unknown_83632.asm"
INCLUDE "maps/scripts/unknown_836b1.asm"
INCLUDE "maps/scripts/unknown_83730.asm"
INCLUDE "maps/scripts/unknown_837aa.asm"
INCLUDE "maps/scripts/unknown_83816.asm"
INCLUDE "maps/scripts/unknown_838a2.asm"

Func_83e56:: ; 83e56 (20:7e56)
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	ld a, [wc79d]
	cp $1
	jp nz, .asm_83f33
	ld hl, sp+$6
	scall Func_80f94
	ld hl, sp+$9
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	reg16swap de, hl
	ld hl, sp+$a
	ld l, [hl]
	ld h, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld hl, sp+$8
	ld c, [hl]
	ld hl, sp+$7
	ld e, [hl]
	ld hl, sp+$6
	ld a, [hl]
	call FarCall
	push hl
	ld hl, wc7a1
	ld l, [hl]
	ld h, $0
	ld de, $3c
	call MultiplyHLbyDE
	ld a, [wc7a2]
	ld e, a
	ld d, $0
	add hl, de
	call WriteHLToSPPlus6
	set_farcall_addrs_hli Func_93883
	ld a, [wc7a0]
	ld c, a
	ld a, [wc79f]
	ld e, a
	ld a, [wc79e]
	call FarCall
	reg16swap de, hl
	ld c, $0
	pop hl
	call CompareHLtoDE
	jp nz, .asm_83ee9
	call GetHLAtSPPlus4
	push hl
	call GetHLAtSPPlus8
	pop de
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, .asm_83ee6
	ld c, $1
.asm_83ee6: ; 83ee6 (20:7ee6)
	jp .asm_83f30

.asm_83ee9: ; 83ee9 (20:7ee9)
	ld a, l
	sub e
	ld a, h
	sbc d
	jp nc, .asm_83f30
	ld a, e
	sub l
	ld l, a
	ld a, d
	sbc h
	ld h, a
	pop de
	push hl
	ld a, $2
	sub l
	ld a, $0
	sbc h
	jp nc, .asm_83f06
	ld c, $ff
	jp .asm_83f30

.asm_83f06: ; 83f06 (20:7f06)
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	call GetHLAtSPPlus4
	ld a, l
	sub c
	ld c, a
	ld a, h
	sbc b
	ld b, a
	push bc
	call GetHLAtSPPlus4
	ld de, $5a0
	call MultiplyHLbyDE
	pop bc
	add hl, bc
	ld a, l
	sub $a0
	ld a, h
	sbc $5
	jp c, .asm_83f2e
	ld c, $ff
	jp .asm_83f30

.asm_83f2e: ; 83f2e (20:7f2e)
	ld c, $1
.asm_83f30: ; 83f30 (20:7f30)
	jp .asm_83f35

.asm_83f33: ; 83f33 (20:7f33)
	ld c, $2
.asm_83f35: ; 83f35 (20:7f35)
	ld a, c
	add sp, $c
	ret


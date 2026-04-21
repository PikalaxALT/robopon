INCLUDE "includes.asm"
INCLUDE "charmap.asm"

SECTION "Bank 09", ROMX
Func_24000: ; 24000
	ret

IF DEF(LANG_EN)
Func_24001_en:
	ret
ENDC

Func_24001:: ; 24001
	callba_hli Func_5cf1d
	ret

Func_24010:: ; 24010
	push hl
	set_farcall_addrs_hli Func_5cf85
	pop hl
	ld e, BANK(Func_24010)
	call FarCall
	ret

Func_24023:: ; 24023
	push hl
	set_farcall_addrs_hli Func_5d02d
	pop hl
	ld e, BANK(Func_24023)
	call FarCall
	ret

IF DEF(LANG_EN)
Func_24037_en:
	push bc
	ld a, $37
	ld [wFarCallDestBank], a
	swap_de_hl
	ld hl, sp+$0
	ld bc, $2
	call FarCopyVideoData
	pop hl
	push hl
	ld a, l
	or h
	jp z, .asm_24055
	pop hl
	push hl
	call Func_24023
.asm_24055
	pop hl
	push hl
	pop bc
	ret

Func_24059_en:
	push bc
	ld a, $37
	ld [wFarCallDestBank], a
	swap_de_hl
	ld hl, sp+$0
	ld bc, $2
	call FarCopyVideoData
	pop hl
	push hl
	ld a, l
	or h
	jp z, .asm_24077
	pop hl
	push hl
	call Func_24010
.asm_24077
	pop hl
	push hl
	pop bc
	ret

Func_2407b_en:
	push hl
.asm_2407c
	pop hl
	push hl
	call Func_24037_en
	ld a, l
	or h
	jp nz, .asm_24089
	jp .asm_24092

.asm_24089
	pop hl
	push hl
	inc hl
	inc hl
	pop de
	push hl
	jp .asm_2407c

.asm_24092
	pop bc
	ret

Func_24094_en:
	push hl
	call Func_24059_en
	pop hl
	inc hl
	inc hl
	call Func_2407b_en
	ret
ENDC

Func_24036:: ; 24036
	callba_hli Func_5d107
	ret

Func_24045:: ; 24045
	callba_hli Func_5d10d
	ret

Func_24054:: ; 24054
	push af
	set_farcall_addrs_hli Func_5d096
	pop af
	call FarCall
	ret

INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 31", ROMX, BANK [$31]
Emotes_c4000::
	dw $0, $0
	emote_header Emotes_c4000, GFX_c4070, $192
	emote_header Emotes_c4000, GFX_c4129, $152
	emote_header Emotes_c4000, GFX_c419d, $1d2
	emote_header Emotes_c4000, GFX_c4256, $202
	emote_header Emotes_c4000, GFX_c4320, $132
	emote_header Emotes_c4000, GFX_c4362, $132
	emote_header Emotes_c4000, GFX_c43a6, $112
	emote_header Emotes_c4000, GFX_c43b5, $122
	emote_header Emotes_c4000, GFX_c43ce, $1b2
	emote_header Emotes_c4000, GFX_c44f3, $142
	emote_header Emotes_c4000, GFX_c454f, $1a2
	emote_header Emotes_c4000, GFX_c4606, $132
	emote_header Emotes_c4000, GFX_c4635, $402
	emote_header Emotes_c4000, GFX_c48e1, $212
	emote_header Emotes_c4000, GFX_c4a57, $322
	emote_header Emotes_c4000, GFX_c4bb8, $142
	emote_header Emotes_c4000, GFX_c4c35, $152
	emote_header Emotes_c4000, GFX_c4cc7, $372
	emote_header Emotes_c4000, GFX_c4ebd, $182
	emote_header Emotes_c4000, GFX_c4f94, $3a2
	emote_header Emotes_c4000, GFX_c5226, $3a2
	emote_header Emotes_c4000, GFX_c54b8, $152
	emote_header Emotes_c4000, GFX_c552a, $362
	emote_header Emotes_c4000, GFX_c5789, $172
	emote_header Emotes_c4000, GFX_c57f9, $322
	emote_header Emotes_c4000, GFX_c5929, $1e2
	emote_header Emotes_c4000, GFX_c5a38, $1d2

GFX_c4070: INCBIN "gfx/emotes/emote_c4070.emote.rz"
GFX_c4129: INCBIN "gfx/emotes/emote_c4129.emote.rz"
GFX_c419d: INCBIN "gfx/emotes/emote_c419d.emote.rz"
GFX_c4256: INCBIN "gfx/emotes/emote_c4256.emote.rz"
GFX_c4320: INCBIN "gfx/emotes/emote_c4320.emote.rz"
GFX_c4362: INCBIN "gfx/emotes/emote_c4362.emote.rz"
GFX_c43a6: INCBIN "gfx/emotes/emote_c43a6.emote.rz"
GFX_c43b5: INCBIN "gfx/emotes/emote_c43b5.emote.rz"
GFX_c43ce: INCBIN "gfx/emotes/emote_c43ce.emote.rz"
GFX_c44f3: INCBIN "gfx/emotes/emote_c44f3.emote.rz"
GFX_c454f: INCBIN "gfx/emotes/emote_c454f.emote.rz"
GFX_c4606: INCBIN "gfx/emotes/emote_c4606.emote.rz"
GFX_c4635: INCBIN "gfx/emotes/emote_c4635.emote.rz"
GFX_c48e1: INCBIN "gfx/emotes/emote_c48e1.emote.rz"
GFX_c4a57: INCBIN "gfx/emotes/emote_c4a57.emote.rz"
GFX_c4bb8: INCBIN "gfx/emotes/emote_c4bb8.emote.rz"
GFX_c4c35: INCBIN "gfx/emotes/emote_c4c35.emote.rz"
GFX_c4cc7: INCBIN "gfx/emotes/emote_c4cc7.emote.rz"
GFX_c4ebd: INCBIN "gfx/emotes/emote_c4ebd.emote.rz"
GFX_c4f94: INCBIN "gfx/emotes/emote_c4f94.emote.rz"
GFX_c5226: INCBIN "gfx/emotes/emote_c5226.emote.rz"
GFX_c54b8: INCBIN "gfx/emotes/emote_c54b8.emote.rz"
GFX_c552a: INCBIN "gfx/emotes/emote_c552a.emote.rz"
GFX_c5789: INCBIN "gfx/emotes/emote_c5789.emote.rz"
GFX_c57f9: INCBIN "gfx/emotes/emote_c57f9.emote.rz"
GFX_c5929: INCBIN "gfx/emotes/emote_c5929.emote.rz"
GFX_c5a38: INCBIN "gfx/emotes/emote_c5a38.emote.rz"

EmoteAttrs_c5b26:: ; c5b26
	dw $0, $0
	emote_header EmoteAttrs_c5b26, Data_c5bae, $8e
	emote_header EmoteAttrs_c5b26, Data_c5be0, $77
	emote_header EmoteAttrs_c5b26, Data_c5c00, $d4
	emote_header EmoteAttrs_c5b26, Data_c5c4b, $148
	emote_header EmoteAttrs_c5b26, Data_c5cec, $6c
	emote_header EmoteAttrs_c5b26, Data_c5d05, $6c
	emote_header EmoteAttrs_c5b26, Data_c5d1e, $16f
	emote_header EmoteAttrs_c5b26, Data_c5de6, $168
	emote_header EmoteAttrs_c5b26, Data_c5ea7, $ac
	emote_header EmoteAttrs_c5b26, Data_c5ef2, $1e6
	emote_header EmoteAttrs_c5b26, Data_c5fd6, $136
	emote_header EmoteAttrs_c5b26, Data_c6064, $cf
	emote_header EmoteAttrs_c5b26, Data_c60c2, $54a
	emote_header EmoteAttrs_c5b26, Data_c61e5, $640
	emote_header EmoteAttrs_c5b26, Data_c6328, $480
	emote_header EmoteAttrs_c5b26, Data_c6449, $260
	emote_header EmoteAttrs_c5b26, Data_c6574, $309
	emote_header EmoteAttrs_c5b26, Data_c6682, $424
	emote_header EmoteAttrs_c5b26, Data_c6876, $ca
	emote_header EmoteAttrs_c5b26, Data_c68d1, $124
	emote_header EmoteAttrs_c5b26, Data_c6960, $1d8
	emote_header EmoteAttrs_c5b26, Data_c6a70, $176
	emote_header EmoteAttrs_c5b26, Data_c6afd, $134
	emote_header EmoteAttrs_c5b26, Data_c6b47, $19e
	emote_header EmoteAttrs_c5b26, Data_c6bbd, $14e
	emote_header EmoteAttrs_c5b26, Data_c6c4d, $4ee
	emote_header EmoteAttrs_c5b26, Data_c6cea, $bb
	emote_header EmoteAttrs_c5b26, Data_c6d2f, $167
	emote_header EmoteAttrs_c5b26, Data_c6ddd, $fc
	emote_header EmoteAttrs_c5b26, Data_c6e47, $8f
	emote_header EmoteAttrs_c5b26, Data_c6e78, $116
	emote_header EmoteAttrs_c5b26, Data_c6ef0, $279
	emote_header EmoteAttrs_c5b26, Data_c6fff, $26a

Data_c5bae: INCBIN "gfx/emotes/emote_c5bae.emoteattrs.rz" ; c5bae
Data_c5be0: INCBIN "gfx/emotes/emote_c5be0.emoteattrs.rz" ; c5be0
Data_c5c00: INCBIN "gfx/emotes/emote_c5c00.emoteattrs.rz" ; c5c00
Data_c5c4b: INCBIN "gfx/emotes/emote_c5c4b.emoteattrs.rz" ; c5c4b
Data_c5cec: INCBIN "gfx/emotes/emote_c5cec.emoteattrs.rz" ; c5cec
Data_c5d05: INCBIN "gfx/emotes/emote_c5d05.emoteattrs.rz" ; c5d05
Data_c5d1e: INCBIN "gfx/emotes/emote_c5d1e.emoteattrs.rz" ; c5d1e
Data_c5de6: INCBIN "gfx/emotes/emote_c5de6.emoteattrs.rz" ; c5de6
Data_c5ea7: INCBIN "gfx/emotes/emote_c5ea7.emoteattrs.rz" ; c5ea7
Data_c5ef2: INCBIN "gfx/emotes/emote_c5ef2.emoteattrs.rz" ; c5ef2
Data_c5fd6: INCBIN "gfx/emotes/emote_c5fd6.emoteattrs.rz" ; c5fd6
Data_c6064: INCBIN "gfx/emotes/emote_c6064.emoteattrs.rz" ; c6064
Data_c60c2: INCBIN "gfx/emotes/emote_c60c2.emoteattrs.rz" ; c60c2
Data_c61e5: INCBIN "gfx/emotes/emote_c61e5.emoteattrs.rz" ; c61e5
Data_c6328: INCBIN "gfx/emotes/emote_c6328.emoteattrs.rz" ; c6328
Data_c6449: INCBIN "gfx/emotes/emote_c6449.emoteattrs.rz" ; c6449
Data_c6574: INCBIN "gfx/emotes/emote_c6574.emoteattrs.rz" ; c6574
Data_c6682: INCBIN "gfx/emotes/emote_c6682.emoteattrs.rz" ; c6682
Data_c6876: INCBIN "gfx/emotes/emote_c6876.emoteattrs.rz" ; c6876
Data_c68d1: INCBIN "gfx/emotes/emote_c68d1.emoteattrs.rz" ; c68d1
Data_c6960: INCBIN "gfx/emotes/emote_c6960.emoteattrs.rz" ; c6960
Data_c6a70: INCBIN "gfx/emotes/emote_c6a70.emoteattrs.rz" ; c6a70
Data_c6afd: INCBIN "gfx/emotes/emote_c6afd.emoteattrs.rz" ; c6afd
Data_c6b47: INCBIN "gfx/emotes/emote_c6b47.emoteattrs.rz" ; c6b47
Data_c6bbd: INCBIN "gfx/emotes/emote_c6bbd.emoteattrs.rz" ; c6bbd
Data_c6c4d: INCBIN "gfx/emotes/emote_c6c4d.emoteattrs.rz" ; c6c4d
Data_c6cea: INCBIN "gfx/emotes/emote_c6cea.emoteattrs.rz" ; c6cea
Data_c6d2f: INCBIN "gfx/emotes/emote_c6d2f.emoteattrs.rz" ; c6d2f
Data_c6ddd: INCBIN "gfx/emotes/emote_c6ddd.emoteattrs.rz" ; c6ddd
Data_c6e47: INCBIN "gfx/emotes/emote_c6e47.emoteattrs.rz" ; c6e47
Data_c6e78: INCBIN "gfx/emotes/emote_c6e78.emoteattrs.rz" ; c6e78
Data_c6ef0: INCBIN "gfx/emotes/emote_c6ef0.emoteattrs.rz" ; c6ef0
Data_c6fff: INCBIN "gfx/emotes/emote_c6fff.emoteattrs.rz" ; c6fff

malloc_Bank31: ; c70e8
	push hl
	set_farcall_addrs_hli malloc
	pop hl
	jp FarCall

free_Bank31:
	push hl
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_c7109:: ; c7109 (31:7109)
	push bc
	push bc
	push bc
	ld c, h
	ld a, l
	ld hl, sp+$4
	ld [hl], d
	ld l, e
	push hl
	ld l, a
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
	ld e, c
	ld d, $0
	add hl, de
	reg16swap de, hl
	xor a
	pop hl
	pop bc
Func_c712c: ; c712c (31:712c)
	cp l
	jp nc, Func_c715f
	push hl
	push af
	push de
	reg16swap de, hl
	call WriteHLToSPPlus8
	xor a
Func_c713b: ; c713b (31:713b)
	ld hl, sp+$8
	cp [hl]
	jp nc, Func_c7150
	push af
	ld a, c
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	pop af
	inc a
	jp Func_c713b

Func_c7150: ; c7150 (31:7150)
	pop de
	ld hl, $14
	add hl, de
	reg16swap de, hl
	pop af
	inc a
	pop hl
	jp Func_c712c

Func_c715f: ; c715f (31:715f)
	pop bc
	pop bc
	ret

INCLUDE "engine/map/color.asm"

Data_c795a:
	db $01, $ff, $ff, $1f, $00, $1f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Func_c796a:: ; c796a (31:796a)
	push hl
	add sp, -$e
	ld hl, sp+$e
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [wSystemType]
	cp $1
	jp z, Func_c7983
	ld a, [wSystemType]
	cp $ff
	jp nz, Func_c79ae
Func_c7983: ; c7983 (31:7983)
	push de
	push hl
	ld bc, $10
	ld de, Data_c795a
	ld hl, sp+$4
	call CopyFromDEtoHL
	pop hl
	call WriteHLToSPPlus7
	pop hl
	call WriteHLToSPPlus7
	ld hl, $3add
	write_hl_to_sp_plus $b
	ld hl, $1cf8
	write_hl_to_sp_plus $d
	ld de, $10
	ld hl, sp+$0
	call Func_2b83
Func_c79ae: ; c79ae (31:79ae)
	add sp, $10
	ret

INCLUDE "engine/triggers.asm"

Data_c7b84:
	RGB 29, 22, 14
	RGB 24, 07, 07

	RGB 15, 15, 25
	RGB 07, 07, 19

	RGB 25, 15, 15
	RGB 19, 07, 07

	RGB 24, 18, 28
	RGB 15, 09, 19

	RGB 15, 25, 15
	RGB 07, 19, 07

	RGB 20, 23, 31
	RGB 10, 14, 31

	RGB 16, 16, 00
	RGB 26, 17, 00

	RGB 25, 28, 28
	RGB 21, 21, 25

	RGB 16, 14, 16
	RGB 11, 09, 11

	RGB 24, 25, 24
	RGB 14, 15, 14

	RGB 31, 22, 31
	RGB 22, 09, 13

	RGB 30, 23, 19
	RGB 22, 12, 10

	RGB 17, 22, 22
	RGB 00, 13, 13

	RGB 19, 13, 11
	RGB 11, 05, 03

	RGB 31, 28, 21
	RGB 23, 14, 10

	RGB 24, 27, 17
	RGB 11, 14, 11

	RGB 25, 19, 25
	RGB 14, 10, 14

	RGB 25, 15, 25
	RGB 19, 07, 19

	RGB 22, 19, 14
	RGB 09, 05, 03

Func_c7bd0:: ; c7bd0 (31:7bd0)
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_c7b84
	add hl, de
	inc hl
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Data_c7b84
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	reg16swap de, hl
	pop de
	call Func_c796a
	ret


Func_1494: ; 1494 (0:1494)
	ld a, [hROMBank]
	push af
	ld b, $0
.loop
	ld a, [wFarCallDestBank]
	call BankSwitch
	ld a, [de]
	inc de
	or a
	jr z, .done
	dec a
	push af
	ld a, BANK(Func_68b6)
	call BankSwitch
	pop af
	call Func_68b6
	jr .loop

.done
	bit 0, b
	jr z, .bit_0_clear
	ld a, "<KATA>"
	ld [hli], a
	xor a
.bit_0_clear
	ld [hli], a
	pop af
	call BankSwitch
	ret

CheckVideoTransferQueue: ; 14bf (0:14bf)
; looks for the first occupied entry in wVideoTransferQueue
; returns nz if an entry was found
	ld c, $4
	ld hl, wVideoTransferQueue
.loop
	ld a, [hl]
	or a
	jr nz, .found
	ld a, l
	add $5
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec c
	jr nz, .loop
.found
	ret

WaitVideoTransfer: ; 14d4 (0:14d4)
; blocks until wVideoTransferQueue is empty
.loop
	call CheckVideoTransferQueue
	jr nz, .loop
	ret

Coord2TileMap: ; 14da (0:14da)
; h = x
; l = y
; return hl = pointer
	ld a, l
	inc a
	ld c, h
	ld b, $0
	ld hl, wTileMap - SCREEN_WIDTH
	add hl, bc
	ld bc, SCREEN_WIDTH
.asm_14e6
	add hl, bc
	dec a
	jr nz, .asm_14e6
	ret

Coord2AttrMap:
; h = x
; l = y
; return hl = pointer
	ld a, l
	inc a
	ld c, h
	ld b, $0
	ld hl, wAttrMap - SCREEN_WIDTH
	add hl, bc
	ld bc, SCREEN_WIDTH
.asm_14f7
	add hl, bc
	dec a
	jr nz, .asm_14f7
	ret

Func_14fc:
	ld [$c2eb], a
	jp Func_1aaf

Func_1502:
	ld [$c2ec], a
	jp Func_1ab4

Func_1508:
	xor a
	jr Func_14fc

Func_150b:
	xor a
	jr Func_1502

PlaceString: ; 150e (0:150e)
; source: on stack
; dest: screen at (wStringDestX, wStringDestY)
; additional arugments on stack, if applicable
	ld a, [wStringDestX]
	ld h, a
	ld a, [wStringDestY]
	ld l, a
	call Coord2TileMap
	push hl
	ld hl, sp+$4
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, l
	ld b, h
	pop hl
PlaceNextCharacter:
	ld a, [de]
	inc de
	or a
	jr nz, CheckDict
	ret

CheckDict:
	cp $25
	jp z, .SpecialCharacter
	cp $28
	jr z, .set_hiragana
	cp $29
	jr nz, .charmap
	xor a
	ld [wKana], a
	jr PlaceNextCharacter

.set_hiragana
	xor a
	dec a
	ld [wKana], a
	jr PlaceNextCharacter

.charmap
	push bc
	ld bc, CharacterMapping
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [bc]
	cp $42
	jr z, .place_dakuten
	cp $43
	jr z, .place_dakuten
	ld c, a
	ld a, [wKana]
	or a
	jr z, .no_dakuten
	ld a, c
	cp $44
	jr c, .check_subtract
	cp $4e
	jr nc, .check_subtract
	sub $3a
	ld c, a
	jr .no_dakuten

.check_subtract
	cp $4e
	jr c, .no_dakuten
	cp $7b
	jr nc, .no_dakuten
	sub $39
	ld c, a
.no_dakuten
	ld a, c
	ld [hli], a
	ld a, [wStringDestX]
	inc a
	ld [wStringDestX], a
	pop bc
	; don't erase dakuten if printing text on the top row
	ld a, [wStringDestY]
	or a
	jr z, PlaceNextCharacter
	push bc
	ld bc, -(SCREEN_WIDTH + 1)
	add hl, bc
	ld a, [hl]
	cp $88 ; " top row of textbox
	jr z, .no_dakuten_top_row
	cp $89 ; o top row of textbox
	jr z, .no_dakuten_top_row
	cp $81 ; blank top row of textbox
	jr z, .no_dakuten_restore_pointer
	cp $42 ; interior "
	jr z, .no_dakuten_interior
	cp $43 ; interior o
	jr nz, .no_dakuten_restore_pointer
.no_dakuten_interior
	ld [hl], $8f ; blank
.no_dakuten_restore_pointer
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	pop bc
	jp PlaceNextCharacter

.no_dakuten_top_row
	ld [hl], $81 ; blank top row of textbox
	jr .no_dakuten_restore_pointer

.place_dakuten
	push af
	ld a, [wStringDestY]
	or a
	jr nz, .dakuten_okay
	pop af
	pop bc
	jp PlaceNextCharacter

.dakuten_okay
	ld bc, -(SCREEN_WIDTH + 1)
	add hl, bc
	ld a, [hl]
	cp $81
	jr z, .top_row
	cp $88
	jr z, .top_row
	cp $89
	jr z, .top_row
	pop af
	ld [hl], a
.after_dakuten_restore_pointer
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	pop bc
	jp PlaceNextCharacter

.top_row
	pop af
	add $88 - $42
	ld [hl], a
	jr .after_dakuten_restore_pointer

.SpecialCharacter: ; 15db (0:15db)
	ld a, [de]
	inc de
	cp $64
	jr z, .print_num
	cp $63
	jr z, .place_stack_char
	cp $73
	jr z, .call_string
	cp $6c
	jr z, .print_num_unsigned
	ld [hli], a
	jp PlaceNextCharacter

.print_num
	push de
	; get s16 off of stack, put it in de
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	ld e, l
	ld d, h
	; pass sp-$c to PlaceString later
	ld hl, sp-$c
	add sp, -$c
	push hl
	push de
	push hl
	pop de
	pop hl
	ld bc, 10 ; destroyed immediately in PrintNumSigned
	call PrintNumSigned ; de contains [sp]=sp+2, hl contains the s16 we just read
	call PlaceString
	add sp, $e
	pop bc
	pop de
	jp PlaceNextCharacter

.place_stack_char
	ld a, [bc]
	inc bc
	inc bc
	jp CheckDict

.call_string
	ld a, [wKana]
	push af
	push de
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push bc
	push hl
	call PlaceString
	pop bc
	pop bc
	pop de
	pop af
	ld [wKana], a
	jp PlaceNextCharacter

.print_num_unsigned
	ld a, [de]
	inc de
	cp $64
	jr z, .okay
	ld [hli], a
	jp PlaceNextCharacter

.okay
	push de
	ld a, [bc]
	inc bc
	ld e, a
	ld a, [bc]
	inc bc
	ld d, a
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	push hl
	pop bc
	ld hl, sp-$c
	add sp, -$c
	push hl
	push bc
	push de
	call PrintNum
	pop bc
	pop bc
	call PlaceString
	add sp, $e
	pop bc
	pop de
	jp PlaceNextCharacter

PrintMapText:
	ld a, [hROMBank]
	push af
	ld a, BANK(Pointers_38000)
	call BankSwitch
	push hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc a
	jr nz, .asm_1698
	xor h
	inc a
	jr nz, .asm_1698
	ld l, c
	ld h, b
	add hl, hl
	ld bc, Pointers_38000
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld b, h
	sla b
	rla
	sla b
	rla
	add $e
	ld b, a
	call BankSwitch
	res 7, h
	set 6, h
	ld c, [hl]
.asm_1698
	ld a, b
	and $1f
	call BankSwitch
	ld a, b
	srl a
	srl a
	srl a
	srl a
	srl a
	ld b, $8
	jr z, .loop
	ld b, a
.loop
	call LeftShiftInLargeBitField
	jp c, .asm_1845
	call LeftShiftInLargeBitField
	jp c, .asm_1775
	call LeftShiftInLargeBitField
	jp c, .asm_1701
	call LeftShiftInLargeBitField
	jr c, .asm_16e8
	call LeftShiftInLargeBitField
	jr c, .asm_16e3
	call LeftShiftInLargeBitField
	jr c, .asm_16de
	call LeftShiftInLargeBitField
	jr c, .asm_16d9
	ld a, "ふ"
	jp .queue_character

.asm_16d9
	ld a, "ひ"
	jp .queue_character

.asm_16de
	ld a, "す"
	jp .queue_character

.asm_16e3
	ld a, "な"
	jp .queue_character

.asm_16e8
	call LeftShiftInLargeBitField
	jr c, .asm_16fc
	call LeftShiftInLargeBitField
	jr c, .asm_16f7
	ld a, "ま"
	jp .queue_character

.asm_16f7
	ld a, "あ"
	jp .queue_character

.asm_16fc
	ld a, "う"
	jp .queue_character

.asm_1701: ; 1701 (0:1701)
	call LeftShiftInLargeBitField
	jp c, .asm_1752
	call LeftShiftInLargeBitField
	jr c, .asm_1725
	call LeftShiftInLargeBitField
	jr c, .asm_1720
	call LeftShiftInLargeBitField
	jr c, .asm_171b
	ld a, "ゃ"
	jp .queue_character

.asm_171b
	ld a, "み"
	jp .queue_character

.asm_1720
	ld a, "も"
	jp .queue_character

.asm_1725
	call LeftShiftInLargeBitField
	jr c, .asm_174d
	call LeftShiftInLargeBitField
	jr c, .asm_1748
	call LeftShiftInLargeBitField
	jr c, .asm_1743
	call LeftShiftInLargeBitField
	jr c, .asm_173e
	ld a, "ゆ"
	jp .queue_character

.asm_173e
	ld a, "ぁ"
	jp .queue_character

.asm_1743
	ld a, "へ"
	jp .queue_character

.asm_1748
	ld a, "え"
	jp .queue_character

.asm_174d
	ld a, "お"
	jp .queue_character

.asm_1752: ; 1752 (0:1752)
	call LeftShiftInLargeBitField
	jr c, .asm_1770
	call LeftShiftInLargeBitField
	jr c, .asm_1761
	ld a, "き"
	jp .queue_character

.asm_1761
	call LeftShiftInLargeBitField
	jr c, .asm_176b
	ld a, "や"
	jp .queue_character

.asm_176b
	ld a, "を"
	jp .queue_character

.asm_1770
	ld a, "と"
	jp .queue_character

.asm_1775: ; 1775 (0:1775)
	call LeftShiftInLargeBitField
	jp c, .asm_17b2
	call LeftShiftInLargeBitField
	jr c, .asm_1785
	ld a, $a
	jp .queue_character

.asm_1785
	call LeftShiftInLargeBitField
	jr c, .asm_17a3
	call LeftShiftInLargeBitField
	jr c, .asm_179e
	call LeftShiftInLargeBitField
	jr c, .asm_1799
	ld a, "ょ"
	jp .queue_character

.asm_1799
	ld a, "ﾟ"
	jp .queue_character

.asm_179e
	ld a, "に"
	jp .queue_character

.asm_17a3
	call LeftShiftInLargeBitField
	jr c, .asm_17ad
	ld a, $0
	jp .queue_character

.asm_17ad
	ld a, "ー"
	jp .queue_character

.asm_17b2: ; 17b2 (0:17b2)
	call LeftShiftInLargeBitField
	jr c, .asm_17c6
	call LeftShiftInLargeBitField
	jr c, .asm_17c1
	ld a, "て"
	jp .queue_character

.asm_17c1
	ld a, "し"
	jp .queue_character

.asm_17c6
	call LeftShiftInLargeBitField
	jp c, .asm_182c
	call LeftShiftInLargeBitField
	jr c, .asm_17d6
	ld a, "…"
	jp .queue_character

.asm_17d6
	call LeftShiftInLargeBitField
	jr c, .asm_17e0
	ld a, "り"
	jp .queue_character

.asm_17e0
	call LeftShiftInLargeBitField
	jr c, .asm_17ea
	ld a, "め"
	jp .queue_character

.asm_17ea
	call LeftShiftInLargeBitField
	jp c, .asm_1827
	call LeftShiftInLargeBitField
	jr c, .asm_1818
	call LeftShiftInLargeBitField
	jr c, .asm_1813
	call LeftShiftInLargeBitField
	jr c, .asm_180e
	call LeftShiftInLargeBitField
	jr c, .asm_1809
	ld a, "9"
	jp .queue_character

.asm_1809
	ld a, "ぅ"
	jp .queue_character

.asm_180e
	ld a, "ぬ"
	jp .queue_character

.asm_1813
	ld a, "8"
	jp .queue_character

.asm_1818
	call LeftShiftInLargeBitField
	jr c, .asm_1822
	ld a, "4"
	jp .queue_character

.asm_1822
	ld a, "3"
	jp .queue_character

.asm_1827: ; 1827 (0:1827)
	ld a, $1
	jp .queue_character

.asm_182c: ; 182c (0:182c)
	call LeftShiftInLargeBitField
	jr c, .asm_1836
	ld a, "く"
	jp .queue_character

.asm_1836
	call LeftShiftInLargeBitField
	jr c, .asm_1840
	ld a, "わ"
	jp .queue_character

.asm_1840
	ld a, "せ"
	jp .queue_character

.asm_1845: ; 1845 (0:1845)
	call LeftShiftInLargeBitField
	jp c, .asm_191b
	call LeftShiftInLargeBitField
	jp c, .asm_189c
	call LeftShiftInLargeBitField
	jr c, .asm_186f
	call LeftShiftInLargeBitField
	jr c, .asm_1860
	ld a, "ん"
	jp .queue_character

.asm_1860
	call LeftShiftInLargeBitField
	jr c, .asm_186a
	ld a, "る"
	jp .queue_character

.asm_186a
	ld a, "こ"
	jp .queue_character

.asm_186f
	call LeftShiftInLargeBitField
	jr c, .asm_1897
	call LeftShiftInLargeBitField
	jr c, .asm_1888
	call LeftShiftInLargeBitField
	jr c, .asm_1883
	ld a, "そ"
	jp .queue_character

.asm_1883
	ld a, "ろ"
	jp .queue_character

.asm_1888
	call LeftShiftInLargeBitField
	jr c, .asm_1892
	ld a, "つ"
	jp .queue_character

.asm_1892
	ld a, "さ"
	jp .queue_character

.asm_1897
	ld a, "た"
	jp .queue_character

.asm_189c: ; 189c (0:189c)
	call LeftShiftInLargeBitField
	jr c, .asm_18b0
	call LeftShiftInLargeBitField
	jr c, .asm_18ab
	ld a, "か"
	jp .queue_character

.asm_18ab
	ld a, "<HIRA>"
	jp .queue_character

.asm_18b0
	call LeftShiftInLargeBitField
	jr c, .asm_18ba
	ld a, "<KATA>"
	jp .queue_character

.asm_18ba
	call LeftShiftInLargeBitField
	jr c, .asm_18ce
	call LeftShiftInLargeBitField
	jr c, .asm_18c9
	ld a, "け"
	jp .queue_character

.asm_18c9
	ld a, "ち"
	jp .queue_character

.asm_18ce
	call LeftShiftInLargeBitField
	jp c, .asm_1916
	call LeftShiftInLargeBitField
	jp c, .asm_1911
	call LeftShiftInLargeBitField
	jr c, .asm_190c
	call LeftShiftInLargeBitField
	jr c, .asm_18e9
	ld a, "ぇ"
	jp .queue_character

.asm_18e9
	call LeftShiftInLargeBitField
	jr c, .asm_18fd
	call LeftShiftInLargeBitField
	jr c, .asm_18f8
	ld a, "6"
	jp .queue_character

.asm_18f8
	ld a, "ぉ"
	jp .queue_character

.asm_18fd
	call LeftShiftInLargeBitField
	jr c, .asm_1907
	ld a, "0"
	jp .queue_character

.asm_1907
	ld a, "5"
	jp .queue_character

.asm_190c
	ld a, "む"
	jp .queue_character

.asm_1911: ; 1911 (0:1911)
	ld a, "?"
	jp .queue_character

.asm_1916: ; 1916 (0:1916)
	ld a, "よ"
	jp .queue_character

.asm_191b: ; 191b (0:191b)
	call LeftShiftInLargeBitField
	jp c, .asm_198b
	call LeftShiftInLargeBitField
	jr c, .asm_192b
	ld a, "ﾞ"
	jp .queue_character

.asm_192b
	call LeftShiftInLargeBitField
	jr c, .asm_193f
	call LeftShiftInLargeBitField
	jr c, .asm_193a
	ld a, "!"
	jp .queue_character

.asm_193a
	ld a, "の"
	jp .queue_character

.asm_193f
	call LeftShiftInLargeBitField
	jp c, .asm_1986
	call LeftShiftInLargeBitField
	jr c, .asm_194f
	ld a, "れ"
	jp .queue_character

.asm_194f
	call LeftShiftInLargeBitField
	jr c, .asm_1981
	call LeftShiftInLargeBitField
	jr c, .asm_195e
	ld a, "ゅ"
	jp .queue_character

.asm_195e
	call LeftShiftInLargeBitField
	jr c, .asm_1968
	ld a, "1"
	jp .queue_character

.asm_1968
	call LeftShiftInLargeBitField
	jr c, .asm_1972
	ld a, "2"
	jp .queue_character

.asm_1972
	call LeftShiftInLargeBitField
	jr c, .asm_197c
	ld a, "7"
	jp .queue_character

.asm_197c
	ld a, "ぃ"
	jp .queue_character

.asm_1981
	ld a, "ね"
	jp .queue_character

.asm_1986: ; 1986 (0:1986)
	ld a, "っ"
	jp .queue_character

.asm_198b: ; 198b (0:198b)
	call LeftShiftInLargeBitField
	jr c, .asm_19b3
	call LeftShiftInLargeBitField
	jr c, .asm_19ae
	call LeftShiftInLargeBitField
	jr c, .asm_199f
	ld a, "は"
	jp .queue_character

.asm_199f
	call LeftShiftInLargeBitField
	jr c, .asm_19a9
	ld a, "ほ"
	jp .queue_character

.asm_19a9
	ld a, "ら"
	jp .queue_character

.asm_19ae
	ld a, "い"
	jp .queue_character

.asm_19b3
	ld a, " "
	jp .queue_character

.queue_character
	ld [de], a
	inc de
	or a
	jr z, .end_string
	cp $a
	jp z, .newline
	cp $1
	jp nz, .loop
	dec de
	push hl
	push bc
	ld l, e
	ld h, d
	ld de, $c309
	call Func_1494
	pop bc
	dec hl
	ld e, l
	ld d, h
	pop hl
	jp .loop

.newline
	xor a
	dec de
	ld [de], a
	ld a, $a
.end_string
	ld e, l
	ld d, h
	pop hl
	push af
	ld [hl], c
	inc hl
	sla b
	sla b
	sla b
	sla b
	sla b
	ld a, [hROMBank]
	or b
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	pop af
	call BankSwitch
	ld a, b
	ret

LeftShiftInLargeBitField: ; 19fd (0:19fd)
	sla c
	dec b
	ret nz
	inc hl
	ld c, [hl]
	ld b, $8
	ret

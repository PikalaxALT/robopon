LiteralStringInTree:: ; 1494 (0:1494)
	ldh a, [hROMBank]
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
	ld a, BANK(ApplyPoncotNameCharmap)
	call BankSwitch
	pop af
	call ApplyPoncotNameCharmap
	jr .loop

.done
	bit 0, b
	jr z, .bit_0_clear
	ld a, CHARVAL(")")
	ld [hli], a
	xor a
.bit_0_clear
	ld [hli], a
	pop af
	call BankSwitch
	ret

CheckVideoTransferQueue:: ; 14bf (0:14bf)
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

WaitVideoTransfer:: ; 14d4 (0:14d4)
; blocks until wVideoTransferQueue is empty
.loop
	call CheckVideoTransferQueue
	jr nz, .loop
	ret

Coord2TileMap:: ; 14da (0:14da)
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

Coord2AttrMap::
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

OverworldPlaySong:: ; 14fc
	ld [wSongCurrentlyPlaying], a
	jp StartSong

OverworldPlaySFX:: ; 1502
	ld [wSFXCurrentlyPlaying], a
	jp StartSFX

OverworldStopMusic:: ; 1508
	xor a
	jr OverworldPlaySong

OverworldStopSFX:: ; 150b
	xor a
	jr OverworldPlaySFX

PlaceString:: ; 150e (0:150e)
; printf
; source: on stack
; dest: screen at (wStringDestX, wStringDestY)
; additional arguments on stack, if applicable
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
PlaceNextCharacter::
	ld a, [de]
	inc de
	or a
	jr nz, CheckDict
	ret

CheckDict::
	cp CHARVAL("%")
	jp z, .SpecialCharacter
	cp CHARVAL("(")
	jr z, .set_hiragana
	cp CHARVAL(")")
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
; This is where the format codes are handled.
; %d: short
; %c: char
; %s: char*
; %l: literal
; %ld: unsigned long
	ld a, [de]
	inc de
	cp CHARVAL("d")
	jr z, .print_num
	cp CHARVAL("c")
	jr z, .place_stack_char
	cp CHARVAL("s")
	jr z, .call_string
	cp CHARVAL("l")
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
	reg16swap de, hl
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
	cp CHARVAL("d")
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

PrintCharacterFromTree::
	ldh a, [hROMBank]
	push af
	ld a, BANK(TextTreeBitstreams)
	call BankSwitch
	push hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; hl = pointer
	; bc = pointer table index if hl == $ffff
	; otherwise:
	;     b = number of bits remaining on current byte (bits 5-7),
	;         bank (bits 0-4)
	;     c = last byte read (with bits remaining)
	inc a
	jr nz, .addr_okay
	xor h
	inc a
	jr nz, .addr_okay
	ld l, c
	ld h, b
	add hl, hl
	ld bc, TextTreeBitstreams
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
	add BANK(TextTreeBitstreams)
	ld b, a
	call BankSwitch
	res 7, h
	set 6, h
	ld c, [hl]
.addr_okay
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
	call .GetNextBit
	jp c, .bits1
	call .GetNextBit
	jp c, .bits01
	call .GetNextBit
	jp c, .bits001
	call .GetNextBit
	jr c, .bits0001
	call .GetNextBit
	jr c, .bits00001
	call .GetNextBit
	jr c, .bits000001
	call .GetNextBit
	jr c, .bits0000001
	; 0000000
	ld a, CHARVAL("ふ")
	jp .queue_character

.bits0000001
	ld a, CHARVAL("ひ")
	jp .queue_character

.bits000001
	ld a, CHARVAL("す")
	jp .queue_character

.bits00001
	ld a, CHARVAL("な")
	jp .queue_character

.bits0001
	call .GetNextBit
	jr c, .bits00011
	call .GetNextBit
	jr c, .bits000101
	; 000100
	ld a, CHARVAL("ま")
	jp .queue_character

.bits000101
	ld a, CHARVAL("あ")
	jp .queue_character

.bits00011
	ld a, CHARVAL("う")
	jp .queue_character

.bits001
	call .GetNextBit
	jp c, .bits0011
	call .GetNextBit
	jr c, .bits00101
	call .GetNextBit
	jr c, .bits001001
	call .GetNextBit
	jr c, .bits0010001
	; 0010000
	ld a, CHARVAL("ゃ")
	jp .queue_character

.bits0010001
	ld a, CHARVAL("み")
	jp .queue_character

.bits001001
	ld a, CHARVAL("も")
	jp .queue_character

.bits00101
	call .GetNextBit
	jr c, .bits001011
	call .GetNextBit
	jr c, .bits0010101
	call .GetNextBit
	jr c, .bits00101001
	call .GetNextBit
	jr c, .bits001010001
	; 001010000
	ld a, CHARVAL("ゆ")
	jp .queue_character

.bits001010001
	ld a, CHARVAL("ぁ")
	jp .queue_character

.bits00101001
	ld a, CHARVAL("へ")
	jp .queue_character

.bits0010101
	ld a, CHARVAL("え")
	jp .queue_character

.bits001011
	ld a, CHARVAL("お")
	jp .queue_character

.bits0011
	call .GetNextBit
	jr c, .bits00111
	call .GetNextBit
	jr c, .bits001101
	; 001100
	ld a, CHARVAL("き")
	jp .queue_character

.bits001101
	call .GetNextBit
	jr c, .bits0011011
	; 0011010
	ld a, CHARVAL("や")
	jp .queue_character

.bits0011011
	ld a, CHARVAL("を")
	jp .queue_character

.bits00111
	ld a, CHARVAL("と")
	jp .queue_character

.bits01
	call .GetNextBit
	jp c, .bits011
	call .GetNextBit
	jr c, .bits0101
	; 0100
	ld a, $a
	jp .queue_character

.bits0101
	call .GetNextBit
	jr c, .bits01011
	call .GetNextBit
	jr c, .bits010101
	call .GetNextBit
	jr c, .bits0101001
	; 0101000
	ld a, CHARVAL("ょ")
	jp .queue_character

.bits0101001
	ld a, CHARVAL("ﾟ")
	jp .queue_character

.bits010101
	ld a, CHARVAL("に")
	jp .queue_character

.bits01011
	call .GetNextBit
	jr c, .bits010111
	; 010110
	ld a, $0
	jp .queue_character

.bits010111
	ld a, CHARVAL("ー")
	jp .queue_character

.bits011
	call .GetNextBit
	jr c, .bits0111
	call .GetNextBit
	jr c, .bits01101
	; 01100
	ld a, CHARVAL("て")
	jp .queue_character

.bits01101
	ld a, CHARVAL("し")
	jp .queue_character

.bits0111
	call .GetNextBit
	jp c, .bits01111
	call .GetNextBit
	jr c, .bits011101
	; 011100
	ld a, CHARVAL("#")
	jp .queue_character

.bits011101
	call .GetNextBit
	jr c, .bits0111011
	; 0111010
	ld a, CHARVAL("り")
	jp .queue_character

.bits0111011
	call .GetNextBit
	jr c, .bits01110111
	; 01110110
	ld a, CHARVAL("め")
	jp .queue_character

.bits01110111
	call .GetNextBit
	jp c, .bits011101111
	call .GetNextBit
	jr c, .bits0111011101
	call .GetNextBit
	jr c, .bits01110111001
	call .GetNextBit
	jr c, .bits011101110001
	call .GetNextBit
	jr c, .bits0111011100001
	; 0111011100000
	ld a, CHARVAL("9")
	jp .queue_character

.bits0111011100001
	ld a, CHARVAL("ぅ")
	jp .queue_character

.bits011101110001
	ld a, CHARVAL("ぬ")
	jp .queue_character

.bits01110111001
	ld a, CHARVAL("8")
	jp .queue_character

.bits0111011101
	call .GetNextBit
	jr c, .bits01110111011
	; 01110111010
	ld a, CHARVAL("4")
	jp .queue_character

.bits01110111011
	ld a, CHARVAL("3")
	jp .queue_character

.bits011101111
	ld a, $1
	jp .queue_character

.bits01111
	call .GetNextBit
	jr c, .bits011111
	; 011110
	ld a, CHARVAL("く")
	jp .queue_character

.bits011111
	call .GetNextBit
	jr c, .bits0111111
	; 0111110
	ld a, CHARVAL("わ")
	jp .queue_character

.bits0111111
	ld a, CHARVAL("せ")
	jp .queue_character

.bits1
	call .GetNextBit
	jp c, .bits11
	call .GetNextBit
	jp c, .bits101
	call .GetNextBit
	jr c, .bits1001
	call .GetNextBit
	jr c, .bits10001
	; 10000
	ld a, CHARVAL("ん")
	jp .queue_character

.bits10001
	call .GetNextBit
	jr c, .bits100011
	; 100010
	ld a, CHARVAL("る")
	jp .queue_character

.bits100011
	ld a, CHARVAL("こ")
	jp .queue_character

.bits1001
	call .GetNextBit
	jr c, .bits10011
	call .GetNextBit
	jr c, .bits100101
	call .GetNextBit
	jr c, .bits1001001
	; 1001000
	ld a, CHARVAL("そ")
	jp .queue_character

.bits1001001
	ld a, CHARVAL("ろ")
	jp .queue_character

.bits100101
	call .GetNextBit
	jr c, .bits1001011
	; 1001010
	ld a, CHARVAL("つ")
	jp .queue_character

.bits1001011
	ld a, CHARVAL("さ")
	jp .queue_character

.bits10011
	ld a, CHARVAL("た")
	jp .queue_character

.bits101
	call .GetNextBit
	jr c, .bits1011
	call .GetNextBit
	jr c, .bits10101
	; 10100
	ld a, CHARVAL("か")
	jp .queue_character

.bits10101
	ld a, CHARVAL("(")
	jp .queue_character

.bits1011
	call .GetNextBit
	jr c, .bits10111
	; 10110
	ld a, CHARVAL(")")
	jp .queue_character

.bits10111
	call .GetNextBit
	jr c, .bits101111
	call .GetNextBit
	jr c, .bits1011101
	; 1011100
	ld a, CHARVAL("け")
	jp .queue_character

.bits1011101
	ld a, CHARVAL("ち")
	jp .queue_character

.bits101111
	call .GetNextBit
	jp c, .bits1011111
	call .GetNextBit
	jp c, .bits10111101
	call .GetNextBit
	jr c, .bits101111001
	call .GetNextBit
	jr c, .bits1011110001
	; 1011110000
	ld a, CHARVAL("ぇ")
	jp .queue_character

.bits1011110001
	call .GetNextBit
	jr c, .bits10111100011
	call .GetNextBit
	jr c, .bits101111000101
	; 101111000100
	ld a, CHARVAL("6")
	jp .queue_character

.bits101111000101
	ld a, CHARVAL("ぉ")
	jp .queue_character

.bits10111100011
	call .GetNextBit
	jr c, .bits101111000111
	; 101111000110
	ld a, CHARVAL("0")
	jp .queue_character

.bits101111000111
	ld a, CHARVAL("5")
	jp .queue_character

.bits101111001
	ld a, CHARVAL("む")
	jp .queue_character

.bits10111101
	ld a, CHARVAL("?")
	jp .queue_character

.bits1011111
	ld a, CHARVAL("よ")
	jp .queue_character

.bits11
	call .GetNextBit
	jp c, .bits111
	call .GetNextBit
	jr c, .bits1101
	; 1100
	ld a, CHARVAL("ﾞ")
	jp .queue_character

.bits1101
	call .GetNextBit
	jr c, .bits11011
	call .GetNextBit
	jr c, .bits110101
	; 110100
	ld a, CHARVAL("!")
	jp .queue_character

.bits110101
	ld a, CHARVAL("の")
	jp .queue_character

.bits11011
	call .GetNextBit
	jp c, .bits110111
	call .GetNextBit
	jr c, .bits1101101
	; 1101100
	ld a, CHARVAL("れ")
	jp .queue_character

.bits1101101
	call .GetNextBit
	jr c, .bits11011011
	call .GetNextBit
	jr c, .bits110110101
	; 110110100
	ld a, CHARVAL("ゅ")
	jp .queue_character

.bits110110101
	call .GetNextBit
	jr c, .bits1101101011
	; 1101101010
	ld a, CHARVAL("1")
	jp .queue_character

.bits1101101011
	call .GetNextBit
	jr c, .bits11011010111
	; 11011010110
	ld a, CHARVAL("2")
	jp .queue_character

.bits11011010111
	call .GetNextBit
	jr c, .bits110110101111
	; 110110101110
	ld a, CHARVAL("7")
	jp .queue_character

.bits110110101111
	ld a, CHARVAL("ぃ")
	jp .queue_character

.bits11011011
	ld a, CHARVAL("ね")
	jp .queue_character

.bits110111
	ld a, CHARVAL("っ")
	jp .queue_character

.bits111
	call .GetNextBit
	jr c, .bits1111
	call .GetNextBit
	jr c, .bits11101
	call .GetNextBit
	jr c, .bits111001
	; 111000
	ld a, CHARVAL("は")
	jp .queue_character

.bits111001
	call .GetNextBit
	jr c, .bits1110011
	; 1110010
	ld a, CHARVAL("ほ")
	jp .queue_character

.bits1110011
	ld a, CHARVAL("ら")
	jp .queue_character

.bits11101
	ld a, CHARVAL("い")
	jp .queue_character

.bits1111
	ld a, CHARVAL(" ")
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
	ld de, wPlayerName
	call LiteralStringInTree
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
	ldh a, [hROMBank]
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

.GetNextBit: ; 19fd (0:19fd)
	sla c
	dec b
	ret nz
	inc hl
	ld c, [hl]
	ld b, $8
	ret

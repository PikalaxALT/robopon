SECTION "Bank 12 Tree", ROMX [$78ac], BANK [$12]
Func_4b8ac:: ; 4b8ac (12:78ac)
	ld a, [hROMBank]
	push af
	ld a, BANK(TextTreeBitstreams2)
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
	jr nz, .asm_4b8e0
	xor h
	inc a
	jr nz, .asm_4b8e0
	ld l, c
	ld h, b
	add hl, hl
	ld bc, TextTreeBitstreams2
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
	add BANK(TextTreeBitstreams2)
	ld b, a
	call BankSwitch  ; ????????
	res 7, h
	set 6, h
	ld c, [hl]
.asm_4b8e0
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
	jr z, .asm_4b8f6
	ld b, a
.asm_4b8f6
	call .GetNextBit
	jp c, .asm_4ba13
	call .GetNextBit
	jp c, .asm_4b981
	call .GetNextBit
	jr c, .asm_4b90c
	ld a, "ﾞ"
	jp .done

.asm_4b90c
	call .GetNextBit
	jr c, .asm_4b920
	call .GetNextBit
	jr c, .asm_4b91b
	ld a, "ほ"
	jp .done

.asm_4b91b
	ld a, "の"
	jp .done

.asm_4b920
	call .GetNextBit
	jp c, .asm_4b97c
	call .GetNextBit
	jr c, .asm_4b930
	ld a, "つ"
	jp .done

.asm_4b930
	call .GetNextBit
	jr c, .asm_4b93a
	ld a, "わ"
	jp .done

.asm_4b93a
	call .GetNextBit
	jp c, .asm_4b977
	call .GetNextBit
	jr c, .asm_4b972
	call .GetNextBit
	jr c, .asm_4b94f
	ld a, "1"
	jp .done

.asm_4b94f
	call .GetNextBit
	jr c, .asm_4b959
	ld a, "ぃ"
	jp .done

.asm_4b959
	call .GetNextBit
	jr c, .asm_4b96d
	call .GetNextBit
	jr c, .asm_4b968
	ld a, "6"
	jp .done

.asm_4b968
	ld a, "8"
	jp .done

.asm_4b96d
	ld a, "3"
	jp .done

.asm_4b972
	ld a, "0"
	jp .done

.asm_4b977
	ld a, "ね"
	jp .done

.asm_4b97c
	ld a, "く"
	jp .done

.asm_4b981
	call .GetNextBit
	jp c, .asm_4b9d2
	call .GetNextBit
	jr c, .asm_4b9a5
	call .GetNextBit
	jr c, .asm_4b9a0
	call .GetNextBit
	jr c, .asm_4b99b
	ld a, "っ"
	jp .done

.asm_4b99b
	ld a, "を"
	jp .done

.asm_4b9a0
	ld a, "と"
	jp .done

.asm_4b9a5
	call .GetNextBit
	jr c, .asm_4b9af
	ld a, "し"
	jp .done

.asm_4b9af
	call .GetNextBit
	jr c, .asm_4b9b9
	ld a, "ら"
	jp .done

.asm_4b9b9
	call .GetNextBit
	jr c, .asm_4b9cd
	call .GetNextBit
	jr c, .asm_4b9c8
	ld a, "へ"
	jp .done

.asm_4b9c8
	ld a, "ゅ"
	jp .done

.asm_4b9cd
	ld a, "あ"
	jp .done

.asm_4b9d2
	call .GetNextBit
	jr c, .asm_4b9e6
	call .GetNextBit
	jr c, .asm_4b9e1
	ld a, "う"
	jp .done

.asm_4b9e1
	ld a, "て"
	jp .done

.asm_4b9e6
	call .GetNextBit
	jr c, .asm_4b9fa
	call .GetNextBit
	jr c, .asm_4b9f5
	ld a, "に"
	jp .done

.asm_4b9f5
	ld a, "こ"
	jp .done

.asm_4b9fa
	call .GetNextBit
	jr c, .asm_4ba0e
	call .GetNextBit
	jr c, .asm_4ba09
	ld a, "ひ"
	jp .done

.asm_4ba09
	ld a, "せ"
	jp .done

.asm_4ba0e
	ld a, "す"
	jp .done

.asm_4ba13
	call .GetNextBit
	jp c, .asm_4bb1f
	call .GetNextBit
	jp c, .asm_4ba94
	call .GetNextBit
	jr c, .asm_4ba3d
	call .GetNextBit
	jr c, .asm_4ba38
	call .GetNextBit
	jr c, .asm_4ba33
	ld a, $0
	jp .done

.asm_4ba33
	ld a, "ﾟ"
	jp .done

.asm_4ba38
	ld a, $a
	jp .done

.asm_4ba3d
	call .GetNextBit
	jp c, .asm_4ba8f
	call .GetNextBit
	jr c, .asm_4ba4d
	ld a, "な"
	jp .done

.asm_4ba4d
	call .GetNextBit
	jp c, .asm_4ba8a
	call .GetNextBit
	jr c, .asm_4ba85
	call .GetNextBit
	jr c, .asm_4ba80
	call .GetNextBit
	jr c, .asm_4ba67
	ld a, "2"
	jp .done

.asm_4ba67
	call .GetNextBit
	jr c, .asm_4ba71
	ld a, "5"
	jp .done

.asm_4ba71
	call .GetNextBit
	jr c, .asm_4ba7b
	ld a, "ぇ"
	jp .done

.asm_4ba7b
	ld a, "!"
	jp .done

.asm_4ba80
	ld a, "む"
	jp .done

.asm_4ba85
	ld a, "え"
	jp .done

.asm_4ba8a
	ld a, "ち"
	jp .done

.asm_4ba8f
	ld a, "た"
	jp .done

.asm_4ba94
	call .GetNextBit
	jr c, .asm_4ba9e
	ld a, " "
	jp .done

.asm_4ba9e
	call .GetNextBit
	jp c, .asm_4bb1a
	call .GetNextBit
	jr c, .asm_4bab8
	call .GetNextBit
	jr c, .asm_4bab3
	ld a, "お"
	jp .done

.asm_4bab3
	ld a, "け"
	jp .done

.asm_4bab8
	call .GetNextBit
	jr c, .asm_4bac2
	ld a, "れ"
	jp .done

.asm_4bac2
	call .GetNextBit
	jp c, .asm_4bb15
	call .GetNextBit
	jp c, .asm_4bb10
	call .GetNextBit
	jp c, .asm_4bb0b
	call .GetNextBit
	jr c, .asm_4bae8
	call .GetNextBit
	jr c, .asm_4bae3
	ld a, "4"
	jp .done

.asm_4bae3
	ld a, "ぁ"
	jp .done

.asm_4bae8
	call .GetNextBit
	jr c, .asm_4bafc
	call .GetNextBit
	jr c, .asm_4baf7
	ld a, "7"
	jp .done

.asm_4baf7
	ld a, "9"
	jp .done

.asm_4bafc
	call .GetNextBit
	jr c, .asm_4bb06
	ld a, "?"
	jp .done

.asm_4bb06
	ld a, "ぬ"
	jp .done

.asm_4bb0b
	ld a, "ゆ"
	jp .done

.asm_4bb10
	ld a, "ゃ"
	jp .done

.asm_4bb15
	ld a, "そ"
	jp .done

.asm_4bb1a
	ld a, "ん"
	jp .done

.asm_4bb1f
	call .GetNextBit
	jp c, .asm_4bb84
	call .GetNextBit
	jr c, .asm_4bb57
	call .GetNextBit
	jr c, .asm_4bb52
	call .GetNextBit
	jr c, .asm_4bb39
	ld a, "き"
	jp .done

.asm_4bb39
	call .GetNextBit
	jr c, .asm_4bb43
	ld a, "ょ"
	jp .done

.asm_4bb43
	call .GetNextBit
	jr c, .asm_4bb4d
	ld a, "よ"
	jp .done

.asm_4bb4d
	ld a, "や"
	jp .done

.asm_4bb52
	ld a, "("
	jp .done

.asm_4bb57
	call .GetNextBit
	jr c, .asm_4bb61
	ld a, ")"
	jp .done

.asm_4bb61
	call .GetNextBit
	jr c, .asm_4bb75
	call .GetNextBit
	jr c, .asm_4bb70
	ld a, "ふ"
	jp .done

.asm_4bb70
	ld a, "ー"
	jp .done

.asm_4bb75
	call .GetNextBit
	jr c, .asm_4bb7f
	ld a, "り"
	jp .done

.asm_4bb7f
	ld a, "さ"
	jp .done

.asm_4bb84
	call .GetNextBit
	jr c, .asm_4bbb6
	call .GetNextBit
	jr c, .asm_4bb93
	ld a, "か"
	jp .done

.asm_4bb93
	call .GetNextBit
	jr c, .asm_4bb9d
	ld a, "る"
	jp .done

.asm_4bb9d
	call .GetNextBit
	jr c, .asm_4bba7
	ld a, "ま"
	jp .done

.asm_4bba7
	call .GetNextBit
	jr c, .asm_4bbb1
	ld a, "み"
	jp .done

.asm_4bbb1
	ld a, "め"
	jp .done

.asm_4bbb6
	call .GetNextBit
	jr c, .asm_4bbd4
	call .GetNextBit
	jr c, .asm_4bbc5
	ld a, "は"
	jp .done

.asm_4bbc5
	call .GetNextBit
	jr c, .asm_4bbcf
	ld a, "も"
	jp .done

.asm_4bbcf
	ld a, "ろ"
	jp .done

.asm_4bbd4
	ld a, "い"
	jp .done

.done
	ld [de], a
	inc de
	or a
	jr z, .finish
	cp $a
	jp z, .newline
	cp $1
	jp nz, .asm_4b8f6
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
	jp .asm_4b8f6

.newline
	xor a
	dec de
	ld [de], a
	ld a, $a
.finish
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

.GetNextBit: ; 4bc1e (12:7c1e)
	sla c
	dec b
	ret nz
	inc hl
	ld c, [hl]
	ld b, $8
	ret


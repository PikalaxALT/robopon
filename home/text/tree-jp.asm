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

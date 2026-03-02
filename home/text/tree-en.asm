	call .GetNextBit
	jp c, .bits1
	call .GetNextBit
	jp c, .bits01
	call .GetNextBit
	jr c, .bits001
	call .GetNextBit
	jr c, .bits0001
	call .GetNextBit
	jr c, .bits00001
	ld a, CHARVAL("d")
	jp .queue_character
.bits00001:
	ld a, CHARVAL("y")
	jp .queue_character
.bits0001:
	ld a, CHARVAL("n")
	jp .queue_character
.bits001:
	call .GetNextBit
	jp c, .bits0011
	call .GetNextBit
	jp c, .bits00101
	call .GetNextBit
	jr c, .bits001001
	call .GetNextBit
	jr c, .bits0010001
	call .GetNextBit
	jr c, .bits00100001
	ld a, CHARVAL("H")
	jp .queue_character
.bits00100001:
	call .GetNextBit
	jr c, .bits001000011
	call .GetNextBit
	jr c, .bits0010000101
	ld a, CHARVAL("x")
	jp .queue_character
.bits0010000101:
	ld a, CHARVAL("N")
	jp .queue_character
.bits001000011:
	ld a, 1
	jp .queue_character
.bits0010001:
	ld a, CHARVAL("T")
	jp .queue_character
.bits001001:
	ld a, CHARVAL("p")
	jp .queue_character
.bits00101:
	call .GetNextBit
	jr c, .bits001011
	ld a, CHARVAL("b")
	jp .queue_character
.bits001011:
	call .GetNextBit
	jr c, .bits0010111
	call .GetNextBit
	jr c, .bits00101101
	ld a, CHARVAL("D")
	jp .queue_character
.bits00101101:
	ld a, CHARVAL("W")
	jp .queue_character
.bits0010111:
	call .GetNextBit
	jp c, .bits00101111
	call .GetNextBit
	jp c, .bits001011101
	call .GetNextBit
	jp c, .bits0010111001
	call .GetNextBit
	jr c, .bits00101110001
	ld a, CHARVAL("8")
	jp .queue_character
.bits00101110001:
	call .GetNextBit
	jr c, .bits001011100011
	call .GetNextBit
	jr c, .bits0010111000101
	call .GetNextBit
	jr c, .bits00101110001001
	ld a, CHARVAL("Q")
	jp .queue_character
.bits00101110001001:
	call .GetNextBit
	jr c, .bits001011100010011
	ld a, CHARVAL("X")
	jp .queue_character
.bits001011100010011:
	call .GetNextBit
	jr c, .bits0010111000100111
	ld a, CHARVAL("%")
	jp .queue_character
.bits0010111000100111:
	ld a, CHARVAL(";")
	jp .queue_character
.bits0010111000101:
	ld a, CHARVAL("<")
	jp .queue_character
.bits001011100011:
	ld a, CHARVAL("6")
	jp .queue_character
.bits0010111001:
	ld a, CHARVAL("K")
	jp .queue_character
.bits001011101:
	ld a, CHARVAL("G")
	jp .queue_character
.bits00101111:
	ld a, CHARVAL("R")
	jp .queue_character
.bits0011:
	call .GetNextBit
	jr c, .bits00111
	ld a, CHARVAL("u")
	jp .queue_character
.bits00111:
	call .GetNextBit
	jr c, .bits001111
	ld a, 0
	jp .queue_character
.bits001111:
	ld a, CHARVAL(",")
	jp .queue_character
.bits01:
	call .GetNextBit
	jr c, .bits011
	call .GetNextBit
	jr c, .bits0101
	ld a, CHARVAL("a")
	jp .queue_character
.bits0101:
	ld a, CHARVAL("\n")
	jp .queue_character
.bits011:
	ld a, CHARVAL(" ")
	jp .queue_character
.bits1:
	call .GetNextBit
	jp c, .bits11
	call .GetNextBit
	jp c, .bits101
	call .GetNextBit
	jp c, .bits1001
	call .GetNextBit
	jp c, .bits10001
	call .GetNextBit
	jr c, .bits100001
	ld a, CHARVAL("w")
	jp .queue_character
.bits100001:
	call .GetNextBit
	jr c, .bits1000011
	ld a, CHARVAL("v")
	jp .queue_character
.bits1000011:
	call .GetNextBit
	jr c, .bits10000111
	call .GetNextBit
	jr c, .bits100001101
	call .GetNextBit
	jr c, .bits1000011001
	call .GetNextBit
	jr c, .bits10000110001
	ld a, CHARVAL("3")
	jp .queue_character
.bits10000110001:
	ld a, CHARVAL("2")
	jp .queue_character
.bits1000011001:
	ld a, CHARVAL("j")
	jp .queue_character
.bits100001101:
	ld a, CHARVAL("F")
	jp .queue_character
.bits10000111:
	call .GetNextBit
	jr c, .bits100001111
	ld a, CHARVAL("O")
	jp .queue_character
.bits100001111:
	call .GetNextBit
	jr c, .bits1000011111
	ld a, CHARVAL("E")
	jp .queue_character
.bits1000011111:
	call .GetNextBit
	jr c, .bits10000111111
	ld a, CHARVAL("J")
	jp .queue_character
.bits10000111111:
	ld a, CHARVAL("U")
	jp .queue_character
.bits10001:
	call .GetNextBit
	jr c, .bits100011
	ld a, CHARVAL("g")
	jp .queue_character
.bits100011:
	call .GetNextBit
	jr c, .bits1000111
	call .GetNextBit
	jr c, .bits10001101
	call .GetNextBit
	jr c, .bits100011001
	ld a, CHARVAL("L")
	jp .queue_character
.bits100011001:
	ld a, CHARVAL("C")
	jp .queue_character
.bits10001101:
	call .GetNextBit
	jr c, .bits100011011
	ld a, CHARVAL("M")
	jp .queue_character
.bits100011011:
	ld a, CHARVAL("A")
	jp .queue_character
.bits1000111:
	ld a, CHARVAL("k")
	jp .queue_character
.bits1001:
	ld a, CHARVAL("t")
	jp .queue_character
.bits101:
	call .GetNextBit
	jr c, .bits1011
	call .GetNextBit
	jr c, .bits10101
	ld a, CHARVAL("l")
	jp .queue_character
.bits10101:
	ld a, CHARVAL("h")
	jp .queue_character
.bits1011:
	call .GetNextBit
	jr c, .bits10111
	ld a, CHARVAL("s")
	jp .queue_character
.bits10111:
	call .GetNextBit
	jr c, .bits101111
	ld a, CHARVAL("m")
	jp .queue_character
.bits101111:
	call .GetNextBit
	jr c, .bits1011111
	ld a, CHARVAL("I")
	jp .queue_character
.bits1011111:
	ld a, CHARVAL("'")
	jp .queue_character
.bits11:
	call .GetNextBit
	jp c, .bits111
	call .GetNextBit
	jr c, .bits1101
	ld a, CHARVAL("o")
	jp .queue_character
.bits1101:
	call .GetNextBit
	jr c, .bits11011
	call .GetNextBit
	jr c, .bits110101
	ld a, CHARVAL("c")
	jp .queue_character
.bits110101:
	ld a, CHARVAL("!")
	jp .queue_character
.bits11011:
	call .GetNextBit
	jp c, .bits110111
	call .GetNextBit
	jr c, .bits1101101
	ld a, CHARVAL(",")
	jp .queue_character
.bits1101101:
	call .GetNextBit
	jp c, .bits11011011
	call .GetNextBit
	jp c, .bits110110101
	call .GetNextBit
	jr c, .bits1101101001
	call .GetNextBit
	jr c, .bits11011010001
	call .GetNextBit
	jr c, .bits110110100001
	call .GetNextBit
	jr c, .bits1101101000001
	ld a, CHARVAL(">")
	jp .queue_character
.bits1101101000001:
	call .GetNextBit
	jr c, .bits11011010000011
	ld a, CHARVAL("9")
	jp .queue_character
.bits11011010000011:
	ld a, CHARVAL(":")
	jp .queue_character
.bits110110100001:
	ld a, CHARVAL("0")
	jp .queue_character
.bits11011010001:
	ld a, CHARVAL("z")
	jp .queue_character
.bits1101101001:
	call .GetNextBit
	jr c, .bits11011010011
	ld a, CHARVAL("Z")
	jp .queue_character
.bits11011010011:
	call .GetNextBit
	jr c, .bits110110100111
	ld a, CHARVAL("5")
	jp .queue_character
.bits110110100111:
	ld a, CHARVAL("7")
	jp .queue_character
.bits110110101:
	ld a, CHARVAL("P")
	jp .queue_character
.bits11011011:
	ld a, CHARVAL("?")
	jp .queue_character
.bits110111:
	call .GetNextBit
	jp c, .bits1101111
	call .GetNextBit
	jp c, .bits11011101
	call .GetNextBit
	jr c, .bits110111001
	ld a, CHARVAL("Y")
	jp .queue_character
.bits110111001:
	call .GetNextBit
	jr c, .bits1101110011
	call .GetNextBit
	jr c, .bits11011100101
	ld a, CHARVAL("-")
	jp .queue_character
.bits11011100101:
	ld a, CHARVAL("1")
	jp .queue_character
.bits1101110011:
	call .GetNextBit
	jr c, .bits11011100111
	ld a, CHARVAL("V")
	jp .queue_character
.bits11011100111:
	call .GetNextBit
	jr c, .bits110111001111
	ld a, CHARVAL("q")
	jp .queue_character
.bits110111001111:
	ld a, CHARVAL("4")
	jp .queue_character
.bits11011101:
	call .GetNextBit
	jr c, .bits110111011
	ld a, CHARVAL("S")
	jp .queue_character
.bits110111011:
	ld a, CHARVAL("B")
	jp .queue_character
.bits1101111:
	ld a, CHARVAL("f")
	jp .queue_character
.bits111:
	call .GetNextBit
	jr c, .bits1111
	call .GetNextBit
	jr c, .bits11101
	ld a, CHARVAL("i")
	jp .queue_character
.bits11101:
	ld a, CHARVAL("r")
	jp .queue_character
.bits1111:
	ld a, CHARVAL("e")
	jp .queue_character

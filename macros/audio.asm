	const_def

	const __
	const C_
	const C#
	const D_
	const D#
	const E_
	const F_
	const F#
	const G_
	const G#
	const A_
	const A#
	const B_

note: MACRO
	dn \1, \2 - 1 ; pitch, duration
	ENDM

tempo: MACRO
	db $d0
	db \1 ; tempo
	ENDM

octave: MACRO
	IF \1 <= 0
	fail "invalid argument for octave"
	ENDC
	IF \1 >= 7
	fail "invalid argument for octave"
	ENDC
	db $d0 + \1 ; octave
	ENDM

octave_up: MACRO
	db $d7
	ENDM

octave_down: MACRO
	db $d8
	ENDM

mute_channel: MACRO
	db $d9
	ENDM

dutycycle: MACRO
	db $dc
	db \1 ; duty cycle
	ENDM

startinfloop: MACRO
	db $dd
	ENDM

doinfloop: MACRO
	db $de
	ENDM

setloop: MACRO
	db $df
	db \1 ; counter
	ENDM

doloop: MACRO
	db $e0
	ENDM

jumpchannel: MACRO
	db $e1
	dw \1 ; pointer
	ENDM

callchannel: MACRO
	db $e2
	dw \1 ; pointer
	ENDM

retchannel: MACRO
	db $e3
	ENDM

freqoffset: MACRO
	db $e4
	db \1 ; offset
	ENDM

set_nrx1: MACRO
	db $e5
	db \1
	ENDM

set_background_nrx2: MACRO
	db $e6
	db \1
	ENDM

noise: MACRO
	db $e7
	db \1
	ENDM

set_c13f: MACRO
	db $e8
	db \1
	ENDM

set_foreground_nrx2: MACRO
	db $e9
	db \1
	ENDM

set_c153c157: MACRO
	db $ea
	db \1
	ENDM

set_c15f: MACRO
	db $eb
	db \1
	ENDM

key: MACRO
	db $ec
	db \1
	ENDM

keyrel: MACRO
	db $ed
	db \1
	ENDM

end_channel2: MACRO
	db $f0
	ENDM

end_channel: MACRO
	db $ff
	ENDM

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

MACRO note
	dn \1, \2 - 1 ; pitch, duration
	ENDM

MACRO tempo
	db $d0
	db \1 ; tempo
	ENDM

MACRO octave
	IF \1 <= 0
	fail "invalid argument for octave"
	ENDC
	IF \1 >= 7
	fail "invalid argument for octave"
	ENDC
	db $d0 + \1 ; octave
	ENDM

MACRO octave_up
	db $d7
	ENDM

MACRO octave_down
	db $d8
	ENDM

MACRO mute_channel
	db $d9
	ENDM

MACRO dutycycle
	db $dc
	db \1 ; duty cycle
	ENDM

MACRO startinfloop
	db $dd
	ENDM

MACRO doinfloop
	db $de
	ENDM

MACRO setloop
	db $df
	db \1 ; counter
	ENDM

MACRO doloop
	db $e0
	ENDM

MACRO jumpchannel
	db $e1
	dw \1 ; pointer
	ENDM

MACRO callchannel
	db $e2
	dw \1 ; pointer
	ENDM

MACRO retchannel
	db $e3
	ENDM

MACRO freqoffset
	db $e4
	db \1 ; offset
	ENDM

MACRO set_nrx1
	db $e5
	db \1
	ENDM

MACRO set_background_nrx2
	db $e6
	db \1
	ENDM

MACRO noise
	db $e7
	db \1
	ENDM

MACRO set_c13f
	db $e8
	db \1
	ENDM

MACRO set_foreground_nrx2
	db $e9
	db \1
	ENDM

MACRO set_c153c157
	db $ea
	db \1
	ENDM

MACRO set_c15f
	db $eb
	db \1
	ENDM

MACRO key
	db $ec
	db \1
	ENDM

MACRO keyrel
	db $ed
	db \1
	ENDM

MACRO end_channel
	db $ff
	ENDM


MACRO sfx_frq
	dn $0, \1
	db \2
	ENDM

MACRO sfx_env
	db $10, \1
	ENDM

MACRO sfx_duty
	dn $2, \1
	ENDM

MACRO sfx_startloop
	db $30, \1
	ENDM

MACRO sfx_endloop
	db $40
	ENDM

MACRO sfx_setc1af
	db $50, \1
	ENDM

MACRO sfx_setc1b3
	db $60, \1
	ENDM

MACRO sfx_wave
	dn $7, \1
	ENDM

MACRO sfx_dutycycle
	db $80, \1
	ENDM

MACRO sfx_end
	db $f0
	ENDM

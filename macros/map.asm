person_event: MACRO
	db \1, \2 ; x, y
	db \3 ; ???
	db \4 ; ???
REPT 5
	db \5
	shift
ENDR
	dba \5
	dw \6
	ENDM

wildbot: MACRO
	db \1, \2, \3, \4
	shift
	shift
	shift
	shift

	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
	db \8
	dw \9
	ENDM

person_event: MACRO
	db \1 ; sprite image
	db \2 ; facing
	db \3 ; x coord
	db \4 ; y coord
	db \5 ; width
	db \6 ; height
	db \7
	db \8
	db \9
	shift
	shift
IF \8 == 0
	shift
	dba \8
ELSE
	dbw \8, 0
ENDC
	dw \9
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

MACRO groupdef
	const_def
DEF __enum__ = __enum__ + 1
	ENDM

MACRO mapdef
DEF GROUP_\1 EQU __enum__
	const MAP_\1
DEF \1_WIDTH EQU \2
DEF \1_HEIGHT EQU \3
	ENDM

MACRO map
	db GROUP_\1, MAP_\1
	ENDM

MACRO spawn
	db \1, \2 ; spawn coords
	db \3, \4 ; push coords
	map \5 ; map group and number
	ENDM

MACRO warpdef
	db \1 ; x coord
	db \2 ; y coord
	db \3 ; width
	db \4 ; height
	map \5 ; destination
	db \6, \7 ; spawn location
	db \8, \9 ; step-in path destination
	shift
	db \9 ; warp sound
	ENDM

MACRO person_event
	db \1 ; sprite image
	db \2 ; facing
	db \3 ; x coord
	db \4 ; y coord
	db \5 ; width
	db \6 ; height
	db \7
	db \8
	db \9
	db csbnk
	shift
	shift
	dw \8 ; function pointer
	dw \9 ; param pointer
	ENDM

MACRO wildbot
	db \1 ; x coord
	db \2 ; y coord
	db \3 ; width
	db \4 ; height
	shift
	shift
	shift
	shift

	db \1 ; species
	db \2 ; min level
	db \3 ; max level 
	db \4
	db \5
	db \6
	db \7
	db \8 ; randgen delta 1
	dw \9 ; randgen delta 2
	ENDM

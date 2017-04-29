groupdef: MACRO
	const_def
__enum__ = __enum__ + 1
	ENDM

mapdef: MACRO
GROUP_\1 EQU __enum__
	const MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
	ENDM

map: MACRO
	db GROUP_\1, MAP_\1
	ENDM

warpdef: MACRO
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
	db csbnk
	shift
	shift
	dw \8 ; function pointer
	dw \9 ; param pointer
	ENDM

wildbot: MACRO
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

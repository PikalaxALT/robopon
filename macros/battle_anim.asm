	enum_start 0

	enum battleanim_end_command
battleanim_end: MACRO
	db battleanim_end_command
	ENDM

	enum battleanim_doublepushscreen_command
battleanim_doublepushscreen: MACRO
	db battleanim_doublepushscreen_command
	ENDM

	enum battleanim_02_command
battleanim_02: MACRO
	db battleanim_02_command
	db \1
	db \2
	db \3
	ENDM

	enum battleanim_03_command
battleanim_03: MACRO
	db battleanim_03_command
	db \1
	ENDM

	enum battleanim_04_command
battleanim_04: MACRO
	db battleanim_04_command
	db \1
	ENDM

	enum battleanim_clearsprites_command
battleanim_clearsprites: MACRO
	db battleanim_clearsprites_command
	ENDM

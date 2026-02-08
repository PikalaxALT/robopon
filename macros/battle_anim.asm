	enum_start 0

	enum battleanim_end_command
MACRO battleanim_end
	db battleanim_end_command
	ENDM

	enum battleanim_doublepushscreen_command
MACRO battleanim_doublepushscreen
	db battleanim_doublepushscreen_command
	ENDM

	enum battleanim_02_command
MACRO battleanim_02
	db battleanim_02_command
	db \1
	db \2
	db \3
	ENDM

	enum battleanim_03_command
MACRO battleanim_03
	db battleanim_03_command
	db \1
	ENDM

	enum battleanim_04_command
MACRO battleanim_04
	db battleanim_04_command
	db \1
	ENDM

	enum battleanim_clearsprites_command
MACRO battleanim_clearsprites
	db battleanim_clearsprites_command
	ENDM

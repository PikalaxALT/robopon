Data_815d0:
	dr $815d0, $815f9

Data_815f9: ; 815f9
	dr $815f9, $815ff

Data_815ff: ; 815ff
	dr $815ff, $81603

Data_81603: ; 81603
	dr $81603, $81607

Func_81607:
	ld a, e
	or a
	jp nz, Func_8171a
	ld hl, $2
	call CheckEventFlag_20
	or a
	jp nz, Func_81704
	ld a, [wPlayerFacing]
	cp FACE_RIGHT
	jp nz, Func_8162b
	ld c, $0
	ld de, Data_815f9
	ld a, BANK(Data_815f9)
	call ApplyMovementData_20
	jp Func_81635

Func_8162b: ; 8162b (20:562b)
	ld c, $0
	ld de, Data_815ff
	ld a, BANK(Data_815ff)
	call ApplyMovementData_20
Func_81635: ; 81635 (20:5635)
	xor a
	call PlayerFace_20
	ld a, $a
	call FadeOutAudio_20
	xor a
	call PlayMusic_20
	ld e, FACE_DOWN
	xor a
	call SpriteFace_20
	ld e, FACE_DOWN
	ld a, $1
	call SpriteFace_20
	ld a, $1
	call FadeInAudio_20
	ld a, SONG_ENCOUNTER_EVIL
	call PlayMusic_20
	writenpctext TreeBitstreamText_3969a
	writenpctext TreeBitstreamText_396d0
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_816da
	ld de, Data_8171b
	ld hl, Data_815d0
	call ScriptedBattle_20
	or a
	jp nz, .won
	jp Func_8171a

.won
	ld hl, $19
	call PrintTextWithNPCName_20
	ld bc, Data_81603
	ld e, BANK(Data_81603)
	ld a, $1
	call Func_801f7_20
	ld a, $2e
	call PlaySFX_20
	call Func_8020c_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	ld hl, $1e
	call ScriptSleep_20
	xor a
	call PlayMusic_20
	ld a, SONG_TOWN1
	call PlayMusic_20
	ld hl, $3
	call CheckEventFlag_20
	or a
	jp nz, Func_816cc
	writenpctext TreeBitstreamText_3972e
	writenpctext TreeBitstreamText_39760
	writenpctext TreeBitstreamText_3976c
	jp Func_816cf

Func_816cc: ; 816cc (20:56cc)
	call Func_8172f
Func_816cf: ; 816cf (20:56cf)
	ld e, $1
	ld hl, $2
	call EventFlagAction_20
	jp Func_81701

Func_816da: ; 816da (20:56da)
	ld a, $69
	call PlaySFX_20
	writenpctext TreeBitstreamText_39718
	ld hl, $1e
	call ScriptSleep_20
	ld e, FACE_LEFT
	xor a
	call SpriteFace_20
	ld e, FACE_RIGHT
	ld a, $1
	call SpriteFace_20
	xor a
	call PlayMusic_20
	ld a, SONG_TOWN1
	call PlayMusic_20
Func_81701: ; 81701 (20:5701)
	jp Func_8171a

Func_81704: ; 81704 (20:5704)
	ld hl, $3
	call CheckEventFlag_20
	or a
	jp nz, Func_81717
	ld hl, $1f
	call PrintTextWithNPCName_20
	jp Func_8171a

Func_81717: ; 81717 (20:5717)
	call Func_8172f
Func_8171a: ; 8171a (20:571a)
	ret

Data_8171b:
	db "<HIRA>こふﾞん1<KATA>$"

Data_81723: ; 81723
	dr $81723, $81727

Data_81727: ; 81727
	dr $81727, $8172b

Data_8172b: ; 8172b
	dr $8172b, $8172f

Func_8172f: ; 8172f (20:572f)
	ld hl, $4
	call CheckEventFlag_20
	or a
	jp nz, Func_817c9
	ld c, $e
	ld e, $c
	ld a, $3
	call Func_80080_20
	ld hl, $21
	call PrintTextWithNPCName_20
	ld hl, $22
	call PrintTextWithNPCName_20
	ld hl, $1e
	call ScriptSleep_20
	ld a, $19
	call PlayMusic_20
	ld bc, Data_81727
	ld e, BANK(Data_81727)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	ld hl, $1e
	call ScriptSleep_20
	ld c, $1
	ld de, Data_81723
	ld a, BANK(Data_81723)
	call ApplyMovementData_20
	call Func_8020c_20
	ld a, $2
	call PlayerFace_20
	ld hl, $1e
	call ScriptSleep_20
	xor a
	call PlayMusic_20
	ld a, $3
	call PlayMusic_20
	ld hl, $17d
	call PrintTextWithNPCName_20
	ld hl, $2a
	call PrintTextWithNPCName_20
	ld hl, $2b
	call PrintTextWithNPCName_20
	ld hl, $2c
	call PrintTextWithNPCName_20
	ld a, $2e
	call PlaySFX_20
	ld bc, Data_8172b
	ld e, BANK(Data_8172b)
	ld a, $3
	call Func_801f7_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld e, $1
	ld hl, $4
	call EventFlagAction_20
	jp Func_817d3

Func_817c9: ; 817c9 (20:57c9)
	xor a
	call Func_8044b_20
	ld hl, $3bf
	call PrintTextWithNPCName_20
Func_817d3: ; 817d3 (20:57d3)
	ret


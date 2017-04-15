Data_817d4:
	dr $817d4, $817fd

Data_817fd: ; 817fd
	dr $817fd, $81801

Data_81801: ; 81801
	dr $81801, $81805

Data_81805: ; 81805
	dr $81805, $8180d

Data_8180d: ; 8180d
	dr $8180d, $81811

Func_81811:
	ld a, e
	or a
	jp nz, Func_81966
	ld hl, $3
	call CheckEventFlag_20
	or a
	jp nz, Func_8193b
	ld c, $1
	ld de, Data_8180d
	ld a, BANK(Data_8180d)
	call ApplyMovementData_20
	ld a, $1
	call PlayerFace_20
	ld a, $a
	call FadeOutAudio_20
	xor a
	call PlayMusic_20
	ld e, $3
	ld a, $3
	call SpriteFace_20
	ld e, $3
	ld a, $4
	call SpriteFace_20
	ld a, $1
	call FadeInAudio_20
	ld a, $1a
	call PlayMusic_20
	ld hl, $23
	call PrintTextWithNPCName_20
	ld hl, $24
	call PrintTextWithNPCName_20
	ld hl, $25
	call PrintTextWithNPCName_20
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_81910
	ld de, Data_81967
	ld hl, Data_817d4
	call ScriptedBattle_20
	or a
	jp nz, Func_8187c
	jp Func_81966

Func_8187c: ; 8187c (20:587c)
	ld hl, $27
	call PrintTextWithNPCName_20
	ld bc, Data_817fd
	ld e, BANK(Data_817fd)
	ld a, $4
	call Func_801f7_20
	ld a, $2e
	call PlaySFX_20
	call Func_8020c_20
	ld e, $0
	ld a, $4
	call Func_8013d_20
	xor a
	call PlayMusic_20
	ld a, $3
	call PlayMusic_20
	ld hl, $2
	call CheckEventFlag_20
	or a
	jp nz, Func_818b7
	ld hl, $28
	call PrintTextWithNPCName_20
	jp Func_81905

Func_818b7: ; 818b7 (20:58b7)
	ld c, $1
	ld de, Data_81801
	ld a, BANK(Data_81801)
	call ApplyMovementData_20
	call Func_8020c_20
	ld a, $1
	call PlayerFace_20
	ld hl, $29
	call PrintTextWithNPCName_20
	ld hl, $2a
	call PrintTextWithNPCName_20
	ld hl, $2b
	call PrintTextWithNPCName_20
	ld hl, $2c
	call PrintTextWithNPCName_20
	ld a, $2e
	call PlaySFX_20
	ld bc, Data_81805
	ld e, BANK(Data_81805)
	ld a, $3
	call Func_80688_20
	ld a, $2
	call PlayerFace_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld e, $0
	xor a
	call Func_8013d_20
Func_81905: ; 81905 (20:5905)
	ld e, $1
	ld hl, $3
	call EventFlagAction_20
	jp Func_81938

Func_81910: ; 81910 (20:5910)
	ld a, $69
	call PlaySFX_20
	ld hl, $26
	call PrintTextWithNPCName_20
	ld hl, $1e
	call ScriptSleep_20
	ld e, $2
	ld a, $3
	call SpriteFace_20
	ld e, $0
	ld a, $4
	call SpriteFace_20
	xor a
	call PlayMusic_20
	ld a, $3
	call PlayMusic_20
Func_81938: ; 81938 (20:5938)
	jp Func_81966

Func_8193b: ; 8193b (20:593b)
	ld hl, $2
	call CheckEventFlag_20
	or a
	jp nz, Func_8194e
	ld hl, $28
	call PrintTextWithNPCName_20
	jp Func_81966

Func_8194e: ; 8194e (20:594e)
	ld hl, $29
	call PrintTextWithNPCName_20
	ld hl, $2a
	call PrintTextWithNPCName_20
	ld hl, $2b
	call PrintTextWithNPCName_20
	ld hl, $2c
	call PrintTextWithNPCName_20
Func_81966: ; 81966 (20:5966)
	ret

Data_81967:
	db "<HIRA>こふﾞん2<KATA>$"


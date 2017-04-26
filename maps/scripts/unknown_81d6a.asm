Data_81cb4:
	db $7, $2, $1, $1, $0, $1, $7, $2, $7, $3, $2e

Data_81cbf: ; 81cbf
	dr $81cbf, $81cd0

Data_81cd0: ; 81cd0
	dr $81cd0, $81cfa

Data_81cfa: ; 81cfa
	dr $81cfa, $81d40

Data_81d40: ; 81d40
	dr $81d40, $81d4e

Data_81d4e: ; 81d4e
	wildbot $0, $0, $6, $6, $2a, $a, $b, $63, $1, $2, $3, $1, $a
	wildbot $0, $0, $6, $6, $2a, $a, $b, $13, $4, $5, $6, $1, $a

Func_81d6a:
	xor a
	ld [wc793], a
	loadwarps $1, Data_81cb4
	ld e, $1
	ld hl, Data_81cbf
	call Func_80ce7_20
	ld a, [wc793]
	or a
	jp z, Func_81d95
	ld a, [wc793]
	cp $2
	jp z, Func_81d95
	ld a, [wc793]
	cp $3
	jp nz, Func_81df9
Func_81d95: ; 81d95 (20:5d95)
	ld a, [wBackupMapGroup]
	cp $1a
	jp nz, Func_81db2
	ld a, [wBackupMapNumber]
	or a
	jp nz, Func_81db2
	loadpeople $1, Data_81d40
	call Func_81f41
	jp Func_81df6

Func_81db2: ; 81db2 (20:5db2)
	loadwarps $1, Data_81cb4
	checkevent $a
	or a
	jp nz, Func_81de6
	playmusic SONG_NONE
	xor a
	call Func_80653_20
	ld e, $5
	ld a, $3
	call Func_80664_20
	call Func_81e2b
	ld e, $1
	ld hl, $a
	call EventFlagAction_20
	ld a, $1
	ld [wc78c], a
	jp Func_81df6

Func_81de6: ; 81de6 (20:5de6)
	loadpeople $3, Data_81cd0
	playmusic $11
	call Func_8001c_20
Func_81df6: ; 81df6 (20:5df6)
	jp Func_81e22

Func_81df9: ; 81df9 (20:5df9)
	loadpeople $3, Data_81cd0
	loadpeople $5, Data_81cfa
	ld a, $5
	call Func_80d01_20
	loadwilds $2, Data_81d4e
	playmusic SONG_TOWN3
	call Func_8001c_20
	xor a
	ld [wc793], a
Func_81e22: ; 81e22 (20:5e22)
	ret

Data_81e23:
	dr $81e23, $81e27

Data_81e27: ; 81e27
	dr $81e27, $81e2b

Func_81e2b: ; 81e2b (20:5e2b)
	ld c, $6
	ld e, $1
	ld a, $1f
	call LoadEmote_20
	call Func_8001c_20
	call Func_801d5_20
	playsfx $67
	script_sleep $3c
	ld a, $66
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $34
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $35
	call OverworldPlaySFX
	script_sleep $1e
	call Func_80ea2_20
	script_sleep $1e
	ld a, $38
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $36
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $3a
	call OverworldPlaySFX
	script_sleep $1e
	call Func_80eb1_20
	ld c, $6
	ld e, $2
	ld a, $1f
	call LoadEmote_20
	call Func_801d5_20
	writetext TreeBitstreamText_38fae
	ld c, $1
	ld e, $4
	ld a, $1f
	call LoadEmote_20
	script_sleep $2d
	ld c, $1
	ld de, Data_81e23
	ld a, BANK(Data_81e23)
	call ApplyMovementData_20
	call Func_801d5_20
	ld a, $3b
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $3c
	call OverworldPlaySFX
	script_sleep $1e
	call Func_80ea2_20
	script_sleep $1e
	ld a, $39
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $3a
	call OverworldPlaySFX
	script_sleep $1e
	script_sleep $1e
	call Func_80eb1_20
	script_sleep $1
	writetext TreeBitstreamText_38fbd
	ld a, $1
	call Func_80653_20
	script_sleep $1
	call Func_8018b_20
	script_sleep $1e
	ld c, $1
	ld de, Data_81e27
	ld a, BANK(Data_81e27)
	call ApplyMovementData_20
	call Func_8020c_20
	ret

Data_81f2d:
	dr $81f2d, $81f33

Data_81f33: ; 81f33
	dr $81f33, $81f37

Data_81f37: ; 81f37
	dr $81f37, $81f3d

Data_81f3d: ; 81f3d
	dr $81f3d, $81f41

Func_81f41: ; 81f41 (20:5f41)
	ld bc, $0
Func_81f44: ; 81f44 (20:5f44)
	ld l, c
	ld h, b
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f63
	ld hl, $0
Func_81f52: ; 81f52 (20:5f52)
	ld de, $fa
	call CompareHLtoDE
	jp nc, Func_81f5f
	inc hl
	jp Func_81f52

Func_81f5f: ; 81f5f (20:5f5f)
	inc bc
	jp Func_81f44

Func_81f63: ; 81f63 (20:5f63)
	playsfx $67
	ld bc, $0
Func_81f6b: ; 81f6b (20:5f6b)
	ld l, c
	ld h, b
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f8a
	ld hl, $0
Func_81f79: ; 81f79 (20:5f79)
	ld de, $96
	call CompareHLtoDE
	jp nc, Func_81f86
	inc hl
	jp Func_81f79

Func_81f86: ; 81f86 (20:5f86)
	inc bc
	jp Func_81f6b

Func_81f8a: ; 81f8a (20:5f8a)
	call UnloadWarps_20
	playmusic SONG_NONE
	xor a
	call Func_80653_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $8
	ld e, $1
	ld a, $1f
	call LoadEmote_20
	call Func_8001c_20
	call Func_801d5_20
	script_sleep $3c
	playsfx $2e
	ld e, $1
	xor a
	call Func_8013d_20
	ld bc, Data_81f2d
	ld e, BANK(Data_81f2d)
	xor a
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call SpriteFace_20
	writenpctext TreeBitstreamText_3ec9f
	ld bc, Data_81f33
	ld e, BANK(Data_81f33)
	xor a
	call Func_80688_20
	call Func_8020c_20
	playsfx $2e
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call LoadEmote_20
	script_sleep $2d
	ld c, $1
	ld de, Data_81f37
	ld a, BANK(Data_81f37)
	call ApplyMovementData_20
	call Func_801d5_20
	xor a
	call PlayerFace_20
	ld a, $1
	call Func_80653_20
	script_sleep $1
	call Func_8018b_20
	script_sleep $1e
	writetext TreeBitstreamText_3ecd6
	script_sleep $1e
	ld c, $1
	ld de, Data_81f3d
	ld a, BANK(Data_81f3d)
	call ApplyMovementData_20
	playsfx $2e
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
	ret

Data_81cb4:
	db $07, $02, $01, $01, $00, $01, $07, $02, $07, $03, $2e

Data_81cbf: ; 81cbf
	dr $81cbf, $81cd0

Data_81cd0: ; 81cd0
	dr $81cd0, $81cfa

Data_81cfa: ; 81cfa
	dr $81cfa, $81d40

Data_81d40: ; 81d40
	dr $81d40, $81d4e

Data_81d4e: ; 81d4e
	dr $81d4e, $81d6a

Func_81d6a:
	xor a
	ld [$c793], a
	ld e, $1
	ld hl, Data_81cb4
	call LoadMapObjects_20
	ld e, $1
	ld hl, Data_81cbf
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_81d95
	ld a, [$c793]
	cp $2
	jp z, Func_81d95
	ld a, [$c793]
	cp $3
	jp nz, Func_81df9
Func_81d95: ; 81d95 (20:5d95)
	ld a, [$c7df]
	cp $1a
	jp nz, Func_81db2
	ld a, [$c7e0]
	or a
	jp nz, Func_81db2
	ld e, $1
	ld hl, Data_81d40
	call Func_800fb_20
	call Func_81f41
	jp Func_81df6

Func_81db2: ; 81db2 (20:5db2)
	ld e, $1
	ld hl, Data_81cb4
	call LoadMapObjects_20
	ld hl, $a
	call CheckEventFlag_20
	or a
	jp nz, Func_81de6
	xor a
	call PlayMusic_20
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
	ld [$c78c], a
	jp Func_81df6

Func_81de6: ; 81de6 (20:5de6)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld a, $11
	call PlayMusic_20
	call Func_8001c_20
Func_81df6: ; 81df6 (20:5df6)
	jp Func_81e22

Func_81df9: ; 81df9 (20:5df9)
	ld e, $3
	ld hl, Data_81cd0
	call Func_800fb_20
	ld e, $5
	ld hl, Data_81cfa
	call Func_800fb_20
	ld a, $5
	call Func_80d01_20
	ld e, $2
	ld hl, Data_81d4e
	call Func_80d24_20
	ld a, $11
	call PlayMusic_20
	call Func_8001c_20
	xor a
	ld [$c793], a
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
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld a, $67
	call PlaySFX_20
	ld hl, $3c
	call ScriptSleep_20
	ld a, $66
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $34
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $35
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	call Func_80ea2_20
	ld hl, $1e
	call ScriptSleep_20
	ld a, $38
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $36
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $3a
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	call Func_80eb1_20
	ld c, $6
	ld e, $2
	ld a, $1f
	call Func_80176_20
	call Func_801d5_20
	ld hl, $2
	call PrintTextStandard_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call ScriptSleep_20
	ld c, $1
	ld de, Data_81e23
	ld a, BANK(Data_81e23)
	call ApplyMovementData_20
	call Func_801d5_20
	ld a, $3b
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $3c
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	call Func_80ea2_20
	ld hl, $1e
	call ScriptSleep_20
	ld a, $39
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld a, $3a
	call OverworldPlaySFX
	ld hl, $1e
	call ScriptSleep_20
	ld hl, $1e
	call ScriptSleep_20
	call Func_80eb1_20
	ld hl, $1
	call ScriptSleep_20
	ld hl, $3
	call PrintTextStandard_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call ScriptSleep_20
	call Func_8018b_20
	ld hl, $1e
	call ScriptSleep_20
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
	ld a, $67
	call PlaySFX_20
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
	call Func_8002b_20
	xor a
	call PlayMusic_20
	xor a
	call Func_80653_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $8
	ld e, $1
	ld a, $1f
	call Func_80176_20
	call Func_8001c_20
	call Func_801d5_20
	ld hl, $3c
	call ScriptSleep_20
	ld a, $2e
	call PlaySFX_20
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
	ld a, $2e
	call PlaySFX_20
	ld e, $0
	xor a
	call Func_8013d_20
	ld c, $1
	ld e, $4
	ld a, $1f
	call Func_80176_20
	ld hl, $2d
	call ScriptSleep_20
	ld c, $1
	ld de, Data_81f37
	ld a, BANK(Data_81f37)
	call ApplyMovementData_20
	call Func_801d5_20
	xor a
	call PlayerFace_20
	ld a, $1
	call Func_80653_20
	ld hl, $1
	call ScriptSleep_20
	call Func_8018b_20
	ld hl, $1e
	call ScriptSleep_20
	ld hl, $14e
	call PrintTextStandard_20
	ld hl, $1e
	call ScriptSleep_20
	ld c, $1
	ld de, Data_81f3d
	ld a, BANK(Data_81f3d)
	call ApplyMovementData_20
	ld a, $2e
	call PlaySFX_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
	ret

; Player's bedroom

Data_81cb4:
	warpdef $7, $2, $1, $1, MAP_00_01, $7, $2, $7, $3, $2e

Data_81cbf: ; 81cbf
	dr $81cbf, $81cc4

Data_81cc4:
	dtext_tree_pointer TreeBitstreamText_47053
	dw -1

Data_81cc8:
	dtext_tree_pointer TreeBitstreamText_46eb8
	dw -1

Data_81ccc:
	dtext_tree_pointer TreeBitstreamText_46e84
	dw -1

Data_81cd0: ; 81cd0
	person_event $ff, $00, $03, $04, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81cc4
	person_event $ff, $00, $05, $01, $01, $01, $00, $04, $00, PrintTextFacePlayer_20, Data_81cc8
	person_event $ff, $00, $06, $01, $01, $01, $00, $04, $01, PrintTextFacePlayer_20, Data_81ccc

Data_81cfa: ; 81cfa
	person_event $ff, $00, $00, $07, $01, $01, $00, $04, $01, Func_82047, 0
	person_event $12, $04, $07, $04, $01, $01, $03, $04, $00, Func_82286, 0
	person_event $11, $04, $07, $05, $01, $01, $03, $04, $00, Func_822dd, 0
	person_event $14, $04, $07, $06, $01, $01, $03, $04, $00, Func_82335, 0
	person_event $15, $04, $07, $07, $01, $01, $03, $04, $00, Func_8238b, 0

Data_81d40: ; 81d40
	person_event $25, $0c, $07, $02, $01, $01, $02, $04, $00, 0, 0

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
	jp z, .check_dr_zero
	ld a, [wc793]
	cp $2
	jp z, .check_dr_zero
	ld a, [wc793]
	cp $3
	jp nz, Func_81df9
.check_dr_zero: ; 81d95 (20:5d95)
	ld a, [wBackupMapGroup]
	cp GROUP_MAP_26_00 ; where you fight Dr. Zero
	jp nz, .not_dr_zero
	ld a, [wBackupMapNumber]
	or a ; cp MAP_MAP_26_00
	jp nz, .not_dr_zero
	loadpeople $1, Data_81d40
	call Func_81f41
	jp Func_81df6

.not_dr_zero: ; 81db2 (20:5db2)
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
	setevent $a
	ld a, $1
	ld [wc78c], a
	jp Func_81df6

Func_81de6: ; 81de6 (20:5de6)
	loadpeople $3, Data_81cd0
	playmusic SONG_TOWN3
	call FadeInMap_20
Func_81df6: ; 81df6 (20:5df6)
	jp Func_81e22

Func_81df9: ; 81df9 (20:5df9)
	loadpeople $3, Data_81cd0
	loadpeople $5, Data_81cfa
	ld a, $5
	call Func_80d01_20
	loadwilds $2, Data_81d4e
	playmusic SONG_TOWN3
	call FadeInMap_20
	xor a
	ld [wc793], a
Func_81e22: ; 81e22 (20:5e22)
	ret

Data_81e23:
	db  3,  2
	db -1, -1

Data_81e27: ; 81e27
	db  7,  2
	db -1, -1

Func_81e2b: ; 81e2b (20:5e2b)
	loademote $6, $1, $1f
	call FadeInMap_20
	call WaitEmote_20
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
	call StartShakingScreen_20
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
	call StopShakingScreen_20
	loademote $6, $2, $1f
	call WaitEmote_20
	writetext TreeBitstreamText_38fae
	loademote $1, $4, $1f
	script_sleep $2d
	move_player $1, Data_81e23
	call WaitEmote_20
	ld a, $3b
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $3c
	call OverworldPlaySFX
	script_sleep $1e
	call StartShakingScreen_20
	script_sleep $1e
	ld a, $39
	call OverworldPlaySFX
	script_sleep $1e
	ld a, $3a
	call OverworldPlaySFX
	script_sleep $1e
	script_sleep $1e
	call StopShakingScreen_20
	script_sleep $1
	writetext TreeBitstreamText_38fbd
	ld a, $1
	call Func_80653_20
	script_sleep $1
	call HideEmote_20
	script_sleep $1e
	move_player $1, Data_81e27
	call WaitNPCStep_20
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
	call AllocateSpaceForWarps_20
	playmusic SONG_NONE
	xor a
	call Func_80653_20
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	loademote $8, $1, $1f
	call FadeInMap_20
	call WaitEmote_20
	script_sleep $3c
	playsfx $2e
	ld e, $1
	xor a
	call SetPersonVisibilityState_20
	ld bc, Data_81f2d
	ld e, BANK(Data_81f2d)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	ld e, $3
	xor a
	call SpriteFace_20
	writenpctext TreeBitstreamText_3ec9f
	ld bc, Data_81f33
	ld e, BANK(Data_81f33)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	playsfx $2e
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	loademote $1, $4, $1f
	script_sleep $2d
	move_player $1, Data_81f37
	call WaitEmote_20
	xor a
	call PlayerFace_20
	ld a, $1
	call Func_80653_20
	script_sleep $1
	call HideEmote_20
	script_sleep $1e
	writetext TreeBitstreamText_3ecd6
	script_sleep $1e
	move_player $1, Data_81f3d
	playsfx $2e
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
	ret

Func_82047:
	push de
	xor a
Func_82049: ; 82049 (20:6049)
	cp $14
	jp nc, Func_82057
	push af
	call Func_80c94_20
	pop af
	inc a
	jp Func_82049

Func_82057: ; 82057 (20:6057)
	pop de
	ld a, e
	cp $2
	jp nz, Func_82078
	xor a
	call Func_80653_20
	ld c, $32
	ld e, $0
	ld a, $1e
	call GiveRobot_20
	ld l, $1a
	push hl
	ld c, $f
	ld e, $a
	ld a, $19
	call Func_80dff_20
	pop bc
Func_82078: ; 82078 (20:6078)
	ret

Func_82079:
	ld a, e
	cp $2
	jp nz, Func_8208b
	loademote $6, $1, $2b
	call WaitEmote_20
Func_8208b: ; 8208b (20:608b)
	ret

Func_8208c:: ; 8208c (20:608c)
	cp $11
	jp z, Func_8224a
	cp $10
	jp z, Func_82235
	cp $f
	jp z, Func_82220
	cp $e
	jp z, Func_8220b
	cp $d
	jp z, Func_821f6
	cp $c
	jp z, Func_821e1
	cp $b
	jp z, Func_821cc
	cp $a
	jp z, Func_821b7
	cp $9
	jp z, Func_821a2
	cp $8
	jp z, Func_8218d
	cp $7
	jp z, Func_82178
	cp $6
	jp z, Func_82163
	cp $5
	jp z, Func_8214e
	cp $4
	jp z, Func_82139
	cp $3
	jp z, Func_82124
	cp $2
	jp z, Func_8210f
	cp $1
	jp z, Func_820fa
	or a
	jp nz, Func_8225c
	playsfx $5a
	ld l, $7
	push hl
	ld c, $2b
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_820fa: ; 820fa (20:60fa)
	playsfx $5a
	ld l, $13
	push hl
	ld c, $d
	ld e, $0
	ld a, $3
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8210f: ; 8210f (20:610f)
	playsfx $5a
	ld l, $16
	push hl
	ld c, $5
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82124: ; 82124 (20:6124)
	playsfx $5a
	ld l, $7
	push hl
	ld c, $10
	ld e, $0
	ld a, $5
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82139: ; 82139 (20:6139)
	playsfx $5a
	ld l, $a
	push hl
	ld c, $a
	ld e, $0
	ld a, $8
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8214e: ; 8214e (20:614e)
	playsfx $5a
	ld l, $e
	push hl
	ld c, $6
	ld e, $0
	ld a, $2
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82163: ; 82163 (20:6163)
	playsfx $5a
	ld l, $2d
	push hl
	ld c, $5
	ld e, $0
	ld a, $9
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82178: ; 82178 (20:6178)
	playsfx $5a
	ld l, $14
	push hl
	ld c, $11
	ld e, $0
	ld a, $15
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8218d: ; 8218d (20:618d)
	playsfx $5a
	ld l, $10
	push hl
	ld c, $7
	ld e, $0
	ld a, $18
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821a2: ; 821a2 (20:61a2)
	playsfx $5a
	ld l, $5
	push hl
	ld c, $7
	ld e, $0
	ld a, $1c
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821b7: ; 821b7 (20:61b7)
	playsfx $5a
	ld l, $7
	push hl
	ld c, $9
	ld e, $0
	ld a, $1b
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821cc: ; 821cc (20:61cc)
	playsfx $5a
	ld l, $4
	push hl
	ld c, $6
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821e1: ; 821e1 (20:61e1)
	playsfx $5a
	ld l, $6
	push hl
	ld c, $7
	ld e, $0
	ld a, $1a
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_821f6: ; 821f6 (20:61f6)
	playsfx $5a
	ld l, $a
	push hl
	ld c, $10
	ld e, $0
	ld a, $6
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8220b: ; 8220b (20:620b)
	playsfx $5a
	ld l, $17
	push hl
	ld c, $13
	ld e, $16
	ld a, $13
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82220: ; 82220 (20:6220)
	playsfx $5a
	ld l, $4
	push hl
	ld c, $a
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_82235: ; 82235 (20:6235)
	playsfx $5a
	ld l, $4
	push hl
	ld c, $e
	ld e, $1
	ld a, $1d
	call Func_80dff_20
	pop bc
	jp Func_8225c

Func_8224a: ; 8224a (20:624a)
	playsfx $5a
	ld l, $14
	push hl
	ld c, $5
	ld e, $a
	ld a, $12
	call Func_80dff_20
	pop bc
Func_8225c: ; 8225c (20:625c)
	ret

Data_8225d:
	dr $8225d, $82286

Func_82286:
	ld a, e
	or a
	jp nz, Func_822ae
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_822ae
	xor a
	ld [wc793], a
	startbattle Data_822af, Data_8225d
	or a
	jp nz, Func_822a9
	jp Func_822ae

Func_822a9: ; 822a9 (20:62a9)
	ld a, $1
	ld [wc793], a
Func_822ae: ; 822ae (20:62ae)
	ret

Data_822af:
	dstr "ハﾞクﾞ"

Data_822b4: ; 822b4
	dr $822b4, $822dd

Func_822dd:
	ld a, e
	or a
	jp nz, Func_82305
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_82305
	xor a
	ld [wc793], a
	startbattle Data_82306, Data_822b4
	or a
	jp nz, Func_82300
	jp Func_82305

Func_82300: ; 82300 (20:6300)
	ld a, $1
	ld [wc793], a
Func_82305: ; 82305 (20:6305)
	ret

Data_82306:
	dstr "(のうむ)"

Data_8230c: ; 8230c
	dr $8230c, $82335

Func_82335:
	ld a, e
	or a
	jp nz, Func_8235d
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_8235d
	xor a
	ld [wc793], a
	startbattle Data_8235e, Data_8230c
	or a
	jp nz, Func_82358
	jp Func_8235d

Func_82358: ; 82358 (20:6358)
	ld a, $1
	ld [wc793], a
Func_8235d: ; 8235d (20:635d)
	ret

Data_8235e:
	dstr "サヒﾞ"

Data_82362: ; 82362
	dr $82362, $8238b

Func_8238b:
	ld a, e
	or a
	jp nz, Func_823b3
	writetext_yesorno TreeBitstreamText_396ec
	or a
	jp nz, Func_823b3
	xor a
	ld [wc793], a
	startbattle Data_823b4, Data_82362
	or a
	jp nz, Func_823ae
	jp Func_823b3

Func_823ae: ; 823ae (20:63ae)
	ld a, $1
	ld [wc793], a
Func_823b3: ; 823b3 (20:63b3)
	ret

Data_823b4:
	dstr "イーヒﾟー"

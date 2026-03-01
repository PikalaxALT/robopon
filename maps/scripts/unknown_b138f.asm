
Data_b112e:
	warpdef $10, $19, $03, $01, MAP_28_00, $07, $04, $07, $05, SFX_2E
	warpdef $05, $13, $01, $03, MAP_25_02, $0e, $04, $0d, $04, SFX_2E
	warpdef $1d, $13, $01, $03, MAP_25_03, $05, $04, $06, $04, SFX_2E
	warpdef $0c, $08, $01, $01, MAP_28_01, $11, $03, $11, $04, SFX_2E
	warpdef $11, $03, $01, $01, MAP_28_01, $0c, $08, $0c, $09, SFX_2E

Data_b1165:
	dtext_tree_pointer TreeBitstreamText_3e30b
	dw -1

Data_b1169:
	dtext_tree_pointer TreeBitstreamText_40d52
	dw -1

Data_b116d:
	dtext_tree_pointer TreeBitstreamText_3d844
	dw -1

Data_b1171:
	dtext_tree_pointer TreeBitstreamText_3d86d
	dw -1

Data_b1175:
	dtext_tree_pointer TreeBitstreamText_3e522
	dw -1

Data_b1179:
	dtext_tree_pointer TreeBitstreamText_3e544
	dw -1

Data_b117d:
	dtext_tree_pointer TreeBitstreamText_40d8c
	dw -1

Data_b1181:
	dtext_tree_pointer TreeBitstreamText_40dac
	dw -1

Data_b1185:
	dtext_tree_pointer TreeBitstreamText_3e324
	dw -1

Data_b1189:
	person_event $0d, $0c, $10, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b117d
	person_event $23, $0c, $12, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1181
	person_event $06, $0c, $11, $0c, $01, $01, $02, $04, $00, PrintTextFacePlayer_2c, Data_b1169

Data_b11b3:
	person_event $09, $0c, $06, $14, $01, $01, $01, $04, $00, PrintTextFacePlayer_2c, Data_b116d
	person_event $ff, $00, $06, $13, $01, $01, $00, $04, $01, $6038, NULL
	person_event $ff, $00, $06, $15, $01, $01, $00, $04, $01, $6038, NULL
	person_event $09, $0c, $1c, $14, $01, $01, $03, $04, $00, PrintTextFacePlayer_2c, Data_b1171
	person_event $ff, $00, $1c, $13, $01, $01, $00, $04, $01, $60b3, NULL
	person_event $ff, $00, $1c, $15, $01, $01, $00, $04, $01, $60b3, NULL

Data_b1207:
	person_event $19, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $0b, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $0b, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5686, NULL

Data_b123f:
	person_event $1e, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5817, NULL

Data_b125b:
	person_event $1f, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $28, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $28, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $591e, NULL
	person_event $13, $04, $11, $0e, $01, $01, $03, $04, $01, NULL, NULL

Data_b12a1:
	person_event $20, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $0c, $12, $0d, $01, $01, $03, $04, $00, NULL, NULL
	person_event $09, $0c, $12, $0f, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5ab8, NULL

Data_b12d9:
	person_event $21, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $ff, $00, $11, $11, $01, $01, $00, $04, $01, $5b9b, NULL
	person_event $0b, $0c, $11, $19, $01, $01, $00, $04, $00, NULL, NULL

Data_b1303:
	person_event $1a, $04, $12, $0e, $01, $01, $03, $04, $00, Func_808fc_2c, Data_b1165
	person_event $0d, $0c, $10, $0e, $01, $01, $01, $04, $00, NULL, NULL
	person_event $23, $04, $11, $0c, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1185
	person_event $ff, $00, $10, $16, $03, $01, $00, $04, $01, $5c59, NULL
	person_event $ff, $00, $07, $12, $01, $03, $00, $04, $01, $5c59, NULL
	person_event $ff, $00, $1b, $12, $01, $03, $00, $04, $01, $5c59, NULL

Data_b1357:
	person_event $0d, $0c, $12, $0e, $01, $01, $03, $04, $00, NULL, NULL
	person_event $1a, $0c, $10, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1175
	person_event $23, $04, $12, $05, $01, $01, $02, $04, $00, Func_808fc_2c, Data_b1179
	person_event $ff, $ff, $11, $11, $01, $01, $00, $04, $01, $5d8b, NULL

Func_b138f:: ; b138f
	loadwarps $05, Data_b112e
	checkevent $0014
	cp $01
	jp nz, .asm_b13da
	checkevent $0007
	cp $01
	jp nz, .asm_b13da
	checkevent $001e
	or a
	jp nz, .asm_b13da
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	loadpeople $04, Data_b1207
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b13da:
	checkevent $0014
	cp $01
	jp nz, .asm_b1468
	checkevent $0007
	cp $01
	jp nz, .asm_b1468
	checkevent $001e
	cp $01
	jp nz, .asm_b1468
	checkevent $0009
	or a
	jp nz, .asm_b1468
	ld a, [wBackupMapGroup]
	cp $1c
	jp nz, .asm_b1439
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_b1439
	ld a, [wBackupMapX]
	cp $07
	jp nz, .asm_b1439
	ld a, [wBackupMapY]
	cp $05
	jp nz, .asm_b1439
	loadpeople $03, Data_b1189
	xor a
	scall Func_80653
	scall Func_8001c
	call Func_b17c6
	jp .asm_b1465
.asm_b1439:
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	hideperson 0
	hideperson $01
	hideperson $02
	playmusic $14
	scall Func_8001c
.asm_b1465:
	jp .asm_b1640
.asm_b1468:
	checkevent $003c
	cp $01
	jp nz, .asm_b14ab
	checkevent $001e
	cp $01
	jp nz, .asm_b14ab
	checkevent $001f
	or a
	jp nz, .asm_b14ab
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	loadpeople $02, Data_b123f
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b14ab:
	checkevent $0015
	cp $01
	jp nz, .asm_b14f5
	checkevent $001f
	cp $01
	jp nz, .asm_b14f5
	checkevent $0020
	or a
	jp nz, .asm_b14f5
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	loadpeople $05, Data_b125b
	hideperson $0d
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b14f5:
	checkevent $0016
	cp $01
	jp nz, .asm_b1538
	checkevent $0020
	cp $01
	jp nz, .asm_b1538
	checkevent $0021
	or a
	jp nz, .asm_b1538
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	loadpeople $04, Data_b12a1
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b1538:
	ld a, [wc78d]
	cp $01
	jp nz, .asm_b157f
	checkevent $0021
	cp $01
	jp nz, .asm_b157f
	checkevent $0022
	or a
	jp nz, .asm_b157f
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	loadpeople $03, Data_b12d9
	hideperson $0b
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b157f:
	checkevent $0034
	cp $01
	jp nz, .asm_b15c7
	checkevent $0022
	cp $01
	jp nz, .asm_b15c7
	checkevent $0023
	or a
	jp nz, .asm_b15c7
	checkevent $0035
	or a
	jp nz, .asm_b15c7
	checkevent $00c3
	cp $01
	jp nz, .asm_b15c7
	loadpeople $06, Data_b1303
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b15c7:
	checkevent $0033
	cp $01
	jp nz, .asm_b1605
	checkevent $0022
	cp $01
	jp nz, .asm_b1605
	checkevent $0023
	or a
	jp nz, .asm_b1605
	checkevent $0035
	cp $01
	jp nz, .asm_b1605
	loadpeople $04, Data_b1357
	playmusic $14
	scall Func_8001c
	jp .asm_b1640
.asm_b1605:
	ld a, [wc790]
	or a
	jp z, .asm_b1638
	ld a, [wc790]
	cp $04
	jp c, .asm_b1638
	loadpeople $03, Data_b1189
	loadpeople $06, Data_b11b3
	hideperson 0
	hideperson $01
	hideperson $02
.asm_b1638:
	playmusic $14
	scall Func_8001c
.asm_b1640:
	ret

Data_b1641:
IF DEF(SUN)
	db $00, $00, $00, $04, $2f, $c5, $bc, $00, $00, $30, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $72, $02, $06, $0c, $00, $00, $0b
	db $46, $03, $06, $07, $07, $07, $7f, $01, $0e
ELIF DEF(STAR)
	db $00, $00, $00, $04, $2f, $c5, $bc, $00, $00, $30, $01, $4f, $02, $06, $14, $00
	db $00, $7e, $61, $02, $06, $11, $00, $00, $00, $72, $02, $06, $0c, $00, $00, $0b
	db $05, $03, $06, $03, $03, $01, $30, $01, $0e
ENDC

Data_b166a:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1670:
	db $11, $0e, $11, $14, $ff, $ff

Data_b1676:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b167e:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b1686:
	ld a, e
	cp $02
	jp nz, .asm_b17c0
	checkevent $001e
	or a
	jp nz, .asm_b17c0
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b166a
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $004d
	scall PrintTextWithNPCName
	ld hl, $004e
	scall PrintTextWithNPCName
	ld hl, $004f
	scall PrintTextWithNPCName
	ld hl, $0050
	scall PrintTextWithNPCName
	ld hl, $0051
	scall PrintTextWithNPCName
	ld hl, $0052
	scall PrintTextWithNPCName
	ld hl, $0053
	scall PrintTextWithNPCName
	ld hl, $0054
	scall PrintTextWithNPCName
	xor a
	scall PlayerFace
	sprite_face $00, $09
	ld hl, $0057
	scall PrintTextWithNPCName
	xor a
.asm_b16fd:
	cp $08
	jp nc, .asm_b170e
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b16fd
.asm_b170e:
	ld hl, $0055
	scall PrintTextWithNPCName
	xor a
.asm_b1715:
	cp $08
	jp nc, .asm_b1727
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1715
.asm_b1727:
	ld hl, $0056
	scall PrintTextWithNPCName
	sprite_face $03, $09
	ld hl, $001e
	scall ScriptSleep
	ld a, $01
	scall PlayerFace
	ld hl, $001e
	scall ScriptSleep
	startbattle Data_b17c1, Data_b1641
	or a
	jp nz, .asm_b1755
	jp .asm_b17c0
.asm_b1755:
	ld hl, $0058
	scall PrintTextWithNPCName
	playmusic SONG_NONE
	playmusic $18
	move_person $09, Data_b1670, 1
	scall WaitNPCStep
	hideperson $09
	move_person $0a, Data_b1676, 0
	move_person $0b, Data_b167e, 1
	scall WaitNPCStep
	hideperson $0a
	hideperson $0b
	ld a, $07
	ld [wc790], a
	call Func_b213e
	setevent $001e
	ld a, $03
	scall Func_80c94
	ld a, $12
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $01
	scall Func_80d4d
.asm_b17c0:
	ret

Data_b17c1:
	dstr "ヒﾞスコ"

Func_b17c6:
	ld hl, $005b
	scall PrintTextWithNPCName
	setevent $0009
	ld l, $05
	push hl
	ld c, $07
	ld e, $00
	ld a, $1c
	scall Func_80dff
	pop bc
	ret

Data_b17e2:
	db $00, $00, $00, $04, $30, $c5, $bd, $00, $00, $90, $01, $0e, $02,  $11, $04, $17
	db $00, $7f, $38, $02, $11, $0e, $0b, $00, $18, $18, $02, $11, $09,  $09, $0b, $18
	db $07, $03, $11, $01, $13, $00, $5b, $01, $0f

Data_b180b:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1811:
	db $11, $0e, $11, $14, $ff, $ff

Func_b1817:
	ld a, e
	cp $02
	jp nz, .asm_b18d3
	checkevent $001f
	or a
	jp nz, .asm_b18d3
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b180b
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $007e
	scall PrintTextWithNPCName
	startbattle Data_b18d4, Data_b17e2
	or a
	jp nz, .asm_b1862
	jp .asm_b18d3
.asm_b1862:
	ld hl, $007f
	scall PrintTextWithNPCName
	playsfx $2a
	ld hl, $0367
	scall PrintTextStandard
	ld hl, $0368
	scall PrintTextWithNPCName
	move_person $09, Data_b1811, 1
	scall WaitNPCStep
	hideperson $09
	give_robot UNIBOT, $0f, $00
	cp $ff
	jp nz, .asm_b189b
.asm_b189b:
	ld a, $06
	ld [wc790], a
	call Func_b213e
	setevent $001f
	ld a, $05
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $02
	scall Func_80d4d
	setevent $0059
	checkevent $0086
	or a
	jp nz, .asm_b18d3
	setevent $0086
.asm_b18d3:
	ret

Data_b18d4:
	dstr "アムロン"

Data_b18d9:
	db $00, $00, $00, $04, $31, $c5, $be, $00, $00, $4e, $01, $0f, $03, $16, $0e, $0e
	db $0e, $67, $3a, $03, $16, $07, $0b, $00, $46, $7e, $03, $16, $28, $12, $00, $71
	db $3b, $03, $16, $07, $09, $00, $46, $01, $10

Data_b1902:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1908:
	db $11, $0e, $11, $14, $ff, $ff

Data_b190e:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b1916:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b191e:
	ld a, e
	cp $02
	jp nz, .asm_b1a6c
	checkevent $0020
	or a
	jp nz, .asm_b1a6c
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b1902
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	showperson $0d
	sprite_face $00, $0d
	sprite_face $01, $0d
	sprite_face $02, $0d
	sprite_face $03, $0d
	sprite_face $00, $0d
	sprite_face $01, $0d
	sprite_face $02, $0d
	sprite_face $03, $0d
	ld hl, $00aa
	scall PrintTextWithNPCName
	startbattle Data_b1a6d, Data_b18d9
	or a
	jp nz, .asm_b19a8
	jp .asm_b1a6c
.asm_b19a8:
	ld hl, $00ab
	scall PrintTextWithNPCName
	sprite_face $00, $0d
	sprite_face $01, $0d
	sprite_face $02, $0d
	sprite_face $03, $0d
	sprite_face $00, $0d
	sprite_face $01, $0d
	sprite_face $02, $0d
	sprite_face $03, $0d
	sprite_face $00, $0d
	sprite_face $01, $0d
	hideperson $0d
	ld hl, $036a
	scall PrintTextStandard
	ld hl, $036b
	scall PrintTextWithNPCName
	move_person $09, Data_b1908, 1
	scall WaitNPCStep
	hideperson $09
	move_person $0a, Data_b190e, 0
	move_person $0b, Data_b1916, 1
	scall WaitNPCStep
	hideperson $0a
	hideperson $0b
	give_robot DOSBOT, $19, $00
	cp $ff
	jp nz, .asm_b1a4e
.asm_b1a4e:
	ld a, $05
	ld [wc790], a
	call Func_b213e
	setevent $0020
	ld a, $08
	scall Func_80c94
	ld c, $00
	ld e, $01
	ld a, $03
	scall Func_80d4d
.asm_b1a6c:
	ret

Data_b1a6d:
	dstr "ワイルトﾞ"

Data_b1a73:
	db $00, $00, $00, $04, $31, $c5, $bf, $00, $00, $75, $01, $31, $04, $20, $07, $0c
	db $00, $79, $73, $04, $20, $0c, $08, $00, $79, $74, $04, $20, $0d, $09, $00, $79
	db $32, $05, $20, $07, $07, $14, $30, $01, $11

Data_b1a9c:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1aa2:
	db $11, $0e, $11, $14, $ff, $ff

Data_b1aa8:
	db $12, $10, $11, $10, $11, $15, $ff, $ff

Data_b1ab0:
	db $12, $10, $11, $10, $11, $14, $ff, $ff

Func_b1ab8:
	ld a, e
	cp $02
	jp nz, .asm_b1b60
	checkevent $0021
	or a
	jp nz, .asm_b1b60
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b1a9c
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $00e0
	scall PrintTextWithNPCName
	startbattle Data_b1b61, Data_b1a73
	or a
	jp nz, .asm_b1b03
	jp .asm_b1b60
.asm_b1b03:
	ld hl, $00e1
	scall PrintTextWithNPCName
	move_person $09, Data_b1aa2, 1
	scall WaitNPCStep
	hideperson $09
	move_person $0a, Data_b1aa8, 0
	move_person $0b, Data_b1ab0, 1
	scall WaitNPCStep
	hideperson $0a
	hideperson $0b
	ld a, $04
	ld [wc790], a
	call Func_b213e
	setevent $0021
	ld a, $07
	ld [wc78d], a
	ld c, $00
	ld e, $01
	ld a, $04
	scall Func_80d4d
.asm_b1b60:
	ret

Data_b1b61:
	dstr "カマット"

Data_b1b66:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c1, $00, $00, $45, $01, $1d, $04, $25, $23, $12
	db $00, $7a, $91, $04, $25, $0e, $13, $00, $7a, $0d, $04, $25, $04, $18, $04, $7a
	db $8d, $05, $25, $0d, $0e, $13, $7a, $01, $12
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c1, $00, $00, $45, $01, $1d, $04, $25, $23, $12
	db $00, $7a, $91, $04, $25, $0e, $13, $00, $7a, $0a, $04, $25, $04, $18, $04, $7a
	db $8d, $05, $25, $0d, $0e, $13, $7a, $01, $12
ENDC

Data_b1b8f:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1b95:
	db $11, $0e, $11, $14, $ff, $ff

Func_b1b9b:
	ld a, e
	cp $02
	jp nz, .asm_b1c47
	checkevent $0022
	or a
	jp nz, .asm_b1c47
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b1b8f
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $00f9
	scall PrintTextWithNPCName
	startbattle Data_b1c48, Data_b1b66
	or a
	jp nz, .asm_b1be6
	jp .asm_b1c47
.asm_b1be6:
	ld hl, $00fa
	scall PrintTextWithNPCName
	move_person $09, Data_b1b95, 1
	scall WaitNPCStep
	hideperson $09
	call Func_b2275
	setevent $0022
	ld a, $03
	ld [wc790], a
	hideperson 0
	hideperson $01
	hideperson $03
	hideperson $04
	hideperson $05
	hideperson $06
	hideperson $07
	hideperson $08
.asm_b1c47:
	ret

Data_b1c48:
	dstr "ヘットﾞ"

Data_b1c4d:
	db $11, $13, $ff, $ff

Data_b1c51:
	db $11, $10, $ff, $ff

Data_b1c55:
	db $11, $15, $ff, $ff

Func_b1c59:
	ld a, e
	cp $02
	jp nz, .asm_b1d4f
	checkevent $0035
	or a
	jp nz, .asm_b1d4f
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b1c4d
	xor a
	scall PlayerFace
	xor a
.asm_b1c81:
	cp $05
	jp nc, .asm_b1c92
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1c81
.asm_b1c92:
	ld a, $01
	scall FadeInAudio
	playmusic $13
	ld hl, $012b
	scall PrintTextWithNPCName
	ld hl, $012c
	scall PrintTextWithNPCName
	ld hl, $012d
	scall PrintTextWithNPCName
	move_person $01, Data_b1c55, 1
	scall WaitNPCStep
	ld hl, $003c
	scall ScriptSleep
	hideperson $01
	playmusic SONG_NONE
	xor a
.asm_b1ccd:
	cp $05
	jp nc, .asm_b1cdf
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1ccd
.asm_b1cdf:
	move_player $01, Data_b1c51
	ld hl, $001e
	scall ScriptSleep
	sprite_face $02, 0
	loademote $01, $01, $05
	ld e, $0e
	ld a, $12
	scall MoveEmote
	playsfx $28
	scall WaitEmote
	scall HideEmote
	ld hl, $012e
	scall PrintTextWithNPCName
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	xor a
	scall PlayerStep
	ld hl, $0130
	scall PrintTextWithNPCName
	ld e, $01
	ld a, $02
	scall PlayerStep
	ld e, $01
	ld a, $02
	scall PlayerStep
	sprite_face $02, $02
	ld a, $0e
	scall Func_80c94
	setevent $0035
	playmusic $07
.asm_b1d4f:
	ret

Data_b1d50:
IF DEF(SUN)
	db $00, $00, $00, $04, $32, $c5, $c3, $00, $00, $2e, $01, $80, $05, $32, $10, $00
	db $00, $08, $81, $05, $32, $10, $01, $03, $08, $82, $05, $32, $10, $04, $07, $09
	db $86, $06, $32, $03, $03, $03, $7b, $01, $13
ELIF DEF(STAR)
	db $00, $00, $00, $04, $32, $c5, $c3, $00, $00, $2e, $01, $80, $05, $32, $10, $00
	db $00, $08, $81, $05, $32, $10, $01, $03, $08, $82, $05, $32, $10, $04, $07, $09
	db $86, $06, $32, $04, $04, $04, $7b, $01, $13
ENDC

Data_b1d79:
	db $11, $10, $10, $0e, $ff, $ff

Data_b1d7f:
	db $11, $0e, $ff, $ff

Data_b1d83:
	db $11, $0d, $ff, $ff

Data_b1d87:
	db $11, $03, $ff, $ff

Func_b1d8b:
	ld a, e
	cp $02
	jp nz, .asm_b202b
	checkevent $0023
	or a
	jp nz, .asm_b202b
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	move_player $01, Data_b1d79
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $0133
	scall PrintTextWithNPCName
	startbattle Data_b202c, Data_b1d50
	or a
	jp nz, .asm_b1dd6
	jp .asm_b202b
.asm_b1dd6:
	ld hl, $0134
	scall PrintTextWithNPCName
	move_person 0, Data_b1d7f, 1
	scall WaitNPCStep
	sprite_face $00, 0
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $04
	ld hl, $0135
	scall PrintTextWithNPCName
	move_person 0, Data_b1d83, 1
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	xor a
	scall PlayerFace
	ld e, $01
	xor a
	scall PlayerStep
	ld e, $01
	ld a, $01
	scall PlayerStep
	loademote $01, $01, $17
	ld e, $0d
	ld a, $0f
	scall MoveEmote
	hideperson 0
	playsfx $59
	ld c, $05
	ld e, $11
	xor a
	scall Func_80080
	xor a
.asm_b1e4e:
	cp $08
	jp nc, .asm_b1e6a
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	push af
	cp $05
	jp nz, .asm_b1e65
	xor a
	scall Func_80653
.asm_b1e65:
	pop af
	inc a
	jp .asm_b1e4e
.asm_b1e6a:
	scall WaitEmote
	showperson 0
	scall HideEmote
	sprite_face $03, $02
	sprite_face $01, $01
	ld hl, $001e
	scall ScriptSleep
	sprite_face $01, 0
	ld hl, $003c
	scall ScriptSleep
	sprite_face $03, 0
	ld hl, $0136
	scall PrintTextWithNPCName
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	sprite_face $00, $01
	sprite_face $00, 0
	sprite_face $00, $02
	loademote $01, $01, $18
	scall WaitEmote
	loademote $01, $03, $18
	hideperson $02
	playsfx $63
	scall WaitEmote
	sprite_face $01, $01
	ld hl, $001e
	scall ScriptSleep
	sprite_face $03, 0
	ld hl, $0137
	scall PrintTextWithNPCName
	loademote $01, $07, $19
	hideperson 0
	scall WaitEmote
	scall HideEmote
	ld a, $01
	scall FadeInAudio
	playmusic $13
	sprite_face $02, $01
	ld hl, $0138
	scall PrintTextWithNPCName
	xor a
.asm_b1f29:
	cp $02
	jp nc, .asm_b1f3b
	push af
	ld e, $01
	ld a, $03
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f29
.asm_b1f3b:
	ld a, $01
	scall Func_80653
	xor a
.asm_b1f41:
	cp $09
	jp nc, .asm_b1f53
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f41
.asm_b1f53:
	loademote $01, $0f, $1a
	ld hl, $0078
	scall ScriptSleep
	ld a, $03
	scall PlayerFace
	scall WaitEmote
	ld hl, $0139
	scall PrintTextWithNPCName
	loademote $01, $30, $1a
	ld e, $0e
	ld a, $0c
	scall MoveEmote
	ld hl, $0078
	scall ScriptSleep
	ld a, $02
	scall PlayerFace
	scall WaitEmote
	scall HideEmote
	ld e, $01
	ld a, $01
	scall PlayerStep
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b1f9f:
	cp $09
	jp nc, .asm_b1fb0
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b1f9f
.asm_b1fb0:
	ld hl, $001e
	scall ScriptSleep
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $03c6
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $06
	scall Func_80d4d
	ld hl, $013a
	scall PrintTextWithNPCName
	move_person $01, Data_b1d87, 1
	scall WaitNPCStep
	hideperson $01
	setevent $0023
	ld a, $02
	ld [wc790], a
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b2006:
	cp $09
	jp nc, .asm_b2018
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b2006
.asm_b2018:
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $07
.asm_b202b:
	ret

Data_b202c:
	dstr "テール"

Data_b2030:
	db $07, $13, $ff, $ff

Data_b2034:
	db $07, $15, $ff, $ff

Func_b2038:
	push af
	push de
	checkevent $0022
	or a
	jp nz, .asm_b20a8
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_b20a8
	ld hl, sp+$03
	ld a, [hl]
	cp $04
	jp nz, .asm_b2063
	sprite_face $00, $03
	ld a, $02
	scall PlayerFace
	jp .asm_b206e
.asm_b2063:
	sprite_face $02, $03
	xor a
	scall PlayerFace
.asm_b206e:
	scall WaitNPCStep
	playsfx $69
	ld hl, $010c
	scall PrintTextStandard
	ld hl, sp+$03
	ld a, [hl]
	cp $04
	jp nz, .asm_b2091
	move_player $01, Data_b2030
	jp .asm_b209b
.asm_b2091:
	move_player $01, Data_b2034
.asm_b209b:
	scall WaitNPCStep
	sprite_face $01, $03
	scall WaitNPCStep
.asm_b20a8:
	pop bc
	pop bc
	ret

Data_b20ab:
	db $1b, $13, $ff, $ff

Data_b20af:
	db $1b, $15, $ff, $ff

Func_b20b3:
	push af
	push de
	checkevent $0022
	or a
	jp nz, .asm_b2123
	ld hl, sp+$00
	ld a, [hl]
	cp $02
	jp nz, .asm_b2123
	ld hl, sp+$03
	ld a, [hl]
	cp $07
	jp nz, .asm_b20de
	sprite_face $00, $06
	ld a, $02
	scall PlayerFace
	jp .asm_b20e9
.asm_b20de:
	sprite_face $02, $06
	xor a
	scall PlayerFace
.asm_b20e9:
	scall WaitNPCStep
	playsfx $69
	ld hl, $010e
	scall PrintTextStandard
	ld hl, sp+$03
	ld a, [hl]
	cp $07
	jp nz, .asm_b210c
	move_player $01, Data_b20ab
	jp .asm_b2116
.asm_b210c:
	move_player $01, Data_b20af
.asm_b2116:
	scall WaitNPCStep
	sprite_face $03, $06
	scall WaitNPCStep
.asm_b2123:
	pop bc
	pop bc
	ret

Data_b2126:
	db $0c, $14, $ff, $ff

Data_b212a:
	db $11, $10, $12, $0e, $ff, $ff

Data_b2130:
	db $12, $10, $11, $14, $ff, $ff

Data_b2136:
	db $11, $0e, $ff, $ff

Data_b213a:
	db $11, $13, $ff, $ff

Func_b213e:
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $12
	ld c, $09
	ld e, $0c
	xor a
	scall Func_80080
	sprite_face $02, 0
	move_person 0, Data_b2126, 1
	scall WaitNPCStep
	ld c, $14
	ld e, $11
	xor a
	scall Func_80080
	sprite_face $00, 0
	move_person 0, Data_b212a, 1
	scall WaitNPCStep
	sprite_face $03, 0
	ld a, [wc790]
	cp $04
	jp z, .asm_b21de
	cp $05
	jp z, .asm_b21ca
	cp $06
	jp z, .asm_b21b6
	cp $07
	jp nz, .asm_b21f2
	ld hl, $0059
	scall PrintTextWithNPCName
	playsfx $2a
	ld hl, $005a
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21b6:
	ld hl, $0081
	scall PrintTextWithNPCName
	playsfx $2a
	ld hl, $0080
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21ca:
	ld hl, $00ad
	scall PrintTextWithNPCName
	playsfx $2a
	ld hl, $00ac
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21de:
	ld hl, $00e3
	scall PrintTextWithNPCName
	playsfx $2a
	ld hl, $00e2
	scall PrintTextStandard
	jp .asm_b21f8
.asm_b21f2:
	ld hl, $00ae
	scall PrintTextWithNPCName
.asm_b21f8:
	move_person 0, Data_b2130, 1
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	move_person $02, Data_b2136, 1
	scall WaitNPCStep
	sprite_face $03, $02
	ld hl, $01c0
	scall PrintTextStandard
	move_person $02, Data_b213a, 1
	scall WaitNPCStep
	hideperson $02
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $14
	ret

Data_b2253:
	db $0c, $14, $ff, $ff

Data_b2257:
	db $11, $10, $12, $0e, $ff, $ff

Data_b225d:
	db $12, $10, $11, $14, $ff, $ff

Data_b2263:
	db $11, $10, $12, $0f, $ff, $ff

Data_b2269:
	db $11, $15, $ff, $ff

Data_b226d:
	db $11, $14, $ff, $ff

Data_b2271:
	db $0a, $14, $ff, $ff

Func_b2275:
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic $12
	ld c, $09
	ld e, $0c
	xor a
	scall Func_80080
	sprite_face $02, 0
	move_person 0, Data_b2253, 1
	scall WaitNPCStep
	ld c, $14
	ld e, $11
	xor a
	scall Func_80080
	sprite_face $00, 0
	move_person 0, Data_b2257, 1
	scall WaitNPCStep
	sprite_face $03, 0
	ld hl, $0337
	scall PrintTextStandard
	ld c, $00
	ld e, $01
	ld a, $05
	scall Func_80d4d
	ld hl, $00fb
	scall PrintTextWithNPCName
	ld a, $05
	scall FadeOutAudio
	playmusic SONG_NONE
	ld c, $14
	ld e, $11
	ld a, $03
	scall Func_80080
	move_person $03, Data_b2263, 1
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	sprite_face $02, 0
	ld hl, $00fc
	scall PrintTextStandard
	sprite_face $03, 0
	ld a, $01
	scall FadeInAudio
	playmusic $01
	ld hl, $00fd
	scall PrintTextWithNPCName
	move_person $03, Data_b2269, 0
	move_person 0, Data_b225d, 1
	scall WaitNPCStep
	ld c, $09
	ld e, $0c
	ld a, $01
	scall Func_80080
	move_person $01, Data_b2253, 1
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	hideperson $03
	hideperson $04
	hideperson $05
	showperson $0b
	ld hl, $001e
	scall ScriptSleep
	ld a, $0a
	scall FadeOutAudio
	playmusic SONG_NONE
	xor a
.asm_b2383:
	cp $0a
	jp nc, .asm_b2395
	push af
	ld e, $01
	ld a, $02
	scall PlayerStep
	pop af
	inc a
	jp .asm_b2383
.asm_b2395:
	ld hl, $001e
	scall ScriptSleep
	ld hl, $0113
	scall PrintTextStandard
	ld hl, $001e
	scall ScriptSleep
	move_person $0b, Data_b226d, 1
	scall WaitNPCStep
	ld hl, $001e
	scall ScriptSleep
	sprite_face $01, $0b
	ld hl, $001e
	scall ScriptSleep
	sprite_face $03, $0b
	ld hl, $001e
	scall ScriptSleep
	sprite_face $01, $0b
	ld hl, $001e
	scall ScriptSleep
	move_person $0b, Data_b2271, 1
	scall WaitNPCStep
	hideperson $0b
	ld hl, $001e
	scall ScriptSleep
	xor a
.asm_b23fc:
	cp $0a
	jp nc, .asm_b240d
	push af
	ld e, $01
	xor a
	scall PlayerStep
	pop af
	inc a
	jp .asm_b23fc
.asm_b240d:
	ld a, $01
	scall FadeInAudio
	playmusic $07
	ret

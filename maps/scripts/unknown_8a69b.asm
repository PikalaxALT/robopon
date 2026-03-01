
Data_8a607:
	warpdef $0d, $11, $01, $01, MAP_05_33, $0d, $11, $0e, $11, SFX_2E
	warpdef $0f, $04, $01, $01, MAP_05_31, $0f, $04, $0e, $04, SFX_2E

Data_8a61d:
IF DEF(SUN)
	wildbot $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $08, $00
	wildbot $00, $02, $14, $11, $6c, $0a, $0c, $03, $17, $17, $0a, $02, $06, $00
	wildbot $00, $02, $14, $11, $14, $0d, $0f, $17, $09, $0f, $00, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $11, $18, $0b, $0d, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $4c, $0c, $0e, $45, $01, $01, $01, $02, $08, $00
	wildbot $00, $02, $14, $11, $74, $0a, $0c, $7f, $0c, $08, $00, $02, $06, $00
	wildbot $00, $02, $14, $11, $35, $0d, $0f, $77, $17, $12, $11, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0e, $10, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8a663:
	person_event $ff, $00, $0b, $02, $03, $03, $00, $04, $00, Func_8a724, NULL
	person_event $01, $04, $08, $0b, $01, $01, $01, $04, $00, Func_8a779, NULL
	person_event $01, $04, $01, $0b, $01, $01, $00, $04, $00, Func_8a801, NULL
	person_event $0b, $0c, $0f, $04, $01, $01, $02, $04, $00, Func_8a892, NULL

Func_8a69b:: ; 8a69b
	call Func_8a93c
	ld hl, Func_8a93c
	scall Func_80f11
	loadwarps $02, Data_8a607
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8a61d
	loadpeople $04, Data_8a663
	ld a, [wc790]
	or a
	jp z, .asm_8a6de
	ld a, [wc790]
	cp $07
	jp nc, .asm_8a6de
	hideperson $01
	hideperson $02
.asm_8a6de:
	playmusic SONG_TOWER
	ld a, $03
	ld [wc7e2], a
	checkevent $0086
	cp $01
	jp nz, .asm_8a71a
	checkevent $0107
	cp $01
	jp nz, .asm_8a70a
	ld c, $03
	ld e, $0e
	ld a, $03
	scall Func_80080
	jp .asm_8a71a
.asm_8a70a:
	ld c, $05
	ld e, $10
	ld a, $03
	scall Func_80080
	ld e, $03
	ld a, $03
	scall SpriteFace
.asm_8a71a:
	scall Func_8001c
	landmarksign TreeBitstreamText_468e0
	ret

Func_8a724:
	ld a, e
	or a
	jp nz, .asm_8a74f
	scall RepairRobots
	playmusic SONG_NONE
	playmusic SONG_HEAL
	ld c, $01
	ld e, $02
	ld a, $08
	scall LoadEmote
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic SONG_TOWER
.asm_8a74f:
	ret

Data_8a750:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $6b, $01, $6b, $03, $0f, $17, $17
	db $0a, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a779:
	push af
	ld a, e
	or a
	jp nz, .asm_8a7cf
	face_player -$01
	checkevent $007e
	or a
	jp nz, .asm_8a7c9
	writetext TreeBitstreamText_429aa
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a7c0
	startbattle Data_8a7d1, Data_8a750
	or a
	jp nz, .asm_8a7af
	jp .asm_8a7cf
.asm_8a7af:
	setevent $007e
	writetext TreeBitstreamText_429b8
	jp .asm_8a7c6
.asm_8a7c0:
	writetext TreeBitstreamText_42998
.asm_8a7c6:
	jp .asm_8a7cf
.asm_8a7c9:
	writetext TreeBitstreamText_4298a
.asm_8a7cf:
	pop bc
	ret

Data_8a7d1:
	dstr "ウﾞォーカル"

Data_8a7d8:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $71, $01, $71, $03, $0f, $09, $09
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a801:
	push af
	ld a, e
	or a
	jp nz, .asm_8a857
	face_player -$01
	checkevent $007f
	or a
	jp nz, .asm_8a851
	writetext TreeBitstreamText_42998
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a848
	startbattle Data_8a859, Data_8a7d8
	or a
	jp nz, .asm_8a837
	jp .asm_8a857
.asm_8a837:
	setevent $007f
	writetext TreeBitstreamText_4297c
	jp .asm_8a84e
.asm_8a848:
	writetext TreeBitstreamText_429ca
.asm_8a84e:
	jp .asm_8a857
.asm_8a851:
	writetext TreeBitstreamText_429a1
.asm_8a857:
	pop bc
	ret

Data_8a859:
	dstr "コキﾞャル"

Data_8a85f:
	db $00, $00, $00, $01, $00, $c5, $b0, $00, $00, $71, $01, $71, $03, $0f, $09, $09
	db $00, $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8a888:
	db $0e, $03, $ff, $ff

Data_8a88c:
	db $0f, $05, $10, $05, $ff, $ff

Func_8a892:
	push af
	ld a, e
	or a
	jp nz, .asm_8a92e
	face_player -$01
	checkevent $0086
	or a
	jp nz, .asm_8a915
	writetext TreeBitstreamText_42cd5
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a90c
	startbattle Data_8a930, Data_8a85f
	or a
	jp nz, .asm_8a8c8
	jp .asm_8a92e
.asm_8a8c8:
	writetext TreeBitstreamText_42d27
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_8a8eb
	move_person -$01, Data_8a888, 1
	setevent $0107
	jp .asm_8a8f6
.asm_8a8eb:
	move_person -$01, Data_8a88c, 1
.asm_8a8f6:
	scall WaitNPCStep
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	setevent $0086
	jp .asm_8a912
.asm_8a90c:
	writetext TreeBitstreamText_42d11
.asm_8a912:
	jp .asm_8a92e
.asm_8a915:
	checkevent $001f
	or a
	jp nz, .asm_8a928
	writetext TreeBitstreamText_42d27
	jp .asm_8a92e
.asm_8a928:
	writetext TreeBitstreamText_3d897
.asm_8a92e:
	pop bc
	ret

Data_8a930:
	dstr "ソﾞッキー"

Data_8a936:
	db $13, $13, $01, $01, $0f, $04

Func_8a93c:
	ld hl, Data_8a936
	scall Func_80d9b
	scall Func_80f02
	ret


Data_8a946:
	warpdef $0d, $04, $01, $01, MAP_05_34, $0d, $04, $0c, $04, SFX_2E
	warpdef $0d, $11, $01, $01, MAP_05_32, $0d, $11, $0c, $11, SFX_2E

Data_8a95c:
	db $25, $10, $09, $03, $1b

Data_8a961:
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

Data_8a9a7:
	person_event $01, $0c, $08, $0a, $01, $01, $02, $04, $00, Func_8aad8, NULL
	person_event $ff, $00, $09, $0a, $03, $01, $00, $04, $01, Func_8aae9, NULL
	person_event $01, $0c, $09, $09, $01, $01, $02, $04, $00, Func_8abbf, NULL
	person_event $ff, $00, $08, $09, $01, $01, $00, $04, $01, Func_8abcc, NULL
	person_event $ff, $00, $0a, $09, $02, $01, $00, $04, $01, Func_8abcc, NULL
	person_event $01, $0c, $0a, $08, $01, $01, $02, $04, $00, Func_8acb3, NULL
	person_event $ff, $00, $08, $08, $02, $01, $00, $04, $01, Func_8acc0, NULL
	person_event $ff, $00, $0b, $08, $01, $01, $00, $04, $01, Func_8acc0, NULL
	person_event $01, $0c, $0b, $07, $01, $01, $02, $04, $00, Func_8adb3, NULL
	person_event $ff, $00, $08, $07, $03, $01, $00, $04, $01, Func_8adc4, NULL

Func_8aa33:: ; 8aa33
	loadwarps $02, Data_8a946
	ld e, $01
	ld hl, Data_8a95c
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8a961
	loadpeople $0a, Data_8a9a7
	checkevent $0080
	cp $01
	jp nz, .asm_8aa70
	hideperson 0
	hideperson $01
.asm_8aa70:
	checkevent $0081
	cp $01
	jp nz, .asm_8aa90
	hideperson $02
	hideperson $03
	hideperson $04
.asm_8aa90:
	checkevent $0082
	cp $01
	jp nz, .asm_8aab0
	hideperson $05
	hideperson $06
	hideperson $07
.asm_8aab0:
	checkevent $0083
	cp $01
	jp nz, .asm_8aac9
	hideperson $08
	hideperson $09
.asm_8aac9:
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468ec
	ret

Func_8aad8:
	ld a, e
	or a
	jp nz, .asm_8aae0
	call Func_8ab66
.asm_8aae0:
	ret

Data_8aae1:
	db $09, $0a, $ff, $ff

Data_8aae5:
	db $0a, $0a, $ff, $ff

Func_8aae9:
	ld a, e
	cp $02
	jp nz, .asm_8ab38
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ab24
	cp $0a
	jp z, .asm_8ab15
	cp $09
	jp nz, .asm_8ab30
	sprite_face $01, 0
	jp .asm_8ab30
.asm_8ab15:
	move_person 0, Data_8aae1, 1
	scall WaitNPCStep
	jp .asm_8ab30
.asm_8ab24:
	move_person 0, Data_8aae5, 1
	scall WaitNPCStep
.asm_8ab30:
	ld a, $03
	scall PlayerFace
	call Func_8ab66
.asm_8ab38:
	ret

Data_8ab39:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $17, $01, $10, $1f, $07
	db $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ab62:
	db $08, $05, $ff, $ff

Func_8ab66:
	writetext TreeBitstreamText_429a1
	writetext TreeBitstreamText_471cf
.asm_8ab72:
	ld de, Data_8abb9
	ld hl, Data_8ab39
	scall Func_802ef
	or a
	jp nz, .asm_8ab88
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ab72
	ret
.asm_8ab88:
	writetext TreeBitstreamText_429a1
	move_person 0, Data_8ab62, 1
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	setevent $0080
	playmusic SONG_NONE
	playmusic SONG_TOWER
	ret

Data_8abb9:
	dstr "コキﾞャル"

Func_8abbf:
	ld a, e
	or a
	jp nz, .asm_8abc7
	call Func_8ac50
.asm_8abc7:
	ret

Data_8abc8:
	db $0a, $09, $ff, $ff

Func_8abcc:
	ld a, e
	cp $02
	jp nz, .asm_8ac22
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ac0d
	cp $0a
	jp z, .asm_8abfe
	cp $08
	jp nz, .asm_8ac1f
	sprite_face $03, $02
	ld a, $01
	scall PlayerFace
	jp .asm_8ac1f
.asm_8abfe:
	sprite_face $01, $02
	ld a, $03
	scall PlayerFace
	jp .asm_8ac1f
.asm_8ac0d:
	move_person $02, Data_8abc8, 1
	scall WaitNPCStep
	ld a, $03
	scall PlayerFace
.asm_8ac1f:
	call Func_8ac50
.asm_8ac22:
	ret

Data_8ac23:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $52, $01, $0e, $01, $10, $04, $17
	db $04, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ac4c:
	db $09, $04, $ff, $ff

Func_8ac50:
	writetext TreeBitstreamText_4298a
	writetext TreeBitstreamText_471cf
.asm_8ac5c:
	ld de, Data_8acac
	ld hl, Data_8ac23
	scall Func_802ef
	or a
	jp nz, .asm_8ac72
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ac5c
	ret
.asm_8ac72:
	writetext TreeBitstreamText_4298a
	move_person $02, Data_8ac4c, 1
	scall WaitNPCStep
	hideperson $02
	hideperson $03
	hideperson $04
	playmusic SONG_NONE
	playmusic SONG_TOWER
	setevent $0081
	ret

Data_8acac:
	dstr "ウﾞォーカル"

Func_8acb3:
	ld a, e
	or a
	jp nz, .asm_8acbb
	call Func_8ad46
.asm_8acbb:
	ret

Data_8acbc:
	db $09, $08, $ff, $ff

Func_8acc0:
	ld a, e
	cp $02
	jp nz, .asm_8ad16
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld a, [wMapX]
	add a, $05
	cp $0b
	jp z, .asm_8ad07
	cp $09
	jp z, .asm_8acf8
	cp $08
	jp nz, .asm_8ad13
	move_person $05, Data_8acbc, 1
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ad13
.asm_8acf8:
	sprite_face $03, $05
	ld a, $01
	scall PlayerFace
	jp .asm_8ad13
.asm_8ad07:
	sprite_face $01, $05
	ld a, $03
	scall PlayerFace
.asm_8ad13:
	call Func_8ad46
.asm_8ad16:
	ret

Data_8ad17:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $52, $01, $6b, $01, $10, $17, $17
	db $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ad40:
	db $0a, $04, $0d, $04, $ff, $ff

Func_8ad46:
	writetext TreeBitstreamText_429d1
	writetext TreeBitstreamText_471cf
.asm_8ad52:
	ld de, Data_8ada8
	ld hl, Data_8ad17
	scall Func_802ef
	or a
	jp nz, .asm_8ad68
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ad52
	ret
.asm_8ad68:
	writetext TreeBitstreamText_4297c
	writetext TreeBitstreamText_429dc
	move_person $05, Data_8ad40, 1
	scall WaitNPCStep
	hideperson $05
	hideperson $06
	hideperson $07
	playmusic SONG_NONE
	playmusic SONG_TOWER
	setevent $0082
	ret

Data_8ada8:
	dstr "(しﾞょしこうせい)"

Func_8adb3:
	ld a, e
	or a
	jp nz, .asm_8adbb
	call Func_8ae50
.asm_8adbb:
	ret

Data_8adbc:
	db $09, $07, $ff, $ff

Data_8adc0:
	db $0a, $07, $ff, $ff

Func_8adc4:
	ld a, e
	cp $02
	jp nz, .asm_8ae20
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld a, [wMapX]
	add a, $05
	cp $0a
	jp z, .asm_8ae11
	cp $09
	jp z, .asm_8adfc
	cp $08
	jp nz, .asm_8ae1d
	move_person $08, Data_8adbc, 1
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ae1d
.asm_8adfc:
	move_person $08, Data_8adc0, 1
	scall WaitNPCStep
	ld a, $01
	scall PlayerFace
	jp .asm_8ae1d
.asm_8ae11:
	sprite_face $03, $08
	ld a, $01
	scall PlayerFace
.asm_8ae1d:
	call Func_8ae50
.asm_8ae20:
	ret

Data_8ae21:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $6b, $01, $10, $17, $17
	db $0a, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Data_8ae4a:
	db $0b, $04, $0d, $04, $ff, $ff

Func_8ae50:
	writetext TreeBitstreamText_42998
	writetext TreeBitstreamText_471cf
.asm_8ae5c:
	ld de, Data_8aea5
	ld hl, Data_8ae21
	scall Func_802ef
	or a
	jp nz, .asm_8ae72
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8ae5c
	ret
.asm_8ae72:
	writetext TreeBitstreamText_42998
	move_person $08, Data_8ae4a, 1
	scall WaitNPCStep
	hideperson $08
	hideperson $09
	playmusic SONG_NONE
	playmusic SONG_TOWER
	setevent $0083
	ret

Data_8aea5:
	dstr "コキﾞャル"

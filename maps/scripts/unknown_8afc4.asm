
Data_8aeab:
	warpdef $0d, $04, $01, $01, MAP_05_33, $0d, $04, $0c, $04, SFX_2E
	warpdef $12, $0a, $01, $01, MAP_05_35, $12, $0a, $12, $0b, SFX_2E

Data_8aec1:
IF DEF(SUN)
	wildbot $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00
	wildbot $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00
	wildbot $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00
	wildbot $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00
	wildbot $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Func_8af07:: ; 8af07
	loadwarps $02, Data_8aeab
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8aec1
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468f8
	ret

Data_8af2b:
	warpdef $05, $05, $01, $01, MAP_05_36, $05, $05, $04, $05, SFX_2E
	warpdef $12, $0a, $01, $01, MAP_05_34, $12, $0a, $11, $0a, SFX_2E

Data_8af41:
	db $26, $09, $0d, $01, $4a

Data_8af46:
IF DEF(SUN)
	wildbot $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $74, $0d, $0f, $7f, $0c, $08, $00, $02, $08, $00
	wildbot $00, $02, $14, $11, $6c, $0b, $0d, $03, $17, $17, $0a, $02, $06, $00
	wildbot $00, $02, $14, $11, $14, $0e, $10, $17, $09, $0f, $00, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $11, $18, $0c, $0e, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $4c, $0d, $0f, $45, $01, $01, $01, $02, $08, $00
	wildbot $00, $02, $14, $11, $74, $0b, $0d, $7f, $0c, $08, $00, $02, $06, $00
	wildbot $00, $02, $14, $11, $35, $0e, $10, $77, $17, $12, $11, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $0f, $11, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8af8c:
	person_event $01, $0c, $05, $12, $01, $01, $01, $04, $00, Func_8b05e, NULL
	person_event $01, $0c, $06, $11, $01, $01, $01, $04, $00, Func_8b150, NULL
	person_event $01, $0c, $0d, $06, $01, $01, $02, $04, $00, Func_8b243, NULL
	person_event $01, $0c, $0e, $06, $01, $01, $02, $04, $00, Func_8b345, NULL

Func_8afc4:: ; 8afc4
	loadwarps $02, Data_8af2b
	ld e, $01
	ld hl, Data_8af41
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8af46
	loadpeople $04, Data_8af8c
	checkevent EVENT_084
	cp $01
	jp nz, .asm_8b001
	hideperson 0
	hideperson $01
.asm_8b001
	checkevent EVENT_085
	cp $01
	jp nz, .asm_8b01a
	hideperson $02
	hideperson $03
.asm_8b01a
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_46904
	ret

Data_8b029:
	db $05, $0e, $03, $0c, $ff, $ff

Data_8b02f:
	db $04, $0f, $03, $0c, $ff, $ff

Data_8b035:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $18, $01, $18, $03, $11, $09, $09
	db $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b05e:
	push af
	ld a, e
	or a
	jp nz, .asm_8b109
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_42972
	face_player -$01
	writetext TreeBitstreamText_471a6
.asm_8b07f
	ld de, Data_8b10b
	ld hl, Data_8b035
	scall Func_803f5
	or a
	jp nz, .asm_8b097
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b07f
	jp .asm_8b109
.asm_8b097
	writetext TreeBitstreamText_42972
	move_person 0, Data_8b029, 1
	scall WaitNPCStep
	hideperson 0
	xor a
	scall PlayerFace
	sprite_face $02, $01
	writetext TreeBitstreamText_429aa
	writetext TreeBitstreamText_471a6
.asm_8b0c6
	ld de, Data_8b111
	ld hl, Data_8b035
	scall Func_803f5
	or a
	jp nz, .asm_8b0de
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b0c6
	jp .asm_8b109
.asm_8b0de
	writetext TreeBitstreamText_429aa
	move_person $01, Data_8b02f, 1
	scall WaitNPCStep
	hideperson $01
	setevent EVENT_084
	playmusic SONG_NONE
	playmusic SONG_TOWER
.asm_8b109
	pop bc
	ret

Data_8b10b:
	dstr "コキﾞャル"

Data_8b111:
	dstr "コキﾞャル"

Data_8b117:
	db $05, $0e, $03, $0c, $ff, $ff

Data_8b11d:
	db $04, $0f, $03, $0c, $ff, $ff

Data_8b123:
	db $06, $11, $ff, $ff

Data_8b127:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $52, $01, $52, $03, $11, $1f, $07
	db $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b150:
	ld a, e
	or a
	jp nz, .asm_8b1fd
	face_player $01
	writetext TreeBitstreamText_429aa
	writetext TreeBitstreamText_471a6
.asm_8b166
	ld de, Data_8b1fe
	ld hl, Data_8b127
	scall Func_803f5
	or a
	jp nz, .asm_8b17e
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b166
	jp .asm_8b1fd
.asm_8b17e
	writetext TreeBitstreamText_429aa
	move_person $01, Data_8b11d, 1
	scall WaitNPCStep
	hideperson $01
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_8b1a7
	ld a, $03
	scall PlayerFace
	jp .asm_8b1b9
.asm_8b1a7
	move_person 0, Data_8b123, 1
	scall WaitNPCStep
	sprite_face $01, 0
.asm_8b1b9
	writetext TreeBitstreamText_42972
	writetext TreeBitstreamText_471a6
.asm_8b1c5
	ld de, Data_8b204
	ld hl, Data_8b127
	scall Func_803f5
	or a
	jp nz, .asm_8b1dd
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b1c5
	jp .asm_8b1fd
.asm_8b1dd
	writetext TreeBitstreamText_42972
	move_person 0, Data_8b117, 1
	scall WaitNPCStep
	hideperson 0
	setevent EVENT_084
.asm_8b1fd
	ret

Data_8b1fe:
	dstr "コキﾞャル"

Data_8b204:
	dstr "コキﾞャル"

Data_8b20a:
	db $0d, $05, $06, $05, $ff, $ff

Data_8b210:
	db $0e, $07, $ff, $ff

Data_8b214:
	db $0e, $05, $06, $05, $ff, $ff

Data_8b21a:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $38, $01, $38, $03, $11, $0e, $0b
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b243:
	push af
	ld a, e
	or a
	jp nz, .asm_8b2fe
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_42972
	face_player -$01
	writetext TreeBitstreamText_471a6
.asm_8b264
	ld de, Data_8b300
	ld hl, Data_8b21a
	scall Func_803f5
	or a
	jp nz, .asm_8b27c
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b264
	jp .asm_8b2fe
.asm_8b27c
	writetext TreeBitstreamText_42972
	move_person $02, Data_8b20a, 1
	scall WaitNPCStep
	hideperson $02
	move_person $03, Data_8b210, 1
	scall WaitNPCStep
	sprite_face $03, $03
	ld a, $01
	scall PlayerFace
	writetext TreeBitstreamText_429aa
	writetext TreeBitstreamText_471a6
.asm_8b2bb
	ld de, Data_8b306
	ld hl, Data_8b21a
	scall Func_803f5
	or a
	jp nz, .asm_8b2d3
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b2bb
	jp .asm_8b2fe
.asm_8b2d3
	writetext TreeBitstreamText_429aa
	move_person $03, Data_8b214, 1
	scall WaitNPCStep
	hideperson $03
	setevent EVENT_085
	playmusic SONG_NONE
	playmusic SONG_TOWER
.asm_8b2fe
	pop bc
	ret

Data_8b300:
	dstr "コキﾞャル"

Data_8b306:
	dstr "コキﾞャル"

Data_8b30c:
	db $0e, $05, $06, $05, $ff, $ff

Data_8b312:
	db $0d, $07, $ff, $ff

Data_8b316:
	db $0d, $05, $06, $05, $ff, $ff

Data_8b31c:
	db $00, $00, $00, $01, $00, $c5, $b1, $00, $00, $25, $01, $25, $03, $11, $01, $01
	db $00, $6f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8b345:
	push af
	ld a, e
	or a
	jp nz, .asm_8b400
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	writetext TreeBitstreamText_429aa
	face_player -$01
	writetext TreeBitstreamText_471a6
.asm_8b366
	ld de, Data_8b402
	ld hl, Data_8b31c
	scall Func_803f5
	or a
	jp nz, .asm_8b37e
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b366
	jp .asm_8b400
.asm_8b37e
	writetext TreeBitstreamText_429aa
	move_person $03, Data_8b30c, 1
	scall WaitNPCStep
	hideperson $03
	move_person $02, Data_8b312, 1
	scall WaitNPCStep
	sprite_face $01, $02
	ld a, $03
	scall PlayerFace
	writetext TreeBitstreamText_42972
	writetext TreeBitstreamText_471a6
.asm_8b3bd
	ld de, Data_8b408
	ld hl, Data_8b31c
	scall Func_803f5
	or a
	jp nz, .asm_8b3d5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_8b3bd
	jp .asm_8b400
.asm_8b3d5
	writetext TreeBitstreamText_42972
	move_person $02, Data_8b316, 1
	scall WaitNPCStep
	hideperson $02
	setevent EVENT_085
	playmusic SONG_NONE
	playmusic SONG_TOWER
.asm_8b400
	pop bc
	ret

Data_8b402:
	dstr "コキﾞャル"

Data_8b408:
	dstr "コキﾞャル"

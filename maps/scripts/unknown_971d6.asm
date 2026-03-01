
Data_97150:
    warpdef $01, $0a, $01, $01, MAP_12_03, $03, $0e, $03, $0d, SFX_2E
    warpdef $1c, $0a, $01, $01, MAP_12_01, $09, $03, $09, $04, SFX_2E

Data_97166:
	person_event $0f, $04, $07, $0e, $01, $01, $02, $04, $00, NULL, NULL
    person_event $ff, $00, $07, $0e, $01, $01, $02, $04, $00, Func_971f5, NULL
    person_event $03, $04, $09, $04, $01, $01, $02, $04, $00, Func_97311, NULL
    person_event $03, $04, $10, $04, $01, $01, $02, $04, $00, Func_97379, NULL
    person_event $03, $04, $17, $04, $01, $01, $02, $04, $00, Func_973e1, NULL
    person_event $ff, $00, $09, $09, $01, $01, $02, $04, $01, Func_97420, NULL
    person_event $ff, $00, $10, $09, $01, $01, $02, $04, $01, Func_97437, NULL
    person_event $ff, $00, $17, $09, $01, $01, $02, $04, $01, Func_9744e, NULL

Func_971d6:: ; 971d6
	loadwarps $02, Data_97150
	loadpeople $08, Data_97166
	playmusic SONG_TOWN2
	hideperson 0
	scall Func_8001c
	ret

Func_971f5:
	ld a, e
	or a
	jp nz, .asm_972e7
	checkevent $00db
	or a
	jp nz, .asm_972e1
	playsfx SFX_5E
	loademote $02, $02, $08
	ld e, $0e
	ld a, $07
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx SFX_28
	showperson 0
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep 30
	ld c, $02
	ld e, $01
	xor a
	scall Func_80e8d
	setevent $00db
	playsfx SFX_60
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	sprite_face $03, 0
	sprite_face $00, 0
	sprite_face $01, 0
	sprite_face $02, 0
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TOWN2
	face_player 0
	hideperson 0
	jp .asm_972e7
.asm_972e1:
	writetext TreeBitstreamText_3f79e
.asm_972e7:
	ret

Data_972e8:
	db $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $3f, $03, $14
	db $02, $09, $00, $78, $40, $03, $14, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_97311:
	push af
	ld a, e
	or a
	jp nz, .asm_97346
	face_player -$01
	writetext_yesorno TreeBitstreamText_472f0
	or a
	jp nz, .asm_97340
	startbattle Data_97348, Data_972e8
	or a
	jp nz, .asm_97337
	jp .asm_97346
.asm_97337:
	writetext TreeBitstreamText_47319
	jp .asm_97346
.asm_97340:
	writetext TreeBitstreamText_47306
.asm_97346:
	pop bc
	ret

Data_97348:
    dstr "(おんなのこ)"

Data_97350:
    db $00, $00, $00, $02, $00, $c5
	db $b3, $00, $00, $01, $01, $62, $04, $1e, $02, $03, $00, $78, $63, $04, $1e, $0d
	db $09, $0a, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $02

Func_97379:
	push af
	ld a, e
	or a
	jp nz, .asm_973ae
	face_player -$01
	writetext_yesorno TreeBitstreamText_472f0
	or a
	jp nz, .asm_973a8
	startbattle Data_973b0, Data_97350
	or a
	jp nz, .asm_9739f
	jp .asm_973ae
.asm_9739f:
	writetext TreeBitstreamText_47319
	jp .asm_973ae
.asm_973a8:
	writetext TreeBitstreamText_47306
.asm_973ae:
	pop bc
	ret

Data_973b0:
    dstr "(おんなのこ)"

Data_973b8:
    db $00, $00, $00, $02, $00, $c5, $b3, $00, $00, $01, $01, $41, $05, $28
	db $02, $02, $05, $67, $50, $05, $28, $0e, $0e, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02

Func_973e1:
	push af
	ld a, e
	or a
	jp nz, .asm_97416
	face_player -$01
	writetext_yesorno TreeBitstreamText_472f0
	or a
	jp nz, .asm_97410
	startbattle Data_97418, Data_973b8
	or a
	jp nz, .asm_97407
	jp .asm_97416
.asm_97407:
	writetext TreeBitstreamText_47319
	jp .asm_97416
.asm_97410:
	writetext TreeBitstreamText_47306
.asm_97416:
	pop bc
	ret

Data_97418:
    dstr "(おんなのこ)"

Func_97420:
	ld a, e
	cp $02
	jp nz, .asm_97436
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_97436
	landmarksign TreeBitstreamText_4732b
	jp .asm_97436
.asm_97436:
	ret

Func_97437:
	ld a, e
	cp $02
	jp nz, .asm_9744d
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_9744d
	landmarksign TreeBitstreamText_47337
	jp .asm_9744d
.asm_9744d:
	ret

Func_9744e:
	ld a, e
	cp $02
	jp nz, .asm_97464
	ld a, [wPlayerFacing]
	or a
	jp nz, .asm_97464
	landmarksign TreeBitstreamText_47343
	jp .asm_97464
.asm_97464:
	ret

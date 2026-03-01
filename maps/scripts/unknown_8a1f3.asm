
Data_8a130:
	warpdef $01, $0a, $01, $01, MAP_05_30, $01, $0a, $02, $0a, SFX_2E
	warpdef $12, $0a, $01, $01, MAP_05_30, $12, $0a, $11, $0a, SFX_2E

Data_8a146:
	db $23, $0b, $0b, $03, $0b

Data_8a14b:
IF DEF(SUN)
	wildbot $00, $02, $14, $14, $30, $08, $0a, $3a, $17, $1b, $1c, $01, $0a, $00
	wildbot $00, $02, $14, $14, $03, $08, $0a, $01, $0f, $17, $00, $01, $09, $00
	wildbot $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00
	wildbot $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $03, $04, $00
	wildbot $00, $02, $14, $14, $3a, $0a, $0c, $17, $1f, $1e, $08, $02, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $14, $6d, $08, $0a, $02, $09, $0e, $00, $01, $0a, $00
	wildbot $00, $02, $14, $14, $07, $08, $0a, $45, $06, $06, $11, $01, $09, $00
	wildbot $00, $02, $14, $14, $52, $07, $09, $2d, $09, $09, $00, $08, $08, $00
	wildbot $00, $02, $14, $14, $1b, $09, $0b, $7f, $04, $0a, $00, $08, $04, $00
	wildbot $00, $02, $14, $14, $14, $0a, $0c, $17, $09, $0f, $00, $02, $02, $00
ENDC

Data_8a191:
	person_event $0c, $04, $08, $05, $01, $01, $00, $04, $00, Func_8a284, NULL
	person_event $00, $04, $09, $05, $01, $01, $00, $04, $00, Func_8a30a, NULL
	person_event $01, $04, $0a, $05, $01, $01, $00, $04, $00, Func_8a394, NULL
	person_event $03, $04, $0b, $05, $01, $01, $00, $04, $00, Func_8a41d, NULL

Data_8a1c9:
	person_event $ff, $00, $07, $03, $06, $01, $00, $04, $00, Func_8a5a5, NULL
	person_event $0f, $04, $0e, $0f, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0e, $0f, $01, $01, $02, $04, $00, Func_8a480, NULL

Func_8a1f3:: ; 8a1f3
	call Func_8a5e7
	ld hl, Func_8a5e7
	scall Func_80f11
	loadwarps $02, Data_8a130
	ld e, $01
	ld hl, Data_8a146
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8a14b
	checkevent $001f
	or a
	jp nz, .asm_8a23d
	loadpeople $04, Data_8a191
	loadpeople $03, Data_8a1c9
	hideperson $05
	jp .asm_8a24c
.asm_8a23d:
	loadpeople $03, Data_8a1c9
	hideperson $01
.asm_8a24c:
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_468d4
	ret

Data_8a25b:
	db $00, $00, $00, $01, $00, $c5, $c8, $00, $00, $18, $01, $18, $01, $09, $09, $09
	db $0b, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a284:
	push af
	ld a, e
	or a
	jp nz, .asm_8a2da
	face_player -$01
	checkevent $007a
	or a
	jp nz, .asm_8a2d4
	writetext TreeBitstreamText_42998
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a2cb
	startbattle Data_8a2dc, Data_8a25b
	or a
	jp nz, .asm_8a2ba
	jp .asm_8a2da
.asm_8a2ba:
	setevent $007a
	writetext TreeBitstreamText_429a1
	jp .asm_8a2d1
.asm_8a2cb:
	writetext TreeBitstreamText_429d1
.asm_8a2d1:
	jp .asm_8a2da
.asm_8a2d4:
	writetext TreeBitstreamText_4298a
.asm_8a2da:
	pop bc
	ret

Data_8a2dc:
	dstr "ロッカー"

Data_8a2e1:
	db $00, $00, $00, $01, $00, $c5, $c0, $00, $00, $52, $01, $52, $01, $09, $1f, $07
	db $18, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a30a:
	push af
	ld a, e
	or a
	jp nz, .asm_8a360
	face_player -$01
	checkevent $007b
	or a
	jp nz, .asm_8a35a
	writetext TreeBitstreamText_429aa
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a351
	startbattle Data_8a362, Data_8a2e1
	or a
	jp nz, .asm_8a340
	jp .asm_8a360
.asm_8a340:
	setevent $007b
	writetext TreeBitstreamText_429b8
	jp .asm_8a357
.asm_8a351:
	writetext TreeBitstreamText_429d1
.asm_8a357:
	jp .asm_8a360
.asm_8a35a:
	writetext TreeBitstreamText_429b8
.asm_8a360:
	pop bc
	ret

Data_8a362:
	dstr "(かいしゃいん)"

Data_8a36b:
	db $00, $00, $00, $01, $00, $c5, $c2, $00, $00, $33, $01, $33, $01, $09, $17, $05
	db $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a394:
	push af
	ld a, e
	or a
	jp nz, .asm_8a3ea
	face_player -$01
	checkevent $007c
	or a
	jp nz, .asm_8a3e4
	writetext TreeBitstreamText_42972
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a3db
	startbattle Data_8a3ec, Data_8a36b
	or a
	jp nz, .asm_8a3ca
	jp .asm_8a3ea
.asm_8a3ca:
	setevent $007c
	writetext TreeBitstreamText_42972
	jp .asm_8a3e1
.asm_8a3db:
	writetext TreeBitstreamText_42972
.asm_8a3e1:
	jp .asm_8a3ea
.asm_8a3e4:
	writetext TreeBitstreamText_42972
.asm_8a3ea:
	pop bc
	ret

Data_8a3ec:
	dstr "(おねえさん)"

Data_8a3f4:
	db $00, $00, $00, $01, $00, $c5, $af, $00, $00, $90, $01, $90, $02, $09, $04, $17
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8a41d:
	push af
	ld a, e
	or a
	jp nz, .asm_8a473
	face_player -$01
	checkevent $007d
	or a
	jp nz, .asm_8a46d
	writetext TreeBitstreamText_4297c
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8a464
	startbattle Data_8a475, Data_8a3f4
	or a
	jp nz, .asm_8a453
	jp .asm_8a473
.asm_8a453:
	setevent $007d
	writetext TreeBitstreamText_4298a
	jp .asm_8a46a
.asm_8a464:
	writetext TreeBitstreamText_429ca
.asm_8a46a:
	jp .asm_8a473
.asm_8a46d:
	writetext TreeBitstreamText_429dc
.asm_8a473:
	pop bc
	ret

Data_8a475:
	dstr "(しﾞょしこうせい)"

Func_8a480:
	push af
	ld hl, sp+$01
	ld a, [hl]
	dec a
	ld hl, sp+$01
	ld [hl], a
	ld a, e
	or a
	jp nz, .asm_8a5a3
	checkevent $00d8
	or a
	jp nz, .asm_8a59d
	playsfx $5e
	loademote $02, $02, $08
	ld e, $0f
	ld a, $0e
	scall MoveEmote
	scall WaitEmote
	scall HideEmote
	playsfx $28
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	playsfx $60
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_WORLD_MAP
	face_player -$01
	script_sleep 30
	ld c, $0e
	ld e, $0d
	ld a, $0c
	scall Func_80e8d
	setevent $00d8
	playsfx $60
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $01
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld e, $02
	ld hl, sp+$01
	ld a, [hl]
	scall SpriteFace
	ld a, $0f
	scall FadeOutAudio
	playmusic SONG_NONE
	ld a, $01
	scall FadeInAudio
	playmusic SONG_TOWER
	face_player -$01
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	jp .asm_8a5a3
.asm_8a59d:
	writetext TreeBitstreamText_3f79e
.asm_8a5a3:
	pop bc
	ret

Func_8a5a5:
	ld a, e
	or a
	jp nz, .asm_8a5bf
	ld a, [wc790]
	or a
	jp z, .asm_8a5b9
	ld a, [wc790]
	cp $07
	jp nz, .asm_8a5bf
.asm_8a5b9:
	writetext TreeBitstreamText_4706a
.asm_8a5bf:
	ret

Data_8a5c0:
	warpdef $01, $0a, $01, $01, MAP_05_30, $01, $0a, $01, $0b, SFX_2E
	warpdef $12, $0a, $01, $01, MAP_05_30, $12, $0a, $12, $0b, SFX_2E
	warpdef $0f, $04, $01, $01, MAP_05_32, $0f, $04, $0f, $05, SFX_2E

Data_8a5e1:
	db $13, $13, $01, $01, $0f, $04

Func_8a5e7:
	checkevent $0086
	cp $01
	jp nz, .asm_8a606
	ld hl, Data_8a5e1
	scall Func_80d9b
	scall Func_80f02
	scall AllocateSpaceForWarps
	loadwarps $03, Data_8a5c0
.asm_8a606:
	ret

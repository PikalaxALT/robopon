
Data_cb60e:
	warpdef $01, $0a, $01, $01, MAP_21_22, $01, $0a, $01, $09, SFX_2E
	warpdef $0d, $0b, $01, $01, MAP_21_22, $0d, $0b, $0c, $0b, SFX_2E
	warpdef $12, $0d, $01, $01, MAP_21_22, $12, $0d, $11, $0d, SFX_2E
	warpdef $07, $13, $01, $01, MAP_21_24, $07, $13, $07, $12, SFX_2E
	warpdef $0c, $02, $01, $01, MAP_21_24, $0c, $02, $0c, $03, SFX_2E
	warpdef $11, $09, $01, $01, MAP_21_24, $11, $09, $11, $0a, SFX_2E

Data_cb650:
	db $33, $0c, $05, $03, $18

Data_cb655:
IF DEF(SUN)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $38, $1c, $1e, $19, $0d, $0b, $00, $04, $09, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $10, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $21, $23, $78, $21, $12, $00, $05, $02, $00
ELIF DEF(STAR)
	wildbot $00, $03, $14, $11, $77, $1b, $1d, $78, $09, $18, $00, $04, $0a, $00
	wildbot $00, $03, $14, $11, $1c, $1c, $1e, $77, $1f, $17, $11, $0e, $0a, $00
	wildbot $00, $03, $14, $11, $54, $1e, $20, $46, $20, $12, $00, $0f, $08, $00
	wildbot $00, $03, $14, $11, $75, $1f, $21, $3b, $07, $10, $00, $05, $04, $00
	wildbot $00, $03, $14, $11, $78, $20, $23, $78, $21, $12, $00, $05, $02, $00
ENDC

Data_cb69b:
	person_event $09, $0c, $0e, $03, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $0d, $03, $01, $03, $00, $04, $01, Func_cb721, NULL
	person_event $ff, $00, $0e, $06, $04, $01, $00, $04, $01, Func_cb721, NULL

Data_cb6c5:
	person_event $ff, $00, $09, $0a, $02, $02, $00, $04, $00, Func_cb809, NULL

Func_cb6d3:: ; cb6d3
	loadwarps $06, Data_cb60e
	ld e, $01
	ld hl, Data_cb650
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_cb655
	checkevent $00ad
	or a
	jp nz, .asm_cb702
	loadpeople $03, Data_cb69b
.asm_cb702:
	loadpeople $01, Data_cb6c5
	playmusic SONG_TOWN2
	scall Func_8001c
	landmarksign TreeBitstreamText_46ae0
	ret

Data_cb719:
	db $0d, $03, $ff, $ff

Data_cb71d:
	db $0e, $04, $ff, $ff

Func_cb721:
	push af
	ld a, e
	cp $02
	jp nz, .asm_cb774
	checkevent $00ad
	or a
	jp nz, .asm_cb774
	playmusic SONG_NONE
	playmusic SONG_ENCOUNTER_EVIL
	ld hl, sp+$01
	ld a, [hl]
	cp $01
	jp nz, .asm_cb756
	move_player $01, Data_cb719
	sprite_face $03, 0
	jp .asm_cb760
.asm_cb756:
	move_player $01, Data_cb71d
.asm_cb760:
	call Func_cb7a9
	setevent $00ad
	playmusic SONG_NONE
	playmusic SONG_TOWN2
.asm_cb774:
	pop bc
	ret

Data_cb776:
	db $0e, $06, $11, $09, $ff, $ff

Data_cb77c:
	db $0c, $02, $ff, $ff

Data_cb780:
	db $00, $00, $00
	db $01, $00, $c5, $ca, $00, $00, $8b, $01, $8b, $05, $20, $26, $12, $00, $06, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c

Func_cb7a9:
	writetext TreeBitstreamText_3ca99
	startbattle Data_cb801, Data_cb780
	or a
	jp nz, Func_cb7bd
	ret

Func_cb7bd:
	writetext TreeBitstreamText_3cac2
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_cb7d7
	move_person 0, Data_cb776, 1
	jp .asm_cb7e0
.asm_cb7d7:
	move_person 0, Data_cb77c, 1
.asm_cb7e0:
	scall WaitNPCStep
	hideperson 0
	hideperson $01
	hideperson $02
	playmusic SONG_NONE
	playmusic SONG_TOWN2
	ret

Data_cb801:
	dstr "(くﾞんそう)"

Func_cb809:
	ld a, e
	or a
	jp nz, .asm_cb834
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic SONG_TOWN2
.asm_cb834:
	ret

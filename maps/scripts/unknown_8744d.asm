
Data_87388:
	warpdef $02, $04, $01, $01, MAP_03_10, $01, $04, $01, $05, SFX_2E
    warpdef $08, $04, $01, $01, MAP_03_10, $07, $04, $08, $04, SFX_2E
    warpdef $01, $11, $01, $01, MAP_03_12, $16, $07, $15, $07, SFX_2E

Data_873a9: ; 873a9
	db $18, $02, $03, $01, $0c
    db $19, $0c, $12, $01, $0c

Data_873b3: ; 873b3
IF DEF(SUN)
	wildbot $05, $03, $08, $10, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $05, $03, $08, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $08, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $08, $10, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $05, $03, $08, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $00, $03, $05, $09, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $03, $05, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $05, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ELIF DEF(STAR)
	wildbot $05, $03, $08, $10, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $05, $03, $08, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $05, $03, $08, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $05, $03, $08, $10, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $05, $03, $08, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
	wildbot $00, $03, $05, $09, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $03, $05, $09, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $05, $09, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
ENDC

Data_87423: ; 87423
	person_event $ff, $00, $01, $09, $03, $03, $00, $04, $00, Func_87497, NULL
    person_event $00, $04, $0c, $0c, $01, $01, $03, $04, $00, Func_874ec, NULL
    person_event 08, $04, $04, $10, $01, $01, $02, $04, $00, Func_87574, NULL

Func_8744d::
	loadwarps $3, Data_87388
	ld e, $2
	ld hl, Data_873a9
	scall Func_80ce7
	ld a, $3
	scall Func_80d01
	loadwilds $8, Data_873b3
	loadpeople $3, Data_87423
	checkevent $0
	or a
	jp nz, .asm_87484
	ld a, $1
	ld [wc7da], a
	jp .asm_87488

.asm_87484: ; 87484 (21:7484)
	xor a
	ld [wc7da], a
.asm_87488: ; 87488 (21:7488)
	playmusic SONG_CAVE
	scall Func_8001c
	landmarksign TreeBitstreamText_46878
	ret

Func_87497:
	ld a, e
	or a
	jp nz, .asm_874c2
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $1, $2, $8
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic SONG_CAVE
.asm_874c2: ; 874c2 (21:74c2)
	ret

Data_874c3:
	db $00, $00, $00, $01, $00, $c5, $ae, $00, $00, $42, $01, $42, $02, $0c, $06, $07
	db $00, $66, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_874ec:
	push af
	ld a, e
	or a
	jp nz, .asm_87542
	face_player -$1
	checkevent $6e
	or a
	jp nz, .asm_8753c
	writetext TreeBitstreamText_42be8
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_87533
	startbattle Data_87544, Data_874c3
	or a
	jp nz, .asm_87522
	jp .asm_87542

.asm_87522: ; 87522 (21:7522)
	setevent $6e
	writetext TreeBitstreamText_42bf7
	jp .asm_87539

.asm_87533: ; 87533 (21:7533)
	writetext TreeBitstreamText_42bf7
.asm_87539: ; 87539 (21:7539)
	jp .asm_87542

.asm_8753c: ; 8753c (21:753c)
	writetext TreeBitstreamText_42c09
.asm_87542: ; 87542 (21:7542)
	pop bc
	ret

Data_87544:
	dstr "(りょうし)"

Data_8754b:
	db $00, $00, $00, $01, $00, $c5, $b9, $00, $00, $3f, $01, $3f, $02, $0d, $02, $09
	db $00, $65, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87574:
	push af
	ld a, e
	or a
	jp nz, .asm_8763c
	face_player -$1
	checkevent $6f
	or a
	jp nz, .asm_87602
	writetext TreeBitstreamText_42b8f
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_875f9
	startbattle Data_8763e, Data_8754b
	or a
	jp nz, .asm_875aa
	jp .asm_8763c

.asm_875aa: ; 875aa (21:75aa)
	setevent $6f
	checkevent $109
	or a
	jp nz, .asm_875f0
	ld a, [wc79c]
	cp $1
	jp c, .asm_875f0
	checkevent $114
	or a
	jp nz, .asm_875f0
	writetext TreeBitstreamText_45fec
	playsfx SFX_2A
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	scall Func_80d4d
	setevent $109
.asm_875f0: ; 875f0 (21:75f0)
	writetext TreeBitstreamText_42b98
	jp .asm_875ff

.asm_875f9: ; 875f9 (21:75f9)
	writetext TreeBitstreamText_42b7b
.asm_875ff: ; 875ff (21:75ff)
	jp .asm_8763c

.asm_87602: ; 87602 (21:7602)
	checkevent $109
	or a
	jp nz, .asm_87636
	ld a, [wc79c]
	cp $1
	jp c, .asm_87636
	writetext TreeBitstreamText_45fec
	playsfx SFX_2A
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	scall Func_80d4d
	setevent $109
.asm_87636: ; 87636 (21:7636)
	writetext TreeBitstreamText_42bc8
.asm_8763c: ; 8763c (21:763c)
	pop bc
	ret

Data_8763e:
	dstr "(かいてーしﾞん)"

Func_87648: ; 87648 (21:7648)
	resetevent $18
	resetevent $19
	resetevent $1a
	resetevent $4b
	ret


Data_87164:
	warpdef $08, $12, $03, $01, MAP_03_00, $2b, $06, $2b, $07, SFX_2E
    warpdef $01, $04, $01, $01, MAP_03_11, $02, $04, $02, $05, SFX_2E
    warpdef $07, $04, $01, $01, MAP_03_11, $08, $04, $09, $04, SFX_2E

Data_87185: ; 87185
	db $16, $0e, $03, $01, $30

Data_8718a: ; 8718a
IF DEF(SUN)
	wildbot $00, $03, $10, $10, $05, $09, $0b, $2d, $01, $06, $00, $08, $0a
	wildbot $00, $03, $10, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $10, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $03, $10, $10, $23, $0c, $0e, $4f, $1e, $1e, $00, $0a, $06
	wildbot $00, $03, $10, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ELIF DEF(STAR)
	wildbot $00, $03, $10, $10, $46, $09, $0b, $78, $14, $14, $00, $08, $0a
	wildbot $00, $03, $10, $10, $48, $0a, $0c, $7f, $14, $0d, $1e, $02, $09
	wildbot $00, $03, $10, $10, $49, $0b, $0d, $02, $02, $02, $02, $02, $08
	wildbot $00, $03, $10, $10, $25, $0c, $0e, $79, $18, $18, $00, $0a, $06
	wildbot $00, $03, $10, $10, $6a, $0e, $10, $7f, $03, $0c, $00, $0b, $02
ENDC

Data_871d0:
    dtext_tree_pointer TreeBitstreamText_46788
    dw -1

Data_871d4: ; 871d4
	person_event $06, $04, $0e, $07, $01, $01, $02, $04, $00, Func_8728f, NULL
    person_event $0e, $04, $01, $0a, $01, $01, $02, $04, $00, Func_87317, NULL
    person_event $ff, $00, $07, $0d, $01, $01, $00, $04, $00, PrintTextFacePlayer_21, Data_871d0

Func_871fe::
	loadwarps $3, Data_87164
	playmusic SONG_CAVE
	checkevent EVENT_000
	or a
	jp nz, .asm_8723b
	ld a, $1
	ld [wc7da], a
	scall Func_8001c
	writenpctext TreeBitstreamText_3a89f
	call Func_8737a
	checkevent EVENT_0F0
	or a
	jp nz, .asm_87238
	setevent EVENT_0F0
.asm_87238: ; 87238 (21:7238)
	jp .asm_87265

.asm_8723b: ; 8723b (21:723b)
	ld a, $3
	scall Func_80d01
	loadwilds $5, Data_8718a
	ld e, $1
	ld hl, Data_87185
	scall Func_80ce7
	loadpeople $3, Data_871d4
	xor a
	ld [wc7da], a
	scall Func_8001c
	landmarksign TreeBitstreamText_4686b
.asm_87265: ; 87265 (21:7265)
	ret

Data_87266:
	db $00, $00, $00, $01, $00, $c5, $c9, $00, $00, $91, $01, $91, $02, $0c, $0e, $13
	db $00, $70, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_8728f:
	push af
	ld a, e
	or a
	jp nz, .asm_872e5
	face_player -$1
	checkevent EVENT_06C
	or a
	jp nz, .asm_872df
	writetext TreeBitstreamText_42bb7
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_872d6
	startbattle Data_872e7, Data_87266
	or a
	jp nz, .asm_872c5
	jp .asm_872e5

.asm_872c5: ; 872c5 (21:72c5)
	setevent EVENT_06C
	writetext TreeBitstreamText_42bc8
	jp .asm_872dc

.asm_872d6: ; 872d6 (21:72d6)
	writetext TreeBitstreamText_42bc8
.asm_872dc: ; 872dc (21:72dc)
	jp .asm_872e5

.asm_872df: ; 872df (21:72df)
	writetext TreeBitstreamText_42bc8
.asm_872e5: ; 872e5 (21:72e5)
	pop bc
	ret

Data_872e7:
	dstr "(りょうし)"

Data_872ee:
	db $00, $00, $00, $01, $00, $c5, $b8, $00, $00, $7a, $01, $7a, $02, $0c, $17, $05
	db $1e, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_87317:
	push af
	ld a, e
	or a
	jp nz, .asm_8736d
	face_player -$1
	checkevent EVENT_06D
	or a
	jp nz, .asm_87367
	writetext TreeBitstreamText_42ba0
	writetext_yesorno TreeBitstreamText_46f28
	or a
	jp nz, .asm_8735e
	startbattle Data_8736f, Data_872ee
	or a
	jp nz, .asm_8734d
	jp .asm_8736d

.asm_8734d: ; 8734d (21:734d)
	setevent EVENT_06D
	writetext TreeBitstreamText_42baa
	jp .asm_87364

.asm_8735e: ; 8735e (21:735e)
	writetext TreeBitstreamText_42baa
.asm_87364: ; 87364 (21:7364)
	jp .asm_8736d

.asm_87367: ; 87367 (21:7367)
	writetext TreeBitstreamText_42c09
.asm_8736d: ; 8736d (21:736d)
	pop bc
	ret

Data_8736f:
	dstr "(りょうし)"

Data_87376:
	db $09, $12, $ff, $ff

Func_8737a: ; 8737a (21:737a)
	move_player $1, Data_87376
	scall WaitNPCStep
	ret

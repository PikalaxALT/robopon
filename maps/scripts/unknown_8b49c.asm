
Data_8b40e:
	warpdef $05, $05, $01, $01, MAP_05_35, $05, $05, $06, $05, SFX_2E

Data_8b419:
	db $27, $09, $0e, $01, $39

Data_8b41e:
IF DEF(SUN)
	wildbot $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $74, $0e, $10, $7f, $0c, $08, $00, $02, $08, $00
	wildbot $00, $02, $14, $11, $6c, $0c, $0e, $03, $17, $17, $0a, $02, $06, $00
	wildbot $00, $02, $14, $11, $14, $0f, $11, $17, $09, $0f, $00, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00
ELIF DEF(STAR)
	wildbot $00, $02, $14, $11, $18, $0d, $0f, $17, $1f, $07, $18, $02, $0a, $00
	wildbot $00, $02, $14, $11, $4c, $0e, $10, $45, $01, $01, $01, $02, $08, $00
	wildbot $00, $02, $14, $11, $74, $0c, $0e, $7f, $0c, $08, $00, $02, $06, $00
	wildbot $00, $02, $14, $11, $35, $0f, $11, $77, $17, $12, $11, $02, $04, $00
	wildbot $00, $02, $14, $11, $53, $10, $12, $7f, $1f, $07, $1a, $0a, $02, $00
ENDC

Data_8b464:
	person_event $1e, $0c, $0a, $04, $01, $01, $02, $04, $00, NULL, NULL
	person_event $ff, $00, $09, $08, $03, $01, $00, $04, $01, Func_8b4ea, NULL

Data_8b480:
	person_event $ff, $00, $0d, $03, $01, $01, $00, $04, $00, Func_8b53d, NULL
	person_event $ff, $00, $0e, $03, $01, $01, $00, $04, $00, Func_8b58c, NULL

Func_8b49c:: ; 8b49c
	loadwarps $01, Data_8b40e
	ld e, $01
	ld hl, Data_8b419
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $05, Data_8b41e
	checkevent $003c
	or a
	jp nz, .asm_8b4cb
	loadpeople $02, Data_8b464
.asm_8b4cb:
	loadpeople $02, Data_8b480
	playmusic SONG_TOWER
	scall Func_8001c
	landmarksign TreeBitstreamText_46910
	ret

Data_8b4e2:
	db $0a, $06, $ff, $ff

Data_8b4e6:
	db $0d, $04, $ff, $ff

Func_8b4ea:
	ld a, e
	cp $02
	jp nz, .asm_8b53c
	playmusic SONG_NONE
	move_player $01, Data_8b4e2
	scall WaitNPCStep
	playmusic SONG_TITLE
	writenpctext TreeBitstreamText_3afdd
	move_person 0, Data_8b4e6, 1
	scall WaitNPCStep
	sprite_face $00, 0
	hideperson 0
	hideperson $01
	playmusic SONG_NONE
	playmusic SONG_TOWER
	setevent $003c
.asm_8b53c:
	ret

Func_8b53d:
	ld a, e
	or a
	jp nz, .asm_8b58b
	ld a, [wPlayerFacing]
	or a
	jp z, .asm_8b54c
	jp .asm_8b58b
.asm_8b54c:
	checkevent $0059
	cp $01
	jp nz, .asm_8b560
	writetext TreeBitstreamText_47037
	jp .asm_8b58b
.asm_8b560:
	xor a
	scall Func_80653
	loademote $01, $01, $09
	playsfx SFX_5A
	scall WaitEmote
	scall HideEmote
	warp_player MAP_28_00, $07, $06
	pop bc
	script_sleep 30
.asm_8b58b:
	ret

Func_8b58c:
	ld a, e
	or a
	jp nz, .asm_8b5dc
	ld a, [wc790]
	or a
	jp z, .asm_8b5a9
	ld a, [wc790]
	cp $07
	jp nc, .asm_8b5a9
	writetext TreeBitstreamText_47041
	jp .asm_8b5dc
.asm_8b5a9:
	checkevent $0059
	or a
	jp nz, .asm_8b5c9
	setevent $0059
	playsfx SFX_32
	writetext TreeBitstreamText_47029
	jp .asm_8b5dc
.asm_8b5c9:
	resetevent $0059
	playsfx SFX_28
	writetext TreeBitstreamText_4701b
.asm_8b5dc:
	ret

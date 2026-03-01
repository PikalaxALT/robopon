
Data_9176f:
	warpdef $04, $00, $01, $01, MAP_08_00, $0a, $09, $0a, $08, SFX_2E

Data_9177a:
	db $29, $04, $17, $01, $13

Data_9177f:
IF DEF(SUN)
	wildbot $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $01, $09, $18, $11, $10, $12, $02, $1f, $1e, $18, $0d, $08, $00
	wildbot $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ELIF DEF(STAR)
	wildbot $00, $01, $09, $18, $43, $10, $12, $77, $06, $07, $00, $0c, $0a, $00
	wildbot $00, $01, $09, $18, $8b, $10, $12, $77, $05, $05, $00, $0d, $08, $00
	wildbot $00, $01, $09, $18, $44, $12, $14, $77, $14, $08, $00, $0c, $04, $00
ENDC

Data_917a9:
IF DEF(SUN)
	wildbot $00, $01, $09, $18, $0c, $10, $12, $77, $05, $17, $00, $03, $0a, $00
	wildbot $00, $01, $09, $18, $07, $11, $13, $45, $06, $06, $11, $03, $06, $00
	wildbot $00, $01, $09, $18, $1d, $12, $14, $51, $1f, $17, $08, $0c, $05, $00
	wildbot $00, $01, $09, $18, $0d, $13, $15, $77, $01, $05, $00, $03, $04, $00
ELIF DEF(STAR)
	wildbot $00, $01, $09, $18, $09, $10, $12, $77, $03, $0f, $00, $03, $0a, $00
	wildbot $00, $01, $09, $18, $58, $11, $13, $03, $1f, $17, $11, $03, $06, $00
	wildbot $00, $01, $09, $18, $39, $12, $14, $1a, $0e, $0b, $00, $03, $05, $00
	wildbot $00, $01, $09, $18, $0a, $13, $15, $77, $04, $0f, $00, $03, $04, $00
ENDC

Data_917e1:
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_918f5, NULL
	person_event $00, $04, $02, $15, $01, $01, $03, $04, $00, Func_9198b, NULL
	person_event $08, $04, $00, $16, $01, $01, $01, $04, $00, Func_91b0c, NULL
	person_event $18, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL
	person_event $11, $04, $01, $15, $01, $01, $01, $04, $00, NULL, NULL

Data_91827:
	db $04, $00, $01, $01, $06, $00, $10, $09, $10, $0a, $2e

Data_91832:
	db $24, $04, $17

Data_91835:
	db $24, $04, $17, $00, $00

Data_9183a:
	person_event $00, $04, $04, $16, $01, $01, $01, $04, $00, Func_806dd_24, Data_91832
	person_event $ff, $00, $03, $15, $03, $01, $00, $04, $00, Func_91ae0, NULL

Func_91856:: ; 91856
	ld a, [wBackupMapGroup]
	cp $06
	jp nz, .asm_918a0
	ld a, [wBackupMapNumber]
	or a
	jp nz, .asm_918a0
	loadwarps $01, Data_91827
	ld e, $01
	ld hl, Data_91835
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $04, Data_917a9
	loadpeople $02, Data_9183a
	ld a, $05
	ld [wc7e2], a
	playmusic $08
	scall Func_8001c
	landmarksign TreeBitstreamText_4691c
	jp .asm_918f4
.asm_918a0:
	loadwarps $01, Data_9176f
	ld e, $01
	ld hl, Data_9177a
	scall Func_80ce7
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_9177f
	ld a, $08
	ld [wBackupMapGroup], a
	xor a
	ld [wBackupMapNumber], a
	ld a, $06
	ld [wc7e2], a
	loadpeople $05, Data_917e1
	ld a, $01
	scall LoadPlayerSprite
	playmusic $08
	hideperson $03
	hideperson $04
	scall Func_8001c
	landmarksign TreeBitstreamText_4691c
.asm_918f4:
	ret

Func_918f5:
	ld a, e
	or a
	jp nz, .asm_91980
	ld a, $0f
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $41
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $50
	scall Func_80e6d
	cp $ff
	jp nz, .asm_91922
	ld a, $64
	scall Func_80e6d
	cp $ff
	jp z, .asm_9197a
.asm_91922:
	ld a, [wc790]
	or a
	jp z, .asm_91971
	ld a, [wc790]
	cp $06
	jp nc, .asm_91971
	writetext_yesorno TreeBitstreamText_46f30
	or a
	jp nz, .asm_9196e
	playmusic SONG_NONE
	playmusic $0a
	xor a
	scall Func_80653
	loademote $01, $01, $0b
	scall WaitEmote
	scall HideEmote
	ld a, $04
	scall LoadPlayerSprite
	ld a, $02
	scall PlayerFace
	ld l, $04
	push hl
	ld c, $2e
	ld e, $01
	ld a, $1e
	scall Func_80dff
	pop bc
.asm_9196e:
	jp .asm_91977
.asm_91971:
	writetext TreeBitstreamText_470f0
.asm_91977:
	jp .asm_91980
.asm_9197a:
	writetext TreeBitstreamText_470d8
.asm_91980:
	ret

Data_91981:
	db $01, $16, $02, $16, $ff, $ff

Data_91987:
	db $01, $16, $ff, $ff

Func_9198b:
	ld a, e
	or a
	jp nz, .asm_91adf
	ld a, [wPlayerFacing]
	cp $01
	jp nz, .asm_919a9
	move_player $01, Data_91981
	scall WaitNPCStep
	xor a
	scall PlayerFace
.asm_919a9:
	face_player $01
	checkevent $0039
	cp $01
	jp nz, .asm_91ad9
	checkevent $0020
	or a
	jp nz, .asm_91ad9
	checkevent $003a
	cp $01
	jp nz, .asm_91ad0
	checkevent $0047
	or a
	jp nz, .asm_91ac7
	ld a, $1f
	scall Func_80e6d
	cp $ff
	jp z, .asm_91abe
	push af
	writenpctext TreeBitstreamText_3bc83
	script_sleep 30
	playmusic SONG_NONE
	playmusic $19
	showperson $03
	script_sleep 30
	loademote $01, $01, $29
	ld e, $15
	ld a, $02
	scall MoveEmote
	hideperson $01
	scall WaitEmote
	hideperson $03
	script_sleep 30
	playsfx $68
	showperson $04
	script_sleep 30
	showperson $01
	script_sleep 1
	scall HideEmote
	script_sleep 30
	move_player $01, Data_91987
	scall WaitNPCStep
	script_sleep 30
	xor a
	scall PlayerFace
	call WaitVideoTransfer
	pop af
	push af
	ld l, a
	ld h, $00
	ld de, $0b00
	add hl, de
	scall Func_80488
	pop af
	push hl
	ld e, $01
	ld c, $00
	scall GiveRobot
	pop hl
	give_robot SPEEDY, l, $00
	setevent $0047
	script_sleep 30
	playsfx $2a
	hideperson $04
	writetext TreeBitstreamText_3bd77
	writenpctext TreeBitstreamText_3bd02
	playmusic SONG_NONE
	playmusic $08
	jp .asm_91ac4
.asm_91abe:
	writenpctext TreeBitstreamText_3bd37
.asm_91ac4:
	jp .asm_91acd
.asm_91ac7:
	writenpctext TreeBitstreamText_3bd02
.asm_91acd:
	jp .asm_91ad6
.asm_91ad0:
	writenpctext TreeBitstreamText_3bbab
.asm_91ad6:
	jp .asm_91adf
.asm_91ad9:
	writenpctext TreeBitstreamText_3bbab
.asm_91adf:
	ret

Func_91ae0:
	ld a, e
	or a
	jp nz, .asm_91b0b
	heal
	playmusic SONG_NONE
	playmusic $16
	loademote $01, $02, $08
	scall WaitEmote
	scall HideEmote
	writetext TreeBitstreamText_46e0b
	playmusic $08
.asm_91b0b:
	ret

Func_91b0c:
	push af
	ld a, e
	or a
	jp nz, .asm_91b6b
	face_player -$01
	checkevent $010f
	or a
	jp nz, .asm_91b65
	ld a, [wc79c]
	cp $01
	jp c, .asm_91b65
	checkevent $0114
	or a
	jp nz, .asm_91b65
	writetext TreeBitstreamText_3bc38
	script_sleep 30
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $00
	ld e, $01
	ld a, $10
	scall Func_80d4d
	setevent $010f
	jp .asm_91b6b
.asm_91b65:
	writetext TreeBitstreamText_3bc38
.asm_91b6b:
	pop bc
	ret

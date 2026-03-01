
Data_831e4:
	warpdef $08, $01, $01, $01, MAP_00_17, $08, $01, $08, $02, SFX_2E
	warpdef $09, $01, $01, $01, MAP_00_19, $09, $01, $09, $02, SFX_2E
	warpdef $0a, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_2E

Data_83205: ; 83205
	person_event $08, $04, $03, $02, $01, $01, $01, $04, $00, Func_8326c, NULL

Func_83213::
	call Func_8324c
	ld hl, Func_8324c
	scall Func_80f11
	ld a, $9
	ld [wc7de], a
	loadwarps $3, Data_831e4
	loadpeople $1, Data_83205
	playmusic SONG_SHOP
	scall Func_8001c
	landmarksign TreeBitstreamText_46c4e
	ret

Data_83240:
	db $07, $01, $01, $01, $09, $01

Data_83246: ; 83246
	db $07, $01, $01, $01, $0a, $01

Func_8324c: ; 8324c (20:724c)
	ld a, [wc78c]
	cp $a
	jp nc, .asm_8325a
	ld hl, Data_83240
	scall Func_80d9b
.asm_8325a: ; 8325a (20:725a)
	ld a, [wc78c]
	cp $5
	jp nc, .asm_83268
	ld hl, Data_83246
	scall Func_80d9b
.asm_83268: ; 83268 (20:7268)
	scall Func_80f02
	ret

Func_8326c:
	push af
	ld a, e
	or a
	jp nz, .asm_83318
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	writetext_yesorno TreeBitstreamText_4600d
	or a
	jp nz, .asm_832d4
	writetext TreeBitstreamText_46031
	ld a, $1
	call NamingScreen_20
	checkevent $108
	or a
	jp nz, .asm_832cb
	ld a, [wc79c]
	cp $1
	jp c, .asm_832cb
	checkevent $114
	or a
	jp nz, .asm_832cb
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	scall Func_80d4d
	setevent $108
.asm_832cb: ; 832cb (20:72cb)
	writetext TreeBitstreamText_4604f
	jp .asm_83318

.asm_832d4: ; 832d4 (20:72d4)
	writetext TreeBitstreamText_46040
	checkevent $108
	or a
	jp nz, .asm_83318
	ld a, [wc79c]
	cp $1
	jp c, .asm_83318
	checkevent $114
	or a
	jp nz, .asm_83318
	writetext TreeBitstreamText_45fec
	playsfx $2a
	writetext TreeBitstreamText_45ffd
	ld c, $0
	ld e, $1
	ld a, $10
	scall Func_80d4d
	setevent $108
.asm_83318: ; 83318 (20:7318)
	pop bc
	ret

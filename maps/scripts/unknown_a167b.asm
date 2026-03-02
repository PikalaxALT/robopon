
Data_a161c: ; a161c
	warpdef $04, $09, $02, $01, MAP_20_00, $0d, $11, $0d, $12, SFX_34
Data_a161c_end:

Data_a1627:
	person_event $09, $04, $04, $03, $01, $02, $02, $04, $00, Func_a16f4, NULL
	person_event $09, $04, $00, $05, $01, $01, $01, $04, $00, Func_a17a6, NULL
	person_event $09, $04, $00, $06, $01, $01, $01, $04, $00, Func_a187b, NULL
	person_event $09, $04, $09, $05, $01, $01, $03, $04, $00, Func_a195e, NULL
	person_event $09, $04, $09, $06, $01, $01, $03, $04, $00, Func_a1a41, NULL
	person_event $09, $04, $09, $07, $01, $01, $03, $04, $00, Func_a1b24, NULL
Data_a1627_end:

Func_a167b:: ; a167b
	ld e, (Data_a161c_end - Data_a161c) / 11
	ld hl, Data_a161c
	scall LoadWarps
	ld e, (Data_a1627_end - Data_a1627) / 14
	ld hl, Data_a1627
	scall LoadMapObjects
	checkevent EVENT_095
	cp $1
	jp nz, .asm_a16e5
	checkevent EVENT_09A
	cp $1
	jp nz, .asm_a16e5
	checkevent EVENT_09F
	cp $1
	jp nz, .asm_a16e5
	checkevent EVENT_0A4
	cp $1
	jp nz, .asm_a16e5
	checkevent EVENT_0A9
	cp $1
	jp nz, .asm_a16e5
	hideperson $1
	hideperson $2
	hideperson $3
	hideperson $4
	hideperson $5
.asm_a16e5:
	playmusic SONG_WORLD_MAP
	scall Func_8001c
	landmarksign TreeBitstreamText_46645
	ret

Func_a16f4:
	ld a, e
	or a
	jp nz, .asm_a177c
	checkevent EVENT_03B
	or a
	jp nz, .asm_a175e
	writenpctext_yesorno TreeBitstreamText_3c305
	or a
	jp nz, .asm_a1755
	push hl
	push hl
	ld hl, $0000
	push hl
	ld hl, $0000
	push hl
	call AdjustMoney
	pop bc
	pop bc
	ld hl, $0000
	push hl
	ld hl, $03e8
	push hl
	call CompareStackLongs_Signed
	jp nc, .asm_a1733
	writenpctext TreeBitstreamText_3c390
	jp .asm_a1752
.asm_a1733:
	push hl
	push hl
	ld hl, $ffff
	push hl
	ld hl, $fc18
	push hl
	call AdjustMoney
	pop bc
	pop bc
	pop bc
	pop bc
	writenpctext TreeBitstreamText_3c3bd
	setevent EVENT_03B
.asm_a1752:
	jp .asm_a175b
.asm_a1755:
	writenpctext TreeBitstreamText_3c35b
.asm_a175b:
	jp .asm_a177c
.asm_a175e:
	ld a, [wc790]
	or a
	jp z, .asm_a1776
	ld a, [wc790]
	cp $05
	jp nc, .asm_a1776
	writetext TreeBitstreamText_3d897
	jp .asm_a177c
.asm_a1776:
	writenpctext TreeBitstreamText_3c437
.asm_a177c:
	ret

Data_a177d:
	db $00, $00, $00, $01, $00, $c5, $ba
	db $00, $00, $8d, $01, $8d, $04, $19, $0c, $0d, $14, $03, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $0c

Func_a17a6:
	ld a, e
	or a
	jp nz, .asm_a1848
	face_player $01
	checkevent EVENT_03B
	cp $01
	jp nz, .asm_a1842
	checkevent EVENT_042
	or a
	jp nz, .asm_a1839
	checkevent EVENT_03D
	or a
	jp nz, .asm_a1830
	writetext_yesorno TreeBitstreamText_3c51f
	or a
	jp nz, .asm_a1827
	writetext TreeBitstreamText_3c65d
	startbattle Data_a1849, Data_a177d
	or a
	jp nz, .asm_a17ef
	jp .asm_a1848
.asm_a17ef:
	writetext TreeBitstreamText_3c677
	playsfx SFX_2A
	writetext TreeBitstreamText_3c6dd
	writetext TreeBitstreamText_3c6ec
	setevent EVENT_03D
	setevent EVENT_042
	ld c, $00
	ld e, $01
	ld a, $1e
	scall Func_80d4d
	ld a, $01
	ld [wc78f], a
	jp .asm_a182d
.asm_a1827:
	writetext TreeBitstreamText_3c66a
.asm_a182d:
	jp .asm_a1836
.asm_a1830:
	writetext TreeBitstreamText_3c4f2
.asm_a1836:
	jp .asm_a183f
.asm_a1839:
	writetext TreeBitstreamText_3c4ab
.asm_a183f:
	jp .asm_a1848
.asm_a1842:
	writetext TreeBitstreamText_3c46d
.asm_a1848:
	ret

Data_a1849:
	dstr "(くﾞんしﾞん)"

Data_a1852:
	db $00, $00
	db $00, $01, $00, $c5, $ba, $00, $00, $07, $01, $07, $04, $19, $01, $13, $17, $6f
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0c

Func_a187b:
	ld a, e
	or a
	jp nz, .asm_a192b
	face_player $02
	checkevent EVENT_03B
	cp $01
	jp nz, .asm_a1925
	checkevent EVENT_042
	or a
	jp nz, .asm_a191c
	checkevent EVENT_03E
	or a
	jp nz, .asm_a1913
	writetext_yesorno TreeBitstreamText_3c552
	or a
	jp nz, .asm_a190a
	writetext TreeBitstreamText_3c65d
	writetext TreeBitstreamText_471a6
.asm_a18ba:
	ld de, Data_a192c
	ld hl, Data_a1852
	scall Func_803f5
	or a
	jp nz, .asm_a18d2
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a18ba
	jp .asm_a192b
.asm_a18d2:
	writetext TreeBitstreamText_3c677
	playsfx SFX_2A
	writetext TreeBitstreamText_3c69d
	writetext TreeBitstreamText_3c6ec
	setevent EVENT_03E
	setevent EVENT_042
	ld c, $00
	ld e, $01
	ld a, $1c
	scall Func_80d4d
	ld a, $02
	ld [wc78f], a
	jp .asm_a1910
.asm_a190a:
	writetext TreeBitstreamText_3c66a
.asm_a1910:
	jp .asm_a1919
.asm_a1913:
	writetext TreeBitstreamText_3c4f2
.asm_a1919:
	jp .asm_a1922
.asm_a191c:
	writetext TreeBitstreamText_3c4ab
.asm_a1922:
	jp .asm_a192b
.asm_a1925:
	writetext TreeBitstreamText_3c46d
.asm_a192b:
	ret

Data_a192c:
	dstr "(くﾞんしﾞん)"

Data_a1935:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $1f, $01, $1f, $04, $19, $17
	db $17, $17, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a195e:
	ld a, e
	or a
	jp nz, .asm_a1a0e
	face_player $03
	checkevent EVENT_03B
	cp $01
	jp nz, .asm_a1a08
	checkevent EVENT_042
	or a
	jp nz, .asm_a19ff
	checkevent EVENT_03F
	or a
	jp nz, .asm_a19f6
	writetext_yesorno TreeBitstreamText_3c5a0
	or a
	jp nz, .asm_a19ed
	writetext TreeBitstreamText_3c65d
	writetext TreeBitstreamText_471cf
.asm_a199d:
	ld de, Data_a1a0f
	ld hl, Data_a1935
	scall Func_802ef
	or a
	jp nz, .asm_a19b5
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a199d
	jp .asm_a1a0e
.asm_a19b5:
	writetext TreeBitstreamText_3c677
	playsfx SFX_2A
	writetext TreeBitstreamText_3c6ad
	writetext TreeBitstreamText_3c6ec
	setevent EVENT_03F
	setevent EVENT_042
	ld c, $00
	ld e, $01
	ld a, $1d
	scall Func_80d4d
	ld a, $03
	ld [wc78f], a
	jp .asm_a19f3
.asm_a19ed:
	writetext TreeBitstreamText_3c66a
.asm_a19f3:
	jp .asm_a19fc
.asm_a19f6:
	writetext TreeBitstreamText_3c4f2
.asm_a19fc:
	jp .asm_a1a05
.asm_a19ff:
	writetext TreeBitstreamText_3c4ab
.asm_a1a05:
	jp .asm_a1a0e
.asm_a1a08:
	writetext TreeBitstreamText_3c46d
.asm_a1a0e:
	ret

Data_a1a0f:
	dstr "(くﾞんしﾞん)"

Data_a1a18:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00, $4e, $01, $4e
	db $04, $19, $01, $02, $03, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1a41:
	ld a, e
	or a
	jp nz, .asm_a1af1
	face_player $04
	checkevent EVENT_03B
	cp $01
	jp nz, .asm_a1aeb
	checkevent EVENT_042
	or a
	jp nz, .asm_a1ae2
	checkevent EVENT_040
	or a
	jp nz, .asm_a1ad9
	writetext_yesorno TreeBitstreamText_3c5cf
	or a
	jp nz, .asm_a1ad0
	writetext TreeBitstreamText_3c65d
	writetext TreeBitstreamText_471bb
.asm_a1a80:
	ld de, Data_a1af2
	ld hl, Data_a1a18
	scall Func_80347
	or a
	jp nz, .asm_a1a98
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1a80
	jp .asm_a1af1
.asm_a1a98:
	writetext TreeBitstreamText_3c677
	playsfx SFX_2A
	writetext TreeBitstreamText_3c6ce
	writetext TreeBitstreamText_3c6ec
	setevent EVENT_040
	setevent EVENT_042
	ld c, $00
	ld e, $01
	ld a, $20
	scall Func_80d4d
	ld a, $04
	ld [wc78f], a
	jp .asm_a1ad6
.asm_a1ad0:
	writetext TreeBitstreamText_3c66a
.asm_a1ad6:
	jp .asm_a1adf
.asm_a1ad9:
	writetext TreeBitstreamText_3c4f2
.asm_a1adf:
	jp .asm_a1ae8
.asm_a1ae2:
	writetext TreeBitstreamText_3c4ab
.asm_a1ae8:
	jp .asm_a1af1
.asm_a1aeb:
	writetext TreeBitstreamText_3c46d
.asm_a1af1:
	ret

Data_a1af2:
	dstr "(くﾞんしﾞん)"

Data_a1afb:
	db $00, $00, $00, $01, $00, $c5, $ba, $00, $00
	db $10, $01, $10, $04, $19, $1f, $1e, $18, $02, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c

Func_a1b24:
	ld a, e
	or a
	jp nz, .asm_a1bd4
	face_player $05
	checkevent EVENT_03B
	cp $01
	jp nz, .asm_a1bce
	checkevent EVENT_042
	or a
	jp nz, .asm_a1bc5
	checkevent EVENT_041
	or a
	jp nz, .asm_a1bbc
	writetext_yesorno TreeBitstreamText_3c61c
	or a
	jp nz, .asm_a1bb3
	writetext TreeBitstreamText_3c65d
	writetext TreeBitstreamText_47192
.asm_a1b63:
	ld de, Data_a1bd5
	ld hl, Data_a1afb
	scall Func_8039e
	or a
	jp nz, .asm_a1b7b
	ld a, [wc7c4]
	cp $01
	jp nz, .asm_a1b63
	jp .asm_a1bd4
.asm_a1b7b:
	writetext TreeBitstreamText_3c677
	playsfx SFX_2A
	writetext TreeBitstreamText_3c6be
	writetext TreeBitstreamText_3c6ec
	setevent EVENT_041
	setevent EVENT_042
	ld c, $00
	ld e, $01
	ld a, $1f
	scall Func_80d4d
	ld a, $05
	ld [wc78f], a
	jp .asm_a1bb9
.asm_a1bb3:
	writetext TreeBitstreamText_3c66a
.asm_a1bb9:
	jp .asm_a1bc2
.asm_a1bbc:
	writetext TreeBitstreamText_3c4f2
.asm_a1bc2:
	jp .asm_a1bcb
.asm_a1bc5:
	writetext TreeBitstreamText_3c4ab
.asm_a1bcb:
	jp .asm_a1bd4
.asm_a1bce:
	writetext TreeBitstreamText_3c46d
.asm_a1bd4:
	ret

Data_a1bd5:
	dstr "(くﾞんしﾞん)"

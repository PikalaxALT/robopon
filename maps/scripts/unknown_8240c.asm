Data_823ba: ; 823ba
	warpdef  9,  2, 1, 1, MAP_00_04,  8,  2,  8,  3, $2e
	warpdef  1,  8, 2, 1, MAP_00_00,  9, 14,  9, 15, $34

Pointers_823d0: ; 823d0
	dtext_tree_pointer TreeBitstreamText_46ea4
	dw -1

Data_823d4: ; 823d4
	person_event $21, $04,  7,  5,  1,  1, $02, $04, $00, 0, Func_82446, 0
	person_event $ff, $00,  7,  1,  1,  1, $00, $04, $00, 0, PrintTextFacePlayer_20, Pointers_823d0
	person_event $ff, $00,  8,  1,  1,  1, $00, $04, $00, 0, PrintTextFacePlayer_20, Pointers_823d0
	person_event $00, $0c,  8,  5,  1,  1, $00, $04, $00, 0, PrintTextFacePlayer_20, Pointers_823d0

Func_8240c:
	loadwarps $2, Data_823ba
	ld a, [wc790]
	cp $4
	jp z, Func_8242b
	loadpeople $4, Data_823d4
	ld e, $0
	ld a, $3
	call SetPersonVisibilityState_20
Func_8242b: ; 8242b (20:642b)
	playmusic SONG_TOWN3
	call Func_8001c_20
	ret

Data_82434:
	db  8,  6
	db  7,  6
	db -1, -1

Data_8243a: ; 8243a
	db  6,  6
	db  7,  6
	db -1, -1

Data_82440: ; 82440
	db  8,  6
	db  7,  6
	db -1, -1

Func_82446:
	ld a, e
	or a
	jp nz, Func_82592
	checkevent $c6
	or a
	jp nz, Func_82562
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_82464
	or a
	jp nz, Func_82478
	jp Func_82489

Func_82464: ; 82464 (20:6464)
	applymovementdata $1, Data_8243a
	call Func_8020c_20
	xor a
	call PlayerFace_20
	jp Func_82489

Func_82478: ; 82478 (20:6478)
	applymovementdata $1, Data_82434
	call Func_8020c_20
	xor a
	call PlayerFace_20
Func_82489: ; 82489 (20:6489)
	call GetZodiacSign_20
	cp PISCES
	jp z, Func_824c3
	cp SCORPIO
	jp z, Func_824c3
	cp CANCER
	jp z, Func_824c3
	cp AQUARIUS
	jp z, Func_824be
	cp LIBRA
	jp z, Func_824be
	cp GEMINI
	jp z, Func_824be
	cp CAPRICORN
	jp z, Func_824b9
	cp VIRGO
	jp z, Func_824b9
	cp TAURUS
	jp nz, Func_824c8
Func_824b9: ; 824b9 (20:64b9)
IF DEF(SUN)
	ld a, ROBBY + 1
ENDC
IF DEF(STAR)
	ld a, Q_ + 1
ENDC
	jp Func_824ca

Func_824be: ; 824be (20:64be)
IF DEF(SUN)
	ld a, BELLA + 1
ENDC
IF DEF(STAR)
	ld a, VIC + 1
ENDC
	jp Func_824ca

Func_824c3: ; 824c3 (20:64c3)
IF DEF(SUN)
	ld a, HEYLOW + 1
ENDC
IF DEF(STAR)
	ld a, RALPH + 1
ENDC
	jp Func_824ca

Func_824c8: ; 824c8 (20:64c8)
IF DEF(SUN)
	ld a, VIGGY + 1
ENDC
IF DEF(STAR)
	ld a, CHECKS + 1
ENDC
Func_824ca: ; 824ca (20:64ca)
	push af
	call Func_800b8_20
	ld e, a
	ld a, $3
	call ChangeSprite_20
	writenpctext TreeBitstreamText_3f60f
	script_sleep $1e
	ld e, $1
	ld a, $3
	call SetPersonVisibilityState_20
	sprite_face $3, $3
	sprite_face $0, $3
	sprite_face $1, $3
	sprite_face $2, $3
	sprite_face $3, $3
	sprite_face $0, $3
	sprite_face $1, $3
	sprite_face $2, $3
	script_sleep $1e
	ld bc, Data_82440
	ld e, BANK(Data_82440)
	ld a, $3
	call Func_80688_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call SetPersonVisibilityState_20
	playsfx $2a
	writetext TreeBitstreamText_3f665
	pop af
	ld e, $0
	ld c, $5
	call GiveRobot_20
	cp $ff
	jp nz, Func_82551
Func_82551: ; 82551 (20:6551)
	writenpctext TreeBitstreamText_3f679
	setevent $c6
	jp Func_82592

Func_82562: ; 82562 (20:6562)
	face_player 0
	heal
	playmusic SONG_NONE
	playmusic SONG_HEAL
	loademote $1, $2, $8
	call Func_801d5_20
	call Func_8018b_20
	writetext TreeBitstreamText_46e0b
	writenpctext TreeBitstreamText_3f5d5
	playmusic SONG_TOWN3
Func_82592: ; 82592 (20:6592)
	ret

Data_8271c:
	warpdef $06, $0e, $02, $01, MAP_00_00, $10, $0c, $10, $0d, SFX_2E
	warpdef $03, $01, $01, $01, MAP_00_31, $01, $08, $01, $07, SFX_34
	warpdef $09, $01, $01, $01, MAP_32_05, $06, $0b, $06, $0a, SFX_34
	warpdef $0c, $01, $01, $01, MAP_00_30, $08, $01, $08, $02, SFX_2E
	warpdef $0d, $01, $01, $01, MAP_00_11, $09, $01, $09, $02, SFX_2E
	warpdef $0e, $01, $01, $01, MAP_32_09, $01, $06, $01, $05, SFX_34

Data_8275e: ; 8275e
	db $5f, $0b, $03, $13, $0a

Data_82763: ; 82763
	person_event $ff, $00, $09, $03, $01, $01, $00, $04, $01, Func_828df, NULL
	person_event $24, $0c, $06, $0c, $01, $01, $00, $04, $00, NULL, NULL
	person_event $2d, $0c, $07, $02, $01, $02, $02, $04, $00, Func_8298c, NULL
	person_event $08, $04, $01, $06, $01, $01, $02, $04, $00, Func_829fd, NULL

Data_8279b: ; 8279b
	person_event $1a, $04, $02, $02, $01, $01, $01, $04, $00, Func_8299b, NULL

Func_827a9::
	set_frame_script Func_82866
	ld a, $1
	ld [wc7de], a
	loadwarps $6, Data_8271c
	ld e, $1
	ld hl, Data_8275e
	scall Func_80ce7
	ld a, [wc793]
	or a
	jp z, .asm_827de
	ld a, [wc793]
	cp $2
	jp z, .asm_827de
	ld a, [wc793]
	cp $3
	jp nz, .asm_8283f
.asm_827de ; 827de (20:67de)
	loadpeople $4, Data_82763
	playmusic SONG_SHOP
	ld a, [wBackupMapGroup]
	cp $20
	jp nz, .asm_82811
	ld a, [wBackupMapNumber]
	cp $5
	jp nz, .asm_82811
	hideperson $1
	scall Func_8001c
	landmarksign TreeBitstreamText_46ce3
	call Func_829dd
	jp .asm_8283c

.asm_82811 ; 82811 (20:6811)
	checkevent EVENT_00D
	or a
	jp nz, .asm_8282c
	scall Func_8001c
	call Func_82894
	setevent EVENT_00D
	jp .asm_8283c

.asm_8282c ; 8282c (20:682c)
	hideperson $1
	scall Func_8001c
	landmarksign TreeBitstreamText_46ce3
.asm_8283c ; 8283c (20:683c)
	jp .asm_82859

.asm_8283f ; 8283f (20:683f)
	loadpeople $4, Data_82763
	loadpeople $1, Data_8279b
	hideperson $1
	scall Func_8001c
.asm_82859 ; 82859 (20:6859)
	ret

Data_8285a:
	db $08, $01, $01, $01, $0d, $01

Data_82860: ; 82860
	db $08, $01, $01, $01, $0e, $01

Func_82866: ; 82866 (20:6866)
	ld a, [wc78c]
	cp $2
	jp nc, .asm_82874
	ld hl, Data_8285a
	scall Func_80d9b
.asm_82874 ; 82874 (20:6874)
	ld a, [wc78c]
	cp $5
	jp nc, .asm_82882
	ld hl, Data_82860
	scall Func_80d9b
.asm_82882 ; 82882 (20:6882)
	scall Func_80f02
	ret

Data_82886:
	db $06, $04, $ff, $ff

Data_8288a: ; 8288a
	db $06, $05, $07, $04, $ff, $ff

Data_82890: ; 82890
	db $03, $01, $ff, $ff

Func_82894: ; 82894 (20:6894)
	move_person $1, Data_82886, 0
	move_player $1, Data_8288a
	scall WaitNPCStep
	writenpctext TreeBitstreamText_39235
	writenpctext TreeBitstreamText_39257
	move_person $1, Data_82890, 0
	move_player $3, Data_82890
	scall WaitNPCStep
	ret

Data_828cf:
	db $09, $02, $ff, $ff

Data_828d3: ; 828d3
	db $07, $02, $ff, $ff

Data_828d7: ; 828d7
	db $09, $04, $ff, $ff

Data_828db: ; 828db
	db $09, $01, $ff, $ff

Func_828df:
	ld a, e
	cp $2
	jp nz, .asm_8298b
	move_person $2, Data_828cf, 1
	scall WaitNPCStep
	sprite_face $2, $2
	checkevent EVENT_032
	cp $1
	jp nz, .asm_82967
	writenpctext_yesorno TreeBitstreamText_45e91
	or a
	jp nz, .asm_82940
	writenpctext TreeBitstreamText_45eaa
	move_person $2, Data_828d3, 1
	scall WaitNPCStep
	sprite_face $2, $2
	move_player $1, Data_828db
	scall WaitNPCStep
	resetevent EVENT_0F8
	jp .asm_82964

.asm_82940 ; 82940 (20:6940)
	writenpctext TreeBitstreamText_45ebc
	move_player $1, Data_828d7
	move_person $2, Data_828d3, 1
	scall WaitNPCStep
	sprite_face $2, $2
.asm_82964 ; 82964 (20:6964)
	jp .asm_8298b

.asm_82967 ; 82967 (20:6967)
	writenpctext TreeBitstreamText_45ed5
	move_player $1, Data_828d7
	move_person $2, Data_828d3, 1
	scall WaitNPCStep
	sprite_face $2, $2
.asm_8298b ; 8298b (20:698b)
	ret

Func_8298c:
	ld a, e
	or a
	jp nz, .asm_8299a
	writenpctext TreeBitstreamText_45e48
	scall Func_8045c
.asm_8299a ; 8299a (20:699a)
	ret

Func_8299b:
	ld a, e
	or a
	jp nz, .asm_829d0
	face_player $5
	ld a, [wc78c]
	inc a
	ld [wc78c], a
	ld a, [wc78c]
	cp $15
	jp nz, .asm_829b9
	ld a, $1
	ld [wc78c], a
.asm_829b9 ; 829b9 (20:69b9)
	set_farcall_addrs_hli Func_bd6fa
	ld a, [wc78c]
	ld e, a
	ld d, $0
	ld hl, Data_829d1
	call FarCall
.asm_829d0 ; 829d0 (20:69d0)
	ret

Data_829d1:
	db $66, $6c, $61, $67, $20, $25, $64, $00

Data_829d9: ; 829d9
	db $09, $04, $ff, $ff

Func_829dd: ; 829dd (20:69dd)
	checkevent EVENT_0F8
	or a
	jp nz, .asm_829fc
	move_player $1, Data_829d9
	scall WaitNPCStep
	setevent EVENT_0F8
.asm_829fc
	ret

Func_829fd:
	push af
	ld a, e
	or a
	jp nz, .asm_82ab6
	face_player -1
	checkevent EVENT_114
	or a
	jp nz, .asm_82ab0
	ld a, $10
	scall Func_80e5d
	or a
	jp z, .asm_82a9b
	writetext_yesorno TreeBitstreamText_45f28
	or a
	jp nz, .asm_82a92
	playsfx SFX_2B
	ld c, $1
	ld e, $1
	ld a, $10
	scall Func_80d4d
	ld a, [wc79c]
	or a
	jp nz, .asm_82a43
	ld a, $2
	ld [wc79c], a
	jp .asm_82a59

.asm_82a43 ; 82a43 (20:6a43)
	ld a, [wc79c]
	or a
	jp nz, .asm_82a52
	ld a, $2
	ld [wc79c], a
	jp .asm_82a59

.asm_82a52 ; 82a52 (20:6a52)
	ld a, [wc79c]
	inc a
	ld [wc79c], a
.asm_82a59 ; 82a59 (20:6a59)
	writetext TreeBitstreamText_45f3d
	ld a, [wc79c]
	cp $9
	jp c, .asm_82a8f
	writetext TreeBitstreamText_45f56
	playsfx SFX_2A
	writetext TreeBitstreamText_45f88
	ld c, $0
	ld e, $1
	ld a, $18
	scall Func_80d4d
	setevent EVENT_114
	writetext TreeBitstreamText_45f98
.asm_82a8f ; 82a8f (20:6a8f)
	jp .asm_82a98

.asm_82a92 ; 82a92 (20:6a92)
	writetext TreeBitstreamText_45f1d
.asm_82a98 ; 82a98 (20:6a98)
	jp .asm_82aad

.asm_82a9b ; 82a9b (20:6a9b)
	writetext TreeBitstreamText_45ee8
	ld a, [wc79c]
	or a
	jp nz, .asm_82aad
	ld a, $1
	ld [wc79c], a
.asm_82aad ; 82aad (20:6aad)
	jp .asm_82ab6

.asm_82ab0 ; 82ab0 (20:6ab0)
	writetext TreeBitstreamText_45fd7
.asm_82ab6 ; 82ab6 (20:6ab6)
	pop bc
	ret


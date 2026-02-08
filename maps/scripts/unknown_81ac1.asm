Data_81a66:
	warpdef $07, $02, $01, $01, MAP_00_02, $07, $02, $07, $03, $2e
	warpdef $01, $07, $02, $01, MAP_00_00, $11, $14, $11, $15, $34

Data_81a7c:
	db $29, $03, $ff, $ff, $2a, $03, $ff, $ff

Data_81a84: ; 81a84
	db $25, $0c, $04, $03, $01, $01, $02, $04, $00, $20, $00, $00, $00, $00, $00, $0c, $03, $03, $01, $01, $02, $04, $00, $20, $00, $00, $00, $00, $ff, $00, $00, $01, $01, $01, $00, $04, $00, $20, $5f, $48, $7c, $5a, $ff, $00, $01, $01, $01, $01, $00, $04, $00, $20, $5f, $48, $80, $5a

Data_81abc: ; 81abc
	db $5e, $01, $02, $11, $4c

Func_81ac1:
	loadwarps $2, Data_81a66
	ld e, $1
	ld hl, Data_81abc
	call Func_80ce7_20
	ld a, [wc793]
	or a
	jp z, Func_81ae8
	ld a, [wc793]
	cp $2
	jp z, Func_81ae8
	ld a, [wc793]
	cp $3
	jp nz, Func_81b20
Func_81ae8: ; 81ae8 (20:5ae8)
	checkevent $b
	or a
	jp nz, Func_81b15
	loadpeople $4, Data_81a84
	ld a, $2
	call PlayerFace_20
	playmusic SONG_TOWN3
	call FadeInMap_20
	call Func_81b45
	setevent $b
	jp Func_81b1d

Func_81b15: ; 81b15 (20:5b15)
	playmusic SONG_TOWN3
	call FadeInMap_20
Func_81b1d: ; 81b1d (20:5b1d)
	jp Func_81b28

Func_81b20: ; 81b20 (20:5b20)
	playmusic SONG_TOWN3
	call FadeInMap_20
Func_81b28: ; 81b28 (20:5b28)
	ret

Data_81b29:
	db $05, $03, $ff, $ff

Data_81b2d: ; 81b2d
	db $02, $03, $ff, $ff

Data_81b31: ; 81b31
	db $02, $07, $ff, $ff

Data_81b35: ; 81b35
	db $03, $03, $ff, $ff

Data_81b39: ; 81b39
	db $03, $02, $ff, $ff

Data_81b3d: ; 81b3d
	db $03, $03, $02, $03, $02, $07, $ff, $ff

Func_81b45: ; 81b45 (20:5b45)
	ld a, $3
	call PlayerFace_20
	script_sleep $1e
	ld e, $1 ; freeze player
	ld a, FACE_LEFT
	call PlayerStep_20
	ld e, $1
	ld a, FACE_LEFT
	call PlayerStep_20
	script_sleep $1e
	ld bc, Data_81b29
	ld e, BANK(Data_81b29)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	writenpctext TreeBitstreamText_38fc9
	sprite_face $1, $1
	writenpctext TreeBitstreamText_38fe6
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	ld a, $1
	call Func_80688_20
	call WaitNPCStep_20
	ld e, $3
	xor a
	call SpriteFace_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	ld a, $1
	call Func_80688_20
	call WaitNPCStep_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld a, $2
	call PlayerFace_20
	ld e, $0
	ld a, $1
	call SetPersonVisibilityState_20
	playsfx $34
	script_sleep $3c
	ld e, $1
	xor a
	call SpriteFace_20
	script_sleep $1e
	ld a, $3
	call PlayerFace_20
	writenpctext TreeBitstreamText_3902d
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	playsfx $34
	script_sleep $1e
	ld a, $2
	call PlayerFace_20
	script_sleep $1e
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SetPersonVisibilityState_20
	playsfx $34
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	xor a
	call Func_80688_20
	call WaitNPCStep_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld a, $3
	call PlayerFace_20
	writenpctext TreeBitstreamText_39084
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	playsfx $34
	script_sleep $1e
	; scroll screen 32 pixels right, leaving player frozen
	ld e, $1
	ld a, FACE_RIGHT
	call PlayerStep_20
	ld e, $1
	ld a, FACE_RIGHT
	call PlayerStep_20
	script_sleep $1e
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	move_player $1, Data_81b35
	call WaitNPCStep_20
	ld a, $2
	call PlayerFace_20
	writenpctext TreeBitstreamText_390b4
	script_sleep $1e
	move_player $1, Data_81b39
	call WaitNPCStep_20
	writetext TreeBitstreamText_390d1
	move_player $1, Data_81b3d
	call WaitNPCStep_20
	ld a, $1
	call FadeInAudio_20
	ret

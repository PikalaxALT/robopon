Data_81a66:
	dr $81a66, $81a84

Data_81a84: ; 81a84
	dr $81a84, $81abc

Data_81abc: ; 81abc
	dr $81abc, $81ac1

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
	call Func_8001c_20
	call Func_81b45
	setevent $b
	jp Func_81b1d

Func_81b15: ; 81b15 (20:5b15)
	playmusic SONG_TOWN3
	call Func_8001c_20
Func_81b1d: ; 81b1d (20:5b1d)
	jp Func_81b28

Func_81b20: ; 81b20 (20:5b20)
	playmusic SONG_TOWN3
	call Func_8001c_20
Func_81b28: ; 81b28 (20:5b28)
	ret

Data_81b29:
	dr $81b29, $81b2d

Data_81b2d: ; 81b2d
	dr $81b2d, $81b31

Data_81b31: ; 81b31
	dr $81b31, $81b35

Data_81b35: ; 81b35
	dr $81b35, $81b39

Data_81b39: ; 81b39
	dr $81b39, $81b3d

Data_81b3d: ; 81b3d
	dr $81b3d, $81b45

Func_81b45: ; 81b45 (20:5b45)
	ld a, $3
	call PlayerFace_20
	script_sleep $1e
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	ld e, $1
	ld a, $3
	call Func_80e1e_20
	script_sleep $1e
	ld bc, Data_81b29
	ld e, BANK(Data_81b29)
	xor a
	call Func_80688_20
	call Func_8020c_20
	writenpctext TreeBitstreamText_38fc9
	sprite_face $1, $1
	writenpctext TreeBitstreamText_38fe6
	ld bc, Data_81b2d
	ld e, BANK(Data_81b2d)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
	ld e, $3
	xor a
	call SpriteFace_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	ld a, $1
	call Func_80688_20
	call Func_8020c_20
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
	call Func_8020c_20
	ld bc, Data_81b31
	ld e, BANK(Data_81b31)
	xor a
	call Func_80688_20
	call Func_8020c_20
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
	call Func_8020c_20
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
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	ld e, $1
	ld a, $1
	call Func_80e1e_20
	script_sleep $1e
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	move_player $1, Data_81b35
	call Func_8020c_20
	ld a, $2
	call PlayerFace_20
	writenpctext TreeBitstreamText_390b4
	script_sleep $1e
	move_player $1, Data_81b39
	call Func_8020c_20
	writetext TreeBitstreamText_390d1
	move_player $1, Data_81b3d
	call Func_8020c_20
	ld a, $1
	call FadeInAudio_20
	ret

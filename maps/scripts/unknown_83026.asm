Func_83026:
	ld a, e
	or a
	jp nz, Func_83119
	checkevent $d7
	or a
	jp nz, Func_83113
	playsfx $5e
	loademote $2, $2, $8
	ld e, $2
	ld a, $3
	call ShowEmote_20
	call Func_801d5_20
	call Func_8018b_20
	playsfx $28
	ld e, $1
	xor a
	call SetPersonVisibilityState_20
	playsfx $60
	ld e, $3
	xor a
	call SpriteFace_20
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld e, $3
	xor a
	call SpriteFace_20
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_WORLD_MAP
	face_player 0
	script_sleep $1e
	ld c, $c
	ld e, $17
	ld a, $15
	call Func_80e8d_20
	setevent $d7
	playsfx $60
	ld e, $3
	xor a
	call SpriteFace_20
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld e, $3
	xor a
	call SpriteFace_20
	ld e, $0
	xor a
	call SpriteFace_20
	ld e, $1
	xor a
	call SpriteFace_20
	ld e, $2
	xor a
	call SpriteFace_20
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_TOWN3
	face_player 0
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	jp Func_83119

Func_83113: ; 83113 (20:7113)
	writetext TreeBitstreamText_3f79e
Func_83119: ; 83119 (20:7119)
	ret

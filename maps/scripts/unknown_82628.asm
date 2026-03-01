Func_82628:
	ld a, e
	or a
	jp nz, Func_8271b
	checkevent $d5
	or a
	jp nz, Func_82715
	playsfx $5e
	loademote $2, $2, $8
	ld e, $2
	ld a, $4
	call MoveEmote_20
	call WaitEmote_20
	call HideEmote_20
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
	ld c, $b
	ld e, $a
	ld a, $9
	scall Func_80e8d
	setevent $d5
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
	face_player 0
	ld a, $f
	call FadeOutAudio_20
	playmusic SONG_NONE
	ld a, $1
	call FadeInAudio_20
	playmusic SONG_TOWN3
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
	jp Func_8271b

Func_82715: ; 82715 (20:6715)
	writetext TreeBitstreamText_3f79e
Func_8271b: ; 8271b (20:671b)
	ret


Func_83026:
	ld a, e
	or a
	jp nz, Func_83119
	ld hl, $d7
	call CheckEventFlag_20
	or a
	jp nz, Func_83113
	ld a, $5e
	call PlaySFX_20
	ld c, $2
	ld e, $2
	ld a, $8
	call Func_80176_20
	ld e, $2
	ld a, $3
	call Func_801e4_20
	call Func_801d5_20
	call Func_8018b_20
	ld a, $28
	call PlaySFX_20
	ld e, $1
	xor a
	call Func_8013d_20
	ld a, $60
	call PlaySFX_20
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
	xor a
	call PlayMusic_20
	ld a, $1
	call FadeInAudio_20
	ld a, $14
	call PlayMusic_20
	xor a
	call Func_8044b_20
	ld hl, $1e
	call ScriptSleep_20
	ld c, $c
	ld e, $17
	ld a, $15
	call Func_80e8d_20
	ld e, $1
	ld hl, $d7
	call EventFlagAction_20
	ld a, $60
	call PlaySFX_20
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
	xor a
	call PlayMusic_20
	ld a, $1
	call FadeInAudio_20
	ld a, $11
	call PlayMusic_20
	xor a
	call Func_8044b_20
	ld e, $0
	xor a
	call Func_8013d_20
	jp Func_83119

Func_83113: ; 83113 (20:7113)
	ld hl, $15c
	call PrintTextStandard_20
Func_83119: ; 83119 (20:7119)
	ret

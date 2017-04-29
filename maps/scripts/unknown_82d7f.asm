Data_82d42:
	dr $82d42, $82d63

Data_82d63: ; 82d63
	dr $82d63, $82d7f

Func_82d7f:
	call Func_82e00
	ld hl, Func_82e00
	call Func_80f11_20
	ld a, $4
	ld [wc7de], a
	loadwarps $3, Data_82d42
	loadpeople $2, Data_82d63
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c1f
	ret

Func_82dac:
	push af
	ld a, e
	or a
	jp nz, Func_82dce
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	writenpctext TreeBitstreamText_470a2
	playmusic SONG_CENTER
	ld e, $3
	xor a
	call Func_806a0_20
	playmusic SONG_SHOP
Func_82dce: ; 82dce (20:6dce)
	pop bc
	ret

Func_82dd0:
	push af
	ld a, e
	or a
	jp nz, Func_82df2
	ld hl, sp+$1
	ld a, [hl]
	call FacePlayer_20
	writenpctext TreeBitstreamText_470a2
	playmusic SONG_CENTER
	ld e, $4
	xor a
	call Func_806a0_20
	playmusic SONG_SHOP
Func_82df2: ; 82df2 (20:6df2)
	pop bc
	ret

Data_82df4:
	dr $82df4, $82dfa

Data_82dfa: ; 82dfa
	dr $82dfa, $82e00

Func_82e00: ; 82e00 (20:6e00)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82e0e
	ld hl, Data_82df4
	call Func_80d9b_20
Func_82e0e: ; 82e0e (20:6e0e)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82e1c
	ld hl, Data_82dfa
	call Func_80d9b_20
Func_82e1c: ; 82e1c (20:6e1c)
	call Func_80f02_20
	ret

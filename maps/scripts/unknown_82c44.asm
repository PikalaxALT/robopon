Data_82bc1:
	db $08, $01, $01, $01, $00, $0b, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $0d, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_82be2: ; 82be2
	db $10, $04, $03, $03, $01, $02, $02, $04, $00, $20, $91, $6c, $00, $00, $15, $04, $04, $03, $01, $02, $02, $04, $00, $20, $c9, $6c, $00, $00

Data_82bfe: ; 82bfe
	db $10, $04, $01, $03, $01, $02, $02, $04, $00, $20, $91, $6c, $00, $00, $15, $04, $06, $03, $01, $02, $02, $04, $00, $20, $c9, $6c, $00, $00, $ff, $04, $07, $03, $01, $01, $00, $04, $00, $20, $c9, $6c, $00, $00

Data_82c28: ; 82c28
	db $15, $04, $00, $06, $01, $01, $01, $04, $00, $20, $c9, $6c, $00, $00, $10, $04, $00, $05, $01, $01, $01, $04, $00, $20, $91, $6c, $00, $00

Func_82c44:
	call Func_82d22
	ld hl, Func_82d22
	call Func_80f11_20
	ld a, $3
	ld [wc7de], a
	loadwarps $3, Data_82bc1
	loadpeople $2, Data_82be2
	ld a, [wc78c]
	cp $a
	jp c, Func_82c72
	loadpeople $3, Data_82bfe
Func_82c72: ; 82c72 (20:6c72)
	ld a, [wc78c]
	cp $f
	jp c, Func_82c82
	loadpeople $2, Data_82c28
Func_82c82: ; 82c82 (20:6c82)
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c14
	ret

Func_82c91:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $2
	jp z, Func_82ca3
	or a
	jp nz, Func_82ca8
	ld l, $a
	jp Func_82caa

Func_82ca3: ; 82ca3 (20:6ca3)
	ld l, $b
	jp Func_82caa

Func_82ca8: ; 82ca8 (20:6ca8)
	ld l, $c
Func_82caa: ; 82caa (20:6caa)
	ld a, e
	or a
	jp nz, Func_82cc7
	push hl
	ld hl, sp+$3
	ld a, [hl]
	call FacePlayer_20
	playmusic SONG_CENTER
	pop hl
	ld a, l
	ld e, $2
	call Func_806a0_20
	playmusic SONG_SHOP
Func_82cc7: ; 82cc7 (20:6cc7)
	pop bc
	ret

Func_82cc9:
	push af
	ld hl, sp+$1
	ld a, [hl]
	cp $4
	jp z, Func_82ce1
	cp $3
	jp z, Func_82ce1
	cp $1
	jp nz, Func_82ce6
	ld l, $a
	jp Func_82ce8

Func_82ce1: ; 82ce1 (20:6ce1)
	ld l, $b
	jp Func_82ce8

Func_82ce6: ; 82ce6 (20:6ce6)
	ld l, $c
Func_82ce8: ; 82ce8 (20:6ce8)
	ld a, e
	or a
	jp nz, Func_82d14
	push hl
	ld hl, sp+$3
	ld a, [hl]
	cp $4
	jp nz, Func_82cfd
	ld hl, sp+$3
	ld a, [hl]
	dec a
	ld hl, sp+$3
	ld [hl], a
Func_82cfd: ; 82cfd (20:6cfd)
	ld hl, sp+$3
	ld a, [hl]
	call FacePlayer_20
	playmusic SONG_CENTER
	pop hl
	ld a, l
	ld e, $1
	call Func_806a0_20
	playmusic SONG_SHOP
Func_82d14: ; 82d14 (20:6d14)
	pop bc
	ret

Data_82d16:
	db $07, $01, $01, $01, $09, $01

Data_82d1c: ; 82d1c
	db $07, $01, $01, $01, $0a, $01

Func_82d22: ; 82d22 (20:6d22)
	ld a, [wc78c]
	cp $4
	jp nc, Func_82d30
	ld hl, Data_82d16
	call Func_80d9b_20
Func_82d30: ; 82d30 (20:6d30)
	ld a, [wc78c]
	cp $5
	jp nc, Func_82d3e
	ld hl, Data_82d1c
	call Func_80d9b_20
Func_82d3e: ; 82d3e (20:6d3e)
	call Func_80f02_20
	ret

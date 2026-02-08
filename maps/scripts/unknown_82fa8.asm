
Data_82f61:
	db $08, $01, $01, $01, $00, $0f, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $11, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e

Data_82f82: ; 82f82
	db $62, $06, $03, $11, $30, $63, $02, $03, $11, $30

Data_82f8c: ; 82f8c
	db $0f, $04, $03, $02, $01, $01, $02, $04, $00, $20, $00, $00, $00, $00, $ff, $00, $03, $02, $01, $01, $02, $04, $00, $20, $26, $70, $00, $00

Func_82fa8:
	call Func_83006
	ld hl, Func_83006
	call Func_80f11_20
	ld a, $7
	ld [wc7de], a
	loadwarps $3, Data_82f61
	ld e, $2
	ld hl, Data_82f82
	call Func_80ce7_20
	playmusic SONG_TOWN3
	ld a, [wc793]
	or a
	jp z, Func_82fe2
	ld a, [wc793]
	cp $1
	jp z, Func_82fe2
	ld a, [wc793]
	cp $2
	jp nz, Func_82ff0
Func_82fe2: ; 82fe2 (20:6fe2)
	loadpeople $2, Data_82f8c
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
Func_82ff0: ; 82ff0 (20:6ff0)
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c3b
	ret

Data_82ffa:
	db $07, $01, $01, $01, $09, $01

Data_83000: ; 83000
	db $07, $01, $01, $01, $0a, $01

Func_83006: ; 83006 (20:7006)
	ld a, [wc78c]
	cp $8
	jp nc, Func_83014
	ld hl, Data_82ffa
	call Func_80d9b_20
Func_83014: ; 83014 (20:7014)
	ld a, [wc78c]
	cp $5
	jp nc, Func_83022
	ld hl, Data_83000
	call Func_80d9b_20
Func_83022: ; 83022 (20:7022)
	call Func_80f02_20
	ret

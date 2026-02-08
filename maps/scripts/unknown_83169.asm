Data_8311a:
	db $08, $01, $01, $01, $00, $12, $08, $01, $08, $02, $2e, $09, $01, $01, $01, $00, $10, $09, $01, $09, $02, $2e, $0a, $01, $01, $01, $20, $09, $01, $06, $01, $05, $2e, $95, $04, $ff, $ff

Data_8313f: ; 8313f
	db $12, $04, $02, $02, $01, $02, $02, $04, $00, $20, $c2, $71, $00, $00, $16, $04, $05, $02, $01, $02, $02, $04, $00, $20, $d3, $71, $00, $00, $00, $04, $06, $02, $01, $02, $02, $04, $00, $20, $5f, $48, $3b, $71

Func_83169:
	call Func_831a2
	ld hl, Func_831a2
	call Func_80f11_20
	ld a, $8
	ld [wc7de], a
	loadwarps $3, Data_8311a
	loadpeople $3, Data_8313f
	playmusic SONG_SHOP
	call FadeInMap_20
	landmarksign TreeBitstreamText_46c44
	ret

Data_83196:
	db $07, $01, $01, $01, $08, $01

Data_8319c: ; 8319c
	db $07, $01, $01, $01, $0a, $01

Func_831a2: ; 831a2 (20:71a2)
	ld a, [wc78c]
	cp $9
	jp nc, Func_831b0
	ld hl, Data_83196
	call Func_80d9b_20
Func_831b0: ; 831b0 (20:71b0)
	ld a, [wc78c]
	cp $5
	jp nc, Func_831be
	ld hl, Data_8319c
	call Func_80d9b_20
Func_831be: ; 831be (20:71be)
	call Func_80f02_20
	ret

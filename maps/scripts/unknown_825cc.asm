Data_82593:
	db $08, $02, $01, $01, $00, $03, $09, $02, $09, $03, $2e, $5b, $01, $ff, $ff

Data_825a2: ; 825a2
	db $0f, $04, $04, $02, $01, $01, $00, $04, $00, $20, $00, $00, $00, $00, $ff, $00, $04, $02, $01, $01, $00, $04, $00, $20, $28, $66, $00, $00

Data_825be: ; 825be
	db $22, $04, $03, $04, $01, $01, $01, $04, $00, $20, $fc, $48, $9e, $65

Func_825cc::
	loadwarps $1, Data_82593
	ld a, [wc793]
	or a
	jp z, Func_825eb
	ld a, [wc793]
	cp $1
	jp z, Func_825eb
.asm_825e3
	ld a, [wc793]
	cp $2
	jp nz, Func_825f9
Func_825eb: ; 825eb (20:65eb)
	loadpeople $2, Data_825a2
	ld e, $0
	xor a
	call SetPersonVisibilityState_20
Func_825f9: ; 825f9 (20:65f9)
	checkevent $2
	cp $1
	jp nz, Func_8261f
	checkevent $3
	cp $1
	jp nz, Func_8261f
	ld a, [wc790]
	cp $4
	jp z, Func_8261f
	loadpeople $1, Data_825be
Func_8261f: ; 8261f (20:661f)
	playmusic SONG_TOWN3
	scall FadeInMap
	ret

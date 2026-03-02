
Data_a3459:
	warpdef $0b, $0c, $01, $01, MAP_19_33, $0b, $11, $0a, $11, SFX_2E
	warpdef $0e, $0c, $01, $01, MAP_19_31, $0e, $0c, $0d, $0c, SFX_2E

Data_a346f:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3499:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a353b, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a359b, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a35fb, NULL

Data_a34c3:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a34d1:: ; a34d1
	loadwarps $02, Data_a3459
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_a346f
	playmusic SONG_CAVE
	checkevent EVENT_0CE
	or a
	jp z, .asm_a3509
	checkevent EVENT_0CF
	or a
	jp z, .asm_a3509
	checkevent EVENT_0D0
	or a
	jp nz, .asm_a3529
.asm_a3509
	resetevent EVENT_0CE
	resetevent EVENT_0CF
	resetevent EVENT_0D0
	loadpeople $03, Data_a3499
.asm_a3529
	loadpeople $01, Data_a34c3
	scall Func_8001c
	landmarksign TreeBitstreamText_4692e
	ret

Func_a353b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a355a
	cp $01
	jp nz, .asm_a3599
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3557
	ld a, $01
	ld [wc7c4], a
.asm_a3557
	jp .asm_a3599
.asm_a355a
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3599
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent EVENT_0CE
	checkevent EVENT_0CF
	cp $01
	jp nz, .asm_a3599
	checkevent EVENT_0D0
	cp $01
	jp nz, .asm_a3599
	setevent EVENT_0D3
.asm_a3599
	pop bc
	ret

Func_a359b:
	push af
	ld a, e
	cp $03
	jp z, .asm_a35ba
	cp $01
	jp nz, .asm_a35f9
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a35b7
	ld a, $01
	ld [wc7c4], a
.asm_a35b7
	jp .asm_a35f9
.asm_a35ba
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a35f9
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent EVENT_0CF
	checkevent EVENT_0CE
	cp $01
	jp nz, .asm_a35f9
	checkevent EVENT_0D0
	cp $01
	jp nz, .asm_a35f9
	setevent EVENT_0D3
.asm_a35f9
	pop bc
	ret

Func_a35fb:
	push af
	ld a, e
	cp $03
	jp z, .asm_a361a
	cp $01
	jp nz, .asm_a3659
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3617
	ld a, $01
	ld [wc7c4], a
.asm_a3617
	jp .asm_a3659
.asm_a361a
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3659
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent EVENT_0D0
	checkevent EVENT_0CE
	cp $01
	jp nz, .asm_a3659
	checkevent EVENT_0CF
	cp $01
	jp nz, .asm_a3659
	setevent EVENT_0D3
.asm_a3659
	pop bc
	ret

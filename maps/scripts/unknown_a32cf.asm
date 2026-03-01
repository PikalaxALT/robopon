
Data_a3257:
	warpdef $0b, $0c, $01, $01, MAP_19_30, $0b, $0c, $0a, $0c, SFX_2E
	warpdef $0e, $0c, $01, $01, MAP_19_32, $0e, $0c, $0d, $0c, SFX_2E

Data_a326d:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $13, $16, $77, $05, $06, $00, $03, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $13, $16, $77, $14, $14, $00, $0c, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $13, $16, $46, $1f, $17, $11, $0c, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3297:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3339, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3399, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a33f9, NULL

Data_a32c1:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a32cf:: ; a32cf
	loadwarps $02, Data_a3257
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_a326d
	playmusic $08
	checkevent $00cb
	or a
	jp z, .asm_a3307
	checkevent $00cc
	or a
	jp z, .asm_a3307
	checkevent $00cd
	or a
	jp nz, .asm_a3327
.asm_a3307:
	resetevent $00cb
	resetevent $00cc
	resetevent $00cd
	loadpeople $03, Data_a3297
.asm_a3327:
	loadpeople $01, Data_a32c1
	scall Func_8001c
	landmarksign TreeBitstreamText_46939
	ret
Func_a3339:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3358
	cp $01
	jp nz, .asm_a3397
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3355
	ld a, $01
	ld [wc7c4], a
.asm_a3355:
	jp .asm_a3397
.asm_a3358:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3397
	playsfx $2b
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00cb
	checkevent $00cc
	cp $01
	jp nz, .asm_a3397
	checkevent $00cd
	cp $01
	jp nz, .asm_a3397
	setevent $00d2
.asm_a3397:
	pop bc
	ret
Func_a3399:
	push af
	ld a, e
	cp $03
	jp z, .asm_a33b8
	cp $01
	jp nz, .asm_a33f7
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a33b5
	ld a, $01
	ld [wc7c4], a
.asm_a33b5:
	jp .asm_a33f7
.asm_a33b8:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a33f7
	playsfx $2b
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00cc
	checkevent $00cb
	cp $01
	jp nz, .asm_a33f7
	checkevent $00cd
	cp $01
	jp nz, .asm_a33f7
	setevent $00d2
.asm_a33f7:
	pop bc
	ret
Func_a33f9:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3418
	cp $01
	jp nz, .asm_a3457
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3415
	ld a, $01
	ld [wc7c4], a
.asm_a3415:
	jp .asm_a3457
.asm_a3418:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3457
	playsfx $2b
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00cd
	checkevent $00cb
	cp $01
	jp nz, .asm_a3457
	checkevent $00cc
	cp $01
	jp nz, .asm_a3457
	setevent $00d2
.asm_a3457:
	pop bc
	ret

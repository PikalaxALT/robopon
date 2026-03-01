
Data_a3060:
	warpdef $0b, $0c, $01, $01, MAP_19_31, $0b, $0c, $0a, $0c, SFX_2E

Data_a306b:
IF DEF(SUN)
	wildbot $00, $03, $0e, $0b, $5f, $14, $17, $77, $05, $06, $00, $04, $0a, $00
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $34, $14, $17, $18, $17, $05, $1e, $04, $08, $00
ELIF DEF(STAR)
	wildbot $00, $03, $0e, $0b, $50, $14, $17, $77, $14, $14, $00, $0e, $0a, $00
	wildbot $00, $03, $0e, $0b, $57, $14, $17, $46, $1f, $17, $11, $0e, $09, $00
	wildbot $00, $03, $0e, $0b, $26, $14, $17, $5b, $01, $01, $00, $04, $08, $00
ENDC

Data_a3095:
	person_event $1b, $04, $01, $06, $01, $01, $02, $04, $00, Func_a3137, NULL
	person_event $1b, $04, $04, $09, $01, $01, $02, $04, $00, Func_a3197, NULL
	person_event $1b, $04, $07, $06, $01, $01, $02, $04, $00, Func_a31f7, NULL

Data_a30bf:
	person_event $ff, $00, $04, $06, $01, $01, $00, $04, $01, NULL, NULL

Func_a30cd:: ; a30cd
	loadwarps $01, Data_a3060
	ld a, $03
	scall Func_80d01
	loadwilds $03, Data_a306b
	playmusic SONG_CAVE
	checkevent $00c8
	or a
	jp z, .asm_a3105
	checkevent $00c9
	or a
	jp z, .asm_a3105
	checkevent $00ca
	or a
	jp nz, .asm_a3125
.asm_a3105:
	resetevent $00c8
	resetevent $00c9
	resetevent $00ca
	loadpeople $03, Data_a3095
.asm_a3125:
	loadpeople $01, Data_a30bf
	scall Func_8001c
	landmarksign TreeBitstreamText_46944
	ret

Func_a3137:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3156
	cp $01
	jp nz, .asm_a3195
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3153
	ld a, $01
	ld [wc7c4], a
.asm_a3153:
	jp .asm_a3195
.asm_a3156:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3195
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00c8
	checkevent $00c9
	cp $01
	jp nz, .asm_a3195
	checkevent $00ca
	cp $01
	jp nz, .asm_a3195
	setevent $00d1
.asm_a3195:
	pop bc
	ret

Func_a3197:
	push af
	ld a, e
	cp $03
	jp z, .asm_a31b6
	cp $01
	jp nz, .asm_a31f5
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a31b3
	ld a, $01
	ld [wc7c4], a
.asm_a31b3:
	jp .asm_a31f5
.asm_a31b6:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a31f5
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00c9
	checkevent $00c8
	cp $01
	jp nz, .asm_a31f5
	checkevent $00ca
	cp $01
	jp nz, .asm_a31f5
	setevent $00d1
.asm_a31f5:
	pop bc
	ret

Func_a31f7:
	push af
	ld a, e
	cp $03
	jp z, .asm_a3216
	cp $01
	jp nz, .asm_a3255
	ld hl, sp+$01
	ld a, [hl]
	scall Func_80bde
	cp $01
	jp nz, .asm_a3213
	ld a, $01
	ld [wc7c4], a
.asm_a3213:
	jp .asm_a3255
.asm_a3216:
	ld e, $03
	ld hl, sp+$01
	ld a, [hl]
	scall CheckObjectsOccupyingSameTile
	or a
	jp z, .asm_a3255
	playsfx SFX_2B
	ld e, $00
	ld hl, sp+$01
	ld a, [hl]
	scall SetPersonVisibilityState
	setevent $00ca
	checkevent $00c8
	cp $01
	jp nz, .asm_a3255
	checkevent $00c9
	cp $01
	jp nz, .asm_a3255
	setevent $00d1
.asm_a3255:
	pop bc
	ret

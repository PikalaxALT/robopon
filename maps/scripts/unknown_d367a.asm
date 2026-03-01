
Data_d34b1: ; d34b1
	warpdef $01, $06, $02, $01, MAP_00_30, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_10, $0e, $01, $0e, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_11, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_12, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_13, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_14, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_15, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_16, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_17, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_18, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_19, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_20, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_21, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_22, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_23, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_24, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_25, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_26, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_27, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_00_28, $0a, $01, $0a, $02, SFX_34

Data_d358d: ; d358d
	warpdef $01, $06, $02, $01, MAP_00_29, $0a, $01, $0a, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_01, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_04, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_03, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_04, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_03, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_04, $0b, $01, $0b, $02, SFX_34
	warpdef $01, $06, $02, $01, MAP_02_02, $0b, $01, $0b, $02, SFX_34

Data_d35e5: ; d35e5
	warpdef $01, $06, $02, $01, MAP_30_06, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_10, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_09, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_05, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_11, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_12, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_07, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_13, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_04, $01, $02, $01, $03, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_14, $0c, $05, $0c, $06, SFX_34
	warpdef $01, $06, $02, $01, MAP_30_04, $07, $01, $07, $02, SFX_34

Data_d365e: ; d365e
	person_event $01, $04, $00, $02, $01, $01, $02, $04, $00, Func_d385b, NULL
	person_event $ff, $00, $00, $03, $01, $01, $00, $04, $00, Func_d385b, NULL

Func_d367a:: ; d367a (34:767a)
	ld a, [wBackupMapGroup]
	cp $1e
	jp nz, .asm_d37e8
	ld a, [wBackupMapNumber]
	cp $e
	jp z, .asm_d3718
	cp $d
	jp z, .asm_d3713
	cp $c
	jp z, .asm_d370e
	cp $b
	jp z, .asm_d36fc
	cp $a
	jp z, .asm_d36f7
	cp $9
	jp z, .asm_d36f2
	cp $7
	jp z, .asm_d36e0
	cp $6
	jp z, .asm_d36ce
	cp $5
	jp z, .asm_d36c9
	cp $4
	jp nz, .asm_d371a
	ld a, [wBackupMapX]
	cp $1
	jp nz, .asm_d36c4
	ld l, $0
	jp .asm_d36c6

.asm_d36c4: ; d36c4 (34:76c4)
	ld l, $9
.asm_d36c6: ; d36c6 (34:76c6)
	jp .asm_d371a

.asm_d36c9: ; d36c9 (34:76c9)
	ld l, $1
	jp .asm_d371a

.asm_d36ce: ; d36ce (34:76ce)
	ld a, [wBackupMapX]
	cp $7
	jp nz, .asm_d36db
	ld l, $2
	jp .asm_d36dd

.asm_d36db: ; d36db (34:76db)
	ld l, $3
.asm_d36dd: ; d36dd (34:76dd)
	jp .asm_d371a

.asm_d36e0: ; d36e0 (34:76e0)
	ld a, [wBackupMapX]
	cp $7
	jp nz, .asm_d36ed
	ld l, $4
	jp .asm_d36ef

.asm_d36ed: ; d36ed (34:76ed)
	ld l, $5
.asm_d36ef: ; d36ef (34:76ef)
	jp .asm_d371a

.asm_d36f2: ; d36f2 (34:76f2)
	ld l, $6
	jp .asm_d371a

.asm_d36f7: ; d36f7 (34:76f7)
	ld l, $7
	jp .asm_d371a

.asm_d36fc: ; d36fc (34:76fc)
	ld a, [wBackupMapX]
	cp $7
	jp nz, .asm_d3709
	ld l, $2
	jp .asm_d370b

.asm_d3709: ; d3709 (34:7709)
	ld l, $5
.asm_d370b: ; d370b (34:770b)
	jp .asm_d371a

.asm_d370e: ; d370e (34:770e)
	ld l, $3
	jp .asm_d371a

.asm_d3713: ; d3713 (34:7713)
	ld l, $8
	jp .asm_d371a

.asm_d3718: ; d3718 (34:7718)
	ld l, $a
.asm_d371a: ; d371a (34:771a)
	push hl
	scall AllocateSpaceForWarps
	pop hl
	push hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d35e5
	add hl, de
	ld e, $1
	scall LoadWarps
	playmusic SONG_TOWER
	scall Func_8001c
	pop hl
	ld a, l
	cp $a
	jp z, .asm_d37ce
	cp $9
	jp z, .asm_d37c5
	cp $8
	jp z, .asm_d37bc
	cp $7
	jp z, .asm_d37b3
	cp $6
	jp z, .asm_d37aa
	cp $5
	jp z, .asm_d37a1
	cp $4
	jp z, .asm_d3798
	cp $3
	jp z, .asm_d378f
	cp $2
	jp z, .asm_d3786
	cp $1
	jp z, .asm_d377d
	or a
	jp nz, .asm_d37d4
	landmarksign TreeBitstreamText_46d81
	jp .asm_d37d4

.asm_d377d: ; d377d (34:777d)
	landmarksign TreeBitstreamText_46d63
	jp .asm_d37d4

.asm_d3786: ; d3786 (34:7786)
	landmarksign TreeBitstreamText_46d6d
	jp .asm_d37d4

.asm_d378f: ; d378f (34:778f)
	landmarksign TreeBitstreamText_46d8b
	jp .asm_d37d4

.asm_d3798: ; d3798 (34:7798)
	landmarksign TreeBitstreamText_46d59
	jp .asm_d37d4

.asm_d37a1: ; d37a1 (34:77a1)
	landmarksign TreeBitstreamText_46d4f
	jp .asm_d37d4

.asm_d37aa: ; d37aa (34:77aa)
	landmarksign TreeBitstreamText_46d77
	jp .asm_d37d4

.asm_d37b3: ; d37b3 (34:77b3)
	landmarksign TreeBitstreamText_46d45
	jp .asm_d37d4

.asm_d37bc: ; d37bc (34:77bc)
	landmarksign TreeBitstreamText_46d96
	jp .asm_d37d4

.asm_d37c5: ; d37c5 (34:77c5)
	landmarksign TreeBitstreamText_46da2
	jp .asm_d37d4

.asm_d37ce: ; d37ce (34:77ce)
	landmarksign TreeBitstreamText_46d96
.asm_d37d4: ; d37d4 (34:77d4)
	scall StartShakingScreen
	playsfx $64
	script_sleep $3c
	scall StopShakingScreen
	jp .asm_d385a

.asm_d37e8: ; d37e8 (34:77e8)
	ld a, [wBackupMapGroup]
	cp $2
	jp nz, .asm_d381e
	scall AllocateSpaceForWarps
	ld hl, wc7de
	ld l, [hl]
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d358d
	add hl, de
	ld e, $1
	scall LoadWarps
	loadpeople $2, Data_d365e
	playmusic SONG_TOWN3
	scall Func_8001c
	jp .asm_d385a

.asm_d381e: ; d381e (34:781e)
	ld a, [wBackupMapNumber]
	cp $1e
	jp nz, .asm_d382b
	ld l, $0
	jp .asm_d3831

.asm_d382b: ; d382b (34:782b)
	ld a, [wBackupMapNumber]
	add $f7
	ld l, a
.asm_d3831: ; d3831 (34:7831)
	push hl
	scall AllocateSpaceForWarps
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d34b1
	add hl, de
	ld e, $1
	scall LoadWarps
	loadpeople $2, Data_d365e
	playmusic SONG_SHOP
	scall Func_8001c
.asm_d385a: ; d385a (34:785a)
	ret

Func_d385b:
	ld a, e
	or a
	jp nz, .asm_d38ae
	face_player 0
	scall Func_80275
	ld l, a
	push hl
	scall Func_80f02
	pop hl
	ld a, [wBackupMapGroup]
	cp $2
	jp nz, .asm_d3895
	push hl
	ld a, l
	ld [wc7de], a
	scall AllocateSpaceForWarps
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d358d
	add hl, de
	ld e, $1
	scall LoadWarps
	jp .asm_d38ae

.asm_d3895: ; d3895 (34:7895)
	push hl
	scall AllocateSpaceForWarps
	pop hl
	ld h, $0
	ld e, l
	ld d, h
	add hl, hl
	ld c, l
	ld b, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	ld de, Data_d34b1
	add hl, de
	ld e, $1
	scall LoadWarps
.asm_d38ae: ; d38ae (34:78ae)
	ret

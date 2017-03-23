SECTION "Audio Engine", ROMX [$4000], BANK [$1c]
Func_70000::
	jp Func_70088

Func_70003:: ; 70003 (1c:4003)
	jp Func_700f4

Func_70006:: ; 70006 (1c:4006)
	jp Func_70021

Func_70009:: ; 70009 (1c:4009)
	jp Func_70038

Func_7000c:: ; 7000c (1c:400c)
	jp Func_70059

Func_7000f:: ; 7000f (1c:400f)
	jp Func_7005d

Func_70012:: ; 70012 (1c:4012)
	jp Func_70067

Func_70015:: ; 70015 (1c:4015)
	jp Func_70071

Func_70018:: ; 70018 (1c:4018)
	jp Func_7007a

Func_7001b:: ; 7001b (1c:401b)
	jp Func_709ba

Func_7001e:: ; 7001e (1c:401e)
	jp Func_709c4

Func_70021: ; 70021 (1c:4021)
	push hl
	ld hl, Data_7129b
	cp [hl]
	jr nc, .asm_70036
	ld [$c100], a
	xor a
	ld [$c10b], a
	ld [$c16f], a
	dec a
	ld [$c104], a
.asm_70036
	pop hl
	ret

Func_70038: ; 70038 (1c:4038)
	push bc
	push hl
	ld b, $0
	ld c, a
	or a
	jr z, .asm_7004e
	ld hl, Data_7122e
	add hl, bc
	ld b, [hl]
	ld a, [$c103]
	or a
	jr z, .asm_7004e
	cp b
	jr c, .asm_70056
.asm_7004e
	ld a, c
	ld [$c102], a
	ld a, b
	ld [$c103], a
.asm_70056
	pop hl
	pop bc
	ret

Func_70059: ; 70059 (1c:4059)
	ld [$c170], a
	ret

Func_7005d: ; 7005d (1c:405d)
	ld a, [$c100]
	cp $80
	ld a, $1
	ret nz
	xor a
	ret

Func_70067: ; 70067 (1c:4067)
	ld a, [$c102]
	cp $80
	ld a, $1
	ret nz
	xor a
	ret

Func_70071: ; 70071 (1c:4071)
	ld a, [$c172]
	xor $1
	ld [$c172], a
	ret

Func_7007a: ; 7007a (1c:407a)
	push bc
	push af
	and $7
	ld b, a
	swap b
	or b
	ld [$c171], a
	pop af
	pop bc
	ret

Func_70088: ; 70088 (1c:4088)
	xor a
	ld [rNR52], a
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld a, $1c
	ld [$c101], a
	ld a, $80
	ld [$c100], a
	ld [$c102], a
	ld a, $77
	ld [$c171], a
	xor a
	ld [$c10c], a
	ld [$c1d3], a
	ld [$c10b], a
	ld [$c16f], a
	ld [$c170], a
	ld [$c172], a
	dec a
	ld [$c104], a
	ld de, $1
	ld bc, $0
.asm_700c6
	ld hl, $c10d
	add hl, bc
	ld [hl], d
	ld hl, $c111
	add hl, bc
	ld [hl], d
	ld hl, $c133
	add hl, bc
	ld [hl], d
	ld hl, $c14b
	add hl, bc
	ld [hl], d
	ld hl, $c13f
	add hl, bc
	ld [hl], d
	inc c
	ld a, c
	cp $4
	jr nz, .asm_700c6
	ld hl, Data_70c12
	ld bc, $c173
	ld d, $8
.asm_700ed
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .asm_700ed
	ret

Func_700f4: ; 700f4 (1c:40f4)
	call Func_702af
	call Func_70127
	ld hl, Func_76803
	call AudioEngineFarCall
	ld a, [$c101]
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ld a, [$c172]
	cp $0
	jr z, .asm_70114
	call Func_70976
	jr .asm_70120

.asm_70114
	call Func_702b0
	call Func_70315
	call Func_7037a
	call Func_703d9
.asm_70120
	call Func_7086f
	call Func_709a7
	ret

Func_70127: ; 70127 (1c:4127)
	ld a, [$c100]
	rla
	jr c, .asm_7013e
	call Func_70156
	ld a, [$c100]
	call Func_70197
	ld a, [$c100]
	or $80
	ld [$c100], a
.asm_7013e
	ld a, [$c102]
	rla
	jr c, .asm_70155
	ld a, [$c102]
	ld hl, Func_76800
	call AudioEngineFarCall
	ld a, [$c102]
	or $80
	ld [$c102], a
.asm_70155
	ret

Func_70156: ; 70156 (1c:4156)
	ld a, [$c10c]
	ld d, a
	xor a
	ld [$c10d], a
	bit 0, d
	jr nz, .asm_7016a
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.asm_7016a
	xor a
	ld [$c10e], a
	bit 1, d
	jr nz, .asm_7017a
	ld a, $8
	ld [rNR22], a
	swap a
	ld [rNR24], a
.asm_7017a
	xor a
	ld [$c110], a
	bit 3, d
	jr nz, .asm_7018a
	ld a, $8
	ld [rNR42], a
	swap a
	ld [rNR44], a
.asm_7018a
	xor a
	ld [$c10f], a
	bit 2, d
	jr nz, .asm_70196
	ld a, $0
	ld [rNR32], a
.asm_70196
	ret

Func_70197: ; 70197 (1c:4197)
	push af
	ld c, a
	ld b, $0
	ld hl, Data_7129c
	add hl, bc
	ld a, [hl]
	ld [$c101], a
	ld [hROMBank], a
	ld [HuC3RomBank], a
	pop af
	add a
	ld c, a
	ld b, $0
	ld hl, Data_712b9
	add hl, bc
	ld e, [hl]
	inc hl
	ld h, [hl]
	ld l, e
	ld e, [hl]
	inc hl
	ld b, h
	ld c, l
	rr e
	jr nc, .asm_701f6
	ld a, [bc]
	inc bc
	ld [$c115], a
	ld [$c11d], a
	ld a, [bc]
	inc bc
	ld [$c116], a
	ld [$c11e], a
	ld a, $1
	ld [$c13b], a
	ld [$c10d], a
	xor a
	ld [$c111], a
	ld [$c16a], a
	ld [$c13f], a
	ld [$c15f], a
	ld [$c14b], a
	ld a, [Data_70c12]
	ld [$c173], a
	ld a, [Data_70c12 + 1]
	ld [$c174], a
	ld a, $8
	ld [$c147], a
.asm_701f6
	rr e
	jr nc, .asm_70233
	ld a, [bc]
	inc bc
	ld [$c117], a
	ld [$c11f], a
	ld a, [bc]
	inc bc
	ld [$c118], a
	ld [$c120], a
	ld a, $1
	ld [$c13c], a
	ld [$c10e], a
	xor a
	ld [$c112], a
	ld [$c16b], a
	ld [$c140], a
	ld [$c160], a
	ld [$c14c], a
	ld a, [Data_70c14]
	ld [$c175], a
	ld a, [Data_70c14 + 1]
	ld [$c176], a
	ld a, $8
	ld [$c148], a
.asm_70233
	rr e
	jr nc, .asm_70270
	ld a, [bc]
	inc bc
	ld [$c119], a
	ld [$c121], a
	ld a, [bc]
	inc bc
	ld [$c11a], a
	ld [$c122], a
	ld a, $1
	ld [$c13d], a
	ld [$c10f], a
	xor a
	ld [$c113], a
	ld [$c16c], a
	ld [$c141], a
	ld [$c161], a
	ld [$c14d], a
	ld a, [Data_70c16]
	ld [$c177], a
	ld a, [Data_70c16 + 1]
	ld [$c178], a
	ld a, $40
	ld [$c149], a
.asm_70270
	rr e
	jr nc, .asm_702aa
	ld a, [bc]
	inc bc
	ld [$c11b], a
	ld [$c123], a
	ld a, [bc]
	inc bc
	ld [$c11c], a
	ld [$c124], a
	ld a, $1
	ld [$c13e], a
	ld [$c110], a
	xor a
	ld [$c114], a
	ld [$c142], a
	ld [$c162], a
	ld [$c14e], a
	ld a, [Data_70c18]
	ld [$c179], a
	ld a, [Data_70c18 + 1]
	ld [$c17a], a
	ld a, $40
	ld [$c14a], a
.asm_702aa
	xor a
	ld [$c172], a
	ret

Func_702af: ; 702af (1c:42af)
	ret

Func_702b0: ; 702b0 (1c:42b0)
	ld a, [$c10d]
	or a
	jr z, .asm_70305
	ld a, [$c137]
	cp $0
	jr z, .asm_702df
	ld a, [$c143]
	dec a
	ld [$c143], a
	jr nz, .asm_702df
	ld a, [$c13b]
	cp $1
	jr z, .asm_702df
	ld a, [$c10c]
	bit 0, a
	jr nz, .asm_702df
	ld hl, rNR12
	ld a, [$c147]
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.asm_702df
	ld a, [$c13b]
	dec a
	ld [$c13b], a
	jr nz, .asm_702ff
	ld a, [$c116]
	ld h, a
	ld a, [$c115]
	ld l, a
	ld bc, $0
	call Func_7041f
	ld a, [$c10d]
	or a
	jr z, .asm_70305
	call Func_7071d
.asm_702ff
	ld a, $0
	call Func_70863
	ret

.asm_70305
	ld a, [$c10c]
	bit 0, a
	jr nz, .asm_70314
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.asm_70314
	ret

Func_70315: ; 70315 (1c:4315)
	ld a, [$c10e]
	or a
	jr z, .asm_7036a
	ld a, [$c138]
	cp $0
	jr z, .asm_70344
	ld a, [$c144]
	dec a
	ld [$c144], a
	jr nz, .asm_70344
	ld a, [$c13c]
	cp $1
	jr z, .asm_70344
	ld a, [$c10c]
	bit 1, a
	jr nz, .asm_70344
	ld hl, rNR22
	ld a, [$c148]
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.asm_70344
	ld a, [$c13c]
	dec a
	ld [$c13c], a
	jr nz, .asm_70364
	ld a, [$c118]
	ld h, a
	ld a, [$c117]
	ld l, a
	ld bc, $1
	call Func_7041f
	ld a, [$c10e]
	or a
	jr z, .asm_7036a
	call Func_70763
.asm_70364
	ld a, $1
	call Func_70863
	ret

.asm_7036a
	ld a, [$c10c]
	bit 1, a
	jr nz, .asm_70379
	ld a, $8
	ld [rNR22], a
	swap a
	ld [rNR24], a
.asm_70379
	ret

Func_7037a: ; 7037a (1c:437a)
	ld a, [$c10f]
	or a
	jr z, .asm_703c9
	ld a, [$c139]
	cp $0
	jr z, .asm_703a3
	ld a, [$c145]
	dec a
	ld [$c145], a
	jr nz, .asm_703a3
	ld a, [$c10c]
	bit 2, a
	jr nz, .asm_703a3
	ld a, [$c13d]
	cp $1
	jr z, .asm_703a3
	ld a, [$c149]
	ld [rNR32], a
.asm_703a3
	ld a, [$c13d]
	dec a
	ld [$c13d], a
	jr nz, .asm_703c3
	ld a, [$c11a]
	ld h, a
	ld a, [$c119]
	ld l, a
	ld bc, $2
	call Func_7041f
	ld a, [$c10f]
	or a
	jr z, .asm_703c9
	call Func_707a5
.asm_703c3
	ld a, $2
	call Func_70863
	ret

.asm_703c9
	ld a, [$c10c]
	bit 2, a
	jr nz, .asm_703d8
	ld a, $0
	ld [rNR32], a
	ld a, $80
	ld [rNR34], a
.asm_703d8
	ret

Func_703d9: ; 703d9 (1c:43d9)
	ld a, [$c110]
	or a
	jr z, .asm_7040b
	ld a, [$c13e]
	dec a
	ld [$c13e], a
	jr nz, .asm_70401
	ld a, [$c11c]
	ld h, a
	ld a, [$c11b]
	ld l, a
	ld bc, $3
	call Func_7041f
	ld a, [$c110]
	or a
	jr z, .asm_7040b
	call Func_70813
	jr .asm_7041e

.asm_70401
	ld a, [$c16f]
	or a
	jr z, .asm_7041e
	call Func_70842
	ret

.asm_7040b
	ld a, [$c10c]
	bit 3, a
	jr nz, .asm_7041e
	xor a
	ld [$c16f], a
	ld a, $8
	ld [rNR42], a
	swap a
	ld [rNR44], a
.asm_7041e
	ret

Func_7041f: ; 7041f (1c:441f)
	ld a, [hli]
	push hl
	push af
	cp $d0
	jr c, .asm_70497
	sub $d0
	add a
	ld e, a
	ld d, $0
	ld hl, .pointers_70437
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	pop af
	jp [hl]

.pointers_70437
	dw Func_705a3
	dw Func_705ae
	dw Func_705ae
	dw Func_705ae
	dw Func_705ae
	dw Func_705ae
	dw Func_705ae
	dw Func_705c6
	dw Func_705ce
	dw Func_705d6
	dw Func_706fd
	dw Func_706fd
	dw Func_705df
	dw Func_705fa
	dw Func_70608
	dw Func_70614
	dw Func_70629
	dw Func_70643
	dw Func_7064a
	dw Func_70661
	dw Func_70672
	dw Func_7067f
	dw Func_7068c
	dw Func_70699
	dw Func_706a9
	dw Func_706b6
	dw Func_706c3
	dw Func_706d5
	dw Func_706e2
	dw Func_706ef
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd
	dw Func_706fd

.asm_70497
	push af
	ld a, [hl]
	ld e, a
	ld hl, $c111
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .asm_704bb
	ld [hl], $1
	xor a
	ld hl, $c15b
	add hl, bc
	ld [hl], a
	ld hl, $c163
	add hl, bc
	ld [hl], a
	inc [hl]
	ld hl, $c157
	add hl, bc
	ld a, [hl]
	ld hl, $c153
	add hl, bc
	ld [hl], a
.asm_704bb
	pop af
	push de
	ld hl, $c14f
	add hl, bc
	ld d, [hl]
	and $f
	inc a
	cp d
	jr nc, .asm_704cb
	ld e, a
	ld a, d
	ld d, e
.asm_704cb
	ld e, a
.asm_704cc
	dec d
	jr z, .asm_704d2
	add e
	jr .asm_704cc

.asm_704d2
	ld hl, $c13b
	add hl, bc
	ld [hl], a
	pop de
	ld d, a
	ld a, e
	cp $d9
	ld a, d
	jr z, .asm_70506
	ld e, a
	ld hl, $c13f
	add hl, bc
	ld a, [hl]
	cp $8
	ld d, a
	ld a, e
	jr z, .asm_70506
	push hl
	push bc
	ld b, $0
	ld c, a
	ld hl, $0
.asm_704f3
	add hl, bc
	dec d
	jr nz, .asm_704f3
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	pop bc
	pop hl
.asm_70506
	ld hl, $c143
	add hl, bc
	ld [hl], a
	pop af
	and $f0
	ld hl, $c137
	add hl, bc
	ld [hl], a
	or a
	jr nz, .asm_70519
	jp Func_70599

.asm_70519
	swap a
	dec a
	ld h, a
	ld a, $3
	cp c
	ld a, h
	jr z, .asm_70525
	jr .asm_7056f

.asm_70525
	push af
	ld hl, $c12f
	add hl, bc
	ld a, [hl]
	ld d, a
	sla a
	add d
	sla a
	sla a
	sla a
	ld e, a
	pop af
	ld hl, Data_70de4
	add a
	ld d, c
	ld c, a
	add hl, bc
	ld c, e
	add hl, bc
	ld c, d
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld d, a
	ld a, [$c104]
	and $77
	or d
	ld [$c104], a
	ld de, $c12b
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	ld b, $0
	ld a, l
	ld d, h
	ld hl, $c16d
	ld [hli], a
	ld [hl], d
	ld a, $1
	ld [$c16f], a
	jr Func_70599

.asm_7056f
	ld hl, $c125
	add hl, bc
	add hl, bc
	push hl
	ld hl, $c12f
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, Data_70c1a
	add hl, de
	add a
	ld e, [hl]
	add e
	ld hl, $c14b
	add hl, bc
	ld e, [hl]
	add e
	add e
	ld e, a
	ld hl, Data_70c22
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	call Func_7095d
	pop hl
	ld a, e
	ld [hli], a
	ld [hl], d
Func_70599: ; 70599 (1c:4599)
	pop de
	ld hl, $c115
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_705a3: ; 705a3 (1c:45a3)
	pop hl
	ld a, [hli]
	push hl
	ld hl, $c14f
	add hl, bc
	ld [hl], a
	jp Func_70719

Func_705ae: ; 705ae (1c:45ae)
	and $7
	dec a
	ld hl, $c12f
	add hl, bc
	push af
	ld a, c
	cp $2
	jr nz, .asm_705c1
	pop af
	inc a
	ld [hl], a
	jp Func_70719

.asm_705c1
	pop af
	ld [hl], a
	jp Func_70719

Func_705c6: ; 705c6 (1c:45c6)
	ld hl, $c12f
	add hl, bc
	inc [hl]
	jp Func_70719

Func_705ce: ; 705ce (1c:45ce)
	ld hl, $c12f
	add hl, bc
	dec [hl]
	jp Func_70719

Func_705d6: ; 705d6 (1c:45d6)
	ld hl, $c111
	add hl, bc
	ld [hl], $80
	jp Func_70719

Func_705df: ; 705df (1c:45df)
	pop hl
	ld a, [hli]
	push hl
	push bc
	inc c
	ld e, $ee
.asm_705e6
	dec c
	jr z, .asm_705ee
	rlca
	rlc e
	jr .asm_705e6

.asm_705ee
	ld d, a
	ld hl, $c104
	ld a, [hl]
	and e
	or d
	ld [hl], a
	pop bc
	jp Func_70719

Func_705fa: ; 705fa (1c:45fa)
	pop de
	push de
	dec de
	ld hl, $c11d
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_70719

Func_70608: ; 70608 (1c:4608)
	pop hl
	ld hl, $c11d
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_7041f

Func_70614: ; 70614 (1c:4614)
	pop de
	ld a, [de]
	inc de
	push af
	call Func_70705
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	pop af
	ld [hl], a
	inc hl
	push de
	call Func_7070e
	jp Func_70719

Func_70629: ; 70629 (1c:4629)
	call Func_70705
	dec hl
	ld a, [hl]
	dec a
	jr z, .asm_7063b
	ld [hld], a
	ld d, [hl]
	dec hl
	ld e, [hl]
	pop hl
	ld h, d
	ld l, e
	jp Func_7041f

.asm_7063b
	dec hl
	dec hl
	call Func_7070e
	jp Func_70719

Func_70643: ; 70643 (1c:4643)
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_7041f

Func_7064a: ; 7064a (1c:464a)
	call Func_70705
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld d, a
	ld e, b
	ld b, $0
	push de
	call Func_7070e
	jp Func_70719

Func_70661: ; 70661 (1c:4661)
	pop de
	call Func_70705
	dec hl
	ld a, [hld]
	ld e, [hl]
	ld d, a
	inc de
	inc de
	push de
	call Func_7070e
	jp Func_70719

Func_70672: ; 70672 (1c:4672)
	pop de
	ld a, [de]
	inc de
	ld hl, $c16a
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_7067f: ; 7067f (1c:467f)
	pop de
	ld a, [de]
	inc de
	ld hl, $c106
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_7068c: ; 7068c (1c:468c)
	pop de
	ld a, [de]
	inc de
	ld hl, $c167
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_70699: ; 70699 (1c:4699)
	pop de
	ld a, [de]
	inc de
	ld [$c10a], a
	ld a, $1
	ld [$c10b], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706a9: ; 706a9 (1c:46a9)
	pop de
	ld a, [de]
	inc de
	ld hl, $c13f
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706b6: ; 706b6 (1c:46b6)
	pop de
	ld a, [de]
	inc de
	ld hl, $c147
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706c3: ; 706c3 (1c:46c3)
	pop de
	ld a, [de]
	inc de
	ld hl, $c153
	add hl, bc
	ld [hl], a
	ld hl, $c157
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706d5: ; 706d5 (1c:46d5)
	pop de
	ld a, [de]
	inc de
	ld hl, $c15f
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706e2: ; 706e2 (1c:46e2)
	pop de
	ld a, [de]
	inc de
	ld hl, $c14b
	add hl, bc
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706ef: ; 706ef (1c:46ef)
	pop de
	ld a, [de]
	inc de
	ld hl, $c14b
	add hl, bc
	add [hl]
	ld [hl], a
	ld h, d
	ld l, e
	jp Func_7041f

Func_706fd: ; 706fd (1c:46fd)
	ld hl, $c10d
	add hl, bc
	ld [hl], $0
	pop hl
	ret

Func_70705: ; 70705 (1c:4705)
	ld hl, $c173
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_7070e: ; 7070e (1c:470e)
	ld d, h
	ld e, l
	ld hl, $c173
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_70719: ; 70719 (1c:4719)
	pop hl
	jp Func_7041f

Func_7071d: ; 7071d (1c:471d)
	ld a, [$c10c]
	bit 0, a
	jr nz, .asm_70752
	ld a, [$c137]
	cp $0
	jr z, .asm_70753
	ld d, $0
	ld hl, $c111
	ld a, [hl]
	cp $80
	jr z, .asm_7073c
	ld a, [$c167]
	ld [rNR12], a
	ld d, $80
.asm_7073c
	ld [hl], $2
	ld a, $8
	ld [rNR10], a
	ld a, [$c106]
	ld [rNR11], a
	ld a, [$c125]
	ld [rNR13], a
	ld a, [$c126]
	or d
	ld [rNR14], a
.asm_70752
	ret

.asm_70753
	ld hl, $c111
	ld [hl], $0
	ld hl, rNR12
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Func_70763: ; 70763 (1c:4763)
	ld a, [$c10c]
	bit 1, a
	jr nz, .asm_70794
	ld a, [$c138]
	cp $0
	jr z, .asm_70795
	ld d, $0
	ld hl, $c112
	ld a, [hl]
	cp $80
	jr z, .asm_70782
	ld a, [$c168]
	ld [rNR22], a
	ld d, $80
.asm_70782
	ld [hl], $2
	ld a, [$c107]
	ld [rNR21], a
	ld a, [$c127]
	ld [rNR23], a
	ld a, [$c128]
	or d
	ld [rNR24], a
.asm_70794
	ret

.asm_70795
	ld hl, $c112
	ld [hl], $0
	ld hl, rNR22
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Func_707a5: ; 707a5 (1c:47a5)
	ld a, [$c10c]
	bit 2, a
	jr nz, .asm_707e9
	ld d, $0
	ld a, [$c10b]
	or a
	jr z, .asm_707bc
	xor a
	ld [rNR30], a
	call Func_707f3
	ld d, $80
.asm_707bc
	ld a, [$c139]
	cp $0
	jr z, .asm_707ea
	ld hl, $c113
	ld a, [hl]
	cp $80
	jr z, .asm_707d5
	ld a, [$c169]
	ld [rNR32], a
	xor a
	ld [rNR30], a
	ld d, $80
.asm_707d5
	ld [hl], $2
	xor a
	ld [rNR31], a
	ld a, [$c129]
	ld [rNR33], a
	ld a, $80
	ld [rNR30], a
	ld a, [$c12a]
	or d
	ld [rNR34], a
.asm_707e9
	ret

.asm_707ea
	ld hl, $c111
	ld [hl], $0
	xor a
	ld [rNR30], a
	ret

Func_707f3: ; 707f3 (1c:47f3)
	ld a, [$c10a]
	add a
	ld d, $0
	ld e, a
	ld hl, Data_70ccc
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, d
	ld de, rWave_0
.asm_70805
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $10
	jr nz, .asm_70805
	xor a
	ld [$c10b], a
	ret

Func_70813: ; 70813 (1c:4813)
	ld a, [$c10c]
	bit 3, a
	jr nz, .asm_70832
	ld a, [$c13a]
	cp $0
	jr z, asm_70833
	ld de, rNR41
	ld hl, $c12b
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
.asm_70832
	ret

asm_70833
	xor a
	ld [$c16f], a
	ld hl, rNR42
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	ret

Func_70842: ; 70842 (1c:4842)
	ld a, [$c10c]
	bit 3, a
	jr z, .asm_7084f
	xor a
	ld [$c16f], a
	jr .asm_70862

.asm_7084f
	ld hl, $c16d
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [de]
	cp $ff
	jr nz, .asm_7085c
	jr asm_70833

.asm_7085c
	ld [rNR43], a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e
.asm_70862
	ret

Func_70863: ; 70863 (1c:4863)
	push af
	ld b, $0
	ld c, a
	call Func_708a1
	pop af
	call Func_70914
	ret

Func_7086f: ; 7086f (1c:486f)
	ld a, [$c171]
	ld [rNR50], a
	ld a, [$c10c]
	or a
	ld hl, $c104
	ld a, [hli]
	jr z, .asm_70891
	ld a, [$c10c]
	and $f
	ld d, a
	swap d
	or d
	ld d, a
	xor $ff
	ld e, a
	ld a, [hld]
	and d
	ld d, a
	ld a, [hl]
	and e
	or d
.asm_70891
	ld d, a
	ld a, [$c170]
	xor $ff
	and $f
	ld e, a
	swap e
	or e
	and d
	ld [rNR51], a
	ret

Func_708a1: ; 708a1 (1c:48a1)
	ld hl, $c15f
	add hl, bc
	ld a, [hl]
	cp $0
	jr z, .asm_7090b
	ld hl, $c163
	add hl, bc
	cp [hl]
	jr z, .asm_708b4
	inc [hl]
	jr .asm_7090b

.asm_708b4
	ld hl, $c153
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, Data_70fa4
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $c15b
	add hl, bc
	ld d, $0
	ld e, [hl]
	inc [hl]
	pop hl
	add hl, de
	ld a, [hli]
	cp $80
	jr z, .asm_708f7
	ld hl, $c125
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	bit 7, a
	jr nz, .asm_708e8
	add e
	ld e, a
	ld a, $0
	adc d
	and $7
	ld d, a
	ret

.asm_708e8
	xor $ff
	inc a
	push bc
	ld c, a
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	and $7
	ld d, a
	pop bc
	ret

.asm_708f7
	push hl
	ld hl, $c15b
	add hl, bc
	ld [hl], $0
	pop hl
	ld a, [hl]
	cp $80
	jr z, .asm_708b4
	ld hl, $c153
	add hl, bc
	ld [hl], a
	jr .asm_708b4

.asm_7090b
	ld hl, $c125
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

Func_70914: ; 70914 (1c:4914)
	cp $0
	jr nz, .asm_7092c
	ld a, [$c15f]
	cp $0
	jr z, .asm_7092c
	ld a, [$c10c]
	bit 0, a
	jr nz, .asm_7095c
	ld a, e
	ld [rNR13], a
	ld a, d
	ld [rNR14], a
.asm_7092c
	cp $1
	jr nz, .asm_70944
	ld a, [$c160]
	cp $0
	jr z, .asm_70944
	ld a, [$c10c]
	bit 1, a
	jr nz, .asm_7095c
	ld a, e
	ld [rNR23], a
	ld a, d
	ld [rNR24], a
.asm_70944
	cp $2
	jr nz, .asm_7095c
	ld a, [$c161]
	cp $0
	jr z, .asm_7095c
	ld a, [$c10c]
	bit 2, a
	jr nz, .asm_7095c
	ld a, e
	ld [rNR33], a
	ld a, d
	ld [rNR34], a
.asm_7095c
	ret

Func_7095d: ; 7095d (1c:495d)
	ld hl, $c16a
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .asm_7096c
	add e
	ld e, a
	ld a, d
	adc b
	ld d, a
	ret

.asm_7096c
	xor $ff
	ld h, a
	ld a, e
	sub h
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ret

Func_70976: ; 70976 (1c:4976)
	ld a, [$c10c]
	ld d, a
	bit 0, d
	jr nz, .asm_70986
	ld a, $8
	ld [rNR12], a
	swap a
	ld [rNR14], a
.asm_70986
	bit 1, d
	jr nz, .asm_70992
	swap a
	ld [rNR22], a
	swap a
	ld [rNR24], a
.asm_70992
	bit 3, d
	jr nz, .asm_7099e
	swap a
	ld [rNR42], a
	swap a
	ld [rNR44], a
.asm_7099e
	bit 2, d
	jr nz, .asm_709a6
	ld a, $0
	ld [rNR32], a
.asm_709a6
	ret

Func_709a7: ; 709a7 (1c:49a7)
	ld hl, $c10d
	xor a
	add [hl]
	inc hl
	add [hl]
	inc hl
	add [hl]
	inc hl
	add [hl]
	or a
	ret nz
	ld a, $80
	ld [$c100], a
	ret

Func_709ba: ; 709ba (1c:49ba)
	call Func_70976
	call Func_709ce
	call Func_70156
	ret

Func_709c4: ; 709c4 (1c:49c4)
	call Func_70976
	call Func_70156
	call Func_70af3
	ret

Func_709ce: ; 709ce (1c:49ce)
	ld a, [$c100]
	ld [wc020], a
	ld a, [$c101]
	ld [wc020 + 1], a
	ld a, [$c104]
	ld [wc020 + 2], a
	ld hl, $c106
	ld de, wc020 + 3
	ld a, $4
	call Func_70c0a
	ld a, [$c10a]
	ld [wc020 + 7], a
	ld a, [$c10b]
	ld [wc020 + 8], a
	ld hl, $c10d
	ld de, wc020 + 9
	ld a, $4
	call Func_70c0a
	ld hl, $c111
	ld de, $c02d
	ld a, $4
	call Func_70c0a
	ld hl, $c115
	ld de, $c031
	ld a, $8
	call Func_70c0a
	ld hl, $c11d
	ld de, $c039
	ld a, $8
	call Func_70c0a
	ld a, [$c12b]
	ld [$c041], a
	ld a, [$c12c]
	ld [$c042], a
	ld hl, $c12f
	ld de, $c043
	ld a, $4
	call Func_70c0a
	ld hl, $c133
	ld de, $c047
	ld a, $4
	call Func_70c0a
	ld hl, $c137
	ld de, $c04b
	ld a, $4
	call Func_70c0a
	ld hl, $c13b
	ld de, $c04f
	ld a, $4
	call Func_70c0a
	ld hl, $c13f
	ld de, $c053
	ld a, $4
	call Func_70c0a
	ld hl, $c143
	ld de, $c057
	ld a, $4
	call Func_70c0a
	ld hl, $c147
	ld de, $c05b
	ld a, $4
	call Func_70c0a
	ld hl, $c14b
	ld de, $c05f
	ld a, $4
	call Func_70c0a
	ld hl, $c14f
	ld de, $c063
	ld a, $4
	call Func_70c0a
	ld hl, $c157
	ld de, $c067
	ld a, $4
	call Func_70c0a
	ld hl, $c15f
	ld de, $c06b
	ld a, $4
	call Func_70c0a
	ld a, $0
	ld [$c15b], a
	ld [$c15c], a
	ld [$c15d], a
	ld [$c15e], a
	ld hl, $c167
	ld de, $c06f
	ld a, $3
	call Func_70c0a
	ld hl, $c16a
	ld de, $c072
	ld a, $3
	call Func_70c0a
	ld hl, $c16d
	ld de, $c075
	ld a, $2
	call Func_70c0a
	ld a, $0
	ld [$c077], a
	ld hl, $c173
	ld de, $c078
	ld a, $8
	call Func_70c0a
	ld hl, $c17b
	ld de, $c080
	ld a, $30
	call Func_70c0a
	ret

Func_70af3: ; 70af3 (1c:4af3)
	ld a, [wc020]
	ld [$c100], a
	ld a, [wc020 + 1]
	ld [$c101], a
	ld a, [wc020 + 2]
	ld [$c104], a
	ld hl, wc020 + 3
	ld de, $c106
	ld a, $4
	call Func_70c0a
	ld a, [wc020 + 7]
	ld [$c10a], a
	ld a, $1
	ld [$c10b], a
	ld hl, wc020 + 9
	ld de, $c10d
	ld a, $4
	call Func_70c0a
	ld hl, $c02d
	ld de, $c111
	ld a, $4
	call Func_70c0a
	ld hl, $c031
	ld de, $c115
	ld a, $8
	call Func_70c0a
	ld hl, $c039
	ld de, $c11d
	ld a, $8
	call Func_70c0a
	ld a, [$c041]
	ld [$c12b], a
	ld a, [$c042]
	ld [$c12c], a
	ld hl, $c043
	ld de, $c12f
	ld a, $4
	call Func_70c0a
	ld hl, $c047
	ld de, $c133
	ld a, $4
	call Func_70c0a
	ld hl, $c04b
	ld de, $c137
	ld a, $4
	call Func_70c0a
	ld hl, $c04f
	ld de, $c13b
	ld a, $4
	call Func_70c0a
	ld hl, $c053
	ld de, $c13f
	ld a, $4
	call Func_70c0a
	ld hl, $c057
	ld de, $c143
	ld a, $4
	call Func_70c0a
	ld hl, $c05b
	ld de, $c147
	ld a, $4
	call Func_70c0a
	ld hl, $c05f
	ld de, $c14b
	ld a, $4
	call Func_70c0a
	ld hl, $c063
	ld de, $c14f
	ld a, $4
	call Func_70c0a
	ld hl, $c067
	ld de, $c157
	ld a, $4
	call Func_70c0a
	ld hl, $c06b
	ld de, $c15f
	ld a, $4
	call Func_70c0a
	ld hl, $c06f
	ld de, $c167
	ld a, $3
	call Func_70c0a
	ld hl, $c072
	ld de, $c16a
	ld a, $3
	call Func_70c0a
	ld hl, $c075
	ld de, $c16d
	ld a, $2
	call Func_70c0a
	ld a, [$c077]
	ld [$c16f], a
	ld hl, $c078
	ld de, $c173
	ld a, $8
	call Func_70c0a
	ld hl, $c080
	ld de, $c17b
	ld a, $30
	call Func_70c0a
	ret

Func_70c0a: ; 70c0a (1c:4c0a)
	ld c, a
.asm_70c0b
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_70c0b
	ret

SECTION "Audio Engine 2", ROMX [$6800], BANK [$1d]
Func_76800:
	jp Func_76806

Func_76803:
	jp Func_76859

Func_76806: ; 76806 (1d:6806)
	ld hl, Data_76a37
	cp [hl]
	jr nc, .asm_76858
	add a
	ld c, a
	ld b, $0
	ld a, [$c1d3]
	or a
	jr z, .asm_76819
	call Func_76a20
.asm_76819
	ld a, $1
	ld [$c1d3], a
	ld hl, Data_76a38
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [$c10c], a
	ld [$c1d4], a
	ld de, $c1cb
	ld c, $0
.asm_76831
	ld a, [$c1d4]
	rrca
	ld [$c1d4], a
	jr nc, .asm_76850
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld hl, $c1af
	add hl, bc
	ld [hl], $0
	ld hl, $c1b3
	add hl, bc
	ld [hl], $1
	pop hl
	jr .asm_76852

.asm_76850
	inc de
	inc de
.asm_76852
	inc c
	ld a, $4
	cp c
	jr nz, .asm_76831
.asm_76858
	ret

Func_76859: ; 76859 (1d:6859)
	ld a, [$c10c]
	or a
	jr nz, .asm_76863
	call Func_76a13
	ret

.asm_76863
	xor a
	ld b, a
	ld c, a
	ld a, [$c10c]
	ld [$c1d4], a
.asm_7686c
	ld hl, $c1d4
	ld a, [hl]
	rrca
	ld [hl], a
	jr nc, .asm_7688d
	ld hl, $c1b3
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .asm_76882
	ld [hl], a
	call Func_7696e
	jr .asm_7688d

.asm_76882
	ld hl, $c1cb
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_76894
.asm_7688d
	inc c
	ld a, c
	cp $4
	jr nz, .asm_7686c
	ret

Func_76894: ; 76894 (1d:6894)
	ld a, [hl]
	and $f0
	swap a
	add a
	ld e, a
	ld d, $0
	ld a, [hli]
	push hl
	and $f
	ld hl, Pointers_768ab
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	jp [hl]

Pointers_768ab:
	dw Func_768ce
	dw Func_768f9
	dw Func_76912
	dw Func_76923
	dw Func_76938
	dw Func_76951
	dw Func_7695d
	dw Func_769a9
	dw Func_769d4
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_768cb
	dw Func_769f0

Func_768cb: ; Data_7768cb
	jp Func_76894

Func_768ce: ; 768ce (1d:68ce)
	ld d, a
	pop hl
	ld a, [hli]
	ld e, a
	push hl
	ld hl, $c1b7
	add hl, bc
	add hl, bc
	ld [hli], a
	ld [hl], d
	ld hl, $c1ab
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	or d
	ld d, a
	ld hl, rNR13
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
	pop de
Func_768f0: ; 768f0 (1d:68f0)
	ld hl, $c1cb
	add hl, bc
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_768f9: ; 768f9 (1d:68f9)
	ld hl, $c1ab
	add hl, bc
	ld a, $80
	ld [hl], a
	pop hl
	ld a, [hli]
	ld e, a
	push hl
	ld hl, rNR12
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld [hl], e
	pop hl
	jp Func_76894

Func_76912: ; 76912 (1d:6912)
	swap a
	ld e, a
	ld hl, rNR11
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld [hl], e
	pop hl
	jp Func_76894

Func_76923: ; 76923 (1d:6923)
	ld hl, $c1c3
	add hl, bc
	add hl, bc
	pop de
	ld a, [de]
	inc de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c1bf
	add hl, bc
	ld [hl], a
	ld l, e
	ld h, d
	jp Func_76894

Func_76938: ; 76938 (1d:6938)
	ld hl, $c1bf
	add hl, bc
	ld a, [hl]
	dec a
	jr z, .asm_7694d
	ld [hl], a
	ld hl, $c1c3
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp Func_76894

.asm_7694d
	pop hl
	jp Func_76894

Func_76951: ; 76951 (1d:6951)
	ld hl, $c1af
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	jp Func_76894

Func_7695d: ; 7695d (1d:695d)
	call Func_7696e
	ld hl, $c1b3
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	ld e, l
	ld d, h
	jp Func_768f0

Func_7696e: ; 7696e (1d:696e)
	ld hl, $c1af
	add hl, bc
	ld a, [hl]
	or a
	jr z, .asm_769a8
	ld hl, $c1b7
	add hl, bc
	add hl, bc
	bit 7, a
	jr z, .asm_7698b
	xor $ff
	inc a
	ld d, a
	ld a, [hl]
	sub d
	ld [hli], a
	ld e, a
	ld a, [hl]
	sbc b
	jr .asm_76992

.asm_7698b
	ld d, a
	ld a, [hl]
	add d
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc b
.asm_76992
	ld [hl], a
	ld hl, $c1ab
	add hl, bc
	ld d, [hl]
	ld [hl], $0
	or d
	ld d, a
	ld hl, rNR13
	ld a, c
	add a
	add a
	add c
	add l
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
.asm_769a8
	ret

Func_769a9: ; 769a9 (1d:69a9)
	add a
	ld d, $0
	ld e, a
	ld hl, Data_76c72
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $0
	ld [rNR30], a
	ld b, d
	ld de, rWave_0
.asm_769bc
	ld a, [hli]
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $10
	jr nz, .asm_769bc
	ld a, $1
	ld [$c10b], a
	ld a, $80
	ld [rNR30], a
	ld b, $0
	pop hl
	jp Func_76894

Func_769d4: ; 769d4 (1d:69d4)
	pop hl
	ld a, [hli]
	push hl
	push bc
	inc c
	ld e, $ee
.asm_769db
	dec c
	jr z, .asm_769e3
	rlca
	rlc e
	jr .asm_769db

.asm_769e3
	ld d, a
	ld hl, $c105
	ld a, [hl]
	and e
	or d
	ld [hl], a
	pop bc
	pop hl
	jp Func_76894

Func_769f0: ; 769f0 (1d:69f0)
	ld e, c
	inc e
	ld a, $7f
.asm_769f4
	rlca
	dec e
	jr nz, .asm_769f4
	ld e, a
	ld a, [$c10c]
	and e
	ld [$c10c], a
	ld a, c
	rlca
	rlca
	add c
	ld e, a
	ld d, b
	ld hl, rNR12
	add hl, de
	ld a, $8
	ld [hli], a
	inc hl
	swap a
	ld [hl], a
	pop hl
	ret

Func_76a13: ; 76a13 (1d:6a13)
	xor a
	ld [$c1d3], a
	ld [$c103], a
	ld a, $80
	ld [$c102], a
	ret

Func_76a20: ; 76a20 (1d:6a20)
	ld a, $8
	ld a, [rNR12]
	ld a, [rNR22]
	ld a, [rNR32]
	ld a, [rNR42]
	ld a, $80
	ld a, [rNR14]
	ld a, [rNR24]
	ld a, [rNR44]
	xor a
	ld [$c10c], a
	ret

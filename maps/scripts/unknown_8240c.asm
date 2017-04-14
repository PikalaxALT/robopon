Data_823ba: ; 823ba
	dr $823ba, $823d4

Data_823d4: ; 823d4
	dr $823d4, $8240c

Func_8240c:
	ld e, $2
	ld hl, Data_823ba
	call LoadMapObjects_20
	ld a, [$c790]
	cp $4
	jp z, Func_8242b
	ld e, $4
	ld hl, Data_823d4
	call Func_800fb_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
Func_8242b: ; 8242b (20:642b)
	ld a, $11
	call PlayMusic_20
	call Func_8001c_20
	ret

Data_82434:
	dr $82434, $8243a

Data_8243a: ; 8243a
	dr $8243a, $82440

Data_82440: ; 82440
	dr $82440, $82446

Func_82446:
	ld a, e
	or a
	jp nz, Func_82592
	ld hl, $c6
	call Func_8062e_20
	or a
	jp nz, Func_82562
	ld a, [wPlayerFacing]
	cp $1
	jp z, Func_82464
	or a
	jp nz, Func_82478
	jp Func_82489

Func_82464: ; 82464 (20:6464)
	ld c, $1
	ld de, Data_8243a
	ld a, BANK(Data_8243a)
	call ApplyMovementData_20
	call Func_8020c_20
	xor a
	call PlayerFace_20
	jp Func_82489

Func_82478: ; 82478 (20:6478)
	ld c, $1
	ld de, Data_82434
	ld a, BANK(Data_82434)
	call ApplyMovementData_20
	call Func_8020c_20
	xor a
	call PlayerFace_20
Func_82489: ; 82489 (20:6489)
	call Func_8000e_20
	cp $b
	jp z, Func_824c3
	cp $7
	jp z, Func_824c3
	cp $3
	jp z, Func_824c3
	cp $a
	jp z, Func_824be
	cp $6
	jp z, Func_824be
	cp $2
	jp z, Func_824be
	cp $9
	jp z, Func_824b9
	cp $5
	jp z, Func_824b9
	cp $1
	jp nz, Func_824c8
Func_824b9: ; 824b9 (20:64b9)
IF DEF(SUN)
	ld a, $5a
ENDC
IF DEF(STAR)
	ld a, $2d
ENDC
	jp Func_824ca

Func_824be: ; 824be (20:64be)
IF DEF(SUN)
	ld a, $5c
ENDC
IF DEF(STAR)
	ld a, $2e
ENDC
	jp Func_824ca

Func_824c3: ; 824c3 (20:64c3)
IF DEF(SUN)
	ld a, $6c
ENDC
IF DEF(STAR)
	ld a, $2f
ENDC
	jp Func_824ca

Func_824c8: ; 824c8 (20:64c8)
IF DEF(SUN)
	ld a, $14
ENDC
IF DEF(STAR)
	ld a, $7d
ENDC
Func_824ca: ; 824ca (20:64ca)
	push af
	call Func_800b8_20
	ld e, a
	ld a, $3
	call Func_800c8_20
	ld hl, $3fa
	call PrintText_20
	ld hl, $1e
	call Func_8068f_20
	ld e, $1
	ld a, $3
	call Func_8013d_20
	ld e, $3
	ld a, $3
	call SpriteFace_20
	ld e, $0
	ld a, $3
	call SpriteFace_20
	ld e, $1
	ld a, $3
	call SpriteFace_20
	ld e, $2
	ld a, $3
	call SpriteFace_20
	ld e, $3
	ld a, $3
	call SpriteFace_20
	ld e, $0
	ld a, $3
	call SpriteFace_20
	ld e, $1
	ld a, $3
	call SpriteFace_20
	ld e, $2
	ld a, $3
	call SpriteFace_20
	ld hl, $1e
	call Func_8068f_20
	ld bc, Data_82440
	ld e, BANK(Data_82440)
	ld a, $3
	call Func_80688_20
	call Func_8020c_20
	ld e, $0
	ld a, $3
	call Func_8013d_20
	ld a, $2a
	call PlaySFX_20
	ld hl, $3f9
	call Func_80498_20
	pop af
	ld e, $0
	ld c, $5
	call Func_80d87_20
	cp $ff
	jp nz, Func_82551
Func_82551: ; 82551 (20:6551)
	ld hl, $3fb
	call PrintText_20
	ld e, $1
	ld hl, $c6
	call Func_8061b_20
	jp Func_82592

Func_82562: ; 82562 (20:6562)
	xor a
	call Func_8044b_20
	call Func_802e0_20
	xor a
	call PlayMusic_20
	ld a, $16
	call PlayMusic_20
	ld c, $1
	ld e, $2
	ld a, $8
	call Func_80176_20
	call Func_801d5_20
	call Func_8018b_20
	ld hl, $322
	call Func_80498_20
	ld hl, $15a
	call PrintText_20
	ld a, $11
	call PlayMusic_20
Func_82592: ; 82592 (20:6592)
	ret

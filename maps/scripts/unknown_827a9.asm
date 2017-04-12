Data_8271c:
	dr $8271c, $8275e

Data_8275e: ; 8275e
	dr $8275e, $82763

Data_82763: ; 82763
	dr $82763, $8279b

Data_8279b: ; 8279b
	dr $8279b, $827a9

Func_827a9:
	call Func_82866
	ld hl, Func_82866
	call Func_80f11_20
	ld a, $1
	ld [$c7de], a
	ld e, $6
	ld hl, Data_8271c
	call Func_8003a_20
	ld e, $1
	ld hl, Data_8275e
	call Func_80ce7_20
	ld a, [$c793]
	or a
	jp z, Func_827de
	ld a, [$c793]
	cp $2
	jp z, Func_827de
	ld a, [$c793]
	cp $3
	jp nz, Func_8283f
Func_827de: ; 827de (20:67de)
	ld e, $4
	ld hl, Data_82763
	call Func_800fb_20
	ld a, $b
	call Func_80ee6_20
	ld a, [$c7df]
	cp $20
	jp nz, Func_82811
	ld a, [$c7e0]
	cp $5
	jp nz, Func_82811
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
	ld hl, $3dc
	call Func_80f72_20
	call Func_829dd
	jp Func_8283c

Func_82811: ; 82811 (20:6811)
	ld hl, $d
	call Func_8062e_20
	or a
	jp nz, Func_8282c
	call Func_8001c_20
	call Func_82894
	ld e, $1
	ld hl, $d
	call Func_8061b_20
	jp Func_8283c

Func_8282c: ; 8282c (20:682c)
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
	ld hl, $3dc
	call Func_80f72_20
Func_8283c: ; 8283c (20:683c)
	jp Func_82859

Func_8283f: ; 8283f (20:683f)
	ld e, $4
	ld hl, Data_82763
	call Func_800fb_20
	ld e, $1
	ld hl, Data_8279b
	call Func_800fb_20
	ld e, $0
	ld a, $1
	call Func_8013d_20
	call Func_8001c_20
Func_82859: ; 82859 (20:6859)
	ret

Data_8285a:
	dr $8285a, $82860

Data_82860: ; 82860
	dr $82860, $82866

Func_82866: ; 82866 (20:6866)
	ld a, [$c78c]
	cp $2
	jp nc, Func_82874
	ld hl, Data_8285a
	call Func_80d9b_20
Func_82874: ; 82874 (20:6874)
	ld a, [$c78c]
	cp $5
	jp nc, Func_82882
	ld hl, Data_82860
	call Func_80d9b_20
Func_82882: ; 82882 (20:6882)
	call Func_80f02_20
	ret

Data_82886:
	dr $82886, $8288a

Data_8288a: ; 8288a
	dr $8288a, $82890

Data_82890: ; 82890
	dr $82890, $82894

Func_82894: ; 82894 (20:6894)
	ld bc, Data_82886
	ld e, BANK(Data_82886)
	ld a, $1
	call Func_801f7_20
	ld c, $1
	ld de, Data_8288a
	ld a, BANK(Data_8288a)
	call Func_8063e_20
	call Func_8020c_20
	ld hl, $10
	call Func_804a9_20
	ld hl, $11
	call Func_804a9_20
	ld bc, Data_82890
	ld e, BANK(Data_82890)
	ld a, $1
	call Func_801f7_20
	ld c, $3
	ld de, Data_82890
	ld a, BANK(Data_82890)
	call Func_8063e_20
	call Func_8020c_20
	ret

Data_828cf:
	dr $828cf, $828d3

Data_828d3: ; 828d3
	dr $828d3, $828d7

Data_828d7: ; 828d7
	dr $828d7, $828db

Data_828db: ; 828db
	dr $828db, $828df

Func_828df:
	ld a, e
	cp $2
	jp nz, Func_8298b
	ld bc, Data_828cf
	ld e, BANK(Data_828cf)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
	ld hl, $32
	call Func_8062e_20
	cp $1
	jp nz, Func_82967
	ld hl, $3ed
	call Func_804ca_20
	or a
	jp nz, Func_82940
	ld hl, $486
	call Func_804a9_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
	ld c, $1
	ld de, Data_828db
	ld a, BANK(Data_828db)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $0
	ld hl, $f8
	call Func_8061b_20
	jp Func_82964

Func_82940: ; 82940 (20:6940)
	ld hl, $482
	call Func_804a9_20
	ld c, $1
	ld de, Data_828d7
	ld a, BANK(Data_828d7)
	call Func_8063e_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
Func_82964: ; 82964 (20:6964)
	jp Func_8298b

Func_82967: ; 82967 (20:6967)
	ld hl, FillMemory
	call Func_804a9_20
	ld c, $1
	ld de, Data_828d7
	ld a, BANK(Data_828d7)
	call Func_8063e_20
	ld bc, Data_828d3
	ld e, BANK(Data_828d3)
	ld a, $2
	call Func_80688_20
	call Func_8020c_20
	ld e, $2
	ld a, $2
	call Func_80095_20
Func_8298b: ; 8298b (20:698b)
	ret

Func_8298c:
	ld a, e
	or a
	jp nz, Func_8299a
	ld hl, $2a6
	call Func_804a9_20
	call Func_8045c_20
Func_8299a: ; 8299a (20:699a)
	ret

Func_8299b:
	ld a, e
	or a
	jp nz, Func_829d0
	ld a, $5
	call Func_8044b_20
	ld a, [$c78c]
	inc a
	ld [$c78c], a
	ld a, [$c78c]
	cp $15
	jp nz, Func_829b9
	ld a, $1
	ld [$c78c], a
Func_829b9: ; 829b9 (20:69b9)
	set_farcall_addrs_hli Func_bd6fa
	ld a, [$c78c]
	ld e, a
	ld d, $0
	ld hl, Data_829d1
	call FarCall
Func_829d0: ; 829d0 (20:69d0)
	ret

Data_829d1:
	dr $829d1, $829d9

Data_829d9: ; 829d9
	dr $829d9, $829dd

Func_829dd: ; 829dd (20:69dd)
	ld hl, $f8
	call Func_8062e_20
	or a
	jp nz, .asm_829fc
	ld c, $1
	ld de, Data_829d9
	ld a, BANK(Data_829d9)
	call Func_8063e_20
	call Func_8020c_20
	ld e, $1
	ld hl, $f8
	call Func_8061b_20
.asm_829fc
	ret

Func_829fd:
	push af
	ld a, e
	or a
	jp nz, Func_82ab6
	ld hl, sp+$1
	ld a, [hl]
	call Func_8044b_20
	ld hl, $114
	call Func_8062e_20
	or a
	jp nz, Func_82ab0
	ld a, $10
	call Func_80e5d_20
	or a
	jp z, Func_82a9b
	ld hl, $497
	call Func_804ba_20
	or a
	jp nz, Func_82a92
	ld a, $2b
	call Func_80efe_20
	ld c, $1
	ld e, $1
	ld a, $10
	call Func_80d4d_20
	ld a, [$c79c]
	or a
	jp nz, Func_82a43
	ld a, $2
	ld [$c79c], a
	jp Func_82a59

Func_82a43: ; 82a43 (20:6a43)
	ld a, [$c79c]
	or a
	jp nz, Func_82a52
	ld a, $2
	ld [$c79c], a
	jp Func_82a59

Func_82a52: ; 82a52 (20:6a52)
	ld a, [$c79c]
	inc a
	ld [$c79c], a
Func_82a59: ; 82a59 (20:6a59)
	ld hl, $498
	call Func_80498_20
	ld a, [$c79c]
	cp $9
	jp c, Func_82a8f
	ld hl, $499
	call Func_80498_20
	ld a, $2a
	call Func_80efe_20
	ld hl, $49a
	call Func_80498_20
	ld c, $0
	ld e, $1
	ld a, $18
	call Func_80d4d_20
	ld e, $1
	ld hl, $114
	call Func_8061b_20
	ld hl, $4a8
	call Func_80498_20
Func_82a8f: ; 82a8f (20:6a8f)
	jp Func_82a98

Func_82a92: ; 82a92 (20:6a92)
	ld hl, $496
	call Func_80498_20
Func_82a98: ; 82a98 (20:6a98)
	jp Func_82aad

Func_82a9b: ; 82a9b (20:6a9b)
	ld hl, $3ec
	call Func_80498_20
	ld a, [$c79c]
	or a
	jp nz, Func_82aad
	ld a, $1
	ld [$c79c], a
Func_82aad: ; 82aad (20:6aad)
	jp Func_82ab6

Func_82ab0: ; 82ab0 (20:6ab0)
	ld hl, $49c
	call Func_80498_20
Func_82ab6: ; 82ab6 (20:6ab6)
	pop bc
	ret


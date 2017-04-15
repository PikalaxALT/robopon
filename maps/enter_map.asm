map_trigger_ptr: MACRO
\1_Pointer::
	dba \1
	ENDM

EnterMap:: ; daa72 (36:6a72)
	push af
	push de
	set_farcall_addrs_hli GroupAndNumberToLinearIndex
	pop de
	pop af
	call FarCall
	ld c, l
	ld b, h
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, Pointers_daaad
	add hl, de
	inc hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	write_hl_to wFarCallDestAddr
	call FarCall
	ret

Func_daaac:
	ret

Pointers_daaad::
	map_trigger_ptr Func_81281 ; 00
	map_trigger_ptr Func_81ac1 ; 01
	map_trigger_ptr Func_81d6a ; 02
	map_trigger_ptr Func_8240c ; 03
	map_trigger_ptr Func_825cc ; 04
	map_trigger_ptr Func_827a9 ; 05
	map_trigger_ptr Func_82b03 ; 06
	map_trigger_ptr Func_82c44 ; 07
	map_trigger_ptr Func_82d7f ; 08
	map_trigger_ptr Func_82e70 ; 09
	map_trigger_ptr Func_82f08 ; 0a
	map_trigger_ptr Func_82fa8 ; 0b
	map_trigger_ptr Func_83169 ; 0c
	map_trigger_ptr Func_83213 ; 0d
	map_trigger_ptr Func_83340 ; 0e
	map_trigger_ptr Func_833ba ; 0f
	map_trigger_ptr Func_83431 ; 10
	map_trigger_ptr Func_834bd ; 11
	map_trigger_ptr Func_83537 ; 12
	map_trigger_ptr Func_835ae ; 13
	map_trigger_ptr Func_83632 ; 14
	map_trigger_ptr Func_836b1 ; 15
	map_trigger_ptr Func_83730 ; 16
	map_trigger_ptr Func_837aa ; 17
	map_trigger_ptr Func_83816 ; 18
	map_trigger_ptr Func_838a2 ; 19
	map_trigger_ptr Func_957b0 ; 1a
	map_trigger_ptr Func_95817 ; 1b
	map_trigger_ptr Func_958c2 ; 1c
	map_trigger_ptr Func_8d256 ; 1d
	map_trigger_ptr Func_85178 ; 1e
	map_trigger_ptr Func_85a1d ; 1f
	map_trigger_ptr Func_85cde ; 20
	map_trigger_ptr Func_85f6c ; 21
	map_trigger_ptr Func_863fb ; 22
	map_trigger_ptr Func_8688a ; 23
	map_trigger_ptr Func_86ffa ; 24
	map_trigger_ptr Func_871fe ; 25
	map_trigger_ptr Func_8744d ; 26
	map_trigger_ptr Func_877cb ; 27
	map_trigger_ptr Func_87d88 ; 28
	map_trigger_ptr Func_87ea2 ; 29
	map_trigger_ptr Func_8b65a ; 2a
	map_trigger_ptr Func_89161 ; 2b
	map_trigger_ptr Func_8966d ; 2c
	map_trigger_ptr Func_89a75 ; 2d
	map_trigger_ptr Func_89c58 ; 2e
	map_trigger_ptr Func_89eaf ; 2f
	map_trigger_ptr Func_8a1f3 ; 30
	map_trigger_ptr Func_8a69b ; 31
	map_trigger_ptr Func_8aa33 ; 32
	map_trigger_ptr Func_8af07 ; 33
	map_trigger_ptr Func_8afc4 ; 34
	map_trigger_ptr Func_8b49c ; 35
	map_trigger_ptr Func_8e5dc ; 36
	map_trigger_ptr Func_8deaa ; 37
	map_trigger_ptr Func_91189 ; 38
	map_trigger_ptr Func_91856 ; 39
	map_trigger_ptr Func_920c3 ; 3a
	map_trigger_ptr Func_92965 ; 3b
	map_trigger_ptr Func_92aab ; 3c
	map_trigger_ptr Func_92c92 ; 3d
	map_trigger_ptr Func_92e02 ; 3e
	map_trigger_ptr Func_951a3 ; 3f
	map_trigger_ptr Func_96dbb ; 40
	map_trigger_ptr Func_96e97 ; 41
	map_trigger_ptr Func_971d6 ; 42
	map_trigger_ptr Func_97486 ; 43
	map_trigger_ptr Func_9a168 ; 44
	map_trigger_ptr Func_9a169 ; 45
	map_trigger_ptr Func_9a16a ; 46
	map_trigger_ptr Func_9a16b ; 47
	map_trigger_ptr Func_9a16c ; 48
	map_trigger_ptr Func_9a16d ; 49
	map_trigger_ptr Func_9a16e ; 4a
	map_trigger_ptr Func_9a16f ; 4b
	map_trigger_ptr Func_9a170 ; 4c
	map_trigger_ptr Func_9a171 ; 4d
	map_trigger_ptr Func_9a172 ; 4e
	map_trigger_ptr Func_9a173 ; 4f
	map_trigger_ptr Func_9d1cb ; 50
	map_trigger_ptr Func_9dcf6 ; 51
	map_trigger_ptr Func_9e052 ; 52
	map_trigger_ptr Func_9e0f9 ; 53
	map_trigger_ptr Func_9e194 ; 54
	map_trigger_ptr Func_9e23a ; 55
	map_trigger_ptr Func_9e2cf ; 56
	map_trigger_ptr Func_9e4d8 ; 57
	map_trigger_ptr Func_9e95e ; 58
	map_trigger_ptr Func_9ea24 ; 59
	map_trigger_ptr Func_9eec4 ; 5a
	map_trigger_ptr Func_9ef0f ; 5b
	map_trigger_ptr Func_9ef10 ; 5c
	map_trigger_ptr Func_9ef8d ; 5d
	map_trigger_ptr Func_9f137 ; 5e
	map_trigger_ptr Func_9f1c9 ; 5f
	map_trigger_ptr Func_9f338 ; 60
	map_trigger_ptr Func_9f43f ; 61
	map_trigger_ptr Func_9f5a0 ; 62
	map_trigger_ptr Func_9f5e1 ; 63
	map_trigger_ptr Func_a30cd ; 64
	map_trigger_ptr Func_a32cf ; 65
	map_trigger_ptr Func_a34d1 ; 66
	map_trigger_ptr Func_a36ec ; 67
	map_trigger_ptr Func_a3788 ; 68
	map_trigger_ptr Func_a3789 ; 69
	map_trigger_ptr Func_a378a ; 6a
	map_trigger_ptr Func_a388c ; 6b
	map_trigger_ptr Func_a3b2f ; 6c
	map_trigger_ptr Func_a3bc8 ; 6d
	map_trigger_ptr Func_a3dc4 ; 6e
	map_trigger_ptr Func_a11de ; 6f
	map_trigger_ptr Func_a167b ; 70
	map_trigger_ptr Func_c916d ; 71
	map_trigger_ptr Func_c93a1 ; 72
	map_trigger_ptr Func_c980d ; 73
	map_trigger_ptr Func_c9d95 ; 74
	map_trigger_ptr Func_ca379 ; 75
	map_trigger_ptr Func_ca8dd ; 76
	map_trigger_ptr Func_cb099 ; 77
	map_trigger_ptr Func_cb2ef ; 78
	map_trigger_ptr Func_cb4c5 ; 79
	map_trigger_ptr Func_cb6d3 ; 7a
	map_trigger_ptr Func_cb8d6 ; 7b
	map_trigger_ptr Func_cba6d ; 7c
	map_trigger_ptr Func_a5126 ; 7d
	map_trigger_ptr Func_a544c ; 7e
	map_trigger_ptr Func_a6882 ; 7f
	map_trigger_ptr Func_a922b ; 80
	map_trigger_ptr Func_a973e ; 81
	map_trigger_ptr Func_a97f3 ; 82
	map_trigger_ptr Func_a98a2 ; 83
	map_trigger_ptr Func_a9957 ; 84
	map_trigger_ptr Func_a9a0c ; 85
	map_trigger_ptr Func_a9ac1 ; 86
	map_trigger_ptr Func_a9b7b ; 87
	map_trigger_ptr Func_a9c3d ; 88
	map_trigger_ptr Func_a9cfa ; 89
	map_trigger_ptr Func_a9db4 ; 8a
	map_trigger_ptr Func_a9e71 ; 8b
	map_trigger_ptr Func_a9f2b ; 8c
	map_trigger_ptr Func_aa083 ; 8d
	map_trigger_ptr Func_aa218 ; 8e
	map_trigger_ptr Func_aa5cb ; 8f
	map_trigger_ptr Func_aac19 ; 90
	map_trigger_ptr Func_aaed3 ; 91
	map_trigger_ptr Func_ab199 ; 92
	map_trigger_ptr Func_ab46b ; 93
	map_trigger_ptr Func_ab7cc ; 94
	map_trigger_ptr Func_abf90 ; 95
	map_trigger_ptr Func_ad122 ; 96
	map_trigger_ptr Func_ae48b ; 97
	map_trigger_ptr Func_ae6ea ; 98
	map_trigger_ptr Func_ae8e7 ; 99
	map_trigger_ptr Func_ae97d ; 9a
	map_trigger_ptr Func_aea1b ; 9b
	map_trigger_ptr Func_aeae1 ; 9c
	map_trigger_ptr Func_aeb98 ; 9d
	map_trigger_ptr Func_aed4a ; 9e
	map_trigger_ptr Func_aedf8 ; 9f
	map_trigger_ptr Func_af01b ; a0
	map_trigger_ptr Func_af29a ; a1
	map_trigger_ptr Func_af3e9 ; a2
	map_trigger_ptr Func_b10ea ; a3
	map_trigger_ptr Func_b138f ; a4
	map_trigger_ptr Func_d11ef ; a5
	map_trigger_ptr Func_d153f ; a6
	map_trigger_ptr Func_d1aff ; a7
	map_trigger_ptr Func_d1ec5 ; a8
	map_trigger_ptr Func_d21fc ; a9
	map_trigger_ptr Func_d259b ; aa
	map_trigger_ptr Func_d293a ; ab
	map_trigger_ptr Func_a1e57 ; ac
	map_trigger_ptr Func_a2271 ; ad
	map_trigger_ptr Func_a268b ; ae
	map_trigger_ptr Func_a2aa5 ; af
	map_trigger_ptr Func_a2ebf ; b0
	map_trigger_ptr Func_cd533 ; b1
	map_trigger_ptr Func_cdabd ; b2
	map_trigger_ptr Func_cdfc4 ; b3
	map_trigger_ptr Func_ceacc ; b4
	map_trigger_ptr Func_cf14d ; b5
	map_trigger_ptr Func_b5152 ; b6
	map_trigger_ptr Func_b5215 ; b7
	map_trigger_ptr Func_b52d3 ; b8
	map_trigger_ptr Func_b5391 ; b9
	map_trigger_ptr Func_b5452 ; ba
	map_trigger_ptr Func_b568e ; bb
	map_trigger_ptr Func_b576c ; bc
	map_trigger_ptr Func_b584a ; bd
	map_trigger_ptr Func_b5939 ; be
	map_trigger_ptr Func_b5ae8 ; bf
	map_trigger_ptr Func_b5bbb ; c0
	map_trigger_ptr Func_b5c99 ; c1
	map_trigger_ptr Func_b5d6c ; c2
	map_trigger_ptr Func_b5e4a ; c3
	map_trigger_ptr Func_b5fbe ; c4
	map_trigger_ptr Func_b790a ; c5
	map_trigger_ptr Func_b79f8 ; c6
	map_trigger_ptr Func_b7a64 ; c7
	map_trigger_ptr Func_b93f1 ; c8
	map_trigger_ptr Func_b9bbe ; c9
	map_trigger_ptr Func_ba46c ; ca
	map_trigger_ptr Func_ba7e9 ; cb
	map_trigger_ptr Func_bb17a ; cc
	map_trigger_ptr Func_bb44e ; cd
	map_trigger_ptr Func_d2c2a ; ce
	map_trigger_ptr Func_d2e9d ; cf
	map_trigger_ptr Func_d3312 ; d0
	map_trigger_ptr Func_d367a ; d1
	map_trigger_ptr Func_d392b ; d2
	map_trigger_ptr Func_d3ceb ; d3

MACRO map_trigger_ptr
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
	ld de, MapTriggerPointers
	add hl, de
	ld a, [hl]
	ld [wFarCallDestBank], a
	ld l, c
	ld h, b
	ld e, l
	ld d, h
	add hl, hl
	add hl, de
	ld de, MapTriggerPointers
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

MapTriggerPointers::
	map_trigger_ptr Func_81281 ; 00, MAP_00_00
	map_trigger_ptr Func_81ac1 ; 01, MAP_00_01
	map_trigger_ptr Func_81d6a ; 02, MAP_00_02
	map_trigger_ptr Func_8240c ; 03, MAP_00_03
	map_trigger_ptr Func_825cc ; 04, MAP_00_04
	map_trigger_ptr Func_827a9 ; 05, MAP_00_10
	map_trigger_ptr Func_82b03 ; 06, MAP_00_11
	map_trigger_ptr Func_82c44 ; 07, MAP_00_12
	map_trigger_ptr Func_82d7f ; 08, MAP_00_13
	map_trigger_ptr Func_82e70 ; 09, MAP_00_14
	map_trigger_ptr Func_82f08 ; 0a, MAP_00_15
	map_trigger_ptr Func_82fa8 ; 0b, MAP_00_16
	map_trigger_ptr Func_83169 ; 0c, MAP_00_17
	map_trigger_ptr Func_83213 ; 0d, MAP_00_18
	map_trigger_ptr Func_83340 ; 0e, MAP_00_19
	map_trigger_ptr Func_833ba ; 0f, MAP_00_20
	map_trigger_ptr Func_83431 ; 10, MAP_00_21
	map_trigger_ptr Func_834bd ; 11, MAP_00_22
	map_trigger_ptr Func_83537 ; 12, MAP_00_23
	map_trigger_ptr Func_835ae ; 13, MAP_00_24
	map_trigger_ptr Func_83632 ; 14, MAP_00_25
	map_trigger_ptr Func_836b1 ; 15, MAP_00_26
	map_trigger_ptr Func_83730 ; 16, MAP_00_27
	map_trigger_ptr Func_837aa ; 17, MAP_00_28
	map_trigger_ptr Func_83816 ; 18, MAP_00_29
	map_trigger_ptr Func_838a2 ; 19, MAP_00_30
	map_trigger_ptr Func_957b0 ; 1a, MAP_00_31
	map_trigger_ptr Func_95817 ; 1b, MAP_00_32
	map_trigger_ptr Func_958c2 ; 1c, MAP_00_33
	map_trigger_ptr Func_8d256 ; 1d, MAP_01_00
	map_trigger_ptr Func_85178 ; 1e, MAP_02_00
	map_trigger_ptr Func_85a1d ; 1f, MAP_02_01
	map_trigger_ptr Func_85cde ; 20, MAP_02_02
	map_trigger_ptr Func_85f6c ; 21, MAP_02_03
	map_trigger_ptr Func_863fb ; 22, MAP_02_04
	map_trigger_ptr Func_8688a ; 23, MAP_02_08
	map_trigger_ptr Func_86ffa ; 24, MAP_03_00
	map_trigger_ptr Func_871fe ; 25, MAP_03_10
	map_trigger_ptr Func_8744d ; 26, MAP_03_11
	map_trigger_ptr Func_877cb ; 27, MAP_03_12
	map_trigger_ptr Func_87d88 ; 28, MAP_03_13
	map_trigger_ptr Func_87ea2 ; 29, MAP_03_14
	map_trigger_ptr Func_8b65a ; 2a, MAP_03_15
	map_trigger_ptr Func_89161 ; 2b, MAP_04_01
	map_trigger_ptr Func_8966d ; 2c, MAP_05_00
	map_trigger_ptr Func_89a75 ; 2d, MAP_05_20
	map_trigger_ptr Func_89c58 ; 2e, MAP_05_21
	map_trigger_ptr Func_89eaf ; 2f, MAP_05_30
	map_trigger_ptr Func_8a1f3 ; 30, MAP_05_31
	map_trigger_ptr Func_8a69b ; 31, MAP_05_32
	map_trigger_ptr Func_8aa33 ; 32, MAP_05_33
	map_trigger_ptr Func_8af07 ; 33, MAP_05_34
	map_trigger_ptr Func_8afc4 ; 34, MAP_05_35
	map_trigger_ptr Func_8b49c ; 35, MAP_05_36
	map_trigger_ptr Func_8e5dc ; 36, MAP_06_00
	map_trigger_ptr Func_8deaa ; 37, MAP_07_00
	map_trigger_ptr Func_91189 ; 38, MAP_08_00
	map_trigger_ptr Func_91856 ; 39, MAP_08_01
	map_trigger_ptr Func_920c3 ; 3a, MAP_09_00
	map_trigger_ptr Func_92965 ; 3b, MAP_09_01
	map_trigger_ptr Func_92aab ; 3c, MAP_09_02
	map_trigger_ptr Func_92c92 ; 3d, MAP_09_03
	map_trigger_ptr Func_92e02 ; 3e, MAP_09_04
	map_trigger_ptr Func_951a3 ; 3f, MAP_11_00
	map_trigger_ptr Func_96dbb ; 40, MAP_12_00
	map_trigger_ptr Func_96e97 ; 41, MAP_12_01
	map_trigger_ptr Func_971d6 ; 42, MAP_12_02
	map_trigger_ptr Func_97486 ; 43, MAP_12_03
	map_trigger_ptr Func_9a168 ; 44, MAP_17_00
	map_trigger_ptr Func_9a169 ; 45, MAP_17_01
	map_trigger_ptr Func_9a16a ; 46, MAP_17_10
	map_trigger_ptr Func_9a16b ; 47, MAP_17_11
	map_trigger_ptr Func_9a16c ; 48, MAP_17_12
	map_trigger_ptr Func_9a16d ; 49, MAP_17_13
	map_trigger_ptr Func_9a16e ; 4a, MAP_17_14
	map_trigger_ptr Func_9a16f ; 4b, MAP_17_15
	map_trigger_ptr Func_9a170 ; 4c, MAP_17_16
	map_trigger_ptr Func_9a171 ; 4d, MAP_17_17
	map_trigger_ptr Func_9a172 ; 4e, MAP_17_18
	map_trigger_ptr Func_9a173 ; 4f, MAP_17_19
	map_trigger_ptr Func_9d1cb ; 50, MAP_18_00
	map_trigger_ptr Func_9dcf6 ; 51, MAP_18_01
	map_trigger_ptr Func_9e052 ; 52, MAP_18_10
	map_trigger_ptr Func_9e0f9 ; 53, MAP_18_11
	map_trigger_ptr Func_9e194 ; 54, MAP_18_12
	map_trigger_ptr Func_9e23a ; 55, MAP_18_13
	map_trigger_ptr Func_9e2cf ; 56, MAP_18_14
	map_trigger_ptr Func_9e4d8 ; 57, MAP_18_15
	map_trigger_ptr Func_9e95e ; 58, MAP_18_16
	map_trigger_ptr Func_9ea24 ; 59, MAP_18_17
	map_trigger_ptr Func_9eec4 ; 5a, MAP_18_18
	map_trigger_ptr Func_9ef0f ; 5b, MAP_19_00
	map_trigger_ptr Func_9ef10 ; 5c, MAP_19_01
	map_trigger_ptr Func_9ef8d ; 5d, MAP_19_02
	map_trigger_ptr Func_9f137 ; 5e, MAP_19_03
	map_trigger_ptr Func_9f1c9 ; 5f, MAP_19_10
	map_trigger_ptr Func_9f338 ; 60, MAP_19_11
	map_trigger_ptr Func_9f43f ; 61, MAP_19_20
	map_trigger_ptr Func_9f5a0 ; 62, MAP_19_21
	map_trigger_ptr Func_9f5e1 ; 63, MAP_19_22
	map_trigger_ptr Func_a30cd ; 64, MAP_19_30
	map_trigger_ptr Func_a32cf ; 65, MAP_19_31
	map_trigger_ptr Func_a34d1 ; 66, MAP_19_32
	map_trigger_ptr Func_a36ec ; 67, MAP_19_33
	map_trigger_ptr Func_a3788 ; 68, MAP_19_34
	map_trigger_ptr Func_a3789 ; 69, MAP_19_35
	map_trigger_ptr Func_a378a ; 6a, MAP_19_36
	map_trigger_ptr Func_a388c ; 6b, MAP_19_37
	map_trigger_ptr Func_a3b2f ; 6c, MAP_19_38
	map_trigger_ptr Func_a3bc8 ; 6d, MAP_19_39
	map_trigger_ptr Func_a3dc4 ; 6e, MAP_19_40
	map_trigger_ptr Func_a11de ; 6f, MAP_20_00
	map_trigger_ptr Func_a167b ; 70, MAP_20_01
	map_trigger_ptr Func_c916d ; 71, MAP_21_00
	map_trigger_ptr Func_c93a1 ; 72, MAP_21_10
	map_trigger_ptr Func_c980d ; 73, MAP_21_11
	map_trigger_ptr Func_c9d95 ; 74, MAP_21_12
	map_trigger_ptr Func_ca379 ; 75, MAP_21_13
	map_trigger_ptr Func_ca8dd ; 76, MAP_21_14
	map_trigger_ptr Func_cb099 ; 77, MAP_21_20
	map_trigger_ptr Func_cb2ef ; 78, MAP_21_21
	map_trigger_ptr Func_cb4c5 ; 79, MAP_21_22
	map_trigger_ptr Func_cb6d3 ; 7a, MAP_21_23
	map_trigger_ptr Func_cb8d6 ; 7b, MAP_21_24
	map_trigger_ptr Func_cba6d ; 7c, MAP_21_25
	map_trigger_ptr Func_a5126 ; 7d, MAP_22_00
	map_trigger_ptr Func_a544c ; 7e, MAP_22_01
	map_trigger_ptr Func_a6882 ; 7f, MAP_23_00
	map_trigger_ptr Func_a922b ; 80, MAP_24_00
	map_trigger_ptr Func_a973e ; 81, MAP_24_10
	map_trigger_ptr Func_a97f3 ; 82, MAP_24_11
	map_trigger_ptr Func_a98a2 ; 83, MAP_24_12
	map_trigger_ptr Func_a9957 ; 84, MAP_24_13
	map_trigger_ptr Func_a9a0c ; 85, MAP_24_14
	map_trigger_ptr Func_a9ac1 ; 86, MAP_24_15
	map_trigger_ptr Func_a9b7b ; 87, MAP_24_16
	map_trigger_ptr Func_a9c3d ; 88, MAP_24_17
	map_trigger_ptr Func_a9cfa ; 89, MAP_24_18
	map_trigger_ptr Func_a9db4 ; 8a, MAP_24_19
	map_trigger_ptr Func_a9e71 ; 8b, MAP_24_20
	map_trigger_ptr Func_a9f2b ; 8c, MAP_24_21
	map_trigger_ptr Func_aa083 ; 8d, MAP_24_22
	map_trigger_ptr Func_aa218 ; 8e, MAP_25_00
	map_trigger_ptr Func_aa5cb ; 8f, MAP_25_01
	map_trigger_ptr Func_aac19 ; 90, MAP_25_02
	map_trigger_ptr Func_aaed3 ; 91, MAP_25_03
	map_trigger_ptr Func_ab199 ; 92, MAP_25_04
	map_trigger_ptr Func_ab46b ; 93, MAP_25_05
	map_trigger_ptr Func_ab7cc ; 94, MAP_25_10
	map_trigger_ptr Func_abf90 ; 95, MAP_25_20
	map_trigger_ptr Func_ad122 ; 96, MAP_26_00
	map_trigger_ptr Func_ae48b ; 97, MAP_27_00
	map_trigger_ptr Func_ae6ea ; 98, MAP_27_01
	map_trigger_ptr Func_ae8e7 ; 99, MAP_27_02
	map_trigger_ptr Func_ae97d ; 9a, MAP_27_03
	map_trigger_ptr Func_aea1b ; 9b, MAP_27_04
	map_trigger_ptr Func_aeae1 ; 9c, MAP_27_05
	map_trigger_ptr Func_aeb98 ; 9d, MAP_27_06
	map_trigger_ptr Func_aed4a ; 9e, MAP_27_07
	map_trigger_ptr Func_aedf8 ; 9f, MAP_27_08
	map_trigger_ptr Func_af01b ; a0, MAP_27_09
	map_trigger_ptr Func_af29a ; a1, MAP_27_10
	map_trigger_ptr Func_af3e9 ; a2, MAP_27_11
	map_trigger_ptr Func_b10ea ; a3, MAP_28_00
	map_trigger_ptr Func_b138f ; a4, MAP_28_01
	map_trigger_ptr Func_d11ef ; a5, MAP_29_00
	map_trigger_ptr Func_d153f ; a6, MAP_29_01
	map_trigger_ptr Func_d1aff ; a7, MAP_29_10
	map_trigger_ptr Func_d1ec5 ; a8, MAP_29_11
	map_trigger_ptr Func_d21fc ; a9, MAP_29_12
	map_trigger_ptr Func_d259b ; aa, MAP_29_13
	map_trigger_ptr Func_d293a ; ab, MAP_29_14
	map_trigger_ptr Func_a1e57 ; ac, MAP_29_20
	map_trigger_ptr Func_a2271 ; ad, MAP_29_21
	map_trigger_ptr Func_a268b ; ae, MAP_29_22
	map_trigger_ptr Func_a2aa5 ; af, MAP_29_23
	map_trigger_ptr Func_a2ebf ; b0, MAP_29_24
	map_trigger_ptr Func_cd533 ; b1, MAP_29_30
	map_trigger_ptr Func_cdabd ; b2, MAP_29_31
	map_trigger_ptr Func_cdfc4 ; b3, MAP_29_32
	map_trigger_ptr Func_ceacc ; b4, MAP_29_33
	map_trigger_ptr Func_cf14d ; b5, MAP_29_34
	map_trigger_ptr Func_b5152 ; b6, MAP_30_00
	map_trigger_ptr Func_b5215 ; b7, MAP_30_01
	map_trigger_ptr Func_b52d3 ; b8, MAP_30_02
	map_trigger_ptr Func_b5391 ; b9, MAP_30_03
	map_trigger_ptr Func_b5452 ; ba, MAP_30_04
	map_trigger_ptr Func_b568e ; bb, MAP_30_05
	map_trigger_ptr Func_b576c ; bc, MAP_30_06
	map_trigger_ptr Func_b584a ; bd, MAP_30_07
	map_trigger_ptr Func_b5939 ; be, MAP_30_08
	map_trigger_ptr Func_b5ae8 ; bf, MAP_30_09
	map_trigger_ptr Func_b5bbb ; c0, MAP_30_10
	map_trigger_ptr Func_b5c99 ; c1, MAP_30_11
	map_trigger_ptr Func_b5d6c ; c2, MAP_30_12
	map_trigger_ptr Func_b5e4a ; c3, MAP_30_13
	map_trigger_ptr Func_b5fbe ; c4, MAP_30_14
	map_trigger_ptr Func_b790a ; c5, MAP_31_00
	map_trigger_ptr Func_b79f8 ; c6, MAP_31_01
	map_trigger_ptr Func_b7a64 ; c7, MAP_31_02
	map_trigger_ptr Func_b93f1 ; c8, MAP_32_00
	map_trigger_ptr Func_b9bbe ; c9, MAP_32_01
	map_trigger_ptr Func_ba46c ; ca, MAP_32_02
	map_trigger_ptr Func_ba7e9 ; cb, MAP_32_03
	map_trigger_ptr Func_bb17a ; cc, MAP_32_04
	map_trigger_ptr Func_bb44e ; cd, MAP_32_05
	map_trigger_ptr Func_d2c2a ; ce, MAP_32_06
	map_trigger_ptr Func_d2e9d ; cf, MAP_32_07
	map_trigger_ptr Func_d3312 ; d0, MAP_32_08
	map_trigger_ptr Func_d367a ; d1, MAP_32_09
	map_trigger_ptr Func_d392b ; d2, MAP_32_10
	map_trigger_ptr Func_d3ceb ; d3, MAP_32_11

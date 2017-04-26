SECTION "Bank 0a", ROMX, BANK [$a]
BlockDataHeaders:: ; 28000
blockdataheader: MACRO
	dbw BANK(\1) - BANK(BlockDataHeaders), \1
IF _NARG == 2
	db \2_WIDTH, \2_HEIGHT ; dimensions
ELSE
	db \2, \3
ENDC
	ENDM

	blockdataheader BlockData_28424, MAP_0_0
	blockdataheader BlockData_284fe, MAP_0_1
	blockdataheader BlockData_2852a, MAP_0_2
	blockdataheader BlockData_2854f, MAP_0_3
	blockdataheader BlockData_28586, MAP_0_4
	blockdataheader BlockData_285b8, 15, 15
	blockdataheader BlockData_28616, 10, 11
	blockdataheader BlockData_28654, 10, 11
	blockdataheader BlockData_28691, 10, 11
	blockdataheader BlockData_286d1, 10, 11
	blockdataheader BlockData_286f9, MAP_0_5
	blockdataheader BlockData_2871d, MAP_0_6
	blockdataheader BlockData_28740, MAP_0_7
	blockdataheader BlockData_28771, MAP_0_8
	blockdataheader BlockData_287aa, MAP_0_9
	blockdataheader BlockData_287d3, MAP_0_10
	blockdataheader BlockData_28812, MAP_0_11
	blockdataheader BlockData_28847, MAP_0_12
	blockdataheader BlockData_28881, MAP_0_13
	blockdataheader BlockData_288c0, MAP_0_14
	blockdataheader BlockData_288e9, MAP_0_15
	blockdataheader BlockData_2892a, MAP_0_16
	blockdataheader BlockData_28963, MAP_0_17
	blockdataheader BlockData_2899e, MAP_0_18
	blockdataheader BlockData_289c2, MAP_0_19
	blockdataheader BlockData_289e8, MAP_0_20
	blockdataheader BlockData_28a19, MAP_0_21
	blockdataheader BlockData_28a4c, MAP_0_22
	blockdataheader BlockData_28a79, MAP_0_23
	blockdataheader BlockData_28ad1, MAP_1_0
	blockdataheader BlockData_28c12, MAP_2_0
	blockdataheader BlockData_28cee, MAP_2_1
	blockdataheader BlockData_28d24, MAP_2_2
	blockdataheader BlockData_28d56, MAP_2_3
	blockdataheader BlockData_28d89, MAP_2_4
	blockdataheader BlockData_28dbc, 22, 19
	blockdataheader BlockData_28e49, MAP_3_0
	blockdataheader BlockData_28fb5, 19, 16
	blockdataheader BlockData_2900b, MAP_2_5
	blockdataheader BlockData_29070, 20, 25
	blockdataheader BlockData_29102, 22, 24
	blockdataheader BlockData_29166, 22, 24
	blockdataheader BlockData_291d4, 13, 9
	blockdataheader BlockData_29212, 20, 20
	blockdataheader BlockData_2928c, MAP_5_0
	blockdataheader BlockData_293d2, 20, 20
	blockdataheader BlockData_29465, MAP_3_1
	blockdataheader BlockData_294cf, MAP_3_2
	blockdataheader BlockData_2955e, MAP_3_3
	blockdataheader BlockData_295d1, MAP_3_4
	blockdataheader BlockData_29663, MAP_3_5
	blockdataheader BlockData_296ea, MAP_3_6
	blockdataheader BlockData_2975d, 20, 20
	blockdataheader BlockData_297e5, 20, 20
	blockdataheader BlockData_29879, MAP_6_0
	blockdataheader BlockData_29963, MAP_7_0
	blockdataheader BlockData_299fe, MAP_8_0
	blockdataheader BlockData_29a64, MAP_8_1
	blockdataheader BlockData_29a9c, MAP_9_0
	blockdataheader BlockData_29bc6, MAP_9_1
	blockdataheader BlockData_29c31, MAP_9_2
	blockdataheader BlockData_29cd9, MAP_9_3
	blockdataheader BlockData_29d8d, MAP_9_4
	blockdataheader BlockData_29dac, MAP_11_0
	blockdataheader BlockData_29e9e, MAP_12_0
	blockdataheader BlockData_29f4a, MAP_12_1
	blockdataheader BlockData_2a03b, MAP_12_2
	blockdataheader BlockData_2a0ce, MAP_12_3
	blockdataheader BlockData_2a0ee, MAP_17_0
	blockdataheader BlockData_2a202, MAP_17_1
	blockdataheader BlockData_2a236, 16, 16
	blockdataheader BlockData_2a26f, 24, 24
	blockdataheader BlockData_2a322, 24, 24
	blockdataheader BlockData_2a3d7, 22, 31
	blockdataheader BlockData_2a4d3, MAP_5_3
	blockdataheader BlockData_2a5e9, MAP_5_4
	blockdataheader BlockData_2a6bf, MAP_5_5
	blockdataheader BlockData_2a7b5, MAP_5_6
	blockdataheader BlockData_2a89f, MAP_17_2
	blockdataheader BlockData_2a995, MAP_17_3
	blockdataheader BlockData_2aa7b, MAP_18_0
	blockdataheader BlockData_2ab4e, MAP_18_1
	blockdataheader BlockData_2abc6, MAP_17_6
	blockdataheader BlockData_2ac09, MAP_17_7
	blockdataheader BlockData_2aca6, MAP_17_8
	blockdataheader BlockData_2ad42, MAP_17_9
	blockdataheader BlockData_2addb, MAP_17_10
	blockdataheader BlockData_2ae0b, MAP_17_11
	blockdataheader BlockData_2ae61, 11, 8
	blockdataheader BlockData_2ae7b, 15, 9
	blockdataheader BlockData_2aebf, MAP_18_2
	blockdataheader BlockData_2aed8, MAP_19_0
	blockdataheader BlockData_2af27, MAP_19_1
	blockdataheader BlockData_2af8c, MAP_19_2
	blockdataheader BlockData_2aff3, MAP_19_3
	blockdataheader BlockData_2b109, MAP_18_7
	blockdataheader BlockData_2b188, MAP_18_8
	blockdataheader BlockData_2b1fd, MAP_18_9
	blockdataheader BlockData_2b2e2, MAP_18_10
	blockdataheader BlockData_2b340, 34, 25
	blockdataheader BlockData_2b3ff, 14, 14
	blockdataheader BlockData_2b434, MAP_19_4
	blockdataheader BlockData_2b471, MAP_19_5
	blockdataheader BlockData_2b4ac, 24, 13
	blockdataheader BlockData_2b513, 15, 13
	blockdataheader BlockData_2b538, 15, 13
	blockdataheader BlockData_2b554, 15, 13
	blockdataheader BlockData_2b589, 15, 13
	blockdataheader BlockData_2b5bc, 15, 13
	blockdataheader BlockData_2b5f9, 36, 12
	blockdataheader BlockData_2b667, 13, 11
	blockdataheader BlockData_2b6a7, MAP_20_0
	blockdataheader BlockData_2b78a, MAP_20_1
	blockdataheader BlockData_2b7c3, MAP_21_0
	blockdataheader BlockData_2b90c, 20, 20
	blockdataheader BlockData_2b99a, 20, 20
	blockdataheader BlockData_2ba25, 20, 20
	blockdataheader BlockData_2bac1, 20, 20
	blockdataheader BlockData_2bb4a, 20, 20
	blockdataheader BlockData_2bbe0, 20, 20
	blockdataheader BlockData_2bc81, 20, 20
	blockdataheader BlockData_2bd1d, MAP_19_9
	blockdataheader BlockData_2bda9, MAP_19_10
	blockdataheader BlockData_2be50, MAP_21_1
	blockdataheader BlockData_2bec2, MAP_21_2
	blockdataheader BlockData_2bf58, MAP_22_0
	blockdataheader BlockData_2c000, MAP_22_1
	blockdataheader BlockData_2c059, MAP_23_0
	blockdataheader BlockData_2c159, MAP_24_0
	blockdataheader BlockData_2c2b3, MAP_19_17
	blockdataheader BlockData_2c2df, MAP_19_18
	blockdataheader BlockData_2c33e, MAP_19_19
	blockdataheader BlockData_2c3ad, 21, 23
	blockdataheader BlockData_2c412, MAP_21_6
	blockdataheader BlockData_2c472, MAP_21_7
	blockdataheader BlockData_2c4d7, MAP_21_8
	blockdataheader BlockData_2c543, MAP_21_9
	blockdataheader BlockData_2c5ae, MAP_21_10
	blockdataheader BlockData_2c60c, MAP_24_1
	blockdataheader BlockData_2c679, MAP_24_2
	blockdataheader BlockData_2c6e3, MAP_24_3
	blockdataheader BlockData_2c748, MAP_24_4
	blockdataheader BlockData_2c76b, MAP_25_0
	blockdataheader BlockData_2c812, MAP_25_1
	blockdataheader BlockData_2c965, MAP_25_2
	blockdataheader BlockData_2c98d, MAP_25_3
	blockdataheader BlockData_2c9b7, MAP_25_4
	blockdataheader BlockData_2ca02, MAP_25_5
	blockdataheader BlockData_2ca4a, MAP_24_11
	blockdataheader BlockData_2cbb9, MAP_24_12
	blockdataheader BlockData_2cd95, MAP_26_0
	blockdataheader BlockData_2ce14, MAP_27_0
	blockdataheader BlockData_2cf4c, MAP_27_1
	blockdataheader BlockData_2cfd0, MAP_27_2
	blockdataheader BlockData_2d056, MAP_27_3
	blockdataheader BlockData_2d0f6, MAP_27_4
	blockdataheader BlockData_2d171, MAP_27_5
	blockdataheader BlockData_2d213, MAP_27_6
	blockdataheader BlockData_2d281, MAP_27_7
	blockdataheader BlockData_2d2dd, MAP_27_8
	blockdataheader BlockData_2d383, MAP_27_9
	blockdataheader BlockData_2d40d, MAP_27_10
	blockdataheader BlockData_2d4d3, MAP_27_11
	blockdataheader BlockData_2d521, MAP_28_0
	blockdataheader BlockData_2d5a8, MAP_28_1
	blockdataheader BlockData_2d6b0, MAP_29_0
	blockdataheader BlockData_2d7c2, MAP_29_1
	blockdataheader BlockData_2d822, 25, 24
	blockdataheader BlockData_2d8a4, 21, 26
	blockdataheader BlockData_2d916, 26, 26
	blockdataheader BlockData_2d989, 30, 32
	blockdataheader BlockData_2da3c, 25, 29
	blockdataheader BlockData_2dabf, 24, 27
	blockdataheader BlockData_2db2d, 32, 36
	blockdataheader BlockData_2dbe6, 32, 35
	blockdataheader BlockData_2dcc3, MAP_29_2
	blockdataheader BlockData_2dd62, MAP_29_3
	blockdataheader BlockData_2de5e, MAP_29_4
	blockdataheader BlockData_2dfb4, MAP_29_5
	blockdataheader BlockData_2e072, MAP_29_6
	blockdataheader BlockData_2e0e5, 31, 32
	blockdataheader BlockData_2e1da, 35, 32
	blockdataheader BlockData_2e30a, MAP_30_0
	blockdataheader BlockData_2e41c, MAP_30_1
	blockdataheader BlockData_2e50e, MAP_30_2
	blockdataheader BlockData_2e5f7, MAP_30_3
	blockdataheader BlockData_2e70d, MAP_30_4
	blockdataheader BlockData_2e75d, MAP_30_5
	blockdataheader BlockData_2e7a9, MAP_30_6
	blockdataheader BlockData_2e7ff, MAP_30_7
	blockdataheader BlockData_2e852, MAP_30_8
	blockdataheader BlockData_2e8a6, MAP_30_9
	blockdataheader BlockData_2e8f7, MAP_30_10
	blockdataheader BlockData_2e948, MAP_30_11
	blockdataheader BlockData_2e98d, MAP_30_12
	blockdataheader BlockData_2e9db, MAP_30_13
	blockdataheader BlockData_2ea2a, MAP_30_14
	blockdataheader BlockData_2eaa0, MAP_31_0
	blockdataheader BlockData_2eae9, MAP_31_1
	blockdataheader BlockData_2eb70, MAP_31_2
	blockdataheader BlockData_2ebeb, MAP_32_0
	blockdataheader BlockData_2ec12, MAP_32_1
	blockdataheader BlockData_2ec51, MAP_32_2
	blockdataheader BlockData_2eca8, MAP_32_3
	blockdataheader BlockData_2ece0, MAP_32_4
	blockdataheader BlockData_2ed13, MAP_32_5
	blockdataheader BlockData_2ed6a, MAP_32_6
	blockdataheader BlockData_2edc6, MAP_32_7
	blockdataheader BlockData_2ee0e, MAP_32_8
	blockdataheader BlockData_2ee56, MAP_32_9
	blockdataheader BlockData_2ee6a, MAP_32_10
	blockdataheader BlockData_2eeae, MAP_32_11

BlockData_28424: INCBIN "maps/block_data/blockdata_28424.blk.rz"
BlockData_284fe: INCBIN "maps/block_data/blockdata_284fe.blk.rz"
BlockData_2852a: INCBIN "maps/block_data/blockdata_2852a.blk.rz"
BlockData_2854f: INCBIN "maps/block_data/blockdata_2854f.blk.rz"
BlockData_28586: INCBIN "maps/block_data/blockdata_28586.blk.rz"
BlockData_285b8: INCBIN "maps/block_data/blockdata_285b8.blk.rz"
BlockData_28616: INCBIN "maps/block_data/blockdata_28616.blk.rz"
BlockData_28654: INCBIN "maps/block_data/blockdata_28654.blk.rz"
BlockData_28691: INCBIN "maps/block_data/blockdata_28691.blk.rz"
BlockData_286d1: INCBIN "maps/block_data/blockdata_286d1.blk.rz"
BlockData_286f9: INCBIN "maps/block_data/blockdata_286f9.blk.rz"
BlockData_2871d: INCBIN "maps/block_data/blockdata_2871d.blk.rz"
BlockData_28740: INCBIN "maps/block_data/blockdata_28740.blk.rz"
BlockData_28771: INCBIN "maps/block_data/blockdata_28771.blk.rz"
BlockData_287aa: INCBIN "maps/block_data/blockdata_287aa.blk.rz"
BlockData_287d3: INCBIN "maps/block_data/blockdata_287d3.blk.rz"
BlockData_28812: INCBIN "maps/block_data/blockdata_28812.blk.rz"
BlockData_28847: INCBIN "maps/block_data/blockdata_28847.blk.rz"
BlockData_28881: INCBIN "maps/block_data/blockdata_28881.blk.rz"
BlockData_288c0: INCBIN "maps/block_data/blockdata_288c0.blk.rz"
BlockData_288e9: INCBIN "maps/block_data/blockdata_288e9.blk.rz"
BlockData_2892a: INCBIN "maps/block_data/blockdata_2892a.blk.rz"
BlockData_28963: INCBIN "maps/block_data/blockdata_28963.blk.rz"
BlockData_2899e: INCBIN "maps/block_data/blockdata_2899e.blk.rz"
BlockData_289c2: INCBIN "maps/block_data/blockdata_289c2.blk.rz"
BlockData_289e8: INCBIN "maps/block_data/blockdata_289e8.blk.rz"
BlockData_28a19: INCBIN "maps/block_data/blockdata_28a19.blk.rz"
BlockData_28a4c: INCBIN "maps/block_data/blockdata_28a4c.blk.rz"
BlockData_28a79: INCBIN "maps/block_data/blockdata_28a79.blk.rz"
BlockData_28ad1: INCBIN "maps/block_data/blockdata_28ad1.blk.rz"
BlockData_28c12: INCBIN "maps/block_data/blockdata_28c12.blk.rz"
BlockData_28cee: INCBIN "maps/block_data/blockdata_28cee.blk.rz"
BlockData_28d24: INCBIN "maps/block_data/blockdata_28d24.blk.rz"
BlockData_28d56: INCBIN "maps/block_data/blockdata_28d56.blk.rz"
BlockData_28d89: INCBIN "maps/block_data/blockdata_28d89.blk.rz"
BlockData_28dbc: INCBIN "maps/block_data/blockdata_28dbc.blk.rz"
BlockData_28e49: INCBIN "maps/block_data/blockdata_28e49.blk.rz"
BlockData_28fb5: INCBIN "maps/block_data/blockdata_28fb5.blk.rz"
BlockData_2900b: INCBIN "maps/block_data/blockdata_2900b.blk.rz"
BlockData_29070: INCBIN "maps/block_data/blockdata_29070.blk.rz"
BlockData_29102: INCBIN "maps/block_data/blockdata_29102.blk.rz"
BlockData_29166: INCBIN "maps/block_data/blockdata_29166.blk.rz"
BlockData_291d4: INCBIN "maps/block_data/blockdata_291d4.blk.rz"
BlockData_29212: INCBIN "maps/block_data/blockdata_29212.blk.rz"
BlockData_2928c: INCBIN "maps/block_data/blockdata_2928c.blk.rz"
BlockData_293d2: INCBIN "maps/block_data/blockdata_293d2.blk.rz"
BlockData_29465: INCBIN "maps/block_data/blockdata_29465.blk.rz"
BlockData_294cf: INCBIN "maps/block_data/blockdata_294cf.blk.rz"
BlockData_2955e: INCBIN "maps/block_data/blockdata_2955e.blk.rz"
BlockData_295d1: INCBIN "maps/block_data/blockdata_295d1.blk.rz"
BlockData_29663: INCBIN "maps/block_data/blockdata_29663.blk.rz"
BlockData_296ea: INCBIN "maps/block_data/blockdata_296ea.blk.rz"
BlockData_2975d: INCBIN "maps/block_data/blockdata_2975d.blk.rz"
BlockData_297e5: INCBIN "maps/block_data/blockdata_297e5.blk.rz"
BlockData_29879: INCBIN "maps/block_data/blockdata_29879.blk.rz"
BlockData_29963: INCBIN "maps/block_data/blockdata_29963.blk.rz"
BlockData_299fe: INCBIN "maps/block_data/blockdata_299fe.blk.rz"
BlockData_29a64: INCBIN "maps/block_data/blockdata_29a64.blk.rz"
BlockData_29a9c: INCBIN "maps/block_data/blockdata_29a9c.blk.rz"
BlockData_29bc6: INCBIN "maps/block_data/blockdata_29bc6.blk.rz"
BlockData_29c31: INCBIN "maps/block_data/blockdata_29c31.blk.rz"
BlockData_29cd9: INCBIN "maps/block_data/blockdata_29cd9.blk.rz"
BlockData_29d8d: INCBIN "maps/block_data/blockdata_29d8d.blk.rz"
BlockData_29dac: INCBIN "maps/block_data/blockdata_29dac.blk.rz"
BlockData_29e9e: INCBIN "maps/block_data/blockdata_29e9e.blk.rz"
BlockData_29f4a: INCBIN "maps/block_data/blockdata_29f4a.blk.rz"
BlockData_2a03b: INCBIN "maps/block_data/blockdata_2a03b.blk.rz"
BlockData_2a0ce: INCBIN "maps/block_data/blockdata_2a0ce.blk.rz"
BlockData_2a0ee: INCBIN "maps/block_data/blockdata_2a0ee.blk.rz"
BlockData_2a202: INCBIN "maps/block_data/blockdata_2a202.blk.rz"
BlockData_2a236: INCBIN "maps/block_data/blockdata_2a236.blk.rz"
BlockData_2a26f: INCBIN "maps/block_data/blockdata_2a26f.blk.rz"
BlockData_2a322: INCBIN "maps/block_data/blockdata_2a322.blk.rz"
BlockData_2a3d7: INCBIN "maps/block_data/blockdata_2a3d7.blk.rz"
BlockData_2a4d3: INCBIN "maps/block_data/blockdata_2a4d3.blk.rz"
BlockData_2a5e9: INCBIN "maps/block_data/blockdata_2a5e9.blk.rz"
BlockData_2a6bf: INCBIN "maps/block_data/blockdata_2a6bf.blk.rz"
BlockData_2a7b5: INCBIN "maps/block_data/blockdata_2a7b5.blk.rz"
BlockData_2a89f: INCBIN "maps/block_data/blockdata_2a89f.blk.rz"
BlockData_2a995: INCBIN "maps/block_data/blockdata_2a995.blk.rz"
BlockData_2aa7b: INCBIN "maps/block_data/blockdata_2aa7b.blk.rz"
BlockData_2ab4e: INCBIN "maps/block_data/blockdata_2ab4e.blk.rz"
BlockData_2abc6: INCBIN "maps/block_data/blockdata_2abc6.blk.rz"
BlockData_2ac09: INCBIN "maps/block_data/blockdata_2ac09.blk.rz"
BlockData_2aca6: INCBIN "maps/block_data/blockdata_2aca6.blk.rz"
BlockData_2ad42: INCBIN "maps/block_data/blockdata_2ad42.blk.rz"
BlockData_2addb: INCBIN "maps/block_data/blockdata_2addb.blk.rz"
BlockData_2ae0b: INCBIN "maps/block_data/blockdata_2ae0b.blk.rz"
BlockData_2ae61: INCBIN "maps/block_data/blockdata_2ae61.blk.rz"
BlockData_2ae7b: INCBIN "maps/block_data/blockdata_2ae7b.blk.rz"
BlockData_2aebf: INCBIN "maps/block_data/blockdata_2aebf.blk.rz"
BlockData_2aed8: INCBIN "maps/block_data/blockdata_2aed8.blk.rz"
BlockData_2af27: INCBIN "maps/block_data/blockdata_2af27.blk.rz"
BlockData_2af8c: INCBIN "maps/block_data/blockdata_2af8c.blk.rz"
BlockData_2aff3: INCBIN "maps/block_data/blockdata_2aff3.blk.rz"
BlockData_2b109: INCBIN "maps/block_data/blockdata_2b109.blk.rz"
BlockData_2b188: INCBIN "maps/block_data/blockdata_2b188.blk.rz"
BlockData_2b1fd: INCBIN "maps/block_data/blockdata_2b1fd.blk.rz"
BlockData_2b2e2: INCBIN "maps/block_data/blockdata_2b2e2.blk.rz"
BlockData_2b340: INCBIN "maps/block_data/blockdata_2b340.blk.rz"
BlockData_2b3ff: INCBIN "maps/block_data/blockdata_2b3ff.blk.rz"
BlockData_2b434: INCBIN "maps/block_data/blockdata_2b434.blk.rz"
BlockData_2b471: INCBIN "maps/block_data/blockdata_2b471.blk.rz"
BlockData_2b4ac: INCBIN "maps/block_data/blockdata_2b4ac.blk.rz"
BlockData_2b513: INCBIN "maps/block_data/blockdata_2b513.blk.rz"
BlockData_2b538: INCBIN "maps/block_data/blockdata_2b538.blk.rz"
BlockData_2b554: INCBIN "maps/block_data/blockdata_2b554.blk.rz"
BlockData_2b589: INCBIN "maps/block_data/blockdata_2b589.blk.rz"
BlockData_2b5bc: INCBIN "maps/block_data/blockdata_2b5bc.blk.rz"
BlockData_2b5f9: INCBIN "maps/block_data/blockdata_2b5f9.blk.rz"
BlockData_2b667: INCBIN "maps/block_data/blockdata_2b667.blk.rz"
BlockData_2b6a7: INCBIN "maps/block_data/blockdata_2b6a7.blk.rz"
BlockData_2b78a: INCBIN "maps/block_data/blockdata_2b78a.blk.rz"
BlockData_2b7c3: INCBIN "maps/block_data/blockdata_2b7c3.blk.rz"
BlockData_2b90c: INCBIN "maps/block_data/blockdata_2b90c.blk.rz"
BlockData_2b99a: INCBIN "maps/block_data/blockdata_2b99a.blk.rz"
BlockData_2ba25: INCBIN "maps/block_data/blockdata_2ba25.blk.rz"
BlockData_2bac1: INCBIN "maps/block_data/blockdata_2bac1.blk.rz"
BlockData_2bb4a: INCBIN "maps/block_data/blockdata_2bb4a.blk.rz"
BlockData_2bbe0: INCBIN "maps/block_data/blockdata_2bbe0.blk.rz"
BlockData_2bc81: INCBIN "maps/block_data/blockdata_2bc81.blk.rz"
BlockData_2bd1d: INCBIN "maps/block_data/blockdata_2bd1d.blk.rz"
BlockData_2bda9: INCBIN "maps/block_data/blockdata_2bda9.blk.rz"
BlockData_2be50: INCBIN "maps/block_data/blockdata_2be50.blk.rz"
BlockData_2bec2: INCBIN "maps/block_data/blockdata_2bec2.blk.rz"
BlockData_2bf58: INCBIN "maps/block_data/blockdata_2bf58.blk.rz"

SECTION "Bank 0b", ROMX, BANK [$b]
BlockData_2c000: INCBIN "maps/block_data/blockdata_2c000.blk.rz"
BlockData_2c059: INCBIN "maps/block_data/blockdata_2c059.blk.rz"
BlockData_2c159: INCBIN "maps/block_data/blockdata_2c159.blk.rz"
BlockData_2c2b3: INCBIN "maps/block_data/blockdata_2c2b3.blk.rz"
BlockData_2c2df: INCBIN "maps/block_data/blockdata_2c2df.blk.rz"
BlockData_2c33e: INCBIN "maps/block_data/blockdata_2c33e.blk.rz"
BlockData_2c3ad: INCBIN "maps/block_data/blockdata_2c3ad.blk.rz"
BlockData_2c412: INCBIN "maps/block_data/blockdata_2c412.blk.rz"
BlockData_2c472: INCBIN "maps/block_data/blockdata_2c472.blk.rz"
BlockData_2c4d7: INCBIN "maps/block_data/blockdata_2c4d7.blk.rz"
BlockData_2c543: INCBIN "maps/block_data/blockdata_2c543.blk.rz"
BlockData_2c5ae: INCBIN "maps/block_data/blockdata_2c5ae.blk.rz"
BlockData_2c60c: INCBIN "maps/block_data/blockdata_2c60c.blk.rz"
BlockData_2c679: INCBIN "maps/block_data/blockdata_2c679.blk.rz"
BlockData_2c6e3: INCBIN "maps/block_data/blockdata_2c6e3.blk.rz"
BlockData_2c748: INCBIN "maps/block_data/blockdata_2c748.blk.rz"
BlockData_2c76b: INCBIN "maps/block_data/blockdata_2c76b.blk.rz"
BlockData_2c812: INCBIN "maps/block_data/blockdata_2c812.blk.rz"
BlockData_2c965: INCBIN "maps/block_data/blockdata_2c965.blk.rz"
BlockData_2c98d: INCBIN "maps/block_data/blockdata_2c98d.blk.rz"
BlockData_2c9b7: INCBIN "maps/block_data/blockdata_2c9b7.blk.rz"
BlockData_2ca02: INCBIN "maps/block_data/blockdata_2ca02.blk.rz"
BlockData_2ca4a: INCBIN "maps/block_data/blockdata_2ca4a.blk.rz"
BlockData_2cbb9: INCBIN "maps/block_data/blockdata_2cbb9.blk.rz"
BlockData_2cd95: INCBIN "maps/block_data/blockdata_2cd95.blk.rz"
BlockData_2ce14: INCBIN "maps/block_data/blockdata_2ce14.blk.rz"
BlockData_2cf4c: INCBIN "maps/block_data/blockdata_2cf4c.blk.rz"
BlockData_2cfd0: INCBIN "maps/block_data/blockdata_2cfd0.blk.rz"
BlockData_2d056: INCBIN "maps/block_data/blockdata_2d056.blk.rz"
BlockData_2d0f6: INCBIN "maps/block_data/blockdata_2d0f6.blk.rz"
BlockData_2d171: INCBIN "maps/block_data/blockdata_2d171.blk.rz"
BlockData_2d213: INCBIN "maps/block_data/blockdata_2d213.blk.rz"
BlockData_2d281: INCBIN "maps/block_data/blockdata_2d281.blk.rz"
BlockData_2d2dd: INCBIN "maps/block_data/blockdata_2d2dd.blk.rz"
BlockData_2d383: INCBIN "maps/block_data/blockdata_2d383.blk.rz"
BlockData_2d40d: INCBIN "maps/block_data/blockdata_2d40d.blk.rz"
BlockData_2d4d3: INCBIN "maps/block_data/blockdata_2d4d3.blk.rz"
BlockData_2d521: INCBIN "maps/block_data/blockdata_2d521.blk.rz"
BlockData_2d5a8: INCBIN "maps/block_data/blockdata_2d5a8.blk.rz"
BlockData_2d6b0: INCBIN "maps/block_data/blockdata_2d6b0.blk.rz"
BlockData_2d7c2: INCBIN "maps/block_data/blockdata_2d7c2.blk.rz"
BlockData_2d822: INCBIN "maps/block_data/blockdata_2d822.blk.rz"
BlockData_2d8a4: INCBIN "maps/block_data/blockdata_2d8a4.blk.rz"
BlockData_2d916: INCBIN "maps/block_data/blockdata_2d916.blk.rz"
BlockData_2d989: INCBIN "maps/block_data/blockdata_2d989.blk.rz"
BlockData_2da3c: INCBIN "maps/block_data/blockdata_2da3c.blk.rz"
BlockData_2dabf: INCBIN "maps/block_data/blockdata_2dabf.blk.rz"
BlockData_2db2d: INCBIN "maps/block_data/blockdata_2db2d.blk.rz"
BlockData_2dbe6: INCBIN "maps/block_data/blockdata_2dbe6.blk.rz"
BlockData_2dcc3: INCBIN "maps/block_data/blockdata_2dcc3.blk.rz"
BlockData_2dd62: INCBIN "maps/block_data/blockdata_2dd62.blk.rz"
BlockData_2de5e: INCBIN "maps/block_data/blockdata_2de5e.blk.rz"
BlockData_2dfb4: INCBIN "maps/block_data/blockdata_2dfb4.blk.rz"
BlockData_2e072: INCBIN "maps/block_data/blockdata_2e072.blk.rz"
BlockData_2e0e5: INCBIN "maps/block_data/blockdata_2e0e5.blk.rz"
BlockData_2e1da: INCBIN "maps/block_data/blockdata_2e1da.blk.rz"
BlockData_2e30a: INCBIN "maps/block_data/blockdata_2e30a.blk.rz"
BlockData_2e41c: INCBIN "maps/block_data/blockdata_2e41c.blk.rz"
BlockData_2e50e: INCBIN "maps/block_data/blockdata_2e50e.blk.rz"
BlockData_2e5f7: INCBIN "maps/block_data/blockdata_2e5f7.blk.rz"
BlockData_2e70d: INCBIN "maps/block_data/blockdata_2e70d.blk.rz"
BlockData_2e75d: INCBIN "maps/block_data/blockdata_2e75d.blk.rz"
BlockData_2e7a9: INCBIN "maps/block_data/blockdata_2e7a9.blk.rz"
BlockData_2e7ff: INCBIN "maps/block_data/blockdata_2e7ff.blk.rz"
BlockData_2e852: INCBIN "maps/block_data/blockdata_2e852.blk.rz"
BlockData_2e8a6: INCBIN "maps/block_data/blockdata_2e8a6.blk.rz"
BlockData_2e8f7: INCBIN "maps/block_data/blockdata_2e8f7.blk.rz"
BlockData_2e948: INCBIN "maps/block_data/blockdata_2e948.blk.rz"
BlockData_2e98d: INCBIN "maps/block_data/blockdata_2e98d.blk.rz"
BlockData_2e9db: INCBIN "maps/block_data/blockdata_2e9db.blk.rz"
BlockData_2ea2a: INCBIN "maps/block_data/blockdata_2ea2a.blk.rz"
BlockData_2eaa0: INCBIN "maps/block_data/blockdata_2eaa0.blk.rz"
BlockData_2eae9: INCBIN "maps/block_data/blockdata_2eae9.blk.rz"
BlockData_2eb70: INCBIN "maps/block_data/blockdata_2eb70.blk.rz"
BlockData_2ebeb: INCBIN "maps/block_data/blockdata_2ebeb.blk.rz"
BlockData_2ec12: INCBIN "maps/block_data/blockdata_2ec12.blk.rz"
BlockData_2ec51: INCBIN "maps/block_data/blockdata_2ec51.blk.rz"
BlockData_2eca8: INCBIN "maps/block_data/blockdata_2eca8.blk.rz"
BlockData_2ece0: INCBIN "maps/block_data/blockdata_2ece0.blk.rz"
BlockData_2ed13: INCBIN "maps/block_data/blockdata_2ed13.blk.rz"
BlockData_2ed6a: INCBIN "maps/block_data/blockdata_2ed6a.blk.rz"
BlockData_2edc6: INCBIN "maps/block_data/blockdata_2edc6.blk.rz"
BlockData_2ee0e: INCBIN "maps/block_data/blockdata_2ee0e.blk.rz"
BlockData_2ee56: INCBIN "maps/block_data/blockdata_2ee56.blk.rz"
BlockData_2ee6a: INCBIN "maps/block_data/blockdata_2ee6a.blk.rz"
BlockData_2eeae: INCBIN "maps/block_data/blockdata_2eeae.blk.rz"

SECTION "Bank 0a", ROMX, BANK [$0a]
BlockDataHeaders:: ; 28000
blockdataheader: MACRO
	dbw BANK(\1) - BANK(BlockDataHeaders), \1
	db \2, \3 ; dimensions
	ENDM

	blockdataheader BlockData_28424, $1d, $21
	blockdataheader BlockData_284fe, $08, $08
	blockdataheader BlockData_2852a, $08, $08
	blockdataheader BlockData_2854f, $09, $0a
	blockdataheader BlockData_28586, $09, $09
	blockdataheader BlockData_285b8, $0f, $0f
	blockdataheader BlockData_28616, $0a, $0b
	blockdataheader BlockData_28654, $0a, $0b
	blockdataheader BlockData_28691, $0a, $0b
	blockdataheader BlockData_286d1, $0a, $0b
	blockdataheader BlockData_286f9, $0a, $0b
	blockdataheader BlockData_2871d, $0a, $0b
	blockdataheader BlockData_28740, $0a, $0b
	blockdataheader BlockData_28771, $0a, $0b
	blockdataheader BlockData_287aa, $0a, $0b
	blockdataheader BlockData_287d3, $0a, $0b
	blockdataheader BlockData_28812, $0a, $0b
	blockdataheader BlockData_28847, $0a, $0b
	blockdataheader BlockData_28881, $0a, $0b
	blockdataheader BlockData_288c0, $0a, $0b
	blockdataheader BlockData_288e9, $0a, $0b
	blockdataheader BlockData_2892a, $0a, $0b
	blockdataheader BlockData_28963, $0a, $0b
	blockdataheader BlockData_2899e, $0a, $0b
	blockdataheader BlockData_289c2, $0a, $0b
	blockdataheader BlockData_289e8, $0a, $0b
	blockdataheader BlockData_28a19, $09, $09
	blockdataheader BlockData_28a4c, $0c, $09
	blockdataheader BlockData_28a79, $10, $0c
	blockdataheader BlockData_28ad1, $1c, $2e
	blockdataheader BlockData_28c12, $18, $27
	blockdataheader BlockData_28cee, $0d, $0c
	blockdataheader BlockData_28d24, $0d, $0c
	blockdataheader BlockData_28d56, $0d, $0c
	blockdataheader BlockData_28d89, $0d, $0c
	blockdataheader BlockData_28dbc, $16, $13
	blockdataheader BlockData_28e49, $1e, $31
	blockdataheader BlockData_28fb5, $13, $10
	blockdataheader BlockData_2900b, $13, $0d
	blockdataheader BlockData_29070, $14, $19
	blockdataheader BlockData_29102, $16, $18
	blockdataheader BlockData_29166, $16, $18
	blockdataheader BlockData_291d4, $0d, $09
	blockdataheader BlockData_29212, $14, $14
	blockdataheader BlockData_2928c, $1e, $25
	blockdataheader BlockData_293d2, $14, $14
	blockdataheader BlockData_29465, $14, $14
	blockdataheader BlockData_294cf, $14, $14
	blockdataheader BlockData_2955e, $14, $14
	blockdataheader BlockData_295d1, $14, $14
	blockdataheader BlockData_29663, $14, $14
	blockdataheader BlockData_296ea, $14, $14
	blockdataheader BlockData_2975d, $14, $14
	blockdataheader BlockData_297e5, $14, $14
	blockdataheader BlockData_29879, $18, $28
	blockdataheader BlockData_29963, $18, $18
	blockdataheader BlockData_299fe, $0f, $15
	blockdataheader BlockData_29a64, $18, $09
	blockdataheader BlockData_29a9c, $2f, $15
	blockdataheader BlockData_29bc6, $1a, $12
	blockdataheader BlockData_29c31, $1a, $26
	blockdataheader BlockData_29cd9, $1e, $22
	blockdataheader BlockData_29d8d, $07, $06
	blockdataheader BlockData_29dac, $20, $28
	blockdataheader BlockData_29e9e, $14, $18
	blockdataheader BlockData_29f4a, $2d, $13
	blockdataheader BlockData_2a03b, $14, $1e
	blockdataheader BlockData_2a0ce, $10, $07
	blockdataheader BlockData_2a0ee, $1e, $2b
	blockdataheader BlockData_2a202, $13, $09
	blockdataheader BlockData_2a236, $10, $10
	blockdataheader BlockData_2a26f, $18, $18
	blockdataheader BlockData_2a322, $18, $18
	blockdataheader BlockData_2a3d7, $16, $1f
	blockdataheader BlockData_2a4d3, $16, $23
	blockdataheader BlockData_2a5e9, $16, $1f
	blockdataheader BlockData_2a6bf, $16, $1f
	blockdataheader BlockData_2a7b5, $16, $23
	blockdataheader BlockData_2a89f, $16, $1f
	blockdataheader BlockData_2a995, $16, $1b
	blockdataheader BlockData_2aa7b, $21, $29
	blockdataheader BlockData_2ab4e, $0c, $17
	blockdataheader BlockData_2abc6, $16, $0b
	blockdataheader BlockData_2ac09, $14, $28
	blockdataheader BlockData_2aca6, $14, $28
	blockdataheader BlockData_2ad42, $14, $28
	blockdataheader BlockData_2addb, $0f, $09
	blockdataheader BlockData_2ae0b, $16, $14
	blockdataheader BlockData_2ae61, $0b, $08
	blockdataheader BlockData_2ae7b, $0f, $09
	blockdataheader BlockData_2aebf, $0b, $08
	blockdataheader BlockData_2aed8, $13, $16
	blockdataheader BlockData_2af27, $1c, $11
	blockdataheader BlockData_2af8c, $1b, $0b
	blockdataheader BlockData_2aff3, $20, $23
	blockdataheader BlockData_2b109, $1e, $0e
	blockdataheader BlockData_2b188, $1c, $15
	blockdataheader BlockData_2b1fd, $28, $12
	blockdataheader BlockData_2b2e2, $17, $0d
	blockdataheader BlockData_2b340, $22, $19
	blockdataheader BlockData_2b3ff, $0e, $0e
	blockdataheader BlockData_2b434, $0e, $10
	blockdataheader BlockData_2b471, $0e, $10
	blockdataheader BlockData_2b4ac, $18, $0d
	blockdataheader BlockData_2b513, $0f, $0d
	blockdataheader BlockData_2b538, $0f, $0d
	blockdataheader BlockData_2b554, $0f, $0d
	blockdataheader BlockData_2b589, $0f, $0d
	blockdataheader BlockData_2b5bc, $0f, $0d
	blockdataheader BlockData_2b5f9, $24, $0c
	blockdataheader BlockData_2b667, $0d, $0b
	blockdataheader BlockData_2b6a7, $17, $1b
	blockdataheader BlockData_2b78a, $0a, $0a
	blockdataheader BlockData_2b7c3, $22, $23
	blockdataheader BlockData_2b90c, $14, $14
	blockdataheader BlockData_2b99a, $14, $14
	blockdataheader BlockData_2ba25, $14, $14
	blockdataheader BlockData_2bac1, $14, $14
	blockdataheader BlockData_2bb4a, $14, $14
	blockdataheader BlockData_2bbe0, $14, $14
	blockdataheader BlockData_2bc81, $14, $14
	blockdataheader BlockData_2bd1d, $14, $14
	blockdataheader BlockData_2bda9, $14, $14
	blockdataheader BlockData_2be50, $14, $14
	blockdataheader BlockData_2bec2, $14, $14
	blockdataheader BlockData_2bf58, $19, $19
	blockdataheader BlockData_2c000, $0d, $0d
	blockdataheader BlockData_2c059, $1f, $29
	blockdataheader BlockData_2c159, $25, $25
	blockdataheader BlockData_2c2b3, $1b, $0b
	blockdataheader BlockData_2c2df, $12, $18
	blockdataheader BlockData_2c33e, $1a, $12
	blockdataheader BlockData_2c3ad, $15, $17
	blockdataheader BlockData_2c412, $1b, $12
	blockdataheader BlockData_2c472, $15, $18
	blockdataheader BlockData_2c4d7, $1b, $12
	blockdataheader BlockData_2c543, $15, $18
	blockdataheader BlockData_2c5ae, $18, $11
	blockdataheader BlockData_2c60c, $15, $18
	blockdataheader BlockData_2c679, $1b, $12
	blockdataheader BlockData_2c6e3, $15, $18
	blockdataheader BlockData_2c748, $0a, $07
	blockdataheader BlockData_2c76b, $1b, $11
	blockdataheader BlockData_2c812, $22, $26
	blockdataheader BlockData_2c965, $06, $13
	blockdataheader BlockData_2c98d, $06, $13
	blockdataheader BlockData_2c9b7, $1a, $0b
	blockdataheader BlockData_2ca02, $1a, $0b
	blockdataheader BlockData_2ca4a, $20, $20
	blockdataheader BlockData_2cbb9, $20, $20
	blockdataheader BlockData_2cd95, $12, $10
	blockdataheader BlockData_2ce14, $34, $19
	blockdataheader BlockData_2cf4c, $1d, $24
	blockdataheader BlockData_2cfd0, $19, $20
	blockdataheader BlockData_2d056, $1c, $20
	blockdataheader BlockData_2d0f6, $16, $18
	blockdataheader BlockData_2d171, $1c, $1b
	blockdataheader BlockData_2d213, $17, $1a
	blockdataheader BlockData_2d281, $14, $10
	blockdataheader BlockData_2d2dd, $1b, $1d
	blockdataheader BlockData_2d383, $14, $14
	blockdataheader BlockData_2d40d, $1f, $13
	blockdataheader BlockData_2d4d3, $17, $0b
	blockdataheader BlockData_2d521, $20, $10
	blockdataheader BlockData_2d5a8, $1f, $22
	blockdataheader BlockData_2d6b0, $25, $1f
	blockdataheader BlockData_2d7c2, $12, $14
	blockdataheader BlockData_2d822, $19, $18
	blockdataheader BlockData_2d8a4, $15, $1a
	blockdataheader BlockData_2d916, $1a, $1a
	blockdataheader BlockData_2d989, $1e, $20
	blockdataheader BlockData_2da3c, $19, $1d
	blockdataheader BlockData_2dabf, $18, $1b
	blockdataheader BlockData_2db2d, $20, $24
	blockdataheader BlockData_2dbe6, $20, $23
	blockdataheader BlockData_2dcc3, $1e, $23
	blockdataheader BlockData_2dd62, $21, $33
	blockdataheader BlockData_2de5e, $27, $1f
	blockdataheader BlockData_2dfb4, $1f, $27
	blockdataheader BlockData_2e072, $23, $28
	blockdataheader BlockData_2e0e5, $1f, $20
	blockdataheader BlockData_2e1da, $23, $20
	blockdataheader BlockData_2e30a, $20, $30
	blockdataheader BlockData_2e41c, $20, $30
	blockdataheader BlockData_2e50e, $20, $30
	blockdataheader BlockData_2e5f7, $20, $30
	blockdataheader BlockData_2e70d, $10, $0f
	blockdataheader BlockData_2e75d, $10, $0f
	blockdataheader BlockData_2e7a9, $10, $0f
	blockdataheader BlockData_2e7ff, $10, $0f
	blockdataheader BlockData_2e852, $10, $0f
	blockdataheader BlockData_2e8a6, $10, $0f
	blockdataheader BlockData_2e8f7, $10, $0f
	blockdataheader BlockData_2e948, $10, $0f
	blockdataheader BlockData_2e98d, $10, $0f
	blockdataheader BlockData_2e9db, $10, $0f
	blockdataheader BlockData_2ea2a, $15, $18
	blockdataheader BlockData_2eaa0, $20, $10
	blockdataheader BlockData_2eae9, $0f, $12
	blockdataheader BlockData_2eb70, $0f, $12
	blockdataheader BlockData_2ebeb, $06, $08
	blockdataheader BlockData_2ec12, $09, $0b
	blockdataheader BlockData_2ec51, $0b, $0e
	blockdataheader BlockData_2eca8, $09, $09
	blockdataheader BlockData_2ece0, $09, $09
	blockdataheader BlockData_2ed13, $0c, $0e
	blockdataheader BlockData_2ed6a, $0d, $0e
	blockdataheader BlockData_2edc6, $0a, $0c
	blockdataheader BlockData_2ee0e, $0a, $0c
	blockdataheader BlockData_2ee56, $07, $04
	blockdataheader BlockData_2ee6a, $1a, $10
	blockdataheader BlockData_2eeae, $0a, $0a

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

SECTION "Bank 0b", ROMX, BANK [$0b]
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
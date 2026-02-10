INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 0d", ROMX
Emotes_34000:: ; 34000
	dw $0, $0
	emote_header Emotes_34000, GFX_340b0, $242
	emote_header Emotes_34000, GFX_34147, $352
	emote_header Emotes_34000, GFX_34237, $132
	emote_header Emotes_34000, GFX_3427d, $32
	emote_header Emotes_34000, GFX_3429d, $162
	emote_header Emotes_34000, GFX_34338, $142
	emote_header Emotes_34000, GFX_3439f, $282
	emote_header Emotes_34000, GFX_344d0, $752
	emote_header Emotes_34000, GFX_346a9, $122
	emote_header Emotes_34000, GFX_346cf, $142
	emote_header Emotes_34000, GFX_3472b, $262
	emote_header Emotes_34000, GFX_34858, $172
	emote_header Emotes_34000, GFX_348c2, $122
	emote_header Emotes_34000, GFX_348eb, $152
	emote_header Emotes_34000, GFX_34952, $132
	emote_header Emotes_34000, GFX_34991, $132
	emote_header Emotes_34000, GFX_349df, $142
	emote_header Emotes_34000, GFX_34a3c, $142
	emote_header Emotes_34000, GFX_34a92, $132
	emote_header Emotes_34000, GFX_34ad8, $142
	emote_header Emotes_34000, GFX_34b33, $132
	emote_header Emotes_34000, GFX_34b6b, $182
	emote_header Emotes_34000, GFX_34c3f, $122
	emote_header Emotes_34000, GFX_34c63, $22
	emote_header Emotes_34000, GFX_34c75, $142
	emote_header Emotes_34000, GFX_34cde, $152
	emote_header Emotes_34000, GFX_34d47, $552
	emote_header Emotes_34000, GFX_34f2d, $132
	emote_header Emotes_34000, GFX_34f76, $152
	emote_header Emotes_34000, GFX_34fe9, $22
	emote_header Emotes_34000, GFX_34ffe, $142
	emote_header Emotes_34000, GFX_35061, $122
	emote_header Emotes_34000, GFX_35083, $342
	emote_header Emotes_34000, GFX_3514c, $152
	emote_header Emotes_34000, GFX_351d9, $142
	emote_header Emotes_34000, GFX_35243, $22
	emote_header Emotes_34000, GFX_35252, $232
	emote_header Emotes_34000, GFX_352c3, $352
	emote_header Emotes_34000, GFX_35393, $362
	emote_header Emotes_34000, GFX_354a2, $262
	emote_header Emotes_34000, GFX_35554, $152
	emote_header Emotes_34000, GFX_355b6, $862
	emote_header Emotes_34000, GFX_356c7, $152

GFX_340b0: INCBIN "gfx/emotes/emote_340b0.emote.rz" ; 340b0
GFX_34147: INCBIN "gfx/emotes/emote_34147.emote.rz" ; 34147
GFX_34237: INCBIN "gfx/emotes/emote_34237.emote.rz" ; 34237
GFX_3427d: INCBIN "gfx/emotes/emote_3427d.emote.rz" ; 3427d
GFX_3429d: INCBIN "gfx/emotes/emote_3429d.emote.rz" ; 3429d
GFX_34338: INCBIN "gfx/emotes/emote_34338.emote.rz" ; 34338
GFX_3439f: INCBIN "gfx/emotes/emote_3439f.emote.rz" ; 3439f
GFX_344d0: INCBIN "gfx/emotes/emote_344d0.emote.rz" ; 344d0
GFX_346a9: INCBIN "gfx/emotes/emote_346a9.emote.rz" ; 346a9
GFX_346cf: INCBIN "gfx/emotes/emote_346cf.emote.rz" ; 346cf
GFX_3472b: INCBIN "gfx/emotes/emote_3472b.emote.rz" ; 3472b
GFX_34858: INCBIN "gfx/emotes/emote_34858.emote.rz" ; 34858
GFX_348c2: INCBIN "gfx/emotes/emote_348c2.emote.rz" ; 348c2
GFX_348eb: INCBIN "gfx/emotes/emote_348eb.emote.rz" ; 348eb
GFX_34952: INCBIN "gfx/emotes/emote_34952.emote.rz" ; 34952
GFX_34991: INCBIN "gfx/emotes/emote_34991.emote.rz" ; 34991
GFX_349df: INCBIN "gfx/emotes/emote_349df.emote.rz" ; 349df
GFX_34a3c: INCBIN "gfx/emotes/emote_34a3c.emote.rz" ; 34a3c
GFX_34a92: INCBIN "gfx/emotes/emote_34a92.emote.rz" ; 34a92
GFX_34ad8: INCBIN "gfx/emotes/emote_34ad8.emote.rz" ; 34ad8
GFX_34b33: INCBIN "gfx/emotes/emote_34b33.emote.rz" ; 34b33
GFX_34b6b: INCBIN "gfx/emotes/emote_34b6b.emote.rz" ; 34b6b
GFX_34c3f: INCBIN "gfx/emotes/emote_34c3f.emote.rz" ; 34c3f
GFX_34c63: INCBIN "gfx/emotes/emote_34c63.emote.rz" ; 34c63
GFX_34c75: INCBIN "gfx/emotes/emote_34c75.emote.rz" ; 34c75
GFX_34cde: INCBIN "gfx/emotes/emote_34cde.emote.rz" ; 34cde
GFX_34d47: INCBIN "gfx/emotes/emote_34d47.emote.rz" ; 34d47
GFX_34f2d: INCBIN "gfx/emotes/emote_34f2d.emote.rz" ; 34f2d
GFX_34f76: INCBIN "gfx/emotes/emote_34f76.emote.rz" ; 34f76
GFX_34fe9: INCBIN "gfx/emotes/emote_34fe9.emote.rz" ; 34fe9
GFX_34ffe: INCBIN "gfx/emotes/emote_34ffe.emote.rz" ; 34ffe
GFX_35061: INCBIN "gfx/emotes/emote_35061.emote.rz" ; 35061
GFX_35083: INCBIN "gfx/emotes/emote_35083.emote.rz" ; 35083
GFX_3514c: INCBIN "gfx/emotes/emote_3514c.emote.rz" ; 3514c
GFX_351d9: INCBIN "gfx/emotes/emote_351d9.emote.rz" ; 351d9
GFX_35243: INCBIN "gfx/emotes/emote_35243.emote.rz" ; 35243
GFX_35252: INCBIN "gfx/emotes/emote_35252.emote.rz" ; 35252
GFX_352c3: INCBIN "gfx/emotes/emote_352c3.emote.rz" ; 352c3
GFX_35393: INCBIN "gfx/emotes/emote_35393.emote.rz" ; 35393
GFX_354a2: INCBIN "gfx/emotes/emote_354a2.emote.rz" ; 354a2
GFX_35554: INCBIN "gfx/emotes/emote_35554.emote.rz" ; 35554
GFX_355b6: INCBIN "gfx/emotes/emote_355b6.emote.rz" ; 355b6
GFX_356c7: INCBIN "gfx/emotes/emote_356c7.emote.rz" ; 356c7

EmoteAttrs_3570d:: ; 3570d
	dw $0, $0
	emote_header EmoteAttrs_3570d, Data_357fd, $bc
	emote_header EmoteAttrs_3570d, Data_35849, $127
	emote_header EmoteAttrs_3570d, Data_358dc, $2c8
	emote_header EmoteAttrs_3570d, Data_35a00, $fd
	emote_header EmoteAttrs_3570d, Data_35a68, $20a
	emote_header EmoteAttrs_3570d, Data_35b5d, $94
	emote_header EmoteAttrs_3570d, Data_35b8f, $af
	emote_header EmoteAttrs_3570d, Data_35bdb, $154
	emote_header EmoteAttrs_3570d, Data_35c87, $d1
	emote_header EmoteAttrs_3570d, Data_35cdb, $1b2
	emote_header EmoteAttrs_3570d, Data_35d56, $4ca
	emote_header EmoteAttrs_3570d, Data_35fd0, $109
	emote_header EmoteAttrs_3570d, Data_36053, $330
	emote_header EmoteAttrs_3570d, Data_361a0, $4b3
	emote_header EmoteAttrs_3570d, Data_36390, $18f
	emote_header EmoteAttrs_3570d, Data_36427, $b7
	emote_header EmoteAttrs_3570d, Data_36469, $d8
	emote_header EmoteAttrs_3570d, Data_364ce, $124
	emote_header EmoteAttrs_3570d, Data_36568, $dc
	emote_header EmoteAttrs_3570d, Data_365b2, $275
	emote_header EmoteAttrs_3570d, Data_366e3, $136
	emote_header EmoteAttrs_3570d, Data_36754, $20c
	emote_header EmoteAttrs_3570d, Data_36830, $11e
	emote_header EmoteAttrs_3570d, Data_368a1, $1e0
	emote_header EmoteAttrs_3570d, Data_3694d, $165
	emote_header EmoteAttrs_3570d, Data_36a09, $23e
	emote_header EmoteAttrs_3570d, Data_36b0c, $20c
	emote_header EmoteAttrs_3570d, Data_36be8, $1bd
	emote_header EmoteAttrs_3570d, Data_36cb1, $2ae
	emote_header EmoteAttrs_3570d, Data_36db3, $1ff
	emote_header EmoteAttrs_3570d, Data_36e92, $22c
	emote_header EmoteAttrs_3570d, Data_36f81, $201
	dw $0, $0
	emote_header EmoteAttrs_3570d, Data_37038, $2c4
	emote_header EmoteAttrs_3570d, Data_37153, $1f9
	emote_header EmoteAttrs_3570d, Data_3721d, $106
	emote_header EmoteAttrs_3570d, Data_37297, $f5
	emote_header EmoteAttrs_3570d, Data_37311, $169
	emote_header EmoteAttrs_3570d, Data_373bb, $2aa
	dw $0, $0
	emote_header EmoteAttrs_3570d, Data_374e1, $372
	emote_header EmoteAttrs_3570d, Data_37646, $fc
	dw $0, $0
	dw $0, $0
	dw $0, $0
	dw $0, $0
	dw $0, $0
	emote_header EmoteAttrs_3570d, Data_376b6, $20d
	emote_header EmoteAttrs_3570d, Data_377dd, $fe
	emote_header EmoteAttrs_3570d, Data_37850, $114
	dw $0, $0
	emote_header EmoteAttrs_3570d, Data_378cf, $fe
	emote_header EmoteAttrs_3570d, Data_3791f, $158
	emote_header EmoteAttrs_3570d, Data_37993, $192
	emote_header EmoteAttrs_3570d, Data_37a5f, $158
	emote_header EmoteAttrs_3570d, Data_37b15, $124
	emote_header EmoteAttrs_3570d, Data_37b92, $213
	emote_header EmoteAttrs_3570d, Data_37c7f, $29e
	emote_header EmoteAttrs_3570d, Data_37d9b, $21c

Data_357fd: INCBIN "gfx/emotes/emote_357fd.emoteattrs.rz" ; 357fd
Data_35849: INCBIN "gfx/emotes/emote_35849.emoteattrs.rz" ; 35849
Data_358dc: INCBIN "gfx/emotes/emote_358dc.emoteattrs.rz" ; 358dc
Data_35a00: INCBIN "gfx/emotes/emote_35a00.emoteattrs.rz" ; 35a00
Data_35a68: INCBIN "gfx/emotes/emote_35a68.emoteattrs.rz" ; 35a68
Data_35b5d: INCBIN "gfx/emotes/emote_35b5d.emoteattrs.rz" ; 35b5d
Data_35b8f: INCBIN "gfx/emotes/emote_35b8f.emoteattrs.rz" ; 35b8f
Data_35bdb: INCBIN "gfx/emotes/emote_35bdb.emoteattrs.rz" ; 35bdb
Data_35c87: INCBIN "gfx/emotes/emote_35c87.emoteattrs.rz" ; 35c87
Data_35cdb: INCBIN "gfx/emotes/emote_35cdb.emoteattrs.rz" ; 35cdb
Data_35d56: INCBIN "gfx/emotes/emote_35d56.emoteattrs.rz" ; 35d56
Data_35fd0: INCBIN "gfx/emotes/emote_35fd0.emoteattrs.rz" ; 35fd0
Data_36053: INCBIN "gfx/emotes/emote_36053.emoteattrs.rz" ; 36053
Data_361a0: INCBIN "gfx/emotes/emote_361a0.emoteattrs.rz" ; 361a0
Data_36390: INCBIN "gfx/emotes/emote_36390.emoteattrs.rz" ; 36390
Data_36427: INCBIN "gfx/emotes/emote_36427.emoteattrs.rz" ; 36427
Data_36469: INCBIN "gfx/emotes/emote_36469.emoteattrs.rz" ; 36469
Data_364ce: INCBIN "gfx/emotes/emote_364ce.emoteattrs.rz" ; 364ce
Data_36568: INCBIN "gfx/emotes/emote_36568.emoteattrs.rz" ; 36568
Data_365b2: INCBIN "gfx/emotes/emote_365b2.emoteattrs.rz" ; 365b2
Data_366e3: INCBIN "gfx/emotes/emote_366e3.emoteattrs.rz" ; 366e3
Data_36754: INCBIN "gfx/emotes/emote_36754.emoteattrs.rz" ; 36754
Data_36830: INCBIN "gfx/emotes/emote_36830.emoteattrs.rz" ; 36830
Data_368a1: INCBIN "gfx/emotes/emote_368a1.emoteattrs.rz" ; 368a1
Data_3694d: INCBIN "gfx/emotes/emote_3694d.emoteattrs.rz" ; 3694d
Data_36a09: INCBIN "gfx/emotes/emote_36a09.emoteattrs.rz" ; 36a09
Data_36b0c: INCBIN "gfx/emotes/emote_36b0c.emoteattrs.rz" ; 36b0c
Data_36be8: INCBIN "gfx/emotes/emote_36be8.emoteattrs.rz" ; 36be8
Data_36cb1: INCBIN "gfx/emotes/emote_36cb1.emoteattrs.rz" ; 36cb1
Data_36db3: INCBIN "gfx/emotes/emote_36db3.emoteattrs.rz" ; 36db3
Data_36e92: INCBIN "gfx/emotes/emote_36e92.emoteattrs.rz" ; 36e92
Data_36f81: INCBIN "gfx/emotes/emote_36f81.emoteattrs.rz" ; 36f81
Data_37038: INCBIN "gfx/emotes/emote_37038.emoteattrs.rz" ; 37038
Data_37153: INCBIN "gfx/emotes/emote_37153.emoteattrs.rz" ; 37153
Data_3721d: INCBIN "gfx/emotes/emote_3721d.emoteattrs.rz" ; 3721d
Data_37297: INCBIN "gfx/emotes/emote_37297.emoteattrs.rz" ; 37297
Data_37311: INCBIN "gfx/emotes/emote_37311.emoteattrs.rz" ; 37311
Data_373bb: INCBIN "gfx/emotes/emote_373bb.emoteattrs.rz" ; 373bb
Data_374e1: INCBIN "gfx/emotes/emote_374e1.emoteattrs.rz" ; 374e1
Data_37646: INCBIN "gfx/emotes/emote_37646.emoteattrs.rz" ; 37646
Data_376b6: INCBIN "gfx/emotes/emote_376b6.emoteattrs.rz" ; 376b6
Data_377dd: INCBIN "gfx/emotes/emote_377dd.emoteattrs.rz" ; 377dd
Data_37850: INCBIN "gfx/emotes/emote_37850.emoteattrs.rz" ; 37850
Data_378cf: INCBIN "gfx/emotes/emote_378cf.emoteattrs.rz" ; 378cf
Data_3791f: INCBIN "gfx/emotes/emote_3791f.emoteattrs.rz" ; 3791f
Data_37993: INCBIN "gfx/emotes/emote_37993.emoteattrs.rz" ; 37993
Data_37a5f: INCBIN "gfx/emotes/emote_37a5f.emoteattrs.rz" ; 37a5f
Data_37b15: INCBIN "gfx/emotes/emote_37b15.emoteattrs.rz" ; 37b15
Data_37b92: INCBIN "gfx/emotes/emote_37b92.emoteattrs.rz" ; 37b92
Data_37c7f: INCBIN "gfx/emotes/emote_37c7f.emoteattrs.rz" ; 37c7f
Data_37d9b: INCBIN "gfx/emotes/emote_37d9b.emoteattrs.rz" ; 37d9b


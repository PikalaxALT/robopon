
SECTION "Emotes GFX", ROMX

Emotes_b2418:: ; b2418
	dw $0, $0
	emote_header Emotes_b2418, GFX_b2440, $3e2
	emote_header Emotes_b2418, GFX_b2720, $3f2
	emote_header Emotes_b2418, GFX_b2a29, $332
	emote_header Emotes_b2418, GFX_b2b7a, $342
	emote_header Emotes_b2418, GFX_b2d1b, $382
	emote_header Emotes_b2418, GFX_b2f5c, $3e2
	emote_header Emotes_b2418, GFX_b31f3, $202
	emote_header Emotes_b2418, GFX_b32dd, $1f2
	emote_header Emotes_b2418, GFX_b348c, $222

GFX_b2440:: INCBIN "gfx/emotes/emote_b2440.emote.rz"
GFX_b2720:: INCBIN "gfx/emotes/emote_b2720.emote.rz"
GFX_b2a29:: INCBIN "gfx/emotes/emote_b2a29.emote.rz"
GFX_b2b7a:: INCBIN "gfx/emotes/emote_b2b7a.emote.rz"
GFX_b2d1b:: INCBIN "gfx/emotes/emote_b2d1b.emote.rz"
GFX_b2f5c:: INCBIN "gfx/emotes/emote_b2f5c.emote.rz"
GFX_b31f3:: INCBIN "gfx/emotes/emote_b31f3.emote.rz"
GFX_b32dd:: INCBIN "gfx/emotes/emote_b32dd.emote.rz"
GFX_b348c:: INCBIN "gfx/emotes/emote_b348c.emote.rz"

EmoteAttrs_b3607:: ; b3607
	dw $0, $0
	emote_header EmoteAttrs_b3607, Data_b3633, $367
	emote_header EmoteAttrs_b3607, Data_b376f, $352
	emote_header EmoteAttrs_b3607, Data_b3884, $8f8
	emote_header EmoteAttrs_b3607, Data_b39da, $b25
	emote_header EmoteAttrs_b3607, Data_b3c0b, $278
	emote_header EmoteAttrs_b3607, Data_b3cd5, $ac
	emote_header EmoteAttrs_b3607, Data_b3d24, $2f9
	emote_header EmoteAttrs_b3607, Data_b3e2b, $148
	emote_header EmoteAttrs_b3607, Data_b3ecb, $111
	emote_header EmoteAttrs_b3607, Data_b3f35, $18c

Data_b3633: INCBIN "gfx/emotes/emote_b3633.emoteattrs.rz" ; b3633
Data_b376f: INCBIN "gfx/emotes/emote_b376f.emoteattrs.rz" ; b376f
Data_b3884: INCBIN "gfx/emotes/emote_b3884.emoteattrs.rz" ; b3884
Data_b39da: INCBIN "gfx/emotes/emote_b39da.emoteattrs.rz" ; b39da
Data_b3c0b: INCBIN "gfx/emotes/emote_b3c0b.emoteattrs.rz" ; b3c0b
Data_b3cd5: INCBIN "gfx/emotes/emote_b3cd5.emoteattrs.rz" ; b3cd5
Data_b3d24: INCBIN "gfx/emotes/emote_b3d24.emoteattrs.rz" ; b3d24
Data_b3e2b: INCBIN "gfx/emotes/emote_b3e2b.emoteattrs.rz" ; b3e2b
Data_b3ecb: INCBIN "gfx/emotes/emote_b3ecb.emoteattrs.rz" ; b3ecb
Data_b3f35: INCBIN "gfx/emotes/emote_b3f35.emoteattrs.rz" ; b3f35


INCLUDE "includes.asm"
INCLUDE "charmap.asm"
INCLUDE "macros/bank20.asm"

SECTION "Bank 36", ROMX
GFX_d8000:: INCBIN "gfx/misc/d8000.2bpp"

Data_d8790::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $06, $07, $08, $09, $0a, $0b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $15, $16, $17, $18, $19, $1a, $00, $1b, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $00, $00, $00, $00, $00, $00, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $00, $00, $00, $00, $00, $00, $00, $00, $36, $37, $38, $00, $39, $3a, $3b, $3c, $3d, $3e, $3f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $41, $00, $00, $42, $43, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $00, $00, $00, $00, $00, $00, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $00, $00, $00, $00, $00, $00, $00, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $00, $00, $00, $00, $00, $00, $00, $6c, $6d, $6e, $6f, $70, $71, $72, $73, $74, $75, $76, $77, $78, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

GFX_d88f8:: INCBIN "gfx/misc/d88f8.2bpp"

Data_d9048::
IF DEF(SUN)
	db $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $00, $00, $00, $00, $00, $00, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $00, $00, $00, $00, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $00, $00, $00, $00, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $00, $00, $00, $00, $00, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $00, $00, $00, $00, $00, $00, $00, $00, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $69, $72, $71, $00, $6e, $6d, $6c, $69, $6f, $70, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $73, $64, $65, $65, $66, $00, $5c, $5d, $5e, $5f, $60, $61, $00, $5f, $60, $62, $63, $00, $00, $00, $73, $64, $65, $65, $66, $00, $67, $68, $5e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3c, $3c, $42, $42, $99, $99, $a1, $a1, $99, $99, $42, $42, $3c, $3c, $00, $00, $00, $00, $66, $66, $66, $66, $7e, $7e, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $78, $78, $6c, $6c, $66, $66, $66, $66, $6c, $6c, $78, $78, $00, $00, $00, $00, $3c, $3c, $72, $72, $3c, $3c, $0e, $0e, $66, $66, $3c, $3c, $00, $00, $00, $00, $3c, $3c, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $66, $66, $66, $66, $76, $76, $6e, $6e, $66, $66, $66, $66, $00, $00, $00, $00, $7e, $7e, $60, $60, $7c, $7c, $60, $60, $60, $60, $60, $60, $00, $00, $00, $00, $7e, $7e, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $0c, $0c, $3c, $3c, $0c, $0c, $0c, $0c, $0c, $0c, $3f, $3f, $00, $00, $00, $00, $3e, $3e, $63, $63, $63, $63, $3f, $3f, $03, $03, $3e, $3e, $00, $00, $00, $00, $3e, $3e, $63, $63, $3e, $3e, $63, $63, $63, $63, $3e, $3e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $00, $05, $06, $08, $09, $00, $0a, $0b, $0b, $0c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ELIF DEF(STAR)
	db $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $00, $00, $00, $00, $00, $00, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $00, $00, $00, $00, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f, $30, $31, $32, $33, $00, $00, $00, $00, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $00, $00, $00, $00, $00, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $00, $00, $00, $00, $00, $00, $00, $00, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $69, $6a, $6b, $6c, $00, $6e, $6d, $6c, $69, $6f, $70, $71, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $73, $64, $65, $65, $66, $00, $5c, $5d, $5e, $5f, $60, $61, $00, $5f, $60, $62, $63, $00, $00, $00, $73, $64, $65, $65, $66, $00, $67, $68, $5e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3c, $3c, $42, $42, $99, $99, $a1, $a1, $99, $99, $42, $42, $3c, $3c, $00, $00, $00, $00, $66, $66, $66, $66, $7e, $7e, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $78, $78, $6c, $6c, $66, $66, $66, $66, $6c, $6c, $78, $78, $00, $00, $00, $00, $3c, $3c, $72, $72, $3c, $3c, $0e, $0e, $66, $66, $3c, $3c, $00, $00, $00, $00, $3c, $3c, $66, $66, $66, $66, $66, $66, $66, $66, $3c, $3c, $00, $00, $00, $00, $66, $66, $66, $66, $76, $76, $6e, $6e, $66, $66, $66, $66, $00, $00, $00, $00, $7e, $7e, $60, $60, $7c, $7c, $60, $60, $60, $60, $60, $60, $00, $00, $00, $00, $7e, $7e, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00, $0c, $0c, $3c, $3c, $0c, $0c, $0c, $0c, $0c, $0c, $3f, $3f, $00, $00, $00, $00, $3e, $3e, $63, $63, $63, $63, $3f, $3f, $03, $03, $3e, $3e, $00, $00, $00, $00, $3e, $3e, $63, $63, $3e, $3e, $63, $63, $63, $63, $3e, $3e, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $03, $04, $05, $06, $07, $00, $05, $06, $08, $09, $00, $0a, $0b, $0b, $0c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ENDC

OverworldAttrMaps:: ; d93e8
	db $00, $02, $01, $01, $01, $01, $01, $01, $01, $01, $05, $05, $07, $07, $07, $07, $00, $02, $01, $01, $01, $01, $01, $01, $01, $01, $05, $06, $07, $07, $07, $07, $05, $02, $02, $02, $02, $02, $02, $02, $05, $05, $05, $06, $07, $07, $07, $06, $05, $04, $02, $02, $02, $02, $02, $02, $05, $05, $07, $07, $07, $05, $05, $00, $04, $05, $06, $04, $05, $05, $07, $07, $05, $05, $07, $07, $05, $05, $05, $06, $05, $05, $05, $05, $05, $05, $07, $07, $05, $05, $07, $07, $05, $05, $05, $06, $04, $04, $06, $06, $01, $01, $05, $05, $05, $05, $03, $03, $05, $05, $07, $07, $04, $04, $06, $06, $01, $01, $07, $07, $05, $05, $03, $03, $05, $05, $07, $07, $04, $04, $04, $04, $04, $05, $01, $01, $05, $05, $05, $05, $04, $04, $04, $04, $04, $04, $04, $04, $04, $06, $01, $01, $05, $05, $05, $03, $03, $03, $03, $03, $01, $01, $01, $01, $04, $04, $00, $00, $05, $06, $05, $03, $03, $03, $03, $03, $01, $01, $01, $01, $04, $04, $00, $00, $05, $06, $05, $05, $05, $05, $05, $05, $01, $01, $01, $05, $05, $05, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $01, $01, $01, $05, $05, $05, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $02, $02, $02, $02, $07, $07, $04, $04, $04, $04, $05, $05, $00, $00, $00, $00, $02, $02, $02, $02, $07, $07, $04, $05, $04, $04, $05, $05, $00, $00, $00, $00, $07, $04, $06, $06, $06, $06, $00, $07, $07, $07, $05, $05, $05, $05, $05, $05, $07, $04, $06, $05, $06, $07, $07, $07, $07, $07, $05, $05, $05, $05, $05, $05, $07, $04, $06, $06, $06, $07, $07, $07, $07, $07, $05, $05, $05, $05, $05, $06, $01, $04, $05, $05, $05, $07, $07, $07, $07, $07, $05, $05, $05, $05, $05, $06, $05, $05, $05, $05, $05, $03, $03, $03, $03, $06, $05, $05, $05, $05, $05, $06, $05, $05, $05, $05, $05, $03, $03, $03, $03, $06, $05, $05, $05, $05, $05, $06, $05, $05, $07, $07, $06, $01, $01, $06, $06, $05, $05, $05, $05, $05, $05, $05, $05, $05, $06, $06, $06, $01, $01, $06, $06, $05, $05, $05, $05, $05, $05, $05, $04, $04, $05, $07, $07, $05, $05, $05, $05, $05, $06, $06, $06, $06, $06, $06, $04, $04, $05, $07, $07, $05, $05, $05, $05, $05, $05, $05, $05, $06, $06, $05, $05, $05, $06, $06, $06, $06, $01, $01, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $06, $06, $06, $06, $01, $01, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $06, $06, $01, $01, $06, $06, $07, $07, $07, $07, $03, $03, $03, $03, $05, $05, $06, $06, $01, $01, $06, $06, $07, $07, $07, $07, $03, $03, $03, $03, $03, $03, $06, $06, $02, $02, $04, $04, $05, $05, $06, $06, $05, $05, $07, $07, $03, $03, $06, $06, $07, $07, $04, $04, $05, $05, $06, $06, $05, $05, $07, $07, $02, $02, $02, $02, $07, $07, $05, $04, $05, $05, $04, $05, $00, $00, $05, $00, $02, $02, $02, $02, $07, $07, $05, $04, $05, $05, $04, $05, $00, $00, $00, $00, $02, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $03, $03, $06, $06, $02, $05, $05, $04, $05, $05, $05, $05, $05, $05, $05, $05, $03, $03, $06, $06, $05, $05, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06, $05, $05, $05, $05, $05, $05, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06, $04, $04, $04, $05, $02, $02, $02, $02, $02, $02, $05, $05, $06, $06, $06, $06, $04, $04, $04, $06, $02, $02, $02, $02, $02, $02, $05, $05, $06, $06, $06, $06, $06, $06, $05, $05, $03, $03, $03, $03, $06, $06, $06, $06, $05, $05, $06, $06, $06, $06, $06, $06, $03, $03, $03, $03, $06, $06, $06, $06, $05, $05, $06, $06, $06, $06, $06, $06, $03, $03, $03, $03, $06, $06, $06, $06, $05, $05, $06, $06, $01, $01, $06, $06, $03, $03, $03, $03, $06, $06, $06, $06, $05, $05, $06, $06, $01, $01, $06, $06, $00, $00, $00, $00, $00, $00, $07, $07, $05, $05, $05, $05, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $05, $05, $05, $05, $05, $05, $00, $00, $01, $01, $04, $04, $05, $05, $06, $06, $02, $02, $02, $02, $02, $02, $00, $00, $01, $01, $04, $04, $05, $05, $06, $06, $02, $02, $02, $02, $02, $02, $02, $02, $00, $00, $04, $04, $06, $06, $06, $06, $05, $06, $06, $05, $07, $07, $00, $00, $00, $00, $04, $04, $06, $06, $06, $06, $05, $06, $06, $05, $04, $04, $00, $00, $05, $05, $04, $04, $06, $06, $06, $06, $05, $04, $04, $05, $07, $07, $05, $05, $05, $05, $04, $04, $06, $06, $06, $06, $05, $05, $05, $05, $07, $07, $05, $05, $02, $02, $02, $02, $01, $02, $02, $07, $06, $06, $06, $06, $06, $06, $06, $06, $02, $02, $01, $01, $01, $01, $01, $07, $05, $05, $01, $06, $06, $06, $06, $06, $05, $05, $06, $01, $01, $06, $06, $07, $03, $03, $04, $04, $06, $06, $06, $06, $05, $05, $06, $06, $06, $06, $06, $07, $05, $07, $07, $07, $06, $06, $06, $06, $05, $05, $01, $06, $06, $06, $06, $07, $00, $07, $07, $07, $01, $01, $03, $03, $05, $05, $02, $02, $01, $02, $02, $07, $00, $07, $07, $07, $01, $01, $03, $03, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $01, $01, $06, $06, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $00, $00, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $03, $03, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $03, $03, $05, $05, $05, $05, $05, $00, $00, $00

GFX_d97e8:: INCBIN "gfx/misc/d97e8.2bpp"

Debug_SpriteTest:: ; d9f38
	ret

Func_d9f39:
	push de
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	pop de
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
	inc hl
	ret

QueueMoveAnimScriptGFXUpdate:: ; d9f55 (36:5f55)
	di
	ld a, [wLCDC]
	or $3
	ld [wLCDC], a
	ld a, [wNextVBlankFlags]
	or $6
	ld [wNextVBlankFlags], a
	ei
	ret

MoveAnimScriptClearSprites:: ; d9f68
	ld bc, $a0
	ld e, $0
	ld hl, wOAMBuffer
	call FillMemory
	ret

Func_d9f74:: ; d9f74
	ld a, [hl]
	ld [wc263], a
	inc hl
	ld a, [hl]
	ld [wNumSpritesLoaded], a
	ret

Func_d9f7e:: ; d9f7e (36:5f7e)
	; void Func_d9f7e (char b, char c, short de, char * hl) {
	push bc
	push de
	push hl
	ld hl, sp+$5
	ld [hl], b
	ld hl, sp+$4
	ld [hl], c
	pop hl
	; extern short wc26b[16];
	; extern char wc28b[16];
	; extern char wc29b[16];
	; extern char wc2ab[16];
	; extern char wc2bb[16];
	; extern char * wc2f4;
	; short * wc265 = hl;
	write_hl_to wc265
	; short * wc267 = *wc265;
	read_hl_from wc265
	write_hl_to wc267
	; short * wc269 = (*wc265 + 0x20);
	read_hl_from wc265
	ld de, $20
	add hl, de
	write_hl_to wc269
	; char * wc85a = 0x10;
	ld a, $10
	ld [wc85a], a
	; char i;
	ld c, $0
	pop de
.loop
	; for (i=0; i<0x10; i++) {
	ld a, c
	cp $10
	jp nc, .quit
	; if (!((1 << i) & de)) {
	push de
	ld b, c
	ld hl, $1
	call LeftShiftHL
	ld a, e
	and l
	ld l, a
	ld a, d
	and h
	ld h, a
	ld a, l
	or h
	jp nz, .asm_d9fd7
	; *wc26b[i] = 0;
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	; }
	jp .next

.asm_d9fd7
	; else if (!(*wc267[i])) {
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, .asm_d9ffc
	; *wc26b[i] = 0;
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	; }
	jp .next

.asm_d9ffc
	; else {
	; *wc26b[i] = *(*wc267)[i] + *wc265;
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	; *wc28b[i] = *(*wc26b[i])[1];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	; *wc29b[i] = *(*wc26b[i])[2];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	; *wc2ab[i] = *(*wc26b[i])[3];
	ld l, c
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld e, c
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	; *wc2bb[i] = b;
	ld hl, sp+$3
	ld a, [hl]
	ld e, c
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld [hl], a
	; *wc2f4 = c;
	ld hl, sp+$2
	ld a, [hl]
	ld [wc2f4], a
	; }
.next
	; }
	inc c
	pop de
	jp .loop

.quit
	; }
	pop bc
	ret

Func_da07a:: ; da07a
	xor a
Func_da07b: ; da07b (36:607b)
	cp $10
	jp nc, Func_da092
	ld l, a
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	inc a
	jp Func_da07b

Func_da092: ; da092 (36:6092)
	ret

PlayMoveAnimScript:: ; da093
	push af
	push bc
	push bc
	push bc
	push bc
	ld hl, wNumSpritesLoaded
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	pop de
	push hl
	ld c, $0
	ld hl, sp+$4
	ld [hl], $f
Func_da0ac: ; da0ac (36:60ac)
	ld hl, sp+$4
	ld a, [hl]
	cp $ff
	jp nz, Func_da0b7
	jp Func_da4a1

Func_da0b7: ; da0b7 (36:60b7)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp nz, Func_da0ca
	jp Func_da497

Func_da0ca: ; da0ca (36:60ca)
	ld a, $1
	ld hl, sp+$4
	ld b, [hl]
	call LeftShiftA
	or c
	ld c, a
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld c, [hl]
	ld a, c
	cp $80
	jp z, Func_da30a
	ld a, c
	cp $ff
	jp z, Func_da30a
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc269
	add hl, de
	ld a, [hl]
	inc hl
	or [hl]
	jp z, Func_da30a
	ld l, c
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc269
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	ld c, l
	ld b, h
Func_da11d: ; da11d (36:611d)
	ld a, [bc]
	cp $ff
	jp z, Func_da30a
	push bc
	ld a, [bc]
	ld hl, wc263
	add [hl]
	ld hl, sp+$b
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	ld a, [wc85a]
	or [hl]
	ld hl, sp+$a
	ld [hl], a
	ld a, [wc2cb]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	add [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$7
	ld [hl], a
	ld a, [wc2cc]
	ld hl, sp+$8
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	add [hl]
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	add [hl]
	ld hl, sp+$6
	ld [hl], a
	ld l, c
	ld h, b
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld hl, sp+$9
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld c, [hl]
	ld hl, sp+$a
	ld a, [hl]
	and $40
	jp z, Func_da184
	ld a, c
	dec a
	add a
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$b
	ld [hl], a
Func_da184: ; da184 (36:6184)
	ld hl, sp+$a
	ld a, [hl]
	and $20
	jp z, Func_da196
	ld hl, sp+$9
	ld a, [hl]
	dec a
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$b
	ld [hl], a
Func_da196: ; da196 (36:6196)
	ld a, [wc2f4]
	or a
	jp nz, Func_da241
	ld e, $0
Func_da19f: ; da19f (36:619f)
	ld a, e
	cp c
	jp nc, Func_da23e
	push bc
	ld c, $0
Func_da1a7: ; da1a7 (36:61a7)
	ld a, c
	ld hl, sp+$b
	cp [hl]
	jp nc, Func_da201
	push de
	ld a, e
	add a
	add a
	add a
	ld hl, sp+$a
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld a, c
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$f
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da1f5
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$f
	ld [hl], a
	jp Func_da1fc

Func_da1f5: ; da1f5 (36:61f5)
	ld hl, sp+$f
	ld a, [hl]
	inc a
	ld hl, sp+$f
	ld [hl], a
Func_da1fc: ; da1fc (36:61fc)
	inc c
	pop de
	jp Func_da1a7

Func_da201: ; da201 (36:6201)
	ld hl, sp+$c
	ld a, [hl]
	and $20
	jp z, Func_da215
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$d
	ld [hl], a
	jp Func_da21e

Func_da215: ; da215 (36:6215)
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	sub [hl]
	ld hl, sp+$d
	ld [hl], a
Func_da21e: ; da21e (36:621e)
	ld hl, sp+$c
	ld a, [hl]
	and $40
	jp z, Func_da231
	ld hl, sp+$d
	ld a, [hl]
	add $f0
	ld hl, sp+$d
	ld [hl], a
	jp Func_da239

Func_da231: ; da231 (36:6231)
	ld hl, sp+$d
	ld a, [hl]
	add $10
	ld hl, sp+$d
	ld [hl], a
Func_da239: ; da239 (36:6239)
	inc e
	pop bc
	jp Func_da19f

Func_da23e: ; da23e (36:623e)
	jp Func_da300

Func_da241: ; da241 (36:6241)
	ld e, $0
Func_da243: ; da243 (36:6243)
	ld a, e
	cp c
	jp nc, Func_da300
	push bc
	ld c, $0
Func_da24b: ; da24b (36:624b)
	ld a, c
	ld hl, sp+$b
	cp [hl]
	jp nc, Func_da2c3
	push de
	ld a, e
	add a
	add a
	add a
	ld hl, sp+$a
	add [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld a, c
	add a
	add a
	add a
	ld hl, sp+$b
	add [hl]
	ld l, a
	ld a, $a8
	sub l
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$f
	ld a, [hl]
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da298
	ld hl, sp+$e
	ld a, [hl]
	and $df
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
	jp Func_da2a5

Func_da298: ; da298 (36:6298)
	ld hl, sp+$e
	ld a, [hl]
	or $20
	call GetHLAtSPPlus10
	ld [hl], a
	inc hl
	call WriteHLToSPPlus10
Func_da2a5: ; da2a5 (36:62a5)
	ld hl, sp+$e
	ld a, [hl]
	and $20
	jp z, Func_da2b7
	ld hl, sp+$f
	ld a, [hl]
	dec a
	ld hl, sp+$f
	ld [hl], a
	jp Func_da2be

Func_da2b7: ; da2b7 (36:62b7)
	ld hl, sp+$f
	ld a, [hl]
	inc a
	ld hl, sp+$f
	ld [hl], a
Func_da2be: ; da2be (36:62be)
	inc c
	pop de
	jp Func_da24b

Func_da2c3: ; da2c3 (36:62c3)
	ld hl, sp+$c
	ld a, [hl]
	and $20
	jp z, Func_da2d7
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	add [hl]
	ld hl, sp+$d
	ld [hl], a
	jp Func_da2e0

Func_da2d7: ; da2d7 (36:62d7)
	ld hl, sp+$d
	ld a, [hl]
	ld hl, sp+$b
	sub [hl]
	ld hl, sp+$d
	ld [hl], a
Func_da2e0: ; da2e0 (36:62e0)
	ld hl, sp+$c
	ld a, [hl]
	and $40
	jp z, Func_da2f3
	ld hl, sp+$d
	ld a, [hl]
	add $f0
	ld hl, sp+$d
	ld [hl], a
	jp Func_da2fb

Func_da2f3: ; da2f3 (36:62f3)
	ld hl, sp+$d
	ld a, [hl]
	add $10
	ld hl, sp+$d
	ld [hl], a
Func_da2fb: ; da2fb (36:62fb)
	inc e
	pop bc
	jp Func_da243

Func_da300: ; da300 (36:6300)
	pop bc
	ld hl, $6
	add hl, bc
	ld c, l
	ld b, h
	jp Func_da11d

Func_da30a: ; da30a (36:630a)
	pop bc
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	cp $1
	jp nc, Func_da497
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	add $4
	ld [hl], a
	inc hl
	ld a, [hl]
	adc $0
	ld [hl], a
	ld hl, sp+$9
	ld a, [hl]
	cp $1
	jp nz, Func_da379
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld a, [hl]
	cp $1
	jp nz, Func_da379
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	cp $80
	jp nz, Func_da379
	ld a, $1
	ld hl, sp+$4
	ld b, [hl]
	call LeftShiftA
	cpl
	and c
	ld c, a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld a, [hl]
	sub $4
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
Func_da379: ; da379 (36:6379)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	cp $80
	jp nz, Func_da447
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_da3bf
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2bb
	add hl, de
	ld e, $1
	ld a, [hl]
	sub e
	ld [hl], a
	or a
	jp nz, Func_da3bf
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld de, $0
	ld [hl], e
	inc hl
	ld [hl], d
	jp Func_da497

Func_da3bf: ; da3bf (36:63bf)
	push bc
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	reg16swap de, hl
	read_hl_from wc267
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	read_hl_from wc265
	add hl, de
	push hl
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	ld [hl], a
	ld hl, sp+$6
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$6
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	ld [hl], a
	ld a, [wc318]
	or a
	jp z, Func_da443
	ld a, [wc318]
	call OverworldPlaySFX
Func_da443: ; da443 (36:6443)
	pop bc
	jp Func_da497

Func_da447: ; da447 (36:6447)
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc28b
	add hl, de
	ld [hl], a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc29b
	add hl, de
	add [hl]
	ld [hl], a
	ld hl, sp+$4
	ld l, [hl]
	ld h, $0
	add hl, hl
	ld de, wc26b
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	inc de
	ld a, [de]
	ld hl, sp+$4
	ld e, [hl]
	ld d, $0
	ld hl, wc2ab
	add hl, de
	add [hl]
	ld [hl], a
Func_da497: ; da497 (36:6497)
	ld hl, sp+$4
	ld a, [hl]
	dec a
	ld hl, sp+$4
	ld [hl], a
	jp Func_da0ac

Func_da4a1: ; da4a1 (36:64a1)
	pop hl
	push hl
	ld a, l
	sub $a0
	ld a, h
	sbc $c4
	jp nc, Func_da4cb
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	pop hl
	push hl
	ld [hl], $ff
	inc hl
	pop de
	push hl
	jp Func_da4a1

Func_da4cb: ; da4cb (36:64cb)
	inc c
	dec c
	jp z, Func_da4d5
	ld a, $1
	jp Func_da4d6

Func_da4d5: ; da4d5 (36:64d5)
	xor a
Func_da4d6: ; da4d6 (36:64d6)
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Func_da4dc:: ; da4dc (36:64dc)
	ld hl, wOAMBuffer
.loop
	ld a, l
	sub low(wOAMBufferEnd)
	ld a, h
	sbc high(wOAMBufferEnd)
	jp nc, .done
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	ld a, $ff
	ld [hl], a
	inc hl
	jp .loop

.done
	ret

Func_da4fc:: ; da4fc
	ld a, [wNumSpritesLoaded]
	add a
	add a
	ld hl, $0
	ld hl, wOAMBuffer ; whoops
	ld l, a
	ld a, [wNumSpritesLoaded]
	ld b, a
	ld a, $28
	sub b
	ld b, a
	ld a, $ff
	ld de, $4
Func_da515: ; da515 (36:6515)
	ld [hl], a
	add hl, de
	dec b
	jp nz, Func_da515
	ld hl, $0
	ld hl, wc26b
	ld a, $0
	REPT $20
	ld [hli], a
	ENDR
	ret

Func_da544:
	ret

LoadEmoteGFX:: ; da545 (36:6545)
	push de
	push bc
	push bc
	push bc
	push bc
	push af
	ld [wFarCallDestBank], a
	read_hl_from_sp_plus $c
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$6
	ld bc, $4
	call FarCopyVideoData
	set_farcall_addrs_hli malloc
	call GetHLAtSPPlus10
	call FarCall
	call WriteHLToSPPlus4
	pop af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus8
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus8
	push hl
	read_hl_from_sp_plus $e
	pop de
	add hl, de
	pop de
	call FarDecompressVideoData
	ld hl, wc263
	ld l, [hl]
	ld h, $0
	call WriteHLToSPPlus4
	call GetHLAtSPPlus4
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8000
	add hl, de
	call WriteHLToSPPlus4
	pop hl
	push hl
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, l
	ld b, h
	pop hl
	push hl
	inc hl
	inc hl
	push hl
	call GetHLAtSPPlus6
	pop de
	call RequestVideoData
	set_farcall_addrs_hli free
	pop hl
	push hl
	call FarCall
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

DecompressEmoteAttrs:: ; da5db (36:65db)
	push de
	push bc
	push bc
	push bc
	push af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus10
	reg16swap de, hl
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, de
	reg16swap de, hl
	ld hl, sp+$4
	ld bc, $4
	call FarCopyVideoData
	set_farcall_addrs_hli malloc
	call GetHLAtSPPlus8
	call FarCall
	call WriteHLToSPPlus4
	pop af
	ld [wFarCallDestBank], a
	call GetHLAtSPPlus6
	ld c, l
	ld b, h
	pop hl
	push hl
	push hl
	call GetHLAtSPPlus6
	push hl
	read_hl_from_sp_plus $c
	pop de
	add hl, de
	pop de
	call FarDecompressVideoData
	pop hl
	push hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

Data_da631:
	db $00
	db $01
	db $02
	db $03
	db $08
	db $05
	db $06
	db $08
	db $08
	db $09
	db $09
	db $0a
	db $0b
	db $0c
	db $0c
	db $0d
	db $0e
	db $0f
	db $10
	db $11
	db $12
	db $13
	db $13
	db $14
	db $14
	db $15
	db $15
	db $15
	db $16
	db $16
	db $17
	db $17
	db $17
	db $00
	db $0d
	db $19
	db $1a
	db $1b
	db $1c
	db $1d
	db $00
	db $1f
	db $20
	db $00
	db $00
	db $00
	db $00
	db $00
	db $21
	db $22
	db $23
	db $00
	db $25
	db $04
	db $1f
	db $07
	db $26
	db $27
	db $28
	db $29
	db $2a
	db $2b

Data_da66f: ; da66f
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $06
	db $07
	db $08
	db $09
	db $0a
	db $0b
	db $0c
	db $0d
	db $0e
	db $0f
	db $10
	db $11
	db $12
	db $13
	db $14
	db $15
	db $16
	db $17
	db $18
	db $19
	db $1a
	db $1b
	db $1c
	db $1d
	db $1e
	db $1f
	db $20
	db $00
	db $22
	db $23
	db $24
	db $25
	db $26
	db $27
	db $00
	db $29
	db $2a
	db $00
	db $00
	db $00
	db $00
	db $00
	db $30
	db $31
	db $32
	db $00
	db $34
	db $35
	db $36
	db $37
	db $38
	db $39
	db $3a
	db $3b
	db $3b
	db $3b

Data_da6ad: ; da6ad
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $03
	db $01
	db $0f
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $07
	db $01
	db $01
	db $01
	db $03
	db $07
	db $01
	db $01
	db $03
	db $07
	db $1f
	db $00
	db $01
	db $01
	db $03
	db $01
	db $01
	db $01
	db $00
	db $01
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $01
	db $01
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01

Data_da6eb: ; da6eb
	db $00
	db $07
	db $07
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $07
	db $07
	db $07
	db $07
	db $05
	db $05
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $07
	db $07
	db $07
	db $07
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $06
	db $00
	db $05
	db $07
	db $07
	db $04
	db $07
	db $07
	db $00
	db $04
	db $04
	db $00
	db $00
	db $00
	db $00
	db $00
	db $04
	db $04
	db $05
	db $00
	db $07
	db $07
	db $06
	db $07
	db $07
	db $07
	db $07
	db $07
	db $05
	db $05

StartMoveAnimScript:: ; da729 (36:6729)
	push af
	push de
	push bc
	push bc
	ld hl, sp+$2
	ld [hl], $0
	ld hl, sp+$3
	ld [hl], $0
	ld hl, sp+$2
	call Func_d9f74
	ld a, $2
	ld [wFarCallDestBank], a
	ld hl, $0
	pop de
	push hl
	ld c, $1
	ld hl, sp+$7
	ld a, [hl]
	cp $3a
	jp z, Func_da79b
	cp $39
	jp z, Func_da78e
	cp $38
	jp z, Func_da78e
	cp $5
	jp z, Func_da781
	cp $3d
	jp z, Func_da76c
	cp $3c
	jp z, Func_da76c
	cp $3b
	jp nz, Func_da7a8
Func_da76c: ; da76c (36:676c)
	ld a, [wc85a]
	or $1
	ld [wc85a], a
	xor a
	ld [wc2cb], a
	xor a
	ld [wc2cc], a
	ld c, $1
	jp Func_da7b2

Func_da781: ; da781 (36:6781)
	ld a, $68
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da78e: ; da78e (36:678e)
	ld a, $36
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da79b: ; da79b (36:679b)
	ld a, $40
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
	jp Func_da7b2

Func_da7a8: ; da7a8 (36:67a8)
	ld a, $28
	ld [wc2cb], a
	ld a, $58
	ld [wc2cc], a
Func_da7b2: ; da7b2 (36:67b2)
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da66f
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_da803
	push bc
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, Data_da631
	add hl, de
	ld c, [hl]
	ld de, Emotes_34000
	ld a, BANK(Emotes_34000)
	call LoadEmoteGFX
	ld hl, sp+$9
	ld e, [hl]
	ld d, $0
	ld hl, Data_da66f
	add hl, de
	ld c, [hl]
	ld de, EmoteAttrs_3570d
	ld a, BANK(EmoteAttrs_3570d)
	call DecompressEmoteAttrs
	call WriteHLToSPPlus4
	pop bc
	ld hl, sp+$4
	ld l, [hl]
	ld h, c
	ld c, l
	ld b, h
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da6ad
	add hl, de
	ld l, [hl]
	ld h, $0
	push hl
	call GetHLAtSPPlus4
	pop de
	call Func_d9f7e
Func_da803: ; da803 (36:6803)
	check_cgb
	jp nz, Func_da82e
	ld hl, sp+$7
	ld a, [hl]
	cp $3e
	jp c, Func_da81e
	ld a, [wc85a]
	or $7
	ld [wc85a], a
	jp Func_da82e

Func_da81e: ; da81e (36:681e)
	ld a, [wc85a]
	ld hl, sp+$7
	ld e, [hl]
	ld d, $0
	ld hl, Data_da6eb
	add hl, de
	or [hl]
	ld [wc85a], a
Func_da82e: ; da82e (36:682e)
	pop hl
	push hl
	pop bc
	pop bc
	pop bc
	pop bc
	ret

SetOAMUpdatePointer:: ; da835
	ld [wOAMEntryCurrentlyBeingUpdated], a
	ret

UpdateCurSprite:: ; da839 (36:6839)
; Parameters:
; a: VRam slot
; b: Facing
; c: Animation frame
; d: x coord
; e: y coord
	push af
	ld a, b
	and $3
	cp $1
	jp z, .XFlip
	ld a, c
	add a
	add a
	pop bc
	add b
	ld b, a
	check_cgb
	jr z, .asm_da853
	ld c, $10
	jr .asm_da859

.asm_da853
	ld a, [wMapObjectCGBAttrsOverride]
	or $10
	ld c, a
.asm_da859
	push de
	ld a, [wOAMEntryCurrentlyBeingUpdated]
	ld h, $0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add -$8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wOAMEntryCurrentlyBeingUpdated]
	add $4
	ld [wOAMEntryCurrentlyBeingUpdated], a
	ret

.XFlip: ; da89f (36:689f)
	ld a, c
	add a
	add a
	pop bc
	add b
	ld b, a
	check_cgb
	jr z, .asm_da8b0
	ld c, $30
	jr .asm_da8b6

.asm_da8b0
	ld a, [wMapObjectCGBAttrsOverride]
	or $30
	ld c, a
.asm_da8b6
	push de
	ld a, [wOAMEntryCurrentlyBeingUpdated]
	ld h, $0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	pop de
	ld a, d
	add $8
	ld d, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add -$8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	add $8
	ld e, a
	ld a, d
	ld [hli], a
	add $8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	add -$8
	ld d, a
	ld a, b
	ld [hli], a
	inc b
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wOAMEntryCurrentlyBeingUpdated]
	add $4
	ld [wOAMEntryCurrentlyBeingUpdated], a
	ret

Func_da900:
	ret

Func_da901:: ; da901
	push hl
	push bc
	push bc
	push bc
	push bc
	push bc
	ld hl, sp+$a
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	push de
	push hl
	ld e, h
	ld d, $0
	inc de
	ld hl, sp+$e
	ld [hl], e
	pop hl
	ld e, l
	ld d, $0
	inc de
	inc de
	ld hl, sp+$b
	ld [hl], e
	pop de
	ld hl, sp+$8
	ld [hl], d
	ld hl, sp+$7
	ld [hl], e
	ld hl, sp+$5
	ld [hl], $0
	xor a
.loop
	cp 40
	jp nc, .break
	push af
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	ld a, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld hl, sp+$4
	ld [hl], a
	ld a, c
	add $8
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, .next
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$9
	add [hl]
	add a
	add a
	add a
	ld l, a
	ld a, c
	cp l
	jp nc, .next
	ld hl, sp+$4
	ld a, [hl]
	add $8
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, .next
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$a
	add [hl]
	add a
	add a
	add a
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	cp e
	jp nc, .next
	ld hl, sp+$7
	ld a, [hl]
	inc a
	ld hl, sp+$7
	ld [hl], a
.next
	pop af
	inc a
	jp .loop

.break
	set_farcall_addrs_hli malloc
	ld hl, sp+$5
	ld l, [hl]
	ld h, $0
	add hl, hl
	inc hl
	call FarCall
	pop de
	push hl
	push hl
	ld hl, sp+$7
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	ld hl, sp+$8
	ld [hl], $0
.loop2
	ld hl, sp+$8
	ld a, [hl]
	cp $28
	jp nc, .break2
	ld hl, sp+$8
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAMBuffer
	add hl, de
	call WriteHLToSPPlus7
	call GetHLAtSPPlus7
	ld c, [hl]
	call GetHLAtSPPlus7
	inc hl
	ld e, [hl]
	ld hl, sp+$4
	ld [hl], e
	ld a, c
	add $8
	ld e, a
	ld hl, sp+$b
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, .next2
	ld hl, sp+$b
	ld a, [hl]
	ld hl, sp+$9
	add [hl]
	add a
	add a
	add a
	ld l, a
	ld a, c
	cp l
	jp nc, .next2
	ld hl, sp+$4
	ld a, [hl]
	add $8
	ld e, a
	ld hl, sp+$c
	ld a, [hl]
	add a
	add a
	add a
	cp e
	jp nc, .next2
	ld hl, sp+$c
	ld a, [hl]
	ld hl, sp+$a
	add [hl]
	add a
	add a
	add a
	ld e, a
	ld hl, sp+$4
	ld a, [hl]
	cp e
	jp nc, .next2
	ld hl, sp+$8
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus7
	ld a, [hl]
	call GetHLAtSPPlus4
	ld [hl], a
	inc hl
	call WriteHLToSPPlus4
	call GetHLAtSPPlus7
	ld [hl], $a0
.next2
	ld hl, sp+$8
	ld a, [hl]
	inc a
	ld hl, sp+$8
	ld [hl], a
	jp .loop2

.break2
	pop hl
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	pop bc
	ret

SetSpriteYCoordinatesAndCollectGarbage:: ; daa40
	push hl
	ld c, l
	ld b, h
	ld a, [bc]
	inc bc
	ld l, a
	xor a
.loop
	cp l
	jp nc, .done
	push hl
	push af
	ld a, [bc]
	inc bc
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOAM00YCoord
	add hl, de
	ld a, [bc]
	inc bc
	ld [hl], a
	pop af
	inc a
	pop hl
	jp .loop

.done
	set_farcall_addrs_hli free
	pop hl
	call FarCall
	ret

Func_daa71:
	ret

INCLUDE "maps/enter_map.asm"


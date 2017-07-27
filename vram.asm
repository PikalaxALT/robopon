INCLUDE "includes.asm"

SECTION "Vram0", VRAM, BANK[0]
vTiles0a:: ds $80 tiles
vTiles0b:: ds $80 tiles
vTiles0c:: ds $80 tiles

vBGMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
vWindowMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

SECTION "Vram1", VRAM, BANK[1]
vTiles1a:: ds $80 tiles
vTiles1b:: ds $80 tiles
vTiles1c:: ds $80 tiles

vBGAttrs:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
vWindowAttrs:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

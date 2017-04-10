VBlank::
	push af
	push hl
	ld l, $ff
	ld a, [wNextVBlankFlags]
; bit 7: call wVBlankCallback (far call with SRAM open)
; bit 6: push BGMap metatiles or CGB palettes
; bit 5: push DMG pals
; bit 4: push SCX and SCY
; bit 3: read joypad
; bit 2: push LCDC
; bit 1: push OAM
; bit 0: handle video transfer request
	ld h, a
	bit 0, h
	jr z, .skip_vblank_transfer_request
	push hl
	ld a, [wVideoTransferRequestFlags]
	bit 1, a
	jr z, .no_bank_switch
	ld a, [hROMBank]
	push af
	ld a, [wVideoTransferRequestBank]
	call BankSwitch
	call HandleVideoTransferRequest
	pop af
	call BankSwitch
	pop hl
	jr .skip_vblank_transfer_request

.no_bank_switch
	call HandleVideoTransferRequest
	pop hl
.skip_vblank_transfer_request
	bit 6, h
	jp z, .skip_bgmap_and_pals
	res 6, l
	push hl
	ld a, [wVBlankTransferFlags]
	or a
	jp z, .push_cgb_palettes
	; push a metatile to the bgmap
	; there are two queues
	push bc
	push de
	ld a, [wVBlankTransferFlags]
	and $1
	jp z, .skip_bgmap_tile_push
	ld a, [wVBlankMetaTileTransferQueue0Dest]
	ld l, a
	ld a, [wVBlankMetaTileTransferQueue0Dest + 1]
	ld h, a
	push hl
	ld a, [wVBlankMetaTileTransferQueue0TileSource]
	ld e, a
	ld a, [wVBlankMetaTileTransferQueue0TileSource + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, BG_MAP_WIDTH - 2
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop hl
	; transfer attrs if and only if cgb
	ld a, [wSystemType]
	cp $11
	jp nz, .skip_bgmap_tile_push
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld a, [wVBlankMetaTileTransferQueue0AttrSource]
	ld e, a
	ld a, [wVBlankMetaTileTransferQueue0AttrSource + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, BG_MAP_WIDTH - 2
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [rVBK]
	and $ff ^ 1
	ld [rVBK], a
.skip_bgmap_tile_push
	ld a, [wVBlankTransferFlags]
	and $2
	jp z, .skip_bgmap_tile_push2
	ld a, [wVBlankMetaTileTransferQueue1Dest]
	ld l, a
	ld a, [wVBlankMetaTileTransferQueue1Dest + 1]
	ld h, a
	push hl
	ld a, [wVBlankMetaTileTransferQueue1TileSource]
	ld e, a
	ld a, [wVBlankMetaTileTransferQueue1TileSource + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, BG_MAP_WIDTH - 2
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop hl
	; transfer attrs if and only if cgb
	ld a, [wSystemType]
	cp $11
	jp nz, .skip_bgmap_tile_push2
	ld a, [rVBK]
	or $1
	ld [rVBK], a
	ld a, [wVBlankMetaTileTransferQueue1AttrSource]
	ld e, a
	ld a, [wVBlankMetaTileTransferQueue1AttrSource + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld bc, BG_MAP_WIDTH - 2
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [rVBK]
	and $ff ^ 1
	ld [rVBK], a
.skip_bgmap_tile_push2
	xor a
	ld [wVBlankTransferFlags], a
	pop de
	pop bc
	jp .finished_bgmap_or_pals

.push_cgb_palettes
	push bc
	ld hl, wCGB_BGPalsBuffer
	ld a, $80
	ld c, rBGPI % $100
	ld [$ff00+c], a
	ld c, rOBPI % $100
	ld [$ff00+c], a
	ld b, $8
	ld c, rBGPD % $100
.bgpals
rept 8
	ld a, [hli]
	ld [$ff00+c], a
endr
	dec b
	jr nz, .bgpals
	ld b, $8
	ld c, rOBPD % $100
.obpals
rept 8
	ld a, [hli]
	ld [$ff00+c], a
endr
	dec b
	jr nz, .obpals
	pop bc
.finished_bgmap_or_pals
	pop hl
.skip_bgmap_and_pals
	bit 1, h
	jr z, .skip_oam
	res 1, l
	call hPushOAM
.skip_oam
	bit 2, h
	jr z, .skip_push_lcdc
	res 2, l
.wait_ly
	ld a, [rLY]
	cp $90
	jr z, .wait_ly
	ld a, [wLCDC]
	ld [rLCDC], a
.skip_push_lcdc
	bit 3, h
	jr z, .skip_joypad
	call VBlankReadJoypad
.skip_joypad
	bit 4, h
	jr z, .skip_push_screen_coords
	res 4, l
	ld a, [wLCDC]
	bit 3, a
	jr nz, .map_selected_9c00
	ld a, [wSCX]
	ld [rSCX], a
	ld a, [wSCY]
	ld [rSCY], a
	jr .skip_push_screen_coords

.map_selected_9c00
	ld a, [wSCX2]
	ld [rSCX], a
	ld a, [wSCY2]
	ld [rSCY], a
.skip_push_screen_coords
	bit 5, h
	jr z, .skip_push_dmg_pals
	res 5, l
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP0]
	ld [rOBP0], a
	ld a, [wOBP1]
	ld [rOBP1], a
.skip_push_dmg_pals
	bit 7, h
	jr z, .skip_vblank_callback
	push hl
	push bc
	push de
	ld hl, wFarCallDestBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [hSRAMBank]
	push af
	ld a, [hROMBank]
	push af
	ld a, [wVBlankCallbackRAMBank]
	call GetSRAMBank
	ld a, [wVBlankCallbackROMBank]
	call BankSwitch
	ld hl, .Return
	push hl
	ld a, [wVBlankCallbackAddress]
	ld l, a
	ld a, [wVBlankCallbackAddress + 1]
	ld h, a
	push hl
	ret

.Return
	pop af
	call BankSwitch
	pop af
	call GetSRAMBank
	pop de
	pop af
	ld hl, wFarCallDestBank
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	pop bc
	pop hl
.skip_vblank_callback
	ld a, [wNextVBlankFlags]
	and l
	ld [wNextVBlankFlags], a
	ld [wLastVBlankFlags], a
	ld a, [wTextBlinkerFrameCounter]
	inc a
	ld [wTextBlinkerFrameCounter], a
	pop hl
	pop af
	reti

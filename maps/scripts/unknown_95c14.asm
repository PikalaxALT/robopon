
Data_95c0c:
	db $0a, $07, $ff, $ff

Data_95c10:
	db $0a, $06, $ff, $ff

Func_95c14:: ; 95c14
	push af
	set_farcall_addrs_hli FadeInMap
	xor a
	call FarCall
	ld hl, $003c
	scall ScriptSleep
	pop af
	ld e, a
	ld a, $01
	scall ChangeSprite
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld bc, Data_95c0c
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld hl, $005b
	scall EventFlagAction
	call Func_9596a
	ld bc, Data_95c10
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	ret

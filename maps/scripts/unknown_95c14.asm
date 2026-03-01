
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
	sprite_face $02, $01
	showperson $01
	move_person $01, Data_95c0c, 1
	scall WaitNPCStep
	sprite_face $00, $01
	setevent $005b
	call Func_9596a
	move_person $01, Data_95c10, 1
	scall WaitNPCStep
	hideperson $01
	ret

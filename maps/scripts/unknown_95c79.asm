
Data_95c73:
	db $0a, $07, $09, $07, $ff, $ff

Func_95c79:: ; 95c79
	ld e, a
	ld a, $01
	scall ChangeSprite
	sprite_face $02, $01
	showperson $01
	move_person $01, Data_95c73, 1
	scall WaitNPCStep
	hideperson $01
	scall Func_80f02
	ret

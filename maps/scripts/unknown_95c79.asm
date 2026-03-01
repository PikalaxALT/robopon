
Data_95c73:
	db $0a, $07, $09, $07, $ff, $ff

Func_95c79:: ; 95c79
	ld e, a
	ld a, $01
	scall ChangeSprite
	ld e, $02
	ld a, $01
	scall SpriteFace
	ld e, $01
	ld a, $01
	scall SetPersonVisibilityState
	ld bc, Data_95c73
	ld e, $25
	ld a, $01
	scall MovePersonAndWait
	scall WaitNPCStep
	ld e, $00
	ld a, $01
	scall SetPersonVisibilityState
	scall Func_80f02
	ret

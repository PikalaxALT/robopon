SECTION "rst $00", ROM0 [$00]
Serial_::
	jp Func_0388

SECTION "rst $08", ROM0 [$08]
	jp Predef

Bank_000b:: ; 000b
	db BANK(Func_78100)
Bank_000c:: ; 000c
	db $1e
Byte_000d:: ; 000d
	db $4a
Bank_000e:: ; 000e
	db BANK(Pointers_78096)
Bank_000f:: ; 000f
	db BANK(Pointers_7c000) ; BANK(VBlank2)

SECTION "rst $10", ROM0 [$10]
	jp Func_00c9
Byte_0013:: ; 0013
	db $01
Byte_0014:: ; 0014
	db $08
Pointer_0015:: ; 0015
	dbw $01, $a1f0

SECTION "rst $20", ROM0 [$20]
BankSwitch_0020:: ; 0020
	ld [hROMBank], a
	ld [HuC3RomBank], a
	ret

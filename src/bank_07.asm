INCLUDE "includes.asm"
INCLUDE "charmap.asm"
SECTION "Bank 07", ROMX
Pointers_1c000:: ; 1c000
	dbw BANK(Data_1c018) - BANK(Pointers_1c000), Data_1c018
	dbw BANK(Data_1c4fe) - BANK(Pointers_1c000), Data_1c4fe
	dbw BANK(Data_1c9e0) - BANK(Pointers_1c000), Data_1c9e0
	dbw BANK(Data_1ce64) - BANK(Pointers_1c000), Data_1ce64
	dbw BANK(Data_1d352) - BANK(Pointers_1c000), Data_1d352
	dbw BANK(Data_1d90f) - BANK(Pointers_1c000), Data_1d90f
	dbw BANK(Data_1dda1) - BANK(Pointers_1c000), Data_1dda1
	dbw BANK(Data_1e2bf) - BANK(Pointers_1c000), Data_1e2bf

Data_1c018: INCBIN "maps/unknown_1c018/unknown_1c018.bin.rz"
Data_1c4fe: INCBIN "maps/unknown_1c018/unknown_1c4fe.bin.rz"
Data_1c9e0: INCBIN "maps/unknown_1c018/unknown_1c9e0.bin.rz"
Data_1ce64: INCBIN "maps/unknown_1c018/unknown_1ce64.bin.rz"
Data_1d352: INCBIN "maps/unknown_1c018/unknown_1d352.bin.rz"
Data_1d90f: INCBIN "maps/unknown_1c018/unknown_1d90f.bin.rz"
Data_1dda1: INCBIN "maps/unknown_1c018/unknown_1dda1.bin.rz"
Data_1e2bf: INCBIN "maps/unknown_1c018/unknown_1e2bf.bin.rz"


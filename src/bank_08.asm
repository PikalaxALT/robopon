INCLUDE "includes.asm"
INCLUDE "charmap.asm"

IF DEF(LANG_JP)
SETCHARMAP kana
ENDC

SECTION "Bank 08", ROMX

Func_20000: ; 20000
	ret

Data_20001: ; 20001
	db $14, $32, $5a, $64, $64, $4b, $2e, $32, $28, $46, $64, $14, $14, $3c, $64, $64
	db $64, $4b, $2e, $32, $28, $50, $64, $0a, $0a, $32, $5a, $64, $64, $4b, $23, $22
	db $1e, $46, $64, $0a, $00, $00, $28, $50, $64, $4d, $30, $34, $14, $3c, $64, $0a
	db $0a, $32, $5a, $64, $64, $0b, $22, $31, $32, $5a, $64, $0a, $0a, $32, $5a, $64
	db $64, $04, $05, $06, $32, $5a, $64, $0a, $1e, $3c, $64, $64, $64, $36, $37, $38
	db $21, $42, $64, $0a, $00, $1e, $46, $5a, $64, $23, $24, $25, $32, $50, $64, $0a
	db $14, $28, $46, $5a, $64, $25, $26, $27, $32, $50, $64, $0a, $14, $28, $46, $5a
	db $64, $48, $48, $48, $32, $63, $64, $0a, $0a, $32, $5a, $64, $64, $2e, $32, $0b
	db $1e, $46, $64, $0a, $00, $14, $32, $64, $64, $4b, $23, $22, $1e, $3c, $64, $0a
	db $00, $00, $00, $64, $64, $4c, $2f, $33, $28, $50, $64, $14, $00, $00, $32, $5a
	db $64, $0b, $22, $28, $28, $46, $64, $0a, $00, $00, $00, $00, $64, $4d, $30, $34
	db $0a, $32, $64, $32, $00, $00, $00, $00, $64, $4d, $30, $34, $0a, $32, $64, $32
	db $00, $00, $00, $00, $64, $4d, $30, $34, $0a, $32, $64, $28, $00, $00, $00, $00
	db $64, $4d, $30, $34, $0a, $32, $64, $28, $00, $00, $00, $00, $64, $4d, $30, $34
	db $0a, $32, $64, $1e, $00, $00, $00, $00, $64, $4d, $30, $34, $0a, $32, $64, $14
	db $00, $00, $00, $00, $64, $4d, $30, $34, $0a, $32, $64, $0a

Text_200fd:: ; 200fd
IF DEF(LANG_JP)
	dstr "エネだま"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20102:: ; 20102
IF DEF(LANG_JP)
	dstr "は"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20104:: ; 20104
IF DEF(LANG_JP)
	dstr "G"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20106:: ; 20106
IF DEF(LANG_JP)
	dstr "レベル"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_2010a:: ; 2010a
IF DEF(LANG_JP)
	dstr "の"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_2010c: ; 2010c
	dw Text_200fd
	dw Text_20102
	dw Text_20104
	dw Text_20106
	dw Text_2010a

Text_20116:: ; 20116
IF DEF(LANG_JP)
	dstr "を ひろった"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_2011d:: ; 2011d
IF DEF(LANG_JP)
	dstr "ひかっている"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20124:: ; 20124
IF DEF(LANG_JP)
	dstr "しかし いっぱいなので すてた"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20134:: ; 20134
IF DEF(LANG_JP)
	dstr "けいけんちが ふえた"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_2013f:: ; 2013f
IF DEF(LANG_JP)
	dstr "に なった"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20145:: ; 20145
IF DEF(LANG_JP)
	dstr "ほかくに せいこうした"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20151:: ; 20151
IF DEF(LANG_JP)
	dstr "ほかくに しっぱいした"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_2015d:: ; 2015d
IF DEF(LANG_JP)
	dstr "しかし だれもたべられない"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_2016b:: ; 2016b
IF DEF(LANG_JP)
	dstr "そのコマンドは つかえません"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_2017a: ; 2017a
	dw Text_20116
	dw Text_2011d
	dw Text_20124
	dw Text_20134
	dw Text_2013f
	dw Text_20145
	dw Text_20151
	dw Text_2015d
	dw Text_2016b

Text_2018c: ; 2018c
IF DEF(LANG_JP)
	dstr "ここでは"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_20191: ; 20191
IF DEF(LANG_JP)
	dstr "しようできない"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_20199:: ; 20199
	dw Text_2018c
	dw Text_20191
	dw $0

Text_2019f: ; 2019f
IF DEF(LANG_JP)
	dstr "ひとのものを"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_201a6: ; 201a6
IF DEF(LANG_JP)
	dstr "とっちゃいけないよ!"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_201b1:: ; 201b1
	dw Text_2019f
	dw Text_201a6
	dw $0

Text_201b7:: ; 201b7
IF DEF(LANG_JP)
	dstr "は まだ がまんしている!"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_201c5: ; 201c5
	dw Text_201b7

INCLUDE "text/attack_categories.asm"
Text_202d7: ; 202d7
IF DEF(LANG_JP)
	dstr "エネルギー ポイントが"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Text_202e3: ; 202e3
IF DEF(LANG_JP)
	dstr "たりません!"
ELIF DEF(LANG_EN)
	dstr ""
ENDC

Pointers_202ea:: ; 202ea
	dw Text_202d7
	dw Text_202e3
	dw $0


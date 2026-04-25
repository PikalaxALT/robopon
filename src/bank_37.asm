INCLUDE "includes.asm"
INCLUDE "charmap.asm"

SECTION "Bank 37", ROMX

IF DEF(LANG_EN)

Func_dc000::
    ret

INCBIN "baserom-sun-en.gbc", $dc001, $45

Data_dc046::

INCBIN "baserom-sun-en.gbc", $dc046, $2

Data_dc048::

INCBIN "baserom-sun-en.gbc", $dc048, $2

Data_dc04a::

INCBIN "baserom-sun-en.gbc", $dc04a, $2

Data_dc04c::

INCBIN "baserom-sun-en.gbc", $dc04c, $2

Data_dc04e::

INCBIN "baserom-sun-en.gbc", $dc04e, $1a1

Data_dc1ef::

INCBIN "baserom-sun-en.gbc", $dc1ef, $2

Data_dc1f1::

INCBIN "baserom-sun-en.gbc", $dc1f1, $2

Data_dc1f3::

INCBIN "baserom-sun-en.gbc", $dc1f3, $ad

Data_dc2a0::

INCBIN "baserom-sun-en.gbc", $dc2a0, $2

Data_dc2a2::

INCBIN "baserom-sun-en.gbc", $dc2a2, $5c

Data_dc2fe::

INCBIN "baserom-sun-en.gbc", $dc2fe, $2

Data_dc3b2::

INCBIN "baserom-sun-en.gbc", $dc3b2, $2

Data_dc3b4::

INCBIN "baserom-sun-en.gbc", $dc3b4, $2

Data_dc3b6::

INCBIN "baserom-sun-en.gbc", $dc3b6, $2

Data_dc3b8::

INCBIN "baserom-sun-en.gbc", $dc3b8, $a4

Data_dc45c::

INCBIN "baserom-sun-en.gbc", $dc45c, $2

Data_dc45e::

INCBIN "baserom-sun-en.gbc", $dc45e, $25

Data_dc483::

INCBIN "baserom-sun-en.gbc", $dc483, $2

Data_dc485::

INCBIN "baserom-sun-en.gbc", $dc485, $32

Data_dc4b7::

INCBIN "baserom-sun-en.gbc", $dc4b7, $2

Data_dc4b9::

INCBIN "baserom-sun-en.gbc", $dc4b9, $54

Data_dc50d::

INCBIN "baserom-sun-en.gbc", $dc50d, $2

Data_dc50f::

INCBIN "baserom-sun-en.gbc", $dc50f, $16c

Data_dc67b::

INCBIN "baserom-sun-en.gbc", $dc67b, $2

Data_dc67d::

INCBIN "baserom-sun-en.gbc", $dc67d, $2

Data_dc67f::

INCBIN "baserom-sun-en.gbc", $dc67f, $2f5

Data_dc974::

INCBIN "baserom-sun-en.gbc", $dc974, $2

Data_dc976::

INCBIN "baserom-sun-en.gbc", $dc976, $2

Data_dc978::

INCBIN "baserom-sun-en.gbc", $dc978, $1c

Data_dc994::

INCBIN "baserom-sun-en.gbc", $dc994, $2

Data_dc996::

INCBIN "baserom-sun-en.gbc", $dc996, $7b

Pointers_dca11::

INCBIN "baserom-sun-en.gbc", $dca11, $14

Data_dca25::

INCBIN "baserom-sun-en.gbc", $dca25, $13

Data_dca38::

INCBIN "baserom-sun-en.gbc", $dca38, $18e

Data_dcbc6::

INCBIN "baserom-sun-en.gbc", $dcbc6, $2

Data_dcbc8::

INCBIN "baserom-sun-en.gbc", $dcbc8, $2

Data_dcbca::

INCBIN "baserom-sun-en.gbc", $dcbca, $2

Data_dcbcc::

INCBIN "baserom-sun-en.gbc", $dcbcc, $1f

Data_dcbeb::

INCBIN "baserom-sun-en.gbc", $dcbeb, $2

Data_dcbed::

INCBIN "baserom-sun-en.gbc", $dcbed, $1b

Data_dcc08::

INCBIN "baserom-sun-en.gbc", $dcc08, $2

Data_dcc0a::

INCBIN "baserom-sun-en.gbc", $dcc0a, $2

Data_dcc0c::

INCBIN "baserom-sun-en.gbc", $dcc0c, $2

Data_dcc0e::

INCBIN "baserom-sun-en.gbc", $dcc0e, $18

Data_dcc26::

INCBIN "baserom-sun-en.gbc", $dcc26, $2

Data_dcc28::

INCBIN "baserom-sun-en.gbc", $dcc28, $2

Data_dcc2a::

INCBIN "baserom-sun-en.gbc", $dcc2a, $17

Data_dcc41::

INCBIN "baserom-sun-en.gbc", $dcc41, $2

Data_dcc43::

INCBIN "baserom-sun-en.gbc", $dcc43, $2

Data_dcc45::

INCBIN "baserom-sun-en.gbc", $dcc45, $1f

Data_dcc64::

INCBIN "baserom-sun-en.gbc", $dcc64, $2

Data_dcc66::

INCBIN "baserom-sun-en.gbc", $dcc66, $2

Data_dcc668::

INCBIN "baserom-sun-en.gbc", $dcc68, $10

Data_dcc78::

INCBIN "baserom-sun-en.gbc", $dcc78, $2

Data_dcc7a::

INCBIN "baserom-sun-en.gbc", $dcc7a, $2

Data_dcc7c::

INCBIN "baserom-sun-en.gbc", $dcc7c, $f

Data_dcc8b::

INCBIN "baserom-sun-en.gbc", $dcc8b, $2

Data_dcc8d::

INCBIN "baserom-sun-en.gbc", $dcc8d, $2

Data_dcc8f::

INCBIN "baserom-sun-en.gbc", $dcc8f, $2

Data_dcc91::

INCBIN "baserom-sun-en.gbc", $dcc91, $23

Data_dccb4::

INCBIN "baserom-sun-en.gbc", $dccb4, $2

Data_dccb6::

INCBIN "baserom-sun-en.gbc", $dccb6, $8

Data_dccbe::

INCBIN "baserom-sun-en.gbc", $dccbe, $2

Data_dccc0::

INCBIN "baserom-sun-en.gbc", $dccc0, $2

Data_dccc2::

INCBIN "baserom-sun-en.gbc", $dccc2, $2

Data_dccc4::

INCBIN "baserom-sun-en.gbc", $dccc4, $1d

Data_dcce1::

INCBIN "baserom-sun-en.gbc", $dcce1, $2

Data_dcce3::

INCBIN "baserom-sun-en.gbc", $dcce3, $2

Data_dcce5::

INCBIN "baserom-sun-en.gbc", $dcce5, $6e

Data_dcd53::

INCBIN "baserom-sun-en.gbc", $dcd53, $2

Data_dcd55::

INCBIN "baserom-sun-en.gbc", $dcd55, $15

Data_dcd6a::

INCBIN "baserom-sun-en.gbc", $dcd6a, $2

Data_dce78::

INCBIN "baserom-sun-en.gbc", $dce78, $2

Data_dce7a::

INCBIN "baserom-sun-en.gbc", $dce7a, $2

Data_dce7c::

INCBIN "baserom-sun-en.gbc", $dce7c, $2ed

Func_dd169::

INCBIN "baserom-sun-en.gbc", $dd169, $663

Func_dd7cc::

INCBIN "baserom-sun-en.gbc", $dd7cc, $8c8

Func_de094::

INCBIN "baserom-sun-en.gbc", $de094, $194

Func_de228::

INCBIN "baserom-sun-en.gbc", $de228, $1bf

Func_de3e7::

INCBIN "baserom-sun-en.gbc", $de3e7, $f6

Func_de4dd::

INCBIN "baserom-sun-en.gbc", $de4dd, $f6

Func_de5d9::

INCBIN "baserom-sun-en.gbc", $de5d9, $239

Func_de812::

INCBIN "baserom-sun-en.gbc", $de812, $353

Func_deb65::

INCBIN "baserom-sun-en.gbc", $deb65, $a2

Func_dec07::

INCBIN "baserom-sun-en.gbc", $dec07, $1234

ENDC

; dfe3b

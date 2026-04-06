INCLUDE "includes.asm"
INCLUDE "charmap.asm"

SECTION "Bank 37", ROMX

IF DEF(LANG_EN)

Func_dc000::
    ret

INCBIN "baserom-sun-en.gbc", $dc001, $973

Data_dc974::

INCBIN "baserom-sun-en.gbc", $dc974, $2

Data_dc976::

INCBIN "baserom-sun-en.gbc", $dc976, $2

Data_dc978::

INCBIN "baserom-sun-en.gbc", $dc978, $99

Pointers_dca11::

INCBIN "baserom-sun-en.gbc", $dca11, $1f7

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

INCBIN "baserom-sun-en.gbc", $dcc91, $4d8

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

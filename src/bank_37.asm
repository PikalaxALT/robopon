INCLUDE "includes.asm"
INCLUDE "charmap.asm"

SECTION "Bank 37", ROMX

IF DEF(LANG_EN)

Func_dc000::
    ret

INCBIN "baserom-sun-en.gbc", $dc001, $17cb

Func_dd7cc::

INCBIN "baserom-sun-en.gbc", $dd7cc, $8c8

Func_de094::

INCBIN "baserom-sun-en.gbc", $de094, $363

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

; Menu icons for species without a follower sprite.
; Every other species uses the first two frames of its follower sprite as its
; menu icon (see gfx/followers.asm and data/pokemon/icon_pointers.asm).
; The old icon PNGs in gfx/icons/ are kept for reference; they aren't built.

SECTION "Mon Icons", ROMX

; Alola
RowletIcon::     INCBIN "gfx/icons/alola/rowlet.2bpp"
DartrixIcon::    INCBIN "gfx/icons/alola/dartrix.2bpp"
DecidueyeIcon::  INCBIN "gfx/icons/alola/decidueye.2bpp"
LittenIcon::     INCBIN "gfx/icons/alola/litten.2bpp"
TorracatIcon::   INCBIN "gfx/icons/alola/torracat.2bpp"
IncineroarIcon:: INCBIN "gfx/icons/alola/incineroar.2bpp"
PopplioIcon::    INCBIN "gfx/icons/alola/popplio.2bpp"
BrionneIcon::    INCBIN "gfx/icons/alola/brionne.2bpp"
PrimarinaIcon::  INCBIN "gfx/icons/alola/primarina.2bpp"

; Weyard
MercuryIcon::    INCBIN "gfx/icons/weyard/mercury.2bpp"
VenusIcon::      INCBIN "gfx/icons/weyard/venus.2bpp"
MarsIcon::       INCBIN "gfx/icons/weyard/mars.2bpp"
JupiterIcon::    INCBIN "gfx/icons/weyard/jupiter.2bpp"

NullIcon::
EggIcon::        INCBIN "gfx/icons/egg.2bpp"

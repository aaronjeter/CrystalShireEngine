SECTION "Map Headers", ROMX

INCLUDE "data/maps/maps.asm"


INCLUDE "data/maps/blocks.asm" ; first: it defines the <Map>_BLOCKS_LZ flags attributes.asm checks


SECTION "Map Attributes", ROMX

INCLUDE "data/maps/attributes.asm"

INCLUDE "data/maps/scripts.asm"

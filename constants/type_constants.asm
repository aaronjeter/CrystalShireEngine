; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BIRD
	const BUG
	const GHOST
	const STEEL

DEF UNUSED_TYPES EQU const_value
	const_next 19
	const CURSE_TYPE
DEF UNUSED_TYPES_END EQU const_value

	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC_TYPE
	const ICE
	const DRAGON
	const DARK
	const FAIRY
DEF TYPES_END EQU const_value

DEF TYPE_MASK EQU %00111111
DEF PHYSICAL  EQU %01000000
DEF SPECIAL   EQU %10000000
DEF STATUS    EQU %11000000

DEF NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END - 1 ; discount BIRD

DEF POKEDEX_TYPE_STRING_LENGTH EQU 9

; Type and move category icons (engine/gfx/type_icons.asm):
; gfx/type_icons/type_icons.png, 4 tiles each, in this order
	const_def
	const TYPEICON_NORMAL
	const TYPEICON_FIGHTING
	const TYPEICON_FLYING
	const TYPEICON_POISON
	const TYPEICON_GROUND
	const TYPEICON_ROCK
	const TYPEICON_BUG
	const TYPEICON_GHOST
	const TYPEICON_STEEL
	const TYPEICON_FIRE
	const TYPEICON_WATER
	const TYPEICON_GRASS
	const TYPEICON_ELECTRIC
	const TYPEICON_PSYCHIC
	const TYPEICON_ICE
	const TYPEICON_DRAGON
	const TYPEICON_DARK
	const TYPEICON_FAIRY
	const TYPEICON_UNKNOWN ; "???" (BIRD, CURSE_TYPE and the unused types)
	const TYPEICON_PHYSICAL
	const TYPEICON_SPECIAL
	const TYPEICON_STATUS
DEF NUM_TYPE_ICONS EQU const_value

; The icons are sprites: icon slot n (0 to NUM_TYPE_ICON_SLOTS - 1) uses the
; 4 OAM entries starting at TYPE_ICON_FIRST_OAM + n * 4, and their tiles are
; in VRAM bank 1, vTiles3 tiles 0 to NUM_TYPE_ICONS * 4 - 1.
DEF TYPE_ICON_FIRST_OAM    EQU 8
DEF NUM_TYPE_ICON_SLOTS    EQU 8
DEF TYPE_ICON_WIDTH        EQU 4 ; tiles

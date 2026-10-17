; LoadMenuMonIcon.Jumptable indexes (see engine/gfx/mon_icons.asm)
	const_def
	const MONICON_PARTYMENU
	const MONICON_NAMINGSCREEN
	const MONICON_MOVES
	const MONICON_TRADE
	const MONICON_MOBILE1
	const MONICON_MOBILE2
	const MONICON_UNUSED

; party menu icon palettes
	const_def
	const PAL_ICON_RED    ; 0
	const PAL_ICON_BLUE   ; 1
	const PAL_ICON_GREEN  ; 2
	const PAL_ICON_BROWN  ; 3
	const PAL_ICON_PINK   ; 4
	const PAL_ICON_GRAY   ; 5
	const PAL_ICON_TEAL   ; 6
	const PAL_ICON_PURPLE ; 7

; OBJ palette for a lone menu icon in its species' own colors
; (SetMenuMonIconColor: naming screen, move list)
DEF MENU_ICON_OBPAL EQU PAL_ICON_BLUE ; 6-7 are the move list's type icons

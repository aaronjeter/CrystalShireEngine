; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_JOHTO                ; 01
	const TILESET_JOHTO_MODERN         ; 02
	const TILESET_KANTO                ; 03
	const TILESET_HOUSE                ; 04
	const TILESET_PLAYERS_HOUSE        ; 05
	const TILESET_GATE                 ; 06
	const TILESET_PORT                 ; 07
	const TILESET_LAB                  ; 08
	const TILESET_FACILITY             ; 09
	const TILESET_MART                 ; 0a
	const TILESET_MANSION              ; 0b
	const TILESET_GAME_CORNER          ; 0c
	const TILESET_ELITE_FOUR_ROOM      ; 0d
	const TILESET_TRADITIONAL_HOUSE    ; 0e
	const TILESET_TRAIN_STATION        ; 0f
	const TILESET_CHAMPIONS_ROOM       ; 10
	const TILESET_LIGHTHOUSE           ; 11
	const TILESET_PLAYERS_ROOM         ; 12
	const TILESET_POKECOM_CENTER       ; 13
	const TILESET_BATTLE_TOWER_INSIDE  ; 14
	const TILESET_TOWER                ; 15
	const TILESET_CAVE                 ; 16
	const TILESET_PARK                 ; 17
	const TILESET_RUINS_OF_ALPH        ; 18
	const TILESET_RADIO_TOWER          ; 19
	const TILESET_UNDERGROUND          ; 1a
	const TILESET_ICE_PATH             ; 1b
	const TILESET_DARK_CAVE            ; 1c
	const TILESET_FOREST               ; 1d
	const TILESET_MUSEUM               ; 1e
	const TILESET_HOENN				   ; 1f
	const TILESET_HOENN_OCEAN          ; 20
	const TILESET_SOOTOPOLIS           ; 21
	const TILESET_HOENN_JUNGLE         ; 22
	const TILESET_BATTLE_RESORT        ; 23
	const TILESET_SILVER               ; 24
	const TILESET_HOUSE_JOHTO
	const TILESET_HOUSE_KANTO
	const TILESET_HOUSE_HOENN
	const TILESET_CENTER
	const TILESET_MART_PC
	const TILESET_CENTER_KANTO
	const TILESET_CENTER_JOHTO
	const TILESET_MART_JOHTO
	const TILESET_MART_KANTO
DEF NUM_TILESETS EQU const_value - 1

; wTileset struct size
DEF TILESET_LENGTH EQU 18

; roof length (see gfx/tilesets/roofs)
DEF ROOF_LENGTH EQU 9

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7

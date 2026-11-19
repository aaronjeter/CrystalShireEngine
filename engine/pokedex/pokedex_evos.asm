; The Pokédex Evolution page: the selected mon's whole family, one member per
; two rows (its name, then how it evolves from the member above it), indented
; by stage, each with its menu icon. Unseen members show "?" with no icon. The
; viewed mon's name is orange; the highlight bar moves with Up/Down, and A opens
; the highlighted member's entry. The member count, highlight and scroll use the
; Moves page's wDexMoveCount, wDexMovesCursor and wDexMovesScroll.

DEF DEXEVO_ENTRY_LENGTH EQU 7
DEF DEXEVO_MAX          EQU 16
DEF DEXEVO_LINES        EQU 8 ; members shown, one icon and OBJ palette each
DEF DEXEVO_LAST_STAGE   EQU 2 ; members deeper than this aren't listed
DEF DEXEVO_ICON_TILE    EQU $60 ; VRAM bank 1 sprite tiles, after the type icons
DEF DEXEVO_VIEWED_PAL   EQU 3 ; BG palette of the viewed mon's name

Pokedex_DrawEvolutionPage:
	call Pokedex_DrawPageFrame
	call Pokedex_GetSelectedMon
	ld a, l
	ld [wDexEvoViewed], a
	ld a, h
	ld [wDexEvoViewed + 1], a
	call Pokedex_BuildEvoList
	; the highlight starts on the viewed mon
	call Pokedex_FindViewedMember
	ld a, c
	jr c, .got_cursor
	xor a
.got_cursor
	ld [wDexMovesCursor], a
	ld [wDexMovesScroll], a
	call Pokedex_MovesClampScroll
	jmp Pokedex_EvosDrawLines

Pokedex_EvosAfterLayout:
; The icons and the highlights, once the page's palettes are loaded.
	call Pokedex_SetHighlightPal
	call Pokedex_SetViewedPal
	jr Pokedex_EvosRedraw

Pokedex_EvosInput:
; Up/Down move the highlight; A opens the highlighted member's entry.
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, Pokedex_EvosOpenMember
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	ret z
	ld a, [wDexMovesCursor]
	inc a
	ld hl, wDexMoveCount
	cp [hl]
	ret nc
	jr .moved

.up
	ld a, [wDexMovesCursor]
	and a
	ret z
	dec a
.moved
	ld [wDexMovesCursor], a
	ld hl, wDexMovesScroll
	cp [hl]
	jr nc, .not_above
	ld [hl], a
	jr Pokedex_EvosRedraw
.not_above
	sub DEXEVO_LINES - 1
	jr c, Pokedex_EvosRedraw
	cp [hl]
	jr c, Pokedex_EvosRedraw
	ld [hl], a
	; fallthrough

Pokedex_EvosRedraw:
	call Pokedex_EvosDrawLines
	call Pokedex_EvosHighlight
	call Pokedex_EvosPlaceIcons
	call CopyTilemapAtOnce
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

Pokedex_EvosOpenMember:
; The highlighted member's Entry page, if it's seen and in the current list.
	ld a, [wDexMovesCursor]
	call Pokedex_GetEvoSpecies
	push de
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	call CheckSeenMon
	pop de
	jr z, .no
	; find it in the list, keeping the old position in case it isn't there
	ld hl, wDexListingScrollOffset
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wDexListingCursor]
	push af
	push bc
	ld a, e
	ld [wPrevDexEntry], a
	ld a, d
	ld [wPrevDexEntry + 1], a
	push de
	call Pokedex_InitCursorPosition
	call Pokedex_GetSelectedMon
	pop de
	ld a, l
	cp e
	jr nz, .not_found
	ld a, h
	cp d
	jr nz, .not_found
	pop bc
	pop af
	xor a ; DEXPAGE_ENTRY
	ld [wDexPage], a
	call Pokedex_BlackOutBG
	call Pokedex_LoadSelectedMonTiles
	call Pokedex_ShowPage
	ld a, [wCurPartySpecies]
	jmp PlayMonCry

.not_found
	pop bc
	pop af
	ld [wDexListingCursor], a
	ld hl, wDexListingScrollOffset
	ld a, c
	ld [hli], a
	ld [hl], b
.no
	ld de, SFX_WRONG
	jmp PlaySFX

Pokedex_EvosDrawLines:
	hlcoord 1, 1
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 1
	call ClearBox
	ld a, [wDexMovesScroll]
	ld c, a
	ld b, 0 ; line on screen
.loop
	ld a, [wDexMoveCount]
	cp c
	ret z
	ld a, b
	cp DEXEVO_LINES
	ret z
	push bc
	call Pokedex_DrawEvoLine
	pop bc
	inc b
	inc c
	jr .loop

Pokedex_DrawEvoLine:
; Member c on screen line b.
	push bc
	ld a, c
	call Pokedex_GetEvoMember ; de = species index, b = stage
	ld a, b
	ld [wDexEvoStage], a
	pop bc
	; hl = the name's place: row 1 + 2 * line, column 3 + 2 * stage
	push de
	ld a, b
	add a
	inc a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	ld a, [wDexEvoStage]
	add a
	add 3
	ld e, a
	ld d, 0
	add hl, de
	pop de
	push hl
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call CheckSeenMon
	pop hl
	jr nz, .seen
	ld [hl], "?"
	ret

.seen
	push hl
	call GetPokemonName
	pop hl
	push hl
	rst PlaceString
	pop hl
	; the caught mark in column 18
	push hl
	ld a, [wNamedObjectIndex]
	call CheckCaughtMon
	pop hl
	jr z, .method
	push hl
	ld a, [wDexEvoStage]
	add a
	cpl
	inc a
	add 18 - 3
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], $4f
	pop hl
.method
	ld a, [wDexEvoTempMethod]
	and a
	ret z ; the first stage
	ld de, SCREEN_WIDTH
	add hl, de
	push hl
	call Pokedex_EvoMethodString
	pop hl
	; at most up to column 19: 17 - 2 * stage tiles
	ld a, [wDexEvoStage]
	add a
	cpl
	inc a
	add 17
	ld c, a
	ld de, wStringBuffer2
.copy
	ld a, [de]
	cp "@"
	ret z
	ld [hli], a
	inc de
	dec c
	jr nz, .copy
	ret

Pokedex_EvoMethodString:
; wStringBuffer2 = how the member in wDexEvoTemp evolves.
	ld a, [wDexEvoTempMethod]
	cp EVOLVE_LEVEL
	jr z, .level
	cp EVOLVE_ITEM
	jr z, .item
	cp EVOLVE_TRADE
	jr z, .trade
	cp EVOLVE_HAPPINESS
	jr z, .happiness
	; EVOLVE_STAT
	call .Level
	ld a, " "
	ld [hli], a
	ld a, [wDexEvoTempParam2]
	dec a ; ATK_GT_DEF
	ld de, .AtkGtDef
	jr z, .Append
	dec a ; ATK_LT_DEF
	ld de, .AtkLtDef
	jr z, .Append
	ld de, .AtkEqDef
	jr .Append

.level
	call .Level
	ld [hl], "@"
	ret

.item
	ld hl, wStringBuffer2
	jr .item_name

.trade
	ld hl, wStringBuffer2
	ld de, .Trade
	call .Append
	ld a, [wDexEvoTempParam2]
	ld c, a
	ld a, [wDexEvoTempParam2 + 1]
	and c
	inc a
	ret z ; -1: no item
	ld [hl], "/"
	inc hl
.item_name
	push hl
	ld a, [wDexEvoTempParam2]
	ld l, a
	ld a, [wDexEvoTempParam2 + 1]
	ld h, a
	call GetItemIDFromIndex
	ld [wNamedObjectIndex], a
	call GetItemName
	pop hl
	ld de, wStringBuffer1
	jr .Append

.happiness
	ld a, [wDexEvoTempParam]
	ld de, .Happiness
	cp TR_MORNDAY
	jr c, .got_happiness
	ld de, .HappyDay
	jr z, .got_happiness
	ld de, .HappyNight
.got_happiness
	ld hl, wStringBuffer2
	; fallthrough

.Append:
; Copy the string at de to hl, with its "@". hl ends on the "@".
	ld a, [de]
	ld [hl], a
	cp "@"
	ret z
	inc de
	inc hl
	jr .Append

.Level:
; "Lv." and the level at wStringBuffer2; hl = after it
	ld hl, wStringBuffer2
	ld a, "L"
	ld [hli], a
	ld a, "v"
	ld [hli], a
	ld a, "."
	ld [hli], a
	ld de, wDexEvoTempParam
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	jmp PrintNum

.Trade:      db "Trade@"
.Happiness:  db "Happiness@"
.HappyDay:   db "Happy/Day@"
.HappyNight: db "Happy/Night@"
.AtkGtDef:   db "Hi Atk@"
.AtkLtDef:   db "Hi Def@"
.AtkEqDef:   db "Even@"

Pokedex_EvosHighlight:
; The highlighted member's two rows in the highlight palette, the viewed
; mon's name row in DEXEVO_VIEWED_PAL.
	hlcoord 1, 1, wAttrmap
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 1
	xor a
	call FillBoxWithByte
	call Pokedex_FindViewedMember
	jr nc, .cursor
	ld a, c
	call .LineRow
	jr nc, .cursor
	ld a, DEXEVO_VIEWED_PAL
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
.cursor
	ld a, [wDexMovesCursor]
	call .LineRow
	ret nc
	ld a, DEXMOVES_HIGHLIGHT_PAL
	push hl
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
	ret

.LineRow:
; hl = wAttrmap at column 1 of member a's name row, with carry if it's shown
	ld hl, wDexMovesScroll
	sub [hl]
	ccf
	ret nc
	cp DEXEVO_LINES
	ret nc
	add a
	inc a
	hlcoord 1, 0, wAttrmap
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	scf
	ret

Pokedex_EvosPlaceIcons:
; Each seen member shown: its menu icon as 2x2 sprites, OAM entries and tiles
; 4 * line on, in OBJ palette (line) with its own colors. The graphics and
; colors are all loaded before any sprite shows.
	call ClearSprites
	ld hl, .Load
	call .ForEachLine
	farcall UpdateOBPals
	ld hl, .Place
	; fallthrough

.ForEachLine:
; Call hl for each member shown (c = member, b = line, [wDexEvoStage] = its
; stage, [wCurIcon] = its species), if it's seen.
	ld a, [wDexMovesScroll]
	ld c, a
	ld b, 0 ; line on screen
.loop
	ld a, [wDexMoveCount]
	cp c
	ret z
	ld a, b
	cp DEXEVO_LINES
	ret z
	push hl
	push bc
	push hl
	ld a, c
	call Pokedex_GetEvoMember
	ld a, b
	ld [wDexEvoStage], a
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wCurIcon], a
	call CheckSeenMon
	pop hl
	pop bc
	push bc
	call nz, _hl_
	pop bc
	pop hl
	inc b
	inc c
	jr .loop

.Load:
	; the graphics
	push bc
	ld a, 1
	ldh [rVBK], a
	ld a, b
	add a
	add a
	add DEXEVO_ICON_TILE
	farcall GetStorageIcon_a
	xor a
	ldh [rVBK], a
	; the colors
	ld a, [wCurIcon]
	ld c, a
	ld b, 0
	farcall GetMonPalInBCDE
	pop hl
	ld a, h ; line
	farjp LoadMonIconOBPal

.Place:
	; x = column 1 + 2 * stage, y = row 1 + 2 * line
	ld a, b
	swap a ; * 2 rows * 8
	add 1 * TILE_WIDTH + 16 ; OAM y is screen y + 16
	ld d, a
	ld a, [wDexEvoStage]
	add a
	inc a
	add a
	add a
	add a ; * 8
	add 8 - POKEDEX_SCX ; OAM x is screen x + 8
	ld e, a
	ld a, b
	swap a ; * 4 entries * 4 bytes
	ld l, a
	ld h, HIGH(wShadowOAM)
	ld a, b
	add a
	add a
	add DEXEVO_ICON_TILE
	ld c, a ; first tile
	ld a, b
	or VRAM_BANK_1
	ld b, a ; attributes
	; top left, top right, bottom left, bottom right
	call .Sprite
	ld a, e
	add TILE_WIDTH
	ld e, a
	call .Sprite
	ld a, d
	add TILE_WIDTH
	ld d, a
	ld a, e
	sub TILE_WIDTH
	ld e, a
	call .Sprite
	ld a, e
	add TILE_WIDTH
	ld e, a
	; fallthrough

.Sprite:
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, c
	ld [hli], a
	inc c
	ld a, b
	ld [hli], a
	ret

Pokedex_SetViewedPal:
; BG palette DEXEVO_VIEWED_PAL: orange text on black.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, .Pal
	ld de, wBGPals1 palette DEXEVO_VIEWED_PAL
	ld bc, 1 palettes
	rst CopyBytes
	ld hl, .Pal
	ld de, wBGPals2 palette DEXEVO_VIEWED_PAL
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	ret

.Pal:
	RGB 31, 20, 10
	RGB 31, 20, 10
	RGB 26, 10, 06
	RGB 00, 00, 00

Pokedex_BuildEvoList:
; The family of species index [wDexEvoViewed]: its first stage, then each
; member followed by its evolutions.
	xor a
	ld [wDexMoveCount], a
	ld a, [wDexEvoViewed]
	ld e, a
	ld a, [wDexEvoViewed + 1]
	ld d, a
	ld b, DEXEVO_LAST_STAGE + 1
.root_loop
	push bc
	call Pokedex_FindPreEvo
	pop bc
	jr nc, .got_root
	dec b
	jr nz, .root_loop
.got_root
	xor a
	ld [wDexEvoDepth], a
	ld [wDexEvoTempMethod], a
	call Pokedex_AddEvoMember
	; fallthrough

Pokedex_AddEvoChildren:
; Add the evolutions of species index de (at stage [wDexEvoDepth]) and theirs.
; A form it changes into and back from is listed at its own stage.
	ld a, [wDexEvoDepth]
	cp DEXEVO_LAST_STAGE
	ret nc
	push de ; the parent
	ld b, d
	ld c, e
	call Pokedex_GetEvosPointer
	jr z, .done
.loop
	ld a, [wDexMoveCount]
	cp DEXEVO_MAX
	jr z, .done
	call Pokedex_ReadEvo
	jr z, .done
	push hl
	ld a, [wDexEvoBank]
	push af
	ld a, [wDexEvoDepth]
	push af
	ld a, [wDexEvoTempSpecies]
	ld e, a
	ld a, [wDexEvoTempSpecies + 1]
	ld d, a
	call Pokedex_FindEvoMember
	jr c, .next ; already listed (another way to evolve into it)
	ld hl, wDexEvoDepth
	inc [hl]
	call Pokedex_AddEvoMember
	; does it change back into the parent?
	ld hl, sp + 6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	ld b, d
	ld c, e
	ld d, h
	ld e, l
	call Pokedex_EvolvesInto
	pop de
	jr nc, .children
	ld hl, wDexEvoDepth
	dec [hl]
	call Pokedex_SetLastMemberStage
.children
	call Pokedex_AddEvoChildren
.next
	pop af
	ld [wDexEvoDepth], a
	pop af
	ld [wDexEvoBank], a
	pop hl
	jr .loop

.done
	pop de
	ret

Pokedex_SetLastMemberStage:
; The last member's stage = [wDexEvoDepth]. Preserves de.
	push de
	ld a, [wDexMoveCount]
	dec a
	ld hl, wDexEvoList + 2
	ld bc, DEXEVO_ENTRY_LENGTH
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexEvoList)
	ldh [rSVBK], a
	ld a, [wDexEvoDepth]
	ld [hl], a
	pop af
	ldh [rSVBK], a
	pop de
	ret

Pokedex_EvolvesInto:
; carry if species index bc evolves into species index de.
	call Pokedex_GetEvosPointer
	ret z
.loop
	call Pokedex_ReadEvo
	ret z
	ld a, [wDexEvoTempSpecies]
	cp e
	jr nz, .loop
	ld a, [wDexEvoTempSpecies + 1]
	cp d
	jr nz, .loop
	scf
	ret

Pokedex_FindPreEvo:
; If a species evolves into species index de (and isn't a form de changes
; into and back from): de = that species, with carry.
	ld bc, 1
.loop
	call Pokedex_GetEvosPointer
	jr z, .next
.evo_loop
	call Pokedex_ReadEvo
	jr z, .next
	ld a, [wDexEvoTempSpecies]
	cp e
	jr nz, .evo_loop
	ld a, [wDexEvoTempSpecies + 1]
	cp d
	jr nz, .evo_loop
	; does de evolve into it too?
	push bc
	push de
	ld h, b
	ld l, c
	ld b, d
	ld c, e
	ld d, h
	ld e, l
	call Pokedex_EvolvesInto
	pop de
	pop bc
	jr c, .next
	ld d, b
	ld e, c
	scf
	ret

.next
	inc bc
	ld a, b
	cp HIGH(NUM_POKEMON + 1)
	jr nz, .loop
	ld a, c
	cp LOW(NUM_POKEMON + 1)
	jr nz, .loop
	and a
	ret

Pokedex_GetEvosPointer:
; hl = the evolutions of species index bc, with their bank in wDexEvoBank;
; z if it has none. Preserves bc and de.
	push bc
	push de
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ld [wDexEvoBank], a
	pop de
	pop bc
	ld a, h
	or l
	ret

Pokedex_ReadEvo:
; Read the evolution at hl (bank [wDexEvoBank]) into wDexEvoTemp and move hl
; past it, with z at the end of the evolutions. Preserves bc and de.
	call .Byte
	and a
	ret z
	ld [wDexEvoTempMethod], a
	cp EVOLVE_LEVEL
	jr z, .param
	cp EVOLVE_HAPPINESS
	jr z, .param
	cp EVOLVE_STAT
	jr z, .stat
	; item or trade: the item
	call .Byte
	ld [wDexEvoTempParam2], a
	call .Byte
	ld [wDexEvoTempParam2 + 1], a
	jr .species

.stat
	call .Byte
	ld [wDexEvoTempParam], a
	call .Byte
	ld [wDexEvoTempParam2], a
	jr .species

.param
	call .Byte
	ld [wDexEvoTempParam], a
.species
	call .Byte
	ld [wDexEvoTempSpecies], a
	call .Byte
	ld [wDexEvoTempSpecies + 1], a
	or 1 ; nz
	ret

.Byte:
	ld a, [wDexEvoBank]
	call GetFarByte
	inc hl
	ret

Pokedex_AddEvoMember:
; Add species index de at stage [wDexEvoDepth], evolving by wDexEvoTemp's
; method. Preserves de.
	ld a, [wDexMoveCount]
	cp DEXEVO_MAX
	ret z
	push de
	ld hl, wDexEvoList
	ld bc, DEXEVO_ENTRY_LENGTH
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexEvoList)
	ldh [rSVBK], a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld a, [wDexEvoDepth]
	ld [hli], a
	ld a, [wDexEvoTempMethod]
	ld [hli], a
	ld a, [wDexEvoTempParam]
	ld [hli], a
	ld a, [wDexEvoTempParam2]
	ld [hli], a
	ld a, [wDexEvoTempParam2 + 1]
	ld [hl], a
	pop af
	ldh [rSVBK], a
	ld hl, wDexMoveCount
	inc [hl]
	pop de
	ret

Pokedex_GetEvoSpecies:
; de = the species index of member a. Preserves bc.
	push bc
	ld hl, wDexEvoList
	ld bc, DEXEVO_ENTRY_LENGTH
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexEvoList)
	ldh [rSVBK], a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop af
	ldh [rSVBK], a
	pop bc
	ret

Pokedex_GetEvoMember:
; Member a: de = species index, b = stage, wDexEvoTemp = how it evolves.
; Preserves c.
	push bc
	ld hl, wDexEvoList
	ld bc, DEXEVO_ENTRY_LENGTH
	rst AddNTimes
	pop bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDexEvoList)
	ldh [rSVBK], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld [wDexEvoTempMethod], a
	ld a, [hli]
	ld [wDexEvoTempParam], a
	ld a, [hli]
	ld [wDexEvoTempParam2], a
	ld a, [hl]
	ld [wDexEvoTempParam2 + 1], a
	pop af
	ldh [rSVBK], a
	ret

Pokedex_FindViewedMember:
	ld a, [wDexEvoViewed]
	ld e, a
	ld a, [wDexEvoViewed + 1]
	ld d, a
	; fallthrough

Pokedex_FindEvoMember:
; c = the member with species index de, with carry; no carry if it isn't
; listed. Preserves de.
	ld c, 0
.loop
	ld a, [wDexMoveCount]
	cp c
	ret z ; no carry
	push de
	ld a, c
	call Pokedex_GetEvoSpecies
	ld a, e
	pop de
	push hl
	ld h, a
	ld a, e
	cp h
	pop hl
	jr nz, .next
	push de
	ld a, c
	call Pokedex_GetEvoSpecies
	ld a, d
	pop de
	cp d
	jr nz, .next
	scf
	ret
.next
	inc c
	jr .loop

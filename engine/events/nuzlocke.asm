; Nuzlocke mode (wOptions2 bit NUZLOCKE_ON): one catch per area. An area is a
; landmark; its "used" bit is in wNuzlockeAreaFlags (landmarks 0-95) or in the
; event flags from EVENT_NUZLOCKE_AREA_96 (landmarks 96 and up).

assert NUM_LANDMARKS <= NUM_NUZLOCKE_AREA_BYTES * 8 + 63, \
	"more landmarks than Nuzlocke area flags"

NuzlockeWildEncounter::
; At the start of a wild battle: wNuzlockeEncounter = NUZLOCKE_CATCHABLE, why
; the wild Pokémon can't be caught, or NUZLOCKE_NO_RULE. A catchable first
; encounter uses up the area. A forced battle's script sets NUZLOCKE_FORCED
; first: catchable without using the area.
	ld hl, wNuzlockeEncounter
	ld a, [hl]
	ld [hl], NUZLOCKE_NO_RULE
	sub NUZLOCKE_FORCED
	ld e, a ; 0 for a forced battle
	ld a, [wOptions2]
	bit NUZLOCKE_ON, a
	ret z
	ld a, [wBattleType]
	cp BATTLETYPE_CONTEST
	jr z, .contest
	cp BATTLETYPE_TUTORIAL
	ret z
	ld a, [wNumBalls]
	and a
	ret z ; encounters count once the player has a ball
	ld a, NUZLOCKE_CATCHABLE
	ld [wNuzlockeEncounter], a
	ld a, e
	and a
	ret z ; forced battles are always catchable
	ld a, [wEnemyMonDVs + 1]
	cp SHINY_SPDSPC_DV
	ret z ; shinies are always catchable
	ld a, [wTempEnemyMonSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, NuzlockeLegendaries
	ld de, 2
	call IsInWordArray
	ret c ; legendaries are always catchable
	call GetNuzlockeArea
	push af
	ld b, CHECK_FLAG
	call NuzlockeAreaFlagAction
	pop de ; d = area
	ld a, c
	and a
	ld a, NUZLOCKE_AREA_USED
	jr nz, .got_result
	push de
	call NuzlockeFamilyCaught
	pop de
	ld a, NUZLOCKE_FAMILY_CAUGHT
	jr c, .got_result ; a dupe leaves the area's catch for later
	ld a, d
	ld b, SET_FLAG
	jr NuzlockeAreaFlagAction ; wNuzlockeEncounter stays NUZLOCKE_CATCHABLE

.got_result
	ld [wNuzlockeEncounter], a
	ret

.contest
; only the first Bug-Catching Contest's catches are allowed
	ld de, EVENT_NUZLOCKE_CONTEST_USED
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, NUZLOCKE_AREA_USED
	ld [wNuzlockeEncounter], a
	ret

GetNuzlockeArea::
; a = the current map's landmark (the outside map's for LANDMARK_SPECIAL maps).
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp LANDMARK_SPECIAL
	ret nz
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	jmp GetWorldMapLocation

NuzlockeAreaFlagAction::
; Area a's "used" flag: b = RESET_FLAG, SET_FLAG or CHECK_FLAG (c = result).
	cp NUM_NUZLOCKE_AREA_BYTES * 8
	jr nc, .event_flag
	ld e, a
	ld d, 0
	ld hl, wNuzlockeAreaFlags
	jmp FlagAction

.event_flag
	sub NUM_NUZLOCKE_AREA_BYTES * 8
	ld l, a
	ld h, 0
	ld de, EVENT_NUZLOCKE_AREA_96
	add hl, de
	ld d, h
	ld e, l
	jmp EventFlagAction

NuzlockeFamilyCaught:
; Carry if a Pokémon with the same first evolution stage as wTempEnemyMonSpecies
; is registered as caught in the Pokédex.
	ld a, [wTempEnemyMonSpecies]
	call GetPokemonIndexFromID
	call .GetFirstStage
	ld d, h
	ld e, l
	ld bc, 1
.loop
	push bc
	push de
	ld h, b
	ld l, c
	call .GetFirstStage
	pop de
	ld a, h
	cp d
	jr nz, .next
	ld a, l
	cp e
	jr nz, .next
	pop bc
	push bc
	push de
	ld d, b
	ld e, c
	call CheckCaughtMonIndex
	ld a, c
	pop de
	pop bc
	and a
	jr nz, .caught
	jr .next_species

.next
	pop bc
.next_species
	inc bc
	ld a, c
	cp LOW(NUM_POKEMON + 1)
	jr nz, .loop
	ld a, b
	cp HIGH(NUM_POKEMON + 1)
	jr nz, .loop
	and a
	ret

.caught
	scf
	ret

.GetFirstStage:
; hl = species index -> hl = its first stage's index
	add hl, hl
	ld bc, FirstEvoStages - 2
	add hl, bc
	ld a, BANK(FirstEvoStages)
	jmp GetFarWord

NuzlockeHUDIcon::
; Wild battle HUD: a Poké Ball right of the gender sign when this Pokémon can be
; caught under the Nuzlocke rules.
	ld a, [wNuzlockeEncounter]
	cp NUZLOCKE_CATCHABLE
	ret nz
	hlcoord 10, 1
	ld [hl], $5d ; the HUD's Poké Ball tile
	ret

NuzlockeEndOfBattle::
; After a battle: a loss (or no Pokémon left standing) ends the Nuzlocke run;
; otherwise every fainted party Pokémon goes to the graveyard boxes.
; Battles the player may lose don't count: a loss there heals the party (a win
; already does).
	ld a, [wOptions2]
	bit NUZLOCKE_ON, a
	ret z
	ld a, [wBattleType]
	cp BATTLETYPE_CANLOSE
	jr z, .can_lose
	cp BATTLETYPE_CUP
	ret z
	cp BATTLETYPE_CONTEST
	ret z
	ld a, [wInBattleTowerBattle]
	bit IN_BATTLE_TOWER_BATTLE_F, a
	ret nz
	ld a, [wBattleResult]
	and $f
	cp LOSE
	jr z, .run_over
	call .CountStanding
	jr z, .run_over

	ld c, 0
.loop
	ld a, [wPartyCount]
	cp c
	ret z
	call .IsFainted
	jr z, .bury
	inc c
	jr .loop

.bury
	push bc
	ld a, c
	ld [wCurPartyMon], a
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	rst AddNTimes
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	ld a, [wCurPartyMon]
	call .RemoveEvolvableFlag
	call .SendMailToPC
	ld a, [wCurPartyMon]
	inc a
	ld c, a
	farcall NuzlockeBuryPartyMon
	ld hl, NuzlockeLaidToRestText
	jr z, .got_text
	ld hl, NuzlockeReleasedText
.got_text
	call BattleTextbox
	pop bc
	jr .loop ; the next Pokémon is now in slot c

.can_lose
	ld a, [wBattleResult]
	and $f
	cp LOSE
	ret nz
	predef_jump HealParty

.run_over
	ld hl, wOptions2
	res NUZLOCKE_ON, [hl]
	ld hl, NuzlockeRunOverText
	jmp BattleTextbox

.SendMailToPC:
; Boxes can't hold Mail: held Mail goes to the PC's mailbox. With the mailbox
; full, the Mail is thrown away.
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	call ItemIsMail_a
	ret nc
	farcall SendMailToPC
	ret nc
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld [hl], 0
	ret

.CountStanding:
; z if no party Pokémon other than Eggs has HP left.
	ld c, 0
.count_loop
	ld a, [wPartyCount]
	cp c
	ret z
	ld hl, wPartySpecies
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp EGG
	jr z, .count_next
	call .GetHP
	jr z, .count_next
	or 1
	ret
.count_next
	inc c
	jr .count_loop

.IsFainted:
; z if party mon c is not an Egg and has no HP.
	ld hl, wPartySpecies
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp EGG
	jr z, .not_fainted
	jr .GetHP
.not_fainted
	or 1
	ret

.GetHP:
; z if party mon c has 0 HP.
	push bc
	ld hl, wPartyMon1HP
	ld a, c
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	ld a, [hli]
	or [hl]
	ret

.RemoveEvolvableFlag:
; Party slot a is removed: later slots' wEvolvableFlags bits move down by one.
	ld c, a
	inc c
	ld e, 1
	jr .start_shift
.shift
	sla e
.start_shift
	dec c
	jr nz, .shift
	ld a, [wEvolvableFlags]
	ld d, a
	ld a, e
	dec a
	and d
	ld b, a ; the bits below slot a
	ld a, e
	add a
	dec a
	cpl
	and d
	srl a ; the bits above slot a, moved down
	or b
	ld [wEvolvableFlags], a
	ret

NuzlockeLaidToRestText:
	text_far _NuzlockeLaidToRestText
	text_end

NuzlockeReleasedText:
	text_far _NuzlockeReleasedText
	text_end

NuzlockeRunOverText:
	text_far _NuzlockeRunOverText
	text_end

NuzlockeLegendaries:
	dw ARTICUNO
	dw ZAPDOS
	dw MOLTRES
	dw MEWTWO
	dw MEW
	dw RAIKOU
	dw ENTEI
	dw SUICUNE
	dw LUGIA
	dw HO_OH
	dw CELEBI
	dw REGIROCK
	dw REGICE
	dw REGISTEEL
	dw LATIAS
	dw LATIOS
	dw KYOGRE
	dw GROUDON
	dw RAYQUAZA
	dw JIRACHI
	dw -1

SetNuzlockeMode::
; New game: Nuzlocke mode off or on.
	ld hl, wOptions2
	res NUZLOCKE_ON, [hl]
	ld hl, .AskText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
.menu
	call VerticalMenu
	jr nc, .chosen
	; B doesn't pick anything; only A confirms
	ld a, [wMenuCursorY]
	ld [wMenuCursorPosition], a
	jr .menu

.chosen
	call CloseWindow
	ld a, [wMenuCursorY]
	cp 2
	ret nz
	ld hl, wOptions2
	set NUZLOCKE_ON, [hl]
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "Nuzlocke Off@"
	db "Nuzlocke On@"

.AskText:
	text "Do you want to"
	line "play a Nuzlocke?"

	para "Only the first"
	line "#mon you meet"

	para "in each area can"
	line "be caught."
	prompt

_NuzlockeAreaUsedText::
	text "This area's catch"
	line "is already used!"
	prompt

_NuzlockeFamilyCaughtText::
	text "Its family is"
	line "already caught!"
	prompt

_NuzlockeTurnOffText::
	text "Turn off Nuzlocke"
	line "mode for good?"
	done

_NuzlockeLaidToRestText::
	text_ram wStringBuffer1
	text " was"
	line "laid to rest."
	prompt

_NuzlockeReleasedText::
	text_ram wStringBuffer1
	text " was"
	line "released. The"
	cont "graveyard is full."
	prompt

_NuzlockeRunOverText::
	text "The Nuzlocke run"
	line "is over!"
	para "Nuzlocke mode was"
	line "turned off."
	prompt

; Journal: a list of the player's missions, opened from the Start menu.
; Progress is read from the game's state (constants/journal_constants.asm);
; only the announced progress and the NEW marks are saved (wJournalSeen,
; wJournalUnread).

; mission record offsets (data/events/journal_missions.asm)
	rsreset
DEF MISSION_REGION  rb
DEF MISSION_TITLE   rw
DEF MISSION_DESC    rw
DEF MISSION_SUMMARY rw
DEF MISSION_START   rb 3
DEF MISSION_NSTEPS  rb
DEF MISSION_STEPS   rb
	rsreset
DEF MSTEP_CHECK rb 3
DEF MSTEP_TEXT  rw
DEF MSTEP_NEXT  rw
DEF MSTEP_LENGTH EQU _RS

; tiles in vTiles2 (gfx/journal/journal.png)
DEF JT_CHECK EQU $00
DEF JT_NEW   EQU $01 ; 2 tiles
DEF NUM_JOURNAL_TILES EQU 3

; BG palettes (JournalPalettes)
	const_def
	const JOURNALPAL_TEXT   ; 0 frame and text
	const JOURNALPAL_GRAY   ; 1 the other tab, unknown steps
	const JOURNALPAL_ACCENT ; 2 NEW
	const JOURNALPAL_DONE   ; 3 done steps
DEF NUM_JOURNAL_PALS EQU const_value

Journal_GetMission:
; a = MISSION_* -> hl = its record
	ld e, a
	ld d, 0
	ld hl, JournalMissions
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Journal_RunCheck:
; hl = a check (db MC_*; dw argument) -> carry if it passes; hl after it
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, c
	ld hl, .Checks
	call JumpTable
	pop hl
	ret

.Checks:
; entries correspond to MC_* constants
	table_width 2
	dw .None
	dw .Event
	dw .NotEvent
	dw .Engine
	dw .JohtoBadges
	dw .KantoBadges
	dw .HoennBadges
	dw .Badges
	dw .Item
	dw .HallOfFame
	dw .Rematch
	dw .Tower
	dw .Defenses
	dw .Caught
	dw .Call
	assert_table_length NUM_MISSION_CHECKS

.None:
	scf
	ret

.Event:
	ld b, CHECK_FLAG
	call EventFlagAction
.c_nonzero
	ld a, c
	and a
	ret z
	scf
	ret

.NotEvent:
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret nz
	scf
	ret

.Engine:
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	jr .c_nonzero

.JohtoBadges:
	ld hl, wJohtoBadges
	ld b, NUM_JOHTO_BADGES / 8
	jr .count_badges

.KantoBadges:
	ld hl, wKantoBadges
	ld b, NUM_KANTO_BADGES / 8
	jr .count_badges

.HoennBadges:
	ld hl, wHoennBadges
	ld b, NUM_HOENN_BADGES / 8
	jr .count_badges

.Badges:
	ld hl, wBadges
	ld b, (NUM_JOHTO_BADGES + NUM_KANTO_BADGES + NUM_HOENN_BADGES) / 8
.count_badges
	push de
	call CountSetBits
	pop de
.at_least_e
; carry if a >= e
	cp e
	ccf
	ret

.Item:
	ld h, d
	ld l, e
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld hl, wNumItems
	jmp CheckItem

.HallOfFame:
	ld hl, wHallOfFameCounts
	jr .league_nonzero

.Rematch:
	ld hl, wLeagueRematchWins
.league_nonzero
	ld d, 0
	add hl, de
	ld a, BANK(wSaveExtension)
	call GetFarWRAMByte
	and a
	ret z
	scf
	ret

.Tower:
	ld hl, wTowerBestStreak
	jr .word_at_least_de

.Caught:
	call CheckCaughtMonIndex
	jr .c_nonzero_far

.Call:
	ld h, d
	ld l, e
	jp hl

.c_nonzero_far
	ld a, c
	and a
	ret z
	scf
	ret

.Defenses:
	ld hl, wTitleDefenses
.word_at_least_de
; carry if the big-endian word at hl (save extension) >= de
	ld a, BANK(wSaveExtension)
	call GetFarWRAMByte
	cp d
	jr nz, .high_differs
	inc hl
	ld a, BANK(wSaveExtension)
	call GetFarWRAMByte
	cp e
.high_differs
	ccf
	ret

Journal_CountFlags:
; hl = event flags (dw, ending with -1) -> a = how many are set
	ld c, 0
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .done
	push bc
	push hl
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop hl
	pop bc
	and a
	jr z, .loop
	inc c
	jr .loop

.done
	ld a, c
	ret

Journal_EvalMission:
; a = MISSION_* -> a = MISSION_STARTED_F | MISSION_DONE_F | steps done
	call Journal_GetMission
	ld bc, MISSION_START
	add hl, bc
	call Journal_RunCheck
	ld a, 0
	jr nc, .not_started
	ld a, 1 << MISSION_STARTED_F
.not_started
	ld [wJournalEvalResult], a
	ld a, [hli] ; steps
	ld [wJournalEvalSteps], a
	ld b, a
	ld c, 0 ; steps done
.loop
	push bc
	call Journal_RunCheck
	pop bc
	jr nc, .not_done
	inc c
.not_done
	ld de, MSTEP_LENGTH - MSTEP_TEXT
	add hl, de
	dec b
	jr nz, .loop
	ld a, [wJournalEvalResult]
	or c
	ld b, a
	ld a, [wJournalEvalSteps]
	cp c
	jr nz, .not_all
	set MISSION_DONE_F, b
.not_all
	ld a, b
	ret

Journal_EvalAll:
; fill wJournalState
	ld hl, wJournalState
	xor a
.loop
	push hl
	push af
	call Journal_EvalMission
	ld b, a
	pop af
	pop hl
	ld [hl], b
	inc hl
	inc a
	cp NUM_MISSIONS
	jr nz, .loop
	ret

Journal_AnyStarted::
; nz if any mission has started (the Start menu shows the Journal then)
	xor a
.loop
	push af
	call Journal_EvalMission
	ld b, a
	pop af
	bit MISSION_STARTED_F, b
	ret nz
	inc a
	cp NUM_MISSIONS
	jr nz, .loop
	xor a
	ret

Journal_CheckUpdates::
; Announce new progress: for each mission whose progress (0: not started,
; else 1 + steps done) is above the announced one, save it and mark the
; mission NEW. Returns carry if any mission moved on.
	call Journal_EvalAll
	xor a
	ld [wJournalEvalResult], a ; any update
	ld c, 0
.loop
	ld hl, wJournalState
	ld b, 0
	add hl, bc
	ld a, [hl]
	bit MISSION_STARTED_F, a
	ld b, 0
	jr z, .got_progress
	and MISSION_STEPS_MASK
	inc a
	ld b, a
.got_progress
; the announced progress
	push bc
	call Journal_GetSeen
	pop bc
	cp b
	jr nc, .next ; no new progress (or less: a flag was cleared)
	ld a, b
	push bc
	call Journal_SetSeen
	pop bc
	push bc
	ld b, SET_FLAG
	call Journal_UnreadAction
	pop bc
	ld a, TRUE
	ld [wJournalEvalResult], a
.next
	inc c
	ld a, c
	cp NUM_MISSIONS
	jr nz, .loop
	ld a, [wJournalEvalResult]
	and a
	ret z
	scf
	ret

Journal_OverworldCheck::
; With the player free again after a script, a battle or a map change: check
; the journal for news, and show the banner once no map name sign is up.
	ld hl, wMapNameSignFlags
	bit JOURNAL_BANNER_WAITING, [hl]
	jr nz, .waiting
	bit JOURNAL_CHECK_PENDING, [hl]
	ret z
	res JOURNAL_CHECK_PENDING, [hl]
	call Journal_CheckUpdates
	ret nc
	ld hl, wMapNameSignFlags
	set JOURNAL_BANNER_WAITING, [hl]
.waiting
	ld a, [wLandmarkSignTimer]
	and a
	ret nz
	res JOURNAL_BANNER_WAITING, [hl]
	set JOURNAL_BANNER, [hl]
	ld a, MAPSIGNSTAGE_2_LOADGFX
	ld [wLandmarkSignTimer], a
	ld de, SFX_REGISTER_PHONE_NUMBER
	jmp PlaySFX

Journal_GetSeen:
; c = MISSION_* -> a = its announced progress
	call Journal_SeenAddress
	ld a, BANK(wJournalSeen)
	call GetFarWRAMByte
	bit 0, c
	jr z, .low
	swap a
.low
	and $f
	ret

Journal_SetSeen:
; c = MISSION_*, a = progress
	and $f
	ld b, a
	call Journal_SeenAddress
	ldh a, [rSVBK]
	push af
	ld a, BANK(wJournalSeen)
	ldh [rSVBK], a
	ld a, [hl]
	bit 0, c
	jr nz, .high
	and $f0
	or b
	jr .write
.high
	and $f
	swap b
	or b
.write
	ld [hl], a
	pop af
	ldh [rSVBK], a
	ret

Journal_SeenAddress:
; c = MISSION_* -> hl = its nibble's byte
	ld a, c
	srl a
	ld e, a
	ld d, 0
	ld hl, wJournalSeen
	add hl, de
	ret

Journal_UnreadAction:
; c = MISSION_*, b = RESET_FLAG, SET_FLAG or CHECK_FLAG (result in c)
	ldh a, [rSVBK]
	push af
	ld a, BANK(wJournalUnread)
	ldh [rSVBK], a
	ld e, c
	ld d, 0
	ld hl, wJournalUnread
	call FlagAction
	pop af
	ldh [rSVBK], a
	ret

; The journal screen ----------------------------------------------------------

Journal::
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	ld hl, JournalGFX
	ld de, vTiles2
	ld bc, NUM_JOURNAL_TILES tiles
	ld a, BANK(JournalGFX)
	call FarCopyBytes
	call EnableLCD
	call Journal_LoadPalettes

	call Journal_CheckUpdates ; also marks news not announced yet
	xor a
	ld [wJournalTab], a
	ld [wJournalRegion], a ; JOURNALREGION_ALL
	ld [wJournalCursor], a
	ld [wJournalScroll], a
	call Journal_BuildList
	call Journal_DrawList

.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and B_BUTTON | START
	jmp nz, .quit
	ld a, b
	and A_BUTTON
	jmp nz, .open
	ld a, b
	and SELECT
	jr nz, .switch_tab
	ld a, b
	and D_LEFT
	jr nz, .region_left
	ld a, b
	and D_RIGHT
	jr nz, .region_right
	ld a, b
	and D_UP
	jr nz, .up
	ld a, b
	and D_DOWN
	jr nz, .down
	call DelayFrame
	jr .loop

.region_left
	ld a, [wJournalRegion]
	and a
	jr nz, .previous_region
	ld a, NUM_JOURNAL_REGIONS
.previous_region
	dec a
	jr .new_list

.region_right
	ld a, [wJournalRegion]
	inc a
	cp NUM_JOURNAL_REGIONS
	jr c, .new_list
	xor a
.new_list
	ld [wJournalRegion], a
	jr .reset_list

.switch_tab
	ld a, [wJournalTab]
	xor 1
	ld [wJournalTab], a
.reset_list
	xor a
	ld [wJournalCursor], a
	ld [wJournalScroll], a
	call Journal_BuildList
	ld de, SFX_MENU
	call PlaySFX
	call Journal_DrawList
	jr .loop

.up
	ld hl, wJournalCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	ld hl, wJournalScroll
	cp [hl]
	jr nz, .moved
	dec [hl] ; the cursor was on the top row: scroll
	jr .moved

.down
	ld hl, wJournalCursor
	ld a, [wJournalCount]
	dec a
	cp [hl]
	jr z, .loop
	jmp c, .loop
	inc [hl]
	ld a, [hl]
	ld hl, wJournalScroll
	sub [hl]
	cp JOURNAL_LIST_ROWS
	jr c, .moved
	inc [hl] ; past the bottom row: scroll
.moved
	call Journal_DrawList
	jmp .loop

.open
	ld a, [wJournalCount]
	and a
	jmp z, .loop
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [wJournalCursor]
	ld c, a
	ld b, 0
	ld hl, wJournalList
	add hl, bc
	ld a, [hl]
	ld [wJournalMission], a
	ld c, a
	ld b, RESET_FLAG
	call Journal_UnreadAction
	call Journal_DrawDetail
.detail_loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON | B_BUTTON | START
	jr nz, .close_detail
	call DelayFrame
	jr .detail_loop

.close_detail
	ld de, SFX_MENU
	call PlaySFX
	call Journal_DrawList
	jmp .loop

.quit
; leave with BG map 0 shown, holding the current page
	ldh a, [rLCDC]
	bit rLCDC_BG_TILEMAP, a
	call nz, Journal_ShowPage
	pop af
	ld [wOptions], a
	pop af
	ld [wStateFlags], a
	ret

Journal_ShowPage:
	farjp Passport_ShowPage

Journal_LoadPalettes:
	ld hl, JournalPalettes
	ld de, wBGPals1
	ld bc, NUM_JOURNAL_PALS palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, JournalPalettes
	ld de, wBGPals2
	ld bc, NUM_JOURNAL_PALS palettes
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

JournalPalettes:
; entries correspond to JOURNALPAL_* constants
	RGB 31, 31, 31,  18, 24, 31,  04, 08, 20,  00, 00, 00 ; text
	RGB 31, 31, 31,  18, 24, 31,  04, 08, 20,  16, 16, 16 ; gray
	RGB 31, 31, 31,  18, 24, 31,  04, 08, 20,  22, 04, 04 ; accent
	RGB 31, 31, 31,  18, 24, 31,  04, 08, 20,  02, 18, 04 ; done

Journal_BuildList:
; wJournalList = the current tab's missions (started and not done, or done)
	ld hl, wJournalList
	ld de, wJournalState
	ld bc, 0 ; b = mission, c = count
.loop
	ld a, [de]
	inc de
	bit MISSION_STARTED_F, a
	jr z, .next
	and 1 << MISSION_DONE_F
	jr z, .active
	ld a, [wJournalTab]
	cp JOURNALTAB_DONE
	jr nz, .next
	jr .add
.active
	ld a, [wJournalTab]
	cp JOURNALTAB_ACTIVE
	jr nz, .next
.add
	call .InRegion
	jr nz, .next
	ld [hl], b
	inc hl
	inc c
.next
	inc b
	ld a, b
	cp NUM_MISSIONS
	jr nz, .loop
	ld a, c
	ld [wJournalCount], a
	ret

.InRegion:
; z if mission b is in the shown region. Preserves bc, de, hl.
	ld a, [wJournalRegion]
	and a ; JOURNALREGION_ALL
	ret z
	push bc
	push de
	push hl
	dec a
	push af
	ld a, b
	call Journal_GetMission
	pop af
	cp [hl] ; MISSION_REGION
	pop hl
	pop de
	pop bc
	ret

Journal_ClearScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	rst ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, JOURNALPAL_TEXT
	rst ByteFill
	ret

Journal_DrawList:
	call Journal_ClearScreen
; the region, then the tabs
	hlcoord 0, 0
	lb bc, 2, SCREEN_WIDTH - 2
	call TextboxBorder
	hlcoord 4, 1
	ld [hl], "◂"
	hlcoord 15, 1
	ld [hl], "▶"
	ld a, [wJournalRegion]
	ld e, a
	ld d, 0
	ld hl, JournalRegionFilterTexts
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 7, 1
	rst PlaceString
	hlcoord 3, 2
	ld de, JournalActiveText
	rst PlaceString
	hlcoord 12, 2
	ld de, JournalDoneText
	rst PlaceString
	ld a, [wJournalTab]
	and a ; JOURNALTAB_ACTIVE
	hlcoord 12, 2, wAttrmap
	jr z, .gray_tab
	hlcoord 3, 2, wAttrmap
.gray_tab
	ld bc, 6
	ld a, JOURNALPAL_GRAY
	rst ByteFill
; the list
	hlcoord 0, 4
	lb bc, JOURNAL_LIST_ROWS, SCREEN_WIDTH - 2
	call TextboxBorder
	ld a, [wJournalCount]
	and a
	jr nz, .rows
	hlcoord 2, 5
	ld de, JournalNoneText
	rst PlaceString
	jr .preview_box

.rows
	ld a, [wJournalScroll]
	ld c, a
	ld b, 0
	ld hl, wJournalList
	add hl, bc
	ld d, h
	ld e, l ; de = the first shown mission
	hlcoord 2, 5
	ld b, 0 ; row
.row
	ld a, [wJournalScroll]
	add b
	ld c, a
	ld a, [wJournalCount]
	cp c
	jr z, .rows_done
	push bc
	push de
	push hl
	ld a, [de]
	call Journal_DrawListRow
	pop hl
	pop de
	pop bc
	inc de
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc b
	ld a, b
	cp JOURNAL_LIST_ROWS
	jr nz, .row
.rows_done
; the cursor
	ld a, [wJournalScroll]
	ld b, a
	ld a, [wJournalCursor]
	sub b
	ld bc, SCREEN_WIDTH
	hlcoord 1, 5
	and a
	jr z, .got_cursor
.cursor_row
	add hl, bc
	dec a
	jr nz, .cursor_row
.got_cursor
	ld [hl], "▶"
; arrows on the border where missions are hidden
	ld a, [wJournalScroll]
	and a
	jr z, .no_up
	hlcoord SCREEN_WIDTH - 2, 4
	ld [hl], "▲"
.no_up
	ld a, [wJournalScroll]
	add JOURNAL_LIST_ROWS
	ld b, a
	ld a, [wJournalCount]
	cp b
	jr z, .no_down
	jr c, .no_down
	hlcoord SCREEN_WIDTH - 2, 4 + JOURNAL_LIST_ROWS + 1
	ld [hl], "▼"
.no_down
.preview_box
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextboxBorder
	ld a, [wJournalCount]
	and a
	jr z, .show
	call Journal_DrawPreview
.show
	jmp Journal_ShowPage

Journal_DrawListRow:
; a = MISSION_*, hl = where its title goes
	push af
	push hl
	call Journal_GetMission
	inc hl ; MISSION_TITLE
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	push hl
	rst PlaceString
	pop hl
	pop af
	ld c, a
	push hl
	ld b, CHECK_FLAG
	call Journal_UnreadAction
	pop hl
	ld a, c
	and a
	ret z
	ld bc, MISSION_TITLE_LENGTH
	add hl, bc
	ld [hl], JT_NEW
	inc hl
	ld [hl], JT_NEW + 1
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld a, JOURNALPAL_ACCENT
	ld [hld], a
	ld [hl], a
	ret

Journal_DrawPreview:
; the highlighted mission: its next step, or its summary once done
	ld a, [wJournalCursor]
	ld c, a
	ld b, 0
	ld hl, wJournalList
	add hl, bc
	ld a, [hl]
	ld c, a
	ld hl, wJournalState
	add hl, bc
	ld b, [hl]
	push bc
	ld a, c
	call Journal_GetMission
	pop bc
	bit MISSION_DONE_F, b
	jr z, .next_step
	ld de, MISSION_SUMMARY
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 13
	rst PlaceString
	hlcoord 10, 16
	ld de, JournalCompleteText
	rst PlaceString
	ret

.next_step
; the first step not done
	push bc
	ld a, c
	call Journal_FirstOpenStep ; a = its index, hl = the step
	ld [wJournalEvalSteps], a
	ld de, MSTEP_NEXT
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 13
	rst PlaceString
	pop bc
; "Step n of N"
	hlcoord 8, 16
	ld de, JournalStepText
	rst PlaceString
	ld a, [wJournalEvalSteps]
	inc a
	add "0"
	hlcoord 13, 16
	ld [hl], a
	push hl
	ld a, [wJournalCursor]
	ld c, a
	ld b, 0
	ld hl, wJournalList
	add hl, bc
	ld a, [hl]
	call Journal_GetMission
	ld bc, MISSION_NSTEPS
	add hl, bc
	ld a, [hl]
	pop hl
	add "0"
	ld bc, 5
	add hl, bc
	ld [hl], a
	ret

Journal_FirstOpenStep:
; a = MISSION_* -> a = the index of its first step not done, hl = that step
; (the last step if all are done)
	call Journal_GetMission
	ld bc, MISSION_NSTEPS
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, 0
.loop
	push hl
	push bc
	call Journal_RunCheck
	pop bc
	pop hl
	jr nc, .found
	inc c
	ld a, c
	cp b
	jr z, .last
	ld de, MSTEP_LENGTH
	add hl, de
	jr .loop

.last
	dec c
	ld de, -MSTEP_LENGTH
	add hl, de
.found
	ld a, c
	ret

Journal_DrawDetail:
	call Journal_ClearScreen
	ld a, [wJournalMission]
	call Journal_GetMission
	push hl
; the title and region
	hlcoord 0, 0
	lb bc, 2, SCREEN_WIDTH - 2
	call TextboxBorder
	pop hl
	push hl
	inc hl ; MISSION_TITLE
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 1
	rst PlaceString
	pop hl
	push hl
	ld a, [hl] ; MISSION_REGION
	ld e, a
	ld d, 0
	ld hl, JournalRegionTexts
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 13, 2
	rst PlaceString
; the steps: done ones with a check, the current one with the cursor,
; later ones hidden
	hlcoord 0, 4
	lb bc, MAX_MISSION_STEPS, SCREEN_WIDTH - 2
	call TextboxBorder
	pop hl
	push hl
	ld bc, MISSION_NSTEPS
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, 0 ; step
	ld a, TRUE
	ld [wJournalEvalResult], a ; still showing steps
	decoord 1, 5
.step
	push bc
	push de
	push hl
	call Journal_RunCheck
	pop hl
	pop de
	jr c, .step_done
	ld a, [wJournalEvalResult]
	and a
	jr z, .step_hidden
	xor a
	ld [wJournalEvalResult], a
	ld a, "▶"
	ld [de], a
	jr .step_text

.step_hidden
	push hl
	push de
	ld h, d
	ld l, e
	inc hl
	ld de, JournalUnknownText
	rst PlaceString
	pop de
	pop hl
	jr .step_next

.step_done
	ld a, JT_CHECK
	ld [de], a
	push hl
	ld hl, wAttrmap - wTilemap
	add hl, de
	ld [hl], JOURNALPAL_DONE
	pop hl
.step_text
	push hl
	push de
	ld bc, MSTEP_TEXT
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push de
	inc de
	ld b, h
	ld c, l
	ld h, d
	ld l, e
	ld d, b
	ld e, c
	rst PlaceString
	pop de
	pop hl
.step_next
	ld bc, MSTEP_LENGTH
	add hl, bc
	push hl
	ld hl, SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc c
	ld a, c
	cp b
	jr nz, .step
; the description
	hlcoord 0, 13
	lb bc, 3, SCREEN_WIDTH - 2
	call TextboxBorder
	pop hl
	ld bc, MISSION_DESC
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 14
	rst PlaceString
	jmp Journal_ShowPage

JournalActiveText:   db "Active@"
JournalDoneText:     db "Done@"
JournalNoneText:     db "No missions yet.@"
JournalCompleteText: db "Complete!@"
JournalStepText:     db "Step   of@"
JournalUnknownText:  db "???@"

JournalRegionFilterTexts:
; entries correspond to JOURNALREGION_* (all, then MREGION_* + 1)
	table_width 2
	dw .All
	dw .Johto
	dw .Kanto
	dw .Hoenn
	dw .World
	assert_table_length NUM_JOURNAL_REGIONS
.All:   db " All@"
.Johto: db "Johto@"
.Kanto: db "Kanto@"
.Hoenn: db "Hoenn@"
.World: db "World@"

JournalRegionTexts:
; entries correspond to MREGION_* constants
	table_width 2
	dw .Johto
	dw .Kanto
	dw .Hoenn
	dw .World
	assert_table_length NUM_MISSION_REGIONS
.Johto: db "Johto@"
.Kanto: db "Kanto@"
.Hoenn: db "Hoenn@"
.World: db "World@"

JournalGFX: INCBIN "gfx/journal/journal.2bpp"

INCLUDE "data/events/journal_missions.asm"

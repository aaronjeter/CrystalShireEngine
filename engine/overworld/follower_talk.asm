; Talking to the following Pokémon: an emote, its cry and one line picked
; from its status, HP, the weather, the map, the time of day and its
; happiness. The first talk each day gives +1 happiness; while the day's item
; is unclaimed, a talk can find one.

DEF FOLLOWER_NO_EMOTE EQU -1
DEF FOLLOWER_ITEM_CHANCE EQU 25 percent

; Kept between the callasms of _FollowerScript.
DEF wFollowerTalkText EQUS "wStringBuffer3"        ; dw: the line to print
DEF wFollowerTalkGotItem EQUS "(wStringBuffer3 + 2)" ; db: TRUE if an item was found

MACRO follower_line
; emote (or FOLLOWER_NO_EMOTE), text
	db \1
	dw \2
ENDM

_FollowerScript::
	faceplayer
	callasm FollowerTalk
	ifequal FOLLOWER_NO_EMOTE, .no_emote
	loademote EMOTE_FROM_MEM
	applymovementlasttalked .ShowEmote
	pause 20
	applymovementlasttalked .HideEmote
	callasm FollowerTalkResumeFollow
	faceplayer
.no_emote
	callasm FollowerTalkCry
	opentext
	callasm FollowerTalkPrintLine
	iffalse .done
	farwritetext _ReceivedItemText
	waitsfx
	specialsound
	waitbutton
	itemnotify
	closetext
	end

.done
	waitbutton
	closetext
	end

.ShowEmote:
	show_emote
	step_sleep 1
	step_end

.HideEmote:
	hide_emote
	step_sleep 1
	step_end

FollowerTalkResumeFollow:
; The emote's movement gave the Pokémon its default movement back.
	farjp StartPokemonFollower

FollowerTalkCry:
	farcall GetFollowerPartyMon
	ret c
	jmp PlayMonCry

FollowerTalkPrintLine:
; Prints the chosen line; wScriptVar = TRUE if an item was found.
	ld a, [wFollowerTalkGotItem]
	ld [wScriptVar], a
	ld hl, wFollowerTalkText
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld b, BANK(@)
	jmp MapTextbox

FollowerTalk:
; Output: wScriptVar = emote (FOLLOWER_NO_EMOTE for none), wFollowerTalkText,
; wFollowerTalkGotItem, wStringBuffer1 = nickname, wStringBuffer4 = item name.
	xor a
	ld [wFollowerTalkGotItem], a
	ld [wFollowerTalkText], a
	ld [wFollowerTalkText + 1], a
	ld a, FOLLOWER_NO_EMOTE
	ld [wScriptVar], a
	farcall GetFollowerPartyMon
	ret c
	push hl

; +1 happiness on the first talk of the day
	ld hl, wSwarmFlags
	bit SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
	jr nz, .talked_today
	set SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
	pop hl
	push hl
	ld bc, MON_HAPPINESS
	add hl, bc
	ld a, [hl]
	inc a
	jr z, .talked_today
	ld [hl], a
.talked_today

	pop hl
	push hl
	call FollowerPickLine
	ld a, [hli]
	ld [wScriptVar], a
	ld a, [hli]
	ld [wFollowerTalkText], a
	ld a, [hl]
	ld [wFollowerTalkText + 1], a

; nickname into wStringBuffer1
	pop de
	ld hl, wPartyMon1
	ld c, 0
.index_loop
	ld a, l
	cp e
	jr nz, .next
	ld a, h
	cp d
	jr z, .got_index
.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .index_loop

.got_index
	ld a, c
	ld hl, wPartyMonNicknames
	jmp GetNickname

FollowerPickLine:
; hl = party struct. Returns hl = a follower_line entry.
	push hl
	call FollowerTryFindItem
	pop de
	ret c

; status
	ld hl, MON_STATUS
	add hl, de
	ld b, [hl]
	ld hl, FollowerLine_Sleep
	ld a, b
	and SLP_MASK
	ret nz
	ld hl, FollowerLine_Poison
	bit PSN, b
	ret nz
	ld hl, FollowerLine_Burn
	bit BRN, b
	ret nz
	ld hl, FollowerLine_Freeze
	bit FRZ, b
	ret nz
	ld hl, FollowerLine_Paralysis
	bit PAR, b
	ret nz

; HP: below 1/4 always, below 1/2 half the time
	ld hl, MON_HP
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a ; bc = HP
	ld a, [hli]
	ld l, [hl]
	ld h, a ; hl = max HP
	sla c
	rl b
	push bc ; HP * 2
	sla c
	rl b
	ld a, c
	sub l
	ld a, b
	sbc h
	pop bc
	jr nc, .not_exhausted
	ld hl, FollowerLine_Exhausted
	ret

.not_exhausted
	ld a, c
	sub l
	ld a, b
	sbc h
	jr nc, .weather
	call Random
	rrca
	jr nc, .weather
	ld hl, FollowerLine_WornOut
	ret

.weather
; half the time a weather line
	ld a, [wCurWeather]
	and a
	jr z, .roll
	cp NUM_OW_WEATHERS + 1
	jr nc, .roll
	ld b, a
	call Random
	rrca
	jr nc, .roll
	ld a, b
	dec a
	ld hl, FollowerWeatherGroups
	jr .PickFromGroupTable

.roll
; 1/3 place, 1/3 time of day, 1/3 happiness
	ld a, 3
	call RandomRange
	and a
	jr z, .place
	dec a
	jr z, .time

.happiness
	ld hl, MON_HAPPINESS
	add hl, de
	ld a, [hl]
	ld hl, FollowerLines_Happiness200
	cp 200
	jr nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness150
	cp 150
	jr nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness100
	cp 100
	jr nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness50
	cp 50
	jr nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness0
	jr FollowerPickFromGroup

.place
	ld a, [wEnvironment]
	dec a
	cp NUM_ENVIRONMENTS
	jr nc, .happiness
	ld hl, FollowerPlaceGroups
	jr .PickFromGroupTable

.time
; sky lines only outdoors
	ld hl, FollowerTimeGroupsIndoors
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outdoors
	cp ROUTE
	jr nz, .got_time_table
.outdoors
	ld hl, FollowerTimeGroupsOutdoors
.got_time_table
	ld a, [wTimeOfDay]
	and %11

.PickFromGroupTable:
; a = index into the table of group pointers at hl (0 = none: happiness)
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .happiness
	; fallthrough

FollowerPickFromGroup:
; hl = a group (count, then follower_line entries). Returns hl = an entry.
	ld a, [hli]
	call RandomRange
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ret

FollowerTryFindItem:
; While the day's item is unclaimed, a chance to find one.
; Returns carry and hl = the line to show if something was found.
	ld hl, wSwarmFlags
	bit SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
	jr nz, .none
	call Random
	cp FOLLOWER_ITEM_CHANCE
	jr nc, .none

	call Random
	ld hl, FollowerItems_Common
	cp 70 percent
	jr c, .pick
	ld hl, FollowerItems_Uncommon
	cp 95 percent
	jr c, .pick
	ld hl, FollowerItems_Rare
.pick
	ld a, [hli]
	call RandomRange
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ld hl, FollowerLine_PackFull
	jr nc, .found ; the item stays unclaimed for the day

	ld hl, wSwarmFlags
	set SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
	ld a, TRUE
	ld [wFollowerTalkGotItem], a
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer4
	ld de, wStringBuffer1
	call CopyName2
	ld hl, FollowerLine_HoldingItem
.found
	scf
	ret

.none
	and a
	ret

FollowerItems_Common:
	db 8
	dw ORAN_BERRY, PECHA_BERRY, CHERI_BERRY, CHESTO_BERRY
	dw RAWST_BERRY, ASPEAR_BERRY, POTION, POKE_BALL

FollowerItems_Uncommon:
	db 9
	dw SITRUS_BERRY, LEPPA_BERRY, LUM_BERRY, SUPER_POTION, GREAT_BALL
	dw ETHER, TINYMUSHROOM, PEARL, STARDUST

FollowerItems_Rare:
	db 5
	dw NUGGET, STAR_PIECE, BIG_PEARL, RARE_CANDY, PP_UP

; Single lines
FollowerLine_Poison:     follower_line EMOTE_SAD, FollowerText_Poison
FollowerLine_Burn:       follower_line EMOTE_SAD, FollowerText_Burn
FollowerLine_Paralysis:  follower_line EMOTE_BOLT, FollowerText_Paralysis
FollowerLine_Sleep:      follower_line EMOTE_SLEEP, FollowerText_Sleep
FollowerLine_Freeze:     follower_line EMOTE_SHOCK, FollowerText_Freeze
FollowerLine_Exhausted:  follower_line EMOTE_SAD, FollowerText_Exhausted
FollowerLine_WornOut:    follower_line FOLLOWER_NO_EMOTE, FollowerText_WornOut
FollowerLine_HoldingItem: follower_line EMOTE_SHOCK, FollowerText_HoldingItem
FollowerLine_PackFull:   follower_line EMOTE_SAD, FollowerText_PackFull

FollowerWeatherGroups:
; indexed by OW_WEATHER_* - 1
	dw FollowerLines_Rain
	dw FollowerLines_Snow
	dw FollowerLines_Sandstorm
	dw FollowerLines_Ash
	assert (@ - FollowerWeatherGroups) / 2 == NUM_OW_WEATHERS

FollowerPlaceGroups:
; indexed by wEnvironment - 1
	dw FollowerLines_Town    ; TOWN
	dw FollowerLines_Route   ; ROUTE
	dw FollowerLines_Indoor  ; INDOOR
	dw FollowerLines_Cave    ; CAVE
	dw FollowerLines_Indoor  ; ENVIRONMENT_5
	dw FollowerLines_Gate    ; GATE
	dw FollowerLines_Dungeon ; DUNGEON
	assert (@ - FollowerPlaceGroups) / 2 == NUM_ENVIRONMENTS

FollowerTimeGroupsOutdoors:
; indexed by wTimeOfDay
	dw FollowerLines_MorningOutdoors ; MORN_F
	dw FollowerLines_Day             ; DAY_F
	dw FollowerLines_NightOutdoors   ; NITE_F
	dw FollowerLines_Evening         ; EVE_F

FollowerTimeGroupsIndoors:
	dw FollowerLines_Morning ; MORN_F
	dw 0                     ; DAY_F
	dw FollowerLines_Night   ; NITE_F
	dw 0                     ; EVE_F

FollowerLines_Rain:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Rain1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Rain2

FollowerLines_Snow:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Snow1
	follower_line EMOTE_SAD, FollowerText_Snow2

FollowerLines_Sandstorm:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Sandstorm1
	follower_line EMOTE_SHOCK, FollowerText_Sandstorm2

FollowerLines_Ash:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Ash1
	follower_line EMOTE_QUESTION, FollowerText_Ash2

FollowerLines_Town:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Town1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Town2
	follower_line EMOTE_HAPPY, FollowerText_Town3

FollowerLines_Route:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Route1
	follower_line EMOTE_HAPPY, FollowerText_Route2
	follower_line EMOTE_HAPPY, FollowerText_Route3

FollowerLines_Cave:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Cave1
	follower_line EMOTE_QUESTION, FollowerText_Cave2
	follower_line EMOTE_SHOCK, FollowerText_Cave3

FollowerLines_Indoor:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Indoor1
	follower_line EMOTE_HAPPY, FollowerText_Indoor2

FollowerLines_Gate:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Gate

FollowerLines_Dungeon:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Dungeon1
	follower_line EMOTE_QUESTION, FollowerText_Dungeon2

FollowerLines_Morning:
	db 1
	follower_line EMOTE_SLEEP, FollowerText_Morning1

FollowerLines_MorningOutdoors:
	db 2
	follower_line EMOTE_SLEEP, FollowerText_Morning1
	follower_line EMOTE_HAPPY, FollowerText_Morning2

FollowerLines_Day:
	db 1
	follower_line EMOTE_HAPPY, FollowerText_Day

FollowerLines_Evening:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Evening

FollowerLines_Night:
	db 1
	follower_line EMOTE_SLEEP, FollowerText_Night2

FollowerLines_NightOutdoors:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Night1
	follower_line EMOTE_SLEEP, FollowerText_Night2

FollowerLines_Happiness200:
	db 3
	follower_line EMOTE_HEART, FollowerText_Happiness200_1
	follower_line EMOTE_HEART, FollowerText_Happiness200_2
	follower_line EMOTE_HEART, FollowerText_Happiness200_3

FollowerLines_Happiness150:
	db 3
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_1
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_2
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_3

FollowerLines_Happiness100:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness100_1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness100_2

FollowerLines_Happiness50:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness50_1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness50_2

FollowerLines_Happiness0:
	db 2
	follower_line EMOTE_SAD, FollowerText_Happiness0_1
	follower_line EMOTE_SAD, FollowerText_Happiness0_2

; Texts. wStringBuffer1 holds the nickname (up to 10 characters), so the
; first line has room for 8 more.

MACRO follower_text_mon
; "<nickname>\1" on the first line
	text_ram wStringBuffer1
	text \1
ENDM

FollowerText_Poison:
	follower_text_mon " is"
	line "shivering…"
	cont "It looks poisoned."
	done

FollowerText_Burn:
	follower_text_mon " is"
	line "wincing from its"
	cont "burn."
	done

FollowerText_Paralysis:
	follower_text_mon "'s body"
	line "is twitching. It's"
	cont "paralyzed!"
	done

FollowerText_Sleep:
	follower_text_mon " is"
	line "dozing off on its"
	cont "feet. Zzz…"
	done

FollowerText_Freeze:
	follower_text_mon " is"
	line "frozen stiff!"
	done

FollowerText_Exhausted:
	follower_text_mon " is"
	line "exhausted. It can"
	cont "barely stand…"
	done

FollowerText_WornOut:
	follower_text_mon " looks"
	line "a little worn out."
	done

FollowerText_HoldingItem:
	follower_text_mon " is"
	line "holding something!"
	prompt

FollowerText_PackFull:
	follower_text_mon " wanted"
	line "to give you an"
	cont "item, but your"
	cont "Pack is full."
	done

FollowerText_Rain1:
	follower_text_mon " is"
	line "splashing in the"
	cont "puddles!"
	done

FollowerText_Rain2:
	follower_text_mon " shakes"
	line "the rain off its"
	cont "body."
	done

FollowerText_Snow1:
	follower_text_mon " is"
	line "trying to catch"
	cont "snowflakes!"
	done

FollowerText_Snow2:
	follower_text_mon " is"
	line "shivering in the"
	cont "cold."
	done

FollowerText_Sandstorm1:
	follower_text_mon " is"
	line "squinting through"
	cont "the sandstorm."
	done

FollowerText_Sandstorm2:
	text "Achoo! @"
	text_ram wStringBuffer1
	text_start
	line "sneezed from the"
	cont "sand!"
	done

FollowerText_Ash1:
	follower_text_mon " is"
	line "covered in gray"
	cont "ash."
	done

FollowerText_Ash2:
	follower_text_mon " is"
	line "sniffing the"
	cont "falling ash."
	done

FollowerText_Town1:
	follower_text_mon " is"
	line "looking at the"
	cont "houses."
	done

FollowerText_Town2:
	follower_text_mon " is"
	line "watching people"
	cont "go by."
	done

FollowerText_Town3:
	follower_text_mon " seems"
	line "to like this town."
	done

FollowerText_Route1:
	follower_text_mon " is"
	line "sniffing the"
	cont "grass."
	done

FollowerText_Route2:
	follower_text_mon " wants"
	line "to run around!"
	done

FollowerText_Route3:
	follower_text_mon " is"
	line "enjoying the fresh"
	cont "air."
	done

FollowerText_Cave1:
	follower_text_mon " is"
	line "peering into the"
	cont "darkness."
	done

FollowerText_Cave2:
	follower_text_mon " is"
	line "listening to the"
	cont "echoes."
	done

FollowerText_Cave3:
	follower_text_mon " jumped"
	line "at a falling drop"
	cont "of water!"
	done

FollowerText_Indoor1:
	follower_text_mon " is"
	line "looking around the"
	cont "room."
	done

FollowerText_Indoor2:
	follower_text_mon " seems"
	line "relaxed indoors."
	done

FollowerText_Gate:
	follower_text_mon " is"
	line "waiting patiently."
	done

FollowerText_Dungeon1:
	follower_text_mon " is"
	line "on its guard."
	done

FollowerText_Dungeon2:
	follower_text_mon " senses"
	line "something nearby…"
	done

FollowerText_Morning1:
	follower_text_mon " yawns."
	line "It's still early!"
	done

FollowerText_Morning2:
	follower_text_mon " is"
	line "stretching in the"
	cont "morning sun."
	done

FollowerText_Day:
	follower_text_mon " is"
	line "basking in the"
	cont "sunshine."
	done

FollowerText_Evening:
	follower_text_mon " is"
	line "watching the"
	cont "sunset."
	done

FollowerText_Night1:
	follower_text_mon " is"
	line "looking up at the"
	cont "stars."
	done

FollowerText_Night2:
	follower_text_mon " is"
	line "getting sleepy…"
	done

FollowerText_Happiness200_1:
	follower_text_mon " is"
	line "snuggling up to"
	cont "you!"
	done

FollowerText_Happiness200_2:
	follower_text_mon " gives"
	line "you a big smile!"
	done

FollowerText_Happiness200_3:
	follower_text_mon " is"
	line "happy to be with"
	cont "you!"
	done

FollowerText_Happiness150_1:
	follower_text_mon " is in"
	line "a good mood."
	done

FollowerText_Happiness150_2:
	follower_text_mon " is"
	line "humming happily."
	done

FollowerText_Happiness150_3:
	follower_text_mon " looks"
	line "at you cheerfully."
	done

FollowerText_Happiness100_1:
	follower_text_mon " is"
	line "looking at you."
	done

FollowerText_Happiness100_2:
	follower_text_mon " is"
	line "walking along with"
	cont "you."
	done

FollowerText_Happiness50_1:
	follower_text_mon " seems"
	line "a little distant…"
	done

FollowerText_Happiness50_2:
	follower_text_mon " looks"
	line "away from you."
	done

FollowerText_Happiness0_1:
	follower_text_mon " won't"
	line "look at you."
	done

FollowerText_Happiness0_2:
	follower_text_mon " is"
	line "ignoring you…"
	done

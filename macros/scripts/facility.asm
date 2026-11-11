; Challenge facility scripts (engine/events/facility.asm)

MACRO facility_battles
; facility_battles OPPONENT, WinText, LossText, NextText, Won, Lost
; After FacilitySetup and FacilityChooseTeam: runs the FACILITY_ROUNDS battles.
; OPPONENT is an object with SPRITE_BATTLE_TOWER_OPPONENT, which shows each
; round's trainer. NextText comes between rounds. Then jumps to Won or Lost;
; either way the party is back as it was (the map sets the cleared flag and
; gives the prize).
	special FacilityStartRun
.facility_round\@
	special FacilityOpponentSprite
	special LoadUsedSpritesGFX
	special FacilityLoadTrainer
	winlosstext \2, \3
	setlasttalked \1
	startbattle
	reloadmap
	iftrue .facility_lost\@
	special FacilityNextRound
	iffalse .facility_won\@
	special HealParty
	opentext
	writetext \4
	waitbutton
	closetext
	sjump .facility_round\@
.facility_won\@
	special FacilityEndRun
	sjump \5
.facility_lost\@
	special FacilityEndRun
	sjump \6
ENDM

MACRO facility_intro_prize_room
; wScriptVar = TRUE if the intro prizes (3 Rare Candies, 2 Ability Capsules,
; an Ability Patch) all fit in the Pack (it tries giving them, then takes them back)
	giveitem RARE_CANDY, 3
	iffalse .prize_room_none\@
	giveitem ABILITY_CAPSULE, 2
	iffalse .prize_room_candy\@
	giveitem ABILITY_PATCH
	iffalse .prize_room_capsules\@
	takeitem ABILITY_PATCH
	takeitem ABILITY_CAPSULE, 2
	takeitem RARE_CANDY, 3
	setval TRUE
	sjump .prize_room_done\@
.prize_room_capsules\@
	takeitem ABILITY_CAPSULE, 2
.prize_room_candy\@
	takeitem RARE_CANDY, 3
.prize_room_none\@
	setval FALSE
.prize_room_done\@
ENDM

MACRO facility_hall_prize_room
; facility_hall_prize_room ITEM: wScriptVar = TRUE if an intermediate facility's
; prizes (ITEM, 3 Rare Candies, 2 Ability Capsules, an Ability Patch) all fit
; in the Pack (it tries giving them, then takes them back)
	giveitem \1
	iffalse .hall_room_none\@
	facility_intro_prize_room
	takeitem \1
.hall_room_none\@
ENDM

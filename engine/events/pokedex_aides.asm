; Professors' aides who reward the number of Pokémon caught (Nov 1, 2026).
; Every region has one early aide with the same three shared rewards (each
; given once, by whichever aide the player shows first), and two late aides
; with their own rewards. Each reward comes with a bundle of balls and
; training items (given separately, so a full Pack only delays it). Maps set
; STRING_BUFFER_3 to their professor's name, then farsjump here.
; Thresholds: the numbers in the scripts and in PokedexAideNotYet*Text.

PokedexAideScript::
; The early aides (Route 2 gate, Route 31-Violet gate, Petalburg Center):
; 10 Lucky Egg, 25 Ability Capsule, 40 Eviolite.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
.check
	checkevent EVENT_GOT_LUCKY_EGG_FROM_DEX_AIDE
	iffalse .Tier10
	checkevent EVENT_DEX_AIDE_BUNDLE_10
	iffalse .Bundle10
	checkevent EVENT_GOT_ABILITY_CAPSULE_FROM_DEX_AIDE
	iffalse .Tier25
	checkevent EVENT_DEX_AIDE_BUNDLE_25
	iffalse .Bundle25
	checkevent EVENT_GOT_EVIOLITE_FROM_DEX_AIDE
	iffalse .Tier40
	checkevent EVENT_DEX_AIDE_BUNDLE_40
	iffalse .Bundle40
	writetext PokedexAideAllDoneText
	sjump PokedexAideEnd

.Tier10:
	readvar VAR_DEXCAUGHT
	ifless 10, .NotYet10
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem LUCKY_EGG
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_LUCKY_EGG_FROM_DEX_AIDE
	writetext PokedexAideLuckyEggText
	promptbutton
.Bundle10:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem GREAT_BALL, 5
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_10
	sjump .check

.NotYet10:
	writetext PokedexAideNotYet10Text
	sjump PokedexAideEnd

.Tier25:
	readvar VAR_DEXCAUGHT
	ifless 25, .NotYet25
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem ABILITY_CAPSULE
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_ABILITY_CAPSULE_FROM_DEX_AIDE
	writetext PokedexAideCapsuleText
	promptbutton
.Bundle25:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem LEVEL_BALL, 5
	iffalse PokedexAideBundleFull
	verbosegiveitem RARE_CANDY, 1
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_25
	sjump .check

.NotYet25:
	writetext PokedexAideNotYet25Text
	sjump PokedexAideEnd

.Tier40:
	readvar VAR_DEXCAUGHT
	ifless 40, .NotYet40
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem EVIOLITE
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_EVIOLITE_FROM_DEX_AIDE
	writetext PokedexAideEvioliteText
	promptbutton
.Bundle40:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem FRIEND_BALL, 7
	iffalse PokedexAideBundleFull
	verbosegiveitem RARE_CANDY, 2
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_40
	sjump .check

.NotYet40:
	writetext PokedexAideNotYet40Text
	sjump PokedexAideEnd

PokedexAideBagFull:
	writetext PokedexAideBagFullText
	sjump PokedexAideEnd

PokedexAideBundleFull:
	writetext PokedexAideBundleFullText
PokedexAideEnd:
	waitbutton
	closetext
	end

PokedexAideLateDone:
	writetext PokedexAideLateDoneText
	sjump PokedexAideEnd

PokedexAideBigRootScript::
; Kanto's 60 aide (Celadon Center): Big Root.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_BIG_ROOT_FROM_DEX_AIDE
	iffalse .Tier60
	checkevent EVENT_DEX_AIDE_BUNDLE_60
	iffalse .Bundle60
	sjump PokedexAideLateDone

.Tier60:
	readvar VAR_DEXCAUGHT
	ifless 60, .NotYet60
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem BIG_ROOT
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_BIG_ROOT_FROM_DEX_AIDE
	writetext PokedexAideBigRootText
	promptbutton
.Bundle60:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem LURE_BALL, 10
	iffalse PokedexAideBundleFull
	verbosegiveitem PP_UP, 1
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_60
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet60:
	writetext PokedexAideNotYet60Text
	sjump PokedexAideEnd

PokedexAideBandsScript::
; Johto's 75 aide (Route 43-Mahogany gate): Muscle Band and Wise Glasses.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_WISE_GLASSES_FROM_DEX_AIDE
	iffalse .Tier75
	checkevent EVENT_DEX_AIDE_BUNDLE_75
	iffalse .Bundle75
	sjump PokedexAideLateDone

.Tier75:
	readvar VAR_DEXCAUGHT
	ifless 75, .NotYet75
	writetext PokedexAideRewardText
	promptbutton
	checkevent EVENT_GOT_MUSCLE_BAND_FROM_DEX_AIDE
	iftrue .Got75_0
	verbosegiveitem MUSCLE_BAND
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_MUSCLE_BAND_FROM_DEX_AIDE
.Got75_0:
	checkevent EVENT_GOT_WISE_GLASSES_FROM_DEX_AIDE
	iftrue .Got75_1
	verbosegiveitem WISE_GLASSES
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_WISE_GLASSES_FROM_DEX_AIDE
.Got75_1:
	writetext PokedexAideBandsText
	promptbutton
.Bundle75:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem ULTRA_BALL, 10
	iffalse PokedexAideBundleFull
	verbosegiveitem PP_UP, 1
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_75
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet75:
	writetext PokedexAideNotYet75Text
	sjump PokedexAideEnd

PokedexAideBindingBandScript::
; Hoenn's 90 aide (Lilycove Center): Binding Band.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_BINDING_BAND_FROM_DEX_AIDE
	iffalse .Tier90
	checkevent EVENT_DEX_AIDE_BUNDLE_90
	iffalse .Bundle90
	sjump PokedexAideLateDone

.Tier90:
	readvar VAR_DEXCAUGHT
	ifless 90, .NotYet90
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem BINDING_BAND
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_BINDING_BAND_FROM_DEX_AIDE
	writetext PokedexAideBindingBandText
	promptbutton
.Bundle90:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem FAST_BALL, 15
	iffalse PokedexAideBundleFull
	verbosegiveitem RARE_CANDY, 2
	iffalse PokedexAideBundleFull
	verbosegiveitem PP_UP, 1
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_90
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet90:
	writetext PokedexAideNotYet90Text
	sjump PokedexAideEnd

PokedexAidePatchScript::
; Kanto's 100 aide (Saffron west gate): Ability Patch.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_ABILITY_PATCH_FROM_DEX_AIDE
	iffalse .Tier100
	checkevent EVENT_DEX_AIDE_BUNDLE_100
	iffalse .Bundle100
	sjump PokedexAideLateDone

.Tier100:
	readvar VAR_DEXCAUGHT
	ifless 100, .NotYet100
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem ABILITY_PATCH
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_ABILITY_PATCH_FROM_DEX_AIDE
	writetext PokedexAidePatchText
	promptbutton
.Bundle100:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem ULTRA_BALL, 15
	iffalse PokedexAideBundleFull
	verbosegiveitem RARE_CANDY, 3
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_100
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet100:
	writetext PokedexAideNotYet100Text
	sjump PokedexAideEnd

PokedexAideLeftoversScript::
; Johto's 120 aide (Blackthorn Center): Leftovers.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_LEFTOVERS_FROM_DEX_AIDE
	iffalse .Tier120
	checkevent EVENT_DEX_AIDE_BUNDLE_120
	iffalse .Bundle120
	sjump PokedexAideLateDone

.Tier120:
	readvar VAR_DEXCAUGHT
	ifless 120, .NotYet120
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem LEFTOVERS
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_LEFTOVERS_FROM_DEX_AIDE
	writetext PokedexAideLeftoversText
	promptbutton
.Bundle120:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem HEAVY_BALL, 20
	iffalse PokedexAideBundleFull
	verbosegiveitem PP_UP, 2
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_120
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet120:
	writetext PokedexAideNotYet120Text
	sjump PokedexAideEnd

PokedexAideMasterBallScript::
; Hoenn's 150 aide (Sootopolis Center): Master Ball.
	faceplayer
	opentext
	writetext PokedexAideIntroText
	promptbutton
	checkevent EVENT_GOT_MASTER_BALL_FROM_DEX_AIDE
	iffalse .Tier150
	checkevent EVENT_DEX_AIDE_BUNDLE_150
	iffalse .Bundle150
	sjump PokedexAideLateDone

.Tier150:
	readvar VAR_DEXCAUGHT
	ifless 150, .NotYet150
	writetext PokedexAideRewardText
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse PokedexAideBagFull
	setevent EVENT_GOT_MASTER_BALL_FROM_DEX_AIDE
	writetext PokedexAideMasterBallText
	promptbutton
.Bundle150:
	writetext PokedexAideBundleText
	promptbutton
	verbosegiveitem ULTRA_BALL, 20
	iffalse PokedexAideBundleFull
	verbosegiveitem RARE_CANDY, 5
	iffalse PokedexAideBundleFull
	verbosegiveitem PP_UP, 3
	iffalse PokedexAideBundleFull
	setevent EVENT_DEX_AIDE_BUNDLE_150
	writetext PokedexAideThanksText
	sjump PokedexAideEnd

.NotYet150:
	writetext PokedexAideNotYet150Text
	sjump PokedexAideEnd

PokedexAideBundleText:
	text "And take these"
	line "too. They'll help"
	cont "you catch more!"
	done

PokedexAideBundleFullText:
	text "Oh, your Pack is"
	line "full. Come back"
	cont "for the rest!"
	done

PokedexAideThanksText:
	text "Keep it up!"
	done

PokedexAideNotYet60Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 60 kinds and"
	line "I'll have a reward"
	cont "for you!"
	done

PokedexAideNotYet90Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 90 kinds and"
	line "I'll have a reward"
	cont "for you!"
	done

PokedexAideNotYet120Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 120 kinds"
	line "and I'll have a"
	cont "reward for you!"
	done

PokedexAideBigRootText:
	text "A Big Root makes"
	line "draining moves"
	cont "restore more HP."
	done

PokedexAideBindingBandText:
	text "A Binding Band"
	line "makes moves like"
	cont "Wrap hurt more."
	done

PokedexAideLeftoversText:
	text "A #mon holding"
	line "Leftovers slowly"
	cont "restores HP in"
	cont "battle."
	done

PokedexAideIntroText:
	text "Hi! I'm one of"
	line "Prof.@"
	text_ram wStringBuffer3
	text "'s aides."

	para "I'm checking how"
	line "trainers' #dex"
	cont "are coming along."
	done

PokedexAideRewardText:
	text "Wow! You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds!"

	para "That's great!"
	line "Here's a reward."
	done

PokedexAideNotYet10Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 10 kinds and"
	line "I'll have a reward"
	cont "for you!"
	done

PokedexAideNotYet25Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 25 kinds and"
	line "I'll have another"
	cont "reward for you!"
	done

PokedexAideNotYet40Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 40 kinds and"
	line "I'll have one more"
	cont "reward for you!"
	done

PokedexAideNotYet75Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 75 kinds and"
	line "I'll have a reward"
	cont "for you!"
	done

PokedexAideNotYet100Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 100 kinds"
	line "and I'll have a"
	cont "reward for you!"
	done

PokedexAideNotYet150Text:
	text "You've caught"
	line "@"
	text_decimal wScriptVar, 1, 3
	text " kinds so far."

	para "Catch 150 kinds"
	line "and I'll have a"
	cont "special reward!"
	done

PokedexAideLuckyEggText:
	text "A #mon holding"
	line "a Lucky Egg gains"
	cont "more experience."
	done

PokedexAideCapsuleText:
	text "An Ability Capsule"
	line "swaps a #mon's"
	cont "ability for its"
	cont "other one."
	done

PokedexAideEvioliteText:
	text "Eviolite makes a"
	line "#mon that can"
	cont "still evolve much"
	cont "tougher."
	done

PokedexAideBandsText:
	text "The Muscle Band"
	line "powers up physical"
	cont "moves, and the"
	cont "Wise Glasses boost"
	cont "special ones."
	done

PokedexAidePatchText:
	text "An Ability Patch"
	line "gives a #mon"
	cont "its hidden"
	cont "ability!"
	done

PokedexAideMasterBallText:
	text "It's a Master"
	line "Ball. It never"
	cont "fails to catch a"
	cont "wild #mon!"
	done

PokedexAideAllDoneText:
	text "I have nothing"
	line "more for you, but"
	cont "keep filling your"
	cont "#dex!"

	para "My colleagues in"
	line "other regions have"
	cont "rewards for bigger"
	cont "catches."
	done

PokedexAideLateDoneText:
	text "Keep filling your"
	line "#dex! I'm sure"
	cont "the Prof. would be"
	cont "proud."
	done

PokedexAideBagFullText:
	text "Oh, your Pack is"
	line "full. Come back"
	cont "when you have"
	cont "room."
	done

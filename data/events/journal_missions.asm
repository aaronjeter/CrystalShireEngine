; Journal missions (engine/menus/journal.asm)
;
; mission REGION, title (up to MISSION_TITLE_LENGTH), description, done summary
; mstart MC_*, argument: when the mission appears in the journal
; msteps N, then N times:
; mstep MC_*, argument, step text (up to 16), next text (2 lines of 18)
;
; Texts are dialogue strings: <LF> moves down one row. The description has up
; to 3 lines; the done summary up to 2.

MACRO mission
	db \1
	dw \2, \3, \4
ENDM

MACRO mstart
	db \1
	dw \2
ENDM

MACRO msteps
	db \1
	assert \1 <= MAX_MISSION_STEPS, "too many mission steps"
ENDM

MACRO mstep
	db \1
	dw \2, \3, \4
ENDM

MACRO mtitle
	db \1, "@"
	assert STRLEN(\1) <= MISSION_TITLE_LENGTH, "mission title too long: \1"
ENDM

MACRO mtext
	dialog_db \#, "@"
ENDM

JournalMissions:
; entries correspond to MISSION_* constants
	table_width 2
	dw JournalMission_JohtoChallenge
	dw JournalMission_KantoChallenge
	dw JournalMission_HoennChallenge
	dw JournalMission_WorldCup
	dw JournalMission_MysteryEgg
	dw JournalMission_TogepiEgg
	dw JournalMission_RocketsSignal
	dw JournalMission_JanesTrail
	dw JournalMission_RedGyarados
	dw JournalMission_BellTower
	dw JournalMission_WhirlIslands
	dw JournalMission_LegendaryBirds
	dw JournalMission_Mewtwo
	dw JournalMission_RegiTrio
	dw JournalMission_WeatherDuo
	dw JournalMission_MeteorPeak
	dw JournalMission_DesertShrine
	dw JournalMission_Parcels
	dw JournalMission_FastShip
	dw JournalMission_JohtoAides
	dw JournalMission_KantoAides
	dw JournalMission_HoennAides
	dw JournalMission_JohtoHalls
	dw JournalMission_KantoHalls
	dw JournalMission_HoennHalls
	dw JournalMission_BattleTower
	dw JournalMission_LeagueRematches
	dw JournalMission_TitleDefense
	assert_table_length NUM_MISSIONS

; Main goals ------------------------------------------------------------------

JournalMission_JohtoChallenge:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_JOHTO_BADGES, 1
	msteps 3
	mstep MC_JOHTO_BADGES, 8, .s1, .n1
	mstep MC_EVENT, EVENT_BEAT_RIVAL_SILVER_PASS, .s2, .n2
	mstep MC_EVENT, EVENT_BEAT_JOHTO_LEAGUE, .s3, .n3
.title   mtitle "Johto Challenge"
.desc    mtext "Collect Johto's 8<LF>Badges, then take<LF>on its League."
.summary mtext "You became the<LF>Johto Champion!"
.s1 mtext "8 Johto Badges"
.n1 mtext "Collect all 8<LF>Johto Badges."
.s2 mtext "The Silver Pass"
.n2 mtext "Cross the Silver<LF>Pass to the north."
.s3 mtext "The Johto League"
.n3 mtext "Win the League in<LF>Silver Town."

JournalMission_KantoChallenge:
	mission MREGION_KANTO, .title, .desc, .summary
	mstart MC_KANTO_BADGES, 1
	msteps 3
	mstep MC_KANTO_BADGES, 8, .s1, .n1
	mstep MC_ENGINE, ENGINE_FLYPOINT_INDIGO_PLATEAU, .s2, .n2
	mstep MC_EVENT, EVENT_BEAT_INDIGO_LEAGUE, .s3, .n3
.title   mtitle "Kanto Challenge"
.desc    mtext "Collect Kanto's 8<LF>Badges, then take<LF>on its League."
.summary mtext "You became the<LF>Kanto Champion!"
.s1 mtext "8 Kanto Badges"
.n1 mtext "Collect all 8<LF>Kanto Badges."
.s2 mtext "Victory Road"
.n2 mtext "Climb Victory Road<LF>to Indigo Plateau."
.s3 mtext "The Kanto League"
.n3 mtext "Win the League at<LF>Indigo Plateau."

JournalMission_HoennChallenge:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_HOENN_BADGES, 1
	msteps 3
	mstep MC_HOENN_BADGES, 8, .s1, .n1
	mstep MC_EVENT, EVENT_FOUND_VICTORY_ROAD_WALLY, .s2, .n2
	mstep MC_EVENT, EVENT_BEAT_HOENN_LEAGUE, .s3, .n3
.title   mtitle "Hoenn Challenge"
.desc    mtext "Collect Hoenn's 8<LF>Badges, then take<LF>on its League."
.summary mtext "You became the<LF>Hoenn Champion!"
.s1 mtext "8 Hoenn Badges"
.n1 mtext "Collect all 8<LF>Hoenn Badges."
.s2 mtext "Wally's test"
.n2 mtext "Wally waits in<LF>Ever Grande City."
.s3 mtext "The Hoenn League"
.n3 mtext "Win the League in<LF>Ever Grande City."

JournalMission_WorldCup:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_BADGES, 16
	msteps 7
	mstep MC_EVENT, EVENT_WORLD_CUP_REGISTERED, .s1, .n1
	mstep MC_EVENT, EVENT_WORLD_CUP_QUALIFIED, .s2, .n2
	mstep MC_EVENT, EVENT_WORLD_CUP_BEAT_ROUND_ONE, .s3, .n3
	mstep MC_EVENT, EVENT_WORLD_CUP_BEAT_ROUND_TWO, .s4, .n3
	mstep MC_EVENT, EVENT_WORLD_CUP_BEAT_ROUND_THREE, .s5, .n3
	mstep MC_EVENT, EVENT_WORLD_CUP_BEAT_ROUND_FOUR, .s6, .n3
	mstep MC_EVENT, EVENT_WORLD_CUP_CHAMPION, .s7, .n7
.title   mtitle "The World Cup"
.desc    mtext "The best trainers<LF>of three regions<LF>meet in one cup."
.summary mtext "You are the World<LF>Cup Champion!"
.s1 mtext "Register"
.n1 mtext "Sign up at the<LF>World Cup lobby."
.s2 mtext "The qualifiers"
.n2 mtext "Win the three<LF>qualifier rounds."
.s3 mtext "Round one"
.s4 mtext "Round two"
.s5 mtext "Round three"
.s6 mtext "Round four"
.n3 mtext "Win your next<LF>World Cup round."
.s7 mtext "The finals"
.n7 mtext "Win the World Cup<LF>finals!"

; Story -----------------------------------------------------------------------

JournalMission_MysteryEgg:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_CALL, Journal_GotElmStarter
	msteps 2
	mstep MC_EVENT, EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON, .s1, .n1
	mstep MC_EVENT, EVENT_GAVE_MYSTERY_EGG_TO_ELM, .s2, .n2
.title   mtitle "The Mystery Egg"
.desc    mtext "Prof.Elm wants to<LF>know what Mr.<LF>#mon found."
.summary mtext "Elm is studying<LF>the mystery Egg."
.s1 mtext "Mr.#mon"
.n1 mtext "Visit Mr.#mon<LF>past Cherrygrove."
.s2 mtext "Back to Elm"
.n2 mtext "Take the Egg back<LF>to Prof.Elm."

JournalMission_TogepiEgg:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_CALL, Journal_GotTogepiEgg
	msteps 2
	mstep MC_CALL, Journal_GotTogepiEgg, .s1, .n1
	mstep MC_EVENT, EVENT_TOGEPI_HATCHED, .s2, .n2
.title   mtitle "A Togepi Egg"
.desc    mtext "A professor's aide<LF>gave you an Egg to<LF>care for."
.summary mtext "The Egg hatched<LF>into a Togepi!"
.s1 mtext "The aide's Egg"
.n1 mtext "Take the aide's<LF>Egg."
.s2 mtext "Hatch it"
.n2 mtext "Keep it in your<LF>party and walk."

JournalMission_RocketsSignal:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_EVENT, EVENT_DECIDED_TO_HELP_LANCE
	msteps 3
	mstep MC_EVENT, EVENT_CLEARED_ROCKET_HIDEOUT, .s1, .n1
	mstep MC_EVENT, EVENT_RECEIVED_CARD_KEY, .s2, .n2
	mstep MC_EVENT, EVENT_CLEARED_RADIO_TOWER, .s3, .n3
.title   mtitle "Rocket's Signal"
.desc    mtext "A Rocket signal is<LF>hurting #mon.<LF>Stop it!"
.summary mtext "Team Rocket left<LF>the Radio Tower."
.s1 mtext "Mahogany hideout"
.n1 mtext "Raid the hideout<LF>in Mahogany Town."
.s2 mtext "The Card Key"
.n2 mtext "Find the Card Key<LF>under Goldenrod."
.s3 mtext "Stop Archer"
.n3 mtext "Free the Radio<LF>Tower from Archer."

JournalMission_JanesTrail:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_EVENT, EVENT_BEAT_GRUNTS_RUSTURF
	msteps 5
	mstep MC_EVENT, EVENT_BEAT_GRUNTS_RUSTURF, .s1, .n1
	mstep MC_EVENT, EVENT_BEAT_MAUVILLE_ROCKETS, .s2, .n2
	mstep MC_EVENT, EVENT_BEAT_GRUNTS_ROUTE_121, .s3, .n3
	mstep MC_EVENT, EVENT_BEAT_PYRE_ROCKETS, .s4, .n4
	mstep MC_EVENT, EVENT_BEAT_SHRINE_JANE, .s5, .n5
.title   mtitle "Jane's Trail"
.desc    mtext "Team Rocket's Jane<LF>is up to something<LF>in Hoenn."
.summary mtext "Jane's plans in<LF>Hoenn are over."
.s1 mtext "Rusturf Tunnel"
.n1 mtext "Chase the Rockets<LF>out of Rusturf."
.s2 mtext "Mauville"
.n2 mtext "Check Mauville's<LF>Game Corner."
.s3 mtext "Route 121"
.n3 mtext "Stop the Rockets<LF>on Route 121."
.s4 mtext "Mt.Pyre"
.n4 mtext "Follow them up<LF>Mt.Pyre."
.s5 mtext "Desert Shrine"
.n5 mtext "Find Jane at the<LF>Desert Shrine."

; Legendaries -----------------------------------------------------------------

JournalMission_RedGyarados:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_ENGINE, ENGINE_FLYPOINT_MAHOGANY
	msteps 2
	mstep MC_ENGINE, ENGINE_FLYPOINT_LAKE_OF_RAGE, .s1, .n1
	mstep MC_EVENT, EVENT_LAKE_OF_RAGE_RED_GYARADOS, .s2, .n2
.title   mtitle "Red Gyarados"
.desc    mtext "People say a red<LF>Gyarados rages in<LF>the lake up north."
.summary mtext "You calmed the<LF>Red Gyarados."
.s1 mtext "Lake of Rage"
.n1 mtext "Head north from<LF>Mahogany Town."
.s2 mtext "Red Gyarados"
.n2 mtext "Face the Red<LF>Gyarados."

JournalMission_BellTower:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_EVENT, EVENT_GOT_CLEAR_BELL
	msteps 3
	mstep MC_EVENT, EVENT_GOT_CLEAR_BELL, .s1, .n1
	mstep MC_EVENT, EVENT_GOT_RAINBOW_WING, .s2, .n2
	mstep MC_CAUGHT, HO_OH, .s3, .n3
.title   mtitle "The Bell Tower"
.desc    mtext "Ho-Oh is said to<LF>rest atop the Bell<LF>Tower in Ecruteak."
.summary mtext "Ho-Oh joined you<LF>atop the tower."
.s1 mtext "The Clear Bell"
.n1 mtext "Get the Clear<LF>Bell."
.s2 mtext "The Rainbow Wing"
.n2 mtext "Win the League and<LF>meet the 3 beasts."
.s3 mtext "Ho-Oh"
.n3 mtext "Climb the tower<LF>and catch Ho-Oh."

JournalMission_WhirlIslands:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_EVENT, EVENT_GOT_SILVER_WING
	msteps 2
	mstep MC_EVENT, EVENT_GOT_SILVER_WING, .s1, .n1
	mstep MC_CAUGHT, LUGIA, .s2, .n2
.title   mtitle "Whirl Islands"
.desc    mtext "The Silver Wing<LF>calls to Lugia in<LF>the Whirl Islands."
.summary mtext "Lugia rose from<LF>the depths."
.s1 mtext "The Silver Wing"
.n1 mtext "Get the Silver<LF>Wing."
.s2 mtext "Lugia"
.n2 mtext "Find Lugia in the<LF>Whirl Islands."

JournalMission_LegendaryBirds:
	mission MREGION_KANTO, .title, .desc, .summary
	mstart MC_KANTO_BADGES, 1
	msteps 3
	mstep MC_CAUGHT, ARTICUNO, .s1, .n1
	mstep MC_CAUGHT, ZAPDOS, .s2, .n2
	mstep MC_CAUGHT, MOLTRES, .s3, .n3
.title   mtitle "Legendary Birds"
.desc    mtext "Three legendary<LF>birds nest in<LF>Kanto."
.summary mtext "You caught all<LF>three birds!"
.s1 mtext "Articuno"
.n1 mtext "Search the Seafoam<LF>Islands."
.s2 mtext "Zapdos"
.n2 mtext "Search the Power<LF>Plant."
.s3 mtext "Moltres"
.n3 mtext "Search Cinnabar's<LF>volcano."

JournalMission_Mewtwo:
	mission MREGION_KANTO, .title, .desc, .summary
	mstart MC_EVENT, EVENT_BEAT_INDIGO_LEAGUE
	msteps 1
	mstep MC_CAUGHT, MEWTWO, .s1, .n1
.title   mtitle "Cerulean Cave"
.desc    mtext "Something strong<LF>waits deep inside<LF>Cerulean Cave."
.summary mtext "Mewtwo joined<LF>your team."
.s1 mtext "Mewtwo"
.n1 mtext "Explore the depths<LF>of Cerulean Cave."

JournalMission_RegiTrio:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_HOENN_BADGES, 4
	msteps 3
	mstep MC_CAUGHT, REGICE, .s1, .n1
	mstep MC_CAUGHT, REGISTEEL, .s2, .n2
	mstep MC_CAUGHT, REGIROCK, .s3, .n3
.title   mtitle "The Regi Trio"
.desc    mtext "Ancient writing<LF>seals three lairs<LF>in Hoenn."
.summary mtext "You met all three<LF>Regis!"
.s1 mtext "Regice"
.n1 mtext "Find the lair off<LF>Route 105."
.s2 mtext "Registeel"
.n2 mtext "Find the lair off<LF>Route 120."
.s3 mtext "Regirock"
.n3 mtext "Look under the<LF>Desert Ruin."

JournalMission_WeatherDuo:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_ENGINE, ENGINE_RAINBADGE
	msteps 2
	mstep MC_CAUGHT, KYOGRE, .s1, .n1
	mstep MC_CAUGHT, GROUDON, .s2, .n2
.title   mtitle "Sea and Land"
.desc    mtext "Kyogre and Groudon<LF>sleep deep within<LF>Hoenn."
.summary mtext "You caught Kyogre<LF>and Groudon!"
.s1 mtext "Kyogre"
.n1 mtext "Enter the Cave of<LF>Origin."
.s2 mtext "Groudon"
.n2 mtext "Search the depths<LF>off Fiery Path."

JournalMission_MeteorPeak:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_HOENN_BADGES, 8
	msteps 1
	mstep MC_CAUGHT, RAYQUAZA, .s1, .n1
.title   mtitle "Meteor Peak"
.desc    mtext "Rayquaza rests on<LF>the peak above<LF>Meteor Falls."
.summary mtext "Rayquaza came down<LF>from the peak."
.s1 mtext "Rayquaza"
.n1 mtext "Climb past Meteor<LF>Falls to the peak."

JournalMission_DesertShrine:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_EVENT, EVENT_BEAT_SHRINE_JANE
	msteps 1
	mstep MC_EVENT, EVENT_BEAT_DESERT_SHRINE_UNOWN, .s1, .n1
.title   mtitle "Desert Shrine"
.desc    mtext "The shrine's power<LF>still stirs, deep<LF>inside."
.summary mtext "The shrine is<LF>quiet now."
.s1 mtext "Unown X"
.n1 mtext "Go deeper into the<LF>Desert Shrine."

; Errands ---------------------------------------------------------------------

JournalMission_Parcels:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_EVENT, EVENT_TRAVEL_PROF_CALLED
	msteps 3
	mstep MC_EVENT, EVENT_GOT_TRAVEL_PARCELS, .s1, .n1
	mstep MC_CALL, Journal_OneParcelDelivered, .s2, .n2
	mstep MC_CALL, Journal_TwoParcelsDelivered, .s3, .n2
.title   mtitle "Parcels"
.desc    mtext "Your professor has<LF>parcels for the<LF>other two labs."
.summary mtext "Both parcels were<LF>delivered!"
.s1 mtext "The parcels"
.n1 mtext "Visit your<LF>professor's lab."
.s2 mtext "First parcel"
.s3 mtext "Second parcel"
.n2 mtext "Sail on the S.S.<LF>Aqua to a lab."

JournalMission_FastShip:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_EVENT, EVENT_GOT_TRAVEL_PARCELS
	msteps 3
	mstep MC_EVENT, EVENT_FAST_SHIP_FOUND_GIRL, .s1, .n1
	mstep MC_EVENT, EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA, .s2, .n2
	mstep MC_EVENT, EVENT_FAST_SHIP_FIRST_TIME, .s3, .n3
.title   mtitle "The S.S.Aqua"
.desc    mtext "Your first voyage<LF>on the Fast Ship<LF>S.S.Aqua."
.summary mtext "Your first voyage<LF>is over."
.s1 mtext "A lost girl"
.n1 mtext "Find the lost<LF>granddaughter."
.s2 mtext "Grandpa's thanks"
.n2 mtext "Return to her<LF>grandpa's cabin."
.s3 mtext "Arrival"
.n3 mtext "Rest in your cabin<LF>until you arrive."

; Challenges ------------------------------------------------------------------

MACRO aide_steps
; the early aides' three rewards, shared by all regions
	mstep MC_EVENT, EVENT_GOT_LUCKY_EGG_FROM_DEX_AIDE, JournalAideStep10, JournalAideNext10
	mstep MC_EVENT, EVENT_GOT_ABILITY_CAPSULE_FROM_DEX_AIDE, JournalAideStep25, JournalAideNext25
	mstep MC_EVENT, EVENT_GOT_EVIOLITE_FROM_DEX_AIDE, JournalAideStep40, JournalAideNext40
ENDM

JournalAideStep10: mtext "10 caught"
JournalAideStep25: mtext "25 caught"
JournalAideStep40: mtext "40 caught"
JournalAideNext10: mtext "Show an aide 10<LF>kinds caught."
JournalAideNext25: mtext "Show an aide 25<LF>kinds caught."
JournalAideNext40: mtext "Show an aide 40<LF>kinds caught."
JournalAideSummary: mtext "Every aide here<LF>rewarded you!"

JournalMission_JohtoAides:
	mission MREGION_JOHTO, .title, .desc, JournalAideSummary
	mstart MC_JOHTO_BADGES, 1
	msteps 5
	aide_steps
	mstep MC_EVENT, EVENT_GOT_MUSCLE_BAND_FROM_DEX_AIDE, .s4, .n4
	mstep MC_EVENT, EVENT_GOT_LEFTOVERS_FROM_DEX_AIDE, .s5, .n5
.title   mtitle "Johto Aides"
.desc    mtext "Elm's aides reward<LF>#dex progress.<LF>Route 31 gate."
.s4 mtext "75 caught"
.n4 mtext "Show 75 kinds at<LF>the Route 43 gate."
.s5 mtext "120 caught"
.n5 mtext "Show 120 kinds in<LF>Blackthorn."

JournalMission_KantoAides:
	mission MREGION_KANTO, .title, .desc, JournalAideSummary
	mstart MC_KANTO_BADGES, 1
	msteps 5
	aide_steps
	mstep MC_EVENT, EVENT_GOT_BIG_ROOT_FROM_DEX_AIDE, .s4, .n4
	mstep MC_EVENT, EVENT_GOT_ABILITY_PATCH_FROM_DEX_AIDE, .s5, .n5
.title   mtitle "Kanto Aides"
.desc    mtext "Oak's aides reward<LF>#dex progress.<LF>Route 2 gate."
.s4 mtext "60 caught"
.n4 mtext "Show 60 kinds in<LF>Celadon."
.s5 mtext "100 caught"
.n5 mtext "Show 100 kinds at<LF>Saffron's gate."

JournalMission_HoennAides:
	mission MREGION_HOENN, .title, .desc, JournalAideSummary
	mstart MC_HOENN_BADGES, 1
	msteps 5
	aide_steps
	mstep MC_EVENT, EVENT_GOT_BINDING_BAND_FROM_DEX_AIDE, .s4, .n4
	mstep MC_EVENT, EVENT_GOT_MASTER_BALL_FROM_DEX_AIDE, .s5, .n5
.title   mtitle "Hoenn Aides"
.desc    mtext "Birch's aides<LF>reward progress.<LF>Petalburg Center."
.s4 mtext "90 caught"
.n4 mtext "Show 90 kinds in<LF>Lilycove."
.s5 mtext "150 caught"
.n5 mtext "Show 150 kinds in<LF>Sootopolis."

JournalMission_JohtoHalls:
	mission MREGION_JOHTO, .title, .desc, .summary
	mstart MC_JOHTO_BADGES, 1
	msteps 3
	mstep MC_EVENT, EVENT_FACILITY_INTRO_JOHTO, .s1, .n1
	mstep MC_EVENT, EVENT_FACILITY_HALL_JOHTO, .s2, .n2
	mstep MC_EVENT, EVENT_FACILITY_HARD_JOHTO, .s3, .n3
.title   mtitle "Johto Halls"
.desc    mtext "Test your skills<LF>in Johto's battle<LF>facilities."
.summary mtext "You cleared every<LF>Johto hall!"
.s1 mtext "Earl's Academy"
.n1 mtext "Clear Earl's<LF>Academy, Violet."
.s2 mtext "Goldenrod Hall"
.n2 mtext "Clear Goldenrod's<LF>Challenge Hall."
.s3 mtext "Route 40 Hall"
.n3 mtext "Clear the hall on<LF>Route 40."

JournalMission_KantoHalls:
	mission MREGION_KANTO, .title, .desc, .summary
	mstart MC_KANTO_BADGES, 1
	msteps 3
	mstep MC_EVENT, EVENT_FACILITY_INTRO_KANTO, .s1, .n1
	mstep MC_EVENT, EVENT_FACILITY_HALL_KANTO, .s2, .n2
	mstep MC_EVENT, EVENT_FACILITY_HARD_KANTO, .s3, .n3
.title   mtitle "Kanto Halls"
.desc    mtext "Test your skills<LF>in Kanto's battle<LF>facilities."
.summary mtext "You cleared every<LF>Kanto hall!"
.s1 mtext "Trainer House"
.n1 mtext "Clear the Trainer<LF>House, Viridian."
.s2 mtext "Vermilion Hall"
.n2 mtext "Clear Vermilion's<LF>Challenge Hall."
.s3 mtext "Saffron Hall"
.n3 mtext "Clear Saffron's<LF>Challenge Hall."

JournalMission_HoennHalls:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_HOENN_BADGES, 1
	msteps 3
	mstep MC_EVENT, EVENT_FACILITY_INTRO_HOENN, .s1, .n1
	mstep MC_EVENT, EVENT_FACILITY_HALL_HOENN, .s2, .n2
	mstep MC_EVENT, EVENT_FACILITY_HARD_HOENN, .s3, .n3
.title   mtitle "Hoenn Halls"
.desc    mtext "Test your skills<LF>in Hoenn's battle<LF>facilities."
.summary mtext "You cleared every<LF>Hoenn hall!"
.s1 mtext "Trainer's School"
.n1 mtext "Clear Rustboro's<LF>Trainer's School."
.s2 mtext "Mauville Hall"
.n2 mtext "Clear Mauville's<LF>Challenge Hall."
.s3 mtext "Lilycove Hall"
.n3 mtext "Clear Lilycove's<LF>Challenge Hall."

JournalMission_BattleTower:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_CALL, Journal_TowerOpen
	msteps 2
	mstep MC_TOWER, 7, .s1, .n1
	mstep MC_TOWER, 49, .s2, .n2
.title   mtitle "Battle Tower"
.desc    mtext "The Battle Tower<LF>opened at the<LF>Battle Resort."
.summary mtext "You conquered the<LF>Battle Tower!"
.s1 mtext "7 wins in a row"
.n1 mtext "Win 7 battles in<LF>a row."
.s2 mtext "49 wins in a row"
.n2 mtext "Win 49 battles in<LF>a row."

JournalMission_LeagueRematches:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_CALL, Journal_AnyLeagueBeaten
	msteps 3
	mstep MC_EVENT, EVENT_BEAT_JOHTO_LEAGUE_REMATCH, .s1, .n1
	mstep MC_EVENT, EVENT_BEAT_INDIGO_LEAGUE_REMATCH, .s2, .n2
	mstep MC_EVENT, EVENT_BEAT_HOENN_LEAGUE_REMATCH, .s3, .n3
.title   mtitle "Rematches"
.desc    mtext "The Leagues' best<LF>want a rematch, in<LF>double battles."
.summary mtext "You won every<LF>League rematch!"
.s1 mtext "Johto rematch"
.n1 mtext "Beat Lance's team<LF>in Silver Town."
.s2 mtext "Kanto rematch"
.n2 mtext "Beat the League at<LF>Indigo Plateau."
.s3 mtext "Hoenn rematch"
.n3 mtext "Beat Steven's team<LF>in Ever Grande."

JournalMission_TitleDefense:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_EVENT, EVENT_WORLD_CUP_CHAMPION
	msteps 4
	mstep MC_DEFENSES, 1, .s1, .n1
	mstep MC_DEFENSES, 5, .s2, .n2
	mstep MC_DEFENSES, 10, .s3, .n3
	mstep MC_EVENT, EVENT_TITLE_DEFENSE_BEAT_RED, .s4, .n4
.title   mtitle "Title Defense"
.desc    mtext "Challengers want<LF>your World Cup<LF>title!"
.summary mtext "Even Red couldn't<LF>take your title!"
.s1 mtext "First defense"
.n1 mtext "Accept a challenge<LF>in the lobby."
.s2 mtext "5 defenses"
.n2 mtext "Defend your title<LF>5 times."
.s3 mtext "10 defenses"
.n3 mtext "Defend your title<LF>10 times."
.s4 mtext "Red"
.n4 mtext "Defeat Red, the<LF>final challenger."

; MC_CALL checks: carry if passed ----------------------------------------------

Journal_GotElmStarter:
	ld hl, .flags
	call Journal_CountFlags
	and a
	ret z
	scf
	ret
.flags
	dw EVENT_GOT_CYNDAQUIL_FROM_ELM, EVENT_GOT_TOTODILE_FROM_ELM, EVENT_GOT_CHIKORITA_FROM_ELM, -1

Journal_GotTogepiEgg:
	ld hl, .flags
	call Journal_CountFlags
	and a
	ret z
	scf
	ret
.flags
	dw EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE, EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE, EVENT_GOT_TOGEPI_EGG_FROM_BIRCHS_AIDE, -1

Journal_OneParcelDelivered:
	ld b, 1
	jr Journal_ParcelsDelivered

Journal_TwoParcelsDelivered:
	ld b, 2
Journal_ParcelsDelivered:
	push bc
	ld hl, .flags
	call Journal_CountFlags
	pop bc
	cp b
	ccf
	ret
.flags
	dw EVENT_DELIVERED_ELM_PARCEL, EVENT_DELIVERED_OAK_PARCEL, EVENT_DELIVERED_BIRCH_PARCEL, -1

Journal_TowerOpen:
; all three hard halls cleared
	ld hl, .flags
	call Journal_CountFlags
	cp 3
	ccf
	ret
.flags
	dw EVENT_FACILITY_HARD_JOHTO, EVENT_FACILITY_HARD_KANTO, EVENT_FACILITY_HARD_HOENN, -1

Journal_AnyLeagueBeaten:
	ld hl, .flags
	call Journal_CountFlags
	and a
	ret z
	scf
	ret
.flags
	dw EVENT_BEAT_JOHTO_LEAGUE, EVENT_BEAT_INDIGO_LEAGUE, EVENT_BEAT_HOENN_LEAGUE, -1

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
	dw JournalMission_KantoRockets
	assert_table_length NUM_MISSIONS

JournalOrder:
; the order missions show in the journal's lists
	db MISSION_JOHTO_CHALLENGE
	db MISSION_KANTO_CHALLENGE
	db MISSION_HOENN_CHALLENGE
	db MISSION_WORLD_CUP
	db MISSION_MYSTERY_EGG
	db MISSION_TOGEPI_EGG
	db MISSION_ROCKETS_SIGNAL
	db MISSION_KANTO_ROCKETS
	db MISSION_JANES_TRAIL
	db MISSION_RED_GYARADOS
	db MISSION_BELL_TOWER
	db MISSION_WHIRL_ISLANDS
	db MISSION_LEGENDARY_BIRDS
	db MISSION_MEWTWO
	db MISSION_REGI_TRIO
	db MISSION_WEATHER_DUO
	db MISSION_METEOR_PEAK
	db MISSION_DESERT_SHRINE
	db MISSION_PARCELS
	db MISSION_FAST_SHIP
	db MISSION_JOHTO_AIDES
	db MISSION_KANTO_AIDES
	db MISSION_HOENN_AIDES
	db MISSION_JOHTO_HALLS
	db MISSION_KANTO_HALLS
	db MISSION_HOENN_HALLS
	db MISSION_BATTLE_TOWER
	db MISSION_LEAGUE_REMATCHES
	db MISSION_TITLE_DEFENSE
	db -1
	assert @ - JournalOrder == NUM_MISSIONS + 1, "JournalOrder must list every mission once"

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
.n2 mtext "Go north past the<LF>Lake of Rage."
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
	mstart MC_CALL, Journal_WorldCupOpen
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
.n1 mtext "Sign up at the<LF>Battle Resort."
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
	msteps 4
	mstep MC_EVENT, EVENT_CLEARED_ROCKET_HIDEOUT, .s1, .n1
	mstep MC_EVENT, EVENT_STARTED_RADIO_ROCKETS, .s2, .n2
	mstep MC_EVENT, EVENT_RECEIVED_CARD_KEY, .s3, .n3
	mstep MC_EVENT, EVENT_CLEARED_RADIO_TOWER, .s4, .n4
.title   mtitle "Rocket's Signal"
.desc    mtext "A Rocket signal is<LF>hurting #mon.<LF>Stop it!"
.summary mtext "Team Rocket left<LF>the Radio Tower."
.s1 mtext "Mahogany hideout"
.n1 mtext "Raid the hideout<LF>in Mahogany Town."
.s2 mtext "Rockets return"
.n2 mtext "Earn the Glacier<LF>Badge in Mahogany."
.s3 mtext "The Card Key"
.n3 mtext "Get the Card Key<LF>under Goldenrod."
.s4 mtext "Stop Archer"
.n4 mtext "Free the Radio<LF>Tower from Archer."

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

JournalMission_KantoRockets:
	mission MREGION_KANTO, .title, .desc, .summary
	mstart MC_CALL, Journal_KantoRocketsSeen
	msteps 5
	mstep MC_EVENT, EVENT_BEAT_GRUNTS_MT_MOON, .s1, .n1
	mstep MC_EVENT, EVENT_RETURNED_MACHINE_PART, .s2, .n2
	mstep MC_EVENT, EVENT_SAFFRON_CITY_OPEN, .s3, .n3
	mstep MC_EVENT, EVENT_BEAT_SAFARI_ROCKETS, .s4, .n4
	mstep MC_EVENT, EVENT_FOUND_SILPH_GREEN, .s5, .n5
.title   mtitle "Petra's Plan"
.desc    mtext "Team Rocket is<LF>scheming all over<LF>Kanto."
.summary mtext "Petra's plans in<LF>Kanto are over."
.s1 mtext "Mt.Moon"
.n1 mtext "Stop the Rockets<LF>in Mt.Moon."
.s2 mtext "Machine Part"
.n2 mtext "Find the Power<LF>Plant's lost part."
.s3 mtext "Saffron"
.n3 mtext "Find out what's<LF>wrong in Saffron."
.s4 mtext "Safari Zone"
.n4 mtext "Chase the Rockets<LF>out of the Safari."
.s5 mtext "Silph Co."
.n5 mtext "See Green at<LF>Silph Co."

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
.n2 mtext "Win the League,<LF>own the 3 beasts."
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
.n2 mtext "Find its roost off<LF>Route 10."
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
.n1 mtext "Enter Sootopolis's<LF>Cave of Origin."
.s2 mtext "Groudon"
.n2 mtext "Search the depths<LF>off Fiery Path."

JournalMission_MeteorPeak:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_CALL, Journal_MeteorPeakOpen
	msteps 1
	mstep MC_CAUGHT, RAYQUAZA, .s1, .n1
.title   mtitle "Meteor Peak"
.desc    mtext "Rayquaza rests on<LF>the peak above<LF>Meteor Falls."
.summary mtext "Rayquaza came down<LF>from the peak."
.s1 mtext "Rayquaza"
.n1 mtext "Climb past Meteor<LF>Falls to the peak."

JournalMission_DesertShrine:
	mission MREGION_HOENN, .title, .desc, .summary
	mstart MC_EVENT, EVENT_BEAT_PYRE_ROCKETS
	msteps 4
	mstep MC_EVENT, EVENT_BEAT_SHRINE_JANE, .s1, .n1
	mstep MC_EVENT, EVENT_BEAT_DESERT_SHRINE_UNOWN, .s2, .n2
	mstep MC_CAUGHT, LATIAS, .s3, .n3
	mstep MC_CAUGHT, LATIOS, .s4, .n4
.title   mtitle "Desert Shrine"
.desc    mtext "Jane took Latias<LF>and flew off to<LF>the Desert Shrine."
.summary mtext "The Eon duo joined<LF>you at last!"
.s1 mtext "Jane"
.n1 mtext "Find Jane in the<LF>Desert Shrine."
.s2 mtext "Unown X"
.n2 mtext "Go deeper into the<LF>Desert Shrine."
.s3 mtext "Latias"
.n3 mtext "Something stirs in<LF>Lavaridge Desert."
.s4 mtext "Latios"
.n4 mtext "Something stirs in<LF>Lavaridge Desert."

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
	msteps 2
	mstep MC_EVENT, EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA, .s1, .n1
	mstep MC_EVENT, EVENT_FAST_SHIP_HAS_ARRIVED, .s2, .n2
.title   mtitle "The S.S.Aqua"
.desc    mtext "Your first voyage<LF>on the Fast Ship<LF>S.S.Aqua."
.summary mtext "Your first voyage<LF>is over."
.s1 mtext "A lost girl"
.n1 mtext "A passenger lost<LF>his granddaughter."
.s2 mtext "Arrival"
.n2 mtext "Talk to the sailor<LF>at the exit."

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
	mstep MC_EVENT, EVENT_GOT_WISE_GLASSES_FROM_DEX_AIDE, .s4, .n4
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
.n2 mtext "Beat Agatha's team<LF>at Indigo Plateau."
.s3 mtext "Hoenn rematch"
.n3 mtext "Beat Steven's team<LF>in Ever Grande."

JournalMission_TitleDefense:
	mission MREGION_WORLD, .title, .desc, .summary
	mstart MC_EVENT, EVENT_WORLD_CUP_CHAMPION
	msteps 3
	mstep MC_DEFENSES, 1, .s1, .n1
	mstep MC_CALL, Journal_ChampionsDefended, .s2, .n2
	mstep MC_EVENT, EVENT_TITLE_DEFENSE_BEAT_RED, .s3, .n3
.title   mtitle "Title Defense"
.desc    mtext "Challengers want<LF>your World Cup<LF>title!"
.summary mtext "Even Red couldn't<LF>take your title!"
.s1 mtext "First defense"
.n1 mtext "Accept a challenge<LF>at Battle Resort."
.s2 mtext "Three Champions"
.n2 mtext "Lance, Agatha and<LF>Steven will come."
.s3 mtext "Red"
.n3 mtext "Defeat Red, the<LF>final challenger."

; MC_CALL checks: carry if passed ----------------------------------------------

Journal_WorldCupOpen:
; eligible for the World Cup or already registered
	farcall CheckWorldCupStarted
	ret z
	scf
	ret

Journal_MeteorPeakOpen:
; Rain Badge, or Rayquaza already caught
	ld de, ENGINE_RAINBADGE
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	jr nz, .yes
	ld de, RAYQUAZA
	call CheckCaughtMonIndex
	ld a, c
	and a
	ret z
.yes
	scf
	ret

Journal_ChampionsDefended:
; Lance, Agatha and Steven all beaten in title defenses
	ld hl, .flags
	call Journal_CountFlags
	cp 3
	ccf
	ret

.flags
	dw EVENT_TITLE_DEFENSE_BEAT_LANCE
	dw EVENT_TITLE_DEFENSE_BEAT_AGATHA
	dw EVENT_TITLE_DEFENSE_BEAT_STEVEN
	dw -1

Journal_GotElmStarter:
	ld de, EVENT_START_JOHTO
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret z
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

Journal_KantoRocketsSeen:
; any of the Kanto Rockets' first sightings
	ld hl, .flags
	call Journal_CountFlags
	and a
	ret z
	scf
	ret
.flags
	dw EVENT_BEAT_MOON_GRUNT1, EVENT_BEAT_MOON_GRUNT2, EVENT_BEAT_GRUNTS_MT_MOON
	dw EVENT_MET_MANAGER_AT_POWER_PLANT, EVENT_SAFFRON_CITY_OPEN, -1

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

MACRO boss
; extra bars, flags, aura, phases[, WILDAI_* profile (default WILDAI_BOSS)]
	assert \1 >= 1 && \1 <= BOSS_MAX_EXTRA_BARS, "a boss needs 1 to {d:BOSS_MAX_EXTRA_BARS} extra bars"
	db \1, \2
	dw \3, \4
	if _NARG > 4
		db \5
	else
		db WILDAI_BOSS
	endc
ENDM

MACRO boss_stat
; stat, stages
	assert \2 >= 1 && \2 <= 6, "boss_stat raises 1 to 6 stages"
	db BOSSCMD_STAT, \1, \2
ENDM

MACRO boss_weather
; WEATHER_*, turns (255: until replaced)
	db BOSSCMD_WEATHER, \1, \2
ENDM

MACRO boss_text
	db BOSSCMD_TEXT
	dw \1
ENDM

MACRO boss_end
	db BOSSCMD_END
ENDM

DEF BOSS_WEATHER_TURNS EQU 8

BossRecords:
; indexed by BOSS_* - 1
; BOSS_AUTO_CATCH for the one-time encounters; the others come back (their map
; object has no event flag, or it's cleared after the League) and use balls.
; The last argument picks how it chooses its moves (WILDAI_BOSS if left out).
	table_width BOSS_RECORD_SIZE
	boss 1, BOSS_AUTO_CATCH, RedGyaradosAura, RedGyaradosPhases, WILDAI_FERAL   ; BOSS_RED_GYARADOS
	boss 1, BOSS_AUTO_CATCH, UnownXAura,      UnownXPhases,      WILDAI_CUNNING ; BOSS_UNOWN_X
	boss 1, 0, ArticunoAura,    ArticunoPhases    ; BOSS_ARTICUNO
	boss 1, 0, ZapdosAura,      ZapdosPhases      ; BOSS_ZAPDOS
	boss 1, 0, MoltresAura,     MoltresPhases     ; BOSS_MOLTRES
	boss 1, 0, RegirockAura,    RegirockPhases    ; BOSS_REGIROCK
	boss 1, 0, RegiceAura,      RegicePhases      ; BOSS_REGICE
	boss 1, 0, RegisteelAura,   RegisteelPhases   ; BOSS_REGISTEEL
	boss 2, 0, MewtwoAura,      MewtwoPhases      ; BOSS_MEWTWO
	boss 2, 0, KyogreAura,      KyogrePhases      ; BOSS_KYOGRE
	boss 2, 0, GroudonAura,     GroudonPhases     ; BOSS_GROUDON
	boss 2, 0, RayquazaAura,    RayquazaPhases    ; BOSS_RAYQUAZA
	boss 2, BOSS_AUTO_CATCH, HoOhAura,        HoOhPhases        ; BOSS_HO_OH
	boss 2, BOSS_AUTO_CATCH, LugiaAura,       LugiaPhases       ; BOSS_LUGIA
	boss 1, 0, TDSilverAura,   TDSilverPhases   ; BOSS_TD_SILVER
	boss 1, 0, TDGreenAura,    TDGreenPhases    ; BOSS_TD_GREEN
	boss 1, 0, TDWallyAura,    TDWallyPhases    ; BOSS_TD_WALLY
	boss 1, 0, LanceAura,      LancePhases      ; BOSS_LANCE
	boss 1, 0, AgathaAura,     AgathaPhases     ; BOSS_AGATHA
	boss 1, 0, StevenAura,     StevenPhases     ; BOSS_STEVEN
	boss 1, 0, TDTateLizaAura, TDTateLizaPhases ; BOSS_TD_TATE_LIZA
	boss 1, 0, TDKimonoAura,   TDKimonoPhases   ; BOSS_TD_KIMONO
	boss 1, 0, TDTwinsAura,    TDTwinsPhases    ; BOSS_TD_TWINS
	boss 1, 0, TDAceDuoAura,   TDAceDuoPhases   ; BOSS_TD_ACE_DUO
	boss 2, 0, RedAura,        RedPhases        ; BOSS_RED
	boss 1, 0, ArcherAura,     ArcherPhases     ; BOSS_ARCHER
	boss 1, 0, JaneAura,       JanePhases       ; BOSS_JANE
	boss 2, 0, EnteiAura,       EnteiPhases       ; BOSS_ENTEI
	boss 1, 0, TowerHeadAura,  TowerHeadPhases  ; BOSS_TOWER_HEAD
	boss 2, 0, TDGiovanniAura, TDGiovanniPhases ; BOSS_TD_GIOVANNI
	boss 1, 0, PetraAura,      PetraPhases      ; BOSS_PETRA
	boss 1, BOSS_AUTO_CATCH, PorygonZAura, PorygonZPhases, WILDAI_CUNNING ; BOSS_SILPH_PORYGONZ
	boss 1, 0, TDMarinaAura, TDMarinaPhases ; BOSS_TD_MARINA
	boss 1, 0, TDJessAura, TDJessPhases ; BOSS_TD_JESS
	boss 1, 0, TDRonaldAura, TDRonaldPhases ; BOSS_TD_RONALD
	boss 1, 0, TDKlutchAura, TDKlutchPhases ; BOSS_TD_KLUTCH
	boss 1, 0, TDAmayaAura, TDAmayaPhases ; BOSS_TD_AMAYA
	boss 1, 0, TDDaloricAura, TDDaloricPhases ; BOSS_TD_DALORIC
	boss 1, 0, TDCrystalAura, TDCrystalPhases ; BOSS_TD_CRYSTAL
	boss 1, 0, TDRossolonAura, TDRossolonPhases ; BOSS_TD_ROSSOLON
	boss 1, 0, TDBartoAura, TDBartoPhases ; BOSS_TD_BARTO
	boss 1, 0, TDChaosAura, TDChaosPhases ; BOSS_TD_CHAOS
	boss 1, 0, TDEmmyAura, TDEmmyPhases ; BOSS_TD_EMMY
	boss 1, 0, TDDaveAura, TDDavePhases ; BOSS_TD_DAVE
	boss 1, 0, TDAccadAura, TDAccadPhases ; BOSS_TD_ACCAD
	boss 1, 0, TDJeffAura, TDJeffPhases ; BOSS_TD_JEFF
	boss 1, 0, TDKyleAura, TDKylePhases ; BOSS_TD_KYLE
	boss 1, 0, TDAaronAura, TDAaronPhases ; BOSS_TD_AARON
	assert_table_length NUM_BOSSES - 1

; Phase tables: one entry per extra bar in the record, in break order.

RedGyaradosAura:
	boss_stat ATTACK, 1
	boss_end
RedGyaradosPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_stat DEFENSE, 1
	boss_end

UnownXAura:
	boss_stat SP_ATTACK, 1
	boss_end
UnownXPhases:
	dw .bar1
.bar1
	boss_text BossRuinsText
	boss_stat SP_DEFENSE, 1
	boss_end

ArticunoAura:
	boss_stat SP_DEFENSE, 1
	boss_end
ArticunoPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_HAIL, BOSS_WEATHER_TURNS
	boss_end

ZapdosAura:
	boss_stat DEFENSE, 1
	boss_end
ZapdosPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_end

MoltresAura:
	boss_stat SP_ATTACK, 1
	boss_end
MoltresPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_SUN, BOSS_WEATHER_TURNS
	boss_end

RegirockAura:
	boss_stat DEFENSE, 2
	boss_end
RegirockPhases:
	dw .bar1
.bar1
	boss_stat ATTACK, 2
	boss_end

RegiceAura:
	boss_stat SP_DEFENSE, 2
	boss_end
RegicePhases:
	dw .bar1
.bar1
	boss_stat SP_ATTACK, 2
	boss_end

RegisteelAura:
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end
RegisteelPhases:
	dw .bar1
.bar1
	boss_stat ATTACK, 2
	boss_end

MewtwoAura:
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end
MewtwoPhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_stat DEFENSE, 1
	boss_end

KyogreAura:
	boss_weather WEATHER_RAIN, 255
	boss_stat SP_ATTACK, 1
	boss_end
KyogrePhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_ATTACK, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

GroudonAura:
	boss_weather WEATHER_SUN, 255
	boss_stat ATTACK, 1
	boss_end
GroudonPhases:
	dw .bar1, .bar2
.bar1
	boss_stat ATTACK, 1
	boss_end
.bar2
	boss_stat ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

EnteiAura:
	boss_weather WEATHER_SUN, 255
	boss_stat SP_DEFENSE, 1
	boss_end
EnteiPhases:
	dw .bar1, .bar2
.bar1
	boss_stat ATTACK, 1
	boss_end
.bar2
	boss_stat ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

RayquazaAura:
	boss_weather WEATHER_NONE, 0
	boss_end
RayquazaPhases:
	dw .bar, .bar
.bar
	boss_stat ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

HoOhAura:
	boss_weather WEATHER_SUN, BOSS_WEATHER_TURNS
	boss_stat SP_DEFENSE, 1
	boss_end
HoOhPhases:
	dw .bar1, .bar2
.bar1
	boss_stat ATTACK, 1
	boss_end
.bar2
	boss_stat ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

LugiaAura:
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end
LugiaPhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_DEFENSE, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

BossRuinsText:
	text "The ruins' power"
	line "surges through it!"
	prompt

; Trainers' bosses: the aura runs each time the boss comes in; a bar break
; brings the trainer's line and the phase.

TDSilverAura:
	boss_stat ATTACK, 1
	boss_end
TDSilverPhases:
	dw .bar1
.bar1
	boss_text BossSilverText
	boss_stat ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

TDGreenAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDGreenPhases:
	dw .bar1
.bar1
	boss_text BossGreenText
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_stat SP_DEFENSE, 1
	boss_end

TDWallyAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDWallyPhases:
	dw .bar1
.bar1
	boss_text BossWallyText
	boss_stat SP_ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

LanceAura:
	boss_stat ATTACK, 1
	boss_end
LancePhases:
	dw .bar1
.bar1
	boss_text BossLanceText
	boss_stat SP_DEFENSE, 1
	boss_stat DEFENSE, 1
	boss_end

AgathaAura:
	boss_stat SP_ATTACK, 1
	boss_end
AgathaPhases:
	dw .bar1
.bar1
	boss_text BossAgathaText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

StevenAura:
	boss_stat DEFENSE, 1
	boss_end
StevenPhases:
	dw .bar1
.bar1
	boss_text BossStevenText
	boss_stat ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDTateLizaAura:
	boss_stat SP_DEFENSE, 1
	boss_end
TDTateLizaPhases:
	dw .bar1
.bar1
	boss_text BossTateLizaText
	boss_stat SP_ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

TDKimonoAura:
	boss_stat SP_DEFENSE, 1
	boss_end
TDKimonoPhases:
	dw .bar1
.bar1
	boss_text BossKimonoText
	boss_stat SP_ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

TDTwinsAura:
	boss_stat DEFENSE, 1
	boss_end
TDTwinsPhases:
	dw .bar1
.bar1
	boss_text BossTwinsText
	boss_stat ATTACK, 2
	boss_end

TDAceDuoAura:
	boss_stat ATTACK, 1
	boss_end
TDAceDuoPhases:
	dw .bar1
.bar1
	boss_text BossAceDuoText
	boss_weather WEATHER_SANDSTORM, BOSS_WEATHER_TURNS
	boss_stat DEFENSE, 1
	boss_end

RedAura:
	boss_stat DEFENSE, 1
	boss_end
RedPhases:
	dw .bar1, .bar2
.bar1
	boss_text BossRedText
	boss_stat ATTACK, 1
	boss_stat SP_ATTACK, 1
	boss_end
.bar2
	boss_text BossRedText2
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_stat SP_DEFENSE, 1
	boss_stat ATTACK, 1
	boss_stat SP_ATTACK, 1
	boss_end

TDGiovanniAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDGiovanniPhases:
	dw .bar1, .bar2
.bar1
	boss_text BossGiovanniText
	boss_stat SP_DEFENSE, 1
	boss_end
.bar2
	boss_text BossGiovanniText2
	boss_stat DEFENSE, 1
	boss_stat SP_ATTACK, 1
	boss_end

ArcherAura:
	boss_stat SP_ATTACK, 1
	boss_end
ArcherPhases:
	dw .bar1
.bar1
	boss_text BossArcherText
	boss_weather WEATHER_SUN, BOSS_WEATHER_TURNS
	boss_stat DEFENSE, 1
	boss_end

TowerHeadAura:
	boss_stat SP_DEFENSE, 1
	boss_end
TowerHeadPhases:
	dw .bar1
.bar1
	boss_text BossTowerHeadText
	boss_stat SP_ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

PetraAura:
	boss_stat ATTACK, 1
	boss_end
PetraPhases:
	dw .bar1
.bar1
	boss_text BossPetraText
	boss_stat ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

PorygonZAura:
	boss_stat SP_ATTACK, 1
	boss_end
PorygonZPhases:
	dw .bar1
.bar1
	boss_text BossPorygonZText
	boss_stat DEFENSE, 1
	boss_end

TDMarinaAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDMarinaPhases:
	dw .bar1
.bar1
	boss_text BossTDMarinaText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDJessAura:
	boss_stat ATTACK, 1
	boss_end
TDJessPhases:
	dw .bar1
.bar1
	boss_text BossTDJessText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDRonaldAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDRonaldPhases:
	dw .bar1
.bar1
	boss_text BossTDRonaldText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDKlutchAura:
	boss_stat ATTACK, 1
	boss_end
TDKlutchPhases:
	dw .bar1
.bar1
	boss_text BossTDKlutchText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDAmayaAura:
	boss_stat ATTACK, 1
	boss_end
TDAmayaPhases:
	dw .bar1
.bar1
	boss_text BossTDAmayaText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDDaloricAura:
	boss_stat ATTACK, 1
	boss_end
TDDaloricPhases:
	dw .bar1
.bar1
	boss_text BossTDDaloricText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDCrystalAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDCrystalPhases:
	dw .bar1
.bar1
	boss_text BossTDCrystalText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDRossolonAura:
	boss_stat ATTACK, 1
	boss_end
TDRossolonPhases:
	dw .bar1
.bar1
	boss_text BossTDRossolonText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDBartoAura:
	boss_stat DEFENSE, 1
	boss_end
TDBartoPhases:
	dw .bar1
.bar1
	boss_text BossTDBartoText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDChaosAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDChaosPhases:
	dw .bar1
.bar1
	boss_text BossTDChaosText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDEmmyAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDEmmyPhases:
	dw .bar1
.bar1
	boss_text BossTDEmmyText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDDaveAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDDavePhases:
	dw .bar1
.bar1
	boss_text BossTDDaveText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDAccadAura:
	boss_stat ATTACK, 1
	boss_end
TDAccadPhases:
	dw .bar1
.bar1
	boss_text BossTDAccadText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDJeffAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDJeffPhases:
	dw .bar1
.bar1
	boss_text BossTDJeffText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDKyleAura:
	boss_stat ATTACK, 1
	boss_end
TDKylePhases:
	dw .bar1
.bar1
	boss_text BossTDKyleText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

TDAaronAura:
	boss_stat SP_ATTACK, 1
	boss_end
TDAaronPhases:
	dw .bar1
.bar1
	boss_text BossTDAaronText
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end

JaneAura:
	boss_stat SP_DEFENSE, 1
	boss_end
JanePhases:
	dw .bar1
.bar1
	boss_text BossJaneText
	boss_stat SP_ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

BossSilverText:
	text "Silver: Get up!"
	line "We're not done!"
	prompt

BossGreenText:
	text "Green: Show 'em"
	line "what we've got!"
	prompt

BossWallyText:
	text "Wally: Gardevoir,"
	line "together!"
	prompt

BossLanceText:
	text "Lance: Dragonite,"
	line "rise!"
	prompt

BossAgathaText:
	text "Agatha: Hehehe…"
	line "Not yet, dearie!"
	prompt

BossStevenText:
	text "Steven: Metagross,"
	line "stand firm!"
	prompt

BossTateLizaText:
	text "Tate: Now, Liza!"
	line "Liza: Together!"
	prompt

BossKimonoText:
	text "Zuki: Keep"
	line "dancing, Sylveon!"
	prompt

BossTwinsText:
	text "Amy & May: Don't"
	line "give up, Ledian!"
	prompt

BossAceDuoText:
	text "Rin: Tyranitar,"
	line "shake the arena!"
	prompt

BossRedText:
	text "Red: …!"
	prompt

BossRedText2:
	text "Red: ……!!"
	prompt

BossGiovanniText:
	text "Giovanni: Show"
	line "them, Mewtwo."
	prompt

BossGiovanniText2:
	text "Giovanni: This"
	line "power answers to"
	cont "no one but me!"
	prompt

BossArcherText:
	text "Archer: Team"
	line "Rocket never"
	cont "yields!"
	prompt

BossTowerHeadText:
	text "Aaron: Mew isn't"
	line "done playing yet!"
	prompt

BossPetraText:
	text "Petra: Absol, cut"
	line "them down!"
	prompt

BossPorygonZText:
	text "Porygon-Z rewrote"
	line "its own code!"
	prompt

BossTDMarinaText:
	text "Marina: Froslass,"
	line "freeze them solid!"
	prompt

BossTDJessText:
	text "Jess: Annihilape,"
	line "show them your"
	cont "rage!"
	prompt

BossTDRonaldText:
	text "Ronald: Ninetales,"
	line "let it snow!"
	prompt

BossTDKlutchText:
	text "Klutch: Gyarados,"
	line "rampage!"
	prompt

BossTDAmayaText:
	text "Amaya: Metagross,"
	line "crush them!"
	prompt

BossTDDaloricText:
	text "Daloric:"
	line "Tyranitar, stand"
	cont "your ground!"
	prompt

BossTDCrystalText:
	text "Crystal: Noctowl,"
	line "the night is ours!"
	prompt

BossTDRossolonText:
	text "Rossolon:"
	line "Salamence, take to"
	cont "the skies!"
	prompt

BossTDBartoText:
	text "Barto: Azumarill,"
	line "drum it up!"
	prompt

BossTDChaosText:
	text "Chaos: Mars, burn"
	line "it all!"
	prompt

BossTDEmmyText:
	text "Emmy: Gardevoir,"
	line "shine bright!"
	prompt

BossTDDaveText:
	text "Dave: Alakazam,"
	line "see the future!"
	prompt

BossTDAccadText:
	text "Accad: Kingler,"
	line "ride the storm!"
	prompt

BossTDJeffText:
	text "Jeff: Akueria,"
	line "make a splash!"
	prompt

BossTDKyleText:
	text "Kyle: Snorlax,"
	line "wake up and win!"
	prompt

BossTDAaronText:
	text "Aaron: Ironbundle,"
	line "give them the cold"
	cont "shoulder!"
	prompt

BossJaneText:
	text "Jane: Latias!"
	line "The desert is"
	cont "ours!"
	prompt

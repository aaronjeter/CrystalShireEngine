SECTION "Evolutions and Attacks 1", ROMX

EvosAttacksPointers1::
	dw BulbasaurEvosAttacks
	dw IvysaurEvosAttacks
	dw VenusaurEvosAttacks
	dw CharmanderEvosAttacks
	dw CharmeleonEvosAttacks
	dw CharizardEvosAttacks
	dw SquirtleEvosAttacks
	dw WartortleEvosAttacks
	dw BlastoiseEvosAttacks
	dw CaterpieEvosAttacks
	dw MetapodEvosAttacks
	dw ButterfreeEvosAttacks
	dw WeedleEvosAttacks
	dw KakunaEvosAttacks
	dw BeedrillEvosAttacks
	dw PidgeyEvosAttacks
	dw PidgeottoEvosAttacks
	dw PidgeotEvosAttacks
	dw RattataEvosAttacks
	dw RaticateEvosAttacks
	dw SpearowEvosAttacks
	dw FearowEvosAttacks
	dw EkansEvosAttacks
	dw ArbokEvosAttacks
	dw PikachuEvosAttacks
	dw RaichuEvosAttacks
	dw SandshrewEvosAttacks
	dw SandslashEvosAttacks
	dw NidoranFEvosAttacks
	dw NidorinaEvosAttacks
	dw NidoqueenEvosAttacks
	dw NidoranMEvosAttacks
	dw NidorinoEvosAttacks
	dw NidokingEvosAttacks
	dw ClefairyEvosAttacks
	dw ClefableEvosAttacks
	dw VulpixEvosAttacks
	dw NinetalesEvosAttacks
	dw JigglypuffEvosAttacks
	dw WigglytuffEvosAttacks
	dw ZubatEvosAttacks
	dw GolbatEvosAttacks
	dw OddishEvosAttacks
	dw GloomEvosAttacks
	dw VileplumeEvosAttacks
	dw ParasEvosAttacks
	dw ParasectEvosAttacks
	dw VenonatEvosAttacks
	dw VenomothEvosAttacks
	dw DiglettEvosAttacks
	dw DugtrioEvosAttacks
	dw MeowthEvosAttacks
	dw PersianEvosAttacks
	dw PsyduckEvosAttacks
	dw GolduckEvosAttacks
	dw MankeyEvosAttacks
	dw PrimeapeEvosAttacks
	dw GrowlitheEvosAttacks
	dw ArcanineEvosAttacks
	dw PoliwagEvosAttacks
	dw PoliwhirlEvosAttacks
	dw PoliwrathEvosAttacks
	dw AbraEvosAttacks
	dw KadabraEvosAttacks
	dw AlakazamEvosAttacks
	dw MachopEvosAttacks
	dw MachokeEvosAttacks
	dw MachampEvosAttacks
	dw BellsproutEvosAttacks
	dw WeepinbellEvosAttacks
	dw VictreebelEvosAttacks
	dw TentacoolEvosAttacks
	dw TentacruelEvosAttacks
	dw GeodudeEvosAttacks
	dw GravelerEvosAttacks
	dw GolemEvosAttacks
	dw PonytaEvosAttacks
	dw RapidashEvosAttacks
	dw SlowpokeEvosAttacks
	dw SlowbroEvosAttacks
	dw MagnemiteEvosAttacks
	dw MagnetonEvosAttacks
	dw FarfetchDEvosAttacks
	dw DoduoEvosAttacks
	dw DodrioEvosAttacks
	dw SeelEvosAttacks
	dw DewgongEvosAttacks
	dw GrimerEvosAttacks
	dw MukEvosAttacks
	dw ShellderEvosAttacks
	dw CloysterEvosAttacks
	dw GastlyEvosAttacks
	dw HaunterEvosAttacks
	dw GengarEvosAttacks
	dw OnixEvosAttacks
	dw DrowzeeEvosAttacks
	dw HypnoEvosAttacks
	dw KrabbyEvosAttacks
	dw KinglerEvosAttacks
	dw VoltorbEvosAttacks
	dw ElectrodeEvosAttacks
	dw ExeggcuteEvosAttacks
	dw ExeggutorEvosAttacks
	dw CuboneEvosAttacks
	dw MarowakEvosAttacks
	dw HitmonleeEvosAttacks
	dw HitmonchanEvosAttacks
	dw LickitungEvosAttacks
	dw KoffingEvosAttacks
	dw WeezingEvosAttacks
	dw RhyhornEvosAttacks
	dw RhydonEvosAttacks
	dw ChanseyEvosAttacks
	dw TangelaEvosAttacks
	dw KangaskhanEvosAttacks
	dw HorseaEvosAttacks
	dw SeadraEvosAttacks
	dw GoldeenEvosAttacks
	dw SeakingEvosAttacks
	dw StaryuEvosAttacks
	dw StarmieEvosAttacks
	dw MrMimeEvosAttacks
	dw ScytherEvosAttacks
	dw JynxEvosAttacks
	dw ElectabuzzEvosAttacks
	dw MagmarEvosAttacks
	dw PinsirEvosAttacks
	dw TaurosEvosAttacks
	dw MagikarpEvosAttacks
	dw GyaradosEvosAttacks
	dw LaprasEvosAttacks
	dw DittoEvosAttacks
	dw EeveeEvosAttacks
	dw VaporeonEvosAttacks
	dw JolteonEvosAttacks
	dw FlareonEvosAttacks
	dw PorygonEvosAttacks
	dw OmanyteEvosAttacks
	dw OmastarEvosAttacks
	dw KabutoEvosAttacks
	dw KabutopsEvosAttacks
	dw AerodactylEvosAttacks
	dw SnorlaxEvosAttacks
	dw ArticunoEvosAttacks
	dw ZapdosEvosAttacks
	dw MoltresEvosAttacks
	dw DratiniEvosAttacks
	dw DragonairEvosAttacks
	dw DragoniteEvosAttacks
	dw MewtwoEvosAttacks
	dw MewEvosAttacks
.IndirectEnd::

BulbasaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, LEECH_SEED
	dbw 7, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 13, ACID_SPRAY
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, GROWTH
	dbw 30, SAFEGUARD
	dbw 32, VENOSHOCK
	dbw 35, AMNESIA
	dbw 38, WEATHER_BALL
	dbw 41, GIGA_DRAIN
	dbw 44, LEAF_BLADE
	dbw 47, SLUDGE_WAVE
	dbw 50, INGRAIN
	dbw 53, BULK_UP
	dbw 56, SOLARBEAM
	dbw 58, TOXIC
	dbw 60, STRENGTH_SAP
	dbw 64, PETAL_DANCE
	dbw 68, EARTHPOWER
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, LEECH_SEED
	dbw 7, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 13, ACID_SPRAY
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, GROWTH
	dbw 30, SAFEGUARD
	dbw 32, VENOSHOCK
	dbw 35, AMNESIA
	dbw 38, WEATHER_BALL
	dbw 41, GIGA_DRAIN
	dbw 44, LEAF_BLADE
	dbw 47, SLUDGE_WAVE
	dbw 50, INGRAIN
	dbw 53, BULK_UP
	dbw 56, SOLARBEAM
	dbw 58, TOXIC
	dbw 60, STRENGTH_SAP
	dbw 64, PETAL_DANCE
	dbw 68, EARTHPOWER
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, VENUSAURX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, LEECH_SEED
	dbw 7, VINE_WHIP
	dbw 10, POISONPOWDER
	dbw 13, ACID_SPRAY
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF
	dbw 28, GROWTH
	dbw 30, SAFEGUARD
	dbw 32, VENOSHOCK
	dbw 35, AMNESIA
	dbw 38, WEATHER_BALL
	dbw 41, GIGA_DRAIN
	dbw 44, LEAF_BLADE
	dbw 47, SLUDGE_WAVE
	dbw 50, INGRAIN
	dbw 53, BULK_UP
	dbw 56, SOLARBEAM
	dbw 58, TOXIC
	dbw 60, STRENGTH_SAP
	dbw 64, PETAL_DANCE
	dbw 68, EARTHPOWER
	dbw 72, FRENZY_PLANT
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, METAL_CLAW
	dbw 13, SCARY_FACE
	dbw 16, FLAME_CHARGE
	dbw 20, DRAGON_RAGE
	dbw 22, FIRE_FANG
	dbw 25, FIRE_SPIN
	dbw 28, BREAKING_SWIPE
	dbw 31, AIR_CUTTER
	dbw 34, ACROBATICS
	dbw 37, MYSTICAL_FIRE
	dbw 40, FLAMETHROWER
	dbw 43, DRAGONBREATH
	dbw 46, DRAGON_CLAW
	dbw 49, DRAGON_DANCE
	dbw 52, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 58, HEAT_CRASH
	dbw 61, FIRE_BLAST
	dbw 64, OUTRAGE
	dbw 68, HURRICANE
	dbw 72, HEAT_WAVE
	dbw 76, BLAST_BURN
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, METAL_CLAW
	dbw 13, SCARY_FACE
	dbw 16, FLAME_CHARGE
	dbw 20, DRAGON_RAGE
	dbw 22, FIRE_FANG
	dbw 25, FIRE_SPIN
	dbw 28, BREAKING_SWIPE
	dbw 31, AIR_CUTTER
	dbw 34, ACROBATICS
	dbw 37, MYSTICAL_FIRE
	dbw 40, FLAMETHROWER
	dbw 43, DRAGONBREATH
	dbw 46, DRAGON_CLAW
	dbw 49, DRAGON_DANCE
	dbw 52, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 58, HEAT_CRASH
	dbw 61, FIRE_BLAST
	dbw 64, OUTRAGE
	dbw 68, HURRICANE
	dbw 72, HEAT_WAVE
	dbw 76, BLAST_BURN
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, CHARIZARDX
	dbww EVOLVE_ITEM, KANTOITE_Y, CHARIZARDY
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, EMBER
	dbw 7, SMOKESCREEN
	dbw 10, METAL_CLAW
	dbw 13, SCARY_FACE
	dbw 16, FLAME_CHARGE
	dbw 20, DRAGON_RAGE
	dbw 22, FIRE_FANG
	dbw 25, FIRE_SPIN
	dbw 28, BREAKING_SWIPE
	dbw 31, AIR_CUTTER
	dbw 34, ACROBATICS
	dbw 37, MYSTICAL_FIRE
	dbw 40, FLAMETHROWER
	dbw 43, DRAGONBREATH
	dbw 46, DRAGON_CLAW
	dbw 49, DRAGON_DANCE
	dbw 52, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 58, HEAT_CRASH
	dbw 61, FIRE_BLAST
	dbw 64, OUTRAGE
	dbw 68, HURRICANE
	dbw 72, HEAT_WAVE
	dbw 76, BLAST_BURN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, BUBBLE
	dbw 7, WITHDRAW
	dbw 10, WATER_GUN
	dbw 13, BITE
	dbw 16, RAPID_SPIN
	dbw 19, PROTECT
	dbw 22, BUBBLEBEAM
	dbw 25, YAWN
	dbw 28, GYRO_BALL
	dbw 31, ICE_FANG
	dbw 34, RAIN_DANCE
	dbw 37, AQUA_TAIL
	dbw 40, FLASHCANNON
	dbw 43, MIST_BALL
	dbw 46, HAZE
	dbw 48, REST
	dbw 50, BODY_PRESS
	dbw 53, AQUA_RING
	dbw 56, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 64, HEAVY_SLAM
	dbw 68, AURA_SPHERE
	dbw 72, HYDRO_CANNON
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, BUBBLE
	dbw 7, WITHDRAW
	dbw 10, WATER_GUN
	dbw 13, BITE
	dbw 16, RAPID_SPIN
	dbw 19, PROTECT
	dbw 22, BUBBLEBEAM
	dbw 25, YAWN
	dbw 28, GYRO_BALL
	dbw 31, ICE_FANG
	dbw 34, RAIN_DANCE
	dbw 37, AQUA_TAIL
	dbw 40, FLASHCANNON
	dbw 43, MIST_BALL
	dbw 46, HAZE
	dbw 48, REST
	dbw 50, BODY_PRESS
	dbw 53, AQUA_RING
	dbw 56, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 64, HEAVY_SLAM
	dbw 68, AURA_SPHERE
	dbw 72, HYDRO_CANNON
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, BLASTOISEX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, BUBBLE
	dbw 7, WITHDRAW
	dbw 10, WATER_GUN
	dbw 13, BITE
	dbw 16, RAPID_SPIN
	dbw 19, PROTECT
	dbw 22, BUBBLEBEAM
	dbw 25, YAWN
	dbw 28, GYRO_BALL
	dbw 31, ICE_FANG
	dbw 34, RAIN_DANCE
	dbw 37, AQUA_TAIL
	dbw 40, FLASHCANNON
	dbw 43, MIST_BALL
	dbw 46, HAZE
	dbw 48, REST
	dbw 50, BODY_PRESS
	dbw 53, AQUA_RING
	dbw 56, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 64, HEAVY_SLAM
	dbw 68, AURA_SPHERE
	dbw 72, HYDRO_CANNON
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, BUTTERFREEX
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, STRING_SHOT
	dbw 1, CONFUSION
	dbw 10, PIXIE_DUST
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, SLEEP_POWDER
	dbw 18, SUPERSONIC
	dbw 21, PSYBEAM
	dbw 24, FAE_VOICE
	dbw 26, WHIRLWIND
	dbw 28, SILVER_WIND
	dbw 31, YAWN
	dbw 34, VENOSHOCK
	dbw 36, CALM_MIND
	dbw 38, SAFEGUARD
	dbw 40, SIGNAL_BEAM
	dbw 43, MOONBLAST
	dbw 46, LIGHT_SCREEN
	dbw 49, EXTRASENSORY
	dbw 52, MOONLIGHT
	dbw 56, GIGA_DRAIN
	dbw 60, LUSTER_PURGE
	dbw 65, BATON_PASS
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, BEEDRILLX
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, POISON_STING
	dbw 10, FURY_ATTACK
	dbw 13, QUICK_ATTACK
	dbw 16, TWINEEDLE
	dbw 19, FOCUS_ENERGY
	dbw 22, PURSUIT
	dbw 25, KNOCK_OFF
	dbw 28, ACROBATICS
	dbw 31, U_TURN
	dbw 34, POISON_JAB
	dbw 37, SWORDS_DANCE
	dbw 40, NIGHT_SLASH
	dbw 43, SUCKER_PUNCH
	dbw 46, COUP_DE_GRACE
	dbw 49, DRAGON_DANCE
	dbw 52, TOXIC
	dbw 55, BRICK_BREAK
	dbw 58, DOUBLE_EDGE
	dbw 61, MEGAHORN
	dbw 65, EXTREMESPEED
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 5, GUST
	dbw 9, QUICK_ATTACK
	dbw 13, TWISTER
	dbw 16, WHIRLWIND
	dbw 19, WING_ATTACK
	dbw 22, AERIAL_ACE
	dbw 25, RAZOR_WIND
	dbw 28, AGILITY
	dbw 30, TAUNT
	dbw 32, STEEL_WING
	dbw 34, HYPER_VOICE
	dbw 37, MIRROR_MOVE
	dbw 40, ACROBATICS
	dbw 43, DRAGONBREATH
	dbw 46, EXTREMESPEED
	dbw 49, U_TURN
	dbw 52, BULK_UP
	dbw 55, DRILL_PECK
	dbw 60, HURRICANE
	dbw 65, SKY_ATTACK
	dbw 70, HEAT_WAVE
	dbw 75, UPROAR
	dbw 80, AEROBLAST
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 5, GUST
	dbw 9, QUICK_ATTACK
	dbw 13, TWISTER
	dbw 16, WHIRLWIND
	dbw 19, WING_ATTACK
	dbw 22, AERIAL_ACE
	dbw 25, RAZOR_WIND
	dbw 28, AGILITY
	dbw 30, TAUNT
	dbw 32, STEEL_WING
	dbw 34, HYPER_VOICE
	dbw 37, MIRROR_MOVE
	dbw 40, ACROBATICS
	dbw 43, DRAGONBREATH
	dbw 46, EXTREMESPEED
	dbw 49, U_TURN
	dbw 52, BULK_UP
	dbw 55, DRILL_PECK
	dbw 60, HURRICANE
	dbw 65, SKY_ATTACK
	dbw 70, HEAT_WAVE
	dbw 75, UPROAR
	dbw 80, AEROBLAST
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, PIDGEOTX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 5, GUST
	dbw 9, QUICK_ATTACK
	dbw 13, TWISTER
	dbw 16, WHIRLWIND
	dbw 19, WING_ATTACK
	dbw 22, AERIAL_ACE
	dbw 25, RAZOR_WIND
	dbw 28, AGILITY
	dbw 30, TAUNT
	dbw 32, STEEL_WING
	dbw 34, HYPER_VOICE
	dbw 37, MIRROR_MOVE
	dbw 40, ACROBATICS
	dbw 43, DRAGONBREATH
	dbw 46, EXTREMESPEED
	dbw 49, U_TURN
	dbw 52, BULK_UP
	dbw 55, DRILL_PECK
	dbw 60, HURRICANE
	dbw 65, SKY_ATTACK
	dbw 70, HEAT_WAVE
	dbw 75, UPROAR
	dbw 80, AEROBLAST
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	dbw 13, SCARY_FACE
	dbw 16, PURSUIT
	dbw 22, HYPER_FANG
	dbw 25, FACADE
	dbw 28, SUCKER_PUNCH
	dbw 31, POISON_FANG
	dbw 34, FIRE_FANG
	dbw 36, ICE_FANG
	dbw 38, THUNDER_FANG
	dbw 41, CRUNCH
	dbw 44, SUPER_FANG
	dbw 47, SWORDS_DANCE
	dbw 50, EXTREMESPEED
	dbw 54, KNOCK_OFF
	dbw 58, FLAIL
	dbw 62, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	dbw 13, SCARY_FACE
	dbw 16, PURSUIT
	dbw 22, HYPER_FANG
	dbw 25, FACADE
	dbw 28, SUCKER_PUNCH
	dbw 31, POISON_FANG
	dbw 34, FIRE_FANG
	dbw 36, ICE_FANG
	dbw 38, THUNDER_FANG
	dbw 41, CRUNCH
	dbw 44, SUPER_FANG
	dbw 47, SWORDS_DANCE
	dbw 50, EXTREMESPEED
	dbw 54, KNOCK_OFF
	dbw 58, FLAIL
	dbw 62, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	dbw 8, FURY_ATTACK
	dbw 10, QUICK_ATTACK
	dbw 12, BITE
	dbw 15, FOCUS_ENERGY
	dbw 18, AERIAL_ACE
	dbw 21, PURSUIT
	dbw 24, WING_ATTACK
	dbw 27, AGILITY
	dbw 30, FAINT_ATTACK
	dbw 33, SLASH
	dbw 35, ACROBATICS
	dbw 37, MIRROR_MOVE
	dbw 39, DRILL_PECK
	dbw 42, TAUNT
	dbw 45, NIGHT_SLASH
	dbw 48, DRAGON_DANCE
	dbw 50, FACADE
	dbw 52, DOUBLE_EDGE
	dbw 56, WHIRLWIND
	dbw 60, SKY_ATTACK
	dbw 70, AEROBLAST
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	dbw 8, FURY_ATTACK
	dbw 10, QUICK_ATTACK
	dbw 12, BITE
	dbw 15, FOCUS_ENERGY
	dbw 18, AERIAL_ACE
	dbw 21, PURSUIT
	dbw 24, WING_ATTACK
	dbw 27, AGILITY
	dbw 30, FAINT_ATTACK
	dbw 33, SLASH
	dbw 35, ACROBATICS
	dbw 37, MIRROR_MOVE
	dbw 39, DRILL_PECK
	dbw 42, TAUNT
	dbw 45, NIGHT_SLASH
	dbw 48, DRAGON_DANCE
	dbw 50, FACADE
	dbw 52, DOUBLE_EDGE
	dbw 56, WHIRLWIND
	dbw 60, SKY_ATTACK
	dbw 70, AEROBLAST
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, POISON_STING
	dbw 8, BITE
	dbw 12, ACID
	dbw 15, GLARE
	dbw 19, PURSUIT
	dbw 22, POISON_FANG
	dbw 25, FAINT_ATTACK
	dbw 28, SCREECH
	dbw 31, BULLDOZE
	dbw 34, SUCKER_PUNCH
	dbw 37, KNOCK_OFF
	dbw 40, CRUNCH
	dbw 43, POISON_JAB
	dbw 46, DRAGON_DANCE
	dbw 49, ICE_FANG
	dbw 52, THUNDER_FANG
	dbw 55, HAZE
	dbw 58, AQUA_TAIL
	dbw 62, EXTREMESPEED
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, POISON_STING
	dbw 8, BITE
	dbw 12, ACID
	dbw 15, GLARE
	dbw 19, PURSUIT
	dbw 22, POISON_FANG
	dbw 25, FAINT_ATTACK
	dbw 28, SCREECH
	dbw 31, BULLDOZE
	dbw 34, SUCKER_PUNCH
	dbw 37, KNOCK_OFF
	dbw 40, CRUNCH
	dbw 43, POISON_JAB
	dbw 46, DRAGON_DANCE
	dbw 49, ICE_FANG
	dbw 52, THUNDER_FANG
	dbw 55, HAZE
	dbw 58, AQUA_TAIL
	dbw 62, EXTREMESPEED
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, RAICHU
	dbww EVOLVE_ITEM, WATER_STONE, ARAICHU
	dbbw EVOLVE_LEVEL, 36, RAICHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, THUNDER_WAVE
	dbw 13, SWEET_KISS
	dbw 16, DOUBLE_TEAM
	dbw 19, CHARGE_BEAM
	dbw 22, SPARK
	dbw 25, CHARM
	dbw 28, ELECTRO_BALL
	dbw 30, GROWTH
	dbw 32, AGILITY
	dbw 35, VOLT_SWITCH
	dbw 38, DISCHARGE
	dbw 41, THUNDERBOLT
	dbw 44, LIGHT_SCREEN
	dbw 47, FAERIEGLEAM
	dbw 50, MEDITATE
	dbw 53, GRASS_KNOT
	dbw 56, KNOCK_OFF
	dbw 60, THUNDER
	dbw 64, RAIN_DANCE
	dbw 68, SURF
	dbw 72, VOLT_TACKLE
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, ARAICHU
	dbww EVOLVE_ITEM, DRAGON_FANG, GOROCHU
	dbww EVOLVE_ITEM, DRAGON_SCALE, GOROCHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, THUNDER_WAVE
	dbw 13, SWEET_KISS
	dbw 16, DOUBLE_TEAM
	dbw 19, CHARGE_BEAM
	dbw 22, SPARK
	dbw 25, CHARM
	dbw 28, ELECTRO_BALL
	dbw 30, GROWTH
	dbw 32, AGILITY
	dbw 35, VOLT_SWITCH
	dbw 38, DISCHARGE
	dbw 41, THUNDERBOLT
	dbw 44, LIGHT_SCREEN
	dbw 47, FAERIEGLEAM
	dbw 50, MEDITATE
	dbw 53, GRASS_KNOT
	dbw 56, KNOCK_OFF
	dbw 60, THUNDER
	dbw 64, RAIN_DANCE
	dbw 68, SURF
	dbw 72, VOLT_TACKLE
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, METAL_CLAW
	dbw 10, POISON_STING
	dbw 13, ROLLOUT
	dbw 16, RAPID_SPIN
	dbw 19, BULLDOZE
	dbw 22, ROCK_TOMB
	dbw 25, CRUSH_CLAW
	dbw 28, SANDSTORM
	dbw 31, SLASH
	dbw 34, GYRO_BALL
	dbw 37, SPIKES
	dbw 40, EARTHQUAKE
	dbw 43, SWORDS_DANCE
	dbw 46, NIGHT_SLASH
	dbw 48, BULK_UP
	dbw 50, ROCK_SLIDE
	dbw 53, BODY_PRESS
	dbw 56, GUILLOTINE
	dbw 60, FISSURE
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, METAL_CLAW
	dbw 10, POISON_STING
	dbw 13, ROLLOUT
	dbw 16, RAPID_SPIN
	dbw 19, BULLDOZE
	dbw 22, ROCK_TOMB
	dbw 25, CRUSH_CLAW
	dbw 28, SANDSTORM
	dbw 31, SLASH
	dbw 34, GYRO_BALL
	dbw 37, SPIKES
	dbw 40, EARTHQUAKE
	dbw 43, SWORDS_DANCE
	dbw 46, NIGHT_SLASH
	dbw 48, BULK_UP
	dbw 50, ROCK_SLIDE
	dbw 53, BODY_PRESS
	dbw 56, GUILLOTINE
	dbw 60, FISSURE
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, POISON_STING
	dbw 10, DOUBLE_KICK
	dbw 13, BITE
	dbw 16, SAND_ATTACK
	dbw 19, POISON_FANG
	dbw 22, STOMP
	dbw 25, MAGNITUDE
	dbw 28, SPIKES
	dbw 31, TOXIC
	dbw 34, BODY_SLAM
	dbw 37, CRUNCH
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, BODY_PRESS
	dbw 51, BULK_UP
	dbw 54, SLUDGE_WAVE
	dbw 57, REST
	dbw 60, SUPERPOWER
	dbw 65, FISSURE
	dbw 70, HEAVY_SLAM
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	dbbw EVOLVE_LEVEL, 36, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, POISON_STING
	dbw 10, DOUBLE_KICK
	dbw 13, BITE
	dbw 16, SAND_ATTACK
	dbw 19, POISON_FANG
	dbw 22, STOMP
	dbw 25, MAGNITUDE
	dbw 28, SPIKES
	dbw 31, TOXIC
	dbw 34, BODY_SLAM
	dbw 37, CRUNCH
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, BODY_PRESS
	dbw 51, BULK_UP
	dbw 54, SLUDGE_WAVE
	dbw 57, REST
	dbw 60, SUPERPOWER
	dbw 65, FISSURE
	dbw 70, HEAVY_SLAM
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, POISON_STING
	dbw 10, DOUBLE_KICK
	dbw 13, BITE
	dbw 16, SAND_ATTACK
	dbw 19, POISON_FANG
	dbw 22, STOMP
	dbw 25, MAGNITUDE
	dbw 28, SPIKES
	dbw 31, TOXIC
	dbw 34, BODY_SLAM
	dbw 37, CRUNCH
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, BODY_PRESS
	dbw 51, BULK_UP
	dbw 54, SLUDGE_WAVE
	dbw 57, REST
	dbw 60, SUPERPOWER
	dbw 65, FISSURE
	dbw 70, HEAVY_SLAM
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 4, POISON_STING
	dbw 7, FOCUS_ENERGY
	dbw 10, DOUBLE_KICK
	dbw 13, FURY_ATTACK
	dbw 16, SAND_ATTACK
	dbw 19, HORN_ATTACK
	dbw 22, MAGNITUDE
	dbw 25, SUCKER_PUNCH
	dbw 28, BULLDOZE
	dbw 31, POISON_TAIL
	dbw 34, BRICK_BREAK
	dbw 37, POISON_JAB
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, THRASH
	dbw 51, AQUA_TAIL
	dbw 54, SLUDGE_WAVE
	dbw 57, MEGAHORN
	dbw 60, HORN_DRILL
	dbw 65, FISSURE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOKING
	dbbw EVOLVE_LEVEL, 36, NIDOKING
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 4, POISON_STING
	dbw 7, FOCUS_ENERGY
	dbw 10, DOUBLE_KICK
	dbw 13, FURY_ATTACK
	dbw 16, SAND_ATTACK
	dbw 19, HORN_ATTACK
	dbw 22, MAGNITUDE
	dbw 25, SUCKER_PUNCH
	dbw 28, BULLDOZE
	dbw 31, POISON_TAIL
	dbw 34, BRICK_BREAK
	dbw 37, POISON_JAB
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, THRASH
	dbw 51, AQUA_TAIL
	dbw 54, SLUDGE_WAVE
	dbw 57, MEGAHORN
	dbw 60, HORN_DRILL
	dbw 65, FISSURE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 4, POISON_STING
	dbw 7, FOCUS_ENERGY
	dbw 10, DOUBLE_KICK
	dbw 13, FURY_ATTACK
	dbw 16, SAND_ATTACK
	dbw 19, HORN_ATTACK
	dbw 22, MAGNITUDE
	dbw 25, SUCKER_PUNCH
	dbw 28, BULLDOZE
	dbw 31, POISON_TAIL
	dbw 34, BRICK_BREAK
	dbw 37, POISON_JAB
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 48, THRASH
	dbw 51, AQUA_TAIL
	dbw 54, SLUDGE_WAVE
	dbw 57, MEGAHORN
	dbw 60, HORN_DRILL
	dbw 65, FISSURE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, CLEFABLE
	dbbw EVOLVE_LEVEL, 36, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 4, PIXIE_DUST
	dbw 7, ENCORE
	dbw 10, SING
	dbw 13, DOUBLESLAP
	dbw 16, METRONOME
	dbw 19, SWEET_KISS
	dbw 22, MINIMIZE
	dbw 25, DRAININGKISS
	dbw 28, GLARE
	dbw 31, FAE_VOICE
	dbw 34, LIGHT_SCREEN
	dbw 36, MOONLIGHT
	dbw 38, REFLECT
	dbw 41, MOONBLAST
	dbw 44, HYPER_VOICE
	dbw 47, CALM_MIND
	dbw 50, MYSTICAL_FIRE
	dbw 53, COSMIC_POWER
	dbw 56, METEOR_MASH
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 4, PIXIE_DUST
	dbw 7, ENCORE
	dbw 10, SING
	dbw 13, DOUBLESLAP
	dbw 16, METRONOME
	dbw 19, SWEET_KISS
	dbw 22, MINIMIZE
	dbw 25, DRAININGKISS
	dbw 28, GLARE
	dbw 31, FAE_VOICE
	dbw 34, LIGHT_SCREEN
	dbw 36, MOONLIGHT
	dbw 38, REFLECT
	dbw 41, MOONBLAST
	dbw 44, HYPER_VOICE
	dbw 47, CALM_MIND
	dbw 50, MYSTICAL_FIRE
	dbw 53, COSMIC_POWER
	dbw 56, METEOR_MASH
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, VULPIX2
	dbww EVOLVE_ITEM, ICE_STONE, AVULPIX
	dbbw EVOLVE_LEVEL, 30, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, PIXIE_DUST
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, DISABLE
	dbw 10, CONFUSE_RAY
	dbw 13, NIGHT_SHADE
	dbw 16, FIRE_SPIN
	dbw 19, WILLOWISP
	dbw 22, FAE_VOICE
	dbw 25, HEX
	dbw 28, SUNNY_DAY
	dbw 31, MYSTICAL_FIRE
	dbw 34, RECOVER
	dbw 37, SAFEGUARD
	dbw 40, FLAMETHROWER
	dbw 43, EXTRASENSORY
	dbw 46, MOONBLAST
	dbw 49, CALM_MIND
	dbw 52, DESTINY_BOND
	dbw 55, SOLARBEAM
	dbw 58, HEAT_WAVE
	dbw 61, FIRE_BLAST
	dbw 65, FAERIEGLEAM
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	dbww EVOLVE_ITEM, ICE_STONE, ANINETALES
	dbww EVOLVE_ITEM, WATER_STONE, NINETALES2
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, PIXIE_DUST
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, DISABLE
	dbw 10, CONFUSE_RAY
	dbw 13, NIGHT_SHADE
	dbw 16, FIRE_SPIN
	dbw 19, WILLOWISP
	dbw 22, FAE_VOICE
	dbw 25, HEX
	dbw 28, SUNNY_DAY
	dbw 31, MYSTICAL_FIRE
	dbw 34, RECOVER
	dbw 37, SAFEGUARD
	dbw 40, FLAMETHROWER
	dbw 43, EXTRASENSORY
	dbw 46, MOONBLAST
	dbw 49, CALM_MIND
	dbw 52, DESTINY_BOND
	dbw 55, SOLARBEAM
	dbw 58, HEAT_WAVE
	dbw 61, FIRE_BLAST
	dbw 65, FAERIEGLEAM
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	dbbw EVOLVE_LEVEL, 36, WIGGLYTUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 4, SWEET_KISS
	dbw 7, DISABLE
	dbw 10, ROLLOUT
	dbw 13, DOUBLESLAP
	dbw 16, WILLOWISP
	dbw 19, DRAININGKISS
	dbw 22, YAWN
	dbw 25, REST
	dbw 28, BODY_SLAM
	dbw 31, MEAN_LOOK
	dbw 34, HYPER_VOICE
	dbw 37, SLEEP_TALK
	dbw 40, PLAY_ROUGH
	dbw 43, MOONBLAST
	dbw 46, PERISH_SONG
	dbw 49, GYRO_BALL
	dbw 52, UPROAR
	dbw 55, DOUBLE_EDGE
	dbw 58, FACADE
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 4, SWEET_KISS
	dbw 7, DISABLE
	dbw 10, ROLLOUT
	dbw 13, DOUBLESLAP
	dbw 16, WILLOWISP
	dbw 19, DRAININGKISS
	dbw 22, YAWN
	dbw 25, REST
	dbw 28, BODY_SLAM
	dbw 31, MEAN_LOOK
	dbw 34, HYPER_VOICE
	dbw 37, SLEEP_TALK
	dbw 40, PLAY_ROUGH
	dbw 43, MOONBLAST
	dbw 46, PERISH_SONG
	dbw 49, GYRO_BALL
	dbw 52, UPROAR
	dbw 55, DOUBLE_EDGE
	dbw 58, FACADE
	dbw 60, HEAL_BELL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 4, SUPERSONIC
	dbw 7, ASTONISH
	dbw 10, BITE
	dbw 13, GUST
	dbw 16, MEAN_LOOK
	dbw 19, CONFUSE_RAY
	dbw 22, WING_ATTACK
	dbw 25, POISON_FANG
	dbw 28, HAZE
	dbw 31, FIRE_FANG
	dbw 33, ICE_FANG
	dbw 35, THUNDER_FANG
	dbw 37, ACROBATICS
	dbw 40, CRUNCH
	dbw 43, SLUDGE_BOMB
	dbw 46, TAUNT
	dbw 49, BELLY_DRUM
	dbw 52, U_TURN
	dbw 55, WHIRLWIND
	dbw 58, EXTREMESPEED
	dbw 65, SKY_ATTACK
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	dbbw EVOLVE_LEVEL, 40, CROBAT
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 4, SUPERSONIC
	dbw 7, ASTONISH
	dbw 10, BITE
	dbw 13, GUST
	dbw 16, MEAN_LOOK
	dbw 19, CONFUSE_RAY
	dbw 22, WING_ATTACK
	dbw 25, POISON_FANG
	dbw 28, HAZE
	dbw 31, FIRE_FANG
	dbw 33, ICE_FANG
	dbw 35, THUNDER_FANG
	dbw 37, ACROBATICS
	dbw 40, CRUNCH
	dbw 43, SLUDGE_BOMB
	dbw 46, TAUNT
	dbw 49, BELLY_DRUM
	dbw 52, U_TURN
	dbw 55, WHIRLWIND
	dbw 58, EXTREMESPEED
	dbw 65, SKY_ATTACK
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 4, SWEET_SCENT
	dbw 7, POISONPOWDER
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, SLEEP_POWDER
	dbw 19, ACID_SPRAY
	dbw 22, RAZOR_LEAF
	dbw 25, VENOSHOCK
	dbw 28, MOONLIGHT
	dbw 31, GROWTH
	dbw 34, TOXIC
	dbw 37, MOONBLAST
	dbw 40, GIGA_DRAIN
	dbw 43, SLUDGE_WAVE
	dbw 46, SUNNY_DAY
	dbw 49, SAFEGUARD
	dbw 52, CHARM
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbww EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	dbbw EVOLVE_LEVEL, 36, VILEPLUME
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 4, SWEET_SCENT
	dbw 7, POISONPOWDER
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, SLEEP_POWDER
	dbw 19, ACID_SPRAY
	dbw 22, RAZOR_LEAF
	dbw 25, VENOSHOCK
	dbw 28, MOONLIGHT
	dbw 31, GROWTH
	dbw 34, TOXIC
	dbw 37, MOONBLAST
	dbw 40, GIGA_DRAIN
	dbw 43, SLUDGE_WAVE
	dbw 46, SUNNY_DAY
	dbw 49, SAFEGUARD
	dbw 52, CHARM
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 4, SWEET_SCENT
	dbw 7, POISONPOWDER
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, SLEEP_POWDER
	dbw 19, ACID_SPRAY
	dbw 22, RAZOR_LEAF
	dbw 25, VENOSHOCK
	dbw 28, MOONLIGHT
	dbw 31, GROWTH
	dbw 34, TOXIC
	dbw 37, MOONBLAST
	dbw 40, GIGA_DRAIN
	dbw 43, SLUDGE_WAVE
	dbw 46, SUNNY_DAY
	dbw 49, SAFEGUARD
	dbw 52, CHARM
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, STRING_SHOT
	dbw 4, ABSORB
	dbw 7, STUN_SPORE
	dbw 10, POISONPOWDER
	dbw 13, ASTONISH
	dbw 16, LEECH_SEED
	dbw 19, BULLET_SEED
	dbw 22, SHADOWSNEAK
	dbw 25, SLASH
	dbw 28, GROWTH
	dbw 31, SHADOW_CLAW
	dbw 34, INGRAIN
	dbw 37, LEAF_BLADE
	dbw 40, NIGHT_SLASH
	dbw 43, SPORE
	dbw 46, SWORDS_DANCE
	dbw 49, GIGA_DRAIN
	dbw 52, SUBSTITUTE
	dbw 55, KNOCK_OFF
	dbw 60, CURSE
	dbw 70, SHADOW_FORCE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, STRING_SHOT
	dbw 4, ABSORB
	dbw 7, STUN_SPORE
	dbw 10, POISONPOWDER
	dbw 13, ASTONISH
	dbw 16, LEECH_SEED
	dbw 19, BULLET_SEED
	dbw 22, SHADOWSNEAK
	dbw 25, SLASH
	dbw 28, GROWTH
	dbw 31, SHADOW_CLAW
	dbw 34, INGRAIN
	dbw 37, LEAF_BLADE
	dbw 40, NIGHT_SLASH
	dbw 43, SPORE
	dbw 46, SWORDS_DANCE
	dbw 49, GIGA_DRAIN
	dbw 52, SUBSTITUTE
	dbw 55, KNOCK_OFF
	dbw 60, CURSE
	dbw 70, SHADOW_FORCE
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 4, SUPERSONIC
	dbw 7, DISABLE
	dbw 10, LEECH_LIFE
	dbw 13, SMOG
	dbw 16, POISONPOWDER
	dbw 19, PSYBEAM
	dbw 22, STUN_SPORE
	dbw 25, ACID_SPRAY
	dbw 28, SLEEP_POWDER
	dbw 31, SILVER_WIND
	dbw 34, VENOSHOCK
	dbw 37, AIR_CUTTER
	dbw 40, SIGNAL_BEAM
	dbw 43, SLUDGE_WAVE
	dbw 46, MEDITATE
	dbw 49, TOXIC
	dbw 52, PSYCHIC_M
	dbw 55, GIGA_DRAIN
	dbw 58, ENCORE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 4, SUPERSONIC
	dbw 7, DISABLE
	dbw 10, LEECH_LIFE
	dbw 13, SMOG
	dbw 16, POISONPOWDER
	dbw 19, PSYBEAM
	dbw 22, STUN_SPORE
	dbw 25, ACID_SPRAY
	dbw 28, SLEEP_POWDER
	dbw 31, SILVER_WIND
	dbw 34, VENOSHOCK
	dbw 37, AIR_CUTTER
	dbw 40, SIGNAL_BEAM
	dbw 43, SLUDGE_WAVE
	dbw 46, MEDITATE
	dbw 49, TOXIC
	dbw 52, PSYCHIC_M
	dbw 55, GIGA_DRAIN
	dbw 58, ENCORE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 4, GROWL
	dbw 7, ASTONISH
	dbw 10, MAGNITUDE
	dbw 13, ROCK_THROW
	dbw 16, BULLDOZE
	dbw 19, FURY_SWIPES
	dbw 22, SUCKER_PUNCH
	dbw 25, PURSUIT
	dbw 28, SLASH
	dbw 31, SANDSTORM
	dbw 34, NIGHT_SLASH
	dbw 37, EARTHQUAKE
	dbw 40, ROCK_SLIDE
	dbw 43, SWORDS_DANCE
	dbw 46, TRI_ATTACK
	dbw 49, KNOCK_OFF
	dbw 55, FISSURE
	dbw 60, STONE_EDGE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 4, GROWL
	dbw 7, ASTONISH
	dbw 10, MAGNITUDE
	dbw 13, ROCK_THROW
	dbw 16, BULLDOZE
	dbw 19, FURY_SWIPES
	dbw 22, SUCKER_PUNCH
	dbw 25, PURSUIT
	dbw 28, SLASH
	dbw 31, SANDSTORM
	dbw 34, NIGHT_SLASH
	dbw 37, EARTHQUAKE
	dbw 40, ROCK_SLIDE
	dbw 43, SWORDS_DANCE
	dbw 46, TRI_ATTACK
	dbw 49, KNOCK_OFF
	dbw 55, FISSURE
	dbw 60, STONE_EDGE
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, BITE
	dbw 7, QUICK_ATTACK
	dbw 10, METAL_CLAW
	dbw 13, FURY_SWIPES
	dbw 16, PAY_DAY
	dbw 19, TAUNT
	dbw 21, PURSUIT
	dbw 23, FAINT_ATTACK
	dbw 25, SCREECH
	dbw 27, FALSE_SWIPE
	dbw 29, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, PSYCHO_CUT
	dbw 37, KNOCK_OFF
	dbw 40, NIGHT_SLASH
	dbw 43, CRUNCH
	dbw 46, PLAY_ROUGH
	dbw 49, SWORDS_DANCE
	dbw 52, SUCKER_PUNCH
	dbw 55, EXTREMESPEED
	dbw 60, U_TURN
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 4, BITE
	dbw 7, QUICK_ATTACK
	dbw 10, METAL_CLAW
	dbw 13, FURY_SWIPES
	dbw 16, PAY_DAY
	dbw 19, TAUNT
	dbw 21, PURSUIT
	dbw 23, FAINT_ATTACK
	dbw 25, SCREECH
	dbw 27, FALSE_SWIPE
	dbw 29, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, PSYCHO_CUT
	dbw 37, KNOCK_OFF
	dbw 40, NIGHT_SLASH
	dbw 43, CRUNCH
	dbw 46, PLAY_ROUGH
	dbw 49, SWORDS_DANCE
	dbw 52, SUCKER_PUNCH
	dbw 55, EXTREMESPEED
	dbw 60, U_TURN
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 4, DISABLE
	dbw 7, CONFUSION
	dbw 10, FURY_SWIPES
	dbw 13, YAWN
	dbw 16, WATER_PULSE
	dbw 19, FROSTBITE
	dbw 22, BUBBLEBEAM
	dbw 25, PSYBEAM
	dbw 28, PSYCH_UP
	dbw 31, RAIN_DANCE
	dbw 34, AMNESIA
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, MIST_BALL
	dbw 46, HYPNOSIS
	dbw 49, MEDITATE
	dbw 52, ENCORE
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, FUTURE_SIGHT
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 4, DISABLE
	dbw 7, CONFUSION
	dbw 10, FURY_SWIPES
	dbw 13, YAWN
	dbw 16, WATER_PULSE
	dbw 19, FROSTBITE
	dbw 22, BUBBLEBEAM
	dbw 25, PSYBEAM
	dbw 28, PSYCH_UP
	dbw 31, RAIN_DANCE
	dbw 34, AMNESIA
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, MIST_BALL
	dbw 46, HYPNOSIS
	dbw 49, MEDITATE
	dbw 52, ENCORE
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, FUTURE_SIGHT
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, FURY_SWIPES
	dbw 13, SEISMIC_TOSS
	dbw 16, PURSUIT
	dbw 19, MACH_PUNCH
	dbw 22, BULLDOZE
	dbw 25, SCREECH
	dbw 28, THRASH
	dbw 31, DRAIN_PUNCH
	dbw 34, SHADOW_PUNCH
	dbw 37, TAUNT
	dbw 40, CROSS_CHOP
	dbw 43, EARTHQUAKE
	dbw 46, ROCK_SLIDE
	dbw 49, BULK_UP
	dbw 52, OUTRAGE
	dbw 55, COUP_DE_GRACE
	dbw 60, STONE_EDGE
	dbw 65, HI_JUMP_KICK
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, ANNIHILAPE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, FURY_SWIPES
	dbw 13, SEISMIC_TOSS
	dbw 16, PURSUIT
	dbw 19, MACH_PUNCH
	dbw 22, BULLDOZE
	dbw 25, SCREECH
	dbw 28, THRASH
	dbw 31, DRAIN_PUNCH
	dbw 34, SHADOW_PUNCH
	dbw 37, TAUNT
	dbw 40, CROSS_CHOP
	dbw 43, EARTHQUAKE
	dbw 46, ROCK_SLIDE
	dbw 49, BULK_UP
	dbw 52, OUTRAGE
	dbw 55, COUP_DE_GRACE
	dbw 60, STONE_EDGE
	dbw 65, HI_JUMP_KICK
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ARCANINE
	dbbw EVOLVE_LEVEL, 36, ARCANINE
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, EMBER
	dbw 4, ROAR
	dbw 7, TAIL_WHIP
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, FIRE_SPIN
	dbw 19, DOUBLE_KICK
	dbw 22, FIRE_FANG
	dbw 25, BODY_SLAM
	dbw 28, TAKE_DOWN
	dbw 31, FLAME_WHEEL
	dbw 34, CRUNCH
	dbw 37, AGILITY
	dbw 40, MORNING_SUN
	dbw 43, PLAY_ROUGH
	dbw 46, THRASH
	dbw 49, HEAT_CRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, EXTREMESPEED
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, EMBER
	dbw 4, ROAR
	dbw 7, TAIL_WHIP
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, FIRE_SPIN
	dbw 19, DOUBLE_KICK
	dbw 22, FIRE_FANG
	dbw 25, BODY_SLAM
	dbw 28, TAKE_DOWN
	dbw 31, FLAME_WHEEL
	dbw 34, CRUNCH
	dbw 37, AGILITY
	dbw 40, MORNING_SUN
	dbw 43, PLAY_ROUGH
	dbw 46, THRASH
	dbw 49, HEAT_CRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, EXTREMESPEED
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POUND
	dbw 4, WATER_GUN
	dbw 7, HYPNOSIS
	dbw 10, DOUBLESLAP
	dbw 13, MUD_SHOT
	dbw 16, KARATE_CHOP
	dbw 19, AQUA_JET
	dbw 22, BUBBLEBEAM
	dbw 25, MACH_PUNCH
	dbw 28, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 34, DRAIN_PUNCH
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, AQUA_TAIL
	dbw 46, BULK_UP
	dbw 49, MIND_READER
	dbw 52, COUP_DE_GRACE
	dbw 56, SUBMISSION
	dbw 60, DOUBLE_EDGE
	dbw 65, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbww EVOLVE_ITEM, KINGS_ROCK, POLITOED
	dbbw EVOLVE_LEVEL, 36, POLIWRATH
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POUND
	dbw 4, WATER_GUN
	dbw 7, HYPNOSIS
	dbw 10, DOUBLESLAP
	dbw 13, MUD_SHOT
	dbw 16, KARATE_CHOP
	dbw 19, AQUA_JET
	dbw 22, BUBBLEBEAM
	dbw 25, MACH_PUNCH
	dbw 28, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 34, DRAIN_PUNCH
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, AQUA_TAIL
	dbw 46, BULK_UP
	dbw 49, MIND_READER
	dbw 52, COUP_DE_GRACE
	dbw 56, SUBMISSION
	dbw 60, DOUBLE_EDGE
	dbw 65, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, POUND
	dbw 4, WATER_GUN
	dbw 7, HYPNOSIS
	dbw 10, DOUBLESLAP
	dbw 13, MUD_SHOT
	dbw 16, KARATE_CHOP
	dbw 19, AQUA_JET
	dbw 22, BUBBLEBEAM
	dbw 25, MACH_PUNCH
	dbw 28, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 34, DRAIN_PUNCH
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, AQUA_TAIL
	dbw 46, BULK_UP
	dbw 49, MIND_READER
	dbw 52, COUP_DE_GRACE
	dbw 56, SUBMISSION
	dbw 60, DOUBLE_EDGE
	dbw 65, HYDRO_PUMP
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	dbww EVOLVE_ITEM, MOON_STONE, ABRA2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 10, KINESIS
	dbw 13, DISABLE
	dbw 16, CHARGE_BEAM
	dbw 19, PSYBEAM
	dbw 22, REFLECT
	dbw 25, RECOVER
	dbw 28, LIGHT_SCREEN
	dbw 31, PSYCH_UP
	dbw 34, TAUNT
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, SIGNAL_BEAM
	dbw 46, MEDITATE
	dbw 49, FLASHCANNON
	dbw 52, GRASS_KNOT
	dbw 55, ENCORE
	dbw 60, AURA_SPHERE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ALAKAZAM
	dbww EVOLVE_ITEM, MOON_STONE, KADABRA2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 10, KINESIS
	dbw 13, DISABLE
	dbw 16, CHARGE_BEAM
	dbw 19, PSYBEAM
	dbw 22, REFLECT
	dbw 25, RECOVER
	dbw 28, LIGHT_SCREEN
	dbw 31, PSYCH_UP
	dbw 34, TAUNT
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, SIGNAL_BEAM
	dbw 46, MEDITATE
	dbw 49, FLASHCANNON
	dbw 52, GRASS_KNOT
	dbw 55, ENCORE
	dbw 60, AURA_SPHERE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, ALAKAZAMX
	dbww EVOLVE_ITEM, MOON_STONE, ALAKAZAM2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 10, KINESIS
	dbw 13, DISABLE
	dbw 16, CHARGE_BEAM
	dbw 19, PSYBEAM
	dbw 22, REFLECT
	dbw 25, RECOVER
	dbw 28, LIGHT_SCREEN
	dbw 31, PSYCH_UP
	dbw 34, TAUNT
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, SIGNAL_BEAM
	dbw 46, MEDITATE
	dbw 49, FLASHCANNON
	dbw 52, GRASS_KNOT
	dbw 55, ENCORE
	dbw 60, AURA_SPHERE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, ROCK_THROW
	dbw 13, SEISMIC_TOSS
	dbw 16, KNOCK_OFF
	dbw 19, MACH_PUNCH
	dbw 22, SCARY_FACE
	dbw 25, FORCE_PALM
	dbw 28, BULLET_PUNCH
	dbw 31, BRICK_BREAK
	dbw 34, VITAL_THROW
	dbw 37, FACADE
	dbw 40, CROSS_CHOP
	dbw 43, ROCK_SLIDE
	dbw 46, BULK_UP
	dbw 49, DRAIN_PUNCH
	dbw 52, COUNTER
	dbw 55, HEAVY_SLAM
	dbw 58, SUBMISSION
	dbw 61, ZEN_HEADBUTT
	dbw 65, DOUBLE_EDGE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, ROCK_THROW
	dbw 13, SEISMIC_TOSS
	dbw 16, KNOCK_OFF
	dbw 19, MACH_PUNCH
	dbw 22, SCARY_FACE
	dbw 25, FORCE_PALM
	dbw 28, BULLET_PUNCH
	dbw 31, BRICK_BREAK
	dbw 34, VITAL_THROW
	dbw 37, FACADE
	dbw 40, CROSS_CHOP
	dbw 43, ROCK_SLIDE
	dbw 46, BULK_UP
	dbw 49, DRAIN_PUNCH
	dbw 52, COUNTER
	dbw 55, HEAVY_SLAM
	dbw 58, SUBMISSION
	dbw 61, ZEN_HEADBUTT
	dbw 65, DOUBLE_EDGE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, ROCK_THROW
	dbw 13, SEISMIC_TOSS
	dbw 16, KNOCK_OFF
	dbw 19, MACH_PUNCH
	dbw 22, SCARY_FACE
	dbw 25, FORCE_PALM
	dbw 28, BULLET_PUNCH
	dbw 31, BRICK_BREAK
	dbw 34, VITAL_THROW
	dbw 37, FACADE
	dbw 40, CROSS_CHOP
	dbw 43, ROCK_SLIDE
	dbw 46, BULK_UP
	dbw 49, DRAIN_PUNCH
	dbw 52, COUNTER
	dbw 55, HEAVY_SLAM
	dbw 58, SUBMISSION
	dbw 61, ZEN_HEADBUTT
	dbw 65, DOUBLE_EDGE
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 4, GROWTH
	dbw 7, WRAP
	dbw 10, BULLET_SEED
	dbw 13, SLEEP_POWDER
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, KNOCK_OFF
	dbw 28, VENOSHOCK
	dbw 31, SUNNY_DAY
	dbw 34, SUCKER_PUNCH
	dbw 37, LEECH_SEED
	dbw 40, POISON_JAB
	dbw 43, LEAF_BLADE
	dbw 46, SWORDS_DANCE
	dbw 49, WEATHER_BALL
	dbw 52, SYNTHESIS
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, VICTREEBEL
	dbww EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 4, GROWTH
	dbw 7, WRAP
	dbw 10, BULLET_SEED
	dbw 13, SLEEP_POWDER
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, KNOCK_OFF
	dbw 28, VENOSHOCK
	dbw 31, SUNNY_DAY
	dbw 34, SUCKER_PUNCH
	dbw 37, LEECH_SEED
	dbw 40, POISON_JAB
	dbw 43, LEAF_BLADE
	dbw 46, SWORDS_DANCE
	dbw 49, WEATHER_BALL
	dbw 52, SYNTHESIS
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, VICTREEBELX
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 4, GROWTH
	dbw 7, WRAP
	dbw 10, BULLET_SEED
	dbw 13, SLEEP_POWDER
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, RAZOR_LEAF
	dbw 25, KNOCK_OFF
	dbw 28, VENOSHOCK
	dbw 31, SUNNY_DAY
	dbw 34, SUCKER_PUNCH
	dbw 37, LEECH_SEED
	dbw 40, POISON_JAB
	dbw 43, LEAF_BLADE
	dbw 46, SWORDS_DANCE
	dbw 49, WEATHER_BALL
	dbw 52, SYNTHESIS
	dbw 55, SOLARBEAM
	dbw 60, PETAL_DANCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 4, SUPERSONIC
	dbw 7, CONSTRICT
	dbw 10, ACID
	dbw 13, WRAP
	dbw 16, RAPID_SPIN
	dbw 19, ACID_SPRAY
	dbw 22, WATER_PULSE
	dbw 25, VENOSHOCK
	dbw 28, CONFUSE_RAY
	dbw 31, FROSTBITE
	dbw 34, ACID_ARMOR
	dbw 37, TOXIC
	dbw 40, MIST_BALL
	dbw 43, HAZE
	dbw 46, SLUDGE_WAVE
	dbw 49, KNOCK_OFF
	dbw 52, GIGA_DRAIN
	dbw 55, AQUA_RING
	dbw 60, HYDRO_PUMP
	dbw 65, POWER_GEM
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 4, SUPERSONIC
	dbw 7, CONSTRICT
	dbw 10, ACID
	dbw 13, WRAP
	dbw 16, RAPID_SPIN
	dbw 19, ACID_SPRAY
	dbw 22, WATER_PULSE
	dbw 25, VENOSHOCK
	dbw 28, CONFUSE_RAY
	dbw 31, FROSTBITE
	dbw 34, ACID_ARMOR
	dbw 37, TOXIC
	dbw 40, MIST_BALL
	dbw 43, HAZE
	dbw 46, SLUDGE_WAVE
	dbw 49, KNOCK_OFF
	dbw 52, GIGA_DRAIN
	dbw 55, AQUA_RING
	dbw 60, HYDRO_PUMP
	dbw 65, POWER_GEM
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRAVELER
	dbww EVOLVE_ITEM, THUNDERSTONE, AGEODUDE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, ROLLOUT
	dbw 13, BULLDOZE
	dbw 16, MAGNITUDE
	dbw 19, SELFDESTRUCT
	dbw 22, ROCK_BLAST
	dbw 25, TAKE_DOWN
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 43, BODY_PRESS
	dbw 46, DOUBLE_EDGE
	dbw 49, AMNESIA
	dbw 52, HEAVY_SLAM
	dbw 56, STONE_EDGE
	dbw 60, FISSURE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GOLEM
	dbww EVOLVE_ITEM, THUNDERSTONE, AGRAVELER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, ROLLOUT
	dbw 13, BULLDOZE
	dbw 16, MAGNITUDE
	dbw 19, SELFDESTRUCT
	dbw 22, ROCK_BLAST
	dbw 25, TAKE_DOWN
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 43, BODY_PRESS
	dbw 46, DOUBLE_EDGE
	dbw 49, AMNESIA
	dbw 52, HEAVY_SLAM
	dbw 56, STONE_EDGE
	dbw 60, FISSURE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

GolemEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, AGOLEM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, SAND_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, ROLLOUT
	dbw 13, BULLDOZE
	dbw 16, MAGNITUDE
	dbw 19, SELFDESTRUCT
	dbw 22, ROCK_BLAST
	dbw 25, TAKE_DOWN
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 43, BODY_PRESS
	dbw 46, DOUBLE_EDGE
	dbw 49, AMNESIA
	dbw 52, HEAVY_SLAM
	dbw 56, STONE_EDGE
	dbw 60, FISSURE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbww EVOLVE_ITEM, DAWN_STONE, GPONYTA
	dbww EVOLVE_ITEM, THUNDERSTONE, PONYTA2
	dbbw EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, EMBER
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, DOUBLE_KICK
	dbw 19, STOMP
	dbw 22, FIRE_SPIN
	dbw 25, AGILITY
	dbw 28, TAKE_DOWN
	dbw 31, FLAME_WHEEL
	dbw 34, SUNNY_DAY
	dbw 37, LOW_KICK
	dbw 40, BLAZE_KICK
	dbw 43, MORNING_SUN
	dbw 46, DOUBLE_EDGE
	dbw 49, DRAGON_DANCE
	dbw 52, MEGAHORN
	dbw 55, EXTREMESPEED
	dbw 60, SACRED_FIRE
	dbw 65, MEGA_KICK
	dbw 70, HEAT_CRASH
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	dbww EVOLVE_ITEM, DAWN_STONE, GRAPIDASH
	dbww EVOLVE_ITEM, THUNDERSTONE, RAPIDASH2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, EMBER
	dbw 10, QUICK_ATTACK
	dbw 13, FLAME_CHARGE
	dbw 16, DOUBLE_KICK
	dbw 19, STOMP
	dbw 22, FIRE_SPIN
	dbw 25, AGILITY
	dbw 28, TAKE_DOWN
	dbw 31, FLAME_WHEEL
	dbw 34, SUNNY_DAY
	dbw 37, LOW_KICK
	dbw 40, BLAZE_KICK
	dbw 43, MORNING_SUN
	dbw 46, DOUBLE_EDGE
	dbw 49, DRAGON_DANCE
	dbw 52, MEGAHORN
	dbw 55, EXTREMESPEED
	dbw 60, SACRED_FIRE
	dbw 65, MEGA_KICK
	dbw 70, HEAT_CRASH
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SLOWBRO
	dbww EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 4, GROWL
	dbw 7, YAWN
	dbw 10, CONFUSION
	dbw 13, DISABLE
	dbw 16, WATER_PULSE
	dbw 19, WITHDRAW
	dbw 22, CURSE
	dbw 25, ZEN_HEADBUTT
	dbw 28, AMNESIA
	dbw 31, RECOVER
	dbw 34, BODY_PRESS
	dbw 37, PSYCHIC_M
	dbw 40, AQUA_TAIL
	dbw 43, DRAIN_PUNCH
	dbw 46, SAFEGUARD
	dbw 50, RAIN_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, FUTURE_SIGHT
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, SLOWBROX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 4, GROWL
	dbw 7, YAWN
	dbw 10, CONFUSION
	dbw 13, DISABLE
	dbw 16, WATER_PULSE
	dbw 19, WITHDRAW
	dbw 22, CURSE
	dbw 25, ZEN_HEADBUTT
	dbw 28, AMNESIA
	dbw 31, RECOVER
	dbw 34, BODY_PRESS
	dbw 37, PSYCHIC_M
	dbw 40, AQUA_TAIL
	dbw 43, DRAIN_PUNCH
	dbw 46, SAFEGUARD
	dbw 50, RAIN_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, FUTURE_SIGHT
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, MAGNETON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, SUPERSONIC
	dbw 7, METAL_CLAW
	dbw 10, THUNDER_WAVE
	dbw 13, SONICBOOM
	dbw 16, CHARGE_BEAM
	dbw 19, SPARK
	dbw 22, SCREECH
	dbw 25, ELECTRO_WEB
	dbw 28, LOCK_ON
	dbw 31, MIRROR_COAT
	dbw 34, DISCHARGE
	dbw 37, CHARGE
	dbw 40, THUNDERBOLT
	dbw 43, FLASHCANNON
	dbw 46, TRI_ATTACK
	dbw 49, LIGHT_SCREEN
	dbw 52, REFLECT
	dbw 55, RECOVER
	dbw 60, BODY_PRESS
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MAGNEZONE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, SUPERSONIC
	dbw 7, METAL_CLAW
	dbw 10, THUNDER_WAVE
	dbw 13, SONICBOOM
	dbw 16, CHARGE_BEAM
	dbw 19, SPARK
	dbw 22, SCREECH
	dbw 25, ELECTRO_WEB
	dbw 28, LOCK_ON
	dbw 31, MIRROR_COAT
	dbw 34, DISCHARGE
	dbw 37, CHARGE
	dbw 40, THUNDERBOLT
	dbw 43, FLASHCANNON
	dbw 46, TRI_ATTACK
	dbw 49, LIGHT_SCREEN
	dbw 52, REFLECT
	dbw 55, RECOVER
	dbw 60, BODY_PRESS
	dbw 70, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, SIRFETCH_D
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	dbw 4, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 10, SHARPEN
	dbw 13, FURY_CUTTER
	dbw 16, FALSE_SWIPE
	dbw 19, AERIAL_ACE
	dbw 22, WING_ATTACK
	dbw 25, SLASH
	dbw 28, JUMP_KICK
	dbw 31, PSYCHO_CUT
	dbw 34, BRICK_BREAK
	dbw 37, KNOCK_OFF
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, ACROBATICS
	dbw 49, CROSS_CHOP
	dbw 52, LEAF_BLADE
	dbw 55, AGILITY
	dbw 60, SKY_ATTACK
	dbw 65, HI_JUMP_KICK
	dbw 70, DRAGON_DANCE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, QUICK_ATTACK
	dbw 7, FURY_ATTACK
	dbw 10, BITE
	dbw 13, PURSUIT
	dbw 16, WING_ATTACK
	dbw 19, FACADE
	dbw 22, AGILITY
	dbw 25, ACROBATICS
	dbw 28, JUMP_KICK
	dbw 31, TRI_ATTACK
	dbw 34, KNOCK_OFF
	dbw 37, SWORDS_DANCE
	dbw 40, DRILL_PECK
	dbw 43, THRASH
	dbw 46, WHIRLWIND
	dbw 50, DOUBLE_EDGE
	dbw 55, MIRROR_MOVE
	dbw 60, SKY_ATTACK
	dbw 65, FLAIL
	dbw 70, HI_JUMP_KICK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, QUICK_ATTACK
	dbw 7, FURY_ATTACK
	dbw 10, BITE
	dbw 13, PURSUIT
	dbw 16, WING_ATTACK
	dbw 19, FACADE
	dbw 22, AGILITY
	dbw 25, ACROBATICS
	dbw 28, JUMP_KICK
	dbw 31, TRI_ATTACK
	dbw 34, KNOCK_OFF
	dbw 37, SWORDS_DANCE
	dbw 40, DRILL_PECK
	dbw 43, THRASH
	dbw 46, WHIRLWIND
	dbw 50, DOUBLE_EDGE
	dbw 55, MIRROR_MOVE
	dbw 60, SKY_ATTACK
	dbw 65, FLAIL
	dbw 70, HI_JUMP_KICK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DEWGONG
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 4, POWDER_SNOW
	dbw 7, TAIL_WHIP
	dbw 10, AQUA_JET
	dbw 13, ENCORE
	dbw 16, HEADBUTT
	dbw 19, AURORA_BEAM
	dbw 22, FROSTBITE
	dbw 25, BUBBLEBEAM
	dbw 28, AQUA_RING
	dbw 31, ICICLE_SPEAR
	dbw 34, REST
	dbw 37, MIRROR_COAT
	dbw 40, ICE_BEAM
	dbw 43, AQUA_TAIL
	dbw 46, PERISH_SONG
	dbw 50, AMNESIA
	dbw 55, SAFEGUARD
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ASHIBOMB
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 4, POWDER_SNOW
	dbw 7, TAIL_WHIP
	dbw 10, AQUA_JET
	dbw 13, ENCORE
	dbw 16, HEADBUTT
	dbw 19, AURORA_BEAM
	dbw 22, FROSTBITE
	dbw 25, BUBBLEBEAM
	dbw 28, AQUA_RING
	dbw 31, ICICLE_SPEAR
	dbw 34, REST
	dbw 37, MIRROR_COAT
	dbw 40, ICE_BEAM
	dbw 43, AQUA_TAIL
	dbw 46, PERISH_SONG
	dbw 50, AMNESIA
	dbw 55, SAFEGUARD
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MUK
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, POISON_GAS
	dbw 1, HARDEN
	dbw 4, ACID
	dbw 7, DISABLE
	dbw 10, SHADOWSNEAK
	dbw 13, MINIMIZE
	dbw 16, SLUDGE
	dbw 19, SHADOW_PUNCH
	dbw 22, SCREECH
	dbw 25, CRUSH_CLAW
	dbw 28, MAGNITUDE
	dbw 31, ACID_ARMOR
	dbw 34, DRAIN_PUNCH
	dbw 37, KNOCK_OFF
	dbw 40, POISON_JAB
	dbw 43, COSMIC_POWER
	dbw 46, CRUNCH
	dbw 50, REST
	dbw 55, BULK_UP
	dbw 60, EARTHQUAKE
	dbw 65, DYNAMICPUNCH
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, POISON_GAS
	dbw 1, HARDEN
	dbw 4, ACID
	dbw 7, DISABLE
	dbw 10, SHADOWSNEAK
	dbw 13, MINIMIZE
	dbw 16, SLUDGE
	dbw 19, SHADOW_PUNCH
	dbw 22, SCREECH
	dbw 25, CRUSH_CLAW
	dbw 28, MAGNITUDE
	dbw 31, ACID_ARMOR
	dbw 34, DRAIN_PUNCH
	dbw 37, KNOCK_OFF
	dbw 40, POISON_JAB
	dbw 43, COSMIC_POWER
	dbw 46, CRUNCH
	dbw 50, REST
	dbw 55, BULK_UP
	dbw 60, EARTHQUAKE
	dbw 65, DYNAMICPUNCH
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, CLOYSTER
	dbbw EVOLVE_LEVEL, 30, CLOYSTER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 1, WITHDRAW
	dbw 4, CLAMP
	dbw 7, LEER
	dbw 10, SUPERSONIC
	dbw 13, ICICLE_SPEAR
	dbw 16, AQUA_JET
	dbw 19, SPIKE_CANNON
	dbw 22, FROSTBITE
	dbw 25, ROCK_BLAST
	dbw 28, SPIKES
	dbw 31, RAPID_SPIN
	dbw 34, RAZORSHELL
	dbw 37, BARRIER
	dbw 40, ICICLE_CRASH
	dbw 43, WATERFALL
	dbw 46, ICE_BEAM
	dbw 50, AMNESIA
	dbw 55, HYDRO_PUMP
	dbw 60, BLIZZARD
	dbw 65, REST
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 1, WITHDRAW
	dbw 4, CLAMP
	dbw 7, LEER
	dbw 10, SUPERSONIC
	dbw 13, ICICLE_SPEAR
	dbw 16, AQUA_JET
	dbw 19, SPIKE_CANNON
	dbw 22, FROSTBITE
	dbw 25, ROCK_BLAST
	dbw 28, SPIKES
	dbw 31, RAPID_SPIN
	dbw 34, RAZORSHELL
	dbw 37, BARRIER
	dbw 40, ICICLE_CRASH
	dbw 43, WATERFALL
	dbw 46, ICE_BEAM
	dbw 50, AMNESIA
	dbw 55, HYDRO_PUMP
	dbw 60, BLIZZARD
	dbw 65, REST
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 1, CONFUSE_RAY
	dbw 4, POISON_GAS
	dbw 7, ASTONISH
	dbw 10, SPITE
	dbw 13, NIGHT_SHADE
	dbw 16, CURSE
	dbw 19, HEX
	dbw 22, MEAN_LOOK
	dbw 25, VENOSHOCK
	dbw 28, ACID_SPRAY
	dbw 31, NIGHTMARE
	dbw 34, PAIN_SPLIT
	dbw 37, MEDITATE
	dbw 40, SHADOW_BALL
	dbw 43, SLUDGE_WAVE
	dbw 46, DARK_PULSE
	dbw 50, TAUNT
	dbw 55, DESTINY_BOND
	dbw 60, PERISH_SONG
	dbw 65, DREAM_EATER
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 1, CONFUSE_RAY
	dbw 4, POISON_GAS
	dbw 7, ASTONISH
	dbw 10, SPITE
	dbw 13, NIGHT_SHADE
	dbw 16, CURSE
	dbw 19, HEX
	dbw 22, MEAN_LOOK
	dbw 25, VENOSHOCK
	dbw 28, ACID_SPRAY
	dbw 31, NIGHTMARE
	dbw 34, PAIN_SPLIT
	dbw 37, MEDITATE
	dbw 40, SHADOW_BALL
	dbw 43, SLUDGE_WAVE
	dbw 46, DARK_PULSE
	dbw 50, TAUNT
	dbw 55, DESTINY_BOND
	dbw 60, PERISH_SONG
	dbw 65, DREAM_EATER
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

GengarEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, GENGARX
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 1, CONFUSE_RAY
	dbw 4, POISON_GAS
	dbw 7, ASTONISH
	dbw 10, SPITE
	dbw 13, NIGHT_SHADE
	dbw 16, CURSE
	dbw 19, HEX
	dbw 22, MEAN_LOOK
	dbw 25, VENOSHOCK
	dbw 28, ACID_SPRAY
	dbw 31, NIGHTMARE
	dbw 34, PAIN_SPLIT
	dbw 37, MEDITATE
	dbw 40, SHADOW_BALL
	dbw 43, SLUDGE_WAVE
	dbw 46, DARK_PULSE
	dbw 50, TAUNT
	dbw 55, DESTINY_BOND
	dbw 60, PERISH_SONG
	dbw 65, DREAM_EATER
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, BIND
	dbw 4, ROCK_THROW
	dbw 7, SCREECH
	dbw 10, ROLLOUT
	dbw 13, ROCK_TOMB
	dbw 16, CURSE
	dbw 19, BREAKING_SWIPE
	dbw 22, BULLDOZE
	dbw 25, GYRO_BALL
	dbw 28, SANDSTORM
	dbw 31, REST
	dbw 37, CRUNCH
	dbw 40, ROCK_SLIDE
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 50, HEAVY_SLAM
	dbw 55, IRON_TAIL
	dbw 60, DOUBLE_EDGE
	dbw 65, COSMIC_POWER
	dbw 70, FISSURE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 1, CONFUSION
	dbw 4, ASTONISH
	dbw 7, DISABLE
	dbw 10, COMET_PUNCH
	dbw 13, POISON_GAS
	dbw 16, PSYBEAM
	dbw 19, MACH_PUNCH
	dbw 22, MEDITATE
	dbw 25, SHADOW_PUNCH
	dbw 28, HEX
	dbw 31, DIZZY_PUNCH
	dbw 34, ZEN_HEADBUTT
	dbw 37, DRAIN_PUNCH
	dbw 40, ENERVATE
	dbw 43, PSYCHIC_M
	dbw 46, SUCKER_PUNCH
	dbw 50, SHADOW_BALL
	dbw 55, DREAM_EATER
	dbw 60, CALM_MIND
	dbw 65, FUTURE_SIGHT
	dbw 70, SHADOW_FORCE
	dbw 75, SUBMISSION
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 1, CONFUSION
	dbw 4, ASTONISH
	dbw 7, DISABLE
	dbw 10, COMET_PUNCH
	dbw 13, POISON_GAS
	dbw 16, PSYBEAM
	dbw 19, MACH_PUNCH
	dbw 22, MEDITATE
	dbw 25, SHADOW_PUNCH
	dbw 28, HEX
	dbw 31, DIZZY_PUNCH
	dbw 34, ZEN_HEADBUTT
	dbw 37, DRAIN_PUNCH
	dbw 40, ENERVATE
	dbw 43, PSYCHIC_M
	dbw 46, SUCKER_PUNCH
	dbw 50, SHADOW_BALL
	dbw 55, DREAM_EATER
	dbw 60, CALM_MIND
	dbw 65, FUTURE_SIGHT
	dbw 70, SHADOW_FORCE
	dbw 75, SUBMISSION
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, HARDEN
	dbw 7, METAL_CLAW
	dbw 10, CLAMP
	dbw 13, ROCK_SMASH
	dbw 16, AQUA_JET
	dbw 19, STOMP
	dbw 22, CRUSH_CLAW
	dbw 25, RAZORSHELL
	dbw 28, KNOCK_OFF
	dbw 31, FLAIL
	dbw 34, VICEGRIP
	dbw 37, CURSE
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, CRABHAMMER
	dbw 50, AGILITY
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	dbw 65, BODY_PRESS
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, KINGLERX
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, HARDEN
	dbw 7, METAL_CLAW
	dbw 10, CLAMP
	dbw 13, ROCK_SMASH
	dbw 16, AQUA_JET
	dbw 19, STOMP
	dbw 22, CRUSH_CLAW
	dbw 25, RAZORSHELL
	dbw 28, KNOCK_OFF
	dbw 31, FLAIL
	dbw 34, VICEGRIP
	dbw 37, CURSE
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, CRABHAMMER
	dbw 50, AGILITY
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	dbw 65, BODY_PRESS
	dbw 70, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	dbww EVOLVE_ITEM, LEAF_STONE, HVOLTORB
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, SCREECH
	dbw 10, CHARGE_BEAM
	dbw 13, SONICBOOM
	dbw 16, SELFDESTRUCT
	dbw 19, SPARK
	dbw 22, ELECTRO_BALL
	dbw 25, ROLLOUT
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, HYPER_VOICE
	dbw 37, DISCHARGE
	dbw 40, THUNDERBOLT
	dbw 43, MIRROR_COAT
	dbw 46, FAERIEGLEAM
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER
	dbw 65, POWER_GEM
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, HELECTRODE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, SCREECH
	dbw 10, CHARGE_BEAM
	dbw 13, SONICBOOM
	dbw 16, SELFDESTRUCT
	dbw 19, SPARK
	dbw 22, ELECTRO_BALL
	dbw 25, ROLLOUT
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, HYPER_VOICE
	dbw 37, DISCHARGE
	dbw 40, THUNDERBOLT
	dbw 43, MIRROR_COAT
	dbw 46, FAERIEGLEAM
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER
	dbw 65, POWER_GEM
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	dbbw EVOLVE_LEVEL, 36, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 4, BULLET_SEED
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, CONFUSION
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, MEGA_DRAIN
	dbw 25, SYNTHESIS
	dbw 28, PSYBEAM
	dbw 31, SLEEP_POWDER
	dbw 34, GIGA_DRAIN
	dbw 37, EXTRASENSORY
	dbw 40, PSYCHIC_M
	dbw 43, INGRAIN
	dbw 46, EGG_BOMB
	dbw 50, CALM_MIND
	dbw 55, EXPLOSION
	dbw 60, AMNESIA
	dbw 65, DRAGON_CLAW
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 4, BULLET_SEED
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, CONFUSION
	dbw 16, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 22, MEGA_DRAIN
	dbw 25, SYNTHESIS
	dbw 28, PSYBEAM
	dbw 31, SLEEP_POWDER
	dbw 34, GIGA_DRAIN
	dbw 37, EXTRASENSORY
	dbw 40, PSYCHIC_M
	dbw 43, INGRAIN
	dbw 46, EGG_BOMB
	dbw 50, CALM_MIND
	dbw 55, EXPLOSION
	dbw 60, AMNESIA
	dbw 65, DRAGON_CLAW
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAROWAK
	dbww EVOLVE_ITEM, FIRE_STONE, AMAROWAK
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 4, TAIL_WHIP
	dbw 7, SAND_ATTACK
	dbw 10, FALSE_SWIPE
	dbw 13, LEER
	dbw 16, BONE_CLUB
	dbw 19, HEADBUTT
	dbw 22, FOCUS_ENERGY
	dbw 25, NIGHT_SHADE
	dbw 28, BONEMERANG
	dbw 31, CURSE
	dbw 34, SHADOW_CLAW
	dbw 37, BONE_RUSH
	dbw 40, THRASH
	dbw 43, SWORDS_DANCE
	dbw 46, DOUBLE_EDGE
	dbw 50, FLAME_WHEEL
	dbw 55, GLARE
	dbw 60, SHADOW_FORCE
	dbw 65, BELLY_DRUM
	dbw 70, FISSURE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, AMAROWAK
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 4, TAIL_WHIP
	dbw 7, SAND_ATTACK
	dbw 10, FALSE_SWIPE
	dbw 13, LEER
	dbw 16, BONE_CLUB
	dbw 19, HEADBUTT
	dbw 22, FOCUS_ENERGY
	dbw 25, NIGHT_SHADE
	dbw 28, BONEMERANG
	dbw 31, CURSE
	dbw 34, SHADOW_CLAW
	dbw 37, BONE_RUSH
	dbw 40, THRASH
	dbw 43, SWORDS_DANCE
	dbw 46, DOUBLE_EDGE
	dbw 50, FLAME_WHEEL
	dbw 55, GLARE
	dbw 60, SHADOW_FORCE
	dbw 65, BELLY_DRUM
	dbw 70, FISSURE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FOCUS_ENERGY
	dbw 1, LOW_KICK
	dbw 4, DOUBLE_KICK
	dbw 7, SHARPEN
	dbw 10, ROCK_SMASH
	dbw 13, ROLLING_KICK
	dbw 16, PURSUIT
	dbw 19, FORESIGHT
	dbw 22, MIND_READER
	dbw 25, JUMP_KICK
	dbw 28, COUNTER
	dbw 31, TRIPLE_KICK
	dbw 34, BLAZE_KICK
	dbw 37, AGILITY
	dbw 40, KNOCK_OFF
	dbw 43, SUCKER_PUNCH
	dbw 46, DRAGON_DANCE
	dbw 50, MEGA_KICK
	dbw 55, ENDURE
	dbw 60, HI_JUMP_KICK
	dbw 65, EXTREMESPEED
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FOCUS_ENERGY
	dbw 1, COMET_PUNCH
	dbw 4, PURSUIT
	dbw 7, AGILITY
	dbw 10, MACH_PUNCH
	dbw 13, BULLET_PUNCH
	dbw 16, SHADOW_PUNCH
	dbw 19, DETECT
	dbw 22, DIZZY_PUNCH
	dbw 25, THUNDERPUNCH
	dbw 28, ICE_PUNCH
	dbw 31, FIRE_PUNCH
	dbw 34, DRAIN_PUNCH
	dbw 37, SUCKER_PUNCH
	dbw 40, COUNTER
	dbw 43, MEGA_PUNCH
	dbw 46, BULK_UP
	dbw 50, DRAGON_DANCE
	dbw 55, DYNAMICPUNCH
	dbw 60, SWORDS_DANCE
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, LICKILICKY
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 1, DEFENSE_CURL
	dbw 4, SUPERSONIC
	dbw 7, WRAP
	dbw 10, BITE
	dbw 13, ROLLOUT
	dbw 16, STOMP
	dbw 19, DISABLE
	dbw 22, POISON_FANG
	dbw 25, SCREECH
	dbw 28, KNOCK_OFF
	dbw 31, THUNDER_FANG
	dbw 34, ICE_FANG
	dbw 37, FIRE_FANG
	dbw 40, BODY_SLAM
	dbw 43, CRUNCH
	dbw 46, HYPER_FANG
	dbw 50, BULK_UP
	dbw 55, THRASH
	dbw 60, BELLY_DRUM
	dbw 65, GYRO_BALL
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, WEEZING
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POISON_GAS
	dbw 4, EMBER
	dbw 7, SMOG
	dbw 10, SMOKESCREEN
	dbw 13, SELFDESTRUCT
	dbw 16, ACID_SPRAY
	dbw 19, VENOSHOCK
	dbw 22, SLUDGE
	dbw 25, FIRE_SPIN
	dbw 28, WILLOWISP
	dbw 31, GYRO_BALL
	dbw 34, CURSE
	dbw 37, HYPER_VOICE
	dbw 40, FLAMETHROWER
	dbw 43, SLUDGE_WAVE
	dbw 46, PAIN_SPLIT
	dbw 50, EXPLOSION
	dbw 55, HAZE
	dbw 60, AMNESIA
	dbw 65, FIRE_BLAST
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, GWEEZING
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, POISON_GAS
	dbw 4, EMBER
	dbw 7, SMOG
	dbw 10, SMOKESCREEN
	dbw 13, SELFDESTRUCT
	dbw 16, ACID_SPRAY
	dbw 19, VENOSHOCK
	dbw 22, SLUDGE
	dbw 25, FIRE_SPIN
	dbw 28, WILLOWISP
	dbw 31, GYRO_BALL
	dbw 34, CURSE
	dbw 37, HYPER_VOICE
	dbw 40, FLAMETHROWER
	dbw 43, SLUDGE_WAVE
	dbw 46, PAIN_SPLIT
	dbw 50, EXPLOSION
	dbw 55, HAZE
	dbw 60, AMNESIA
	dbw 65, FIRE_BLAST
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, RHYDON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, FURY_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, METAL_CLAW
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, HORN_ATTACK
	dbw 22, DRAGON_RAGE
	dbw 25, BULLDOZE
	dbw 28, BREAKING_SWIPE
	dbw 31, SCARY_FACE
	dbw 34, ROCK_BLAST
	dbw 37, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 43, DRAGON_CLAW
	dbw 46, EARTHQUAKE
	dbw 50, DRAGON_DANCE
	dbw 55, STONE_EDGE
	dbw 60, MEGAHORN
	dbw 65, OUTRAGE
	dbw 70, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	dbbw EVOLVE_LEVEL, 44, RHYPERIOR
	db 0 ; no more evolutions	
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, FURY_ATTACK
	dbw 7, ROCK_THROW
	dbw 10, METAL_CLAW
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, HORN_ATTACK
	dbw 22, DRAGON_RAGE
	dbw 25, BULLDOZE
	dbw 28, BREAKING_SWIPE
	dbw 31, SCARY_FACE
	dbw 34, ROCK_BLAST
	dbw 37, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 43, DRAGON_CLAW
	dbw 46, EARTHQUAKE
	dbw 50, DRAGON_DANCE
	dbw 55, STONE_EDGE
	dbw 60, MEGAHORN
	dbw 65, OUTRAGE
	dbw 70, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 7, CHARM
	dbw 10, SWEET_KISS
	dbw 13, SOFTBOILED
	dbw 16, DOUBLESLAP
	dbw 19, SEISMIC_TOSS
	dbw 22, MINIMIZE
	dbw 25, SING
	dbw 28, HEAL_BELL
	dbw 31, EGG_BOMB
	dbw 34, LIGHT_SCREEN
	dbw 37, REFLECT
	dbw 40, CALM_MIND
	dbw 43, HYPER_VOICE
	dbw 46, COUNTER
	dbw 50, MOONBLAST
	dbw 55, SUBSTITUTE
	dbw 60, METRONOME
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, TANGROWTH
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, CONSTRICT
	dbw 4, SLEEP_POWDER
	dbw 7, ABSORB
	dbw 10, POISONPOWDER
	dbw 13, VINE_WHIP
	dbw 16, STUN_SPORE
	dbw 19, MEGA_DRAIN
	dbw 22, KNOCK_OFF
	dbw 25, ANCIENTPOWER
	dbw 28, GROWTH
	dbw 31, LEECH_SEED
	dbw 34, SLAM
	dbw 37, INGRAIN
	dbw 40, GIGA_DRAIN
	dbw 43, NATURE_POWER
	dbw 46, BODY_SLAM
	dbw 50, AMNESIA
	dbw 55, DARK_PULSE
	dbw 60, SOLARBEAM
	dbw 65, SPORE
	dbw 70, PETAL_DANCE
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TAIL_WHIP
	dbw 4, GROWL
	dbw 7, COMET_PUNCH
	dbw 10, BITE
	dbw 13, LEER
	dbw 16, STOMP
	dbw 19, DIZZY_PUNCH
	dbw 22, MEGA_PUNCH
	dbw 25, SUCKER_PUNCH
	dbw 28, MAGNITUDE
	dbw 31, DRAIN_PUNCH
	dbw 34, CRUSH_CLAW
	dbw 37, ENDURE
	dbw 40, THRASH
	dbw 43, CRUNCH
	dbw 46, COUNTER
	dbw 50, SWORDS_DANCE
	dbw 55, DOUBLE_EDGE
	dbw 60, DYNAMICPUNCH
	dbw 65, OUTRAGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, SEADRA
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, SMOKESCREEN
	dbw 7, BUBBLE
	dbw 10, TWISTER
	dbw 13, FOCUS_ENERGY
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, DRAGON_RAGE
	dbw 25, AGILITY
	dbw 28, POISON_TAIL
	dbw 31, RAZOR_WIND
	dbw 34, RAIN_DANCE
	dbw 37, OCTAZOOKA
	dbw 40, DRAGONBREATH
	dbw 43, MIST_BALL
	dbw 46, WATERFALL
	dbw 50, DRAGON_DANCE
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	dbww EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	dbbw EVOLVE_LEVEL, 40, KINGDRA
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, LEER
	dbw 4, SMOKESCREEN
	dbw 7, BUBBLE
	dbw 10, TWISTER
	dbw 13, FOCUS_ENERGY
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, DRAGON_RAGE
	dbw 25, AGILITY
	dbw 28, POISON_TAIL
	dbw 31, RAZOR_WIND
	dbw 34, RAIN_DANCE
	dbw 37, OCTAZOOKA
	dbw 40, DRAGONBREATH
	dbw 43, MIST_BALL
	dbw 46, WATERFALL
	dbw 50, DRAGON_DANCE
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, SEAKING
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 4, SUPERSONIC
	dbw 7, HORN_ATTACK
	dbw 10, WATER_PULSE
	dbw 13, FURY_ATTACK
	dbw 16, AQUA_RING
	dbw 19, AGILITY
	dbw 22, WING_ATTACK
	dbw 25, FLAIL
	dbw 28, KNOCK_OFF
	dbw 31, WATERFALL
	dbw 34, POISON_JAB
	dbw 37, DRILL_PECK
	dbw 40, SWORDS_DANCE
	dbw 43, HORN_DRILL
	dbw 46, BODY_SLAM
	dbw 50, RAIN_DANCE
	dbw 55, SKY_ATTACK
	dbw 60, MEGAHORN
	dbw 65, HYDRO_PUMP
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 4, SUPERSONIC
	dbw 7, HORN_ATTACK
	dbw 10, WATER_PULSE
	dbw 13, FURY_ATTACK
	dbw 16, AQUA_RING
	dbw 19, AGILITY
	dbw 22, WING_ATTACK
	dbw 25, FLAIL
	dbw 28, KNOCK_OFF
	dbw 31, WATERFALL
	dbw 34, POISON_JAB
	dbw 37, DRILL_PECK
	dbw 40, SWORDS_DANCE
	dbw 43, HORN_DRILL
	dbw 46, BODY_SLAM
	dbw 50, RAIN_DANCE
	dbw 55, SKY_ATTACK
	dbw 60, MEGAHORN
	dbw 65, HYDRO_PUMP
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, STARMIE
	dbbw EVOLVE_LEVEL, 36, STARMIE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 4, WATER_GUN
	dbw 7, CONFUSE_RAY
	dbw 10, RAPID_SPIN
	dbw 13, PSYWAVE
	dbw 16, RECOVER
	dbw 19, BUBBLEBEAM
	dbw 22, MINIMIZE
	dbw 25, PSYBEAM
	dbw 28, THUNDER_WAVE
	dbw 31, AURORA_BEAM
	dbw 34, LIGHT_SCREEN
	dbw 37, MIST_BALL
	dbw 40, PSYCHIC_M
	dbw 43, GYRO_BALL
	dbw 46, COSMIC_POWER
	dbw 49, POWER_GEM
	dbw 52, REFLECT
	dbw 55, FLASHCANNON
	dbw 58, ICE_BEAM
	dbw 61, THUNDERBOLT
	dbw 65, HYDRO_PUMP
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 4, WATER_GUN
	dbw 7, CONFUSE_RAY
	dbw 10, RAPID_SPIN
	dbw 13, PSYWAVE
	dbw 16, RECOVER
	dbw 19, BUBBLEBEAM
	dbw 22, MINIMIZE
	dbw 25, PSYBEAM
	dbw 28, THUNDER_WAVE
	dbw 31, AURORA_BEAM
	dbw 34, LIGHT_SCREEN
	dbw 37, MIST_BALL
	dbw 40, PSYCHIC_M
	dbw 43, GYRO_BALL
	dbw 46, COSMIC_POWER
	dbw 49, POWER_GEM
	dbw 52, REFLECT
	dbw 55, FLASHCANNON
	dbw 58, ICE_BEAM
	dbw 61, THUNDERBOLT
	dbw 65, HYDRO_PUMP
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	dbww EVOLVE_ITEM, ICE_STONE, MR__RIME
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, BARRIER
	dbw 1, PIXIE_DUST
	dbw 4, CONFUSION
	dbw 7, DOUBLESLAP
	dbw 10, KINESIS
	dbw 13, PSYWAVE
	dbw 16, ENCORE
	dbw 19, DIZZY_PUNCH
	dbw 22, MEDITATE
	dbw 25, PSYBEAM
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, SUBSTITUTE
	dbw 37, ICY_WIND
	dbw 40, PSYCHIC_M
	dbw 43, MYSTICAL_FIRE
	dbw 46, MOONBLAST
	dbw 50, CALM_MIND
	dbw 55, BATON_PASS
	dbw 60, SAFEGUARD
	dbw 65, RECOVER
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, SCIZOR
	dbww EVOLVE_ITEM, SUN_STONE, KLEAVOR
	dbww EVOLVE_ITEM, KANTOITE_X, SCYTHER2
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, STRING_SHOT
	dbw 4, FOCUS_ENERGY
	dbw 7, FALSE_SWIPE
	dbw 10, FURY_CUTTER
	dbw 13, WING_ATTACK
	dbw 16, PURSUIT
	dbw 19, AERIAL_ACE
	dbw 22, AGILITY
	dbw 25, SLASH
	dbw 28, U_TURN
	dbw 31, KNOCK_OFF
	dbw 34, PSYCHO_CUT
	dbw 37, DOUBLE_TEAM
	dbw 40, NIGHT_SLASH
	dbw 43, ACROBATICS
	dbw 46, LEAF_BLADE
	dbw 50, SWORDS_DANCE
	dbw 55, BATON_PASS
	dbw 60, SKY_ATTACK
	dbw 65, EXTREMESPEED
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LICK
	dbw 4, POWDER_SNOW
	dbw 7, CONFUSION
	dbw 10, LOVELY_KISS
	dbw 13, SWEET_KISS
	dbw 16, DOUBLESLAP
	dbw 19, DRAININGKISS
	dbw 22, FROSTBITE
	dbw 25, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 31, MEAN_LOOK
	dbw 34, HEX
	dbw 37, MEDITATE
	dbw 40, PSYCHIC_M
	dbw 43, ICE_BEAM
	dbw 46, CALM_MIND
	dbw 50, HYPER_VOICE
	dbw 55, PERISH_SONG
	dbw 60, DREAM_EATER
	dbw 65, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ELECTIVIRE
	db 0 ; no more evolutions	
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 4, QUICK_ATTACK
	dbw 7, THUNDER_WAVE
	dbw 10, MACH_PUNCH
	dbw 13, CHARGE_BEAM
	dbw 16, LIGHT_SCREEN
	dbw 19, ELECTRO_BALL
	dbw 22, SCREECH
	dbw 25, THUNDERPUNCH
	dbw 28, DIZZY_PUNCH
	dbw 31, LOW_KICK
	dbw 34, DISCHARGE
	dbw 37, CONFUSE_RAY
	dbw 40, THUNDERBOLT
	dbw 43, CROSS_CHOP
	dbw 46, FAERIEGLEAM
	dbw 50, CHARGE
	dbw 55, AGILITY
	dbw 60, THUNDER
	dbw 65, SUBMISSION
	dbw 70, SHOCKSLAM
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MAGMORTAR
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 4, SMOG
	dbw 7, SMOKESCREEN
	dbw 10, MACH_PUNCH
	dbw 13, FIRE_SPIN
	dbw 16, FLAME_WHEEL
	dbw 19, SCARY_FACE
	dbw 22, FIRE_PUNCH
	dbw 25, WILLOWISP
	dbw 28, FAINT_ATTACK
	dbw 31, LOW_KICK
	dbw 34, LAVA_PLUME
	dbw 37, CONFUSE_RAY
	dbw 40, FLAMETHROWER
	dbw 43, SLUDGE_WAVE
	dbw 46, MYSTICAL_FIRE
	dbw 50, BRICK_BREAK
	dbw 55, SUNNY_DAY
	dbw 60, PSYCHIC_M
	dbw 65, FIRE_BLAST
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, PINSIRX
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 4, FOCUS_ENERGY
	dbw 7, BIND
	dbw 10, FURY_ATTACK
	dbw 13, SEISMIC_TOSS
	dbw 16, TWINEEDLE
	dbw 19, FALSE_SWIPE
	dbw 22, PURSUIT
	dbw 25, KNOCK_OFF
	dbw 28, SLASH
	dbw 31, FURY_CUTTER
	dbw 34, SWORDS_DANCE
	dbw 37, VITAL_THROW
	dbw 40, VICEGRIP
	dbw 43, THRASH
	dbw 46, SUBMISSION
	dbw 50, DRAGON_DANCE
	dbw 55, MEGAHORN
	dbw 60, DOUBLE_EDGE
	dbw 65, GUILLOTINE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, LOW_KICK
	dbw 7, HORN_ATTACK
	dbw 10, DOUBLE_KICK
	dbw 13, SCARY_FACE
	dbw 16, PURSUIT
	dbw 19, MAGNITUDE
	dbw 22, REST
	dbw 25, TAKE_DOWN
	dbw 28, BRICK_BREAK
	dbw 31, BODY_SLAM
	dbw 34, ZEN_HEADBUTT
	dbw 37, THRASH
	dbw 40, EARTHQUAKE
	dbw 43, BULK_UP
	dbw 46, SUBMISSION
	dbw 50, OUTRAGE
	dbw 55, DOUBLE_EDGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 8, BUBBLE
	dbw 12, TACKLE
	dbw 16, FLAIL
	dbw 19, BUBBLEBEAM
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, GYARADOSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, TWISTER
	dbw 1, THRASH
	dbw 20, BITE
	dbw 23, AQUA_JET
	dbw 26, SCARY_FACE
	dbw 29, ICE_FANG
	dbw 32, AQUA_TAIL
	dbw 35, FIRE_FANG
	dbw 38, THUNDER_FANG
	dbw 41, RAIN_DANCE
	dbw 44, DRAGON_CLAW
	dbw 47, CRUNCH
	dbw 50, DRAGON_DANCE
	dbw 55, HYDRO_PUMP
	dbw 60, HYPER_BEAM
	dbw 65, OUTRAGE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 1, SING
	dbw 4, POWDER_SNOW
	dbw 7, MIST
	dbw 10, CONFUSE_RAY
	dbw 13, WATER_PULSE
	dbw 16, AURORA_BEAM
	dbw 19, BUBBLEBEAM
	dbw 22, FROSTBITE
	dbw 25, BODY_SLAM
	dbw 28, PERISH_SONG
	dbw 31, SAFEGUARD
	dbw 34, HEAL_BELL
	dbw 37, MIST_BALL
	dbw 40, ICE_BEAM
	dbw 43, FREEZE_DRY
	dbw 46, HAIL
	dbw 50, COSMIC_POWER
	dbw 55, DRAGONBREATH
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	dbww EVOLVE_ITEM, WATER_STONE, VAPOREON
	dbww EVOLVE_ITEM, FIRE_STONE, FLAREON
	dbww EVOLVE_ITEM, SUN_STONE, ESPEON
	dbww EVOLVE_ITEM, MOON_STONE, UMBREON
	dbww EVOLVE_ITEM, DAWN_STONE, SYLVEON
	dbww EVOLVE_ITEM, LEAF_STONE, LEAFEON
	dbww EVOLVE_ITEM, ICE_STONE, GLACEON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, GROWL
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, CHARM
	dbw 13, PIXIE_DUST
	dbw 16, BITE
	dbw 19, SWIFT
	dbw 22, STOMP
	dbw 25, BATON_PASS
	dbw 28, TAKE_DOWN
	dbw 31, TRI_ATTACK
	dbw 34, BODY_SLAM
	dbw 37, HYPER_VOICE
	dbw 40, FAERIEGLEAM
	dbw 43, AGILITY
	dbw 46, DOUBLE_EDGE
	dbw 50, RECOVER
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, WATER_GUN
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, WATER_PULSE
	dbw 16, AQUA_JET
	dbw 19, HAZE
	dbw 22, AURORA_BEAM
	dbw 25, BUBBLEBEAM
	dbw 28, BATON_PASS
	dbw 31, AQUA_RING
	dbw 34, ACID_ARMOR
	dbw 37, MUDDY_WATER
	dbw 40, MIST_BALL
	dbw 43, ICE_BEAM
	dbw 46, AMNESIA
	dbw 50, RECOVER
	dbw 55, HYDRO_PUMP
	dbw 60, BLIZZARD
	dbw 65, WATER_SPOUT
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, THUNDERSHOCK
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, DOUBLE_KICK
	dbw 13, THUNDER_WAVE
	dbw 16, CHARGE_BEAM
	dbw 19, SPARK
	dbw 22, TWINEEDLE
	dbw 25, ELECTRO_BALL
	dbw 28, SPIKES
	dbw 31, BATON_PASS
	dbw 34, PIN_MISSILE
	dbw 37, DISCHARGE
	dbw 40, THUNDERBOLT
	dbw 43, AGILITY
	dbw 46, CHARGE
	dbw 50, RAIN_DANCE
	dbw 55, THUNDER
	dbw 60, ZAP_CANNON
	dbw 65, SHOCKSLAM
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, EMBER
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, SMOG
	dbw 16, FLAME_CHARGE
	dbw 19, WILLOWISP
	dbw 22, FIRE_FANG
	dbw 25, ROLLING_KICK
	dbw 28, FIRE_SPIN
	dbw 31, POISON_FANG
	dbw 34, FLAME_WHEEL
	dbw 37, FACADE
	dbw 40, CRUNCH
	dbw 43, DRAGON_DANCE
	dbw 46, BODY_SLAM
	dbw 50, LAVA_PLUME
	dbw 55, SUBMISSION
	dbw 60, FIRE_BLAST
	dbw 65, DOUBLE_EDGE
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbww EVOLVE_ITEM, UP_GRADE, PORYGON2
	dbbw EVOLVE_LEVEL, 32, PORYGON2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, CONVERSION2
	dbw 1, SHARPEN
	dbw 4, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, AGILITY
	dbw 13, CHARGE_BEAM
	dbw 16, RECOVER
	dbw 19, PSYBEAM
	dbw 22, SHOCK_WAVE
	dbw 25, SIGNAL_BEAM
	dbw 28, LOCK_ON
	dbw 31, CHARGE
	dbw 34, TRI_ATTACK
	dbw 37, DISCHARGE
	dbw 40, THUNDERBOLT
	dbw 43, MIRROR_COAT
	dbw 46, HYPER_VOICE
	dbw 50, ZAP_CANNON
	dbw 55, TRANSFORM
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, OMASTAR
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 1, WATER_GUN
	dbw 4, BITE
	dbw 7, SAND_ATTACK
	dbw 10, ROCK_THROW
	dbw 13, LEER
	dbw 16, MUD_SHOT
	dbw 19, ANCIENTPOWER
	dbw 22, BUBBLEBEAM
	dbw 25, ROCK_TOMB
	dbw 28, SPIKES
	dbw 31, WATER_PULSE
	dbw 34, RAIN_DANCE
	dbw 37, POWER_GEM
	dbw 40, MUDDY_WATER
	dbw 43, EARTHPOWER
	dbw 46, SANDSTORM
	dbw 50, COSMIC_POWER
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 1, WATER_GUN
	dbw 4, BITE
	dbw 7, SAND_ATTACK
	dbw 10, ROCK_THROW
	dbw 13, LEER
	dbw 16, MUD_SHOT
	dbw 19, ANCIENTPOWER
	dbw 22, BUBBLEBEAM
	dbw 25, ROCK_TOMB
	dbw 28, SPIKES
	dbw 31, WATER_PULSE
	dbw 34, RAIN_DANCE
	dbw 37, POWER_GEM
	dbw 40, MUDDY_WATER
	dbw 43, EARTHPOWER
	dbw 46, SANDSTORM
	dbw 50, COSMIC_POWER
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, KABUTOPS
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 1, ABSORB
	dbw 4, LEER
	dbw 7, ROCK_THROW
	dbw 10, SAND_ATTACK
	dbw 13, AQUA_JET
	dbw 16, MUD_SHOT
	dbw 19, ANCIENTPOWER
	dbw 22, MEGA_DRAIN
	dbw 25, ROCK_TOMB
	dbw 28, RAZORSHELL
	dbw 31, RAPID_SPIN
	dbw 34, SLASH
	dbw 37, ROCK_SLIDE
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, WATERFALL
	dbw 50, KNOCK_OFF
	dbw 55, SHADOW_CLAW
	dbw 60, STONE_EDGE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 1, ABSORB
	dbw 4, LEER
	dbw 7, ROCK_THROW
	dbw 10, SAND_ATTACK
	dbw 13, AQUA_JET
	dbw 16, MUD_SHOT
	dbw 19, ANCIENTPOWER
	dbw 22, MEGA_DRAIN
	dbw 25, ROCK_TOMB
	dbw 28, RAZORSHELL
	dbw 31, RAPID_SPIN
	dbw 34, SLASH
	dbw 37, ROCK_SLIDE
	dbw 40, SWORDS_DANCE
	dbw 43, NIGHT_SLASH
	dbw 46, WATERFALL
	dbw 50, KNOCK_OFF
	dbw 55, SHADOW_CLAW
	dbw 60, STONE_EDGE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, AERODACTYLX
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, BITE
	dbw 4, ROCK_THROW
	dbw 7, SUPERSONIC
	dbw 10, SCARY_FACE
	dbw 13, WING_ATTACK
	dbw 16, ANCIENTPOWER
	dbw 19, ROCK_TOMB
	dbw 22, PURSUIT
	dbw 25, AGILITY
	dbw 28, TAKE_DOWN
	dbw 31, TAUNT
	dbw 34, CRUNCH
	dbw 37, ROCK_SLIDE
	dbw 40, DRILL_PECK
	dbw 43, DRAGON_DANCE
	dbw 46, DRAGON_CLAW
	dbw 50, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, SKY_ATTACK
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 1, DEFENSE_CURL
	dbw 4, METRONOME
	dbw 7, AMNESIA
	dbw 10, YAWN
	dbw 13, BITE
	dbw 16, STOMP
	dbw 19, HEADBUTT
	dbw 22, SNORE
	dbw 25, REST
	dbw 28, COUNTER
	dbw 31, CRUSH_CLAW
	dbw 34, BODY_SLAM
	dbw 37, ZEN_HEADBUTT
	dbw 40, BULK_UP
	dbw 43, HEAVY_SLAM
	dbw 46, CRUNCH
	dbw 50, BELLY_DRUM
	dbw 55, EARTHQUAKE
	dbw 60, OUTRAGE
	dbw 65, DOUBLE_EDGE
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, POWDER_SNOW
	dbw 1, MIST
	dbw 4, CONFUSION
	dbw 8, ICY_WIND
	dbw 12, FROSTBITE
	dbw 16, WING_ATTACK
	dbw 20, PSYBEAM
	dbw 24, AGILITY
	dbw 28, AURORA_BEAM
	dbw 32, ANCIENTPOWER
	dbw 36, FREEZE_DRY
	dbw 40, HAIL
	dbw 44, RAZOR_WIND
	dbw 48, HAZE
	dbw 52, ICE_BEAM
	dbw 56, REFLECT
	dbw 60, PSYCHIC_M
	dbw 65, BLIZZARD
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, THUNDERSHOCK
	dbw 4, DOUBLE_KICK
	dbw 8, CHARGE_BEAM
	dbw 12, THUNDER_WAVE
	dbw 16, WING_ATTACK
	dbw 20, SHOCK_WAVE
	dbw 24, AGILITY
	dbw 28, CHARGE
	dbw 32, JUMP_KICK
	dbw 36, ELECTRO_BALL
	dbw 40, DETECT
	dbw 44, DISCHARGE
	dbw 48, DRILL_PECK
	dbw 52, THUNDERBOLT
	dbw 56, LIGHT_SCREEN
	dbw 60, HURRICANE
	dbw 65, THUNDER
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, EMBER
	dbw 1, LEER
	dbw 4, GUST
	dbw 8, SAFEGUARD
	dbw 12, FIRE_SPIN
	dbw 16, WING_ATTACK
	dbw 20, WILLOWISP
	dbw 24, AGILITY
	dbw 28, FLAME_CHARGE
	dbw 32, MYSTICAL_FIRE
	dbw 36, PURSUIT
	dbw 40, FLAMETHROWER
	dbw 44, HEAT_WAVE
	dbw 48, DRILL_PECK
	dbw 52, NIGHT_SLASH
	dbw 56, HURRICANE
	dbw 60, FIRE_BLAST
	dbw 65, SOLARBEAM
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, THUNDER_WAVE
	dbw 8, TWISTER
	dbw 12, AQUA_JET
	dbw 16, WATER_PULSE
	dbw 20, DRAGON_RAGE
	dbw 24, SLAM
	dbw 28, AGILITY
	dbw 31, AQUA_TAIL
	dbw 34, SAFEGUARD
	dbw 37, DRAGONBREATH
	dbw 40, DRAGON_CLAW
	dbw 43, CRUNCH
	dbw 46, EXTREMESPEED
	dbw 50, DETECT
	dbw 55, DRAGON_DANCE
	dbw 60, OUTRAGE
	dbw 65, HYPER_BEAM
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, THUNDER_WAVE
	dbw 8, TWISTER
	dbw 12, AQUA_JET
	dbw 16, WATER_PULSE
	dbw 20, DRAGON_RAGE
	dbw 24, SLAM
	dbw 28, AGILITY
	dbw 31, AQUA_TAIL
	dbw 34, SAFEGUARD
	dbw 37, DRAGONBREATH
	dbw 40, DRAGON_CLAW
	dbw 43, CRUNCH
	dbw 46, EXTREMESPEED
	dbw 50, DETECT
	dbw 55, DRAGON_DANCE
	dbw 60, OUTRAGE
	dbw 65, HYPER_BEAM
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, DRAGONITEX
	dbww EVOLVE_ITEM, KANTOITE_Y, DRAGONITEY
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, THUNDER_WAVE
	dbw 8, TWISTER
	dbw 12, AQUA_JET
	dbw 16, WATER_PULSE
	dbw 20, DRAGON_RAGE
	dbw 24, SLAM
	dbw 28, AGILITY
	dbw 31, AQUA_TAIL
	dbw 34, SAFEGUARD
	dbw 37, DRAGONBREATH
	dbw 40, DRAGON_CLAW
	dbw 43, CRUNCH
	dbw 46, EXTREMESPEED
	dbw 50, DETECT
	dbw 55, DRAGON_DANCE
	dbw 60, OUTRAGE
	dbw 65, HYPER_BEAM
	dbw 70, SKY_ATTACK
	dbw 75, HURRICANE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, DISABLE
	dbw 1, LOW_KICK
	dbw 4, PSYWAVE
	dbw 8, ANCIENTPOWER
	dbw 12, BARRIER
	dbw 16, PSYBEAM
	dbw 20, SAFEGUARD
	dbw 24, PSYCHO_CUT
	dbw 28, AMNESIA
	dbw 32, AURA_SPHERE
	dbw 36, MEDITATE
	dbw 40, PSYCHIC_M
	dbw 44, RECOVER
	dbw 48, SHADOW_BALL
	dbw 52, MIST
	dbw 56, FUTURE_SIGHT
	dbw 60, DRAIN_PUNCH
	dbw 65, FOCUS_PUNCH
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, AMNESIA
	dbw 8, TRANSFORM
	dbw 12, PSYBEAM
	dbw 16, ANCIENTPOWER
	dbw 20, METRONOME
	dbw 24, FAE_VOICE
	dbw 28, MEGA_PUNCH
	dbw 32, BARRIER
	dbw 36, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 44, MOONBLAST
	dbw 48, BATON_PASS
	dbw 52, PURSUIT
	dbw 56, AURA_SPHERE
	dbw 60, BULK_UP
	dbw 65, SHADOW_BALL
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ENDSECTION

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
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF		
	dbw 28, SLUDGE
	dbw 32, GROWTH
	dbw 36, STOMP
	dbw 40, LEAF_BLADE
	dbw 45, SLUDGE_BOMB
	dbw 50, SOLARBEAM
	dbw 55, BULK_UP
	dbw 60, TOXIC
	dbw 65, DOUBLE_EDGE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF		
	dbw 28, SLUDGE
	dbw 32, GROWTH
	dbw 36, STOMP
	dbw 40, LEAF_BLADE
	dbw 45, SLUDGE_BOMB
	dbw 50, SOLARBEAM
	dbw 55, BULK_UP
	dbw 60, TOXIC
	dbw 65, DOUBLE_EDGE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, VENUSAURX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, SYNTHESIS
	dbw 24, RAZOR_LEAF		
	dbw 28, SLUDGE
	dbw 32, GROWTH
	dbw 36, STOMP
	dbw 40, LEAF_BLADE
	dbw 45, SLUDGE_BOMB
	dbw 50, SOLARBEAM
	dbw 55, BULK_UP
	dbw 60, TOXIC
	dbw 65, DOUBLE_EDGE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, SCARY_FACE
	dbw 24, FIRE_FANG	
	dbw 30, AIR_CUTTER
	dbw 36, SLASH
	dbw 40, FLAMETHROWER	
	dbw 45, DRAGONBREATH
	dbw 50, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, SCARY_FACE
	dbw 24, FIRE_FANG	
	dbw 30, AIR_CUTTER
	dbw 36, SLASH
	dbw 40, FLAMETHROWER	
	dbw 45, DRAGONBREATH
	dbw 50, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, CHARIZARDX
	dbww EVOLVE_ITEM, KANTOITE_Y, CHARIZARDY
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, SCARY_FACE
	dbw 24, FIRE_FANG	
	dbw 30, AIR_CUTTER
	dbw 36, SLASH
	dbw 40, FLAMETHROWER	
	dbw 45, DRAGONBREATH
	dbw 50, SUNNY_DAY
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, OUTRAGE
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, WITHDRAW
	dbw 14, WATER_GUN
	dbw 18, BITE
	dbw 20, PROTECT
	dbw 24, BUBBLEBEAM
	dbw 28, RAPID_SPIN	
	dbw 32, RAIN_DANCE
	dbw 36, ICE_FANG
	dbw 40, MIST_BALL
	dbw 45, FLASHCANNON
	dbw 50, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, BODY_SLAM
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, WITHDRAW
	dbw 14, WATER_GUN
	dbw 18, BITE
	dbw 20, PROTECT
	dbw 24, BUBBLEBEAM
	dbw 28, RAPID_SPIN	
	dbw 32, RAIN_DANCE
	dbw 36, ICE_FANG
	dbw 40, MIST_BALL
	dbw 45, FLASHCANNON
	dbw 50, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, BODY_SLAM
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, BLASTOISEX
	dbww EVOLVE_ITEM, KANTOITE_Y, TOTARTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, WITHDRAW
	dbw 14, WATER_GUN
	dbw 18, BITE
	dbw 20, PROTECT
	dbw 24, BUBBLEBEAM
	dbw 28, RAPID_SPIN	
	dbw 32, RAIN_DANCE
	dbw 36, ICE_FANG
	dbw 40, MIST_BALL
	dbw 45, FLASHCANNON
	dbw 50, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, BODY_SLAM
	dbw 70, HYDRO_CANNON
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
	dbw 10, PIXIE_DUST
	dbw 12, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 20, SUPERSONIC
	dbw 24, FAE_VOICE
	dbw 28, SILVER_WIND
	dbw 32, PSYBEAM
	dbw 36, CALM_MIND
	dbw 40, SIGNAL_BEAM
	dbw 45, MOONBLAST
	dbw 50, EXTRASENSORY
	dbw 55, SAFEGUARD
	dbw 60, MOONLIGHT
	dbw 65, GIGA_DRAIN
	dbw 70, LUSTER_PURGE
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
	dbw 10, FURY_ATTACK
	dbw 16, RAGE
	dbw 20, LEER
	dbw 24, TWINEEDLE
	dbw 28, FAINT_ATTACK
	dbw 32, MEAN_LOOK
	dbw 36, DRAGON_DANCE
	dbw 40, PURSUIT
	dbw 45, PIN_MISSILE	
	dbw 50, SLUDGE_BOMB
	dbw 55, TOXIC
	dbw 60, MEGAHORN
	dbw 70, SWORDS_DANCE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 24, WING_ATTACK
	dbw 28, SLAM
	dbw 30, STEEL_WING	
	dbw 36, MIRROR_MOVE
	dbw 40, DRILL_PECK
	dbw 45, EXTREMESPEED
	dbw 50, BULK_UP	
	dbw 55, DRAGON_CLAW
	dbw 60, SKY_ATTACK	
	dbw 65, DOUBLE_EDGE
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 24, WING_ATTACK
	dbw 28, SLAM
	dbw 30, STEEL_WING	
	dbw 36, MIRROR_MOVE
	dbw 40, DRILL_PECK
	dbw 45, EXTREMESPEED
	dbw 50, BULK_UP	
	dbw 55, DRAGON_CLAW
	dbw 60, SKY_ATTACK	
	dbw 65, DOUBLE_EDGE
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 24, WING_ATTACK
	dbw 28, SLAM
	dbw 30, STEEL_WING	
	dbw 36, MIRROR_MOVE
	dbw 40, DRILL_PECK
	dbw 45, EXTREMESPEED
	dbw 50, BULK_UP	
	dbw 55, DRAGON_CLAW
	dbw 60, SKY_ATTACK	
	dbw 65, DOUBLE_EDGE
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 16, SHARPEN	
	dbw 19, SCARY_FACE
	dbw 24, HYPER_FANG	
	dbw 28, DIG
	dbw 32, POISON_FANG
	dbw 36, BULK_UP
	dbw 40, CRUNCH
	dbw 45, SUPER_FANG
	dbw 50, EXTREMESPEED
	dbw 55, FIRE_FANG
	dbw 60, SWORDS_DANCE
	dbw 65, ICE_FANG
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 16, SHARPEN	
	dbw 19, SCARY_FACE
	dbw 24, HYPER_FANG	
	dbw 28, DIG
	dbw 32, POISON_FANG
	dbw 36, BULK_UP
	dbw 40, CRUNCH
	dbw 45, SUPER_FANG
	dbw 50, EXTREMESPEED
	dbw 55, FIRE_FANG
	dbw 60, SWORDS_DANCE
	dbw 65, ICE_FANG
	dbw 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 18, SHARPEN
	dbw 24, WING_ATTACK
	dbw 28, FAINT_ATTACK
	dbw 32, MIRROR_MOVE
	dbw 36, AERIAL_ACE
	dbw 40, DRILL_PECK
	dbw 45, PURSUIT	
	dbw 50, DRAGON_DANCE
	dbw 55, SLASH
	dbw 60, SKY_ATTACK
	dbw 65, WHIRLWIND
	dbw 70, AEROBLAST
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 18, SHARPEN
	dbw 24, WING_ATTACK
	dbw 28, FAINT_ATTACK	
	dbw 32, MIRROR_MOVE
	dbw 36, AERIAL_ACE
	dbw 40, DRILL_PECK
	dbw 45, PURSUIT	
	dbw 50, DRAGON_DANCE
	dbw 55, SLASH
	dbw 60, SKY_ATTACK
	dbw 65, WHIRLWIND
	dbw 70, AEROBLAST
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE	
	dbw 24, POISON_FANG
	dbw 28, FAINT_ATTACK
	dbw 32, DIG
	dbw 36, SCREECH
	dbw 40, CRUNCH
	dbw 45, POISON_JAB
	dbw 50, DRAGON_DANCE
	dbw 55, ICE_FANG
	dbw 60, EXTREMESPEED
	dbw 65, THUNDER_FANG
	dbw 70, BEAT_UP	
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE	
	dbw 24, POISON_FANG
	dbw 28, FAINT_ATTACK
	dbw 32, DIG
	dbw 36, SCREECH
	dbw 40, CRUNCH
	dbw 45, POISON_JAB
	dbw 50, DRAGON_DANCE
	dbw 55, ICE_FANG
	dbw 60, EXTREMESPEED
	dbw 65, THUNDER_FANG
	dbw 70, BEAT_UP	
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, RAICHU
	dbww EVOLVE_ITEM, WATER_STONE, ARAICHU
	dbbw EVOLVE_LEVEL, 36, RAICHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, CHARM
	dbw 24, SHOCK_WAVE
	dbw 32, GROWTH
	dbw 36, SWIFT
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
	dbw 50, MEDITATE	
	dbw 55, LIGHT_SCREEN
	dbw 60, THUNDER
	dbw 65, RAIN_DANCE
	dbw 70, VOLT_TACKLE
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, ARAICHU
	dbww EVOLVE_ITEM, KANTOITE_X, RAICHUX
	dbww EVOLVE_ITEM, KANTOITE_Y, RAICHUY
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 12, QUICK_ATTACK
	dbw 16, DOUBLE_TEAM
	dbw 20, CHARM
	dbw 24, SHOCK_WAVE
	dbw 32, GROWTH
	dbw 36, SWIFT
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
	dbw 50, MEDITATE	
	dbw 55, LIGHT_SCREEN
	dbw 60, THUNDER
	dbw 65, RAIN_DANCE
	dbw 70, VOLT_TACKLE
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 8, SAND_ATTACK
	dbw 12, METAL_CLAW
	dbw 16, POISON_STING
	dbw 20, ROLLOUT
	dbw 24, DIG
	dbw 28, ROCK_TOMB	
	dbw 32, SANDSTORM
	dbw 36, SLASH
	dbw 40, EARTHQUAKE
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 48, CRUSH_CLAW
	dbw 50, DRAGON_CLAW
	dbw 55, GUILLOTINE
	dbw 60, FISSURE
	dbw 65, SPIKES
	dbw 70, SEISMIC_TOSS
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 8, SAND_ATTACK
	dbw 12, METAL_CLAW
	dbw 16, POISON_STING
	dbw 20, ROLLOUT
	dbw 24, DIG
	dbw 28, ROCK_TOMB	
	dbw 32, SANDSTORM
	dbw 36, SLASH
	dbw 40, EARTHQUAKE
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 48, CRUSH_CLAW
	dbw 50, DRAGON_CLAW
	dbw 55, GUILLOTINE
	dbw 60, FISSURE
	dbw 65, SPIKES
	dbw 70, SEISMIC_TOSS
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	dbbw EVOLVE_LEVEL, 36, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 42, EARTHPOWER
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOKING
	dbbw EVOLVE_LEVEL, 36, NIDOKING
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, SAND_ATTACK
	dbw 20, STOMP
	dbw 24, POISON_FANG
	dbw 28, MAGNITUDE
	dbw 32, SPIKES
	dbw 36, TOXIC
	dbw 40, EARTHQUAKE
	dbw 45, SLUDGE_BOMB
	dbw 50, BULK_UP
	dbw 55, CRUNCH
	dbw 60, FISSURE	
	dbw 65, REST
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, CLEFABLE
	dbbw EVOLVE_LEVEL, 36, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, METRONOME
	dbw 20, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 28, GLARE
	dbw 32, FAE_VOICE
	dbw 36, MOONLIGHT
	dbw 40, MOONBLAST	
	dbw 45, REFLECT
	dbw 50, CALM_MIND
	dbw 55, METEOR_MASH
	dbw 60, COSMIC_POWER
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, METRONOME
	dbw 20, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 28, GLARE
	dbw 32, FAE_VOICE
	dbw 36, MOONLIGHT
	dbw 40, MOONBLAST	
	dbw 45, REFLECT
	dbw 50, CALM_MIND
	dbw 55, METEOR_MASH
	dbw 60, COSMIC_POWER
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, VULPIX2
	dbww EVOLVE_ITEM, ICE_STONE, AVULPIX
	dbbw EVOLVE_LEVEL, 30, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, PIXIE_DUST
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, FIRE_SPIN
	dbw 32, RECOVER
	dbw 36, DRAININGKISS
	dbw 40, FLAMETHROWER
	dbw 45, MOONBLAST
	dbw 48, DESTINY_BOND
	dbw 50, CALM_MIND
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, FAERIEGLEAM
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	dbww EVOLVE_ITEM, ICE_STONE, ANINETALES
	dbww EVOLVE_ITEM, WATER_STONE, NINETALES2
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, PIXIE_DUST
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, FIRE_SPIN
	dbw 32, RECOVER
	dbw 36, DRAININGKISS
	dbw 40, FLAMETHROWER
	dbw 45, MOONBLAST
	dbw 48, DESTINY_BOND
	dbw 50, CALM_MIND
	dbw 55, SOLARBEAM
	dbw 60, FIRE_BLAST
	dbw 65, FAERIEGLEAM
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	dbbw EVOLVE_LEVEL, 36, WIGGLYTUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, DISABLE
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, DRAININGKISS
	dbw 28, REST
	dbw 32, GLARE
	dbw 36, COSMIC_POWER
	dbw 40, MOONBLAST
	dbw 45, REST
	dbw 50, CALM_MIND
	dbw 55, PERISH_SONG
	dbw 60, DOUBLE_EDGE
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, DISABLE
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, DRAININGKISS
	dbw 28, REST
	dbw 32, GLARE
	dbw 36, COSMIC_POWER
	dbw 40, MOONBLAST
	dbw 45, REST
	dbw 50, CALM_MIND
	dbw 55, PERISH_SONG
	dbw 60, DOUBLE_EDGE
	dbw 65, HYPER_VOICE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 6, SUPERSONIC
	dbw 10, GUST
	dbw 16, BITE
	dbw 19, CONFUSE_RAY
	dbw 24, WING_ATTACK
	dbw 28, POISON_FANG
	dbw 32, HAZE
	dbw 36, BELLY_DRUM
	dbw 40, SLUDGE_BOMB
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, AGILITY
	dbw 60, SKY_ATTACK
	dbw 65, WHIRLWIND
	dbw 70, DOUBLE_TEAM
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	dbbw EVOLVE_LEVEL, 40, CROBAT
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 6, SUPERSONIC
	dbw 10, GUST
	dbw 16, BITE
	dbw 19, CONFUSE_RAY
	dbw 24, WING_ATTACK
	dbw 28, POISON_FANG
	dbw 32, HAZE
	dbw 36, BELLY_DRUM
	dbw 40, SLUDGE_BOMB
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, AGILITY
	dbw 60, SKY_ATTACK
	dbw 65, WHIRLWIND
	dbw 70, DOUBLE_TEAM
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 24, MEGA_DRAIN
	dbw 28, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, SLUDGE
	dbw 40, GIGA_DRAIN	
	dbw 45, PURSUIT
	dbw 50, PETAL_DANCE
	dbw 55, TOXIC
	dbw 60, PURSUIT
	dbw 65, SAFEGUARD
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbww EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	dbbw EVOLVE_LEVEL, 36, VILEPLUME
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 24, MEGA_DRAIN
	dbw 28, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, SLUDGE
	dbw 40, GIGA_DRAIN	
	dbw 45, PURSUIT
	dbw 50, PETAL_DANCE
	dbw 55, TOXIC
	dbw 60, PURSUIT
	dbw 65, SAFEGUARD
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 24, MEGA_DRAIN
	dbw 28, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, SLUDGE
	dbw 40, GIGA_DRAIN	
	dbw 45, PURSUIT
	dbw 50, PETAL_DANCE
	dbw 55, TOXIC
	dbw 60, PURSUIT
	dbw 65, SAFEGUARD
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, STRING_SHOT
	dbw 7, STUN_SPORE
	dbw 12, POISONPOWDER	
	dbw 16, LEECH_SEED
	dbw 20, FURY_ATTACK
	dbw 24, RAZOR_LEAF
	dbw 28, SLAM
	dbw 32, GROWTH
	dbw 36, SHADOWSNEAK
	dbw 40, LEAF_BLADE
	dbw 45, SLASH
	dbw 50, GIGA_DRAIN
	dbw 55, SOLARBEAM
	dbw 60, SPORE	
	dbw 65, SWORDS_DANCE
	dbw 70, SHADOW_FORCE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, STRING_SHOT
	dbw 7, STUN_SPORE
	dbw 12, POISONPOWDER	
	dbw 16, LEECH_SEED
	dbw 20, FURY_ATTACK
	dbw 24, RAZOR_LEAF
	dbw 28, SLAM
	dbw 32, GROWTH
	dbw 36, SHADOWSNEAK
	dbw 40, LEAF_BLADE
	dbw 45, SLASH
	dbw 50, GIGA_DRAIN
	dbw 55, SOLARBEAM
	dbw 60, SPORE	
	dbw 65, SWORDS_DANCE
	dbw 70, SHADOW_FORCE
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 8, LEECH_LIFE
	dbw 12, LEECH_SEED
	dbw 16, POISONPOWDER
	dbw 20, SLEEP_POWDER
	dbw 24, PSYBEAM
	dbw 28, STUN_SPORE
	dbw 32, DETECT
	dbw 36, SILVER_WIND
	dbw 40, PSYCHIC_M
	dbw 45, SIGNAL_BEAM	
	dbw 50, MEDITATE	
	dbw 55, GIGA_DRAIN
	dbw 60, AMNESIA
	dbw 65, ENCORE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 8, LEECH_LIFE
	dbw 12, LEECH_SEED
	dbw 16, POISONPOWDER
	dbw 20, SLEEP_POWDER
	dbw 24, PSYBEAM
	dbw 28, STUN_SPORE
	dbw 32, DETECT
	dbw 36, SILVER_WIND
	dbw 40, PSYCHIC_M
	dbw 45, SIGNAL_BEAM	
	dbw 50, MEDITATE	
	dbw 55, GIGA_DRAIN
	dbw 60, AMNESIA
	dbw 65, ENCORE
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 5, GROWL
	dbw 12, ROCK_THROW
	dbw 16, SHARPEN
	dbw 20, DIG
	dbw 24, ROCK_TOMB
	dbw 28, SLAM	
	dbw 32, MEAN_LOOK	
	dbw 36, TRI_ATTACK
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE	
	dbw 50, SWORDS_DANCE
	dbw 55, PURSUIT
	dbw 60, FISSURE
	dbw 65, STONE_EDGE
	dbw 70, MUDDY_WATER
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 5, GROWL
	dbw 12, ROCK_THROW
	dbw 16, SHARPEN
	dbw 20, DIG
	dbw 24, ROCK_TOMB
	dbw 28, SLAM	
	dbw 32, MEAN_LOOK	
	dbw 36, TRI_ATTACK
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE	
	dbw 50, SWORDS_DANCE
	dbw 55, PURSUIT
	dbw 60, FISSURE
	dbw 65, STONE_EDGE
	dbw 70, MUDDY_WATER
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 5, BITE
	dbw 10, METAL_CLAW
	dbw 16, PAY_DAY
	dbw 20, MUD_SLAP
	dbw 24, STOMP
	dbw 28, FAINT_ATTACK
	dbw 32, FALSE_SWIPE
	dbw 36, PSYCHO_CUT
	dbw 40, CRUNCH
	dbw 45, SLASH
	dbw 50, PLAY_ROUGH
	dbw 55, EXTREMESPEED
	dbw 60, SWORDS_DANCE
	dbw 65, PURSUIT
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 5, BITE
	dbw 10, METAL_CLAW
	dbw 16, PAY_DAY
	dbw 20, MUD_SLAP
	dbw 24, STOMP
	dbw 28, FAINT_ATTACK
	dbw 32, FALSE_SWIPE
	dbw 36, PSYCHO_CUT
	dbw 40, CRUNCH
	dbw 45, SLASH
	dbw 50, PLAY_ROUGH
	dbw 55, EXTREMESPEED
	dbw 60, SWORDS_DANCE
	dbw 65, PURSUIT
	dbw 70, BEAT_UP
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, BUBBLE
	dbw 10, DISABLE
	dbw 15, CONFUSION
	dbw 20, ICY_WIND
	dbw 24, BUBBLEBEAM	
	dbw 28, PSYBEAM
	dbw 31, PSYCH_UP
	dbw 36, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 45, MIST_BALL
	dbw 50, RAIN_DANCE
	dbw 55, MEDITATE
	dbw 60, HYDRO_PUMP
	dbw 65, RECOVER
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, BUBBLE
	dbw 10, DISABLE
	dbw 15, CONFUSION
	dbw 20, ICY_WIND
	dbw 24, BUBBLEBEAM	
	dbw 28, PSYBEAM
	dbw 31, PSYCH_UP
	dbw 36, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 45, MIST_BALL
	dbw 50, RAIN_DANCE
	dbw 55, MEDITATE
	dbw 60, HYDRO_PUMP
	dbw 65, RECOVER
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 5, SAND_ATTACK
	dbw 8, LEER	
	dbw 12, SHADOWSNEAK
	dwb 16, ROAR
	dbw 20, FURY_SWIPES
	dbw 24, DOUBLE_KICK
	dbw 28, SHADOW_PUNCH
	dbw 32, MACH_PUNCH	
	dbw 36, MAGNITUDE	
	dbw 40, CROSS_CHOP
	dbw 45, EARTHQUAKE
	dbw 50, ROCK_SLIDE
	dbw 55, BULK_UP
	dbw 60, SHADOW_FORCE
	dbw 65, SUPERPOWER
	dbw 70, MEAN_LOOK
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, ANNIHILAPE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 5, SAND_ATTACK
	dbw 8, LEER	
	dbw 12, SHADOWSNEAK
	dwb 16, ROAR
	dbw 20, FURY_SWIPES
	dbw 24, DOUBLE_KICK
	dbw 28, SHADOW_PUNCH
	dbw 32, MACH_PUNCH	
	dbw 36, MAGNITUDE	
	dbw 40, CROSS_CHOP
	dbw 45, EARTHQUAKE
	dbw 50, ROCK_SLIDE
	dbw 55, BULK_UP
	dbw 60, SHADOW_FORCE
	dbw 65, SUPERPOWER
	dbw 70, MEAN_LOOK
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ARCANINE
	dbbw EVOLVE_LEVEL, 36, ARCANINE
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 5, BITE
	dbw 8, ROAR	
	dbw 12, TAIL_WHIP
	dbw 16, LEER
	dbw 20, MUD_SLAP
	dbw 24, FIRE_FANG
	dbw 28, SLAM	
	dbw 32, GROWTH
	dbw 36, FAINT_ATTACK
	dbw 40, FLAME_WHEEL	
	dbw 45, CRUSH_CLAW
	dbw 50, AGILITY
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, EXTREMESPEED
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 5, BITE
	dbw 8, ROAR	
	dbw 12, TAIL_WHIP
	dbw 16, LEER
	dbw 20, MUD_SLAP
	dbw 24, FIRE_FANG
	dbw 28, SLAM	
	dbw 32, GROWTH
	dbw 36, FAINT_ATTACK
	dbw 40, FLAME_WHEEL	
	dbw 45, CRUSH_CLAW
	dbw 50, AGILITY
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, EXTREMESPEED
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP	
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbww EVOLVE_ITEM, KINGS_ROCK, POLITOED
	dbbw EVOLVE_LEVEL, 36, POLIWRATH
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP	
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP	
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
	dbw 65, HYDRO_PUMP
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	dbww EVOLVE_ITEM, MOON_STONE, ABRA2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 20, GROWL
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SHADOW_PUNCH
	dbw 36, PSYCH_UP
	dbw 40, PSYCHIC_M	
	dbw 45, FOCUS_PUNCH
	dbw 50, MEDITATE
	dbw 55, REFLECT	
	dbw 60, LIGHT_SCREEN
	dbw 65, FLASHCANNON
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ALAKAZAM
	dbww EVOLVE_ITEM, MOON_STONE, KADABRA2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 20, GROWL
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SHADOW_PUNCH
	dbw 36, PSYCH_UP
	dbw 40, PSYCHIC_M	
	dbw 45, FOCUS_PUNCH
	dbw 50, MEDITATE
	dbw 55, REFLECT	
	dbw 60, LIGHT_SCREEN
	dbw 65, FLASHCANNON
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, ALAKAZAMX
	dbww EVOLVE_ITEM, MOON_STONE, ALAKAZAM2
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 20, GROWL
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SHADOW_PUNCH
	dbw 36, PSYCH_UP
	dbw 40, PSYCHIC_M	
	dbw 45, FOCUS_PUNCH
	dbw 50, MEDITATE
	dbw 55, REFLECT	
	dbw 60, LIGHT_SCREEN
	dbw 65, FLASHCANNON
	dbw 70, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 16, KARATE_CHOP
	dbw 20, SEISMIC_TOSS
	dbw 24, MACH_PUNCH
	dbw 28, FORESIGHT
	dbw 32, BRICK_BREAK
	dbw 36, VITAL_THROW
	dbw 40, CROSS_CHOP
	dbw 45, ROCK_SLIDE
	dbw 50, BULK_UP
	dbw 55, COUNTER
	dbw 60, SUBMISSION
	dbw 65, DETECT
	dbw 70, ZEN_HEADBUTT
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 16, KARATE_CHOP
	dbw 20, SEISMIC_TOSS
	dbw 24, MACH_PUNCH
	dbw 28, FORESIGHT
	dbw 32, BRICK_BREAK
	dbw 36, VITAL_THROW
	dbw 40, CROSS_CHOP
	dbw 45, ROCK_SLIDE
	dbw 50, BULK_UP
	dbw 55, COUNTER
	dbw 60, SUBMISSION
	dbw 65, DETECT
	dbw 70, ZEN_HEADBUTT
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 16, KARATE_CHOP
	dbw 20, SEISMIC_TOSS
	dbw 24, MACH_PUNCH
	dbw 28, FORESIGHT
	dbw 32, BRICK_BREAK
	dbw 36, VITAL_THROW
	dbw 40, CROSS_CHOP
	dbw 45, ROCK_SLIDE
	dbw 50, BULK_UP
	dbw 55, COUNTER
	dbw 60, SUBMISSION
	dbw 65, DETECT
	dbw 70, ZEN_HEADBUTT
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 16, SLEEP_POWDER
	dbw 20, POISONPOWDER	
	dbw 24, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, STUN_SPORE
	dbw 36, LEECH_SEED	
	dbw 40, SLUDGE_BOMB
	dbw 45, NATURE_POWER
	dbw 50, BULK_UP
	dbw 55, BODY_SLAM
	dbw 60, SOLARBEAM
	dbw 65, TOXIC
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TSUBOMITT
	dbww EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 16, SLEEP_POWDER
	dbw 20, POISONPOWDER	
	dbw 24, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, STUN_SPORE
	dbw 36, LEECH_SEED	
	dbw 40, SLUDGE_BOMB
	dbw 45, NATURE_POWER
	dbw 50, BULK_UP
	dbw 55, BODY_SLAM
	dbw 60, SOLARBEAM
	dbw 65, TOXIC
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, VICTREEBELX
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 16, SLEEP_POWDER
	dbw 20, POISONPOWDER	
	dbw 24, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, STUN_SPORE
	dbw 36, LEECH_SEED	
	dbw 40, SLUDGE_BOMB
	dbw 45, NATURE_POWER
	dbw 50, BULK_UP
	dbw 55, BODY_SLAM
	dbw 60, SOLARBEAM
	dbw 65, TOXIC
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, GROWTH
	dbw 24, WATER_PULSE	
	dbw 28, SLUDGE
	dbw 32, AURORA_BEAM
	dbw 36, ICY_WIND	
	dbw 40, MIST_BALL
	dbw 45, GIGA_DRAIN
	dbw 50, SLUDGE_WAVE
	dbw 55, COSMIC_POWER
	dbw 60, HYDRO_PUMP
	dbw 65, POWER_GEM
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, GROWTH
	dbw 24, WATER_PULSE	
	dbw 28, SLUDGE
	dbw 32, AURORA_BEAM
	dbw 36, ICY_WIND	
	dbw 40, MIST_BALL
	dbw 45, GIGA_DRAIN
	dbw 50, SLUDGE_WAVE
	dbw 55, COSMIC_POWER
	dbw 60, HYDRO_PUMP
	dbw 65, POWER_GEM
	dbw 70, BLIZZARD
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRAVELER
	dbww EVOLVE_ITEM, THUNDERSTONE, AGEODUDE
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, MAGNITUDE
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, EARTHQUAKE
	dbw 50, SANDSTORM	
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GOLEM
	dbww EVOLVE_ITEM, THUNDERSTONE, AGRAVELER
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, MAGNITUDE
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, EARTHQUAKE
	dbw 50, SANDSTORM	
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

GolemEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, AGOLEM
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, ROLLOUT
	dbw 21, SELFDESTRUCT
	dbw 24, ROCK_TOMB
	dbw 28, MAGNITUDE
	dbw 32, CURSE
	dbw 36, EXPLOSION
	dbw 40, ROCK_SLIDE
	dbw 45, EARTHQUAKE
	dbw 50, SANDSTORM	
	dbw 55, AMNESIA	
	dbw 60, STONE_EDGE
	dbw 65, FISSURE
	dbw 70, BODY_SLAM
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 10, EMBER
	dbw 15, TAIL_WHIP
	dbw 20, DOUBLE_KICK
	dbw 24, STOMP
	dbw 28, FIRE_SPIN
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL
	dbw 45, TAKE_DOWN
	dbw 50, EXTREMESPEED
	dbw 55, DRAGON_DANCE
	dbw 60, SACRED_FIRE
	dbw 65, MEGA_KICK
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 10, EMBER
	dbw 15, TAIL_WHIP
	dbw 20, DOUBLE_KICK
	dbw 24, STOMP
	dbw 28, FIRE_SPIN
	dbw 36, SUNNY_DAY
	dbw 40, FLAME_WHEEL
	dbw 45, TAKE_DOWN
	dbw 50, EXTREMESPEED
	dbw 55, DRAGON_DANCE
	dbw 60, SACRED_FIRE
	dbw 65, MEGA_KICK
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SLOWBRO
	dbww EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 6, TACKLE
	dbw 10, GROWL
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, RECOVER
	dbw 36, AMNESIA
	dbw 40, PSYCHIC_M
	dbw 45, REST
	dbw 50, SCALD
	dbw 55, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, FUTURE_SIGHT
	dbw 70, RAIN_DANCE
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, SLOWBROX
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 6, TACKLE
	dbw 10, GROWL
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, RECOVER
	dbw 36, AMNESIA
	dbw 40, PSYCHIC_M
	dbw 45, REST
	dbw 50, SCALD
	dbw 55, SKULL_BASH
	dbw 60, HYDRO_PUMP
	dbw 65, FUTURE_SIGHT
	dbw 70, RAIN_DANCE
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, MAGNETON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 12, SUPERSONIC
	dbw 16, METAL_CLAW
	dbw 20, SONICBOOM
	dbw 24, THUNDER_WAVE
	dbw 28, SHOCK_WAVE
	dbw 32, LOCK_ON
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON	
	dbw 50, LIGHT_SCREEN
	dbw 55, REFLECT
	dbw 60, ZAP_CANNON
	dbw 65, PROTECT
	dbw 70, RECOVER
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MAGNEZONE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 12, SUPERSONIC
	dbw 16, METAL_CLAW
	dbw 20, SONICBOOM
	dbw 24, THUNDER_WAVE
	dbw 28, SHOCK_WAVE
	dbw 32, LOCK_ON
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, FLASHCANNON	
	dbw 50, LIGHT_SCREEN
	dbw 55, REFLECT
	dbw 60, ZAP_CANNON
	dbw 65, PROTECT
	dbw 70, RECOVER
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, SIRFETCH_D
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 7, KARATE_CHOP
	dbw 10, SHARPEN
	dbw 15, FALSE_SWIPE
	dbw 19, FURY_ATTACK
	dbw 24, WING_ATTACK
	dbw 28, JUMP_KICK
	dbw 32, BRICK_BREAK
	dbw 36, SWORDS_DANCE
	dbw 40, CROSS_CHOP
	dbw 45, LEAF_BLADE		
	dbw 50, SLASH
	dbw 55, SKY_ATTACK
	dbw 60, HI_JUMP_KICK
	dbw 65, PSYCHO_CUT
	dbw 70, DRAGON_DANCE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 9, BITE
	dbw 13, FURY_ATTACK
	dbw 20, RAGE
	dbw 24, AIR_CUTTER
	dbw 28, JUMP_KICK
	dbw 32, SWORDS_DANCE
	dbw 36, TRI_ATTACK
	dbw 40, DRILL_PECK
	dbw 45, AGILITY
	dbw 50, WHIRLWIND
	dbw 55, MIMIC
	dbw 60, SKY_ATTACK
	dbw 65, DOUBLE_EDGE
	dbw 70, HI_JUMP_KICK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 9, BITE
	dbw 13, FURY_ATTACK
	dbw 20, RAGE
	dbw 24, AIR_CUTTER
	dbw 28, JUMP_KICK
	dbw 32, SWORDS_DANCE
	dbw 36, TRI_ATTACK
	dbw 40, DRILL_PECK
	dbw 45, AGILITY
	dbw 50, WHIRLWIND
	dbw 55, MIMIC
	dbw 60, SKY_ATTACK
	dbw 65, DOUBLE_EDGE
	dbw 70, HI_JUMP_KICK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DEWGONG
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, REST
	dbw 20, HEADBUTT
	dbw 24, AURORA_BEAM
	dbw 28, BUBBLEBEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIRROR_COAT
	dbw 40, ICE_BEAM
	dbw 45, SCALD
	dbw 50, ICY_WIND
	dbw 55, AMNESIA
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ASHIBOMB
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, REST
	dbw 20, HEADBUTT
	dbw 24, AURORA_BEAM
	dbw 28, BUBBLEBEAM
	dbw 32, TAKE_DOWN
	dbw 36, MIRROR_COAT
	dbw 40, ICE_BEAM
	dbw 45, SCALD
	dbw 50, ICY_WIND
	dbw 55, AMNESIA
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MUK
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 10, DISABLE
	dbw 16, MINIMIZE
	dbw 20, SLAM
	dbw 22, SHADOWSNEAK
	dbw 24, SLUDGE
	dbw 28, MAGNITUDE
	dbw 32, CRUSH_CLAW
	dbw 36, COSMIC_POWER
	dbw 40, POISON_JAB
	dbw 45, CRUNCH
	dbw 50, REST
	dbw 55, EARTHQUAKE
	dbw 60, BULK_UP
	dbw 65, CRUSH_CLAW
	dbw 70, CONVERSION
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 10, DISABLE
	dbw 16, MINIMIZE
	dbw 20, SLAM
	dbw 22, SHADOWSNEAK
	dbw 24, SLUDGE
	dbw 28, MAGNITUDE
	dbw 32, CRUSH_CLAW
	dbw 36, COSMIC_POWER
	dbw 40, POISON_JAB
	dbw 45, CRUNCH
	dbw 50, REST
	dbw 55, EARTHQUAKE
	dbw 60, BULK_UP
	dbw 65, CRUSH_CLAW
	dbw 70, CONVERSION
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, CLOYSTER
	dbbw EVOLVE_LEVEL, 30, CLOYSTER
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 9, SUPERSONIC
	dbw 12, PROTECT
	dbw 16, AQUA_JET
	dbw 20, ICE_BALL
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM	
	dbw 32, ICY_WIND
	dbw 36, SPIKES
	dbw 40, ICE_BEAM
	dbw 45, RAZORSHELL
	dbw 50, AMNESIA
	dbw 55, RAPID_SPIN
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, REST
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 9, SUPERSONIC
	dbw 12, PROTECT
	dbw 16, AQUA_JET
	dbw 20, ICE_BALL
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM	
	dbw 32, ICY_WIND
	dbw 36, SPIKES
	dbw 40, ICE_BEAM
	dbw 45, RAZORSHELL
	dbw 50, AMNESIA
	dbw 55, RAPID_SPIN
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, REST
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, POISON_GAS
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_PUNCH
	dbw 32, DREAM_EATER
	dbw 36, GROWTH
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_WAVE	
	dbw 50, DARK_PULSE
	dbw 55, NIGHTMARE
	dbw 60, PERISH_SONG
	dbw 65, MEAN_LOOK
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, POISON_GAS
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_PUNCH
	dbw 32, DREAM_EATER
	dbw 36, GROWTH
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_WAVE	
	dbw 50, DARK_PULSE
	dbw 55, NIGHTMARE
	dbw 60, PERISH_SONG
	dbw 65, MEAN_LOOK
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, GENGARX
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, POISON_GAS
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_PUNCH
	dbw 32, DREAM_EATER
	dbw 36, GROWTH
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_WAVE	
	dbw 50, DARK_PULSE
	dbw 55, NIGHTMARE
	dbw 60, PERISH_SONG
	dbw 65, MEAN_LOOK
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 12, ROCK_THROW
	dbw 16, RAGE
	dbw 20, CURSE
	dbw 24, ROCK_TOMB
	dbw 28, MAGNITUDE	
	dbw 32, SANDSTORM
	dbw 36, REST
	dbw 40, ROCK_SLIDE
	dbw 45, EARTHQUAKE
	dbw 50, BULK_UP
	dbw 55, IRON_TAIL
	dbw 60, FISSURE
	dbw 65, CRUNCH
	dbw 70, COSMIC_POWER
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HYPNOSIS
	dbw 6, BITE
	dbw 10, DISABLE
	dbw 16, SHARPEN
	dbw 20, FURY_SWIPES
	dbw 24, FAINT_ATTACK
	dbw 28, PSYBEAM
	dbw 32, DIZZY_PUNCH
	dbw 36, DREAM_EATER
	dbw 40, DARK_PULSE
	dbw 45, PSYCHIC_M
	dbw 50, CALM_MIND
	dbw 55, BODY_SLAM
	dbw 60, PLAY_ROUGH
	dbw 65, FUTURE_SIGHT
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HYPNOSIS
	dbw 6, BITE
	dbw 10, DISABLE
	dbw 16, SHARPEN
	dbw 20, FURY_SWIPES
	dbw 24, FAINT_ATTACK
	dbw 28, PSYBEAM
	dbw 32, DIZZY_PUNCH
	dbw 36, DREAM_EATER
	dbw 40, DARK_PULSE
	dbw 45, PSYCHIC_M
	dbw 50, CALM_MIND
	dbw 55, BODY_SLAM
	dbw 60, PLAY_ROUGH
	dbw 65, FUTURE_SIGHT
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, METAL_CLAW
	dbw 8, LEER
	dbw 12, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 24, STOMP
	dbw 28, ROCK_SMASH
	dbw 32, PROTECT
	dbw 36, CURSE
	dbw 40, VICEGRIP
	dbw 45, AQUA_JET
	dbw 50, CRABHAMMER
	dbw 55, AMNESIA
	dbw 60, GUILLOTINE
	dbw 65, ACID_ARMOR
	dbw 70, BULK_UP	
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, KINGLERX
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, METAL_CLAW
	dbw 8, LEER
	dbw 12, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 24, STOMP
	dbw 28, ROCK_SMASH
	dbw 32, PROTECT
	dbw 36, CURSE
	dbw 40, VICEGRIP
	dbw 45, AQUA_JET
	dbw 50, CRABHAMMER
	dbw 55, AMNESIA
	dbw 60, GUILLOTINE
	dbw 65, ACID_ARMOR
	dbw 70, BULK_UP	
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	dbww EVOLVE_ITEM, LEAF_STONE, HVOLTORB
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, TACKLE
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, SLAM
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
	dbw 50, CHARGE
	dbw 55, EXPLOSION
	dbw 60, THUNDER	
	dbw 65, POWER_GEM
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, HELECTRODE
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK	
	dbw 8, THUNDER_WAVE
	dbw 12, TACKLE
	dbw 16, SELFDESTRUCT
	dbw 20, SONICBOOM	
	dbw 24, SPARK	
	dbw 28, SLAM
	dbw 32, LIGHT_SCREEN
	dbw 36, ROLLOUT
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
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
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 12, LEECH_SEED
	dbw 16, CONFUSION
	dbw 20, BARRAGE
	dbw 24, STUN_SPORE
	dbw 28, MEGA_DRAIN
	dbw 32, PSYBEAM
	dbw 36, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 45, EGG_BOMB
	dbw 50, CALM_MIND
	dbw 55, EXPLOSION
	dbw 60, AMNESIA
	dbw 65, DRAGON_CLAW
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 12, LEECH_SEED
	dbw 16, CONFUSION
	dbw 20, BARRAGE
	dbw 24, STUN_SPORE
	dbw 28, MEGA_DRAIN
	dbw 32, PSYBEAM
	dbw 36, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 45, EGG_BOMB
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
	dbw 5, TAIL_WHIP
	dbw 12, SAND_ATTACK
	dbw 16, BONE_CLUB
	dbw 20, HEADBUTT
	dbw 24, NIGHT_SHADE
	dbw 28, BONEMERANG
	dbw 32, CURSE
	dbw 36, SHADOW_CLAW
	dbw 40, BONE_RUSH
	dbw 45, SHADOW_BALL
	dbw 50, SWORDS_DANCE
	dbw 55, FLAME_WHEEL
	dbw 60, SHADOW_FORCE
	dbw 65, GLARE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, AMAROWAK
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 5, TAIL_WHIP
	dbw 12, SAND_ATTACK
	dbw 16, BONE_CLUB
	dbw 20, HEADBUTT
	dbw 24, NIGHT_SHADE
	dbw 28, BONEMERANG
	dbw 32, CURSE
	dbw 36, SHADOW_CLAW
	dbw 40, BONE_RUSH
	dbw 45, SHADOW_BALL
	dbw 50, SWORDS_DANCE
	dbw 55, FLAME_WHEEL
	dbw 60, SHADOW_FORCE
	dbw 65, GLARE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 6, SHARPEN
	dbw 12, POUND
	dbw 16, FOCUS_ENERGY
	dbw 20, ROLLING_KICK	
	dbw 24, COUNTER
	dbw 28, MIND_READER
	dbw 32, JUMP_KICK
	dbw 36, REVERSAL
	dbw 40, BLAZE_KICK
	dbw 45, DRAGON_DANCE
	dbw 50, HI_JUMP_KICK	
	dbw 55, PURSUIT	
	dbw 60, TRIPLE_KICK
	dbw 65, MEGA_KICK
	dbw 70, EXTREMESPEED	
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 7, AGILITY
	dbw 16, MACH_PUNCH
	dbw 20, SHADOW_PUNCH
	dbw 24, DIZZY_PUNCH
	dbw 28, THUNDERPUNCH
	dbw 32, ICE_PUNCH
	dbw 36, FIRE_PUNCH
	dbw 40, DYNAMICPUNCH
	dbw 30, FOCUS_PUNCH
	dbw 45, BULLET_PUNCH	
	dbw 50, MEGA_PUNCH
	dbw 55, DRAGON_DANCE
	dbw 60, DETECT
	dbw 65, COUNTER
	dbw 70, SWORDS_DANCE
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, LICKILICKY
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 7, SUPERSONIC
	dbw 13, DEFENSE_CURL
	dbw 15, POUND
	dbw 20, ROLLOUT
	dbw 24, STOMP	
	dbw 28, DISABLE
	dbw 32, SCREECH
	dbw 36, THUNDER_FANG
	dbw 40, BODY_SLAM	
	dbw 45, CRUNCH	
	dbw 50, ICE_FANG
	dbw 55, FIRE_FANG
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, WEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 10, SMOG
	dbw 14, SMOKESCREEN
	dbw 18, SELFDESTRUCT
	dbw 24, SLUDGE
	dbw 28, FIRE_SPIN	
	dbw 32, WILLOWISP
	dbw 36, CURSE
	dbw 40, FLAMETHROWER
	dbw 45, SLUDGE_BOMB
	dbw 50, EXPLOSION
	dbw 55, HAZE	
	dbw 60, AMNESIA
	dbw 65, FIRE_BLAST
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, GWEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 10, SMOG
	dbw 14, SMOKESCREEN
	dbw 18, SELFDESTRUCT
	dbw 24, SLUDGE
	dbw 28, FIRE_SPIN	
	dbw 32, WILLOWISP
	dbw 36, CURSE
	dbw 40, FLAMETHROWER
	dbw 45, SLUDGE_BOMB
	dbw 50, EXPLOSION
	dbw 55, HAZE	
	dbw 60, AMNESIA
	dbw 65, FIRE_BLAST
	dbw 70, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, RHYDON
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 24, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 32, SCARY_FACE
	dbw 36, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 45, DRAGON_CLAW	
	dbw 50, DRAGON_DANCE
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 65, SANDSTORM
	dbw 70, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	dbbw EVOLVE_LEVEL, 44, RHYPERIOR
	db 0 ; no more evolutions	
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 24, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 32, SCARY_FACE
	dbw 36, TAKE_DOWN
	dbw 40, ROCK_SLIDE
	dbw 45, DRAGON_CLAW	
	dbw 50, DRAGON_DANCE
	dbw 55, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 65, SANDSTORM
	dbw 70, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 5, GROWL
	dbw 9, TAIL_WHIP
	dbw 13, SOFTBOILED
	dbw 17, DOUBLESLAP
	dbw 23, MINIMIZE
	dbw 29, SING
	dbw 32, EGG_BOMB
	dbw 36, CALM_MIND
	dbw 40, HYPER_VOICE
	dbw 42, LIGHT_SCREEN
	dbw 45, REFLECT
	dbw 50, DOUBLE_EDGE
	dbw 55, BULK_UP
	dbw 60, MOONBLAST
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, TANGROWTH
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 4, SLEEP_POWDER
	dbw 10, ABSORB
	dbw 13, POISONPOWDER
	dbw 18, VINE_WHIP
	dbw 24, SLAM
	dbw 28, STUN_SPORE
	dbw 32, GROWTH
	dbw 36, LEECH_SEED
	dbw 40, GIGA_DRAIN
	dbw 45, BODY_SLAM	
	dbw 50, NATURE_POWER	
	dbw 55, AMNESIA
	dbw 60, SOLARBEAM
	dbw 65, SPORE
	dbw 70, DARK_PULSE
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 5, POUND
	dbw 8, LEER
	dbw 12, BITE
	dbw 16, GROWL
	dbw 20, SLAM
	dbw 24, DIZZY_PUNCH
	dbw 28, COMET_PUNCH
	dbw 32, MAGNITUDE
	dbw 36, CRUSH_CLAW
	dbw 40, THRASH
	dbw 45, CRUNCH
	dbw 50, SWORDS_DANCE	
	dbw 55, REVERSAL
	dbw 60, DOUBLE_EDGE
	dbw 65, ENDURE
	dbw 70, OUTRAGE	
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, SEADRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, WATER_GUN
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, DRAGON_RAGE	
	dbw 36, RAIN_DANCE
	dbw 40, DRAGONBREATH
	dbw 45, MIST_BALL
	dbw 50, RECOVER
	dbw 55, AGILITY
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA	
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	dbww EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	dbbw EVOLVE_LEVEL, 40, KINGDRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, WATER_GUN
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 32, DRAGON_RAGE	
	dbw 36, RAIN_DANCE
	dbw 40, DRAGONBREATH
	dbw 45, MIST_BALL
	dbw 50, RECOVER
	dbw 55, AGILITY
	dbw 60, HYDRO_PUMP
	dbw 65, AMNESIA	
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, SEAKING
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 15, HORN_ATTACK
	dbw 20, GROWTH
	dbw 24, BUBBLEBEAM
	dbw 28, WING_ATTACK
	dbw 32, FLAIL
	dbw 36, DRILL_PECK
	dbw 40, WATERFALL
	dbw 45, HORN_DRILL
	dbw 50, SWORDS_DANCE
	dbw 55, MUDDY_WATER
	dbw 60, HYDRO_PUMP
	dbw 65, HURRICANE
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 15, HORN_ATTACK
	dbw 20, GROWTH
	dbw 24, BUBBLEBEAM
	dbw 28, WING_ATTACK
	dbw 32, FLAIL
	dbw 36, DRILL_PECK
	dbw 40, WATERFALL
	dbw 45, HORN_DRILL
	dbw 50, SWORDS_DANCE
	dbw 55, MUDDY_WATER
	dbw 60, HYDRO_PUMP
	dbw 65, HURRICANE
	dbw 70, MEGAHORN
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, STARMIE
	dbbw EVOLVE_LEVEL, 36, STARMIE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 8, WATER_GUN
	dbw 16, RECOVER
	dbw 22, RAPID_SPIN
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM
	dbw 32, AURORA_BEAM
	dbw 40, PSYCHIC_M
	dbw 45, MIST_BALL
	dbw 50, LIGHT_SCREEN
	dbw 55, POWER_GEM
	dbw 60, HYDRO_PUMP
	dbw 65, COSMIC_POWER
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 8, WATER_GUN
	dbw 16, RECOVER
	dbw 22, RAPID_SPIN
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM
	dbw 32, AURORA_BEAM
	dbw 40, PSYCHIC_M
	dbw 45, MIST_BALL
	dbw 50, LIGHT_SCREEN
	dbw 55, POWER_GEM
	dbw 60, HYDRO_PUMP
	dbw 65, COSMIC_POWER
	dbw 70, FLASHCANNON
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	dbww EVOLVE_ITEM, ICE_STONE, MR__RIME
	db 0 ; no more evolutions
	dbw 1, BARRIER
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 16, KINESIS
	dbw 20, DIZZY_PUNCH
	dbw 24, PSYBEAM
	dbw 28, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 36, ENCORE
	dbw 40, PSYCHIC_M
	dbw 45, MOONBLAST
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
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, FURY_CUTTER
	dbw 36, RAZOR_WIND
	dbw 40, SLASH	
	dbw 45, SWORDS_DANCE
	dbw 50, LEAF_BLADE
	dbw 55, DOUBLE_TEAM	
	dbw 60, SKY_ATTACK
	dbw 65, PSYCHO_CUT
	dbw 70, AERIAL_ACE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, JYNXX
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LICK
	dbw 9, LOVELY_KISS
	dbw 13, POWDER_SNOW
	dbw 18, DOUBLESLAP
	dbw 24, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 32, ICY_WIND
	dbw 36, PERISH_SONG
	dbw 40, PSYCHIC_M
	dbw 45, ICE_BEAM
	dbw 50, CALM_MIND
	dbw 55, HYPER_VOICE
	dbw 60, BLIZZARD
	dbw 55, FUTURE_SIGHT
	dbw 70, MEDITATE
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ELECTIVIRE
	db 0 ; no more evolutions	
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 12, QUICK_ATTACK	
	dbw 17, LIGHT_SCREEN
	dbw 20, MACH_PUNCH
	dbw 24, DIZZY_PUNCH	
	dbw 28, THUNDERPUNCH
	dbw 32, THUNDER_WAVE
	dbw 36, CONFUSE_RAY
	dbw 40, THUNDERBOLT
	dbw 45, FAERIEGLEAM
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
	dbw 13, TAIL_WHIP
	dbw 18, SMOG
	dbw 20, MACH_PUNCH
	dbw 24, SMOKESCREEN
	dbw 28, FIRE_PUNCH
	dbw 32, WILLOWISP
	dbw 36, SUNNY_DAY
	dbw 40, FLAMETHROWER
	dbw 45, SLUDGE_WAVE
	dbw 50, BRICK_BREAK
	dbw 55, PSYCHIC_M
	dbw 60, FIRE_BLAST	
	dbw 65, CONFUSE_RAY
	dbw 70, ERUPTION
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, PINSIRX
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, BIND
	dbw 18, FURY_ATTACK
	dbw 24, TWINEEDLE
	dbw 28, HARDEN
	dbw 36, SLASH
	dbw 40, PURSUIT
	dbw 45, MEGAHORN
	dbw 50, DRAGON_DANCE
	dbw 55, SUBMISSION
	dbw 60, GUILLOTINE	
	dbw 65, DOUBLE_EDGE
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, TAIL_WHIP
	dbw 12, LOW_KICK
	dbw 16, RAGE
	dbw 20, SCARY_FACE
	dbw 24, DOUBLE_KICK	
	dbw 28, HORN_ATTACK
	dbw 32, MAGNITUDE
	dbw 36, BRICK_BREAK
	dbw 40, EARTHQUAKE
	dbw 45, BODY_SLAM
	dbw 50, BULK_UP
	dbw 55, OUTRAGE
	dbw 60, SUBMISSION
	dbw 65, DOUBLE_EDGE
	dbw 70, FISSURE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GYARADOS
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 10, BUBBLE
	dbw 15, TACKLE
	dbw 20, BUBBLEBEAM
	dbw 24, DRAGON_RAGE	
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, GYARADOSX
	db 0 ; no more evolutions
	dbw 1, THRASH
	dbw 20, BITE
	dbw 25, ICE_FANG
	dbw 28, AQUA_JET
	dbw 32, FIRE_FANG
	dbw 36, THUNDER_FANG
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH	
	dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, HYPER_BEAM
	dbw 70, OUTRAGE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, SING
	dbw 8, MIST
	dbw 16, TWISTER
	dbw 20, CONFUSE_RAY
	dbw 24, AURORA_BEAM
	dbw 28, PERISH_SONG
	dbw 32, SAFEGUARD
	dbw 36, DRAGONBREATH
	dbw 40, ICE_BEAM
	dbw 42, HAIL
	dbw 45, COSMIC_POWER
	dbw 50, SURF
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, ICICLE_CRASH
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
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, BITE
	dbw 24, STOMP	
	dbw 28, BATON_PASS
	dbw 40, BODY_SLAM
	dbw 45, FAERIEGLEAM
	dbw 50, AGILITY
	dbw 55, RECOVER
	dbw 60, OUTRAGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, BITE
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM	
	dbw 32, BATON_PASS
	dbw 36, ACID_ARMOR
	dbw 40, SCALD
	dbw 45, ICE_BEAM
	dbw 50, AMNESIA
	dbw 55, RECOVER
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, WATER_SPOUT
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, THUNDER_WAVE
	dbw 24, SPARK
	dbw 28, TWINEEDLE
	dbw 32, SPIKES
	dbw 36, CHARGE
	dbw 40, THUNDERBOLT
	dbw 45, PIN_MISSILE
	dbw 50, CRUNCH
	dbw 55, RAIN_DANCE
	dbw 60, THUNDER
	dbw 65, ZAP_CANNON
	dbw 70, SHOCKSLAM
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, QUICK_ATTACK
	dbw 20, WILLOWISP
	dbw 24, FIRE_FANG
	dbw 28, ROLLING_KICK
	dbw 32, POISON_FANG
	dbw 36, DRAGON_DANCE
	dbw 40, FLAME_WHEEL
	dbw 45, CRUNCH	
	dbw 50, BODY_SLAM
	dbw 60, FIRE_BLAST
	dbw 65, SUBMISSION
	dbw 70, SACRED_FIRE
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbww EVOLVE_ITEM, UP_GRADE, PORYGON2
	dbbw EVOLVE_LEVEL, 32, PORYGON2
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 16, RECOVER
	dbw 20, THUNDER_WAVE
	dbw 24, SHOCK_WAVE
	dbw 28, PSYBEAM	
	dbw 32, CHARGE
	dbw 36, TRI_ATTACK	
	dbw 40, THUNDERBOLT
	dbw 45, MIRROR_COAT	
	dbw 50, HYPER_BEAM
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	dbw 65, HYPER_VOICE
	dbw 70, TRANSFORM
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, OMASTAR
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 10, ROCK_THROW
	dbw 14, WATER_GUN
	dbw 20, ANCIENTPOWER
	dbw 24, BUBBLEBEAM
	dbw 28, ROCK_TOMB
	dbw 32, MUD_SHOT
	dbw 36, PROTECT
	dbw 40, POWER_GEM
	dbw 45, MUDDY_WATER
	dbw 50, SANDSTORM
	dbw 55, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, COSMIC_POWER
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 10, ROCK_THROW
	dbw 14, WATER_GUN
	dbw 20, ANCIENTPOWER
	dbw 24, BUBBLEBEAM
	dbw 28, ROCK_TOMB
	dbw 32, MUD_SHOT
	dbw 36, PROTECT
	dbw 40, POWER_GEM
	dbw 45, MUDDY_WATER
	dbw 50, SANDSTORM
	dbw 55, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, COSMIC_POWER
	dbw 70, STONE_EDGE
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, KABUTOPS
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, HARDEN
	dbw 5, ROCK_THROW
	dbw 10, ABSORB
	dbw 12, LEER
	dbw 16, SAND_ATTACK
	dbw 20, ANCIENTPOWER
	dbw 24, ICICLE_SPEAR
	dbw 28, ROCK_TOMB
	dbw 32, AQUA_JET
	dbw 36, SANDSTORM
	dbw 40, SLASH
	dbw 45, ROCK_SLIDE
	dbw 50, ICICLE_CRASH
	dbw 55, SWORDS_DANCE
	dbw 60, GIGA_DRAIN
	dbw 65, BLIZZARD
	dbw 70, SHADOW_CLAW
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, HARDEN
	dbw 5, ROCK_THROW
	dbw 10, ABSORB
	dbw 12, LEER
	dbw 16, SAND_ATTACK
	dbw 20, ANCIENTPOWER
	dbw 24, ICICLE_SPEAR
	dbw 28, ROCK_TOMB
	dbw 32, AQUA_JET
	dbw 36, SANDSTORM
	dbw 40, SLASH
	dbw 45, ROCK_SLIDE
	dbw 50, ICICLE_CRASH
	dbw 55, SWORDS_DANCE
	dbw 60, GIGA_DRAIN
	dbw 65, BLIZZARD
	dbw 70, SHADOW_CLAW
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, AERODACTYLX
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 8, ROCK_THROW
	dbw 12, BITE
	dbw 16, SUPERSONIC
	dbw 20, SCARY_FACE
	dbw 24, WING_ATTACK	
	dbw 28, ANCIENTPOWER	
	dbw 32, ROCK_TOMB
	dbw 36, DRAGON_DANCE
	dbw 40, DRILL_PECK
	dbw 45, ROCK_SLIDE	
	dbw 50, CRUNCH
	dbw 55, DRAGON_CLAW
	dbw 60, STONE_EDGE
	dbw 65, SKY_ATTACK
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 8, AMNESIA
	dbw 15, DEFENSE_CURL
	dbw 20, STOMP
	dbw 24, HEADBUTT
	dbw 28, SNORE
	dbw 32, REST
	dbw 36, CRUSH_CLAW
	dbw 40, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, BELLY_DRUM
	dbw 55, OUTRAGE
	dbw 60, EARTHQUAKE
	dbw 60, HYPER_BEAM
	dbw 65, DOUBLE_EDGE
	dbw 70, CRUNCH
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, POWDER_SNOW
	dbw 8, CONFUSION
	dbw 13, MIST
	dbw 20, ICY_WIND
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, AURORA_BEAM
	dbw 36, PSYBEAM
	dbw 40, HAIL
	dbw 45, RAZOR_WIND
	dbw 50, ICE_BEAM
	dbw 55, PSYCHIC_M
	dbw 65, BLIZZARD	
	dbw 65, REFLECT
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, THUNDERSHOCK
	dbw 8, DOUBLE_KICK
	dbw 13, MIST
	dbw 20, THUNDER_WAVE
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, SHOCK_WAVE
	dbw 36, JUMP_KICK
	dbw 40, DETECT
	dbw 45, DRILL_PECK
	dbw 50, THUNDERBOLT
	dbw 55, HURRICANE
	dbw 60, THUNDER
	dbw 65, LIGHT_SCREEN
	dbw 70, SUBMISSION
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, EMBER
	dbw 8, BITE
	dbw 13, MIST
	dbw 20, WILLOWISP
	dbw 24, WING_ATTACK
	dbw 28, AGILITY
	dbw 32, FIRE_SPIN
	dbw 36, FAINT_ATTACK
	dbw 40, ENDURE
	dbw 45, DRILL_PECK
	dbw 50, FLAMETHROWER
	dbw 55, PURSUIT
	dbw 60, FIRE_BLAST
	dbw 65, SOLARBEAM
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 24, SLAM
	dbw 28, DRAGON_RAGE	
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, DETECT
	dbw 60, OUTRAGE	
	dbw 65, DRAGON_DANCE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 24, SLAM
	dbw 28, DRAGON_RAGE	
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, DETECT
	dbw 60, OUTRAGE	
	dbw 65, DRAGON_DANCE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, DRAGONITEX
	dbww EVOLVE_ITEM, KANTOITE_Y, DRAGONITEY
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 24, SLAM
	dbw 28, DRAGON_RAGE	
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 40, DRAGON_CLAW
	dbw 45, CRUNCH
	dbw 50, EXTREMESPEED
	dbw 55, DETECT
	dbw 60, OUTRAGE	
	dbw 65, DRAGON_DANCE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LOW_KICK
	dbw 11, BARRIER
	dbw 22, PSYBEAM
	dbw 27, PSYCHO_CUT
	dbw 33, KINESIS
	dbw 40, PSYCHIC_M
	dbw 45, AURA_SPHERE
	dbw 50, RECOVER
	dbw 55, MEDITATE
	dbw 60, FUTURE_SIGHT
	dbw 65, SHADOW_BALL
	dbw 70, FOCUS_PUNCH
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 10, TRANSFORM
	dbw 20, ANCIENTPOWER
	dbw 24, PSYBEAM
	dbw 28, FAE_VOICE	
	dbw 30, METRONOME	
	dbw 32, MEGA_PUNCH
	dbw 36, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 45, MOONBLAST
	dbw 50, BATON_PASS
	dbw 55, PURSUIT	
	dbw 60, AURA_SPHERE
	dbw 65, BULK_UP
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

ENDSECTION

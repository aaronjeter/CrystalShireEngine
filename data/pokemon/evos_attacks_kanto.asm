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
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS	
	dbw 26, SLUDGE
	dbw 30, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLUDGE_BOMB
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
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
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS	
	dbw 26, SLUDGE
	dbw 30, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLUDGE_BOMB
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
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
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS	
	dbw 26, SLUDGE
	dbw 30, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLUDGE_BOMB
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
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
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAMETHROWER	
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, BLAST_BURN
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
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAMETHROWER	
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, BLAST_BURN
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
	dbw 20, FIRE_FANG
	dbw 24, SCARY_FACE
	dbw 30, AIR_CUTTER
	dbw 36, FLAMETHROWER	
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, BLAST_BURN
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
	dbw 20, BUBBLEBEAM
	dbw 24, RAPID_SPIN
	dbw 28, PROTECT
	dbw 31, RAIN_DANCE
	dbw 36, MIST_BALL
	dbw 40, FLASHCANNON
	dbw 44, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, BODY_SLAM
	dbw 60, HYDRO_CANNON
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
	dbw 20, BUBBLEBEAM
	dbw 24, RAPID_SPIN
	dbw 28, PROTECT
	dbw 31, RAIN_DANCE
	dbw 36, MIST_BALL
	dbw 40, FLASHCANNON
	dbw 44, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, BODY_SLAM
	dbw 60, HYDRO_CANNON
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
	dbw 20, BUBBLEBEAM
	dbw 24, RAPID_SPIN
	dbw 28, PROTECT
	dbw 31, RAIN_DANCE
	dbw 36, MIST_BALL
	dbw 40, FLASHCANNON
	dbw 44, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, BODY_SLAM
	dbw 60, HYDRO_CANNON
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
	dbw 32, CALM_MIND
	dbw 36, SIGNAL_BEAM
	dbw 40, MOONBLAST
	dbw 42, EXTRASENSORY
	dbw 45, SAFEGUARD
	dbw 50, MOONLIGHT
	dbw 55, GIGA_DRAIN
	dbw 60, LUSTER_PURGE
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
	dbw 1, FURY_ATTACK
	dbw 1, STRING_SHOT
	dbw 10, FURY_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, TWINEEDLE
	dbw 24, RAGE
	dbw 32, DRAGON_DANCE
	dbw 36, PURSUIT
	dbw 40, PIN_MISSILE	
	dbw 42, AGILITY
	dbw 45, SLUDGE_BOMB
	dbw 50, MEGAHORN
	dbw 55, MEAN_LOOK
	dbw 60, SWORDS_DANCE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 20, WING_ATTACK
	dbw 24, SLAM
	dbw 30, STEEL_WING	
	dbw 36, DRILL_PECK
	dbw 40, EXTREMESPEED
	dbw 42, AGILITY
	dbw 45, MIRROR_MOVE
	dbw 50, SKY_ATTACK	
	dbw 55, DRAGON_CLAW
	dbw 60, AEROBLAST
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 20, WING_ATTACK
	dbw 24, SLAM
	dbw 30, STEEL_WING	
	dbw 36, DRILL_PECK
	dbw 40, EXTREMESPEED
	dbw 42, AGILITY
	dbw 45, MIRROR_MOVE
	dbw 50, SKY_ATTACK	
	dbw 55, DRAGON_CLAW
	dbw 60, AEROBLAST
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SAND_ATTACK
	dbw 8, GUST
	dbw 12, QUICK_ATTACK
	dbw 16, WHIRLWIND
	dbw 20, WING_ATTACK
	dbw 24, SLAM
	dbw 30, STEEL_WING	
	dbw 36, DRILL_PECK
	dbw 40, EXTREMESPEED
	dbw 42, AGILITY
	dbw 45, MIRROR_MOVE
	dbw 50, SKY_ATTACK	
	dbw 55, DRAGON_CLAW
	dbw 60, AEROBLAST
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 18, SHARPEN	
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 36, CRUNCH
	dbw 40, SUPER_FANG
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SWORDS_DANCE
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, FOCUS_ENERGY
	dbw 18, SHARPEN	
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, BULK_UP
	dbw 36, CRUNCH
	dbw 40, SUPER_FANG
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SWORDS_DANCE
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 18, WING_ATTACK
	dbw 22, FAINT_ATTACK
	dbw 25, SHARPEN
	dbw 31, MIRROR_MOVE
	dbw 36, DRILL_PECK
	dbw 40, PURSUIT
	dbw 42, AGILITY
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
	dbw 55, SWORDS_DANCE
	dbw 60, AEROBLAST
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 18, WING_ATTACK
	dbw 22, FAINT_ATTACK
	dbw 25, SHARPEN
	dbw 31, MIRROR_MOVE
	dbw 36, DRILL_PECK
	dbw 40, PURSUIT
	dbw 42, AGILITY
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
	dbw 55, SWORDS_DANCE
	dbw 60, AEROBLAST
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE
	dbw 22, TWINEEDLE
	dbw 26, POISON_FANG
	dbw 30, DIG
	dbw 36, CRUNCH
	dbw 40, POISON_JAB
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, DRAGON_DANCE
	dbw 55, HAZE
	dbw 60, SCREECH
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE
	dbw 22, TWINEEDLE
	dbw 26, POISON_FANG
	dbw 30, DIG
	dbw 36, CRUNCH
	dbw 40, POISON_JAB
	dbw 42, AGILITY
	dbw 45, EXTREMESPEED
	dbw 50, DRAGON_DANCE
	dbw 55, HAZE
	dbw 60, SCREECH
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
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, SHOCK_WAVE
	dbw 31, AGILITY
	dbw 36, THUNDERBOLT
	dbw 40, FAERIEGLEAM
	dbw 42, MEDITATE
	dbw 45, THUNDER
	dbw 50, LIGHT_SCREEN
	dbw 55, GROWTH
	dbw 60, VOLT_TACKLE
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
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, SHOCK_WAVE
	dbw 31, AGILITY
	dbw 36, THUNDERBOLT
	dbw 40, FAERIEGLEAM
	dbw 42, MEDITATE
	dbw 45, THUNDER
	dbw 50, LIGHT_SCREEN
	dbw 55, GROWTH
	dbw 60, VOLT_TACKLE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
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
	dbw 36, EARTHQUAKE
	dbw 40, SLUDGE_BOMB
	dbw 42, BULK_UP
	dbw 45, CRUNCH
	dbw 50, BODY_SLAM	
	dbw 55, REST
	dbw 60, FISSURE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, CLEFABLE
	dbbw EVOLVE_LEVEL, 36, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP	
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 30, GLARE
	dbw 36, MOONBLAST
	dbw 38, MOONLIGHT
	dbw 40, REFLECT
	dbw 42, CALM_MIND
	dbw 45, METEOR_MASH
	dbw 50, COSMIC_POWER	
	dbw 55, PLAY_ROUGH
	dbw 60, MEDITATE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP	
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, DRAININGKISS
	dbw 30, GLARE
	dbw 36, MOONBLAST
	dbw 38, MOONLIGHT
	dbw 40, REFLECT
	dbw 42, CALM_MIND
	dbw 45, METEOR_MASH
	dbw 50, COSMIC_POWER	
	dbw 55, PLAY_ROUGH
	dbw 60, MEDITATE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, NINETALES
	dbww EVOLVE_ITEM, ICE_STONE, AVULPIX
	dbbw EVOLVE_LEVEL, 36, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LICK
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, HYPNOSIS
	dbw 28, CURSE
	dbw 32, RECOVER
	dbw 36, FLAMETHROWER
	dbw 40, SHADOW_BALL
	dbw 42, DESTINY_BOND
	dbw 45, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, SOLARBEAM
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	dbww EVOLVE_ITEM, ICE_STONE, ANINETALES
	dbww EVOLVE_ITEM, KANTOITE_X, NINETALES2
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LICK
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, HYPNOSIS
	dbw 28, CURSE
	dbw 32, RECOVER
	dbw 36, FLAMETHROWER
	dbw 40, SHADOW_BALL
	dbw 42, DESTINY_BOND
	dbw 45, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, SOLARBEAM
	dbw 60, BLAST_BURN
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
	dbw 32, COSMIC_POWER
	dbw 36, MOONBLAST
	dbw 40, REST
	dbw 45, BULK_UP
	dbw 50, CALM_MIND
	dbw 55, BODY_SLAM
	dbw 60, DOUBLE_EDGE
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
	dbw 32, COSMIC_POWER
	dbw 36, MOONBLAST
	dbw 40, REST
	dbw 45, BULK_UP
	dbw 50, CALM_MIND
	dbw 55, BODY_SLAM
	dbw 60, DOUBLE_EDGE
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
	dbw 32, CRUNCH
	dbw 36, SLUDGE_BOMB
	dbw 40, AGILITY
	dbw 42, HAZE
	dbw 45, EXTREMESPEED
	dbw 50, BELLY_DRUM
	dbw 55, SKY_ATTACK
	dbw 60, HYPER_BEAM
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
	dbw 32, CRUNCH
	dbw 36, SLUDGE_BOMB
	dbw 40, AGILITY
	dbw 42, HAZE
	dbw 45, EXTREMESPEED
	dbw 50, BELLY_DRUM
	dbw 55, SKY_ATTACK
	dbw 60, HYPER_BEAM
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
	dbw 22, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, GIGA_DRAIN	
	dbw 40, PURSUIT
	dbw 42, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	dbw 55, SAFEGUARD
	dbw 60, FRENZY_PLANT
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
	dbw 22, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, GIGA_DRAIN	
	dbw 40, PURSUIT
	dbw 42, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	dbw 55, SAFEGUARD
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 22, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 32, GROWTH
	dbw 36, GIGA_DRAIN	
	dbw 40, PURSUIT
	dbw 42, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	dbw 55, SAFEGUARD
	dbw 60, FRENZY_PLANT
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
	dbw 27, SLAM
	dbw 32, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLASH
	dbw 42, GIGA_DRAIN
	dbw 45, SPORE
	dbw 50, SOLARBEAM
	dbw 55, SHADOW_CLAW
	dbw 60, SWORDS_DANCE
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
	dbw 27, SLAM
	dbw 32, GROWTH
	dbw 36, LEAF_BLADE
	dbw 40, SLASH
	dbw 42, GIGA_DRAIN
	dbw 45, SPORE
	dbw 50, SOLARBEAM
	dbw 55, SHADOW_CLAW
	dbw 60, SWORDS_DANCE
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
	dbw 36, PSYCHIC_M
	dbw 40, SIGNAL_BEAM	
	dbw 42, MEDITATE
	dbw 45, DETECT
	dbw 50, GIGA_DRAIN
	dbw 55, AMNESIA
	dbw 60, FUTURE_SIGHT
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
	dbw 36, PSYCHIC_M
	dbw 40, SIGNAL_BEAM	
	dbw 42, MEDITATE
	dbw 45, DETECT
	dbw 50, GIGA_DRAIN
	dbw 55, AMNESIA
	dbw 60, FUTURE_SIGHT
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
	dbw 24, SLAM
	dbw 32, ROCK_SLIDE	
	dbw 36, EARTHQUAKE
	dbw 40, TRI_ATTACK
	dbw 45, PURSUIT
	dbw 50, FISSURE	
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 5, GROWL
	dbw 12, ROCK_THROW
	dbw 16, SHARPEN
	dbw 20, DIG
	dbw 24, SLAM
	dbw 32, ROCK_SLIDE	
	dbw 36, EARTHQUAKE
	dbw 40, TRI_ATTACK
	dbw 45, PURSUIT
	dbw 50, FISSURE	
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
	dbw 32, CRUSH_CLAW
	dbw 36, CRUNCH
	dbw 40, SLASH
	dbw 42, PLAY_ROUGH
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	dbw 55, PURSUIT
	dbw 60, AGILITY
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
	dbw 32, CRUSH_CLAW
	dbw 36, CRUNCH
	dbw 40, SLASH
	dbw 42, PLAY_ROUGH
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	dbw 55, PURSUIT
	dbw 60, AGILITY
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
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, MEDITATE
	dbw 60, HYDRO_CANNON
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
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, MEDITATE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEER
	dbw 8, DOUBLE_KICK
	dbw 12, LOW_KICK
	dbw 16, MAGNITUDE
	dbw 20, FURY_SWIPES
	dbw 22, SHADOWSNEAK
	dbw 24, SHADOW_PUNCH
	dbw 28, MACH_PUNCH
	dbw 30, SEISMIC_TOSS
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE
	dbw 50, SUPERPOWER
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, ANNIHILAPE
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEER
	dbw 8, DOUBLE_KICK
	dbw 12, LOW_KICK
	dbw 16, MAGNITUDE
	dbw 20, FURY_SWIPES
	dbw 22, SHADOWSNEAK
	dbw 24, SHADOW_PUNCH
	dbw 28, MACH_PUNCH
	dbw 30, SEISMIC_TOSS
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE
	dbw 50, SUPERPOWER
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ARCANINE
	dbbw EVOLVE_LEVEL, 36, ARCANINE
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ROAR
	dbw 5, EMBER
	dbw 10, SAND_ATTACK
	dbw 16, DOUBLE_KICK
	dbw 20, MUD_SLAP
	dbw 24, FIRE_FANG
	dbw 30, GROWTH
	dbw 32, FLAME_WHEEL
	dbw 36, FLAMETHROWER
	dbw 40, CRUSH_CLAW
	dbw 42, AGILITY
	dbw 46, PURSUIT
	dbw 50, FIRE_BLAST
	dbw 55, EXTREMESPEED
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ROAR
	dbw 5, EMBER
	dbw 10, SAND_ATTACK
	dbw 16, DOUBLE_KICK
	dbw 20, MUD_SLAP
	dbw 24, FIRE_FANG
	dbw 30, GROWTH
	dbw 32, FLAME_WHEEL
	dbw 36, FLAMETHROWER
	dbw 40, CRUSH_CLAW
	dbw 42, AGILITY
	dbw 46, PURSUIT
	dbw 50, FIRE_BLAST
	dbw 55, EXTREMESPEED
	dbw 60, ERUPTION
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
	dbw 27, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 42, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, HYDRO_PUMP
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
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
	dbw 27, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 42, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, HYDRO_PUMP
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 27, MACH_PUNCH
	dbw 32, RAIN_DANCE
	dbw 36, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 42, BODY_SLAM
	dbw 45, BULK_UP
	dbw 50, HYDRO_PUMP
	dbw 55, MIND_READER
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ALAKAZAM
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 24, PSYBEAM
	dbw 26, RECOVER
	dbw 32, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, FLASHCANNON
	dbw 42, FOCUS_PUNCH
	dbw 45, REFLECT	
	dbw 50, LIGHT_SCREEN
	dbw 55, AURA_SPHERE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, ALAKAZAMX
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 24, PSYBEAM
	dbw 26, RECOVER
	dbw 32, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, FLASHCANNON
	dbw 42, FOCUS_PUNCH
	dbw 45, REFLECT	
	dbw 50, LIGHT_SCREEN
	dbw 55, AURA_SPHERE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 12, KARATE_CHOP
	dbw 16, SEISMIC_TOSS
	dbw 20, MACH_PUNCH
	dbw 25, FORESIGHT
	dbw 31, BRICK_BREAK
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, ZEN_HEADBUTT
	dbw 55, VITAL_THROW
	dbw 60, FISSURE
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 12, KARATE_CHOP
	dbw 16, SEISMIC_TOSS
	dbw 20, MACH_PUNCH
	dbw 25, FORESIGHT
	dbw 31, BRICK_BREAK
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, ZEN_HEADBUTT
	dbw 55, VITAL_THROW
	dbw 60, FISSURE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 12, KARATE_CHOP
	dbw 16, SEISMIC_TOSS
	dbw 20, MACH_PUNCH
	dbw 25, FORESIGHT
	dbw 31, BRICK_BREAK
	dbw 32, BULK_UP
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, ZEN_HEADBUTT
	dbw 55, VITAL_THROW
	dbw 60, FISSURE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 15, SLEEP_POWDER
	dbw 17, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 23, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, BULK_UP
	dbw 36, SLUDGE_BOMB
	dbw 40, NATURE_POWER
	dbw 42, LEECH_SEED
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TSUBOMITT
	dbww EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 15, SLEEP_POWDER
	dbw 17, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 23, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, BULK_UP
	dbw 36, SLUDGE_BOMB
	dbw 40, NATURE_POWER
	dbw 42, LEECH_SEED
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, VICTREEBELX
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 1, ACID
	dbw 6, GROWTH
	dbw 11, WRAP
	dbw 15, SLEEP_POWDER
	dbw 17, POISONPOWDER
	dbw 19, STUN_SPORE
	dbw 23, RAZOR_LEAF
	dbw 28, SWEET_SCENT
	dbw 32, BULK_UP
	dbw 36, SLUDGE_BOMB
	dbw 40, NATURE_POWER
	dbw 42, LEECH_SEED
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	dbw 55, TOXIC
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, AURORA_BEAM
	dbw 24, BUBBLEBEAM
	dbw 28, SLUDGE
	dbw 32, ICY_WIND
	dbw 36, GIGA_DRAIN
	dbw 40, MUDDY_WATER
	dbw 42, GROWTH
	dbw 45, SLUDGE_WAVE
	dbw 50, HYDRO_PUMP
	dbw 55, POWER_GEM
	dbw 60, COSMIC_POWER
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, CLAMP
	dbw 16, WRAP
	dbw 20, AURORA_BEAM
	dbw 24, BUBBLEBEAM
	dbw 28, SLUDGE
	dbw 32, ICY_WIND
	dbw 36, GIGA_DRAIN
	dbw 40, MUDDY_WATER
	dbw 42, GROWTH
	dbw 45, SLUDGE_WAVE
	dbw 50, HYDRO_PUMP
	dbw 55, POWER_GEM
	dbw 60, COSMIC_POWER
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
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, FISSURE
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
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, FISSURE
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
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, CURSE
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	dbw 55, STONE_EDGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, DOUBLE_KICK
	dbw 20, STOMP
	dbw 26, FIRE_SPIN
	dbw 32, FLAME_WHEEL
	dbw 36, TAKE_DOWN
	dbw 40, EXTREMESPEED
	dbw 42, DRAGON_DANCE
	dbw 45, MEGAHORN
	dbw 50, SACRED_FIRE
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, RAPIDASH2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, DOUBLE_KICK
	dbw 20, STOMP
	dbw 26, FIRE_SPIN
	dbw 32, FLAME_WHEEL
	dbw 36, TAKE_DOWN
	dbw 40, EXTREMESPEED
	dbw 42, DRAGON_DANCE
	dbw 45, MEGAHORN
	dbw 50, SACRED_FIRE
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SLOWBRO
	dbww EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, AMNESIA
	dbw 36, PSYCHIC_M
	dbw 40, REST
	dbw 42, SCALD
	dbw 45, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, FUTURE_SIGHT
	dbw 60, RAIN_DANCE
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, SLOWBROX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, PSYWAVE
	dbw 32, AMNESIA
	dbw 36, PSYCHIC_M
	dbw 40, REST
	dbw 42, SCALD
	dbw 45, SKULL_BASH
	dbw 50, HYDRO_PUMP
	dbw 55, FUTURE_SIGHT
	dbw 60, RAIN_DANCE
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, MAGNETON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 11, SUPERSONIC
	dbw 15, METAL_CLAW
	dbw 16, SONICBOOM
	dbw 21, THUNDER_WAVE
	dbw 26, SHOCK_WAVE
	dbw 27, LOCK_ON
	dbw 36, THUNDERBOLT
	dbw 40, FLASHCANNON
	dbw 42, CHARGE
	dbw 45, LIGHT_SCREEN
	dbw 50, REFLECT
	dbw 55, RECOVER
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, MAGNEZONE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 11, SUPERSONIC
	dbw 15, METAL_CLAW
	dbw 16, SONICBOOM
	dbw 21, THUNDER_WAVE
	dbw 26, SHOCK_WAVE
	dbw 27, LOCK_ON
	dbw 36, THUNDERBOLT
	dbw 40, FLASHCANNON
	dbw 42, CHARGE
	dbw 45, LIGHT_SCREEN
	dbw 50, REFLECT
	dbw 55, RECOVER
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 7, KARATE_CHOP
	dbw 10, SHARPEN
	dbw 15, FALSE_SWIPE
	dbw 19, FURY_ATTACK
	dbw 22, WING_ATTACK
	dbw 25, JUMP_KICK
	dbw 28, SLASH
	dbw 31, BRICK_BREAK
	dbw 36, CROSS_CHOP
	dbw 40, LEAF_BLADE
	dbw 42, DRAGON_DANCE
	dbw 48, SKY_ATTACK
	dbw 50, SLASH
	dbw 55, SWORDS_DANCE
	dbw 60, HI_JUMP_KICK
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
	dbw 30, TRI_ATTACK
	dbw 36, DRILL_PECK	
	dbw 40, AGILITY
	dbw 42, SWORDS_DANCE
	dbw 45, HI_JUMP_KICK
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 9, BITE
	dbw 13, FURY_ATTACK
	dbw 20, RAGE
	dbw 24, AIR_CUTTER	
	dbw 30, TRI_ATTACK
	dbw 36, DRILL_PECK	
	dbw 40, AGILITY
	dbw 42, SWORDS_DANCE
	dbw 45, HI_JUMP_KICK
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ASHIBOMB
	dbbw EVOLVE_LEVEL, 30, DEWGONG
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, HEADBUTT	
	dbw 20, REST
	dbw 24, AURORA_BEAM
	dbw 28, BUBBLEBEAM	
	dbw 32, TAKE_DOWN
	dbw 36, ICE_BEAM
	dbw 40, HAIL
	dbw 42, AMNESIA
	dbw 45, ICY_WIND
	dbw 48, HYDRO_PUMP
	dbw 50, BLIZZARD
	dbw 55, MIRROR_COAT
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ASHIBOMB
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, HEADBUTT	
	dbw 20, REST
	dbw 24, AURORA_BEAM
	dbw 28, BUBBLEBEAM	
	dbw 32, TAKE_DOWN
	dbw 36, ICE_BEAM
	dbw 40, HAIL
	dbw 42, AMNESIA
	dbw 45, ICY_WIND
	dbw 48, HYDRO_PUMP
	dbw 50, BLIZZARD
	dbw 55, MIRROR_COAT
	dbw 60, MEGAHORN
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
	dbw 30, ACID_ARMOR
	dbw 32, AMNESIA
	dbw 36, SLUDGE_BOMB
	dbw 40, PURSUIT
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, CURSE
	dbw 55, CRUSH_CLAW
	dbw 60, BULK_UP
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
	dbw 30, ACID_ARMOR
	dbw 32, AMNESIA
	dbw 36, SLUDGE_BOMB
	dbw 40, PURSUIT
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, CURSE
	dbw 55, CRUSH_CLAW
	dbw 60, BULK_UP
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
	dbw 30, ICY_WIND
	dbw 32, SPIKES
	dbw 36, ICE_BEAM
	dbw 40, RAZORSHELL
	dbw 42, AMNESIA
	dbw 45, HYDRO_PUMP
	dbw 50, BLIZZARD
	dbw 55, REST
	dbw 60, RAPID_SPIN
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
	dbw 30, ICY_WIND
	dbw 32, SPIKES
	dbw 36, ICE_BEAM
	dbw 40, RAZORSHELL
	dbw 42, AMNESIA
	dbw 45, HYDRO_PUMP
	dbw 50, BLIZZARD
	dbw 55, REST
	dbw 60, RAPID_SPIN
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_CLAW
	dbw 30, DREAM_EATER
	dbw 36, SHADOW_BALL
	dbw 40, SLUDGE_WAVE
	dbw 42, GROWTH
	dbw 45, DARK_PULSE
	dbw 50, NIGHTMARE
	dbw 55, PERISH_SONG
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_CLAW
	dbw 30, DREAM_EATER
	dbw 36, SHADOW_BALL
	dbw 40, SLUDGE_WAVE
	dbw 42, GROWTH
	dbw 45, DARK_PULSE
	dbw 50, NIGHTMARE
	dbw 55, PERISH_SONG
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, GENGARX
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, ASTONISH
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 28, SHADOW_CLAW
	dbw 30, DREAM_EATER
	dbw 36, SHADOW_BALL
	dbw 40, SLUDGE_WAVE
	dbw 42, GROWTH
	dbw 45, DARK_PULSE
	dbw 50, NIGHTMARE
	dbw 55, PERISH_SONG
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbww EVOLVE_ITEM, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 14, ROCK_THROW
	dbw 18, RAGE
	dbw 22, ROCK_TOMB
	dbw 26, MAGNITUDE	
	dbw 30, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 42, BULK_UP
	dbw 45, IRON_TAIL
	dbw 50, REST
	dbw 55, COSMIC_POWER
	dbw 60, FISSURE
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
	dbw 31, DIZZY_PUNCH
	dbw 36, DREAM_EATER
	dbw 40, DARK_PULSE
	dbw 42, CALM_MIND
	dbw 43, BULK_UP
	dbw 48, BODY_SLAM
	dbw 50, PLAY_ROUGH
	dbw 55, SWEET_SCENT
	dbw 60, FUTURE_SIGHT
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
	dbw 31, DIZZY_PUNCH
	dbw 36, DREAM_EATER
	dbw 40, DARK_PULSE
	dbw 42, CALM_MIND
	dbw 43, BULK_UP
	dbw 48, BODY_SLAM
	dbw 50, PLAY_ROUGH
	dbw 55, SWEET_SCENT
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, METAL_CLAW
	dbw 5, LEER
	dbw 10, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 23, STOMP
	dbw 27, ROCK_SMASH
	dbw 30, VICEGRIP
	dbw 34, PROTECT
	dbw 40, GUILLOTINE	
	dbw 45, CRABHAMMER
	dbw 50, CURSE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, KINGLERX
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, METAL_CLAW
	dbw 5, LEER
	dbw 10, SCRATCH
	dbw 16, HARDEN
	dbw 20, BUBBLEBEAM
	dbw 23, STOMP
	dbw 27, ROCK_SMASH
	dbw 30, VICEGRIP
	dbw 34, PROTECT
	dbw 40, GUILLOTINE	
	dbw 45, CRABHAMMER
	dbw 50, CURSE
	dbw 60, AQUA_JET
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	dbww EVOLVE_ITEM, LEAF_STONE, HVOLTORB
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, SLAM
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, FAERIEGLEAM
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, HELECTRODE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 12, SONICBOOM
	dbw 16, SPARK
	dbw 20, SLAM
	dbw 23, SELFDESTRUCT
	dbw 27, ROLLOUT
	dbw 30, LIGHT_SCREEN
	dbw 32, THUNDERBOLT
	dbw 36, FAERIEGLEAM
	dbw 39, EXPLOSION
	dbw 41, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	dbw 55, POWER_GEM
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	dbbw EVOLVE_LEVEL, 36, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, CONFUSION
	dbw 18, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, MEGA_DRAIN	
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 42, EGG_BOMB
	dbw 45, CALM_MIND
	dbw 50, EXPLOSION
	dbw 55, AMNESIA
	dbw 60, DRAGON_CLAW
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLET_SEED
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 13, CONFUSION
	dbw 18, BARRAGE
	dbw 20, STUN_SPORE
	dbw 24, MEGA_DRAIN	
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 42, EGG_BOMB
	dbw 45, CALM_MIND
	dbw 50, EXPLOSION
	dbw 55, AMNESIA
	dbw 60, DRAGON_CLAW
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
	dbw 22, NIGHT_SHADE
	dbw 25, BONEMERANG
	dbw 28, CURSE
	dbw 32, SHADOW_CLAW
	dbw 36, BONE_RUSH
	dbw 40, SHADOW_BALL
	dbw 42, SWORDS_DANCE
	dbw 45, FLAME_WHEEL
	dbw 50, CONFUSE_RAY
	dbw 55, GLARE
	dbw 60, FISSURE
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
	dbw 22, NIGHT_SHADE
	dbw 25, BONEMERANG
	dbw 28, CURSE
	dbw 32, SHADOW_CLAW
	dbw 36, BONE_RUSH
	dbw 40, SHADOW_BALL
	dbw 42, SWORDS_DANCE
	dbw 45, FLAME_WHEEL
	dbw 50, CONFUSE_RAY
	dbw 55, GLARE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DOUBLE_KICK
	dbw 6, SHARPEN
	dbw 12, POUND
	dbw 16, ROLLING_KICK
	dbw 21, FOCUS_ENERGY
	dbw 25, COUNTER
	dbw 28, MIND_READER
	dbw 30, JUMP_KICK
	dbw 36, HI_JUMP_KICK	
	dbw 39, BLAZE_KICK
	dbw 42, PURSUIT
	dbw 45, DRAGON_DANCE
	dbw 50, MEGA_KICK
	dbw 55, REVERSAL
	dbw 60, TRIPLE_KICK
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 7, AGILITY
	dbw 16, MACH_PUNCH
	dbw 20, SHADOW_PUNCH
	dbw 22, DIZZY_PUNCH
	dbw 24, THUNDERPUNCH
	dbw 26, ICE_PUNCH
	dbw 28, FIRE_PUNCH
	dbw 30, FOCUS_PUNCH
	dbw 32, BULLET_PUNCH
	dbw 36, DYNAMICPUNCH
	dbw 40, MEGA_PUNCH
	dbw 42, DRAGON_DANCE
	dbw 44, DETECT
	dbw 50, COUNTER
	dbw 55, PROTECT
	dbw 60, SWORDS_DANCE
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
	dbw 30, SCREECH
	dbw 36, BODY_SLAM	
	dbw 40, CRUNCH
	dbw 42, THUNDER_FANG
	dbw 45, ICE_FANG
	dbw 48, FIRE_FANG
	dbw 50, BULK_UP
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 9, SMOG
	dbw 12, SMOKESCREEN
	dbw 17, SELFDESTRUCT
	dbw 22, SLUDGE
	dbw 26, FIRE_SPIN	
	dbw 28, WILLOWISP
	dbw 30, CURSE
	dbw 32, HAZE
	dbw 36, FLAMETHROWER
	dbw 39, EXPLOSION
	dbw 42, AMNESIA
	dbw 45, ACID_ARMOR
	dbw 48, FIRE_BLAST
	dbw 50, DESTINY_BOND
	dbw 55, REST
	dbw 60, PERISH_SONG
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 9, SMOG
	dbw 12, SMOKESCREEN
	dbw 17, SELFDESTRUCT
	dbw 22, SLUDGE
	dbw 26, FIRE_SPIN	
	dbw 28, WILLOWISP
	dbw 30, CURSE
	dbw 32, HAZE
	dbw 36, FLAMETHROWER
	dbw 39, EXPLOSION
	dbw 42, AMNESIA
	dbw 45, ACID_ARMOR
	dbw 48, FIRE_BLAST
	dbw 50, DESTINY_BOND
	dbw 55, REST
	dbw 60, PERISH_SONG
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, RHYDON
	db 0 ; no more evolutions
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 20, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 30, SCARY_FACE
	dbw 36, ROCK_SLIDE
	dbw 39, DRAGON_CLAW	
	dbw 41, TAKE_DOWN
	dbw 42, DRAGON_DANCE
	dbw 45, EARTHQUAKE
	dbw 50, STONE_EDGE
	dbw 55, SANDSTORM
	dbw 60, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	dbbw EVOLVE_LEVEL, 44, RHYPERIOR
	db 0 ; no more evolutions	
	dbw 1, TAIL_WHIP
	dbw 8, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, ROAR
	dbw 20, HORN_ATTACK
	dbw 20, ROCK_TOMB
	dbw 28, DRAGON_RAGE
	dbw 30, SCARY_FACE
	dbw 36, ROCK_SLIDE
	dbw 39, DRAGON_CLAW	
	dbw 41, TAKE_DOWN
	dbw 42, DRAGON_DANCE
	dbw 45, EARTHQUAKE
	dbw 50, STONE_EDGE
	dbw 55, SANDSTORM
	dbw 60, HORN_DRILL
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
	dbw 60, CALM_MIND
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, TANGROWTH
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 4, SLEEP_POWDER
	dbw 10, ABSORB
	dbw 13, POISONPOWDER
	dbw 18, VINE_WHIP
	dbw 25, SLAM
	dbw 31, GIGA_DRAIN
	dbw 34, STUN_SPORE
	dbw 36, GROWTH
	dbw 40, BODY_SLAM
	dbw 42, NATURE_POWER
	dbw 45, LEECH_SEED
	dbw 50, AMNESIA
	dbw 55, SOLARBEAM
	dbw 60, SPORE
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
	dbw 32, CRUSH_CLAW
	dbw 36, THRASH
	dbw 40, CRUNCH
	dbw 42, SWORDS_DANCE
	dbw 46, DOUBLE_EDGE
	dbw 50, REVERSAL
	dbw 55, ENDURE
	dbw 60, OUTRAGE	
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
	dbw 26, AURORA_BEAM
	dbw 28, DRAGON_RAGE	
	dbw 36, DRAGONBREATH
	dbw 36, RECOVER
	dbw 40, AGILITY
	dbw 45, HYDRO_PUMP
	dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	dbw 60, OUTRAGE
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
	dbw 26, AURORA_BEAM
	dbw 28, DRAGON_RAGE	
	dbw 36, DRAGONBREATH
	dbw 36, RECOVER
	dbw 40, AGILITY
	dbw 45, HYDRO_PUMP
	dbw 50, DRAGON_DANCE
	dbw 55, RAIN_DANCE
	dbw 60, OUTRAGE
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
	dbw 26, WING_ATTACK
	dbw 28, FLAIL
	dbw 34, DRILL_PECK
	dbw 38, WATERFALL
	dbw 43, HORN_DRILL
	dbw 45, AGILITY
	dbw 50, HYDRO_PUMP
	dbw 55, MUDDY_WATER
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 15, HORN_ATTACK
	dbw 20, GROWTH	
	dbw 24, BUBBLEBEAM
	dbw 26, WING_ATTACK
	dbw 28, FLAIL
	dbw 34, DRILL_PECK
	dbw 38, WATERFALL
	dbw 43, HORN_DRILL
	dbw 45, AGILITY
	dbw 50, HYDRO_PUMP
	dbw 55, MUDDY_WATER
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, STARMIE
	dbbw EVOLVE_LEVEL, 36, STARMIE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 7, WATER_GUN
	dbw 13, RAPID_SPIN
	dbw 19, RECOVER
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM
	dbw 32, AURORA_BEAM
	dbw 36, PSYCHIC_M	
	dbw 40, MIST_BALL
	dbw 43, LIGHT_SCREEN
	dbw 46, POWER_GEM
	dbw 50, HYDRO_PUMP
	dbw 55, COSMIC_POWER
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 7, WATER_GUN
	dbw 13, RAPID_SPIN
	dbw 19, RECOVER
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM
	dbw 32, AURORA_BEAM
	dbw 36, PSYCHIC_M	
	dbw 40, MIST_BALL
	dbw 43, LIGHT_SCREEN
	dbw 46, POWER_GEM
	dbw 50, HYDRO_PUMP
	dbw 55, COSMIC_POWER
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BARRIER
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 11, SUBSTITUTE
	dbw 16, KINESIS
	dbw 21, DIZZY_PUNCH
	dbw 26, LIGHT_SCREEN
	dbw 26, REFLECT
	dbw 31, ENCORE
	dbw 36, PSYCHIC_M
	dbw 40, CALM_MIND
	dbw 41, BATON_PASS
	dbw 46, SAFEGUARD
	dbw 50, RECOVER
	dbw 55, MEDITATE
	dbw 60, FUTURE_SIGHT
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
	dbw 22, TWINEEDLE
	dbw 24, AGILITY
	dbw 32, SLASH
	dbw 36, RAZOR_WIND
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	dbw 52, LEAF_BLADE
	dbw 60, SHADOW_CLAW
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LICK
	dbw 9, LOVELY_KISS
	dbw 13, POWDER_SNOW
	dbw 21, DOUBLESLAP
	dbw 25, ICE_PUNCH
	dbw 28, PSYBEAM
	dbw 32, ICY_WIND
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 42, CALM_MIND
	dbw 45, PERISH_SONG
	dbw 50, BLIZZARD
	dbw 55, HYPER_VOICE
	dbw 60, MEDITATE
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
	dbw 25, THUNDERPUNCH
	dbw 28, THUNDER_WAVE
	dbw 36, THUNDERBOLT
	dbw 40, FAERIEGLEAM
	dbw 42, CHARGE
	dbw 45, CONFUSE_RAY
	dbw 50, THUNDER
	dbw 55, AGILITY
	dbw 60, SHOCKSLAM
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
	dbw 25, FIRE_PUNCH
	dbw 28, WILLOWISP
	dbw 30, SUNNY_DAY
	dbw 36, FLAMETHROWER
	dbw 40, CONFUSE_RAY
	dbw 45, SLUDGE_WAVE
	dbw 50, FIRE_BLAST
	dbw 55, BRICK_BREAK
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, PINSIRX
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 13, BIND
	dbw 19, TWINEEDLE
	dbw 25, HARDEN
	dbw 31, SLASH
	dbw 36, PURSUIT
	dbw 40, SWORDS_DANCE
	dbw 42, MEGAHORN
	dbw 45, SUBMISSION
	dbw 50, GUILLOTINE	
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 5, DOUBLE_KICK
	dbw 13, RAGE	
	dbw 19, SCARY_FACE
	dbw 24, HORN_ATTACK
	dbw 28, MAGNITUDE
	dbw 32, BRICK_BREAK
	dbw 36, EARTHQUAKE
	dbw 40, BULK_UP
	dbw 42, OUTRAGE
	dbw 45, EARTHQUAKE
	dbw 50, DOUBLE_EDGE
	dbw 55, SUBMISSION
	dbw 60, FISSURE
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
	dbw 30, FIRE_FANG
	dbw 32, THUNDER_FANG
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 42, RAIN_DANCE
	dbw 45, DRAGON_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, HYPER_BEAM
	dbw 60, OUTRAGE
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
	dbw 50, HYDRO_PUMP
	dbw 55, BLIZZARD
	dbw 60, ICICLE_CRASH
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
	dbw 32, BODY_SLAM
	dbw 36, FAERIEGLEAM
	dbw 40, AGILITY
	dbw 45, RECOVER
	dbw 50, OUTRAGE
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
	dbw 30, BATON_PASS
	dbw 32, ACID_ARMOR
	dbw 36, ICE_BEAM
	dbw 40, AMNESIA
	dbw 42, RECOVER
	dbw 45, SCALD
	dbw 50, BLIZZARD
	dbw 55, RAIN_DANCE
	dbw 60, WATER_SPOUT
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
	dbw 36, THUNDERBOLT
	dbw 40, PIN_MISSILE
	dbw 42, CHARGE
	dbw 45, RAIN_DANCE
	dbw 50, THUNDER
	dbw 55, CRUNCH
	dbw 60, SHOCKSLAM
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
	dbw 36, FLAME_WHEEL
	dbw 40, CRUNCH
	dbw 42, DRAGON_DANCE
	dbw 45, BODY_SLAM
	dbw 50, FIRE_BLAST
	dbw 55, SWORDS_DANCE
	dbw 60, SACRED_FIRE
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
	dbw 24, SHOCK_WAVE
	dbw 28, PSYBEAM	
	dbw 32, CHARGE	
	dbw 36, THUNDERBOLT
	dbw 40, TRI_ATTACK
	dbw 42, SUBSTITUTE
	dbw 45, THUNDER_WAVE
	dbw 50, HYPER_BEAM
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
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
	dbw 26, ROCK_TOMB
	dbw 30, MUD_SHOT
	dbw 32, PROTECT
	dbw 36, POWER_GEM
	dbw 40, MUDDY_WATER
	dbw 42, SANDSTORM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, COSMIC_POWER
	dbw 60, SKULL_BASH
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 10, ROCK_THROW
	dbw 14, WATER_GUN
	dbw 20, ANCIENTPOWER
	dbw 24, BUBBLEBEAM
	dbw 26, ROCK_TOMB
	dbw 30, MUD_SHOT
	dbw 32, PROTECT
	dbw 36, POWER_GEM
	dbw 40, MUDDY_WATER
	dbw 42, SANDSTORM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	dbw 55, COSMIC_POWER
	dbw 60, SKULL_BASH
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
	dbw 32, SLASH
	dbw 36, ROCK_SLIDE
	dbw 40, ICICLE_CRASH
	dbw 40, SWORDS_DANCE
	dbw 42, MEGA_DRAIN
	dbw 46, SANDSTORM
	dbw 50, BLIZZARD
	dbw 55, AQUA_JET
	dbw 60, SHADOW_CLAW
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
	dbw 32, SLASH
	dbw 36, ROCK_SLIDE
	dbw 40, ICICLE_CRASH
	dbw 40, SWORDS_DANCE
	dbw 42, MEGA_DRAIN
	dbw 46, SANDSTORM
	dbw 50, BLIZZARD
	dbw 55, AQUA_JET
	dbw 60, SHADOW_CLAW
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, AERODACTYLX
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 8, ROCK_THROW
	dbw 12, BITE
	dbw 16, SUPERSONIC
	dbw 20, WING_ATTACK	
	dbw 24, ANCIENTPOWER
	dbw 28, SCARY_FACE
	dbw 32, ROCK_TOMB
	dbw 36, DRILL_PECK
	dbw 40, ROCK_SLIDE
	dbw 43, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, DRAGON_CLAW
	dbw 55, SANDSTORM
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 8, AMNESIA
	dbw 15, DEFENSE_CURL
	dbw 22, STOMP
	dbw 25, HEADBUTT
	dbw 30, SNORE
	dbw 30, REST
	dbw 36, CRUSH_CLAW
	dbw 40, BODY_SLAM
	dbw 42, BULK_UP
	dbw 45, BELLY_DRUM
	dbw 50, OUTRAGE
	dbw 55, EARTHQUAKE
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, POWDER_SNOW
	dbw 8, CONFUSION
	dbw 13, MIST
	dbw 18, ICY_WIND
	dbw 23, WING_ATTACK
	dbw 25, AGILITY
	dbw 28, AURORA_BEAM
	dbw 32, PSYBEAM
	dbw 37, HAIL
	dbw 41, RAZOR_WIND
	dbw 45, ICE_BEAM
	dbw 48, PSYCHIC_M
	dbw 52, HURRICANE
	dbw 56, REFLECT
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, THUNDERSHOCK
	dbw 8, DOUBLE_KICK
	dbw 13, MIST
	dbw 18, THUNDER_WAVE
	dbw 23, WING_ATTACK
	dbw 25, AGILITY
	dbw 28, SHOCK_WAVE
	dbw 32, JUMP_KICK
	dbw 37, DETECT
	dbw 41, DRILL_PECK
	dbw 45, THUNDERBOLT
	dbw 48, SUBMISSION
	dbw 52, HURRICANE
	dbw 56, LIGHT_SCREEN
	dbw 60, THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, EMBER
	dbw 8, BITE
	dbw 13, MIST
	dbw 18, WILLOWISP
	dbw 23, WING_ATTACK
	dbw 25, AGILITY
	dbw 28, FIRE_SPIN
	dbw 32, FAINT_ATTACK
	dbw 37, ENDURE
	dbw 41, DRILL_PECK
	dbw 45, FLAMETHROWER
	dbw 48, PURSUIT
	dbw 52, HURRICANE
	dbw 56, SOLARBEAM
	dbw 60, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 22, DRAGON_RAGE
	dbw 25, SLAM
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, DETECT
	dbw 60, DRAGON_DANCE
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 22, DRAGON_RAGE
	dbw 25, SLAM
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, DETECT
	dbw 60, DRAGON_DANCE
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	dbww EVOLVE_ITEM, KANTOITE_X, DRAGONITEX
	dbww EVOLVE_ITEM, KANTOITE_Y, DRAGONITEY
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 22, DRAGON_RAGE
	dbw 25, SLAM
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, DETECT
	dbw 60, DRAGON_DANCE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LOW_KICK
	dbw 11, BARRIER
	dbw 22, PSYBEAM
	dbw 27, PSYCHO_CUT
	dbw 33, KINESIS
	dbw 38, PSYCHIC_M
	dbw 44, AURA_SPHERE
	dbw 49, RECOVER
	dbw 55, MEDITATE
	dbw 60, FUTURE_SIGHT
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
	dbw 36, PSYCHIC_M
	dbw 38, MOONBLAST
	dbw 40, BATON_PASS
	dbw 45, PURSUIT
	dbw 50, CALM_MIND
	dbw 55, BULK_UP
	dbw 60, AURA_SPHERE
	db 0 ; no more level-up moves

ENDSECTION

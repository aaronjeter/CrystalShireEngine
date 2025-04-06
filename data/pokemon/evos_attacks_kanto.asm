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
	dbw 1, PIXIE_DUST
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 24, SWEET_SCENT
	dbw 26, SLUDGE
	dbw 30, SWIFT
	dbw 36, GROWTH
	dbw 40, SYNTHESIS
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 24, SWEET_SCENT
	dbw 26, SLUDGE
	dbw 30, SWIFT
	dbw 36, GROWTH
	dbw 40, SYNTHESIS
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 4, GROWL
	dbw 7, LEECH_SEED
	dbw 10, VINE_WHIP
	dbw 12, POISONPOWDER
	dbw 16, SLEEP_POWDER
	dbw 20, RAZOR_LEAF
	dbw 24, SWEET_SCENT
	dbw 26, SLUDGE
	dbw 30, SWIFT
	dbw 36, GROWTH
	dbw 40, SYNTHESIS
	dbw 44, SOLARBEAM
	dbw 50, SUNNY_DAY
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
	dbw 20, FIRE_SPIN
	dbw 24, SCARY_FACE
	dbw 31, FLAMETHROWER
	dbw 36, SLASH
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
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
	dbw 20, FIRE_SPIN
	dbw 24, SCARY_FACE
	dbw 31, FLAMETHROWER
	dbw 36, SLASH
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, METAL_CLAW
	dbw 14, SMOKESCREEN
	dbw 18, RAGE
	dbw 20, FIRE_SPIN
	dbw 24, SCARY_FACE
	dbw 31, FLAMETHROWER
	dbw 36, SLASH
	dbw 37, WING_ATTACK
	dbw 40, DRAGONBREATH
	dbw 44, SUNNY_DAY
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
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
	dbw 36, SKULL_BASH
	dbw 40, VICEGRIP
	dbw 50, HYDRO_PUMP
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
	dbw 36, SKULL_BASH
	dbw 40, VICEGRIP
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
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
	dbw 36, SKULL_BASH
	dbw 40, VICEGRIP
	dbw 50, HYDRO_PUMP
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
	dbw 28, PSYBEAM
	dbw 32, SWIFT
	dbw 36, SAFEGUARD
	dbw 40, MEDITATE
	dbw 50, PSYCHIC_M
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
	db 0 ; no more evolutions
	dbw 1, FURY_ATTACK
	dbw 1, STRING_SHOT
	dbw 10, FURY_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, TWINEEDLE
	dbw 24, RAGE
	dbw 30, PURSUIT
	dbw 36, PIN_MISSILE
	dbw 40, SWORDS_DANCE
	dbw 45, AGILITY
	dbw 50, MEGAHORN
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
	dbw 36, EXTREMESPEED
	dbw 40, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, MIRROR_MOVE
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
	dbw 36, EXTREMESPEED
	dbw 40, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, MIRROR_MOVE
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
	dbw 36, EXTREMESPEED
	dbw 40, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, MIRROR_MOVE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, HYPER_FANG
	dbw 18, SHARPEN
	dbw 20, FOCUS_ENERGY
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, CRUNCH
	dbw 36, SWORDS_DANCE
	dbw 40, SUPER_FANG
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, HYPER_FANG
	dbw 18, SHARPEN
	dbw 20, FOCUS_ENERGY
	dbw 24, SCARY_FACE
	dbw 28, DIG
	dbw 32, CRUNCH
	dbw 36, SWORDS_DANCE
	dbw 40, SUPER_FANG
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
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
	dbw 32, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, AGILITY
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
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
	dbw 32, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, AGILITY
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE
	dbw 22, SCREECH
	dbw 26, AGILITY
	dbw 31, CRUNCH
	dbw 36, SLUDGE_BOMB
	dbw 40, HAZE
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, POISON_STING
	dbw 12, BITE
	dbw 18, GLARE
	dbw 22, SCREECH
	dbw 26, AGILITY
	dbw 31, CRUNCH
	dbw 36, SLUDGE_BOMB
	dbw 40, HAZE
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, RAICHU
	dbww EVOLVE_LEVEL, 36, RAICHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, THUNDERBOLT
	dbw 31, AGILITY
	dbw 36, SWIFT
	dbw 40, MEDITATE
	dbw 41, THUNDER
	dbw 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, GROWL
	dbw 6, TAIL_WHIP
	dbw 8, THUNDER_WAVE
	dbw 11, QUICK_ATTACK
	dbw 15, DOUBLE_TEAM
	dbw 20, SLAM
	dbw 26, THUNDERBOLT
	dbw 31, AGILITY
	dbw 36, SWIFT
	dbw 40, MEDITATE
	dbw 41, THUNDER
	dbw 50, LIGHT_SCREEN
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
	dbw 30, SLASH
	dbw 36, SANDSTORM
	dbw 40, EARTHQUAKE
	dbw 42, CURSE
	dbw 45, CRUNCH
	dbw 48, FISSURE
	dbw 50, GUILLOTINE
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
	dbw 30, SLASH
	dbw 36, SANDSTORM
	dbw 40, EARTHQUAKE
	dbw 42, CURSE
	dbw 45, CRUNCH
	dbw 48, FISSURE
	dbw 50, GUILLOTINE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, MUD_SLAP
	dbw 20, STOMP
	dbw 24, SLUDGE
	dbw 30, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, BODY_SLAM
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	dbww EVOLVE_LEVEL, 36, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, MUD_SLAP
	dbw 20, STOMP
	dbw 24, SLUDGE
	dbw 30, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, BODY_SLAM
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, POISON_STING
	dbw 12, DOUBLE_KICK
	dbw 16, MUD_SLAP
	dbw 20, STOMP
	dbw 24, SLUDGE
	dbw 30, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, BODY_SLAM
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, TACKLE
	dbw 8, HORN_ATTACK
	dbw 12, DOUBLE_KICK
	dbw 16, POISON_STING
	dbw 20, STOMP
	dbw 24, MAGNITUDE
	dbw 28, FURY_ATTACK
	dbw 32, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, THRASH
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	dbw 60, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, TACKLE
	dbw 8, HORN_ATTACK
	dbw 12, DOUBLE_KICK
	dbw 16, POISON_STING
	dbw 20, STOMP
	dbw 24, MAGNITUDE
	dbw 28, FURY_ATTACK
	dbw 32, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, THRASH
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	dbw 60, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, TACKLE
	dbw 8, HORN_ATTACK
	dbw 12, DOUBLE_KICK
	dbw 16, POISON_STING
	dbw 20, STOMP
	dbw 24, MAGNITUDE
	dbw 28, FURY_ATTACK
	dbw 32, CRUNCH
	dbw 36, EARTHQUAKE
	dbw 40, THRASH
	dbw 45, SLUDGE_BOMB
	dbw 50, CURSE
	dbw 60, HORN_DRILL
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, CLEFABLE
	dbww EVOLVE_LEVEL, 36, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, GROWL
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, FAE_VOICE
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, GLARE
	dbw 30, SWIFT
	dbw 36, MOONLIGHT
	dbw 40, REFLECT
	dbw 45, LIGHT_SCREEN
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, GROWL
	dbw 4, ENCORE
	dbw 8, SING
	dbw 12, DOUBLESLAP
	dbw 16, FAE_VOICE
	dbw 18, MINIMIZE
	dbw 20, METRONOME
	dbw 22, DEFENSE_CURL
	dbw 24, GLARE
	dbw 30, SWIFT
	dbw 36, MOONLIGHT
	dbw 40, REFLECT
	dbw 45, LIGHT_SCREEN
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, NINETALES
	dbww EVOLVE_LEVEL, 36, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LICK
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, HYPNOSIS
	dbw 28, CURSE
	dbw 32, FLAMETHROWER
	dbw 36, SHADOW_BALL
	dbw 40, DESTINY_BOND
	dbw 44, SUNNY_DAY
	dbw 48, FIRE_BLAST
	dbw 52, SOLARBEAM
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LICK
	dbw 7, QUICK_ATTACK
	dbw 12, ROAR
	dbw 16, NIGHT_SHADE
	dbw 20, WILLOWISP
	dbw 24, HYPNOSIS
	dbw 28, CURSE
	dbw 32, FLAMETHROWER
	dbw 36, SHADOW_BALL
	dbw 40, DESTINY_BOND
	dbw 44, SUNNY_DAY
	dbw 48, FIRE_BLAST
	dbw 52, SOLARBEAM
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	dbww EVOLVE_LEVEL, 36, WIGGLYTUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, DISABLE
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, REST
	dbw 32, BODY_SLAM
	dbw 36, SWIFT
	dbw 40, GLARE
	dbw 45, CURSE
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 5, POUND
	dbw 10, DISABLE
	dbw 16, ROLLOUT
	dbw 20, WILLOWISP
	dbw 24, FAE_VOICE
	dbw 28, REST
	dbw 32, BODY_SLAM
	dbw 36, SWIFT
	dbw 40, GLARE
	dbw 45, CURSE
	dbw 50, DOUBLE_EDGE
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
	dbw 30, CRUNCH
	dbw 32, SLUDGE_BOMB
	dbw 36, MEAN_LOOK
	dbw 40, HAZE
	dbw 45, SKY_ATTACK
	dbw 50, BELLY_DRUM
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	dbw 1, LEECH_LIFE
	dbw 1, POISON_STING
	dbw 6, SUPERSONIC
	dbw 10, GUST
	dbw 16, BITE
	dbw 19, CONFUSE_RAY
	dbw 24, WING_ATTACK
	dbw 30, CRUNCH
	dbw 32, SLUDGE_BOMB
	dbw 36, MEAN_LOOK
	dbw 40, HAZE
	dbw 45, SKY_ATTACK
	dbw 50, BELLY_DRUM
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 21, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 31, GIGA_DRAIN
	dbw 35, MOONLIGHT
	dbw 40, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbww EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	dbww EVOLVE_LEVEL, 36, VILEPLUME
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 21, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 31, GIGA_DRAIN
	dbw 35, MOONLIGHT
	dbw 40, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, ACID
	dbw 6, POISONPOWDER
	dbw 10, SWEET_SCENT
	dbw 14, POISONPOWDER
	dbw 16, STUN_SPORE
	dbw 18, SLEEP_POWDER
	dbw 21, MEGA_DRAIN
	dbw 26, FAINT_ATTACK
	dbw 31, GIGA_DRAIN
	dbw 35, MOONLIGHT
	dbw 40, PETAL_DANCE
	dbw 45, TOXIC
	dbw 50, PURSUIT
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEECH_LIFE
	dbw 7, STUN_SPORE
	dbw 12, POISONPOWDER	
	dbw 16, RAZOR_LEAF
	dbw 20, LEECH_SEED
	dbw 25, SPORE
	dbw 31, SLASH
	dbw 36, GIGA_DRAIN
	dbw 37, GROWTH
	dbw 40, SOLARBEAM
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEECH_LIFE
	dbw 7, STUN_SPORE
	dbw 12, POISONPOWDER	
	dbw 16, RAZOR_LEAF
	dbw 20, LEECH_SEED
	dbw 25, SPORE
	dbw 31, SLASH
	dbw 36, GIGA_DRAIN
	dbw 37, GROWTH
	dbw 40, SOLARBEAM
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 8, LEECH_LIFE
	dbw 12, LEECH_SEED
	dbw 16, TWINEEDLE
	dbw 20, POISONPOWDER
	dbw 24, PSYBEAM
	dbw 28, STUN_SPORE
	dbw 32, PSYCHIC_M
	dbw 36, SLEEP_POWDER
	dbw 40, MEDITATE
	dbw 45, FUTURE_SIGHT
	dbw 50, GIGA_DRAIN
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 8, LEECH_LIFE
	dbw 12, LEECH_SEED
	dbw 16, TWINEEDLE
	dbw 20, POISONPOWDER
	dbw 24, PSYBEAM
	dbw 28, STUN_SPORE
	dbw 32, PSYCHIC_M
	dbw 36, SLEEP_POWDER
	dbw 40, MEDITATE
	dbw 45, FUTURE_SIGHT
	dbw 50, GIGA_DRAIN
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, SAND_ATTACK
	dbw 5, GROWL
	dbw 10, ROCK_THROW
	dbw 16, DIG
	dbw 20, MAGNITUDE
	dbw 24, SLAM
	dbw 28, ROCK_SLIDE
	dbw 32, SLASH
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
	dbw 10, ROCK_THROW
	dbw 16, DIG
	dbw 20, MAGNITUDE
	dbw 24, SLAM
	dbw 28, ROCK_SLIDE
	dbw 32, SLASH
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
	dbw 16, FAINT_ATTACK
	dbw 20, PAY_DAY
	dbw 24, STOMP
	dbw 28, FAINT_ATTACK
	dbw 32, SLASH
	dbw 36, CRUNCH
	dbw 40, PURSUIT
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 5, BITE
	dbw 10, METAL_CLAW
	dbw 16, FAINT_ATTACK
	dbw 20, PAY_DAY
	dbw 24, STOMP
	dbw 28, FAINT_ATTACK
	dbw 32, SLASH
	dbw 36, CRUNCH
	dbw 40, PURSUIT
	dbw 45, EXTREMESPEED
	dbw 50, SWORDS_DANCE
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, BUBBLE
	dbw 10, DISABLE
	dbw 15, CONFUSION
	dbw 20, BUBBLEBEAM
	dbw 24, ICY_WIND
	dbw 28, PSYBEAM
	dbw 31, PSYCH_UP
	dbw 32, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, BUBBLE
	dbw 10, DISABLE
	dbw 15, CONFUSION
	dbw 20, BUBBLEBEAM
	dbw 24, ICY_WIND
	dbw 28, PSYBEAM
	dbw 31, PSYCH_UP
	dbw 32, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, ICE_BEAM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
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
	dbw 24, STOMP
	dbw 28, MACH_PUNCH
	dbw 30, SEISMIC_TOSS
	dbw 32, SCREECH
	dbw 36, CROSS_CHOP
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, LEER
	dbw 8, DOUBLE_KICK
	dbw 12, LOW_KICK
	dbw 16, MAGNITUDE
	dbw 20, FURY_SWIPES
	dbw 24, STOMP
	dbw 28, MACH_PUNCH
	dbw 30, SEISMIC_TOSS
	dbw 32, SCREECH
	dbw 36, CROSS_CHOP
	dbw 40, EARTHQUAKE
	dbw 45, ROCK_SLIDE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	dbww EVOLVE_ITEM, FIRE_STONE, ARCANINE
	dbww EVOLVE_LEVEL, 36, ARCANINE
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ROAR
	dbw 5, EMBER
	dbw 10, SAND_ATTACK
	dbw 16, FIRE_SPIN
	dbw 20, MUD_SLAP
	dbw 24, SLAM
	dbw 28, SHARPEN
	dbw 32, FLAME_WHEEL
	dbw 36, FLAMETHROWER
	dbw 40, EXTREMESPEED
	dbw 42, AGILITY
	dbw 46, PURSUIT
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ROAR
	dbw 5, EMBER
	dbw 10, SAND_ATTACK
	dbw 16, FIRE_SPIN
	dbw 20, MUD_SLAP
	dbw 24, SLAM
	dbw 28, SHARPEN
	dbw 32, FLAME_WHEEL
	dbw 36, FLAMETHROWER
	dbw 40, EXTREMESPEED
	dbw 42, AGILITY
	dbw 46, PURSUIT
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 19, BUBBLEBEAM
	dbw 25, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, HYDRO_PUMP
	dbw 45, MIND_READER
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbww EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 19, BUBBLEBEAM
	dbw 25, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, HYDRO_PUMP
	dbw 45, MIND_READER
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, HYPNOSIS
	dbw 12, WATER_GUN
	dbw 15, KARATE_CHOP
	dbw 19, BUBBLEBEAM
	dbw 25, RAIN_DANCE
	dbw 31, BODY_SLAM
	dbw 37, BELLY_DRUM
	dbw 40, CROSS_CHOP
	dbw 43, HYDRO_PUMP
	dbw 45, MIND_READER
	dbw 50, SUBMISSION
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbww EVOLVE_LEVEL, 40, ALAKAZAM
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 22, PSYBEAM
	dbw 26, RECOVER
	dbw 30, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, FUTURE_SIGHT
	dbw 45, REFLECT	
	dbw 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	dbw 7, CONFUSION
	dbw 12, KINESIS
	dbw 16, DISABLE
	dbw 22, PSYBEAM
	dbw 26, RECOVER
	dbw 30, MEDITATE
	dbw 36, PSYCHIC_M
	dbw 40, FUTURE_SIGHT
	dbw 45, REFLECT	
	dbw 50, LIGHT_SCREEN
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
	dbw 31, VITAL_THROW
	dbw 32, MEGA_PUNCH
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, FISSURE
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbww EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 7, FOCUS_ENERGY
	dbw 10, ROCK_THROW
	dbw 12, KARATE_CHOP
	dbw 16, SEISMIC_TOSS
	dbw 20, MACH_PUNCH
	dbw 25, FORESIGHT
	dbw 31, VITAL_THROW
	dbw 32, MEGA_PUNCH
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, FISSURE
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
	dbw 31, VITAL_THROW
	dbw 32, MEGA_PUNCH
	dbw 36, CROSS_CHOP
	dbw 40, ROCK_SLIDE
	dbw 42, SUBMISSION
	dbw 45, DETECT
	dbw 50, FISSURE
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
	dbw 32, SLUDGE
	dbw 36, SLAM
	dbw 40, SWORDS_DANCE
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
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
	dbw 32, SLUDGE
	dbw 36, SLAM
	dbw 40, SWORDS_DANCE
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
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
	dbw 32, SLUDGE
	dbw 36, SLAM
	dbw 40, SWORDS_DANCE
	dbw 45, BODY_SLAM
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, WRAP
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, SLUDGE
	dbw 28, ICY_WIND
	dbw 32, BARRIER
	dbw 36, GIGA_DRAIN
	dbw 40, AMNESIA
	dbw 45, SLUDGE_BOMB
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, BUBBLE
	dbw 6, SUPERSONIC
	dbw 12, WRAP
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, SLUDGE
	dbw 28, ICY_WIND
	dbw 32, BARRIER
	dbw 36, GIGA_DRAIN
	dbw 40, AMNESIA
	dbw 45, SLUDGE_BOMB
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, MAGNITUDE
	dbw 21, SELFDESTRUCT
	dbw 25, ROLLOUT
	dbw 28, MUD_SLAP
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, EXPLOSION
	dbw 46, AMNESIA
	dbw 50, FISSURE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GOLEM
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, MAGNITUDE
	dbw 21, SELFDESTRUCT
	dbw 25, ROLLOUT
	dbw 28, MUD_SLAP
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, EXPLOSION
	dbw 46, AMNESIA
	dbw 50, FISSURE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 6, DEFENSE_CURL
	dbw 10, ROCK_THROW
	dbw 16, MAGNITUDE
	dbw 21, SELFDESTRUCT
	dbw 25, ROLLOUT
	dbw 28, MUD_SLAP
	dbw 32, ROCK_SLIDE
	dbw 36, EARTHQUAKE
	dbw 40, SANDSTORM
	dbw 42, EXPLOSION
	dbw 46, AMNESIA
	dbw 50, FISSURE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, DOUBLE_KICK
	dbw 19, STOMP
	dbw 26, FIRE_SPIN
	dbw 31, FLAME_WHEEL
	dbw 35, TAKE_DOWN
	dbw 40, EXTREMESPEED
	dbw 42, SUNNY_DAY
	dbw 45, MEGAHORN
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, GROWL
	dbw 8, TAIL_WHIP
	dbw 10, EMBER
	dbw 15, DOUBLE_KICK
	dbw 19, STOMP
	dbw 26, FIRE_SPIN
	dbw 31, FLAME_WHEEL
	dbw 35, TAKE_DOWN
	dbw 40, EXTREMESPEED
	dbw 42, SUNNY_DAY
	dbw 45, MEGAHORN
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SLOWBRO
	dbww EVOLVE_TRADE, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, HEADBUTT
	dbw 32, PSYCHIC_M
	dbw 36, AMNESIA
	dbw 40, ACID_ARMOR
	dbw 45, SKULL_BASH
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, GROWL
	dbw 12, WATER_GUN
	dbw 16, CONFUSION
	dbw 20, DISABLE
	dbw 24, BUBBLEBEAM
	dbw 28, HEADBUTT
	dbw 32, PSYCHIC_M
	dbw 36, AMNESIA
	dbw 40, ACID_ARMOR
	dbw 45, SKULL_BASH
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 11, SUPERSONIC
	dbw 15, METAL_CLAW
	dbw 16, SONICBOOM
	dbw 21, THUNDER_WAVE
	dbw 27, LOCK_ON
	dbw 31, THUNDERBOLT
	dbw 33, SWIFT
	dbw 39, TRI_ATTACK
	dbw 45, ZAP_CANNON
	dbw 48, LIGHT_SCREEN
	dbw 50, REFLECT
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 6, THUNDERSHOCK
	dbw 11, SUPERSONIC
	dbw 15, METAL_CLAW
	dbw 16, SONICBOOM
	dbw 21, THUNDER_WAVE
	dbw 27, LOCK_ON
	dbw 31, THUNDERBOLT
	dbw 33, SWIFT
	dbw 39, TRI_ATTACK
	dbw 45, ZAP_CANNON
	dbw 48, LIGHT_SCREEN
	dbw 50, REFLECT
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
	dbw 30, SLASH
	dbw 31, RAZOR_WIND
	dbw 36, CROSS_CHOP
	dbw 40, SWORDS_DANCE
	dbw 44, AGILITY
	dbw 48, SKY_ATTACK
	dbw 50, SLASH
	dbw 44, HI_JUMP_KICK
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 9, BITE
	dbw 13, FURY_ATTACK
	dbw 20, TRI_ATTACK
	dbw 25, RAGE
	dbw 31, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, AGILITY
	dbw 45, HI_JUMP_KICK
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 9, BITE
	dbw 13, FURY_ATTACK
	dbw 20, TRI_ATTACK
	dbw 25, RAGE
	dbw 31, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, AGILITY
	dbw 45, HI_JUMP_KICK
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DEWGONG
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, HEADBUTT	
	dbw 20, AURORA_BEAM
	dbw 24, BUBBLEBEAM
	dbw 28, REST
	dbw 32, TAKE_DOWN
	dbw 36, ICE_BEAM
	dbw 40, SAFEGUARD
	dbw 42, AMNESIA
	dbw 45, ICY_WIND
	dbw 48, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 5, GROWL
	dbw 10, TAIL_WHIP
	dbw 16, HEADBUTT	
	dbw 20, AURORA_BEAM
	dbw 24, BUBBLEBEAM
	dbw 28, REST
	dbw 32, TAKE_DOWN
	dbw 36, ICE_BEAM
	dbw 40, SAFEGUARD
	dbw 42, AMNESIA
	dbw 45, ICY_WIND
	dbw 48, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MUK
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 1, HARDEN
	dbw 10, DISABLE
	dbw 16, SLUDGE
	dbw 21, MAGNITUDE
	dbw 25, MINIMIZE
	dbw 28, ACID_ARMOR
	dbw 31, AMNESIA
	dbw 36, SLUDGE_BOMB
	dbw 40, PURSUIT
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, CURSE
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 1, HARDEN
	dbw 33, HARDEN
	dbw 37, DISABLE
	dbw 45, SLUDGE
	dbw 23, MINIMIZE
	dbw 31, SCREECH
	dbw 45, ACID_ARMOR
	dbw 60, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, CLOYSTER
	dbbw EVOLVE_LEVEL, 30, CLOYSTER
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 9, SUPERSONIC
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, PROTECT
	dbw 28, ICY_WIND
	dbw 30, SPIKES
	dbw 32, ICE_BEAM
	dbw 36, SPIKE_CANNON
	dbw 40, AMNESIA
	dbw 45, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 9, SUPERSONIC
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, PROTECT
	dbw 28, ICY_WIND
	dbw 30, SPIKES
	dbw 32, ICE_BEAM
	dbw 36, SPIKE_CANNON
	dbw 40, AMNESIA
	dbw 45, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, POISON_GAS
	dbw 13, MEAN_LOOK
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 30, DREAM_EATER
	dbw 36, DESTINY_BOND
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_BOMB
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, POISON_GAS
	dbw 13, MEAN_LOOK
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 30, DREAM_EATER
	dbw 36, DESTINY_BOND
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_BOMB
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 8, ACID
	dbw 12, POISON_GAS
	dbw 13, MEAN_LOOK
	dbw 16, CURSE
	dbw 21, NIGHT_SHADE
	dbw 25, CONFUSE_RAY
	dbw 30, DREAM_EATER
	dbw 36, DESTINY_BOND
	dbw 40, SHADOW_BALL
	dbw 45, SLUDGE_BOMB
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbww EVOLVE_TRADE, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 10, BIND
	dbw 14, ROCK_THROW
	dbw 20, MAGNITUDE
	dbw 23, HARDEN
	dbw 27, RAGE
	dbw 30, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HYPNOSIS
	dbw 6, BITE
	dbw 10, DISABLE
	dbw 16, SHARPEN
	dbw 18, FAINT_ATTACK
	dbw 25, HEADBUTT
	dbw 31, DIZZY_PUNCH
	dbw 36, PURSUIT
	dbw 40, PSYCHIC_M
	dbw 42, MEDITATE
	dbw 43, PSYCH_UP
	dbw 48, BODY_SLAM
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HYPNOSIS
	dbw 6, BITE
	dbw 10, DISABLE
	dbw 16, SHARPEN
	dbw 18, FAINT_ATTACK
	dbw 25, HEADBUTT
	dbw 31, DIZZY_PUNCH
	dbw 36, PURSUIT
	dbw 40, PSYCHIC_M
	dbw 42, MEDITATE
	dbw 43, PSYCH_UP
	dbw 48, BODY_SLAM
	dbw 50, FUTURE_SIGHT
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

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
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
	dbw 36, SWIFT
	dbw 39, EXPLOSION
	dbw 41, MIRROR_COAT
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
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
	dbw 36, SWIFT
	dbw 39, EXPLOSION
	dbw 41, MIRROR_COAT
	dbw 45, EXTREMESPEED
	dbw 50, THUNDER
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	dbbw EVOLVE_LEVEL, 36, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 15, CONFUSION
	dbw 20, MEGA_DRAIN
	dbw 25, STUN_SPORE
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 42, EGG_BOMB
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 7, REFLECT
	dbw 10, LEECH_SEED
	dbw 15, CONFUSION
	dbw 20, MEGA_DRAIN
	dbw 25, STUN_SPORE
	dbw 30, PSYBEAM
	dbw 31, POISONPOWDER
	dbw 37, SLEEP_POWDER
	dbw 40, PSYCHIC_M
	dbw 42, EGG_BOMB
	dbw 45, AMNESIA
	dbw 50, EXPLOSION
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, LICK
	dbw 5, TAIL_WHIP
	dbw 9, BONE_CLUB
	dbw 13, HEADBUTT
	dbw 17, NIGHT_SHADE
	dbw 21, FOCUS_ENERGY
	dbw 25, BONEMERANG
	dbw 28, CURSE
	dbw 32, SHADOW_BALL
	dbw 37, THRASH
	dbw 41, BONE_RUSH
	dbw 45, FLAME_WHEEL
	dbw 50, CONFUSE_RAY
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, LICK
	dbw 5, TAIL_WHIP
	dbw 9, BONE_CLUB
	dbw 13, HEADBUTT
	dbw 17, NIGHT_SHADE
	dbw 21, FOCUS_ENERGY
	dbw 25, BONEMERANG
	dbw 28, CURSE
	dbw 32, SHADOW_BALL
	dbw 37, THRASH
	dbw 41, BONE_RUSH
	dbw 45, FLAME_WHEEL
	dbw 50, CONFUSE_RAY
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DOUBLE_KICK
	dbw 6, SHARPEN
	dbw 11, ROLLING_KICK
	dbw 16, JUMP_KICK
	dbw 21, FOCUS_ENERGY
	dbw 26, HI_JUMP_KICK
	dbw 31, MIND_READER
	dbw 36, FORESIGHT
	dbw 40, PURSUIT
	dbw 41, ENDURE
	dbw 46, MEGA_KICK
	dbw 50, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 7, AGILITY
	dbw 13, MACH_PUNCH
	dbw 20, DIZZY_PUNCH
	dbw 26, THUNDERPUNCH
	dbw 26, ICE_PUNCH
	dbw 26, FIRE_PUNCH
	dbw 32, PURSUIT
	dbw 38, MEGA_PUNCH
	dbw 44, DETECT
	dbw 50, COUNTER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 7, SUPERSONIC
	dbw 13, DEFENSE_CURL
	dbw 15, POUND
	dbw 19, STOMP
	dbw 25, ROLLOUT
	dbw 31, DISABLE
	dbw 36, BODY_SLAM
	dbw 40, SCREECH
	dbw 45, CRUNCH
	dwb 50, CURSE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 9, SMOG
	dbw 16, FIRE_SPIN
	dbw 17, SELFDESTRUCT
	dbw 21, SLUDGE
	dbw 24, SMOKESCREEN
	dbw 28, WILLOWISP
	dbw 30, CURSE
	dbw 33, HAZE
	dbw 36, FLAMETHROWER
	dbw 39, EXPLOSION
	dbw 42, AMNESIA
	dbw 45, ACID_ARMOR
	dbw 48, FIRE_BLAST
	dbw 50, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, EMBER
	dbw 9, SMOG
	dbw 16, FIRE_SPIN
	dbw 17, SELFDESTRUCT
	dbw 21, SLUDGE
	dbw 24, SMOKESCREEN
	dbw 28, WILLOWISP
	dbw 30, CURSE
	dbw 33, HAZE
	dbw 36, FLAMETHROWER
	dbw 39, EXPLOSION
	dbw 42, AMNESIA
	dbw 45, ACID_ARMOR
	dbw 48, FIRE_BLAST
	dbw 50, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, RHYDON
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, TAIL_WHIP
	dbw 10, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, STOMP
	dbw 20, ROLLOUT
	dbw 25, DRAGON_RAGE
	dbw 28, SCARY_FACE
	dbw 32, ROCK_SLIDE
	dbw 36, DRAGONBREATH
	dbw 37, HORN_DRILL
	dbw 40, TAKE_DOWN
	dbw 45, EARTHQUAKE
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, TAIL_WHIP
	dbw 10, ROCK_THROW
	dbw 12, METAL_CLAW
	dbw 16, STOMP
	dbw 20, ROLLOUT
	dbw 25, DRAGON_RAGE
	dbw 28, SCARY_FACE
	dbw 32, ROCK_SLIDE
	dbw 36, DRAGONBREATH
	dbw 37, HORN_DRILL
	dbw 40, TAKE_DOWN
	dbw 45, EARTHQUAKE
	dbw 50, OUTRAGE
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
	dbw 35, EGG_BOMB
	dbw 40, DEFENSE_CURL
	dbw 42, LIGHT_SCREEN
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 4, SLEEP_POWDER
	dbw 10, ABSORB
	dbw 13, POISONPOWDER
	dbw 18, VINE_WHIP
	dbw 25, SLAM
	dbw 31, GIGA_DRAIN
	dbw 34, STUN_SPORE
	dbw 40, BODY_SLAM
	dbw 45, GROWTH
	dbw 50, AMNESIA
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 7, LEER
	dbw 12, BITE
	dbw 16, TAIL_WHIP
	dbw 20, DIZZY_PUNCH
	dbw 25, MEGA_PUNCH
	dbw 30, RAGE
	dbw 34, ENDURE
	dbw 40, CRUNCH
	dbw 42, SWORDS_DANCE
	dbw 46, DOUBLE_EDGE
	dbw 50, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, SEADRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, DRAGON_RAGE
	dbw 28, AGILITY
	dbw 32, DRAGONBREATH
	dbw 36, THRASH
	dbw 40, OUTRAGE
	dbw 45, HYDRO_PUMP
	dbw 50, RECOVER
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	dbww EVOLVE_TRADE, DRAGON_SCALE, KINGDRA
	dbbw EVOLVE_LEVEL, 25, KINGDRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 8, SMOKESCREEN
	dbw 12, TWISTER
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, DRAGON_RAGE
	dbw 28, AGILITY
	dbw 32, DRAGONBREATH
	dbw 36, THRASH
	dbw 40, OUTRAGE
	dbw 45, HYDRO_PUMP
	dbw 50, RECOVER
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, SEAKING
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 15, HORN_ATTACK
	dbw 20, WING_ATTACK
	dbw 24, BUBBLEBEAM
	dbw 26, FLAIL
	dbw 29, FURY_ATTACK
	dbw 36, DRILL_PECK
	dbw 38, WATERFALL
	dbw 43, HORN_DRILL
	dbw 45, AGILITY
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, BUBBLE
	dbw 10, SUPERSONIC
	dbw 15, HORN_ATTACK
	dbw 20, WING_ATTACK
	dbw 24, BUBBLEBEAM
	dbw 26, FLAIL
	dbw 29, FURY_ATTACK
	dbw 36, DRILL_PECK
	dbw 38, WATERFALL
	dbw 43, HORN_DRILL
	dbw 45, AGILITY
	dbw 50, HYDRO_PUMP
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
	dbw 20, PSYBEAM
	dbw 25, BUBBLEBEAM
	dbw 31, AURORA_BEAM
	dbw 36, PSYCHIC_M	
	dbw 40, MINIMIZE
	dbw 43, LIGHT_SCREEN
	dbw 46, SWIFT
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 7, WATER_GUN
	dbw 13, RAPID_SPIN
	dbw 19, RECOVER
	dbw 20, PSYBEAM
	dbw 25, BUBBLEBEAM
	dbw 31, AURORA_BEAM
	dbw 36, PSYCHIC_M	
	dbw 40, MINIMIZE
	dbw 43, LIGHT_SCREEN
	dbw 46, SWIFT
	dbw 50, HYDRO_PUMP
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
	dbw 36, SWIFT
	dbw 40, PSYCHIC_M
	dbw 41, BATON_PASS
	dbw 46, SAFEGUARD
	dbw 50, RECOVER
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	dbww EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, STRING_SHOT
	dbw 6, FOCUS_ENERGY
	dbw 12, BITE
	dbw 18, FALSE_SWIPE
	dbw 22, TWINEEDLE
	dbw 24, AGILITY
	dbw 30, SLASH
	dbw 36, RAZOR_WIND
	dbw 42, SWORDS_DANCE
	dbw 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LICK
	dbw 9, LOVELY_KISS
	dbw 13, POWDER_SNOW
	dbw 21, DOUBLESLAP
	dbw 25, ICE_PUNCH
	dbw 30, PSYBEAM
	dbw 36, ICY_WIND
	dbw 40, ICE_BEAM
	dbw 42, PSYCHIC_M
	dbw 45, PERISH_SONG
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 16, THUNDERPUNCH
	dbw 17, LIGHT_SCREEN
	dbw 20, MACH_PUNCH
	dbw 24, DIZZY_PUNCH	
	dbw 28, THUNDER_WAVE
	dbw 32, THUNDERBOLT
	dbw 36, SWIFT
	dbw 40, AGILITY
	dbw 45, CONFUSE_RAY
	dbw 50, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 16, FIRE_PUNCH
	dbw 18, SMOG
	dbw 20, MACH_PUNCH
	dbw 24, SMOKESCREEN
	dbw 28, WILLOWISP
	dbw 30, SUNNY_DAY
	dbw 36, FLAMETHROWER
	dbw 40, CONFUSE_RAY
	dbw 45, SLUDGE_BOMB
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
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
	dbw 8, RAGE
	dbw 16, HORN_ATTACK
	dbw 19, SCARY_FACE
	dbw 26, FAINT_ATTACK
	dbw 32, THRASH
	dbw 34, REST
	dbw 36, ROCK_SMASH
	dbw 40, BODY_SLAM
	dbw 42, OUTRAGE
	dbw 45, EARTHQUAKE
	dbw 48, SUBMISSION
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GYARADOS
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 10, BUBBLE
	dbw 15, TACKLE
	dbw 20, BUBBLEBEAM
	dbw 25, DRAGON_RAGE	
	dbw 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THRASH
	dbw 20, BITE
	dbw 25, DRAGON_RAGE
	dbw 30, LEER
	dbw 32, DRAGONBREATH
	dbw 36, CRUNCH
	dbw 40, RAIN_DANCE
	dbw 45, HYDRO_PUMP
	dbw 48, HYPER_BEAM
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, GROWL
	dbw 1, SING
	dbw 8, MIST
	dbw 16, TWISTER
	dbw 20, CONFUSE_RAY
	dbw 24, AURORA_BEAM
	dbw 24, PERISH_SONG
	dbw 32, DRAGONBREATH
	dbw 36, ICE_BEAM
	dbw 40, RAIN_DANCE
	dbw 42, SAFEGUARD
	dbw 46, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	dbww EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	dbww EVOLVE_ITEM, WATER_STONE, VAPOREON
	dbww EVOLVE_ITEM, FIRE_STONE, FLAREON
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	dbbw EVOLVE_HAPPINESS, TR_EVENITE, UMBREON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, STOMP
	dbw 20, QUICK_ATTACK
	dbw 24, BITE
	dbw 28, BATON_PASS
	dbw 32, BODY_SLAM
	dbw 36, SWIFT
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
	dbw 16, BUBBLEBEAM
	dbw 20, AURORA_BEAM
	dbw 24, RECOVER
	dbw 28, BATON_PASS
	dbw 32, ACID_ARMOR
	dbw 36, ICE_BEAM
	dbw 40, AMNESIA
	dbw 45, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, SPARK
	dbw 20, QUICK_ATTACK
	dbw 24, TWINEEDLE
	dbw 28, THUNDER_WAVE
	dbw 32, THUNDERBOLT
	dbw 36, PIN_MISSILE
	dbw 40, SWIFT
	dbw 45, AGILITY
	dbw 50, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TAIL_WHIP
	dbw 8, SAND_ATTACK
	dbw 12, PIXIE_DUST
	dbw 16, FIRE_SPIN
	dbw 20, STOMP
	dbw 24, ROLLING_KICK
	dbw 28, MUD_SLAP
	dbw 32, FLAME_WHEEL
	dbw 36, CRUNCH
	dbw 40, BODY_SLAM
	dbw 45, SWORDS_DANCE
	dbw 50, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbww EVOLVE_TRADE, UP_GRADE, PORYGON2
	dbbw EVOLVE_LEVEL, 36, PORYGON2
	db 0 ; no more evolutions
	dbw 1, CONVERSION2
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 9, AGILITY
	dbw 16, SPARK
	dbw 20, PSYBEAM
	dbw 24, RECOVER
	dbw 28, TRI_ATTACK
	dbw 32, LOCK_ON
	dbw 36, THUNDERBOLT
	dbw 40, ZAP_CANNON
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
	dbw 28, AURORA_BEAM
	dbw 31, AMNESIA
	dbw 36, PROTECT
	dbw 40, ROCK_SLIDE
	dbw 42, SANDSTORM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WITHDRAW
	dbw 10, ROCK_THROW
	dbw 14, WATER_GUN
	dbw 20, ANCIENTPOWER
	dbw 24, BUBBLEBEAM
	dbw 28, AURORA_BEAM
	dbw 31, AMNESIA
	dbw 36, PROTECT
	dbw 40, ROCK_SLIDE
	dbw 42, SANDSTORM
	dbw 45, RAIN_DANCE
	dbw 50, HYDRO_PUMP
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
	dbw 24, AURORA_BEAM
	dbw 28, ENDURE
	dbw 32, ROCK_SLIDE
	dbw 36, ICE_BEAM
	dbw 40, SLASH
	dbw 42, MEGA_DRAIN
	dbw 46, SANDSTORM
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 1, ABSORB
	dbw 10, ABSORB
	dbw 19, LEER
	dbw 28, SAND_ATTACK
	dbw 37, ENDURE
	dbw 40, SLASH
	dbw 51, MEGA_DRAIN
	dbw 65, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 8, ROCK_THROW
	dbw 12, BITE
	dbw 16, WING_ATTACK
	dbw 20, SUPERSONIC
	dbw 24, ANCIENTPOWER
	dbw 28, SCARY_FACE
	dbw 32, RAZOR_WIND
	dbw 36, ROCK_SLIDE
	dbw 40, SKY_ATTACK
	dbw 43, TAKE_DOWN
	dbw 45, DRAGONBREATH
	dbw 50, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LICK
	dbw 8, AMNESIA
	dbw 15, DEFENSE_CURL
	dbw 22, BELLY_DRUM
	dbw 25, HEADBUTT
	dbw 30, SNORE
	dbw 30, REST
	dbw 36, BODY_SLAM
	dbw 40, ROLLOUT
	dbw 42, EARTHQUAKE
	dbw 45, HYPER_BEAM
	dbw 50, OUTRAGE
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
	dbw 37, MIND_READER
	dbw 41, RAZOR_WIND
	dbw 45, ICE_BEAM
	dbw 48, PSYCHIC_M
	dbw 52, SKY_ATTACK
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
	dbw 28, SPARK
	dbw 32, JUMP_KICK
	dbw 37, DETECT
	dbw 41, DRILL_PECK
	dbw 45, THUNDERBOLT
	dbw 48, SUBMISSION
	dbw 52, SKY_ATTACK
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
	dbw 52, SKY_ATTACK
	dbw 56, SAFEGUARD
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
	dbw 36, DRAGONBREATH
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, HYPER_BEAM
	dbw 60, FIRE_BLAST
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
	dbw 36, DRAGONBREATH
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, HYPER_BEAM
	dbw 60, FIRE_BLAST
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 8, THUNDER_WAVE
	dbw 15, TWISTER
	dbw 22, DRAGON_RAGE
	dbw 25, SLAM
	dbw 30, AGILITY
	dbw 32, SAFEGUARD
	dbw 36, DRAGONBREATH
	dbw 40, CRUNCH
	dbw 45, EXTREMESPEED
	dbw 50, OUTRAGE
	dbw 55, HYPER_BEAM
	dbw 60, SKY_ATTACK
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, LOW_KICK
	dbw 11, BARRIER
	dbw 22, PSYBEAM
	dbw 27, JUMP_KICK
	dbw 33, KINESIS
	dbw 38, PSYCHIC_M
	dbw 44, CROSS_CHOP
	dbw 49, RECOVER
	dbw 55, MEDITATE
	dbw 60, SWORDS_DANCE
	dbw 66, FUTURE_SIGHT
	dbw 70, AMNESIA
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 10, TRANSFORM
	dbw 16, PSYBEAM
	dbw 20, MEGA_PUNCH
	dbw 24, FAE_VOICE
	dbw 28, ANCIENTPOWER
	dbw 30, METRONOME
	dbw 32, PSYCHIC_M
	dbw 36, SWIFT
	dbw 40, BATON_PASS
	dbw 45, PURSUIT
	dbw 50, MEDITATE
	db 0 ; no more level-up moves

ENDSECTION

SECTION "Evolutions and Attacks 3", ROMX

EvosAttacksPointers3::
	dw TreeckoEvosAttacks
	dw GrovyleEvosAttacks
	dw SceptileEvosAttacks
	dw TorchicEvosAttacks
	dw CombuskenEvosAttacks
	dw BlazikenEvosAttacks
	dw MudkipEvosAttacks
	dw MarshtompEvosAttacks
	dw SwampertEvosAttacks
	dw PoochyenaEvosAttacks
	dw MightyenaEvosAttacks
	dw ZigzagoonEvosAttacks
	dw LinooneEvosAttacks
	dw WurmpleEvosAttacks
	dw SilcoonEvosAttacks
	dw BeautiflyEvosAttacks
	dw CascoonEvosAttacks
	dw DustoxEvosAttacks
	dw LotadEvosAttacks
	dw LombreEvosAttacks
	dw LudicoloEvosAttacks
	dw SeedotEvosAttacks
	dw NuzleafEvosAttacks
	dw ShiftryEvosAttacks
	dw TaillowEvosAttacks
	dw SwellowEvosAttacks
	dw WingullEvosAttacks
	dw PelipperEvosAttacks
	dw RaltsEvosAttacks
	dw KirliaEvosAttacks
	dw GardevoirEvosAttacks
	dw SurskitEvosAttacks
	dw MasquerainEvosAttacks
	dw ShroomishEvosAttacks
	dw BreloomEvosAttacks
	dw SlakothEvosAttacks
	dw VigorothEvosAttacks
	dw SlakingEvosAttacks
	dw NincadaEvosAttacks
	dw NinjaskEvosAttacks
	dw ShedinjaEvosAttacks
	dw WhismurEvosAttacks
	dw LoudredEvosAttacks
	dw ExploudEvosAttacks
	dw MakuhitaEvosAttacks
	dw HariyamaEvosAttacks
	dw AzurillEvosAttacks
	dw NosepassEvosAttacks
	dw SkittyEvosAttacks
	dw DelcattyEvosAttacks
	dw SableyeEvosAttacks
	dw MawileEvosAttacks
	dw AronEvosAttacks
	dw LaironEvosAttacks
	dw AggronEvosAttacks
	dw MedititeEvosAttacks
	dw MedichamEvosAttacks
	dw ElectrikeEvosAttacks
	dw ManectricEvosAttacks
	dw PlusleEvosAttacks
	dw MinunEvosAttacks
	dw VolbeatEvosAttacks
	dw IllumiseEvosAttacks
	dw RoseliaEvosAttacks
	dw GulpinEvosAttacks
	dw SwalotEvosAttacks
	dw CarvanhaEvosAttacks
	dw SharpedoEvosAttacks
	dw WailmerEvosAttacks
	dw WailordEvosAttacks
	dw NumelEvosAttacks
	dw CameruptEvosAttacks
	dw TorkoalEvosAttacks
	dw SpoinkEvosAttacks
	dw GrumpigEvosAttacks
	dw SpindaEvosAttacks
	dw TrapinchEvosAttacks
	dw VibravaEvosAttacks
	dw FlygonEvosAttacks
	dw CacneaEvosAttacks
	dw CacturneEvosAttacks
	dw SwabluEvosAttacks
	dw AltariaEvosAttacks
	dw ZangooseEvosAttacks
	dw SeviperEvosAttacks
	dw LunatoneEvosAttacks
	dw SolrockEvosAttacks
	dw BarboachEvosAttacks
	dw WhiscashEvosAttacks
	dw CorphishEvosAttacks
	dw CrawdauntEvosAttacks
	dw BaltoyEvosAttacks
	dw ClaydolEvosAttacks
	dw LileepEvosAttacks
	dw CradilyEvosAttacks
	dw AnorithEvosAttacks
	dw ArmaldoEvosAttacks
	dw FeebasEvosAttacks
	dw MiloticEvosAttacks
	dw KecleonEvosAttacks
	dw ShuppetEvosAttacks
	dw BanetteEvosAttacks
	dw DuskullEvosAttacks
	dw DusclopsEvosAttacks
	dw TropiusEvosAttacks
	dw ChimechoEvosAttacks
	dw AbsolEvosAttacks
	dw WynautEvosAttacks
	dw SnoruntEvosAttacks
	dw GlalieEvosAttacks
	dw SphealEvosAttacks
	dw SealeoEvosAttacks
	dw WalreinEvosAttacks
	dw ClamperlEvosAttacks
	dw HuntailEvosAttacks
	dw GorebyssEvosAttacks
	dw RelicanthEvosAttacks
	dw LuvdiscEvosAttacks
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw BeldumEvosAttacks
	dw MetangEvosAttacks
	dw MetagrossEvosAttacks
	dw RegirockEvosAttacks
	dw RegiceEvosAttacks
	dw RegisteelEvosAttacks
	dw LatiasEvosAttacks
	dw LatiosEvosAttacks
	dw KyogreEvosAttacks
	dw GroudonEvosAttacks
	dw RayquazaEvosAttacks
	dw JirachiEvosAttacks
	.IndirectEnd::


TreeckoEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, GROVYLE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, LEAF_BLADE
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, DRAGONBREATH
	dbw 50, DRAGON_DANCE
	dbw 55, DRAGON_CLAW
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

GrovyleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SCEPTILE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, LEAF_BLADE
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, DRAGONBREATH
	dbw 50, DRAGON_DANCE
	dbw 55, DRAGON_CLAW
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

SceptileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POUND
	dbw 6, ABSORB
	dbw 11, QUICK_ATTACK
	dbw 16, RAZOR_LEAF
	dbw 20, FAINT_ATTACK
	dbw 24, MEGA_DRAIN
	dbw 28, AGILITY
	dbw 32, LEAF_BLADE
	dbw 36, DETECT
	dbw 40, GIGA_DRAIN
	dbw 42, PURSUIT
	dbw 45, DRAGONBREATH
	dbw 50, DRAGON_DANCE
	dbw 55, DRAGON_CLAW
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

TorchicEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, COMBUSKEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, BLAZE_KICK
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, BULK_UP
	dbw 50, MEGA_KICK
	dbw 55, HI_JUMP_KICK
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

CombuskenEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLAZIKEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, BLAZE_KICK
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, BULK_UP
	dbw 50, MEGA_KICK
	dbw 55, HI_JUMP_KICK
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

BlazikenEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, FOCUS_ENERGY
	dbw 10, EMBER
	dbw 12, PECK
	dbw 16, DOUBLE_KICK
	dbw 20, FIRE_SPIN
	dbw 24, MACH_PUNCH
	dbw 28, MIRROR_MOVE
	dbw 32, BLAZE_KICK
	dbw 36, SLASH
	dbw 40, CROSS_CHOP
	dbw 42, DRILL_PECK
	dbw 45, BULK_UP
	dbw 50, MEGA_KICK
	dbw 55, HI_JUMP_KICK
	dbw 60, BLAST_BURN
	db 0 ; no more level-up moves

MudkipEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, MARSHTOMP
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, SLAM
	dbw 20, MUD_SHOT
	dbw 24, WATER_PULSE	
	dbw 28, WHIRLPOOL
	dbw 32, MUDDY_WATER
	dbw 36, RAIN_DANCE
	dbw 42, EARTHQUAKE
	dbw 45, GROWTH
	dbw 50, HYDRO_PUMP
	dbw 55, OUTRAGE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

MarshtompEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SWAMPERT
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, SLAM
	dbw 20, MUD_SHOT
	dbw 24, WATER_PULSE	
	dbw 28, WHIRLPOOL
	dbw 32, MUDDY_WATER
	dbw 36, RAIN_DANCE
	dbw 42, EARTHQUAKE
	dbw 45, GROWTH
	dbw 50, HYDRO_PUMP
	dbw 55, OUTRAGE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

SwampertEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, SLAM
	dbw 20, MUD_SHOT
	dbw 24, WATER_PULSE	
	dbw 28, WHIRLPOOL
	dbw 32, MUDDY_WATER
	dbw 36, RAIN_DANCE
	dbw 42, EARTHQUAKE
	dbw 45, GROWTH
	dbw 50, HYDRO_PUMP
	dbw 55, OUTRAGE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

PoochyenaEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, MIGHTYENA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, BITE,
	dbw 9, SAND_ATTACK
	dbw 12, SHARPEN
	dbw 15, SWAGGER
	dbw 18, SCARY_FACE
	dbw 22, SLAM
	dbw 25, FAINT_ATTACK
	dbw 28, POISON_FANG
	dbw 32, CRUNCH
	dbw 36, BODY_SLAM
	dbw 40, BULK_UP
	dbw 45, EXTREMESPEED
	dbw 50, TAKE_DOWN
	dbw 55, DRAGON_DANCE
	dbw 60, PLAY_ROUGH
	db 0 ; no more level-up moves

MightyenaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, BITE,
	dbw 9, SAND_ATTACK
	dbw 12, SHARPEN
	dbw 15, SWAGGER
	dbw 18, SCARY_FACE
	dbw 22, SLAM
	dbw 25, FAINT_ATTACK
	dbw 28, POISON_FANG
	dbw 32, CRUNCH
	dbw 36, BODY_SLAM
	dbw 40, BULK_UP
	dbw 45, EXTREMESPEED
	dbw 50, TAKE_DOWN
	dbw 55, DRAGON_DANCE
	dbw 60, PLAY_ROUGH
	db 0 ; no more level-up moves

ZigzagoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LINOONE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE	
	dbw 13, SHARPEN
	dbw 18, FOCUS_ENERGY
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE	
	dbw 28, DIG
	dbw 32, CRUNCH
	dbw 36, BELLY_DRUM
	dbw 40, SUPER_FANG
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SHADOW_CLAW
	dbw 60, REST
	db 0 ; no more level-up moves

LinooneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 7, QUICK_ATTACK
	dbw 10, BITE	
	dbw 13, SHARPEN
	dbw 18, FOCUS_ENERGY
	dbw 20, HYPER_FANG
	dbw 24, SCARY_FACE	
	dbw 28, DIG
	dbw 32, CRUNCH
	dbw 36, BELLY_DRUM
	dbw 40, SUPER_FANG
	dbw 45, EXTREMESPEED
	dbw 50, IRON_TAIL
	dbw 55, SHADOW_CLAW
	dbw 60, REST
	db 0 ; no more level-up moves

WurmpleEvosAttacks:
	dbbbw EVOLVE_STAT, 7, ATK_LT_DEF, SILCOON
	dbbbw EVOLVE_STAT, 7, ATK_GT_DEF, CASCOON
	dbbbw EVOLVE_STAT, 7, ATK_EQ_DEF, SILCOON
	db 0 ; no more evolutions
	dbw 1, STRING_SHOT
	dbw 1, TACKLE
	dbw 5, POISON_STING
	db 0 ; no more level-up moves

SilcoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEAUTIFLY
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves

BeautiflyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, STRING_SHOT
	dbw 10, ABSORB
	dbw 13, GUST
	dbw 17, STUN_SPORE
	dbw 20, MORNING_SUN
	dbw 24, MEGA_DRAIN
	dbw 27, SILVER_WIND
	dbw 31, ATTRACT
	dbw 32, SIGNAL_BEAM
	dbw 36, GIGA_DRAIN
	dbw 40, RAZOR_WIND
	dbw 42, CHARGE
	dbw 45, CHARM
	dbw 50, SKY_ATTACK	
	dbw 55, SUNNY_DAY
	dbw 60, SOLARBEAM
	db 0 ; no more level-up moves

CascoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, DUSTOX
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 7, HARDEN
	db 0 ; no more level-up moves

DustoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 10, CONFUSION
	dbw 13, GUST
	dbw 17, PROTECT
	dbw 20, MOONLIGHT
	dbw 24, PSYBEAM
	dbw 27, SILVER_WIND
	dbw 31, ATTRACT
	dbw 32, SIGNAL_BEAM
	dbw 36, PSYCHIC_M
	dbw 40, SLUDGE_WAVE
	dbw 42, CHARGE	
	dbw 45, TOXIC
	dbw 50, REFLECT
	dbw 55, LIGHT_SCREEN
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

LotadEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, LOMBRE
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, ABSORB
	dbw 8, GROWL
	dbw 12, LEECH_SEED
	dbw 16, VINE_WHIP
	dbw 20, BUBBLEBEAM
	dbw 24, MAGICAL_LEAF
	dbw 28, MUD_SHOT
	dbw 32, RAIN_DANCE
	dbw 36, GIGA_DRAIN
	dbw 40, SUNNY_DAY
	dbw 42, SOLARBEAM
	dbw 45, MUDDY_WATER
	dbw 50, BLIZZARD
	dbw 55, HYDRO_PUMP
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

LombreEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, LUDICOLO
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, ABSORB
	dbw 8, GROWL
	dbw 12, LEECH_SEED
	dbw 16, VINE_WHIP
	dbw 20, BUBBLEBEAM
	dbw 24, MAGICAL_LEAF
	dbw 28, MUD_SHOT
	dbw 32, RAIN_DANCE
	dbw 36, GIGA_DRAIN
	dbw 40, SUNNY_DAY
	dbw 42, SOLARBEAM
	dbw 45, MUDDY_WATER
	dbw 50, BLIZZARD
	dbw 55, HYDRO_PUMP
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

LudicoloEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, ABSORB
	dbw 8, GROWL
	dbw 12, LEECH_SEED
	dbw 16, VINE_WHIP
	dbw 20, BUBBLEBEAM
	dbw 24, MAGICAL_LEAF
	dbw 28, MUD_SHOT
	dbw 32, RAIN_DANCE
	dbw 36, GIGA_DRAIN
	dbw 40, SUNNY_DAY
	dbw 42, SOLARBEAM
	dbw 45, MUDDY_WATER
	dbw 50, BLIZZARD
	dbw 55, HYDRO_PUMP
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

SeedotEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, NUZLEAF
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 3, HARDEN
	dbw 7, GROWTH
	dbw 10, BITE
	dbw 16, BULLET_SEED
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS
	dbw 28, SUNNY_DAY
	dbw 32, RAZOR_WIND
	dbw 36, NATURE_POWER
	dbw 40, EXTRASENSORY
	dbw 42, SWAGGER
	dbw 45, LEAF_BLADE
	dbw 50, SOLARBEAM
	dbw 55, PURSUIT
	dbw 60, HEAT_WAVE
	db 0 ; no more level-up moves

NuzleafEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, SHIFTRY
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 3, HARDEN
	dbw 7, GROWTH
	dbw 10, BITE
	dbw 16, BULLET_SEED
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS
	dbw 28, SUNNY_DAY
	dbw 32, RAZOR_WIND
	dbw 36, NATURE_POWER
	dbw 40, EXTRASENSORY
	dbw 42, SWAGGER
	dbw 45, LEAF_BLADE
	dbw 50, SOLARBEAM
	dbw 55, PURSUIT
	dbw 60, HEAT_WAVE
	db 0 ; no more level-up moves

ShiftryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 3, HARDEN
	dbw 7, GROWTH
	dbw 10, BITE
	dbw 16, BULLET_SEED
	dbw 20, RAZOR_LEAF
	dbw 24, SYNTHESIS
	dbw 28, SUNNY_DAY
	dbw 32, RAZOR_WIND
	dbw 36, NATURE_POWER
	dbw 40, EXTRASENSORY
	dbw 42, SWAGGER
	dbw 45, LEAF_BLADE
	dbw 50, SOLARBEAM
	dbw 55, PURSUIT
	dbw 60, HEAT_WAVE
	db 0 ; no more level-up moves

TaillowEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SWELLOW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 16, QUICK_ATTACK
	dbw 20, AERIAL_ACE
	dbw 24, FAINT_ATTACK
	dbw 28, STEEL_WING
	dbw 30, MIRROR_MOVE
	dbw 32, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, BULK_UP
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
	dbw 55, BODY_SLAM
	dbw 60, SAFEGUARD
	db 0 ; no more level-up moves

SwellowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 7, LEER
	dbw 12, BITE
	dbw 16, QUICK_ATTACK
	dbw 20, AERIAL_ACE
	dbw 24, FAINT_ATTACK
	dbw 28, STEEL_WING
	dbw 30, MIRROR_MOVE
	dbw 32, DRILL_PECK
	dbw 36, PURSUIT
	dbw 40, BULK_UP
	dbw 45, RAZOR_WIND
	dbw 50, SKY_ATTACK
	dbw 55, BODY_SLAM
	dbw 60, SAFEGUARD
	db 0 ; no more level-up moves

WingullEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, PELIPPER
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, WATER_GUN
	dbw 7, GROWL
	dbw 11, SUPERSONIC
	dbw 16, MIST
	dbw 21, AERIAL_ACE
	dbw 24, WATER_PULSE
	dbw 28, RECOVER
	dbw 32, RAZOR_WIND
	dbw 36, PROTECT
	dbw 40, RAIN_DANCE	
	dbw 42, HYDRO_PUMP
	dbw 45, AGILITY
	dbw 50, HURRICANE
	dbw 55, CHARGE
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

PelipperEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, WATER_GUN
	dbw 7, GROWL
	dbw 11, SUPERSONIC
	dbw 16, MIST
	dbw 21, AERIAL_ACE
	dbw 24, WATER_PULSE
	dbw 28, RECOVER
	dbw 32, RAZOR_WIND
	dbw 36, PROTECT
	dbw 40, RAIN_DANCE	
	dbw 42, HYDRO_PUMP
	dbw 45, AGILITY
	dbw 50, HURRICANE
	dbw 55, CHARGE
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

RaltsEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 11, CHARM
	dbw 16, TELEPORT
	dbw 20, DRAININGKISS
	dbw 24, PSYBEAM
	dbw 28, HYPNOSIS
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, DREAM_EATER
	dbw 42, RECOVER
	dbw 45, MOONBLAST
	dbw 50, SUBSTITUTE
	dbw 55, LUSTER_PURGE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

KirliaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, GARDEVOIR
	dbww EVOLVE_ITEM, DAWN_STONE, GALLADE
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 11, CHARM
	dbw 16, TELEPORT
	dbw 20, DRAININGKISS
	dbw 24, PSYBEAM
	dbw 28, HYPNOSIS
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, DREAM_EATER
	dbw 42, RECOVER
	dbw 45, MOONBLAST
	dbw 50, SUBSTITUTE
	dbw 55, LUSTER_PURGE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

GardevoirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_DUST
	dbw 6, CONFUSION
	dbw 11, CHARM
	dbw 16, TELEPORT
	dbw 20, DRAININGKISS
	dbw 24, PSYBEAM
	dbw 28, HYPNOSIS
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, DREAM_EATER
	dbw 42, RECOVER
	dbw 45, MOONBLAST
	dbw 50, SUBSTITUTE
	dbw 55, LUSTER_PURGE
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

SurskitEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, MASQUERAIN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, QUICK_ATTACK
	dbw 10, STUN_SPORE
	dbw 13, SWEET_SCENT
	dbw 16, WATER_GUN	
	dbw 20, SILVER_WIND
	dbw 24, BUBBLEBEAM
	dbw 28, AERIAL_ACE
	dbw 32, CHARGE
	dbw 36, SIGNAL_BEAM
	dbw 40, RAIN_DANCE
	dbw 42, MEDITATE
	dbw 45, HURRICANE
	dbw 50, WATER_SPOUT
	dbw 55, MIST
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

MasquerainEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 7, QUICK_ATTACK
	dbw 10, STUN_SPORE
	dbw 13, SWEET_SCENT
	dbw 16, WATER_GUN	
	dbw 20, SILVER_WIND
	dbw 24, BUBBLEBEAM
	dbw 28, AERIAL_ACE
	dbw 32, CHARGE
	dbw 36, SIGNAL_BEAM
	dbw 40, RAIN_DANCE
	dbw 42, MEDITATE
	dbw 45, HURRICANE
	dbw 50, WATER_SPOUT
	dbw 55, MIST
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

ShroomishEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, TACKLE
	dbw 7, STUN_SPORE
	dbw 10, LEECH_SEED
	dbw 16, MEGA_DRAIN
	dbw 20, HEADBUTT
	dbw 24, MACH_PUNCH
	dbw 28, POISONPOWDER
	dbw 32, VITAL_THROW
	dbw 36, NATURE_POWER
	dbw 40, CROSS_CHOP
	dbw 42, GROWTH
	dbw 45, BULK_UP
	dbw 50, COUNTER
	dbw 55, ZEN_HEADBUTT
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

BreloomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, TACKLE
	dbw 7, STUN_SPORE
	dbw 10, LEECH_SEED
	dbw 16, MEGA_DRAIN
	dbw 20, HEADBUTT
	dbw 24, MACH_PUNCH
	dbw 28, POISONPOWDER
	dbw 32, VITAL_THROW
	dbw 36, NATURE_POWER
	dbw 40, CROSS_CHOP
	dbw 42, GROWTH
	dbw 45, BULK_UP
	dbw 50, COUNTER
	dbw 55, ZEN_HEADBUTT
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

SlakothEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, VIGOROTH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 7, ENCORE
	dbw 10, LICK
	dbw 12, SHARPEN
	dbw 16, SLAM
	dbw 20, MAGNITUDE
	dbw 24, FURY_SWIPES
	dbw 28, COUNTER
	dbw 32, SLASH
	dbw 36, PURSUIT
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, SNORE
	dbw 50, SLEEP_TALK
	dbw 55, CRUSH_CLAW
	dbw 60, THRASH
	db 0 ; no more level-up moves

VigorothEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SLAKING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 7, ENCORE
	dbw 10, LICK
	dbw 12, SHARPEN
	dbw 16, SLAM
	dbw 20, MAGNITUDE
	dbw 24, FURY_SWIPES
	dbw 28, COUNTER
	dbw 32, SLASH
	dbw 36, PURSUIT
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, SNORE
	dbw 50, SLEEP_TALK
	dbw 55, CRUSH_CLAW
	dbw 60, THRASH
	db 0 ; no more level-up moves

SlakingEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 7, ENCORE
	dbw 10, LICK
	dbw 12, SHARPEN
	dbw 16, SLAM
	dbw 20, MAGNITUDE
	dbw 24, FURY_SWIPES
	dbw 28, COUNTER
	dbw 32, SLASH
	dbw 36, PURSUIT
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, SNORE
	dbw 50, SLEEP_TALK
	dbw 55, CRUSH_CLAW
	dbw 60, THRASH
	db 0 ; no more level-up moves

NincadaEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NINJASK
	dbww EVOLVE_ITEM, MOON_STONE, SHEDINJA
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, SCRATCH
	dbw 5, LEECH_LIFE
	dbw 9, SAND_ATTACK
	dbw 14, METAL_CLAW
	dbw 18, AGILITY
	dbw 22, TWINEEDLE
	dbw 24, DIG
	dbw 26, FALSE_SWIPE
	dbw 28, WING_ATTACK
	dbw 32, PIN_MISSILE
	dbw 36, SLASH
	dbw 40, SWORDS_DANCE
	dbw 42, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, MEGAHORN
	dbw 55, SANDSTORM
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

NinjaskEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, SCRATCH
	dbw 5, LEECH_LIFE
	dbw 9, SAND_ATTACK
	dbw 14, METAL_CLAW
	dbw 18, AGILITY
	dbw 22, TWINEEDLE
	dbw 24, DIG
	dbw 26, FALSE_SWIPE
	dbw 28, WING_ATTACK
	dbw 32, PIN_MISSILE
	dbw 36, SLASH
	dbw 40, SWORDS_DANCE
	dbw 42, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, MEGAHORN
	dbw 55, SANDSTORM
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

ShedinjaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, SCRATCH
	dbw 5, LEECH_LIFE
	dbw 9, SAND_ATTACK
	dbw 14, METAL_CLAW
	dbw 18, CONFUSE_RAY
	dbw 22, TWINEEDLE
	dbw 24, DIG
	dbw 26, SHADOW_CLAW
	dbw 28, DOUBLE_TEAM
	dbw 32, PIN_MISSILE
	dbw 36, SLASH
	dbw 40, SWORDS_DANCE
	dbw 42, SKY_ATTACK
	dbw 45, AGILITY
	dbw 50, DESTINY_BOND
	dbw 55, SANDSTORM
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

WhismurEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LOUDRED
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 10, SCREECH
	dbw 12, ROAR
	dbw 20, SLAM
	dbw 24, FAE_VOICE
	dbw 24, STOMP
	dbw 28, REST
	dbw 30, SLEEP_TALK
	dbw 32, SNORE
	dbw 36, HYPER_VOICE
	dbw 40, GROWTH
	dbw 42, UPROAR
	dbw 45, HYPER_BEAM
	dbw 50, AGILITY
	dbw 55, OUTRAGE
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

LoudredEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, EXPLOUD
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 10, SCREECH
	dbw 12, ROAR
	dbw 20, SLAM
	dbw 24, FAE_VOICE
	dbw 24, STOMP
	dbw 28, REST
	dbw 30, SLEEP_TALK
	dbw 32, SNORE
	dbw 36, HYPER_VOICE
	dbw 40, GROWTH
	dbw 42, UPROAR
	dbw 45, HYPER_BEAM
	dbw 50, AGILITY
	dbw 55, OUTRAGE
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

ExploudEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 10, SCREECH
	dbw 12, ROAR
	dbw 20, SLAM
	dbw 24, FAE_VOICE
	dbw 24, STOMP
	dbw 28, REST
	dbw 30, SLEEP_TALK
	dbw 32, SNORE
	dbw 36, HYPER_VOICE
	dbw 40, GROWTH
	dbw 42, UPROAR
	dbw 45, HYPER_BEAM
	dbw 50, AGILITY
	dbw 55, OUTRAGE
	dbw 60, BULK_UP
	db 0 ; no more level-up moves

MakuhitaEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HARIYAMA
	db 0 ; no more evolutions
	dbw 1, FOCUS_ENERGY
	dbw 1, TACKLE
	dbw 4, SAND_ATTACK
	dbw 8, LOW_KICK
	dbw 12, WHIRLWIND
	dbw 16, VITAL_THROW
	dbw 20, BULK_UP
	dbw 24, MACH_PUNCH
	dbw 28, BELLY_DRUM
	dbw 32, ENDURE
	dbw 36, BRICK_BREAK
	dbw 40, BODY_SLAM
	dbw 42, REVERSAL
	dbw 45, CROSS_CHOP
	dbw 50, BODY_SLAM
	dbw 55, COUNTER
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

HariyamaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FOCUS_ENERGY
	dbw 1, TACKLE
	dbw 4, SAND_ATTACK
	dbw 8, LOW_KICK
	dbw 12, WHIRLWIND
	dbw 16, VITAL_THROW
	dbw 20, BULK_UP
	dbw 24, MACH_PUNCH
	dbw 28, BELLY_DRUM
	dbw 32, ENDURE
	dbw 36, BRICK_BREAK
	dbw 40, BODY_SLAM
	dbw 42, REVERSAL
	dbw 45, CROSS_CHOP
	dbw 50, BODY_SLAM
	dbw 55, COUNTER
	dbw 60, SUBMISSION
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	dbbw EVOLVE_LEVEL, 16, MARILL
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 3, DEFENSE_CURL
	dbw 6, TAIL_WHIP
	dbw 10, POUND
	dbw 16, ROLLOUT
	dbw 20, AQUA_JET
	dbw 24, BUBBLEBEAM
	dbw 28, DIZZY_PUNCH
	dbw 30, RAIN_DANCE
	dbw 32, FAERIEGLEAM
	dbw 36, BELLY_DRUM	
	dbw 40, DOUBLE_EDGE
	dbw 42, PERISH_SONG
	dbw 45, AMNESIA
	dbw 50, HYDRO_PUMP
	dbw 55, BULK_UP
	dbw 60, ACID_ARMOR
	db 0 ; no more level-up moves

NosepassEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, PROBOPASS
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 7, THUNDERSHOCK
	dbw 10, THUNDER_WAVE
	dbw 12, SAND_ATTACK
	dbw 15, DEFENSE_CURL
	dbw 20, ROLLOUT
	dbw 24, SHOCK_WAVE
	dbw 28, ROCK_TOMB
	dbw 32, CHARGE
	dbw 36, THUNDERBOLT
	dbw 40, POWER_GEM	
	dbw 42, COSMIC_POWER
	dbw 45, AURA_SPHERE	
	dbw 50, REST
	dbw 52, STONE_EDGE
	dbw 55, LOCK_ON
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

SkittyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, DELCATTY
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, TAIL_WHIP
	dbw 8, ATTRACT
	dbw 10, SING
	dbw 12, DOUBLESLAP
	dbw 16, CHARM
	dbw 20, DRAININGKISS
	dbw 24, HYPER_FANG
	dbw 28, SING
	dbw 32, SLASH
	dbw 36, CRUNCH
	dbw 40, DRAGON_DANCE
	dbw 42, SWORDS_DANCE
	dbw 45, PLAY_ROUGH
	dbw 50, PURSUIT
	dbw 55, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

DelcattyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, TAIL_WHIP
	dbw 8, ATTRACT
	dbw 10, SING
	dbw 12, DOUBLESLAP
	dbw 16, CHARM
	dbw 20, DRAININGKISS
	dbw 24, HYPER_FANG
	dbw 28, SING
	dbw 32, SLASH
	dbw 36, CRUNCH
	dbw 40, DRAGON_DANCE
	dbw 42, SWORDS_DANCE
	dbw 45, PLAY_ROUGH
	dbw 50, PURSUIT
	dbw 55, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

SableyeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 9, NIGHT_SHADE
	dbw 12, FURY_SWIPES
	dbw 15, DETECT
	dbw 20, CURSE
	dbw 24, CONFUSE_RAY
	dbw 28, RECOVER
	dbw 30, SHADOWSNEAK
	dbw 32, SHADOW_BALL
	dbw 36, PURSUIT
	dbw 40, MEAN_LOOK
	dbw 42, DESTINY_BOND
	dbw 45, COSMIC_POWER
	dbw 50, BATON_PASS
	dbw 55, PERISH_SONG
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

MawileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 5, PIXIE_DUST
	dbw 10, SWEET_SCENT
	dbw 14, METAL_CLAW
	dbw 18, SPIKES
	dbw 22, SANDSTORM
	dbw 24, FAINT_ATTACK
	dbw 28, FAE_VOICE	
	dbw 32, CRUSH_CLAW
	dbw 36, VICEGRIP
	dbw 40, BATON_PASS
	dbw 42, PLAY_ROUGH
	dbw 45, COSMIC_POWER
	dbw 50, BATON_PASS
	dbw 55, PERISH_SONG
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

AronEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LAIRON
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 4, HARDEN
	dbw 7, SAND_ATTACK
	dbw 16, ROAR
	dbw 20, HEADBUTT	
	dbw 24, MAGNITUDE
	dbw 28, PROTECT
	dbw 32, BULK_UP
	dbw 36, VICEGRIP
	dbw 40, ROCK_SLIDE
	dbw 42, EARTHQUAKE
	dbw 45, COSMIC_POWER
	dbw 50, FLASHCANNON
	dbw 55, FISSURE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

LaironEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 4, HARDEN
	dbw 7, SAND_ATTACK
	dbw 16, ROAR
	dbw 20, HEADBUTT	
	dbw 24, MAGNITUDE
	dbw 28, PROTECT
	dbw 32, BULK_UP
	dbw 36, VICEGRIP
	dbw 40, ROCK_SLIDE
	dbw 42, EARTHQUAKE
	dbw 45, COSMIC_POWER
	dbw 50, FLASHCANNON
	dbw 55, FISSURE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

AggronEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, AGGRONX
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 4, HARDEN
	dbw 7, SAND_ATTACK
	dbw 16, ROAR
	dbw 20, HEADBUTT	
	dbw 24, MAGNITUDE
	dbw 28, PROTECT
	dbw 32, BULK_UP
	dbw 36, VICEGRIP
	dbw 40, ROCK_SLIDE
	dbw 42, EARTHQUAKE
	dbw 45, COSMIC_POWER
	dbw 50, FLASHCANNON
	dbw 55, FISSURE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

MedititeEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 4, GROWTH
	dbw 9, CONFUSION
	dbw 12, DETECT
	dbw 18, HIDDEN_POWER
	dbw 22, MIND_READER
	dbw 24, PSYBEAM
	dbw 28, MACH_PUNCH
	dbw 30, RECOVER
	dbw 34, PSYCHIC_M
	dbw 38, HI_JUMP_KICK
	dbw 40, REVERSAL
	dbw 42, MEDITATE
	dbw 45, COUNTER
	dbw 50, AURA_SPHERE
	dbw 55, FOCUS_PUNCH
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

MedichamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BIDE
	dbw 4, GROWTH
	dbw 9, CONFUSION
	dbw 12, DETECT
	dbw 18, HIDDEN_POWER
	dbw 22, MIND_READER
	dbw 24, PSYBEAM
	dbw 28, MACH_PUNCH
	dbw 30, RECOVER
	dbw 34, PSYCHIC_M
	dbw 38, HI_JUMP_KICK
	dbw 40, REVERSAL
	dbw 42, MEDITATE
	dbw 45, COUNTER
	dbw 50, AURA_SPHERE
	dbw 55, FOCUS_PUNCH
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

ElectrikeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, MANECTRIC
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, THUNDER_WAVE
	dbw 9, LEER
	dbw 12, QUICK_ATTACK
	dbw 16, ROAR
	dbw 20, THUNDER_FANG	
	dbw 25, FAINT_ATTACK
	dbw 28, SLAM
	dbw 32, CRUNCH
	dbw 36, THUNDERBOLT
	dbw 40, PURSUIT
	dbw 42, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, DOUBLE_TEAM
	dbw 55, DOUBLE_EDGE
	dbw 60, SHOCKSLAM
	db 0 ; no more level-up moves

ManectricEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, THUNDER_WAVE
	dbw 9, LEER
	dbw 12, QUICK_ATTACK
	dbw 16, ROAR
	dbw 20, THUNDER_FANG	
	dbw 25, FAINT_ATTACK
	dbw 28, SLAM
	dbw 32, CRUNCH
	dbw 36, THUNDERBOLT
	dbw 40, PURSUIT
	dbw 42, CHARGE
	dbw 45, EXTREMESPEED
	dbw 50, DOUBLE_TEAM
	dbw 55, DOUBLE_EDGE
	dbw 60, SHOCKSLAM
	db 0 ; no more level-up moves

PlusleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 10, QUICK_ATTACK
	dbw 16, SPARK
	dbw 20, ENCORE
	dbw 24, BATON_PASS
	dbw 28, THUNDERBOLT
	dbw 32, CHARGE
	dbw 36, THUNDER
	dbw 40, FAERIEGLEAM
	dbw 45, CHARM
	dbw 50, ATTRACT
	db 0 ; no more level-up moves

MinunEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 10, QUICK_ATTACK
	dbw 16, SPARK
	dbw 20, ENCORE
	dbw 24, BATON_PASS
	dbw 28, THUNDERBOLT
	dbw 32, CHARGE
	dbw 36, THUNDER
	dbw 40, FAERIEGLEAM
	dbw 45, CHARM
	dbw 50, ATTRACT
	db 0 ; no more level-up moves

VolbeatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, CONFUSE_RAY
	dbw 9, DOUBLE_TEAM
	dbw 13, MOONLIGHT
	dbw 16, TWINEEDLE
	dbw 20, PROTECT
	dbw 24, FLASH
	dbw 28, SLAM
	dbw 32, ENCORE
	dbw 36, SIGNAL_BEAM
	dbw 40, FLASHCANNON
	dbw 42, CHARGE
	dbw 45, MOONBLAST
	dbw 50, THUNDER
	dbw 55, CALM_MIND
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

IllumiseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, CONFUSE_RAY
	dbw 9, DOUBLE_TEAM
	dbw 13, MOONLIGHT
	dbw 16, TWINEEDLE
	dbw 20, PROTECT
	dbw 24, FLASH
	dbw 28, SLAM
	dbw 32, ENCORE
	dbw 36, SIGNAL_BEAM
	dbw 40, FLASHCANNON
	dbw 42, CHARGE
	dbw 45, MOONBLAST
	dbw 50, THUNDER
	dbw 55, CALM_MIND
	dbw 60, MEGAHORN 
	db 0 ; no more level-up moves

RoseliaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ROSERADE
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 5, GROWTH
	dbw 9, POISON_STING
	dbw 12, STUN_SPORE
	dbw 16, LEECH_SEED
	dbw 20, MAGICAL_LEAF
	dbw 24, SWEET_SCENT
	dbw 28, SLUDGE
	dbw 32, TOXIC
	dbw 36, GIGA_DRAIN	
	dbw 40, GROWTH
	dbw 42, SYNTHESIS
	dbw 45, SLUDGE_WAVE
	dbw 50, AGILITY
	dbw 55, MOONBLAST
	dbw 60, PETAL_DANCE
	db 0 ; no more level-up moves

GulpinEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, SWALOT
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 5, POISON_GAS
	dbw 16, SLUDGE
	dbw 20, MUD_SHOT
	dbw 24, ENCORE
	dbw 28, TOXIC
	dbw 32, POISON_JAB
	dbw 36, BODY_SLAM
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, SNORE
	dbw 55, SLEEP_TALK
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

SwalotEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SWALOTX
	db 0 ; no more evolutions
	dbw 1, ACID
	dbw 5, POISON_GAS
	dbw 16, SLUDGE
	dbw 20, MUD_SHOT
	dbw 24, ENCORE
	dbw 28, TOXIC
	dbw 32, POISON_JAB
	dbw 36, BODY_SLAM
	dbw 40, BULK_UP
	dbw 42, REST
	dbw 45, EARTHQUAKE
	dbw 50, SNORE
	dbw 55, SLEEP_TALK
	dbw 60, SUBSTITUTE
	db 0 ; no more level-up moves

CarvanhaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 7, RAGE
	dbw 13, FOCUS_ENERGY
	dbw 16, SCARY_FACE
	dbw 20, AQUA_JET
	dbw 24, SCREECH
	dbw 28, ICE_FANG
	dbw 30, THUNDER_FANG
	dbw 32, FIRE_FANG
	dbw 36, CRUNCH
	dbw 40, SLASH
	dbw 42, DRAGON_DANCE
	dbw 45, OUTRAGE
	dbw 50, PLAY_ROUGH
	db 0 ; no more level-up moves

SharpedoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 7, RAGE
	dbw 13, FOCUS_ENERGY
	dbw 16, SCARY_FACE
	dbw 20, AQUA_JET
	dbw 24, SCREECH
	dbw 28, ICE_FANG
	dbw 30, THUNDER_FANG
	dbw 32, FIRE_FANG
	dbw 36, CRUNCH
	dbw 40, SLASH
	dbw 42, DRAGON_DANCE
	dbw 45, OUTRAGE
	dbw 50, PLAY_ROUGH
	db 0 ; no more level-up moves

WailmerEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, WAILORD
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, GROWL
	dbw 10, WATER_GUN
	dbw 14, ROLLOUT
	dbw 16, MIST
	dbw 20, DEFENSE_CURL
	dbw 24, REST
	dbw 28, AMNESIA
	dbw 32, BODY_SLAM
	dbw 36, WATER_SPOUT
	dbw 40, SNORE
	dbw 42, SLEEP_TALK
	dbw 45, OUTRAGE
	dbw 50, THRASH
	dbw 55, CALM_MIND
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

WailordEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, GROWL
	dbw 10, WATER_GUN
	dbw 14, ROLLOUT
	dbw 16, MIST
	dbw 20, DEFENSE_CURL
	dbw 24, REST
	dbw 28, AMNESIA
	dbw 32, BODY_SLAM
	dbw 36, WATER_SPOUT
	dbw 40, SNORE
	dbw 42, SLEEP_TALK
	dbw 45, OUTRAGE
	dbw 50, THRASH
	dbw 55, CALM_MIND
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

NumelEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, CAMERUPT
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 10, EMBER
	dbw 16, FOCUS_ENERGY
	dbw 20, ROCK_TOMB
	dbw 24, MAGNITUDE
	dbw 29, FIRE_SPIN
	dbw 32, AMNESIA
	dbw 35, EARTHQUAKE
	dbw 38, FLAMETHROWER
	dbw 40, ROCK_SLIDE
	dbw 42, DOUBLE_EDGE
	dbw 45, FIRE_BLAST
	dbw 50, RECOVER
	dbw 55, ERUPTION
	dbw 60, FISSURE
	db 0 ; no more level-up moves

CameruptEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, CAMERUPTX
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 10, EMBER
	dbw 16, FOCUS_ENERGY
	dbw 20, ROCK_TOMB
	dbw 24, MAGNITUDE
	dbw 29, FIRE_SPIN
	dbw 32, AMNESIA
	dbw 35, EARTHQUAKE
	dbw 38, FLAMETHROWER
	dbw 40, ROCK_SLIDE
	dbw 42, DOUBLE_EDGE
	dbw 45, FIRE_BLAST
	dbw 50, RECOVER
	dbw 55, ERUPTION
	dbw 60, FISSURE
	db 0 ; no more level-up moves

TorkoalEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 4, SMOG
	dbw 7, CURSE
	dbw 14, SMOKESCREEN
	dbw 20, PROTECT
	dbw 24, FIRE_SPIN
	dbw 28, BODY_SLAM	
	dbw 30, COSMIC_POWER
	dbw 32, FLAMETHROWER	
	dbw 36, ERUPTION
	dbw 40, REST
	dbw 42, SLEEP_TALK
	dbw 48, FIRE_BLAST
	dbw 50, FISSURE
	db 0 ; no more level-up moves

SpoinkEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, GRUMPIG
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 7, PSYWAVE
	dbw 12, CONFUSE_RAY
	dbw 16, RAPID_SPIN
	dbw 20, SLAM
	dbw 24, PSYBEAM
	dbw 28, REST
	dbw 32, BODY_SLAM
	dbw 36, PSYCHIC_M
	dbw 37, SNORE
	dbw 40, SLEEP_TALK
	dbw 42, CALM_MIND
	dbw 45, SHADOW_BALL
	dbw 50, FAERIEGLEAM
	dbw 55, FUTURE_SIGHT
	dbw 60, MEDITATE
	db 0 ; no more level-up moves

GrumpigEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 7, PSYWAVE
	dbw 12, CONFUSE_RAY
	dbw 16, RAPID_SPIN
	dbw 20, SLAM
	dbw 24, PSYBEAM
	dbw 28, REST
	dbw 32, BODY_SLAM
	dbw 36, PSYCHIC_M
	dbw 37, SNORE
	dbw 40, SLEEP_TALK
	dbw 42, CALM_MIND
	dbw 45, SHADOW_BALL
	dbw 50, FAERIEGLEAM
	dbw 55, FUTURE_SIGHT
	dbw 60, MEDITATE
	db 0 ; no more level-up moves

SpindaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 10, POUND
	dbw 12, FAINT_ATTACK
	dbw 16, PSYBEAM
	dbw 23, HYPNOSIS
	dbw 27, DIZZY_PUNCH
	dbw 30, DOUBLE_EDGE
	dbw 32, FLAIL
	dbw 36, THRASH
	dbw 40, OUTRAGE
	dbw 42, BELLY_DRUM
	dbw 45, EXTREMESPEED
	db 0 ; no more level-up moves

TrapinchEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, VIBRAVA
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 9, SAND_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, DIG
	dbw 24, SANDSTORM
	dbw 28, MUD_SHOT
	dbw 32, CRUNCH
	dbw 36, DRAGON_CLAW
	dbw 40, EARTHQUAKE
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

VibravaEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, FLYGON
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 9, SAND_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, DIG
	dbw 24, SANDSTORM
	dbw 28, MUD_SHOT
	dbw 32, CRUNCH
	dbw 36, DRAGON_CLAW
	dbw 40, EARTHQUAKE
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

FlygonEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, FLYGONX
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 9, SAND_ATTACK
	dbw 16, FAINT_ATTACK
	dbw 20, DIG
	dbw 24, SANDSTORM
	dbw 28, MUD_SHOT
	dbw 32, CRUNCH
	dbw 36, DRAGON_CLAW
	dbw 40, EARTHQUAKE
	dbw 42, DRAGON_DANCE
	dbw 45, CRUNCH
	dbw 50, FIRE_BLAST
	dbw 55, OUTRAGE
	dbw 60, FISSURE
	db 0 ; no more level-up moves

CacneaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, CACTURNE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 5, ABSORB
	dbw 9, GROWTH
	dbw 12, LEECH_SEED
	dbw 16, MUD_SLAP
	dbw 20, NEEDLE_ARM
	dbw 24, SPIKES
	dbw 28, FAINT_ATTACK
	dbw 32, SANDSTORM
	dbw 36, PURSUIT
	dbw 40, LEAF_BLADE
	dbw 42, GROWTH
	dbw 45, SOLARBEAM
	dbw 50, GIGA_DRAIN
	dbw 55, COSMIC_POWER
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

CacturneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 5, ABSORB
	dbw 9, GROWTH
	dbw 12, LEECH_SEED
	dbw 16, MUD_SLAP
	dbw 20, NEEDLE_ARM
	dbw 24, SPIKES
	dbw 28, FAINT_ATTACK
	dbw 32, SANDSTORM
	dbw 36, PURSUIT
	dbw 40, LEAF_BLADE
	dbw 42, GROWTH
	dbw 45, SOLARBEAM
	dbw 50, GIGA_DRAIN
	dbw 55, COSMIC_POWER
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

SwabluEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, ALTARIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 8, SING
	dbw 12, PIXIE_DUST
	dbw 16, TWISTER
	dbw 20, SAFEGUARD
	dbw 22, MIST
	dbw 24, FAE_VOICE
	dbw 28, DRAGON_RAGE
	dbw 32, MIRROR_MOVE
	dbw 36, DRAGON_CLAW
	dbw 40, PLAY_ROUGH	
	dbw 42, DRAGON_DANCE
	dbw 45, PERISH_SONG
	dbw 50, RECOVER
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

AltariaEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, ALTARIAX
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 8, SING
	dbw 12, PIXIE_DUST
	dbw 16, TWISTER
	dbw 20, SAFEGUARD
	dbw 22, MIST
	dbw 24, FAE_VOICE
	dbw 28, DRAGON_RAGE
	dbw 32, MIRROR_MOVE
	dbw 36, DRAGON_CLAW
	dbw 40, PLAY_ROUGH	
	dbw 42, DRAGON_DANCE
	dbw 45, PERISH_SONG
	dbw 50, RECOVER
	dbw 55, OUTRAGE
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

ZangooseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 4, LEER
	dbw 7, QUICK_ATTACK
	dbw 10, SWORDS_DANCE
	dbw 16, FURY_CUTTER
	dbw 22, FAINT_ATTACK
	dbw 24, FALSE_SWIPE
	dbw 28, CRUSH_CLAW
	dbw 36, SLASH
	dbw 40, PURSUIT
	dbw 42, DETECT
	dbw 45, AGILITY
	dbw 50, OUTRAGE
	db 0 ; no more level-up moves

SeviperEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 7, LICK
	dbw 10, BITE
	dbw 16, SCREECH
	dbw 20, GLARE
	dbw 24, POISON_TAIL
	dbw 28, FIRE_FANG
	dbw 32, BULK_UP
	dbw 36, CRUNCH
	dbw 40, POISON_JAB
	dbw 42, DRAGON_DANCE
	dbw 37, SWAGGER
	dbw 43, HAZE
	dbw 50, THUNDER_FANG
	dbw 55, ICE_FANG
	dbw 60, IRON_TAIL
	db 0 ; no more level-up moves

LunatoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 7, CONFUSION
	dbw 13, ROCK_THROW
	dbw 19, HYPNOSIS
	dbw 25, PSYWAVE
	dbw 30, CALM_MIND
	dbw 32, COSMIC_POWER
	dbw 36, PSYCHIC_M
	dbw 40, POWER_GEM
	dbw 42, MOONBLAST
	dbw 45, ICE_BEAM	
	dbw 50, FUTURE_SIGHT	
	db 0 ; no more level-up moves

SolrockEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 7, CONFUSION
	dbw 13, ROCK_THROW
	dbw 19, HYPNOSIS
	dbw 25, PSYWAVE
	dbw 30, CALM_MIND
	dbw 32, COSMIC_POWER
	dbw 36, PSYCHIC_M
	dbw 40, POWER_GEM
	dbw 42, SUNNY_DAY
	dbw 42, SOLARBEAM
	dbw 45, FLAMETHROWER	
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

BarboachEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, WHISCASH
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, SLAM
	dbw 20, MUD_SHOT
	dbw 24, WATER_PULSE	
	dbw 28, WHIRLPOOL
	dbw 32, MUDDY_WATER
	dbw 36, RAIN_DANCE
	dbw 42, EARTHQUAKE
	dbw 45, GROWTH
	dbw 50, HYDRO_PUMP
	dbw 55, OUTRAGE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

WhiscashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 6, SAND_ATTACK
	dbw 10, CLAMP
	dbw 14, BIDE
	dbw 16, SLAM
	dbw 20, MUD_SHOT
	dbw 24, WATER_PULSE	
	dbw 28, WHIRLPOOL
	dbw 32, MUDDY_WATER
	dbw 36, RAIN_DANCE
	dbw 42, EARTHQUAKE
	dbw 45, GROWTH
	dbw 50, HYDRO_PUMP
	dbw 55, OUTRAGE
	dbw 60, HYDRO_CANNON
	db 0 ; no more level-up moves

CorphishEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CRAWDAUNT
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 5, BITE
	dbw 10, LEER
	dbw 16, AQUA_JET
	dbw 20, BUBBLEBEAM
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, CRUNCH
	dbw 36, RAZORSHELL
	dbw 40, GUILLOTINE
	dbw 42, BULK_UP
	dbw 45, AGILITY
	dbw 50, DRAGON_CLAW
	dbw 55, PURSUIT
	dbw 60, WATER_SPOUT
	db 0 ; no more level-up moves

CrawdauntEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 5, BITE
	dbw 10, LEER
	dbw 16, AQUA_JET
	dbw 20, BUBBLEBEAM
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, CRUNCH
	dbw 36, RAZORSHELL
	dbw 40, GUILLOTINE
	dbw 42, BULK_UP
	dbw 45, AGILITY
	dbw 50, DRAGON_CLAW
	dbw 55, PURSUIT
	dbw 60, WATER_SPOUT
	db 0 ; no more level-up moves

BaltoyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CLAYDOL
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HARDEN
	dbw 5, SAND_ATTACK
	dbw 10, TELEPORT
	dbw 16, ROCK_TOMB
	dbw 20, MUD_SHOT
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SANDSTORM
	dbw 36, EXTRASENSORY
	dbw 40, EARTHQUAKE
	dbw 42, COSMIC_POWER
	dbw 45, EXPLOSION
	dbw 50, POWER_GEM
	dbw 55, EXPLOSION
	dbw 60, CALM_MIND
	db 0 ; no more level-up moves

ClaydolEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HARDEN
	dbw 5, SAND_ATTACK
	dbw 10, TELEPORT
	dbw 16, ROCK_TOMB
	dbw 20, MUD_SHOT
	dbw 24, PSYBEAM
	dbw 28, RECOVER
	dbw 32, SANDSTORM
	dbw 36, EXTRASENSORY
	dbw 40, EARTHQUAKE
	dbw 42, COSMIC_POWER
	dbw 45, EXPLOSION
	dbw 50, POWER_GEM
	dbw 55, EXPLOSION
	dbw 60, CALM_MIND
	db 0 ; no more level-up moves

LileepEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CRADILY
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 5, ROCK_THROW
	dbw 10, LEECH_SEED
	dbw 12, CONFUSE_RAY
	dbw 16, ACID
	dbw 20, MAGICAL_LEAF
	dbw 24, ANCIENTPOWER
	dbw 28, SLUDGE
	dbw 32, CURSE
	dbw 36, GIGA_DRAIN
	dbw 40, POWER_GEM
	dbw 42, AMNESIA
	dbw 45, SLUDGE_BOMB
	dbw 50, SUNNY_DAY
	dbw 50, SOLARBEAM
	dbw 55, RECOVER
	dbw 60, SPORE
	db 0 ; no more level-up moves

CradilyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 5, ROCK_THROW
	dbw 10, LEECH_SEED
	dbw 12, CONFUSE_RAY
	dbw 16, ACID
	dbw 20, MAGICAL_LEAF
	dbw 24, ANCIENTPOWER
	dbw 28, SLUDGE
	dbw 32, CURSE
	dbw 36, GIGA_DRAIN
	dbw 40, POWER_GEM
	dbw 42, AMNESIA
	dbw 45, SLUDGE_BOMB
	dbw 50, SUNNY_DAY
	dbw 50, SOLARBEAM
	dbw 55, RECOVER
	dbw 60, SPORE
	db 0 ; no more level-up moves

AnorithEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ARMALDO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, HARDEN
	dbw 8, STRING_SHOT
	dbw 12, ROCK_THROW
	dbw 16, CLAMP
	dbw 20, FURY_CUTTER
	dbw 24, ROCK_TOMB
	dbw 28, AQUA_JET
	dbw 31, PROTECT
	dbw 32, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, DRAGON_CLAW
	dbw 42, SWORDS_DANCE
	dbw 45, SLASH
	dbw 50, MEGAHORN
	dbw 55, SHADOW_CLAW
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

ArmaldoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, HARDEN
	dbw 8, STRING_SHOT
	dbw 12, ROCK_THROW
	dbw 16, CLAMP
	dbw 20, FURY_CUTTER
	dbw 24, ROCK_TOMB
	dbw 28, AQUA_JET
	dbw 31, PROTECT
	dbw 32, SANDSTORM
	dbw 36, ROCK_SLIDE
	dbw 40, DRAGON_CLAW
	dbw 42, SWORDS_DANCE
	dbw 45, SLASH
	dbw 50, MEGAHORN
	dbw 55, SHADOW_CLAW
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

FeebasEvosAttacks:
	; dbww EVOLVE_ITEM, PRISM_SCALE, MILOTIC
	dbbw EVOLVE_LEVEL, 25, MILOTIC
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 15, TACKLE
	dbw 20, WATER_PULSE
	dbw 24, DRAININGKISS
	db 0 ; no more level-up moves

MiloticEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 15, TACKLE
	dbw 20, WATER_PULSE
	dbw 24, DRAININGKISS
	dbw 25, MIRROR_COAT
	dbw 28, RECOVER
	dbw 30, RAIN_DANCE
	dbw 32, DRAGONBREATH
	dbw 36, WATER_SPOUT
	dbw 40, FAERIEGLEAM
	dbw 42, CALM_MIND
	dbw 45, SAFEGUARD
	dbw 50, SCALD
	dbw 55, ATTRACT
	dbw 60, AGILITY
	db 0 ; no more level-up moves

KecleonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, LICK
	dbw 1, SCRATCH
	dbw 5, TAIL_WHIP
	dbw 8, BIND
	dbw 12, SKETCH
	dbw 16, FURY_SWIPES
	dbw 20, FURY_CUTTER
	dbw 24, FAINT_ATTACK
	dbw 32, SLASH
	dbw 36, PURSUIT
	dbw 40, SUBSTITUTE
	dbw 42, BULK_UP
	dbw 45, RECOVER
	dbw 50, DOUBLE_TEAM
	dbw 55, SKETCH
	dbw 60, SKETCH
	db 0 ; no more level-up moves

ShuppetEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, BANETTE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 5, DISABLE
	dbw 8, ASTONISH
	dbw 12, WILLOWISP
	dbw 16, CURSE
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, DESTINY_BOND
	dbw 36, PURSUIT
	dbw 40, PSYCHO_CUT
	dbw 42, DRAGON_DANCE
	dbw 45, MEAN_LOOK
	dbw 50, RECOVER
	dbw 55, SHADOW_FORCE
	dbw 60, FLAME_WHEEL
	db 0 ; no more level-up moves

BanetteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 5, DISABLE
	dbw 8, ASTONISH
	dbw 12, WILLOWISP
	dbw 16, CURSE
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, DESTINY_BOND
	dbw 36, PURSUIT
	dbw 40, PSYCHO_CUT
	dbw 42, DRAGON_DANCE
	dbw 45, MEAN_LOOK
	dbw 50, RECOVER
	dbw 55, SHADOW_FORCE
	dbw 60, FLAME_WHEEL
	db 0 ; no more level-up moves

DuskullEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DUSCLOPS
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 5, DISABLE
	dbw 8, ASTONISH
	dbw 12, WILLOWISP
	dbw 16, CURSE
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, COSMIC_POWER
	dbw 36, PURSUIT
	dbw 40, PSYCHO_CUT
	dbw 42, DRAGON_DANCE
	dbw 45, MEAN_LOOK
	dbw 50, RECOVER
	dbw 55, SHADOW_FORCE
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

DusclopsEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, DUSKNOIR
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 5, DISABLE
	dbw 8, ASTONISH
	dbw 12, WILLOWISP
	dbw 16, CURSE
	dbw 20, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 24, FAINT_ATTACK
	dbw 28, SHADOW_CLAW
	dbw 32, COSMIC_POWER
	dbw 36, PURSUIT
	dbw 40, PSYCHO_CUT
	dbw 42, DRAGON_DANCE
	dbw 45, MEAN_LOOK
	dbw 50, RECOVER
	dbw 55, SHADOW_FORCE
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

TropiusEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, TROPIUSX
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, LEECH_SEED
	dbw 7, GROWTH
	dbw 11, SWEET_SCENT
	dbw 17, RAZOR_LEAF
	dbw 21, AERIAL_ACE
	dbw 27, WHIRLWIND
	dbw 31, MAGICAL_LEAF
	dbw 33, BODY_SLAM
	dbw 36, LEAF_BLADE
	dbw 40, DRAGON_DANCE
	dbw 41, SOLARBEAM
	dbw 45, SUNNY_DAY
	dbw 47, SYNTHESIS
	dbw 50, SKY_ATTACK
	dbw 60, HURRICANE
	db 0 ; no more level-up moves

ChimechoEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, CHIMECHOX
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, PSYWAVE
	dbw 7, ASTONISH
	dbw 11, GROWL
	dbw 15, CONFUSION
	dbw 17, HEAL_BELL
	dbw 21, PSYBEAM
	dbw 27, CALM_MIND
	dbw 31, MAGICAL_LEAF
	dbw 33, EXTRASENSORY
	dbw 36, SAFEGUARD
	dbw 40, COSMIC_POWER
	dbw 41, RECOVER
	dbw 45, BARRIER
	dbw 47, ICY_WIND
	dbw 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

AbsolEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, ABSOLX
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 5, LEER
	dbw 8, QUICK_ATTACK
	dbw 12, BITE
	dbw 17, FURY_CUTTER
	dbw 21, FAINT_ATTACK
	dbw 26, SWORDS_DANCE
	dbw 31, DOUBLE_TEAM
	dbw 33, PURSUIT
	dbw 36, SLASH
	dbw 40, PLAY_ROUGH
	dbw 41, FUTURE_SIGHT
	dbw 45, PERISH_SONG
	dbw 47, EXTREMESPEED
	dbw 50, DRAGON_DANCE
	dbw 60, SKY_ATTACK
	db 0 ; no more level-up moves

WynautEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, WOBBUFFET
	db 0 ; no more evolutions
	dbw 1, CHARM
	dbw 1, ENCORE
	dbw 1, SPLASH
	dbw 15, COUNTER
	dbw 15, DESTINY_BOND
	dbw 15, MIRROR_COAT
	dbw 15, SAFEGUARD
	db 0 ; no more level-up moves

SnoruntEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GLALIE
	dbww EVOLVE_ITEM, DAWN_STONE, FROSLASS
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, POWDER_SNOW
	dbw 7, LEER
	dbw 12, ICY_WIND
	dbw 16, BITE
	dbw 20, ICE_FANG
	dbw 24, DRAININGKISS
	dbw 28, SHADOW_CLAW
	dbw 32, CALM_MIND
	dbw 34, COSMIC_POWER
	dbw 36, ICE_BEAM
	dbw 40, SHADOW_BALL
	dbw 42, BULK_UP
	dbw 45, HAIL
	dbw 50, BLIZZARD	
	dbw 55, PROTECT
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

GlalieEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, GLALIEX
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, POWDER_SNOW
	dbw 7, LEER
	dbw 12, ICY_WIND
	dbw 16, BITE
	dbw 20, ICE_FANG
	dbw 24, DRAININGKISS
	dbw 28, SHADOW_CLAW
	dbw 32, CALM_MIND
	dbw 34, COSMIC_POWER
	dbw 36, ICE_BEAM
	dbw 40, SHADOW_BALL
	dbw 42, BULK_UP
	dbw 45, HAIL
	dbw 50, BLIZZARD	
	dbw 55, PROTECT
	dbw 60, DESTINY_BOND
	db 0 ; no more level-up moves

SphealEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, SEALEO
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

SealeoEvosAttacks:
	dbbw EVOLVE_LEVEL, 44, WALREIN
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

WalreinEvosAttacks:
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

ClamperlEvosAttacks:
	dbww EVOLVE_ITEM, DRAGON_FANG, HUNTAIL
	dbww EVOLVE_ITEM, DRAGON_SCALE, GOREBYSS
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WATER_GUN
	dbw 1, DEFENSE_CURL
	db 0 ; no more level-up moves

HuntailEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 8, BITE
	dbw 12, TAIL_WHIP
	dbw 16, SHARPEN
	dbw 20, AQUA_JET
	dbw 24, FAINT_ATTACK
	dbw 28, POISON_TAIL
	dbw 32, HYPER_FANG
	dbw 36, CRUNCH
	dbw 40, THUNDER_FANG
	dbw 42, DRAGON_DANCE
	dbw 45, ICE_FANG
	dbw 50, BATON_PASS
	dbw 55, HYDRO_PUMP
	dbw 60, FIRE_FANG
	db 0 ; no more level-up moves

GorebyssEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 8, CONFUSION
	dbw 12, TAIL_WHIP
	dbw 16, MUD_SHOT
	dbw 20, WATER_PULSE
	dbw 24, PSYBEAM
	dbw 28, DRAININGKISS
	dbw 32, AGILITY
	dbw 36, PSYCHIC_M
	dbw 40, THUNDER_WAVE
	dbw 42, BARRIER
	dbw 45, AMNESIA
	dbw 50, BATON_PASS
	dbw 55, HYDRO_PUMP
	dbw 60, SHADOW_BALL
	db 0 ; no more level-up moves

RelicanthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 8, WATER_GUN
	dbw 16, ROCK_TOMB
	dbw 20, WATER_PULSE
	dbw 24, ANCIENTPOWER
	dbw 28, SAFEGUARD
	dbw 32, RAIN_DANCE
	dbw 36, ROCK_SLIDE
	dbw 40, EARTHQUAKE
	dbw 42, COSMIC_POWER
	dbw 45, REST
	dbw 50, HYDRO_PUMP
	dbw 55, DOUBLE_EDGE
	dbw 60, SKULL_BASH
	db 0 ; no more level-up moves

LuvdiscEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 4, CHARM
	dbw 8, TACKLE
	dbw 12, AQUA_JET
	dbw 16, AGILITY
	dbw 20, WATER_PULSE
	dbw 24, DRAININGKISS
	dbw 28, ATTRACT
	dbw 32, SWEET_KISS
	dbw 36, FAERIEGLEAM
	dbw 40, BATON_PASS
	dbw 42, CALM_MIND
	dbw 45, RAIN_DANCE
	dbw 48, SAFEGUARD
	dbw 50, DRAGON_DANCE
	dbw 55, FLASHCANNON
	dbw 60, WATER_SPOUT
	db 0 ; no more level-up moves

BagonEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SHELGON
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, BITE
	dbw 9, LEER
	dbw 13, TWISTER
	dbw 17, HEADBUTT
	dbw 21, SCARY_FACE
	dbw 25, FIRE_FANG
	dbw 33, CRUSH_CLAW
	dbw 36, DRAGON_CLAW
	dbw 37, FLAMETHROWER
	dbw 41, CRUNCH
	dbw 45, DRAGON_DANCE
	dbw 49, DRAGONBREATH
	dbw 53, OUTRAGE
	dbw 56, FLAME_WHEEL
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

ShelgonEvosAttacks:
	dbbw EVOLVE_LEVEL, 50, SALAMENCE
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, BITE
	dbw 9, LEER
	dbw 13, TWISTER
	dbw 17, HEADBUTT
	dbw 21, SCARY_FACE
	dbw 25, FIRE_FANG
	dbw 33, CRUSH_CLAW
	dbw 36, DRAGON_CLAW
	dbw 37, FLAMETHROWER
	dbw 41, CRUNCH
	dbw 45, DRAGON_DANCE
	dbw 49, DRAGONBREATH
	dbw 53, OUTRAGE
	dbw 56, FLAME_WHEEL
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

SalamenceEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SALAMENCEX
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 5, BITE
	dbw 9, LEER
	dbw 13, TWISTER
	dbw 17, HEADBUTT
	dbw 21, SCARY_FACE
	dbw 25, FIRE_FANG
	dbw 33, CRUSH_CLAW
	dbw 36, DRAGON_CLAW
	dbw 37, FLAMETHROWER
	dbw 41, CRUNCH
	dbw 45, DRAGON_DANCE
	dbw 49, DRAGONBREATH
	dbw 53, OUTRAGE
	dbw 56, FLAME_WHEEL
	dbw 60, HYPER_BEAM
	db 0 ; no more level-up moves

BeldumEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, METANG
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 12, BITE
	dbw 16, SPIKES
	dbw 20, HEADBUTT
	dbw 22, BULLET_PUNCH
	dbw 24, PSYBEAM
	dbw 28, REFLECT
	dbw 32, PURSUIT
	dbw 36, PSYCHIC_M
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, ZEN_HEADBUTT
	dbw 50, FLASHCANNON
	dbw 55, AGILITY
	dbw 60, REFLECT
	db 0 ; no more level-up moves

MetangEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, METAGROSS
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 12, BITE
	dbw 16, SPIKES
	dbw 20, HEADBUTT
	dbw 22, BULLET_PUNCH
	dbw 24, PSYBEAM
	dbw 28, REFLECT
	dbw 32, PURSUIT
	dbw 36, PSYCHIC_M
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, ZEN_HEADBUTT
	dbw 50, FLASHCANNON
	dbw 55, AGILITY
	dbw 60, REFLECT
	db 0 ; no more level-up moves

MetagrossEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, METAGROSSX
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 12, BITE
	dbw 16, SPIKES
	dbw 20, HEADBUTT
	dbw 22, BULLET_PUNCH
	dbw 24, PSYBEAM
	dbw 28, REFLECT
	dbw 32, PURSUIT
	dbw 36, PSYCHIC_M
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, ZEN_HEADBUTT
	dbw 50, FLASHCANNON
	dbw 55, AGILITY
	dbw 60, REFLECT
	db 0 ; no more level-up moves

RegirockEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, ROCK_THROW
	dbw 7, CURSE
	dbw 16, ROCK_TOMB
	dbw 20, STOMP
	dbw 24, ANCIENTPOWER
	dbw 28, SANDSTORM
	dbw 32, RECOVER
	dbw 36, ROCK_SLIDE
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, SUPERPOWER
	dbw 50, ZAP_CANNON
	dbw 55, LOCK_ON
	dbw 60, STONE_EDGE
	db 0 ; no more level-up moves

RegiceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, POWDER_SNOW
	dbw 7, CURSE
	dbw 16, ICY_WIND
	dbw 20, STOMP
	dbw 24, ANCIENTPOWER
	dbw 28, HAIL
	dbw 32, RECOVER
	dbw 36, ICE_BEAM
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, SUPERPOWER
	dbw 50, BLIZZARD
	dbw 55, LOCK_ON
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

RegisteelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, METAL_CLAW
	dbw 7, CURSE
	dbw 16, ROCK_TOMB
	dbw 20, STOMP
	dbw 24, ANCIENTPOWER
	dbw 28, SANDSTORM
	dbw 32, RECOVER
	dbw 36, ROCK_SLIDE
	dbw 40, METEOR_MASH
	dbw 42, COSMIC_POWER
	dbw 45, SUPERPOWER
	dbw 50, ZAP_CANNON
	dbw 55, LOCK_ON
	dbw 60, FLASHCANNON
	db 0 ; no more level-up moves

LatiasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 7, SAFEGUARD
	dbw 16, PSYWAVE
	dbw 20, TWISTER
	dbw 24, CHARM
	dbw 28, PSYBEAM
	dbw 32, MIST_BALL
	dbw 36, PSYCHIC_M
	dbw 40, DRAGONBREATH
	dbw 42, CALM_MIND
	dbw 45, SILVER_WIND
	dbw 50, RAZOR_WIND
	dbw 55, FUTURE_SIGHT
	dbw 60, LUSTER_PURGE

LatiosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 7, SAFEGUARD
	dbw 16, PSYWAVE
	dbw 20, TWISTER
	dbw 24, CHARM
	dbw 28, PSYBEAM
	dbw 32, MIST_BALL
	dbw 36, PSYCHIC_M
	dbw 40, DRAGONBREATH
	dbw 42, CALM_MIND
	dbw 45, SILVER_WIND
	dbw 50, RAZOR_WIND
	dbw 55, FUTURE_SIGHT
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

KyogreEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 7, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 20, ICY_WIND
	dbw 24, SLAM
	dbw 28, RAIN_DANCE
	dbw 32, BODY_SLAM
	dbw 36, ICE_BEAM
	dbw 40, SURF
	dbw 42, CALM_MIND
	dbw 45, EARTHQUAKE
	dbw 50, HYDRO_PUMP
	dbw 55, BLIZZARD
	dbw 60, WATER_SPOUT
	db 0 ; no more level-up moves

GroudonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 7, SCARY_FACE
	dbw 16, MUD_SHOT
	dbw 20, ANCIENTPOWER
	dbw 24, SLAM
	dbw 28, SUNNY_DAY
	dbw 32, BODY_SLAM
	dbw 36, EARTHQUAKE
	dbw 40, FLAME_WHEEL
	dbw 42, BULK_UP
	dbw 45, RECOVER
	dbw 50, FIRE_BLAST
	dbw 55, FISSURE
	dbw 60, ERUPTION
	db 0 ; no more level-up moves

RayquazaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 7, SCARY_FACE
	dbw 16, WING_ATTACK
	dbw 20, ANCIENTPOWER
	dbw 24, SLAM
	dbw 28, SUNNY_DAY
	dbw 32, HYPER_VOICE
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 42, DRAGON_DANCE
	dbw 45, RECOVER
	dbw 50, SKY_ATTACK
	dbw 55, EARTHQUAKE
	dbw 60, OUTRAGE
	db 0 ; no more level-up moves

JirachiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 10, REST
	dbw 12, COSMIC_POWER
	dbw 16, SPIKES
	dbw 20, PSYBEAM
	dbw 24, CHARM
	dbw 28, ANCIENTPOWER
	dbw 32, CALM_MIND
	dbw 36, PSYCHIC_M
	dbw 40, FLASHCANNON
	dbw 42, BATON_PASS
	dbw 45, ZEN_HEADBUTT
	dbw 50, FAERIEGLEAM
	dbw 55, SANDSTORM
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves


ENDSECTION
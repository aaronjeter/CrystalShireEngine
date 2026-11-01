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
	dw RowletEvosAttacks
	dw DartrixEvosAttacks
	dw DecidueyeEvosAttacks
	dw LittenEvosAttacks
	dw TorracatEvosAttacks
	dw IncineroarEvosAttacks
	dw PopplioEvosAttacks
	dw BrionneEvosAttacks
	dw PrimarinaEvosAttacks
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
	dbw 1, POUND
	dbw 1, LEER
	dbw 1, ABSORB
	dbw 4, QUICK_ATTACK
	dbw 7, MEGA_DRAIN
	dbw 10, DETECT
	dbw 13, FURY_CUTTER
	dbw 16, LEECH_SEED
	dbw 19, RAZOR_LEAF
	dbw 22, FAINT_ATTACK
	dbw 25, DRAGON_RAGE
	dbw 28, SUBSTITUTE
	dbw 31, FALSE_SWIPE
	dbw 34, LEAF_BLADE
	dbw 37, DRAGONBREATH
	dbw 40, GIGA_DRAIN
	dbw 43, NIGHT_SLASH
	dbw 46, SUNNY_DAY
	dbw 49, DRAGON_CLAW
	dbw 52, SWORDS_DANCE
	dbw 55, DRAGON_DANCE
	dbw 58, SOLARBEAM
	dbw 62, OUTRAGE
	dbw 66, FRENZY_PLANT
	dbw 70, PETAL_DANCE
	db 0 ; no more level-up moves

GrovyleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SCEPTILE
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LEER
	dbw 1, ABSORB
	dbw 4, QUICK_ATTACK
	dbw 7, MEGA_DRAIN
	dbw 10, DETECT
	dbw 13, FURY_CUTTER
	dbw 16, LEECH_SEED
	dbw 19, RAZOR_LEAF
	dbw 22, FAINT_ATTACK
	dbw 25, DRAGON_RAGE
	dbw 28, SUBSTITUTE
	dbw 31, FALSE_SWIPE
	dbw 34, LEAF_BLADE
	dbw 37, DRAGONBREATH
	dbw 40, GIGA_DRAIN
	dbw 43, NIGHT_SLASH
	dbw 46, SUNNY_DAY
	dbw 49, DRAGON_CLAW
	dbw 52, SWORDS_DANCE
	dbw 55, DRAGON_DANCE
	dbw 58, SOLARBEAM
	dbw 62, OUTRAGE
	dbw 66, FRENZY_PLANT
	dbw 70, PETAL_DANCE
	db 0 ; no more level-up moves

SceptileEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SCEPTILEX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, LEER
	dbw 1, ABSORB
	dbw 4, QUICK_ATTACK
	dbw 7, MEGA_DRAIN
	dbw 10, DETECT
	dbw 13, FURY_CUTTER
	dbw 16, LEECH_SEED
	dbw 19, RAZOR_LEAF
	dbw 22, FAINT_ATTACK
	dbw 25, DRAGON_RAGE
	dbw 28, SUBSTITUTE
	dbw 31, FALSE_SWIPE
	dbw 34, LEAF_BLADE
	dbw 37, DRAGONBREATH
	dbw 40, GIGA_DRAIN
	dbw 43, NIGHT_SLASH
	dbw 46, SUNNY_DAY
	dbw 49, DRAGON_CLAW
	dbw 52, SWORDS_DANCE
	dbw 55, DRAGON_DANCE
	dbw 58, SOLARBEAM
	dbw 62, OUTRAGE
	dbw 66, FRENZY_PLANT
	dbw 70, PETAL_DANCE
	db 0 ; no more level-up moves

TorchicEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, COMBUSKEN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, QUICK_ATTACK
	dbw 7, PECK
	dbw 10, FLAME_CHARGE
	dbw 13, DETECT
	dbw 16, DOUBLE_KICK
	dbw 19, MACH_PUNCH
	dbw 22, ROLLING_KICK
	dbw 25, AERIAL_ACE
	dbw 28, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, BULK_UP
	dbw 37, BLAZE_KICK
	dbw 40, MYSTICAL_FIRE
	dbw 43, JUMP_KICK
	dbw 46, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 52, SWORDS_DANCE
	dbw 55, AURA_SPHERE
	dbw 58, HEAT_WAVE
	dbw 62, HI_JUMP_KICK
	dbw 66, MEGA_KICK
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

CombuskenEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLAZIKEN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, QUICK_ATTACK
	dbw 7, PECK
	dbw 10, FLAME_CHARGE
	dbw 13, DETECT
	dbw 16, DOUBLE_KICK
	dbw 19, MACH_PUNCH
	dbw 22, ROLLING_KICK
	dbw 25, AERIAL_ACE
	dbw 28, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, BULK_UP
	dbw 37, BLAZE_KICK
	dbw 40, MYSTICAL_FIRE
	dbw 43, JUMP_KICK
	dbw 46, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 52, SWORDS_DANCE
	dbw 55, AURA_SPHERE
	dbw 58, HEAT_WAVE
	dbw 62, HI_JUMP_KICK
	dbw 66, MEGA_KICK
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

BlazikenEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, BLAZIKENX
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, QUICK_ATTACK
	dbw 7, PECK
	dbw 10, FLAME_CHARGE
	dbw 13, DETECT
	dbw 16, DOUBLE_KICK
	dbw 19, MACH_PUNCH
	dbw 22, ROLLING_KICK
	dbw 25, AERIAL_ACE
	dbw 28, FOCUS_ENERGY
	dbw 31, SLASH
	dbw 34, BULK_UP
	dbw 37, BLAZE_KICK
	dbw 40, MYSTICAL_FIRE
	dbw 43, JUMP_KICK
	dbw 46, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 52, SWORDS_DANCE
	dbw 55, AURA_SPHERE
	dbw 58, HEAT_WAVE
	dbw 62, HI_JUMP_KICK
	dbw 66, MEGA_KICK
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

MudkipEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, MARSHTOMP
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 16, BULLDOZE
	dbw 19, YAWN
	dbw 22, ROCK_SLIDE
	dbw 25, TAKE_DOWN
	dbw 28, AMNESIA
	dbw 31, SPIKES
	dbw 34, RAIN_DANCE
	dbw 37, MUDDY_WATER
	dbw 40, SCREECH
	dbw 43, CURSE
	dbw 46, AQUA_TAIL
	dbw 49, EARTHPOWER
	dbw 52, BODY_PRESS
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, STONE_EDGE
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

MarshtompEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, SWAMPERT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 16, BULLDOZE
	dbw 19, YAWN
	dbw 22, ROCK_SLIDE
	dbw 25, TAKE_DOWN
	dbw 28, AMNESIA
	dbw 31, SPIKES
	dbw 34, RAIN_DANCE
	dbw 37, MUDDY_WATER
	dbw 40, SCREECH
	dbw 43, CURSE
	dbw 46, AQUA_TAIL
	dbw 49, EARTHPOWER
	dbw 52, BODY_PRESS
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, STONE_EDGE
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

SwampertEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SWAMPERTX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 16, BULLDOZE
	dbw 19, YAWN
	dbw 22, ROCK_SLIDE
	dbw 25, TAKE_DOWN
	dbw 28, AMNESIA
	dbw 31, SPIKES
	dbw 34, RAIN_DANCE
	dbw 37, MUDDY_WATER
	dbw 40, SCREECH
	dbw 43, CURSE
	dbw 46, AQUA_TAIL
	dbw 49, EARTHPOWER
	dbw 52, BODY_PRESS
	dbw 55, WATERFALL
	dbw 60, HYDRO_PUMP
	dbw 65, STONE_EDGE
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

PoochyenaEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, MIGHTYENA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, BITE
	dbw 4, SAND_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, PURSUIT
	dbw 13, SNARL
	dbw 16, FAINT_ATTACK
	dbw 19, SCARY_FACE
	dbw 22, FIRE_FANG
	dbw 25, YAWN
	dbw 28, TAUNT
	dbw 31, ICE_FANG
	dbw 34, TAKE_DOWN
	dbw 37, CRUNCH
	dbw 40, SUCKER_PUNCH
	dbw 43, THUNDER_FANG
	dbw 46, KNOCK_OFF
	dbw 49, NIGHT_SLASH
	dbw 52, HYPER_FANG
	dbw 55, PLAY_ROUGH
	dbw 60, BEAT_UP
	db 0 ; no more level-up moves

MightyenaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, BITE
	dbw 4, SAND_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, PURSUIT
	dbw 13, SNARL
	dbw 16, FAINT_ATTACK
	dbw 19, SCARY_FACE
	dbw 22, FIRE_FANG
	dbw 25, YAWN
	dbw 28, TAUNT
	dbw 31, ICE_FANG
	dbw 34, TAKE_DOWN
	dbw 37, CRUNCH
	dbw 40, SUCKER_PUNCH
	dbw 43, THUNDER_FANG
	dbw 46, KNOCK_OFF
	dbw 49, NIGHT_SLASH
	dbw 52, HYPER_FANG
	dbw 55, PLAY_ROUGH
	dbw 60, BEAT_UP
	db 0 ; no more level-up moves

ZigzagoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, LINOONE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, HEADBUTT
	dbw 13, FURY_SWIPES
	dbw 16, BITE
	dbw 19, REST
	dbw 22, TAKE_DOWN
	dbw 25, SLEEP_TALK
	dbw 28, SLASH
	dbw 31, FLAIL
	dbw 34, BODY_SLAM
	dbw 37, HYPER_VOICE
	dbw 40, BELLY_DRUM
	dbw 43, TRI_ATTACK
	dbw 46, EXTREMESPEED
	dbw 49, CRUNCH
	dbw 52, THRASH
	dbw 55, SUPER_FANG
	dbw 60, DOUBLE_EDGE
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

LinooneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 7, QUICK_ATTACK
	dbw 10, HEADBUTT
	dbw 13, FURY_SWIPES
	dbw 16, BITE
	dbw 19, REST
	dbw 22, TAKE_DOWN
	dbw 25, SLEEP_TALK
	dbw 28, SLASH
	dbw 31, FLAIL
	dbw 34, BODY_SLAM
	dbw 37, HYPER_VOICE
	dbw 40, BELLY_DRUM
	dbw 43, TRI_ATTACK
	dbw 46, EXTREMESPEED
	dbw 49, CRUNCH
	dbw 52, THRASH
	dbw 55, SUPER_FANG
	dbw 60, DOUBLE_EDGE
	dbw 65, HYPER_BEAM
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
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	dbw 1, POISON_STING
	dbw 7, HARDEN
	db 0 ; no more level-up moves

BeautiflyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, STRING_SHOT
	dbw 1, GUST
	dbw 12, STUN_SPORE
	dbw 14, POISONPOWDER
	dbw 16, SILVER_WIND
	dbw 19, SLEEP_POWDER
	dbw 22, MEGA_DRAIN
	dbw 25, AIR_CUTTER
	dbw 28, DRAININGKISS
	dbw 31, MEDITATE
	dbw 34, SIGNAL_BEAM
	dbw 37, MORNING_SUN
	dbw 40, GIGA_DRAIN
	dbw 43, ANCIENTPOWER
	dbw 46, PSYCHIC_M
	dbw 50, STRENGTH_SAP
	dbw 55, BATON_PASS
	dbw 60, HURRICANE
	dbw 65, SOLARBEAM
	db 0 ; no more level-up moves

CascoonEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, DUSTOX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	dbw 1, POISON_STING
	dbw 7, HARDEN
	db 0 ; no more level-up moves

DustoxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, STRING_SHOT
	dbw 1, GUST
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, CONFUSE_RAY
	dbw 19, SILVER_WIND
	dbw 22, PSYBEAM
	dbw 25, VENOSHOCK
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, TOXIC
	dbw 37, MOONLIGHT
	dbw 40, SIGNAL_BEAM
	dbw 43, PSYCHIC_M
	dbw 46, WHIRLWIND
	dbw 49, SLUDGE_WAVE
	dbw 52, HAZE
	dbw 55, CALM_MIND
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

LotadEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, LOMBRE
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, WATER_GUN
	dbw 7, MIST
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, FURY_SWIPES
	dbw 19, BUBBLEBEAM
	dbw 22, RAIN_DANCE
	dbw 25, MAGICAL_LEAF
	dbw 28, KNOCK_OFF
	dbw 31, MUD_SHOT
	dbw 34, FLAIL
	dbw 37, SUNNY_DAY
	dbw 40, GIGA_DRAIN
	dbw 43, ZEN_HEADBUTT
	dbw 46, MUDDY_WATER
	dbw 49, AQUA_RING
	dbw 52, PETAL_DANCE
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	dbw 65, SOLARBEAM
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

LombreEvosAttacks:
	dbww EVOLVE_ITEM, WATER_STONE, LUDICOLO
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, WATER_GUN
	dbw 7, MIST
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, FURY_SWIPES
	dbw 19, BUBBLEBEAM
	dbw 22, RAIN_DANCE
	dbw 25, MAGICAL_LEAF
	dbw 28, KNOCK_OFF
	dbw 31, MUD_SHOT
	dbw 34, FLAIL
	dbw 37, SUNNY_DAY
	dbw 40, GIGA_DRAIN
	dbw 43, ZEN_HEADBUTT
	dbw 46, MUDDY_WATER
	dbw 49, AQUA_RING
	dbw 52, PETAL_DANCE
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	dbw 65, SOLARBEAM
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

LudicoloEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, WATER_GUN
	dbw 7, MIST
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, FURY_SWIPES
	dbw 19, BUBBLEBEAM
	dbw 22, RAIN_DANCE
	dbw 25, MAGICAL_LEAF
	dbw 28, KNOCK_OFF
	dbw 31, MUD_SHOT
	dbw 34, FLAIL
	dbw 37, SUNNY_DAY
	dbw 40, GIGA_DRAIN
	dbw 43, ZEN_HEADBUTT
	dbw 46, MUDDY_WATER
	dbw 49, AQUA_RING
	dbw 52, PETAL_DANCE
	dbw 55, ICE_BEAM
	dbw 60, HYDRO_PUMP
	dbw 65, SOLARBEAM
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

SeedotEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, NUZLEAF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 1, HARDEN
	dbw 4, ASTONISH
	dbw 7, GROWTH
	dbw 10, BULLET_SEED
	dbw 13, MEGA_DRAIN
	dbw 16, BITE
	dbw 19, RAZOR_LEAF
	dbw 22, AIR_CUTTER
	dbw 25, FAINT_ATTACK
	dbw 28, SUNNY_DAY
	dbw 31, SYNTHESIS
	dbw 34, RAZOR_WIND
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, KNOCK_OFF
	dbw 46, NIGHT_SLASH
	dbw 49, SWORDS_DANCE
	dbw 52, EXTRASENSORY
	dbw 55, SOLARBEAM
	dbw 58, WHIRLWIND
	dbw 60, HEAT_WAVE
	dbw 65, HURRICANE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

NuzleafEvosAttacks:
	dbww EVOLVE_ITEM, LEAF_STONE, SHIFTRY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 1, HARDEN
	dbw 4, ASTONISH
	dbw 7, GROWTH
	dbw 10, BULLET_SEED
	dbw 13, MEGA_DRAIN
	dbw 16, BITE
	dbw 19, RAZOR_LEAF
	dbw 22, AIR_CUTTER
	dbw 25, FAINT_ATTACK
	dbw 28, SUNNY_DAY
	dbw 31, SYNTHESIS
	dbw 34, RAZOR_WIND
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, KNOCK_OFF
	dbw 46, NIGHT_SLASH
	dbw 49, SWORDS_DANCE
	dbw 52, EXTRASENSORY
	dbw 55, SOLARBEAM
	dbw 58, WHIRLWIND
	dbw 60, HEAT_WAVE
	dbw 65, HURRICANE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

ShiftryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, ABSORB
	dbw 1, HARDEN
	dbw 4, ASTONISH
	dbw 7, GROWTH
	dbw 10, BULLET_SEED
	dbw 13, MEGA_DRAIN
	dbw 16, BITE
	dbw 19, RAZOR_LEAF
	dbw 22, AIR_CUTTER
	dbw 25, FAINT_ATTACK
	dbw 28, SUNNY_DAY
	dbw 31, SYNTHESIS
	dbw 34, RAZOR_WIND
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, KNOCK_OFF
	dbw 46, NIGHT_SLASH
	dbw 49, SWORDS_DANCE
	dbw 52, EXTRASENSORY
	dbw 55, SOLARBEAM
	dbw 58, WHIRLWIND
	dbw 60, HEAT_WAVE
	dbw 65, HURRICANE
	dbw 70, EXPLOSION
	db 0 ; no more level-up moves

TaillowEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SWELLOW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 1, QUICK_ATTACK
	dbw 4, LEER
	dbw 7, BITE
	dbw 10, ENDURE
	dbw 13, AERIAL_ACE
	dbw 16, PURSUIT
	dbw 19, WING_ATTACK
	dbw 22, FACADE
	dbw 25, AGILITY
	dbw 28, FOCUS_ENERGY
	dbw 31, FLAIL
	dbw 34, SLASH
	dbw 37, DRILL_PECK
	dbw 40, TAKE_DOWN
	dbw 43, NIGHT_SLASH
	dbw 46, DOUBLE_EDGE
	dbw 50, SWORDS_DANCE
	dbw 55, EXTREMESPEED
	dbw 60, SKY_ATTACK
	dbw 65, THRASH
	db 0 ; no more level-up moves

SwellowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 1, QUICK_ATTACK
	dbw 4, LEER
	dbw 7, BITE
	dbw 10, ENDURE
	dbw 13, AERIAL_ACE
	dbw 16, PURSUIT
	dbw 19, WING_ATTACK
	dbw 22, FACADE
	dbw 25, AGILITY
	dbw 28, FOCUS_ENERGY
	dbw 31, FLAIL
	dbw 34, SLASH
	dbw 37, DRILL_PECK
	dbw 40, TAKE_DOWN
	dbw 43, NIGHT_SLASH
	dbw 46, DOUBLE_EDGE
	dbw 50, SWORDS_DANCE
	dbw 55, EXTREMESPEED
	dbw 60, SKY_ATTACK
	dbw 65, THRASH
	db 0 ; no more level-up moves

WingullEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, PELIPPER
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 4, SUPERSONIC
	dbw 7, QUICK_ATTACK
	dbw 10, MIST
	dbw 13, WING_ATTACK
	dbw 16, WATER_PULSE
	dbw 19, AIR_CUTTER
	dbw 22, AGILITY
	dbw 25, BUBBLEBEAM
	dbw 28, RAIN_DANCE
	dbw 31, RECOVER
	dbw 34, RAZOR_WIND
	dbw 37, U_TURN
	dbw 40, MIST_BALL
	dbw 43, SCALD
	dbw 46, WHIRLWIND
	dbw 49, ICE_BEAM
	dbw 52, HAZE
	dbw 56, HYDRO_PUMP
	dbw 60, HURRICANE
	dbw 65, BLIZZARD
	db 0 ; no more level-up moves

PelipperEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 4, SUPERSONIC
	dbw 7, QUICK_ATTACK
	dbw 10, MIST
	dbw 13, WING_ATTACK
	dbw 16, WATER_PULSE
	dbw 19, AIR_CUTTER
	dbw 22, AGILITY
	dbw 25, BUBBLEBEAM
	dbw 28, RAIN_DANCE
	dbw 31, RECOVER
	dbw 34, RAZOR_WIND
	dbw 37, U_TURN
	dbw 40, MIST_BALL
	dbw 43, SCALD
	dbw 46, WHIRLWIND
	dbw 49, ICE_BEAM
	dbw 52, HAZE
	dbw 56, HYDRO_PUMP
	dbw 60, HURRICANE
	dbw 65, BLIZZARD
	db 0 ; no more level-up moves

RaltsEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, TELEPORT
	dbw 7, FAE_VOICE
	dbw 10, CHARM
	dbw 13, CONFUSE_RAY
	dbw 16, DRAININGKISS
	dbw 19, HYPNOSIS
	dbw 22, PSYBEAM
	dbw 25, SAFEGUARD
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, HYPER_VOICE
	dbw 46, MOONBLAST
	dbw 49, DREAM_EATER
	dbw 52, RECOVER
	dbw 55, HEAL_BELL
	dbw 58, FAERIEGLEAM
	dbw 62, FUTURE_SIGHT
	dbw 66, LUSTER_PURGE
	db 0 ; no more level-up moves

KirliaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, GARDEVOIR
	dbww EVOLVE_ITEM, DAWN_STONE, GALLADE
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, TELEPORT
	dbw 7, FAE_VOICE
	dbw 10, CHARM
	dbw 13, CONFUSE_RAY
	dbw 16, DRAININGKISS
	dbw 19, HYPNOSIS
	dbw 22, PSYBEAM
	dbw 25, SAFEGUARD
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, HYPER_VOICE
	dbw 46, MOONBLAST
	dbw 49, DREAM_EATER
	dbw 52, RECOVER
	dbw 55, HEAL_BELL
	dbw 58, FAERIEGLEAM
	dbw 62, FUTURE_SIGHT
	dbw 66, LUSTER_PURGE
	db 0 ; no more level-up moves

GardevoirEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, GARDEVOIRX
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PIXIE_DUST
	dbw 1, CONFUSION
	dbw 4, TELEPORT
	dbw 7, FAE_VOICE
	dbw 10, CHARM
	dbw 13, CONFUSE_RAY
	dbw 16, DRAININGKISS
	dbw 19, HYPNOSIS
	dbw 22, PSYBEAM
	dbw 25, SAFEGUARD
	dbw 28, LIGHT_SCREEN
	dbw 31, REFLECT
	dbw 34, MYSTICAL_FIRE
	dbw 37, CALM_MIND
	dbw 40, PSYCHIC_M
	dbw 43, HYPER_VOICE
	dbw 46, MOONBLAST
	dbw 49, DREAM_EATER
	dbw 52, RECOVER
	dbw 55, HEAL_BELL
	dbw 58, FAERIEGLEAM
	dbw 62, FUTURE_SIGHT
	dbw 66, LUSTER_PURGE
	db 0 ; no more level-up moves

SurskitEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, MASQUERAIN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, QUICK_ATTACK
	dbw 1, SWEET_SCENT
	dbw 4, WATER_GUN
	dbw 7, GUST
	dbw 10, STUN_SPORE
	dbw 13, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 19, SILVER_WIND
	dbw 22, AIR_CUTTER
	dbw 25, HAZE
	dbw 28, AGILITY
	dbw 31, BUBBLEBEAM
	dbw 34, BATON_PASS
	dbw 37, SIGNAL_BEAM
	dbw 40, RAIN_DANCE
	dbw 43, MEDITATE
	dbw 46, GIGA_DRAIN
	dbw 49, WHIRLWIND
	dbw 52, MIST_BALL
	dbw 56, HYDRO_PUMP
	dbw 60, HURRICANE
	dbw 65, WATER_SPOUT
	db 0 ; no more level-up moves

MasquerainEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, QUICK_ATTACK
	dbw 1, SWEET_SCENT
	dbw 4, WATER_GUN
	dbw 7, GUST
	dbw 10, STUN_SPORE
	dbw 13, SCARY_FACE
	dbw 16, WATER_PULSE
	dbw 19, SILVER_WIND
	dbw 22, AIR_CUTTER
	dbw 25, HAZE
	dbw 28, AGILITY
	dbw 31, BUBBLEBEAM
	dbw 34, BATON_PASS
	dbw 37, SIGNAL_BEAM
	dbw 40, RAIN_DANCE
	dbw 43, MEDITATE
	dbw 46, GIGA_DRAIN
	dbw 49, WHIRLWIND
	dbw 52, MIST_BALL
	dbw 56, HYDRO_PUMP
	dbw 60, HURRICANE
	dbw 65, WATER_SPOUT
	db 0 ; no more level-up moves

ShroomishEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, TACKLE
	dbw 1, STUN_SPORE
	dbw 4, POISONPOWDER
	dbw 7, BULLET_SEED
	dbw 10, LEECH_SEED
	dbw 13, MEGA_DRAIN
	dbw 16, HEADBUTT
	dbw 19, MACH_PUNCH
	dbw 22, FORCE_PALM
	dbw 25, GROWTH
	dbw 28, COUNTER
	dbw 31, BRICK_BREAK
	dbw 34, TOXIC
	dbw 37, LEAF_BLADE
	dbw 40, BULK_UP
	dbw 43, DRAIN_PUNCH
	dbw 46, SPORE
	dbw 49, CROSS_CHOP
	dbw 52, SWORDS_DANCE
	dbw 55, ZEN_HEADBUTT
	dbw 60, DYNAMICPUNCH
	dbw 65, SUBMISSION
	db 0 ; no more level-up moves

BreloomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, TACKLE
	dbw 1, STUN_SPORE
	dbw 4, POISONPOWDER
	dbw 7, BULLET_SEED
	dbw 10, LEECH_SEED
	dbw 13, MEGA_DRAIN
	dbw 16, HEADBUTT
	dbw 19, MACH_PUNCH
	dbw 22, FORCE_PALM
	dbw 25, GROWTH
	dbw 28, COUNTER
	dbw 31, BRICK_BREAK
	dbw 34, TOXIC
	dbw 37, LEAF_BLADE
	dbw 40, BULK_UP
	dbw 43, DRAIN_PUNCH
	dbw 46, SPORE
	dbw 49, CROSS_CHOP
	dbw 52, SWORDS_DANCE
	dbw 55, ZEN_HEADBUTT
	dbw 60, DYNAMICPUNCH
	dbw 65, SUBMISSION
	db 0 ; no more level-up moves

RowletEvosAttacks:
	dbbw EVOLVE_LEVEL, 17, DARTRIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, ASTONISH
	dbw 7, PECK
	dbw 10, BULLET_SEED
	dbw 13, SPITE
	dbw 16, SHADOWSNEAK
	dbw 19, MEAN_LOOK
	dbw 22, RAZOR_LEAF
	dbw 25, AERIAL_ACE
	dbw 28, SYNTHESIS
	dbw 31, HEX
	dbw 34, U_TURN
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, SHADOW_CLAW
	dbw 46, SWORDS_DANCE
	dbw 49, GIGA_DRAIN
	dbw 52, CALM_MIND
	dbw 55, SHADOW_BALL
	dbw 58, NIGHT_SLASH
	dbw 60, HURRICANE
	dbw 65, SHADOW_FORCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

DartrixEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, DECIDUEYE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, ASTONISH
	dbw 7, PECK
	dbw 10, BULLET_SEED
	dbw 13, SPITE
	dbw 16, SHADOWSNEAK
	dbw 19, MEAN_LOOK
	dbw 22, RAZOR_LEAF
	dbw 25, AERIAL_ACE
	dbw 28, SYNTHESIS
	dbw 31, HEX
	dbw 34, U_TURN
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, SHADOW_CLAW
	dbw 46, SWORDS_DANCE
	dbw 49, GIGA_DRAIN
	dbw 52, CALM_MIND
	dbw 55, SHADOW_BALL
	dbw 58, NIGHT_SLASH
	dbw 60, HURRICANE
	dbw 65, SHADOW_FORCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

DecidueyeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, ABSORB
	dbw 4, ASTONISH
	dbw 7, PECK
	dbw 10, BULLET_SEED
	dbw 13, SPITE
	dbw 16, SHADOWSNEAK
	dbw 19, MEAN_LOOK
	dbw 22, RAZOR_LEAF
	dbw 25, AERIAL_ACE
	dbw 28, SYNTHESIS
	dbw 31, HEX
	dbw 34, U_TURN
	dbw 37, SUCKER_PUNCH
	dbw 40, LEAF_BLADE
	dbw 43, SHADOW_CLAW
	dbw 46, SWORDS_DANCE
	dbw 49, GIGA_DRAIN
	dbw 52, CALM_MIND
	dbw 55, SHADOW_BALL
	dbw 58, NIGHT_SLASH
	dbw 60, HURRICANE
	dbw 65, SHADOW_FORCE
	dbw 70, FRENZY_PLANT
	db 0 ; no more level-up moves

LittenEvosAttacks:
	dbbw EVOLVE_LEVEL, 17, TORRACAT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, FURY_SWIPES
	dbw 7, DOUBLE_KICK
	dbw 10, BITE
	dbw 13, FLAME_CHARGE
	dbw 16, SCARY_FACE
	dbw 19, LOW_KICK
	dbw 22, FAINT_ATTACK
	dbw 25, FACADE
	dbw 28, FIRE_FANG
	dbw 31, SEISMIC_TOSS
	dbw 34, SUCKER_PUNCH
	dbw 37, U_TURN
	dbw 40, BULK_UP
	dbw 43, KNOCK_OFF
	dbw 46, SWORDS_DANCE
	dbw 49, CRUNCH
	dbw 52, FLAME_WHEEL
	dbw 55, VITAL_THROW
	dbw 58, DARK_PULSE
	dbw 60, HEAT_CRASH
	dbw 64, SUBMISSION
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

TorracatEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, INCINEROAR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, FURY_SWIPES
	dbw 7, DOUBLE_KICK
	dbw 10, BITE
	dbw 13, FLAME_CHARGE
	dbw 16, SCARY_FACE
	dbw 19, LOW_KICK
	dbw 22, FAINT_ATTACK
	dbw 25, FACADE
	dbw 28, FIRE_FANG
	dbw 31, SEISMIC_TOSS
	dbw 34, SUCKER_PUNCH
	dbw 37, U_TURN
	dbw 40, BULK_UP
	dbw 43, KNOCK_OFF
	dbw 46, SWORDS_DANCE
	dbw 49, CRUNCH
	dbw 52, FLAME_WHEEL
	dbw 55, VITAL_THROW
	dbw 58, DARK_PULSE
	dbw 60, HEAT_CRASH
	dbw 64, SUBMISSION
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

IncineroarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, FURY_SWIPES
	dbw 7, DOUBLE_KICK
	dbw 10, BITE
	dbw 13, FLAME_CHARGE
	dbw 16, SCARY_FACE
	dbw 19, LOW_KICK
	dbw 22, FAINT_ATTACK
	dbw 25, FACADE
	dbw 28, FIRE_FANG
	dbw 31, SEISMIC_TOSS
	dbw 34, SUCKER_PUNCH
	dbw 37, U_TURN
	dbw 40, BULK_UP
	dbw 43, KNOCK_OFF
	dbw 46, SWORDS_DANCE
	dbw 49, CRUNCH
	dbw 52, FLAME_WHEEL
	dbw 55, VITAL_THROW
	dbw 58, DARK_PULSE
	dbw 60, HEAT_CRASH
	dbw 64, SUBMISSION
	dbw 70, BLAST_BURN
	db 0 ; no more level-up moves

PopplioEvosAttacks:
	dbbw EVOLVE_LEVEL, 17, BRIONNE
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, FAE_VOICE
	dbw 7, SING
	dbw 10, WATER_PULSE
	dbw 13, ICY_WIND
	dbw 16, ENCORE
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, DRAININGKISS
	dbw 28, HYPER_VOICE
	dbw 31, RAIN_DANCE
	dbw 34, CALM_MIND
	dbw 37, MIST_BALL
	dbw 40, MOONBLAST
	dbw 43, PERISH_SONG
	dbw 46, MIRROR_COAT
	dbw 49, HEAL_BELL
	dbw 52, AMNESIA
	dbw 55, ICE_BEAM
	dbw 58, UPROAR
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

BrionneEvosAttacks:
	dbbw EVOLVE_LEVEL, 34, PRIMARINA
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, FAE_VOICE
	dbw 7, SING
	dbw 10, WATER_PULSE
	dbw 13, ICY_WIND
	dbw 16, ENCORE
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, DRAININGKISS
	dbw 28, HYPER_VOICE
	dbw 31, RAIN_DANCE
	dbw 34, CALM_MIND
	dbw 37, MIST_BALL
	dbw 40, MOONBLAST
	dbw 43, PERISH_SONG
	dbw 46, MIRROR_COAT
	dbw 49, HEAL_BELL
	dbw 52, AMNESIA
	dbw 55, ICE_BEAM
	dbw 58, UPROAR
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

PrimarinaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, FAE_VOICE
	dbw 7, SING
	dbw 10, WATER_PULSE
	dbw 13, ICY_WIND
	dbw 16, ENCORE
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, DRAININGKISS
	dbw 28, HYPER_VOICE
	dbw 31, RAIN_DANCE
	dbw 34, CALM_MIND
	dbw 37, MIST_BALL
	dbw 40, MOONBLAST
	dbw 43, PERISH_SONG
	dbw 46, MIRROR_COAT
	dbw 49, HEAL_BELL
	dbw 52, AMNESIA
	dbw 55, ICE_BEAM
	dbw 58, UPROAR
	dbw 60, HYDRO_PUMP
	dbw 65, BLIZZARD
	dbw 70, HYDRO_CANNON
	db 0 ; no more level-up moves

MakuhitaEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HARIYAMA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FOCUS_ENERGY
	dbw 1, SAND_ATTACK
	dbw 4, ARM_THRUST
	dbw 7, LOW_KICK
	dbw 10, WHIRLWIND
	dbw 13, FORCE_PALM
	dbw 16, MACH_PUNCH
	dbw 19, KNOCK_OFF
	dbw 22, SEISMIC_TOSS
	dbw 25, FACADE
	dbw 28, BULK_UP
	dbw 31, DETECT
	dbw 34, BRICK_BREAK
	dbw 37, VITAL_THROW
	dbw 40, BELLY_DRUM
	dbw 43, BODY_SLAM
	dbw 46, CROSS_CHOP
	dbw 49, BULLET_PUNCH
	dbw 52, COUNTER
	dbw 55, DRAIN_PUNCH
	dbw 60, HEAVY_SLAM
	dbw 65, SUBMISSION
	db 0 ; no more level-up moves

HariyamaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FOCUS_ENERGY
	dbw 1, SAND_ATTACK
	dbw 4, ARM_THRUST
	dbw 7, LOW_KICK
	dbw 10, WHIRLWIND
	dbw 13, FORCE_PALM
	dbw 16, MACH_PUNCH
	dbw 19, KNOCK_OFF
	dbw 22, SEISMIC_TOSS
	dbw 25, FACADE
	dbw 28, BULK_UP
	dbw 31, DETECT
	dbw 34, BRICK_BREAK
	dbw 37, VITAL_THROW
	dbw 40, BELLY_DRUM
	dbw 43, BODY_SLAM
	dbw 46, CROSS_CHOP
	dbw 49, BULLET_PUNCH
	dbw 52, COUNTER
	dbw 55, DRAIN_PUNCH
	dbw 60, HEAVY_SLAM
	dbw 65, SUBMISSION
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	dbbw EVOLVE_LEVEL, 16, MARILL
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 4, POUND
	dbw 7, DEFENSE_CURL
	dbw 10, CHARM
	dbw 13, ROLLOUT
	dbw 16, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 22, SLAM
	dbw 25, AQUA_RING
	dbw 28, RAIN_DANCE
	dbw 31, DIZZY_PUNCH
	dbw 34, AQUA_TAIL
	dbw 37, KNOCK_OFF
	dbw 40, BELLY_DRUM
	dbw 43, PLAY_ROUGH
	dbw 46, SCALD
	dbw 49, FAERIEGLEAM
	dbw 52, BULK_UP
	dbw 55, DOUBLE_EDGE
	dbw 58, SUPERPOWER
	dbw 62, HYDRO_PUMP
	db 0 ; no more level-up moves

NosepassEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, PROBOPASS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, ROCK_THROW
	dbw 4, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, ROLLOUT
	dbw 13, SPARK
	dbw 16, ROCK_TOMB
	dbw 19, CHARGE_BEAM
	dbw 22, BULLDOZE
	dbw 25, SPIKES
	dbw 28, ROCK_BLAST
	dbw 31, DISCHARGE
	dbw 34, SANDSTORM
	dbw 37, ROCK_SLIDE
	dbw 40, EARTHPOWER
	dbw 43, COSMIC_POWER
	dbw 46, THUNDERBOLT
	dbw 49, POWER_GEM
	dbw 52, REST
	dbw 55, BODY_PRESS
	dbw 57, LOCK_ON
	dbw 59, FLASHCANNON
	dbw 60, STONE_EDGE
	dbw 65, ZAP_CANNON
	db 0 ; no more level-up moves

SkittyEvosAttacks:
	dbww EVOLVE_ITEM, MOON_STONE, DELCATTY
	dbbw EVOLVE_LEVEL, 30, DELCATTY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, FORESIGHT
	dbw 7, FAE_VOICE
	dbw 10, SING
	dbw 13, DOUBLESLAP
	dbw 16, CHARM
	dbw 19, FAINT_ATTACK
	dbw 22, DRAININGKISS
	dbw 25, MIMIC
	dbw 28, ENCORE
	dbw 31, HEAL_BELL
	dbw 34, BODY_SLAM
	dbw 37, BATON_PASS
	dbw 40, METRONOME
	dbw 43, HYPER_VOICE
	dbw 46, PLAY_ROUGH
	dbw 49, MOONBLAST
	dbw 52, SAFEGUARD
	dbw 55, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	dbw 65, LUSTER_PURGE
	db 0 ; no more level-up moves

DelcattyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, TAIL_WHIP
	dbw 4, FORESIGHT
	dbw 7, FAE_VOICE
	dbw 10, SING
	dbw 13, DOUBLESLAP
	dbw 16, CHARM
	dbw 19, FAINT_ATTACK
	dbw 22, DRAININGKISS
	dbw 25, MIMIC
	dbw 28, ENCORE
	dbw 31, HEAL_BELL
	dbw 34, BODY_SLAM
	dbw 37, BATON_PASS
	dbw 40, METRONOME
	dbw 43, HYPER_VOICE
	dbw 46, PLAY_ROUGH
	dbw 49, MOONBLAST
	dbw 52, SAFEGUARD
	dbw 55, EXTREMESPEED
	dbw 60, DOUBLE_EDGE
	dbw 65, LUSTER_PURGE
	db 0 ; no more level-up moves

SableyeEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 4, NIGHT_SHADE
	dbw 7, FURY_SWIPES
	dbw 10, DISABLE
	dbw 13, DETECT
	dbw 16, FAINT_ATTACK
	dbw 19, CONFUSE_RAY
	dbw 22, SHADOWSNEAK
	dbw 25, TAUNT
	dbw 28, KNOCK_OFF
	dbw 31, RECOVER
	dbw 34, SHADOW_CLAW
	dbw 37, MEAN_LOOK
	dbw 40, POWER_GEM
	dbw 43, CURSE
	dbw 46, ZEN_HEADBUTT
	dbw 49, SHADOW_BALL
	dbw 52, COSMIC_POWER
	dbw 55, DESTINY_BOND
	dbw 58, PERISH_SONG
	dbw 60, SHADOW_FORCE
	db 0 ; no more level-up moves

MawileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 1, BITE
	dbw 4, PIXIE_DUST
	dbw 7, METAL_CLAW
	dbw 10, SCARY_FACE
	dbw 13, FAINT_ATTACK
	dbw 16, SPIKES
	dbw 19, ICE_FANG
	dbw 22, FIRE_FANG
	dbw 25, THUNDER_FANG
	dbw 28, TAUNT
	dbw 31, SUCKER_PUNCH
	dbw 34, CRUNCH
	dbw 37, BATON_PASS
	dbw 40, VICEGRIP
	dbw 43, SWORDS_DANCE
	dbw 46, PLAY_ROUGH
	dbw 49, HYPER_FANG
	dbw 52, POISON_FANG
	dbw 55, KNOCK_OFF
	dbw 60, IRON_TAIL
	dbw 65, GUILLOTINE
	db 0 ; no more level-up moves

AronEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, LAIRON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, METAL_CLAW
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, HEADBUTT
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, BULLDOZE
	dbw 22, TAKE_DOWN
	dbw 25, SCREECH
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, VICEGRIP
	dbw 40, COSMIC_POWER
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 49, DOUBLE_EDGE
	dbw 52, HEAVY_SLAM
	dbw 55, TOXIC
	dbw 60, IRON_TAIL
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

LaironEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, AGGRON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, METAL_CLAW
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, HEADBUTT
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, BULLDOZE
	dbw 22, TAKE_DOWN
	dbw 25, SCREECH
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, VICEGRIP
	dbw 40, COSMIC_POWER
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 49, DOUBLE_EDGE
	dbw 52, HEAVY_SLAM
	dbw 55, TOXIC
	dbw 60, IRON_TAIL
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

AggronEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, AGGRONX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, METAL_CLAW
	dbw 4, MUD_SLAP
	dbw 7, ROCK_THROW
	dbw 10, HEADBUTT
	dbw 13, ROCK_TOMB
	dbw 16, ROAR
	dbw 19, BULLDOZE
	dbw 22, TAKE_DOWN
	dbw 25, SCREECH
	dbw 28, CURSE
	dbw 31, GYRO_BALL
	dbw 34, ROCK_SLIDE
	dbw 37, VICEGRIP
	dbw 40, COSMIC_POWER
	dbw 43, BODY_PRESS
	dbw 46, EARTHQUAKE
	dbw 49, DOUBLE_EDGE
	dbw 52, HEAVY_SLAM
	dbw 55, TOXIC
	dbw 60, IRON_TAIL
	dbw 65, STONE_EDGE
	dbw 70, SKULL_BASH
	db 0 ; no more level-up moves

MedititeEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, COMET_PUNCH
	dbw 1, LEER
	dbw 4, MEDITATE
	dbw 7, DETECT
	dbw 10, MACH_PUNCH
	dbw 13, FORCE_PALM
	dbw 16, PSYBEAM
	dbw 19, BULLET_PUNCH
	dbw 22, FIRE_PUNCH
	dbw 25, ICE_PUNCH
	dbw 28, THUNDERPUNCH
	dbw 31, PSYCH_UP
	dbw 34, RECOVER
	dbw 37, ZEN_HEADBUTT
	dbw 40, JUMP_KICK
	dbw 43, BULK_UP
	dbw 46, DRAIN_PUNCH
	dbw 49, AURA_SPHERE
	dbw 52, PSYCHIC_M
	dbw 55, CROSS_CHOP
	dbw 57, SHADOW_PUNCH
	dbw 60, DYNAMICPUNCH
	dbw 65, HI_JUMP_KICK
	db 0 ; no more level-up moves

MedichamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, COMET_PUNCH
	dbw 1, LEER
	dbw 4, MEDITATE
	dbw 7, DETECT
	dbw 10, MACH_PUNCH
	dbw 13, FORCE_PALM
	dbw 16, PSYBEAM
	dbw 19, BULLET_PUNCH
	dbw 22, FIRE_PUNCH
	dbw 25, ICE_PUNCH
	dbw 28, THUNDERPUNCH
	dbw 31, PSYCH_UP
	dbw 34, RECOVER
	dbw 37, ZEN_HEADBUTT
	dbw 40, JUMP_KICK
	dbw 43, BULK_UP
	dbw 46, DRAIN_PUNCH
	dbw 49, AURA_SPHERE
	dbw 52, PSYCHIC_M
	dbw 55, CROSS_CHOP
	dbw 57, SHADOW_PUNCH
	dbw 60, DYNAMICPUNCH
	dbw 65, HI_JUMP_KICK
	db 0 ; no more level-up moves

ElectrikeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, MANECTRIC
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, SPARK
	dbw 16, ROAR
	dbw 19, FIRE_FANG
	dbw 22, THUNDER_FANG
	dbw 25, FAINT_ATTACK
	dbw 28, ICE_FANG
	dbw 31, CHARGE
	dbw 34, VOLT_SWITCH
	dbw 37, CRUNCH
	dbw 40, DISCHARGE
	dbw 43, AGILITY
	dbw 46, DRAGON_DANCE
	dbw 49, EXTREMESPEED
	dbw 52, KNOCK_OFF
	dbw 55, DOUBLE_EDGE
	dbw 60, SHOCKSLAM
	dbw 65, THUNDER
	db 0 ; no more level-up moves

ManectricEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 4, THUNDER_WAVE
	dbw 7, QUICK_ATTACK
	dbw 10, BITE
	dbw 13, SPARK
	dbw 16, ROAR
	dbw 19, FIRE_FANG
	dbw 22, THUNDER_FANG
	dbw 25, FAINT_ATTACK
	dbw 28, ICE_FANG
	dbw 31, CHARGE
	dbw 34, VOLT_SWITCH
	dbw 37, CRUNCH
	dbw 40, DISCHARGE
	dbw 43, AGILITY
	dbw 46, DRAGON_DANCE
	dbw 49, EXTREMESPEED
	dbw 52, KNOCK_OFF
	dbw 55, DOUBLE_EDGE
	dbw 60, SHOCKSLAM
	dbw 65, THUNDER
	db 0 ; no more level-up moves

PlusleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, THUNDERSHOCK
	dbw 1, QUICK_ATTACK
	dbw 4, THUNDER_WAVE
	dbw 7, CHARM
	dbw 10, SPARK
	dbw 13, ENCORE
	dbw 16, ELECTRO_BALL
	dbw 19, CHARGE_BEAM
	dbw 22, FAE_VOICE
	dbw 25, AGILITY
	dbw 28, DISCHARGE
	dbw 31, CHARGE
	dbw 34, BATON_PASS
	dbw 37, THUNDERBOLT
	dbw 40, CALM_MIND
	dbw 43, FAERIEGLEAM
	dbw 46, GRASS_KNOT
	dbw 50, THUNDER
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

MinunEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, THUNDERSHOCK
	dbw 1, QUICK_ATTACK
	dbw 4, THUNDER_WAVE
	dbw 7, CHARM
	dbw 10, SPARK
	dbw 13, ENCORE
	dbw 16, ELECTRO_BALL
	dbw 19, CHARGE_BEAM
	dbw 22, FAE_VOICE
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, DISCHARGE
	dbw 34, BATON_PASS
	dbw 37, SAFEGUARD
	dbw 40, THUNDERBOLT
	dbw 43, HEAL_BELL
	dbw 46, CALM_MIND
	dbw 50, MOONLIGHT
	dbw 55, THUNDER
	dbw 60, ZAP_CANNON
	db 0 ; no more level-up moves

VolbeatEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FLASH
	dbw 1, LEECH_LIFE
	dbw 4, QUICK_ATTACK
	dbw 7, CONFUSE_RAY
	dbw 10, TWINEEDLE
	dbw 13, MOONLIGHT
	dbw 16, FURY_CUTTER
	dbw 19, TAUNT
	dbw 22, BATON_PASS
	dbw 25, U_TURN
	dbw 28, SWORDS_DANCE
	dbw 31, ACROBATICS
	dbw 34, ZEN_HEADBUTT
	dbw 37, KNOCK_OFF
	dbw 40, PLAY_ROUGH
	dbw 43, DOUBLE_EDGE
	dbw 46, THUNDER_WAVE
	dbw 50, AGILITY
	dbw 55, DIZZY_PUNCH
	dbw 60, MEGAHORN
	db 0 ; no more level-up moves

IllumiseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SWEET_SCENT
	dbw 1, LEECH_LIFE
	dbw 4, CHARM
	dbw 7, QUICK_ATTACK
	dbw 10, SWEET_KISS
	dbw 13, MOONLIGHT
	dbw 16, SILVER_WIND
	dbw 19, ENCORE
	dbw 22, FAE_VOICE
	dbw 25, PSYBEAM
	dbw 28, BATON_PASS
	dbw 31, SIGNAL_BEAM
	dbw 34, LIGHT_SCREEN
	dbw 37, CALM_MIND
	dbw 40, MOONBLAST
	dbw 43, HEAL_BELL
	dbw 46, PSYCHIC_M
	dbw 50, SAFEGUARD
	dbw 60, LUSTER_PURGE
	db 0 ; no more level-up moves

RoseliaEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, ROSERADE
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 1, POISON_STING
	dbw 4, STUN_SPORE
	dbw 7, MEGA_DRAIN
	dbw 10, LEECH_SEED
	dbw 13, POISONPOWDER
	dbw 16, MAGICAL_LEAF
	dbw 19, SLEEP_POWDER
	dbw 22, ACID_SPRAY
	dbw 25, INGRAIN
	dbw 28, VENOSHOCK
	dbw 31, SPIKES
	dbw 34, SYNTHESIS
	dbw 37, TOXIC
	dbw 40, GIGA_DRAIN
	dbw 43, SLUDGE_WAVE
	dbw 46, WEATHER_BALL
	dbw 49, CALM_MIND
	dbw 52, MOONBLAST
	dbw 55, SHADOW_BALL
	dbw 60, SOLARBEAM
	dbw 65, PETAL_DANCE
	db 0 ; no more level-up moves

GulpinEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, SWALOT
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, POISON_GAS
	dbw 1, YAWN
	dbw 4, ACID
	dbw 7, ACID_SPRAY
	dbw 10, AMNESIA
	dbw 13, ENCORE
	dbw 16, SLUDGE
	dbw 19, MUD_SHOT
	dbw 22, VENOSHOCK
	dbw 25, TOXIC
	dbw 28, PAIN_SPLIT
	dbw 31, COSMIC_POWER
	dbw 34, BODY_SLAM
	dbw 37, REST
	dbw 40, SLUDGE_WAVE
	dbw 43, POISON_JAB
	dbw 46, SLEEP_TALK
	dbw 49, EARTHPOWER
	dbw 52, HAZE
	dbw 55, BULK_UP
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

SwalotEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SWALOTX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, POISON_GAS
	dbw 1, YAWN
	dbw 4, ACID
	dbw 7, ACID_SPRAY
	dbw 10, AMNESIA
	dbw 13, ENCORE
	dbw 16, SLUDGE
	dbw 19, MUD_SHOT
	dbw 22, VENOSHOCK
	dbw 25, TOXIC
	dbw 28, PAIN_SPLIT
	dbw 31, COSMIC_POWER
	dbw 34, BODY_SLAM
	dbw 37, REST
	dbw 40, SLUDGE_WAVE
	dbw 43, POISON_JAB
	dbw 46, SLEEP_TALK
	dbw 49, EARTHPOWER
	dbw 52, HAZE
	dbw 55, BULK_UP
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

CarvanhaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 4, FOCUS_ENERGY
	dbw 7, AQUA_JET
	dbw 10, SCARY_FACE
	dbw 13, DETECT
	dbw 16, WATER_PULSE
	dbw 19, ICE_FANG
	dbw 22, POISON_FANG
	dbw 25, SCREECH
	dbw 28, THUNDER_FANG
	dbw 31, FIRE_FANG
	dbw 34, SLASH
	dbw 37, CRUNCH
	dbw 40, SWORDS_DANCE
	dbw 43, WATERFALL
	dbw 46, DARK_PULSE
	dbw 49, NIGHT_SLASH
	dbw 52, MIST_BALL
	dbw 55, KNOCK_OFF
	dbw 60, HYDRO_PUMP
	dbw 65, BEAT_UP
	db 0 ; no more level-up moves

SharpedoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 1, WATER_GUN
	dbw 4, FOCUS_ENERGY
	dbw 7, AQUA_JET
	dbw 10, SCARY_FACE
	dbw 13, DETECT
	dbw 16, WATER_PULSE
	dbw 19, ICE_FANG
	dbw 22, POISON_FANG
	dbw 25, SCREECH
	dbw 28, THUNDER_FANG
	dbw 31, FIRE_FANG
	dbw 34, SLASH
	dbw 37, CRUNCH
	dbw 40, SWORDS_DANCE
	dbw 43, WATERFALL
	dbw 46, DARK_PULSE
	dbw 49, NIGHT_SLASH
	dbw 52, MIST_BALL
	dbw 55, KNOCK_OFF
	dbw 60, HYDRO_PUMP
	dbw 65, BEAT_UP
	db 0 ; no more level-up moves

WailmerEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, WAILORD
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, ASTONISH
	dbw 7, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 13, WATER_PULSE
	dbw 16, MIST
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, REST
	dbw 28, AMNESIA
	dbw 31, BODY_SLAM
	dbw 34, CALM_MIND
	dbw 37, MIST_BALL
	dbw 40, HEAVY_SLAM
	dbw 43, SLEEP_TALK
	dbw 46, BULK_UP
	dbw 49, ICE_BEAM
	dbw 52, DOUBLE_EDGE
	dbw 55, HYDRO_PUMP
	dbw 60, WATER_SPOUT
	dbw 65, THRASH
	db 0 ; no more level-up moves

WailordEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 4, ASTONISH
	dbw 7, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 13, WATER_PULSE
	dbw 16, MIST
	dbw 19, BUBBLEBEAM
	dbw 22, AQUA_RING
	dbw 25, REST
	dbw 28, AMNESIA
	dbw 31, BODY_SLAM
	dbw 34, CALM_MIND
	dbw 37, MIST_BALL
	dbw 40, HEAVY_SLAM
	dbw 43, SLEEP_TALK
	dbw 46, BULK_UP
	dbw 49, ICE_BEAM
	dbw 52, DOUBLE_EDGE
	dbw 55, HYDRO_PUMP
	dbw 60, WATER_SPOUT
	dbw 65, THRASH
	db 0 ; no more level-up moves

NumelEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, CAMERUPT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, MUD_SLAP
	dbw 7, FLAME_CHARGE
	dbw 10, BULLDOZE
	dbw 13, FIRE_SPIN
	dbw 16, ROCK_TOMB
	dbw 19, TAKE_DOWN
	dbw 22, LAVA_PLUME
	dbw 25, EARTHPOWER
	dbw 28, CURSE
	dbw 31, YAWN
	dbw 34, ROCK_SLIDE
	dbw 37, AMNESIA
	dbw 40, RECOVER
	dbw 43, FLAMETHROWER
	dbw 46, EARTHQUAKE
	dbw 49, HEAT_CRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, FIRE_BLAST
	dbw 60, ERUPTION
	dbw 65, FISSURE
	db 0 ; no more level-up moves

CameruptEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, CAMERUPTX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, EMBER
	dbw 4, MUD_SLAP
	dbw 7, FLAME_CHARGE
	dbw 10, BULLDOZE
	dbw 13, FIRE_SPIN
	dbw 16, ROCK_TOMB
	dbw 19, TAKE_DOWN
	dbw 22, LAVA_PLUME
	dbw 25, EARTHPOWER
	dbw 28, CURSE
	dbw 31, YAWN
	dbw 34, ROCK_SLIDE
	dbw 37, AMNESIA
	dbw 40, RECOVER
	dbw 43, FLAMETHROWER
	dbw 46, EARTHQUAKE
	dbw 49, HEAT_CRASH
	dbw 52, DOUBLE_EDGE
	dbw 55, FIRE_BLAST
	dbw 60, ERUPTION
	dbw 65, FISSURE
	db 0 ; no more level-up moves

TorkoalEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, SMOG
	dbw 1, WITHDRAW
	dbw 4, SMOKESCREEN
	dbw 7, RAPID_SPIN
	dbw 10, FIRE_SPIN
	dbw 13, FLAME_CHARGE
	dbw 16, HAZE
	dbw 19, CURSE
	dbw 22, ANCIENTPOWER
	dbw 25, WILLOWISP
	dbw 28, LAVA_PLUME
	dbw 31, BODY_SLAM
	dbw 34, SUNNY_DAY
	dbw 37, COSMIC_POWER
	dbw 40, FLAMETHROWER
	dbw 43, AMNESIA
	dbw 46, REST
	dbw 49, BODY_PRESS
	dbw 52, HEAT_WAVE
	dbw 55, EARTHQUAKE
	dbw 60, FIRE_BLAST
	dbw 65, ERUPTION
	dbw 70, SOLARBEAM
	db 0 ; no more level-up moves

SpoinkEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, GRUMPIG
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, GROWL
	dbw 1, CONFUSION
	dbw 5, RAPID_SPIN
	dbw 9, CONFUSE_RAY
	dbw 13, YAWN
	dbw 17, PSYCH_UP
	dbw 21, PSYBEAM
	dbw 25, ENCORE
	dbw 28, REST
	dbw 31, SLEEP_TALK
	dbw 34, REFLECT
	dbw 37, LIGHT_SCREEN
	dbw 40, POWER_GEM
	dbw 43, PSYCHIC_M
	dbw 46, CALM_MIND
	dbw 49, SHADOW_BALL
	dbw 52, FAERIEGLEAM
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

GrumpigEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, GROWL
	dbw 1, CONFUSION
	dbw 5, RAPID_SPIN
	dbw 9, CONFUSE_RAY
	dbw 13, YAWN
	dbw 17, PSYCH_UP
	dbw 21, PSYBEAM
	dbw 25, ENCORE
	dbw 28, REST
	dbw 31, SLEEP_TALK
	dbw 34, REFLECT
	dbw 37, LIGHT_SCREEN
	dbw 40, POWER_GEM
	dbw 43, PSYCHIC_M
	dbw 46, CALM_MIND
	dbw 49, SHADOW_BALL
	dbw 52, FAERIEGLEAM
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

SpindaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, SUPERSONIC
	dbw 8, FAINT_ATTACK
	dbw 12, HYPNOSIS
	dbw 16, STOMP
	dbw 20, PSYBEAM
	dbw 23, DIZZY_PUNCH
	dbw 26, ENCORE
	dbw 29, SUCKER_PUNCH
	dbw 32, UPROAR
	dbw 35, PSYCH_UP
	dbw 38, BATON_PASS
	dbw 41, FLAIL
	dbw 44, BELLY_DRUM
	dbw 48, EXTREMESPEED
	dbw 52, DOUBLE_EDGE
	dbw 60, THRASH
	db 0 ; no more level-up moves

TrapinchEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, VIBRAVA
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, SAND_ATTACK
	dbw 1, ASTONISH
	dbw 5, MUD_SLAP
	dbw 9, MUD_SHOT
	dbw 13, FAINT_ATTACK
	dbw 17, BULLDOZE
	dbw 21, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 29, DIG
	dbw 33, SCREECH
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 44, EARTHQUAKE
	dbw 48, SANDSTORM
	dbw 52, DRAGON_DANCE
	dbw 56, STONE_EDGE
	dbw 60, OUTRAGE
	dbw 65, FISSURE
	db 0 ; no more level-up moves

VibravaEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, FLYGON
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, SAND_ATTACK
	dbw 1, ASTONISH
	dbw 5, MUD_SLAP
	dbw 9, MUD_SHOT
	dbw 13, FAINT_ATTACK
	dbw 17, BULLDOZE
	dbw 21, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 29, DIG
	dbw 33, SCREECH
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 44, EARTHQUAKE
	dbw 48, SANDSTORM
	dbw 52, DRAGON_DANCE
	dbw 56, STONE_EDGE
	dbw 60, OUTRAGE
	dbw 65, FISSURE
	db 0 ; no more level-up moves

FlygonEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, FLYGONX
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, SAND_ATTACK
	dbw 1, ASTONISH
	dbw 5, MUD_SLAP
	dbw 9, MUD_SHOT
	dbw 13, FAINT_ATTACK
	dbw 17, BULLDOZE
	dbw 21, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 29, DIG
	dbw 33, SCREECH
	dbw 36, DRAGON_CLAW
	dbw 40, CRUNCH
	dbw 44, EARTHQUAKE
	dbw 48, SANDSTORM
	dbw 52, DRAGON_DANCE
	dbw 56, STONE_EDGE
	dbw 60, OUTRAGE
	dbw 65, FISSURE
	db 0 ; no more level-up moves

CacneaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, CACTURNE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 4, ABSORB
	dbw 8, GROWTH
	dbw 12, LEECH_SEED
	dbw 16, BULLET_SEED
	dbw 20, NEEDLE_ARM
	dbw 24, FAINT_ATTACK
	dbw 27, INGRAIN
	dbw 30, PIN_MISSILE
	dbw 32, SUCKER_PUNCH
	dbw 35, SPIKES
	dbw 38, COTTON_SPORE
	dbw 41, NIGHT_SLASH
	dbw 44, GIGA_DRAIN
	dbw 47, LEAF_BLADE
	dbw 50, SANDSTORM
	dbw 53, DARK_PULSE
	dbw 56, SOLARBEAM
	dbw 60, DESTINY_BOND
	dbw 65, FRENZY_PLANT
	db 0 ; no more level-up moves

CacturneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, POISON_STING
	dbw 4, ABSORB
	dbw 8, GROWTH
	dbw 12, LEECH_SEED
	dbw 16, BULLET_SEED
	dbw 20, NEEDLE_ARM
	dbw 24, FAINT_ATTACK
	dbw 27, INGRAIN
	dbw 30, PIN_MISSILE
	dbw 32, SUCKER_PUNCH
	dbw 35, SPIKES
	dbw 38, COTTON_SPORE
	dbw 41, NIGHT_SLASH
	dbw 44, GIGA_DRAIN
	dbw 47, LEAF_BLADE
	dbw 50, SANDSTORM
	dbw 53, DARK_PULSE
	dbw 56, SOLARBEAM
	dbw 60, DESTINY_BOND
	dbw 65, FRENZY_PLANT
	db 0 ; no more level-up moves

SwabluEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, ALTARIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PECK
	dbw 4, PIXIE_DUST
	dbw 8, SING
	dbw 11, FURY_ATTACK
	dbw 14, FAE_VOICE
	dbw 18, TWISTER
	dbw 22, SAFEGUARD
	dbw 26, DRAGONBREATH
	dbw 30, MIST
	dbw 33, COTTON_SPORE
	dbw 36, TAKE_DOWN
	dbw 39, HEAL_BELL
	dbw 42, DRAGON_CLAW
	dbw 45, MOONBLAST
	dbw 48, PLAY_ROUGH
	dbw 51, DRAGON_DANCE
	dbw 54, RECOVER
	dbw 57, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 63, PERISH_SONG
	dbw 66, LUSTER_PURGE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

AltariaEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, ALTARIAX
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PECK
	dbw 4, PIXIE_DUST
	dbw 8, SING
	dbw 11, FURY_ATTACK
	dbw 14, FAE_VOICE
	dbw 18, TWISTER
	dbw 22, SAFEGUARD
	dbw 26, DRAGONBREATH
	dbw 30, MIST
	dbw 33, COTTON_SPORE
	dbw 36, TAKE_DOWN
	dbw 39, HEAL_BELL
	dbw 42, DRAGON_CLAW
	dbw 45, MOONBLAST
	dbw 48, PLAY_ROUGH
	dbw 51, DRAGON_DANCE
	dbw 54, RECOVER
	dbw 57, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 63, PERISH_SONG
	dbw 66, LUSTER_PURGE
	dbw 70, SKY_ATTACK
	db 0 ; no more level-up moves

ZangooseEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, QUICK_ATTACK
	dbw 7, FURY_SWIPES
	dbw 10, FURY_CUTTER
	dbw 13, METAL_CLAW
	dbw 16, DOUBLE_KICK
	dbw 19, FAINT_ATTACK
	dbw 22, FALSE_SWIPE
	dbw 25, CRUSH_CLAW
	dbw 28, DETECT
	dbw 31, TAUNT
	dbw 34, SWORDS_DANCE
	dbw 37, BRICK_BREAK
	dbw 40, SHADOW_CLAW
	dbw 44, FACADE
	dbw 48, AGILITY
	dbw 52, SLASH
	dbw 55, BELLY_DRUM
	dbw 60, DOUBLE_EDGE
	dbw 65, EXTREMESPEED
	db 0 ; no more level-up moves

SeviperEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LICK
	dbw 1, POISON_STING
	dbw 5, BITE
	dbw 9, SCREECH
	dbw 13, GLARE
	dbw 17, POISON_FANG
	dbw 21, POISON_TAIL
	dbw 24, FIRE_FANG
	dbw 27, THUNDER_FANG
	dbw 30, ICE_FANG
	dbw 33, VENOSHOCK
	dbw 36, CRUNCH
	dbw 39, SWAGGER
	dbw 42, POISON_JAB
	dbw 45, SLUDGE_BOMB
	dbw 48, HAZE
	dbw 51, SLUDGE_WAVE
	dbw 54, DARK_PULSE
	dbw 57, DRAGON_DANCE
	dbw 60, IRON_TAIL
	db 0 ; no more level-up moves

LunatoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, CONFUSION
	dbw 5, ROCK_THROW
	dbw 9, HYPNOSIS
	dbw 13, ANCIENTPOWER
	dbw 17, PSYBEAM
	dbw 21, MOONLIGHT
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, CALM_MIND
	dbw 34, AGILITY
	dbw 37, COSMIC_POWER
	dbw 40, PSYCHIC_M
	dbw 43, POWER_GEM
	dbw 46, ROCK_SLIDE
	dbw 49, MOONBLAST
	dbw 52, ICE_BEAM
	dbw 56, FUTURE_SIGHT
	dbw 60, EXPLOSION
	dbw 65, DREAM_EATER
	db 0 ; no more level-up moves

SolrockEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, CONFUSION
	dbw 5, ROCK_THROW
	dbw 9, HYPNOSIS
	dbw 13, FLAME_CHARGE
	dbw 17, ROCK_TOMB
	dbw 21, MORNING_SUN
	dbw 25, LIGHT_SCREEN
	dbw 28, REFLECT
	dbw 31, SUNNY_DAY
	dbw 34, AGILITY
	dbw 37, COSMIC_POWER
	dbw 40, ZEN_HEADBUTT
	dbw 43, ROCK_SLIDE
	dbw 46, FLAME_WHEEL
	dbw 49, WILLOWISP
	dbw 52, PSYCHO_CUT
	dbw 56, STONE_EDGE
	dbw 60, EXPLOSION
	dbw 65, HEAT_CRASH
	db 0 ; no more level-up moves

BarboachEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, WHISCASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 1, MUD_SLAP
	dbw 5, SAND_ATTACK
	dbw 9, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 17, AMNESIA
	dbw 21, REST
	dbw 24, BULLDOZE
	dbw 27, AQUA_TAIL
	dbw 30, ZEN_HEADBUTT
	dbw 33, RAIN_DANCE
	dbw 36, MUDDY_WATER
	dbw 39, WATERFALL
	dbw 42, FUTURE_SIGHT
	dbw 45, EARTHQUAKE
	dbw 48, EARTHPOWER
	dbw 51, DRAGON_DANCE
	dbw 54, HAZE
	dbw 57, THRASH
	dbw 60, HYDRO_PUMP
	dbw 65, FISSURE
	db 0 ; no more level-up moves

WhiscashEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, WATER_GUN
	dbw 1, MUD_SLAP
	dbw 5, SAND_ATTACK
	dbw 9, MUD_SHOT
	dbw 13, WATER_PULSE
	dbw 17, AMNESIA
	dbw 21, REST
	dbw 24, BULLDOZE
	dbw 27, AQUA_TAIL
	dbw 30, ZEN_HEADBUTT
	dbw 33, RAIN_DANCE
	dbw 36, MUDDY_WATER
	dbw 39, WATERFALL
	dbw 42, FUTURE_SIGHT
	dbw 45, EARTHQUAKE
	dbw 48, EARTHPOWER
	dbw 51, DRAGON_DANCE
	dbw 54, HAZE
	dbw 57, THRASH
	dbw 60, HYDRO_PUMP
	dbw 65, FISSURE
	db 0 ; no more level-up moves

CorphishEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CRAWDAUNT
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HARDEN
	dbw 4, LEER
	dbw 7, BITE
	dbw 11, TAUNT
	dbw 15, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 23, KNOCK_OFF
	dbw 27, PROTECT
	dbw 30, NIGHT_SLASH
	dbw 33, RAZORSHELL
	dbw 36, SWORDS_DANCE
	dbw 40, CRUNCH
	dbw 44, SHADOW_CLAW
	dbw 48, CRABHAMMER
	dbw 52, CURSE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

CrawdauntEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HARDEN
	dbw 4, LEER
	dbw 7, BITE
	dbw 11, TAUNT
	dbw 15, AQUA_JET
	dbw 19, BUBBLEBEAM
	dbw 23, KNOCK_OFF
	dbw 27, PROTECT
	dbw 30, NIGHT_SLASH
	dbw 33, RAZORSHELL
	dbw 36, SWORDS_DANCE
	dbw 40, CRUNCH
	dbw 44, SHADOW_CLAW
	dbw 48, CRABHAMMER
	dbw 52, CURSE
	dbw 60, GUILLOTINE
	db 0 ; no more level-up moves

BaltoyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CLAYDOL
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HARDEN
	dbw 1, MUD_SLAP
	dbw 4, RAPID_SPIN
	dbw 7, SAND_ATTACK
	dbw 10, ROCK_TOMB
	dbw 13, MUD_SHOT
	dbw 16, ANCIENTPOWER
	dbw 19, PSYBEAM
	dbw 22, LIGHT_SCREEN
	dbw 25, REFLECT
	dbw 28, RECOVER
	dbw 31, SANDSTORM
	dbw 34, CALM_MIND
	dbw 37, EXTRASENSORY
	dbw 40, EARTHPOWER
	dbw 43, COSMIC_POWER
	dbw 46, POWER_GEM
	dbw 49, PSYCHIC_M
	dbw 52, EXPLOSION
	dbw 56, FUTURE_SIGHT
	dbw 60, FISSURE
	db 0 ; no more level-up moves

ClaydolEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HARDEN
	dbw 1, MUD_SLAP
	dbw 4, RAPID_SPIN
	dbw 7, SAND_ATTACK
	dbw 10, ROCK_TOMB
	dbw 13, MUD_SHOT
	dbw 16, ANCIENTPOWER
	dbw 19, PSYBEAM
	dbw 22, LIGHT_SCREEN
	dbw 25, REFLECT
	dbw 28, RECOVER
	dbw 31, SANDSTORM
	dbw 34, CALM_MIND
	dbw 37, EXTRASENSORY
	dbw 40, EARTHPOWER
	dbw 43, COSMIC_POWER
	dbw 46, POWER_GEM
	dbw 49, PSYCHIC_M
	dbw 52, EXPLOSION
	dbw 56, FUTURE_SIGHT
	dbw 60, FISSURE
	db 0 ; no more level-up moves

LileepEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, CRADILY
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, ASTONISH
	dbw 4, ROCK_THROW
	dbw 8, CONFUSE_RAY
	dbw 12, LEECH_SEED
	dbw 15, ACID
	dbw 18, INGRAIN
	dbw 21, MEGA_DRAIN
	dbw 24, ANCIENTPOWER
	dbw 27, MAGICAL_LEAF
	dbw 30, VENOSHOCK
	dbw 33, CURSE
	dbw 36, AMNESIA
	dbw 39, GIGA_DRAIN
	dbw 42, POWER_GEM
	dbw 45, TOXIC
	dbw 48, RECOVER
	dbw 51, SUNNY_DAY
	dbw 55, SLUDGE_WAVE
	dbw 60, SOLARBEAM
	dbw 65, STRENGTH_SAP
	db 0 ; no more level-up moves

CradilyEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, ASTONISH
	dbw 4, ROCK_THROW
	dbw 8, CONFUSE_RAY
	dbw 12, LEECH_SEED
	dbw 15, ACID
	dbw 18, INGRAIN
	dbw 21, MEGA_DRAIN
	dbw 24, ANCIENTPOWER
	dbw 27, MAGICAL_LEAF
	dbw 30, VENOSHOCK
	dbw 33, CURSE
	dbw 36, AMNESIA
	dbw 39, GIGA_DRAIN
	dbw 42, POWER_GEM
	dbw 45, TOXIC
	dbw 48, RECOVER
	dbw 51, SUNNY_DAY
	dbw 55, SLUDGE_WAVE
	dbw 60, SOLARBEAM
	dbw 65, STRENGTH_SAP
	db 0 ; no more level-up moves

AnorithEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ARMALDO
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 1, WATER_GUN
	dbw 4, STRING_SHOT
	dbw 7, ROCK_THROW
	dbw 10, FURY_CUTTER
	dbw 13, METAL_CLAW
	dbw 16, ANCIENTPOWER
	dbw 19, RAPID_SPIN
	dbw 22, TWINEEDLE
	dbw 25, AQUA_JET
	dbw 28, ROCK_TOMB
	dbw 30, CRUSH_CLAW
	dbw 33, PROTECT
	dbw 36, ROCK_BLAST
	dbw 40, SWORDS_DANCE
	dbw 44, ROCK_SLIDE
	dbw 48, SHADOW_CLAW
	dbw 52, SANDSTORM
	dbw 56, STONE_EDGE
	dbw 60, MEGAHORN
	dbw 65, GUILLOTINE
	db 0 ; no more level-up moves

ArmaldoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 1, WATER_GUN
	dbw 4, STRING_SHOT
	dbw 7, ROCK_THROW
	dbw 10, FURY_CUTTER
	dbw 13, METAL_CLAW
	dbw 16, ANCIENTPOWER
	dbw 19, RAPID_SPIN
	dbw 22, TWINEEDLE
	dbw 25, AQUA_JET
	dbw 28, ROCK_TOMB
	dbw 30, CRUSH_CLAW
	dbw 33, PROTECT
	dbw 36, ROCK_BLAST
	dbw 40, SWORDS_DANCE
	dbw 44, ROCK_SLIDE
	dbw 48, SHADOW_CLAW
	dbw 52, SANDSTORM
	dbw 56, STONE_EDGE
	dbw 60, MEGAHORN
	dbw 65, GUILLOTINE
	db 0 ; no more level-up moves

FeebasEvosAttacks:
	; dbww EVOLVE_ITEM, PRISM_SCALE, MILOTIC
	dbbw EVOLVE_LEVEL, 20, MILOTIC
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 8, BUBBLE
	dbw 12, TACKLE
	dbw 16, FLAIL
	dbw 19, WATER_PULSE
	db 0 ; no more level-up moves

MiloticEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, WATER_GUN
	dbw 1, TWISTER
	dbw 1, FAE_VOICE
	dbw 1, WATER_PULSE
	dbw 20, DRAININGKISS
	dbw 22, BUBBLEBEAM
	dbw 24, AQUA_RING
	dbw 26, ATTRACT
	dbw 28, SAFEGUARD
	dbw 30, ICY_WIND
	dbw 32, RECOVER
	dbw 34, RAIN_DANCE
	dbw 36, MIST
	dbw 38, SCALD
	dbw 40, HAZE
	dbw 42, HEAL_BELL
	dbw 44, MIRROR_COAT
	dbw 46, SURF
	dbw 48, REST
	dbw 50, CALM_MIND
	dbw 52, ICE_BEAM
	dbw 54, FAERIEGLEAM
	dbw 56, DRAGONBREATH
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

KecleonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, ASTONISH
	dbw 1, LICK
	dbw 1, TAIL_WHIP
	dbw 4, BIND
	dbw 7, SHADOWSNEAK
	dbw 10, FURY_SWIPES
	dbw 14, FAINT_ATTACK
	dbw 18, PSYBEAM
	dbw 21, ANCIENTPOWER
	dbw 24, CONVERSION
	dbw 27, KNOCK_OFF
	dbw 30, SKETCH
	dbw 33, SHADOW_CLAW
	dbw 36, CONVERSION2
	dbw 38, SCREECH
	dbw 41, SLASH
	dbw 44, SUBSTITUTE
	dbw 47, SUCKER_PUNCH
	dbw 50, BULK_UP
	dbw 53, RECOVER
	dbw 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

ShuppetEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, BANETTE
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 1, NIGHT_SHADE
	dbw 4, SCREECH
	dbw 8, DISABLE
	dbw 11, SPITE
	dbw 14, SHADOWSNEAK
	dbw 17, WILLOWISP
	dbw 20, FAINT_ATTACK
	dbw 22, HEX
	dbw 25, CONFUSE_RAY
	dbw 28, CURSE
	dbw 30, SHADOW_CLAW
	dbw 33, KNOCK_OFF
	dbw 36, SUCKER_PUNCH
	dbw 39, SWORDS_DANCE
	dbw 42, NIGHT_SLASH
	dbw 45, DESTINY_BOND
	dbw 48, SHADOW_BALL
	dbw 51, MEAN_LOOK
	dbw 54, PAIN_SPLIT
	dbw 60, SHADOW_FORCE
	db 0 ; no more level-up moves

BanetteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 1, NIGHT_SHADE
	dbw 4, SCREECH
	dbw 8, DISABLE
	dbw 11, SPITE
	dbw 14, SHADOWSNEAK
	dbw 17, WILLOWISP
	dbw 20, FAINT_ATTACK
	dbw 22, HEX
	dbw 25, CONFUSE_RAY
	dbw 28, CURSE
	dbw 30, SHADOW_CLAW
	dbw 33, KNOCK_OFF
	dbw 36, SUCKER_PUNCH
	dbw 39, SWORDS_DANCE
	dbw 42, NIGHT_SLASH
	dbw 45, DESTINY_BOND
	dbw 48, SHADOW_BALL
	dbw 51, MEAN_LOOK
	dbw 54, PAIN_SPLIT
	dbw 60, SHADOW_FORCE
	db 0 ; no more level-up moves

DuskullEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, DUSCLOPS
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 1, ASTONISH
	dbw 1, BIND
	dbw 5, DISABLE
	dbw 9, FORESIGHT
	dbw 13, CONFUSE_RAY
	dbw 17, WILLOWISP
	dbw 21, HEX
	dbw 25, CURSE
	dbw 28, FAINT_ATTACK
	dbw 30, SHADOW_PUNCH
	dbw 33, PAIN_SPLIT
	dbw 36, COSMIC_POWER
	dbw 39, MEAN_LOOK
	dbw 42, FIRE_PUNCH
	dbw 45, ICE_PUNCH
	dbw 48, THUNDERPUNCH
	dbw 51, SHADOW_BALL
	dbw 54, FUTURE_SIGHT
	dbw 60, SHADOW_FORCE
	dbw 65, DESTINY_BOND
	db 0 ; no more level-up moves

DusclopsEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, DUSKNOIR
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 1, ASTONISH
	dbw 1, BIND
	dbw 5, DISABLE
	dbw 9, FORESIGHT
	dbw 13, CONFUSE_RAY
	dbw 17, WILLOWISP
	dbw 21, HEX
	dbw 25, CURSE
	dbw 28, FAINT_ATTACK
	dbw 30, SHADOW_PUNCH
	dbw 33, PAIN_SPLIT
	dbw 36, COSMIC_POWER
	dbw 39, MEAN_LOOK
	dbw 42, FIRE_PUNCH
	dbw 45, ICE_PUNCH
	dbw 48, THUNDERPUNCH
	dbw 51, SHADOW_BALL
	dbw 54, FUTURE_SIGHT
	dbw 60, SHADOW_FORCE
	dbw 65, DESTINY_BOND
	db 0 ; no more level-up moves

TropiusEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, TROPIUSX
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, GUST
	dbw 1, LEECH_SEED
	dbw 6, GROWTH
	dbw 10, STOMP
	dbw 14, RAZOR_LEAF
	dbw 18, SWEET_SCENT
	dbw 21, WHIRLWIND
	dbw 24, MAGICAL_LEAF
	dbw 27, SUNNY_DAY
	dbw 30, AERIAL_ACE
	dbw 33, AIR_CUTTER
	dbw 36, SYNTHESIS
	dbw 39, BODY_SLAM
	dbw 42, DRAGON_DANCE
	dbw 45, LEAF_BLADE
	dbw 48, GIGA_DRAIN
	dbw 54, SOLARBEAM
	dbw 60, OUTRAGE
	dbw 65, SKY_ATTACK
	dbw 70, HURRICANE
	db 0 ; no more level-up moves

ChimechoEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, CHIMECHOX
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, GROWL
	dbw 1, ASTONISH
	dbw 5, CONFUSION
	dbw 9, YAWN
	dbw 13, UPROAR
	dbw 17, PSYBEAM
	dbw 21, HEAL_BELL
	dbw 25, SAFEGUARD
	dbw 29, LIGHT_SCREEN
	dbw 32, REFLECT
	dbw 35, CALM_MIND
	dbw 38, EXTRASENSORY
	dbw 41, PSYCHIC_M
	dbw 44, RECOVER
	dbw 47, FLASHCANNON
	dbw 50, HYPER_VOICE
	dbw 54, SHADOW_BALL
	dbw 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

AbsolEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, ABSOLX
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 4, QUICK_ATTACK
	dbw 8, BITE
	dbw 11, FURY_CUTTER
	dbw 14, KNOCK_OFF
	dbw 17, FAINT_ATTACK
	dbw 20, DETECT
	dbw 23, TAUNT
	dbw 26, RAZOR_WIND
	dbw 29, SWORDS_DANCE
	dbw 32, SLASH
	dbw 35, FOCUS_ENERGY
	dbw 38, PSYCHO_CUT
	dbw 41, SUCKER_PUNCH
	dbw 44, NIGHT_SLASH
	dbw 47, PLAY_ROUGH
	dbw 50, PERISH_SONG
	dbw 54, FUTURE_SIGHT
	dbw 60, BEAT_UP
	db 0 ; no more level-up moves

WynautEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, WOBBUFFET
	db 0 ; no more evolutions
	dbw 1, CHARM
	dbw 1, ENCORE
	dbw 1, SPLASH
	dbw 1, AMNESIA
	dbw 15, COUNTER
	dbw 15, MIRROR_COAT
	dbw 15, SAFEGUARD
	dbw 15, DESTINY_BOND
	db 0 ; no more level-up moves

SnoruntEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, GLALIE
	dbww EVOLVE_ITEM, DAWN_STONE, FROSLASS
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 5, BITE
	dbw 9, ICE_BALL
	dbw 13, FROSTBITE
	dbw 17, HEADBUTT
	dbw 21, ICY_WIND
	dbw 25, ICE_FANG
	dbw 28, PROTECT
	dbw 30, ICICLE_SPEAR
	dbw 33, SPIKES
	dbw 36, CRUNCH
	dbw 39, HAIL
	dbw 42, BULK_UP
	dbw 45, ICICLE_CRASH
	dbw 48, FREEZE_DRY
	dbw 51, DOUBLE_EDGE
	dbw 55, BLIZZARD
	dbw 60, EXPLOSION
	db 0 ; no more level-up moves

GlalieEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, GLALIEX
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 1, ASTONISH
	dbw 5, BITE
	dbw 9, ICE_BALL
	dbw 13, FROSTBITE
	dbw 17, HEADBUTT
	dbw 21, ICY_WIND
	dbw 25, ICE_FANG
	dbw 28, PROTECT
	dbw 30, ICICLE_SPEAR
	dbw 33, SPIKES
	dbw 36, CRUNCH
	dbw 39, HAIL
	dbw 42, BULK_UP
	dbw 45, ICICLE_CRASH
	dbw 48, FREEZE_DRY
	dbw 51, DOUBLE_EDGE
	dbw 55, BLIZZARD
	dbw 60, EXPLOSION
	db 0 ; no more level-up moves

SphealEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, SEALEO
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, POWDER_SNOW
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 5, ROLLOUT
	dbw 9, ICE_BALL
	dbw 13, AURORA_BEAM
	dbw 17, REST
	dbw 20, HEADBUTT
	dbw 24, BUBBLEBEAM
	dbw 28, ENCORE
	dbw 32, BODY_SLAM
	dbw 35, MIRROR_COAT
	dbw 38, SURF
	dbw 41, PROTECT
	dbw 44, ICE_BEAM
	dbw 47, HAIL
	dbw 50, AMNESIA
	dbw 53, SLEEP_TALK
	dbw 56, HYDRO_PUMP
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

SealeoEvosAttacks:
	dbbw EVOLVE_LEVEL, 44, WALREIN
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, POWDER_SNOW
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 5, ROLLOUT
	dbw 9, ICE_BALL
	dbw 13, AURORA_BEAM
	dbw 17, REST
	dbw 20, HEADBUTT
	dbw 24, BUBBLEBEAM
	dbw 28, ENCORE
	dbw 32, BODY_SLAM
	dbw 35, MIRROR_COAT
	dbw 38, SURF
	dbw 41, PROTECT
	dbw 44, ICE_BEAM
	dbw 47, HAIL
	dbw 50, AMNESIA
	dbw 53, SLEEP_TALK
	dbw 56, HYDRO_PUMP
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

WalreinEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, POWDER_SNOW
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 5, ROLLOUT
	dbw 9, ICE_BALL
	dbw 13, AURORA_BEAM
	dbw 17, REST
	dbw 20, HEADBUTT
	dbw 24, BUBBLEBEAM
	dbw 28, ENCORE
	dbw 32, BODY_SLAM
	dbw 35, MIRROR_COAT
	dbw 38, SURF
	dbw 41, PROTECT
	dbw 44, ICE_BEAM
	dbw 47, HAIL
	dbw 50, AMNESIA
	dbw 53, SLEEP_TALK
	dbw 56, HYDRO_PUMP
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

ClamperlEvosAttacks:
	dbww EVOLVE_ITEM, DRAGON_FANG, HUNTAIL
	dbww EVOLVE_ITEM, DRAGON_SCALE, GOREBYSS
	db 0 ; no more evolutions
	dbw 1, CLAMP
	dbw 1, WATER_GUN
	dbw 1, DEFENSE_CURL
	dbw 6, WITHDRAW
	dbw 11, WHIRLPOOL
	dbw 16, WATER_PULSE
	dbw 21, PROTECT
	dbw 26, REST
	dbw 31, ACID_ARMOR
	dbw 36, MIRROR_COAT
	db 0 ; no more level-up moves

HuntailEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, CLAMP
	dbw 1, BITE
	dbw 5, SCREECH
	dbw 9, SCARY_FACE
	dbw 13, FAINT_ATTACK
	dbw 17, AQUA_JET
	dbw 21, POISON_TAIL
	dbw 25, SUCKER_PUNCH
	dbw 29, ICE_FANG
	dbw 32, THUNDER_FANG
	dbw 35, FIRE_FANG
	dbw 38, CRUNCH
	dbw 41, AQUA_TAIL
	dbw 44, RAIN_DANCE
	dbw 47, DRAGON_DANCE
	dbw 50, WATERFALL
	dbw 54, BATON_PASS
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

GorebyssEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, CLAMP
	dbw 1, CONFUSION
	dbw 5, WHIRLPOOL
	dbw 9, DRAININGKISS
	dbw 13, WATER_PULSE
	dbw 17, PSYBEAM
	dbw 21, AQUA_RING
	dbw 25, ATTRACT
	dbw 29, AGILITY
	dbw 33, SURF
	dbw 36, PSYCHIC_M
	dbw 40, AMNESIA
	dbw 43, ICE_BEAM
	dbw 46, SHADOW_BALL
	dbw 49, ENERVATE
	dbw 52, BATON_PASS
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

RelicanthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, WATER_GUN
	dbw 5, ROCK_THROW
	dbw 10, YAWN
	dbw 15, ROCK_TOMB
	dbw 20, ANCIENTPOWER
	dbw 25, TAKE_DOWN
	dbw 30, AQUA_TAIL
	dbw 33, RAIN_DANCE
	dbw 36, ROCK_SLIDE
	dbw 39, REST
	dbw 42, FLAIL
	dbw 45, EARTHQUAKE
	dbw 48, WATERFALL
	dbw 51, DOUBLE_EDGE
	dbw 55, STONE_EDGE
	dbw 60, SKULL_BASH
	db 0 ; no more level-up moves

LuvdiscEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, CHARM
	dbw 1, TACKLE
	dbw 4, WATER_GUN
	dbw 8, SWEET_KISS
	dbw 12, AQUA_JET
	dbw 16, AGILITY
	dbw 20, WATER_PULSE
	dbw 24, DRAININGKISS
	dbw 27, ATTRACT
	dbw 30, FLAIL
	dbw 33, AQUA_RING
	dbw 36, FAERIEGLEAM
	dbw 39, RAIN_DANCE
	dbw 42, CALM_MIND
	dbw 45, SAFEGUARD
	dbw 48, BATON_PASS
	dbw 51, SURF
	dbw 54, DRAGON_DANCE
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

BagonEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SHELGON
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, BITE
	dbw 5, TWISTER
	dbw 9, HEADBUTT
	dbw 13, SCARY_FACE
	dbw 17, BREAKING_SWIPE
	dbw 21, FIRE_FANG
	dbw 25, CRUSH_CLAW
	dbw 29, ZEN_HEADBUTT
	dbw 30, PROTECT
	dbw 33, DRAGON_CLAW
	dbw 36, DRAGONBREATH
	dbw 39, CRUNCH
	dbw 42, FOCUS_ENERGY
	dbw 45, DRAGON_DANCE
	dbw 48, FLAMETHROWER
	dbw 50, FLY
	dbw 55, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 65, HURRICANE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

ShelgonEvosAttacks:
	dbbw EVOLVE_LEVEL, 50, SALAMENCE
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, BITE
	dbw 5, TWISTER
	dbw 9, HEADBUTT
	dbw 13, SCARY_FACE
	dbw 17, BREAKING_SWIPE
	dbw 21, FIRE_FANG
	dbw 25, CRUSH_CLAW
	dbw 29, ZEN_HEADBUTT
	dbw 30, PROTECT
	dbw 33, DRAGON_CLAW
	dbw 36, DRAGONBREATH
	dbw 39, CRUNCH
	dbw 42, FOCUS_ENERGY
	dbw 45, DRAGON_DANCE
	dbw 48, FLAMETHROWER
	dbw 50, FLY
	dbw 55, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 65, HURRICANE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

SalamenceEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, SALAMENCEX
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, BITE
	dbw 5, TWISTER
	dbw 9, HEADBUTT
	dbw 13, SCARY_FACE
	dbw 17, BREAKING_SWIPE
	dbw 21, FIRE_FANG
	dbw 25, CRUSH_CLAW
	dbw 29, ZEN_HEADBUTT
	dbw 30, PROTECT
	dbw 33, DRAGON_CLAW
	dbw 36, DRAGONBREATH
	dbw 39, CRUNCH
	dbw 42, FOCUS_ENERGY
	dbw 45, DRAGON_DANCE
	dbw 48, FLAMETHROWER
	dbw 50, FLY
	dbw 55, DOUBLE_EDGE
	dbw 60, OUTRAGE
	dbw 65, HURRICANE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

BeldumEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, METANG
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 9, SCARY_FACE
	dbw 13, HEADBUTT
	dbw 17, PSYBEAM
	dbw 20, BULLET_PUNCH
	dbw 24, TAKE_DOWN
	dbw 28, REFLECT
	dbw 31, ICE_PUNCH
	dbw 34, THUNDERPUNCH
	dbw 37, ZEN_HEADBUTT
	dbw 40, AGILITY
	dbw 43, PSYCHIC_M
	dbw 45, METEOR_MASH
	dbw 49, COSMIC_POWER
	dbw 53, FLASHCANNON
	dbw 60, EXPLOSION
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

MetangEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, METAGROSS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 9, SCARY_FACE
	dbw 13, HEADBUTT
	dbw 17, PSYBEAM
	dbw 20, BULLET_PUNCH
	dbw 24, TAKE_DOWN
	dbw 28, REFLECT
	dbw 31, ICE_PUNCH
	dbw 34, THUNDERPUNCH
	dbw 37, ZEN_HEADBUTT
	dbw 40, AGILITY
	dbw 43, PSYCHIC_M
	dbw 45, METEOR_MASH
	dbw 49, COSMIC_POWER
	dbw 53, FLASHCANNON
	dbw 60, EXPLOSION
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

MetagrossEvosAttacks:
	dbww EVOLVE_ITEM, HOENNITE_X, METAGROSSX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, METAL_CLAW
	dbw 9, SCARY_FACE
	dbw 13, HEADBUTT
	dbw 17, PSYBEAM
	dbw 20, BULLET_PUNCH
	dbw 24, TAKE_DOWN
	dbw 28, REFLECT
	dbw 31, ICE_PUNCH
	dbw 34, THUNDERPUNCH
	dbw 37, ZEN_HEADBUTT
	dbw 40, AGILITY
	dbw 43, PSYCHIC_M
	dbw 45, METEOR_MASH
	dbw 49, COSMIC_POWER
	dbw 53, FLASHCANNON
	dbw 60, EXPLOSION
	dbw 65, HYPER_BEAM
	db 0 ; no more level-up moves

RegirockEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_THROW
	dbw 1, CHARGE_BEAM
	dbw 6, BULLDOZE
	dbw 12, ANCIENTPOWER
	dbw 18, STOMP
	dbw 24, ROCK_TOMB
	dbw 30, CURSE
	dbw 33, ROCK_SLIDE
	dbw 36, COSMIC_POWER
	dbw 39, RECOVER
	dbw 42, CROSS_CHOP
	dbw 45, EARTHQUAKE
	dbw 48, SANDSTORM
	dbw 51, STONE_EDGE
	dbw 54, EXPLOSION
	dbw 60, LOCK_ON
	dbw 66, ZAP_CANNON
	dbw 72, FISSURE
	db 0 ; no more level-up moves

RegiceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, ICY_WIND
	dbw 1, CHARGE_BEAM
	dbw 6, BULLDOZE
	dbw 12, ANCIENTPOWER
	dbw 18, FROSTBITE
	dbw 24, AURORA_BEAM
	dbw 30, HAIL
	dbw 33, AMNESIA
	dbw 36, FREEZE_DRY
	dbw 39, RECOVER
	dbw 42, ICE_BEAM
	dbw 45, POWER_GEM
	dbw 48, MIST
	dbw 51, BLIZZARD
	dbw 54, EXPLOSION
	dbw 57, SUPERPOWER
	dbw 60, LOCK_ON
	dbw 66, ZAP_CANNON
	dbw 72, HYPER_BEAM
	db 0 ; no more level-up moves

RegisteelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, METAL_CLAW
	dbw 1, CHARGE_BEAM
	dbw 6, BULLDOZE
	dbw 12, ANCIENTPOWER
	dbw 18, STOMP
	dbw 24, GYRO_BALL
	dbw 30, CURSE
	dbw 33, AMNESIA
	dbw 36, COSMIC_POWER
	dbw 39, RECOVER
	dbw 42, CROSS_CHOP
	dbw 45, HEAVY_SLAM
	dbw 48, EARTHQUAKE
	dbw 51, IRON_TAIL
	dbw 54, EXPLOSION
	dbw 57, FLASHCANNON
	dbw 60, LOCK_ON
	dbw 66, ZAP_CANNON
	dbw 72, HYPER_BEAM
	db 0 ; no more level-up moves

LatiasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TWISTER
	dbw 5, CHARM
	dbw 10, RECOVER
	dbw 15, SAFEGUARD
	dbw 20, PSYBEAM
	dbw 25, LIGHT_SCREEN
	dbw 30, REFLECT
	dbw 35, MIST_BALL
	dbw 40, DRAGONBREATH
	dbw 45, CALM_MIND
	dbw 50, PSYCHIC_M
	dbw 55, HEAL_BELL
	dbw 60, FUTURE_SIGHT
	dbw 65, OUTRAGE
	db 0 ; no more level-up moves

LatiosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TWISTER
	dbw 1, DRAGON_DANCE
	dbw 10, RECOVER
	dbw 15, SAFEGUARD
	dbw 20, PSYBEAM
	dbw 25, RAZOR_WIND
	dbw 30, ZEN_HEADBUTT
	dbw 35, AGILITY
	dbw 40, DRAGONBREATH
	dbw 45, CALM_MIND
	dbw 50, PSYCHIC_M
	dbw 55, SHADOW_BALL
	dbw 60, FUTURE_SIGHT
	dbw 65, OUTRAGE
	dbw 70, LUSTER_PURGE
	db 0 ; no more level-up moves

KyogreEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, ANCIENTPOWER
	dbw 7, SCARY_FACE
	dbw 14, WATER_PULSE
	dbw 21, FROSTBITE
	dbw 27, MUDDY_WATER
	dbw 30, RAIN_DANCE
	dbw 33, AQUA_RING
	dbw 36, ICE_BEAM
	dbw 40, CALM_MIND
	dbw 43, SCALD
	dbw 46, REST
	dbw 50, HYDRO_PUMP
	dbw 55, THUNDER
	dbw 60, BLIZZARD
	dbw 65, WATER_SPOUT
	db 0 ; no more level-up moves

GroudonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MUD_SLAP
	dbw 1, ANCIENTPOWER
	dbw 7, SCARY_FACE
	dbw 14, MUD_SHOT
	dbw 21, LAVA_PLUME
	dbw 27, EARTHPOWER
	dbw 30, SUNNY_DAY
	dbw 33, BULK_UP
	dbw 36, EARTHQUAKE
	dbw 40, FIRE_PUNCH
	dbw 43, STONE_EDGE
	dbw 46, REST
	dbw 50, FIRE_BLAST
	dbw 55, SOLARBEAM
	dbw 60, FISSURE
	dbw 65, ERUPTION
	db 0 ; no more level-up moves

RayquazaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TWISTER
	dbw 1, ANCIENTPOWER
	dbw 7, SCARY_FACE
	dbw 14, WING_ATTACK
	dbw 21, BREAKING_SWIPE
	dbw 27, EXTREMESPEED
	dbw 30, DRAGONBREATH
	dbw 33, DRAGON_DANCE
	dbw 36, DRAGON_CLAW
	dbw 40, EARTHQUAKE
	dbw 43, HYPER_VOICE
	dbw 46, REST
	dbw 50, FLY
	dbw 55, HURRICANE
	dbw 60, OUTRAGE
	dbw 70, HYPER_BEAM
	db 0 ; no more level-up moves

JirachiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, METAL_CLAW
	dbw 5, SWIFT
	dbw 10, REST
	dbw 15, HEADBUTT
	dbw 20, PSYBEAM
	dbw 25, ANCIENTPOWER
	dbw 30, COSMIC_POWER
	dbw 35, ZEN_HEADBUTT
	dbw 40, CALM_MIND
	dbw 42, PSYCHIC_M
	dbw 45, FLASHCANNON
	dbw 49, METEOR_MASH
	dbw 52, BATON_PASS
	dbw 55, FAERIEGLEAM
	dbw 60, FUTURE_SIGHT
	dbw 65, DOUBLE_EDGE
	db 0 ; no more level-up moves

ENDSECTION
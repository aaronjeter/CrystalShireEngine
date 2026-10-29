; Target type and flags of each move (double battles phase 0.5, step 8).
; Entries correspond to constants/move_constants.asm, in the same order as Moves.
;   move_attr <target>[, <flag>...]
; Targets (MOVE_TARGET_*, Gen 3 rules; singles ignores them):
;   SELECTED     one battler the user picks (most moves)
;   BOTH_FOES    both foes, not the ally (Surf, Rock Slide, Growl...)
;   ALL_OTHERS   both foes and the ally (Earthquake, Explosion...)
;   USER         the user itself
;   USER_SIDE    the user's side (Reflect, Light Screen, Safeguard, Mist)
;   FOE_SIDE     the foes' side (Spikes)
;   RANDOM_FOE   a random foe (Thrash, Outrage, Petal Dance, Uproar)
;   ALL          every battler (Haze, Perish Song)
;   FIELD        the whole field (weather)
;   COUNTER      whoever last hit the user (Counter, Mirror Coat)
; Flags (MOVEFLAG_*):
;   CONTACT      makes contact (Tough Claws, Static, Rough Skin...)
;   PUNCH        punching move (Iron Fist, Elemental Fist)
;   BITE         biting move (Strong Jaw, Elemental Fang)
;   SLICING      slicing move (Sharpness, Elemental Blade)
;   SOUND        sound-based move (for Soundproof and the like; nothing reads it yet)

MACRO move_attr
	db MOVE_TARGET_\1
	DEF _move_flags = 0
	rept _NARG - 1
		shift
		DEF _move_flags |= MOVEFLAG_\1
	endr
	db _move_flags
ENDM

MoveAttributes::
; entries correspond to constants/move_constants.asm
	indirect_table 2, 1
	indirect_entries NUM_ATTACKS, MoveAttributeData
	indirect_table_end

MoveAttributeData:
	move_attr SELECTED, CONTACT                    ; POUND
	move_attr SELECTED, CONTACT                    ; KARATE_CHOP
	move_attr SELECTED, CONTACT                    ; DOUBLESLAP
	move_attr SELECTED, CONTACT, PUNCH             ; COMET_PUNCH
	move_attr SELECTED, CONTACT, PUNCH             ; MEGA_PUNCH
	move_attr SELECTED                             ; PAY_DAY
	move_attr SELECTED, CONTACT, PUNCH             ; FIRE_PUNCH
	move_attr SELECTED, CONTACT, PUNCH             ; ICE_PUNCH
	move_attr SELECTED, CONTACT, PUNCH             ; THUNDERPUNCH
	move_attr SELECTED, CONTACT                    ; SCRATCH
	move_attr SELECTED, CONTACT                    ; VICEGRIP
	move_attr SELECTED, CONTACT                    ; GUILLOTINE
	move_attr BOTH_FOES                            ; RAZOR_WIND
	move_attr USER                                 ; SWORDS_DANCE
	move_attr SELECTED, CONTACT, SLICING           ; CUT
	move_attr SELECTED                             ; GUST
	move_attr SELECTED, CONTACT                    ; WING_ATTACK
	move_attr SELECTED                             ; WHIRLWIND
	move_attr SELECTED, CONTACT                    ; FLY
	move_attr SELECTED, CONTACT                    ; BIND
	move_attr SELECTED, CONTACT                    ; SLAM
	move_attr SELECTED, CONTACT                    ; VINE_WHIP
	move_attr SELECTED, CONTACT                    ; STOMP
	move_attr SELECTED, CONTACT                    ; DOUBLE_KICK
	move_attr SELECTED, CONTACT                    ; MEGA_KICK
	move_attr SELECTED, CONTACT                    ; JUMP_KICK
	move_attr SELECTED, CONTACT                    ; ROLLING_KICK
	move_attr SELECTED                             ; SAND_ATTACK
	move_attr SELECTED, CONTACT                    ; HEADBUTT
	move_attr SELECTED, CONTACT                    ; HORN_ATTACK
	move_attr SELECTED, CONTACT                    ; FURY_ATTACK
	move_attr SELECTED, CONTACT                    ; HORN_DRILL
	move_attr SELECTED, CONTACT                    ; TACKLE
	move_attr SELECTED, CONTACT                    ; BODY_SLAM
	move_attr SELECTED, CONTACT                    ; WRAP
	move_attr SELECTED, CONTACT                    ; TAKE_DOWN
	move_attr RANDOM_FOE, CONTACT                  ; THRASH
	move_attr SELECTED, CONTACT                    ; DOUBLE_EDGE
	move_attr BOTH_FOES, CONTACT                   ; TAIL_WHIP
	move_attr SELECTED                             ; POISON_STING
	move_attr SELECTED                             ; TWINEEDLE
	move_attr SELECTED                             ; PIN_MISSILE
	move_attr BOTH_FOES                            ; LEER
	move_attr SELECTED, CONTACT, BITE              ; BITE
	move_attr BOTH_FOES, SOUND                     ; GROWL
	move_attr SELECTED, SOUND                      ; ROAR
	move_attr SELECTED, SOUND                      ; SING
	move_attr SELECTED, SOUND                      ; SUPERSONIC
	move_attr SELECTED                             ; SONICBOOM
	move_attr SELECTED                             ; DISABLE
	move_attr SELECTED                             ; ACID
	move_attr SELECTED                             ; EMBER
	move_attr SELECTED                             ; FLAMETHROWER
	move_attr USER_SIDE                            ; MIST
	move_attr SELECTED                             ; WATER_GUN
	move_attr SELECTED                             ; HYDRO_PUMP
	move_attr BOTH_FOES                            ; SURF
	move_attr SELECTED                             ; ICE_BEAM
	move_attr BOTH_FOES                            ; BLIZZARD
	move_attr SELECTED                             ; PSYBEAM
	move_attr SELECTED                             ; BUBBLEBEAM
	move_attr SELECTED                             ; AURORA_BEAM
	move_attr SELECTED                             ; HYPER_BEAM
	move_attr SELECTED, CONTACT                    ; PECK
	move_attr SELECTED, CONTACT                    ; DRILL_PECK
	move_attr SELECTED, CONTACT                    ; SUBMISSION
	move_attr SELECTED, CONTACT                    ; LOW_KICK
	move_attr COUNTER, CONTACT                     ; COUNTER
	move_attr SELECTED, CONTACT                    ; SEISMIC_TOSS
	move_attr SELECTED, CONTACT                    ; STRENGTH
	move_attr SELECTED                             ; ABSORB
	move_attr SELECTED                             ; MEGA_DRAIN
	move_attr SELECTED                             ; LEECH_SEED
	move_attr USER                                 ; GROWTH
	move_attr SELECTED                             ; RAZOR_LEAF
	move_attr SELECTED                             ; SOLARBEAM
	move_attr SELECTED                             ; POISONPOWDER
	move_attr SELECTED                             ; STUN_SPORE
	move_attr SELECTED                             ; SLEEP_POWDER
	move_attr RANDOM_FOE, CONTACT                  ; PETAL_DANCE
	move_attr BOTH_FOES                            ; STRING_SHOT
	move_attr SELECTED                             ; DRAGON_RAGE
	move_attr SELECTED                             ; FIRE_SPIN
	move_attr SELECTED                             ; THUNDERSHOCK
	move_attr SELECTED                             ; THUNDERBOLT
	move_attr SELECTED                             ; THUNDER_WAVE
	move_attr SELECTED                             ; THUNDER
	move_attr SELECTED                             ; ROCK_THROW
	move_attr ALL_OTHERS                           ; EARTHQUAKE
	move_attr SELECTED                             ; FISSURE
	move_attr SELECTED, CONTACT                    ; DIG
	move_attr SELECTED                             ; TOXIC
	move_attr SELECTED                             ; CONFUSION
	move_attr SELECTED                             ; PSYCHIC_M
	move_attr SELECTED                             ; HYPNOSIS
	move_attr USER                                 ; MEDITATE
	move_attr USER                                 ; AGILITY
	move_attr SELECTED, CONTACT                    ; QUICK_ATTACK
	move_attr SELECTED, CONTACT                    ; RAGE
	move_attr USER                                 ; TELEPORT
	move_attr SELECTED                             ; NIGHT_SHADE
	move_attr SELECTED                             ; MIMIC
	move_attr SELECTED, SOUND                      ; SCREECH
	move_attr USER                                 ; DOUBLE_TEAM
	move_attr USER                                 ; RECOVER
	move_attr USER                                 ; HARDEN
	move_attr USER                                 ; MINIMIZE
	move_attr SELECTED                             ; SMOKESCREEN
	move_attr SELECTED                             ; CONFUSE_RAY
	move_attr USER                                 ; WITHDRAW
	move_attr USER                                 ; DEFENSE_CURL
	move_attr USER                                 ; BARRIER
	move_attr USER_SIDE                            ; LIGHT_SCREEN
	move_attr ALL                                  ; HAZE
	move_attr USER_SIDE                            ; REFLECT
	move_attr USER                                 ; FOCUS_ENERGY
	move_attr USER, CONTACT                        ; BIDE
	move_attr USER                                 ; METRONOME
	move_attr USER                                 ; MIRROR_MOVE
	move_attr ALL_OTHERS                           ; SELFDESTRUCT
	move_attr SELECTED                             ; EGG_BOMB
	move_attr SELECTED, CONTACT                    ; LICK
	move_attr SELECTED                             ; SMOG
	move_attr SELECTED                             ; SLUDGE
	move_attr SELECTED                             ; BONE_CLUB
	move_attr SELECTED                             ; FIRE_BLAST
	move_attr SELECTED, CONTACT                    ; WATERFALL
	move_attr SELECTED, CONTACT                    ; CLAMP
	move_attr BOTH_FOES                            ; SWIFT
	move_attr SELECTED, CONTACT                    ; SKULL_BASH
	move_attr SELECTED                             ; SPIKE_CANNON
	move_attr SELECTED, CONTACT                    ; CONSTRICT
	move_attr USER                                 ; AMNESIA
	move_attr SELECTED                             ; KINESIS
	move_attr USER                                 ; SOFTBOILED
	move_attr SELECTED, CONTACT                    ; HI_JUMP_KICK
	move_attr SELECTED                             ; GLARE
	move_attr SELECTED                             ; DREAM_EATER
	move_attr SELECTED                             ; POISON_GAS
	move_attr SELECTED                             ; BARRAGE
	move_attr SELECTED, CONTACT                    ; LEECH_LIFE
	move_attr SELECTED                             ; LOVELY_KISS
	move_attr SELECTED, CONTACT                    ; SKY_ATTACK
	move_attr SELECTED                             ; TRANSFORM
	move_attr SELECTED                             ; BUBBLE
	move_attr SELECTED, CONTACT, PUNCH             ; DIZZY_PUNCH
	move_attr SELECTED                             ; SPORE
	move_attr SELECTED                             ; FLASH
	move_attr SELECTED                             ; PSYWAVE
	move_attr USER                                 ; SPLASH
	move_attr USER                                 ; ACID_ARMOR
	move_attr SELECTED, CONTACT                    ; CRABHAMMER
	move_attr ALL_OTHERS                           ; EXPLOSION
	move_attr SELECTED, CONTACT                    ; FURY_SWIPES
	move_attr SELECTED                             ; BONEMERANG
	move_attr USER                                 ; REST
	move_attr BOTH_FOES                            ; ROCK_SLIDE
	move_attr SELECTED, CONTACT, BITE              ; HYPER_FANG
	move_attr USER                                 ; SHARPEN
	move_attr USER                                 ; CONVERSION
	move_attr SELECTED                             ; TRI_ATTACK
	move_attr SELECTED, CONTACT                    ; SUPER_FANG
	move_attr SELECTED, CONTACT, SLICING           ; SLASH
	move_attr USER                                 ; SUBSTITUTE
	move_attr SELECTED, CONTACT                    ; STRUGGLE
	move_attr SELECTED                             ; SKETCH
	move_attr SELECTED, CONTACT                    ; TRIPLE_KICK
	move_attr SELECTED, CONTACT                    ; THIEF
	move_attr SELECTED                             ; SPIDER_WEB
	move_attr SELECTED                             ; MIND_READER
	move_attr SELECTED                             ; NIGHTMARE
	move_attr SELECTED, CONTACT                    ; FLAME_WHEEL
	move_attr SELECTED, SOUND                      ; SNORE
	move_attr USER                                 ; CURSE
	move_attr SELECTED, CONTACT                    ; FLAIL
	move_attr USER                                 ; CONVERSION2
	move_attr SELECTED                             ; AEROBLAST
	move_attr SELECTED                             ; COTTON_SPORE
	move_attr SELECTED, CONTACT                    ; REVERSAL
	move_attr SELECTED                             ; SPITE
	move_attr BOTH_FOES                            ; POWDER_SNOW
	move_attr USER                                 ; PROTECT
	move_attr SELECTED, CONTACT, PUNCH             ; MACH_PUNCH
	move_attr SELECTED                             ; SCARY_FACE
	move_attr SELECTED, CONTACT                    ; FAINT_ATTACK
	move_attr SELECTED                             ; SWEET_KISS
	move_attr USER                                 ; BELLY_DRUM
	move_attr SELECTED                             ; SLUDGE_BOMB
	move_attr SELECTED                             ; MUD_SLAP
	move_attr SELECTED                             ; OCTAZOOKA
	move_attr FOE_SIDE                             ; SPIKES
	move_attr SELECTED                             ; ZAP_CANNON
	move_attr SELECTED                             ; FORESIGHT
	move_attr USER                                 ; DESTINY_BOND
	move_attr ALL, SOUND                           ; PERISH_SONG
	move_attr BOTH_FOES                            ; ICY_WIND
	move_attr USER                                 ; DETECT
	move_attr SELECTED                             ; BONE_RUSH
	move_attr SELECTED                             ; LOCK_ON
	move_attr RANDOM_FOE, CONTACT                  ; OUTRAGE
	move_attr FIELD                                ; SANDSTORM
	move_attr SELECTED                             ; GIGA_DRAIN
	move_attr USER                                 ; ENDURE
	move_attr SELECTED                             ; CHARM
	move_attr SELECTED, CONTACT                    ; ROLLOUT
	move_attr SELECTED, CONTACT, SLICING           ; FALSE_SWIPE
	move_attr SELECTED                             ; SWAGGER
	move_attr USER                                 ; MILK_DRINK
	move_attr SELECTED, CONTACT                    ; SPARK
	move_attr SELECTED, CONTACT, SLICING           ; FURY_CUTTER
	move_attr SELECTED, CONTACT                    ; STEEL_WING
	move_attr SELECTED                             ; MEAN_LOOK
	move_attr SELECTED                             ; ATTRACT
	move_attr USER                                 ; SLEEP_TALK
	move_attr USER, SOUND                          ; HEAL_BELL
	move_attr SELECTED, CONTACT                    ; RETURN
	move_attr SELECTED                             ; PRESENT
	move_attr SELECTED, CONTACT                    ; FRUSTRATION
	move_attr USER_SIDE                            ; SAFEGUARD
	move_attr SELECTED                             ; PAIN_SPLIT
	move_attr SELECTED                             ; SACRED_FIRE
	move_attr ALL_OTHERS                           ; MAGNITUDE
	move_attr SELECTED, CONTACT, PUNCH             ; DYNAMICPUNCH
	move_attr SELECTED, CONTACT                    ; MEGAHORN
	move_attr SELECTED                             ; DRAGONBREATH
	move_attr USER                                 ; BATON_PASS
	move_attr SELECTED                             ; ENCORE
	move_attr SELECTED, CONTACT                    ; PURSUIT
	move_attr SELECTED, CONTACT                    ; RAPID_SPIN
	move_attr BOTH_FOES                            ; SWEET_SCENT
	move_attr SELECTED, CONTACT                    ; IRON_TAIL
	move_attr SELECTED, CONTACT                    ; METAL_CLAW
	move_attr SELECTED, CONTACT                    ; VITAL_THROW
	move_attr USER                                 ; MORNING_SUN
	move_attr USER                                 ; SYNTHESIS
	move_attr USER                                 ; MOONLIGHT
	move_attr SELECTED                             ; HIDDEN_POWER
	move_attr SELECTED, CONTACT                    ; CROSS_CHOP
	move_attr BOTH_FOES                            ; TWISTER
	move_attr FIELD                                ; RAIN_DANCE
	move_attr FIELD                                ; SUNNY_DAY
	move_attr SELECTED, CONTACT, BITE              ; CRUNCH
	move_attr COUNTER                              ; MIRROR_COAT
	move_attr SELECTED                             ; PSYCH_UP
	move_attr SELECTED, CONTACT                    ; EXTREMESPEED
	move_attr SELECTED                             ; ANCIENTPOWER
	move_attr SELECTED                             ; SHADOW_BALL
	move_attr SELECTED                             ; FUTURE_SIGHT
	move_attr SELECTED, CONTACT                    ; ROCK_SMASH
	move_attr SELECTED                             ; WHIRLPOOL
	move_attr SELECTED, CONTACT                    ; BEAT_UP
	move_attr SELECTED                             ; WILLOWISP
	move_attr SELECTED                             ; PIXIE_DUST
	move_attr SELECTED                             ; FAE_VOICE
	move_attr RANDOM_FOE, SOUND                    ; UPROAR
	move_attr BOTH_FOES                            ; HEAT_WAVE
	move_attr FIELD                                ; HAIL
	move_attr SELECTED, CONTACT, PUNCH             ; FOCUS_PUNCH
	move_attr SELECTED                             ; NATURE_POWER
	move_attr USER                                 ; CHARGE
	move_attr SELECTED, CONTACT                    ; SUPERPOWER
	move_attr SELECTED, CONTACT                    ; BRICK_BREAK
	move_attr BOTH_FOES                            ; ERUPTION
	move_attr SELECTED, CONTACT                    ; ARM_THRUST
	move_attr SELECTED                             ; LUSTER_PURGE
	move_attr SELECTED                             ; MIST_BALL
	move_attr SELECTED, CONTACT                    ; BLAZE_KICK
	move_attr SELECTED, CONTACT                    ; ICE_BALL
	move_attr SELECTED, CONTACT                    ; NEEDLE_ARM
	move_attr BOTH_FOES, SOUND                     ; HYPER_VOICE
	move_attr SELECTED, CONTACT, BITE              ; POISON_FANG
	move_attr SELECTED, CONTACT                    ; CRUSH_CLAW
	move_attr SELECTED                             ; BLAST_BURN
	move_attr SELECTED                             ; HYDRO_CANNON
	move_attr SELECTED, CONTACT                    ; METEOR_MASH
	move_attr SELECTED, CONTACT                    ; ASTONISH
	move_attr BOTH_FOES, SLICING                   ; AIR_CUTTER
	move_attr SELECTED                             ; ROCK_TOMB
	move_attr SELECTED                             ; SILVER_WIND
	move_attr USER                                 ; COSMIC_POWER
	move_attr BOTH_FOES                            ; WATER_SPOUT
	move_attr SELECTED                             ; SIGNAL_BEAM
	move_attr SELECTED, CONTACT, PUNCH             ; SHADOW_PUNCH
	move_attr SELECTED                             ; EXTRASENSORY
	move_attr BOTH_FOES                            ; MUDDY_WATER
	move_attr SELECTED                             ; BULLET_SEED
	move_attr SELECTED, CONTACT, SLICING           ; AERIAL_ACE
	move_attr SELECTED                             ; ICICLE_SPEAR
	move_attr SELECTED, CONTACT                    ; DRAGON_CLAW
	move_attr SELECTED                             ; FRENZY_PLANT
	move_attr USER                                 ; BULK_UP
	move_attr SELECTED                             ; MUD_SHOT
	move_attr SELECTED, CONTACT                    ; POISON_TAIL
	move_attr SELECTED, CONTACT                    ; VOLT_TACKLE
	move_attr SELECTED                             ; MAGICAL_LEAF
	move_attr USER                                 ; CALM_MIND
	move_attr SELECTED, CONTACT, SLICING           ; LEAF_BLADE
	move_attr USER                                 ; DRAGON_DANCE
	move_attr SELECTED                             ; ROCK_BLAST
	move_attr SELECTED                             ; SHOCK_WAVE
	move_attr SELECTED                             ; WATER_PULSE
	move_attr SELECTED, CONTACT, BITE              ; THUNDER_FANG
	move_attr SELECTED, CONTACT, BITE              ; ICE_FANG
	move_attr SELECTED, CONTACT, BITE              ; FIRE_FANG
	move_attr SELECTED, CONTACT                    ; DRAININGKISS
	move_attr SELECTED                             ; MOONBLAST
	move_attr SELECTED, CONTACT                    ; PLAY_ROUGH
	move_attr SELECTED                             ; AURA_SPHERE
	move_attr SELECTED, CONTACT                    ; SHADOW_CLAW
	move_attr SELECTED                             ; ICICLE_CRASH
	move_attr SELECTED, CONTACT                    ; POISON_JAB
	move_attr SELECTED                             ; POWER_GEM
	move_attr SELECTED, CONTACT, SLICING           ; PSYCHO_CUT
	move_attr SELECTED, CONTACT                    ; ZEN_HEADBUTT
	move_attr SELECTED                             ; FLASHCANNON
	move_attr SELECTED, CONTACT                    ; AQUA_JET
	move_attr SELECTED                             ; DARK_PULSE
	move_attr BOTH_FOES                            ; FAERIEGLEAM
	move_attr ALL_OTHERS                           ; SLUDGE_WAVE
	move_attr SELECTED, CONTACT, PUNCH             ; BULLET_PUNCH
	move_attr SELECTED                             ; HURRICANE
	move_attr SELECTED, CONTACT                    ; SHADOWSNEAK
	move_attr SELECTED, CONTACT                    ; SHADOW_FORCE
	move_attr SELECTED, CONTACT                    ; STONE_EDGE
	move_attr SELECTED                             ; SCALD
	move_attr SELECTED, CONTACT, SLICING           ; RAZORSHELL
	move_attr SELECTED                             ; EARTHPOWER
	move_attr SELECTED, CONTACT                    ; SHOCKSLAM
	move_attr BOTH_FOES, SOUND                     ; SNARL
	move_attr SELECTED                             ; HEX
	move_attr SELECTED                             ; VENOSHOCK
	move_attr SELECTED                             ; VOLT_SWITCH
	move_attr SELECTED, CONTACT                    ; U_TURN
	move_attr SELECTED, CONTACT                    ; FLIP_TURN
	move_attr SELECTED, CONTACT, SLICING           ; NIGHT_SLASH
	move_attr SELECTED                             ; WEATHER_BALL
	move_attr SELECTED                             ; FREEZE_DRY
	move_attr SELECTED                             ; FROSTBITE
	move_attr SELECTED, CONTACT                    ; ACROBATICS
	move_attr SELECTED, CONTACT                    ; COUP_DE_GRACE
	move_attr SELECTED, CONTACT                    ; KNOCK_OFF
	move_attr ALL_OTHERS                           ; DISCHARGE
	move_attr ALL_OTHERS                           ; BULLDOZE
	move_attr BOTH_FOES                            ; ELECTRO_WEB
	move_attr BOTH_FOES, CONTACT                   ; BREAKING_SWIPE
	move_attr SELECTED, CONTACT                    ; FACADE
	move_attr SELECTED, CONTACT                    ; SUCKER_PUNCH
	move_attr ALL_OTHERS                           ; LAVA_PLUME
	move_attr SELECTED                             ; TAUNT
	move_attr SELECTED                             ; CHARGE_BEAM
	move_attr SELECTED                             ; ELECTRO_BALL
	move_attr SELECTED, CONTACT                    ; BODY_PRESS
	move_attr SELECTED, CONTACT                    ; FLAME_CHARGE
	move_attr SELECTED                             ; MYSTICAL_FIRE
	move_attr SELECTED                             ; YAWN
	move_attr SELECTED                             ; STRENGTH_SAP
	move_attr SELECTED                             ; ENERVATE
	move_attr SELECTED, CONTACT                    ; AQUA_TAIL
	move_attr SELECTED, CONTACT                    ; GRASS_KNOT
	move_attr SELECTED, CONTACT                    ; GYRO_BALL
	move_attr SELECTED, CONTACT                    ; HEAVY_SLAM
	move_attr SELECTED, CONTACT                    ; HEAT_CRASH
	move_attr USER                                 ; INGRAIN
	move_attr USER                                 ; AQUA_RING
	move_attr SELECTED, CONTACT, PUNCH             ; DRAIN_PUNCH
	move_attr SELECTED, CONTACT                    ; FORCE_PALM
	move_attr SELECTED                             ; ACID_SPRAY
.IndirectEnd::

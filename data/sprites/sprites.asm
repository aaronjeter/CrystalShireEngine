MACRO overworld_sprite
; pointer, length, type, palette
	dw \1
	db \2 tiles, BANK(\1), \3, \4
ENDM

MACRO overworld_sprite_lz
; like overworld_sprite, for LZ-compressed graphics (bit 0 of the length)
	if (\3) == STILL_SPRITE
		assert (\2) <= FOLLOWER_GFX_BUFFER_TILES, "\1 doesn't fit wFollowerGFXBuffer"
	else
		assert (\2) * 2 <= FOLLOWER_GFX_BUFFER_TILES, "\1 (standing + walking frames) doesn't fit wFollowerGFXBuffer"
	endc
	dw \1
	db \2 tiles | SPRITEDATA_SIZE_LZ, BANK(\1), \3, \4
ENDM

OverworldSprites:
; entries correspond to SPRITE_* constants
	table_width NUM_SPRITEDATA_FIELDS
	overworld_sprite ChrisSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz ChrisBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz GameboyKidSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite RivalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz OakSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz RedSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BlueSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BillSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz ElderSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz JanineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz KurtSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite MomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BlaineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz RedsMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz DaisySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz ElmSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz WillSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite_lz FalknerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz WhitneySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BugsySpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz MortySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz ChuckSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz JasmineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz PryceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz ClairSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BrockSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz KarenSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz BrunoSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz MistySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz LanceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz SurgeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz ErikaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz KogaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SabrinaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz CooltrainerMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz CooltrainerFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz BugCatcherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz TwinSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz YoungsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz LassSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz TeacherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BeautySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz SuperNerdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz RockerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz PokefanMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz PokefanFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz GrampsSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz GrannySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SwimmerGuySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz SwimmerGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz BigSnorlaxSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz SurfingPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz RocketSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz RocketGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz NurseSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite_lz LinkReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz ClerkSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz FisherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz FishingGuruSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz ScientistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz KimonoGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz SageSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz UnusedGuySpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite_lz GentlemanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz BlackBeltSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz ReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz OfficerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz CalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SlowpokeSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz CaptainSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz BigLaprasSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz GymGuideSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz SailorSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz BikerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz PharmacistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MonsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz FairySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BirdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz DragonSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BigOnixSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz N64SpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SudowoodoSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite_lz SurfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PokeBallSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz PokedexSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz PaperSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz VirtualBoySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz OldLinkReceptionistSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite_lz RockSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite_lz BoulderSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite_lz SnesSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz FamicomSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz FruitTreeSpriteGFX, 4, STILL_SPRITE, PAL_OW_TREE
	overworld_sprite_lz GoldTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SilverTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_EMOTE_GRAY
	overworld_sprite KrisSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz KrisBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz KurtOutsideSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite_lz SuicuneSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite_lz EnteiSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz RaikouSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite_lz StandingYoungsterSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite BrendanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz BrendanBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite MaySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz MayBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite GreenSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite_lz GreenBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	assert_table_length NUM_OVERWORLD_SPRITES

ItemDescriptions:
	indirect_table 2, 1
	indirect_entries NUM_ITEM_POCKET, ItemDescriptions1
	indirect_entries FIRST_KEY_ITEM - 1; sparse Table
	indirect_entries (FIRST_KEY_ITEM - 1) + NUM_KEY_ITEM_POCKET, ItemDescriptionsKeyItems
	indirect_entries FIRST_BALL_ITEM - 1 ; sparse Table
	indirect_entries (FIRST_BALL_ITEM - 1) + NUM_BALL_ITEM_POCKET, ItemDescriptionsBalls
	indirect_table_end

ItemDescriptions1:
; entries correspond to item ids (see constants/item_constants.asm)
	dw BrightpowderDesc ; 0001
	dw QuestionMarkDesc ; 0002
	dw MoonStoneDesc    ; 0003
	dw AntidoteDesc     ; 0004
	dw BurnHealDesc     ; 0005
	dw IceHealDesc      ; 0006
	dw AwakeningDesc    ; 0007
	dw ParlyzHealDesc   ; 0008
	dw FullRestoreDesc  ; 0009
	dw MaxPotionDesc    ; 000A
	dw HyperPotionDesc  ; 000B
	dw SuperPotionDesc  ; 000C
	dw PotionDesc       ; 000D
	dw EscapeRopeDesc   ; 000E
	dw RepelDesc        ; 000F
	dw MaxElixerDesc    ; 0010
	dw FireStoneDesc    ; 0011
	dw ThunderStoneDesc ; 0012
	dw WaterStoneDesc   ; 0013
	dw MarvelScaleDesc  ; 0014
	dw HPUpDesc         ; 0015
	dw ProteinDesc      ; 0016
	dw IronDesc         ; 0017
	dw CarbosDesc       ; 0018
	dw LuckyPunchDesc   ; 0019
	dw CalciumDesc      ; 001A
	dw RareCandyDesc    ; 001B
	dw XAccuracyDesc    ; 001C
	dw LeafStoneDesc    ; 001D
	dw MetalPowderDesc  ; 001E
	dw NuggetDesc       ; 001F
	dw PokeDollDesc     ; 0020
	dw FullHealDesc     ; 0021
	dw ReviveDesc       ; 0022
	dw MaxReviveDesc    ; 0023
	dw GuardSpecDesc    ; 0024
	dw SuperRepelDesc   ; 0025
	dw MaxRepelDesc     ; 0026
	dw DireHitDesc      ; 0027
	dw QuestionMarkDesc ; 0028
	dw FreshWaterDesc   ; 0029
	dw SodaPopDesc      ; 002A
	dw LemonadeDesc     ; 002B
	dw XAttackDesc      ; 002C
	dw QuestionMarkDesc ; 002D
	dw XDefendDesc      ; 002E
	dw XSpeedDesc       ; 002F
	dw XSpecialDesc     ; 0030
	dw QuestionMarkDesc ; 0031
	dw ExpShareDesc     ; 0032
	dw SilverLeafDesc   ; 0033
	dw PPUpDesc         ; 0034
	dw EtherDesc        ; 0035
	dw MaxEtherDesc     ; 0036
	dw ElixerDesc       ; 0037
	dw MoomooMilkDesc   ; 0038
	dw QuickClawDesc    ; 0039
	dw PsnCureBerryDesc ; 003A
	dw GoldLeafDesc     ; 003B
	dw SoftSandDesc     ; 003C
	dw SharpBeakDesc    ; 003D
	dw PrzCureBerryDesc ; 003E
	dw BurntBerryDesc   ; 003F
	dw IceBerryDesc     ; 0040
	dw PoisonBarbDesc   ; 0041
	dw KingsRockDesc    ; 0042
	dw BitterBerryDesc  ; 0043
	dw MintBerryDesc    ; 0044
	dw RedApricornDesc  ; 0045
	dw TinyMushroomDesc ; 0046
	dw BigMushroomDesc  ; 0047
	dw SilverPowderDesc ; 0048
	dw BluApricornDesc  ; 0049
	dw QuestionMarkDesc ; 004A
	dw AmuletCoinDesc   ; 004B
	dw YlwApricornDesc  ; 004C
	dw GrnApricornDesc  ; 004D
	dw CleanseTagDesc   ; 004E
	dw MysticWaterDesc  ; 004F
	dw TwistedSpoonDesc ; 0050
	dw WhtApricornDesc  ; 0051
	dw BlackbeltDesc    ; 0052
	dw BlkApricornDesc  ; 0053
	dw QuestionMarkDesc ; 0054
	dw PnkApricornDesc  ; 0055
	dw BlackGlassesDesc ; 0056
	dw SlowpokeTailDesc ; 0057
	dw PinkBowDesc      ; 0058
	dw StickDesc        ; 0059
	dw SmokeBallDesc    ; 005A
	dw NeverMeltIceDesc ; 005B
	dw MagnetDesc       ; 005C
	dw MiracleBerryDesc ; 005D
	dw PearlDesc        ; 005E
	dw BigPearlDesc     ; 005F
	dw EverStoneDesc    ; 0060
	dw SpellTagDesc     ; 0061
	dw RageCandyBarDesc ; 0062
	dw MiracleSeedDesc  ; 0063
	dw ThickClubDesc    ; 0064
	dw FocusBandDesc    ; 0065
	dw QuestionMarkDesc ; 0066
	dw EnergyPowderDesc ; 0067
	dw EnergyRootDesc   ; 0068
	dw HealPowderDesc   ; 0069
	dw RevivalHerbDesc  ; 006A
	dw HardStoneDesc    ; 006B
	dw LuckyEggDesc     ; 006C
	dw StardustDesc     ; 006D
	dw StarPieceDesc    ; 006E
	dw QuestionMarkDesc ; 006F
	dw QuestionMarkDesc ; 0070
	dw ZincDesc         ; 0071
	dw CharcoalDesc     ; 0072
	dw BerryJuiceDesc   ; 0073
	dw ScopeLensDesc    ; 0074
	dw DawnStoneDesc    ; 0075
	dw IceStoneDesc     ; 0076
	dw MetalCoatDesc    ; 0077
	dw DragonFangDesc   ; 0078
	dw QuestionMarkDesc ; 0079
	dw LeftoversDesc    ; 007A
	dw KantoiteXDesc    ; 007B
	dw KantoiteYDesc    ; 007C
	dw JohtoiteXDesc    ; 007D
	dw MysteryBerryDesc ; 007E
	dw DragonScaleDesc  ; 007F
	dw BerserkGeneDesc  ; 0080
	dw HoenniteXDesc    ; 0081
	dw RazorberryDesc   ; 0082
	dw IronberryDesc    ; 0083
	dw SacredAshDesc    ; 0084
	dw FlowerMailDesc   ; 0085
	dw HasteberryDesc   ; 0086
	dw LightBallDesc    ; 0087
	dw NormalBoxDesc    ; 0088
	dw GorgeousBoxDesc  ; 0089
	dw SunStoneDesc     ; 008A
	dw PolkadotBowDesc  ; 008B
	dw QuestionMarkDesc ; 008C
	dw UpGradeDesc      ; 008D
	dw BerryDesc        ; 008E
	dw GoldBerryDesc    ; 008F
	dw FocusberryDesc   ; 0090
	dw WardberryDesc    ; 0091
	dw BrickPieceDesc   ; 0092
	dw SurfMailDesc     ; 0093
	dw LiteBlueMailDesc ; 0094
	dw PortraitMailDesc ; 0095
	dw LovelyMailDesc   ; 0096
	dw EonMailDesc      ; 0097
	dw MorphMailDesc    ; 0098
	dw BlueSkyMailDesc  ; 0099
	dw MusicMailDesc    ; 009A
	dw MirageMailDesc   ; 009B
	dw QuestionMarkDesc ; 009C
	dw QuestionMarkDesc ; 009D
	dw QuestionMarkDesc ; 009E
	dw QuestionMarkDesc ; 009F
.IndirectEnd:

ItemDescriptionsKeyItems:
	dw BicycleDesc      ; 0100
	dw CoinCaseDesc     ; 0101
	dw ItemfinderDesc   ; 0102
	dw OldRodDesc       ; 0103
	dw GoodRodDesc      ; 0104
	dw SuperRodDesc     ; 0105
	dw RedScaleDesc     ; 0106
	dw SecretPotionDesc ; 0107
	dw SSTicketDesc     ; 0108
	dw MysteryEggDesc   ; 0109
	dw ClearBellDesc    ; 010A
	dw SilverWingDesc   ; 010B
	dw GSBallDesc       ; 010C
	dw BlueCardDesc     ; 010D
	dw CardKeyDesc      ; 010E
	dw MachinePartDesc  ; 010F
	dw EggTicketDesc    ; 0110
	dw LostItemDesc     ; 0111
	dw BasementKeyDesc  ; 0112
	dw PassDesc         ; 0113
	dw SquirtBottleDesc ; 0114
	dw RainbowWingDesc  ; 0115
	dw BirdWhistleDesc
	dw LanternDesc
	dw HatchetDesc
	dw PickaxeDesc
	dw FlippersDesc
.IndirectEnd:

ItemDescriptionsBalls:
	dw MasterBallDesc ; 0200
	dw UltraBallDesc  ; 0201
	dw GreatBallDesc  ; 0202
	dw PokeBallDesc   ; 0203
	dw HeavyBallDesc  ; 0204
	dw LevelBallDesc  ; 0205
	dw LureBallDesc   ; 0206
	dw FastBallDesc   ; 0207
	dw FriendBallDesc ; 0208
	dw MoonBallDesc   ; 0209
	dw LoveBallDesc   ; 020A
	dw ParkBallDesc   ; 020B
.IndirectEnd:

MasterBallDesc:
	db   "The best Ball. It"
	next "never misses.@"

UltraBallDesc:
	db   "A Ball with a high"
	next "rate of success.@"

BrightpowderDesc:
	db   "Lowers the foe's"
	next "accuracy. (Hold)@"

GreatBallDesc:
	db   "A Ball with a de-"
	next "cent success rate.@"

PokeBallDesc:
	db   "An item for catch-"
	next "ing #MON.@"

BicycleDesc:
	db   "A collapsible bike"
	next "for fast movement.@"

MoonStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

AntidoteDesc:
	db   "Cures poisoned"
	next "#MON.@"

BurnHealDesc:
	db   "Heals burned"
	next "#MON.@"

IceHealDesc:
	db   "Defrosts frozen"
	next "#MON.@"

AwakeningDesc:
	db   "Awakens sleeping"
	next "#MON.@"

ParlyzHealDesc:
	db   "Heals paralyzed"
	next "#MON.@"

FullRestoreDesc:
	db   "Fully restores HP"
	next "& status.@"

MaxPotionDesc:
	db   "Fully restores"
	next "#MON HP.@"

HyperPotionDesc:
	db   "Restores #MON"
	next "HP by 120.@"

SuperPotionDesc:
	db   "Restores #MON"
	next "HP by 60.@"

PotionDesc:
	db   "Restores #MON"
	next "HP by 20.@"

EscapeRopeDesc:
	db   "Use for escaping"
	next "from caves, etc.@"

RepelDesc:
	db   "Repels weak #-"
	next "MON for 100 steps.@"

MaxElixerDesc:
	db   "Fully restores the"
	next "PP of one #MON.@"

FireStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

ThunderStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

WaterStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

HPUpDesc:
	db   "Raises the Hp of"
	next "one #MON.@"

ProteinDesc:
	db   "Raises Attack of"
	next "one #MON.@"

IronDesc:
	db   "Raises Defense of"
	next "one #MON.@"

CarbosDesc:
	db   "Raises Speed of"
	next "one #MON.@"

LuckyPunchDesc:
	db   "Ups critical hit"
	next "ratio of Chansey.@"

CalciumDesc:
	db   "Raises Spcl.Atk"
	next "of one #MON.@"

RareCandyDesc:
	db   "Raises level of a"
	next "#MON by one.@"

XAccuracyDesc:
	db   "Raises accuracy."
	next "(1 BTL)@"

LeafStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

MetalPowderDesc:
	db   "Raises Defense of"
	next "Ditto. (Hold)@"

NuggetDesc:
	db   "Made of pure gold."
	next "Sell high.@"

PokeDollDesc:
	db   "Use to escape from"
	next "a wild #MON.@"

FullHealDesc:
	db   "Eliminates all"
	next "status problems.@"

ReviveDesc:
	db   "Restores a fainted"
	next "#MON to 1/2 HP.@"

MaxReviveDesc:
	db   "Fully restores a"
	next "fainted #MON.@"

GuardSpecDesc:
	db   "Prevents stats"
	next "reduction. (1 Btl)@"

SuperRepelDesc:
	db   "Repels weak #-"
	next "MON for 200 steps.@"

MaxRepelDesc:
	db   "Repels weak #-"
	next "MON for 250 steps.@"

DireHitDesc:
	db   "Ups critical hit"
	next "ratio. (1 Btl)@"

FreshWaterDesc:
	db   "Restores #MON"
	next "HP by 50.@"

SodaPopDesc:
	db   "Restores #MON"
	next "HP by 60.@"

LemonadeDesc:
	db   "Restores #MON"
	next "HP by 80.@"

XAttackDesc:
	db   "Raises Attack."
	next "(1 BTL)@"

XDefendDesc:
	db   "Raises Defense."
	next "(1 Btl)@"

XSpeedDesc:
	db   "Raises Speed."
	next "(1 Btl)@"

XSpecialDesc:
	db   "Raises Special"
	next "Attack. (1 Btl)@"

CoinCaseDesc:
	db   "Holds up to 9,999"
	next "game coins.@"

ItemfinderDesc:
	db   "Checks for unseen"
	next "items in the area.@"

ExpShareDesc:
	db   "Shares battle Exp."
	next "Points. (Hold)@"

OldRodDesc:
	db   "Use by water to"
	next "fish for #MON.@"

GoodRodDesc:
	db   "A good Rod for"
	next "catching #MON.@"

SilverLeafDesc:
	db   "A strange, silver-"
	next "colored leaf.@"

SuperRodDesc:
	db   "The best Rod for"
	next "catching #MON.@"

PPUpDesc:
	db   "Raises max PP of"
	next "a selected move.@"

EtherDesc:
	db   "Restores PP of one"
	next "move by 10.@"

MaxEtherDesc:
	db   "Fully restores PP"
	next "of one move.@"

ElixerDesc:
	db   "Restores PP of all"
	next "moves by 10.@"

RedScaleDesc:
	db   "A scale from the"
	next "red Gyarados.@"

SecretPotionDesc:
	db   "Fully heals any"
	next "#MON.@"

SSTicketDesc:
	db   "A ticket for the"
	next "S.S.Aqua.@"

MysteryEggDesc:
	db   "An Egg obtained"
	next "from Mr.#MON.@"

ClearBellDesc:
	db   "Makes a gentle"
	next "ringing.@"

SilverWingDesc:
	db   "A strange, silver-"
	next "colored feather.@"

MoomooMilkDesc:
	db   "Restores #MON"
	next "HP by 100.@"

QuickClawDesc:
	db   "Raises 1st strike"
	next "ratio. (Hold)@"

PsnCureBerryDesc:
	db   "A self-cure for"
	next "poison. (Hold)@"

GoldLeafDesc:
	db   "A strange, gold-"
	next "colored leaf.@"

SoftSandDesc:
	db   "Powers up ground-"
	next "type moves. (Hold)@"

SharpBeakDesc:
	db   "Powers up flying-"
	next "type moves. (Hold)@"

PrzCureBerryDesc:
	db   "A self-cure for"
	next "paralysis. (Hold)@"

BurntBerryDesc:
	db   "A self-cure for"
	next "freezing. (Hold)@"

IceBerryDesc:
	db   "A self-heal for a"
	next "burn. (Hold)@"

PoisonBarbDesc:
	db   "Powers up poison-"
	next "type moves. (Hold)@"

KingsRockDesc:
	db   "May make the foe"
	next "flinch. (Hold)@"

BitterBerryDesc:
	db   "A self-cure for"
	next "confusion. (Hold)@"

MintBerryDesc:
	db   "A self-awakening"
	next "for sleep. (Hold)@"

RedApricornDesc:
	db   "A red Apricorn.@"

TinyMushroomDesc:
	db   "An ordinary mush-"
	next "room. Sell low.@"

BigMushroomDesc:
	db   "A rare mushroom."
	next "Sell high.@"

SilverPowderDesc:
	db   "Powers up bug-type"
	next "moves. (Hold)@"

BluApricornDesc:
	db   "A blue Apricorn.@"

AmuletCoinDesc:
	db   "Doubles monetary"
	next "earnings. (Hold)@"

YlwApricornDesc:
	db   "A yellow Apricorn.@"

GrnApricornDesc:
	db   "A green Apricorn.@"

CleanseTagDesc:
	db   "Helps repel wild"
	next "#MON. (Hold)@"

MysticWaterDesc:
	db   "Powers up water-"
	next "type moves. (Hold)@"

TwistedSpoonDesc:
	db   "Powers up psychic-"
	next "type moves. (Hold)@"

WhtApricornDesc:
	db   "A white Apricorn.@"

BlackbeltDesc:
	db   "Boosts fighting-"
	next "type moves. (Hold)@"

BlkApricornDesc:
	db   "A black Apricorn."
	next "@"

PnkApricornDesc:
	db   "A pink Apricorn."
	next "@"

BlackGlassesDesc:
	db   "Powers up dark-"
	next "type moves. (Hold)@"

SlowpokeTailDesc:
	db   "Very tasty. Sell"
	next "high.@"

PinkBowDesc:
	db   "Powers up normal-"
	next "type moves. (Hold)@"

StickDesc:
	db   "An ordinary stick."
	next "Sell low.@"

SmokeBallDesc:
	db   "Escape from wild"
	next "#MON. (Hold)@"

NeverMeltIceDesc:
	db   "Powers up ice-type"
	next "moves. (Hold)@"

MagnetDesc:
	db   "Boosts electric-"
	next "type moves. (Hold)@"

MiracleBerryDesc:
	db   "Cures all status"
	next "problems. (Hold)@"

PearlDesc:
	db   "A beautiful pearl."
	next "Sell low.@"

BigPearlDesc:
	db   "A big, beautiful"
	next "pearl. Sell high.@"

EverStoneDesc:
	db   "Stops evolution."
	next "(Hold)@"

SpellTagDesc:
	db   "Powers up ghost-"
	next "type moves. (Hold)@"

RageCandyBarDesc:
	db   "Restores #MON"
	next "HP by 20.@"

GSBallDesc:
	db   "The mysterious"
	next "Ball.@"

BlueCardDesc:
	db   "Card to save"
	next "points.@"

MiracleSeedDesc:
	db   "Powers up grass-"
	next "type moves. (Hold)@"

ThickClubDesc:
	db   "A bone of some"
	next "sort. Sell low.@"

FocusBandDesc:
	db   "May prevent faint-"
	next "ing. (Hold)@"

EnergyPowderDesc:
	db   "Restores #MON"
	next "HP by 90. Bitter.@"

EnergyRootDesc:
	db   "Restores #MON"
	next "HP by 200. Bitter.@"

HealPowderDesc:
	db   "Cures all status"
	next "problems. Bitter.@"

RevivalHerbDesc:
	db   "Revives fainted"
	next "#MON. Bitter.@"

HardStoneDesc:
	db   "Powers up rock-"
	next "type moves. (Hold)@"

LuckyEggDesc:
	db   "Earns extra EXP."
	next "points. (Hold)@"

CardKeyDesc:
	db   "Opens shutters in"
	next "the Radio Tower.@"

MachinePartDesc:
	db   "A machine part for"
	next "the Power Plant.@"

EggTicketDesc:
	db   "May use at Golden-"
	next "rod trade corner.@"

LostItemDesc:
	db   "The # Doll lost"
	next "by the Copycat.@"

StardustDesc:
	db   "Pretty, red sand."
	next "Sell high.@"

StarPieceDesc:
	db   "A hunk of red gem."
	next "Sell very high.@"

BasementKeyDesc:
	db   "Opens doors.@"

PassDesc:
	db   "A ticket for the"
	next "Magnet Train.@"

ZincDesc:
	db   "Raises Spcl.Def"
	next "of one #MON.@"

CharcoalDesc:
	db   "Powers up fire-"
	next "type moves. (Hold)@"

BerryJuiceDesc:
	db   "Restores #MON"
	next "HP by 20.@"

ScopeLensDesc:
	db   "Raises critical"
	next "hit ratio. (Hold)@"

DawnStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

IceStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

MetalCoatDesc:
	db   "Powers up steel-"
	next "type moves. (Hold)@"

DragonFangDesc:
	db   "Powers up dragon-"
	next "type moves. (Hold)@"

LeftoversDesc:
	db   "Restores HP during"
	next "battle. (Hold)@"

MysteryBerryDesc:
	db   "A self-restore"
	next "for PP. (Hold)@"

DragonScaleDesc:
	db   "A rare dragon-type"
	next "item.@"

BerserkGeneDesc:
	db   "Boosts Attack but"
	next "causes confusion.@"

SacredAshDesc:
	db   "Fully revives all"
	next "fainted #MON.@"

HeavyBallDesc:
	db   "A Ball for catch-"
	next "ing heavy #MON.@"

FlowerMailDesc:
	db   "Flower-print Mail."
	next "(HOLD)@"

LevelBallDesc:
	db   "A Ball for lower-"
	next "level #MON.@"

LureBallDesc:
	db   "A Ball for #MON"
	next "hooked by a Rod.@"

FastBallDesc:
	db   "A Ball for catch-"
	next "ing fast #MON.@"

LightBallDesc:
	db   "An odd, electrical"
	next "orb. (Hold)@"

FriendBallDesc:
	db   "A BALL that makes"
	next "#MON friendly.@"

MoonBallDesc:
	db   "A Ball for Moon"
	next "Stone evolvers.@"

LoveBallDesc:
	db   "For catching the"
	next "opposite gender.@"

NormalBoxDesc:
	db   "Open it and see"
	next "what's inside.@"

GorgeousBoxDesc:
	db   "Open it and see"
	next "what's inside.@"

SunStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

PolkadotBowDesc:
	db   "Powers up normal-"
	next "type moves. (Hold)@"

UpGradeDesc:
	db   "A mysterious box"
	next "made by Silph Co.@"

BerryDesc:
	db   "A self-restore"
	next "item. (10HP, Hold)@"

GoldBerryDesc:
	db   "A self-restore"
	next "item. (30HP, Hold)@"

SquirtBottleDesc:
	db   "A bottle used for"
	next "watering plants.@"

ParkBallDesc:
	db   "The Bug-Catching"
	next "Contest Ball.@"

RainbowWingDesc:
	db   "A mystical feather"
	next "of rainbow colors.@"

QuestionMarkDesc:
	db   "?@"

BrickPieceDesc:
	db   "A rare chunk of"
	next "tile.@"

SurfMailDesc:
	db   "Lapras-print Mail."
	next "(Hold)@"

LiteBlueMailDesc:
	db   "Dratini-print"
	next "Mail. (Hold)@"

PortraitMailDesc:
	db   "Mail featuring the"
	next "holder's likeness.@"

LovelyMailDesc:
	db   "Heart-print Mail."
	next "(Hold)@"

EonMailDesc:
	db   "Eevee-print Mail."
	next "(Hold)@"

MorphMailDesc:
	db   "Ditto-print Mail."
	next "(Hold)@"

BlueSkyMailDesc:
	db   "Sky-print Mail."
	next "(Hold)@"

MusicMailDesc:
	db   "Natu-print Mail."
	next "(Hold)@"

MirageMailDesc:
	db   "Mew-print Mail."
	next "(Hold)@"

BirdWhistleDesc:
	db   "A whistle to"
	next "call Delibird.@"

LanternDesc:
	db   "A lantern to"
	next "use Flash. @"

HatchetDesc:
	db   "A hatchet to"
	next "Cut with. @"

PickaxeDesc:
	db   "A tool to"
	next "Smash Rocks.@"

FlippersDesc:
	db   "Lets you"
	next "Swim.@"

KantoiteXDesc:
	db   "Empowers certain"
	next "Kanto #MON.@"

KantoiteYDesc:
	db   "Empowers certain"
	next "Kanto #MON.@"

JohtoiteXDesc:
	db   "Empowers certain"
	next "Johto #MON.@"

HoenniteXDesc:
	db   "Empowers certain"
	next "Hoenn #MON.@"

RazorberryDesc:
	db   "Eat to boost"
	next "Attack (Hold)@"

IronberryDesc:
	db   "Eat to boost"
	next "Defense (Hold)@"

HasteberryDesc:
	db   "Eat to boost"
	next "Speed (Hold)@"

FocusberryDesc:
	db   "Eat to boost"
	next "Sp Atk (Hold)@"

WardberryDesc:
	db   "Eat to boost"
	next "Sp Def (Hold)@"

MarvelScaleDesc:
	db   "A very shiny"
	next "scale (Rare).@"
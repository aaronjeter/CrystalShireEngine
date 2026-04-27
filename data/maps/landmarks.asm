MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName
	landmark  36, 116, LittlerootName
	landmark  36, 100, OldaleName
	landmark  20, 100, PetalburgName
	landmark  12,  76, RustboroName
	landmark  28, 132, DewfordName
	landmark  52, 108, SlateportName
	landmark  52,  84, MauvilleName
	landmark  36,  84, VerdanturfName
	landmark  36,  60, LavaridgeName
	landmark  28,  44, FallarborName
	landmark  84,  44, FortreeName
	landmark 124,  60, LilycoveName
	landmark 140,  68, MossdeepName
	landmark 124,  84, SootopolisName
	landmark 124,  60, PacifidlogName
	landmark 140, 108, EvergrandeName
	landmark  12,  92, PetalburgWoodsName
	landmark  36,  76, RusturfTunnelName
	landmark  28, 132, GraniteCaveName
	landmark  52,  92, NewMauvilleName
	landmark  52,  68, LavaridgeDesertName
	landmark  44,  68, FieryPathName
	landmark  12,  60, MeteorFallsName
	landmark 108,  76, MtPyreName
	landmark  36, 108, Route101Name
	landmark  44, 100, Route102Name
	landmark  28, 100, Route103Name
	landmark  12,  92, Route104Name
	landmark  12, 108, Route105Name
	landmark  44, 132, Route108Name
	landmark  52, 124, Route109Name
	landmark  52, 100, Route110Name
	landmark  52,  76, Route111Name
	landmark  44,  60, Route112Name
	landmark  36,  44, Route113Name
	landmark  12,  44, Route114Name
	landmark  12,  68, Route115Name
	landmark  28,  76, Route116Name
	landmark  44,  84, Route117Name
	landmark  68,  84, Route118Name
	landmark  76,  60, Route119Name
	landmark  92,  52, Route120Name
	landmark 108,  60, Route121Name
	landmark 108,  76, Route122Name
	landmark 100,  84, Route123Name
	assert_table_length NUM_LANDMARKS

NewBarkTownName:     db "New Bark<BSP>Town@"
CherrygroveCityName: db "Cherrygrove<BSP>City@"
VioletCityName:      db "Violet City@"
AzaleaTownName:      db "Azalea Town@"
GoldenrodCityName:   db "Goldenrod<BSP>City@"
EcruteakCityName:    db "Ecruteak<BSP>City@"
OlivineCityName:     db "Olivine<BSP>City@"
CianwoodCityName:    db "Cianwood<BSP>City@"
MahoganyTownName:    db "Mahogany<BSP>Town@"
BlackthornCityName:  db "Blackthorn<BSP>City@"
LakeOfRageName:      db "Lake of<BSP>Rage@"
SilverCaveName:      db "Silver Cave@"
SproutTowerName:     db "Sprout<BSP>Tower@"
RuinsOfAlphName:     db "Ruins<BSP>of Alph@"
UnionCaveName:       db "Union Cave@"
SlowpokeWellName:    db "Slowpoke<BSP>Well@"
RadioTowerName:      db "Radio Tower@"
PowerPlantName:      db "Power Plant@"
NationalParkName:    db "National<BSP>Park@"
TinTowerName:        db "Tin Tower@"
LighthouseName:      db "Lighthouse@"
WhirlIslandsName:    db "Whirl<BSP>Islands@"
MtMortarName:        db "Mt.Mortar@"
DragonsDenName:      db "Dragon's<BSP>Den@"
IcePathName:         db "Ice Path@"
PalletTownName:      db "Pallet Town@"
ViridianCityName:    db "Viridian<BSP>City@"
PewterCityName:      db "Pewter City@"
CeruleanCityName:    db "Cerulean<BSP>City@"
LavenderTownName:    db "Lavender<BSP>Town@"
VermilionCityName:   db "Vermilion<BSP>City@"
CeladonCityName:     db "Celadon<BSP>City@"
SaffronCityName:     db "Saffron<BSP>City@"
FuchsiaCityName:     db "Fuchsia<BSP>City@"
CinnabarIslandName:  db "Cinnabar<BSP>ISLAND@"
IndigoPlateauName:   db "Indigo<BSP>Plateau@"
VictoryRoadName:     db "Victory<BSP>Road@"
MtMoonName:          db "Mt.Moon@"
RockTunnelName:      db "Rock Tunnel@"
LavRadioTowerName:   db "Lav<BSP>Radio Tower@"
SeafoamIslandsName:  db "Seafoam<BSP>Islands@"
LittlerootName:		 db "Littleroot<BSP>Town@"
OldaleName:			 db "Oldale<BSP>Town@"
PetalburgName:		 db "Petalburg<BSP>Town@"
RustboroName:		 db "Rustboro<BSP>Town@"
DewfordName:		 db "Dewford<BSP>Town@"
SlateportName:		 db "Slateport<BSP>Town@"
MauvilleName:		 db "Mauville<BSP>Town@"
VerdanturfName:		 db "Verdanturf<BSP>Town@"
LavaridgeName:       db "Lavaridge<BSP>Town@"
FallarborName:       db "Fallarbor<BSP>Town@"
FortreeName:         db "Fortree<BSP>City@"
LilycoveName:        db "Lilycove<BSP>City@"
MossdeepName:        db "Mossdeep<BSP>City@"
SootopolisName:      db "Sootopolis<BSP>City@"
PacifidlogName:      db "Pacifidlog<BSP>City@"
EvergrandeName:      db "Evergrande<BSP>City@"
PetalburgWoodsName:  db "Petalburg<BSP>Woods@"
RusturfTunnelName:   db "Rusturf<BSP>Tunnel@"
GraniteCaveName:     db "Granite<BSP>Cave@"
NewMauvilleName:     db "New Mauville@"
LavaridgeDesertName: db "Lavaridge<BSP>Desert@"
FieryPathName:       db "Fiery Path"
MeteorFallsName:     db "Meteor Falls@"
MtPyreName:          db "MT. Pyre@"
Route1Name:          db "Route 1@"
Route2Name:          db "Route 2@"
Route3Name:          db "Route 3@"
Route4Name:          db "Route 4@"
Route5Name:          db "Route 5@"
Route6Name:          db "Route 6@"
Route7Name:          db "Route 7@"
Route8Name:          db "Route 8@"
Route9Name:          db "Route 9@"
Route10Name:         db "Route 10@"
Route11Name:         db "Route 11@"
Route12Name:         db "Route 12@"
Route13Name:         db "Route 13@"
Route14Name:         db "Route 14@"
Route15Name:         db "Route 15@"
Route16Name:         db "Route 16@"
Route17Name:         db "Route 17@"
Route18Name:         db "Route 18@"
Route19Name:         db "Route 19@"
Route20Name:         db "Route 20@"
Route21Name:         db "Route 21@"
Route22Name:         db "Route 22@"
Route23Name:         db "Route 23@"
Route24Name:         db "Route 24@"
Route25Name:         db "Route 25@"
Route26Name:         db "Route 26@"
Route27Name:         db "Route 27@"
Route28Name:         db "Route 28@"
Route29Name:         db "Route 29@"
Route30Name:         db "Route 30@"
Route31Name:         db "Route 31@"
Route32Name:         db "Route 32@"
Route33Name:         db "Route 33@"
Route34Name:         db "Route 34@"
Route35Name:         db "Route 35@"
Route36Name:         db "Route 36@"
Route37Name:         db "Route 37@"
Route38Name:         db "Route 38@"
Route39Name:         db "Route 39@"
Route40Name:         db "Route 40@"
Route41Name:         db "Route 41@"
Route42Name:         db "Route 42@"
Route43Name:         db "Route 43@"
Route44Name:         db "Route 44@"
Route45Name:         db "Route 45@"
Route46Name:         db "Route 46@"
Route101Name:        db "Route 101@"
Route102Name:        db "Route 102@"
Route103Name:        db "Route 103@"
Route104Name:        db "Route 104@"
Route105Name:        db "Route 105@"
Route108Name:        db "Route 108@"
Route109Name:        db "Route 109@"
Route110Name:        db "Route 110@"
Route111Name:        db "Route 111@"
Route112Name:        db "Route 112@"
Route113Name:        db "Route 113@"
Route114Name:        db "Route 114@"
Route115Name:        db "Route 115@"
Route116Name:        db "Route 116@"
Route117Name:        db "Route 117@"
Route118Name:        db "Route 118@"
Route119Name:        db "Route 119@"
Route120Name:        db "Route 120@"
Route121Name:        db "Route 121@"
Route122Name:        db "Route 122@"
Route123Name:        db "Route 123@"
DarkCaveName:        db "Dark Cave@"
IlexForestName:      db "Ilex<BSP>Forest@"
BurnedTowerName:     db "Burned<BSP>Tower@"
FastShipName:        db "Fast Ship@"
DiglettsCaveName:    db "Diglett's<BSP>Cave@"
TohjoFallsName:      db "Tohjo Falls@"
UndergroundName:     db "Underground@"
BattleTowerName:     db "Battle<BSP>Tower@"
SpecialMapName:      db "Special@"

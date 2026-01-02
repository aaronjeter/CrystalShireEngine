include "data/abilities/ability_lookup.asm"

;Mons with enter the battlefield effect abilities

DrizzleMons::
	dw POLITOED
	dw PELIPPER
	dw LUVDISC
	dw KYOGRE
	dw -1

DroughtMons::
	dw NINETALES
	dw MOLTRES
	dw SUNFLORA
	dw TORKOAL
	dw GROUDON	
	dw -1

SandStreamMons::
	dw RHYDON
	dw RHYPERIOR
	dw DUNSPARCE
	dw TYRANITAR
	dw TYRANITARX
	dw REGIROCK
	dw -1

SnowWarningMons::
	dw LAPRAS
	dw ARTICUNO
	dw DELIBIRD
	dw REGICE
	dw ANINETALES
	dw -1

IntimidateMons::
	dw ARBOK
	dw ARCANINE
	dw TAUROS
	dw GYARADOS
	dw GYARADOSX
	dw GRANBULL
	dw MIGHTYENA
	dw MASQUERAIN
	dw MAWILE
	dw MANECTRIC
	dw SALAMENCE
	dw SALAMENCEX
	dw TAUROS2
	dw CYNDAQUIL2
	dw QUILAVA2
	dw TYPHLOSION2
	dw -1

MystifyMons::
	dw CLEFABLE
	dw WIGGLYTUFF
	dw DRAGONITE
	dw DRAGONITEX
	dw DRAGONITEY
	dw NOCTOWL
	dw SLOWKING
	dw MISDREAVUS
	dw MISMAGIUS
	dw UNOWN
	dw SABLEYE
	dw CHIMECHO
	dw CHIMECHOX
	dw MILOTIC
	dw NOCTOWL2
	dw NINETALES2
	dw -1

SnareMons::
	dw VICTREEBEL
	dw VICTREEBELX
	dw TENTACRUEL
	dw TANGELA
	dw ARIADOS
	dw CRADILY
	dw TANGROWTH	
	dw TENTACRUEL2
	dw YANMA2
	dw -1

HasteMons::
	dw PONYTA
	dw RAPIDASH
	dw RAPIDASH2
	dw DODRIO	
	dw TORCHIC
	dw COMBUSKEN
	dw BLAZIKEN
	dw NINJASK
	dw SUNBOU
	dw IKARI
	dw -1

AimMons::
	dw PIDGEY
	dw PIDGEOTTO
	dw PIDGEOT
	dw MAGNEMITE
	dw MAGNETON
	dw MAGNEZONE
	dw ELECTABUZZ
	dw ELECTIVIRE
	dw MAGMAR
	dw MAGMORTAR
	dw AGEODUDE
	dw AGRAVELER
	dw AGOLEM
	dw -1

FocusMons::
	dw SPEAROW
	dw FEAROW
	dw MACHOP
	dw MACHOKE
	dw MACHAMP
	dw -1

VeiledMons::
	dw LUGIA
	dw TOGEPI
	dw TOGETIC
	dw TOGEKISS
	dw GARDEVOIR
	dw HANAMOLE
	dw HANEEI
	dw -1

InvisibleWallMons::
	dw MR__MIME
	dw JYNX
	dw -1

ImpostorMons::
	dw DITTO
	dw -1

DebrisMons::
	dw SUDOWOODO
	dw PINECO
	dw FORRETRESS
	dw QWILFISH
	dw SKARMORY
	dw SKARMORY2
	dw -1

LeechMons::
	dw PARAS
	dw PARASECT
	dw HOPPIP
	dw SKIPLOOM
	dw JUMPLUFF
	dw -1

;Levitate/Waterproof mons ----------------------------------------------

LevitateMons::	
	dw GASTLY
	dw HAUNTER
	dw GENGAR
	dw GENGARX
	dw KOFFING
	dw WEEZING
	dw VIBRAVA
	dw FLYGON
	dw LUNATONE
	dw SOLROCK
	dw BALTOY
	dw CLAYDOL
	dw DUSKULL
	dw DUSCLOPS
	dw ARAICHU
	dw FLYGONX
	dw -1

WaterproofMons::
	dw WOOPER
	dw QUAGSIRE
	dw SLUGMA
	dw MAGCARGO
	dw NUMEL
	dw CAMERUPT
	dw BARBOACH
	dw WHISCASH
	dw CAMERUPTX
	dw -1

;Damage Boosting Ability Mons ----------------------------------------------

ElementalFistMons::
	dw MANKEY
	dw PRIMEAPE
	dw KADABRA
	dw ALAKAZAM
	dw ALAKAZAMX
	dw HITMONCHAN
	dw LEDYBA
	dw LEDIAN
	dw BRELOOM
	dw MEDICHAM
	dw ANNIHILAPE
	dw -1

ElementalFangMons::
	dw RATTATA
	dw RATICATE
	dw TOTODILE
	dw CROCONAW
	dw FERALIGATR
	dw FURRET
	dw LINOONE
	dw CARVANHA
	dw SHARPEDO
	dw HUNTAIL
	dw EXEGGUTOR2
	dw FURRET2
	dw TOTODILE2 
	dw CROCONAW2 
	dw FERALIGATR2
	dw KOTORA
	dw RAITORA
	dw -1

ElementalBladeMons::	
	dw PERSIAN
	dw FARFETCH_D
	dw SCYTHER
	dw SCIZOR
	dw KABUTOPS
	dw SNEASEL
	dw TREECKO
	dw GROVYLE
	dw SCEPTILE
	dw ABSOL
	dw ABSOLX
	dw GALLADE
	dw WEAVILE
	dw KLEAVOR
	dw SCYTHER2
	dw SCIZOR2
	dw SCIZORX
	dw -1

StabilityMons::
	dw PICHU
	dw PIKACHU
	dw RAICHU
	dw LICKITUNG
	dw LICKILICKY
	dw EEVEE
	dw VAPOREON
	dw JOLTEON
	dw FLAREON
	dw PORYGON
	dw ESPEON
	dw UMBREON
	dw SYLVEON
	dw LEAFEON
	dw GLACEON
	dw CHIKORITA
	dw BAYLEEF
	dw MEGANIUM
	dw CYNDAQUIL
	dw QUILAVA
	dw TYPHLOSION
	dw HITMONTOP
	dw PORYGON2
	dw PORYGONZ
	dw KURUSU
	dw AKUA
	dw AKUERIA
	dw ASHIBOMB
	dw -1

;Healing Ability Mons ----------------------------------------------

RegenerationMons:
	dw GRIMER
	dw MUK
	dw AGRIMER
	dw AMUK
	dw STARYU
	dw STARMIE
	dw CHANSEY
	dw BLISSEY
	dw SWALOT
	dw SWALOTX
	dw -1

RainDishMons::
	dw SQUIRTLE
	dw WARTORTLE
	dw BLASTOISE
	dw BLASTOISEX
	dw SLOWBRO
	dw SLOWBROX
	dw LOTAD
	dw LOMBRE
	dw LUDICOLO
	dw -1

SunbaskMons::
	dw BULBASAUR
	dw IVYSAUR
	dw VENUSAUR
	dw VENUSAURX
	dw CHARMANDER
	dw CHARMELEON 
	dw CHARIZARD
	dw CHARIZARDX
	dw TROPIUS
	dw TROPIUSX
	dw HONOBEA
	dw BORUBEA
	dw DYNABEA
	dw -1

SandBodyMons::
	dw GEODUDE
	dw GRAVELER
	dw GOLEM
	dw SANDSHREW
	dw SANDSLASH
	dw MAROWAK
	dw GLIGAR
	dw GLISCOR
	dw STEELIX
	dw STEELIXX
	dw -1

IceBodyMons::
	dw SEEL
	dw DEWGONG
	dw SPHEAL
	dw SEALEO
	dw WALREIN
	dw SNORUNT
	dw GLALIE
	dw GLALIEX
	dw FROSLASS
	dw ASANDSHREW
	dw ASANDSLASH
	dw -1

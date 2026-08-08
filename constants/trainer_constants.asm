DEF __trainer_class__ = 0

MACRO trainerclass
	DEF \1 EQU __trainer_class__
	DEF __trainer_class__ += 1
	const_def 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
DEF CHRIS EQU __trainer_class__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA
DEF NUM_NONTRAINER_PHONECONTACTS EQU const_value - 1

DEF KRIS EQU __trainer_class__
	trainerclass FALKNER ; 1
	const FALKNER1
	const FALKNER2
	const FALKNER3
	const WCFALKNER

	trainerclass WHITNEY ; 2
	const WHITNEY1
	const WHITNEY2
	const WHITNEY3

	trainerclass BUGSY ; 3
	const BUGSY1
	const BUGSY2
	const BUGSY3

	trainerclass MORTY ; 4
	const MORTY1
	const MORTY2
	const MORTY3

	trainerclass PRYCE ; 5
	const PRYCE1
	const PRYCE2
	const PRYCE3

	trainerclass JASMINE ; 6
	const JASMINE1
	const JASMINE2
	const JASMINE3

	trainerclass CHUCK ; 7
	const CHUCK1
	const CHUCK2
	const CHUCK3

	trainerclass CLAIR ; 8
	const CLAIR1
	const CLAIR2
	const CLAIR3

	trainerclass RIVAL1 ; 9
	const RIVAL1_1
	const RIVAL1_2
	const RIVAL1_3
	const RIVAL1_4
	const RIVAL1_5

	trainerclass POKEMON_PROF ; a
	const WC_OAK

	trainerclass WILL ; b
	const WILL1
	const WILL2

	trainerclass CAL ; c
	const CAL1 ; unused
	const CAL2
	const CAL3

	trainerclass BRUNO ; d
	const BRUNO1
	const BRUNO2

	trainerclass KAREN ; e
	const KAREN1
	const KAREN2

	trainerclass KOGA ; f
	const KOGA1
	const KOGA2

	trainerclass CHAMPION ; 10
	const LANCE
	const LANCE2
	const LANCE3

	trainerclass BROCK ; 11
	const BROCK1
	const BROCK2
	const BROCK3

	trainerclass MISTY ; 12
	const MISTY1
	const MISTY2
	const MISTY3

	trainerclass LT_SURGE ; 13
	const LT_SURGE1
	const LT_SURGE2
	const LT_SURGE3

	trainerclass SCIENTIST ; 14
	const ROSS
	const MITCH
	const JED
	const MARC
	const RICH
	const MAUVILLE_ADAM
	const MAUVILLE_JAMES
	const MAUVILLE_JEFFREY
	const MAUVILLE_BRUCE

	trainerclass ERIKA ; 15
	const ERIKA1
	const ERIKA2
	const ERIKA3

	trainerclass YOUNGSTER ; 16
	const JOEY
	const MIKEY
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const WARREN
	const JIMMY
	const OWEN
	const JASON
	const RONALD1
	const RONALD2
	const RONALD3
	const RUSTBORO_JOSH
	const RUSTBORO_TOMMY
	const ROUTE102_CALVIN
	const ROUTE102_ALLEN
	const ROUTE104_BILLY	
	const ROUTE116_JOEY
	const ROUTE116_JOHNSON
	const ROUTE110_TIMMY
	const MOON_JOSH	
	const ROUTE113_LAO
	const ROUTE113_DILLON

	trainerclass SCHOOLBOY ; 17
	const JACK
	const KIPP
	const ALAN1
	const JOHNNY
	const DANNY
	const TOMMY
	const DUDLEY
	const JOE
	const BILLY
	const CHAD1
	const NATE
	const RICKY
	const MAUVILLE_BEN
	const ROUTE118_DALE

	trainerclass BIRD_KEEPER ; 18
	const ROD
	const ABE
	const BRYAN
	const THEO
	const TOBY
	const DENIS
	const VANCE
	const HANK
	const ROY
	const BORIS
	const BOB
	const JOSE
	const PETER
	const PERRY
	const BRET
	const ROUTE105_JOSUE
	const FORTREE_HUMBERT
	const FORTREE_JARED
	const FORTREE_EDWARDO
	const FORTREE_DARIUS
	const ROUTE118_CHESTER
	const ROUTE118_PERRY
	const ROUTE113_COBY
	const ROUTE119_PHIL
	const ROUTE119_HUGH
	const ROUTE120_ROBERT
	const ROUTE120_COLIN

	trainerclass LASS ; 19
	const CARRIE
	const BRIDGET
	const ALICE
	const KRISE
	const CONNIE1
	const LINDA
	const LAURA
	const SHANNON
	const MICHELLE
	const DANA1
	const ELLEN
	const MAUVILLE_VIVIAN
	const ROUTE102_TIANA
	const ROUTE104_HALEY
	const ROUTE116_KAREN
	const ROUTE116_JANICE
	const MOON_IRIS
	const MOON_MIRIAM
	const ROUTE118_SALLY
	const ROUTE118_ANNIE
	const SOOTOPOLIS_ANDREA
	const SOOTOPOLIS_CRISSY

	trainerclass JANINE ; 1a
	const JANINE1
	const JANINE2
	const JANINE3

	trainerclass COOLTRAINERM ; 1b
	const NICK
	const AARON
	const PAUL
	const CODY
	const MIKE
	const GAVEN
	const RYAN
	const JAKE
	const BLAKE
	const BRIAN
	const ERICK_UNUSED ; unused
	const ANDY_UNUSED ; unused
	const TYLER_UNUSED ; unused
	const SEAN
	const KEVIN
	const STEVE_UNUSED ; unused
	const ALLEN
	const DARIN
	const PETALBURG_RANDALL
	const PETALBURG_PARKER
	const PETALBURG_GEORGE
	const LAVARIDGE_GERALD
	const DALORIC1
	const DALORIC2
	const CONTEST_CRYSTAL1
	const CONTEST_CRYSTAL2
	const ROUTE120_LEONEL
	const ASHEN_GAUNTLET1
	const WEEKDAY_WESLEY
	const WEEKDAY_ARTHUR
	const WEEKDAY_SANTOS
	const EVERGRANDE_DUNGEON_M1
	const EVERGRANDE_DUNGEON_M2
	const EVERGRANDE_DUNGEON_M3
	const EVERGRANDE_DUNGEON_M4
	const EVERGRANDE_DUNGEON_M5
	const EVERGRANDE_DUNGEON_M6
	const EVERGRANDE_DUNGEON_M7
	const EVERGRANDE_DUNGEON_M8
	const EVERGRANDE_DUNGEON_M9

	trainerclass COOLTRAINERF ; 1c
	const GWEN
	const LOIS
	const FRAN
	const LOLA
	const KATE
	const IRENE
	const KELLY
	const JOYCE
	const BETH
	const REENA
	const MEGAN
	const CAROL
	const QUINN
	const EMMA
	const CYBIL
	const JENN
	const CARA
	const MARINA1
	const MARINA2
	const MARINA3
	const PETALBURG_MARY
	const PETALBURG_LORI
	const PETALBURG_JODY
	const ROUTE120_JENNIFER
	const WEEKDAY_MONICA
	const WEEKDAY_TUSCANY
	const WEEKDAY_FRIEDA
	const EVERGRANDE_DUNGEON_F1
	const EVERGRANDE_DUNGEON_F2
	const EVERGRANDE_DUNGEON_F3
	const EVERGRANDE_DUNGEON_F4
	const EVERGRANDE_DUNGEON_F5
	const EVERGRANDE_DUNGEON_F6
	const EVERGRANDE_DUNGEON_F7
	const EVERGRANDE_DUNGEON_F8
	const EVERGRANDE_DUNGEON_F9

	trainerclass BEAUTY ; 1d
	const VICTORIA
	const SAMANTHA
	const CASSIE
	const JESSICA_UNUSED ; unused
	const RACHAEL_UNUSED ; unused
	const ANGELICA_UNUSED ; unused
	const KENDRA_UNUSED ; unused
	const VERONICA_UNUSED ; unused
	const JULIA
	const THERESA_UNUSED ; unused
	const VALERIE
	const OLIVIA
	const ROUTE103_DAISY
	const ROUTE104_CINDY
	const ROUTE109_HAILEY
	const ROUTE109_LOLA
	const ROUTE112_SHAYLA
	const ROUTE120_CLARISSA
	const ROUTE120_ANGELICA
	const SOOTOPOLIS_CONNIE
	const SOOTOPOLIS_TIFFANY
	const SOOTOPOLIS_OLIVIA
	const SOOTOPOLIS_BRIDGET

	trainerclass POKEMANIAC ; 1e
	const LARRY
	const ANDREW
	const CALVIN
	const SHANE
	const BEN
	const BRENT1
	const RON
	const ETHAN
	const ISSAC
	const DONALD
	const ZACH
	const MILLER
	const ROUTE113_WYATT
	const ROUTE114_STEVE
	const ROUTE119_DONALD
	const ROUTE119_TAYLOR
	const ROUTE119_BRENT
	const ROUTE120_JEFFREY

	trainerclass GRUNTM ; 1f
	const GRUNTM_EASY
	const GRUNTM_MEDIUM
	const GRUNTM_HARD
	const GRUNTM_4
	const GRUNTM_5
	const GRUNTM_6
	const GRUNTM_7
	const GRUNTM_8
	const GRUNTM_9
	const GRUNTM_10
	const GRUNTM_11
	const GRUNTM_12_UNUSED; unused
	const GRUNTM_13
	const GRUNTM_14
	const GRUNTM_15
	const GRUNTM_16
	const GRUNTM_17
	const GRUNTM_18
	const GRUNTM_19
	const GRUNTM_20
	const GRUNTM_21
	const GRUNTM_22_UNUSED ; unused
	const GRUNTM_23_UNUSED ; unused
	const GRUNTM_24
	const GRUNTM_25
	const GRUNTM_26_UNUSED ; unused
	const GRUNTM_27_UNUSED ; unused
	const GRUNTM_28
	const GRUNTM_29
	const GRUNTM_30_UNUSED ; unused
	const GRUNTM_31
	const MOON_GRUNT1
	const MOON_GRUNT2
	const MOON_GRUNT3
	const MOON_GRUNT4
	const SAFARI_GRUNT1
	const SAFARI_GRUNT2
	const SAFARI_GRUNT3
	const SAFARI_GRUNT4
	const SAFARI_GRUNT5
	const SAFARI_GRUNT6
	const SAFARI_GRUNT7
	const RUSTTURF_GRUNT1
	const RUSTTURF_GRUNT2
	const MAUVILLE_GRUNT1
	const MAUVILLE_GRUNT2
	const MAUVILLE_GRUNT3
	const MAUVILLE_GRUNT4
	const ROUTE121_GRUNT1
	const ROUTE121_GRUNT2
	const PYRE_GRUNT1
	const PYRE_GRUNT2
	const PYRE_GRUNT3
	const PYRE_GRUNT4

	trainerclass GENTLEMAN ; 20
	const PRESTON
	const EDWARD
	const GREGORY
	const VIRGIL_UNUSED ; unused
	const ALFRED
	const MOSSDEEP_CLIFF
	const MOSSDEEP_NATE

	trainerclass SKIER ; 21
	const ROXANNE
	const CLARISSA

	trainerclass TEACHER ; 22
	const COLETTE
	const HILLARY
	const SHIRLEY
	const JESS1
	const JESS2
	const KLUTCH1
	const KLUTCH2
	const KLUTCH3
	const SOOTOPOLIS_DAPHNE
	const SOOTOPOLIS_BRIANNA

	trainerclass SABRINA ; 23
	const SABRINA1
	const SABRINA2
	const SABRINA3

	trainerclass BUG_CATCHER ; 24
	const DON
	const ROB
	const ED
	const WADE
	const BUG_CATCHER_BENNY
	const AL
	const JOSH
	const ARNIE
	const KEN
	const DOUG
	const WAYNE
	const MAUVILLE_ANGELO
	const ROUTE102_RICK
	const PETALBURGWOODS_LYLE
	const PETALBURGWOODS_JAMES
	const ROUTE116_JOSE
	const ROUTE117_DEREK
	const MOON_KENT
	const MOON_ROBBY
	const ROUTE119_KENT
	const ROUTE119_GREG
	const ROUTE119_DOUG

	trainerclass FISHER ; 25
	const JUSTIN
	const RALPH
	const ARNOLD
	const KYLE
	const HENRY
	const MARVIN
	const TULLY
	const ANDRE
	const RAYMOND
	const WILTON
	const EDGAR
	const JONAH
	const MARTIN
	const STEPHEN
	const BARNEY
	const SCOTT
	const ROUTE103_ANDREW
	const ROUTE104_DARIAN
	const ROUTE104_IVAN
	const ROUTE105_NED
	const ROUTE105_ELLIOT
	const ROUTE110_DALE
	const ROUTE118_BARNY
	const ROUTE114_NOLAN
	const ROUTE114_KAI
	const ROUTE114_CLAUDE
	const ROUTE119_CHRIS

	trainerclass SWIMMERM ; 26
	const HAROLD
	const SIMON
	const RANDALL
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const HAL_UNUSED ; unused
	const PATON_UNUSED ; unused
	const DARYL_UNUSED ; unused
	const WALTER_UNUSED ; unused
	const TONY_UNUSED ; unused
	const JEROME
	const TUCKER
	const RICK ; unused
	const CAMERON
	const SETH
	const JAMES_UNUSED ; unused
	const LEWIS_UNUSED ; unused
	const PARKER
	const ROUTE105_LUIS
	const ROUTE108_TONY
	const ROUTE108_DARRIN

	trainerclass SWIMMERF ; 27
	const ELAINE
	const PAULA
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const LISA_UNUSED ; unused
	const JILL_UNUSED ; unused
	const MARY_UNUSED ; unused
	const KATIE_UNUSED ; unused
	const DAWN
	const TARA_UNUSED ; unused
	const NICOLE
	const LORI
	const JODY_UNUSED ; unused
	const NIKKI
	const DIANA
	const BRIANA
	const ROUTE105_IMANI
	const ROUTE108_DENISE
	const ROUTE108_BETH

	trainerclass SAILOR ; 28
	const EUGENE
	const HUEY
	const TERRELL
	const KENT
	const ERNEST
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY
	const HARRY
	const DEWFORD_BRENDEN
	const ROUTE109_HUEY
	const ROUTE109_EDMOND
	const ROUTE109_RICKY
	const ROUTE109_CHANDLER

	trainerclass SUPER_NERD ; 29
	const STAN
	const ERIC
	const GREGG_UNUSED ; unused
	const JAY_UNUSED ; unused
	const DAVE_UNUSED ; unused
	const SAM
	const TOM
	const PAT
	const SHAWN
	const TERU
	const RUSS_UNUSED ; unused
	const NORTON_UNUSED ; unused
	const HUGH
	const MARKUS
	const MOON_JOVAN
	const MOON_MIGUEL

	trainerclass RIVAL2 ; 2a
	const RIVAL2_WC

	trainerclass GUITARIST ; 2b
	const CLYDE
	const VINCENT
	const MAUVILLE_KIRK
	const MAUVILLE_SHAWN
	const ROUTE103_MARCOS
	const ROUTE110_JOSEPH
	const ROUTE119_FABIAN

	trainerclass HIKER ; 2c
	const ANTHONY
	const RUSSELL
	const PHILLIP
	const LEONARD
	const BENJAMIN
	const ERIK
	const MICHAEL
	const PARRY
	const TIMOTHY
	const BAILEY
	const TIM
	const NOLAND
	const SIDNEY
	const KENNY
	const JIM
	const DANIEL
	const RUSTBORO_MARC
	const ROUTE116_CLARK
	const ROUTE116_DEVAN
	const LAVARIDGE_ELI
	const MOON_MARCOS	
	const ROUTE112_TRENT
	const ROUTE112_BRICE
	const ROUTE114_LUCAS
	const ROUTE114_LENNY

	trainerclass BIKER ; 2d
	const BIKER_BENNY_UNUSED ; unused
	const KAZU_UNUSED ; unused
	const DWAYNE
	const HARRIS
	const ZEKE
	const CHARLES
	const RILEY
	const JOEL
	const GLENN

	trainerclass BLAINE ; 2e
	const BLAINE1
	const BLAINE2
	const BLAINE3

	trainerclass BURGLAR ; 2f
	const DUNCAN
	const EDDIE
	const COREY

	trainerclass FIREBREATHER ; 30
	const OTIS
	const DICK_UNUSED ; unused
	const NED_UNUSED ; unused
	const BURT
	const BILL
	const WALT
	const RAY
	const LYLE
	const LAVARIDGE_JEFF
	const LAVARIDGE_JACE
	const LAVARIDGE_COLE
	const LAVARIDGE_AXLE
	const LAVARIDGE_KEEGAN
	const ROUTE111_HAYDEN
	const ROUTE112_BRYANT
	const ROUTE114_BERNIE
	const ROUTE119_DAYTON

	trainerclass JUGGLER ; 31
	const IRWIN
	const FRITZ
	const HORTON

	trainerclass BLACKBELT_T ; 32
	const KENJI
	const YOSHI
	const LAO
	const NOB
	const KIYO
	const LUNG
	const WAI
	const DEWFORD_TAKAO
	const DEWFORD_CRISTIAN
	const ROUTE103_RHETT

	trainerclass EXECUTIVEM ; 33
	const EXECUTIVEM_1
	const EXECUTIVEM_2
	const EXECUTIVEM_3
	const EXECUTIVEM_4
	const EXECUTIVEM_5

	trainerclass PSYCHIC_T ; 34
	const NATHAN
	const FRANKLIN
	const HERMAN
	const FIDEL
	const GREG
	const NORMAN
	const MARK
	const PHIL
	const RICHARD
	const GILBERT
	const JARED
	const RODNEY
	const ROUTE110_EDWARD
	const MOSSDEEP_PRESTON
	const MOSSDEEP_BLAKE
	const MOSSDEEP_NICHOLAS
	const MOSSDEEP_VIRGIL
	const FRANKLIN2
	const JARED2

	trainerclass PICNICKER ; 35
	const LIZ
	const GINA
	const BROOKE
	const KIM
	const CINDY
	const HOPE
	const SHARON
	const DEBRA
	const ERIN
	const HEIDI
	const EDNA
	const TIFFANY
	const TANYA
	const ROUTE117_MARIA
	const ROUTE117_MELINA
	const ROUTE111_CELINA
	const ROUTE111_BIANCA
	const ROUTE111_GABBY
	const ROUTE111_IRENE
	const FORTREE_ASHLEY
	const ROUTE112_CAROL
	const ROUTE113_MADELINE
	const ROUTE113_SOPHIE
	const ROUTE114_CHARLOTTE
	const ROUTE114_NANCY
	const ROUTE114_ANGELINA
	const DESERT_HEIDI	
	const DESERT_BECKY
	const DESERT_CELIA
	

	trainerclass CAMPER ; 36
	const ROLAND
	const TODD
	const IVAN
	const ELLIOT
	const BARRY
	const LLOYD
	const DEAN
	const SID
	const HARVEY_UNUSED ; unused
	const DALE_UNUSED ; unused
	const TED
	const THOMAS_UNUSED ; unused
	const LEROY_UNUSED ; unused
	const DAVID_UNUSED ; unused
	const JOHN_UNUSED ; unused
	const JERRY
	const SPENCER
	const QUENTIN
	const ROUTE104_WINSTON
	const ROUTE117_DYLAN
	const ROUTE108_CAMRON
	const ROUTE111_TYRON
	const ROUTE111_TRAVIS
	const FORTREE_FLINT
	const ROUTE112_LARRY
	const ROUTE113_JAYLEN
	const ROUTE113_LUNG
	const ROUTE113_LAWRENCE
	const ROUTE114_SHANE
	const DESERT_BEAU
	const DESERT_DREW	
	const DESERT_BRANDEN

	trainerclass EXECUTIVEF ; 37
	const EXECUTIVEF_1
	const EXECUTIVEF_2
	const SAFARI_EXECUTIVEF
	const MAUVILLE_EXECUTIVEF
	const DESERT_JANE

	trainerclass SAGE ; 38
	const CHOW
	const NICO
	const JIN
	const TROY
	const JEFFREY
	const PING
	const EDMOND
	const NEAL
	const LI
	const GAKU
	const MASA
	const KOJI

	trainerclass MEDIUM ; 39
	const MARTHA
	const GRACE
	const BETHANY_UNUSED ; unused
	const MARGRET_UNUSED ; unused
	const ETHEL_UNUSED ; unused
	const REBECCA
	const DORIS
	const ROUTE117_BRANDI
	const REBECCA2
	const DORIS2

	trainerclass BOARDER ; 3a
	const RONALD
	const BRAD
	const DOUGLAS

	trainerclass POKEFANM ; 3b
	const WILLIAM
	const DEREK
	const ROBERT
	const JOSHUA
	const CARTER
	const TREVOR
	const BRANDON
	const JEREMY
	const COLIN
	const ALEX
	const REX
	const ALLAN
	const ROUTE103_MIGUEL
	const ROUTE117_ISAAC
	const ROUTE110_KALEB
	const ROUTE110_EDWIN

	trainerclass KIMONO_GIRL ; 3c
	const NAOKO_UNUSED ; unused
	const NAOKO
	const SAYO
	const ZUKI
	const KUNI
	const MIKI

	trainerclass TWINS ; 3d
	const AMYANDMAY1
	const ANNANDANNE1
	const ANNANDANNE2_UNUSED
	const AMYANDMAY2_UNUSED
	const JOANDZOE1
	const JOANDZOE2_UNUSED
	const MEGANDPEG1
	const MEGANDPEG2_UNUSED
	const LEAANDPIA1
	const LEAANDPIA2 ; unused
	const ROUTE103_AMYLIV
	const ROUTE104_GINAMIA
	const ROUTE117_ANNAMEG
	const ROUTE108_LISARIA
	const ROUTE113_TORITIA

	trainerclass POKEFANF ; 3e
	const BEVERLY
	const RUTH
	const GEORGIA
	const JAIME
	const ROUTE117_LYDIA
	const ROUTE110_ISABEL
	const SOOTOPOLIS_ANNIKA
	const SOOTOPOLIS_BETHANY

	trainerclass RED ; 3f
	const RED1

	trainerclass BLUE ; 40
	const BLUE1
	const BLUE2
	const BLUE3

	trainerclass OFFICER ; 41
	const KEITH
	const DIRK

	trainerclass GRUNTF ; 42
	const GRUNTF_1
	const GRUNTF_2
	const GRUNTF_3
	const GRUNTF_4
	const GRUNTF_5
	const AMAYA1
	const AMAYA2
	const AMAYA3
	const SAFARI_GRUNTF1
	const SAFARI_GRUNTF2
	const SAFARI_GRUNTF3
	const SAFARI_GRUNTF4
	const SAFARI_GRUNTF5
	const RUSTTURF_GRUNTF1
	const MAUVILLE_GRUNTF1
	const MAUVILLE_GRUNTF2
	const MAUVILLE_GRUNTF3
	const ROUTE121_GRUNTF1
	const ROUTE121_GRUNTF2
	const PYRE_GRUNTF1
	const PYRE_GRUNTF2
	const PYRE_GRUNTF3
	const PYRE_GRUNTF4

	trainerclass MYSTICALMAN ; 43
	const EUSINE

	trainerclass LINK_KRIS ; 44
	const LINK_KRIS1

	trainerclass LEADERROXANNE 
	const ROXANNE1
	const ROXANNE2
	const ROXANNE3

	trainerclass BRAWLY
	const BRAWLY1
	const BRAWLY2
	const BRAWLY3

	trainerclass WATTSON
	const WATTSON1
	const WATTSON2
	const WATTSON3

	trainerclass FLANNERY
	const FLANNERY1
	const FLANNERY2
	const FLANNERY3

	trainerclass LEADERNORMAN
	const NORMAN1
	const NORMAN2
	const NORMAN3

	trainerclass WINONA
	const WINONA1
	const WINONA2
	const WINONA3

	trainerclass TATELIZA
	const TATELIZA1
	const TATELIZA2
	const TATELIZA3

	trainerclass WALLACE
	const WALLACE1
	const WALLACE2

	trainerclass ELITESIDNEY
	const SIDNEY1
	const SIDNEY2

	trainerclass PHOEBE
	const PHOEBE1
	const PHOEBE2

	trainerclass GLACIA
	const GLACIA1
	const GLACIA2

	trainerclass DRAKE
	const DRAKE1
	const DRAKE2

	trainerclass STEVEN
	const STEVEN1
	const STEVEN2
	const STEVEN3

	trainerclass BATTLE_GIRL
	const DEWFORD_LAURA
	const DEWFORD_LILITH
	const DEWFORD_JOCELYN
	const LAVARIDGE_DANIELLE
	const ROUTE117_AISHA
	const ROUTE120_CALLIE

	trainerclass RANGERM
	const RANGERM1
	const AARON1
	const AARON2
	const AARON3
	const SAFARI_ELI
	const SAFARI_RANDAL
	const SAFARI_STEVEN
	const ROUTE119_JACKSON
	const ROUTE119_TAKASHI
	const ROUTE119_YASU
	const ROUTE119_HIDEO
	const ROUTE120_RILEY
	const ROUTE120_LORENZO
	const ROUTE120_KEIGO
	const TREETOP_TRIAL1

	trainerclass RANGERF
	const RANGERF1
	const SAFARI_MONICA
	const SAFARI_TINA
	const SAFARI_RACHAEL
	const ROUTE119_CATHERINE
	const ROUTE119_RACHEL
	const ROUTE119_DANI
	const ROUTE120_JENNA

	trainerclass EXPLORER
	const ROUTE105_FOSTER
	const ROUTE105_ANDRES
	const SAFARI_JOEY
	const SAFARI_ROSS
	const SAFARI_CHANDLER
	const RANDOM_TEST
	const DESERT_DUSTY	
	const DESERT_BRYAN
	const ROUTE120_CHIP
	const ROUTE120_DALE

	trainerclass PSYCHIC_F
	const MOSSDEEP_MAURA
	const MOSSDEEP_SAMANTHA
	const MOSSDEEP_MACEY
	const MOSSDEEP_KATHLEEN
	const MOSSDEEP_SYLVIA
	const MOSSDEEP_HANNAH

	trainerclass AGATHA
	const AGATHA1

	trainerclass LORELEI
	const LORELEI1

	trainerclass FERGUS
	const FERGUS1

	trainerclass NEESHA
	const NEESHA1

	trainerclass LILY
	const LILY1

	trainerclass GUY
	const GUY1

	trainerclass GIOVANNI
	const WC_GIOVANNI

	trainerclass WALLY
	const WALLY1
	const WALLY2
	const WALLY3
	const WALLY4
	const WALLY5
	const WALLY6
	const WC_WALLY

DEF NUM_TRAINER_CLASSES EQU __trainer_class__ - 1

const_def
const PSYCHIC_EASY
const PSYCHIC_MEDIUM
const PSYCHIC_HARD
const TRIAL_EASY
const ROCKET_EASY
const ROCKET_MEDIUM
const ROCKET_HARD

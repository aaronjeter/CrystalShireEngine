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
	const RIVAL1_1_CHIKORITA
	const RIVAL1_1_CYNDAQUIL
	const RIVAL1_1_TOTODILE
	const RIVAL1_2_CHIKORITA
	const RIVAL1_2_CYNDAQUIL
	const RIVAL1_2_TOTODILE
	const RIVAL1_3_CHIKORITA
	const RIVAL1_3_CYNDAQUIL
	const RIVAL1_3_TOTODILE
	const RIVAL1_4_CHIKORITA
	const RIVAL1_4_CYNDAQUIL
	const RIVAL1_4_TOTODILE
	const RIVAL1_5_CHIKORITA
	const RIVAL1_5_CYNDAQUIL
	const RIVAL1_5_TOTODILE

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
	const JOEY1
	const MIKEY
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const JOEY2
	const JOEY3
	const WARREN
	const JIMMY
	const OWEN
	const JASON
	const JOEY4
	const JOEY5
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
	const VANCE1
	const HANK
	const ROY
	const BORIS
	const BOB
	const JOSE1
	const PETER
	const JOSE2
	const PERRY
	const BRET
	const JOSE3
	const VANCE2
	const VANCE3
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
	const GAVEN3
	const RYAN
	const JAKE
	const BLAKE
	const BRIAN
	const ERICK ; unused
	const ANDY ; unused
	const TYLER ; unused
	const SEAN
	const KEVIN
	const STEVE ; unused
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

	trainerclass COOLTRAINERF ; 1c
	const GWEN
	const LOIS
	const FRAN
	const LOLA
	const KATE
	const IRENE
	const KELLY
	const JOYCE
	const BETH1
	const REENA1
	const MEGAN
	const BETH2
	const CAROL
	const QUINN
	const EMMA
	const CYBIL
	const JENN
	const BETH3
	const REENA2
	const REENA3
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

	trainerclass BEAUTY ; 1d
	const VICTORIA
	const SAMANTHA
	const CASSIE
	const JESSICA ; unused
	const RACHAEL ; unused
	const ANGELICA ; unused
	const KENDRA ; unused
	const VERONICA ; unused
	const JULIA
	const THERESA ; unused
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
	const GRUNTM_1
	const GRUNTM_2
	const GRUNTM_3
	const GRUNTM_4
	const GRUNTM_5
	const GRUNTM_6
	const GRUNTM_7
	const GRUNTM_8
	const GRUNTM_9
	const GRUNTM_10
	const GRUNTM_11
	const GRUNTM_12 ; unused
	const GRUNTM_13
	const GRUNTM_14
	const GRUNTM_15
	const GRUNTM_16
	const GRUNTM_17
	const GRUNTM_18
	const GRUNTM_19
	const GRUNTM_20
	const GRUNTM_21
	const GRUNTM_22 ; unused
	const GRUNTM_23 ; unused
	const GRUNTM_24
	const GRUNTM_25
	const GRUNTM_26 ; unused
	const GRUNTM_27 ; unused
	const GRUNTM_28
	const GRUNTM_29
	const GRUNTM_30 ; unused
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
	const VIRGIL ; unused
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
	const WADE1
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
	const RALPH1
	const ARNOLD
	const KYLE
	const HENRY
	const MARVIN
	const TULLY1
	const ANDRE
	const RAYMOND
	const WILTON1
	const EDGAR
	const JONAH
	const MARTIN
	const STEPHEN
	const BARNEY
	const WILTON2
	const SCOTT
	const WILTON3
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
	const HAL ; unused
	const PATON ; unused
	const DARYL ; unused
	const WALTER ; unused
	const TONY ; unused
	const JEROME
	const TUCKER
	const RICK ; unused
	const CAMERON
	const SETH
	const JAMES ; unused
	const LEWIS ; unused
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
	const LISA ; unused
	const JILL ; unused
	const MARY ; unused
	const KATIE ; unused
	const DAWN
	const TARA ; unused
	const NICOLE
	const LORI
	const JODY ; unused
	const NIKKI
	const DIANA
	const BRIANA
	const ROUTE105_IMANI
	const ROUTE108_DENISE
	const ROUTE108_BETH

	trainerclass SAILOR ; 28
	const EUGENE
	const HUEY1
	const TERRELL
	const KENT
	const ERNEST
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY
	const HARRY
	const HUEY2
	const HUEY3
	const HUEY4
	const DEWFORD_BRENDEN
	const ROUTE109_HUEY
	const ROUTE109_EDMOND
	const ROUTE109_RICKY
	const ROUTE109_CHANDLER

	trainerclass SUPER_NERD ; 29
	const STAN
	const ERIC
	const GREGG ; unused
	const JAY ; unused
	const DAVE ; unused
	const SAM
	const TOM
	const PAT
	const SHAWN
	const TERU
	const RUSS ; unused
	const NORTON ; unused
	const HUGH
	const MARKUS
	const MOON_JOVAN
	const MOON_MIGUEL

	trainerclass RIVAL2 ; 2a
	const RIVAL2_1_CHIKORITA
	const RIVAL2_1_CYNDAQUIL
	const RIVAL2_1_TOTODILE
	const RIVAL2_2_CHIKORITA
	const RIVAL2_2_CYNDAQUIL
	const RIVAL2_2_TOTODILE
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
	const PARRY1
	const TIMOTHY
	const BAILEY
	const TIM
	const NOLAND
	const SIDNEY
	const KENNY
	const JIM
	const DANIEL
	const PARRY2
	const PARRY3
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
	const BIKER_BENNY ; unused
	const KAZU ; unused
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
	const DICK ; unused
	const NED ; unused
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
	const KENJI1 ; unused
	const YOSHI
	const KENJI2 ; unused
	const LAO
	const NOB
	const KIYO
	const LUNG
	const KENJI3
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
	const GINA1
	const BROOKE
	const KIM
	const CINDY
	const HOPE
	const SHARON
	const DEBRA
	const GINA2
	const ERIN1
	const HEIDI
	const EDNA
	const GINA3
	const TIFFANY1
	const TIFFANY2
	const ERIN2
	const TANYA
	const TIFFANY3
	const ERIN3
	const GINA4
	const GINA5
	const TIFFANY4
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
	const TODD1
	const IVAN
	const ELLIOT
	const BARRY
	const LLOYD
	const DEAN
	const SID
	const HARVEY ; unused
	const DALE ; unused
	const TED
	const TODD2
	const TODD3
	const THOMAS ; unused
	const LEROY ; unused
	const DAVID ; unused
	const JOHN ; unused
	const JERRY
	const SPENCER
	const TODD4
	const TODD5
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
	const BETHANY ; unused
	const MARGRET ; unused
	const ETHEL ; unused
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
	const DEREK1
	const ROBERT
	const JOSHUA
	const CARTER
	const TREVOR
	const BRANDON
	const JEREMY
	const COLIN
	const DEREK2 ; unused
	const DEREK3 ; unused
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
	const ANNANDANNE2
	const AMYANDMAY2
	const JOANDZOE1
	const JOANDZOE2
	const MEGANDPEG1
	const MEGANDPEG2
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


DEF NUM_TRAINER_CLASSES EQU __trainer_class__ - 1

const_def
const PSYCHIC_EASY
const PSYCHIC_MEDIUM
const PSYCHIC_HARD
const TRIAL_EASY

; First-time travel between regions. At 4 badges the start region's professor
; calls; in the lab they hand over a parcel for each of the other two
; professors and the S.S. Ticket. The Fast Ship sails between Olivine Port,
; Vermilion Port and Slateport Harbor; its destination is
; EVENT_FAST_SHIP_DESTINATION_SLATEPORT, else EVENT_FAST_SHIP_DESTINATION_OLIVINE,
; else Vermilion.

DEF TRAVEL_CALL_BADGES EQU 4

TravelCallCheck::
; Each step: with TRAVEL_CALL_BADGES badges and no other call waiting, the start
; region's professor's call is set up (once)
	ld a, [wSpecialPhoneCallID]
	and a
	ret nz
	ld de, EVENT_TRAVEL_PROF_CALLED
	call .CheckFlag
	ret nz
	ld hl, wBadges
	ld b, 3 ; Johto, Kanto and Hoenn badges
	call CountSetBits
	cp TRAVEL_CALL_BADGES
	ret c
	ld de, EVENT_START_KANTO
	call .CheckFlag
	ld a, SPECIALCALL_TRAVEL_OAK
	jr nz, .got_call
	ld de, EVENT_START_HOENN
	call .CheckFlag
	ld a, SPECIALCALL_TRAVEL_BIRCH
	jr nz, .got_call
	ld a, SPECIALCALL_TRAVEL_ELM
.got_call
	ld [wSpecialPhoneCallID], a
	ret

.CheckFlag:
; nz if event flag de is set
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret

; The calls

ElmTravelCallerScript:
	farwritetext ElmTravelCallText
	sjump TravelCallerDone

OakTravelCallerScript:
	farwritetext OakTravelCallText
	sjump TravelCallerDone

BirchTravelCallerScript:
	farwritetext BirchTravelCallText
TravelCallerDone:
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_TRAVEL_PROF_CALLED
	end

; In the labs (farscall at the start of each professor's script): the errand
; for the start region's professor, a delivery for the others.
; wScriptVar = TRUE if the professor had something to say here.

ElmTravelScript::
	checkevent EVENT_START_KANTO
	iftrue .delivery
	checkevent EVENT_START_HOENN
	iftrue .delivery
	checkevent EVENT_TRAVEL_PROF_CALLED
	iffalse TravelNothing
	checkevent EVENT_GOT_TRAVEL_PARCELS
	iftrue TravelVsSeekerLate
	writetext ElmErrandText
	promptbutton
	verbosegiveitem OAK_PARCEL
	verbosegiveitem BIRCH_PARCEL
	scall TravelGiveTicket
	scall TravelGiveVsSeeker
	writetext ElmShipText
	sjump TravelErrandDone

.delivery
	checkitem ELM_PARCEL
	iffalse TravelNothing
	writetext TravelDeliveryText
	promptbutton
	takeitem ELM_PARCEL
	setevent EVENT_DELIVERED_ELM_PARCEL
	writetext ElmThanksText
	promptbutton
	verbosegiveitem GREAT_BALL, 5
	verbosegiveitem EXP_CANDY_M
	sjump TravelDeliveryDone

OakTravelScript::
	checkevent EVENT_START_KANTO
	iffalse .delivery
	checkevent EVENT_TRAVEL_PROF_CALLED
	iffalse TravelNothing
	checkevent EVENT_GOT_TRAVEL_PARCELS
	iftrue TravelVsSeekerLate
	writetext OakErrandText
	promptbutton
	verbosegiveitem ELM_PARCEL
	verbosegiveitem BIRCH_PARCEL
	scall TravelGiveTicket
	scall TravelGiveVsSeeker
	writetext OakShipText
	sjump TravelErrandDone

.delivery
	checkitem OAK_PARCEL
	iffalse TravelNothing
	writetext TravelDeliveryText
	promptbutton
	takeitem OAK_PARCEL
	setevent EVENT_DELIVERED_OAK_PARCEL
	writetext OakThanksText
	promptbutton
	verbosegiveitem ULTRA_BALL, 5
	verbosegiveitem EXP_CANDY_M
	sjump TravelDeliveryDone

BirchTravelScript::
	checkevent EVENT_START_HOENN
	iffalse .delivery
	checkevent EVENT_TRAVEL_PROF_CALLED
	iffalse TravelNothing
	checkevent EVENT_GOT_TRAVEL_PARCELS
	iftrue TravelVsSeekerLate
	writetext BirchErrandText
	promptbutton
	verbosegiveitem ELM_PARCEL
	verbosegiveitem OAK_PARCEL
	scall TravelGiveTicket
	scall TravelGiveVsSeeker
	writetext BirchShipText
	sjump TravelErrandDone

.delivery
	checkitem BIRCH_PARCEL
	iffalse TravelNothing
	writetext TravelDeliveryText
	promptbutton
	takeitem BIRCH_PARCEL
	setevent EVENT_DELIVERED_BIRCH_PARCEL
	writetext BirchThanksText
	promptbutton
	verbosegiveitem GREAT_BALL, 5
	verbosegiveitem SHELL_BELL
	sjump TravelDeliveryDone

TravelGiveTicket:
	checkitem S_S_TICKET
	iftrue .done
	verbosegiveitem S_S_TICKET
.done
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	end

TravelGiveVsSeeker:
	verbosegiveitem VS_SEEKER
	writetext TravelVsSeekerText
	promptbutton
	end

TravelVsSeekerLate:
; the errand is done: hand over the Vs Seeker if a save from before it has none
	checkitem VS_SEEKER
	iftrue TravelNothing
	writetext TravelVsSeekerLateText
	promptbutton
	scall TravelGiveVsSeeker
	setval TRUE
	end

TravelErrandDone:
	waitbutton
	setevent EVENT_GOT_TRAVEL_PARCELS
	; Olivine Port: the gangway is open from now on
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setval TRUE
	end

TravelDeliveryDone:
	writetext TravelDeliveryAfterText
	waitbutton
	setval TRUE
	end

TravelNothing:
	setval FALSE
	end

; The Fast Ship's destination, picked at the port (farscall after the ticket).
; wScriptVar = FALSE if the player didn't pick one.

FastShipFromOlivineScript::
	writetext FastShipWhereToText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Vermilion
	ifequal 2, .Slateport
	sjump FastShipNoDestination

.Vermilion:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	clearevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipEastboundPassengers

.Slateport:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	setevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipEastboundPassengers

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Kanto: Vermilion@"
	db "Hoenn: Slateport@"
	db "Cancel@"

FastShipFromVermilionScript::
	writetext FastShipWhereToText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Olivine
	ifequal 2, .Slateport
	sjump FastShipNoDestination

.Olivine:
	setevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	clearevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipWestboundPassengers

.Slateport:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	setevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipWestboundPassengers

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Johto: Olivine@"
	db "Hoenn: Slateport@"
	db "Cancel@"

FastShipFromSlateportScript::
	writetext FastShipWhereToText
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Olivine
	ifequal 2, .Vermilion
	sjump FastShipNoDestination

.Olivine:
	setevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	clearevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipWestboundPassengers

.Vermilion:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	clearevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	sjump FastShipEastboundPassengers

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Johto: Olivine@"
	db "Kanto: Vermilion@"
	db "Cancel@"

FastShipNoDestination:
	setval FALSE
	end

FastShipEastboundPassengers:
; After the first voyage: the eastbound passengers (Olivine's in vanilla), ready to battle again
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse FastShipPassengersDone
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
	sjump FastShipPassengersDone

FastShipWestboundPassengers:
; After the first voyage: the westbound passengers (Vermilion's in vanilla), ready to battle again
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse FastShipPassengersDone
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	clearevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_POKEMANIAC_ETHAN
	clearevent EVENT_BEAT_BURGLAR_COREY
	clearevent EVENT_BEAT_BUG_CATCHER_KEN
	clearevent EVENT_BEAT_GUITARIST_CLYDE
	clearevent EVENT_BEAT_POKEFANM_JEREMY
	clearevent EVENT_BEAT_POKEFANF_GEORGIA
	clearevent EVENT_BEAT_SAILOR_KENNETH
	clearevent EVENT_BEAT_TEACHER_SHIRLEY
	clearevent EVENT_BEAT_SCHOOLBOY_NATE
	clearevent EVENT_BEAT_SCHOOLBOY_RICKY
FastShipPassengersDone:
	setval TRUE
	end

FastShipArrivalScript::
; On the ship, when its sailor lets the player off: the first voyage is over
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	end

FastShipArrivedTextScript::
; "We have arrived in X!" for the ship's destination
	checkevent EVENT_FAST_SHIP_DESTINATION_SLATEPORT
	iftrue .Slateport
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .Olivine
	writetext FastShipArrivedVermilionText
	end

.Olivine:
	writetext FastShipArrivedOlivineText
	end

.Slateport:
	writetext FastShipArrivedSlateportText
	end

FastShipArrivedOlivineText:
	text "Fast Ship S.S.Aqua"
	line "has arrived in"
	cont "Olivine City."
	done

FastShipArrivedVermilionText:
	text "Fast Ship S.S.Aqua"
	line "has arrived in"
	cont "Vermilion City."
	done

FastShipArrivedSlateportText:
	text "Fast Ship S.S.Aqua"
	line "has arrived in"
	cont "Slateport City."
	done

FastShipWhereToText:
	text "Where would you"
	line "like to sail?"
	done

ElmErrandText:
	text "<PLAY_G>, thanks"
	line "for coming!"

	para "Four Badges"
	line "already! You've"
	cont "grown so strong."

	para "I have a favor to"
	line "ask. These parcels"

	para "are research notes"
	line "for Prof.Oak in"
	cont "Kanto and Prof."
	cont "Birch in Hoenn."

	para "Could you deliver"
	line "them for me?"
	done

ElmShipText:
	text "The Fast Ship"
	line "sails from Olivine"
	cont "Port."

	para "It goes to"
	line "Vermilion in Kanto"
	cont "and Slateport in"
	cont "Hoenn."

	para "Prof.Oak's lab is"
	line "in Pallet Town,"

	para "and Prof.Birch's"
	line "in Littleroot."

	para "Have a safe trip,"
	line "<PLAY_G>!"
	done

OakErrandText:
	text "Ah, <PLAY_G>!"
	line "Four Badges--"
	cont "splendid work!"

	para "Now, I need a"
	line "favor. These"

	para "parcels are for my"
	line "colleagues: Prof."
	cont "Elm in Johto and"
	cont "Prof.Birch in"
	cont "Hoenn."

	para "Would you take"
	line "them there?"
	done

OakShipText:
	text "The Fast Ship"
	line "sails from"
	cont "Vermilion."

	para "It goes to Olivine"
	line "in Johto and"
	cont "Slateport in"
	cont "Hoenn."

	para "Prof.Elm works in"
	line "New Bark Town,"

	para "and Prof.Birch in"
	line "Littleroot."

	para "Off you go,"
	line "<PLAY_G>!"
	done

BirchErrandText:
	text "<PLAY_G>! Four"
	line "Badges already?"

	para "Ha! I knew you had"
	line "it in you."

	para "Listen, I need a"
	line "hand. These are"

	para "field notes for"
	line "Prof.Elm in Johto"
	cont "and Prof.Oak in"
	cont "Kanto."

	para "Could you bring"
	line "them over?"
	done

BirchShipText:
	text "The Fast Ship"
	line "sails from"
	cont "Slateport."

	para "It goes to Olivine"
	line "in Johto and"
	cont "Vermilion in"
	cont "Kanto."

	para "Prof.Elm's lab is"
	line "in New Bark Town,"

	para "and Prof.Oak's in"
	line "Pallet Town."

	para "Good luck out"
	line "there, <PLAY_G>!"
	done

TravelDeliveryText:
	text "Is that a parcel"
	line "for me?"
	done

ElmThanksText:
	text "Notes from my"
	line "colleague! Thank"

	para "you for bringing"
	line "them all this way!"

	para "Here, please take"
	line "these."
	done

OakThanksText:
	text "Why, these are the"
	line "notes I've been"
	cont "waiting for!"

	para "You've come a long"
	line "way. Take these"
	cont "for your journey."
	done

BirchThanksText:
	text "From across the"
	line "sea? Fantastic!"

	para "Thanks a bunch!"
	line "Here, take these."
	done

TravelVsSeekerText:
	text "Use it near"
	line "trainers you beat,"
	cont "and they'll want a"
	cont "rematch!"

	para "It needs 100 steps"
	line "to recharge after"
	cont "each use."
	done

TravelVsSeekerLateText:
	text "Oh! I nearly"
	line "forgot to give you"
	cont "this."
	done

TravelDeliveryAfterText:
	text "Enjoy your time in"
	line "this region!"
	done

ElmTravelCallText:
	text "Hello, <PLAY_G>?"
	line "It's Prof.Elm!"

	para "Four Badges!"
	line "That's amazing!"

	para "I have a favor to"
	line "ask. Could you"
	cont "come by my lab?"
	done

OakTravelCallText:
	text "<PLAY_G>? This is"
	line "Prof.Oak!"

	para "Four Badges--well"
	line "done!"

	para "Could you stop by"
	line "my lab? I have a"
	cont "favor to ask."
	done

BirchTravelCallText:
	text "Hey, <PLAY_G>!"
	line "It's Prof.Birch!"

	para "Four Badges--nice"
	line "going!"

	para "Swing by my lab"
	line "when you can. I"
	cont "need your help!"
	done

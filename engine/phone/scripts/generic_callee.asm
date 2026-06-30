PhoneScript_Random2:
	random 2
	end

PhoneScript_Random3:
	random 3
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_Random5:
	random 5
	end

PhoneScript_Random11:
	random 11
	end

PhoneScript_AnswerPhone_Male:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Male_Day
	checktime EVE | NITE
	iftrue PhoneScript_AnswerPhone_Male_Nite
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyAnswerPhoneText
	promptbutton
	end

.Gaven:
	farwritetext GavenAnswerPhoneText
	promptbutton
	end

.Jose:
	farwritetext JoseAnswerPhoneText
	promptbutton
	end

.Joey:
	farwritetext JoeyAnswerPhoneText
	promptbutton
	end

.Wade:
	farwritetext WadeAnswerPhoneText
	promptbutton
	end

.Ralph:
	farwritetext RalphAnswerPhoneText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneText
	promptbutton
	end

.Todd:
	farwritetext ToddAnswerPhoneText
	promptbutton
	end

.Derek:
	farwritetext DerekAnswerPhoneText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneText
	promptbutton
	end

.Vance:
	farwritetext VanceAnswerPhoneText
	promptbutton
	end

.Wilton:
	farwritetext WiltonAnswerPhoneText
	promptbutton
	end

.Kenji:
	farwritetext KenjiAnswerPhoneText
	promptbutton
	end

.Parry:
	farwritetext ParryAnswerPhoneText
	promptbutton
	end

PhoneScript_AnswerPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyAnswerPhoneDayText
	promptbutton
	end

.Gaven:
	farwritetext GavenAnswerPhoneDayText
	promptbutton
	end

.Jose:
	farwritetext JoseAnswerPhoneDayText
	promptbutton
	end

.Joey:
	farwritetext JoeyAnswerPhoneDayText
	promptbutton
	end

.Wade:
	farwritetext WadeAnswerPhoneDayText
	promptbutton
	end

.Ralph:
	farwritetext RalphAnswerPhoneDayText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneDayText
	promptbutton
	end

.Todd:
	farwritetext ToddAnswerPhoneDayText
	promptbutton
	end

.Derek:
	farwritetext DerekAnswerPhoneDayText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneDayText
	promptbutton
	end

.Vance:
	farwritetext VanceAnswerPhoneDayText
	promptbutton
	end

.Wilton:
	farwritetext WiltonAnswerPhoneDayText
	promptbutton
	end

.Kenji:
	farwritetext KenjiAnswerPhoneDayText
	promptbutton
	end

.Parry:
	farwritetext ParryAnswerPhoneDayText
	promptbutton
	end

PhoneScript_AnswerPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyAnswerPhoneNiteText
	promptbutton
	end

.Gaven:
	farwritetext GavenAnswerPhoneNiteText
	promptbutton
	end

.Jose:
	farwritetext JoseAnswerPhoneNiteText
	promptbutton
	end

.Joey:
	farwritetext JoeyAnswerPhoneNiteText
	promptbutton
	end

.Wade:
	farwritetext WadeAnswerPhoneNiteText
	promptbutton
	end

.Ralph:
	farwritetext RalphAnswerPhoneNiteText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyAnswerPhoneNiteText
	promptbutton
	end

.Todd:
	farwritetext ToddAnswerPhoneNiteText
	promptbutton
	end

.Derek:
	farwritetext DerekAnswerPhoneNiteText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneNiteText
	promptbutton
	end

.Vance:
	farwritetext VanceAnswerPhoneNiteText
	promptbutton
	end

.Wilton:
	farwritetext WiltonAnswerPhoneNiteText
	promptbutton
	end

.Kenji:
	farwritetext KenjiAnswerPhoneNiteText
	promptbutton
	end

.Parry:
	farwritetext ParryAnswerPhoneNiteText
	promptbutton
	end

PhoneScript_AnswerPhone_Female:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Female_Day
	checktime EVE | NITE
	iftrue PhoneScript_AnswerPhone_Female_Nite
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethAnswerPhoneText
	promptbutton
	end

.Reena:
	farwritetext ReenaAnswerPhoneText
	promptbutton
	end

.Gina:
	farwritetext GinaAnswerPhoneText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneText
	promptbutton
	end

.Erin:
	farwritetext ErinAnswerPhoneText
	promptbutton
	end

PhoneScript_AnswerPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethAnswerPhoneDayText
	promptbutton
	end

.Reena:
	farwritetext ReenaAnswerPhoneDayText
	promptbutton
	end

.Gina:
	farwritetext GinaAnswerPhoneDayText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneDayText
	promptbutton
	end

.Erin:
	farwritetext ErinAnswerPhoneDayText
	promptbutton
	end

PhoneScript_AnswerPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethAnswerPhoneNiteText
	promptbutton
	end

.Reena:
	farwritetext ReenaAnswerPhoneNiteText
	promptbutton
	end

.Gina:
	farwritetext GinaAnswerPhoneNiteText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyAnswerPhoneNiteText
	promptbutton
	end

.Erin:
	farwritetext ErinAnswerPhoneNiteText
	promptbutton
	end

PhoneScript_GreetPhone_Male:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Male_Day
	checktime EVE | NITE
	iftrue PhoneScript_GreetPhone_Male_Nite
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyGreetText
	promptbutton
	end

.Gaven:
	farwritetext GavenGreetText
	promptbutton
	end

.Jose:
	farwritetext JoseGreetText
	promptbutton
	end

.Joey:
	farwritetext JoeyGreetText
	promptbutton
	end

.Wade:
	farwritetext WadeGreetText
	promptbutton
	end

.Ralph:
	farwritetext RalphGreetText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyGreetText
	promptbutton
	end

.Todd:
	farwritetext ToddGreetText
	promptbutton
	end

.Derek:
	farwritetext DerekGreetText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetText
	promptbutton
	end

.Vance:
	farwritetext VanceGreetText
	promptbutton
	end

.Wilton:
	farwritetext WiltonGreetText
	promptbutton
	end

.Kenji:
	farwritetext KenjiGreetText
	promptbutton
	end

.Parry:
	farwritetext ParryGreetText
	promptbutton
	end

PhoneScript_GreetPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyGreetDayText
	promptbutton
	end

.Gaven:
	farwritetext GavenGreetDayText
	promptbutton
	end

.Jose:
	farwritetext JoseGreetDayText
	promptbutton
	end

.Joey:
	farwritetext JoeyGreetDayText
	promptbutton
	end

.Wade:
	farwritetext WadeGreetDayText
	promptbutton
	end

.Ralph:
	farwritetext RalphGreetDayText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyGreetDayText
	promptbutton
	end

.Todd:
	farwritetext ToddGreetDayText
	promptbutton
	end

.Derek:
	farwritetext DerekGreetDayText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetDayText
	promptbutton
	end

.Vance:
	farwritetext VanceGreetDayText
	promptbutton
	end

.Wilton:
	farwritetext WiltonGreetDayText
	promptbutton
	end

.Kenji:
	farwritetext KenjiGreetDayText
	promptbutton
	end

.Parry:
	farwritetext ParryGreetDayText
	promptbutton
	end

PhoneScript_GreetPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyGreetNiteText
	promptbutton
	end

.Gaven:
	farwritetext GavenGreetNiteText
	promptbutton
	end

.Jose:
	farwritetext JoseGreetNiteText
	promptbutton
	end

.Joey:
	farwritetext JoeyGreetNiteText
	promptbutton
	end

.Wade:
	farwritetext WadeGreetNiteText
	promptbutton
	end

.Ralph:
	farwritetext RalphGreetNiteText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyGreetNiteText
	promptbutton
	end

.Todd:
	farwritetext ToddGreetNiteText
	promptbutton
	end

.Derek:
	farwritetext DerekGreetNiteText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetNiteText
	promptbutton
	end

.Vance:
	farwritetext VanceGreetNiteText
	promptbutton
	end

.Wilton:
	farwritetext WiltonGreetNiteText
	promptbutton
	end

.Kenji:
	farwritetext KenjiGreetNiteText
	promptbutton
	end

.Parry:
	farwritetext ParryGreetNiteText
	promptbutton
	end

PhoneScript_GreetPhone_Female:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Female_Day
	checktime EVE | NITE
	iftrue PhoneScript_GreetPhone_Female_Nite
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethGreetText
	promptbutton
	end

.Reena:
	farwritetext ReenaGreetText
	promptbutton
	end

.Gina:
	farwritetext GinaGreetText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyGreetText
	promptbutton
	end

.Erin:
	farwritetext ErinGreetText
	promptbutton
	end

PhoneScript_GreetPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethGreetDayText
	promptbutton
	end

.Reena:
	farwritetext ReenaGreetDayText
	promptbutton
	end

.Gina:
	farwritetext GinaGreetDayText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyGreetDayText
	promptbutton
	end

.Erin:
	farwritetext ErinGreetDayText
	promptbutton
	end

PhoneScript_GreetPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethGreetNiteText
	promptbutton
	end

.Reena:
	farwritetext ReenaGreetNiteText
	promptbutton
	end

.Gina:
	farwritetext GinaGreetNiteText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyGreetNiteText
	promptbutton
	end

.Erin:
	farwritetext ErinGreetNiteText
	promptbutton
	end

PhoneScript_Generic_Male:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Gaven:
	farwritetext GavenGenericText
	promptbutton
	end

.Jose:
	farwritetext JoseGenericText
	promptbutton
	end

.Joey:
	farwritetext JoeyGenericText
	promptbutton
	end

.Wade:
	farwritetext WadeGenericText
	promptbutton
	end

.Ralph:
	farwritetext RalphGenericText
	promptbutton
	end

.Anthony:
	farwritetext AnthonyGenericText
	promptbutton
	end

.Todd:
	farwritetext ToddGenericText
	promptbutton
	end

.Derek:
	farwritetext DerekGenericText
	promptbutton
	end

.Tully:
	farwritetext TullyGenericText
	promptbutton
	end

.Vance:
	farwritetext VanceGenericText
	promptbutton
	end

.Wilton:
	farwritetext WiltonGenericText
	promptbutton
	end

.Parry:
	farwritetext ParryGenericText
	promptbutton
	end

PhoneScript_Generic_Female:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethGenericText
	promptbutton
	end

.Reena:
	farwritetext ReenaGenericText
	promptbutton
	end

.Gina:
	farwritetext GinaGenericText
	promptbutton
	end

.Tiffany:
	farwritetext TiffanyGenericText
	promptbutton
	end

.Erin:
	farwritetext ErinGenericText
	promptbutton
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal $0, .TooEnergetic
	farwritetext UnknownGenericText
	promptbutton
	farsjump PhoneScript_HangUpText_Male

.TooEnergetic:
	farsjump .unnecessary

.unnecessary
	farwritetext UnknownTougherThanEverText
	promptbutton
	farsjump PhoneScript_HangUpText_Male

GrandmaString: db "Grandma@"
GrandpaString: db "Grandpa@"
MomString: db "Mom@"
DadString: db "Dad@"
SisterString: db "Sister@"
BrotherString: db "Brother@"

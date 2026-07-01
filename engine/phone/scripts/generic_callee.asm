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
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekAnswerPhoneText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneText
	promptbutton
	end

PhoneScript_AnswerPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekAnswerPhoneDayText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneDayText
	promptbutton
	end

PhoneScript_AnswerPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekAnswerPhoneNiteText
	promptbutton
	end

.Tully:
	farwritetext TullyAnswerPhoneNiteText
	promptbutton
	end

PhoneScript_AnswerPhone_Female:
	end

PhoneScript_GreetPhone_Male:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Male_Day
	checktime EVE | NITE
	iftrue PhoneScript_GreetPhone_Male_Nite
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekGreetText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetText
	promptbutton
	end

PhoneScript_GreetPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekGreetDayText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetDayText
	promptbutton
	end

PhoneScript_GreetPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekGreetNiteText
	promptbutton
	end

.Tully:
	farwritetext TullyGreetNiteText
	promptbutton
	end

PhoneScript_GreetPhone_Female:
	end

PhoneScript_Generic_Male:
	readvar VAR_CALLERID
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

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

.Derek:
	farwritetext DerekGenericText
	promptbutton
	end

.Tully:
	farwritetext TullyGenericText
	promptbutton
	end

PhoneScript_Generic_Female:
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

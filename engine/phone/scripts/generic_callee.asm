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
	end

PhoneScript_AnswerPhone_Female:
	end

PhoneScript_GreetPhone_Male:
	end

PhoneScript_GreetPhone_Female:
	end

PhoneScript_Generic_Male:
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

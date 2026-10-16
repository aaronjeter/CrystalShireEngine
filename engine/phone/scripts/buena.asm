BuenaPhoneCalleeScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue BuenaPhoneScript_Rocket
	readvar VAR_HOUR
	ifgreater 17, BuenaPhoneScript_AfterMidnightCallee
	scall BuenaPhoneScript_CheckTimeOfDayCallee
	sjump BuenaPhoneScript_RandomCallee

BuenaPhoneScript_CheckTimeOfDayCallee:
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	writetext BuenaPhoneNiteAnswerText
	promptbutton
	end

.morn
	writetext BuenaPhoneMorningAnswerText
	promptbutton
	end

.day
	writetext BuenaPhoneDayAnswerText
	promptbutton
	end

BuenaPhoneScript_AfterMidnightCallee:
	writetext BuenaPhoneMidnightAnswerText
	end

BuenaPhoneScript_Rocket:
	writetext BuenaPhoneRocketText
	end

BuenaPhoneScript_RandomCallee:
	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	writetext BuenaPhoneFavoriteSlotMachineAnswerText
	end

.one
	writetext BuenaPhonePokegearAnswerText
	end

.two
	writetext BuenaPhoneCoopedUpInRadioTowerAnswerText
	end

INCLUDE "data/phone/text/buena.asm"

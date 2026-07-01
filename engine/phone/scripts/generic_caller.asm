Phone_GenericCall_Male:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal 0, .Bragging
	farscall PhoneScript_Generic_Male
	farsjump Phone_FoundAMon_Male

.Bragging:
	farsjump Phone_BraggingCall_Male

Phone_GenericCall_Female:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal 0, .Bragging
	farscall PhoneScript_Generic_Female
	farsjump Phone_FoundAMon_Female

.Bragging:
	farsjump Phone_BraggingCall_Female

Phone_BraggingCall_Male:
	farscall Phone_WhosBragging_Male
	farsjump Phone_FoundAMon_Male

Phone_BraggingCall_Female:
	farscall Phone_WhosBragging_Female
	farsjump Phone_FoundAMon_Female

Phone_FoundAMon_Male:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	ifequal 0, .GotAway
	farscall Phone_WhoDefeatedMon_Male
	farsjump PhoneScript_HangUpText_Male

.GotAway:
	farsjump Phone_GotAwayCall_Male

Phone_FoundAMon_Female:
	special RandomPhoneWildMon
	farscall PhoneScript_Random2
	ifequal 0, .GotAway
	farscall Phone_WhoDefeatedMon_Female
	farsjump PhoneScript_HangUpText_Female

.GotAway:
	farsjump Phone_GotAwayCall_Female

Phone_GotAwayCall_Male:
	farscall Phone_WhoLostAMon_Male
	farsjump PhoneScript_HangUpText_Male

Phone_GotAwayCall_Female:
	farscall Phone_WhoLostAMon_Female
	farsjump PhoneScript_HangUpText_Female

Phone_WhosBragging_Male:
	readvar VAR_CALLERID
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

.Ralph:
	farwritetext RalphNeglectingKidsText
	promptbutton
	end

.Derek:
	farwritetext DerekCheekPinchingText
	promptbutton
	end

.Tully:
	farwritetext TullyMonHasGrownText
	promptbutton
	end

Phone_WhosBragging_Female:
	end

Phone_WhoDefeatedMon_Male:
	readvar VAR_CALLERID
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

.Ralph:
	farwritetext RalphDefeatedMonText
	promptbutton
	end

.Derek:
	farwritetext DerekDefeatedMonText
	promptbutton
	end

.Tully:
	farwritetext TullyDefeatedMonText
	promptbutton
	end

Phone_WhoDefeatedMon_Female:
	end

Phone_WhoLostAMon_Male:
	readvar VAR_CALLERID
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

.Ralph:
	farwritetext RalphLostAMonText
	promptbutton
	end

.Derek:
	farwritetext DerekLostAMonText
	promptbutton
	end

.Tully:
	farwritetext TullyLostAMonText
	promptbutton
	end

Phone_WhoLostAMon_Female:
	end

PhoneScript_WantsToBattle_Male:
	farscall PhoneScript_RematchText_Male
	farsjump PhoneScript_HangUpText_Male

PhoneScript_WantsToBattle_Female:
	farscall PhoneScript_RematchText_Female
	farsjump PhoneScript_HangUpText_Female

PhoneScript_RematchText_Male:
	readvar VAR_CALLERID
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_FISHER_TULLY, .Tully

.Ralph:
	farwritetext RalphBattleRematchText
	promptbutton
	end

.Tully:
	farwritetext TullyBattleRematchText
	promptbutton
	end

PhoneScript_RematchText_Female:
	end

PhoneScript_HangUpText_Male:
	readvar VAR_CALLERID
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

.Ralph:
	farwritetext RalphHangUpText
	end

.Derek:
	farwritetext DerekHangUpText
	end

.Tully:
	farwritetext TullyHangUpText
	end

PhoneScript_HangUpText_Female:
	end

Phone_CheckIfUnseenRare_Male:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Male

.HangUp:
	farsjump PhoneScript_HangUpText_Male

Phone_CheckIfUnseenRare_Female:
	scall PhoneScriptRareWildMon
	iffalse .HangUp
	farsjump Phone_GenericCall_Female

.HangUp:
	farsjump PhoneScript_HangUpText_Female

PhoneScriptRareWildMon:
	special RandomUnseenWildMon
	end

PhoneScript_BugCatchingContest:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFANM_DEREK, .Derek

.Derek:
	farwritetext DerekBugCatchingContestText
	promptbutton
	sjump PhoneScript_HangUpText_Male

RalphItemScript:
	farwritetext RalphItemText
	promptbutton
	sjump PhoneScript_HangUpText_Male

PhoneScript_FoundItem_Male:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully

.Derek:
	farwritetext DerekFoundItemText
	end

.Tully:
	farwritetext TullyFoundItemText
	end

PhoneScript_FoundItem_Female:
	end

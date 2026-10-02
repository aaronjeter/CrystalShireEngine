TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadtemptrainer
	encountermusic
	sjump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadtemptrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
; fallthrough
StartBattleWithMapTrainerScript:
	opentext
	callasm ShowMapTrainerPortrait
	trainertext TRAINERTEXT_SEEN
	waitbutton
	closepokepic
	closetext
	loadtemptrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadmem wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter

ShowMapTrainerPortrait:
; Show the map trainer's portrait (like opendialog) for their "seen" text.
	ld a, [wTempTrainerClass]
	ld [wTrainerClass], a
	farjp Trainerpic

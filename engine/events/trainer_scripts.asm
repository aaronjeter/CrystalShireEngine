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

TrainerAfterScript::
; Shared after-battle talk for standard map trainers (see `trainerafter`).
; Right after the battle it ends silently; when talked to later, it shows
; the trainer's portrait and their after-battle text.
	endifjustbattled
	opentext
	callasm ShowMapTrainerPortrait
	trainertext TRAINERTEXT_LOSS ; the text stored by trainerafter
	waitbutton
	closepokepic
	closetext
	end

ShowMapTrainerPortrait::
; Show the map trainer's portrait (like opendialog) for their "seen" text.
	ld a, [wTempTrainerClass]
	ld [wTrainerClass], a
	farjp Trainerpic

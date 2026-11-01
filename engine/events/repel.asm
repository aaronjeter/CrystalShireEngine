RepelWoreOffScript::
; When a Repel wears off, offer another of the same kind if the bag has one.
; If the kind isn't known (a save from before wLastRepelSteps), offer the weakest
; Repel in the bag.
	opentext
	readmem wLastRepelSteps
	ifequal REPEL_STEPS, .last_repel
	ifequal SUPER_REPEL_STEPS, .last_super_repel
	ifequal MAX_REPEL_STEPS, .last_max_repel
	checkitem REPEL
	iftrue .ask_repel
	checkitem SUPER_REPEL
	iftrue .ask_super_repel
	checkitem MAX_REPEL
	iftrue .ask_max_repel
	sjump .wore_off

.last_repel
	checkitem REPEL
	iftrue .ask_repel
	sjump .wore_off

.last_super_repel
	checkitem SUPER_REPEL
	iftrue .ask_super_repel
	sjump .wore_off

.last_max_repel
	checkitem MAX_REPEL
	iftrue .ask_max_repel
.wore_off
	writetext .RepelWoreOffText
	waitbutton
	closetext
	end

.ask_repel
	getitemname STRING_BUFFER_3, REPEL
	scall .Ask
	iffalse .done
	takeitem REPEL
	loadmem wRepelEffect, REPEL_STEPS
	loadmem wLastRepelSteps, REPEL_STEPS
	sjump .used

.ask_super_repel
	getitemname STRING_BUFFER_3, SUPER_REPEL
	scall .Ask
	iffalse .done
	takeitem SUPER_REPEL
	loadmem wRepelEffect, SUPER_REPEL_STEPS
	loadmem wLastRepelSteps, SUPER_REPEL_STEPS
	sjump .used

.ask_max_repel
	getitemname STRING_BUFFER_3, MAX_REPEL
	scall .Ask
	iffalse .done
	takeitem MAX_REPEL
	loadmem wRepelEffect, MAX_REPEL_STEPS
	loadmem wLastRepelSteps, MAX_REPEL_STEPS
.used
	playsound SFX_FULL_HEAL
	writetext .RepelUsedText
	waitsfx
	waitbutton
.done
	closetext
	end

.Ask:
	writetext .RepelWoreOffUseAnotherText
	yesorno
	end

.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end

.RepelWoreOffUseAnotherText:
	text_far _RepelWoreOffUseAnotherText
	text_end

.RepelUsedText:
	text_far _RepelUsedAnotherText
	text_end

BattleCommand_PerishSong:
	farcall DoublesPerishStored ; double battles: the two battlers not loaded
	ld b, a ; 1 if it started on one of them
	ld hl, wPlayerSubStatus1
	ld de, wEnemySubStatus1
	bit SUBSTATUS_PERISH, [hl]
	jr z, .ok

	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .all_perishing

.ok
	bit SUBSTATUS_PERISH, [hl]
	jr nz, .enemy

	set SUBSTATUS_PERISH, [hl]
	ld a, 4
	ld [wPlayerPerishCount], a

.enemy
	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .done

	set SUBSTATUS_PERISH, a
	ld [de], a
	ld a, 4
	ld [wEnemyPerishCount], a

.done
	call AnimateCurrentMove
	ld hl, StartPerishText
	jmp StdBattleTextbox

.all_perishing
	ld a, b
	and a
	jr nz, .done
.failed
	call AnimateFailedMove
	jmp PrintButItFailed

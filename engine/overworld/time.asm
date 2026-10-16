_InitializeStartDay:
	jmp InitializeStartDay

ClearDailyTimers:
	xor a
	ld [wLuckyNumberDayTimer], a
	ld [wUnusedTwoDayTimer], a
	ld [wDailyResetTimer], a
	ret

InitOneDayCountdown:
	ld a, 1

InitNDaysCountdown:
	ld [hl], a
	push hl
	call UpdateTime
	pop hl
	inc hl
	jmp CopyDayToHL

CheckDayDependentEventHL:
	inc hl
	push hl
	call CalcDaysSince
	call GetDaysSince
	pop hl
	dec hl
	jmp UpdateTimeRemaining

RestartDailyResetTimer:
	ld hl, wDailyResetTimer
	jr InitOneDayCountdown

CheckDailyResetTimer::
	ld hl, wDailyResetTimer
	call CheckDayDependentEventHL
	ret nc
	xor a
	ld hl, wDailyFlags1
	ld [hli], a ; wDailyFlags1
	ld [hli], a ; wDailyFlags2
	ld [hl], a ; wSwarmFlags
	jr RestartDailyResetTimer

StartBugContestTimer:
	ld a, BUG_CONTEST_MINUTES
	ld [wBugContestMinsRemaining], a
	ld a, BUG_CONTEST_SECONDS
	ld [wBugContestSecsRemaining], a
	call UpdateTime
	ld hl, wBugContestStartTime
	jmp CopyDayHourMinSecToHL

CheckBugContestTimer::
	ld hl, wBugContestStartTime
	call CalcSecsMinsHoursDaysSince
	ld a, [wDaysSince]
	and a
	jr nz, .timed_out
	ld a, [wHoursSince]
	and a
	jr nz, .timed_out
	ld a, [wSecondsSince]
	ld b, a
	ld a, [wBugContestSecsRemaining]
	sub b
	jr nc, .okay
	add 60

.okay
	ld [wBugContestSecsRemaining], a
	ld a, [wMinutesSince]
	ld b, a
	ld a, [wBugContestMinsRemaining]
	sbc b
	ld [wBugContestMinsRemaining], a
	jr c, .timed_out
	and a
	ret

.timed_out
	xor a
	ld [wBugContestMinsRemaining], a
	ld [wBugContestSecsRemaining], a
	scf
	ret

InitializeStartDay:
	call UpdateTime
	ld hl, wTimerEventStartDay
	jmp CopyDayToHL

CheckPokerusTick::
	ld hl, wTimerEventStartDay
	call CalcDaysSince
	call GetDaysSince
	and a
	jr z, .done ; not even a day has passed since game start
	ld b, a
	call ApplyPokerusTick
.done
	xor a
	ret

CheckUnusedTwoDayTimer:
	ld hl, wUnusedTwoDayTimerStartDate
	call CalcDaysSince
	call GetDaysSince
	ld hl, wUnusedTwoDayTimer
	jr UpdateTimeRemaining

RestartLuckyNumberCountdown:
	call .GetDaysUntilNextFriday
	ld hl, wLuckyNumberDayTimer
	jmp InitNDaysCountdown

.GetDaysUntilNextFriday:
	call GetWeekday
	cpl
	add FRIDAY + 1
	jr z, .friday_saturday
	ret nc

.friday_saturday
	add 7
	ret

_CheckLuckyNumberShowFlag:
	ld hl, wLuckyNumberDayTimer
	jmp CheckDayDependentEventHL

DoMysteryGiftIfDayHasPassed:
	ld a, BANK(sMysteryGiftTimer)
	call OpenSRAM
	ld hl, sMysteryGiftTimer
	ld a, [hli]
	ld [wTempMysteryGiftTimer], a
	ld a, [hl]
	ld [wTempMysteryGiftTimer + 1], a
	call CloseSRAM

	ld hl, wTempMysteryGiftTimer
	call CheckDayDependentEventHL
	jr nc, .not_timed_out
	ld hl, wTempMysteryGiftTimer
	call InitOneDayCountdown
	call CloseSRAM
	farcall ResetDailyMysteryGiftLimitIfUnlocked

.not_timed_out
	ld a, BANK(sMysteryGiftTimer)
	call OpenSRAM
	ld hl, wTempMysteryGiftTimer
	ld a, [hli]
	ld [sMysteryGiftTimer], a
	ld a, [hl]
	ld [sMysteryGiftTimer + 1], a
	jmp CloseSRAM

UpdateTimeRemaining:
; If the amount of time elapsed exceeds the capacity of its
; unit, skip this part.
	cp -1
	jr z, .set_carry
	ld c, a
	ld a, [hl] ; time remaining
	sub c
	jr nc, .ok
	xor a

.ok
	ld [hl], a
	jr z, .set_carry
	xor a
	ret

.set_carry
	xor a
	ld [hl], a
	scf
	ret

GetDaysSince:
	ld a, [wDaysSince]
	ret

CalcDaysSince:
	xor a
	jr _CalcDaysSince

CalcSecsMinsHoursDaysSince:
	inc hl
	inc hl
	inc hl
	ldh a, [hSeconds]
	ld c, a
	sub [hl]
	jr nc, .skip
	add 60
.skip
	ld [hl], c ; no-optimize *hl++|*hl-- = b|c|d|e (a is used) current seconds
	dec hl
	ld [wSecondsSince], a ; seconds since

_CalcMinsHoursDaysSince:
	ldh a, [hMinutes]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 60
.skip
	ld [hl], c ; no-optimize *hl++|*hl-- = b|c|d|e (a is used) current minutes
	dec hl
	ld [wMinutesSince], a ; minutes since

_CalcHoursDaysSince:
	ldh a, [hHours]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add MAX_HOUR
.skip
	ld [hl], c ; no-optimize *hl++|*hl-- = b|c|d|e (a is used) current hours
	dec hl
	ld [wHoursSince], a ; hours since

_CalcDaysSince:
	ld a, [wCurDay]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 20 * 7
.skip
	ld [hl], c ; current days
	ld [wDaysSince], a ; days since
	ret

CopyDayHourMinSecToHL:
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	ldh a, [hMinutes]
	ld [hli], a
	ldh a, [hSeconds]
	ld [hli], a
	ret

CopyDayToHL:
	ld a, [wCurDay]
	ld [hl], a
	ret

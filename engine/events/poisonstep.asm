DoPoisonStep::
	ld a, [wPartyCount]
	and a
	jr z, .done

	xor a
	ld c, wPoisonStepDataEnd - wPoisonStepData
	ld hl, wPoisonStepData
.loop_clearPoisonStepData
	ld [hli], a
	dec c
	jr nz, .loop_clearPoisonStepData

	xor a
	ld [wCurPartyMon], a
.loop_check_poison
	call .DamageMonIfPoisoned
	jr nc, .not_poisoned
; the output flag is stored in c, copy it to [wPoisonStepPartyFlags + [wCurPartyMon]]
; and set the corresponding flag in wPoisonStepFlagSum
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPoisonStepPartyFlags
	add hl, de
	ld [hl], c
	ld a, [wPoisonStepFlagSum]
	or c
	ld [wPoisonStepFlagSum], a

.not_poisoned
	ld a, [wPartyCount]
	ld hl, wCurPartyMon
	inc [hl]
	cp [hl]
	jr nz, .loop_check_poison

	ld a, [wPoisonStepFlagSum]
	and %10
	jr nz, .someone_survived
	ld a, [wPoisonStepFlagSum]
	and %01
	jr z, .done
	call .PlayPoisonSFX
	xor a
	ret

.someone_survived
	ld a, BANK(.Script_MonSurvivedPoison)
	ld hl, .Script_MonSurvivedPoison
	call CallScript
	scf
	ret

.done
	xor a
	ret

.DamageMonIfPoisoned:
; check if mon is poisoned, return if not
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and 1 << PSN
	ret z

; check if mon is already fainted, return if so
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	or c
	ret z

; at 1 HP, the poison wears off without damage
	ld a, b
	and a
	jr nz, .damage
	ld a, c
	dec a
	jr z, .survived

.damage
; do 1 HP damage
	dec bc
	ld a, c
	ld [hld], a
	ld [hl], b

; the poison wears off when it leaves the mon at 1 HP
	ld a, b
	and a
	jr nz, .not_survived
	ld a, c
	dec a
	jr nz, .not_survived

.survived
; reset its status, set carry, and return %10
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld [hl], 0
	ld c, %10
	scf
	ret

.not_survived
; set carry and return %01
	ld c, %01
	scf
	ret

.PlayPoisonSFX:
	ld de, SFX_POISON
	call PlaySFX
	ld b, $2
	predef LoadPoisonBGPals
	jmp DelayFrame

.Script_MonSurvivedPoison:
	callasm .PlayPoisonSFX
	opentext
	callasm .PrintSurvivedTexts
	closetext
	end

.PrintSurvivedTexts:
	xor a
	ld [wCurPartyMon], a
	ld de, wPoisonStepPartyFlags
.party_loop
	push de
	ld a, [de]
	and %10
	jr z, .next_mon
	farcall GetPartyNickname
	ld hl, .PoisonSurvivedText
	call PrintText

.next_mon
	pop de
	inc de
	ld hl, wCurPartyMon
	inc [hl]
	ld a, [wPartyCount]
	cp [hl]
	jr nz, .party_loop
	ret

.PoisonSurvivedText:
	text_far _PoisonSurvivedText
	text_end

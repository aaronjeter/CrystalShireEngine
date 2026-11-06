SelectMenu::
; One registered item: use it. Several: a box picks one by direction.
	farcall CountRegisteredItems
	ld a, c
	and a
	jr z, .none
	dec a
	jr nz, .several
	ld b, 0
.find
	ld a, b
	inc b
	farcall RegisteredItemSlotItem
	and a
	jr z, .find
	ld [wCurItem], a
	jr .use

.several
	farcall RegisteredItemsMenu
	ret c
.use
	ld a, -1 ; search the pocket for the item
	ld [wCurItemQuantity], a
	jr UseRegisteredItem

.none
	call OpenText
	ld b, BANK(MayRegisterItemText)
	ld hl, MayRegisterItemText
	call MapTextbox
	call WaitButton
	jmp CloseText

MayRegisterItemText:
	text_far _MayRegisterItemText
	text_end

UseRegisteredItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .SwitchTo
	jmp JumpTable

.SwitchTo:
; entries correspond to ITEMMENU_* constants
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld

.NoFunction:
	call OpenText
	call CantUseItem
	call CloseText
	and a
	ret

.Current:
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret

.Party:
	call ReanchorMap
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret

.Overworld:
	call ReanchorMap
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.CantUse:
	call ReanchorMap

._cantuse
	call CantUseItem
	call CloseText
	and a
	ret

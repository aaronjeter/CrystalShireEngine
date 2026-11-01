; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED    ; 0
	const OPT_BATTLE_SCENE  ; 1
	const OPT_BATTLE_STYLE  ; 2
	const OPT_SOUND         ; 3
	const OPT_FOLLOWER      ; 4
	const OPT_MENU_ACCOUNT  ; 5
	const OPT_FRAME         ; 6
	const OPT_CANCEL        ; 7
DEF OPT_PAGE2 EQU const_value ; first option on page 2
	const OPT_BATTLES       ; 8
	const OPT_CANCEL2       ; 9
DEF NUM_OPTIONS EQU const_value ; 10

_Option:
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	xor a
	ld [wJumptableIndex], a
	call Options_DrawPage
	ld a, 1
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	ld a, [wJumptableIndex]
	push af
	call OptionsControl
	pop bc ; b = the option before the move (keeps the flags)
	jr c, .moved
	call GetOptionPointer
	jr c, .ExitOptions
	jr .dpad

.moved
	; redraw if the cursor moved to the other page
	ld a, b
	cp OPT_PAGE2
	sbc a
	ld c, a
	ld a, [wJumptableIndex]
	cp OPT_PAGE2
	sbc a
	cp c
	jr z, .same_page
	xor a
	ldh [hBGMapMode], a
	call Options_DrawPage
	call WaitBGMap ; also turns hBGMapMode back on
.same_page
.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

StringOptions:
	db "Text Speed<LF>"
	db "        :<LF>"
	db "Battle Scene<LF>"
	db "        :<LF>"
	db "Battle Style<LF>"
	db "        :<LF>"
	db "Sound<LF>"
	db "        :<LF>"
	db "Follower<LF>"
	db "        :<LF>"
	db "Menu Account<LF>"
	db "        :<LF>"
	db "Frame<LF>"
	db "        :TYPE<LF>"
	db "Cancel@"

StringOptionsPage2:
	db "Battles<LF>"
	db "        :<LF>"
	db "Cancel@"

Options_DrawPage:
; Draw the page that holds option [wJumptableIndex], with the current settings.
	ld a, [wJumptableIndex]
	push af
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	pop af
	push af
	cp OPT_PAGE2
	jr nc, .page2
	hlcoord 2, 2
	ld de, StringOptions
	rst PlaceString
	hlcoord 18, 16
	ld [hl], "▼"
	lb bc, OPT_TEXT_SPEED, OPT_FRAME - OPT_TEXT_SPEED ; frame type is shown by UpdateFrame
	call .PrintSettings
	call UpdateFrame
	jr .done

.page2
	hlcoord 2, 2
	ld de, StringOptionsPage2
	rst PlaceString
	hlcoord 18, 1
	ld [hl], "▲"
	lb bc, OPT_BATTLES, OPT_CANCEL2 - OPT_BATTLES
	call .PrintSettings
.done
	pop af
	ld [wJumptableIndex], a
	ret

.PrintSettings:
; print c settings starting at option b (with no button pressed)
	ld a, b
	ld [wJumptableIndex], a
.loop
	push bc
	xor a
	ldh [hJoyLast], a
	ldh [hJoyPressed], a
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .loop
	ret

GetOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT_* constants
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Follower
	dw Options_MenuAccount
	dw Options_Frame
	dw Options_Cancel
	dw Options_Battles
	dw Options_Cancel

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_SLOW
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_SLOW + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 11, 3
	rst PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Fast
	dw .Mid
	dw .Slow

.Fast: db "Fast@"
.Mid:  db "Mid @"
.Slow: db "Slow@"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret

.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_FAST
	ret

.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_MED
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOff
; fallthrough
.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	hlcoord 11, 5
	rst PlaceString
	and a
	ret

.On:  db "On @"
.Off: db "Off@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	hlcoord 11, 7
	rst PlaceString
	and a
	ret

.Shift: db "Shift@"
.Set:   db "Set  @"

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	hlcoord 11, 9
	rst PlaceString
	and a
	ret

.Mono:   db "Mono  @"
.Stereo: db "Stereo@"

Options_Follower:
; FOLLOWER_OFF in wOptions2: the lead Pokémon follows the player unless it's set.
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr z, .Display
	ld a, [hl]
	xor 1 << FOLLOWER_OFF
	ld [hl], a
.Display:
	ld de, .On
	bit FOLLOWER_OFF, [hl]
	jr z, .got_string
	ld de, .Off
.got_string
	hlcoord 11, 11
	rst PlaceString
	and a
	ret

.On:  db "On @"
.Off: db "Off@"

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit MENU_ACCOUNT, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res MENU_ACCOUNT, [hl]
	ld de, .Off
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT, [hl]
	ld de, .On

.Display:
	hlcoord 11, 13
	rst PlaceString
	and a
	ret

.Off: db "Off@"
.On:  db "On @"

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a

.Save:
	maskbits NUM_FRAMES
	ld [hl], a
UpdateFrame:
	ld a, [wTextboxFrame]
	hlcoord 16, 15 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret

Options_Battles:
; TRAINER_DOUBLES in wOptions2: Normal (only double-battle trainers) or Doubles (every trainer).
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr z, .Display
	ld a, [hl]
	xor 1 << TRAINER_DOUBLES
	ld [hl], a
.Display:
	ld de, .Normal
	bit TRAINER_DOUBLES, [hl]
	jr z, .got_string
	ld de, .Doubles
.got_string
	hlcoord 11, 3
	rst PlaceString
	and a
	ret

.Normal:  db "Normal @"
.Doubles: db "Doubles@"

Options_Cancel:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp NUM_OPTIONS - 1 ; maximum option index
	jr nz, .Increase
	ld [hl], OPT_TEXT_SPEED ; first option
	scf
	ret

.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a ; OPT_TEXT_SPEED, minimum option index
	jr nz, .Decrease
	ld [hl], NUM_OPTIONS ; decrements to the last option on page 2

.Decrease:
	dec [hl]
	scf
	ret

Options_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wJumptableIndex]
	cp OPT_PAGE2
	jr c, .got_row
	sub OPT_PAGE2
.got_row
	rst AddNTimes
	ld [hl], "▶"
	ret

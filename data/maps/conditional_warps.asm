; Conditional warp tables for cond_warp_event (engine/overworld/conditional_warps.asm).
; Each table lists warp_if / warp_if_not entries, checked in order, and must end
; with warp_else (a fallback destination) or warp_locked (no warp).

; The player's house: its door opens only in the start region's home town,
; and its exit leads back there.

HomeExitWarps::
	warp_if EVENT_START_HOENN, LITTLEROOT_TOWN, 2
	warp_if EVENT_START_KANTO, PALLET_TOWN, 4
	warp_else NEW_BARK_TOWN, 2

NewBarkHomeDoorWarps::
	warp_if EVENT_START_JOHTO, PLAYERS_HOUSE_1F, 1
	warp_locked

PalletHomeDoorWarps::
	warp_if EVENT_START_KANTO, PLAYERS_HOUSE_1F, 1
	warp_locked

LittlerootHomeDoorWarps::
	warp_if EVENT_START_HOENN, PLAYERS_HOUSE_1F, 1
	warp_locked

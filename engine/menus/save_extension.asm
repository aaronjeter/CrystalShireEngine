; The save extension: wSaveExtension (WRAM bank 5) is saved to sSaveExtension
; (SRAM bank 0) after the main save and loaded on Continue, so new saved data
; doesn't change the main save's layout.

ClearSaveExtension::
; wSaveExtension = 0 (a new game, or a save without a valid extension)
	ldh a, [rSVBK]
	push af
	ld a, BANK(wSaveExtension)
	ldh [rSVBK], a
	ld hl, wSaveExtension
	ld bc, SAVE_EXTENSION_LENGTH
	xor a
	rst ByteFill
	pop af
	ldh [rSVBK], a
	ret

SaveSaveExtension::
; sSaveExtension = wSaveExtension, with its magic bytes and checksum
	ldh a, [rSVBK]
	push af
	ld a, BANK(wSaveExtension)
	ldh [rSVBK], a
	ld a, BANK(sSaveExtension)
	call OpenSRAM
	ld hl, wSaveExtension
	ld de, sSaveExtension
	ld bc, SAVE_EXTENSION_LENGTH
	rst CopyBytes
	ld hl, sSaveExtension
	ld bc, SAVE_EXTENSION_LENGTH
	call SaveExtensionChecksum
	ld a, e
	ld [sSaveExtensionChecksum + 0], a
	ld a, d
	ld [sSaveExtensionChecksum + 1], a
	ld a, SAVE_EXTENSION_MAGIC_1
	ld [sSaveExtensionMagic + 0], a
	ld a, SAVE_EXTENSION_MAGIC_2
	ld [sSaveExtensionMagic + 1], a
	pop af
	ldh [rSVBK], a
	jmp CloseSRAM

LoadSaveExtension::
; wSaveExtension = sSaveExtension if its magic bytes and checksum are right,
; else 0 (a save made before the extension existed)
	ld a, BANK(sSaveExtension)
	call OpenSRAM
	ld a, [sSaveExtensionMagic + 0]
	cp SAVE_EXTENSION_MAGIC_1
	jr nz, .invalid
	ld a, [sSaveExtensionMagic + 1]
	cp SAVE_EXTENSION_MAGIC_2
	jr nz, .invalid
	ld hl, sSaveExtension
	ld bc, SAVE_EXTENSION_LENGTH
	call SaveExtensionChecksum
	ld a, [sSaveExtensionChecksum + 0]
	cp e
	jr nz, .invalid
	ld a, [sSaveExtensionChecksum + 1]
	cp d
	jr nz, .invalid
	ldh a, [rSVBK]
	push af
	ld a, BANK(wSaveExtension)
	ldh [rSVBK], a
	ld hl, sSaveExtension
	ld de, wSaveExtension
	ld bc, SAVE_EXTENSION_LENGTH
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	jmp CloseSRAM

.invalid
	call CloseSRAM
	jmp ClearSaveExtension

SaveExtensionChecksum:
; de = the sum of bc bytes at hl
	ld de, 0
.loop
	ld a, [hli]
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

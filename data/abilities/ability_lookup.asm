; Ability lookup functions ----------------------------

;Entrance Abilities-----

CheckDrizzleAbility:
	call SetupAbilityCheck
	ld hl, DrizzleMons
	call IsInWordArray
	ret

CheckDroughtAbility:
	call SetupAbilityCheck
	ld hl, DroughtMons
	call IsInWordArray
	ret

CheckSandStreamAbility:
	call SetupAbilityCheck
	ld hl, SandStreamMons
	call IsInWordArray
	ret

CheckSnowWarningAbility:
	call SetupAbilityCheck
	ld hl, SnowWarningMons
	call IsInWordArray
	ret

CheckIntimidateAbility:
	call SetupAbilityCheck
	ld hl, IntimidateMons
	call IsInWordArray
	ret

CheckMystifyAbility:
	call SetupAbilityCheck
	ld hl, MystifyMons
	call IsInWordArray
	ret

CheckSnareAbility:
	call SetupAbilityCheck
	ld hl, SnareMons
	call IsInWordArray
	ret

CheckHasteAbility:
	call SetupAbilityCheck
	ld hl, HasteMons
	call IsInWordArray
	ret

CheckAimAbility:
	call SetupAbilityCheck
	ld hl, AimMons
	call IsInWordArray
	ret

CheckFocusAbility:
	call SetupAbilityCheck
	ld hl, FocusMons
	call IsInWordArray
	ret

CheckVeiledAbility:
	call SetupAbilityCheck
	ld hl, VeiledMons
	call IsInWordArray
	ret

CheckInvisibleWallAbility:
	call SetupAbilityCheck
	ld hl, InvisibleWallMons
	call IsInWordArray
	ret

CheckImpostorAbility:
	call SetupAbilityCheck
	ld hl, ImpostorMons
	call IsInWordArray
	ret

CheckDebrisAbility:
	call SetupAbilityCheck
	ld hl, DebrisMons
	call IsInWordArray
	ret

CheckLeechAbility:
	call SetupAbilityCheck
	ld hl, LeechMons
	call IsInWordArray
	ret

CheckEnervateAbility:
	call SetupAbilityCheck
	ld hl, EnervateMons
	call IsInWordArray
	ret

CheckDauntAbility:
	call SetupAbilityCheck
	ld hl, DauntMons
	call IsInWordArray
	ret

;Immunity abilities-----

CheckLevitateAbility:
	call SetupAbilityCheck
	ld hl, LevitateMons
	call IsInWordArray
	ret

CheckWaterproofAbility:
	call SetupAbilityCheck
	ld hl, WaterproofMons
	call IsInWordArray
	ret

;Damage Boosting Abilities-----

CheckElementalFistAbility:
	call SetupAbilityCheck
	ld hl, ElementalFistMons
	call IsInWordArray
	ret

CheckElementalFangAbility:
	call SetupAbilityCheck
	ld hl, ElementalFangMons
	call IsInWordArray
	ret

CheckElementalBladeAbility:
	call SetupAbilityCheck
	ld hl, ElementalBladeMons
	call IsInWordArray
	ret

CheckStabilityAbility:
	call SetupAbilityCheck
	ld hl, StabilityMons
	call IsInWordArray
	ret


;Between turn heal abilities-----

CheckRegenerationAbility:
	call SetupAbilityCheck
	ld hl, RegenerationMons
	call IsInWordArray
	ret

CheckRainDishAbility:
	call SetupAbilityCheck
	ld hl, RainDishMons
	call IsInWordArray
	ret

CheckSunbaskAbility:
	call SetupAbilityCheck
	ld hl, SunbaskMons
	call IsInWordArray
	ret

CheckSandBodyAbility:
	call SetupAbilityCheck
	ld hl, SandBodyMons
	call IsInWordArray
	ret

CheckIceBodyAbility:
	call SetupAbilityCheck
	ld hl, IceBodyMons
	call IsInWordArray
	ret


;Weather Speed Abilities-----

CheckSwiftSwimAbility:
	call SetupAbilityCheck
	ld hl, SwiftSwimMons
	call IsInWordArray
	ret

CheckChlorophyllAbility:
	call SetupAbilityCheck
	ld hl, ChlorophyllMons
	call IsInWordArray
	ret

CheckSandRushAbility:
	call SetupAbilityCheck
	ld hl, SandRushMons
	call IsInWordArray
	ret

CheckSlushRushAbility:
	call SetupAbilityCheck
	ld hl, SlushRushMons
	call IsInWordArray
	ret


SetupAbilityCheck:
	ld b, h
	ld c, l
	ld de, 2
	ret

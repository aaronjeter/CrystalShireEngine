MACRO phone
; trainer class, trainer id, map, callee time, callee script, caller time, caller script
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	table_width PHONE_CONTACT_SIZE
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_ELM,      ELMS_LAB,                  ANYTIME, ElmPhoneCalleeScript,     0,       ElmPhoneCallerScript
	phone SCHOOLBOY,    JACK,                  NATIONAL_PARK,             ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone POKEFANF,     BEVERLY,               NATIONAL_PARK,             ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone SAILOR,       HUEY1,                 OLIVINE_LIGHTHOUSE_2F,     ANYTIME, HueyPhoneCalleeScript,    ANYTIME, HueyPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN,                 ROUTE_26,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone COOLTRAINERF, BETH,                  ROUTE_26,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BIRD_KEEPER,  JOSE,                  ROUTE_27,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone COOLTRAINERF, REENA,                 ROUTE_27,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone YOUNGSTER,    JOEY1,                 ROUTE_30,                  ANYTIME, JoeyPhoneCalleeScript,    ANYTIME, JoeyPhoneCallerScript
	phone BUG_CATCHER,  WADE1,                 ROUTE_31,                  ANYTIME, WadePhoneCalleeScript,    ANYTIME, WadePhoneCallerScript
	phone FISHER,       RALPH1,                ROUTE_32,                  ANYTIME, RalphPhoneCalleeScript,   ANYTIME, RalphPhoneCallerScript
	phone PICNICKER,    LIZ,                   ROUTE_32,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone HIKER,        ANTHONY,               ROUTE_33,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone CAMPER,       TODD,                  ROUTE_34,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    GINA,                  ROUTE_34,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone JUGGLER,      IRWIN,                 ROUTE_35,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BUG_CATCHER,  ARNIE,                 ROUTE_35,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone SCHOOLBOY,    ALAN1,                 ROUTE_36,                  ANYTIME, UnusedPhoneScript,		 ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone LASS,         DANA1,                 ROUTE_38,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone SCHOOLBOY,    CHAD1,                 ROUTE_38,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone POKEFANM,     DEREK1,                ROUTE_39,                  ANYTIME, DerekPhoneCalleeScript,   ANYTIME, DerekPhoneCallerScript
	phone FISHER,       TULLY1,                ROUTE_42,                  ANYTIME, TullyPhoneCalleeScript,   ANYTIME, TullyPhoneCallerScript
	phone POKEMANIAC,   BRENT1,                ROUTE_43,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    TIFFANY3,              ROUTE_43,                  ANYTIME, TiffanyPhoneCalleeScript, ANYTIME, TiffanyPhoneCallerScript
	phone BIRD_KEEPER,  VANCE,                 ROUTE_44,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone FISHER,       WILTON,                ROUTE_44,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BLACKBELT_T,  KENJI,                 ROUTE_45,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone HIKER,        PARRY,                 ROUTE_45,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    ERIN,                  ROUTE_46,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BUENA,    GOLDENROD_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneCalleeScript,   ANYTIME, BuenaPhoneCallerScript
	assert_table_length NUM_PHONE_CONTACTS + 1

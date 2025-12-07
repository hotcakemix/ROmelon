

SetBonusDB = 
{
------ここから店売り------
	[1] = { --ルーミン
		ids = {210000, 210001, 210002, 210003},
		bonuses = {
			{count = 2, script = [[ {bonus bMaxHPrate,10; bonus bMaxSPrate,10; bonus bMaxHP,3000;} ]]},
			{count = 3, script = [[ {bonus2 bSubEle,Ele_All,10; bonus bMaxHP,5000;} ]]},
			{count = 4, script = [[ {bonus2 bHPDrainRate,15,5; bonus bMaxHP,7000;} ]]}
		}
	},
	[2] = { --クロネカー
		ids = {210004, 210005, 210006, 210007},
		bonuses = {
			{count = 2, script = [[ {bonus bNearAtkDef,5; bonus bLongAtkDef,5; bonus bMagicAtkDef,5; bonus bMiscAtkDef,5; bonus2 bAddSize,Size_Small,10; bonus2 bAddSize,Size_Medium,10; bonus2 bAddSize,Size_Big,10; bonus2 bMagicAddSize,Size_Small,10; bonus2 bMagicAddSize,Size_Medium,10; bonus2 bMagicAddSize,Size_Big,10;} ]]},
			{count = 3, script = [[ {bonus2 bSubRace,Rct_Boss,10; bonus2 bSubRace,Rct_NonBoss,10; bonus2 bMagicSubRace,Rct_Boss,10; bonus2 bMagicSubRace,Rct_NonBoss,10; bonus2 bAddRace,Rct_Boss,20; bonus2 bAddRace,Rct_NonBoss,20; bonus2 bMagicAddRace,Rct_Boss,20; bonus2 bMagicAddRace,Rct_NonBoss,20;} ]]}
		}
	},
	[3] = { --チェシャー
		ids = {210008, 210009, 210010, 210011},
		bonuses = {
			{count = 2, script = [[ {bonus bSpeedAddRate,25; bonus bInfiniteEndure,0; bonus bNoCastCancel2,0;} ]]},
			{count = 3, script = [[ {bonus bAspd,3; bonus bSkillDelayRate,-20;} ]]}
		}
	},
	[4] = { --ニーヒル
		ids = {210012, 210013, 210014},
		bonuses = {
			{count = 2, script = [[ {bonus bVit,10; bonus bDef,200; bonus bMdef,20;} ]]},
			{count = 3, script = [[ {bonus2 bHPPenaltyTime,1000,-1000; bonus2 bSPPenaltyTime,1000,-100; bonus bSpeedAddRate,10;} ]]}
		}
	},

------ここからドロップ------
	[50] = { --シガイツ
		ids = {210050, 210051, 210052, 210053, 210054},
		bonuses = {
			{count = 2, script = [[ {bonus bAllStatus,10; bonus bMaxHPrate,10; bonus bAtk,50; bonus bMatk1,50;} ]]},
			{count = 3, script = [[ {bonus2 bHPPenaltyTime,1000,-1000; bonus2 bSPPenaltyTime,1000,-100; bonus bMaxHP,5000;} ]]},
			{count = 4, script = [[ {bonus bFlee,50; bonus bHit,50; bonus bDef,100; bonus bMdef,20;} ]]}
		}
	},
	[51] = { --プルレド
		ids = {210055, 210056},
		bonuses = {
			{count = 2, script = [[ {bonus bVit,10; bonus bMaxHP,10000; bonus bMaxHPrate,20;} ]]}
		}
	},

	[52] = { --セーラ
		ids = {210057, 210058},
		bonuses = {
			{count = 2, script = [[ {bonus2 bSubRace,Rct_Boss,10; bonus2 bSubRace,Rct_NonBoss,10; bonus2 bMagicSubRace,Rct_Boss,10; bonus2 bMagicSubRace,Rct_NonBoss,10; bonus2 bAddSize,Size_Small,25; bonus2 bAddSize,Size_Medium,25; bonus2 bAddSize,Size_Big,25; bonus2 bMagicAddSize,Size_Small,25; bonus2 bMagicAddSize,Size_Medium,25; bonus2 bMagicAddSize,Size_Big,25;} ]]}
		}
	},
	[53] = { --ティーチェ
		ids = {210059, 210060},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddRace,Rct_Boss,25; bonus2 bAddRace,Rct_NonBoss,25; bonus2 bMagicAddRace,Rct_Boss,25; bonus2 bMagicAddRace,Rct_NonBoss,25;} ]]}
		}
	},

------ここから職セット------
------ナイト------
	[100] = { --ケイアス
		ids = {210200, 210201, 210202, 210203, 210204, 210205},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,2004,150; bonus2 bAddSkillDamageRate,2008,150; bonus2 bAddSkillDamageRate,5004,150; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus2 bMagicSubRace,Rct_Boss,10; bonus2 bMagicSubRace,Rct_NonBoss,10; bonus2 bSubRace,Rct_Boss,10; bonus2 bSubRace,Rct_NonBoss,10; bonus bSkillDelayRate,-30; bonus bMaxHPrate,30;} ]]},
			{count = 6, script = [[ {bonus bAddLongWeaponDamage,20; bonus2 bAddSkillDamageRate,5208,50; bonus2 bAddSkillDamageRate,5211,50; bonus2 bAddSkillDamageRate,397,600; bonus2 bAddSkillCoolDown,397,1000;} ]]}
		}
	},
	[101] = { --アジフ
		ids = {210206, 210207, 210208, 210209, 210210, 210211},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,2006,100; bonus2 bAddSkillDamageRate,2002,100; bonus bAddShortWeaponDamage,10; bonus bAddLongWeaponDamage,10;} ]]},
			{count = 4, script = [[ {bonus2 bAddEnemy,Emy_Etc,20; bonus2 bAddEnemy,Emy_Mob,20; bonus2 bMagicAddEnemy,Emy_Etc,20; bonus2 bMagicAddEnemy,Emy_Mob,20; bonus2 bHPPenaltyTime,1000,-3000; bonus2 bSPPenaltyTime,1000,-200; bonus2 bAddEleWeaponDamageRate,Ele_Fire,20;} ]]},
			{count = 6, script = [[ {bonus bSkillDelayRate,-30; bonus2 bAddSkillDamageRate,5202,150; bonus2 bAddSkillDamageRate,5204,100; bonus2 bAddSkillDamageRate,5205,100; bonus2 bAddSkillDamageRate,5213,50;} ]]}
		}
	},
------クルセイダー------
	[200] = { --ロエル
		ids = {210300, 210301, 210302, 210303, 210304, 210305},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"LG_SHIELDPRESS",300; bonus2 bAddSkillDamageRate,"LG_RAYOFGENESIS",100; bonus2 bAddEleMagicDamageRate,Ele_Holy,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bIgnoreMDefEnemy,Emy_Mob,50; bonus2 bIgnoreMDefEnemy,Emy_Etc,50; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus bNoCastCancel2,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddEleMagicDamageRate,Ele_Holy,30; bonus bSkillDelayRate,-30; bonus2 bAddSkillDamageRate,"IG_CROSS_RAIN",100; bonus2 bAddSkillDamageRate,"IG_JUDGEMENT_CROSS",50;} ]]}
		}
	},
	[201] = { --ミケル
		ids = {210306, 210307, 210308, 210309, 210310, 210311},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"LG_BANISHINGPOINT",150; bonus2 bAddSkillDamageRate,"LG_OVERBRAND_BRANDISH",50; bonus2 bAddSkillDamageRate,"LG_OVERBRAND_PLUSATK",50;  bonus bAddShortWeaponDamage,10; bonus bAddLongWeaponDamage,10;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bHPDrainRate,20,5; bonus2 bResEff,Eff_Stun,10000;} ]]},
			{count = 6, script = [[ {bonus bAddShortWeaponDamage,20; bonus bAddLongWeaponDamage,20; bonus2 bAddSkillDamageRate,"PA_SHIELCHAIN",1000; bonus2 bAddSkillCoolDown,"PA_SHIELCHAIN",1000; bonus2 bAddSkillDamageRate,"IG_SHIELD_SHOOTING",50; bonus2 bAddSkillDamageRate,"IG_OVERSLASH",50;} ]]}
		}
	},
------プリースト------
	[300] = { --アイリス
		ids = {210400, 210401, 210402, 210403, 210404, 210405},
		bonuses = {
			{count = 2, script = [[ {callfunc "AddSkillHealRate",100; bonus2 bAddSkillDamageRate,"AB_DUPLELIGHT_MELEE",200; bonus2 bAddSkillDamageRate,"AB_DUPLELIGHT_MAGIC",200; bonus bSkillDelayRate,-30;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bSpeedAddRate,30; bonus bNoKnockback,0;} ]]},
			{count = 6, script = [[ {bonus bAspd,3; bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30; bonus2 bMagicAddSize,Size_Small,30; bonus2 bMagicAddSize,Size_Medium,30; bonus2 bMagicAddSize,Size_Big,30; callfunc "AddSkillHealRate",100; bonus2 bAddSkillDamageRate,"CD_PETITIO",100; bonus2 bAddSkillDamageRate,"CD_EFFLIGO",100;} ]]}
		}
	},
	[301] = { --ニルエン
		ids = {210406, 210407, 210408, 210409, 210410, 210411},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"AB_JUDEX",100; bonus2 bAddSkillDamageRate,"AB_ADORAMUS",50; bonus2 bAddEleMagicDamageRate,Ele_Holy,15;} ]]},
			{count = 4, script = [[ {bonus bSkillDelayRate,-30; bonus bMaxHPrate,30; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddEleMagicDamageRate,Ele_Holy,20; bonus2 bAddSkillDamageRate,"CD_FRAMEN",50; bonus2 bAddSkillDamageRate,"CD_ARBITRIUM",50; bonus2 bAddSkillDamageRate,"CD_ARBITRIUM_ATK",50; bonus2 bAddSkillDamageRate,"CD_PNEUMATICUS_PROCELLA",50; bonus2 bAddSkillDamageRate,"PR_MAGNUS",1000; bonus2 bAddSkillCoolDown,"PR_MAGNUS",1000; bonus2 bAddSkillCoolDown,"PR_MAGNUS",1000;} ]]}
		}
	},
------モンク------
	[400] = { --ゲルカ
		ids = {210500, 210501, 210502, 210503, 210504, 210505},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SR_KNUCKLEARROW",150; bonus2 bAddSkillDamageRate,"SR_RIDEINLIGHTNING",150; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bNoSizeFix,0; bonus bSkillDelayRate,-30; bonus bMaxHPrate,20;} ]]},
			{count = 6, script = [[ {bonus bAddLongWeaponDamage,20; bonus2 bAddSkillDamageRate,"SR_GATEOFHELL",200; bonus2 bAddSkillCoolDown,"SR_GATEOFHELL",3000; bonus2 bAddSkillDamageRate,"IQ_OLEUM_SANCTUM",50; bonus2 bAddSkillDamageRate,"IQ_EXPOSION_BLASTER",50; bonus2 bAddSkillDamageRate,"IQ_MASSIVE_F_BLASTER",25;} ]]}
		}
	},
	[401] = { --ヴォルコヴァ
		ids = {210506, 210507, 210508, 210509, 210510, 210511},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SR_DRAGONCOMBO",200; bonus2 bAddSkillDamageRate,"SR_SKYNETBLOW",150; bonus bAddShortWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus2 bAddEnemy,Emy_Etc,20; bonus2 bAddEnemy,Emy_Mob,20; bonus bMaxHPrate,20; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus bAddShortWeaponDamage,20; bonus2 bAddSkillDamageRate,"IQ_FIRST_BRAND",25; bonus2 bAddSkillDamageRate,"IQ_SECOND_FLAME",25; bonus2 bAddSkillDamageRate,"IQ_SECOND_FAITH",25; bonus2 bAddSkillDamageRate,"IQ_SECOND_JUDGEMENT",25; bonus2 bAddSkillDamageRate,"MO_EXTREMITYFIST",400; bonus2 bAddSkillCoolDown,"MO_EXTREMITYFIST",3000;} ]]}
		}
	},
------ウィザード------
	[500] = { --ニルレム
		ids = {210600, 210601, 210602, 210603, 210604, 210605},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"WL_CRIMSONROCK",150; bonus2 bAddSkillDamageRate,"WL_EARTHSTRAIN",150; bonus2 bAddSkillDamageRate,"WL_JACKFROST",150; bonus2 bAddSkillDamageRate,"WL_CHAINLIGHTNING",150; bonus2 bAddSkillDamageRate,"WL_CHAINLIGHTNING_ATK",150; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bAddEleMagicDamageRate,Ele_Fire,20; bonus2 bAddEleMagicDamageRate,Ele_Wind,20; bonus2 bAddEleMagicDamageRate,Ele_Earth,20; bonus2 bAddEleMagicDamageRate,Ele_Water,20; bonus bMatk2Rate,20;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bFixCastrate,-70,0; bonus2 bAddSkillDamageRate,"AG_CRIMSON_ARROW",50; bonus2 bAddSkillDamageRate,"AG_CRIMSON_ARROW_ATK",50; bonus2 bAddSkillDamageRate,"AG_FROZEN_SLASH",50; bonus2 bAddSkillDamageRate,"AG_STORM_CANNON",50; bonus2 bAddSkillDamageRate,"AG_ROCK_DOWN",50;} ]]}
		}
	},
	[501] = { --アルカナ
		ids = {210606, 210607, 210608, 210609, 210610, 210611},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"WL_HELLINFERNO",150; bonus2 bAddSkillDamageRate,"WL_SOULEXPANSION",150; bonus2 bAddSkillDamageRate,"WL_DRAINLIFE",150; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bSpeedAddRate,30; bonus2 bFixCastrate,-70,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"AG_SOUL_VC_STRIKE",50; bonus2 bAddSkillDamageRate,"AG_MYSTERY_ILLUSION",50; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"WL_COMET",500; bonus2 bAddEleMagicDamageRate,Ele_Neutral,30; bonus2 bAddEleMagicDamageRate,Ele_Ghost,30; bonus2 bAddEleMagicDamageRate,Ele_Dark,30;} ]]}
		}
	},
------セージ------
	[600] = { --キルケラ
		ids = {210700, 210701, 210702, 210703, 210704, 210705},
		bonuses = {
			{count = 2, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"MG_FIREBOLT",800; bonus2 bAddSkillDamageRate,"MG_COLDBOLT",800; bonus2 bAddSkillDamageRate,"MG_LIGHTNINGBOLT",800; bonus2 bAddFixCastRate,"MG_FIREBOLT",500; bonus2 bAddFixCastRate,"MG_COLDBOLT",500; bonus2 bAddFixCastRate,"MG_LIGHTNINGBOLT",500; bonus2 bAddSkillDamageRate,"SO_POISON_BUSTER",150;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bNoKnockback,0; bonus2 bFixCastrate,-50,0;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddEleMagicDamageRate,Ele_Poison,30; bonus2 bAddSkillDamageRate,"EM_VENOM_SWAMP",50; bonus2 bAddSkillDamageRate,"EM_ELEMENTAL_BUSTER",25;} ]]}
		}
	},
	[601] = { --エイヴァント
		ids = {210706, 210707, 210708, 210709, 210710, 210711},
		bonuses = {
			{count = 2, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"SO_VARETYR_SPEAR",150; bonus2 bAddSkillDamageRate,"SO_EARTHGRAVE",150; bonus2 bAddSkillDamageRate,"SO_DIAMONDDUST",150; bonus2 bAddSkillDamageRate,"SO_PSYCHIC_WAVE",100;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bSkillDelayRate,-30; bonus2 bFixCastrate,-50,0;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddEleMagicDamageRate,Ele_Fire,20; bonus2 bAddEleMagicDamageRate,Ele_Wind,20; bonus2 bAddEleMagicDamageRate,Ele_Water,20; bonus2 bAddEleMagicDamageRate,Ele_Earth,20; bonus2 bAddSkillDamageRate,"EM_CONFLAGRATION",50; bonus2 bAddSkillDamageRate,"EM_TERRA_DRIVE",50; bonus2 bAddSkillDamageRate,"EM_DIAMOND_STORM",50; bonus2 bAddSkillDamageRate,"EM_LIGHTNING_LAND",50;} ]]}
		}
	},
------ハンター------
	[700] = { --セシル
		ids = {210800, 210801, 210802, 210803, 210804, 210805},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RA_ARROWSTORM",100; bonus2 bAddSkillDamageRate,"RA_AIMEDBOLT",100; bonus2 bAddSkillDamageRate,"RA_CLUSTERBOMB",200; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bInfiniteEndure,0; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"WH_CRESCIVE_BOLT",50; bonus2 bAddSkillDamageRate,"WH_GALESTORM",50; bonus2 bAddSkillDamageRate,"WH_SOLIDTRAP",25; bonus2 bAddSkillDamageRate,"WH_FLAMETRAP",25; bonus2 bAddSkillDamageRate,"WH_SWIFTTRAP",25; bonus2 bAddSkillDamageRate,"WH_DEEPBLINDTRAP",25; bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30;} ]]}
		}
	},
	[701] = { --ロックスター
		ids = {210806, 210807, 210808, 210809, 210810, 210811},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RA_WUGSTRIKE",150; bonus2 bAddSkillDamageRate,"RA_WUGBITE",150; bonus2 bAddSkillDamageRate,"HT_BLITZBEAT",5000; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPDrainRate,20,5; bonus2 bResEff,Eff_Curse,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"RA_WUGSTRIKE",200; bonus2 bAddSkillDamageRate,"RA_WUGBITE",200; bonus2 bAddSkillDamageRate,"WH_HAWKRUSH",100; bonus2 bAddSize,Size_Small,20; bonus2 bAddSize,Size_Medium,20; bonus2 bAddSize,Size_Big,20;} ]]}
		}
	},
------バード・ダンサー------
	[800] = { --アイグ
		ids = {210900, 210901, 210902, 210903, 210904, 210905},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"WM_REVERBERATION",300; bonus2 bAddSkillDamageRate,"WM_REVERBERATION_MELEE",300; bonus2 bAddSkillDamageRate,"WM_REVERBERATION_MAGIC",300; bonus2 bAddSkillDamageRate,"WM_METALICSOUND",150; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bAddEleMagicDamageRate,Ele_All,20; bonus2 bResEff,Eff_Curse,10000;} ]]},
			{count = 6, script = [[ {bonus bSkillDelayRate,-50; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"TR_SOUNDBLEND",100; bonus2 bAddSkillDamageRate,"TR_METALIC_FURY",50;} ]]}
		}
	},
	[801] = { --ニュオーズ
		ids = {210906, 210907, 210908, 210909, 210910, 210911},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"WM_SEVERE_RAINSTORM",100; bonus2 bAddSkillDamageRate,"WM_SEVERE_RAINSTORM_MELEE",100; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bAddSize,Size_Small,20; bonus2 bAddSize,Size_Medium,20; bonus2 bAddSize,Size_Big,20; bonus2 bResEff,Eff_Stone,10000;} ]]},
			{count = 6, script = [[ {bonus bAddLongWeaponDamage,20; bonus bSkillDelayRate,-30; bonus2 bAddSkillDamageRate,"TR_RHYTHMSHOOTING",25; bonus2 bAddSkillDamageRate,"TR_ROSEBLOSSOM",25; bonus2 bAddSkillDamageRate,"TR_ROSEBLOSSOM_ATK",25;} ]]}
		}
	},
------ブラックスミス------
	[900] = { --プルット
		ids = {211000, 211001, 211002, 211003, 211004, 211005},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"NC_VULCANARM",150; bonus2 bAddSkillDamageRate,"NC_ARMSCANNON",100; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bNoKnockback,0; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30; bonus2 bAddSkillDamageRate,"MT_A_MACHINE",150; bonus2 bAddSkillDamageRate,"MT_TRIPLE_LASER",50; bonus2 bAddSkillDamageRate,"MT_SPARK_BLASTER",25;} ]]}
		}
	},
	[901] = { --エリュミナ
		ids = {211006, 211007, 211008, 211009, 211010, 211011},
		bonuses = {
			{count = 2, script = [[ {bonus bSkillDelayRate,-30; bonus2 bAddSkillDamageRate,"NC_AXETORNADO",150; bonus2 bAddSkillDamageRate,"NC_POWERSWING",150;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bAddShortWeaponDamage,20; bonus bInfiniteEndure,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30; bonus2 bAddSkillDamageRate,"MT_AXE_STOMP",50; bonus2 bAddSkillDamageRate,"MT_MIGHTY_SMASH",25; bonus2 bAddSkillDamageRate,"MT_RUSH_QUAKE",25;} ]]}
		}
	},
------アルケミスト------
	[1000] = { --ケルト
		ids = {211100, 211101, 211102, 211103, 211104, 211105},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"GN_SPORE_EXPLOSION",150; bonus2 bAddSkillDamageRate,"GN_CRAZYWEED",150; bonus2 bAddSkillDamageRate,"GN_CRAZYWEED_ATK",150; bonus bSkillDelayRate,-30;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus bNoSizeFix,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"BO_ACIDIFIED_ZONE_WATER",50; bonus2 bAddSkillDamageRate,"BO_ACIDIFIED_ZONE_GROUND",50; bonus2 bAddSkillDamageRate,"BO_ACIDIFIED_ZONE_WIND",50; bonus2 bAddSkillDamageRate,"BO_ACIDIFIED_ZONE_FIRE",50; bonus bAddShortWeaponDamage,20; bonus bAddLongWeaponDamage,20; bonus2 bAddSkillDamageRate,"CR_ACIDDEMONSTRATION",500; bonus2 bAddSkillCoolDown,"CR_ACIDDEMONSTRATION",2000;} ]]}
		}
	},
	[1001] = { --スウェイ
		ids = {211106, 211107, 211108, 211109, 211110, 211111},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"GN_CART_TORNADO",100; bonus2 bAddSkillDamageRate,"GN_CARTCANNON",150; bonus bAddShortWeaponDamage,15; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bNoKnockback,0; bonus2 bSubEle,Ele_All,10;} ]]},
			{count = 6, script = [[ {bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30; bonus2 bAddSkillDamageRate,"BO_MAYHEMIC_THORNS",25; bonus2 bAddSkillDamageRate,"BO_EXPLOSIVE_POWDER",25;} ]]}
		}
	},
------アサシン------
	[1100] = { --ミスティ
		ids = {211200, 211201, 211202, 211203, 211204, 211205},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"GC_CROSSIMPACT",150; bonus2 bAddSkillDamageRate,"GC_COUNTERSLASH",150; bonus2 bAddSkillDamageRate,"ASC_METEORASSAULT",300; bonus bNoSizeFix,0;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bAddSize,Size_Small,20; bonus2 bAddSize,Size_Medium,20; bonus2 bAddSize,Size_Big,20; bonus bAddCriticalDamage,50;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SHC_DANCING_KNIFE",50; bonus2 bAddSkillDamageRate,"SHC_ETERNAL_SLASH",25; bonus2 bAddSkillDamageRate,"SHC_SHADOW_STAB",25; bonus2 bAddSkillDamageRate,"SHC_FATAL_SHADOW_CROW",25;} ]]}
		}
	},
	[1101] = { --シャイ
		ids = {211206, 211207, 211208, 211209, 211210, 211211},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"GC_ROLLINGCUTTER",100; bonus2 bAddSkillDamageRate,"GC_CROSSRIPPERSLASHER",100; bonus2 bAddSkillDamageRate,"ASC_BREAKER",200; bonus2 bAddRace,Rct_Boss,20; bonus2 bAddRace,Rct_NonBoss,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bSkillDelayRate,-30; bonus bInfiniteEndure,0;} ]]},
			{count = 6, script = [[ {bonus bAddCriticalDamage,50; bonus2 bAddSkillDamageRate,"SHC_SAVAGE_IMPACT",25; bonus2 bAddSkillDamageRate,"SHC_IMPACT_CRATER",25; bonus2 bAddSkillDamageRate,"SHC_FATAL_SHADOW_CROW",25;} ]]}
		}	
	},
------ローグ------
	[1200] = { --メロシュプム
		ids = {211300, 211301, 211302, 211303, 211304, 211305},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SC_FATALMENACE",150; bonus2 bAddSkillDamageRate,"SC_TRIANGLESHOT",150; bonus bAddShortWeaponDamage,15; bonus bAddLongWeaponDamage,15;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPDrainRate,20,5; bonus bNoSizeFix,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"ABC_ABYSS_DAGGER",25; bonus2 bAddSkillDamageRate,"ABC_DEFT_STAB",25; bonus2 bAddSkillDamageRate,"ABC_FRENZY_SHOT",25; bonus2 bAddSkillDamageRate,"ABC_CHAIN_REACTION_SHOT",25; bonus2 bAddSkillDamageRate,"ABC_CHAIN_REACTION_SHOT_ATK",25; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
	[1201] = { --メロディージャック
		ids = {211306, 211307, 211308, 211309, 211310, 211311},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SC_FEINTBOMB",150; bonus2 bAddEleMagicDamageRate,Ele_Neutral,20; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus2 bResEff,Eff_Stun,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"ABC_FROM_THE_ABYSS_ATK",50; bonus2 bAddSkillDamageRate,"ABC_ABYSS_STRIKE",50; bonus2 bAddSkillDamageRate,"ABC_ABYSS_SQUARE",100; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bMagicAddSize,Size_Small,30; bonus2 bMagicAddSize,Size_Medium,30; bonus2 bMagicAddSize,Size_Big,30;} ]]}
		}
	},
------拳聖------
	[1300] = { --ギンガ
		ids = {211400, 211401, 211402, 211403, 211404, 211405},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SJ_NEWMOONKICK",150; bonus2 bAddSkillDamageRate,"SJ_FALLINGSTAR_ATK",150; bonus2 bAddSkillDamageRate,"SJ_FALLINGSTAR_ATK2",150; bonus2 bAddSize,Size_Small,20; bonus2 bAddSize,Size_Medium,20; bonus2 bAddSize,Size_Big,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SKE_MIDNIGHT_KICK",100; bonus2 bAddSkillDamageRate,"SKE_DAWN_BREAK",100; bonus2 bAddSkillDamageRate,"SKE_STAR_BURST",100; bonus2 bAddSkillDamageRate,"SKE_STAR_CANNON",100; bonus bAddShortWeaponDamage,30;} ]]}
		}
	},
	[1301] = { --ニッコウ
		ids = {211406, 211407, 211408, 211409, 211410, 211411},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SJ_PROMINENCEKICK",150; bonus2 bAddSkillDamageRate,"SJ_NEWMOONKICK",150; bonus bSkillDelayRate,-30;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus2 bSubEle,Ele_All,10; bonus bNoKnockback,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SKE_NOON_BLAST",100; bonus2 bAddSkillDamageRate,"SKE_SUNSET_BLAST",100; bonus2 bAddSkillDamageRate,"SKE_MIDNIGHT_KICK",100; bonus2 bAddSkillDamageRate,"SKE_DAWN_BREAK",100; bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30;} ]]}
		}
	},
------リンカー------
	[1400] = { --ハンニャ
		ids = {211500, 211501, 211502, 211503, 211504, 211505},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SP_SPA",150; bonus2 bAddSkillDamageRate,"SP_SHA",150; bonus2 bAddSkillDamageRate,"SP_SWHOO",150; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bNoKnockback,0; bonus2 bSubEle,Ele_All,10;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SOA_TALISMAN_OF_BLUE_DRAGON",25; bonus2 bAddSkillDamageRate,"SOA_TALISMAN_OF_WHITE_TIGER",25; bonus2 bAddSkillDamageRate,"SOA_TALISMAN_OF_RED_PHOENIX",25; bonus2 bAddSkillDamageRate,"SOA_TALISMAN_OF_BLACK_TORTOISE",25; bonus2 bAddSkillDamageRate,"SOA_CIRCLE_OF_DIRECTIONS_AND_ELEMENTALS",25; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bMagicAddRace,Rct_Boss,20; bonus2 bMagicAddRace,Rct_NonBoss,20;} ]]}
		}
	},
	[1401] = { --ミカ
		ids = {211506, 211507, 211508, 211509, 211510, 211511},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SP_SHA",150; bonus2 bAddSkillDamageRate,"SP_CURSEEXPLOSION",150; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus2 bResEff,Eff_Stun,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SOA_EXORCISM_OF_MALICIOUS_SOUL",50; bonus2 bAddSkillDamageRate,"SOA_TALISMAN_OF_FOUR_BEARING_GOD",50; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddEleMagicDamageRate,Ele_All,20;} ]]}
		}
	},
------忍者------
	[1500] = { --ギオン
		ids = {211600, 211601, 211602, 211603, 211604, 211605},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"KO_BAKURETSU",100; bonus2 bAddSkillDamageRate,"KO_HAPPOKUNAI",100; bonus2 bAddSkillDamageRate,"KO_HUUMARANKA",100; bonus bAddLongWeaponDamage,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bSubEle,Ele_All,10; bonus bNoKnockback,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SS_KUNAIWAIKYOKU",25; bonus2 bAddSkillDamageRate,"SS_KUNAIKAITEN",25; bonus2 bAddSkillDamageRate,"SS_FUUMASHOUAKU",25; bonus2 bAddSkillDamageRate,"SS_KUNAIKUSSETSU",25; bonus2 bAddSkillDamageRate,"SS_FUUMAKOUCHIKU",25; bonus2 bAddRace,Rct_Boss,20; bonus2 bAddRace,Rct_NonBoss,20;} ]]}
		}
	},
	[1501] = { --シキ
		ids = {211606, 211607, 211608, 211609, 211610, 211611},
		bonuses = {
			{count = 2, script = [[ {bonus bMatk2Rate,20; bonus2 bAddEleMagicDamageRate,Ele_All,20; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bSkillDelayRate,-30; bonus2 bResEff,Eff_Stun,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SS_SEKIENHOU",25; bonus2 bAddSkillDamageRate,"SS_REIKETSUHOU",25; bonus2 bAddSkillDamageRate,"SS_RAIDENPOU",25; bonus2 bAddSkillDamageRate,"SS_KINRYUUHOU",25; bonus2 bAddSkillDamageRate,"SS_ANTENPOU",25; bonus2 bAddSkillDamageRate,"SS_ANKOKURYUUAKUMU",25; bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25;} ]]}
		}
	},
	[1502] = { --ナギ
		ids = {211612, 211613, 211614, 211615, 211616, 211617},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"KO_JYUMONJIKIRI",200; bonus bAddShortWeaponDamage,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPPenaltyTime,1000,-2000; bonus2 bSPPenaltyTime,1000,-200; bonus bInfiniteEndure,0;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SS_KAGEGARI",50; bonus2 bAddSkillDamageRate,"SS_KAGENOMAI",50; bonus2 bAddSkillDamageRate,"SS_KAGEGISSEN",50; bonus2 bAddSkillDamageRate,"SS_KAGEAKUMU",25; bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30;} ]]}
		}
	},
------ガンスリ------
	[1600] = { --ユリアン
		ids = {211700, 211701, 211702, 211703, 211704, 211705},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RL_FIREDANCE",100; bonus2 bAddSkillDamageRate,"RL_D_TAIL",100; bonus2 bAddRace,Rct_Boss,20; bonus2 bAddRace,Rct_NonBoss,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bSkillDelayRate,-30; bonus2 bResEff,Eff_Stone,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"NW_ONLY_ONE_BULLET",50; bonus2 bAddSkillDamageRate,"NW_HASTY_FIRE_IN_THE_HOLE",50; bonus2 bAddSkillDamageRate,"NW_GRENADES_DROPPING",50; bonus2 bAddSkillDamageRate,"NW_MISSION_BOMBARD",25; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
	[1601] = { --エスト
		ids = {211706, 211707, 211708, 211709, 211710, 211711},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RL_H_MINE",100; bonus2 bAddSkillDamageRate,"RL_S_STORM",100; bonus bAddLongWeaponDamage,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPDrainRate,20,5; bonus2 bResEff,Eff_Stun,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"NW_WILD_FIRE",50; bonus2 bAddSkillDamageRate,"NW_THE_VIGILANTE_AT_NIGHT",50; bonus2 bAddSkillDamageRate,"NW_SPIRAL_SHOOTING",50; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
	[1602] = { --ルッキー
		ids = {211712, 211713, 211714, 211715, 211716, 211717},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RL_R_TRIP",150; bonus2 bAddSkillDamageRate,"RL_R_TRIP_PLUSATK",150; bonus2 bAddSkillDamageRate,"RL_HAMMER_OF_GOD",100; bonus bAddLongWeaponDamage,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus bNoKnockback,0; bonus2 bResEff,Eff_Curse,10000;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"NW_ONLY_ONE_BULLET",50; bonus2 bAddSkillDamageRate,"NW_SPIRAL_SHOOTING",50; bonus2 bAddSkillDamageRate,"NW_THE_VIGILANTE_AT_NIGHT",50; bonus2 bAddSize,Size_Small,30; bonus2 bAddSize,Size_Medium,30; bonus2 bAddSize,Size_Big,30;} ]]}
		}
	},
	[1603] = { --ゴニー
		ids = {211718, 211719, 211720, 211721, 211722, 211723},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"RL_FIRE_RAIN",100; bonus2 bAddSkillDamageRate,"RL_SLUGSHOT",100; bonus bAddLongWeaponDamage,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bHPDrainRate,20,5; bonus2 bSubEle,Ele_All,10;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"NW_THE_VIGILANTE_AT_NIGHT",50; bonus2 bAddSkillDamageRate,"NW_MAGAZINE_FOR_ONE",50; bonus2 bAddSkillDamageRate,"NW_WILD_FIRE",50; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
------スーパーノービス------
	[1700] = { --プレミィ
		ids = {211800, 211801, 211802, 211803, 211804, 211805},
		bonuses = {
			{count = 2, script = [[ {skill "RK_IGNITIONBREAK",5,1; bonus2 bAddSkillDamageRate,"RK_IGNITIONBREAK",50; bonus2 bAddSkillDamageRate,"RG_RAID",500; bonus bSkillDelayRate,-30;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bMaxHP,20000; bonus2 bHPDrainRate,20,5;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"HN_DOUBLEBOWLINGBASH",50; bonus2 bAddSkillDamageRate,"HN_SHIELD_CHAIN_RUSH",50; bonus2 bAddSkillDamageRate,"HN_MEGA_SONIC_BLOW",50; bonus2 bAddSkillDamageRate,"HN_SPIRAL_PIERCE_MAX",50; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
	[1701] = { --カプレーゼ
		ids = {211806, 211807, 211808, 211809, 211810, 211811},
		bonuses = {
			{count = 2, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"WZ_VERMILION",300; bonus2 bAddSkillDamageRate,"WZ_METEOR",300; bonus2 bAddSkillDamageRate,"WZ_STORMGUST",300; bonus bMatk2Rate,20; skill "SO_PSYCHIC_WAVE",5,1; bonus2 bAddSkillDamageRate,"SO_PSYCHIC_WAVE",50;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,30; bonus bMaxHP,20000; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"HN_METEOR_STORM_BUSTER",50; bonus2 bAddSkillDamageRate,"HN_JUPITEL_THUNDER_STORM",50; bonus2 bAddSkillDamageRate,"HN_HELLS_DRIVE",50; bonus2 bAddSkillDamageRate,"HN_JACK_FROST_NOVA",50; bonus2 bAddSkillDamageRate,"HN_GROUND_GRAVITATION",50; bonus2 bAddSkillDamageRate,"HN_NAPALM_VULCAN_STRIKE",50; bonus2 bMagicAddRace,Rct_Boss,30; bonus2 bMagicAddRace,Rct_NonBoss,30;} ]]}
		}
	},
------ドラム------
	[1800] = { --エーラ
		ids = {211900, 211901, 211902, 211903, 211904, 211905},
		bonuses = {
			{count = 2, script = [[ {bonus2 bAddSkillDamageRate,"SU_PICKYPECK",150; bonus2 bAddSkillDamageRate,"SU_PICKYPECK_DOUBLE_ATK",150; bonus2 bAddSkillDamageRate,"SU_LUNATICCARROTBEAT",150; bonus2 bAddSkillDamageRate,"SU_LUNATICCARROTBEAT2",150; bonus2 bAddRace,Rct_Boss,20; bonus2 bAddRace,Rct_NonBoss,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bSubEle,Ele_All,10; bonus bSkillDelayRate,-30;} ]]},
			{count = 6, script = [[ {bonus2 bAddSkillDamageRate,"SH_CHUL_HO_SONIC_CLAW",50; bonus2 bAddSkillDamageRate,"SH_HOWLING_OF_CHUL_HO",50; bonus2 bAddSkillDamageRate,"SH_HOGOGONG_STRIKE",50; bonus2 bAddRace,Rct_Boss,30; bonus2 bAddRace,Rct_NonBoss,30;} ]]}
		}
	},
	[1801] = { --ファラ
		ids = {211906, 211907, 211908, 211909, 211910, 211911},
		bonuses = {
			{count = 2, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"SU_SV_STEMSPEAR",150; bonus2 bAddSkillDamageRate,"SU_CN_METEOR",150; bonus2 bAddSkillDamageRate,"SU_CN_METEOR2",150; bonus2 bMagicAddSize,Size_Small,20; bonus2 bMagicAddSize,Size_Medium,20; bonus2 bMagicAddSize,Size_Big,20;} ]]},
			{count = 4, script = [[ {bonus bMaxHPrate,20; bonus2 bResEff,Eff_Stone,10000; bonus bNoKnockback,0;} ]]},
			{count = 6, script = [[ {bonus2 bIgnoreMdefRace,Rct_Boss,25; bonus2 bIgnoreMdefRace,Rct_NonBoss,25; bonus2 bAddSkillDamageRate,"SH_HYUN_ROK_CANNON",50; bonus2 bAddSkillDamageRate,"SH_HYUN_ROKS_BREEZE",50; bonus2 bMagicAddRace,Rct_Boss,30; bonus2 bMagicAddRace,Rct_NonBoss,30;} ]]}
		}
	}
}

function SetBonusInit()
    for id, data in pairs(SetBonusDB) do
        local result = InsertSetBonus(id, data.ids, data.bonuses)
        if not result then
            print("Failed to insert set bonus: " .. tostring(id))
        end
    end
end

SetBonusInit()
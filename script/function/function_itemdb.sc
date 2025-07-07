//2025/05/07 更新

// 巨大なハエの羽
function	script	ItemdbPartyCall	{
	warp "Random",0,0;
	set '@name$,strcharinfo(0);
	if('@name$ == getpartyleader(getcharid(1)) && !getmapxy('@map$,'@x,'@y,0)) {
		getpartymember getcharid(1);
		for(set '@i,0; '@i < $@partymembercount; set '@i,'@i+1) {
			if($@partymembername$['@i] == '@name$)			// 自分は除外
				continue;
			if(getmapname($@partymembername$['@i]) != '@map$)	// MAPが違う
				continue;
			if(attachrid(getcharid(3,$@partymembername$['@i]))) {
				if(!checkdead()) {
					// 死亡してないならリーダーの元へワープ
					warp '@map$,'@x,'@y;
				}
				detachrid;
			}
		}
	}
	return;
}

//============================================================
// キラキラスティック
function	script	ItemdbResetSkill	{
	if(Weight || checkcart() || checkfalcon() || checkriding())
		return;
	set '@lv,getskilllv(1);	// 基本スキル
	resetskill 0;		// クエストスキルはリセットしない
	if('@lv > 0) {
		skill 1,'@lv,0;
		set SkillPoint,SkillPoint - '@lv;
	}
	return;
}

//============================================================
//[ヒール系スキル使用時HP回復量 + n%] 全種一括指定
//{ calllfunc "AddSkillHealRate",'@val; }

function	script	AddSkillHealRate	{
	set '@val,getarg(0);
		bonus2 bAddSkillHealRate,"AL_HEAL",'@val;	/* ヒール */
		bonus2 bAddSkillHealRate,"PR_SANCTUARY",'@val;	/* サンクチュアリ */
		bonus2 bAddSkillHealRate,"AM_POTIONPITCHER",'@val;	/* ポーションピッチャー */
		bonus2 bAddSkillHealRate,"CR_SLIMPITCHER",'@val;	/* スリムポーションピッチャー */
		bonus2 bAddSkillHealRate,"BA_APPLEIDUN",'@val;	/* イドゥンの林檎 */
		bonus2 bAddSkillHealRate,"AB_CHEAL",'@val;	/* コルセオヒール */
		bonus2 bAddSkillHealRate,"AB_HIGHNESSHEAL",'@val;	/* ハイネスヒール */
		bonus2 bAddSkillHealRate,"CD_MEDIALE_VOTUM",'@val;	/* メディアリボトゥム */

		bonus2 bAddSkillDamageRate,"AL_HEAL",'@val;	/* ヒール */
		bonus2 bAddSkillDamageRate,"PR_SANCTUARY",'@val;	/* サンクチュアリ */
		bonus2 bAddSkillDamageRate,"AB_CHEAL",'@val;	/* コルセオヒール */
		bonus2 bAddSkillDamageRate,"AB_HIGHNESSHEAL",'@val;	/* ハイネスヒール */
		bonus2 bAddSkillDamageRate,"CD_MEDIALE_VOTUM",'@val;	/* メディアリボトゥム */
	return;
}

//============================================================
//[ヒール系スキルを受けた時のHP回復量 + n%] 全種一括指定
//{ calllfunc "AddSkillSubHealRate",'@val; }

function	script	AddSkillSubHealRate	{
	set '@val,getarg(0);
		bonus2 bAddSkillSubHealRate,"AL_HEAL",'@val;	/* ヒール */
		bonus2 bAddSkillSubHealRate,"PR_SANCTUARY",'@val;	/* サンクチュアリ */
		bonus2 bAddSkillSubHealRate,"AM_POTIONPITCHER",'@val;	/* ポーションピッチャー */
		bonus2 bAddSkillSubHealRate,"CR_SLIMPITCHER",'@val;	/* スリムポーションピッチャー */
		bonus2 bAddSkillSubHealRate,"BA_APPLEIDUN",'@val;	/* イドゥンの林檎 */
		bonus2 bAddSkillSubHealRate,"AB_CHEAL",'@val;	/* コルセオヒール */
		bonus2 bAddSkillSubHealRate,"AB_HIGHNESSHEAL",'@val;	/* ハイネスヒール */
		bonus2 bAddSkillSubHealRate,"CD_MEDIALE_VOTUM",'@val;	/* メディアリボトゥム */
		/* bonus2 bAddItemHealRate,'@val;	一部のアイテムの回復量 */
	return;
}



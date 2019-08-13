// -- Weapon related perks
/*
class info {
	displayName = "Information";
	requiredPerkPoints = 5;
	requiredLevel = 50;
	requiredPerk = "";
	subtitle = "";
	description = "The perk system has been completely reset. There are currently no perks as we are slowly adding the system back piece by piece. You can still gain XP though. If you notice your XP and/or level being reset (apart from this complete wipe) please contact a member of staff!";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
*/
// -- Weapon related perks
class perk_title_Civilian {
	displayName = "Civilian Perks";
	requiredPerkPoints = 1;
	requiredLevel = 0;
	requiredPerk = "";
	subtitle = "1 perk point required to unlock this tree";
	description = "These perks will benefit civilians.";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_title_Global {
	displayName = "Global Perks";
	requiredPerkPoints = 1;
	requiredLevel = 0;
	requiredPerk = "";
	subtitle = "1 perk point required to unlock this tree";
	description = "These perks will benefit everyone.";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_title_Medical {
	displayName = "Medical Perks";
	requiredPerkPoints = 1;
	requiredLevel = 0;
	requiredPerk = "";
	subtitle = "1 perk point required to unlock this tree";
	description = "These perks will train you in medical skills.";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_title_Weapons {
	displayName = "Weapon Perks";
	requiredPerkPoints = 1;
	requiredLevel = 0;
	requiredPerk = "";
	subtitle = "1 perk point required to unlock this tree";
	description = "These perks will train you in weapon skills.";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_title_Illegal {
	displayName = "Illegal Perks";
	requiredPerkPoints = 1;
	requiredLevel = 0;
	requiredPerk = "";
	subtitle = "1 perk point required to unlock this tree";
	description = "These perks will train you in illegal skills.";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};


class perk_gunsspecialist_lessRecoil_1 {
	displayName = "Recoil Compensation";
	requiredPerkPoints = 5;
	requiredLevel = 5;
	requiredPerk = "perk_title_Weapons";
	subtitle = "Level 5 Required, 5 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-5% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_2 {
	displayName = "Recoil Compensation 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "Level 16 Required, 6 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-10% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_3 {
	displayName = "Recoil Compensation 3";
	requiredPerkPoints = 7;
	requiredLevel = 25;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "Level 25 Required, 7 Perk Points";
	description = "Learn to control weapons better and lower the noticable recoil<br/><br/><t color='#10FF45'>-20% less recoil</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Paycheck
class perk_paycheck_1 {
	displayName = "Paycheck";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 2 Required, 2 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+25% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_2 {
	displayName = "Paycheck 2";
	requiredPerkPoints = 3;
	requiredLevel = 8;
	requiredPerk = "perk_paycheck_1";
	subtitle = "Level 8 Required, 3 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+50% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_3 {
	displayName = "Paycheck 3";
	requiredPerkPoints = 6;
	requiredLevel = 21;
	requiredPerk = "perk_paycheck_2";
	subtitle = "Level 21 Required, 6 Perk Points";
	description = "Receive more money on a paycheck<br/><br/><t color='#10FF45'>+100% more money per paycheck</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

// -- Faster processing
class perk_processing_1 {
	displayName = "Processing Speed";
	requiredPerkPoints = 3;
	requiredLevel = 4;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 4 Required, 3 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+10% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "Processing Speed 2";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_processing_1";
	subtitle = "Level 7 Required, 3 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+15% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "Processing Speed 3";
	requiredPerkPoints = 4;
	requiredLevel = 17;
	requiredPerk = "perk_processing_2";
	subtitle = "Level 17 Required, 4 Perk Points";
	description = "Learn to process materials more efficiently<br/><br/><t color='#10FF45'>+25% faster processing</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

// -- Faster lockpicking
class perk_locksmith_1 {
	displayName = "Locksmith";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "perk_title_Illegal";
	subtitle = "Level 7 Required, 5 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+10% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "Locksmith 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_locksmith_1";
	subtitle = "Level 16 Required, 6 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+15% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_3 {
	displayName = "Locksmith 3";
	requiredPerkPoints = 4;
	requiredLevel = 28;
	requiredPerk = "perk_locksmith_2";
	subtitle = "Level 28 Required, 4 Perk Points";
	description = "Learn to pick locks more efficiently and reduce lockpicking times on vehicles<br/><br/><t color='#10FF45'>+25% faster lockpicking</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

//Spawn with X perks
class perk_spawnWith_NVG {
	displayName = "Nightowl";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 1 Required, 1 Perk Points";
	description = "Always spawn with Night Vision Goggles";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_spawnWith_FAK {
	displayName = "Nurse";
	requiredPerkPoints = 1;
	requiredLevel = 2;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 2 Required, 1 Perk Points";
	description = "Always spawn with a Bandage";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_spawnWith_Toolkit {
	displayName = "Mechanic";
	requiredPerkPoints = 1;
	requiredLevel = 4;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 4 Required, 1 Perk Points";
	description = "Always spawn with a toolkit";
	initScript = "";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_spawnWith_Bergen {
	displayName = "Hitchhiker";
	requiredPerkPoints = 1;
	requiredLevel = 3;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 3 Required, 1 Perk Points";
	description = "Always spawn with a Bergen backpack";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_spawnWith_GPS {
	displayName = "Tracker";
	requiredPerkPoints = 1;
	requiredLevel = 4;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 4 Required, 1 Perk Points";
	description = "Always spawn with a GPS";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_spawnWith_FoodnWater {
	displayName = "Lunchbox";
	requiredPerkPoints = 1;
	requiredLevel = 6;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 6 Required, 1 Perk Points";
	description = "Always spawn with some food and water";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_spawnWith_Pickaxe {
	displayName = "Miner";
	requiredPerkPoints = 1;
	requiredLevel = 5;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 5 Required, 1 Perk Points";
	description = "Always spawn with a Pickaxe";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_spawnWith_Pistol {
	displayName = "Dirty Harry";
	requiredPerkPoints = 1;
	requiredLevel = 12;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 12 Required, 1 Perk Points";
	description = "Always spawn with a Zubr and some ammo!";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_spawnWith_Snapgun {
	displayName = "Expert Thief";
	requiredPerkPoints = 1;
	requiredLevel = 20;
	requiredPerk = "perk_title_Illegal";
	subtitle = "Level 20 Required, 1 Perk Points";
	description = "Always spawn with a Snapgun!";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

//End of spawn perks

class perk_advReb {
	displayName = "Advanced Rebel";
	requiredPerkPoints = 5;
	requiredLevel = 25;
	requiredPerk = "perk_title_Illegal";
	subtitle = "Level 25 Required, 5 Perk Points";
	description = "Gain the ability to buy the Advanced Rebel License";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
/*
class perk_openInv {
	displayName = "Open Inventories";
	requiredPerkPoints = 4;
	requiredLevel = 22;
	requiredPerk = "";
	subtitle = "Level 22 Required, 4 Perk Points";
	description = "Allows civs to open restrained player's inventories";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};
*/
class perk_Knockout {
	displayName = "TKO";
	requiredPerkPoints = 2;
	requiredLevel = 10;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 10 Required, 2 Perk Points";
	description = "Allows you to knock out players";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

//Use less food and water
class perk_betterSurvival_1 {
	displayName = "Survivalist";
	requiredPerkPoints = 1;
	requiredLevel = 2;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 2 Required, 1 Perk Points";
	description = "You don't have to eat and drink as often<br/><br/><t color='#10FF45'>-10% hunger and thirst</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterSurvival_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_betterSurvival_2 {
	displayName = "Survivalist 2";
	requiredPerkPoints = 2;
	requiredLevel = 5;
	requiredPerk = "perk_betterSurvival_1";
	subtitle = "Level 5 Required, 2 Perk Points";
	description = "You don't have to eat and drink as often<br/><br/><t color='#10FF45'>-20% hunger and thirst</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterSurvival_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_betterSurvival_3 {
	displayName = "Survivalist 3";
	requiredPerkPoints = 3;
	requiredLevel = 10;
	requiredPerk = "perk_betterSurvival_2";
	subtitle = "Level 10 Required, 3 Perk Points";
	description = "You don't have to eat and drink as often<br/><br/><t color='#10FF45'>-30% hunger and thirst</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterSurvival_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_betterExperience_1 {
	displayName = "Better EXP";
	requiredPerkPoints = 2;
	requiredLevel = 6;
	requiredPerk = "perk_title_Global";
	subtitle = "Level 6 Required, 2 Perk Points";
	description = "You are gaining more experience<br/><br/><t color='#10FF45'>25% more experience</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterExperience_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_betterExperience_2 {
	displayName = "Better EXP 2";
	requiredPerkPoints = 2;
	requiredLevel = 15;
	requiredPerk = "perk_betterExperience_1";
	subtitle = "Level 15 Required, 2 Perk Points";
	description = "You are gaining more experience<br/><br/><t color='#10FF45'>50% more experience</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterExperience_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_betterExperience_3 {
	displayName = "Better EXP 3";
	requiredPerkPoints = 2;
	requiredLevel = 23;
	requiredPerk = "perk_betterExperience_2";
	subtitle = "Level 23 Required, 2 Perk Points";
	description = "You are gaining more experience<br/><br/><t color='#10FF45'>100% more experience</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_betterExperience_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_seeGangMembers {
	displayName = "Gang member locations";
	requiredPerkPoints = 2;
	requiredLevel = 10;
	requiredPerk = "perk_title_Civilian";
	subtitle = "Level 10 Required, 2 Perk Points";
	description = "Allows you to see your gang members on the map (Requires GPS)";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gatherCocaine {
	displayName = "Gather Cocaine";
	requiredPerkPoints = 2;
	requiredLevel = 15;
	requiredPerk = "perk_title_Illegal";
	subtitle = "Level 15 Required, 2 Perk Points";
	description = "Allows you to gather and process Cocaine";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gatherLSD {
	displayName = "Gather LSD";
	requiredPerkPoints = 2;
	requiredLevel = 25;
	requiredPerk = "perk_gatherCocaine";
	subtitle = "Level 25 Required, 2 Perk Points";
	description = "Allows you to gather and process LSD";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

scriptName "functions_betterSurvival_2";
/*--------------------------------------------------------------------
	Perk by Katt for Havoc Life

  To be used with Maverick Application's Talent Tree
--------------------------------------------------------------------*/
#define __filename "functions_betterSurvival_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_betterSurvival_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_survivalMultiplier = 1.2;
};

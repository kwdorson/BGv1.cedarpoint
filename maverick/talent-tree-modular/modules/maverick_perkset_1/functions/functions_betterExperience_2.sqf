scriptName "functions_betterExperience_2";
/*--------------------------------------------------------------------
	Perk by Pepper for Havoc Life

  To be used with Maverick Application's Talent Tree
--------------------------------------------------------------------*/
#define __filename "functions_betterExperience_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_betterExperience_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_experienceMultiplier = 1.5;
};

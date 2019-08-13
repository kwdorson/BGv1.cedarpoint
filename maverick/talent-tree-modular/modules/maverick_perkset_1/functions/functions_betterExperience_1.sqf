scriptName "functions_betterExperience_1";
/*--------------------------------------------------------------------
	Perk by Pepper for Havoc Life

  To be used with Maverick Application's Talent Tree
--------------------------------------------------------------------*/
#define __filename "functions_betterExperience_1.sqf"

_ownsDependency1 = [life_currentExpPerks, "perk_betterExperience_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_betterExperience_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_experienceMultiplier = 1.25;
};

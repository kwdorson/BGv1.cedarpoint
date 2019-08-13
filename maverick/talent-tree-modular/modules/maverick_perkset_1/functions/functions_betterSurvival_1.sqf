scriptName "functions_betterSurvival_1";
/*--------------------------------------------------------------------
	Perk by Katt for Havoc Life

  To be used with Maverick Application's Talent Tree
--------------------------------------------------------------------*/
#define __filename "functions_betterSurvival_1.sqf"

_ownsDependency1 = [life_currentExpPerks, "perk_betterSurvival_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "perk_betterSurvival_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_survivalMultiplier = 1.1;
};

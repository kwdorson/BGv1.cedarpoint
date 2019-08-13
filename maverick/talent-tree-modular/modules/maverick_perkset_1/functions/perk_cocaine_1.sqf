scriptName "perk_cocaine_1";
/*--------------------------------------------------------------------
Written by NS Modified 06/06/2019
--------------------------------------------------------------------*/
#define __filename "perk_cocaine_1.sqf"

_ownsDependency1 = [life_currentExpPerks, "perk_cocaine_1"] call mav_ttm_fnc_hasPerk;

if (_ownsDependency1) then {
    mav_ttm_var_cocaine = 1;
};

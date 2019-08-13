#include "..\..\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
private "_target","_perk";
_target = param [0,objNull,[objNull]];
_perk = [life_currentExpPerks, "perk_Knockout"] call mav_ttm_fnc_hasPerk;

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
if (!_perk) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync",RCLIENT];
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;

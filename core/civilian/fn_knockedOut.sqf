#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*/
private "_obj";
params [
    ["_target",objNull,[objNull]],
    ["_who","",[""]]
];

if (isNull _target) exitWith {};
if !(_target isEqualTo player) exitWith {};
if (_who isEqualTo "") exitWith {};

titleText[format [localize "STR_Civ_KnockedOut",_who],"PLAIN"];

life_isknocked = true;
[] call life_fnc_ragdoll;
sleep 9;
life_isknocked = false;
player setVariable ["robbed",false,true];
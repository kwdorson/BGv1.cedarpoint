#include "..\..\script_macros.hpp"
/*
    File: fn_safeTake.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private ["_ctrl","_num","_safeInfo"];
disableSerialization;

if ((lbCurSel 6669) isEqualTo -1) exitWith {[localize "STR_Civ_SelectItem",true,"slow"] call life_fnc_notificationSystem;};
_ctrl = CONTROL_DATA(6669);
_num = ctrlText 6662;
_safeInfo = life_safeObj getVariable ["safe",0];

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat",true,"slow"] call life_fnc_notificationSystem;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_Cop_VaultUnder1",true,"slow"] call life_fnc_notificationSystem;};
if (!(_ctrl isEqualTo "counterfitCash")) exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > _safeInfo) exitWith {hint format [localize "STR_Civ_IsntEnoughGold",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};


//Take it
if (!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_CouldntAdd",true,"slow"] call life_fnc_notificationSystem;};
life_safeObj setVariable ["safe",_safeInfo - _num,true];
[life_safeObj] call life_fnc_safeInventoryBank;

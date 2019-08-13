#include "..\..\script_macros.hpp"
/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
private ["_vehicle","_vid","_pid","_unit","_price","_price","_storageFee","_purchasePrice"];

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
_nowObjects = _entreprise getVariable ["entreprise_objects",[]];

_markerSpawn = "";
{
    if !(_x isEqualType objNull) exitWith {
        _markerSpawn = _x;
    };
} forEach _nowObjects;

if (_markerSpawn isEqualTo "") exitWith {
    hint (["STR_CANT_SPAWN_VEHICLE"] call max_entreprise_fnc_localize);
};

disableSerialization;
if ((lbCurSel 1802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[1802,(lbCurSel 1802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
_vid = lbValue[1802,(lbCurSel 1802)];
_pid = _entreprise getVariable ["entreprise_pdg_pid",""];
if (_pid == "") exitWith {};
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

if (life_HC_isActive) then {
    [_vid,_pid,(getMarkerPos maxence_entreprise_sp),_unit,_price,markerDir maxence_entreprise_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
} else {
    [_vid,_pid,(getMarkerPos maxence_entreprise_sp),_unit,_price,markerDir maxence_entreprise_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
};

hint localize "STR_Garage_SpawningVeh";
closeDialog 0;
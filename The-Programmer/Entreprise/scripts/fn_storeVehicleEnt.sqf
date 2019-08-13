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
private ["_nearVehicles","_vehicle"];
_obj = cursorObject;
if (isNull _obj) exitWith {};
_requiredLicense = _obj getVariable ["required_license",""];
if (_requiredLicense == "") exitWith {};
if !(missionNamespace getVariable [_requiredLicense,false]) exitWith {hint (["STR_YOU_ARE_NOT_ALLOWED"] call max_entreprise_fnc_localize)};

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
_entreprise_id = _entreprise getVariable ["entreprise_id",0];
if (_entreprise_id == 0) exitWith {};

_valid = false;
if !(isNull objectParent player) then {
    _vehicle = vehicle player;
} else {
    _nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30];
    if (count _nearVehicles > 0) then {
        {
            if (!isNil "_vehicle") exitWith {};
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if (count _vehData  > 0) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((_entreprise getVariable ["entreprise_pdg_pid",""]) == _vehOwner) exitWith {
                    _vehicle = _x;
                    _valid = true;
                };
            };
        } forEach _nearVehicles;
    };
};

if !(_valid) exitWith {hint (["STR_CANT_STORE_VEHICLE"] call max_entreprise_fnc_localize)};
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {hint localize "STR_Garage_SQLError_Destroyed"};
if (count (_vehicle getVariable ["dbInfo",[]]) isEqualTo 0) exitWith {};

[_vehicle,player,(["STR_SUCCES_STORE_VEHICLE"] call max_entreprise_fnc_localize),_entreprise_id] remoteExec ["max_entreprise_fnc_storeVehicleEntreprise",2];

hint localize "STR_Garage_Store_Server";
life_garage_store = true;

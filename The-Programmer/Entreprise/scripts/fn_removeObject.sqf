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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((lbCurSel 5482) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_OBJECT"] call max_entreprise_fnc_localize)};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "positions_entreprises";
_marker = _entreprise getVariable ["entreprise_position",""];
if (player distance (getMarkerPos (getText (_curConfig >> _marker >> "markerVar"))) > getNumber (_curConfig >> _marker >> "radius")) exitWith {};
_entreprise_id = _entreprise getVariable ["entreprise_id",0];

_className = lbData[5482,(lbCurSel 5482)];
_nowObjects = _entreprise getVariable ["entreprise_objects",[]];
_nowObjectsTXT = _entreprise getVariable ["entreprise_objects_txt",[]];
_exit = true;

if (_className == "sp_marker") then {
    {
        if !(_x isEqualType objNull) then {
            if (_x == format ["spawn_veh_entreprise_%1",_entreprise_id]) exitWith {
                _nowObjects deleteAt _forEachIndex;
                _entreprise setVariable ["entreprise_objects",_nowObjects,true];
                deleteMarker _x;
                _exit = false;
            };
        };
    } forEach _nowObjects;
} else {
    {
        if (_x isEqualType objNull) then {
            if ((typeof _x) == _className) exitWith {
                _nowObjects deleteAt _forEachIndex;
                _entreprise setVariable ["entreprise_objects",_nowObjects,true];
                deleteVehicle _x;
                _exit = false;
            };
        };
    } forEach _nowObjects;
};

if (_exit) exitWith {};

{
    if ((_x select 0) isEqualTo _className) exitWith {
        _nowObjectsTXT deleteAt _forEachIndex;
        _entreprise setVariable ["entreprise_objects_txt",_nowObjectsTXT,true];
        [(_entreprise getVariable ["entreprise_id",0]),8,(_entreprise getVariable ["entreprise_objects_txt",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
    };
} forEach _nowObjectsTXT;

[] spawn max_entreprise_fnc_objectsPlaceMenu;

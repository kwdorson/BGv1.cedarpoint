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

_className = lbData[5482,(lbCurSel 5482)];
_nowObjects = _entreprise getVariable ["entreprise_objects",[]];

maxence_placing_object_type_marker = false;
if (_className == "sp_marker") then {_className = "Sign_Arrow_Yellow_F"; hint (["STR_PLACE_SPAWN_POINT"] call max_entreprise_fnc_localize);};

_index = 0;
if ((count _nowObjects) > 0) then {
    {
        if (_x isEqualType objNull) then {
            if ((typeof _x) == _className) then {_index = _index + 1;};
        } else {
            if (_x == _className) then {_index = _index + 1;};
        };
    } forEach _nowObjects;
};
if (_index != 0) exitWith {};

closeDialog 0;

maxence_placing_object_active = true;
maxence_placing_object = _className createVehicle (position player);

maxence_placing_object attachTo [player,[0,3,0.5]];
maxence_placing_object enableSimulationGlobal false;
_originalPos = position maxence_placing_object;
_playerOriginalPos = position player;

_event = (findDisplay 46) displayAddEventHandler ["KeyDown","if (maxence_placing_object_active && ((_this select 1) == 57)) then {[] spawn max_entreprise_fnc_placeObjectCompleted;};"];

waitUntil {
    if (maxence_placing_object_type_marker) then {
        if (((getMarkerPos maxence_placing_object) distance _originalPos > 50 || player distance _playerOriginalPos > 50) && maxence_placing_object_active) then {
            deleteMarker maxence_placing_object;
            maxence_placing_object_active = false;
            maxence_placing_object_type_marker = false;
            maxence_placing_object = ObjNull;
        };
    } else {
        if ((maxence_placing_object distance _originalPos > 50 || player distance _playerOriginalPos > 50) && maxence_placing_object_active) then {
            deleteVehicle maxence_placing_object;
            maxence_placing_object_active = false;
            maxence_placing_object = ObjNull;
        };
    };
    uiSleep 1;
    !maxence_placing_object_active;
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown",_event];

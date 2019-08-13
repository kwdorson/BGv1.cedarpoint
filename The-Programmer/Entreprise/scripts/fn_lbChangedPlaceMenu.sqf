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

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "positions_entreprises";
_marker = _entreprise getVariable ["entreprise_position",""];
if (player distance (getMarkerPos (getText (_curConfig >> _marker >> "markerVar"))) > getNumber (_curConfig >> _marker >> "radius")) exitWith {};

disableSerialization;
_display = findDisplay 5480;
_data = _this select 0;
_list = _data select 0;
_index = _data select 1;
_className = _list lbData _index;

_nowObjects = _entreprise getVariable ["entreprise_objects",[]];

_index = 0;
if ((count _nowObjects) > 0) then {
    {
        if (_x isEqualType objNull) then {
            if ((typeof _x) == _className) then {_index = _index + 1;};
        } else {
            if (_className == "sp_marker") then {_index = _index + 1;};
        };
    } forEach _nowObjects;
};

if (_index != 0) then {
    (_display displayCtrl 5483) ctrlSetText (["STR_REMOVE_ITEM_BUTTON"] call max_entreprise_fnc_localize);
    (_display displayCtrl 5483) buttonSetAction "[] spawn max_entreprise_fnc_removeObject;";
} else {
    (_display displayCtrl 5483) ctrlSetText (["STR_PLACE_ITEM_BUTTON"] call max_entreprise_fnc_localize);
    (_display displayCtrl 5483) buttonSetAction "[] spawn max_entreprise_fnc_placeObject;";
};

ctrlShow [5483,true];

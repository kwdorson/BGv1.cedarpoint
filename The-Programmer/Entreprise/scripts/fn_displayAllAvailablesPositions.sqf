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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_position",""]) != "") exitWith {};
if (selecting_position) exitWith {};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
_allPos = [];

for "_i" from 0 to count(_curConfig >> "positions_entreprises")-1 do {
    _curCheck = ((_curConfig >> "positions_entreprises") select _i);
    _allPos pushBack (configName _curCheck);
};


if ((count _allPos) < 1) exitWith {hint (["STR_NO_AVAILABLE_POSITION"] call max_entreprise_fnc_localize);};
selecting_position = true;

{
    _curMarker = (_x select 1) getVariable ["entreprise_position",""];
    {
        if (_curMarker == _x) exitWith {
            _allPos deleteAt (_allPos find _x);
        };
    } forEach _allPos;
} forEach maxence_all_entreprises;

if ((count _allPos) < 1) exitWith {hint (["STR_NO_AVAILABLE_POSITION"] call max_entreprise_fnc_localize); selecting_position = false;};

{
    _marker = getText (_curConfig >> "positions_entreprises" >> _x >> "markerVar");
    _marker setMarkerAlphaLocal 1;
    _marker setMarkerTextLocal format [(["STR_AVAILABLE_POSITION"] call max_entreprise_fnc_localize),[(getNumber (_curConfig >> "positions_entreprises" >> _x >> "price"))] call life_fnc_numberText];
    _marker setMarkerColorLocal "ColorRed";
} forEach _allPos;

closeDialog 0;
hint (["STR_SELECT_A_POSITION"] call max_entreprise_fnc_localize);

maxence_allPos_selecting = _allPos;
_event = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 4) && ((_this select 1) == 46)) then {[] spawn max_entreprise_fnc_buyNewPosition;};"];

[] spawn {
    uiSleep 120;
    if (selecting_position) then {
        {
            (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "positions_entreprises" >> _x >> "markerVar")) setMarkerAlphaLocal 0;
        } forEach maxence_allPos_selecting;
        selecting_position = false;
    };
};

waitUntil {!selecting_position};
(findDisplay 46) displayRemoveEventHandler ["KeyDown",_event];
maxence_allPos_selecting = nil;

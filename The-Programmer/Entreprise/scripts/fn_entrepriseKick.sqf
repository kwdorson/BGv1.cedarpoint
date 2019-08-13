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
private ["_entreprise"];
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize);};

if ((lbCurSel 5453) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_entreprise_fnc_localize)};
_player = lbData[5453,(lbCurSel 5453)];
_player = call compile format ["%1",_player];
_pid = _player select 0;
_name = _player select 1;

if (_pid isEqualTo (getPlayerUID player)) exitWith {hint (["STR_CANNOT_KICK_YOURSELF"] call max_entreprise_fnc_localize)};

_oldMembers = _entreprise getVariable ["entreprise_members",[]];
_index = -1;
_rank = 0;

if ((count _oldMembers) > 0) then {
    {
        if (_pid == (_x select 0)) exitWith {
            _index = _forEachIndex;
            _rank = (_x select 2);
        };
    } forEach _oldMembers;
};

if (_index == -1) exitWith {};
if (((_entreprise getVariable "entreprise_pdg_pid") != (getPlayerUID player)) && (_rank != 0)) exitWith {hint (["STR_CANNOT_KICK_UPRANK"] call max_entreprise_fnc_localize)};

_action = [
    format [(["STR_KICK_PLAYER_TEXT"] call max_entreprise_fnc_localize),_name],
    (["STR_KICK_PLAYER_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

_oldMembers deleteAt _index;
_entreprise setVariable ["entreprise_members",_oldMembers,true];
[(_entreprise getVariable ["entreprise_id",0]),1,(_entreprise getVariable ["entreprise_members",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

hint format [(["STR_KICK_ENTERPRISE_SUCCES"] call max_entreprise_fnc_localize),_name];

{
    if ((getPlayerUID _x) == _pid) exitWith {
        [player,_entreprise] remoteExecCall ["max_entreprise_fnc_entrepriseBeKicked",_x];
    };
} forEach playableUnits;
[] call max_entreprise_fnc_editEntrepriseMenu;
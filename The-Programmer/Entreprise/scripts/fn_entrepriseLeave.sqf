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

_action = [
    (["STR_LEAVE_ENTERPRISE_TEXT"] call max_entreprise_fnc_localize),
    (["STR_LEAVE_ENTERPRISE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

_members = _entreprise getVariable ["entreprise_members",[]];
_index = -1;

if ((count _members) > 0) then {
    {
        if ((_x select 0) == (getPlayerUID player)) exitWith {
            _index = _forEachIndex;
        };
    } forEach _members;
};

if (_index == -1) exitWith {};

_members deleteAt _index;
_entreprise setVariable ["entreprise_members",_members,true];
[(_entreprise getVariable ["entreprise_id",0]),1,(_entreprise getVariable ["entreprise_members",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

player setVariable ["current_entreprise",objNull,true];
missionNamespace setVariable [format ["entreprise_%1",(_entreprise getVariable ["entreprise_id",0])],false];
missionNamespace setVariable [format ["entreprise_%1_full_acces",(_entreprise getVariable ["entreprise_id",0])],false];
hint format [(["STR_LEAVE_ENTERPRISE_SUCCES"] call max_entreprise_fnc_localize),(_entreprise getVariable "entreprise_name")];
closeDialog 0;

{
    if (_x isEqualType objNull) then {
        removeAllActions _x;
    };
} forEach (_entreprise getVariable ["entreprise_objects",[]]);

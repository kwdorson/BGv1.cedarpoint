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
private ["_from","_entreprise"];
params [
    ["_from",objNull,[objNull]],
    ["_entreprise",objNull,[objNull]]
];

if ((_from isEqualTo "") || isNull _entreprise) exitWith {};
if (!isNull (player getVariable ["current_entreprise",objNull])) exitWith {[1,(["STR_PLAYER_ALREADY_IN_ENTERPRISE"] call max_entreprise_fnc_localize)] remoteExecCall ["life_fnc_broadcast",_from];};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
_name_entreprise = _entreprise getVariable ["entreprise_name",""];

_action = [
    format [(["STR_INVITE_PLAYER_ENTERPRISE_TEXT_RECEIVE"] call max_entreprise_fnc_localize),_name_entreprise,_from getVariable ["realname",name _from]],
    (["STR_INVITE_PLAYER_ENTERPRISE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {[1,format [(["STR_REFUSE_INVITE"] call max_entreprise_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];};

[1,format [(["STR_ACCEPT_INVITE"] call max_entreprise_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];
hint format [(["STR_ACCEPT_INVITE_MSG"] call max_entreprise_fnc_localize),_name_entreprise];
player setVariable ["current_entreprise",_entreprise];
_members = _entreprise getVariable ["entreprise_members",[]];
_members pushBack [(getPlayerUID player),(name player),0];
_entreprise setVariable ["entreprise_members",_members,true];
[(_entreprise getVariable ["entreprise_id",0]),1,(_entreprise getVariable ["entreprise_members",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

_objects = _entreprise getVariable ["entreprise_objects",[]];
if ((count _objects) > 0) then {
    {
        if (_x isEqualType objNull) then {
            switch (typeOf _x) do { 
                case "Land_InfoStand_V1_F" : {
                    _markerVar = (_curConfig >> "positions_entreprises" >> (_entreprise getVariable ["entreprise_position",""]));
                    if (!isClass _markerVar) exitWith {};
                    _markerVar = getText (_markerVar >> "markerVar");
                    _entreprise_name = _entreprise getVariable ["entreprise_name",""];
                    [_x,0,_markerVar,_entreprise_name] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",player];
                };
                case "Land_InfoStand_V2_F" : {
                    [_x,1] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",player];
                }; 
            };
        };
    } forEach _objects;
};

missionNamespace setVariable [format ["entreprise_%1",(_entreprise getVariable ["entreprise_id",0])],true];

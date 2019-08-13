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
private ["_unit"];
disableSerialization;

if ((lbCurSel 5454) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_entreprise_fnc_localize)};
_unit = call compile format ["%1",CONTROL_DATA(5454)];

if (isNull _unit) exitWith {};
if (_unit == player) exitWith {};

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};

_type_entreprise = _entreprise getVariable ["entreprise_type",""];
_max_employes = getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type_entreprise >> "max_players");
if (count(_entreprise getVariable ["entreprise_members",[]]) >= _max_employes) exitWith {hint (["STR_HIT_MAX_PLAYERS"] call max_entreprise_fnc_localize)};

_action = [
    format [(["STR_INVITE_PLAYER_ENTERPRISE_TEXT"] call max_entreprise_fnc_localize),_unit getVariable ["realname",name _unit]],
    (["STR_INVITE_PLAYER_ENTERPRISE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

[player,_entreprise] remoteExec ["max_entreprise_fnc_invitePlayerEntreprise",_unit];
hint format [(["STR_INVITE_SEND"] call max_entreprise_fnc_localize),_unit getVariable ["realname",name _unit]];

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
private ["_type","_unit"];
if (!([(name player),(getPlayerUID player)] in maxence_gouverneur)) exitWith {};

_type = param [0,0,[0]];
disableSerialization;
if (_type isEqualTo 0) exitWith {};

switch (_type) do { 
    case 1 : {
        if ((lbCurSel 1021) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_gouvernement_fnc_localize);};
        _unit = call compile format ["%1",CONTROL_DATA(1021)];

        if (isNull _unit) exitWith {};
        if (_unit == player) exitWith {};

        _maxMinistres = getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "maximum_ministres");
        if ((count maxence_ministres) >= _maxMinistres) exitWith {hint (["STR_HIT_MAX_PLAYERS"] call max_gouvernement_fnc_localize);};

        _action = [
            format [(["STR_INVITE_PLAYER_GOUVERNEMENT_MINISTRE_TEXT"] call max_gouvernement_fnc_localize),_unit getVariable ["realname",name _unit]],
            (["STR_INVITE_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {};

        [player,_type] remoteExec ["max_gouvernement_fnc_receiveInviteGouvernement",_unit];
        hint format [(["STR_SEND_INVITE_MINISTRE_GOUVERNEMENT"] call max_gouvernement_fnc_localize),_unit getVariable ["realname",name _unit]];
    };

    case 2 : {
        if ((lbCurSel 1022) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_gouvernement_fnc_localize);};
        _unit = call compile format ["%1",CONTROL_DATA(1022)];

        if (isNull _unit) exitWith {};
        if (_unit == player) exitWith {};

        _maxSecurity = getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "maximum_security");
        if ((count maxence_ministres) >= _maxSecurity) exitWith {hint (["STR_HIT_MAX_PLAYERS"] call max_gouvernement_fnc_localize);};

        _action = [
            format [(["STR_INVITE_PLAYER_GOUVERNEMENT_SECURITY_TEXT"] call max_gouvernement_fnc_localize),_unit getVariable ["realname",name _unit]],
            (["STR_INVITE_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {};

        [player,_type] remoteExec ["max_gouvernement_fnc_receiveInviteGouvernement",_unit];
        hint format [(["STR_SEND_INVITE_SECURITY_GOUVERNEMENT"] call max_gouvernement_fnc_localize),_unit getVariable ["realname",name _unit]];
    };
};

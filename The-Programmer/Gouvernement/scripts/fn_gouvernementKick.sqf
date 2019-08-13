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
_type = param [0,0,[0]];

if (!([(name player),(getPlayerUID player)] in maxence_gouverneur)) exitWith {};
if (_type isEqualTo 0) exitWith {};
disableSerialization;

switch (_type) do { 
    case 1 : {
        if ((lbCurSel 1011) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_gouvernement_fnc_localize);};
        _unit = call compile format ["%1",CONTROL_DATA(1011)];

        _action = [
            format [(["STR_KICK_PLAYER_GOUVERNEMENT_MINISTRE_TEXT"] call max_gouvernement_fnc_localize),(_unit select 0)],
            (["STR_KICK_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {};

        maxence_ministres deleteAt (maxence_ministres find _unit);
        publicVariable "maxence_ministres";
        [maxence_gouverneur,maxence_ministres,maxence_security] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

        {
            if ((getPlayerUID _x) isEqualTo (_unit select 1)) exitWith {
                [1,format [(["STR_BE_KICKED_GOUVERNEMENT_SUCCES"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_x];
            };
        } forEach playableUnits;

        hint format [(["STR_KICK_GOUVERNEMENT_SUCCES"] call max_gouvernement_fnc_localize),(_unit select 0)];
    };

    case 2 : {
        if ((lbCurSel 1012) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_gouvernement_fnc_localize);};
        _unit = call compile format ["%1",CONTROL_DATA(1012)];

        _action = [
            format [(["STR_KICK_PLAYER_GOUVERNEMENT_SECURITY_TEXT"] call max_gouvernement_fnc_localize),(_unit select 0)],
            (["STR_KICK_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {};

        maxence_security deleteAt (maxence_security find _unit);
        publicVariable "maxence_security";
        [maxence_gouverneur,maxence_ministres,maxence_security] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

        {
            if ((getPlayerUID _x) isEqualTo (_unit select 1)) exitWith {
                [1,format [(["STR_BE_KICKED_GOUVERNEMENT_SUCCES"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_x];
            };
        } forEach playableUnits;

        hint format [(["STR_KICK_GOUVERNEMENT_SUCCES"] call max_gouvernement_fnc_localize),(_unit select 0)];
    };
};

if ([(name player),(getPlayerUID player)] in maxence_gouverneur) then {
    [] spawn max_gouvernement_fnc_governorMenu;
} else {
    [] spawn max_gouvernement_fnc_ministreMenu;
};

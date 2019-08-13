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
private ["_from","_type"];
_from = param [0,objNull,[objNull]];
_type = param [1,0,[0]];
if (([(name player),(getPlayerUID player)] in maxence_ministres) || ([(name player),(getPlayerUID player)] in maxence_security)) exitWith {[1,format [(["STR_REFUSE_INVITE"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];};

if ((isNull _from) || _type isEqualTo 0) exitWith {};

switch (_type) do { 
    case 1 : {
        _action = [
            format [(["STR_INVITE_PLAYER_GOUVERNEMENT_MINISTRE_TEXT_RECEIVE"] call max_gouvernement_fnc_localize),_from getVariable ["realname",name _from]],
            (["STR_INVITE_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {[1,format [(["STR_REFUSE_INVITE"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];};

        maxence_ministres pushBack [(name player),(getPlayerUID player)];
        publicVariable "maxence_ministres";
        [maxence_gouverneur,maxence_ministres,maxence_security] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

        [1,format [(["STR_ACCEPT_INVITE"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];
        hint (["STR_ACCEPT_INVITE_MSG"] call max_gouvernement_fnc_localize);
    }; 
    case 2 : {
        _action = [
            format [(["STR_INVITE_PLAYER_GOUVERNEMENT_SECURITY_TEXT_RECEIVE"] call max_gouvernement_fnc_localize),_from getVariable ["realname",name _from]],
            (["STR_INVITE_PLAYER_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
            (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
            (["STR_UNDO"] call max_gouvernement_fnc_localize)
        ] call BIS_fnc_guiMessage;

        if !(_action) exitWith {[1,format [(["STR_REFUSE_INVITE"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];};

        maxence_security pushBack [(name player),(getPlayerUID player)];
        publicVariable "maxence_security";
        [maxence_gouverneur,maxence_ministres,maxence_security] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

        [1,format [(["STR_ACCEPT_INVITE"] call max_gouvernement_fnc_localize),name player]] remoteExecCall ["life_fnc_broadcast",_from];
        hint (["STR_ACCEPT_INVITE_MSG"] call max_gouvernement_fnc_localize);
    }; 
};

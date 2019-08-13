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
if ([(name player),(getPlayerUID player)] in maxence_gouverneur) exitWith {};
if ((!([(name player),(getPlayerUID player)] in maxence_ministres)) && (!([(name player),(getPlayerUID player)] in maxence_security))) exitWith {};

_action = [
    (["STR_LEAVE_GOUVERNEMENT_TEXT"] call max_gouvernement_fnc_localize),
    (["STR_DISBAND_GOUVERNEMENT_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

_index = -1;
_exit = false;

if ((count maxence_ministres) > 0) then {
    {
        if ((_x select 1) == (getPlayerUID player)) exitWith {
            _index = _forEachIndex;
        };
    } forEach maxence_ministres;
};

if (_index == -1) then {
    _index2 = -1;
    if ((count maxence_security) > 0) then {
        {
            if ((_x select 1) == (getPlayerUID player)) exitWith {
                _index2 = _forEachIndex;
            };
        } forEach maxence_security;
    };
    if (_index2 == -1) exitWith {_exit = true;};
    maxence_security deleteAt _index2;
    publicVariable "maxence_security";
} else {
    maxence_ministres deleteAt _index;
    publicVariable "maxence_ministres";
};

if (_exit) exitWith {};

[maxence_gouverneur,maxence_ministres,maxence_security] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

_message = format [(["STR_GOVERNEMENT_LEAVE_GLOBAL"] call max_gouvernement_fnc_localize),(name player)];
_from = (["STR_FROM_GLOBAL"] call max_gouvernement_fnc_localize);
_playerUID = getPlayerUID player;
{
    _xUID = getPlayerUID _x;
    if (_playerUID != _xUID) then {
        [_message,_from] remoteExec ["max_gouvernement_fnc_gouvernementNotification",_x];
    };
} forEach playableUnits;

closeDialog 0;
hint (["STR_SUCCES_LEAVE_GOVERNEMENT"] call max_gouvernement_fnc_localize);

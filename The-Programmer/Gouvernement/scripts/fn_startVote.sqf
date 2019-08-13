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
if (maxence_gouvernement_vote_processing) exitWith {hint (["STR_ERROR_VOTE_IN_PROCESS"] call max_gouvernement_fnc_localize);};
_data = param [0,[],[[]]];

_action = [
    (["STR_START_VOTE_TEXT"] call max_gouvernement_fnc_localize),
    (["STR_START_VOTE_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {closeDialog 0;};
closeDialog 0;

maxence_gouvernement_vote_processing = true;
publicVariable "maxence_gouvernement_vote_processing";
maxence_election_candidats = _data;
publicVariable "maxence_election_candidats";
[1,_data] remoteExec ["max_gouvernement_fnc_updateStateVote",2];

_message = (["STR_SUCCESS_START_VOTE_GLOBAL"] call max_gouvernement_fnc_localize);
_from = (["STR_FROM_GLOBAL"] call max_gouvernement_fnc_localize);
_adminUID = getPlayerUID player;
{
    _xUID = getPlayerUID _x;
    if (_adminUID != _xUID) then {
        [_message,_from] remoteExec ["max_gouvernement_fnc_gouvernementNotification",_x];
    };

    [[1,[0]]] remoteExec ["max_gouvernement_fnc_requestAdd",_x];
} forEach playableUnits;

[] spawn max_gouvernement_fnc_electionMenu;
hint (["STR_SUCCESS_START_VOTE"] call max_gouvernement_fnc_localize);

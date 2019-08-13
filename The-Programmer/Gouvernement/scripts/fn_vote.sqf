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
if (maxence_has_voted) exitWith {};
_type = param [0,0,[0]];

_curData = maxence_election_candidats select _type;

_action = [
    format [(["STR_CONFIRM_VOTE_TEXT"] call max_gouvernement_fnc_localize),(_curData select 0)],
    (["STR_CONFIRM_VOTE_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

maxence_has_voted = true;
[] spawn max_gouvernement_fnc_electionMenu;
[_type,(getPlayerUID player)] remoteExec ["max_gouvernement_fnc_voteUpdate",2];

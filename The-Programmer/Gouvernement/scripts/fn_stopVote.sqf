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
if !(maxence_gouvernement_vote_processing) exitWith {};

_action = [
    (["STR_STOP_VOTE_TEXT"] call max_gouvernement_fnc_localize),
    (["STR_STOP_VOTE_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

_dataWinner = [];
_nbVotes = 0;
_nbTotalVotes = 0;
_nbWinners = 0;
{
    _curNbVote = (_x select 2);
    if (_curNbVote > _nbVotes) then {
        _nbVotes = _curNbVote;
        _dataWinner = _x;
        _nbWinners = 1;
    } else {
        if (_curNbVote == _nbVotes) then {
            _nbWinners = _nbWinners + 1;
            _dataWinner pushBack _x;
        };
    };
    _nbTotalVotes = _nbTotalVotes + _curNbVote;
} forEach maxence_election_candidats;

if (_nbWinners > 1) then {
    _action = [
        (["STR_MORE_ONE_WINNER_VOTE_TEXT"] call max_gouvernement_fnc_localize),
        (["STR_STOP_VOTE_HEADER"] call max_gouvernement_fnc_localize),
        (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
        (["STR_UNDO"] call max_gouvernement_fnc_localize)
    ] call BIS_fnc_guiMessage;
    _dataWinner = selectRandom _dataWinner;
};

if !(_action) exitWith {};

maxence_gouvernement_vote_processing = false;
publicVariable "maxence_gouvernement_vote_processing";

{
    if (_x isEqualTo _dataWinner) then {
        _curData = [(_x select 0),(_x select 1),(_x select 2),(((_x select 2) / _nbTotalVotes) * 100),1];
        maxence_election_candidats set [_forEachIndex,_curData];
    } else {
        _curData = [(_x select 0),(_x select 1),(_x select 2),(((_x select 2) / _nbTotalVotes) * 100),0];
        maxence_election_candidats set [_forEachIndex,_curData];
    };
} forEach maxence_election_candidats;
publicVariable "maxence_election_candidats";

[0,maxence_election_candidats] remoteExec ["max_gouvernement_fnc_updateStateVote",2];

_gouverneur = [[(_dataWinner select 0),(_dataWinner select 1)]];
maxence_gouverneur = _gouverneur;
publicVariable "maxence_gouverneur";
maxence_ministres = [];
publicVariable "maxence_ministres";
maxence_security = [];
publicVariable "maxence_security";
[_gouverneur] remoteExec ["max_gouvernement_fnc_updateEndVote",2];

_message = format [(["STR_SUCCESS_STOP_VOTE_GLOBAL"] call max_gouvernement_fnc_localize),(_dataWinner select 0),(str (_dataWinner select 3) + "%")];
_from = (["STR_FROM_GLOBAL"] call max_gouvernement_fnc_localize);
_adminUID = getPlayerUID player;
{
    _xUID = getPlayerUID _x;
    if (_adminUID != _xUID) then {
        if (_xUID isEqualTo (_dataWinner select 1)) then {
            [] remoteExec ["max_gouvernement_fnc_initGouvernement",_x];
            _messageWinner = format [(["STR_WINNER_ELECTION"] call max_gouvernement_fnc_localize),(str (_dataWinner select 3) + "%")];
            [_messageWinner,_from] remoteExec ["max_gouvernement_fnc_gouvernementNotification",_x];
        } else {
            [_message,_from] remoteExec ["max_gouvernement_fnc_gouvernementNotification",_x];
        };
    };
} forEach playableUnits;

[] spawn max_gouvernement_fnc_electionMenu;
hint (["STR_SUCCESS_STOP_VOTE"] call max_gouvernement_fnc_localize);

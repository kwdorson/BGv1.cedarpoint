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
if (maxence_gouvernement_vote_processing) exitWith {};

_name1 = ctrlText 1406;
_name2 = ctrlText 1407;
_name3 = ctrlText 1408;
_name4 = ctrlText 1409;
_name5 = ctrlText 1410;

if ((_name1 isEqualTo "") && (_name2 isEqualTo "") && (_name3 isEqualTo "") && (_name4 isEqualTo "") && (_name5 isEqualTo "")) exitWith {hint (["STR_NO_NAME_ENTRY"] call max_gouvernement_fnc_localize);};

[[_name1,_name2,_name3,_name4,_name5]] remoteExec ["max_gouvernement_fnc_startVoteCheck",2];

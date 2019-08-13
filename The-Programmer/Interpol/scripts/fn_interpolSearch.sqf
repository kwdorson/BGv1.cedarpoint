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
_prenom = ctrlText 6001;
if (_prenom isEqualTo (["STR_FIRSTNAME_SEARCH_BAR"] call max_interpol_fnc_localize) || _prenom isEqualTo "") exitWith {hint (["STR_BAD_FIRSTNAME"] call max_interpol_fnc_localize);};

[1,_prenom] remoteExec ["max_interpol_fnc_getInterpol",2];
(CONTROL(6000,6004)) ctrlSetStructuredText parseText "";
(CONTROL(6000,6004)) lbSetCurSel -1;

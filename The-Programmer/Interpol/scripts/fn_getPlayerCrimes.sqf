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
if ((lbCurSel 6003) isEqualTo -1) exitWith {};
_data = lbData[6003,(lbCurSel 6003)];
_data = call compile format ["%1",_data];

closeDialog 0;
[_data,player] remoteExec ["max_interpol_fnc_getCrimes",2];

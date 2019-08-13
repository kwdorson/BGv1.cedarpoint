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
if ([(name player),(getPlayerUID player)] in maxence_gouverneur) then {
    [1] spawn max_gouvernement_fnc_governorMenu;
} else {
    if ([(name player),(getPlayerUID player)] in maxence_ministres) then {
        [1] spawn max_gouvernement_fnc_ministreMenu;
    } else {
        if ([(name player),(getPlayerUID player)] in maxence_security) then {
            [] spawn max_gouvernement_fnc_securityMenu;
        } else {
            [] spawn max_gouvernement_fnc_viewLaws;
        };
    };
};

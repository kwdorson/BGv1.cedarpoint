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
closeDialog 0;

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize);};
if ((_entreprise getVariable ["entreprise_pdg_pid",0]) == (getPlayerUID player)) exitWith {[1] call max_entreprise_fnc_editEntrepriseMenu;};
if (((_entreprise getVariable ["entreprise_members",[]]) find [(getPlayerUID player),(name player),1]) != -1) exitWith {[1] call max_entreprise_fnc_editEntrepriseMenu;};

[] call max_entreprise_fnc_memberEntrepriseMenu;
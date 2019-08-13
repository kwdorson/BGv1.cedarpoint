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
_by = param [0,objNull,[objNull]];
_entreprise = param [1,objNull,[objNull]];

hint format [(["STR_KICKED_ENTERPRISE"] call max_entreprise_fnc_localize),(_entreprise getVariable ["entreprise_name",""]),name _by];

player setVariable ["current_entreprise",objNull,true];
missionNamespace setVariable [format ["entreprise_%1",(_entreprise getVariable ["entreprise_id",0])],false];
missionNamespace setVariable [format ["entreprise_%1_full_acces",(_entreprise getVariable ["entreprise_id",0])],false];

{
    if (_x isEqualType objNull) then {
        removeAllActions _x;
    };
} forEach (_entreprise getVariable ["entreprise_objects",[]]);

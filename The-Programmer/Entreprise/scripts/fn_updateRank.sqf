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
_from = param [0,objNull,[objNull]];
_bool = param [1,false,[false]];
_entreprise = param [2,objNull,[objNull]];
if (isNull _from) exitWith {};
if (isNull _entreprise) exitWith {};

_id = _entreprise getVariable ["entreprise_id",0];
if (_id isEqualTo 0) exitWith {};

missionNamespace setVariable [format ["entreprise_%1_full_acces",_id],_bool];

_name = _entreprise getVariable ["entreprise_name",""];
if (_bool) then {
    hint format [(["STR_GET_PROMOTED"] call max_entreprise_fnc_localize),_name,name _from];
} else {
    hint format [(["STR_GET_DEMOTED"] call max_entreprise_fnc_localize),_name,name _from];
};

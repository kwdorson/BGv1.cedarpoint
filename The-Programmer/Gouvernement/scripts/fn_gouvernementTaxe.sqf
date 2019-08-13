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
_price = [_this,0,0,[0]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;

if (_price <= 0) exitWith {};
if (_mode isEqualTo -1) exitWith {};

_taxe = ((maxence_taxes select _mode) / 100) * _price;

if (life_fishFinder <= _taxe) then {
    _taxe = life_fishFinder;
};

if (_taxe isEqualTo 0) exitWith {};

life_fishFinder = life_fishFinder - _taxe;
[1] call SOCK_fnc_updatePartial;
maxence_compte_gouv = maxence_compte_gouv + _taxe;
publicVariable "maxence_compte_gouv";

hint format [(["STR_TAXE"] call max_gouvernement_fnc_localize),[_taxe] call life_fnc_numberText];
[maxence_compte_gouv,maxence_compte_cop,maxence_compte_med,(name player),3,0,_taxe,_mode] remoteExec ["max_gouvernement_fnc_updateAccounts",2];

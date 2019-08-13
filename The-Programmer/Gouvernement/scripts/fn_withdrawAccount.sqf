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
_type = param [0,0,[0]];
if (_type isEqualTo 0) exitWith {};

_value = parseNumber (ctrlText 2503);
if (_value <= 0) exitWith {hint (["STR_BAD_AMOUNT"] call max_gouvernement_fnc_localize);};
_exit = false;

switch (_type) do {
    case 1 : {
        if (maxence_compte_cop < _value) exitWith {_exit = true;};
        maxence_compte_cop = maxence_compte_cop - _value;
        publicVariable "maxence_compte_cop";
    };
    case 2 : {
        if (maxence_compte_med < _value) exitWith {_exit = true;};
        maxence_compte_med = maxence_compte_med - _value;
        publicVariable "maxence_compte_med";
    };
};

if (_exit) exitWith {hint (["STR_NOT_ENOUGHT_MONEY"] call max_gouvernement_fnc_localize);};

life_fishFinder = life_fishFinder + _value;
[1] call SOCK_fnc_updatePartial;

hint (["STR_TRANSFERT_IN_PROCESS"] call max_gouvernement_fnc_localize);
uiSleep 3;

[_type] spawn max_gouvernement_fnc_accountManagementMenu;
[maxence_compte_gouv,maxence_compte_cop,maxence_compte_med,(name player),_type,3,_value,0] remoteExec ["max_gouvernement_fnc_updateAccounts",2];

_fromTXT = switch (_type) do {
    case 1 : {(["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize)};
    case 2 : {(["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize)};
};
_toTXT = (["STR_PERSONNAL_ACCOUNT"] call max_gouvernement_fnc_localize);

hint format [(["STR_SUCCES_TRANSFERT"] call max_gouvernement_fnc_localize),_value,_fromTXT,_toTXT];

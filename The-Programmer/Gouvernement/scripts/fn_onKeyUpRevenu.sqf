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
_control = _this select 0;

disableSerialization;
if (isNull _control) exitWith {};

_display = findDisplay 6790;

_value = parseNumber (ctrlText _control);
if (_value < 0) then {_value = 0;};

_taxe = ((maxence_taxes select 0) / 100) * _value;

(_display displayCtrl 6794) ctrlSetText format ["%1%2",[_taxe] call life_fnc_numberText,(["STR_MONEY"] call max_gouvernement_fnc_localize)];

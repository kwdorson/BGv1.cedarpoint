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
if ((!([(name player),(getPlayerUID player)] in maxence_gouverneur)) && (!([(name player),(getPlayerUID player)] in maxence_ministres))) exitWith {};
_control = _this select 0;
_mode = _this select 1;

disableSerialization;
if (isNull _control) exitWith {};

_value = parseNumber(ctrlText _control);
_value = round(_value);

_varConfig = switch (_mode) do { 
    case 0 : {"maximum_companies_taxes"}; 
    case 1 : {"maximum_sales_taxes"};
    case 2 : {"maximum_salary_taxes"};
};
_maxValue = getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> _varConfig);
if (_value > _maxValue) exitWith {hint (["STR_TOO_HIGHT_VALUE"] call max_gouvernement_fnc_localize);};

sliderSetPosition [(1001 + _mode),_value];
maxence_taxes set [_mode,_value];
publicVariable "maxence_taxes";
[maxence_taxes] remoteExec ["max_gouvernement_fnc_updateTaxes",2];

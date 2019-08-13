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
disableSerialization;
_text = ((findDisplay 1150) displayCtrl 1152);
_data = lbData [1151,lbCurSel (1151)];
_data = call compile _data;

if (_data isEqualTo []) exitWith {};

_number = _data select 0;
_informations = _data select 1;

_timeArray = _data select 2;
_year = _timeArray select 0;
_month = _timeArray select 1;
_day = _timeArray select 2;
_hour = _timeArray select 3;
_minutes = _timeArray select 4;

_minutes = toArray(str _minutes);

if (count _minutes isEqualTo 1) then {
    _minutes = [48,(_minutes select 0)];
    _minutes = toString (_minutes);
} else {
    _minutes = toString (_minutes);
};

_text ctrlSetStructuredText parseText format ["
    <t size='1.5' align='center' t color='#0059ff'>%1 :</t><br/><br/>
    <t color='#FFFFFF'>%2</t> <t color='#0059ff'>%3</t><br/><br/>
    <t size='0.8' align='center' t color='#FFFFFF'>%4</t><br/><br/>
    ",
format [(["STR_LB_CHANGED_NUMBER"] call max_gouvernement_fnc_localize),_number],
format [(["STR_LB_CHANGED_TEXT"] call max_gouvernement_fnc_localize),_number],
_informations,
format [(["STR_LB_CHANGED_INSERT_TIME"] call max_gouvernement_fnc_localize),_day,_month,_year,_hour,_minutes]
];

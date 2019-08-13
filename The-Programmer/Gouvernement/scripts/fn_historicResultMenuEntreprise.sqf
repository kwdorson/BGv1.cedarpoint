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
_result = [_this,0,[],[[]]] call BIS_fnc_param;

disableSerialization;

_display = findDisplay 1300;
_list = _display displayCtrl 1302;
lbClear _list;

{
    _value = (_x select 2);
    _type = (_x select 3);
    _insert_time = (_x select 5);
    _year = _insert_time select 0;
    _month = _insert_time select 1;
    _day = _insert_time select 2;
    _hour = _insert_time select 3;
    _minutes = _insert_time select 4;

    _minutes = toArray (str _minutes);
    if (count _minutes isEqualTo 1) then {
       _minutes = [48,(_minutes select 0)];
       _minutes = toString (_minutes);
    } else {
       _minutes = toString (_minutes);
    };

    _insert_time = format [(["STR_INSERT_TIME_FORMAT"] call max_gouvernement_fnc_localize),_day,_month,_year,_hour,_minutes];
    _color = [255,255,255,1];
    _text = "";

    switch (_x select 3) do {
        case 1 : {_text = format [(["STR_LOGS_1"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,_insert_time]; _color = [255,0,0,1];};
        case 2 : {_text = format [(["STR_LOGS_2"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,_insert_time]; _color = [0,255,0,1];};
        case 3 : {_text = format [(["STR_LOGS_3"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,_insert_time]; _color = [255,0,0,1];};
        case 4 : {_text = format [(["STR_LOGS_4"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,_insert_time]; _color = [255,0,0,1];};
        default {};
    };

    _list lbAdd _text;
    _list lbSetColor [(lbSize _list)-1,_color];
} forEach _result;

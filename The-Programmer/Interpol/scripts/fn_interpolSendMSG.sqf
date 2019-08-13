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
if (getNumber (missionConfigFile >> "Max_Settings_Interpol" >> "phone_numbers_script") isEqualTo 0) exitWith {};
if ((lbCurSel 5311) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noCrimeSelected";};
_interpolID = parseNumber(ctrlText 5310);
if (_interpolID isEqualTo 0) exitWith {};
_crime = lbData [5311,(lbCurSel 5311)];
_crime = call compile format ["%1",_crime];

_num = ctrlText 5318;

_fn_findPlayerByNum = {
    {
        _numM = _x getVariable "maxence_numero";
        if (_this isEqualTo _numM) exitWith {
            _x;
        };
        objNull
    } foreach playableUnits;
};

_player = _num call _fn_findPlayerByNum;
if (isNull _player) exitWith {
    hint (["STR_FAIL_PHONE_NUMBER"] call max_phone_fnc_localize);
};

_timeArray = (_crime select 5);
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

_message = format [(["STR_MSG_CRIME_UNPAID"] call max_interpol_fnc_localize),_interpolID,str (_crime select 2),_day,_month,_year,_hour,_minutes,[(_crime select 3)] call life_fnc_numberText];
[_message,(["STR_FROM_MSG"] call max_interpol_fnc_localize),0] remoteExec ["max_phone_fnc_clientMessage",_player];
hint format [(["STR_SEND_MSG"] call max_interpol_fnc_localize),_num];
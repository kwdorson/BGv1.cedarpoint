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
_data = param [0,[],[[]]];
_crimesPlayer = param [1,[],[[]]];
_id = (_data select 0);
_prenom = (_data select 1);
_nom = (_data select 2);
_num = (_data select 6);

disableSerialization;
if (!dialog) then {createDialog "maxence_interpol_crimes";};

ctrlShow [5315,false];
ctrlShow [5316,false];
if ((call life_coplevel) < (getNumber (missionConfigFile >> "Max_Settings_Interpol" >> "min_cop_level_remove_crime"))) then {ctrlEnable [5314,false];};
ctrlSetText [5301,format [(["STR_CHANGE_CRIMES_TITLE"] call max_interpol_fnc_localize),_prenom,_nom]];
ctrlSetText [5310,str _id];
ctrlSetText [5309,_prenom];
ctrlSetText [5308,_nom];
ctrlSetText [5318,_num];

_display = findDisplay 5300;
(_display displayCtrl 5313) ctrlSetText (["STR_ADD_CRIME_BUTTON"] call max_interpol_fnc_localize);
(_display displayCtrl 5314) ctrlSetText (["STR_DELETE_CRIME_BUTTON"] call max_interpol_fnc_localize);
(_display displayCtrl 5316) ctrlSetText (["STR_SEND_MSG_BUTTON"] call max_interpol_fnc_localize);
(_display displayCtrl 5319) ctrlSetText (["STR_CUSTOM_REASON"] call max_interpol_fnc_localize);
ctrlSetText [5302,(["STR_PLAYER_CRIMES_TITLE"] call max_interpol_fnc_localize)];
ctrlSetText [5303,(["STR_ALL_CRIMES_TITLE"] call max_interpol_fnc_localize)];
ctrlSetText [5305,(["STR_FIRSTNAME"] call max_interpol_fnc_localize)];
ctrlSetText [5306,(["STR_LASTNAME"] call max_interpol_fnc_localize)];
ctrlSetText [5317,(["STR_PHONE"] call max_interpol_fnc_localize)];

_display = findDisplay 5300;
_list = _display displayCtrl 5312;
lbClear _list;
_infoPlayer = _display displayCtrl 5311;
lbClear _infoPlayer;

_infoPlayer lbSetCurSel -1;
_list lbSetCurSel -1;

_crimes = getArray (missionConfigFile >> "Max_Settings_Interpol" >> "crimes");

{
    _list lbAdd format [(["STR_LBADD_ALL_CRIMES"] call max_interpol_fnc_localize),(_x select 0),[(_x select 1)] call life_fnc_numberText];
    _list lbSetData [(lbSize _list)-1,str(_x)];
} forEach _crimes;

{
    _timeArray = (_x select 5);
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

    _infoPlayer lbAdd format [(["STR_LBADD_PLAYER_CRIMES"] call max_interpol_fnc_localize),(_x select 2),[(_x select 3)] call life_fnc_numberText,_day,_month,_year,_hour,_minutes];
    _infoPlayer lbSetData [(lbSize _infoPlayer)-1,str(_x)];
    _infoPlayer lbSetValue [(lbSize _infoPlayer)-1,(_x select 0)];
    if ((_x select 4) isEqualTo 0) then {_infoPlayer lbSetColor [(lbSize _infoPlayer)-1,[1,0,0,1]];};
    if ((_x select 4) isEqualTo 1) then {_infoPlayer lbSetColor [(lbSize _infoPlayer)-1,[0,1,0,1]];};
} forEach _crimesPlayer;

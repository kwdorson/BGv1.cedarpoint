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
disableSerialization;
_data = _this select 0;
_list = _data select 0;
_index = _data select 1;
_id = _list lbValue _index;
if (_id == 0) exitWith {};

_infoplayer = call compile (_list lbData _index);

_insert_time = _infoplayer select 9;
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

_insert_time = format [(["STR_INSERT_TIME_FORMAT"] call max_interpol_fnc_localize),_day,_month,_year,_hour,_minutes];

_naissanceTT = (_infoplayer select 3);
_naissanceJ = (_naissanceTT select 0);
if (_naissanceJ == 0) then {_naissanceJ = "??"};
_naissanceM = (_naissanceTT select 1);
if (_naissanceM == 0) then {_naissanceM = "??"};
_naissanceA = (_naissanceTT select 2);
if (_naissanceA == 0) then {_naissanceA = "????"};
_naissance = format ["%1/%2/%3",_naissanceJ,_naissanceM,_naissanceA];

(CONTROL(6000,6004)) ctrlSetStructuredText parseText format ["
    <t align='center'><t size='1.4'><t color='#FFFFFF'>Interpol ID :</t> <t color='#009bff'>%10</t></t></t><br/><br/>
    <t color='#FFFFFF'>%11</t> <t color='#0059ff'>%1</t><br/>
    <t color='#FFFFFF'>%12</t> <t color='#0059ff'>%2</t><br/><br/>
    <t color='#FFFFFF'>%13</t> <t color='#009bff'>%3</t><br/><br/>
    <t color='#FFFFFF'>%14</t> <t color='#009bff'>%4</t><br/>
    <t color='#FFFFFF'>%15</t> <t color='#009bff'>%5</t><br/><br/>
    <t color='#FFFFFF'>%16</t> <t color='#009bff'>%6</t><br/><br/>
    <t color='#FFFFFF'>%17</t> <t color='#009bff'>%7</t><br/><br/>
    <t color='#FFFFFF'>%18</t> <t color='#009bff'>%8</t><br/><br/>
    <t color='#FFFFFF'>%19</t> <t color='#009bff'>%9</t>
    ",
(_infoplayer select 2),
(_infoplayer select 1),
_naissance,
(_infoplayer select 4),
(_infoplayer select 5),
(_infoplayer select 6),
(_infoplayer select 7),
(_infoplayer select 8),
_insert_time,
(_infoplayer select 0),
(["STR_LASTNAME"] call max_interpol_fnc_localize),
(["STR_FIRSTNAME"] call max_interpol_fnc_localize),
(["STR_NAISSANCE_WITHOUT_JJMMAAAA"] call max_interpol_fnc_localize),
(["STR_ADRESSE"] call max_interpol_fnc_localize),
(["STR_CITY"] call max_interpol_fnc_localize),
(["STR_PHONE_NUMBER"] call max_interpol_fnc_localize),
(["STR_EYES_COLOR"] call max_interpol_fnc_localize),
(["STR_AUTRES"] call max_interpol_fnc_localize),
(["STR_INSERT_TIME"] call max_interpol_fnc_localize)
];

_editButton = ((findDisplay 6000) displayCtrl 6002);
_editButton ctrlShow true;
_crimesButton = ((findDisplay 6000) displayCtrl 6005);
_crimesButton ctrlShow true;

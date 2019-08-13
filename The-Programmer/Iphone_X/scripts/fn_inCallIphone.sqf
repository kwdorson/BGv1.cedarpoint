/*
    Author: Jean_Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Discord : https://discord.gg/DhFUFsq

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
_with = player getVariable ["calling_with",objNull];
if (isNull _with) exitWith {};

_withNum = player getVariable ["calling_number",""];

if (_with getVariable "calling_ano") then {_withNum = (["STR_ANONYME"] call max_phone_fnc_localize);};

{
   if ((_x select 1) isEqualTo _withNum) exitWith {
      _withNum = _x select 0;
   };
} foreach maxence_contact;

disableSerialization;
_display = findDisplay 25000;
_numberTXT = _display displayCtrl 25001;

_numberTXT ctrlSetStructuredText parseText format ["<t size='1.5'><t align='center'>%1</t></t>",_withNum];

while {player getVariable ["in_call",false]} do {
    _time = player getVariable ["calling_time",0];
    _time = _time + 1;
    _time = _time / 3600;
    _time = [_time] call BIS_fnc_timeToString;

    ctrlSetText [25002,_time];
    uiSleep 1;
};

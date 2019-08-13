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
if !(player getVariable ["receiveCall",false]) exitWith {};

_from = player getVariable ["receiveCallBy",objNull];
if (isNull _from) exitWith {};
_fromNum = _from getVariable ["maxence_numero",""];

if (_from getVariable ["calling_ano",false]) then {
    _fromNum = (["STR_ANONYME"] call max_phone_fnc_localize);
} else {
    {
       if (_x select 1 isEqualTo _fromNum) exitWith {
          _fromNum = _x select 0;
       };
    } foreach maxence_contact;
};

disableSerialization;
_display = findDisplay 26000;
_numberTXT = _display displayCtrl 26001;

_numberTXT ctrlSetStructuredText parseText format ["<t size='1.5'><t align='center'>%1</t></t>",_fromNum];

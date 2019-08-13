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
uiNamespace setVariable ["compose_number",""];

_display = findDisplay 21000;
_appelTxt = _display displayCtrl 1003; 

_appel = missionNamespace getVariable ["maxence_appel",0]; 
_time = _appel / 3600;
_time = [_time] call BIS_fnc_timeToString;
if (_appel != 0) then {
    _appelTxt ctrlSetText format [(["STR_CALL"] call max_phone_fnc_localize),_time];
};

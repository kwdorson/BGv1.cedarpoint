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
private ["_display","_units"];
_curConfig = missionConfigFile >> "Max_Settings_Phone";

disableSerialization;
_display = findDisplay 3000;

ctrlSetText [3003,""];

if (call life_adminlevel < 1) then {
    ctrlShow[3020,false];
    ctrlShow[3021,false];
};

_display = findDisplay 3000;
_numeroTxt = _display displayCtrl 3010;
_numeroServiceTxt = _display displayCtrl 3011;
_num = player getVariable ["maxence_numero","0"];

if (_num != "0") then {_numeroTxt ctrlSetText format ["%1",_num];};

_smsTxt = _display displayCtrl 1002;
_sms = missionNamespace getVariable ["maxence_sms",0];
if (_sms != 0) then {_smsTxt ctrlSetText format[(["STR_SMS"] call max_phone_fnc_localize),_sms];};

if (playerSide isEqualTo west || playerSide isEqualTo independent) then {
    switch (playerSide) do {
        case west : {_numeroServiceTxt ctrlSetText format [(["STR_ACTUAL_SERVICE_NUMBER"] call max_phone_fnc_localize),getNumber (_curConfig >> "num_cop")];};
        case independent : {_numeroServiceTxt ctrlSetText format [(["STR_ACTUAL_SERVICE_NUMBER"] call max_phone_fnc_localize),getNumber (_curConfig >> "num_med")];};
    };
};

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
if (_index isEqualTo -1) exitWith {};

_crimeInfo = call compile (_list lbData _index);

_statusButton = ((findDisplay 5300) displayCtrl 5315);
_msgButton = ((findDisplay 5300) displayCtrl 5316);

if ((_crimeInfo select 4) isEqualTo 0) then {
    _statusButton ctrlShow true;
    _statusButton ctrlSetText (["STR_STATUS_PAYED"] call max_interpol_fnc_localize);
    _statusButton buttonSetAction "[1] spawn max_interpol_fnc_interpolChangeStatus;";
    if (getNumber (missionConfigFile >> "Max_Settings_Interpol" >> "phone_numbers_script") isEqualTo 1) then {_msgButton ctrlShow true;};
} else {
    if ((_crimeInfo select 4) isEqualTo 1) then {
        _statusButton ctrlShow true;
        _statusButton ctrlSetText (["STR_STATUS_NOT_PAYED"] call max_interpol_fnc_localize);
        _statusButton buttonSetAction "[0] spawn max_interpol_fnc_interpolChangeStatus;";    
    } else {
        _statusButton ctrlShow false;
    };
    _msgButton ctrlShow false;
};

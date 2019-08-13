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
private["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];

ctrlShow[1803,false];
ctrlShow[1830,false];
waitUntil {!isNull (findDisplay 1800)};

if (count _vehicles isEqualTo 0) exitWith {
    ctrlSetText[1811,localize "STR_Garage_NoVehicles"];
};

_control = CONTROL(1800,1802);
lbClear _control;

{
    _vehicleInfo = [(_x select 2)] call life_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    _tmp = [(_x select 2),(_x select 8),(_x select 9)];
    _tmp = str(_tmp);
    _control lbSetData [(lbSize _control)-1,_tmp];
    _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
    _control lbSetValue [(lbSize _control)-1,(_x select 0)];
} forEach _vehicles;

ctrlShow[1810,false];
ctrlShow[1811,false];

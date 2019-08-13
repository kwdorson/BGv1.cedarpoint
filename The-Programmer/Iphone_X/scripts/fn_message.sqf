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
private ["_display","_units","_type"];
disableSerialization;
_display = findDisplay 3000;
_units = _display displayCtrl 3004;

ctrlSetText [3003,""];
lbClear _units;

if (call life_adminlevel < 1) then {
    ctrlShow[3020,false];
    ctrlShow[3021,false];
};

{
    if (alive _x && !(_x isEqualTo player)) then {
        _type = switch (side _x) do {
            case west: {"Cop"};
            case civilian: {"Civ"};
            case independent: {"Med"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

_units lbSetCurSel -1;

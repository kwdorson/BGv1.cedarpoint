#include "..\..\script_macros.hpp"
private ["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
    if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    _value = ITEM_VALUE(_item);
    _itemName = ITEM_VARNAME(_item);

    switch (_item) do {
        case "life_houseProtect": {
            if (civRDM > 0) then {
                missionNamespace setVariable ["civRDM",0];
            };
        };

        default {
            if (_value > 0) then {
                missionNamespace setVariable [_itemName,0];
            };
        };
    };
} forEach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["life_houseProtect"]);


[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;

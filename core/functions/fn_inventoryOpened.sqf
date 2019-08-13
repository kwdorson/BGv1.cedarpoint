#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryOpened.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    For the mean time it blocks the player from opening another persons backpack
*/
private ["_cont1","_cont2","_unit","_list","_idc","_exit"];
if (count _this isEqualTo 1) exitWith {false};
params ["_unit", "_cont1","_cont2"];

_list = ["LandVehicle","Ship","Air"];

if (isNull _cont1 && isNull _cont2) exitWith {};    

_closest = 4000;
{
    if ((_unit distance _x) < _closest ) then {_closest = (_unit distance _x)};
} forEach ((playableUnits + switchableUnits) - [_unit]);

_exit = false;
{
    if (!isNull _x) then {

        if ((_unit getVariable ["tied", false]) || (_unit getVariable ["restrained", false])) then {
            _exit = true;
        };

        _isPack = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _x,"isBackpack");
        if (_isPack isEqualTo 1) then {
            [localize "STR_MISC_Backpack",true,"slow"] call life_fnc_notificationSystem;
            _exit = true;
        };

        if ((typeOf _x) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {
            _house = nearestObject [player, "House"];
            if (!(_house in life_vehicles) && (_house getVariable ["locked",true])) then {
                [localize "STR_House_StorageLock",true,"slow"] call life_fnc_notificationSystem;
                _exit = true;
            };
        };

        if (KINDOF_ARRAY(_x,_list)) then {
            if (!(_x in life_vehicles) && {locked _x isEqualTo 2}) then {
                [localize "STR_MISC_VehInventory",true,"slow"] call life_fnc_notificationSystem;
                _exit = true;
            };
        };

        if (_x isKindOf "Man" && !alive _x) then {
            [localize "STR_NOTF_NoLootingPerson",true,"slow"] call life_fnc_notificationSystem;
            _exit = true;
        };

        if ( (count((getBackpackCargo _x) select 0)) != 0 ) then {

            private _closest = 4000;
            {
                if ((_unit distance _x) < _closest ) then {_closest = (_unit distance _x)};
            } forEach ((playableUnits + switchableUnits) - [_unit]);

            if(_closest <= 5) then {
                ["Too close to a Player.",true,"slow"] call life_fnc_notificationSystem;
                _exit = true;
            };
        };
    };
} forEach [_cont2,_cont1];

_unit spawn {
    waituntil {!(isnull (finddisplay 602))};
    private _ply = _this;
    if !(_ply isEqualTo (vehicle _ply)) then {
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
        ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
        ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
    };
    waituntil {isnull (finddisplay 602)};
};

_exit;
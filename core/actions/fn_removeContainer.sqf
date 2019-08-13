#include "..\..\script_macros.hpp"
/*
    File : removeContainer.sqf
    Author: NiiRoZz

    Description:
    Delete Container from house storage
*/
private ["_house","_action","_container","_furnitures","_containerType","_containers"];
_container = param [0,objNull,[objNull]];
_containerType = typeOf _container;
_house = nearestObject [player, "House"];
if (FETCH_CONST(life_adminlevel) == 1) then {
    ["you are an admin, remove these objects if they are outside housing limits or obstructing entrances",false,"slow"] call life_fnc_notificationSystem;
     if (isNull _container) exitWith {};
    _containers = _house getVariable ["containers",[]];
    _furnitures = _house getVariable ["furnitures",[]];
    closeDialog 0;

    _action = [
        format [localize "STR_House_DeleteContainerMSG"],localize "STR_pInAct_RemoveContainer",localize "STR_Global_Remove",localize "STR_Global_Cancel"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        private ["_box","_diff"];
        private ["_box","_diff"];
        _box = "";
        _box = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> _containerType);
        if (_box == "None") exitWith {};

        _diff = [_box,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
        if (_diff isEqualTo 0) exitWith {[localize "STR_NOTF_InvFull",true,"slow"] call life_fnc_notificationSystem;};

        if (life_HC_isActive) then {
            [_container] remoteExecCall ["HC_fnc_deleteDBContainer",HC_Life];
        } else {
            [_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];
        };

        if !((getNumber(missionConfigFile >> "VirtualItems" >> _box >> "furniture")) isEqualTo 1) then {
            {
                if (_x == _container) then {
                    _containers deleteAt _forEachIndex;
                };
            } forEach _containers;
            _house setVariable ["containers",_containers,true];
        }else{
            {
                if (_x == _container) then {
                    _furnitures deleteAt _forEachIndex;
                };
            } forEach _furnitures;
            _house setVariable ["furnitures",_furnitures,true];
        };

        [true,_box,1] call life_fnc_handleInv;
    };
} else {
    if (!(_house in life_vehicles)) exitWith {[localize "STR_ISTR_Box_NotinHouse",true,"slow"] call life_fnc_notificationSystem;};

    if (isNull _container) exitWith {};
    _containers = _house getVariable ["containers",[]];
    _furnitures = _house getVariable ["furnitures",[]];
    closeDialog 0;

    _action = [
        format [localize "STR_House_DeleteContainerMSG"],localize "STR_pInAct_RemoveContainer",localize "STR_Global_Remove",localize "STR_Global_Cancel"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        private ["_box","_diff"];
        private ["_box","_diff"];
        _box = "";
        _box = getText(missionConfigFile >> "CfgDonkeyPunchCustoms" >> _containerType);
        if (_box == "None") exitWith {};

        _diff = [_box,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
        if (_diff isEqualTo 0) exitWith {[localize "STR_NOTF_InvFull",true,"slow"] call life_fnc_notificationSystem;};

        if (life_HC_isActive) then {
            [_container] remoteExecCall ["HC_fnc_deleteDBContainer",HC_Life];
        } else {
            [_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];
        };

        if !((getNumber(missionConfigFile >> "VirtualItems" >> _box >> "furniture")) isEqualTo 1) then {
            {
                if (_x == _container) then {
                    _containers deleteAt _forEachIndex;
                };
            } forEach _containers;
            _house setVariable ["containers",_containers,true];
        }else{
            {
                if (_x == _container) then {
                    _furnitures deleteAt _forEachIndex;
                };
            } forEach _furnitures;
            _house setVariable ["furnitures",_furnitures,true];
        };

        [true,_box,1] call life_fnc_handleInv;
    };
};
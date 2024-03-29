#include "..\..\script_macros.hpp"
/*
    File: fn_putInCar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Finds the nearest vehicle and loads the target into the vehicle.
*/
private ["_unit"];
_unit = param [0,objNull,[objNull]];
if (isNull _unit || !isPlayer _unit) exitWith {};
private _nearestVehicle = objNull;
if (surfaceIsWater (position player) ) then {
	_nearestVehicle = nearestObjects[getPosASL player,["Car","Ship","Submarine","Air"],10] select 0;
} else {
	_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
};
if (isNull _nearestVehicle) exitWith {[localize "STR_NOTF_VehicleNear",true,"slow"] call life_fnc_notificationSystem;
};

detach _unit;
[_nearestVehicle] remoteExecCall ["life_fnc_moveIn",_unit];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",true,true];
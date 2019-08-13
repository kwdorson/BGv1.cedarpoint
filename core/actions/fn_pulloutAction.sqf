#include "..\..\script_macros.hpp"
	
params [
	["_veh", objNull, [objNull]]
];
private ["_crew"];
_crew = crew _veh;

if((player distance _veh) > 8) exitWith {["Too far away from the vehicle to pull out!",true,"slow"] call life_fnc_notificationSystem;};

switch playerSide do {
	case civilian : {
			if (_veh in life_vehicles) then {
				{
					if (isPlayer _x) then {
						_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
						[player] remoteExecCall ["life_fnc_pulloutVeh",_x];
					};
				} forEach _crew;			
			} else {
				hint "You cannot pull players out. This is not your vehicle!!";
			};
	};
	default {
		{
			if (isPlayer _x && !(playerSide isEqualTo (side _x))) then {
				_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
				[player] remoteExecCall ["life_fnc_pulloutVeh",_x];
			};
		} forEach _crew;
	};
};
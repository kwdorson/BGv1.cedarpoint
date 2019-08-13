#include "..\..\script_macros.hpp"
/*
    File: fn_medico.sqf
    Author: GhostsBR

    Description: script de maca para o samu.
*/
_cars = ["C_Van_02_medevac_F","C_Offroad_01_F","C_Van_01_box_F","C_SUV_01_F"];
_ambulancia = (nearestObjects [player, _cars, 5]) select 0;
_helis = ["B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"];
_heli = (nearestObjects [player, _helis, 5]) select 0;

if (side player isEqualto civilian) exitWith {hint "";};
if (side player isEqualto west) exitWith {hint "";};
if (vehicle player != player) exitWith {hint "You can not use this inside a vehicle.";};

if (player distance _ambulancia < 5) then {
_obj = nearestObject [player, "Land_Stretcher_01_F"];

if (player distance _obj < 5) exitWith {hint "There is already a stretcher next to you.";};

_maca = "Land_Stretcher_01_F" createVehicle position player;

action_carregar = {
	_obj = nearestObject [player, "Land_Stretcher_01_F"];
	_obj attachTo [player, [0, 1.10, 0.60] ];
	_ambulancia = (nearestObjects [player, _cars, 50]) select 0;
	soltar = player addAction ["Drop Stretcher", {call action_soltar;}];
	_obj removeAction pegar;
	_ambulancia removeAction veiculo;
	veiculo = _ambulancia addAction ["Put in Ambulance", {call action_colocar;}];
	player removeAction levar;
};

action_levar = {
	_obj = nearestObject [player, "Land_Stretcher_01_F"];
	_fe = nearestObjects [player, ["C_man_1"], 5];
	_ferido = _fe select 0;
	_ferido attachTo [_obj, [0, 0.20, 0.25] ];
};

action_soltar = {
	_obj = nearestObject [player, "Land_Stretcher_01_F"];
	_ambulancia = (nearestObjects [player, _cars, 50]) select 0;
	detach _obj;
	ativo = false;
	pegar = _obj addAction ["Take Stretcher", {call action_carregar;}];
	levar = player addAction ["Place Player", {call action_levar;}];
	_ambulancia removeAction veiculo;
	player removeAction soltar;
};

action_colocar = {
	_fe = nearestObjects [player, ["C_man_1"], 5];
	_ferido = _fe select 0;
	_obj = nearestObject [player, "Land_Stretcher_01_F"];
	_ambulancia = (nearestObjects [player, _cars, 50]) select 0;
	_nearestVehicle = (nearestObjects [player, _cars, 50]) select 0;
	player removeAction soltar;
	_obj removeAction pegar;
	_ambulancia removeAction veiculo;
	deleteVehicle _obj;
	[_nearestVehicle] remoteExecCall ["life_fnc_moveIn",_ferido];
};

call action_carregar;

};

if (player distance _heli < 5) then {
	if (player distance _ambulancia > 3) then {
		_obj2 = nearestObject [player, "Land_Stretcher_01_olive_F"];
		
		if (player distance _obj2 < 5) exitWith {hint "There is already a stretcher next to you.";};
		
		_maca = "Land_Stretcher_01_olive_F" createVehicle position player;
		
		action_carregar = {
			_obj = nearestObject [player, "Land_Stretcher_01_olive_F"];
			_obj attachTo [player, [0, 1.10, 0.60] ];
			_ambulancia = (nearestObjects [player, _helis, 50]) select 0;
			soltar = player addAction ["Drop Stretcher", {call action_soltar;}];
			_obj removeAction pegar;
			_ambulancia removeAction veiculo;
			veiculo = _ambulancia addAction ["Put in Ambulance", {call action_colocar;}];
			player removeAction levar;
		};

		action_levar = {
			_obj = nearestObject [player, "Land_Stretcher_01_olive_F"];
			_fe = nearestObjects [player, ["C_man_1"], 5];
			_ferido = _fe select 0;
			_ferido attachTo [_obj, [0, 0.20, 0.25] ];
		};

		action_soltar = {
			_obj = nearestObject [player, "Land_Stretcher_01_olive_F"];
			_ambulancia = (nearestObjects [player, _helis, 50]) select 0;
			_obj = nearestObject [player, "Land_Stretcher_01_olive_F"];
			detach _obj;
			ativo = false;
			pegar = _obj addAction ["Take Stretcher", {call action_carregar;}];
			levar = player addAction ["Place Player", {call action_levar;}];
			_ambulancia removeAction veiculo;
			player removeAction soltar;
		};

		action_colocar = {
			_fe = nearestObjects [player, ["C_man_1"], 5];
			_ferido = _fe select 0;
			_obj = nearestObject [player, "Land_Stretcher_01_olive_F"];
			_ambulancia = (nearestObjects [player, _helis, 50]) select 0;
			_nearestVehicle = (nearestObjects [player, _helis, 50]) select 0;
			player removeAction soltar;
			_obj removeAction pegar;
			_ambulancia removeAction veiculo;
			deleteVehicle _obj;
			[_nearestVehicle] remoteExecCall ["life_fnc_moveIn",_ferido];
		};

		call action_carregar;
	};
};
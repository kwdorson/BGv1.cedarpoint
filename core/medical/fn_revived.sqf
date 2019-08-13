#include "..\..\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    THANK YOU JESUS I WAS SAVED!
*/
private ["_medic","_dir","_reviveCost"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");

[life_save_gear] spawn life_fnc_loadDeadGear;
life_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];

_dir = getDir life_corpse;
hint format [localize "STR_Medic_RevivePay",_medic,[_reviveCost] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (civRDMed > _reviveCost) then {
    civRDMed = civRDMed - _reviveCost;
} else {
    civRDMed = 0;
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];
deleteVehicle life_corpse;

life_action_inUse = false;
life_is_alive = true;
life_nlrtimer_stop = true;

player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
[] call life_fnc_playerSkins;
[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest;

_closest = 4000;
{
    if ((_unit distance _x) < _closest && ((side _x) isEqualTo independent)) then {_closest = (_unit distance _x)};
} forEach ((playableUnits + switchableUnits) - [_unit]);

if (_closest <= 20) then {
	if (alive player) then {
		0 = ["DynamicBlur", 400, [10]] spawn 
		{
			params ["_name", "_priority", "_effect", "_handle"];
			while {
				_handle = ppEffectCreate [_name, _priority];
				_handle < 0
			} do {
				_priority = _priority + 1;
			};
			_handle ppEffectEnable true;
			_handle ppEffectAdjust _effect;
			_handle ppEffectCommit 1;
			waitUntil {ppEffectCommitted _handle};
			systemChat "My head hurts, it should pass soon...";
			uiSleep 60; 
			_handle ppEffectEnable false;
			ppEffectDestroy _handle;
			systemChat "I'm feeling better already.";
		};
	};

	if (playerside isEqualto civilian) then {
		player switchmove "AinjPpneMstpSnonWnonDnon";
		player setDamage 0.9;
	};
};
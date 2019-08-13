#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (_source != _unit) then {
    if (currentWeapon _source in ["CSW_M26C","CG_PICKAXE","CG_BATON","CG_TELBAT","CG_BAT","CSW_M870"] && _projectile in ["CSW_Taser_Ammo","non_Swing","s_swing","CSW_M870_stun"]) then {
        _damage = (damage player);
        if (alive player && {!life_istazed} && {!life_isknocked}) then {
            private _distance = 50;
            if (_projectile in ["CSW_Taser_Ammo","non_Swing","s_swing","CSW_Taser_Probe_Mag"]) then {_distance = 30;};
            if (_unit distance _source < _distance) then {
                if !(isNull objectParent player) then {
                    player action ["Eject",objectParent player];
                    [] call life_fnc_ragdoll;
                    [_unit,_source] spawn life_fnc_tazed;
                } else {
                    [] call life_fnc_ragdoll;
                    [_unit,_source] spawn life_fnc_tazed;
                };
            };
        };

        //Temp fix for super tasers on cops.
        if (side _source isEqualTo west && side player isEqualTo west) then {
            _damage = damage player;
        };
    };
};

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then
{
	_damage = if (life_seatbelt) then { _damage / 2 } else { _damage};
};

//VDM Report And ADD
if ((isPlayer _source) && (vehicle _source != _source)) then {
if(_part == "body" && (player getVariable["limit",true]) && (side _source == civilian)) then {
player setVariable ["limit",false];
[_source] spawn {
_driver = _this select 0;
[0,format["%1 just ran over %2!", name _driver, name player]] remoteExec ["life_fnc_broadcast",0];
sleep(10);
player setVariable ["limit",true];
	};
};				
_damage = getDammage player;
};


[] spawn life_fnc_hudUpdate;
_damage;


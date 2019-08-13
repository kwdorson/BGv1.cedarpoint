#include "..\..\script_macros.hpp"
	
private ["_value"];
_value = life_houseProtect;

if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > life_houseProtect) exitWith {hint localize "STR_ATM_NotEnoughcivRDM"};

life_houseProtect = life_houseProtect - _value;
life_fishFinder = life_fishFinder + _value;

hint format [localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
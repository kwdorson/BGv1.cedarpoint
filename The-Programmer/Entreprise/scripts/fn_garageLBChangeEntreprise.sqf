#include "..\..\script_macros.hpp"
/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
disableSerialization;
private ["_control","_index","_className","_classNameLife","_dbInfo","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_price","_storageFee","_purchasePrice","_insurance","_insuranceMultiplier","_insurancePrice"];
_control = _this select 0;
_index = _this select 1;

_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format ["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;
_insurance = (_dataArr select 2);

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default";
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_dataArr select 1)) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

switch (playerSide) do {
	case civilian: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	case west: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
	};
	case independent: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
	};
	case east: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
	};
}; 
_retrievePrice = _purchasePrice * _storageFee;
_sellPrice = _purchasePrice * _sellMultiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};
if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 500;};

(CONTROL(1800,1803)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>0€</t><br/>
    " +(localize "STR_Shop_Veh_UI_Color")+ " %6<br/>
    " +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %1 km/h<br/>
    " +(localize "STR_Shop_Veh_UI_HPower")+ " %2<br/>
    " +(localize "STR_Shop_Veh_UI_PSeats")+ " %3<br/>
    " +(localize "STR_Shop_Veh_UI_Trunk")+ " %4<br/>
    " +(localize "STR_Shop_Veh_UI_Fuel")+ " %5
    ",
(_vehicleInfo select 8),
(_vehicleInfo select 11),
(_vehicleInfo select 10),
if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
(_vehicleInfo select 12),
_vehicleColor
];
 
ctrlShow [1803,true];
ctrlShow [1830,true];

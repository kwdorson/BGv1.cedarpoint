#include "..\..\script_macros.hpp"
/*
    File: fn_garageLBChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private ["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_insurance","_insuranceMultiplier","_price","_storageFee","_purchasePrice","_insurancePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format ["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;
_insurance = (_dataArr select 2 );

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
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
 _insuranceMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_CIVILIAN");
 };
 case west: {
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
 _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
 _insuranceMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_COP");
 };
 case independent: {
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
 _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
 _insuranceMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_MEDIC");
 };
 case east: {
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
 _sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
 _insuranceMultiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_OPFOR");
 };
};

_retrievePrice = _purchasePrice * _storageFee;
_sellPrice = _purchasePrice * _sellMultiplier;
_insurancePrice = _purchasePrice * _insuranceMultiplier;

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};
if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 500;};


(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
" +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>$%2</t><br/>
Price of insurance: <t color='#8cff9b'>$%9</t><br/>
State of the insurance: %10 <br/>
" +(localize "STR_Shop_Veh_UI_Color")+ " <t color='#8cff9b'>%8</t><br/>
" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " <t color='#8cff9b'>%3 km/h</t><br/>
" +(localize "STR_Shop_Veh_UI_HPower")+ " <t color='#8cff9b'>%4</t><br/>
" +(localize "STR_Shop_Veh_UI_PSeats")+ " <t color='#8cff9b'>%5</t><br/>
" +(localize "STR_Shop_Veh_UI_Trunk")+ " <t color='#8cff9b'>%6</t><br/>
" +(localize "STR_Shop_Veh_UI_Fuel")+ " <t color='#8cff9b'>%7</t>
",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
(_vehicleInfo select 8),
(_vehicleInfo select 11),
(_vehicleInfo select 10),
if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
(_vehicleInfo select 12),
_vehicleColor,
[_insurancePrice] call life_fnc_numberText,
if(_insurance == 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>No insurance</t>"},
(_vehicleInfo select 9)
];
if(_insurance == 1) then {
ctrlShow [97480,False];
}else{
ctrlShow [97480,True];
};

ctrlShow [2803,true];
ctrlShow [2830,true];

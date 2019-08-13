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
private ["_entreprise"];
_type = param [0,0,[0]];
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
_curConfig = missionConfigFile >> "Max_Settings_Entreprise";

_curBankACC = _entreprise getVariable ["entreprise_bankacc",0];

_price = 0;
_value = 0;

switch (_type) do { 
    case 1 : { //BUY 100
        _price = getNumber (_curConfig >> "price_upgrade_100_storage");
        _value = 100;
    }; 
    case 2 : { //BUY 1000
        _price = getNumber (_curConfig >> "price_upgrade_1000_storage");
        _value = 1000;
    };
};

if (_curBankACC < _price) exitWith {hint (["STR_NOT_ENOUGHT_MONEY_ENTREPRISE_ACC"] call max_entreprise_fnc_localize)};

_action = [
    format [(["STR_UPDATE_STORAGE_TEXT"] call max_entreprise_fnc_localize),[_value] call life_fnc_numberText,[_price] call life_fnc_numberText],
    (["STR_UPDATE_STORAGE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_STORAGE_EMPLOYES"] call max_entreprise_fnc_localize),
    (["STR_STORAGE_PRIVATE"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

_type_entreprise = _entreprise getVariable ["entreprise_type",""];

if !(_action) exitWith {
    _curStockage2 = _entreprise getVariable ["entreprise_maxstock_2",0];
    _max_stock_private = getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type_entreprise >> "max_stock_private");
    if ((_curStockage2 + _value) > _max_stock_private) exitWith {hint (["STR_CANT_UPGRADE_STORAGE"] call max_entreprise_fnc_localize)};

    _entreprise setVariable ["entreprise_bankacc",(_curBankACC - _price),true];
    [(_entreprise getVariable ["entreprise_id",0]),5,(_entreprise getVariable "entreprise_bankacc")] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
    _entreprise setVariable ["entreprise_maxstock_2",(_curStockage2 + _value),true];
    [(_entreprise getVariable ["entreprise_id",0]),10,(_entreprise getVariable "entreprise_maxstock_2")] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

    hint format [(["STR_UPDATE_STORAGE_SUCCES"] call max_entreprise_fnc_localize),[_value] call life_fnc_numberText];
    [] call max_entreprise_fnc_editEntrepriseMenu;
};

_curStockage = _entreprise getVariable ["entreprise_maxstock",0];
_max_stock_private = getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type_entreprise >> "max_stock_commum");
if ((_curStockage + _value) > _max_stock_private) exitWith {hint (["STR_CANT_UPGRADE_STORAGE"] call max_entreprise_fnc_localize)};

_entreprise setVariable ["entreprise_bankacc",(_curBankACC - _price),true];
[(_entreprise getVariable ["entreprise_id",0]),5,(_entreprise getVariable "entreprise_bankacc")] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
_entreprise setVariable ["entreprise_maxstock",(_curStockage + _value),true];
[(_entreprise getVariable ["entreprise_id",0]),6,(_entreprise getVariable "entreprise_maxstock")] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
[_entreprise,(name player),_price,4] remoteExecCall ["max_entreprise_fnc_insertEntrepriseLogs",2];

hint format [(["STR_UPDATE_STORAGE_SUCCES"] call max_entreprise_fnc_localize),[_value] call life_fnc_numberText];
[] call max_entreprise_fnc_editEntrepriseMenu;
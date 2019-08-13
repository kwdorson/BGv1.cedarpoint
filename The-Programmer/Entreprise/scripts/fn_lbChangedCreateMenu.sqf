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
_display = findDisplay 5430;
_data = _this select 0;
_list = _data select 0;
_index = _data select 1;
_className = _list lbData _index;

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _className;

if (!isClass _curConfig) exitWith {};

_employesMax = getNumber (_curConfig >> "max_players");
_communMax = getNumber (_curConfig >> "max_stock_commum");
_privateMax = getNumber (_curConfig >> "max_stock_private");
_price = getNumber (_curConfig >> "price");

_entreprise = player getVariable ["current_entreprise",objNull];
if (!isNull _entreprise) then {
    _actualType = _entreprise getVariable ["entreprise_type",""];
    _config = missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _actualType;
    if (!isClass _config) exitWith {};
    _actualPrice = getNumber (_config >> "price");
    _price = _price - _actualPrice;
};

if (_price < 0) then {_price = 0;};

(_display displayCtrl 5435) ctrlSetText format ["%1",_employesMax];
(_display displayCtrl 5436) ctrlSetText format ["%1",_communMax];
(_display displayCtrl 5437) ctrlSetText format ["%1",_privateMax];
(_display displayCtrl 5427) ctrlSetText format ["%1%2",([_price] call life_fnc_numberText),(["STR_MONEY"] call max_entreprise_fnc_localize)];

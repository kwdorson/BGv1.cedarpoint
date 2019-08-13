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
_entreprise = param [0,objNull,[objNull]];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
disableSerialization;

_display = findDisplay 9640;

_nowStock = 0;
_items = _entreprise getVariable ["entreprise_items",[]];
if ((count _items) > 0) then {
    {
        _nowStock = _nowStock + ((_x select 1) * getNumber (missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight"));
    } forEach _items;
};
(_display displayCtrl 9644) ctrlSetText format [(["STR_STOCKAGE_TOTAL"] call max_entreprise_fnc_localize),_nowStock,(_entreprise getVariable ["entreprise_maxstock",0])];

_entrepriseInv = CONTROL(9640,9645);
_playerInv = CONTROL(9640,9646);
lbClear _entrepriseInv;
lbClear _playerInv;

{
    _val = ITEM_VALUE(configName _x);
    if (_val > 0) then {
        _playerInv lbAdd format ["[%1] - %2",_val,localize (getText(_x >> "displayName"))];
        _playerInv lbSetData [(lbSize _playerInv)-1,configName _x];
        _icon = (getText(_x >> "icon"));
        if (!(_icon isEqualTo "")) then {
            _playerInv lbSetPicture [(lbSize _playerInv)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

if ((count _items) > 0) then {
    {
        _name = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
        _val = (_x select 1);

        if (_val > 0) then {
            _entrepriseInv lbAdd format ["[%1] - %2",_val,localize _name];
            _entrepriseInv lbSetData [(lbSize _entrepriseInv)-1,(_x select 0)];
            _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
            if (!(_icon isEqualTo "")) then {
                _entrepriseInv lbSetPicture [(lbSize _entrepriseInv)-1,_icon];
            };
        };
    } forEach _items;
};

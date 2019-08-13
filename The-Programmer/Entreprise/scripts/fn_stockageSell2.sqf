#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if (!alive player) exitWith {closeDialog 0;};
if ((_entreprise getVariable ["entreprise_stockage2_openned_by",player]) != player) exitWith {closeDialog 0; hint (["STR_STOCKAGE_IN_USE"] call max_entreprise_fnc_localize);};
disableSerialization;

if ((lbCurSel 9746) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection";};
_ctrl = ctrlSelData(9746);
_num = ctrlText 9749;
if (!([_num] call TON_fnc_isnumber)) exitWith {hint (["STR_BAD_VALUE"] call max_entreprise_fnc_localize);};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint (["STR_BAD_VALUE"] call max_entreprise_fnc_localize);};

_used = 0;
_items = _entreprise getVariable ["entreprise_items_2",[]];
if ((count _items) > 0) then {
    {
        _used = _used + (_x select 1);
    } forEach _items;
};

_maxWeight = (_entreprise getVariable "entreprise_maxstock_2");
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;

if ((_used + _itemWeight) > _maxWeight) exitWith {hint (["STR_STOCKAGE_FULL"] call max_entreprise_fnc_localize);};

if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint (["STR_STOCKAGE_MAYBE_FULL"] call max_entreprise_fnc_localize);};

_data = _entreprise getVariable ["entreprise_items_2",[]];
_index = -1;

if ((count _data) > 0) then {
    {
        if (_ctrl isEqualTo (_x select 0)) exitWith {
            _index = _forEachIndex;
        };
    } forEach _data;
};

if (_index isEqualTo -1) then {
    _data pushBack [_ctrl,_num];
} else {
    _value = ((_data select _index) select 1);
    _data set[_index,[_ctrl,(_value + _num)]];
};

_entreprise setVariable ["entreprise_items_2",_data,true];
[_entreprise] call max_entreprise_fnc_stockageInventory2;

[3] call SOCK_fnc_updatePartial;
[(_entreprise getVariable ["entreprise_id",0]),9,(_entreprise getVariable ["entreprise_items_2",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
_ctrl_name = getText (missionConfigFile >> "VirtualItems" >> _ctrl >> "displayName");

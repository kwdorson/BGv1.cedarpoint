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

if ((lbCurSel 5459) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_ITEM"] call max_entreprise_fnc_localize)};
_item = lbData[5459,(lbCurSel 5459)];
if (lbValue[5459,(lbCurSel 5459)] == 1) exitWith {hint (["STR_BAD_SELECTION_ITEM"] call max_entreprise_fnc_localize)};

_oldPrices = _entreprise getVariable ["entreprise_prices",[]];
_index = -1;
_price = 0;
if ((count _oldPrices) > 0) then {
    {
        if (_item isEqualTo (_x select 0)) exitWith {
            _index = _forEachIndex;
            _price = (_x select 1);
        };
    } forEach _oldPrices;
};

if (_index isEqualTo -1) exitWith {};
_oldPrices deleteAt _index;
_entreprise setVariable ["entreprise_prices",_oldPrices,true];

[(_entreprise getVariable ["entreprise_id",0]),4,(_entreprise getVariable ["entreprise_prices",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
hint format [(["STR_REMOVE_ITEM_SUCCES"] call max_entreprise_fnc_localize),localize (getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName"))];
[] call max_entreprise_fnc_editEntrepriseMenu;
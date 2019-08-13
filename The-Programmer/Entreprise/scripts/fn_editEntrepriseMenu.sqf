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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
_type = param [0,0,[0]];

if (_type == 1) then {createDialog "entreprise_pdg_menu";};
disableSerialization;

_display = findDisplay 5450;

(_display displayCtrl 5455) ctrlSetText (_entreprise getVariable ["entreprise_name",""]);
(_display displayCtrl 5457) ctrlSetText (_entreprise getVariable ["entreprise_pdg_name",""]);
(_display displayCtrl 5464) ctrlSetText (["STR_PRICE_TEXT"] call max_entreprise_fnc_localize);
(_display displayCtrl 5471) ctrlSetText (([(_entreprise getVariable ["entreprise_bankacc",0])] call life_fnc_numberText) + (["STR_MONEY"] call max_entreprise_fnc_localize));
(_display displayCtrl 5472) ctrlSetText (["STR_MONTANT"] call max_entreprise_fnc_localize);

if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "fr") then {
    if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) then {
        (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menuassocie.paa";
        (_display displayCtrl 5465) buttonSetAction "[] spawn max_entreprise_fnc_entrepriseLeave;";
        ctrlShow [5474,false];
        ctrlShow [5475,false];
        ctrlShow [5473,false];
        ctrlShow [5470,false];
    } else {
        if ((_entreprise getVariable ["entreprise_position",""]) == "") then {
                (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg.paa";
            (_display displayCtrl 5473) buttonSetAction "[] spawn max_entreprise_fnc_displayAllAvailablesPositions;";
        } else {
            (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg2.paa";
            (_display displayCtrl 5473) buttonSetAction "closeDialog 0; [1] spawn max_entreprise_fnc_objectsPlaceMenu;";
        };
    };
} else {
    if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "de") then {
        if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) then {
            (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menuassocie_de.paa";
            (_display displayCtrl 5465) buttonSetAction "[] spawn max_entreprise_fnc_entrepriseLeave;";
            ctrlShow [5474,false];
            ctrlShow [5475,false];
            ctrlShow [5473,false];
            ctrlShow [5470,false];
        } else {
            if ((_entreprise getVariable ["entreprise_position",""]) == "") then {
                (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg_de.paa";
                (_display displayCtrl 5473) buttonSetAction "[] spawn max_entreprise_fnc_displayAllAvailablesPositions;";
            } else {
                (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg2_de.paa";
                (_display displayCtrl 5473) buttonSetAction "closeDialog 0; [1] spawn max_entreprise_fnc_objectsPlaceMenu;";
            };
        };
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "es") then {
            if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) then {
                (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menuassocie_es.paa";
                (_display displayCtrl 5465) buttonSetAction "[] spawn max_entreprise_fnc_entrepriseLeave;";
                ctrlShow [5474,false];
                ctrlShow [5475,false];
                ctrlShow [5473,false];
                ctrlShow [5470,false];
            } else {
                if ((_entreprise getVariable ["entreprise_position",""]) == "") then {
                    (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg_es.paa";
                    (_display displayCtrl 5473) buttonSetAction "[] spawn max_entreprise_fnc_displayAllAvailablesPositions;";
                } else {
                    (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg2_es.paa";
                    (_display displayCtrl 5473) buttonSetAction "closeDialog 0; [1] spawn max_entreprise_fnc_objectsPlaceMenu;";
                };
            };
        } else {
            if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) then {
                (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menuassocie_en.paa";
                (_display displayCtrl 5465) buttonSetAction "[] spawn max_entreprise_fnc_entrepriseLeave;";
                ctrlShow [5474,false];
                ctrlShow [5475,false];
                ctrlShow [5473,false];
                ctrlShow [5470,false];
            } else {
                if ((_entreprise getVariable ["entreprise_position",""]) == "") then {
                    (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg_en.paa";
                    (_display displayCtrl 5473) buttonSetAction "[] spawn max_entreprise_fnc_displayAllAvailablesPositions;";
                } else {
                    (_display displayCtrl 5451) ctrlSetText "The-Programmer\Entreprise\textures\menupdg2_en.paa";
                    (_display displayCtrl 5473) buttonSetAction "closeDialog 0; [1] spawn max_entreprise_fnc_objectsPlaceMenu;";
                };
            };
        };
    };
};

_employesList = _display displayCtrl 5453;
lbClear _employesList;
_allPlayersList = _display displayCtrl 5454;
lbClear _allPlayersList;
_itemsList = _display displayCtrl 5459;
lbClear _itemsList;
_allItemsList = _display displayCtrl 5463;
lbClear _allItemsList;

_data = _entreprise getVariable ["entreprise_members",[]];
if (count _data > 0) then {
    {
        _type = switch (_x select 2) do { 
            case 0 : {(["STR_EMPLOYE_TEXT"] call max_entreprise_fnc_localize)};
            case 1 : {(["STR_ASSOCIE_TEXT"] call max_entreprise_fnc_localize)};
            case 2 : {(["STR_PDG_TEXT"] call max_entreprise_fnc_localize)};
            default {""};
        };
        _employesList lbAdd format ["%2 %1",_x select 1,_type];
        _employesList lbSetData [(lbSize _employesList)-1,str(_x)];
        if ((_x select 2) isEqualTo 2) then {_employesList lbSetColor [(lbSize _employesList)-1,[0,120,255,1]];};
        if ((_x select 2) isEqualTo 1) then {_employesList lbSetColor [(lbSize _employesList)-1,[250,125,0,1]];};
        if ((_x select 0) isEqualTo (getPlayerUID player)) then {_employesList lbSetColor [(lbSize _employesList)-1,[0,255,0,1]];};
    } forEach _data;
};


{
    if (!isNull _x && alive _x && !(_x isEqualTo player)) then {
        if ((side _x) == civilian) then {
            _allPlayersList lbAdd format ["%1",_x getVariable ["realname",name _x]];
            _allPlayersList lbSetData [(lbSize _allPlayersList)-1,str(_x)];
        };
    };
} forEach playableUnits;


_data2 = _entreprise getVariable ["entreprise_prices",[]];
if (count _data2 > 0) then {
    {
        _itemsList lbAdd format ["%1 (%2€)",localize (getText (missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName")),(_x select 1)];
        _itemsList lbSetData [(lbSize _itemsList)-1,(_x select 0)];
        _itemsList lbSetValue [(lbSize _itemsList)-1,0];
        _icon = getText (missionConfigFile >> "VirtualItems" >> (_x select 0) >> "icon");
        if (!(_icon isEqualTo "")) then {
            _itemsList lbSetPicture [(lbSize _itemsList)-1,_icon];
        };
    } forEach _data2;
};


{
    _allItemsList lbAdd format ["%1",localize (getText(_x >> "displayName"))];
    _allItemsList lbSetData [(lbSize _allItemsList)-1,configName _x];
    _icon = (getText(_x >> "icon"));
    if (!(_icon isEqualTo "")) then {
        _allItemsList lbSetPicture [(lbSize _allItemsList)-1,_icon];
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

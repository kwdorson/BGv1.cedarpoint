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
if (isNull _entreprise) exitWith {};

createDialog "employes_menu_entreprise";

disableSerialization;

_display = findDisplay 5440;

if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 5445) ctrlSetText "The-Programmer\Entreprise\textures\menuemployes.paa";
} else {
    if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 5445) ctrlSetText "The-Programmer\Entreprise\textures\menuemployes_de.paa";
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "es") then {
            (_display displayCtrl 5445) ctrlSetText "The-Programmer\Entreprise\textures\menuemployes_es.paa";
        } else {
            (_display displayCtrl 5445) ctrlSetText "The-Programmer\Entreprise\textures\menuemployes_en.paa";
        };
    };
};

(_display displayCtrl 5443) ctrlSetText (_entreprise getVariable ["entreprise_name",[]]);
(_display displayCtrl 5444) ctrlSetText (_entreprise getVariable ["entreprise_pdg_name",""]);

_control = _display displayCtrl 5448;
lbClear _control;

_data = _entreprise getVariable ["entreprise_members",[]];
if (count _data > 0) then {
    {
        _type = switch (_x select 2) do { 
            case 0 : {(["STR_EMPLOYE_TEXT"] call max_entreprise_fnc_localize)};
            case 1 : {(["STR_ASSOCIE_TEXT"] call max_entreprise_fnc_localize)};
            case 2 : {(["STR_PDG_TEXT"] call max_entreprise_fnc_localize)};
            default {""};
        };
        _control lbAdd format ["%2 %1",_x select 1,_type];
        if ((_x select 2) isEqualTo 2) then {_control lbSetColor [(lbSize _control)-1,[0,120,255,1]];};
        if ((_x select 2) isEqualTo 1) then {_control lbSetColor [(lbSize _control)-1,[250,125,0,1]];};
        if ((_x select 0) isEqualTo (getPlayerUID player)) then {_control lbSetColor [(lbSize _control)-1,[0,255,0,1]];};
    } forEach _data;
} else {
    _control lbAdd (["STR_NONE"] call max_entreprise_fnc_localize);
};

_control2 = _display displayCtrl 5446;
lbClear _control2;

_data2 = _entreprise getVariable ["entreprise_prices",[]];
if (count _data2 > 0) then {
    {
        _control2 lbAdd format ["%1 (%2€)",(_x select 0),(_x select 1)];
        _icon = getText (missionConfigFile >> "VirtualItems" >> (_x select 0) >> "icon");
        if (!(_icon isEqualTo "")) then {
            _control2 lbSetPicture [(lbSize _control2)-1,_icon];
        };
    } forEach _data2;
} else {
    _control2 lbAdd (["STR_NONE"] call max_entreprise_fnc_localize);
};

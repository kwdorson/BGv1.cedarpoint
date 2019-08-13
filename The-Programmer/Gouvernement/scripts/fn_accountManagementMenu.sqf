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
_type = param [0,0,[0]];
if (_type isEqualTo 0) exitWith {};

if ((_type isEqualTo 1) && ((call life_coplevel) < (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "min_coplevel_for_use_cop_account")))) exitWith {};
if ((_type isEqualTo 2) && ((call life_mediclevel) < (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "min_mediclevel_for_use_cop_account")))) exitWith {};

if (!dialog) then {
    createDialog "maxence_compte";
    uiNamespace setVariable ["account_type",_type];
};

disableSerialization;
_display = findDisplay 2500;

if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 2501) ctrlSetText "The-Programmer\Gouvernement\textures\gestioncompte.paa";
} else {
    if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 2501) ctrlSetText "The-Programmer\Gouvernement\textures\gestioncompte_de.paa";
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "es") then {
            (_display displayCtrl 2501) ctrlSetText "The-Programmer\Gouvernement\textures\gestioncompte_es.paa";
        } else {
            (_display displayCtrl 2501) ctrlSetText "The-Programmer\Gouvernement\textures\gestioncompte_en.paa";
        };
    };
};


switch (_type) do { 
    case 1 : {
        (_display displayCtrl 2502) ctrlSetText format ["%1%2",[maxence_compte_cop] call life_fnc_numberText,(["STR_MONEY"] call max_gouvernement_fnc_localize)];
    };
    case 2 : {
        (_display displayCtrl 2502) ctrlSetText format ["%1%2",[maxence_compte_med] call life_fnc_numberText,(["STR_MONEY"] call max_gouvernement_fnc_localize)];
    };
};

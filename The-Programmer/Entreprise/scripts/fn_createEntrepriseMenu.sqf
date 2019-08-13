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
_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
_config = _curConfig >> "types_entreprises";

_exit = false;
if ((isNull _entreprise) && (getNumber (_curConfig >> "allow_acces_to_create_company_forearch_player") isEqualTo 0)) then {
    _exit = true;
    {
        if (missionNamespace getVariable [_x,false]) exitWith {_exit = false;};
    } forEach getArray (_curConfig >> "allowed_licenses");
    if ((getPlayerUID player) in (getArray (_curConfig >> "allowed_playerid"))) exitWith {_exit = false;};
};
if (_exit) exitWith {hint (["STR_NOT_ACCES"] call max_entreprise_fnc_localize);};

createDialog "entreprise_create";
disableSerialization;
_display = findDisplay 5430;
(_display displayCtrl 5434) ctrlSetText (name player);
(_display displayCtrl 5427) ctrlSetText format ["0%1",(["STR_MONEY"] call max_entreprise_fnc_localize)];

if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "fr") then {
    if (!isNull _entreprise) then {
        if ((getPlayerUID player) == (_entreprise getVariable ["entreprise_pdg_pid",""])) then {
            (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\editentreprisepc.paa";
            (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_changeTypeEntreprise;";
            ctrlShow [5433,false];
            (_display displayCtrl 5438) ctrlSetText (_entreprise getVariable ["entreprise_name",""]);
            if (isClass (_config >> (_entreprise getVariable ["entreprise_type",""]))) then {(_display displayCtrl 5428) ctrlSetText getText(_config >> (_entreprise getVariable ["entreprise_type",""]) >> "displayName")};
        } else {
            (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc.paa";
            (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
        };
    } else {
        ctrlShow [5438,false];
        (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc.paa";
        (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
    };
} else {
    if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "de") then {
        if (!isNull _entreprise) then {
            if ((getPlayerUID player) == (_entreprise getVariable ["entreprise_pdg_pid",""])) then {
                (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\editentreprisepc_de.paa";
                (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_changeTypeEntreprise;";
                ctrlShow [5433,false];
                (_display displayCtrl 5438) ctrlSetText (_entreprise getVariable ["entreprise_name",""]);
                if (isClass (_config >> (_entreprise getVariable ["entreprise_type",""]))) then {(_display displayCtrl 5428) ctrlSetText getText(_config >> (_entreprise getVariable ["entreprise_type",""]) >> "displayName")};
            } else {
                (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_de.paa";
                (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
            };
        } else {
            ctrlShow [5438,false];
            (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_de.paa";
            (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
        };
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Entreprise" >> "default_lang") isEqualTo "es") then {
            if (!isNull _entreprise) then {
                if ((getPlayerUID player) == (_entreprise getVariable ["entreprise_pdg_pid",""])) then {
                    (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\editentreprisepc_es.paa";
                    (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_changeTypeEntreprise;";
                    ctrlShow [5433,false];
                    (_display displayCtrl 5438) ctrlSetText (_entreprise getVariable ["entreprise_name",""]);
                    if (isClass (_config >> (_entreprise getVariable ["entreprise_type",""]))) then {(_display displayCtrl 5428) ctrlSetText getText(_config >> (_entreprise getVariable ["entreprise_type",""]) >> "displayName")};
                } else {
                    (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_es.paa";
                    (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
                };
            } else {
                ctrlShow [5438,false];
                (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_es.paa";
                (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
            };
        } else {
            if (!isNull _entreprise) then {
                if ((getPlayerUID player) == (_entreprise getVariable ["entreprise_pdg_pid",""])) then {
                    (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\editentreprisepc_en.paa";
                    (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_changeTypeEntreprise;";
                    ctrlShow [5433,false];
                    (_display displayCtrl 5438) ctrlSetText (_entreprise getVariable ["entreprise_name",""]);
                    if (isClass (_config >> (_entreprise getVariable ["entreprise_type",""]))) then {(_display displayCtrl 5428) ctrlSetText getText(_config >> (_entreprise getVariable ["entreprise_type",""]) >> "displayName")};
                } else {
                    (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_en.paa";
                    (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
                };
            } else {
                ctrlShow [5438,false];
                (_display displayCtrl 5431) ctrlSetText "The-Programmer\Entreprise\textures\creeentreprisepc_en.paa";
                (_display displayCtrl 5429) buttonSetAction "[] spawn max_entreprise_fnc_createEntreprise;";
            };
        };
    };
};

_typeList = _display displayCtrl 5432;
lbClear _typeList;

for "_i" from 0 to count(_config)-1 do {
    _curConfig = _config select _i;
    _typeList lbAdd format ["%1",getText (_curConfig >> "displayName")];
    _typeList lbSetData [(lbSize _typeList)-1,(configName _curConfig)];
};

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
_value = parseNumber (ctrlText 6792);

if (_value <= 0) exitWith {hint (["STR_CANT_DECLARE_REVENU"] call max_gouvernement_fnc_localize);};

_taxe = ((maxence_taxes select 0) / 100) * _value;
_exit = false;
_mode = 3;

if ((getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "companies_script_enable")) isEqualTo 1) then {
    _mode = 4;

    _entreprise = player getVariable ["current_entreprise",objNull];
    if (isNull _entreprise) exitWith {_exit = true; closeDialog 0; hint (["STR_NOT_COMPANY_CEO"] call max_gouvernement_fnc_localize);};
    _companyACC = _entreprise getVariable ["entreprise_bankacc",0];
    if (_companyACC < _taxe) exitWith {_exit = true; hint (["STR_NOT_ENOUGHT_MONEY_COMPANY"] call max_gouvernement_fnc_localize);};

    _companyACC = _companyACC - _taxe;
    _entreprise setVariable ["entreprise_bankacc",_companyACC,true];
    [(_entreprise getVariable ["entreprise_id",0]),5,(_entreprise getVariable ["entreprise_bankacc",0])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
    [_entreprise,(name player),_taxe,1] remoteExecCall ["max_entreprise_fnc_insertEntrepriseLogs",2];

    hint format [(["STR_SUCCES_DECLARE_REVENU_COMPANY"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,[_taxe] call life_fnc_numberText];
} else {
    hint format [(["STR_SUCCES_DECLARE_REVENU_BANK"] call max_gouvernement_fnc_localize),[_value] call life_fnc_numberText,[_taxe] call life_fnc_numberText];
    if (life_fishFinder < _taxe) exitWith {_exit = true; hint (["STR_NOT_ENOUGHT_MONEY_BANK"] call max_gouvernement_fnc_localize);};
    life_fishFinder = life_fishFinder - _taxe;
    [1] call SOCK_fnc_updatePartial;
};

if (_exit) exitWith {};

maxence_compte_gouv = maxence_compte_gouv + _taxe;
publicVariable "maxence_compte_gouv";

closeDialog 0;

[maxence_compte_gouv,maxence_compte_cop,maxence_compte_med,(name player),_mode,0,_taxe,3] remoteExec ["max_gouvernement_fnc_updateAccounts",2];

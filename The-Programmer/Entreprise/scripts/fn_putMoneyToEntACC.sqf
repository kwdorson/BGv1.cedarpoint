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
private ["_amount","_entreprise"];
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};

_amount = parseNumber(ctrlText 5472);
if (_amount <= 0) exitWith {hint localize "STR_ATM_notnumeric"};

_oldEntACC = _entreprise getVariable ["entreprise_bankacc",0];
if (life_atmbank < _amount) exitWith {hint (["STR_NOT_ENOUGHT_MONEY"] call max_entreprise_fnc_localize)};

hint (["STR_TRANSFERING"] call max_entreprise_fnc_localize);
disableUserInput true;
uiSleep 3;
disableUserInput false;
life_atmbank = life_atmbank - _amount;
_oldEntACC = _oldEntACC + _amount;
[1] call SOCK_fnc_updatePartial;
_entreprise setVariable ["entreprise_bankacc",_oldEntACC,true];

[(_entreprise getVariable ["entreprise_id",0]),5,(_entreprise getVariable ["entreprise_bankacc",0])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
[_entreprise,(name player),_amount,2] remoteExecCall ["max_entreprise_fnc_insertEntrepriseLogs",2];
hint format [(["STR_TRANSFERT_TO_ENTACC_SUCCES"] call max_entreprise_fnc_localize),[_amount] call life_fnc_numberText];
[] call max_entreprise_fnc_editEntrepriseMenu;
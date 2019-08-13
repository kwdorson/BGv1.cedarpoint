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
_name = ctrlText 5433;

if (_name == "") exitWith {hint (["STR_BAD_NAME_ENTREPRISE"] call max_entreprise_fnc_localize)};
if !(isNull (player getVariable "current_entreprise")) exitWith {hint (["STR_YOU_HAVE_ALREAY_ENTREPRISE"] call max_entreprise_fnc_localize)};
if ((ctrlText 5439) == "") exitWith {hint (["STR_BAD_SIGN"] call max_entreprise_fnc_localize)};

if ((lbCurSel 5432) isEqualTo -1) exitWith {hint (["STR_YOU_MUST_SELECT_A_TYPE"] call max_entreprise_fnc_localize)};
_type = CONTROL_DATA(5432);
_price = getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type >> "price");

_valid = true;

{
    if (((_x select 1) getVariable ["entreprise_name",""]) == _name) exitWith {_valid = false;};
} forEach maxence_all_entreprises;

if !(_valid) exitWith {hint (["STR_NAME_ALREADY_EXIST"] call max_entreprise_fnc_localize)};

if (civRDMed < _price) exitWith {hint format ["%1 (%2%3)",(["STR_NOT_ENOUGHT_MONEY"] call max_entreprise_fnc_localize),([_price] call life_fnc_numberText),(["STR_MONEY"] call max_entreprise_fnc_localize)];};

closeDialog 0;

_action = [
    format [(["STR_CREATE_ENTREPRISE_TEXT"] call max_entreprise_fnc_localize),_name,[_price] call life_fnc_numberText],
    (["STR_CREATE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

[_name,player,_type] remoteExec ["max_entreprise_fnc_insertEntreprise",2];
hint format [(["STR_SUCCES_CREATED"] call max_entreprise_fnc_localize),_name];
civRDMed = civRDMed - _price;
[1] call SOCK_fnc_updatePartial;

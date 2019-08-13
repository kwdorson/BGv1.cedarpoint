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
if (isNull _entreprise) exitWith {[] call max_entreprise_fnc_createEntrepriseMenu;};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {};

if ((ctrlText 5439) == "") exitWith {hint (["STR_BAD_SIGN"] call max_entreprise_fnc_localize)};
if ((lbCurSel 5432) isEqualTo -1) exitWith {hint (["STR_YOU_MUST_SELECT_A_TYPE"] call max_entreprise_fnc_localize)};
_type = CONTROL_DATA(5432);
_price = getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type >> "price");

_actualType = _entreprise getVariable ["entreprise_type",""];
_config = missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _actualType;
if (!isClass _config) exitWith {};
_actualPrice = getNumber (_config >> "price");
_price = _price - _actualPrice;

if (_price < 0) then {_price = 0;};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "types_entreprises" >> _type;
if (!isClass _curConfig) exitWith {};
_employesMax = getNumber (_curConfig >> "max_players");
_communMax = getNumber (_curConfig >> "max_stock_commum");
_privateMax = getNumber (_curConfig >> "max_stock_private");

if (count (_entreprise getVariable ["entreprise_members",[]]) > _employesMax) exitWith {hint (["STR_TOO_MANY_EMPLOYES"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_maxstock",0]) > _communMax) exitWith {hint (["STR_TOO_BIG_COMMUM"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_maxstock_2",0]) > _privateMax) exitWith {hint (["STR_TOO_BIG_PRIVATE"] call max_entreprise_fnc_localize)};
if (civRDMed < _price) exitWith {hint format ["%1 (%2%3)",(["STR_NOT_ENOUGHT_MONEY"] call max_entreprise_fnc_localize),([_price] call life_fnc_numberText),(["STR_MONEY"] call max_entreprise_fnc_localize)];};

closeDialog 0;
civRDMed = civRDMed - _price;
[1] call SOCK_fnc_updatePartial;
_entreprise setVariable ["entreprise_type",_type,true];
[(_entreprise getVariable ["entreprise_id",0]),12,(_entreprise getVariable ["entreprise_type",""])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
hint format [(["STR_SUCCES_EDITED"] call max_entreprise_fnc_localize),getText (_curConfig >> "displayName")];

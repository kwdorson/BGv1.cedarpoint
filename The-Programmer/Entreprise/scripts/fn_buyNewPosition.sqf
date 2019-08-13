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
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if !(selecting_position) exitWith {};
if (life_action_inUse) exitWith {};
life_action_inUse = true;

_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
_valid = false;
_marker = "";

{
    if (player distance (getMarkerPos (getText (_curConfig >> "positions_entreprises" >> _x >> "markerVar"))) < getNumber (_curConfig >> "positions_entreprises" >> _x >> "radius")) exitWith {
        _valid = true;
        _marker = _x;
    };
} forEach maxence_allPos_selecting;

if !(_valid) exitWith {life_action_inUse = false;};

_curBankACC = _entreprise getVariable ["entreprise_bankacc",0];
_price = getNumber (_curConfig >> "positions_entreprises" >> _marker >> "price");

_action = [
    format [(["STR_BUY_LAND_ENTERPRISE_TEXT"] call max_entreprise_fnc_localize),[_price] call life_fnc_numberText,getNumber (_curConfig >> "positions_entreprises" >> _marker >> "radius")],
    (["STR_BUY_LAND_ENTERPRISE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {life_action_inUse = false;};
if (_curBankACC < _price) exitWith {hint (["STR_NOT_ENOUGHT_MONEY_ENTREPRISE_ACC"] call max_entreprise_fnc_localize); life_action_inUse = false;};

_entreprise setVariable ["entreprise_bankacc",(_curBankACC - _price),true];
[(_entreprise getVariable ["entreprise_id",0]),5,(_entreprise getVariable ["entreprise_bankacc",0])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];
[_entreprise,(name player),_price,4] remoteExecCall ["max_entreprise_fnc_insertEntrepriseLogs",2];

_entreprise setVariable ["entreprise_position",_marker,true];
[(_entreprise getVariable ["entreprise_id",0]),7,(_entreprise getVariable ["entreprise_position",""])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

hint (["STR_SUCCES_BUY_LAND"] call max_entreprise_fnc_localize);

_markerVar = getText (_curConfig >> "positions_entreprises" >> _marker >> "markerVar");
_markerVar setMarkerAlpha 1;
_markerVar setMarkerText format[(["STR_CLOSED"] call max_entreprise_fnc_localize),(_entreprise getVariable ["entreprise_name",""])];
_markerVar setMarkerColor getText(_curConfig >> "close_color");

selecting_position = false;
life_action_inUse = false;

maxence_allPos_selecting deleteAt (maxence_allPos_selecting find _marker);

{
    (getText (_curConfig >> "positions_entreprises" >> _x >> "markerVar")) setMarkerAlphaLocal 0;
} foreach maxence_allPos_selecting;

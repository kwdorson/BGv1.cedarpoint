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
private ["_entreprise"];
_obj = cursorObject;
if (isNull _obj) exitWith {};
_requiredLicense = _obj getVariable ["required_license",""];
if (_requiredLicense == "") exitWith {};
if !(missionNamespace getVariable [_requiredLicense,false]) exitWith {hint (["STR_YOU_ARE_NOT_ALLOWED"] call max_entreprise_fnc_localize)};

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};

_action = true;

if (((_entreprise getVariable ["entreprise_pdg_pid",[]]) == (getPlayerUID player)) || (((_entreprise getVariable ["entreprise_members",[]]) find [(getPlayerUID player),(name player),1]) != -1)) then {
    _action = [
        (["STR_SELECT_STORAGE_TEXT"] call max_entreprise_fnc_localize),
        (["STR_SELECT_STORAGE_HEADER"] call max_entreprise_fnc_localize),
        (["STR_STORAGE_EMPLOYES"] call max_entreprise_fnc_localize),
        (["STR_STORAGE_PRIVATE"] call max_entreprise_fnc_localize)
    ] call BIS_fnc_guiMessage;
};

if !(_action) exitWith {[] spawn max_entreprise_fnc_openStockage2;};

if (_entreprise getVariable ["entreprise_stockage_openned",false]) exitWith {hint (["STR_STOCKAGE_ALREADY_OPENNED"] call max_entreprise_fnc_localize)};
_entreprise setVariable ["entreprise_stockage_openned",true,true];
_entreprise setVariable ["entreprise_stockage_openned_by",player,true];

createDialog "entreprise_stockage";
disableSerialization;

_display = findDisplay 9640;

(_display displayCtrl 9641) ctrlSetText (["STR_STORAGE_ENTREPRISE"] call max_entreprise_fnc_localize);
(_display displayCtrl 9642) ctrlSetText (["STR_STORAGE_PLAYER"] call max_entreprise_fnc_localize);
(_display displayCtrl 9643) ctrlSetText (["STR_STOCKAGE_HEADER"] call max_entreprise_fnc_localize);

ctrlEnable [9647,false]; 
ctrlEnable [9648,false];

if ((_entreprise getVariable ["entreprise_pdg_pid",""]) == (getPlayerUID player)) then {ctrlEnable [9647,true]; ctrlEnable [9648,true];};
if (((_entreprise getVariable "entreprise_members") find [(getPlayerUID player),(name player),1]) != -1) then {ctrlEnable [9647,true]; ctrlEnable [9648,true];};

[_entreprise] call max_entreprise_fnc_stockageInventory;

waitUntil {isNull (findDisplay 9640)};
_entreprise setVariable ["entreprise_stockage_openned",false,true];
_entreprise setVariable ["entreprise_stockage_openned_by",objNull,true];
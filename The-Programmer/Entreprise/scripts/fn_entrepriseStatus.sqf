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
private ["_marker","_name","_text","_markerText"];
(_this select 3) params [
	["_marker","",[""]],
	["_name","",[""]]
];

_obj = cursorObject;
if (isNull _obj) exitWith {};
_requiredLicense = _obj getVariable ["required_license",""];
if (_requiredLicense == "") exitWith {};
if (getNumber (missionConfigFile >> "Max_Settings_Entreprise" >> "open_or_close_for_new_employes") == 0) then {_requiredLicense = format ["%1_full_acces",_requiredLicense];};
if !(missionNamespace getVariable [_requiredLicense,false]) exitWith {hint (["STR_YOU_ARE_NOT_ALLOWED"] call max_entreprise_fnc_localize)};

_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};

if (_entreprise getVariable ["entreprise_status",false]) then {
    _entreprise setVariable ["entreprise_status",false,true];
    _marker setMarkerText format[(["STR_CLOSED"] call max_entreprise_fnc_localize),_name];
    _marker setMarkerColor getText(missionConfigFile >> "Max_Settings_Entreprise" >> "close_color");
} else {
    _entreprise setVariable ["entreprise_status",true,true];
    _marker setMarkerText format[(["STR_OPEN"] call max_entreprise_fnc_localize),_name];
    _marker setMarkerColor getText(missionConfigFile >> "Max_Settings_Entreprise" >> "open_color");
};

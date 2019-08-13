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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
_action = [
    (["STR_DISBAND_ENTERPRISE_TEXT"] call max_entreprise_fnc_localize),
    (["STR_DISBAND_ENTERPRISE_HEADER"] call max_entreprise_fnc_localize),
    (["STR_YES"] call max_entreprise_fnc_localize),
    (["STR_NO"] call max_entreprise_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

_id = _entreprise getVariable ["entreprise_id",0];
if (_id == 0) exitWith {};

[(_entreprise getVariable ["entreprise_id",0]),2,0] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

maxence_all_entreprises deleteAt (maxence_all_entreprises find [_id,_entreprise]);
publicVariable "maxence_all_entreprises";

_marker = _entreprise getVariable ["entreprise_position",""];
if (_marker != "") then {
    _markerVar = getText (_curConfig >> "positions_entreprises" >> _marker >> "markerVar");
    _markerVar setMarkerAlpha 0;
};

_members = _entreprise getVariable ["entreprise_members",[]];

if ((count _members) > 0) then {
    {
        _curCheck = _x;
        {
            if ((getPlayerUID _curCheck) == (_x select 0)) then {
                [player,_entreprise] remoteExecCall ["max_entreprise_fnc_entrepriseBeKicked",_curCheck];
            };
        } forEach _members;
    } forEach playableUnits;
};

{
    if (_x isEqualType objNull) then {
        deleteVehicle _x;
    } else {
        deleteMarker _x;
    };
} forEach (_entreprise getVariable ["entreprise_objects",[]]);

closeDialog 0;
hint format [(["STR_DISBAND_ENTERPRISE_SUCCES"] call max_entreprise_fnc_localize),(_entreprise getVariable "entreprise_name")];
deleteVehicle _entreprise;
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
if !(maxence_placing_object_active) exitWith {};
if (maxence_placing_object == ObjNull) exitWith {};

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "positions_entreprises";
_marker = _entreprise getVariable ["entreprise_position",""];
_markerVar = getText (_curConfig >> _marker >> "markerVar");
if ((getPosATL maxence_placing_object) distance (getMarkerPos _markerVar) > getNumber (_curConfig >> _marker >> "radius")) exitWith {hint format [(["STR_TOO_FAR_FROM_MARKER"] call max_entreprise_fnc_localize),getNumber (_curConfig >> _marker >> "radius")]};

_nowObjects = _entreprise getVariable ["entreprise_objects",[]];
_nowObjectsTXT = _entreprise getVariable ["entreprise_objects_txt",[]];
_entreprise_id = _entreprise getVariable ["entreprise_id",0];

detach maxence_placing_object;
if ((typeOf maxence_placing_object) == "Sign_Arrow_Yellow_F") then {
    _direction = getDir maxence_placing_object;
    _position = getPosATL maxence_placing_object;
    deleteVehicle maxence_placing_object;
    maxence_placing_object_type_marker = true;
    maxence_placing_object = createMarker [format ["spawn_veh_entreprise_%1",_entreprise_id],_position];
    maxence_placing_object setMarkerType "Empty";
    maxence_placing_object setMarkerDir _direction;
    _nowObjectsTXT pushBack ["sp_marker",(getMarkerPos maxence_placing_object),(markerDir maxence_placing_object)];
} else {
    _hauteur = (getPosATL maxence_placing_object) select 2;
    if ([maxence_placing_object] call life_fnc_playerInBuilding) then {_hauteur = _hauteur + 0.5;};
    if ((typeof maxence_placing_object) isEqualTo "Land_InfoStand_V2_F") then {_hauteur = _hauteur + 0.1;};
    maxence_placing_object setPosATL [(getPosATL maxence_placing_object select 0),(getPosATL maxence_placing_object select 1),_hauteur];
    maxence_placing_object enableSimulationGlobal true;
    _nowObjectsTXT pushBack [(typeof maxence_placing_object),(getPosATL maxence_placing_object),[(vectorDir maxence_placing_object),(vectorUp maxence_placing_object)]];
};

_nowObjects pushBack maxence_placing_object;
_entreprise setVariable ["entreprise_objects",_nowObjects,true];

_entreprise setVariable ["entreprise_objects_txt",_nowObjectsTXT,true];
[(_entreprise getVariable ["entreprise_id",0]),8,(_entreprise getVariable ["entreprise_objects_txt",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

_requiredLicense = format ["entreprise_%1",_entreprise_id];
_members = _entreprise getVariable ["entreprise_members",[]];

if !(maxence_placing_object_type_marker) then {
    switch (typeof maxence_placing_object) do { 
        case "Land_InfoStand_V1_F" : {
            maxence_placing_object setVariable ["required_license",_requiredLicense,true];
            _entreprise_name = _entreprise getVariable ["entreprise_name",""];

            {
                _curCheck = _x;
                {
                    if ((getPlayerUID _curCheck) == (_x select 0)) then {
                        [maxence_placing_object,0,_markerVar,_entreprise_name] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",_curCheck];
                    };
                } forEach _members;
            } forEach playableUnits;

            hint (["STR_SUCCES_PLACE_STORAGE"] call max_entreprise_fnc_localize);
        };

        case "Land_InfoStand_V2_F" : {
            maxence_placing_object setVariable ["required_license",_requiredLicense,true];

            _markerSpawn = "";
            {
                if !(_x isEqualType objNull) exitWith {
                    _markerSpawn = _x;
                };
            } forEach _nowObjects;

            if (_markerSpawn != "") then {
                hint (["STR_SUCCES_PLACE_IMPOUND"] call max_entreprise_fnc_localize);
            } else {
                hint (["STR_SUCCES_PLACE_IMPOUND_WITHOUT_SPAWN_POINT"] call max_entreprise_fnc_localize);
            };

            {
                _curCheck = _x;
                {
                    if ((getPlayerUID _curCheck) == (_x select 0)) then {
                        [maxence_placing_object,1] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",_curCheck];
                    };
                } forEach _members;
            } forEach playableUnits;
        }; 

        default {}; 
    };
} else {
    hint (["STR_SUCCES_PLACE_MARKER"] call max_entreprise_fnc_localize);
};

maxence_placing_object_active = false;
maxence_placing_object = ObjNull;
maxence_placing_object_type_marker = false;

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
_object = param [0,objNull,[objNull]];
_type = param [1,0,[0]];

switch (_type) do { 
    case 0 : {
        _markerVar = param [2,"",[""]];
        _entreprise_name = param [3,"",[""]];
        _object addAction [(["STR_ACTION_OPENORCLOSE_MARKER"] call max_entreprise_fnc_localize),max_entreprise_fnc_entrepriseStatus,[_markerVar,_entreprise_name],0,false,false,"",''];
        _object addAction [(["STR_ACTION_STORAGE"] call max_entreprise_fnc_localize),max_entreprise_fnc_openStockage];
    };

    case 1 : {
        _object addAction[(["STR_GET_VEHICLE_ENTREPRISE_ACTION"] call max_entreprise_fnc_localize),{_obj = cursorObject; if (isNull _obj) exitWith {}; _requiredLicense = _obj getVariable ["required_license",""]; if (_requiredLicense == "") exitWith {}; if !(missionNamespace getVariable [_requiredLicense,false]) exitWith {hint (["STR_YOU_ARE_NOT_ALLOWED"] call max_entreprise_fnc_localize)}; _entreprise = player getVariable ["current_entreprise",objNull]; if (isNull _entreprise) exitWith {}; _entreprise_id = _entreprise getVariable ["entreprise_id",0]; if (_entreprise_id == 0) exitWith {}; [getPlayerUID player,playerSide,"Car",player,_entreprise_id] remoteExecCall ["max_entreprise_fnc_getVehiclesEntreprise",2]; createDialog "entreprise_impound_menu";  disableSerialization;  ctrlSetText[1802,"Fetching Vehicles...."];  maxence_entreprise_sp = format ["spawn_veh_entreprise_%1",_entreprise_id];}]; 
        _object addAction[(["STR_STORE_VEHICLE_ENTREPRISE_ACTION"] call max_entreprise_fnc_localize),max_entreprise_fnc_storeVehicleEnt,"",0,false,false,"",'!life_garage_store'];
    };
};

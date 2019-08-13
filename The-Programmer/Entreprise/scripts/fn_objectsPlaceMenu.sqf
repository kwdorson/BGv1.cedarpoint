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
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable "entreprise_pdg_pid") != (getPlayerUID player)) exitWith {[] call max_entreprise_fnc_memberEntrepriseMenu;};
_type = param [0,0,[0]];

if (_type == 1) then {createDialog "entreprise_objects_place_menu";};
disableSerialization;

_display = findDisplay 5480;

ctrlShow [5483,false];
(_display displayCtrl 5481) ctrlSetText (["STR_AVAILABLE_ITEMS"] call max_entreprise_fnc_localize);

_allItemsList = _display displayCtrl 5482;
lbClear _allItemsList;

_nowObjects = _entreprise getVariable ["entreprise_objects",[]];

_amount1 = 0;
_amount2 = 0;
_amount3 = 0;

if ((count _nowObjects) > 0) then {
    {
        if (_x isEqualType objNull) then {
            switch (typeof _x) do { 
                case "Land_InfoStand_V1_F" : {_amount1 = _amount1 + 1;};
                case "Land_InfoStand_V2_F" : {_amount2 = _amount2 + 1;};
                default {}; 
            };
        } else {
            _amount3 = _amount3 + 1;
        };
    } forEach _nowObjects;
};

_allItemsList lbAdd format [(["STR_OBJECT_STORAGE"] call max_entreprise_fnc_localize),_amount1,1];
_allItemsList lbSetData [(lbSize _allItemsList)-1,"Land_InfoStand_V1_F"];

_allItemsList lbAdd format [(["STR_OBJECT_IMPOUNDMENU"] call max_entreprise_fnc_localize),_amount2,1];
_allItemsList lbSetData [(lbSize _allItemsList)-1,"Land_InfoStand_V2_F"];

_allItemsList lbAdd format [(["STR_OBJECT_SPAWNPOINT"] call max_entreprise_fnc_localize),_amount3,1];
_allItemsList lbSetData [(lbSize _allItemsList)-1,"sp_marker"];

_curConfig = missionConfigFile >> "Max_Settings_Entreprise" >> "positions_entreprises";
_marker = _entreprise getVariable ["entreprise_position",""];
if (player distance (getMarkerPos (getText (_curConfig >> _marker >> "markerVar"))) > getNumber (_curConfig >> _marker >> "radius")) then {hint format [(["STR_TOO_FAR_FROM_MARKER"] call max_entreprise_fnc_localize),getNumber (_curConfig >> _marker >> "radius")]};

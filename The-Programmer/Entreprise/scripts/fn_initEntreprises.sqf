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
player setVariable ["current_entreprise",objNull,true];
_curConfig = missionConfigFile >> "Max_Settings_Entreprise";
selecting_position = false;

for "_i" from 0 to count(_curConfig >> "positions_entreprises") -1 do {
    _curConfigCheck = (_curConfig >> "positions_entreprises") select _i;
    _marker = getText (_curConfigCheck >> "markerVar");
    _marker setMarkerAlphaLocal 0;
};

{
    _id = (_x select 0);
    _curObjCheck = (_x select 1);
    missionNamespace setVariable [format ["entreprise_%1",_id],false];
    missionNamespace setVariable [format ["entreprise_%1_full_acces",_id],false];

    _curMarkerCheck = _curObjCheck getVariable ["entreprise_position",""];
    if (_curMarkerCheck != "") then {
        _marker = getText (_curConfig >> "positions_entreprises" >> _curMarkerCheck >> "markerVar");
        _marker setMarkerAlphaLocal 1;
        if (_curObjCheck getVariable ["entreprise_status",false]) then {
            _marker setMarkerTextLocal format[(["STR_OPEN"] call max_entreprise_fnc_localize),(_curObjCheck getVariable ["entreprise_name",""])];
            _marker setMarkerColorLocal getText(missionConfigFile >> "Max_Settings_Entreprise" >> "open_color");
        } else {
            _marker setMarkerTextLocal format[(["STR_CLOSED"] call max_entreprise_fnc_localize),(_curObjCheck getVariable ["entreprise_name",""])];
            _marker setMarkerColorLocal getText(missionConfigFile >> "Max_Settings_Entreprise" >> "close_color");
        };
    };

    {
        if ((_x select 0) == (getPlayerUID player)) then {
            player setVariable ["current_entreprise",_curObjCheck,true];
            missionNamespace setVariable [format ["entreprise_%1",_id],true];
            if ((_x select 2) != 0) then {missionNamespace setVariable [format ["entreprise_%1_full_acces",_id],true];};

            {
                if (_x isEqualType objNull) then {
                    switch (typeOf _x) do { 
                        case "Land_InfoStand_V1_F" : {
                            _markerVar = getText (_curConfig >> "positions_entreprises" >> _curMarkerCheck >> "markerVar");
                            _entreprise_name = _curObjCheck getVariable ["entreprise_name",""];
                            [_x,0,_markerVar,_entreprise_name] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",player];
                        };
                        case "Land_InfoStand_V2_F" : {
                            [_x,1] remoteExecCall ["max_entreprise_fnc_entrepriseAddAction",player];
                        }; 
                    };
                };
            } forEach (_curObjCheck getVariable ["entreprise_objects",[]]);
        };
    } forEach (_curObjCheck getVariable ["entreprise_members",[]]);
} forEach maxence_all_entreprises;

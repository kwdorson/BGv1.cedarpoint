/*
    File: fn_getBuildingPositions.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Retrieves all 3D-world positions in a building and also restricts
    certain positions due to window positioning.
*/
private ["_building","_arr","_restricted","_exitLoop","_i"];
_building = _this select 0;
_arr = [];

_restricted = switch (typeOf _building) do {
case "Land_House_L_1_EP1": {[0,1,3,4]};
case "Land_House_L_3_EP1": {[0,1,3,4]};
case "Land_House_L_4_EP1": {[1,2]};
case "Land_House_L_6_EP1": {[1,2]};
case "Land_House_L_7_EP1": {[1,2]};
case "Land_House_L_9_EP1": {[1,2]};
case "Land_House_K_1_EP1": {[1,2,3,4]};
case "Land_House_K_3_EP1": {[1,2,3,4]};
case "Land_House_K_5_EP1": {[1,2,3,4]};
case "Land_House_K_6_EP1": {[1,2,3,4]};
case "Land_House_K_7_EP1": {[1,2,3,4]};
case "Land_House_K_8_EP1": {[1,2,3,4]};
default {[]};
};

_i = 0;
_exitLoop = false; //Loops are not fun.
for "_i" from 0 to 1 step 0 do {
    if (!(_i in _restricted)) then {
    _pos = _building buildingPos _i;
    if (_pos isEqualTo [0,0,0]) exitWith {_exitLoop = true;};
    _arr pushBack _pos;
    };
    if (_exitLoop) exitWith {};
    _i = _i + 1;
};

_arr;

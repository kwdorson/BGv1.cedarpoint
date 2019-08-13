#include "..\..\script_macros.hpp"
/*
    File: fn_pullOutVeh.sqf
    Author: Bryan "Tonic" Boardwine

    Description:

*/
//private ["_vehicle"];
//_vehicle = cursorTarget;
//_locked = locked _vehicle;
params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};
if (isNull objectParent player)exitWith {};
//if( _locked _vehicle isEqualTo 1 && _vehicle isEqualTo ["O_MRAP_02_F","O_T_LSV_02_unarmed_F","O_T_MRAP_02_ghex_F","B_T_LSV_01_armed_F"] ) exitWith { ["This vehicle is locked",false,"slow"] call life_fnc_notificationSystem; };
if (player getVariable "restrained" || player getVariable "tied") then {
    detach player;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    life_disable_getOut = false;
    player action ["Eject", vehicle player];
    titleText[format [localize "STR_NOTF_PulledOut",_unit getVariable ["realname",name _unit]],"PLAIN"];
    titleFadeOut 4;
    life_disable_getIn = true;
} else {
    player action ["Eject", vehicle player];
    titleText[format [localize "STR_NOTF_PulledOut",_unit getVariable ["realname",name _unit]],"PLAIN"];
    titleFadeOut 4;
};

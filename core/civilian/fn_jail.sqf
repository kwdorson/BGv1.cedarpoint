#include "..\..\script_macros.hpp"
/*
 File: fn_jail.sqf
 Author: Bryan "Tonic" Boardwine
 Description:
 Starts the initial process of jailing.
*/
private ["_illegalItems"];
params [
 ["_unit",objNull,[objNull]],
 ["_bad",false,[false]], //Hier ein ,
 ["_time",15,[0]] //und dies eingefügt
];
if (isNull _unit) exitWith {}; //Dafuq?
if (_unit != player) exitWith {}; //Dafuq?
if (life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_illegalItems = LIFE_SETTINGS(getArray,"jail_seize_vItems");
player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");
if (_bad) then {
 waitUntil {alive player};
 sleep 1;
};
//Check to make sure they goto check
if (player distance (getMarkerPos "jail_marker") > 40) then {
 player setPos (getMarkerPos "jail_marker");
};
[1] call life_fnc_removeLicenses;
{
 _amount = ITEM_VALUE(_x);
 if (_amount > 0) then {
 [false,_x,_amount] call life_fnc_handleInv;
 };
} forEach _illegalItems;
life_is_arrested = true;
player setVariable ["arrested", true, true];

if (LIFE_SETTINGS(getNumber,"jail_seize_inventory") isEqualTo 1) then {
 	[] spawn life_fnc_seizeClient;
	removeAllWeapons player;
	{player removeMagazine _x} forEach (magazines player);
	removeHeadgear player:
	removeGoggles player;
	removeVest player;
	removeUniform player;
	removeBackpack player;
	player addUniform "U_C_WorkerCoveralls";
	[] spawn life_fnc_playerSkins;
};

if (life_HC_isActive) then {
 [player,_bad,_time] remoteExecCall ["HC_fnc_jailSys",HC_Life]; //Hier wurde nur _time Hinzugefügt
} else {
 [player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV]; //Hier wurde nur _time Hinzugefügt
};
[5] call SOCK_fnc_updatePartial;
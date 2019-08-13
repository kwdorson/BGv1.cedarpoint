#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_ServerteamZeigen.sqf
	Beschreibung:
		[getPlayerUID player,profilename] spawn life_fnc_ServerteamZeigen;

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
if (!(isNull (uiNameSpace getVariable "ui_Serverteamausweis"))) then {("rsc_Serverteamausweis" call BIS_fnc_rscLayer) cutText ["","PLAIN"];};
if !canSuspend exitWith {};
params [["_SpielerUID","",[""]],["_Profilname","",[""]]];
if (_SpielerUID isEqualTo "" || _Profilname isEqualTo "") exitWith {};
_Daten = (MGV ["FWFVS_Array_Serverteamausweis",{[]}]);
if !(_Daten isEqualType {}) exitWith {};
_Daten = call _Daten;
_Index = [_Daten,_SpielerUID] call life_fnc_ArrayIndexErhalten;
if (_Index < 0) exitWith {};
SEL(_Daten,_Index) params [["_xSteamID","",[""]],["_xTSName","",[""]],["_xBez","",[""]]];
disableSerialization;
("rsc_Serverteamausweis" call BIS_fnc_rscLayer) cutRsc ["ui_Serverteamausweis","PLAIN"];
waitUntil {!isNil {uiNameSpace getVariable "ui_Serverteamausweis"}};
_UserInterfaceDisplay = uiNameSpace getVariable "ui_Serverteamausweis";
_AnzeigeName = DISPCTRL(_UserInterfaceDisplay,1100);
_AnzeigeTeam = DISPCTRL(_UserInterfaceDisplay,1101);
_AnzeigeName STRUCT format["<t font='PuristaLight' color='#000000' size='1.5' shadow='false'>%1</t>",_Profilname];
_AnzeigeTeam STRUCT format["<t font='PuristaLight' color='#000000' size='1.1' shadow='false'>%1</t><br/><t font='PuristaLight' color='#000000' size='0.9' shadow='false'>%2</t>",_xTSName,_xBez];
[
    ["",[0,0,0,0.5]],
    [0.022,[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.5]],
    [format["You are currently the server team card of %1 shown. This badge is valid. Follow according to their instructions.<br/>Cover this with circumflex (^) wieder aus.<br/><br/>If the hotkey does not work, see your scroll menu.",_Profilname],[1,0,0,1],[0,0,0,0.5]],
    ["",[0,0,0,0.5]],
    10,
    (1-0.165),
    0.165,
    0.006,
    "",
    (0.1 * safezoneH + safezoneY),
    false
] spawn life_fnc_ENS;

SERVERAUSWEIS_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",{if((_this select 1) == 41) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',SERVERAUSWEIS_EXIT];("rsc_Serverteamausweis" call BIS_fnc_rscLayer) cutText ["","PLAIN"];};false}];
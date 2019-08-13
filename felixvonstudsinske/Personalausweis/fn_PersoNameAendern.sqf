#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoNameAendern.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
disableSerialization;
_LB_Persos = CTRL(66500,2100);
_Infobox = CTRL(66500,1100);
_Knopf_Waehlen = CTRL(66500,2401);
_Knopf_PersoPlus = CTRL(66500,2402);
_Knopf_NameAendern = CTRL(66500,2405);
_Auswahl = lbCurSel _LB_Persos;
if (_Auswahl < 0) exitWith {hint "Did not make a choice";};
_Data = _LB_Persos lbData _Auswahl;
if (_Data isEqualTo "") exitWith {hint "Selection corresponds to a free identity and no identity card";};
_Data = parseSimpleArray _Data;
if (isNil "_Data") exitWith {};
if !(_Data isEqualType []) exitWith {};
_Data params [
	["_PersoID",-1,[0]],
	["_Spielername","",[""]],
	["_SpielerUID","",[""]],
	["_Spielerfraktion","",[""]],
	["_Persodaten","[]",["[]"]],
	["_Ausstelldatum", [-1,-1,-1,-1,-1,-1],[[]]], //  [Y,M,D,H,M,S]
	["_Mobilfunknummer","",[""]],
	["_Originalname","",[""]]
];
if (_Originalname isEqualTo profileName) exitWith {ERROR("Current name already matches your current profile");};
_KostenIdentitaetNameAendern = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KostenIdentitaetNameAendern");
_KostenIdentitaetNameAendern = switch (playerSide) do {case west: {SEL(_KostenIdentitaetNameAendern,0);};case civilian: {SEL(_KostenIdentitaetNameAendern,1);};case east: {SEL(_KostenIdentitaetNameAendern,3);};case independent: {SEL(_KostenIdentitaetNameAendern,2);}; default {0};};
if (KONTO < _KostenIdentitaetNameAendern) exitWith {hint format["Dir fehlen %1 € auf deinem Bankkonto, um diese Identität zu löschen.",ZAHLENKONVERTER(_KostenIdentitaetNameAendern - KONTO)];};
_Aktion = [
	format["You're about to change the name of the above identity. This process costs you %1 € and will be deducted from your account.<br/>Currently you have %2 € on your account.<br/>old name: %3<br/>New name: %4<br/>Do you want to change the identity?",if (_KostenIdentitaetNameAendern > 0) then {ZAHLENKONVERTER(_KostenIdentitaetNameAendern)}else{"keine"},ZAHLENKONVERTER(KONTO),_Spielername,profileName],
	format["Personalausweis '%1' (%2) ändern",_PersoID toFixed 0,_Mobilfunknummer],
	"CONFIRM",
	"CANCELL"
] call BIS_fnc_guiMessage;
if(!isNil "_Aktion" && {!_Aktion}) exitWith {titleText["Änderung abgebrochen","PLAIN"];};
closeDialog 0;
pl_haupt_menu = true;
[player,profileName,PUID,_PersoID] remoteExec ["DB_fnc_PersoUpdate",2];
[] spawn {
	_HandlerID = (findDisplay 46) displayAddEventHandler ["KeyDown",{true}];
	while {pl_haupt_menu} do { 0 cutText["","BLACK FADED"]; 0 cutFadeOut 99999999; };
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",_HandlerID];
};
if (_KostenIdentitaetNameAendern > 0) then {
	KONTO = KONTO - _KostenIdentitaetNameAendern;
	[1] call SOCK_fnc_updatePartial;
};
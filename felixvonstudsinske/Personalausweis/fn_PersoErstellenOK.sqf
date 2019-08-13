#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoErstellenOK.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
if !canSuspend exitWith {hint "unscheduled environment gefunden, aber gefordert...";};
disableSerialization;
if (isNull DISP(9900)) exitWith {hint "Perso-Fehler: Fehler im Dialog";};
_PersoAendern = DISP(9900) GV ["PesoAendern",false];
if !_PersoAendern then {
	pl_haupt_menu = true;
};
_Kosten = DISP(46) GV ["ZahlenBitte",0];
if (_Kosten > 0) then {KONTO = KONTO - _Kosten; [1] call SOCK_fnc_updatePartial; DISP(46) SV ["ZahlenBitte",nil];};
while {dialog} do {closeDialog 0;};
if (_PersoAendern) exitWith { // Nur Update
	_Akt = (player getVariable ["Persodaten",[]]);
	_Akt set [3,[perso_geburt,perso_cm,perso_kg,perso_wohnort,perso_strasse,perso_hsnr,perso_augenfarbe,perso_sex,perso_staat,perso_portraitklasse]];
	player setVariable ["Persodaten",_Akt,true];
	if !(isNil "fwfvs_random_adminausweis") exitWith {};
	[((player getVariable ["Persodaten",[]]) # 0),[perso_geburt,perso_cm,perso_kg,perso_wohnort,perso_strasse,perso_hsnr,perso_augenfarbe,perso_sex,perso_staat,perso_portraitklasse]] remoteExec ["DB_fnc_PersoUpdateKomplett",2];
};
[player,profileName,perso_Profilname,[perso_geburt,perso_cm,perso_kg,perso_wohnort,perso_strasse,perso_hsnr,perso_augenfarbe,perso_sex,perso_staat,perso_portraitklasse],true,(MGV ["FWFVS_NeuerPersonalausweis",false]),perso_Mobilnummer] remoteExec ["DB_fnc_PersoNeu",2];
[] spawn {
	if !(MGV ["FWFVS_NeuerPersonalausweis",false]) then {
		_HandlerID = (findDisplay 46) displayAddEventHandler ["KeyDown",{true}];
		while {pl_haupt_menu} do { 0 cutText["","BLACK FADED"]; 0 cutFadeOut 99999999; };
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",_HandlerID];
	};
};
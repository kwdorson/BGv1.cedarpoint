#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoAusgewaehlt.sqf
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
_Datum = format["%1.%2.%3 %4:%5",SEL(_Ausstelldatum,2),SEL(_Ausstelldatum,1),SEL(_Ausstelldatum,0),SEL(_Ausstelldatum,3),SEL(_Ausstelldatum,4)];
player SV ["Persodaten",[_PersoID,_Spielername,_Spielerfraktion,parseSimpleArray _Persodaten,_Datum,_Mobilfunknummer,_Originalname],true];
_MeinePersoIDs = [];
{if !((_x select 0) in _MeinePersoIDs) then {_MeinePersoIDs pushBack (_x select 0);};} forEach FWFVS_Array_Personalausweise;
[0, 1, playerSide, PUID, _PersoID, _MeinePersoIDs] remoteExecCall ["life_fnc_SpielerBekanntHandle",2];
closeDialog 0;
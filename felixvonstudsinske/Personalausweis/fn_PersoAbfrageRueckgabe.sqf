#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoAbfrageRueckgabe.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
disableSerialization;
_Personalausweise = param [0,[],[[]]];
FWFVS_Array_Personalausweise = _Personalausweise;
if (_Personalausweise isEqualTo []) exitWith {pl_haupt_menu = false; [] spawn life_fnc_PersoErstellen;}; // Keine Persos vorhanden, neuen erstellen/erster Besuch
createDialog "Dialog_PersonalausweisAuswahl";
_LB_Persos = CTRL(66500,2100);
_Infobox = CTRL(66500,1100);
_Knopf_Waehlen = CTRL(66500,2401);
_Knopf_PersoPlus = CTRL(66500,2402);
_Knopf_Admin = CTRL(66500,2403);
_Knopf_Loeschen = CTRL(66500,2404);
_Knopf_NameAendern = CTRL(66500,2405);
if ((call (MGV ["life_adminlevel",{0}])) < 2) then {_Knopf_Admin CEN false; _Knopf_Admin CSHOW false;} else {_Knopf_Admin CEN true; _Knopf_Admin CSHOW true;};
_Knopf_NameAendern CEN false;
_Knopf_Loeschen CEN false;
_Knopf_Waehlen CEN false;
_Knopf_PersoPlus CEN false;
_Infobox STRUCT "Please select the identity you want to play with or, if possible, create a new one.";
lbClear _LB_Persos;
_Limit = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "MaximaleIdentitaeten");
_Limit = switch (playerSide) do {case west: {SEL(_Limit,0);};case civilian: {SEL(_Limit,1);};case east: {SEL(_Limit,3);};case independent: {SEL(_Limit,2);}; default {0};};
if (_Limit < 1) exitWith {diag_log format["Perso (Abfrage-Rueckgabe): Error in Switch-Anweisung _Limit - %1 - %2 - %3",_this,_Limit,playerSide]; endMission "end1";};
{
	if (_forEachIndex <= (_Limit-1)) then {
		_x params [
			["_xPersoID",-1,[0]],
			["_xSpielername","",[""]],
			["_xSpielerUID","",[""]],
			["_xSpielerfraktion","",[""]],
			["_xPersodaten","[]",["[]"]],
			["_xAusstelldatum", [-1,-1,-1,-1,-1,-1],[[]]], //  [Y,M,D,H,M,S]
			["_Mobilfunknummer","",[""]],
			["_Originalname","",[""]]
		];
		_Datum = format["%1.%2.%3 %4:%5",SEL(_xAusstelldatum,2),SEL(_xAusstelldatum,1),SEL(_xAusstelldatum,0),SEL(_xAusstelldatum,3),SEL(_xAusstelldatum,4)];
		if (_xPersoID > -1 || _xSpielername isEqualTo "" || _xSpielerfraktion isEqualTo "" || _xSpielerUID isEqualTo "" || _xPersodaten isEqualTo "[]") then {
			_Zeile = _LB_Persos lbAdd format["ID: %1 - Name: %2 (%4) - Ausstelldatum: %3",_xPersoID,_xSpielername,_Datum,_Originalname, _Mobilfunknummer];
			_LB_Persos lbSetToolTip [_Zeile,format["Mobilfunknummer: %1\n",_Mobilfunknummer]];
			_LB_Persos lbSetData [_Zeile,str _x];
		} else {
			_Error = format["Perso (Abfrage-Rueckgabe - PersoID: Error in _xPersoID - %1",_x];
			diag_log _Error;
			systemChat format["There is an error with the ID card listing with PersoID '%1' and expiration date '%2'",_xPersoID,_Datum];
		};
	};
} forEach _Personalausweise;
if ((lbSize _LB_Persos) < _Limit) then {
	for "_i" from (lbSize _LB_Persos) to (_Limit-1) do {
		_Zeile = _LB_Persos lbAdd "Free Slot";
	};
	_Knopf_PersoPlus CEN true;
};
pl_haupt_menu = false;
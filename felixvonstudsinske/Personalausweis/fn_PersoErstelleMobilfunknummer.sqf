#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoErstelleMobilfunknummer.sqf
	Beschreibung:
		[player, FWFVS_Array_Personalausweise, PUID] call life_fnc_PersoErstelleMobilfunknummer;

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
params [
	["_Spieler",objNull,[objNull]],
	["_AktuellePersos",[],[[]]],
	["_SpielerUID","",[""]]
];
_Count_Persos = count _AktuellePersos;
_Zeit = (diag_tickTime toFixed 0);
_Zeit = _Zeit select [0,((count toArray _Zeit) max 3)];
for "_i" from 1 to 5 do {
	if (count _Zeit < 3) then {
		_Zeit = _Zeit + "0";
	};
	if (count _Zeit >= 3) exitWith {};
};
switch (side _Spieler) do {
	case west: {
		_Laenderwahl = [50,51,52,53,54,55,56,57,58,59] selectRandomWeighted [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
		_LaenderwahlStr = _Laenderwahl toFixed 0;
		_LaenderwahlStr = _LaenderwahlStr splitString "";
		reverse _LaenderwahlStr;
		_LaenderwahlStr = _LaenderwahlStr joinString "";
		_Vorwahl = format["%1%2",_LaenderwahlStr,_Count_Persos];
		format["+%1 %2 %3%4",_Laenderwahl,_Vorwahl,((_SpielerUID splitString "") select [6,16]) joinString "",_Zeit];
	};
	case east: {
		_Laenderwahl = [60,61,62,63,64,65,66,67,68,69] selectRandomWeighted [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
		_LaenderwahlStr = _Laenderwahl toFixed 0;
		_LaenderwahlStr = _LaenderwahlStr splitString "";
		reverse _LaenderwahlStr;
		_LaenderwahlStr = _LaenderwahlStr joinString "";
		_Vorwahl = format["%1%2",_LaenderwahlStr,_Count_Persos];
		format["+%1 %2 %3%4",_Laenderwahl,_Vorwahl,((_SpielerUID splitString "") select [6,16]) joinString "",_Zeit];
	};
	case independent: {
		_Laenderwahl = [70,71,72,73,74,75,76,77,78,79] selectRandomWeighted [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
		_LaenderwahlStr = _Laenderwahl toFixed 0;
		_LaenderwahlStr = _LaenderwahlStr splitString "";
		reverse _LaenderwahlStr;
		_LaenderwahlStr = _LaenderwahlStr joinString "";
		_Vorwahl = format["%1%2",_LaenderwahlStr,_Count_Persos];
		format["+%1 %2 %3%4",_Laenderwahl,_Vorwahl,((_SpielerUID splitString "") select [6,16]) joinString "",_Zeit];
	};
	case civilian: {
		_Laenderwahl = [80,81,82,83,84,85,86,87,88,89] selectRandomWeighted [0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1];
		_LaenderwahlStr = _Laenderwahl toFixed 0;
		_LaenderwahlStr = _LaenderwahlStr splitString "";
		reverse _LaenderwahlStr;
		_LaenderwahlStr = _LaenderwahlStr joinString "";
		_Vorwahl = format["%1%2",_LaenderwahlStr,_Count_Persos];
		format["+%1 %2 %3%4",_Laenderwahl,_Vorwahl,((_SpielerUID splitString "") select [6,16]) joinString "",_Zeit];
	};
};
#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_Dienstausweisnummer.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
params [
	["_Profilname","",[""]],
	["_Fraktion",sideUnknown,[sideUnknown]],
	["_PersoID",-1,[0]],
	["_SpielerUID","",[""]]
];
_SteamID = ((_SpielerUID splitString "") select [6,16]) joinString "";
_ParseID = parseNumber(((_SteamID splitString "") select [4,(count _SteamID)-1]) joinString "");
_TextFraktion = switch (_Fraktion) do {
	case west:{format["COP%1WB",_PersoID toFixed 0]};
	case east:{format["EAST%1EO",_PersoID toFixed 0]};
	case civilian:{format["CIV%1CID",_PersoID toFixed 0]};
	case independent:{format["MED%1IGR",_PersoID toFixed 0]};
	default {"X01"};
};
([_SteamID,_TextFraktion,(_ParseID random _ParseID) toFixed 0] joinString "")
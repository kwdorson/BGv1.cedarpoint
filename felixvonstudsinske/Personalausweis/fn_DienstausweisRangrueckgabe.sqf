#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_DienstausweisRangrueckgabe.sqf
	Beschreibung:
		[player, switch (playerSide) do {case west:{call life_coplevel}; case independent:{call life_medicLevel}; case east:{call life_eastlevel}; case civilian: {0};},([] call life_fnc_DienstausweisLizenzen)] call life_fnc_DienstausweisRangrueckgabe;

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
#define COP_BILD_DIENST "images\Ausweis\Dienstausweis_West.paa"
#define MED_BILD_DIENST "images\Ausweis\Dienstausweis_Independent.paa"
#define EAST_BILD_DIENST "images\Ausweis\Dienstausweis_EAST.paa"
_Spieler = param [0,objNull,[objNull]];
_Level = param [1,-1,[0]];
_Lizenzen = param [2,[],[[]]];
if (_Level < 1 || isNull _Spieler) exitWith {["",0,""]};
_Lizenz = "/";
_Lizenzen = _Lizenzen select {_x select 1};
if !(_Lizenzen isEqualTo []) then {
	_Lizenz = _Lizenzen select 0 select 0;
};
_Rueckgabe = switch (side _Spieler) do {
	case west: {
		switch _Level do {
			case 1: { ["Cadet",_Level,COP_BILD_DIENST,_Lizenz] };
			case 2: { ["Officer",_Level,COP_BILD_DIENST,_Lizenz] };
			case 3: { ["Corporal",_Level,COP_BILD_DIENST,_Lizenz] };
			case 4: { ["Sergeant",_Level,COP_BILD_DIENST,_Lizenz] };
			case 5: { ["Inspector",_Level,COP_BILD_DIENST,_Lizenz] };
			case 6: { ["Cheif Inspector",_Level,COP_BILD_DIENST,_Lizenz] };
			case 7: { ["Cheif of Police",_Level,COP_BILD_DIENST,_Lizenz] };
			case 8: { ["Stellvertrender Polizeidirektor",_Level,COP_BILD_DIENST,_Lizenz] };
			case 9: { ["Polizeidirektor",_Level,COP_BILD_DIENST,_Lizenz] };
			case 10: { ["SEK",_Level,COP_BILD_DIENST,_Lizenz] };
			default { ["ERROR WEST",-1,"",_Lizenz] };
		};
	};
	case east: {
		switch _Level do {
			case 1: { ["Private - Pvt.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 2: { ["Specialist - Spc.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 3: { ["Corporal - Cpl.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 4: { ["Sergeant - Sgt.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 5: { ["Staff Sergeant - Ssg.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 6: { ["Second Lieutenant - 2ndLt.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 7: { ["First Lieutenant - 1stLt.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 8: { ["Captain - Cpt.",_Level,EAST_BILD_DIENST,_Lizenz] };
			case 9: { ["Major",_Level,EAST_BILD_DIENST,_Lizenz] };
			default { ["ERROR EAST",-1,"",_Lizenz] };
		};
	};
	case independent: {
		switch _Level do {
			case 1: { ["Praktikant",_Level,MED_BILD_DIENST,_Lizenz] };
			case 2: { ["Auszubildender",_Level,MED_BILD_DIENST,_Lizenz] };
			case 3: { ["Ersthelfer",_Level,MED_BILD_DIENST,_Lizenz] };
			case 4: { ["Bergungsmeister",_Level,MED_BILD_DIENST,_Lizenz] };
			case 5: { ["Gefahreninspektor",_Level,MED_BILD_DIENST,_Lizenz] };
			case 6: { ["Leitung des Ausbildungsstab",_Level,MED_BILD_DIENST,_Lizenz] };
			case 7: { ["Wehrleitung",_Level,MED_BILD_DIENST,_Lizenz] };
			default { ["ERROR INDEPENDENT",-1,"",_Lizenz] };
		};
	};
	default {["",0,"",_Lizenz]}
};
_Rueckgabe
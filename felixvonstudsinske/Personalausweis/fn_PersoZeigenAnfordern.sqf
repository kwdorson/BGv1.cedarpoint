#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoZeigenAnfordern.sqf
	Beschreibung:
		0 = Perso
		1 = Dienst
			[player,0] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
_Spieler = param [0,objNull,[objNull]];
_Modus = param [1,0,[0]];
if (isNull _Spieler) exitWith {};
switch _Modus do {
	case 0: {
		[player,true] remoteExec ["life_fnc_persozeigen",_Spieler];
	};
	case 1: {
		[player, switch (playerSide) do {case west:{call life_coplevel}; case independent:{call life_medicLevel}; case east:{call life_eastlevel}; default {0};},([] call life_fnc_DienstausweisLizenzen),true] remoteExec ["life_fnc_DienstausweisZeigen",_Spieler];
	};
};
#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_DienstausweisLizenzen.sqf
	Beschreibung:
		Es können mit den Ausweislizenzen weitere Ranginformationen angezeigt werden

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
switch (playerSide) do {
	case west: {[]};
	case east: {[]};
	case independent: {[[/* localize */ getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName"),license_med_mAir]]};// Ggf. bei Stringtable Angabe das localize aus dem Kommentar befreien
	case civilian: {[]};
	default {[]};
};
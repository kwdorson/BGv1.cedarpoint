/*
	Autor: Felix von Studsinske
	Dateiname: fn_ArrayIndexErhalten.sqf
	Beschreibung.
		["_array","_item"] call life_fnc_ArrayIndexErhalten;
		
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
params [
	["_Array",[],[[]]],
	["_Element",""],
	"_Rueckgabe"
];
if (_Element isEqualTo "") exitWith {-1};
if (_Array isEqualTo []) exitWith {-1};
_Rueckgabe = -1;
{
	if (_Element in _x) exitWith {_Rueckgabe = _forEachIndex};
} forEach _Array;
_Rueckgabe
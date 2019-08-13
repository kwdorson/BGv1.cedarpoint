#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoSucheTag.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
_Name = param [0,"",[""]];
if (_Name isEqualTo "") exitWith {};
_Name = toArray _Name;
_Schweif_Auf = (toArray "{") select 0;
_Schweif_Zu = (toArray "}") select 0;
_Eckig_Auf = (toArray "[") select 0;
_Eckig_Zu = (toArray "]") select 0;
_Rund_Auf = (toArray "(") select 0;
_Rund_Zu = (toArray ")") select 0;
_Rueckgabe = [];
for "_i" from 0 to 1 step (count _Name * 1000) do {
	_Find_Schweif_Auf = _Name find _Schweif_Auf;
	_Find_Schweif_Zu = _Name find _Schweif_Zu;
	_Find_Eckig_Auf = _Name find _Eckig_Auf;
	_Find_Eckig_Zu = _Name find _Eckig_Zu;
	_Find_Rund_Auf = _Name find _Rund_Auf;
	_Find_Rund_Zu = _Name find _Rund_Zu;
	_Exit_0 = false;
	_Exit_1 = false;
	_Exit_2 = false;
	if (_Find_Schweif_Auf > -1  && _Find_Schweif_Zu > -1) then {
		_Push = toString((_Name select [_Find_Schweif_Auf,_Find_Schweif_Zu]) - [_Schweif_Auf,_Schweif_Zu,_Eckig_Auf,_Eckig_Zu,_Rund_Auf,_Rund_Zu]);
		if !(_Push in _Rueckgabe && !(_Push isEqualTo "")) then {_Rueckgabe pushBack _Push;} else {_Exit_0 = true;};
		_Name deleteRange [_Find_Schweif_Auf,_Find_Schweif_Zu];
	} else {_Exit_0 = true;};
	if (_Find_Eckig_Auf > -1  && _Find_Eckig_Zu > -1) then {
		_Push = toString((_Name select [_Find_Eckig_Auf,_Find_Eckig_Zu]) - [_Schweif_Auf,_Schweif_Zu,_Eckig_Auf,_Eckig_Zu,_Rund_Auf,_Rund_Zu]);
		if !(_Push in _Rueckgabe && !(_Push isEqualTo "")) then {_Rueckgabe pushBack _Push;} else {_Exit_0 = true;};
		_Name deleteRange [_Find_Eckig_Auf,_Find_Eckig_Zu];
	} else {_Exit_1 = true;};
	if (_Find_Rund_Auf > -1  && _Find_Rund_Zu > -1) then {
		_Push = toString((_Name select [_Find_Rund_Auf,_Find_Rund_Zu]) - [_Schweif_Auf,_Schweif_Zu,_Eckig_Auf,_Eckig_Zu,_Rund_Auf,_Rund_Zu]);
		if !(_Push in _Rueckgabe && !(_Push isEqualTo "")) then {_Rueckgabe pushBack _Push;} else {_Exit_0 = true;};
		_Name deleteRange [_Find_Rund_Auf,_Find_Rund_Zu];
	} else {_Exit_2 = true;};
	if (_Exit_0 && _Exit_1 && _Exit_2) exitWith {};
};
(_Rueckgabe joinString ":")
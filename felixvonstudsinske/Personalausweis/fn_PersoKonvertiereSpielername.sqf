#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoKonvertiereSpielername.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
_Name = param [0,"",[""]];
if (_Name isEqualTo "") exitWith {};
_Name = toArray _Name;
_Schweif_Auf = (toArray "{") select 0; // 0
_Schweif_Zu = (toArray "}") select 0; // 0
_Eckig_Auf = (toArray "[") select 0; // 1
_Eckig_Zu = (toArray "]") select 0; // 1
_Rund_Auf = (toArray "(") select 0; // 2
_Rund_Zu = (toArray ")") select 0; // 2
_Leerzeichen = (toArray " ") select 0; // 3

_Max = (count _Name)*10;
_Geloescht = [];
for "_i" from 0 to _Max do {
	_i_S_Auf = _Name find _Schweif_Auf;
	_i_S_Zu = _Name find _Schweif_Zu;
	if (_i_S_Auf > -1 && _i_S_Zu > -1) then {
		_Geloescht = _Geloescht + (_Name select [_i_S_Auf, _i_S_Zu]);
		_Name deleteRange [_i_S_Auf, _i_S_Zu];
	} else {
		if (_i_S_Auf > -1) then {
			_Geloescht pushBack (_Name select _i_S_Auf);
			_Name deleteAt _i_S_Auf;
		};
		if (_i_S_Zu > -1) then {
			_Geloescht pushBack (_Name select _i_S_Zu);
			_Name deleteAt _i_S_Zu;
		};
	};
	_i_E_Auf = _Name find _Eckig_Auf;
	_i_E_Zu = _Name find _Eckig_Zu;
	if (_i_E_Auf > -1 && _i_E_Zu > -1) then {
		_Geloescht = _Geloescht + (_Name select [_i_E_Auf, _i_E_Zu]);
		_Name deleteRange [_i_E_Auf, _i_E_Zu];
	} else {
		if (_i_E_Auf > -1) then {
			_Geloescht pushBack (_Name select _i_E_Auf);
			_Name deleteAt _i_E_Auf;
		};
		if (_i_E_Zu > -1) then {
			_Geloescht pushBack (_Name select _i_E_Zu);
			_Name deleteAt _i_E_Zu;
		};
	};
	_i_R_Auf = _Name find _Rund_Auf;
	_i_R_Zu = _Name find _Rund_Zu;
	if (_i_R_Auf > -1 && _i_R_Zu > -1) then {
		_Geloescht = _Geloescht + (_Name select [_i_R_Auf, _i_R_Zu]);
		_Name deleteRange [_i_R_Auf, _i_R_Zu];
	} else {
		if (_i_R_Auf > -1) then {
			_Geloescht pushBack (_Name select _i_R_Auf);
			_Name deleteAt _i_R_Auf;
		};
		if (_i_R_Zu > -1) then {
			_Geloescht pushBack (_Name select _i_R_Zu);
			_Name deleteAt _i_R_Zu;
		};
	};
	if (_i_S_Auf == -1 && _i_S_Zu == -1 && _i_E_Auf == -1 && _i_E_Zu == -1 && _i_R_Auf == -1 && _i_R_Zu == -1) exitWith {};
};
for "_i" from 0 to 1 step 0 do {
	if (_Leerzeichen isEqualTo (_Name select 0)) then {_Name deleteAt 0;};
	if (_Leerzeichen isEqualTo (_Name select ((count _Name) -1))) then {_Name deleteAt ((count _Name) -1);};
	if (!(_Leerzeichen isEqualTo (_Name select 0)) && !(_Leerzeichen isEqualTo (_Name select ((count _Name) -1)))) exitWith {};
};
_Whitelist = toArray "abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWYXZäöüÄÖÜßèÈéÉóÓòÒàÀáÁíÍìÌúÚùÙýÝ. ";
{
	if !(_x in _Whitelist) then {
		if !(_x in _Geloescht) then {
			_Geloescht pushBack _x;
		};
		_Name set[_forEachIndex,-1];
	};
} forEach _Name;
_Name = _Name - [-1];
[toString _Name,toString _Geloescht]
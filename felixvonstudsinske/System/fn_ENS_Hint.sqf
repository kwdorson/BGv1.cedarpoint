/*
	Autor: Felix von Studsinske
	Dateiname: fn_ENS_Hint.sqf
	Beschreibung:
		["Header","Nachricht",true] call life_fnc_ENS_Hint;
		
		["Header","Nachricht",true] remoteExecCall ["life_fnc_ENS_Hint",remoteExecutedOwner];
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
_Header = param [0,"",[""]];
_Nachricht = param [1,"",[""]];
_Sichern = param [2,false,[false]];
if (_Nachricht isEqualTo "") exitWith {};
[[format["<t color = '#ffffff' font='PuristaLight'>%1</t>",_Header],[0,0,0,0.5]],[0.022,[1,0,0,0.5]],[format["<t color = '#ffffff' font='PuristaLight'>%1</t>",_Nachricht],[1,0,0,1],[0,0,0,0.5]],["",[0,0,0,0.5]],20,0.840312,0.154687,0.006,"",(0.071 * safezoneH + safezoneY),false] spawn life_fnc_ENS;
if (_Sichern) then {
	_AktDatenarrayZahl = missionNameSpace getVariable ["life_fnc_ENS_Hint_Val",0];
	_Varname = ("life_fnc_ENS_Hint_Array_" + (_AktDatenarrayZahl toFixed 0));
	_Datenarray = missionNameSpace getVariable [_Varname,[]];
	if (count _Datenarray > 99999) then {
		_AktDatenarrayZahl = _AktDatenarrayZahl + 1;
		life_fnc_ENS_Hint_Val = _AktDatenarrayZahl;
		_Varname = ("life_fnc_ENS_Hint_Array_" + (_AktDatenarrayZahl toFixed 0));
		_Datenarray = missionNameSpace getVariable [_Varname,[]];
		_Datenarray pushBack [_Header, _Nachricht, time, format["%3.%2.%1 %4:%5 (in-game Zeit)",(date select 0),(date select 1),(date select 2),(date select 3),(date select 4)],time,getPosWorld player,mapGridPosition player]; // Historie: [Header, Nachricht, date, time, getPosWorld player, mapGridPosition player,Sitzungsschlüssel]
		missionNameSpace setVariable [_Varname,_Datenarray];
	} else {
		_Datenarray pushBack [_Header, _Nachricht, time, format["%3.%2.%1 %4:%5 (in-game Zeit)",(date select 0),(date select 1),(date select 2),(date select 3),(date select 4)],time,getPosWorld player,mapGridPosition player]; // Historie: [Header, Nachricht, date, time, getPosWorld player, mapGridPosition player,Sitzungsschlüssel]
		missionNameSpace setVariable [_Varname,_Datenarray];
	};
};
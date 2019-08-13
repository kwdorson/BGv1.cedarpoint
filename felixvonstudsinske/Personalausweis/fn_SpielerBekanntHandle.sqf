/*
	Autor: Felix von Studsinske
	Dateiname: fn_SpielerBekanntHandle.sqf
	Beschreibung:
		Verarbeitet lokal die bekannten Identitäten und sendet diese zum Server (nur bei Update)
	
		Aufruf:
			[FremdPersoID, Modus, MeineFraktion, MeineSteamID, MeinePersoID] call life_fnc_SpielerBekanntHandle;
	
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
params [["_FremdPersoID",-1,[0]],["_Modus",-1,[0]]];
if (_FremdPersoID < 0 || _Modus < 0) exitWith {};
switch _Modus do {
	case 0: { 
		if !isServer exitWith {};
		_HandleFraktion = param [2,sideUnknown,[sideUnknown]];
		_HandleSteamID = param [3,"",[""]];
		_PersoID = param [4,-1,[0]];
		if (_HandleFraktion isEqualTo sideUnknown) exitWith {}; 
		if (_HandleSteamID isEqualTo "") exitWith {};
		if (_PersoID < 0) exitWith {};
		if (isNil "FWFVS_Server_PersosBekannt") then {FWFVS_Server_PersosBekannt = [[],[],[],[]]};
		_WerteArray = FWFVS_Server_PersosBekannt; 
		_WerteIndex = switch (_HandleFraktion) do {case west: {0};case east: {1};case independent: {2};case civilian: {3};};
		_FraktionsArray = (_WerteArray select _WerteIndex);
		_Index = [_FraktionsArray,_HandleSteamID] call life_fnc_ArrayIndexErhalten;
		if (_Index isEqualTo -1) then { 
			_FraktionsArray pushBack [_HandleSteamID,[[_PersoID,[_FremdPersoID]]]];
			_WerteArray set [_WerteIndex,_FraktionsArray];
		} else { 
			(_FraktionsArray select _Index) params [["_xSteamID","",[""]],["_xPersoIDArray",[]]];
			_IndexPerso = [_xPersoIDArray,_PersoID] call life_fnc_ArrayIndexErhalten;
			if (_IndexPerso isEqualTo -1) then { 
				_xPersoIDArray pushBack [_PersoID,[_FremdPersoID]];
				_FraktionsArray set [_Index,[_xSteamID,_xPersoIDArray]];
				_WerteArray set [_WerteIndex,_FraktionsArray];
			} else { 
				(_xPersoIDArray select _IndexPerso) params [["_xPersoID",-1,[0]],["_xPersoIDs",[],[[]]]];
				if !(_FremdPersoID in _xPersoIDs) then {
					_xPersoIDs pushBack _FremdPersoID;
					_xPersoIDArray set [_IndexPerso,[_xPersoID,_xPersoIDs]];
					_FraktionsArray set [_Index,[_xSteamID,_xPersoIDArray]];
					_WerteArray set [_WerteIndex,_FraktionsArray];
				};
			};
		};
	};
	case 1: {
		if !isServer exitWith {}; 
		_HandleFraktion = param [2,sideUnknown,[sideUnknown]];
		_HandleSteamID = param [3,"",[""]];
		_PersoID = param [4,-1,[0]];
		_MeinePersoIDs = param [5,[],[[]]];
		if (_HandleFraktion isEqualTo sideUnknown) exitWith {}; 
		if (_HandleSteamID isEqualTo "") exitWith {};
		if (_PersoID < 0) exitWith {};
		if (_MeinePersoIDs isEqualTo []) exitWith {};
		if (isNil "FWFVS_Server_PersosBekannt") then {FWFVS_Server_PersosBekannt = [[],[],[],[]]};
		_WerteArray = FWFVS_Server_PersosBekannt; 
		_WerteIndex = switch (_HandleFraktion) do {case west: {0};case east: {1};case independent: {2};case civilian: {3};};
		_BekanntePersoIDS = [];
		_FraktionsArray = (_WerteArray select _WerteIndex);
		_Index = [_FraktionsArray,_HandleSteamID] call life_fnc_ArrayIndexErhalten;
		if (_Index > -1) then {
			(_FraktionsArray select _Index) params [["_xSteamID","",[""]],["_xPersoIDArray",[]]];
			_IndexPerso = [_xPersoIDArray,_PersoID] call life_fnc_ArrayIndexErhalten;
			if (_IndexPerso > -1) then { 
				_BekanntePersoIDS = (_xPersoIDArray select _IndexPerso) select 1;
			};
			_Updated = false;
			{
				_x params [["_xxPersoID",-1,[0]],["_xBekanntePersoIDS",[],[[]]]];
				if !(_xxPersoID in _MeinePersoIDs) then {_xPersoIDArray set [_forEachIndex,-1]; _Updated = true;};
			} forEach _xPersoIDArray;
			if (_Updated) then {
				_xPersoIDArray = _xPersoIDArray - [-1];
				_FraktionsArray set [_Index,[_xSteamID,_xPersoIDArray]];
				_WerteArray set [_WerteIndex,_FraktionsArray];
			};
		}; 
		FWFVS_publicClient_PersoIDs = _BekanntePersoIDS;
		remoteExecutedOwner publicVariableClient "FWFVS_publicClient_PersoIDs";
	};
	case 2: {
		_HandleFraktion = param [2,sideUnknown,[sideUnknown]];
		_HandleSteamID = param [3,"",[""]];
		_PersoID = param [4,-1,[0]];
		if (_HandleFraktion isEqualTo sideUnknown) exitWith {}; 
		if (_HandleSteamID isEqualTo "") exitWith {};
		if (_PersoID < 0) exitWith {};
		if (isNil "FWFVS_publicClient_PersoIDs") then {FWFVS_publicClient_PersoIDs = []};
		if !(_FremdPersoID in FWFVS_publicClient_PersoIDs) then {FWFVS_publicClient_PersoIDs pushBack _FremdPersoID;};
		[_FremdPersoID, 0, playerSide, (getPlayerUID player), _PersoID] remoteExecCall ["life_fnc_SpielerBekanntHandle",2];
	};
};
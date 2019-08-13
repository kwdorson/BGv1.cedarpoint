#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_DienstausweisZeigen.sqf
	Beschreibung:
		[player, switch (playerSide) do {case west:{call FVS_W_Lvl_Pl}; case independent:{call FVS_I_Lvl_Pl}; case east:{call FVS_O_Lvl_Pl};},([] call life_fnc_DienstausweisLizenzen)] remoteExec ["life_fnc_DienstausweisZeigen",target];
		
		[player, switch (playerSide) do {case west:{call FVS_W_Lvl_Pl}; case independent:{call FVS_I_Lvl_Pl}; case east:{call FVS_O_Lvl_Pl};},([] call life_fnc_DienstausweisLizenzen)] spawn life_fnc_DienstausweisZeigen;

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
if (!(isNull (uiNameSpace getVariable "ui_Dienstausweis"))) exitWith {hint "Somebody wanted to show you his identity card, but you're looking at one right now. Hide this first.";};
if !canSuspend exitWith {hint "Unscheduled environment found, but demanded...";};
params [["_Spieler",objNull,[objNull]],["_Level",-1,[0]],["_Lizenzen",[],[[]]],["_Angefordert",false,[false]]];
if (isNull _Spieler || !(alive _Spieler)) exitWith {};
_Variablenwert = _Spieler getVariable ["Persodaten",[]];
if (_Variablenwert isEqualTo []) exitWith {hint "Error in identity card of a player";};
_Rang = [_Spieler,_Level,_Lizenzen] call life_fnc_DienstausweisRangrueckgabe;
_Variablenwert params [ // [0,"","",[],"","",""]
	["_PersoID",-1,[0]],
	["_Spielername","",[""]],
	["_Spielerfraktion","",[""]],
	["_Persodaten",[],[[]]],
	["_Datum","",[""]],
	["_Mobilfunknummer","",[""]],
	["_Originalname","",[""]]
];
_Persodaten params [ // [perso_geburt,perso_cm,perso_kg,perso_wohnort,perso_strasse,perso_hsnr,perso_augenfarbe,perso_sex,perso_staat,perso_portraitklasse]
	["_Geburtsdatum",[-1,-1,-1],[[]]],
	["_Koerpergroesse",-1,[0]],
	["_Koerpergewicht",-1,[0]],
	["_Wohnort","",[""]],
	["_Strasse","",[""]],
	["_Hausnummer",-1,[0]],
	["_Augenfarbe",-1,[0]],
	["_Geschlecht","",[""]],
	["_Staatsangehoerigkeit",-1,[0]],
	["_Persobild","",[""]]
];
disableSerialization;
("dienstausweis" call BIS_fnc_rscLayer) cutRsc ["ui_Dienstausweis","PLAIN"];
waitUntil {!isNil {uiNameSpace getVariable "ui_Dienstausweis"}};
_UserInterfaceDisplay = uiNameSpace getVariable "ui_Dienstausweis";
_AusweisBild = DISPCTRL(_UserInterfaceDisplay,1200);
_PortraitBild = DISPCTRL(_UserInterfaceDisplay,1201);
_AnzeigeName = DISPCTRL(_UserInterfaceDisplay,9902);
_AnzeigeGeburtsdatum = DISPCTRL(_UserInterfaceDisplay,9903);
_AnzeigeRang = DISPCTRL(_UserInterfaceDisplay,9909);
_Text_Ausweisnummer = DISPCTRL(_UserInterfaceDisplay,1001);
_Spieler setVariable ["SpielerIstBekannt",true]; // Nur Lokal
_Textfarbe = switch (side _Spieler) do {
	case west: {"ffffff"};
	case independent: {"ffffff"};
	case east: {"000000"};
	default {"ffffff"};
};
_AnzeigeName STRUCT format["<t font='PuristaLight' color='#%2' size='1.2' shadow='false'>%1</t>",_Spielername,_Textfarbe];
_AnzeigeGeburtsdatum STRUCT format["<t font='PuristaLight' color='#%4' size='0.9' shadow='false'>%1.%2.%3</t>",SEL(_Geburtsdatum,0),SEL(_Geburtsdatum,1),SEL(_Geburtsdatum,2),_Textfarbe];
_TasteAusblenden = getNumber(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "PersoAusblenden");
_TasteAusblendenName = getText(missionConfigFile >> "Tastenname" >> str _TasteAusblenden);
_PortraitBild STEXT getText(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _Geschlecht >> _Persobild >> "Pfad");
_Text_Ausweisnummer STRUCT format["<t font='PuristaLight' color='#%2' size='0.7px' shadow='false'>%1</t>",[_Originalname,side _Spieler,_PersoID,PUIDX(_Spieler)] call life_fnc_Dienstausweisnummer,_Textfarbe];
_AnzeigeRang STRUCT format["<t font='PuristaLight' color='#%2' shadow='false'>%1</t><br/><t size='0.7px'>- %3</t>",SEL(_Rang,0),_Textfarbe,SEL(_Rang,3)];
_AusweisBild STEXT SEL(_Rang,2);
if !(_Spieler isEqualTo player) then {
	[
		["",[0,0,0,0.5]],
		[0.022,[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.5]],
		[format["You're looking at your ID card from %1 on.<br/><br/>If the hotkey does not work, see your scroll menu.",_Spielername,_TasteAusblendenName],[1,0,0,1],[0,0,0,0.5]],
		["",[0,0,0,0.5]],
		10,
		(1-0.165),
		0.165,
		0.006,
		"",
		(0.1 * safezoneH + safezoneY),
		false
	] spawn life_fnc_ENS;
	_iVariablenwert = player getVariable ["Persodaten",[]];
	_iPersoID = _iVariablenwert param [0,-1,[0]];
	[_PersoID, 2, playerSide, PUID, _iPersoID] call life_fnc_SpielerBekanntHandle;
} else {
	[
		["",[0,0,0,0.5]],
		[0.022,[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.5]],
		[format["You are looking at the identity card of yourself. Hide this again '%1' out.<br/><br/>If the hotkey does not work, see your scroll menu.",_TasteAusblendenName],[1,0,0,1],[0,0,0,0.5]],
		["",[0,0,0,0.5]],
		10,
		(1-0.165),
		0.165,
		0.006,
		"",
		(0.1 * safezoneH + safezoneY),
		false
	] spawn life_fnc_ENS;
};
DIENST_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",format["if((_this select 1) == %1) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',DIENST_EXIT];(""dienstausweis"" call BIS_fnc_rscLayer) cutText ["""",""PLAIN""];};false",_TasteAusblenden]];
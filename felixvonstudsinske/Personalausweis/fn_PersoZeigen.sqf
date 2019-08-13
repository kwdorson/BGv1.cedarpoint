#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoZeigen.sqf
	Beschreibung:
		player,profileName,[perso_geburt,perso_cm,perso_kg,perso_wohnort,perso_strasse,perso_hsnr,perso_augenfarbe,perso_sex,perso_staat]

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
if (!(isNull (uiNameSpace getVariable "ui_Personalausweis"))) exitWith {hint "Jemand hat wollte dir seinen Personalausweis zeigen, jedoch schaust du dir gerade einen an. Blende diesen erst aus.";};
if !canSuspend exitWith {hint "unscheduled environment gefunden, aber gefordert...";};
params [["_Spieler",objNull,[objNull]],["_Angefordert",false,[false]]];
if (isNull _Spieler || !(alive _Spieler)) exitWith {};
_Variablenwert = _Spieler getVariable ["Persodaten",[]];
if (_Variablenwert isEqualTo []) exitWith {hint "Fehler in Personalausweis eines Spielers";};
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
("perso" call BIS_fnc_rscLayer) cutRsc ["ui_Personalausweis","PLAIN"];
waitUntil {!isNil {uiNameSpace getVariable "ui_Personalausweis"}};
_UserInterfaceDisplay = uiNameSpace getVariable "ui_Personalausweis";
_PortraitBild = DISPCTRL(_UserInterfaceDisplay,1201);
_AnzeigeName = DISPCTRL(_UserInterfaceDisplay,9902);
_AnzeigeGeburtsdatum = DISPCTRL(_UserInterfaceDisplay,9903);
_AnzeigeAnschrift = DISPCTRL(_UserInterfaceDisplay,9904);
_AnzeigeGroesse = DISPCTRL(_UserInterfaceDisplay,9909);
_Anzeige_Staatsangehoerigkeit = DISPCTRL(_UserInterfaceDisplay,9906);
_Anzeige_Geschlecht = DISPCTRL(_UserInterfaceDisplay,9908);
_Anzeige_Telefonnummer = DISPCTRL(_UserInterfaceDisplay,9905);
_Text_Ausweisnummer = DISPCTRL(_UserInterfaceDisplay,1001);
_Text_Ausstelldatum = DISPCTRL(_UserInterfaceDisplay,1002);
_Spieler setVariable ["SpielerIstBekannt",true]; // Nur Lokal
_AnzeigeName STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",_Spielername];
_AnzeigeGeburtsdatum STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1.%2.%3</t>",SEL(_Geburtsdatum,0),SEL(_Geburtsdatum,1),SEL(_Geburtsdatum,2)];
_AnzeigeAnschrift STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1 %2<br/>%3 %4</t>",getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Wohnort >> "Strassen" >> _Strasse >> "Name"),_Hausnummer,getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Wohnort >> "Postleitzahl"),getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Wohnort >> "Name")];
_AnzeigeGroesse STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1 cm</t>",_Koerpergroesse];
_Anzeige_Geschlecht STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",_Geschlecht];
_Staatsangehoerigkeiten = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Staatsangehoerigkeit");
_Anzeige_Staatsangehoerigkeit STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",SEL2(_Staatsangehoerigkeiten,_Staatsangehoerigkeit,1)];
_TasteAusblenden = getNumber(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "PersoAusblenden");
_TasteAusblendenName = getText(missionConfigFile >> "Tastenname" >> str _TasteAusblenden);
_PortraitBild STEXT getText(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _Geschlecht >> _Persobild >> "Pfad");
_Text_Ausstelldatum STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",_Datum];
_Text_Ausweisnummer STRUCT format["<t font='PuristaLight' color='#525648' size='0.75px' shadow='false'>%1</t>",[_Originalname,side _Spieler,_PersoID,PUIDX(_Spieler)] call life_fnc_PersoAusweisnummer];
_Anzeige_Telefonnummer STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",_Mobilfunknummer];
if !(_Spieler isEqualTo player) then {
	_iVariablenwert = player getVariable ["Persodaten",[]];
	_iPersoID = _iVariablenwert param [0,-1,[0]];
	[_PersoID, 2, playerSide, PUID, _iPersoID] call life_fnc_SpielerBekanntHandle;
	[
		["",[0,0,0,0.5]],
		[0.022,[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.5]],
		[format["You're looking at the identity card of%1 an. Hide this again '%2' aus.<br/><br/>If the hotkey does not work, see your scroll menu.",_Spielername,_TasteAusblendenName],[1,0,0,1],[0,0,0,0.5]],
		["",[0,0,0,0.5]],
		10,
		(1-0.165),
		0.165,
		0.006,
		"",
		(0.1 * safezoneH + safezoneY),
		false
	] spawn life_fnc_ENS;
} else {
	[
		["",[0,0,0,0.5]],
		[0.022,[(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862]),0.5]],
		[format["You are looking at the identity card of yourself. Hide this again '%1' aus.<br/><br/>If the hotkey does not work, see your scroll menu.",_TasteAusblendenName],[1,0,0,1],[0,0,0,0.5]],
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
PERSO_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",format["if((_this select 1) == %1) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',PERSO_EXIT];(""perso"" call BIS_fnc_rscLayer) cutText ["""",""PLAIN""];};false",_TasteAusblenden]];
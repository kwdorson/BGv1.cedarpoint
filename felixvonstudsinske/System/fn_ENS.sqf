#define DISP(displ) (findDisplay displ)
#define CSBC ctrlSetBackgroundColor
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define SEL2(ARRAY,INDEX1,INDEX2) SEL(SEL(ARRAY,INDEX1),INDEX2)
/*
	Autor: Felix von Studsinske
	Dateiname: fn_ENS.sqf
	Beschreibung:
		=> ENS => Erweitertes Nachrichtensystem
		Fonts: https://community.bistudio.com/wiki/FXY_File_Format#Arma3
				PuristaLight, PuristaMedium, PuristaSemiBold, PuristaBold, LucidaConsoleB, EtelkaMonospacePro, EtelkaMonospaceProBold, EtelkaNarrowMediumPro, TahomaB
		Größenangaben für Position in safezonexyzhw
		_Ueberschrift:
			Überschrift, wird mit parseText eingefügt, somit Schriftart, Größe, Farbe etc. veränderbar
		_UnterstrichUebrschrift:
			Höhe, Hintergrundfarbe
		_Haupttextarray:
			Textinhalt, Textfarbe, Hintergrundfarbe, Schriftart
		_Notizarray:
			normaler Text, Hintergrundfarbe
		_Anzeigedauer:
			Nach wie vielen Sekunden der "hint" geschlossen bzw. der nächste angezeigt wird
			
	Beispiel:
		[["<t color = '#ffffff' font='TahomaB' underline='true'>Hinweis</t><br/>Läuft",[0,0,0,0.5]],[0.022,[1,0,0,0.5]],["<t underline='true' color='#ff0000'>Es wurde kein Text Übergeben</t>",[1,0,0,1],[0,0,0,0.5]],["- Notiz -",[0,0,0,0.5]],20,0.0153125,0.165,0.006,"",(0.1 * safezoneH + safezoneY),true] spawn life_fnc_ENS;

		[["Admininfo",[0,0,0,0.5]],[0.022,[1,0,0,0.5]],["Infotext",[1,0,0,1],[0,0,0,0.5]],["",[0,0,0,0.5]],20,0.0153125,0.165,0.006,"",(0.1 * safezoneH + safezoneY),true] remoteExec ["life_fnc_ENS",allPlayers];
		
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
private ["_Display","_Hintergrund","_Hintergrund_Ueberschrift","_Hintergrund_Unterstrich","_Text","_Hintergrund_Text","_Hintergrund_Notiz","_Notiz","_TextUeberschrift"];
if !canSuspend exitWith {hint "unscheduled environment found, but demanded ...";};
disableSerialization;
params [
	["_Ueberschrift",["<t color = '#ffffff' font='TahomaB' align='center'>Hinweis</t>",[0,0,0,0.5]],[["",[]]]], 
	["_UnterstrichUebrschrift",[0.022,[1,0,0,0.5]],[[0,[]]]], 
	["_Haupttextarray",["<t underline = 'true' color = '#ff0000'>No text was submitted :3</t>",[1,0,0,1],[0,0,0,0.5]],[[]]], 
	["_Notizarray",["- Notiz -",[0,0,0,0.5]],[[]]], 
	["_Anzeigedauer",10,[0]],
	["_Position_SafeX",0.0153125,[0]],
	["_Position_SafeW",0.165,[0]],
	["_Abstand",0,[0]], // 0.0022 wie in der GUI-Konfig
	["_Soundklasse","",[""]], // Soundname
	["_Position_SafeY",(0.1 * safezoneH + safezoneY),[0]],
	["_SmartphoneBenoetigt",false,[false]],
	["_HG_CSBC",[0,0,0,0.5],[[]]],
	["_Abstand_MSG",1.5,[0]]
];
if !hasInterface exitWith {};
if (isNil {missionNamespace getVariable format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW]}) then {missionNamespace setVariable [format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW],[]];};
if !(_Soundklasse isEqualTo "") then {playSound _Soundklasse};
_Display = DISP(46);
_Hintergrund = _Display ctrlCreate ["RscText",-1];
_Hintergrund CSBC _HG_CSBC;
_Hintergrund_Ueberschrift = _Display ctrlCreate ["RscText",-1];
_Hintergrund_Unterstrich = _Display ctrlCreate ["RscText",-1];
_Hintergrund_Text = _Display ctrlCreate ["RscText",-1];
_Hintergrund_Text CSBC [0,0,0,0.5];
_Hintergrund_Notiz = _Display ctrlCreate ["RscText",-1];
_Notiz = _Display ctrlCreate ["RscStructuredText",-1];
_Text = _Display ctrlCreate ["RscStructuredText",-1];
_TextUeberschrift = _Display ctrlCreate ["RscStructuredText",-1];
_TextUeberschrift ctrlSetStructuredText parseText (_Ueberschrift select 0); 
_TextUeberschrift ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX),_Position_SafeY,(_Position_SafeW * safezoneW), ctrlTextHeight _TextUeberschrift]; 
_TextUeberschrift ctrlCommit 0; 
_Hintergrund_Ueberschrift ctrlSetPosition [SEL((ctrlPosition _TextUeberschrift),0),SEL((ctrlPosition _TextUeberschrift),1),SEL((ctrlPosition _TextUeberschrift),2),ctrlTextHeight _TextUeberschrift];
_Hintergrund_Ueberschrift CSBC (_Ueberschrift select 1); 
_Hintergrund_Ueberschrift ctrlCommit 0; 
_Hintergrund_Unterstrich CSBC (_UnterstrichUebrschrift select 1); 
_Hintergrund_Unterstrich ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _TextUeberschrift) select 1) + (ctrlTextHeight _TextUeberschrift)), (_Position_SafeW * safezoneW), (_UnterstrichUebrschrift select 0)]; 
_Hintergrund_Unterstrich ctrlCommit 0;
_Text ctrlSetStructuredText parseText (_Haupttextarray select 0);
_Text ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Hintergrund_Unterstrich) select 1) + _Abstand + (_UnterstrichUebrschrift select 0)), (_Position_SafeW * safezoneW), ctrlTextHeight _Text]; 
_Text ctrlCommit 0;
_Hintergrund_Text ctrlSetPosition [SEL((ctrlPosition _Text),0),SEL((ctrlPosition _Text),1),SEL((ctrlPosition _Text),2),ctrlTextHeight _Text];
_Hintergrund_Text ctrlCommit 0;
_Notiz ctrlSetStructuredText parseText format["<t align='center'>%1</t>",(_Notizarray select 0)];
_Notiz ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Text) select 1) + (ctrlTextHeight _Text) + _Abstand), (_Position_SafeW * safezoneW),ctrlTextHeight _Notiz];
_Notiz ctrlCommit 0;
_Hintergrund_Notiz CSBC (_Notizarray select 1);
_Hintergrund_Notiz ctrlSetPosition (ctrlPosition _Notiz);
_Hintergrund_Notiz ctrlCommit 0;
waitUntil {ctrlCommitted _Hintergrund_Notiz};
_Notiz ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Text) select 1) + (ctrlTextHeight _Text) + _Abstand), (_Position_SafeW * safezoneW),ctrlTextHeight _Notiz];
_Notiz ctrlCommit 0;
_Hintergrund_Notiz ctrlSetPosition (ctrlPosition _Notiz);
_Hintergrund_Notiz ctrlCommit 0;
waitUntil {ctrlCommitted _Hintergrund_Notiz};
_Hintergrund ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (ctrlPosition _TextUeberschrift) select 1,(_Position_SafeW * safezoneW),((ctrlTextHeight _TextUeberschrift) + (ctrlTextHeight _Hintergrund_Unterstrich) + (ctrlTextHeight _Text) + (ctrlTextHeight _Notiz))];
_Hintergrund ctrlCommit 0;
[[_Hintergrund,_Hintergrund_Ueberschrift,_Hintergrund_Unterstrich,_Text,_Hintergrund_Text,_Hintergrund_Notiz,_Notiz,_TextUeberschrift],_Anzeigedauer] spawn {
	disableSerialization;
	uiSleep SEL(_this,1);
	waitUntil {ctrlCommitted SEL2(_this,0,0) && ctrlCommitted SEL2(_this,0,1) && ctrlCommitted SEL2(_this,0,2) && ctrlCommitted SEL2(_this,0,3) && ctrlCommitted SEL2(_this,0,4) && ctrlCommitted SEL2(_this,0,5) && ctrlCommitted SEL2(_this,0,6) && ctrlCommitted SEL2(_this,0,7)};
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0.25;
	} forEach SEL(_this,0);
	waitUntil {ctrlCommitted SEL2(_this,0,0) && ctrlCommitted SEL2(_this,0,1) && ctrlCommitted SEL2(_this,0,2) && ctrlCommitted SEL2(_this,0,3) && ctrlCommitted SEL2(_this,0,4) && ctrlCommitted SEL2(_this,0,5) && ctrlCommitted SEL2(_this,0,6) && ctrlCommitted SEL2(_this,0,7)};
	{
		ctrlDelete _x;
	} forEach SEL(_this,0);
};
_Hintergrundposition = SEL((ctrlPosition _Hintergrund),3) + 0.0022;
if (count (missionNamespace getVariable format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW]) > 0) then {
	{
		_x params ["_Hintergrund","_Hintergrund_Ueberschrift","_Hintergrund_Unterstrich","_Text","_Hintergrund_Text","_Hintergrund_Notiz","_Notiz","_TextUeberschrift"];
		_TextUeberschrift ctrlSetPosition [SEL((ctrlPosition _TextUeberschrift),0),(SEL((ctrlPosition _TextUeberschrift),1) + _Hintergrundposition) + _Abstand_MSG*(0.011 * safezoneH),SEL((ctrlPosition _TextUeberschrift),2),ctrlTextHeight _TextUeberschrift];
		_TextUeberschrift ctrlCommit 0;
		_Hintergrund_Ueberschrift ctrlSetPosition [SEL((ctrlPosition _TextUeberschrift),0),SEL((ctrlPosition _TextUeberschrift),1),SEL((ctrlPosition _TextUeberschrift),2),ctrlTextHeight _TextUeberschrift];
		_Hintergrund_Ueberschrift ctrlCommit 0;
		_Hintergrund_Unterstrich ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _TextUeberschrift) select 1) + (ctrlTextHeight _TextUeberschrift)), (_Position_SafeW * safezoneW), (_UnterstrichUebrschrift select 0)]; 
		_Hintergrund_Unterstrich ctrlCommit 0;
		_Text ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Hintergrund_Unterstrich) select 1) + _Abstand + (_UnterstrichUebrschrift select 0)), (_Position_SafeW * safezoneW), ctrlTextHeight _Text];
		_Text ctrlCommit 0;
		_Hintergrund_Text ctrlSetPosition [SEL((ctrlPosition _Text),0),SEL((ctrlPosition _Text),1),SEL((ctrlPosition _Text),2),ctrlTextHeight _Text];
		_Hintergrund_Text ctrlCommit 0;
		_Notiz ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Text) select 1) + (ctrlTextHeight _Text) + _Abstand), (_Position_SafeW * safezoneW),ctrlTextHeight _Notiz];
		_Notiz ctrlCommit 0;
		_Hintergrund_Notiz ctrlSetPosition (ctrlPosition _Notiz);
		_Hintergrund_Notiz ctrlCommit 0;
		_Hintergrund ctrlSetPosition [(_Position_SafeX * safezoneW + safezoneX), (((ctrlPosition _Hintergrund) select 1) + _Hintergrundposition) + _Abstand_MSG*(0.011 * safezoneH),(_Position_SafeW * safezoneW),((ctrlTextHeight _TextUeberschrift) + (ctrlTextHeight _Hintergrund_Unterstrich) + (ctrlTextHeight _Text) + (ctrlTextHeight _Notiz))];
		_Hintergrund ctrlCommit 0;
	} forEach (missionNamespace getVariable format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW]);
};
missionNamespace setVariable [format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW],([[_Hintergrund,_Hintergrund_Ueberschrift,_Hintergrund_Unterstrich,_Text,_Hintergrund_Text,_Hintergrund_Notiz,_Notiz,_TextUeberschrift]] + (missionNamespace getVariable format["ENS_wip_%1_%2",_Position_SafeX,_Position_SafeW])) select {!isNull SEL(_x,0) && !isNull SEL(_x,1) && !isNull SEL(_x,2) && !isNull SEL(_x,3) && !isNull SEL(_x,4) && !isNull SEL(_x,5) && !isNull SEL(_x,6) && !isNull SEL(_x,7)}];
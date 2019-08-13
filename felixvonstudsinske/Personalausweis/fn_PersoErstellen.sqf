#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoErstellen.sqf
	Beschreibung:
		Arg 0: false/true
			Wenn true, dann aktuelle Persodaten ändern
				sonst bei false neuen Ausweis erstellen (Standard: false);
		[true] spawn life_fnc_PersoErstellen;
			this addAction ["Ausweisänderung durchführen",{[true] spawn life_fnc_PersoErstellen;},"",0,false,false,"",'playerSide == civilian && (player distance _target < 5)'];
		[] spawn life_fnc_PersoErstellen;

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
private ["_VerboteneZeichen","_ProfilnameArray","_FehlerzeichenName","_MinimaleNamenslaenge","_MaximaleNamenslaenge","_Koerpergroessen","_Jahre","_Gewicht","_Augenfarben","_Staatsangehoerigkeiten","_Emailadresse"];
_PersoAendern = param [0,false,[false]];
if !isClass(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName) exitWith {
	systemChat ("Unbekannte Karte: "+worldname);
};
if !canSuspend exitWith {hint "unscheduled environment gefunden, aber scheduled gefordert...";};
if (!(player getVariable ["Persodaten",[]] isEqualTo []) && !_PersoAendern) exitWith {}; // Bereits erstellt?
_KostenIdentitaetNeu = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KostenIdentitaetNeu");
_KostenIdentitaetNeu = switch (playerSide) do {case west: {SEL(_KostenIdentitaetNeu,0);};case civilian: {SEL(_KostenIdentitaetNeu,1);};case east: {SEL(_KostenIdentitaetNeu,3);};case independent: {SEL(_KostenIdentitaetNeu,2);}; default {[-1,0]};};
_Exit = false;
_ZahlenBitte = 0;
if !_PersoAendern then { // Neuer Perso
	if (SEL(_KostenIdentitaetNeu,0) > -1) then {
		if (((count FWFVS_Array_Personalausweise)+1) > SEL(_KostenIdentitaetNeu,0)) then {
			if (KONTO < SEL(_KostenIdentitaetNeu,1)) then {
				_Exit = true;
				hint format["You are missing %1 € in your bank account to create a new identity.",ZAHLENKONVERTER(SEL(_KostenIdentitaetNeu,1) - KONTO)];
			} else {
				_Aktion = [
					format["You are about to create a new identity. This process costs you %1 € and will be deducted from your account.<br/>Currently you have %2 € on your account.<br/>Would you like to create another identity?<br/><br/>Another question is not answered!",if (SEL(_KostenIdentitaetNeu,1) > 0) then {ZAHLENKONVERTER(SEL(_KostenIdentitaetNeu,1))}else{"keine"},ZAHLENKONVERTER(KONTO)],
					"Create ID card with costs",
					"CONTINUE",
					"ABORT, STOP"
				] call BIS_fnc_guiMessage;
				if(!isNil "_Aktion" && {!_Aktion}) exitWith {titleText["Create aborted","PLAIN"]; _Exit = true;};
				_ZahlenBitte = SEL(_KostenIdentitaetNeu,1);
			};
		};
	};
} else {
	_Aktion = [
		format["You are about to change your current identity. This process costs you %1 € and will be deducted from your account. <br/> Currently you have %2 € aOn your account. <br/> The deposited name in this identity can only be changed in the identity selection! <br/> Do you want to edit this identity?",if (SEL(_KostenIdentitaetNeu,1) > 0) then {ZAHLENKONVERTER(SEL(_KostenIdentitaetNeu,1))}else{"keine"},ZAHLENKONVERTER(KONTO)],
		"Change your ID card for a fee",
		"CONTINUE",
		"ABORT, STOP"
	] call BIS_fnc_guiMessage;
	if(!isNil "_Aktion" && {!_Aktion}) exitWith {titleText["Change aborted","PLAIN"]; _Exit = true;};
	_ZahlenBitte = SEL(_KostenIdentitaetNeu,1);
};
if (_Exit) exitWith {};
closeDialog 0;
disableSerialization;
createDialog "Dialog_PersonalausweisErstellen";
waitUntil {!isNull DISP(8800)};
DISP(8800) SV ["PesoAendern",_PersoAendern];
if (isNull DISP(8800)) exitWith {hint "Perso-Fehler: Fehler im Dialog";};

DISP(46) SV ["ZahlenBitte",_ZahlenBitte];
_MeinName = CTRL(8800,8801);
_Listbox_JJJJ = CTRL(8800,8802);
_Listbox_MM = CTRL(8800,8803);
_Listbox_TT = CTRL(8800,8804);
_Listbox_Staatsangehoerigkeit = CTRL(8800,8805);
_Listbox_Augenfarbe = CTRL(8800,8806);
_Listbox_Koerpergroesse = CTRL(8800,8807);
_Listbox_Koerpergewicht = CTRL(8800,8808);
_Listbox_Wohnort = CTRL(8800,8809);
_Listbox_Strasse = CTRL(8800,8810);
_Listbox_Hausnummer = CTRL(8800,8811);
_Portrait = CTRL(8800,8812);
_LB_Gesicht = CTRL(8800,2112);
_Listbox_Geschlecht = CTRL(8800,8816);
_Knopf_Fortfahren = CTRL(8800,8817);
_Knopf_Schliessen = CTRL(8800,2401);
_Knopf_Schliessen CSHOW !_PersoAendern;
_Info = CTRL(8800,99999);
_Knopf_Fortfahren CSHOW false;
_Koerpergroessen = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KoerpergroesseVonBis");
_Jahre = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "GeburtsjahreVonBis");
_Gewicht = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KoerpergewichtVonBis");
_Augenfarben = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Augenfarben");
_Staatsangehoerigkeiten = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Staatsangehoerigkeit");
_KonvertierterName = [profileName] call life_fnc_PersoKonvertiereSpielername;
perso_Profilname = SEL(_KonvertierterName,0);
perso_Mobilnummer = [player, FWFVS_Array_Personalausweise, PUID] call life_fnc_PersoErstelleMobilfunknummer;
_MeinName STEXT format["My name: %1",perso_Profilname];

/* Geburtsdatum */
for "_i" from SEL(_Jahre,0) to SEL(_Jahre,1) step 1 do {
	// _Zeile = row
	private _Zeile = _Listbox_JJJJ lbAdd str _i;
	_Listbox_JJJJ lbSetValue [_Zeile,_i];
};
for "_i" from 1 to 12 step 1 do {
	// _Zeile = row
	private _Zeile = _Listbox_MM lbAdd str _i;
	_Listbox_MM lbSetValue [_Zeile,_i];
};

/* Staatsangehoerigkeit */
{
	private _Zeile = _Listbox_Staatsangehoerigkeit lbAdd SEL(_x,1);
	_Listbox_Staatsangehoerigkeit lbSetValue [_Zeile,_forEachIndex];
	_Listbox_Staatsangehoerigkeit lbSetTooltip [_Zeile,SEL(_x,0)];
} forEach _Staatsangehoerigkeiten;

/* Augenfarben */
{
	private _Zeile = _Listbox_Augenfarbe lbAdd _x;
	_Listbox_Augenfarbe lbSetValue [_Zeile,_forEachIndex];
} forEach _Augenfarben;

/* Körpergrösse in cm */
for "_i" from SEL(_Koerpergroessen,0) to SEL(_Koerpergroessen,1) step 1 do {
	// _Zeile = row
	private _Zeile = _Listbox_Koerpergroesse lbAdd format["%1 cm",_i];
	_Listbox_Koerpergroesse lbSetValue [_Zeile,_i];
};

/* Körpergewicht in kg */
for "_i" from SEL(_Gewicht,0) to SEL(_Gewicht,1) step 1 do {
	// _Zeile = row
	private _Zeile = _Listbox_Koerpergewicht lbAdd format["%1 kg",_i];
	_Listbox_Koerpergewicht lbSetValue [_Zeile,_i];
};

/* Anschrift */
{
	private _Zeile = _Listbox_Wohnort lbAdd format["%1 %2", getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _x >> "Postleitzahl"), getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _x >> "Name")];
	_Listbox_Wohnort lbSetData [_Zeile,_x];
} forEach ((missionConfigFile >> "CfgPerso" >>"Orte" >> worldName) call BIS_fnc_getCfgSubClasses);

/* Geschlecht */
{
	private _Zeile = _Listbox_Geschlecht lbAdd _x;
	_Listbox_Geschlecht lbSetData [_Zeile,_x];
} forEach ["male","female","other"];

_Info STRUCT "Web-Link: <a href='http://www.britanniagaming.co.uk'>Britannia Gaming</a>";

/* Variablen freigeben */
if (!_PersoAendern) then {
	_Listbox_Augenfarbe lbSetCurSel 0;
	_Listbox_Wohnort lbSetCurSel 0;
	_Listbox_JJJJ lbSetCurSel 0;
	_Listbox_MM lbSetCurSel 0;
	_Listbox_Geschlecht lbSetCurSel 0;
	_Listbox_Staatsangehoerigkeit lbSetCurSel 0;
	_Listbox_Koerpergroesse lbSetCurSel 0;
	_Listbox_Koerpergewicht lbSetCurSel 0;
} else {
	(player getVariable ["Persodaten",[]]) params [
		["_PersoID",-1,[0]],
		["_Spielername","",[""]],
		["_Spielerfraktion","",[""]],
		["_Persodaten",[],[[]]],
		["_Datum","",[""]],
		["_Mobilfunknummer","",[""]],
		["_Originalname","",[""]]
	];
	_Persodaten params [
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
	perso_Mobilnummer = _Mobilfunknummer;
	_Geburtsdatum params ["_TT","_MM","_JJJJ"];
	_Listbox_Augenfarbe lbSetCurSel (_Augenfarbe max 0);
	_Listbox_Wohnort lbSetCurSel ((((missionConfigFile >> "CfgPerso" >> "Orte" >> worldName) call BIS_fnc_getCfgSubClasses) find _Wohnort) max 0);
	for "_i" from 0 to (lbSize _Listbox_JJJJ)-1 do {
		_Zahl = _Listbox_JJJJ lbValue _i;
		if (_Zahl == _JJJJ) exitWith {_Listbox_JJJJ lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_MM)-1 do {
		_Zahl = _Listbox_MM lbValue _i;
		if (_Zahl == _MM) exitWith {_Listbox_MM lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_TT)-1 do {
		_Zahl = _Listbox_TT lbValue _i;
		if (_Zahl == _TT) exitWith {_Listbox_TT lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_Koerpergroesse)-1 do {
		_Zahl = _Listbox_Koerpergroesse lbValue _i;
		if (_Zahl == _Koerpergroesse) exitWith {_Listbox_Koerpergroesse lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_Koerpergewicht)-1 do {
		_Zahl = _Listbox_Koerpergewicht lbValue _i;
		if (_Zahl == _Koerpergewicht) exitWith {_Listbox_Koerpergewicht lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_Geschlecht)-1 do {
		_Wert = _Listbox_Geschlecht lbData _i;
		if (_Wert isEqualTo _Geschlecht) exitWith {_Listbox_Geschlecht lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Listbox_Strasse)-1 do {
		_Wert = _Listbox_Strasse lbData _i;
		if (_Wert isEqualTo _Strasse) exitWith {_Listbox_Strasse lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _LB_Gesicht)-1 do {
		_Wert = _LB_Gesicht lbData _i;
		if (_Wert isEqualTo _Persobild) exitWith {_LB_Gesicht lbSetCurSel _i;};
	};
	for "_i" from 0 to (lbSize _Hausnummer)-1 do {
		_Zahl = _Listbox_Hausnummer lbValue _i;
		if (_Zahl == _Listbox_Hausnummer) exitWith {_Listbox_Hausnummer lbSetCurSel _i;};
	};
	_Listbox_Staatsangehoerigkeit lbSetCurSel (_Staatsangehoerigkeit max 0);
	_Text_Mobilnummer = CTRL(8800,8815);
	_Text_Personalausweisnummer = CTRL(8800,8818);
	_Text_Mobilnummer STEXT ("Mobilfunknummer: "+_Mobilfunknummer);
	_Text_Personalausweisnummer STEXT ("Personalausweisnummer: "+([_Originalname,playerSide,_PersoID,PUID] call life_fnc_PersoAusweisnummer));
};
_Knopf_Fortfahren CSHOW true;
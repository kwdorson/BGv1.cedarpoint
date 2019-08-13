#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoGeneriereAdminausweis.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
_Koerpergroessen = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KoerpergroesseVonBis");
_Jahre = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "GeburtsjahreVonBis");
_Gewicht = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "KoerpergewichtVonBis");
_Augenfarben = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Augenfarben");
_Staatsangehoerigkeiten = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Staatsangehoerigkeit");

_KonvertierterName = [profileName] call life_fnc_PersoKonvertiereSpielername;
_Profilname_Kovertiert = SEL(_KonvertierterName,0);
_Mobilfunknummer = [player, [], PUID] call life_fnc_PersoErstelleMobilfunknummer;
_Koerpergroesse = round(random (SEL(_Koerpergroessen,1) - SEL(_Koerpergroessen,0))) + SEL(_Koerpergroessen,0);
_Koerpergewicht = round(random (SEL(_Gewicht,1) - SEL(_Gewicht,0))) + SEL(_Gewicht,0);
_Augenfarbe = (round random count _Augenfarben);
_Wohnorte = ((missionConfigFile >> "CfgPerso" >>"Orte" >> worldName) call BIS_fnc_getCfgSubClasses);
_Wohnort = selectRandom _Wohnorte;
_Geschlecht = selectRandom ["male","female","other"];
_Geschlechtsbilder = (missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _Geschlecht) call BIS_fnc_getCfgSubClasses;
_Strassen = (missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Wohnort >> "Strassen") call BIS_fnc_getCfgSubClasses;
_Strasse = selectRandom _Strassen;
_Hausnummern = getArray(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Wohnort >> "Strassen" >> _Strasse >> "HausnummernVonBis");
_Hausnummer = round(random (SEL(_Hausnummern,1) - SEL(_Hausnummern,0))) + SEL(_Hausnummern,0);
_Jahresangabe = round(random (SEL(_Jahre,1) - SEL(_Jahre,0))) + SEL(_Jahre,0);
_Monatsangabe = (round random 12) max 1;
_CheckModulo = if (_Jahresangabe mod 4 == 0) then
{
	if (_Jahresangabe mod 100 == 0) then
	{
		if (_Jahresangabe mod 400 == 0) then
		{
			true;
		} 
		else
		{
			false;
		};
	}
	else
	{
		false;
	};
}
else
{
	false;
};
_Tage = switch (_Monatsangabe) do
{
	case 1: {31};
	case 2: {28};
	case 3: {31};
	case 4: {30};
	case 5: {31};
	case 6: {30};
	case 7: {31};
	case 8: {31};
	case 9: {30};
	case 10: {31};
	case 11: {30};
	case 12: {31};
};
if(_CheckModulo && (_Monatsangabe == 2)) then {
	_Tage = _Tage + 1;
};
_Tag = (round random _Tage) max 1;

_Jahresangabe_A = 2017;
_Monatsangabe_A = (round random 12) max 1;
_CheckModulo_A = if (_Jahresangabe_A mod 4 == 0) then
{
	if (_Jahresangabe_A mod 100 == 0) then
	{
		if (_Jahresangabe_A mod 400 == 0) then
		{
			true;
		} 
		else
		{
			false;
		};
	}
	else
	{
		false;
	};
}
else
{
	false;
};
_Tage_A = switch (_Monatsangabe_A) do
{
	case 1: {31};
	case 2: {28};
	case 3: {31};
	case 4: {30};
	case 5: {31};
	case 6: {30};
	case 7: {31};
	case 8: {31};
	case 9: {30};
	case 10: {31};
	case 11: {30};
	case 12: {31};
};
if(_CheckModulo_A && (_Monatsangabe_A == 2)) then {
	_Tage_A = _Tage_A + 1;
};
_Tag_A = round random _Tage_A;
_Staatsangehoerigkeit = (round random count _Staatsangehoerigkeiten);
_Persodaten = [round random (150 + ((servertime/60)/60)),_Profilname_Kovertiert,str playerSide,[[_Tag,_Monatsangabe,_Jahresangabe],_Koerpergroesse,_Koerpergewicht,_Wohnort,_Strasse,_Hausnummer,_Augenfarbe,_Geschlecht,_Staatsangehoerigkeit,selectRandom _Geschlechtsbilder],format["%1.%2.%3 %4:%5",_Tag_A,_Monatsangabe_A,_Jahresangabe_A, round random 23, round random 59],_Mobilfunknummer,profileName];
fwfvs_random_adminausweis = compileFinal "0";
player SV ["Persodaten",_Persodaten,true];
if (isNil "FWFVS_Array_Personalausweise") then {FWFVS_Array_Personalausweise = [];};
FWFVS_Array_Personalausweise pushBack _Persodaten;
systemChat "Zufälliger Adminausweis erstellt";
closeDialog 0;
["AdminLog",format["%4(%1-%2, %3) logged in with a random admin ID: %5",PUID,playerSide,call life_adminlevel,profileName,_Persodaten],"Perso",false,0,([getPlayerUID player, profileName, playerSide] joinString "-"),"-"] remoteExec ["anylog_fnc_log",2];
#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoStrasseAuswahl.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
params [["_Control",controlNull,[controlNull]],["_ListAuswahl",-1,[0]]];
disableSerialization;
if (isNull DISP(8800)) exitWith {hint "Perso error: Error in the dialog";};
if (isNull _Control || _ListAuswahl < 0) exitWith {};
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
_Text_Email = CTRL(8800,8813);
_Listbox_Domain = CTRL(8800,8814);
_Text_Mobilnummer = CTRL(8800,8815);
_Listbox_Geschlecht = CTRL(8800,8816);
_Knopf_Fortfahren = CTRL(8800,8817);
_Info = CTRL(8800,99999);
_Listbox_Data_Ort = _Listbox_Wohnort lbData (lbCurSel _Listbox_Wohnort);
_Listbox_Data_Strasse = _Listbox_Strasse lbData (lbCurSel _Listbox_Strasse);
if (_Data isEqualTo "") exitWith {};
lbClear _Listbox_Hausnummer;
_Hausnummer = getArray(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> _Listbox_Data_Ort >> "Strassen" >> _Listbox_Data_Strasse >> "HausnummernVonBis");
for "_i" from SEL(_Hausnummer,0) to SEL(_Hausnummer,1) step 1 do {
	_Zeile = _Listbox_Hausnummer lbAdd str _i;
	_Listbox_Hausnummer lbSetValue [_Zeile,_i];
};
_Listbox_Hausnummer lbSetCurSel 0;
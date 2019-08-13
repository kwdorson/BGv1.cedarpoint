#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoGeschlechtswahl.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
disableSerialization;
CONTROLAUSWAHL; // _ControlListbox, _Auswahl
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
_LB_Gesicht = CTRL(8800,2112);
_Info = CTRL(8800,99999);
lbClear _LB_Gesicht;
_Data = _Listbox_Geschlecht lbData (lbCurSel _Listbox_Geschlecht);
_Gesichter = (missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _Data) call BIS_fnc_getCfgSubClasses;
if (_Gesichter isEqualTo []) exitWith {_Text = "Error in identity card, _Data: '" + _Data + "' does not exist in identities or does not return anything";};
_Gesichter sort true;
{
	_Zeile = _LB_Gesicht lbAdd getText(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _Data >> _x >> "Name");
	_LB_Gesicht lbSetData [_Zeile,_x];
} forEach _Gesichter;
_LB_Gesicht lbSetCurSel 0;
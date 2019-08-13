#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoErstellenBildwahl.sqf
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
_PortraitBild = CTRL(8800,8812);
_Text_Email = CTRL(8800,8813);
_Listbox_Domain = CTRL(8800,8814);
_Text_Mobilnummer = CTRL(8800,8815);
_Listbox_Geschlecht = CTRL(8800,8816);
_Knopf_Fortfahren = CTRL(8800,8817);
_Info = CTRL(8800,99999);
_LB_Gesicht = CTRL(8800,2112);
_DataGeschlecht = _Listbox_Geschlecht lbData (lbCurSel _Listbox_Geschlecht);
_DataGesicht = _LB_Gesicht lbData (lbCurSel _LB_Gesicht);
_Pfad = getText(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Identitaeten" >> _DataGeschlecht >> _DataGesicht >> "Pfad");
perso_portrait = _Pfad;
perso_portraitklasse = _DataGesicht;
_PortraitBild STEXT _Pfad;
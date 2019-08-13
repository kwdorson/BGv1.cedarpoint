#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoPruefenSchaltjahr.sqf
	Beschreibung:
		

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
disableSerialization;
if (isNull DISP(8800)) exitWith {hint "Perso-Fehler: Fehler im Dialog";};

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

lbClear _Listbox_TT;
if ((lbCurSel _Listbox_JJJJ) isEqualTo -1) exitWith {};
if ((lbCurSel _Listbox_MM) isEqualTo -1) exitWith {};
_Jahresangabe = (_Listbox_JJJJ lbValue (lbCurSel _Listbox_JJJJ));
_Monatsangabe = (_Listbox_MM lbValue (lbCurSel _Listbox_MM));
_CheckModulo = if (_Jahresangabe mod 4 == 0) then // Rest == 0
{
	if (_Jahresangabe mod 100 == 0) then // Rest == 0
	{
		if (_Jahresangabe mod 400 == 0) then // Rest == 0
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
for "_i" from 1 to _Tage do
{
	_Zeile = _Listbox_TT lbAdd str _i;
	_Listbox_TT lbSetValue [_Zeile,_i];
};
_Listbox_TT lbSetCurSel 0;
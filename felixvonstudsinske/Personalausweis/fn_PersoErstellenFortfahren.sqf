#include "..\macros.hpp"
/*
	Autor: Felix von Studsinske
	Dateiname: fn_PersoErstellenFortfahren.sqf
	Beschreibung:
		Die Vorschau des Personalausweises

	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
if !canSuspend exitWith {hint "unscheduled environment gefunden, aber gefordert...";};
disableSerialization;
if (isNull DISP(8800)) exitWith {hint "Perso-Fehler: Fehler im Dialog";};

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
_Listbox_Geschlecht = CTRL(8800,8816);
_Knopf_Fortfahren = CTRL(8800,8817);
_Info = CTRL(8800,99999);
_PersoAendern = DISP(8800) GV ["PesoAendern",false];
if ((lbCursel _Listbox_TT isEqualTo -1) || (lbCursel _Listbox_MM isEqualTo -1) || (lbCursel _Listbox_JJJJ isEqualTo -1)) exitWith {hint "No valid dates of birth";};
perso_geburt = [(_Listbox_TT lbValue (lbCursel _Listbox_TT)),(_Listbox_MM lbValue (lbCursel _Listbox_MM)),(_Listbox_JJJJ lbValue (lbCursel _Listbox_JJJJ))];
if (lbCursel _Listbox_Staatsangehoerigkeit isEqualTo -1) exitWith {hint "No citizenship";};
perso_staat = (_Listbox_Staatsangehoerigkeit lbValue (lbCursel _Listbox_Staatsangehoerigkeit));
if (lbCursel _Listbox_Koerpergroesse isEqualTo -1) exitWith {hint "No height";};
perso_cm = (_Listbox_Koerpergroesse lbValue (lbCursel _Listbox_Koerpergroesse));
if (lbCursel _Listbox_Koerpergewicht isEqualTo -1) exitWith {hint "No body weight";};
perso_kg = (_Listbox_Koerpergewicht lbValue (lbCursel _Listbox_Koerpergewicht));
if (lbCursel _Listbox_Wohnort isEqualTo -1) exitWith {hint "No place of residence";};
perso_wohnort = (_Listbox_Wohnort lbData (lbCursel _Listbox_Wohnort));
if (lbCursel _Listbox_Strasse isEqualTo -1) exitWith {hint "No street";};
perso_strasse = (_Listbox_Strasse lbData (lbCursel _Listbox_Strasse));
if (lbCursel _Listbox_Hausnummer isEqualTo -1) exitWith {hint "No house number";};
perso_hsnr = (_Listbox_Hausnummer lbValue (lbCursel _Listbox_Hausnummer));
if (lbCursel _Listbox_Augenfarbe isEqualTo -1) exitWith {hint "No eye color";};
perso_augenfarbe = (_Listbox_Augenfarbe lbValue (lbCursel _Listbox_Augenfarbe));
if (lbCursel _Listbox_Geschlecht isEqualTo -1) exitWith {hint "No gender selection";};
perso_sex = _Listbox_Geschlecht lbData (lbCurSel _Listbox_Geschlecht);
// perso_mobil
createDialog "Dialog_PersonalausweisErstellenVorschau";
waitUntil {!isNull DISP(9900)};
DISP(9900) SV ["PesoAendern",_PersoAendern];
_AnzeigeName = CTRL(9900,9902);
_AnzeigeGeburtsdatum = CTRL(9900,9903);
_AnzeigeAnschrift = CTRL(9900,9904);
_AnzeigeTelefonnummer = CTRL(9900,9905);
_AnzeigeStaatsangehoerigkeit = CTRL(9900,9906);
_Anzeige_Geschlecht = CTRL(9900,9908);
_AnzeigeGroesse = CTRL(9900,9909);
_Bild = CTRL(9900,1201);
_Knopf_Beantragen = CTRL(9900,2400);
if (_PersoAendern) then {_Knopf_Beantragen STEXT "AENDERN"; _Knopf_Beantragen ctrlSetToolTip "Kostenpflichtig ändern.";};
_Bild STEXT perso_portrait;
_Namenskonvertierung = [profileName] call life_fnc_PersoKonvertiereSpielername;
_AnzeigeName STRUCT format["<t font='PuristaLight' color='#%2' size='0.9px' shadow='false'>%1</t>",_Namenskonvertierung select 0,(if ((_Namenskonvertierung select 1) isEqualTo "") then {"525648"} else {"ff0000"})];
if !((_Namenskonvertierung select 1) isEqualTo "") then {
	_AnzeigeName ctrlSetToolTip format["Deleted characters: %1\n\n Is not bad. Clan marks or other markings removed.",(_Namenskonvertierung select 1)];
	[
		"Your profile name contains unauthorized characters that have been filtered out for the identity card.<br/>If the name does not appear completely or correctly, try to use only one clantag before or after the name:<br/>- Sign between ""["" und ""]"" being deleted<br/>- Sign between ""{"" und ""}"" being deleted<br/>- Sign between ""("" und "")"" werden entfernt<br/>- Beispiel: ""Max Mustermann [TNT]"" wird zu ""Max Mustermann""",
		"Namenshinweis",
		"OK",
		false
	] call BIS_fnc_guiMessage;
};
_Staatsangehoerigkeiten = getArray(missionConfigFile >> "CfgPerso" >> "Einstellungen" >> "Staatsangehoerigkeit");
_AnzeigeGeburtsdatum STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1.%2.%3</t>",SEL(perso_geburt,0),SEL(perso_geburt,1),SEL(perso_geburt,2)];

_AnzeigeAnschrift STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1 %2<br/>%3 %4</t>",getText(missionConfigFile >> "CfgPerso" >> "Orte" >>worldName >> perso_wohnort >> "Strassen" >> perso_strasse >> "Name"),perso_hsnr,getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> perso_wohnort >> "Postleitzahl"),getText(missionConfigFile >> "CfgPerso" >> "Orte" >> worldName >> perso_wohnort >> "Name")];
_AnzeigeStaatsangehoerigkeit STRUCT format["<t color='#525648' size='0.9px' shadow='false'>%1</t>",SEL2(_Staatsangehoerigkeiten,perso_staat,1)];
_AnzeigeGroesse STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1 cm</t>",perso_cm];
_Anzeige_Geschlecht STRUCT format["<t font='PuristaLight' color='#525648' size='0.9px' shadow='false'>%1</t>",perso_sex];
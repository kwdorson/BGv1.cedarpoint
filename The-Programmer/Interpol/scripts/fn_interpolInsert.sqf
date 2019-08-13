/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
_prenom = ctrlText 5002;
_nom = ctrlText 5003;
_adresse = ctrlText 5004;
_ville = ctrlText 5005;
_numero = ctrlText 5006;
_yeux = lbData [5007,(lbCurSel 5007)];
_autre = ctrlText 5008;
_naissanceJ = lbData [5009,(lbCurSel 5009)];
_naissanceJ = parseNumber _naissanceJ;
_naissanceM = lbData [5010,(lbCurSel 5010)];
_naissanceM = parseNumber _naissanceM;
_naissanceA = lbData [5011,(lbCurSel 5011)];
_naissanceA = parseNumber _naissanceA;

if (_nom == "") exitWith {hint (["STR_BAD_LASTNAME"] call max_interpol_fnc_localize);};
if (_prenom == "") exitWith {hint (["STR_BAD_FIRSTNAME"] call max_interpol_fnc_localize);};

_naissance = [_naissanceJ,_naissanceM,_naissanceA];
[0,_prenom,_nom,_naissance,_adresse,_ville,_numero,_yeux,_autre] remoteExec ["max_interpol_fnc_updateInterpol",2];

uiSleep 4;
closeDialog 0;
[0] remoteExec ["max_interpol_fnc_getInterpol",2];

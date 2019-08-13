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
_crime = ["",0];
if ((lbCurSel 5312) != -1) then {
    _crime = lbData [5312,lbCurSel 5312];
    _crime = call compile format ["%1",_crime];
} else {
    _crime = ctrlText 5320;
    _montant = parseNumber (ctrlText 5321);
    _crime = [_crime,_montant];
};

if (_crime isEqualTo ["",0]) exitWith {hint localize "STR_Cop_wantedList_noCrimeSelected";};

_id = parseNumber(ctrlText 5310);
if (_id isEqualTo 0) exitWith {};
_prenom = ctrlText 5309;
_nom = ctrlText 5308;
_num = ctrlText 5318;

[0,_id,_crime,player,_prenom,_nom,_num] remoteExec ["max_interpol_fnc_updateCrimes",2];

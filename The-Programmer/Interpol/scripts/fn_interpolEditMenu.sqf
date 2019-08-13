#include "..\..\script_macros.hpp"
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
disableSerialization;
if ((lbCurSel 6003) isEqualTo -1) exitWith {};
_data = lbData[6003,(lbCurSel 6003)];
_data = call compile format ["%1",_data];

closeDialog 0;
_id = (_data select 0);
_prenom = (_data select 1);
_nom = (_data select 2);
_naissance = (_data select 3);
_adresse = (_data select 4);
_ville = (_data select 5);
_numero = (_data select 6);
_yeux = (_data select 7);
_autre = (_data select 8);

createDialog "maxence_interpol_edit";

_display = findDisplay 5100;
(_display displayCtrl 5118) ctrlSetText (["STR_VALIDATE"] call max_interpol_fnc_localize);
ctrlSetText [5114,(["STR_ADRESSE"] call max_interpol_fnc_localize)];
ctrlSetText [5115,(["STR_FIRSTNAME_STAR"] call max_interpol_fnc_localize)];
ctrlSetText [5116,(["STR_LASTNAME_STAR"] call max_interpol_fnc_localize)];
ctrlSetText [5117,(["STR_NAISSANCE"] call max_interpol_fnc_localize)];
ctrlSetText [5119,(["STR_CITY"] call max_interpol_fnc_localize)];
ctrlSetText [5120,(["STR_PHONE_NUMBER"] call max_interpol_fnc_localize)];
ctrlSetText [5121,(["STR_EYES_COLOR"] call max_interpol_fnc_localize)];
ctrlSetText [5122,(["STR_AUTRES"] call max_interpol_fnc_localize)];

_jourtxt = CONTROL(5100,5111);
lbClear _jourtxt;
_moistxt = CONTROL(5100,5112);
lbClear _moistxt;
_annetxt = CONTROL(5100,5113);
lbClear _annetxt;
_yeuxtxt = CONTROL(5100,5107);
lbClear _yeuxtxt;

ctrlSetText [5110,format [(["STR_EDIT_TITLE"] call max_interpol_fnc_localize),_prenom,_nom]];
ctrlSetText [5102,_prenom];
ctrlSetText [5103,_nom];
ctrlSetText [5109,str _id];

for "_i" from 1 to 30 do {
    _jourtxt lbAdd str _i;
    _jourtxt lbSetData [(lbSize _jourtxt)-1,str _i];
};

for "_l" from 1 to 12 do {
    _moistxt lbAdd str _l;
    _moistxt lbSetData [(lbSize _moistxt)-1,str _l];
};

for "_k" from 1900 to 2018 do {
    _value = 2018 - (_k - 1900);
    _annetxt lbAdd str _value;
    _annetxt lbSetData [(lbSize _annetxt)-1,str _value];
};

if !((_naissance select 0) isEqualTo 0) then {
    lbSetCurSel [5111,(_naissance select 0)-1];
};
if !((_naissance select 1) isEqualTo 0) then {
    lbSetCurSel [5112,(_naissance select 1)-1];
};
if !((_naissance select 2) isEqualTo 0) then {
    _value = 2018 - (_naissance select 2);
    lbSetCurSel [5113,_value];
};

_colors = getArray (missionConfigFile >> "Max_Settings_Interpol" >> "eye_colors");

{
    _curColor = _x;
    _yeuxtxt lbAdd _curColor;
    _yeuxtxt lbSetData [(lbSize _yeuxtxt)-1,_curColor];
    if (_yeux != "Non renseigné") then {
        if (_yeux isEqualTo _curColor) then {
            lbSetCurSel [5107,(lbSize _yeuxtxt)-1];
        };
    };
} forEach _colors;

if (_adresse != "Non renseigné") then {ctrlSetText [5104,_adresse];};
if (_ville != "Non renseigné") then {ctrlSetText [5105,_ville];};
if (_numero != "Non renseigné") then {ctrlSetText [5106,_numero];};
if (_autre != "Aucun") then {ctrlSetText [5108,_autre];};

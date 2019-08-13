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
_yeuxtxt = CONTROL(5000,5007);
lbClear _yeuxtxt;
_colors = getArray (missionConfigFile >> "Max_Settings_Interpol" >> "eye_colors");

_display = findDisplay 5000;
(_display displayCtrl 5017) ctrlSetText (["STR_VALIDATE"] call max_interpol_fnc_localize);
ctrlSetText [5012,(["STR_ADD_PLAYER_HEADER"] call max_interpol_fnc_localize)];
ctrlSetText [5013,(["STR_ADRESSE"] call max_interpol_fnc_localize)];
ctrlSetText [5014,(["STR_FIRSTNAME_STAR"] call max_interpol_fnc_localize)];
ctrlSetText [5015,(["STR_LASTNAME_STAR"] call max_interpol_fnc_localize)];
ctrlSetText [5016,(["STR_NAISSANCE"] call max_interpol_fnc_localize)];
ctrlSetText [5018,(["STR_CITY"] call max_interpol_fnc_localize)];
ctrlSetText [5019,(["STR_PHONE_NUMBER"] call max_interpol_fnc_localize)];
ctrlSetText [5020,(["STR_EYES_COLOR"] call max_interpol_fnc_localize)];
ctrlSetText [5021,(["STR_AUTRES"] call max_interpol_fnc_localize)];

_jourtxt = CONTROL(5000,5009);
lbClear _jourtxt;
_moistxt = CONTROL(5000,5010);
lbClear _moistxt;
_annetxt = CONTROL(5000,5011);
lbClear _annetxt;

{
    _yeuxtxt lbAdd _x;
    _yeuxtxt lbSetData [(lbSize _yeuxtxt)-1,_x];
} forEach _colors;

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

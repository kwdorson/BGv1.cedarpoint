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
_joueurs = param [0,[],[[]]];
disableSerialization;

if (!dialog) then {createDialog "maxence_list_interpol";};

_display = findDisplay 6000;
(_display displayCtrl 6002) ctrlSetText (["STR_EDIT_PLAYER"] call max_interpol_fnc_localize);
(_display displayCtrl 6006) ctrlSetText (["STR_SEARCH_BUTTON"] call max_interpol_fnc_localize);
(_display displayCtrl 6005) ctrlSetText (["STR_CRIMES"] call max_interpol_fnc_localize);
ctrlSetText [6001,(["STR_FIRSTNAME_SEARCH_BAR"] call max_interpol_fnc_localize)];
ctrlSetText [6007,(["STR_ADD_PLAYER_HEADER"] call max_interpol_fnc_localize)];

_control = CONTROL(6000,6003);
lbClear _control;
_control lbSetCurSel -1;

_editButton = CONTROL(6000,6002);
_editButton ctrlShow false;
_crimesButton = CONTROL(6000,6005);
_crimesButton ctrlShow false;

if (count _joueurs isEqualTo 0) exitWith {
    _control lbAdd (["STR_NO_RESULT"] call max_interpol_fnc_localize);
    _control lbSetColor [0,[1,0,0,1]];
};

{
    _control lbAdd format ["%1 %2",(_x select 1),(_x select 2)];
    _control lbSetValue [(lbSize _control)-1,(_x select 0)];
    _control lbSetData [(lbSize _control)-1,str(_x)];
} forEach _joueurs;

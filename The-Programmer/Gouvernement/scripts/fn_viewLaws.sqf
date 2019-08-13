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
//createDialog "maxence_laws";
disableSerialization;
_display = findDisplay 1150;

(_display displayCtrl 1153) ctrlSetText (["STR_LAWS_HEADER"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1154) ctrlSetText (["STR_LAWS_ID"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1155) ctrlSetText (["STR_LAWS_TEXT"] call max_gouvernement_fnc_localize);

_list = _display displayCtrl 1151;
lbClear _list;

if ((count maxence_laws) > 0) then {
    {
        _list lbAdd (_x select 0);
        _list lbSetData [(lbSize _list)-1,str(_x)];
    } forEach maxence_laws;
} else {
    _list lbAdd (["STR_NO_LAWS"] call max_gouvernement_fnc_localize);
    _list lbSetData [(lbSize _list)-1,str[]];
};

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
if ((lbCurSel 1003) isEqualTo -1) exitWith {hint (["STR_NO_LAWS_SELECTED"] call max_gouvernement_fnc_localize)};
_data = lbData [1003,lbCurSel (1003)];
_data = call compile _data;

if (_data isEqualTo []) exitWith {};

_action = [
    format [(["STR_DELETE_LAWS_TEXT"] call max_gouvernement_fnc_localize),(_data select 0)],
    (["STR_DELETE_LAWS_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

maxence_laws deleteAt (maxence_laws find _data);
publicVariable "maxence_laws";

[] spawn max_gouvernement_fnc_editLawsMenu;
[maxence_laws] remoteExec ["max_gouvernement_fnc_updateLaws",2];

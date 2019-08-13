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
if (maxence_gouvernement_vote_processing) exitWith {};
createDialog "maxence_prepare_vote";
disableSerialization;

_display = findDisplay 1400;

(_display displayCtrl 1401) ctrlSetText (["STR_CANDIDAT_NO"] call max_gouvernement_fnc_localize) + "1 :";
(_display displayCtrl 1402) ctrlSetText (["STR_CANDIDAT_NO"] call max_gouvernement_fnc_localize) + "2 :";
(_display displayCtrl 1403) ctrlSetText (["STR_CANDIDAT_NO"] call max_gouvernement_fnc_localize) + "3 :";
(_display displayCtrl 1404) ctrlSetText (["STR_CANDIDAT_NO"] call max_gouvernement_fnc_localize) + "4 :";
(_display displayCtrl 1405) ctrlSetText (["STR_CANDIDAT_NO"] call max_gouvernement_fnc_localize) + "5 :";

(_display displayCtrl 1411) ctrlSetText (["STR_VALIDATE"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1412) ctrlSetText (["STR_PREPARE_VOTE_HEADER"] call max_gouvernement_fnc_localize);

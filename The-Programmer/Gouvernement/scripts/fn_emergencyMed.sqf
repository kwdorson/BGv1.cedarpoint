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
if !([(name player),(getPlayerUID player)] in maxence_security) exitWith {};

_message = (["STR_EMERGENCY_MESSAGE"] call max_gouvernement_fnc_localize);
_fromNum = (["STR_FROM_EMERGENCY_MESSAGE"] call max_gouvernement_fnc_localize) + format ["(%1)",(name player)];

if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
    [_message,_fromNum,2,mapGridPosition player] remoteExec ["max_phone_fnc_clientMessage",-2];
    hint format [(["STR_SEND_TO_MEDS"] call max_phone_fnc_localize),_message];
} else {
    [_message,_fromNum,5,mapGridPosition player,player] remoteExecCall ["TON_fnc_clientMessage",-2];
    hint format [localize "STR_CELLMSG_ToPerson",(["STR_TO_EMERGENCY_COP"] call max_gouvernement_fnc_localize),_message];
};

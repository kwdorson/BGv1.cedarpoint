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
private ["_msg","_from","_messages","_newArray"];
_msg = _this select 0;
_from = _this select 1;

if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
    _messages = player getVariable "maxence_messages";
    player remoteExecCall ["max_phone_fnc_getRealTime",2];
    waitUntil {!isNil "realTime"};
    realTime = call compile realTime;
    _newArray = [[_from,_msg,realTime]];

    {
        _newArray pushback _x;
    }   foreach _messages;

    player setVariable ["maxence_messages",_newArray];

    realTime = nil;
    [getPlayerUid player,(player getVariable "maxence_messages")] remoteExecCall ["max_phone_fnc_saveCellPhone",2];

    {
       if (_x select 1 isEqualTo _from) exitWith {
          _from = _x select 0;
       };
    } foreach maxence_contact;
};

_message = format [(["STR_RECEIVE_MESSAGE_FROM_X_SYSTEMCHAT"] call max_gouvernement_fnc_localize),_from,_msg];
hint parseText format [(["STR_RECEIVE_MESSAGE_FROM_X"] call max_gouvernement_fnc_localize),_from,_msg];

["TextMessage",[format [(["STR_RECEIVE_MESSAGE_FROM_X_NOTIF"] call max_gouvernement_fnc_localize),_from]]] call bis_fnc_showNotification;
systemChat _message;

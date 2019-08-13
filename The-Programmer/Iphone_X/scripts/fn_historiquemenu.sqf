/*
    Author: Jean_Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Discord : https://discord.gg/DhFUFsq

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
private["_messages","_playerList","_infoToPass","_delButton","_replyButton","_time","_timeArray","_year","_month","_day","_hour","_minutes"];
disableSerialization;

_display = findDisplay 98111;
_playerList = _display displayCtrl 98112;
_delButton = _display displayCtrl 98114;
_delButton ctrlShow false;
_replyButton = _display displayCtrl 98115;
_replyButton ctrlShow false;

_messages = player getVariable "maxence_messages";
lbClear _playerlist;

if (count _messages < 1) then {
 _playerList lbAdd format[(["STR_NO_MESSAGE"] call max_phone_fnc_localize)];
 _playerList lbSetdata [(lbSize _playerList)-1, (["STR_NO_MESSAGE"] call max_phone_fnc_localize)];
} else {
 {
   _time = _x select 2;
   _timeArray = _time select 1;
   _hour = _timeArray select 3;
   _minutes = _timeArray select 4;
   _numero = _x select 0;

   _minutes = toArray(str _minutes);
   if (count _minutes isEqualTo 1) then {
     _minutes = [48,(_minutes select 0)];
     _minutes = toString(_minutes);
   } else {
     _minutes = toString(_minutes);
   };

    {
       if (_x select 1 isEqualTo _numero) exitWith {
          _numero = _x select 0;
       };
    } foreach maxence_contact;

   _infoToPass = format["%1", _x];
   _playerList lbAdd format["%1 - %2h%3",_numero,_hour,_minutes];
   _playerList lbSetdata [(lbSize _playerList)-1, _infoToPass];
 } foreach _messages;
};

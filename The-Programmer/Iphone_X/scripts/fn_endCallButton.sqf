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
closeDialog 0;

_with = player getVariable ["calling_with",objNull];
if (isNull _with) exitWith {};
 
player setVariable ["in_call",false,true]; 
_with setVariable ["in_call",false,true]; 
[_with] remoteExec ["max_phone_fnc_callEnd",player]; 
[player] remoteExec ["max_phone_fnc_callEnd",_with];

[] spawn the_programmer_iphone_fnc_phone_init;

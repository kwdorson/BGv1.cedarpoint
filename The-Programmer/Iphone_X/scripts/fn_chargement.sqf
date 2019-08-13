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
disableSerialization;
createDialog "The_Programmer_Iphone_Loading_Menu";

_heure = str(date select 3);
_minutes = str(date select 4);
if (count _minutes isEqualTo 1) then {_minutes = "0" + _minutes;};

_display = findDisplay 542367;
_display displayCtrl 2101 ctrlSetStructuredText (parseText (format ["<t align = 'center' shadow = '1' size='2.5' font='PuristaBold'>%1:%2</t>",_heure,_minutes]));

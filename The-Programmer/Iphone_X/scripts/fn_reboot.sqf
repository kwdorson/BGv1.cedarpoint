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
_curConfig = missionConfigFile >> "The_Programmer_Settings_Iphone";

disableSerialization;
createDialog "The_Programmer_Iphone_Reboot_Menu";

_display = findDisplay 20055;

_heure_1 = getText(_curConfig >> "reboot_4");
_heure_2 = getText(_curConfig >> "reboot_3");
_heure_3 = getText(_curConfig >> "reboot_1");
_heure_4 = getText(_curConfig >> "reboot_2");

(_display displayCtrl 1000) ctrlSetStructuredText parseText format ["<t align='center'><t color='#FF8000'><t size='1.5'>%1</t></t></t>",_heure_1];
(_display displayCtrl 1001) ctrlSetStructuredText parseText format ["<t align='center'><t color='#FF8000'><t size='1.5'>%1</t></t></t>",_heure_2];
(_display displayCtrl 1002) ctrlSetStructuredText parseText format ["<t align='center'><t color='#FF8000'><t size='1.5'>%1</t></t></t>",_heure_3];
(_display displayCtrl 1003) ctrlSetStructuredText parseText format ["<t align='center'><t color='#FF8000'><t size='1.5'>%1</t></t></t>",_heure_4];

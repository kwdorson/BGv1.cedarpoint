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
_addname = ctrlText 3051;
_addnum = ctrlText 3052;

if (_addname == "") exitWith {hint (["STR_FAIL_ADD_CONTACT_NAME_BAD"] call max_phone_fnc_localize);};
if (_addnum == "") exitWith {hint (["STR_FAIL_ADD_CONTACT_NUM_BAD"] call max_phone_fnc_localize);};

hint format [(["STR_ADD_CONTACT_SUCCES"] call max_phone_fnc_localize),_addname,_addnum];
maxence_contact pushBackUnique [_addname,_addnum];
[] call the_programmer_iphone_fnc_contactmenu;
_num = player getVariable "maxence_numero";
[getPlayerUID player,_num,maxence_contact] remoteExec ["max_phone_fnc_updatePhone",2];

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
_data = _this select 0;
_num = lbData[3005,_data];

if (_num == "") exitwith {hint (["STR_NO_SELECTED_CONTACT"] call max_phone_fnc_localize)};

_name = "ERROR";
{
	_contactnum = (_x select 1);
	if (_num isEqualTo _contactnum) exitWith {
		_contact = [_x];
        _name = (_x select 0);
		maxence_contact = maxence_contact - _contact;
	};
} forEach maxence_contact;

hint format [(["STR_REMOVE_CONTACT_SUCCES"] call max_phone_fnc_localize),_name,_num];
[] call the_programmer_iphone_fnc_contactmenu;
_num = player getVariable "maxence_numero";
[getPlayerUID player,_num,maxence_contact] remoteExec ["max_phone_fnc_updatePhone",2];

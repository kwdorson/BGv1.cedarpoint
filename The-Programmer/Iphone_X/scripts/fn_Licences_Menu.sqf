#include "..\..\script_macros.hpp"
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
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct"];
disableSerialization;

createDialog "The_Programmer_Iphone_Licenses_Menu";

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_lic = CONTROL(20058,1500);
_struct = "";

{
	_displayName = getText(_x >> "displayName");
	
	if(LICENSE_VALUE(configName _x,_side)) then {
		_struct = _struct + format["%1<br/>",localize _displayName];
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if (_struct isEqualTo "") then {
    _struct = "You have no licenses, bucko";
};

_lic ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];
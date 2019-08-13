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
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct","_value","_unit","_tax","_unit","_amount"];

_amount = ctrlText 2018;
ctrlShow[2001,false];

if ((lbCurSel 2022) isEqualTo -1) exitWith {hint localize "STR_NOTF_noOneSelected";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];

_unit = call compile format ["%1",_unit];

if (isNil "_unit") exitWith {ctrlShow[2001,true];};
if (_unit == player) exitWith {ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};

if (!life_use_atm) exitWith {hint localize "STR_NOTF_recentlyRobbedBank";ctrlShow[2001,true];};
if (!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";ctrlShow[2001,true];};
if (parseNumber(_amount) <= 0) exitWith {hint localize "STR_NOTF_enterAmount";ctrlShow[2001,true];};
if (parseNumber(_amount) > civRDM) exitWith {hint localize "STR_NOTF_notEnoughtToGive";ctrlShow[2001,true];};
if (isNull _unit) exitWith {ctrlShow[2001,true];};
if (isNil "_unit") exitWith {ctrlShow[2001,true]; hint localize "STR_NOTF_notWithinRange";};

hint format [localize "STR_NOTF_youGaveMoney",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable ["realname",name _unit]];
civRDM = civRDM - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
ctrlShow[2001,true];

[] call the_programmer_iphone_fnc_PayEasy;

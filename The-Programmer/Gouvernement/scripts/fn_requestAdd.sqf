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
private _count = count _this;

if (isNil "_this") exitWith {};
if (_this isEqualType "") exitWith {};
if (count _this isEqualTo 0) exitWith {};
if ((_this select 0) isEqualTo "Error") exitWith {};
if (!((_this select 0) isEqualTo 1)) exitWith {};

if ((getPlayerUID player) in (_this select 1)) then {
    maxence_has_voted = true;
} else {
    maxence_has_voted = false;
};

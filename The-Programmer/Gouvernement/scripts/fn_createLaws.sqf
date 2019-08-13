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
_numero = ctrlText 1001;
_description = ctrlText 1002;

if (_numero isEqualTo "") exitWith {hint (["STR_CREATE_LAWS_BAD_NUMBER"] call max_gouvernement_fnc_localize);};
if (_description isEqualTo "") exitWith {hint (["STR_CREATE_LAWS_BAD_INFORMATIONS"] call max_gouvernement_fnc_localize);};

_fn_niceString = {
    _string = toArray _this;

    {
        if (_x isEqualTo 39) then {
            _string set [_forEachIndex,32];
        };
    } forEach _string;

    toString _string;
};

_numero = _numero call _fn_niceString;
_description = _description call _fn_niceString;

_valid = true;
{
    if ((_x select 0) isEqualTo _numero) exitWith {_valid = false;};
} forEach maxence_laws;

if !(_valid) exitWith {hint (["STR_LAWS_ALREADY_EXIST"] call max_gouvernement_fnc_localize);};

_action = [
    format [(["STR_CREATE_LAWS_TEXT"] call max_gouvernement_fnc_localize),_numero],
    (["STR_CREATE_LAWS_HEADER"] call max_gouvernement_fnc_localize),
    (["STR_VALIDATE"] call max_gouvernement_fnc_localize),
    (["STR_UNDO"] call max_gouvernement_fnc_localize)
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

player remoteExecCall ["max_gouvernement_fnc_getRealTime",2];
waitUntil {!isNil "realTime"};
_realTime = call compile realTime;
realTime = nil;
_realTime = _realTime select 1;

maxence_laws pushBack [_numero,_description,_realTime];
publicVariable "maxence_laws";

[] spawn max_gouvernement_fnc_editLawsMenu;
[maxence_laws] remoteExec ["max_gouvernement_fnc_updateLaws",2];

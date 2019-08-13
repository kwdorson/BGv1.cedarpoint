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
_type = param [0,0,[0]];

createDialog "maxence_historique_gouvernement";
disableSerialization;

_display = findDisplay 1300;
(_display displayCtrl 1301) ctrlSetText (["STR_HISTORIC_HEADER"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1303) ctrlSetText (["STR_TRANSACTIONS_GOUV"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1304) ctrlSetText (["STR_TRANSACTIONS_TAXES_OBJECTS"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1305) ctrlSetText (["STR_TRANSACTIONS_TAXES_SALAIRES"] call max_gouvernement_fnc_localize);
(_display displayCtrl 1306) ctrlSetText (["STR_TRANSACTIONS_TAXES_ENTREPRISES"] call max_gouvernement_fnc_localize);

_list = _display displayCtrl 1302;

if (_type isEqualTo 0) then {
    _list lbAdd (["STR_SELECTE_CATEGORY"] call max_gouvernement_fnc_localize);
    ctrlShow [1307,false];
} else {
    _entreprise = objNull;
    _obj = cursorObject;
    if (isNull _obj) exitWith {closeDialog 0;};
    _requiredLicense = _obj getVariable ["required_license",""];
    if !(_requiredLicense select [0,11] isEqualTo "entreprise_") exitWith {closeDialog 0;};
    _entreprise_id = parseNumber (_requiredLicense select [11,count _requiredLicense-1]);
    if (_entreprise_id isEqualTo 0) exitWith {closeDialog 0;};

    {
        if ((_x select 0) isEqualTo _entreprise_id) exitWith {
            _entreprise = (_x select 1);
        };
    } forEach maxence_all_entreprises;

    if (isNull _entreprise) exitWith {closeDialog 0;};

    [_entreprise] remoteExec ["max_gouvernement_fnc_getEntrepriseLogs",2];
    _bankENT = _entreprise getVariable ["entreprise_bankacc",0];
    (_display displayCtrl 1307) ctrlSetStructuredText parseText format [(["STR_COMPANY_LOGS_HEADER"] call max_gouvernement_fnc_localize),[_bankENT] call life_fnc_numberText];
    ctrlShow [1303,false];
    ctrlShow [1304,false];
    ctrlShow [1305,false];
    ctrlShow [1306,false];
};

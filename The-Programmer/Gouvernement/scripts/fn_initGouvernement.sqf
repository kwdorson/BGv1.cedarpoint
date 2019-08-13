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
[] remoteExec ["max_gouvernement_fnc_request",2];

if ((getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "companies_script_enable")) isEqualTo 1) then {
    if (isNil "maxence_all_entreprises") then {maxence_all_entreprises = []};
    {
        _curEntreprise = (_x select 1);
        _objs = _curEntreprise getVariable ["entreprise_objects",[]];
        {
            _curObj = _x;
            if (_curObj isEqualType objNull) then {
                if ((typeOf _curObj) isEqualTo "Land_InfoStand_V1_F") then {
                    _curObj addAction [(["STR_SEE_COMPANY_LOGS"] call max_gouvernement_fnc_localize),{[1] spawn max_gouvernement_fnc_historicMenu;},"",0,false,false,"",'(([(name player),(getPlayerUID player)] in maxence_gouverneur) || ([(name player),(getPlayerUID player)] in maxence_ministres))'];
                };
            };
        } forEach _objs;
    } forEach maxence_all_entreprises;
};

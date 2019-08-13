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
if ((!([(name player),(getPlayerUID player)] in maxence_gouverneur)) && (!([(name player),(getPlayerUID player)] in maxence_ministres))) exitWith {};

if ((lbCurSel 1023) isEqualTo -1) exitWith {hint (["STR_MUST_SELECT_FROM"] call max_gouvernement_fnc_localize);};
if ((lbCurSel 1024) isEqualTo -1) exitWith {hint (["STR_MUST_SELECT_TO"] call max_gouvernement_fnc_localize);};

_value = parseNumber (ctrlText 1018);
if (_value <= 0) exitWith {hint (["STR_BAD_AMOUNT"] call max_gouvernement_fnc_localize);};

_from = lbValue [1023,(lbCurSel 1023)];
_fromTXT = "";
_to = lbValue [1024,(lbCurSel 1024)];
_toTXT = "";
_exit = false;

if (_from isEqualTo _to) exitWith {hint (["STR_CANNOT_TRANSFERT"] call max_gouvernement_fnc_localize);};

switch (_from) do { 
    case 0 : {
        _fromTXT = (["STR_GOVERNEMENT_ACCOUNT"] call max_gouvernement_fnc_localize);
        if (maxence_compte_gouv < _value) exitWith {_exit = true;};
        maxence_compte_gouv = maxence_compte_gouv - _value;
        publicVariable "maxence_compte_gouv";
        switch (_to) do { 
            case 1 : {
                _toTXT = (["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_cop = maxence_compte_cop + _value;
                publicVariable "maxence_compte_cop";
            }; 
            case 2 : {
                _toTXT = (["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_med = maxence_compte_med + _value;
                publicVariable "maxence_compte_med";
            };
            case 3 : {
                _toTXT = name player;
                life_fishFinder = life_fishFinder + _value;
                [1] call SOCK_fnc_updatePartial;
            };
        };
    };
    case 1 : {
        _fromTXT = (["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize);
        if (maxence_compte_cop < _value) exitWith {_exit = true;};
        maxence_compte_cop = maxence_compte_cop - _value;
        publicVariable "maxence_compte_cop";
        switch (_to) do { 
            case 0 : {
                _toTXT = (["STR_GOVERNEMENT_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_gouv = maxence_compte_gouv + _value;
                publicVariable "maxence_compte_gouv";
            }; 
            case 2 : {
                _toTXT = (["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_med = maxence_compte_med + _value;
                publicVariable "maxence_compte_med";
            };
            case 3 : {
                _toTXT = name player;
                life_fishFinder = life_fishFinder + _value;
                [1] call SOCK_fnc_updatePartial;
            };
        };
    };
    case 2 : {
        _fromTXT = (["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize);
        if (maxence_compte_med < _value) exitWith {_exit = true;};
        maxence_compte_med = maxence_compte_med - _value;
        publicVariable "maxence_compte_med";
        switch (_to) do { 
            case 0 : {
                _toTXT = (["STR_GOVERNEMENT_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_gouv = maxence_compte_gouv + _value;
                publicVariable "maxence_compte_gouv";
            };
            case 1 : {
                _toTXT = (["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_cop = maxence_compte_cop + _value;
                publicVariable "maxence_compte_cop";
            };
            case 3 : {
                _toTXT = name player;
                life_fishFinder = life_fishFinder + _value;
                [1] call SOCK_fnc_updatePartial;
            };
        };
    };
    case 3 : {
        _fromTXT = name player;
        if (life_fishFinder < _value) exitWith {_exit = true;};
        life_fishFinder = life_fishFinder - _value;
        [1] call SOCK_fnc_updatePartial;
        switch (_to) do { 
            case 0 : {
                _toTXT = (["STR_GOVERNEMENT_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_gouv = maxence_compte_gouv + _value;
                publicVariable "maxence_compte_gouv";
            };
            case 1 : {
                _toTXT = (["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_cop = maxence_compte_cop + _value;
                publicVariable "maxence_compte_cop";
            }; 
            case 2 : {
                _toTXT = (["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize);
                maxence_compte_med = maxence_compte_med + _value;
                publicVariable "maxence_compte_med";
            };
        };
    };
};

if (_exit) exitWith {hint (["STR_NOT_ENOUGHT_MONEY"] call max_gouvernement_fnc_localize);};

hint (["STR_TRANSFERT_IN_PROCESS"] call max_gouvernement_fnc_localize);
uiSleep 3;

[maxence_compte_gouv,maxence_compte_cop,maxence_compte_med,(name player),_from,_to,_value,0] remoteExec ["max_gouvernement_fnc_updateAccounts",2];
[] spawn max_gouvernement_fnc_governorMenu;
hint format [(["STR_SUCCES_TRANSFERT"] call max_gouvernement_fnc_localize),_value,_fromTXT,_toTXT];

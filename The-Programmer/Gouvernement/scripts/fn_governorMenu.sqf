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
if !([(name player),(getPlayerUID player)] in maxence_gouverneur) exitWith {};
_openDialog = param [0,0,[0]];

if (_openDialog isEqualTo 1) then {createDialog "maxence_gouverneur";};
disableSerialization;

_display = findDisplay 1600;

if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 1000) ctrlSetText "The-Programmer\Gouvernement\textures\gouverneur_fond.paa";
} else {
    if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 1000) ctrlSetText "The-Programmer\Gouvernement\textures\gouverneur_fond_de.paa";
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "es") then {
            (_display displayCtrl 1000) ctrlSetText "The-Programmer\Gouvernement\textures\gouverneur_fond_es.paa";
        } else {
            (_display displayCtrl 1000) ctrlSetText "The-Programmer\Gouvernement\textures\gouverneur_fond_en.paa";
        };
    };
};

_ministresList = _display displayCtrl 1011;
lbClear _ministresList;
_securityList = _display displayCtrl 1012;
lbClear _securityList;
_allPlayersList1 = _display displayCtrl 1021;
lbClear _allPlayersList1;
_allPlayersList2 = _display displayCtrl 1022;
lbClear _allPlayersList2;

if (count maxence_ministres > 0) then {
    {
        _ministresList lbAdd (_x select 0);
        _ministresList lbSetData [(lbSize _ministresList)-1,str(_x)];
    } forEach maxence_ministres;
};

if (count maxence_security > 0) then {
    {
        _securityList lbAdd (_x select 0);
        _securityList lbSetData [(lbSize _securityList)-1,str(_x)];
    } forEach maxence_security;
};

{
    if (!isNull _x && alive _x && !(_x isEqualTo player)) then {
        if ((side _x) == civilian) then {
            if !(([(name player),(getPlayerUID player)] in maxence_ministres) && ([(name player),(getPlayerUID player)] in maxence_security)) then {
                _allPlayersList1 lbAdd format ["%1",_x getVariable ["realname",name _x]];
                _allPlayersList1 lbSetData [(lbSize _allPlayersList1)-1,str(_x)];
                _allPlayersList2 lbAdd format ["%1",_x getVariable ["realname",name _x]];
                _allPlayersList2 lbSetData [(lbSize _allPlayersList2)-1,str(_x)];
            };
        };
    };
} forEach playableUnits;

_sliders = [[1001,0],[1002,1],[1003,2]];
{
    _type = (_x select 1);
    _value = maxence_taxes select _type;
    _varConfig = switch (_type) do { 
        case 0 : {"maximum_companies_taxes"}; 
        case 1 : {"maximum_sales_taxes"};
        case 2 : {"maximum_salary_taxes"};
    };
    (_display displayCtrl (_x select 0)) slidersetRange [0,getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> _varConfig)];
    (_display displayCtrl (_x select 0)) sliderSetSpeed [100,100];
    (_display displayCtrl (_x select 0)) sliderSetPosition _value;
} forEach _sliders;

(_display displayCtrl 1004) ctrlSetText str (maxence_taxes select 0);
(_display displayCtrl 1005) ctrlSetText str (maxence_taxes select 1);
(_display displayCtrl 1006) ctrlSetText str (maxence_taxes select 2);

_fromAccount = _display displayCtrl 1023;
lbClear _fromAccount;
_toAccount = _display displayCtrl 1024;
lbClear _toAccount;
_transfert = [[(["STR_GOVERNEMENT_ACCOUNT"] call max_gouvernement_fnc_localize),0],[(["STR_COP_ACCOUNT"] call max_gouvernement_fnc_localize),1],[(["STR_MED_ACCOUNT"] call max_gouvernement_fnc_localize),2],[(name player),3]];
{
    _fromAccount lbAdd (_x select 0);
    _fromAccount lbSetValue [(lbSize _fromAccount)-1,(_x select 1)];
    _toAccount lbAdd (_x select 0);
    _toAccount lbSetValue [(lbSize _toAccount)-1,(_x select 1)];
} forEach _transfert;

(_display displayCtrl 1015) ctrlSetStructuredText parseText format [(["STR_ACCOUNT"] call max_gouvernement_fnc_localize),[maxence_compte_gouv] call life_fnc_numberText];
(_display displayCtrl 1016) ctrlSetStructuredText parseText format [(["STR_ACCOUNT"] call max_gouvernement_fnc_localize),[maxence_compte_cop] call life_fnc_numberText];
(_display displayCtrl 1017) ctrlSetStructuredText parseText format [(["STR_ACCOUNT"] call max_gouvernement_fnc_localize),[maxence_compte_med] call life_fnc_numberText];

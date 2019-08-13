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
if !([(name player),(getPlayerUID player)] in maxence_security) exitWith {};

createDialog "maxence_securite";
disableSerialization;

_display = findDisplay 1900;

ctrlShow [1903,false];
if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 1901) ctrlSetText "The-Programmer\Gouvernement\textures\securite_fond.paa";
    if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
        if (getNumber (missionConfigFile >> "Max_Settings_Phone" >> "messages_to_depanneurs") == 1) then {
            (_display displayCtrl 1902) ctrlSetText "The-Programmer\Gouvernement\textures\securite_button_dep.paa";
            ctrlShow [1903,true];
        };
    };
} else {
    if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 1901) ctrlSetText "The-Programmer\Gouvernement\textures\securite_fond_de.paa";
        if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
            if (getNumber (missionConfigFile >> "Max_Settings_Phone" >> "messages_to_depanneurs") == 1) then {
                (_display displayCtrl 1902) ctrlSetText "The-Programmer\Gouvernement\textures\securite_button_dep_de.paa";
                ctrlShow [1903,true];
            };
        };
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "es") then {
            (_display displayCtrl 1901) ctrlSetText "The-Programmer\Gouvernement\textures\securite_fond_es.paa";
            if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
                if (getNumber (missionConfigFile >> "Max_Settings_Phone" >> "messages_to_depanneurs") == 1) then {
                    (_display displayCtrl 1902) ctrlSetText "The-Programmer\Gouvernement\textures\securite_button_dep_es.paa";
                    ctrlShow [1903,true];
                };
            };
        } else {
            (_display displayCtrl 1901) ctrlSetText "The-Programmer\Gouvernement\textures\securite_fond_en.paa";
            if (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "phone_numbers_script") isEqualTo 1) then {
                if (getNumber (missionConfigFile >> "Max_Settings_Phone" >> "messages_to_depanneurs") == 1) then {
                    (_display displayCtrl 1902) ctrlSetText "The-Programmer\Gouvernement\textures\securite_button_dep_en.paa";
                    ctrlShow [1903,true];
                };
            };
        };
    };
};

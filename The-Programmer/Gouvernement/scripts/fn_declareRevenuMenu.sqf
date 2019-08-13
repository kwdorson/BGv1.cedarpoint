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
createDialog "maxence_declaration";

disableSerialization;
_display = findDisplay 6790;

if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 6791) ctrlSetText "The-Programmer\Gouvernement\textures\declaration.paa";
} else {
    if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 6791) ctrlSetText "The-Programmer\Gouvernement\textures\declaration_de.paa";
    } else {
        if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "es") then {
            (_display displayCtrl 6791) ctrlSetText "The-Programmer\Gouvernement\textures\declaration_es.paa";
        } else {
            (_display displayCtrl 6791) ctrlSetText "The-Programmer\Gouvernement\textures\declaration_en.paa";
        };
    };
};

(_display displayCtrl 6793) ctrlSetText (str (maxence_taxes select 0) + "%");

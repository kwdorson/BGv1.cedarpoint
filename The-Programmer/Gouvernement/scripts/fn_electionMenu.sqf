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
if (!dialog) then {createDialog "maxence_election";};
disableSerialization;

_display = findDisplay 1800;

if (call life_adminlevel < 1) then {
    ctrlShow [1021,false];
} else {
    if (maxence_gouvernement_vote_processing) then {
        (_display displayCtrl 1021) ctrlSetText (["STR_STOP_VOTE_BUTTON"] call max_gouvernement_fnc_localize);
        (_display displayCtrl 1021) buttonSetAction "[] spawn max_gouvernement_fnc_stopVote;";
    } else {
        (_display displayCtrl 1021) ctrlSetText (["STR_START_VOTE_BUTTON"] call max_gouvernement_fnc_localize);
        (_display displayCtrl 1021) buttonSetAction "closeDialog 0; [] spawn max_gouvernement_fnc_prepareVoteMenu;";
    };
};

if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "fr") then {
    (_display displayCtrl 1022) ctrlSetText "The-Programmer\Gouvernement\textures\election_fond.paa";
} else {
    if (getText (missionConfigFile >> "Max_Settings_Gouvernement" >> "default_lang") isEqualTo "de") then {
        (_display displayCtrl 1022) ctrlSetText "The-Programmer\Gouvernement\textures\election_fond_de.paa";
    } else {
        (_display displayCtrl 1022) ctrlSetText "The-Programmer\Gouvernement\textures\election_fond_en.paa";
    };
};

_i = 1;
{
    if (_i > 5) exitWith {};
    (_display displayCtrl (_i + 1005)) ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",(_x select 0)];
    if !(maxence_gouvernement_vote_processing) then {
        (_display displayCtrl (_i + 1010)) ctrlSetStructuredText parseText format [(["STR_COUNT_VOTE"] call max_gouvernement_fnc_localize),(_x select 2)];
        (_display displayCtrl (_i + 1015)) ctrlSetStructuredText parseText format [(["STR_PERCENT_VOTE"] call max_gouvernement_fnc_localize),(str (_x select 3) + "%")];
        if ((_x select 4) isEqualTo 1) then {
            (_display displayCtrl (_i + 1000)) ctrlSetText "The-Programmer\Gouvernement\textures\candidatgreen.paa";
            ctrlShow [(_i + 1000),true];
        } else {
            (_display displayCtrl (_i + 1000)) ctrlSetText "The-Programmer\Gouvernement\textures\candidat.paa";
            ctrlShow [(_i + 1000),true];
        };
    } else {
        (_display displayCtrl (_i + 1000)) ctrlSetText "The-Programmer\Gouvernement\textures\candidat.paa";
        if !(maxence_has_voted) then {
            (_display displayCtrl (_i + 1022)) ctrlSetText "The-Programmer\Gouvernement\textures\vote.paa";
            ctrlShow [(_i + 1027),true];
        } else {
            (_display displayCtrl (_i + 1022)) ctrlSetText "";
            ctrlShow [(_i + 1027),false];
        };
    };
    _i = _i + 1;
} forEach maxence_election_candidats;

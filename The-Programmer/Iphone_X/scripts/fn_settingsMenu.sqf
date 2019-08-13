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
if (isNull (findDisplay 2900)) then {
    if (!createDialog "The_Programmer_Iphone_Settings_Menu") exitWith {};
};

disableSerialization;

ctrlSetText[2902, format ["%1",life_settings_viewDistanceFoot]];
ctrlSetText[2912, format ["%1",life_settings_viewDistanceCar]];
ctrlSetText[2922, format ["%1",life_settings_viewDistanceAir]];

{
    slidersetRange [(_x select 0),100,8000];
    CONTROL(2900,(_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[2901,life_settings_viewDistanceFoot],[2911,life_settings_viewDistanceCar],[2921,life_settings_viewDistanceAir]];

if (isNil "life_settings_revealObjects") then {
    life_settings_enableNewsBroadcast = profileNamespace setVariable ["life_enableNewsBroadcast",true];
    life_settings_enableSidechannel = profileNamespace setVariable ["life_enableSidechannel",true];
    life_settings_tagson = profileNamespace setVariable ["life_settings_tagson",true];
    life_settings_revealObjects = profileNamespace setVariable ["life_settings_revealObjects",true];
};

CONTROL(2900,2971) cbSetChecked life_settings_enableSidechannel;
CONTROL(2900,2973) cbSetChecked life_settings_enableNewsBroadcast;
CONTROL(2900,2970) cbSetChecked life_settings_tagson;
CONTROL(2900,2972) cbSetChecked life_settings_revealObjects;

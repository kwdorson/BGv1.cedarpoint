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
private ["_display","_joueur"];

disableSerialization;
createDialog "The_Programmer_Iphone_Bank_Menu";

_display = findDisplay 20055;
_joueur = (_display displayCtrl 2022);

lbClear _joueur;

(_display displayCtrl 1002) ctrlSetStructuredText (parseText (format ["<t align = 'center' shadow = '1' color='#000000' font='PuristaBold'>%1</t>",[civRDMed] call life_fnc_numberText]));
(_display displayCtrl 1001) ctrlSetStructuredText (parseText (format ["<t align = 'center' shadow = '1' color='#000000' font='PuristaBold'>%1</t>",[civRDM] call life_fnc_numberText]));

 _near_units = [];
{ 
 	if (player distance _x < 20) then {
 		_near_units pushBack _x;
 	};
} foreach playableUnits;

 {
 	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then {
 		_joueur lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
 		_joueur lbSetData [(lbSize _joueur)-1,str(_x)];
 	};
 } foreach _near_units;

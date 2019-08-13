#include "..\..\script_macros.hpp"

if (playerSide isEqualTo civilian) then {
[localize "STR_nothingHere",true,"slow"] call life_fnc_notificationSystem;
};

if (playerSide isEqualTo west) then {
createDialog "smartphoneCOP";
};

if (playerSide isEqualTo independent) then {
createDialog "smartphoneMEDIC";
};

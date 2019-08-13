#include "..\..\script_macros.hpp"

if (vehicle player != player) exitWith { ["You cannot apply a morphine in a vehicle, it's dangerous anyways..",false,"slow"] call life_fnc_notificationSystem;};
if (life_inv_morphine < 1) exitWith { ["You do not have any morphine..",false,"slow"] call life_fnc_notificationSystem; };

closeDialog 0;
life_action_inUse = true;
[false,"morphine",1] call life_fnc_handleInv;
if ((stance player) isEqualTo "PRONE") then {
	player playMove "AinvPpneMstpSlayWpstDnon_medic";
} else {
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
};
uiSleep 1.5;
waitUntil {!(animationState player in ["ainvpknlmstpsnonwnondnon_medic_1","AinvPpneMstpSlayWpstDnon_medic"]) };
life_action_inUse = false;

["You applied the morphine, you are starting to feel better.",false,"slow"] call life_fnc_notificationSystem;
sleep 1;
player setDamage 0;

"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"radialBlur" ppEffectEnable false;
resetCamShake;
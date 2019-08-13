if (side player != west) exitWith {["You are not a cop!",true,"slow"] call life_fnc_notificationSystem};
if (call(life_coplevel) < 5) exitWith {["You are too low of a rank to use this!",true,"slow"] call life_fnc_notificationSystem;};
if ((Anti_ThreatSpam > 0) && ((time - Anti_ThreatSpam) < 120)) exitWith{["You must wait 2 minutes before changing the threat level again.",true,"slow"] call life_fnc_notificationSystem;};

closeDialog 0;
createDialog "ThreatLevel";

lbClear 2100;
lbAdd [2100,"Green"];
lbAdd [2100,"Amber"];
lbAdd [2100,"Red"];
lbAdd [2100,"Martial Law"];

_getCur = missionNamespace getVariable "ThreatLevel";
lbSetCurSel [2100, _getCur]; 

buttonSetAction [2400, "Anti_ThreatSpam = time; [lbCurSel 2100] call life_fnc_changeThreat; closeDialog 0;"];
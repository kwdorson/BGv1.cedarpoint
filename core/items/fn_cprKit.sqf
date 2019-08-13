#include "..\..\script_macros.hpp"

private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
params [
    ["_target",objNull,[objNull]]
];
if(isNull _target) exitWith {};

_revivable = _target getVariable ["Revive",false];
if(_revivable) exitWith {};
if(player distance _target > 5) exitWith {};
if(life_action_inUse) exitWith {};
if(_target isEqualTo player) exitWith {};
if (life_combatTime > time) exitWith {["You cannot revive in combat!",true,"slow"] call life_fnc_notificationSystem;};
if ((_target getVariable ["Reviving",objNull]) isEqualTo player) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call life_fnc_notificationSystem;};
if !(((_target getVariable ["Reviving",objNull]) isEqualTo objNull)) exitWith {[localize "STR_Medic_AlreadyReviving",true,"slow"] call life_fnc_notificationSystem;};

_target setVariable ["Reviving",player,TRUE];
_title = format [localize "STR_CPR_Progress"];
life_action_inUse = true;

disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do {
    if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep .15;
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if(_cP >= 1 OR !alive player) exitWith {};
    if(life_istazed) exitWith {};
    if(life_isknocked) exitWith {};
    if(life_interrupted) exitWith {};
    if (life_combatTime > time) exitWith {["You cannot revive in combat!",true,"slow"] call life_fnc_notificationSystem;};
    if((player getVariable ["restrained",false])) exitWith {};
    if(player distance _target > 5) exitWith {_badDistance = true;};
    if(_target getVariable ["Revive",false]) exitWith {};
    if(_target getVariable ["Reviving",ObjNull] != player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {hint "Somebody is already reviving them."; life_action_inUse = false;};
_target setVariable ["Reviving",NIL,true];

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if(_target getVariable ["Revive",false]) exitWith {hint localize "STR_Medic_RevivedRespawned";life_action_inUse = false;};
if((player getVariable ["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if (life_combatTime > time) exitWith {["You cannot revive in combat!",true,"slow"] call life_fnc_notificationSystem;};

life_action_inUse = false;

_break = floor (random 100);
if (_break < (99 - (missionNamespace getVariable ["mav_ttm_var_cprChance",15]))) then {
    _target setVariable ["Revive",true,true];
    [player] remoteExecCall ["life_fnc_cprrevived",_target];
    if (((player getVariable ["cprExp",0]) < time)) then {
        ["CPR"] spawn mav_ttm_fnc_addExp;
    };
    player setVariable ["cprExp",time+300];
    sleep .6;
    player reveal _target;
} else {
    ["You have failed the CPR, try again!",true,"slow"] call life_fnc_notificationSystem;
    [_target] spawn life_fnc_cprKit;
};
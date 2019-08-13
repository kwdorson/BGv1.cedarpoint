#include "..\..\script_macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
if (!life_settings_tagson) exitWith {};
private _nearObjects = nearestObjects [cameraOn, ["Man"], 15] select {isPlayer _x && {alive _x} && {!(_x isEqualTo cameraOn)} && {!isObjectHidden _x} && {lineIntersectsSurfaces [eyePos cameraOn, eyePos _x, vehicle cameraOn, _x] isEqualTo []}} apply {[_x, getPlayerUID _x]};

{
    _x params ["_player", "_uid"];
    private _pos = _player modelToWorldVisual ([0, 0, ((_player selectionPosition "head") select 2) + 0.6] vectorAdd [0, 0, (cameraOn distance _player) * 0.03]);
    private _color = [0.83, 0.83, 0.83, 1];
    
    if (!((_player getVariable ["donorLevel",0]) isEqualTo 0)) then {
        _vipcolor = _player getVariable ["PSI_VIPColor",[1,0.65,0]];
        _color = [_vipcolor select 0,_vipcolor select 1,_vipcolor select 2,1];
        _uid = _uid + " [VIP]";
    };
      
    if (_player getVariable ["speaking",false]) then {
        _color = [0, 0.5, 0.94, 1];
        _uid = _uid + " [SPEAKING]";
    };

    drawIcon3D ["", _color, _pos, 0, 1.3, 0, _uid, 2, 0.035, "PuristaMedium", "center"];
    nil
} count _nearObjects;

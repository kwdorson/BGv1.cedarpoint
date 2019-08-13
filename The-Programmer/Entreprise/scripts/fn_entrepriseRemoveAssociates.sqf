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
_entreprise = player getVariable ["current_entreprise",objNull];
if (isNull _entreprise) exitWith {closeDialog 0; hint (["STR_NO_ENTERPRISE"] call max_entreprise_fnc_localize)};
if ((_entreprise getVariable ["entreprise_pdg_pid",""]) != (getPlayerUID player)) exitWith {[] call max_entreprise_fnc_memberEntrepriseMenu;};
if ((lbCurSel 5453) isEqualTo -1) exitWith {hint (["STR_BAD_SELECTION_PLAYER"] call max_entreprise_fnc_localize)};
_player = lbData[5453,(lbCurSel 5453)];
_player = call compile format ["%1",_player];
_pid = _player select 0;
_name = _player select 1;

_members = _entreprise getVariable ["entreprise_members",[]];
_index = -1;
_rank = 0;
_data = [];

if ((count _members) > 0) then {
    {
        if (_pid == (_x select 0)) exitWith {
            _index = _forEachIndex;
            _rank = (_x select 2);
            _data = _x;
        };
    } forEach _members;
};

if (_index == -1) exitWith {};
if (_pid == (getPlayerUID player)) exitWith {hint (["STR_CANT_DEMOTE_YOURSELF"] call max_entreprise_fnc_localize)};
if (_rank == 0) exitWith {hint (["STR_CANT_DEMOTE"] call max_entreprise_fnc_localize)};

_fn_findPlayerByPID = {
    {
        if (_this isEqualTo (getPlayerUID _x)) exitWith {
            _x;
        };
        objNull
    } foreach playableUnits;
};

_player = (_data select 0) call _fn_findPlayerByPID;

if !(isNull _player) then {[player,false,_entreprise] remoteExec ["max_entreprise_fnc_updateRank",_player];};

_members set [_index,[_pid,_name,0]];
_entreprise setVariable ["entreprise_members",_members,true];
[(_entreprise getVariable ["entreprise_id",0]),1,(_entreprise getVariable ["entreprise_members",[]])] remoteExecCall ["max_entreprise_fnc_updateEntreprise",2];

hint format [(["STR_REMOVE_ASSOCIATE"] call max_entreprise_fnc_localize),_name];

[] call max_entreprise_fnc_editEntrepriseMenu;
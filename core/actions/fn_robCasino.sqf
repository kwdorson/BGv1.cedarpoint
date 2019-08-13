#include "..\..\script_macros.hpp"
/*
    File:   fn_RobCasino.sqf
    Author: MrKraken

    Description:

    Modified by: Shadow


*/
private ["_robber","_shop","_kassa","_ui","_pgText","_progress","_cP","_rip","_action"];

_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_cops = (west countSide playableUnits);

if(_cops < 2) exitWith {["You cannot rob this shop, 2 or more police need to be on",false,"slow"] call life_fnc_notificationSystem;};
if(side _robber !=civilian) exitWith {hint "You need to be a civilian to rob this shop.";};
if(_robber distance _shop > 3) exitWith {hint "You need to stay within 3m to rob this shop";};
if (vehicle player !=_robber) exitWith {hint "You need to be out of your vehicle first!";};

if !(alive _robber) exitWith {};
if(!([false,"codeCracker",1] call life_fnc_handleInv)) exitWith { ["You dont have a code Cracker",false,"slow"] call life_fnc_notificationSystem; };

_rip = true;
_kassa = 150000 + round(random 30000);
_shop removeAction _action;
_chance = random(50);  // change this to a lower number, if you want the chance of getting money from the Robbery less.

if(_chance >=60) then {
[1,format["000 ALERT:\n\n%1 is being robbed by %2",_shop,_robber, name _robber]] remoteExec ["life_fnc_broadcast",west]
};

disableSerialization;
5 cutRsc ["life_progress", "PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbing Shop, stay close (3m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
    while{true} do
        {
            sleep 0.85;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format ["Robbing Shop, stay close (3m)  (%1%2)...",round(_cP * 100), "%"];

             if (LIFE_SETTINGS(getNumber,"robberyMarkers") isEqualTo 1) then {
                _marker = createMarker ["Marker200", _shop];
                "Marker200" setMarkerColor "ColorRed";
                "Marker200" setMarkerText "ATTENTION: ROBBERY IN PROGRESS!!!";
                "Marker200" setMarkerType "mil_warning";
                };

            if(_cP >=1) exitWith {};
            if(_robber distance _shop > 3.5) exitWith{};
            if!(alive _robber) exitWith {};
        };

        if(_robber getVariable "restrained") exitWith {_rip = false; hint "You have been restrained!!";};      //Player got arrested, or restrained by another player!
        if(life_istazed) exitWith {_rip = false; hint "You were tazed!";};                                     //Player was tazed
        if!(alive _robber) exitWith {_rip = false;};

        if(_robber distance _shop > 3.5) exitWith {
        hint "You need to stay within 3m to rob this shop! Cash register is now locked, and police have been notified!";
        5 cutText ["","PLAIN"];
        [1,format["%1 attempted to rob %2!",_robber,name _robber, _shop]] remoteExec ["life_fnc_broadcast",west];
        [getPlayerUID _robber, _robber getVariable ["realname",name _robber], "211"] remoteExecCall ["life_fnc_wantedAdd", RSERV];
        };
        5 cutText ["","PLAIN"];

        titleText[format["You managed to steal %1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText], "PLAIN"];
        life_cash = life_cash + _kassa;
        deleteMarker "Marker200";
        _rip = false;
        life_use_atm = false;
        playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _robber];
        sleep 25;
        [1, format["Takistan News Corp: The Casino was robbed for a total of $%2",_shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", civilian];
        sleep ((LIFE_SETTINGS(getNumber,"noatm_timer")) * 60);
        life_use_atm = false;
        if!(alive _robber) exitWith {};
        [getPlayerUID _robber, _robber getVariable ["realname",name _robber], "211"] remoteExecCall ["life_fnc_wantedAdd", RSERV];
        call SOCK_fnc_updatePartial;
        };
sleep 300; //5 Minutes
_action = _shop addAction["Rob Shop",life_fnc_robShops,civilian];
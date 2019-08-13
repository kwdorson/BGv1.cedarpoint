/*
    Repentz to add stuff if name in steam includes ours
*/
private _result = profileNameSteam find "Atlantarp.com";

if (_result != -1) then {
    ["You have recieved experience for having Britanniagaming.co.uk in your steam name!",false,"slow"] call life_fnc_notificationSystem;
    ["atlanta"] spawn mav_ttm_fnc_addExp;
} else {
    ["Just a reminder, if you have Britanniagaming.co.uk in your steam name, you will recieve experience every paycheck!",false,"slow"] call life_fnc_notificationSystem;
}

/*
 File: fn_notificationSystem.sqf
 Date: 2016-07-23 18:15:17
 Author: Patrick "Lucian" Schmidt
 Modified by: blackfisch
 Description:
 Arguments:
 0: Text <STRING>
 1: Type <BOOLEAN>
 2: Speed <STRING>
*/
params[
 "_text",
 ["_error",false,[false]],
 ["_speed","",[""]]
];
if (isServer || !hasInterface) exitWith {};
//RE ENABLE ASAP
disableSerialization;
_display = finddisplay 46;

playSound "HintExpand";

private _headerColor = if (_error) then {
 [0,0.5,0.82,1];
} else {
 [0,0.5,0.82,1];
};
if (_text isEqualType "") then {
 _text = parseText _text;
};
private _Header = _display ctrlCreate ["RscText", -1];
	_Header ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.164 * safezoneH + safezoneY, 0.2 * safezoneW, 0.007 * safezoneH];
	_Header ctrlSetBackgroundColor _headerColor;
	_Header ctrlSetFade 1;
	_Header ctrlCommit 0;
	_Header ctrlSetFade 0;
	_Header ctrlCommit 0.4;
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
	_TextField ctrlSetStructuredText _text;
	_TextField ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.171 * safezoneH + safezoneY,0.2 * safezoneW, 0.5];
	_TextField ctrlCommit 0;
	_TextField ctrlSetPosition [0.795 * safezoneW + safezoneX, 0.171 * safezoneH + safezoneY,0.2 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
	_TextField ctrlSetBackgroundColor [0,0,0,0.75];
	_TextField ctrlSetFade 1;
	_TextField ctrlCommit 0;
	_TextField ctrlSetFade 0;
	_TextField ctrlCommit 0.4;
	[_TextField,_Header,_speed] spawn {
	disableSerialization;
	if (_this select 2 isEqualTo "fast") then {
	uiSleep 5;
	} else {
	uiSleep 15;
	};
	private _TextField = _this select 0;
	private _Header = _this select 1;
	_TextField ctrlSetFade 1;
	_TextField ctrlCommit 0.3;
	_Header ctrlSetFade 1;
	_Header ctrlCommit 0.3;
	uiSleep 0.3;
	ctrlDelete _Header;
	ctrlDelete _TextField;
	};
	private _posText = (ctrlPosition (_TextField)) select 1;
	private _posHeader = (ctrlPosition (_Header)) select 1;
	private _textHigh = (ctrlPosition (_TextField)) select 3;
	if(isNil{life_open_notifications}) then {life_open_notifications = [];};
	if (count life_open_notifications > 0) then {
	private _activeNotifications = 0;
	{
	private _ctrlHeader = _x select 0;
	private _ctrlText = _x select 1;
	if (!isNull _ctrlHeader && !isNull _ctrlText) then {
		_ctrlHeader ctrlSetPosition [0.795 * safezoneW + safezoneX, (_posHeader + _textHigh + 1.5*(0.011 * safezoneH))];
		_ctrlText ctrlSetPosition [0.795 * safezoneW + safezoneX, (_posText + _textHigh + 1.5*(0.011 * safezoneH))];
		_ctrlHeader ctrlCommit 0.25;
		_ctrlText ctrlCommit 0.25;
		_posText = (_posText + _textHigh + 1.5*(0.011 * safezoneH));
		_posHeader = (_posHeader + _textHigh + 1.5*(0.011 * safezoneH));
		_textHigh = (ctrlPosition (_ctrlText)) select 3;
	if (_activeNotifications > 3) then {
		_ctrlText ctrlSetFade 1;
		_ctrlHeader ctrlSetFade 1;
		_ctrlText ctrlCommit 0.2;
		_ctrlHeader ctrlCommit 0.2;
	};
	_activeNotifications = _activeNotifications + 1;
	};
	} forEach life_open_notifications;
	};
life_open_notifications = ([[_Header,_TextField]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)}; // Add the Element to the Front of the Array and remove the deleted Arrays

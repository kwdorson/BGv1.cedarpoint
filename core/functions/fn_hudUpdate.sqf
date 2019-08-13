#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};

LIFEctrl(1) progressSetPosition (1 - (damage player));
LIFEctrl(2) progressSetPosition (life_hunger / 100);
LIFEctrl(3) progressSetPosition (life_thirst / 100);

LIFEctrl(4) ctrlSetText format["%1%2",round((1-(getDammage player))*100),"%"];
LIFEctrl(5) ctrlSetText format["%1%2",(life_hunger),"%"];
LIFEctrl(6) ctrlSetText format["%1%2",(life_thirst),"%"];

_text = ""; 
_color = [];
switch (missionNameSpace getVariable ["ThreatLevel",0]) do { 
	case 0: {
		_text = "CODE GREEN";
		_color = [0.063,0.776,0,1];
	}; 
	case 1: {
		_text = "CODE AMBER";
		_color = [0.776,0.424,0,1];
	}; 
	case 2: {
		_text = "CODE RED";
		_color = [0.776,0,0,1];
	}; 
	case 3: {
		_text = "MARTIAL LAW";
		_color = [0.569,0,0,1];
	}; 
};

LIFEctrl(1251) ctrlSetText _text;
LIFEctrl(1251) ctrlSetTextColor _color;
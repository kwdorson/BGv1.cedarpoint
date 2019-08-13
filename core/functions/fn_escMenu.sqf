#include "..\..\script_macros.hpp"

private ["_linkToIconsVar","_iconsPath","_display","_controlDefine","_safeZone1","_safeZone2"];

_safeZone1 = (1 *(((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX));
_safeZone2 = (15 *(((safezoneW / safezoneH) min 1.2) / 40));

_display = findDisplay 49;

	{
		_controlDefine = _display ctrlCreate ["RscStructuredText",-1];
		_controlDefine ctrlSetStructuredText parseText format [_iconsPath,_x select 0,_x select 1];
		_controlDefine ctrlSetTooltip (_x select 2);
		_controlDefine ctrlSetTooltipColorShade [0,0,0,0.6];
		_controlDefine ctrlSetPosition [((_safeZone1 + (1.05*_safeZone2))) + ((3/4*ctrltextHeight _controlDefine) * _forEachindex),(safezoney + safezoneh) - 
			(1.75*ctrltextHeight _controlDefine),3/4*ctrltextHeight _controlDefine,ctrltextHeight _controlDefine];
		
		_controlDefine ctrlcommit 0;
	} 

forEach _linkToIconsVar;
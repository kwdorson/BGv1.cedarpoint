/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !(params [
	["_container", objNull, [objNull]],
	["_item", "", [""]],
	["_itemType", "", [""]],
	["_itemCategory", "", [""]]
]) exitWith {false};

switch _itemType do {
	case "Weapon": {
		_container addWeaponCargoGlobal [_item, 1];
	};
	case "Mine";
	case "Magazine": {
		_container addMagazineCargoGlobal [_item, 1];
	};
	default {
		if (_itemCategory isEqualTo "Backpack") then {
			_container addBackpackCargoGlobal [_item, 1];
		} else {
			_container addItemCargoGlobal [_item, 1];
		};
	};
};

true
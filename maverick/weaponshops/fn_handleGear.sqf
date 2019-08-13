/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

scopeName "handleGear";

if !(params [
	["_item", "", [""]],
	["_override", false, [false]]
]) exitWith {false};

(_item call BIS_fnc_itemType) params ["_itemType", "_itemCategory"];

if ([_item, _itemType, _itemCategory, _override] call MAV_shop_fnc_hasSpace) then {
	([_item, _itemType, _itemCategory] call MAV_shop_fnc_addGear) breakOut "handleGear";
};

if (player canAddItemToUniform _item) then {
	([uniformContainer player, _item, _itemType, _itemCategory] call MAV_shop_fnc_containerAdd) breakOut "handleGear";
};

if (player canAddItemToVest _item) then {
	([vestContainer player, _item, _itemType, _itemCategory] call MAV_shop_fnc_containerAdd) breakOut "handleGear";
};

if (player canAddItemToBackpack _item) then {
	([backpackContainer player, _item, _itemType, _itemCategory] call MAV_shop_fnc_containerAdd) breakOut "handleGear";
};

false
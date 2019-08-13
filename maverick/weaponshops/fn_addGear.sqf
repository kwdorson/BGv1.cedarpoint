/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !(params [
	["_item", "", [""]],
	["_itemType", "", [""]],
	["_itemCategory", "", [""]]
]) exitWith {false};

private _return = false;

try {
	private _itemLower = toLower _item;

	if (_itemType isEqualTo "Magazine") then {
		{
			if (_itemLower in ([_x param [1], true] call MAV_shop_fnc_weaponCompatibleItems)) then {
				switch (_x param [0]) do {
					case "primary": {
						player addPrimaryWeaponItem _item;
						throw true;
					};
					case "secondary": {
						player addSecondaryWeaponItem _item;
						throw true;
					};
					case "handgun": {
						player addHandgunItem _item;
						throw true;
					};
				};
			};
		} forEach ([
			["primary", primaryWeapon player, primaryWeaponMagazine player],
			["secondary", secondaryWeapon player, secondaryWeaponMagazine player],
			["handgun", handgunWeapon player, handgunMagazine player]
		] select {!(_x param [1] isEqualTo "") && {_x param [2] isEqualTo []}});
	} else {
		switch _itemCategory do {
			case "AssaultRifle";
			case "MachineGun";
			case "Rifle";
			case "SniperRifle";
			case "SubmachineGun"; {
				removeAllPrimaryWeaponItems player;
				player addWeaponGlobal _item;
				throw true;
			};
			case "Binocular";
			case "Handgun";
			case "LaserDesignator";
			case "RocketLauncher";
			case "MissileLauncher";
			case "Throw": {
				player addWeaponGlobal _item;
				throw true;
			};
			case "GPS";
			case "Map";
			case "Radio";
			case "UAVTerminal";
			case "Watch";
			case "Compass";
			case "NVGoggles";
			case "Glasses": {
				player linkItem _item;
				throw true;
			};
			case "Headgear": {
				player addHeadgear _item;
				throw true
			};
			case "Backpack": {
				if !(backpack player isEqualTo "") then {
					private _packItems = backpackItems player;
					clearAllItemsFromBackpack player;
					removeBackpack player;
					player addBackpackGlobal _item;

					{
						private _a = _x;
						if !(player canAddItemToBackpack _a) exitWith {};
						player addItemToBackpack _a;
						nil
					} count _packItems;

					throw true
				} else {
					player addBackpackGlobal _item;
					throw true
				};
			};
			case "Uniform": {
				if !(uniform player isEqualTo "") then {
					private _packItems = uniformItems player;
					removeUniform player;
					player forceAddUniform _item;

					{
						private _a = _x;
						if !(player canAddItemToUniform _a) exitWith {};
						player addItemToUniform _a;
						nil
					} count _packItems;

					throw true
				} else {
					player forceAddUniform _item;
					throw true
				};
			};
			case "Vest": {
				if !(vest player isEqualTo "") then {
					private _packItems = vestItems player;
					removeVest player;
					player addVest _item;

					{
						private _a = _x;
						if !(player canAddItemToVest _a) exitWith {};
						player addItemToVest _a;
						nil
					} count _packItems;

					throw true
				} else {
					player addVest _item;
					throw true
				};
			};
			case "AccessorySights";
			case "AccessoryPointer";
			case "AccessoryMuzzle";
			case "AccessoryBipod": {
				{
					if (_itemLower in ([_x param [1], false] call MAV_shop_fnc_weaponCompatibleItems)) then {
						switch (_x param [0]) do {
							case "primary": {player addPrimaryWeaponItem _item; throw true;};
							case "secondary": {player addSecondaryWeaponItem _item; throw true;};
							case "handgun": {player addHandgunItem _item; throw true;};
						};
					};
				} forEach ([
					["primary", primaryWeapon player],
					["secondary", secondaryWeapon player],
					["handgun", handgunWeapon player]
				] select {!(_x param [1] isEqualTo "")});
			};
		};
	};
} catch {
	_return = _exception;
};

_return
/*
	Strip search 
	
	fn_stripSearch.sqf
*/
private["_hgItems","_holder","_items","_pwItems","_safeItems","_swItems","_weps"];

titleText["Your items have been removed.","PLAIN"];
[player,"patdown1"] spawn life_fnc_nearestSound;

_safeItems = ["FirstAidKit","ItemMap","ItemCompass","ItemWatch","Binocular"];
_weps = [];
_all = [];

_pwItems = primaryWeaponItems player;
_swItems = secondaryWeaponItems player;
_hgitems = handGunItems player;
_assItems = assignedItems player;
_invItems = items player;
_weapons = weapons player;

{
	_temp = _x;
	{
		if(!(_x in _weapons) && !(_x in _safeItems)) then
		{
			_all pushBack _x;
			
		};
	}forEach _temp;
} forEach [_assItems,_invItems];

_mags = magazinesAmmoFull player;
{player removeMagazine _x} foreach (magazines player);

if(primaryWeapon player != "") then
{
	_weps pushBack (primaryWeapon player);
	player removeWeapon (primaryWeapon player);
};
		
if(secondaryWeapon player != "") then
{
	_weps pushBack (secondaryWeapon player);
	player removeWeapon (secondaryWeapon player);
};
		
if(handgunWeapon player != "") then
{
	_weps pushBack (handgunWeapon player);
	player removeWeapon (handgunWeapon player);
};

{
	_items = _x;
	{
		player unassignItem _x;
		player removeItem _x;
	} forEach _items;
} forEach [_hgItems, _pwItems, _swItems, _all];

{
	if (!(_x in _safeItems)) then
	{
		player removeItem _x;
		_weps pushBack _x;
	};
} forEach (weapons player);

_holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE" ];
 
{
	_holder addWeaponCargoGlobal [_x,1];
} forEach _weps;

{
	_holder addMagazineCargoGlobal [_x select 0,1];
} forEach _mags;

{
	_items = _x;
	{
		_holder addItemCargoGlobal [_x,1];
	} forEach _items;
} forEach [_hgItems, _pwItems, _swItems, _all];

[] call life_fnc_saveGear;
/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !(params [
    ["_item", "", [""]],
    ["_magazine", true, [false]]
]) exitWith {[]};

if (_item isEqualTo "") exitWith {[]};

private _cfg = configFile >> "CfgWeapons" >> _item;

if !(isClass _cfg) exitWith {[]};

private _items = [];

if _magazine then {
    _items append getArray (_cfg >> "magazines");
    {
        _items append getArray (_cfg >> _x >> "magazines");
    } count (getArray (_cfg >> "muzzles") select {!(_x isEqualTo "this")});
};

{
    _items append getArray (_cfg >> "weaponSlotsInfo" >> _x >> "compatibleItems");
    if (isClass (_cfg >> "weaponSlotsInfo" >> _x >> "compatibleItems")) then {
        private _secondMethodDefinedAttachments = configProperties [_cfg >> "weaponSlotsInfo" >> _x >> "compatibleItems", "((getNumber _x) == 1)", true];
        {
            private _index = _items pushBackUnique (configName _x);
        } forEach _secondMethodDefinedAttachments;
    };
} count (["CowsSlot", "PointerSlot", "MuzzleSlot", "UnderBarrelSlot", "asdg_OpticRail_SMAAssault", "asdg_Underbarrel", "asdg_FrontSideRail_SMAAssault"] select {isClass (_cfg >> "weaponSlotsInfo" >> _x)});


_items apply {toLower _x}
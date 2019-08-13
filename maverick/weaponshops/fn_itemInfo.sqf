/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
	["_className", "", [""]]
];

if (_className isEqualTo "") exitWith {[]};

private _return = [];

try {
	private _cfgArray = ["CfgMagazines", "CfgWeapons", "CfgVehicles", "CfgGlasses"] select {isClass (configFile >> _x >> _className)};
	if (_cfgArray isEqualTo [] OR {count _cfgArray > 1}) throw [];
	if !(_cfgArray params [["_config", "", [""]]]) throw [];
	private _cfg = configFile >> _config >> _className;
	if (isClass _cfg) throw ([getText (_cfg >> "displayName"), getText (_cfg >> "picture"), getText (_cfg >> "descriptionshort")]);
} catch {
	_return = _exception;
};

_return
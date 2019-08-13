/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description:
    Loads the civs out with the default gear, with randomized clothing.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player addUniform (selectRandom _clothings);


// Check if the player has x perk
_NVGPerk = [life_currentExpPerks, "perk_spawnWith_NVG"] call mav_ttm_fnc_hasPerk;
_GPSPerk = [life_currentExpPerks, "perk_spawnWith_GPS"] call mav_ttm_fnc_hasPerk;
_FoodPerk = [life_currentExpPerks, "perk_spawnWith_FoodnWater"] call mav_ttm_fnc_hasPerk;
_BergenPerk = [life_currentExpPerks, "perk_spawnWith_Bergen"] call mav_ttm_fnc_hasPerk;
_PickaxePerk = [life_currentExpPerks, "perk_spawnWith_Pickaxe"] call mav_ttm_fnc_hasPerk;
_FAKPerk = [life_currentExpPerks, "perk_spawnWith_FAK"] call mav_ttm_fnc_hasPerk;
_ToolkitPerk = [life_currentExpPerks, "perk_spawnWith_Toolkit"] call mav_ttm_fnc_hasPerk;
_PistolPerk = [life_currentExpPerks, "perk_spawnWith_Pistol"] call mav_ttm_fnc_hasPerk;
_SnapgunPerk = [life_currentExpPerks, "perk_spawnWith_Snapgun"] call mav_ttm_fnc_hasPerk;


/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

/* Items dependent on perks */
if (_NVGPerk) then {
  player linkItem "NVGoggles";
};

if (_GPSPerk) then {
  player linkItem "ItemGPS";
};


if (_FAKPerk) then {
  [true,"bandage",1] call life_fnc_handleInv;
};

if (_PistolPerk) then {
  player addMagazine "6Rnd_45ACP_Cylinder";
  player addWeapon "hgun_Pistol_heavy_02_F";
  player addMagazine "6Rnd_45ACP_Cylinder";
  player addMagazine "6Rnd_45ACP_Cylinder";
};

if (_FoodPerk) then {
  [true,"waterBottle",3] call life_fnc_handleInv;
  [true,"tbacon",3] call life_fnc_handleInv;
};

if (_PickaxePerk) then {
  [true,"pickaxe",1] call life_fnc_handleInv;
};

if (_ToolkitPerk) then {
  [true,"toolkit",1] call life_fnc_handleInv;
};

if (_BergenPerk) then {
  player addBackpack "B_Bergen_mcamo_F";
};

if (_SnapgunPerk) then {
  [true,"snapgun",1] call life_fnc_handleInv;
};




[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;

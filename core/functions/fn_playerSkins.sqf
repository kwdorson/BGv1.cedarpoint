#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {
    if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
            player setObjectTextureGlobal [0, "images\textures\Uniform\Civ\prisoner_uniform.jpg"];
        };
    };

    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_1.jpg"];
            };
        };
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 2) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_2.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 3) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_3.jpg"];
            };
        };
        if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 4) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_4.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 5) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_5.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 6) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_6.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 7) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_7.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 8) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_8.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 9) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_9.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 10) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_10.jpg"];
            };
        };
         if (uniform player isEqualTo "U_Rangemaster") then {
                if (FETCH_CONST(life_coplevel) >= 11) then {
                    player setObjectTextureGlobal [0, "images\Textures\Uniform\Cop\cop_uniform_11.jpg"];
            };
        };
        if( backpack player == "B_Carryall_cbr") then {
            (backpackContainer player) setObjectTextureGlobal [0,""];
        };
    };

    case independent: {
		if (backpack player == "B_Kitbag_mcamo_Eng") then { // bag
			backpackContainer player setObjectTextureGlobal [0, "images\textures\Uniform\Med\B_Kitbag_mcamo_Eng.jpg"];
		};
        if (uniform player isEqualTo "U_C_WorkerCoveralls") then {
             player setObjectTextureGlobal [0, "images\textures\Uniform\Med\paramedic.paa"];
        };
    };
};

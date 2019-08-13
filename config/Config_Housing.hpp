#define true 1
#define false 0

/*
    price - Cost of the building
    numberCrates - Allowed number of crates
    restrictedPos[] - Same as the old fn_getBuildingPositions. A list of restricted building positions (i.e, to stop spawning outside, or by windows etc)
        default: {}
    canGarage - True if the building can be used as a garage (need to buy ontop)
        default: false
    garageSpawnPos[] - worldToModel position to spawn vehicles, leave {} if canGarage is false.
        default: {}
    garageSpawnDir - Offset to garage direction to spawn at (+-90 etc). It will be used in the manner: getDir _garage + spawnDir
        default: 0
    garageBlacklists[] - List of blacklisted houses for buying garages
        default: {}
*/

class Housing {

    class Cedarpoint {
		
		class Land_i_House_Big_02_V1_F {
            price = 130000;
            numberCrates = 3;
            restrictedPos[] = {0,1,2,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,3.5};
            furniture = 34;
        };
        
        class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
        class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};
		class xcam_i_House_Big_02_V1_F : Land_i_House_Big_02_V1_F{};
		class xcam_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
		class xcam_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

        class Land_i_House_Big_01_V1_F {
            price = 150000;
            numberCrates = 4;
            restrictedPos[] = {2,3};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {0,-2,3.8};
            furniture = 34;
        };

        class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
        class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};
		class xcam_i_House_Big_01_V1_F : Land_i_House_Big_01_V1_F{};
		class xcam_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
		class xcam_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};

        class Land_i_House_Small_01_V1_F {
            price = 95000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1.5,0,2};
            furniture = 20;
        };

        class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
        class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};
		class xcam_i_House_Small_01_V1_F : Land_i_House_Small_01_V1_F{};
		class xcam_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
		class xcam_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

        class Land_i_House_Small_02_V1_F {
            price = 95000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,2.4};
            furniture = 20;
        };

        class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
        class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};
		class xcam_i_House_Small_02_V1_F : Land_i_House_Small_02_V1_F{};
		class xcam_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
		class xcam_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

        class Land_i_House_Small_03_V1_F {
            price = 85000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-3.3,1,2.5};
            furniture = 20;
        };

        class Land_i_House_Small_03_V3_F : Land_i_House_Small_03_V1_F{};
		class xcam_i_House_Small_03_V1_F : Land_i_House_Small_03_V1_F{};

        class Land_i_Stone_HouseSmall_V1_F {
            price = 85000;
            numberCrates = 1;
            restrictedPos[] = {0,1,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {0.90,2.3,4};
            furniture = 20;
        };

        class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
        class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};

        class Land_i_House_Big_02_b_blue_F {
            price = 145000;
            numberCrates = 2;
            restrictedPos[] = {0,1,2,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,3.5};
            furniture = 24;
        };

        class Land_i_House_Big_02_b_pink_F : Land_i_House_Big_02_b_blue_F{};
        class Land_i_House_Big_02_b_whiteblue_F : Land_i_House_Big_02_b_blue_F{};
        class Land_i_House_Big_02_b_white_F : Land_i_House_Big_02_b_blue_F{};
        class Land_i_House_Big_02_b_brown_F : Land_i_House_Big_02_b_blue_F{};
        class Land_i_House_Big_02_b_yellow_F : Land_i_House_Big_02_b_blue_F{};


        ///biggest
        class Land_i_House_Big_01_b_blue_F {
            price = 300000;
            numberCrates = 3;
            restrictedPos[] = {0,1,2,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,3.5};
            furniture = 32;
        };

            class Land_i_House_Big_01_b_pink_F : Land_i_House_Big_01_b_blue_F{};
            class Land_i_House_Big_01_b_whiteblue_F : Land_i_House_Big_01_b_blue_F{};
            class Land_i_House_Big_01_b_white_F : Land_i_House_Big_01_b_blue_F{};
            class Land_i_House_Big_01_b_brown_F : Land_i_House_Big_01_b_blue_F{};
            class Land_i_House_Big_01_b_yellow_F : Land_i_House_Big_01_b_blue_F{};


        //small
        class Land_i_House_Small_01_b_blue_F {
            price = 100000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1.5,0,2};
            furniture = 20;
        };

            class Land_i_House_Small_01_b_pink_F : Land_i_House_Small_01_b_blue_F{};
            class Land_i_House_Small_01_b_whiteblue_F : Land_i_House_Small_01_b_blue_F{};
            class Land_i_House_Small_01_b_white_F : Land_i_House_Small_01_b_blue_F{};
            class Land_i_House_Small_01_b_brown_F : Land_i_House_Small_01_b_blue_F{};
            class Land_i_House_Small_01_b_yellow_F : Land_i_House_Small_01_b_blue_F{};
        

        //small
        class Land_i_House_Small_02_b_blue_F {
            price = 90000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,2.4};
            furniture = 20;
        };

            class Land_i_House_Small_02_b_pink_F : Land_i_House_Small_02_b_blue_F{};
            class Land_i_House_Small_02_b_whiteblue_F : Land_i_House_Small_02_b_blue_F{};
            class Land_i_House_Small_02_b_white_F : Land_i_House_Small_02_b_blue_F{};
            class Land_i_House_Small_02_b_brown_F : Land_i_House_Small_02_b_blue_F{};
            class Land_i_House_Small_02_b_yellow_F : Land_i_House_Small_02_b_blue_F{};

        class Land_i_House_Small_02_c_blue_F {
            price = 90000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {2,0,2.4};
            furniture = 20;
        };

            class Land_i_House_Small_02_c_pink_F : Land_i_House_Small_02_c_blue_F{};
            class Land_i_House_Small_02_c_whiteblue_F : Land_i_House_Small_02_c_blue_F{};
            class Land_i_House_Small_02_c_white_F : Land_i_House_Small_02_c_blue_F{};
            class Land_i_House_Small_02_c_brown_F : Land_i_House_Small_02_c_blue_F{};
            class Land_i_House_Small_02_c_yellow_F : Land_i_House_Small_02_c_blue_F{};

	// Customm
        class Land_i_Addon_02_V1_F {
            price = 25000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class xcam_i_Addon_02_V1_F {
            price = 25000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_HouseA {
            price = 140050;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_HouseB {
            price = 140050;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };		
		
		class Land_HouseDoubleAL {
            price = 150000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_HouseC_R {
            price = 150000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_Home6b_DED_Home6b_01_F {
            price = 150000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_Home3r_DED_Home3r_01_F {
            price = 150000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_Ranch_DED_Ranch_01_F {
            price = 150000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_Ranch_DED_Ranch_02_F {
            price = 150000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_HouseA1_L {
            price = 180050;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_HouseC1_L {
            price = 180050;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_Slum_House01_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_Slum_House03_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class Land_Slum_House02_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class Land_cargo_house_slum_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class xcam_Slum_House01_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class xcam_Slum_House03_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };

        class xcam_Slum_House02_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-2.35,1,2.8};
        };
		
		class xcam_cargo_house_slum_F {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_e76_us_house02 {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_e76_us_house01 {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_e76_us_house01a {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_e76_us_house02a {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
		
		class Land_e76_us_house03 {
            price = 150000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
            garageBlacklists[] = {};
            lightPos[] = {-1,2,2};
        };
    };
};

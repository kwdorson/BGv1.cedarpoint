/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the weaponshop

class maverick_weaponshop_cfg {

	cashVar = "life_houseProtect";								//--- Cash Variable
	cashSymbol = "$"; 									//--- Currency Symbol
	rotationSpeed = 2; 									//--- Rotation speed for item in preview (1 - 10)
	saveFunction = "[] call SOCK_fnc_updateRequest"; 	//--- Function to save gear etc. once items are purchased

	class localization {
		//--- localization for hints etc.
		msgParamEmpty =						"Shop Parameter is empty!";
		msgInVehicle =						"You cannot be in a Vehicle!";
		msgShopExists =						"Shop doesn't Exist!";
		msgCondition =						"Not permitted to access this Shop!";
		msgCashOnHand =						"Cash on Hand - %1%2";
		msgCartTotal =						"Your Cart - %1%2";
		msgInfoTooltip =					"--> HOLD YOUR LEFT MOUSE BUTTON DOWN WHILE MOVING MOUSE TO ROTATE WEAPON.\n--> DOUBLE CLICK ON AN ITEM IN THE CART TO REMOVE IT.\n--> USE THE 'OVERRIDE GEAR' CHECKBOX TO REPLACE WEAPONS ON HAND WITH PURCHASED WEAPONS.";
		msgInfoTooltip2 = 					"--> DOUBLE CLICK ON AN ITEM IN THE CART TO REMOVE IT.\n--> USE THE 'OVERRIDE GEAR' CHECKBOX TO REPLACE WEAPONS ON HAND WITH PURCHASED WEAPONS.";
		msgEmptyShop = 						"Nothing Found...";
		msgInfoText	=						"<t color='#FFFFFF'>Price:</t> <t color='%1'>%3%2</t>";
		msgCartFull	=						"Cart is Full";
		msgCartEmpty =						"Cart is Empty";
		msgNotEnoughCash =					"Not enough Cash for this Transaction";
		msgOverrideAlert =					"Use the override feature to override gear!";
		msgTransactionComplete =			"Purchase completed for %1%2";
		msgNotEnoughSpace =				 	"You didn't have enough space for all the items. You however only paid for those you had space for!";
		msgClear =							"Clear";
		msgSearch =							"Search";

		//--- localization for dialogs
		#define dialogTabWeapon				"Weapon"
		#define dialogTabMagazines			"Magazines"
		#define dialogTabAttachments		"Attachments"
		#define dialogTabOther				"Other"
		#define dialogAddBtn				"Add"
		#define dialogOverrideTooltip		"Override Gear"
		#define dialogCompleteBtn			"Complete"
		#define dialogCloseBtn 				"Close"
	};

	class shops {
		class gun {
			title = "Gun Store"; //--- Title of Shop
			condition = "license_civ_gun"; //--- Condition to meet to access shop
			simple = 0; //--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; //--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name
				//Handguns
				{"nil", 0, "", "---Handguns---"},
				{"hlc_Pistol_M11", 18000, "license_civ_gun", ""},
				{"hlc_pistol_Mk25",18000 , "license_civ_gun", ""},
				{"hlc_pistol_P226WestGerman", 18000, "license_civ_gun", ""},
				{"hlc_Pistol_P228", 18000, "license_civ_gun", ""},
				{"hlc_Pistol_M11A1", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P226US", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P226R", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P226R_357", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P226R_40", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P229R_Combat", 18000, "license_civ_gun", ""},
				{"hlc_Pistol_M11A1D", 18000, "license_civ_gun", ""},
				{"hlc_pistol_Mk25D", 18000, "license_civ_gun", ""},
				{"hlc_pistol_P239_40", 18000, "license_civ_gun", ""},
				{"RH_m9", 18000, "license_civ_gun", ""},
				{"RH_m9c", 18000, "license_civ_gun", ""},
				{"RH_python", 18000, "license_civ_gun", ""},
				{"RH_cz75", 18000, "license_civ_gun", ""},
				{"RH_deagle", 55000, "license_civ_gun", ""},
				{"RH_Deagleg", 55000, "license_civ_gun", ""},
				{"RH_fnp45t", 22000, "license_civ_gun", ""},
				{"RH_g17", 18000, "license_civ_gun", ""},
				{"RH_kimber", 18000, "license_civ_gun", ""},
				{"RH_kimber_nw", 18000, "license_civ_gun", ""},
				{"RH_mateba", 22000, "license_civ_gun", ""},
				{"RH_ttracker", 18000, "license_civ_gun", ""},
				{"RH_tt33", 18000, "license_civ_gun", ""},
				{"RH_uspm", 24000, "license_civ_gun", ""},
				//Rifle Guns
				{"nil", 0, "", "---Rifle Guns---"},
				{"hlc_rifle_M14dmr_Rail", 145000, "license_civ_rifle", ""},
				{"hlc_rifle_awcovert", 120000, "license_civ_rifle", ""}
			};
					
			magazines[] = {
					//Pistol Ammo
					{"hlc_13Rnd_9x19_B_P228", 250, "license_civ_gun", ""},
					{"hlc_15Rnd_9x19_B_P226", 250, "license_civ_gun", ""},
					{"hlc_12Rnd_357SIG_B_P226", 250, "license_civ_gun", ""},
					{"hlc_12Rnd_40SW_B_P226", 250, "license_civ_gun", ""},
					{"hlc_10Rnd_357SIG_B_P229", 250, "license_civ_gun", ""},
					{"hlc_8Rnd_40SW_B_P239", 250, "license_civ_gun", ""},
					{"RH_15Rnd_9x19_M9", 250, "license_civ_gun", ""},
					{"RH_6Rnd_357_Mag", 250, "license_civ_gun", ""},
					{"RH_16Rnd_9x19_CZ", 250, "license_civ_gun", ""},
					{"RH_7Rnd_50_AE", 500, "license_civ_gun", ""},
					{"RH_15Rnd_45cal_fnp", 250, "license_civ_gun", ""},
					{"RH_17Rnd_9x19_g17", 250, "license_civ_gun", ""},
					{"RH_7Rnd_45cal_m1911", 250, "license_civ_gun", ""},
					{"RH_6Rnd_44_Mag", 250, "license_civ_gun", ""},
					{"RH_6Rnd_45ACP_Mag", 250, "license_civ_gun", ""},
					{"RH_8Rnd_762_tt33", 250, "license_civ_gun", ""},
					{"RH_16Rnd_40cal_usp", 250, "license_civ_gun", ""},
					//Rifle Ammo
					{"hlc_20Rnd_762x51_B_M14", 2000, "license_civ_rifle", ""},
					{"hlc_5rnd_300WM_FMJ_AWM", 2000, "license_civ_rifle", ""}
				};
			
			attachments[] = {
					{"optic_KHS_old", 20000, "license_civ_rifle", ""}
				};

			items[] = {
					{"tf_microdagr", 250, "", ""},
					{"tf_fadak_5", 700, "", ""},
					{"FirstAidKit", 750, "", ""}
				};
			};
		
		class raven
		{
			title = "Gang Armament"; //--- Title of Shop
			condition = "";					 //--- Condition to meet to access shop
			simple = 0;							 //--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20;						 //--- Max Amount of Items in Shopping Cart
			weapons[] = {
					//--- item classname, price, condition, custom display name
					{"hgun_Rook40_F", 15000, "true", ""},
					{"hgun_Pistol_heavy_02_F", 15000, "true", ""},
					{"hgun_ACPC2_F", 15000, "true", ""}
				};
			magazines[] = {
					{"16Rnd_9x21_Mag", 10, "true", ""},
					{"6Rnd_45ACP_Cylinder", 10, "true", ""},
					{"9Rnd_45ACP_Mag", 10, "true", ""},
					{"30Rnd_9x21_Mag", 10, "true", ""}
				};
			attachments[] = {
					{"optic_ACO_grn_smg", 50, "", "Test Scope"},
					{"CUP_optic_CompM4", 50, "", "Test Scope"},
					{"optic_Arco_blk_F", 50, "", "Test Scope"},
					{"optic_ERCO_blk_F", 50, "", "Test Scope"}
				};
			items[] = {
					{"tf_microdagr", 50, "true", ""},
					{"tf_fadak_5", 50, "true", ""},
					{"Binocular", 50, "", "true"},
					{"NVGoggles", 100, "", "true"},			 //--- NV goggles won't be shown on preview
					{"U_O_GhillieSuit", 100, "true", ""} //--- Clothing can also be sold but isn't guaranteed to be previewed - just make sure override checkbox is used to override clothing on player
			};
		};
		
			
		class med_basic {
			title = "Medic Store"; //--- Title of Shop
			condition = "call life_mediclevel >= 1"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {};

			magazines[] = {};

			attachments[] = {};
			
			items[] = {
				{"tf_microdagr", 50, "call life_mediclevel >= 1", ""},
				{"tf_anprc152_1", 50, "call life_mediclevel >= 1", ""},
				{"Binocular", 50, "call life_mediclevel >= 1", ""},
				{"ItemMap", 50, "call life_mediclevel >= 1", ""},
				{"ItemCompass", 50, "call life_mediclevel >= 1", ""},
				{"ItemWatch", 50, "call life_mediclevel >= 1", ""},
				{"FirstAidKit", 50, "call life_mediclevel >= 1", ""},			
				{"NVGoggles", 100, "call life_mediclevel >= 1", ""} //--- Clothing can also be sold but isn't guaranteed to be previewed - just make sure override checkbox is used to override clothing on player
			};
		};
		
		class blackmarket {
			title = "Weapons"; //--- Title of Shop
			condition = "license_civ_rebel";
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name
				{"arifle_SDAR_F", 128000, "license_civ_rebel", "Underwater Rifle"},
				{"hlc_rifle_ak74", 178000, "license_civ_rebel", ""},
				{"hlc_rifle_akm", 350000, "license_civ_rebel", ""},	
				{"hlc_rifle_SLRchopmod", 220000, "license_civ_rebel", ""},
				{"hlc_rifle_falosw", 210000, "license_civ_rebel", ""},
				{"hlc_rifle_M1903A1_unertl", 180000, "license_civ_rebel", ""},
				{"hlc_rifle_ACR68_Squant", 145000, "license_civ_rebel", ""},
				{"hlc_rifle_SG550", 425000, "license_civ_rebel", ""},
				{"hlc_rifle_auga1carb_B", 220000, "license_civ_rebel", ""},
				{"hlc_rifle_G36C", 287000, "license_civ_rebel", ""},
				{"hlc_rifle_G36CMLIC", 287000, "license_civ_rebel", ""},
				{"hlc_rifle_g36KTac", 287000, "license_civ_rebel", ""},				
				{"hlc_rifle_awcovert_BL", 480000,"license_civ_rebel", ""},			
				{"hlc_rifle_awMagnum_OD_ghillie", 680000, "license_civ_rebel", ""},
				{"hlc_rifle_slr107u", 125000, "license_civ_rebel", ""},
				{"hlc_rifle_SG551LB", 320000, "license_civ_rebel", ""},
				{"hlc_rifle_SG551SB", 320000, "license_civ_rebel", ""},
				{"hlc_rifle_SG553SB", 320000, "license_civ_rebel", ""},
				{"hlc_m249_Squantoon", 1200000, "license_civ_rebel", ""}					
			};

			magazines[] = {
				{"hlc_30Rnd_545x39_B_AK", 1500, "license_civ_rebel", ""},
				{"hlc_20Rnd_762x51_B_fal", 7500, "license_civ_rebel", ""},			
				{"hlc_5rnd_3006_1903", 10000, "license_civ_rebel", ""},
				{"hlc_30Rnd_762x39_b_ak", 7500, "license_civ_rebel", ""},
				{"hlc_30rnd_556x45_EPR", 7500, "license_civ_rebel", ""},
				{"hlc_30rnd_68x43_FMJ", 7500, "license_civ_rebel", ""},
				{"hlc_30Rnd_556x45_EPR_sg550", 7500, "license_civ_rebel", ""},	
				{"hlc_50rnd_556x45_EPR", 48000, "license_civ_rebel", ""},					
				{"hlc_30Rnd_556x45_B_AUG", 7500, "license_civ_rebel", ""},
				{"hlc_5rnd_300WM_FMJ_AWM", 2000, "license_civ_rebel", ""},			
				{"29rnd_300BLK_STANAG", 1500, "license_civ_rebel", ""},
				{"hlc_30rnd_556x45_EPR_G36", 1500, "license_civ_rebel", ""},
				{"30Rnd_65x39_caseless_mag", 1500, "license_civ_rebel", ""},
				{"20Rnd_556x45_UW_mag", 7500, "license_civ_rebel", ""},
				{"RH_16Rnd_40cal_usp", 7500, "license_civ_rebel", ""},			
				{"hlc_10Rnd_762x51_B_fal", 7500, "license_civ_rebel", ""},
				{"hlc_200rnd_556x45_M_SAW", 48000, "license_civ_rebel", ""}				
			};

			attachments[] = {
				{"hlc_optic_kobra", 1000, "license_civ_rebel", ""},
				{"HLC_optic_DocterR", 1500, "license_civ_rebel", ""},
				{"HLC_Optic_PSO1", 5000, "license_civ_rebel", ""},
				{"HLC_Optic_1p29", 1000, "license_civ_rebel", ""},
				{"optic_ERCO_blk_F", 1000, "license_civ_rebel", ""},
				{"optic_Arco_blk_F", 1000, "license_civ_rebel", ""},
				{"hlc_optic_HensoldtZO_lo_Docter", 1500, "license_civ_rebel", ""},
				{"hlc_optic_HensoldtZO_Hi", 1500, "license_civ_rebel", ""},
				{"hlc_optic_HensoldtZO_lo_Docter_2D", 1500, "license_civ_rebel", ""},
				{"hlc_optic_ZF95Base", 1000, "license_civ_rebel", ""},
				{"hlc_optic_LeupoldM3A", 2500, "license_civ_rebel", ""},
				{"hlc_optic_VOMZ3d", 1000, "license_civ_rebel", ""},
				{"hlc_optic_suit", 1000, "license_civ_rebel", ""},
				{"hlc_optic_LRT_m14", 1000, "license_civ_rebel", ""},
				{"hlc_optic_FNSTANAG4X_550", 1000, "license_civ_rebel", ""},
				{"hlc_optic_ATACR", 1000, "license_civ_rebel", ""},	
				{"hlc_optic_HensoldtZO_Lo", 1000,  "license_civ_rebel", ""},
				{"HLC_Optic_G36dualoptic35x2d", 1000,  "license_civ_rebel", ""},
				{"HLC_Optic_G36dualoptic35x", 1000,  "license_civ_rebel", ""},
				{"hlc_muzzle_556NATO_rotexiiic_grey", 5000,  "license_civ_rebel", ""},
				{"optic_Holosight_blk_F", 1000,  "license_civ_rebel", ""},
				{"hlc_grip_SAW_Grip1", 2500,  "license_civ_rebel", ""}
			};
			
			items[] = {
				{"tf_microdagr", 100, "license_civ_rebel", ""},
				{"tf_anprc152_1", 100, "license_civ_rebel", ""},
				{"Binocular", 100, "license_civ_rebel", ""},
				{"ItemMap", 100, "license_civ_rebel", ""},
				{"ItemCompass", 100, "license_civ_rebel", ""},
				{"ItemWatch", 100, "license_civ_rebel", ""},
				{"FirstAidKit", 100, "license_civ_rebel", ""},			
				{"NVGoggles", 100, "license_civ_rebel", ""}
			};
		};
		
		class cop_basic {
			title = "Weapons"; //--- Title of Shop
			condition = "call life_coplevel >= 1"; 	//--- Condition to meet to access shop
			simple = 0; 			//--- Type of GUI 0-Weapon View 1-No Weapon View
			maxCart = 20; 			//--- Max Amount of Items in Shopping Cart

			weapons[] = {
				//--- item classname, price, condition, custom display name
				{"CSW_M26C", 0, "call life_coplevel >= 1", "M26C Taser"},
				{"RH_g19", 1000, "call life_coplevel >= 2", "Glock 19 (Lethal only)"},
				{"CSW_M870", 2500, "call life_coplevel >= 2", "Shotgun"},
				{"hlc_smg_mp5a3", 3000, "call life_coplevel >= 3", "MP5"},
				{"hlc_rifle_416C", 4000, "call life_coplevel >= 4", "M416C"},
				{"CSW_FN57", 1000, "call life_coplevel >= 5", "FN FiveSeven"}
			};

			magazines[] = {
				{"CSW_Taser_Probe_Mag", 0, "call life_coplevel >= 1", ""},
				{"CSW_M870_8Rnd_buck", 250, "call life_coplevel >= 3", ""},
				{"CSW_M870_8Rnd_slug", 250, "call life_coplevel >= 3", ""},
				{"CSW_M870_8Rnd_stun", 0, "call life_coplevel >= 3", ""},
				{"RH_19Rnd_9x19_g18", 250, "call life_coplevel >= 2", ""},
				{"CSW_M870_8Rnd_stun", 0, "call life_coplevel >= 2", ""},
				{"hlc_30Rnd_9x19_B_MP5", 250, "call life_coplevel >= 3", ""},
				{"CSW_20Rnd_57x28_SS198", 500, "call life_coplevel >= 3", ""},
				{"CSW_20Rnd_57x28_Sb193", 500, "call life_coplevel >= 3", ""},
				{"hlc_30rnd_556x45_EPR", 500, "call life_coplevel >= 3", ""}
			};

			attachments[] = {
				{"optic_Hamr", 250, "call life_coplevel >= 5", "Acog"},
				{"CSW_FN57_silencer2", 1000, "call life_coplevel >= 5", ""}, 
				{"HLC_optic_DocterR", 250, "call life_coplevel >= 3", ""}
			};
			
			items[] = {
				{"tf_microdagr", 100, "true", ""},
				{"tf_anprc152_1", 100, "true", ""},
				{"Binocular", 100, "true", ""},
				{"ItemMap", 100, "true", ""},
				{"ItemGPS", 100, "true", ""},
				{"ItemCompass", 100, "true", ""},
				{"ItemWatch", 100, "true", ""},
				{"FirstAidKit", 100, "true", ""},
				{"TRYK_balaclava_BLACK_NV", 100, "true", ""},				
				{"NVGoggles", 100, "true", ""} //--- Clothing can also be sold but isn't guaranteed to be previewed - just make sure override checkbox is used to override clothing on player
			};
		};
		// Add Seperate Shop or make alternate way of checking if player is ERT Certified
		
	};
};

#include "gui\weapon_gui_master.cpp"

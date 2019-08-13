/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
			//a3
            { "NONE", "Remove", 0, "" },
			{ "U_C_Scientist", "Radiation Suit", 45000, "" },
            { "NONE", "Remove Uniform", 0, "" },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, "" },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, "" },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, "" },
            { "U_C_Poloshirt_blue", "Poloshirt Blue / Monster", 250, "" },
            { "U_C_Poor_2", "Rag tagged clothes", 250, "" },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, "" },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, "" },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, "" },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, "" },
            { "U_OrestesBody", "Surfing On Land", 1100, "" },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, "" },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, "" },
            { "U_C_Man_casual_1_F", "Casual Wears", 250, "" },
            { "U_C_Man_casual_2_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "Casual Wears", 250, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 175, "" },
            { "U_C_Man_casual_2_F", "", 175, "" },
            { "U_C_Man_casual_3_F", "", 175, "" },
            { "U_C_Man_casual_1_F", "", 175, "" },
            { "U_C_Man_casual_5_F", "", 175, "" },
            { "U_C_Man_casual_6_F", "", 175, "" },
            { "U_I_C_Soldier_Bandit_4_F", "Slumdog Polo (Checkered)", 100, "" },
            { "U_I_C_Soldier_Bandit_1_F", "Slumdog Polo (Brown)", 100, "" },
            { "U_I_C_Soldier_Bandit_2_F", "", 2500, "" },
            { "U_C_Poor_1", "Begger tagged clothes", 175, "" },
            { "U_C_Poor_2", "Worn tagged clothes", 175, "" },
            { "U_OrestesBody", "Surfing On Land", 550, "" },
            { "U_C_man_sport_1_F", "", 75, "" },
            { "U_NikosBody", "Nikos", 2500, "" },
            { "U_NikosAgedBody", "Casual Wears", 2500, "" },
			//ef
			{ "EF_MKJKT", "", 10, "" },
			{ "EF_M_jkt22", "", 10, "" },
			{ "EF_M_jkt1", "", 10, "" },
			{ "EF_M_jkt2_2", "", 10, "" },
			{ "EF_M_jkt2_22", "", 10, "" },
			{ "EF_M_jkt2_3", "", 10, "" },
			{ "EF_M_jkt4", "", 10, "" },
			{ "EF_M_jkt3", "", 10, "" },
			{ "EF_M_jkt42", "", 10, "" },
			{ "EF_M_jkt32", "", 10, "" },
			{ "EF_HM_LPBR", "", 10, "" },
			{ "EF_HM_LPBW", "", 10, "" },
			{ "EF_HM_LPB", "", 10, "" },
			{ "EF_HM_LPBL", "", 10, "" },
			{ "EF_HM_LPBW2", "", 10, "" },
			//tryk
			{ "TRYK_SUITS_BLK_F", "Suit", 10, "" },
			{ "TRYK_shirts_DENIM_BK", "", 10, "" },
			{ "TRYK_shirts_DENIM_BL", "", 10, "" },
			{ "TRYK_shirts_DENIM_BK_Sleeve", "", 10, "" },
			{ "TRYK_shirts_PAD_RED2", "", 10, "" },
			{"TRYK_U_B_PCUODHs","",250,""},
            {"TRYK_U_B_PCUGHs","",250,""},
            {"TRYK_U_B_PCUHs","",250,""},
            {"TRYK_U_B_BLOD_T","Black T Green P",50,""},
            {"TRYK_U_B_BLKTANR_CombatUniformTshirt","Black T Tan P II",70,""},
            {"TRYK_U_B_BLTAN_T","Black T Dark Tan P",50,""},
            {"TRYK_U_B_fleece_UCP","Leader",50,""},
            {"TRYK_U_B_ODTANR_CombatUniformTshirt","Green T Tan P",80,""},
            {"TRYK_U_B_PCUGs_OD","Jeans Green Hood",80,""},
            {"TRYK_U_B_PCUGs_gry","Jeans Gray Hood ",80,""},
            {"TRYK_U_B_PCUGs_BLK","Jeans Black Hood",80,""},
            {"TRYK_U_B_C02_Tsirt","Baggy Jeans + Black T",50,""},
            {"TRYK_OVERALL_SAGE_BLKboots_nk","Coveralls Green",40,""},
            {"TRYK_OVERALL_nok_flesh","Coveralls Tan",40,""},
            {"TRYK_U_B_wh_blk_Rollup_CombatUniform","White T Black Cargos",70,""},
            {"TRYK_U_B_wh_tan_Rollup_CombatUniform","White T Tan Cargos",70,""},
            {"TRYK_U_pad_hood_Blk","Black Hood Tan Cargos",10,""},
            {"TRYK_U_denim_hood_blk","Black Hood Jeans II",15,""},
            {"TRYK_U_denim_jersey_blk","Black T & Jeans",10,""},
            {"TRYK_U_denim_jersey_blu","Blue T & Jeans",10,""},
            {"TRYK_U_denim_hood_nc","Green Hood & Jeans",10,""},
            {"TRYK_U_taki_wh","Tan Mid East",10,""},
			{"TRYK_U_taki_BLK","Black Mid East",10,""},
            {"TRYK_U_taki_COY","Brown Mid East ",10,""},
            {"TRYK_U_B_BLK_T_BK","Black Jeans (Black)",50,""},
            {"TRYK_U_B_BLK_T_WH","Black Jeans (White)",50,""},
            {"TRYK_U_B_Denim_T_BK","Grey Jeans (Black)",50,""},
            {"TRYK_U_B_Denim_T_WH","Grey Jeans (White)",50,""}
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
			{ "H_Bandanna_khk", "", 12, "" },
			{ "H_Bandanna_cbr", "", 12, "" },
			{ "H_Bandanna_sgg", "", 12, "" },
			{ "H_Bandanna_sand", "", 12, "" },
			{ "H_Bandanna_gry", "", 12, "" },
			{ "H_Bandanna_blu", "", 12, "" },
			{ "H_Bandanna_camo", "", 12, "" },
			{ "H_Bandanna_mcamo", "", 12, "" },
			{ "H_Booniehat_mcamo", "", 12, "" },
			{ "H_Booniehat_grn", "", 12, "" },
			{ "H_Cap_red", "", 12, "" },
			{ "H_Cap_blu", "", 12, "" },
			{ "H_Cap_oli", "", 12, "" },
			{ "H_Cap_tan", "", 12, "" },
			{ "H_Cap_blk", "", 12, "" },
			{ "H_Cap_blk_CMMG", "", 12, "" },
			{ "H_Cap_brn_SPECOPS", "", 12, "" },
			{ "H_Cap_khaki_specops_UK", "", 12, "" },
			{ "H_Cap_tan_specops_US", "", 12, "" },
			{ "H_Cap_usblack", "", 12, "" },
			{ "H_Cap_grn", "", 12, "" },
			{ "H_Cap_grn_BI", "", 12, "" },
			{ "H_Cap_blk_Raven", "", 12, "" },
			{ "H_Cap_blk_ION", "", 12, "" },
			{ "H_Cap_surfer", "", 12, "" },
			{ "H_Cap_press", "", 12, "" },
			{ "H_Hat_blue", "", 12, "" },
			{ "H_Hat_brown", "", 12, "" },
			{ "H_Hat_camo", "", 12, "" },
			{ "H_Hat_grey", "", 12, "" },
			{ "H_Hat_checker", "", 12, "" },
			{ "H_Hat_tan", "", 12, "" },
			{ "H_Hat_checker", "", 12, "" },
			{ "H_StrawHat", "", 12, "" },
			{ "H_StrawHat_dark", "", 12, "" },
			{ "H_Helmet_Skate", "", 12, "" }			

        };
        goggles[] = {
            { "NONE", "Remove", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150,  "" }
        };
        vests[] = {
            { "NONE", "Remove", 0, "" },
			{ "TAC_HSG_ABL_B", "", 4900, "" },
            { "TAC_HSG_ABH_B", "", 4900, "" },
            { "TAC_HGB_B", "", 4900, "" },
            { "TRYK_V_Bulletproof_BLK", "", 50000, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", "Remove", 0, "" },
            { "B_OutdoorPack_blk", "", 50, "" },
            { "B_AssaultPack_khk", "", 200, "" },
            { "B_AssaultPack_dgtl", "", 200, "" },
            { "B_AssaultPack_rgr", "", 200, "" },
            { "B_AssaultPack_sgg", "", 200, "" },
            { "B_AssaultPack_blk", "", 200, "" },
            { "B_AssaultPack_cbr", "", 200, "" },
            { "B_AssaultPack_mcamo", "", 200, "" },
			{ "B_LegStrapBag_black_F", "", 200, "" },
			{ "B_LegStrapBag_coyote_F", "", 200, "" },
			{ "B_Messenger_Coyote_F", "", 200, "" },
			{ "B_Messenger_IDAP_F", "", 200, "" },
            { "B_Patrol_Respawn_bag_F", "", 200, "" },
            { "B_Kitbag_mcamo", "", 300, "" },
            { "B_Kitbag_sgg", "", 300, "" },
            { "B_Kitbag_cbr", "", 300, "" },
            { "B_FieldPack_blk", "", 300, "" },
            { "B_FieldPack_ocamo", "", 300, "" },
            { "B_FieldPack_oucamo", "", 300, "" },
            { "B_Bergen_sgg", "", 300, "" },
            { "B_Bergen_rgr", "", 300, "" },
			{ "B_Bergen_mcamo", "Union Jack Bag", 300, "" },
            { "B_Bergen_blk", "Stars 'n' Stripes", 300, "" },
            { "B_Carryall_ocamo", "", 300, "" },
            { "B_Carryall_mcamo", "", 300, "" },
            { "B_Carryall_oli", "", 300, "" },
            { "B_Carryall_khk", "", 300, "" },
            { "B_Carryall_Base", "", 300, "" }
        };
    };

    class BountyHunter_clothing {
        title = "STR_Shops_C_BountyHunter";
        conditions = "STR_civ_BountyHunter";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove", 0, "" },
            { "TRYK_U_B_BLKBLK_R_CombatUniform", "", 800, "" },
            { "", "", 800, "" },
            { "", "", 800, "" },
            { "", "", 800, "" },
            { "", "", 150, "" }
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
            { "H_Cap_blk", "", 0, "" },
            { "", "", 0, "" },
            { "", "", 0, "" },
            { "", "", 0, "" },
            { "", "", 0, "" },
            { "", "", 0, "" }
        };
        goggles[] = {
            { "NONE", "Remove", 0, "" },
            { "TAC_PMC_ID_W2", "", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove", 0, "" },
            { "TAC_V_Sheriff_BA_TBL", "", 600, "" },
            { "", "", 600, "" },
            { "", "", 600, "" },
            { "", "", 600, "" },
            { "", "", 600, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "TAC_BP_Butt_B2", "", 500, "" },
            { "", "", 200, "" },
            { "", "", 200, "" },
            { "", "", 200, "" },
            { "", "", 200, "" },
            { "", "", 200, "" }
        };
    };

	//police//

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove", 0, "" },
            { "SH_1", "Officer", 0, "call life_coplevel >= 1" },
			{ "SH_2", "Corporal", 0, "call life_coplevel >= 3" },
			{ "SH_3", "Sergeant", 0, "call life_coplevel >= 4" },
			{ "SH_4", "Staff Sergeant", 0, "call life_coplevel >= 5" },
			{ "SH_5", "Lieutenant", 0, "call life_coplevel >= 6" },
			{ "SH_6", "Captain", 0, "call life_coplevel >= 7" },
			{ "SH_8", "Deputy Sheriff", 0, "call life_coplevel >= 8" },
			{ "SH_10", "Sheriff", 0, "call life_coplevel >= 9" },
			{ "lake_side_sert_black", "SERT", 0, "call life_coplevel >= 5" }
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
			{ "H_Cap_oli", "Cap", 0, "call life_coplevel >= 1" },
			{ "sert_helmet_black", "Heli Helmet", 0, "call life_coplevel >= 5" }
        };
        goggles[] = {
            { "NONE", "Remove", 0, "" },
            { "G_Squares", "", 0, "" },
            { "G_Shades_Blue", "", 0, "" },
            { "G_Sport_Blackred", "", 0, "" },
            { "G_Sport_Checkered", "", 0, "" },
            { "G_Sport_Blackyellow", "", 0, "" },
            { "G_Sport_BlackWhite", "", 0, "" },
            { "G_Shades_Black", "", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove", 0, "" },
			{ "S_VHO_OV_OD_4", "Standard Vest", 0, "call life_coplevel >= 1" },
			{ "S_VHO_OV_OD_2", "Sheriff Vest I", 0, "call life_coplevel >= 3" },
            { "S_VHO_PV_OD", "Sheriff Vest II", 0, "call life_coplevel >= 4" }
        };
        backpacks[] = {
            { "NONE", "Remove", 0, "" },
			{ "AM_PoliceBelt", "Police Belt", 0, "" },
            { "B_Carryall_Base", "Invisible Pack", 0, "" }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_bountyH";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
			{ "TRYK_U_B_BLKBLK_R_CombatUniform", "Fug Uniform", 0, "" },
			{ "TRYK_U_B_BLKBLK_CombatUniform", "Fug Uniform II", 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
			{ "TRYK_UA_CAP2", "", 0, "" },
			{ "TRYK_H_headsetcap_blk_Glasses", "", 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "S_VHO_OV_BLK_4", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
			{ "AM_PoliceBelt", "Belt", 0, "" }
        };
    };

    class raven_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove", 0, "" },
			{ "TRYK_U_Bts_PCUGs", "", 80, "" },
			{ "TRYK_U_Bts_PCUODs", "", 80, "" },
			{ "TRYK_U_B_PCUGs_gry", "", 80, "" },
			{ "TRYK_ZARATAKI", "", 80, "" },
			{ "TRYK_ZARATAKI2", "", 80, "" },
            { "TRYK_B_TRYK_3C_T", "", 80, "" },
			{ "TRYK_U_B_C02_Tsirt", "", 80, "" },
			{ "TRYK_U_B_BLKTAN", "", 80, "" },
			{ "TRYK_U_B_BLK_OD_Tshirt", "", 80, "" },
			{ "TRYK_U_B_fleece", "", 80, "" },
			{ "TRYK_U_B_fleece_UCP", "", 100, "" },
			{ "TRYK_U_Bts_PCUs", "", 350, "" },
			{ "TRYK_U_Bts_GRYGRY_PCUs", "", 500, "" },
			{ "TRYK_U_Bts_UCP_PCUs", "", 500, "" },
			{ "TRYK_U_B_PCUHs", "", 500, "" },
			{ "TRYK_U_B_PCUGs_gry_R", "", 500, "" },
			{ "TRYK_U_B_PCUGs_OD_R", "", 500, "" },
			{ "TRYK_U_B_WDL_GRY_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_WDL_GRY_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_Wood_T", "", 3800, "" },
			{ "TRYK_U_B_NATO_UCP_GRY_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_JSDF_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANTAN_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANTAN_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANOCP_CombatUniform", "", 3800, "" },
			{ "TRYK_U_taki_G_WH", "", 3800, "" },
			{ "TRYK_U_taki_G_COY", "", 3800, "" },
			{ "TRYK_U_taki_wh", "", 3800, "" },
			{ "TRYK_U_denim_hood_mc", "", 3800, "" },
			{ "TRYK_U_denim_hood_3c", "", 3800, "" },
			{ "TRYK_T_TAN_PAD", "", 3800, "" },
			{ "TRYK_T_OD_PAD", "", 3800, "" },
			{ "TRYK_U_pad_hood_Cl", "", 3800, "" },
			{ "TRYK_U_pad_hood_odBK", "", 3800, "" },
			{ "TRYK_U_B_GRY_PCUs_R", "", 3800, "" },
			{ "TRYK_U_B_PCUGs", "", 3800, "" },
			{ "TRYK_U_B_PCUGs_BLK", "", 3800, "" },
			{ "TRYK_U_Bts_PCUODs", "", 3800, "" },
			{ "TRYK_U_B_PCUHs", "", 3800, "" }
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
            { "H_HelmetB_light", "", 400, "" },
            { "H_HelmetB_plain_mcamo", "", 500, "" },
            { "H_HelmetB_plain_blk", "", 500, "" },
            { "H_HelmetSpecB", "", 600, "" },
            { "H_HelmetSpecB_blk", "", 600, "" },
            { "H_HelmetSpecO_blk", "", 600, "" }
        };
        goggles[] = {
            { "NONE", "Remove", 0, "" }
        };
        vests[] = {
			{ "NONE", "Remove", 0, "" },
			{ "TAC_CR4_CY", "", 3800, "" },
			{ "TAC_CR4_OD", "", 3800, "" },
			{ "TAC_CR4_RG", "", 3800, "" },
			{ "TAC_HSG_ABH_B", "", 3800, "" },
			{ "TAC_HSG_ABH_Khaki", "", 3800, "" },
			{ "TAC_HSG_ABH_OD", "", 3800, "" },
			{ "TAC_HSG_ABL_OD", "", 3800, "" },
			{ "TAC_LBT_BL_BK", "", 3800, "" },
			{ "TAC_LBT_BL_KH", "", 3800, "" },
			{ "TAC_CR3", "", 3800, "" },
			{ "TAC_PBDFG2_CY_1", "", 3800, "" },
			{ "TAC_PBDFG2D_RG", "", 3800, "" },
			{ "TAC_PBDFG2D2_RG", "", 3800, "" },
			{ "TAC_FS_FO_B", "", 3800, "" },
			{ "TAC_FS_FO_G", "", 3800, "" },
			{ "TAC_LBT_H4_Khaki", "", 3800, "" },
			{ "TAC_LBT_H4_OD", "", 3800, "" },
			{ "TAC_LBT_HL_B", "", 3800, "" },
			{ "TAC_Punisher_Vest_BK", "", 3800, "" },
			{ "TAC_EI_RRVCQB_Coyote", "", 3800, "" },
			{ "TAC_EI_RRVCQB_OD", "", 3800, "" },
			{ "TRYK_BAPLSK", "", 3800, "" },
			{ "TRYK_V_harnes_blk_L", "", 3800, "" },
			{ "TRYK_V_harnes_od_L", "", 3800, "" },		
			{ "k_hrebel_1", "", 3800, "" },
			{ "k_hrebel_10", "", 3800, "" },
			{ "k_hrebel_2", "", 3800, "" },
			{ "k_hrebel_3", "", 3800, "" },
			{ "k_hrebel_4", "", 3800, "" },
			{ "k_hrebel_5", "", 3800, "" },
			{ "k_hrebel_6", "", 3800, "" },
			{ "k_hrebel_7", "", 3800, "" },
			{ "k_hrebel_8", "", 3800, "" },
			{ "k_hrebel_9", "", 3800, "" },	
			{ "k_nhrebel_1", "", 3800, "" },
			{ "k_nhrebel_2", "", 3800, "" },
			{ "k_nhrebel_3", "", 3800, "" },
			{ "k_nhrebel_4", "", 3800, "" },
			{ "k_nhrebel_5", "", 3800, "" },
			{ "k_nhrebel_6", "", 3800, "" },
			{ "k_nhrebel_7", "", 3800, "" },
			{ "k_nhrebel_8", "", 3800, "" },
			{ "k_nhrebel_9", "", 3800, "" },
			{ "k_nhrebel_10", "", 3800, "" },
			{ "TRYK_V_harnes_TAN_L", "", 3800, "" }	
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 200, "" },
            { "B_AssaultPack_dgtl", "", 200, "" },
            { "B_AssaultPack_rgr", "", 200, "" },
            { "B_AssaultPack_sgg", "", 200, "" },
            { "B_AssaultPack_blk", "", 200, "" },
            { "B_AssaultPack_cbr", "", 200, "" },
            { "B_AssaultPack_mcamo", "", 200, "" },
            { "B_TacticalPack_oli", "", 200, "" },
            { "B_Kitbag_mcamo", "", 500, "" },
            { "B_Kitbag_sgg", "", 500, "" },
            { "B_Kitbag_cbr", "", 500, "" },
            { "B_FieldPack_blk", "", 500, "" },
            { "B_FieldPack_ocamo", "", 500, "" },
            { "B_FieldPack_oucamo", "", 500, "" },
            { "B_Bergen_sgg", "", 600, "" },
            { "B_Bergen_mcamo", "", 600, "" },
            { "B_Bergen_rgr", "", 600, "" },
            { "B_Bergen_blk", "", 600, "" },
            { "B_Carryall_ocamo", "", 500, "" },
            { "B_Carryall_oucamo", "", 500, "" },
            { "B_Carryall_mcamo", "", 500, "" },
            { "B_Carryall_oli", "", 500, "" },
            { "B_Carryall_khk", "", 500, "" },
            { "B_Carryall_Base", "", 500, "" }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove", 0, "" },
			{ "niedobity_ems_ae", "Volunteer", 0, "call life_mediclevel >= 1" },
            { "niedobity_ems_probie", "Probation", 0, "call life_mediclevel >= 1" },
			{ "niedobity_ems_paramedic", "Paramedic", 0, "call life_mediclevel >= 1" },
			{ "niedobity_ems_seniorparamedic", "Senior Paramedic", 0, "call life_mediclevel >= 1" },
			{ "niedobity_ems_rru", "Rapid Response", 0, "call life_mediclevel >= 1" },
			{ "niedobity_ems_lieutenant", "Lieutenant", 0,"call life_mediclevel >= 1" },
			{ "niedobity_ems_captain", "Captain", 0, "call life_mediclevel >= 1" },
			{ "niedobity_ems_deputy", "Division Command", 0, "call life_mediclevel >= 1" }
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
			{ "US_FireFighter_Helmet", "Helmet", 0, "" }
        };
        goggles[] = {
            { "NONE", "Remove", 0, "" },
            { "G_Aviator", "", 0, "" },
			{ "US_FireFighter_ARI_Drager_Mask", "Fire Mask", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Remove", 0, "" },
			{ "US_FireFighter_ARI_Drager", "02", 0, "" },
            { "B_Carryall_Base", "Invisible Pack", 0, "" }
        };
    };

    class rebel {
        title = "STR_Shops_C_Rebel";
        conditions = "license_civ_rebel";
        side = "civ";
        uniforms[] = {
			{ "NONE", "Remove", 0, "" },
			{ "TRYK_U_Bts_PCUGs", "", 3800, "" },
			{ "TRYK_U_Bts_PCUODs", "", 3800, "" },
			{ "TRYK_U_B_PCUGs_gry", "", 3800, "" },
			{ "TRYK_ZARATAKI", "", 3800, "" },
			{ "TRYK_ZARATAKI2", "", 3800, "" },
            { "TRYK_B_TRYK_3C_T", "", 3800, "" },
			{ "TRYK_U_B_C02_Tsirt", "", 3800, "" },
			{ "TRYK_U_B_BLKTAN", "", 3800, "" },
			{ "TRYK_U_B_BLK_OD_Tshirt", "", 3800, "" },
			{ "TRYK_U_B_fleece", "", 3800, "" },
			{ "TRYK_U_B_fleece_UCP", "", 3800, "" },
			{ "TRYK_U_Bts_PCUs", "", 3800, "" },
			{ "TRYK_U_Bts_GRYGRY_PCUs", "", 3800, "" },
			{ "TRYK_U_Bts_UCP_PCUs", "", 500, "" },
			{ "TRYK_U_B_PCUHs", "", 500, "" },
			{ "TRYK_U_B_PCUGs_gry_R", "", 500, "" },
			{ "TRYK_U_B_PCUGs_OD_R", "", 500, "" },
			{ "TRYK_U_B_WDL_GRY_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_WDL_GRY_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_Wood_T", "", 3800, "" },
			{ "TRYK_U_B_NATO_UCP_GRY_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_JSDF_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANTAN_R_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANTAN_CombatUniform", "", 3800, "" },
			{ "TRYK_U_B_TANOCP_CombatUniform", "", 3800, "" },
			{ "TRYK_U_taki_G_WH", "", 3800, "" },
			{ "TRYK_U_taki_G_COY", "", 3800, "" },
			{ "TRYK_U_taki_wh", "", 3800, "" },
			{ "TRYK_U_denim_hood_mc", "", 3800, "" },
			{ "TRYK_U_denim_hood_3c", "", 3800, "" },
			{ "TRYK_T_TAN_PAD", "", 3800, "" },
			{ "TRYK_T_OD_PAD", "", 3800, "" },
			{ "TRYK_U_pad_hood_Cl", "", 3800, "" },
			{ "TRYK_U_pad_hood_odBK", "", 3800, "" },
			{ "TRYK_U_B_GRY_PCUs_R", "", 3800, "" },
			{ "TRYK_U_B_PCUGs", "", 3800, "" },
			{ "TRYK_U_B_PCUGs_BLK", "", 3800, "" },
			{ "TRYK_U_Bts_PCUODs", "", 3800, "" },
			{ "TRYK_U_B_PCUHs", "", 3800, "" },
            { "U_O_Wetsuit", "", 8750, "" },
            { "U_IG_Guerilla1_1", "", 4500, "" },
            { "U_I_G_Story_Protagonist_F", "", 8750, "" },
            { "U_I_G_resistanceLeader_F", "", 7750, "" },
            { "U_IG_leader", "Guerilla Leader", 17670, "" },
            { "U_O_T_Officer_F", "Officer Fatigues", 12500, "" },
            { "U_I_CombatUniform", "", 8750, "" },
            { "U_B_T_Soldier_AR_F", "", 15500, "" },
            { "U_B_T_Soldier_F", "", 11500, "" },
            { "U_B_survival_uniform", "", 15000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 10500, "" },
            { "U_I_C_Soldier_Para_3_F", "", 8500, "" },
            { "U_I_C_Soldier_Para_5_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 8500, "" },
            { "U_Marshal", "", 2500, "" },
            { "U_B_CombatUniform_mcam_vest", "", 4500, "" },
            { "U_B_T_Soldier_SL_F", "", 9500, "" },
            { "U_I_OfficerUniform", "", 6500, "" },
            { "U_B_CombatUniform_mcam_tshirt", "", 6500, "" },
            { "U_B_CombatUniform_mcam", "", 4500, "" },
            { "U_I_CombatUniform_shortsleeve", "", 4500, "" },
            { "U_BG_Guerilla1_1", "", 4500, "" },
            { "U_BG_Guerilla2_2", "", 4500, "" },
            { "U_BG_Guerilla2_1", "", 4500, "" },
            { "U_BG_Guerilla2_3", "", 4500, "" }
        };
        headgear[] = {
            { "NONE", "Remove", 0, "" },
			{ "H_MilCap_oucamo", "", 500, "" },
            { "H_MilCap_gen_F", "", 400, "" },
            { "H_MilCap_tna_F", "", 400, "" },
            { "H_Beret_gen_F", "", 2000, "" },
            { "H_Bandanna_mcamo", "", 250, "" },
            { "H_Bandanna_camo", "", 250, "" },
            { "H_Booniehat_mcamo", "Booniehat (MTP)", 500, "" },
            { "H_Booniehat_indp", " Booniehat (Khaki)", 500, "" },
            { "H_Booniehat_tna_F", "Booniehat (Tropic)", 500, "" },
            { "H_TurbanO_blk", "Black Turban", 500, "" },
            { "H_Hat_camo", "", 500, "" },
            { "H_HelmetB_light", "", 1800, "" },
            { "H_HelmetB_light_desert", "", 1800, "" },
            { "H_HelmetB_light_grass", "", 1800, "" },
            { "H_HelmetB_light_sand", "", 1800, "" },
            { "H_HelmetB_light_snakeskin", "", 1800, "" },
            { "H_HelmetB_Light_tna_F", "", 1800, "" },
            { "H_HelmetB_Enh_tna_F", "", 1800, "" },
            { "H_HelmetB_paint", "", 1800, "" },
            { "H_HelmetB_plain_mcamo", "", 1800, "" },
            { "H_HelmetIA_net", "", 1800, "" },
            { "H_Shemag_tan", "", 1800, "" },
            { "H_Shemag_olive_hs", "", 1800, "" },
            { "H_ShemagOpen_tan", "", 1800, "" },
            { "H_Shemag_olive", "", 1800, "" }
        };
        goggles[] = {
            { "NONE", "Remove", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Combat", "", 125, "" },
            { "G_Balaclava_blk", "", 150, "" },
            { "G_Balaclava_combat", "", 150, "" },
            { "G_Balaclava_lowprofile", "", 150, "" },
            { "G_Balaclava_oli", "", 150, "" },
            { "G_Bandanna_aviator", "", 150, "" },
            { "G_Bandanna_beast", "", 150, "" },
            { "G_Bandanna_blk", "", 150, "" },
            { "G_Bandanna_khk", "", 150, "" },
            { "G_Bandanna_oli", "", 150, "" },
            { "G_Bandanna_shades", "", 150, "" },
            { "G_Bandanna_sport", "", 150, "" },
            { "G_Bandanna_tan", "", 150, "" },
			{ "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", "Remove", 0, "" },
			{ "TRYK_V_tacSVD_OD", "", 3500, "" },
			{ "TRYK_V_tacv1M_BK", "", 3500, "" },
			{ "TRYK_V_tacv10_OD", "", 3500, "" },
			{ "CG_Tac_Vests", "", 3500, "" },
			{ "TRYK_V_ArmorVest_cbr2", "", 3500, "" },
			{ "TRYK_V_ArmorVest_Brown2", "", 3500, "" },
			{ "TRYK_V_ArmorVest_cbr2", "", 3500, "" },
			{ "TRYK_V_ArmorVest_khk2", "", 3500, "" },
			{ "TRYK_V_ArmorVest_rgr2", "", 3500, "" },
			{ "TRYK_V_harnes_blk_L", "", 3500, "" },
			{ "TRYK_V_harnes_od_L", "", 3500, "" },
			{ "k_hrebel_1", "", 3800, "" },
			{ "k_hrebel_10", "", 3800, "" },
			{ "k_hrebel_2", "", 3800, "" },
			{ "k_hrebel_3", "", 3800, "" },
			{ "k_hrebel_4", "", 3800, "" },
			{ "k_hrebel_5", "", 3800, "" },
			{ "k_hrebel_6", "", 3800, "" },
			{ "k_hrebel_7", "", 3800, "" },
			{ "k_hrebel_8", "", 3800, "" },
			{ "k_hrebel_9", "", 3800, "" },	
			{ "k_nhrebel_1", "", 3800, "" },
			{ "k_nhrebel_2", "", 3800, "" },
			{ "k_nhrebel_3", "", 3800, "" },
			{ "k_nhrebel_4", "", 3800, "" },
			{ "k_nhrebel_5", "", 3800, "" },
			{ "k_nhrebel_6", "", 3800, "" },
			{ "k_nhrebel_7", "", 3800, "" },
			{ "k_nhrebel_8", "", 3800, "" },
			{ "k_nhrebel_9", "", 3800, "" },
			{ "k_nhrebel_10", "", 3800, "" },
			{ "TRYK_V_harnes_TAN_L", "", 3500, "" }	
        };
        backpacks[] = {
            { "NONE", "Remove", 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 500, "" },
            { "B_AssaultPack_dgtl", "", 500, "" },
            { "B_AssaultPack_rgr", "", 500, "" },
            { "B_AssaultPack_sgg", "", 500, "" },
            { "B_AssaultPack_blk", "", 500, "" },
            { "B_AssaultPack_cbr", "", 500, "" },
            { "B_AssaultPack_mcamo", "", 500, "" },
            { "B_TacticalPack_oli", "", 500, "" },
            { "B_Kitbag_mcamo", "", 500, "" },
            { "B_Kitbag_sgg", "", 500, "" },
            { "B_Kitbag_cbr", "", 500, "" },
            { "B_FieldPack_blk", "", 500, "" },
            { "B_FieldPack_ocamo", "", 500, "" },
            { "B_FieldPack_oucamo", "", 500, "" },
            { "B_Bergen_sgg", "", 500, "" },
            { "B_Bergen_mcamo", "", 500, "" },
            { "B_Bergen_rgr", "", 500, "" },
            { "B_Bergen_blk", "", 500, "" },
            { "B_Carryall_ocamo", "", 500, "" },
            { "B_Carryall_oucamo", "", 500, "" },
            { "B_Carryall_mcamo", "", 500, "" },
            { "B_Carryall_oli", "", 500, "" },
            { "fow_b_usa_m1919_support", "", 300, "" },
            { "fow_b_usa_m1919_weapon", "", 300, "" },
            { "B_Carryall_khk", "", 500, "" },
            { "TAC_BP_KAR_B", "", 500, "" },
            { "B_Carryall_Base", "", 500, "" },
			// {"B_Bergen_tna_F", "", 8000, ""}
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
};

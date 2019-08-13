/*
    Author: Jean_Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Discord : https://discord.gg/DhFUFsq

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
class The_Programmer_Iphone_Home_Menu {
   idd = 542647;
   name = "The_Programmer_Iphone_Home_Menu";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class FondPrincipale : Life_RscPicture
       {
           text = "The-Programmer\Iphone_X\textures\fond.paa";
           idc = -1;
           x = 0.6379405 * safezoneW + safezoneX;
           y = 0.288744481809243 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class Fermer : Life_RscButtonInvisible
       {
           idc = -1;
           onbuttonclick = "closeDialog 0;";
           tooltip = "Close";
           x = 0.732093666666666 * safezoneW + safezoneX;
           y = 0.907587959685349 * safezoneH + safezoneY;
           w = 0.025877 * safezoneW;
           h = 0.0439812 * safezoneH;
       };
       class ButtonSettings : Life_RscButtonInvisible
       {
           idc = -1;
           onButtonClick = "[] call life_fnc_settingsMenu;";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonMyGang : Life_RscButtonInvisible
       {
           idc = 2011;
           text = "";
		   onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonLicences : Life_RscButtonInvisible
       {
           idc = 1602;
           onbuttonclick = "[] call the_programmer_iphone_fnc_Licences_Menu;";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonKeys : Life_RscButtonInvisible
       {
           idc = 2013;
           text = "";
           onbuttonclick = "createDialog ""The_Programmer_Iphone_Key_Menu"";";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonCell : Life_RscButtonInvisible
       {
           idc = 2029;
		   onButtonClick = "if ((getNumber (missionConfigFile >> ""The_Programmer_Settings_Iphone"" >> ""phone_numbers_script_enable"")) isEqualTo 1) then {createDialog ""The_Programmer_Iphone_Cell_Menu""; } else {createDialog ""The_Programmer_Iphone_Cell_TONIC_Menu"";};";

           x = 0.6578125 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonSyncData : Life_RscButtonInvisible
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call SOCK_fnc_syncData;";
           x = 0.658 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonBanking : Life_RscButtonInvisible
       {
           idc = -1;
           text = "";
           onbuttonclick = "[] call the_programmer_iphone_fnc_PayEasy;";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonPlayerMenu : Life_RscButtonInvisible
       {
           idc = -1;
           onbuttonclick = "createDialog ""The_Programmer_Iphone_Stuff_Menu"";";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class pay : Life_RscPicture
       {
           idc = 1001;
           tooltip = "Pay Easy";
           text = "The-Programmer\Iphone_X\textures\icons\money.paa";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class message : Life_RscPicture
       {
           idc = 1002;
           tooltip = "Message";
           text = "The-Programmer\Iphone_X\textures\icons\message.paa";
           x = 0.658 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class groupe : Life_RscPicture
       {
           idc = 1003;
           tooltip = "Gangs";
           text = "The-Programmer\Iphone_X\textures\icons\gang.paa";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class settings : Life_RscPicture
       {
           idc = 1004;
           tooltip = "Settings";
           text = "The-Programmer\Iphone_X\textures\icons\settings.paa";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class sac : Life_RscPicture
       {
           idc = 1005;
           tooltip = "Inventory";
           text = "The-Programmer\Iphone_X\textures\icons\inventory.paa";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class licences : Life_RscPicture
       {
           idc = 1006;
           tooltip = "Licences";
           text = "The-Programmer\Iphone_X\textures\icons\license.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class clefs : Life_RscPicture
       {
           idc = 1000;
           tooltip = "Keys";
           text = "The-Programmer\Iphone_X\textures\icons\keys.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.810 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Heure : Life_RscStructuredText
       {
           idc = 2101;
           x = 0.689583333333333 * safezoneW + safezoneX;
           y = 0.337551622418879 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.1 * safezoneW;
       };
       class syncro : Life_RscPicture
       {
           idc = 1007;
           tooltip = "Sync Data";
           text = "The-Programmer\Iphone_X\textures\icons\sync.paa";
           x = 0.658 * safezoneW + safezoneX;
           y = 0.734 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Reboot : Life_RscButtonInvisible
       {
           idc = -1;
           tooltip = "Reboot";
           onbuttonclick = "[] call the_programmer_iphone_fnc_reboot;";
           x = 0.807 * safezoneW + safezoneX;
           y = 0.312 * safezoneH + safezoneY;
           w = 0.01 * safezoneW;
           h = 0.02 * safezoneH;
       };
       class ButtonWeather : Life_RscButtonInvisible
       {
           idc = -1;
           onbuttonclick = "[] spawn the_programmer_iphone_fnc_weatherMenu;";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.658 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonWeather : Life_RscPicture
       {
           idc = -1;
           tooltip = "Weather";
           text = "The-Programmer\Iphone_X\textures\icons\weather.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.658 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonCompanies : Life_RscButtonInvisible
       {
           idc = 3005;
           onbuttonclick = "[] spawn max_entreprise_fnc_openMenu;";
           text = "";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.581 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonCompanies : Life_RscPicture
       {
           idc = 3006;
           tooltip = "Companies";
           text = "The-Programmer\Iphone_X\textures\icons\company.paa";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.581 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonGovernement : Life_RscButtonInvisible
       {
           idc = 3003;
           onbuttonclick = "closeDialog 0; createDialog ""maxence_laws""; [] spawn max_gouvernement_fnc_selectGovernementMenu;";
           text = "";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonGovernement : Life_RscPicture
       {
           idc = 3004;
           tooltip = "Government";
           text = "The-Programmer\Iphone_X\textures\icons\government.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonVIP : Life_RscButtonInvisible
       {
           idc = 2100;
		   tooltip = "Market";
           onButtonClick = "[] spawn life_fnc_openMarketView;";	
           x = 0.787 * safezoneW + safezoneX;
           y = 0.581 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonVIP : Life_RscPicture
       {
           idc = 2104;
           tooltip = "Market";
           text = "The-Programmer\Iphone_X\textures\icons\vip.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.581 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class ButtonFacture : Life_RscButtonInvisible
       {
           idc = 3001;
           onbuttonclick = "closeDialog 0; createDialog ""RscDisplayTaxiMenu"";";
           text = "";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonFacture : Life_RscPicture
       {
           idc = 3002;
           tooltip = "Taxi";
           text = "The-Programmer\Iphone_X\textures\icons\taxi.paa";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       /*
       class Buttonvide8 : Life_RscPicture
       {
           idc = -1;
           tooltip = "";
           text = "";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Boutonvide8 : Life_RscButtonInvisible
       {
           idc = -1;
           text = "";
           onbuttonclick = "";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Buttonvide9 : Life_RscPicture
       {
           idc = -1;
           tooltip = "";
           text = "";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Boutonvide9 : Life_RscButtonInvisible
       {
           idc = -1;
           onbuttonclick = "";
           text = "";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.510 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };*/
       class ButtonAdminMenu : Life_RscButtonInvisible
       {
           idc = 2021;
           text = "";
           onbuttonclick = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class admin : Life_RscPicture
       {
           idc = 1011;
           tooltip = "Skills";
           text = "The-Programmer\Iphone_X\textures\icons\skills.paa";
           x = 0.787 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class bourse : Life_RscPicture
       {
           idc = -1;
           tooltip = "Barriers";
		   condition = "playerSide isEqualTo West";
           text = "The-Programmer\Iphone_X\textures\icons\barrier.paa";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class BoutonDynmarketpPrices : Life_RscButtonInvisible
       {
           idc = 2099;
		   condition = "playerSide isEqualTo West";
		   onButtonClick = "[] spawn life_fnc_placeablesMenu; closeDialog 0;";
           text = "";
           x = 0.744 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class CallsManagement : Life_RscButtonInvisible
       {
           idc = 3059;
           text = "";
		   condition = "((call life_adminlevel) >= 1) && ((getNumber (missionConfigFile >> ""The_Programmer_Settings_Iphone"" >> ""whitelist_menu_script_enable"")) isEqualTo 1)";
           onbuttonclick = "createDialog ""whitelist_menu"";";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class CallsManagementPIC : Life_RscPicture
       {
           idc = 3060;
           tooltip = "Whitelist";
		   condition = "((call life_adminlevel) >= 1) && ((getNumber (missionConfigFile >> ""The_Programmer_Settings_Iphone"" >> ""whitelist_menu_script_enable"")) isEqualTo 1)";
           text = "The-Programmer\Iphone_X\textures\icons\whitelist.paa";
           x = 0.701 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class Interpol : Life_RscButtonInvisible
       {
           idc = 2012;
		   condition = "playerSide isEqualTo West";
		   onButtonClick = "if ((getNumber (missionConfigFile >> ""The_Programmer_Settings_Iphone"" >> ""interpol_script_enable"")) isEqualTo 1) then {closeDialog 0; [0] remoteExec [""max_interpol_fnc_getInterpol"",2];} else {[] call life_fnc_wantedMenu;};";
           text = "";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
       class InterpolPIC : Life_RscPicture
       {
           idc = 2013;
           tooltip = "Interpol";
		   condition = "playerSide isEqualTo West";
           text = "The-Programmer\Iphone_X\textures\icons\wanted.paa";
           x = 0.657 * safezoneW + safezoneX;
           y = 0.438 * safezoneH + safezoneY;
           w = 0.04 * safezoneW;
           h = 0.067 * safezoneH;
       };
   };
};

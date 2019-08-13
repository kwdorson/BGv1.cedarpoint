/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
class maxence_historique_gouvernement {
   idd = 1300;
   name = "maxence_historique_gouvernement";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class MainBackground : Life_RscText
       {
           idc = -1;
           colorbackground[] = {0,0,0,0.7};
           x = 0.314375 * safezoneW + safezoneX;
           y = 0.313 * safezoneH + safezoneY;
           w = 0.37125 * safezoneW;
           h = 0.30 * safezoneH;
       };
       class Life_RscTitleBackground : Life_RscText
       {
           idc = 1301;
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           text = "";
           x = 0.314375 * safezoneW + safezoneX;
           y = 0.288050147492625 * safezoneH + safezoneY;
           w = 0.37125 * safezoneW;
           h = 0.022 * safezoneH;
       };
   };
   class controls
   {
       class close_button : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.314375 * safezoneW + safezoneX;
           y = 0.615 * safezoneH + safezoneY;
           w = 0.061875 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class list : Life_RscListBox
       {
           idc = 1302;
           text = "";
           sizeex = 0.035;
           x = 0.319687 * safezoneW + safezoneX;
           y = 0.325 * safezoneH + safezoneY;
           w = 0.36 * safezoneW;
           h = 0.275 * safezoneH;
           colorbackground[] = {0,0,0,0.7};
       };
       class transactions_gouv : Life_RscButtonMenu
       {
           idc = 1303;
           text = "";
           onbuttonclick = "[0] remoteExec [""max_gouvernement_fnc_getGouvernementLogs"",2];";
           x = 0.39625 * safezoneW + safezoneX;
           y = 0.615 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class taxes_objects : Life_RscButtonMenu
       {
           idc = 1304;
           text = "";
           onbuttonclick = "[1] remoteExec [""max_gouvernement_fnc_getGouvernementLogs"",2];";
           x = 0.4696875 * safezoneW + safezoneX;
           y = 0.615 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class taxes_salaires : Life_RscButtonMenu
       {
           idc = 1305;
           text = "";
           onbuttonclick = "[2] remoteExec [""max_gouvernement_fnc_getGouvernementLogs"",2];";
           x = 0.543020833333333 * safezoneW + safezoneX;
           y = 0.615 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class taxes_entreprises : Life_RscButtonMenu
       {
           idc = 1306;
           text = "";
           onbuttonclick = "[3] remoteExec [""max_gouvernement_fnc_getGouvernementLogs"",2];";
           x = 0.6159375 * safezoneW + safezoneX;
           y = 0.615 * safezoneH + safezoneY;
           w = 0.07 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class compte_entreprise : Life_RscStructuredText
       {
           idc = 1307;
           text = "";
           x = 0.5328125 * safezoneW + safezoneX;
           y = 0.288284660766962 * safezoneH + safezoneY;
           h = 0.022 * safezoneH;
           w = 0.153125 * safezoneW;
       };
   };
};
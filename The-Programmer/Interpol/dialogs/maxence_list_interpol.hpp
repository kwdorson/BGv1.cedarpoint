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
class maxence_list_interpol {
   idd = 6000;
   name = "maxence_list_interpol";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = 6007;
           text = "";
           x = 0.3428125 * safezoneW + safezoneX;
           y = 0.174569536423841 * safezoneH + safezoneY;
           w = 0.320729166666667 * safezoneW;
           h = 0.0259981078524121 * safezoneH;
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
           x = 0.3428125 * safezoneW + safezoneX;
           y = 0.204554399243141 * safezoneH + safezoneY;
           w = 0.32125 * safezoneW;
           h = 0.523195837275308 * safezoneH;
       };
   };
   class controls
   {
       class SearchName : Life_RscEdit
       {
           idc = 6001;
           text = "";
           sizeex = 0.030;
           x = 0.344583333333333 * safezoneW + safezoneX;
           y = 0.693472090823084 * safezoneH + safezoneY;
           w = 0.124375 * safezoneW;
           h = 0.0238599810785239 * safezoneH;
       };
       class Edit : Life_RscButtonMenu
       {
           idc = 6002;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] spawn max_interpol_fnc_interpolEditMenu;";
           x = 0.487864583333333 * safezoneW + safezoneX;
           y = 0.693472090823084 * safezoneH + safezoneY;
           w = 0.124270833333333 * safezoneW;
           h = 0.0256764427625355 * safezoneH;
           class Attributes {align = "center";};
       };
       class ListeJoueurs : Life_RscListBox
       {
           idc = 6003;
           text = "";
           sizeex = 0.04;
           colorbackground[] = {0.1,0.1,0.1,0.9};
           onlbselchanged = "[_this] spawn max_interpol_fnc_interpolLbChanged;";
           x = 0.344583333333333 * safezoneW + safezoneX;
           y = 0.207392620624409 * safezoneH + safezoneY;
           w = 0.124375 * safezoneW;
           h = 0.48040302743614 * safezoneH;
       };
       class InfoJoueur : Life_RscStructuredText
       {
           idc = 6004;
           text = "";
           sizeex = 0.035;
           x = 0.471354166666666 * safezoneW + safezoneX;
           y = 0.207392620624409 * safezoneH + safezoneY;
           w = 0.190104166666667 * safezoneW;
           h = 0.444524783505384 * safezoneH;
       };
       class SearchTXT : Life_RscButtonMenu
       {
           idc = 6006;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] spawn max_interpol_fnc_interpolSearch;";
           x = 0.344583333333333 * safezoneW + safezoneX;
           y = 0.730655629139073 * safezoneH + safezoneY;
           w = 0.124375 * safezoneW;
           h = 0.0243112582781457 * safezoneH;
           class Attributes {align = "center";};
       };
       class Close : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "closeDialog 0;";
           x = 0.577604166666667 * safezoneW + safezoneX;
           y = 0.730655629139073 * safezoneH + safezoneY;
           w = 0.0871354166666665 * safezoneW;
           h = 0.0243112582781457 * safezoneH;
           class Attributes {align = "center";};
       };
       class Add : Life_RscButtonMenu
       {
           idc = -1;
           text = "+";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "closeDialog 0; createDialog ""maxence_interpol_add"";";
           x = 0.640625 * safezoneW + safezoneX;
           y = 0.693472090823084 * safezoneH + safezoneY;
           w = 0.0192708333333333 * safezoneW;
           h = 0.0238599810785239 * safezoneH;
           class Attributes {align = "center";};
       };
       class Crimes : Life_RscButtonMenu
       {
           idc = 6005;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] spawn max_interpol_fnc_getPlayerCrimes;";
           x = 0.493072916666666 * safezoneW + safezoneX;
           y = 0.659728150300148 * safezoneH + safezoneY;
           w = 0.149635416666667 * safezoneW;
           h = 0.0256764427625355 * safezoneH;
           class Attributes {align = "center";};
       };
   };
};

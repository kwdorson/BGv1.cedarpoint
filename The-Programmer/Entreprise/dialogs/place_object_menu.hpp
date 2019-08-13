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
class entreprise_objects_place_menu {
   idd = 5480;
   name = "entreprise_objects_place_menu";
   movingenable = false;
   enablesimulation = true;
   onload = "";
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = -1;
           x = 0.356770833333333 * safezoneW + safezoneX;
           y = 0.333726647000983 * safezoneH + safezoneY;
           w = 0.2796875 * safezoneW;
           h = 0.022 * safezoneH;
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
           x = 0.356770833333333 * safezoneW + safezoneX;
           y = 0.359044247787611 * safezoneH + safezoneY;
           w = 0.2796875 * safezoneW;
           h = 0.263374631268436 * safezoneH;
       };
   };
   class controls
   {
       class Title : Life_RscTitle
       {
           colorbackground[] = {0, 0, 0, 0};
           idc = 5481;
           text = "";
           x = 0.356770833333333 * safezoneW + safezoneX;
           y = 0.333726647000983 * safezoneH + safezoneY;
           w = 0.2796875 * safezoneW;
           h = 0.022 * safezoneH;
       };
       class ObjectsList : Life_RscListBox
       {
           idc = 5482;
           text = "";
           sizeex = 0.035;
           onlbselchanged = "[_this] spawn max_entreprise_fnc_lbChangedPlaceMenu;";
           x = 0.361666666666667 * safezoneW + safezoneX;
           y = 0.365211406096362 * safezoneH + safezoneY;
           w = 0.2690625 * safezoneW;
           h = 0.210993117010816 * safezoneH;
       };
       class CloseButton : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.356770833333333 * safezoneW + safezoneX;
           y = 0.627728613569322 * safezoneH + safezoneY;
           w = 0.069063 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
       class PlaceORdelete : Life_RscButtonMenu
       {
           idc = 5483;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "";
           x = 0.4434375 * safezoneW + safezoneX;
           y = 0.587413962635202 * safezoneH + safezoneY;
           w = 0.109166666666667 * safezoneW;
           h = 0.022 * safezoneH;
           class Attributes {align = "center";};
       };
   };
};

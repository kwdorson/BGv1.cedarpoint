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
class employes_menu_entreprise {
   idd = 5440;
   name = "employes_menu_entreprise";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
       class Fond : Life_RscPicture
       {
           text = "";
           x = 0.20859375 * safezoneW + safezoneX;
           y = 0.0353848946986201 * safezoneH + safezoneY;
           w = 0.6 * safezoneW;
           h = 0.96 * safezoneH;
           idc = 5445;
       };
   };
   class controls
   {
       class employeslist : Life_RscListBox
       {
           colortext[] = {0,0,0,1};
           x = 0.419791666666667 * safezoneW + safezoneX;
           y = 0.425221238938053 * safezoneH + safezoneY;
           w = 0.1765625 * safezoneW;
           h = 0.15196656833825 * safezoneH;
           idc = 5448;
           sizeex = 0.043;
           colorShadow[] = {1,1,1,0};
       };
       class objetslist : Life_RscListBox
       {
           colortext[] = {0,0,0,1};
           x = 0.419791666666667 * safezoneW + safezoneX;
           y = 0.609095378564405 * safezoneH + safezoneY;
           w = 0.1765625 * safezoneW;
           h = 0.176548672566372 * safezoneH;
           idc = 5446;
           sizeex = 0.043;
           colorShadow[] = {1,1,1,0};
       };
       class leave : Life_RscButtonMenu
       {
           idc = -1;
           x = 0.426163833333333 * safezoneW + safezoneX;
           y = 0.801434281219272 * safezoneH + safezoneY;
           w = 0.165502833333333 * safezoneW;
           h = 0.039216 * safezoneH;
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colordisabled[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           onbuttonclick = "[] spawn max_entreprise_fnc_entrepriseLeave;";
       };
       class pdgnametext : Life_RscText
       {
           idc = 5444;
           x = 0.4359375 * safezoneW + safezoneX;
           y = 0.352106932153392 * safezoneH + safezoneY;
           h = 0.0293161258603737 * safezoneH;
           w = 0.147395833333333 * safezoneW;
           text = "";
           sizeex = 0.05;
           colorShadow[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
       };
       class nameentreprisetext : Life_RscText
       {
           idc = 5443;
           colortext[] = {0,0,0,1};
           x = 0.4359375 * safezoneW + safezoneX;
           y = 0.299100786627335 * safezoneH + safezoneY;
           h = 0.0293161258603737 * safezoneH;
           w = 0.147395833333333 * safezoneW;
           text = "";
           sizeex = 0.05;
           colorShadow[] = {1,1,1,0};
       };
   };
};
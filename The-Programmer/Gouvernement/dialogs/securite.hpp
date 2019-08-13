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
class maxence_securite {
   idd = 1900;
   name = "maxence_securite";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Fond : Life_RscPicture
       {
           text = "";
           idc = 1901;
           x = 0.6379405 * safezoneW + safezoneX;
           y = 0.288744481809243 * safezoneH + safezoneY;
           w = 0.21 * safezoneW;
           h = 0.7 * safezoneH;
       };
   };
   class controls
   {
       class gouverneur : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.665226333333334 * safezoneW + safezoneX;
           y = 0.461217958702065 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_emergencyGouv;";
       };
       class pompiers : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.665747166666667 * safezoneW + safezoneX;
           y = 0.561975744346116 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_emergencyMed;";
       };
       class gendarmes : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.665226333333334 * safezoneW + safezoneX;
           y = 0.621956078662733 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_emergencyCop;";
       };
       class button_dep : Life_RscPicture
       {
           idc = 1902;
           text = "";
           x = 0.655729166666667 * safezoneW + safezoneX;
           y = 0.666666666666667 * safezoneH + safezoneY;
           w = 0.302083333333333 * safezoneW;
           h = 0.51622418879056 * safezoneH;
       };
       class depanneurs : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.6647055 * safezoneW + safezoneX;
           y = 0.679969844641102 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = 1903;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_emergencyDep;";
       };
       class demissioner : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.665226333333334 * safezoneW + safezoneX;
           y = 0.837295311701081 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = -1;
           onbuttonclick = "[] spawn max_gouvernement_fnc_leaveGouvernement;";
       };
       class viewlaws : Life_RscButtonMenu
       {
           colorbackground[] = {1,1,1,0};
           colorbackgroundfocused[] = {1,1,1,0};
           colorbackground2[] = {1,1,1,0};
           color[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           color2[] = {1,1,1,0};
           colortext[] = {1,1,1,0};
           colorsecondary[] = {1,1,1,0};
           colorfocusedsecondary[] = {1,1,1,0};
           color2secondary[] = {1,1,1,0};
           colordisabledsecondary[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           x = 0.665226333333334 * safezoneW + safezoneX;
           y = 0.750766304818093 * safezoneH + safezoneY;
           w = 0.1540445 * safezoneW;
           h = 0.0481232409046214 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_viewLaws;";
       };
   };
};
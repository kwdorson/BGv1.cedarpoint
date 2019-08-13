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
class maxence_prepare_vote {
   idd = 1400;
   name = "maxence_prepare_vote";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = -1;
           x = 0.35 * safezoneW + safezoneX;
           y = 0.2 * safezoneH + safezoneY;
           w = 0.3 * safezoneW;
           h = 0.0251720747295968 * safezoneH;
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
           x = 0.35 * safezoneW + safezoneX;
           y = 0.228267453294002 * safezoneH + safezoneY;
           w = 0.3 * safezoneW;
           h = 0.459048180924287 * safezoneH;
       };
       class Title : Life_RscTitle
       {
           colorbackground[] = {0, 0, 0, 0};
           idc = 1412;
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.199016715830875 * safezoneH + safezoneY;
           w = 0.3 * safezoneW;
           h = 0.0261553588987217 * safezoneH;
       };
   };
   class controls
   {
       class Candidat1 : Life_RscText
       {
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.230270894788593 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.3 * safezoneW;
           idc = 1401;
       };
       class Candidat2 : Life_RscText
       {
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.317783185840708 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.3 * safezoneW;
           idc = 1402;
       };
       class Candidat3 : Life_RscText
       {
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.414145034414946 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.3 * safezoneW;
           idc = 1403;
       };
       class Candidat4 : Life_RscText
       {
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.507557030481809 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.3 * safezoneW;
           idc = 1404;
       };
       class Candidat5 : Life_RscText
       {
           text = "";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.600969026548673 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.3 * safezoneW;
           idc = 1405;
       };
       class nom1 : Life_RscEdit
       {
           x = 0.398958333333333 * safezoneW + safezoneX;
           y = 0.26613569321534 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.2 * safezoneW;
           idc = 1406;
           text = "";
       };
       class nom2 : Life_RscEdit
       {
           x = 0.398958333333333 * safezoneW + safezoneX;
           y = 0.354631268436578 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.2 * safezoneW;
           idc = 1407;
           text = "";
       };
       class nom3 : Life_RscEdit
       {
           x = 0.398958333333333 * safezoneW + safezoneX;
           y = 0.450993117010816 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.2 * safezoneW;
           idc = 1408;
           text = "";
       };
       class nom4 : Life_RscEdit
       {
           x = 0.398958333333333 * safezoneW + safezoneX;
           y = 0.543421828908554 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.2 * safezoneW;
           idc = 1409;
           text = "";
       };
       class nom5 : Life_RscEdit
       {
           x = 0.398958333333333 * safezoneW + safezoneX;
           y = 0.636833824975418 * safezoneH + safezoneY;
           h = 0.04 * safezoneH;
           w = 0.2 * safezoneW;
           idc = 1410;
           text = "";
       };
       class Valider : Life_RscButtonMenu
       {
           idc = 1411;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_prepareVote;";
           x = 0.511458333333334 * safezoneW + safezoneX;
           y = 0.69105604719764 * safezoneH + safezoneY;
           w = 0.1390625 * safezoneW;
           h = 0.0228082595870207 * safezoneH;
           class Attributes {align = "center";};
       };
       class CloseButtonKey : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.35 * safezoneW + safezoneX;
           y = 0.69105604719764 * safezoneH + safezoneY;
           w = 0.145833333333333 * safezoneW;
           h = 0.0228082595870207 * safezoneH;
           class Attributes {align = "center";};
       };
   };
};

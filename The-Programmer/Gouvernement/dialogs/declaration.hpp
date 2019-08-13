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
class maxence_declaration {
   idd = 6790;
   name = "maxence_declaration";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Ecran : Life_RscPicture
       {
           idc = 6791;
           text = "";
           x = 0.136458333333333 * safezoneW + safezoneX;
           y = -0.00589970501474926 * safezoneH + safezoneY;
           w = 0.73828125 * safezoneW;
           h = 1.14287752006735 * safezoneH;
       };
   };
   class controls
   {
       class somme : Life_RscEdit
       {
           x = 0.5046875 * safezoneW + safezoneX;
           y = 0.335948869223205 * safezoneH + safezoneY;
           h = 0.0298328416912492 * safezoneH;
           w = 0.2203125 * safezoneW;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           sizeex = 0.045;
           idc = 6792;
           text = "0";
           onkeyup = "[(_this select 0)] call max_gouvernement_fnc_onKeyUpRevenu;";
       };
       class pourcent : Life_RscText
       {
           idc = 6793;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           x = 0.505208333333333 * safezoneW + safezoneX;
           y = 0.408245329400196 * safezoneH + safezoneY;
           h = 0.0293161258603741 * safezoneH;
           w = 0.219791666666667 * safezoneW;
           text = "0%";
           sizeex = 0.045;
       };
       class montant : Life_RscText
       {
           idc = 6794;
           x = 0.505208333333333 * safezoneW + safezoneX;
           y = 0.478950589970501 * safezoneH + safezoneY;
           h = 0.0303906096361848 * safezoneH;
           w = 0.219791666666667 * safezoneW;
           text = "0€";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           sizeex = 0.045;
       };
       class valider : Life_RscButtonMenu
       {
           animtexturenormal = "#(argb,8,8,3)color(1,1,1,0)";
           animtexturedisabled = "#(argb,8,8,3)color(1,1,1,0)";
           animtextureover = "#(argb,8,8,3)color(1,1,1,0)";
           animtexturefocused = "#(argb,8,8,3)color(1,1,1,0)";
           animtexturepressed = "#(argb,8,8,3)color(1,1,1,0)";
           animtexturedefault = "#(argb,8,8,3)color(1,1,1,0)";
           colorbackground[] = {0, 0, 0, 0};
           colorbackground2[] = {1, 1, 1, 0};
           color[] = {1, 1, 1, 0};
           color2[] = {1, 1, 1, 0};
           colortext[] = {1, 1, 1, 0};
           colordisabled[] = {1, 1, 1, 0};
           x = 0.449601333333333 * safezoneW + safezoneX;
           y = 0.593961321533923 * safezoneH + safezoneY;
           w = 0.112377833333334 * safezoneW;
           h = 0.0333739783677484 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_declareRevenu;";
       };
   };
};
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
class maxence_compte {
   idd = 2500;
   name = "maxence_compte";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class fond : Life_RscPicture
       {
           idc = 2501;
           text = "";
           x = 0.20859375 * safezoneW + safezoneX;
           y = 0.0353848946986201 * safezoneH + safezoneY;
           w = 0.6 * safezoneW;
           h = 0.96 * safezoneH;
       };
   };
   class controls
   {
       class solde : Life_RscText
       {
           idc = 2502;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           x = 0.465625 * safezoneW + safezoneX;
           y = 0.331549164208457 * safezoneH + safezoneY;
           h = 0.0263662733529986 * safezoneH;
           w = 0.196875 * safezoneW;
           text = "";
           sizeex = 0.05;
       };
       class montant : Life_RscEdit
       {
           idc = 2503;
           colortext[] = {0,0,0,1};
           x = 0.465625 * safezoneW + safezoneX;
           y = 0.389471730580138 * safezoneH + safezoneY;
           h = 0.0254741887905606 * safezoneH;
           w = 0.196875 * safezoneW;
           colorshadow[] = {0,0,0,1};
           colorbackground[] = {1,1,1,0};
           text = "";
           sizeex = 0.05;
       };
       class historique : Life_RscButtonMenu
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
           x = 0.465625 * safezoneW + safezoneX;
           y = 0.528081282202556 * safezoneH + safezoneY;
           w = 0.085416666666667 * safezoneW;
           h = 0.0274742733529991 * safezoneH;
           idc = -1;
           onbuttonclick = "[(uiNameSpace getVariable ""account_type"")] remoteExec [""max_gouvernement_fnc_getAccountLogs"",2];";
           text = "";
       };
       class envoyer : Life_RscButtonMenu
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
           x = 0.318029833333333 * safezoneW + safezoneX;
           y = 0.528081282202556 * safezoneH + safezoneY;
           w = 0.0882201666666667 * safezoneW;
           h = 0.0274742733529991 * safezoneH;
           idc = -1;
           onbuttonclick = "[(uiNameSpace getVariable ""account_type"")] spawn max_gouvernement_fnc_sendAccount;";
           text = "";
       };
       class retirer : Life_RscButtonMenu
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
           x = 0.610217333333333 * safezoneW + safezoneX;
           y = 0.528081282202556 * safezoneH + safezoneY;
           w = 0.0866576666666667 * safezoneW;
           h = 0.0274742733529991 * safezoneH;
           idc = -1;
           onbuttonclick = "[(uiNameSpace getVariable ""account_type"")] spawn max_gouvernement_fnc_withdrawAccount;";
           text = "";
       };
   };
};
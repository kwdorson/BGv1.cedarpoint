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
class maxence_edit_laws {
   idd = 1670;
   name = "maxence_edit_laws";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
       class fond : Life_RscPicture
       {
           idc = 1000;
           text = "";
           x = 0.20859375 * safezoneW + safezoneX;
           y = 0.0353848946986201 * safezoneH + safezoneY;
           w = 0.6 * safezoneW;
           h = 0.96 * safezoneH;
       };
   };
   class controls
   {
       class titreloi : Life_RscEdit
       {
           x = 0.3796875 * safezoneW + safezoneX;
           y = 0.337915437561456 * safezoneH + safezoneY;
           h = 0.0327826941986234 * safezoneH;
           w = 0.327083333333333 * safezoneW;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           colordisabled[] = {1,1,1,0};
           idc = 1001;
           text = "";
       };
       class loi : Life_RscEdit
       {
           x = 0.315104166666667 * safezoneW + safezoneX;
           y = 0.400521140609637 * safezoneH + safezoneY;
           h = 0.0576892822025562 * safezoneH;
           w = 0.390625 * safezoneW;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           colordisabled[] = {1,1,1,0};
           idc = 1002;
           text = "";
       };
       class listelois : Life_RscListBox
       {
           x = 0.315104166666667 * safezoneW + safezoneX;
           y = 0.511750245821042 * safezoneH + safezoneY;
           w = 0.138020833333333 * safezoneW;
           h = 0.148033431661751 * safezoneH;
           colorbackground[] = {0,0,0,0.7};
           idc = 1003;
           sizeex = 0.035;
           onlbselchanged = "[] spawn max_gouvernement_fnc_lbChangedLawsEdit;";
       };
       class TextBox : Life_RscStructuredText
       {
           idc = 1004;
           text = "";
           x = 0.452604166666667 * safezoneW + safezoneX;
           y = 0.511750245821042 * safezoneH + safezoneY;
           w = 0.254166666666666 * safezoneW;
           h = 0.148033431661751 * safezoneH;
           colorbackground[] = {0,0,0,0.7};
       };
       class enregistrerloi : Life_RscButtonMenu
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
           x = 0.465104166666667 * safezoneW + safezoneX;
           y = 0.462201242871189 * safezoneH + safezoneY;
           w = 0.089583333333333 * safezoneW;
           h = 0.0274742733529993 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_createLaws;";
       };
       class supprloi : Life_RscButtonMenu
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
           x = 0.465104166666667 * safezoneW + safezoneX;
           y = 0.668662076696165 * safezoneH + safezoneY;
           w = 0.089583333333333 * safezoneW;
           h = 0.0275031150442478 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "[] spawn max_gouvernement_fnc_deleteLaws;";
       };
       class closeButton : Life_RscButtonMenu
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
           x = 0.465104166666667 * safezoneW + safezoneX;
           y = 0.718809569321534 * safezoneH + safezoneY;
           w = 0.089583333333333 * safezoneW;
           h = 0.0294696833824976 * safezoneH;
           idc = -1;
           text = "";
           onbuttonclick = "closeDialog 0;";
       };
   };
};
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
class maxence_election {
   idd = 1800;
   name = "maxence_election";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Fond : Life_RscPicture
       {
           idc = 1022;
           text = "";
           x = 0.136458333333333 * safezoneW + safezoneX;
           y = -0.00589970501474926 * safezoneH + safezoneY;
           w = 0.73828125 * safezoneW;
           h = 1.14287752006735 * safezoneH;
       };
   };
   class controls
   {
       class Vote1Picture : Life_RscPicture
       {
           idc = 1001;
           text = "";
           x = 0.233333333333333 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.2484375 * safezoneW;
           h = 0.452581120943952 * safezoneH;
       };
       class Vote2Picture : Life_RscPicture
       {
           idc = 1002;
           text = "";
           x = 0.3484375 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.2484375 * safezoneW;
           h = 0.452581120943952 * safezoneH;
       };
       class Vote3Picture : Life_RscPicture
       {
           idc = 1003;
           text = "";
           x = 0.4625 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.2484375 * safezoneW;
           h = 0.452581120943952 * safezoneH;
       };
       class Vote4Picture : Life_RscPicture
       {
           idc = 1004;
           text = "";
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.2484375 * safezoneW;
           h = 0.452581120943952 * safezoneH;
       };
       class Vote5Picture : Life_RscPicture
       {
           idc = 1005;
           text = "";
           x = 0.6921875 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.2484375 * safezoneW;
           h = 0.452581120943952 * safezoneH;
       };
       class Nom1 : Life_RscStructuredText
       {
           idc = 1006;
           text = "";
           x = 0.234375 * safezoneW + safezoneX;
           y = 0.519356440511308 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Nom2 : Life_RscStructuredText
       {
           idc = 1007;
           text = "";
           x = 0.3484375 * safezoneW + safezoneX;
           y = 0.519356440511308 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Nom3 : Life_RscStructuredText
       {
           idc = 1008;
           text = "";
           x = 0.4625 * safezoneW + safezoneX;
           y = 0.519356440511308 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Nom4 : Life_RscStructuredText
       {
           idc = 1009;
           text = "";
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.519356440511308 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Nom5 : Life_RscStructuredText
       {
           idc = 1010;
           text = "";
           x = 0.6921875 * safezoneW + safezoneX;
           y = 0.519356440511308 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Voix1 : Life_RscStructuredText
       {
           idc = 1011;
           text = "";
           x = 0.234375 * safezoneW + safezoneX;
           y = 0.563604228121927 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Voix2 : Life_RscStructuredText
       {
           idc = 1012;
           text = "";
           x = 0.3484375 * safezoneW + safezoneX;
           y = 0.563604228121927 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Voix3 : Life_RscStructuredText
       {
           idc = 1013;
           text = "";
           x = 0.4625 * safezoneW + safezoneX;
           y = 0.563604228121927 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Voix4 : Life_RscStructuredText
       {
           idc = 1014;
           text = "";
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.563604228121927 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Voix5 : Life_RscStructuredText
       {
           idc = 1015;
           text = "";
           x = 0.6921875 * safezoneW + safezoneX;
           y = 0.563604228121927 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Pourcent1 : Life_RscStructuredText
       {
           idc = 1016;
           text = "";
           x = 0.234375 * safezoneW + safezoneX;
           y = 0.606868731563422 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Pourcent2 : Life_RscStructuredText
       {
           idc = 1017;
           text = "";
           x = 0.3484375 * safezoneW + safezoneX;
           y = 0.606868731563422 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Pourcent3 : Life_RscStructuredText
       {
           idc = 1018;
           text = "";
           x = 0.4625 * safezoneW + safezoneX;
           y = 0.606868731563422 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Pourcent4 : Life_RscStructuredText
       {
           idc = 1019;
           text = "";
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.606868731563422 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class Pourcent5 : Life_RscStructuredText
       {
           idc = 1020;
           text = "";
           x = 0.6921875 * safezoneW + safezoneX;
           y = 0.606868731563422 * safezoneH + safezoneY;
           h = 0.05 * safezoneH;
           w = 0.090625 * safezoneW;
       };
       class badge1 : Life_RscPicture
       {
           idc = 1023;
           text = "";
           x = 0.279166666666667 * safezoneW + safezoneX;
           y = 0.433357915437561 * safezoneH + safezoneY;
           w = 0.0458333333333333 * safezoneW;
           h = 0.0799164208456244 * safezoneH;
       };
       class badge2 : Life_RscPicture
       {
           idc = 1024;
           text = "";
           x = 0.398958333333334 * safezoneW + safezoneX;
           y = 0.447123893805309 * safezoneH + safezoneY;
           w = 0.041145833333333 * safezoneW;
           h = 0.0740167158308755 * safezoneH;
       };
       class badge3 : Life_RscPicture
       {
           idc = 1025;
           text = "";
           x = 0.513541666666667 * safezoneW + safezoneX;
           y = 0.447123893805309 * safezoneH + safezoneY;
           w = 0.041145833333333 * safezoneW;
           h = 0.0740167158308755 * safezoneH;
       };
       class badge4 : Life_RscPicture
       {
           idc = 1026;
           text = "";
           x = 0.629166666666667 * safezoneW + safezoneX;
           y = 0.447123893805309 * safezoneH + safezoneY;
           w = 0.041145833333333 * safezoneW;
           h = 0.0740167158308755 * safezoneH;
       };
       class badge5 : Life_RscPicture
       {
           idc = 1027;
           text = "";
           x = 0.743229166666667 * safezoneW + safezoneX;
           y = 0.447123893805309 * safezoneH + safezoneY;
           w = 0.041145833333333 * safezoneW;
           h = 0.0740167158308755 * safezoneH;
       };
       class Vote1 : Life_RscButtonMenu
       {
           idc = 1028;
           text = "";
           x = 0.233333333333333 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.0916666666666667 * safezoneW;
           h = 0.239208456243854 * safezoneH;
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
           onbuttonclick = "[0] spawn max_gouvernement_fnc_vote;";
       };
       class Vote2 : Life_RscButtonMenu
       {
           idc = 1029;
           text = "";
           x = 0.3484375 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.090625 * safezoneW;
           h = 0.239208456243854 * safezoneH;
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
           onbuttonclick = "[1] spawn max_gouvernement_fnc_vote;";
       };
       class Vote3 : Life_RscButtonMenu
       {
           idc = 1030;
           text = "";
           x = 0.4625 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.090625 * safezoneW;
           h = 0.239208456243854 * safezoneH;
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
           onbuttonclick = "[2] spawn max_gouvernement_fnc_vote;";
       };
       class Vote4 : Life_RscButtonMenu
       {
           idc = 1031;
           text = "";
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.090625 * safezoneW;
           h = 0.239208456243854 * safezoneH;
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
           onbuttonclick = "[3] spawn max_gouvernement_fnc_vote;";
       };
       class Vote5 : Life_RscButtonMenu
       {
           idc = 1032;
           text = "";
           x = 0.6921875 * safezoneW + safezoneX;
           y = 0.269149459193708 * safezoneH + safezoneY;
           w = 0.090625 * safezoneW;
           h = 0.239208456243854 * safezoneH;
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
           onbuttonclick = "[4] spawn max_gouvernement_fnc_vote;";
       };
       class Admin_Button : Life_RscButtonMenu
       {
           text = "";
           x = 0.709375 * safezoneW + safezoneX;
           y = 0.7799267453294 * safezoneH + safezoneY;
           w = 0.090625 * safezoneW;
           h = 0.039216 * safezoneH;
           idc = 1021;
           onbuttonclick = "";
           class Attributes {align = "center";};
       };
   };
};
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
class maxence_ministre {
   idd = 1500;
   name = "maxence_ministre";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class fond : Life_RscPicture
       {
           idc = 1000;
           text = "";
           x = 0.20859375 * safezoneW + safezoneX;
           y = 0.0353848946986201 * safezoneH + safezoneY;
           w = 0.6 * safezoneW;
           h = 0.957732116117506 * safezoneH;
       };
   };
   class controls
   {
       class slideentreprises : life_RscXSliderH
       {
           w = 0.11875 * safezoneW;
           h = 0.0196656833824975 * safezoneH;
           idc = 1001;
           x = 0.4484375 * safezoneW + safezoneX;
           y = 0.344240658800394 * safezoneH + safezoneY;
           onsliderposchanged = "[0,(_this select 1)] call max_gouvernement_fnc_onSliderChangeTaxes;";
           text = "";
       };
       class slideventes : life_RscXSliderH
       {
           w = 0.118229166666667 * safezoneW;
           h = 0.0196656833824975 * safezoneH;
           idc = 1002;
           x = 0.448958333333333 * safezoneW + safezoneX;
           y = 0.388397246804326 * safezoneH + safezoneY;
           onsliderposchanged = "[1,(_this select 1)] call max_gouvernement_fnc_onSliderChangeTaxes;";
           text = "";
       };
       class slidesalaires : life_RscXSliderH
       {
           w = 0.118229166666667 * safezoneW;
           h = 0.0196656833824975 * safezoneH;
           idc = 1003;
           x = 0.448958333333333 * safezoneW + safezoneX;
           y = 0.430678466076696 * safezoneH + safezoneY;
           onsliderposchanged = "[2,(_this select 1)] call max_gouvernement_fnc_onSliderChangeTaxes;";
           text = "";
       };
       class taxeentreprises : Life_RscEdit
       {
           idc = 1004;
           x = 0.427083333333333 * safezoneW + safezoneX;
           y = 0.339415437561455 * safezoneH + safezoneY;
           h = 0.026366273352999 * safezoneH;
           w = 0.0177083333333333 * safezoneW;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           onkeyup = "[(_this select 0),0] call max_gouvernement_fnc_onKeyUpTaxes;";
           colorShadow[] = {0, 0, 0, 0.5};
       };
       class taxeventes : Life_RscEdit
       {
           idc = 1005;
           x = 0.4265625 * safezoneW + safezoneX;
           y = 0.382097099311701 * safezoneH + safezoneY;
           h = 0.026366273352999 * safezoneH;
           w = 0.01875 * safezoneW;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           onkeyup = "[(_this select 0),1] call max_gouvernement_fnc_onKeyUpTaxes;";
           colorShadow[] = {0, 0, 0, 0.5};
       };
       class taxesalaires : Life_RscEdit
       {
           idc = 1006;
           x = 0.4265625 * safezoneW + safezoneX;
           y = 0.425361602753196 * safezoneH + safezoneY;
           h = 0.026366273352999 * safezoneH;
           w = 0.01875 * safezoneW;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           onkeyup = "[(_this select 0),2] call max_gouvernement_fnc_onKeyUpTaxes;";
           colorShadow[] = {0, 0, 0, 0.5};
       };
       class listeministres : Life_RscListBox
       {
           x = 0.305208333333333 * safezoneW + safezoneX;
           y = 0.508357915437561 * safezoneH + safezoneY;
           w = 0.120833333333333 * safezoneW;
           h = 0.192723697148476 * safezoneH;
           idc = 1011;
           colortext[] = {0,0,0,1};
           sizeex = 0.043;
           colorshadow[] = {1,1,1,0};
       };
       class listesecurites : Life_RscListBox
       {
           x = 0.438802083333333 * safezoneW + safezoneX;
           y = 0.508357915437561 * safezoneH + safezoneY;
           w = 0.126302083333333 * safezoneW;
           h = 0.192723697148476 * safezoneH;
           idc = 1012;
           colortext[] = {0,0,0,1};
           sizeex = 0.043;
           colorshadow[] = {1,1,1,0};
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
           x = 0.458333333333333 * safezoneW + safezoneX;
           y = 0.725200916420846 * safezoneH + safezoneY;
           w = 0.0890625000000004 * safezoneW;
           h = 0.0284575575221239 * safezoneH;
           idc = -1;
           onbuttonclick = "[] spawn max_gouvernement_fnc_leaveGouvernement;";
           text = "";
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
           x = 0.5984375 * safezoneW + safezoneX;
           y = 0.714384790560472 * safezoneH + safezoneY;
           w = 0.0906250000000004 * safezoneW;
           h = 0.0284575575221239 * safezoneH;
           idc = -1;
           onbuttonclick = "closeDialog 0;";
           text = "";
       };
       class comptegouv : Life_RscStructuredText
       {
           idc = 1015;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.360064405113078 * safezoneH + safezoneY;
           h = 0.0263662733529989 * safezoneH;
           w = 0.0609375 * safezoneW;
           text = "";
       };
       class comptegendarme : Life_RscStructuredText
       {
           idc = 1016;
           x = 0.65 * safezoneW + safezoneX;
           y = 0.40319616519174 * safezoneH + safezoneY;
           h = 0.0264990167158309 * safezoneH;
           w = 0.0609375 * safezoneW;
           text = "";
       };
       class comptepompier : Life_RscStructuredText
       {
           idc = 1017;
           x = 0.650520833333333 * safezoneW + safezoneX;
           y = 0.446502212389381 * safezoneH + safezoneY;
           h = 0.0244909046214352 * safezoneH;
           w = 0.0609375 * safezoneW;
           text = "";
       };
       class montant : Life_RscEdit
       {
           idc = 1018;
           x = 0.578125 * safezoneW + safezoneX;
           y = 0.56929203539823 * safezoneH + safezoneY;
           h = 0.026366273352999 * safezoneH;
           w = 0.1328125 * safezoneW;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           text = "0";
       };
       class transfert : Life_RscButtonMenu
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
           x = 0.5984375 * safezoneW + safezoneX;
           y = 0.607709931170108 * safezoneH + safezoneY;
           w = 0.0906250000000004 * safezoneW;
           h = 0.0284575575221239 * safezoneH;
           idc = -1;
           onbuttonclick = "[] spawn max_gouvernement_fnc_transfertGouvernement;";
           text = "";
       };
       class listemontantde : Life_RscCombo
       {
           x = 0.593984375 * safezoneW + safezoneX;
           y = 0.492625368731563 * safezoneH + safezoneY;
           w = 0.100572916666667 * safezoneW;
           h = 0.026366273352999 * safezoneH;
           idc = 1023;
           colorselect[] = {0,0,0,1};
           colortext[] = {0,0,0,1};
           colorscrollbar[] = {1,1,1,0};
           colorpicture[] = {1,1,1,0};
           colorpictureselected[] = {1,1,1,0};
           colorpictureright[] = {1,1,1,0};
           colorpicturerightselected[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           colorbackground[] = {0.752941176470588,0.752941176470588,0.752941176470588,1};
           colorselectbackground[] = {0.501960784313725,0.501960784313725,0.501960784313725,1};
           coloractive[] = {1,1,1,0};
           colordisabled[] = {1,1,1,0};
           colortextright[] = {1,1,1,0};
           colorselectright[] = {0,0,0,1};
           colorselect2right[] = {0,0,0,1};
           colorShadow[] = {1,1,1,0};
       };
       class listemontanta : Life_RscCombo
       {
           x = 0.593984375 * safezoneW + safezoneX;
           y = 0.531556293018682 * safezoneH + safezoneY;
           w = 0.100572916666667 * safezoneW;
           h = 0.026366273352999 * safezoneH;
           idc = 1024;
           colorselect[] = {0,0,0,1};
           colortext[] = {0,0,0,1};
           colorscrollbar[] = {1,1,1,0};
           colorpicture[] = {1,1,1,0};
           colorpictureselected[] = {1,1,1,0};
           colorpictureright[] = {1,1,1,0};
           colorpicturerightselected[] = {1,1,1,0};
           tooltipcolortext[] = {1,1,1,0};
           tooltipcolorbox[] = {1,1,1,0};
           tooltipcolorshade[] = {1,1,1,0};
           colorbackground[] = {0.752941176470588,0.752941176470588,0.752941176470588,1};
           colorselectbackground[] = {0.501960784313725,0.501960784313725,0.501960784313725,1};
           coloractive[] = {1,1,1,0};
           colordisabled[] = {1,1,1,0};
           colortextright[] = {1,1,1,0};
           colorselectright[] = {0,0,0,1};
           colorselect2right[] = {0,0,0,1};
           colorShadow[] = {1,1,1,0};
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
           x = 0.3171875 * safezoneW + safezoneX;
           y = 0.72618420058997 * safezoneH + safezoneY;
           w = 0.0895833333333333 * safezoneW;
           h = 0.0284575575221239 * safezoneH;
           idc = -1;
           onbuttonclick = "[] spawn max_gouvernement_fnc_historicMenu;";
           text = "";
       };
       class editlaws : Life_RscButtonMenu
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
           x = 0.5984375 * safezoneW + safezoneX;
           y = 0.672103571288102 * safezoneH + safezoneY;
           w = 0.0906250000000004 * safezoneW;
           h = 0.0284575575221239 * safezoneH;
           idc = -1;
           onbuttonclick = "[] spawn max_gouvernement_fnc_editLawsMenu;";
           text = "";
       };
   };
};
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
class entreprise_pdg_menu {
   idd = 5450;
   name = "entreprise_pdg_menu";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
       class RscPicture : Life_RscPicture
       {
           text = "";
           x = 0.20859375 * safezoneW + safezoneX;
           y = 0.0353848946986201 * safezoneH + safezoneY;
           w = 0.6 * safezoneW;
           h = 0.96 * safezoneH;
           idc = 5451;
       };
   };
   class controls
   {
       class nameentreprisetext : Life_RscText
       {
           idc = 5455;
           colortext[] = {0,0,0,1};
           x = 0.365625 * safezoneW + safezoneX;
           y = 0.260570304818092 * safezoneH + safezoneY;
           h = 0.0312826941986234 * safezoneH;
           w = 0.206770833333333 * safezoneW;
           text = "";
           sizeex = 0.055;
           colorShadow[] = {1,1,1,0};
       };
       class pdgnametext : Life_RscText
       {
           idc = 5457;
           colortext[] = {0,0,0,1};
           x = 0.32265625 * safezoneW + safezoneX;
           y = 0.2931098820059 * safezoneH + safezoneY;
           h = 0.0312826941986234 * safezoneH;
           w = 0.206770833333333 * safezoneW;
           text = "";
           sizeex = 0.055;
           colorShadow[] = {1,1,1,0};
       };
       class bankentreprise : Life_RscText
       {
           idc = 5471;
           colortext[] = {0,0,0,1};
           x = 0.3328125 * safezoneW + safezoneX;
           y = 0.343166175024582 * safezoneH + safezoneY;
           h = 0.0361991150442478 * safezoneH;
           w = 0.190104166666667 * safezoneW;
           text = "";
           sizeex = 0.055;
           colorShadow[] = {1,1,1,0};
       };
       class priceManageBank : Life_RscEdit
       {
           x = 0.372916666666667 * safezoneW + safezoneX;
           y = 0.390363815142576 * safezoneH + safezoneY;
           h = 0.0327826941986234 * safezoneH;
           w = 0.141145833333333 * safezoneW;
           text = "";
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           idc = 5472;
           style = 528;
           sizeex = 0.05;
           colorShadow[] = {1,1,1,0};
       };
       class allPlayersList : Life_RscCombo
       {
           x = 0.298177083333333 * safezoneW + safezoneX;
           y = 0.443660275319567 * safezoneH + safezoneY;
           w = 0.187239583333333 * safezoneW;
           h = 0.035 * safezoneH;
           idc = 5454;
           colorShadow[] = {1,1,1,0};
           colorbackground[] = {0.752941176470588,0.752941176470588,0.752941176470588,1};
           colorselectbackground[] = {0.501960784313725,0.501960784313725,0.501960784313725,1};
       };
       class employeslist : Life_RscListBox
       {
           colortext[] = {0,0,0,1};
           sizeex = 0.043;
           x = 0.6 * safezoneW + safezoneX;
           y = 0.653343166175025 * safezoneH + safezoneY;
           w = 0.140104166666667 * safezoneW;
           h = 0.139183874139626 * safezoneH;
           idc = 5453;
           colorShadow[] = {1,1,1,0};
       };
       class addemploye : Life_RscButtonMenu
       {
           idc = 5456;
           x = 0.506893 * safezoneW + safezoneX;
           y = 0.443660275319567 * safezoneH + safezoneY;
           w = 0.132690333333333 * safezoneW;
           h = 0.0361991150442478 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_sendInvitePlayerEntreprise;";
       };
       class objetslist : Life_RscListBox
       {
           colortext[] = {0,0,0,1};
           x = 0.436197916666666 * safezoneW + safezoneX;
           y = 0.614773844641101 * safezoneH + safezoneY;
           w = 0.139322916666667 * safezoneW;
           h = 0.176769911504425 * safezoneH;
           idc = 5459;
           sizeex = 0.043;
           colorShadow[] = {1,1,1,0};
       };
       class putmoney : Life_RscButtonMenu
       {
           idc = 5469;
           x = 0.576884 * safezoneW + safezoneX;
           y = 0.350049164208456 * safezoneH + safezoneY;
           w = 0.132690333333333 * safezoneW;
           h = 0.0361991150442478 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_putMoneyToEntACC;";
       };
       class takemoney : Life_RscButtonMenu
       {
           idc = 5470;
           x = 0.576884 * safezoneW + safezoneX;
           y = 0.390363815142576 * safezoneH + safezoneY;
           w = 0.132690333333333 * safezoneW;
           h = 0.0361991150442478 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_takeMoneyFromEntACC;";
       };
       class removeemploye : Life_RscButtonMenu
       {
           idc = 5461;
           x = 0.6 * safezoneW + safezoneX;
           y = 0.535489429695182 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442478 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_entrepriseKick;";
       };
       class promoteemploye : Life_RscButtonMenu
       {
           idc = 5474;
           x = 0.6 * safezoneW + safezoneX;
           y = 0.573837512291052 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_entrepriseSetAssociates;";
       };
       class demoteemploye : Life_RscButtonMenu
       {
           idc = 5475;
           x = 0.6 * safezoneW + safezoneX;
           y = 0.614773844641101 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_entrepriseRemoveAssociates;";
       };
       class removeitem : Life_RscButtonMenu
       {
           idc = 5468;
           x = 0.436197916666666 * safezoneW + safezoneX;
           y = 0.499107915437562 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_removeAllowedItem;";
       };
       class addobject : Life_RscButtonMenu
       {
           idc = 5462;
           x = 0.436197916666666 * safezoneW + safezoneX;
           y = 0.573837512291052 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_addAllowedItem;";
       };
       class buy100stockage : Life_RscButtonMenu
       {
           idc = 5466;
           x = 0.27734375 * safezoneW + safezoneX;
           y = 0.628901425762045 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[1] spawn max_entreprise_fnc_stockageBuy;";
       };
       class buy1000stockage : Life_RscButtonMenu
       {
           idc = 5467;
           x = 0.27734375 * safezoneW + safezoneX;
           y = 0.67413249754179 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[2] spawn max_entreprise_fnc_stockageBuy;";
       };
       class Historique : Life_RscButtonMenu
       {
           idc = 5476;
           x = 0.576884 * safezoneW + safezoneX;
           y = 0.2931098820059 * safezoneH + safezoneY;
           w = 0.132690333333333 * safezoneW;
           h = 0.0361991150442478 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_historicMenu;";
       };
       class buyPositionORaddObject : Life_RscButtonMenu
       {
           idc = 5473;
           x = 0.27734375 * safezoneW + safezoneX;
           y = 0.716413716814159 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
       };
       class disbandEntreprise : Life_RscButtonMenu
       {
           idc = 5465;
           x = 0.27734375 * safezoneW + safezoneX;
           y = 0.757711651917404 * safezoneH + safezoneY;
           w = 0.136979166666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
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
           onbuttonclick = "[] spawn max_entreprise_fnc_entrepriseDisband;";
       };
       class allItemsList : Life_RscCombo
       {
           idc = 5463;
           x = 0.27734375 * safezoneW + safezoneX;
           y = 0.535489429695182 * safezoneH + safezoneY;
           w = 0.153385416666667 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
           colorbackground[] = {0.752941176470588,0.752941176470588,0.752941176470588,1};
           colorselectbackground[] = {0.501960784313725,0.501960784313725,0.501960784313725,1};
           colorShadow[] = {1,1,1,0};
       };
       class priceItemAdd : Life_RscEdit
       {
           idc = 5464;
           x = 0.44375 * safezoneW + safezoneX;
           y = 0.538180924287119 * safezoneH + safezoneY;
           h = 0.0301573254670599 * safezoneH;
           text = "";
           w = 0.13046875 * safezoneW;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           style = 528;
           sizeex = 0.05;
           colorShadow[] = {1,1,1,0};
       };
       class closeButton : Life_RscButtonMenu
       {
           idc = -1;
           x = 0.756893 * safezoneW + safezoneX;
           y = 0.499107915437562 * safezoneH + safezoneY;
           w = 0.0175861666666666 * safezoneW;
           h = 0.0361991150442477 * safezoneH;
           animtexturenormal = "#(argb,8,8,3)color(0,0,0,1)";
           animtexturedisabled = "#(argb,8,8,3)color(0,0,0,1)";
           animtextureover = "#(argb,8,8,3)color(0,0,0,1)";
           animtexturefocused = "#(argb,8,8,3)color(0,0,0,1)";
           animtexturepressed = "#(argb,8,8,3)color(0,0,0,1)";
           animtexturedefault = "#(argb,8,8,3)color(0,0,0,1)";
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
           onbuttonclick = "closeDialog 0;";
       };
   };
};
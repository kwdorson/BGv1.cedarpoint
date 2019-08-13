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
class entreprise_create {
   idd = 5430;
   name = "entreprise_create";
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
           idc = 5431;
       };
   };
   class controls
   {
       class nameentreprisetextEDIT : Life_RscEdit
       {
           x = 0.440104166666667 * safezoneW + safezoneX;
           y = 0.245821042281219 * safezoneH + safezoneY;
           h = 0.0308161258603736 * safezoneH;
           w = 0.163020833333333 * safezoneW;
           idc = 5433;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           colorShadow[] = {1,1,1,0};
           text = "";
       };
       class nameentreprisetextTEXT : Life_RscText
       {
           x = 0.440104166666667 * safezoneW + safezoneX;
           y = 0.245821042281219 * safezoneH + safezoneY;
           h = 0.0308161258603736 * safezoneH;
           w = 0.163020833333333 * safezoneW;
           idc = 5438;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           colorShadow[] = {1,1,1,0};
           text = "";
       };
       class signatureedit : Life_RscEdit
       {
           x = 0.383333333333333 * safezoneW + safezoneX;
           y = 0.453294001966569 * safezoneH + safezoneY;
           h = 0.0367158308751229 * safezoneH;
           w = 0.200520833333333 * safezoneW;
           idc = 5439;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           text = "";
           colorShadow[] = {1,1,1,0};
           font = "LucidaConsoleB";
       };
       class valider : Life_RscButtonMenu
       {
           idc = 5429;
           x = 0.514184666666667 * safezoneW + safezoneX;
           y = 0.497599472959685 * safezoneH + safezoneY;
           w = 0.149357 * safezoneW;
           h = 0.039216 * safezoneH;
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
		       onbuttonclick = "";
       };
       class pdgnametext : Life_RscText
       {
           idc = 5434;
           x = 0.404166666666667 * safezoneW + safezoneX;
           y = 0.275319567354966 * safezoneH + safezoneY;
           h = 0.0308161258603736 * safezoneH;
           w = 0.198958333333333 * safezoneW;
           colortext[] = {0,0,0,1};
           text = "";
           colorShadow[] = {1,1,1,0};
           sizeEx = 0.045;
       };
       class typeentreprise : Life_RscCombo
       {
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
           x = 0.440104166666667 * safezoneW + safezoneX;
           y = 0.306000491642085 * safezoneH + safezoneY;
           w = 0.163020833333333 * safezoneW;
           h = 0.0283161258603732 * safezoneH;
           colorbackground[] = {0.752941176470588,0.752941176470588,0.752941176470588,1};
           colorselectbackground[] = {0.501960784313725,0.501960784313725,0.501960784313725,1};
           coloractive[] = {1,1,1,0};
           colordisabled[] = {1,1,1,0};
           colortextright[] = {1,1,1,0};
           colorselectright[] = {0,0,0,1};
           colorselect2right[] = {0,0,0,1};
           colorShadow[] = {1,1,1,0};
           idc = 5432;
           onlbselchanged = "[_this] spawn max_entreprise_fnc_lbChangedCreateMenu;";
       };
       class employesmax : Life_RscText
       {
           x = 0.440104166666667 * safezoneW + safezoneX;
           y = 0.348407079646018 * safezoneH + safezoneY;
           h = 0.0252409046214356 * safezoneH;
           w = 0.163020833333333 * safezoneW;
           idc = 5435;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           text = "0";
           sizeEx = 0.045;
           colorShadow[] = {1,1,1,0};
       };
       class stockcommun : Life_RscText
       {
           x = 0.481510416666667 * safezoneW + safezoneX;
           y = 0.37298918387414 * safezoneH + safezoneY;
           h = 0.0262241887905604 * safezoneH;
           w = 0.163020833333333 * safezoneW;
           idc = 5436;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           text = "0";
           sizeEx = 0.045;
           colorShadow[] = {1,1,1,0};
       };
       class stockprive : Life_RscText
       {
           x = 0.463541666666667 * safezoneW + safezoneX;
           y = 0.397571288102262 * safezoneH + safezoneY;
           h = 0.0262241887905604 * safezoneH;
           w = 0.163802083333333 * safezoneW;
           idc = 5437;
           colorbackground[] = {1,1,1,0};
           colortext[] = {0,0,0,1};
           text = "0";
           sizeEx = 0.045;
           colorShadow[] = {1,1,1,0};
       };
       class EtatActuel : Life_RscText
       {
           idc = 5428;
           colortext[] = {0,0,0,1};
           x = 0.669791666666667 * safezoneW + safezoneX;
           y = 0.297134218289086 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.121875 * safezoneW;
           colorshadow[] = {1,1,1,0};
           text = "";
           sizeEx = 0.045;
       };
       class Prixcreermodif : Life_RscText
       {
           idc = 5427;
           colortext[] = {0,0,0,1};
           x = 0.728125 * safezoneW + safezoneX;
           y = 0.245821042281219 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.0640625 * safezoneW;
           colorshadow[] = {1,1,1,0};
           text = "";
           sizeEx = 0.045;
       };
   };
};
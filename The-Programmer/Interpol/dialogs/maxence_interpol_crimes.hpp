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
class maxence_interpol_crimes {
   idd = 5300;
   name = "maxence_interpol_crimes";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = -1;
           x = 0.318229166666667 * safezoneW + safezoneX;
           y = 0.171484759095379 * safezoneH + safezoneY;
           w = 0.352083333333333 * safezoneW;
           h = 0.0281219272369715 * safezoneH;
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
           x = 0.317708333333333 * safezoneW + safezoneX;
           y = 0.202556538839725 * safezoneH + safezoneY;
           w = 0.352604166666667 * safezoneW;
           h = 0.513128810226155 * safezoneH;
       };
       class Title : Life_RscTitle
       {
           colorbackground[] = {0, 0, 0, 0};
           idc = 5301;
           text = "";
           x = 0.318229166666667 * safezoneW + safezoneX;
           y = 0.172074729596853 * safezoneH + safezoneY;
           w = 0.352604166666667 * safezoneW;
           h = 0.0265486725663714 * safezoneH;
       };
       class PlayerCrimesTitle : Life_RscText
       {
           idc = 5302;
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           text = "";
           sizeex = 0.04;
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.318180924287119 * safezoneH + safezoneY;
           w = 0.17 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class CrimesTitle : Life_RscText
       {
           idc = 5303;
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           text = "";
           sizeex = 0.04;
           x = 0.4940625 * safezoneW + safezoneX;
           y = 0.219272369714848 * safezoneH + safezoneY;
           w = 0.17 * safezoneW;
           h = 0.0248475909537857 * safezoneH;
       };
       class idtxt : Life_RscText
       {
           idc = 5304;
           text = "Interpol ID :";
           sizeex = 0.04;
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.209237954768928 * safezoneH + safezoneY;
           w = 0.0734375 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class prenomtxt : Life_RscText
       {
           idc = 5305;
           text = "";
           sizeex = 0.04;
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.236253687315634 * safezoneH + safezoneY;
           w = 0.0734375 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class nomtxt : Life_RscText
       {
           idc = 5306;
           text = "";
           sizeex = 0.04;
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.263318584070797 * safezoneH + safezoneY;
           w = 0.0734375 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class nom : Life_RscText
       {
           idc = 5308;
           text = "";
           sizeex = 0.04;
           x = 0.395572916666667 * safezoneW + safezoneX;
           y = 0.263318584070797 * safezoneH + safezoneY;
           w = 0.0856770833333333 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class prenom : Life_RscText
       {
           idc = 5309;
           text = "";
           sizeex = 0.04;
           x = 0.395572916666667 * safezoneW + safezoneX;
           y = 0.2357866273353 * safezoneH + safezoneY;
           w = 0.0856770833333333 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class id : Life_RscText
       {
           idc = 5310;
           text = "";
           sizeex = 0.04;
           x = 0.396223958333333 * safezoneW + safezoneX;
           y = 0.209237954768928 * safezoneH + safezoneY;
           w = 0.0856770833333333 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class numbertxt : Life_RscText
       {
           idc = 5317;
           text = "";
           sizeex = 0.04;
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.289867256637168 * safezoneH + safezoneY;
           w = 0.0734375 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class number : Life_RscText
       {
           idc = 5318;
           text = "";
           sizeex = 0.04;
           x = 0.395703125 * safezoneW + safezoneX;
           y = 0.289867256637168 * safezoneH + safezoneY;
           w = 0.0856770833333333 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
   };
   class controls
   {
       class PlayerCrimesList : Life_RscListBox
       {
           idc = 5311;
           text = "";
           sizeex = 0.033;
           onlbselchanged = "[_this] spawn max_interpol_fnc_interpolLbChangedCrimes;";
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.345132743362832 * safezoneH + safezoneY;
           w = 0.17 * safezoneW;
           h = 0.301868239921337 * safezoneH;
       };
       class CrimesList : Life_RscListBox
       {
           idc = 5312;
           text = "";
           sizeex = 0.033;
           x = 0.4940625 * safezoneW + safezoneX;
           y = 0.24403343166175 * safezoneH + safezoneY;
           w = 0.17 * safezoneW;
           h = 0.350853490658801 * safezoneH;
       };
       class ButtonAdd : Life_RscButtonMenu
       {
           idc = 5313;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] call max_interpol_fnc_interpolAddCrime;";
           x = 0.585208333333333 * safezoneW + safezoneX;
           y = 0.664468043264503 * safezoneH + safezoneY;
           w = 0.0799999999999999 * safezoneW;
           h = 0.0218643067846613 * safezoneH;
           class Attributes {align = "center";};
       };
       class ButtonRemove : Life_RscButtonMenu
       {
           idc = 5314;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] call max_interpol_fnc_interpolDeleteCrime;";
           x = 0.498958333333334 * safezoneW + safezoneX;
           y = 0.664468043264503 * safezoneH + safezoneY;
           w = 0.0799999999999999 * safezoneW;
           h = 0.0218643067846613 * safezoneH;
           class Attributes {align = "center";};
       };
       class ButtonClose : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.318229166666667 * safezoneW + safezoneX;
           y = 0.718702064896755 * safezoneH + safezoneY;
           w = 0.0838541666666667 * safezoneW;
           h = 0.0218643067846613 * safezoneH;
           class Attributes {align = "center";};
       };
       class status : Life_RscButtonMenu
       {
           idc = 5315;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "";
           x = 0.4115625 * safezoneW + safezoneX;
           y = 0.664468043264503 * safezoneH + safezoneY;
           w = 0.0799999999999998 * safezoneW;
           h = 0.0218643067846613 * safezoneH;
           class Attributes {align = "center";};
       };
       class sendmsg : Life_RscButtonMenu
       {
           idc = 5316;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] spawn max_interpol_fnc_interpolSendMSG;";
           x = 0.322916666666667 * safezoneW + safezoneX;
           y = 0.664468043264503 * safezoneH + safezoneY;
           w = 0.0799999999999998 * safezoneW;
           h = 0.0218643067846613 * safezoneH;
           class Attributes {align = "center";};
       };
       class customreasontxt : Life_RscText
       {
           idc = 5319;
           text = "";
           sizeex = 0.04;
           x = 0.4940625 * safezoneW + safezoneX;
           y = 0.595668633235005 * safezoneH + safezoneY;
           w = 0.17 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class customreason : Life_RscEdit
       {
           idc = 5320;
           text = "";
           sizeex = 0.04;
           x = 0.4940625 * safezoneW + safezoneX;
           y = 0.621234021632252 * safezoneH + safezoneY;
           w = 0.1184375 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
       class customprice : Life_RscEdit
       {
           idc = 5321;
           text = "0";
           sizeex = 0.04;
           x = 0.612135416666667 * safezoneW + safezoneX;
           y = 0.621234021632252 * safezoneH + safezoneY;
           w = 0.0519270833333334 * safezoneW;
           h = 0.025968534906588 * safezoneH;
       };
   };
};

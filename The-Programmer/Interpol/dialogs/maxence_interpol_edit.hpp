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
class maxence_interpol_edit {
   idd = 5100;
   name = "maxence_interpol_edit";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = 5110;
           text = "";
           x = 0.341145833333333 * safezoneW + safezoneX;
           y = 0.160264900662252 * safezoneH + safezoneY;
           w = 0.314583333333333 * safezoneW;
           h = 0.023273415326395 * safezoneH;
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
           x = 0.341666666666667 * safezoneW + safezoneX;
           y = 0.186289498580889 * safezoneH + safezoneY;
           w = 0.3140625 * safezoneW;
           h = 0.636794701986755 * safezoneH;
       };
       class visage : Life_RscPicture
       {
           idc = -1;
           text = "The-Programmer\Interpol\textures\visage.paa";
           x = 0.593229166666667 * safezoneW + safezoneX;
           y = 0.190009460737938 * safezoneH + safezoneY;
           w = 0.0583333333333333 * safezoneW;
           h = 0.115354777672658 * safezoneH;
       };
   };
   class controls
   {
       class ADRESSETXT : Life_RscText
       {
           idc = 5114;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.341565752128666 * safezoneH + safezoneY;
           w = 0.0592708333333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class PRENOMTXT : Life_RscText
       {
           idc = 5115;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.242228003784295 * safezoneH + safezoneY;
           w = 0.0592708333333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class NOMTXT : Life_RscText
       {
           idc = 5116;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.208202459791864 * safezoneH + safezoneY;
           w = 0.0592708333333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class PRENOM : Life_RscEdit
       {
           idc = 5102;
           text = "";
           sizeex = 0.045;
           x = 0.4059375 * safezoneW + safezoneX;
           y = 0.242228003784295 * safezoneH + safezoneY;
           w = 0.18 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class NAISSANCETXT : Life_RscText
       {
           idc = 5117;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.308453169347209 * safezoneH + safezoneY;
           w = 0.148854166666667 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class NOM : Life_RscEdit
       {
           idc = 5103;
           text = "";
           sizeex = 0.045;
           x = 0.4059375 * safezoneW + safezoneX;
           y = 0.208202459791864 * safezoneH + safezoneY;
           w = 0.18 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class Close : Life_RscButtonMenu
       {
           idc = -1;
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.571875 * safezoneW + safezoneX;
           y = 0.829794701986755 * safezoneH + safezoneY;
           w = 0.0838541666666667 * safezoneW;
           h = 0.0226177861873226 * safezoneH;
           class Attributes {align = "center";};
       };
       class Valider : Life_RscButtonMenu
       {
           idc = 5118;
           text = "";
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
           onbuttonclick = "[] spawn max_interpol_fnc_interpolEdit;";
           x = 0.4275 * safezoneW + safezoneX;
           y = 0.788079470198675 * safezoneH + safezoneY;
           w = 0.15 * safezoneW;
           h = 0.0251655629139073 * safezoneH;
           class Attributes {align = "center";};
       };
       class ADRESSE : Life_RscEdit
       {
           idc = 5104;
           text = "";
           sizeex = 0.045;
           x = 0.4059375 * safezoneW + safezoneX;
           y = 0.341565752128666 * safezoneH + safezoneY;
           w = 0.245104166666667 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class VILLETXT : Life_RscText
       {
           idc = 5119;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.374678334910123 * safezoneH + safezoneY;
           w = 0.0592708333333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class VILLE : Life_RscEdit
       {
           idc = 5105;
           text = "";
           sizeex = 0.045;
           x = 0.4059375 * safezoneW + safezoneX;
           y = 0.374678334910123 * safezoneH + safezoneY;
           w = 0.145104166666667 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class NUMEROTXT : Life_RscText
       {
           idc = 5120;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.426712393566698 * safezoneH + safezoneY;
           w = 0.118125 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class NUMERO : Life_RscEdit
       {
           idc = 5106;
           text = "";
           sizeex = 0.045;
           x = 0.46546875 * safezoneW + safezoneX;
           y = 0.426712393566698 * safezoneH + safezoneY;
           w = 0.145104166666667 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class YEUXTXT : Life_RscText
       {
           idc = 5121;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.484422894985809 * safezoneH + safezoneY;
           w = 0.118645833333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class YEUX : Life_RscCombo
       {
           idc = 5107;
           text = "";
           sizeex = 0.035;
           onlbselchanged = "";
           x = 0.46546875 * safezoneW + safezoneX;
           y = 0.484422894985809 * safezoneH + safezoneY;
           w = 0.15328125 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class AJOUTS : Life_RscEdit
       {
           idc = 5108;
           text = "";
           sizeex = 0.045;
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.564839167455061 * safezoneH + safezoneY;
           w = 0.304583333333333 * safezoneW;
           h = 0.213779564806055 * safezoneH;
           linespacing = 1;
           style = 0 + 16 + 0x200;
       };
       class DETAILSTXT : Life_RscText
       {
           idc = 5122;
           text = "";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.531726584673605 * safezoneH + safezoneY;
           w = 0.130625 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class IDTXT : Life_RscText
       {
           idc = -1;
           text = "Interpol ID :";
           x = 0.3475 * safezoneW + safezoneX;
           y = 0.27344843897824 * safezoneH + safezoneY;
           w = 0.0592708333333333 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class ID : Life_RscText
       {
           idc = 5109;
           text = "";
           x = 0.4059375 * safezoneW + safezoneX;
           y = 0.27344843897824 * safezoneH + safezoneY;
           w = 0.118125 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class JOUR : Life_RscCombo
       {
           idc = 5111;
           text = "";
           sizeex = 0.035;
           onlbselchanged = "";
           x = 0.496796875 * safezoneW + safezoneX;
           y = 0.308453169347209 * safezoneH + safezoneY;
           w = 0.045 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class MOIS : Life_RscCombo
       {
           idc = 5112;
           text = "";
           sizeex = 0.035;
           onlbselchanged = "";
           x = 0.541145833333333 * safezoneW + safezoneX;
           y = 0.308453169347209 * safezoneH + safezoneY;
           w = 0.045 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
       class ANNEE : Life_RscCombo
       {
           idc = 5113;
           text = "";
           sizeex = 0.035;
           onlbselchanged = "";
           x = 0.585377604166667 * safezoneW + safezoneX;
           y = 0.308453169347209 * safezoneH + safezoneY;
           w = 0.0656640625 * safezoneW;
           h = 0.0264238410596026 * safezoneH;
       };
   };
};

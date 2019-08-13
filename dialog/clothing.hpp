class Life_Clothing {
   idd = 3100;
   name = "Life_Clothing";
   movingenable = 1;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscStructuredText
       {
            text = "Clothes Shop";
            colorbackground[] = {0.11,0.11,0.11,1};
            idc = -1;
            x = 0.00744809 * safezoneW + safezoneX;
            y = 0.137104 * safezoneH + safezoneY;
            w = 0.218912 * safezoneW;
            h = 0.0439874 * safezoneH;
		    class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
       };
	   
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0, 0, 0, 0.7};
           idc = -1;
		   x = 0.00744809 * safezoneW + safezoneX;
		   y = 0.181092 * safezoneH + safezoneY;
		   w = 0.218912 * safezoneW;
		   h = 0.637817 * safezoneH;
       };
   };
   class controls
   {
       class ClothingList : Life_RscListBox
       {
            idc = 3101;
            text = "";
            sizeex = 0.035;
            onlbselchanged = "[_this] call life_fnc_changeClothes;";
            x = 0.0173986 * safezoneW + safezoneX;
            y = 0.203085 * safezoneH + safezoneY;
            w = 0.198438 * safezoneW;
            h = 0.433627 * safezoneH;
		    class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
       };
       class PriceTag : Life_RscStructuredText
       {
            idc = 3102;
            sizeex = 0.035;
            x = 0.126855 * safezoneW + safezoneX;
            y = 0.653956 * safezoneH + safezoneY;
            w = 0.090625 * safezoneW;
            h = 0.0399999 * safezoneH;
		    class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
       };
       class TotalPrice : Life_RscStructuredText
       {
            idc = 3106;
            sizeex = 0.035;
            x = 0.0173986 * safezoneW + safezoneX;
            y = 0.653956 * safezoneH + safezoneY;
            w = 0.090625 * safezoneW;
            h = 0.0399999 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
       };
       class FilterList : Life_RscCombo
       {
           idc = 3105;
           colorbackground[] = {0,0,0,0.7};
           onlbselchanged = "_this call life_fnc_clothingFilter";
           x = 0.0171875 * safezoneW + safezoneX;
           y = 0.696121927236972 * safezoneH + safezoneY;
           w = 0.1984375 * safezoneW;
           h = 0.035 * safezoneH;
       };
       class CloseButtonKey : Life_RscButtonMenu
       {
            text = "$STR_Global_Close";
            onbuttonclick = "closeDialog 0; [] call life_fnc_playerSkins;";
            x = 0.125 * safezoneW + safezoneX;
            y = 0.749579020648968 * safezoneH + safezoneY;
            w = 0.090625 * safezoneW;
            h = 0.04 * safezoneH;
            colorbackground[] = {0.345,0.345,0.345,1};
		    class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
       };
       class BuyButtonKey : Life_RscButtonMenu
       {
           text = "$STR_Global_Buy";
           onbuttonclick = "[] call life_fnc_buyClothes;";
           x = 0.0177083333333333 * safezoneW + safezoneX;
           y = 0.749579020648968 * safezoneH + safezoneY;
           w = 0.0947916666666667 * safezoneW;
           h = 0.04 * safezoneH;
		   colorbackground[] = {0.345,0.345,0.345,1};
		    class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
       };
       class viewAngle : life_RscXSliderH
       {
           color[] = {1, 1, 1, 0.45};
           coloractive[] = {1, 1, 1, 0.65};
           idc = 3107;
           text = "";
           onsliderposchanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
           tooltip = "";
           x = 0.25 * safezoneW + safezoneX;
           y = 0.93 * safezoneH + safezoneY;
           w = 0.5 * safezoneW;
           h = 0.02 * safezoneH;
       };	   
	   class Life_BarraEstetica: Life_RscStructuredText
	   {
			idc = -1;

			x = 0.00744809 * safezoneW + safezoneX;
			y = 0.81286 * safezoneH + safezoneY;
			w = 0.218912 * safezoneW;
			h = 0.0439873 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
	   };
   };
};

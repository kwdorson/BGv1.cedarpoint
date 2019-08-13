class life_weapon_shop {
    idd = 38400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscStructuredText 
		{
			colorBackground[] = {0.11,0.11,0.11,1};            
			idc = -1;
            text = "Inventory";
			x = 0.00744809 * safezoneW + safezoneX;
			y = 0.126046 * safezoneH + safezoneY;
			w = 0.208961 * safezoneW;
			h = 0.0219973 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
			x = 0.00744809 * safezoneW + safezoneX;
			y = 0.148044 * safezoneH + safezoneY;
			w = 0.208961 * safezoneW;
			h = 0.626922 * safezoneH;
        };

        class itemInfo: Life_RscStructuredText {
            idc = 38404;
            text = "";
            sizeEx = 0.035;
			x = 0.0870524 * safezoneW + safezoneX;
			y = 0.642982 * safezoneH + safezoneY;
			w = 0.119407 * safezoneW;
			h = 0.0769905 * safezoneH;
			class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
        };

        class FilterList: Life_RscCombo {
            idc = 38402;
            onLBSelChanged = "_this call life_fnc_weaponShopFilter";
			x = 0.0870524 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.119407 * safezoneW;
			h = 0.0192476 * safezoneH;
        };
    };

    class controls {
        class itemList: Life_RscListBox {
            idc = 38403;
            onLBSelChanged = "_this call life_fnc_weaponShopSelection";
            sizeEx = 0.035;
			x = 0.0124234 * safezoneW + safezoneX;
			y = 0.159042 * safezoneH + safezoneY;
			w = 0.199011 * safezoneW;
			h = 0.439946 * safezoneH;
        };

        class ButtonBuySell: Life_RscButtonMenu {
            idc = 38405;
            text = "$STR_Global_Buy";
            onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
			x = 0.0124234 * safezoneW + safezoneX;
			y = 0.609986 * safezoneH + safezoneY;
			w = 0.0621909 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.345,0.345,0.345,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "closeDialog 0;";
			x = 0.201484 * safezoneW + safezoneX;
			y = 0.126046 * safezoneH + safezoneY;
			w = 0.0149258 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class ButtonMags: Life_RscButtonMenu {
            idc = 38406;
            text = "$STR_Global_Mags";
            onButtonClick = "_this call life_fnc_weaponShopMags; _this call life_fnc_weaponShopFilter";
			x = 0.0124234 * safezoneW + safezoneX;
			y = 0.653981 * safezoneH + safezoneY;
			w = 0.0621909 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.345,0.345,0.345,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class ButtonAccs: Life_RscButtonMenu {
            idc = 38407;
            text = "$STR_Global_Accs";
            onButtonClick = "_this call life_fnc_weaponShopAccs; _this call life_fnc_weaponShopFilter";
			x = 0.0124234 * safezoneW + safezoneX;
			y = 0.697975 * safezoneH + safezoneY;
			w = 0.0621909 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.345,0.345,0.345,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };
		class Life_Barra1: Life_RscText
		{
			idc = 1010;
			x = 0.00744809 * safezoneW + safezoneX;
			y = 0.763967 * safezoneH + safezoneY;
			w = 0.208961 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
		};
    };
};
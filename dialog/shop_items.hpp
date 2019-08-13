class shops_menu {
    idd = 2400;
    name= "shops_menu";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['shops_menu',_this select 0]";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscStructuredText {
            idc = -1;
			text = "Store Inventory"; //--- ToDo: Localize;
			x = 0.00236615 * safezoneW + safezoneX;
			y = 0.0601264 * safezoneH + safezoneY;
			w = 0.159209 * safezoneW;
			h = 0.0219937 * safezoneH;
	        colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
        };

		class Life_Barra1: Life_RscStructuredText
		{
			idc = -1;
			x = 0.00236615 * safezoneW + safezoneX;
			y = 0.862896 * safezoneH + safezoneY;
			w = 0.159534 * safezoneW;
			h = 0.0239991 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
		};

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
			x = 0.00236615 * safezoneW + safezoneX;
			y = 0.0821201 * safezoneH + safezoneY;
			w = 0.159209 * safezoneW;
			h = 0.783792 * safezoneH;
        };

        class vasgText: Life_RscStructuredText {
            idc = -1;
	        text = "Personal Inventory"; //--- ToDo: Localize;
			x = 0.00236615 * safezoneW + safezoneX;
			y = 0.456013 * safezoneH + safezoneY;
			w = 0.159209 * safezoneW;
			h = 0.0219937 * safezoneH;
	        colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
        };
    };

    class controls {
        class itemList: Life_RscListBox {
            idc = 2401;
            text = "";
			sizeEx = 0.03;
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.0931169 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.274921 * safezoneH;
	        colorBackground[] = {-1,-1,-1,-1};
        };

        class pItemlist: Life_RscListBox {
            idc = 2402;
            text = "";
			sizeEx = 0.03;
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.263924 * safezoneH;
	        colorBackground[] = {-1,-1,-1,-1};
        };

        class buyEdit: Life_RscEdit {
            idc = 2404;
	
	        text = "1"; //--- ToDo: Localize;
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.379035 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.0219937 * safezoneH;
	        colorBackground[] = {-1,-1,-1,-1};
        };

        class sellEdit: Life_RscEdit {
            idc = 2405;
	       
		    text = "1"; //--- ToDo: Localize;
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.763924 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.0219937 * safezoneH;
	        colorBackground[] = {-1,-1,-1,-1};
        };

		class ButtonClose: Life_RscButtonMenu {
            idc = -1;
	        text = "X"; //--- ToDo: Localize;
            onButtonClick = "closeDialog 0;";
			x = 0.145914 * safezoneW + safezoneX;
			y = 0.0601264 * safezoneH + safezoneY;
			w = 0.0143548 * safezoneW;
			h = 0.0219937 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class ButtonBuy: Life_RscButtonMenu {
            idc = -1;
	        text = "Buy"; //--- ToDo: Localize;
	        colorBackground[] = {0.345,0.345,0.345,1};
            onButtonClick = "[] call life_fnc_virt_buy;";
			x = 0.00845703 * safezoneW + safezoneX;
			y = 0.412025 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.0219937 * safezoneH;
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class ButtonSell: Life_RscButtonMenu {
            idc = -1;
	        text = "Sell"; //--- ToDo: Localize;
	        colorBackground[] = {0.345,0.345,0.345,1};
            onButtonClick = "[] call life_fnc_virt_sell";
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.796915 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.0219937 * safezoneH;
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

		class ButtonSellAll: Life_RscButtonMenu {
            idc = -1;
	        text = "Sell ​​Everything"; //--- ToDo: Localize;
	        colorBackground[] = {0.345,0.345,0.345,1};
            onButtonClick = "[] call life_fnc_virt_sellAll";
			x = 0.00715109 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.148333 * safezoneW;
			h = 0.0219937 * safezoneH;
			class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };
    };
};
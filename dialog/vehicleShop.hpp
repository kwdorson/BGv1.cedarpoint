class Life_vehicle_shop {
    idd = 2300;
    name= "life_impound_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            idc = -1;
			x = 0.340791 * safezoneW + safezoneX;
			y = 0.225034 * safezoneH + safezoneY;
			w = 0.318417 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
			x = 0.340791 * safezoneW + safezoneX;
			y = 0.247031 * safezoneH + safezoneY;
			w = 0.318417 * safezoneW;
			h = 0.505937 * safezoneH;
        };
    };

    class controls {
        class Title: Life_RscStructuredText {
            colorBackground[] = {0, 0, 0, 0};
            idc = 2301;
            text = "";
			x = 0.340791 * safezoneW + safezoneX;
			y = 0.225034 * safezoneH + safezoneY;
			w = 0.318417 * safezoneW;
			h = 0.0219973 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                align = "center";
                valign = "middle";
            };
        };

        class VehicleList: Life_RscListBox {
            idc = 2302;
            text = "";
            sizeEx = 0.035;
            colorBackground[] = {0,0,0,0};
            onLBSelChanged = "[_this] call life_fnc_vehicleColorList";
			x = 0.350742 * safezoneW + safezoneX;
			y = 0.269029 * safezoneH + safezoneY;
			w = 0.298516 * safezoneW;
			h = 0.351956 * safezoneH;
        };

        class ColorList: Life_RscCombo {
            idc = 2303;
			x = 0.350742 * safezoneW + safezoneX;
			y = 0.631984 * safezoneH + safezoneY;
			w = 0.298516 * safezoneW;
			h = 0.0219973 * safezoneH;
        };

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "closeDialog 0;";
			x = 0.644283 * safezoneW + safezoneX;
			y = 0.225034 * safezoneH + safezoneY;
			w = 0.0149258 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
            class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class GetCar: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Buy";
			colorBackground[] = {0.345,0.345,0.345,1};
            onButtonClick = "[] spawn life_fnc_vehicleShopBuy";
			x = 0.350742 * safezoneW + safezoneX;
			y = 0.675978 * safezoneH + safezoneY;
			w = 0.0696538 * safezoneW;
			h = 0.0219973 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };

        class GetCarGarage: Life_RscButtonMenu {
            idc = -1;
			colorBackground[] = {0.345,0.345,0.345,1};
            text = "$STR_Global_BuyPerm";
            onButtonClick = "[] spawn life_fnc_vehicleShopBuySave";
			x = 0.579604 * safezoneW + safezoneX;
			y = 0.675978 * safezoneH + safezoneY;
			w = 0.0696538 * safezoneW;
			h = 0.0219973 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                align = "center";
            };
        };
		class Life_Barra1: Life_RscText
		{
			idc = -1;
			x = 0.340791 * safezoneW + safezoneX;
			y = 0.752969 * safezoneH + safezoneY;
			w = 0.318417 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
		};
    };
};
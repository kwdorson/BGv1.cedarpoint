class Life_Vehicle_Shop_v2 {
    idd = 2300;
    name="life_vehicle_shop";
    movingEnabled = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";  

    class controlsBackground {
        class Life_RscTitleBackground : Life_RscText {
            idc = -1;
			text = "";
			x = 0.300989 * safezoneW + safezoneX;
			y = 0.203037 * safezoneH + safezoneY;
			w = 0.398022 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
        };

        class MainBackground : Life_RscText {
            colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.300989 * safezoneW + safezoneX;
			y = 0.225034 * safezoneH + safezoneY;
			w = 0.398022 * safezoneW;
			h = 0.582928 * safezoneH;
        };

        class VehicleTitleBox : Life_RscText {
            idc = -1;
            text = "$STR_GUI_ShopStock";
			x = 0.31094 * safezoneW + safezoneX;
			y = 0.236033 * safezoneH + safezoneY;
			w = 0.169159 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
				font = RobotoCondensed;
			};
        };

        class VehicleInfoHeader : Life_RscText {
            idc = 2330;
            text = "$STR_GUI_VehInfo";
			colorBackground[] = {0.11,0.11,0.11,1};
			x = 0.519901 * safezoneW + safezoneX;
			y = 0.236033 * safezoneH + safezoneY;
			w = 0.169159 * safezoneW;
			h = 0.0219973 * safezoneH;
			class Attributes {
				font = RobotoCondensed;
			};
        };

        class CloseBtn : Life_RscButtonMenu {
            idc = -1;
            text = "X";
            onButtonClick = "closeDialog 0;";
			x = 0.684085 * safezoneW + safezoneX;
			y = 0.203037 * safezoneH + safezoneY;
			w = 0.0149258 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
			class Attributes {
				font = RobotoCondensed;
				align = "center";
				valign = "middle";
			};  
        };

        class RentCar : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_RentVeh";
            onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.31094 * safezoneW + safezoneX;
			y = 0.763967 * safezoneH + safezoneY;
			w = 0.0621909 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.345,0.345,0.345,1};
			class Attributes {
				font = RobotoCondensed;
			};
        };

        class BuyCar : life_RscButtonMenu {
            idc = 2309;
            text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.420396 * safezoneW + safezoneX;
			y = 0.763967 * safezoneH + safezoneY;
			w = 0.0621909 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.345,0.345,0.345,1};
			class Attributes {
				font = RobotoCondensed;
			};
        };
    };

    class controls {
        class VehicleList : Life_RscListBox {
            idc = 2302;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			x = 0.31094 * safezoneW + safezoneX;
			y = 0.25803 * safezoneH + safezoneY;
			w = 0.169159 * safezoneW;
			h = 0.439946 * safezoneH;
			class Attributes {
				font = RobotoCondensed;
			};
	    };

        class ColorList : Life_RscCombo {
            idc = 2304;
			x = 0.31094 * safezoneW + safezoneX;
			y = 0.719973 * safezoneH + safezoneY;
			w = 0.169159 * safezoneW;
			h = 0.0219973 * safezoneH;
        };

        class vehicleInfomationList : Life_RscStructuredText {
            idc = 2303;
            text = "";
            sizeEx = 0.035;
			x = 0.519901 * safezoneW + safezoneX;
			y = 0.25803 * safezoneH + safezoneY;
			w = 0.169159 * safezoneW;
			h = 0.439946 * safezoneH;
			class Attributes {
				font = RobotoCondensed;
			};
        };
		
		class Life_Barra1: Life_RscText
		{
			idc = -1;
			x = 0.300989 * safezoneW + safezoneX;
			y = 0.807962 * safezoneH + safezoneY;
			w = 0.398022 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0.11,0.11,0.11,1};
		};
    };
};

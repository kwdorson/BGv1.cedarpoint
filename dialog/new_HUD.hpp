////////////////////////////////////////////////////////
// Authors: Kureo & Zalac                             //
// Credit: Danny									  //
////////////////////////////////////////////////////////

class new_HUD {
	idd = 20099;
	duration = 1e+1000;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	class controlsBackground {

		// HUD Dx
		
		
		class Background: Life_RscBackground
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.5};
			colorBar[] = {1,0,0,1};
			colorFrame[] = {0,0,0,1};
			x = 0.917656 * safezoneW + safezoneX;
			y = 0.986 * safezoneH + safezoneX;
			w = 0.0825 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class HealthFrame: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0.8};
			idc = -1;
			text = "";
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class FoodFrame: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0.8};
			idc = -1;
			text = "";
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WaterFrame: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0.8};
			idc = -1;
			text = "";
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Health_Icon: Life_RscPicture {
			colorBackground[] = {0.02,0.06,0.06,1};
			idc = -1;
			text = "images\icons\health.paa";
			x = 0.922813  * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.03;	h = 0.04;
		};
		class Food_Icon: Life_RscPicture {
			idc = -1;
			text = "images\icons\food.paa";
			x = 0.922813  * safezoneW + safezoneX;
			y = 0.864 * safezoneH + safezoneY;
			w = 0.03;	h = 0.04;
		};
		class Water_Icon: Life_RscPicture {
			colorBackground[] = {0.02,0.06,0.06,1};
			idc = -1;
			text = "images\icons\water.paa";
			x = 0.922813  * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.03;	h = 0.04;
		};
		class Health_Hud: Life_RscProgress {
			idc = 1;
			onLoad = "(_this select 0) progressSetPosition 1";
			colorBar[] = {1,0,0,1};
			colorFrame[] = {0,0,0,1};
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Food_Hud: Life_RscProgress {
			idc = 2;
			onLoad = "(_this select 0) progressSetPosition 1";
			colorBar[] = {1,0.4,0,1};
			colorFrame[] = {0,0,0,1};
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Water_Hud: Life_RscProgress {
			idc = 3;
			onLoad = "(_this select 0) progressSetPosition 1";
			colorBar[] = {0.6,0.8,0.9,1};
			colorFrame[] = {0,0,0,1};
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls {

		class Health_Text: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0};
			idc = 4;
			text = "100%";
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.8344 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class Food_Text: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0};
			idc = 5;
			text = "100%";
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.8674 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class Water_Text: Life_RscText {
			colorBackground[] = {0.06,0.06,0.06,0};
			idc = 6;
			text = "100%";
			x = 0.958906 * safezoneW + safezoneX;
			y = 0.9004 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class ThreatLevel_Text: Life_RscText
		{
        idc = 1251;
        text = "THREAT LEVEL";
			x = 0.936218 * safezoneW + safezoneX;
			y = 0.9752 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.063,0.776,0,1};
			font = "PuristaSemiBold";
			SizeEx = 0.035;
		};
	};
};

// Format accanto ai civili_info
//class civili_icon: Life_RscPicture {
//			colorBackground[] = {0.02,0.06,0.06,1};
//			idc = -1;
//			text = "icons\civili.paa";
//			x = 0.159687 * safezoneW + safezoneX;
//			y = 0.973 * safezoneH + safezoneY;
//			w = 0.01235 * safezoneW;
//			h = 0.022 * safezoneH;
//		};
//		class civili_info: Life_RscText {
//			idc = 12;
//			text = "4"; 
//			x = 0.172 * safezoneW + safezoneX;
//			y = 0.973 * safezoneH + safezoneY;
//			w = 0.0360937 * safezoneW;
//			h = 0.02 * safezoneH;
//			colorText[] = {1,1,1,1};
//			colorBackground[] = {0.06,0.06,0.06,0.8};
//		};	

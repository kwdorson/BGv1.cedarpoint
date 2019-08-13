/*
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
class ui_Serverteamausweis
{
	name = "ui_Serverteamausweis";
	idd = 11900;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['ui_Serverteamausweis',_this select 0]";
	onUnload="uiNamespace setVariable ['ui_Serverteamausweis',nil]";
	class Objects {};

	class controls 
	{
		class HG_Bild: Life_RscPicture
		{
			idc = -1;

			text = "images\Ausweis\Serverteamausweis.paa";
			x = 0.680469 * safezoneW + safezoneX;
			y = (0.687 - 0.0330033) * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class Anzeige_Spielername: Life_RscStructuredText
		{
			idc = 1100;

			x = 0.732031 * safezoneW + safezoneX;
			y = (0.742 - 0.0330033) * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Anzeige_Serverteamname: Life_RscStructuredText
		{
			idc = 1101;

			x = 0.732031 * safezoneW + safezoneX;
			y = (0.852 - 0.0330033) * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};
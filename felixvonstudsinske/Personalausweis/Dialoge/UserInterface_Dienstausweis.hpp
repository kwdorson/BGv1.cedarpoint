/*
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
class ui_Dienstausweis
{
	name = "ui_Dienstausweis";
	idd = 10540;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['ui_Dienstausweis',_this select 0]";
	onUnload="uiNamespace setVariable ['ui_Dienstausweis',nil]";
	class Objects {};

	class controls 
	{
		class Persobild: Life_RscPicture
		{
			idc = 1200;

			text = "";
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class Anzeige_Spielername: Life_RscStructuredText
		{
			idc = 9902;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.208299 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class Anzeige_Geburtsdatum: Life_RscStructuredText
		{
			idc = 9903;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			x = 0.757813 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Rang: Life_RscStructuredText
		{
			idc = 9909;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.208299 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class Text_Ausweisnummer: Life_RscStructuredText
		{
			idc = 1001;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "card number"; //--- ToDo: Localize;
			x = 0.815564 * safezoneW + safezoneX;
			y = 0.9378 * safezoneH + safezoneY;
			w = 0.162942 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.032;
		};
		class Potraitbild: Life_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.688719 * safezoneW + safezoneX;
			y = 0.7376 * safezoneH + safezoneY;
			w = 0.0598124 * safezoneW;
			h = 0.1254 * safezoneH;
		};
	};
};
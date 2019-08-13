/*
	Hinweis/additional information - ausgenommen siehe auf www.von-studsinske.de:
	DE:	Du darfst meine Scripts/Funktionen/Dateien/Bilder/usw. nicht ohne meine Erlaubnis nutzen!
	EN: You are not allowed to use my data/scripts/functions/mission/pictures/etc. without my permission!
*/
class ui_Personalausweis
{
	name = "ui_Personalausweis";
	idd = 9900;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['ui_Personalausweis',_this select 0]";
	onUnload="uiNamespace setVariable ['ui_Personalausweis',nil]";
	class Objects {};

	class controls 
	{
		class Persobild: Life_RscPicture
		{
			idc = 1200;

			text = "images\Ausweis\Personalausweis.paa";
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class Anzeige_Spielername: Life_RscStructuredText
		{
			idc = 9902;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.754719 * safezoneW + safezoneX;
			y = 0.7596 * safezoneH + safezoneY;
			w = 0.0825097 * safezoneW;
			h = 0.0528 * safezoneH;
		};
		class Anzeige_Geburtsdatum: Life_RscStructuredText
		{
			idc = 9903;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.688719 * safezoneW + safezoneX;
			y = 0.8784 * safezoneH + safezoneY;
			w = 0.170149 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Anschrift: Life_RscStructuredText
		{
			idc = 9904;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.688719 * safezoneW + safezoneX;
			y = 0.9224 * safezoneH + safezoneY;
			w = 0.105196 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class Anzeige_Groesse: Life_RscStructuredText
		{
			idc = 9909;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.754719 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0722041 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Telefonnummer: Life_RscStructuredText
		{
			idc = 9905;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.875375 * safezoneW + safezoneX;
			y = 0.8784 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Staatsangehoerigkeit: Life_RscStructuredText
		{
			idc = 9906;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.7596 * safezoneH + safezoneY;
			w = 0.139209 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Geschlecht: Life_RscStructuredText
		{
			idc = 9908;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.841344 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Ausweisnummer: Life_RscStructuredText
		{
			idc = 1001;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "card number"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.6672 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Text_Ausstelldatum: Life_RscStructuredText
		{
			idc = 1002;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "date of issue"; //--- ToDo: Localize;
			x = 0.795969 * safezoneW + safezoneX;
			y = 0.9224 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Potraitbild: Life_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.692843 * safezoneW + safezoneX;
			y = 0.7354 * safezoneH + safezoneY;
			w = 0.0556874 * safezoneW;
			h = 0.1166 * safezoneH;
		};
	};
};
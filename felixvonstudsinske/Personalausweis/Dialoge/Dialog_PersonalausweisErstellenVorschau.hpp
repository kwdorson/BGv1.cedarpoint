class Dialog_PersonalausweisErstellenVorschau {
	idd = 9900;
	name = "Dialog_PersonalausweisErstellenVorschau";
	movingEnabled = 0;
	enableSimulation = 0;
	onLoad = "";
	onUnload = "";
	class controlsBackground {
		class HG: Life_RscText
		{
			idc = -1;

			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	class controls {
		class Persobild: Life_RscPicture
		{
			idc = 1200;
			text = "images\Ausweis\Personalausweis.paa";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.539 * safezoneH;
		};
		class Persoportrait: Life_RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.357688 * safezoneW + safezoneX;
			y = 0.4494 * safezoneH + safezoneY;
			w = 0.0556874 * safezoneW;
			h = 0.1166 * safezoneH;
		};
		class Anzeige_Spielername: Life_RscStructuredText
		{
			idc = 9902;
			sizeEx = 0.0325;
			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.4736 * safezoneH + safezoneY;
			w = 0.0825097 * safezoneW;
			h = 0.0528 * safezoneH;
		};
		class Anzeige_Geburtsdatum: Life_RscStructuredText
		{
			idc = 9903;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.353562 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.170149 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Anschrift: Life_RscStructuredText
		{
			idc = 9904;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.353563 * safezoneW + safezoneX;
			y = 0.6386 * safezoneH + safezoneY;
			w = 0.105196 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class Anzeige_Groesse: Life_RscStructuredText
		{
			idc = 9909;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.5418 * safezoneH + safezoneY;
			w = 0.0722041 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Telefonnummer: Life_RscStructuredText
		{
			idc = 9905;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Staatsangehoerigkeit: Life_RscStructuredText
		{
			idc = 9906;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.4736 * safezoneH + safezoneY;
			w = 0.139209 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Anzeige_Geschlecht: Life_RscStructuredText
		{
			idc = 9908;
			sizeEx = 0.0325;

			size ="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.5418 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Knopf_Beantragen: Life_RscButtonMenu
		{
			class Attributes {align = "center";};
			onButtonClick = "[] spawn life_fnc_PersoErstellenOK;";

			idc = 2400;
			text = "APPLY PERSONNEL CARD"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0.6,0,1};
			tooltip = "By clicking on this button, the identity card is requested and created."; //--- ToDo: Localize;
		};
		class Knopf_Zurueck: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			class Attributes {align = "center";};

			text = "BACK"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,1};
		};
		class Text_Ausweisnummer: Life_RscText
		{
			idc = 1001;
			text = "card number"; //--- ToDo: Localize;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.504125 * safezoneW + safezoneX;
			y = 0.3812 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Ausstelldatum: Life_RscText
		{
			idc = 1002;
			text = "date of issue"; //--- ToDo: Localize;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.6386 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
class Life_atm_management {
   idd = 2700;
   name = "Life_atm_management";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class Life_RscTitleBackground : Life_RscText
       {
            idc = -1;
            x = 0.340541 * safezoneW + safezoneX;
            y = 0.348144 * safezoneH + safezoneY;
            w = 0.318489 * safezoneW;
            h = 0.020991 * safezoneH;
           colorbackground[] = {0.11,0.11,0.11,1};
       };
       class MainBackground : Life_RscText
       {
           idc = -1;
           x = 0.340791 * safezoneW + safezoneX;
           y = 0.368038 * safezoneH + safezoneY;
           w = 0.318417 * safezoneW;
           h = 0.24193 * safezoneH;
           colorbackground[] = {0,0,0,0.7};
       };
   };
   class controls
   {
       class CashTitle : Life_RscStructuredText
       {
           idc = 2701;
		   x = 0.460198 * safezoneW + safezoneX;
		   y = 0.390032 * safezoneH + safezoneY;
		   w = 0.119407 * safezoneW;
		   h = 0.0769779 * safezoneH;
           colorbackground[] = {-1,-1,-1,-1};
		   class Attributes {
			   font = "PuristaMedium";
		   };
       };
       class Title : Life_RscStructuredText
       {
           colorbackground[] = {0, 0, 0, 0};
           idc = -1;
           text = "$STR_ATM_Title";
           x = 0.460198 * safezoneW + safezoneX;
           y = 0.345943 * safezoneH + safezoneY;
           w = 0.238813 * safezoneW;
           h = 0.0220081 * safezoneH;
           colortext[] = {0.95,0.95,0.95,1};
            class Attributes {
                font = "PuristaMedium";
                valing = "middle";
            };
       };
       class WithdrawButton : Life_RscButtonMenu
       {
           onbuttonclick = "[] call life_fnc_bankWithdraw";
           text = "$STR_ATM_Withdraw";
           idc = 1004;
           x = 0.58458 * safezoneW + safezoneX;
           y = 0.390032 * safezoneH + safezoneY;
           w = 0.0696538 * safezoneW;
           h = 0.0220082 * safezoneH;
           colortext[] = {1,1,1,1};
           colorbackground[] = {0.259,0.259,0.259,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class DepositButton : Life_RscButtonMenu
       {
           onbuttonclick = "[] call life_fnc_bankDeposit";
           text = "$STR_ATM_Deposit";
           idc = 1005;
           x = 0.58458 * safezoneW + safezoneX;
           y = 0.434019 * safezoneH + safezoneY;
           w = 0.0696538 * safezoneW;
           h = 0.0220082 * safezoneH;
           colortext[] = {1,1,1,1};
           colorbackground[] = {0.259,0.259,0.259,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class moneyEdit : Life_RscEdit
       {
           idc = 2702;
           text = "1";
		   x = 0.460198 * safezoneW + safezoneX;
		   y = 0.489003 * safezoneH + safezoneY;
		   w = 0.0796044 * safezoneW;
		   h = 0.0219937 * safezoneH;
           colorbackground[] = {-1,-1,-1,-1};
       };
       class PlayerList : Life_RscCombo
       {
           idc = 2703;
		   x = 0.460198 * safezoneW + safezoneX;
		   y = 0.532991 * safezoneH + safezoneY;
		   w = 0.0799062 * safezoneW;
		   h = 0.0220082 * safezoneH;
       };
       class TransferButton : Life_RscButtonMenu
       {
            onbuttonclick = "[] call life_fnc_bankTransfer";
            text = "$STR_ATM_Transfer";
            idc = 1008;
            x = 0.345285 * safezoneW + safezoneX;
            y = 0.533012 * safezoneH + safezoneY;
            w = 0.0696538 * safezoneW;
            h = 0.0220083 * safezoneH;
            colortext[] = {1,1,1,1};
            colorbackground[] = {0.259,0.259,0.259,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class GangWithdraw : TransferButton
       {
           idc = 2705;
           onbuttonclick = "[] call life_fnc_gangWithdraw";
           x = 0.345767 * safezoneW + safezoneX;
           y = 0.390032 * safezoneH + safezoneY;
           w = 0.0696538 * safezoneW;
           h = 0.0220082 * safezoneH;
           colortext[] = {1,1,1,1};
           colorbackground[] = {0.259,0.259,0.259,1};
           text = "$STR_ATM_WithdrawGang";
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class GangDeposit : TransferButton
       {
           idc = 2706;
           onbuttonclick = "[] call life_fnc_gangDeposit";
           text = "$STR_ATM_DepositGang";
           x = 0.345767 * safezoneW + safezoneX;
           y = 0.434019 * safezoneH + safezoneY;
           w = 0.0696538 * safezoneW;
           h = 0.0220082 * safezoneH;
           colortext[] = {1,1,1,1};
           colorbackground[] = {0.259,0.259,0.259,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class CloseButtonKey : Life_RscButtonMenu
       {
            onbuttonclick = "closeDialog 0";
            text = "X";
            idc = 1011;
            x = 0.6444 * safezoneW + safezoneX;
            y = 0.347924 * safezoneH + safezoneY;
            w = 0.0134448 * safezoneW;
            h = 0.018999 * safezoneH;
            colortext[] = {1,1,1,1};
            colorbackground[] = {0.11,0.11,0.11,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
       };
       class Creator_Title : Life_RscText
       {
           idc = -1;
           x = 0.340791 * safezoneW + safezoneX;
           y = 0.587975 * safezoneH + safezoneY;
           w = 0.318417 * safezoneW;
           h = 0.0219937 * safezoneH;
           colorbackground[] = {0.11,0.11,0.11,1};
       };

        class Life_DepositaTutto: Life_RscButtonMenu
        {
            onbuttonclick = "[] call life_fnc_bankDepositAll";
            idc = -1;

            text = "Deposit All"; //--- ToDo: Localize;
            x = 0.582515 * safezoneW + safezoneX;
            y = 0.533012 * safezoneH + safezoneY;
            w = 0.0696538 * safezoneW;
            h = 0.0220083 * safezoneH;
            colorBackground[] = {0.259,0.259,0.259,1};
            class Attributes {
                align = "center";
                font = "PuristaMedium";
            };
        };
    };
};
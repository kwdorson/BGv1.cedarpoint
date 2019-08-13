/*
    Author: Maxence Lyon
    Altis DEV: https://altisdev.com/user/maxence-lyon
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Steam: « Une Vache Sur CS – Maxence », please leave a message on my profile who says the exact reason before adding me.

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
class historique_menu_entreprise {
    idd = 6580;
    name= "historique_menu_entreprise";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class MainBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.30 * safezoneH;
        };

        class Life_RscTitleBackground: Life_RscText {
            idc = 6581;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class close_button: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.615 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class list: Life_RscListBox {
            idc = 6582;
            text = "";
            sizeEx = 0.035;
            x = 0.319687 * safezoneW + safezoneX;
            y = 0.325 * safezoneH + safezoneY;
            w = 0.36 * safezoneW;
            h = 0.275 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
};

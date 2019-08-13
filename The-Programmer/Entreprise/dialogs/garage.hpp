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
class entreprise_impound_menu {
    idd = 1800;
    name= "entreprise_impound_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText    {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };

        class Title: Life_RscTitle {
            idc = 1801;
            text = "$STR_GUI_Garage";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class VehicleTitleBox: Life_RscText {
            idc = -1;
            text = "$STR_GUI_YourVeh";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11;
            y = 0.26;
            w = 0.3;
            h = (1 / 25);
        };

        class VehicleInfoHeader: Life_RscText {
            idc = 1830;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.42;
            y = 0.26;
            w = 0.46;
            h = (1 / 25);
        };

        class CloseBtn: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class RetrieveCar: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Retrieve";
            onButtonClick = "[] call max_entreprise_fnc_unimpoundEntreprise;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };

    class controls {
        class VehicleList: Life_RscListBox {
            idc = 1802;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call max_entreprise_fnc_garageLBChangeEntreprise;";
            x = 0.11;
            y = 0.302;
            w = 0.303;
            h = 0.49;
        };

        class vehicleInfomationList: Life_RscStructuredText {
            idc = 1803;
            text = "";
            sizeEx = 0.035;
            x = 0.41;
            y = 0.3;
            w = 0.5;
            h = 0.5;
        };

        class MainBackgroundHider: Life_RscText {
            colorBackground[] = {0,0,0,1};
            idc = 1810;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };

        class MainHideText: Life_RscText {
            idc = 1811;
            text = "$STR_ANOTF_QueryGarage";
            sizeEx = 0.06;
            x = 0.24;
            y = 0.5;
            w = 0.6;
            h = (1 / 15);
        };
    };
};
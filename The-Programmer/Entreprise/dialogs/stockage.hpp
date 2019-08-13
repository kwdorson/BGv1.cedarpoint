class entreprise_stockage {
    idd = 9640;
    name = "entreprise_stockage";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        class RscBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.7;
            h = 0.7 - (22 / 250);
        };

        class RscTitleText: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 9643;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.7;
            h = (1 / 25);
        };

        class VehicleWeight : RscTitleText {
            idc = 9644;
            style = 1;
            text = "";
        };

        class RscEntrepriseText: Life_RscText {
            idc = 9641;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.04;
            x = 0.11;
            y = 0.25;
            w = 0.3;
            h = 0.04;
        };

        class RscPlayerText: Life_RscText {
            idc = 9642;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            text = "";
            sizeEx = 0.04;
            x = 0.49;
            y = 0.25;
            w = 0.3;
            h = 0.04;
        };
    };

    class Controls {
        class EntrepriseGear: Life_RscListBox {
            idc = 9645;
            text = "";
            sizeEx = 0.030;
            x = 0.11;
            y = 0.29;
            w = 0.3;
            h = 0.42;
        };

        class PlayerGear: Life_RscListBox {
            idc = 9646;
            text = "";
            sizeEx = 0.030;
            x = 0.49;
            y = 0.29;
            w = 0.3;
            h = 0.42;
        };

        class EntrepriseEdit: Life_RscEdit {
            idc = 9648;
            text = "1";
            sizeEx = 0.030;
            x = 0.11;
            y = 0.72;
            w = 0.3;
            h = 0.03;
        };

        class PlayerEdit: Life_RscEdit {
            idc = 9649;
            text = "1";
            sizeEx = 0.030;
            x = 0.49;
            y = 0.72;
            w = 0.3;
            h = 0.03;
        };

        class TakeItem: Life_RscButtonMenu {
            idc = 9647;
            text = "$STR_Trunk_Take";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call max_entreprise_fnc_stockageRetrieve;";
            x = 0.19;
            y = 0.78;
            w = (6.25 / 40);
            h = (1 / 25);
            class Attributes {align = "center";};
        };

        class StoreItem: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Trunk_Store";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn max_entreprise_fnc_stockageSell;";
            x = 0.57;
            y = 0.78;
            w = (6.25 / 40);
            h = (1 / 25);
            class Attributes {align = "center";};
        };

        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.1;
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
            class Attributes {align = "center";};
        };
    };
};
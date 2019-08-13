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
#define true 1
#define false 0

class Max_Settings_Entreprise {
    default_lang = "en"; // fr / en / de / es

    allow_acces_to_create_company_forearch_player = false;
    allowed_licenses[] = { "license_civ_enetrepreneur" }; //Only if allow_acces_to_create_company_forearch_player = false // OPTIONAL OPTION
    allowed_playerid[] = { "GUI0","GUI1","GUI2","GUI3","GUI4" }; //Only if allow_acces_to_create_company_forearch_player = false // OPTIONAL OPTION

    price_upgrade_100_storage = 250000;
    price_upgrade_1000_storage = 2000000;

    open_color = "ColorGreen"; // check : https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
    close_color = "ColorBlack";
    open_or_close_for_new_employes = true;

    class positions_entreprises {
        class entreprise1 {
            markerVar = "entreprise_1";
            radius = 30;
            price = 350000;
        };
        class entreprise2 {
            markerVar = "entreprise_2";
            radius = 30;
            price = 350000;
        };
        class entreprise3 {
            markerVar = "entreprise_3";
            radius = 30;
            price = 350000;
        };
        class entreprise4 {
            markerVar = "entreprise_4";
            radius = 30;
            price = 350000;
        };
        class entreprise5 {
            markerVar = "entreprise_5";
            radius = 30;
            price = 350000;
        };
        class entreprise6 {
            markerVar = "entreprise_6";
            radius = 30;
            price = 350000;
        };
        class entreprise7 {
            markerVar = "entreprise_7";
            radius = 30;
            price = 350000;
        };
        class entreprise8 {
            markerVar = "entreprise_8";
            radius = 30;
            price = 350000;
        };
        class entreprise9 {
            markerVar = "entreprise_9";
            radius = 30;
            price = 350000;
        };
        class entreprise10 {
            markerVar = "entreprise_10";
            radius = 30;
            price = 350000;
        };
        class entreprise11 {
            markerVar = "entreprise_11";
            radius = 30;
            price = 350000;
        };
        class entreprise12 {
            markerVar = "entreprise_12";
            radius = 30;
            price = 350000;
        };
        class entreprise13 {
            markerVar = "entreprise_13";
            radius = 30;
            price = 350000;
        };
    };

    class types_entreprises {
        class autoentreprise {
            displayName = "Gangster";
            max_stock_commum = 2000;
            max_stock_private = 500;
            max_players = 12;
            price = 250000;
        };
        class sa {
            displayName = "Vigilante";
            max_stock_commum = 2000;
            max_stock_private = 500;
            max_players = 12;
            price = 250000;
        };
        class sas {
            displayName = "Custom";
            max_stock_commum = 2000;
            max_stock_private = 500;
            max_players = 12;
            price = 250000;
        };
    };
};

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
#define false 0
#define true 1

class Max_Settings_Gouvernement {
    default_lang = "en"; // fr / en / de / es

    min_coplevel_for_use_cop_account = 5;
    min_mediclevel_for_use_cop_account = 4;

    phone_numbers_script = true; // true/false
    companies_script_enable = true; // true/false

    maximum_companies_taxes = 35; // %
    maximum_sales_taxes = 25; // %
    maximum_salary_taxes = 15; // %

    maximum_ministres = 4;
    maximum_security = 4;
};

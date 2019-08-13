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

class Max_Settings_Interpol {
    default_lang = "en"; // fr / en / de

    eye_colors[] = {"Brown","Blue","Blue-Grey","Grey","Red","Green","Black","Yellow","Violet","Turquoise"};
    min_cop_level_remove_crime = 3;
    phone_numbers_script = true;

    crimes[] = { // WARNING : DO NOT USE ' IT CANNOT BE SAVED IN YOUR DATABASE !!
        //{"DISPLAYED TEXT","PRICE"},
        {"Manslaughter",20000},
        {"Vehicular Manslaugher",20000},
		{"Attempted Murder",35000},
		{"Murder",40000},
		{"Armed Robbery",15000},
		{"Bank Robbery",18000},
		{"Kidnap/Hostage Taking",7500},
		{"Terrorism",850000},
		{"Posession of Explosives",10000},
		{"Robery of an Officer",2500},
		{"Prison Break",10000},
		{"Assistaing Jail Break",8500},
		{"Grand Theft Auto",5000},
		{"Class 1 Firearms without a License",8000},
		{"Class 2 Firearms without a License",8000},
		{"Illegal U-Turn",100},
		{"Reckless driving",750},
		{"Driving Without a License",3000},
		{"Negligant Driving",500},
		{"Speeding",1000},
		{"Excessive Speeding",2000},
		{"Unroadworthy Vehicle",5000},
		{"Driving under the Influence",1500},
		{"Conspiracy to commit Murder",20000},
		{"Conspiracy to commit Major Crime",25000},
		{"Conspiracy to Kidnap",5000},
		{"Conspiracy to Supply",7500},
		{"Tresspassing",1500},
		{"Destruction of Government Property",3500},
		{"Refusal of Ticket",500},
		{"Illegal Landing of Aircraft",2000},
		{"Violation of a No-Fly Zone",2000},
		{"Operating without a License",7500},
		{"Operating without Clearance",5000},
		{"Transportation of Illegal Cargo",1000},
		{"Public Intoxication",500},
		{"Drug Possession",1000},
		{"Tax Invasion",25000},
		{"Hit Run",7500},
		{"Burglary",7500},
		{"Anti Social Behavior",3000},
		{"Weapons Smuggling",12500}
    };
};

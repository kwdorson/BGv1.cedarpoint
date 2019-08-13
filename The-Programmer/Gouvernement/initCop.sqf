/*
_null=this execVM "The-Programmer\Gouvernement\initCop.sqf";
*/
_this allowDamage false; 
_this enableSimulation false;
_this addAction [(["STR_ACCOUNT_MANAGEMENT"] call max_gouvernement_fnc_localize),{[1] spawn max_gouvernement_fnc_accountManagementMenu;},"",0,false,false,"",'((call life_coplevel) >= (getNumber (missionConfigFile >> "Max_Settings_Gouvernement" >> "min_coplevel_for_use_cop_account")))'];
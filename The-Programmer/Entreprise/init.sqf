/*
_null=this execVM "The-Programmer\Entreprise\init.sqf";
*/
_this allowDamage false; 
_this enableSimulation false;
_this addAction[(["STR_ACTION_CREATE_ENTREPRISE"] call max_entreprise_fnc_localize),max_entreprise_fnc_createEntrepriseMenu];
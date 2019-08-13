/*
_null=this execVM "The-Programmer\Gouvernement\init.sqf";
*/
_this allowDamage false; 
_this enableSimulation false;
_this addAction [(["STR_ELECTION_GOUVERNEMENT"] call max_gouvernement_fnc_localize),{[] spawn max_gouvernement_fnc_electionMenu;}];
_this addAction [(["STR_DECLARE_REVENUS"] call max_gouvernement_fnc_localize),{[] spawn max_gouvernement_fnc_declareRevenuMenu;}];
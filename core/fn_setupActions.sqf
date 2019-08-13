/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
life_actions = [];
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);
        //Rob person
        life_actions pushBack (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
        // Suicide Bomb
	    life_actions pushBack (player addAction["<t color='#FF0000'>Activate Suicide Vest</t>",life_fnc_suicideBomb,"",0,false,false,"",' vest player == "TRYK_V_harnes_blk_L" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']);
        //Gang
        life_actions pushBack (player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']);
        //job
        life_actions pushBack (player addAction ["Repair Near Objects",ADTC_fnc_Repair,"",0,false,false,"",'(player getVariable ["Job",""] == "Repair") &&(isnull objectParent player) ']);        
        //ziptie
        life_actions pushBack (player addAction["Tie up player",life_fnc_tieingAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && (cursorObject getVariable ["playerSurrender",false]) || animationState cursorObject == "Incapacitated"']);

		//ID
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Show Identity Card</t>",{[player] remoteExec ["life_fnc_persozeigen",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID</t>",{[player,0] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false])']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID card</t>",{[player,1] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false]) && (side cursorObject in [east,west,independent])']];	

        //HouseProcess
        life_actions pushBack (player addAction["<t color='#FF0000'>Start Processing</t>",life_fnc_processHouse,"",0,false,false,"",' ((typeOf cursorTarget) == "Land_Portable_generator_F") ']);
    };  
    case west: {
		life_actions pushBack (player addAction ["Remove Police Barrier",life_fnc_removePlaceable,"",0,false,false,"",'!isNull cursorTarget && (playerSide == west) && (cursorTarget getVariable ["placeable",false]) && !(animationState cursorTarget == "Incapacitated") && !(player getVariable["restrained",false])']);
		life_actions pushBack (player addAction["Seize Items In Area",{[] call life_fnc_seizeWeapon},cursorTarget,0,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']);
		
		//ID Card
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Show badge</t>",{[player, switch (playerSide) do {case west:{call life_coplevel}; case independent:{call life_medicLevel}; case east:{call life_adaclevel};},([] call life_fnc_DienstausweisLizenzen)] remoteExec ["life_fnc_DienstausweisZeigen",cursorObject];},"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Show Identity Card</t>",{[player] remoteExec ["life_fnc_persozeigen",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID</t>",{[player,0] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false])']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID card</t>",{[player,1] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false]) && (side cursorObject in [east,west,independent])']];	
	
	};
    case independent: { 
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Show badge</t>",{[player, switch (playerSide) do {case west:{call life_coplevel}; case independent:{call life_medicLevel}; case east:{call life_adaclevel};},([] call life_fnc_DienstausweisLizenzen)] remoteExec ["life_fnc_DienstausweisZeigen",cursorObject];},"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Show Identity Card</t>",{[player] remoteExec ["life_fnc_persozeigen",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID</t>",{[player,0] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false])']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>View ID card</t>",{[player,1] remoteExecCall ["life_fnc_PersoZeigenAnfordern",cursorObject];},"",1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 3  && cursorTarget isKindOf "Man" && isPlayer cursorObject && (cursorObject getVariable ["restrained",false]) && (side cursorObject in [east,west,independent])']];
	};
};

life_actions pushBack (player addAction["<t color = '#D660D6'>Put on Seatbelt</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
life_actions pushBack (player addAction["<t color = '#D660D6'>Remove Seatbelt</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);

[] spawn {
	waitUntil {!isNil "life_adminlevel"};
	if ((call life_adminlevel) > 0) then {life_actions = life_actions + [player addAction["<t color='#FF0000'>Show server team badge</t>",{hint format["You showt %3 (%1, %2) your server team badge.",getPlayerUID cursorObject, side cursorObject, name cursorObject]; [getPlayerUID player,profileName] remoteExec ["life_fnc_ServerteamZeigen",cursorObject];},"",0,false,false,"",'(call life_adminlevel) > 0 && (isPlayer cursorObject) && (alive cursorObject) && cursorObject isKindOf "Man"']];};
};

life_actions = life_actions + [player addAction["Hide badges",{("rsc_Serverteamausweis" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; ("dienstausweis" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; ("perso" call BIS_fnc_rscLayer) cutText ["","PLAIN"];},"",1,false,true,"",'(!(isNull (uiNameSpace getVariable ["ui_Personalausweis",displayNull])) || !(isNull (uiNameSpace getVariable ["ui_Dienstausweis",displayNull])) || !(isNull (uiNameSpace getVariable ["ui_Serverteamausweis",displayNull]))) && alive player']];

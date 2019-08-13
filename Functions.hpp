class Socket_Reciever {
    tag = "SOCK";
    class SQL_Socket {
        file = "core\session";
        class dataQuery {};
        class insertPlayerInfo {};
        class requestReceived {};
        class syncData {};
        class updatePartial {};
        class updateRequest {};
        class forceRagdoll {};
    };
};

class ADT {
    tag = "ADTC";
    class Jobs
    {
        file = "core\Jobs";
        class confirmStaticJob{};
        class DropTruck{};
        class JobcentreOnload{};
        class joinJob{};
        class JobThread{};
        class openKnobCentre{};
        class SpawnTruck{};    
    };

    class JobRepair
    {
        file = "core\jobs\Repair";
        class repair{};
    };
	
    class JobImpound
    {
        file = "core\jobs\Impound";
        class jobimpound {};
    };
    
    class JobConvoy
    { 
        file = "core\jobs\fuelConvoy";
        class fuelConvoy {};
        class fuelConvoyCheck {};
        class fuelConvoyFill {};
        class fuelConvoyFinish {};
    };
};

class Life_Client_Core {
    tag = "life";

    class Master_Directory {
        file = "core";
        class initCiv {};
        class initCop {};
        class initMedic {};
        class setupActions {};
        class setupEVH {};
        class survival {};
        class checker {};
    };

    //CUSTOM BELOW
	
	class Carter_System
	{
		file = "felixvonstudsinske\System";
		class ArrayIndexErhalten {};
		class ENS {};
		class ENS_Hint {};
	};	
	class Personalausweis
	{
		file = "felixvonstudsinske\Personalausweis";
		class DienstausweisLizenzen {};
		class PersoErstellen {};
		class PersoErstellenOK {};
		class PersoZeigenAnfordern {};
		class PersoErstellenFortfahren {};
		class PersoPruefenSchaltjahr {};
		class PersoWohnortAuswahl {};
		class PersoStrasseAuswahl {};
		class PersoErstellenBildwahl {};
		class PersoGeschlechtswahl {};
		class PersoAbfrageRueckgabe {};
		class PersoAusgewaehlt {};
		class PersoAusweisnummer {};
		class PersoSucheTag {};
		class PersoKonvertiereSpielername {};
		class PersoZeigen {};
		class Dienstausweisnummer {};
		class DienstausweisRangrueckgabe {};
		class PersoLBWahl {};
		class PersoNameAendern {};
		class PersoLoeschen {};
		class PersoErstelleMobilfunknummer {};
		class PersoGeneriereAdminausweis {};
		class DienstausweisZeigen {};
		class SpielerBekanntHandle {};
		class ServerteamZeigen {};
	};
	
	class Crafting
	{
		file ="core\craft";
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class craftAction {};
		class craftCfg {};
	};

    class vAH
	{
		file = "core\vAH";
		class vAH_load;
		class vAH_buy;
		class vAH_reciever;
		class vAH_loadInventory;
		class vAH_sell;
		class vAH_checkItem;
		class vAH_takeBack;
		class vAH_select;
	};

    class CopMission {
        file = "core\cop\Missions";
        class missionStart {};
        class missionFinish {};
    };

    class CivMission {
        file = "core\civilian\Missions";
        class civMissionStart {};
        class civMissionFinish {};
    };

    class Quests {
        file = "core\quests\Relics";
        class relic1 {};
        class relic2 {};
        class relic3 {};
        class relic4 {};
        class relicReward {};
        class relicRewardTransport {};
        class relicRewardFed {};
    };
    
    class autosave 
    {
        file = "core\Scripts\autosave";
        class autoSaveInv {};
    };

    class jailBreak {
      file = "core\jailBreak";
			class prisonWallTimer {};
            class prisonFix {};
            class wallCharge {};
    };
    
    class drugs
	{
		file = "core\Scripts\drugs";
		class Cocaine {};
		class Heroin {};
		class drinkbeer {};
		class drinkwhiskey {};
		class drinkmoonshine {};
		class weed {};
		class addicted {};
	};

    class CopPlaceables {
      file = "core\cop\placeables";
        class placeablesInit {};
        class placeablesMenu {};
        class placeablesRemoveAll {};
        class placeablePlace {};
        class placeableCancel {};
        class placeablesPlaceComplete {};
    };

    class Loadouts {
  	    file = "core\Scripts\Loadouts";
  		class deleteLoadout {};
  		class loadLoadout {};
  		class loadoutMenu {};
  		class saveLoadout {};
  	};

    class Market {
		file = "core\market";
		class openMarketView {};
		class refreshMarketView {};
		class marketBuy {};
		class marketSell {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketconfiguration {};
		class marketReset {};
		class marketChange {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
	};

    //CUSTOM END

    class Actions {
        file = "core\actions";
        class arrestAction {};
        class buyLicense {};
        class captureHideout {};
        class catchFish {};
        class dpFinish {};
        class dropFishingNet {};
        class escortAction {};
        class gather {};
        class getDPMission {};
        class gutAnimal {};
        class healHospital {};
        class impoundAction {};
        class mine {};
        class newsBroadcast {};
        class packupSpikes {};
        class pickupItem {};
        class pickupItem1 {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class pulloutAction {};
        class putInCar {};
        class removeContainer {};
        class repairTruck {};
        class restrainAction {};
        class robAction {};
        class searchAction {};
        class searchVehAction {};
        class seizePlayerAction {};
        class serviceChopper {};
        class stopEscorting {};
        class storeVehicle {};
        class surrender {};
        class ticketAction {};
        class unrestrain {};
        class injectAction {};
        class crushAction {};
        class removePlaceable {};
        class suicideBomb {};
        class airhorn {};
        class volleyball {};
        class prize {};
        class protest {};
        class tent {};
        class gpstracker {};
        class head {};
        class flashLight {};
        class policeSpeaker {};
        class robShops {};
        class fuelDartPlayer {};
        class getInSZ {};
        class robBank {};
        class robShip {};
        class robFed {};
        class reviveCooldown {};
        class planeTreasure {};
        class hideBody {};
        class pushVehicle {};
        class processHouse {};
		class robCasino {};
    };

    class Civilian {
        file = "core\civilian";
        class civLoadout {};
        class civMarkers {};
        class demoChargeTimer {};
        class freezePlayer {};
        class jail {};
        class jailMe {};
        class knockedOut {};
        class knockoutAction {};
        class removeLicenses {};
        class robPerson {};
        class robReceive {};
        class tazed {};
        class ragdoll {};
        class demoChargeTimerBank {};
        class civInteractionMenu {};
    };

    class variables {
        file = "core\config";
        class houseConfig {};
        class itemWeight {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
    };

    class CivTieing {
		file = "core\civilian\CivTieing";
		class gagAction {};					
		class gagged {};
		class removeGagAction {};
		class tieing {};
		class tieingAction {};
		class tieingActionb {};
		class tieingb {};
		class untie {};
		class untieb {};
	};

    class Cop {
        file = "core\cop";
        class bountyReceive {};
        class containerInvSearch {};
        class copInteractionMenu {};
        class copLights {};
        class copLoadout {};
        class copMarkers {};
        class copSearch {};
        class copSiren {};
        class doorAnimate {};
        class fedCamDisplay {};
        class licenseCheck {};
        class licensesRead {};
        class questionDealer {};
        class radar {};
        class repairDoor {};
        class restrain {};
        class searchClient {};
        class seizeClient {};
        class sirenLights {};
        class spikeStripEffect {};
        class ticketGive {};
        class ticketPaid {};
        class ticketPay {};
        class ticketPrompt {};
        class vehInvSearch {};
        class wantedGrab {};
        class removeWeaponAction {};
        class seizeWeapon {};
        class megaphone {};
        class fuelDart {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
        class callBackup {};
        class backupCall {};
		class comRemoval {};
		class comRemovalWait {};
        class openThreatMenu {};
        class changeThreat {};
    };

    class Dialog_Controls {
        file = "dialog\function";
        class bankDeposit {};
        class bankDepositAll {};
        class bankTransfer {};
        class bankWithdraw {};
        class displayHandler {};
        class gangDeposit {};
        class gangWithdraw {};
        class garageLBChange {};
        class impoundMenu {};
        class progressBar {};
        class safeFix {};
        class safeInventory {};
        class safeOpen {};
        class safeTake {};
        class sellGarage {};
        class setMapPosition {};
        class spawnConfirm {};
        class spawnMenu {};
        class spawnPointCfg {};
        class spawnPointSelected {};
        class unimpound {};
        class vehicleGarage {};
        class wireTransfer {};
        class safeInventoryBank {};  
        class safeOpenBank {};  
        class safeTakeBank {};
        class insureCar {};
    };

    class Functions {
        file = "core\functions";
        class AAN {};
        class accType {};
        class actionKeyHandler {};
        class animSync {};
        class calWeightDiff {};
        class clearVehicleAmmo {};
        class dropItems {};
        class removeItems {};
        class escInterupt {};
        class fetchCfgDetails {};
        class fetchDeadGear {};
        class fetchVehInfo {};
        class isDamaged {};
        class giveDiff {};
        class handleDamage {};
        class handleInv {};
        class handleItem {};
        class hideObj {};
        class unHideObj {};
        class hudSetup {};
        class hudUpdate {};
        class inventoryClosed {};
        class inventoryOpened {};
        class isUIDActive {};
        class keyHandler {};
        class loadDeadGear {};
        class loadGear {};
        class nearATM {};
        class nearestDoor {};
        class nearUnits {};
        class numberText {};
        class onFired {};
        class onTakeItem {};
        class playerSkins {};
        class playerTags {};
        class postNewsBroadcast {};
        class pullOutVeh {};
        class pushObject {};
        class receiveItem {};
        class receiveMoney {};
        class revealObjects {};
        class saveGear {};
        class searchPosEmpty {};
        class simDisable {};
        class stripDownPlayer {};
        class tazeSound {};
        class teleport {};
        class whereAmI {};
        class speaking {}; 
        class randomRound {};
        class AAN_Bank {};
        class AAN_Bank2 {};
        class AAN_Bank3 {};
        class AAN_Jail {};
        class medico {}; 
        class numberCommas {};
        class playSound {};
        class playSounds {};
        class pickupItems {};
        class notificationSystem {};
        class jaws {};
        class loadJawsOfLife {};
		class jawsOfLife {};
		class jawsoflifeConfirm {};
        class forceHolster {};
        class radArea {};
        class escMenu {};
        class phoneRequestMarker {};
        class globalsound;
		class globalSoundClient;
		class seatBelt {};
    };

    class Gangs {
        file = "core\gangs";
        class createGang {};
        class gangCreated {};
        class gangDisband {};
        class gangDisbanded {};
        class gangInvite {};
        class gangInvitePlayer {};
        class gangKick {};
        class gangLeave {};
        class gangMenu {};
        class gangNewLeader {};
        class gangUpgrade {};
        class initGang {};
        class areaCapture {};
    };

    class Housing {
        file = "core\housing";
        class buyHouse {};
        class buyHouseGarage {};
        class containerMenu {};
        class copBreakDoor {};
        class copHouseOwner {};
        class garageRefund {};
        class getBuildingPositions {};
        class houseMenu {};
        class initHouses {};
        class lightHouse {};
        class lightHouseAction {};
        class lockHouse {};
        class lockupHouse {};
        class placeContainer {};
        class PlayerInBuilding {};
        class raidHouse {};
        class sellHouse {};
        class sellHouseGarage {};
        class buildFurniture {};
    };

    class Items {
        file = "core\items";
        class blastingCharge {};
        class boltcutter {};
        class defuseKit {};
        class flashbang {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class placestorage {};
        class spikeStrip {};
        class storageBox {};
        class cprKit {};
        class codeCracker {};
        class bandages {};
        class morphine {};
        class speedBomb {};
    };

    class Medical_System {
        file = "core\medical";
        class deathScreen {};
        class medicLights {};
        class medicLoadout {};
        class medicMarkers {};
        class medicRequest {};
        class medicSiren {};
        class medicSirenLights {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class requestMedic {};
        class respawned {};
        class revived {};
        class revivePlayer {};
        class cprrevived {};
        class newLifeRule {};
        class deadBloodEffect {};
        class medInteractionMenu {};
        class killfeed {};
		class antiCombatRevive {};
    };

    class Network {
        file = "core\functions\network";
        class broadcast {};
        class corpse {};
        class jumpFnc {};
        class say3D {};
        class setFuel {};
        class soundDevice {};
    };

    class Player_Menu {
        file = "core\pmenu";
        class cellphone {};
        class giveItem {};
        class giveMoney {};
        class keyDrop {};
        class keyGive {};
        class keyMenu {};
        class p_openMenu {};
        class p_updateMenu {};
        class pardon {};
        class removeItem {};
        class s_onChar {};
        class s_onCheckedChange {};
        class s_onSliderChange {};
        class settingsMenu {};
        class updateViewDistance {};
        class useItem {};
        class wantedAddP {};
        class wantedInfo {};
        class wantedList {};
        class wantedMenu {};
        class inventory {};
        class licenses {};
        class smartphone {};
        class smartphone2 {};
        class newMsg {};
        class showMsg {};
		class money {};
    };

    class Shops {
        file = "core\shops";
        class atmMenu {};
        class buyClothes {};
        class changeClothes {};
        class chopShopMenu {};
        class chopShopSelection {};
        class chopShopSell {};
        class clothingFilter {};
        class clothingMenu {};
        class fuelLBchange {};
        class fuelStatOpen {};
        class levelCheck {};
        class vehicleShop3DPreview {};
        class vehicleShopBuy {};
        class vehicleShopEnd3DPreview {};
        class vehicleShopInit3DPreview {};
        class vehicleShopLBChange {};
        class vehicleShopMenu {};
        class virt_buy {};
        class virt_menu {};
        class virt_sell {};
        class virt_update {};
        class weaponShopAccs {};
        class weaponShopBuySell {};
        class weaponShopFilter {};
        class weaponShopMags {};
        class weaponShopMenu {};
        class weaponShopSelection {};
    };

    class Vehicle {
        file = "core\vehicle";
        class addVehicle2Chain {};
        class colorVehicle {};
        class deviceMine {};
        class FuelRefuelcar {};
        class fuelStore {};
        class fuelSupply {};
        class lockVehicle {};
        class openInventory {};
        class vehiclecolor3DRefresh {};
        class vehicleOwners {};
        class vehicleWeight {};
        class vehInventory {};
        class vehStoreItem {};
        class vehTakeItem {};
        class vInteractionMenuCop {};
        class vInteractionMenuCiv {};
        class vInteractionMenuMed {};
        class vInteractionMenu {};
    };
};

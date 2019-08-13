class VehiclePurchased {
    expToAdd = round(5 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Vehicle Purchased";
};

class ItemProcessed {
    expToAdd = round(10 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Items Processed";
};

class ItemGathered {
    expToAdd = round(5 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Items Gathered";
};

class VehicleLockpicked {
    expToAdd = round(5 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Vehicle Lockpicked";
};

class PassiveXP {
    expToAdd = round(20 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Thank you for playing!";
};

class AnimalGutted {
    expToAdd = round(15 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Animal Gutted";
};

class EventReward {
    expToAdd = round(100 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Event Reward!";
};

class ShopRobbed {
    expToAdd = round(50 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Gas Station Robbed!";
};

class VehicleRepaired {
    expToAdd = round(5 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Vehicle Repaired";
};

class TicketPlayer {
    expToAdd = round(10 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Player Ticketed";
};

class ArrestedCriminal {
    expToAdd = round(25 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Arrested a criminal";
};

class Impounded {
    expToAdd = round(10 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Keeping the streets clean!";
};

class RevivedPlayer {
    expToAdd = round(25 * (missionNamespace getVariable ["mav_ttm_var_experienceMultiplier", 1]));
	message = "Player revived";
};

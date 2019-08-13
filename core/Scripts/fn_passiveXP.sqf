[] spawn {

    while {true} do {
        sleep 600; //10 minutes timer
        ["PassiveXP"] spawn mav_ttm_fnc_addExp;
    };

};

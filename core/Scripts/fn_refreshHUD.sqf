[] spawn {

    while {true} do {
        [] call life_fnc_hudUpdate;
        sleep 10; //10 seconds timer
    };
};

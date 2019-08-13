/*
    Author: Jean_Park
    Teamspeak 3: ts.the-programmer.com
    Web site: www.the-programmer.com
    Discord : https://discord.gg/DhFUFsq

    Terms of use:
        - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
        - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
        - Out of respect for the author please do not delete this information.

    License number:
    Server's name:
    Owner's name:
*/
(findDisplay 46) createDisplay "The_Programmer_Iphone_Camera_Menu";
disableSerialization;

the_programmer_camera_selfie_object = "camera" camCreate (position player);
the_programmer_camera_selfie_object attachTo [player,[0,0.003,0.018],"lefthandmiddle1"];
the_programmer_camera_selfie_object camCommit 1;
the_programmer_camera_selfie_object cameraEffect ["internal","back","rtt"];
the_programmer_camera_selfie_object setDir 176;
"rtt" setPiPEffect [0];

_display = findDisplay 25600;
_display displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {[1] spawn the_programmer_iphone_fnc_phone_init;}"];
uiSleep 1;

_ecran = _display displayCtrl 25601;
_ecran ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";

_phone = "The_Programmer_Iphone_Model" createVehicle (position player);
_phone attachTo [player,[.03,0.0,0.04],"lefthandmiddle1"];
_phone setVectorDirAndUp [[0,0.66,-0.33],[0,0.33,0.66]];

player playAction "The_Programmer_selfie";

waituntil {uisleep 1; (isNull (findDisplay 25600));};
player playAction "gesturenod";
the_programmer_camera_selfie_object cameraEffect ["terminate","back"];
detach the_programmer_camera_selfie_object;
camDestroy the_programmer_camera_selfie_object;
deleteVehicle _phone;

scriptName "fn_finishCinematicCam";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_finishCinematicCam.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_finishCinematicCam.sqf"

if (!hasInterface) exitWith {};

9500 cutRsc ['Default','PLAIN'];
9501 cutRsc ['maverick_dialog_introcam_blackout','PLAIN'];

if (getNumber(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Info" >> "music") == 1) then {
	5 fadeMusic 0;
};

sleep 5;
mav_introcam_continue = true;
mav_introcam_object cameraEffect ["TERMINATE","BACK"];
camDestroy mav_introcam_object;
player switchCamera "INTERNAL";
5 fadeMusic 1;
5 fadeSound 1;
playMusic "";
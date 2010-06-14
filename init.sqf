// TODO
//
// Gestion bug tête et video
// Gestion des demandes de tir artillerie
//
//
//


execVM "R3F_revive\revive_init.sqf";
#include "R3F_ARTY_AND_LOG\init.sqf"
// For the demo mission explanation
//execVM "briefing.sqf";

// initialize functions
nul=[] execVM "z_fnc\z_functions.sqf";
//

if (isServer) then
{
	//Init UPSMON scritp
	call compile preprocessFileLineNumbers "extern\Init_UPSMON.sqf";	
};

centerW = createCenter west;
centerE = createCenter east;
centerG = createCenter resistance;
centerC = createCenter civilian;

setViewDistance 6000;
onMapSingleClick "player setpos _pos";

// populate
nul=[] execVM "z_scripts\mk030025.sqf";
nul=[] execVM "z_scripts\mk030025b.sqf";
nul=[] execVM "z_scripts\testposgen.sqf";
nul=[] execVM "z_chukar.sqf";

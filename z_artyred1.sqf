//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//  called by 
// 
// TODO :
//  Testing
//  add dispersion
//
//
//
//
//
//
//////////////////////////////////////////////////////////////////

if (!isServer) exitWith {};

//nil=["_battery","_targetpos","_ordnancetype","_rateoffire","_nbrounds","_dispersion","_targetdir"] execVM "z_scripts\z_AIarty_fire.sqf";

_battery = artyred1;
_targetpos = getPosASL gmv;
_ordnancetype = "HE";
_rateoffire = 0;
_nbrounds = 8;
_dispersion = 0;
_targetdir = getdir gmv;
if (isServer) then
{
	_nil=[_battery,_targetpos,_ordnancetype,_rateoffire,_nbrounds,_dispersion] execVM "z_scripts\z_AIarty_fire.sqf";
};

//sleep 5;
_battery = artyred2;
_targetpos =  [_targetpos,_targetdir, 500] call MON_GetPos;
_ordnancetype = "HE";
_rateoffire = 1;
_nbrounds = 20;
_dispersion = 500;
if (isServer) then
{
	_nil=[_battery,_targetpos,_ordnancetype,_rateoffire,_nbrounds,_dispersion] execVM "z_scripts\z_AIarty_fire.sqf";
};

//sleep 5;
_battery = artyred3;
_targetpos =  [_targetpos,_targetdir, 500] call MON_GetPos;
_ordnancetype = "HE";
_rateoffire = 3;
_nbrounds = 20;
_dispersion = 900;
if (isServer) then
{
	_nil=[_battery,_targetpos,_ordnancetype,_rateoffire,_nbrounds,_dispersion] execVM "z_scripts\z_AIarty_fire.sqf";
};

//sleep 5;
_battery = artyred4;
_targetpos =  [_targetpos,_targetdir, 500] call MON_GetPos;
_ordnancetype = "HE";
_rateoffire = 5;
_nbrounds = 30;
_dispersion = 5000;
if (isServer) then
{
	_nil=[_battery,_targetpos,_ordnancetype,_rateoffire,_nbrounds,_dispersion] execVM "z_scripts\z_AIarty_fire.sqf";
};
